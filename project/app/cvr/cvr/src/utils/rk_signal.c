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

#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <semaphore.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/prctl.h>
#include <sys/time.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

//Define a structure to represent a signal
typedef struct rk_signal_t {
    sem_t sem; //Signal semaphore
    int32_t max_val; //Maximum value the signal semaphore can take
} rk_signal_t;

/**
* @brief Create a signal semaphore
* @param defval The default value of the semaphore, which should be 0
* @param maxval The maximum value the semaphore can take, which should be 1
* @return On success, the function returns the signal semaphore handle; On failure, it returns NULL
*/
void *rk_signal_create(int32_t defval, int32_t maxval) {
    rk_signal_t *h = NULL;

    h = (rk_signal_t *)calloc(1, sizeof(rk_signal_t));
    if (NULL == h)
        return NULL;

    if (-1 == sem_init(&(h->sem), 0, defval)) { /* If initialization of the semaphore fails, see error reasons below. */
        perror("sem_init: ");
        free(h);
        h = NULL;
    } else
        h->max_val = maxval;

    return h;
}

/**
* @brief Destroy a signal semaphore
* @param sem The signal semaphore handle
*/
void rk_signal_destroy(void *sem) {
    if (NULL == sem)
        return;
    sem_destroy((sem_t *)sem);
    free(sem);
}

/**
* @brief Wait for a signal
* @param sem The signal semaphore handle
* @param timeout -1 means unlimited waiting time; other values represent the waiting time (ms).
* @return On success, the function returns 0; On failure, it returns -1
*/
int32_t rk_signal_wait(void *sem, int32_t timeout) {
    struct timespec tv;

    if (NULL == sem)
        return 0;

    if (timeout < 0) {  /* Need to check the return value, because it also returns if the semaphore is destroyed */
        return sem_wait((sem_t *)sem) == 0 ? 0 : -1;
    } else {
        clock_gettime(CLOCK_REALTIME, &tv);
        tv.tv_nsec += (timeout % 1000) * 1000000;
        if (tv.tv_nsec >= 1000000000) {
            tv.tv_sec += 1;
            tv.tv_nsec -= 1000000000;
        }
        tv.tv_sec += timeout / 1000;

        if (sem_timedwait((sem_t *)sem, (const struct timespec *)&tv))
            return -1;

        return 0;
    }
}

/**
 * @brief Release a semaphore
 *
 * @param signal Semaphore handle
 */
void rk_signal_give(void *sem) {
    int32_t val;

    if (NULL == sem)
        return;

    sem_getvalue((sem_t *)sem, &val);
    if (val < ((rk_signal_t *)sem)->max_val)
        sem_post((sem_t *)sem);
}

/**
 * @brief Reset a semaphore
 *
 * @param signal Semaphore handle
 */
void rk_signal_reset(void *sem){
     rk_signal_give(sem);
}