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
#include "core/key_event.h"
#include "core/linux_netlink.h" 
#include "core/sys.h"

#include "mpu/mpu_photo.h"
#include "mpu/mpu_record.h"
#include "mpu/mpu_storage.h"

#include "app/remote_config.h"

#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>

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
static void button_app_urgtent_video(void) {
    mpu_record_urgent_video(0);
}

static void button_app_storage_format(void) {
    mpu_record_deinit();
    mpu_storage_format();
    mpu_record_init();
    mpu_record_start(RECORD_ALL_CHN);
}

static int32_t button_app_init(void) {
    key_event_cb_register(mpu_photo_capture, KEY_EVENT_VOLUMEUP);      /* button to take photo */
    key_event_cb_register(button_app_urgtent_video, KEY_EVENT_VOLUMEUP);
    key_event_cb_register(button_app_storage_format, KEY_EVENT_VOLUMEDOWN);
    return 0;
}

static void button_app_deinit(void) {
    key_event_cb_unregister(mpu_photo_capture);
    key_event_cb_unregister(button_app_urgtent_video);
    key_event_cb_unregister(button_app_storage_format);
}

/*****************************************************************************************/

static void hotplug_reboot_proc(const NETLINK_UEVENT_EVENT_S *event) {
    if (NETLINK_UEVENT_MMCBLK_EVENT == event->event_type) {
        if (true == event->mmcblk.detached)
            sys_ctl(SYSTEM_CTRL_REBOOT);
    }
}

static int32_t hotplug_reboot_init(void) {
    netlink_uevent_cb_register(hotplug_reboot_proc, NETLINK_UEVENT_MMCBLK_EVENT);
    return 0;
}

static void hotplug_reboot_deinit(void) {
    netlink_uevent_cb_unregister(hotplug_reboot_proc);
}

/*****************************************************************************************/

static void system_standby_proc(void) {
#ifdef USE_RKAOV
    sys_ctl(SYSTEM_CTRL_AOV);
#else
    sys_ctl(SYSTEM_CTRL_RESET);
#endif
}

static int32_t system_standby_init(void) {
    key_event_cb_register(system_standby_proc, KEY_EVENT_POWER);
    return 0;
}

static void system_standby_deinit(void) {
    key_event_cb_unregister(system_standby_proc);
}

/*****************************************************************************************/

static int32_t app_init(void) {
#ifdef REMOTE_COFNIG
    remote_cfg_init();
#endif

#ifndef USE_LVGL
    button_app_init();
#endif

    hotplug_reboot_init();

    system_standby_init();

    return 0;
}

static void app_deinit(void) {
#ifdef REMOTE_COFNIG
    remote_cfg_deinit();
#endif

    system_standby_deinit();

    hotplug_reboot_deinit();

#ifndef USE_LVGL
    button_app_deinit();
#endif
}

static int32_t app_sleep(void) {
    return 0;
}

static int32_t app_wakeup(void) {
    return 0;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

static module_node_t app_module = {
    .priority = MODULE_LEVEL_APP,
    .ops = {
        .init = app_init,
        .deinit = app_deinit,
        .sleep = app_sleep,
        .wakeup = app_wakeup
    }
};

SYS_MODULE_REGISTER(app_module)