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
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/time.h>

#include "utils/libpthread.h"

#include "core/key_event.h"
#include "core/linux_netlink.h"
#include "core/font_factory.h"
#include "core/multi_timer.h"
#include "core/sys.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

static LIB_PTHREAD_T *timer_thr;
/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static uint64_t platform_ticks_get_func(void){
    struct timespec current_time;
    clock_gettime(CLOCK_MONOTONIC, &current_time);
    return (uint64_t)((current_time.tv_sec * 1000) + (current_time.tv_nsec / 1000000));
}

static void *timer_thread_func(void *arg) {
    MultiTimerYield();
    usleep(50000);
    return NULL;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

static int32_t core_init(void) {
    ft2_init_freetype_library();

    netlink_start_event_monitor();

    key_event_init();

    MultiTimerInstall(platform_ticks_get_func);
    timer_thr = lib_pthread_create("timer_thread", timer_thread_func, NULL);
    if (NULL != timer_thr)
        lib_pthread_resume(timer_thr);

    return 0;
}

static void core_deinit(void) {
    if (timer_thr) {
        lib_pthread_destroy(timer_thr);
        timer_thr = NULL;
    }

    key_event_deinit();

    netlink_stop_event_monitor();

    ft2_term_freetype_library();
}

static module_node_t sys_module = {
    .priority = MODULE_LEVEL_SYSTEM,
    .ops = {
        .init = core_init,
        .deinit = core_deinit,
        .loop = NULL
    }
};

SYS_MODULE_REGISTER(sys_module)