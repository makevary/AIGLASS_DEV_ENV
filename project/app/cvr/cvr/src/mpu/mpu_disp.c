/*
 * Copyright (c) 2023 Rockchip, Inc. All Rights Reserved.
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

#include "mpu/disp/display_core.h"
#include "mpu/param/display_param.h"

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    volatile bool init;
    uint32_t cam_id;
} disp_context_t, *disp_context_p;

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

static disp_context_t g_disp_ctx = {
    .init = false,
    .cam_id = 0
};

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t mpu_disp_init(uint32_t cam_id) {
    if (true == g_disp_ctx.init) {
        CVR_WARN("System has been initialized!\n");
        return 0;
    }

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    int32_t ret;
    disp_param_cfg_t cfg;

    ret = disp_param_get_cfg(&cfg);
    if (ret) {
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        CVR_ERR("Failed to obtain display parameters!\n");
        return -1;
    }

    if (cam_id >= cfg.disp_cnt) {
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        CVR_ERR("Invalid input parameter!\n");
        return -1;
    }

    ret = disp_core_init(cam_id);
    if (ret)
        CVR_ERR("cam_id: %d, Display initialization failed!\n", cam_id);

    g_disp_ctx.cam_id = cam_id;
    g_disp_ctx.init = true;

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

void mpu_disp_deinit(void) {
    if (false == g_disp_ctx.init)
        return;

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    disp_core_deinit(g_disp_ctx.cam_id);

    g_disp_ctx.init = false;

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}

int32_t mpu_disp_get_cnt(void) {
    int32_t ret;
    disp_param_cfg_t cfg;

    memset(&cfg, 0, sizeof(cfg));

    ret = disp_param_get_cfg(&cfg);
    if (ret) {
        CVR_ERR("Failed to obtain display parameters!\n");
        return -1;
    }

    return cfg.disp_cnt;
}