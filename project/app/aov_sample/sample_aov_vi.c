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
#include <sys/mount.h>
#include <time.h>
#include <unistd.h>

#include "sample_comm.h"
#include "sample_comm_aov.h"

#define VI_MAIN_CHANNEL 0

typedef struct _rkMpiCtx {
	SAMPLE_VI_CTX_S vi;
} SAMPLE_MPI_CTX_S;

typedef struct _rkCmdArgs {
	RK_U32 u32Width;
	RK_U32 u32Height;
	RK_U32 u32BinWidth;
	RK_U32 u32BinHeight;
	RK_U32 u32BinFps;
	RK_U32 u32Fps;
	RK_U32 u32CamId;
	RK_U32 u32ViBuffCnt;
	RK_S32 s32AovLoopCount;
	RK_U32 u32BootFrame;
	RK_U32 u32SuspendTime;
	RK_U32 u32DummyFrameCnt;
	RK_S32 s32ViFrameMode;
	RK_S32 s32ChnId;
	RK_BOOL bEnableRdbk;
	RK_BOOL bEnableEmmc;
	RK_BOOL bEnableDummyFrame;
	RK_BOOL bEnableChangeResolution;
	RK_BOOL bEnableScale;
	RK_CHAR *pOutPath;
	RK_CHAR *pIqFileDir;
} RkCmdArgs;

enum ISP_MODE {
	SINGLE_FRAME_MODE,
	MULTI_FRAME_MODE,
};

static RkCmdArgs *g_cmd_args = NULL;
static bool quit = false;
static RK_S32 g_exit_result = RK_SUCCESS;

static void program_handle_error(const char *func, RK_U32 line) {
	RK_LOGE("func: <%s> line: <%d> error exit!", func, line);
	g_exit_result = RK_FAILURE;
	quit = RK_TRUE;
}

static void program_normal_exit(const char *func, RK_U32 line) {
	RK_LOGE("func: <%s> line: <%d> normal exit!", func, line);
	g_exit_result = RK_SUCCESS;
	quit = RK_TRUE;
}

static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

static RK_CHAR optstr[] = "?::a::d:c:f:w:h:o:I:l:m:";
static const struct option long_options[] = {
    {"aiq", optional_argument, NULL, 'a'},
    {"device_name", required_argument, NULL, 'd'},
    {"chn_id", required_argument, NULL, 'c'},
    {"fps", optional_argument, NULL, 'f'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'h'},
    {"output_path", required_argument, NULL, 'o'},
    {"camid", required_argument, NULL, 'I'},
    {"enable_rdbk", required_argument, NULL, 'e' + 'r'},
    {"vi_frame_mode", required_argument, NULL, 'v' + 'f' + 'm'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"enable_dummy_frame", required_argument, NULL, 'e' + 'd' + 'f'},
    {"dummy_frame_cnt", required_argument, NULL, 'd' + 'f' + 'c'},
    {"enable_emmc", required_argument, NULL, 'e' + 'm' + 'c'},
    {"bin_width", required_argument, NULL, 'b' + 'w'},
    {"bin_height", required_argument, NULL, 'b' + 'h'},
    {"bin_fps", required_argument, NULL, 'b' + 'f' + 's'},
    {"enable_change_resolution", required_argument, NULL, 'e' + 'c' + 'r'},
    {"enable_scale", required_argument, NULL, 'e' + 's' + 'l'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -w 1920 -h 1080 -a /etc/iqfiles/ --aov_loop_count 10 "
	       "-o /data/\n",
	       name);
#ifdef RKAIQ
	printf("\t-a | --aiq: enable aiq with dirpath provided, eg:-a /etc/iqfiles/, "
	       "set dirpath empty to using path by default, without this option aiq "
	       "should run in other application\n");
#endif
	printf("\t-d | --device_name: set pcDeviceName, eg: /dev/video0 Default "
	       "NULL\n");
	printf("\t-c | --chn_id: channel id, default: 1\n");
	printf("\t-f | --fps: camera framerate, Default 30");
	printf("\t-w | --width: camera with, Default 1920\n");
	printf("\t-h | --height: camera height, Default 1080\n");
	printf("\t-o | --output_path: vi output file path, Default NULL\n");
	printf("\t-I | --camid: camera ctx id, Default 0\n");
	printf("\t--enable_rdbk: force to use isp rdbk mode, Default: 0."
	       "If isp scale is configured, force isp running in rdbk mode.\n");
	printf("\t--vi_frame_mode: set vi frame mode, 0: single mode 1: multi -> single -> "
	       "multi, Default: 0\n");
	printf("\t--aov_loop_count: set aov wakeup loop count, Default: -1(unlimit)\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot, Default: "
	       "60 frames\n");
	printf("\t--enable_dummy_frame: Enable fetch dummy frame in single frame mode"
	       ", Default: 0\n");
	printf("\t--dummy_frame_cnt: Dummy frame count in single frame mode"
	       ", Default: 3\n");
	printf("\t--enable_emmc: Enable emmc\n");
	printf("\t--bin_width: sensor binning width, Default 960\n");
	printf("\t--bin_height: sensor binning height, Default 540\n");
	printf("\t--bin_fps: sensor binning fps, Default 120\n");
	printf("\t--enable_change_resolution: enable change to small resolution in single "
	       "frame mode, Default: 0\n");
	printf("\t--enable_scale: enable scale binning input by isp, Default: 0\n");
}

static RK_S32 change_sensor_resolution(SAMPLE_VI_CTX_S *ctx, int width, int height,
                                       int fps) {
	RK_S32 s32Ret = RK_FAILURE;
	// 1. stop isp stream
	struct timespec t1, t2, t3, t4;
	clock_gettime(CLOCK_MONOTONIC, &t1);
	VI_CHN_ATTR_S vi_chn_attr;
	VI_SENSOR_SETTING_S sensor_setting;

#if defined(RV1106) || defined(RV1106B)
	s32Ret = RK_MPI_VI_GetChnAttr(ctx->s32DevId, ctx->s32ChnId, &vi_chn_attr);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_GetChnAttr failure:%X", s32Ret);
		return s32Ret;
	}

	RK_MPI_VI_PauseChn(ctx->s32DevId, ctx->s32ChnId);

	// 2. switch sensor resolution
	memset(&sensor_setting, 0, sizeof(sensor_setting));
	sensor_setting.u32SensorWidth = width;
	sensor_setting.u32SensorHeight = height;
	sensor_setting.u32SensorFps = fps;
	sensor_setting.enSensorFmt = RK_FMT_RGB_BAYER_SBGGR_10BPP;
	sensor_setting.enSensorMode = SENSOR_NO_HDR;
	s32Ret = RK_MPI_VI_DevSelectSetting(ctx->s32DevId, &sensor_setting);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_DevSelectSetting failed, width = %d, height = %d, fps = %d\n",
		        width, height, fps);
		return s32Ret;
	}

	if (!g_cmd_args->bEnableScale) {
		vi_chn_attr.stSize.u32Width = width;
		vi_chn_attr.stSize.u32Height = height;
		s32Ret = RK_MPI_VI_SetChnAttr(ctx->s32DevId, ctx->s32ChnId, &vi_chn_attr);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetChnAttr failure:%X", s32Ret);
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
	s32Ret = RK_MPI_VI_ResumeChn(ctx->s32DevId, ctx->s32ChnId);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("RK_MPI_VI_ResumeChn failed %#X", s32Ret);
		return s32Ret;
	}

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

static void enter_single_frame_mode(SAMPLE_VI_CTX_S *ctx) {
	RK_S32 ret = RK_SUCCESS;
	if (g_cmd_args->bEnableChangeResolution)
		change_sensor_resolution(ctx, g_cmd_args->u32BinWidth, g_cmd_args->u32BinHeight,
		                         g_cmd_args->u32BinFps);
	if (g_cmd_args->bEnableEmmc) {
		// 0. sync filesystem
		sync();
		// 1. umount filesystem
		ret = umount2("/userdata", MNT_DETACH);
		if (ret != RK_SUCCESS)
			RK_LOGE("unmount /userdata failed %s", strerror(errno));
		// 2. unbind emmc device
		ret = SAMPLE_COMM_AOV_UnbindEmmc();
		if (ret != RK_SUCCESS)
			RK_LOGE("unbind emmc failed %s", strerror(errno));
	}
	// 3. enter single frame mode
	// When booting, the default is multi-frame mode, so you need to pause the
	// stream and pick up the remaining frames
	SAMPLE_COMM_ISP_SingleFrame(g_cmd_args->u32CamId);
	SAMPLE_COMM_AOV_DisableNonBootCPUs();
}

static void enter_multi_frame_mode(SAMPLE_VI_CTX_S *ctx) {
	RK_S32 ret = RK_SUCCESS;
	// 1. enter multi frame mode
	SAMPLE_COMM_ISP_MultiFrame(g_cmd_args->u32CamId);
	SAMPLE_COMM_AOV_EnableNonBootCPUs();
	if (g_cmd_args->bEnableEmmc) {
		// 2. bind emmc device
		ret = SAMPLE_COMM_AOV_BindEmmc();
		if (ret != RK_SUCCESS)
			RK_LOGE("bind emmc failed %s", strerror(errno));
		// 3. mount filesystem
		ret = mount("/dev/mmcblk0p5", "/userdata", "ext4", 0, NULL);
		if (ret != RK_SUCCESS)
			RK_LOGE("mount /userdata failed %s", strerror(errno));
	}
	if (g_cmd_args->bEnableChangeResolution)
		change_sensor_resolution(ctx, g_cmd_args->u32Width, g_cmd_args->u32Height,
		                         g_cmd_args->u32Fps);
}

/******************************************************************************
 * function : vi thread
 ******************************************************************************/
static void *vi_get_multi_stream(void *pArgs) {
	SAMPLE_VI_CTX_S *ctx = (SAMPLE_VI_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	FILE *normal_fp = NULL, *binning_fp = RK_NULL;
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_S32 waitTime = -1;
	RK_S32 wakeup_frame_count = 0;
	enum ISP_MODE wakeup_current_mode = MULTI_FRAME_MODE;
	RK_U32 size = 0;
	VIDEO_FRAME_INFO_S stViFrame_tmp;

	if (ctx->dstFilePath) {
		snprintf(name, sizeof(name), "/%s/normal_cam%d_%dx%d.yuv420", ctx->dstFilePath,
		         ctx->s32DevId, ctx->u32Width, ctx->u32Height);
		normal_fp = fopen(name, "wb");
		if (normal_fp == RK_NULL) {
			printf("chn %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
			quit = true;
			return RK_NULL;
		}
		if (g_cmd_args->bEnableChangeResolution && !g_cmd_args->bEnableScale) {
			snprintf(name, sizeof(name), "/%s/binning_cam%d_%dx%d.yuv420",
			         ctx->dstFilePath, ctx->s32DevId, g_cmd_args->u32BinWidth,
			         g_cmd_args->u32BinHeight);
			binning_fp = fopen(name, "wb");
			if (binning_fp == RK_NULL) {
				printf("chn %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
				quit = true;
				return RK_NULL;
			}
		}
	}

	// befor enter AOV
	for (int i = 0; i < g_cmd_args->u32BootFrame; i++) {
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {

			size = ctx->stViFrame.stVFrame.u32VirWidth *
			       ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
			if (normal_fp) {
				fwrite(pData, 1, size, normal_fp);
				fflush(normal_fp);
			}
			RK_LOGI(
			    "SAMPLE_COMM_VI_GetChnFrame DevId %d ok:data %p size:%u loop:%d seq:%d "
			    "pts:%lld ms\n",
			    ctx->s32DevId, pData, size, loopCount, ctx->stViFrame.stVFrame.u32TimeRef,
			    ctx->stViFrame.stVFrame.u64PTS / 1000);
			SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
			loopCount++;
		}
	}

	while (!quit) {
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			size = ctx->stViFrame.stVFrame.u32VirWidth *
			       ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
			if (normal_fp && ctx->stViFrame.stVFrame.u32Width == g_cmd_args->u32Width) {
				fwrite(pData, 1, size, normal_fp);
				fflush(normal_fp);
			} else if (binning_fp) {
				fwrite(pData, 1, size, binning_fp);
				fflush(binning_fp);
			}

			RK_LOGI(
			    "SAMPLE_COMM_VI_GetChnFrame DevId %d ok:data %p size:%u loop:%d seq:%d "
			    "pts:%lld ms\n",
			    ctx->s32DevId, pData, size, loopCount, ctx->stViFrame.stVFrame.u32TimeRef,
			    ctx->stViFrame.stVFrame.u64PTS / 1000);
			SAMPLE_COMM_VI_ReleaseChnFrame(ctx);

#if defined(RV1106) || defined(RV1106B)
			if (g_cmd_args->bEnableDummyFrame &&
			    wakeup_current_mode == SINGLE_FRAME_MODE) {
				for (int i = 0; i != g_cmd_args->u32DummyFrameCnt; ++i) {
					RK_MPI_VI_DevEnableSinglelFrame(ctx->s32DevId, 1);
					s32Ret = RK_MPI_VI_GetChnFrame(ctx->u32PipeId, ctx->s32ChnId,
					                               &ctx->stViFrame, 1000);
					if (s32Ret == RK_SUCCESS) {
						RK_LOGI("get dummy frame DevId %d seq:%d pts:%lld ms\n",
						        ctx->s32DevId, ctx->stViFrame.stVFrame.u32TimeRef,
						        ctx->stViFrame.stVFrame.u64PTS / 1000);
						RK_MPI_VI_ReleaseChnFrame(ctx->u32PipeId, ctx->s32ChnId,
						                          &ctx->stViFrame);
					} else {
						RK_LOGE("RK_MPI_VI_GetChnFrame failed %#X", s32Ret);
						program_handle_error(__FUNCTION__, __LINE__);
						break;
					}
				}
			}
#endif

			switch (wakeup_current_mode) {
			case MULTI_FRAME_MODE:
				if (wakeup_frame_count > 0) {
					--wakeup_frame_count;
					break;
				}
				RK_LOGI("#Pause isp, Enter single frame\n");
				enter_single_frame_mode(ctx);
				// drop frame
				while (RK_MPI_VI_GetChnFrame(ctx->s32DevId, ctx->s32ChnId, &stViFrame_tmp,
				                             1000) == RK_SUCCESS) {
					RK_MPI_VI_ReleaseChnFrame(ctx->s32DevId, ctx->s32ChnId,
					                          &stViFrame_tmp);
				}
				wakeup_current_mode = SINGLE_FRAME_MODE;
				break;
			case SINGLE_FRAME_MODE:
				if (loopCount % 5)
					break;
				RK_LOGI("#Resume isp, Enter multi frame\n");
				enter_multi_frame_mode(ctx);
				wakeup_current_mode = MULTI_FRAME_MODE;
				wakeup_frame_count = 60;
			}

			if (g_cmd_args->s32AovLoopCount != 0 &&
			    wakeup_current_mode == SINGLE_FRAME_MODE) {
				if (g_cmd_args->s32AovLoopCount > 0)
					--g_cmd_args->s32AovLoopCount;
				SAMPLE_COMM_AOV_EnterSleep();
			} else if (g_cmd_args->s32AovLoopCount == 0) {
				quit = true;
				RK_LOGI("Exit AOV!");
				break;
			}
			loopCount++;
		}
	}

	if (wakeup_current_mode == SINGLE_FRAME_MODE)
		enter_multi_frame_mode(ctx);

	if (normal_fp) {
		fflush(normal_fp);
		fclose(normal_fp);
	}
	if (binning_fp) {
		fflush(binning_fp);
		fclose(binning_fp);
	}

	return RK_NULL;
}

/******************************************************************************
 * function : vi thread
 ******************************************************************************/
static void *vi_get_stream(void *pArgs) {
	SAMPLE_VI_CTX_S *ctx = (SAMPLE_VI_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	FILE *normal_fp = RK_NULL, *binning_fp = RK_NULL;
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;
	RK_S32 waitTime = -1;
	RK_U32 size = 0;

	if (ctx->dstFilePath) {
		snprintf(name, sizeof(name), "/%s/normal_cam%d_%dx%d.yuv420", ctx->dstFilePath,
		         ctx->s32DevId, ctx->u32Width, ctx->u32Height);
		normal_fp = fopen(name, "wb");
		if (normal_fp == RK_NULL) {
			printf("chn %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
			quit = true;
			return RK_NULL;
		}
		if (g_cmd_args->bEnableChangeResolution && !g_cmd_args->bEnableScale) {
			snprintf(name, sizeof(name), "/%s/binning_cam%d_%dx%d.yuv420",
			         ctx->dstFilePath, ctx->s32DevId, g_cmd_args->u32BinWidth,
			         g_cmd_args->u32BinHeight);
			binning_fp = fopen(name, "wb");
			if (binning_fp == RK_NULL) {
				printf("chn %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
				quit = true;
				return RK_NULL;
			}
		}
	}

	// befor enter AOV
	for (int i = 0; i < g_cmd_args->u32BootFrame; i++) {
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {

			size = ctx->stViFrame.stVFrame.u32VirWidth *
			       ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
			if (normal_fp) {
				fwrite(pData, 1, size, normal_fp);
				fflush(normal_fp);
			}
			RK_LOGI(
			    "SAMPLE_COMM_VI_GetChnFrame DevId %d ok:data %p size:%u loop:%d seq:%d "
			    "pts:%lld ms\n",
			    ctx->s32DevId, pData, size, loopCount, ctx->stViFrame.stVFrame.u32TimeRef,
			    ctx->stViFrame.stVFrame.u64PTS / 1000);
			SAMPLE_COMM_VI_ReleaseChnFrame(ctx);
			loopCount++;
			SAMPLE_COMM_AOV_DumpPtsToTMP(ctx->stViFrame.stVFrame.u32TimeRef,
			                             ctx->stViFrame.stVFrame.u64PTS,
			                             g_cmd_args->u32BootFrame);
		}
	}

	enter_single_frame_mode(ctx);
	// drop frame
	VIDEO_FRAME_INFO_S stViFrame_tmp;
	while (RK_MPI_VI_GetChnFrame(ctx->s32DevId, ctx->s32ChnId, &stViFrame_tmp, 1000) ==
	       RK_SUCCESS) {
		RK_MPI_VI_ReleaseChnFrame(ctx->s32DevId, ctx->s32ChnId, &stViFrame_tmp);
	}
	SAMPLE_COMM_AOV_EnterSleep();

	while (!quit) {
		s32Ret = SAMPLE_COMM_VI_GetChnFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			size = ctx->stViFrame.stVFrame.u32VirWidth *
			       ctx->stViFrame.stVFrame.u32VirHeight * 3 / 2;
			if (normal_fp && ctx->stViFrame.stVFrame.u32Width == g_cmd_args->u32Width) {
				fwrite(pData, 1, size, normal_fp);
				fflush(normal_fp);
			} else if (binning_fp) {
				fwrite(pData, 1, size, binning_fp);
				fflush(binning_fp);
			}

			RK_LOGI(
			    "SAMPLE_COMM_VI_GetChnFrame DevId %d ok:data %p size:%u loop:%d seq:%d "
			    "pts:%lld ms\n",
			    ctx->s32DevId, pData, size, loopCount, ctx->stViFrame.stVFrame.u32TimeRef,
			    ctx->stViFrame.stVFrame.u64PTS / 1000);
			SAMPLE_COMM_VI_ReleaseChnFrame(ctx);

#if defined(RV1106) || defined(RV1106B)
			if (g_cmd_args->bEnableDummyFrame) {
				for (int i = 0; i != g_cmd_args->u32DummyFrameCnt; ++i) {
					RK_MPI_VI_DevEnableSinglelFrame(ctx->s32DevId, 1);
					s32Ret = RK_MPI_VI_GetChnFrame(ctx->u32PipeId, ctx->s32ChnId,
					                               &ctx->stViFrame, 1000);
					if (s32Ret == RK_SUCCESS) {
						RK_LOGI("get dummy frame DevId %d seq:%d pts:%lld ms\n",
						        ctx->s32DevId, ctx->stViFrame.stVFrame.u32TimeRef,
						        ctx->stViFrame.stVFrame.u64PTS / 1000);
						RK_MPI_VI_ReleaseChnFrame(ctx->u32PipeId, ctx->s32ChnId,
						                          &ctx->stViFrame);
					} else {
						RK_LOGE("RK_MPI_VI_GetChnFrame failed %#X", s32Ret);
						program_handle_error(__FUNCTION__, __LINE__);
						break;
					}
				}
			}
#endif

			if (g_cmd_args->s32AovLoopCount != 0) {
				if (g_cmd_args->s32AovLoopCount > 0)
					--g_cmd_args->s32AovLoopCount;
				SAMPLE_COMM_AOV_EnterSleep();
			} else {
				quit = true;
				RK_LOGI("Exit AOV!");
				break;
			}
			loopCount++;
		} else {
			RK_LOGI("get vi frame failed");
		}
	}

	enter_multi_frame_mode(ctx);
	if (normal_fp) {
		fflush(normal_fp);
		fclose(normal_fp);
	}
	if (binning_fp) {
		fflush(binning_fp);
		fclose(binning_fp);
	}

	return RK_NULL;
}

/******************************************************************************
 * function    : parse_cmd_args()
 * Description : Parse command line arguments.
 ******************************************************************************/
static RK_S32 parse_cmd_args(int argc, char **argv, RkCmdArgs *pArgs) {
	pArgs->u32Width = 1920;
	pArgs->u32Height = 1080;
	pArgs->u32CamId = 0;
	pArgs->pIqFileDir = "/etc/iqfiles";
	pArgs->u32ViBuffCnt = 2;
	pArgs->u32Fps = 30;
	pArgs->u32SuspendTime = 1000;
	pArgs->s32AovLoopCount = -1;
	pArgs->u32BootFrame = 60;
	pArgs->bEnableChangeResolution = RK_FALSE;
	pArgs->bEnableScale = RK_FALSE;
	pArgs->bEnableDummyFrame = RK_TRUE;
	pArgs->u32DummyFrameCnt = 3;
	pArgs->u32BinWidth = 960;
	pArgs->u32BinHeight = 540;
	pArgs->u32BinFps = 120;
	pArgs->s32ViFrameMode = 0;
	pArgs->s32ChnId = VI_MAIN_CHANNEL;
	int c;
	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'a':
			if (!optarg && NULL != argv[optind] && '-' != argv[optind][0]) {
				tmp_optarg = argv[optind++];
			}
			if (tmp_optarg) {
				g_cmd_args->pIqFileDir = (char *)tmp_optarg;
			} else {
				g_cmd_args->pIqFileDir = NULL;
			}
			break;
		case 'c':
			g_cmd_args->s32ChnId = atoi(optarg);
			break;
		case 'w':
			g_cmd_args->u32Width = atoi(optarg);
			break;
		case 'h':
			g_cmd_args->u32Height = atoi(optarg);
			break;
		case 'f':
			g_cmd_args->u32Fps = atoi(optarg);
			break;
		case 'I':
			g_cmd_args->u32CamId = atoi(optarg);
			break;
		case 'e' + 'r':
			g_cmd_args->bEnableRdbk = (atoi(optarg) == 0) ? RK_FALSE : RK_TRUE;
			break;
		case 'o':
			g_cmd_args->pOutPath = optarg;
			break;
		case 'v' + 'f' + 'm':
			g_cmd_args->s32ViFrameMode = atoi(optarg);
			break;
		case 'a' + 'm' + 'c':
			g_cmd_args->s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			g_cmd_args->u32SuspendTime = atoi(optarg);
			break;
		case 'b' + 'f':
			g_cmd_args->u32BootFrame = atoi(optarg);
			break;
		case 'e' + 'd' + 'f':
			g_cmd_args->bEnableDummyFrame = atoi(optarg) ? RK_TRUE : RK_FALSE;
			break;
		case 'd' + 'f' + 'c':
			g_cmd_args->u32DummyFrameCnt = atoi(optarg);
			break;
		case 'e' + 'm' + 'c':
			g_cmd_args->bEnableEmmc = atoi(optarg) ? RK_TRUE : RK_FALSE;
			break;
		case 'e' + 'c' + 'r':
			pArgs->bEnableChangeResolution = (atoi(optarg) != 0);
			break;
		case 'e' + 's' + 'l':
			pArgs->bEnableScale = (atoi(optarg) != 0);
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
	RK_S32 s32Ret;
	pthread_t vi_thread_id;

	if (argc < 2) {
		print_usage(argv[0]);
		return 0;
	}

	ctx = (SAMPLE_MPI_CTX_S *)(malloc(sizeof(SAMPLE_MPI_CTX_S)));
	memset(ctx, 0, sizeof(SAMPLE_MPI_CTX_S));
	g_cmd_args = (RkCmdArgs *)malloc(sizeof(RkCmdArgs));
	memset(g_cmd_args, 0, sizeof(RkCmdArgs));

	if (parse_cmd_args(argc, argv, g_cmd_args) != RK_SUCCESS) {
		printf("parse_cmd_args failure\n");
		return -1;
	}

	signal(SIGINT, sigterm_handler);

	printf("#CameraIdx: %d\n", g_cmd_args->u32CamId);
	printf("#Output Path: %s\n", g_cmd_args->pOutPath);

	SAMPLE_COMM_AOV_Init();
#ifdef RKAIQ

	printf("#Rkaiq XML DirPath: %s\n", g_cmd_args->pIqFileDir);
	printf("#bEnableRdbk: %d\n\n", g_cmd_args->bEnableRdbk);
	SAMPLE_COMM_ISP_Init(g_cmd_args->u32CamId, RK_AIQ_WORKING_MODE_NORMAL,
	                     g_cmd_args->bEnableRdbk, g_cmd_args->pIqFileDir);
	SAMPLE_COMM_ISP_Run(g_cmd_args->u32CamId);
#endif

	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}

	// Init VI
	ctx->vi.u32Width = g_cmd_args->u32Width;
	ctx->vi.u32Height = g_cmd_args->u32Height;
	ctx->vi.s32DevId = g_cmd_args->u32CamId;
	ctx->vi.u32PipeId = ctx->vi.s32DevId;
	ctx->vi.s32ChnId = g_cmd_args->s32ChnId;
	ctx->vi.stChnAttr.stIspOpt.u32BufCount = 2;
	ctx->vi.stChnAttr.stIspOpt.enMemoryType = VI_V4L2_MEMORY_TYPE_DMABUF;
	ctx->vi.stChnAttr.u32Depth = 1;
	ctx->vi.stChnAttr.enPixelFormat = RK_FMT_YUV420SP;
	ctx->vi.stChnAttr.enCompressMode = COMPRESS_MODE_NONE;
	ctx->vi.stChnAttr.stFrameRate.s32SrcFrameRate = -1;
	ctx->vi.stChnAttr.stFrameRate.s32DstFrameRate = -1;
	ctx->vi.dstFilePath = g_cmd_args->pOutPath;
	ctx->vi.bIfQuickStart = RK_TRUE;
	if (g_cmd_args->bEnableRdbk)
		ctx->vi.u32CifBuffCnt = 1;

	SAMPLE_COMM_AOV_SetPeriodTime(g_cmd_args->u32SuspendTime);

#if defined(RV1106B)
	if (g_cmd_args->bEnableRdbk) {
		VI_PARAM_MOD_S vi_mod_param;
		memset(&vi_mod_param, 0, sizeof(vi_mod_param));
		vi_mod_param.enViModType = VI_DEV_PIPE_MODE;
		vi_mod_param.stDevPipeModParam.enDevPipeMode = VI_DEV_PIPE_OFFLINE;
		s32Ret = RK_MPI_VI_SetModParam(&vi_mod_param);
		if (s32Ret != RK_SUCCESS) {
			RK_LOGE("RK_MPI_VI_SetModParam failed %#X", s32Ret);
			return s32Ret;
		}
	}
#endif
	SAMPLE_COMM_VI_CreateChn(&ctx->vi);

	if (!ctx->vi.bIfQuickStart) {
		RK_MPI_VI_StartPipe(ctx->vi.u32PipeId);
	}
	if (g_cmd_args->s32ViFrameMode == 0)
		pthread_create(&vi_thread_id, 0, vi_get_stream, (void *)(&ctx->vi));
	else
		pthread_create(&vi_thread_id, 0, vi_get_multi_stream, (void *)(&ctx->vi));

	printf("%s initial finish\n", __func__);

	while (!quit) {
		sleep(1);
	}

	printf("%s exit!\n", __func__);

	pthread_join(vi_thread_id, NULL);

	// Destroy VI
	SAMPLE_COMM_VI_DestroyChn(&ctx->vi);

__FAILED:
	RK_MPI_SYS_Exit();
#ifdef RKAIQ
	SAMPLE_COMM_ISP_Stop(g_cmd_args->u32CamId);
#endif
	SAMPLE_COMM_AOV_Deinit();
__FAILED2:
	if (ctx) {
		free(ctx);
		ctx = RK_NULL;
	}
	if (g_cmd_args) {
		free(g_cmd_args);
		g_cmd_args = RK_NULL;
	}

	return g_exit_result;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
