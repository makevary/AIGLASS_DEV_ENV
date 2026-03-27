/**
  * Copyright (c) 2024 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @file    drv_sc850sl.c
  * @version V0.0.1
  *
  * Change Logs:
  * 2024-07-22     Chad Ma     first implementation
  * 2024-07-30     Chad Ma     add 120fps setting
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

#ifdef RT_USING_SC850SL

//#define REG_LIST_CONVERSION_DEBUG
#define SC850SL_DEBUG_PRT      0

#if SC850SL_DEBUG_PRT
#include <stdio.h>
#define sc850sl_dbg(fmt, args...)    rt_kprintf("[SC850SL] "fmt"", ##args)
#else
#define sc850sl_dbg(fmt, args...)
#endif

#define sc850sl_info(fmt, args...)   rt_kprintf("[SC850SL] "fmt"", ##args)
#define sc850sl_err(fmt, args...)    rt_kprintf("[SC850SL] ERR "fmt"", ##args)

#define CHIP_ID                     0x9D1E
#define SC850SL_REG_CHIP_ID_H       0x3107
#define SC850SL_REG_CHIP_ID_L       0x3108

#define SC850SL_REG_STREAM_CTRL     0x0100
#define SC850SL_STREAM_ON           0x01
#define SC850SL_STREAM_OFF          0x00

//long exposure
#define SC850SL_REG_EXP_LONG_H      0x3e00    //[3:0]
#define SC850SL_REG_EXP_LONG_M      0x3e01    //[7:0]
#define SC850SL_REG_EXP_LONG_L      0x3e02    //[7:4]

//short exposure  //for hdr
#define SC850SL_REG_EXP_SF_H        0x3e22
#define SC850SL_REG_EXP_SF_M        0x3e04    //[7:0]
#define SC850SL_REG_EXP_SF_L        0x3e05    //[7:4]

#define SC850SL_FETCH_EXP_H(VAL)    (((VAL) >> 12) & 0xF)
#define SC850SL_FETCH_EXP_M(VAL)    (((VAL) >> 4) & 0xFF)
#define SC850SL_FETCH_EXP_L(VAL)    (((VAL) & 0xF) << 4)

/*gain*/
//long frame and normal gain reg
#define SC850SL_REG_DGAIN           0x3e06
#define SC850SL_REG_AGAIN           0x3e08
#define SC850SL_REG_AGAIN_FINE      0x3e09
#define SC850SL_REG_DGAIN_FINE      0x3e07

//short fram gain reg
#define SC850SL_SF_REG_AGAIN        0x3e12
#define SC850SL_SF_REG_AGAIN_FINE   0x3e13
#define SC850SL_SF_REG_DGAIN        0x3e10

#define SC850SL_GAIN_MIN            0x40    //1.000 = 64 * 1/64
#define SC850SL_GAIN_MAX            (8 * 50 * 64)   /*need_view   8*50*64=25600  */
#define SC850SL_GAIN_STEP           1
#define SC850SL_GAIN_DEFAULT        0x40

#define SC850SL_REG_VTS_L           0x320e
#define SC850SL_REG_VTS_H           0x320f

#define SC850SL_FLIP_REG            0x3221
#define SC850SL_FLIP_MASK           0x60
#define SC850SL_MIRROR_MASK         0x06

#define SC850SL_FETCH_MIRROR(VAL, ENABLE)       (ENABLE ? VAL | 0x06 : VAL & 0xf9)
#define SC850SL_FETCH_FLIP(VAL, ENABLE)         (ENABLE ? VAL | 0x60 : VAL & 0x9f)


#define SC850SL_REG_CTRL_MODE       0x0100
#define SC850SL_MODE_SW_STANDBY     0x0
#define SC850SL_MODE_STREAMING      BIT(0)

#define REG_END                     (0xFFFF)
#define REG_DELAY                   (0xFFFE)

#define SC850SL_4LANES              4

#define ARRAY_SIZE(x)               (sizeof(x) / sizeof((x)[0]))

/* redefine system err code */
#define RET_SYS_EOK                     (RT_EOK)
#define RET_SYS_ERROR                   (-RT_ERROR)
#define RET_SYS_ETIMEOUT                (-RT_ETIMEOUT)  /**< Timed out */
#define RET_SYS_EFULL                   (-RT_EFULL)     /**< The resource is full */
#define RET_SYS_EEMPTY                  (-RT_EEMPTY)    /**< The resource is empty */
#define RET_SYS_ENOMEM                  (-RT_ENOMEM)    /**< No memory */
#define RET_SYS_ENOSYS                  (-RT_ENOSYS)    /**< No system */
#define RET_SYS_EBUSY                   (-RT_EBUSY)     /**< Busy */
#define RET_SYS_EIO                     (-RT_EIO)       /**< IO error */
#define RET_SYS_EINTR                   (-RT_EINTR)     /**< Interrupted system call */
#define RET_SYS_EINVAL                  (-RT_EINVAL)    /**< Invalid argument */

struct rt_i2c_bus_device;

struct sc850sl_sensor_reg
{
    uint16_t reg_addr;
    uint8_t val;
} __attribute__((__packed__));

struct sc850sl_mode
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
#ifndef REG_LIST_CONVERSION_DEBUG
    const uint8_t *reg_list;
#else
    const struct sc850sl_sensor_reg *reg_list;
#endif
    const int reg_list_size;
    uint8_t hdr_mode;
} __attribute__((__packed__));

#pragma pack(1)
struct sc850sl_dev
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
    const struct sc850sl_mode *cur_mode;
    struct sc850sl_mode *dst_mode;

    bool has_init_exp;
    bool streaming;
};
#pragma pack()

typedef struct sc850sl_dev *rt_sc850sl_dev_t;

static struct sc850sl_dev g_sc850sl;

#ifndef REG_LIST_CONVERSION_DEBUG

/*
 * Xclk 24Mhz
 * 120.00fps
 * CSI-2_4lane
 * AD:10bit Output:10bit
 * 540Mbps
 * Master Mode
 * 1920x1080 2/2-line binning
 */
static const uint8_t g_sc850sl_1920X1080_binning_120fps_reg_table[] =
{
    0x3, 0x01, 0x03, 0x01,
    0x3, 0x01, 0x00, 0x00,
    0x3, 0x36, 0xe9, 0x80,
    0x3, 0x36, 0xf9, 0x80,
    0x6, 0x36, 0xea, 0xc9, 0x0c, 0x4b, 0x34,
    0x6, 0x36, 0xfa, 0x0b, 0x13, 0x00, 0x37,
    0x3, 0x36, 0xe9, 0x5b,
    0x3, 0x36, 0xf9, 0x5b,
    0x5, 0x30, 0x18, 0x7a, 0xf0, 0x30,
    0x4, 0x30, 0x1e, 0x3c, 0x2e,
    0x3, 0x30, 0x2a, 0x00,
    0x5, 0x30, 0x31, 0x0a, 0x20, 0x22,
    0x3, 0x30, 0x37, 0x60,
    0x3, 0x30, 0x3e, 0xb4,
    0x3, 0x32, 0x01, 0x98,
    0x3, 0x32, 0x03, 0x0c,
    0x3, 0x32, 0x05, 0xa7,
    0xb, 0x32, 0x07, 0x83, 0x07, 0x80, 0x04, 0x38, 0x02, 0x26, 0x04, 0x65,
    0x3, 0x32, 0x11, 0x04,
    0x3, 0x32, 0x13, 0x16,
    0x3, 0x32, 0x15, 0x31,
    0x3, 0x32, 0x20, 0x01,
    0x3, 0x32, 0x23, 0xd0,
    0x4, 0x32, 0x26, 0x00, 0x03,
    0x4, 0x32, 0x30, 0x11, 0x93,
    0x3, 0x32, 0x50, 0x40,
    0x3, 0x32, 0x53, 0x08,
    0x3, 0x32, 0x7e, 0x00,
    0x4, 0x32, 0x80, 0x00, 0x00,
    0x3, 0x33, 0x01, 0x24,
    0x3, 0x33, 0x04, 0x30,
    0x3, 0x33, 0x06, 0x54,
    0x6, 0x33, 0x08, 0x10, 0x60, 0x00, 0xa0,
    0x3, 0x33, 0x0d, 0x10,
    0x3, 0x33, 0x14, 0x92,
    0x4, 0x33, 0x1e, 0x29, 0x59,
    0x3, 0x33, 0x33, 0x10,
    0x4, 0x33, 0x47, 0x05, 0xd0,
    0x3, 0x33, 0x52, 0x01,
    0x3, 0x33, 0x56, 0x38,
    0x3, 0x33, 0x5d, 0x60,
    0x3, 0x33, 0x62, 0x70,
    0x3, 0x33, 0x8f, 0x80,
    0x3, 0x33, 0xaf, 0x48,
    0x3, 0x33, 0xfe, 0x00,
    0x3, 0x34, 0x00, 0x12,
    0x3, 0x34, 0x06, 0x04,
    0x3, 0x34, 0x10, 0x12,
    0x3, 0x34, 0x16, 0x06,
    0x3, 0x34, 0x33, 0x01,
    0x3, 0x34, 0x40, 0x12,
    0x3, 0x34, 0x46, 0x08,
    0x6, 0x34, 0x50, 0x55, 0xaa, 0x55, 0xaa,
    0x8, 0x34, 0x78, 0x01, 0x01, 0x02, 0x01, 0x04, 0x01,
    0x3, 0x36, 0x16, 0x0c,
    0x3, 0x36, 0x20, 0x94,
    0x3, 0x36, 0x22, 0x74,
    0x5, 0x36, 0x29, 0x74, 0xf0, 0x0f,
    0x3, 0x36, 0x2d, 0x00,
    0x3, 0x36, 0x30, 0x68,
    0x5, 0x36, 0x33, 0x24, 0x22, 0x20,
    0x4, 0x36, 0x37, 0x18, 0x26,
    0x6, 0x36, 0x3b, 0x06, 0x07, 0x05, 0x8f,
    0x5, 0x36, 0x48, 0xe0, 0x0a, 0x06,
    0x3, 0x36, 0x4c, 0x6a,
    0x3, 0x36, 0x50, 0x3d,
    0x3, 0x36, 0x54, 0x70,
    0x5, 0x36, 0x56, 0x68, 0x0f, 0x3d,
    0x3, 0x36, 0x5c, 0x40,
    0x3, 0x36, 0x5e, 0x68,
    0x4, 0x39, 0x01, 0x04, 0xf1,
    0x4, 0x39, 0x04, 0x20, 0x91,
    0x3, 0x39, 0x1e, 0x03,
    0x3, 0x39, 0x28, 0x04,
    0x8, 0x39, 0x33, 0xa0, 0x0a, 0x68, 0x00, 0x20, 0x0a,
    0x3, 0x39, 0x46, 0x20,
    0x9, 0x39, 0x61, 0x40, 0x40, 0xc8, 0xc8, 0x40, 0x40, 0x00,
    0x4, 0x39, 0xcd, 0xc8, 0xc8,
    0x5, 0x3e, 0x00, 0x00, 0x45, 0xf0,
    0x4, 0x3e, 0x0e, 0x02, 0x00,
    0x3, 0x3e, 0x1c, 0x0f,
    0x4, 0x3e, 0x23, 0x00, 0x00,
    0x4, 0x3e, 0x53, 0x00, 0x00,
    0x4, 0x3e, 0x68, 0x00, 0x80,
    0x4, 0x3e, 0x73, 0x00, 0x00,
    0x4, 0x3e, 0x86, 0x03, 0x40,
    0x3, 0x3f, 0x02, 0x24,
    0x3, 0x44, 0x24, 0x02,
    0x3, 0x45, 0x01, 0xb4,
    0x3, 0x45, 0x03, 0x20,
    0x3, 0x45, 0x09, 0x20,
    0x3, 0x45, 0x61, 0x12,
    0x3, 0x48, 0x00, 0x24,
    0x3, 0x48, 0x37, 0x16,
    0x3, 0x49, 0x00, 0x24,
    0x3, 0x49, 0x37, 0x16,
    0x3, 0x50, 0x00, 0x4e,
    0x3, 0x50, 0x0f, 0x35,
    0x3, 0x50, 0x20, 0x00,
    0x8, 0x57, 0x87, 0x10, 0x06, 0x00, 0x18, 0x0c, 0x00,
    0x8, 0x57, 0x90, 0x10, 0x06, 0x01, 0x18, 0x0c, 0x01,
    0x3, 0x57, 0x99, 0x06,
    0x3, 0x57, 0xa2, 0x60,
    0x4, 0x59, 0x00, 0xf1, 0x04,
    0x12, 0x59, 0xe0, 0xfe, 0x40, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30, 0xfe, 0x40,
    0xe, 0x59, 0xf4, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30,
    0x6a,
};

/*
 * Xclk 24Mhz
 * 60.00fps
 * CSI-2_4lane
 * AD:10bit Output:10bit
 * 540Mbps
 * Master Mode
 * 1920x1080 2/2-line binning
 */
static const uint8_t g_sc850sl_1920X1080_binning_60fps_reg_table[] =
{
    0x3, 0x01, 0x03, 0x01,
    0x3, 0x01, 0x00, 0x00,
    0x3, 0x36, 0xe9, 0x80,
    0x3, 0x36, 0xf9, 0x80,
    0x6, 0x36, 0xea, 0x09, 0x0c, 0x5a, 0x24,
    0x6, 0x36, 0xfa, 0x0b, 0x33, 0x10, 0x37,
    0x3, 0x36, 0xe9, 0x24,
    0x3, 0x36, 0xf9, 0x53,
    0x5, 0x30, 0x18, 0x7a, 0xf0, 0x30,
    0x4, 0x30, 0x1e, 0x3c, 0x9e,
    0x3, 0x30, 0x2a, 0x00,
    0x5, 0x30, 0x31, 0x0a, 0x20, 0x22,
    0x3, 0x30, 0x37, 0x00,
    0x3, 0x30, 0x3e, 0xb4,
    0xa, 0x32, 0x08, 0x07, 0x80, 0x04, 0x38, 0x04, 0x4c, 0x04, 0x65,
    0x3, 0x32, 0x11, 0x06,
    0x3, 0x32, 0x13, 0x02,
    0x3, 0x32, 0x15, 0x31,
    0x3, 0x32, 0x20, 0x01,
    0x4, 0x32, 0x26, 0x00, 0x03,
    0x3, 0x32, 0x50, 0x40,
    0x3, 0x32, 0x53, 0x08,
    0x3, 0x32, 0x7e, 0x00,
    0x4, 0x32, 0x80, 0x00, 0x00,
    0x3, 0x33, 0x01, 0x3c,
    0x3, 0x33, 0x04, 0x30,
    0x3, 0x33, 0x06, 0xe8,
    0x6, 0x33, 0x08, 0x10, 0x70, 0x01, 0xe0,
    0x3, 0x33, 0x0d, 0x10,
    0x3, 0x33, 0x14, 0x92,
    0x4, 0x33, 0x1e, 0x29, 0x69,
    0x3, 0x33, 0x33, 0x10,
    0x4, 0x33, 0x47, 0x05, 0xd0,
    0x3, 0x33, 0x52, 0x01,
    0x3, 0x33, 0x56, 0x38,
    0x3, 0x33, 0x5d, 0x60,
    0x3, 0x33, 0x62, 0x70,
    0x3, 0x33, 0x8f, 0x80,
    0x3, 0x33, 0xaf, 0x48,
    0x3, 0x33, 0xfe, 0x00,
    0x3, 0x34, 0x00, 0x12,
    0x3, 0x34, 0x06, 0x04,
    0x3, 0x34, 0x10, 0x12,
    0x3, 0x34, 0x16, 0x06,
    0x3, 0x34, 0x33, 0x01,
    0x3, 0x34, 0x40, 0x12,
    0x3, 0x34, 0x46, 0x08,
    0x6, 0x34, 0x50, 0x55, 0xaa, 0x55, 0xaa,
    0x8, 0x34, 0x78, 0x01, 0x01, 0x02, 0x01, 0x04, 0x01,
    0x3, 0x36, 0x16, 0x0c,
    0x3, 0x36, 0x20, 0x92,
    0x3, 0x36, 0x22, 0x74,
    0x5, 0x36, 0x29, 0x74, 0xf0, 0x0f,
    0x3, 0x36, 0x2d, 0x00,
    0x3, 0x36, 0x30, 0x68,
    0x5, 0x36, 0x33, 0x22, 0x22, 0x20,
    0x4, 0x36, 0x37, 0x06, 0x26,
    0x6, 0x36, 0x3b, 0x06, 0x07, 0x05, 0x8f,
    0x5, 0x36, 0x48, 0xe0, 0x0a, 0x06,
    0x3, 0x36, 0x4c, 0x6a,
    0x3, 0x36, 0x50, 0x3d,
    0x3, 0x36, 0x54, 0x40,
    0x5, 0x36, 0x56, 0x68, 0x0f, 0x3d,
    0x3, 0x36, 0x5c, 0x40,
    0x3, 0x36, 0x5e, 0x68,
    0x3, 0x39, 0x01, 0x04,
    0x4, 0x39, 0x04, 0x20, 0x91,
    0x3, 0x39, 0x1e, 0x83,
    0x3, 0x39, 0x28, 0x04,
    0x8, 0x39, 0x33, 0xa0, 0x0a, 0x68, 0x00, 0x20, 0x0a,
    0x3, 0x39, 0x46, 0x20,
    0x9, 0x39, 0x61, 0x40, 0x40, 0xc8, 0xc8, 0x40, 0x40, 0x00,
    0x4, 0x39, 0xcd, 0xc8, 0xc8,
    0x5, 0x3e, 0x00, 0x00, 0x45, 0xf0,
    0x4, 0x3e, 0x0e, 0x02, 0x00,
    0x3, 0x3e, 0x1c, 0x0f,
    0x4, 0x3e, 0x23, 0x00, 0x00,
    0x4, 0x3e, 0x53, 0x00, 0x00,
    0x4, 0x3e, 0x68, 0x00, 0x80,
    0x4, 0x3e, 0x73, 0x00, 0x00,
    0x4, 0x3e, 0x86, 0x03, 0x40,
    0x3, 0x3f, 0x02, 0x24,
    0x3, 0x44, 0x24, 0x02,
    0x3, 0x45, 0x01, 0xc4,
    0x3, 0x45, 0x09, 0x20,
    0x3, 0x45, 0x61, 0x12,
    0x3, 0x48, 0x00, 0x24,
    0x3, 0x48, 0x37, 0x1d,
    0x3, 0x49, 0x00, 0x24,
    0x3, 0x49, 0x37, 0x1d,
    0x3, 0x50, 0x00, 0x4e,
    0x3, 0x50, 0x0f, 0x35,
    0x3, 0x50, 0x20, 0x00,
    0x8, 0x57, 0x87, 0x10, 0x06, 0x00, 0x18, 0x0c, 0x00,
    0x8, 0x57, 0x90, 0x10, 0x06, 0x01, 0x18, 0x0c, 0x01,
    0x3, 0x57, 0x99, 0x06,
    0x3, 0x57, 0xa2, 0x60,
    0x4, 0x59, 0x00, 0xf1, 0x04,
    0x12, 0x59, 0xe0, 0xfe, 0x40, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30, 0xfe, 0x40,
    0xe, 0x59, 0xf4, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30,
    0x64,
};

/*
 * Xclk 24Mhz
 * 30fps
 * CSI-2_4lane
 * AD:12bit Output:10bit
 * 540Mbps
 * Master Mode
 * All-pixel
 */
static const uint8_t g_sc850sl_3840X2160_30fps_reg_table[] =
{
    0x3, 0x01, 0x03, 0x01,
    0x3, 0x01, 0x00, 0x00,
    0x3, 0x36, 0xe9, 0x80,
    0x3, 0x36, 0xf9, 0x80,
    0x6, 0x36, 0xea, 0x09, 0x0c, 0x4a, 0x24,
    0x6, 0x36, 0xfa, 0x0b, 0x33, 0x10, 0x37,
    0x3, 0x36, 0xe9, 0x24,
    0x3, 0x36, 0xf9, 0x53,
    0x5, 0x30, 0x18, 0x7a, 0xf0, 0x30,
    0x4, 0x30, 0x1e, 0x3c, 0x20,
    0x3, 0x30, 0x2a, 0x00,
    0x5, 0x30, 0x31, 0x0a, 0x20, 0x22,
    0x3, 0x30, 0x37, 0x00,
    0x3, 0x30, 0x3e, 0xb4,
    0x4, 0x32, 0x0c, 0x04, 0x4c,
    0x4, 0x32, 0x26, 0x00, 0x03,
    0x3, 0x32, 0x50, 0x40,
    0x3, 0x32, 0x53, 0x08,
    0x3, 0x32, 0x7e, 0x00,
    0x4, 0x32, 0x80, 0x00, 0x00,
    0x3, 0x33, 0x01, 0x3c,
    0x3, 0x33, 0x04, 0x30,
    0x3, 0x33, 0x06, 0xe8,
    0x6, 0x33, 0x08, 0x10, 0x70, 0x01, 0xe0,
    0x3, 0x33, 0x0d, 0x10,
    0x3, 0x33, 0x14, 0x92,
    0x4, 0x33, 0x1e, 0x29, 0x69,
    0x3, 0x33, 0x33, 0x10,
    0x4, 0x33, 0x47, 0x05, 0xd0,
    0x3, 0x33, 0x52, 0x01,
    0x3, 0x33, 0x56, 0x38,
    0x3, 0x33, 0x5d, 0x60,
    0x3, 0x33, 0x62, 0x70,
    0x3, 0x33, 0x8f, 0x80,
    0x3, 0x33, 0xaf, 0x48,
    0x3, 0x33, 0xfe, 0x00,
    0x3, 0x34, 0x00, 0x12,
    0x3, 0x34, 0x06, 0x04,
    0x3, 0x34, 0x10, 0x12,
    0x3, 0x34, 0x16, 0x06,
    0x3, 0x34, 0x33, 0x01,
    0x3, 0x34, 0x40, 0x12,
    0x3, 0x34, 0x46, 0x08,
    0x8, 0x34, 0x78, 0x01, 0x01, 0x02, 0x01, 0x04, 0x01,
    0x3, 0x36, 0x16, 0x0c,
    0x3, 0x36, 0x20, 0x92,
    0x3, 0x36, 0x22, 0x74,
    0x5, 0x36, 0x29, 0x74, 0xf0, 0x0f,
    0x3, 0x36, 0x2d, 0x00,
    0x3, 0x36, 0x30, 0x68,
    0x5, 0x36, 0x33, 0x22, 0x22, 0x20,
    0x4, 0x36, 0x37, 0x06, 0x26,
    0x6, 0x36, 0x3b, 0x06, 0x08, 0x05, 0x8f,
    0x5, 0x36, 0x48, 0xe0, 0x0a, 0x06,
    0x3, 0x36, 0x4c, 0x6a,
    0x3, 0x36, 0x50, 0x3d,
    0x3, 0x36, 0x54, 0x40,
    0x5, 0x36, 0x56, 0x68, 0x0f, 0x3d,
    0x3, 0x36, 0x5c, 0x40,
    0x3, 0x36, 0x5e, 0x68,
    0x3, 0x39, 0x01, 0x04,
    0x4, 0x39, 0x04, 0x20, 0x91,
    0x3, 0x39, 0x1e, 0x83,
    0x3, 0x39, 0x28, 0x04,
    0x8, 0x39, 0x33, 0xa0, 0x0a, 0x68, 0x00, 0x20, 0x0a,
    0x3, 0x39, 0x46, 0x20,
    0x9, 0x39, 0x61, 0x40, 0x40, 0xc8, 0xc8, 0x40, 0x40, 0x00,
    0x4, 0x39, 0xcd, 0xc8, 0xc8,
    0x4, 0x3e, 0x01, 0x82, 0x00,
    0x4, 0x3e, 0x0e, 0x02, 0x00,
    0x3, 0x3e, 0x1c, 0x0f,
    0x4, 0x3e, 0x23, 0x00, 0x00,
    0x4, 0x3e, 0x53, 0x00, 0x00,
    0x4, 0x3e, 0x68, 0x00, 0x80,
    0x4, 0x3e, 0x73, 0x00, 0x00,
    0x4, 0x3e, 0x86, 0x03, 0x40,
    0x3, 0x3f, 0x02, 0x24,
    0x3, 0x44, 0x24, 0x02,
    0x3, 0x45, 0x01, 0xc4,
    0x3, 0x45, 0x09, 0x20,
    0x3, 0x45, 0x61, 0x12,
    0x3, 0x48, 0x00, 0x24,
    0x3, 0x48, 0x37, 0x0f,
    0x3, 0x49, 0x00, 0x24,
    0x3, 0x49, 0x37, 0x0f,
    0x3, 0x50, 0x00, 0x0e,
    0x3, 0x50, 0x0f, 0x35,
    0x3, 0x50, 0x20, 0x00,
    0x8, 0x57, 0x87, 0x10, 0x06, 0x00, 0x18, 0x0c, 0x00,
    0x8, 0x57, 0x90, 0x10, 0x06, 0x01, 0x18, 0x0c, 0x01,
    0x3, 0x57, 0x99, 0x06,
    0x3, 0x57, 0xa2, 0x60,
    0x12, 0x59, 0xe0, 0xfe, 0x40, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30, 0xfe, 0x40,
    0xe, 0x59, 0xf4, 0x38, 0x30, 0x20, 0x38, 0x30, 0x20, 0x3f, 0x38, 0x30, 0x3f, 0x38, 0x30,
    0x5e,
};

#else

static const sc850sl_sensor_reg g_sc850sl_1920X1080_binning_120fps_reg_table[] =
{
    {0x0103, 0x01},
    {0x0100, 0x00},
    {0x36e9, 0x80},
    {0x36f9, 0x80},
    {0x36ea, 0xc9},
    {0x36eb, 0x0c},
    {0x36ec, 0x4b},
    {0x36ed, 0x34},
    {0x36fa, 0x0b},
    {0x36fb, 0x13},
    {0x36fc, 0x00},
    {0x36fd, 0x37},
    {0x36e9, 0x5b},
    {0x36f9, 0x5b},
    {0x3018, 0x7a},
    {0x3019, 0xf0},
    {0x301a, 0x30},
    {0x301e, 0x3c},
    {0x301f, 0x2e},
    {0x302a, 0x00},
    {0x3031, 0x0a},
    {0x3032, 0x20},
    {0x3033, 0x22},
    {0x3037, 0x60},
    {0x303e, 0xb4},
    {0x3201, 0x98},
    {0x3203, 0x0c},
    {0x3205, 0xa7},
    {0x3207, 0x83},
    {0x3208, 0x07},
    {0x3209, 0x80},
    {0x320a, 0x04},
    {0x320b, 0x38},
    {0x320c, 0x02},
    {0x320d, 0x26},
    {0x320e, 0x04},
    {0x320f, 0x65},
    {0x3211, 0x04},
    {0x3213, 0x16},
    {0x3215, 0x31},
    {0x3220, 0x01},
    {0x3223, 0xd0},
    {0x3226, 0x00},
    {0x3227, 0x03},
    {0x3230, 0x11},
    {0x3231, 0x93},
    {0x3250, 0x40},
    {0x3253, 0x08},
    {0x327e, 0x00},
    {0x3280, 0x00},
    {0x3281, 0x00},
    {0x3301, 0x24},
    {0x3304, 0x30},
    {0x3306, 0x54},
    {0x3308, 0x10},
    {0x3309, 0x60},
    {0x330a, 0x00},
    {0x330b, 0xa0},
    {0x330d, 0x10},
    {0x3314, 0x92},
    {0x331e, 0x29},
    {0x331f, 0x59},
    {0x3333, 0x10},
    {0x3347, 0x05},
    {0x3348, 0xd0},
    {0x3352, 0x01},
    {0x3356, 0x38},
    {0x335d, 0x60},
    {0x3362, 0x70},
    {0x338f, 0x80},
    {0x33af, 0x48},
    {0x33fe, 0x00},
    {0x3400, 0x12},
    {0x3406, 0x04},
    {0x3410, 0x12},
    {0x3416, 0x06},
    {0x3433, 0x01},
    {0x3440, 0x12},
    {0x3446, 0x08},
    {0x3450, 0x55},
    {0x3451, 0xaa},
    {0x3452, 0x55},
    {0x3453, 0xaa},
    {0x3478, 0x01},
    {0x3479, 0x01},
    {0x347a, 0x02},
    {0x347b, 0x01},
    {0x347c, 0x04},
    {0x347d, 0x01},
    {0x3616, 0x0c},
    {0x3620, 0x94},
    {0x3622, 0x74},
    {0x3629, 0x74},
    {0x362a, 0xf0},
    {0x362b, 0x0f},
    {0x362d, 0x00},
    {0x3630, 0x68},
    {0x3633, 0x24},
    {0x3634, 0x22},
    {0x3635, 0x20},
    {0x3637, 0x18},
    {0x3638, 0x26},
    {0x363b, 0x06},
    {0x363c, 0x07},
    {0x363d, 0x05},
    {0x363e, 0x8f},
    {0x3648, 0xe0},
    {0x3649, 0x0a},
    {0x364a, 0x06},
    {0x364c, 0x6a},
    {0x3650, 0x3d},
    {0x3654, 0x70},
    {0x3656, 0x68},
    {0x3657, 0x0f},
    {0x3658, 0x3d},
    {0x365c, 0x40},
    {0x365e, 0x68},
    {0x3901, 0x04},
    {0x3902, 0xf1},
    {0x3904, 0x20},
    {0x3905, 0x91},
    {0x391e, 0x03},
    {0x3928, 0x04},
    {0x3933, 0xa0},
    {0x3934, 0x0a},
    {0x3935, 0x68},
    {0x3936, 0x00},
    {0x3937, 0x20},
    {0x3938, 0x0a},
    {0x3946, 0x20},
    {0x3961, 0x40},
    {0x3962, 0x40},
    {0x3963, 0xc8},
    {0x3964, 0xc8},
    {0x3965, 0x40},
    {0x3966, 0x40},
    {0x3967, 0x00},
    {0x39cd, 0xc8},
    {0x39ce, 0xc8},
    {0x3e00, 0x00},
    {0x3e01, 0x45},
    {0x3e02, 0xf0},
    {0x3e0e, 0x02},
    {0x3e0f, 0x00},
    {0x3e1c, 0x0f},
    {0x3e23, 0x00},
    {0x3e24, 0x00},
    {0x3e53, 0x00},
    {0x3e54, 0x00},
    {0x3e68, 0x00},
    {0x3e69, 0x80},
    {0x3e73, 0x00},
    {0x3e74, 0x00},
    {0x3e86, 0x03},
    {0x3e87, 0x40},
    {0x3f02, 0x24},
    {0x4424, 0x02},
    {0x4501, 0xb4},
    {0x4503, 0x20},
    {0x4509, 0x20},
    {0x4561, 0x12},
    {0x4800, 0x24},
    {0x4837, 0x16},
    {0x4900, 0x24},
    {0x4937, 0x16},
    {0x5000, 0x4e},
    {0x500f, 0x35},
    {0x5020, 0x00},
    {0x5787, 0x10},
    {0x5788, 0x06},
    {0x5789, 0x00},
    {0x578a, 0x18},
    {0x578b, 0x0c},
    {0x578c, 0x00},
    {0x5790, 0x10},
    {0x5791, 0x06},
    {0x5792, 0x01},
    {0x5793, 0x18},
    {0x5794, 0x0c},
    {0x5795, 0x01},
    {0x5799, 0x06},
    {0x57a2, 0x60},
    {0x5900, 0xf1},
    {0x5901, 0x04},
    {0x59e0, 0xfe},
    {0x59e1, 0x40},
    {0x59e2, 0x38},
    {0x59e3, 0x30},
    {0x59e4, 0x20},
    {0x59e5, 0x38},
    {0x59e6, 0x30},
    {0x59e7, 0x20},
    {0x59e8, 0x3f},
    {0x59e9, 0x38},
    {0x59ea, 0x30},
    {0x59eb, 0x3f},
    {0x59ec, 0x38},
    {0x59ed, 0x30},
    {0x59ee, 0xfe},
    {0x59ef, 0x40},
    {0x59f4, 0x38},
    {0x59f5, 0x30},
    {0x59f6, 0x20},
    {0x59f7, 0x38},
    {0x59f8, 0x30},
    {0x59f9, 0x20},
    {0x59fa, 0x3f},
    {0x59fb, 0x38},
    {0x59fc, 0x30},
    {0x59fd, 0x3f},
    {0x59fe, 0x38},
    {0x59ff, 0x30},
    {REG_END, 0x00},
};

static const sc850sl_sensor_reg g_sc850sl_1920X1080_binning_60fps_reg_table[] =
{
    {0x0103, 0x01},
    {0x0100, 0x00},
    {0x36e9, 0x80},
    {0x36f9, 0x80},
    {0x36ea, 0x09},
    {0x36eb, 0x0c},
    {0x36ec, 0x5a},
    {0x36ed, 0x24},
    {0x36fa, 0x0b},
    {0x36fb, 0x33},
    {0x36fc, 0x10},
    {0x36fd, 0x37},
    {0x36e9, 0x24},
    {0x36f9, 0x53},
    {0x3018, 0x7a},
    {0x3019, 0xf0},
    {0x301a, 0x30},
    {0x301e, 0x3c},
    {0x301f, 0x9e},
    {0x302a, 0x00},
    {0x3031, 0x0a},
    {0x3032, 0x20},
    {0x3033, 0x22},
    {0x3037, 0x00},
    {0x303e, 0xb4},
    {0x3208, 0x07},
    {0x3209, 0x80},
    {0x320a, 0x04},
    {0x320b, 0x38},
    {0x320c, 0x04},
    {0x320d, 0x4c},
    {0x320e, 0x04},
    {0x320f, 0x65},
    {0x3211, 0x06},
    {0x3213, 0x02},
    {0x3215, 0x31},
    {0x3220, 0x01},
    {0x3226, 0x00},
    {0x3227, 0x03},
    {0x3250, 0x40},
    {0x3253, 0x08},
    {0x327e, 0x00},
    {0x3280, 0x00},
    {0x3281, 0x00},
    {0x3301, 0x3c},
    {0x3304, 0x30},
    {0x3306, 0xe8},
    {0x3308, 0x10},
    {0x3309, 0x70},
    {0x330a, 0x01},
    {0x330b, 0xe0},
    {0x330d, 0x10},
    {0x3314, 0x92},
    {0x331e, 0x29},
    {0x331f, 0x69},
    {0x3333, 0x10},
    {0x3347, 0x05},
    {0x3348, 0xd0},
    {0x3352, 0x01},
    {0x3356, 0x38},
    {0x335d, 0x60},
    {0x3362, 0x70},
    {0x338f, 0x80},
    {0x33af, 0x48},
    {0x33fe, 0x00},
    {0x3400, 0x12},
    {0x3406, 0x04},
    {0x3410, 0x12},
    {0x3416, 0x06},
    {0x3433, 0x01},
    {0x3440, 0x12},
    {0x3446, 0x08},
    {0x3450, 0x55},
    {0x3451, 0xaa},
    {0x3452, 0x55},
    {0x3453, 0xaa},
    {0x3478, 0x01},
    {0x3479, 0x01},
    {0x347a, 0x02},
    {0x347b, 0x01},
    {0x347c, 0x04},
    {0x347d, 0x01},
    {0x3616, 0x0c},
    {0x3620, 0x92},
    {0x3622, 0x74},
    {0x3629, 0x74},
    {0x362a, 0xf0},
    {0x362b, 0x0f},
    {0x362d, 0x00},
    {0x3630, 0x68},
    {0x3633, 0x22},
    {0x3634, 0x22},
    {0x3635, 0x20},
    {0x3637, 0x06},
    {0x3638, 0x26},
    {0x363b, 0x06},
    {0x363c, 0x07},
    {0x363d, 0x05},
    {0x363e, 0x8f},
    {0x3648, 0xe0},
    {0x3649, 0x0a},
    {0x364a, 0x06},
    {0x364c, 0x6a},
    {0x3650, 0x3d},
    {0x3654, 0x40},
    {0x3656, 0x68},
    {0x3657, 0x0f},
    {0x3658, 0x3d},
    {0x365c, 0x40},
    {0x365e, 0x68},
    {0x3901, 0x04},
    {0x3904, 0x20},
    {0x3905, 0x91},
    {0x391e, 0x83},
    {0x3928, 0x04},
    {0x3933, 0xa0},
    {0x3934, 0x0a},
    {0x3935, 0x68},
    {0x3936, 0x00},
    {0x3937, 0x20},
    {0x3938, 0x0a},
    {0x3946, 0x20},
    {0x3961, 0x40},
    {0x3962, 0x40},
    {0x3963, 0xc8},
    {0x3964, 0xc8},
    {0x3965, 0x40},
    {0x3966, 0x40},
    {0x3967, 0x00},
    {0x39cd, 0xc8},
    {0x39ce, 0xc8},
    {0x3e00, 0x00},
    {0x3e01, 0x45},
    {0x3e02, 0xf0},
    {0x3e0e, 0x02},
    {0x3e0f, 0x00},
    {0x3e1c, 0x0f},
    {0x3e23, 0x00},
    {0x3e24, 0x00},
    {0x3e53, 0x00},
    {0x3e54, 0x00},
    {0x3e68, 0x00},
    {0x3e69, 0x80},
    {0x3e73, 0x00},
    {0x3e74, 0x00},
    {0x3e86, 0x03},
    {0x3e87, 0x40},
    {0x3f02, 0x24},
    {0x4424, 0x02},
    {0x4501, 0xc4},
    {0x4509, 0x20},
    {0x4561, 0x12},
    {0x4800, 0x24},
    {0x4837, 0x1d},
    {0x4900, 0x24},
    {0x4937, 0x1d},
    {0x5000, 0x4e},
    {0x500f, 0x35},
    {0x5020, 0x00},
    {0x5787, 0x10},
    {0x5788, 0x06},
    {0x5789, 0x00},
    {0x578a, 0x18},
    {0x578b, 0x0c},
    {0x578c, 0x00},
    {0x5790, 0x10},
    {0x5791, 0x06},
    {0x5792, 0x01},
    {0x5793, 0x18},
    {0x5794, 0x0c},
    {0x5795, 0x01},
    {0x5799, 0x06},
    {0x57a2, 0x60},
    {0x5900, 0xf1},
    {0x5901, 0x04},
    {0x59e0, 0xfe},
    {0x59e1, 0x40},
    {0x59e2, 0x38},
    {0x59e3, 0x30},
    {0x59e4, 0x20},
    {0x59e5, 0x38},
    {0x59e6, 0x30},
    {0x59e7, 0x20},
    {0x59e8, 0x3f},
    {0x59e9, 0x38},
    {0x59ea, 0x30},
    {0x59eb, 0x3f},
    {0x59ec, 0x38},
    {0x59ed, 0x30},
    {0x59ee, 0xfe},
    {0x59ef, 0x40},
    {0x59f4, 0x38},
    {0x59f5, 0x30},
    {0x59f6, 0x20},
    {0x59f7, 0x38},
    {0x59f8, 0x30},
    {0x59f9, 0x20},
    {0x59fa, 0x3f},
    {0x59fb, 0x38},
    {0x59fc, 0x30},
    {0x59fd, 0x3f},
    {0x59fe, 0x38},
    {0x59ff, 0x30},
    {REG_END, 0x00},
}

static const struct sc850sl_sensor_reg g_sc850sl_3840X2160_30fps_reg_table[] =
{
    {0x0103, 0x01},
    {0x0100, 0x00},
    {0x36e9, 0x80},
    {0x36f9, 0x80},
    {0x36ea, 0x09},
    {0x36eb, 0x0c},
    {0x36ec, 0x4a},
    {0x36ed, 0x24},
    {0x36fa, 0x0b},
    {0x36fb, 0x33},
    {0x36fc, 0x10},
    {0x36fd, 0x37},
    {0x36e9, 0x24},
    {0x36f9, 0x53},
    {0x3018, 0x7a},
    {0x3019, 0xf0},
    {0x301a, 0x30},
    {0x301e, 0x3c},
    {0x301f, 0x20},
    {0x302a, 0x00},
    {0x3031, 0x0a},
    {0x3032, 0x20},
    {0x3033, 0x22},
    {0x3037, 0x00},
    {0x303e, 0xb4},
    {0x320c, 0x04},
    {0x320d, 0x4c},
    {0x3226, 0x00},
    {0x3227, 0x03},
    {0x3250, 0x40},
    {0x3253, 0x08},
    {0x327e, 0x00},
    {0x3280, 0x00},
    {0x3281, 0x00},
    {0x3301, 0x3c},
    {0x3304, 0x30},
    {0x3306, 0xe8},
    {0x3308, 0x10},
    {0x3309, 0x70},
    {0x330a, 0x01},
    {0x330b, 0xe0},
    {0x330d, 0x10},
    {0x3314, 0x92},
    {0x331e, 0x29},
    {0x331f, 0x69},
    {0x3333, 0x10},
    {0x3347, 0x05},
    {0x3348, 0xd0},
    {0x3352, 0x01},
    {0x3356, 0x38},
    {0x335d, 0x60},
    {0x3362, 0x70},
    {0x338f, 0x80},
    {0x33af, 0x48},
    {0x33fe, 0x00},
    {0x3400, 0x12},
    {0x3406, 0x04},
    {0x3410, 0x12},
    {0x3416, 0x06},
    {0x3433, 0x01},
    {0x3440, 0x12},
    {0x3446, 0x08},
    {0x3478, 0x01},
    {0x3479, 0x01},
    {0x347a, 0x02},
    {0x347b, 0x01},
    {0x347c, 0x04},
    {0x347d, 0x01},
    {0x3616, 0x0c},
    {0x3620, 0x92},
    {0x3622, 0x74},
    {0x3629, 0x74},
    {0x362a, 0xf0},
    {0x362b, 0x0f},
    {0x362d, 0x00},
    {0x3630, 0x68},
    {0x3633, 0x22},
    {0x3634, 0x22},
    {0x3635, 0x20},
    {0x3637, 0x06},
    {0x3638, 0x26},
    {0x363b, 0x06},
    {0x363c, 0x08},
    {0x363d, 0x05},
    {0x363e, 0x8f},
    {0x3648, 0xe0},
    {0x3649, 0x0a},
    {0x364a, 0x06},
    {0x364c, 0x6a},
    {0x3650, 0x3d},
    {0x3654, 0x40},
    {0x3656, 0x68},
    {0x3657, 0x0f},
    {0x3658, 0x3d},
    {0x365c, 0x40},
    {0x365e, 0x68},
    {0x3901, 0x04},
    {0x3904, 0x20},
    {0x3905, 0x91},
    {0x391e, 0x83},
    {0x3928, 0x04},
    {0x3933, 0xa0},
    {0x3934, 0x0a},
    {0x3935, 0x68},
    {0x3936, 0x00},
    {0x3937, 0x20},
    {0x3938, 0x0a},
    {0x3946, 0x20},
    {0x3961, 0x40},
    {0x3962, 0x40},
    {0x3963, 0xc8},
    {0x3964, 0xc8},
    {0x3965, 0x40},
    {0x3966, 0x40},
    {0x3967, 0x00},
    {0x39cd, 0xc8},
    {0x39ce, 0xc8},
    {0x3e01, 0x82},
    {0x3e02, 0x00},
    {0x3e0e, 0x02},
    {0x3e0f, 0x00},
    {0x3e1c, 0x0f},
    {0x3e23, 0x00},
    {0x3e24, 0x00},
    {0x3e53, 0x00},
    {0x3e54, 0x00},
    {0x3e68, 0x00},
    {0x3e69, 0x80},
    {0x3e73, 0x00},
    {0x3e74, 0x00},
    {0x3e86, 0x03},
    {0x3e87, 0x40},
    {0x3f02, 0x24},
    {0x4424, 0x02},
    {0x4501, 0xc4},
    {0x4509, 0x20},
    {0x4561, 0x12},
    {0x4800, 0x24},
    {0x4837, 0x0f},
    {0x4900, 0x24},
    {0x4937, 0x0f},
    {0x5000, 0x0e},
    {0x500f, 0x35},
    {0x5020, 0x00},
    {0x5787, 0x10},
    {0x5788, 0x06},
    {0x5789, 0x00},
    {0x578a, 0x18},
    {0x578b, 0x0c},
    {0x578c, 0x00},
    {0x5790, 0x10},
    {0x5791, 0x06},
    {0x5792, 0x01},
    {0x5793, 0x18},
    {0x5794, 0x0c},
    {0x5795, 0x01},
    {0x5799, 0x06},
    {0x57a2, 0x60},
    {0x59e0, 0xfe},
    {0x59e1, 0x40},
    {0x59e2, 0x38},
    {0x59e3, 0x30},
    {0x59e4, 0x20},
    {0x59e5, 0x38},
    {0x59e6, 0x30},
    {0x59e7, 0x20},
    {0x59e8, 0x3f},
    {0x59e9, 0x38},
    {0x59ea, 0x30},
    {0x59eb, 0x3f},
    {0x59ec, 0x38},
    {0x59ed, 0x30},
    {0x59ee, 0xfe},
    {0x59ef, 0x40},
    {0x59f4, 0x38},
    {0x59f5, 0x30},
    {0x59f6, 0x20},
    {0x59f7, 0x38},
    {0x59f8, 0x30},
    {0x59f9, 0x20},
    {0x59fa, 0x3f},
    {0x59fb, 0x38},
    {0x59fc, 0x30},
    {0x59fd, 0x3f},
    {0x59fe, 0x38},
    {0x59ff, 0x30},
    {REG_END, 0x00},
};
#endif

static const struct sc850sl_mode supported_modes[] =
{
    [SC850SL_1920X1080_120FPS] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 1920,
        .height = 1080,
        .max_fps = {
            .numerator = 10000,
            .denominator = 1200000,
        },
        .exp_def = 0x08c0,
        .hts_def = 0x0226,
        .vts_def = 0x0465,
        .xvclk = 24000000,
        .link_freq = 729000000,
        .reg_list = g_sc850sl_1920X1080_binning_120fps_reg_table,
        .reg_list_size = ARRAY_SIZE(g_sc850sl_1920X1080_binning_120fps_reg_table),
        .hdr_mode = NO_HDR,
    },
    [SC850SL_1920X1080_60FPS] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 1920,
        .height = 1080,
        .max_fps = {
            .numerator = 10000,
            .denominator = 600000,
        },
        .exp_def = 0x08c0,
        .hts_def = 0x044c,
        .vts_def = 0x0465,
        .xvclk = 24000000,
        .link_freq = 270000000,
        .reg_list = g_sc850sl_1920X1080_binning_60fps_reg_table,
        .reg_list_size = ARRAY_SIZE(g_sc850sl_1920X1080_binning_60fps_reg_table),
        .hdr_mode = NO_HDR,
    },
    [SC850SL_3840X2160] = {
        .bus_fmt = MEDIA_BUS_FMT_SBGGR10_1X10,
        .width = 3840,
        .height = 2160,
        .max_fps = {
            .numerator = 10000,
            .denominator = 300000,
        },
        .exp_def = 0x08c0,
        .hts_def = 0x0226 * 5 - 0x180,
        .vts_def = 0x08ca,
        .xvclk = 24000000,
        .link_freq = 540000000,
        .reg_list = g_sc850sl_3840X2160_30fps_reg_table,
        .reg_list_size = ARRAY_SIZE(g_sc850sl_3840X2160_30fps_reg_table),
        .hdr_mode = NO_HDR,
    },
};

struct sc850sl_ops
{
    ret_err_t (*init)(struct sc850sl_dev *dev);
    ret_err_t (*open)(struct sc850sl_dev *dev, uint16_t oflag);
    ret_err_t (*close)(struct sc850sl_dev *dev);
    ret_err_t (*control)(struct sc850sl_dev *dev, dt_cmd_t cmd, void *arg);
};

static ret_err_t sc850sl_read_reg(struct rt_i2c_bus_device *bus,
                                  uint16_t reg, uint8_t *data)
{
    struct rt_i2c_msg msg[2];
    uint8_t send_buf[2];
    uint8_t recv_buf[1];
    int retry = 10;
    ret_err_t ret = 0;

    RT_ASSERT(bus != RT_NULL);

    send_buf[0] = ((reg >> 8) & 0xff);
    send_buf[1] = ((reg >> 0) & 0xff);
    msg[0].addr = g_sc850sl.i2c_addr;
    msg[0].flags = RT_I2C_WR;
    msg[0].len = 2;
    msg[0].buf = send_buf;

    msg[1].addr = g_sc850sl.i2c_addr;
    msg[1].flags = RT_I2C_RD;
    msg[1].len = 1;
    msg[1].buf = recv_buf;

    while (1)
    {
        ret = rt_i2c_transfer(bus, msg, 2);
        if (ret == 2)
        {
            *data = recv_buf[0];
            return RET_SYS_EOK;
        }
        else
        {
            sc850sl_err("read reg, retry=%d, reg [0x%x]\n", retry, reg);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
    return ret;
}

static ret_err_t sc850sl_write_reg(struct rt_i2c_bus_device *bus,
                                   uint16_t reg, uint8_t data)
{
    uint8_t send_buf[3];
    struct rt_i2c_msg msgs;
    int ret = 0;
    int retry = 10;
    RT_ASSERT(bus != RT_NULL);

    send_buf[0] = ((reg >> 8) & 0xff);
    send_buf[1] = ((reg >> 0) & 0xff);
    send_buf[2] = data;

    msgs.addr = g_sc850sl.i2c_addr;
    msgs.flags = RT_I2C_WR;
    msgs.buf = send_buf;
    msgs.len = 3;

    while (1)
    {
        ret = rt_i2c_transfer(bus, &msgs, 1);
        if (ret == 1)
        {
            return RET_SYS_EOK;
        }
        else
        {
            sc850sl_err("write reg, retry:%d, reg [0x%x]-->0x%x\n", retry, reg, data);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}

#ifndef REG_LIST_CONVERSION_DEBUG

static int sc850sl_write_multiple_reg_continue(struct sc850sl_dev *dev,
        const uint8_t *i2c_data, int len)
{
    uint16_t i;
    struct rt_i2c_bus_device *i2c_bus;
    struct rt_i2c_msg msgs;
    int ret = 0;
    int offset = 0;
    int retry = 10;
    uint16_t addr;

    RT_ASSERT(dev != RT_NULL && i2c_data != RT_NULL);

    i2c_bus = dev->i2c_bus;
    RT_ASSERT(i2c_bus != RT_NULL);

    for (i = 0; i < i2c_data[len - 1];)
    {
        addr = (i2c_data[offset + 1] << 8) | i2c_data[offset + 2];
        if (addr != REG_DELAY)
        {
            msgs.addr = g_sc850sl.i2c_addr;
            msgs.flags = RT_I2C_WR;
            msgs.buf = (uint8_t *)&i2c_data[offset + 1];
            msgs.len = i2c_data[offset];
            ret = rt_i2c_transfer(i2c_bus, &msgs, 1);

            if (ret != 1)
            {
                sc850sl_err("write multi-regs, retry=%d, addr=0x%02x%02x\n", retry, i2c_data[offset + 1], i2c_data[offset + 2]);
                if (--retry)
                    continue;
                else
                    return RET_SYS_ERROR;
            }
        }
        else
        {
            sc850sl_info("delay %d ms\n", i2c_data[offset + 3]);
            HAL_DelayUs(i2c_data[offset + 3] * 1000);
        }

        offset += (i2c_data[offset] + 1);
        retry = 10;
        i++;
    }

    return RET_SYS_EOK;
}

#else
static ret_err_t sc850sl_write_reg_discontinued(struct rt_i2c_bus_device *bus,
        char *data, uint32_t len)
{
    struct rt_i2c_msg msgs;
    int ret = 0;
    int retry = 10;

    RT_ASSERT(bus != RT_NULL);

    msgs.addr = g_sc850sl.i2c_addr;
    msgs.flags = RT_I2C_WR;
    msgs.buf = data;
    msgs.len = len;

    while (1)
    {
        ret = rt_i2c_transfer(bus, &msgs, 1);
        if (ret == 1)
        {
            return RET_SYS_EOK;
        }
        else
        {
            sc850sl_err("write discontinued reg, retry:%d\n", retry);
            if (--retry)
                continue;
            else
                return RET_SYS_ERROR;
        }
    }
}


static void sc850sl_write_multiple_reg(struct sc850sl_dev *dev,
                                       const struct sc850sl_sensor_reg *reg, int len)
{
    uint16_t i;
    struct rt_i2c_bus_device *i2c_bus;
    int k = 0;
    char *data = rt_malloc(len);
    uint16_t reg_addr;
    int j = 0;
    int cnt = 0;

    RT_ASSERT(dev != RT_NULL);
    RT_ASSERT(reg != RT_NULL);

    i2c_bus = dev->i2c_bus;
    RT_ASSERT(i2c_bus != RT_NULL);

    for (i = 0;; i++)
    {
        if (reg[i].reg_addr == REG_END)
        {
            if (k > 0)
            {
                cnt++;
                rt_kprintf("0x%x, ", k + 2);
                for (j = 0; j < k + 2; j++)
                    rt_kprintf("0x%02x, ", data[j]);
                rt_kprintf("\n");
                sc850sl_write_reg_discontinued(i2c_bus, data, k + 2);
                k = 0;
            }
            break;
        }

        if (reg[i].reg_addr == REG_DELAY)
        {
            if (k > 0)
            {
                cnt++;
                rt_kprintf("0x%x, ", k + 2);
                for (j = 0; j < k + 2; j++)
                    rt_kprintf("0x%02x, ", data[j]);
                rt_kprintf("\n");
                sc850sl_write_reg_discontinued(i2c_bus, data, k + 2);
                k = 0;
            }
            HAL_DelayUs(reg[i].val);
        }
        else
        {
            if (k == 0)
            {
                reg_addr = reg[i].reg_addr;
                data[0] = ((reg_addr >> 8) & 0xff);
                data[1] = ((reg_addr >> 0) & 0xff);
                data[2] = reg[i].val;
                k++;
            }
            else
            {
                if ((reg[i - 1].reg_addr + 1) == reg[i].reg_addr)
                {
                    data[k + 2] = reg[i].val;
                    k++;
                }
                else
                {
                    cnt++;
                    rt_kprintf("0x%x, ", k + 2);
                    for (j = 0; j < k + 2; j++)
                        rt_kprintf("0x%02x, ", data[j]);
                    rt_kprintf("\n");
                    sc850sl_write_reg_discontinued(i2c_bus, data, k + 2);
                    reg_addr = reg[i].reg_addr;
                    data[0] = ((reg_addr >> 8) & 0xff);
                    data[1] = ((reg_addr >> 0) & 0xff);
                    data[2] = reg[i].val;
                    k = 1;
                }
            }
        }
    }
    rt_kprintf("0x%x,\n", cnt);
}

static void rk_continuous_reg_dump(struct sc850sl_dev *dev)
{
    int id = 0;

    for (id = 0; id < sizeof(supported_modes) / sizeof(supported_modes[0]); id++)
    {
        sc850sl_info("id: %d, width: %d, height: %d\n",
                     id, supported_modes[id].width, supported_modes[id].height);
        sc850sl_write_multiple_reg((struct sc850sl_dev *)dev,
                                   supported_modes[id].reg_list,
                                   supported_modes[id].reg_list_size);
    }
}
#endif

static void sc850sl_get_gain_reg(uint8_t *again_reg, uint8_t *again_fine_reg,
                                 uint8_t *dgain_reg, uint8_t *dgain_fine_reg, uint32_t total_gain)
{
    uint8_t u8Reg0x3e09 = 0x40, u8Reg0x3e08 = 0x03;
    uint32_t aCoarseGain = 0;
    uint32_t aFineGain = 0;
    uint32_t again = 0;
    uint32_t dgain = 0;

    if (total_gain < 64)
        total_gain = 64;
    else if (total_gain > SC850SL_GAIN_MAX)
        total_gain = SC850SL_GAIN_MAX;

    if (total_gain <= 3199)
    {
        again = total_gain;
        dgain = 1;
    }
    else
    {
        again = 3199;
        dgain = total_gain / again;
    }

    //again
    if (again <= 200)
    {
        //a_gain < 3.125x
        for (aCoarseGain = 1; aCoarseGain <= 2; aCoarseGain = aCoarseGain * 2)
        {
            //1,2,4,8,16
            if (again < (64 * 2 * aCoarseGain))
                break;
        }
        aFineGain = again / aCoarseGain;
    }
    else
    {
        for (aCoarseGain = 1; aCoarseGain <= 8; aCoarseGain = aCoarseGain * 2)
        {
            //1,2,4,8
            if (again < (64 * 2 * aCoarseGain * 3125 / 1000))
                break;
        }
        aFineGain = 1000 * again / aCoarseGain / 3125;
    }
    for (; aCoarseGain >= 2; aCoarseGain = aCoarseGain / 2)
        u8Reg0x3e08 = (u8Reg0x3e08 << 1) | 0x01;

    u8Reg0x3e09 = aFineGain;
    //dcg = 2.72  -->  2.72*1024=2785.28
    u8Reg0x3e08 = (again > 200) ? (u8Reg0x3e08 | 0x20) : (u8Reg0x3e08 & 0x1f);
    *dgain_fine_reg = total_gain * 128 / again / dgain;
    //dgain
    if (dgain < 2)      /*1x ~ 2x*/
    {
        *dgain_reg = 0x00;
    }
    else if (dgain < 4)     /*2x ~ 4x*/
    {
        *dgain_reg = 0x01;
        *dgain_fine_reg += (dgain - 2) * 64;
    }
    else if (dgain < 8)     /*4x ~ 8x*/
    {
        *dgain_reg = 0x03;
        *dgain_fine_reg += (dgain - 4) * 32;
    }
    else
    {
        *dgain_reg = 0x07;
        *dgain_fine_reg = 0x80;
    }

    *again_reg = u8Reg0x3e08;
    *again_fine_reg = u8Reg0x3e09;
}

static ret_err_t rk_sc850sl_set_expval(struct sc850sl_dev *dev, struct rk_camera_exp_val *exp)
{
    ret_err_t ret = RET_SYS_EOK;
    uint32_t l_exp_time;
    uint32_t l_a_gain;
    uint8_t a_gain = 0, a_gain_fine = 0, d_gain = 0, d_gain_fine = 0;

    RT_ASSERT(dev != RT_NULL);

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (!dev->has_init_exp && !dev->streaming && strcmp(dev->name, RK_ISP_ASSIST_SUBDEV_NAME))
    {
        dev->init_exp = *exp;
        dev->has_init_exp = true;
        sc850sl_dbg("sc850sl don't stream, record exp for hdr!\n");

        rt_mutex_release(&dev->mutex_lock);
        return ret;
    }

    l_exp_time = exp->reg_time[0] << 1;
    l_a_gain = exp->reg_gain[0];
    sc850sl_dbg("sc850sl: exp req: L_exp: 0x%x, 0x%x\n",
                l_exp_time, l_a_gain);

    ret = sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_EXP_LONG_H,
                            (uint8_t)((l_exp_time >> 16) & 0x0f));
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_EXP_LONG_M,
                             (uint8_t)((l_exp_time >> 8) & 0xff));
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_EXP_LONG_L,
                             (uint8_t)(l_exp_time & 0xff));

    sc850sl_get_gain_reg(&a_gain, &a_gain_fine, &d_gain, &d_gain_fine, l_a_gain);
    sc850sl_dbg("a_gain: 0x%x a_gain_fine:0x%0x, d_gain: 0x%x, d_gain_fine: 0x%x\n",
                a_gain, a_gain_fine, d_gain, d_gain_fine);

    ret = sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_AGAIN, a_gain);
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_AGAIN_FINE, a_gain_fine);
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_DGAIN, a_gain);
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_DGAIN_FINE, d_gain_fine);

    rt_mutex_release(&dev->mutex_lock);
    return ret;
}

static ret_err_t rk_sc850sl_set_vts(struct sc850sl_dev *dev, uint32_t dst_vts)
{
    ret_err_t ret = RET_SYS_ENOSYS;

    RT_ASSERT(dev != RT_NULL);

    sc850sl_dbg("(%s) set vts: 0x%x \n", __FUNCTION__, dst_vts);

    ret = sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_VTS_L,
                            (uint8_t)(dst_vts & 0xff));
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_VTS_H,
                             (uint8_t)((dst_vts >> 8) & 0xff));

    return ret;
}

static ret_err_t rk_sc850sl_set_flip_mirror(struct sc850sl_dev *dev, uint32_t flip)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    uint8_t val = 0;

    RT_ASSERT(dev != RT_NULL);

    ret = sc850sl_read_reg(dev->i2c_bus, SC850SL_FLIP_REG, &val);
    switch (flip)
    {
    case 0 ... 3:
        val = SC850SL_FETCH_MIRROR(val, flip & 0x01);
        val = SC850SL_FETCH_FLIP(val, (flip >> 1) & 0x01);
        break;
    default:
        val = SC850SL_FETCH_MIRROR(val, false);
        val = SC850SL_FETCH_FLIP(val, false);
        break;
    };
    sc850sl_dbg("(%s) flip 0x%x, reg val 0x%x\n", __FUNCTION__, flip, val);
    ret |= sc850sl_write_reg(dev->i2c_bus, SC850SL_FLIP_REG, val);

    return ret;
}

static void sc850sl_stream_on(struct sc850sl_dev *dev)
{
    sc850sl_dbg("stream_on enter tick:%u\n", rt_tick_get());

    RT_ASSERT(dev != RT_NULL);

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

#ifndef REG_LIST_CONVERSION_DEBUG
    sc850sl_write_multiple_reg_continue((struct sc850sl_dev *)dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);
#endif

#ifndef RT_USING_CAM_STREAM_ON_LATE
    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_sc850sl_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_sc850sl_set_flip_mirror(dev, dev->flip);

    sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_CTRL_MODE, SC850SL_STREAM_ON);
    dev->streaming = true;
#endif

    rt_mutex_release(&dev->mutex_lock);
    sc850sl_dbg("stream_on exit tick:%u\n", rt_tick_get());
}

static void sc850sl_stream_on_late(struct sc850sl_dev *dev)
{
    sc850sl_dbg("stream_on_late enter tick:%u\n", rt_tick_get());

    RT_ASSERT(dev != RT_NULL);

    rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

    if (dev->has_init_exp)
    {
        rt_mutex_release(&dev->mutex_lock);
        rk_sc850sl_set_expval(dev, &dev->init_exp);
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);
    }
    rk_sc850sl_set_flip_mirror(dev, dev->flip);

    sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_CTRL_MODE, SC850SL_STREAM_ON);
    rt_mutex_release(&dev->mutex_lock);
    dev->streaming = true;
    sc850sl_dbg("stream_on_late exit tick:%u\n", rt_tick_get());
}

static void sc850sl_stream_off(struct sc850sl_dev *dev)
{
    struct rt_i2c_bus_device *i2c_bus;

    RT_ASSERT(dev != RT_NULL);

    i2c_bus = dev->i2c_bus;
    if (i2c_bus)
    {
        rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

        sc850sl_write_reg(dev->i2c_bus, SC850SL_REG_CTRL_MODE, SC850SL_STREAM_OFF);

        rt_mutex_release(&dev->mutex_lock);
    }
    else
    {
        sc850sl_err("not find out i2c bus!\n");
    }
    dev->streaming = false;
}

ret_err_t rk_sc850sl_init(struct rk_camera_device *dev)
{
    ret_err_t ret = RET_SYS_EOK;
    struct sc850sl_dev *sc850sl;

    sc850sl = (struct sc850sl_dev *)dev;
    struct rk_camera_device *camera = (struct rk_camera_device *)&sc850sl->parent;
#ifdef REG_LIST_CONVERSION_DEBUG
    rk_continuous_reg_dump(sc850sl);
#endif

    if (sc850sl)
    {
        camera->info.mbus_fmt.width = sc850sl->cur_mode->width;
        camera->info.mbus_fmt.height = sc850sl->cur_mode->height;
        camera->info.mbus_fmt.pixelcode = sc850sl->cur_mode->bus_fmt;
        camera->info.mbus_fmt.field = 0;
        camera->info.mbus_fmt.colorspace = 0;
        camera->info.mbus_config.linked_freq = sc850sl->cur_mode->link_freq;
        camera->info.mbus_config.mbus_type = CAMERA_MBUS_CSI2_DPHY;
        camera->info.mbus_config.flags = MEDIA_BUS_FLAGS_CSI2_LVDS_LANES_4 |
                                         MEDIA_BUS_FLAGS_CSI2_LVDS_CLOCK_MODE_CONTIN;
        camera->info.hdr_mode = sc850sl->cur_mode->hdr_mode;

        sc850sl->i2c_bus = (struct rt_i2c_bus_device *)rt_device_find(sc850sl->i2c_name);

        if (!sc850sl->i2c_bus)
        {
            sc850sl_err("not find i2c source 2:%s !!!\n",
                        sc850sl->i2c_name);
            return RET_SYS_ENOSYS;
        }
        else
        {
            sc850sl_dbg("s0 find i2c_bus:%s\n", sc850sl->i2c_name);
        }
    }
    else
    {
        ret = RET_SYS_ENOSYS;
    }

    return ret;
}

static ret_err_t rk_sc850sl_open(struct rk_camera_device *dev, rt_uint16_t oflag)
{
    ret_err_t ret = RET_SYS_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

ret_err_t rk_sc850sl_close(struct rk_camera_device *dev)
{
    uint8_t ret = RET_SYS_EOK;

    RT_ASSERT(dev != RT_NULL);

    return ret;
}

static ret_err_t rk_sc850sl_get_expinf(struct sc850sl_dev *dev, struct rk_camera_exp_info *exp)
{
    ret_err_t ret = RET_SYS_EOK;
    const struct sc850sl_mode *mode;

    RT_ASSERT(dev != RT_NULL);

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

static ret_err_t rk_sc850sl_get_intput_fmt(struct sc850sl_dev *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RET_SYS_EOK;
    const struct sc850sl_mode *mode;

    RT_ASSERT(dev != RT_NULL);

    mode = dev->cur_mode;
    mbus_fmt->width = mode->width;
    mbus_fmt->height = mode->height;
    mbus_fmt->field = 0;
    mbus_fmt->pixelcode = mode->bus_fmt;

    return ret;
}

static ret_err_t rk_sc850sl_set_intput_fmt(struct sc850sl_dev *dev, struct rk_camera_mbus_framefmt *mbus_fmt)
{
    ret_err_t ret = RET_SYS_EOK;
    const struct sc850sl_mode *mode;
    int i = 0;
    bool is_find_fmt = false;

    RT_ASSERT(dev != RT_NULL);

    sc850sl_info("(%s) dst resulotion, width %d, height %d\n",
                 __FUNCTION__, mbus_fmt->width, mbus_fmt->height);

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

    if (is_find_fmt == false && mbus_fmt->width == 1920 && mbus_fmt->height == 1080)
    {
        mode = &supported_modes[SC850SL_1920X1080_120FPS];
        is_find_fmt = true;
        sc850sl_info("dst mode SC850SL_1280X720_120FPS\n");
    }
    else if (is_find_fmt == false && mbus_fmt->width == 3840 && mbus_fmt->height == 2160)
    {
        mode = &supported_modes[SC850SL_3840X2160];
        is_find_fmt = true;
        sc850sl_info("dst mode SC850SL_3840X2160\n");
    }

    if (is_find_fmt)
    {
        if (mode->width != dev->cur_mode->width)
        {
            dev->cur_mode = mode;
            rt_mutex_take(&dev->mutex_lock, RT_WAITING_FOREVER);

#ifndef REG_LIST_CONVERSION_DEBUG
            sc850sl_write_multiple_reg_continue((struct sc850sl_dev *)dev, dev->cur_mode->reg_list, dev->cur_mode->reg_list_size);
#endif
            ret = rk_sc850sl_set_flip_mirror(dev, dev->flip);
            rt_mutex_release(&dev->mutex_lock);
        }
    }

    return ret;
}

static ret_err_t rk_sc850sl_match_dst_config(struct sc850sl_dev *dev, struct rk_camera_dst_config *dst_config)
{
    ret_err_t ret = RET_SYS_ENOSYS;
    const struct sc850sl_mode *mode;
    int i = 0;
    int cur_fps, dst_fps, cur_vts, dst_vts;

    RT_ASSERT(dev != RT_NULL);

    dst_fps = dst_config->cam_fps_denominator / dst_config->cam_fps_numerator;
    dev->flip = dst_config->cam_mirror_flip;

    sc850sl_info("cur resulotion, width %d, height %d, fps %d!\n",
                 dev->cur_mode->width, dev->cur_mode->height, dev->cur_mode->max_fps.denominator / dev->cur_mode->max_fps.numerator);
    //match current resolution config
    for (i = 0; i < ARRAY_SIZE(supported_modes); i++)
    {
        mode = &supported_modes[i];

        if (dst_config->width == mode->width &&
                dst_config->height == mode->height)
        {
            dev->dst_mode = (struct sc850sl_mode *)mode;
            ret = RET_SYS_EOK;
            sc850sl_info("find dst resulotion, width %d, height %d, fps %d!\n",
                         dst_config->width, dst_config->height, dst_fps);
            break;
        }
        else
            sc850sl_dbg("not find match resulotion\n");
    }
    cur_fps = dev->dst_mode->max_fps.denominator / dev->dst_mode->max_fps.numerator;
    cur_vts = dev->dst_mode->vts_def;

    //match fps config
    if (cur_fps == dst_fps)
        return 0;

    if (dst_fps > cur_fps)
    {
        sc850sl_err("dst fps is larger than cur fps\n");
        return RET_SYS_EINVAL;
    }

    dst_vts = cur_fps * cur_vts / dst_fps;

    dev->dst_mode->max_fps.denominator = dst_config->cam_fps_denominator;
    dev->dst_mode->max_fps.numerator = dst_config->cam_fps_numerator;
    dev->dst_mode->vts_def = dst_vts;

    return ret;
}

ret_err_t rk_sc850sl_control(struct rk_camera_device *dev,
                             int cmd,
                             void *args)
{
    ret_err_t ret = RET_SYS_EOK;
    struct sc850sl_dev *sc850sl;

    RT_ASSERT(dev != RT_NULL);
    sc850sl = (struct sc850sl_dev *)dev;

    switch (cmd)
    {
    case RK_DEVICE_CTRL_DEVICE_INIT:
    {
        ret = rk_sc850sl_init(dev);
    }
    break;

    case RK_DEVICE_CTRL_CAMERA_STREAM_ON:
    {
        sc850sl_stream_on(sc850sl);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_OFF:
    {
        sc850sl_stream_off(sc850sl);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_EXP_INF:
    {
        ret = rk_sc850sl_get_expinf(sc850sl, (struct rk_camera_exp_info *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL:
    {
        ret = rk_sc850sl_set_expval(sc850sl, (struct rk_camera_exp_val *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_VTS_VAL:
    {
        ret = rk_sc850sl_set_vts(sc850sl, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_GET_FORMAT:
    {
        ret = rk_sc850sl_get_intput_fmt(sc850sl, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FORMAT:
    {
        ret = rk_sc850sl_set_intput_fmt(sc850sl, (struct rk_camera_mbus_framefmt *)args);
    }
    break;
    case RK_DEVICE_CTRL_CID_MATCH_CAM_CONFIG:
    {
        ret = rk_sc850sl_match_dst_config(sc850sl, (struct rk_camera_dst_config *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_SET_FLIPMIRROR:
    {
        ret = rk_sc850sl_set_flip_mirror(sc850sl, *(uint32_t *)args);
    }
    break;
    case RK_DEVICE_CTRL_CAMERA_STREAM_ON_LATE:
    {
        sc850sl_stream_on_late(sc850sl);
    }
    break;
    default:
        sc850sl_dbg("(%s) exit CMD %d\n", __FUNCTION__, cmd);
        break;
    }
    return ret;
}

struct rk_camera_ops rk_sc850sl_ops =
{
    rk_sc850sl_init,
    rk_sc850sl_open,
    NULL,
    rk_sc850sl_control
};

int rk_sc850sl_check_sensor_id(struct sc850sl_dev *dev)
{
    ret_err_t ret = RT_EOK;
    uint8_t id_h = 0, id_l = 0;

    ret = sc850sl_read_reg(dev->i2c_bus, SC850SL_REG_CHIP_ID_H, &id_h);
    ret |= sc850sl_read_reg(dev->i2c_bus, SC850SL_REG_CHIP_ID_L, &id_l);

    if (!ret)
    {
        uint16_t id = (id_h << 8) | id_l;
        if (id != CHIP_ID)
        {
            sc850sl_err("Unexpected sensor id(0x%02x), ret(%d)\n", id, ret);
            return RT_EINVAL;
        }
        sc850sl_info("Detected SC850SL(0x%04x) sensor\n", CHIP_ID);
    }

    sc850sl_info("check sensor id done, ret = %d\n", ret);

    return ret;
}


int rk_camera_sc850sl_init(void)
{
    ret_err_t ret = RET_SYS_EOK;
    struct sc850sl_dev *instance = &g_sc850sl;
    struct rk_camera_device *camera = &instance->parent;
    struct clk_gate *clkgate;
    struct camera_board_desc *sc850sl = (struct camera_board_desc *)&camera_sc850sl;
    camera->ops = &rk_sc850sl_ops;

    rt_strncpy(instance->name, sc850sl->isp_subdev_name, rt_strlen(sc850sl->isp_subdev_name));
    rt_strncpy(instance->i2c_name, sc850sl->i2c_bus, rt_strlen(sc850sl->i2c_bus));

    instance->i2c_bus = (struct rt_i2c_bus_device *)rt_device_find(instance->i2c_name);
    if (sc850sl->mode_id <= SC850SL_MODE_ID_MAX)
    {
        sc850sl_dbg("mode_id: %d\n", sc850sl->mode_id);
        instance->cur_mode = &supported_modes[sc850sl->mode_id];
    }
    else
    {
        sc850sl_info("mode id is over range, default use mode_id: 0\n");
        instance->cur_mode = &supported_modes[0];
    }

    instance->dst_mode = (struct sc850sl_mode *)&supported_modes[SC850SL_3840X2160];
    instance->time_valid_delay = sc850sl->time_valid_delay;
    instance->gain_valid_delay = sc850sl->gain_valid_delay;
    instance->i2c_addr = sc850sl->i2c_addr;
    instance->flip = 0;

    if (sc850sl->rst_gpio.gpio_group)
    {
        HAL_GPIO_SetPinDirection((struct GPIO_REG *)sc850sl->rst_gpio.gpio_group,
                                 sc850sl->rst_gpio.gpio_pin,
                                 GPIO_OUT);
        /* Set XCLR low At least 500ns after power raising */
        HAL_GPIO_SetPinLevel((struct GPIO_REG *)sc850sl->rst_gpio.gpio_group,
                             sc850sl->rst_gpio.gpio_pin,
                             sc850sl->rst_active);
    }
    if (sc850sl->pwdn_gpio.gpio_group)
    {
        HAL_GPIO_SetPinDirection((struct GPIO_REG *)sc850sl->pwdn_gpio.gpio_group,
                                 sc850sl->pwdn_gpio.gpio_pin,
                                 GPIO_OUT);
        HAL_GPIO_SetPinLevel((struct GPIO_REG *)sc850sl->pwdn_gpio.gpio_group,
                             sc850sl->pwdn_gpio.gpio_pin,
                             sc850sl->pwdn_active);
    }

    if (sc850sl->mclk_out_gate_id && sc850sl->mclk_id)
    {
        clk_set_rate(sc850sl->mclk_id, instance->cur_mode->xvclk);
        HAL_CRU_ClkEnable(sc850sl->mclk_out_gate_id);
    }

    rt_mutex_init(&instance->mutex_lock, "SC850SL_mutex", RT_IPC_FLAG_FIFO);
    RT_ASSERT(rt_object_get_type(&instance->mutex_lock.parent.parent) == RT_Object_Class_Mutex);
    camera->i2c_bus = instance->i2c_bus;
    rt_strncpy(camera->name, sc850sl->isp_subdev_name, rt_strlen(sc850sl->isp_subdev_name));
    rk_camera_register(camera, camera->name, instance);

    rk_sc850sl_check_sensor_id(instance);
    return ret;
}

void sc850sl_detect(void)
{
    struct sc850sl_dev *instance = &g_sc850sl;

    sc850sl_dbg("start to detect SC850SL for testing \n");
    sc850sl_dbg("dev name:%s\n", instance->name);
    sc850sl_dbg("dev i2c_bus:%s\n", instance->i2c_name);
    instance->i2c_bus = (struct rt_i2c_bus_device *)rt_device_find(instance->i2c_name);
    if (!instance->i2c_bus)
    {
        sc850sl_err("Warning:not find i2c source 1:%s !!!\n", instance->i2c_name);
        return;
    }
    else
    {
        sc850sl_dbg("find i2c_bus:%s\n", instance->i2c_name);
    }

}
#if defined(__RT_THREAD__)
INIT_DEVICE_EXPORT(rk_camera_sc850sl_init);
#ifdef RT_USING_FINSH
#include <finsh.h>
MSH_CMD_EXPORT(sc850sl_detect, check SC850SL is available or not);
#endif
#endif
#endif
