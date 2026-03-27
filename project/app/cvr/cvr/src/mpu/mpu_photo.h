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

#ifndef _MPU_PHOTO_H_
#define _MPU_PHOTO_H_

#include "photo/photo_core.h"

#ifdef __cplusplus
extern "C" {
#endif

int32_t mpu_photo_init(void);
void    mpu_photo_deinit(void);
void    mpu_photo_capture(uint32_t cam_id);
int32_t mpu_photo_reset(uint32_t cam_id);
int32_t mpu_photo_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif