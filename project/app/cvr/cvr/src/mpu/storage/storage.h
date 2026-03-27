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

#ifndef _MEDIA_STORAGE_H_
#define _MEDIA_STORAGE_H_

#include "utils/common.h"

#include <rkadk_param.h>
#include <rkadk_storage.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

HANDLE  media_storage_init(RKADK_STR_DEV_ATTR *cvr_str_attr);
void    media_storage_deinit(HANDLE handle);
int32_t media_storage_format(HANDLE handle, char *format_type);
const char * media_storage_get_devpath(HANDLE handle);
RKADK_MOUNT_STATUS media_storage_get_status(HANDLE handle);
int32_t media_storage_get_capacity(HANDLE handle, int32_t *totalSize, int32_t *freeSize);
int32_t media_storage_get_filenum(HANDLE handle, char *file_list_path);
int32_t media_storage_get_file_list(HANDLE handle, RKADK_FILE_LIST *list,
                                    RKADK_SORT_TYPE sort, RKADK_FILE_FILTER_CALLBACK_FN filter_cb);
int32_t media_storage_free_file_list(RKADK_FILE_LIST *list);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif
