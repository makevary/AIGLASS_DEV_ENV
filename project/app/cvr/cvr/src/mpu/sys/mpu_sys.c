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

#include "mpu/sys/common.h"
#include "mpu/sys/sys_core.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    bool init_flag;
    uint32_t ref_cnt;
} sys_process_context_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static sys_process_context_t sys_ctx = {
    .init_flag = false,
    .ref_cnt = 0
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

int32_t mpu_sys_init(void) {
    if (false != sys_ctx.init_flag) {
        sys_ctx.ref_cnt++;
        return 0;
    }

    int32_t ret;

    ret = sys_core_init(CVR_RKADK_INICFG_PATH,
                        CVR_RKADK_GLOBAL_INICFG, CVR_RKADK_SENSOR_INICFG);
    if (ret) {
        CVR_ERR("Sdk initialization failed!\n");
        return -1;
    }

    sys_ctx.init_flag = true;
    sys_ctx.ref_cnt = 1;

    return 0;
}

void mpu_sys_deinit(void) {
    if (true == sys_ctx.init_flag && 0 < (--sys_ctx.ref_cnt))
        return;

    sys_ctx.init_flag = false;
    sys_core_deinit();
}

uint32_t mpu_sys_get_speaker_volume(void) {
    return sys_core_get_speaker_volume();
}

int32_t mpu_sys_set_speaker_volume(uint32_t volume) {
    return sys_core_set_speaker_volume(volume);
}

uint32_t mpu_sys_get_mic_volume(void) {
    return sys_core_get_mic_volume();
}

int32_t mpu_sys_set_mic_volume(uint32_t volume) {
    return sys_core_set_mic_volume(volume);
}
