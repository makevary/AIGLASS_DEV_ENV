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
#ifndef _MPU_OSD_H_
#define _MPU_OSD_H_

#include "osd_core.h"
#include "core/multi_timer.h"

#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
    RKADK_FORMAT_E format;
    uint32_t max_w;
    uint32_t max_h;
    uint32_t real_w;
    uint32_t real_h;
    uint32_t buf_size;
    u_char *buf_data;
    void *user_data;
} mpu_osd_buf_t, *mpu_osd_buf_p;

typedef struct {
    mpu_osd_buf_p (*create)(void);
    void (*destroy)(mpu_osd_buf_p buf);
    int32_t (*update)(mpu_osd_buf_p buf);
    int32_t (*start)(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E attach, mpu_osd_buf_p buf);
    int32_t (*end)(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E attach, mpu_osd_buf_p buf);
} mpu_osd_operate_t, *mpu_osd_operate_p;

typedef struct {
    uint32_t cam_id;
    uint32_t osd_id;
    RKADK_OSD_TYPE_E osd_type;
    mpu_osd_operate_p op;
} mpu_osd_attr_t, *mpu_osd_attr_p;

int32_t mpu_osd_manual_update(HANDLE task_handle);
int32_t mpu_osd_task_end(HANDLE task_handle);
int32_t mpu_osd_task_start(HANDLE task_handle, RKADK_STREAM_TYPE_E attach,
                           RKADK_OSD_STREAM_ATTR_S *stream_attr_ptr, MultiTimerSpec_t *timing);
int32_t mpu_osd_task_destroy(HANDLE task_handle);
HANDLE  mpu_osd_task_create(mpu_osd_attr_p task_attr);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif