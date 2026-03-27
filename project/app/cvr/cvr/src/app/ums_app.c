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
#include "core/linux_netlink.h"
#include "core/sys.h"

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdint.h>
#include <stdlib.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static bool ums_enable = false;

/**********************
 *      MACROS
 **********************/
#define UMS_STATE_PATH        "/sys/class/android_usb/android0/state"

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void ums_read_usbconfig() {
    FILE *fp = NULL;
    char line[64];
    const char *filename = "/tmp/.usb_config";

    fp = fopen(filename, "r+");
    if (NULL == fp) {
        CVR_ERR("ums enable failed.\n");
        return;
    }

    while (!feof(fp)) {
        fgets(line, sizeof(line), fp);
        if (!strncmp("usb_ums_en", line, 10)) {
            ums_enable = true;
            break;
        }
    }

    fclose(fp);
    fp = NULL;
}

static int32_t scan_ums_state(bool *detached) {
    if (NULL == detached)
        return -1;

    FILE *fp = NULL;
    char str_line[64] = {0};

    fp = fopen(UMS_STATE_PATH, "r");
    if (NULL == fp) {
        CVR_ERR("Open file error!\n");
        return -1;
    }

    while (!feof(fp)) {
        fgets(str_line, sizeof(str_line), fp);
        if (NULL != strstr(str_line, "DISCONNECTED")) {
            *detached = true;
            break;
        } else if (NULL != strstr(str_line, "CONFIGURED")) {
            *detached = false;
            break;
        }
    }

    fclose(fp);

    return 0;
}

static void usb_gadget_hotplug_proc(const NETLINK_UEVENT_EVENT_S *event) {
    if (false == event->usb_gadget.detached)
        sys_ctl(SYSTEM_CTRL_QUIT);
}

static int32_t ums_app_init(void) {
    ums_read_usbconfig();
    if (true != ums_enable)
        return 0;

    netlink_uevent_cb_register(usb_gadget_hotplug_proc, NETLINK_UEVENT_USB_GADGET_EVENT);

    bool detached = true;
    if (!scan_ums_state(&detached)) {
        if (false == detached) {
            sys_ctl(SYSTEM_CTRL_QUIT);
            return -1;
        }
    }

    return 0;
}

static void ums_app_deinit(void) {
    netlink_uevent_cb_unregister(usb_gadget_hotplug_proc);
}

static module_node_t ums_module = {
    .priority = MODULE_LEVEL_UMS,
    .ops = {
        .init = ums_app_init,
        .deinit = ums_app_deinit
    }
};

SYS_MODULE_REGISTER(ums_module)
/**********************
 *   GLOBAL FUNCTIONS
 **********************/
