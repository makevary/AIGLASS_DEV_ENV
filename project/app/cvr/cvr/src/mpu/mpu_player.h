/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
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

#ifndef _MPU_PLAYER_H_
#define _MPU_PLAYER_H_

#include "player/player.h"

#ifdef __cplusplus
extern "C" {
#endif

#define MPU_PLAYER_TYPE_VIDEO    0X0001L
#define MPU_PLAYER_TYPE_AUDIO    0X0002L

int32_t mpu_player_create(int32_t player_type, const RKADK_RECT_S *disp_area,
                         uint32_t speaker_volume, RKADK_PLAYER_EVENT_FN event_cb);
void    mpu_player_destroy(void);
int32_t mpu_player_play(void);
int32_t mpu_player_pause(void);
int32_t mpu_player_switch(const char *file_path);
int32_t mpu_player_get_duration(uint32_t *duration);
int64_t mpu_player_get_duration_position(void);
int32_t mpu_player_seek(RKADK_S64 time_ms);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif