// Copyright 2024 Rockchip Electronics Co., Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/mman.h>

#include "rk_mpi_sys.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vi.h"
#include "rk_mpi_mb.h"
#include <rk_aiq_user_api2_camgroup.h>
#include <rk_aiq_user_api2_imgproc.h>
#include <rk_aiq_user_api2_sysctl.h>
#include <rk_aiq_api_types_ae.h>

#include <sys/ipc.h>
#include <sys/shm.h>
#include "rtsp_demo.h"
#include "rk_gpio.h"
#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"

#define KERNEL_DEBUG_PRINT                    1
#define VENC_CHN_MAX                          8
#define AO_RECORD_DEMO_DEBUG_PRINT            0
#define ENABLE_RTSP                           1
#define SAVE_ENC_FRM_CNT_MAX                  300
#define MMAP_SIZE                             (4096UL * 50) //MMAP_SIZE = 4 * 50K
#define MMAP_MASK                             (MMAP_SIZE - 1) //MMAP_MASK = 0XFFF
#define PACKET_WITH_HEAD_INFO                 1
#define SHARE_MEMORY_SIZE                     1024 * 4
#define CMD_BUF_SIZE                          1024
// #define RKAIQ_USE_DLOPEN

#define ao_record_demo_info(fmt, ...)          printf("ao_record_demo "fmt"", ##__VA_ARGS__)
#define ao_record_demo_err(fmt, ...)           printf("ao_record_demo error "fmt"", ##__VA_ARGS__)
#if AO_RECORD_DEMO_DEBUG_PRINT
#include <stdio.h>
#define ao_record_demo_dbg(fmt, ...)           printf("ao_record_demo "fmt"", ##__VA_ARGS__)
#else
#define ao_record_demo_dbg(fmt, ...)
#endif

#ifdef RKAIQ_USE_DLOPEN
void *rkaiq_dl = NULL;
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas)(int, rk_aiq_static_info_t*);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId)(int, rk_aiq_static_info_t*);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_preInit_scene)(const char*, const char*, const char*);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr)(const char*, void *, size_t);
rk_aiq_sys_ctx_t* (*dlsym_rk_aiq_uapi2_sysctl_init)(const char*,
		const char*,
		rk_aiq_error_cb ,
		rk_aiq_metas_cb );

XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_prepare)(const rk_aiq_sys_ctx_t*,
		uint32_t  , uint32_t  ,
		rk_aiq_working_mode_t );

XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_start)(const rk_aiq_sys_ctx_t *);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_stop)(const rk_aiq_sys_ctx_t*, bool);
XCamReturn (*dlsym_rk_aiq_uapi2_sysctl_deinit)(const rk_aiq_sys_ctx_t*);
#endif

static rk_aiq_sys_ctx_t *g_aiq_ctx = NULL;

pthread_mutex_t g_rtsp_mutex = PTHREAD_MUTEX_INITIALIZER;
rtsp_demo_handle g_rtsplive = NULL;
static rtsp_session_handle g_rtsp_session_0;

static VI_CHN_BUF_WRAP_S g_stViWrap = {0};
static bool g_bWrap = false;
static uint32_t g_u32WrapLine = 0;
static char *g_sEntityName = NULL;
static bool g_quit = false;
static uint32_t g_save_isp_params_to_shm = 0;
static FILE *g_fp_video_stream = NULL, *g_fp_video_stream_packet_with_head = NULL, *g_fp_pts = NULL;
//todo test
static char g_cmd[128] = "";

static void sigterm_handler(int sig) { g_quit = true; }
void handle_pipe(int sig) { printf("%s sig = %d\n", __func__, sig); }

typedef enum {
	FILE_PTS = 0,
	FILE_VIDEO_STREAM,
	FILE_VIDEO_STREAM_WITH_HEAD,
} FILE_TYPE;

typedef struct meta_info
{
	struct app_param_info app_params;
	struct sensor_init_cfg sensor_init;
} META_INFO;

typedef struct StreamPacketHead {
	uint32_t frame_size;
	uint32_t frame_next_addr;
	uint32_t frame_cur_addr;
	//uint32_t gop; //todo is need to get frame key venc could get?
	int64_t pts;
} StreamPacketHead_S;

typedef struct ShmInfo
{
	rk_aiq_wb_gain_t gain;
	ae_queryInfo_t ExpResInfo;
	uint32_t is_write_file_end;
	uint32_t max_frame_size;
} ShmInfo_S;

typedef struct _rkVENCCHN {
	uint32_t u32Width;
	uint32_t u32Height;
	uint32_t u32Gop;
	uint32_t u32BitRate;
	uint32_t u32StreamBufCnt;
	uint32_t enCodecType;
	VENC_CHN  chn_id;
	VENC_CHN_ATTR_S stChnAttr;
	PIXEL_FORMAT_E enPixelFormat;
	VENC_RC_PARAM_S stRcParam;
	VENC_RECV_PIC_PARAM_S stRecvParam;
	VENC_CHN_REF_BUF_SHARE_S stVencChnRefBufShare;
	VENC_CHN_BUF_WRAP_S stVencChnBufWrap;
} VENC_CHN_S;


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
} MPI_CTX_S;

#ifdef RKAIQ_USE_DLOPEN
static int dlsym_rkaiq (void)
{
	rkaiq_dl = dlopen("/usr/lib/librkaiq.so", RTLD_LAZY);
	if (!rkaiq_dl) {
		ao_record_demo_err("\ndlopen /usr/lib/librkaiq.so error\n");
		return -1;
	}
	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_enumStaticMetas");
	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId");
	dlsym_rk_aiq_uapi2_sysctl_preInit_scene = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_preInit_scene");
	dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_preInit_iq_addr");
	dlsym_rk_aiq_uapi2_sysctl_init = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_init");
	dlsym_rk_aiq_uapi2_sysctl_prepare = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_prepare");
	dlsym_rk_aiq_uapi2_sysctl_start = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_start");
	dlsym_rk_aiq_uapi2_sysctl_stop = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_stop");
	dlsym_rk_aiq_uapi2_sysctl_deinit = dlsym(rkaiq_dl, "rk_aiq_uapi2_sysctl_deinit");
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
#endif

XCamReturn rk_aiq_user_api2_ae_queryExpResInfo(const rk_aiq_sys_ctx_t* ctx, ae_api_queryInfo_t* pExpResInfo);

static void execute_cmd(char *cmd)
{
	int shell_end_state = 0;
	int cmd_ret = -1;
	FILE *fp = NULL;
	char result[CMD_BUF_SIZE] = "";
	char cmd_append[CMD_BUF_SIZE] = "";

	sprintf(cmd_append, cmd);
	strcat(cmd_append, " 2>&1");

	fp = popen(cmd_append, "r");
	if (NULL == fp) {
		ao_record_demo_err("popen cmd [%s] error! reason [%s]\n", cmd_append, strerror(errno));
		goto end;
	}

	while (NULL != fgets(result, CMD_BUF_SIZE, fp)) {
		/* remove newline characters */
		if ('\n' == result[strlen(result) - 1]) {
			result[strlen(result) - 1] = '\0';
		}
	}

	/* shell end state process */
	shell_end_state = pclose(fp);
	if (shell_end_state == -1) {
		ao_record_demo_err("pclose error! reason [%s]\n", strerror(errno));
		goto end;
	}
	ao_record_demo_dbg("shell end state [%d]\n", shell_end_state);
	if (!WIFEXITED(shell_end_state)) {
		ao_record_demo_err("Run cmd [%s] error! reason [%s]\n", cmd_append, strerror(errno));
		goto end;
	} else {
		cmd_ret = WEXITSTATUS(shell_end_state);
	}

end:
	if (NULL == fp || -1 == shell_end_state) {
		strncpy(result, strerror(errno), CMD_BUF_SIZE);
		// printf("errno = %s\n", strerror(errno));
	}

	fp = NULL;
	if (cmd_ret != 0) {
		ao_record_demo_err("cmd [%s] execute failed! reason [%s]\n", cmd_append, result);
		exit(-1);
	} else {
		ao_record_demo_info("cmd [%s] execute successful!\n", cmd_append);
	}
}

/*
 * get cmdline from /proc/cmdline
 */
static int read_cmdline_to_buf(void *buf, int len) {
	int fd;
	int ret;
	if (buf == NULL || len < 0) {
		ao_record_demo_err("%s: illegal para\n", __func__);
		return -1;
	}
	memset(buf, 0, len);
	fd = open("/proc/cmdline", O_RDONLY);
	if (fd < 0) {
		ao_record_demo_err("file /proc/cmdline open failed! reason [%s]\n", strerror(errno));
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
		ao_record_demo_info("get [%s] value: [0x%0lx]\n", string, value);
	}
	return value;
}

static void* mmap_memory_to_viraddr(off_t phy_addr, size_t size)
{
	void *vir_addr, *vir_addr_align_4k;
	int mem_fd, vir_addr_offset;

	if((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0)
	{
		ao_record_demo_err("Open [/dev/mem] failed! reason[%s]\n", strerror(errno));
		exit(-1);
	}

	vir_addr_align_4k = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phy_addr);
	vir_addr_offset = phy_addr & MMAP_MASK;
	vir_addr = vir_addr_align_4k + vir_addr_offset;

	close(mem_fd);
	return vir_addr;
}

static void* get_meta_params(struct meta_info *handle) {
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
		ao_record_demo_err("meta addr mmap fail\n");
		return metaVirmem;
	}
}

__attribute__((unused)) static void meta_params_dump(struct meta_info *handle) {
	ao_record_demo_dbg("meta sensor info dump\n");
	ao_record_demo_dbg("head [0x%08x] len [0x%08x] crc [0x%08x]\n",
			   handle->sensor_init.head,
			   handle->sensor_init.len,
			   handle->sensor_init.crc32);
	ao_record_demo_dbg("cam_w [%d]\n", handle->sensor_init.cam_w);
	ao_record_demo_dbg("cam_h [%d]\n", handle->sensor_init.cam_h);
	ao_record_demo_dbg("als_type [%d]\n", handle->sensor_init.als_type);
	ao_record_demo_dbg("als_value [%d]\n", handle->sensor_init.als_value);
	ao_record_demo_dbg("meta app params dump\n");
	ao_record_demo_dbg("head [0x%08x] len [0x%08x]\n",
			   handle->sensor_init.head,
			   handle->sensor_init.len);
	ao_record_demo_dbg("cam_mirror_flip [%d]\n", handle->app_params.cam_mirror_flip);
	ao_record_demo_dbg("cam_fps [%d]\n", handle->app_params.cam_fps);
	ao_record_demo_dbg("night_mode [%d]\n", handle->app_params.night_mode);
	ao_record_demo_dbg("color_mode [%d]\n", handle->app_params.color_mode);
	ao_record_demo_dbg("venc_w [%d]\n", handle->app_params.venc_w);
	ao_record_demo_dbg("venc_h [%d]\n", handle->app_params.venc_h);
	ao_record_demo_dbg("fastae_max_frame [%d]\n", handle->app_params.fastae_max_frame);
}

uint64_t TEST_COMM_GetNowUs() {
	struct timespec time = {0, 0};
	clock_gettime(CLOCK_MONOTONIC, &time);
	return (uint64_t)time.tv_sec * 1000000 + (uint64_t)time.tv_nsec / 1000; /* microseconds */
}

static void write_data_to_file(int32_t chn, VENC_STREAM_S stFrame, StreamPacketHead_S *HeadInfo, uint32_t FileType)
{
	void *pData = RK_NULL;
	FILE *file = NULL;

	switch (FileType) {
		case FILE_PTS:
			file = g_fp_pts;
			break;
		case FILE_VIDEO_STREAM:
			file = g_fp_video_stream;
			break;
		case FILE_VIDEO_STREAM_WITH_HEAD:
			file = g_fp_video_stream_packet_with_head;
			break;
		default:
			ao_record_demo_err("unsupport file type\n");
			exit(-1);
	}

	if (FileType == FILE_VIDEO_STREAM_WITH_HEAD) {
		HeadInfo->frame_size = stFrame.pstPack->u32Len;
		if (HeadInfo->frame_next_addr) {
			HeadInfo->frame_cur_addr = HeadInfo->frame_next_addr;
		} else {
			HeadInfo->frame_cur_addr = 0;
		}
		HeadInfo->frame_next_addr = HeadInfo->frame_cur_addr + sizeof(StreamPacketHead_S) + HeadInfo->frame_size;
		//ao_record_demo_dbg("frame_size %d cur_addr %d, next_addr %d\n",
		//		   HeadInfo->frame_size,
		//		   HeadInfo->frame_cur_addr,
		//		   HeadInfo->frame_next_addr);
	}
	//ao_record_demo_dbg("file_fp [%p] filetype [%d] pts_fp [%p] video_stream_fp [%p] video_stream_with_head_fp [%p]\n",
	//		   file, FileType, g_fp_pts, g_fp_video_stream, g_fp_video_stream_packet_with_head);

	if (file) {
		if (FileType == FILE_VIDEO_STREAM || FileType == FILE_VIDEO_STREAM_WITH_HEAD) {
			if (FileType == FILE_VIDEO_STREAM_WITH_HEAD) {
				if (fwrite(HeadInfo, 1, sizeof(StreamPacketHead_S), file) != sizeof(StreamPacketHead_S)) {
					ao_record_demo_err("[%s %d] fwrite error! size [%d] reason [%s]\n",
							   __func__, __LINE__, sizeof(StreamPacketHead_S), strerror(errno));
					exit(-1);
				}
			}
			pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
			if (fwrite(pData, 1, stFrame.pstPack->u32Len, file) != stFrame.pstPack->u32Len) {
				ao_record_demo_err("[%s %d] fwrite error! size [%d] reason [%s]\n", __func__, __LINE__, stFrame.pstPack->u32Len, strerror(errno));
				exit(-1);
			}
			fflush(file);
		}

		if(FileType == FILE_PTS) {
			uint64_t nowUs = TEST_COMM_GetNowUs();
			char str[128];

			snprintf(str, sizeof(str), "seq:%u, pts:%llums\n", stFrame.u32Seq,
			         stFrame.pstPack->u64PTS / 1000);
			fputs(str, file);
			fsync(fileno(file));
		}
	}
}

static void dump_share_memory_info(ShmInfo_S* ShareMemory)
{
	assert(ShareMemory);

	ao_record_demo_info("Share memory WBGain=[%f %f %f %f]\n",
	       ShareMemory->gain.rgain,
	       ShareMemory->gain.grgain,
	       ShareMemory->gain.gbgain,
	       ShareMemory->gain.bgain);
	ao_record_demo_info("Share memory gain/time[%f %f]\n",
	       ShareMemory->ExpResInfo.linExpInfo.expParam.analog_gain,
	       ShareMemory->ExpResInfo.linExpInfo.expParam.integration_time);
	ao_record_demo_info("write file end[%d]\n", ShareMemory->is_write_file_end);
	ao_record_demo_info("max frame size[%d]\n", ShareMemory->max_frame_size);
}

static void *GetVencStream(void *arg) {
	(void)arg;
	void *pData = NULL;
	uint32_t loopCount = 0, max_frame_size = 0;
	int32_t chn = 0;
	int32_t ret = 0;
	ShmInfo_S ShmInfo = {0};
	rk_aiq_wb_gain_t gain = {0};
	ae_queryInfo_t ExpResInfo = {0};
	key_t key;
	ShmInfo_S* ShareMemory = NULL;
	int shmid = 0;
	struct shmid_ds ShareMemoryStatus;
	float exp_gain = 0, exp_time = 0;
	VENC_STREAM_S stFrame;
	StreamPacketHead_S HeadInfo = {0};
	char StreamPath[128] = "", StreamWithHeadPath[128] = "", PtsPath[128] = "", KeyPath[30] = "";

	/*
	 * Use 4kbytes share memory to transfer message between ao_record_demo and ao_record_service
	 *
	 * The information is show as follow:
	 * 1. The ISP parameters of first frame in full resolution mode
	 *    [r gr gb b] wbgain
	 *    [gain time] exp
	 * 2. max frame size for muxer process
	 * 3. file process end descriptor in ao_record_demo to assure the muxer process after all frames
	 *    have been processed and writed to file
	 */
	sprintf(KeyPath, "/tmp/");
	// Get the descriptor of share memory
	key = ftok(KeyPath, 0x03);
	if (key == -1) {
		ao_record_demo_err("key ftok error reason [%s]\n", strerror(errno));
		exit(-1);
	}
	ao_record_demo_dbg("key [%d] keypath %s\n", key, KeyPath);
	// Create share memory
	shmid = shmget(key, SHARE_MEMORY_SIZE, IPC_CREAT | 0666);
	if (shmid == -1) {
		ao_record_demo_err("shmget failed key [%d] keypath %s reason[%s]\n", key, KeyPath, strerror(errno));
		exit(-1);
	}
	// Allow the process to access share memory
	ShareMemory = (ShmInfo_S *)shmat(shmid, 0, 0);
	// get share memory status
	shmctl(shmid, IPC_STAT, &ShareMemoryStatus);

	sprintf(PtsPath, "/tmp/pts.txt");
	sprintf(StreamPath, "/tmp/venc%d.bin", chn);
	sprintf(StreamWithHeadPath, "/tmp/venc%d_with_head.bin", chn);

	g_fp_pts = fopen(PtsPath, "wb");
	if (g_fp_pts == NULL) {
		ao_record_demo_err("open file %s failed! reason [%s]\n", PtsPath, strerror(errno));
		exit(-1);
	}
	ao_record_demo_dbg("fopen file %s success\n", PtsPath);
	g_fp_video_stream = fopen(StreamPath, "wb");
	if (g_fp_video_stream == NULL) {
		ao_record_demo_err("open file %s failed! reason[%s]\n", StreamPath, strerror(errno));
		exit(-1);
	}
	ao_record_demo_dbg("fopen file %s success\n", StreamPath);
	g_fp_video_stream_packet_with_head = fopen(StreamWithHeadPath, "wb");
	if (g_fp_video_stream_packet_with_head == NULL) {
		ao_record_demo_err("open file %s failed! reason[%s]\n", StreamWithHeadPath, strerror(errno));
		exit(-1);
	}
	ao_record_demo_dbg("fopen file %s success\n", StreamWithHeadPath);

	stFrame.pstPack = malloc(sizeof(VENC_PACK_S));

	while (!g_quit) {
		ret = RK_MPI_VENC_GetStream(0, &stFrame, -1);
		if (ret == RK_SUCCESS) {
			if (loopCount <= SAVE_ENC_FRM_CNT_MAX) {
				/* only print first 30 frames info */
				if (loopCount <= 30)
					ao_record_demo_info("chn [%d] loopCount [%d] enc->seq [%d] pkt_size [%lu] pts [%llu]\n", chn, loopCount,
							   stFrame.u32Seq, stFrame.pstPack->u32Len, stFrame.pstPack->u64PTS);
				write_data_to_file(chn, stFrame, &HeadInfo, FILE_PTS);
				write_data_to_file(chn, stFrame, &HeadInfo, FILE_VIDEO_STREAM);
				write_data_to_file(chn, stFrame, &HeadInfo, FILE_VIDEO_STREAM_WITH_HEAD);
				if (loopCount == SAVE_ENC_FRM_CNT_MAX) {
					ao_record_demo_info("save frame end frame amount [%d]\n", SAVE_ENC_FRM_CNT_MAX);
				}
			}

			/* get max frame size */
			if (max_frame_size < stFrame.pstPack->u32Len) {
				max_frame_size = stFrame.pstPack->u32Len;
			}

			if (loopCount == SAVE_ENC_FRM_CNT_MAX) {
				execute_cmd("mv /tmp/venc0_with_head.bin /mnt/sdcard/");
				execute_cmd("mv /tmp/venc0.bin /mnt/sdcard/");
				execute_cmd("mv /tmp/srcLarge_2560x1472_420SP.yuv /mnt/sdcard/");
				ShmInfo.is_write_file_end = 1;
				ShmInfo.max_frame_size = max_frame_size;
				memcpy(ShareMemory, &ShmInfo, sizeof(ShmInfo_S));
				dump_share_memory_info(ShareMemory);
			}
#if (ENABLE_RTSP)
			// tx video to rtspls
			if (g_rtsplive && g_rtsp_session_0 && chn == 0) {
				pData = (void *)RK_MPI_MB_Handle2VirAddr(stFrame.pstPack->pMbBlk);
				rtsp_tx_video(g_rtsp_session_0, pData, stFrame.pstPack->u32Len,
					      stFrame.pstPack->u64PTS);
				rtsp_do_event(g_rtsplive);
			}
#endif

			/* save first frame wbgain and exp to share memory for preroll image process */
			if (g_save_isp_params_to_shm && loopCount == 0) {
				rk_aiq_uapi2_getWBGain(g_aiq_ctx, &ShmInfo.gain);
				ao_record_demo_info("get WBGain [r gr gb b] = [%f %f %f %f]\n",
						    ShmInfo.gain.rgain,
						    ShmInfo.gain.grgain,
						    ShmInfo.gain.gbgain,
						    ShmInfo.gain.bgain);
				rk_aiq_user_api2_ae_queryExpResInfo(g_aiq_ctx, &ShmInfo.ExpResInfo);
				ao_record_demo_info("gain [%f] time [%f]\n",
						    ShmInfo.ExpResInfo.linExpInfo.expParam.analog_gain,
						    ShmInfo.ExpResInfo.linExpInfo.expParam.integration_time);

				memcpy(ShareMemory, &ShmInfo, sizeof(ShmInfo_S));
			}

			ret = RK_MPI_VENC_ReleaseStream(0, &stFrame);
			loopCount++;
		} else {
			ao_record_demo_err("RK_MPI_VENC_GetChnFrame fail! ret [0x%08x]\n", ret);
			usleep(1000 * 1000);
		}
		usleep(10 * 1000);
	}

	if (g_fp_pts)
		fclose(g_fp_pts);
	if (g_fp_video_stream)
		fclose(g_fp_video_stream);
	if (g_fp_video_stream_packet_with_head)
		fclose(g_fp_video_stream_packet_with_head);

	ret = shmdt(ShareMemory);
	if (ret == -1) {
		ao_record_demo_err("shmdt failed reason[%s]\n", strerror(errno));
		exit(-1);
	}
	ret = shmctl(shmid, IPC_RMID, &ShareMemoryStatus);
	if (ret == -1) {
		ao_record_demo_err("shmctl failed reason[%s]\n", strerror(errno));
		exit(-1);
	}

	free(stFrame.pstPack);
	return NULL;
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

static void mpi_params_init(MPI_CTX_S *ctx, struct meta_info *handle)
{
	int vi_buf_cnt = 1;
	uint32_t fps = 0, gop = 0;

	/* wrap params init */
	if (g_bWrap == true) {
		g_u32WrapLine = handle->app_params.venc_h / 16; // 1 / 4 height wrap
		vi_buf_cnt = 3;
		ctx->vi.dev.chn[0].stViWrap.bEnable = g_bWrap;
		ctx->vi.dev.chn[0].stViWrap.u32BufLine = g_u32WrapLine;
		ctx->vi.dev.chn[0].stViWrap.u32WrapBufferSize = g_u32WrapLine * handle->sensor_init.cam_w * 3 / 2;
		ctx->venc.chn[0].stVencChnBufWrap.bEnable = g_bWrap;
		ctx->venc.chn[0].stVencChnBufWrap.u32BufLine = g_u32WrapLine;
	}
	/* vi params init */
	ctx->vi.dev.dev_id = 0;
	ctx->vi.pipe.pipe_id = 0;
	ctx->vi.dev.chn[0].chn_id = 0;
	ctx->vi.dev.chn[0].stChnAttr.stSize.u32Width = handle->app_params.venc_w;
	ctx->vi.dev.chn[0].stChnAttr.stSize.u32Height = handle->app_params.venc_h;
	ctx->vi.dev.chn[0].stChnAttr.stIspOpt.u32BufCount = vi_buf_cnt;
	ctx->vi.dev.chn[0].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi.dev.chn[0].stChnAttr.stIspOpt.stMaxSize.u32Width = handle->sensor_init.cam_w;
	ctx->vi.dev.chn[0].stChnAttr.stIspOpt.stMaxSize.u32Height = handle->sensor_init.cam_h;
	ctx->vi.dev.chn[0].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi.dev.chn[0].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi.dev.chn[0].stChnAttr.u32Depth = 1;
	ctx->vi.dev.chn[0].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi.dev.chn[0].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	/* venc params init */
	ctx->venc.chn[0].chn_id = 0;
	fps = (uint32_t)get_cmd_val("rk_cam_fps", 10);
	RK_ASSERT(fps > 0);
	gop = fps * 2;

	if (handle->app_params.venc_type == 1)
		ctx->venc.chn[0].stChnAttr.stVencAttr.enType = RK_VIDEO_ID_AVC;
	else
		ctx->venc.chn[0].stChnAttr.stVencAttr.enType = RK_VIDEO_ID_HEVC;

	if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC) {
		ctx->venc.chn[0].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H264VBR;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32BitRate = handle->app_params.venc_bitrate;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32MaxBitRate = handle->app_params.venc_bitrate;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32MinBitRate = 200;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32Gop = gop;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateNum = fps;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.u32SrcFrameRateDen = 1;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateNum = fps;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH264Vbr.fr32DstFrameRateDen = 1;
	} else if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC) {
		ctx->venc.chn[0].stChnAttr.stRcAttr.enRcMode = VENC_RC_MODE_H265VBR;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32BitRate = handle->app_params.venc_bitrate;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32MaxBitRate = handle->app_params.venc_bitrate;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32MinBitRate = 200;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32Gop = gop;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateNum = fps;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.u32SrcFrameRateDen = 1;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateNum = fps;
		ctx->venc.chn[0].stChnAttr.stRcAttr.stH265Vbr.fr32DstFrameRateDen = 1;
	}

	ctx->venc.chn[0].stChnAttr.stVencAttr.enPixelFormat = RK_FMT_YUV420SP;
	if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC)
		ctx->venc.chn[0].stChnAttr.stVencAttr.u32Profile = H264E_PROFILE_HIGH;
	else if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC)
		ctx->venc.chn[0].stChnAttr.stVencAttr.u32Profile = H265E_PROFILE_MAIN;

	ctx->venc.chn[0].stChnAttr.stVencAttr.u32PicWidth = handle->app_params.venc_w;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32VirWidth = handle->app_params.venc_w;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32PicHeight = handle->app_params.venc_h;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32VirHeight = handle->app_params.venc_h;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32MaxPicWidth = handle->app_params.venc_w;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32MaxPicHeight = handle->app_params.venc_h;
	ctx->venc.chn[0].stChnAttr.stVencAttr.u32BufSize = handle->app_params.venc_w * handle->app_params.venc_h / 2;

	ctx->venc.chn[0].stChnAttr.stVencAttr.u32StreamBufCnt = 3;
	ctx->venc.chn[0].stChnAttr.stVencAttr.enMirror = MIRROR_NONE;

	ctx->venc.chn[0].stVencChnRefBufShare.bEnable = true;

	memset(&ctx->venc.chn[0].stRcParam, 0, sizeof(VENC_RC_PARAM_S));
	if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_AVC) {
		ctx->venc.chn[0].stRcParam.s32FirstFrameStartQp = 28;
		ctx->venc.chn[0].stRcParam.stParamH264.u32MinQp = 10;
		ctx->venc.chn[0].stRcParam.stParamH264.u32MaxQp = 51;
		ctx->venc.chn[0].stRcParam.stParamH264.u32MinIQp = 10;
		ctx->venc.chn[0].stRcParam.stParamH264.u32MaxIQp = 51;
		ctx->venc.chn[0].stRcParam.stParamH264.u32FrmMinQp = 25;
		ctx->venc.chn[0].stRcParam.stParamH264.u32FrmMinIQp = 24;
		ctx->venc.chn[0].stRcParam.stParamH264.u32FrmMaxQp = 41;
		ctx->venc.chn[0].stRcParam.stParamH264.u32FrmMaxIQp = 35;
	} else if (ctx->venc.chn[0].stChnAttr.stVencAttr.enType == RK_VIDEO_ID_HEVC) {
		ctx->venc.chn[0].stRcParam.s32FirstFrameStartQp = 28;
		ctx->venc.chn[0].stRcParam.stParamH265.u32MinQp = 10;
		ctx->venc.chn[0].stRcParam.stParamH265.u32MaxQp = 51;
		ctx->venc.chn[0].stRcParam.stParamH265.u32MinIQp = 10;
		ctx->venc.chn[0].stRcParam.stParamH265.u32MaxIQp = 51;
		ctx->venc.chn[0].stRcParam.stParamH265.u32FrmMinQp = 25;
		ctx->venc.chn[0].stRcParam.stParamH265.u32FrmMinIQp = 24;
		ctx->venc.chn[0].stRcParam.stParamH265.u32FrmMaxQp = 41;
		ctx->venc.chn[0].stRcParam.stParamH265.u32FrmMaxIQp = 35;
	}

	memset(&ctx->venc.chn[0].stRecvParam, 0, sizeof(VENC_RECV_PIC_PARAM_S));
	ctx->venc.chn[0].stRecvParam.s32RecvPicNum = -1;
}

static int32_t vi_init(VI_CTX_S *ctx)
{
	int32_t ret;

	ret = RK_MPI_VI_GetDevAttr(ctx->dev.dev_id, &ctx->dev.stDevAttr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		ret = RK_MPI_VI_SetDevAttr(ctx->dev.dev_id, &ctx->dev.stDevAttr);
		if (ret != RK_SUCCESS) {
			ao_record_demo_err("VI dev [%d] set attr failed! ret [0x%08x]\n", ctx->dev.dev_id, ret);
			return ret;
		}
	} else {
		ao_record_demo_err("VI dev [%d] has been configed! ret [0x%08x]\n", ctx->dev.dev_id, ret);
		return ret;
	}

	ret = RK_MPI_VI_GetDevIsEnable(ctx->dev.dev_id);
	if (ret != RK_SUCCESS) {
		ret = RK_MPI_VI_EnableDev(ctx->dev.dev_id);
		if (ret != RK_SUCCESS) {
			ao_record_demo_err("VI dev [%d] enable failed! ret [0x%08x]\n", ctx->dev.dev_id, ret);
			return ret;
		}
		ctx->pipe.stBindPipe.u32Num = 1;
		ctx->pipe.stBindPipe.PipeId[0] = ctx->pipe.pipe_id;
		ret = RK_MPI_VI_SetDevBindPipe(ctx->dev.dev_id, &ctx->pipe.stBindPipe);
		if (ret != 0) {
			ao_record_demo_err("VI dev [%d] set bind pipe failed! ret [0x%08x]\n", ctx->dev.dev_id, ret);
			return ret;
		}
	} else {
		ao_record_demo_err("VI dev [%d] has been enabled\n", ctx->dev.dev_id);
		return ret;
	}

	ret = RK_MPI_VI_SetChnAttr(ctx->dev.dev_id, ctx->dev.chn[0].chn_id, &ctx->dev.chn[0].stChnAttr);
	if (ret) {
		ao_record_demo_err("VI dev [%d] set chn [%d] attr error! ret [0x%08x]\n", ctx->dev.dev_id, ctx->dev.chn[0].chn_id, ret);
		return ret;
	}

	if (g_bWrap) {
		ret = RK_MPI_VI_SetChnWrapBufAttr(ctx->dev.dev_id, ctx->dev.chn[0].chn_id, &ctx->dev.chn[0].stViWrap);
		if (ret) {
			ao_record_demo_err("VI dev [%d] set chn [%d] wrap buf attr error! ret [0x%08x]\n", ctx->dev.dev_id, ctx->dev.chn[0].chn_id, ret);
			return ret;
		}
	}

	ret = RK_MPI_VI_EnableChn(ctx->dev.dev_id, ctx->dev.chn[0].chn_id);
	if (ret) {
		ao_record_demo_err("create VI dev [%d] chn [%d] error! ret [0x%08x]\n", ctx->dev.dev_id, ctx->dev.chn[0].chn_id, ret);
		return ret;
	}

	return ret;
}

static int32_t vi_deinit(VI_CTX_S *ctx)
{
	int ret;

	ret = RK_MPI_VI_DisableChn(ctx->dev.dev_id, ctx->dev.chn[0].chn_id);
	if (ret != 0) {
		ao_record_demo_err("[%s] vi dev [%d] chn [%d] disable failed! ret [0x%08x]\n",
				   __func__, ctx->dev.dev_id, ctx->dev.chn[0].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VI_DisableDev(ctx->dev.dev_id);
	if (ret != 0) {
		ao_record_demo_err("[%s] vi dev [%d] disable failed! ret [0x%08x]\n",
				   __func__, ctx->dev.dev_id, ret);
		return ret;
	}

	return ret;
}

static int32_t venc_init(VENC_CTX_S *ctx)
{
	int32_t ret = 0;

	ret = RK_MPI_VENC_CreateChn(ctx->chn[0].chn_id, &ctx->chn[0].stChnAttr);
	if (ret != 0) {
		ao_record_demo_err("venc chn [%d] RK_MPI_VENC_CreateChn failed! ret [0x%08x]\n",
				   ctx->chn[0].chn_id, ret);
		return ret;
	}

	if (g_bWrap) {
		ret = RK_MPI_VENC_SetChnBufWrapAttr(ctx->chn[0].chn_id, &ctx->chn[0].stVencChnBufWrap);
		if (ret != 0) {
			ao_record_demo_err("venc chn [%d] RK_MPI_VENC_SetChnBufWrapAttr failed! ret [0x%08x]\n",
					   ctx->chn[0].chn_id, ret);
			return ret;
		}
	}

	ret = RK_MPI_VENC_SetChnRefBufShareAttr(ctx->chn[0].chn_id, &ctx->chn[0].stVencChnRefBufShare);
	if (ret != 0) {
		ao_record_demo_err("venc chn [%d] RK_MPI_VENC_SetChnRefBufShareAttr failed! ret [0x%08x]\n",
				   ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_SetRcParam(ctx->chn[0].chn_id, &ctx->chn[0].stRcParam);
	if (ret != 0) {
		ao_record_demo_err("venc chn [%d] RK_MPI_VENC_SetRcParam failed! ret [0x%08x]\n",
				   ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_EnableSvc(ctx->chn[0].chn_id, RK_TRUE);
	if (ret != 0) {
		ao_record_demo_err("venc chn [%d] RK_MPI_VENC_EnableSvc failed! ret [0x%08x]\n",
				   ctx->chn[0].chn_id, ret);
		return ret;
	}

	ret = RK_MPI_VENC_StartRecvFrame(ctx->chn[0].chn_id, &ctx->chn[0].stRecvParam);
	if (ret != 0) {
		ao_record_demo_err("venc chn [%d] RK_MPI_VENC_StartRecvFrame failed! ret [0x%08x]\n",
				   ctx->chn[0].chn_id, ret);
		return ret;
	}

	return ret;
}

static int32_t venc_deinit(VENC_CTX_S *ctx)
{
	int32_t ret = 0;

	ret = RK_MPI_VENC_StopRecvFrame(ctx->chn[0].chn_id);
	if (ret != 0) {
		ao_record_demo_err("[%s] venc chn [%d] stop failed! ret [0x%08x]\n",
			__func__, ctx->chn[0].chn_id, ret);
		return ret;
	}
	ret = RK_MPI_VENC_DestroyChn(ctx->chn[0].chn_id);
	if (ret != 0) {
		ao_record_demo_err("[%s] venc chn [%d] destory failed! ret [0x%08x]\n",
			__func__, ctx->chn[0].chn_id, ret);
		return ret;
	}

	return ret;
}

static int32_t  vi_bind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 0;
	stSrcChn.s32ChnId   = 0;
	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 0;
	ret = RK_MPI_SYS_Bind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_demo_err("VI dev [0] chn [0] bind VENC dev [0] chn [0] failed! ret [0x%08x]\n", ret);

	return ret;
}

static int32_t vi_unbind_venc()
{
	int32_t ret;
	MPP_CHN_S stSrcChn, stDestChn;

	memset(&stSrcChn, 0, sizeof(stSrcChn));
	memset(&stDestChn, 0, sizeof(stDestChn));
	stSrcChn.enModId    = RK_ID_VI;
	stSrcChn.s32DevId   = 0;
	stSrcChn.s32ChnId   = 0;
	stDestChn.enModId   = RK_ID_VENC;
	stDestChn.s32DevId  = 0;
	stDestChn.s32ChnId  = 0;
	ret = RK_MPI_SYS_UnBind(&stSrcChn, &stDestChn);
	if (ret != 0)
		ao_record_demo_err("VI dev [0] chn [0] unbind VENC dev [0] chn [0] failed! ret [0x%08x]\n", ret);

	return ret;
}

static void rtsp_init()
{
	g_rtsplive = create_rtsp_demo(554);
	g_rtsp_session_0 = rtsp_new_session(g_rtsplive, "/live/0");
	rtsp_set_video(g_rtsp_session_0, RTSP_CODEC_ID_VIDEO_H264, NULL, 0);
	rtsp_sync_video_ts(g_rtsp_session_0, rtsp_get_reltime(), rtsp_get_ntptime());
}

static int aiq_init(struct meta_info *handle, void *metaVirmem, MPI_CTX_S *ctx)
{
	int camId = 0, file_size = 0, ret = 0;
	void *vir_iqaddr, *appVirAddr;
	rk_aiq_static_info_t aiq_static_info;
	char *sensor_name;

	file_size = (int)get_cmd_val("rk_iqbin_size", 16);

	vir_iqaddr = metaVirmem + SENSOR_IQ_BIN_OFFSET + offsetof(struct sensor_iq_info, data);

	dlsym_rk_aiq_uapi2_sysctl_enumStaticMetas(camId, &aiq_static_info);
	sensor_name = aiq_static_info.sensor_info.sensor_name;
	ao_record_demo_info("sensor name: [%s]\n", sensor_name);

	if (handle->app_params.color_mode) {
		ret = dlsym_rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "night");
		ao_record_demo_info("aiq preinit night scene\n");
	} else {
		ret = dlsym_rk_aiq_uapi2_sysctl_preInit_scene(sensor_name, "normal", "day");
		ao_record_demo_info("aiq preinit day scene\n");
	}
	if (ret < 0)
		ao_record_demo_err("[%s]: failed to set night scene\n", sensor_name);
	klog("preinit scene\n");

	ret = dlsym_rk_aiq_uapi2_sysctl_preInit_iq_addr(sensor_name, vir_iqaddr, file_size);
	if (ret < 0)
		ao_record_demo_err("[%s]: failed to load binary iqfiles\n", sensor_name);
	klog("preinit iq addr\n");

	g_aiq_ctx = dlsym_rk_aiq_uapi2_sysctl_init(sensor_name, "/etc/iqfiles/", NULL, NULL);
	klog("aiq init\n");
	if (g_aiq_ctx == NULL)
		ao_record_demo_err("[%s]: failed to init aiq\n", sensor_name);

	return 0;
}

static int aiq_run()
{
	int cam_hdr = 0, ret = 0;
	rk_aiq_working_mode_t hdr_mode;

	cam_hdr = (int)get_cmd_val("rk_cam_hdr", 0);
	hdr_mode = (cam_hdr == 5) ? RK_AIQ_WORKING_MODE_ISP_HDR2 : RK_AIQ_WORKING_MODE_NORMAL;

	ret = dlsym_rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx, 0, 0, hdr_mode);
	if (ret < 0)
		ao_record_demo_err("rkaiq engine prepare failed !\n");
	klog("aiq prepare\n");
	ret = dlsym_rk_aiq_uapi2_sysctl_start(g_aiq_ctx);
	if (ret < 0)
		ao_record_demo_err("rk_aiq_uapi2_sysctl_start failed\n");
	klog("aiq start\n");

	return ret;
}

static void aiq_stop()
{
	dlsym_rk_aiq_uapi2_sysctl_stop(g_aiq_ctx, false);
}

static void aiq_deinit()
{
	dlsym_rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx);
}

static void *get_yuv_frame_thread(void *arg) {
	VI_CTX_S *ctx = (VI_CTX_S *)arg;
	int32_t pipeId = 0, channelId = 0, loopCount = 0, loopCountBak = 0, loopErrCnt = 0;
	int32_t waitTime = 3000, ret = RK_FAILURE, yuv_seq = 0;
	void *pData = RK_NULL;
	VIDEO_FRAME_INFO_S stViFrame = {0};
	VI_CHN_STATUS_S stChnStatus = {0};
	FILE *yuv_fp = NULL;

	/* get yuv chn frame */
	ret = RK_MPI_VI_GetChnFrame(pipeId, channelId, &stViFrame, waitTime);
	if (ret == RK_SUCCESS) {
		void *data = RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk);
		RK_U64 phyAddr = RK_MPI_MB_Handle2PhysAddr(stViFrame.stVFrame.pMbBlk);
		ao_record_demo_info("RK_MPI_VI_GetChnFrame hd [%p] data [%p] phyaddr [0x%08x] loop [%d] seq [%d] pts [%lldms] len [%d]\n",
				    RK_MPI_MB_VirAddr2Handle(data),
				    data,
				    (RK_U32)phyAddr,
				    loopCount,
				    stViFrame.stVFrame.u32TimeRef,
				    stViFrame.stVFrame.u64PTS / 1000,
				    RK_MPI_MB_GetSize(stViFrame.stVFrame.pMbBlk));
		char YuvPath[128] = "";
		sprintf(YuvPath, "/tmp/srcLarge_2560x1472_420SP.yuv");
		yuv_fp = fopen(YuvPath, "wb");
		if (yuv_fp == NULL) {
			ao_record_demo_err("fopen file [%s] failed! reason [%s]\n", YuvPath, strerror(errno));
			exit(-1);
		}
		ret = fwrite(RK_MPI_MB_Handle2VirAddr(stViFrame.stVFrame.pMbBlk),
				1, RK_MPI_MB_GetSize(stViFrame.stVFrame.pMbBlk), yuv_fp);
		if (ret != RK_MPI_MB_GetSize(stViFrame.stVFrame.pMbBlk)) {
			ao_record_demo_err("fwrite file [%s] failed! reason [%s]\n", YuvPath, strerror(errno));
			exit(-1);
		}
		fflush(yuv_fp);
		fclose(yuv_fp);
		// 7.release the frame
		ret = RK_MPI_VI_ReleaseChnFrame(pipeId,
						channelId,
						&stViFrame);
		if (ret != RK_SUCCESS) {
			ao_record_demo_err("RK_MPI_VI_ReleaseChnFrame fail! ret [0x%08x]\n", ret);
		}
	} else {
		ao_record_demo_err("dev [%d] vi [%d] RK_MPI_VI_GetChnFrame timeout! ret [0x%08x]\n",
				   pipeId,
				   channelId,
				   ret);
	}
}

int main(int argc, char *argv[]) {
	klog("main\n");

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
		ao_record_demo_err("get_meta_params failed! metaVirmem addr [%p]\n", metaVirmem);
		goto __FAILED;
	}

	meta_params_dump(&handle);

	//todo get image resolution after vicap crop
	handle.sensor_init.cam_w = 2560;
	handle.sensor_init.cam_h = 1472;
	handle.app_params.venc_w = 2560;
	handle.app_params.venc_h = 1472;

	mpi_params_init(&ctx, &handle);
	ret = aiq_init(&handle, metaVirmem, &ctx);
	if (ret) {
		ao_record_demo_err("aiq_init failed! ret [0x%08x]\n", ret);
		return ret;
	}
	klog("aiq_init success\n");
	ret = aiq_run();
	if (ret) {
		ao_record_demo_err("aiq_run failed! ret [0x%08x]\n", ret);
		return ret;
	}
	klog("aiq_run success\n");
	ret = vi_init(&ctx.vi);
	if (ret) {
		ao_record_demo_err("vi_init failed! ret [0x%08x]\n", ret);
		return ret;
	}
	klog("vi_init success\n");
	ret = venc_init(&ctx.venc);
	if (ret) {
		ao_record_demo_err("venc_init failed! ret [0x%08x]\n", ret);
		return ret;
	}
	klog("venc_init success\n");
	ret = vi_bind_venc();
	if (ret) {
		ao_record_demo_err("vi_bind_venc failed! ret [0x%08x]\n", ret);
		return ret;
	}

#if (ENABLE_RTSP)
	rtsp_init();
#endif

	pthread_t main_thread0;
	pthread_create(&main_thread0, NULL, GetVencStream, NULL);

	pthread_t GetYuvFrame;
	pthread_create(&GetYuvFrame, NULL, get_yuv_frame_thread, NULL);
	pthread_join(main_thread0, NULL);
	pthread_join(GetYuvFrame, NULL);

__FAILED:
#if (ENABLE_RTSP)
	if (g_rtsplive)
		rtsp_del_demo(g_rtsplive);
#endif

	ret = vi_unbind_venc();
	if (ret) {
		ao_record_demo_err("vi_unbind_venc failed! ret [0x%08x]\n", ret);
		return ret;
	}
	ret = venc_deinit(&ctx.venc);
	if (ret) {
		ao_record_demo_err("venc_deinit failed! ret [0x%08x]\n", ret);
		return ret;
	}
	ret = vi_deinit(&ctx.vi);
	if (ret) {
		ao_record_demo_err("vi_deinit failed! ret [0x%08x]\n", ret);
		return ret;
	}
	aiq_stop();
	aiq_deinit();

#ifdef RKAIQ_USE_DLOPEN
	if (rkaiq_dl != NULL) {
		dlclose(rkaiq_dl);
	}
#endif

	if (metaVirmem != MAP_FAILED)
		munmap(metaVirmem, meta_size);
	ao_record_demo_info("main service exit main\n");
	return 0;
}
