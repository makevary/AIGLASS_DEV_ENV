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

#include <cvr_conf.h>

#include "param.h"
#include "conf/user_param.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>


/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    const char * const name;

    const char * const model_path_key;
    const char * const model_path_def_value;

    const char * const license_path_key;
    const char * const license_path_def_value;

    const char * const sensor_id_key;
    int32_t sensor_id_def_value;

    const char * const vi_chn_key;
    int32_t vi_chn_def_value;

    const char * const osd_id_key;
    int32_t osd_id_def_value;
} adas_section_t, *adas_section_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/ 

#define DEFINE_ADAS_SECTION()   \
adas_section_t adas_section_map = { \
    .name = "adas", \
    .sensor_id_key = "sensor_id",   \
    .sensor_id_def_value = 0,   \
    .vi_chn_key = "vi_chn", \
    .vi_chn_def_value = 3,  \
    .osd_id_key = "osd_id", \
    .osd_id_def_value = 4,  \
};  \
adas_section_p section = &adas_section_map;

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t adas_param_get_cfg(adas_param_cfg_p param_cfg) {
    if (NULL == param_cfg)
        return -1;

    DEFINE_ADAS_SECTION();

    param_cfg->model_path = CVR_ADAS_MODLE_PATH;

    param_cfg->license_path = CVR_ADAS_LICENSE_PATH;

    param_cfg->vi_dev = user_param_get_int(section->name, section->sensor_id_key, section->sensor_id_def_value);

    param_cfg->vi_chn = user_param_get_int(section->name, section->vi_chn_key, section->vi_chn_def_value);

    param_cfg->rgn_handle = user_param_get_int(section->name, section->osd_id_key, section->osd_id_def_value);

    return 0;
}

int32_t adas_param_get_rgn_handle(void) {
    DEFINE_ADAS_SECTION();
    return user_param_get_int(section->name, section->osd_id_key, section->osd_id_def_value);
}

void adas_param_cfg_dump(void) {
    adas_param_cfg_t param;

    memset(&param, 0, sizeof(param));

    adas_param_get_cfg(&param);

    printf("[adas] model_path: %s\n", param.model_path);
    printf("[adas] license_path: %s\n", param.license_path);
    printf("[adas] vi_dev: %d\n", param.vi_dev);
    printf("[adas] vi_chn: %d\n", param.vi_chn);
    printf("[adas] rgn_handle: %d\n", param.rgn_handle);
}