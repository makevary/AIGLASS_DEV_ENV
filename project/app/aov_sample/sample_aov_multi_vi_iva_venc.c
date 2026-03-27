#include "common/sample_comm.h"
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <pthread.h>
#include <semaphore.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/syscall.h>
#include <sys/time.h>
#include <time.h>
#include <unistd.h>

#include "rockiva/rockiva_ba_api.h"
#include "sample_comm.h"
#include "sample_comm_aov.h"
#include "utils.h"
#include "rtsp_demo.h"

#define VI_CHN_MAX 4
#define VENC_CHN_MAX 2
#define MAIN_CAM_INDEX 0
#define SUB_CAM_INDEX 1
#define VI_MAIN_CHN 0
#define VI_SUB_CHN 1
#define VI_IVA_MAIN_CHN 2
#define VI_IVA_SUB_CHN 3
#define VENC_MAIN_CHN 0
#define VENC_SUB_CHN 1

#define ALL_IVA_TASK_DONE 2

#define RED_COLOR 0x0000FF
#define BLUE_COLOR 0xFF0000

#define FULLSIZE_WIDTH 1920
#define FULLSIZE_HEIGHT 1080
#define FULLSIZE_FPS 60
#define BINNING_WIDTH 960
#define BINNING_HEIGHT 540
#define BINNING_FPS 120

#define TRACE_BEGIN() RK_LOGI("Enter\n")

#define TRACE_END() RK_LOGI("Exit\n")

typedef struct _rkThreadStatus {
	RK_BOOL bIfMainThreadQuit;
	RK_BOOL bIfVencThreadQuit[VENC_CHN_MAX];
	RK_BOOL bIfIvaThreadQuit;
	RK_BOOL bForceFlushData;
	pthread_t s32IvaThreadId;
} ThreadStatus;

typedef struct _rkRtspCtx {
	pthread_mutex_t mutex;
	rtsp_demo_handle handle;
	rtsp_session_handle sessions[VENC_CHN_MAX];
} RTSP_CTX;

typedef struct _rkMpiCtx {
	SAMPLE_VI_CTX_S vi[VI_CHN_MAX];
	SAMPLE_VENC_CTX_S venc[VENC_CHN_MAX];
	SAMPLE_IVA_CTX_S iva[2];
	SAMPLE_IVS_CTX_S ivs[2];
	SAMPLE_RGN_CTX_S rgn[4];
	RTSP_CTX rtsp;
} SAMPLE_MPI_CTX_S;

typedef struct _rkCmdArgs {
	RK_U32 u32Main0Width;
	RK_U32 u32Main0Height;
	RK_U32 u32Main1Width;
	RK_U32 u32Main1Height;
	RK_U32 u32ViBuffCnt;
	RK_U32 u32CifBuffCnt;
	RK_U32 u32IvaWidth;
	RK_U32 u32IvaHeight;
	RK_U32 u32Gop;
	RK_U32 u32IvaDetectFrameRate;
	RK_CHAR *pOutPathVenc;
	RK_CHAR *pIvaModelPath;
	RK_CHAR *pIqFileDir;
	RK_BOOL bMultictx;
	CODEC_TYPE_E enCodecType;
	VENC_RC_MODE_E enRcMode;
	RK_CHAR *pCodecName;
	RK_BOOL bEnableIva;
	RK_BOOL bEnableIvs;
	RK_BOOL bEnableSaveToSdcard;
	RK_BOOL bEnableMultiMode;
	RK_BOOL bEnableChangeResolution;
	RK_BOOL bEnableScale;
	RK_BOOL bEnableWrap;
	RK_BOOL bEnableRtsp;
	RK_S32 s32BitRate;
	RK_U32 u32Fps;
	rk_aiq_working_mode_t eHdrMode;
	RK_S32 s32AeMode;
	RK_S32 s32AovLoopCount;
	RK_S32 s32SuspendTime;
	RK_U32 u32BootFrame;
	RK_U32 u32QuickStart;
	RK_U32 u32CacheBuffSize;
	RK_U32 u32WrapLine;
	RK_U32 u32IspMode;
} RkCmdArgs;

enum ISP_MODE {
	SINGLE_FRAME_MODE,
	MULTI_FRAME_MODE,
};

/* global param */
static ThreadStatus *g_thread_status = RK_NULL;
static RkCmdArgs *g_cmd_args = RK_NULL;
static SAMPLE_MPI_CTX_S *g_mpi_ctx = RK_NULL;
static RK_S32 g_exit_result = RK_FAILURE;

static pthread_mutex_t g_result_mutex;
static pthread_cond_t g_result_cond;
static RK_U32 g_task_done_cnt = 0;

static RK_S32 g_wakeup_count;

static void program_handle_error(const char *func, RK_U32 line) {
	RK_LOGE("func: <%s> line: <%d> error exit!", func, line);
	g_exit_result = RK_FAILURE;
	g_thread_status->bIfMainThreadQuit = RK_TRUE;
}

static void program_normal_exit(const char *func, RK_U32 line) {
	RK_LOGE("func: <%s> line: <%d> normal exit!", func, line);
	g_exit_result = RK_SUCCESS;
	g_thread_status->bIfMainThreadQuit = RK_TRUE;
}

static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	program_normal_exit(__func__, __LINE__);
}

static RK_S32 change_sensor_resolution(int width, int height, int fps) {
	RK_S32 ret = RK_FAILURE;
	RK_U64 cost_time;
	struct timespec func_begin_time, func_end_time, start_time, end_time;
	VI_CHN_ATTR_S vi_chn_attr;
	VENC_CHN_ATTR_S venc_chn_attr;
	VI_SENSOR_SETTING_S sensor_setting;
	VENC_RECV_PIC_PARAM_S recv_param;
	SAMPLE_VI_CTX_S *main_ctx = &g_mpi_ctx->vi[VI_MAIN_CHN];
	SAMPLE_VI_CTX_S *sub_ctx = &g_mpi_ctx->vi[VI_SUB_CHN];

#if defined(RV1106) || defined(RV1106B)
	clock_gettime(CLOCK_MONOTONIC, &func_begin_time);
	// 1. pause all venc and isp stream
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	RK_MPI_VENC_StopRecvFrame(VENC_MAIN_CHN);
	RK_MPI_VENC_StopRecvFrame(VENC_SUB_CHN);
	for (int i = 0; i != VI_CHN_MAX; ++i)
		RK_MPI_VI_PauseChn(g_mpi_ctx->vi[i].s32DevId, g_mpi_ctx->vi[i].s32ChnId);
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("stop all venc and isp stream cost %lld ms", cost_time);

	// 2. switch sensor resolution
	memset(&sensor_setting, 0, sizeof(sensor_setting));
	sensor_setting.u32SensorWidth = width;
	sensor_setting.u32SensorHeight = height;
	sensor_setting.u32SensorFps = fps;
	sensor_setting.enSensorFmt = RK_FMT_RGB_BAYER_SBGGR_10BPP;
	sensor_setting.enSensorMode = SENSOR_NO_HDR;

	clock_gettime(CLOCK_MONOTONIC, &start_time);
	ret = RK_MPI_VI_DevSelectSetting(main_ctx->s32DevId, &sensor_setting);
	if (ret != RK_SUCCESS) {
		RK_LOGE(
		    "RK_MPI_VI_DevSelectSetting %d failed, width = %d, height = %d, fps = %d\n",
		    main_ctx->s32DevId, width, height, fps);
		return ret;
	}
	ret = RK_MPI_VI_DevSelectSetting(sub_ctx->s32DevId, &sensor_setting);
	if (ret != RK_SUCCESS) {
		RK_LOGE(
		    "RK_MPI_VI_DevSelectSetting %d failed, width = %d, height = %d, fps = %d\n",
		    sub_ctx->s32DevId, width, height, fps);
		return ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("change sensor resolution cost %lld ms", cost_time);

	if (!g_cmd_args->bEnableScale) {
		RK_MPI_VI_GetChnAttr(main_ctx->s32DevId, main_ctx->s32ChnId, &vi_chn_attr);
		vi_chn_attr.stSize.u32Width = width;
		vi_chn_attr.stSize.u32Height = height;
		ret = RK_MPI_VI_SetChnAttr(main_ctx->s32DevId, main_ctx->s32ChnId, &vi_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", ret);
			return ret;
		}
		RK_MPI_VENC_GetChnAttr(VENC_MAIN_CHN, &venc_chn_attr);
		venc_chn_attr.stVencAttr.u32MaxPicWidth = width;
		venc_chn_attr.stVencAttr.u32MaxPicHeight = height;
		venc_chn_attr.stVencAttr.u32PicWidth = width;
		venc_chn_attr.stVencAttr.u32PicHeight = height;
		venc_chn_attr.stVencAttr.u32VirWidth = width;
		venc_chn_attr.stVencAttr.u32VirHeight = height;
		ret = RK_MPI_VENC_SetChnAttr(VENC_MAIN_CHN, &venc_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_SetChnAttr failure:%X", ret);
			return ret;
		}
		RK_MPI_VI_GetChnAttr(sub_ctx->s32DevId, sub_ctx->s32ChnId, &vi_chn_attr);
		vi_chn_attr.stSize.u32Width = width;
		vi_chn_attr.stSize.u32Height = height;
		ret = RK_MPI_VI_SetChnAttr(sub_ctx->s32DevId, sub_ctx->s32ChnId, &vi_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", ret);
			return ret;
		}
		RK_MPI_VENC_GetChnAttr(VENC_SUB_CHN, &venc_chn_attr);
		venc_chn_attr.stVencAttr.u32MaxPicWidth = width;
		venc_chn_attr.stVencAttr.u32MaxPicHeight = height;
		venc_chn_attr.stVencAttr.u32PicWidth = width;
		venc_chn_attr.stVencAttr.u32PicHeight = height;
		venc_chn_attr.stVencAttr.u32VirWidth = width;
		venc_chn_attr.stVencAttr.u32VirHeight = height;
		ret = RK_MPI_VENC_SetChnAttr(VENC_SUB_CHN, &venc_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_SetChnAttr failure:%X", ret);
			return ret;
		}
	}

	// 3. pause aiq
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	SAMPLE_COMM_ISP_Pause(MAIN_CAM_INDEX);
	SAMPLE_COMM_ISP_Pause(SUB_CAM_INDEX);

	// 4. resume aiq
	ret = SAMPLE_COMM_ISP_Run(MAIN_CAM_INDEX);
	if (ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_ISP_Run failed %#X", ret);
		return ret;
	}
	ret = SAMPLE_COMM_ISP_Run(SUB_CAM_INDEX);
	if (ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_ISP_Run failed %#X", ret);
		return ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("aiq resume cost %lld ms", cost_time);

	// 5. resume all venc and isp stream
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	for (int i = 0; i != VI_CHN_MAX; ++i) {
		ret = RK_MPI_VI_ResumeChn(g_mpi_ctx->vi[i].s32DevId, g_mpi_ctx->vi[i].s32ChnId);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_PauseChn [%d,%d] failed %#X", g_mpi_ctx->vi[i].s32DevId,
			        g_mpi_ctx->vi[i].s32ChnId, ret);
			return ret;
		}
	}
	recv_param.s32RecvPicNum = -1;
	ret = RK_MPI_VENC_StartRecvFrame(VENC_MAIN_CHN, &recv_param);
	if (ret != RK_SUCCESS) {
		RK_LOGE("chn 0 RK_MPI_VENC_StartRecvFrame failed %#X", ret);
		return ret;
	}
	ret = RK_MPI_VENC_StartRecvFrame(VENC_SUB_CHN, &recv_param);
	if (ret != RK_SUCCESS) {
		RK_LOGE("chn 1 RK_MPI_VENC_StartRecvFrame failed %#X", ret);
		return ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("resume all venc and isp stream cost %lld ms", cost_time);

	clock_gettime(CLOCK_MONOTONIC, &func_end_time);
	cost_time = func_end_time.tv_sec * 1000LL + func_end_time.tv_nsec / 1000000LL -
	            (func_begin_time.tv_sec * 1000LL + func_begin_time.tv_nsec / 1000000LL);
	RK_LOGW("change resolution cost %lld ms", cost_time);
#endif
	return RK_SUCCESS;
}

static void *venc_get_stream(void *pArgs) {
	SAMPLE_VENC_CTX_S *ctx = (SAMPLE_VENC_CTX_S *)pArgs;
	RK_S32 s32Ret = RK_FAILURE;
	FILE *fp = RK_NULL;
	RK_S32 s32fd = 0;
	RK_S32 s32LoopCount = 0;
	RK_VOID *pData = RK_NULL;
	RK_CHAR name[256] = {0};
	RK_S32 enable_save_sd = 1;
	RK_S32 venc_data_size = 0;
	RK_S32 force_flush_to_storage = 0;
	char *venc_data = NULL;
	if (g_cmd_args->bEnableSaveToSdcard) {
		venc_data = (char *)malloc(g_cmd_args->u32CacheBuffSize);
		if (!venc_data) {
			RK_LOGE("malloc failed!");
			program_handle_error(__func__, __LINE__);
			return NULL;
		}
	}

	sprintf(name, "venc_%d_get_stream", ctx->s32ChnId);
	prctl(PR_SET_NAME, name);

	while (!g_thread_status->bIfVencThreadQuit[ctx->s32ChnId]) {

		s32Ret = RK_MPI_VENC_GetStream(ctx->s32ChnId, &ctx->stFrame, 3000);
		if (s32Ret == RK_SUCCESS) {
			pData = RK_MPI_MB_Handle2VirAddr(ctx->stFrame.pstPack->pMbBlk);
			if (g_cmd_args->bEnableSaveToSdcard) {
				if ((venc_data_size + ctx->stFrame.pstPack->u32Len) <=
				        g_cmd_args->u32CacheBuffSize &&
				    !g_thread_status->bForceFlushData) {
					if (venc_data_size == 0 &&
					    ctx->stFrame.pstPack->DataType.enH265EType == H265E_NALU_PSLICE) {
						// force idr frame
						RK_LOGI("work round force idr, skip...\n");
					} else {
						memcpy(venc_data + venc_data_size, pData,
						       ctx->stFrame.pstPack->u32Len);
						venc_data_size += ctx->stFrame.pstPack->u32Len;
					}
				} else {
					RK_MPI_VENC_RequestIDR(ctx->s32ChnId, RK_FALSE);
					SAMPLE_COMM_AOV_CopyRawStreamToSdcard(ctx->s32ChnId, venc_data,
					                                      venc_data_size, pData,
					                                      ctx->stFrame.pstPack->u32Len);
					venc_data_size = 0;
					g_thread_status->bForceFlushData = false;
				}
			}
			RK_LOGE("chn:%d, frame %d, len:%u, pts:%llu, seq:%u", ctx->s32ChnId,
			        s32LoopCount, ctx->stFrame.pstPack->u32Len,
			        ctx->stFrame.pstPack->u64PTS, ctx->stFrame.u32Seq);
			if (g_cmd_args->bEnableRtsp) {
				pthread_mutex_lock(&g_mpi_ctx->rtsp.mutex);
				rtsp_tx_video(g_mpi_ctx->rtsp.sessions[ctx->s32ChnId], pData,
				              ctx->stFrame.pstPack->u32Len, ctx->stFrame.pstPack->u64PTS);
				rtsp_do_event(g_mpi_ctx->rtsp.handle);
				pthread_mutex_unlock(&g_mpi_ctx->rtsp.mutex);
			}

			SAMPLE_COMM_VENC_ReleaseStream(ctx);
			++s32LoopCount;
		} else {
			RK_LOGD("chn:%d RK_MPI_VENC_GetStream failed %#X\n", ctx->s32ChnId, s32Ret);
		}
	}

	if (venc_data && venc_data_size > 0) {
		SAMPLE_COMM_AOV_CopyRawStreamToSdcard(ctx->s32ChnId, venc_data, venc_data_size,
		                                      NULL, 0);
		venc_data_size = 0;
	}
	if (venc_data)
		free(venc_data);
	RK_LOGE("venc_get_stream chnid:%d exit", ctx->s32ChnId);
	return RK_NULL;
}

static void iva_detect_result_callback(const RockIvaDetectResult *result,
                                       const RockIvaExecuteStatus status,
                                       void *userData) {
	bool bIsHumanBody = false;
	for (int i = 0; i < result->objNum; i++) {
		if (result->objInfo[i].type == ROCKIVA_OBJECT_TYPE_PERSON) {
			bIsHumanBody = true;
			break;
		}
	}
	if (!bIsHumanBody) {
		if (g_wakeup_count > 0)
			g_wakeup_count--;
	} else {
		g_wakeup_count = g_cmd_args->u32Fps * 5;
		SAMPLE_COMM_IVA_Push_Result((SAMPLE_IVA_CTX_S *)userData, result);
	}
	RK_LOGI("RKIVA: objNum is %d, g_wakeup_count = %d\n", result->objNum, g_wakeup_count);
}

static void rkIvaFrame_releaseCallBack(const RockIvaReleaseFrames *releaseFrames,
                                       void *userdata) {
	/* when iva handle out of the video frame，this func will be called*/
	RK_S32 s32Ret = RK_SUCCESS;
	SAMPLE_VI_CTX_S *ctx;
	VIDEO_FRAME_INFO_S *frame;
	// TRACE_BEGIN();
	for (RK_S32 i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			RK_LOGE("---------error release frame is null");
			continue;
		}
		frame = (VIDEO_FRAME_INFO_S *)releaseFrames->frames[i].extData;
		// Ignore this warning
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wint-to-pointer-cast"
		ctx = (SAMPLE_VI_CTX_S *)frame->stVFrame.u64PrivateData;
#pragma GCC diagnostic pop
		s32Ret = RK_MPI_VI_ReleaseChnFrame(ctx->s32DevId, ctx->s32ChnId, frame);
		if (s32Ret != RK_SUCCESS)
			RK_LOGE("RK_MPI_VI_ReleaseChnFrame failure:%#X", s32Ret);
		else
			RK_LOGD("IVA release vi frame from dev %d chn %d, seq %u, pts %llu",
			        ctx->s32DevId, ctx->s32ChnId, frame->stVFrame.u32TimeRef,
			        frame->stVFrame.u64PTS);
		free(releaseFrames->frames[i].extData);
	}
	pthread_mutex_lock(&g_result_mutex);
	++g_task_done_cnt;
	pthread_cond_signal(&g_result_cond);
	pthread_mutex_unlock(&g_result_mutex);
	// TRACE_END();
}

static RK_BOOL get_vi_frame_and_send_to_iva(RK_S32 s32LoopCount, enum ISP_MODE mode) {
	RK_S32 s32Ret = RK_FAILURE;
	RK_S32 s32Fd;
	RK_BOOL md = RK_FALSE;
	RK_CHAR *pData = RK_NULL;
	VIDEO_FRAME_INFO_S *stViFrame = NULL;
	RockIvaImage ivaImage;
	SAMPLE_VI_CTX_S *ctx;
	struct timespec start_time, end_time;
	RK_U64 used_time = 0;

	SAMPLE_COMM_VI_GetChnFrame(&g_mpi_ctx->vi[VI_IVA_MAIN_CHN], (void *)&pData);
	SAMPLE_COMM_VI_GetChnFrame(&g_mpi_ctx->vi[VI_IVA_SUB_CHN], (void *)&pData);
	if (g_cmd_args->bEnableIvs && mode == SINGLE_FRAME_MODE) {
		clock_gettime(CLOCK_MONOTONIC, &start_time);
		md = SAMPLE_COMM_IVS_bMove(&g_mpi_ctx->ivs[0],
		                           &g_mpi_ctx->vi[VI_IVA_MAIN_CHN].stViFrame) ||
		     SAMPLE_COMM_IVS_bMove(&g_mpi_ctx->ivs[1],
		                           &g_mpi_ctx->vi[VI_IVA_SUB_CHN].stViFrame);
		clock_gettime(CLOCK_MONOTONIC, &end_time);
		used_time = end_time.tv_sec * 1000000LL + end_time.tv_nsec / 1000LL -
		            (start_time.tv_sec * 1000000LL + start_time.tv_nsec / 1000LL);
		RK_LOGD("ivs cost time %llu ms", used_time / 1000);
		if (!md) {
			RK_LOGD("skip human detect in static scene");
			SAMPLE_COMM_VI_ReleaseChnFrame(&g_mpi_ctx->vi[VI_IVA_MAIN_CHN]);
			SAMPLE_COMM_VI_ReleaseChnFrame(&g_mpi_ctx->vi[VI_IVA_SUB_CHN]);
			return md;
		}
	}
	if (!g_cmd_args->bEnableIva) {
		SAMPLE_COMM_VI_ReleaseChnFrame(&g_mpi_ctx->vi[VI_IVA_MAIN_CHN]);
		SAMPLE_COMM_VI_ReleaseChnFrame(&g_mpi_ctx->vi[VI_IVA_SUB_CHN]);
		return md;
	}
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	g_task_done_cnt = 0;
	// Get main camera frame and send to IVA
	ctx = &g_mpi_ctx->vi[VI_IVA_MAIN_CHN];
	stViFrame = (VIDEO_FRAME_INFO_S *)malloc(sizeof(VIDEO_FRAME_INFO_S));
	if (!stViFrame) {
		RK_LOGE("-----error malloc fail for stViFrame");
		SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
		program_handle_error(__func__, __LINE__);
		return md;
	}
	memcpy(stViFrame, &ctx->stViFrame, sizeof(VIDEO_FRAME_INFO_S));
	s32Fd = RK_MPI_MB_Handle2Fd(stViFrame->stVFrame.pMbBlk);
#if defined(__arm__)
	stViFrame->stVFrame.u64PrivateData = (unsigned long long)((unsigned)ctx);
#else
	stViFrame->stVFrame.u64PrivateData = (unsigned long long)(ctx);
#endif
	memset(&ivaImage, 0, sizeof(RockIvaImage));
	ivaImage.info.transformMode = g_mpi_ctx->iva[0].eImageTransform;
	ivaImage.info.width = stViFrame->stVFrame.u32Width;
	ivaImage.info.height = stViFrame->stVFrame.u32Height;
	ivaImage.info.format = g_mpi_ctx->iva[0].eImageFormat;
	ivaImage.frameId = s32LoopCount;
	ivaImage.dataAddr = NULL;
	ivaImage.dataPhyAddr = NULL;
	ivaImage.dataFd = s32Fd;
	ivaImage.extData = stViFrame;
	s32Ret = ROCKIVA_PushFrame(g_mpi_ctx->iva[0].ivahandle, &ivaImage, NULL);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("ROCKIVA_PushFrame failed %#X\n", s32Ret);
	else
		RK_LOGD("push frame %d to IVA, chn %d, dev %d, seq %u, pts %llu", s32LoopCount,
		        ctx->s32ChnId, ctx->s32DevId, stViFrame->stVFrame.u32TimeRef,
		        stViFrame->stVFrame.u64PTS);

	// Get sub camera frame and send to IVA
	ctx = &g_mpi_ctx->vi[VI_IVA_SUB_CHN];
	stViFrame = (VIDEO_FRAME_INFO_S *)malloc(sizeof(VIDEO_FRAME_INFO_S));
	if (!stViFrame) {
		RK_LOGE("-----error malloc fail for stViFrame");
		SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
		program_handle_error(__func__, __LINE__);
		return md;
	}
	memcpy(stViFrame, &ctx->stViFrame, sizeof(VIDEO_FRAME_INFO_S));
	s32Fd = RK_MPI_MB_Handle2Fd(stViFrame->stVFrame.pMbBlk);
#if defined(__arm__)
	stViFrame->stVFrame.u64PrivateData = (unsigned long long)((unsigned)ctx);
#else
	stViFrame->stVFrame.u64PrivateData = (unsigned long long)(ctx);
#endif
	memset(&ivaImage, 0, sizeof(RockIvaImage));
	ivaImage.info.transformMode = g_mpi_ctx->iva[1].eImageTransform;
	ivaImage.info.width = stViFrame->stVFrame.u32Width;
	ivaImage.info.height = stViFrame->stVFrame.u32Height;
	ivaImage.info.format = g_mpi_ctx->iva[1].eImageFormat;
	ivaImage.frameId = s32LoopCount;
	ivaImage.dataAddr = NULL;
	ivaImage.dataPhyAddr = NULL;
	ivaImage.dataFd = s32Fd;
	ivaImage.extData = stViFrame;
	s32Ret = ROCKIVA_PushFrame(g_mpi_ctx->iva[1].ivahandle, &ivaImage, NULL);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("ROCKIVA_PushFrame failed %#X\n", s32Ret);
	else
		RK_LOGD("push frame %d to IVA, chn %d, dev %d, seq %u, pts %llu", s32LoopCount,
		        ctx->s32ChnId, ctx->s32DevId, stViFrame->stVFrame.u32TimeRef,
		        stViFrame->stVFrame.u64PTS);
	pthread_mutex_lock(&g_result_mutex);
	while (g_task_done_cnt < ALL_IVA_TASK_DONE)
		pthread_cond_wait(&g_result_cond, &g_result_mutex);
	pthread_mutex_unlock(&g_result_mutex);

	clock_gettime(CLOCK_MONOTONIC, &end_time);
	used_time = end_time.tv_sec * 1000000LL + end_time.tv_nsec / 1000LL -
	            (start_time.tv_sec * 1000000LL + start_time.tv_nsec / 1000LL);
	RK_LOGI("iva cost time %llu ms", used_time / 1000);
	return md;
}

static void drop_all_vi_chn_frame(void) {
	VIDEO_FRAME_INFO_S stViFrame_tmp;
	SAMPLE_VI_CTX_S *ctx;
	RK_S32 s32LoopCount = 0;
	for (int i = 0; i < VI_CHN_MAX; ++i) {
		ctx = &g_mpi_ctx->vi[i];
		s32LoopCount = 0;
		while (RK_MPI_VI_GetChnFrame(ctx->s32DevId, ctx->s32ChnId, &stViFrame_tmp,
		                             1000) == RK_SUCCESS) {
			++s32LoopCount;
			RK_MPI_VI_ReleaseChnFrame(ctx->s32DevId, ctx->s32ChnId, &stViFrame_tmp);
			RK_LOGD("drop vi dev:%d chn:%d frame", ctx->s32DevId, ctx->s32ChnId);
			if (s32LoopCount > 30)
				RK_LOGW("drop vi dev:%d chn:%d frame, drop too much frame!!!",
				        ctx->s32DevId, ctx->s32ChnId);
		}
	}
}

static void capture_frames_in_normal_mode(void) {
	RK_S32 s32Ret = RK_SUCCESS;
	SAMPLE_MPI_CTX_S *ctx = g_mpi_ctx;
	RK_CHAR *pData = RK_NULL;
	for (int i = 0; i < g_cmd_args->u32BootFrame; ++i) {
		if (g_cmd_args->bEnableIva) {
			SAMPLE_COMM_RGN_DrawRectFromIVA(&ctx->rgn[0], &ctx->iva[0], RK_TRUE);
			SAMPLE_COMM_RGN_DrawRectFromIVA(&ctx->rgn[1], &ctx->iva[1], RK_TRUE);
		}
		SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[2], "NORMAL",
		                        SAMPLE_COMM_ISP_GetFrameRate(MAIN_CAM_INDEX));
		SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[3], "NORMAL",
		                        SAMPLE_COMM_ISP_GetFrameRate(SUB_CAM_INDEX));
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(&ctx->vi[VI_IVA_MAIN_CHN], (void *)&pData);
		if (s32Ret == RK_SUCCESS) {
			RK_LOGD("normal mode frame %d, chn %d, dev %d, seq %u, "
			        "pts %llu",
			        i, ctx->vi[VI_IVA_MAIN_CHN].s32ChnId,
			        ctx->vi[VI_IVA_MAIN_CHN].s32DevId,
			        ctx->vi[VI_IVA_MAIN_CHN].stViFrame.stVFrame.u32TimeRef,
			        ctx->vi[VI_IVA_MAIN_CHN].stViFrame.stVFrame.u64PTS);
			SAMPLE_COMM_VI_ReleaseChnFrame(&ctx->vi[VI_IVA_MAIN_CHN]);
		}

		s32Ret = SAMPLE_COMM_VI_GetChnFrame(&ctx->vi[VI_IVA_SUB_CHN], (void *)&pData);
		if (s32Ret == RK_SUCCESS) {
			RK_LOGD("normal mode frame %d, chn %d, dev %d, seq %u, "
			        "pts %llu",
			        i, ctx->vi[VI_IVA_SUB_CHN].s32ChnId, ctx->vi[VI_IVA_SUB_CHN].s32DevId,
			        ctx->vi[VI_IVA_SUB_CHN].stViFrame.stVFrame.u32TimeRef,
			        ctx->vi[VI_IVA_SUB_CHN].stViFrame.stVFrame.u64PTS);
			SAMPLE_COMM_VI_ReleaseChnFrame(&ctx->vi[VI_IVA_SUB_CHN]);
		}
	}
}
static void *iva_send_frame_thread(void *pArgs) {
	prctl(PR_SET_NAME, "iva_send_frame_thread");
	SAMPLE_MPI_CTX_S *ctx = (SAMPLE_MPI_CTX_S *)pArgs;
	RK_U32 s32LoopCount = 0, aov_loop_count = 0;
	RK_U32 irq_wakeup_count = 0;
	RK_S32 ret;
	RK_BOOL md = RK_FALSE;
	RK_BOOL is_gpioirq_happened = RK_FALSE;
	RK_CHAR *pData = RK_NULL;
	enum ISP_MODE current_isp_mode = MULTI_FRAME_MODE;

	g_wakeup_count = 0;

	// befor enter AOV
	capture_frames_in_normal_mode();

	SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events.
	while (!g_thread_status->bIfIvaThreadQuit) {
		// Check input event to detect weather gpio irq is happened.
		is_gpioirq_happened = SAMPLE_COMM_AOV_GetGpioIrqStat();
		RK_LOGD("is gpioirq happened %d", is_gpioirq_happened);
		// Force flush cached data to sdcard when wakeup by interrupt
		if (is_gpioirq_happened)
			g_thread_status->bForceFlushData = true;

		// get VI frame, and then send to IVA.
		// Wait for all iva result callback done.
		md = get_vi_frame_and_send_to_iva(s32LoopCount, current_isp_mode);

		switch (current_isp_mode) {
		case SINGLE_FRAME_MODE:
			if (is_gpioirq_happened || g_wakeup_count > 0) {
				RK_LOGI("#Resume isp, Enter multi frame\n");
				SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
				SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
				if (g_cmd_args->bEnableChangeResolution) {
					ret = change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT,
					                               FULLSIZE_FPS);
					if (ret != RK_SUCCESS) {
						RK_LOGE("change sensor resolution to full size failure!");
						goto __error_exit_loop;
					}
					SAMPLE_COMM_ISP_SetFrameRate(MAIN_CAM_INDEX, g_cmd_args->u32Fps);
					SAMPLE_COMM_ISP_SetFrameRate(SUB_CAM_INDEX, g_cmd_args->u32Fps);
				}
				current_isp_mode = MULTI_FRAME_MODE;
				if (is_gpioirq_happened)
					irq_wakeup_count = 3000;
				break;
			}
			if (get_int32_from_env("test_aov_resume_suspend", 0) &&
			    (aov_loop_count % 60) == 0) {
				RK_LOGI("#Resume isp, Enter multi frame for test");
				SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
				SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
				if (g_cmd_args->bEnableChangeResolution) {
					ret = change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT,
					                               FULLSIZE_FPS);
					if (ret != RK_SUCCESS) {
						RK_LOGE("change sensor resolution to full size failure!");
						goto __error_exit_loop;
					}
					SAMPLE_COMM_ISP_SetFrameRate(MAIN_CAM_INDEX, g_cmd_args->u32Fps);
					SAMPLE_COMM_ISP_SetFrameRate(SUB_CAM_INDEX, g_cmd_args->u32Fps);
				}
				current_isp_mode = MULTI_FRAME_MODE;
				irq_wakeup_count = 60;
			}
			break;
		case MULTI_FRAME_MODE:
			if (get_int32_from_env("test_skip_aov", 0))
				break;
			if (is_gpioirq_happened || (g_wakeup_count == 0 && irq_wakeup_count == 0)) {
				RK_LOGI("#Pause isp, Enter single frame\n");
				if (g_cmd_args->bEnableChangeResolution) {
					ret = change_sensor_resolution(BINNING_WIDTH, BINNING_HEIGHT,
					                               BINNING_FPS);
					if (ret != RK_SUCCESS) {
						RK_LOGE("change sensor resolution to binning size failure!");
						goto __error_exit_loop;
					}
				}
				SAMPLE_COMM_ISP_SingleFrame(MAIN_CAM_INDEX);
				SAMPLE_COMM_ISP_SingleFrame(SUB_CAM_INDEX);
				// drop frame
				drop_all_vi_chn_frame();
				current_isp_mode = SINGLE_FRAME_MODE;
				break;
			}
			if (irq_wakeup_count > 0)
				--irq_wakeup_count;
			break;
		}

		if (current_isp_mode == SINGLE_FRAME_MODE) {
			++aov_loop_count;
			if (g_cmd_args->s32AovLoopCount > 0 &&
			    aov_loop_count > g_cmd_args->s32AovLoopCount) {
				RK_LOGI("Exit AOV!");
				break;
			} else {
				SAMPLE_COMM_AOV_EnterSleep();
			}
		}
		if (current_isp_mode == SINGLE_FRAME_MODE) {
			if (g_cmd_args->bEnableIva) {
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &ctx->iva[0],
				                                RK_TRUE);
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[1], &ctx->iva[1],
				                                RK_TRUE);
			}
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->rgn[2], md ? "AOV_M" : "AOV_I",
			                        1000 / g_cmd_args->s32SuspendTime);
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->rgn[3], md ? "AOV_M" : "AOV_I",
			                        1000 / g_cmd_args->s32SuspendTime);
		} else {
			if (g_cmd_args->bEnableIva) {
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &ctx->iva[0],
				                                RK_TRUE);
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[1], &ctx->iva[1],
				                                RK_TRUE);
			}
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->rgn[2], "NORMAL",
			                        SAMPLE_COMM_ISP_GetFrameRate(MAIN_CAM_INDEX));
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->rgn[3], "NORMAL",
			                        SAMPLE_COMM_ISP_GetFrameRate(SUB_CAM_INDEX));
		}
		s32LoopCount++;
	}

	if (current_isp_mode == SINGLE_FRAME_MODE) {
		SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
		SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
		if (g_cmd_args->bEnableChangeResolution)
			change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT, FULLSIZE_FPS);
		current_isp_mode = MULTI_FRAME_MODE;
	}
	capture_frames_in_normal_mode();
	program_normal_exit(__func__, __LINE__);

	RK_LOGE("iva_send_frame_thread exit !!!");
	return RK_NULL;

__error_exit_loop:
	RK_LOGE("iva_send_frame_thread exit error!!!");
	program_handle_error(__func__, __LINE__);
	// restore isp state to normal mode.
	if (current_isp_mode == SINGLE_FRAME_MODE) {
		SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
		SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
		if (g_cmd_args->bEnableChangeResolution)
			change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT, FULLSIZE_FPS);
		current_isp_mode = MULTI_FRAME_MODE;
	}
	return RK_NULL;
}

static RK_S32 rtsp_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	char session_name[128] = {'\0'};
	if (!pArgs->bEnableRtsp)
		return RK_SUCCESS;
	ctx->rtsp.handle = create_rtsp_demo(554);
	if (!ctx->rtsp.handle) {
		printf("create rtsp failed\n");
		return RK_FAILURE;
	}
	for (int i = 0; i != VENC_CHN_MAX; ++i) {
		snprintf(session_name, sizeof(session_name), "/live/%d", i);
		ctx->rtsp.sessions[i] = rtsp_new_session(ctx->rtsp.handle, session_name);
		if (pArgs->enCodecType == RK_CODEC_TYPE_H264)
			rtsp_set_video(ctx->rtsp.sessions[i], RTSP_CODEC_ID_VIDEO_H264, NULL, 0);
		else
			rtsp_set_video(ctx->rtsp.sessions[i], RTSP_CODEC_ID_VIDEO_H265, NULL, 0);
		rtsp_sync_video_ts(ctx->rtsp.sessions[i], rtsp_get_reltime(), rtsp_get_ntptime());
	}
	pthread_mutex_init(&ctx->rtsp.mutex, NULL);

	return RK_SUCCESS;
}

static RK_S32 rtsp_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	if (!pArgs->bEnableRtsp)
		return RK_SUCCESS;
	pthread_mutex_destroy(&ctx->rtsp.mutex);
	rtsp_del_demo(ctx->rtsp.handle);
}

static RK_S32 aov_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	// Unbind sdcard device and sound card device to reduce power consumption
	// in aov mode.
	SAMPLE_COMM_AOV_UnbindSdcard();
	SAMPLE_COMM_AOV_UnbindSoundcard();
	SAMPLE_COMM_AOV_UnbindSDIO();
	if (!pArgs->bEnableRtsp)
		SAMPLE_COMM_AOV_UnbindUsb();
	SAMPLE_COMM_AOV_Init();
	SAMPLE_COMM_AOV_SetPeriodTime(pArgs->s32SuspendTime);
	return s32Ret;
}

static RK_S32 aov_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	SAMPLE_COMM_AOV_Deinit();
	SAMPLE_COMM_AOV_BindSdcard();
	SAMPLE_COMM_AOV_BindSoundcard();
	SAMPLE_COMM_AOV_BindSDIO();
	if (!pArgs->bEnableRtsp)
		SAMPLE_COMM_AOV_BindUsb();
	return s32Ret;
}

static RK_S32 isp_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	if (g_cmd_args->pIqFileDir) {

		s32Ret = SAMPLE_COMM_ISP_Init(MAIN_CAM_INDEX, g_cmd_args->eHdrMode,
		                              g_cmd_args->bMultictx, g_cmd_args->pIqFileDir);
		if (pArgs->u32IspMode == 1)
			SAMPLE_COMM_ISP_SetSyncMode(MAIN_CAM_INDEX, SOFT_SYNC_MODE);
		s32Ret |= SAMPLE_COMM_ISP_Run(MAIN_CAM_INDEX);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d init failed!\n", MAIN_CAM_INDEX);
			return s32Ret;
		}
#ifndef AOV_FASTBOOT_ENABLE
		s32Ret = SAMPLE_COMM_ISP_SetFrameRate(MAIN_CAM_INDEX, pArgs->u32Fps);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d set fps failed!\n", MAIN_CAM_INDEX);
			return s32Ret;
		}
#endif
		s32Ret = SAMPLE_COMM_ISP_Init(SUB_CAM_INDEX, g_cmd_args->eHdrMode,
		                              g_cmd_args->bMultictx, g_cmd_args->pIqFileDir);
		if (pArgs->u32IspMode == 1)
			SAMPLE_COMM_ISP_SetSyncMode(SUB_CAM_INDEX, SOFT_SYNC_MODE);
		s32Ret |= SAMPLE_COMM_ISP_Run(SUB_CAM_INDEX);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d init failed!\n", SUB_CAM_INDEX);
			return s32Ret;
		}
#ifndef AOV_FASTBOOT_ENABLE
		s32Ret = SAMPLE_COMM_ISP_SetFrameRate(SUB_CAM_INDEX, pArgs->u32Fps);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d set fps failed!\n", SUB_CAM_INDEX);
			return s32Ret;
		}
#endif
	}
	return s32Ret;
}

static RK_S32 isp_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	if (g_cmd_args->pIqFileDir) {
		SAMPLE_COMM_ISP_Stop(MAIN_CAM_INDEX);
		SAMPLE_COMM_ISP_Stop(SUB_CAM_INDEX);
	}
	return s32Ret;
}

static RK_S32 vi_chn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
#if defined(RV1106B)
	VI_PARAM_MOD_S vi_mod_param;
	memset(&vi_mod_param, 0, sizeof(vi_mod_param));
	if (pArgs->u32IspMode == 1) {
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_LEFT_HALF_ONLINE;
		s32Ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", s32Ret);
			return s32Ret;
		}
	} else if (pArgs->u32IspMode == 2) {
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_ONLINE;
		s32Ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", s32Ret);
			return s32Ret;
		}
	}
#endif
	/* Init VI[0] */
	ctx->vi[0].bIfQuickStart = pArgs->u32QuickStart;
	ctx->vi[0].u32Width = pArgs->u32Main0Width;
	ctx->vi[0].u32Height = pArgs->u32Main0Height;
	ctx->vi[0].s32DevId = MAIN_CAM_INDEX;
	ctx->vi[0].u32PipeId = MAIN_CAM_INDEX;
	ctx->vi[0].u32CifBuffCnt = pArgs->u32CifBuffCnt;
	ctx->vi[0].s32ChnId = 0;
	ctx->vi[0].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32Main0Width;
	ctx->vi[0].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32Main0Height;
	ctx->vi[0].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[0].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[0].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[0].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[0].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[0].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	if (pArgs->bEnableWrap) {
		ctx->vi[0].bWrapIfEnable = RK_TRUE;
		ctx->vi[0].bEnableShareBuf = RK_TRUE;
		ctx->vi[0].u32BufferLine = ctx->vi[0].u32Height / pArgs->u32WrapLine;
	}
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[0]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 0 failure:%d", s32Ret);

	/* Init VI[1] */
	ctx->vi[1].bIfQuickStart = pArgs->u32QuickStart;
	ctx->vi[1].u32Width = pArgs->u32Main1Width;
	ctx->vi[1].u32Height = pArgs->u32Main1Height;
	ctx->vi[1].s32DevId = SUB_CAM_INDEX;
	ctx->vi[1].u32PipeId = SUB_CAM_INDEX;
	ctx->vi[1].u32CifBuffCnt = pArgs->u32CifBuffCnt;
	ctx->vi[1].s32ChnId = 0;
	ctx->vi[1].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32Main1Width;
	ctx->vi[1].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32Main1Height;
	ctx->vi[1].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[1].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[1].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[1].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[1].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[1].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	if (pArgs->bEnableWrap) {
		ctx->vi[1].bWrapIfEnable = RK_TRUE;
		ctx->vi[1].bEnableShareBuf = RK_TRUE;
		ctx->vi[1].u32BufferLine = ctx->vi[1].u32Height / pArgs->u32WrapLine;
	}
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[1]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 1 failure:%d", s32Ret);

	/* Init VI[2] */
	ctx->vi[2].bIfQuickStart = pArgs->u32QuickStart;
	ctx->vi[2].u32Width = pArgs->u32IvaWidth;
	ctx->vi[2].u32Height = pArgs->u32IvaHeight;
	ctx->vi[2].s32DevId = MAIN_CAM_INDEX;
	ctx->vi[2].u32PipeId = MAIN_CAM_INDEX;
	ctx->vi[2].s32ChnId = 1;
	ctx->vi[2].stChnAttr.u32Depth = 1;
	ctx->vi[2].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32IvaWidth;
	ctx->vi[2].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32IvaHeight;
	ctx->vi[2].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[2].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[2].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[2].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[2].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[2].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[2]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 2 failure:%d", s32Ret);

	/* Init VI[3] */
	ctx->vi[3].bIfQuickStart = pArgs->u32QuickStart;
	ctx->vi[3].u32Width = pArgs->u32IvaWidth;
	ctx->vi[3].u32Height = pArgs->u32IvaHeight;
	ctx->vi[3].s32DevId = SUB_CAM_INDEX;
	ctx->vi[3].u32PipeId = SUB_CAM_INDEX;
	ctx->vi[3].s32ChnId = 1;
	ctx->vi[3].stChnAttr.u32Depth = 1;
	ctx->vi[3].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32IvaWidth;
	ctx->vi[3].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32IvaHeight;
	ctx->vi[3].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[3].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[3].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[3].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[3].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[3].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[3]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 3 failure:%d", s32Ret);
	TRACE_END();
	return s32Ret;
}

static RK_S32 vi_chn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	s32Ret = RK_MPI_VI_DisableChn(ctx->vi[3].u32PipeId, ctx->vi[3].s32ChnId);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableChn 3 failure:%#X", s32Ret);
	s32Ret = RK_MPI_VI_DisableChn(ctx->vi[2].u32PipeId, ctx->vi[2].s32ChnId);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableChn 2 failure:%#X", s32Ret);
	s32Ret = RK_MPI_VI_DisableChn(ctx->vi[1].u32PipeId, ctx->vi[1].s32ChnId);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableChn 1 failure:%#X", s32Ret);
	s32Ret = RK_MPI_VI_DisableChn(ctx->vi[0].u32PipeId, ctx->vi[0].s32ChnId);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableChn 0 failure:%#X", s32Ret);

	s32Ret = RK_MPI_VI_DisableDev(MAIN_CAM_INDEX);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableDev %d failure:%#X", MAIN_CAM_INDEX, s32Ret);

	s32Ret = RK_MPI_VI_DisableDev(SUB_CAM_INDEX);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("RK_MPI_VI_DisableDev %d failure:%#X", SUB_CAM_INDEX, s32Ret);
	TRACE_END();
	return s32Ret;
}

static RK_S32 venc_chn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;

	TRACE_BEGIN();
	// Init VENC[0]
	ctx->venc[0].s32ChnId = VENC_MAIN_CHN;
	ctx->venc[0].u32Width = pArgs->u32Main0Width;
	ctx->venc[0].u32Height = pArgs->u32Main0Height;
	ctx->venc[0].u32Fps = pArgs->u32Fps;
	ctx->venc[0].u32Gop = pArgs->u32Gop;
	ctx->venc[0].u32BitRate = pArgs->s32BitRate;
	ctx->venc[0].enCodecType = pArgs->enCodecType;
	ctx->venc[0].enRcMode = pArgs->enRcMode;
	ctx->venc[0].getStreamCbFunc = venc_get_stream;
	ctx->venc[0].dstFilePath = pArgs->pOutPathVenc;
	ctx->venc[0].u32BuffSize = pArgs->u32Main0Width * pArgs->u32Main0Height / 3;
	ctx->venc[0].enable_buf_share = RK_TRUE;
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	ctx->venc[0].stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	if (RK_CODEC_TYPE_H264 != pArgs->enCodecType) {
		ctx->venc[0].stChnAttr.stVencAttr.u32Profile = 0;
	} else {
		ctx->venc[0].stChnAttr.stVencAttr.u32Profile = 100;
	}
	if (pArgs->bEnableWrap) {
		ctx->venc[0].bWrapIfEnable = RK_TRUE;
		ctx->venc[0].u32BufferLine = ctx->venc[0].u32Height / pArgs->u32WrapLine;
	}
	s32Ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[0]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VENC_CreateChn venc0 failed %#X\n", s32Ret);

	// Init VENC[1]
	ctx->venc[1].s32ChnId = VENC_SUB_CHN;
	ctx->venc[1].u32Width = pArgs->u32Main1Width;
	ctx->venc[1].u32Height = pArgs->u32Main1Height;
	ctx->venc[1].u32Fps = pArgs->u32Fps;
	ctx->venc[1].u32Gop = pArgs->u32Gop;
	ctx->venc[1].u32BitRate = pArgs->s32BitRate;
	ctx->venc[1].enCodecType = pArgs->enCodecType;
	ctx->venc[1].enRcMode = pArgs->enRcMode;
	ctx->venc[1].getStreamCbFunc = venc_get_stream;
	ctx->venc[1].dstFilePath = pArgs->pOutPathVenc;
	ctx->venc[1].u32BuffSize = pArgs->u32Main1Width * pArgs->u32Main1Height / 3;
	ctx->venc[1].enable_buf_share = RK_TRUE;
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	ctx->venc[1].stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	if (RK_CODEC_TYPE_H264 != pArgs->enCodecType) {
		ctx->venc[1].stChnAttr.stVencAttr.u32Profile = 0;
	} else {
		ctx->venc[1].stChnAttr.stVencAttr.u32Profile = 100;
	}
	if (pArgs->bEnableWrap) {
		ctx->venc[1].bWrapIfEnable = RK_TRUE;
		ctx->venc[1].u32BufferLine = ctx->venc[1].u32Height / pArgs->u32WrapLine;
	}
	s32Ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[1]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VENC_CreateChn venc1 failed %#X\n", s32Ret);

	TRACE_END();

	return s32Ret;
}

static RK_S32 venc_chn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;

	TRACE_BEGIN();
	s32Ret = SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[1]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VENC_CreateChn venc1 failed %#X\n", s32Ret);

	s32Ret = SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[0]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VENC_CreateChn venc0 failed %#X\n", s32Ret);
	TRACE_END();

	return s32Ret;
}

static RK_S32 iva_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;

	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIva) {
		return s32Ret;
		TRACE_END();
	}
	/* Init iva */
	ctx->iva[0].pModelDataPath = pArgs->pIvaModelPath;
	ctx->iva[0].u32ImageHeight = pArgs->u32IvaHeight;
	ctx->iva[0].u32ImageWidth = pArgs->u32IvaWidth;
	ctx->iva[0].u32DetectStartX = 0;
	ctx->iva[0].u32DetectStartY = 0;
	ctx->iva[0].u32DetectWidth = pArgs->u32IvaWidth;
	ctx->iva[0].u32DetectHight = pArgs->u32IvaHeight;
	ctx->iva[0].eImageTransform = ROCKIVA_IMAGE_TRANSFORM_NONE;
	ctx->iva[0].eImageFormat = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
	ctx->iva[0].eModeType = ROCKIVA_DET_MODEL_PFP;
	ctx->iva[0].u32IvaDetectFrameRate = pArgs->u32IvaDetectFrameRate;
	// ctx->iva.resultCallback = iva_ba_result_callback;
	ctx->iva[0].detectResultCallback = iva_detect_result_callback;
	ctx->iva[0].eIvaMode = ROCKIVA_MODE_DETECT;
	ctx->iva[0].releaseCallback = rkIvaFrame_releaseCallBack;
	s32Ret = SAMPLE_COMM_IVA_Create(&ctx->iva[0]);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVA_Create failure:%#X", s32Ret);
		return s32Ret;
	}

	ctx->iva[1].pModelDataPath = pArgs->pIvaModelPath;
	ctx->iva[1].u32ImageHeight = pArgs->u32IvaHeight;
	ctx->iva[1].u32ImageWidth = pArgs->u32IvaWidth;
	ctx->iva[1].u32DetectStartX = 0;
	ctx->iva[1].u32DetectStartY = 0;
	ctx->iva[1].u32DetectWidth = pArgs->u32IvaWidth;
	ctx->iva[1].u32DetectHight = pArgs->u32IvaHeight;
	ctx->iva[1].eImageTransform = ROCKIVA_IMAGE_TRANSFORM_NONE;
	ctx->iva[1].eImageFormat = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
	ctx->iva[1].eModeType = ROCKIVA_DET_MODEL_PFP;
	ctx->iva[1].u32IvaDetectFrameRate = pArgs->u32IvaDetectFrameRate;
	// ctx->iva.resultCallback = iva_ba_result_callback;
	ctx->iva[1].detectResultCallback = iva_detect_result_callback;
	ctx->iva[1].eIvaMode = ROCKIVA_MODE_DETECT;
	ctx->iva[1].releaseCallback = rkIvaFrame_releaseCallBack;
	s32Ret = SAMPLE_COMM_IVA_Create(&ctx->iva[1]);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVA_Create failure:%#X", s32Ret);
		return s32Ret;
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 iva_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	TRACE_BEGIN();
	RK_S32 s32Ret = RK_SUCCESS;
	if (!g_cmd_args->bEnableIva) {
		return s32Ret;
		TRACE_END();
	}
	s32Ret = SAMPLE_COMM_IVA_Destroy(&ctx->iva[0]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_IVA_Destroy failure:%#X", s32Ret);
	s32Ret = SAMPLE_COMM_IVA_Destroy(&ctx->iva[1]);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_IVA_Destroy failure:%#X", s32Ret);
	TRACE_END();
	return s32Ret;
}

static RK_S32 ivs_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIvs) {
		return ret;
		TRACE_END();
	}
	for (int ivs_chn = 0; ivs_chn < 2; ++ivs_chn) {
		ctx->ivs[ivs_chn].s32ChnId = ivs_chn;
		ctx->ivs[ivs_chn].stIvsAttr.enMode = IVS_MODE_MD_OD;
		ctx->ivs[ivs_chn].stIvsAttr.u32PicWidth = pArgs->u32IvaWidth;
		ctx->ivs[ivs_chn].stIvsAttr.u32PicHeight = pArgs->u32IvaHeight;
		ctx->ivs[ivs_chn].stIvsAttr.enPixelFormat = RK_FMT_YUV420SP;
		ctx->ivs[ivs_chn].stIvsAttr.s32Gop = pArgs->u32Gop;
		ctx->ivs[ivs_chn].stIvsAttr.bSmearEnable = RK_FALSE;
		ctx->ivs[ivs_chn].stIvsAttr.bWeightpEnable = RK_FALSE;
		ctx->ivs[ivs_chn].stIvsAttr.bMDEnable = RK_TRUE;
		ctx->ivs[ivs_chn].stIvsAttr.s32MDInterval = 1;
		ctx->ivs[ivs_chn].stIvsAttr.bMDNightMode = RK_TRUE;
		ctx->ivs[ivs_chn].stIvsAttr.u32MDSensibility = 3;
		ctx->ivs[ivs_chn].stIvsAttr.bODEnable = RK_FALSE;
		ctx->ivs[ivs_chn].stIvsAttr.s32ODInterval = 1;
		ctx->ivs[ivs_chn].stIvsAttr.s32ODPercent = 7;
		ret = SAMPLE_COMM_IVS_Create(&ctx->ivs[ivs_chn]);
		if (ret != RK_SUCCESS)
			RK_LOGE("SAMPLE_COMM_IVS_Create failure:%X", ret);
	}
	TRACE_END();
	return ret;
}

static RK_S32 ivs_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIvs) {
		return ret;
		TRACE_END();
	}
	RK_MPI_IVS_DestroyChn(0);
	RK_MPI_IVS_DestroyChn(1);
	TRACE_END();
	return ret;
}

static RK_S32 rgn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	// Init RGN[0]
	if (g_cmd_args->bEnableIva) {
		ctx->rgn[0].rgnHandle = 1;
		ctx->rgn[0].stRgnAttr.enType = OVERLAY_RGN;
		ctx->rgn[0].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
		ctx->rgn[0].bDrawBmpManual = RK_TRUE;
		ctx->rgn[0].stMppChn.enModId = RK_ID_VENC;
		ctx->rgn[0].stMppChn.s32ChnId = VENC_MAIN_CHN;
		ctx->rgn[0].stMppChn.s32DevId = 0;
		ctx->rgn[0].stRegion.s32X = 0;                          // must be 16 aligned
		ctx->rgn[0].stRegion.s32Y = 0;                          // must be 16 aligned
		ctx->rgn[0].stRegion.u32Width = pArgs->u32Main0Width;   // must be 16 aligned
		ctx->rgn[0].stRegion.u32Height = pArgs->u32Main0Height; // must be 16 aligned
#if defined(RV1126)
		ctx->rgn[0].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
		ctx->rgn[0].u32BmpFormat = RK_FMT_2BPP;
#else
		ctx->rgn[0].u32BmpFormat = RK_FMT_1BPP;
#endif
		ctx->rgn[0].u32BgAlpha = 0;
		ctx->rgn[0].u32FgAlpha = 255;
		ctx->rgn[0].u32Layer = 1;
		ctx->rgn[0]
		    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
		    BLUE_COLOR;
		ctx->rgn[0]
		    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
		    RED_COLOR;
		ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[0]);
		if (ret != RK_SUCCESS)
			return ret;

		// Init RGN[1]
		ctx->rgn[1].rgnHandle = 2;
		ctx->rgn[1].stRgnAttr.enType = OVERLAY_RGN;
		ctx->rgn[1].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
		ctx->rgn[1].bDrawBmpManual = RK_TRUE;
		ctx->rgn[1].stMppChn.enModId = RK_ID_VENC;
		ctx->rgn[1].stMppChn.s32ChnId = VENC_SUB_CHN;
		ctx->rgn[1].stMppChn.s32DevId = 0;
		ctx->rgn[1].stRegion.s32X = 0;                          // must be 16 aligned
		ctx->rgn[1].stRegion.s32Y = 0;                          // must be 16 aligned
		ctx->rgn[1].stRegion.u32Width = pArgs->u32Main1Width;   // must be 16 aligned
		ctx->rgn[1].stRegion.u32Height = pArgs->u32Main1Height; // must be 16 aligned
#if defined(RV1126)
		ctx->rgn[1].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
		ctx->rgn[1].u32BmpFormat = RK_FMT_2BPP;
#else
		ctx->rgn[1].u32BmpFormat = RK_FMT_1BPP;
#endif
		ctx->rgn[1].u32BgAlpha = 0;
		ctx->rgn[1].u32FgAlpha = 255;
		ctx->rgn[1].u32Layer = 1;
		ctx->rgn[1]
		    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
		    BLUE_COLOR;
		ctx->rgn[1]
		    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
		    RED_COLOR;
		ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[1]);
		if (ret != RK_SUCCESS)
			return ret;
	}

	// Init RGN[2]
	ctx->rgn[2].rgnHandle = 3;
	ctx->rgn[2].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rgn[2].bDrawBmpManual = RK_TRUE;
	ctx->rgn[2].stMppChn.enModId = RK_ID_VENC;
	ctx->rgn[2].stMppChn.s32ChnId = VENC_MAIN_CHN;
	ctx->rgn[2].stMppChn.s32DevId = 0;
	ctx->rgn[2].stRegion.s32X = 0;       // must be 16 aligned
	ctx->rgn[2].stRegion.s32Y = 0;       // must be 16 aligned
	ctx->rgn[2].stRegion.u32Width = 576; // must be 16 aligned
	ctx->rgn[2].stRegion.u32Height = 32; // must be 16 aligned
	ctx->rgn[2].u32BmpFormat = RK_FMT_ARGB8888;
	ctx->rgn[2].u32BgAlpha = 64;
	ctx->rgn[2].u32FgAlpha = 64;
	ctx->rgn[2].u32Layer = 2;
	ctx->rgn[2].st_osd_data.enable = 1; // enable time osd
	ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[2]);
	if (ret != RK_SUCCESS)
		return ret;

	// Init RGN[3]
	ctx->rgn[3].rgnHandle = 4;
	ctx->rgn[3].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rgn[3].bDrawBmpManual = RK_TRUE;
	ctx->rgn[3].stMppChn.enModId = RK_ID_VENC;
	ctx->rgn[3].stMppChn.s32ChnId = VENC_SUB_CHN;
	ctx->rgn[3].stMppChn.s32DevId = 0;
	ctx->rgn[3].stRegion.s32X = 0;       // must be 16 aligned
	ctx->rgn[3].stRegion.s32Y = 0;       // must be 16 aligned
	ctx->rgn[3].stRegion.u32Width = 576; // must be 16 aligned
	ctx->rgn[3].stRegion.u32Height = 32; // must be 16 aligned
	ctx->rgn[3].u32BmpFormat = RK_FMT_ARGB8888;
	ctx->rgn[3].u32BgAlpha = 64;
	ctx->rgn[3].u32FgAlpha = 64;
	ctx->rgn[3].u32Layer = 2;
	ctx->rgn[3].st_osd_data.enable = 1; // enable time osd
	ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[3]);
	if (ret != RK_SUCCESS)
		return ret;
	TRACE_END();
	return ret;
}

static RK_S32 rgn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (g_cmd_args->bEnableIva) {
		SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[0]);
		SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[1]);
	}
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[2]);
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[3]);
	TRACE_END();
	return ret;
}
static RK_S32 bind_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	MPP_CHN_S stSrcChn, stDestChn;

	TRACE_BEGIN();
	// Bind VI[0, 0] and VENC[0]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = ctx->vi[VI_MAIN_CHN].s32DevId;
	stSrcChn.s32ChnId = ctx->vi[VI_MAIN_CHN].s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_MAIN_CHN;
	s32Ret = SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("bind vi0 to vpss0 failed");

	// Bind VI[1, 0] and VENC[1]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = ctx->vi[VI_SUB_CHN].s32DevId;
	stSrcChn.s32ChnId = ctx->vi[VI_SUB_CHN].s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_SUB_CHN;
	s32Ret = SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("bind vi1 to vpss1 failed");

	TRACE_END();

	return s32Ret;
}

static RK_S32 bind_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	MPP_CHN_S stSrcChn, stDestChn;

	TRACE_BEGIN();
	// UnBind VI[0, 0] and VENC[0]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = ctx->vi[VI_MAIN_CHN].s32DevId;
	stSrcChn.s32ChnId = ctx->vi[VI_MAIN_CHN].s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_MAIN_CHN;
	s32Ret = SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("unbind vi0 to vpss0 failed");

	// UnBind VI[1, 0] and VENC[1]
	stSrcChn.enModId = RK_ID_VI;
	stSrcChn.s32DevId = ctx->vi[VI_SUB_CHN].s32DevId;
	stSrcChn.s32ChnId = ctx->vi[VI_SUB_CHN].s32ChnId;
	stDestChn.enModId = RK_ID_VENC;
	stDestChn.s32DevId = 0;
	stDestChn.s32ChnId = VENC_SUB_CHN;
	s32Ret = SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("unbind vi1 to vpss1 failed");
	TRACE_END();

	return s32Ret;
}

static RK_S32 sub_threads_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	TRACE_BEGIN();

	// vpss iva thread launch
	g_thread_status->bIfIvaThreadQuit = RK_FALSE;

	pthread_create(&g_thread_status->s32IvaThreadId, 0, iva_send_frame_thread,
	               (void *)ctx);

	TRACE_END();
	return RK_SUCCESS;
}

static RK_S32 sub_threads_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	TRACE_BEGIN();
	for (int i = 0; i < VENC_CHN_MAX; i++) {
		g_thread_status->bIfVencThreadQuit[i] = true;
		pthread_join(ctx->venc[i].getStreamThread, RK_NULL);
		ctx->venc[i].getStreamThread = 0;
	}

	g_thread_status->bIfIvaThreadQuit = RK_TRUE;
	pthread_cond_signal(&g_result_cond);
	pthread_join(g_thread_status->s32IvaThreadId, NULL);

	TRACE_END();
	return RK_SUCCESS;
}

static RK_S32 global_param_init(void) {
	TRACE_BEGIN();
	g_thread_status = (ThreadStatus *)malloc(sizeof(ThreadStatus));
	if (!g_thread_status) {
		RK_LOGI("malloc for g_thread_status failure\n");
		goto __global_init_fail;
	}
	memset(g_thread_status, 0, sizeof(ThreadStatus));

	// Allocate global ctx.
	g_mpi_ctx = (SAMPLE_MPI_CTX_S *)(malloc(sizeof(SAMPLE_MPI_CTX_S)));
	if (!g_mpi_ctx) {
		printf("ctx is null, malloc failure\n");
		goto __global_init_fail;
	}
	memset(g_mpi_ctx, 0, sizeof(SAMPLE_MPI_CTX_S));

	g_cmd_args = malloc(sizeof(RkCmdArgs));
	if (!g_cmd_args) {
		printf("g_cmd_args is null, malloc failure\n");
		goto __global_init_fail;
	}
	memset(g_cmd_args, 0, sizeof(RkCmdArgs));

	pthread_mutex_init(&g_result_mutex, NULL);
	pthread_cond_init(&g_result_cond, NULL);

	TRACE_END();
	return RK_SUCCESS;

__global_init_fail:
	if (g_thread_status) {
		free(g_thread_status);
		g_thread_status = RK_NULL;
	}
	if (g_mpi_ctx) {
		free(g_mpi_ctx);
		g_mpi_ctx = NULL;
	}
	if (g_cmd_args) {
		free(g_cmd_args);
		g_cmd_args = NULL;
	}
	TRACE_END();
	return RK_FAILURE;
}

static RK_S32 global_param_deinit(void) {
	TRACE_BEGIN();

	pthread_cond_destroy(&g_result_cond);
	pthread_mutex_destroy(&g_result_mutex);

	if (g_thread_status) {
		free(g_thread_status);
		g_thread_status = RK_NULL;
	}
	if (g_mpi_ctx) {
		free(g_mpi_ctx);
		g_mpi_ctx = NULL;
	}
	if (g_cmd_args) {
		free(g_cmd_args);
		g_cmd_args = NULL;
	}

	TRACE_END();
	return RK_SUCCESS;
}

static RK_CHAR optstr[] = "?::a::w:h:o:l:b:f:r:g:v:e:i:s:I:";

static const struct option long_options[] = {
    {"aiq", optional_argument, RK_NULL, 'a'},
    {"sensor", required_argument, RK_NULL, 's'},
    {"width", required_argument, RK_NULL, 'w'},
    {"height", required_argument, RK_NULL, 'h'},
    {"encode", required_argument, RK_NULL, 'e'},
    {"output_path", required_argument, RK_NULL, 'o'},
    {"bitrate", required_argument, NULL, 'b'},
    {"fps", required_argument, RK_NULL, 'f'},
    {"vi_buff_cnt", required_argument, RK_NULL, 'v'},
    {"cif_buff_cnt", required_argument, RK_NULL, 'c' + 'b'},
    {"gop", required_argument, RK_NULL, 'g'},
    {"wrap", required_argument, RK_NULL, 'r'},
    {"iva_detect_speed", required_argument, RK_NULL, 'd'},
    {"wrap_lines", required_argument, RK_NULL, 'w' + 'l'},
    {"iva_model_path", required_argument, RK_NULL, 'i' + 'm'},
    {"isp_mode", required_argument, RK_NULL, 'i' + 's' + 'm'},
    {"enable_iva", required_argument, RK_NULL, 'e' + 'i'},
    {"enable_ivs", required_argument, RK_NULL, 'e' + 'i' + 's'},
    {"enable_multi_frame", required_argument, RK_NULL, 'e' + 'm' + 'f'},
    {"enable_save_sdcard", required_argument, RK_NULL, 'e' + 'm' + 'h'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"quick_start", required_argument, NULL, 'q' + 'k' + 's'},
    {"cache_buff_size", required_argument, NULL, 'c' + 'b' + 's' + 'z'},
    {"enable_change_resolution", required_argument, NULL, 'e' + 'c' + 'r' + 'e'},
    {"enable_scale", required_argument, NULL, 'e' + 's' + 'l'},
    {"enable_rtsp", required_argument, RK_NULL, 'e' + 'r' + 't' + 's'},
    {"help", optional_argument, RK_NULL, '?'},
    {RK_NULL, 0, RK_NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("\t%s -s 0 -w 1920 -h 1080 -s 1 -w 1920 -h 1080 --aov_loop_count 10\n", name);
	printf("\t-a | --aiq : enable aiq with dirpath provided, eg:-a "
	       "/etc/iqfiles/, \n"
	       "\t		set dirpath empty to using path by default, without "
	       "this option aiq \n"
	       "\t		should run in other application\n");
	printf("\t-s | --sensor : 0 means main camera, 1 means sub camera\n");
	printf("\t-w | --width : mainStream width, must is sensor width\n");
	printf("\t-h | --height : mainStream height, must is sensor height\n");
	printf("\t-e | --encode: encode type, Default:h264cbr, Value:h264cbr, "
	       "h264vbr, h264avbr "
	       "h265cbr, h265vbr, h265avbr, mjpegcbr, mjpegvbr\n");
	printf("\t-b | --bitrate: encode bitrate, Default 4096\n");
	printf("\t-o | --output_path : encode output file path, Default: RK_NULL\n");
	printf("\t-v | --vi_buff_cnt : main stream vi buffer num, Default: 2\n");
	printf("\t-g | --gop : venc GOP(group of pictures). default: 75\n");
	printf("\t-f | --fps : set fps, default: 25\n");
	printf("\t-r | --wrap : wrap for mainStream, 0: close 1: open, Default: 0\n");
	printf("\t--cif_buff_cnt : rkcif buffer count, default: 0\n");
	printf("\t--iva_detect_speed : iva detect framerate. default: 10\n");
	printf("\t--iva_model_path : iva model data path, default: /oem/usr/lib\n");
	printf("\t--aov_loop_count: When the value of aov_loop_count is greater \n"
	       "\t\t than 0, "
	       "this value represents the number of AOV cycles. A \n"
	       "\t\t negative value indicates an infinite loop, Default: "
	       "-1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot"
	       ", Default: 60 frames\n");
	printf("\t--quick_start: quick start stream, Default: 0\n");
	printf("\t--enable_save_sdcard : enable save venc stream to sdcard, default: 1\n");
	printf("\t--enable_iva : enable human detect, default: 1\n");
	printf("\t--enable_ivs : enable motion detect, default: 1\n");
	printf("\t--cache_buff_size : buffer size(MB) used for caching video stream, default "
	       "10MB\n");
	printf("\t--enable_change_resolution: enable change to small resolution in single "
	       "frame mode, Default: 0\n");
	printf("\t--enable_scale: enable scale binning input by isp, Default: 0\n");
	printf("\t--wrap_lines : 0: height/1, 1: height/2, 2: height/4, 3: height/8. "
	       "default: 2\n");
	printf("\t--isp_mode : isp mode, 0: offline, 1: half-online, 2: full-online. "
	       "default: 0\n");
	printf("\t--enable_rtsp : enable rtsp, default: 0\n");
}

/******************************************************************************
 * function    : parse_cmd_args()
 * Description : Parse command line arguments.
 ******************************************************************************/
static RK_S32 parse_cmd_args(int argc, char **argv, RkCmdArgs *pArgs) {
	pArgs->u32Main0Width = 1920;
	pArgs->u32Main0Height = 1080;
	pArgs->u32Main1Width = 1920;
	pArgs->u32Main1Height = 1080;
	pArgs->u32ViBuffCnt = 2;
	pArgs->u32CifBuffCnt = 2;
	pArgs->u32IvaWidth = 640;
	pArgs->u32IvaHeight = 360;
	pArgs->u32Gop = 30;
	pArgs->u32IvaDetectFrameRate = 10;
	pArgs->pOutPathVenc = NULL;
	pArgs->pIvaModelPath = "/oem/usr/lib/";
	pArgs->pIqFileDir = "/etc/iqfiles";
	pArgs->bMultictx = RK_TRUE;
	pArgs->enCodecType = RK_CODEC_TYPE_H264;
	pArgs->enRcMode = VENC_RC_MODE_H264VBR;
	pArgs->pCodecName = "H264";
	pArgs->bEnableIva = RK_TRUE;
	pArgs->bEnableIvs = RK_TRUE;
	pArgs->s32BitRate = 4 * 1024;
	pArgs->u32Fps = 15;
	pArgs->eHdrMode = RK_AIQ_WORKING_MODE_NORMAL;
	pArgs->s32AeMode = 0;
	pArgs->s32AovLoopCount = -1;
	pArgs->s32SuspendTime = 1000;
	pArgs->bEnableSaveToSdcard = RK_TRUE;
	pArgs->bEnableMultiMode = RK_TRUE;
	pArgs->u32BootFrame = 60;
	pArgs->u32QuickStart = 0;
	pArgs->u32CacheBuffSize = AOV_STREAM_SIZE_WRITE_TO_SDCARD;
	pArgs->bEnableChangeResolution = RK_FALSE;
	pArgs->bEnableScale = RK_FALSE;
	pArgs->bEnableWrap = RK_TRUE;
	pArgs->bEnableRtsp = RK_FALSE;
	pArgs->u32WrapLine = 4;
	pArgs->u32IspMode = 1;
	int sensor_index = 0;

	RK_S32 c = 0;
	while ((c = getopt_long(argc, argv, optstr, long_options, RK_NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'a':
			if (!optarg && RK_NULL != argv[optind] && '-' != argv[optind][0]) {
				tmp_optarg = argv[optind++];
			}
			if (tmp_optarg) {
				pArgs->pIqFileDir = (char *)tmp_optarg;
			} else {
				pArgs->pIqFileDir = RK_NULL;
			}
			break;
		case 's':
			sensor_index = atoi(optarg);
		case 'w':
			if (sensor_index == 0)
				pArgs->u32Main0Width = atoi(optarg);
			else if (sensor_index == 1)
				pArgs->u32Main1Width = atoi(optarg);
			else
				printf("# Error sensor index %d!\n", sensor_index);
			break;
		case 'h':
			if (sensor_index == 0)
				pArgs->u32Main0Height = atoi(optarg);
			else if (sensor_index == 1)
				pArgs->u32Main1Height = atoi(optarg);
			else
				printf("# Error sensor index %d!\n", sensor_index);
			break;
		case 'b':
			pArgs->s32BitRate = atoi(optarg);
			break;
		case 'e':
			if (!strcmp(optarg, "h264cbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264CBR;
			} else if (!strcmp(optarg, "h264vbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264VBR;
			} else if (!strcmp(optarg, "h264avbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264AVBR;
			} else if (!strcmp(optarg, "h265cbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265CBR;
			} else if (!strcmp(optarg, "h265vbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265VBR;
			} else if (!strcmp(optarg, "h265avbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265AVBR;
			} else {
				RK_LOGE("Invalid encoder type!");
				return RK_FAILURE;
			}
			break;
		case 'r':
			pArgs->bEnableWrap = atoi(optarg);
			break;
		case 'w' + 'l':
			if (0 == atoi(optarg)) {
				pArgs->u32WrapLine = 1;
			} else if (1 == atoi(optarg)) {
				pArgs->u32WrapLine = 2;
			} else if (2 == atoi(optarg)) {
				pArgs->u32WrapLine = 4;
			} else if (3 == atoi(optarg)) {
				pArgs->u32WrapLine = 8;
			} else {
				RK_LOGE("ERROR: Invalid WrapLine Value.");
			}
			break;
		case 'i' + 'm':
			pArgs->pIvaModelPath = optarg;
			break;
		case 'd':
			pArgs->u32IvaDetectFrameRate = atoi(optarg);
			break;
		case 'o':
			pArgs->pOutPathVenc = optarg;
			break;
		case 'f':
			pArgs->u32Fps = atoi(optarg);
			break;
		case 'v':
			pArgs->u32ViBuffCnt = atoi(optarg);
			break;
		case 'g':
			pArgs->u32Gop = atoi(optarg);
			break;
		case 'i' + 's' + 'm':
			pArgs->u32IspMode = atoi(optarg);
			break;
		case 'e' + 'i':
			pArgs->bEnableIva = atoi(optarg);
			break;
		case 'e' + 'i' + 's':
			pArgs->bEnableIvs = atoi(optarg);
			break;
		case 'e' + 'm' + 'f':
			pArgs->bEnableMultiMode = atoi(optarg);
			break;
		case 'e' + 'm' + 'h':
			pArgs->bEnableSaveToSdcard = atoi(optarg);
			break;
		case 'a' + 'm' + 'c':
			pArgs->s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			pArgs->s32SuspendTime = atoi(optarg);
			break;
		case 'b' + 'f':
			pArgs->u32BootFrame = atoi(optarg);
			break;
		case 'q' + 'k' + 's':
			pArgs->u32QuickStart = atoi(optarg);
			break;
		case 'c' + 'b':
			pArgs->u32CifBuffCnt = atoi(optarg);
			break;
		case 'c' + 'b' + 's' + 'z':
			pArgs->u32CacheBuffSize = atoi(optarg) * 1024 * 1024;
			break;
		case 'e' + 'c' + 'r' + 'e':
			pArgs->bEnableChangeResolution = (atoi(optarg) != 0);
			break;
		case 'e' + 's' + 'l':
			pArgs->bEnableScale = (atoi(optarg) != 0);
			break;
		case 'e' + 'r' + 't' + 's':
			pArgs->bEnableRtsp = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case '?':
			print_usage(argv[0]);
		default:
			return RK_FAILURE;
		}
	}

	return RK_SUCCESS;
}

/******************************************************************************
 * function    : main()
 * Description : main
 ******************************************************************************/
int main(int argc, char *argv[]) {
	RK_S32 s32Ret = RK_SUCCESS;

	if (argc < 2) {
		printf("bad arguments!\n");
		print_usage(argv[0]);
		return RK_FAILURE;
	}

	if (global_param_init() != RK_SUCCESS) {
		printf("global_param_init failure!\n");
		return RK_FAILURE;
	}

	// Parse command line.
	if (parse_cmd_args(argc, argv, g_cmd_args) != RK_SUCCESS) {
		printf("parse_cmd_args failure\n");
		goto __ISP_INIT_FAILED;
	}

	signal(SIGINT, sigterm_handler);
	signal(SIGTERM, sigterm_handler);

	if (rtsp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("rtsp_init failure!\n");
		return RK_FAILURE;
	}

	if (aov_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("aov_init failure!\n");
		return RK_FAILURE;
	}

	if (isp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("isp_init failure!\n");
		goto __ISP_INIT_FAILED;
	}

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		printf("RK_MPI_SYS_Init failure");
		goto __MPI_INIT_FAILED;
	}

	s32Ret = iva_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("iva_init failed %#X", s32Ret);
		goto __iva_init_failed;
	}

	s32Ret = ivs_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ivs_init failed %#X", s32Ret);
		goto __ivs_init_failed;
	}
	s32Ret = vi_chn_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("vi_init failed %#X", s32Ret);
		goto __vi_chn_init_failed;
	}

	s32Ret = venc_chn_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("venc_init failed %#X", s32Ret);
		goto __venc_init_failed;
	}

	s32Ret = rgn_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("rgn_init failed %#X", s32Ret);
		goto __rgn_init_failed;
	}

	s32Ret = bind_init(g_mpi_ctx, g_cmd_args);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("bind_init failed %#X", s32Ret);
		goto __bind_init_failed;
	}

	if (!g_cmd_args->u32QuickStart) {
		RK_MPI_VI_StartPipe(MAIN_CAM_INDEX);
		RK_MPI_VI_StartPipe(SUB_CAM_INDEX);
	}

	sub_threads_init(g_mpi_ctx, g_cmd_args);

	// Keep running ...
	while (!g_thread_status->bIfMainThreadQuit) {
		sleep(1);
	}

	sub_threads_deinit(g_mpi_ctx, g_cmd_args);
	bind_deinit(g_mpi_ctx, g_cmd_args);
__bind_init_failed:
	rgn_deinit(g_mpi_ctx, g_cmd_args);
__rgn_init_failed:
	venc_chn_deinit(g_mpi_ctx, g_cmd_args);
__venc_init_failed:
	vi_chn_deinit(g_mpi_ctx, g_cmd_args);
__vi_chn_init_failed:
	ivs_deinit(g_mpi_ctx, g_cmd_args);
__ivs_init_failed:
	iva_deinit(g_mpi_ctx, g_cmd_args);
__iva_init_failed:

	RK_MPI_SYS_Exit();

__MPI_INIT_FAILED:
	isp_deinit(g_mpi_ctx, g_cmd_args);
__ISP_INIT_FAILED:
	aov_deinit(g_mpi_ctx, g_cmd_args);
	rtsp_deinit(g_mpi_ctx, g_cmd_args);
	global_param_deinit();

	return g_exit_result;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
