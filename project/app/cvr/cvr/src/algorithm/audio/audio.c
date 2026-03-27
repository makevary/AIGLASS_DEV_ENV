/****************************************************************************
 *
 *    Copyright (c) 2023 by Rockchip Corp.  All rights reserved.
 *
 *    The material in this file is confidential and contains trade secrets
 *    of Rockchip Corporation. This is proprietary information owned by
 *    Rockchip Corporation. No part of this work may be disclosed,
 *    reproduced, copied, transmitted, or used in any way for any purpose,
 *    without the express written permission of Rockchip Corporation.
 *
 *****************************************************************************/
#ifdef RKAUDIO

#include "utils/log.h"
#include "utils/common.h"

#include "algorithm/audio/audio.h"

#include <rkaudio_preprocess.h>
#include <rkaudio_sed.h>
#include <rkadk_param.h>
#include <rkadk_common.h>
#include <rkadk_media_comm.h>
#include <rkadk_stream.h>

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef struct {
    RKAUDIOParam *param;
    void *preprocess_handle;
    RKADK_MW_PTR ai_handle;

    char* last_buf;
    uint32_t one_frame_len;
} GLGORITHM_AUDIO_CONTEXT_S;

/**********************
 *  STATIC VARIABLES
 **********************/
static GLGORITHM_AUDIO_CONTEXT_S algorithm_audio_ctx;

static const char* wake_word[] = {
    "Wo Yao Pai Zhao", // I want to take a picture
    "Guan Bi Re Dian", // Turn off the hotspot
    "Da Kai Re Dian",  // Turn on the hotspot
    "Guan Bi Lu Yin",  // Turn off recording
    "Da Kai Lu Yin",   // Turn on recording
    "Guan Bi Ping Mu", // Turn off the screen
    "Da Kai Ping Mu",  // Turn on the screen
};

/**********************
 *      MACROS
 **********************/

#define ENABLE_NPU
#define AUDIO_FRAME_ALIGN   256
#define RKNN_PATH   "/oem/usr/share/res/conf/rkaudio_wakeup.rknn"

/**********************
 *   STATIC FUNCTIONS
 **********************/
static void printf_wakeup_event(uint32_t wakeup_id) {
    --wakeup_id;
    if (wakeup_id >= 0 && wakeup_id < TABLE_SIZE(wake_word))
        CVR_INFO("%s\n", wake_word[wakeup_id]);
}

static void algorithm_audio_prep_process(RKADK_AUDIO_STREAM_S *stream_data) {
    if (NULL == stream_data || 0 == stream_data->u32Len)
        return;

    int32_t wakeup_id;
    uint32_t offset = 0;
    static uint32_t last_len = 0;
    char *last_buf= algorithm_audio_ctx.last_buf;
    uint32_t one_frame_len = algorithm_audio_ctx.one_frame_len;
    uint32_t stream_len = stream_data->u32Len;

    if (0 != last_len) {
        if (stream_data->u32Len < (one_frame_len - last_len)) {
            memcpy((last_buf + last_len), stream_data->pStream, stream_data->u32Len);
            last_len += stream_data->u32Len;
            return;
        }

        memcpy((last_buf + last_len), stream_data->pStream, one_frame_len - last_len);
        offset = one_frame_len - last_len;
        wakeup_id = 0;
        rkaudio_preprocess_short(algorithm_audio_ctx.preprocess_handle,
                                (short *)last_buf, NULL,
                                (one_frame_len / 2), &wakeup_id);
        printf_wakeup_event(wakeup_id);

        stream_len -= offset;
        last_len = 0;
    }

    last_len = stream_len % one_frame_len;

    while (stream_len >= one_frame_len) {
        wakeup_id = 0;
        rkaudio_preprocess_short(algorithm_audio_ctx.preprocess_handle,
                                (short *)(stream_data->pStream + offset), NULL,
                                (one_frame_len / 2), &wakeup_id);
        printf_wakeup_event(wakeup_id);

        offset += one_frame_len;
        stream_len -= one_frame_len;
    }

    memcpy(last_buf, stream_data->pStream + offset, last_len);
}

static RKADK_S32 pcm_data_cb(RKADK_AUDIO_STREAM_S *pAStreamData) {
    //RKADK_LOGD("#pcm seq: %d, pts: %lld, size: %zu", pAStreamData->u32Seq,
               // pAStreamData->u64TimeStamp, pAStreamData->u32Len);
    if (pAStreamData->u32Len > 0)
        algorithm_audio_prep_process(pAStreamData);

    return 0;
}

static int32_t algorithm_audio_preprocess_init(void) {
    if (NULL != algorithm_audio_ctx.preprocess_handle) {
        CVR_WARN("[rkaudio] preprocess module has been created successfully.\n");
        return 0;
    }

    RKADK_PARAM_AUDIO_CFG_S *rkadk_audio_param = NULL;
    RKAUDIOParam *param = NULL;
    void *preprocess_handle = NULL;
    int32_t fs, bit, src_chan, ref_chan;
    uint32_t one_frame_len = 0;
    char * one_frame_buf = NULL;

    rkadk_audio_param = RKADK_PARAM_GetAudioCfg();
    if (NULL == rkadk_audio_param) {
        CVR_ERR("[rkaudio] Failed to get audio configuration parameters.\n");
        return -1;
    }

    if (1 >= rkadk_audio_param->ai_depth) {
        CVR_ERR("[rkaudio] Audio framebuffer depth must be greater than 1.\n");
        return -1;
    }

    fs = rkadk_audio_param->samplerate;
    bit = RKADK_MEDIA_GetAudioBitWidth(rkadk_audio_param->bit_width); //Note: 8bit is not supported
    src_chan = rkadk_audio_param->channels;
    ref_chan = (src_chan > 1) ? 1 : 0;

#ifdef ENABLE_NPU
    if (0 != access(RKNN_PATH, F_OK)) {
        CVR_ERR("[rkaudio] The wakeup algorithm model does not exist.\n");
        return -1;
    }
    rkaudio_rknn_path_set(RKNN_PATH);
#endif

    param = (RKAUDIOParam *)calloc(1, sizeof *param);
    if (NULL == param) {
        CVR_ERR("[rkaudio] Failed to initialize preprocessing parameters.\n");
        return -1;
    }
    memset(param, 0, sizeof *param);
    param->model_en = RKAUDIO_EN_BF;
    param->aec_param = rkaudio_aec_param_init();
    param->bf_param = rkaudio_preprocess_param_init();
    ((SKVPreprocessParam *)(param->bf_param))->model_bf_en = EN_Wakeup;
    ((SKVPreprocessParam *)(param->bf_param))->num_ref_channel = ref_chan;
    param->rx_param = rkaudio_rx_param_init();

    one_frame_len = src_chan * AUDIO_FRAME_ALIGN * 2;
    one_frame_buf = (char *)calloc(1, one_frame_len);
    if (NULL == one_frame_buf) {
        CVR_ERR("[rkaudio] Failed to apply for a single framebuffer.\n");
        goto err;
    }

    CVR_INFO("[rkaudio] fs:%d, bit:%d, src_chan:%d, ref_chan:%d.\n", fs, bit, src_chan, 0);
    preprocess_handle = rkaudio_preprocess_init(fs, bit, src_chan, ref_chan, param);
    if (NULL == preprocess_handle) {
        CVR_ERR("[rkaudio] preprocess module initialization failed.\n");
        goto err;
    }

    memset(&algorithm_audio_ctx, 0, sizeof(algorithm_audio_ctx));
    algorithm_audio_ctx.param = param;
    algorithm_audio_ctx.preprocess_handle = preprocess_handle;
    algorithm_audio_ctx.one_frame_len = one_frame_len;
    algorithm_audio_ctx.last_buf = one_frame_buf;

    CVR_INFO("[rkaudio] Initialization successful.\n");

    return 0;

err:
    if (NULL != param) {
        rkaudio_param_deinit(param);
        free(param);
        param = NULL;
    }

    if (NULL != one_frame_buf) {
        free(one_frame_buf);
        one_frame_buf = NULL;
    }

    return -1;
}

static void algorithm_audio_preprocess_deinit(void) {
    if (NULL != algorithm_audio_ctx.preprocess_handle) {
        rkaudio_preprocess_destory(algorithm_audio_ctx.preprocess_handle);
        algorithm_audio_ctx.preprocess_handle = NULL;
    }

    if (NULL != algorithm_audio_ctx.param) {
        rkaudio_param_deinit(algorithm_audio_ctx.param);
        free(algorithm_audio_ctx.param);
        algorithm_audio_ctx.param = NULL;
    }

    CVR_INFO("[rkaudio] Deinitialization succeeded.\n");
}

static int32_t algorithm_audio_start(void) {
    if (NULL != algorithm_audio_ctx.ai_handle) {
        CVR_WARN("audio has been created successfully.\n");
        return 0;
    }

    int32_t ret = 0;
    RKADK_MW_PTR handle = NULL;
    RKADK_STREAM_AUDIO_ATTR_S audio_attr;
    RKADK_AUDIO_INFO_S audio_info;

    memset(&audio_attr, 0, sizeof(RKADK_STREAM_AUDIO_ATTR_S));
    audio_attr.u32CamId = 0;  /* This parameter is invalid when the encoding type is PCM. */
    audio_attr.enCodecType = RKADK_CODEC_TYPE_PCM;
    audio_attr.pfnPcmDataCB = pcm_data_cb;
    audio_attr.pfnAencDataCB = NULL;
    ret = RKADK_STREAM_AudioInit(&audio_attr, &handle);
    if (ret) {
        CVR_ERR("RKADK_STREAM_AudioInit failed = %d\n", ret);
        return ret;
    }

    RKADK_STREAM_GetAudioInfo(handle, &audio_info);
    CVR_INFO("audio_info.enCodecType: %d\n", audio_info.enCodecType);
    CVR_INFO("audio_info.u16SampleBitWidth: %d\n", audio_info.u16SampleBitWidth);
    CVR_INFO("audio_info.u32AvgBytesPerSec: %d\n", audio_info.u32AvgBytesPerSec);
    CVR_INFO("audio_info.u32ChnCnt: %d\n", audio_info.u32ChnCnt);
    CVR_INFO("audio_info.u32SampleRate: %d\n", audio_info.u32SampleRate);
    CVR_INFO("audio_info.u32SamplesPerFrame: %d\n", audio_info.u32SamplesPerFrame);

    ret = RKADK_STREAM_AencStart(handle);
    if (ret) {
        RKADK_STREAM_AudioDeInit(handle);
        CVR_ERR("RKADK_STREAM_AencStart failed");
        return -1;
    }

    algorithm_audio_ctx.ai_handle = handle;

    return 0;
}

static void algorithm_audio_stop(void) {
    if (NULL == algorithm_audio_ctx.ai_handle)
        return;
    RKADK_STREAM_AencStop(algorithm_audio_ctx.ai_handle);
    RKADK_STREAM_AudioDeInit(algorithm_audio_ctx.ai_handle);
    algorithm_audio_ctx.ai_handle = NULL;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t algorithm_audio_init(void) {
    if (algorithm_audio_preprocess_init())
        return -1;

    if (algorithm_audio_start())
        return -1;

    return 0;
}

void algorithm_audio_deinit(void) {
    algorithm_audio_stop();
    algorithm_audio_preprocess_deinit();
}

#endif