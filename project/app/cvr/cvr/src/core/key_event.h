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
#ifndef _KEY_EVENT_H_
#define _KEY_EVENT_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define KEY_EVENT_VOLUMEDOWN    0x00000001L
#define KEY_EVENT_VOLUMEUP      0x00000002L
#define KEY_EVENT_POWER         0x00000004L

typedef void (*KEY_EVENT_CB)();

int32_t key_event_init();
void    key_event_deinit();
void    key_event_cb_register(KEY_EVENT_CB cb, int32_t event_type);
void    key_event_cb_unregister(KEY_EVENT_CB cb);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif