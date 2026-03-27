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
		.gpio_index = GPIO1_D1,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_HIGH,
	},
	.ircut_b = {
		.gpio_index = GPIO1_D3,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
	},
	.led_ir = {
		.gpio_index = GPIO1_C7,
		.gpio_func = IOMUX_FUNC3 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
		/* PWM11_IR_M1 */
		.pwm_channel = 11,
		.pwm_period = 5000,
		.pwm_pulse = 0,
	},
	.led_ir_enable = {
		.gpio_index = GPIO1_D0,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_HIGH,
	},
	.led_white = {
		.gpio_index = GPIO1_C6,
		.gpio_func = IOMUX_FUNC3 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_LOW,
		/* PWM10_M1 */
		.pwm_channel = 10,
		.pwm_period = 5000,
		.pwm_pulse = 0,
	},
	.led_white_enable = {
		.gpio_index = GPIO1_D0,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT | FLAG_GPIO_DEFAULT_HIGH,
	},
	.gpio_adc_enable = {
		.gpio_index = GPIO3_A2,
		.gpio_func = IOMUX_FUNC0 | FLGA_GPIO_OUTPUT,
	},
	.gpio_adc = {
		.gpio_index = GPIO4_C1,
		.gpio_func = IOMUX_FUNC1 | FLGA_GPIO_INPUT,
		/* SARADC_IN1 */
		.adc_channel = 1,
		.adc_direction = 1,
	},
	.als_type = ALS_TYPE_ANALOG,
	.als_value = FIX2INT16(10.0),
};
