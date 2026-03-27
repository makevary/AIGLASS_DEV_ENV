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

#ifndef _RECORD_PROC_H_
#define _RECORD_PROC_H_

#include "mpu/sys/common.h"
#include "utils/common.h"
#include "record_utils.h"

typedef enum {
    RECORD_CONDITION_ACTION = 0,
    RECORD_CONDITION_READY,
    RECORD_CONDITION_STOP,
    RECORD_CONDITION_IDLE,
    RECORD_CONDITION_INIT,
    RECORD_CONDITION_NORMAL_STR,
    RECORD_CONDITION_ANNORMAL_STR,
    RECORD_CONDITION_BUTT
} RECORD_CONDITION_TYPES_E;

typedef enum {
    RECORD_STATE_TRANS_INIT_BEFORE = 0,
    RECORD_STATE_TRANS_INIT_AFTER,
    RECORD_STATE_TRANS_STOP_BEFORE,
    RECORD_STATE_TRANS_STOP_AFTER,
    RECORD_STATE_TRANS_START_BEFORE,
    RECORD_STATE_TRANS_START_AFTER,
    RECORD_STATE_TRANS_DEINIT_BEFORE,
    RECORD_STATE_TRANS_DEINIT_AFTER
} RECORD_STATE_TYPE_E;

typedef struct {
    uint32_t cam_id;
    RECORD_STATE_TYPE_E state;
} record_proc_state_info_t, *record_proc_state_info_p;

typedef void (*RECORD_STATE_CALLBACK_FN)(HANDLE handle, record_proc_state_info_p state_info);

typedef struct {
    uint32_t cam_id;
    RKADK_RECORD_ATTR_S attr;
    RECORD_STATE_CALLBACK_FN state_cb;
} record_proc_attr_t, *record_proc_attr_p;

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  record_proc_create(record_proc_attr_p attr);
void    record_proc_destroy(HANDLE proc_handle);
int32_t record_proc_state_transition(HANDLE proc_handle, RECORD_CONDITION_TYPES_E contition);
int32_t record_proc_filecache_init(FILE_CACHE_ARG *file_cache_attr);
int32_t record_proc_filecache_deinit(void);
void    record_proc_filecache_set_mode(RKADK_REC_TYPE_E rec_type);
bool    record_proc_check_active(HANDLE proc_handle);
int32_t record_proc_manual_split(HANDLE proc_handle);
int32_t record_proc_reset(HANDLE proc_handle);
int32_t record_proc_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution);
RKADK_PARAM_RES_E record_proc_get_resolution(uint32_t cam_id);
int32_t record_proc_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type);
RKADK_CODEC_TYPE_E record_proc_get_codec_type(uint32_t cam_id);
int32_t record_proc_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif