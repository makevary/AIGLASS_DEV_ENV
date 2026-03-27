#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <sys/mman.h>
#include <sys/poll.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#include "rk_aiq_user_api2_sysctl.h"
#include "rk_debug.h"
#include "rk_defines.h"
#include "rk_gpio.h"
#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_sys.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vi.h"
#include "rk_pwm.h"
#include "rk_smart_ir_api.h"
#include "rk_type.h"
#include "rtsp_demo.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"

#if defined(ROCKIVA)
#include "rockiva/rockiva_ba_api.h"
#include "rockiva/rockiva_common.h"
#include "rockiva/rockiva_det_api.h"
#include "rockiva/rockiva_face_api.h"
#include "rockiva/rockiva_image.h"
#endif

#define CAM_NUM 2
#define VI_CHN_NUM 3
#define VENC_CHN_NUM 4
#define IVA_HANDLE_NUM 2
#define MMAP_START_FROM_ZERO 0
#define SERVER_DEBUG_PRT 0
#define SENSOR 0
#define SECONDARY_SENSOR 1
#define ENABLE_RTSP 1
#define ENABLE_WRAP 1
#define WRAP_LINE_DIV 4
#define SUB_STREAM_WIDTH 640
#define SUB_STREAM_HEIGHT 360
#define FASTBOOT_RESERVED_FRAME_NUM 4
#define VICAP_OFFLINE_BUFF_CNT 2
#define VENC_MAIN_CHANNEL 0

#define MMAP_SIZE (4096UL)        // MMAP_SIZE = 4K
#define MMAP_MASK (MMAP_SIZE - 1) // MMAP_MASK = 0XFFF

#define SAVE_ENC_FRM_CNT_MAX 30

#if SERVER_DEBUG_PRT
#define DBG(fmt, args...) printf("fastboot_daul_camera DBG: " fmt "", ##args)
#else
#define DBG(fmt, args...)
#endif
#define INFO(fmt, args...) printf("fastboot_daul_camera INFO: " fmt "", ##args)
#define ERR(fmt, args...) printf("fastboot_daul_camera ERR: " fmt "", ##args)

#define ALIGN_2(data) (data / 2 * 2)

static bool quit = false;

pthread_mutex_t g_rtsp_mutex = PTHREAD_MUTEX_INITIALIZER;
rtsp_demo_handle g_rtsplive = NULL;
static rtsp_session_handle g_rtsp_session[VENC_CHN_NUM] = {0};

static rk_aiq_sys_ctx_t *g_aiq_ctx[CAM_NUM];

static void sigterm_handler(int sig) { quit = true; }
void handle_pipe(int sig) { INFO("%s sig = %d\n", __func__, sig); }

typedef struct _rkMpiVICtx {
	uint32_t u32Width;
	uint32_t u32Height;
	VI_DEV s32DevId;
	VI_PIPE s32PipeId;
	VI_CHN s32ChnId;
	VI_CHN_BUF_WRAP_S stViWrap;
	VI_DEV_ATTR_S stDevAttr;
	VI_DEV_BIND_PIPE_S stBindPipe;
	VI_CHN_ATTR_S stChnAttr;
} VI_CTX_S;

typedef struct _rkMpiVENCCtx {
	uint32_t u32Width;
	uint32_t u32Height;
	uint32_t u32Gop;
	uint32_t u32BitRate;
	uint32_t u32StreamBufCnt;
	uint32_t enCodecType;
	PIXEL_FORMAT_E enPixelFormat;
	VENC_CHN s32ChnId;
	VENC_CHN s32ChnNum;
	VENC_CHN_ATTR_S stChnAttr;
	VENC_RC_PARAM_S stRcParam;
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_BUF_WRAP_S stVencChnBufWrap;
	VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
} VENC_CTX_S;

#if defined(ROCKIVA)
typedef struct _rkIVACHN {
	RK_S32 detectedViPipe;
	RK_S32 detectedViChn;
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

typedef struct _rkMpiCtx {
	VI_PARAM_MOD_S stViModParam;
	VI_CTX_S vi[CAM_NUM][VI_CHN_NUM];
	VENC_CTX_S venc[VENC_CHN_NUM];
#if defined(ROCKIVA)
	IVA_CHN_S iva[IVA_HANDLE_NUM];
#endif
} MPI_CTX_S;

typedef struct meta_info {
	struct app_param_info *app_params;
	struct sensor_init_cfg *sensor_init[2];
} META_INFO;

#if defined(ROCKIVA)
static void iva_detect_result_callback(const RockIvaDetectResult *result,
                                       const RockIvaExecuteStatus status, void *userData) {
	IVA_CHN_S *iva_chn = (IVA_CHN_S *)userData;
	for (int i = 0; i < result->objNum; i++) {
		if (result->objInfo[i].score > 90)
			RK_LOGI("[%s()] ROCKIVA data_scr:[%d,%d], topLeft:[%d,%d], bottomRight:[%d,%d],"
			        "objId is %d, frameId is %d, score is %d, type is %d\n",
			        __func__, iva_chn->detectedViPipe, iva_chn->detectedViChn,
			        result->objInfo[i].rect.topLeft.x, result->objInfo[i].rect.topLeft.y,
			        result->objInfo[i].rect.bottomRight.x, result->objInfo[i].rect.bottomRight.y,
			        result->objInfo[i].objId, result->objInfo[i].frameId, result->objInfo[i].score,
			        result->objInfo[i].type);
	}
}

static void iva_frame_release_callback(const RockIvaReleaseFrames *releaseFrames, void *userdata) {
	int ret = RK_SUCCESS;
	IVA_CHN_S *iva_chn = (IVA_CHN_S *)userdata;
	VIDEO_FRAME_INFO_S *tmp_frame = NULL;

	for (int i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			RK_LOGE("[%s()] error release frame is null\n", __func__);
			continue;
		}
		tmp_frame = releaseFrames->frames[i].extData;
		ret = RK_MPI_VI_ReleaseChnFrame(iva_chn->detectedViPipe, iva_chn->detectedViChn, tmp_frame);
		if (ret != RK_SUCCESS)
			RK_LOGE("[%s()] RK_MPI_VI_ReleaseChnFrame failure:%#X\n", __func__, ret);
		else
			RK_LOGD("[%s()] IVA release vi frame from pipe %d chn %d, seq %u, pts %llu\n", __func__,
			        iva_chn->detectedViPipe, iva_chn->detectedViChn, tmp_frame->stVFrame.u32TimeRef,
			        tmp_frame->stVFrame.u64PTS);
		free(tmp_frame);
	}
	iva_chn->bIvaTaskDone = true;
	pthread_cond_signal(&iva_chn->stIvaCond);
}

static void *md_nn_loop(void *arg) {
	int ret = RK_SUCCESS;
	unsigned loop_count = 0;
	IVA_CHN_S *ctx = (IVA_CHN_S *)arg;
	VIDEO_FRAME_INFO_S frame, *tmp_frame;
	RockIvaImage iva_image;

	pthread_mutex_init(&ctx->stIvaMutex, NULL);
	pthread_cond_init(&ctx->stIvaCond, NULL);

	while (!quit) {
		ret = RK_MPI_VI_GetChnFrame(ctx->detectedViPipe, ctx->detectedViChn, &frame, 1000);
		if (ret == RK_SUCCESS) {
			RK_LOGD("iva get frame w:%d h:%d seq:%d pts:%lld\n", frame.stVFrame.u32Width,
			        frame.stVFrame.u32Height, frame.stVFrame.u32TimeRef, frame.stVFrame.u64PTS);
			++loop_count;
			tmp_frame = malloc(sizeof(VIDEO_FRAME_INFO_S));
			if (!tmp_frame) {
				RK_LOGE("[%s()] malloc failed!\n", __func__);
				RK_MPI_VI_ReleaseChnFrame(ctx->detectedViPipe, ctx->detectedViChn, &frame);
				continue;
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
			ctx->bIvaTaskDone = false;
			ret = ROCKIVA_PushFrame(ctx->ivahandle, &iva_image, NULL);
			if (ret != RK_SUCCESS) {
				RK_LOGE("[%s()] ROCKIVA_PushFrame failed %#X\n", __func__, ret);
				free(tmp_frame);
				RK_MPI_VI_ReleaseChnFrame(ctx->detectedViPipe, ctx->detectedViChn, &frame);
				continue;
			}
			pthread_mutex_lock(&ctx->stIvaMutex);
			while (!ctx->bIvaTaskDone && !quit)
				pthread_cond_wait(&ctx->stIvaCond, &ctx->stIvaMutex);
			pthread_mutex_unlock(&ctx->stIvaMutex);
		} else {
			RK_LOGE("vi pipe:%d chn:%d get frame fail", ctx->detectedViPipe, ctx->detectedViChn);
		}
	}
	pthread_mutex_destroy(&ctx->stIvaMutex);
	pthread_cond_destroy(&ctx->stIvaCond);

	return NULL;
}

#endif

static RK_S32 rtsp_init(uint32_t enCodecType) {
	RK_S32 i = 0;
	g_rtsplive = create_rtsp_demo(554);
	RK_CHAR rtspAddr[64] = {0};

	for (i = 0; i < VENC_CHN_NUM; i++) {
		sprintf(rtspAddr, "/live/%d", i);
		g_rtsp_session[i] = rtsp_new_session(g_rtsplive, rtspAddr);
		if (enCodecType == RK_VIDEO_ID_AVC) {
			rtsp_set_video(g_rtsp_session[i], RTSP_CODEC_ID_VIDEO_H264, RK_NULL, 0);
		} else if (enCodecType == RK_VIDEO_ID_HEVC) {
			rtsp_set_video(g_rtsp_session[i], RTSP_CODEC_ID_VIDEO_H265, RK_NULL, 0);
		} else {
			RK_LOGE("not support other type\n");
			return RK_SUCCESS;
		}
		rtsp_sync_video_ts(g_rtsp_session[i], rtsp_get_reltime(), rtsp_get_ntptime());
		RK_LOGI("rtsp <%s> init success", rtspAddr);
	}
	pthread_mutex_init(&g_rtsp_mutex, RK_NULL);
	return RK_SUCCESS;
}

static void save_code_stream_file(int chn, VENC_STREAM_S stFrame) {
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

void klog(const char *log) {
	FILE *fp = fopen("/dev/kmsg", "w");
	if (NULL != fp) {
		fprintf(fp, "[app]: %s", log);
		fclose(fp);
	}
}

static void *GetVencStream(void *arg) {
	void *pData = RK_NULL;
	int ret;
	int errCnt = 0, loopCount = 0;
	VENC_STREAM_S stFrame;

	VENC_CTX_S *ctx = (VENC_CTX_S *)arg;

	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	while (!quit) {
		ret = RK_MPI_VENC_GetStream(ctx->s32ChnId, &stFrame, 1000);
		if (ret == 0) {
			if (loopCount == (FASTBOOT_RESERVED_FRAME_NUM - 1) &&
			    ctx->s32ChnId == VENC_MAIN_CHANNEL)
				klog("[thunderboot_time] get venc all reserved frames");

			if (loopCount <= SAVE_ENC_FRM_CNT_MAX) {
				INFO("chn:%d, loopCount:%d enc->seq:%d, pkt_size=%lu, pts=%llu\n", ctx->s32ChnId,
				     loopCount, stFrame.u32Seq, stFrame.pstPack->u32Len, stFrame.pstPack->u64PTS);
				save_code_stream_file(ctx->s32ChnId, stFrame);
			}
#if (ENABLE_RTSP)
			// tx video to rtspls
			if (loopCount > SAVE_ENC_FRM_CNT_MAX) {
				if (g_rtsplive && g_rtsp_session[ctx->s32ChnId]) {
					pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
					pthread_mutex_lock(&g_rtsp_mutex);
					rtsp_tx_video(g_rtsp_session[ctx->s32ChnId], pData, stFrame.pstPack->u32Len,
					              stFrame.pstPack->u64PTS);
					rtsp_do_event(g_rtsplive);
					pthread_mutex_unlock(&g_rtsp_mutex);
				}
			}
#endif
			ret = RK_MPI_VENC_ReleaseStream(ctx->s32ChnId, &stFrame);
			if (ret != 0) {
				ERR("venc release chn %d failed\n", ctx->s32ChnId);
				goto __FAILED;
			}
			errCnt = 0;
			loopCount++;
		} else {
			if (errCnt < 10) {
				ERR("RK_MPI_VENC_GetChnFrame fail %x\n", ret);
			}
			errCnt++;
		}
	}

__FAILED:
	free(stFrame.pstPack);
	return NULL;
}

// TODO
RK_U64 TEST_COMM_GetNowUs() {
	struct timespec time = {0, 0};
	clock_gettime(CLOCK_MONOTONIC, &time);
	return (RK_U64)time.tv_sec * 1000000 + (RK_U64)time.tv_nsec / 1000; /* microseconds */
}

/*
 *  * get cmdline from /proc/cmdline
 *  */
static int read_cmdline_to_buf(void *buf, int len) {
	int fd;
	int ret;
	if (buf == NULL || len < 0) {
		INFO("%s: illegal para\n", __func__);
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
		INFO("get %s value: 0x%0lx\n", string, value);
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

	vir_addr_align_4k =
	    mmap(MMAP_START_FROM_ZERO, size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phy_addr);
	vir_addr_offset = phy_addr & MMAP_MASK;
	vir_addr = vir_addr_align_4k + vir_addr_offset;

	close(mem_fd);
	return vir_addr;
}

__attribute__((unused)) static int dump_virmem_hex(char *buf_dump_addr, const char *msg) {
	INFO("\ndump [%s]\n", msg);
	char *pdata = (char *)(buf_dump_addr);
	for (char j = 0; j < 64; j++) {
		INFO("%02x ", *(pdata + j) & 0xff);
		if ((j + 1) % 16 == 0) {
			INFO("\n");
		}
	}
	INFO("\n");
	return 0;
}

__attribute__((unused)) static void dump_meta_sensor_app_params(struct meta_info *handle) {
	int camId = 0;
	for (; camId < CAM_NUM; camId++) {
		INFO("\n");
		INFO("sensor[%d] init info:\n", camId);
		INFO("cam_w: %d, cam_h: %d\n", handle->sensor_init[camId]->cam_w,
		     handle->sensor_init[camId]->cam_h);

		INFO("app[%d] params info:\n", camId);
		INFO("venc_w: %d, venc_h: %d, venc_type: %d, venc_bitrate: %d, fps: %d, cam_mirror_flip: "
		     "%d, night_mode: %d, color_mode: %d\n",
		     handle->app_params->venc_w, handle->app_params->venc_h, handle->app_params->venc_type,
		     handle->app_params->venc_bitrate, handle->app_params->cam_fps,
		     handle->app_params->cam_mirror_flip, handle->app_params->night_mode,
		     handle->app_params->color_mode);
	}
	INFO("\n");
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
		handle->sensor_init[SENSOR] = (struct sensor_init_cfg *)(SensorInitVirAddr);

		SensorInitVirAddr = metaVirmem + SECONDARY_SENSOR_INIT_OFFSET;
		handle->sensor_init[SECONDARY_SENSOR] = (struct sensor_init_cfg *)(SensorInitVirAddr);

		app_param_offset = (int)get_cmd_val(RK_APP_PARAM_OFFSET, 16);
		appVirAddr = metaVirmem + app_param_offset;
		handle->app_params = (struct app_param_info *)(appVirAddr);

		return metaVirmem;
	} else {
		ERR("meta addr mmap fail.\n");
		return metaVirmem;
	}
}

static int vi_init(MPI_CTX_S *ctx) {
	int ret;
	VI_CTX_S viDev, viChn;

	/* set dev_pipe mode */
	ret = RK_MPI_VI_SetModParam(&ctx->stViModParam);
	if (ret)
		RK_LOGE("RK_MPI_VI_SetModParam fail:%#X", ret);
	memset(&ctx->stViModParam, 0, sizeof(ctx->stViModParam));
	ctx->stViModParam.enViModType = VI_DEV_PIPE_MODE;
	ret = RK_MPI_VI_GetModParam(&ctx->stViModParam);
	if (ret)
		RK_LOGE("RK_MPI_VI_GetModParam fail:%#X", ret);

	RK_LOGI("vi mod:%d  dev_pipe_mode:%d", ctx->stViModParam.enViModType,
	        ctx->stViModParam.stDevPipeModParam.enDevPipeMode);

	for (int dev = 0; dev < CAM_NUM; dev++) {
		memcpy(&viDev, &ctx->vi[dev][0], sizeof(VI_CTX_S));
		memset(&viDev.stDevAttr, 0, sizeof(viDev.stDevAttr));
		memset(&viDev.stBindPipe, 0, sizeof(viDev.stBindPipe));
		viDev.stDevAttr.u32BufCount = VICAP_OFFLINE_BUFF_CNT;

		ret = RK_MPI_VI_GetDevAttr(viDev.s32DevId, &viDev.stDevAttr);
		if (ret == RK_ERR_VI_NOT_CONFIG) {
			// INFO: It's sufficient to running dual-cam 200W15fps by single raw buf
			viDev.stDevAttr.u32BufCount = 1;
			ret = RK_MPI_VI_SetDevAttr(viDev.s32DevId, &viDev.stDevAttr);
			if (ret != 0)
				ERR("VI dev %d set attr failed ret: %d\n", viDev.s32DevId, ret);
		} else {
			ERR("VI dev %d has been configed\n", viDev.s32DevId);
		}

		ret = RK_MPI_VI_GetDevIsEnable(viDev.s32DevId);
		if (ret != 0) {
			ret = RK_MPI_VI_EnableDev(viDev.s32DevId);
			if (ret != 0)
				ERR("VI dev %d enable failed ret: %d\n", viDev.s32DevId, ret);
			viDev.stBindPipe.u32Num = 1;
			viDev.stBindPipe.PipeId[0] = viDev.s32PipeId;
			viDev.stBindPipe.bUserStartPipe[0] = true;
			ret = RK_MPI_VI_SetDevBindPipe(viDev.s32DevId, &viDev.stBindPipe);
			if (ret != 0)
				ERR("VI dev %d set bind pipe failed ret: %d\n", viDev.s32DevId, ret);
		} else {
			ERR("VI dev %d has been enabled\n", viDev.s32DevId);
		}
		for (int chn = 0; chn < VI_CHN_NUM; chn++) {
			memcpy(&viChn, &ctx->vi[dev][chn], sizeof(viChn));
			ret = RK_MPI_VI_SetChnAttr(viChn.s32PipeId, viChn.s32ChnId, &viChn.stChnAttr);
			if (ret) {
				ERR("VI pipe %d set chn %d  attr error! ret=%d\n", viChn.s32PipeId, viChn.s32ChnId,
				    ret);
				return ret;
			}

#if (ENABLE_WRAP)
			ret = RK_MPI_VI_SetChnWrapBufAttr(viChn.s32PipeId, viChn.s32ChnId, &viChn.stViWrap);
			if (ret) {
				ERR("VI pipe %d set chn %d wrap buf attr error! ret 0x%08x\n", viChn.s32PipeId,
				    viChn.s32ChnId, ret);
				return ret;
			}
#endif
			ret = RK_MPI_VI_EnableChn(viChn.s32PipeId, viChn.s32ChnId);
			if (ret) {
				ERR("create VI dev %d chn %d error! ret=%d\n", viChn.s32PipeId, viChn.s32ChnId,
				    ret);
				return ret;
			}
		}
	}
	return 0;
}

static int vi_deinit(MPI_CTX_S *ctx) {
	int ret;
	for (int dev = 0; dev < CAM_NUM; dev++) {
		for (int chn = 0; chn < VI_CHN_NUM; chn++) {
			if (ret = RK_MPI_VI_DisableChn(ctx->vi[dev][chn].s32PipeId,
			                               ctx->vi[dev][chn].s32ChnId) != 0) {
				ERR("RK_MPI_VI_DisableChn pipe:%d chn:%d fail ret:%#X\n", dev, chn, ret);
			}
		}
		if (ret = RK_MPI_VI_DisableDev(ctx->vi[dev][0].s32DevId) != 0) {
			ERR("RK_MPI_VI_DisableDev dev:%d fail ret:%#X\n", dev, ret);
		}
	}
	return 0;
}

static int venc_init(MPI_CTX_S *ctx) {
	VENC_CTX_S venc;
	int32_t ret = 0;
	for (int chn = 0; chn < VENC_CHN_NUM; chn++) {
		memcpy(&venc, &ctx->venc[chn], sizeof(venc));
		ret = RK_MPI_VENC_CreateChn(venc.s32ChnId, &venc.stChnAttr);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_CreateChn failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}

		ret = RK_MPI_VENC_SetChnRefBufShareAttr(venc.s32ChnId, &venc.stVencChnRefBufShare);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_SetChnRefBufShareAttr failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}

		ret = RK_MPI_VENC_SetRcParam(venc.s32ChnId, &venc.stRcParam);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_SetRcParam failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}

#if (ENABLE_WRAP)
		ret = RK_MPI_VENC_SetChnBufWrapAttr(venc.s32ChnId, &venc.stVencChnBufWrap);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_SetChnBufWrapAttr failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}
#endif

		ret = RK_MPI_VENC_EnableSvc(venc.s32ChnId, RK_TRUE);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_EnableSvc failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}

		ret = RK_MPI_VENC_StartRecvFrame(venc.s32ChnId, &venc.stRecvParam);
		if (ret != 0) {
			RK_LOGE("venc [%d] RK_MPI_VENC_StartRecvFrame failed: %#x!", venc.s32ChnId, ret);
			return ret;
		}
	}

	return ret;
}

static int32_t venc_deinit(MPI_CTX_S *ctx) {
	int ret = 0;
	for (int chn = 0; chn < VENC_CHN_NUM; chn++) {
		ret = RK_MPI_VENC_StopRecvFrame(ctx->venc[chn].s32ChnId);
		if (ret != 0) {
			RK_LOGE("venc %d RK_MPI_VENC_StopRecvFrame failed: %#x!!", ctx->venc[chn].s32ChnId,
			        ret);
			return ret;
		}
		ret = RK_MPI_VENC_DestroyChn(ctx->venc[chn].s32ChnId);
		if (ret != 0) {
			RK_LOGE("venc %d RK_MPI_VENC_DestroyChn failed: %#x!!", ctx->venc[chn].s32ChnId, ret);
			return ret;
		}
	}
	return ret;
}

static int32_t vi_bind_venc(bool ifBind) {
	int32_t ret;
	int vencChn = 0;
	MPP_CHN_S stSrcChn, stDestChn;
	stSrcChn.enModId = RK_ID_VI;
	stDestChn.enModId = RK_ID_VENC;

	for (int dev = 0; dev < CAM_NUM; dev++) {
		for (int chn = 0; chn < VI_CHN_NUM - 1; chn++) {
			stSrcChn.s32DevId = dev;
			stSrcChn.s32ChnId = chn;
			stDestChn.s32DevId = 0;
			stDestChn.s32ChnId = vencChn;
			if (ifBind)
				ret |= RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
			else
				ret |= RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
			vencChn++;
		}
	}
	return ret;
}

static int aiq_deinit() {
	int ret, CamId;
	for (CamId = 0; CamId < CAM_NUM; CamId++) {
		if (ret = rk_aiq_uapi2_sysctl_stop(g_aiq_ctx[CamId], false) != 0)
			ERR("func:%s line:%d aiq stop fail ret:%d", __func__, __LINE__, ret);
		rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx[CamId]);
	}
	return 0;
}

static int aiq_init_start(struct meta_info *handle, void *metaVirmem, MPI_CTX_S *ctx) {
	int cam_hdr, camId, file_size, file_size_secondary, ret;
	void *vir_iqaddr, *vir_iqaddr_scondary, *appVirAddr;
	rk_aiq_working_mode_t hdr_mode;
	rk_aiq_static_info_t aiq_static_info;
	char *sensor_name;

	file_size = (int)get_cmd_val("rk_iqbin_size", 16);
	file_size_secondary = (int)get_cmd_val("rk_iqbin_secondary_size", 16);

	vir_iqaddr = metaVirmem + SENSOR_IQ_BIN_OFFSET + offsetof(struct sensor_iq_info, data);
	vir_iqaddr_scondary = metaVirmem + SENSOR_IQ_BIN_OFFSET + SENSOR_IQ_BIN_MAX_SIZE;

#if SERVER_DEBUG_PRT
	dump_virmem_hex(vir_iqaddr, "main_aiq");
	dump_virmem_hex(vir_iqaddr_scondary, "secondary_aiq");
#endif

	cam_hdr = (int)get_cmd_val("rk_cam_hdr", 0);
	hdr_mode = (cam_hdr == 5) ? RK_AIQ_WORKING_MODE_ISP_HDR2 : RK_AIQ_WORKING_MODE_NORMAL;

	for (camId = 0; camId < CAM_NUM; camId++) {
		rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId(camId, &aiq_static_info);
		sensor_name = aiq_static_info.sensor_info.sensor_name;
		INFO("sensor name: %s\n", sensor_name);

		if (handle->app_params[0].color_mode) {
			ret = rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "night");
			INFO("------night mode------\n");
		} else {
			ret = rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "day");
			INFO("------day mode------\n");
		}
		if (ret < 0)
			ERR("%s: failed to set night scene\n", sensor_name);
		klog("preinit scene\n");

		if (camId == 0)
			ret = rk_aiq_uapi2_sysctl_preInit_iq_addr(sensor_name, vir_iqaddr, file_size);
		else
			ret = rk_aiq_uapi2_sysctl_preInit_iq_addr(sensor_name, vir_iqaddr_scondary,
			                                          file_size_secondary);
		if (ret < 0)
			ERR("%s: failed to load binary iqfiles\n", sensor_name);
		klog("preinit iq addr\n");

		rk_aiq_uapi2_sysctl_preInit_devBufCnt(sensor_name, "rkraw_rx", 2);
		g_aiq_ctx[camId] = rk_aiq_uapi2_sysctl_init(sensor_name, "/etc/iqfiles/", NULL, NULL);
		klog("aiq init\n");
		if (g_aiq_ctx[camId] == NULL)
			ERR("%s: failed to init aiq\n", sensor_name);

		if (rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx[camId], 0, 0, hdr_mode))
			ERR("rkaiq engine prepare failed !\n");
		klog("aiq prepare\n");

		if (rk_aiq_uapi2_sysctl_start(g_aiq_ctx[camId]))
			ERR("rk_aiq_uapi2_sysctl_start  failed\n");
		klog("aiq start\n");
	}
	return 0;
}

int32_t load_file_osdmem(const RK_CHAR *filename, uint8_t *pu8Virt, uint32_t u32Width,
                         uint32_t u32Height, uint32_t pixel_size, uint32_t shift_value) {
	uint32_t mem_len = u32Width;
	uint32_t read_len = mem_len * pixel_size >> shift_value;
	uint32_t read_height;
	FILE *file = NULL;

	file = fopen(filename, "rb");
	if (file == NULL) {
		RK_LOGE("open filename: %s file failed!", filename);
		return -1;
	}
	for (read_height = 0; read_height < u32Height; read_height++) {
		fread((pu8Virt + (u32Width * read_height * pixel_size >> shift_value)), 1, read_len, file);
	}
	fclose(file);
	return 0;
}

static int param_init(MPI_CTX_S *ctx, struct meta_info *handle) {
	uint32_t fps = 0, gop = 0, enType = RK_VIDEO_ID_HEVC;
	uint32_t i, enWorkMode, ret;
	VI_CHN_ATTR_S chnAttr;
	VENC_CTX_S vencCtx;

	/* VI parameters init */
	for (int dev_index = 0; dev_index < CAM_NUM; dev_index++) {
		for (int chn_index = 0; chn_index < VI_CHN_NUM; chn_index++) {
			ctx->vi[dev_index][chn_index].s32DevId = dev_index;
			ctx->vi[dev_index][chn_index].s32PipeId = dev_index;
			ctx->vi[dev_index][chn_index].s32ChnId = chn_index;
			ctx->vi[dev_index][chn_index].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
			ctx->vi[dev_index][chn_index].stChnAttr.stFrameRate.s32DstFrameRate = -1;
			ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.u32BufCount = chn_index == 2 ? 2 : 1;
			ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.enMemoryType =
			    VI_V4L2_MEMORY_TYPE_DMABUF;
			ctx->vi[dev_index][chn_index].stChnAttr.stSize.u32Width =
			    chn_index == 0 ? handle->sensor_init[dev_index]->cam_w : SUB_STREAM_WIDTH;
			ctx->vi[dev_index][chn_index].stChnAttr.stSize.u32Height =
			    chn_index == 0 ? handle->sensor_init[dev_index]->cam_h : SUB_STREAM_HEIGHT;
			ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.stMaxSize.u32Width =
			    chn_index == 0 ? handle->sensor_init[dev_index]->cam_w : SUB_STREAM_WIDTH;
			ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.stMaxSize.u32Height =
			    chn_index == 0 ? handle->sensor_init[dev_index]->cam_h : SUB_STREAM_HEIGHT;
			ctx->vi[dev_index][chn_index].stChnAttr.u32Depth =
			    chn_index == 2 ? ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.u32BufCount / 2
			                   : 0;
#if (ENABLE_WRAP)
			ctx->vi[dev_index][chn_index].stViWrap.bEnable = chn_index == 0 ? true : false;
			ctx->vi[dev_index][chn_index].stViWrap.u32BufLine =
			    ctx->vi[dev_index][chn_index].stChnAttr.stSize.u32Height / WRAP_LINE_DIV;
			ctx->vi[dev_index][chn_index].stChnAttr.enAllocBufType =
			    (dev_index == 1 && chn_index == 0) ? VI_ALLOC_BUF_TYPE_CHN_SHARE
			                                       : VI_ALLOC_BUF_TYPE_INTERNAL;
			if (dev_index == 0 && chn_index == 0) {
				ctx->vi[dev_index][chn_index].stChnAttr.stIspOpt.stMaxSize.u32Height =
				    handle->sensor_init[dev_index]->cam_h * 2;
			}
#endif
		}
	}

	/* VENC parameters init */
	fps = (uint32_t)get_cmd_val("rk_cam_fps", 10);
	RK_ASSERT(fps > 0);
	gop = fps * 2;

	memset(&vencCtx, 0, sizeof(vencCtx));

	if (handle->app_params->venc_type == 1)
		vencCtx.enCodecType = RK_VIDEO_ID_AVC;
	else
		vencCtx.enCodecType = RK_VIDEO_ID_HEVC;

	if (vencCtx.enCodecType == RK_VIDEO_ID_AVC) {
		vencCtx.stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H264VBR;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32BitRate = handle->app_params->venc_bitrate;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate = handle->app_params->venc_bitrate;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32MinBitRate = 200;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32Gop = gop;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateNum = fps;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateDen = 1;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateNum = fps;
		vencCtx.stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateDen = 1;
	} else if (vencCtx.enCodecType == RK_VIDEO_ID_HEVC) {
		vencCtx.stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H265VBR;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32BitRate = handle->app_params->venc_bitrate;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate = handle->app_params->venc_bitrate;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32MinBitRate = 200;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32Gop = gop;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateNum = fps;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateDen = 1;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateNum = fps;
		vencCtx.stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateDen = 1;
	}

	vencCtx.stChnAttr.stVencAttr.enType = vencCtx.enCodecType;
	vencCtx.stChnAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;
	if (vencCtx.enCodecType == RK_VIDEO_ID_AVC)
		vencCtx.stChnAttr.stVencAttr.u32Profile = H264E_PROFILE_HIGH;
	else if (vencCtx.enCodecType == RK_VIDEO_ID_HEVC)
		vencCtx.stChnAttr.stVencAttr.u32Profile = H265E_PROFILE_MAIN;

	vencCtx.stChnAttr.stVencAttr.u32PicWidth = handle->sensor_init[0]->cam_w;
	vencCtx.stChnAttr.stVencAttr.u32VirWidth = handle->sensor_init[0]->cam_w;
	vencCtx.stChnAttr.stVencAttr.u32PicHeight = handle->sensor_init[0]->cam_h;
	vencCtx.stChnAttr.stVencAttr.u32VirHeight = handle->sensor_init[0]->cam_h;
	vencCtx.stChnAttr.stVencAttr.u32MaxPicWidth = handle->sensor_init[0]->cam_w;
	vencCtx.stChnAttr.stVencAttr.u32MaxPicHeight = handle->sensor_init[0]->cam_h;
	vencCtx.stChnAttr.stVencAttr.u32BufSize =
	    vencCtx.stChnAttr.stVencAttr.u32PicWidth * vencCtx.stChnAttr.stVencAttr.u32PicHeight / 3;

	vencCtx.stChnAttr.stVencAttr.u32StreamBufCnt = 4;
	vencCtx.stChnAttr.stVencAttr.enMirror = MIRROR_NONE;

	vencCtx.stVencChnRefBufShare.bEnable = true;

	memset(&vencCtx.stRcParam, 0, sizeof(vencCtx.stRcParam));
	if (vencCtx.enCodecType == RK_VIDEO_ID_AVC) {
		vencCtx.stRcParam.s32FirstFrameStartQp = 28;
		vencCtx.stRcParam.stParamH264.u32MinQp = 10;
		vencCtx.stRcParam.stParamH264.u32MaxQp = 51;
		vencCtx.stRcParam.stParamH264.u32MinIQp = 10;
		vencCtx.stRcParam.stParamH264.u32MaxIQp = 51;
		vencCtx.stRcParam.stParamH264.u32FrmMinQp = 25;
		vencCtx.stRcParam.stParamH264.u32FrmMinIQp = 24;
		vencCtx.stRcParam.stParamH264.u32FrmMaxQp = 41;
		vencCtx.stRcParam.stParamH264.u32FrmMaxIQp = 35;
	} else if (vencCtx.enCodecType == RK_VIDEO_ID_HEVC) {
		vencCtx.stRcParam.s32FirstFrameStartQp = 28;
		vencCtx.stRcParam.stParamH265.u32MinQp = 10;
		vencCtx.stRcParam.stParamH265.u32MaxQp = 51;
		vencCtx.stRcParam.stParamH265.u32MinIQp = 10;
		vencCtx.stRcParam.stParamH265.u32MaxIQp = 51;
		vencCtx.stRcParam.stParamH265.u32FrmMinQp = 25;
		vencCtx.stRcParam.stParamH265.u32FrmMinIQp = 24;
		vencCtx.stRcParam.stParamH265.u32FrmMaxQp = 41;
		vencCtx.stRcParam.stParamH265.u32FrmMaxIQp = 35;
	}

	memset(&vencCtx.stRecvParam, 0, sizeof(vencCtx.stRecvParam));
	vencCtx.stRecvParam.s32RecvPicNum = -1;
	for (int venc_index = 0; venc_index < VENC_CHN_NUM; venc_index++) {
		memcpy(&ctx->venc[venc_index], &vencCtx, sizeof(vencCtx));
		ctx->venc[venc_index].s32ChnId = venc_index;
		if (venc_index == 1 || venc_index == 3) {
			if (vencCtx.enCodecType == RK_VIDEO_ID_AVC) {
				ctx->venc[venc_index].stChnAttr.stRcAttr.stH264Vbr.u32BitRate =
				    vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32BitRate / 2;
				ctx->venc[venc_index].stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate =
				    vencCtx.stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate / 2;
			} else if (vencCtx.enCodecType == RK_VIDEO_ID_HEVC) {
				ctx->venc[venc_index].stChnAttr.stRcAttr.stH265Vbr.u32BitRate =
				    vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32BitRate / 2;
				ctx->venc[venc_index].stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate =
				    vencCtx.stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate / 2;
			}
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32PicWidth = SUB_STREAM_WIDTH;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32VirWidth = SUB_STREAM_WIDTH;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32PicHeight = SUB_STREAM_HEIGHT;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32VirHeight = SUB_STREAM_HEIGHT;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32MaxPicWidth = SUB_STREAM_WIDTH;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32MaxPicHeight = SUB_STREAM_HEIGHT;
			ctx->venc[venc_index].stChnAttr.stVencAttr.u32BufSize =
			    vencCtx.stChnAttr.stVencAttr.u32BufSize / 2;
		}
#if (ENABLE_WRAP)
		ctx->venc[venc_index].stVencChnBufWrap.bEnable =
		    (venc_index == 0 || venc_index == 2) ? true : false;
		ctx->venc[venc_index].stVencChnBufWrap.u32BufLine =
		    ctx->venc[venc_index].stChnAttr.stVencAttr.u32PicHeight / WRAP_LINE_DIV;
		INFO("venc chn:%d warp_enable:%d line:%d\n", venc_index,
		     ctx->venc[venc_index].stVencChnBufWrap.bEnable,
		     ctx->venc[venc_index].stVencChnBufWrap.u32BufLine);
#endif
	}
	/* VENC parameters init END */

#if defined(ROCKIVA)
	for (int iva_index = 0; iva_index < IVA_HANDLE_NUM; iva_index++) {
		snprintf(ctx->iva[iva_index].stCommonParams.modelPath, ROCKIVA_PATH_LENGTH, "/oem/usr/lib");
		ctx->iva[iva_index].ivahandle = (RockIvaHandle)iva_index;
		ctx->iva[iva_index].detectedViPipe = iva_index;
		ctx->iva[iva_index].detectedViChn = 2;
		ctx->iva[iva_index].stCommonParams.coreMask = 0x04;
		ctx->iva[iva_index].stCommonParams.logLevel = ROCKIVA_LOG_WARN;
		ctx->iva[iva_index].stCommonParams.detModel = ROCKIVA_DET_MODEL_PFP;
		ctx->iva[iva_index].stCommonParams.imageInfo.width = SUB_STREAM_WIDTH;
		ctx->iva[iva_index].stCommonParams.imageInfo.height = SUB_STREAM_HEIGHT;
		ctx->iva[iva_index].stCommonParams.imageInfo.format = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
		ctx->iva[iva_index].stCommonParams.imageInfo.transformMode = ROCKIVA_IMAGE_TRANSFORM_NONE;
		memset(&ctx->iva[iva_index].stDetectParams, 0, sizeof(RockIvaDetTaskParams));
		ctx->iva[iva_index].stDetectParams.detObjectType |=
		    ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_PERSON);
		ctx->iva[iva_index].stDetectParams.scores[0] = 30;
		ctx->iva[iva_index].detectResultCallback = iva_detect_result_callback;
		ctx->iva[iva_index].releaseCallback = iva_frame_release_callback;
	}
#endif

	return 0;
}

#if defined(ROCKIVA)
static int iva_init(MPI_CTX_S *ctx) {
	int ret = RK_SUCCESS;
	for (int iva_index = 0; iva_index < IVA_HANDLE_NUM; iva_index++) {
		ret = ROCKIVA_Init(&ctx->iva[iva_index].ivahandle, ROCKIVA_MODE_VIDEO,
		                   &ctx->iva[iva_index].stCommonParams,
		                   &ctx->iva[iva_index] /* private data */);
		if (ret != RK_SUCCESS) {
			RK_LOGE("ROCKIVA_Init failed %#X\n", ret);
			return ret;
		}
		ret =
		    ROCKIVA_DETECT_Init(ctx->iva[iva_index].ivahandle, &ctx->iva[iva_index].stDetectParams,
		                        ctx->iva[iva_index].detectResultCallback);
		if (ret != RK_SUCCESS) {
			RK_LOGE("ROCKIVA_DETECT_Init failed %#X\n", ret);
			return ret;
		}
		ret = ROCKIVA_SetFrameReleaseCallback(ctx->iva[iva_index].ivahandle,
		                                      ctx->iva[iva_index].releaseCallback);
		if (ret != RK_SUCCESS) {
			RK_LOGE("ROCKIVA_SetFrameReleaseCallback failed %#X\n", ret);
			return ret;
		}
	}
	return ret;
}

static int iva_deinit(MPI_CTX_S *ctx) {
	int ret = RK_SUCCESS;
	for (int iva_index = 0; iva_index < IVA_HANDLE_NUM; iva_index++) {
		ret = ROCKIVA_DETECT_Release(ctx->iva[iva_index].ivahandle);
		if (ret != RK_SUCCESS)
			RK_LOGE("ROCKIVA_DETECT_Release failed %#X\n", ret);
		ret = ROCKIVA_Release(ctx->iva[iva_index].ivahandle);
		if (ret != RK_SUCCESS)
			RK_LOGE("ROCKIVA_Release failed %#X\n", ret);
	}
	return ret;
}
#endif

static void aiq_quit() {
	int camId = 0;

	for (; camId < CAM_NUM; camId++) {
		if (g_aiq_ctx[camId]) {
			klog("should quit\n");
			rk_aiq_uapi2_sysctl_stop(g_aiq_ctx[camId], false);
			klog("aiq stop\n");
			rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx[camId]);
			klog("aiq deinit\n");
		}
	}
}

static const char short_options[] = "?::m:";
static const struct option long_options[] = {
    {"mode", required_argument, NULL, 'm'}, {"help", no_argument, NULL, '?'}, {0, 0, 0, 0}};

static void usage(char *name) {
	INFO("Usage:\n");
	INFO("%s -m 3 \n", name);
	INFO("Options:\n");
	INFO("  -m, --mode         dev pipe mode, 1:all offline, 2:all online 3:left online ,"
	     "4:right online, default: -m 3\n");
	INFO("  -?, --help         Get help\n");
}

int main(int argc, char *argv[]) {
	klog("[thunderboot_time] fastboot_demo enter");
	MPI_CTX_S ctx;
	void *metaVirmem = MAP_FAILED;
	int meta_size, ret;
	struct meta_info handle = {0};
	struct sigaction action;
	int opt;
	memset(&ctx, 0, sizeof(MPI_CTX_S));
	ctx.stViModParam.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_LEFT_HALF_ONLINE;
	ctx.stViModParam.enViModType = VI_DEV_PIPE_MODE;

	while ((opt = getopt_long(argc, argv, short_options, long_options, NULL)) != -1) {
		switch (opt) {
		case 'm':
			ctx.stViModParam.stDevPipeModParam.enDevPipeMode = atoi(optarg);
			break;
		case '?':
		default:
			usage(argv[0]);
			return 0;
		}
	}

	action.sa_handler = handle_pipe;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;

	sigaction(SIGPIPE, &action, NULL);
	signal(SIGINT, sigterm_handler);

	meta_size = (uint32_t)get_cmd_val("meta_part_size", 16);
	metaVirmem = get_meta_params(&handle);
	if (metaVirmem == MAP_FAILED)
		goto __FAILED;
#if SERVER_DEBUG_PRT
	dump_meta_sensor_app_params(&handle);
#endif
	param_init(&ctx, &handle);

	/*
	 * dual cam boot
	 * sensor_0 ------>vi_0(1920x1080)----->venc_0(1920*1080)------>rtsp
	 *          ------>vi_1(640x360)------>venc_1(640x360)
	 *          ------>vi_2(640x360)------>iva
	 *
	 * sensor_1 ------>vi_0(1920x1080)------>venc_0(1920x1080)------>rtsp
	 *          ------>vi_1(640x360)------>venc_1(640x360)
	 *          ------>vi_2(640x360)------>iva
	 */
	if (RK_MPI_SYS_Init() != 0) {
		goto __FAILED;
	}
	klog("mpi sys init\n");

	if (ret = aiq_init_start(&handle, metaVirmem, &ctx) != 0) {
		ERR("aiq init start fail\n");
		goto __FAILED;
	}

	if (ret = vi_init(&ctx) != 0) {
		ERR("vi init fail\n");
		goto __FAILED;
	}

	if (ret = venc_init(&ctx) != 0) {
		ERR("venc: init fail\n");
		goto __FAILED;
	}

	vi_bind_venc(true);

	for (int pipeId = 0; pipeId < CAM_NUM; pipeId++)
		RK_MPI_VI_StartPipe(pipeId);

#if defined(ROCKIVA)
	ret = iva_init(&ctx);
	if (ret) {
		RK_LOGE("iva_init failed %#X\n", ret);
		return ret;
	}
	klog("iva_init success\n");
#endif

#if (ENABLE_RTSP)
	rtsp_init(ctx.venc[0].enCodecType);
#endif

	pthread_t venc_threads[4], nn_thread[2];
	for (int venc_chn = 0; venc_chn != 4; ++venc_chn)
		pthread_create(&venc_threads[venc_chn], NULL, GetVencStream, &ctx.venc[venc_chn]);
#if defined(ROCKIVA)
	for (int iva_index = 0; iva_index < IVA_HANDLE_NUM; iva_index++)
		pthread_create(&nn_thread[iva_index], NULL, md_nn_loop, &ctx.iva[iva_index]);
#endif
	for (int venc_chn = 0; venc_chn != 4; ++venc_chn)
		pthread_join(venc_threads[venc_chn], NULL);

#if defined(ROCKIVA)
	for (int iva_index = 0; iva_index < IVA_HANDLE_NUM; iva_index++)
		pthread_join(nn_thread[iva_index], NULL);
#endif

#if (ENABLE_RTSP)
	if (g_rtsplive)
		rtsp_del_demo(g_rtsplive);
	pthread_mutex_destroy(&g_rtsp_mutex);
#endif

#if defined(ROCKIVA)
	ret = iva_deinit(&ctx);
	if (ret) {
		RK_LOGE("iva_deinit failed ret 0x%08x\n", ret);
		return ret;
	}
#endif

	for (int pipeId = 0; pipeId < CAM_NUM; pipeId++)
		RK_MPI_VI_StopPipe(pipeId);

	vi_bind_venc(false);

__FAILED:
	venc_deinit(&ctx);

	vi_deinit(&ctx);

	aiq_deinit();
	if (metaVirmem != MAP_FAILED)
		munmap(metaVirmem, meta_size);
	INFO("app exit\n");
	return 0;
}
