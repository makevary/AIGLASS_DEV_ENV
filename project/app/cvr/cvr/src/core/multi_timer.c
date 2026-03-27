#include "multi_timer.h"
#include <stdio.h>
#include <pthread.h>

/* Timer handle list head. */
static MultiTimer* timerList = NULL;

static pthread_mutex_t timer_lock = PTHREAD_MUTEX_INITIALIZER;

/* Timer tick */
static PlatformTicksFunction_t platformTicksFunction = NULL;

static int _MultiTimerStart(MultiTimer* timer, MultiTimerSpec_t *timing, bool repeat,
                            MultiTimerCallback_t callback, void* userData)
{
    if (!timer || !callback ) {
        return -1;
    }

    MultiTimer** nextTimer = &timerList;
    /* Remove the existing target timer. */
    for (; *nextTimer; nextTimer = &(*nextTimer)->next) {
        if (timer == *nextTimer) {
            *nextTimer = timer->next; /* remove from list */
            break;
        }
    }

    /* Init timer. */
    timer->deadline = platformTicksFunction() + timing->it_value;
    timer->callback = callback;
    timer->userData = userData;
    timer->repeat = repeat;
    timer->it_interval = timing->it_interval;

    /* Insert timer. */
    for (nextTimer = &timerList;; nextTimer = &(*nextTimer)->next) {
        if (!*nextTimer) {
            timer->next = NULL;
            *nextTimer = timer;
            break;
        }
        if (timer->deadline < (*nextTimer)->deadline) {
            timer->next = *nextTimer;
            *nextTimer = timer;
            break;
        }
    }

    return 0;
}


int MultiTimerInstall(PlatformTicksFunction_t ticksFunc)
{
    platformTicksFunction = ticksFunc;
    return 0;
}

int MultiTimerStart(MultiTimer* timer, MultiTimerSpec_t *timing, bool repeat,
                    MultiTimerCallback_t callback, void* userData)
{
    if (!timer || !callback ) {
        return -1;
    }

    pthread_mutex_lock(&timer_lock);

    _MultiTimerStart(timer, timing, repeat, callback, userData);

    pthread_mutex_unlock(&timer_lock);

    return 0;
}

int MultiTimerStop(MultiTimer* timer)
{
    pthread_mutex_lock(&timer_lock);

    MultiTimer** nextTimer = &timerList;
    /* Find and remove timer. */
    for (; *nextTimer; nextTimer = &(*nextTimer)->next) {
        MultiTimer* entry = *nextTimer;
        if (entry == timer) {
            *nextTimer = timer->next;
            break;
        }
    }

    pthread_mutex_unlock(&timer_lock);

    return 0;
}

int MultiTimerYield(void)
{
    pthread_mutex_lock(&timer_lock);

    int time_left;
    MultiTimer* entry = timerList;
    for (; entry; entry = entry->next) {
        /* Sorted list, just process with the front part. */
        if (platformTicksFunction() < entry->deadline) {
            time_left = entry->deadline - platformTicksFunction();
            pthread_mutex_unlock(&timer_lock);
            return time_left;
        }
        /* remove expired timer from list */
        timerList = entry->next;

        /* call callback */
        if (entry->callback)
            entry->callback(entry, entry->userData);

        if (true == entry->repeat) {
            MultiTimerSpec_t timing = {
                .it_interval = entry->it_interval,
                .it_value = entry->it_interval,
            };
            _MultiTimerStart(entry, &timing, entry->repeat, entry->callback, entry->userData);
        }
    }

    pthread_mutex_unlock(&timer_lock);

    return 0;
}