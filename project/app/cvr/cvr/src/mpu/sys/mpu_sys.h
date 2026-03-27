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

#ifndef _MPU_SYS_H_
#define _MPU_SYS_H_

#include "mpu/sys/common.h"

#ifdef __cplusplus
extern "C" {
#endif

int32_t     mpu_sys_init(void);
void        mpu_sys_deinit(void);
uint32_t    mpu_sys_get_speaker_volume(void);
int32_t     mpu_sys_set_speaker_volume(uint32_t volume);
uint32_t    mpu_sys_get_mic_volume(void);
int32_t     mpu_sys_set_mic_volume(uint32_t volume);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif