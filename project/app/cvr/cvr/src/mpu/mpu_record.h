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

#ifndef _MPU_RECORD_H_
#define _MPU_RECORD_H_

#include "mpu/record/record_process.h"

#ifdef __cplusplus
extern "C" {
#endif

#define RECORD_ALL_CHN      (-1)

int32_t mpu_record_init(void);
void    mpu_record_deinit(void);
int32_t mpu_record_urgent_video(int32_t cam_id);
int32_t mpu_record_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type);
int32_t mpu_record_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type);
RKADK_CODEC_TYPE_E mpu_record_get_codec_type(uint32_t cam_id);
int32_t mpu_record_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution);
RKADK_PARAM_RES_E mpu_record_get_resolution(uint32_t cam_id);
bool    mpu_record_check_active(int32_t cam_id);
int32_t mpu_record_reset(uint32_t cam_id);
int32_t mpu_record_stop(int32_t cam_id);
int32_t mpu_record_start(int32_t cam_id);
int32_t mpu_record_switch_type(int32_t cam_id, RKADK_REC_TYPE_E rec_type);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif