/*
 * Copyright (c) 2024 Rockchip, Inc. All Rights Reserved.
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

#include "common.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <sys/time.h>
#include <time.h>
#include <pthread.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

inline unsigned long long current_time_millis() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (unsigned long long)(ts.tv_sec * 1000 + ts.tv_nsec / 1000000);
}

static void cvr_param_init(auto_cvr_context_p cvr_ctx) {
    RockAutoCvrInitParams *cvr_init_param = &cvr_ctx->param;
    auto_context_p auto_ctx = container_of(cvr_ctx, auto_context_t, cvr);
    auto_vi_attr_p vi_attr = &auto_ctx->common.vi;

    // Model detection frame rate, recommended 8-11 frames
    cvr_init_param->video_frame_fps = vi_attr->fps;
    cvr_init_param->video_frame_width = vi_attr->width;
    cvr_init_param->video_frame_height =  vi_attr->height;

    // Lateral deviation parameters
    // The left alarming line takes the left 1/3
    cvr_init_param->line_alert_x_left = vi_attr->width * 1 / 3;
    // The right alarming line takes the right 1/3
    cvr_init_param->line_alert_x_right = vi_attr->height * 2 / 3;
    // The height of alarming line takes 6/7
    // cvr_init_param->line_alert_y = (int)( cvr_init_param->video_frame_height * 6 / 7);

    // Camera parameters, related to installation position
    cvr_init_param->cam_h = 1.26;
    cvr_init_param->cam_alpha = -0.040;
    cvr_init_param->cam_nosewheel_dis = 1.65;

    // Camera undistorted correction parameters
    cvr_init_param->intrinsics_origin_matrix[0] = 789.472547;
    cvr_init_param->intrinsics_origin_matrix[1] = 785.383735;
    cvr_init_param->intrinsics_origin_matrix[2] = 701.22069;
    cvr_init_param->intrinsics_origin_matrix[3] = 335.816452;

    // Camera parameters after distortion correction
    cvr_init_param->intrinsics_calibration_matrix[0] = 540.45;
    cvr_init_param->intrinsics_calibration_matrix[1] = 478.91;
    cvr_init_param->intrinsics_calibration_matrix[2] = 618.76;
    cvr_init_param->intrinsics_calibration_matrix[3] = 333.4;

    // Reaction time for collision with front vehicle
    cvr_init_param->crash_reaction_time = 0.8;
    // Reaction time for being too close to the front vehicle
    cvr_init_param->near_reaction_time = 1.4;
    // The width of the collision and too-close-to-front-vehicle alerts
    cvr_init_param->alert_width = 3;

    cvr_init_param->auto_lane_det_enble = 1;  // Enable lane line model
}

static int32_t auto_cvr_push_result(auto_cvr_context_p cvr_ctx, const RockAutoCvrDetResult * result) {
    if (NULL == cvr_ctx || NULL == result) {
        CVR_ERR("Invalid parameter!\n");
        return -1;
    }

    int32_t ret;
    size_t left = 0, len = 0;

    pthread_mutex_lock(&cvr_ctx->mutex);

    len = sizeof(RockAutoCvrDetResult);
    left = rb_get_space_free(cvr_ctx->event_buffer);
    if (len > left) {
        RockAutoCvrDetResult temp;
        rb_read(cvr_ctx->event_buffer, &temp, len);
        CVR_WARN("Overwrite the oldest data, frameId = %u\n", temp.frameId);
    }

    ret = rb_write(cvr_ctx->event_buffer, result, len);
    if (0 >= ret)
        CVR_ERR("Failed to write data to buffer.\n");

    pthread_mutex_unlock(&cvr_ctx->mutex);

    pthread_cond_signal(&cvr_ctx->cond);

    return ret;
}

static void result_cb(const RockAutoCvrDetResult* result, const RockAutoExecuteStatus status, void* userdata) {
    auto_context_p auto_ctx = (auto_context_p)userdata;

    if (ROCKAUTO_SUCCESS == status)
        auto_cvr_push_result(&auto_ctx->cvr, result);
    else
        CVR_WARN("Abnormal algorithm results! status: %d\n", status);
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t auto_cvr_pop_result(auto_cvr_context_p cvr_ctx, RockAutoCvrDetResult * result, int32_t time_out_ms) {
    if (NULL == cvr_ctx || NULL == result) {
        CVR_ERR("Invalid parameter!\n");
        return -1;
    }

    int32_t ret;
    struct timeval timeNow;
    struct timespec timeout;

    pthread_mutex_lock(&cvr_ctx->mutex);

    if (0 >= rb_get_space_used(cvr_ctx->event_buffer)) {
        gettimeofday(&timeNow, NULL);
        timeout.tv_sec = timeNow.tv_sec + time_out_ms / 1000;
        timeout.tv_nsec = (timeNow.tv_usec + (time_out_ms % 1000) * 1000) * 1000;
        if (timeout.tv_nsec >= 1000000000) {
            timeout.tv_sec += 1;
            timeout.tv_nsec -= 1000000000;
        }
        pthread_cond_timedwait(&cvr_ctx->cond, &cvr_ctx->mutex, &timeout);
    }

    ret = rb_read(cvr_ctx->event_buffer, result, sizeof(RockAutoCvrDetResult));

    pthread_mutex_unlock(&cvr_ctx->mutex);

    return ret;
}

int32_t auto_cvr_clear_event(auto_cvr_context_p cvr_ctx) {
    if (NULL == cvr_ctx) {
        CVR_ERR("Invalid parameter!\n");
        return -1;
    }

    pthread_mutex_lock(&cvr_ctx->mutex);

    rb_cleanup(cvr_ctx->event_buffer);

    pthread_mutex_unlock(&cvr_ctx->mutex);

    return 0;
}

int32_t auto_cvr_init(auto_cvr_context_p cvr_ctx) {
    int32_t buf_size = 0;
    ringbuffer *event_buffer = NULL;
    auto_context_p auto_ctx = container_of(cvr_ctx, auto_context_t, cvr);

    cvr_param_init(cvr_ctx);

    buf_size = 10 * sizeof(RockAutoCvrDetResult);
    event_buffer = rb_create(buf_size);
    if (NULL == event_buffer) {
        CVR_ERR("Failed to apply for event buffer!\n");
        goto rb_create_fail;
    }
    cvr_ctx->event_buffer = event_buffer;

    RockAutoRetCode ret = ROCKAUTO_CVR_Init(auto_ctx->common.handle, &cvr_ctx->param, result_cb);
    if (ret != ROCKAUTO_RET_SUCCESS) {
        CVR_ERR("ROCKAUTO_CVR_Init error %d\n", ret);
        goto cvr_init_fail;
    }

    pthread_mutex_init(&cvr_ctx->mutex, NULL);
    pthread_cond_init(&cvr_ctx->cond, NULL);

    cvr_ctx->vaild = true;

    return 0;

cvr_init_fail:
    if (NULL != event_buffer) {
        rb_destroy(event_buffer);
        event_buffer = NULL;
    }

rb_create_fail:
    return -1;
}

void auto_cvr_deinit(auto_cvr_context_p cvr_ctx) {
    if (false == cvr_ctx->vaild)
        return;

    auto_context_p auto_ctx = container_of(cvr_ctx, auto_context_t, cvr);

    if (cvr_ctx->event_buffer)
        rb_destroy(cvr_ctx->event_buffer);

    if (auto_ctx->common.handle)
        ROCKAUTO_CVR_Release(auto_ctx->common.handle);

    pthread_mutex_destroy(&cvr_ctx->mutex);
    pthread_cond_destroy(&cvr_ctx->cond);

    cvr_ctx->vaild = false;
}