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

#ifndef _CVR_UTILS_FONT_FACTORY_H_
#define _CVR_UTILS_FONT_FACTORY_H_

#include <pthread.h>
#include <wchar.h>

#include "utils/log.h"
#include "utils/common.h"

#ifdef __cplusplus
extern "C" {
#endif

int32_t  ft2_init_freetype_library(void);
void     ft2_term_freetype_library(void);
HANDLE   ft2_create_dev_font(const char *font_path, uint32_t font_size);
void     ft2_destory_dev_font(HANDLE handle);
int32_t  ft2_set_font_size(HANDLE handle, uint32_t font_size);
uint32_t ft2_get_font_size(HANDLE handle);
int32_t  ft2_set_font_color(HANDLE handle, uint32_t font_color);
uint32_t ft2_get_font_color(HANDLE handle);
void     ft2_draw_text(HANDLE handle, u_char *buf,
                       uint32_t buf_w, uint32_t buf_h, const wchar_t *w_str);

#ifdef __cplusplus
} /*extern "C"*/
#endif

#endif