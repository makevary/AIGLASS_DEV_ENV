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

#ifndef _LINUX_NETLINK_H_
#define _LINUX_NETLINK_H_

#include <stdint.h>
#include <stdbool.h>

/* The type of event to capture */
#define NETLINK_UEVENT_UDISK_EVENT        0x00000001L
#define NETLINK_UEVENT_USB_GADGET_EVENT        0x00000002L
#define NETLINK_UEVENT_MMCBLK_EVENT     0x00000004L

typedef struct {
    uint8_t bus_number;
    uint8_t device_address;
    bool detached;
} NETLINK_UDISK_DEVICE_S;

typedef struct {
    bool detached;
} NETLINK_USB_GADGET_EVENT_S;

typedef struct {
    const char *sys_name;
    bool detached;
} NETLINK_MMCBLK_EVENT_S;

typedef struct {
    int32_t event_type;
    union {
        NETLINK_UDISK_DEVICE_S         udisk;
        NETLINK_USB_GADGET_EVENT_S     usb_gadget;
        NETLINK_MMCBLK_EVENT_S         mmcblk;
    };
} NETLINK_UEVENT_EVENT_S;

typedef void (*NETLINK_UEVENT_CB)(const NETLINK_UEVENT_EVENT_S *);

#ifdef __cplusplus
extern "C" {
#endif

int32_t netlink_start_event_monitor(void);
int32_t netlink_stop_event_monitor(void);
void    netlink_uevent_cb_register(NETLINK_UEVENT_CB cb, int32_t event_type);
void    netlink_uevent_cb_unregister(NETLINK_UEVENT_CB cb);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif