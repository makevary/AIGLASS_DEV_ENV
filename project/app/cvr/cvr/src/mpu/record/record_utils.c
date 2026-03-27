/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include <stdint.h>
#include <string.h>

#include "mpu/isp/isp.h"
#include "record_utils.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    int32_t camid;
    HANDLE handle;
} record_utils_t, *record_utils_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define GET_RECORD_PTR(instance)   ((record_utils_p)instance)

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

HANDLE record_utils_create(RKADK_RECORD_ATTR_S *record_attr_ptr) {
    if (NULL == record_attr_ptr) {
        RKADK_LOGE("Invalid input parameter.");
        return NULL;
    }

    RKADK_MW_PTR rec_handle = NULL;
    record_utils_p new_utils = NULL;

    isp_get();

    new_utils = (record_utils_p)calloc(1, sizeof *new_utils);
    if (NULL == new_utils) {
        RKADK_LOGE("Failed to create instance.");
        goto fail;
    }

    if (RKADK_RECORD_Create(record_attr_ptr, &rec_handle)) {
        RKADK_LOGE("Create recorder failed.");
        goto fail;
    }

    new_utils->camid = record_attr_ptr->s32CamID;
    new_utils->handle = rec_handle;

    return new_utils;

fail:
    if (NULL != new_utils) {
        free(new_utils);
        new_utils = NULL;
    }

    isp_put();

    return NULL;
}

int32_t record_utils_start(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    record_utils_p record_utils = GET_RECORD_PTR(instance);
    if (RKADK_RECORD_Start(record_utils->handle)) {
        RKADK_LOGE("Start recorder failed!");
        return -1;
    }

    return 0;
}

int32_t record_utils_stop(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    record_utils_p record_utils = GET_RECORD_PTR(instance);
    if (RKADK_RECORD_Stop(record_utils->handle)) {
        RKADK_LOGE("Stop recorder failed!");
        return -1;
    }

    return 0;
}

int32_t record_utils_destroy(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    record_utils_p record_utils = GET_RECORD_PTR(instance);
    RKADK_RECORD_Stop(record_utils->handle);
    RKADK_RECORD_Destroy(record_utils->handle);
    free(record_utils);
    record_utils = NULL;

    isp_put();

    return 0;
}

int32_t record_utils_reset(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    record_utils_p record_utils = GET_RECORD_PTR(instance);
    if (RKADK_RECORD_Reset(&record_utils->handle)) {
        RKADK_LOGE("Reset recorder failed.");
        return -1;
    }

    return 0;
}

int32_t record_utils_manual_split(HANDLE instance, RKADK_REC_MANUAL_SPLIT_ATTR_S *split_attr_ptr) {
    if (NULL == instance || NULL == split_attr_ptr) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    record_utils_p record_utils = GET_RECORD_PTR(instance);
    if (RKADK_RECORD_ManualSplit(record_utils->handle, split_attr_ptr)) {
        RKADK_LOGE("Manual split failed.");
        return -1;
    }

    return 0;
}

int32_t record_utils_filecache_init(FILE_CACHE_ARG *file_cache_attr) {
    if (NULL == file_cache_attr)
        return -1;

    return RKADK_RECORD_FileCacheInit(file_cache_attr);
}

int32_t record_utils_filecache_deinit(void) {
    return RKADK_RECORD_FileCacheDeInit();
}

void record_utils_filecache_set_mode(RKADK_REC_TYPE_E rec_type) {
    RKADK_RECORD_FileCacheSetMode(rec_type);
}

RKADK_PARAM_RES_E record_utils_get_resolution(uint32_t cam_id) {
    RKADK_PARAM_RES_E res_type = RKADK_RES_BUTT;
    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_RES, &res_type)) {
        RKADK_LOGE("cam_id: %d, Failed to get resolution type.", cam_id);
        return RKADK_RES_BUTT;
    }

    return res_type;
}

int32_t record_utils_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution) {
    if (resolution >= RKADK_RES_BUTT) {
        RKADK_LOGE("cam_id: %d, Invalid input parameter.", cam_id);
        return -1;
    }

    RKADK_PARAM_RES_E res_type;
    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_RES, &res_type)) {
        RKADK_LOGE("cam_id: %d, Failed to get resolution type.", cam_id);
        return -1;
    }

    if (resolution == res_type) {
        RKADK_LOGW("cam_id: %d, Same parameter, invalid setting. res_type: %d.", cam_id, res_type);
        return -1;
    }

    if (RKADK_PARAM_SetCamParam(cam_id, RKADK_PARAM_TYPE_RES, &resolution))  {
        RKADK_LOGE("cam_id: %d, Failed to set recording parameters.", cam_id);
        return -1;
    }

    return 0;
}

int32_t record_utils_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type) {
    if (RKADK_CODEC_TYPE_H264 != codec_type &&
        RKADK_CODEC_TYPE_H265 != codec_type) {
        RKADK_LOGE("cam_id: %d, invalid input parameter.", cam_id);
        return -1;
    }

    RKADK_PARAM_CODEC_CFG_S codec_cfg;

    memset(&codec_cfg, 0, sizeof(codec_cfg));

    codec_cfg.enStreamType = RKADK_STREAM_TYPE_VIDEO_MAIN;
    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_CODEC_TYPE,
                                &codec_cfg)) {
        RKADK_LOGE("cam_id: %d, Failed to get codec type.", cam_id);
        return -1;
    }

    if (codec_type == codec_cfg.enCodecType) {
        RKADK_LOGW("cam_id: %d, Same parameter, invalid setting. codec_type: %d.\n", cam_id, codec_type);
        return -1;
    }

    codec_cfg.enCodecType = codec_type;
    if (RKADK_PARAM_SetCamParam(cam_id, RKADK_PARAM_TYPE_CODEC_TYPE,
                                &codec_cfg)) {
        RKADK_LOGE("cam_id: %d, Failed to set recording parameters.", cam_id);
        return -1;
    }

    return 0;
}

RKADK_CODEC_TYPE_E record_utils_get_codec_type(uint32_t cam_id) {
    RKADK_PARAM_CODEC_CFG_S codec_cfg;

    memset(&codec_cfg, 0, sizeof(codec_cfg));
    codec_cfg.enStreamType = RKADK_STREAM_TYPE_VIDEO_MAIN;
    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_CODEC_TYPE,
                                &codec_cfg)) {
        RKADK_LOGE("cam_id: %d, Failed to get codec type.", cam_id);
        return RKADK_CODEC_TYPE_BUTT;
    }

    return codec_cfg.enCodecType;
}

int32_t record_utils_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type) {
    if (rec_type >= RKADK_REC_TYPE_BUTT) {
        RKADK_LOGE("cam_id: %d, Invalid input parameter!", cam_id);
        return -1;
    }

    RKADK_REC_TYPE_E rec_type_tmp;

    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_RECORD_TYPE,
                                &rec_type_tmp)) {
        RKADK_LOGE("cam_id: %d, Failed to get recording parameters!", cam_id);
        return -1;
    }

    if (rec_type == rec_type_tmp) {
        RKADK_LOGW("cam_id: %d, Same parameter, invalid setting. rec_type: %d!", cam_id, rec_type);
        return 0;
    }

    if (RKADK_PARAM_SetCamParam(cam_id, RKADK_PARAM_TYPE_RECORD_TYPE, &rec_type)) {
        RKADK_LOGE("cam_id: %d, Failed to set recording parameters!", cam_id);
        return -1;
    }

    return 0;
}