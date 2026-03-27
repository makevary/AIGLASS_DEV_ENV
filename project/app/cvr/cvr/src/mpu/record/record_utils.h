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

#ifndef _RECORD_UTILS_H_
#define _RECORD_UTILS_H_

#include "utils/common.h"

#include <rkadk_param.h>
#include <rkadk_record.h>

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  record_utils_create(RKADK_RECORD_ATTR_S *record_attr_ptr);

int32_t record_utils_start(HANDLE instance);

int32_t record_utils_stop(HANDLE instance);

int32_t record_utils_destroy(HANDLE instance);

int32_t record_utils_reset(HANDLE instance);

int32_t record_utils_manual_split(HANDLE instance,
                                  RKADK_REC_MANUAL_SPLIT_ATTR_S *split_attr_ptr);

int32_t record_utils_filecache_init(FILE_CACHE_ARG *file_cache_attr);

int32_t record_utils_filecache_deinit(void);

void    record_utils_filecache_set_mode(RKADK_REC_TYPE_E rec_type);

int32_t record_utils_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution);

RKADK_PARAM_RES_E record_utils_get_resolution(uint32_t cam_id);

int32_t record_utils_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type);

RKADK_CODEC_TYPE_E record_utils_get_codec_type(uint32_t cam_id);

int32_t record_utils_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif // CVR_MEDIA_RECORD_H_
