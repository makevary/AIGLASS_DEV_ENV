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

#include "storage.h"

#include <rkadk_osd.h>
#include <rkadk_common.h>

HANDLE media_storage_init(RKADK_STR_DEV_ATTR *cvr_str_attr) {
    if (NULL == cvr_str_attr) {
        RKADK_LOGE("Invalid input parameter\n");
        return NULL;
    }

    RKADK_MW_PTR str_handle = NULL;

    if (RKADK_STORAGE_Init(&str_handle, cvr_str_attr)) {
        RKADK_LOGE("Storage init failed.");
        return NULL;
    }

    return str_handle;
}

int32_t media_storage_get_capacity(HANDLE handle, int32_t *totalSize, int32_t *freeSize) {
    if (NULL == handle)
        return -1;

    return RKADK_STORAGE_GetCapacity(&handle, totalSize, freeSize);
}

RKADK_MOUNT_STATUS media_storage_get_status(HANDLE handle) {
    if (NULL == handle)
        return DISK_MOUNT_BUTT;

    return RKADK_STORAGE_GetMountStatus(handle);
}

const char * media_storage_get_devpath(HANDLE handle) {
    if (NULL == handle)
        return NULL;

    return RKADK_STORAGE_GetDevPath(handle);
}

int32_t media_storage_get_file_list(HANDLE handle, RKADK_FILE_LIST *list,
                                    RKADK_SORT_TYPE sort, RKADK_FILE_FILTER_CALLBACK_FN filter_cb) {
    if (NULL == handle)
        return -1;

    RKADK_STORAGE_RegisterFileFilterCB(handle, filter_cb);
    int32_t ret = RKADK_STORAGE_GetFileList(list, handle, sort);
    RKADK_STORAGE_UnRegisterFileFilterCB(handle);

    return ret;
}

int32_t media_storage_free_file_list(RKADK_FILE_LIST *list) {
    return RKADK_STORAGE_FreeFileList(list);
}

int32_t media_storage_format(HANDLE handle, char *format_type) {
    if (NULL == handle)
        return -1;

    return RKADK_STORAGE_Format(handle, format_type);
}

int32_t media_storage_get_filenum(HANDLE handle, char *file_list_path) {
    if (NULL == handle)
        return -1;

    return RKADK_STORAGE_GetFileNum(file_list_path, handle);
}

void media_storage_deinit(HANDLE handle) {
    if (NULL != handle)
        RKADK_STORAGE_Deinit(handle);
}