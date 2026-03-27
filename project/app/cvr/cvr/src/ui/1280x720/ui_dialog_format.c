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

#include "lvgl/common/lv_msg.h"
#include "ui/common/ui_common.h"
#include "ui_languages.h"
#include "ui_dialog_format.h"
#include "ui_resource_manage.h"
#include "mpu/mpu_storage.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static lv_obj_t *format_obj = NULL;
static lv_obj_t *format_ani_obj = NULL;

static FORMAT_DIALOG_CB g_extry_cb = NULL;
static FORMAT_DIALOG_CB g_exit_cb = NULL;
static void * g_format_handler = NULL;
/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void ui_format_dialog_destory();

/**********************
 *   STATIC FUNCTIONS
 **********************/
extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;


static void format_dialog_destroy_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        ui_format_dialog_destory();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_02, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_01, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    }
}

static bool start_formatting_handler(int32_t msg, void *wparam, void *lparam) {
    mpu_storage_format();

    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_set_var(&a, format_ani_obj);
    lv_anim_set_time(&a, 0);
    lv_anim_set_delay(&a, 1);
    lv_anim_set_ready_cb(&a, lv_obj_del_anim_ready_cb);
    lv_anim_start(&a);

    if (g_exit_cb)
        g_exit_cb();

    return true;
}

static void auto_del(void) {
    lv_obj_t *obj;
    lv_color_t color;
    color.full = 0xFF000000;

    format_ani_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, LV_HOR_RES , LV_VER_RES);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_50, 0);

    obj = lv_spinner_create(obj, 1000, 60);
    lv_obj_set_size(obj, 100, 100);
    lv_obj_center(obj);

    if (g_extry_cb)
        g_extry_cb();
    
    lv_send_msg(g_format_handler, 0, NULL, NULL);
}

static void format_start_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t *obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        ui_format_dialog_destory();
        auto_del();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_02, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_01, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    }
}

void ui_format_dialog_create(FORMAT_DIALOG_CB extry_cb,
                             FORMAT_DIALOG_CB exit_cb) {
    if (format_obj)
        return;

    lv_obj_t *obj;
    lv_obj_t *obj_bg;
    lv_obj_t *context_obj;
    lv_color_t color;
    lv_color_t text_color;
    static lv_style_t style1, style2;

    lv_style_reset(&style1);
    lv_style_init(&style1);
    lv_style_set_layout(&style1, LV_LAYOUT_FLEX);
    lv_style_set_flex_flow(&style1, LV_FLEX_FLOW_COLUMN_WRAP);
    lv_style_set_flex_main_place(&style1, LV_FLEX_ALIGN_SPACE_EVENLY);
    lv_style_set_flex_cross_place(&style1, LV_FLEX_ALIGN_CENTER);

    lv_style_reset(&style2);
    lv_style_init(&style2);
    lv_style_set_layout(&style2, LV_LAYOUT_FLEX);
    lv_style_set_flex_flow(&style2, LV_FLEX_FLOW_ROW_WRAP);
    lv_style_set_flex_main_place(&style2, LV_FLEX_ALIGN_CENTER);
    lv_style_set_flex_cross_place(&style2, LV_FLEX_ALIGN_CENTER);

    color = lv_color_make(0X00, 0X00, 0X00);
    format_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, lv_pct(100) , lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_50, 0);
    lv_obj_add_event_cb(obj, format_dialog_destroy_event_cb, LV_EVENT_CLICKED, NULL);

    color = lv_color_make(0X22, 0X2D, 0X30);
    obj_bg = obj = lv_obj_create(obj);
    lv_obj_set_size(obj, lv_pct(50) , lv_pct(50));
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_80, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_add_style(obj, &style1, 0);

    text_color = lv_color_make(0XFF, 0XFF, 0XFF);
    obj = lv_label_create(obj_bg);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_size(obj, lv_pct(100), LV_SIZE_CONTENT);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_FORMAT);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_SCROLL_CIRCULAR);

    context_obj = obj = lv_obj_create(obj_bg);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_side(obj, LV_BORDER_SIDE_TOP, 0);
    lv_obj_add_event_cb(obj, format_dialog_destroy_event_cb, LV_EVENT_CLICKED, NULL);
    lv_obj_set_flex_grow(obj, 1);

    text_color = lv_color_make(0XFF, 0XFF, 0XFF);
    obj = lv_label_create(context_obj);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_WRAP);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_FORMAT_INFO);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_TOP_MID, 0, 0);

    obj = lv_imgbtn_create(context_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_01, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    lv_obj_add_event_cb(obj, format_dialog_destroy_event_cb, LV_EVENT_CLICKED, (void *)0);
    lv_obj_add_event_cb(obj, format_dialog_destroy_event_cb, LV_EVENT_FOCUSED, NULL);
    lv_obj_add_event_cb(obj, format_dialog_destroy_event_cb, LV_EVENT_DEFOCUSED, NULL);
    lv_obj_set_size(obj, index_icon_set_btn_s_01->header.w, index_icon_set_btn_s_01->header.h);
    lv_obj_align(obj, LV_ALIGN_BOTTOM_LEFT, 0, 0);

    text_color = lv_color_make(0X31, 0X31, 0X31);
    obj = lv_label_create(obj);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_FORMAT_CANCEL);

    obj = lv_imgbtn_create(context_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_s_01, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_s_02, NULL);
    lv_obj_add_event_cb(obj, format_start_event_cb, LV_EVENT_CLICKED, (void *)0);
    lv_obj_add_event_cb(obj, format_start_event_cb, LV_EVENT_FOCUSED, NULL);
    lv_obj_add_event_cb(obj, format_start_event_cb, LV_EVENT_DEFOCUSED, NULL);
    lv_obj_set_size(obj, index_icon_set_btn_s_01->header.w, index_icon_set_btn_s_01->header.h);
    lv_obj_align(obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);

    text_color = lv_color_make(0X31, 0X31, 0X31);
    obj = lv_label_create(obj);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_FORMAT_OK);

    g_extry_cb = exit_cb, g_exit_cb = exit_cb;
    if (NULL == g_format_handler)
        g_format_handler = lv_msg_register_handler(start_formatting_handler);
}

void ui_format_dialog_destory() {
    if (format_obj) {
        ui_common_remove_stype_all(format_obj);
        lv_obj_del(format_obj);
        format_obj = NULL;
    }
}