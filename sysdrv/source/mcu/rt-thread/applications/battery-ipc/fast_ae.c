/**
  * Copyright (c) 2022 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @version V0.0.1
  *
  * Change Logs:
  * Date           Author          Notes
  * 2022-07-07     ISP Team      first implementation
  *
  ******************************************************************************
  */

#include <stdio.h>
#include <string.h>
#include <rtthread.h>

#include "fast_ae.h"
#include "rkaiq_calib.h"
#include "rkaiq_parse_iq.h"

#define FASTAE_DEBUG                    0
#if FASTAE_DEBUG
#define FASTAE_DBG(...)           \
    do {                          \
        rk_kprintf("[FASTAE]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)
#else
#define FASTAE_DBG(...)
#endif

#define FASTAE_INFO(...)          \
    do {                          \
        rk_kprintf("[FASTAE]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)

#define FASTAE_ERR(...)           \
    do {                          \
        rk_kprintf("[FASTAE]: "); \
        rk_kprintf(__VA_ARGS__);  \
    } while (0)

#define CHECK_NULL_POINTER(x) do {  \
    if (x == RT_NULL) {             \
        rt_kprintf("[FASTAE]: alloc failed!\n");  \
    }} while (0)

#define SET_EXP_ON_VS

static struct shared_data *gShare;
static struct shared_data *gShare_next_camera;
static struct iq_config *gConfig = RT_NULL;
static struct expval_log gInitExp;

static CamCalibDbProj_t *g_main_camproj = RT_NULL;
static CamCalibDbV2Context_t *g_main_calib = RT_NULL;
static struct fastae_init_info *g_fastae_init = RT_NULL;
static struct sensor_init_cfg *g_sensor_init = RT_NULL;
struct app_param_info *g_app_param = RT_NULL;

static CamCalibDbProj_t *g_secondary_camproj = RT_NULL;
static CamCalibDbV2Context_t *g_secondary_calib = RT_NULL;
static struct sensor_init_cfg *g_secondary_sensor_init = RT_NULL;

static int32_t *g_is_bw_night = RT_NULL;
static int  g_is_ie_effect;
static int  g_fastae_max_run_frame = 20;
static bool g_ae_md = false;
static int g_day_or_night = DayORNight_STATUS_INVALID;
static rk_aiq_iq_bin_mode_t g_iq_bin_mode;
static struct isp_awbgain_cfg g_rtt_awbgain;

#ifdef RT_USING_RK_AOV
static bool g_use_conv_exp = false;
#endif

extern struct config_param g_param;

int32_t set_night_mode
(
    struct fastae_init_info   *fastae_init,
    struct sensor_init_cfg    *sensor_init
);

int32_t ircut_switch(struct sensor_init_cfg *sensor_init, IR_STATUS_t on_or_off)
{
    if (on_or_off == IR_STATUS_CUT_OFF)
    {
        cam_cfg_gpio_func(sensor_init->ircut_a.gpio_index, sensor_init->ircut_a.gpio_func);
        cam_cfg_gpio_func(sensor_init->ircut_b.gpio_index, sensor_init->ircut_b.gpio_func);
    }
    else if (on_or_off == IR_STATUS_CUT_ON)
    {
        cam_cfg_gpio_func(sensor_init->ircut_a.gpio_index, sensor_init->ircut_b.gpio_func);//exchange a&b
        cam_cfg_gpio_func(sensor_init->ircut_b.gpio_index, sensor_init->ircut_a.gpio_func);
    }

    return 0;
}

int32_t soft_lux_night_mode(struct iq_config *config, struct fastae_info *ae_inf)
{
    if (g_fastae_init->night_mode == NIGHT_IR_ON || g_fastae_init->night_mode == NIGHT_WHITE_ON)
    {
        return 0;
    }

    if (ae_inf->day_or_night == DayORNight_STATUS_NIGHT)
    {
        g_day_or_night = DayORNight_STATUS_NIGHT;
        ae_inf->day_or_night = DayORNight_STATUS_INVALID;

        if (g_fastae_init->night_mode == NIGHT_IR_AUTO)
        {
            g_is_ie_effect = 1;
            *g_is_bw_night = BW_MODE;
            ircut_switch(g_sensor_init, IR_STATUS_CUT_ON);
        }
        else
        {
            *g_is_bw_night = COLOR_MODE;
            ircut_switch(g_sensor_init, IR_STATUS_CUT_OFF);
        }

        set_night_mode(g_fastae_init, g_sensor_init);
    }
    else
    {
        g_day_or_night = DayORNight_STATUS_DAY;
        ae_inf->day_or_night = DayORNight_STATUS_INVALID;
        *g_is_bw_night = COLOR_MODE;
        ircut_switch(g_sensor_init, IR_STATUS_CUT_OFF);
    }

    //rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)g_is_bw_night, sizeof(*g_is_bw_night));

    return 0;
}

static rt_err_t sensor_vs_cb(rt_device_t dev, rt_size_t size)
{
    if (gConfig)
    {
        gConfig->frame_id = (uint32_t)size;

#ifdef SET_EXP_ON_VS
        rt_sem_release(gConfig->exp_sem);
#endif

        FASTAE_DBG("frm_id %d\n", gConfig->frame_id);
    }

    return 0;
}

static void set_exposure(struct iq_config *config, bool set_to_sensor, FIXED new_exposure,
                         struct rk_camera_exp_val *reg_exp)
{
    rt_mutex_take(config->exp_mutex, RT_WAITING_FOREVER);
    config->expval.set_to_sensor = set_to_sensor;
    config->expval.exposure = new_exposure;
    rt_memcpy(&config->expval.exp, reg_exp, sizeof(*reg_exp));
    rt_mutex_release(config->exp_mutex);

    if (set_to_sensor == false)
    {
        rt_sem_release(config->exp_sem);
    }
    else
    {
#ifndef SET_EXP_ON_VS
        rt_sem_release(config->exp_sem);
#endif
    }
}

static void map_secondary_ae()
{
    // 1. CTRL IRCUT
    if (*g_is_bw_night == BW_MODE)
        ircut_switch(g_secondary_sensor_init, IR_STATUS_CUT_ON);
    else
        ircut_switch(g_secondary_sensor_init, IR_STATUS_CUT_OFF);

    // 2. PARSE AE PARAMS
    struct fastae_init_info *fastae_sec_init = rt_calloc(1, sizeof(struct fastae_init_info));
    CHECK_NULL_POINTER(fastae_sec_init);

    fastae_sec_init->is_hdr = (g_app_param->cam2_hdr > NO_HDR) ? true : false;
    if (*g_is_bw_night == BW_MODE)
    {
        if (g_iq_bin_mode == FULL_IQ_BIN_MODE || g_iq_bin_mode == INVALID_IQ_BIN_MODE)
        {
            rkaiq_get_calib(g_secondary_camproj, g_secondary_calib, g_app_param->cam2_hdr, "night");
        }
        else if (g_iq_bin_mode == RTT_IQ_BIN_MODE)
        {
            struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
            struct sensor_iq_info *iq = (struct sensor_iq_info *)(metahead_p->load + SENSOR_IQ_BIN_OFFSET);
            rkaiq_get_rttbin((void *)(iq->secondary_sensor_iq_offset), g_secondary_calib, g_app_param->cam2_hdr, "night");
        }
    }
    parse_ae_params(g_secondary_calib, fastae_sec_init, g_iq_bin_mode);

    // 3. INIT SENSOR CONFIG
    rt_device_t sensor_secondary;
    struct rk_camera_exp_info exp_info = {0};

    sensor_secondary = rt_device_find(RK_ISP_ASSIST_SUBDEV_NAME);
    if (sensor_secondary == RT_NULL)
    {
        FASTAE_ERR("can't find %s device!\n", RK_ISP_ASSIST_SUBDEV_NAME);
        return ;
    }

    rt_device_control(sensor_secondary, RK_DEVICE_CTRL_CAMERA_GET_EXP_INF, &exp_info);
    fastae_sec_init->fps_aiq = exp_info.dst_pix_clk / (exp_info.dst_hts * exp_info.dst_vts);
    fastae_sec_init->hts_aiq = exp_info.dst_hts;
    fastae_sec_init->vts_aiq = exp_info.dst_vts;
    FASTAE_INFO("fps/hts/vts: SecAIQ=[%d, %d, %d]\n", fastae_sec_init->fps_aiq, fastae_sec_init->hts_aiq, fastae_sec_init->vts_aiq);

    // 4. CONFIG AE PARAMS
    FastAeSecInit(fastae_sec_init);
    rt_free(fastae_sec_init);

    // 5. CALC MAP EXPOSURE
    struct fastae_info ae_sec_inf = {0};
    ae_sec_inf.exp_aiq.time[0] = gShare->exp_time[0];
    ae_sec_inf.exp_aiq.gain[0] = gShare->exp_gain[0];
    ae_sec_inf.exp_aiq.isp_gain[0] = gShare->exp_isp_dgain[0];
    ae_sec_inf.exp_aiq.time[1] = gShare->exp_time[1];
    ae_sec_inf.exp_aiq.gain[1] = gShare->exp_gain[1];
    ae_sec_inf.exp_aiq.isp_gain[1] = gShare->exp_isp_dgain[1];

    FastAeMainMapSec(&ae_sec_inf);
    g_param.secondary_sensor.dst_vts = ae_sec_inf.dst_vts;

    if (gShare_next_camera->hdr_mode == NO_HDR)
    {
        FASTAE_INFO("SecAiqExp: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                    FixPrint(ae_sec_inf.exp_aiq.time[0], 5),
                    FixPrint(ae_sec_inf.exp_aiq.gain[0], 3),
                    FixPrint(ae_sec_inf.exp_aiq.isp_gain[0], 3),
                    ae_sec_inf.reg_exp_aiq.reg_time[0],
                    ae_sec_inf.reg_exp_aiq.reg_gain[0],
                    ae_sec_inf.reg_exp_aiq.dcg_mode[0]);
    }
    else
    {
        FASTAE_INFO("SecAiqExp: sFrame: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                    FixPrint(ae_sec_inf.exp_aiq.time[0], 5),
                    FixPrint(ae_sec_inf.exp_aiq.gain[0], 3),
                    FixPrint(ae_sec_inf.exp_aiq.isp_gain[0], 3),
                    ae_sec_inf.reg_exp_aiq.reg_time[0],
                    ae_sec_inf.reg_exp_aiq.reg_gain[0],
                    ae_sec_inf.reg_exp_aiq.dcg_mode[0]);
        FASTAE_INFO("SecAiqExp: lFrame: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                    FixPrint(ae_sec_inf.exp_aiq.time[1], 5),
                    FixPrint(ae_sec_inf.exp_aiq.gain[1], 3),
                    FixPrint(ae_sec_inf.exp_aiq.isp_gain[1], 3),
                    ae_sec_inf.reg_exp_aiq.reg_time[1],
                    ae_sec_inf.reg_exp_aiq.reg_gain[1],
                    ae_sec_inf.reg_exp_aiq.dcg_mode[1]);
    }

    gShare_next_camera->exp_time[0] = ae_sec_inf.exp_aiq.time[0];
    gShare_next_camera->exp_gain[0] = ae_sec_inf.exp_aiq.gain[0];
    gShare_next_camera->exp_isp_dgain[0] = ae_sec_inf.exp_aiq.isp_gain[0];
    gShare_next_camera->exp_time_reg[0] = ae_sec_inf.reg_exp_aiq.reg_time[0];
    gShare_next_camera->exp_gain_reg[0] = ae_sec_inf.reg_exp_aiq.reg_gain[0];
    gShare_next_camera->dcg_mode[0] = ae_sec_inf.reg_exp_aiq.dcg_mode[0];

    gShare_next_camera->exp_time[1] = ae_sec_inf.exp_aiq.time[1];
    gShare_next_camera->exp_gain[1] = ae_sec_inf.exp_aiq.gain[1];
    gShare_next_camera->exp_isp_dgain[1] = ae_sec_inf.exp_aiq.isp_gain[1];
    gShare_next_camera->exp_time_reg[1] = ae_sec_inf.reg_exp_aiq.reg_time[1];
    gShare_next_camera->exp_gain_reg[1] = ae_sec_inf.reg_exp_aiq.reg_gain[1];
    gShare_next_camera->dcg_mode[1] = ae_sec_inf.reg_exp_aiq.dcg_mode[1];

}

static void calculate_ae(struct iq_config *config, struct rkisp_stats_buffer *luma_buf, FIXED *last_exposure, FIXED *isp_dgain)
{
    struct fastae_info ae_inf = {0};

    if (config->is_match || config->is_over_range)
    {

#ifdef RT_USING_RK_AOV
        if (luma_buf->frame_id == 2)
            config->conv_num = 2;
        else
            config->conv_num++;
#endif
        return;
    }

    ae_inf.stats = luma_buf;
    ae_inf.current_exposure = *last_exposure;

#ifdef RT_USING_RK_AOV
    ae_inf.use_old_exp = g_use_conv_exp;
#endif

    //record the initial state of ir!
    if (*g_is_bw_night == BW_MODE && g_fastae_init->night_mode == NIGHT_IR_AUTO)
        ae_inf.ir_state = IR_STATUS_CUT_ON;
    else
        ae_inf.ir_state = IR_STATUS_CUT_OFF;

    FastAeRun(&ae_inf);

    if (ae_inf.day_or_night)
        // day_or_night only works on NIGHT_WHITE(IR)_AUTO for ALS_TYPE_NONE
        soft_lux_night_mode(config, &ae_inf);

    gShare->exp_time[0] = ae_inf.exp_aiq.time[0];
    gShare->exp_gain[0] = ae_inf.exp_aiq.gain[0];
    gShare->exp_isp_dgain[0] = ae_inf.exp_aiq.isp_gain[0];
    gShare->exp_time_reg[0] = ae_inf.reg_exp_aiq.reg_time[0];
    gShare->exp_gain_reg[0] = ae_inf.reg_exp_aiq.reg_gain[0];
    gShare->dcg_mode[0] = ae_inf.reg_exp_aiq.dcg_mode[0];
    isp_dgain[0] = ae_inf.exp.isp_gain[0];

    gShare->exp_time[1] = ae_inf.exp_aiq.time[1];
    gShare->exp_gain[1] = ae_inf.exp_aiq.gain[1];
    gShare->exp_isp_dgain[1] = ae_inf.exp_aiq.isp_gain[1];
    gShare->exp_time_reg[1] = ae_inf.reg_exp_aiq.reg_time[1];
    gShare->exp_gain_reg[1] = ae_inf.reg_exp_aiq.reg_gain[1];
    gShare->dcg_mode[1] = ae_inf.reg_exp_aiq.dcg_mode[1];
    isp_dgain[1] = ae_inf.exp.isp_gain[1];

    g_param.sensor.dst_vts = ae_inf.dst_vts;

    if (ae_inf.is_match || ae_inf.is_over_range)
    {
        if (gShare->hdr_mode == NO_HDR)
        {
            FASTAE_INFO("MainAiqExp: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                        FixPrint(ae_inf.exp_aiq.time[0], 5),
                        FixPrint(ae_inf.exp_aiq.gain[0], 3),
                        FixPrint(ae_inf.exp_aiq.isp_gain[0], 3),
                        ae_inf.reg_exp_aiq.reg_time[0],
                        ae_inf.reg_exp_aiq.reg_gain[0],
                        ae_inf.reg_exp_aiq.dcg_mode[0]);
        }
        else
        {
            FASTAE_INFO("MainAiqExp: sFrame: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                        FixPrint(ae_inf.exp_aiq.time[0], 5),
                        FixPrint(ae_inf.exp_aiq.gain[0], 3),
                        FixPrint(ae_inf.exp_aiq.isp_gain[0], 3),
                        ae_inf.reg_exp_aiq.reg_time[0],
                        ae_inf.reg_exp_aiq.reg_gain[0],
                        ae_inf.reg_exp_aiq.dcg_mode[0]);
            FASTAE_INFO("MainAiqExp: lFrame: T=%s,G=%s,ispG=%s,regT=%d,regG=%d,dcg=%d\n",
                        FixPrint(ae_inf.exp_aiq.time[1], 5),
                        FixPrint(ae_inf.exp_aiq.gain[1], 3),
                        FixPrint(ae_inf.exp_aiq.isp_gain[1], 3),
                        ae_inf.reg_exp_aiq.reg_time[1],
                        ae_inf.reg_exp_aiq.reg_gain[1],
                        ae_inf.reg_exp_aiq.dcg_mode[1]);
        }

#ifdef RT_USING_RK_AOV
        if (luma_buf->frame_id == 1)
        {
            config->conv_num = 2;
            int iso = FIX2INT(FIX_MUL(ae_inf.exp.gain[0], ae_inf.exp.isp_gain[0])) * 50;
            int meanluma = FIX2INT(ae_inf.mean_luma) << 4; // 8bit to 12bit
            struct fastae_md_param md_param = {0};
            md_param.width = gShare->width;
            md_param.height = gShare->height;
            md_param.last_hidif = g_fastae_init->last_hidif;
            md_param.last_lodif = g_fastae_init->last_lodif;

            get_tnr_sigma(g_main_calib, 0, iso, meanluma, &md_param, g_iq_bin_mode);

            uint8_t ret = FastAeMd(g_fastae_init->conv_ae_stats, &luma_buf->stats, md_param);
            g_ae_md = (ret == 1) ? true : false;
        }

        // motion detection, judge whether update 2a result
        if (g_ae_md == true)
        {
            struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
            struct ae_awb_init_cfg *ae_awb = (struct ae_awb_init_cfg *)(metahead_p->load + AE_TABLE_OFFSET);

            ae_awb->rtt_res.exp = ae_inf.new_exposure;
            ae_awb->rtt_res.reg_time = ae_inf.reg_exp.reg_time[0];
            ae_awb->rtt_res.reg_gain = ae_inf.reg_exp.reg_gain[0];
            ae_awb->rtt_res.dcg_mode = ae_inf.reg_exp.dcg_mode[0];
            for (int i = 0; i < AE_GRID_STATS - 1; i++)
            {
                ae_awb->rtt_res.ae_stats[i] = ((uint32_t)luma_buf->stats.rawae1.data[2 * i].channelg_xy & 0xffff) |
                                              ((uint32_t)luma_buf->stats.rawae1.data[2 * i + 1].channelg_xy << 16) ;
            }
            ae_awb->rtt_res.ae_stats[AE_GRID_STATS - 1] = luma_buf->stats.rawae1.data[ISP_RAWAEBIG_MEAN_NUM - 1].channelg_xy;
            ae_awb->rtt_res.day_or_night = g_day_or_night;
            //clear last result
            ae_awb->rtt_res.last_hidif_0 = 0;
            ae_awb->rtt_res.last_hidif_1 = 0;
            ae_awb->rtt_res.last_lodif_0 = 0;
            ae_awb->rtt_res.last_lodif_1 = 0;
        }
        else
        {
            struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
            struct ae_awb_init_cfg *ae_awb = (struct ae_awb_init_cfg *)(metahead_p->load + AE_TABLE_OFFSET);
            ae_awb->rtt_res.last_hidif_0 = luma_buf->stats.baytnr.sum_hidif_0;
            ae_awb->rtt_res.last_hidif_1 = luma_buf->stats.baytnr.sum_hidif_1;
            ae_awb->rtt_res.last_lodif_0 = luma_buf->stats.baytnr.sum_lodif_0;
            ae_awb->rtt_res.last_lodif_1 = luma_buf->stats.baytnr.sum_lodif_1;
        }

        set_exposure(config, true, ae_inf.new_exposure, &ae_inf.reg_exp);
#endif

        config->is_match = ae_inf.is_match;
        config->is_over_range = ae_inf.is_over_range;
        FASTAE_DBG("ae is %s\n", config->is_match > 0 ? "match" : "over range");

        return;

    }

    if (ae_inf.current_exposure != ae_inf.new_exposure)
        set_exposure(config, true, ae_inf.new_exposure, &ae_inf.reg_exp);

}

static void calculate_awb(struct iq_config *config, struct rkisp_params_buffer *isp_params, struct rkisp_stats_buffer *stats_buf, FIXED isp_dgain)
{
    // CALC FAST AWB
    if (g_is_ie_effect != 1)
    {
        //struct rkisp_params_buffer isp_params = { 0 };
        calc_wbgain(&isp_params->params.awbgain, &stats_buf->stats.rawawb);

        g_rtt_awbgain.gb = isp_params->params.awbgain.gb;
        g_rtt_awbgain.gr = isp_params->params.awbgain.gr;
        g_rtt_awbgain.b = isp_params->params.awbgain.b;
        g_rtt_awbgain.r = isp_params->params.awbgain.r;

        isp_params->params.awbgain.r = MAX(1 << 8, ((FIXED)isp_params->params.awbgain.r * isp_dgain) >> 16);
        isp_params->params.awbgain.gr = MAX(1 << 8, ((FIXED)isp_params->params.awbgain.gr * isp_dgain) >> 16);
        isp_params->params.awbgain.gb = MAX(1 << 8, ((FIXED)isp_params->params.awbgain.gb * isp_dgain) >> 16);
        isp_params->params.awbgain.b = MAX(1 << 8, ((FIXED)isp_params->params.awbgain.b * isp_dgain) >> 16);

        //cancel the 1~5_st frame awb in soft_lux when last_state is gray
        if (*g_is_bw_night == BW_MODE)
        {
            isp_params->params.awbgain.gb = (256 * isp_dgain) >> 16;
            isp_params->params.awbgain.gr = (256 * isp_dgain) >> 16;
            isp_params->params.awbgain.b = (256 * isp_dgain) >> 16;
            isp_params->params.awbgain.r = (256 * isp_dgain) >> 16;
        }

    }
    else
    {
        g_rtt_awbgain.gb = 256;
        g_rtt_awbgain.gr = 256;
        g_rtt_awbgain.b = 256;
        g_rtt_awbgain.r = 256;

        isp_params->params.awbgain.gb = (256 * isp_dgain) >> 16;
        isp_params->params.awbgain.gr = (256 * isp_dgain) >> 16;
        isp_params->params.awbgain.b = (256 * isp_dgain) >> 16;
        isp_params->params.awbgain.r = (256 * isp_dgain) >> 16;
    }

    isp_params->module_cfg_update |= ISP_MODULE_AWBGAIN;
    set_params(config->isp, isp_params);

#ifdef RT_USING_RK_AOV
    if (g_ae_md)
    {
        struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
        struct ae_awb_init_cfg *ae_awb = (struct ae_awb_init_cfg *)(metahead_p->load + AE_TABLE_OFFSET);
        ae_awb->rtt_res.awb_gain = (isp_params->params.awbgain.r & 0xffff) | (isp_params->params.awbgain.b << FIXEDPREC & 0xffff0000);
        ae_awb->rtt_res.isp_dgain = isp_dgain;
    }
#endif

    FASTAE_DBG("calcwbgain: 0x%x 0x%x 0x%x 0x%x,ispdgain=0x%x\n",
               isp_params->params.awbgain.r, isp_params->params.awbgain.gr,
               isp_params->params.awbgain.gb, isp_params->params.awbgain.b, isp_dgain);
}

int32_t get_fastawb_params(struct isp_awbgain_cfg *rtt_awbgain)
{
    // calc awbgain for kernel 0st frame
    rtt_awbgain->gb = MAX(256, g_rtt_awbgain.gb);
    rtt_awbgain->gr = MAX(256, g_rtt_awbgain.gr);
    rtt_awbgain->b = MAX(256, g_rtt_awbgain.b);
    rtt_awbgain->r = MAX(256, g_rtt_awbgain.r);

    return 0;
}

static void exp_thread(void *arg)
{
    struct expval_log *expval;
    struct iq_config *config = arg;
    uint32_t explog_wid = 0;
    bool set_exp = true;

    rt_device_set_rx_indicate(config->isp, sensor_vs_cb);
    while (!config->exp_exit)
    {
        expval = NULL;
        rt_sem_take(config->exp_sem, RT_WAITING_FOREVER);

        // set 2nd init exp only for soft als
        if (config->frame_id == 1 && set_exp == true && g_fastae_init->als_type == ALS_TYPE_NONE)
        {
            set_exp = false;
            static struct expval_log soft_als_exp;
            soft_als_exp.exposure = g_fastae_init->start_exp[1];
            soft_als_exp.exp.reg_time[0] =  g_fastae_init->start_reg_time[1];
            soft_als_exp.exp.reg_gain[0] = g_fastae_init->start_reg_gain[1];
            soft_als_exp.exp.dcg_mode[0] = g_fastae_init->start_dcg_mode[1];
            set_exposure(config, true, soft_als_exp.exposure, &soft_als_exp.exp);
        }

        if (config->exp_exit)
            break;
        rt_mutex_take(config->exp_mutex, RT_WAITING_FOREVER);
        if (config->expval.exp.reg_time[0] /*&& config->expval.exp.reg_gain[0]*/)
        {
            explog_wid = (config->explog_wid + 1) % EXP_VAL_LOG_NUM;
            config->explog_wid = explog_wid;
            expval = &config->explog[explog_wid];
            rt_memcpy(expval, &config->expval, sizeof(*expval));
            rt_memset(&config->expval, 0, sizeof(*expval));
            expval->frame_id = EXP_INVALID_VAL;
        }
        rt_mutex_release(config->exp_mutex);

        if (expval)
        {
            if (expval->set_to_sensor)
                rt_device_control(config->sensor,
                                  RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL,
                                  &expval->exp);

            expval->frame_id = config->frame_id;
            FASTAE_DBG("%d: reg: %x, %x, %x, %x, %x, %x\n", expval->frame_id,
                       expval->exp.reg_time[0], expval->exp.reg_gain[0],
                       expval->exp.reg_time[1], expval->exp.reg_gain[1],
                       expval->exp.reg_time[2], expval->exp.reg_gain[2]);
        }
    }

    FASTAE_DBG("exp thread exit\n");
    rt_sem_release(config->exp_exitsem);
}

static void stat_thread(void *arg)
{
    struct iq_config *config = arg;
    struct rkisp_stats_buffer *stats_buf;
    struct rk_camera_exp_info exp_info;
    uint32_t rid, i, frm_id, fnd_flg, exp_dly;
    bool first_exp;
    FIXED last_exposure = 0, isp_dgain[3] = {FIX_ONE, FIX_ONE, FIX_ONE};

    stats_buf = rt_calloc(1, sizeof(struct rkisp_stats_buffer));
    CHECK_NULL_POINTER(stats_buf);

    rt_memset(&exp_info, 0, sizeof(exp_info));
    rt_device_control(config->sensor,
                      RK_DEVICE_CTRL_CAMERA_GET_EXP_INF,
                      &exp_info);
    if (exp_info.time_valid_delay != exp_info.gain_valid_delay)
    {
        FASTAE_ERR("sensor: time_valid_delay is not equal to gain_valid_delay\n");
        return;
    }

    exp_dly = exp_info.time_valid_delay;
    config->exp_dly = exp_dly;
    // config first exp
    set_exposure(config, false, gInitExp.exposure, &gInitExp.exp);
    struct rkisp_params_buffer isp_params = { 0 };

    first_exp = true;
    while (!config->stat_exit)
    {
        rt_device_control(config->isp,
                          RK_DEVICE_CTRL_ISP_GET_STATS,
                          stats_buf);

#ifdef RT_USING_RK_AOV
        isp_params.module_cfg_update |= ISP32_MODULE_BAY3D;
        isp_params.params.bay3d.is_first = false;
        set_params(config->isp, &isp_params);

        gShare->frame_num = stats_buf->frame_id;
        FASTAE_DBG("stats tick:%u seq:%d type:0x%x, ae:0x%x 0x%x 0x%x awb:0x%x 0x%x 0x%x\n",
                   rt_tick_get(),
                   stats_buf->frame_id, stats_buf->meas_type,
                   stats_buf->stats.rawae1.data[0].channelg_xy,
                   stats_buf->stats.rawae1.data[0].channelb_xy,
                   stats_buf->stats.rawae1.data[0].channelr_xy,
                   stats_buf->stats.rawawb.rgain_nor,
                   stats_buf->stats.rawawb.bgain_nor,
                   stats_buf->stats.rawawb.wp_num_nor);
#else
        FASTAE_DBG("stats tick:%u seq:%d type:0x%x, ae:0x%x 0x%x 0x%x awb:0x%x 0x%x 0x%x\n",
                   rt_tick_get(),
                   stats_buf->frame_id, stats_buf->meas_type,
                   stats_buf->stats.rawae1.data[0].channelg_xy,
                   stats_buf->stats.rawae1.data[0].channelb_xy,
                   stats_buf->stats.rawae1.data[0].channelr_xy,
                   stats_buf->stats.rawawb.rgain_nor,
                   stats_buf->stats.rawawb.bgain_nor,
                   stats_buf->stats.rawawb.wp_num_nor);
#endif

        if (gShare->hdr_mode == NO_HDR)
        {
            if (first_exp)
                isp_dgain[0] = MAX(g_fastae_init->start_isp_gain[0], isp_dgain[0]);
            else
                isp_dgain[0] = MAX(0x10000, isp_dgain[0]);
            calculate_awb(config, &isp_params, stats_buf, isp_dgain[0]);
        }
        else
        {
            if (first_exp)
                isp_dgain[1] = MAX(g_fastae_init->start_isp_gain[1], isp_dgain[1]);
            else
                isp_dgain[1] = MAX(0x10000, isp_dgain[1]);
            calculate_awb(config, &isp_params, stats_buf, isp_dgain[1]);
        }

        if (config->stat_exit)
            break;

        if (first_exp)
        {
            first_exp = false;
            config->skip_stat_num = 0;
            config->skip_stat_idx = 0;
            last_exposure = gInitExp.exposure;

            calculate_ae(config, stats_buf, &last_exposure, isp_dgain);

#ifdef RT_USING_RK_AOV
            //first frame, use the same
            if (!((config->is_match || config->is_over_range) && g_use_conv_exp))
            {
                g_ae_md = true;
                struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
                struct ae_awb_init_cfg *ae_awb = (struct ae_awb_init_cfg *)(metahead_p->load + AE_TABLE_OFFSET);
                //clear last result
                ae_awb->rtt_res.last_hidif_0 = 0;
                ae_awb->rtt_res.last_hidif_1 = 0;
                ae_awb->rtt_res.last_lodif_0 = 0;
                ae_awb->rtt_res.last_lodif_1 = 0;
                if (g_sensor_init->als_type == ALS_TYPE_NONE && g_use_conv_exp)
                {
                    //return to the original state, IRCUT no need to change, led light should be turned off
                    if (g_app_param->night_mode == NIGHT_WHITE_AUTO || g_app_param->night_mode == NIGHT_WHITE_AUTO)
                    {
                        g_is_ie_effect = 0;
                        *g_is_bw_night = COLOR_MODE;
                        struct rt_device_pwm *pwm_dev;

                        if (g_app_param->night_mode == NIGHT_WHITE_AUTO)
                        {
                            const char *pPWMDevice = cam_get_pwm_name(g_sensor_init->led_white.pwm_channel);
                            pwm_dev = (struct rt_device_pwm *)rt_device_find(pPWMDevice);
                            if (pwm_dev == RT_NULL)
                            {
                                FASTAE_ERR("pwm run failed! can't find %s device!\n", pPWMDevice);
                            }
                            else
                            {
                                rt_pwm_disable(pwm_dev, CAM_PWM_GET_CHANNEL(g_sensor_init->led_white.pwm_channel));
                            }
                        }
                        else
                        {
                            const char *pPWMDevice = cam_get_pwm_name(g_sensor_init->led_ir.pwm_channel);
                            pwm_dev = (struct rt_device_pwm *)rt_device_find(pPWMDevice);
                            if (pwm_dev == RT_NULL)
                            {
                                FASTAE_ERR("pwm run failed! can't find %s device!\n", pPWMDevice);
                            }
                            else
                            {
                                rt_pwm_disable(pwm_dev, CAM_PWM_GET_CHANNEL(g_sensor_init->led_ir.pwm_channel));
                            }
                        }
                    }
                }
            }
#endif

            continue;
        }
        //find current exposure
        if (config->skip_stat_idx < config->skip_stat_num)
        {
            config->skip_stat_idx++;
            continue;
        }

        fnd_flg = 0;
        frm_id = stats_buf->frame_id;
        rid = (config->explog_wid) % EXP_VAL_LOG_NUM;
        for (i = 0; i < EXP_VAL_LOG_NUM; i++)
        {
            if ((config->explog[rid].frame_id + exp_dly) == frm_id)
            {
                fnd_flg = 1;
                break;
            }
            rid = (rid + 1) % EXP_VAL_LOG_NUM;
        }

        if (fnd_flg)
            last_exposure = config->explog[rid].exposure;
        //set new exposure
        calculate_ae(config, stats_buf, &last_exposure, isp_dgain);

    }

    FastAeRelease();
    FASTAE_DBG("stat thread exit\n");
    rt_sem_release(config->stat_exitsem);
    rt_free(stats_buf);
}

int32_t start_ae(rk_device *isp, rk_device *sensor)
{
    rt_thread_t tid = RT_NULL;
    struct iq_config *config;
    uint32_t i;
    config = rt_calloc(1, sizeof(*config));
    CHECK_NULL_POINTER(config);

    config->isp = isp;
    config->sensor = sensor;

    for (i = 0; i < EXP_VAL_LOG_NUM; i++)
        config->explog[i].frame_id = EXP_INVALID_VAL;
    config->exp_sem = rt_sem_create("exp_sem", 0, RT_IPC_FLAG_FIFO);
    config->exp_exitsem = rt_sem_create("exp_exitsem", 0, RT_IPC_FLAG_FIFO);
    config->stat_exitsem = rt_sem_create("stat_exitsem", 0, RT_IPC_FLAG_FIFO);
    config->exp_mutex = rt_mutex_create("exp_mutex", RT_IPC_FLAG_FIFO);
    tid = rt_thread_create("exp_thread", exp_thread, config, 4096, RT_THREAD_PRIORITY_MAX / 2, 10);
    if (tid)
        rt_thread_startup(tid);
    config->exp_tid = tid;

    tid = rt_thread_create("stat_thread", stat_thread, config, 4096, RT_THREAD_PRIORITY_MAX / 2, 10);
    if (tid)
        rt_thread_startup(tid);
    config->stat_tid = tid;

    gConfig = config;
    return 0;
}

int32_t stop_ae(struct rk_isp_dev *ispdev)
{
    FASTAE_INFO("stop_ae on enter tick:%u\n", rt_tick_get());
    struct iq_config *config = gConfig;
    rt_base_t level;

    if (!config)
        return 0;

    //ISP PARAMS FOR KERNEL
    gShare->md_flag = g_ae_md;
    gShare->width = g_sensor_init->cam_w;
    gShare->height = g_sensor_init->cam_h;
    set_isp_params_for_kernel(gShare, g_main_calib, g_is_ie_effect, g_iq_bin_mode);

    if (gShare->camera_num == 2)
    {
        map_secondary_ae();
        set_isp_params_for_kernel(gShare_next_camera, g_secondary_calib, g_is_ie_effect, g_iq_bin_mode);
    }

    if (g_main_calib)
        rt_free(g_main_calib);
    if (g_secondary_calib)
        rt_free(g_secondary_calib);
    if (g_fastae_init)
        rt_free(g_fastae_init);
    if (g_sensor_init)
        rt_free(g_sensor_init);
    if (g_secondary_sensor_init)
        rt_free(g_secondary_sensor_init);
    if (g_app_param)
        rt_free(g_app_param);

    config->stat_exit = 1;
    rt_sem_release(ispdev->stats_sem);
    rt_sem_take(config->stat_exitsem, RT_WAITING_FOREVER);

    config->exp_exit = 1;
    rt_sem_release(config->exp_sem);
    rt_sem_take(config->exp_exitsem, RT_WAITING_FOREVER);

#ifdef RT_USING_RK_AOV
    if (g_iq_bin_mode == FULL_IQ_BIN_MODE)
    {
        struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
        struct sensor_iq_info *iq = (struct sensor_iq_info *)(metahead_p->load + SENSOR_IQ_BIN_OFFSET);
        rk_aiq_rtt_share_info_t *aovhead_p = (rk_aiq_rtt_share_info_t *)(metahead_p->load + WAKEUP_AOV_PARAM_OFFSET);

        restoreBinStructMap((uint8_t *)iq->main_sensor_iq_offset, iq->main_sensor_iq_size, aovhead_p->aiq_iq_addr);
        if (gShare->camera_num == 2)
            restoreBinStructMap((uint8_t *)iq->secondary_sensor_iq_offset, iq->secondary_sensor_iq_size, (aovhead_p + WAKEUP_AOV_PARAM_MAX_SIZE / 2)->aiq_iq_addr);
    }
#endif

    level = rt_hw_interrupt_disable();
    if (config)
    {
        rt_free(config);
        gConfig = NULL;
    }
    rt_hw_interrupt_enable(level);

    return 0;
}

int32_t isae_match()
{
    struct iq_config *config = gConfig;

    if (config)
    {
#ifdef RT_USING_RK_AOV
        uint32_t stop_ae = ((config->is_match == 1) ? true : false) && ((config->conv_num == 2) ? true : false);
        return stop_ae;
#else
        return config->is_match;
#endif
    }
    else
    {
        return 0;
    }
}

int32_t isae_over_range()
{
    struct iq_config *config = gConfig;

    if (config)
    {
#ifdef RT_USING_RK_AOV
        uint32_t stop_ae = ((config->is_over_range == 1) ? true : false) && ((config->conv_num == 2) ? true : false);
        return stop_ae;
#else
        return config->is_over_range;
#endif
    }
    else
    {
        return 0;
    }
}

int32_t get_expinfo(uint32_t frm_id, struct rk_camera_exp_val *exp)
{
    struct iq_config *config = gConfig;
    uint32_t rid, i, fnd_flg;

    if (frm_id <= 1)
    {
        rt_memcpy(exp, &gInitExp.exp, sizeof(*exp));
        return 1;
    }

    if (frm_id <= config->skip_stat_num + 1)
    {
        rt_memcpy(exp, &gInitExp.exp, sizeof(*exp));
        return 1;
    }

    fnd_flg = 0;
    rid = (config->explog_wid) % EXP_VAL_LOG_NUM;
    for (i = 0; i < EXP_VAL_LOG_NUM; i++)
    {
        if ((config->explog[rid].frame_id + config->exp_dly) == frm_id)
        {
            fnd_flg = 1;
            break;
        }

        rid = (rid + 1) % EXP_VAL_LOG_NUM;
    }

    if (fnd_flg)
        rt_memcpy(exp, &config->explog[rid].exp, sizeof(*exp));

    return fnd_flg;
}

uint32_t get_rtt_fps()
{
    return g_fastae_init->fps;
}

void fast_ae_set_max_frame(int max_frame)
{
    if (max_frame > 0)
    {
        g_fastae_max_run_frame = max_frame;
    }
    return ;
}

int fast_ae_get_max_frame(void)
{
    return g_fastae_max_run_frame;
}

int32_t parse_meta_params()
{
    struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
    int ret = 0;

#ifndef RT_USING_RK_AOV  //AOV cannot wait for meta_flags, skips directly
    int i = 200;
    while (--i >= 0)
    {
        rt_hw_cpu_dcache_ops(RT_HW_CACHE_INVALIDATE, (void *)metahead_p, sizeof(struct meta_head));
        if ((sirq_status() == RT_TRUE) && (metahead_p->meta_flags == META_READ_DONE_FLAG))
        {
            metahead_p->meta_flags = 0;
            rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)metahead_p, sizeof(struct meta_head));
            break;
        }
        HAL_DelayMs(1);
    }
    RT_ASSERT(i >= 0);
#endif

    // 1) app issue params
    struct app_param_info *app_param = (struct app_param_info *)(metahead_p->load + APP_PARAM_OFFSET);
    if (!g_app_param)
    {
        g_app_param = (struct app_param_info *)rt_calloc(1, sizeof(struct app_param_info));
        CHECK_NULL_POINTER(g_app_param);
    }

    *g_app_param = *app_param;
    g_is_bw_night = &app_param->color_mode; //share to kernel & api & app
    fast_ae_set_max_frame(app_param->fastae_max_frame);

    // 2) AOV params shared with AIQ
    rk_aiq_rtt_share_info_t *aovhead_p = (rk_aiq_rtt_share_info_t *)(metahead_p->load + WAKEUP_AOV_PARAM_OFFSET);
    g_iq_bin_mode = (rk_aiq_iq_bin_mode_t)aovhead_p->iq_bin_mode;

    // 3) main iq bin params
    struct sensor_iq_info *iq = (struct sensor_iq_info *)(metahead_p->load + SENSOR_IQ_BIN_OFFSET);
    if (g_iq_bin_mode != AOV_IQ_BIN_MODE)
    {
        ret = rkaiq_check_bin((void *)(iq->main_sensor_iq_offset), &g_iq_bin_mode);
    }
    if (!g_main_calib)
    {
        g_main_calib = (CamCalibDbV2Context_t *)rt_calloc(1, sizeof(CamCalibDbV2Context_t));
        CHECK_NULL_POINTER(g_main_calib);
    }

    if (g_iq_bin_mode == FULL_IQ_BIN_MODE || g_iq_bin_mode == INVALID_IQ_BIN_MODE)
    {
        g_main_camproj = rkaiq_calib_load((void *)(iq->main_sensor_iq_offset), iq->main_sensor_iq_size);
        ret = rkaiq_calib_write(g_main_camproj, g_main_calib, app_param->cam_mirror_flip, app_param->cam_fps);
        ret = rkaiq_get_calib(g_main_camproj, g_main_calib, g_app_param->cam_hdr, "day");
    }
    else if (g_iq_bin_mode == RTT_IQ_BIN_MODE)
    {
        ret = rkaiq_get_rttbin((void *)(iq->main_sensor_iq_offset), g_main_calib, g_app_param->cam_hdr, "day");
    }
    else if (g_iq_bin_mode == AOV_IQ_BIN_MODE)
    {
        //bin2calib((void *)(iq->main_sensor_iq_offset), g_main_calib);
        FASTAE_ERR("load main iq bin failed! not support bin mode=%d\n", g_iq_bin_mode);
    }
    else
    {
        FASTAE_ERR("load main iq bin failed! wrong bin mode=%d\n", g_iq_bin_mode);
    }

    // 4) secondary iq bin params
    if (g_app_param->cam_num == 2)
    {
        if (!g_secondary_calib)
        {
            g_secondary_calib = (CamCalibDbV2Context_t *)rt_calloc(1, sizeof(CamCalibDbV2Context_t));
            CHECK_NULL_POINTER(g_secondary_calib);
        }

        if (g_iq_bin_mode == FULL_IQ_BIN_MODE || g_iq_bin_mode == INVALID_IQ_BIN_MODE)
        {
            g_secondary_camproj = rkaiq_calib_load((void *)(iq->secondary_sensor_iq_offset), iq->secondary_sensor_iq_size);
            ret = rkaiq_calib_write(g_secondary_camproj, g_secondary_calib, app_param->cam2_mirror_flip, app_param->cam2_fps);
            ret = rkaiq_get_calib(g_secondary_camproj, g_secondary_calib, g_app_param->cam2_hdr, "day");
        }
        else if (g_iq_bin_mode == RTT_IQ_BIN_MODE)
        {
            ret = rkaiq_get_rttbin((void *)(iq->secondary_sensor_iq_offset), g_secondary_calib, g_app_param->cam2_hdr, "day");
        }
        else if (g_iq_bin_mode == AOV_IQ_BIN_MODE)
        {
            //bin2calib((void *)(iq->secondary_sensor_iq_offset), g_secondary_calib);
            FASTAE_ERR("load main iq bin failed! not support bin mode=%d\n", g_iq_bin_mode);
        }
        else
        {
            FASTAE_ERR("load secondary iq bin failed! wrong bin mode=%d\n", g_iq_bin_mode);
        }
    }

    // 4) sensor_init params
    struct sensor_init_cfg *sensor_init = (struct sensor_init_cfg *)(metahead_p->load + SENSOR_INIT_OFFSET);
    if (!g_sensor_init)
    {
        g_sensor_init = (struct sensor_init_cfg *)rt_calloc(1, sizeof(struct sensor_init_cfg));
        CHECK_NULL_POINTER(g_sensor_init);
    }

    g_sensor_init->cam_w = sensor_init->cam_w;
    g_sensor_init->cam_h = sensor_init->cam_h;
    g_sensor_init->als_type = sensor_init->als_type;
    g_sensor_init->als_value = sensor_init->als_value;

    g_sensor_init->ircut_a.gpio_index = sensor_init->ircut_a.gpio_index;
    g_sensor_init->ircut_a.gpio_func = sensor_init->ircut_a.gpio_func;
    g_sensor_init->ircut_b.gpio_index = sensor_init->ircut_b.gpio_index;
    g_sensor_init->ircut_b.gpio_func = sensor_init->ircut_b.gpio_func;

    g_sensor_init->led_ir_enable.gpio_index = sensor_init->led_ir_enable.gpio_index;
    g_sensor_init->led_ir_enable.gpio_func = sensor_init->led_ir_enable.gpio_func;
    g_sensor_init->led_ir.gpio_index = sensor_init->led_ir.gpio_index;
    g_sensor_init->led_ir.gpio_func = sensor_init->led_ir.gpio_func;
    g_sensor_init->led_ir.pwm_channel = sensor_init->led_ir.pwm_channel;
    g_sensor_init->led_ir.pwm_period = sensor_init->led_ir.pwm_period;
    g_sensor_init->led_ir.pwm_pulse = sensor_init->led_ir.pwm_pulse;

    g_sensor_init->led_white_enable.gpio_index = sensor_init->led_white_enable.gpio_index;;
    g_sensor_init->led_white_enable.gpio_func = sensor_init->led_white_enable.gpio_func;
    g_sensor_init->led_white.gpio_index = sensor_init->led_white.gpio_index;
    g_sensor_init->led_white.gpio_func = sensor_init->led_white.gpio_func;
    g_sensor_init->led_white.pwm_channel = sensor_init->led_white.pwm_channel;
    g_sensor_init->led_white.pwm_period = sensor_init->led_white.pwm_period;
    g_sensor_init->led_white.pwm_pulse = sensor_init->led_white.pwm_pulse;

    g_sensor_init->gpio_adc_enable.gpio_index = sensor_init->gpio_adc_enable.gpio_index;
    g_sensor_init->gpio_adc_enable.gpio_func = sensor_init->gpio_adc_enable.gpio_func;
    g_sensor_init->gpio_adc.gpio_index = sensor_init->gpio_adc.gpio_index;
    g_sensor_init->gpio_adc.gpio_func = sensor_init->gpio_adc.gpio_func;
    g_sensor_init->gpio_adc.adc_channel = sensor_init->gpio_adc.adc_channel;
    g_sensor_init->gpio_adc.adc_direction = sensor_init->gpio_adc.adc_direction;

    if (g_app_param->cam_num == 2)
    {
        // secondary sensor init params
        struct sensor_init_cfg *secondary_sensor_init = (struct sensor_init_cfg *)(metahead_p->load + SECONDARY_SENSOR_INIT_OFFSET);
        if (!g_secondary_sensor_init)
        {
            g_secondary_sensor_init = (struct sensor_init_cfg *)rt_calloc(1, sizeof(struct sensor_init_cfg));
            CHECK_NULL_POINTER(g_secondary_sensor_init);
        }

        g_secondary_sensor_init->cam_w = secondary_sensor_init->cam_w;
        g_secondary_sensor_init->cam_h = secondary_sensor_init->cam_h;
        g_secondary_sensor_init->als_type = secondary_sensor_init->als_type;
        g_secondary_sensor_init->als_value = secondary_sensor_init->als_value;

        g_secondary_sensor_init->ircut_a.gpio_index = secondary_sensor_init->ircut_a.gpio_index;
        g_secondary_sensor_init->ircut_a.gpio_func = secondary_sensor_init->ircut_a.gpio_func;
        g_secondary_sensor_init->ircut_b.gpio_index = secondary_sensor_init->ircut_b.gpio_index;
        g_secondary_sensor_init->ircut_b.gpio_func = secondary_sensor_init->ircut_b.gpio_func;

        g_secondary_sensor_init->led_ir_enable.gpio_index = secondary_sensor_init->led_ir_enable.gpio_index;
        g_secondary_sensor_init->led_ir_enable.gpio_func = secondary_sensor_init->led_ir_enable.gpio_func;
        g_secondary_sensor_init->led_ir.gpio_index = secondary_sensor_init->led_ir.gpio_index;
        g_secondary_sensor_init->led_ir.gpio_func = secondary_sensor_init->led_ir.gpio_func;
        g_secondary_sensor_init->led_ir.pwm_channel = secondary_sensor_init->led_ir.pwm_channel;
        g_secondary_sensor_init->led_ir.pwm_period = secondary_sensor_init->led_ir.pwm_period;
        g_secondary_sensor_init->led_ir.pwm_pulse = secondary_sensor_init->led_ir.pwm_pulse;

        g_secondary_sensor_init->led_white_enable.gpio_index = secondary_sensor_init->led_white_enable.gpio_index;;
        g_secondary_sensor_init->led_white_enable.gpio_func = secondary_sensor_init->led_white_enable.gpio_func;
        g_secondary_sensor_init->led_white.gpio_index = secondary_sensor_init->led_white.gpio_index;
        g_secondary_sensor_init->led_white.gpio_func = secondary_sensor_init->led_white.gpio_func;
        g_secondary_sensor_init->led_white.pwm_channel = secondary_sensor_init->led_white.pwm_channel;
        g_secondary_sensor_init->led_white.pwm_period = secondary_sensor_init->led_white.pwm_period;
        g_secondary_sensor_init->led_white.pwm_pulse = secondary_sensor_init->led_white.pwm_pulse;

        g_secondary_sensor_init->gpio_adc_enable.gpio_index = secondary_sensor_init->gpio_adc_enable.gpio_index;
        g_secondary_sensor_init->gpio_adc_enable.gpio_func = secondary_sensor_init->gpio_adc_enable.gpio_func;
        g_secondary_sensor_init->gpio_adc.gpio_index = secondary_sensor_init->gpio_adc.gpio_index;
        g_secondary_sensor_init->gpio_adc.gpio_func = secondary_sensor_init->gpio_adc.gpio_func;
        g_secondary_sensor_init->gpio_adc.adc_channel = secondary_sensor_init->gpio_adc.adc_channel;
        g_secondary_sensor_init->gpio_adc.adc_direction = secondary_sensor_init->gpio_adc.adc_direction;
    }

    // 5) fast 2a params
    struct ae_awb_init_cfg *ae_awb = (struct ae_awb_init_cfg *)(metahead_p->load + AE_TABLE_OFFSET);
    if (!g_fastae_init)
    {
        g_fastae_init = (struct fastae_init_info *)rt_calloc(1, sizeof(struct fastae_init_info));
        CHECK_NULL_POINTER(g_fastae_init);
    }

    g_fastae_init->black_lvl = ae_awb->ae.black_lvl;

    g_fastae_init->adc_calib_type = ae_awb->ae.adc_calib_type;
    g_fastae_init->adc_range_type = ae_awb->ae.adc_range_type;

    if (g_fastae_init->adc_calib_type == 0)
    {
        g_fastae_init->adc_calib[0] = INT2FIX(ae_awb->ae.adc_calib[0]);
        g_fastae_init->adc_calib[1] = INT2FIX(ae_awb->ae.adc_calib[1]);
        g_fastae_init->adc_calib[2] = INT2FIX(ae_awb->ae.adc_calib[2]);
        g_fastae_init->adc_calib[3] = INT2FIX(ae_awb->ae.adc_calib[3]);
    }
    else
    {
        g_fastae_init->adc_table_len = ae_awb->ae.adc_table_len;

        for (int i = 0; i < g_fastae_init->adc_table_len; i++)
        {
            g_fastae_init->adc_table_low[i][0] = INT2FIX(ae_awb->ae.adc_table_low[i][0]);
            g_fastae_init->adc_table_low[i][1] = INT2FIX(ae_awb->ae.adc_table_low[i][1]);
        }

        if (g_fastae_init->adc_range_type == 0)
        {
            for (int i = 0; i < g_fastae_init->adc_table_len; i++)
            {
                g_fastae_init->adc_table_high[i][0] = INT2FIX(ae_awb->ae.adc_table_high[i][0]);
                g_fastae_init->adc_table_high[i][1] = INT2FIX(ae_awb->ae.adc_table_high[i][1]);
            }
        }
    }

    g_fastae_init->exp_calib[0] = INT2FIX(ae_awb->ae.start_exp[0]);
    g_fastae_init->exp_calib[1] = INT2FIX(ae_awb->ae.start_exp[1]);
    g_fastae_init->exp_calib[2] = INT2FIX(ae_awb->ae.start_exp[2]);

    g_fastae_init->ir_config.rggain_base = ae_awb->awb.rg_gain_base;
    g_fastae_init->ir_config.bggain_base = ae_awb->awb.bg_gain_base;
    g_fastae_init->ir_config.awbgain_rad = ae_awb->awb.awb_gain_rad;
    g_fastae_init->ir_config.awbgain_dis = ae_awb->awb.awb_gain_dis;

    // TODO: day or night threshold
    g_fastae_init->ir_config.d2n_envL_th = g_sensor_init->als_value;
    g_fastae_init->ir_config.n2d_envL_th = g_sensor_init->als_value * 3;

    g_fastae_init->als_type = g_sensor_init->als_type;
    g_fastae_init->night_mode = app_param->night_mode;
    g_fastae_init->led_value = MIN(app_param->led_value, 100);

#ifdef RT_USING_RK_AOV
    // add rtt fast 2a res
    g_fastae_init->conv_day_or_night = ae_awb->rtt_res.day_or_night & 0xff;
    g_fastae_init->conv_exp = ae_awb->rtt_res.exp;
    g_fastae_init->conv_isp_dgain = ae_awb->rtt_res.isp_dgain;
    g_fastae_init->conv_reg_gain = ae_awb->rtt_res.reg_gain;
    g_fastae_init->conv_reg_time = ae_awb->rtt_res.reg_time;
    g_fastae_init->conv_dcg_mode = ae_awb->rtt_res.dcg_mode;
    g_fastae_init->conv_r_gain = ae_awb->rtt_res.awb_gain & 0xffff;
    g_fastae_init->conv_b_gain = (ae_awb->rtt_res.awb_gain >> FIXEDPREC) & 0xffff;
    g_fastae_init->nr_diff_th = ae_awb->rtt_res.nr_diff_th;
    g_fastae_init->ae_diff_th = ae_awb->rtt_res.ae_diff_th;

    for (int i = 0; i < AE_GRID_STATS - 1; i++)
    {
        g_fastae_init->conv_ae_stats[2 * i] = ae_awb->rtt_res.ae_stats[i] & 0xffff;
        g_fastae_init->conv_ae_stats[2 * i + 1] = ae_awb->rtt_res.ae_stats[i] >> 16;
    }
    g_fastae_init->conv_ae_stats[ISP_RAWAEBIG_MEAN_NUM - 1] = ae_awb->rtt_res.ae_stats[AE_GRID_STATS - 1] & 0xffff;
    g_fastae_init->last_lodif = ((uint64_t)ae_awb->rtt_res.last_lodif_0 & 0xffffffff) | ((uint64_t)ae_awb->rtt_res.last_lodif_1 << 32);
    g_fastae_init->last_hidif = ((uint64_t)ae_awb->rtt_res.last_hidif_0 & 0xffffffff) | ((uint64_t)ae_awb->rtt_res.last_hidif_1 << 32);

    FASTAE_DBG("day/night=%d,conv_exp=%d,conv_reg_gain=%d,conv_reg_time=%d,conv_dcg_mode=%d,conv_r_gain=0x%x,conv_b_gain=0x%x,conv_ispG=0x%x\n",
               g_fastae_init->conv_day_or_night, g_fastae_init->conv_exp, g_fastae_init->conv_reg_gain, g_fastae_init->conv_reg_time,
               g_fastae_init->conv_dcg_mode, g_fastae_init->conv_r_gain, g_fastae_init->conv_b_gain, g_fastae_init->conv_isp_dgain);
#endif

    return ret;
}

int32_t read_lux_adc
(
    struct fastae_init_info   *fastae_init,
    struct sensor_init_cfg    *sensor_init
)
{
    static rt_adc_device_t adc_dev;
    int32_t ret = 0, count = 0, val_last = 0, val_new = 0, gpio_func = 0;
    int direction = sensor_init->gpio_adc.adc_direction;
    const char *pADCDevice = CAM_ADC_GET_DEVICE;
    adc_dev = (rt_adc_device_t)rt_device_find(pADCDevice);
    if (adc_dev == RT_NULL)
    {
        FASTAE_ERR("ADC run failed! can't find %s device!\n", pADCDevice);
    }

    ret = cam_cfg_gpio_func(sensor_init->gpio_adc.gpio_index, sensor_init->gpio_adc.gpio_func);

    if (direction == 0)
        gpio_func = sensor_init->gpio_adc_enable.gpio_func | FLAG_GPIO_DEFAULT_HIGH;
    else
        gpio_func = sensor_init->gpio_adc_enable.gpio_func | FLAG_GPIO_DEFAULT_LOW;
    ret = cam_cfg_gpio_func(sensor_init->gpio_adc_enable.gpio_index, gpio_func);
    FASTAE_DBG("set %s to read dark ADC, tick:%d\n", direction == 0 ? "GPIO_HIGH" : "GPIO_LOW", rt_tick_get());
    while (++count)
    {
        val_last = val_new;
        val_new = rt_adc_read(adc_dev,  sensor_init->gpio_adc.adc_channel);
        FASTAE_DBG("read %d-th ADC: val_new %d\n", count, val_new);
        if (FIX_ABS(val_last, val_new) <= 0 || count > 50)
        {
            fastae_init->low_adc = INT2FIX(val_new);
            val_new = 0;
            val_last = 0;
            count = 0;
            break;
        }
    }

    if (fastae_init->adc_range_type == 0)
    {
        if (direction == 0)
            ret = cam_set_gpio_level(sensor_init->gpio_adc_enable.gpio_index, GPIO_LOW);
        else
            ret = cam_set_gpio_level(sensor_init->gpio_adc_enable.gpio_index, GPIO_HIGH);
        FASTAE_DBG("set %s to read light ADC, tick:%d\n", direction == 0 ? "GPIO_LOW" : "GPIO_HIGH", rt_tick_get());
        HAL_DelayMs(2);
        while (++count)
        {
            val_last = val_new;
            val_new = rt_adc_read(adc_dev,  sensor_init->gpio_adc.adc_channel);
            FASTAE_DBG("read %d-th ADC: val_new %d\n", count, val_new);
            if (FIX_ABS(val_last, val_new) <= 0 || count > 50)
            {
                fastae_init->high_adc = INT2FIX(val_new);
                val_new = 0;
                val_last = 0;
                count = 0;
                break;
            }
        }
    }

    return ret;
}

int32_t read_night_adc
(
    struct fastae_init_info   *fastae_init,
    struct sensor_init_cfg    *sensor_init
)
{
    static rt_adc_device_t adc_dev;
    int32_t ret = 0, count = 0, val_last = 0, val_new = 0;
    const char *pADCDevice = CAM_ADC_GET_DEVICE;
    adc_dev = (rt_adc_device_t)rt_device_find(pADCDevice);
    if (adc_dev == RT_NULL)
    {
        FASTAE_ERR("ADC run failed! can't find %s device!\n", pADCDevice);
    }

    // read low adc may cost too much time!
    fastae_init->low_adc = -1;

    while (++count)
    {
        val_last = val_new;
        val_new = rt_adc_read(adc_dev,  sensor_init->gpio_adc.adc_channel);
        FASTAE_DBG("read %d-th ADC: val_new %d\n", count, val_new);
        if (FIX_ABS(val_last, val_new) <= 0 || count > 50)
        {
            fastae_init->high_adc = INT2FIX(val_new);
            break;
        }
    }

    return ret;
}

int32_t read_digital_lux(struct fastae_init_info *fastae_init)
{
    struct rt_device *asl_dev;
    int32_t ret = 0;
    bool ready;
    float lux;
    fastae_init->env_lux = 0;

    const char *pALSDevice = "als";
    asl_dev = (struct rt_device *)rt_device_find(pALSDevice);
    if (!asl_dev)
    {
        FASTAE_ERR("find device:%s failed, assume lux is 100!\n", pALSDevice);
        fastae_init->env_lux = FLOAT2LFIX(100);
        return ret;
    }

    FASTAE_DBG("%s start read, tick: %d\n", pALSDevice, rt_tick_get());
    do
    {
        rt_device_control(asl_dev, RK_DEVICE_CTRL_ALS_DATA_READY, &ready);
        HAL_DelayUs(500);
    }
    while (!ready);
    FASTAE_DBG("%s over read, tick: %d\n", pALSDevice, rt_tick_get());

    if (ready)
    {
        rt_device_control(asl_dev, RK_DEVICE_CTRL_ALS_GET_VAL, &lux);
        fastae_init->env_lux = FLOAT2LFIX(lux);
    }

    return ret;
}

int32_t set_night_mode
(
    struct fastae_init_info   *fastae_init,
    struct sensor_init_cfg    *sensor_init
)
{
    int ret = 0;
    night_mode_t night_mode = fastae_init->night_mode;
    int led_value = fastae_init->led_value;

    if (night_mode == NIGHT_WHITE_AUTO || night_mode == NIGHT_WHITE_ON)
    {
        FASTAE_INFO("white led night mode is working\n");

        if (led_value > 0)
        {
            if (sensor_init->led_white_enable.gpio_index != -1)
            {
                ret = cam_cfg_gpio_func(sensor_init->led_white_enable.gpio_index, sensor_init->led_white_enable.gpio_func);
            }
            ret = cam_cfg_gpio_func(sensor_init->led_white.gpio_index, sensor_init->led_white.gpio_func);
            if (ret)
            {
                FASTAE_ERR("error: config white led.\n");
            }

            struct rt_device_pwm *pwm_dev;
            int pwm_pulse = sensor_init->led_white.pwm_period * led_value / 100;
            const char *pPWMDevice = cam_get_pwm_name(sensor_init->led_white.pwm_channel);
            pwm_dev = (struct rt_device_pwm *)rt_device_find(pPWMDevice);
            if (pwm_dev == RT_NULL)
            {
                FASTAE_ERR("pwm run failed! can't find %s device!\n", pPWMDevice);
            }
            else
            {
                rt_pwm_set(pwm_dev,
                           CAM_PWM_GET_CHANNEL(sensor_init->led_white.pwm_channel),
                           sensor_init->led_white.pwm_period,
                           pwm_pulse);
                rt_pwm_enable(pwm_dev, CAM_PWM_GET_CHANNEL(sensor_init->led_white.pwm_channel));
            }
            if (fastae_init->als_type > ALS_TYPE_NONE)
            {
                HAL_DelayMs(5); //open white led, read adc
                if (fastae_init->als_type == ALS_TYPE_ANALOG)
                {
                    read_night_adc(fastae_init, sensor_init);
                }
                FastAeNightExpCalc(fastae_init);
            }
        }

    }
    else if (night_mode == NIGHT_IR_AUTO || night_mode == NIGHT_IR_ON)
    {
        FASTAE_INFO("ir led night mode is working\n");

        // update night calib scene
        if (*g_is_bw_night == BW_MODE)
        {
            if (g_iq_bin_mode == FULL_IQ_BIN_MODE || g_iq_bin_mode == INVALID_IQ_BIN_MODE)
            {
                ret = rkaiq_get_calib(g_main_camproj, g_main_calib, g_app_param->cam_hdr, "night");
            }
            else if (g_iq_bin_mode == RTT_IQ_BIN_MODE)
            {
                struct meta_head *metahead_p = (struct meta_head *)(RT_USING_META_DDR_ADRESS);
                struct sensor_iq_info *iq = (struct sensor_iq_info *)(metahead_p->load + SENSOR_IQ_BIN_OFFSET);
                ret = rkaiq_get_rttbin((void *)(iq->main_sensor_iq_offset), g_main_calib, g_app_param->cam_hdr, "night");
            }

            if (!ret)
            {
                struct fastae_init_info *fastae_night_init = rt_calloc(1, sizeof(struct fastae_init_info));
                CHECK_NULL_POINTER(fastae_night_init);
                fastae_night_init->is_hdr = (g_app_param->cam_hdr > NO_HDR) ? true : false;
                parse_ae_params(g_main_calib, fastae_night_init, g_iq_bin_mode);
                FastAeNightInit(fastae_night_init);
                rt_free(fastae_night_init);
            }
        }

        if (led_value > 0)
        {
            if (sensor_init->led_ir_enable.gpio_index != -1)
            {
                ret = cam_cfg_gpio_func(sensor_init->led_ir_enable.gpio_index, sensor_init->led_ir_enable.gpio_func);
            }
            ret = cam_cfg_gpio_func(sensor_init->led_ir.gpio_index, sensor_init->led_ir.gpio_func);
            if (ret)
            {
                FASTAE_ERR("error: config ir led.\n");
            }

            struct rt_device_pwm *pwm_dev;
            int pwm_pulse = sensor_init->led_ir.pwm_period * led_value / 100;
            const char *pPWMDevice = cam_get_pwm_name(sensor_init->led_ir.pwm_channel);
            pwm_dev = (struct rt_device_pwm *)rt_device_find(pPWMDevice);
            if (pwm_dev == RT_NULL)
            {
                FASTAE_ERR("pwm run failed! can't find %s device!\n", pPWMDevice);
            }
            else
            {
                rt_pwm_set(pwm_dev,
                           CAM_PWM_GET_CHANNEL(sensor_init->led_ir.pwm_channel),
                           sensor_init->led_ir.pwm_period,
                           pwm_pulse);
                rt_pwm_enable(pwm_dev, CAM_PWM_GET_CHANNEL(sensor_init->led_ir.pwm_channel));
            }

            if (fastae_init->als_type > ALS_TYPE_NONE)
            {
                HAL_DelayMs(5); //open ir led, open ircut
                FastAeNightExpCalc(fastae_init);
            }
        }

    }

    return 0;

}

int32_t set_ae_init
(
    rk_device *sensor,
    struct fastae_init_info *fastae_init,
    struct sensor_init_cfg  *sensor_init_config
)
{
    struct rk_camera_exp_info exp_info = {0};

    // 1.0 CONFIG AE PARAMS
    rt_memset(&exp_info, 0, sizeof(exp_info));
    rt_device_control(sensor, RK_DEVICE_CTRL_CAMERA_GET_EXP_INF, &exp_info);
    fastae_init->fps     = exp_info.pix_clk / (exp_info.hts * exp_info.vts);
    fastae_init->hts     = exp_info.hts;
    fastae_init->vts     = exp_info.vts;
    fastae_init->fps_aiq = exp_info.dst_pix_clk / (exp_info.dst_hts * exp_info.dst_vts);
    fastae_init->hts_aiq = exp_info.dst_hts;
    fastae_init->vts_aiq = exp_info.dst_vts;
    FASTAE_INFO("fps/hts/vts: RTT=[%d, %d, %d], MainAIQ=[%d, %d, %d]\n",
                fastae_init->fps, fastae_init->hts, fastae_init->vts,
                fastae_init->fps_aiq, fastae_init->hts_aiq, fastae_init->vts_aiq);

#ifdef RT_USING_RK_AOV
    fastae_init->is_wakeup = true;
#else
    fastae_init->is_wakeup = false;
#endif

    FastAeInit(fastae_init);

    // 2.0 CALC INIT EXPOSURE
    FIXED night_thre = sensor_init_config->als_value;
    FIXED rk_night_mode = fastae_init->night_mode; //user setting, not current night mode

    if (sensor_init_config->als_type == ALS_TYPE_ANALOG || sensor_init_config->als_type == ALS_TYPE_DIGITAL)
    {
        if (sensor_init_config->als_type == ALS_TYPE_ANALOG)
            read_lux_adc(fastae_init, sensor_init_config);
        else
            read_digital_lux(fastae_init);

        FastAeInitExpCalc(fastae_init);
        if (((fastae_init->env_lux < night_thre) && (rk_night_mode == NIGHT_IR_AUTO))
                || ((fastae_init->env_lux < night_thre) && (rk_night_mode == NIGHT_WHITE_AUTO))
                || (rk_night_mode == NIGHT_IR_ON) || (rk_night_mode == NIGHT_WHITE_ON))
        {
            if (rk_night_mode == NIGHT_IR_ON || rk_night_mode == NIGHT_IR_AUTO)
            {
                g_is_ie_effect = 1;
                *g_is_bw_night = BW_MODE;
                ircut_switch(sensor_init_config, IR_STATUS_CUT_ON);
            }
            else
            {
                *g_is_bw_night = COLOR_MODE;
                ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);
            }
            set_night_mode(fastae_init, sensor_init_config);

#ifdef RT_USING_RK_AOV
            if (fastae_init->conv_day_or_night == DayORNight_STATUS_NIGHT && fastae_init->conv_exp != 0)
            {
                // the same night mode, use last conv exposure
                fastae_init->start_exp[0] = fastae_init->conv_exp;
                fastae_init->start_isp_gain[0] = fastae_init->conv_isp_dgain;
                fastae_init->start_reg_time[0] = fastae_init->conv_reg_time;
                fastae_init->start_reg_gain[0] = fastae_init->conv_reg_gain;
                fastae_init->start_dcg_mode[0] = fastae_init->conv_dcg_mode;
                g_use_conv_exp = true;
            }
            else
            {
                g_use_conv_exp = false;
            }
            g_day_or_night = DayORNight_STATUS_NIGHT;
#endif

        }
        else
        {
            *g_is_bw_night = COLOR_MODE;
            ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);

#ifdef RT_USING_RK_AOV
            if (fastae_init->conv_day_or_night == DayORNight_STATUS_DAY && fastae_init->conv_exp != 0)
            {
                // the same day mode, use last conv exposure
                fastae_init->start_exp[0] = fastae_init->conv_exp;
                fastae_init->start_isp_gain[0] = fastae_init->conv_isp_dgain;
                fastae_init->start_reg_time[0] = fastae_init->conv_reg_time;
                fastae_init->start_reg_gain[0] = fastae_init->conv_reg_gain;
                fastae_init->start_dcg_mode[0] = fastae_init->conv_dcg_mode;
                g_use_conv_exp = true;
            }
            else
            {
                g_use_conv_exp = false;
            }

            g_day_or_night = DayORNight_STATUS_DAY;
#endif

        }

    }
    else
    {
        FastAeInitExpCalc(fastae_init);

        if (rk_night_mode == NIGHT_IR_ON || rk_night_mode == NIGHT_WHITE_ON)
        {

            if (rk_night_mode == NIGHT_IR_ON)
            {
                g_is_ie_effect = 1;
                *g_is_bw_night = BW_MODE;
                ircut_switch(sensor_init_config, IR_STATUS_CUT_ON);
            }
            else
            {
                *g_is_bw_night = COLOR_MODE;
                ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);
            }
            set_night_mode(fastae_init, sensor_init_config); // control led light
            g_day_or_night = DayORNight_STATUS_NIGHT;

        }
        else if (rk_night_mode == NIGHT_OFF)
        {
            *g_is_bw_night = COLOR_MODE;
            ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);
            g_day_or_night = DayORNight_STATUS_DAY;
        }
        else
        {
            // NIGHT_WHITE(IR)_AUTO mode needs to be judged by day_or_night
#ifdef RT_USING_RK_AOV
            if (fastae_init->conv_exp != 0)
            {
                if (fastae_init->conv_day_or_night == DayORNight_STATUS_NIGHT)
                {
                    if (g_fastae_init->night_mode == NIGHT_IR_AUTO)
                    {
                        g_is_ie_effect = 1;
                        *g_is_bw_night = BW_MODE;
                        ircut_switch(sensor_init_config, IR_STATUS_CUT_ON);
                    }
                    else
                    {
                        *g_is_bw_night = COLOR_MODE;
                        ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);
                    }

                    set_night_mode(fastae_init, sensor_init_config); // control led light
                }
                else
                {
                    *g_is_bw_night = COLOR_MODE;
                    ircut_switch(sensor_init_config, IR_STATUS_CUT_OFF);
                }
            }
#endif
        }

#ifdef RT_USING_RK_AOV
        if (fastae_init->conv_exp != 0)
        {
            // for soft light sensor, use last conv exp
            fastae_init->start_exp[0] = fastae_init->conv_exp;
            fastae_init->start_isp_gain[0] = fastae_init->conv_isp_dgain;
            fastae_init->start_reg_time[0] = fastae_init->conv_reg_time;
            fastae_init->start_reg_gain[0] = fastae_init->conv_reg_gain;
            fastae_init->start_dcg_mode[0] = fastae_init->conv_dcg_mode;
            g_use_conv_exp = true;
        }
        else
        {
            g_use_conv_exp = false;
        }
#endif
    }

    //rt_hw_cpu_dcache_ops(RT_HW_CACHE_FLUSH, (void *)g_is_bw_night, sizeof(*g_is_bw_night));
    FASTAE_INFO("als type: %d, als value: 0x%x, night mode: %d\n", sensor_init_config->als_type, night_thre, rk_night_mode);

    return 0;
}

int32_t set_firstae(rk_device *isp, rk_device *sensor, struct shared_data *share, rt_sem_t *sem)
{
    AE_RESULT ret = 0;
    g_is_ie_effect = 0;
    gShare = share;
    rt_memset(&gShare->cfg, 0, sizeof(struct isp32_isp_params_cfg));

    // 1. PARSE META & AE PARAMS
    ret = parse_meta_params();

    g_fastae_init->is_hdr = (g_app_param->cam_hdr > NO_HDR) ? true : false;
    g_fastae_init->tolerance_coef = g_app_param->fastae_tolerance_coef;
    parse_ae_params(g_main_calib, g_fastae_init, g_iq_bin_mode);

    // 2 INIT SENSOR CONFIG
    if (g_sensor_init->cam_w && g_sensor_init->cam_h)
    {
        g_param.sensor.width = g_sensor_init->cam_w;
        g_param.sensor.height = g_sensor_init->cam_h;

        gShare->hdr_mode = g_app_param->cam_hdr;

        struct rk_camera_dst_config cam_config = {0};
        cam_config.width = g_sensor_init->cam_w;
        cam_config.height = g_sensor_init->cam_h;
        cam_config.cam_fps_denominator = g_app_param->cam_fps;
        cam_config.cam_fps_numerator = 1;
        cam_config.cam_mirror_flip = g_app_param->cam_mirror_flip;
        cam_config.maxfps = g_app_param->cam1_max_fps;
        if ((g_app_param->cam_hdr == NO_HDR) ||
                (g_app_param->cam_hdr == HDR_X2) ||
                (g_app_param->cam_hdr == HDR_X3))
        {
            cam_config.cam_hdr = g_app_param->cam_hdr;
        }
        rt_device_control(sensor, RK_DEVICE_CTRL_CID_MATCH_CAM_CONFIG, &cam_config);
    }

    gShare->camera_num = 1;
    if (g_app_param->cam_num == 2)
    {
        gShare->camera_num = 2;
        gShare->camera_index = 0;
        gShare_next_camera = share + 1;
        gShare_next_camera->camera_num = 2;
        gShare_next_camera->camera_index = 1;
        rt_memset(&gShare_next_camera->cfg, 0, sizeof(struct isp32_isp_params_cfg));
    }

    // 3. CALC & SET INIT EXPOSURE
    set_ae_init(sensor, g_fastae_init, g_sensor_init);
    gInitExp.exposure = g_fastae_init->start_exp[0];
    gInitExp.exp.reg_time[0] = g_fastae_init->start_reg_time[0];
    gInitExp.exp.reg_gain[0] = g_fastae_init->start_reg_gain[0];
    gInitExp.exp.dcg_mode[0] = g_fastae_init->start_dcg_mode[0];
    rt_device_control(sensor,
                      RK_DEVICE_CTRL_CAMERA_SET_EXP_VAL,
                      &gInitExp.exp);

#ifdef RT_USING_RK_AOV
    FASTAE_INFO("Final InitExp: initexp=%s,regtime=%d,reggain=%d\n",
                FixPrint(gInitExp.exposure, 5),
                gInitExp.exp.reg_time[0], gInitExp.exp.reg_gain[0]);
#endif

    // 4. ISP PARAMS FOR RTT
    FIXED black_lvl = g_fastae_init->black_lvl;
    struct rkisp_params_buffer isp_params = { 0 };
    isp_params.frame_id = 0;
    isp_params.module_ens = /*ISP_MODULE_RAWAE0 |*/ ISP_MODULE_RAWAE1 |
            ISP_MODULE_RAWAWB | ISP_MODULE_BLS | ISP_MODULE_AWBGAIN;
    isp_params.module_en_update = isp_params.module_ens;
    isp_params.module_cfg_update = isp_params.module_ens;
    isp_params.params.bls.r = black_lvl;
    isp_params.params.bls.gr = black_lvl;
    isp_params.params.bls.gb = black_lvl;
    isp_params.params.bls.b = black_lvl;

    struct rk_camera_device *subdev;
    subdev = ((struct rk_isp_dev *)isp->user_data)->subdev;

#ifdef RT_USING_RK_AOV
    // 1.0 awb gain
    if (g_use_conv_exp == true)
    {
        isp_params.params.awbgain.gb = MAX(256, (256 * g_fastae_init->conv_isp_dgain) >> 16);
        isp_params.params.awbgain.gr = MAX(256, (256 * g_fastae_init->conv_isp_dgain) >> 16);
        isp_params.params.awbgain.b = g_fastae_init->conv_b_gain;
        isp_params.params.awbgain.r = g_fastae_init->conv_r_gain;
    }
    else
    {
        init_wb_gain(&isp_params.params.awbgain, g_main_calib, g_iq_bin_mode);
        isp_params.params.awbgain.gb = (isp_params.params.awbgain.gb * g_fastae_init->start_isp_gain[0]) >> 16;
        isp_params.params.awbgain.gr = (isp_params.params.awbgain.gr * g_fastae_init->start_isp_gain[0]) >> 16;
        isp_params.params.awbgain.b = (isp_params.params.awbgain.b * g_fastae_init->start_isp_gain[0]) >> 16;
        isp_params.params.awbgain.r = (isp_params.params.awbgain.r * g_fastae_init->start_isp_gain[0]) >> 16;
    }

    // 2.0 nr params
    isp_params.module_ens |= ISP32_MODULE_BAY3D;
    isp_params.module_en_update |= ISP32_MODULE_BAY3D;
    isp_params.module_cfg_update |= ISP32_MODULE_BAY3D;

    isp_params.module_ens |= ISP32_MODULE_BAYNR;
    isp_params.module_en_update |= ISP32_MODULE_BAYNR;
    isp_params.module_cfg_update |= ISP32_MODULE_BAYNR;

    set_baynr_params_for_rtt(&isp_params.params.baynr);
    set_bay3d_params_for_rtt(&isp_params.params.bay3d, subdev->info.mbus_fmt.width, subdev->info.mbus_fmt.height);

    if (g_fastae_init->conv_exp == 0)
        isp_params.params.bay3d.is_first = true;
    else
        isp_params.params.bay3d.is_first = false;
#else
    init_wb_gain(&isp_params.params.awbgain, g_main_calib, g_iq_bin_mode);
    set_bay3d_params_for_rtt(&isp_params.params.bay3d, subdev->info.mbus_fmt.width, subdev->info.mbus_fmt.height); // only set nr cfg, not enable
#endif

    isp_params.params.bay3d.buf_off = sizeof(struct shared_data) * gShare->camera_num;
    gShare->share_mem_size = isp_params.params.bay3d.buf_off;
    gShare->nr_buf_size = isp_params.params.bay3d.iir_size + isp_params.params.bay3d.cur_size + isp_params.params.bay3d.ds_size;
    set_params(isp, &isp_params);

#ifdef RT_USING_CAM_STREAM_ON_LATE
    rk_semaphore_release(*sem);
    FASTAE_INFO("%s %d tick %d\n", __FUNCTION__, __LINE__, rt_tick_get());
#endif

    return ret;
}

int secondary_config(struct rk_camera_dst_config *cam_config)
{
    if (g_secondary_sensor_init->cam_w <= 0 || g_secondary_sensor_init->cam_h <= 0)
        return -RT_EINVAL;

    g_param.secondary_sensor.width = g_secondary_sensor_init->cam_w;
    g_param.secondary_sensor.height = g_secondary_sensor_init->cam_h;

    gShare_next_camera->width = g_secondary_sensor_init->cam_w;
    gShare_next_camera->height = g_secondary_sensor_init->cam_h;
    gShare_next_camera->hdr_mode = g_app_param->cam2_hdr;
    gShare_next_camera->rtt_mode = gShare->rtt_mode;
    gShare_next_camera->md_flag = gShare->md_flag;

    cam_config->width = g_secondary_sensor_init->cam_w;
    cam_config->height = g_secondary_sensor_init->cam_h;
    cam_config->cam_fps_denominator = g_app_param->cam2_fps;
    cam_config->cam_fps_numerator = 1;
    cam_config->cam_mirror_flip = g_app_param->cam2_mirror_flip;
    if ((g_app_param->cam2_hdr == NO_HDR) ||
            (g_app_param->cam2_hdr == HDR_X2) ||
            (g_app_param->cam2_hdr == HDR_X3))
    {
        cam_config->cam_hdr = g_app_param->cam2_hdr;
    }

    return RT_EOK;
}

int32_t set_params(rk_device *isp, struct rkisp_params_buffer *buf)
{
    return rk_device_control(isp, RK_DEVICE_CTRL_ISP_SET_PARAMS, buf);
}
