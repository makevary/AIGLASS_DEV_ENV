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
#include "utils/state_machine.h"

#include "record_process.h"

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/
typedef enum {
    RECORD_EVENT_CALL_TYPE,
    RECORD_EVENT_CALL_MAX
} RECORD_EVENT_TYPES_E;

typedef struct {
   RECORD_CONDITION_TYPES_E condition;
   const char *extra_date;
} record_event_pay_load_t;

typedef struct {
    uint32_t cam_id;
    HANDLE utils_handle;
    RKADK_RECORD_ATTR_S attr;
    RECORD_STATE_CALLBACK_FN state_cb;
    struct stateMachine state_machine;
    struct state state_action, state_idle, state_ready, state_stop, state_init;
} record_proc_context_t, *record_proc_context_p;

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/
static bool record_action_guard(void *condition, struct event *event);
static bool record_ready_guard(void *condition, struct event *event);
static bool record_stop_guard(void *condition, struct event *event);
static bool record_init_guard(void *condition, struct event *event);
static bool record_idle_guard(void *condition, struct event *event);

static int32_t record_state_copy(struct state *src, struct state *dst) {
    if (NULL == src || NULL == dst)
        return -1;

    memcpy(dst, src, sizeof(struct state));
    dst->numTransitions = src->numTransitions;
    dst->transitions = (struct transition *)calloc(src->numTransitions, sizeof(struct transition));
    memcpy(dst->transitions, src->transitions, src->numTransitions * sizeof(struct transition));
    return 0;
}

static void record_state_free(struct state *src) {
    if (NULL == src)
        return;

    if (NULL != src->transitions) {
        free(src->transitions);
        src->transitions = NULL;
    }
}

static bool record_action_guard(void *condition, struct event *event) {
    record_event_pay_load_t *event_data = (record_event_pay_load_t *)event->data;
    if (((RECORD_CONDITION_TYPES_E)condition) != event_data->condition)
        return false;

    record_proc_context_p ctx = (record_proc_context_p)event_data->extra_date;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_START_BEFORE
        };
        ctx->state_cb(ctx, &state_info);
    }

    if (record_utils_start(ctx->utils_handle))
        return false;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_START_AFTER
        };
        ctx->state_cb(ctx, &state_info);
    }

    CVR_INFO("Enter action recording mode.\n");

    return true;
}

static bool record_ready_guard(void *condition, struct event *event) {
    record_event_pay_load_t *event_data = (record_event_pay_load_t *)event->data;
    if (((RECORD_CONDITION_TYPES_E)condition) != event_data->condition)
        return false;

    record_proc_context_p ctx = (record_proc_context_p)event_data->extra_date;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_STOP_BEFORE
        };
        ctx->state_cb(ctx, &state_info);
    }

    if (record_utils_stop(ctx->utils_handle))
        return false;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_STOP_AFTER
        };
        ctx->state_cb(ctx, &state_info);
    }

    CVR_INFO("Enter the ready-to-record mode.\n");

    return true;
}

static bool record_stop_guard(void *condition, struct event *event) {
    record_event_pay_load_t *event_data = (record_event_pay_load_t *)event->data;
    if (((RECORD_CONDITION_TYPES_E)condition) != event_data->condition)
        return false;

    record_proc_context_p ctx = (record_proc_context_p)event_data->extra_date;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_STOP_BEFORE
        };
        ctx->state_cb(ctx, &state_info);
    }

    if (record_utils_stop(ctx->utils_handle))
        return false;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_STOP_AFTER
        };
        ctx->state_cb(ctx, &state_info);
    }

    CVR_INFO("Enter stop recording mode.\n");

    return true;
}

static bool record_idle_guard(void *condition, struct event *event) {
    record_event_pay_load_t *event_data = (record_event_pay_load_t *)event->data;
    if (((RECORD_CONDITION_TYPES_E)condition) != event_data->condition)
        return false;

    record_proc_context_p ctx = (record_proc_context_p)event_data->extra_date;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_DEINIT_BEFORE
        };
        ctx->state_cb(ctx, &state_info);
    }

    if (NULL != ctx->utils_handle) {
        record_utils_stop(ctx->utils_handle);
        record_utils_destroy(ctx->utils_handle);
    }

    ctx->utils_handle = NULL;
    ctx->cam_id = -1;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_DEINIT_AFTER
        };
        ctx->state_cb(ctx, &state_info);
    }

    CVR_INFO("Enter idle recording mode.\n");

    return true;
}

static bool record_init_guard(void *condition, struct event *event) {
    record_event_pay_load_t *event_data = (record_event_pay_load_t *)event->data;
    if (((RECORD_CONDITION_TYPES_E)condition) != event_data->condition)
        return false;

    record_proc_context_p ctx = (record_proc_context_p)event_data->extra_date;

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_INIT_BEFORE
        };
        ctx->state_cb(ctx, &state_info);
    }

    ctx->utils_handle = record_utils_create(&ctx->attr);
    if (NULL == ctx->utils_handle) {
        CVR_ERR("Can not initialize Record.\n");
        return false;
    }

    if (NULL != ctx->state_cb) {
        record_proc_state_info_t state_info = {
            .cam_id = ctx->cam_id,
            .state = RECORD_STATE_TRANS_INIT_AFTER
        };
        ctx->state_cb(ctx, &state_info);
    }

    return true;
}

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
int32_t record_proc_state_transition(HANDLE proc_handle, RECORD_CONDITION_TYPES_E contition) {
    if (NULL == proc_handle) {
        CVR_ERR("Invalid input parameter.\n");
        return -1;
    }

    record_proc_context_p ctx = (record_proc_context_p)proc_handle;

    struct event record_event = {RECORD_EVENT_CALL_TYPE, &(record_event_pay_load_t){contition, (const char *)ctx}};
    if (stateM_stateChanged != stateM_handleEvent(&(ctx->state_machine), &record_event)) {
        CVR_ERR("State transition failed!\n");
        return -1;
    }

    return 0;
}

HANDLE record_proc_create(record_proc_attr_p record_attr) {
    if (NULL == record_attr) {
        CVR_ERR("Invalid input parameter.\n");
        return NULL;
    }

    int32_t ret;
    record_proc_context_p new_ctx;

    new_ctx = (record_proc_context_p)calloc(1, sizeof *new_ctx);
    if (NULL == new_ctx) {
        CVR_ERR("cam_id: %d, Recording module creation failed.\n", new_ctx->cam_id);
        return NULL;
    }

    struct state idle = {
        .data = new_ctx,
        .entryAction = NULL,
        .exitAction = NULL,
        .transitions = (struct transition[]) {
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_INIT, record_init_guard, NULL, &(new_ctx->state_init)},
        },
        .numTransitions = 1,
        .parentState = NULL,
        .entryState = NULL
    };

    struct state init = {
        .data = new_ctx,
        .entryAction = NULL,
        .exitAction = NULL,
        .transitions = (struct transition[]) {
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_IDLE, record_idle_guard, NULL, &(new_ctx->state_idle)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_STOP, record_stop_guard, NULL, &(new_ctx->state_stop)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_READY, record_ready_guard, NULL, &(new_ctx->state_ready)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_ACTION, record_action_guard, NULL, &(new_ctx->state_action)},
        },
        .numTransitions = 4,
        .parentState = NULL,
        .entryState = NULL
    };

    struct state ready = {
        .data = new_ctx,
        .entryAction = NULL,
        .exitAction = NULL,
        .transitions = (struct transition[]) {
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_IDLE, record_idle_guard, NULL, &(new_ctx->state_idle)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_STOP, record_stop_guard, NULL, &(new_ctx->state_stop)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_NORMAL_STR, record_action_guard, NULL, &(new_ctx->state_action)},
        },
        .numTransitions = 3,
        .parentState = NULL,
        .entryState = NULL
    };

    struct state action = {
        .data = new_ctx,
        .entryAction = NULL,
        .exitAction = NULL,
        .transitions = (struct transition[]) {
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_IDLE, record_idle_guard, NULL, &(new_ctx->state_idle)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_STOP, record_stop_guard, NULL, &(new_ctx->state_stop)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_ANNORMAL_STR, record_ready_guard, NULL, &(new_ctx->state_ready)},
        },
        .numTransitions = 3,
        .parentState = NULL,
        .entryState = NULL
    };

    struct state stop = {
        .data = new_ctx,
        .entryAction = NULL,
        .exitAction = NULL,
        .transitions = (struct transition[]) {
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_IDLE, record_idle_guard, NULL, &(new_ctx->state_idle)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_READY, record_ready_guard, NULL, &(new_ctx->state_ready)},
            {RECORD_EVENT_CALL_TYPE, (void *)RECORD_CONDITION_ACTION, record_action_guard, NULL, &(new_ctx->state_action)},
        },
        .numTransitions = 3,
        .parentState = NULL,
        .entryState = NULL
    };

    new_ctx->cam_id = record_attr->cam_id;
    new_ctx->state_cb = record_attr->state_cb;
    memcpy(&(new_ctx->attr), &(record_attr->attr), sizeof(new_ctx->attr));

    record_state_copy(&idle, &(new_ctx->state_idle));
    record_state_copy(&init, &(new_ctx->state_init));
    record_state_copy(&ready, &(new_ctx->state_ready));
    record_state_copy(&action, &(new_ctx->state_action));
    record_state_copy(&stop, &(new_ctx->state_stop));

    stateM_init(&(new_ctx->state_machine), &(new_ctx->state_idle), NULL);
    ret = record_proc_state_transition(new_ctx, RECORD_CONDITION_INIT);
    if (0 != ret) {
        CVR_ERR("Failed to create instance.\n");
        goto fail;
    }

    return new_ctx;

fail:
    if (NULL != new_ctx) {
        record_proc_state_transition(new_ctx, RECORD_CONDITION_IDLE);

        record_state_free(&(new_ctx->state_idle));
        record_state_free(&(new_ctx->state_init));
        record_state_free(&(new_ctx->state_ready));
        record_state_free(&(new_ctx->state_action));
        record_state_free(&(new_ctx->state_stop));
        stateM_stopped(&(new_ctx->state_machine));

        free(new_ctx);
        new_ctx = NULL;
    }

    return NULL;
}

void record_proc_destroy(HANDLE proc_handle) {
    if (NULL == proc_handle)
        return;

    record_proc_context_p record_ctx = (record_proc_context_p)proc_handle;

    record_proc_state_transition(record_ctx, RECORD_CONDITION_IDLE);

    record_state_free(&(record_ctx->state_idle));
    record_state_free(&(record_ctx->state_init));
    record_state_free(&(record_ctx->state_ready));
    record_state_free(&(record_ctx->state_action));
    record_state_free(&(record_ctx->state_stop));
    stateM_stopped(&(record_ctx->state_machine));

    free(record_ctx);
    record_ctx = NULL;
}

int32_t record_proc_filecache_init(FILE_CACHE_ARG *file_cache_attr) {
    if (NULL == file_cache_attr)
        return -1;

    return record_utils_filecache_init(file_cache_attr);
}

int32_t record_proc_filecache_deinit(void) {
    return record_utils_filecache_deinit();
}

void record_proc_filecache_set_mode(RKADK_REC_TYPE_E rec_type) {
    record_utils_filecache_set_mode(rec_type);
}

bool record_proc_check_active(HANDLE proc_handle) {
    if (NULL == proc_handle) {
        CVR_ERR("Invalid input parameter.\n");
        return false;
    }

    record_proc_context_p ctx = (record_proc_context_p)proc_handle;
    if (&(ctx->state_action) == stateM_currentState(&(ctx->state_machine)))
        return true;

    return false;
}

int32_t record_proc_manual_split(HANDLE proc_handle) {
    if (NULL == proc_handle) {
        CVR_ERR("Invalid input parameter.\n");
        return -1;
    }

    record_proc_context_p ctx = (record_proc_context_p)proc_handle;
    RKADK_REC_MANUAL_SPLIT_ATTR_S split_attr;

    bzero(&split_attr, sizeof(split_attr));

    split_attr.enManualType = MUXER_PRE_MANUAL_SPLIT;
    split_attr.u32DurationSec = 20;
    return record_utils_manual_split(ctx->utils_handle, &split_attr);
}

int32_t record_proc_reset(HANDLE proc_handle) {
    if (NULL == proc_handle) {
        CVR_ERR("Invalid input parameter.\n");
        return -1;
    }

    record_proc_context_p ctx = (record_proc_context_p)proc_handle;

    return record_utils_reset(ctx->utils_handle);
}

int32_t record_proc_set_resolution(uint32_t cam_id, RKADK_PARAM_RES_E resolution) {
    return record_utils_set_resolution(cam_id, resolution);
}

RKADK_PARAM_RES_E record_proc_get_resolution(uint32_t cam_id) {
    return record_utils_get_resolution(cam_id);
}

int32_t record_proc_set_codec_type(uint32_t cam_id, RKADK_CODEC_TYPE_E codec_type) {
    return record_utils_set_codec_type(cam_id, codec_type);
}

RKADK_CODEC_TYPE_E record_proc_get_codec_type(uint32_t cam_id) {
    return record_utils_get_codec_type(cam_id);
}

int32_t record_proc_set_rec_type(uint32_t cam_id, RKADK_REC_TYPE_E rec_type) {
    return record_utils_set_rec_type(cam_id, rec_type);
}