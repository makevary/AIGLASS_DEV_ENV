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

#include "player.h"
#include "unistd.h"

typedef struct {
    RKADK_MW_PTR handle;
} PLAYER_TASK_INSTANCE_S;

#define CVR_GET_PLAYER_PTR(instance)   ((PLAYER_TASK_INSTANCE_S *)(instance))

static void vedio_param_init(RKADK_PLAYER_FRAME_INFO_S *frame_info) {
    RKADK_CHECK_POINTER_N(frame_info);

    memset(frame_info, 0, sizeof(RKADK_PLAYER_FRAME_INFO_S));

    frame_info->u32VoFormat = VO_FORMAT_RGB888;
    #if defined(UI_VO_INTF_MIPI)
    frame_info->u32EnIntfType = DISPLAY_TYPE_MIPI;
    #else
    frame_info->u32EnIntfType = DISPLAY_TYPE_DEFAULT;
    #endif
    frame_info->enIntfSync = RKADK_VO_OUTPUT_DEFAULT;
    frame_info->u32BorderColor = 0x0000FA;
    frame_info->bMirror = RKADK_FALSE;
    frame_info->bFlip = RKADK_FALSE;
    frame_info->u32Rotation = 1;
    frame_info->stSyncInfo.bIdv = RKADK_TRUE;
    frame_info->stSyncInfo.bIhs = RKADK_TRUE;
    frame_info->stSyncInfo.bIvs = RKADK_TRUE;
    frame_info->stSyncInfo.bSynm = RKADK_TRUE;
    frame_info->stSyncInfo.bIop = RKADK_TRUE;
    frame_info->stSyncInfo.u16FrameRate = 30;
    frame_info->stSyncInfo.u16PixClock = 65000;
    frame_info->stSyncInfo.u16Hact = 1200;
    frame_info->stSyncInfo.u16Hbb = 24;
    frame_info->stSyncInfo.u16Hfb = 240;
    frame_info->stSyncInfo.u16Hpw = 136;
    frame_info->stSyncInfo.u16Hmid = 0;
    frame_info->stSyncInfo.u16Vact = 1200;
    frame_info->stSyncInfo.u16Vbb = 200;
    frame_info->stSyncInfo.u16Vfb = 194;
    frame_info->stSyncInfo.u16Vpw = 6;
    frame_info->enVoSpliceMode = SPLICE_MODE_RGA;

    return;
}

int32_t media_player_play(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);
    int32_t ret = RKADK_PLAYER_Play(player_instance->handle);
    if (ret) {
        RKADK_LOGE("RKADK_PLAYER_Play failed!");
        return -1;
    }

    return 0;
}

int32_t media_player_pause(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    int32_t ret;
    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);

    ret = RKADK_PLAYER_Pause(player_instance->handle);
    if (ret) {
        RKADK_LOGE("RKADK_PLAYER_Play failed!");
        return -1;
    }

    return 0;
}

int32_t media_player_get_duration(HANDLE instance, uint32_t *duration) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);
    int32_t ret = RKADK_PLAYER_GetDuration(player_instance->handle, duration);
    if (ret) {
        RKADK_LOGE("RKADK_PLAYER_GetDuration failed!");
        return -1;
    }

    return 0;
}

int64_t media_player_get_duration_position(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);
    return RKADK_PLAYER_GetCurrentPosition(player_instance->handle);
}

HANDLE media_player_create(RKADK_PLAYER_CFG_S *player_cfg, const RKADK_RECT_S *disp_area) {
    if (NULL == player_cfg) {
        RKADK_LOGE("Invalid input pointer !!!");
        return NULL;
    }

    RKADK_MW_PTR player_handle = NULL;
    PLAYER_TASK_INSTANCE_S *player_instance = NULL;

    vedio_param_init(&player_cfg->stFrmInfo);
    if (NULL != disp_area) {
        player_cfg->stFrmInfo.u32FrmInfoX = disp_area->u32X;
        player_cfg->stFrmInfo.u32FrmInfoY = disp_area->u32Y;
        player_cfg->stFrmInfo.u32DispWidth = disp_area->u32Width;
        player_cfg->stFrmInfo.u32DispHeight = disp_area->u32Height;
        player_cfg->stFrmInfo.u32ImgWidth = disp_area->u32Width;
        player_cfg->stFrmInfo.u32ImgHeight = disp_area->u32Height;
    }

    if (RKADK_PLAYER_Create(&player_handle, player_cfg)) {
        RKADK_LOGE("RKADK_PLAYER_Create failed");
        return NULL;
    }

    player_instance = (PLAYER_TASK_INSTANCE_S *)calloc(1, sizeof(PLAYER_TASK_INSTANCE_S));
    if (NULL == player_instance) {
        RKADK_LOGE("calloc fail");
        goto fail;
    }
    player_instance->handle = player_handle;

    RKADK_LOGI("player create");

    return player_instance;
fail:
    if (NULL != player_handle) {
        RKADK_PLAYER_Destroy(player_handle);
        player_handle = NULL;
    }

    return NULL;
}

int32_t media_player_destroy(HANDLE instance) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);

    if (NULL != player_instance->handle) {
        RKADK_PLAYER_Stop(player_instance->handle);
        RKADK_PLAYER_Destroy(player_instance->handle);
    }

    free(player_instance);
    player_instance = NULL;

    return 0;
}

int32_t media_player_play_switch(HANDLE instance, const char *file_path) {
    if ((NULL == instance) || (NULL == file_path)) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);
    RKADK_MW_PTR player_handle = player_instance->handle;

    int32_t ret = RKADK_PLAYER_Stop(player_handle);
    if (ret) {
        RKADK_LOGE("Replay_switch:stop failed, ret = %d", ret);
        return -1;
    }

    ret = RKADK_PLAYER_SetDataSource(player_handle, file_path);
    if (ret) {
        RKADK_LOGE("Replay_switch:SetDataSource failed, ret = %d", ret);
        return -1;
    }

    ret = RKADK_PLAYER_Prepare(player_handle);
    if (ret) {
        RKADK_LOGE("Replay_switch:Prepare failed, ret = %d", ret);
        return -1;
    }

   return 0;
}

int32_t media_player_play_seek(HANDLE instance, RKADK_S64 time_ms) {
    if (NULL == instance) {
        RKADK_LOGE("Invalid input pointer !!!");
        return -1;
    }

    PLAYER_TASK_INSTANCE_S *player_instance = CVR_GET_PLAYER_PTR(instance);
    int32_t ret = RKADK_PLAYER_Seek(player_instance->handle, time_ms);
    if (ret) {
        RKADK_LOGE("Seek failed, ret = %d", ret);
        return -1;
    }

    return 0;
}