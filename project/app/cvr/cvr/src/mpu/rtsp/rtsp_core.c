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

#include "mpu/isp/isp.h"

#include "rtsp_core.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    uint32_t camid;
    RKADK_MW_PTR handle;
} rtsp_core_t, *rtsp_core_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define GET_RTSP_PTR(core_handle)   ((rtsp_core_t *)(core_handle))

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

HANDLE rtsp_core_create(uint32_t cam_id, uint32_t port, const char *path) {
    if (NULL == path) {
        RKADK_LOGE("Invalid input parameter.");
        return NULL;
    }

    RKADK_MW_PTR handle = NULL;
    rtsp_core_t *new = NULL;

    isp_get();

    new = (rtsp_core_t *)calloc(1, sizeof *new);
    if (NULL == new) {
        RKADK_LOGE("camid: %u, rtsp instance failed to apply for memory.", cam_id);
        goto failed;
    }

    if (RKADK_RTSP_Init(cam_id, port, path, &handle)) {
        RKADK_LOGE("camid: %u, rtsp service initialization failed.", cam_id);
        goto failed;
    }

    new->camid = cam_id;
    new->handle = handle;

    return new;

failed:
    if (NULL != handle) {
        RKADK_RTSP_DeInit(handle);
        handle = NULL;
    }

    if (NULL != new) {
        free(new);
        new = NULL;
    }

    isp_put();

    return NULL;;
}

int32_t rtsp_core_start(HANDLE core_handle) {
    if (NULL == core_handle) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    rtsp_core_t *core = GET_RTSP_PTR(core_handle);
    if (RKADK_RTSP_Start(core->handle)) {
        RKADK_LOGE("camid: %u, Failed to enable rtsp service.", core->camid);
        return -1;
    }

    return 0;
}

int32_t rtsp_core_stop(HANDLE core_handle) {
    if (NULL == core_handle) {
        RKADK_LOGE("Invalid input parameter.");
        return -1;
    }

    rtsp_core_t *core = GET_RTSP_PTR(core_handle);
    if (RKADK_RTSP_Stop(core->handle)) {
        RKADK_LOGE("camid: %u, rtsp service deactivation failed.", core->camid);
        return -1;
    }

    return 0;
}

void rtsp_core_destroy(HANDLE core_handle) {
    rtsp_core_t *core = GET_RTSP_PTR(core_handle);
    if (NULL != core) {
        if (NULL != core->handle) {
            RKADK_RTSP_DeInit(core->handle);
            core->handle = NULL;
        }
        free(core);
        core = NULL;

        isp_put();
    }
}