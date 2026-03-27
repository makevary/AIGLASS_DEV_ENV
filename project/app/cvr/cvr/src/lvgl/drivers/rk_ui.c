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

#include <stdlib.h>
#include <unistd.h>
#include <stddef.h>
#include <stdio.h>
#include <fcntl.h>
#include <xf86drm.h>
#include <xf86drmMode.h>

#include <lvgl.h>
#include "disp.h"

#include <rkadk_media_comm.h>
#include <rkadk_ui.h>

#include <rga/rga.h>
#include <rga/RgaApi.h>

/**********************
 *      MACROS
 **********************/
//#define USE_DOUBLE_BUF

#define DRM_CARD          "/dev/dri/card0"
#define DRM_CONNECTOR_ID  -1	/* -1 for the first connected one */

#define DBG_TAG "drm"

#define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))

#define print(msg, ...)    fprintf(stderr, msg, ##__VA_ARGS__);
#define err(msg, ...)  print("error: " msg "\n", ##__VA_ARGS__)
#define info(msg, ...) print(msg "\n", ##__VA_ARGS__)
#define dbg(msg, ...)  {} //print(DBG_TAG ": " msg "\n", ##__VA_ARGS__)

/**********************
 *  GLOBAL PROTOTYPES
 **********************/

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/
struct disp_buffer {
    RKADK_UI_FRAME_INFO frame_info;
    unsigned long int size;
    int32_t fd;
    void *map;
};

struct disp_dev {
    RKADK_MW_PTR ui_ptr;
    lv_disp_rot_t rot;
#ifdef USE_DOUBLE_BUF
    struct disp_buffer *cur_bufs[2]; /* double buffering handling */
    struct disp_buffer bufs[2];
#else
    struct disp_buffer bufs[1];
#endif
    uint32_t width, height;
    uint32_t mm_width, mm_height;
} disp_dev;

/**********************
 *  STATIC VARIABLES
 **********************/


/**********************
 *   STATIC FUNCTIONS
 **********************/
static int32_t drm_open(const char *path) {
    int32_t fd, flags;
    uint64_t has_dumb;
    int32_t ret;

    fd = open(path, O_RDWR);
    if (fd < 0) {
        err("cannot open \"%s\"", path);
        return -1;
    }

    /* set FD_CLOEXEC flag */
    if ((flags = fcntl(fd, F_GETFD)) < 0 ||
         fcntl(fd, F_SETFD, flags | FD_CLOEXEC) < 0) {
        err("fcntl FD_CLOEXEC failed");
        goto err;
    }

    /* check capability */
    ret = drmGetCap(fd, DRM_CAP_DUMB_BUFFER, &has_dumb);
    if (ret < 0 || has_dumb == 0) {
        err("drmGetCap DRM_CAP_DUMB_BUFFER failed or \"%s\" doesn't have dumb "
            "buffer", path);
        goto err;
    }

    return fd;
err:
    close(fd);
    return -1;
}

static int drm_find_connector(int32_t dev_fd) {
    drmModeConnector *conn = NULL;
    drmModeRes *res = NULL;
    int32_t i;

    if ((res = drmModeGetResources(dev_fd)) == NULL) {
        err("drmModeGetResources() failed");
        return -1;
    }

    if (res->count_crtcs <= 0) {
        err("no Crtcs");
        goto free_res;
    }

    /* find all available connectors */
    for (i = 0; i < res->count_connectors; i++) {
        conn = drmModeGetConnector(dev_fd, res->connectors[i]);
        if (!conn)
            continue;

#if DRM_CONNECTOR_ID >= 0
        if (conn->connector_id != DRM_CONNECTOR_ID) {
            drmModeFreeConnector(conn);
            continue;
        }
#endif

        if (conn->connection == DRM_MODE_CONNECTED) {
            dbg("drm: connector %d: connected", conn->connector_id);
        } else if (conn->connection == DRM_MODE_DISCONNECTED) {
            dbg("drm: connector %d: disconnected", conn->connector_id);
        } else if (conn->connection == DRM_MODE_UNKNOWNCONNECTION) {
            dbg("drm: connector %d: unknownconnection", conn->connector_id);
        } else {
            dbg("drm: connector %d: unknown", conn->connector_id);
        }

        if (conn->connection == DRM_MODE_CONNECTED && conn->count_modes > 0)
            break;

        drmModeFreeConnector(conn);
        conn = NULL;
    };

    if (!conn) {
        err("suitable connector not found");
        goto free_res;
    }

    disp_dev.width = conn->modes[0].hdisplay;
    disp_dev.height = conn->modes[0].vdisplay;
    disp_dev.mm_width = conn->mmWidth;
    disp_dev.mm_height = conn->mmHeight;

    return 0;

free_res:
    drmModeFreeResources(res);

    return -1;
}

static int32_t get_disp_info(void) {
    int32_t dev_fd, ret;
    const char *device_path = NULL;

    device_path = getenv("DRM_CARD");
    if (!device_path)
        device_path = DRM_CARD;

    dev_fd = drm_open(device_path);
    if (dev_fd < 0)
        return -1;

    ret = drm_find_connector(dev_fd);
    if (ret) {
        err("available drm devices not found");
        close(dev_fd);
        return -1;
    }

    close(dev_fd);

    info("rk_disp: %dx%d (%dmm X% dmm)",
         disp_dev.width, disp_dev.height, disp_dev.mm_width, disp_dev.mm_height);

    return 0;
}

static int32_t rk_disp_setup(void) {
    int32_t ret;
    RKADK_UI_ATTR_S ui_attr;

    memset(&ui_attr, 0, sizeof(ui_attr));

    ui_attr.u32VoChn = 1;
    ui_attr.u32DispFrmRt = 30;
    ui_attr.u32DispWidth = disp_dev.width;
    ui_attr.u32DispHeight = disp_dev.height;
    ui_attr.u32ImgWidth = disp_dev.width;
    ui_attr.u32ImgHeight = disp_dev.height;
    ui_attr.enUiVoFormat = VO_FORMAT_RGB888;
#if defined(UI_VO_INTF_MIPI)
    ui_attr.enUiVoIntfTye = DISPLAY_TYPE_MIPI;
#else
    ui_attr.enUiVoIntfTye = DISPLAY_TYPE_DEFAULT;
#endif

    ret = RKADK_UI_Create(&ui_attr, &disp_dev.ui_ptr);
    if (0 != ret) {
        err("RKADK_DISP_Init failed(%d)", ret);
        return -1;
    }

    info("rk_disp: ui created successfullyl.");

    return 0;
}

static void rk_disp_teardown(void) {
    if (NULL == disp_dev.ui_ptr)
        return;

    int32_t ret = RKADK_UI_Destroy(disp_dev.ui_ptr);
    if (0 != ret)
        err("RKADK_DISP_Init failed(%d)", ret);

    info("rk_disp: ui destroyed successfully.");
}

static int32_t rk_disp_setup_buffers(void) {
    int32_t ret;
    uint32_t i, size;
    void *blk = NULL;
    RKADK_FORMAT_E format;

    if (LV_COLOR_DEPTH == 32) {
        format = RKADK_FMT_BGRA8888;
    }else {
        format = -1;
        err("drm_flush rga not supported format\n");
        return -1;
    }

    size = disp_dev.width * disp_dev.height * (LV_COLOR_SIZE / 8);
    for (i = 0; i < sizeof(disp_dev.bufs) / sizeof(disp_dev.bufs[0]); i++) {
        ret = RK_MPI_MMZ_Alloc(&blk, size, RK_MMZ_ALLOC_CACHEABLE);
        if (0 != ret) {
            err("alloc failed!");
            break;
        }

        disp_dev.bufs[i].frame_info.Format = format;
        disp_dev.bufs[i].frame_info.pMblk = blk;
        disp_dev.bufs[i].frame_info.u32Width = disp_dev.width;
        disp_dev.bufs[i].frame_info.u32Height = disp_dev.height;
        disp_dev.bufs[i].size = size;
        disp_dev.bufs[i].map = RK_MPI_MMZ_Handle2VirAddr(blk);
        disp_dev.bufs[i].fd = RK_MPI_MMZ_Handle2Fd(blk);

        memset(disp_dev.bufs[i].map, 0x00, size);

        info("rk_disp: ui bufs[%u] application is successful.", i);
    }

#ifdef USE_DOUBLE_BUF
    /* Set buffering handling */
    disp_dev.cur_bufs[0] = NULL;
    disp_dev.cur_bufs[1] = &disp_dev.bufs[0];
#endif

    return 0;
}

static void rk_disp_teardown_buffers(void) {
    for (uint32_t i = 0; i < sizeof(disp_dev.bufs) / sizeof(disp_dev.bufs[0]); i++) {
        if (NULL != disp_dev.bufs[i].frame_info.pMblk) {
            RK_MPI_MMZ_Free(disp_dev.bufs[i].frame_info.pMblk);
            memset(&disp_dev.bufs[i], 0, sizeof(disp_dev.bufs[i]));
            info("rk_disp: ui bufs[%d] released successfully.", i);
        }
    }
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t rk_disp_init(lv_disp_rot_t rotate_disp) {
    int32_t ret;

    ret = get_disp_info();
    if (0 != ret) {
        err("get display info failed");
        return -1;
    }

    ret = rk_disp_setup();
    if (0 != ret) {
        err("rk_disp_setup failed");
        return -1;
    }

    ret = rk_disp_setup_buffers();
    if (0 != ret) {
        err("Allocating display buffer failed");
        goto err;
    }

    disp_dev.rot = rotate_disp;

    return 0;
err:
    rk_disp_teardown();

    return -1;
}

void rk_disp_exit(void) {
    rk_disp_teardown_buffers();
    rk_disp_teardown();
}

static void draw_buf_rotate_90(lv_color_t * color_p, const lv_area_t *area,
                               lv_color_t * dst_buf, lv_coord_t canvas_w, lv_coord_t canvas_h) {
    lv_coord_t area_w = (area->x2 - area->x1 + 1);
    lv_coord_t area_h = (area->y2 - area->y1 + 1);
    uint32_t   initial_i = area->x1 * canvas_w + (canvas_w - area->y1 - 1);
    for (lv_coord_t y = 0; y < area_h; y++) {
        uint32_t i = initial_i - y;
        for (lv_coord_t x = 0; x < area_w; x++) {
            dst_buf[i] = *(color_p++);
            i += canvas_w;
        }
    }
}

#ifdef USE_DOUBLE_BUF
void rk_disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p) {
    int32_t format = 0;
    bool partial_update = false;
    struct disp_buffer *fbuf = disp_dev.cur_bufs[1];
    lv_coord_t w = (area->x2 - area->x1 + 1);
    lv_coord_t h = (area->y2 - area->y1 + 1);
    RKADK_UI_FRAME_INFO ui_frame_info;

    memset(&ui_frame_info, 0, sizeof(ui_frame_info));

    dbg("x %d:%d y %d:%d w %d h %d", area->x1, area->x2, area->y1, area->y2, w, h);

    if (LV_COLOR_DEPTH == 16) {
        format = RK_FORMAT_RGB_565;
    }else if (LV_COLOR_DEPTH == 32) {
        format = RK_FORMAT_ARGB_8888;
    }else {
        format = -1;
        printf("drm_flush rga not supported format\n");
        return;
    }

    rga_info_t src;
    rga_info_t dst;

    /* Partial update */
    if (disp_dev.rot == LV_DISP_ROT_90 || disp_dev.rot == LV_DISP_ROT_270) {
        if ((w != disp_dev.height || h != disp_dev.width) && disp_dev.cur_bufs[0])
            partial_update = true;
    } else {
        if ((w != disp_dev.width || h != disp_dev.height) && disp_dev.cur_bufs[0])
            partial_update = true;
    }

    if (true == partial_update) {
        memset(&src, 0, sizeof(rga_info_t));
        memset(&dst, 0, sizeof(rga_info_t));

        src.fd = disp_dev.cur_bufs[0]->fd;
        src.mmuFlag = 1;
        dst.fd = fbuf->fd;
        dst.mmuFlag = 1;
        rga_set_rect(&src.rect, 0, 0, disp_dev.width, disp_dev.height,
                    disp_dev.width, disp_dev.height, format);
        rga_set_rect(&dst.rect, 0, 0, disp_dev.width, disp_dev.height,
                    disp_dev.width, disp_dev.height, format);
        if (c_RkRgaBlit(&src, &dst, NULL))
            printf("c_RkRgaBlit2 error : %s\n", strerror(errno));
    }

    memset(&src, 0, sizeof(rga_info_t));
    memset(&dst, 0, sizeof(rga_info_t));

    if (disp_dev.rot == LV_DISP_ROT_90 || disp_dev.rot == LV_DISP_ROT_270) {
        if (w < 2 || h < 2) {
            draw_buf_rotate_90(color_p, area, fbuf->map, disp_dev.width, disp_dev.height);
        } else {
            src.virAddr = color_p;
            src.mmuFlag = 1;
            src.rotation = HAL_TRANSFORM_ROT_90;
            dst.fd = fbuf->fd;
            dst.mmuFlag = 1;
            rga_set_rect(&src.rect, 0, 0, w, h, w, h, format);
            rga_set_rect(&dst.rect, (disp_dev.width - (area->y1 + h)), area->x1, h, w,
                        disp_dev.width, disp_dev.height, format);
            if (c_RkRgaBlit(&src, &dst, NULL))
                printf("c_RkRgaBlit2 error : %s\n", strerror(errno));
        }
    } else {
        if (w < 2 || h < 2) {
            for (uint32_t y = 0, i = area->y1 ; i <= area->y2 ; ++i, ++y) {
                memcpy((uint8_t *)fbuf->map + (area->x1 + disp_dev.width * i) * (LV_COLOR_SIZE/8),
                       (uint8_t *)color_p + (w * (LV_COLOR_SIZE/8) * y),
                       w * (LV_COLOR_SIZE/8));
            }
        } else {
            src.virAddr = color_p;
            src.mmuFlag = 1;
            dst.fd = fbuf->fd;
            dst.mmuFlag = 1;
            rga_set_rect(&src.rect, 0, 0, w, h, w, h, format);
            rga_set_rect(&dst.rect, area->x1, area->y1, w, h,
                        disp_dev.width, disp_dev.height, format);
            if (c_RkRgaBlit(&src, &dst, NULL))
                printf("c_RkRgaBlit2 error : %s\n", strerror(errno));
        }
    }

    /* show fbuf plane */
    RK_MPI_SYS_MmzFlushCache(fbuf->frame_info.pMblk, RK_FALSE);
    RKADK_UI_Update(disp_dev.ui_ptr, &(fbuf->frame_info));

    if (!disp_dev.cur_bufs[0])
        disp_dev.cur_bufs[1] = &disp_dev.bufs[1];
    else
        disp_dev.cur_bufs[1] = disp_dev.cur_bufs[0];

    disp_dev.cur_bufs[0] = fbuf;

    lv_disp_flush_ready(disp_drv);
}
#else
void rk_disp_flush(lv_disp_drv_t * disp_drv, const lv_area_t * area, lv_color_t * color_p) {
    int32_t format = 0;
    struct disp_buffer *fbuf = &disp_dev.bufs[0];
    lv_coord_t w = (area->x2 - area->x1 + 1);
    lv_coord_t h = (area->y2 - area->y1 + 1);
    RKADK_UI_FRAME_INFO ui_frame_info;

    memset(&ui_frame_info, 0, sizeof(ui_frame_info));

    dbg("x %d:%d y %d:%d w %d h %d", area->x1, area->x2, area->y1, area->y2, w, h);

    if (LV_COLOR_DEPTH == 16) {
        format = RK_FORMAT_RGB_565;
    }else if (LV_COLOR_DEPTH == 32) {
        format = RK_FORMAT_ARGB_8888;
    }else {
        format = -1;
        printf("drm_flush rga not supported format\n");
        return;
    }

    rga_info_t src;
    rga_info_t dst;

    memset(&src, 0, sizeof(rga_info_t));
    memset(&dst, 0, sizeof(rga_info_t));

    /* Partial update */
    if (disp_dev.rot == LV_DISP_ROT_90 || disp_dev.rot == LV_DISP_ROT_270) {
        if (w < 2 || h < 2) {
            draw_buf_rotate_90(color_p, area, fbuf->map, disp_dev.width, disp_dev.height);
        } else {
            src.virAddr = color_p;
            src.mmuFlag = 1;
            src.rotation = HAL_TRANSFORM_ROT_90;
            dst.fd = fbuf->fd;
            dst.mmuFlag = 1;
            rga_set_rect(&src.rect, 0, 0, w, h, w, h, format);
            rga_set_rect(&dst.rect, (disp_dev.width - (area->y1 + h)), area->x1, h, w,
                        disp_dev.width, disp_dev.height, format);
            if (c_RkRgaBlit(&src, &dst, NULL))
                printf("c_RkRgaBlit2 error : %s\n", strerror(errno));
        }
    } else {
        if (w < 2 || h < 2) {
            for (uint32_t y = 0, i = area->y1 ; i <= area->y2 ; ++i, ++y) {
                memcpy((uint8_t *)fbuf->map + (area->x1 + disp_dev.width * i) * (LV_COLOR_SIZE/8),
                       (uint8_t *)color_p + (w * (LV_COLOR_SIZE/8) * y),
                       w * (LV_COLOR_SIZE/8));
            }
        } else {
            src.virAddr = color_p;
            src.mmuFlag = 1;
            dst.fd = fbuf->fd;
            dst.mmuFlag = 1;
            rga_set_rect(&src.rect, 0, 0, w, h, w, h, format);
            rga_set_rect(&dst.rect, area->x1, area->y1, w, h,
                        disp_dev.width, disp_dev.height, format);
            if (c_RkRgaBlit(&src, &dst, NULL))
                printf("c_RkRgaBlit2 error : %s\n", strerror(errno));
        }
    }

    /* show fbuf plane */
    RK_MPI_SYS_MmzFlushCache(disp_dev.bufs[0].frame_info.pMblk, RK_FALSE);
    RKADK_UI_Update(disp_dev.ui_ptr, &(disp_dev.bufs[0].frame_info));

    lv_disp_flush_ready(disp_drv);
}
#endif

void rk_disp_get_sizes(lv_coord_t *width, lv_coord_t *height, uint32_t *dpi) {
    if (width)
        *width = disp_dev.width;

    if (height)
        *height = disp_dev.height;

    if (dpi && disp_dev.mm_width)
        *dpi = DIV_ROUND_UP(disp_dev.width * 25400, disp_dev.mm_width * 1000);

    return;
}

disp_ops_t rk_ui_ops = {
    rk_disp_init,
    rk_disp_exit,
    rk_disp_get_sizes,
    rk_disp_flush,
};