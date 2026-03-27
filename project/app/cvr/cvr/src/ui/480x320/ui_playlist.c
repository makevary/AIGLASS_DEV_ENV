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
#include "ui/common/ui_page_manager.h"
#include "ui/common/ui_common.h"
#include "ui_resource_mgr.h"
#include "ui_languages.h"
#include "ui_player.h"

#include "utils/log.h"

#include <stdio.h>
#include <time.h>
#include <limits.h>
#include <unistd.h>
#include <sys/stat.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    UI_CTRL_UP_ARROW = 0,
    UI_CTRL_DOWN_ARROW,
    UI_CTRL_SELECT,
    UI_CTRL_ESC,
    UI_CTRL_BUTT
} UI_CTRL_ID_E;

typedef struct {
    lv_group_t *group;
    lv_obj_t *menu_obj;
    lv_obj_t *up_obj;
    lv_obj_t *down_obj;
    lv_obj_t *select_obj;
    lv_obj_t *esc_obj;
    lv_obj_t *list_obj;

    const char *lable;
    lv_img_dsc_t *icon_lable;
    lv_obj_t *cur_btn;
    PLAYER_TYPE_E type;
    RKADK_FILE_LIST list;
} ui_playlist_context_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static lv_style_t style_btn;
static lv_style_t style_btn_pr;
static lv_style_t style_btn_chk;
static lv_style_t style_btn_dis;
static lv_style_t style_title;
static lv_style_t style_lable;
static lv_style_t style_time;

static ui_playlist_context_t playlist_ctx;
static int32_t orig_pos;

/**********************
 *      MACROS
 **********************/
#define LINE_NUM        20
#define LIST_ITEM_HEIGHT    50

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void list_btn_check_next() {
    if (NULL == playlist_ctx.cur_btn)
        return;

    lv_obj_t * next_btn_obj = NULL, *cur_btn_obj = NULL;
    int32_t cur_btn_id, next_btn_id;

    cur_btn_obj = playlist_ctx.cur_btn;
    cur_btn_id = lv_obj_get_index(cur_btn_obj);

    next_btn_id = cur_btn_id + 1;
    next_btn_obj = lv_obj_get_child(playlist_ctx.list_obj, next_btn_id);
    if (NULL == next_btn_obj)
        return;

    playlist_ctx.cur_btn = next_btn_obj;
    lv_obj_remove_style(cur_btn_obj, &style_btn_chk, 0);
    lv_obj_add_style(next_btn_obj, &style_btn_chk, 0);
    lv_obj_scroll_to_view(next_btn_obj, LV_ANIM_OFF);
}

static void list_btn_check_prev() {
    if (NULL == playlist_ctx.cur_btn)
        return;

    lv_obj_t * next_btn_obj = NULL, *cur_btn_obj = NULL;
    int32_t cur_btn_id, next_btn_id;

    cur_btn_obj = playlist_ctx.cur_btn;
    cur_btn_id = lv_obj_get_index(cur_btn_obj);

    next_btn_id = cur_btn_id - 1;
    if (0 > next_btn_id)
        return;

    next_btn_obj = lv_obj_get_child(playlist_ctx.list_obj, next_btn_id);
    if (NULL == next_btn_obj)
        return;

    playlist_ctx.cur_btn = next_btn_obj;
    lv_obj_remove_style(cur_btn_obj, &style_btn_chk, 0);
    lv_obj_add_style(next_btn_obj, &style_btn_chk, 0);
    lv_obj_scroll_to_view(next_btn_obj, LV_ANIM_OFF);
}

static void btn_click_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);
    uint32_t track_id = (uint32_t)lv_obj_get_user_data(obj);

    if (code == LV_EVENT_CLICKED) {
        player_file_info_t file_info;
        memset(&file_info, 0, sizeof(file_info));

        if (track_id < playlist_ctx.list.s32FileNum) {
            file_info.type = playlist_ctx.type;
            snprintf(file_info.path, sizeof(file_info.path), "%s%s",
                     playlist_ctx.list.path, playlist_ctx.list.file[track_id].filename);
            if (PLAYER_TYPE_PHOTO == playlist_ctx.type)
                ui_page_push_page("photo_player", &file_info);
            else if (PLAYER_TYPE_VIDEO == playlist_ctx.type)
                ui_page_push_page("video_player", &file_info);
        }
    }
}

static lv_obj_t * add_list_btn(lv_obj_t * parent, uint32_t track_id) {
    const char * title = playlist_ctx.list.file[track_id].filename;
    const char * lable = playlist_ctx.lable;

    lv_obj_t * btn = lv_obj_create(parent);
    lv_obj_remove_style_all(btn);
    lv_obj_set_size(btn, lv_pct(100), LIST_ITEM_HEIGHT);
    lv_obj_set_pos(btn, 0, LIST_ITEM_HEIGHT * track_id);
    lv_obj_set_user_data(btn, (void *)track_id);
    lv_obj_add_style(btn, &style_btn, 0);
    lv_obj_add_event_cb(btn, btn_click_event_cb, LV_EVENT_CLICKED, NULL);

    lv_obj_t * icon = lv_img_create(btn);
    lv_obj_set_style_pad_hor(icon, 10, 0);
    if (NULL != icon_play_btn_index)
        lv_img_set_src(icon, icon_play_btn_index);
    lv_obj_set_grid_cell(icon, LV_GRID_ALIGN_CENTER, 0, 1, LV_GRID_ALIGN_CENTER, 0, 2);

    lv_obj_t * title_obj = lv_label_create(btn);
    lv_label_set_text(title_obj, title);
    lv_obj_set_grid_cell(title_obj, LV_GRID_ALIGN_START, 1, 1, LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_add_style(title_obj, &style_title, 0);

    lv_obj_t * label_obj = lv_label_create(btn);
    lv_label_set_text(label_obj, lable);
    lv_obj_set_grid_cell(label_obj, LV_GRID_ALIGN_START, 1, 1, LV_GRID_ALIGN_CENTER, 1, 1);
    lv_obj_add_style(label_obj, &style_lable, 0);

    return btn;
}

static void scroll_event_cb(lv_event_t * e) {
    lv_obj_t * child = NULL;
    int32_t step_size = 0;
    int32_t new_pos = 0;
    lv_obj_t * obj = lv_event_get_target(e);

    if (obj->spec_attr->scroll.y < 0)
        new_pos = (lv_obj_get_scroll_y(obj) + LIST_ITEM_HEIGHT - 1) / LIST_ITEM_HEIGHT;

    if (new_pos < (LINE_NUM >> 1))
        return;

    step_size = new_pos - orig_pos;
    if (0 == step_size)
        return;

    if (step_size > 0) {
        int32_t actual_step_size = 0;
        uint32_t track_id = 0;

        child = lv_obj_get_child(obj, -1);
        track_id = (uint32_t)lv_obj_get_user_data(child);
        while (++track_id < playlist_ctx.list.s32FileNum && actual_step_size < step_size) {
            actual_step_size++;
            add_list_btn(playlist_ctx.list_obj, track_id);
        }

        if (0 != actual_step_size)
            orig_pos += actual_step_size;

        while ((actual_step_size--) > 0) {
            child = lv_obj_get_child(obj, 0);
            ui_common_remove_stype_all(child);
            lv_obj_del(child);
        }

        return;
    } else {
        int32_t actual_step_size = 0;
        uint32_t track_id = 0;

        child = lv_obj_get_child(obj, 0);
        track_id = (uint32_t)lv_obj_get_user_data(child);

        while (--track_id >= 0 && actual_step_size > step_size) {
            actual_step_size--;
            child = add_list_btn(playlist_ctx.list_obj, track_id);
            lv_obj_move_to_index(child, 0);
        }

        if (0 != actual_step_size)
            orig_pos += actual_step_size;

        while ((actual_step_size++) < 0) {
            child = lv_obj_get_child(obj, -1);
            ui_common_remove_stype_all(child);
            lv_obj_del(child);
        }

        return;
    }
}

static void menu_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);
    UI_CTRL_ID_E ctrl_id = (UI_CTRL_ID_E)lv_event_get_user_data(e);

    if (code == LV_EVENT_CLICKED) {
        switch (ctrl_id) {
            case UI_CTRL_UP_ARROW:
                list_btn_check_prev();
            break;

            case UI_CTRL_DOWN_ARROW:
                list_btn_check_next();
            break;

            case UI_CTRL_SELECT:
                if (NULL != playlist_ctx.cur_btn)
                    lv_event_send(playlist_ctx.cur_btn, LV_EVENT_CLICKED, NULL);
            break;

            case UI_CTRL_ESC:
                ui_page_pop_page();
            break;

            default:
            break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
        lv_obj_set_style_img_opa(obj, LV_OPA_COVER, 0);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_obj_set_style_img_opa(obj, LV_OPA_20, 0);
    }
}

static void playlist_layout_ctrl(lv_obj_t *page_obj) {
    lv_obj_t *obj = NULL;
    static const lv_coord_t page_cols[] = {LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static const lv_coord_t page_rows[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    obj = page_obj;
    lv_obj_set_grid_dsc_array(obj, page_cols, page_rows);
    lv_obj_set_style_layout(obj, LV_LAYOUT_GRID, 0);
    lv_obj_set_grid_cell(playlist_ctx.menu_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctx.list_obj, LV_GRID_ALIGN_STRETCH, 0, 1,
                         LV_GRID_ALIGN_STRETCH, 1, 1);

    static const lv_coord_t menu_cols[] = {LV_GRID_CONTENT, LV_GRID_CONTENT, LV_GRID_CONTENT, LV_GRID_FR(3), LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};
    static const lv_coord_t menu_rows[] = {LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};

    obj = playlist_ctx.menu_obj;
    lv_obj_set_grid_dsc_array(obj, menu_cols, menu_rows);
    lv_obj_set_style_layout(obj, LV_LAYOUT_GRID, 0);
    lv_obj_set_grid_cell(playlist_ctx.up_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctx.down_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctx.select_obj, LV_GRID_ALIGN_CENTER, 2, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctx.esc_obj, LV_GRID_ALIGN_END, 4, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
}

static void playlist_create_ctrl(lv_obj_t *page_obj) {
    lv_obj_t *obj = NULL;

    static const lv_coord_t grid_cols[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};
    static const lv_coord_t grid_rows[] = {LV_GRID_CONTENT, LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};

    obj = page_obj;
    lv_obj_set_style_bg_color(obj, lv_color_hex(0x343247), 0);

    playlist_ctx.menu_obj = obj = lv_obj_create(page_obj);
    lv_obj_set_size(obj, LV_HOR_RES, LV_SIZE_CONTENT);
    lv_obj_set_style_bg_color(obj, lv_color_hex(0xFF04171D), 0);
    lv_obj_set_style_border_width(obj, 0, 0);
    lv_obj_set_style_radius(obj, 0, 0);

    playlist_ctx.up_obj = obj = lv_img_create(playlist_ctx.menu_obj);
    if (NULL != icon_up_arrow)
        lv_img_set_src(obj, icon_up_arrow);
    lv_obj_set_style_img_opa(obj, LV_OPA_40, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_UP_ARROW);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_UP_ARROW);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_UP_ARROW);

    playlist_ctx.down_obj = obj = lv_img_create(playlist_ctx.menu_obj);
    if (NULL != icon_down_arrow)
        lv_img_set_src(obj, icon_down_arrow);
    lv_obj_set_style_img_opa(obj, LV_OPA_40, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_DOWN_ARROW);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_DOWN_ARROW);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_DOWN_ARROW);

    playlist_ctx.select_obj = obj = lv_img_create(playlist_ctx.menu_obj);
    if (NULL != icon_selection_index)
        lv_img_set_src(obj, icon_selection_index);
    lv_obj_set_style_img_opa(obj, LV_OPA_40, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_SELECT);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_SELECT);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_SELECT);

    playlist_ctx.esc_obj = obj = lv_img_create(playlist_ctx.menu_obj);
    if (NULL != icon_esc_index)
        lv_img_set_src(obj, icon_esc_index);
    lv_obj_set_style_img_opa(obj, LV_OPA_40, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)UI_CTRL_ESC);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)UI_CTRL_ESC);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)UI_CTRL_ESC);

    static lv_style_t style_scrollbar;
    lv_style_reset(&style_scrollbar);
    lv_style_init(&style_scrollbar);
    lv_style_set_width(&style_scrollbar, 4);
    lv_style_set_bg_opa(&style_scrollbar, LV_OPA_COVER);
    lv_style_set_bg_color(&style_scrollbar, lv_color_hex3(0xeee));
    lv_style_set_radius(&style_scrollbar, LV_RADIUS_CIRCLE);
    lv_style_set_pad_right(&style_scrollbar, 4);

    /*Create an empty transparent container*/
    playlist_ctx.list_obj = obj = lv_obj_create(page_obj);
    lv_obj_remove_style_all(obj);
    lv_obj_set_width(obj, LV_HOR_RES);
    lv_obj_add_style(obj, &style_scrollbar, LV_PART_SCROLLBAR);
    lv_obj_add_event_cb(obj, scroll_event_cb, LV_EVENT_SCROLL, NULL);

    lv_style_reset(&style_btn);
    lv_style_init(&style_btn);
    lv_style_set_bg_opa(&style_btn, LV_OPA_TRANSP);
    lv_style_set_grid_column_dsc_array(&style_btn, grid_cols);
    lv_style_set_grid_row_dsc_array(&style_btn, grid_rows);
    lv_style_set_grid_row_align(&style_btn, LV_GRID_ALIGN_CENTER);
    lv_style_set_layout(&style_btn, LV_LAYOUT_GRID);
    lv_style_set_pad_right(&style_btn, 20);

    lv_style_reset(&style_btn_pr);
    lv_style_init(&style_btn_pr);
    lv_style_set_bg_opa(&style_btn_pr, LV_OPA_COVER);
    lv_style_set_bg_color(&style_btn_pr,  lv_color_hex(0x4c4965));

    lv_style_reset(&style_btn_chk);
    lv_style_init(&style_btn_chk);
    lv_style_set_bg_opa(&style_btn_chk, LV_OPA_COVER);
    lv_style_set_bg_color(&style_btn_chk, lv_color_hex(0x4c4965));

    lv_style_reset(&style_btn_dis);
    lv_style_init(&style_btn_dis);
    lv_style_set_text_opa(&style_btn_dis, LV_OPA_40);
    lv_style_set_img_opa(&style_btn_dis, LV_OPA_40);

    lv_style_reset(&style_title);
    lv_style_init(&style_title);
    lv_style_set_text_color(&style_title, lv_color_hex(0xffffff));

    lv_style_reset(&style_lable);
    lv_style_init(&style_lable);
    if (NULL != ui_font_content.font)
        lv_style_set_text_font(&style_lable, ui_font_content.font);
    lv_style_set_text_color(&style_lable,lv_color_hex(0xb1b0be));

    lv_style_reset(&style_time);
    lv_style_init(&style_time);
    lv_style_set_text_color(&style_time, lv_color_hex(0xffffff));
}

static void playlist_add_indev(void) {
    lv_group_t *group = lv_port_indev_group_create();
    if (NULL == group)
        return;

    lv_group_add_obj(group, playlist_ctx.up_obj);
    lv_group_add_obj(group, playlist_ctx.down_obj);
    lv_group_add_obj(group, playlist_ctx.select_obj);
    lv_group_add_obj(group, playlist_ctx.esc_obj);

    playlist_ctx.group = group;
}

static void playlist_delete_indev(void) {
    if (NULL != playlist_ctx.group) {
        lv_port_indev_group_destroy(playlist_ctx.group);
        playlist_ctx.group = NULL;
    }
}

static void playlist_destroy_ctrl(lv_obj_t *page_obj) {
    if (NULL != playlist_ctx.menu_obj) {
        ui_common_remove_stype_all(playlist_ctx.menu_obj);
        lv_obj_del(playlist_ctx.menu_obj);
        playlist_ctx.menu_obj = NULL;
    }

    if (NULL != playlist_ctx.list_obj) {
        ui_common_remove_stype_all(playlist_ctx.list_obj);
        lv_obj_del(playlist_ctx.list_obj);
        playlist_ctx.list_obj = NULL;
    }

    ui_common_remove_stype_all(page_obj);
}

static bool file_filter_cb(const char *filename) {
    struct stat st;
    char file_path[PATH_MAX] = {'\0'};
    snprintf(file_path, sizeof(file_path), "%s%s", playlist_ctx.list.path, filename);
    return ((NULL == strstr(filename, "sub")) || (0 == stat(filename, &st))) ? false : true;
}

static int32_t playlist_param_init(lv_obj_t *page_obj) {
    int32_t ret;
    PLAYER_TYPE_E type = (uint32_t)lv_obj_get_user_data(page_obj);
    uint32_t index = (PLAYER_TYPE_PHOTO == type) ? 2 : 0;

    const char *res_path[] = {STR_VIDEO_FRONT_PATH, STR_VIDEO_BACK_PATH,
                              STR_PHOTO_PATH, STR_URGENT_PATH};

    const char *lable[] = {RES_STR_MEDIA_LIB_VIDEO_F, RES_STR_MEDIA_LIB_VIDEO_P,
                           RES_STR_MEDIA_LIB_PHOTO, RES_STR_MEDIA_LIB_VIDEO_U};

    playlist_ctx.cur_btn = NULL;
    playlist_ctx.lable = lable[index];
    playlist_ctx.type = type;

    orig_pos = (LINE_NUM >> 1);

    snprintf(playlist_ctx.list.path, sizeof(playlist_ctx.list.path), "%s%s", STR_MOUNT_PATH, res_path[index]);
    if (0 >= mpu_storage_get_filenum(playlist_ctx.list.path)) {
        CVR_WARN("File list not obtained.\n");
        return 0;
    }

    if (PLAYER_TYPE_VIDEO == type)
        ret = mpu_storage_get_file_list(&playlist_ctx.list, LIST_DESCENDING, file_filter_cb);
    else
        ret = mpu_storage_get_file_list(&playlist_ctx.list, LIST_DESCENDING, NULL);

   if (0 != ret) {
        CVR_ERR("Failed to get playlist!\n");
        return -1;
    }

    return 0;
}

static void playlist_param_deinit(void) {
    mpu_storage_free_file_list(&playlist_ctx.list);

    memset(&playlist_ctx, 0, sizeof(playlist_ctx));
}

static int32_t playlist_load_list(void) {
    uint32_t track_id = 0;
    for (track_id = 0; (track_id < playlist_ctx.list.s32FileNum) && (track_id < LINE_NUM); track_id++)
        add_list_btn(playlist_ctx.list_obj, track_id);

    if (playlist_ctx.list.s32FileNum > 0) {
        playlist_ctx.cur_btn = lv_obj_get_child(playlist_ctx.list_obj, 0);
        lv_obj_add_style(playlist_ctx.cur_btn, &style_btn_chk, 0);
    }

    return 0;
}

static void playlist_page_create(lv_obj_t *page_obj) {
    playlist_param_init(page_obj);

    playlist_create_ctrl(page_obj);
    playlist_layout_ctrl(page_obj);

    playlist_load_list();
}

static void playlist_page_enter(lv_obj_t *page_obj) {
    playlist_add_indev();
}

static void playlit_page_exit(lv_obj_t *page_obj) {
    playlist_delete_indev();
}

static void playlist_page_destroy(lv_obj_t *page_obj) {
    playlist_destroy_ctrl(page_obj);
    playlist_param_deinit();
}

static UI_PAGE_HANDLER_T playlist_page = {
    .name = "playlist",
    .init = NULL,
    .create = playlist_page_create,
    .enter = playlist_page_enter,
    .destroy = playlist_page_destroy,
    .exit = playlit_page_exit
};

UI_PAGE_REGISTER(playlist_page)