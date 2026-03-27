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

#ifndef _UI_PLAYLIST_H_
#define _UI_PLAYLIST_H_

#include "ui_player.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    const char *title;
    char res_path[256];
    PLAYER_TYPE_E type;
} UI_PLAYLIST_INFO;

void ui_playlist_create_window(UI_PLAYLIST_INFO *playlist_info);
void ui_playlist_destroy_window(void);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif