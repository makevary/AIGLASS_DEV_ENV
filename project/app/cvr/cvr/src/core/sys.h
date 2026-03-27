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

#ifndef _CORE_SYS_H_
#define _CORE_SYS_H_

#include <stdio.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {
    MODULE_LEVEL_SYSTEM = 0,
    MODULE_LEVEL_UMS,
    MODULE_LEVEL_MEDIA,
    MODULE_LEVEL_AI,
    MODULE_LEVEL_UI,
    MODULE_LEVEL_APP,
    MODULE_LEVEL_BUTT
} MODULE_LEVEL_E;

typedef enum {
    SYSTEM_CTRL_QUIT = 0,
    SYSTEM_CTRL_REBOOT,
    SYSTEM_CTRL_SLEEP,
    SYSTEM_CTRL_RESET,
    SYSTEM_CTRL_AOV,
    SYSTEM_CTRL_BUTT
} SYSTEM_CTRL_E;

typedef struct {
    int32_t (*init)(void);
    void    (*deinit)(void);
    int32_t (*sleep)(void);
    int32_t (*wakeup)(void);
    void    (*loop)(void);
    int32_t (*enter_aov)(void);
    int32_t (*exit_aov)(void);
} module_ops_t;

typedef struct _module_node_t{
    MODULE_LEVEL_E priority;
    module_ops_t ops;

    struct _module_node_t *prev;
    struct _module_node_t *next;
} module_node_t, *module_node_p;

module_node_p sys_module_register(module_node_p new_node);
int32_t sys_init(void);
void    sys_deinit(void);
void    sys_loop(void);
int32_t sys_ctl(SYSTEM_CTRL_E cmd);

#define SYS_MODULE_REGISTER(_module) \
static  __attribute__((constructor)) void module_##_module##_register_() \
{ \
    sys_module_register(&_module); \
}

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif