/*
 * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2024-04-19     Jason Zhu   first implementation
 */

#include "rtdef.h"
#include "iomux.h"
#include "hal_base.h"

#ifdef RT_USING_PIN
#ifdef RT_USING_I2C0
/**
 * @brief  Config iomux m0 for I2C0
 */
RT_WEAK RT_UNUSED void i2c0_m0_iomux_config(void)
{
    /* I2C0 M0 SCL-0A5 SDA-0A6 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0,
                         GPIO_PIN_A5 | GPIO_PIN_A6,
                         PIN_CONFIG_MUX_FUNC3);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK0,
                         GPIO_PIN_A5 | GPIO_PIN_A6,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m1 for I2C0
 */
RT_WEAK RT_UNUSED void i2c0_m1_iomux_config(void)
{
    /* I2C0 M1 SCL-1B4 SDA-1B3 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK1,
                         GPIO_PIN_B3 | GPIO_PIN_B4,
                         PIN_CONFIG_MUX_FUNC5);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK1,
                         GPIO_PIN_B3 | GPIO_PIN_B4,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m2 for I2C0
 */
RT_WEAK RT_UNUSED void i2c0_m2_iomux_config(void)
{
    /* I2C0 M2 SCL-1B5 SDA-1B6 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK1,
                         GPIO_PIN_B5 | GPIO_PIN_B6,
                         PIN_CONFIG_MUX_FUNC2);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK1,
                         GPIO_PIN_B5 | GPIO_PIN_B6,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}
#endif
#ifdef RT_USING_I2C1
/**
 * @brief  Config iomux m0 for I2C1
 */
RT_WEAK RT_UNUSED void i2c1_m0_iomux_config(void)
{
    /* I2C1 M0 SCL-0B0 SDA-0B1 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0,
                         GPIO_PIN_B0 | GPIO_PIN_B1,
                         PIN_CONFIG_MUX_FUNC1);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK0,
                         GPIO_PIN_B0 | GPIO_PIN_B1,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m1 for I2C1
 */
RT_WEAK RT_UNUSED void i2c1_m1_iomux_config(void)
{
    /* I2C1 M1 SCL-2A4 SDA-2A5 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2,
                         GPIO_PIN_A4 | GPIO_PIN_A5,
                         PIN_CONFIG_MUX_FUNC4);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK2,
                         GPIO_PIN_A4 | GPIO_PIN_A5,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}
#endif
#ifdef RT_USING_I2C2
/**
 * @brief  Config iomux m0 for I2C2
 */
RT_WEAK RT_UNUSED void i2c2_m0_iomux_config(void)
{
    /* I2C2 M0 SCL-0B2 SDA-0B3 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0,
                         GPIO_PIN_B2 | GPIO_PIN_B3,
                         PIN_CONFIG_MUX_FUNC1);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK0,
                         GPIO_PIN_B2 | GPIO_PIN_B3,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m1 for I2C2
 */
RT_WEAK RT_UNUSED void i2c2_m1_iomux_config(void)
{
    /* I2C2 M1 SCL-2A6 SDA-2A7 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2,
                         GPIO_PIN_A6 | GPIO_PIN_A7,
                         PIN_CONFIG_MUX_FUNC4);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK2,
                         GPIO_PIN_A6 | GPIO_PIN_A7,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}
#endif
#ifdef RT_USING_I2C3

/**
 * @brief  Config iomux m0 for I2C3
 */
RT_WEAK RT_UNUSED void i2c3_m0_iomux_config(void)
{
    /* I2C3 M0 SCL-0B4 SDA-0B5 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0,
                         GPIO_PIN_B4 | GPIO_PIN_B5,
                         PIN_CONFIG_MUX_FUNC1);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK0,
                         GPIO_PIN_B4 | GPIO_PIN_B5,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m1 for I2C3
 */
RT_WEAK RT_UNUSED void i2c3_m1_iomux_config(void)
{
    /* I2C3 M1 SCL-2B3 SDA-2B2 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2,
                         GPIO_PIN_B2 | GPIO_PIN_B3,
                         PIN_CONFIG_MUX_FUNC4);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK2,
                         GPIO_PIN_B2 | GPIO_PIN_B3,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}
#endif
#ifdef RT_USING_I2C4
/**
 * @brief  Config iomux m0 for I2C4
 */
RT_WEAK RT_UNUSED void i2c4_m0_iomux_config(void)
{
    /* I2C4 M0 SCL-2B0 SDA-2B1 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK2,
                         GPIO_PIN_B0 | GPIO_PIN_B1,
                         PIN_CONFIG_MUX_FUNC4);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK2,
                         GPIO_PIN_B0 | GPIO_PIN_B1,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}

/**
 * @brief  Config iomux m1 for I2C4
 */
RT_WEAK RT_UNUSED void i2c4_m1_iomux_config(void)
{
    /* I2C4 M1 SCL-1B7 SDA-1C0 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK1,
                         GPIO_PIN_B7 | GPIO_PIN_C0,
                         PIN_CONFIG_MUX_FUNC2);

    /* pull none smt */
    HAL_PINCTRL_SetParam(GPIO_BANK1,
                         GPIO_PIN_B7 | GPIO_PIN_C0,
                         PIN_CONFIG_PUL_NORMAL |
                         PIN_CONFIG_SMT_ENABLE);
}
#endif
#ifdef RT_USING_UART0
/**
 * @brief  Config iomux m0 for UART0
 */
RT_WEAK RT_UNUSED void uart0_m0_iomux_config(void)
{
    /* UART0 M0 RX-0A6 TX-0A5 */
    HAL_PINCTRL_SetIOMUX(GPIO_BANK0,
                         GPIO_PIN_A5 |
                         GPIO_PIN_A6,
                         PIN_CONFIG_MUX_FUNC1);
}
#endif
#endif

/**
 * @brief  Config iomux for RV1103B
 */
RT_WEAK RT_UNUSED void rt_hw_iomux_config(void)
{
#ifdef RT_USING_PIN
#ifdef RT_USING_UART0
    uart0_m0_iomux_config();
#endif
#endif
}

