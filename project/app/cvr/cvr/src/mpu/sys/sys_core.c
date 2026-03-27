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

#include <rkadk_param.h>
#include <rkadk_common.h>

#include "sys_core.h"
#include "conf/user_param.h"

#include <string.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static int32_t create_parameter_path(char *folder) {
    RKADK_CHECK_POINTER(folder, RKADK_FAILURE);

    int32_t len = strlen(folder);
    if (!len) {
        RKADK_LOGE("Invalid path.");
        return -1;
    }

    for (int32_t i = 1; i < len; i++) {
        if (folder[i] != '/')
            continue;

        folder[i] = 0;
        if (access(folder, R_OK)) {
            if (mkdir(folder, 0755)) {
                RKADK_LOGE("mkdir error.");
                return -1;
            }
        }
        folder[i] = '/';
    }

    if (access(folder, R_OK)) {
        if (mkdir(folder, 0755)) {
            RKADK_LOGE("mkdir error.");
            return -1;
        }
    }

    RKADK_LOGD("Create %s finished", folder);
    return 0;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t sys_core_init(const char *inicfg_path, const char *global_cfg, const char *sensor_cfg_array) {
    if (NULL == inicfg_path || NULL == global_cfg || NULL == sensor_cfg_array) {
        RKADK_LOGE("Invalid input parameter!");
        return -1;
    }

    char default_path_env[RKADK_PATH_LEN] = {0};
    char param_path[RKADK_PATH_LEN] = {0};
    char global_setting[RKADK_PATH_LEN] = {0};
    char sensor_setting[CVR_SUPPORT_SENSOR_CNT][RKADK_PATH_LEN] = {0};
    char* sensor_setting_array[CVR_SUPPORT_SENSOR_CNT + 1] = {NULL};
    uint32_t inicfg_count;
    RKADK_PARAM_COMM_CFG_S *common_cfg = NULL;
    string_array_t cfg_array;

    snprintf(param_path, sizeof(param_path), "%s", inicfg_path);
    snprintf(global_setting, sizeof(global_setting), "%s%s", inicfg_path, global_cfg);

    user_param_init_string_array(&cfg_array);
    user_param_parse_string_array(sensor_cfg_array, &cfg_array);
    inicfg_count = cfg_array.size;
    for (uint32_t i = 0; i < inicfg_count && i < CVR_SUPPORT_SENSOR_CNT; i++) {
        snprintf(sensor_setting[i], sizeof(sensor_setting[i]), "%s%s", inicfg_path, cfg_array.strings[i]);
        sensor_setting_array[i] = &sensor_setting[i][0];
    }
    user_param_free_string_array(&cfg_array);

    snprintf(default_path_env, sizeof(default_path_env), "rkadk_default_ini_path=%s", CVR_RKADK_DEFAULT_INICFG_PATH);
    putenv(default_path_env);

    if (create_parameter_path(param_path)) {
        RKADK_LOGE("Failed to create parameter path.");
        return -1;
    }

    if (RKADK_MPI_SYS_Init()) {
        RKADK_LOGE("RKADK_MPI_SYS_Init failed.");
        return -1;
    }

    if (RKADK_PARAM_Init(global_setting, sensor_setting_array)) {
        RKADK_MPI_SYS_Exit();
        RKADK_LOGE("RKADK_PARAM_Init failed.");
        return -1;
    }

    common_cfg = RKADK_PARAM_GetCommCfg();
    if (NULL == common_cfg || common_cfg->sensor_count > inicfg_count) {
        RKADK_PARAM_Deinit();
        RKADK_MPI_SYS_Exit();
        RKADK_LOGE("Configuration file is missing.");
        return -1;
    }

    return 0;
}

void sys_core_deinit(void) {
    if (RKADK_MPI_SYS_CHECK()) {
        RKADK_PARAM_Deinit();
        RKADK_MPI_SYS_Exit();
    }
}

uint32_t sys_core_get_speaker_volume(void) {
    uint32_t speaker_volume = 0;
    if (!RKADK_PARAM_GetCommParam(RKADK_PARAM_TYPE_VOLUME, &speaker_volume)) {
        return speaker_volume;
    } else {
        RKADK_LOGE("Get speaker volume failed!\n");
        return 0;
    }
}

int32_t sys_core_set_speaker_volume(uint32_t volume) {
    if (!RKADK_PARAM_SetCommParam(RKADK_PARAM_TYPE_VOLUME, &volume)) {
        return 0;
    } else {
        RKADK_LOGE("Set speaker volume failed!\n");
        return -1;
    }
}

uint32_t sys_core_get_mic_volume(void) {
    uint32_t mic_volume = 0;
    if (!RKADK_PARAM_GetCommParam(RKADK_PARAM_TYPE_MIC_VOLUME, &mic_volume)) {
        return mic_volume;
    } else {
        RKADK_LOGE("Get speaker volume failed!\n");
        return 0;
    }
}

int32_t sys_core_set_mic_volume(uint32_t volume) {
    if (!RKADK_PARAM_SetCommParam(RKADK_PARAM_TYPE_MIC_VOLUME, &volume)) {
        return 0;
    } else {
        RKADK_LOGE("Set speaker volume failed!\n");
        return -1;
    }
}