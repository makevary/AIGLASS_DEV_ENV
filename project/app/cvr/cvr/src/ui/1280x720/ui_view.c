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

#include "ui_dialog_storage.h"
#include "ui_resource_manage.h"
#include "ui_languages.h"
#include "ui/common/ui_common.h"
#include "ui/common/ui_page_manager.h"

#include "mpu/mpu_photo.h"
#include "mpu/mpu_storage.h"
#include "mpu/mpu_record.h"
#include "mpu/mpu_disp.h"
#include "mpu/mpu_player.h"
#include "mpu/sys/mpu_sys.h"
#include "algorithm/auto/auto.h"
#include "utils/log.h"

#include <stdio.h>
#include <time.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    MSG_PREVIEW_OPEN = 0,
    MSG_PREVIEW_CLOSE,
} UI_MAIN_VIEW_MSG_E;

typedef struct {
    uint32_t disp_cnt;
    uint32_t disp_index;

    RKADK_MOUNT_STATUS disk_state;
} UI_VIEW_CONTEXT_S;

typedef struct {
    lv_obj_t *bg_obj;

    lv_obj_t *sd_obj;
    lv_obj_t *rec_obj;
    lv_obj_t *mic_obj;
    lv_obj_t *p_obj;
    lv_obj_t *f_obj;
    lv_obj_t *status_bar;

    lv_obj_t *time_bar;
    lv_obj_t *switch_obj;
    lv_obj_t *photo_obj;
    lv_obj_t *media_obj;
    lv_obj_t *setting_obj;
    lv_obj_t *menu_bar;

    lv_timer_t *timer;
} UI_VIEW_CONTROL_S;

/**********************
 *  STATIC VARIABLES
 **********************/
static UI_VIEW_CONTEXT_S main_view_ctx;
static UI_VIEW_CONTROL_S main_view_ctrl;
static int8_t mic_status = -1, p_status = -1, f_status = -1, r_status = -1;

extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;

/**********************
 *      MACROS
 **********************/
#define TAKE_PHOTO_SOUND  "/oem/usr/share/res/sound/takephoto.wav"

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
static void photo_event_handler(lv_event_t * e);
static void media_event_handler(lv_event_t * e);
static void set_event_handler(lv_event_t * e);

/**********************s
 *   STATIC FUNCTIONS
 **********************/
static void main_view_layout_ctrl(void) {
    lv_obj_t *obj = NULL;

    obj = main_view_ctrl.status_bar;
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_opa(obj,LV_OPA_TRANSP, 0);
    lv_obj_set_style_layout(obj, LV_LAYOUT_FLEX, 0);
    lv_obj_set_style_flex_flow(obj, LV_FLEX_FLOW_ROW, 0); 
    lv_obj_set_style_flex_main_place(obj, LV_FLEX_ALIGN_SPACE_EVENLY, 0);
    lv_obj_set_style_flex_cross_place(obj, LV_FLEX_ALIGN_CENTER, 0);
    lv_obj_align(obj, LV_ALIGN_TOP_RIGHT, 0, 0);

    obj = main_view_ctrl.menu_bar;
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_opa(obj,LV_OPA_TRANSP, 0);
    lv_obj_set_style_layout(obj, LV_LAYOUT_FLEX, 0);
    lv_obj_set_style_flex_flow(obj, LV_FLEX_FLOW_ROW, 0);
    lv_obj_set_style_flex_main_place(obj, LV_FLEX_ALIGN_SPACE_EVENLY, 0);
    lv_obj_set_style_flex_cross_place(obj, LV_FLEX_ALIGN_CENTER, 0);
    lv_obj_align(obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);
}

static void main_view_destroy_ctrl(void) {
    if (main_view_ctrl.timer) {
        lv_timer_del(main_view_ctrl.timer);
        main_view_ctrl.timer = NULL;
    }

    if (main_view_ctrl.bg_obj) {
        ui_common_remove_stype_all(main_view_ctrl.bg_obj);
        lv_obj_del(main_view_ctrl.bg_obj);
        main_view_ctrl.bg_obj = NULL;
    }

    if (main_view_ctrl.status_bar) {
        ui_common_remove_stype_all(main_view_ctrl.status_bar);
        lv_obj_del(main_view_ctrl.status_bar);
        main_view_ctrl.status_bar = NULL;
    }

    if (main_view_ctrl.menu_bar) {
        ui_common_remove_stype_all(main_view_ctrl.menu_bar);
        lv_obj_del(main_view_ctrl.menu_bar);
        main_view_ctrl.menu_bar = NULL;
    }
}

static void switch_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        if (1 >= main_view_ctx.disp_cnt)
            return;

        main_view_ctx.disp_index += 1;
        main_view_ctx.disp_index = main_view_ctx.disp_index % main_view_ctx.disp_cnt;

        mpu_disp_deinit();
        mpu_disp_init(main_view_ctx.disp_index);
    } else if (code == LV_EVENT_FOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_sw_p, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_sw_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_sw_r, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_sw_p, NULL);
    }
}

static void photo_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        switch(mpu_storage_get_status()) {
            case DISK_UNMOUNTED:
            case DISK_NOT_EXIST:
                ui_nosdcard_dialog_create();
                break;
            case DISK_FORMAT_ERR:
            case DISK_NOT_FORMATTED:
                ui_noformat_dialog_create();
                break;
            case DISK_SCANNING:
                ui_scansdcard_dialog_create();
                break;
            case DISK_MOUNTED:
                mpu_player_switch(TAKE_PHOTO_SOUND);
                mpu_player_play();
                mpu_photo_capture(main_view_ctx.disp_index);
                break;
            default :
                break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_photo_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_photo_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_photo_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_photo_p, NULL);
    }
}

static void media_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        switch (mpu_storage_get_status()) {
            case DISK_UNMOUNTED:
            case DISK_NOT_EXIST:
                ui_nosdcard_dialog_create();
                break;
            case DISK_FORMAT_ERR:
            case DISK_NOT_FORMATTED:
                ui_noformat_dialog_create();
                break;
            case DISK_SCANNING:
                ui_scansdcard_dialog_create();
                break;
            case DISK_MOUNTED:
                ui_page_push_page("media", NULL);
                break;
            default :
                break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_media_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_media_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_media_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_media_p, NULL);
    }
}

static void set_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        ui_page_push_page("settings", NULL);
    } else if (code == LV_EVENT_FOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_p, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_r, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_p, NULL);
    }
}

static void main_view_disk_event_handle(RKADK_MOUNT_STATUS disk_state) {
    switch(disk_state) {
        case DISK_UNMOUNTED:
        case DISK_NOT_EXIST:
            lv_img_set_src(main_view_ctrl.sd_obj, index_icon_sd_nor);
            ui_nosdcard_dialog_create();
            break;
        case DISK_FORMAT_ERR:
        case DISK_NOT_FORMATTED:
            lv_img_set_src(main_view_ctrl.sd_obj, index_icon_sd_err);
            ui_noformat_dialog_create();
            break;
        case DISK_SCANNING:
            lv_img_set_src(main_view_ctrl.sd_obj, index_icon_sd_scan);
            ui_noformat_dialog_destroy();
            ui_nosdcard_dialog_destroy();
            break;
        case DISK_MOUNTED:
            lv_img_set_src(main_view_ctrl.sd_obj, index_icon_sd);
            ui_scansdcard_dialog_destroy();
            ui_noformat_dialog_destroy();
            ui_nosdcard_dialog_destroy();
            break;
        default:
            break;
    }
}

static void timer_xcb(lv_timer_t *timer) {
    time_t timep;
    struct tm *p;
    static bool flag = true;
    int8_t mic_status_tmp, p_status_tmp, f_status_tmp;
    RKADK_MOUNT_STATUS disk_state;

    time(&timep);
    p = gmtime(&timep);

    lv_label_set_text_fmt(main_view_ctrl.time_bar, "%4d-%02d-%02d %02d:%02d:%02d", 1900 + p->tm_year,
                          1 + p->tm_mon, p->tm_mday, p->tm_hour, p->tm_min, p->tm_sec);

    if (0 == main_view_ctx.disp_index) {
        p_status_tmp = false; f_status_tmp = true;
    } else {
        f_status_tmp = false; p_status_tmp = true;
    }

    r_status = mpu_record_check_active(0);
    if (true == r_status) {
        flag = !flag;
        lv_img_set_src(main_view_ctrl.rec_obj, flag ? index_icon_record : index_icon_record_nor);
    } else
        lv_img_set_src(main_view_ctrl.rec_obj, index_icon_record_nor);

    mic_status_tmp = true;
    if (mic_status_tmp != mic_status) {
        mic_status = mic_status_tmp;
        lv_img_set_src(main_view_ctrl.mic_obj, mic_status ? index_icon_mic : index_icon_mic_nor);
    }

    if (p_status_tmp != p_status) {
        p_status = p_status_tmp;
        lv_img_set_src(main_view_ctrl.p_obj, p_status ? index_icon_movie_p : index_icon_movie_p_nor);
    }

    if (f_status_tmp != f_status) {
        f_status = f_status_tmp;
        lv_img_set_src(main_view_ctrl.f_obj, f_status ? index_icon_movie_f : index_icon_movie_f_nor);
    }

    disk_state = mpu_storage_get_status();
    if (disk_state != main_view_ctx.disk_state) {
        main_view_ctx.disk_state = disk_state;
        main_view_disk_event_handle(main_view_ctx.disk_state);
    }
}

static void main_view_create_ctrl(lv_obj_t *page_obj) {
    lv_obj_set_style_bg_opa(page_obj, LV_OPA_TRANSP, 0);
    lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);

    main_view_ctrl.bg_obj = lv_img_create(page_obj);
    lv_img_set_src(main_view_ctrl.bg_obj, index_bg);

    main_view_ctrl.status_bar = lv_obj_create(page_obj);
    lv_obj_set_size(main_view_ctrl.status_bar, lv_pct(30), LV_SIZE_CONTENT);
    main_view_ctrl.f_obj = lv_img_create(main_view_ctrl.status_bar);
    lv_img_set_src(main_view_ctrl.f_obj, index_icon_movie_f);
    main_view_ctrl.p_obj = lv_img_create(main_view_ctrl.status_bar);
    lv_img_set_src(main_view_ctrl.p_obj, index_icon_movie_p_nor);
    main_view_ctrl.mic_obj = lv_img_create(main_view_ctrl.status_bar);
    lv_img_set_src(main_view_ctrl.mic_obj, index_icon_mic);
    main_view_ctrl.sd_obj = lv_img_create(main_view_ctrl.status_bar);
    lv_img_set_src(main_view_ctrl.sd_obj, index_icon_sd);
    main_view_ctrl.rec_obj = lv_img_create(main_view_ctrl.status_bar);
    lv_img_set_src(main_view_ctrl.rec_obj, index_icon_record);

    main_view_ctrl.menu_bar = lv_obj_create(page_obj);
    lv_obj_set_size(main_view_ctrl.menu_bar, lv_pct(75), LV_SIZE_CONTENT);

    main_view_ctrl.switch_obj = lv_imgbtn_create(main_view_ctrl.menu_bar);
    lv_imgbtn_set_src(main_view_ctrl.switch_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_sw_r, NULL);
    lv_imgbtn_set_src(main_view_ctrl.switch_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_sw_p, NULL);
    lv_obj_set_size(main_view_ctrl.switch_obj, index_icon_sw_r->header.w, index_icon_sw_r->header.h);
    lv_obj_add_event_cb(main_view_ctrl.switch_obj, switch_event_cb, LV_EVENT_CLICKED, NULL);

    main_view_ctrl.photo_obj = lv_imgbtn_create(main_view_ctrl.menu_bar);
    lv_imgbtn_set_src(main_view_ctrl.photo_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_photo_r, NULL);
    lv_imgbtn_set_src(main_view_ctrl.photo_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_photo_p, NULL);
    lv_obj_set_size(main_view_ctrl.photo_obj, index_icon_photo_r->header.w, index_icon_photo_r->header.h);
    lv_obj_add_event_cb(main_view_ctrl.photo_obj, photo_event_handler, LV_EVENT_CLICKED, NULL);

    main_view_ctrl.media_obj = lv_imgbtn_create(main_view_ctrl.menu_bar);
    lv_imgbtn_set_src(main_view_ctrl.media_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_media_r, NULL);
    lv_imgbtn_set_src(main_view_ctrl.media_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_media_p, NULL);
    lv_obj_set_size(main_view_ctrl.media_obj, index_icon_media_r->header.w, index_icon_media_r->header.h);
    lv_obj_add_event_cb(main_view_ctrl.media_obj, media_event_handler, LV_EVENT_CLICKED, NULL);

    main_view_ctrl.setting_obj = lv_imgbtn_create(main_view_ctrl.menu_bar);
    lv_imgbtn_set_src(main_view_ctrl.setting_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_set_r, NULL);
    lv_imgbtn_set_src(main_view_ctrl.setting_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_set_p, NULL);
    lv_obj_set_size(main_view_ctrl.setting_obj, index_icon_set_r->header.w, index_icon_set_r->header.h);
    lv_obj_add_event_cb(main_view_ctrl.setting_obj, set_event_handler, LV_EVENT_CLICKED, NULL);

    main_view_ctrl.time_bar = lv_label_create(main_view_ctrl.menu_bar);
    lv_obj_set_style_text_font(main_view_ctrl.time_bar, &lv_font_montserrat_24, 0);
    lv_obj_set_style_text_color(main_view_ctrl.time_bar, lv_color_hex(0xffffff), 0);
    lv_obj_set_style_width(main_view_ctrl.time_bar, lv_pct(30), 0);

    main_view_ctrl.timer = lv_timer_create(timer_xcb, 500, NULL);
    lv_timer_ready(main_view_ctrl.timer);
}

static void main_view_page_create(lv_obj_t *page_obj) {
    mic_status = -1, p_status = -1, f_status = -1, r_status = -1;

    main_view_ctx.disk_state = DISK_MOUNT_BUTT;
    main_view_ctx.disp_index = 0;
    main_view_ctx.disp_cnt = mpu_disp_get_cnt();

    main_view_create_ctrl(page_obj);
    main_view_layout_ctrl();
}

static void main_view_page_enter(lv_obj_t *page_obj) {
    mpu_record_init();
    mpu_record_start(RECORD_ALL_CHN);

    mpu_player_create(MPU_PLAYER_TYPE_AUDIO, NULL, mpu_sys_get_speaker_volume(), NULL);

#ifdef RKAUTO
    algorithm_adas_resume();
#endif

    mpu_disp_init(main_view_ctx.disp_index);
}

static void main_view_page_exit(lv_obj_t *page_obj) {
    mpu_disp_deinit();

#ifdef RKAUTO
    algorithm_adas_pause();
#endif

    mpu_player_destroy();

    mpu_record_stop(RECORD_ALL_CHN);
    mpu_record_deinit();
}

static void main_view_page_destroy(lv_obj_t *page_obj) {
    main_view_destroy_ctrl();
}

static UI_PAGE_HANDLER_T main_page = {
    .name = "main",
    .init = NULL,
    .create = main_view_page_create,
    .enter = main_view_page_enter,
    .destroy = main_view_page_destroy,
    .exit = main_view_page_exit
};

UI_PAGE_REGISTER(main_page)