/****************************************************************************
 *
 *    Copyright (c) 2024 by Rockchip Corp.  All rights reserved.
 *
 *    The material in this file is confidential and contains trade secrets
 *    of Rockchip Corporation. This is proprietary information owned by
 *    Rockchip Corporation. No part of this work may be disclosed,
 *    reproduced, copied, transmitted, or used in any way for any purpose,
 *    without the express written permission of Rockchip Corporation.
 *
 *****************************************************************************/
#ifndef _AUTO_COMMON_H_
#define _AUTO_COMMON_H_

#include "utils/log.h"
#include "block_heap.h"
#include "utils/libpthread.h"
#include "utils/libringbuffer.h"

#include <rk_mpi_vi.h>
#include <rk_mpi_mb.h>
#include <rockauto_image.h>
#include <rockauto_cvr_api.h>
#include <rkadk_param.h>

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define container_of(ptr, type, member) ({                      \
		        const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
			        (type *)( (char *)__mptr - offsetof(type,member) );})
 
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)

typedef struct {
    VI_DEV          dev_id;
    RKADK_U32       chn_id;
    uint32_t        width;
    uint32_t        height;
    uint8_t         fps;
} auto_vi_attr_t, *auto_vi_attr_p;

typedef struct {
    bool vaild;

    auto_vi_attr_t vi;

    BLOCK_HEAP_S heap;

    RockAutoHandle handle;
    RockAutoInitParam param;

    LIB_PTHREAD_T* frame_push_thr;
} auto_common_context_t, *auto_common_context_p;

typedef struct {
    bool vaild;

    RockAutoCvrInitParams param;

    ringbuffer *event_buffer;

    pthread_mutex_t mutex;
    pthread_cond_t cond;
} auto_cvr_context_t, *auto_cvr_context_p;

typedef struct {
    RGN_HANDLE rgn_handle;
    MPP_CHN_S mpp_chn;
    RECT_S region;
    LIB_PTHREAD_T* process_thr;
} auto_cvr_handle_t, *auto_cvr_handle_p;

typedef struct {
    bool init;
    auto_common_context_t common;
    auto_cvr_context_t cvr;
    auto_cvr_handle_t cvr_event_handle;
} auto_context_t, *auto_context_p;

int32_t auto_common_init(auto_common_context_p conmon_ctx);
void    auto_common_deinit(auto_common_context_p conmon_ctx);
void    auto_common_stop(auto_common_context_p common_ctx);
void    auto_common_start(auto_common_context_p common_ctx);

int32_t auto_cvr_init(auto_cvr_context_p cvr_ctx);
void    auto_cvr_deinit(auto_cvr_context_p cvr_ctx);
int32_t auto_cvr_clear_event(auto_cvr_context_p cvr_ctx);
int32_t auto_cvr_pop_result(auto_cvr_context_p cvr_ctx, RockAutoCvrDetResult * result, int32_t time_out_ms);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif