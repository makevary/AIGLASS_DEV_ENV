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

#include "mpu_storage.h"
#include "mpu_photo.h"
#include "mpu/osd/mpu_osd.h"
#include "sys/common.h"
#include "param/photo_param.h"

#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    uint32_t cam_id;
    uint32_t osd_id;
    FILE *file;
    HANDLE core_handle;
    HANDLE osd_handle;
} mpu_photo_context_t, *mpu_photo_context_p;

typedef struct {
    uint32_t photo_cnt;
    mpu_photo_context_t context[CVR_SUPPORT_SENSOR_CNT];
} mpu_photo_manager_t, mpu_photo_manager_p;

/**********************
 *  STATIC VARIABLES
 **********************/
extern mpu_osd_operate_t time_osd_op;

static volatile bool g_photo_init = false;
static mpu_photo_manager_t g_photo_manager;
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

/**********************
 *      MACROS
 **********************/
#define MPU_PHOTO_CHECK_INIT(init, errcode)                                  \
  do {                                                                       \
    if (!(g_photo_init)) {                                                   \
      CVR_ERR("[%s] not init\n", #init);                                     \
      return errcode;                                                        \
    }                                                                        \
  } while (0)

#define MPU_PHOTO_GET_CONTEXT(cam_id, photo_manager) \
    ({ \
        mpu_photo_context_p result = NULL; \
        do { \
            for (uint32_t i = 0; i < (photo_manager)->photo_cnt; i++) { \
                if ((photo_manager)->context[i].cam_id == (cam_id)) { \
                    result = &((photo_manager)->context[i]); \
                    break; \
                } \
            } \
        } while (0); \
        result; \
    })

#define MPU_PHOTO_FOR_EACH_CONTEXT(ctx, photo_manager) \
    for (uint32_t i = 0; i < (photo_manager)->photo_cnt; i++) \
        if (NULL != (ctx = &((photo_manager)->context[i])))

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void callback_photo_data_recv(RKADK_PHOTO_RECV_DATA_S *pstdata) {
    if (!pstdata || !pstdata->pu8DataBuf || pstdata->u32DataLen <= 0) {
        CVR_ERR("Invalid photo data, data_len = %d.\n", pstdata->u32DataLen);
        return;
    }

    time_t timep;
    struct tm *p = NULL;
    char jpeg_path[MAX_PATH_LEN] = {0};
    mpu_photo_context_p ctx = (mpu_photo_context_p)(pstdata->userdata);

    CVR_INFO("Photo_DataRecv enter\n");

    if (ctx->file == NULL) {
        time(&timep);
        p = gmtime(&timep);

        snprintf(jpeg_path, sizeof(jpeg_path), "%s%s%04d%02d%02d_%02d%02d%02d.jpg",
                STR_MOUNT_PATH, STR_PHOTO_PATH, (1900 + p->tm_year), (1 + p->tm_mon), p->tm_mday,
                p->tm_hour, p->tm_min, p->tm_sec);

        CVR_INFO("Save photo path:%s\n", jpeg_path);
        if (!access(jpeg_path, 0)) {
            CVR_WARN("Take photos too frequent!\n");
            return;
        }

        ctx->file = fopen(jpeg_path, "wb");
        if (!ctx->file) {
            CVR_ERR("Create jpeg file(%s) failed!\n", jpeg_path);
            return;
        }

        CVR_INFO("Save jpeg to %s.\n", jpeg_path);
    }

    fwrite(pstdata->pu8DataBuf, 1, pstdata->u32DataLen, ctx->file);

    if (pstdata->bStreamEnd) {
        fflush(ctx->file);
        fclose(ctx->file);
        ctx->file = NULL;
    }
}

static HANDLE time_osd_create(uint32_t cam_id, uint32_t osd_id) {
    HANDLE osd_handle = NULL;
    mpu_osd_attr_t osd_attr = {0};

    osd_attr.cam_id = cam_id;
    osd_attr.osd_id = osd_id;
    osd_attr.op = &time_osd_op;
#ifdef PLATFORM_RV1126
    osd_attr.osd_type = RKADK_OSD_TYPE_EXTRA;
#else
    osd_attr.osd_type = RKADK_OSD_TYPE_NORMAL;
#endif

    osd_handle = mpu_osd_task_create(&osd_attr);
    if (NULL == osd_handle) {
        CVR_ERR("cam_id: %d, Time OSD creation failed!\n", cam_id);
        return NULL;
    }

    return osd_handle;
}

static void time_osd_destroy(HANDLE osd_handle) {
    if (NULL != osd_handle)
        mpu_osd_task_destroy(osd_handle);
}

static int32_t time_osd_start(HANDLE osd_handle) {
    if (NULL == osd_handle)
        return -1;

    RKADK_OSD_STREAM_ATTR_S osd_stream_attr;

    memset(&osd_stream_attr, 0, sizeof(RKADK_OSD_STREAM_ATTR_S));

    osd_stream_attr.bEnableShow = TRUE;
    osd_stream_attr.Origin_X = 16;
    osd_stream_attr.Origin_Y = 16;
    if (mpu_osd_task_start(osd_handle, RKADK_STREAM_TYPE_SNAP, &osd_stream_attr, NULL)) {
        CVR_ERR("Failed to start osd!\n");
        return -1;
    }

    return 0;
}

static int32_t time_osd_stop(HANDLE osd_handle) {
    if (NULL == osd_handle)
        return -1;
    return mpu_osd_task_end(osd_handle);
}

static int32_t time_osd_update(HANDLE osd_handle) {
    if (NULL == osd_handle)
        return -1;
    return mpu_osd_manual_update(osd_handle);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void mpu_photo_capture(uint32_t cam_id) {
    MPU_PHOTO_CHECK_INIT(g_photo_init, );

    RKADK_TAKE_PHOTO_ATTR_S take_attr;
    mpu_photo_context_p ctx = NULL;

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    memset(&take_attr, 0, sizeof(take_attr));

    if (DISK_MOUNTED != mpu_storage_get_status()) {
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        CVR_WARN("Mount point exception.\n");
        return;
    }

    ctx = MPU_PHOTO_GET_CONTEXT(cam_id, &g_photo_manager);
    if (NULL == ctx) {
        CVR_ERR("Invalid handle!\n");
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        return;
    }

    time_osd_update(ctx->osd_handle);

    take_attr.enPhotoType = RKADK_PHOTO_TYPE_SINGLE;
    take_attr.unPhotoTypeAttr.stSingleAttr.s32Time_sec = 0;
    if (photo_core_capture(ctx->core_handle, &take_attr)) {
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        CVR_ERR("Capture failed.\n");
        return;
    }

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}

int32_t mpu_photo_reset(uint32_t cam_id) {
    MPU_PHOTO_CHECK_INIT(g_photo_init, -1);

    int32_t ret;
    mpu_photo_context_p ctx = NULL;

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    ctx = MPU_PHOTO_GET_CONTEXT(cam_id, &g_photo_manager);
    if (NULL == ctx) {
        CVR_ERR("Invalid handle!\n");
        PTHREAD_MUTEX_UNLOCK(mutex_Lock);
        return -1;
    }

    time_osd_stop(ctx->osd_handle);

    ret = photo_core_reset(ctx->core_handle);
    if (ret)
        CVR_ERR("cam_id: %u, photo_core_reset failed!\n", cam_id);

    time_osd_start(ctx->osd_handle);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_photo_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution) {
    int32_t ret;

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    ret = photo_core_set_resolultion(cam_id, resolution);
    if (ret)
        CVR_ERR("cam_id:%d, photo_core_set_resolultion failed!\n", cam_id);

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);

    return ret;
}

int32_t mpu_photo_init(void) {
    if (true == g_photo_init) {
        CVR_WARN("System has been initialized!\n");
        return 0;
    }

    HANDLE core_handle = NULL;
    HANDLE osd_handle = NULL;
    photo_param_cfg_t param_cfg;
    RKADK_PHOTO_ATTR_S photo_attr;
    mpu_photo_context_p ctx = NULL;

    memset(&param_cfg, 0, sizeof(param_cfg));

    if (photo_param_get_cfg(&param_cfg)) {
        CVR_ERR("Failed to get parameters!\n");
        return -1;
    }

    memset(&g_photo_manager, 0, sizeof(g_photo_manager));

    for (uint32_t i = 0; i < param_cfg.photo_cnt && i < TABLE_SIZE(g_photo_manager.context); i++) {
        memset(&photo_attr, 0, sizeof(photo_attr));

        photo_attr.u32CamId = param_cfg.photo_cfg[i].cam_id;
        photo_attr.pfnPhotoDataProc = callback_photo_data_recv;
        photo_attr.userdata = &g_photo_manager.context[i];
        photo_attr.stThumbAttr.bSupportDCF = RKADK_FALSE;
        photo_attr.stThumbAttr.stMPFAttr.eMode = RKADK_PHOTO_MPF_SINGLE;
        photo_attr.stThumbAttr.stMPFAttr.sCfg.u8LargeThumbNum = 1;
        photo_attr.stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Width = 480;
        photo_attr.stThumbAttr.stMPFAttr.sCfg.astLargeThumbSize[0].u32Height = 320;
        core_handle = photo_core_create(&photo_attr);
        if (NULL == core_handle) {
            CVR_ERR("cam_id: %d, photo_core_create failed!\n", param_cfg.photo_cfg[i].cam_id);
            goto fail;
        }

        osd_handle = time_osd_create(param_cfg.photo_cfg[i].cam_id, param_cfg.photo_cfg[i].osd_id);
        if (NULL == osd_handle)
            CVR_WARN("cam_id: %d, time_osd_create failed!\n", param_cfg.photo_cfg[i].cam_id);
        else
            time_osd_start(osd_handle);

        g_photo_manager.context[i].cam_id = param_cfg.photo_cfg[i].cam_id;
        g_photo_manager.context[i].osd_id = param_cfg.photo_cfg[i].osd_id;
        g_photo_manager.context[i].core_handle = core_handle;
        g_photo_manager.context[i].osd_handle = osd_handle;
    }

    g_photo_manager.photo_cnt = param_cfg.photo_cnt;

    g_photo_init = true;

    return 0;

fail:
    MPU_PHOTO_FOR_EACH_CONTEXT(ctx, &g_photo_manager) {
        if (ctx->osd_handle) {
            time_osd_stop(ctx->osd_handle);
            time_osd_destroy(ctx->osd_handle);
            ctx->osd_handle  = NULL;
        }

        if (ctx->core_handle) {
            photo_core_destroy(core_handle);
            ctx->core_handle = NULL;
        }
    }

    return -1;
}

void mpu_photo_deinit(void) {
    MPU_PHOTO_CHECK_INIT(g_photo_init, );

    mpu_photo_context_p ctx = NULL;

    PTHREAD_MUTEX_LOCK(mutex_Lock);

    MPU_PHOTO_FOR_EACH_CONTEXT(ctx, &g_photo_manager) {
        if (ctx->osd_handle) {
            time_osd_stop(ctx->osd_handle);
            time_osd_destroy(ctx->osd_handle);
            ctx->osd_handle  = NULL;
        }

        if (ctx->core_handle) {
            photo_core_destroy(ctx->core_handle);
            ctx->core_handle = NULL;
        }
    }

    g_photo_init = false;

    PTHREAD_MUTEX_UNLOCK(mutex_Lock);
}