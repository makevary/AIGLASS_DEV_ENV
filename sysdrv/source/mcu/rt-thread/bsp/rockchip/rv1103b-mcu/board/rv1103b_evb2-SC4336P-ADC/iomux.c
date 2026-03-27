/*
 * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2022-10-08     Ziyuan Xu   first implementation
 */

#include "rtdef.h"
#include "iomux.h"
#include "hal_base.h"

/**
 * @brief  Config iomux for RV1103B's camera
 */
static void cam_iomux_config(void)
{
    /* Config iomux gpio :MIPI_REFCLK_OUT0 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK1, GPIO_PIN_B5, PIN_CONFIG_MUX_FUNC1);
}

/**
 * @brief  Config iomux for RV1103B's gpio
 */
static void gpio_iomux_config(void)
{
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0, GPIO_PIN_B5, PIN_CONFIG_MUX_FUNC0);
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2, GPIO_PIN_A6, PIN_CONFIG_MUX_FUNC0);
}


/**
 * @brief  Config iomux for RV1103B
 */
void rt_hw_iomux_config(void)
{
    cam_iomux_config();
    gpio_iomux_config();
    i2c4_m1_iomux_config();
#ifdef RT_USING_UART
    uart0_m0_iomux_config();
#endif
}
