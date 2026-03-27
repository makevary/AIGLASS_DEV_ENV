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

#include "ui_languages.h"
#include "ui/common/ui_common.h"
#include "ui_resource_manage.h"
#include "ui_dialog_language.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static lv_obj_t *lang_set_obj = NULL;

static UI_LANG_SET_CB g_lang_set_cb = NULL;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;

static void lang_sel_event_handler(lv_event_t * e);
static void lang_close_event_handler(lv_event_t * e);

void ui_language_dialog_create(UI_LANG_SET_CB cb) {
    lv_obj_t *obj;
    lv_obj_t *obj_bg;
    lv_obj_t *context_obj;
    lv_color_t color;
    lv_color_t text_color;
    static lv_style_t style, style2;

    g_lang_set_cb = cb;

    lv_style_reset(&style);
    lv_style_init(&style);
    lv_style_set_layout(&style, LV_LAYOUT_FLEX);
    lv_style_set_flex_flow(&style, LV_FLEX_FLOW_COLUMN_WRAP);
    lv_style_set_flex_main_place(&style, LV_FLEX_ALIGN_SPACE_EVENLY);
    lv_style_set_flex_cross_place(&style, LV_FLEX_ALIGN_CENTER);

    lv_style_reset(&style2);
    lv_style_init(&style2);
    lv_style_set_layout(&style2, LV_LAYOUT_FLEX);
    lv_style_set_flex_flow(&style2, LV_FLEX_FLOW_ROW_WRAP);
    lv_style_set_flex_main_place(&style2, LV_FLEX_ALIGN_CENTER);
    lv_style_set_flex_cross_place(&style2, LV_FLEX_ALIGN_CENTER);

    color = lv_color_make(0X00, 0X00, 0X00);
    lang_set_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, lv_pct(100) , lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_50, 0);
    lv_obj_add_event_cb(obj, lang_close_event_handler, LV_EVENT_CLICKED, NULL);

    color = lv_color_make(0X22, 0X2D, 0X30);
    obj_bg = obj = lv_obj_create(obj);
    lv_obj_set_size(obj, lv_pct(50) , lv_pct(50));
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_80, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_add_style(obj, &style, 0);

    text_color = lv_color_make(0XFF, 0XFF, 0XFF);
    obj = lv_label_create(obj_bg);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_size(obj, lv_pct(100), LV_SIZE_CONTENT);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_LANG_TITLE);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_SCROLL_CIRCULAR);

    context_obj = obj = lv_obj_create(obj_bg);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_side(obj, LV_BORDER_SIDE_TOP, 0);
    lv_obj_add_style(obj, &style2, 0);
    lv_obj_add_event_cb(obj, lang_close_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_flex_grow(obj, 1);

    obj = lv_imgbtn_create(context_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_01, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_02, NULL);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_CLICKED, (void *)LANG_TYPE_CHINESE);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_FOCUSED, NULL);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_DEFOCUSED, NULL);
    lv_obj_set_size(obj, index_icon_set_btn_02->header.w, index_icon_set_btn_02->header.h);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK);

    text_color = lv_color_make(0X31, 0X31, 0X31);
    obj = lv_label_create(obj);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_LANG_SN);

    obj = lv_imgbtn_create(context_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_01, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_02, NULL);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_CLICKED, (void *)LANG_TYPE_ENGLISH);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_FOCUSED, NULL);
    lv_obj_add_event_cb(obj, lang_sel_event_handler, LV_EVENT_DEFOCUSED, NULL);
    lv_obj_set_size(obj, index_icon_set_btn_02->header.w, index_icon_set_btn_02->header.h);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_FLEX_IN_NEW_TRACK);

    text_color = lv_color_make(0X31, 0X31, 0X31);
    obj = lv_label_create(obj);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_label_set_text(obj, RES_STR_SETTINGS_BOX_LANG_EN);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void lang_close_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    if(code == LV_EVENT_CLICKED) {
        if (lang_set_obj) {
            ui_common_remove_stype_all(lang_set_obj);
            lv_obj_del(lang_set_obj);
            lang_set_obj = NULL;
        }
    }
}

static void lang_sel_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    LANG_TYPE_E lang_type = (int)lv_event_get_user_data(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        if (lang_set_obj) {
            ui_common_remove_stype_all(lang_set_obj);
            lv_obj_del(lang_set_obj);
            lang_set_obj = NULL;
        }

        ui_language_select(lang_type);

        if (NULL != g_lang_set_cb)
            g_lang_set_cb();

        g_lang_set_cb = NULL;
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_02, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_02, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_btn_01, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_btn_02, NULL);
    }
}