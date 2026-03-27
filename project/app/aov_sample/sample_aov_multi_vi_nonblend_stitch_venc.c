/*
 * Copyright 2023 Rockchip Electronics Co. LTD
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
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <time.h>
#include <unistd.h>

#include "sample_comm.h"
#include "sample_comm_aov.h"
#include "utils.h"
#include "rtsp_demo.h"

#define MAIN_CAM_INDEX 0
#define SUB_CAM_INDEX 1

#define VI_MAIN_CHANNEL 0
#define VI_SUB_CHANNEL 1
#define VI_IVA_CHANNEL 2
#define VENC_MAIN_CHANNEL 0
#define VENC_SUB_CHANNEL 1
#define VENC_CHN_MAX 2

#define RED_COLOR 0x0000FF
#define BLUE_COLOR 0xFF0000

#define TRACE_BEGIN() RK_LOGW("Enter\n")
#define TRACE_END() RK_LOGW("Exit\n")

typedef struct _rkCmdArgs {
	RK_U32 u32MainChnWidth;
	RK_U32 u32MainChnHeight;
	RK_U32 u32SubChnWidth;
	RK_U32 u32SubChnHeight;
	RK_U32 u32IvaChnWidth;
	RK_U32 u32IvaChnHeight;
	RK_U32 u32ViBuffCnt;
	RK_U32 u32CifBuffCnt;
	RK_U32 u32Fps;
	RK_U32 u32Gop;
	RK_U32 u32BitRate;
	RK_U32 u32MaxIrqWakeupCount;
	RK_U32 u32IvaDetectFrameRate;
	CODEC_TYPE_E enCodecType;
	VENC_RC_MODE_E enRcMode;
	RK_CHAR *pOutPath;
	RK_CHAR *pIqFileDir;
	RK_CHAR *pCodecName;
	RK_CHAR *pIvaModelPath;
	RK_BOOL bMultictx;
	RK_BOOL bEnableSaveRawStream;
	RK_BOOL bEnableSaveMp4;
	RK_BOOL bEnableWrap;
	RK_BOOL bEnableFastAe;
	RK_BOOL bEnableIvs;
	RK_BOOL bEnableIva;
	RK_BOOL bEnableDrawOsd;
	RK_BOOL bEnableGroup;
	RK_BOOL bEnableSubStream;
	RK_BOOL bEnableRtsp;
	RK_U32 u32IspMode;
	RK_U32 u32MaxExpTime;
	RK_U32 u32WrapLine;
	RK_S32 s32AovLoopCount;
	RK_U32 u32SuspendTime;
	RK_U32 u32BootFrame;
	RK_U32 u32CacheBuffSize;
} RkCmdArgs;

typedef struct _rkRtspCtx {
	pthread_mutex_t mutex;
	rtsp_demo_handle handle;
	rtsp_session_handle sessions[VENC_CHN_MAX];
} RTSP_CTX;

typedef struct _rkMpiCtx {
	SAMPLE_VENC_CTX_S venc[2];
	SAMPLE_IVS_CTX_S ivs[2];
	SAMPLE_IVA_CTX_S iva[2];
	SAMPLE_RGN_CTX_S rect_osd[4];
	SAMPLE_RGN_CTX_S time_osd[2];
	SAMPLE_MPI_MUXER_S *mpi_muxer[2];
	RTSP_CTX rtsp;
} SAMPLE_MPI_CTX_S;

typedef struct _rkThreadStatus {
	RK_BOOL bIfMainThreadQuit;
	RK_BOOL bForceFlushData;
	pthread_t s32MainThreadId;
	// Use for iva.
	pthread_mutex_t stWakeupMutex;
	pthread_cond_t stWakeupCond;
	RK_U32 u32RunningTaskCount;
	RK_U32 u32WakeupCount;
	// Cached frames.
	VIDEO_FRAME_INFO_S stMainChnFrame;
	VIDEO_FRAME_INFO_S stSubChnFrame;
	VIDEO_FRAME_INFO_S astIvaFrame[2];
} ThreadStatus;

typedef struct {
	VIDEO_FRAME_INFO_S stFrame;
	RK_S32 s32ChnId;
	RK_U32 s32DevId;
} IvaFrameInfo;

enum ISP_MODE {
	SINGLE_FRAME_MODE,
	MULTI_FRAME_MODE,
};

static RkCmdArgs *g_cmd_args = RK_NULL;
static SAMPLE_MPI_CTX_S *g_mpi_ctx = RK_NULL;
static RK_S32 g_exit_result = RK_FAILURE;
static ThreadStatus *g_thread_status = RK_NULL;

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

static void *venc_get_stream(void *pArgs) {
	SAMPLE_VENC_CTX_S *ctx = (SAMPLE_VENC_CTX_S *)(pArgs);
	RK_S32 ret = RK_FAILURE;
	char name[256] = {0};
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_S32 venc_data_size = 0;
	RK_S32 force_flush_to_storage = 0;
	uint64_t pre_pts = 0;
	char *venc_data = NULL;

	if (g_cmd_args->bEnableSaveMp4) {
		ret = SAMPLE_COMM_AOV_InitMp4(ctx, &g_mpi_ctx->mpi_muxer[ctx->s32ChnId]);
		if (ret != RK_SUCCESS) {
			RK_LOGI("SAMPLE_COMM_AOV_InitMp4 failed, use raw stream\n");
			g_cmd_args->bEnableSaveMp4 = RK_FALSE;
			g_cmd_args->bEnableSaveRawStream = RK_TRUE;
		} else {
			RK_LOGI("SAMPLE_COMM_AOV_InitMp4 failed, use raw stream\n");
			g_cmd_args->bEnableSaveRawStream = RK_FALSE;
		}
	}
	if (g_cmd_args->bEnableSaveRawStream) {
		venc_data = (char *)malloc(g_cmd_args->u32CacheBuffSize); // 10M form 200 frame
		venc_data_size = 0;
		RK_MPI_VENC_RequestIDR(ctx->s32ChnId, RK_FALSE);
	}
	while (!g_thread_status->bIfMainThreadQuit) {
		ret = SAMPLE_COMM_VENC_GetStream(ctx, &pData);
		if (ret == RK_SUCCESS) {

			SAMPLE_COMM_AOV_DumpPtsToTMP(ctx->stFrame.u32Seq,
			                             ctx->stFrame.pstPack->u64PTS,
			                             g_cmd_args->u32BootFrame);
			if (g_cmd_args->bEnableSaveMp4) {
				SAMPLE_COMM_AOV_CopyMp4StreamToSdcard(g_mpi_ctx->mpi_muxer[ctx->s32ChnId],
				                                      &ctx->stFrame, pData,
				                                      g_thread_status->bForceFlushData);
				g_thread_status->bForceFlushData = false;
			} else if (g_cmd_args->bEnableSaveRawStream) {
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

			RK_LOGE("chn:%d, loopCount:%d, len:%u, pts:%llu, pts count:%llu, seq:%u",
			        ctx->s32ChnId, loopCount, ctx->stFrame.pstPack->u32Len,
			        ctx->stFrame.pstPack->u64PTS,
			        (ctx->stFrame.pstPack->u64PTS - pre_pts) / 1000, ctx->stFrame.u32Seq);
			pre_pts = ctx->stFrame.pstPack->u64PTS;

			SAMPLE_COMM_VENC_ReleaseStream(ctx);

			loopCount++;
		}
	}

	if (g_cmd_args->bEnableSaveMp4) {
		SAMPLE_COMM_AOV_DeinitMp4(g_mpi_ctx->mpi_muxer[ctx->s32ChnId]);
	} else if (g_cmd_args->bEnableSaveRawStream) {
		if (venc_data_size > 0)
			SAMPLE_COMM_AOV_CopyRawStreamToSdcard(ctx->s32ChnId, venc_data,
			                                      venc_data_size, NULL, 0);
		venc_data_size = 0;
		free(venc_data);
	}

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
		if (g_thread_status->u32WakeupCount > 0)
			--g_thread_status->u32WakeupCount;
	} else {
		if (g_cmd_args->bEnableDrawOsd) {
			SAMPLE_COMM_IVA_Push_Result((SAMPLE_IVA_CTX_S *)userData, result);
			if (g_cmd_args->bEnableSubStream)
				SAMPLE_COMM_IVA_Push_Result((SAMPLE_IVA_CTX_S *)userData, result);
		}
		g_thread_status->u32WakeupCount = g_cmd_args->u32Fps * 5;
	}
	RK_LOGI("RKIVA: objNum is %d, wakeup count = %d\n", result->objNum,
	        g_thread_status->u32WakeupCount);
}

static void iva_frame_release_callback(const RockIvaReleaseFrames *releaseFrames,
                                       void *userdata) {
	/* when iva handle out of the video frame，this func will be called*/
	RK_S32 ret = RK_SUCCESS;
	IvaFrameInfo *iva_frame_info;
	// TRACE_BEGIN();
	for (RK_S32 i = 0; i < releaseFrames->count; i++) {
		if (!releaseFrames->frames[i].extData) {
			RK_LOGE("---------error release frame is null");
			continue;
		}
		iva_frame_info = (IvaFrameInfo *)releaseFrames->frames[i].extData;
		ret = RK_MPI_VI_ReleaseChnFrame(
		    iva_frame_info->s32DevId, iva_frame_info->s32ChnId, &iva_frame_info->stFrame);
		if (ret != RK_SUCCESS)
			RK_LOGE("RK_MPI_VI_ReleaseChnFrame failure:%#X", ret);
		else
			RK_LOGD("IVA release vi frame from dev %d chn %d, seq %u, pts %llu",
			        iva_frame_info->s32DevId, iva_frame_info->s32ChnId,
			        iva_frame_info->stFrame.stVFrame.u32TimeRef,
			        iva_frame_info->stFrame.stVFrame.u64PTS);
		free(releaseFrames->frames[i].extData);
	}
	pthread_mutex_lock(&g_thread_status->stWakeupMutex);
	if (g_thread_status->u32RunningTaskCount > 0)
		--g_thread_status->u32RunningTaskCount;
	pthread_cond_signal(&g_thread_status->stWakeupCond);
	pthread_mutex_unlock(&g_thread_status->stWakeupMutex);
	// TRACE_END();
}

static void draw_osd(enum ISP_MODE isp_mode, bool md) {
	if (!g_cmd_args->bEnableDrawOsd)
		return;
	if (isp_mode == MULTI_FRAME_MODE) {
		SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->time_osd[0], "NORMAL",
		                        SAMPLE_COMM_ISP_GetFrameRate(MAIN_CAM_INDEX));
		if (g_cmd_args->bEnableSubStream)
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->time_osd[1], "NORMAL",
			                        SAMPLE_COMM_ISP_GetFrameRate(SUB_CAM_INDEX));
	} else {
		SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->time_osd[0], md ? "AOV_M" : "AOV_I",
		                        1000 / g_cmd_args->u32SuspendTime);
		if (g_cmd_args->bEnableSubStream)
			SAMPLE_COMM_RGN_DrawOsd(&g_mpi_ctx->time_osd[1], md ? "AOV_M" : "AOV_I",
			                        1000 / g_cmd_args->u32SuspendTime);
	}
	if (!g_cmd_args->bEnableIva)
		return;
	// main camera
	SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rect_osd[0], &g_mpi_ctx->iva[0], RK_TRUE);
	SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rect_osd[1], &g_mpi_ctx->iva[1], RK_TRUE);
	// sub camera
	if (g_cmd_args->bEnableSubStream) {
		SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rect_osd[2], &g_mpi_ctx->iva[0],
		                                RK_TRUE);
		SAMPLE_COMM_RGN_DrawRectFromIVA(&g_mpi_ctx->rect_osd[3], &g_mpi_ctx->iva[1],
		                                RK_TRUE);
	}
}

static void get_and_cached_vi_frames(void) {
	RK_S32 vi_dev_id = 0;
	RK_S32 vi_chn_id = 0;
	RK_S32 ret;
	VIDEO_FRAME_INFO_S tmp_frame;
	// get frame from vi[0,2] vi[1,2]
	// can't get frame from vi[1,0] vi[1,1]
	vi_dev_id = MAIN_CAM_INDEX;
	vi_chn_id = VI_IVA_CHANNEL;
	do {
		ret = RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 1000);
		if (ret != RK_SUCCESS) {
			RK_LOGE("dev %d chn %d RK_MPI_VI_GetChnFrame failed %#X", vi_dev_id,
			        vi_chn_id, ret);
		} else {
			RK_LOGV("dev %d chn %d get frame w:%d h:%d seq:%d pts:%llu", vi_dev_id,
			        vi_chn_id, tmp_frame.stVFrame.u32Width, tmp_frame.stVFrame.u32Height,
			        tmp_frame.stVFrame.u32TimeRef, tmp_frame.stVFrame.u64PTS);
			memcpy(&g_thread_status->astIvaFrame[0], &tmp_frame, sizeof(tmp_frame));
		}
	} while (ret != RK_SUCCESS);
	vi_dev_id = SUB_CAM_INDEX;
	vi_chn_id = VI_IVA_CHANNEL;
	do {
		ret = RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 1000);
		if (ret != RK_SUCCESS) {
			RK_LOGE("dev %d chn %d RK_MPI_VI_GetChnFrame failed %#X", vi_dev_id,
			        vi_chn_id, ret);
		} else {
			RK_LOGV("dev %d chn %d get frame w:%d h:%d seq:%d pts:%llu", vi_dev_id,
			        vi_chn_id, tmp_frame.stVFrame.u32Width, tmp_frame.stVFrame.u32Height,
			        tmp_frame.stVFrame.u32TimeRef, tmp_frame.stVFrame.u64PTS);
			memcpy(&g_thread_status->astIvaFrame[1], &tmp_frame, sizeof(tmp_frame));
		}
	} while (ret != RK_SUCCESS);
}

static RK_BOOL send_cached_frames_to_iva(RK_U32 loop_count, enum ISP_MODE mode) {
	IvaFrameInfo *iva_frame_info = NULL;
	RK_S32 ret = RK_SUCCESS;
	RK_S32 fd = -1;
	RK_BOOL md = RK_FALSE;
	RockIvaImage iva_image;
	VIDEO_FRAME_INFO_S *main_cam_frame = &g_thread_status->astIvaFrame[0];
	VIDEO_FRAME_INFO_S *sub_cam_frame = &g_thread_status->astIvaFrame[1];
	struct timespec start_time, end_time;
	RK_U64 used_time = 0;

	if (g_cmd_args->bEnableIvs && mode == SINGLE_FRAME_MODE) {
		clock_gettime(CLOCK_MONOTONIC, &start_time);
		md = SAMPLE_COMM_IVS_bMove(&g_mpi_ctx->ivs[0], main_cam_frame) ||
		     SAMPLE_COMM_IVS_bMove(&g_mpi_ctx->ivs[1], sub_cam_frame);
		clock_gettime(CLOCK_MONOTONIC, &end_time);
		used_time = end_time.tv_sec * 1000000LL + end_time.tv_nsec / 1000LL -
		            (start_time.tv_sec * 1000000LL + start_time.tv_nsec / 1000LL);
		RK_LOGD("ivs cost time %llu ms", used_time / 1000);
		if (!md) {
			RK_MPI_VI_ReleaseChnFrame(MAIN_CAM_INDEX, VI_IVA_CHANNEL, main_cam_frame);
			RK_MPI_VI_ReleaseChnFrame(SUB_CAM_INDEX, VI_IVA_CHANNEL, sub_cam_frame);
			return md;
		}
	}
	if (!g_cmd_args->bEnableIva) {
		RK_MPI_VI_ReleaseChnFrame(MAIN_CAM_INDEX, VI_IVA_CHANNEL, main_cam_frame);
		RK_MPI_VI_ReleaseChnFrame(SUB_CAM_INDEX, VI_IVA_CHANNEL, sub_cam_frame);
		return md;
	}

	clock_gettime(CLOCK_MONOTONIC, &start_time);
	// Set asynchronous run task count.
	g_thread_status->u32RunningTaskCount = 2;

	// send main cam frame to iva.
	iva_frame_info = (IvaFrameInfo *)malloc(sizeof(IvaFrameInfo));
	if (iva_frame_info == NULL) {
		RK_LOGE("malloc failed");
		program_handle_error(__func__, __LINE__);
		return md;
	}
	memcpy(&iva_frame_info->stFrame, main_cam_frame, sizeof(VIDEO_FRAME_INFO_S));
	iva_frame_info->s32ChnId = VI_IVA_CHANNEL;
	iva_frame_info->s32DevId = MAIN_CAM_INDEX;
	fd = RK_MPI_MB_Handle2Fd(iva_frame_info->stFrame.stVFrame.pMbBlk);
	memset(&iva_image, 0, sizeof(RockIvaImage));
	iva_image.info.transformMode = g_mpi_ctx->iva[0].eImageTransform;
	iva_image.info.width = iva_frame_info->stFrame.stVFrame.u32Width;
	iva_image.info.height = iva_frame_info->stFrame.stVFrame.u32Height;
	iva_image.info.format = g_mpi_ctx->iva[0].eImageFormat;
	iva_image.frameId = loop_count;
	iva_image.dataAddr = NULL;
	iva_image.dataPhyAddr = NULL;
	iva_image.dataFd = fd;
	iva_image.extData = iva_frame_info;
	ret = ROCKIVA_PushFrame(g_mpi_ctx->iva[0].ivahandle, &iva_image, NULL);
	if (ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_PushFrame failed %#X\n", ret);
		program_handle_error(__func__, __LINE__);
		return md;
	} else {
		RK_LOGD("push vi frame dev %d chn %d, seq %u, pts %llu to iva success",
		        iva_frame_info->s32DevId, iva_frame_info->s32ChnId,
		        iva_frame_info->stFrame.stVFrame.u32TimeRef,
		        iva_frame_info->stFrame.stVFrame.u64PTS);
	}

	// send sub cam frame to iva.
	iva_frame_info = (IvaFrameInfo *)malloc(sizeof(IvaFrameInfo));
	if (iva_frame_info == NULL) {
		RK_LOGE("malloc failed");
		program_handle_error(__func__, __LINE__);
		return md;
	}
	memcpy(&iva_frame_info->stFrame, sub_cam_frame, sizeof(VIDEO_FRAME_INFO_S));
	iva_frame_info->s32ChnId = VI_IVA_CHANNEL;
	iva_frame_info->s32DevId = SUB_CAM_INDEX;
	fd = RK_MPI_MB_Handle2Fd(iva_frame_info->stFrame.stVFrame.pMbBlk);
	memset(&iva_image, 0, sizeof(RockIvaImage));
	iva_image.info.transformMode = g_mpi_ctx->iva[1].eImageTransform;
	iva_image.info.width = iva_frame_info->stFrame.stVFrame.u32Width;
	iva_image.info.height = iva_frame_info->stFrame.stVFrame.u32Height;
	iva_image.info.format = g_mpi_ctx->iva[1].eImageFormat;
	iva_image.frameId = loop_count;
	iva_image.dataAddr = NULL;
	iva_image.dataPhyAddr = NULL;
	iva_image.dataFd = fd;
	iva_image.extData = iva_frame_info;
	ret = ROCKIVA_PushFrame(g_mpi_ctx->iva[1].ivahandle, &iva_image, NULL);
	if (ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_PushFrame failed %#X\n", ret);
		program_handle_error(__func__, __LINE__);
		return md;
	} else {
		RK_LOGD("push vi frame dev %d chn %d, seq %u, pts %llu to iva success",
		        iva_frame_info->s32DevId, iva_frame_info->s32ChnId,
		        iva_frame_info->stFrame.stVFrame.u32TimeRef,
		        iva_frame_info->stFrame.stVFrame.u64PTS);
	}
	pthread_mutex_lock(&g_thread_status->stWakeupMutex);
	while (g_thread_status->u32RunningTaskCount > 0)
		pthread_cond_wait(&g_thread_status->stWakeupCond,
		                  &g_thread_status->stWakeupMutex);
	pthread_mutex_unlock(&g_thread_status->stWakeupMutex);
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	used_time = end_time.tv_sec * 1000000LL + end_time.tv_nsec / 1000LL -
	            (start_time.tv_sec * 1000000LL + start_time.tv_nsec / 1000LL);
	RK_LOGD("iva cost time %llu ms", used_time / 1000);
	return md;
}

static void drop_remain_vi_frames(void) {
	RK_S32 vi_dev_id = 0;
	RK_S32 vi_chn_id = 0;
	RK_S32 ret;
	VIDEO_FRAME_INFO_S tmp_frame;
	vi_dev_id = MAIN_CAM_INDEX;
	vi_chn_id = VI_IVA_CHANNEL;
	while (RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 10) == RK_SUCCESS)
		RK_MPI_VI_ReleaseChnFrame(vi_dev_id, vi_chn_id, &tmp_frame);
	vi_dev_id = SUB_CAM_INDEX;
	vi_chn_id = VI_IVA_CHANNEL;
	while (RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 10) == RK_SUCCESS)
		RK_MPI_VI_ReleaseChnFrame(vi_dev_id, vi_chn_id, &tmp_frame);
}

static void enter_multi_frame_mode(void) {
	SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
	SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
	if (g_cmd_args->bEnableSaveMp4) {
		SAMPLE_COMM_AOV_StartRecordMp4(g_mpi_ctx->mpi_muxer[0]);
		SAMPLE_COMM_AOV_StartRecordMp4(g_mpi_ctx->mpi_muxer[1]);
	}
	if (g_cmd_args->bEnableIva) {
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva[0], ROCKIVA_MODE_VIDEO);
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva[1], ROCKIVA_MODE_VIDEO);
	}
}

static void enter_single_frame_mode(void) {
	SAMPLE_COMM_ISP_SingleFrame(MAIN_CAM_INDEX);
	SAMPLE_COMM_ISP_SingleFrame(SUB_CAM_INDEX);
	drop_remain_vi_frames();
	if (g_cmd_args->bEnableSaveMp4) {
		SAMPLE_COMM_AOV_StopRecordMp4(g_mpi_ctx->mpi_muxer[0]);
		SAMPLE_COMM_AOV_StopRecordMp4(g_mpi_ctx->mpi_muxer[1]);
	}
	if (g_cmd_args->bEnableIva) {
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva[0], ROCKIVA_MODE_PICTURE);
		SAMPLE_COMM_IVA_SetWorkMode(&g_mpi_ctx->iva[1], ROCKIVA_MODE_PICTURE);
	}
}

static void capture_frames_in_normal_mode() {
	RK_S32 ret = RK_SUCCESS;
	for (int i = 0; i < g_cmd_args->u32BootFrame; ++i) {
		int vi_dev_id = MAIN_CAM_INDEX;
		int vi_chn_id = VI_IVA_CHANNEL;
		VIDEO_FRAME_INFO_S tmp_frame;
		do {
			ret = RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 1000);
			if (ret != RK_SUCCESS)
				RK_LOGE("dev %d chn %d RK_MPI_VI_GetChnFrame failed %#X", vi_dev_id,
				        vi_chn_id, ret);
			else
				RK_LOGV("dev %d chn %d get frame w:%d h:%d seq:%d pts:%llu", vi_dev_id,
				        vi_chn_id, tmp_frame.stVFrame.u32Width,
				        tmp_frame.stVFrame.u32Height, tmp_frame.stVFrame.u32TimeRef,
				        tmp_frame.stVFrame.u64PTS);
		} while (ret != RK_SUCCESS);
		RK_MPI_VI_ReleaseChnFrame(vi_dev_id, vi_chn_id, &tmp_frame);

		vi_dev_id = SUB_CAM_INDEX;
		vi_chn_id = VI_IVA_CHANNEL;
		do {
			ret = RK_MPI_VI_GetChnFrame(vi_dev_id, vi_chn_id, &tmp_frame, 1000);
			if (ret != RK_SUCCESS)
				RK_LOGE("dev %d chn %d RK_MPI_VI_GetChnFrame failed %#X", vi_dev_id,
				        vi_chn_id, ret);
			else
				RK_LOGV("dev %d chn %d get frame w:%d h:%d seq:%d pts:%llu", vi_dev_id,
				        vi_chn_id, tmp_frame.stVFrame.u32Width,
				        tmp_frame.stVFrame.u32Height, tmp_frame.stVFrame.u32TimeRef,
				        tmp_frame.stVFrame.u64PTS);
		} while (ret != RK_SUCCESS);
		RK_MPI_VI_ReleaseChnFrame(vi_dev_id, vi_chn_id, &tmp_frame);
		draw_osd(MULTI_FRAME_MODE, false);
	}
}
static void unbindAllDevices() {
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
	SAMPLE_COMM_AOV_BindSdcard();
	SAMPLE_COMM_AOV_BindSDIO();
	if (!g_cmd_args->bEnableSaveMp4)
		SAMPLE_COMM_AOV_BindSoundcard();
	if (!g_cmd_args->bEnableRtsp)
		SAMPLE_COMM_AOV_BindUsb();
}
static void *human_detect_loop(void *data) {
	RK_BOOL is_gpioirq_happened = RK_FALSE;
	RK_BOOL is_exp_big_change = RK_FALSE;
	RK_BOOL is_ae_converged = RK_TRUE;
	RK_BOOL md = RK_FALSE;
	RK_U32 loop_count = 0, aov_loop_count = 0;
	RK_U32 irq_wakeup_count = 0;
	enum ISP_MODE current_isp_mode = MULTI_FRAME_MODE;
	struct timespec start_time, end_time;
	RK_U64 delay_time = 1000000LL / g_cmd_args->u32IvaDetectFrameRate; // micro seconds
	RK_U64 used_time = 0;

	TRACE_BEGIN();

	// Before enter aov, running in normal mode.
	capture_frames_in_normal_mode();

	unbindAllDevices();

	SAMPLE_COMM_AOV_GetGpioIrqStat(); // ignore previous input events.
	while (!g_thread_status->bIfMainThreadQuit) {
		if (current_isp_mode == MULTI_FRAME_MODE)
			clock_gettime(CLOCK_MONOTONIC, &start_time);
		// 1. Check input event to detect weather gpio irq is happened.
		is_gpioirq_happened = SAMPLE_COMM_AOV_GetGpioIrqStat();
		RK_LOGD("is gpioirq happened %d", is_gpioirq_happened);
		// Force flush cached data to sdcard when wakeup by interrupt
		if (is_gpioirq_happened)
			g_thread_status->bForceFlushData = true;

		// 2. Get frames from vi iva channel.
		get_and_cached_vi_frames();

		// 3. Send cached frames to iva, and wait for human detect done.
		md = send_cached_frames_to_iva(loop_count, current_isp_mode);

		switch (current_isp_mode) {
		// 4. Change ISP state if need.
		case SINGLE_FRAME_MODE:
			// The condition for switching to multi frame mode is:
			//	1) Have detected a human body.
			//	2) GPIO irq is happend.
			//  3) FastAE mode
			if (g_cmd_args->bEnableFastAe)
				is_exp_big_change = SAMPLE_COMM_ISP_IsExpBigChange(MAIN_CAM_INDEX) ||
				                    SAMPLE_COMM_ISP_IsExpBigChange(SUB_CAM_INDEX);
			if (is_gpioirq_happened || g_thread_status->u32WakeupCount > 0 ||
			    is_exp_big_change) {
				// to multi frame
				RK_LOGI("#Resume isp, Enter multi frame, wakeup because %s\n",
				        is_gpioirq_happened ? "gpio irq" : "detected human body");
				enter_multi_frame_mode();
				current_isp_mode = MULTI_FRAME_MODE;
				if (is_gpioirq_happened) {
					irq_wakeup_count = g_cmd_args->u32MaxIrqWakeupCount;
					is_gpioirq_happened = RK_FALSE;
				}
				break;
			}
			if (get_int32_from_env("test_aov_resume_suspend", 0) &&
			    (aov_loop_count % 60) == 0) {
				RK_LOGI("#Resume isp, Enter multi frame for test");
				enter_multi_frame_mode();
				current_isp_mode = MULTI_FRAME_MODE;
				irq_wakeup_count = 60;
			}

			break;
		case MULTI_FRAME_MODE:
			// The condition for switching to single frame mode is:
			//	1) Have not detected human body too much times.
			//	2) GPIO irq is happend.
			//	3) wakeup_frame_count equals to zero.
			if (get_int32_from_env("test_skip_aov", 0))
				break;
			if (g_cmd_args->bEnableFastAe && is_exp_big_change) {
				is_ae_converged = SAMPLE_COMM_ISP_IsExpConverge(MAIN_CAM_INDEX) &&
				                  SAMPLE_COMM_ISP_IsExpConverge(SUB_CAM_INDEX);
				if (is_ae_converged)
					is_exp_big_change = RK_FALSE;
			}
			if (is_gpioirq_happened ||
			    ((irq_wakeup_count == 0) && (g_thread_status->u32WakeupCount == 0) &&
			     is_ae_converged)) {
				RK_LOGI("#Pause isp, Enter single frame\n");
				enter_single_frame_mode();
				irq_wakeup_count = 0;
				current_isp_mode = SINGLE_FRAME_MODE;
				break;
			}
			if (irq_wakeup_count > 0)
				--irq_wakeup_count;
			break;
		}

		++loop_count;
		// 5. Enter sleep mode if in single frame mode.
		if (current_isp_mode == SINGLE_FRAME_MODE) {
			++aov_loop_count;
			if (g_cmd_args->s32AovLoopCount > 0 &&
			    aov_loop_count > g_cmd_args->s32AovLoopCount) {
				RK_LOGI("Exit AOV!");
				break;
			} else {
				SAMPLE_COMM_AOV_EnterSleep();
			}
			draw_osd(current_isp_mode, md);
		} else {
			draw_osd(current_isp_mode, md);
			clock_gettime(CLOCK_MONOTONIC, &end_time);
			used_time = end_time.tv_sec * 1000000LL + end_time.tv_nsec / 1000LL -
			            (start_time.tv_sec * 1000000LL + start_time.tv_nsec / 1000LL);
			RK_LOGD("loop cost time %llu ms", used_time / 1000);
			if (delay_time > used_time)
				usleep(delay_time - used_time);
		}
	}
	enter_multi_frame_mode();
	bindAllDevices();
	// after exit aov, running in normal mode.
	capture_frames_in_normal_mode();
	program_normal_exit(__func__, __LINE__);
	TRACE_END();
	return NULL;
}

static RK_S32 global_param_init(void) {
	g_thread_status = (ThreadStatus *)malloc(sizeof(ThreadStatus));
	if (!g_thread_status) {
		RK_LOGI("malloc for g_thread_status failure\n");
		goto __global_init_fail;
	}
	memset(g_thread_status, 0, sizeof(ThreadStatus));
	pthread_mutex_init(&g_thread_status->stWakeupMutex, NULL);
	pthread_cond_init(&g_thread_status->stWakeupCond, NULL);

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
		pthread_mutex_destroy(&g_thread_status->stWakeupMutex);
		pthread_cond_destroy(&g_thread_status->stWakeupCond);
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
static RK_S32 aov_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	SAMPLE_COMM_AOV_Init();
	SAMPLE_COMM_AOV_SetPeriodTime(pArgs->u32SuspendTime);
	return ret;
}

static RK_S32 aov_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	SAMPLE_COMM_AOV_Deinit();
	return ret;
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
	RK_S32 ret = RK_SUCCESS;
	rk_aiq_camgroup_instance_cfg_t camgroup_cfg;
	if (pArgs->bEnableGroup) {
		SAMPLE_COMM_ISP_CamGroup_Init(0, RK_AIQ_WORKING_MODE_NORMAL, 0, 0, NULL,
		                              &camgroup_cfg);
	} else {
		ret = SAMPLE_COMM_ISP_Init(MAIN_CAM_INDEX, RK_AIQ_WORKING_MODE_NORMAL,
		                           pArgs->bMultictx, pArgs->pIqFileDir);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d init failed!\n", MAIN_CAM_INDEX);
			return ret;
		}
		if (pArgs->u32IspMode == 1)
			SAMPLE_COMM_ISP_SetSyncMode(MAIN_CAM_INDEX, SOFT_SYNC_MODE);
		ret = SAMPLE_COMM_ISP_Run(MAIN_CAM_INDEX);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d run failed!\n", MAIN_CAM_INDEX);
			return ret;
		}
#ifndef AOV_FASTBOOT_ENABLE
		ret = SAMPLE_COMM_ISP_SetFrameRate(MAIN_CAM_INDEX, pArgs->u32Fps);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d set fps failed!\n", MAIN_CAM_INDEX);
			return ret;
		}
#endif
		ret = SAMPLE_COMM_ISP_Init(SUB_CAM_INDEX, RK_AIQ_WORKING_MODE_NORMAL,
		                           pArgs->bMultictx, pArgs->pIqFileDir);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d init failed!\n", SUB_CAM_INDEX);
			return ret;
		}
		if (pArgs->u32IspMode == 1)
			SAMPLE_COMM_ISP_SetSyncMode(SUB_CAM_INDEX, SOFT_SYNC_MODE);
		ret = SAMPLE_COMM_ISP_Run(SUB_CAM_INDEX);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d run failed!\n", SUB_CAM_INDEX);
			return ret;
		}
#ifndef AOV_FASTBOOT_ENABLE
		ret = SAMPLE_COMM_ISP_SetFrameRate(SUB_CAM_INDEX, pArgs->u32Fps);
		if (ret != RK_SUCCESS) {
			printf("#ISP cam %d set fps failed!\n", SUB_CAM_INDEX);
			return ret;
		}
#endif
		if (g_cmd_args->u32MaxExpTime) {
			SAMPLE_COMM_ISP_SetMaxExpTime(MAIN_CAM_INDEX, g_cmd_args->u32MaxExpTime);
			SAMPLE_COMM_ISP_SetMaxExpTime(SUB_CAM_INDEX, g_cmd_args->u32MaxExpTime);
		}
	}
	return ret;
}

static RK_S32 isp_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	if (pArgs->bEnableGroup) {
		SAMPLE_COMM_ISP_CamGroup_Stop(0);
	} else {
		SAMPLE_COMM_ISP_Stop(MAIN_CAM_INDEX);
		SAMPLE_COMM_ISP_Stop(SUB_CAM_INDEX);
	}
	return ret;
}

static RK_S32 vi_dev_init(RkCmdArgs *pArgs) {
	int ret = RK_SUCCESS;
	int vi_dev_id = MAIN_CAM_INDEX;
	VI_DEV_ATTR_S vi_dev_attr;
	VI_DEV_BIND_PIPE_S vi_dev_bind_pipe;
	VI_PARAM_MOD_S vi_mod_param;

	memset(&vi_dev_attr, 0, sizeof(vi_dev_attr));
	memset(&vi_dev_bind_pipe, 0, sizeof(vi_dev_bind_pipe));
	memset(&vi_mod_param, 0, sizeof(vi_mod_param));

	TRACE_BEGIN();
	// 0. get dev config status
	ret = RK_MPI_VI_GetDevAttr(vi_dev_id, &vi_dev_attr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		// 0-1.config dev
		// Set raw buffer count.
		if (pArgs->u32IspMode == 0)
			vi_dev_attr.u32BufCount = pArgs->u32CifBuffCnt;
		ret = RK_MPI_VI_SetDevAttr(vi_dev_id, &vi_dev_attr);
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
		vi_dev_bind_pipe.u32Num = vi_dev_id;
		vi_dev_bind_pipe.PipeId[0] = vi_dev_id;
		ret = RK_MPI_VI_SetDevBindPipe(vi_dev_id, &vi_dev_bind_pipe);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetDevBindPipe %x\n", ret);
			return -1;
		}
	} else {
		RK_LOGE("RK_MPI_VI_EnableDev already\n");
	}

	vi_dev_id = SUB_CAM_INDEX;
	memset(&vi_dev_attr, 0, sizeof(vi_dev_attr));
	memset(&vi_dev_bind_pipe, 0, sizeof(vi_dev_bind_pipe));
	memset(&vi_mod_param, 0, sizeof(vi_mod_param));
	// 0. get dev config status
	ret = RK_MPI_VI_GetDevAttr(vi_dev_id, &vi_dev_attr);
	if (ret == RK_ERR_VI_NOT_CONFIG) {
		// 0-1.config dev
		if (pArgs->u32IspMode == 0 || pArgs->u32IspMode == 1)
			vi_dev_attr.u32BufCount = pArgs->u32CifBuffCnt;
		ret = RK_MPI_VI_SetDevAttr(vi_dev_id, &vi_dev_attr);
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
		vi_dev_bind_pipe.u32Num = vi_dev_id;
		vi_dev_bind_pipe.PipeId[0] = vi_dev_id;
		ret = RK_MPI_VI_SetDevBindPipe(vi_dev_id, &vi_dev_bind_pipe);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetDevBindPipe %x\n", ret);
			return -1;
		}
	} else {
		RK_LOGE("RK_MPI_VI_EnableDev already\n");
	}
	if (pArgs->u32IspMode == 1) {
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_LEFT_HALF_ONLINE;
		ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", ret);
			return ret;
		}
	} else if (pArgs->u32IspMode == 2) {
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_ONLINE;
		ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", ret);
			return ret;
		}
	}

#if defined(RV1106B)
	// RV1106B's dual-camera wrap must use 'VI_CHN_WRAP_SOFT'."
	if (pArgs->bEnableWrap) {
		vi_mod_param.enViModType = VI_CHN_WRAP_MODE;
		vi_mod_param.stChnWrapModParam.enChnWrapMode = VI_CHN_WRAP_SOFT;
		RK_MPI_VI_SetModParam(&vi_mod_param);
	}
#endif

	TRACE_END();
	return ret;
}

static RK_S32 vi_chn_init(RK_S32 vi_dev_id, RkCmdArgs *pArgs) {
	int ret = RK_SUCCESS;
	VI_CHN_ATTR_S vi_chn_attr;

	memset(&vi_chn_attr, 0, sizeof(vi_chn_attr));
	TRACE_BEGIN();
	// VI Channel 0
	vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	// Size of vi channel output buffer.
	vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32MainChnWidth;
	vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32MainChnHeight * 2;
	// The position of isp input located in output buffer.
	if (vi_dev_id == MAIN_CAM_INDEX) {
		vi_chn_attr.stIspOpt.stWindow.s32X = 0;
		vi_chn_attr.stIspOpt.stWindow.s32Y = 0;
	} else {
		vi_chn_attr.stIspOpt.stWindow.s32X = 0;
		vi_chn_attr.stIspOpt.stWindow.s32Y = pArgs->u32MainChnHeight;
	}
	vi_chn_attr.stIspOpt.stWindow.u32Width = pArgs->u32MainChnWidth;
	vi_chn_attr.stIspOpt.stWindow.u32Height = pArgs->u32MainChnHeight;
	// Share buffer configuration
	if (vi_dev_id == MAIN_CAM_INDEX) {
		vi_chn_attr.enAllocBufType = VI_ALLOC_BUF_TYPE_INTERNAL;
	} else {
		vi_chn_attr.enAllocBufType = VI_ALLOC_BUF_TYPE_CHN_SHARE;
		vi_chn_attr.stShareBufChn.enModId = RK_ID_VI;
		vi_chn_attr.stShareBufChn.s32DevId = MAIN_CAM_INDEX;
		vi_chn_attr.stShareBufChn.s32ChnId = VI_MAIN_CHANNEL;
	}

	// Normal vi channel configure.
	vi_chn_attr.stSize.u32Width = pArgs->u32MainChnWidth;
	vi_chn_attr.stSize.u32Height = pArgs->u32MainChnHeight;
	vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
	vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
	vi_chn_attr.u32Depth = 0;
	vi_chn_attr.stFrameRate.s32SrcFrameRate = -1;
	vi_chn_attr.stFrameRate.s32DstFrameRate = -1;
	ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_MAIN_CHANNEL, &vi_chn_attr);
	if (ret) {
		RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
		return ret;
	}
	if (pArgs->bEnableWrap) {
		VI_CHN_BUF_WRAP_S stViWrap;
		memset(&stViWrap, 0, sizeof(VI_CHN_BUF_WRAP_S));
		stViWrap.bEnable = RK_TRUE;
		stViWrap.u32BufLine = pArgs->u32MainChnHeight / pArgs->u32WrapLine;
		stViWrap.u32WrapBufferSize = stViWrap.u32BufLine * pArgs->u32MainChnWidth * 3 / 2;
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
	} else {
		RK_LOGE("RK_MPI_VI_EnableChn [%d,%d] success\n", vi_dev_id, VI_MAIN_CHANNEL);
	}

	if (pArgs->bEnableSubStream) {
		// VI Channel 1
		memset(&vi_chn_attr, 0, sizeof(vi_chn_attr));
		vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
		vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
		// Size of vi channel output buffer.
		vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32SubChnWidth;
		vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32SubChnHeight * 2;
		// The position of isp input located in output buffer.
		if (vi_dev_id == MAIN_CAM_INDEX) {
			vi_chn_attr.stIspOpt.stWindow.s32X = 0;
			vi_chn_attr.stIspOpt.stWindow.s32Y = 0;
		} else {
			vi_chn_attr.stIspOpt.stWindow.s32X = 0;
			vi_chn_attr.stIspOpt.stWindow.s32Y = pArgs->u32SubChnHeight;
		}
		vi_chn_attr.stIspOpt.stWindow.u32Width = pArgs->u32SubChnWidth;
		vi_chn_attr.stIspOpt.stWindow.u32Height = pArgs->u32SubChnHeight;
		// Share buffer configuration
		if (vi_dev_id == MAIN_CAM_INDEX) {
			vi_chn_attr.enAllocBufType = VI_ALLOC_BUF_TYPE_INTERNAL;
		} else {
			vi_chn_attr.enAllocBufType = VI_ALLOC_BUF_TYPE_CHN_SHARE;
			vi_chn_attr.stShareBufChn.enModId = RK_ID_VI;
			vi_chn_attr.stShareBufChn.s32DevId = MAIN_CAM_INDEX;
			vi_chn_attr.stShareBufChn.s32ChnId = VI_SUB_CHANNEL;
		}

		// Normal vi channel configure.
		vi_chn_attr.stSize.u32Width = pArgs->u32SubChnWidth;
		vi_chn_attr.stSize.u32Height = pArgs->u32SubChnHeight;
		vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
		vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
		vi_chn_attr.u32Depth = 0;
		vi_chn_attr.stFrameRate.s32SrcFrameRate = -1;
		vi_chn_attr.stFrameRate.s32DstFrameRate = -1;
		ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_SUB_CHANNEL, &vi_chn_attr);
		if (ret) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
			return ret;
		}
		ret = RK_MPI_VI_EnableChn(vi_dev_id, VI_SUB_CHANNEL);
		if (ret) {
			RK_LOGE("RK_MPI_VI_EnableChn failed %#X\n", ret);
			return ret;
		} else {
			RK_LOGE("RK_MPI_VI_EnableChn [%d,%d] success\n", vi_dev_id, VI_SUB_CHANNEL);
		}
	}
	// VI Channel 2
	// This channel use by AI analyze
	memset(&vi_chn_attr, 0, sizeof(vi_chn_attr));
	vi_chn_attr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	vi_chn_attr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	vi_chn_attr.stIspOpt.stMaxSize.u32Width = pArgs->u32IvaChnWidth;
	vi_chn_attr.stIspOpt.stMaxSize.u32Height = pArgs->u32IvaChnHeight;
	vi_chn_attr.stSize.u32Width = pArgs->u32IvaChnWidth;
	vi_chn_attr.stSize.u32Height = pArgs->u32IvaChnHeight;
	vi_chn_attr.enPixelFormat = RK_FMT_YUV420SP;
	vi_chn_attr.enCompressMode = COMPRESS_MODE_NONE;
	vi_chn_attr.enAllocBufType = VI_ALLOC_BUF_TYPE_INTERNAL;
	vi_chn_attr.u32Depth = 1;
	vi_chn_attr.stFrameRate.s32SrcFrameRate = -1;
	vi_chn_attr.stFrameRate.s32DstFrameRate = -1;
	ret = RK_MPI_VI_SetChnAttr(vi_dev_id, VI_IVA_CHANNEL, &vi_chn_attr);
	if (ret) {
		RK_LOGE("RK_MPI_VI_SetChnAttr failed %#X\n", ret);
		return ret;
	}
	ret = RK_MPI_VI_EnableChn(vi_dev_id, VI_IVA_CHANNEL);
	if (ret) {
		RK_LOGE("RK_MPI_VI_EnableChn failed %#X\n", ret);
		return ret;
	} else {
		RK_LOGE("RK_MPI_VI_EnableChn [%d,%d] success\n", vi_dev_id, VI_IVA_CHANNEL);
	}
	TRACE_END();
	return ret;
}

static RK_S32 vi_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	ret = vi_dev_init(pArgs);
	if (ret != RK_SUCCESS) {
		RK_LOGE("init vi dev failed");
		return ret;
	}
	ret = vi_chn_init(MAIN_CAM_INDEX, pArgs);
	if (ret != RK_SUCCESS) {
		RK_LOGE("init main vi chn failed");
		return ret;
	}
	ret = vi_chn_init(SUB_CAM_INDEX, pArgs);
	if (ret != RK_SUCCESS) {
		RK_LOGE("init sub vi chn failed");
		return ret;
	}
	TRACE_END();
	return ret;
}

static RK_S32 vi_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	RK_U32 vi_dev_id = MAIN_CAM_INDEX;
	TRACE_BEGIN();
	RK_MPI_VI_DisableChn(vi_dev_id, VI_MAIN_CHANNEL);
	if (pArgs->bEnableSubStream)
		RK_MPI_VI_DisableChn(vi_dev_id, VI_SUB_CHANNEL);
	RK_MPI_VI_DisableChn(vi_dev_id, VI_IVA_CHANNEL);
	RK_MPI_VI_DisableDev(vi_dev_id);
	vi_dev_id = SUB_CAM_INDEX;
	RK_MPI_VI_DisableChn(vi_dev_id, VI_MAIN_CHANNEL);
	if (pArgs->bEnableSubStream)
		RK_MPI_VI_DisableChn(vi_dev_id, VI_SUB_CHANNEL);
	RK_MPI_VI_DisableChn(vi_dev_id, VI_IVA_CHANNEL);
	RK_MPI_VI_DisableDev(vi_dev_id);
	TRACE_END();
	return ret;
}

static RK_S32 venc_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	RK_S32 venc_chn;
	TRACE_BEGIN();
	venc_chn = VENC_MAIN_CHANNEL;
	ctx->venc[venc_chn].s32ChnId = venc_chn;
	ctx->venc[venc_chn].u32Width = pArgs->u32MainChnWidth;
	ctx->venc[venc_chn].u32Height = pArgs->u32MainChnHeight * 2;
	ctx->venc[venc_chn].u32Fps = pArgs->u32Fps;
	ctx->venc[venc_chn].u32Gop = pArgs->u32Gop;
	ctx->venc[venc_chn].u32BitRate = pArgs->u32BitRate;
	ctx->venc[venc_chn].enCodecType = pArgs->enCodecType;
	ctx->venc[venc_chn].enRcMode = pArgs->enRcMode;
	ctx->venc[venc_chn].getStreamCbFunc = venc_get_stream;
	ctx->venc[venc_chn].u32BuffSize =
	    (ctx->venc[venc_chn].u32Width * ctx->venc[venc_chn].u32Height) / 3;
	ctx->venc[venc_chn].enable_buf_share = 1;
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	ctx->venc[venc_chn].stChnAttr.stVencAttr.u32Profile = 100;
	ctx->venc[venc_chn].stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	if (pArgs->bEnableWrap) {
		ctx->venc[venc_chn].bWrapIfEnable = RK_TRUE;
		ctx->venc[venc_chn].u32BufferLine = ctx->venc[0].u32Height / pArgs->u32WrapLine;
	}
	ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[venc_chn]);
	if (ret != RK_SUCCESS) {
		RK_LOGE("create venc %d failed", venc_chn);
		return ret;
	}

	if (!pArgs->bEnableSubStream)
		return ret;
	venc_chn = VENC_SUB_CHANNEL;
	ctx->venc[venc_chn].s32ChnId = venc_chn;
	ctx->venc[venc_chn].u32Width = pArgs->u32SubChnWidth;
	ctx->venc[venc_chn].u32Height = pArgs->u32SubChnHeight * 2;
	ctx->venc[venc_chn].u32Fps = pArgs->u32Fps;
	ctx->venc[venc_chn].u32Gop = pArgs->u32Gop;
	ctx->venc[venc_chn].u32BitRate = pArgs->u32BitRate;
	ctx->venc[venc_chn].enCodecType = pArgs->enCodecType;
	ctx->venc[venc_chn].enRcMode = pArgs->enRcMode;
	ctx->venc[venc_chn].getStreamCbFunc = venc_get_stream;
	ctx->venc[venc_chn].u32BuffSize =
	    (ctx->venc[venc_chn].u32Width * ctx->venc[venc_chn].u32Height) / 3;
	ctx->venc[venc_chn].enable_buf_share = 1;
	// H264  66：Baseline  77：Main Profile 100：High Profile
	// H265  0：Main Profile  1：Main 10 Profile
	// MJPEG 0：Baseline
	ctx->venc[venc_chn].stChnAttr.stVencAttr.u32Profile = 100;
	ctx->venc[venc_chn].stChnAttr.stGopAttr.enGopMode =
	    VENC_GOPMODE_NORMALP; // VENC_GOPMODE_SMARTP
	ret = SAMPLE_COMM_VENC_CreateChn(&ctx->venc[venc_chn]);
	if (ret != RK_SUCCESS) {
		RK_LOGE("create venc %d failed", venc_chn);
		return ret;
	}
	TRACE_END();
	return ret;
}

static RK_S32 venc_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[VENC_MAIN_CHANNEL]);
	if (pArgs->bEnableSubStream)
		SAMPLE_COMM_VENC_DestroyChn(&ctx->venc[VENC_SUB_CHANNEL]);
	TRACE_END();
	return ret;
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
		ctx->ivs[ivs_chn].stIvsAttr.u32PicWidth = pArgs->u32IvaChnWidth;
		ctx->ivs[ivs_chn].stIvsAttr.u32PicHeight = pArgs->u32IvaChnHeight;
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

static RK_S32 iva_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	RK_S32 iva_chn = 0;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIva) {
		return ret;
		TRACE_END();
	}
	/* Init iva */
	for (iva_chn = 0; iva_chn < 2; ++iva_chn) {
		ctx->iva[iva_chn].pModelDataPath = pArgs->pIvaModelPath;
		ctx->iva[iva_chn].u32ImageHeight = pArgs->u32IvaChnWidth;
		ctx->iva[iva_chn].u32ImageWidth = pArgs->u32IvaChnHeight;
		ctx->iva[iva_chn].u32DetectStartX = 0;
		ctx->iva[iva_chn].u32DetectStartY = 0;
		ctx->iva[iva_chn].u32DetectWidth = pArgs->u32IvaChnWidth;
		ctx->iva[iva_chn].u32DetectHight = pArgs->u32IvaChnHeight;
		ctx->iva[iva_chn].eImageTransform = ROCKIVA_IMAGE_TRANSFORM_NONE;
		ctx->iva[iva_chn].eImageFormat = ROCKIVA_IMAGE_FORMAT_YUV420SP_NV12;
#if defined(RV1126)
		ctx->iva[iva_chn].eModeType = ROCKIVA_DET_MODEL_CLS7;
#else
		ctx->iva[iva_chn].eModeType = ROCKIVA_DET_MODEL_PFP;
#endif
		ctx->iva[iva_chn].u32IvaDetectFrameRate = pArgs->u32IvaDetectFrameRate;
		ctx->iva[iva_chn].detectResultCallback = iva_detect_result_callback;
		ctx->iva[iva_chn].releaseCallback = iva_frame_release_callback;
		ctx->iva[iva_chn].eIvaMode = ROCKIVA_MODE_DETECT;
		ret = SAMPLE_COMM_IVA_Create(&ctx->iva[iva_chn]);
		if (ret != RK_SUCCESS)
			RK_LOGE("SAMPLE_COMM_IVA_Create failure:%#X", ret);
	}
	TRACE_END();
	return ret;
}

static RK_S32 iva_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableIva) {
		return ret;
		TRACE_END();
	}
	SAMPLE_COMM_IVA_Destroy(&ctx->iva[0]);
	SAMPLE_COMM_IVA_Destroy(&ctx->iva[1]);
	TRACE_END();
	return ret;
}

static RK_S32 rgn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableDrawOsd) {
		return ret;
		TRACE_END();
	}
	// Init RGN[0]
	ctx->rect_osd[0].rgnHandle = 1;
	ctx->rect_osd[0].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rect_osd[0].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
	ctx->rect_osd[0].bDrawBmpManual = RK_TRUE;
	ctx->rect_osd[0].stMppChn.enModId = RK_ID_VENC;
	ctx->rect_osd[0].stMppChn.s32ChnId = VENC_MAIN_CHANNEL;
	ctx->rect_osd[0].stMppChn.s32DevId = 0;
	ctx->rect_osd[0].stRegion.s32X = 0;                            // must be 16 aligned
	ctx->rect_osd[0].stRegion.s32Y = 0;                            // must be 16 aligned
	ctx->rect_osd[0].stRegion.u32Width = pArgs->u32MainChnWidth;   // must be 16 aligned
	ctx->rect_osd[0].stRegion.u32Height = pArgs->u32MainChnHeight; // must be 16 aligned
#if defined(RV1126)
	ctx->rect_osd[0].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
	ctx->rect_osd[0].u32BmpFormat = RK_FMT_2BPP;
#else
	ctx->rect_osd[0].u32BmpFormat = RK_FMT_1BPP;
#endif
	ctx->rect_osd[0].u32BgAlpha = 0;
	ctx->rect_osd[0].u32FgAlpha = 255;
	ctx->rect_osd[0].u32Layer = 1;
	ctx->rect_osd[0]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	ctx->rect_osd[0]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rect_osd[0]);
	if (ret != RK_SUCCESS)
		return ret;

	// Init rect_osd[1]
	ctx->rect_osd[1].rgnHandle = 2;
	ctx->rect_osd[1].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rect_osd[1].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
	ctx->rect_osd[1].bDrawBmpManual = RK_TRUE;
	ctx->rect_osd[1].stMppChn.enModId = RK_ID_VENC;
	ctx->rect_osd[1].stMppChn.s32ChnId = VENC_MAIN_CHANNEL;
	ctx->rect_osd[1].stMppChn.s32DevId = 0;
	ctx->rect_osd[1].stRegion.s32X = 0;                            // must be 16 aligned
	ctx->rect_osd[1].stRegion.s32Y = pArgs->u32MainChnHeight;      // must be 16 aligned
	ctx->rect_osd[1].stRegion.u32Width = pArgs->u32MainChnWidth;   // must be 16 aligned
	ctx->rect_osd[1].stRegion.u32Height = pArgs->u32MainChnHeight; // must be 16 aligned
#if defined(RV1126)
	ctx->rect_osd[1].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
	ctx->rect_osd[1].u32BmpFormat = RK_FMT_2BPP;
#else
	ctx->rect_osd[1].u32BmpFormat = RK_FMT_1BPP;
#endif
	ctx->rect_osd[1].u32BgAlpha = 0;
	ctx->rect_osd[1].u32FgAlpha = 255;
	ctx->rect_osd[1].u32Layer = 1;
	ctx->rect_osd[1]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	ctx->rect_osd[1]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rect_osd[1]);
	if (ret != RK_SUCCESS)
		return ret;

	ctx->rect_osd[2].rgnHandle = 3;
	ctx->rect_osd[2].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rect_osd[2].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
	ctx->rect_osd[2].bDrawBmpManual = RK_TRUE;
	ctx->rect_osd[2].stMppChn.enModId = RK_ID_VENC;
	ctx->rect_osd[2].stMppChn.s32ChnId = VENC_SUB_CHANNEL;
	ctx->rect_osd[2].stMppChn.s32DevId = 0;
	ctx->rect_osd[2].stRegion.s32X = 0;                           // must be 16 aligned
	ctx->rect_osd[2].stRegion.s32Y = 0;                           // must be 16 aligned
	ctx->rect_osd[2].stRegion.u32Width = pArgs->u32SubChnWidth;   // must be 16 aligned
	ctx->rect_osd[2].stRegion.u32Height = pArgs->u32SubChnHeight; // must be 16 aligned
#if defined(RV1126)
	ctx->rect_osd[2].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
	ctx->rect_osd[2].u32BmpFormat = RK_FMT_2BPP;
#else
	ctx->rect_osd[2].u32BmpFormat = RK_FMT_1BPP;
#endif
	ctx->rect_osd[2].u32BgAlpha = 0;
	ctx->rect_osd[2].u32FgAlpha = 255;
	ctx->rect_osd[2].u32Layer = 1;
	ctx->rect_osd[2]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	ctx->rect_osd[2]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	if (pArgs->bEnableSubStream) {
		ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rect_osd[2]);
		if (ret != RK_SUCCESS)
			return ret;
	}

	ctx->rect_osd[3].rgnHandle = 4;
	ctx->rect_osd[3].stRgnAttr.enType = OVERLAY_RGN;
	ctx->rect_osd[3].stRgnAttr.unAttr.stOverlay.u32CanvasNum = 2;
	ctx->rect_osd[3].bDrawBmpManual = RK_TRUE;
	ctx->rect_osd[3].stMppChn.enModId = RK_ID_VENC;
	ctx->rect_osd[3].stMppChn.s32ChnId = VENC_SUB_CHANNEL;
	ctx->rect_osd[3].stMppChn.s32DevId = 0;
	ctx->rect_osd[3].stRegion.s32X = 0;                           // must be 16 aligned
	ctx->rect_osd[3].stRegion.s32Y = pArgs->u32SubChnHeight;      // must be 16 aligned
	ctx->rect_osd[3].stRegion.u32Width = pArgs->u32SubChnWidth;   // must be 16 aligned
	ctx->rect_osd[3].stRegion.u32Height = pArgs->u32SubChnHeight; // must be 16 aligned
#if defined(RV1126)
	ctx->rect_osd[3].u32BmpFormat = RK_FMT_8BPP;
#elif defined(RV1106)
	ctx->rect_osd[3].u32BmpFormat = RK_FMT_2BPP;
#else
	ctx->rect_osd[3].u32BmpFormat = RK_FMT_1BPP;
#endif
	ctx->rect_osd[3].u32BgAlpha = 0;
	ctx->rect_osd[3].u32FgAlpha = 255;
	ctx->rect_osd[3].u32Layer = 1;
	ctx->rect_osd[3]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] =
	    BLUE_COLOR;
	ctx->rect_osd[3]
	    .stRgnChnAttr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] =
	    RED_COLOR;
	if (pArgs->bEnableSubStream) {
		ret = SAMPLE_COMM_RGN_CreateChn(&ctx->rect_osd[3]);
		if (ret != RK_SUCCESS)
			return ret;
	}

	ctx->time_osd[0].rgnHandle = 5;
	ctx->time_osd[0].stRgnAttr.enType = OVERLAY_RGN;
	ctx->time_osd[0].bDrawBmpManual = RK_TRUE;
	ctx->time_osd[0].stMppChn.enModId = RK_ID_VENC;
	ctx->time_osd[0].stMppChn.s32ChnId = VENC_MAIN_CHANNEL;
	ctx->time_osd[0].stMppChn.s32DevId = 0;
	ctx->time_osd[0].stRegion.s32X = 0;       // must be 16 aligned
	ctx->time_osd[0].stRegion.s32Y = 0;       // must be 16 aligned
	ctx->time_osd[0].stRegion.u32Width = 576; // must be 16 aligned
	ctx->time_osd[0].stRegion.u32Height = 32; // must be 16 aligned
	ctx->time_osd[0].u32BmpFormat = RK_FMT_ARGB8888;
	ctx->time_osd[0].u32BgAlpha = 64;
	ctx->time_osd[0].u32FgAlpha = 64;
	ctx->time_osd[0].u32Layer = 2;
	ctx->time_osd[0].st_osd_data.enable = 1; // enable time osd
	ret = SAMPLE_COMM_RGN_CreateChn(&ctx->time_osd[0]);
	if (ret != RK_SUCCESS)
		return ret;

	ctx->time_osd[1].rgnHandle = 6;
	ctx->time_osd[1].stRgnAttr.enType = OVERLAY_RGN;
	ctx->time_osd[1].bDrawBmpManual = RK_TRUE;
	ctx->time_osd[1].stMppChn.enModId = RK_ID_VENC;
	ctx->time_osd[1].stMppChn.s32ChnId = VENC_SUB_CHANNEL;
	ctx->time_osd[1].stMppChn.s32DevId = 0;
	ctx->time_osd[1].stRegion.s32X = 0;       // must be 16 aligned
	ctx->time_osd[1].stRegion.s32Y = 0;       // must be 16 aligned
	ctx->time_osd[1].stRegion.u32Width = 576; // must be 16 aligned
	ctx->time_osd[1].stRegion.u32Height = 32; // must be 16 aligned
	ctx->time_osd[1].u32BmpFormat = RK_FMT_ARGB8888;
	ctx->time_osd[1].u32BgAlpha = 64;
	ctx->time_osd[1].u32FgAlpha = 64;
	ctx->time_osd[1].u32Layer = 2;
	ctx->time_osd[1].st_osd_data.enable = 1; // enable time osd
	if (pArgs->bEnableSubStream) {
		ret = SAMPLE_COMM_RGN_CreateChn(&ctx->time_osd[1]);
		if (ret != RK_SUCCESS)
			return ret;
	}
	TRACE_END();
	return ret;
}

static RK_S32 rgn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	TRACE_BEGIN();
	if (!g_cmd_args->bEnableDrawOsd) {
		return ret;
		TRACE_END();
	}
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rect_osd[0]);
	SAMPLE_COMM_RGN_DestroyChn(&ctx->rect_osd[1]);
	SAMPLE_COMM_RGN_DestroyChn(&ctx->time_osd[0]);
	if (pArgs->bEnableSubStream) {
		SAMPLE_COMM_RGN_DestroyChn(&ctx->rect_osd[2]);
		SAMPLE_COMM_RGN_DestroyChn(&ctx->rect_osd[3]);
		SAMPLE_COMM_RGN_DestroyChn(&ctx->time_osd[1]);
	}
	TRACE_END();
	return ret;
}

static RK_S32 start_pipe(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	MPP_CHN_S src_chn, dst_chn;
	TRACE_BEGIN();
	/*
	 * VI[0,0] ————|
	 *             |——(ISP composite)——> VI[0,0] ————> VENC[0]
	 * VI[1,0] ————|
	 *
	 *
	 * VI[0,1] ————|
	 *             |——(ISP composite)——> VI[0,1] ————> VENC[1]
	 * VI[1,1] ————|
	 *
	 * */
	src_chn.enModId = RK_ID_VI;
	src_chn.s32DevId = MAIN_CAM_INDEX;
	src_chn.s32ChnId = VI_MAIN_CHANNEL;
	dst_chn.enModId = RK_ID_VENC;
	dst_chn.s32DevId = 0;
	dst_chn.s32ChnId = VENC_MAIN_CHANNEL;
	ret = SAMPLE_COMM_Bind(&src_chn, &dst_chn);
	if (ret != RK_SUCCESS)
		return ret;
	if (pArgs->bEnableSubStream) {
		src_chn.enModId = RK_ID_VI;
		src_chn.s32DevId = MAIN_CAM_INDEX;
		src_chn.s32ChnId = VI_SUB_CHANNEL;
		dst_chn.enModId = RK_ID_VENC;
		dst_chn.s32DevId = 0;
		dst_chn.s32ChnId = VENC_SUB_CHANNEL;
		ret = SAMPLE_COMM_Bind(&src_chn, &dst_chn);
		if (ret != RK_SUCCESS)
			return ret;
	}
	pthread_create(&g_thread_status->s32MainThreadId, NULL, human_detect_loop, NULL);
	g_thread_status->bIfMainThreadQuit = RK_FALSE;
	TRACE_END();
	return ret;
}

static RK_S32 stop_pipe(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 ret = RK_SUCCESS;
	MPP_CHN_S src_chn, dst_chn;
	TRACE_BEGIN();
	g_thread_status->bIfMainThreadQuit = RK_TRUE;
	pthread_join(g_thread_status->s32MainThreadId, NULL);
	pthread_join(g_mpi_ctx->venc[VENC_MAIN_CHANNEL].getStreamThread, NULL);
	if (pArgs->bEnableSubStream)
		pthread_join(g_mpi_ctx->venc[VENC_SUB_CHANNEL].getStreamThread, NULL);
	src_chn.enModId = RK_ID_VI;
	src_chn.s32DevId = MAIN_CAM_INDEX;
	src_chn.s32ChnId = VI_MAIN_CHANNEL;
	dst_chn.enModId = RK_ID_VENC;
	dst_chn.s32DevId = 0;
	dst_chn.s32ChnId = VENC_MAIN_CHANNEL;
	SAMPLE_COMM_UnBind(&src_chn, &dst_chn);

	if (pArgs->bEnableSubStream) {
		src_chn.enModId = RK_ID_VI;
		src_chn.s32DevId = MAIN_CAM_INDEX;
		src_chn.s32ChnId = VI_SUB_CHANNEL;
		dst_chn.enModId = RK_ID_VENC;
		dst_chn.s32DevId = 0;
		dst_chn.s32ChnId = VENC_SUB_CHANNEL;
		SAMPLE_COMM_UnBind(&src_chn, &dst_chn);
	}
	TRACE_END();
	return ret;
}

static RK_CHAR optstr[] = "?::a::b:w:h:l:o:e:d:D:I:i:L:M:r:g:f:v:";
static const struct option long_options[] = {
    {"aiq", optional_argument, NULL, 'a'},
    {"bitrate", required_argument, NULL, 'b'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'h'},
    {"encode", required_argument, NULL, 'e'},
    {"bitrate", required_argument, NULL, 'b'},
    {"fps", required_argument, NULL, 'f'},
    {"gop", required_argument, NULL, 'g'},
    {"vi_buff_cnt", required_argument, RK_NULL, 'v'},
    {"cif_buff_cnt", required_argument, RK_NULL, 'c' + 'b'},
    {"iva_model_path", required_argument, RK_NULL, 'i' + 'm'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"enable_save_sdcard", required_argument, RK_NULL, 'e' + 's'},
    {"enable_save_mp4", required_argument, RK_NULL, 'e' + 'm'},
    {"enable_iva", required_argument, RK_NULL, 'e' + 'i' + 'a'},
    {"enable_ivs", required_argument, RK_NULL, 'e' + 'i' + 's'},
    {"enable_group", required_argument, RK_NULL, 'e' + 'g'},
    {"enable_sub_stream", required_argument, RK_NULL, 'e' + 's' + 's'},
    {"enable_draw_osd", required_argument, RK_NULL, 'e' + 'd' + 'o'},
    {"enable_rtsp", required_argument, RK_NULL, 'e' + 'r' + 't' + 's'},
    {"isp_mode", required_argument, RK_NULL, 'i' + 's' + 'm'},
    {"max_wakeup_frame_count", required_argument, RK_NULL, 'm' + 'w'},
    {"max_exp_time", required_argument, RK_NULL, 'm' + 'e' + 't'},
    {"fast_ae", required_argument, NULL, 'f' + 'a'},
    {"cache_buff_size", required_argument, NULL, 'c' + 'b' + 's' + 'z'},
    {"wrap_lines", required_argument, NULL, 'w' + 'l'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -w 1920 -h 1080 -a /etc/iqfiles\n", name);
	printf("\t-a | --aiq: enable aiq with dirpath provided, eg:-a "
	       "/etc/iqfiles/, "
	       "set dirpath empty to using path by default, without this option aiq "
	       "should run in other application\n");
	printf("\t-w | --width: camera with, Default 1920\n");
	printf("\t-h | --height: camera height, Default 1080\n");
	printf("\t-e | --encode: encode type, Default:h265vbr, Value:h264cbr, "
	       "h264vbr, h264avbr "
	       "h265cbr, h265vbr, h265avbr, mjpegcbr, mjpegvbr\n");
	printf("\t-b | --bitrate: encode bitrate, Default 4096\n");
	printf("\t-f | --fps: camera framerate. Default: 25\n");
	printf("\t-g | --gop: venc gop. Default: fps x 2\n");
	printf("\t--vi_buff_cnt : vi buffer cnount, default: 1\n");
	printf("\t--cif_buff_cnt : rkcif buffer count, default: 0\n");
	printf("\t--enable_save_sdcard : enable save venc stream to sdcard, default: 1\n");
	printf("\t--enable_save_mp4 : enable save mp4 stream to sdcard, default: 0\n");
	printf("\t--enable_iva : enable human detect, default: 1\n");
	printf("\t--enable_ivs : enable motion detect, default: 1\n");
	printf("\t--enable_group : enable aiq group mode, default: 0\n");
	printf("\t--enable_sub_stream : enable sub stream, default: 1\n");
	printf("\t--enable_draw_osd : enable draw time osd and human body rectangle, "
	       "default: 1\n");
	printf("\t--enable_rtsp : enable rtsp, default: 1\n");
	printf("\t--isp_mode : isp mode, 0: offline, 1: half-online, 2: full-online. "
	       "default: 0\n");
	printf("\t--iva_model_path : iva model data path, default: /oem/usr/lib\n");
	printf("\t--aov_loop_count: set aov wakeup loop count, Default: -1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot, Default: "
	       "60 frames\n");
	printf("\t--max_wakeup_frame_count: max frame count running in multi "
	       "frame mode after wakeup by gpio, Default: 3000\n");
	printf("\t--max_exp_time: max exposure time(ms) limit in aov mode. default: 0\n");
	printf("\t--fast_ae: enable faset ae, 0: close, 1: enable. default: 0\n");
	printf("\t--cache_buff_size : buffer size(MB) used for caching video stream, default "
	       "10MB\n");
	printf("\t-r | --wrap : wrap for mainStream, 0: close 1: open, Default: 0\n");
	printf("\t--wrap_lines : 0: height/1, 1: height/2, 2: height/4, 3: height/8. "
	       "default: 2\n");
}

/******************************************************************************
 * function    : parse_cmd_args()
 * Description : Parse command line arguments.
 ******************************************************************************/
static RK_S32 parse_cmd_args(int argc, char **argv, RkCmdArgs *pArgs) {
	pArgs->u32MainChnWidth = 1920;
	pArgs->u32MainChnHeight = 1080;
	pArgs->u32SubChnWidth = 800;
	pArgs->u32SubChnHeight = 448;
	pArgs->u32IvaChnWidth = 640;
	pArgs->u32IvaChnHeight = 360;
	pArgs->u32Fps = 15;
	pArgs->enCodecType = RK_CODEC_TYPE_H264;
	pArgs->enRcMode = VENC_RC_MODE_H264VBR;
	pArgs->pCodecName = "H264";
	pArgs->u32BitRate = 4 * 1024;
	pArgs->u32Gop = 50;
	pArgs->u32ViBuffCnt = 1;
	pArgs->u32CifBuffCnt = 1;
	pArgs->pOutPath = "/mnt/sdcard";
	pArgs->pIqFileDir = "/etc/iqfiles";
	pArgs->pIvaModelPath = "/oem/usr/lib/";
	pArgs->u32IvaDetectFrameRate = 10;
	pArgs->bMultictx = RK_TRUE;
	pArgs->s32AovLoopCount = -1;
	pArgs->u32SuspendTime = 1000;
	pArgs->bEnableSaveRawStream = RK_FALSE;
	pArgs->bEnableSaveMp4 = RK_FALSE;
	pArgs->bEnableIvs = RK_TRUE;
	pArgs->bEnableIva = RK_TRUE;
	pArgs->bEnableGroup = RK_FALSE;
	pArgs->bEnableSubStream = RK_TRUE;
	pArgs->bEnableDrawOsd = RK_TRUE;
	pArgs->bEnableRtsp = RK_FALSE;
	pArgs->u32IspMode = 1;
	pArgs->u32BootFrame = 60;
	pArgs->u32MaxExpTime = 0;
	pArgs->u32MaxIrqWakeupCount = 3000;
	pArgs->u32CacheBuffSize = AOV_STREAM_SIZE_WRITE_TO_SDCARD;
	pArgs->bEnableWrap = RK_FALSE;
	pArgs->u32WrapLine = 2;

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
		case 'w':
			pArgs->u32MainChnWidth = atoi(optarg);
			break;
		case 'h':
			pArgs->u32MainChnHeight = atoi(optarg);
			break;
		case 'f':
			pArgs->u32Fps = atoi(optarg);
			break;
		case 'b':
			pArgs->u32BitRate = atoi(optarg);
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
		case 'i' + 'm':
			pArgs->pIvaModelPath = optarg;
			break;
		case 'o':
			pArgs->pOutPath = optarg;
			break;
		case 'v':
			pArgs->u32ViBuffCnt = atoi(optarg);
			break;
		case 'c' + 'b':
			pArgs->u32CifBuffCnt = atoi(optarg);
			break;
		case 'e' + 's':
			pArgs->bEnableSaveRawStream = atoi(optarg);
			break;
		case 'e' + 'm':
			pArgs->bEnableSaveMp4 = atoi(optarg);
			break;
		case 'e' + 'i' + 's':
			pArgs->bEnableIvs = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'i' + 'a':
			pArgs->bEnableIva = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'g':
			pArgs->bEnableGroup = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 's' + 's':
			pArgs->bEnableSubStream = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'd' + 'o':
			pArgs->bEnableDrawOsd = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'r' + 't' + 's':
			pArgs->bEnableRtsp = (atoi(optarg) != 0) ? RK_TRUE : RK_FALSE;
			break;
		case 'i' + 's' + 'm':
			pArgs->u32IspMode = atoi(optarg);
			break;
		case 'a' + 'm' + 'c':
			pArgs->s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			pArgs->u32SuspendTime = atoi(optarg);
			break;
		case 'b' + 'f':
			pArgs->u32BootFrame = atoi(optarg);
			break;
		case 'm' + 'e' + 't':
			pArgs->u32MaxExpTime = atoi(optarg);
			break;
		case 'c' + 'b' + 's' + 'z':
			pArgs->u32CacheBuffSize = atoi(optarg) * 1024 * 1024;
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
	if (aov_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("aov init failed!");
		return -1;
	}
	if (rtsp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("rtsp init failed!");
		return -1;
	}
	if (isp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("isp init failed!");
		return -1;
	} else {
		printf("#Main CameraIdx: %d\n", MAIN_CAM_INDEX);
		printf("#Sub CameraIdx: %d\n", SUB_CAM_INDEX);
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
	rtsp_deinit(g_mpi_ctx, g_cmd_args);
	aov_deinit(g_mpi_ctx, g_cmd_args);
	global_param_deinit();

	return g_exit_result;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
