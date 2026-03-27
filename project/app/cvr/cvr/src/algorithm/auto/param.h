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

#ifndef _AUTO_PARAM_H_
#define _AUTO_PARAM_H_

#include <stdint.h>
#include <string.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    const char * model_path;
    const char * license_path;
    int32_t vi_dev;
    int32_t vi_chn;
    int32_t rgn_handle;
} adas_param_cfg_t, *adas_param_cfg_p;

int32_t adas_param_get_cfg(adas_param_cfg_p param_cfg);
void adas_param_cfg_dump(void);
int32_t adas_param_get_rgn_handle(void);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
