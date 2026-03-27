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

#include "rk_signal.h"
#include "ntp.h"

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <pthread.h>
#include <sys/prctl.h>
#include <signal.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static pthread_t ntp_client_thread_id;
static void *g_ntp_signal = NULL;
static bool g_network_run = false;
static int32_t g_app_exit = 0;

/**********************
 *      MACROS
 **********************/
#define NTP_TIME_INTERVAL       60   /* One minute */
#define NTP_SERVER_ADDRESS      "cn.pool.ntp.org"

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void sigterm_handler(int32_t sig) {
    if (SIGINT == sig || SIGTERM == sig) {
        g_app_exit = true;
    }
}

static void *ntp_client_thread() {
    prctl(PR_SET_NAME, "ntp_client_thread", 0, 0, 0);

    while (g_network_run) {
        net_ntp_update(NTP_SERVER_ADDRESS);
        rk_signal_wait(g_ntp_signal, NTP_TIME_INTERVAL * 1000);
    }

    return NULL;
}

static int32_t net_init(void) {
    g_ntp_signal = rk_signal_create(0, 1);
    if (!g_ntp_signal) {
        printf("create signal fail\n");
        return -1;
    }

    g_network_run = true;
    pthread_create(&ntp_client_thread_id, NULL, ntp_client_thread, NULL);

    return 0;
}

static void net_deinit(void) {
    if (false == g_network_run)
        return;

    if (g_ntp_signal)
        rk_signal_give(g_ntp_signal);

    g_network_run = false;
    pthread_join(ntp_client_thread_id, NULL);

    if (g_ntp_signal) {
        rk_signal_destroy(g_ntp_signal);
        g_ntp_signal = NULL;
    }
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t main(int32_t argc, const char *argv[]) {
    signal(SIGPIPE, SIG_IGN);
    signal(SIGINT, sigterm_handler);
    signal(SIGTERM, sigterm_handler);

    if (net_init())
        goto failure;

    while (!g_app_exit) {
        usleep(100 * 1000);
    }

failure:
    net_deinit();

    exit(0);
}