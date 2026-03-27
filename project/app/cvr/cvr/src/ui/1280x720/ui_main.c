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

#include "lvgl/porting/lv_port_disp.h"
#include "lvgl/porting/lv_port_indev.h"
#include "lvgl/porting/lv_port_file.h"
#include "lvgl/common/lv_msg.h"

#include "core/sys.h"

#include "ui/common/ui_common.h"
#include "ui/common/ui_ctrl.h"
#include "ui/common/ui_page_manager.h"
#include "ui_resource_manage.h"

#include <unistd.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_t tick_thr;

/**********************
 *      MACROS
 **********************/
#define LVGL_TICK 5

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
/**
* @brief LVGL system tick thread, In order to ensure the accuracy of each beat,
          it is processed in the thread.
* @param none
* @return none
 */
void * tick_thread(void *args) {
    pthread_setname_np(pthread_self(), "tick_thread");

    while(lv_is_initialized()) {
        usleep(LVGL_TICK*1000); /*Sleep for 5 millisecond*/
        lv_tick_inc(LVGL_TICK);
    }

    pthread_exit(NULL);
}

static void ui_loop(void) {
    ui_ctl_proc();
    lv_task_handler();
    usleep(LVGL_TICK*1000); /*Sleep for 5 millisecond*/
}

static int32_t ui_init(void) {

    /*Initialize LittlevGL*/
    lv_init();
    lv_port_disp_init(LV_DISP_ROT_90);
    lv_port_indev_init(LV_DISP_ROT_90);
    lv_port_fs_init();

    ui_resource_load();

    lv_msg_init();

    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    pthread_create(&tick_thr, &attr, tick_thread, (void *)NULL);
    pthread_attr_destroy(&attr);

    /*Load preview interface*/
    ui_page_init(true);
    ui_page_push_page("main", NULL);

    return 0;
}

static void ui_deinit(void) {
    ui_page_deinit();

    ui_resource_release();

    lv_msg_deinit();

    lv_port_disp_deinit();

#if LV_ENABLE_GC || !LV_MEM_CUSTOM
    lv_deinit();
#endif
}

static int32_t ui_sleep(void) {
    ui_common_set_screen_brightness(0);
    ui_page_deinit();
    return 0;
}

static int32_t ui_wakeup(void) {
    ui_page_init(true);
    ui_page_push_page("main", NULL);
    ui_common_set_screen_brightness(200);
    return 0;
}

static module_node_t ui_module = {
    .priority = MODULE_LEVEL_UI,
    .ops = {
        .init = ui_init,
        .deinit = ui_deinit,
        .loop = ui_loop,
        .sleep = ui_sleep,
        .wakeup = ui_wakeup
    }
};

SYS_MODULE_REGISTER(ui_module)