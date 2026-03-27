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

#include "ui/common/ui_common.h"
#include "ui_resource_manage.h"
#include "ui_languages.h"
#include "ui_playlist.h"
#include "ui/common/ui_page_manager.h"
#include "mpu/mpu_storage.h"
#include "mpu/mpu_record.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *      MACROS
 **********************/
#define MEDIA_NUMBER_MAX  4

/**********************
 *  STATIC VARIABLES
 **********************/
static struct {
    lv_obj_t *bg_obj;
    lv_obj_t *menu_bar_obj;
    lv_obj_t *exit_obj;
    lv_obj_t *options[MEDIA_NUMBER_MAX];
} media_lib_ctrl;

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
extern lv_ft_info_t ttf_info_24;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_32;

static void media_layout(void);
static void media_destroy_ctrl(void);
static void media_create_ctrl(lv_obj_t *page_obj);

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void media_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);
    UI_PLAYLIST_INFO *playlist_info = (UI_PLAYLIST_INFO *)lv_event_get_user_data(e);

    if(code == LV_EVENT_CLICKED) {
        ui_playlist_create_window(playlist_info);
    } else if (code == LV_EVENT_FOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_bg_p, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_bg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_bg_r, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_bg_p, NULL);
    }
}

static void exit_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        ui_page_pop_page();
    } else if (code == LV_EVENT_FOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_p, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_r, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    }
}

static void media_layout(void) {
    static lv_coord_t col_dsc[] = {LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc[] = {LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    lv_obj_set_style_grid_column_dsc_array(media_lib_ctrl.menu_bar_obj, col_dsc, 0);
    lv_obj_set_style_grid_row_dsc_array(media_lib_ctrl.menu_bar_obj, row_dsc, 0);

    lv_obj_set_grid_cell(media_lib_ctrl.exit_obj, LV_GRID_ALIGN_START, 0, 1,
                        LV_GRID_ALIGN_CENTER, 0, 1);

    lv_obj_set_grid_cell(media_lib_ctrl.options[0], LV_GRID_ALIGN_CENTER, 0, 1,
                         LV_GRID_ALIGN_STRETCH, 1, 1);

    lv_obj_set_grid_cell(media_lib_ctrl.options[1], LV_GRID_ALIGN_CENTER, 1, 1,
                        LV_GRID_ALIGN_STRETCH, 1, 1);

    lv_obj_set_grid_cell(media_lib_ctrl.options[2], LV_GRID_ALIGN_CENTER, 2, 1,
                        LV_GRID_ALIGN_STRETCH, 1, 1);

    lv_obj_set_grid_cell(media_lib_ctrl.options[3], LV_GRID_ALIGN_CENTER, 3, 1,
                        LV_GRID_ALIGN_STRETCH, 1, 1);
}

static void media_create_ctrl(lv_obj_t *page_obj) {
    lv_obj_t *obj = NULL;
    lv_obj_t *img_obj, *label_1_obj, *label_2_obj;
    lv_color_t bg_color = lv_color_hex(0x04171D);
    lv_color_t text_color = lv_color_hex(0xffffff);

    static lv_style_t style, text_style;

    lv_obj_set_style_bg_opa(page_obj, LV_OPA_TRANSP, 0);
    lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);

    lv_style_reset(&style);
    lv_style_init(&style);
    lv_style_set_bg_color(&style, bg_color);
    lv_style_set_border_color(&style, bg_color);
    lv_style_set_radius(&style, 0);

    lv_style_reset(&text_style);
    lv_style_init(&text_style);
    lv_style_set_width(&text_style, lv_pct(100));
    lv_style_set_text_font(&text_style, ttf_info_24.font);
    lv_style_set_text_color(&text_style, text_color);
    lv_style_set_text_align(&text_style, LV_TEXT_ALIGN_CENTER);

    media_lib_ctrl.bg_obj = lv_obj_create(page_obj);
    lv_obj_set_size(media_lib_ctrl.bg_obj, lv_pct(100) , lv_pct(100));
    lv_obj_align(media_lib_ctrl.bg_obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);
    lv_obj_add_style(media_lib_ctrl.bg_obj, &style, 0);

    media_lib_ctrl.menu_bar_obj = lv_obj_create(page_obj);
    lv_obj_set_size(media_lib_ctrl.menu_bar_obj, lv_pct(100) , lv_pct(100));
    lv_obj_align(media_lib_ctrl.menu_bar_obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);
    lv_obj_set_layout(media_lib_ctrl.menu_bar_obj, LV_LAYOUT_GRID);
    lv_obj_add_style(media_lib_ctrl.menu_bar_obj, &style, 0);

    media_lib_ctrl.exit_obj = lv_imgbtn_create(media_lib_ctrl.menu_bar_obj);
    lv_imgbtn_set_src(media_lib_ctrl.exit_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_r, NULL);
    lv_imgbtn_set_src(media_lib_ctrl.exit_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    lv_obj_set_size(media_lib_ctrl.exit_obj, index_icon_return_r->header.w, index_icon_return_r->header.h);
    lv_obj_add_event_cb(media_lib_ctrl.exit_obj, exit_cb, LV_EVENT_CLICKED, NULL);

    const void *img_src[] = {index_icon_video_f_01, index_icon_video_p_01,
                             index_icon_photo_01, index_icon_video_u_01};
    const char *text_src[] = {RES_STR_MEDIA_LIB_VIDEO_F, RES_STR_MEDIA_LIB_VIDEO_P,
                              RES_STR_MEDIA_LIB_PHOTO, RES_STR_MEDIA_LIB_VIDEO_U};
    const char *res_path[] = {STR_VIDEO_FRONT_PATH, STR_VIDEO_BACK_PATH,
                              STR_PHOTO_PATH, STR_URGENT_PATH};
    PLAYER_TYPE_E type[] = {PLAYER_TYPE_VIDEO, PLAYER_TYPE_VIDEO, PLAYER_TYPE_PHOTO, PLAYER_TYPE_VIDEO};

    static UI_PLAYLIST_INFO playlist_info[MEDIA_NUMBER_MAX];

    for (uint32_t i = 0; i < MEDIA_NUMBER_MAX; i++) {
        playlist_info[i].title = text_src[i];
        playlist_info[i].type = type[i];
        snprintf(playlist_info[i].res_path, sizeof(playlist_info[i].res_path), "%s%s", STR_MOUNT_PATH, res_path[i]);

        obj = lv_imgbtn_create(media_lib_ctrl.menu_bar_obj);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_bg_r, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_bg_p, NULL);
        lv_obj_set_size(obj, index_icon_bg_r->header.w, index_icon_bg_r->header.h);
        lv_obj_add_event_cb(obj, media_event_cb, LV_EVENT_CLICKED, (void *)&playlist_info[i]);
        media_lib_ctrl.options[i] = obj;

        img_obj = lv_img_create(obj);
        lv_img_set_src(img_obj, img_src[i]);
        lv_obj_center(img_obj);

        label_1_obj = lv_label_create(obj);
        lv_obj_add_style(label_1_obj, &text_style, 0);
        lv_obj_align_to(label_1_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);
        lv_label_set_text(label_1_obj, text_src[i]);

        label_2_obj = lv_label_create(obj);
        lv_obj_add_style(label_2_obj, &text_style, 0);
        lv_obj_align_to(label_2_obj, label_1_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);
        lv_label_set_text_fmt(label_2_obj, "%u", mpu_storage_get_filenum(playlist_info[i].res_path));
    }
}

static void media_destroy_ctrl(void) {
    ui_playlist_destroy_window();

    if (media_lib_ctrl.bg_obj) {
        ui_common_remove_stype_all(media_lib_ctrl.bg_obj);
        lv_obj_del(media_lib_ctrl.bg_obj);
        media_lib_ctrl.bg_obj = NULL;
    }

    if (media_lib_ctrl.menu_bar_obj) {
        ui_common_remove_stype_all(media_lib_ctrl.menu_bar_obj);
        lv_obj_del(media_lib_ctrl.menu_bar_obj);
        media_lib_ctrl.menu_bar_obj = NULL;
    }
}

static void media_page_create(lv_obj_t *page_obj) {
    media_create_ctrl(page_obj);
    media_layout();
}

static void media_page_enter(lv_obj_t *page_obj) {
    /* TODO */
}

static void media_page_exit(lv_obj_t *page_obj) {
    /* TODO */
}

static void media_page_destroy(lv_obj_t *page_obj) {
    media_destroy_ctrl();
}

static UI_PAGE_HANDLER_T settings_page = {
    .name = "media",
    .init = NULL,
    .create = media_page_create,
    .enter = media_page_enter,
    .destroy = media_page_destroy,
    .exit = media_page_exit
};

UI_PAGE_REGISTER(settings_page)