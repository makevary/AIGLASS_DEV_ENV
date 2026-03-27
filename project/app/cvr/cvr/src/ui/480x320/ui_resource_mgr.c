/**
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

#include "utils/common.h"
#include "lvgl/common/lv_img_dec.h"
#include "ui/common/ui_gettext.h"

#include <stdio.h>
#include <limits.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/


/**********************
 *  GLOBAL VARIABLES
 **********************/
lv_ft_info_t ui_font_title;
lv_ft_info_t ui_font_content;

lv_img_dsc_t *icon_bg_index = NULL;
lv_img_dsc_t *icon_power_full_index = NULL;
lv_img_dsc_t *icon_power_mid_index = NULL;
lv_img_dsc_t *icon_power_low_index = NULL;
lv_img_dsc_t *icon_power_no_index = NULL;
lv_img_dsc_t *icon_record_start_index = NULL;
lv_img_dsc_t *icon_record_stop_index = NULL;
lv_img_dsc_t *icon_media_index = NULL;
lv_img_dsc_t *icon_setting_index = NULL;
lv_img_dsc_t *icon_phone_index = NULL;
lv_img_dsc_t *icon_play_btn_index = NULL;
lv_img_dsc_t *icon_photo_btn_index = NULL;
lv_img_dsc_t *icon_selection_index = NULL;
lv_img_dsc_t *icon_esc_index = NULL;
lv_img_dsc_t *icon_up_arrow = NULL;
lv_img_dsc_t *icon_down_arrow = NULL;
lv_img_dsc_t *icon_return_index = NULL;
lv_img_dsc_t *icon_switch_left_index = NULL;
lv_img_dsc_t *icon_switch_right_index = NULL;
lv_img_dsc_t *icon_play_index = NULL;
lv_img_dsc_t *icon_pause_index = NULL;
lv_img_dsc_t *icon_camera_switch_index = NULL;

/**********************
 *      MACROS
 **********************/

#define ICON_RELEASE(icon_index)                \
    do {                                        \
        if (NULL != icon_index) {               \
            lv_free_img(&icon_index);           \
            icon_index = NULL;                  \
        }                                       \
    } while (0)

/**********************
 *   STATIC FUNCTIONS
 **********************/

static lv_img_dsc_t* ui_dec_icon(const char * const icon_name) {
    if (NULL == icon_name) {
        LV_LOG_ERROR("The icon named pointer is NULL.");
        return NULL;
    }

    char icon_path[PATH_MAX] = {0};

    snprintf(icon_path, sizeof(icon_path), "%s%s", CVR_ICON_FILE_PATH, icon_name);
    return lv_dec_img(icon_path);
}

static int32_t ui_font_init(lv_ft_info_t *info, uint32_t weight) {
    if (NULL == info || 0 == weight) {
        LV_LOG_ERROR("Invalid font configuration parameter.");
        return -1;
    }

    info->name = CVR_TTF_FILE;
    info->weight = weight;
    info->style = FT_FONT_STYLE_NORMAL;

    if (!lv_ft_font_init(info)) {
        LV_LOG_ERROR("Failed to create font.");
        return -1;
    }

    return 0;
}

static int32_t ui_icon_load(void) {
    icon_bg_index = ui_dec_icon("icon_background.png");
    icon_power_full_index = ui_dec_icon("icon_power_full.png");
    icon_power_mid_index = ui_dec_icon("icon_power_mid.png");
    icon_power_low_index = ui_dec_icon("icon_power_low.png");
    icon_power_no_index = ui_dec_icon("icon_power_no.png");
    icon_record_start_index = ui_dec_icon("icon_record_start.png");
    icon_record_stop_index = ui_dec_icon("icon_record_stop.png");
    icon_media_index = ui_dec_icon("icon_media.png");
    icon_setting_index = ui_dec_icon("icon_setting.png");
    icon_phone_index = ui_dec_icon("icon_phone.png");
    icon_play_btn_index = ui_dec_icon("icon_play_button.png");
    icon_photo_btn_index = ui_dec_icon("icon_photo_button.png");
    icon_selection_index = ui_dec_icon("icon_selection.png");
    icon_esc_index = ui_dec_icon("icon_esc.png");
    icon_up_arrow = ui_dec_icon("icon_up_arrow.png");
    icon_down_arrow = ui_dec_icon("icon_down_arrow.png");
    icon_return_index = ui_dec_icon("icon_return.png");
    icon_switch_left_index = ui_dec_icon("icon_switch_left.png");
    icon_switch_right_index = ui_dec_icon("icon_switch_right.png");
    icon_pause_index = ui_dec_icon("icon_pause.png");
    icon_play_index = ui_dec_icon("icon_play.png");
    icon_camera_switch_index = ui_dec_icon("icon_camera_switch.png");
    return 0;
}

static void ui_icon_release(void) {
    ICON_RELEASE(icon_bg_index);
    ICON_RELEASE(icon_power_full_index);
    ICON_RELEASE(icon_power_mid_index);
    ICON_RELEASE(icon_power_low_index);
    ICON_RELEASE(icon_record_start_index);
    ICON_RELEASE(icon_record_stop_index);
    ICON_RELEASE(icon_media_index);
    ICON_RELEASE(icon_setting_index);
    ICON_RELEASE(icon_phone_index);
    ICON_RELEASE(icon_play_btn_index);
    ICON_RELEASE(icon_photo_btn_index);
    ICON_RELEASE(icon_selection_index);
    ICON_RELEASE(icon_esc_index);
    ICON_RELEASE(icon_up_arrow);
    ICON_RELEASE(icon_down_arrow);
    ICON_RELEASE(icon_return_index);
    ICON_RELEASE(icon_switch_left_index);
    ICON_RELEASE(icon_switch_right_index);
    ICON_RELEASE(icon_pause_index);
    ICON_RELEASE(icon_play_index);
    ICON_RELEASE(icon_camera_switch_index);
}

static int32_t ui_font_load(void) {
    if (0 != ui_font_init(&ui_font_title, 20))
        LV_LOG_ERROR("Title font initialization failed.");

    if (0 != ui_font_init(&ui_font_content, 16))
        LV_LOG_ERROR("Content font initialization failed.");

    return 0;
}

static void ui_font_release(void) {
    if (NULL != ui_font_title.font) {
        lv_ft_font_destroy(ui_font_title.font);
        ui_font_title.font = NULL;
    }

    if (NULL != ui_font_content.font) {
        lv_ft_font_destroy(ui_font_content.font);
        ui_font_content.font = NULL;
    }
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t ui_res_load(void) {
    int32_t ret = 0;

    ret |= ui_icon_load();
    ret |= ui_font_load();
    ret |= ui_language_load();

    return ret;
}
void ui_res_release(void) {
    ui_icon_release();
    ui_font_release();
    ui_language_release();
}