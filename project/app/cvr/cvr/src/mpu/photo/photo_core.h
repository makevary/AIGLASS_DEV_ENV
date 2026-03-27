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

#ifndef _PHOTO_CORE_H_
#define _PHOTO_CORE_H_

#include "utils/common.h"

#include <rkadk_photo.h>
#include <rkadk_common.h>
#include <rkadk_param.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  photo_core_create(RKADK_PHOTO_ATTR_S *photo_attr_ptr);
int32_t photo_core_destroy(HANDLE core_handle);
int32_t photo_core_capture(HANDLE core_handle, RKADK_TAKE_PHOTO_ATTR_S *take_attr_ptr);
int32_t photo_core_reset(HANDLE core_handle);
int32_t photo_core_get_resolution(uint32_t camid, uint32_t *width, uint32_t *height);
int32_t photo_core_set_resolultion(uint32_t cam_id, RKADK_PARAM_RES_E resolution);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
