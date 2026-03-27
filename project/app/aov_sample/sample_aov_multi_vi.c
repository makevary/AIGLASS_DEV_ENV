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

#define VI_MAIN_CHANNEL 0
#define VI_CHN_MAX 2
#define MAIN_CAM_INDEX 0
#define SUB_CAM_INDEX 1

#define FULLSIZE_WIDTH 1920
#define FULLSIZE_HEIGHT 1080
#define FULLSIZE_FPS 60
#define BINNING_WIDTH 960
#define BINNING_HEIGHT 540
#define BINNING_FPS 120

#define TRACE_BEGIN() RK_LOGW("Enter\n")
#define TRACE_END() RK_LOGW("Exit\n")

typedef struct _rkCmdArgs {
	RK_U32 u32Main0Width;
	RK_U32 u32Main0Height;
	RK_U32 u32Main1Width;
	RK_U32 u32Main1Height;
	RK_U32 u32ViBuffCnt;
	RK_U32 u32CifBuffCnt;
	RK_CHAR *pOutPath;
	RK_CHAR *pIqFileDir;
	RK_BOOL bMultictx;
	RK_CHAR *pCodecName;
	RK_BOOL bEnableSaveToSdcard;
	rk_aiq_working_mode_t eHdrMode;
	RK_S32 s32AeMode;
	RK_S32 s32AovLoopCount;
	RK_S32 s32SuspendTime;
	RK_S32 s32ViFrameMode;
	RK_U32 u32BootFrame;
	RK_U32 u32Fps;
	RK_BOOL bEnableDummyFrame;
	RK_BOOL bEnableChangeResolution;
	RK_BOOL bEnableScale;
	RK_U32 u32DummyFrameCnt;
	RK_U32 u32IspMode;
} RkCmdArgs;

typedef struct _rkMpiCtx {
	SAMPLE_VI_CTX_S vi[VI_CHN_MAX];
} SAMPLE_MPI_CTX_S;

typedef struct _rkThreadStatus {
	RK_BOOL bIfMainThreadQuit;
	RK_BOOL bIfViThreadQuit;
	pthread_t s32ViThreadId;
} ThreadStatus;

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

static RK_S32 change_sensor_resolution(int width, int height, int fps) {
	RK_S32 ret = RK_FAILURE;
	RK_U64 cost_time;
	struct timespec func_begin_time, func_end_time, start_time, end_time;
	VI_CHN_ATTR_S main_chn_attr, sub_chn_attr;
	VI_SENSOR_SETTING_S sensor_setting;
	SAMPLE_VI_CTX_S *main_ctx = &g_mpi_ctx->vi[0];
	SAMPLE_VI_CTX_S *sub_ctx = &g_mpi_ctx->vi[1];

#if defined(RV1106) || defined(RV1106B)
	clock_gettime(CLOCK_MONOTONIC, &func_begin_time);
	// 1. pause all isp stream
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	RK_MPI_VI_PauseChn(main_ctx->s32DevId, main_ctx->s32ChnId);
	RK_MPI_VI_PauseChn(sub_ctx->s32DevId, sub_ctx->s32ChnId);
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("stop isp stream cost %llu ms", cost_time);

	ret = RK_MPI_VI_GetChnAttr(main_ctx->s32DevId, main_ctx->s32ChnId, &main_chn_attr);
	if (ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_GetChnAttr failure:%X", ret);
		return ret;
	}
	ret = RK_MPI_VI_GetChnAttr(sub_ctx->s32DevId, sub_ctx->s32ChnId, &sub_chn_attr);
	if (ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_GetChnAttr failure:%X", ret);
		return ret;
	}

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
		main_chn_attr.stSize.u32Width = width;
		main_chn_attr.stSize.u32Height = height;
		sub_chn_attr.stSize.u32Width = width;
		sub_chn_attr.stSize.u32Height = height;
		ret =
		    RK_MPI_VI_SetChnAttr(main_ctx->s32DevId, main_ctx->s32ChnId, &main_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", ret);
			return ret;
		}
		ret = RK_MPI_VI_SetChnAttr(sub_ctx->s32DevId, sub_ctx->s32ChnId, &sub_chn_attr);
		if (ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", ret);
			return ret;
		}
	}

	// 3. pause aiq
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	SAMPLE_COMM_ISP_Pause(main_ctx->s32DevId);
	SAMPLE_COMM_ISP_Pause(sub_ctx->s32DevId);

	// 4. resume aiq
	ret = SAMPLE_COMM_ISP_Run(main_ctx->s32DevId);
	if (ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_ISP_Run failed %#X", ret);
		return ret;
	}
	ret = SAMPLE_COMM_ISP_Run(sub_ctx->s32DevId);
	if (ret != RK_SUCCESS) {
		RK_LOGE("SAMPLE_COMM_ISP_Run failed %#X", ret);
		return ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("aiq resume cost %lld ms", cost_time);

	// 5. resume all isp stream
	clock_gettime(CLOCK_MONOTONIC, &start_time);
	ret = RK_MPI_VI_ResumeChn(main_ctx->s32DevId, main_ctx->s32ChnId);
	if (ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_ResumeChn [%d,%d] failed %#X", main_ctx->s32DevId,
		        main_ctx->s32ChnId, ret);
		return ret;
	}
	ret = RK_MPI_VI_ResumeChn(sub_ctx->s32DevId, sub_ctx->s32ChnId);
	if (ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_ResumeChn [%d,%d] failed %#X", sub_ctx->s32DevId,
		        sub_ctx->s32ChnId, ret);
		return ret;
	}
	clock_gettime(CLOCK_MONOTONIC, &end_time);
	cost_time = end_time.tv_sec * 1000LL + end_time.tv_nsec / 1000000LL -
	            (start_time.tv_sec * 1000LL + start_time.tv_nsec / 1000000LL);
	RK_LOGI("isp resume cost %lld ms", cost_time);

	clock_gettime(CLOCK_MONOTONIC, &func_end_time);
	cost_time = func_end_time.tv_sec * 1000LL + func_end_time.tv_nsec / 1000000LL -
	            (func_begin_time.tv_sec * 1000LL + func_begin_time.tv_nsec / 1000000LL);
	RK_LOGW("change resolution cost %lld ms", cost_time);
#endif
	return RK_SUCCESS;
}

/******************************************************************************
 * function : vi thread
 ******************************************************************************/
static void *vi_get_stream_multi_mode(void *pArgs) {
	RK_S32 s32Ret = RK_FAILURE;
	SAMPLE_VI_CTX_S *main_ctx = &g_mpi_ctx->vi[0];
	SAMPLE_VI_CTX_S *sub_ctx = &g_mpi_ctx->vi[1];
	FILE *main_output_fp = RK_NULL, *sub_output_fp = RK_NULL;
	void *main_output_ptr = RK_NULL, *sub_output_ptr = RK_NULL;
	RK_U32 main_size, sub_size, wakeup_frame_count = 0, aov_frame_count = 0;
	RK_BOOL enable_multi_mode = g_cmd_args->s32ViFrameMode;
	RK_S32 loopCount = 0;
	enum ISP_MODE eCurISPMode = MULTI_FRAME_MODE;
	char name[256];
	VIDEO_FRAME_INFO_S tmp_frame;

	TRACE_BEGIN();

	if (g_cmd_args->pOutPath) {
		char time_str[64] = {'\0'};
		time_t curtime;
		curtime = time(0);
		strftime(time_str, sizeof(time_str), "%Y_%m_%d_%H_%M", localtime(&curtime));
		snprintf(name, sizeof(name), "/%s/cam%d_%dx%d_%s.yuv420", g_cmd_args->pOutPath,
		         MAIN_CAM_INDEX, main_ctx->u32Width, main_ctx->u32Height, time_str);
		main_output_fp = fopen(name, "wb");
		if (main_output_fp == RK_NULL)
			RK_LOGE("Can't open file %s!\n", name);
		snprintf(name, sizeof(name), "/%s/cam%d_%dx%d_%s.yuv420", g_cmd_args->pOutPath,
		         SUB_CAM_INDEX, sub_ctx->u32Width, sub_ctx->u32Height, time_str);
		sub_output_fp = fopen(name, "wb");
		if (sub_output_fp == RK_NULL)
			RK_LOGE("Can't open file %s!\n", name);
	}

	// befor enter AOV
	for (int i = 0; i < g_cmd_args->u32BootFrame; i++) {
		SAMPLE_COMM_VI_GetChnFrame(main_ctx, &main_output_ptr);
		SAMPLE_COMM_VI_GetChnFrame(sub_ctx, &sub_output_ptr);
		main_size = main_ctx->stViFrame.stVFrame.u32VirWidth *
		            main_ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
		if (main_output_fp) {
			fwrite(main_output_ptr, 1, main_size, main_output_fp);
			fflush(main_output_fp);
			RK_LOGD("main sensor write frame %d to sdcard", loopCount);
		}
		RK_LOGI("get frame DevId %d seq:%d pts:%lld ms\n", main_ctx->s32DevId,
		        main_ctx->stViFrame.stVFrame.u32TimeRef,
		        main_ctx->stViFrame.stVFrame.u64PTS / 1000);

		sub_size = sub_ctx->stViFrame.stVFrame.u32VirWidth *
		           sub_ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
		if (sub_output_fp) {
			fwrite(sub_output_ptr, 1, sub_size, sub_output_fp);
			fflush(sub_output_fp);
		}
		RK_LOGI("get frame DevId %d seq:%d pts:%lld ms\n", sub_ctx->s32DevId,
		        sub_ctx->stViFrame.stVFrame.u32TimeRef,
		        sub_ctx->stViFrame.stVFrame.u64PTS / 1000);

		SAMPLE_COMM_VI_ReleaseChnFrame(main_ctx);
		SAMPLE_COMM_VI_ReleaseChnFrame(sub_ctx);
		loopCount++;
	}

	while (!g_thread_status->bIfViThreadQuit) {
		SAMPLE_COMM_VI_GetChnFrame(main_ctx, &main_output_ptr);
		SAMPLE_COMM_VI_GetChnFrame(sub_ctx, &sub_output_ptr);
		main_size = main_ctx->stViFrame.stVFrame.u32VirWidth *
		            main_ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
		sub_size = sub_ctx->stViFrame.stVFrame.u32VirWidth *
		           sub_ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
		if (main_output_fp) {
			fwrite(main_output_ptr, 1, main_size, main_output_fp);
			fflush(main_output_fp);
		}
		RK_LOGI("get frame DevId %d seq:%d pts:%lld ms\n", main_ctx->s32DevId,
		        main_ctx->stViFrame.stVFrame.u32TimeRef,
		        main_ctx->stViFrame.stVFrame.u64PTS / 1000);

		if (sub_output_fp) {
			fwrite(sub_output_ptr, 1, sub_size, sub_output_fp);
			fflush(sub_output_fp);
		}
		RK_LOGI("get frame DevId %d seq:%d pts:%lld ms\n", sub_ctx->s32DevId,
		        sub_ctx->stViFrame.stVFrame.u32TimeRef,
		        sub_ctx->stViFrame.stVFrame.u64PTS / 1000);

		SAMPLE_COMM_VI_ReleaseChnFrame(main_ctx);
		SAMPLE_COMM_VI_ReleaseChnFrame(sub_ctx);

#if defined(RV1106) || defined(RV1106B)
		if (g_cmd_args->bEnableDummyFrame && eCurISPMode == SINGLE_FRAME_MODE) {
			for (int i = 0; i != g_cmd_args->u32DummyFrameCnt; ++i) {
				RK_MPI_VI_DevEnableSinglelFrame(MAIN_CAM_INDEX, 1);
				RK_MPI_VI_DevEnableSinglelFrame(SUB_CAM_INDEX, 1);
				s32Ret = RK_MPI_VI_GetChnFrame(main_ctx->u32PipeId, main_ctx->s32ChnId,
				                               &main_ctx->stViFrame, 1000);
				if (s32Ret == RK_SUCCESS) {
					RK_LOGI("get dummy frame DevId %d seq:%d pts:%lld ms\n",
					        main_ctx->s32DevId, main_ctx->stViFrame.stVFrame.u32TimeRef,
					        main_ctx->stViFrame.stVFrame.u64PTS / 1000);
					RK_MPI_VI_ReleaseChnFrame(main_ctx->u32PipeId, main_ctx->s32ChnId,
					                          &main_ctx->stViFrame);
				} else {
					RK_LOGE("RK_MPI_VI_GetChnFrame failed %#X", s32Ret);
					program_handle_error(__FUNCTION__, __LINE__);
					break;
				}
				s32Ret = RK_MPI_VI_GetChnFrame(sub_ctx->u32PipeId, sub_ctx->s32ChnId,
				                               &sub_ctx->stViFrame, 1000);
				if (s32Ret == RK_SUCCESS) {
					RK_LOGI("get dummy frame DevId %d seq:%d pts:%lld ms\n",
					        sub_ctx->s32DevId, sub_ctx->stViFrame.stVFrame.u32TimeRef,
					        sub_ctx->stViFrame.stVFrame.u64PTS / 1000);
					RK_MPI_VI_ReleaseChnFrame(sub_ctx->u32PipeId, sub_ctx->s32ChnId,
					                          &sub_ctx->stViFrame);
				} else {
					RK_LOGE("RK_MPI_VI_GetChnFrame failed %#X", s32Ret);
					program_handle_error(__FUNCTION__, __LINE__);
					break;
				}
			}
		}
#endif

		switch (eCurISPMode) {
		case MULTI_FRAME_MODE:
			if (wakeup_frame_count > 0) {
				--wakeup_frame_count;
				break;
			}
			RK_LOGI("#Pause isp, Enter single frame\n");
			if (g_cmd_args->bEnableChangeResolution) {
				s32Ret =
				    change_sensor_resolution(BINNING_WIDTH, BINNING_HEIGHT, BINNING_FPS);
				if (s32Ret != RK_SUCCESS) {
					RK_LOGE("change sensor resolution to binning size failure!");
					program_handle_error(__FUNCTION__, __LINE__);
					goto __exit_loop;
				}
			}
			SAMPLE_COMM_ISP_SingleFrame(MAIN_CAM_INDEX);
			SAMPLE_COMM_ISP_SingleFrame(SUB_CAM_INDEX);
			// drop frame before switch ISP mode.
			while (RK_MPI_VI_GetChnFrame(main_ctx->s32DevId, main_ctx->s32ChnId,
			                             &tmp_frame, 1000) == RK_SUCCESS) {
				RK_MPI_VI_ReleaseChnFrame(main_ctx->s32DevId, main_ctx->s32ChnId,
				                          &tmp_frame);
				RK_LOGI("enter single ISP mode, main sensor drop frame");
			}
			while (RK_MPI_VI_GetChnFrame(sub_ctx->s32DevId, sub_ctx->s32ChnId, &tmp_frame,
			                             1000) == RK_SUCCESS) {
				RK_MPI_VI_ReleaseChnFrame(sub_ctx->s32DevId, sub_ctx->s32ChnId,
				                          &tmp_frame);
				RK_LOGI("enter single ISP mode, sub sensor drop frame");
			}
			eCurISPMode = SINGLE_FRAME_MODE;
			aov_frame_count = 10;
			break;
		case SINGLE_FRAME_MODE:
			if (!enable_multi_mode)
				break;
			if (aov_frame_count > 0) {
				--aov_frame_count;
				break;
			}
			RK_LOGI("#Resume isp, Enter multi frame\n");
			SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
			SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
			if (g_cmd_args->bEnableChangeResolution) {
				s32Ret = change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT,
				                                  FULLSIZE_FPS);
				if (s32Ret != RK_SUCCESS) {
					RK_LOGE("change sensor resolution to full size failure!");
					program_handle_error(__FUNCTION__, __LINE__);
					goto __exit_loop;
				}
				SAMPLE_COMM_ISP_SetFrameRate(MAIN_CAM_INDEX, g_cmd_args->u32Fps);
				SAMPLE_COMM_ISP_SetFrameRate(SUB_CAM_INDEX, g_cmd_args->u32Fps);
			}
			eCurISPMode = MULTI_FRAME_MODE;
			wakeup_frame_count = 30;
			break;
		}

		if (g_cmd_args->s32AovLoopCount != 0 && eCurISPMode == SINGLE_FRAME_MODE) {
			if (g_cmd_args->s32AovLoopCount > 0)
				--g_cmd_args->s32AovLoopCount;
			SAMPLE_COMM_AOV_EnterSleep();
		} else if (g_cmd_args->s32AovLoopCount == 0) {
			RK_LOGI("Exit AOV!");
			program_normal_exit(__func__, __LINE__);
			break;
		}
		loopCount++;
	}

__exit_loop:
	if (eCurISPMode == SINGLE_FRAME_MODE) {
		SAMPLE_COMM_ISP_MultiFrame(MAIN_CAM_INDEX);
		SAMPLE_COMM_ISP_MultiFrame(SUB_CAM_INDEX);
		if (g_cmd_args->bEnableChangeResolution)
			change_sensor_resolution(FULLSIZE_WIDTH, FULLSIZE_HEIGHT, FULLSIZE_FPS);
		eCurISPMode = MULTI_FRAME_MODE;
	}

	if (main_output_fp) {
		fflush(main_output_fp);
		fclose(main_output_fp);
	}
	if (sub_output_fp) {
		fflush(sub_output_fp);
		fclose(sub_output_fp);
	}
	TRACE_END();

	return RK_NULL;
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

static RK_S32 isp_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	if (g_cmd_args->pIqFileDir) {

		s32Ret = SAMPLE_COMM_ISP_Init(MAIN_CAM_INDEX, g_cmd_args->eHdrMode,
		                              g_cmd_args->bMultictx, g_cmd_args->pIqFileDir);
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
#if defined(RV1106B)
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
#endif
	TRACE_END();
	return ret;
}

static RK_S32 vi_chn_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
#if defined(RV1106B)
	s32Ret = vi_dev_init(pArgs);
	if (s32Ret != RK_SUCCESS)
		return s32Ret;
#endif
	/* Init VI[0] */
	ctx->vi[0].bIfQuickStart = true;
	ctx->vi[0].u32Width = pArgs->u32Main0Width;
	ctx->vi[0].u32Height = pArgs->u32Main0Height;
	ctx->vi[0].s32DevId = MAIN_CAM_INDEX;
	ctx->vi[0].u32PipeId = MAIN_CAM_INDEX;
	ctx->vi[0].s32ChnId = 0;
	ctx->vi[0].dstFilePath = pArgs->pOutPath;
	ctx->vi[0].stChnAttr.u32Depth = 1;
	ctx->vi[0].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32Main0Width;
	ctx->vi[0].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32Main0Height;
	ctx->vi[0].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[0].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[0].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[0].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[0].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[0].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[0]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 0 failure:%d", s32Ret);
	/* Init VI[1] */
	ctx->vi[1].bIfQuickStart = true;
	ctx->vi[1].u32Width = pArgs->u32Main1Width;
	ctx->vi[1].u32Height = pArgs->u32Main1Height;
	ctx->vi[1].s32DevId = SUB_CAM_INDEX;
	ctx->vi[1].u32PipeId = SUB_CAM_INDEX;
	ctx->vi[1].s32ChnId = 0;
	ctx->vi[1].dstFilePath = pArgs->pOutPath;
	ctx->vi[1].stChnAttr.u32Depth = 1;
	ctx->vi[1].stChnAttr.stIspOpt.stMaxSize.u32Width = pArgs->u32Main1Width;
	ctx->vi[1].stChnAttr.stIspOpt.stMaxSize.u32Height = pArgs->u32Main1Height;
	ctx->vi[1].stChnAttr.stIspOpt.u32BufCount = pArgs->u32ViBuffCnt;
	ctx->vi[1].stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi[1].stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi[1].stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi[1].stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi[1].stChnAttr.stFrameRate.s32DstFrameRate = -1;
	s32Ret = SAMPLE_COMM_VI_CreateChn(&(ctx->vi[1]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_CreateChn 1 failure:%d", s32Ret);

	TRACE_END();
	return s32Ret;
}

static RK_S32 vi_chn_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	RK_S32 s32Ret = RK_SUCCESS;
	TRACE_BEGIN();
	s32Ret = SAMPLE_COMM_VI_DestroyChn(&(ctx->vi[1]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_DestroyChn failure:%d", s32Ret);
	s32Ret = SAMPLE_COMM_VI_DestroyChn(&(ctx->vi[0]));
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("SAMPLE_COMM_VI_DestroyChn failure:%d", s32Ret);
	TRACE_END();
	return s32Ret;
}

static RK_S32 sub_threads_init(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	TRACE_BEGIN();
	pthread_create(&g_thread_status->s32ViThreadId, NULL, vi_get_stream_multi_mode, NULL);
	TRACE_END();
	return RK_SUCCESS;
}

static RK_S32 sub_threads_deinit(SAMPLE_MPI_CTX_S *ctx, RkCmdArgs *pArgs) {
	TRACE_BEGIN();
	g_thread_status->bIfViThreadQuit = RK_TRUE;
	pthread_join(g_thread_status->s32ViThreadId, NULL);
	TRACE_END();
	return RK_SUCCESS;
}
static RK_CHAR optstr[] = "?::a::w:h:o:l:b:f:r:g:v:e:i:s:I:";

static const struct option long_options[] = {
    {"aiq", optional_argument, RK_NULL, 'a'},
    {"width", required_argument, RK_NULL, 'w'},
    {"height", required_argument, RK_NULL, 'h'},
    {"output_path", required_argument, RK_NULL, 'o'},
    {"fps", required_argument, RK_NULL, 'f'},
    {"vi_buff_cnt", required_argument, RK_NULL, 'v'},
    {"cif_buff_cnt", required_argument, RK_NULL, 'c' + 'b'},
    {"sensor", required_argument, RK_NULL, 's'},
    {"enable_save_sdcard", required_argument, RK_NULL, 'e' + 'm' + 'h'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"vi_frame_mode", required_argument, NULL, 'v' + 'f' + 'm'},
    {"help", optional_argument, RK_NULL, '?'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"enable_dummy_frame", required_argument, NULL, 'e' + 'd' + 'f'},
    {"dummy_frame_cnt", required_argument, NULL, 'd' + 'f' + 'c'},
    {"isp_mode", required_argument, RK_NULL, 'i' + 's' + 'm' + 'd'},
    {"enable_change_resolution", required_argument, NULL, 'e' + 'c' + 'r' + 'e'},
    {"enable_scale", required_argument, NULL, 'e' + 's' + 'l'},
    {RK_NULL, 0, RK_NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("\t%s -s 0 -w 2048 -h 1536 -s 1 -w 1920 -h 1080 "
	       "--aov_loop_count 10\n",
	       name);
	printf("\t-a | --aiq : enable aiq with dirpath provided, eg:-a "
	       "/etc/iqfiles/, \n"
	       "\t		set dirpath empty to using path by default, without "
	       "this option aiq \n"
	       "\t		should run in other application\n");
	printf("\t-s | --sensor : 0 means main camera, 1 means sub camera\n");
	printf("\t-w | --width : mainStream width, must is sensor width\n");
	printf("\t-h | --height : mainStream height, must is sensor height\n");
	printf("\t-o | --output_path : encode output file path, Default: "
	       "/mnt/sdcard\n");
	printf("\t-v | --vi_buff_cnt : main stream vi buffer num, Default: 2\n");
	printf("\t--cif_buff_cnt : rkcif buffer count, default: 2\n");
	printf("\t-f | --fps : set fps, default: 10\n");
	printf("\t--aov_loop_count: When the value of aov_loop_count is greater \n"
	       "\t\t than 0, "
	       "this value represents the number of AOV cycles. A \n"
	       "\t\t negative value indicates an infinite loop, Default: "
	       "-1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--vi_frame_mode: set vi frame mode, 0: single mode 1: multi -> "
	       "single -> "
	       "multi, Default: 0\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot"
	       ", Default: 60 frames\n");
	printf("\t--enable_dummy_frame: Enable fetch dummy frame in single frame mode"
	       ", Default: 0\n");
	printf("\t--dummy_frame_cnt: Dummy frame count in single frame mode"
	       ", Default: 3\n");
	printf("\t--isp_mode : isp mode, 0: offline, 1: half-online, 2: full-online. "
	       "default: 0\n");
	printf("\t--enable_change_resolution: enable change to small resolution in single "
	       "frame mode, Default: 0\n");
	printf("\t--enable_scale: enable scale binning input by isp, Default: 0\n");
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
	pArgs->pOutPath = NULL;
	pArgs->pIqFileDir = "/etc/iqfiles";
	pArgs->bMultictx = RK_TRUE;
	pArgs->eHdrMode = RK_AIQ_WORKING_MODE_NORMAL;
	pArgs->s32AeMode = 0;
	pArgs->s32AovLoopCount = -1;
	pArgs->s32SuspendTime = 1000;
	pArgs->bEnableSaveToSdcard = RK_TRUE;
	pArgs->s32ViFrameMode = 0;
	pArgs->u32BootFrame = 60;
	pArgs->bEnableDummyFrame = RK_TRUE;
	pArgs->u32DummyFrameCnt = 3;
	pArgs->u32Fps = 25;
	pArgs->u32IspMode = 0;
	pArgs->bEnableChangeResolution = RK_FALSE;
	pArgs->bEnableScale = RK_FALSE;
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
		case 'o':
			pArgs->pOutPath = optarg;
			break;
		case 'v':
			pArgs->u32ViBuffCnt = atoi(optarg);
			break;
		case 'f':
			pArgs->u32Fps = atoi(optarg);
			break;
		case 'c' + 'b':
			pArgs->u32CifBuffCnt = atoi(optarg);
			break;
		case 'v' + 'f' + 'm':
			pArgs->s32ViFrameMode = atoi(optarg);
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
		case 'e' + 'd' + 'f':
			pArgs->bEnableDummyFrame = atoi(optarg) ? RK_TRUE : RK_FALSE;
			break;
		case 'd' + 'f' + 'c':
			pArgs->u32DummyFrameCnt = atoi(optarg);
			break;
		case 'i' + 's' + 'm' + 'd':
			pArgs->u32IspMode = atoi(optarg);
			break;
		case 'e' + 'c' + 'r' + 'e':
			pArgs->bEnableChangeResolution = (atoi(optarg) != 0);
			break;
		case 'e' + 's' + 'l':
			pArgs->bEnableScale = (atoi(optarg) != 0);
			break;
		case '?':
			print_usage(argv[0]);
		default:
			return RK_FAILURE;
		}
	}
	if (pArgs->bEnableChangeResolution) {
		if (pArgs->pOutPath)
			pArgs->bEnableScale = RK_TRUE;
		if (pArgs->bEnableScale) {
			printf("just enable scale in readback mode!\n");
			pArgs->u32IspMode = 0;
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
		print_usage(argv[0]);
		printf("bad arguments!\n");
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

	SAMPLE_COMM_AOV_Init();

	printf("#CodecName:%s\n", g_cmd_args->pCodecName);
	printf("#Output Path: %s\n", g_cmd_args->pOutPath);
	printf("#bMultictx: %d\n\n", g_cmd_args->bMultictx);

	if (isp_init(g_mpi_ctx, g_cmd_args) != RK_SUCCESS) {
		printf("isp_init failure!\n");
		g_exit_result = RK_FAILURE;
		goto __ISP_INIT_FAILED;
	}

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		printf("RK_MPI_SYS_Init failure");
		g_exit_result = RK_FAILURE;
		goto __MPI_INIT_FAILED;
	}

	vi_chn_init(g_mpi_ctx, g_cmd_args);
	sub_threads_init(g_mpi_ctx, g_cmd_args);

	SAMPLE_COMM_AOV_SetPeriodTime(g_cmd_args->s32SuspendTime);

	// Keep running ...
	while (!g_thread_status->bIfMainThreadQuit) {
		sleep(1);
	}

	sub_threads_deinit(g_mpi_ctx, g_cmd_args);
	vi_chn_deinit(g_mpi_ctx, g_cmd_args);

	RK_MPI_SYS_Exit();

__MPI_INIT_FAILED:
	isp_deinit(g_mpi_ctx, g_cmd_args);
	SAMPLE_COMM_AOV_Deinit();
__ISP_INIT_FAILED:
	global_param_deinit();

	return g_exit_result;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
