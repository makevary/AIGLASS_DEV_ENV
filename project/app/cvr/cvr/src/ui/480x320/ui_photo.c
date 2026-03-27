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
#include "ui_languages.h"
#include "ui_player.h"

#include "mpu/mpu_photo.h"

#include "XJPEG_wrapper.h"

#include <stdio.h>
#include <time.h>
#include <limits.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

typedef struct {
    player_file_info_t file_info;
    lv_img_dsc_t img_data;

    lv_obj_t *page_obj;

    lv_obj_t *top_bar_obj;
    lv_obj_t *esc_obj;
    lv_obj_t *name_obj;
    lv_obj_t *left_obj;
    lv_obj_t *right_obj;

    lv_group_t *group;
} ui_photo_player_context_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static ui_photo_player_context_t player_ctx;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static int32_t photo_play(void) {
    const char *ptr = NULL;
    lv_img_dsc_t *img_data = &player_ctx.img_data;
    RKADK_THUMB_ATTR_S thumb_attr;

    int32_t thumb_w = lv_disp_get_hor_res(NULL);
    int32_t thumb_h = lv_disp_get_ver_res(NULL);

    memset(&thumb_attr, 0, sizeof(RKADK_THUMB_ATTR_S));
    thumb_attr.u32Width = thumb_w;
    thumb_attr.u32Height = thumb_h;
    thumb_attr.pu8Buf = NULL;
    thumb_attr.s32VdecChn = -1;
    thumb_attr.s32VpssGrp = -1;
    thumb_attr.s32VpssChn = -1;
    thumb_attr.enType = RKADK_THUMB_TYPE_JPEG;

    if (0 != RKADK_PHOTO_GetThmInJpgEx(0, player_ctx.file_info.path, RKADK_JPG_THUMB_TYPE_MFP1, &thumb_attr)) {
        perror("RKADK_PHOTO_GetThmInJpg failed");
        return -1;
    }

    do {
        j_int_t ret;
        jpeg_info_t jinfo;
        j_uint_t jut_mlen;
        j_mem_t jmem_optr = NULL;
        jdec_ctxptr_t jdec_cptr = NULL;

        memset(&jinfo, 0, sizeof(jinfo));

        if (NULL == (jdec_cptr = jdec_alloc(J_NULL)))
            break;

        ret = jdec_config_src(jdec_cptr, JCTRL_MODE_MEM, thumb_attr.pu8Buf, thumb_attr.u32BufSize);
        if (JDEC_ERR_OK != ret) {
            perror("Unable to configure data input source information for JPEG encoding operation.");
            jdec_release(jdec_cptr);
            break;
        }

        ret = jdec_src_info(jdec_cptr, &jinfo);
        if (JDEC_ERR_OK != ret) {
            perror("Failed to get the basic information of the image.");
            jdec_release(jdec_cptr);
            break;
        }

        jut_mlen = jinfo.jit_width * jinfo.jit_height * 4;  //bgra8888: 4 Byte
        jmem_optr = (unsigned char*)calloc(1, jut_mlen);
        if (!(jmem_optr)) {
            perror("Failed to allocate memory for BGRA data.");
            jdec_release(jdec_cptr);
            break;
        }

        ret = jdec_src_to_rgb(jdec_cptr, jmem_optr, 0, jut_mlen, NULL, NULL, JCTRL_CS_BGRA);
        if (JDEC_ERR_OK != ret){
            printf("jdecoder.src_to_rgb() return error : %s\n", jdec_errno_name(ret));
            free(jmem_optr);
            jdec_release(jdec_cptr);
            break;
        }

        if (NULL != img_data->data) {
            free((void*)img_data->data);
            img_data->data = NULL;
        }

        img_data->header.always_zero = 0;
        img_data->header.w = jinfo.jit_width;
        img_data->header.h = jinfo.jit_height;
        img_data->data_size = jut_mlen;
        img_data->header.cf = LV_IMG_CF_TRUE_COLOR_ALPHA;
        img_data->data = jmem_optr;
        lv_obj_set_style_bg_img_src(player_ctx.page_obj, img_data, 0);

        jdec_release(jdec_cptr);

    } while (0);

    RKADK_PHOTO_ThumbBufFree(&thumb_attr);

    ptr = strrchr(player_ctx.file_info.path, '/');
    if (NULL != ptr)
        lv_label_set_text(player_ctx.name_obj, ptr + 1);

    return 0;
}

static void menu_event_cb(lv_event_t * e) {
    lv_event_code_t code = lv_event_get_code(e);
    lv_obj_t * obj = lv_event_get_target(e);

    if (code == LV_EVENT_CLICKED) {
        ui_page_pop_page();
    } else if (code == LV_EVENT_FOCUSED) {
        lv_obj_set_style_outline_color(obj, lv_palette_lighten(LV_PALETTE_LIGHT_BLUE, 5), 0);
        lv_obj_set_style_outline_opa(obj, LV_OPA_COVER, 0);
    } else if (code == LV_EVENT_DEFOCUSED) {
        lv_obj_set_style_outline_opa(obj, LV_OPA_TRANSP, 0);
    }
}

static void photo_player_layout_ctrl(lv_obj_t *page_obj) {
    static lv_coord_t col_dsc[] = {LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_FR(1), LV_GRID_TEMPLATE_LAST};
    static lv_coord_t row_dsc[] = {LV_GRID_CONTENT, LV_GRID_FR(1), LV_GRID_CONTENT, LV_GRID_TEMPLATE_LAST};

    lv_obj_t *top_bar_obj = player_ctx.top_bar_obj;
    lv_obj_t *esc_obj = player_ctx.esc_obj;
    lv_obj_t *name_obj = player_ctx.name_obj;
    lv_obj_t *left_obj = player_ctx.left_obj;
    lv_obj_t *right_obj = player_ctx.right_obj;

    lv_obj_align(top_bar_obj, LV_ALIGN_TOP_MID, 0, 0);
    lv_obj_set_layout(top_bar_obj, LV_LAYOUT_GRID);
    lv_obj_set_style_grid_column_dsc_array(top_bar_obj, col_dsc, 0);
    lv_obj_set_style_grid_row_dsc_array(top_bar_obj, row_dsc, 0);
    lv_obj_set_grid_cell(esc_obj, LV_GRID_ALIGN_START, 0, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(name_obj, LV_GRID_ALIGN_CENTER, 1, 1,
                         LV_GRID_ALIGN_CENTER, 0, 1);
    lv_obj_set_grid_cell(left_obj, LV_GRID_ALIGN_START, 0, 1,
                         LV_GRID_ALIGN_CENTER, 1, 1);
    lv_obj_set_grid_cell(right_obj, LV_GRID_ALIGN_END, 2, 1,
                         LV_GRID_ALIGN_CENTER, 1, 1);
}

static void photo_player_create_ctrl(lv_obj_t *page_obj) {
    lv_obj_t *obj = NULL;
    lv_color_t text_color = lv_color_make(0xff, 0xff, 0xff);
    lv_color_t bg_color = lv_color_make(0x04, 0x17, 0x1D);

    static lv_style_t style;
    lv_style_reset(&style);
    lv_style_init(&style);
    lv_style_set_pad_all(&style, 5);
    lv_style_set_outline_width(&style, 1);
    lv_style_set_outline_opa(&style, LV_OPA_TRANSP);

    lv_obj_set_style_bg_color(page_obj, bg_color, 0);

    player_ctx.top_bar_obj = obj = lv_obj_create(page_obj);
    lv_obj_set_size(obj, lv_pct(100), lv_pct(100));
    lv_obj_set_style_radius(obj, 0, 0);
    lv_obj_set_style_bg_opa(obj, LV_OPA_TRANSP, 0);
    lv_obj_set_style_border_opa(obj, LV_OPA_TRANSP, 0);

    player_ctx.name_obj = obj = lv_label_create(player_ctx.top_bar_obj);
    if (NULL != ui_font_title.font)
        lv_obj_set_style_text_font(obj, ui_font_title.font, 0);
    lv_obj_set_style_text_color(obj, text_color, 0);
    lv_obj_set_style_text_align(obj, LV_TEXT_ALIGN_CENTER, 0);

    player_ctx.esc_obj = obj = lv_img_create(player_ctx.top_bar_obj);
    if (NULL != icon_return_index)
        lv_img_set_src(obj, icon_return_index);
    lv_obj_add_style(obj, &style, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)NULL);

    player_ctx.left_obj = obj = lv_img_create(player_ctx.top_bar_obj);
    if (NULL != icon_switch_left_index)
        lv_img_set_src(obj, icon_switch_left_index);
    lv_obj_add_style(obj, &style, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)NULL);

    player_ctx.right_obj = obj = lv_img_create(player_ctx.top_bar_obj);
    if (NULL != icon_switch_right_index)
        lv_img_set_src(obj, icon_switch_right_index);
    lv_obj_add_style(obj, &style, 0);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_FOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_DEFOCUSED, (void *)NULL);
    lv_obj_add_event_cb(obj, menu_event_cb, LV_EVENT_CLICKED, (void *)NULL);
}

static void photo_player_destroy_ctrl(void) {
    if (player_ctx.top_bar_obj) {
        ui_common_remove_stype_all(player_ctx.top_bar_obj);
        lv_obj_del(player_ctx.top_bar_obj);
        player_ctx.top_bar_obj = NULL;
    }

    if (player_ctx.img_data.data) {
        free((void*)player_ctx.img_data.data);
        player_ctx.img_data.data = NULL;
    }
}

static void photo_player_param_init(lv_obj_t *page_obj) {
    memset(&player_ctx, 0, sizeof(player_ctx));

    player_ctx.page_obj = page_obj;

    player_file_info_t *file_info = (player_file_info_t *)lv_obj_get_user_data(page_obj);
    memcpy(&player_ctx.file_info, file_info, sizeof(player_ctx.file_info));
}

static void photo_player_add_indev(void) {
    lv_group_t *group = lv_port_indev_group_create();
    if (NULL == group)
        return;

    lv_group_add_obj(group, player_ctx.esc_obj);
    //lv_group_add_obj(group, player_ctx.left_obj);
    //lv_group_add_obj(group, player_ctx.right_obj);

    player_ctx.group = group;
}

static void photo_player_delete_indev(void) {
    if (NULL != player_ctx.group) {
        lv_port_indev_group_destroy(player_ctx.group);
        player_ctx.group = NULL;
    }
}

static void photo_player_page_create(lv_obj_t *page_obj) {
    photo_player_param_init(page_obj);
    photo_player_create_ctrl(page_obj);
    photo_player_layout_ctrl(page_obj);
}

static void photo_player_page_enter(lv_obj_t *page_obj) {
    photo_player_add_indev();
    photo_play();
}

static void photo_player_page_exit(lv_obj_t *page_obj) {
    photo_player_delete_indev();
}

static void photo_player_page_destroy(lv_obj_t *page_obj) {
    photo_player_destroy_ctrl();
}

static UI_PAGE_HANDLER_T photo_player_page = {
    .name = "photo_player",
    .init = NULL,
    .create = photo_player_page_create,
    .enter = photo_player_page_enter,
    .destroy = photo_player_page_destroy,
    .exit = photo_player_page_exit
};

UI_PAGE_REGISTER(photo_player_page)