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

#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "core/sys.h"

#include "mpu/mpu_storage.h"
#include "mpu/mpu_record.h"
#include "mpu/mpu_photo.h"
#include "mpu/mpu_rtsp.h"
#include "mpu/sys/mpu_sys.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_mutex_t mutex_Lock = PTHREAD_MUTEX_INITIALIZER;

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
#ifdef USE_LVGL
static void mpu_deinit(void) {
    mpu_rtsp_deinit();

    mpu_photo_deinit();

    mpu_storage_deinit();

    mpu_sys_deinit();
}

static int32_t mpu_init(void) {
    putenv("rt_vo_disable_vop=0");

#ifdef FILE_CACHE
    putenv("file_cache_env=1");
#endif

    putenv("repair_file_env=1");

    if (mpu_sys_init())
        return -1;

    if (mpu_storage_init())
        return -1;

    if (mpu_photo_init())
        return -1;

    if (mpu_rtsp_init())
        return -1;

    mpu_rtsp_start(RTSP_ALL_CHN);

    return 0;
}

static int32_t mpu_sleep(void) {
    mpu_rtsp_deinit();
    mpu_photo_deinit();
    return 0;
}

static int32_t mpu_wakeup(void) {
    mpu_photo_init();
    mpu_rtsp_init();
    return 0;
}

static int32_t mpu_enter_aov(void) {
    return 0;
}

static int32_t mpu_exit_aov(void) {
    return 0;
}

#else
static void mpu_deinit(void) {
    mpu_rtsp_deinit();

    mpu_photo_deinit();

    mpu_record_deinit();

    mpu_storage_deinit();

    mpu_sys_deinit();
}

static int32_t mpu_init(void) {
    putenv("rt_vo_disable_vop=0");

#ifdef FILE_CACHE
    putenv("file_cache_env=1");
#endif

    putenv("repair_file_env=1");

    if (mpu_sys_init())
        return -1;

    if (mpu_storage_init())
        return -1;

    if (mpu_photo_init())
        return -1;

    if (mpu_record_init())
        return -1;

    if (mpu_rtsp_init())
        return -1;

    mpu_record_start(RECORD_ALL_CHN);

    mpu_rtsp_start(RTSP_ALL_CHN);

    return 0;
}

static int32_t mpu_sleep(void) {
    mpu_rtsp_deinit();
    mpu_photo_deinit();
    mpu_record_deinit();

    return 0;
}

static int32_t mpu_wakeup(void) {
    mpu_photo_init();
    mpu_record_init();
    mpu_rtsp_init();

    mpu_record_start(RECORD_ALL_CHN);

    return 0;
}

/**
 * @brief Enter AOV mode
 * @return 0: Success -1: Failure
 */
static int32_t mpu_enter_aov(void) {
    pthread_mutex_lock(&mutex_Lock);

    // De-initialize the RTSP module
    mpu_rtsp_deinit();

    // De-initialize the photo module
    mpu_photo_deinit();

    // Switch to AOV lapse mode
    mpu_record_switch_type(RECORD_ALL_CHN, RKADK_REC_TYPE_AOV_LAPSE);

    pthread_mutex_unlock(&mutex_Lock);

    return 0;
}

/**
 * @brief Enter AOV mode
 * @return 0: Success -1: Failure
 */
static int32_t mpu_exit_aov(void) {
    pthread_mutex_lock(&mutex_Lock);

    // Switch back to normal mode
    mpu_record_switch_type(RECORD_ALL_CHN, RKADK_REC_TYPE_NORMAL);

    // Re-initialize the photo module
    mpu_photo_init();

    // Re-initialize the RTSP module
    mpu_rtsp_init();

    pthread_mutex_unlock(&mutex_Lock);

    return 0;
}

#endif

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

static module_node_t mpu_module = {
    .priority = MODULE_LEVEL_MEDIA,
    .ops = {
        .init = mpu_init,
        .deinit = mpu_deinit,
        .sleep = mpu_sleep,
        .wakeup = mpu_wakeup,
        .enter_aov = mpu_enter_aov,
        .exit_aov = mpu_exit_aov,
    }
};

SYS_MODULE_REGISTER(mpu_module)