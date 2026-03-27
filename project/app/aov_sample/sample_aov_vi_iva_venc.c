
/*
 * Copyright 2021 Rockchip Electronics Co. LTD
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <time.h>
#include <unistd.h>
#include "rtsp_demo.h"
#include "sample_comm.h"
#include "sample_comm_aov.h"
#include "utils.h"
#include "rtsp_demo.h"

#define VI_MAIN_CHANNEL 0
#define VI_IVA_CHANNEL 1
#define VI_BYPASS_CHANNEL 2
#define VENC_MAIN_CHANNEL 0
#define VENC_BYPASS_CHANNEL 1
#define VENC_CHN_MAX 2
#define RGN_CHANNEL 0
#define RED_COLOR 0x0000FF
#define BLUE_COLOR 0xFF0000

#define TRACE_BEGIN() RK_LOGW("Enter\n")
#define TRACE_END() RK_LOGW("Exit\n")

typedef struct _rkCmdArgs {
	RK_U32 u32Width;
	RK_U32 u32Height;
	RK_U32 u32IvaWidth;
	RK_U32 u32IvaHeight;
	RK_U32 u32BypassWidth;
	RK_U32 u32BypassHeight;
	RK_U32 u32BinWidth;
	RK_U32 u32BinHeight;
	RK_U32 u32BinFps;
	RK_U32 u32Fps;
	RK_U32 u32CamId;
	RK_U32 u32ViBuffCnt;
	RK_U32 u32Gop;
	RK_U32 u32BitRate;
	RK_CHAR *pIqFileDir;
	RK_BOOL bEnableRdbk;
	RK_CHAR *pCodecName;
	CODEC_TYPE_E enCodecType;
	VENC_RC_MODE_E enRcMode;
	RK_S32 s32AovLoopCount;
	RK_U32 u32BootFrame;
	RK_U32 u32MaxWakeupFrameCnt;
	RK_U32 u32SuspendTime;
	RK_BOOL bEnableIvs;
	RK_BOOL bEnableIva;
	RK_BOOL bEnableBypassStream;
	RK_BOOL bEnableSaveRawStream;
	RK_BOOL bEnableSaveMp4;
	RK_BOOL bEnableLowPowerMode;
	RK_BOOL bEnableFastAe;
	RK_BOOL bEnableMultiCore;
	RK_BOOL bEnableChangeResolution;
	RK_BOOL bEnableScale;
	RK_BOOL bEnableWrap;
	RK_BOOL bEnableSmartIr;
	RK_BOOL bEnableRtsp;
	RK_BOOL bEnableDraw2AInfo;
	RK_U32 u32WrapLine;
	RK_U32 u32MaxExpTime;
	RK_S32 s32MirrorFlip;
	RK_U32 u32IvaDetectFrameRate;
	RK_CHAR *pIvaModelPath;
} RkCmdArgs;

typedef struct _rkRtspCtx {
	pthread_mutex_t mutex;
	rtsp_demo_handle handle;
	rtsp_session_handle sessions[VENC_CHN_MAX];
} RTSP_CTX;

typedef struct _rkThreadStatus {
	RK_BOOL bIfMainThreadQuit;
	RK_BOOL bForceFlushData;
	pthread_t s32ViIvaThreadId;
} ThreadStatus;

typedef struct _rkMpiCtx {
	SAMPLE_VENC_CTX_S venc[2];
	SAMPLE_IVS_CTX_S ivs;
	SAMPLE_IVA_CTX_S iva;
	SAMPLE_RGN_CTX_S rgn[3];
	SAMPLE_MPI_MUXER_S *p_muxer;
	RTSP_CTX rtsp;
} SAMPLE_MPI_CTX_S;

enum ISP_MODE {
	SINGLE_FRAME_MODE,
	MULTI_FRAME_MODE,
};

static SAMPLE_MPI_CTX_S *g_mpi_ctx = NULL;
static ThreadStatus *g_thread_status = NULL;
static RkCmdArgs *g_cmd_args = NULL;
static RK_S32 g_exit_result = RK_FAILURE;
static sem_t g_wakeup_nn_result_semaphore;
static RK_S32 g_wakeup_nn_flag = 1;
static RK_CHAR optstr[] = "?::a::b:w:h:l:o:e:d:D:I:i:L:M:r:g:f:";
static const struct option long_options[] = {
    {"aiq", optional_argument, NULL, 'a'},
    {"bitrate", required_argument, NULL, 'b'},
    {"device_name", required_argument, NULL, 'd'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'h'},
    {"encode", required_argument, NULL, 'e'},
    {"fps", required_argument, NULL, 'f'},
    {"bin_width", required_argument, NULL, 'b' + 'w'},
    {"bin_height", required_argument, NULL, 'b' + 'h'},
    {"bin_fps", required_argument, NULL, 'b' + 'f' + 's'},
    {"gop", required_argument, NULL, 'g'},
    {"wrap", required_argument, RK_NULL, 'r'},
    {"vi_buff_cnt", required_argument, RK_NULL, 'v'},
    {"hdr_mode", required_argument, NULL, 'h' + 'm'},
    {"ae_mode", required_argument, NULL, 'a' + 'm'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"iva_detect_speed", required_argument, RK_NULL, 'i' + 'd' + 's'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"wrap_lines", required_argument, RK_NULL, 'w' + 'l'},
    {"enable_save_sdcard", required_argument, RK_NULL, 'e' + 's'},
    {"enable_save_mp4", required_argument, RK_NULL, 'e' + 'm'},
    {"max_wakeup_frame_count", required_argument, RK_NULL, 'm' + 'w'},
    {"quick_start", required_argument, NULL, 'q' + 'k' + 's'},
    {"low_power", required_argument, NULL, 'l' + 'w' + 'p'},
    {"camera_mirror_flip", required_argument, NULL, 'm' + 'p'},
    {"fast_ae", required_argument, NULL, 'f' + 'a'},
    {"enable_multi_core", required_argument, NULL, 'e' + 's' + 'p'},
    {"enable_bypass", required_argument, NULL, 'e' + 'b' + 'p'},
    {"enable_change_resolution", required_argument, NULL, 'e' + 'c' + 'r'},
    {"enable_scale", required_argument, NULL, 'e' + 's' + 'l'},
    {"enable_rdbk", required_argument, NULL, 'e' + 'r'},
    {"enable_iva", required_argument, RK_NULL, 'e' + 'i' + 'a'},
    {"enable_ivs", required_argument, RK_NULL, 'e' + 'i' + 's'},
    {"enable_smart_ir", required_argument, RK_NULL, 'e' + 's' + 'r'},
    {"enable_rtsp", required_argument, RK_NULL, 'e' + 'r' + 't' + 's'},
    {"enable_draw_2a", required_argument, RK_NULL, 'e' + 'd' + '2' + 'a'},
    {"max_exp_time", required_argument, RK_NULL, 'm' + 'e' + 't'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

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

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -w 2304 -h 1296 -a /etc/iqfiles/ -I 0 -e h264cbr -b 4096 "
	       "-i /usr/share/image.bmp -o /data/\n",
	       name);
	printf("\trtsp://xx.xx.xx.xx/live/0, Default OPEN\n");
#ifdef RKAIQ
	printf("\t-a | --aiq: enable aiq with dirpath provided, eg:-a "
	       "/etc/iqfiles/, "
	       "set dirpath empty to using path by default, without this option aiq "
	       "should run in other application\n");
#endif
	printf("\t-d | --device_name: set pcDeviceName, eg: /dev/video0 Default "
	       "NULL\n");
	printf("\t-w | --width: camera with, Default 1920\n");
	printf("\t-h | --height: camera height, Default 1080\n");
	printf("\t-e | --encode: encode type, Default:h265vbr, Value:h264cbr, "
	       "h264vbr, h264avbr "
	       "h265cbr, h265vbr, h265avbr, mjpegcbr, mjpegvbr\n");
	printf("\t-b | --bitrate: encode bitrate, Default 4096\n");
	printf("\t-i | --input_bmp_name: input file path of logo.bmp, Default NULL\n");
	printf("\t-r | --wrap : wrap for mainStream, 0: close 1: open, Default: 0\n");
	printf("\t-f | --fps: camera framerate. Default: 15\n");
	printf("\t-g | --gop: venc gop. Default: fps x 2\n");
	printf("\t--vi_buff_cnt : vi buffer cnount, default: 2\n");
	printf("\t--bin_width: sensor binning width, Default 960\n");
	printf("\t--bin_height: sensor binning height, Default 540\n");
	printf("\t--bin_fps: sensor binning fps, Default 120\n");
	printf("\t--enable_save_sdcard : enable save venc stream to sdcard, default: 1\n");
	printf("\t--enable_save_mp4 : enable save mp4 stream to sdcard, default: 1\n");
	printf("\t--wrap_lines : 0: height/1, 1: height/2, 2: height/4, 3: height/8. "
	       "default: 2\n");
	printf("\t--iva_detect_speed : iva detect framerate. default: 10\n");
	printf("\t--ae_mode: set aov ae wakeup mode, 0: MD wakupe: 1: always wakeup, 2: no "
	       "wakeup, Default: 0\n");
	printf("\t--aov_loop_count: set aov wakeup loop count, Default: -1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot, Default: "
	       "60 frames\n");
	printf("\t--max_wakeup_frame_count: max frame count running in multi "
	       "frame mode after wakeup by gpio, Default: 3000\n");
	printf("\t--quick_start: quick start stream, Default: 0\n");
	printf("\t--low_power: After awakening, perform human form detection and encoding. "
	       "1: open, 0: close. default: 0\n");
	printf("\t--camera_mirror_flip: camera mirror flip, 0: 0, 1: 90, 2: 180, 3: 270. "
	       "Defaule 0\n");
	printf("\t--fast_ae: enable faset ae, 0: close, 1: enable. default: 0\n");
	printf("\t--enable_multi_core: enable run in multi cpu core(just effective for "
	       "rv1126), Default: 1\n");
	printf("\t--enable_bypass: enable bypass stream, Default: 1\n");
	printf("\t--enable_change_resolution: enable change to small resolution in single "
	       "frame mode, Default: 0\n");
	printf("\t--enable_scale: enable scale binning input by isp, Default: 0\n");
	printf("\t--enable_rdbk: force to use isp rdbk mode, Default: 0."
	       "If isp scale is configured, force isp running in rdbk mode.\n");
	printf("\t--enable_iva : enable human detect, default: 1\n");
	printf("\t--enable_ivs : enable motion detect, default: 1\n");
	printf("\t--enable_smart_ir : enable auto switch ircut and irled when day/night "
	       "switch, default: 1\n");
	printf("\t--max_exp_time: max exposure time(ms) limit in aov mode. default: 0\n");
	printf("\t--enable_rtsp : enable rtsp, default: 1\n");
	printf(
	    "\t--enable_draw_2a: enable draw ae and awb info in main stream, Default: 0.\n");
}

/******************************************************************************
 * function : venc thread
 ******************************************************************************/
static void *venc_get_stream(void *pArgs) {
	SAMPLE_VENC_CTX_S *ctx = (SAMPLE_VENC_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_S32 venc_data_size = 0;
	RK_S32 force_flush_to_storage = 0;
	uint64_t pre_pts = 0;
	char *venc_data = NULL;

	if (g_cmd_args->bEnableSaveMp4) {
		s32Ret = SAMPLE_COMM_AOV_InitMp4(ctx, &g_mpi_ctx->p_muxer);
		if (s32Ret != RK_SUCCESS) {
			g_cmd_args->bEnableSaveMp4 = RK_FALSE;
			g_cmd_args->bEnableSaveRawStream = RK_TRUE;
		} else {
			g_cmd_args->bEnableSaveRawStream = RK_FALSE;
		}
	}
	if (g_cmd_args->bEnableSaveRawStream) {
		venc_data = (char *)malloc(AOV_STREAM_SIZE_WRITE_TO_SDCARD); // 10M form 200 frame
		venc_data_size = 0;
		RK_MPI_VENC_RequestIDR(ctx->s32ChnId, RK_FALSE);
	}
	while (!g_thread_status->bIfMainThreadQuit) {
		s32Ret = SAMPLE_COMM_VENC_GetStream(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			SAMPLE_COMM_AOV_DumpPtsToTMP(ctx->stFrame.u32Seq,
			                             ctx->stFrame.pstPack->u64PTS,
			                             g_cmd_args->u32BootFrame);
			if (g_cmd_args->bEnableSaveMp4) {
				SAMPLE_COMM_AOV_CopyMp4StreamToSdcard(g_mpi_ctx->p_muxer, &ctx->stFrame,
				                                      pData,
				                                      g_thread_status->bForceFlushData);
				g_thread_status->bForceFlushData = false;
			} else if (g_cmd_args->bEnableSaveRawStream) {
				if ((venc_data_size + ctx->stFrame.pstPack->u32Len) <=
				        AOV_STREAM_SIZE_WRITE_TO_SDCARD &&
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
					g_thread_status->bForceFlushData = false;
					RK_MPI_VENC_RequestIDR(ctx->s32ChnId, RK_FALSE);
					SAMPLE_COMM_AOV_CopyRawStreamToSdcard(ctx->s32ChnId, venc_data,
					                                      venc_data_size, pData,
					                                      ctx->stFrame.pstPack->u32Len);
					venc_data_size = 0;
				}
			}
			if (g_cmd_args->bEnableRtsp) {
				pthread_mutex_lock(&g_mpi_ctx->rtsp.mutex);
				rtsp_tx_video(g_mpi_ctx->rtsp.sessions[ctx->s32ChnId], pData,
				              ctx->stFrame.pstPack->u32Len, ctx->stFrame.pstPack->u64PTS);
				rtsp_do_event(g_mpi_ctx->rtsp.handle);
				pthread_mutex_unlock(&g_mpi_ctx->rtsp.mutex);
			}
			RK_LOGD("chn:%d, loopCount:%d, len:%u, pts:%llu, pts count:%llu, seq:%u",
			        ctx->s32ChnId, loopCount, ctx->stFrame.pstPack->u32Len,
			        ctx->stFrame.pstPack->u64PTS,
			        (ctx->stFrame.pstPack->u64PTS - pre_pts) / 1000, ctx->stFrame.u32Seq);
			pre_pts = ctx->stFrame.pstPack->u64PTS;
			SAMPLE_COMM_VENC_ReleaseStream(ctx);
			loopCount++;
		}
	}
	if (g_cmd_args->bEnableSaveMp4) {
		SAMPLE_COMM_AOV_DeinitMp4(g_mpi_ctx->p_muxer);
	} else if (g_cmd_args->bEnableSaveRawStream) {
		if (venc_data_size > 0)
			SAMPLE_COMM_AOV_CopyRawStreamToSdcard(ctx->s32ChnId, venc_data,
			                                      venc_data_size, NULL, 0);
		venc_data_size = 0;
		free(venc_data);
	}
	return RK_NULL;
}

static void *venc_get_bypass_stream(void *pArgs) {
	SAMPLE_VENC_CTX_S *ctx = (SAMPLE_VENC_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_LOGI("enter bypass stream thread");
	while (!g_thread_status->bIfMainThreadQuit) {
		s32Ret = SAMPLE_COMM_VENC_GetStream(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			RK_LOGD("chn:%d, loopCount:%d, len:%u, pts:%llu, seq:%u", ctx->s32ChnId,
			        loopCount, ctx->stFrame.pstPack->u32Len, ctx->stFrame.pstPack->u64PTS,
			        ctx->stFrame.u32Seq);
			SAMPLE_COMM_VENC_ReleaseStream(ctx);
			loopCount++;
		}
	}
	RK_LOGI("exit bypass stream thread");
	return RK_NULL;
}

static void rkIvaEvent_callback(const RockIvaDetectResult *result,
                                const RockIvaExecuteStatus status, void *userData) {
	if (result->objNum == 0) {
		if (g_wakeup_nn_flag > 0)
			g_wakeup_nn_flag--;
	} else {
		g_wakeup_nn_flag = g_cmd_args->u32Fps * 5;
	}
	RK_LOGD("RKIVA: objNum is %d, g_wakeup_nn_flag = %d\n", result->objNum,
	        g_wakeup_nn_flag);
	if (result->objNum == 0)
		return;
	SAMPLE_COMM_IVA_Push_Result((SAMPLE_IVA_CTX_S *)userData, result);
	for (int i = 0; i < result->objNum; i++) {
		RK_LOGD("topLeft:[%d,%d], bottomRight:[%d,%d],"
		        "objId is %d, frameId is %d, score is %d, type is %d\n",
		        result->objInfo[i].rect.topLeft.x, result->objInfo[i].rect.topLeft.y,
		        result->objInfo[i].rect.bottomRight.x,
		        result->objInfo[i].rect.bottomRight.y, result->objInfo[i].objId,
		        result->objInfo[i].frameId, result->objInfo[i].score,
		        result->objInfo[i].type);
	}
}

static void rkIvaFrame_releaseCallBack(const RockIvaReleaseFrames *releaseFrames,
                                       void *userdata) {
	/* when iva handle out of the video frame，this func will be called*/
	RK_S32 s32Ret = RK_SUCCESS;
	for (RK_S32 i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			RK_LOGE("---------error release frame is null");
			// program_handle_error(__func__, __LINE__);
			continue;
		}
		s32Ret = RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL,
		                                   releaseFrames->frames[i].extData);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_ReleaseChnFrame failure:%#X", s32Ret);
			// program_handle_error(__func__, __LINE__);
		}
		free(releaseFrames->frames[i].extData);
	}
	sem_post(&g_wakeup_nn_result_semaphore);
}

static RK_S32 change_sensor_resolution(SAMPLE_MPI_CTX_S *ctx, int width, int height,
                                       int fps) {
	RK_S32 s32Ret = RK_FAILURE;
	// 1. stop isp stream
	struct timespec t1, t2, t3, t4;
	clock_gettime(CLOCK_MONOTONIC, &t1);
	VI_CHN_ATTR_S vi_chn_attr;
	VI_SENSOR_SETTING_S sensor_setting;
	VENC_CHN_ATTR_S venc_chn_attr;
	VENC_RECV_PIC_PARAM_S venc_recv_param;

#if defined(RV1106) || defined(RV1106B)
	s32Ret = RK_MPI_VI_GetChnAttr(g_cmd_args->u32CamId, VI_MAIN_CHANNEL, &vi_chn_attr);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_GetChnAttr failure:%X", s32Ret);
		return s32Ret;
	}

	RK_MPI_VI_PauseChn(g_cmd_args->u32CamId, VI_MAIN_CHANNEL);
	RK_MPI_VI_PauseChn(g_cmd_args->u32CamId, VI_IVA_CHANNEL);
	RK_MPI_VENC_StopRecvFrame(VENC_MAIN_CHANNEL);
	if (g_cmd_args->bEnableBypassStream) {
		RK_MPI_VI_PauseChn(g_cmd_args->u32CamId, VI_BYPASS_CHANNEL);
		RK_MPI_VENC_StopRecvFrame(VENC_BYPASS_CHANNEL);
	}

	// 2. switch sensor resolution
	memset(&sensor_setting, 0, sizeof(sensor_setting));
	sensor_setting.u32SensorWidth = width;
	sensor_setting.u32SensorHeight = height;
	sensor_setting.u32SensorFps = fps;
	sensor_setting.enSensorFmt = RK_FMT_RGB_BAYER_SBGGR_10BPP;
	sensor_setting.enSensorMode = SENSOR_NO_HDR;
	s32Ret = RK_MPI_VI_DevSelectSetting(g_cmd_args->u32CamId, &sensor_setting);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_DevSelectSetting failed, width = %d, height = %d, fps = %d\n",
		        width, height, fps);
		return s32Ret;
	}

	if (!g_cmd_args->bEnableScale) {
		vi_chn_attr.stSize.u32Width = width;
		vi_chn_attr.stSize.u32Height = height;
		s32Ret =
		    RK_MPI_VI_SetChnAttr(g_cmd_args->u32CamId, VI_MAIN_CHANNEL, &vi_chn_attr);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", s32Ret);
			return s32Ret;
		}
		RK_MPI_VENC_GetChnAttr(VENC_MAIN_CHANNEL, &venc_chn_attr);
		venc_chn_attr.stVencAttr.u32MaxPicWidth = width;
		venc_chn_attr.stVencAttr.u32MaxPicHeight = height;
		venc_chn_attr.stVencAttr.u32PicWidth = width;
		venc_chn_attr.stVencAttr.u32PicHeight = height;
		venc_chn_attr.stVencAttr.u32VirWidth = width;
		venc_chn_attr.stVencAttr.u32VirHeight = height;
		s32Ret = RK_MPI_VENC_SetChnAttr(VENC_MAIN_CHANNEL, &venc_chn_attr);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_SetChnAttr failure:%X", s32Ret);
			return s32Ret;
		}
	}

	// 3. pause aiq
	clock_gettime(CLOCK_MONOTONIC, &t2);
	SAMPLE_COMM_ISP_Pause(g_cmd_args->u32CamId);

	// 4. resume aiq
	s32Ret = SAMPLE_COMM_ISP_Run(g_cmd_args->u32CamId);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_ISP_Run failed %#X", s32Ret);
		return s32Ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &t3);
	// 5. resume isp stream
	s32Ret = RK_MPI_VI_ResumeChn(g_cmd_args->u32CamId, VI_MAIN_CHANNEL);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_ResumeChn failed %#X", s32Ret);
		return s32Ret;
	}
	venc_recv_param.s32RecvPicNum = -1;
	s32Ret = RK_MPI_VENC_StartRecvFrame(VENC_MAIN_CHANNEL, &venc_recv_param);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VENC_StartRecvFrame failed %#X", s32Ret);
		return s32Ret;
	}

	s32Ret = RK_MPI_VI_ResumeChn(g_cmd_args->u32CamId, VI_IVA_CHANNEL);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_ResumeChn failed %#X", s32Ret);
		return s32Ret;
	}
	if (g_cmd_args->bEnableBypassStream) {
		s32Ret = RK_MPI_VI_ResumeChn(g_cmd_args->u32CamId, VI_BYPASS_CHANNEL);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_ResumeChn failed %#X", s32Ret);
			return s32Ret;
		}
		s32Ret = RK_MPI_VENC_StartRecvFrame(VENC_MAIN_CHANNEL, &venc_recv_param);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_StartRecvFrame failed %#X", s32Ret);
			return s32Ret;
		}
	}

	RK_MPI_VENC_RequestIDR(ctx->venc[0].s32ChnId, RK_FALSE);
	clock_gettime(CLOCK_MONOTONIC, &t4);
	long diff_ms_t4_t1 =
	    ((t4.tv_sec - t1.tv_sec) * 1000) + ((t4.tv_nsec - t1.tv_nsec) / 1000000);
	long diff_ms_t4_t3 =
	    ((t4.tv_sec - t3.tv_sec) * 1000) + ((t4.tv_nsec - t3.tv_nsec) / 1000000);
	long diff_ms_t3_t2 =
	    ((t3.tv_sec - t2.tv_sec) * 1000) + ((t3.tv_nsec - t2.tv_nsec) / 1000000);
	long diff_ms_t2_t1 =
	    ((t2.tv_sec - t1.tv_sec) * 1000) + ((t2.tv_nsec - t1.tv_nsec) / 1000000);
	RK_LOGE("Time Difference: total %ld ms, vi resume %ld ms, aiq resume %ld ms, vi "
	        "resolution change %ld ms \n",
	        diff_ms_t4_t1, diff_ms_t3_t2, diff_ms_t4_t3, diff_ms_t2_t1);
#endif
	return s32Ret;
}

static RK_BOOL send_vi_frame_to_iva(VIDEO_FRAME_INFO_S *frame, RK_U32 u32Loopcount,
                                    enum ISP_MODE mode) {
	RK_S32 s32Fd, s32Ret = RK_SUCCESS;
	RK_BOOL md = RK_FALSE;
	VIDEO_FRAME_INFO_S *stViFrame = NULL;
	struct timespec iva_start_time, iva_end_time;
	RockIvaImage ivaImage;

	if (g_cmd_args->bEnableIvs && mode == SINGLE_FRAME_MODE) {
		clock_gettime(CLOCK_MONOTONIC, &iva_start_time);
		md = SAMPLE_COMM_IVS_bMove(&g_mpi_ctx->ivs, frame);
		clock_gettime(CLOCK_MONOTONIC, &iva_end_time);
		RK_LOGD("ivs cost time %lld ms\n",
		        (iva_end_time.tv_sec - iva_start_time.tv_sec) * 1000LL +
		            (iva_end_time.tv_nsec - iva_start_time.tv_nsec) / 1000000LL);
		if (!md) {
			RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, frame);
			RK_LOGD("skip iva because md");
			return md;
		}
	}
	if (!g_cmd_args->bEnableIva) {
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, frame);
		return md;
	}

	stViFrame = (VIDEO_FRAME_INFO_S *)malloc(sizeof(VIDEO_FRAME_INFO_S));
	if (!stViFrame) {
		RK_LOGE("-----error malloc fail for stViFrame");
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, frame);
		return md;
	}
	memset(&ivaImage, 0, sizeof(RockIvaImage));
	memset(stViFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
	memcpy(stViFrame, frame, sizeof(VIDEO_FRAME_INFO_S));
	s32Fd = RK_MPI_MB_Handle2Fd(stViFrame->stVFrame.pMbBlk);
	ivaImage.info.transformMode = g_mpi_ctx->iva.eImageTransform;
	ivaImage.info.width = stViFrame->stVFrame.u32Width;
	ivaImage.info.height = stViFrame->stVFrame.u32Height;
	ivaImage.info.format = g_mpi_ctx->iva.eImageFormat;
	ivaImage.frameId = u32Loopcount;
	ivaImage.dataAddr = NULL;
	ivaImage.dataPhyAddr = NULL;
	ivaImage.dataFd = s32Fd;
	ivaImage.extData = stViFrame;
	clock_gettime(CLOCK_MONOTONIC, &iva_start_time);
	s32Ret = ROCKIVA_PushFrame(g_mpi_ctx->iva.ivahandle, &ivaImage, NULL);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_PushFrame failed %#X", s32Ret);
		return md;
	}
	// Wait IVA result callback
	sem_wait(&g_wakeup_nn_result_semaphore);
	clock_gettime(CLOCK_MONOTONIC, &iva_end_time);
	RK_LOGD("iva cost time %lld ms\n",
	        (iva_end_time.tv_sec - iva_start_time.tv_sec) * 1000LL +
	            (iva_end_time.tv_nsec - iva_start_time.tv_nsec) / 1000000LL);
	return md;
}

static void enter_single_frame_mode(void) {
	VIDEO_FRAME_INFO_S tmp_frame;
	// You'd better change sensor resolution in multi frame mode.
	// TODO:
	// Query sensor setting before change sensor resolution.
	if (g_cmd_args->bEnableChangeResolution) {
		RK_S32 s32Ret =
		    change_sensor_resolution(g_mpi_ctx, g_cmd_args->u32BinWidth,
		                             g_cmd_args->u32BinHeight, g_cmd_args->u32BinFps);
		if (s32Ret != RK_SUCCESS) {
			program_handle_error(__func__, __LINE__);
			return;
		}
	}
	SAMPLE_COMM_ISP_SingleFrame(g_cmd_args->u32CamId);
	// Disable tracking mode of iva.
	if (g_cmd_args->bEnableIva)
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva, ROCKIVA_MODE_PICTURE);
	// Stop record mp4 stream when switch to multi frame mode.
	if (g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_StopRecordMp4(g_mpi_ctx->p_muxer);
	// Close non-boot cpus in single frame mode
	if (!g_cmd_args->bEnableMultiCore)
		SAMPLE_COMM_AOV_DisableNonBootCPUs();
	// Reduced the number of judgment frames for day/night switching
	// in single frame mode
	if (g_cmd_args->bEnableSmartIr)
		SAMPLE_COMM_SmartIr_SetThreshold(5);
	// Drop residual frames in pipeline.
	while (RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, &tmp_frame, 300) ==
	       RK_SUCCESS)
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, &tmp_frame);
}

static void enter_multi_frame_mode(void) {
	SAMPLE_COMM_ISP_MultiFrame(g_cmd_args->u32CamId);
	// You'd better change sensor resolution in multi frame mode.
	// TODO:
	// Query sensor setting before change sensor resolution.
	if (g_cmd_args->bEnableChangeResolution) {
		RK_S32 s32Ret = change_sensor_resolution(g_mpi_ctx, g_cmd_args->u32Width,
		                                         g_cmd_args->u32Height, 60);
		if (s32Ret != RK_SUCCESS) {
			program_handle_error(__func__, __LINE__);
			return;
		}
		// restore fps in multi frame mode.
		SAMPLE_COMM_ISP_SetFrameRate(g_cmd_args->u32CamId, g_cmd_args->u32Fps);
	}
	// Enable tracking mode of iva.
	if (g_cmd_args->bEnableIva)
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva, ROCKIVA_MODE_VIDEO);
	// Start record mp4 stream when switch to multi frame mode.
	if (g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_StartRecordMp4(g_mpi_ctx->p_muxer);
	if (!g_cmd_args->bEnableMultiCore)
		SAMPLE_COMM_AOV_EnableNonBootCPUs();
	if (g_cmd_args->bEnableSmartIr)
		SAMPLE_COMM_SmartIr_SetThreshold(50);
}

static void capture_frames_in_normal_mode(void) {
	RK_CHAR *pData = RK_NULL;
	RK_S32 s32Ret = RK_FAILURE;
	VIDEO_FRAME_INFO_S stVencFrame, stIvaFrame;
	if (g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_StartRecordMp4(g_mpi_ctx->p_muxer);
	for (int i = 0; i < g_cmd_args->u32BootFrame; i++) {
		SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->rgn[1], "NORMAL",
		                        SAMPLE_COMM_ISP_GetFrameRate(g_cmd_args->u32CamId));
		if (g_cmd_args->bEnableIva)
			SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &g_mpi_ctx->iva,
			                                RK_FALSE);
		s32Ret =
		    RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, &stIvaFrame, -1);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_GetChnFrame %d failed %#X", VI_IVA_CHANNEL, s32Ret);
			program_handle_error(__func__, __LINE__);
			break;
		}
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL, &stIvaFrame);
		if (!g_cmd_args->bEnableLowPowerMode)
			continue;

		s32Ret = RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_MAIN_CHANNEL,
		                               &stVencFrame, -1);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_GetChnFrame %d failed %#X", VI_MAIN_CHANNEL, s32Ret);
			program_handle_error(__func__, __LINE__);
			break;
		} else {
			RK_LOGD("vi frame w %d, h %d, seq %d, pts %lld",
			        stVencFrame.stVFrame.u32Width, stVencFrame.stVFrame.u32Height,
			        stVencFrame.stVFrame.u32TimeRef, stVencFrame.stVFrame.u64PTS);
		}
		s32Ret = RK_MPI_VENC_SendFrame(VENC_MAIN_CHANNEL, &stVencFrame, 1000);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_SendFrame chn %d failed %#X", VENC_MAIN_CHANNEL, s32Ret);
		}
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_MAIN_CHANNEL, &stVencFrame);
	}
	if (g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_StopRecordMp4(g_mpi_ctx->p_muxer);
}

static void unbindAllDevices() {
	if (!g_cmd_args->bEnableMultiCore)
		SAMPLE_COMM_AOV_DisableNonBootCPUs();
	// Unbind sdcard device and sound card device to reduce power consumption
	// in aov mode.
	SAMPLE_COMM_AOV_UnbindSdcard();
	if (!g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_UnbindSoundcard();
	SAMPLE_COMM_AOV_UnbindSDIO();
	if (!g_cmd_args->bEnableRtsp)
		SAMPLE_COMM_AOV_UnbindUsb();
}
static void bindAllDevices() {
	if (!g_cmd_args->bEnableMultiCore)
		SAMPLE_COMM_AOV_EnableNonBootCPUs();
	SAMPLE_COMM_AOV_BindSdcard();
	if (!g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_BindSoundcard();
	SAMPLE_COMM_AOV_BindSDIO();
	if (!g_cmd_args->bEnableRtsp)
		SAMPLE_COMM_AOV_BindUsb();
}
static void *vi_iva_thread(void *pArgs) {
	prctl(PR_SET_NAME, "vi_iva_thread");
	SAMPLE_MPI_CTX_S *ctx = g_mpi_ctx;
	RK_S32 s32Ret = RK_FAILURE;
	RK_U32 u32Loopcount = 0, aov_loop_count = 0;
	enum ISP_MODE wakeup_current_mode = MULTI_FRAME_MODE;
	bool is_gpioirq_happened = false;
	RK_S32 wakeup_frame_count = 0;
	VIDEO_FRAME_INFO_S stVencFrame, stIvaFrame;
	RK_BOOL bExpBigChange = RK_FALSE;
	RK_BOOL bMd = RK_FALSE;

	sem_init(&g_wakeup_nn_result_semaphore, 0, 0);
	g_wakeup_nn_flag = 0;

	// 0. Befor enter AOV mode.
	capture_frames_in_normal_mode();

	unbindAllDevices();

	SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events.
	while (!g_thread_status->bIfMainThreadQuit) {
		// 1. Check input event to detect weather gpio irq is happened.
		is_gpioirq_happened = SAMPLE_COMM_AOV_GetGpioIrqStat();
		RK_LOGD("is_gpioirq_happened %d", is_gpioirq_happened);
		// Force flush cached data to sdcard when wakeup by interrupt
		if (is_gpioirq_happened)
			g_thread_status->bForceFlushData = true;

		// 2. Get frame from VI
		do {
			memset(&stIvaFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
			s32Ret = RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL,
			                               &stIvaFrame, 3000);
			if (s32Ret != RK_SUCCESS)
				RK_LOGE("RK_MPI_VI_GetChnFrame %d failed %#X", VI_IVA_CHANNEL, s32Ret);
			else
				RK_LOGD("get vi chn 1 frame w %d, h %d, seq %d, pts %lld mb %p",
				        stIvaFrame.stVFrame.u32Width, stIvaFrame.stVFrame.u32Height,
				        stIvaFrame.stVFrame.u32TimeRef, stIvaFrame.stVFrame.u64PTS,
				        stIvaFrame.stVFrame.pMbBlk);
		} while (s32Ret != RK_SUCCESS);

		// 3. Send frame to ivs and iva.
		// Send frame to iva to do human body detect.
		// And wait for iva result callback.
		if (g_cmd_args->bEnableDraw2AInfo)
			SAMPLE_COMM_RGN_Draw2AInfo(&ctx->rgn[2], g_cmd_args->u32CamId);
		if (wakeup_current_mode == SINGLE_FRAME_MODE) {
			bMd = send_vi_frame_to_iva(&stIvaFrame, u32Loopcount, wakeup_current_mode);
			SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[1], bMd ? "AOV_M" : "AOV_I",
			                        1000 / (float)g_cmd_args->u32SuspendTime);

			if (g_cmd_args->bEnableIva)
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &g_mpi_ctx->iva,
				                                RK_FALSE);
		} else {
			SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[1], "NORMAL",
			                        SAMPLE_COMM_ISP_GetFrameRate(g_cmd_args->u32CamId));
			send_vi_frame_to_iva(&stIvaFrame, u32Loopcount, wakeup_current_mode);
			if (g_cmd_args->bEnableIva)
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &g_mpi_ctx->iva,
				                                RK_TRUE);
		}

		// 4. Change ISP state if need.
		if (g_cmd_args->bEnableFastAe)
			bExpBigChange = SAMPLE_COMM_ISP_IsExpBigChange(g_cmd_args->u32CamId);
		switch (wakeup_current_mode) {
		case SINGLE_FRAME_MODE:
			// The condition for switching to multi frame mode is:
			//	1) Have detected a human body.
			//	2) GPIO irq is happend.
			//  3) FastAE mode, AE is not converged
			if (g_wakeup_nn_flag > 0 || is_gpioirq_happened || bExpBigChange) {
				// Change to multi frame mode.
				RK_LOGI("#Resume isp, Enter multi frame, wakeup because %s\n",
				        is_gpioirq_happened ? "gpio irq" : "detected human body");
				enter_multi_frame_mode();
				wakeup_current_mode = MULTI_FRAME_MODE;
				if (is_gpioirq_happened) {
					wakeup_frame_count = g_cmd_args->u32MaxWakeupFrameCnt;
					is_gpioirq_happened = false;
				}
			}
			if (get_int32_from_env("test_aov_resume_suspend", 0) &&
			    (aov_loop_count % 60) == 0) {
				RK_LOGI("#Resume isp, Enter multi frame for test");
				enter_multi_frame_mode();
				wakeup_current_mode = MULTI_FRAME_MODE;
				wakeup_frame_count = 60;
			}
			break;
		case MULTI_FRAME_MODE:
			// The condition for switching to single frame mode is:
			//	1) Have not detected human body too much times.
			//	2) GPIO irq is happend.
			//	3) wakeup_frame_count equals to zero.
			if (get_int32_from_env("test_skip_aov", 0))
				break;
			if (wakeup_frame_count > 0 && !is_gpioirq_happened) {
				--wakeup_frame_count;
				RK_LOGD("wakeup_frame_count %d", wakeup_frame_count);
			} else if ((g_wakeup_nn_flag > 0 || bExpBigChange) && !is_gpioirq_happened) {
				// Keep in multi frame mode.
				if (g_wakeup_nn_flag)
					RK_LOGD("detected human body, loop %d", u32Loopcount);
				else
					RK_LOGD("ae is not converge, loop %d", u32Loopcount);
			} else {
				// Change to single frame mode.
				RK_LOGI("#Pause isp, Enter single frame\n");
				enter_single_frame_mode();
				wakeup_current_mode = SINGLE_FRAME_MODE;
				wakeup_frame_count = 0;
			}
			break;
		}
		if (g_cmd_args->bEnableSmartIr)
			SAMPLE_COMM_SmartIr_SwitchScene();
		// 5. Enter sleep mode if in single frame mode.
		if (wakeup_current_mode == SINGLE_FRAME_MODE) {
			++aov_loop_count;
			if (g_cmd_args->s32AovLoopCount > 0 &&
			    aov_loop_count > g_cmd_args->s32AovLoopCount) {
				RK_LOGI("Exit AOV!");
				break;
			} else {
				SAMPLE_COMM_AOV_EnterSleep();
			}
		}
	}
	if (wakeup_current_mode == SINGLE_FRAME_MODE) {
		enter_multi_frame_mode();
		wakeup_current_mode = MULTI_FRAME_MODE;
	}

	bindAllDevices();

	capture_frames_in_normal_mode();
	program_normal_exit(__func__, __LINE__);
	RK_LOGE("vi_iva_thread exit !!!");
	return RK_NULL;
}

static void *vi_iva_low_power_thread(void *pArgs) {
	prctl(PR_SET_NAME, "vi_iva_low_power_thread");
	SAMPLE_MPI_CTX_S *ctx = g_mpi_ctx;
	RK_S32 s32Ret = RK_FAILURE;
	RK_U32 u32Loopcount = 0;
	enum ISP_MODE wakeup_current_mode = MULTI_FRAME_MODE;
	bool is_gpioirq_happened = false;
	RK_S32 wakeup_frame_count = 0;
	VIDEO_FRAME_INFO_S stVencFrame, stIvaFrame;
	RK_BOOL bExpBigChange = RK_FALSE;
	RK_BOOL bMd = RK_FALSE;

	sem_init(&g_wakeup_nn_result_semaphore, 0, 0);
	g_wakeup_nn_flag = 0;

	// 0. Befor enter AOV mode.
	capture_frames_in_normal_mode();

	unbindAllDevices();

	SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events.
	while (!g_thread_status->bIfMainThreadQuit) {
		// 1. Check input event to detect weather gpio irq is happened.
		is_gpioirq_happened = SAMPLE_COMM_AOV_GetGpioIrqStat();
		RK_LOGD("is_gpioirq_happened %d", is_gpioirq_happened);
		// 2. Get frame from VI
		do {
			memset(&stVencFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
			s32Ret = RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_MAIN_CHANNEL,
			                               &stVencFrame, 3000);
			if (s32Ret != RK_SUCCESS)
				RK_LOGE("RK_MPI_VI_GetChnFrame %d failed %#X", VI_MAIN_CHANNEL, s32Ret);
			else
				RK_LOGD("get vi chn 0 frame w %d, h %d, seq %d, pts %lld, mb %p",
				        stVencFrame.stVFrame.u32Width, stVencFrame.stVFrame.u32Height,
				        stVencFrame.stVFrame.u32TimeRef, stVencFrame.stVFrame.u64PTS,
				        stVencFrame.stVFrame.pMbBlk);
		} while (s32Ret != RK_SUCCESS);
		do {
			memset(&stIvaFrame, 0, sizeof(VIDEO_FRAME_INFO_S));
			s32Ret = RK_MPI_VI_GetChnFrame(g_cmd_args->u32CamId, VI_IVA_CHANNEL,
			                               &stIvaFrame, 3000);
			if (s32Ret != RK_SUCCESS)
				RK_LOGE("RK_MPI_VI_GetChnFrame %d failed %#X", VI_IVA_CHANNEL, s32Ret);
			else
				RK_LOGD("get vi chn 1 frame w %d, h %d, seq %d, pts %lld mb %p",
				        stIvaFrame.stVFrame.u32Width, stIvaFrame.stVFrame.u32Height,
				        stIvaFrame.stVFrame.u32TimeRef, stIvaFrame.stVFrame.u64PTS,
				        stIvaFrame.stVFrame.pMbBlk);
		} while (s32Ret != RK_SUCCESS);
		// 3. Change ISP state if need.
		if (g_cmd_args->bEnableFastAe)
			bExpBigChange = SAMPLE_COMM_ISP_IsExpBigChange(g_cmd_args->u32CamId);
		switch (wakeup_current_mode) {
		case SINGLE_FRAME_MODE:
			// The condition for switching to multi frame mode is:
			//	1) Have detected a human body.
			//	2) GPIO irq is happend.
			//  3) FastAE mode, AE is not converged
			if (g_wakeup_nn_flag > 0 || is_gpioirq_happened || bExpBigChange) {
				// Change to multi frame mode.
				RK_LOGI("#Resume isp, Enter multi frame, wakeup because %s\n",
				        is_gpioirq_happened ? "gpio irq" : "detected human body");
				enter_multi_frame_mode();
				wakeup_current_mode = MULTI_FRAME_MODE;
				if (is_gpioirq_happened) {
					wakeup_frame_count = g_cmd_args->u32MaxWakeupFrameCnt;
					is_gpioirq_happened = false;
				}
			}
			break;
		case MULTI_FRAME_MODE:
			// The condition for switching to single frame mode is:
			//	1) Have not detected human body too much times.
			//	2) GPIO irq is happend.
			//	3) wakeup_frame_count equals to zero.
			if (wakeup_frame_count > 0 && !is_gpioirq_happened) {
				--wakeup_frame_count;
				RK_LOGD("wakeup_frame_count %d", wakeup_frame_count);
			} else if ((g_wakeup_nn_flag > 0 || bExpBigChange) && !is_gpioirq_happened) {
				// Keep in multi frame mode.
				if (g_wakeup_nn_flag)
					RK_LOGD("detected human body, loop %d", u32Loopcount);
				else
					RK_LOGD("ae is not converge, loop %d", u32Loopcount);
			} else {
				// Change to single frame mode.
				RK_LOGI("#Pause isp, Enter single frame\n");
				enter_single_frame_mode();
				wakeup_current_mode = SINGLE_FRAME_MODE;
				wakeup_frame_count = 0;
			}
			break;
		}
		// 4. Enter sleep mode if in single frame mode.
		if (wakeup_current_mode == SINGLE_FRAME_MODE) {
			if (g_cmd_args->s32AovLoopCount != 0) {
				if (g_cmd_args->s32AovLoopCount > 0)
					--g_cmd_args->s32AovLoopCount;
				SAMPLE_COMM_AOV_EnterSleep();
			} else if (g_cmd_args->s32AovLoopCount == 0) {
				RK_LOGI("Exit AOV!");
				break;
			}
		}
		// 5. Send frame to venc and iva.
		s32Ret = RK_MPI_VENC_SendFrame(VENC_MAIN_CHANNEL, &stVencFrame, 1000);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VENC_SendFrame chn %d failed %#X", VENC_MAIN_CHANNEL, s32Ret);
		}
		RK_MPI_VI_ReleaseChnFrame(g_cmd_args->u32CamId, VI_MAIN_CHANNEL, &stVencFrame);
		// Send frame to iva to do human body detect.
		// And wait for iva result callback.
		bMd = send_vi_frame_to_iva(&stIvaFrame, u32Loopcount, wakeup_current_mode);
		if (wakeup_current_mode == SINGLE_FRAME_MODE) {
			SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[1], bMd ? "AOV_M" : "AOV_I",
			                        1000 / (float)g_cmd_args->u32SuspendTime);

			if (g_cmd_args->bEnableIva)
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &g_mpi_ctx->iva,
				                                RK_FALSE);
		} else {
			SAMPLE_COMM_RGN_DrawOsd(&ctx->rgn[1], "NORMAL",
			                        SAMPLE_COMM_ISP_GetFrameRate(g_cmd_args->u32CamId));
			if (g_cmd_args->bEnableIva)
				SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rgn[0], &g_mpi_ctx->iva,
				                                RK_TRUE);
		}
	}
	if (wakeup_current_mode == SINGLE_FRAME_MODE) {
		enter_multi_frame_mode();
		wakeup_current_mode = MULTI_FRAME_MODE;
	}
	bindAllDevices();
	capture_frames_in_normal_mode();
	program_normal_exit(__func__, __LINE__);
	RK_LOGE("vi_iva_thread exit !!!");
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

static RK_S32 isp_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
#ifdef AOV_FASTBOOT_ENABLE
	RK_S32 rk_cam_fps = SAMPLE_COMM_ExtractValueFromCmdline("rk_cam_fps");
	if (rk_cam_fps != -1)
		pArgs->u32Fps = rk_cam_fps;
#endif
	if (pArgs->u32Fps == 0)
		pArgs->u32Fps = 15;
	s32Ret = SAMPLE_COMM_ISP_Init(pArgs->u32CamId, RK_AIQ_WORKING_MODE_NORMAL,
	                              pArgs->bEnableRdbk, pArgs->pIqFileDir);
	if (s32Ret != RK_SUCCESS) {
		printf("#ISP cam %d init failed!\n", pArgs->u32CamId);
		return s32Ret;
	}
	s32Ret = SAMPLE_COMM_ISP_Run(pArgs->u32CamId);
	if (s32Ret != RK_SUCCESS) {
		printf("#ISP cam %d run failed!\n", pArgs->u32CamId);
		return s32Ret;
	}
#ifndef AOV_FASTBOOT_ENABLE
	if (pArgs->s32MirrorFlip != -1) {
		s32Ret = SAMPLE_COMM_ISP_SetMirrorFlip(pArgs->u32CamId, pArgs->s32MirrorFlip);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d set mirrorFlip failed!\n", pArgs->u32CamId);
			return s32Ret;
		}
	}

	s32Ret = SAMPLE_COMM_ISP_SetFrameRate(pArgs->u32CamId, pArgs->u32Fps);
	if (s32Ret != RK_SUCCESS) {
		printf("#ISP cam %d set fps failed!\n", pArgs->u32CamId);
		return s32Ret;
	}
#endif
	if (pArgs->bEnableSmartIr) {
		s32Ret = SAMPLE_COMM_SmartIr_Start(0);
		if (s32Ret != RK_SUCCESS) {
			printf("#ISP cam %d set fps failed!\n", pArgs->u32CamId);
			return s32Ret;
		}
	}
	if (g_cmd_args->u32MaxExpTime)
		SAMPLE_COMM_ISP_SetMaxExpTime(g_cmd_args->u32CamId, g_cmd_args->u32MaxExpTime);
	return s32Ret;
}

static RK_S32 isp_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	if (pArgs->bEnableSmartIr)
		SAMPLE_COMM_SmartIr_Stop();
	SAMPLE_COMM_ISP_Stop(pArgs->u32CamId);
	return s32Ret;
}

static RK_S32 vi_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	int ret = RK_SUCCESS;
	RK_U32 vi_dev_id = pArgs->u32CamId;
	VI_DEV_ATTR_S stDevAttr;
	VI_DEV_BIND_PIPE_S stBindPipe;
	VI_CHN_ATTR_S vi_chn_attr;
	VI_PARAM_MOD_S vi_mod_param;
	memset(&stDevAttr, 0, sizeof(stDevAttr));
	memset(&stBindPipe, 0, sizeof(stBindPipe));
	memset(&vi_chn_attr, 0, sizeof(vi_chn_attr));
	memset(&vi_mod_param, 0, sizeof(vi_mod_param));
	TRACE_BEGIN();
	// 0. get dev config status
	ret = RK_MPI_VI_GetDevAttr(vi_dev_id, &stDevAttr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		// 0-1.config dev
#if defined(RV1106B)
		if (pArgs->bEnableRdbk)
			stDevAttr.u32BufCount = 1;
#endif
		ret = RK_MPI_VI_SetDevAttr(vi_dev_id, &stDevAttr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetDevAttr %x\n", ret);
			return ret;
		}
	} else {
		RK_LOGE("RK_MPI_VI_SetDevAttr already\n");
	}
	// 1.get dev enable status
	ret = RK_MPI_VI_GetDevIsEnable(vi_dev_id);
	if (ret != RK_SUCCESS) {
		// 1-2.enable dev
		ret = RK_MPI_VI_EnableDev(vi_dev_id);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_EnableDev %x\n", ret);
			return -1;
		}
		// 1-3.bind dev/pipe
		stBindPipe.u32Num = vi_dev_id;
		stBindPipe.PipeId[0] = vi_dev_id;
		ret = RK_MPI_VI_SetDevBindPipe(vi_dev_id, &stBindPipe);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetDevBindPipe %x\n", ret);
			return -1;
		}
	} else {
		RK_LOGE("RK_MPI_VI_EnableDev already\n");
	}

#if defined(RV1106B)
	if (pArgs->bEnableRdbk) {
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_OFFLINE;
		ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", ret);
			return ret;
		}
	}
#endif

	vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32Width;
	vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32Height;
	vi_chn_attr.stSize.u32Width = pArgs->u32Width;
	vi_chn_attr.stSize.u32Height = pArgs->u32Height;
	vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
	vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
	vi_chn_attr.u32Depth = pArgs->bEnableLowPowerMode ? 2 : 0;
	ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_MAIN_CHANNEL, &vi_chn_attr);
	if (ret) {
		RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
		return ret;
	}
	if (pArgs->bEnableWrap) {
		VI_CHN_BUF_WRAP_S stViWrap;
		memset(&stViWrap, 0, sizeof(VI_CHN_BUF_WRAP_S));
		stViWrap.bEnable = RK_TRUE;
		stViWrap.u32BufLine = pArgs->u32Height / pArgs->u32WrapLine;
		stViWrap.u32WrapBufferSize = stViWrap.u32BufLine * pArgs->u32Width * 3 / 2;
		ret = RK_MPI_VI_SetChnWrapBufAttr(vi_dev_id, VI_MAIN_CHANNEL, &stViWrap);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnWrapBufAttr failure:%#X\n", ret);
			return ret;
		}
	}
	ret = RK_MPI_VI_EnableChn(vi_dev_id, VI_MAIN_CHANNEL);
	if (ret) {
		RK_LOGE("RK_MPI_VI_EnableChn failed %#X\n", ret);
		return ret;
	}
	vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32IvaWidth;
	vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32IvaHeight;
	vi_chn_attr.stSize.u32Width = pArgs->u32IvaWidth;
	vi_chn_attr.stSize.u32Height = pArgs->u32IvaHeight;
	vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
	vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
	vi_chn_attr.u32Depth = pArgs->bEnableLowPowerMode ? 2 : 1;
	ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_IVA_CHANNEL, &vi_chn_attr);
	if (ret) {
		RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
		return ret;
	}

	ret = RK_MPI_VI_EnableChn(vi_dev_id, VI_IVA_CHANNEL);
	if (ret) {
		RK_LOGE("RK_MPI_VI_EnableChn failed %#X\n", ret);
		return ret;
	}
	if (pArgs->bEnableBypassStream) {
		vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
		vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
		vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32BypassWidth;
		vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32BypassHeight;
		vi_chn_attr.stSize.u32Width = pArgs->u32BypassWidth;
		vi_chn_attr.stSize.u32Height = pArgs->u32BypassHeight;
		vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
		vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
		vi_chn_attr.u32Depth = 0;
		ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_BYPASS_CHANNEL, &vi_chn_attr);
		if (ret) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
			return ret;
		}
		ret = RK_MPI_VI_EnableChn(vi_dev_id, VI_BYPASS_CHANNEL);
		if (ret) {
			RK_LOGE("RK_MPI_VI_EnableChn failed %#X\n", ret);
			return ret;
		}
	}
	TRACE_END();
	return ret;
}

static RK_S32 vi_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	RK_U32 vi_dev_id = pArgs->u32CamId;
	TRACE_BEGIN();
	RK_MPI_VI_DisableChn(vi_dev_id, VI_MAIN_CHANNEL);
	RK_MPI_VI_DisableChn(vi_dev_id, VI_IVA_CHANNEL);
	if (pArgs->bEnableBypassStream)
		RK_MPI_VI_DisableChn(vi_dev_id, VI_BYPASS_CHANNEL);
	RK_MPI_VI_DisableDev(vi_dev_id);
	TRACE_END();
	return s32Ret;
}

static RK_S32 venc_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (pArgs->u32Gop == 0)
		pArgs->u32Gop = pArgs->u32Fps * 2;
	// Init VENC[0]
	ctx->venc[0].s32ChnId = VENC_MAIN_CHANNEL;
	ctx->venc[0].u32Width = pArgs->u32Width;
	ctx->venc[0].u32Height = pArgs->u32Height;
	ctx->venc[0].u32BuffSize = pArgs->u32Width * pArgs->u32Height / 3;
	ctx->venc[0].u32Fps = pArgs->u32Fps;
	ctx->venc[0].u32Gop = pArgs->u32Gop;
	ctx->venc[0].u32BitRate = pArgs->u32BitRate;
	ctx->venc[0].enCodecType = pArgs->enCodecType;
	ctx->venc[0].enRcMode = pArgs->enRcMode;
	ctx->venc[0].getStreamCbFunc = venc_get_stream;
#if defined(RV1106) || defined(RV1106B)
	ctx->venc[0].enable_buf_share = 1;
#endif
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	ctx->venc[0].stChnAttr.stVencAttr.u32Profile = 100;
	ctx->venc[0].stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	if (pArgs->bEnableWrap) {
		ctx->venc[0].bWrapIfEnable = RK_TRUE;
		ctx->venc[0].u32BufferLine = ctx->venc[0].u32Height / pArgs->u32WrapLine;
	}
	s32Ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[0]);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("create venc 0 failed");
		return s32Ret;
	}
	if (pArgs->bEnableBypassStream) {
		ctx->venc[1].s32ChnId = VENC_BYPASS_CHANNEL;
		ctx->venc[1].u32Width = pArgs->u32BypassWidth;
		ctx->venc[1].u32Height = pArgs->u32BypassHeight;
		ctx->venc[1].u32BuffSize = pArgs->u32BypassWidth * pArgs->u32BypassHeight / 3;
		ctx->venc[1].u32Fps = pArgs->u32Fps;
		ctx->venc[1].u32Gop = pArgs->u32Gop;
		ctx->venc[1].u32BitRate = pArgs->u32BitRate;
		ctx->venc[1].enCodecType = pArgs->enCodecType;
		ctx->venc[1].enRcMode = pArgs->enRcMode;
		ctx->venc[1].getStreamCbFunc = venc_get_bypass_stream;
		ctx->venc[1].enable_buf_share = 1;
		// H264  66：Baseline  77：Main Profile 100：High Profile
		// H265  0：Main Profile  1：Main 10 Profile
		// MJPEG 0：Baseline
		ctx->venc[1].stChnAttr.stVencAttr.u32Profile = 100;
		ctx->venc[1].stChnAttr.stGopAttr.enGopMode =
		    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
		s32Ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[1]);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("create venc 1 failed");
			return s32Ret;
		}
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 venc_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[0]);
	if (pArgs->bEnableBypassStream)
		SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[1]);
	TRACE_END();
	return s32Ret;
}

static RK_S32 ivs_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIvs) {
		TRACE_END();
		return s32Ret;
	}
	if (pArgs->u32Gop == 0)
		pArgs->u32Gop = pArgs->u32Fps * 2;
	ctx->ivs.s32ChnId = 0;
	ctx->ivs.stIvsAttr.enMode = IVS_MODE_MD_OD;
	ctx->ivs.stIvsAttr.u32PicWidth = pArgs->u32IvaWidth;
	ctx->ivs.stIvsAttr.u32PicHeight = pArgs->u32IvaHeight;
	ctx->ivs.stIvsAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->ivs.stIvsAttr.s32Gop = pArgs->u32Gop;
	ctx->ivs.stIvsAttr.bSmearEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.bWeightpEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.bMDEnable = RK_TRUE;
	ctx->ivs.stIvsAttr.s32MDInterval = 1;
	ctx->ivs.stIvsAttr.bMDNightMode = RK_TRUE;
	ctx->ivs.stIvsAttr.u32MDSensibility = 3;
	ctx->ivs.stIvsAttr.bODEnable = RK_FALSE;
	ctx->ivs.stIvsAttr.s32ODInterval = 1;
	ctx->ivs.stIvsAttr.s32ODPercent = 7;
	s32Ret = SAMPLE_COMM_IVS_Create(&ctx->ivs);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVS_Create failure:%X", s32Ret);
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 ivs_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIvs) {
		TRACE_END();
		return s32Ret;
	}
	s32Ret = RK_MPI_IVS_DestroyChn(ctx->ivs.s32ChnId);
	TRACE_END();
	return s32Ret;
}

static RK_S32 iva_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIva) {
		TRACE_END();
		return s32Ret;
	}
	/* Init iva */
	ctx->iva.pModelDataPath = pArgs->pIvaModelPath;
	ctx->iva.u32ImageHeight = pArgs->u32IvaHeight;
	ctx->iva.u32ImageWidth = pArgs->u32IvaWidth;
	ctx->iva.u32DetectStartX = 0;
	ctx->iva.u32DetectStartY = 0;
	ctx->iva.u32DetectWidth = pArgs->u32IvaWidth;
	ctx->iva.u32DetectHight = pArgs->u32IvaHeight;
	ctx->iva.eImageTransform = ROCKIVA_IMAGE_TRANSFORM_NONE;
	ctx->iva.eImageFormat = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
#if defined(RV1126)
	ctx->iva.eModeType = ROCKIVA_DET_MODEL_CLS7;
#else
	ctx->iva.eModeType = ROCKIVA_DET_MODEL_PFP;
#endif
	ctx->iva.u32IvaDetectFrameRate = pArgs->u32IvaDetectFrameRate;
	ctx->iva.detectResultCallback = rkIvaEvent_callback;
	ctx->iva.releaseCallback = rkIvaFrame_releaseCallBack;
	ctx->iva.eIvaMode = ROCKIVA_MODE_DETECT;
	s32Ret = SAMPLE_COMM_IVA_Create(&ctx->iva);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVA_Create failure:%#X", s32Ret);
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 iva_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIva) {
		TRACE_END();
		return s32Ret;
	}
	s32Ret = SAMPLE_COMM_IVA_Destroy(&ctx->iva);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_IVA_Destroy failure:%#X", s32Ret);
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 rgn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	// Init RGN[0]
	ctx->rgn[0].rgnHandle = 1;
	ctx->rgn[0].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rgn[0].bDrawBmpManual = RK_TRUE;
	ctx->rgn[0].stMppChn.enModId = RK_ID_VENC;
	ctx->rgn[0].stMppChn.s32ChnId = RGN_CHANNEL;
	ctx->rgn[0].stMppChn.s32DevId = 0;
	ctx->rgn[0].stRegion.s32X = 0;                     // must be 16 aligned
	ctx->rgn[0].stRegion.s32Y = 0;                     // must be 16 aligned
	ctx->rgn[0].stRegion.u32Width = pArgs->u32Width;   // must be 16 aligned
	ctx->rgn[0].stRegion.u32Height = pArgs->u32Height; // must be 16 aligned
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
	ctx->rgn[0].stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	ctx->rgn[0].stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	s32Ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[0]);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_RGN_CreateChn failed");
		return s32Ret;
	}
	// Init RGN[1]
	ctx->rgn[1].rgnHandle = 2;
	ctx->rgn[1].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rgn[1].bDrawBmpManual = RK_TRUE;
	ctx->rgn[1].stMppChn.enModId = RK_ID_VENC;
	ctx->rgn[1].stMppChn.s32ChnId = RGN_CHANNEL;
	ctx->rgn[1].stMppChn.s32DevId = 0;
	ctx->rgn[1].stRegion.s32X = 0;       // must be 16 aligned
	ctx->rgn[1].stRegion.s32Y = 0;       // must be 16 aligned
	ctx->rgn[1].stRegion.u32Width = 576; // must be 16 aligned
	ctx->rgn[1].stRegion.u32Height = 32; // must be 16 aligned
	ctx->rgn[1].u32BmpFormat = RK_FMT_ARGB8888;
	ctx->rgn[1].u32BgAlpha = 64;
	ctx->rgn[1].u32FgAlpha = 64;
	ctx->rgn[1].u32Layer = 2;
	ctx->rgn[1].st_osd_data.enable = 1; // enable time osd
	s32Ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[1]);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_RGN_CreateChn failed");
		return s32Ret;
	}

	if (g_cmd_args->bEnableDraw2AInfo) {
		ctx->rgn[2].rgnHandle = 3;
		ctx->rgn[2].stRgnAttr.enType = OVERLAY_RGN;
		ctx->rgn[2].bDrawBmpManual = RK_TRUE;
		ctx->rgn[2].stMppChn.enModId = RK_ID_VENC;
		ctx->rgn[2].stMppChn.s32ChnId = RGN_CHANNEL;
		ctx->rgn[2].stMppChn.s32DevId = 0;
		ctx->rgn[2].stRegion.s32X = 0;                   // must be 16 aligned
		ctx->rgn[2].stRegion.s32Y = 32;                  // must be 16 aligned
		ctx->rgn[2].stRegion.u32Width = pArgs->u32Width; // must be 16 aligned
		ctx->rgn[2].stRegion.u32Height = 32;             // must be 16 aligned
		ctx->rgn[2].u32BmpFormat = RK_FMT_ARGB8888;
		ctx->rgn[2].u32BgAlpha = 64;
		ctx->rgn[2].u32FgAlpha = 64;
		ctx->rgn[2].u32Layer = 3;
		ctx->rgn[2].st_osd_data.enable = 1; // enable time osd
		s32Ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rgn[2]);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("SAMPLE_COMM_RGN_CreateChn failed");
			return s32Ret;
		}
	}
	TRACE_END();
	return s32Ret;
}

static RK_S32 rgn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[0]);
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[1]);
	if (g_cmd_args->bEnableDraw2AInfo)
		SAMPLE_COMM_RGN_DestroyChn(&ctx->rgn[2]);
	TRACE_END();
	return s32Ret;
}

static RK_S32 start_pipe(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	MPP_CHN_S stSrcChn, stDestChn;
	TRACE_BEGIN();
	if (!pArgs->bEnableLowPowerMode) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = pArgs->u32CamId;
		stSrcChn.s32ChnId = VI_MAIN_CHANNEL;
		stDestChn.enModId = RK_ID_VENC;
		stDestChn.s32DevId = 0;
		stDestChn.s32ChnId = VENC_MAIN_CHANNEL;
		s32Ret = SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("bind vi to venc failed %#X", s32Ret);
			return s32Ret;
		}
	}
	if (pArgs->bEnableBypassStream) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = pArgs->u32CamId;
		stSrcChn.s32ChnId = VI_BYPASS_CHANNEL;
		stDestChn.enModId = RK_ID_VENC;
		stDestChn.s32DevId = 0;
		stDestChn.s32ChnId = VENC_BYPASS_CHANNEL;
		s32Ret = SAMPLE_COMM_Bind(&stSrcChn, &stDestChn);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("bind vi to venc failed %#X", s32Ret);
			return s32Ret;
		}
	}
	g_thread_status->bIfMainThreadQuit = RK_FALSE;
	if (pArgs->bEnableLowPowerMode)
		pthread_create(&g_thread_status->s32ViIvaThreadId, 0, vi_iva_low_power_thread,
		               NULL);
	else
		pthread_create(&g_thread_status->s32ViIvaThreadId, 0, vi_iva_thread, NULL);
	TRACE_END();
	return s32Ret;
}

static RK_S32 stop_pipe(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	MPP_CHN_S stSrcChn, stDestChn;
	TRACE_BEGIN();
	if (!pArgs->bEnableLowPowerMode) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = pArgs->u32CamId;
		stSrcChn.s32ChnId = VI_MAIN_CHANNEL;
		stDestChn.enModId = RK_ID_VENC;
		stDestChn.s32DevId = 0;
		stDestChn.s32ChnId = VENC_MAIN_CHANNEL;
		SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);
	}
	if (pArgs->bEnableBypassStream) {
		stSrcChn.enModId = RK_ID_VI;
		stSrcChn.s32DevId = pArgs->u32CamId;
		stSrcChn.s32ChnId = VI_BYPASS_CHANNEL;
		stDestChn.enModId = RK_ID_VENC;
		stDestChn.s32DevId = 0;
		stDestChn.s32ChnId = VENC_BYPASS_CHANNEL;
		SAMPLE_COMM_UnBind(&stSrcChn, &stDestChn);
	}
	g_thread_status->bIfMainThreadQuit = RK_TRUE;
	pthread_join(g_thread_status->s32ViIvaThreadId, 0);
	pthread_join(ctx->venc[0].getStreamThread, 0);
	if (pArgs->bEnableBypassStream)
		pthread_join(ctx->venc[1].getStreamThread, 0);
	TRACE_END();
	return s32Ret;
}

static RK_S32 aov_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	SAMPLE_COMM_AOV_Init();
	SAMPLE_COMM_AOV_SetPeriodTime(pArgs->u32SuspendTime);
	return s32Ret;
}

static RK_S32 aov_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	SAMPLE_COMM_AOV_Deinit();
	return s32Ret;
}

static RK_S32 global_param_init(void) {
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
	return RK_FAILURE;
}

static RK_S32 global_param_deinit(void) {
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
	return RK_SUCCESS;
}

/******************************************************************************
 * function    : parse_cmd_args()
 * Description : Parse command line arguments.
 ******************************************************************************/
static RK_S32 parse_cmd_args(int argc, char **argv, RkCmdArgs *pArgs) {
	pArgs->u32Width = 1920;
	pArgs->u32Height = 1080;
	pArgs->u32BypassWidth = 320;
	pArgs->u32BypassHeight = 240;
	pArgs->u32CamId = 0;
	pArgs->pIqFileDir = "/etc/iqfiles";
	pArgs->u32ViBuffCnt = 2;
	pArgs->u32Fps = 0;
	pArgs->enCodecType = RK_CODEC_TYPE_H265;
	pArgs->enRcMode = VENC_RC_MODE_H265VBR;
	pArgs->pCodecName = "H264";
	pArgs->u32BitRate = 4 * 1024;
	pArgs->u32Gop = 0;
	pArgs->u32IvaWidth = 640;
	pArgs->u32IvaHeight = 360;
	pArgs->u32IvaDetectFrameRate = 10;
	pArgs->pIvaModelPath = "/oem/usr/lib/";
	pArgs->bEnableWrap = RK_FALSE;
	pArgs->u32WrapLine = 4;
	pArgs->s32MirrorFlip = -1;
	pArgs->bEnableBypassStream = RK_TRUE;
	pArgs->bEnableRdbk = RK_FALSE;
	pArgs->u32SuspendTime = 1000;
	pArgs->s32AovLoopCount = -1;
	pArgs->u32MaxWakeupFrameCnt = 3000;
	pArgs->u32BootFrame = 60;
	pArgs->bEnableSaveRawStream = RK_FALSE;
	pArgs->bEnableSaveMp4 = RK_FALSE;
	pArgs->bEnableMultiCore = RK_FALSE;
	pArgs->bEnableFastAe = RK_FALSE;
	pArgs->bEnableChangeResolution = RK_FALSE;
	pArgs->bEnableScale = RK_FALSE;
	pArgs->u32BinWidth = 960;
	pArgs->u32BinHeight = 540;
	pArgs->u32BinFps = 120;
	pArgs->bEnableIva = RK_TRUE;
	pArgs->bEnableIvs = RK_TRUE;
	pArgs->bEnableSmartIr = RK_TRUE;
	pArgs->u32MaxExpTime = 0;
	pArgs->bEnableRtsp = RK_FALSE;
	int c;
	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'a':
			if (!optarg && NULL != argv[optind] && '-' != argv[optind][0]) {
				tmp_optarg = argv[optind++];
			}
			if (tmp_optarg) {
				pArgs->pIqFileDir = (char *)tmp_optarg;
			} else {
				pArgs->pIqFileDir = NULL;
			}
			break;
		case 'b':
			pArgs->u32BitRate = atoi(optarg);
			break;
		case 'e':
			if (!strcmp(optarg, "h264cbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264CBR;
				pArgs->pCodecName = "H264";
			} else if (!strcmp(optarg, "h264vbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264VBR;
				pArgs->pCodecName = "H264";
			} else if (!strcmp(optarg, "h264avbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H264;
				pArgs->enRcMode = VENC_RC_MODE_H264AVBR;
				pArgs->pCodecName = "H264";
			} else if (!strcmp(optarg, "h265cbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265CBR;
				pArgs->pCodecName = "H265";
			} else if (!strcmp(optarg, "h265vbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265VBR;
				pArgs->pCodecName = "H265";
			} else if (!strcmp(optarg, "h265avbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_H265;
				pArgs->enRcMode = VENC_RC_MODE_H265AVBR;
				pArgs->pCodecName = "H265";
			} else if (!strcmp(optarg, "mjpegcbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_MJPEG;
				pArgs->enRcMode = VENC_RC_MODE_MJPEGCBR;
				pArgs->pCodecName = "MJPEG";
			} else if (!strcmp(optarg, "mjpegvbr")) {
				pArgs->enCodecType = RK_CODEC_TYPE_MJPEG;
				pArgs->enRcMode = VENC_RC_MODE_MJPEGVBR;
				pArgs->pCodecName = "MJPEG";
			} else {
				printf("ERROR: Invalid encoder type.\n");
				return 0;
			}
			break;
		case 'w':
			pArgs->u32Width = atoi(optarg);
			break;
		case 'h':
			pArgs->u32Height = atoi(optarg);
			break;
		case 'I':
			pArgs->u32CamId = atoi(optarg);
			break;
		case 'r':
			pArgs->bEnableWrap = atoi(optarg);
			break;
		case 'f':
			pArgs->u32Fps = atoi(optarg);
			break;
		case 'g':
			pArgs->u32Gop = atoi(optarg);
			break;
		case 'v':
			pArgs->u32ViBuffCnt = atoi(optarg);
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
		case 'a' + 'm' + 'c':
			pArgs->s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			pArgs->u32SuspendTime = atoi(optarg);
			break;
		case 'i' + 'd' + 's':
			pArgs->u32IvaDetectFrameRate = atoi(optarg);
			break;
		case 'b' + 'f':
			pArgs->u32BootFrame = atoi(optarg);
			break;
		case 'e' + 's':
			pArgs->bEnableSaveRawStream = atoi(optarg);
			break;
		case 'e' + 'm':
			pArgs->bEnableSaveMp4 = atoi(optarg);
			break;
		case 'm' + 'w':
			pArgs->u32MaxWakeupFrameCnt = atoi(optarg);
			break;
		case 'l' + 'w' + 'p':
			pArgs->bEnableLowPowerMode = atoi(optarg);
			break;
		case 'm' + 'p':
			pArgs->s32MirrorFlip = atoi(optarg);
			break;
		case 'e' + 'b' + 'p':
			pArgs->bEnableBypassStream = atoi(optarg);
			break;
		case 'e' + 's' + 'p':
			pArgs->bEnableMultiCore = atoi(optarg);
			break;
		case 'f' + 'a':
			pArgs->bEnableFastAe = atoi(optarg);
			break;
		case 'e' + 'c' + 'r':
			pArgs->bEnableChangeResolution = (atoi(optarg) != 0);
			break;
		case 'e' + 's' + 'l':
			pArgs->bEnableScale = (atoi(optarg) != 0);
			break;
		case 'e' + 'r':
			pArgs->bEnableRdbk = (atoi(optarg) != 0);
			break;
		case 'e' + 'i' + 's':
			pArgs->bEnableIvs = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'i' + 'a':
			pArgs->bEnableIva = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'b' + 'w':
			pArgs->u32BinWidth = atoi(optarg);
			break;
		case 'b' + 'h':
			pArgs->u32BinHeight = atoi(optarg);
			break;
		case 'b' + 'f' + 's':
			pArgs->u32BinFps = atoi(optarg);
			break;
		case 'm' + 'e' + 't':
			pArgs->u32MaxExpTime = atoi(optarg);
			break;
		case 'e' + 's' + 'r':
			pArgs->bEnableSmartIr = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'r' + 't' + 's':
			pArgs->bEnableRtsp = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'd' + '2' + 'a':
			pArgs->bEnableDraw2AInfo = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case '?':
		default:
			print_usage(argv[0]);
			return RK_FAILURE;
		}
	}
	// Force isp to run in offline mode when isp scale is configured
	if (pArgs->bEnableChangeResolution && pArgs->bEnableScale)
		pArgs->bEnableRdbk = RK_TRUE;
	return RK_SUCCESS;
}

/******************************************************************************
 * function    : main()
 * Description : main
 ******************************************************************************/
int main(int argc, char *argv[]) {
	SAMPLE_MPI_CTX_S *ctx;
	if (argc < 2) {
		print_usage(argv[0]);
		return 0;
	}
	signal(SIGINT, sigterm_handler);
	if (global_param_init() != RK_SUCCESS) {
		printf("global_param_init failure\n");
		return -1;
	}
	if (parse_cmd_args(argc, argv, g_cmd_args) != RK_SUCCESS) {
		printf("parse_cmd_args failure\n");
		return -1;
	}
	if (rtsp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("parse_cmd_args failure\n");
		return -1;
	}
	if (aov_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("aov init failed!");
		return -1;
	}
	if (isp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("isp init failed!");
		return -1;
	} else {
		printf("#CameraIdx: %d\n", g_cmd_args->u32CamId);
		printf("#CodecName:%s\n", g_cmd_args->pCodecName);
		printf("#AOV loop count: %d\n", g_cmd_args->s32AovLoopCount);
	}
	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		RK_LOGE("mpi init failed!");
		goto __mpi_init_failed;
	}
	if (vi_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("vi init failed!");
		goto __vi_init_failed;
	}
	if (venc_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("venc init failed!");
		goto __venc_init_failed;
	}
	if (ivs_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("ivs init failed!");
		goto __ivs_init_failed;
	}
	if (iva_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("iva init failed!");
		goto __iva_init_failed;
	}
	if (rgn_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("rgn init failed!");
		goto __rgn_init_failed;
	}
	if (start_pipe(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		RK_LOGE("start pipe failed!");
		goto __start_pipe_failed;
	}
	RK_LOGE("========================= initial finish ==================\n");
	while (!g_thread_status->bIfMainThreadQuit) {
		sleep(1);
	}
	RK_LOGE("========================= exit! ===========================\n");
	stop_pipe(g_mpi_ctx, g_cmd_args);
__start_pipe_failed:
	rgn_deinit(g_mpi_ctx, g_cmd_args);
__rgn_init_failed:
	iva_deinit(g_mpi_ctx, g_cmd_args);
__iva_init_failed:
	ivs_deinit(g_mpi_ctx, g_cmd_args);
__ivs_init_failed:
	venc_deinit(g_mpi_ctx, g_cmd_args);
__venc_init_failed:
	vi_deinit(g_mpi_ctx, g_cmd_args);
__vi_init_failed:
	RK_MPI_SYS_Exit();
__mpi_init_failed:
	isp_deinit(g_mpi_ctx, g_cmd_args);
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
