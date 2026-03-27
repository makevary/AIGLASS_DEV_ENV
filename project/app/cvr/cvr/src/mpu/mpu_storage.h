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
#ifndef _MPU_STORAGE_H_
#define _MPU_STORAGE_H_

#include "sys/common.h"
#include "storage/storage.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*STORAGE_EVENT_CALLBACK_FN)(RKADK_MOUNT_STATUS);

int32_t mpu_storage_init(void);
int32_t mpu_storage_deinit(void);
void    mpu_storage_format(void);
RKADK_MOUNT_STATUS mpu_storage_get_status();
void    mpu_storage_event_cb_register(STORAGE_EVENT_CALLBACK_FN cb);
void    mpu_storage_event_cb_unregister(STORAGE_EVENT_CALLBACK_FN cb);
int32_t mpu_storage_get_capacity(int32_t *totalSize, int32_t *freeSize);
int32_t mpu_storage_get_filenum(char *file_list_path);
int32_t mpu_storage_get_file_list(RKADK_FILE_LIST *list, RKADK_SORT_TYPE sort, RKADK_FILE_FILTER_CALLBACK_FN filter_cb);
int32_t mpu_storage_free_file_list(RKADK_FILE_LIST *list);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif