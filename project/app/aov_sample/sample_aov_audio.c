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

typedef struct _rkMpiCtx {
	SAMPLE_AI_CTX_S ai;
} SAMPLE_MPI_CTX_S;

static bool quit = false;
static RK_U32 g_u32BootFrame = 40;
static RK_S32 g_s32AovLoopCount = -1;
static RK_S32 g_s32SusLoopCount = 40;

static void sigterm_handler(int sig) {
	fprintf(stderr, "signal %d\n", sig);
	quit = true;
}

static RK_CHAR optstr[] = "?::a::d:c:f:w:h:o:I:l:m:";
static const struct option long_options[] = {
    {"device_name", required_argument, NULL, 'd'},
    {"output_path", required_argument, NULL, 'o'},
    {"aov_loop_count", required_argument, NULL, 'a' + 'm' + 'c'},
    {"suspend_loop_count", required_argument, NULL, 's' + 'l' + 'c'},
    {"suspend_time", required_argument, NULL, 's' + 't'},
    {"boot_frame", required_argument, NULL, 'b' + 'f'},
    {"help", optional_argument, NULL, '?'},
    {NULL, 0, NULL, 0},
};

/******************************************************************************
 * function : show usage
 ******************************************************************************/
static void print_usage(const RK_CHAR *name) {
	printf("usage example:\n");
	printf("\t%s -d hw:0,0 -o tmp\n", name);
	printf("\t-d | --device_name: set pcDeviceName, eg: hw:0,0 Default "
	       "hw:0,0\n");
	printf("\t-o | --output_path: ai output file path, Default NULL\n");
	printf("\t--aov_loop_count: set aov wakeup loop count, Default: -1(unlimit)\n");
	printf("\t--suspend_loop_count: set aov suspend loop count, Default: 40\n");
	printf("\t--suspend_time: set aov suspend time, Default: 1000ms\n");
	printf("\t--boot_frame: How long will it take to enter AOV mode after boot, Default: "
	       "40 frames\n");
}

/******************************************************************************
 * function : ai thread
 ******************************************************************************/
static void *ai_get_stream(void *pArgs) {
	SAMPLE_AI_CTX_S *ctx = (SAMPLE_AI_CTX_S *)(pArgs);
	RK_S32 s32Ret = RK_FAILURE;
	char name[256] = {0};
	FILE *fp = RK_NULL;
	void *pData = RK_NULL;
	RK_S32 loopCount = 0;

	if (ctx->dstFilePath) {
		snprintf(name, sizeof(name), "/%s/ai_%d.pcm", ctx->dstFilePath, ctx->s32DevId);
		fp = fopen(name, "wb");
		if (fp == RK_NULL) {
			printf("dev %d can't open %s file !\n", ctx->s32DevId, ctx->dstFilePath);
			quit = true;
			return RK_NULL;
		}
	}

	// befor enter AOV
	for (int i = 0; i < g_u32BootFrame; i++) {
		s32Ret = SAMPLE_COMM_AI_FdGetFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			if (fp) {
				fwrite(pData, 1, ctx->stFrame.u32Len, fp);
				fflush(fp);
			}

			RK_LOGI("SAMPLE_COMM_AI_FdGetFrame DevId %d ok:data %p size:%u loop:%d "
			        "pts:%lld ms\n",
			        ctx->s32DevId, pData, ctx->stFrame.u32Len, loopCount,
			        ctx->stFrame.u64TimeStamp / 1000);
			SAMPLE_COMM_AI_ReleaseFrame(ctx);
			loopCount++;
		} else {
			RK_LOGI("get ai frame failed");
		}
	}

	while (!quit) {
		s32Ret = SAMPLE_COMM_AI_FdGetFrame(ctx, &pData);
		if (s32Ret == RK_SUCCESS) {
			if (fp) {
				fwrite(pData, 1, ctx->stFrame.u32Len, fp);
				fflush(fp);
			}

			RK_LOGI("SAMPLE_COMM_AI_FdGetFrame DevId %d ok:data %p size:%u loop:%d "
			        "pts:%lld ms\n",
			        ctx->s32DevId, pData, ctx->stFrame.u32Len, loopCount,
			        ctx->stFrame.u64TimeStamp / 1000);
			SAMPLE_COMM_AI_ReleaseFrame(ctx);

			if (g_s32AovLoopCount != 0) {
				g_s32AovLoopCount--;
				if (!(loopCount % g_s32SusLoopCount)) {
					SAMPLE_COMM_AI_DestroyChn(ctx);
					SAMPLE_COMM_AOV_UnbindSoundcard();
					SAMPLE_COMM_AOV_EnterSleep();
					SAMPLE_COMM_AOV_BindSoundcard();
					SAMPLE_COMM_AI_CreateChn(ctx);
				}
			} else {
				quit = true;
				RK_LOGI("Exit AOV!");
				break;
			}

			loopCount++;
		} else {
			RK_LOGI("get ai frame failed");
		}
	}

	if (fp)
		fclose(fp);

	return RK_NULL;
}

/******************************************************************************
 * function    : main()
 * Description : main
 ******************************************************************************/
int main(int argc, char *argv[]) {
	SAMPLE_MPI_CTX_S *ctx;
	RK_CHAR *pOutPath = NULL;
	RK_CHAR *pDeviceName = "hw:0,0";
	RK_S32 s32CamId = 0;
	RK_S32 s32ChnId = 0;
	RK_S32 s32SuspendTime = 1000;
	pthread_t ai_thread_id;

	if (argc < 2) {
		print_usage(argv[0]);
		return 0;
	}

	ctx = (SAMPLE_MPI_CTX_S *)(malloc(sizeof(SAMPLE_MPI_CTX_S)));
	memset(ctx, 0, sizeof(SAMPLE_MPI_CTX_S));
	signal(SIGINT, sigterm_handler);

	int c;
	while ((c = getopt_long(argc, argv, optstr, long_options, NULL)) != -1) {
		const char *tmp_optarg = optarg;
		switch (c) {
		case 'd':
			pDeviceName = optarg;
			break;
		case 'o':
			pOutPath = optarg;
			break;
		case 'a' + 'm' + 'c':
			g_s32AovLoopCount = atoi(optarg);
			break;
		case 's' + 'l' + 'c':
			g_s32SusLoopCount = atoi(optarg);
			break;
		case 's' + 't':
			s32SuspendTime = atoi(optarg);
			break;
		case 'b' + 'f':
			g_u32BootFrame = atoi(optarg);
			break;
		default:
			print_usage(argv[0]);
			return 0;
		}
	}

	printf("#pDeviceName: %s\n", pDeviceName);
	printf("#Output Path: %s\n", pOutPath);
	printf("#g_s32AovLoopCount: %d\n", g_s32AovLoopCount);
	printf("#g_s32SusLoopCount: %d\n", g_s32SusLoopCount);
	printf("#s32SuspendTime: %d\n", s32SuspendTime);
	printf("#g_u32BootFrame: %d\n", g_u32BootFrame);

	SAMPLE_COMM_AOV_Init();
	if (RK_MPI_SYS_Init() != RK_SUCCESS) {
		goto __FAILED;
	}

	ctx->ai.dstFilePath = pOutPath;
	SAMPLE_COMM_AOV_BindSoundcard();
	SAMPLE_COMM_AI_SetAttr(&ctx->ai);
	if (SAMPLE_COMM_AI_CreateChn(&ctx->ai)) {
		SAMPLE_COMM_AOV_UnbindSoundcard();
		goto __FAILED;
	}

	pthread_create(&ai_thread_id, 0, ai_get_stream, (void *)(&ctx->ai));
	SAMPLE_COMM_AOV_SetSuspendTime(s32SuspendTime);
	printf("%s initial finish\n", __func__);

	while (!quit) {
		sleep(1);
	}

	printf("%s exit!\n", __func__);

	pthread_join(ai_thread_id, NULL);
	SAMPLE_COMM_AI_DestroyChn(&ctx->ai);

__FAILED:
	RK_MPI_SYS_Exit();
	SAMPLE_COMM_AOV_Deinit();
__FAILED2:
	if (ctx) {
		free(ctx);
		ctx = RK_NULL;
	}

	return 0;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
