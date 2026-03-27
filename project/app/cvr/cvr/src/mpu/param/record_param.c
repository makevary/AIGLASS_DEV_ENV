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
#include "record_param.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    const char * const name;
    const char * const sensor_id_key;
    int32_t sensor_id_def_value;
    const char * const osd_id_key;
    int32_t osd_id_def_value;
    const char * const storage_path_key;
    const char * const sgorage_path_def_value;
} record_param_task_section_t, *record_param_task_section_p;

typedef struct {
    const char * const name;
    const char * const root_dir_key;
    const char * const root_dir_def_value;
    const char * const record_cnt_key;
    int32_t record_cnt_def_value;
    const char * const file_cache_total_key;
    int32_t file_cache_total_def_value;
    const char * const file_cache_write_key;
    int32_t file_cache_write_def_value;
    const char * const file_cache_policy_key;
    int32_t file_cache_policy_def_value;
    const char * const file_cache_priority_key;
    int32_t file_cache_priority_def_value;
    record_param_task_section_t task[CVR_SUPPORT_SENSOR_CNT];
} record_param_main_section_t, *record_param_main_section_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define DEFINE_RECORD_PARAM_SECTION \
record_param_main_section_t record_param_section_map = { \
    .name = "record", \
    .root_dir_key = "root_dir", \
    .root_dir_def_value = "/mnt/sdcard", \
    .record_cnt_key = "record_cnt", \
    .record_cnt_def_value = 1, \
    .file_cache_total_key = "file_cache_total", \
    .file_cache_total_def_value = 10485760,\
    .file_cache_write_key = "file_cache_write", \
    .file_cache_write_def_value = 1048576, \
    .file_cache_policy_key = "file_cache_policy", \
    .file_cache_policy_def_value = 3, \
    .file_cache_priority_key = "file_cache_priority", \
    .file_cache_priority_def_value = 99, \
    .task = { \
        { \
            .name = "record.0", \
            .sensor_id_key = "sensor_id", \
            .sensor_id_def_value = 0, \
            .osd_id_key = "osd_id", \
            .osd_id_def_value = 2, \
            .storage_path_key = "storage_path", \
            .sgorage_path_def_value = "/video_front/" \
        }, \
        { \
            .name = "record.1", \
            .sensor_id_key = "sensor_id", \
            .sensor_id_def_value = 1, \
            .osd_id_key = "osd_id", \
            .osd_id_def_value = 3, \
            .storage_path_key = "storage_path", \
            .sgorage_path_def_value = "/video_back/" \
        } \
    }, \
}; \
record_param_main_section_p section = &record_param_section_map;

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t record_param_get_cfg(record_param_cfg_p param_cfg) {
    if (NULL == param_cfg)
        return -1;

    DEFINE_RECORD_PARAM_SECTION;

    param_cfg->root_dir = user_param_get_string(section->name, section->root_dir_key, section->root_dir_def_value);
    if (NULL == param_cfg->root_dir)
        return -1;

    param_cfg->record_cnt = user_param_get_int(section->name, section->record_cnt_key, section->record_cnt_def_value);
    if (0 >= param_cfg->record_cnt || param_cfg->record_cnt > CVR_SUPPORT_SENSOR_CNT)
        return -1;

    param_cfg->file_cache_total = user_param_get_int(section->name, section->file_cache_total_key, section->file_cache_total_def_value);
    if (0 >= param_cfg->file_cache_total)
        return -1;

    param_cfg->file_cache_write = user_param_get_int(section->name, section->file_cache_write_key, section->file_cache_write_def_value);
    if (0 >= param_cfg->file_cache_write)
        return -1;

    param_cfg->file_cache_policy = user_param_get_int(section->name, section->file_cache_policy_key, section->file_cache_policy_def_value);
    if (0 > param_cfg->file_cache_policy)
        return -1;

    param_cfg->file_cache_priority = user_param_get_int(section->name, section->file_cache_priority_key, section->file_cache_priority_def_value);
    if (0 > param_cfg->file_cache_priority)
        return -1;

    for (uint32_t i = 0;  i < param_cfg->record_cnt; i++) {
        param_cfg->task_info[i].cam_id = user_param_get_int(section->task[i].name, section->task[i].sensor_id_key,
                                                            section->task[i].sensor_id_def_value);
        if (0 > param_cfg->task_info[i].cam_id)
            return -1;

        param_cfg->task_info[i].osd_id = user_param_get_int(section->task[i].name, section->task[i].osd_id_key,
                                                            section->task[i].osd_id_def_value);
        if (0 > param_cfg->task_info[i].osd_id)
            return -1;

        param_cfg->task_info[i].storage_path = user_param_get_string(section->task[i].name, section->task[i].storage_path_key,
                                                                     section->task[i].sgorage_path_def_value);
        if (NULL == param_cfg->task_info[i].storage_path)
            return -1;
    }

    return 0;
}