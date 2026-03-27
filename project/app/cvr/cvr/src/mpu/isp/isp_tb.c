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

#ifdef RKFASTBOOT

#include "isp_tb.h"

#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stddef.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    void *   meta_vir_mem;
    uint32_t meta_size;

    void *   iq_file_vir_mem;
    uint32_t iq_file_size;

    void *   iq_file_vir_mem_2;
    uint32_t iq_file_size_2;

    struct app_param_info *app_params;
    struct sensor_init_cfg *sensor_init[2];
} meta_info_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static meta_info_t * g_meta_param = NULL;

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define MAX_SENSOR_NUM      2

#define DBG(fmt, args...)       printf("ISP META DBG: "fmt"", ##args)
#define INFO(fmt, args...)      printf("ISP META INFO: "fmt"", ##args)
#define ERR(fmt, args...)       printf("ISP META ERR: "fmt"", ##args)

#define MMAP_SIZE (4096UL)          //MMAP_SIZE = 4K
#define MMAP_MASK (MMAP_SIZE - 1)   //MMAP_MASK = 0XFFF

#define SENSOR 0
#define SECONDARY_SENSOR 1

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void dump_meta_sensor_app_params(meta_info_t *handle) {
    for (uint32_t cam_id = 0; cam_id < handle->app_params->cam_num; cam_id++) {
        DBG("\n");
        DBG("sensor[%d] init info:\n", cam_id);
        DBG("cam_w: %d, cam_h: %d\n",
            handle->sensor_init[cam_id]->cam_w,
            handle->sensor_init[cam_id]->cam_h);

        DBG("app[%d] params info:\n", cam_id);
        DBG("venc_w: %d, venc_h: %d, venc_type: %d, venc_bitrate: %d, fps: %d, cam_mirror_flip: %d, night_mode: %d, color_mode: %d\n",
            handle->app_params->venc_w,
            handle->app_params->venc_h,
            handle->app_params->venc_type,
            handle->app_params->venc_bitrate,
            handle->app_params->cam_fps,
            handle->app_params->cam_mirror_flip,
            handle->app_params->night_mode,
            handle->app_params->color_mode);
    }
    DBG("\n");
}

static void* mmap_memory_to_viraddr(off_t phy_addr, size_t size) {
    void *vir_addr, *vir_addr_align_4k;
    int32_t mem_fd, vir_addr_offset;

    if((mem_fd = open("/dev/mem", O_RDWR | O_SYNC)) < 0) {
        perror ("Open dev/mem Error:");
        return NULL;
    }

    vir_addr_align_4k = mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, mem_fd, phy_addr);
    vir_addr_offset = phy_addr & MMAP_MASK;
    vir_addr = vir_addr_align_4k + vir_addr_offset;

    close(mem_fd);
    return vir_addr;
}

static int32_t read_cmdline_to_buf(void *buf, int32_t len) {
    int32_t fd, ret;
    if (buf == NULL || len < 0){
        printf("%s: illegal para\n", __func__);
        return -1;
    }
    memset(buf, 0, len);
    fd = open("/proc/cmdline", O_RDONLY);
    if(fd < 0){
        perror("open:");
        return -1;
    }
    ret = read(fd, buf, len);
    close(fd);
    return ret;
}

static long get_cmd_val(const char *string, int32_t len) {
    char *addr;
    long value = 0;
    char key_equal[16];
    static char cmdline[1024];
    static bool init = 0;

    if (false == init) {
        memset(cmdline, 0, sizeof(cmdline));
        read_cmdline_to_buf(cmdline, sizeof(cmdline));
        init = true;
    }

    snprintf(key_equal, sizeof(key_equal), "%s=", string);
    addr = strstr(cmdline, string);
    if (addr) {
        value = strtol(addr + strlen(string) + 1, NULL, len);
        INFO("get %s value: 0x%0lx\n", string, value);
    }
    return value;
}

static int32_t get_meta_params(meta_info_t *handle) {
    off_t meta_addr;
    int32_t app_param_offset, meta_size;
    void *meta_vir_mem = NULL, *app_vir_addr = NULL, *sensor_init_vir_addr = NULL;

    meta_size = (int32_t)get_cmd_val("meta_part_size", 16);
    if (!meta_size) {
        ERR("Invalid meta parameter.\n");
        return -1;
    }

    meta_addr = (off_t)get_cmd_val("meta_load_addr", 16);
    if (!meta_addr) {
        ERR("Invalid meta parameter.\n");
        return -1;
    }

    meta_vir_mem = mmap_memory_to_viraddr(meta_addr, (size_t)meta_size);
    if (NULL == meta_vir_mem) {
        ERR("meta addr mmap fail.\n");
        return -1;
    }

    handle->meta_size = meta_size;
    handle->meta_vir_mem = meta_vir_mem;

    app_param_offset = (int32_t)get_cmd_val(RK_APP_PARAM_OFFSET, 16);
    app_vir_addr = meta_vir_mem + app_param_offset;
    handle->app_params = (struct app_param_info *)(app_vir_addr);

    sensor_init_vir_addr = meta_vir_mem + SENSOR_INIT_OFFSET;
    handle->sensor_init[SENSOR] = (struct sensor_init_cfg*)(sensor_init_vir_addr);

    handle->iq_file_size = (int32_t)get_cmd_val("rk_iqbin_size", 16);
    if (!handle->iq_file_size) {
        ERR("Invalid meta parameter.\n");
        return -1;
    }
    handle->iq_file_vir_mem = meta_vir_mem + SENSOR_IQ_BIN_OFFSET + offsetof(struct sensor_iq_info, data);

    if (2 == handle->app_params->cam_num) {
        sensor_init_vir_addr = meta_vir_mem + SECONDARY_SENSOR_INIT_OFFSET;
        handle->sensor_init[SECONDARY_SENSOR] = (struct sensor_init_cfg*)(sensor_init_vir_addr);

        handle->iq_file_size_2 = (int32_t)get_cmd_val("rk_iqbin_secondary_size", 16);
        if (!handle->iq_file_size_2) {
            ERR("Invalid meta parameter.\n");
            return -1;
        }
        handle->iq_file_vir_mem_2 = meta_vir_mem + SENSOR_IQ_BIN_OFFSET + SENSOR_IQ_BIN_MAX_SIZE;
    }

    return 0;
}

static void meta_param_free(meta_info_t *meta_info_ptr) {
    if (NULL != meta_info_ptr) {
        if (NULL != meta_info_ptr->meta_vir_mem) {
            munmap(meta_info_ptr->meta_vir_mem, meta_info_ptr->meta_size);
            meta_info_ptr->meta_vir_mem = NULL;
        }
        free(meta_info_ptr);
        meta_info_ptr = NULL;
    }
}

static meta_info_t * meta_param_new(void) {
    int32_t ret;
    meta_info_t *meta_info_ptr = NULL;

    meta_info_ptr = (meta_info_t *)calloc(1, sizeof(meta_info_t));
    if (NULL == meta_info_ptr)
        return NULL;

    ret = get_meta_params(meta_info_ptr);
    if (0 != ret) {
        ERR("Failed to get meta parameters!\n");
        meta_param_free(meta_info_ptr);
        return NULL;
    }

    dump_meta_sensor_app_params(meta_info_ptr);

    return meta_info_ptr;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void isp_tb_deinit(void) {
    if (NULL == g_meta_param)
        return;

    for (int32_t camid = 0; camid < g_meta_param->app_params->cam_num && camid < MAX_SENSOR_NUM; camid++)
        SAMPLE_ISP_Stop(camid);

    meta_param_free(g_meta_param);
    g_meta_param = NULL;
}


int32_t isp_tb_init(void) {
    bool multi_cam;
    char *iq_file_vir_mem = NULL;
    uint32_t iq_file_size = 0;
    int32_t cam_hdr, ret = 0;
    rk_aiq_working_mode_t hdr_mode;
    meta_info_t * meta_param_ptr = NULL;
    SAMPLE_ISP_PARAM isp_param;

    meta_param_ptr = meta_param_new();
    if (NULL == meta_param_ptr) {
        RKADK_LOGE("Failed to obtain meta partition data !");
        return -1;
    }

    cam_hdr = meta_param_ptr->app_params->cam_hdr;
    multi_cam = (meta_param_ptr->app_params->cam_num > 1) ? true : false;
    hdr_mode = (cam_hdr == 5) ? RK_AIQ_WORKING_MODE_ISP_HDR2 : RK_AIQ_WORKING_MODE_NORMAL;

    for (uint32_t camid = 0; camid < meta_param_ptr->app_params->cam_num && camid < MAX_SENSOR_NUM; camid++) {
        iq_file_vir_mem = (camid == 0) ? meta_param_ptr->iq_file_vir_mem : meta_param_ptr->iq_file_vir_mem_2;
        iq_file_size = (camid == 0) ? meta_param_ptr->iq_file_size : meta_param_ptr->iq_file_size_2;

        memset(&isp_param, 0, sizeof(isp_param));
        isp_param.iqFileDir = NULL;
        isp_param.iqDataVirAddr = iq_file_vir_mem;
        isp_param.iqDataSize = iq_file_size;
        isp_param.color_mode = meta_param_ptr->app_params->color_mode;
        isp_param.fps = meta_param_ptr->app_params->cam_fps;
        isp_param.WDRMode = hdr_mode;
        isp_param.bMultiCam = multi_cam;
        ret = SAMPLE_ISP_Start_Ex(camid, isp_param);
        if (ret) {
            RKADK_LOGE("ISP_Start start failed, camid: %d.\n", camid);
            return -1;
        }
    }

    g_meta_param = meta_param_ptr;

    return 0;
}
#endif