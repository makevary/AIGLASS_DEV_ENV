/****************************************************************************
 *
 *    Copyright (c) 2023 by Rockchip Corp.  All rights reserved.
 *
 *    The material in this file is confidential and contains trade secrets
 *    of Rockchip Corporation. This is proprietary information owned by
 *    Rockchip Corporation. No part of this work may be disclosed,
 *    reproduced, copied, transmitted, or used in any way for any purpose,
 *    without the express written permission of Rockchip Corporation.
 *
 *****************************************************************************/

#include "media.h"
#include "common.h"
#include "param.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/prctl.h>
#include <string.h>
#include <pthread.h>
#include <time.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static auto_context_t g_auto_ctx;
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

/**********************
 *      MACROS
 **********************/
#define CHECK_INIT(init, errcode)                                        \
  do {                                                                         \
    if ((false == init)) {                                                             \
      CVR_ERR("[%s] not init\n", #init);                                      \
      return errcode;                                                          \
    }                                                                          \
  } while (0)

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void *process_thread(void *arg) {
    int32_t ret;
    RockAutoCvrDetResult result;
    auto_cvr_handle_p event_handle = &g_auto_ctx.cvr_event_handle;

    memset(&result, 0, sizeof(result));

    ret = auto_cvr_pop_result(&g_auto_ctx.cvr, &result, 500); //500ms
    if (0 >= ret) {
        CVR_WARN("Waiting for event timed out.\n");
        return NULL;
    }

    rgn_draw_rect_from_cvr(event_handle->rgn_handle, &event_handle->region, &result);

    return NULL;
}

static int32_t cvr_handle_init(auto_cvr_handle_p event_handle) {
    LIB_PTHREAD_T *pthread = NULL;
    RKADK_PARAM_REC_CFG_S *rec_cfg = NULL;

    rec_cfg = RKADK_PARAM_GetRecCfg(g_auto_ctx.common.vi.dev_id);
    if (NULL == rec_cfg) {
        CVR_ERR("RKADK_PARAM_GetCamParam u32CamId[%d] recording configuration failed", g_auto_ctx.common.vi.dev_id);
        return -1;
    }

    event_handle->rgn_handle = adas_param_get_rgn_handle();

    event_handle->mpp_chn.enModId = RK_ID_VENC;
    event_handle->mpp_chn.s32DevId = 0;
    event_handle->mpp_chn.s32ChnId = rec_cfg->attribute[1].venc_chn;

    event_handle->region.s32X = 0;
    event_handle->region.s32Y = 0;
    event_handle->region.u32Width = rec_cfg->attribute[1].width;
    event_handle->region.u32Height = rec_cfg->attribute[1].height;

    pthread = lib_pthread_create("rkauto_process_thread", process_thread, NULL);
    if (NULL == pthread) {
        CVR_ERR("cvr processing thread creation failed!\n");
        return -1;
    }

    if (rgn_create_chn(event_handle->rgn_handle, &event_handle->mpp_chn, &event_handle->region))
        CVR_ERR("RGN creation failed!\n");

    event_handle->process_thr = pthread;

    return 0;
}

static void cvr_handle_deinit(auto_cvr_handle_p event_handle) {
    lib_pthread_destroy(event_handle->process_thr);

    rgn_destroy_chn(event_handle->rgn_handle, &event_handle->mpp_chn);
}

static void cvr_handle_stop(auto_cvr_handle_p event_handle) {
    lib_pthread_pause(event_handle->process_thr);

    rgn_detach_chn(event_handle->rgn_handle, &event_handle->mpp_chn);
}

static void cvr_handle_start(auto_cvr_handle_p event_handle) {
    rgn_attach_chn(event_handle->rgn_handle, &event_handle->mpp_chn, &event_handle->region);

    lib_pthread_resume(event_handle->process_thr);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void algorithm_adas_pause(void) {
    CHECK_INIT(g_auto_ctx.init, );

    pthread_mutex_lock(&mutex_Lock);

    auto_common_stop(&g_auto_ctx.common);

    auto_cvr_clear_event(&g_auto_ctx.cvr);

    cvr_handle_stop(&g_auto_ctx.cvr_event_handle);

    pthread_mutex_unlock(&mutex_Lock);
}

void algorithm_adas_resume(void) {
    CHECK_INIT(g_auto_ctx.init, );

    pthread_mutex_lock(&mutex_Lock);

    auto_common_start(&g_auto_ctx.common);

    auto_cvr_clear_event(&g_auto_ctx.cvr);

    cvr_handle_start(&g_auto_ctx.cvr_event_handle);

    pthread_mutex_unlock(&mutex_Lock);
}

int32_t algorithm_adas_init(void) {
    if (true == g_auto_ctx.init) {
        CVR_WARN("The system has been initialized.\n");
        return 0;
    }

    memset(&g_auto_ctx, 0, sizeof(g_auto_ctx));

    if (auto_common_init(&g_auto_ctx.common)) {
        CVR_ERR("auto_common_init failed!!!\n");
        goto common_init_fail;
    }

    if (auto_cvr_init(&g_auto_ctx.cvr)) {
        CVR_ERR("auto_cvr_init failed!!!\n");
        goto cvr_init_fail;
    }

    if (cvr_handle_init(&g_auto_ctx.cvr_event_handle)) {
        CVR_ERR("cvr_handle_init failed!!!\n");
        goto cvr_event_fail;
    }

    g_auto_ctx.init = true;

    return 0;

cvr_event_fail:
    auto_cvr_deinit(&g_auto_ctx.cvr);

cvr_init_fail:
    auto_common_deinit(&g_auto_ctx.common);

common_init_fail:
    return -1;
}

void algorithm_adas_deinit(void) {
    CHECK_INIT(g_auto_ctx.init, );

    algorithm_adas_pause();

    auto_common_deinit(&g_auto_ctx.common);

    auto_cvr_deinit(&g_auto_ctx.cvr);

    cvr_handle_deinit(&g_auto_ctx.cvr_event_handle);

    memset(&g_auto_ctx, 0, sizeof(g_auto_ctx));
}