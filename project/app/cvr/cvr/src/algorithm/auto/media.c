/*
 * Copyright (c) 2024 Rockchip, Inc. All Rights Reserved.
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

#include "utils/log.h"
#include "utils/common.h"

#include "media.h"

#include <rkadk_param.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum rkCOLOR_INDEX_E {
	RGN_COLOR_LUT_INDEX_0 = 0,
	RGN_COLOR_LUT_INDEX_1 = 1,
} COLOR_INDEX_E;

/**********************
 *  STATIC VARIABLES
 **********************/
static RK_U8 rgn_color_lut_0_left_value[4] = {0x03, 0xf, 0x3f, 0xff};
static RK_U8 rgn_color_lut_0_right_value[4] = {0xc0, 0xf0, 0xfc, 0xff};
static RK_U8 rgn_color_lut_1_left_value[4] = {0x02, 0xa, 0x2a, 0xaa};
static RK_U8 rgn_color_lut_1_right_value[4] = {0x80, 0xa0, 0xa8, 0xaa};

/**********************
 *      MACROS
 **********************/
#define RED_COLOR 0x0000FF
#define BLUE_COLOR 0xFF0000

/**********************
 *   STATIC FUNCTIONS
 **********************/
static int32_t draw_rect_2bpp(RK_U8 *buffer, RK_U32 width, RK_U32 height, int rgn_x, int rgn_y,
                      int rgn_w, int rgn_h, int line_pixel, COLOR_INDEX_E color_index) {
    int32_t i;
    RK_U8 *ptr = buffer;
    RK_U8 value = 0;
    if (color_index == RGN_COLOR_LUT_INDEX_0)
        value = 0xff;
    if (color_index == RGN_COLOR_LUT_INDEX_1)
        value = 0xaa;

    if (line_pixel > 4) {
        printf("line_pixel > 4, not support\n");
        return -1;
    }

    //draw top line
    ptr += (width * rgn_y + rgn_x) >> 2;
    for (i = 0; i < line_pixel; i++) {
        memset(ptr, value, (rgn_w + 3) >> 2);
        ptr += width >> 2;
    }

    // draw letft/right line
    for (i = 0; i < (rgn_h - line_pixel * 2); i++) {
        if (color_index == RGN_COLOR_LUT_INDEX_1) {
            *ptr = rgn_color_lut_1_left_value[line_pixel - 1];
            *(ptr + ((rgn_w + 3) >> 2)) = rgn_color_lut_1_right_value[line_pixel - 1];
        } else {
            *ptr = rgn_color_lut_0_left_value[line_pixel - 1];
            *(ptr + ((rgn_w + 3) >> 2)) = rgn_color_lut_0_right_value[line_pixel - 1];
        }
        ptr += width >> 2;
    }

    // draw bottom line
    for (i = 0; i < line_pixel; i++) {
        memset(ptr, value, (rgn_w + 3) >> 2);
        ptr += width >> 2;
    }
    return 0;
}

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wint-to-pointer-cast"
static int32_t draw_rect_8bpp(RK_U8 * buffer, RK_U32 width, RK_U32 height, int rgn_x, int rgn_y,
                      int rgn_w, int rgn_h, int line_pixel, COLOR_INDEX_E color_index) {
    // actual draw color index, need set color table, and rga dst not support
    // RK_FORMAT_BPP8
    int32_t i, j;
    int32_t pixel_format_byte = 1;
    RK_U8 *ptr = (RK_U8 *)buffer;
    RK_U8 color = 0;

    if (color_index == RGN_COLOR_LUT_INDEX_0)
        color = 0x1;
    if (color_index == RGN_COLOR_LUT_INDEX_1)
        color = 0x2;

    //  draw top line
    ptr += (width * rgn_y + rgn_x);
    for (i = 0; i < line_pixel; i++) {
        memset(ptr, color,
               (rgn_w + line_pixel) * pixel_format_byte); // memset is byte
        ptr += width;
    }

    // draw letft/right line
    for (i = 0; i < (rgn_h - line_pixel * 2); i++) {
        for (j = 0; j < line_pixel; j++) {
            *(ptr + j) = color;
            *(ptr + rgn_w + j) = color;
        }
        ptr += width;
    }

    // draw bottom line
    for (i = 0; i < line_pixel; i++) {
        memset(ptr, color,
               (rgn_w + line_pixel) * pixel_format_byte); // memset is byte
        ptr += width;
    }

    return 0;
}
#pragma GCC diagnostic pop

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t rgn_create_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn, RECT_S *region) {
    RGN_ATTR_S rgn_attr;
    RGN_CHN_ATTR_S rgn_chn_attr;
    int32_t ret = RK_SUCCESS;

    memset(&rgn_attr, 0, sizeof(rgn_attr));
    memset(&rgn_chn_attr, 0, sizeof(rgn_chn_attr));

    rgn_attr.enType = OVERLAY_RGN;
    rgn_attr.unAttr.stOverlay.enPixelFmt = RK_FMT_8BPP;
    rgn_attr.unAttr.stOverlay.stSize.u32Width = region->u32Width;
    rgn_attr.unAttr.stOverlay.stSize.u32Height = region->u32Height;

    ret = RK_MPI_RGN_Create(rgn_handle, &rgn_attr);
    if (RK_SUCCESS != ret) {
        RK_LOGE("RK_MPI_RGN_Create (%d) failed with %#x!", rgn_handle, ret);
        return RK_FAILURE;
    }

    return RK_SUCCESS;
}

int32_t rgn_attach_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn, RECT_S *region) {
    int32_t ret = RK_SUCCESS;
    RGN_CHN_ATTR_S rgn_chn_attr;

    memset(&rgn_chn_attr, 0, sizeof(rgn_chn_attr));

    rgn_chn_attr.bShow = RK_TRUE;
    rgn_chn_attr.enType = OVERLAY_RGN;
    rgn_chn_attr.unChnAttr.stOverlayChn.stPoint.s32X = region->s32X;
    rgn_chn_attr.unChnAttr.stOverlayChn.stPoint.s32Y = region->s32Y;
    rgn_chn_attr.unChnAttr.stOverlayChn.u32BgAlpha = 0;
    rgn_chn_attr.unChnAttr.stOverlayChn.u32FgAlpha = 255;
    rgn_chn_attr.unChnAttr.stOverlayChn.u32Layer = 4;
    rgn_chn_attr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_0] = BLUE_COLOR;
    rgn_chn_attr.unChnAttr.stOverlayChn.u32ColorLUT[RGN_COLOR_LUT_INDEX_1] = RED_COLOR;

    ret = RK_MPI_RGN_AttachToChn(rgn_handle, mpp_chn, &rgn_chn_attr);
    if (RK_SUCCESS != ret) {
        RK_LOGE("RK_MPI_RGN_AttachToChn (%d) failed with %#x!", rgn_handle, ret);
        return RK_FAILURE;
    }

    return RK_SUCCESS;
}

int32_t rgn_detach_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn) {
    int32_t ret = RK_SUCCESS;

    ret = RK_MPI_RGN_DetachFromChn(rgn_handle, mpp_chn);
    if (RK_SUCCESS != ret) {
        RK_LOGE("RK_MPI_RGN_DetachFrmChn (%d) failed with %#x!", rgn_handle, ret);
        return RK_FAILURE;
    }

    return RK_SUCCESS;
}

int32_t rgn_destroy_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn) {
    int32_t ret = RK_SUCCESS;

    ret = RK_MPI_RGN_Destroy(rgn_handle);
    if (RK_SUCCESS != ret) {
        RK_LOGE("RK_MPI_RGN_Destroy [%d] failed with %#x", rgn_handle, ret);
        return RK_FAILURE;
    }

    return RK_SUCCESS;
}

int32_t rgn_draw_rect_from_cvr(RGN_HANDLE rgn_handle, RECT_S *region, RockAutoCvrDetResult *result) {
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wint-to-pointer-cast"
    int16_t x, y, w, h;
    RGN_CANVAS_INFO_S canvas_info;
    int32_t ret = RK_SUCCESS, line_pixel = 2;
    int32_t video_width = DOWNALIGNTO_16(region->u32Width);
    int32_t video_height = DOWNALIGNTO_16(region->u32Height);;
    const RockAutoObjectPerson_result* obj_person = &result->person_result;
    const RockAutoObjectCar_result* obj_car = &result->car_result;

    memset(&canvas_info, 0, sizeof(canvas_info));

    ret = RK_MPI_RGN_GetCanvasInfo(rgn_handle, &canvas_info);
    if (ret != RK_SUCCESS) {
        RK_LOGE("RK_MPI_RGN_GetCanvasInfo failed with %#x!", ret);
        return ret;
    }

    memset((void *)canvas_info.u64VirAddr, 0, canvas_info.u32VirWidth * canvas_info.u32VirHeight);

    for (uint32_t i = 0; i < obj_person->objNum; i++) {
        x = obj_person->personInfo[i].left;
        y = obj_person->personInfo[i].top;
        w = obj_person->personInfo[i].right - obj_person->personInfo[i].left;
        h = obj_person->personInfo[i].bottom - obj_person->personInfo[i].top;

        x = DOWNALIGNTO_16(x);
        y = DOWNALIGNTO_16(y);
        w = DOWNALIGNTO_16((w + 3));
        h = DOWNALIGNTO_16((h + 3));

        while (x + w + line_pixel >= video_width)
            w -= 8;
        while (y + h + line_pixel >= video_height)
            h -= 8;

        RK_LOGD("draw rect x:%d, y:%d, w:%d, h:%d\n", x, y, w, h);
        if (x >= 0 && y >= 0 && w > 0 && h > 0) {
            draw_rect_8bpp((RK_U8 *)canvas_info.u64VirAddr,
                            canvas_info.u32VirWidth, canvas_info.u32VirHeight, x,
                            y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_0);
        }
    }

    for (uint32_t i = 0; i < obj_car->objNum; i++) {
        x = obj_car->carInfo[i].left;
        y = obj_car->carInfo[i].top;
        w = obj_car->carInfo[i].right - obj_car->carInfo[i].left;
        h = obj_car->carInfo[i].bottom - obj_car->carInfo[i].top;

        x = DOWNALIGNTO_16(x);
        y = DOWNALIGNTO_16(y);
        w = DOWNALIGNTO_16((w + 3));
        h = DOWNALIGNTO_16((h + 3));

        while (x + w + line_pixel >= video_width)
            w -= 8;
        while (y + h + line_pixel >= video_height)
            h -= 8;

        RK_LOGD("draw rect x:%d, y:%d, w:%d, h:%d\n", x, y, w, h);
        if (x >= 0 && y >= 0 && w > 0 && h > 0) {
            draw_rect_8bpp((RK_U8 *)canvas_info.u64VirAddr,
                            canvas_info.u32VirWidth, canvas_info.u32VirHeight, x,
                            y, w, h, line_pixel, RGN_COLOR_LUT_INDEX_1);
        }
    }

    ret = RK_MPI_RGN_UpdateCanvas(rgn_handle);
    if (ret != RK_SUCCESS)
        RK_LOGE("RK_MPI_RGN_UpdateCanvas failed with %#x!", ret);

    return ret;
#pragma GCC diagnostic pop
}

int32_t vi_chn_init(uint32_t dev_id, uint32_t chn_id) {
    int32_t ret;
    RKADK_PARAM_REC_CFG_S *rec_cfg = NULL;

    rec_cfg = RKADK_PARAM_GetRecCfg(dev_id);
    if (NULL == rec_cfg) {
        RK_LOGE("RKADK_PARAM_GetCamParam u32CamId[%d] recording configuration failed", dev_id);
        return -1;
    }

    if (0 == rec_cfg->vi_attr[1].stChnAttr.stSize.u32Width ||
        0 == rec_cfg->vi_attr[1].stChnAttr.stSize.u32Height) {
        RK_LOGE("Getting invalid recording parameters.\n");
        return -1;
    }

    // Create VI
    ret = RKADK_MPI_VI_Init(dev_id , rec_cfg->vi_attr[1].u32ViChn, &(rec_cfg->vi_attr[1].stChnAttr));
    if (ret) {
      RK_LOGE("RKADK_MPI_VI_Init faile, ret = %d\n", ret);
      return ret;
    }

    return 0;
}

void vi_chn_deinit(uint32_t dev_id, uint32_t chn_id) {
    RKADK_MPI_VI_DeInit(dev_id, chn_id);
}