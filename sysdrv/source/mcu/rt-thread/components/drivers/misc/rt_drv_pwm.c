/*
 * Copyright (c) 2006-2018, RT-Thread Development Team
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Change Logs:
 * Date           Author       Notes
 * 2018-05-07     aozima       the first version
 */

#include <string.h>

#include <drivers/rt_drv_pwm.h>

static rt_err_t _pwm_control(rt_device_t dev, int cmd, void *args)
{
    rt_err_t result = RT_EOK;
    struct rt_device_pwm *pwm = (struct rt_device_pwm *)dev;

    if (pwm->ops->control)
    {
        result = pwm->ops->control(pwm, cmd, args);
    }

    return result;
}


/*
pos: channel
void *buffer: rt_uint32_t pulse[size]
size : number of pulse, only set to sizeof(rt_uint32_t).
*/
static rt_size_t _pwm_read(rt_device_t dev, rt_off_t pos, void *buffer, rt_size_t size)
{
    rt_err_t result = RT_EOK;
    struct rt_device_pwm *pwm = (struct rt_device_pwm *)dev;
    rt_uint32_t *pulse = (rt_uint32_t *)buffer;
    struct rt_pwm_configuration configuration = {0};

    configuration.channel = pos;

    if (pwm->ops->control)
    {
        result = pwm->ops->control(pwm, PWM_CMD_GET,  &configuration);
        if (result != RT_EOK)
        {
            return 0;
        }

        *pulse = configuration.pulse;
    }

    return size;
}

/*
pos: channel
void *buffer: rt_uint32_t pulse[size]
size : number of pulse, only set to sizeof(rt_uint32_t).
*/
static rt_size_t _pwm_write(rt_device_t dev, rt_off_t pos, const void *buffer, rt_size_t size)
{
    rt_err_t result = RT_EOK;
    struct rt_device_pwm *pwm = (struct rt_device_pwm *)dev;
    rt_uint32_t *pulse = (rt_uint32_t *)buffer;
    struct rt_pwm_configuration configuration = {0};

    configuration.channel = pos;

    if (pwm->ops->control)
    {
        result = pwm->ops->control(pwm, PWM_CMD_GET, &configuration);
        if (result != RT_EOK)
        {
            return 0;
        }

        configuration.pulse = *pulse;

        result = pwm->ops->control(pwm, PWM_CMD_SET, &configuration);
        if (result != RT_EOK)
        {
            return 0;
        }
    }

    return size;
}

#ifdef RT_USING_DEVICE_OPS
static const struct rt_device_ops pwm_device_ops =
{
    RT_NULL,
    RT_NULL,
    RT_NULL,
    _pwm_read,
    _pwm_write,
    _pwm_control
};
#endif /* RT_USING_DEVICE_OPS */

rt_err_t rt_device_pwm_register(struct rt_device_pwm *device, const char *name, const struct rt_pwm_ops *ops, const void *user_data)
{
    rt_err_t result = RT_EOK;

    memset(device, 0, sizeof(struct rt_device_pwm));

#ifdef RT_USING_DEVICE_OPS
    device->parent.ops = &pwm_device_ops;
#else
    device->parent.init = RT_NULL;
    device->parent.open = RT_NULL;
    device->parent.close = RT_NULL;
    device->parent.read  = _pwm_read;
    device->parent.write = _pwm_write;
    device->parent.control = _pwm_control;
#endif /* RT_USING_DEVICE_OPS */

    device->parent.type         = RT_Device_Class_Miscellaneous;
    device->ops                 = ops;
    device->parent.user_data    = (void *)user_data;

    result = rt_device_register(&device->parent, name, RT_DEVICE_FLAG_RDWR);

    return result;
}

rt_err_t rt_pwm_enable(struct rt_device_pwm *device, int channel)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    result = rt_device_control(&device->parent, PWM_CMD_ENABLE, &configuration);

    return result;
}

rt_err_t rt_pwm_disable(struct rt_device_pwm *device, int channel)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    result = rt_device_control(&device->parent, PWM_CMD_DISABLE, &configuration);

    return result;
}

rt_err_t rt_pwm_set_internal(struct rt_device_pwm *device, int channel, rt_uint32_t period, rt_uint32_t pulse, rt_uint32_t polarity, enum rt_pwm_aligned_mode aligned)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    configuration.period = period;
    configuration.pulse = pulse;
    configuration.polarity = polarity ? RT_TRUE : RT_FALSE;
    configuration.aligned = aligned;
    result = rt_device_control(&device->parent, PWM_CMD_SET, &configuration);

    return result;
}

rt_err_t rt_pwm_set_oneshot(struct rt_device_pwm *device, int channel, rt_uint32_t count)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    configuration.count = count;
    result = rt_device_control(&device->parent, PWM_CMD_SET_ONESHOT, &configuration);

    return result;
}

rt_err_t rt_pwm_set_capture(struct rt_device_pwm *device, int channel)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    result = rt_device_control(&device->parent, PWM_CMD_SET_CAPTURE, &configuration);

    return result;
}

rt_err_t rt_pwm_int_enable(struct rt_device_pwm *device, int channel)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    result = rt_device_control(&device->parent, PWM_CMD_INT_ENABLE, &configuration);

    return result;
}

rt_err_t rt_pwm_int_disable(struct rt_device_pwm *device, int channel)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.channel = channel;
    result = rt_device_control(&device->parent, PWM_CMD_INT_DISABLE, &configuration);

    return result;
}

rt_err_t rt_pwm_lock(struct rt_device_pwm *device, rt_uint32_t channel_mask)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.mask = channel_mask;
    result = rt_device_control(&device->parent, PWM_CMD_LOCK, &configuration);

    return result;
}

rt_err_t rt_pwm_unlock(struct rt_device_pwm *device, rt_uint8_t channel_mask)
{
    rt_err_t result = RT_EOK;
    struct rt_pwm_configuration configuration = {0};

    if (!device)
    {
        return -RT_EIO;
    }

    configuration.mask = channel_mask;
    result = rt_device_control(&device->parent, PWM_CMD_UNLOCK, &configuration);

    return result;
}

#ifdef RT_USING_FINSH
#include <finsh.h>

FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_enable, pwm_enable, enable pwm by channel.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_disable, pwm_disable, disable pwm by channel.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_set_internal, pwm_set, set pwm.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_set_oneshot, pwm_set_oneshot, set pwm oneshot mode.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_set_capture, pwm_set_capture, set pwm capture mode.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_int_enable, pwm_int_enable, enable pwm interrupt.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_int_disable, pwm_int_disable, disable pwm interrupt.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_lock, pwm_lock, enable pwm global lock.);
FINSH_FUNCTION_EXPORT_ALIAS(rt_pwm_unlock, pwm_unlock, disable pwm global lock.);

#ifdef FINSH_USING_MSH
static int pwm_enable(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_enable pwm1 1\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_enable(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_enable, pwm_enable pwm1 1);

static int pwm_disable(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_enable pwm1 1\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_disable(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_disable, pwm_disable pwm1 1);

static int pwm_set(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 5)
    {
        rt_kprintf("Usage: pwm_set pwm1 1 100 50\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_set(device, atoi(argv[2]), atoi(argv[3]), atoi(argv[4]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_set, pwm_set pwm1 1 100 50);

static int pwm_set_oneshot(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 4)
    {
        rt_kprintf("Usage: pwm_set_oneshot pwm1 1 20\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_set_oneshot(device, atoi(argv[2]), atoi(argv[3]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_set_oneshot, pwm_set_oneshot pwm1 1 20);

static int pwm_set_capture(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_set_capture pwm1 1\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_set_capture(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_set_capture, pwm_set_capture pwm1 1);

static int pwm_int_enable(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_int_enable pwm1 1\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_int_enable(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_int_enable, pwm_int_enable pwm1 1);

static int pwm_int_disable(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_int_disable pwm1 1\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_int_disable(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_int_disable, pwm_int_disable pwm1 1);

static int pwm_lock(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_lock pwm1 3\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_lock(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_lock, pwm_lock pwm1 3);

static int pwm_unlock(int argc, char **argv)
{
    int result = 0;
    struct rt_device_pwm *device = RT_NULL;

    if (argc != 3)
    {
        rt_kprintf("Usage: pwm_unlock pwm1 3\n");
        result = -RT_ERROR;
        goto _exit;
    }

    device = (struct rt_device_pwm *)rt_device_find(argv[1]);
    if (!device)
    {
        result = -RT_EIO;
        goto _exit;
    }

    result = rt_pwm_unlock(device, atoi(argv[2]));

_exit:
    return result;
}
MSH_CMD_EXPORT(pwm_unlock, pwm_unlock pwm1 3);

#endif /* FINSH_USING_MSH */
#endif /* RT_USING_FINSH */
