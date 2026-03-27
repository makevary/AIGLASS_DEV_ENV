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

#include "core/sys.h"

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>
#include <stdbool.h>
#include <sys/time.h>
#include <sys/reboot.h>
#include <time.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

typedef enum {
    SYSTEM_STATE_NORMAL = 0,
    SYSTEM_STATE_QUIT,
    SYSTEM_STATE_REBOOT,
    SYSTEM_STATE_SLEEP,
    SYSTEM_STATE_RESET,
    SYSTEM_STATE_AOV,
    SYSTEM_STATE_BUTT
} SYSTEM_STATE_E;

typedef struct {
    module_node_p head;
    module_node_p tail;
} module_list_t;

typedef struct _queue_node_t {
    void *n;
    struct _queue_node_t *next;
} queue_node_t;

typedef struct {
    struct _queue_node_t *head;
    struct _queue_node_t *tail;
} queue_root_t;

typedef struct {
    queue_root_t *msg_quque;
    module_list_t mod_list;
    volatile SYSTEM_STATE_E state;
} system_context_t;
/**********************
 *  STATIC VARIABLES
 **********************/

static system_context_t sys_ctx = {
    .mod_list = {
        .head = NULL,
        .tail = NULL
    },
    .state = SYSTEM_STATE_BUTT,
    .msg_quque = NULL
};

/**********************
 *      MACROS
 **********************/

#define sys_list_for_each(pos, head)                                            \
    for (pos = head; NULL != pos; pos = pos->next)

#define sys_list_for_each_prev(pos, head)                                       \
    for (pos = head; NULL != pos; pos = pos->prev)

/**********************
 *   STATIC FUNCTIONS
 **********************/
inline unsigned long long current_time_millis() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (unsigned long long)(ts.tv_sec * 1000 + ts.tv_nsec / 1000000);
}


static int32_t sys_queue_init(queue_root_t **root) {
    *root = (queue_root_t*)calloc(1, sizeof(queue_root_t));
    if (NULL == *root) {
        perror("malloc failed");
        return -1;
    }

    (*root)->head = (queue_node_t*)calloc(1, sizeof(queue_node_t)); /* Sentinel node */
    if (NULL == (*root)->head) {
        perror("malloc failed");
        free(*root);
        *root = NULL;
        return -1;
    }

    (*root)->tail = (*root)->head;
    (*root)->head->n = NULL;
    (*root)->head->next = NULL;

    return 0;
}

static int32_t sys_queue_add(queue_root_t *root, void *val) {
    queue_node_t *n;
    queue_node_t *node = (queue_node_t *)calloc(1, sizeof(queue_node_t));
    if (NULL == node) {
        perror("malloc failed");
        return -1;
    }

    node->n = val;
    node->next = NULL;
    while (1) {
        n = root->tail;
        if (__sync_bool_compare_and_swap(&(n->next), NULL, node))
            break;
        else
            __sync_bool_compare_and_swap(&(root->tail), n, n->next);
    }
    __sync_bool_compare_and_swap(&(root->tail), n, node);

    return 0;
}

static int32_t sys_queue_get(queue_root_t *root, void **val) {
    queue_node_t *n;
    while (1) {
        n = root->head;
        if (NULL == n->next)
            return -1;

        if (__sync_bool_compare_and_swap(&(root->head), n, n->next))
            break;
    }
    *val = (void *) n->next->n;
    free(n);
    return 0;
}

static int32_t sys_module_init(void) {
    module_node_p cur = NULL;
    sys_list_for_each(cur, sys_ctx.mod_list.head) {
        if (NULL != cur->ops.init) {
            if (cur->ops.init())
                return -1;
        }
    }

    return 0;
}

static void sys_module_deinit(void) {
    module_node_p cur = NULL;
    sys_list_for_each_prev(cur, sys_ctx.mod_list.tail) {
        if (NULL != cur->ops.deinit)
            cur->ops.deinit();
    }
}

static int32_t sys_module_wakeup(void) {
    module_node_p cur = NULL;
    sys_list_for_each(cur, sys_ctx.mod_list.head) {
        if (NULL != cur->ops.wakeup) {
            if (cur->ops.wakeup())
                return -1;
        }
    }

    return 0;
}

static int32_t sys_module_sleep(void) {
    module_node_p cur = NULL;
    sys_list_for_each_prev(cur, sys_ctx.mod_list.tail) {
        if (NULL != cur->ops.sleep) {
            if (cur->ops.sleep())
                return -1;
        }
    }

    return 0;
}

static int32_t sys_module_enter_aov(void) {
    module_node_p cur = NULL;
    sys_list_for_each_prev(cur, sys_ctx.mod_list.tail) {
        if (NULL != cur->ops.enter_aov) {
            if (cur->ops.enter_aov())
                return -1;
        }
    }

    return 0;
}

static int32_t sys_module_exit_aov(void) {
    module_node_p cur = NULL;
    sys_list_for_each(cur, sys_ctx.mod_list.head) {
        if (NULL != cur->ops.exit_aov) {
            if (cur->ops.exit_aov())
                return -1;
        }
    }

    return 0;
}

static void sys_module_loop(void) {
    module_node_p cur = NULL;
    sys_list_for_each(cur, sys_ctx.mod_list.head) {
        if (NULL != cur->ops.loop)
            cur->ops.loop();
    }
}

static int32_t sys_enter_sleep(void) {
    int32_t fd;
    ssize_t ret;

    fd = open("/sys/power/state", O_WRONLY);
    if (fd == -1) {
        perror("Failed to open /sys/power/state");
        return -1;
    }

    ret = write(fd, "mem", 3);
    if (ret == -1) {
        perror("Failed to write to /sys/power/state");
        close(fd);
        return -1;
    }

    close(fd);

    return 0;
}

static void __attribute__((destructor)) __sys_fini__(void) {
    if (SYSTEM_STATE_REBOOT == sys_ctx.state)
        reboot(RB_AUTOBOOT);
    else if (SYSTEM_STATE_RESET == sys_ctx.state)
        sys_enter_sleep();
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
module_node_p sys_module_register(module_node_p new_node) {
    uint8_t priority;
    module_node_p *head, *tail;

    priority = new_node->priority;
    head = &sys_ctx.mod_list.head;
    tail = &sys_ctx.mod_list.tail;

    if (NULL == *head) {
        *head = *tail = new_node;
    } else if (priority <= (*head)->priority) {
        new_node->next = *head;
        (*head)->prev = new_node;
        *head = new_node;
    } else {
        module_node_p cur = *head;
        while (NULL != cur->next && priority > cur->next->priority)
            cur = cur->next;

        new_node->next = cur->next;
        if (NULL != cur->next)
            cur->next->prev = new_node;
        else
            *tail = new_node;
        new_node->prev = cur;
        cur->next = new_node;
    }

    return 0;
}

void sys_loop(void) {
    const int32_t clock_tick = 5; //5ms
    uint64_t before_time, cost_time;

    while (1) {
        if (SYSTEM_STATE_QUIT == sys_ctx.state ||
            SYSTEM_STATE_RESET == sys_ctx.state ||
            SYSTEM_STATE_REBOOT == sys_ctx.state) {
            break;
        } else if (SYSTEM_STATE_NORMAL == sys_ctx.state) {
            before_time = current_time_millis();

            sys_module_loop();

            cost_time = current_time_millis() - before_time;
            if ((cost_time >= 0) && (cost_time < clock_tick))
                usleep((clock_tick - cost_time) * 1000);
        }

        void *val;
        if (!sys_queue_get(sys_ctx.msg_quque, &val)) {
            switch ((SYSTEM_CTRL_E)val) {
                case SYSTEM_CTRL_QUIT:
                    sys_ctx.state = SYSTEM_STATE_QUIT;
                break;

                case SYSTEM_CTRL_REBOOT:
                    sys_ctx.state = SYSTEM_STATE_REBOOT;
                break;

                case SYSTEM_CTRL_RESET:
                    sys_ctx.state = SYSTEM_STATE_RESET;
                break;

                case SYSTEM_CTRL_SLEEP:
                    sys_ctx.state = SYSTEM_STATE_SLEEP;
                    sys_module_sleep();
                    sys_enter_sleep();
                    sys_module_wakeup();
                    sys_ctx.state = SYSTEM_STATE_NORMAL;
                break;

                case SYSTEM_CTRL_AOV:
                    if (SYSTEM_STATE_AOV == sys_ctx.state) {
                        sys_module_exit_aov();
                        sys_ctx.state = SYSTEM_STATE_NORMAL;
                    } else {
                        sys_ctx.state = SYSTEM_STATE_AOV;
                        sys_module_enter_aov();
                    }
                break;

                default:
                break;
            }
        }
    }
}

int32_t sys_ctl(SYSTEM_CTRL_E cmd) {
    if (SYSTEM_STATE_NORMAL != sys_ctx.state &&
        SYSTEM_STATE_AOV != sys_ctx.state)
        return -1;
    return sys_queue_add(sys_ctx.msg_quque, (void *)cmd);
}

int32_t sys_init(void) {
    if (sys_module_init())
        return -1;

    if (sys_queue_init(&(sys_ctx.msg_quque)))
        return -1;

    sys_ctx.state = SYSTEM_STATE_NORMAL;

    return 0;
}

void sys_deinit(void) {
    sys_module_deinit();
}