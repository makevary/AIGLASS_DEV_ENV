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
#include "mpu/mpu_player.h"

#include <stdio.h>
#include <sys/time.h>
#include <unistd.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/
static HANDLE g_player_handler = NULL;
static pthread_mutex_t mutexLock = PTHREAD_MUTEX_INITIALIZER;
static RKADK_PLAYER_EVENT_FN g_event_cb = NULL;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

static RKADK_VOID player_event(RKADK_MW_PTR Player,
                               RKADK_PLAYER_EVENT_E enEvent,
                               RKADK_VOID *pData) {
    if (NULL != g_event_cb)
        g_event_cb(Player, enEvent, pData);
}

int32_t mpu_player_create(int32_t player_type, const RKADK_RECT_S *disp_area,
                         uint32_t speaker_volume, RKADK_PLAYER_EVENT_FN event_cb) {
    if (NULL != g_player_handler)
        return -1;

    RKADK_PLAYER_CFG_S player_cfg;

    memset(&player_cfg, 0, sizeof(player_cfg));

    g_event_cb = event_cb;

#if defined(PLATFORM_RV1106) || defined(PLATFORM_RV1103B)
    player_cfg.stAudioCfg.pSoundCard = "hw:0,0";
#else
    player_cfg.stAudioCfg.pSoundCard = "default";
#endif
    player_cfg.stAudioCfg.u32SpeakerVolume = speaker_volume;

    player_cfg.bEnableAudio = FALSE;
    player_cfg.bEnableVideo = FALSE;
    if (player_type & MPU_PLAYER_TYPE_AUDIO)
        player_cfg.bEnableAudio = TRUE;
    if (player_type & MPU_PLAYER_TYPE_VIDEO)
        player_cfg.bEnableVideo = TRUE;
    player_cfg.pfnPlayerCallback = player_event;
    g_player_handler = media_player_create(&player_cfg, disp_area);
    if (NULL == g_player_handler) {
        CVR_ERR("Failed to create player.\n");
        return -1;
    }

    return 0;
}

void mpu_player_destroy(void) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL != g_player_handler) {
        media_player_destroy(g_player_handler);
        g_player_handler = NULL;
    }
    g_event_cb = NULL;
    PTHREAD_MUTEX_UNLOCK(mutexLock);
}

int32_t mpu_player_get_duration(uint32_t *duration) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int32_t ret = media_player_get_duration(g_player_handler, duration);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}

int64_t mpu_player_get_duration_position(void) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int64_t ret = media_player_get_duration_position(g_player_handler);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}

int32_t mpu_player_play(void) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int32_t ret = media_player_play(g_player_handler);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}

int32_t mpu_player_pause(void) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int32_t ret = media_player_pause(g_player_handler);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}

int32_t mpu_player_switch(const char *file_path) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int32_t ret = media_player_play_switch(g_player_handler, file_path);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}

int32_t mpu_player_seek(RKADK_S64 time_ms) {
    PTHREAD_MUTEX_LOCK(mutexLock);
    if (NULL == g_player_handler) {
        PTHREAD_MUTEX_UNLOCK(mutexLock);
        return -1;
    }

    int32_t ret = media_player_play_seek(g_player_handler, time_ms);
    PTHREAD_MUTEX_UNLOCK(mutexLock);
    return ret;
}