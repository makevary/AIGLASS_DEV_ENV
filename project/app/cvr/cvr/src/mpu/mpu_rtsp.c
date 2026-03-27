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

#include "utils/common.h"
#include "utils/log.h"

#include "param/rtsp_param.h"
#include "rtsp/rtsp_core.h"
#include "mpu_rtsp.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    uint32_t cam_id;
    uint32_t port;
    const char *url;
    HANDLE core_handle;
} mpu_rtsp_context_t, *mpu_rtsp_context_p;

typedef struct {
    uint32_t rtsp_cnt;
    mpu_rtsp_context_t context[CVR_SUPPORT_SENSOR_CNT];
} mpu_rtsp_manager_t, mpu_rtsp_manager_p;

/**********************
 *  STATIC VARIABLES
 **********************/
static mpu_rtsp_manager_t g_rtsp_manager;
static volatile bool g_rtsp_init = false;
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

/**********************
 *      MACROS
 **********************/
#define MPU_RTSP_CHECK_INIT(init, errcode)                                        \
  do {                                                                         \
    if (!(g_rtsp_init)) {                                                             \
      CVR_ERR("[%s] not init\n", #init);                                      \
      return errcode;                                                          \
    }                                                                          \
  } while (0)

#define MPU_RTSP_GET_CORE_HANDLE(cam_id, rtsp_manager) \
    ({ \
        HANDLE result = NULL; \
        do { \
            for (uint32_t i = 0; i < (rtsp_manager)->rtsp_cnt; i++) { \
                if ((rtsp_manager)->context[i].cam_id == cam_id) \
                    result = (rtsp_manager)->context[i].core_handle; \
            } \
        } while (0); \
        result; \
    })

#define MPU_RTSP_FOR_EACH_CORE_HANDLE(core_handle, rtsp_manager) \
    for (uint32_t i = 0; i < (rtsp_manager)->rtsp_cnt; i++) \
        if (NULL != (core_handle = (rtsp_manager)->context[i].core_handle))

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t mpu_rtsp_init(void) {
    if (true == g_rtsp_init)
        return 0;

    HANDLE core_handle = NULL;
    rtsp_param_cfg_t rtsp_param;

    memset(&rtsp_param, 0, sizeof(rtsp_param));

    if (rtsp_param_get_cfg(&rtsp_param)) {
        CVR_ERR("Failed to obtain rtsp parameters!\n");
        return -1;
    }

    memset(&g_rtsp_manager, 0, sizeof(g_rtsp_manager));

    for (uint32_t i = 0; i < rtsp_param.rtsp_cnt; i++) {
        core_handle = rtsp_core_create(rtsp_param.rtsp_cfg[i].cam_id,
                                       rtsp_param.rtsp_cfg[i].port, rtsp_param.rtsp_cfg[i].url);
        if (NULL == core_handle) {
            CVR_ERR("cam id: %d, Rtsp module creation failed!\n", rtsp_param.rtsp_cfg[i].cam_id);
            goto fail;
        }
        g_rtsp_manager.context[i].cam_id = rtsp_param.rtsp_cfg[i].cam_id;
        g_rtsp_manager.context[i].port = rtsp_param.rtsp_cfg[i].port;
        g_rtsp_manager.context[i].url = rtsp_param.rtsp_cfg[i].url;
        g_rtsp_manager.context[i].core_handle = core_handle;
    }

    g_rtsp_manager.rtsp_cnt = rtsp_param.rtsp_cnt;

    g_rtsp_init = true;

    return 0;

fail:
    MPU_RTSP_FOR_EACH_CORE_HANDLE(core_handle, &g_rtsp_manager) {
        rtsp_core_stop(core_handle);
        rtsp_core_destroy(core_handle);
    }

    return -1;
}

void mpu_rtsp_deinit(void) {
    MPU_RTSP_CHECK_INIT(g_rtsp_init, );

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    HANDLE core_handle = NULL;
    MPU_RTSP_FOR_EACH_CORE_HANDLE(core_handle, &g_rtsp_manager) {
        rtsp_core_stop(core_handle);
        rtsp_core_destroy(core_handle);
    }

    memset(&g_rtsp_manager, 0, sizeof(g_rtsp_manager));

    g_rtsp_init = false;

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}

int32_t mpu_rtsp_start(int32_t cam_id) {
    MPU_RTSP_CHECK_INIT(g_rtsp_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret = -1;
    HANDLE core_handle = NULL;

    if (RTSP_ALL_CHN == cam_id) {
        MPU_RTSP_FOR_EACH_CORE_HANDLE(core_handle, &g_rtsp_manager) {
            ret = rtsp_core_start(core_handle);
            if (ret)
                CVR_ERR("cam_id: %d, Start rtsp failed!\n", g_rtsp_manager.context[i].cam_id);
        }
    } else {
        core_handle = MPU_RTSP_GET_CORE_HANDLE(cam_id, &g_rtsp_manager);
        if (NULL == core_handle) {
            CVR_ERR("Invalid handle!\n");
            PTHREAD_MUTEX_UNLOCK(mutex_Lock);
            return -1;
        }

        ret = rtsp_core_start(core_handle);
        if (ret)
            CVR_ERR("cam_id: %d, Start rtsp failed!\n", cam_id);
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_rtsp_stop(int32_t cam_id) {
    MPU_RTSP_CHECK_INIT(g_rtsp_init, -1);

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret = -1;
    HANDLE core_handle = NULL;

    if (RTSP_ALL_CHN == cam_id) {
        MPU_RTSP_FOR_EACH_CORE_HANDLE(core_handle, &g_rtsp_manager) {
            ret = rtsp_core_stop(core_handle);
            if (ret)
                CVR_ERR("cam_id: %d, Stop rtsp failed!\n", g_rtsp_manager.context[i].cam_id);
        }
    } else {
        core_handle = MPU_RTSP_GET_CORE_HANDLE(cam_id, &g_rtsp_manager);
        if (NULL == core_handle) {
            CVR_ERR("Invalid handle!\n");
            PTHREAD_MUTEX_UNLOCK(mutex_Lock);
            return -1;
        }

        ret = rtsp_core_stop(core_handle);
        if (ret)
            CVR_ERR("cam_id: %d, Stop rtsp failed!\n", cam_id);
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}