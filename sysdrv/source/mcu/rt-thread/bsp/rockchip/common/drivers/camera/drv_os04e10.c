/**
  * Copyright (c) 2024 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @file    drv_os04e10.c
  * @version V0.0.1
  *
  * Change Logs:
  * 2024-03-29     Su Yuefu      first implementation
  *
  ******************************************************************************
  */

#include "camera.h"
#include <rthw.h>
#include <rtdevice.h>
#include <rtthread.h>
#include <rtconfig.h>
#include "hal_base.h"
#include "board.h"
#include "drv_clock.h"
#include "board.h"
#include "isp3/drv_isp3.h"

#ifdef RT_USING_OS04E10

RT_WEAK const struct camera_board_desc camera_os04e10[] = {0};

#define OS04E10_DEBUG_PRT      0

#define os04e10_info(dev, fmt, ...)          rt_kprintf("os04e10-%s "fmt"", dev->name, ##__VA_ARGS__)
#define os04e10_err(dev, fmt, ...)           rt_kprintf("os04e10-%s error "fmt"", dev->name, ##__VA_ARGS__)
#if OS04E10_DEBUG_PRT
#include <stdio.h>
#define os04e10_dbg(dev, fmt, ...)           rt_kprintf("os04e10-%s "fmt"", dev->name, ##__VA_ARGS__)
#else
#define os04e10_dbg(dev, fmt, ...)
#endif

#define OS04E10_REG_RESET                        0x0103
#define OS04E10_REG_EXP_LONG_H                   0x3500 //Bit[3:0] -> [19:16]
#define OS04E10_REG_EXP_LONG_M                   0x3501 //Bit[7:0] -> [15:8]
#define OS04E10_REG_EXP_LONG_L                   0x3502 //Bit[7:0] -> [7:0]
#define OS04E10_REG_DIG_GAIN_H                   0x350A
#define OS04E10_REG_DIG_GAIN_L                   0x350B
#define OS04E10_REG_ANA_GAIN_H                   0x3508
#define OS04E10_REG_ANA_GAIN_L                   0x3509
#define OS04E10_EXP_MIN                          2
#define OS04E10_GAIN_MIN                         0x0080
#define OS04E10_GAIN_MAX                         (31743) //15.5 * 16 * 128
#define OS04E10_FLIP_MIRROR_REG                  0x3820
#define OS04E10_REG_VTS_H                        0x380E //Bit[6:0] -> [14:8]
#define OS04E10_REG_VTS_L                        0x380F //Bit[7:0] -> [7:0]
#define OS04E10_FETCH_MIRROR(VAL, ENABLE)        (ENABLE ? VAL & 0xf7 : VAL | 0x08)
#define OS04E10_FETCH_FLIP(VAL, ENABLE)          (ENABLE ? VAL | 0x10 : VAL & 0xef)

#define OS04E10_REG_STREAM_CTRL                  0x0100
#define OS04E10_STREAM_ON                        0x01
#define OS04E10_STREAM_OFF                       0x00

#define REG_END                                 (0x0)
#define REG_DELAY                               (0xff)

#define ARRAY_SIZE(x)                           (sizeof(x) / sizeof((x)[0]))

struct os04e10_sensor_reg
{
    uint16_t reg_addr;
    uint8_t val;
} __attribute__((__packed__));

struct os04e10_mode
{
    struct v4l2_fract max_fps;
    uint16_t bus_fmt;
    uint16_t width;
    uint16_t height;
    uint16_t hts_def;
    uint16_t vts_def;
    uint16_t exp_def;
    uint32_t xvclk;
    uint32_t link_freq;
    const uint8_t *reg_list;
    const int reg_list_size;
    uint8_t hdr_mode;
} __attribute__((__packed__));

#pragma pack(1)
struct os04e10
{
    struct rk_camera_device parent;
    char name[RK_CAMERA_DEVICE_NAME_SIZE];
    uint8_t time_valid_delay;
    uint8_t gain_valid_delay;
    char i2c_name[RK_CAMERA_I2C_NAME_SIZE];
    struct rt_i2c_bus_device *i2c_bus;
    uint8_t i2c_addr;
    uint8_t flip;
    struct rt_mutex mutex_lock;
    struct rk_camera_exp_val init_exp;
    const struct os04e10_mode *cur_mode;
    struct os04e10_mode *dst_mode;

    bool has_init_exp;
    bool streaming;
};
#pragma pack()

struct os04e10_ops
{
    ret_err_t (*init)(struct os04e10 *dev);
    ret_err_t (*open)(struct os04e10 *dev, uint16_t oflag);
    ret_err_t (*close)(struct os04e10 *dev);
    ret_err_t (*control)(struct os04e10 *dev, dt_cmd_t cmd, void *arg);
};

/*
 * Xclk 24Mhz
 * max_framerate 120fps
 * mipi_datarate per lane 900Mbps, 2lane
 * only 2x2 binning to 1024x1024
 */
static const uint8_t os04e10_1024x1024_120fps_regs[] =
{
    0x3, 0x01, 0x03, 0x01,
    0x3, 0x03, 0x01, 0x44,
    0x6, 0x03, 0x03, 0x02, 0x00, 0x4b, 0x00,
    0x3, 0x03, 0x25, 0x3b,
    0x4, 0x03, 0x27, 0x04, 0x05,
    0x3, 0x30, 0x02, 0x21,
    0x3, 0x30, 0x16, 0x32,
    0x3, 0x30, 0x1b, 0xf0,
    0x4, 0x30, 0x1e, 0xb4, 0xd0,
    0x4, 0x30, 0x21, 0x03, 0x01,
    0x5, 0x31, 0x07, 0xa1, 0x7d, 0xfc,
    0x6, 0x35, 0x00, 0x00, 0x04, 0x1a, 0x88,
    0xd, 0x35, 0x08, 0x01, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20,
    0x4, 0x36, 0x00, 0x4c, 0x08,
    0x4, 0x36, 0x10, 0x87, 0x24,
    0x3, 0x36, 0x14, 0x4c,
    0x4, 0x36, 0x20, 0x01, 0x04,
    0x4, 0x36, 0x32, 0x80, 0x00,
    0x3, 0x36, 0x60, 0x00,
    0x3, 0x36, 0x62, 0x08,
    0x6, 0x36, 0x64, 0x70, 0x00, 0x00, 0x00,
    0x3, 0x36, 0x6a, 0x14,
    0x7, 0x36, 0x70, 0x0b, 0x0b, 0x0b, 0x0b, 0x00,
    0x4, 0x36, 0x78, 0x2b, 0x43,
    0x7, 0x36, 0x81, 0xff, 0x86, 0x44, 0x24, 0x00,
    0x3, 0x36, 0x8a, 0x00,
    0x4, 0x36, 0x8d, 0x2b, 0x6b,
    0x7, 0x36, 0x90, 0x00, 0x0b, 0x0b, 0x0b, 0x0b,
    0x3, 0x36, 0x99, 0x03,
    0xa, 0x36, 0x9d, 0x68, 0x34, 0x1b, 0x0f, 0x77, 0x00, 0x02, 0x02,
    0x2c, 0x36, 0xb0, 0x30, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0c, 0x0c, 0x0c, 0x0c, 0x00, 0x08, 0x10, 0x10, 0x00, 0x08, 0x10, 0x10,
    0x5, 0x37, 0x04, 0x05, 0x00, 0x2b,
    0x5, 0x37, 0x09, 0x49, 0x00, 0x60,
    0x5, 0x37, 0x0e, 0x0c, 0x1c, 0x00,
    0x4, 0x37, 0x13, 0x00, 0x28,
    0x3, 0x37, 0x16, 0x24,
    0x3, 0x37, 0x1a, 0x1e,
    0x4, 0x37, 0x24, 0x0d, 0xb2,
    0x3, 0x37, 0x2b, 0x54,
    0x3, 0x37, 0x39, 0x10,
    0x13, 0x37, 0x3f, 0xa0, 0x2b, 0x2b, 0x2b, 0x2b, 0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x4, 0x37, 0x56, 0x00, 0x0e,
    0x3, 0x37, 0x60, 0x11,
    0x3, 0x37, 0x67, 0x08,
    0x6, 0x37, 0x73, 0x01, 0x02, 0x12, 0x02,
    0x5, 0x37, 0x7b, 0x40, 0x00, 0x0c,
    0x3, 0x37, 0x82, 0x02,
    0x3, 0x37, 0x87, 0x24,
    0x4, 0x37, 0x95, 0x24, 0x01,
    0x3, 0x37, 0x98, 0x40,
    0x6, 0x37, 0x9c, 0x00, 0x00, 0x00, 0x01,
    0x3, 0x37, 0xa1, 0x10,
    0x3, 0x37, 0xa6, 0x00,
    0x3, 0x37, 0xac, 0xa0,
    0x3, 0x37, 0xbb, 0x02,
    0x4, 0x37, 0xbe, 0x0a, 0x0a,
    0x3, 0x37, 0xc2, 0x14,
    0x7, 0x37, 0xc4, 0x11, 0x80, 0x14, 0x08, 0x42,
    0x4, 0x37, 0xcd, 0x17, 0x04,
    0x3, 0x37, 0xd9, 0x04,
    0x3, 0x37, 0xdc, 0x01,
    0x5, 0x37, 0xe0, 0x30, 0x10, 0x14,
    0x3, 0x37, 0xe4, 0x28,
    0x3, 0x37, 0xef, 0x00,
    0x6, 0x37, 0xf4, 0x00, 0x00, 0x00, 0x00,
    0x1e, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0f, 0x08, 0x0f, 0x04, 0x00, 0x04, 0x00, 0x03, 0x30, 0x04, 0x28, 0x00, 0x04, 0x00, 0x04, 0x03, 0x01, 0x03, 0x01, 0x00, 0x00, 0x00, 0x01,
    0xa, 0x38, 0x20, 0x8b, 0x00, 0x14, 0x08, 0x00, 0x20, 0x00, 0x08,
    0x5, 0x38, 0x29, 0x03, 0x00, 0x00,
    0x3, 0x38, 0x32, 0x00,
    0x6, 0x38, 0x38, 0x00, 0x00, 0x00, 0x00,
    0x5, 0x38, 0x3d, 0x01, 0x00, 0x00,
    0x3, 0x38, 0x43, 0x00,
    0xa, 0x38, 0x48, 0x08, 0x00, 0x08, 0x00, 0x00, 0x08, 0x00, 0x08,
    0x5, 0x38, 0x80, 0x16, 0x00, 0x08,
    0x3, 0x38, 0x8a, 0x00,
    0x5, 0x38, 0x9a, 0x00, 0x00, 0x00,
    0x6, 0x38, 0xa2, 0x02, 0x02, 0x02, 0x02,
    0x3, 0x38, 0xa7, 0x04,
    0x3, 0x38, 0xae, 0x1e,
    0x3, 0x38, 0xb8, 0x02,
    0x3, 0x38, 0xc3, 0x06,
    0x3, 0x3c, 0x80, 0x3f,
    0x4, 0x3c, 0x86, 0x01, 0x02,
    0x3, 0x3c, 0xa0, 0x01,
    0x3, 0x3c, 0xa2, 0x0c,
    0x4, 0x3d, 0x8c, 0x71, 0xe2,
    0x3, 0x3f, 0x00, 0xcb,
    0x3, 0x3f, 0x04, 0x04,
    0x3, 0x3f, 0x07, 0x04,
    0x3, 0x3f, 0x09, 0x50,
    0x4, 0x3f, 0x9e, 0x07, 0x04,
    0x3, 0x40, 0x00, 0xf3,
    0x4, 0x40, 0x02, 0x00, 0x40,
    0x6, 0x40, 0x08, 0x00, 0x05, 0x01, 0x78,
    0x3, 0x40, 0x0f, 0x89,
    0x4, 0x40, 0x40, 0x00, 0x03,
    0x3, 0x40, 0x90, 0x14,
    0x8, 0x40, 0xb0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x6, 0x40, 0xb7, 0x00, 0x00, 0x00, 0x00,
    0x9, 0x43, 0x00, 0xff, 0x00, 0x0f, 0x01, 0x01, 0x83, 0x21,
    0x3, 0x43, 0x0d, 0x00,
    0x3, 0x45, 0x01, 0x00,
    0x6, 0x45, 0x05, 0xe4, 0x00, 0x60, 0x00,
    0x4, 0x46, 0x00, 0x00, 0x20,
    0x3, 0x46, 0x03, 0x03,
    0x3, 0x48, 0x00, 0x64,
    0x3, 0x48, 0x03, 0x00,
    0x3, 0x48, 0x09, 0x8e,
    0x3, 0x48, 0x0e, 0x00,
    0x4, 0x48, 0x13, 0x00, 0x2a,
    0x3, 0x48, 0x1b, 0x3c,
    0x3, 0x48, 0x1f, 0x26,
    0x3, 0x48, 0x25, 0x32,
    0x3, 0x48, 0x29, 0x64,
    0x3, 0x48, 0x37, 0x11,
    0x3, 0x48, 0x4b, 0x07,
    0x3, 0x48, 0x83, 0x36,
    0x3, 0x48, 0x85, 0x03,
    0x3, 0x48, 0x8b, 0x00,
    0x8, 0x4d, 0x00, 0x04, 0x99, 0xbd, 0xac, 0xf2, 0x54,
    0x3, 0x4e, 0x00, 0x2a,
    0x3, 0x4e, 0x0d, 0x00,
    0x4, 0x50, 0x00, 0xbb, 0x09,
    0x4, 0x50, 0x04, 0x00, 0x0e,
    0x3, 0x50, 0x36, 0x00,
    0x3, 0x50, 0x80, 0x04,
    0x3, 0x50, 0x82, 0x00,
    0x8, 0x51, 0x80, 0x70, 0x10, 0x71, 0xdf, 0x02, 0x6c,
    0x3, 0x51, 0x89, 0x48,
    0xa, 0x53, 0x24, 0x09, 0x11, 0x1f, 0x3b, 0x49, 0x61, 0x9c, 0xc9,
    0x8, 0x53, 0x35, 0x04, 0x00, 0x04, 0x00, 0x0b, 0x00,
    0xa, 0x53, 0xa4, 0x09, 0x11, 0x1f, 0x3b, 0x49, 0x61, 0x9c, 0xc9,
    0x8, 0x53, 0xb5, 0x04, 0x00, 0x04, 0x00, 0x0b, 0x00,
    0x3, 0x58, 0x0b, 0x03,
    0x3, 0x58, 0x0d, 0x00,
    0x3, 0x58, 0x0f, 0x00,
    0x4, 0x58, 0x20, 0x00, 0x00,
    0x3, 0x58, 0x88, 0x01,
    0x8a,
};

/*
 * Xclk 24Mhz
 * max_framerate 30fps
 * mipi_datarate per lane 900Mbps, 2lane
 * full resolution 2048x2048
 */
static const uint8_t os04e10_2048x2048_30fps_regs[] =
{
    0x3, 0x01, 0x03, 0x01,
    0x3, 0x03, 0x01, 0x44,
    0x6, 0x03, 0x03, 0x02, 0x00, 0x4b, 0x00,
    0x3, 0x03, 0x25, 0x3b,
    0x4, 0x03, 0x27, 0x04, 0x05,
    0x3, 0x30, 0x02, 0x21,
    0x3, 0x30, 0x16, 0x32,
    0x4, 0x30, 0x1e, 0xb4, 0xd0,
    0x4, 0x30, 0x21, 0x03, 0x01,
    0x5, 0x31, 0x07, 0xa1, 0x7d, 0xfc,
    0x6, 0x35, 0x00, 0x00, 0x08, 0x54, 0x88,
    0xd, 0x35, 0x08, 0x01, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20,
    0x4, 0x36, 0x00, 0x4c, 0x08,
    0x4, 0x36, 0x10, 0x87, 0x24,
    0x3, 0x36, 0x14, 0x4c,
    0x4, 0x36, 0x20, 0x0c, 0x04,
    0x4, 0x36, 0x32, 0x80, 0x00,
    0x3, 0x36, 0x60, 0x00,
    0x3, 0x36, 0x62, 0x10,
    0x6, 0x36, 0x64, 0x70, 0x00, 0x00, 0x00,
    0x3, 0x36, 0x6a, 0x14,
    0x7, 0x36, 0x70, 0x0b, 0x0b, 0x0b, 0x0b, 0x00,
    0x4, 0x36, 0x78, 0x2b, 0x43,
    0x7, 0x36, 0x81, 0xff, 0x86, 0x44, 0x24, 0x00,
    0x3, 0x36, 0x8a, 0x00,
    0x4, 0x36, 0x8d, 0x2b, 0x6b,
    0x7, 0x36, 0x90, 0x00, 0x0b, 0x0b, 0x0b, 0x0b,
    0x3, 0x36, 0x99, 0x03,
    0xa, 0x36, 0x9d, 0x68, 0x34, 0x1b, 0x0f, 0x77, 0x00, 0x02, 0x02,
    0x2c, 0x36, 0xb0, 0x30, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0e, 0x0e, 0x0e, 0x0e, 0x0c, 0x0c, 0x0c, 0x0c, 0x00, 0x08, 0x10, 0x10, 0x00, 0x08, 0x10, 0x10,
    0x5, 0x37, 0x04, 0x05, 0x00, 0x2b,
    0x5, 0x37, 0x09, 0x49, 0x00, 0x60,
    0x5, 0x37, 0x0e, 0x0c, 0x1c, 0x00,
    0x4, 0x37, 0x13, 0x00, 0x24,
    0x3, 0x37, 0x16, 0x24,
    0x3, 0x37, 0x1a, 0x1e,
    0x4, 0x37, 0x24, 0x0d, 0xb2,
    0x3, 0x37, 0x2b, 0x54,
    0x3, 0x37, 0x39, 0x10,
    0x13, 0x37, 0x3f, 0xb0, 0x2b, 0x2b, 0x2b, 0x2b, 0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x4, 0x37, 0x56, 0x00, 0x0e,
    0x3, 0x37, 0x60, 0x11,
    0x3, 0x37, 0x67, 0x08,
    0x6, 0x37, 0x73, 0x01, 0x02, 0x12, 0x02,
    0x5, 0x37, 0x7b, 0x40, 0x00, 0x0c,
    0x3, 0x37, 0x82, 0x02,
    0x3, 0x37, 0x87, 0x24,
    0x4, 0x37, 0x95, 0x24, 0x01,
    0x3, 0x37, 0x98, 0x40,
    0x6, 0x37, 0x9c, 0x00, 0x00, 0x00, 0x01,
    0x3, 0x37, 0xa1, 0x10,
    0x3, 0x37, 0xa6, 0x00,
    0x3, 0x37, 0xac, 0xa0,
    0x3, 0x37, 0xbb, 0x02,
    0x4, 0x37, 0xbe, 0x0a, 0x0a,
    0x3, 0x37, 0xc2, 0x04,
    0x7, 0x37, 0xc4, 0x11, 0x80, 0x14, 0x08, 0x42,
    0x4, 0x37, 0xcd, 0x17, 0x04,
    0x3, 0x37, 0xd9, 0x08,
    0x3, 0x37, 0xdc, 0x01,
    0x5, 0x37, 0xe0, 0x30, 0x10, 0x14,
    0x3, 0x37, 0xe4, 0x28,
    0x3, 0x37, 0xef, 0x00,
    0x6, 0x37, 0xf4, 0x00, 0x00, 0x00, 0x00,
    0x1e, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0f, 0x08, 0x0f, 0x08, 0x00, 0x08, 0x00, 0x06, 0x50, 0x08, 0x74, 0x00, 0x08, 0x00, 0x08, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01,
    0xa, 0x38, 0x20, 0x80, 0x00, 0x04, 0x08, 0x00, 0x20, 0x00, 0x08,
    0x5, 0x38, 0x29, 0x03, 0x00, 0x00,
    0x3, 0x38, 0x32, 0x08,
    0x6, 0x38, 0x38, 0x00, 0x00, 0x00, 0x00,
    0x5, 0x38, 0x3d, 0x01, 0x00, 0x00,
    0x3, 0x38, 0x43, 0x00,
    0xa, 0x38, 0x48, 0x08, 0x00, 0x08, 0x00, 0x00, 0x08, 0x00, 0x08,
    0x5, 0x38, 0x80, 0x16, 0x00, 0x08,
    0x3, 0x38, 0x8a, 0x00,
    0x5, 0x38, 0x9a, 0x00, 0x00, 0x00,
    0x6, 0x38, 0xa2, 0x02, 0x02, 0x02, 0x02,
    0x3, 0x38, 0xa7, 0x04,
    0x3, 0x38, 0xae, 0x1e,
    0x3, 0x38, 0xb8, 0x02,
    0x3, 0x38, 0xc3, 0x06,
    0x3, 0x3c, 0x80, 0x3f,
    0x4, 0x3c, 0x86, 0x01, 0x02,
    0x3, 0x3c, 0xa0, 0x01,
    0x3, 0x3c, 0xa2, 0x0c,
    0x4, 0x3d, 0x8c, 0x71, 0xe2,
    0x3, 0x3f, 0x00, 0xcb,
    0x3, 0x3f, 0x04, 0x04,
    0x3, 0x3f, 0x07, 0x04,
    0x3, 0x3f, 0x09, 0x50,
    0x4, 0x3f, 0x9e, 0x07, 0x04,
    0x3, 0x40, 0x00, 0xf3,
    0x4, 0x40, 0x02, 0x00, 0x40,
    0x6, 0x40, 0x08, 0x00, 0x0f, 0x01, 0x78,
    0x3, 0x40, 0x0f, 0x89,
    0x4, 0x40, 0x40, 0x00, 0x07,
    0x3, 0x40, 0x90, 0x14,
    0x8, 0x40, 0xb0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x6, 0x40, 0xb7, 0x00, 0x00, 0x00, 0x00,
    0x9, 0x43, 0x00, 0xff, 0x00, 0x0f, 0x01, 0x01, 0x83, 0x21,
    0x3, 0x43, 0x0d, 0x00,
    0x3, 0x45, 0x01, 0x00,
    0x6, 0x45, 0x05, 0xc4, 0x00, 0x60, 0x00,
    0x3, 0x48, 0x00, 0x64,
    0x3, 0x48, 0x03, 0x00,
    0x3, 0x48, 0x09, 0x8e,
    0x3, 0x48, 0x0e, 0x00,
    0x4, 0x48, 0x13, 0x00, 0x2a,
    0x3, 0x48, 0x1b, 0x3c,
    0x3, 0x48, 0x1f, 0x26,
    0x3, 0x48, 0x25, 0x32,
    0x3, 0x48, 0x29, 0x64,
    0x3, 0x48, 0x37, 0x11,
    0x3, 0x48, 0x4b, 0x07,
    0x3, 0x48, 0x83, 0x36,
    0x3, 0x48, 0x85, 0x03,
    0x3, 0x48, 0x8b, 0x00,
    0x8, 0x4d, 0x00, 0x04, 0x99, 0xbd, 0xac, 0xf2, 0x54,
    0x3, 0x4e, 0x00, 0x2a,
    0x3, 0x4e, 0x0d, 0x00,
    0x4, 0x50, 0x00, 0xbb, 0x09,
    0x4, 0x50, 0x04, 0x00, 0x0e,
    0x3, 0x50, 0x36, 0x00,
    0x3, 0x50, 0x80, 0x04,
    0x3, 0x50, 0x82, 0x00,
    0x8, 0x51, 0x80, 0x70, 0x10, 0x71, 0xdf, 0x02, 0x6c,
    0x3, 0x51, 0x89, 0x48,
    0xa, 0x53, 0x24, 0x09, 0x11, 0x1f, 0x3b, 0x49, 0x61, 0x9c, 0xc9,
    0x8, 0x53, 0x35, 0x04, 0x00, 0x04, 0x00, 0x0b, 0x00,
    0xa, 0x53, 0xa4, 0x09, 0x11, 0x1f, 0x3b, 0x49, 0x61, 0x9c, 0xc9,
    0x8, 0x53, 0xb5, 0x04, 0x00, 0x04, 0x00, 0x0b, 0x00,
    0x3, 0x58, 0x0b, 0x03,
    0x3, 0x58, 0x0d, 0x00,
    0x3, 0x58, 0x0f, 0x00,
    0x4, 0x58, 0x20, 0x00, 0x00,
    0x3, 0x58, 0x88, 0x01,
    0x87,
};

static const struct os04e10_mode supported_modes[] =
{
    [OS04E10_1024X1024] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 1024,
        .height = 1024,
        .max_fps = {
            .numerator = 10000,
            .denominator = 1200000,
        },
        .exp_def = 0x46,
        .hts_def = 0x0330 * 2,//todo
        .vts_def = 0x0428,//todo
        .xvclk = 24000000,
        .link_freq = 450000000,
        .reg_list = os04e10_1024x1024_120fps_regs,
        .reg_list_size = ARRAY_SIZE(os04e10_1024x1024_120fps_regs),
        .hdr_mode = NO_HDR,
    },
    [OS04E10_2048X2048] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 2048,
        .height = 2048,
        .max_fps = {
            .numerator = 10000,
            .denominator = 300000,
        },
        .exp_def = 0x46,
        .hts_def = 0x650 * 2,
        .vts_def = 0x0874,
        .xvclk = 24000000,
        .link_freq = 450000000,
        .reg_list = os04e10_2048x2048_30fps_regs,
        .reg_list_size = ARRAY_SIZE(os04e10_2048x2048_30fps_regs),
        .hdr_mode = NO_HDR,
    }
};

static ret_err_t os04e10_read_reg(struct os04e10 *dev, uint16_t reg, uint8_t *data)
{
    struct rt_i2c_msg msg[2];
    uint8_t send_buf[2];
    uint8_t recv_buf[1];
    int retry = 10;
    ret_err_t ret;

    send_buf[0] = ((reg >> 8) & 0xff);
    send_buf[1] = ((reg >> 0) & 0xff);
    msg[0].addr = dev->i2c_addr;
    msg[0].flags = RT_I2C_WR;
    msg[0].len = 2;
    msg[0].buf = send_buf;

    msg[1].addr = dev->i2c_addr;
    msg[1].flags = RT_I2C_RD;
    msg[1].len = 1;
    msg[1].buf = recv_buf;

    while (1)
    {
        ret = rt_i2c_transfer(dev->i2c_bus, msg, 2);
        if (ret == 2)
        {
            *data = recv_buf[0];
            return RT_EOK;
        }
        else
        {
            os04e10_err(dev, "read reg, retry=%d, reg [0x%x]\n", retry, reg);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}

static ret_err_t os04e10_write_reg(struct os04e10 *dev, uint16_t reg, uint8_t data)
{
    uint8_t send_buf[3];
    struct rt_i2c_msg msg;
    int ret = 0;
    int retry = 10;

    send_buf[0] = ((reg >> 8) & 0xff);
    send_buf[1] = ((reg >> 0) & 0xff);
    send_buf[2] = data;

    msg.addr = dev->i2c_addr;
    msg.flags = RT_I2C_WR;
    msg.buf = send_buf;
    msg.len = 3;

    while (1)
    {
        ret = rt_i2c_transfer(dev->i2c_bus, &msg, 1);
        if (ret == 1)
        {
            return RT_EOK;
        }
        else
        {
            os04e10_err(dev, "write reg, retry:%d, reg [0x%x]-->0x%x\n", retry, reg, data);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}

static int os04e10_write_multiple_reg_continue(struct os04e10 *dev, const uint8_t *i2c_data, int len)
{
    uint16_t i;
    struct rt_i2c_msg msg;
    int ret = 0;
    int offset = 0;
    int retry = 10;

    RT_ASSERT(i2c_data != RT_NULL);

    for (i = 0; i < i2c_data[len - 1];)
    {
        msg.addr = dev->i2c_addr;
        msg.flags = RT_I2C_WR;
        msg.buf = (uint8_t *)&i2c_data[offset + 1];
        msg.len = i2c_data[offset];
        ret = rt_i2c_transfer(dev->i2c_bus, &msg, 1);

        if (ret != 1)
        {
            os04e10_err(dev, "write multi-regs, retry=%d, addr=0x%02x%02x\n",
                        retry, i2c_data[offset + 1], i2c_data[offset + 2]);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
        offset += (i2c_data[offset] + 1);
        retry = 10;
        i++;
    }

    return RT_EOK;
}

static int os04e10_get_gain_reg(uint32_t *again, uint32_t *dgain, uint32_t total_gain)
{
    int ret = 0;

    if (total_gain < OS04E10_GAIN_MIN)
        total_gain = OS04E10_GAIN_MIN;
    else if (total_gain > OS04E10_GAIN_MAX)
        total_gain = OS04E10_GAIN_MAX;

    if (total_gain < 0x7c0)
    {
        *again = total_gain;
        *dgain = 0x400;
    }
    else
    {
        *again = 0x7c0;
        *dgain = total_gain * 1024 / 0x7c0;
    }

    return ret;
}

static ret_err_t rk_os04e10_set_expval(struct os04e10 *dev, struct rk_camera_exp_val *exp)
{
    ret_err_t ret = RT_EOK;
    uint32_t l_exp_time, l_a_gain;
    uint32_t a_gain, d_gain;
    struct camera_board_desc *os04e10 = (struct camera_board_desc *)camera_os04e10;

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (!dev->has_init_exp && !dev->streaming && strcmp(os04e10->isp_subdev_name, RK_ISP_ASSIST_SUBDEV_NAME))
    {
        dev->init_exp = *exp;
        dev->has_init_exp = true;
        os04e10_dbg(dev, "don't stream, record exp\n");

        rt_mutex_release(&dev->mutex_lock);
        return ret;
    }

    l_exp_time = exp->reg_time[0];
    l_a_gain = exp->reg_gain[0];

    if (l_exp_time < OS04E10_EXP_MIN)
        l_exp_time = OS04E10_EXP_MIN;

    os04e10_dbg(dev, "total_time reg: 0x%x, total_gain reg 0x%x\n", l_exp_time, l_a_gain);

    ret = os04e10_write_reg(dev, OS04E10_REG_EXP_LONG_H,
                            (uint8_t)((l_exp_time >> 16) & 0xf));
    ret = os04e10_write_reg(dev, OS04E10_REG_EXP_LONG_M,
                            (uint8_t)((l_exp_time >> 8) & 0xff));
    ret = os04e10_write_reg(dev, OS04E10_REG_EXP_LONG_L,
                            (uint8_t)(l_exp_time & 0xff));
    os04e10_get_gain_reg(&a_gain, &d_gain, l_a_gain);

    os04e10_dbg(dev, "a_gain: 0x%x d_gain: 0x%x\n", a_gain, d_gain);

    ret = os04e10_write_reg(dev, OS04E10_REG_ANA_GAIN_H, (a_gain >> 8) & 0x1f);
    ret = os04e10_write_reg(dev, OS04E10_REG_ANA_GAIN_L, a_gain & 0xff);
    ret = os04e10_write_reg(dev, OS04E10_REG_DIG_GAIN_H, (d_gain >> 8) & 0x1f);
    ret = os04e10_write_reg(dev, OS04E10_REG_DIG_GAIN_L, d_gain & 0xff);

    rt_mutex_release(&dev->mutex_lock);

    return ret;
}

static ret_err_t rk_os04e10_set_vts(struct os04e10 *dev, uint32_t dst_vts)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    uint8_t val;

    os04e10_dbg(dev, "set vts: 0x%x \n", dst_vts);
    dev->dst_mode->vts_def = dst_vts;

    ret = os04e10_write_reg(dev, OS04E10_REG_VTS_L,
                            (uint8_t)(dst_vts & 0xff));
    ret = os04e10_write_reg(dev, OS04E10_REG_VTS_H,
                            (uint8_t)(dst_vts >> 8));

    return ret;
}

static ret_err_t rk_os04e10_set_flip_mirror(struct os04e10 *dev, uint32_t flip)
{
    ret_err_t ret = RET_SYS_ENOSYS;

    os04e10_dbg(dev, "flip 0x%x\n", flip);
    switch (flip)
    {
    case 0:
        ret = os04e10_write_reg(dev, 0x0100, 0x00);
        ret |= os04e10_write_reg(dev, 0x3716, 0x24);
        ret |= os04e10_write_reg(dev, 0x3820, 0x88);
        ret |= os04e10_write_reg(dev, 0x0100, 0x01);
        break;
    case 1:
        ret = os04e10_write_reg(dev, 0x0100, 0x00);
        ret |= os04e10_write_reg(dev, 0x3716, 0x24);
        ret |= os04e10_write_reg(dev, 0x3820, 0x80);
        ret |= os04e10_write_reg(dev, 0x0100, 0x01);
        break;
    case 2:
        ret = os04e10_write_reg(dev, 0x0100, 0x00);
        ret |= os04e10_write_reg(dev, 0x3716, 0x04);
        ret |= os04e10_write_reg(dev, 0x3820, 0xb8);
        ret |= os04e10_write_reg(dev, 0x0100, 0x01);
        break;
    case 3:
        ret = os04e10_write_reg(dev, 0x0100, 0x00);
        ret |= os04e10_write_reg(dev, 0x3716, 0x04);
        ret |= os04e10_write_reg(dev, 0x3820, 0xb0);
        ret |= os04e10_write_reg(dev, 0x0100, 0x01);
        break;
    default:
        ret = os04e10_write_reg(dev, 0x0100, 0x00);
        ret |= os04e10_write_reg(dev, 0x3716, 0x24);
        ret |= os04e10_write_reg(dev, 0x3820, 0x88);
        ret |= os04e10_write_reg(dev, 0x0100, 0x01);
        break;
    };

    return ret;
}

static void os04e10_stream_on(struct os04e10 *dev)
{
    os04e10_dbg(dev, "stream_on enter tick:%u\n", rt_tick_get());

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    os04e10_write_multiple_reg_continue(dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);

#ifndef RT_USING_CAM_STREAM_ON_LATE
    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_os04e10_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_os04e10_set_flip_mirror(dev, dev->flip);

    os04e10_write_reg(dev, OS04E10_REG_STREAM_CTRL, OS04E10_STREAM_ON);
    dev->streaming = true;
#endif

    rt_mutex_release(&dev->mutex_lock);
    os04e10_dbg(dev, "stream_on exit tick:%u\n", rt_tick_get());
}

static void os04e10_stream_on_late(struct os04e10 *dev)
{
    os04e10_dbg(dev, "stream_on_late enter tick:%u\n", rt_tick_get());

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_os04e10_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_os04e10_set_flip_mirror(dev, dev->flip);

    os04e10_write_reg(dev, OS04E10_REG_STREAM_CTRL, OS04E10_STREAM_ON);
    rt_mutex_release(&dev->mutex_lock);
    dev->streaming = true;
    os04e10_dbg(dev, "stream_on_late exit tick:%u\n", rt_tick_get());
}

static void os04e10_stream_off(struct os04e10 *dev)
{
    struct rt_i2c_bus_device *i2c_bus;

    i2c_bus = dev->i2c_bus;
    if (i2c_bus)
    {
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

        os04e10_write_reg(dev, OS04E10_REG_STREAM_CTRL, OS04E10_STREAM_OFF);

        rt_mutex_release(&dev->mutex_lock);
    }
    dev->streaming = false;
}

ret_err_t rk_os04e10_init(struct rk_camera_device *dev)
{
    ret_err_t ret = RT_EOK;
    struct os04e10 *os04e10;

    RT_ASSERT(dev != RT_NULL);
    os04e10 = (struct os04e10 *)dev;
    struct rk_camera_device *camera = (struct rk_camera_device *)&os04e10->parent;

    if (os04e10)
    {
        camera->info.mbus_fmt.width = os04e10->cur_mode->width;
        camera->info.mbus_fmt.height = os04e10->cur_mode->height;
        camera->info.mbus_fmt.pixelcode = MEDIA_BUS_FMT_SBGGR10_1X10;//0x0c uyvy;0x08 vyuy;0x04 yvyu;0x00 yuyv
        camera->info.mbus_fmt.field = 0;
        camera->info.mbus_fmt.colorspace = 0;
        camera->info.mbus_config.linked_freq = os04e10->cur_mode->link_freq;
        camera->info.mbus_config.mbus_type = CAMERA_MBUS_CSI2_DPHY;
        camera->info.mbus_config.flags = MEDIA_BUS_FLAGS_CSI2_LVDS_LANES_2 |
                                         MEDIA_BUS_FLAGS_CSI2_LVDS_CLOCK_MODE_CONTIN;
        camera->info.hdr_mode =  os04e10->cur_mode->hdr_mode;
    }
    else
    {
        ret = RET_SYS_ENOSYS;
    }

    return ret;
}

static ret_err_t rk_os04e10_open(struct rk_camera_device *dev, rt_uint16_t oflag)
{
    ret_err_t ret = RT_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

ret_err_t rk_os04e10_close(struct rk_camera_device *dev)
{
    uint8_t ret = RT_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

static ret_err_t rk_os04e10_get_expinf(struct os04e10 *dev, struct rk_camera_exp_info *exp)
{
    ret_err_t ret = RT_EOK;
    const struct os04e10_mode *mode;

    mode = dev->cur_mode;
    exp->width = mode->width;
    exp->height = mode->height;
    exp->hts = mode->hts_def;
    exp->vts = mode->vts_def;
    exp->pix_clk = (uint64_t)exp->hts * (uint64_t)exp->vts * (uint64_t)mode->max_fps.denominator /
                   (uint64_t)mode->max_fps.numerator;
    exp->time_valid_delay = dev->time_valid_delay;
    exp->gain_valid_delay = dev->gain_valid_delay;

    exp->dst_width = dev->dst_mode->width;
    exp->dst_height = dev->dst_mode->height;
    exp->dst_hts = dev->dst_mode->hts_def;
    exp->dst_vts = dev->dst_mode->vts_def;
    exp->dst_pix_clk = (uint64_t)exp->dst_hts * (uint64_t)exp->dst_vts *
                       (uint64_t)dev->dst_mode->max_fps.denominator /
                       (uint64_t)dev->dst_mode->max_fps.numerator;

    return ret;
}

static ret_err_t rk_os04e10_get_intput_fmt(struct os04e10 *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RT_EOK;
    const struct os04e10_mode *mode;

    mode = dev->cur_mode;
    mbus_fmt->width = mode->width;
    mbus_fmt->height = mode->height;
    mbus_fmt->field = 0;
    mbus_fmt->pixelcode = MEDIA_BUS_FMT_SBGGR10_1X10;

    return ret;
}

static ret_err_t rk_os04e10_set_intput_fmt(struct os04e10 *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RT_EOK;
    const struct os04e10_mode *mode;
    int i;
    bool is_find_fmt = false;

    os04e10_info(dev, "dst resulotion, width %d, height %d\n",
                 mbus_fmt->width, mbus_fmt->height);
    if (mbus_fmt->width == dev->dst_mode->width &&
            mbus_fmt->height == dev->dst_mode->height)
    {
        mode = dev->dst_mode;
        is_find_fmt = true;
    }
    else
    {
        for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
        {
            mode = &supported_modes[i];
            if (mbus_fmt->width == mode->width &&
                    mbus_fmt->height == mode->height)
            {
                is_find_fmt = true;
                break;
            }
        }
    }
    if (is_find_fmt)
    {
        if (mode->width != dev->cur_mode->width || !strcmp(dev->name, RK_ISP_ASSIST_SUBDEV_NAME))
        {
            dev->cur_mode = mode;
            os04e10_info(dev, "switch to dst fmt, dst_width %d, dst_height %d dst_fps %d, hdr: %d, dst_vts: 0x%x\n",
                         dev->cur_mode->width, dev->cur_mode->height,
                         dev->cur_mode->max_fps.denominator / dev->cur_mode->max_fps.numerator,
                         dev->cur_mode->hdr_mode, dev->cur_mode->vts_def
                        );
            rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

            os04e10_write_multiple_reg_continue(dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);

            ret = rk_os04e10_set_flip_mirror(dev, dev->flip);
            rt_mutex_release(&dev->mutex_lock);
        }
    }

    return ret;
}

static ret_err_t rk_os04e10_match_dst_config(struct os04e10 *dev, struct rk_camera_dst_config *dst_config)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    const struct os04e10_mode *mode;
    int i, cur_fps, dst_fps, cur_vts, dst_vts;

    dst_fps = dst_config->cam_fps_denominator / dst_config->cam_fps_numerator;
    dev->flip = dst_config->cam_mirror_flip;

    os04e10_info(dev, "cur resulotion, width %d, height %d, fps %d!\n",
                 dev->cur_mode->width, dev->cur_mode->height,
                 dev->cur_mode->max_fps.denominator / dev->cur_mode->max_fps.numerator);
    //match current resolution config
    for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
    {
        mode = &supported_modes[i];
        if (dst_config->width == mode->width &&
                dst_config->height == mode->height)
        {
            dev->dst_mode = (struct os04e10_mode *)mode;
            ret = RT_EOK;
            os04e10_info(dev, "find dst resulotion, width %d, height %d, fps %d!\n",
                         dst_config->width, dst_config->height, dst_fps);
            break;
        }
    }
    if (i == ARRAY_SIZE(supported_modes))
    {
        os04e10_err(dev, "not find match resulotion\n");
        return -RT_EINVAL;
    }

    cur_fps = dev->dst_mode->max_fps.denominator / dev->dst_mode->max_fps.numerator;
    cur_vts = dev->dst_mode->vts_def;

    //match fps config
    if (cur_fps == dst_fps)
        return RT_EOK;

    if (dst_fps > cur_fps)
    {
        os04e10_err(dev, "dst fps is larger than cur fps\n");
        return -RT_EINVAL;
    }

    dst_vts = cur_fps * cur_vts / dst_fps;

    dev->dst_mode->max_fps.denominator = dst_config->cam_fps_denominator;
    dev->dst_mode->max_fps.numerator = dst_config->cam_fps_numerator;
    dev->dst_mode->vts_def = dst_vts;

    return ret;
}

ret_err_t rk_os04e10_control(struct rk_camera_device *dev,
                             dt_cmd_t cmd,
                             void *args)
{
    ret_err_t ret = RT_EOK;
    struct os04e10 *os04e10;

    RT_ASSERT(dev != RT_NULL);
    os04e10 = (struct os04e10 *)dev;

    switch (cmd)
    {

    case RK_DEVICE_CTRL_DEVICE_INIT:
    {
        ret = rk_os04e10_init(dev);
    }
    break;

    case RK_DEVICE_CTRL_CAMERA_STREAM_ON:
    {
        os04e10_stream_on(os04e10);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_OFF:
    {
        os04e10_stream_off(os04e10);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_EXP_INF:
    {
        ret = rk_os04e10_get_expinf(os04e10, (struct rk_camera_exp_info *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL:
    {
        ret = rk_os04e10_set_expval(os04e10, (struct rk_camera_exp_val *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_VTS_VAL:
    {
        ret = rk_os04e10_set_vts(os04e10, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_FORMAT:
    {
        ret = rk_os04e10_get_intput_fmt(os04e10, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FORMAT:
    {
        ret = rk_os04e10_set_intput_fmt(os04e10, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CID_MATCH_CAM_CONFIG:
    {
        ret = rk_os04e10_match_dst_config(os04e10, (struct rk_camera_dst_config *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FLIPMIRROR:
    {
        ret = rk_os04e10_set_flip_mirror(os04e10, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_ON_LATE:
    {
        os04e10_stream_on_late(os04e10);
    }
    break;
    default:
        os04e10_dbg(os04e10, "exit CMD %d\n", cmd);
        break;
    }

    return ret;
}

struct rk_camera_ops rk_os04e10_ops =
{
    .init       = rk_os04e10_init,
    .open       = rk_os04e10_open,
    .control    = rk_os04e10_control,
};

int rk_camera_os04e10_init(void)
{
    ret_err_t ret = RT_EOK;
    const struct camera_board_desc *os04e10_desc;

    for (os04e10_desc = camera_os04e10; os04e10_desc->i2c_addr != 0; os04e10_desc++)
    {
        struct os04e10 *os04e10;
        struct rk_camera_device *camera;

        os04e10 = rt_malloc(sizeof(struct os04e10));
        if (!os04e10)
        {
            rt_kprintf("malloc os04e10 failed\n");
            return -RT_ENOMEM;
        }

        rt_memset(os04e10, 0x0, sizeof(struct os04e10));

        camera = &os04e10->parent;
        camera->ops = &rk_os04e10_ops;

        rt_memcpy(os04e10->name, os04e10_desc->isp_subdev_name, RK_CAMERA_DEVICE_NAME_SIZE);
        rt_memcpy(os04e10->i2c_name, os04e10_desc->i2c_bus, RK_CAMERA_I2C_NAME_SIZE);

        os04e10->i2c_bus = (struct rt_i2c_bus_device *)rt_device_find(os04e10->i2c_name);
        if (os04e10->i2c_bus == RT_NULL)
        {
            os04e10_err(os04e10, "can't find i2c bus:%s\n", os04e10->i2c_name);
            rt_free(os04e10);
            continue;
        }

        if (os04e10_desc->mode_id <= OS04E10_MODE_ID_MAX)
        {
            os04e10_dbg(os04e10, "mode_id: %d\n", os04e10_desc->mode_id);
            os04e10->cur_mode = &supported_modes[os04e10_desc->mode_id];
        }
        else
        {
            os04e10_info(os04e10, "mode id is over range, default use mode_id: 0\n");
            os04e10->cur_mode = &supported_modes[0];
        }

        os04e10->time_valid_delay = os04e10_desc->time_valid_delay;
        os04e10->gain_valid_delay = os04e10_desc->gain_valid_delay;
        os04e10->i2c_addr = os04e10_desc->i2c_addr;

        if (os04e10_desc->rst_gpio.gpio_group)
        {
            HAL_GPIO_SetPinDirection((struct GPIO_REG *)os04e10_desc->rst_gpio.gpio_group,
                                     os04e10_desc->rst_gpio.gpio_pin,
                                     GPIO_OUT);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)os04e10_desc->rst_gpio.gpio_group,
                                 os04e10_desc->rst_gpio.gpio_pin,
                                 !os04e10_desc->rst_active);
        }
        if (os04e10_desc->pwdn_gpio.gpio_group)
        {
            HAL_GPIO_SetPinDirection((struct GPIO_REG *)os04e10_desc->pwdn_gpio.gpio_group,
                                     os04e10_desc->pwdn_gpio.gpio_pin,
                                     GPIO_OUT);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)os04e10_desc->pwdn_gpio.gpio_group,
                                 os04e10_desc->pwdn_gpio.gpio_pin,
                                 !os04e10_desc->pwdn_active);
        }
        HAL_DelayMs(5);
        if (os04e10_desc->mclk_id)
        {
            clk_set_rate(os04e10_desc->mclk_id, os04e10->cur_mode->xvclk);
        }

        rt_mutex_init(&os04e10->mutex_lock, "os04e10_mutex", RT_IPC_FLAG_FIFO);
        RT_ASSERT(rt_object_get_type(&os04e10->mutex_lock.parent.parent) == RT_Object_Class_Mutex);
        camera->i2c_bus = os04e10->i2c_bus;
        rt_memcpy(camera->name, os04e10->name, RK_CAMERA_DEVICE_NAME_SIZE);
        ret = rk_camera_register(camera, camera->name, os04e10);
        if (ret)
        {
            os04e10_err(os04e10, "regster failed\n");
            rt_free(os04e10);
        }
    }

    return ret;
}

#if defined(__RT_THREAD__)
INIT_DEVICE_EXPORT(rk_camera_os04e10_init);
#endif
#endif
