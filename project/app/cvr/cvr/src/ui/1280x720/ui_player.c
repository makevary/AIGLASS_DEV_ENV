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
#include "ui_languages.h"
#include "ui_playlist.h"
#include "ui_player.h"
#include "ui_resource_manage.h"
#include "mpu/mpu_photo.h"
#include "mpu/mpu_record.h"
#include "mpu/mpu_player.h"
#include "mpu/sys/mpu_sys.h"
#include "utils/log.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <time.h>
#include <sys/time.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

typedef enum {
    UI_PLAYER_STATE_IDLE = 0, /**< The player state before init . */
    UI_PLAYER_STATE_INIT, /**< The player is in the initial state. It changes
                                to the initial state after being SetDataSource. */
    UI_PLAYER_STATE_PREPARED, /**< The player is in the prepared state. */
    UI_PLAYER_STATE_PLAY,     /**< The player is in the playing state. */
    UI_PLAYER_STATE_PAUSE,    /**< The player is in the pause state. */
    UI_PLAYER_STATE_EOF,
    UI_PLAYER_STATE_ERR,      /**< The player is in the err state. */
    UI_PLAYER_STATE_BUTT
} UI_PLAYER_STATUS_E;

typedef struct {
    lv_obj_t *parent_window_obj;
    RKADK_RECT_S play_area;
    PLAYER_TYPE_E type;
    union {
        struct {
            lv_timer_t *timer;
            lv_obj_t *name_obj;
            lv_obj_t *slider_obj;
            lv_obj_t *cur_time_obj;
            lv_obj_t *total_time_obj;
            lv_obj_t *pause_obj;

            UI_PLAYER_STATUS_E player_state;
        } video;

        struct {
            lv_obj_t *name_obj;
            lv_obj_t *photo_obj;
            lv_img_dsc_t img_data;
        } photo;
    };
} UI_PLAYER_CONTEXT_S;

/**********************
 *  STATIC VARIABLES
 **********************/
extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;

static UI_PLAYER_FILE_INFO_S g_play_file_info;
static RKADK_PLAYER_EVENT_E player_event = RKADK_PLAYER_EVENT_BUTT;
static UI_PLAYER_STATUS_E player_state = UI_PLAYER_STATE_BUTT;
static UI_PLAYER_CONTEXT_S player_ctx;

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void update_play_progress(void) {
    char str_time[32] = {0};
    int64_t cur_time = 0;

    memset(str_time, 0, sizeof(str_time));

    cur_time = mpu_player_get_duration_position();
    cur_time = cur_time / 1000 + ((cur_time % 1000) ? 1 : 0);

    if (false == lv_obj_has_state(player_ctx.video.slider_obj, LV_STATE_PRESSED))
        lv_slider_set_value(player_ctx.video.slider_obj, cur_time, LV_ANIM_OFF);

    sprintf(str_time, "%02lld:%02lld", cur_time / 60, cur_time % 60);
    lv_label_set_text(player_ctx.video.cur_time_obj, str_time);
}

static int32_t player_set_area(RKADK_RECT_S *play_area) {
    if (NULL == play_area) {
        CVR_ERR("Invalid input parameter.\n");
        return -1;
    }

    lv_area_t area;
    int32_t x, y, w, h;

    memset(&area, 0, sizeof(area));

    lv_obj_refr_pos(player_ctx.parent_window_obj);
    lv_obj_refresh_self_size(player_ctx.parent_window_obj);
    lv_obj_update_layout(player_ctx.parent_window_obj);
    lv_obj_get_content_coords(player_ctx.parent_window_obj, &area);

    h = area.x2 - area.x1;
    h = DOWNALIGNTO_16(h);
    w = DOWNALIGNTO_16(h * 9 / 16);
    x = area.y1 + ((area.y2 - area.y1) >> 1) - (w >> 1) + 1;
    y = area.x1;

    play_area->u32X = x;
    play_area->u32Y = y;
    play_area->u32Width = w;
    play_area->u32Height = h;

    return 0;
}

static RKADK_VOID player_event_cb(RKADK_MW_PTR Player,
                                  RKADK_PLAYER_EVENT_E enEvent,
                                  RKADK_VOID *pData) {
    player_event = enEvent;
}

static void player_event_handler(RKADK_PLAYER_EVENT_E enEvent) {
    switch (enEvent) {
        case RKADK_PLAYER_EVENT_STATE_CHANGED:
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_STATE_CHANGED +++++\n");
            break;
        case RKADK_PLAYER_EVENT_EOF:
            player_state = UI_PLAYER_STATE_EOF;
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_EOF +++++\n");
            update_play_progress();
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_RELEASED, NULL,  index_icon_player_play, NULL);
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_PRESSED, NULL,  index_icon_player_play_p, NULL);
            mpu_player_pause();
            break;
        case RKADK_PLAYER_EVENT_SOF:
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_SOF +++++\n");
            break;
        case RKADK_PLAYER_EVENT_SEEK_END:
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_SEEK_END +++++\n");
            break;
        case RKADK_PLAYER_EVENT_ERROR:
            player_state = UI_PLAYER_STATE_ERR;
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_ERROR +++++\n");
            break;
        case RKADK_PLAYER_EVENT_PREPARED:
            player_state = UI_PLAYER_STATE_PREPARED;
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_PREPARED +++++\n");
            break;
        case RKADK_PLAYER_EVENT_PLAY:
            player_state = UI_PLAYER_STATE_PLAY;
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_PLAY +++++\n");
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_RELEASED, NULL,   index_icon_player_stop, NULL);
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_PRESSED, NULL,   index_icon_player_stop_p, NULL);
            break;
        case RKADK_PLAYER_EVENT_PAUSED:
            player_state = UI_PLAYER_STATE_PAUSE;
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_PAUSED +++++\n");
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_RELEASED, NULL,  index_icon_player_play, NULL);
            lv_imgbtn_set_src(player_ctx.video.pause_obj, LV_IMGBTN_STATE_PRESSED, NULL,  index_icon_player_play_p, NULL);
            break;
        case RKADK_PLAYER_EVENT_STOPPED:
            CVR_INFO("+++++ RKADK_PLAYER_EVENT_STOPPED +++++\n");
            break;
        default:
            CVR_INFO("+++++ Unknown event(%d) +++++\n", enEvent);
            break;
    }
}

static void time_handler(lv_timer_t *timer) {
    if (RKADK_PLAYER_EVENT_BUTT != player_event) {
        player_event_handler(player_event);
        player_event = RKADK_PLAYER_EVENT_BUTT;
    }

    if (UI_PLAYER_STATE_PLAY == player_state)
        update_play_progress();
}

static void player_photo_play(char *file_path) {
    if (PLAYER_TYPE_PHOTO != player_ctx.type) {
        CVR_ERR("Player type does not have to match!\n");
        return ;
    }

    if (NULL == file_path) {
        CVR_ERR("Invalid input parameter!\n");
        return;
    }

    const char *ptr = NULL;
    lv_img_dsc_t *img_data = &player_ctx.photo.img_data;
    RKADK_PHOTO_DATA_ATTR_S stDataAttr;

    memset(&stDataAttr, 0, sizeof(RKADK_PHOTO_DATA_ATTR_S));

    stDataAttr.enType = RKADK_THUMB_TYPE_BGRA8888;
    stDataAttr.u32Width = player_ctx.play_area.u32Height;
    stDataAttr.u32Height = player_ctx.play_area.u32Width;
    stDataAttr.u32VirWidth = lv_disp_get_hor_res(NULL);
    stDataAttr.u32VirHeight = lv_disp_get_ver_res(NULL);

    if (!RKADK_PHOTO_GetData(file_path, &stDataAttr)) {
        if (NULL != stDataAttr.pu8Buf) {
            if (NULL != img_data->data) {
                free((void*)img_data->data);
                img_data->data = NULL;
            }

            img_data->header.always_zero = 0;
            img_data->header.w = stDataAttr.u32Width;
            img_data->header.h = stDataAttr.u32Height;
            img_data->data_size = stDataAttr.u32BufSize;;
            img_data->header.cf = LV_IMG_CF_TRUE_COLOR_ALPHA;
            img_data->data = stDataAttr.pu8Buf;
            lv_img_set_src(player_ctx.photo.photo_obj, img_data);
        }

        ptr = strrchr(file_path, '/');
        if (NULL != ptr) {
            lv_obj_clear_flag(player_ctx.photo.name_obj, LV_OBJ_FLAG_HIDDEN);
            lv_label_set_text(player_ctx.photo.name_obj, ptr + 1);
        }
    }
}

void player_video_play(UI_PLAYER_FILE_INFO_S *player_file_info) {
    if (PLAYER_TYPE_VIDEO != player_ctx.type) {
        CVR_ERR("Player type does not have to match!\n");
        return ;
    }

    uint32_t total_time = 0;
    const char *ptr = NULL;
    char str_time[32] = {0};
    int32_t ret = -1;

    ret = mpu_player_switch(player_file_info->file_path);
    if (ret) {
        CVR_ERR("Switch video failed\n");
        return;
    }

    lv_label_set_text(player_ctx.video.cur_time_obj, "00:00");
    lv_label_set_text(player_ctx.video.total_time_obj, "00:00");

    if (player_file_info->stTime > 0) {
        total_time = player_file_info->stTime;
    } else {
        mpu_player_get_duration(&total_time);
        total_time = total_time / 1000 + ((total_time % 1000) ? 1 : 0);
    }

    if (total_time > 0) {
        sprintf(str_time, "%02d:%02d", total_time / 60, total_time % 60);
        lv_label_set_text(player_ctx.video.total_time_obj, str_time);
        lv_slider_set_range(player_ctx.video.slider_obj, 0, total_time);
    }

    ret = mpu_player_play();
    if (ret) {
        CVR_ERR("play video failed\n");
    }

    ptr = strrchr(player_file_info->file_path, '/');
    if (NULL != ptr) {
        lv_obj_clear_flag(player_ctx.video.name_obj, LV_OBJ_FLAG_HIDDEN);
        lv_label_set_text(player_ctx.video.name_obj, ptr + 1);
    }

    lv_timer_ready(player_ctx.video.timer);
}

void ui_player_switch_file(UI_PLAYER_FILE_INFO_S *player_file_info) {
    if (NULL == player_file_info)
        return;

    memcpy(&g_play_file_info, player_file_info, sizeof(g_play_file_info));

    if (PLAYER_TYPE_VIDEO == g_play_file_info.type) {
        player_video_play(&g_play_file_info);
    } else if (PLAYER_TYPE_PHOTO == g_play_file_info.type){
        player_photo_play(g_play_file_info.file_path);
    }
}

static void pause_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);

    if (code == LV_EVENT_CLICKED) {
        if (player_state == UI_PLAYER_STATE_PAUSE) {
            mpu_player_play();
        } else if (player_state == UI_PLAYER_STATE_PLAY) {
            mpu_player_pause();
        } else if (player_state == UI_PLAYER_STATE_EOF) {
            player_video_play(&g_play_file_info);
        }
    }
}

static void slider_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_VALUE_CHANGED) {
        int32_t pos = lv_slider_get_value(obj);
        mpu_player_seek(pos * 1000);
    }
}

static void player_video_create_control(void) {
    if (PLAYER_TYPE_VIDEO != player_ctx.type)
        return;

    lv_obj_t *obj = NULL;
    lv_color_t text_color = lv_color_make(0xff, 0xff, 0xff);

    player_ctx.video.name_obj = obj = lv_label_create(player_ctx.parent_window_obj);
    lv_obj_set_style_text_font(obj, ttf_info_32.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_size(obj, lv_pct(100) , LV_SIZE_CONTENT);
    lv_obj_align(obj, LV_ALIGN_TOP_MID, 0, 20);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_HIDDEN);

    player_ctx.video.pause_obj = obj = lv_imgbtn_create(player_ctx.parent_window_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL,  index_icon_player_play, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL,  index_icon_player_play_p, NULL);
    lv_obj_set_size(obj,  index_icon_player_play->header.w,  index_icon_player_play->header.h);
    lv_obj_add_event_cb(obj, pause_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);

    /* Create a transition */
    static const lv_style_prop_t props[] = {LV_STYLE_BG_COLOR, 0};
    static lv_style_transition_dsc_t transition_dsc;
    lv_style_transition_dsc_init(&transition_dsc, props, lv_anim_path_linear, 300, 0, NULL);

    static lv_style_t style_main;
    static lv_style_t style_indicator;
    static lv_style_t style_knob;
    static lv_style_t style_pressed_color;
    lv_style_reset(&style_main);
    lv_style_init(&style_main);
    lv_style_set_bg_opa(&style_main, LV_OPA_50);
    lv_style_set_bg_color(&style_main, lv_color_hex(0x4c5457));
    lv_style_set_radius(&style_main, LV_RADIUS_CIRCLE);
    lv_style_set_pad_ver(&style_main, -2); /*Makes the indicator larger*/

    lv_style_reset(&style_indicator);
    lv_style_init(&style_indicator);
    lv_style_set_bg_opa(&style_indicator, LV_OPA_COVER);
    lv_style_set_bg_color(&style_indicator, lv_color_hex(0x00eaeb));
    lv_style_set_radius(&style_indicator, LV_RADIUS_CIRCLE);
    lv_style_set_transition(&style_indicator, &transition_dsc);

    lv_style_reset(&style_knob);
    lv_style_init(&style_knob);
    lv_style_set_bg_opa(&style_knob, LV_OPA_COVER);
    lv_style_set_bg_color(&style_knob, lv_color_hex(0xffffff));
    lv_style_set_border_color(&style_knob, lv_color_hex(0xffffff));
    lv_style_set_border_width(&style_knob, 10);
    lv_style_set_radius(&style_knob, LV_RADIUS_CIRCLE);
    lv_style_set_pad_all(&style_knob, 6); /*Makes the knob larger*/
    lv_style_set_transition(&style_knob, &transition_dsc);

    lv_style_reset(&style_pressed_color);
    lv_style_init(&style_pressed_color);
    lv_style_set_bg_color(&style_pressed_color, lv_color_hex(0x00eaeb));

    /* Create a slider and add the style */
    lv_obj_t * slider_obj = lv_slider_create(player_ctx.parent_window_obj);

    lv_obj_remove_style_all(slider_obj);        /*Remove the styles coming from the theme*/
    lv_obj_add_style(slider_obj, &style_main, LV_PART_MAIN);
    lv_obj_add_style(slider_obj, &style_indicator, LV_PART_INDICATOR);
    lv_obj_add_style(slider_obj, &style_pressed_color, LV_PART_INDICATOR | LV_STATE_PRESSED);
    lv_obj_add_style(slider_obj, &style_knob, LV_PART_KNOB);
    lv_obj_add_style(slider_obj, &style_pressed_color, LV_PART_KNOB | LV_STATE_PRESSED);
    lv_obj_set_size(slider_obj, lv_pct(60) , 10);
    lv_obj_align(slider_obj, LV_ALIGN_BOTTOM_MID, 0, -50);

    player_ctx.video.cur_time_obj = obj = lv_label_create(player_ctx.parent_window_obj);
    lv_obj_set_style_text_font(obj, &lv_font_montserrat_24, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align_to(obj, slider_obj, LV_ALIGN_OUT_LEFT_MID, -35, 0);
    lv_label_set_text(obj, "00:00");

    player_ctx.video.total_time_obj = obj = lv_label_create(player_ctx.parent_window_obj);
    lv_obj_set_style_text_font(obj, &lv_font_montserrat_24, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_align_to(obj, slider_obj, LV_ALIGN_OUT_RIGHT_MID, 15, 0);
    lv_label_set_text(obj, "00:00");

    lv_obj_add_event_cb(slider_obj, slider_event_cb, LV_EVENT_VALUE_CHANGED, NULL);

    player_ctx.video.slider_obj = slider_obj;
}

static void player_video_destroy_control(void) {
    if (PLAYER_TYPE_VIDEO != player_ctx.type)
        return;

    if (player_ctx.video.timer) {
        lv_timer_del(player_ctx.video.timer);
        player_ctx.video.timer = NULL;
    }

    if (player_ctx.video.name_obj) {
        ui_common_remove_stype_all(player_ctx.video.name_obj);
        lv_obj_del(player_ctx.video.name_obj);
        player_ctx.video.name_obj = NULL;
    }

    if (player_ctx.video.slider_obj) {
        ui_common_remove_stype_all(player_ctx.video.slider_obj);
        lv_obj_del(player_ctx.video.slider_obj);
        player_ctx.video.slider_obj = NULL;
    }

    if (player_ctx.video.cur_time_obj) {
        ui_common_remove_stype_all(player_ctx.video.cur_time_obj);
        lv_obj_del(player_ctx.video.cur_time_obj);
        player_ctx.video.cur_time_obj = NULL;
    }

    if (player_ctx.video.total_time_obj) {
        ui_common_remove_stype_all(player_ctx.video.total_time_obj);
        lv_obj_del(player_ctx.video.total_time_obj);
        player_ctx.video.total_time_obj = NULL;
    }

    if (player_ctx.video.pause_obj) {
        ui_common_remove_stype_all(player_ctx.video.pause_obj);
        lv_obj_del(player_ctx.video.pause_obj);
        player_ctx.video.pause_obj = NULL;
    }
}

static int32_t player_video_create(void) {
    if (PLAYER_TYPE_VIDEO != player_ctx.type) {
        CVR_ERR("Player type does not have to match!\n");
        return -1;
    }

    if (mpu_player_create(MPU_PLAYER_TYPE_VIDEO | MPU_PLAYER_TYPE_AUDIO, &player_ctx.play_area,
                          mpu_sys_get_speaker_volume(), player_event_cb)) {
        CVR_ERR("Player creation failed.\n");
        return -1;
    }

    player_ctx.video.timer = lv_timer_create(time_handler, 500, NULL);
    lv_timer_ready(player_ctx.video.timer);

    return 0;
}

static void player_photo_create_control(void) {
    if (PLAYER_TYPE_PHOTO != player_ctx.type)
        return;

    lv_obj_t *obj = NULL;
    lv_color_t text_color = lv_color_make(0xff, 0xff, 0xff);

    player_ctx.photo.name_obj = obj = lv_label_create(player_ctx.parent_window_obj);
    lv_obj_set_style_text_font(obj, ttf_info_32.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_size(obj, lv_pct(100) , LV_SIZE_CONTENT);
    lv_obj_align(obj, LV_ALIGN_TOP_MID, 0, 20);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_add_flag(obj, LV_OBJ_FLAG_HIDDEN);

    player_ctx.photo.photo_obj = obj = lv_img_create(player_ctx.parent_window_obj);
    lv_obj_set_size(obj, LV_SIZE_CONTENT, LV_SIZE_CONTENT);
    lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
}

static void player_photo_destroy_control(void) {
    if (PLAYER_TYPE_PHOTO != player_ctx.type)
        return;

    if (player_ctx.photo.photo_obj) {
        ui_common_remove_stype_all(player_ctx.photo.photo_obj);
        lv_obj_del(player_ctx.photo.photo_obj);
        player_ctx.photo.photo_obj = NULL;
    }

    if (player_ctx.photo.name_obj) {
        ui_common_remove_stype_all(player_ctx.photo.name_obj);
        lv_obj_del(player_ctx.photo.name_obj);
        player_ctx.photo.name_obj = NULL;
    }
}

static void player_video_destroy(void) {
    if (PLAYER_TYPE_VIDEO != player_ctx.type) {
        CVR_ERR("Player type does not have to match!\n");
        return;
    }

    mpu_player_destroy();
}

static int32_t player_photo_create(void) {
    return 0;
}

static void player_photo_destroy(void) {
    if (PLAYER_TYPE_PHOTO != player_ctx.type) {
        CVR_ERR("Player type does not have to match!\n");
        return;
    }

    if (player_ctx.photo.img_data.data) {
        free((void*)player_ctx.photo.img_data.data);
        player_ctx.photo.img_data.data = NULL;
    }
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void ui_player_create_window(PLAYER_TYPE_E type, void *parent_window_obj) {
    if (NULL == parent_window_obj)
        return;

    memset(&player_ctx, 0, sizeof(player_ctx));

    player_ctx.type = type;
    player_ctx.parent_window_obj = parent_window_obj;

    if (PLAYER_TYPE_VIDEO == type) {
        player_video_create_control();
        player_set_area(&player_ctx.play_area);
        player_video_create();
    } else if (PLAYER_TYPE_PHOTO == type) {
        player_photo_create_control();
        player_set_area(&player_ctx.play_area);
        player_photo_create();
    } else {
        CVR_ERR("Unknown type(%d), failed to create player!\n", type);
        return;
    }
}

void ui_player_destory_window(void) {
    if (PLAYER_TYPE_VIDEO == player_ctx.type) {
        player_video_destroy();
        player_video_destroy_control();
    } else if (PLAYER_TYPE_PHOTO == player_ctx.type) {
        player_photo_destroy();
        player_photo_destroy_control();
    } else {
        CVR_ERR("Unknown type(%d), failed to destory player!\n", player_ctx.type);
        return;
    }
}