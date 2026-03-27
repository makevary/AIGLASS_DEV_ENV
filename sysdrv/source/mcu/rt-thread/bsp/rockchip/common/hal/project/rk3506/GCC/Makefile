# SPDX-License-Identifier: BSD-3-Clause */

# Copyright (c) 2024 Rockchip Electronics Co., Ltd.

PROJECT		:= RK3506
SOC		:= RK3506
CPU		:= -mcpu=cortex-a7

CFLAGS := -O2 -mfloat-abi=hard

FIRMWARE_CPU_BASE ?= 0x03e00000
DRAM_SIZE ?= 0x00100000

CFLAGS += -DFIRMWARE_BASE=$(FIRMWARE_CPU_BASE) -DDRAM_SIZE=$(DRAM_SIZE)

-include ../../../middleware/benchmark/benchmark.mk
include ../../common/GCC/Cortex-A.mk
