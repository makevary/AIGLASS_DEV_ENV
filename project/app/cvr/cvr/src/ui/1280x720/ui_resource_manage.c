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

#include <cvr_conf.h>

#include <limits.h>

#include "ui_resource_manage.h"
#include "ui_languages.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

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
 *  GLOBAL VARIABLES
 **********************/
lv_ft_info_t ttf_info_24;
lv_ft_info_t ttf_info_28;
lv_ft_info_t ttf_info_32;

lv_img_dsc_t *index_bg = NULL;
lv_img_dsc_t *index_icon_photo_p = NULL;
lv_img_dsc_t *index_icon_photo_r = NULL;
lv_img_dsc_t *index_icon_sw_p = NULL;
lv_img_dsc_t *index_icon_sw_r = NULL;
lv_img_dsc_t *index_icon_set_p = NULL;
lv_img_dsc_t *index_icon_set_r = NULL;
lv_img_dsc_t *index_icon_media_p = NULL;
lv_img_dsc_t *index_icon_media_r = NULL;
lv_img_dsc_t *index_icon_sd_nor = NULL;
lv_img_dsc_t *index_icon_sd = NULL;
lv_img_dsc_t *index_icon_sd_err = NULL;
lv_img_dsc_t *index_icon_sd_scan = NULL;
lv_img_dsc_t *index_icon_record_nor = NULL;
lv_img_dsc_t *index_icon_record = NULL;
lv_img_dsc_t *index_icon_movie_p = NULL;
lv_img_dsc_t *index_icon_movie_f = NULL;
lv_img_dsc_t *index_icon_movie_p_nor = NULL;
lv_img_dsc_t *index_icon_movie_f_nor = NULL;
lv_img_dsc_t *index_icon_mic_nor = NULL;
lv_img_dsc_t *index_icon_mic = NULL;
lv_img_dsc_t *index_icon_play = NULL;

lv_img_dsc_t *index_icon_return_r = NULL;
lv_img_dsc_t *index_icon_return_p = NULL;
lv_img_dsc_t *index_icon_boxbg_r = NULL;
lv_img_dsc_t *index_icon_boxbg_p = NULL;
lv_img_dsc_t *index_icon_movie_1 = NULL;
lv_img_dsc_t *index_icon_movie_3 = NULL;
lv_img_dsc_t *index_icon_movie_5 = NULL;
lv_img_dsc_t *index_icon_res_4k = NULL;
lv_img_dsc_t *index_icon_res_2k = NULL;
lv_img_dsc_t *index_icon_res_1k = NULL;
lv_img_dsc_t *index_icon_code_264 = NULL;
lv_img_dsc_t *index_icon_code_265 = NULL;
lv_img_dsc_t *index_icon_vol_01 = NULL;
lv_img_dsc_t *index_icon_vol_02 = NULL;
lv_img_dsc_t *index_icon_vol_03 = NULL;
lv_img_dsc_t *index_icon_vol_04 = NULL;
lv_img_dsc_t *index_icon_mic_01 = NULL;
lv_img_dsc_t *index_icon_mic_02 = NULL;
lv_img_dsc_t *index_icon_lang_01 = NULL;
lv_img_dsc_t *index_icon_store_01 = NULL;
lv_img_dsc_t *index_icon_format_01 = NULL;

lv_img_dsc_t *index_icon_bg_r = NULL;
lv_img_dsc_t *index_icon_bg_p = NULL;
lv_img_dsc_t *index_icon_video_f_01 = NULL;
lv_img_dsc_t *index_icon_video_p_01 = NULL;
lv_img_dsc_t *index_icon_video_u_01 = NULL;
lv_img_dsc_t *index_icon_photo_01 = NULL;

lv_img_dsc_t *index_icon_player_play = NULL;
lv_img_dsc_t *index_icon_player_play_p = NULL;
lv_img_dsc_t *index_icon_player_stop = NULL;
lv_img_dsc_t *index_icon_player_stop_p = NULL;

lv_img_dsc_t *index_icon_set_btn_01 = NULL;
lv_img_dsc_t *index_icon_set_btn_02 = NULL;

lv_img_dsc_t *index_icon_set_btn_s_01 = NULL;
lv_img_dsc_t *index_icon_set_btn_s_02 = NULL;

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

static void setting_release_res(void) {
    ICON_RELEASE(index_icon_return_r);
    ICON_RELEASE(index_icon_return_p);
    ICON_RELEASE(index_icon_boxbg_r);
    ICON_RELEASE(index_icon_boxbg_p);
    ICON_RELEASE(index_icon_movie_1);
    ICON_RELEASE(index_icon_movie_3);
    ICON_RELEASE(index_icon_movie_5);
    ICON_RELEASE(index_icon_res_4k);
    ICON_RELEASE(index_icon_res_2k);
    ICON_RELEASE(index_icon_res_1k);
    ICON_RELEASE(index_icon_code_264);
    ICON_RELEASE(index_icon_code_265);
    ICON_RELEASE(index_icon_vol_01);
    ICON_RELEASE(index_icon_vol_02);
    ICON_RELEASE(index_icon_vol_03);
    ICON_RELEASE(index_icon_vol_04);
    ICON_RELEASE(index_icon_mic_01);
    ICON_RELEASE(index_icon_mic_02);
    ICON_RELEASE(index_icon_lang_01);
    ICON_RELEASE(index_icon_store_01);
    ICON_RELEASE(index_icon_format_01);
}

static void setting_load_res(void) {
    setting_release_res();

    index_icon_return_r = ui_dec_icon("icon_return_01.png");
    index_icon_return_p = ui_dec_icon("icon_return_02.png");
    index_icon_boxbg_r = ui_dec_icon("set_boxbg_01.png");
    index_icon_boxbg_p = ui_dec_icon("set_boxbg_02.png");
    index_icon_movie_1 = ui_dec_icon("set_icon_movie_01.png");
    index_icon_movie_3 = ui_dec_icon("set_icon_movie_02.png");
    index_icon_movie_5 = ui_dec_icon("set_icon_movie_03.png");
    index_icon_res_4k = ui_dec_icon("set_icon_res_01.png");
    index_icon_res_2k = ui_dec_icon("set_icon_res_02.png");
    index_icon_res_1k = ui_dec_icon("set_icon_res_03.png");
    index_icon_code_264 = ui_dec_icon("set_icon_code_01.png");
    index_icon_code_265 = ui_dec_icon("set_icon_code_02.png");
    index_icon_vol_01 = ui_dec_icon("set_icon_vol_01.png");
    index_icon_vol_02 = ui_dec_icon("set_icon_vol_02.png");
    index_icon_vol_03 = ui_dec_icon("set_icon_vol_03.png");
    index_icon_vol_04 = ui_dec_icon("set_icon_vol_04.png");
    index_icon_mic_01 = ui_dec_icon("set_icon_mic_01.png");
    index_icon_mic_02 = ui_dec_icon("set_icon_mic_02.png");
    index_icon_lang_01 = ui_dec_icon("set_icon_lang_01.png");
    index_icon_store_01 = ui_dec_icon("set_icon_store_01.png");
    index_icon_format_01 = ui_dec_icon("set_icon_format_01.png");
}

static void view_release_res(void) {
    ICON_RELEASE(index_bg);
    ICON_RELEASE(index_icon_photo_p);
    ICON_RELEASE(index_icon_photo_r);
    ICON_RELEASE(index_icon_sw_p);
    ICON_RELEASE(index_icon_sw_r);
    ICON_RELEASE(index_icon_set_p);
    ICON_RELEASE(index_icon_set_r);
    ICON_RELEASE(index_icon_media_p);
    ICON_RELEASE(index_icon_media_r);
    ICON_RELEASE(index_icon_sd_nor);
    ICON_RELEASE(index_icon_sd);
    ICON_RELEASE(index_icon_sd_err);
    ICON_RELEASE(index_icon_sd_scan);
    ICON_RELEASE(index_icon_record_nor);
    ICON_RELEASE(index_icon_record);
    ICON_RELEASE(index_icon_movie_p_nor);
    ICON_RELEASE(index_icon_movie_f_nor);
    ICON_RELEASE(index_icon_movie_p);
    ICON_RELEASE(index_icon_movie_f);
    ICON_RELEASE(index_icon_mic_nor);
    ICON_RELEASE(index_icon_mic);
    ICON_RELEASE(index_icon_play);
}

static void view_load_res(void) {
    view_release_res();

    index_bg = ui_dec_icon("index_bg.png");
    index_icon_photo_p = ui_dec_icon("index_icon_photo_p.png");
    index_icon_photo_r = ui_dec_icon("index_icon_photo_r.png");
    index_icon_sw_p = ui_dec_icon("index_icon_sw_p.png");
    index_icon_sw_r = ui_dec_icon("index_icon_sw_r.png");
    index_icon_set_p = ui_dec_icon("index_icon_set_p.png");
    index_icon_set_r = ui_dec_icon("index_icon_set_r.png");
    index_icon_media_p = ui_dec_icon("index_icon_media_p.png");
    index_icon_media_r = ui_dec_icon("index_icon_media_r.png");
    index_icon_sd_nor = ui_dec_icon("index_icon_sd_nor.png");
    index_icon_sd = ui_dec_icon("index_icon_sd.png");
    index_icon_sd_err = ui_dec_icon("index_icon_sd_err.png");
    index_icon_sd_scan = ui_dec_icon("index_icon_sd_scan.png");
    index_icon_record_nor = ui_dec_icon("index_icon_record_nor.png");
    index_icon_record = ui_dec_icon("index_icon_record.png");
    index_icon_movie_p = ui_dec_icon("index_icon_movie_p.png");
    index_icon_movie_f = ui_dec_icon("index_icon_movie_f.png");
    index_icon_movie_p_nor = ui_dec_icon("index_icon_movie_p_nor.png");
    index_icon_movie_f_nor = ui_dec_icon("index_icon_movie_f_nor.png");
    index_icon_mic_nor = ui_dec_icon("index_icon_mic_nor.png");
    index_icon_mic = ui_dec_icon("index_icon_mic.png");
    index_icon_play = ui_dec_icon("list_icon_play.png");
}

static void media_release_res(void) {
    ICON_RELEASE(index_icon_bg_r);
    ICON_RELEASE(index_icon_bg_p);
    ICON_RELEASE(index_icon_video_f_01);
    ICON_RELEASE(index_icon_video_p_01);
    ICON_RELEASE(index_icon_video_u_01);
    ICON_RELEASE(index_icon_photo_01);
}

static void media_load_res(void) {
    media_release_res();

    index_icon_bg_r = ui_dec_icon("media_icon_bg_01.png");
    index_icon_bg_p = ui_dec_icon("media_icon_bg_02.png");
    index_icon_video_f_01 = ui_dec_icon("icon_video_f_01.png");
    index_icon_video_p_01 = ui_dec_icon("icon_video_p_01.png");
    index_icon_video_u_01 = ui_dec_icon("icon_video_u_01.png");
    index_icon_photo_01 = ui_dec_icon("icon_photo_01.png");
}

static void player_release_res(void) {
    ICON_RELEASE(index_icon_player_play);
    ICON_RELEASE(index_icon_player_play_p);
    ICON_RELEASE(index_icon_player_stop);
    ICON_RELEASE(index_icon_player_stop_p);
}

static void player_load_res(void) {
    player_release_res();

    index_icon_player_play = ui_dec_icon("player_icon_play.png");
    index_icon_player_play_p = ui_dec_icon("player_icon_play_p.png");
    index_icon_player_stop = ui_dec_icon("player_icon_stop.png");
    index_icon_player_stop_p = ui_dec_icon("player_icon_stop_p.png");
}

static void dialog_release_res(void) {
    ICON_RELEASE(index_icon_set_btn_01);
    ICON_RELEASE(index_icon_set_btn_02);
    ICON_RELEASE(index_icon_set_btn_s_01);
    ICON_RELEASE(index_icon_set_btn_s_02);
}

static void dialog_load_res(void) {
    dialog_release_res();
    index_icon_set_btn_01 = ui_dec_icon("set_btn_l_01.png");
    index_icon_set_btn_02 = ui_dec_icon("set_btn_l_02.png");
    index_icon_set_btn_s_01 = ui_dec_icon("set_btn_s_01.png");
    index_icon_set_btn_s_02 = ui_dec_icon("set_btn_s_02.png");
}

static void ui_font_release(void) {
    if (NULL != ttf_info_24.font) {
        lv_ft_font_destroy(ttf_info_24.font);
        ttf_info_24.font = NULL;
    }

    if (NULL != ttf_info_28.font) {
        lv_ft_font_destroy(ttf_info_28.font);
        ttf_info_28.font = NULL;
    }

    if (NULL != ttf_info_32.font) {
        lv_ft_font_destroy(ttf_info_32.font);
        ttf_info_32.font = NULL;
    }
}

static int32_t ui_font_load(void) {
    /*Create a font*/

    if (0 != ui_font_init(&ttf_info_24, 24))
        LV_LOG_ERROR("Title font initialization failed.");

    if (0 != ui_font_init(&ttf_info_28, 28))
        LV_LOG_ERROR("Content font initialization failed.");

    if (0 != ui_font_init(&ttf_info_32, 21))
        LV_LOG_ERROR("Content font initialization failed.");

    return 0;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void ui_resource_release(void) {
    setting_release_res();
    view_release_res();
    media_release_res();
    player_release_res();
    dialog_release_res();

    ui_font_release();

    ui_language_release();
}

void ui_resource_load(void) {
    /* load text resource */
    ui_language_load();

    ui_font_load();

    setting_load_res();
    view_load_res();
    media_load_res();
    player_load_res();
    dialog_load_res();
}