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

#ifndef _SYS_CORE_H_
#define _SYS_CORE_H_

#include "mpu/sys/common.h"

#include <stdio.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

int32_t     sys_core_init(const char *inicfg_path,
                          const char *global_cfg,
                          const char *sensor_cfg_array);
void        sys_core_deinit(void);
uint32_t    sys_core_get_speaker_volume(void);
int32_t     sys_core_set_speaker_volume(uint32_t volume);
uint32_t    sys_core_get_mic_volume(void);
int32_t     sys_core_set_mic_volume(uint32_t volume);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif