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

#ifndef _UI_RES_MANAGE_H_
#define _UI_RES_MANAGE_H_

#include "lvgl.h"

#ifdef __cplusplus
extern "C" {
#endif

extern lv_ft_info_t ui_font_title;
extern lv_ft_info_t ui_font_content;

extern lv_img_dsc_t *icon_bg_index;
extern lv_img_dsc_t *icon_power_full_index;
extern lv_img_dsc_t *icon_power_mid_index;
extern lv_img_dsc_t *icon_power_low_index;
extern lv_img_dsc_t *icon_power_no_index;
extern lv_img_dsc_t *icon_record_start_index;
extern lv_img_dsc_t *icon_record_stop_index;
extern lv_img_dsc_t *icon_media_index;
extern lv_img_dsc_t *icon_setting_index;
extern lv_img_dsc_t *icon_phone_index;
extern lv_img_dsc_t *icon_play_btn_index;
extern lv_img_dsc_t *icon_photo_btn_index;
extern lv_img_dsc_t *icon_selection_index;
extern lv_img_dsc_t *icon_esc_index;
extern lv_img_dsc_t *icon_up_arrow;
extern lv_img_dsc_t *icon_down_arrow;
extern lv_img_dsc_t *icon_return_index;
extern lv_img_dsc_t *icon_switch_left_index;
extern lv_img_dsc_t *icon_switch_right_index;
extern lv_img_dsc_t *icon_play_index;
extern lv_img_dsc_t *icon_pause_index;
extern lv_img_dsc_t *icon_camera_switch_index;

int32_t ui_res_load(void);
void    ui_res_release(void);

#ifdef __cplusplus
} /*extern "C"*/
#endif

#endif