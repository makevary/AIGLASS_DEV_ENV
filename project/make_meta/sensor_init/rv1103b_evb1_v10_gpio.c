#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include "sensor_define.h"
#include "sensor_init_info.h"

struct sensor_init_cfg init_data = {
	.head                         = 0,
	.len                          = 0,
	.crc32                        = 0,

	.ircut_a = {
		.gpio_index = GPIO2_A4,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
	},
	.ircut_b = {
		.gpio_index = GPIO2_A5,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_HIGH,
	},
	.led_ir = {
		.gpio_index = GPIO2_A0,
		.gpio_func = IOMUX_FUNC3 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
		/* PWM0_CHN0_M1 */
		.pwm_channel = 3,
		.pwm_period = 5000,
		.pwm_pulse = 0,
	},
	.led_ir_enable = {
		.gpio_index = GPIO_INVALID,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT,
	},
	.led_white = {
		.gpio_index = GPIO2_A1,
		.gpio_func = IOMUX_FUNC3 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
		/* PWM0_CHN1_M1 */
		.pwm_channel = 0,
		.pwm_period = 5000,
		.pwm_pulse = 0,
	},
	.led_white_enable = {
		.gpio_index = GPIO_INVALID,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT,
	},
	.gpio_adc_enable = {
		.gpio_index = GPIO_INVALID,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT,
	},
	.gpio_adc = {
		.gpio_index = GPIO2_B4,
		.gpio_func = IOMUX_FUNC1 | FLGA_GPIO_INPUT,
		/* SARADC_IN0 */
		.adc_channel = 0,
		.adc_direction = 0,
	},
	.als_type = ALS_TYPE_NONE,
	.als_value = FIX2INT16(3.0),
};
