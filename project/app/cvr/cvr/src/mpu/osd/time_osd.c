/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
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

#include "utils/common.h"
#include "utils/log.h"
#include "core/font_factory.h"

#include "mpu_osd.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

#define FONT_SIZE_MAX   64
#define MAX_FONT_LEN    128
#define ARGB32_WHITE    0xFFFFFFFF

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void count_osd_travel(uint32_t font_size, uint32_t *bmp_w, uint32_t *bmp_h,
                             uint32_t *bmp_size) {
    time_t timep;
    struct tm *p;
    uint32_t str_len = 0;
    uint32_t buf_w, buf_h, buf_size;
    char wmark_ch[MAX_FONT_LEN] = {0};

    time(&timep);
    p = gmtime(&timep);
    snprintf(wmark_ch, sizeof(wmark_ch), "%04d-%02d-%02d %02d:%02d:%02d",
            (1900 + p->tm_year), (1 + p->tm_mon), p->tm_mday, p->tm_hour,
            p->tm_min, p->tm_sec);

    str_len = strlen(wmark_ch);

    buf_w = UPALIGNTO_16((str_len / 2 + 2) * (font_size));
    buf_h = UPALIGNTO_16(font_size + 16);
    buf_size = buf_w * buf_h * 4;   // BGRA8888 4byte

    if (bmp_w)
        *bmp_w = buf_w;
    if (bmp_h)
        *bmp_h = buf_h;
    if (bmp_size)
        *bmp_size = buf_size;
}

static mpu_osd_buf_t* time_osd_create(void) {
    HANDLE font_handle = NULL;
    mpu_osd_buf_t *osd_buf = NULL;
    uint32_t max_buf_w = 0, max_buf_h = 0, max_buf_size = 0;

    osd_buf = (mpu_osd_buf_t *)calloc(1, sizeof(mpu_osd_buf_t));
    if (NULL == osd_buf) {
        CVR_ERR("Create buffer fail.\n");
        return NULL;
    }

    font_handle = ft2_create_dev_font(CVR_TTF_FILE, FONT_SIZE_MAX);
    if (NULL == font_handle) {
        CVR_ERR("Create font fail.\n");
        goto failure;
    }
    ft2_set_font_color(font_handle, ARGB32_WHITE);

    count_osd_travel(FONT_SIZE_MAX, &max_buf_w, &max_buf_h, &max_buf_size);

    osd_buf->buf_data = (u_char *)calloc(1, max_buf_size);
    if (NULL == osd_buf) {
        CVR_ERR("Create buffer fail.\n");
        goto failure;
    }
    osd_buf->max_w = max_buf_w;
    osd_buf->max_h = max_buf_h;
    osd_buf->buf_size = max_buf_size;
    osd_buf->user_data = font_handle;
    osd_buf->format = RKADK_FMT_ARGB8888;

    return osd_buf;

failure:
    if (NULL != font_handle) {
        ft2_destory_dev_font(font_handle);
        font_handle = NULL;
    }

    if (NULL != osd_buf) {
        free(osd_buf);
        osd_buf = NULL;
    }

    return NULL;
}

static void time_osd_destroy(mpu_osd_buf_t *osd_buf) {
    if (NULL == osd_buf)
        return;

    HANDLE font_handle = osd_buf->user_data;

    if (NULL != font_handle) {
        ft2_destory_dev_font(font_handle);
        font_handle = NULL;
    }

    if (NULL != osd_buf->buf_data) {
        free(osd_buf->buf_data);
        osd_buf->buf_data = NULL;
    }

    free(osd_buf);
    osd_buf = NULL;
}

static int32_t time_osd_start(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E stream_type, mpu_osd_buf_p osd_buf) {
    if (NULL == osd_buf) {
        CVR_ERR("invalid parameter.\n");
        return -1;
    }

    RKADK_PARAM_RES_E res;
    uint32_t font_size = 0;
    HANDLE font_handle = osd_buf->user_data;

    RKADK_PARAM_REC_CFG_S *rec_cfg = RKADK_PARAM_GetRecCfg(cam_id);
    if (!rec_cfg) {
        CVR_ERR("RKADK_PARAM_GetRecCfg failed!\n");
        return -1;
    }

    RKADK_PARAM_PHOTO_CFG_S *photo_cfg = RKADK_PARAM_GetPhotoCfg(cam_id);
    if (!photo_cfg) {
        CVR_ERR("RKADK_PARAM_GetPhotoCfg failed!\n");
        return -1;
    }

    RKADK_PARAM_STREAM_CFG_S *live_cfg = RKADK_PARAM_GetStreamCfg(cam_id, RKADK_STREAM_TYPE_LIVE);
    if (!live_cfg) {
        CVR_ERR("Live RKADK_PARAM_GetStreamCfg Live failed!\n");
        return -1;
    }

    RKADK_PARAM_STREAM_CFG_S *stream_cfg = RKADK_PARAM_GetStreamCfg(cam_id, RKADK_STREAM_TYPE_PREVIEW);
    if (!stream_cfg) {
        CVR_ERR("RKADK_PARAM_GetStreamCfg failed!\n");
        return -1;
    }

    switch (stream_type) {
        case RKADK_STREAM_TYPE_VIDEO_MAIN:
            res = RKADK_PARAM_GetResType(rec_cfg->vi_attr[0].stChnAttr.stSize.u32Width,
                                         rec_cfg->vi_attr[0].stChnAttr.stSize.u32Height);
        break;

        case RKADK_STREAM_TYPE_VIDEO_SUB:
            res = RKADK_PARAM_GetResType(rec_cfg->vi_attr[1].stChnAttr.stSize.u32Width,
                                         rec_cfg->vi_attr[1].stChnAttr.stSize.u32Height);
        break;

        case RKADK_STREAM_TYPE_SNAP:
            res = RKADK_PARAM_GetResType(photo_cfg->image_width, photo_cfg->image_height);
        break;

        case RKADK_STREAM_TYPE_PREVIEW:
            res = RKADK_PARAM_GetResType(stream_cfg->attribute.width, stream_cfg->attribute.height);
        break;

        case RKADK_STREAM_TYPE_LIVE:
            res = RKADK_PARAM_GetResType(live_cfg->attribute.width, live_cfg->attribute.height);
        break;

        default:
            CVR_ERR("Unsuport other stream type!\n");
            return -1;
        break;
    }

    switch (res) {
        case RKADK_RES_720P:
            font_size = 16;
        break;

        case RKADK_RES_1080P:
            font_size = 24;
        break;

        case RKADK_RES_1296P:
        case RKADK_RES_1440P:
        case RKADK_RES_1520P:
             font_size = 40;
        break;

        case RKADK_RES_1600P:
        case RKADK_RES_1620P:
            font_size = 48;
        break;

        case RKADK_RES_1944P:
        case RKADK_RES_2160P:
            font_size = 64;
        break;

        default:
            font_size = 48;
        break;
    }

    if (font_size > FONT_SIZE_MAX)
        font_size = FONT_SIZE_MAX;

    ft2_set_font_size(font_handle, font_size);

    return 0;
}

static int32_t time_osd_end(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E stream_type, mpu_osd_buf_p osd_buf) {
    return 0;
}

static int32_t time_osd_update(mpu_osd_buf_t *osd_buf) {
    if (NULL == osd_buf) {
        CVR_ERR("invalid parameter.\n");
        return -1;
    }

    time_t timep;
    struct tm *p;
    wchar_t wmark_wch[MAX_FONT_LEN] = {0};
    char wmark_ch[MAX_FONT_LEN] = {0};
    uint32_t font_size = 0;
    HANDLE font_handle = osd_buf->user_data;

    memset(wmark_wch, 0, sizeof(wmark_wch));
    memset(wmark_ch, 0, sizeof(wmark_ch));

    font_size = ft2_get_font_size(font_handle);

    time(&timep);
    p = gmtime(&timep);
    snprintf(wmark_ch, sizeof(wmark_ch), "%04d-%02d-%02d %02d:%02d:%02d",
            (1900 + p->tm_year), (1 + p->tm_mon), p->tm_mday, p->tm_hour,
            p->tm_min, p->tm_sec);

    count_osd_travel(font_size, &osd_buf->real_w, &osd_buf->real_h, NULL);

    mbstowcs(wmark_wch, wmark_ch, strlen(wmark_ch));
    memset(osd_buf->buf_data, 0, osd_buf->buf_size);
    ft2_draw_text(font_handle, osd_buf->buf_data,
                  osd_buf->real_w, osd_buf->real_h, wmark_wch);
    return 0;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
mpu_osd_operate_t time_osd_op = {
    .create     = time_osd_create,
    .destroy    = time_osd_destroy,
    .update     = time_osd_update,
    .start      = time_osd_start,
    .end        = time_osd_end
};