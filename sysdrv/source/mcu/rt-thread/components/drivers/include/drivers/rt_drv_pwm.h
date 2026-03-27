/*
 * Copyright (c) 2006-2018, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2018-05-07     aozima       the first version
 */

#ifndef __DRV_PWM_H_INCLUDE__
#define __DRV_PWM_H_INCLUDE__

#include <rtthread.h>
#include <rtdevice.h>

#define PWM_CMD_ENABLE      (128 + 0)
#define PWM_CMD_DISABLE     (128 + 1)
#define PWM_CMD_SET         (128 + 2)
#define PWM_CMD_GET         (128 + 3)
#define PWM_CMD_SET_ONESHOT (128 + 4)
#define PWM_CMD_SET_CAPTURE (128 + 5)
#define PWM_CMD_INT_ENABLE  (128 + 6)
#define PWM_CMD_INT_DISABLE (128 + 7)
#define PWM_CMD_SET_OFFSET  (128 + 8)
#define PWM_CMD_LOCK        (128 + 9)
#define PWM_CMD_UNLOCK      (128 + 10)

#define rt_pwm_set(device, channel, period, pulse) rt_pwm_set_internal(device, channel, period, pulse, 0, PWM_UNALIGNED)

enum rt_pwm_aligned_mode
{
    PWM_LEFT_ALIGNED = 1,
    PWM_CENTER_ALIGNED,
    PWM_UNALIGNED,
};

struct rt_pwm_configuration
{
    rt_uint32_t channel; /* 0-n */
    rt_uint32_t period;  /* unit:ns 1ns~4.29s:1Ghz~0.23hz */
    rt_uint32_t pulse;   /* unit:ns (pulse<=period) */
    rt_uint32_t count;   /* (count+1) repeated effective periods */
    rt_uint32_t offset;  /* unit:ns 0ns<=offset<=(period-duty) */
    rt_uint32_t mask;    /* channel mask for lock/unlock, such as 0x5 indicates channel0 and channel2 */

    rt_bool_t polarity;  /* polarity inverted or not */

    enum rt_pwm_aligned_mode aligned; /* aligned mode */
};

struct rt_device_pwm;
struct rt_pwm_ops
{
    rt_err_t (*control)(struct rt_device_pwm *device, int cmd, void *arg);
};

struct rt_device_pwm
{
    struct rt_device parent;
    const struct rt_pwm_ops *ops;
};

rt_err_t rt_device_pwm_register(struct rt_device_pwm *device, const char *name, const struct rt_pwm_ops *ops, const void *user_data);

rt_err_t rt_pwm_enable(struct rt_device_pwm *device, int channel);
rt_err_t rt_pwm_disable(struct rt_device_pwm *device, int channel);
rt_err_t rt_pwm_set_internal(struct rt_device_pwm *device, int channel, rt_uint32_t period, rt_uint32_t pulse, rt_uint32_t polarity, enum rt_pwm_aligned_mode aligned);
rt_err_t rt_pwm_set_offset(struct rt_device_pwm *device, int channel, rt_uint32_t offset);
rt_err_t rt_pwm_set_oneshot(struct rt_device_pwm *device, int channel, rt_uint32_t count);
rt_err_t rt_pwm_set_capture(struct rt_device_pwm *device, int channel);
rt_err_t rt_pwm_lock(struct rt_device_pwm *device, rt_uint32_t channel_mask);
rt_err_t rt_pwm_unlock(struct rt_device_pwm *device, rt_uint8_t channel_mask);
rt_err_t rt_pwm_int_enable(struct rt_device_pwm *device, int channel);
rt_err_t rt_pwm_int_disable(struct rt_device_pwm *device, int channel);

#endif /* __DRV_PWM_H_INCLUDE__ */
