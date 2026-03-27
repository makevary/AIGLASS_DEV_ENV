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
#include "ui/common/ui_page_manager.h"
#include "ui_resource_mgr.h"
#include "ui_dialog.h"
#include "ui_languages.h"
#include "ui_player.h"

#include "mpu/mpu_storage.h"
#include "mpu/mpu_disp.h"
#include "mpu/mpu_record.h"

#include "utils/log.h"

#include <stdio.h>
#include <time.h>
#include <stdint.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    UI_CTRL_VIDEO = 0,
    UI_CTRL_PHOTO,
    UI_CTRL_SWITCH,
    UI_CTRL_BUTT
} UI_CTRL_ID_E;

typedef struct {
    lv_obj_t *top_bar_obj;
    lv_obj_t *bottom_bar_obj;
    lv_obj_t *power_obj;
    lv_obj_t *state_obj;
    lv_obj_t *video_obj;
    lv_obj_t *sw_obj;
    lv_obj_t *photo_obj;

    lv_timer_t *timer;

    lv_group_t *group;

    RKADK_MOUNT_STATUS disk_state;

    uint32_t disp_cnt;
    uint32_t disp_index;
} ui_preview_context_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static ui_preview_context_t preview_ctx;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void format_window_destroy_cb(lv_anim_t * a) {
    if (NULL != a->var) {
        ui_common_remove_stype_all(a->var);
        lv_obj_del(a->var);
    }
}

static void format_window_create(void) {
    lv_obj_t *obj;
    lv_color_t color;
    lv_obj_t *format_ani_obj;

    color = lv_color_hex(0xFF000000);

    format_ani_obj = obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, LV_HOR_RES , LV_VER_RES);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
    lv_obj_set_style_bg_color(obj, color, 0);
    lv_obj_set_style_border_color(obj, color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_50, 0);

    obj = lv_spinner_create(obj, 1000, 60);
    lv_obj_set_size(obj, 50, 50);
    lv_obj_center(obj);

    mpu_storage_format();

    lv_anim_t a;
    lv_anim_init(&a);
    lv_anim_set_var(&a, format_ani_obj);
    lv_anim_set_time(&a, 0);
    lv_anim_set_delay(&a, 1);
    lv_anim_set_ready_cb(&a, format_window_destroy_cb);
    lv_anim_start(&a);
}

static void *disk_format_cb(bool is_apply) {
    if (true == is_apply)
        format_window_create();
    return NULL;
}

static RKADK_MOUNT_STATUS disk_state_handler(void) {
    RKADK_MOUNT_STATUS disk_state = mpu_storage_get_status();

    switch(disk_state) {
        case DISK_UNMOUNTED:
        case DISK_NOT_EXIST:
            ui_dialog_create(RES_STR_SETTINGS_STORE,
                             RES_STR_SETTINGS_BOX_NOSDCARD, NULL, false);
            break;
        case DISK_FORMAT_ERR:
        case DISK_NOT_FORMATTED:
            ui_dialog_create(RES_STR_SETTINGS_STORE,
                             RES_STR_SETTINGS_BOX_FORMAT_INFO, disk_format_cb, true);
            break;
        case DISK_SCANNING:
            ui_dialog_destroy();
            break;
        case DISK_MOUNTED:
            ui_dialog_destroy();
            break;
        default:
            break;
    }

    return disk_state;
}

static void timer_xcb(lv_timer_t *timer) {
    RKADK_MOUNT_STATUS disk_state = mpu_storage_get_status();
    if (preview_ctx.disk_state == disk_state)
        return ;
    
    preview_ctx.disk_state = disk_state;

    disk_state_handler();
}

static void menu_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);
    UI_CTRL_ID_E ctrl_id = (UI_CTRL_ID_E)lv_event_get_user_data(e);

    if (code == LV_EVENT_CLICKED) {
        switch (ctrl_id) {
            case UI_CTRL_VIDEO:
                if (DISK_MOUNTED == disk_state_handler())
                    ui_page_push_page("playlist", (void *)PLAYER_TYPE_VIDEO);
            break;

            case UI_CTRL_PHOTO:
                if (DISK_MOUNTED == disk_state_handler())
                    ui_page_push_page("playlist", (void *)PLAYER_TYPE_PHOTO);
            break;

            case UI_CTRL_SWITCH:
                if (1 >= preview_ctx.disp_cnt)
                    break;

                preview_ctx.disp_index += 1;
                preview_ctx.disp_index = preview_ctx.disp_index % preview_ctx.disp_cnt;

                mpu_disp_deinit();
                mpu_disp_init(preview_ctx.disp_index);
            break;

            default:
            break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
        lv_obj_set_style_outline_color(obj, lv_palette_lighten(LV_PALETTE_LIGHT_BLUE, 5), 0);
        lv_obj_set_style_outline_opa(obj, LV_OPA_COVER, 0);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_obj_set_style_outline_opa(obj, LV_OPA_TRANSP, 0);
    }
}

static void preview_create_ctrl(lv_obj_t *page_obj) {
    lv_obj_t *top_bar_obj = NULL;
    lv_obj_t *bottom_bar_obj = NULL;
    lv_obj_t *power_obj = NULL;
    lv_obj_t *state_obj = NULL;
    lv_obj_t *video_obj = NULL;
    lv_obj_t *sw_obj = NULL;
    lv_obj_t *photo_obj = NULL;

    static lv_style_t style;
    lv_style_reset(&style);
    lv_style_init(&style);
    lv_style_set_pad_all(&style, 5);
    lv_style_set_outline_width(&style, 2);
    lv_style_set_outline_opa(&style, LV_OPA_TRANSP);

    lv_obj_set_style_bg_opa(page_obj, LV_OPA_TRANSP, 0);
    lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);

    top_bar_obj = preview_ctx.top_bar_obj = lv_obj_create(page_obj);
    lv_obj_set_size(top_bar_obj, lv_pct(100), LV_SIZE_CONTENT);
    lv_obj_set_style_radius(top_bar_obj, 0, 0);
    lv_obj_set_style_bg_opa(top_bar_obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_opa(top_bar_obj, LV_OPA_TRANSP, 0);

    power_obj = preview_ctx.power_obj = lv_img_create(top_bar_obj);
    if (NULL != icon_power_mid_index)
        lv_img_set_src(power_obj, icon_power_mid_index);

    state_obj = preview_ctx.state_obj = lv_img_create(top_bar_obj);
    if (NULL != icon_record_start_index)
        lv_img_set_src(state_obj, icon_record_start_index);

    bottom_bar_obj = preview_ctx.bottom_bar_obj = lv_obj_create(page_obj);
    lv_obj_set_size(bottom_bar_obj, lv_pct(100), LV_SIZE_CONTENT);
    lv_obj_set_style_radius(bottom_bar_obj, 0, 0);
    lv_obj_set_style_bg_opa(bottom_bar_obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_opa(bottom_bar_obj, LV_OPA_TRANSP, 0);

    video_obj = preview_ctx.video_obj = lv_img_create(bottom_bar_obj);
    if (NULL != icon_media_index)
        lv_img_set_src(video_obj, icon_media_index);
    lv_obj_add_style(video_obj, &style, 0);
    lv_obj_add_event_cb(video_obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_VIDEO);
    lv_obj_add_event_cb(video_obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_VIDEO);
    lv_obj_add_event_cb(video_obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_VIDEO);

    photo_obj = preview_ctx.photo_obj = lv_img_create(bottom_bar_obj);
    if (NULL != icon_phone_index)
        lv_img_set_src(photo_obj, icon_phone_index);
    lv_obj_add_style(photo_obj, &style, 0);
    lv_obj_add_event_cb(photo_obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_PHOTO);
    lv_obj_add_event_cb(photo_obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_PHOTO);
    lv_obj_add_event_cb(photo_obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_PHOTO);

    sw_obj = preview_ctx.sw_obj = lv_img_create(bottom_bar_obj);
    if (NULL != icon_camera_switch_index)
        lv_img_set_src(sw_obj, icon_camera_switch_index);
    lv_obj_add_style(sw_obj, &style, 0);
    lv_obj_add_event_cb(sw_obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_SWITCH);
    lv_obj_add_event_cb(sw_obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_SWITCH);
    lv_obj_add_event_cb(sw_obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_SWITCH);

    preview_ctx.timer = lv_timer_create(timer_xcb, 1000, NULL);
    lv_timer_ready(preview_ctx.timer);
}

static void preview_layout_ctrl(lv_obj_t *page_obj) {
    static lv_coord_t col_dsc[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc[] = {LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    static lv_coord_t col_dsc_2[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_FR(3), LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc_2[] = {LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    lv_obj_t *top_bar_obj = preview_ctx.top_bar_obj;
    lv_obj_t *power_obj = preview_ctx.power_obj;
    lv_obj_t *state_obj = preview_ctx.state_obj;

    lv_obj_align(top_bar_obj, LV_ALIGN_TOP_MID, 0, 0);
    lv_obj_set_layout(top_bar_obj, LV_LAYOUT_GRID);
    lv_obj_set_style_grid_column_dsc_array(top_bar_obj, col_dsc, 0);
    lv_obj_set_style_grid_row_dsc_array(top_bar_obj, row_dsc, 0);
    lv_obj_set_grid_cell(power_obj, LV_GRID_ALIGN_CENTER, 3, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(state_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);

    lv_obj_t *bottom_bar_obj = preview_ctx.bottom_bar_obj;
    lv_obj_t *video_obj = preview_ctx.video_obj;
    lv_obj_t *sw_obj = preview_ctx.sw_obj;
    lv_obj_t *photo_obj = preview_ctx.photo_obj;

    lv_obj_align(bottom_bar_obj, LV_ALIGN_BOTTOM_MID, 0, 0);
    lv_obj_set_layout(bottom_bar_obj, LV_LAYOUT_GRID);
    lv_obj_set_style_grid_column_dsc_array(bottom_bar_obj, col_dsc_2, 0);
    lv_obj_set_style_grid_row_dsc_array(bottom_bar_obj, row_dsc_2, 0);
    lv_obj_set_grid_cell(video_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(photo_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(sw_obj, LV_GRID_ALIGN_CENTER, 3, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
}

static void preview_destroy_ctrl(void) {
    if (preview_ctx.timer) {
        lv_timer_del(preview_ctx.timer);
        preview_ctx.timer = NULL;
    }

    if (preview_ctx.bottom_bar_obj) {
        ui_common_remove_stype_all(preview_ctx.bottom_bar_obj);
        lv_obj_del(preview_ctx.bottom_bar_obj);
        preview_ctx.bottom_bar_obj = NULL;
    }

    if (preview_ctx.top_bar_obj) {
        ui_common_remove_stype_all(preview_ctx.top_bar_obj);
        lv_obj_del(preview_ctx.top_bar_obj);
        preview_ctx.top_bar_obj = NULL;
    }
}

static void preview_add_indev(void) {
    lv_group_t *group = lv_port_indev_group_create();
    if (NULL == group)
        return;

    lv_group_add_obj(group, preview_ctx.video_obj);
    lv_group_add_obj(group, preview_ctx.photo_obj);
    lv_group_add_obj(group, preview_ctx.sw_obj);

    preview_ctx.group = group;
}

static void preview_delete_indev(void) {
    if (NULL != preview_ctx.group) {
        lv_port_indev_group_destroy(preview_ctx.group);
        preview_ctx.group = NULL;
    }
}

static void preview_param_init(void) {
    preview_ctx.disk_state = DISK_MOUNT_BUTT;
    preview_ctx.disp_index = 0;
    preview_ctx.disp_cnt = mpu_disp_get_cnt();
}

static void preview_page_create(lv_obj_t *page_obj) {
    preview_param_init();
    preview_create_ctrl(page_obj);
    preview_layout_ctrl(page_obj);
}

static void preview_page_enter(lv_obj_t *page_obj) {
    mpu_disp_init(preview_ctx.disp_index);

    mpu_record_init();
    mpu_record_start(RECORD_ALL_CHN);

    preview_add_indev();
}

static void preview_page_exit(lv_obj_t *page_obj) {
    preview_delete_indev();

    mpu_record_stop(RECORD_ALL_CHN);
    mpu_record_deinit();

    mpu_disp_deinit();
}

static void preview_page_destroy(lv_obj_t *page_obj) {
    preview_destroy_ctrl();
}

static UI_PAGE_HANDLER_T preview_page = {
    .name = "main",
    .init = NULL,
    .create = preview_page_create,
    .enter = preview_page_enter,
    .destroy = preview_page_destroy,
    .exit = preview_page_exit
};

UI_PAGE_REGISTER(preview_page)