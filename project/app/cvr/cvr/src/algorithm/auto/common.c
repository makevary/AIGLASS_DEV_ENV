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

#include "common.h"
#include "media.h"
#include "param.h"

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

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define VIDEO_FRAME_HEAP_SIZE     3

/**********************
 *   STATIC FUNCTIONS
 **********************/
inline unsigned long long current_time_millis() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (unsigned long long)(ts.tv_sec * 1000 + ts.tv_nsec / 1000000);
}

static int32_t read_license_file(const char *path, char **out_data) {
    FILE *fp;
    int32_t file_size;
    char *data;

    fp = fopen(path, "rb");
    if(fp == NULL) {
        CVR_ERR("fopen %s fail!\n", path);
        return -1;
    }
    fseek(fp, 0, SEEK_END);
    file_size = ftell(fp);

    data = (char *)malloc(file_size);
    if (NULL == data) {
        fclose(fp);
        return -1;
    }

    fseek(fp, 0, SEEK_SET);
    if(file_size != fread(data, 1, file_size, fp)) {
        CVR_ERR("fread %s fail!\n", path);
        free(data);
        fclose(fp);
        return -1;
    }

    fclose(fp);

    *out_data = data;
    return file_size;
}

static int32_t rock_auto_push_frame_by_fd(RockAutoHandle handle, uint16_t width, uint16_t height, uint32_t frame_id,
                                          int32_t fd, VIDEO_FRAME_INFO_S *vi_frame) {
    RockAutoRetCode ret;
    RockAutoImage img;

    memset(&img, 0, sizeof(img));
    img.info.width = width;
    img.info.height = height;
    img.info.format = ROCKAUTO_IMAGE_FORMAT_YUV420SP_NV12;
    img.frameId = frame_id;
    img.dataAddr = NULL;
    img.dataPhyAddr = NULL;
    img.dataFd = fd;
    img.extData = (void *)vi_frame;

    ret = ROCKAUTO_PushFrame(handle, &img, NULL);
    if (ROCKAUTO_RET_SUCCESS != ret)
        CVR_ERR("ROCKAUTO_PushFrame failed!. ret = %d\n", ret);

    return ret;
}

static void frame_release_cb(const RockAutoReleaseFrames* releases_frame, void* userdata) {
    auto_context_p auto_ctx = (auto_context_p)userdata;
    auto_common_context_p common_ctx = &auto_ctx->common;

    int32_t ret = 0;
    VIDEO_FRAME_INFO_S *vi_frame = NULL;
    for (uint32_t i = 0; i < releases_frame->count; i++) {
        vi_frame = releases_frame->frames[i].extData;
        if (NULL == vi_frame)
            continue;
        ret = RK_MPI_VI_ReleaseChnFrame(common_ctx->vi.dev_id, common_ctx->vi.chn_id, vi_frame);
        if (ret != RK_SUCCESS)
            CVR_ERR("RK_MPI_VI_ReleaseChnFrame fail %x\n", ret);
        block_data_free(&common_ctx->heap, vi_frame);
    }
}

static void *frame_push_thread(void *arg) {
    int32_t fd = -1;
    int32_t ret = 0;
    int32_t npu_cycle_time_ms;
    unsigned long long before_time, cost_time;
    VIDEO_FRAME_INFO_S *vi_frame = NULL;
    auto_context_t *auto_ctx = (auto_context_t *)arg;
    auto_common_context_p common_ctx = &auto_ctx->common;
    npu_cycle_time_ms = 1000 / common_ctx->vi.fps;
    before_time = current_time_millis();
    static int32_t loopCount = 0;

    vi_frame = (VIDEO_FRAME_INFO_S *)block_data_alloc(&common_ctx->heap);
    if (NULL == vi_frame) {
        usleep(1000 * 500);
        return NULL;
    }

    ret = RK_MPI_VI_GetChnFrame(common_ctx->vi.dev_id, common_ctx->vi.chn_id, vi_frame, 500);
    if (ret != RK_SUCCESS) {
        CVR_ERR("RK_MPI_VI_GetChnFrame timeout %x\n", ret);
        block_data_free(&common_ctx->heap, vi_frame);
        return NULL;
    }

    fd = RK_MPI_MB_Handle2Fd(vi_frame->stVFrame.pMbBlk);

    rock_auto_push_frame_by_fd(common_ctx->handle, vi_frame->stVFrame.u32Width,
                               vi_frame->stVFrame.u32Height, loopCount, fd, vi_frame);

    cost_time = current_time_millis() - before_time;
    if ((cost_time > 0) && (cost_time < npu_cycle_time_ms)) {
        usleep((npu_cycle_time_ms - cost_time) * 1000);
    }

    loopCount++;

    return NULL;
}

static int32_t vi_init(uint32_t vi_dev, uint32_t vi_chn, auto_vi_attr_p vi_attr) {
    RKADK_PARAM_REC_CFG_S *rec_cfg = NULL;

    vi_attr->dev_id = vi_dev;
    vi_attr->chn_id = vi_chn;

    rec_cfg = RKADK_PARAM_GetRecCfg(vi_attr->dev_id);
    if (NULL == rec_cfg) {
        CVR_ERR("RKADK_PARAM_GetCamParam u32CamId[%d] recording configuration failed", vi_attr->dev_id);
        return -1;
    }

    if (0 == rec_cfg->vi_attr[1].stChnAttr.stSize.u32Width ||
        0 == rec_cfg->vi_attr[1].stChnAttr.stSize.u32Height) {
        CVR_ERR("Getting invalid recording parameters.\n");
        return -1;
    }

    vi_attr->width = rec_cfg->vi_attr[1].stChnAttr.stSize.u32Width;
    vi_attr->height = rec_cfg->vi_attr[1].stChnAttr.stSize.u32Height;
    vi_attr->fps = 10;

    return vi_chn_init(vi_attr->dev_id, vi_attr->chn_id);
}

void vi_deinit(auto_vi_attr_p vi_attr) {
    vi_chn_deinit(vi_attr->dev_id, vi_attr->chn_id);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t auto_common_init(auto_common_context_p common_ctx) {
    if (true == common_ctx->vaild) {
        CVR_WARN("already initialized.\n");
        return 0;
    }

    uint32_t vi_dev, vi_chn;
    char* license_key;
    const char *model_path, *license_path;
    int32_t license_size;
    RockAutoRetCode ret;
    adas_param_cfg_t adas_param;
    RockAutoInitParam *param = &common_ctx->param;
    auto_context_p auto_ctx = container_of(common_ctx, auto_context_t, common);

    memset(&adas_param, 0, sizeof(adas_param));

    adas_param_get_cfg(&adas_param);

    model_path = adas_param.model_path;
    license_path = adas_param.license_path;
    vi_dev = adas_param.vi_dev;
    vi_chn = adas_param.vi_chn;

    if (0 == access(license_path, R_OK)) {
        license_size = read_license_file(license_path, &license_key);
        if (0 >= license_size) {
            CVR_ERR("Failed to read license file.\n");
            return -1;
        }

        param->license.memAddr = license_key;
        param->license.memSize = license_size;
    } else {
        CVR_WARN("License does not exist\n");
    }

    snprintf(param->modelPath, sizeof(param->modelPath), "%s", model_path);
    //param->logLevel = ROCKAUTO_LOG_INFO;

    ret = ROCKAUTO_Init(&common_ctx->handle, ROCKAUTO_MODE_VIDEO, param, auto_ctx);
    if (ret != ROCKAUTO_RET_SUCCESS) {
        if (NULL != param->license.memAddr) {
            free(param->license.memAddr);
            param->license.memAddr = NULL;
            param->license.memSize = 0;
        }
        CVR_ERR("ROCKAUTO_Init error %d\n", ret);
        return -1;
    }

    if (NULL != param->license.memAddr) {
        free(param->license.memAddr);
        param->license.memAddr = NULL;
        param->license.memSize = 0;
    }

    vi_init(vi_dev, vi_chn, &common_ctx->vi);

    ROCKAUTO_SetFrameReleaseCallback(common_ctx->handle, frame_release_cb);

    block_data_heap_init(&common_ctx->heap, sizeof(VIDEO_FRAME_INFO_S), VIDEO_FRAME_HEAP_SIZE);

    common_ctx->frame_push_thr = lib_pthread_create("rkauto_frame_push_thread", frame_push_thread, auto_ctx);

    common_ctx->vaild = true;

    return 0;
}

void auto_common_deinit(auto_common_context_p common_ctx) {
    if (true == common_ctx->vaild) {
        if (NULL != common_ctx->handle) {
            ROCKAUTO_Release(common_ctx->handle);
            common_ctx->handle = NULL;
        }

        lib_pthread_destroy(common_ctx->frame_push_thr);
        common_ctx->frame_push_thr = NULL;

        block_data_heap_destroy(&common_ctx->heap);

        vi_deinit(&common_ctx->vi);

        common_ctx->vaild = false;
    }
}

void auto_common_stop(auto_common_context_p common_ctx) {
    if (false == common_ctx->vaild)
        return;

    if (NULL != common_ctx->frame_push_thr)
        lib_pthread_pause(common_ctx->frame_push_thr);
}

void auto_common_start(auto_common_context_p common_ctx) {
    if (false == common_ctx->vaild)
        return;

    if (NULL != common_ctx->frame_push_thr)
        lib_pthread_resume(common_ctx->frame_push_thr);
}