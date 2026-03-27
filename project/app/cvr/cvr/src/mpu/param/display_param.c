/*
 * Copyright (c) 2021 Rockchip, Inc. All Rights Reserved.
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

#include "conf/user_param.h"
#include "mpu/sys/common.h"
#include "display_param.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    const char * const name;
    const char * const disp_cnt_key;
    int32_t disp_cnt_def_value;
    struct {
        const char * const snesor_id_key;
        int32_t sensor_id_def_value;
    } disp_cfg[CVR_SUPPORT_SENSOR_CNT];
} disp_param_section_t, *disp_param_section_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define DEFINE_DISP_PARAM_SECTION   \
disp_param_section_t disp_param_section_map = { \
    .name = "disp", \
    .disp_cnt_key = "disp_cnt", \
    .disp_cnt_def_value = 1,    \
    .disp_cfg = {   \
        {.snesor_id_key = "disp_sensor_0", .sensor_id_def_value = 0},   \
        {.snesor_id_key = "disp_sensor_1", .sensor_id_def_value = 1}    \
    }   \
};  \
disp_param_section_p section = &disp_param_section_map;

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t disp_param_get_cfg(disp_param_cfg_p param_cfg) {
    if (NULL == param_cfg)
        return -1;

    DEFINE_DISP_PARAM_SECTION;

    param_cfg->disp_cnt = user_param_get_int(section->name, section->disp_cnt_key, section->disp_cnt_def_value);
    if (0 >= param_cfg->disp_cnt || param_cfg->disp_cnt > CVR_SUPPORT_SENSOR_CNT)
        return -1;

    for (uint32_t i = 0;  i < param_cfg->disp_cnt; i++) {
        param_cfg->disp_cfg[i].cam_id = user_param_get_int(section->name, section->disp_cfg[i].snesor_id_key,
                                                           section->disp_cfg[i].sensor_id_def_value);
        if (0 > param_cfg->disp_cfg[i].cam_id)
            return -1;
    }

    return 0;
}