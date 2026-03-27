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

#ifndef _MEDIA_PLAYER_H_
#define _MEDIA_PLAYER_H_

#include "utils/common.h"

#include "rkadk_common.h"
#include "rkadk_player.h"

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  media_player_create(RKADK_PLAYER_CFG_S *player_cfg, const RKADK_RECT_S *disp_area);
int32_t media_player_destroy(HANDLE instance);
int32_t media_player_play(HANDLE instance);
int32_t media_player_pause(HANDLE instance);
int32_t media_player_play_switch(HANDLE instance, const char *file_path);
int64_t media_player_get_duration_position(HANDLE instance);
int32_t media_player_get_duration(HANDLE instance, uint32_t *duration);
int32_t media_player_play_seek(HANDLE instance, RKADK_S64 time_ms);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
