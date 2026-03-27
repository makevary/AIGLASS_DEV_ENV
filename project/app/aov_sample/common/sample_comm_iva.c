/*
 * Copyright 2022 Rockchip Electronics Co. LTD
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

#include <errno.h>
#include <pthread.h>
#include <stdio.h>
#include <sys/poll.h>
#include <unistd.h>
#include "sample_comm.h"

#define ROCKIVA_PATH_LENGTH (128)

#ifdef ROCKIVA

// 2000 millis
#define IVA_RESULT_TOLERATE_DELAY 2000
#define IVA_RESULT_MAX_SIZE 10

static void destroy_list_unlocked(SAMPLE_IVA_CTX_S *ctx) {
	assert(ctx);
	enum ROCKIVA_MODE mode = ctx->stIvaResultList.eIvaMode;
	struct list_head *head = &ctx->stIvaResultList.head;
	if (mode == ROCKIVA_MODE_BA) {
		struct BaResultNode *node, *tmp;
		list_for_each_entry_safe(node, tmp, head, list) {
			list_del(&node->list);
			ctx->stIvaResultList.u32Size = 0;
			free(node);
		}
	} else if (mode == ROCKIVA_MODE_DETECT) {
		struct DetectResultNode *node, *tmp;
		list_for_each_entry_safe(node, tmp, head, list) {
			list_del(&node->list);
			ctx->stIvaResultList.u32Size = 0;
			free(node);
		}
	}
	assert(list_empty(head));
}

static void init_iva_result_list(SAMPLE_IVA_CTX_S *ctx) {
	assert(ctx);
	pthread_mutex_init(&ctx->stIvaResultMutex, NULL);
	pthread_mutex_lock(&ctx->stIvaResultMutex);
	ctx->stIvaResultList.u32Size = 0;
	ctx->stIvaResultList.eIvaMode = ctx->eIvaMode;
	INIT_LIST_HEAD(&ctx->stIvaResultList.head);
	pthread_mutex_unlock(&ctx->stIvaResultMutex);
}

static void deinit_iva_result_list(SAMPLE_IVA_CTX_S *ctx) {
	assert(ctx);
	pthread_mutex_lock(&ctx->stIvaResultMutex);
	destroy_list_unlocked(ctx);
	ctx->stIvaResultList.u32Size = 0;
	pthread_mutex_unlock(&ctx->stIvaResultMutex);
	pthread_mutex_destroy(&ctx->stIvaResultMutex);
}

RK_S32 SAMPLE_COMM_IVA_Push_Result(SAMPLE_IVA_CTX_S *ctx, const void *iva_result) {
	assert(ctx);
	if (iva_result == NULL) {
		RK_LOGE("iva result is nullptr!\n");
		return RK_FAILURE;
	}

	struct list_head *head = &ctx->stIvaResultList.head;
	struct list_head *list = NULL;
	enum ROCKIVA_MODE mode = ctx->stIvaResultList.eIvaMode;

	if (mode == ROCKIVA_MODE_BA) {
		struct BaResultNode *new_node = malloc(sizeof(struct BaResultNode));
		if (new_node == NULL) {
			RK_LOGE("malloc failed!\n");
			return RK_FAILURE;
		}
		memcpy(&new_node->stIvaResult, iva_result, sizeof(RockIvaBaResult));
		if (clock_gettime(CLOCK_MONOTONIC, &new_node->stTimestamp) != 0) {
			RK_LOGE("clock_gettime failed!\n");
			free(new_node);
			return RK_FAILURE;
		}
		list = &new_node->list;
	} else if (mode == ROCKIVA_MODE_DETECT) {
		struct DetectResultNode *new_node = malloc(sizeof(struct DetectResultNode));
		if (new_node == NULL) {
			RK_LOGE("malloc failed!\n");
			return RK_FAILURE;
		}
		memcpy(&new_node->stIvaResult, iva_result, sizeof(RockIvaDetectResult));
		if (clock_gettime(CLOCK_MONOTONIC, &new_node->stTimestamp) != 0) {
			RK_LOGE("clock_gettime failed!\n");
			free(new_node);
			return RK_FAILURE;
		}
		list = &new_node->list;
	}

	pthread_mutex_lock(&ctx->stIvaResultMutex);
	if (ctx->stIvaResultList.u32Size >= IVA_RESULT_MAX_SIZE) {
		RK_LOGW("too much pending results!\n");
		destroy_list_unlocked(ctx);
	}
	list_add(list, head);
	ctx->stIvaResultList.u32Size++;
	pthread_mutex_unlock(&ctx->stIvaResultMutex);

	return RK_SUCCESS;
}

void *SAMPLE_COMM_IVA_Pop_Result(SAMPLE_IVA_CTX_S *ctx) {
	assert(ctx);
	struct list_head *head = &ctx->stIvaResultList.head;
	enum ROCKIVA_MODE mode = ctx->stIvaResultList.eIvaMode;
	void *result = NULL;
	pthread_mutex_lock(&ctx->stIvaResultMutex);
	if (ctx->stIvaResultList.u32Size == 0) {
		assert(list_empty(head));
		pthread_mutex_unlock(&ctx->stIvaResultMutex);
		return result;
	}
	if (mode == ROCKIVA_MODE_BA) {
		struct BaResultNode *ba_result;
		ba_result = list_first_entry(head, struct BaResultNode, list);
		assert(!list_entry_is_head(ba_result, head, list));
		list_del(&ba_result->list);
		--ctx->stIvaResultList.u32Size;
		result = &(ba_result->stIvaResult);
	} else if (mode == ROCKIVA_MODE_DETECT) {
		struct DetectResultNode *detect_result;
		detect_result = list_first_entry(head, struct DetectResultNode, list);
		assert(!list_entry_is_head(detect_result, head, list));
		list_del(&detect_result->list);
		--ctx->stIvaResultList.u32Size;
		result = &(detect_result->stIvaResult);
	}
	pthread_mutex_unlock(&ctx->stIvaResultMutex);
	return result;
}

void SAMPLE_COMM_IVA_Release_Result(SAMPLE_IVA_CTX_S *ctx, const void *iva_result) {
	assert(ctx);
	enum ROCKIVA_MODE mode = ctx->stIvaResultList.eIvaMode;
	if (iva_result) {
		if (mode == ROCKIVA_MODE_BA) {
			struct BaResultNode *node =
			    container_of(iva_result, struct BaResultNode, stIvaResult);
			free(node);
		} else if (mode == ROCKIVA_MODE_DETECT) {
			struct DetectResultNode *node =
			    container_of(iva_result, struct DetectResultNode, stIvaResult);
			free(node);
		}
	}
}

static RK_S32 SAMPLE_COMM_IVA_BA_Init(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_SUCCESS;
	/* Set Detect area */
	ctx->baParams.baRules.areaInBreakRule[0].ruleEnable = RK_TRUE;
	ctx->baParams.baRules.areaInBreakRule[0].sense = 90;
	ctx->baParams.baRules.areaInBreakRule[0].alertTime = 1000; /* 1000 ms */
	ctx->baParams.baRules.areaInBreakRule[0].minObjSize[2].width =
	    ctx->u32ImageWidth / 100;
	ctx->baParams.baRules.areaInBreakRule[0].minObjSize[2].height =
	    ctx->u32ImageHeight / 100;
	ctx->baParams.baRules.areaInBreakRule[0].event = ROCKIVA_BA_TRIP_EVENT_STAY;
	ctx->baParams.baRules.areaInBreakRule[0].ruleID = 0;
	ctx->baParams.baRules.areaInBreakRule[0].objType =
	    ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_PERSON);
	ctx->baParams.baRules.areaInBreakRule[0].objType |=
	    ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_FACE);
	ctx->baParams.baRules.areaInBreakRule[0].objType |=
	    ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_PET);
	ctx->baParams.baRules.areaInBreakRule[0].area.pointNum = 4;
	ctx->baParams.baRules.areaInBreakRule[0].area.points[0].x =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageWidth, ctx->u32DetectStartX);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[0].y =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageHeight, ctx->u32DetectStartY);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[1].x =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageWidth,
	                                 ctx->u32DetectStartX + ctx->u32DetectWidth);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[1].y =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageHeight, ctx->u32DetectStartY);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[2].x =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageWidth,
	                                 ctx->u32DetectStartX + ctx->u32DetectWidth);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[2].y =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageHeight,
	                                 ctx->u32DetectStartY + ctx->u32DetectHight);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[3].x =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageWidth, ctx->u32DetectStartX);
	ctx->baParams.baRules.areaInBreakRule[0].area.points[3].y =
	    ROCKIVA_PIXEL_RATION_CONVERT(ctx->u32ImageHeight,
	                                 ctx->u32DetectStartY + ctx->u32DetectHight);
	ctx->baParams.aiConfig.detectResultMode = 0;

	s32Ret = ROCKIVA_BA_Init(ctx->ivahandle, &ctx->baParams, ctx->baResultCallback);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_BA_Init failure:%X", s32Ret);
		return s32Ret;
	}

	s32Ret = ROCKIVA_SetFrameReleaseCallback(ctx->ivahandle, ctx->releaseCallback);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_SetFrameReleaseCallback failure:%#X", s32Ret);
		return s32Ret;
	}
	return s32Ret;
}

static RK_S32 SAMPLE_COMM_IVA_BA_Deinit(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_SUCCESS;
	s32Ret = ROCKIVA_BA_Release(ctx->ivahandle);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("ROCKIVA_BA_Release failure:%X", s32Ret);
	return s32Ret;
}

static RK_S32 SAMPLE_COMM_IVA_Detect_Init(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_SUCCESS;
	RockIvaDetTaskParams param;
	memset(&param, 0, sizeof(param));
	param.detObjectType |= ROCKIVA_OBJECT_TYPE_BITMASK(ROCKIVA_OBJECT_TYPE_PERSON);
	param.scores[0] = 30;
	s32Ret = ROCKIVA_DETECT_Init(ctx->ivahandle, &param, ctx->detectResultCallback);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_DETECT_Init failed %#X\n", s32Ret);
		return s32Ret;
	}

	s32Ret = ROCKIVA_SetFrameReleaseCallback(ctx->ivahandle, ctx->releaseCallback);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_SetFrameReleaseCallback failure:%#X", s32Ret);
		return s32Ret;
	}
	return s32Ret;
}

static RK_S32 SAMPLE_COMM_IVA_Detect_Deinit(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_SUCCESS;
	s32Ret = ROCKIVA_DETECT_Release(ctx->ivahandle);
	if (s32Ret != RK_SUCCESS)
		RK_LOGE("ROCKIVA_DETECT_Release failure:%X", s32Ret);
	return s32Ret;
}

static int check_file_exists(const char *path, const char *filename) {
	char fullPath[256];
	snprintf(fullPath, sizeof(fullPath), "%s/%s", path, filename);

	if (access(fullPath, F_OK) != -1) {
		printf("File exists: %s\n", fullPath);
		return 0;
	} else {
		printf("File does not exist: %s\n", fullPath);
		return -1;
	}
}

RK_S32 SAMPLE_COMM_IVA_Create(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_FAILURE;

	snprintf(ctx->commonParams.modelPath, ROCKIVA_PATH_LENGTH, ctx->pModelDataPath);
	// If there is a model file named 'iva_object_detection_pfp.data' in the file system,
	// it will be forced to use this file; otherwise, the file specified by eModeType will
	// be used."
	if (check_file_exists(ctx->pModelDataPath, "iva_object_detection_pfp.data") == 0) {
		ctx->commonParams.detModelName = "iva_object_detection_pfp.data";
		RK_LOGE("force use iva mode %s\n", ctx->commonParams.detModelName);
	}

	ctx->commonParams.coreMask = 0x04;
	ctx->commonParams.logLevel = ROCKIVA_LOG_ERROR;
	ctx->commonParams.detModel = ctx->eModeType; /* Detect type */
	ctx->commonParams.imageInfo.width = ctx->u32ImageWidth;
	ctx->commonParams.imageInfo.height = ctx->u32ImageHeight;
	ctx->commonParams.imageInfo.format = ctx->eImageFormat;
	ctx->commonParams.imageInfo.transformMode = ctx->eImageTransform;

	/* IVA init */
	s32Ret = ROCKIVA_Init(&ctx->ivahandle, ROCKIVA_MODE_VIDEO, &ctx->commonParams,
	                      ctx /* extract ctx from userData pass by callback function*/);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_Init failure:%X", s32Ret);
		return s32Ret;
	}

	if (ctx->eIvaMode == ROCKIVA_MODE_BA && ctx->baResultCallback != NULL)
		s32Ret = SAMPLE_COMM_IVA_BA_Init(ctx);
	else if (ctx->eIvaMode == ROCKIVA_MODE_DETECT && ctx->detectResultCallback != NULL)
		s32Ret = SAMPLE_COMM_IVA_Detect_Init(ctx);
	if (s32Ret != RK_SUCCESS)
		return s32Ret;

	init_iva_result_list(ctx);

	return s32Ret;
}

RK_S32 SAMPLE_COMM_IVA_SetWorkMode(SAMPLE_IVA_CTX_S *ctx, RockIvaWorkMode wMode) {
	RK_S32 s32Ret = RK_FAILURE;
	s32Ret = ROCKIVA_SetWorkMode(ctx->ivahandle, wMode);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_SetWorkMode failure:%X", s32Ret);
	}
	return s32Ret;
}

RK_S32 SAMPLE_COMM_IVA_Destroy(SAMPLE_IVA_CTX_S *ctx) {
	RK_S32 s32Ret = RK_FAILURE;

	deinit_iva_result_list(ctx);
	if (ctx->eIvaMode == ROCKIVA_MODE_BA && ctx->baResultCallback != NULL)
		s32Ret = SAMPLE_COMM_IVA_BA_Deinit(ctx);
	else if (ctx->eIvaMode == ROCKIVA_MODE_DETECT && ctx->detectResultCallback != NULL)
		s32Ret = SAMPLE_COMM_IVA_Detect_Deinit(ctx);

	s32Ret = ROCKIVA_Release(ctx->ivahandle);
	if (s32Ret != RK_SUCCESS) {
		RK_LOGE("ROCKIVA_Release failure:%X", s32Ret);
	}

	return s32Ret;
}

#endif

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
