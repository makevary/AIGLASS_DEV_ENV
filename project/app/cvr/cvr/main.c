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

#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>

#include "utils/common.h"
#include "utils/log.h"

#include "core/sys.h"

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
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void sigterm_handler(int32_t sig) {
    if (SIGINT == sig || SIGTERM == sig)
        sys_ctl(SYSTEM_CTRL_QUIT);
}

int32_t main(int32_t argc, const char *argv[]) {
    signal(SIGPIPE, SIG_IGN);
    signal(SIGINT,  sigterm_handler);
    signal(SIGTERM, sigterm_handler);

    if (sys_init())
        goto failure;

    sys_loop();

failure:
    sys_deinit();

    CVR_INFO("Program exit.\n");

    exit(0);
}