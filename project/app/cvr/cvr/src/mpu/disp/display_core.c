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

#include "display_core.h"
#include "mpu/isp/isp.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *  GLOBAL VARIABLES
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

int32_t disp_core_init(uint32_t camid) {
    isp_get();

    if (RKADK_DISP_Init(camid)) {
        RKADK_LOGE("camid: %u, Failed to enable local preview function.", camid);
        goto failed;
    }

    return 0;

failed:
    isp_put();
    return -1;
}

int32_t disp_core_deinit(uint32_t camid) {
    int32_t ret = RKADK_DISP_DeInit(camid);

    isp_put();

    return ret;
}