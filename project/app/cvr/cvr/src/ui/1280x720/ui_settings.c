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

#include "ui_settings.h"
#include "ui_languages.h"
#include "ui_dialog_format.h"
#include "ui_dialog_storage.h"
#include "ui_dialog_language.h"
#include "ui_resource_manage.h"
#include "ui/common/ui_page_manager.h"
#include "ui/common/ui_common.h"

#include "mpu/mpu_storage.h"
#include "mpu/mpu_record.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    lv_obj_t *container_obj;

    lv_obj_t *exit_obj;
    lv_obj_t *title_obj;

    lv_obj_t *movie_imgbtn_obj;
    lv_obj_t *movie_img_obj;
    lv_obj_t *movie_lable_obj;

    lv_obj_t *res_imgbtn_obj;
    lv_obj_t *res_img_obj;
    lv_obj_t *res_lable_obj;

    lv_obj_t *codec_imgbtn_obj;
    lv_obj_t *codec_img_obj;
    lv_obj_t *codec_lable_obj;

    lv_obj_t *vol_imgbtn_obj;
    lv_obj_t *vol_img_obj;
    lv_obj_t *vol_lable_obj;

    lv_obj_t *mic_imgbtn_obj;
    lv_obj_t *mic_img_obj;
    lv_obj_t *mic_lable_obj;

    lv_obj_t *lang_imgbtn_obj;
    lv_obj_t *lang_img_obj;
    lv_obj_t *lang_lable_obj;

    lv_obj_t *store_imgbtn_obj;
    lv_obj_t *store_img_obj;
    lv_obj_t *store_lable_obj;

    lv_obj_t *format_imgbtn_obj;
    lv_obj_t *format_img_obj;
    lv_obj_t *format_lable_obj;

    lv_timer_t *timer;
} UI_SETTINGS_CONTROL_S;

typedef struct {
    RKADK_MOUNT_STATUS disk_status;
} UI_SETTINGS_CONTEXT_S;

/**********************
 *  STATIC VARIABLES
 **********************/
static UI_SETTINGS_CONTROL_S settings_ctrl;

static UI_SETTINGS_CONTEXT_S settings_ctx;

static int32_t movie = 0;
static int32_t res = 0;
static int32_t code_val = 0;
static int32_t vol = 0;
static int32_t mic = 0;

extern lv_ft_info_t ttf_info_32;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_24;
/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void setting_set_text(void);

static void movie_update(void) {
    if (movie == 0)
        lv_img_set_src(settings_ctrl.movie_img_obj, index_icon_movie_1);
    else if (movie == 1)
        lv_img_set_src(settings_ctrl.movie_img_obj, index_icon_movie_3);
    else if (movie == 2)
        lv_img_set_src(settings_ctrl.movie_img_obj, index_icon_movie_5);
}

static void res_update(void) {
    if (res == 0)
        lv_img_set_src(settings_ctrl.res_img_obj, index_icon_res_4k);
    else if (res == 1)
        lv_img_set_src(settings_ctrl.res_img_obj, index_icon_res_2k);
    else if (res == 2)
        lv_img_set_src(settings_ctrl.res_img_obj, index_icon_res_1k);
}

static void codec_update(void) {
    if (mpu_record_get_codec_type(0))
        lv_img_set_src(settings_ctrl.codec_img_obj, index_icon_code_265);
    else
        lv_img_set_src(settings_ctrl.codec_img_obj, index_icon_code_264);
}

static void vol_update(void) {
    if (vol == 0)
        lv_img_set_src(settings_ctrl.vol_img_obj, index_icon_vol_01);
    else if (vol == 1)
        lv_img_set_src(settings_ctrl.vol_img_obj, index_icon_vol_02);
    else if (vol == 2)
        lv_img_set_src(settings_ctrl.vol_img_obj, index_icon_vol_03);
    else if (vol == 3)
        lv_img_set_src(settings_ctrl.vol_img_obj, index_icon_vol_04);
}

static void mic_update(void) {
    if (mic)
        lv_img_set_src(settings_ctrl.mic_img_obj, index_icon_mic_02);
    else
        lv_img_set_src(settings_ctrl.mic_img_obj, index_icon_mic_01);
}

static void movie_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        movie = (movie + 1) % 3;
        movie_update();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void settings_storage_event_cb(RKADK_MOUNT_STATUS disk_state) {
    settings_ctx.disk_status = disk_state;
}

static void settings_disk_event_handler(RKADK_MOUNT_STATUS disk_state) {
    ui_format_dialog_destory();
    ui_storage_status_dialog_destroy();
    switch(disk_state) {
        case DISK_UNMOUNTED:
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
            ui_nosdcard_dialog_destroy();
            ui_noformat_dialog_destroy();
            ui_scansdcard_dialog_destroy();
            break;

        default:
            break;
    }
}

static void format_extry(void) {
    mpu_storage_event_cb_register(settings_storage_event_cb);
}

static void format_exit(void) {
    mpu_storage_event_cb_unregister(settings_storage_event_cb);
}

static void res_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        res = (res + 1) % 3;
        res_update();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void codec_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        code_val = !code_val;
        codec_update();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void vol_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        vol = (vol + 1) % 4;
        vol_update();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void mic_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        mic = !mic;
        mic_update();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void lang_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        ui_language_dialog_create(setting_set_text);
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void store_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        switch(mpu_storage_get_status()) {
            case DISK_UNMOUNTED:
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
                ui_storage_status_dialog_create();
                break;
            default:
                break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void format_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        switch(mpu_storage_get_status()) {
            case DISK_UNMOUNTED:
                ui_nosdcard_dialog_create();
                break;
            case DISK_FORMAT_ERR:
            case DISK_NOT_FORMATTED:
            case DISK_SCANNING:
            case DISK_MOUNTED:
                ui_format_dialog_create(format_extry, format_exit);
                break;
            default:
                break;
        }
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    }
}

static void return_event_handler(lv_event_t * e) {
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

static void timer_xcb(lv_timer_t *timer) {
    if (DISK_MOUNT_BUTT != settings_ctx.disk_status) {
        settings_disk_event_handler(settings_ctx.disk_status);
        settings_ctx.disk_status = DISK_MOUNT_BUTT;
    }
}

static void setting_layout(void) {
    static lv_coord_t col_dsc[] = {LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc[] = {LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    lv_obj_set_layout(settings_ctrl.container_obj, LV_LAYOUT_GRID);

    lv_obj_set_style_grid_column_dsc_array(settings_ctrl.container_obj, col_dsc, 0);
    lv_obj_set_style_grid_row_dsc_array(settings_ctrl.container_obj, row_dsc, 0);

    lv_obj_set_grid_cell(settings_ctrl.exit_obj, LV_GRID_ALIGN_START, 0, 1,
                        LV_GRID_ALIGN_CENTER, 0, 1);

    lv_obj_set_grid_cell(settings_ctrl.title_obj, LV_GRID_ALIGN_CENTER, 1, 2,
                    LV_GRID_ALIGN_CENTER, 0, 1);

    lv_obj_set_grid_cell(settings_ctrl.movie_imgbtn_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                    LV_GRID_ALIGN_CENTER, 1, 1);

    lv_obj_set_grid_cell(settings_ctrl.res_imgbtn_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                    LV_GRID_ALIGN_CENTER, 1, 1);

    lv_obj_set_grid_cell(settings_ctrl.codec_imgbtn_obj, LV_GRID_ALIGN_CENTER, 2, 1,
                    LV_GRID_ALIGN_CENTER, 1, 1);

    lv_obj_set_grid_cell(settings_ctrl.vol_imgbtn_obj, LV_GRID_ALIGN_CENTER, 3, 1,
                    LV_GRID_ALIGN_CENTER, 1, 1);

    lv_obj_set_grid_cell(settings_ctrl.mic_imgbtn_obj, LV_GRID_ALIGN_CENTER, 0, 1,
                    LV_GRID_ALIGN_CENTER, 2, 1);

    lv_obj_set_grid_cell(settings_ctrl.lang_imgbtn_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                    LV_GRID_ALIGN_CENTER, 2, 1);

    lv_obj_set_grid_cell(settings_ctrl.store_imgbtn_obj, LV_GRID_ALIGN_CENTER, 2, 1,
                    LV_GRID_ALIGN_CENTER, 2, 1);

    lv_obj_set_grid_cell(settings_ctrl.format_imgbtn_obj, LV_GRID_ALIGN_CENTER, 3, 1,
                    LV_GRID_ALIGN_CENTER, 2, 1);
}

static void setting_create_ctrl(lv_obj_t *page_obj) {
    lv_color_t bg_color = lv_color_hex(0xFF04171D);
    lv_obj_t *cont_obj = NULL, *imgbtn_obj = NULL, *img_obj = NULL, *lable_obj = NULL;

    lv_obj_set_style_bg_opa(page_obj, LV_OPA_TRANSP, 0);
    lv_disp_set_bg_opa(NULL, LV_OPA_TRANSP);

    settings_ctrl.container_obj = cont_obj = lv_obj_create(page_obj);
    lv_obj_set_size(cont_obj, lv_pct(100) , lv_pct(100));
    lv_obj_align(cont_obj, LV_ALIGN_BOTTOM_RIGHT, 0, 0);
    lv_obj_set_style_bg_color(cont_obj, bg_color, 0);
    lv_obj_set_style_border_color(cont_obj, bg_color, 0);
    lv_obj_set_style_radius(cont_obj, 0, 0);

    settings_ctrl.title_obj = lv_label_create(cont_obj);

    settings_ctrl.exit_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(settings_ctrl.exit_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_r, NULL);
    lv_imgbtn_set_src(settings_ctrl.exit_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    lv_obj_add_event_cb(settings_ctrl.exit_obj, return_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(settings_ctrl.exit_obj, index_icon_return_r->header.w, index_icon_return_r->header.h);

    settings_ctrl.movie_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, movie_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.movie_img_obj = img_obj = lv_img_create(imgbtn_obj);
    movie_update();
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.movie_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.res_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, res_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.res_img_obj = img_obj = lv_img_create(imgbtn_obj);
    res_update();
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.res_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.codec_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, codec_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.codec_img_obj = img_obj = lv_img_create(imgbtn_obj);
    codec_update();
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.codec_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.vol_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, vol_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.vol_img_obj = img_obj = lv_img_create(imgbtn_obj);
    vol_update();
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.vol_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.mic_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, mic_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.mic_img_obj = img_obj = lv_img_create(imgbtn_obj);
    mic_update();
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.mic_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.lang_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, lang_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.lang_img_obj = img_obj = lv_img_create(imgbtn_obj);
    lv_img_set_src(img_obj, index_icon_lang_01);
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.lang_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.store_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, store_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.store_img_obj = img_obj = lv_img_create(imgbtn_obj);
    lv_img_set_src(img_obj, index_icon_store_01);
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.store_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.format_imgbtn_obj = imgbtn_obj = lv_imgbtn_create(cont_obj);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_boxbg_r, NULL);
    lv_imgbtn_set_src(imgbtn_obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_boxbg_p, NULL);
    lv_obj_add_event_cb(imgbtn_obj, format_event_handler, LV_EVENT_CLICKED, NULL);
    lv_obj_set_size(imgbtn_obj, index_icon_boxbg_r->header.w, index_icon_boxbg_r->header.h);
    settings_ctrl.format_img_obj = img_obj = lv_img_create(imgbtn_obj);
    lv_img_set_src(img_obj, index_icon_format_01);
    lv_obj_align(img_obj, LV_ALIGN_CENTER, 0, 0);
    settings_ctrl.format_lable_obj = lable_obj = lv_label_create(imgbtn_obj);
    lv_obj_set_width(lable_obj, lv_pct(100));
    lv_obj_align_to(lable_obj, img_obj, LV_ALIGN_OUT_BOTTOM_MID, 0, 0);

    settings_ctrl.timer = lv_timer_create(timer_xcb, 100, NULL);
    lv_timer_ready(settings_ctrl.timer);
}

static void setting_set_text() {
    static lv_style_t style;
    lv_color_t text_color = lv_color_hex(0xFFFFFF);

    lv_style_reset(&style);
    lv_style_init(&style);
    lv_style_set_text_font(&style, ttf_info_24.font);
    lv_style_set_text_color(&style, text_color);
    lv_style_set_text_align(&style, LV_TEXT_ALIGN_CENTER);

    lv_obj_set_style_text_font(settings_ctrl.title_obj, ttf_info_32.font, 0);
    lv_obj_set_style_text_color(settings_ctrl.title_obj, text_color, 0);
    lv_label_set_text(settings_ctrl.title_obj, RES_STR_SETTINGS_SET);

    lv_label_set_text(settings_ctrl.movie_lable_obj, RES_STR_SETTINGS_MOVIE);
    lv_obj_add_style(settings_ctrl.movie_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.res_lable_obj, RES_STR_SETTINGS_RES);
    lv_obj_add_style(settings_ctrl.res_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.codec_lable_obj, RES_STR_SETTINGS_CODE);
    lv_obj_add_style(settings_ctrl.codec_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.vol_lable_obj, RES_STR_SETTINGS_VOL);
    lv_obj_add_style(settings_ctrl.vol_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.mic_lable_obj, RES_STR_SETTINGS_MIC);
    lv_obj_add_style(settings_ctrl.mic_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.lang_lable_obj, RES_STR_SETTINGS_LANG);
    lv_obj_add_style(settings_ctrl.lang_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.store_lable_obj, RES_STR_SETTINGS_STORE);
    lv_obj_add_style(settings_ctrl.store_lable_obj, &style, 0);

    lv_label_set_text(settings_ctrl.format_lable_obj, RES_STR_SETTINGS_FORMAT);
    lv_obj_add_style(settings_ctrl.format_lable_obj, &style, 0);
}

static void setting_destroy_ctrl(void) {
    if (settings_ctrl.timer) {
        lv_timer_del(settings_ctrl.timer);
        settings_ctrl.timer = NULL;
    }

    if (NULL != settings_ctrl.container_obj) {
        ui_common_remove_stype_all(settings_ctrl.container_obj);
        lv_obj_del(settings_ctrl.container_obj);
        settings_ctrl.container_obj = NULL;
    }
}

static void settings_page_create(lv_obj_t *page_obj) {
    settings_ctx.disk_status = DISK_MOUNT_BUTT;

    setting_create_ctrl(page_obj);
    setting_set_text();
    setting_layout();
}

static void settings_page_enter(lv_obj_t *page_obj) {
    mpu_storage_event_cb_register(settings_storage_event_cb);
}

static void settings_page_exit(lv_obj_t *page_obj) {
    mpu_storage_event_cb_unregister(settings_storage_event_cb);
}

static void settings_page_destroy(lv_obj_t *page_obj) {
    setting_destroy_ctrl();
}

static UI_PAGE_HANDLER_T settings_page = {
    .name = "settings",
    .init = NULL,
    .create = settings_page_create,
    .enter = settings_page_enter,
    .destroy = settings_page_destroy,
    .exit = settings_page_exit
};

UI_PAGE_REGISTER(settings_page)