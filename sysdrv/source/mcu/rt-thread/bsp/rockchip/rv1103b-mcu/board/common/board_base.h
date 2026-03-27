/*
 * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-04-19     Jason Zhu    first implementation
 */

#ifndef __BOARD_BASE_H__
#define __BOARD_BASE_H__

#include "drv_uart.h"
#include "int_mux.h"
#include "riscv_csr_encoding.h"
#include "timer.h"
#include "hal_base.h"

#ifdef RT_USING_CAMERA
#include "board_cam.h"
#endif

#define MAX_HANDLERS       NUM_INTERRUPTS

extern  void *_end;
extern  void *_heap_end;
#define HEAP_BEGIN  &_end
#define HEAP_END    &_heap_end

#define INTERRUPT_SEPERATE 32

void rt_hw_board_init(void);
rt_bool_t sirq_status(void);

#endif
