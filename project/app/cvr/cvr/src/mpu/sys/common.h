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

#ifndef _SYS_COMMON_H_
#define _SYS_COMMON_H_

#include <cvr_conf.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define STR_MOUNT_PATH           CVR_STR_MOUNT_PATH
#define STR_VIDEO_FRONT_PATH     CVR_STR_VIDEO_FRONT_PATH
#define STR_VIDEO_BACK_PATH      CVR_STR_VIDEO_BACK_PATH
#define STR_PHOTO_PATH           CVR_STR_PHOTO_PATH
#define STR_URGENT_PATH          CVR_STR_URGENT_PATH
#define STR_TIME_LAPSE_PATH      CVR_STR_TIME_LAPSE_PATH

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif