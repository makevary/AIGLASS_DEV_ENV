/*
 * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-06-06     Yuefu Su    first implementation
*/

#ifndef __CAM_BOARD_H__
#define __CAM_BOARD_H__

#include "rtdef.h"
#include "hal_base.h"
#include "hal_gpio.h"

#ifdef RT_USING_ISP3
#include "drv_isp3.h"
#endif

#define CAM_PWM_GET_CHANNEL(x)  (x%4)
#define CAM_PWM_GET_DEVICE(x)   (x/4)

#define CAM_ADC_GET_DEVICE "rk_adc0"

const char *cam_get_pwm_name(int pwm_channel);
int cam_set_gpio_level(uint32_t gpio_index, int gpio_level);
int cam_cfg_gpio_func(uint32_t gpio_index, int gpio_func);
extern void cif_hw_config(void);

#endif
