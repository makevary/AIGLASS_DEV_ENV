/*
 * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-06-28     Chad Ma      first implementation
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
    /* Config iomux gpio :MIPI_REFCLK_OUT1 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK1, GPIO_PIN_B6, PIN_CONFIG_MUX_FUNC1);

    /*
     * SC3338 can't change the i2c address by hardware, if the dual sc3338 were
     * connected to the same I2C controller. We have to pull low the reset-gpios,
     * so that initialize first camera can change the i2c address via register.
     */
    /*Config GPIO_PIN_C5-MIPI_RST0, GPIO_PIN_D1-MIPI_RST1 and GPIO_PIN_D2-MIPI_PDN0*/
    // HAL_PINCTRL_SetIOMUX(GPIO_BANK3, GPIO_PIN_C5 | GPIO_PIN_D1 | GPIO_PIN_D2, PIN_CONFIG_MUX_FUNC0);
    // HAL_GPIO_SetPinDirection(GPIO3, GPIO_PIN_C5 | GPIO_PIN_D1 | GPIO_PIN_D2, GPIO_OUT);
    // HAL_GPIO_SetPinLevel(GPIO3, GPIO_PIN_C5 | GPIO_PIN_D1 | GPIO_PIN_D2, 0);
}

/**
 * @brief  Config iomux for RV1103B's gpio
 */
static void gpio_iomux_config(void)
{
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0, GPIO_PIN_B5, PIN_CONFIG_MUX_FUNC0);    //mipi reset
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2, GPIO_PIN_A6, PIN_CONFIG_MUX_FUNC0);    //mipi pwdn0
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2, GPIO_PIN_A7, PIN_CONFIG_MUX_FUNC0);    //mipi pwdn1
}

/**
 * @brief  Config iomux for RV1103b
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
