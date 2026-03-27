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
#include "utils/common.h"
#include "utils/kernel_list.h"
#include "utils/libpthread.h"
#include "core/key_event.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <sys/types.h>
#include <linux/input.h>
#include <pthread.h>
#include <linux/kd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
struct event_cb_obj {
    int32_t event_type;
    KEY_EVENT_CB cb;
    struct list_head head;
};

typedef struct {
    BOOL init;

    int32_t fds[8];
    uint32_t fd_num;

    LIB_PTHREAD_T *event_thr;
} key_event_context_t;
/**********************
 *  STATIC VARIABLES
 **********************/
static struct event_cb_obj g_event_hand_cb_list = {
    .cb   = NULL,
    .head = LIST_HEAD_INIT(g_event_hand_cb_list.head)
};

static pthread_mutex_t key_event_lock = PTHREAD_MUTEX_INITIALIZER;
static key_event_context_t key_event_ctx = {
    .init = FALSE,
    .fd_num = 0,
};

/**********************
 *      MACROS
 **********************/
#define INPUT_DEV_PATH "/dev/input/"

/**********************
 *   STATIC FUNCTIONS
 **********************/

static void key_event_cb_run(struct input_event *key_event) {
    struct event_cb_obj *pos = NULL, *n = NULL;

    int32_t event;

    switch (key_event->code) {
        case KEY_VOLUMEDOWN:
            event = KEY_EVENT_VOLUMEDOWN;
        break;

        case KEY_VOLUMEUP:
            event = KEY_EVENT_VOLUMEUP;
        break;

        case KEY_POWER:
            event = KEY_EVENT_POWER;
        break;

        default:
            return;
    }

    if (1 == key_event->value) {
        pthread_mutex_lock(&key_event_lock);
        list_for_each_entry_safe(pos, n, &g_event_hand_cb_list.head, head) {
            if ((NULL != pos->cb) && (pos->event_type & event)) {
                pos->cb();
            }
        }
        pthread_mutex_unlock(&key_event_lock);
    }
}

static void key_event_list_destroy() {
    struct event_cb_obj *pos = NULL, *n = NULL;

    pthread_mutex_lock(&key_event_lock);
    list_for_each_entry_safe(pos, n, &g_event_hand_cb_list.head, head) {
        list_del(&pos->head);
        free(pos);
    }
    pthread_mutex_unlock(&key_event_lock);
}

static int32_t key_open_devices(void) {
    int32_t fd;
    DIR *dir = NULL;
    struct dirent *entry = NULL;
    char devname[PATH_MAX] = {'\0'};
    uint32_t fd_num = 0;

    dir = opendir(INPUT_DEV_PATH);
    if (NULL == dir) {
        perror("opendir");
        return -1;
    }

    while ((fd_num < TABLE_SIZE(key_event_ctx.fds)) && ((entry = readdir(dir)) != NULL)) {
        // Check if the file name matches the pattern "event[0-9]+"
        if (!strncmp(entry->d_name, "event", 5) && 5 < strlen(entry->d_name)) {
            sprintf(devname, "%s%s", INPUT_DEV_PATH, entry->d_name);
            fd = open(devname, O_RDONLY);
            if (fd >= 0) {
                char name[256] = "Unknown";
                ioctl(fd, EVIOCGNAME(sizeof(name)), name);
                // Check if the device is a keyboard device
                if (NULL != strstr(name, "keyboard") || NULL != strstr(name, "keys")) {
                    CVR_INFO("Found keyboard device: %s\n", devname);
                    key_event_ctx.fds[fd_num++] = fd;
                    continue;
                }
                close(fd);
            }
        }
    }

    closedir(dir);

    if (0 == fd_num) {
        perror("[KEY_EVENT] No key device found.");
        return -1;
    }

    key_event_ctx.fd_num = fd_num;

    return 0;
}

static void key_close_devices(void) {
    for (uint32_t i = 0; i < key_event_ctx.fd_num; i++)
        close(key_event_ctx.fds[i]);
}

static int32_t key_event_read(int32_t kbd_fd, struct input_event* key_event) {
    int32_t size;
repeat:
    size = read(kbd_fd, key_event, sizeof(struct input_event));
    if (size < 0) {
        if ((errno == EINTR) || (errno == EAGAIN)) {
            goto repeat;
        }
        return -1;
    }

    return 0;
}

static void *key_event_detection(void *arg) {
    fd_set readfds;
    uint32_t i = 0;
    int32_t max_fd = -1, ret = -1;
    struct timeval timeout;
    struct input_event event;

    FD_ZERO(&readfds);
    for (i = 0; i < key_event_ctx.fd_num; i++) {
        FD_SET(key_event_ctx.fds[i], &readfds);
        if (key_event_ctx.fds[i] > max_fd)
            max_fd = key_event_ctx.fds[i];
    }

    memset(&timeout, 0, sizeof(timeout));
    timeout.tv_sec = 0;
    timeout.tv_usec = 100000;
    ret = select(max_fd + 1, &readfds, NULL, NULL, &timeout);
    if (0 < ret) {
        for (i = 0; i < key_event_ctx.fd_num; i++) {
            if (FD_ISSET(key_event_ctx.fds[i], &readfds)) {
                bzero(&event, sizeof(event));
                ret = key_event_read(key_event_ctx.fds[i], &event);
                if (!ret)
                    key_event_cb_run(&event);
            }
        }
    } else if (0 == ret) {
        /* time out */
    } else {
        /* select err */
    }

    return NULL;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

void key_event_cb_register(KEY_EVENT_CB cb, int32_t event_type) {
    struct event_cb_obj *pos = NULL, *n = NULL, *cb_obj = NULL;

    pthread_mutex_lock(&key_event_lock);

    list_for_each_entry_safe(pos, n, &g_event_hand_cb_list.head, head) {
        if (cb == pos->cb) {
            CVR_ERR("Failed to register callback function!\n");
            goto out;
        }
    }

    cb_obj = calloc(1, sizeof(struct event_cb_obj));
    if (NULL == cb_obj) {
        CVR_ERR("calloc failed!\n");
        goto out;
    }
    cb_obj->cb = cb;
    cb_obj->event_type = event_type;

    list_add_tail(&cb_obj->head, &g_event_hand_cb_list.head);
out:
    pthread_mutex_unlock(&key_event_lock);
}

void key_event_cb_unregister(KEY_EVENT_CB cb) {
    struct event_cb_obj *pos = NULL, *n = NULL;

    pthread_mutex_lock(&key_event_lock);
    list_for_each_entry_safe(pos, n, &g_event_hand_cb_list.head, head) {
        if (cb == pos->cb) {
            list_del(&pos->head);
            free(pos);
            break;
        }
    }
    pthread_mutex_unlock(&key_event_lock);
}

int32_t key_event_init(void) {
    if (TRUE == key_event_ctx.init)
        return -1;

    if (0 != key_open_devices()) {
        CVR_ERR("key event open fail\n");
        return -1;
    }

    key_event_ctx.event_thr = lib_pthread_create("key_event_thread", key_event_detection, NULL);
    if (NULL == key_event_ctx.event_thr) {
        key_close_devices();
        CVR_ERR("Failed to create thread.\n");
        return -1;
    }

    lib_pthread_resume(key_event_ctx.event_thr);

    key_event_ctx.init = TRUE;

    return 0;
}

void key_event_deinit() {
    if (TRUE == key_event_ctx.init) {
        lib_pthread_destroy(key_event_ctx.event_thr);
        key_close_devices();
        key_event_ctx.init = FALSE;
    }
}