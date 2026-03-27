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

#include "lvgl/porting/lv_port_indev.h"
#include "ui/common/ui_common.h"
#include "ui_dialog.h"
#include "ui_resource_mgr.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    lv_obj_t *dialog_obj;
    lv_obj_t *context_obj;
    lv_obj_t *ok_obj;
    lv_obj_t *close_obj;

    bool add_close_btn;

    void *(*result_cb)(bool is_apply);

    lv_group_t *group;
} ui_dialog_ctrl_s;

/**********************
 *  STATIC VARIABLES
 **********************/
static ui_dialog_ctrl_s dialog_ctrl;

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void close_event_cb(lv_event_t * e);
static void dialog_add_indev(void);
static void dialog_delete_indev(void);
static void dialog_create_ctrl(const char *head_title,
                               const char *content,
                               void *(*result_cb)(bool is_apply),
                               bool add_close_btn);
static void dialog_destroy_ctrl(void);

static void dialog_add_indev(void) {
    lv_group_t *group = lv_port_indev_group_create();
    if (NULL == group)
        return;

    if (true == dialog_ctrl.add_close_btn) {
        lv_group_add_obj(group, dialog_ctrl.close_obj);
        lv_group_add_obj(group, dialog_ctrl.ok_obj);
    } else {
        lv_group_add_obj(group, dialog_ctrl.dialog_obj);
    }

    dialog_ctrl.group = group;
}

static void dialog_delete_indev(void) {
    if (NULL != dialog_ctrl.group) {
        lv_port_indev_group_destroy(dialog_ctrl.group);
        dialog_ctrl.group = NULL;
    }
}

static void close_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    if (code == LV_EVENT_CLICKED) {
        dialog_delete_indev();
        dialog_destroy_ctrl();
        if (NULL != dialog_ctrl.result_cb)
            dialog_ctrl.result_cb(true);

        memset(&dialog_ctrl, 0, sizeof(dialog_ctrl));
    }
}

static void select_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);
    bool is_apply = (bool)lv_event_get_user_data(e);

    if (code == LV_EVENT_CLICKED) {
        dialog_delete_indev();
        dialog_destroy_ctrl();
        if (NULL != dialog_ctrl.result_cb)
            dialog_ctrl.result_cb(is_apply);

        memset(&dialog_ctrl, 0, sizeof(dialog_ctrl));
    } else if (code == LV_EVENT_FOCUSED) {
        lv_obj_set_style_outline_color(obj, lv_palette_lighten(LV_PALETTE_LIGHT_BLUE, 5), 0);
        lv_obj_set_style_outline_opa(obj, LV_OPA_COVER, 0);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_obj_set_style_outline_opa(obj, LV_OPA_TRANSP, 0);
    }
}

static void dialog_create_ctrl(const char *head_title,
                               const char *content,
                               void *(*result_cb)(bool is_apply),
                               bool add_close_btn) {
    lv_obj_t *obj = NULL;
    lv_obj_t *context = NULL;
    lv_obj_t *dialog_obj = NULL;
    lv_color_t bg_color;
    lv_color_t text_color;

    text_color = lv_color_make(0XFF, 0XFF, 0XFF);
    bg_color = lv_color_hex(0xFF222D30);

    dialog_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, lv_pct(70) , lv_pct(50));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_80, 0);
    lv_obj_add_event_cb(obj, close_event_cb, LV_EVENT_CLICKED, NULL);
    lv_obj_set_layout(obj, LV_LAYOUT_FLEX);
    lv_obj_set_flex_flow(obj, LV_FLEX_FLOW_COLUMN_WRAP);
    lv_obj_set_style_flex_main_place(obj, LV_FLEX_ALIGN_SPACE_EVENLY, 0);
    lv_obj_set_style_flex_cross_place(obj, LV_FLEX_ALIGN_CENTER, 0);

    obj = lv_label_create(dialog_obj);
    lv_label_set_text(obj, head_title);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_SCROLL_CIRCULAR);
    lv_obj_set_style_text_font(obj, ui_font_content.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_size(obj, LV_PCT(100), LV_SIZE_CONTENT);

    obj = lv_label_create(dialog_obj);
    lv_label_set_text(obj, LV_SYMBOL_WARNING);
    lv_obj_set_style_text_color(obj, lv_palette_main(LV_PALETTE_YELLOW), 0);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_IGNORE_LAYOUT);
    lv_obj_align(obj, LV_ALIGN_TOP_RIGHT, 0, 0);

    context = obj = lv_obj_create(dialog_obj);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_side(obj, LV_BORDER_SIDE_TOP, 0);
    lv_obj_set_flex_grow(obj, 1);

    obj = lv_label_create(context);
    lv_label_set_long_mode(obj, LV_LABEL_LONG_WRAP);
    lv_label_set_text(obj, content);
    lv_obj_set_style_text_font(obj, ui_font_content.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_width(obj, lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);

    if (true == add_close_btn) {
        lv_obj_t *ok_obj = NULL;
        lv_obj_t *close_obj = NULL;

        static lv_style_t style;
        lv_style_reset(&style);
        lv_style_init(&style);
        lv_style_set_pad_all(&style, 5);
        lv_style_set_outline_width(&style, 2);
        lv_style_set_outline_opa(&style, LV_OPA_TRANSP);

        close_obj = obj = lv_label_create(dialog_obj);
        lv_obj_add_style(obj, &style, 0);
        lv_label_set_text(obj, LV_SYMBOL_CLOSE);
        lv_obj_set_style_text_color(obj, lv_palette_main(LV_PALETTE_RED), 0);
        lv_obj_add_flag(obj, LV_OBJ_FLAG_IGNORE_LAYOUT);
        lv_obj_align(obj, LV_ALIGN_BOTTOM_LEFT, 0, 0);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_CLICKED, (void *)false);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_FOCUSED, (void *)false);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_DEFOCUSED, (void *)false);

        ok_obj = obj = lv_label_create(dialog_obj);
        lv_obj_add_style(obj, &style, 0);
        lv_label_set_text(obj, LV_SYMBOL_OK);
        lv_obj_set_style_text_color(obj, lv_palette_main(LV_PALETTE_BLUE), 0);
        lv_obj_add_flag(obj, LV_OBJ_FLAG_IGNORE_LAYOUT);
        lv_obj_align(obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_CLICKED, (void *)true);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_FOCUSED, (void *)true);
        lv_obj_add_event_cb(obj, select_event_cb, LV_EVENT_DEFOCUSED, (void *)true);

        dialog_ctrl.ok_obj = ok_obj;
        dialog_ctrl.close_obj = close_obj;
    }

    dialog_ctrl.dialog_obj = dialog_obj;
    dialog_ctrl.add_close_btn = add_close_btn;
    dialog_ctrl.result_cb = result_cb;
}

static void dialog_destroy_ctrl(void) {
    ui_common_remove_stype_all(dialog_ctrl.dialog_obj);
    lv_obj_del(dialog_ctrl.dialog_obj);
    dialog_ctrl.dialog_obj = NULL;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void ui_dialog_destroy(void) {
    if (NULL != dialog_ctrl.dialog_obj)
        lv_event_send(dialog_ctrl.dialog_obj, LV_EVENT_CLICKED, NULL);
}

int32_t ui_dialog_create(const char *head_title,
                         const char *content,
                         void *(*result_cb)(bool is_apply),
                         bool add_close_btn) {
    ui_dialog_destroy();

    dialog_create_ctrl(head_title, content, result_cb, add_close_btn);
    dialog_add_indev();

    return 0;
}