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

#ifndef _LIB_PTHREAD_H_
#define _LIB_PTHREAD_H_

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <pthread.h>
#include <errno.h>
#include <sys/time.h>

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */

typedef struct {
    const char *name;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
    int32_t status;
    int32_t stopped;

    pthread_t tid;
    void *(*func)(void *);
    void *arg;
} LIB_PTHREAD_T;

int32_t         lib_pthread_destroy(LIB_PTHREAD_T *t);
int32_t         lib_pthread_resume(LIB_PTHREAD_T* t);
int32_t         lib_pthread_pause(LIB_PTHREAD_T *t);
LIB_PTHREAD_T * lib_pthread_create(const char *name, void *(*thread_func)(void *), void *arg);

#ifdef __cplusplus
}
#endif  /* __cplusplus */

#endif