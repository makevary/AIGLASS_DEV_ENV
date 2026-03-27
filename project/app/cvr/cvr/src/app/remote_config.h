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

#ifndef _CVR_UTILS_REMOTE_CONFIG_H_
#define _CVR_UTILS_REMOTE_CONFIG_H_

#include <rkadk_param.h>
#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */

#ifdef REMOTE_COFNIG

typedef enum {
    REMOTE_UI_MAIN = 0,
    REMOTE_UI_SET,
    REMOTE_UI_BUTT
}REMOTE_UI_TYPE_E;

typedef struct {
    bool valid;
    RKADK_REC_TYPE_E type;
} REMOTE_REC_TYPE_S;

typedef struct {
    bool valid;
    RKADK_PARAM_RES_E type;
} REMOTE_RES_TYPE_S;

typedef struct {
    bool valid;
    RKADK_CODEC_TYPE_E type;
} REMOTE_CODEC_TYPE_S;

typedef struct {
    bool valid;
    REMOTE_UI_TYPE_E type;
} REMOTE_UI_TYPE_S;

typedef struct {
    uint32_t cam_id;
    bool alarm;
    bool take_photo;
    bool reset_record;
    bool tf_card_format;
    bool aov_mode_switch;
    REMOTE_REC_TYPE_S rec_type;
    REMOTE_RES_TYPE_S res_type;
    REMOTE_CODEC_TYPE_S codec_type;
    REMOTE_UI_TYPE_S ui_type;
} REMOTE_CONFIG_PARAM_S;

int32_t remote_cfg_init();
void    remote_cfg_deinit();

#endif

#ifdef __cplusplus
}
#endif  /* __cplusplus */

#endif