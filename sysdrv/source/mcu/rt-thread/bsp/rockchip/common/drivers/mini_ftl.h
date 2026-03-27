/**
  * Copyright (c) 2020 Fuzhou Rockchip Electronics Co., Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @file    mini_ftl.h
  * @version V1.0
  * @brief   spi nand special mini ftl head file
  *
  * Change Logs:
  * Date           Author          Notes
  * 2020-07-23     Dingqiang Lin   the first version
  *
  ******************************************************************************
  */

#ifndef MINI_FTL_H__
#define MINI_FTL_H__

#include <drivers/mtd_nand.h>

int mftl_mtd_read(rt_mtd_nand_t mtd, rt_uint8_t *data_buf, rt_uint32_t from, rt_uint32_t length);
int mftl_mtd_write(rt_mtd_nand_t mtd, rt_uint32_t to, const rt_uint8_t *data_buf, rt_uint32_t length);
int mftl_mtd_erase(rt_mtd_nand_t mtd, rt_uint32_t addr, size_t len);

int mini_ftl_register(rt_mtd_nand_t mtd);

#endif
