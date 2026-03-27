/**
  * Copyright (c) 2024 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @version V0.0.1
  *
  * Change Logs:
  * Date           Author          Notes
  * 2024-09-29     Su Yuefu      first implementation
  *
  ******************************************************************************
  */

#include <hal_base.h>
#include <rtdevice.h>
#include <rthw.h>
#include <rtthread.h>
#include "config.h"
#include "timer.h"
#include "stdlib.h"

#include "rkaiq_calib.h"
#include "rk_meta_wakeup_param.h"
#include "rk_meta.h"
#include "fast_ae.h"
#include "board.h"

#ifndef SENSOR1_FFRAME_MAX_FPS
#define SENSOR1_FFRAME_MAX_FPS 60
#endif

#ifndef SENSOR2_FFRAME_MAX_FPS
#define SENSOR2_FFRAME_MAX_FPS 60
#endif

#ifdef RT_USING_ISP3

#define PRE_RECORD_DEBUG                    1
#if PRE_RECORD_DEBUG
#define PRE_RECORD_DBG(...)           \
    do {                          \
        rk_kprintf("[PRE_RECORD]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)
#else
#define PRE_RECORD_DBG(...)
#endif

#define PRE_RECORD_INFO(...)          \
    do {                          \
        rk_kprintf("[PRE_RECORD]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)

#define PRE_RECORD_ERR(...)           \
    do {                          \
        rk_kprintf("[PRE_RECORD]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)

#define TARGET_WIDTH              1920
#define TARGET_HEIGHT             1080
#define ISP_PRECAPTURE_FRAME_NUM  5
#define ISP_RTT_MODE_NORMAL       0
#define ISP_RTT_MODE_MULTI_FRAME  1
#define ISP_RTT_MODE_SINGLE_FRAME 2

#define CMD_AP_SUSPEND   0x12345600
#define CMD_AP_RESUME    0x12345601
#define DEVICE_NAME_SIZE (12)

extern struct config_param g_param;
extern struct app_param_info *g_app_param;
static struct rk_isp_dev *ispdev;
extern uint32_t *g_exp_gain;
extern uint32_t *g_exp_time;

enum stream_state
{
    STREAM_RUN,
    STREAM_OK,
    STREAM_NG
};

enum cap_frame_policy
{
    POLICY_EACH,                /* pop every frame to share memory */
    POLICY_DISCARD_INVALID,     /* pop frames that's had been match target AE */
};

struct parameters
{
    char dev_name[DEVICE_NAME_SIZE];
    uint32_t buf_num;
    uint32_t frame_num;
    uint32_t block_num;
    eISP_Bufmemtype buf_type;
    struct rk_camera_pix_format pixformat;
    struct rk_camera_crop_rect crop;
    struct isp_video_requestbuffers reqbuf;
    struct shared_data *share;
    enum rk_camera_hdr_mode hdr_mode;
    enum cap_frame_policy policy;
};

static int pre_buf_num = 0;
static struct parameters options =
{
    .dev_name   = "isp_0",
    .frame_num  = 10,
    /*
     * The buf_num should reserve 1 frame, work-around the final DQBUF moment,
     * isp had already capture the next data.
     */
    .buf_num    = 5,//ISP_PRECAPTURE_FRAME_NUM + 1,
    .block_num  = 10,
    .buf_type   = ISP_BUF_MEM_TYPE_NORMAL,
    .policy     = POLICY_DISCARD_INVALID,
};

struct firstae_param_s
{
    rk_device *dev;
    rk_device *sensor;
    struct shared_data *share;
    rt_sem_t sem;
};

static void firstae_thread(void *arg)
{
    struct firstae_param_s *firstae_param = (struct firstae_param_s *)arg;
    rk_kprintf("%s %d tick %d\n", __FUNCTION__, __LINE__, rt_tick_get());
    set_firstae(firstae_param->dev, firstae_param->sensor, firstae_param->share, &firstae_param->sem);
}


uint32_t rkcif_mbus_pixelcode_to_v4l2(uint32_t pixelcode)
{
    uint32_t pixelformat = V4L2_PIX_FMT_SBGGR10;

    switch (pixelcode)
    {
    case MEDIA_BUS_FMT_SBGGR8_1X8:
        pixelformat = V4L2_PIX_FMT_SBGGR8;
        break;
    case MEDIA_BUS_FMT_SGBRG8_1X8:
        pixelformat = V4L2_PIX_FMT_SGBRG8;
        break;
    case MEDIA_BUS_FMT_SGRBG8_1X8:
        pixelformat = V4L2_PIX_FMT_SGRBG8;
        break;
    case MEDIA_BUS_FMT_SRGGB8_1X8:
        pixelformat = V4L2_PIX_FMT_SRGGB8;
        break;
    case MEDIA_BUS_FMT_SBGGR10_1X10:
        pixelformat = V4L2_PIX_FMT_SBGGR10;
        break;
    case MEDIA_BUS_FMT_SGBRG10_1X10:
        pixelformat = V4L2_PIX_FMT_SGBRG10;
        break;
    case MEDIA_BUS_FMT_SGRBG10_1X10:
        pixelformat = V4L2_PIX_FMT_SGRBG10;
        break;
    case MEDIA_BUS_FMT_SRGGB10_1X10:
        pixelformat = V4L2_PIX_FMT_SRGGB10;
        break;
    case MEDIA_BUS_FMT_SBGGR12_1X12:
        pixelformat = V4L2_PIX_FMT_SBGGR12;
        break;
    case MEDIA_BUS_FMT_SGBRG12_1X12:
        pixelformat = V4L2_PIX_FMT_SGBRG12;
        break;
    case MEDIA_BUS_FMT_SGRBG12_1X12:
        pixelformat = V4L2_PIX_FMT_SGRBG12;
        break;
    case MEDIA_BUS_FMT_SRGGB12_1X12:
        pixelformat = V4L2_PIX_FMT_SRGGB12;
        break;
    default:
        PRE_RECORD_ERR("unsupport pixel format %x\n", pixelcode);
        break;
    }

    return pixelformat;
}

static ret_err_t stream_mode_preview(rk_device *dev, bool is_sample, struct shared_data *share)
{
    struct rk_camera_exp_val exp;
    ret_err_t ret;
    struct isp_video_buf buf;

    buf.listtype = ISP_BUF_LIST_TYPE_MP;
    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_DQBUF, &buf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("dqueue buf fail,stop streaming!\n");
        return ret;
    }

    get_expinfo(buf.frame_id, &exp);
    PRE_RECORD_INFO("L %d, %d, %d, 0x%x, %d, 0x%x, 0x%x, tick:%d\n",
                share->frame_num,
                buf.frame_id,
                buf.timestamp,
                buf.addr,
                buf.bufsize,
                exp.reg_time[0],
                exp.reg_gain[0],
                rt_tick_get());
    share->frame_num++;
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)share, sizeof(struct shared_data));

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_QBUF, &buf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("queue buf[%d] failed on streaming!\n", buf.index);
    }

    return ret;
}

static void sec_camera_init_thread(void *arg)
{
    rt_device_t sensor_assist;
    struct rk_camera_mbus_framefmt mbus_fmt;
    struct rk_camera_dst_config cam_config = {0};
    struct config_param *param = (struct config_param *)arg;

    sensor_assist = rt_device_find(RK_ISP_ASSIST_SUBDEV_NAME);
    if (sensor_assist == RT_NULL)
    {
        PRE_RECORD_ERR("can't find %s device!\n", RK_ISP_ASSIST_SUBDEV_NAME);
        return ;
    }

    secondary_config(&cam_config);

    // 2) set secondary sensor resolution
    if (param->secondary_sensor.width && param->secondary_sensor.height)
    {
        mbus_fmt.width = param->secondary_sensor.width;
        mbus_fmt.height = param->secondary_sensor.height;
        cam_config.maxfps = g_app_param->cam2_max_fps;

        rt_device_control(sensor_assist,
                          RK_DEVICE_CTRL_CID_MATCH_CAM_CONFIG,
                          &cam_config);
    }
    else
    {
        mbus_fmt.width = TARGET_WIDTH;
        mbus_fmt.height = TARGET_HEIGHT;
    }
    mbus_fmt.maxfps = g_app_param->cam2_max_fps;
    rt_device_control(sensor_assist,
                      RK_DEVICE_CTRL_CAMERA_SET_FORMAT,
                      &mbus_fmt);
}

static ret_err_t start_stream(rk_device *dev, struct config_param *param)
{
    ret_err_t ret;
    uint8_t index;
    struct isp_video_requestbuffers reqbuf;
    struct rk_camera_device *subdev;
    struct shared_data *share = (struct shared_data *)param->isp.share_mem_addr;
    rt_sem_t sem;
    struct firstae_param_s firstae_param = {0};
    rt_thread_t tid = RT_NULL;

    ret = rk_device_open(dev, RT_DEVICE_OFLAG_RDWR);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: open isp device failded!\n");
        return ret;
    }

    subdev = ((struct rk_isp_dev *)dev->user_data)->subdev;
    options.pixformat.pixelformat = V4L2_PIX_FMT_NV12;
    options.pixformat.width = subdev->info.mbus_fmt.width;
    options.pixformat.height = subdev->info.mbus_fmt.height;

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_SET_FMT, &options.pixformat);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: set isp format failded!\n");
        return ret;
    }

    //options.hdr_mode = subdev->info.hdr_mode;
    reqbuf.count = options.buf_num;

    reqbuf.type = options.buf_type;
    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_REQBUF, &reqbuf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: request isp buf num failded!\n");
        return ret;
    }

    if (reqbuf.count < options.buf_num)
    {
        PRE_RECORD_ERR("Warning:allocated buf num is:%d, lower than requested num:%d\n",
                   reqbuf.count, options.buf_num);
    }

    for (index = 0; index < reqbuf.count; index++)
    {
        struct isp_video_buf buf;

        buf.index = index;
        ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_QBUF, &buf);
        if (ret != RET_SYS_EOK)
        {
            PRE_RECORD_ERR("Err: qbuf buf[%d] failded!\n", index);
            return ret;
        }
    }

    sem = rt_sem_create("firstae_sem", 0, RT_IPC_FLAG_FIFO);
    firstae_param.dev = dev;
    firstae_param.sensor = &subdev->parent;
    firstae_param.sem = sem;
    firstae_param.share = share;
    tid = rt_thread_create("firstae_thread", firstae_thread, &firstae_param, 4096, RT_THREAD_PRIORITY_MAX / 2, 10);
    if (tid)
        rt_thread_startup(tid);
    rt_kprintf("[thunderboot_time] set camera initial regs enter tick: %u(ms)\n", rt_tick_get());
    ret = rk_device_control(&subdev->parent, RK_DEVICE_CTRL_CAMERA_STREAM_ON, RK_NULL);
    rt_kprintf("[thunderboot_time] set camera initial regs exit tick: %u(ms)\n", rt_tick_get());
    rk_kprintf("%s %d tick %d\n", __FUNCTION__, __LINE__, rt_tick_get());
    ret = rk_semaphore_take(sem, RK_WAITING_FOREVER);
    rk_kprintf("%s %d tick %d\n", __FUNCTION__, __LINE__, rt_tick_get());

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_STREAM_ON, RK_NULL);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: stream on isp failed!\n");
        return ret;
    }
    rt_kprintf("[thunderboot_time] camera stream on enter tick: %u(ms)\n", rt_tick_get());
    ret = rk_device_control(&subdev->parent, RK_DEVICE_CTRL_CAMERA_STREAM_ON_LATE, RK_NULL);
    rt_kprintf("[thunderboot_time] camera stream on exit tick: %u(ms)\n", rt_tick_get());

    start_ae(dev, &subdev->parent);
    share->enable = 1;
    share->complete = STREAM_RUN;
    share->width = subdev->info.mbus_fmt.width;
    share->height = subdev->info.mbus_fmt.height;
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)share, sizeof(struct shared_data));
    if (share->camera_num == 2)
    {
        tid = rt_thread_create("sec_camera_init", sec_camera_init_thread, param, 2048, RT_THREAD_PRIORITY_MAX / 3, 10);
        if (tid)
            rt_thread_startup(tid);
    }

    if (sem)
    {
        rk_semaphore_delete(sem);
        sem = RK_NULL;
    }

    return RET_SYS_EOK;
}
static ret_err_t start_stream_full(rk_device *dev, struct config_param *param)
{
    ret_err_t ret;
    uint8_t index;
    struct isp_video_requestbuffers reqbuf;
    struct rk_camera_device *subdev;
    struct shared_data *share = (struct shared_data *)param->isp.share_mem_addr;
    int on = 1;

    subdev = ((struct rk_isp_dev *)dev->user_data)->subdev;

    ret = rk_device_open(dev, RT_DEVICE_OFLAG_RDWR);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: open isp device failded!\n");
        return ret;
    }

    ret = rk_device_control(dev, RK_DEVICE_CTRL_DEVICE_INIT, RT_NULL);

    options.pixformat.pixelformat = rkcif_mbus_pixelcode_to_v4l2(subdev->info.mbus_fmt.pixelcode);
    options.pixformat.width = param->sensor.width;
    options.pixformat.height = param->sensor.height;

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_SET_FMT, &options.pixformat);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: set isp format failded!\n");
        return ret;
    }

    reqbuf.count = pre_buf_num;

    reqbuf.type = ISP_BUF_MEM_TYPE_COMPACT;
    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_REQBUF, &reqbuf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: request isp buf num failded!\n");
        return ret;
    }

    if (reqbuf.count < pre_buf_num)
    {
        PRE_RECORD_ERR("Warning:allocated buf num is:%d, lower than requested num:%d\n",
                   reqbuf.count, pre_buf_num);
    }

    for (index = 0; index < reqbuf.count; index++)
    {
        struct isp_video_buf buf;

        buf.index = index;
        ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_QBUF, &buf);
        if (ret != RET_SYS_EOK)
        {
            PRE_RECORD_ERR("Err: qbuf buf[%d] failded!\n", index);
            return ret;
        }
    }

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_STREAM_ON, RK_NULL);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("Err: stream on isp failed!\n");
        return ret;
    }
    ret = rk_device_control(&subdev->parent, RK_DEVICE_CTRL_CAMERA_QUICK_STREAM, &on);
    share->enable = 1;
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)share, sizeof(struct shared_data));
    return RET_SYS_EOK;
}

static ret_err_t stream_get_frame(rk_device *dev, bool is_sample, struct shared_data *share)
{
    ret_err_t ret;
    struct isp_video_buf buf;

    buf.listtype = ISP_BUF_LIST_TYPE_MP;
    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_DQBUF, &buf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("dqueue buf fail,stop streaming!\n");
        return ret;
    }

    rt_kprintf("[thunderboot_time] rtt get full resulotion picture tick: %u(ms)\n", rt_tick_get());
    PRE_RECORD_DBG("dqueue buf 0x%x tick %u!\n", buf.addr, rt_tick_get());
    share->pre_buf_addr[share->pre_buf_num] = (uint32_t)buf.addr;
    share->pre_buf_num++;
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)share, sizeof(struct shared_data));

    ret = rk_device_control(dev, RK_DEVICE_CTRL_ISP_QBUF, &buf);
    if (ret != RET_SYS_EOK)
    {
        PRE_RECORD_ERR("queue buf[%d] failed on streaming!\n", buf.index);
    }

    return ret;
}

static void stop_stream(rk_device *dev, struct config_param *param, bool is_normal)
{
    struct shared_data *share = (struct shared_data *)param->isp.share_mem_addr;
    struct rk_isp_dev *rkisp = ispdev;
    bool is_force = true;

    PRE_RECORD_DBG("%s start, tick %d\n", __func__, rt_tick_get());

    if (share->pre_buf_num == 0)
    {
        stop_ae(rkisp);
    }

    rk_device_control(dev, RK_DEVICE_CTRL_ISP_STREAM_OFF, &is_force);

    rk_device_close(dev);

    if (!pre_buf_num || share->pre_buf_num)
    {
        share->complete = is_normal ? STREAM_OK : STREAM_NG;
    }
    if (share->camera_num == 2)
    {
        struct shared_data *share_next = share + 1;
        share_next->enable = share->enable;
        share_next->complete = share->complete;
        share_next->frame_num = share->frame_num;
    }
    rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)share, sizeof(struct shared_data) * share->camera_num);
    PRE_RECORD_DBG("%s end, complete:%d tick %d\n", __func__, share->complete, rt_tick_get());
}

static struct rk_isp_dev *process_find_device(char *name)
{
    char *tmp;
    uint8_t object_id;
    rk_device *dev = RK_NULL;
    struct rk_isp_dev *ispdev = RK_NULL;

    tmp = rk_strstr(name, "_");
    tmp += 1;
    object_id = atoi(tmp);
    PRE_RECORD_DBG("the device to be found:%s, object_id:%d\n", name, object_id);
    dev = rk_find_device(name);
    if (dev)
    {
        ispdev = (struct rk_isp_dev *)dev;
        if (rk_strncmp(name, ispdev->name, rk_strlen(ispdev->name)))
        {
            PRE_RECORD_ERR("Error: the device is not matched!\n");
            RT_ASSERT(RT_FALSE)
        }
    }
    else
    {
        PRE_RECORD_ERR("the device:%s is not found.\n", name);
    }

    return ispdev;

}

#if defined(SOC_RV1103B)
#define MCU_MBOX_TX         HPMCU_MBOX0
#elif defined(SOC_RV1106)
#define MCU_MBOX_TX         MBOX
#else
#error "Please define MCU_MBOX_TX on stream.c"
#endif

static int pre_record(void)
{
    struct config_param *param = &g_param;//(struct config_param *)CONFIG_ADDRESS;
    struct shared_data *share = (struct shared_data *)param->isp.share_mem_addr;
    static rk_device *dev;
    ret_err_t ret;
    bool is_normal = true;
    uint32_t dst_vts;
    int fastae_max_run_frame = 20;
    int mbox_chn;
    int maxfps = SENSOR1_FFRAME_MAX_FPS;
    struct rk_camera_mbus_framefmt mbus_fmt;
    struct rk_camera_device *subdev = NULL;
    struct rk_camera_exp_val exp;
    struct MBOX_CMD_DAT tx_msg;
    struct MBOX_REG *pmbox = MCU_MBOX_TX;
    struct MBOX_CLIENT mbox_cl =
    {
        .name = "mcu-status",
    };

    PRE_RECORD_DBG("share size:%d (%d %d %d)\n",
               sizeof(struct shared_data),
               sizeof(struct isp32_isp_params_cfg),
               sizeof(struct isp32_isp_meas_cfg),
               sizeof(struct isp32_isp_other_cfg));

    options.share = share;
    memset(share, 0, sizeof(*share));
    ispdev = process_find_device(options.dev_name);
    if (!ispdev)
    {
        PRE_RECORD_ERR("find device:%s failed!\n", options.dev_name);
        return RT_EIO;
    }

    share->enable = 0;
    share->frame_num = 0;
    share->complete = STREAM_NG;
    dev = &ispdev->parent.parent;
    ret = start_stream(dev, param);
    if (ret != RET_SYS_EOK)
    {
        is_normal = false;
        goto OUT;
    }

    mbox_chn = MBOX_CH_1;

    HAL_MBOX_Init(pmbox, false);

    ret = HAL_MBOX_RegisterClient(pmbox, mbox_chn, &mbox_cl);
    RT_ASSERT(ret == HAL_OK);
    pmbox->B2A_INTEN |= BIT(mbox_chn);

    fastae_max_run_frame = fast_ae_get_max_frame();
    do
    {
        //use yuv dqbuf/qbuf
        ret = stream_mode_preview(dev, true, share);
        if (ret != RET_SYS_EOK)
        {
            is_normal = false;
            break;
        }

        if (isae_match() || isae_over_range())
            break;

        rt_hw_cpu_dcache_ops(RT_HW_CACHE_INVALIDATE, (void *)share, sizeof(struct shared_data));

    }
    while (share->frame_num < fastae_max_run_frame);
    rt_kprintf("[thunderboot_time] fastae is match tick: %u(ms)\n", rt_tick_get());
    if (share->frame_num < g_app_param->rtt_stream_on_threshold)
        pre_buf_num = g_app_param->rtt_stream_buf_cnt;

    float src_exp_time, src_exp_gain, dst_exp_time, dst_exp_gain, max_exp_time;
    uint32_t src_exp_time_reg = 0, src_exp_gain_reg = 0,dst_exp_gain_reg = 0, dst_exp_time_reg = 0;
    src_exp_gain_reg = *g_exp_gain;
    src_exp_time_reg = *g_exp_time;
    /*
     * exposure time of one line = hts / pclk
     * exposure time = exp_time_reg * (hts / pclk)
     */
    src_exp_time = (float)(*g_exp_time) * 30.0 * 24.0 / 24000000.0;
    src_exp_gain = expf((float)(*g_exp_gain) * logf(2) / 64.0);

    if(dst_exp_gain_reg < 0x26)
        dst_exp_gain_reg = 0x26;

    dst_exp_time_reg = (uint32_t)(src_exp_time * 96000000.0 / 2000.0);
    /*
     * gain = 2^(gain_reg / 64)
     * gain = e^(gain_reg * loge(2) / 64)
     */
    max_exp_time = 1598.0 * 2000.0 / 96000000.0;
    if (dst_exp_time_reg > 1598) {
        dst_exp_time = max_exp_time;
        dst_exp_gain = src_exp_time * src_exp_gain / max_exp_time;
        dst_exp_time_reg = 1598;
        dst_exp_gain_reg = (uint32_t)(logf(dst_exp_gain) / logf(2) * 64);
        rt_kprintf("exposure time is excceed max value fix max %d\n", 1598);
    } else {
        dst_exp_time_reg = (uint32_t)(src_exp_time * 96000000.0 / 2000.0);
        dst_exp_gain_reg = src_exp_gain_reg;
        dst_exp_time = (float)dst_exp_time_reg * 2000.0 / 96000000.0;
        dst_exp_gain = src_exp_gain;
    }
    share->exp_time_reg[0] = dst_exp_time_reg;
    share->exp_gain_reg[0] = dst_exp_gain_reg;
    share->exp_time[0] = FLOAT2FIX(dst_exp_time);
    share->exp_gain[0] = FLOAT2FIX(dst_exp_gain);
    rt_kprintf("----src reg gain/time 0x%x/0x%x\n", src_exp_gain_reg, src_exp_time_reg);
    rt_kprintf("----src gain/time 0x%x/0x%x\n", FLOAT2FIX(src_exp_gain), FLOAT2FIX(src_exp_time));
    rt_kprintf("----dst reg gain/time 0x%x, 0x%x\n", dst_exp_gain_reg, dst_exp_time_reg);
    rt_kprintf("----dst gain/time 0x%x, 0x%x\n", share->exp_gain[0], share->exp_time[0]);

OUT:
    PRE_RECORD_DBG("rtt stream on buf cnt %d rtt stream on threshold %d\n", g_app_param->rtt_stream_buf_cnt, g_app_param->rtt_stream_on_threshold);
    stop_stream(dev, param, is_normal);

retry:
    //TODO switch sensor resolution and set exposure
    if (param->sensor.width && param->sensor.height)
    {
        mbus_fmt.width = param->sensor.width;
        mbus_fmt.height = param->sensor.height;
    }
    else
    {
        mbus_fmt.width = TARGET_WIDTH;
        mbus_fmt.height = TARGET_HEIGHT;
    }

    if (pre_buf_num)
        mbus_fmt.maxfps = maxfps;
    else
        mbus_fmt.maxfps = g_app_param->cam1_max_fps;

    subdev = ((struct rk_isp_dev *)dev->user_data)->subdev;
    rt_kprintf("[thunderboot_time] camera switch resolution enter tick: %u(ms)\n", rt_tick_get());
    rt_device_control(&subdev->parent,
                      RK_DEVICE_CTRL_CAMERA_SET_FORMAT,
                      &mbus_fmt);
    rt_kprintf("[thunderboot_time] camera switch resolution exit tick: %u(ms)\n", rt_tick_get());

    dst_vts = (param->sensor.dst_vts * mbus_fmt.maxfps) / g_app_param->cam1_max_fps;
    rt_device_control(&subdev->parent,
                      RK_DEVICE_CTRL_CAMERA_SET_VTS_VAL,
                      &dst_vts);

    if (share->complete != STREAM_NG)
    {

        if (subdev->info.hdr_mode == NO_HDR)
        {
            exp.reg_time[0] = (share->exp_time_reg[0] * mbus_fmt.maxfps) / g_app_param->cam1_max_fps;
            exp.reg_gain[0] = share->exp_gain_reg[0];
            exp.dcg_mode[0] = share->dcg_mode[0];
        }
        else if (subdev->info.hdr_mode == HDR_X2)
        {
            exp.reg_time[0] = (share->exp_time_reg[0] * mbus_fmt.maxfps) / g_app_param->cam1_max_fps;
            exp.reg_time[1] = (share->exp_time_reg[1] * mbus_fmt.maxfps) / g_app_param->cam1_max_fps;
            exp.reg_gain[0] = share->exp_gain_reg[0];
            exp.reg_gain[1] = share->exp_gain_reg[1];
            exp.dcg_mode[0] = share->dcg_mode[0];
            exp.dcg_mode[1] = share->dcg_mode[1];
        }
        rt_device_control(&subdev->parent,
                          RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL,
                          &exp);
    }

    // SET SECONDARY SENSOR CONFIG
    if (share->camera_num == 2)
    {
        rt_device_t sensor_assist;
        struct shared_data *share_next_camera = share + 1;

        // 1) find secondary sensor device
        sensor_assist = rt_device_find(RK_ISP_ASSIST_SUBDEV_NAME);
        if (sensor_assist == RT_NULL)
        {
            PRE_RECORD_ERR("can't find %s device!\n", RK_ISP_ASSIST_SUBDEV_NAME);
            return RT_ERROR;
        }

        // 3) set secondary sensor vts
        dst_vts = param->secondary_sensor.dst_vts;
        rt_device_control(sensor_assist,
                          RK_DEVICE_CTRL_CAMERA_SET_VTS_VAL,
                          &dst_vts);

        // 4) set secondary sensor exp
        if (share->complete != STREAM_NG)
        {
            if (subdev->info.hdr_mode == NO_HDR)
            {
                exp.reg_time[0] = share_next_camera->exp_time_reg[0];
                exp.reg_gain[0] = share_next_camera->exp_gain_reg[0];
                exp.dcg_mode[0] = share_next_camera->dcg_mode[0];
            }
            else if (subdev->info.hdr_mode == HDR_X2)
            {
                exp.reg_time[0] = share_next_camera->exp_time_reg[0];
                exp.reg_time[1] = share_next_camera->exp_time_reg[1];
                exp.reg_gain[0] = share_next_camera->exp_gain_reg[0];
                exp.reg_gain[1] = share_next_camera->exp_gain_reg[1];
                exp.dcg_mode[0] = share_next_camera->dcg_mode[0];
                exp.dcg_mode[1] = share_next_camera->dcg_mode[1];
            }
            rt_device_control(sensor_assist,
                              RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL,
                              &exp);
            if (ret != RT_EOK)
            {
                PRE_RECORD_ERR("set assist sensor exp failed! ret is :%d\n", ret);
                return ret;
            }
        }
    }

    if (pre_buf_num)
    {
        ret = start_stream_full(dev, param);
        do
        {
            ret = stream_get_frame(dev, true, share);
            if (ret != RET_SYS_EOK)
            {
                is_normal = false;
                break;
            }
        }
        while (share->pre_buf_num < pre_buf_num);
        stop_stream(dev, param, true);
        if (g_app_param->cam1_max_fps != maxfps) {
            pre_buf_num = 0;
            maxfps = g_app_param->cam1_max_fps;
            goto retry;
        }
    }
    PRE_RECORD_INFO("will go to wfi, tick:%d!\n", rt_tick_get());
    tx_msg.CMD = 0x0000f00d;
    tx_msg.DATA = 0xdeadbeef;
    rt_hw_interrupt_disable();
    HAL_DCACHE_CleanInvalidate();
    HAL_DCACHE_Disable();
    ret = HAL_MBOX_SendMsg2(pmbox, mbox_chn, &tx_msg, false);
    sysTick_stop();
    while (1)
        asm("wfi");

    return RT_EOK;
}

INIT_APP_EXPORT(pre_record);

#ifdef RT_USING_FINSH
#include <finsh.h>
MSH_CMD_EXPORT(pre_record, pre record. e.g: pre_record);
#endif

#endif
