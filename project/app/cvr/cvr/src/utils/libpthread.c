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

#include "libpthread.h"

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/
#define THREAD_RUN 0
#define THREAD_PAUSE 1
#define THREAD_STOP 2

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**
 * @brief The internal thread function which calls the user-defined thread function
 *
 * @param[in] arg The argument to be passed to the user-defined thread function
 * @return The return value of the user-defined thread function
 */
void* _thread_func_(void* arg) {
    LIB_PTHREAD_T *t = (LIB_PTHREAD_T *)arg;

    if (NULL != t->name)
        pthread_setname_np(pthread_self(), t->name);

    pthread_mutex_lock(&t->mutex);

    // Loop until the thread status is THREAD_STOP
    while (t->status != THREAD_STOP) {

        // If the thread status is THREAD_PAUSE, wait on the condition variable cond until the thread status is THREAD_RUN or THREAD_STOP
        if (t->status == THREAD_PAUSE) {
            pthread_cond_wait(&t->cond, &t->mutex);
        }

        // If the thread status is THREAD_STOP, break out of theloop
        if (t->status == THREAD_STOP) {
            break;
        }

        pthread_mutex_unlock(&t->mutex);

        // Call the user-defined thread function with the argument
        t->func(t->arg);

        pthread_mutex_lock(&t->mutex);
    }

    t->stopped = 1;
    pthread_mutex_unlock(&t->mutex);

    return NULL;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**
 * @brief Create a new thread with the given thread function and argument
 *
 * @param[in] thread_func The thread function to be executed
 * @param[in] arg The argument to be passed to the thread function
 * @return A pointer to the newly created thread on success, NULL on failure
 */
LIB_PTHREAD_T *lib_pthread_create(const char *name, void *(*thread_func)(void *), void *arg) {
    LIB_PTHREAD_T *t = calloc(1, sizeof(LIB_PTHREAD_T));
    if (NULL == t)
        return NULL;

    if (pthread_mutex_init(&t->mutex, NULL) != 0) {
        perror("pthread_mutex_init");
        free(t);
        return NULL;
    }

    if (pthread_cond_init(&t->cond, NULL) != 0) {
        perror("pthread_cond_init");
        pthread_mutex_destroy(&t->mutex);
        free(t);
        return NULL;
    }

    t->status = THREAD_PAUSE;
    t->stopped = 0;
    t->func = thread_func;
    t->arg = arg;
    t->name = name;

    if (pthread_create(&t->tid, NULL, _thread_func_, t) != 0) {
        perror("pthread_create");
        pthread_mutex_destroy(&t->mutex);
        pthread_cond_destroy(&t->cond);
        free(t);
        return NULL;
    }

    return t;
}

/**
 * @brief Pause the thread
 *
 * @param[in] t The LIB_PTHREAD_T object used to control the thread
 * @return 0 on success, -1 on failure
 */
int32_t lib_pthread_pause(LIB_PTHREAD_T *t) {
    if (pthread_mutex_lock(&t->mutex) != 0) {
        perror("pthread_mutex_lock");
        return -1;
    }

    // If the thread is already paused, return immediately
    if (t->status == THREAD_PAUSE) {
        pthread_mutex_unlock(&t->mutex);
        return 0;
    }

    t->status = THREAD_PAUSE;

    if (pthread_mutex_unlock(&t->mutex) != 0) {
        perror("pthread_mutex_unlock");
        return -1;
    }

    return 0;
}

/**
 * @brief Resume the thread
 *
 * @param[in] t The LIB_PTHREAD_T object used to control the thread
 * @return 0 on success, -1 on failure
 */
int32_t lib_pthread_resume(LIB_PTHREAD_T* t) {
    if (pthread_mutex_lock(&t->mutex) != 0) {
        perror("pthread_mutex_lock");
        return -1;
    }

    // If the thread is already running, return immediately
    if (t->status == THREAD_RUN) {
        pthread_mutex_unlock(&t->mutex);
        return 0;
    }

    t->status = THREAD_RUN;

    // Send a signal to the condition variable cond to wake up the thread
    if (pthread_cond_signal(&t->cond) != 0) {
        perror("pthread_cond_signal");
        return -1;
    }

    if (pthread_mutex_unlock(&t->mutex) != 0) {
        perror("pthread_mutex_unlock");
        return -1;
    }

    return 0;
}

/**
 * @brief Destroy the thread
 *
 * @param[in] t The LIB_PTHREAD_T object used to control the thread
 * @return 0 on success, -1 on failure
 */
int32_t lib_pthread_destroy(LIB_PTHREAD_T *t) {
    if (pthread_mutex_lock(&t->mutex) != 0) {
        perror("pthread_mutex_lock");
        return -1;
    }

    // If the thread is already stopped, return immediately
    if (t->stopped) {
        pthread_mutex_unlock(&t->mutex);
        return 0;
    }

    t->status = THREAD_STOP;

    // Send a signal to the condition variable cond to wake up the thread
    if (pthread_cond_signal(&t->cond) != 0) {
        perror("pthread_cond_signal");
        pthread_mutex_unlock(&t->mutex);
        return -1;
    }

    if (pthread_mutex_unlock(&t->mutex) != 0) {
        perror("pthread_mutex_unlock");
        return -1;
    }

    // Wait for the thread to exit
    if (pthread_join(t->tid, NULL) != 0) {
        perror("pthread_join");
        return -1;
    }

    pthread_mutex_destroy(&t->mutex);
    pthread_cond_destroy(&t->cond);

    return 0;
}