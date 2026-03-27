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

#ifndef _RTSP_CORE_H_
#define _RTSP_CORE_H_

#include "utils/common.h"

#include <rkadk_rtsp.h>

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  rtsp_core_create(uint32_t cam_id, uint32_t port, const char *path);
int32_t rtsp_core_start(HANDLE core_handle);
int32_t rtsp_core_stop(HANDLE core_handle);
void    rtsp_core_destroy(HANDLE core_handle);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
