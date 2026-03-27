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

#include "utils/log.h"
#include "utils/kernel_list.h"
#include "core/multi_timer.h"

#include "mpu/mpu_storage.h"

#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>
#include <pthread.h>
/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    bool is_init;
    HANDLE storage_handle;
    RKADK_STR_DEV_ATTR *storage_attr;
    MultiTimer timer;
} MPU_STORAGE_MANAGER_S;

struct event_cb_obj {
    STORAGE_EVENT_CALLBACK_FN cb;
    struct list_head head;
};

/**********************
 *  STATIC VARIABLES
 **********************/
static struct event_cb_obj g_event_cb_list = {
    .cb   = NULL,
    .head = LIST_HEAD_INIT(g_event_cb_list.head)
};

static MPU_STORAGE_MANAGER_S g_storage_manager = {
    .is_init = FALSE,
    .storage_handle = NULL,
    .storage_attr = NULL,
};

static pthread_mutex_t g_event_mutex = PTHREAD_MUTEX_INITIALIZER;
static pthread_mutex_t g_res_mutex = PTHREAD_MUTEX_INITIALIZER;
static char format_id[RKADK_MAX_FORMAT_ID_LEN] = {'R', 'K', 'C', 'V', 'R', '1', '.', '0'};
static char volume[RKADK_MAX_VOLUME_LEN] = {'R', 'K', 'C', 'V', 'R', 0};
/**********************
 *      MACROS
 **********************/
#ifdef PLATFORM_RV1126
#define STORAGE_DEVICE_PATH "/dev/mmcblk2p1"
#else 
#define STORAGE_DEVICE_PATH "/dev/mmcblk1p1"
#endif
/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void mpu_storage_event_cb_register(STORAGE_EVENT_CALLBACK_FN cb);
void mpu_storage_event_cb_unregister(STORAGE_EVENT_CALLBACK_FN cb);

/**********************
 *   STATIC FUNCTIONS
 **********************/
static int32_t detect_mount_point(const char * const mount_type,
                                 char *mount_point, char *device_name) {
    if (NULL == mount_type || NULL == mount_point || NULL == device_name)
        return -1;

    FILE *fp = NULL;
    char line[MAX_PATH_LEN] = "";
    char *device, *point, *type;

    fp = fopen("/etc/mtab", "r");
    if (NULL == fp)
        return -1;

    while (fgets(line, sizeof(line), fp)) {
        device = strtok(line, " ");
        if (NULL == device)
            continue;

        point = strtok(NULL, " ");
        if (NULL == point)
            continue;

        type = strtok(NULL, " ");
        if (NULL == type)
            continue;

        if (strstr(device, "mmcblk")) {
            if (strstr(type, "ext") || strstr(type, "fat") || strstr(type, "ntfs")) {
                strcpy(device_name, device);
                strcpy(mount_point, point);
                fclose(fp);
                return 0;
            }
        }
    }

    fclose(fp);
    return -1;
}

void mpu_storage_event_cb_register(STORAGE_EVENT_CALLBACK_FN cb) {
    struct event_cb_obj *pos = NULL, *n = NULL, *cb_obj = NULL;

    pthread_mutex_lock(&g_event_mutex);
    list_for_each_entry_safe(pos, n, &g_event_cb_list.head, head) {
        if (cb == pos->cb) {
            CVR_ERR("Failed to register callback function!\n");
            goto out;
        }
    }

    cb_obj = calloc(1, sizeof(struct event_cb_obj));
    if (NULL == cb_obj) {
        CVR_ERR("calloc failed!\n");
        goto out;
    }
    cb_obj->cb = cb;

    list_add_tail(&cb_obj->head, &g_event_cb_list.head);
out:
    pthread_mutex_unlock(&g_event_mutex);
}

void mpu_storage_event_cb_unregister(STORAGE_EVENT_CALLBACK_FN cb) {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&g_event_mutex);
    list_for_each_entry_safe(pos, n, &g_event_cb_list.head, head) {
        if (cb == pos->cb) {
            list_del(&pos->head);
            free(pos);
            break;
        }
    }
    pthread_mutex_unlock(&g_event_mutex);
}

static void storage_event_cb_run(RKADK_MOUNT_STATUS disk_state) {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&g_event_mutex);
    list_for_each_entry_safe(pos, n, &g_event_cb_list.head, head) {
        if (NULL != pos->cb) {
            pos->cb(disk_state);
        }
    }
    pthread_mutex_unlock(&g_event_mutex);
}

/*
static void storage_event_list_destroy() {
    struct event_cb_obj *pos = NULL, *n = NULL;
    pthread_mutex_lock(&g_event_mutex);
    list_for_each_entry_safe(pos, n, &g_event_cb_list.head, head) {
        list_del(&pos->head);
        free(pos);
    }
    pthread_mutex_unlock(&g_event_mutex);
}
*/

RKADK_VOID storage_mount_state_cb(RKADK_MW_PTR pHandle, 
                                  RKADK_MOUNT_STATUS status) {
    storage_event_cb_run(status);
}

static int32_t storage_attr_create(const char *mount_point, const char *device_name,
                                 RKADK_STR_DEV_ATTR **storage_attr) {
    if (NULL == storage_attr) {
        CVR_ERR("Invalid input parameter!!!\n");
        return -1;
    }

    RKADK_STR_DEV_ATTR *temporary = (RKADK_STR_DEV_ATTR *)calloc(1, sizeof(RKADK_STR_DEV_ATTR));
    if (NULL == temporary) {
        CVR_ERR("Calloc failed.\n");
        return -1;
    }

    memset(temporary, 0, sizeof(RKADK_STR_DEV_ATTR));

    strncpy(temporary->cDevPath, device_name, sizeof(temporary->cDevPath) - 1);
    temporary->cDevPath[sizeof(temporary->cDevPath) - 1] = '\0';
    strncpy(temporary->cMountPath, mount_point, sizeof(temporary->cMountPath) - 1);
    temporary->cMountPath[sizeof(temporary->cMountPath) - 1] = '\0';
    memcpy(temporary->cFormatId, format_id, sizeof(temporary->cFormatId));
    memcpy(temporary->cVolume, volume, sizeof(temporary->cVolume));
    temporary->s32CheckFormatId = 1;
    temporary->s32AutoDel = 1;
    temporary->s32FreeSizeDelMin = 200;   /* Turn on automatic deletion when the remaining space is less than 200kb */
    temporary->s32FreeSizeDelMax = 1000;  /* Turn off automatic deletion when the remaining space is greater than 1000kb */
    temporary->s32FolderNum = 5;
    temporary->pfnStatusCallback = storage_mount_state_cb;

    temporary->pstFolderAttr = (RKADK_STR_FOLDER_ATTR *)calloc(temporary->s32FolderNum, sizeof(RKADK_STR_FOLDER_ATTR));
    if (!temporary->pstFolderAttr) {
        CVR_ERR("Calloc failed.\n");
        free(temporary);
        return -1;
    }
    temporary->pstFolderAttr[0].s32SortCond = SORT_FILE_NAME;
    temporary->pstFolderAttr[0].bNumLimit = FALSE;   /* Limit directory storage size */
    temporary->pstFolderAttr[0].s32Limit = 30;       /* Allocate 35% of the total storage size */
    snprintf(temporary->pstFolderAttr[0].cFolderPath,
             sizeof(temporary->pstFolderAttr[0].cFolderPath), "%s", STR_VIDEO_FRONT_PATH);

    temporary->pstFolderAttr[1].s32SortCond = SORT_FILE_NAME;
    temporary->pstFolderAttr[1].bNumLimit = FALSE;   /* Limit directory storage size */
    temporary->pstFolderAttr[1].s32Limit = 30;       /* Allocate 35% of the total storage size */
    snprintf(temporary->pstFolderAttr[1].cFolderPath,
             sizeof(temporary->pstFolderAttr[1].cFolderPath), "%s", STR_VIDEO_BACK_PATH);

    temporary->pstFolderAttr[2].s32SortCond = SORT_FILE_NAME;
    temporary->pstFolderAttr[2].bNumLimit = TRUE;   /* Limit the number of files */
    temporary->pstFolderAttr[2].s32Limit = 64;      /* Store up to 64 pictures */
    snprintf(temporary->pstFolderAttr[2].cFolderPath,
             sizeof(temporary->pstFolderAttr[2].cFolderPath), "%s", STR_PHOTO_PATH);

    temporary->pstFolderAttr[3].s32SortCond = SORT_FILE_NAME;
    temporary->pstFolderAttr[3].bNumLimit = FALSE;  /* Limit directory storage size */
    temporary->pstFolderAttr[3].s32Limit = 15;      /* Allocate 15% of the total storage size */
    snprintf(temporary->pstFolderAttr[3].cFolderPath,
            sizeof(temporary->pstFolderAttr[3].cFolderPath), "%s", STR_URGENT_PATH);

    temporary->pstFolderAttr[4].s32SortCond = SORT_FILE_NAME;
    temporary->pstFolderAttr[4].bNumLimit = FALSE;  /* Limit directory storage size */
    temporary->pstFolderAttr[4].s32Limit = 15;      /* Allocate 15% of the total storage size */
    snprintf(temporary->pstFolderAttr[4].cFolderPath,
            sizeof(temporary->pstFolderAttr[4].cFolderPath), "%s", STR_TIME_LAPSE_PATH);

    *storage_attr = temporary;

    return 0;
}

static void storage_attr_destory(RKADK_STR_DEV_ATTR *storage_attr) {
    if (NULL == storage_attr) {
        CVR_ERR("Invalid input parameter!!!\n");
        return ;
    }

    if (NULL != storage_attr->pstFolderAttr) {
        free(storage_attr->pstFolderAttr);
        storage_attr->pstFolderAttr = NULL;
    }

    free(storage_attr);
    storage_attr = NULL;
}

void mpu_storage_format(void) {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        pthread_exit(NULL);
    }

    double __get_us(struct timeval t) { 
        return (t.tv_sec * 1000000 + t.tv_usec); 
    }

    CVR_WARN("Start formatting the memory card.\n");

    struct timeval start_time, stop_time;

    gettimeofday(&start_time, NULL);
    media_storage_format(g_storage_manager.storage_handle, "vfat");
    gettimeofday(&stop_time, NULL);

    CVR_WARN("Formatting is complete, time-consuming: %f ms.\n", (__get_us(stop_time) - __get_us(start_time)) / 1000);

    PTHREAD_MUTEX_UNLOCK(g_res_mutex);
}

RKADK_MOUNT_STATUS mpu_storage_get_status() {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        return DISK_MOUNT_BUTT;
    }
    RKADK_MOUNT_STATUS state = media_storage_get_status(g_storage_manager.storage_handle);
    PTHREAD_MUTEX_UNLOCK(g_res_mutex);
    return state;
}

int32_t mpu_storage_get_filenum(char *file_list_path) {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        return 0;
    }
    int32_t ret = media_storage_get_filenum(g_storage_manager.storage_handle, file_list_path);

    PTHREAD_MUTEX_UNLOCK(g_res_mutex);
    return ret;
}

int32_t mpu_storage_get_capacity(int32_t *totalSize, int32_t *freeSize) {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        return DISK_MOUNT_BUTT;
    }
    int32_t ret = media_storage_get_capacity(g_storage_manager.storage_handle, 
                                            totalSize, freeSize);

    PTHREAD_MUTEX_UNLOCK(g_res_mutex);
    return ret;
}

int32_t mpu_storage_get_file_list(RKADK_FILE_LIST *list,
                                  RKADK_SORT_TYPE sort, RKADK_FILE_FILTER_CALLBACK_FN filter_cb) {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        return DISK_MOUNT_BUTT;
    }
    int32_t ret = media_storage_get_file_list(g_storage_manager.storage_handle,
                                              list, sort, filter_cb);

    PTHREAD_MUTEX_UNLOCK(g_res_mutex);
    return ret;
}

int32_t mpu_storage_free_file_list(RKADK_FILE_LIST *list) {
    return media_storage_free_file_list(list);
}

static void storage_status_prompt_cb(MultiTimer* timer, void *user_data) {
    RKADK_MOUNT_STATUS mount_state = mpu_storage_get_status();
    if (DISK_NOT_FORMATTED == mount_state ||
        DISK_FORMAT_ERR == mount_state)
        CVR_WARN("Please format the storage.\n");
}

int32_t mpu_storage_init() {
    if (TRUE == g_storage_manager.is_init)
        return -1;

    int32_t ret;
    HANDLE storage_handle = NULL;
    RKADK_STR_DEV_ATTR *storage_attr = NULL;
    MultiTimerSpec_t timing = {};
    char mount_point[MAX_PATH_LEN] = "";
    char device_name[MAX_PATH_LEN] = "";

    ret = detect_mount_point("vfat", mount_point, device_name);
    if (ret) {
        CVR_WARN("No mount point detected, using default path.\n");
        snprintf(device_name, sizeof(device_name), "%s", STORAGE_DEVICE_PATH);
        snprintf(mount_point, sizeof(mount_point), "%s", STR_MOUNT_PATH);
    }

    if (storage_attr_create(mount_point, device_name, &storage_attr)) {
        CVR_ERR("Create attr failed\n");
        return -1;
    }

    storage_handle = media_storage_init(storage_attr);
    if (NULL == storage_handle) {
        CVR_ERR("Can not initialize STORAGE\n");
        goto failure;
    }

    g_storage_manager.is_init = TRUE;
    g_storage_manager.storage_attr = storage_attr;
    g_storage_manager.storage_handle = storage_handle;

    timing.it_value = 3000;        //3s
    timing.it_interval = 1000;     //1s
    MultiTimerStart(&g_storage_manager.timer, &timing, true, storage_status_prompt_cb, NULL);

    return 0;
failure:
    if (NULL != storage_attr)
        storage_attr_destory(storage_attr);

    return -1;
}

int32_t mpu_storage_deinit() {
    PTHREAD_MUTEX_LOCK(g_res_mutex);
    if (TRUE != g_storage_manager.is_init) {
        PTHREAD_MUTEX_UNLOCK(g_res_mutex);
        return -1;
    }

    MultiTimerStop(&g_storage_manager.timer);

    if (NULL != g_storage_manager.storage_handle) {
        media_storage_deinit(g_storage_manager.storage_handle);
        g_storage_manager.storage_handle = NULL;
    }

    if (NULL != g_storage_manager.storage_attr) {
        storage_attr_destory(g_storage_manager.storage_attr);
        g_storage_manager.storage_attr = NULL;
    }

    g_storage_manager.is_init = FALSE;

    PTHREAD_MUTEX_UNLOCK(g_res_mutex);

    return 0;
}