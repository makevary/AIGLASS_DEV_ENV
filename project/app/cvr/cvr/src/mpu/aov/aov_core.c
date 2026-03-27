/*
 * Copyright (c) 2024 Rockchip, Inc. All Rights Reserved.
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

#include "aov_core.h"

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

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void aov_notify_callback(RKADK_AOV_EVENT_E event, void *msg) {
    switch(event) {
        case RKADK_AOV_ENTER_SLEEP:
            RKADK_LOGD("+++++ RKADK_AOV_ENTER_SLEEP +++++");

            RKADK_AOV_WakeupLock();
            //UmountSdcard();
            RKADK_AOV_EnterSleep();
            RKADK_AOV_WakeupUnlock();
        break;

        default:
            RKADK_LOGD("Unknown event: %d", event);
        break;
    }
}
/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t aov_init(void) {
    int32_t suspend_time = 1000;
    RKADK_AOV_ARG_S aov_arg;

    memset(&aov_arg, 0, sizeof(aov_arg));
    aov_arg.pfnNotifyCallback = aov_notify_callback;
    RKADK_AOV_Init(&aov_arg);

    RKADK_LOGD("s32SuspendTime: %d", suspend_time);
    RKADK_AOV_SetSuspendTime(suspend_time);

    return 0;
}

void aov_deinit(void) {
    RKADK_AOV_DeInit();
}

void aov_wakeup_lock() {
    RKADK_AOV_WakeupLock();
}

void aov_wakeup_unlock() {
    RKADK_AOV_WakeupUnlock();
}