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

#ifndef _DISPLAY_PARAM_H_
#define _DISPLAY_PARAM_H_

#include "mpu/sys/common.h"

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    int32_t disp_cnt;
    struct {
        int32_t cam_id;
    } disp_cfg[CVR_SUPPORT_SENSOR_CNT];
} disp_param_cfg_t, *disp_param_cfg_p;

int32_t disp_param_get_cfg(disp_param_cfg_p param_cfg);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
