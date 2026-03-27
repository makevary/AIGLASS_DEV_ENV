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

#include "mpu/isp/isp.h"

#include "isp_tb.h"
#include "isp_common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct{
    int32_t (*init)(void);
    void (*deinit)(void);
} isp_operations_t;

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_mutex_t g_mutex_lock = PTHREAD_MUTEX_INITIALIZER;

static isp_operations_t g_isp_fops = {
#ifdef RKFASTBOOT
    .init = isp_tb_init,
    .deinit = isp_tb_deinit,
#else
    .init = isp_common_init,
    .deinit = isp_common_deinit,
#endif
};

static uint32_t g_obj_refcount = 0;

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static int32_t isp_init(void) {
    return g_isp_fops.init();
}

static void isp_deinit(void) {
    g_isp_fops.deinit();
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void isp_get(void) {
    pthread_mutex_lock(&g_mutex_lock);

    if (0 == g_obj_refcount)
       isp_init();

    g_obj_refcount++;

    pthread_mutex_unlock(&g_mutex_lock);
}

void isp_put(void) {
    pthread_mutex_lock(&g_mutex_lock);

    if (g_obj_refcount > 0)
        g_obj_refcount--;

    if (g_obj_refcount == 0)
        isp_deinit();

    pthread_mutex_unlock(&g_mutex_lock);
}

void isp_multi_frame(uint32_t cam_id) {
    SAMPLE_ISP_MultiFrame(cam_id);
}

void isp_single_frame(uint32_t cam_id) {
    SAMPLE_ISP_SingleFrame(cam_id);
}