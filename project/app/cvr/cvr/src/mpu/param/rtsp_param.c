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

#include "rtsp_param.h"
#include "conf/user_param.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    const char * const name;
    const char * const rtsp_cnt_key;
    int32_t rtsp_cnt_def_value;
    struct {
        const char * const name;
        const char * sensor_id_key;
        int32_t sensor_id_def_value;
        const char * const port_key;
        int32_t port_def_value;
        const char * const url_key;
        const char * const url_def_value;
    } rtsp_cfg[CVR_SUPPORT_SENSOR_CNT];
} rtsp_section_t, *rtsp_section_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/ 
#define DEFINE_RTSP_SECTION() \
rtsp_section_t rtsp_section_map = { \
    .name = "rtsp", \
    .rtsp_cnt_key = "rtsp_cnt", \
    .rtsp_cnt_def_value = 1,    \
    .rtsp_cfg = {   \
        {   \
            .name = "rtsp.0",                                   \
            .sensor_id_key = "sensor_id",                       \
            .sensor_id_def_value = 0,                           \
            .port_key = "port",                                 \
            .port_def_value = 50001,                              \
            .url_key = "url",                                   \
            .url_def_value = "/live/0"                          \
        },  \
        {   \
            .name = "rtsp.1",                                   \
            .sensor_id_key = "sensor_id",                       \
            .sensor_id_def_value = 1,                           \
            .port_key = "port",                                 \
            .port_def_value = 50002,                              \
            .url_key = "url",                                   \
            .url_def_value = "/live/1"                          \
        }   \
    }   \
};  \
rtsp_section_p section = &rtsp_section_map;

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t rtsp_param_get_cfg(rtsp_param_cfg_p param_cfg) {
    if (NULL == param_cfg)
        return -1;

    DEFINE_RTSP_SECTION();

    param_cfg->rtsp_cnt = user_param_get_int(section->name, section->rtsp_cnt_key, section->rtsp_cnt_def_value);
    if (0 >= param_cfg->rtsp_cnt || param_cfg->rtsp_cnt > CVR_SUPPORT_SENSOR_CNT)
        return -1;

    for (uint32_t i = 0;  i < param_cfg->rtsp_cnt; i++) {
        param_cfg->rtsp_cfg[i].port = user_param_get_int(section->rtsp_cfg[i].name,
                                                         section->rtsp_cfg[i].port_key, section->rtsp_cfg[i].port_def_value);
        if (0 > param_cfg->rtsp_cfg[i].port)
            return -1;

        param_cfg->rtsp_cfg[i].cam_id = user_param_get_int(section->rtsp_cfg[i].name,
                                                           section->rtsp_cfg[i].sensor_id_key, section->rtsp_cfg[i].sensor_id_def_value);
        if (0 > param_cfg->rtsp_cfg[i].cam_id)
            return -1;

        param_cfg->rtsp_cfg[i].url = user_param_get_string(section->rtsp_cfg[i].name,
                                                           section->rtsp_cfg[i].url_key, section->rtsp_cfg[i].url_def_value);
        if (NULL == param_cfg->rtsp_cfg[i].url)
            return -1;
    }

    return 0;
}