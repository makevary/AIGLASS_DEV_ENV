/**
  * Copyright (c) 2024 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @file    drv_ps5458.c
  * @version V0.0.1
  *
  * Change Logs:
  * 2024-07-08     Su Yuefu      first implementation
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

#ifdef RT_USING_PS5458

RT_WEAK const struct camera_board_desc camera_ps5458[] = {0};

#define PS5458_DEBUG_PRT      0

#define ps5458_info(dev, fmt, ...)          rt_kprintf("ps5458-%s "fmt"", dev->name, ##__VA_ARGS__)
#define ps5458_err(dev, fmt, ...)           rt_kprintf("ps5458-%s error "fmt"", dev->name, ##__VA_ARGS__)
#if PS5458_DEBUG_PRT
#include <stdio.h>
#define ps5458_dbg(dev, fmt, ...)           rt_kprintf("ps5458-%s "fmt"", dev->name, ##__VA_ARGS__)
#else
#define ps5458_dbg(dev, fmt, ...)
#endif

#define PS5458_DEFAULT_I2C_ADDR                 0x4c

#define PS5458_REG_EXP_LONG_H                   0x014F //[15:8]
#define PS5458_REG_EXP_LONG_L                   0x014E //[7:0]
#define PS5458_REG_GAIN_IDX_L                   0x0150 //[7:0]
#define PS5458_REG_GAIN_IDX_H                   0x0151 //[9:8] -> bit[0:1]
#define PS5458_EXP_MIN                          3
#define PS5458_GAIN_MIN                         0x0026
#define PS5458_GAIN_MAX                         (512)
#define PS5458_GAIN_STEP                        1
#define PS5458_GAIN_DEFAULT                     0x0026
#define PS5458_LGAIN                            0
#define PS5458_SGAIN                            1
#define PS5458_REG_EXPOSURE_UPDATE              0x0156 //[1:0] -> bit[0:1]
#define PS5458_EXPOSURE_UPDATE                  0x03
#define PS5458_GLOBE_UPDATE_REG                 0x00BE
#define PS5458_FLIP_MIRROR_REG                  0x01CE
#define PS5458_REG_VTS_H                        0x011f //[15:8]
#define PS5458_REG_VTS_L                        0x011e //[7:0]
#define PS5458_FETCH_MIRROR(VAL, ENABLE)        (ENABLE ? VAL | 0x04 : VAL & 0xfb)
#define PS5458_FETCH_FLIP(VAL, ENABLE)          (ENABLE ? VAL | 0x08 : VAL & 0xf7)

#define PS5458_FETCH_EXP_H(VAL)                 (((VAL) >> 8) & 0xFF)
#define PS5458_FETCH_EXP_L(VAL)                 ((VAL) & 0xFF)

#define PS5458_REG_TEST_PATTERN                 0x040a
#define PS5458_TEST_PATTERN_BIT_MASK            BIT(3)

#define PS5458_REG_STREAM_CTRL                  0x0008
#define PS5458_STREAM_ON                        0x83
#define PS5458_STREAM_OFF                       0x81

#define REG_END                                 (0x0)
#define REG_DELAY                               (0xff)

#define ARRAY_SIZE(x)                           (sizeof(x) / sizeof((x)[0]))

struct ps5458_sensor_reg
{
    uint16_t reg_addr;
    uint8_t val;
} __attribute__((__packed__));

struct ps5458_mode
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
struct ps5458
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
    const struct ps5458_mode *cur_mode;
    struct ps5458_mode *dst_mode;

    bool has_init_exp;
    bool streaming;
};
#pragma pack()

struct ps5458_ops
{
    ret_err_t (*init)(struct ps5458 *dev);
    ret_err_t (*open)(struct ps5458 *dev, uint16_t oflag);
    ret_err_t (*close)(struct ps5458 *dev);
    ret_err_t (*control)(struct ps5458 *dev, dt_cmd_t cmd, void *arg);
};

/*
 * Xclk 24Mhz //not need extern support
 * max_framerate 120fps
 * mipi_datarate per lane 840Mbps, 2lane
 * only skip2 to 1344x760
 */
static const uint8_t ps5458_1344x760_120fps_regs[] =
{
    0x3, 0x00, 0xff, 0xa5,
    0x3, 0x00, 0xa9, 0x00,
    0x3, 0x00, 0xa8, 0x02,
    0x3, 0x00, 0x08, 0x81,
    0x3, 0x00, 0xee, 0x5e,
    0x3, 0x23, 0x8f, 0x01,
    0x3, 0x07, 0xd8, 0x17,
    0x3, 0x07, 0xd4, 0x22,
    0x3, 0x22, 0x28, 0x01,
    0x3, 0x07, 0x09, 0x6e,
    0x3, 0x07, 0x9a, 0xf5,
    0x4, 0x07, 0x9c, 0x13, 0x08,
    0x3, 0x02, 0x20, 0x2f,
    0x3, 0x02, 0x22, 0x12,
    0x3, 0x02, 0x24, 0x1d,
    0x3, 0x02, 0x26, 0x24,
    0x3, 0x02, 0x28, 0x2f,
    0x3, 0x02, 0x2a, 0x10,
    0x3, 0x02, 0x2c, 0x1b,
    0x3, 0x02, 0x30, 0x6f,
    0x3, 0x02, 0x34, 0x23,
    0x4, 0x02, 0xce, 0x40, 0x40,
    0x3, 0x02, 0xef, 0x1c,
    0x3, 0x02, 0xf1, 0x30,
    0x4, 0x07, 0x36, 0x0a, 0x0b,
    0x4, 0x07, 0x3c, 0x0a, 0x0b,
    0x3, 0x07, 0x52, 0x1e,
    0x3, 0x07, 0x5c, 0x1e,
    0x3, 0x07, 0x62, 0x9b,
    0x3, 0x07, 0x70, 0xa5,
    0x3, 0x07, 0x78, 0xa0,
    0x4, 0x07, 0x7e, 0xb1, 0x00,
    0x3, 0x07, 0x84, 0xa7,
    0x4, 0x07, 0xb5, 0xb9, 0x00,
    0x3, 0x07, 0xbd, 0xaf,
    0x4, 0x08, 0x05, 0xeb, 0x00,
    0x3, 0x08, 0x0b, 0x31,
    0x4, 0x08, 0x1b, 0x30, 0x1f,
    0x4, 0x08, 0x2f, 0x30, 0x1f,
    0x7, 0x08, 0x6f, 0xc3, 0x00, 0xbe, 0x00, 0x9b,
    0x5, 0x08, 0x75, 0xaf, 0x00, 0xb9,
    0x3, 0x08, 0x79, 0xb4,
    0x3, 0x08, 0x7b, 0xa5,
    0x3, 0x08, 0x96, 0x1b,
    0x3, 0x08, 0x98, 0x1a,
    0x3, 0x08, 0x9a, 0x10,
    0x3, 0x08, 0x9c, 0x13,
    0x3, 0x01, 0x07, 0x1e,
    0x3, 0x00, 0x0c, 0x02,
    0x3, 0x22, 0x56, 0x70,
    0x6, 0x07, 0x23, 0x78, 0x00, 0xf0, 0x00,
    0x4, 0x07, 0x34, 0x04, 0x05,
    0x4, 0x07, 0x3a, 0x04, 0x05,
    0x3, 0x07, 0x50, 0x6e,
    0x3, 0x07, 0x5a, 0x6e,
    0x3, 0x07, 0x60, 0xa0,
    0x3, 0x07, 0x6e, 0xaf,
    0x3, 0x07, 0x76, 0xaa,
    0x4, 0x07, 0x7c, 0xc3, 0x00,
    0x3, 0x07, 0x82, 0x5f,
    0x3, 0x07, 0xb3, 0x22,
    0x4, 0x07, 0xbb, 0xbe, 0x00,
    0x3, 0x08, 0x03, 0x8b,
    0x3, 0x08, 0x09, 0x53,
    0x3, 0x08, 0x61, 0x2c,
    0x3, 0x08, 0x63, 0x27,
    0x3, 0x08, 0x65, 0xa0,
    0x3, 0x08, 0x67, 0xbe,
    0x7, 0x08, 0x69, 0xc8, 0x00, 0xc3, 0x00, 0x5a,
    0x4, 0x08, 0x19, 0x33, 0x01,
    0x4, 0x08, 0x2d, 0x31, 0x01,
    0x3, 0x05, 0x52, 0x01,
    0x3, 0x05, 0x6e, 0xfe,
    0x4, 0x07, 0x32, 0x09, 0x0a,
    0x4, 0x07, 0x38, 0x09, 0x0a,
    0x3, 0x07, 0x4e, 0x6e,
    0x3, 0x07, 0x58, 0x6e,
    0x3, 0x07, 0x5e, 0xf4,
    0x4, 0x07, 0x6c, 0x30, 0x02,
    0x4, 0x07, 0x74, 0x26, 0x02,
    0x4, 0x07, 0x7a, 0x49, 0x02,
    0x3, 0x07, 0x80, 0xaf,
    0x3, 0x07, 0xb1, 0xb2,
    0x3, 0x07, 0xb9, 0x18,
    0x4, 0x08, 0x01, 0x7f, 0x03,
    0x3, 0x08, 0x07, 0x47,
    0x4, 0x08, 0x11, 0x7a, 0x03,
    0x4, 0x08, 0x17, 0xaa, 0x02,
    0x4, 0x08, 0x25, 0x7a, 0x03,
    0x4, 0x08, 0x2b, 0xa8, 0x02,
    0x3, 0x08, 0x53, 0xbc,
    0x3, 0x08, 0x55, 0xb7,
    0x3, 0x08, 0x57, 0xf4,
    0x5, 0x08, 0x59, 0x44, 0x02, 0x22,
    0x3, 0x08, 0x5d, 0x1d,
    0x3, 0x08, 0x5f, 0xaa,
    0x6, 0x00, 0x7b, 0xc0, 0xc0, 0xc0, 0xc0,
    0x3, 0x00, 0xaf, 0x01,
    0x4, 0x05, 0x09, 0x28, 0x16,
    0x4, 0x05, 0x10, 0x02, 0x00,
    0x3, 0x05, 0x15, 0x08,
    0x4, 0x05, 0x17, 0x06, 0x06,
    0x3, 0x05, 0x5b, 0x11,
    0x3, 0x05, 0xb0, 0x05,
    0x3, 0x05, 0x41, 0x20,
    0x3, 0x05, 0xeb, 0x80,
    0x3, 0x06, 0xb6, 0x00,
    0x3, 0x06, 0x20, 0x00,
    0x3, 0x06, 0x22, 0x08,
    0x6, 0x06, 0x17, 0x98, 0x08, 0xfc, 0x08,
    0x6, 0x06, 0x2e, 0x98, 0x08, 0xfc, 0x08,
    0x3, 0x01, 0xbf, 0x02,
    0x3, 0x01, 0xc4, 0x03,
    0x3, 0x02, 0x66, 0x11,
    0x3, 0x02, 0xd8, 0x08,
    0x3, 0x02, 0xe7, 0x83,
    0x3, 0x02, 0xda, 0x73,
    0x4, 0x06, 0x00, 0xb3, 0x06,
    0x5, 0x23, 0x4a, 0x01, 0x40, 0x2e,
    0x3, 0x23, 0x43, 0x02,
    0x3, 0x23, 0x40, 0x01,
    0x4, 0x07, 0xd9, 0x20, 0x01,
    0x3, 0x07, 0x31, 0x00,
    0x3, 0x07, 0x06, 0x15,
    0x3, 0x08, 0x0d, 0x08,
    0x4, 0x08, 0x21, 0xff, 0x03,
    0x4, 0x08, 0x35, 0xff, 0x03,
    0x3, 0x08, 0x8d, 0x00,
    0x3, 0x22, 0x47, 0xb6,
    0x3, 0x07, 0x0a, 0x92,
    0x3, 0x07, 0x08, 0x34,
    0x3, 0x05, 0x43, 0x02,
    0x3, 0x05, 0x0f, 0x01,
    0x3, 0x01, 0xe6, 0x01,
    0x6, 0x01, 0xc6, 0xa4, 0x02, 0x00, 0x03,
    0x7, 0x01, 0xcf, 0x40, 0x05, 0xf8, 0x02, 0x02,
    0x3, 0x01, 0xd5, 0x02,
    0x4, 0x01, 0xd7, 0x00, 0x00,
    0x3, 0x00, 0x64, 0x01,
    0x3, 0x01, 0x23, 0x01,
    0x4, 0x01, 0xe7, 0x07, 0x00,
    0x3, 0x22, 0x24, 0x01,
    0x3, 0x22, 0x29, 0x02,
    0x3, 0x22, 0x26, 0x00,
    0x3, 0x22, 0x2a, 0x01,
    0x3, 0x01, 0x0b, 0x64,
    0x3, 0x01, 0x06, 0x0a,
    /* blc offset 7line */
    0x3, 0x06, 0x54, 0x05,
    0x3, 0x06, 0x63, 0x40,
    0x3, 0x06, 0x65, 0x40,
    0x3, 0x06, 0x67, 0x40,
    0x3, 0x06, 0x69, 0x40,
    0x3, 0x06, 0x6b, 0x40,
    0x3, 0x06, 0x6d, 0x40,
    /* blc offset 7line */
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x23, 0x40, 0x00,
    0x5, 0x23, 0x4d, 0x04, 0x80, 0x2d,
    0x3, 0x23, 0x43, 0x03,
    0x3, 0x23, 0x40, 0x01,
    0x4, 0x07, 0xd9, 0x27, 0x19,
    0x3, 0x07, 0x31, 0x00,
    0x3, 0x07, 0x06, 0x09,
    0x3, 0x08, 0x0d, 0xb0,
    0x4, 0x08, 0x21, 0xac, 0x00,
    0x4, 0x08, 0x35, 0xa8, 0x00,
    0x3, 0x08, 0x8d, 0x01,
    0x3, 0x22, 0x47, 0xd0,
    0x3, 0x07, 0x0a, 0xb1,
    0x3, 0x07, 0x08, 0x30,
    0x3, 0x01, 0xe6, 0x10,
    0x6, 0x01, 0xc6, 0x52, 0x01, 0x70, 0x01,
    0x7, 0x01, 0xcf, 0x88, 0x02, 0x70, 0x01, 0x08,
    0x3, 0x01, 0xd5, 0x00,
    0x4, 0x01, 0xd7, 0x03, 0x00,
    0x3, 0x00, 0x64, 0x03,
    0x3, 0x01, 0x23, 0x02,
    0x4, 0x01, 0xe7, 0x0c, 0x01,
    0x3, 0x22, 0x24, 0x04,
    0x3, 0x22, 0x29, 0x00,
    0x3, 0x22, 0x26, 0x01,
    0x3, 0x22, 0x2a, 0x01,
    0x3, 0x04, 0x94, 0x00,
    0x3, 0x01, 0x0b, 0x60,
    0x3, 0x01, 0x56, 0x03,
    0x3, 0x06, 0x54, 0x05,
    0x3, 0x06, 0x63, 0x00,
    0x3, 0x06, 0x65, 0x00,
    0x3, 0x06, 0x67, 0x00,
    0x3, 0x06, 0x69, 0x00,
    0x3, 0x06, 0x6b, 0x00,
    0x3, 0x06, 0x6d, 0x00,
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x23, 0x40, 0x00,
    0x5, 0x23, 0x52, 0x01, 0x01, 0x01,
    0x3, 0x23, 0x42, 0x01,
    0x3, 0x05, 0x06, 0x04,
    0x4, 0x01, 0x1e, 0x20, 0x03,
    0x4, 0x01, 0x4e, 0x03, 0x00,
    0x3, 0x01, 0x56, 0x03,
    0x3, 0x0a, 0x06, 0x28,
    0x3, 0x0a, 0x0d, 0x04,
    0x3, 0x0a, 0x10, 0x08,
    0x3, 0x0a, 0x12, 0x50,
    0x3, 0x0a, 0x23, 0x57,
    0x3, 0x0a, 0x03, 0x03,
    0x3, 0x0f, 0x05, 0x28,
    0x7, 0x0f, 0x0c, 0x00, 0x19, 0x08, 0x70, 0x04,
    0x4, 0x0f, 0x12, 0x1e, 0x03,
    0x3, 0x0f, 0x1a, 0x00,
    0x3, 0x04, 0x6e, 0x96,
    0x3, 0x01, 0xce, 0x08,
    0x3, 0x00, 0xeb, 0x01,
    0x4, 0x05, 0xb7, 0xd0, 0x3a,
    0x3, 0x00, 0x14, 0x00,
    0x3, 0x23, 0x43, 0x02,
    0x3, 0x23, 0x4b, 0x62,
    0x3, 0x23, 0x40, 0x01,
    0x3, 0x22, 0x26, 0x01,
    0x3, 0x22, 0x2a, 0x01,
    0x3, 0x23, 0x40, 0x00,
    0x3, 0x23, 0x4b, 0x40,
    0x3, 0x23, 0x43, 0x02,
    0x3, 0x23, 0x41, 0x00,
    0x3, 0x23, 0x41, 0x01,
    0xe0,
};

/*
 * Xclk 24Mhz
 * max_framerate 30fps
 * mipi_datarate per lane 840Mbps, 2lane
 * resulution 2688x1520
 */
static const uint8_t ps5458_2688x1520_30fps_regs[] =
{
    0x3, 0x00, 0xff, 0xa5,
    0x3, 0x00, 0xa9, 0x00,
    0x3, 0x00, 0xa8, 0x02,
    0x3, 0x23, 0x8f, 0x01,
    0x3, 0x07, 0xd8, 0x17,
    0x3, 0x07, 0xd4, 0x22,
    0x3, 0x22, 0x28, 0x01,
    0x3, 0x07, 0x09, 0x6e,
    0x3, 0x07, 0x9a, 0xf5,
    0x4, 0x07, 0x9c, 0x13, 0x08,
    0x3, 0x02, 0x20, 0x2f,
    0x3, 0x02, 0x22, 0x12,
    0x3, 0x02, 0x24, 0x1d,
    0x3, 0x02, 0x26, 0x24,
    0x3, 0x02, 0x28, 0x2f,
    0x3, 0x02, 0x2a, 0x10,
    0x3, 0x02, 0x2c, 0x1b,
    0x3, 0x02, 0x30, 0x6f,
    0x3, 0x02, 0x34, 0x23,
    0x4, 0x02, 0xce, 0x40, 0x40,
    0x3, 0x02, 0xef, 0x1c,
    0x3, 0x02, 0xf1, 0x30,
    0x4, 0x07, 0x36, 0x0a, 0x0b,
    0x4, 0x07, 0x3c, 0x0a, 0x0b,
    0x3, 0x07, 0x52, 0x1e,
    0x3, 0x07, 0x5c, 0x1e,
    0x3, 0x07, 0x62, 0x9b,
    0x3, 0x07, 0x70, 0xa5,
    0x3, 0x07, 0x78, 0xa0,
    0x4, 0x07, 0x7e, 0xb1, 0x00,
    0x3, 0x07, 0x84, 0xa7,
    0x4, 0x07, 0xb5, 0xb9, 0x00,
    0x3, 0x07, 0xbd, 0xaf,
    0x4, 0x08, 0x05, 0xeb, 0x00,
    0x3, 0x08, 0x0b, 0x31,
    0x4, 0x08, 0x1b, 0x30, 0x1f,
    0x4, 0x08, 0x2f, 0x30, 0x1f,
    0x7, 0x08, 0x6f, 0xc3, 0x00, 0xbe, 0x00, 0x9b,
    0x5, 0x08, 0x75, 0xaf, 0x00, 0xb9,
    0x3, 0x08, 0x79, 0xb4,
    0x3, 0x08, 0x7b, 0xa5,
    0x3, 0x01, 0x07, 0x1e,
    0x3, 0x00, 0x0c, 0x02,
    0x3, 0x22, 0x56, 0x70,
    0x6, 0x07, 0x23, 0x78, 0x00, 0xf0, 0x00,
    0x4, 0x07, 0x34, 0x04, 0x05,
    0x4, 0x07, 0x3a, 0x04, 0x05,
    0x3, 0x07, 0x50, 0x6e,
    0x3, 0x07, 0x5a, 0x6e,
    0x3, 0x07, 0x60, 0xa0,
    0x3, 0x07, 0x6e, 0xaf,
    0x3, 0x07, 0x76, 0xaa,
    0x4, 0x07, 0x7c, 0xc3, 0x00,
    0x3, 0x07, 0x82, 0x5f,
    0x3, 0x07, 0xb3, 0x22,
    0x4, 0x07, 0xbb, 0xbe, 0x00,
    0x3, 0x08, 0x03, 0x8b,
    0x3, 0x08, 0x09, 0x53,
    0x3, 0x08, 0x61, 0x2c,
    0x3, 0x08, 0x63, 0x27,
    0x3, 0x08, 0x65, 0xa0,
    0x3, 0x08, 0x67, 0xbe,
    0x7, 0x08, 0x69, 0xc8, 0x00, 0xc3, 0x00, 0x5a,
    0x4, 0x08, 0x19, 0x33, 0x01,
    0x4, 0x08, 0x2d, 0x31, 0x01,
    0x3, 0x05, 0x52, 0x01,
    0x3, 0x05, 0x6e, 0xfe,
    0x4, 0x07, 0x32, 0x09, 0x0a,
    0x4, 0x07, 0x38, 0x09, 0x0a,
    0x3, 0x07, 0x4e, 0x6e,
    0x3, 0x07, 0x58, 0x6e,
    0x3, 0x07, 0x5e, 0xf4,
    0x4, 0x07, 0x6c, 0x30, 0x02,
    0x4, 0x07, 0x74, 0x26, 0x02,
    0x4, 0x07, 0x7a, 0x49, 0x02,
    0x3, 0x07, 0x80, 0xaf,
    0x3, 0x07, 0xb1, 0xb2,
    0x3, 0x07, 0xb9, 0x18,
    0x4, 0x08, 0x01, 0x7f, 0x03,
    0x3, 0x08, 0x07, 0x47,
    0x4, 0x08, 0x11, 0x7a, 0x03,
    0x4, 0x08, 0x17, 0xaa, 0x02,
    0x4, 0x08, 0x25, 0x7a, 0x03,
    0x4, 0x08, 0x2b, 0xa8, 0x02,
    0x3, 0x08, 0x53, 0xbc,
    0x3, 0x08, 0x55, 0xb7,
    0x3, 0x08, 0x57, 0xf4,
    0x5, 0x08, 0x59, 0x44, 0x02, 0x22,
    0x3, 0x08, 0x5d, 0x1d,
    0x3, 0x08, 0x5f, 0xaa,
    0x6, 0x00, 0x7b, 0xc0, 0xc0, 0xc0, 0xc0,
    0x3, 0x00, 0xaf, 0x01,
    0x4, 0x05, 0x09, 0x28, 0x16,
    0x4, 0x05, 0x10, 0x02, 0x00,
    0x3, 0x05, 0x15, 0x08,
    0x4, 0x05, 0x17, 0x06, 0x06,
    0x3, 0x05, 0x5b, 0x11,
    0x3, 0x05, 0xb0, 0x05,
    0x3, 0x05, 0x41, 0x20,
    0x3, 0x05, 0xeb, 0x80,
    0x3, 0x06, 0xb6, 0x00,
    0x3, 0x06, 0x20, 0x00,
    0x3, 0x06, 0x22, 0x08,
    0x6, 0x06, 0x17, 0x98, 0x08, 0xfc, 0x08,
    0x6, 0x06, 0x2e, 0x98, 0x08, 0xfc, 0x08,
    0x3, 0x01, 0xbf, 0x02,
    0x3, 0x01, 0xc4, 0x03,
    0x3, 0x02, 0x66, 0x11,
    0x3, 0x02, 0xd8, 0x08,
    0x3, 0x02, 0xe7, 0x83,
    0x3, 0x02, 0xda, 0x73,
    0x4, 0x06, 0x00, 0xb3, 0x06,
    0x5, 0x23, 0x4a, 0x01, 0x40, 0x2f,
    0x3, 0x23, 0x43, 0x02,
    0x3, 0x23, 0x40, 0x01,
    0x4, 0x07, 0xd9, 0x20, 0x15,
    0x3, 0x07, 0x31, 0x02,
    0x3, 0x07, 0x06, 0x15,
    0x3, 0x08, 0x0d, 0x08,
    0x4, 0x08, 0x21, 0xff, 0x03,
    0x4, 0x08, 0x35, 0xff, 0x03,
    0x3, 0x22, 0x47, 0xb6,
    0x3, 0x07, 0x0a, 0x92,
    0x3, 0x07, 0x08, 0x30,
    0x3, 0x05, 0x43, 0x02,
    0x3, 0x05, 0x0f, 0x01,
    0x3, 0x01, 0xe6, 0x00,
    0x6, 0x01, 0xc6, 0xa4, 0x02, 0x00, 0x06,
    0x7, 0x01, 0xcf, 0x80, 0x0a, 0xf0, 0x05, 0x04,
    0x3, 0x01, 0xd5, 0x08,
    0x4, 0x01, 0xd7, 0x00, 0x00,
    0x3, 0x00, 0x64, 0x01,
    0x3, 0x01, 0x23, 0x00,
    0x4, 0x01, 0xe7, 0x07, 0x00,
    0x3, 0x22, 0x24, 0x01,
    0x3, 0x22, 0x29, 0x02,
    0x3, 0x22, 0x26, 0x00,
    0x3, 0x22, 0x2a, 0x01,
    0x3, 0x01, 0x0b, 0x64,
    0x3, 0x00, 0x5f, 0x00,
    0x4, 0x01, 0x1e, 0x40, 0x06,
    /* blc offset 7line */
    // 0x3, 0x06, 0x54, 0x05,
    // 0x3, 0x06, 0x63, 0x40,
    // 0x3, 0x06, 0x65, 0x40,
    // 0x3, 0x06, 0x67, 0x40,
    // 0x3, 0x06, 0x69, 0x40,
    // 0x3, 0x06, 0x6b, 0x40,
    // 0x3, 0x06, 0x6d, 0x40,
    /* blc offset 7line */
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x23, 0x40, 0x00,
    0x5, 0x23, 0x4d, 0x04, 0x80, 0x2e,
    0x3, 0x23, 0x43, 0x03,
    0x3, 0x23, 0x40, 0x01,
    0x4, 0x07, 0xd9, 0x27, 0x19,
    0x3, 0x07, 0x31, 0x00,
    0x3, 0x07, 0x06, 0x09,
    0x3, 0x08, 0x0d, 0xb0,
    0x4, 0x08, 0x21, 0xac, 0x00,
    0x4, 0x08, 0x35, 0xa8, 0x00,
    0x3, 0x22, 0x47, 0xd0,
    0x3, 0x07, 0x0a, 0xb1,
    0x3, 0x07, 0x08, 0x30,
    0x3, 0x01, 0xe6, 0x10,
    0x6, 0x01, 0xc6, 0x52, 0x01, 0x70, 0x01,
    0x7, 0x01, 0xcf, 0x88, 0x02, 0x70, 0x01, 0x08,
    0x3, 0x01, 0xd5, 0x00,
    0x4, 0x01, 0xd7, 0x03, 0x00,
    0x3, 0x00, 0x64, 0x03,
    0x3, 0x01, 0x23, 0x02,
    0x4, 0x01, 0xe7, 0x0c, 0x01,
    0x3, 0x22, 0x24, 0x04,
    0x3, 0x22, 0x29, 0x00,
    0x3, 0x22, 0x26, 0x00,
    0x3, 0x22, 0x2a, 0x01,
    0x3, 0x04, 0x94, 0x00,
    0x3, 0x01, 0x0b, 0x60,
    0x3, 0x00, 0x5f, 0x00,
    0x4, 0x01, 0x1e, 0x0c, 0x1a,
    0x3, 0x06, 0x54, 0x05,
    0x3, 0x06, 0x63, 0x00,
    0x3, 0x06, 0x65, 0x00,
    0x3, 0x06, 0x67, 0x00,
    0x3, 0x06, 0x69, 0x00,
    0x3, 0x06, 0x6b, 0x00,
    0x3, 0x06, 0x6d, 0x00,
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x23, 0x40, 0x00,
    0x5, 0x23, 0x52, 0x01, 0x01, 0x01,
    0x3, 0x23, 0x42, 0x01,
    0x3, 0x05, 0x06, 0x04,
    0x4, 0x00, 0x2e, 0x00, 0x00,
    0x6, 0x01, 0x49, 0x81, 0x06, 0x26, 0x00,
    0x6, 0x01, 0x4e, 0x3e, 0x06, 0x40, 0x00,
    0x3, 0x01, 0x56, 0x03,
    0x3, 0x01, 0xce, 0x00,
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x00, 0x0c, 0x0c,
    0x3, 0x00, 0x35, 0x02,
    0x4, 0x04, 0xa0, 0x01, 0x00,
    0x3, 0x00, 0xeb, 0x01,
    0x3, 0x23, 0x43, 0x02,
    0x3, 0x23, 0x41, 0x00,
    0x3, 0x23, 0x41, 0x01,
    0x4, 0x05, 0xb7, 0xd0, 0x2a,
    0xc5,
};

static const struct ps5458_mode supported_modes[] =
{
    [PS5458_1344X760] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 1344,
        .height = 760,
        .max_fps = {
            .numerator = 10000,
            .denominator = 1200000,
        },
        .exp_def = 0x46,
        .hts_def = 0x5dc * 2,
        .vts_def = 0x0320,
        .xvclk = 24000000,
        .link_freq = 420000000,
        .reg_list = ps5458_1344x760_120fps_regs,
        .reg_list_size = ARRAY_SIZE(ps5458_1344x760_120fps_regs),
        .hdr_mode = NO_HDR,
    },
    [PS5458_2688X1520] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 2688,
        .height = 1520,
        .max_fps = {
            .numerator = 10000,
            .denominator = 300000,
        },
        .exp_def = 0x46,
        .hts_def = 0x5dc * 2,
        .vts_def = 0x0640,
        .xvclk = 24000000,
        .link_freq = 420000000,
        .reg_list = ps5458_2688x1520_30fps_regs,
        .reg_list_size = ARRAY_SIZE(ps5458_2688x1520_30fps_regs),
        .hdr_mode = NO_HDR,
    }
};

static ret_err_t ps5458_read_reg(struct ps5458 *dev, uint16_t reg, uint8_t *data)
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
            ps5458_err(dev, "read reg, retry=%d, reg [0x%x]\n", retry, reg);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}

static ret_err_t ps5458_write_reg(struct ps5458 *dev, uint16_t reg, uint8_t data)
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
            ps5458_err(dev, "write reg, retry:%d, reg [0x%x]-->0x%x\n", retry, reg, data);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}

static int ps5458_write_multiple_reg_continue(struct ps5458 *dev, const uint8_t *i2c_data, int len)
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
            ps5458_err(dev, "write multi-regs, retry=%d, addr=0x%02x%02x\n",
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

static ret_err_t rk_ps5458_set_expval(struct ps5458 *dev, struct rk_camera_exp_val *exp)
{
    ret_err_t ret = RT_EOK;
    uint32_t l_exp_time;
    uint32_t l_a_gain;
    uint16_t gain_idx_reg;
    uint8_t a_gain, d_gain, d_gain_fine;
    struct camera_board_desc *ps5458 = (struct camera_board_desc *)camera_ps5458;

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (!dev->has_init_exp && !dev->streaming && strcmp(ps5458->isp_subdev_name, RK_ISP_ASSIST_SUBDEV_NAME))
    {
        dev->init_exp = *exp;
        dev->has_init_exp = true;
        ps5458_dbg(dev, "don't stream, record exp\n");

        rt_mutex_release(&dev->mutex_lock);
        return ret;
    }

    l_exp_time = exp->reg_time[0];
    l_a_gain = exp->reg_gain[0];

    if (l_exp_time < PS5458_EXP_MIN)
        l_exp_time = PS5458_EXP_MIN;
    if (l_a_gain < PS5458_GAIN_MIN)
        l_a_gain = PS5458_GAIN_MIN;

    ps5458_dbg(dev, "total_time reg: 0x%x, total_gain reg 0x%x\n", l_exp_time, l_a_gain);

    gain_idx_reg = l_a_gain;
    ret = ps5458_write_reg(dev, PS5458_REG_EXP_LONG_H,
                           (uint8_t)PS5458_FETCH_EXP_H(l_exp_time));
    ret = ps5458_write_reg(dev, PS5458_REG_EXP_LONG_L,
                           (uint8_t)PS5458_FETCH_EXP_L(l_exp_time));
    ret = ps5458_write_reg(dev, PS5458_REG_EXPOSURE_UPDATE, PS5458_EXPOSURE_UPDATE);
    ps5458_dbg(dev, "gain_idx_reg %d\n", gain_idx_reg);
    ret = ps5458_write_reg(dev, PS5458_REG_GAIN_IDX_L, gain_idx_reg & 0xff);
    ret = ps5458_write_reg(dev, PS5458_REG_GAIN_IDX_H, (gain_idx_reg >> 8) & 0x03);
    ret = ps5458_write_reg(dev, PS5458_REG_EXPOSURE_UPDATE, PS5458_EXPOSURE_UPDATE);

    uint8_t exp_time_l = 0, exp_time_h = 0, gain_l = 0, gain_h = 0;
    ret = ps5458_read_reg(dev, PS5458_REG_EXP_LONG_H, &exp_time_h);
    ret = ps5458_read_reg(dev, PS5458_REG_EXP_LONG_L, &exp_time_l);
    ret = ps5458_read_reg(dev, PS5458_REG_GAIN_IDX_H, &gain_h);
    ret = ps5458_read_reg(dev, PS5458_REG_GAIN_IDX_L, &gain_l);
    printf("read time %02x%02x, gain %02x%02x\n", exp_time_h, exp_time_l, gain_h, gain_l);

    rt_mutex_release(&dev->mutex_lock);

    return ret;
}

static ret_err_t rk_ps5458_set_vts(struct ps5458 *dev, uint32_t dst_vts)
{
    ret_err_t ret = RET_SYS_ENOSYS;

    ps5458_dbg(dev, "set vts: 0x%x \n", dst_vts);
    dev->dst_mode->vts_def = dst_vts;

    ret = ps5458_write_reg(dev, PS5458_REG_VTS_L,
                           (uint8_t)(dst_vts & 0xff));
    ret = ps5458_write_reg(dev, PS5458_REG_VTS_H,
                           (uint8_t)(dst_vts >> 8));

    return ret;
}

static ret_err_t rk_ps5458_set_flip_mirror(struct ps5458 *dev, uint32_t flip)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    uint8_t val = 0;
    return 0;//todo

    ret = ps5458_read_reg(dev, PS5458_FLIP_MIRROR_REG, &val);
    switch (flip)
    {
    case 0 ... 3:
        val = PS5458_FETCH_MIRROR(val, flip & 0x01);
        val = PS5458_FETCH_FLIP(val, (flip >> 1) & 0x01);
        break;
    default:
        val = PS5458_FETCH_MIRROR(val, false);
        val = PS5458_FETCH_FLIP(val, false);
        break;
    };
    ps5458_dbg(dev, "flip 0x%x, reg val 0x%x\n", flip, val);
    ret = ps5458_write_reg(dev, PS5458_FLIP_MIRROR_REG, val);

    return ret;
}

static void ps5458_stream_on(struct ps5458 *dev)
{
    ps5458_dbg(dev, "stream_on enter tick:%u\n", rt_tick_get());

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    ps5458_write_multiple_reg_continue(dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);

#ifndef RT_USING_CAM_STREAM_ON_LATE
    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_ps5458_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_ps5458_set_flip_mirror(dev, dev->flip);

    ps5458_write_reg(dev, PS5458_REG_STREAM_CTRL, PS5458_STREAM_ON);
    dev->streaming = true;
#endif

    rt_mutex_release(&dev->mutex_lock);
    ps5458_dbg(dev, "stream_on exit tick:%u\n", rt_tick_get());
}

static void ps5458_stream_on_late(struct ps5458 *dev)
{
    ps5458_dbg(dev, "stream_on_late enter tick:%u\n", rt_tick_get());

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_ps5458_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_ps5458_set_flip_mirror(dev, dev->flip);

    ps5458_write_reg(dev, PS5458_REG_STREAM_CTRL, PS5458_STREAM_ON);
    rt_mutex_release(&dev->mutex_lock);
    dev->streaming = true;

    ps5458_dbg(dev, "stream_on_late exit tick:%u\n", rt_tick_get());
}

static void ps5458_stream_off(struct ps5458 *dev)
{
    struct rt_i2c_bus_device *i2c_bus;

    i2c_bus = dev->i2c_bus;
    if (i2c_bus)
    {
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

        ps5458_write_reg(dev, PS5458_REG_STREAM_CTRL, PS5458_STREAM_OFF);

        rt_mutex_release(&dev->mutex_lock);
    }
    dev->streaming = false;
}

ret_err_t rk_ps5458_init(struct rk_camera_device *dev)
{
    ret_err_t ret = RT_EOK;
    struct ps5458 *ps5458;

    RT_ASSERT(dev != RT_NULL);
    ps5458 = (struct ps5458 *)dev;
    struct rk_camera_device *camera = (struct rk_camera_device *)&ps5458->parent;

    if (ps5458)
    {
        camera->info.mbus_fmt.width = ps5458->cur_mode->width;
        camera->info.mbus_fmt.height = ps5458->cur_mode->height;
        camera->info.mbus_fmt.pixelcode = MEDIA_BUS_FMT_SBGGR10_1X10;//0x0c uyvy;0x08 vyuy;0x04 yvyu;0x00 yuyv
        camera->info.mbus_fmt.field = 0;
        camera->info.mbus_fmt.colorspace = 0;
        camera->info.mbus_config.linked_freq = ps5458->cur_mode->link_freq;
        camera->info.mbus_config.mbus_type = CAMERA_MBUS_CSI2_DPHY;
        camera->info.mbus_config.flags = MEDIA_BUS_FLAGS_CSI2_LVDS_LANES_2 |
                                         MEDIA_BUS_FLAGS_CSI2_LVDS_CLOCK_MODE_CONTIN;
        camera->info.hdr_mode =  ps5458->cur_mode->hdr_mode;
    }
    else
    {
        ret = RET_SYS_ENOSYS;
    }

    return ret;
}

static ret_err_t rk_ps5458_open(struct rk_camera_device *dev, rt_uint16_t oflag)
{
    ret_err_t ret = RT_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

ret_err_t rk_ps5458_close(struct rk_camera_device *dev)
{
    uint8_t ret = RT_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

static ret_err_t rk_ps5458_get_expinf(struct ps5458 *dev, struct rk_camera_exp_info *exp)
{
    ret_err_t ret = RT_EOK;
    const struct ps5458_mode *mode;

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

static ret_err_t rk_ps5458_get_exp_init(struct ps5458 *dev, struct rk_camera_exp_val *exp_val)
{
    ret_err_t ret = RT_EOK;

    exp_val->reg_time[0] = dev->init_exp.reg_time[0];
    exp_val->reg_gain[0] = dev->init_exp.reg_gain[0];
    exp_val->reg_time[1] = dev->init_exp.reg_time[1];
    exp_val->reg_gain[1] = dev->init_exp.reg_gain[1];
    ps5458_info(dev, "get init exp_val reg_time 0x%08x reg_gain 0x%08x reg_s_time 0x%08x reg_s_gain 0x%08x\n",
                dev->init_exp.reg_time[0], dev->init_exp.reg_gain[0], dev->init_exp.reg_time[1], dev->init_exp.reg_gain[1]);

    return ret;
}

static ret_err_t rk_ps5458_get_intput_fmt(struct ps5458 *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RT_EOK;
    const struct ps5458_mode *mode;

    mode = dev->cur_mode;
    mbus_fmt->width = mode->width;
    mbus_fmt->height = mode->height;
    mbus_fmt->field = 0;
    mbus_fmt->pixelcode = MEDIA_BUS_FMT_SBGGR10_1X10;

    return ret;
}

static ret_err_t rk_ps5458_set_intput_fmt(struct ps5458 *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RT_EOK;
    const struct ps5458_mode *mode;
    int i;
    bool is_find_fmt = false;
    struct camera_board_desc *ps5458 = (struct camera_board_desc *)camera_ps5458;

    ps5458_info(dev, "dst resulotion, width %d, height %d\n",
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
            rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)ps5458->rst_gpio.gpio_group,
                                 ps5458->rst_gpio.gpio_pin,
                                 !ps5458->rst_active);
            HAL_DelayMs(1);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)ps5458->rst_gpio.gpio_group,
                                 ps5458->rst_gpio.gpio_pin,
                                 ps5458->rst_active);
            if (ps5458->i2c_addr == PS5458_DEFAULT_I2C_ADDR)
                HAL_DelayMs(3);
            else
                HAL_DelayMs(8);
            ps5458_write_multiple_reg_continue(dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);
            ret = rk_ps5458_set_flip_mirror(dev, dev->flip);
            rt_mutex_release(&dev->mutex_lock);
        }
    }

    return ret;
}

static ret_err_t rk_ps5458_match_dst_config(struct ps5458 *dev, struct rk_camera_dst_config *dst_config)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    const struct ps5458_mode *mode;
    int i, cur_fps, dst_fps, cur_vts, dst_vts;

    dst_fps = dst_config->cam_fps_denominator / dst_config->cam_fps_numerator;
    dev->flip = dst_config->cam_mirror_flip;

    ps5458_info(dev, "cur resulotion, width %d, height %d, fps %d!\n",
                dev->cur_mode->width, dev->cur_mode->height,
                dev->cur_mode->max_fps.denominator / dev->cur_mode->max_fps.numerator);
    //match current resolution config
    for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
    {
        mode = &supported_modes[i];
        if (dst_config->width == mode->width &&
                dst_config->height == mode->height)
        {
            dev->dst_mode = (struct ps5458_mode *)mode;
            ret = RT_EOK;
            ps5458_info(dev, "find dst resulotion, width %d, height %d, fps %d!\n",
                        dst_config->width, dst_config->height, dst_fps);
            break;
        }
    }
    if (i == ARRAY_SIZE(supported_modes))
    {
        ps5458_err(dev, "not find match resulotion\n");
        return -RT_EINVAL;
    }

    cur_fps = dev->dst_mode->max_fps.denominator / dev->dst_mode->max_fps.numerator;
    cur_vts = dev->dst_mode->vts_def;

    //match fps config
    if (cur_fps == dst_fps)
        return RT_EOK;

    if (dst_fps > cur_fps)
    {
        ps5458_err(dev, "dst fps is larger than cur fps\n");
        return -RT_EINVAL;
    }

    dst_vts = cur_fps * cur_vts / dst_fps;

    dev->dst_mode->max_fps.denominator = dst_config->cam_fps_denominator;
    dev->dst_mode->max_fps.numerator = dst_config->cam_fps_numerator;
    dev->dst_mode->vts_def = dst_vts;

    return ret;
}

ret_err_t rk_ps5458_control(struct rk_camera_device *dev,
                            dt_cmd_t cmd,
                            void *args)
{
    ret_err_t ret = RT_EOK;
    struct ps5458 *ps5458;

    RT_ASSERT(dev != RT_NULL);
    ps5458 = (struct ps5458 *)dev;

    switch (cmd)
    {

    case RK_DEVICE_CTRL_DEVICE_INIT:
    {
        ret = rk_ps5458_init(dev);
    }
    break;

    case RK_DEVICE_CTRL_CAMERA_STREAM_ON:
    {
        ps5458_stream_on(ps5458);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_OFF:
    {
        ps5458_stream_off(ps5458);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_EXP_INF:
    {
        ret = rk_ps5458_get_expinf(ps5458, (struct rk_camera_exp_info *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_EXP_INIT:
    {
        ret = rk_ps5458_get_exp_init(ps5458, (struct rk_camera_exp_val *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL:
    {
        ret = rk_ps5458_set_expval(ps5458, (struct rk_camera_exp_val *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_VTS_VAL:
    {
        ret = rk_ps5458_set_vts(ps5458, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_FORMAT:
    {
        ret = rk_ps5458_get_intput_fmt(ps5458, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FORMAT:
    {
        ret = rk_ps5458_set_intput_fmt(ps5458, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CID_MATCH_CAM_CONFIG:
    {
        ret = rk_ps5458_match_dst_config(ps5458, (struct rk_camera_dst_config *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FLIPMIRROR:
    {
        ret = rk_ps5458_set_flip_mirror(ps5458, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_ON_LATE:
    {
        ps5458_stream_on_late(ps5458);
    }
    break;
    default:
        ps5458_dbg(ps5458, "exit CMD %d\n", cmd);
        break;
    }

    return ret;
}

struct rk_camera_ops rk_ps5458_ops =
{
    .init       = rk_ps5458_init,
    .open       = rk_ps5458_open,
    .control    = rk_ps5458_control,
};

int rk_camera_ps5458_init(void)
{
    ret_err_t ret = RT_EOK;
    const struct camera_board_desc *ps5458_desc;
    uint8_t gain_idx_h, gain_idx_l, exp_reg_h, exp_reg_l;
    uint32_t gain_idx, exp_reg;

    for (ps5458_desc = camera_ps5458; ps5458_desc->i2c_addr != 0; ps5458_desc++)
    {
        struct ps5458 *ps5458;
        struct clk_gate *clkgate;
        struct rk_camera_device *camera;

        ps5458 = rt_malloc(sizeof(struct ps5458));
        if (!ps5458)
        {
            rt_kprintf("malloc ps5458 failed\n");
            return -RT_ENOMEM;
        }

        rt_memset(ps5458, 0x0, sizeof(struct ps5458));

        camera = &ps5458->parent;
        camera->ops = &rk_ps5458_ops;

        rt_memcpy(ps5458->name, ps5458_desc->isp_subdev_name, RK_CAMERA_DEVICE_NAME_SIZE);
        rt_memcpy(ps5458->i2c_name, ps5458_desc->i2c_bus, RK_CAMERA_I2C_NAME_SIZE);

        ps5458->i2c_bus = (struct rt_i2c_bus_device *)rt_device_find(ps5458->i2c_name);
        if (ps5458->i2c_bus == RT_NULL)
        {
            ps5458_err(ps5458, "can't find i2c bus:%s\n", ps5458->i2c_name);
            rt_free(ps5458);
            continue;
        }

        if (ps5458_desc->mode_id <= PS5458_MODE_ID_MAX)
        {
            ps5458_dbg(ps5458, "mode_id: %d\n", ps5458_desc->mode_id);
            ps5458->cur_mode = &supported_modes[ps5458_desc->mode_id];
        }
        else
        {
            ps5458_info(ps5458, "mode id is over range, default use mode_id: 0\n");
            ps5458->cur_mode = &supported_modes[0];
        }

        ps5458->time_valid_delay = ps5458_desc->time_valid_delay;
        ps5458->gain_valid_delay = ps5458_desc->gain_valid_delay;
        ps5458->i2c_addr = ps5458_desc->i2c_addr;

        ps5458->i2c_bus->timeout = 10;

        if (ps5458_desc->mclk_out_gate_id && ps5458_desc->mclk_id)
        {
            clk_set_rate(ps5458_desc->mclk_id, ps5458->cur_mode->xvclk);
            HAL_CRU_ClkEnable(ps5458_desc->mclk_out_gate_id);
        }

        rt_mutex_init(&ps5458->mutex_lock, "ps5458_mutex", RT_IPC_FLAG_FIFO);
        RT_ASSERT(rt_object_get_type(&ps5458->mutex_lock.parent.parent) == RT_Object_Class_Mutex);
        camera->i2c_bus = ps5458->i2c_bus;
        rt_memcpy(camera->name, ps5458->name, RK_CAMERA_DEVICE_NAME_SIZE);
        ret = rk_camera_register(camera, camera->name, ps5458);

        /* preroll mode gain idx reg is 0x14b_l 0x14c_h*/
        ps5458_read_reg(ps5458, 0x0a8e, &gain_idx_l);
        ps5458_read_reg(ps5458, 0x0a8f, &gain_idx_h);
        gain_idx = gain_idx_h << 8 | gain_idx_l;
        /* preroll mode time idx reg is 0x149_l 0x14a_h*/
        ps5458_read_reg(ps5458, 0x0a8a, &exp_reg_l);
        ps5458_read_reg(ps5458, 0x0a8b, &exp_reg_h);
        exp_reg = exp_reg_h << 8 | exp_reg_l;
        ps5458_info(ps5458, "Pre-Record gain_idx %x %x %x, exp %x %x %x\n", gain_idx_l, gain_idx_h, gain_idx, exp_reg_l, exp_reg_h, exp_reg);
        ps5458->init_exp.reg_time[0] = exp_reg;
        ps5458->init_exp.reg_gain[0] = gain_idx;

        if (ps5458_desc->rst_gpio.gpio_group)
        {
            HAL_GPIO_SetPinDirection((struct GPIO_REG *)ps5458_desc->rst_gpio.gpio_group,
                                     ps5458_desc->rst_gpio.gpio_pin,
                                     GPIO_OUT);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)ps5458_desc->rst_gpio.gpio_group,
                                 ps5458_desc->rst_gpio.gpio_pin,
                                 !ps5458_desc->rst_active);
            HAL_DelayMs(1);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)ps5458_desc->rst_gpio.gpio_group,
                                 ps5458_desc->rst_gpio.gpio_pin,
                                 ps5458_desc->rst_active);
        }
        if (ps5458_desc->pwdn_gpio.gpio_group)
        {
            HAL_GPIO_SetPinDirection((struct GPIO_REG *)ps5458_desc->pwdn_gpio.gpio_group,
                                     ps5458_desc->pwdn_gpio.gpio_pin,
                                     GPIO_OUT);
            HAL_GPIO_SetPinLevel((struct GPIO_REG *)ps5458_desc->pwdn_gpio.gpio_group,
                                 ps5458_desc->pwdn_gpio.gpio_pin,
                                 ps5458_desc->pwdn_active);
        }
        if (ps5458_desc->i2c_addr == 0x4c)
            HAL_DelayMs(3);
        else
            HAL_DelayMs(8);

        if (ret)
        {
            ps5458_err(ps5458, "regster failed\n");
            rt_free(ps5458);
        }
    }

    return ret;
}

#if defined(__RT_THREAD__)
INIT_DEVICE_EXPORT(rk_camera_ps5458_init);
#endif
#endif
