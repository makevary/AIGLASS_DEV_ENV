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

#include "conf/user_param.h"
#include "mpu/sys/common.h"
#include "photo_param.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

typedef struct {
    const char * const name;
    const char * const photo_cnt_key;
    int32_t photo_cnt_def_value;
    struct {
        const char * const name;
        const char * const snesor_id_key;
        int32_t sensor_id_def_value;
        const char * const osd_id_key;
        int32_t osd_id_def_value;
    } photo_cfg[CVR_SUPPORT_SENSOR_CNT];
} photo_param_section_t, *photo_param_section_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

#define DEFINE_PHOTO_PARAM_SECTION  \
photo_param_section_t photo_param_section_map = {   \
    .name = "photo",    \
    .photo_cnt_key = "photo_cnt",   \
    .photo_cnt_def_value = 1,   \
    .photo_cfg = {  \
        {   \
            .name = "photo.0",  \
            .snesor_id_key = "sensor_id",   \
            .sensor_id_def_value = 0,   \
            .osd_id_key = "osd_id", \
            .osd_id_def_value = 0   \
        },  \
        {   \
            .name = "photo.1",  \
            .snesor_id_key = "sensor_id",   \
            .sensor_id_def_value = 1,   \
            .osd_id_key = "osd_id", \
            .osd_id_def_value = 1   \
        }   \
    }   \
};  \
photo_param_section_p section = &photo_param_section_map;

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t photo_param_get_cfg(photo_param_cfg_p param_cfg) {
    if (NULL == param_cfg)
        return -1;

    DEFINE_PHOTO_PARAM_SECTION;

    param_cfg->photo_cnt = user_param_get_int(section->name, section->photo_cnt_key, section->photo_cnt_def_value);
    if (0 >= param_cfg->photo_cnt || param_cfg->photo_cnt > CVR_SUPPORT_SENSOR_CNT)
        return -1;

    for (uint32_t i = 0;  i < param_cfg->photo_cnt; i++) {
        param_cfg->photo_cfg[i].cam_id = user_param_get_int(section->name, section->photo_cfg[i].snesor_id_key,
                                                            section->photo_cfg[i].sensor_id_def_value);
        if (0 > param_cfg->photo_cfg[i].cam_id)
            return -1;

        param_cfg->photo_cfg[i].osd_id = user_param_get_int(section->name, section->photo_cfg[i].osd_id_key,
                                                            section->photo_cfg[i].osd_id_def_value);
        if (0 > param_cfg->photo_cfg[i].cam_id)
            return -1;
    }

    return 0;
}