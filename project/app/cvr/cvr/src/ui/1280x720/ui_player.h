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

#ifndef _UI_MEDIA_PLAYER_H_
#define _UI_MEDIA_PLAYER_H_

#include "mpu/mpu_storage.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    PLAYER_TYPE_PHOTO = 0,
    PLAYER_TYPE_VIDEO,
    PLAYER_TYPE_BUTT
} PLAYER_TYPE_E;

typedef struct {
    char file_path[512];
    time_t stTime;
    PLAYER_TYPE_E type;
} UI_PLAYER_FILE_INFO_S;

void ui_player_create_window(PLAYER_TYPE_E type, void *parent_obj);
void ui_player_destory_window(void);
void ui_player_switch_file(UI_PLAYER_FILE_INFO_S *player_file_info);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif