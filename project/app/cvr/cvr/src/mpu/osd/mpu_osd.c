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

#include "core/multi_timer.h"

#include "mpu_osd.h"

#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    OSD_TASK_RUN = 0,
    OSD_TASK_END,
    OSD_TASK_INIT,
    OSD_TASK_BUTT
} OSD_TASK_STATE_E;

typedef struct {
    uint32_t cam_id;
    uint32_t osd_id;
    mpu_osd_buf_p buf;
    mpu_osd_operate_p op;
    RKADK_OSD_TYPE_E osd_type;

    int32_t timer_fd;
    MultiTimer timer;

    OSD_TASK_STATE_E state;

    RKADK_STREAM_TYPE_E attach;
} mpu_osd_task_t, *mpu_osd_task_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static int32_t osd_update(mpu_osd_task_p osd_task_ptr) {
    int32_t ret;
    RKADK_OSD_ATTR_S osd_attr;

    memset(&osd_attr, 0, sizeof(osd_attr));

    ret = osd_task_ptr->op->update(osd_task_ptr->buf);
    if (0 != ret) {
        CVR_ERR("Failed to update OSD buffer.\n");
        return -1;
    }

#ifdef PLATFORM_RV1126
    osd_attr.enOsdType = RKADK_OSD_TYPE_EXTRA;
#else
    osd_attr.enOsdType = RKADK_OSD_TYPE_NORMAL;
#endif
    osd_attr.enOsdType = osd_task_ptr->osd_type;
    osd_attr.Width = osd_task_ptr->buf->real_w;
    osd_attr.Height = osd_task_ptr->buf->real_h;
    osd_attr.Format = osd_task_ptr->buf->format;
    osd_attr.pData = osd_task_ptr->buf->buf_data;

    ret = osd_core_update_bitmap(osd_task_ptr->osd_id, &osd_attr);
    if (ret) {
        CVR_ERR("RKADK_OSD_Update fail %x.", ret);
        return -1;
    }

    return 0;
}

static void update_time_watermark(MultiTimer* timer, void *user_data) {
    mpu_osd_task_p osd_task = (mpu_osd_task_p)user_data;
    osd_update(osd_task);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t mpu_osd_task_start(HANDLE task_handle, RKADK_STREAM_TYPE_E attach,
                           RKADK_OSD_STREAM_ATTR_S *stream_attr_ptr, MultiTimerSpec_t *timing) {
    if (NULL == task_handle || NULL == stream_attr_ptr) {
        CVR_ERR("Invalid input pointer.\n");
        return -1;
    }

    int32_t ret;
    mpu_osd_task_p osd_task = (mpu_osd_task_p)task_handle;

    if (OSD_TASK_RUN == osd_task->state)
        return 0;

    if (NULL != osd_task->op->start) {
        ret = osd_task->op->start(osd_task->osd_id, osd_task->cam_id, attach, osd_task->buf);
        if (ret) {
            CVR_ERR("cam_id: %u, osd_task->op->start failed !\n.", osd_task->cam_id);
            return -1;
        }
    }

    ret = osd_core_attach_to_stream(osd_task->osd_id, osd_task->cam_id,
                                    attach, stream_attr_ptr);
    if (ret) {
        CVR_ERR("osd_core_attach_to_stream fail %x\n.", ret);
        return -1;
    }

    osd_task->attach = attach;

    if (NULL != timing) {
        MultiTimerStart(&osd_task->timer, timing, true, update_time_watermark, osd_task);
        osd_task->timer_fd = 1;
    }

    osd_task->state = OSD_TASK_RUN;

    return 0;
}

int32_t mpu_osd_task_end(HANDLE task_handle) {
    if (NULL == task_handle) {
        CVR_ERR("Invalid input pointer.\n");
        return -1;
    }

    mpu_osd_task_p osd_task = (mpu_osd_task_p)task_handle;

    if (OSD_TASK_RUN != osd_task->state)
        return -1;

    if (0 < osd_task->timer_fd) {
        MultiTimerStop(&osd_task->timer);
        osd_task->timer_fd = -1;
    }

    int32_t ret = osd_core_dettach_from_stream(osd_task->osd_id, osd_task->cam_id, osd_task->attach);
    if (ret) {
        CVR_ERR("osd_core_dettach_from_stream failed %x\n.", ret);
        return -1;
    }

    if (NULL != osd_task->op->end) {
        ret = osd_task->op->end(osd_task->osd_id, osd_task->cam_id, osd_task->attach, osd_task->buf);
        if (ret) {
            CVR_ERR("cam_id: %u, osd_task->op->end fail %d\n.", osd_task->cam_id, ret);
            return -1;
        }
    }

    osd_task->attach = RKADK_STREAM_TYPE_BUTT;
    osd_task->state = OSD_TASK_END;

    return 0;
}

int32_t mpu_osd_manual_update(HANDLE task_handle) {
    if (NULL == task_handle) {
        CVR_ERR("Invalid input pointer.\n");
        return -1;
    }

    mpu_osd_task_p osd_task = (mpu_osd_task_p)task_handle;

    if (OSD_TASK_RUN != osd_task->state) {
        CVR_ERR("The osd task must now be running! cam_id: %d, osd_id:%d.\n", osd_task->cam_id, osd_task->osd_id);
        return -1;
    }

    if (0 < osd_task->timer_fd) {
        CVR_ERR("In the automatic refresh state, manual refresh is not supported.\n");
        return -1;
    }

    return osd_update(osd_task);
}

HANDLE mpu_osd_task_create(mpu_osd_attr_p task_attr) {
    if (NULL == task_attr) {
        CVR_ERR("invalid input parameter.\n");
        return NULL;
    }

    uint32_t cam_id, osd_id;
    mpu_osd_buf_p osd_buf = NULL;
    mpu_osd_task_p new_task = NULL;;
    RKADK_OSD_ATTR_S osd_attr;

    memset(&osd_attr, 0, sizeof(osd_attr));

    cam_id = task_attr->cam_id;
    osd_id = task_attr->osd_id;

    osd_buf = task_attr->op->create();
    if (NULL == osd_buf) {
        CVR_ERR("Failed to create osd buffer.\n");
        return NULL;
    }

    new_task = (mpu_osd_task_p)calloc(1, sizeof(mpu_osd_task_t));
    if (NULL == new_task) {
        CVR_ERR("calloc OSD_CONTEXT_S fail!\n");
        goto failure;
    }

    osd_attr.enOsdType = task_attr->osd_type;
    osd_attr.Format = osd_buf->format;
    osd_attr.Width = osd_buf->max_w;
    osd_attr.Height = osd_buf->max_h;
    if (RKADK_OSD_Init(osd_id, &osd_attr)) {
        CVR_ERR("osd_init (%d) failed!", osd_id);
        goto failure;
    }

    new_task->timer_fd = -1;
    new_task->cam_id = cam_id;
    new_task->osd_id = osd_id;
    new_task->op = task_attr->op;
    new_task->buf = osd_buf;
    new_task->attach = RKADK_STREAM_TYPE_BUTT;
    new_task->osd_type = task_attr->osd_type;
    new_task->state = OSD_TASK_INIT;

    return new_task;

failure:
    if (NULL != osd_buf)
        task_attr->op->destroy(osd_buf);

    if (NULL != new_task)
        free(new_task);

    return NULL;
}

int32_t mpu_osd_task_destroy(HANDLE task_handle) {
    if (NULL == task_handle) {
        CVR_ERR("Invalid input pointer.");
        return -1;
    }

    mpu_osd_task_p osd_task = (mpu_osd_task_p)task_handle;

    if (OSD_TASK_RUN == osd_task->state)
        mpu_osd_task_end(osd_task);

    RKADK_OSD_Deinit(osd_task->osd_id);

    osd_task->op->destroy(osd_task->buf);
    osd_task->buf = NULL;
    free(osd_task);
    osd_task = NULL;

    return 0;
}