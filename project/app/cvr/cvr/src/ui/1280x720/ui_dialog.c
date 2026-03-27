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
#include "ui_dialog.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;

static lv_obj_t *dialog_obj = NULL;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
static void close_event_handler(lv_event_t * e);

void ui_dialog_destroy(void) {
    if (NULL != dialog_obj) {
        ui_common_remove_stype_all(dialog_obj);
        lv_obj_del(dialog_obj);
        dialog_obj = NULL;
    }
}

lv_obj_t * ui_dialog_create(const char *head_title, const char *content) {
    ui_dialog_destroy();

    lv_obj_t *obj = NULL;
    lv_obj_t *obj_bg = NULL;
    lv_color_t bg_color;
    lv_color_t text_color;

    text_color = lv_color_make(0XFF, 0XFF, 0XFF);
    bg_color = lv_color_hex(0xFF000000L);

    dialog_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, lv_pct(100), lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_50, 0);
    lv_obj_add_event_cb(obj, close_event_handler, LV_EVENT_CLICKED, dialog_obj);

    bg_color = lv_color_hex(0xFF222D30);
    obj_bg = obj = lv_obj_create(obj);
    lv_obj_set_size(obj, lv_pct(50) , lv_pct(50));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_80, 0);
    lv_obj_add_event_cb(obj, close_event_handler, LV_EVENT_CLICKED, dialog_obj);
    lv_obj_set_layout(obj, LV_LAYOUT_FLEX);
    lv_obj_set_flex_flow(obj, LV_FLEX_FLOW_COLUMN_WRAP);
    lv_obj_set_style_flex_main_place(obj, LV_FLEX_ALIGN_SPACE_EVENLY, 0);
    lv_obj_set_style_flex_cross_place(obj, LV_FLEX_ALIGN_CENTER, 0);

    obj = lv_label_create(obj_bg);
    lv_label_set_text(obj, head_title);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_SCROLL_CIRCULAR);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_size(obj, LV_PCT(100), LV_SIZE_CONTENT);

    obj = lv_label_create(obj_bg);
    lv_label_set_text(obj, LV_SYMBOL_WARNING);
    lv_obj_set_style_text_color(obj, lv_palette_main(LV_PALETTE_YELLOW), 0);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_IGNORE_LAYOUT);
    lv_obj_align(obj, LV_ALIGN_TOP_RIGHT, 0, 0);

    obj = lv_obj_create(obj_bg);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_side(obj, LV_BORDER_SIDE_TOP, 0);
    lv_obj_add_event_cb(obj, close_event_handler, LV_EVENT_CLICKED, dialog_obj);
    lv_obj_set_flex_grow(obj, 1);

    obj = lv_label_create(obj);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_WRAP);
    lv_label_set_text(obj, content);
    lv_obj_set_style_text_font(obj, ttf_info_28.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);

    return dialog_obj;
}

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void close_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    if(code == LV_EVENT_CLICKED) {
        ui_dialog_destroy();
    }
}