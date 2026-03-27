// Copyright 2024 Rockchip Electronics Co., Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>

#include "rk_mpi_ivs.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_sys.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vi.h"
#if defined(ROCKIVA)
#include "rockiva/rockiva_ba_api.h"
#include "rockiva/rockiva_common.h"
#include "rockiva/rockiva_det_api.h"
#include "rockiva/rockiva_face_api.h"
#include "rockiva/rockiva_image.h"
#endif
#include <rk_aiq_user_api2_camgroup.h>
#include <rk_aiq_user_api2_imgproc.h>
#include <rk_aiq_user_api2_sysctl.h>

#include "rk_gpio.h"
#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "rk_pwm.h"
#include "rk_smart_ir_api.h"
#include "rtsp_demo.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"

#define VENC_CHN_MAX 8 // todo
#define FASTBOOT_DEMO_DEBUG_PRINT 0
#define KERNEL_DEBUG_PRINT 1
#define ENABLE_RTSP 1
#define SAVE_ENC_FRM_CNT_MAX 30
#define MMAP_SIZE (4096UL * 50)             // MMAP_SIZE = 4 * 50K
#define MMAP_MASK (MMAP_SIZE - 1)           // MMAP_MASK = 0XFFF
#define MAP_SIZE_NIGHT (4096UL)             // MAP_SIZE = 4K
#define MAP_MASK_NIGHT (MAP_SIZE_NIGHT - 1) // MAP_MASK = 0XFFF

#define VI_MAIN_CHANNEL 0
#define VI_SUB_CHANNEL 1
#define VI_IVA_CHANNEL 2
#define VENC_MAIN_CHANNEL 0
#define VENC_SUB_CHANNEL 1
#define SUB_CHANNEL_WIDTH 640
#define SUB_CHANNEL_HEIGHT 320
#define IVA_CHANNEL_WIDTH 704
#define IVA_CHANNEL_HEIGHT 576
#define FASTBOOT_RESERVED_FRAME_NUM 3

#define ENABLE_SMART_IR

#define fastboot_demo_info(fmt, ...) printf("fastboot_demo " fmt "", ##__VA_ARGS__)
#define fastboot_demo_err(fmt, ...) printf("fastboot_demo error " fmt "", ##__VA_ARGS__)
#if FASTBOOT_DEMO_DEBUG_PRINT
#include <stdio.h>
#define fastboot_demo_dbg(fmt, ...) printf("fastboot_demo " fmt "", ##__VA_ARGS__)
#else
#define fastboot_demo_dbg(fmt, ...)
#endif

// #define RKAIQ_USE_DLOPEN

#ifdef RKAIQ_USE_DLOPEN
void *rkaiq_dl = NULL;
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas)(int, rk_aiq_static_info_t *);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId)(int, rk_aiq_static_info_t *);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_preInit_scene)(const char *, const char *, const char *);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr)(const char *, void *, size_t);
rk_aiq_sys_ctx_t *(*dlsym_rk_aiq_uapi2_sysctl_init)(const char *, const char *, rk_aiq_error_cb,
                                                    rk_aiq_metas_cb);

XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_prepare)(const rk_aiq_sys_ctx_t *, uint32_t, uint32_t,
                                                rk_aiq_working_mode_t);

XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_start)(const rk_aiq_sys_ctx_t *);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_stop)(const rk_aiq_sys_ctx_t *, bool);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_deinit)(const rk_aiq_sys_ctx_t *);
XCamReturn (*dlsym_rk_aiq_uapi2_setFrameRate)(const rk_aiq_sys_ctx_t *, frameRateInfo_t);
#endif

typedef struct rk_smartIr_s {
	int ircut_on_gpio;
	int ircut_off_gpio;
	int irled_enable_gpio;
	int irled_pwm_channel;
	int visled_enable_gpio;
	int visled_pwm_channel;
	pthread_t tid;
	bool tquit;
	bool started;
	const rk_aiq_sys_ctx_t *aiq_ctx;
	rk_smart_ir_ctx_t *ir_ctx;
} rk_smartIr_t;

typedef struct meta_info {
	struct app_param_info app_params;
	struct sensor_init_cfg sensor_init;
} META_INFO;

typedef struct _rkVENCCHN {
	uint32_t u32Width;
	uint32_t u32Height;
	uint32_t u32Gop;
	uint32_t u32BitRate;
	uint32_t u32StreamBufCnt;
	uint32_t enCodecType;
	VENC_CHN chn_id;
	VENC_CHN_ATTR_S stChnAttr;
	PIXEL_FORMAT_E enPixelFormat;
	VENC_RC_PARAM_S stRcParam;
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
	VENC_CHN_BUF_WRAP_S stVencChnBufWrap;
} VENC_CHN_S;

#if defined(ROCKIVA)
typedef struct _rkIVSCHN {
	uint32_t chn_id;
	IVS_CHN_ATTR_S stIvsAttr;
	IVS_MD_ATTR_S stMdAttr;
} IVS_CHN_S;

typedef struct _rkIVACHN {
	RockIvaHandle ivahandle;
	RockIvaInitParam stCommonParams;
	RockIvaDetTaskParams stDetectParams;
	ROCKIVA_DetectResultCallback detectResultCallback;
	ROCKIVA_FrameReleaseCallback releaseCallback;
	pthread_mutex_t stIvaMutex;
	pthread_cond_t stIvaCond;
	bool bIvaTaskDone;
} IVA_CHN_S;
#endif

typedef struct _rkMpiVENCCtx {
	VENC_CHN_S chn[VENC_CHN_MAX];
} VENC_CTX_S;

typedef struct _rkVICHN {
	uint32_t chn_id;
	uint32_t width;
	uint32_t height;
	VI_CHN_ATTR_S stChnAttr;
	VI_CHN_BUF_WRAP_S stViWrap;
	VI_SAVE_FILE_INFO_S stDebugFile;
} VI_CHN_S;

typedef struct _rkVIDEV {
	uint32_t dev_id;
	VI_CHN_S chn[5];
	// RK_BOOL bDevDataOffline; // dev offline mode
	VI_DEV_ATTR_S stDevAttr;
} VI_DEV_S;

typedef struct _rkVIPIPE {
	uint32_t pipe_id;
	uint32_t width;
	uint32_t height;
	VI_PIPE_ATTR_S stPipeAttr;
	VI_DEV_BIND_PIPE_S stBindPipe;
} VI_PIPE_S;

typedef struct _rkMpiVICtx {
	VI_DEV_S dev;
	VI_PIPE_S pipe;
} VI_CTX_S;

typedef struct _rkMpiCtx {
	VI_CTX_S vi;
	VENC_CTX_S venc;
#if defined(ROCKIVA)
	IVS_CHN_S ivs;
	IVA_CHN_S iva;
#endif
} MPI_CTX_S;

typedef struct _rkRtspCtx {
	pthread_mutex_t mutex;
	rtsp_demo_handle handle;
	rtsp_session_handle sessions[VENC_CHN_MAX];
} RTSP_CTX;

static rk_smartIr_t g_smartIr_ctx;
static rk_aiq_sys_ctx_t *g_aiq_ctx = NULL;
static RTSP_CTX *g_rtsp_ctx = NULL;
static VI_CHN_BUF_WRAP_S g_stViWrap = {0};
static bool g_bWrap = true;
static uint32_t g_u32WrapLine = 0;
static bool quit = false;

#ifdef RKAIQ_USE_DLOPEN
static int dlsym_rkaiq(void) {
	rkaiq_dl = dlopen("/usr/lib/librkaiq.so", RTLD_LAZY);
	if (!rkaiq_dl) {
		fastboot_demo_err("\ndlopen /usr/lib/librkaiq.so error\n");
		return -1;
	}
	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas =
	    dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_enumStaticMetas");
	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId =
	    dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId");
	dlsym_rk_aiq_uapi2_sysctl_preInit_scene = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_preInit_scene");
	dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr =
	    dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_preInit_iq_addr");
	dlsym_rk_aiq_uapi2_sysctl_init = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_init");
	dlsym_rk_aiq_uapi2_sysctl_prepare = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_prepare");
	dlsym_rk_aiq_uapi2_sysctl_start = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_start");
	dlsym_rk_aiq_uapi2_sysctl_stop = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_stop");
	dlsym_rk_aiq_uapi2_sysctl_deinit = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_deinit");
	dlsym_rk_aiq_uapi2_setFrameRate = dlsym(rkaiq_dl, "rk_aiq_uapi2_setFrameRate");
	return 0;
}
#else
#define dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas rk_aiq_uapi2_sysctl_enumStaticMetas
#define dlsym_rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId
#define dlsym_rk_aiq_uapi2_sysctl_preInit_scene rk_aiq_uapi2_sysctl_preInit_scene
#define dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr rk_aiq_uapi2_sysctl_preInit_iq_addr
#define dlsym_rk_aiq_uapi2_sysctl_init rk_aiq_uapi2_sysctl_init
#define dlsym_rk_aiq_uapi2_sysctl_prepare rk_aiq_uapi2_sysctl_prepare
#define dlsym_rk_aiq_uapi2_sysctl_start rk_aiq_uapi2_sysctl_start
#define dlsym_rk_aiq_uapi2_sysctl_stop rk_aiq_uapi2_sysctl_stop
#define dlsym_rk_aiq_uapi2_sysctl_deinit rk_aiq_uapi2_sysctl_deinit
#define dlsym_rk_aiq_uapi2_setFrameRate rk_aiq_uapi2_setFrameRate
#endif

static void sigterm_handler(int sig) { quit = true; }
void handle_pipe(int sig) { printf("%s sig = %d\n", __func__, sig); }

/*
 *  * get cmdline from /proc/cmdline
 *  */
static int read_cmdline_to_buf(void *buf, int len) {
	int fd;
	int ret;
	if (buf == NULL || len < 0) {
		fastboot_demo_err("%s: illegal para\n", __func__);
		return -1;
	}
	memset(buf, 0, len);
	fd = open("/proc/cmdline", O_RDONLY);
	if (fd < 0) {
		perror("open:");
		return -1;
	}
	ret = read(fd, buf, len);
	close(fd);
	return ret;
}

long get_cmd_val(const char *string, int len) {
	char *addr;
	long value = 0;
	char key_equal[16];
	static char cmdline[1024];
	static char cmd_init = 0;

	if (cmd_init == 0) {
		cmd_init = 1;
		memset(cmdline, 0, sizeof(cmdline));
		read_cmdline_to_buf(cmdline, sizeof(cmdline));
	}

	snprintf(key_equal, sizeof(key_equal), "%s=", string);
	addr = strstr(cmdline, string);
	if (addr) {
		value = strtol(addr + strlen(string) + 1, NULL, len);
		fastboot_demo_info("get %s value: 0x%0lx\n", string, value);
	}
	return value;
}

static void *mmap_memory_to_viraddr(off_t phy_addr, size_t size) {
	void *vir_addr, *vir_addr_align_4k;
	int mem_fd, vir_addr_offset;

	if ((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
		perror("Open dev/mem Error:");
		return NULL;
	}

	vir_addr_align_4k = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phy_addr);
	vir_addr_offset = phy_addr & MMAP_MASK;
	vir_addr = vir_addr_align_4k + vir_addr_offset;

	close(mem_fd);
	return vir_addr;
}

static void *get_meta_params(struct meta_info *handle) {
	int app_param_offset, meta_size;
	off_t metaAddr;
	void *metaVirmem = NULL, *appVirAddr = NULL, *SensorInitVirAddr;
	struct app_param_info *AppParam = NULL;
	struct sensor_init_cfg *SensorInitParam = NULL;

	meta_size = (int)get_cmd_val("meta_part_size", 16);
	metaAddr = (off_t)get_cmd_val("meta_load_addr", 16);

	metaVirmem = mmap_memory_to_viraddr(metaAddr, (size_t)meta_size);
	if (metaVirmem != MAP_FAILED) {
		SensorInitVirAddr = metaVirmem + SENSOR_INIT_OFFSET;
		handle->sensor_init = *(struct sensor_init_cfg *)(SensorInitVirAddr);

		app_param_offset = (int)get_cmd_val(RK_APP_PARAM_OFFSET, 16);
		appVirAddr = metaVirmem + app_param_offset;
		handle->app_params = *(struct app_param_info *)(appVirAddr);

		return metaVirmem;
	} else {
		fastboot_demo_err("meta addr mmap fail.\n");
		return metaVirmem;
	}
}

__attribute__((unused)) static void meta_params_dump(struct meta_info *handle) {
	fastboot_demo_dbg("meta sensor info dump\n");
	fastboot_demo_dbg("head 0x%08x len 0x%08x crc 0x%08x\n", handle->sensor_init.head,
	                  handle->sensor_init.len, handle->sensor_init.crc32);
	fastboot_demo_dbg("cam_w %d\n", handle->sensor_init.cam_w);
	fastboot_demo_dbg("cam_h %d\n", handle->sensor_init.cam_h);
	fastboot_demo_dbg("als_type %d\n", handle->sensor_init.als_type);
	fastboot_demo_dbg("als_value %d\n", handle->sensor_init.als_value);
	fastboot_demo_dbg("meta app params dump\n");
	fastboot_demo_dbg("head 0x%08x len 0x%08x\n", handle->sensor_init.head,
	                  handle->sensor_init.len);
	fastboot_demo_dbg("cam_mirror_flip %d\n", handle->app_params.cam_mirror_flip);
	fastboot_demo_dbg("cam_fps %d\n", handle->app_params.cam_fps);
	fastboot_demo_dbg("night_mode %d\n", handle->app_params.night_mode);
	fastboot_demo_dbg("color_mode %d\n", handle->app_params.color_mode);
	fastboot_demo_dbg("venc_w %d\n", handle->app_params.venc_w);
	fastboot_demo_dbg("venc_h %d\n", handle->app_params.venc_h);
	fastboot_demo_dbg("fastae_max_frame %d\n", handle->app_params.fastae_max_frame);
}

RK_U64 TEST_COMM_GetNowUs() {
	struct timespec time = {0, 0};
	clock_gettime(CLOCK_MONOTONIC, &time);
	return (RK_U64)time.tv_sec * 1000000 + (RK_U64)time.tv_nsec / 1000; /* microseconds */
}

#if KERNEL_DEBUG_PRINT
void klog(const char *log) {
	FILE *fp = fopen("/dev/kmsg", "w");
	if (NULL != fp) {
		fprintf(fp, "[app]: %s\n", log);
		fclose(fp);
	}
}
#else
void klog(const char *log) { return; }
#endif

static void save_video_stream_to_file(int chn, VENC_STREAM_S stFrame) {
	char OutPath[16];
	void *pData = RK_NULL;
	FILE *file = NULL;

	sprintf(OutPath, "/tmp/venc%d.bin", chn);
	file = fopen(OutPath, "a+");

	if (file) {
		pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
		fwrite(pData, 1, stFrame.pstPack->u32Len, file);
		fflush(file);
	}

	if (file)
		fclose(file);
}

static void *GetVencStream(void *arg) {
	void *pData = NULL;
	int loopCount = 0;
	int chn = (int)arg;
	int s32Ret;
	VENC_STREAM_S stFrame;
	char filename[64];
	snprintf(filename, sizeof(filename), "/tmp/pts_chn_%d.txt", chn);

	FILE *fp = fopen(filename, "wb");

	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	while (!quit) {
		s32Ret = RK_MPI_VENC_GetStream(chn, &stFrame, 1000);
		if (s32Ret == RK_SUCCESS) {
			if (loopCount == (FASTBOOT_RESERVED_FRAME_NUM - 1) && chn == VENC_MAIN_CHANNEL)
				klog("[thunderboot_time] get venc all reserved frames");
			if (loopCount <= SAVE_ENC_FRM_CNT_MAX) {
				fastboot_demo_info(
				    "[%s()] chn:%d, loopCount:%d enc->seq:%d, pkt_size=%lu, pts=%llu\n", __func__,
				    chn, loopCount, stFrame.u32Seq, stFrame.pstPack->u32Len,
				    stFrame.pstPack->u64PTS);
				save_video_stream_to_file(chn, stFrame);
				RK_U64 nowUs = TEST_COMM_GetNowUs();
				if (fp) {
					char str[128];
					snprintf(str, sizeof(str), "seq:%u, pts:%llums\n", stFrame.u32Seq,
					         stFrame.pstPack->u64PTS / 1000);
					fputs(str, fp);
					fflush(fp);
					fsync(fileno(fp));
				}
			}

#if (ENABLE_RTSP)
			// tx video to rtspls
			if (loopCount > SAVE_ENC_FRM_CNT_MAX) {
				if (g_rtsp_ctx) {
					pthread_mutex_lock(&g_rtsp_ctx->mutex);
					pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
					rtsp_tx_video(g_rtsp_ctx->sessions[chn], pData, stFrame.pstPack->u32Len,
					              stFrame.pstPack->u64PTS);
					rtsp_do_event(g_rtsp_ctx->handle);
					pthread_mutex_unlock(&g_rtsp_ctx->mutex);
				}
			}
#endif

			RK_MPI_VENC_ReleaseStream(chn, &stFrame);
			loopCount++;
		} else {
			fastboot_demo_err("[%s()] chn %d RK_MPI_VENC_GetChnFrame fail %#X\n", __func__, chn,
			                  s32Ret);
		}
	}

	if (fp)
		fclose(fp);

	free(stFrame.pstPack);
	return NULL;
}

#if defined(ROCKIVA)
static void iva_detect_result_callback(const RockIvaDetectResult *result,
                                       const RockIvaExecuteStatus status, void *userData) {
	for (int i = 0; i < result->objNum; i++) {
		fastboot_demo_info("[%s()] ROCKIVA topLeft:[%d,%d], bottomRight:[%d,%d],"
		        "objId is %d, frameId is %d, score is %d, type is %d\n", __func__,
		        result->objInfo[i].rect.topLeft.x, result->objInfo[i].rect.topLeft.y,
		        result->objInfo[i].rect.bottomRight.x,
		        result->objInfo[i].rect.bottomRight.y, result->objInfo[i].objId,
		        result->objInfo[i].frameId, result->objInfo[i].score,
		        result->objInfo[i].type);
	}

}

static void iva_frame_release_callback(const RockIvaReleaseFrames *releaseFrames, void *userdata) {
	int ret = RK_SUCCESS;
	IVA_CHN_S *iva_chn = (IVA_CHN_S *)userdata;
	VIDEO_FRAME_INFO_S *tmp_frame = NULL;
	for (int i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			fastboot_demo_err("[%s()] error release frame is null\n", __func__);
			continue;
		}
		tmp_frame = releaseFrames->frames[i].extData;
		ret = RK_MPI_VI_ReleaseChnFrame(0, VI_IVA_CHANNEL, tmp_frame);
		if (ret != RK_SUCCESS)
			fastboot_demo_err("[%s()] RK_MPI_VI_ReleaseChnFrame failure:%#X\n", __func__, ret);
		else
			fastboot_demo_dbg("[%s()] IVA release vi frame from dev %d chn %d, seq %u, pts %llu\n",
			                   __func__, 0, VI_IVA_CHANNEL, tmp_frame->stVFrame.u32TimeRef,
			                   tmp_frame->stVFrame.u64PTS);
		free(tmp_frame);
	}
	iva_chn->bIvaTaskDone = true;
	pthread_cond_signal(&iva_chn->stIvaCond);
}

static void *md_nn_loop(void *arg) {
	int ret = RK_SUCCESS;
	unsigned loop_count = 0;
	bool md = false;
	MPI_CTX_S *mpi_ctx = (MPI_CTX_S *)arg;
	VIDEO_FRAME_INFO_S frame, *tmp_frame;
	IVS_RESULT_INFO_S ivs_result;
	RockIvaImage iva_image;

	pthread_mutex_init(&mpi_ctx->iva.stIvaMutex, NULL);
	pthread_cond_init(&mpi_ctx->iva.stIvaCond, NULL);
	while (!quit) {
		ret = RK_MPI_VI_GetChnFrame(mpi_ctx->vi.dev.dev_id, VI_IVA_CHANNEL, &frame, 1000);
		if (ret == RK_SUCCESS) {
			fastboot_demo_dbg("[%s()] get frame w:%d h:%d seq:%d pts:%lld\n", __func__,
			                  frame.stVFrame.u32Width, frame.stVFrame.u32Height,
			                  frame.stVFrame.u32TimeRef, frame.stVFrame.u64PTS);
			++loop_count;
			ret = RK_MPI_IVS_SendFrame(mpi_ctx->ivs.chn_id, &frame, 1000);
			if (ret != RK_SUCCESS) {
				fastboot_demo_err("[%s()] RK_MPI_IVS_SendFrame failed %#X\n", __func__, ret);
				goto __release_frame;
			}
			md = false;
			ret = RK_MPI_IVS_GetResultsRaw(mpi_ctx->ivs.chn_id, &ivs_result, -1);
			if (ret != RK_SUCCESS) {
				RK_LOGE("[%s()] RK_MPI_IVS_GetResults chnd %d failed %#X\n", __func__,
				        mpi_ctx->ivs.chn_id, ret);
				goto __release_frame;
			}

			if (ivs_result.s32ResultNum == 1) {
				if (1000 * ivs_result.pstResults->stMdInfo.u32Square /
				        mpi_ctx->ivs.stIvsAttr.u32PicWidth / mpi_ctx->ivs.stIvsAttr.u32PicHeight >
				    10) {
					fastboot_demo_dbg("[%s()] ivs result w:%d h:%d square:%d\n", __func__,
					                  ivs_result.pstResults->stMdInfo.u32Square,
					                  mpi_ctx->ivs.stIvsAttr.u32PicWidth,
					                  mpi_ctx->ivs.stIvsAttr.u32PicHeight);
					md = true;
				}
			}
			ret = RK_MPI_IVS_ReleaseResults(mpi_ctx->ivs.chn_id, &ivs_result);
			if (ret != RK_SUCCESS) {
				fastboot_demo_err("[%s()] RK_MPI_IVS_ReleaseResults chnd %d failed %#X\n", __func__,
				                  mpi_ctx->ivs.chn_id, ret);
				goto __release_frame;
			}
			if (md) {
				tmp_frame = malloc(sizeof(VIDEO_FRAME_INFO_S));
				if (!tmp_frame) {
					fastboot_demo_err("[%s()] malloc failed!\n", __func__);
					goto __release_frame;
				}
				memcpy(tmp_frame, &frame, sizeof(VIDEO_FRAME_INFO_S));
				memset(&iva_image, 0, sizeof(RockIvaImage));
				iva_image.info.transformMode = ROCKIVA_IMAGE_TRANSFORM_NONE;
				iva_image.info.width = tmp_frame->stVFrame.u32Width;
				iva_image.info.height = tmp_frame->stVFrame.u32Height;
				iva_image.info.format = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
				iva_image.frameId = loop_count;
				iva_image.dataAddr = NULL;
				iva_image.dataPhyAddr = NULL;
				iva_image.dataFd = RK_MPI_MB_Handle2Fd(tmp_frame->stVFrame.pMbBlk);
				iva_image.extData = tmp_frame;
				mpi_ctx->iva.bIvaTaskDone = false;
				ret = ROCKIVA_PushFrame(mpi_ctx->iva.ivahandle, &iva_image, NULL);
				if (ret != RK_SUCCESS) {
					fastboot_demo_err("[%s()] ROCKIVA_PushFrame failed %#X\n", __func__, ret);
					free(tmp_frame);
					goto __release_frame;
				}
				pthread_mutex_lock(&mpi_ctx->iva.stIvaMutex);
				while (!mpi_ctx->iva.bIvaTaskDone && !quit)
					pthread_cond_wait(&mpi_ctx->iva.stIvaCond, &mpi_ctx->iva.stIvaMutex);
				pthread_mutex_unlock(&mpi_ctx->iva.stIvaMutex);
				continue;
			}
		__release_frame:
			RK_MPI_VI_ReleaseChnFrame(mpi_ctx->vi.dev.dev_id, VI_IVA_CHANNEL, &frame);
		} else {
			fastboot_demo_err("[%s()] RK_MPI_VI_GetChnFrame failed %#X\n", __func__, ret);
		}
	}
	pthread_mutex_destroy(&mpi_ctx->iva.stIvaMutex);
	pthread_cond_destroy(&mpi_ctx->iva.stIvaCond);

	return NULL;
}
#endif

static void mpi_params_init(MPI_CTX_S *ctx, struct meta_info *handle) {
	int vi_buf_cnt = 1;
	int video_width, video_height;
	uint32_t fps = 0, gop = 0;

	/* wrap params init */
	if (g_bWrap == true) {
		if (handle->app_params.cam1_max_fps == 60)
			g_u32WrapLine = handle->app_params.venc_h;
		else
			g_u32WrapLine = handle->app_params.venc_h / 16; // 1 / 4 height wrap
		// vi_buf_cnt = 3;
		ctx->vi.dev.chn[VI_MAIN_CHANNEL].stViWrap.bEnable = g_bWrap;
		ctx->vi.dev.chn[VI_MAIN_CHANNEL].stViWrap.u32BufLine = g_u32WrapLine;
		ctx->vi.dev.chn[VI_MAIN_CHANNEL].stViWrap.u32WrapBufferSize =
		    g_u32WrapLine * handle->sensor_init.cam_w * 3 / 2;
		ctx->venc.chn[VENC_MAIN_CHANNEL].stVencChnBufWrap.bEnable = g_bWrap;
		ctx->venc.chn[VENC_MAIN_CHANNEL].stVencChnBufWrap.u32BufLine = g_u32WrapLine;
	}
	/* vi params init */
	ctx->vi.dev.dev_id = 0;
	ctx->vi.pipe.pipe_id = 0;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].chn_id = VI_MAIN_CHANNEL;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stSize.u32Width = handle->app_params.venc_w;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stSize.u32Height = handle->app_params.venc_h;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stIspOpt.u32BufCount = vi_buf_cnt;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Width =
	    handle->sensor_init.cam_w;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Height =
	    handle->sensor_init.cam_h;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.u32Depth = 0;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi.dev.chn[VI_MAIN_CHANNEL].stChnAttr.stFrameRate.s32DstFrameRate = -1;

	ctx->vi.dev.chn[VI_SUB_CHANNEL].chn_id = VI_SUB_CHANNEL;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stSize.u32Width = SUB_CHANNEL_WIDTH;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stSize.u32Height = SUB_CHANNEL_HEIGHT;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stIspOpt.u32BufCount = vi_buf_cnt;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Width = SUB_CHANNEL_WIDTH;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Height = SUB_CHANNEL_HEIGHT;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.u32Depth = 0;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi.dev.chn[VI_SUB_CHANNEL].stChnAttr.stFrameRate.s32DstFrameRate = -1;

	ctx->vi.dev.chn[VI_IVA_CHANNEL].chn_id = VI_IVA_CHANNEL;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stSize.u32Width = IVA_CHANNEL_WIDTH;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stSize.u32Height = IVA_CHANNEL_HEIGHT;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stIspOpt.u32BufCount = vi_buf_cnt;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Width = IVA_CHANNEL_WIDTH;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stIspOpt.stMaxSize.u32Height = IVA_CHANNEL_HEIGHT;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.u32Depth = 1; // send to venc and md.
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi.dev.chn[VI_IVA_CHANNEL].stChnAttr.stFrameRate.s32DstFrameRate = -1;

	/* venc params init */
	fps = (uint32_t)get_cmd_val("rk_cam_fps", 10);
	RK_ASSERT(fps > VENC_MAIN_CHANNEL);
	gop = fps * 2;
	for (int i = 0; i != 2; ++i) {
		if (i == VENC_MAIN_CHANNEL) {
			video_width = handle->app_params.venc_w;
			video_height = handle->app_params.venc_h;
		} else {
			video_width = SUB_CHANNEL_WIDTH;
			video_height = SUB_CHANNEL_HEIGHT;
		}
		ctx->venc.chn[i].chn_id = i;
		if (handle->app_params.venc_type == 1)
			ctx->venc.chn[i].stChnAttr.stVencAttr.enType = RK_VIDEO_ID_AVC;
		else
			ctx->venc.chn[i].stChnAttr.stVencAttr.enType = RK_VIDEO_ID_HEVC;

		if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC) {
			ctx->venc.chn[i].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H264VBR;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32BitRate =
			    handle->app_params.venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate =
			    handle->app_params.venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32MinBitRate = 200;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32Gop = gop;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateDen = 1;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateDen = 1;
		} else if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC) {
			ctx->venc.chn[i].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H265VBR;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32BitRate =
			    handle->app_params.venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate =
			    handle->app_params.venc_bitrate;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32MinBitRate = 200;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32Gop = gop;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateDen = 1;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateNum = fps;
			ctx->venc.chn[i].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateDen = 1;
		}

		ctx->venc.chn[i].stChnAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;
		if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC)
			ctx->venc.chn[i].stChnAttr.stVencAttr.u32Profile = H264E_PROFILE_HIGH;
		else if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC)
			ctx->venc.chn[i].stChnAttr.stVencAttr.u32Profile = H265E_PROFILE_MAIN;

		ctx->venc.chn[i].stChnAttr.stVencAttr.u32PicWidth = video_width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32VirWidth = video_width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32PicHeight = video_height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32VirHeight = video_height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32MaxPicWidth = video_width;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32MaxPicHeight = video_height;
		ctx->venc.chn[i].stChnAttr.stVencAttr.u32BufSize = video_width * video_height / 3;

		ctx->venc.chn[i].stChnAttr.stVencAttr.u32StreamBufCnt = 4;
		ctx->venc.chn[i].stChnAttr.stVencAttr.enMirror = MIRROR_NONE;

		ctx->venc.chn[i].stVencChnRefBufShare.bEnable = true;

		memset(&ctx->venc.chn[i].stRcParam, 0, sizeof(VENC_RC_PARAM_S));
		if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC) {
			ctx->venc.chn[i].stRcParam.s32FirstFrameStartQp = 28;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MinQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MaxQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MinIQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH264.u32MaxIQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMinQp = 25;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMinIQp = 24;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMaxQp = 41;
			ctx->venc.chn[i].stRcParam.stParamH264.u32FrmMaxIQp = 35;
		} else if (ctx->venc.chn[i].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC) {
			ctx->venc.chn[i].stRcParam.s32FirstFrameStartQp = 28;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MinQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MaxQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MinIQp = 10;
			ctx->venc.chn[i].stRcParam.stParamH265.u32MaxIQp = 51;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMinQp = 25;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMinIQp = 24;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMaxQp = 41;
			ctx->venc.chn[i].stRcParam.stParamH265.u32FrmMaxIQp = 35;
		}

		memset(&ctx->venc.chn[i].stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
		ctx->venc.chn[i].stRecvParam.s32RecvPicNum = -1;
	}

#if defined(ROCKIVA)
	/* ivs params init */
	ctx->ivs.chn_id = 0;
	memset(&ctx->ivs.stIvsAttr, 0, sizeof(IVS_CHN_ATTR_S));
	ctx->ivs.stIvsAttr.enMode = IVS_MODE_MD_OD;
	ctx->ivs.stIvsAttr.u32PicWidth = IVA_CHANNEL_WIDTH;
	ctx->ivs.stIvsAttr.u32PicHeight = IVA_CHANNEL_HEIGHT;
	ctx->ivs.stIvsAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->ivs.stIvsAttr.s32Gop = gop;
	ctx->ivs.stIvsAttr.bSmearEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.bWeightpEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.bMDEnable = RK_TRUE;
	ctx->ivs.stIvsAttr.s32MDInterval = 1;
	ctx->ivs.stIvsAttr.bMDNightMode = RK_TRUE;
	ctx->ivs.stIvsAttr.u32MDSensibility = 3;
	ctx->ivs.stIvsAttr.bODEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.s32ODInterval = 1;
	ctx->ivs.stIvsAttr.s32ODPercent = 7;
	memset(&ctx->ivs.stMdAttr, 0, sizeof(IVS_MD_ATTR_S));
	ctx->ivs.stMdAttr.s32ThreshSad = 64;
	ctx->ivs.stMdAttr.s32ThreshMove = 2;
	ctx->ivs.stMdAttr.s32SwitchSad = 2;
	ctx->ivs.stMdAttr.bFlycatkinFlt = RK_TRUE;
	ctx->ivs.stMdAttr.s32ThresDustMove = 3;
	ctx->ivs.stMdAttr.s32ThresDustBlk = 3;
	ctx->ivs.stMdAttr.s32ThresDustChng = 50;

	/* iva params init */
	memset(&ctx->iva.stCommonParams, 0, sizeof(RockIvaInitParam));
	snprintf(ctx->iva.stCommonParams.modelPath, ROCKIVA_PATH_LENGTH, "/oem/usr/lib");
	ctx->iva.stCommonParams.coreMask = 0x04;
	ctx->iva.stCommonParams.logLevel = ROCKIVA_LOG_WARN;
	ctx->iva.stCommonParams.detModel = ROCKIVA_DET_MODEL_PFP;
	ctx->iva.stCommonParams.imageInfo.width = IVA_CHANNEL_WIDTH;
	ctx->iva.stCommonParams.imageInfo.height = IVA_CHANNEL_HEIGHT;
	ctx->iva.stCommonParams.imageInfo.format = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
	ctx->iva.stCommonParams.imageInfo.transformMode = ROCKIVA_IMAGE_TRANSFORM_NONE;
	memset(&ctx->iva.stDetectParams, 0, sizeof(RockIvaDetTaskParams));
	ctx->iva.stDetectParams.detObjectType |=
	    ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_PERSON);
	ctx->iva.stDetectParams.scores[0] = 30;
	ctx->iva.detectResultCallback = iva_detect_result_callback;
	ctx->iva.releaseCallback = iva_frame_release_callback;
#endif
}

static int32_t vi_init(VI_CTX_S *ctx, struct meta_info *handle) {
	int32_t ret;

	ctx->dev.stDevAttr.u32BufCount = 1;
	ret = RK_MPI_VI_GetDevAttr(ctx->dev.dev_id, &ctx->dev.stDevAttr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		ret = RK_MPI_VI_SetDevAttr(ctx->dev.dev_id, &ctx->dev.stDevAttr);
		if (ret != RK_SUCCESS) {
			fastboot_demo_err("VI dev %d set attr failed ret 0x%08x\n", ctx->dev.dev_id, ret);
			return ret;
		}
	} else {
		fastboot_demo_err("VI dev %d has been configed ret 0x%08x\n", ctx->dev.dev_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_GetDevIsEnable(ctx->dev.dev_id);
	if (ret != RK_SUCCESS) {
		ret = RK_MPI_VI_EnableDev(ctx->dev.dev_id);
		if (ret != RK_SUCCESS) {
			fastboot_demo_err("VI dev %d enable failed ret 0x%08x\n", ctx->dev.dev_id, ret);
			return ret;
		}
		ctx->pipe.stBindPipe.u32Num = 1;
		ctx->pipe.stBindPipe.PipeId[0] = ctx->pipe.pipe_id;
		ctx->pipe.stBindPipe.bUserStartPipe[0] = true;
		ret = RK_MPI_VI_SetDevBindPipe(ctx->dev.dev_id, &ctx->pipe.stBindPipe);
		if (ret != 0) {
			fastboot_demo_err("VI dev %d set bind pipe failed ret 0x%08x\n", ctx->dev.dev_id, ret);
			return ret;
		}
	} else {
		fastboot_demo_err("VI dev %d has been enabled\n", ctx->dev.dev_id);
		return ret;
	}

	ret = RK_MPI_VI_SetChnAttr(ctx->dev.dev_id, ctx->dev.chn[0].chn_id, &ctx->dev.chn[0].stChnAttr);
	if (ret) {
		fastboot_demo_err("VI dev %d set chn %d attr error! ret 0x%08x\n", ctx->dev.dev_id,
		                  ctx->dev.chn[0].chn_id, ret);
		return ret;
	}

	if (g_bWrap) {
		ret = RK_MPI_VI_SetChnWrapBufAttr(ctx->dev.dev_id, ctx->dev.chn[0].chn_id,
		                                  &ctx->dev.chn[0].stViWrap);
		if (ret) {
			RK_LOGE("VI dev %d set chn %d wrap buf attr error! ret 0x%08x\n", ctx->dev.dev_id,
			        ctx->dev.chn[0].chn_id, ret);
			return ret;
		}
	}

	ret = RK_MPI_VI_EnableChn(ctx->dev.dev_id, ctx->dev.chn[0].chn_id);
	if (ret) {
		fastboot_demo_err("create VI dev %d chn 0 error! ret 0x%08x\n", ctx->dev.dev_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_SetChnAttr(ctx->dev.dev_id, ctx->dev.chn[VI_SUB_CHANNEL].chn_id,
	                           &ctx->dev.chn[VI_SUB_CHANNEL].stChnAttr);
	if (ret) {
		fastboot_demo_err("VI dev %d set chn %d attr error! ret 0x%08x\n", ctx->dev.dev_id,
		                  ctx->dev.chn[VI_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_EnableChn(ctx->dev.dev_id, ctx->dev.chn[VI_SUB_CHANNEL].chn_id);
	if (ret) {
		fastboot_demo_err("create VI dev %d chn 1 error! ret 0x%08x\n", ctx->dev.dev_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_SetChnAttr(ctx->dev.dev_id, ctx->dev.chn[VI_IVA_CHANNEL].chn_id,
	                           &ctx->dev.chn[VI_IVA_CHANNEL].stChnAttr);
	if (ret) {
		fastboot_demo_err("VI dev %d set chn %d attr error! ret 0x%08x\n", ctx->dev.dev_id,
		                  ctx->dev.chn[VI_IVA_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_EnableChn(ctx->dev.dev_id, ctx->dev.chn[VI_IVA_CHANNEL].chn_id);
	if (ret) {
		fastboot_demo_err("create VI dev %d chn 1 error! ret 0x%08x\n", ctx->dev.dev_id, ret);
		return ret;
	}

	return ret;
}

static int32_t vi_deinit(VI_CTX_S *ctx) {
	int ret;

	ret = RK_MPI_VI_DisableChn(ctx->dev.dev_id, ctx->dev.chn[VI_IVA_CHANNEL].chn_id);
	if (ret != 0) {
		RK_LOGE("%s vi dev %d chn %d disable failed: %#x!!", __func__, ctx->dev.dev_id,
		        ctx->dev.chn[VI_IVA_CHANNEL].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VI_DisableChn(ctx->dev.dev_id, ctx->dev.chn[VI_SUB_CHANNEL].chn_id);
	if (ret != 0) {
		RK_LOGE("%s vi dev %d chn %d disable failed: %#x!!", __func__, ctx->dev.dev_id,
		        ctx->dev.chn[VI_SUB_CHANNEL].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VI_DisableChn(ctx->dev.dev_id, ctx->dev.chn[0].chn_id);
	if (ret != 0) {
		RK_LOGE("%s vi dev %d chn %d disable failed: %#x!!", __func__, ctx->dev.dev_id,
		        ctx->dev.chn[0].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VI_DisableDev(ctx->dev.dev_id);
	if (ret != 0) {
		fastboot_demo_err("%s vi dev %d disable failed: %#x!!", __func__, ctx->dev.dev_id, ret);
		return ret;
	}

	return ret;
}

static int32_t venc_init(VENC_CTX_S *ctx) {
	int32_t ret = 0;

	ret = RK_MPI_VENC_CreateChn(ctx->chn[0].chn_id, &ctx->chn[0].stChnAttr);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_CreateChn failed: %#x!", ctx->chn[0].chn_id, ret);
		return ret;
	}

	if (g_bWrap) {
		ret = RK_MPI_VENC_SetChnBufWrapAttr(ctx->chn[0].chn_id, &ctx->chn[0].stVencChnBufWrap);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_SetChnBufWrapAttr failed: %#x!", ctx->chn[0].chn_id,
			        ret);
			return ret;
		}
	}

	ret = RK_MPI_VENC_SetChnRefBufShareAttr(ctx->chn[0].chn_id, &ctx->chn[0].stVencChnRefBufShare);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_SetChnRefBufShareAttr failed: %#x!",
		                  ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_SetRcParam(ctx->chn[0].chn_id, &ctx->chn[0].stRcParam);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_SetRcParam failed: %#x!", ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_EnableSvc(ctx->chn[0].chn_id, RK_TRUE);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_EnableSvc failed: %#x!", ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_StartRecvFrame(ctx->chn[0].chn_id, &ctx->chn[0].stRecvParam);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_StartRecvFrame failed: %#x!", ctx->chn[0].chn_id,
		                  ret);
		return ret;
	}

	ret = RK_MPI_VENC_CreateChn(ctx->chn[VENC_SUB_CHANNEL].chn_id,
	                            &ctx->chn[VENC_SUB_CHANNEL].stChnAttr);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_CreateChn failed: %#x!",
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_SetChnRefBufShareAttr(ctx->chn[VENC_SUB_CHANNEL].chn_id,
	                                        &ctx->chn[VENC_SUB_CHANNEL].stVencChnRefBufShare);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_SetChnRefBufShareAttr failed: %#x!",
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_SetRcParam(ctx->chn[VENC_SUB_CHANNEL].chn_id,
	                             &ctx->chn[VENC_SUB_CHANNEL].stRcParam);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_SetRcParam failed: %#x!",
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_EnableSvc(ctx->chn[VENC_SUB_CHANNEL].chn_id, RK_TRUE);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_EnableSvc failed: %#x!",
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_StartRecvFrame(ctx->chn[VENC_SUB_CHANNEL].chn_id,
	                                 &ctx->chn[VENC_SUB_CHANNEL].stRecvParam);
	if (ret != 0) {
		fastboot_demo_err("venc [%d] RK_MPI_VENC_StartRecvFrame failed: %#x!",
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	return ret;
}

static int32_t venc_deinit(VENC_CTX_S *ctx) {
	int32_t ret = 0;

	ret = RK_MPI_VENC_StopRecvFrame(ctx->chn[0].chn_id);
	if (ret != 0) {
		fastboot_demo_err("%s venc chn %d stop failed: %#x!!", __func__, ctx->chn[0].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VENC_DestroyChn(ctx->chn[0].chn_id);
	if (ret != 0) {
		fastboot_demo_err("%s venc chn %d destory failed: %#x!!", __func__, ctx->chn[0].chn_id,
		                  ret);
		return ret;
	}
	ret = RK_MPI_VENC_StopRecvFrame(ctx->chn[VENC_SUB_CHANNEL].chn_id);
	if (ret != 0) {
		fastboot_demo_err("%s venc chn %d stop failed: %#x!!", __func__,
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VENC_DestroyChn(ctx->chn[VENC_SUB_CHANNEL].chn_id);
	if (ret != 0) {
		fastboot_demo_err("%s venc chn %d destory failed: %#x!!", __func__,
		                  ctx->chn[VENC_SUB_CHANNEL].chn_id, ret);
		return ret;
	}

	return ret;
}

static int32_t vi_bind_venc() {
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = 0;
	stSrcChn.s32ChnId = 0;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = 0;
	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		fastboot_demo_err("VI dev 0 chn 0 bind VENC dev 0 chn 0 failed, ret: 0x%08x\n", ret);

	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = 0;
	stSrcChn.s32ChnId = VI_SUB_CHANNEL;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_SUB_CHANNEL;
	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		fastboot_demo_err("VI dev 0 chn 1 bind VENC dev 0 chn 1 failed, ret: 0x%08x\n", ret);

	return ret;
}

static int32_t vi_unbind_venc() {
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = 0;
	stSrcChn.s32ChnId = 0;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = 0;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		fastboot_demo_err("VI dev 0 chn 0 unbind VENC dev 0 chn 0 failed, ret: 0x%08x\n", ret);

	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = 0;
	stSrcChn.s32ChnId = VI_SUB_CHANNEL;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_SUB_CHANNEL;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		fastboot_demo_err("VI dev 0 chn 1 unbind VENC dev 0 chn 1 failed, ret: 0x%08x\n", ret);

	return ret;
}

#if defined(ROCKIVA)
static int ivs_chn_init(IVS_CHN_S *ivs_chn) {
	int ret = RK_SUCCESS;
	ret = RK_MPI_IVS_CreateChn(ivs_chn->chn_id, &ivs_chn->stIvsAttr);
	if (ret != RK_SUCCESS) {
		fastboot_demo_err("RK_MPI_IVS_CreateChn failure:%X\n", ret);
		return ret;
	}
	ret = RK_MPI_IVS_SetMdAttr(ivs_chn->chn_id, &ivs_chn->stMdAttr);
	if (ret) {
		fastboot_demo_err("ivs set mdattr failed:%x\n", ret);
		return ret;
	}
	return ret;
}

static int ivs_chn_deinit(IVS_CHN_S *ivs_chn) {
	int ret = RK_SUCCESS;
	ret = RK_MPI_IVS_DestroyChn(ivs_chn->chn_id);
	if (ret != RK_SUCCESS)
		fastboot_demo_err("RK_MPI_IVS_DestroyChn failed %#X\n", ret);
	return ret;
}

static int iva_chn_init(IVA_CHN_S *iva_chn) {
	int ret = RK_SUCCESS;
	ret = ROCKIVA_Init(&iva_chn->ivahandle, ROCKIVA_MODE_VIDEO, &iva_chn->stCommonParams,
	                   iva_chn /* private data */);
	if (ret != RK_SUCCESS) {
		fastboot_demo_err("ROCKIVA_Init failed %#X\n", ret);
		return ret;
	}
	ret = ROCKIVA_DETECT_Init(iva_chn->ivahandle, &iva_chn->stDetectParams,
	                          iva_chn->detectResultCallback);
	if (ret != RK_SUCCESS) {
		fastboot_demo_err("ROCKIVA_DETECT_Init failed %#X\n", ret);
		return ret;
	}
	ret = ROCKIVA_SetFrameReleaseCallback(iva_chn->ivahandle, iva_chn->releaseCallback);
	if (ret != RK_SUCCESS) {
		fastboot_demo_err("ROCKIVA_SetFrameReleaseCallback failed %#X\n", ret);
		return ret;
	}
	return ret;
}

static int iva_chn_deinit(IVA_CHN_S *iva_chn) {
	int ret = RK_SUCCESS;
	ret = ROCKIVA_DETECT_Release(iva_chn->ivahandle);
	if (ret != RK_SUCCESS)
		fastboot_demo_err("ROCKIVA_DETECT_Release failed %#X\n", ret);
	ret = ROCKIVA_Release(iva_chn->ivahandle);
	if (ret != RK_SUCCESS)
		fastboot_demo_err("ROCKIVA_Release failed %#X\n", ret);
	return ret;
}
#endif

static void rtsp_init() {
	char session_name[128] = {'\0'};
	g_rtsp_ctx = malloc(sizeof(RTSP_CTX));
	g_rtsp_ctx->handle = create_rtsp_demo(554);
	for (int i = 0; i != 2; ++i) {
		snprintf(session_name, sizeof(session_name), "/live/%d", i);
		g_rtsp_ctx->sessions[i] = rtsp_new_session(g_rtsp_ctx->handle, session_name);
		rtsp_set_video(g_rtsp_ctx->sessions[i], RTSP_CODEC_ID_VIDEO_H264, NULL, 0);
		rtsp_sync_video_ts(g_rtsp_ctx->sessions[i], rtsp_get_reltime(), rtsp_get_ntptime());
	}
	pthread_mutex_init(&g_rtsp_ctx->mutex, NULL);
}

static void rtsp_deinit() {
	rtsp_del_demo(g_rtsp_ctx->handle);
	pthread_mutex_destroy(&g_rtsp_ctx->mutex);
	free(g_rtsp_ctx);
}

static int aiq_init(struct meta_info *handle, void *metaVirmem, MPI_CTX_S *ctx) {
	int camId = 0, file_size = 0, ret = 0;
	void *vir_iqaddr, *appVirAddr;
	rk_aiq_static_info_t aiq_static_info;
	char *sensor_name;

	file_size = (int)get_cmd_val("rk_iqbin_size", 16);

	vir_iqaddr = metaVirmem + SENSOR_IQ_BIN_OFFSET + offsetof(struct sensor_iq_info, data);

	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas(camId, &aiq_static_info);
	sensor_name = aiq_static_info.sensor_info.sensor_name;
	fastboot_demo_info("sensor name: %s\n", sensor_name);

	if (handle->app_params.color_mode) {
		ret = dlsym_rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "night");
		fastboot_demo_info("aiq preinit night scene\n");
	} else {
		ret = dlsym_rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "day");
		fastboot_demo_info("aiq preinit day scene\n");
	}
	if (ret < 0)
		fastboot_demo_err("%s: failed to set night scene\n", sensor_name);
	klog("preinit scene\n");

	ret = dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr(sensor_name, vir_iqaddr, file_size);
	if (ret < 0)
		fastboot_demo_err("%s: failed to load binary iqfiles\n", sensor_name);
	klog("preinit iq addr\n");

	g_aiq_ctx = dlsym_rk_aiq_uapi2_sysctl_init(sensor_name, "/etc/iqfiles/", NULL, NULL);
	klog("aiq init\n");
	if (g_aiq_ctx == NULL)
		fastboot_demo_err("%s: failed to init aiq\n", sensor_name);

	return 0;
}

static int aiq_run(struct meta_info *handle) {
	int cam_hdr = 0, ret = 0;
	rk_aiq_working_mode_t hdr_mode;
	frameRateInfo_t info;

	cam_hdr = (int)get_cmd_val("rk_cam_hdr", 0);
	hdr_mode = (cam_hdr == 5) ? RK_AIQ_WORKING_MODE_ISP_HDR2 : RK_AIQ_WORKING_MODE_NORMAL;

	ret = dlsym_rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx, 0, 0, hdr_mode);
	if (ret < 0)
		fastboot_demo_err("rkaiq engine prepare failed !\n");

	info.mode = OP_MANUAL;
	info.fps = handle->app_params.cam_fps;
	ret = dlsym_rk_aiq_uapi2_setFrameRate(g_aiq_ctx, info);
	if (ret < 0)
		fastboot_demo_err("rk_aiq_uapi2_setFrameRate failed\n");
	klog("aiq prepare\n");

	klog("aiq prepare\n");
	ret = dlsym_rk_aiq_uapi2_sysctl_start(g_aiq_ctx);
	if (ret < 0)
		fastboot_demo_err("rk_aiq_uapi2_sysctl_start failed\n");
	klog("aiq start\n");

	return ret;
}

static void aiq_stop() { dlsym_rk_aiq_uapi2_sysctl_stop(g_aiq_ctx, false); }

static void aiq_deinit() { dlsym_rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx); }

static void set_ircut_lower_power(struct meta_info *handle) {
	// ircut pull down to low power mode
	int gpio_ircut_a = handle->sensor_init.ircut_a.gpio_index;
	int gpio_ircut_b = handle->sensor_init.ircut_b.gpio_index;
	if (gpio_ircut_a >= 0 && gpio_ircut_b >= 0) {
		rk_gpio_export(gpio_ircut_a);
		rk_gpio_set_direction(gpio_ircut_a, RK_FALSE);
		rk_gpio_set_value(gpio_ircut_a, 0);
		rk_gpio_export(gpio_ircut_b);
		rk_gpio_set_direction(gpio_ircut_b, RK_FALSE);
		rk_gpio_set_value(gpio_ircut_b, 0);
	}
}

#ifdef ENABLE_SMART_IR
static void rk_enable_ircut(bool on) {
	if (!on) {
		rk_gpio_set_value(g_smartIr_ctx.ircut_on_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(g_smartIr_ctx.ircut_on_gpio, 0);
	} else {
		rk_gpio_set_value(g_smartIr_ctx.ircut_off_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(g_smartIr_ctx.ircut_off_gpio, 0);
	}
}

static int get_board_info(void) {
	int mem_fd = -1;
	off_t metaAddr = 0;
	void *metaVirmem = NULL;
	RK_U32 metaSize = (RK_U32)get_cmd_val("meta_part_size", 16);
	g_smartIr_ctx.ircut_on_gpio = -1;
	g_smartIr_ctx.ircut_off_gpio = -1;
	g_smartIr_ctx.irled_pwm_channel = -1;
	g_smartIr_ctx.irled_enable_gpio = -1;
	g_smartIr_ctx.visled_pwm_channel = -1;
	g_smartIr_ctx.visled_enable_gpio = -1;
	metaAddr = (off_t)get_cmd_val("meta_load_addr", 16);
	if ((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
		printf("cannot open /dev/mem.\n");
		return -1;
	}
	metaVirmem = mmap(NULL, metaSize, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, metaAddr);
	if (metaVirmem != MAP_FAILED) {
		// get sensir init cfg addr, include ircut info
		struct sensor_init_cfg *pSensorInitParam = NULL;
		pSensorInitParam = (struct sensor_init_cfg *)(metaVirmem + SENSOR_INIT_OFFSET);

		g_smartIr_ctx.ircut_on_gpio = pSensorInitParam->ircut_a.gpio_index;
		g_smartIr_ctx.ircut_off_gpio = pSensorInitParam->ircut_b.gpio_index;
		g_smartIr_ctx.irled_pwm_channel = pSensorInitParam->led_ir.pwm_channel;
		g_smartIr_ctx.irled_enable_gpio = pSensorInitParam->led_ir_enable.gpio_index;
		g_smartIr_ctx.visled_pwm_channel = pSensorInitParam->led_white.pwm_channel;
		g_smartIr_ctx.visled_enable_gpio = pSensorInitParam->led_white_enable.gpio_index;
	} else {
		printf("mmap fail.\n");
		return -1;
	}
	if (metaVirmem != MAP_FAILED)
		munmap(metaVirmem, metaSize);
	return EXIT_SUCCESS;
}

static void *switch_thread_irled(void *args) {
	int ret;
	int irled_pwm_period = 5000, irled_pwm_duty = 0, init_irled_value = 0;
	float cur_irled_value = 0.0;
	rk_smartIr_t *smartIr_ctx = &g_smartIr_ctx;
	rk_smart_ir_result_t result;
	RK_SMART_IR_STATUS_t last_status;
	rk_smart_ir_attr_t init_attr;

	get_board_info();
	ret |= rk_gpio_export_direction(smartIr_ctx->ircut_on_gpio, GPIO_DIRECTION_OUTPUT);
	ret |= rk_gpio_export_direction(smartIr_ctx->ircut_off_gpio, GPIO_DIRECTION_OUTPUT);
	ret |= rk_gpio_export_direction(smartIr_ctx->irled_enable_gpio, GPIO_DIRECTION_OUTPUT);

	init_irled_value = (int)get_cmd_val("rk_led_value", 0);
	irled_pwm_duty = irled_pwm_period * MIN(init_irled_value, 100) / 100;
	ret = rk_pwm_init(smartIr_ctx->irled_pwm_channel, irled_pwm_period, irled_pwm_duty,
	                  PWM_POLARITY_NORMAL);
	if (ret) {
		printf("rk_pwm_init error ret [%d]\n", ret);
	}

	rk_smart_ir_getAttr(smartIr_ctx->ir_ctx, &init_attr);
	last_status = init_attr.init_status;

	if (last_status == RK_SMART_IR_STATUS_NIGHT) {
		rk_gpio_set_value(smartIr_ctx->irled_enable_gpio, 1);
	} else {
		rk_gpio_set_value(smartIr_ctx->irled_enable_gpio, 0);
	}

	int sleep_count = 15;
	while (--sleep_count >= 0) {
		if ((access("/dev/block/by-name/meta", F_OK)) == 0) {
			printf("load meta partition finished\n");
			break;
		}
		usleep(1000 * 1000);
	}

	while (!smartIr_ctx->tquit && (quit == false)) {
		rk_smart_ir_run(smartIr_ctx->ir_ctx, false, &result);

		if (result.status == RK_SMART_IR_STATUS_DAY && last_status == RK_SMART_IR_STATUS_NIGHT) {
			last_status = RK_SMART_IR_STATUS_DAY;
			rk_gpio_set_value(smartIr_ctx->irled_enable_gpio, 0);
			if (rk_pwm_set_enable(smartIr_ctx->irled_pwm_channel, false)) {
				printf("pwm%d disable failed %d\n", smartIr_ctx->irled_pwm_channel);
			}
			rk_enable_ircut(true);
			rk_aiq_uapi2_sysctl_switch_scene(smartIr_ctx->aiq_ctx, "normal", "day");
			printf("switch to DAY\n");
			system("make_meta --update --meta_path /dev/block/by-name/meta "
			       "--rk_color_mode 0");

		} else if (result.status == RK_SMART_IR_STATUS_NIGHT) {
			if (last_status == RK_SMART_IR_STATUS_DAY) {
				last_status = RK_SMART_IR_STATUS_NIGHT;
				rk_aiq_uapi2_sysctl_switch_scene(smartIr_ctx->aiq_ctx, "normal", "night");
				rk_enable_ircut(false);
				rk_gpio_set_value(smartIr_ctx->irled_enable_gpio, 1);
				if (rk_pwm_set_enable(smartIr_ctx->irled_pwm_channel, true)) {
					printf("pwm%d enable failed %d\n", smartIr_ctx->irled_pwm_channel);
				}
				printf("switch to Night\n");
				system("make_meta --update --meta_path /dev/block/by-name/meta "
				       "--rk_color_mode 1");
			}

			if (fabs(result.fill_value - cur_irled_value) >= 0.001) {
				cur_irled_value = result.fill_value;
				irled_pwm_duty = irled_pwm_period * MIN(cur_irled_value, 100.0) / 100;
				rk_pwm_set_duty(smartIr_ctx->irled_pwm_channel, irled_pwm_duty);
			}
		}
	}

	return NULL;
}

static void *switch_thread_visled(void *args) {
	int ret;
	int visled_pwm_period = 5000, visled_pwm_duty = 0, init_visled_value = 0;
	float cur_visled_value = 0.0;

	get_board_info();
	ret |= rk_gpio_export_direction(g_smartIr_ctx.visled_enable_gpio, GPIO_DIRECTION_OUTPUT);
	rk_gpio_set_value(g_smartIr_ctx.visled_enable_gpio, 1);

	init_visled_value = (int)get_cmd_val("rk_led_value", 0);
	visled_pwm_duty = visled_pwm_period * MIN(init_visled_value, 100) / 100;
	ret = rk_pwm_init(g_smartIr_ctx.visled_pwm_channel, visled_pwm_period, visled_pwm_duty,
	                  PWM_POLARITY_NORMAL);
	if (ret) {
		printf("rk_pwm_init error ret [%d]\n", ret);
	}

	rk_smartIr_t *smartIr_ctx = &g_smartIr_ctx;
	rk_smart_ir_result_t result;
	RK_SMART_IR_STATUS_t last_status;
	rk_smart_ir_attr_t init_attr;
	rk_smart_ir_getAttr(smartIr_ctx->ir_ctx, &init_attr);
	last_status = init_attr.init_status;

	while (!smartIr_ctx->tquit && (quit == false)) {
		rk_smart_ir_run(smartIr_ctx->ir_ctx, false, &result);

		if (result.status == RK_SMART_IR_STATUS_DAY && last_status == RK_SMART_IR_STATUS_NIGHT) {
			rk_gpio_set_value(smartIr_ctx->visled_enable_gpio, 0);

		} else if (result.status == RK_SMART_IR_STATUS_NIGHT &&
		           last_status == RK_SMART_IR_STATUS_DAY) {
			rk_gpio_set_value(smartIr_ctx->visled_enable_gpio, 1);

			if (fabs(result.fill_value - cur_visled_value) >= 0.001) {
				cur_visled_value = result.fill_value;
				visled_pwm_duty = visled_pwm_period * MIN(cur_visled_value, 100.0) / 100;
				rk_pwm_set_duty(g_smartIr_ctx.visled_pwm_channel, visled_pwm_duty);
			}
		}
	}

	return NULL;
}

void smartIr_start(struct meta_info *handle) {
	int rk_night_mode = (int)get_cmd_val("rk_night_mode", 0);
	int rk_led_value = (int)get_cmd_val("rk_led_value", 0);
	int rk_color_mode = (int)handle->app_params.color_mode;

	rk_smartIr_t *smartIr_ctx = &g_smartIr_ctx;
	smartIr_ctx->aiq_ctx = g_aiq_ctx;
	smartIr_ctx->ir_ctx = rk_smart_ir_init(smartIr_ctx->aiq_ctx);

	rk_smart_ir_attr_t attr;
	// memset(&attr, 0, sizeof(attr));
	rk_smart_ir_getAttr(smartIr_ctx->ir_ctx, &attr);

	if (rk_night_mode == 2) {
		// load configs: auto switch, manual irled
		attr.init_status = rk_color_mode > 0 ? RK_SMART_IR_STATUS_NIGHT : RK_SMART_IR_STATUS_DAY;
		attr.switch_mode = RK_SMART_IR_SWITCH_MODE_AUTO;
		attr.light_mode = RK_SMART_IR_LIGHT_MODE_MANUAL;
		attr.light_type = RK_SMART_IR_LIGHT_TYPE_IR;
		attr.light_value = rk_led_value;
		attr.params.d2n_envL_th = 0.04f;
		attr.params.n2d_envL_th = 0.20f;
		attr.params.rggain_base = 1.00f;
		attr.params.bggain_base = 1.00f;
		attr.params.awbgain_rad = 0.10f;
		attr.params.awbgain_dis = 0.20f;
		attr.params.switch_cnts_th = 50;
		rk_smart_ir_setAttr(smartIr_ctx->ir_ctx, &attr);

		// create thread
		smartIr_ctx->tquit = false;
		pthread_create(&smartIr_ctx->tid, NULL, switch_thread_irled, NULL);
		smartIr_ctx->started = true;

	} else if (rk_night_mode == 3) {
		// load configs: manual switch, manual visled
		attr.init_status = RK_SMART_IR_STATUS_NIGHT;
		attr.switch_mode = RK_SMART_IR_SWITCH_MODE_NIGHT;
		attr.light_mode = RK_SMART_IR_LIGHT_MODE_MANUAL;
		attr.light_type = RK_SMART_IR_LIGHT_TYPE_VIS;
		attr.light_value = rk_led_value;
		attr.params.d2n_envL_th = 0.04f;
		attr.params.n2d_envL_th = 0.60f;
		attr.params.rggain_base = 0.0f;
		attr.params.bggain_base = 0.0f;
		attr.params.awbgain_rad = 0.0f;
		attr.params.awbgain_dis = 0.0f;
		attr.params.switch_cnts_th = 50;
		attr.en_auto_n2dth = true;
		rk_smart_ir_setAttr(smartIr_ctx->ir_ctx, &attr);

		// create thread
		smartIr_ctx->tquit = false;
		pthread_create(&smartIr_ctx->tid, NULL, switch_thread_visled, NULL);
		smartIr_ctx->started = true;
	}
}

void smartIr_stop() {
	rk_smartIr_t *smartIr_ctx = &g_smartIr_ctx;

	rk_pwm_deinit(smartIr_ctx->irled_pwm_channel);
	rk_pwm_deinit(smartIr_ctx->visled_pwm_channel);

	if (smartIr_ctx->started) {
		smartIr_ctx->tquit = true;
		pthread_join(smartIr_ctx->tid, NULL);
	}
	smartIr_ctx->started = false;

	if (smartIr_ctx->ir_ctx) {
		rk_smart_ir_deInit(smartIr_ctx->ir_ctx);
		smartIr_ctx->ir_ctx = NULL;
	}
}
#else
void smartIr_start(struct meta_info *handle) {}
void smartIr_stop() {}
#endif

int main(int argc, char *argv[]) {
	klog("[thunderboot_time] fastboot_demo enter");

	MPI_CTX_S ctx = {0};
	void *metaVirmem = NULL;
	uint32_t meta_size;
	int32_t ret = 0;
	struct meta_info handle = {0};
	struct sigaction action;

	action.sa_handler = handle_pipe;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;
	sigaction(SIGPIPE, &action, NULL);
	signal(SIGINT, sigterm_handler);

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}

#ifdef RKAIQ_USE_DLOPEN
	if (dlsym_rkaiq() != 0) {
		goto __FAILED;
	}
#endif

	meta_size = (uint32_t)get_cmd_val("meta_part_size", 16);
	metaVirmem = get_meta_params(&handle);
	if (metaVirmem == MAP_FAILED) {
		fastboot_demo_err("get_meta_params failed metaVirmem %p\n", metaVirmem);
		goto __FAILED;
	}

	meta_params_dump(&handle);

	mpi_params_init(&ctx, &handle);

	ret = aiq_init(&handle, metaVirmem, &ctx);
	if (ret) {
		fastboot_demo_err("aiq_init failed, ret 0x%08x\n", ret);
		return ret;
	}
	klog("aiq_init success\n");
	ret = aiq_run(&handle);
	if (ret) {
		fastboot_demo_err("aiq_run failed, ret 0x%08x\n", ret);
		return ret;
	}
	klog("aiq_run success\n");
	ret = vi_init(&ctx.vi, &handle);
	if (ret) {
		fastboot_demo_err("vi_init failed, ret 0x%08x\n", ret);
		return ret;
	}
	klog("vi_init success\n");
	ret = venc_init(&ctx.venc);
	if (ret) {
		fastboot_demo_err("venc_init failed, ret 0x%08x\n", ret);
		return ret;
	}
	klog("venc_init success\n");
	ret = vi_bind_venc();
	if (ret) {
		fastboot_demo_err("vi_bind_venc failed, ret 0x%08x\n", ret);
		return ret;
	}

	RK_MPI_VI_StartPipe(0);

	set_ircut_lower_power(&handle);

	smartIr_start(&handle);

#if defined(ROCKIVA)
	ret = iva_chn_init(&ctx.iva);
	if (ret) {
		fastboot_demo_err("iva_chn_init failed %#X\n", ret);
		return ret;
	}
	klog("iva_chn_init success\n");
	ret = ivs_chn_init(&ctx.ivs);
	if (ret) {
		fastboot_demo_err("ivs_chn_init failed %#X\n", ret);
		return ret;
	}
	klog("ivs_chn_init success\n");
#endif

#if (ENABLE_RTSP)
	rtsp_init();
#endif

	pthread_t main_thread0, sub_venc_thread_id, md_nn_thread_id;
	pthread_create(&main_thread0, NULL, GetVencStream, (void *)VENC_MAIN_CHANNEL);
	pthread_create(&sub_venc_thread_id, NULL, GetVencStream, (void *)VENC_SUB_CHANNEL);
#if defined(ROCKIVA)
	pthread_create(&md_nn_thread_id, NULL, md_nn_loop, &ctx);
#endif
	pthread_join(main_thread0, NULL);
	pthread_join(sub_venc_thread_id, NULL);
#if defined(ROCKIVA)
	pthread_join(md_nn_thread_id, NULL);
#endif

__FAILED:
#if (ENABLE_RTSP)
	rtsp_deinit();
#endif
	RK_MPI_VI_StopPipe(0);
	ret = vi_unbind_venc();
	if (ret) {
		fastboot_demo_err("vi_unbind_venc failed\n");
		return ret;
	}
	ret = venc_deinit(&ctx.venc);
	if (ret) {
		fastboot_demo_err("venc_deinit failed ret 0x%08x\n", ret);
		return ret;
	}
	ret = vi_deinit(&ctx.vi);
	if (ret) {
		fastboot_demo_err("vi_deinit failed ret 0x%08x\n", ret);
		return ret;
	}
#if defined(ROCKIVA)
	ret = ivs_chn_deinit(&ctx.ivs);
	if (ret) {
		fastboot_demo_err("ivs_deinit failed ret 0x%08x\n", ret);
		return ret;
	}
	ret = iva_chn_deinit(&ctx.iva);
	if (ret) {
		fastboot_demo_err("iva_deinit failed ret 0x%08x\n", ret);
		return ret;
	}
#endif
	aiq_stop();
	aiq_deinit();
	smartIr_stop();

#ifdef RKAIQ_USE_DLOPEN
	if (rkaiq_dl != NULL) {
		dlclose(rkaiq_dl);
	}
#endif

	if (metaVirmem != MAP_FAILED)
		munmap(metaVirmem, meta_size);
	fastboot_demo_info("main service exit main\n");
	return 0;
}
