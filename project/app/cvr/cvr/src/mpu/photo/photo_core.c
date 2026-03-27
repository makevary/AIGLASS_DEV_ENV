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

#include "photo_core.h"
#include "mpu/isp/isp.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
HANDLE photo_core_create(RKADK_PHOTO_ATTR_S *photo_attr_ptr) {
    if (NULL == photo_attr_ptr) {
        RKADK_LOGE("Invalid input parameter!");
        return NULL;
    }

    int32_t ret;
    RKADK_MW_PTR new_handle = NULL;

    isp_get();

    ret = RKADK_PHOTO_Init(photo_attr_ptr, &new_handle);
    if (0 != ret) {
        RKADK_LOGE("RKADK_PHOTO_Init failed(%d)!", ret);
        goto failed;
    }

    return new_handle;

failed:
    isp_put();

    return NULL;
}

int32_t photo_core_destroy(HANDLE core_handle) {
    if (NULL == core_handle)
        return -1;

    int32_t ret = RKADK_PHOTO_DeInit(core_handle);

    isp_put();

    return ret;
}

int32_t photo_core_reset(HANDLE core_handle) {
    if (NULL != core_handle) {
        if (RKADK_PHOTO_Reset(&core_handle)) {
            RKADK_LOGE("RKADK_PHOTO_Reset failed!");
            return -1;
        }
    }

    return 0;
}

int32_t photo_core_capture(HANDLE core_handle, RKADK_TAKE_PHOTO_ATTR_S *take_attr_ptr) {
    if (NULL != core_handle && NULL != take_attr_ptr) {
        if (RKADK_PHOTO_TakePhoto(core_handle, take_attr_ptr)) {
            RKADK_LOGE("RKADK_PHOTO_TakePhoto failed!");
            return -1;
        }
    }

    return 0;
}

int32_t photo_core_get_resolution(uint32_t camid, uint32_t *width, uint32_t *height) {
    if (NULL == width || NULL == height) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    const RKADK_PARAM_PHOTO_CFG_S *photo_cfg = NULL;

    photo_cfg = RKADK_PARAM_GetPhotoCfg(camid);
    if (NULL == photo_cfg) {
        RKADK_LOGE("Failed to get photo configure.");
        return -1;
    }

    *width = photo_cfg->image_width;
    *height = photo_cfg->image_height;

    return 0;
}

int32_t photo_core_set_resolultion(uint32_t cam_id, RKADK_PARAM_RES_E resolution) {
    if (resolution >= RKADK_RES_BUTT) {
        RKADK_LOGE("invalid input parameter.");
        return -1;
    }

    RKADK_PARAM_RES_E photo_res;

    if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_PHOTO_RES,
                                &photo_res)) {
        RKADK_LOGE("Failed to get photo parameters.");
        return -1;
    }

    if (resolution == photo_res) {
        RKADK_LOGW("Same parameter, invalid setting. photo_res: %d.", photo_res);
        return -1;
    }

    if (RKADK_PARAM_SetCamParam(cam_id, RKADK_PARAM_TYPE_PHOTO_RES,
                                &resolution)) {
        RKADK_LOGE("Failed to set photo parameters.");
        return -1;
    }

    return 0;
}