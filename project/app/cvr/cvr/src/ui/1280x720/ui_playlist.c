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
#include "ui_playlist.h"
#include "ui_resource_manage.h"
#include "ui/common/ui_common.h"
#include "mpu/mpu_storage.h"
#include "mpu/osd/mpu_osd.h"
#include "mpu/mpu_photo.h"
#include "utils/log.h"

#include "rkadk_thumb.h"

#include <pthread.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct _MEDIA_THUMB {
    lv_img_dsc_t *thumb_img;
    lv_obj_t *thumb_obj;
    lv_obj_t *string_obj;
    pthread_mutex_t lock;
    int32_t flag;
} MEDIA_THUMB;

typedef struct {
    lv_obj_t *main_obj;
    lv_obj_t *browse_obj;
    lv_obj_t *player_obj;
    lv_obj_t *exit_obj;
    lv_obj_t *title_obj;
    lv_obj_t *list_obj;
    lv_timer_t *timer;
} UI_PLAYLIST_CONTROL_S;

typedef struct {
    const char *title;
    char res_path[256];
    PLAYER_TYPE_E type;
    RKADK_FILE_LIST list;
    int32_t line_pos;
    int32_t line_update;
} UI_PLAYLIST_CONTEXT_S;

/**********************
 *  STATIC VARIABLES
 **********************/
extern lv_ft_info_t ttf_info_24;
extern lv_ft_info_t ttf_info_28;
extern lv_ft_info_t ttf_info_32;

static pthread_t thumb_tid = 0;
static int32_t thumb_thread_run = 0;

static UI_PLAYLIST_CONTROL_S playlist_ctrl;
static UI_PLAYLIST_CONTEXT_S playlist_ctx;

/**********************
 *      MACROS
 **********************/
#define LINE_NUM   10
#define ROW_NUM   2

#define THUMB_W    256
#define THUMB_H    176

#define CTRL_GOP  10
#define THUMB_INTERVAL_HOR   40
#define THUMB_INTERVAL_VERT  40
/**********************
 *   STATIC FUNCTIONS
 **********************/

static void back_event_handler(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if(code == LV_EVENT_CLICKED) {
        ui_playlist_destroy_window();
    } else if (code == LV_EVENT_FOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_p, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    } else if (code == LV_EVENT_DEFOCUSED) {
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_r, NULL);
       lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    }
}

static void video_player_event_handler(uint32_t pos) {
    if (pos < playlist_ctx.list.s32FileNum) {
        UI_PLAYER_FILE_INFO_S player_file_info;

        memset(&player_file_info, 0, sizeof(player_file_info));

        snprintf(&player_file_info.file_path, sizeof(player_file_info.file_path), "%s%s",
                playlist_ctx.list.path, playlist_ctx.list.file[pos].filename);
        player_file_info.stTime = playlist_ctx.list.file[pos].stTime;
        player_file_info.type = playlist_ctx.type;
        ui_player_switch_file(&player_file_info);
    }
}

static void video_player_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    uint32_t pos = (uint32_t)lv_event_get_user_data(e);

    if (code == LV_EVENT_CLICKED)
        video_player_event_handler(pos);
}

static void main_event_handler(lv_event_t * e) {
    lv_obj_t * cont = lv_event_get_target(e);
    int line = 0;
    lv_area_t cont_a;
    lv_obj_get_coords(cont, &cont_a);

    if (cont->spec_attr->scroll.y < 0)
        line = (cont->spec_attr->scroll.y * (-1) - 210 + 260) / 260;
    if (line != playlist_ctx.line_pos) {
        playlist_ctx.line_update = 1;
        playlist_ctx.line_pos = line;
    }
}

static void media_lib_thumb_create(uint32_t pos) {
    lv_obj_t *obj;
    lv_img_dsc_t *thumb;
    lv_color_t text_color = lv_color_make(0XFFL, 0XFFL, 0XFFL);

    char *file = playlist_ctx.list.file[pos].filename;

    MEDIA_THUMB *media_thumb = playlist_ctx.list.file[pos].thumb;
    if (media_thumb == NULL) {
        media_thumb = malloc(sizeof(MEDIA_THUMB));
        memset(media_thumb, 0, sizeof(MEDIA_THUMB));
        pthread_mutex_init(&media_thumb->lock, NULL);
    } else {
        if (media_thumb->thumb_obj)
            return;
    }

    pthread_mutex_lock(&media_thumb->lock);
    thumb = media_thumb->thumb_img;
    if (thumb == NULL) {
        thumb = malloc(sizeof(lv_img_dsc_t));
        memset(thumb, 0, sizeof(lv_img_dsc_t));
    }
    thumb->header.always_zero = 0;
    thumb->header.w = THUMB_W;
    thumb->header.h = THUMB_H;
    thumb->data_size = THUMB_W * THUMB_H * 4;
    thumb->header.cf = LV_IMG_CF_TRUE_COLOR_ALPHA;
    if (thumb->data == NULL)
        thumb->data = malloc(thumb->data_size);
    memset((void *)thumb->data, 0x00, thumb->data_size);

    lv_font_t * font = ttf_info_24.font;
    uint32_t font_size = ttf_info_24.weight;
    int32_t img_x = CTRL_GOP + (pos % ROW_NUM) * (THUMB_INTERVAL_HOR + THUMB_W);
    int32_t img_y = CTRL_GOP + (pos / ROW_NUM) * (THUMB_H + font_size + THUMB_INTERVAL_VERT);
    int32_t text_x = img_x;
    int32_t text_y = img_y + THUMB_H;

    char str_time1[32] = {0};
    char str_time2[32] = {0};
    char str_time3[32] = {0};
    char str_new_name[RKADK_MAX_FILE_PATH_LEN] = {0};

    if (playlist_ctx.type == PLAYER_TYPE_VIDEO) {
        media_thumb->thumb_obj = obj = lv_img_create(playlist_ctrl.list_obj);
        lv_img_set_src(obj, thumb);
        lv_obj_set_pos(obj, img_x, img_y);
        lv_obj_set_size(obj, THUMB_W, THUMB_H);
        obj = lv_imgbtn_create(obj);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_play, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_play, NULL);
        lv_obj_add_event_cb(obj, video_player_event_cb, LV_EVENT_CLICKED, (void *)pos);
        lv_obj_align(obj, LV_ALIGN_CENTER, 0, 0);
        lv_obj_set_size(obj, index_icon_play->header.w, index_icon_play->header.h);
        if (3 == sscanf(file, "%[^_]_%[^_]_%[^.].mp4", str_time1, str_time2, str_time3)) {
            playlist_ctx.list.file[pos].stTime = atoi(str_time3);
            snprintf(str_new_name, sizeof(str_new_name), "%s_%s", str_time1, str_time2);
        } else if (2 == sscanf(file, "%[^_]_%[^.].mp4", str_time1, str_time2)){
            snprintf(str_new_name, sizeof(str_new_name), "%s_%s", str_time1, str_time2);
            playlist_ctx.list.file[pos].stTime = 0;
        } else {
            snprintf(str_new_name, sizeof(str_new_name), "%s", file);
            playlist_ctx.list.file[pos].stTime = 0;
        }
    } else {
        media_thumb->thumb_obj = obj = lv_imgbtn_create(playlist_ctrl.list_obj);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, thumb, NULL);
        lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, thumb, NULL);
        lv_obj_add_event_cb(obj, video_player_event_cb, LV_EVENT_CLICKED, (void *)pos);
        lv_obj_set_pos(obj, img_x, img_y);
        lv_obj_set_size(obj, THUMB_W, THUMB_H);
        if (2 != sscanf(file, "%[^_]_%[^.].jpg", str_time1, str_time2)) {
            snprintf(str_new_name, sizeof(str_new_name), "%s", file);
        } else {
            snprintf(str_new_name, sizeof(str_new_name), "%s_%s", str_time1, str_time2);
        }
    }
    media_thumb->string_obj = obj = lv_label_create(playlist_ctrl.list_obj);
    lv_obj_set_style_text_font(obj,  font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);
    lv_obj_set_pos(obj, text_x, text_y);
    lv_label_set_text(obj, str_new_name);
    media_thumb->flag = 0;
    pthread_mutex_unlock(&media_thumb->lock);
    media_thumb->thumb_img = thumb;
    playlist_ctx.list.file[pos].thumb = (void *)media_thumb;
}

static void preview_time_handler(lv_timer_t *media_lib_timer) {
    int i;
    static int start_p = 0;
    int free_count = 0;
    int create_count = 0;
    int start = 0;
    int end = LINE_NUM;

    if (playlist_ctx.line_pos > (LINE_NUM) / 2) {
        start = playlist_ctx.line_pos - (LINE_NUM) / 2;
        end = playlist_ctx.line_pos + (LINE_NUM) / 2;
    }
    if (start_p != start)
        start_p = start;

    for (i = 0; i < playlist_ctx.list.s32FileNum; i++) {
        int cur = i / ROW_NUM;
        MEDIA_THUMB *media_thumb = playlist_ctx.list.file[i].thumb;

        if (free_count < 8) {
            if ((cur < start) || (cur > end)) {
                if (media_thumb) {
                    pthread_mutex_lock(&media_thumb->lock);
                    if (media_thumb->thumb_obj && media_thumb->string_obj) {
                        ui_common_remove_stype_all(media_thumb->thumb_obj);
                        lv_obj_del(media_thumb->thumb_obj);
                        ui_common_remove_stype_all(media_thumb->string_obj);
                        lv_obj_del(media_thumb->string_obj);
                        media_thumb->thumb_obj = NULL;
                        media_thumb->string_obj = NULL;
                        free_count++;
                    }
                    pthread_mutex_unlock(&media_thumb->lock);
                }
            }
        }

        if (create_count < 8) {
            if ((cur >= start) && (cur <= end)) {
                if (!(media_thumb && media_thumb->thumb_obj)) {
                    media_lib_thumb_create(i);
                    create_count++;
                }
            }
        }

        if (media_thumb && media_thumb->thumb_obj && media_thumb->flag == 1) {
            media_thumb->flag = 2;
            lv_img_dsc_t *thumb = media_thumb->thumb_img;
            if (thumb) {
                if (PLAYER_TYPE_VIDEO == playlist_ctx.type) {
                    lv_img_set_src(media_thumb->thumb_obj, thumb);
                } else {
                    lv_imgbtn_set_src(media_thumb->thumb_obj, LV_IMGBTN_STATE_RELEASED, NULL, thumb, NULL);
                    lv_imgbtn_set_src(media_thumb->thumb_obj, LV_IMGBTN_STATE_PRESSED, NULL, thumb, NULL);
                }
            }
        }
    }
}

static void *thumb_thread(void *arg) {
    int32_t i, ret = -1;
    RKADK_THUMB_ATTR_S stThumbAttr;
    RKADK_JPG_THUMB_TYPE_E eJpgThumbType = RKADK_JPG_THUMB_TYPE_MFP1;
    char filepath[512];

    while (thumb_thread_run) {
        for (i = 0; i < playlist_ctx.list.s32FileNum; i++) {
            if (playlist_ctx.line_update) {
                int j = playlist_ctx.line_pos * ROW_NUM;
                playlist_ctx.line_update = 0;
                if (j < playlist_ctx.list.s32FileNum)
                    i = j;
            }

            MEDIA_THUMB *media_thumb = (MEDIA_THUMB *)playlist_ctx.list.file[i].thumb;
            if (thumb_thread_run && media_thumb) {
                lv_img_dsc_t *thumb = media_thumb->thumb_img;
                pthread_mutex_lock(&media_thumb->lock);
                if (thumb == NULL) {
                    pthread_mutex_unlock(&media_thumb->lock);
                    continue;
                }
                if (media_thumb->thumb_obj == NULL) {
                    lv_img_cache_invalidate_src(thumb);
                    if (thumb->data)
                        free((void *)thumb->data);
                    free(thumb);
                    media_thumb->thumb_img = NULL;
                    pthread_mutex_unlock(&media_thumb->lock);
                    continue;
                }

                if (media_thumb->flag == 0) {
                    memset(&stThumbAttr, 0, sizeof(RKADK_THUMB_ATTR_S));
                    stThumbAttr.u32Width = THUMB_W;
                    stThumbAttr.u32Height = THUMB_H;
                    stThumbAttr.pu8Buf = NULL;
                    stThumbAttr.s32VdecChn = -1;
                    stThumbAttr.s32VpssGrp = -1;
                    stThumbAttr.s32VpssChn = -1;
                    stThumbAttr.enType = RKADK_THUMB_TYPE_BGRA8888;

                    ret = -1;
                    sprintf(filepath, "%s%s", playlist_ctx.list.path, playlist_ctx.list.file[i].filename);
                    if (strstr(playlist_ctx.list.file[i].filename, "jpg") || strstr(playlist_ctx.list.file[i].filename, "jpeg")) {
                        ret = RKADK_PHOTO_GetThmInJpgEx(0, filepath, eJpgThumbType, &stThumbAttr);
                        if (ret)
                            CVR_ERR("RKADK_PHOTO_GetThmInJpg failed");
                    } else if (strstr(playlist_ctx.list.file[i].filename, "mp4")) {
                        ret = RKADK_GetThmInMp4Ex(0, filepath, &stThumbAttr);
                        if (ret)
                            CVR_ERR("RKADK_GetThmInMp4Ex failed\n");
                    }

                    if (ret == 0) {
                        memcpy((void *)thumb->data, (const void*)stThumbAttr.pu8Buf, thumb->data_size);
                        RKADK_ThmBufFree(&stThumbAttr);
                    }
                    media_thumb->flag = 1;
                }
                pthread_mutex_unlock(&media_thumb->lock);
            }
        }
        usleep(10000);
    }
    pthread_exit(NULL);
}

static void playlist_layout(void) {
    static lv_coord_t col_dsc1[] = {LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc1[] = {LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    static lv_coord_t col_dsc2[] = {LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc2[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};

    lv_obj_set_layout(playlist_ctrl.main_obj, LV_LAYOUT_GRID);
    lv_obj_set_style_grid_column_dsc_array(playlist_ctrl.main_obj, col_dsc1, 0);
    lv_obj_set_style_grid_row_dsc_array(playlist_ctrl.main_obj, row_dsc1, 0);
    lv_obj_set_grid_cell(playlist_ctrl.browse_obj, LV_GRID_ALIGN_STRETCH, 0, 1,
                        LV_GRID_ALIGN_STRETCH, 0, 1);
    lv_obj_set_grid_cell(playlist_ctrl.player_obj, LV_GRID_ALIGN_STRETCH, 1, 1,
                        LV_GRID_ALIGN_STRETCH, 0, 1);

    lv_obj_set_layout(playlist_ctrl.browse_obj, LV_LAYOUT_GRID);
    lv_obj_set_style_grid_column_dsc_array(playlist_ctrl.browse_obj, col_dsc2, 0);
    lv_obj_set_style_grid_row_dsc_array(playlist_ctrl.browse_obj, row_dsc2, 0);
    lv_obj_set_grid_cell(playlist_ctrl.exit_obj, LV_GRID_ALIGN_START, 0, 1,
                        LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctrl.title_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                        LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(playlist_ctrl.list_obj, LV_GRID_ALIGN_STRETCH, 0, 3,
                        LV_GRID_ALIGN_STRETCH, 1, 1);
}

static void playlist_create_control(void) {
    uint32_t i;
    lv_obj_t *obj = NULL;
    lv_color_t bg_color = lv_color_hex(0xFF04171D);
    lv_color_t text_color = lv_color_hex(0xffffffff);

    lv_color_t transp_color;
    transp_color.full = 0x00000000;

    obj = lv_obj_create(lv_scr_act());
    lv_obj_set_size(obj, lv_pct(100), lv_pct(100));
    lv_obj_align(obj, LV_ALIGN_TOP_LEFT, 0, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_border_width(obj, 0, 0);
    lv_obj_set_style_pad_all(obj, 0, 0);
    playlist_ctrl.main_obj = obj;

    obj = lv_obj_create(playlist_ctrl.main_obj);
    lv_obj_set_style_bg_color(obj, transp_color, 0);
    lv_obj_set_style_border_color(obj, transp_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    playlist_ctrl.player_obj = obj;

    obj = lv_obj_create(playlist_ctrl.main_obj);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    playlist_ctrl.browse_obj = obj;

    obj = lv_imgbtn_create(playlist_ctrl.browse_obj);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_RELEASED, NULL, index_icon_return_r, NULL);
    lv_imgbtn_set_src(obj, LV_IMGBTN_STATE_PRESSED, NULL, index_icon_return_p, NULL);
    lv_obj_set_size(obj, index_icon_return_r->header.w, index_icon_return_r->header.h);
    lv_obj_add_event_cb(obj, back_event_handler, LV_EVENT_CLICKED, NULL);
    playlist_ctrl.exit_obj = obj;

    obj = lv_label_create(playlist_ctrl.browse_obj);
    lv_obj_set_style_text_font(obj, ttf_info_32.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_label_set_text(obj, playlist_ctx.title);
    playlist_ctrl.title_obj = obj;

    obj = lv_obj_create(playlist_ctrl.browse_obj);
    lv_obj_set_style_bg_color(obj, bg_color, 0);
    lv_obj_set_style_border_color(obj, bg_color, 0);
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_border_width(obj, 0, 0);
    lv_obj_set_style_pad_all(obj, 0, 0);
    lv_obj_add_event_cb(obj, main_event_handler, LV_EVENT_SCROLL, NULL);
    playlist_ctrl.list_obj = obj;

    for (i = 0; (i < playlist_ctx.list.s32FileNum) && ((i / ROW_NUM) < LINE_NUM); i++)
        media_lib_thumb_create(i);

    playlist_ctrl.timer = lv_timer_create(preview_time_handler, 200, NULL);
}

static void playlist_destroy_control(void) {
    if (playlist_ctrl.timer)
        lv_timer_del(playlist_ctrl.timer);
    playlist_ctrl.timer = NULL;

    if (playlist_ctrl.main_obj) {
        ui_common_remove_stype_all(playlist_ctrl.main_obj);
        lv_obj_del(playlist_ctrl.main_obj);
        playlist_ctrl.main_obj = NULL;
    }
}

static int32_t playlist_ctx_init(UI_PLAYLIST_INFO *playlist_info) {
    int32_t ret;

    memset(&playlist_ctx, 0, sizeof(playlist_ctx));

    playlist_ctx.line_pos = 0;
    playlist_ctx.line_update = 0;

    playlist_ctx.type = playlist_info->type;
    playlist_ctx.title = playlist_info->title;
    strncpy(playlist_ctx.res_path, playlist_info->res_path, sizeof(playlist_ctx.res_path) - 1);
    playlist_ctx.res_path[sizeof(playlist_ctx.res_path) - 1] = '\n';

    strncpy(playlist_ctx.list.path, playlist_ctx.res_path, sizeof(playlist_ctx.list.path) - 1);
    playlist_ctx.list.path[sizeof(playlist_ctx.list.path) - 1] = '\n';
    ret = mpu_storage_get_file_list(&playlist_ctx.list, LIST_DESCENDING, NULL);
    if (0 != ret) {
        CVR_ERR("Failed to get playlist!\n");
        return ret;
    }

    return 0;
}

static void playlist_ctx_deinit(void) {
    for (int32_t i = 0; i < playlist_ctx.list.s32FileNum; i++) {
        MEDIA_THUMB *media_thumb = (MEDIA_THUMB *)playlist_ctx.list.file[i].thumb;
        if (media_thumb) {
            lv_img_dsc_t *thumb = media_thumb->thumb_img;
            if (thumb) {
                lv_img_cache_invalidate_src(thumb);
                char *data = (char *)thumb->data;
                if (data)
                    free(data);
                free(thumb);
            }
            pthread_mutex_destroy(&media_thumb->lock);
            free(media_thumb);
        }
        playlist_ctx.list.file[i].thumb = NULL;
    }
    mpu_storage_free_file_list(&playlist_ctx.list);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void ui_playlist_create_window(UI_PLAYLIST_INFO *playlist_info) {
    if (NULL == playlist_info)
        return;

    playlist_ctx_init(playlist_info);
    playlist_create_control();
    playlist_layout();

    ui_player_create_window(playlist_ctx.type, playlist_ctrl.player_obj);

    thumb_thread_run = 1;
    pthread_create(&thumb_tid, NULL, thumb_thread, NULL);

    video_player_event_handler(0);
}

void ui_playlist_destroy_window(void) {
    if (NULL == playlist_ctrl.main_obj)
        return ;

    thumb_thread_run = 0;
    if (thumb_tid)
        pthread_join(thumb_tid, NULL);

    ui_player_destory_window();

    playlist_destroy_control();
    playlist_ctx_deinit();
}