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

#include "osd_core.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t osd_core_init(uint32_t osd_id, RKADK_OSD_ATTR_S *osd_attr_ptr) {
    return RKADK_OSD_Init(osd_id, osd_attr_ptr);
}

int32_t osd_core_deinit(uint32_t osd_id) {
    return RKADK_OSD_Deinit(osd_id);
}

int32_t osd_core_attach_to_stream(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E stream_type,
                                  RKADK_OSD_STREAM_ATTR_S *stream_attr_ptr) {
    return RKADK_OSD_AttachToStream(osd_id, cam_id, stream_type, stream_attr_ptr);
}

int32_t osd_core_update_bitmap(uint32_t osd_id, RKADK_OSD_ATTR_S *osd_attr_ptr) {
    return RKADK_OSD_UpdateBitMap(osd_id, osd_attr_ptr);
}

int32_t osd_core_dettach_from_stream(uint32_t osd_id, uint32_t cam_id, RKADK_STREAM_TYPE_E stream_type) {
    return RKADK_OSD_DettachFromStream(osd_id, cam_id, stream_type);
}