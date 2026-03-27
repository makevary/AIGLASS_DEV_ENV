/**
  * Copyright (c) 2022 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @file    drv_isp_module.c
  * @version V0.0.1
  * @date    6-July-2022
  * @brief
  *
  ******************************************************************************
  */

#include "drv_isp3.h"
#include "regs_v3x.h"
#include "rk-isp33-config.h"

#if defined(RT_USING_ISP3)

#define ISP_DEBUG                         0
#if ISP_DEBUG
#include <stdio.h>
#define ISP_DBG(...)                      \
            do {                          \
                rt_kprintf("[ISP]:");     \
                rt_kprintf(__VA_ARGS__);  \
                }while(0)
#define rk_isp_function_enter()           rt_kprintf("[ISP]:(%s) enter \n",__FUNCTION__)
#define rk_isp_function_exit()            rt_kprintf("[ISP]:(%s) exit \n",__FUNCTION__)
#else
#define ISP_DBG(...)
#define rk_isp_function_enter()
#define rk_isp_function_exit()
#endif

#define ISP_INFO(dev,arg...)              rt_kprintf("[%s]:",dev->name);rt_kprintf(arg)

static void isp_bls_cfg(struct rk_isp_dev *dev)
{
    struct isp_input_fmt *input_fmt = &dev->input.input_fmt;
    struct rkisp_params_buffer *buf = &dev->params;
    struct isp_bls_cfg *cfg = &buf->params.bls;

    switch (input_fmt->mbus_code)
    {
    case MEDIA_BUS_FMT_SBGGR8_1X8:
    case MEDIA_BUS_FMT_SBGGR10_1X10:
    case MEDIA_BUS_FMT_SBGGR12_1X12:
        RKISP_WRITE(ISP3X_BLS_D_FIXED, cfg->r);
        RKISP_WRITE(ISP3X_BLS_C_FIXED, cfg->gr);
        RKISP_WRITE(ISP3X_BLS_B_FIXED, cfg->gb);
        RKISP_WRITE(ISP3X_BLS_A_FIXED, cfg->b);
        break;
    case MEDIA_BUS_FMT_SGBRG8_1X8:
    case MEDIA_BUS_FMT_SGBRG10_1X10:
    case MEDIA_BUS_FMT_SGBRG12_1X12:
        RKISP_WRITE(ISP3X_BLS_D_FIXED, cfg->gr);
        RKISP_WRITE(ISP3X_BLS_C_FIXED, cfg->r);
        RKISP_WRITE(ISP3X_BLS_B_FIXED, cfg->b);
        RKISP_WRITE(ISP3X_BLS_A_FIXED, cfg->gb);
        break;
    case MEDIA_BUS_FMT_SGRBG8_1X8:
    case MEDIA_BUS_FMT_SGRBG10_1X10:
    case MEDIA_BUS_FMT_SGRBG12_1X12:
        RKISP_WRITE(ISP3X_BLS_D_FIXED, cfg->gb);
        RKISP_WRITE(ISP3X_BLS_C_FIXED, cfg->b);
        RKISP_WRITE(ISP3X_BLS_B_FIXED, cfg->r);
        RKISP_WRITE(ISP3X_BLS_A_FIXED, cfg->gr);
        break;
    case MEDIA_BUS_FMT_SRGGB8_1X8:
    case MEDIA_BUS_FMT_SRGGB10_1X10:
    case MEDIA_BUS_FMT_SRGGB12_1X12:
        RKISP_WRITE(ISP3X_BLS_D_FIXED, cfg->b);
        RKISP_WRITE(ISP3X_BLS_C_FIXED, cfg->gb);
        RKISP_WRITE(ISP3X_BLS_B_FIXED, cfg->gr);
        RKISP_WRITE(ISP3X_BLS_A_FIXED, cfg->r);
        break;
    }
    RKISP_WRITE(ISP3X_BLS_CTRL, 1);
    RKISP_WRITE(ISP32_BLS_ISP_OB_PREDGAIN, 0);
}

static void isp_awbgain_cfg(struct rk_isp_dev *dev)
{
    struct rkisp_params_buffer *buf = &dev->params;
    struct isp_awbgain_cfg *awbgain = &buf->params.awbgain;
    uint32_t val;

    val = awbgain->gr << 16 | awbgain->gb;
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN0_G, val);
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN1_G, val);
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN2_G, val);
    val = awbgain->r << 16 | awbgain->b;
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN0_RB, val);
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN1_RB, val);
    RKISP_WRITE(ISP3X_ISP_AWB_GAIN2_RB, val);
}

static void isp_awb_cfg(struct rk_isp_dev *dev)
{
    struct rk_camera_mbus_framefmt *mbus_fmt = &dev->input.cam_info.mbus_fmt;
    uint32_t w = mbus_fmt->width, h = mbus_fmt->height;
    uint32_t val;

    RKISP_WRITE(ISP3X_RAWAWB_BLK_CTRL, 0);
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_XCOOR03, 0);
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_XCOOR47, 0);
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_XCOOR8, 0);
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_YCOOR03, 0);
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_YCOOR47, 0);
    RKISP_WRITE(ISP32_RAWAWB_EXC_WP_WEIGHT0_3, 0);
    RKISP_WRITE(ISP32_RAWAWB_EXC_WP_WEIGHT4_6, 0);

    RKISP_WRITE(ISP3X_RAWAWB_WIN_OFFS, 0);
    val = h << 16 | w;
    RKISP_WRITE(ISP3X_RAWAWB_WIN_SIZE, val);
    val = (230 << 4) << 16 | (230 << 4);
    RKISP_WRITE(ISP3X_RAWAWB_LIMIT_RG_MAX, val);
    RKISP_WRITE(ISP3X_RAWAWB_LIMIT_BY_MAX, val);
    val = (16 * 3) << 16 | (16 * 3);
    RKISP_WRITE(ISP3X_RAWAWB_LIMIT_RG_MIN, val);
    RKISP_WRITE(ISP3X_RAWAWB_LIMIT_BY_MIN, val);
    val = 256 << 16;
    RKISP_WRITE(ISP3X_RAWAWB_YWEIGHT_CURVE_YCOOR8, val);
    val = 256 << 16 | 256;
    RKISP_WRITE(ISP3X_RAWAWB_PRE_WBGAIN_INV, val);

    val = 256 << 16 | 256;
    RKISP_WRITE(ISP32_ISP_AWB1_GAIN_G, val);
    RKISP_WRITE(ISP32_ISP_AWB1_GAIN_RB, val);
    val = 0x101c6881;
    RKISP_WRITE(ISP3X_RAWAWB_CTRL, val);
}

static void isp_rawae_cfg(struct rk_isp_dev *dev, uint32_t reg)
{
    struct rk_camera_mbus_framefmt *mbus_fmt = &dev->input.cam_info.mbus_fmt;
    uint32_t w = mbus_fmt->width, h = mbus_fmt->height;
    uint32_t val, wnd_num = 15;

    if (reg == ISP3X_RAWAE_BIG2_BASE)
        RKISP_WRITE(ISP3X_VI_ISP_PATH, 0x400000);
    RKISP_WRITE(reg + ISP3X_RAWAE_BIG_OFFSET, 0);
    val = ((h / wnd_num - 2) & ~1) << 16 |
          ((w / wnd_num - 2) & ~1);
    RKISP_WRITE(reg + ISP3X_RAWAE_BIG_BLK_SIZE, val);
    RKISP_WRITE(reg + ISP3X_RAWAE_BIG_WND1_OFFSET, 0);
    val = (h & ~1) << 16 | (w & ~1);
    RKISP_WRITE(reg + ISP3X_RAWAE_BIG_WND1_SIZE, val);

    RKISP_WRITE(reg + ISP3X_RAWAE_BIG_CTRL, 0x5);
}

static void isp_rawaelite_cfg(struct rk_isp_dev *dev)
{
    struct rk_camera_mbus_framefmt *mbus_fmt = &dev->input.cam_info.mbus_fmt;
    uint32_t w = mbus_fmt->width, h = mbus_fmt->height;
    uint32_t val, wnd_num = 5;

    RKISP_WRITE(ISP3X_RAWAE_LITE_OFFSET, 0);
    val = ((h / wnd_num - 2) & ~1) << 16 |
          ((w / wnd_num - 2) & ~1);
    RKISP_WRITE(ISP3X_RAWAE_LITE_BLK_SIZ, val);

    RKISP_WRITE(ISP3X_RAWAE_LITE_CTRL, 0x2);
}

static void isp_rawhist_cfg(struct rk_isp_dev *dev, uint32_t reg)
{
    struct rk_camera_mbus_framefmt *mbus_fmt = &dev->input.cam_info.mbus_fmt;
    uint32_t w = mbus_fmt->width, h = mbus_fmt->height;
    uint32_t val, i, wnd_num = 15;

    for (i = 0; i < 45; i++)
        RKISP_WRITE(reg + ISP3X_RAWHIST_BIG_WEIGHT_BASE, 0x1041041);
    RKISP_WRITE(reg + ISP3X_RAWHIST_BIG_RAW2Y_CC, 0x1d4b4d);
    RKISP_WRITE(reg + ISP3X_RAWHIST_BIG_OFFS, 0);
    val = ((h / wnd_num - 2) & ~1) << 16 |
          ((w / wnd_num - 2) & ~1);
    RKISP_WRITE(reg + ISP3X_RAWHIST_BIG_SIZE, val);
    RKISP_WRITE(reg + ISP3X_RAWHIST_BIG_CTRL, 0x20000501);
}

static void isp_baynr_cfg(struct rk_isp_dev *dev)
{
    struct rkisp_params_buffer *buf = &dev->params;
    struct isp_baynr_cfg *cfg = &buf->params.baynr;

    uint32_t i, value;

    //ISP32_MODULE_EN
    value = 0x01;
    value |= !!cfg->bay3d_gain_en << 16 |
             (cfg->lg2_mode & 0x3) << 12 |
             !!cfg->gauss_en << 8 |
             !!cfg->log_bypass << 4;
    RKISP_WRITE(ISP3X_BAYNR_CTRL, value);

    value = ISP_PACK_2SHORT(cfg->dgain0, cfg->dgain1);
    RKISP_WRITE(ISP3X_BAYNR_DGAIN0, value);

    RKISP_WRITE(ISP3X_BAYNR_DGAIN1, cfg->dgain2);
    RKISP_WRITE(ISP3X_BAYNR_PIXDIFF, cfg->pix_diff);

    value = ISP_PACK_2SHORT(cfg->softthld, cfg->diff_thld);
    RKISP_WRITE(ISP3X_BAYNR_THLD, value);

    value = ISP_PACK_2SHORT(cfg->reg_w1, cfg->bltflt_streng);
    RKISP_WRITE(ISP3X_BAYNR_W1_STRENG, value);

    for (i = 0; i < ISP_BAYNR_XY_NUM / 2; i++)
    {
        value = ISP_PACK_2SHORT(cfg->sigma_x[2 * i], cfg->sigma_x[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAYNR_SIGMAX01 + 4 * i, value);
    }

    for (i = 0; i < ISP_BAYNR_XY_NUM / 2; i++)
    {
        value = ISP_PACK_2SHORT(cfg->sigma_y[2 * i], cfg->sigma_y[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAYNR_SIGMAY01 + 4 * i, value);
    }

    value = (cfg->weit_d2 & 0x3FF) << 20 |
            (cfg->weit_d1 & 0x3FF) << 10 |
            (cfg->weit_d0 & 0x3FF);
    RKISP_WRITE(ISP3X_BAYNR_WRIT_D, value);

    value = ISP_PACK_2SHORT(cfg->lg2_off, cfg->lg2_lgoff);
    RKISP_WRITE(ISP3X_BAYNR_LG_OFF, value);

    value = cfg->dat_max & 0xfffff;
    RKISP_WRITE(ISP3X_BAYNR_DAT_MAX, value);

    value = ISP_PACK_2SHORT(cfg->rgain_off, cfg->bgain_off);
    RKISP_WRITE(ISP32_BAYNR_SIGOFF, value);

    for (i = 0; i < ISP_BAYNR_GAIN_NUM / 4; i++)
    {
        value = ISP_PACK_4BYTE(cfg->gain_x[i * 4], cfg->gain_x[i * 4 + 1],
                               cfg->gain_x[i * 4 + 2], cfg->gain_x[i * 4 + 3]);
        RKISP_WRITE(ISP32_BAYNR_GAINX03 + i * 4, value);
    }

    for (i = 0; i < ISP_BAYNR_GAIN_NUM / 2; i++)
    {
        value = ISP_PACK_2SHORT(cfg->gain_y[i * 2], cfg->gain_y[i * 2 + 1]);
        RKISP_WRITE(ISP32_BAYNR_GAINY01 + i * 4, value);
    }
}

static void isp_bay3d_cfg(struct rk_isp_dev *dev)
{
    struct rkisp_params_buffer *buf = &dev->params;
    struct isp_bay3d_cfg *cfg = &buf->params.bay3d;
    uint32_t i, value;

    value = RKISP_READ(ISP3X_ISP_CTRL1);

    if (cfg->is_first)
    {
        value |= ISP3X_RAW3D_FST_FRAME;
        RKISP_WRITE(ISP3X_ISP_CTRL1, value);
    }
    else
    {
        value &= ~(ISP3X_RAW3D_FST_FRAME);
        RKISP_WRITE(ISP3X_ISP_CTRL1, value);
    }

    RKISP_WRITE(ISP3X_MI_BAY3D_CUR_WR_LENGTH, cfg->wsize);
    RKISP_WRITE(ISP3X_MI_BAY3D_CUR_RD_LENGTH, cfg->wsize);

    RKISP_WRITE(ISP3X_MI_BAY3D_CUR_WR_SIZE, cfg->cur_size);
    RKISP_WRITE(ISP32_MI_BAY3D_CUR_RD_SIZE, cfg->cur_size);
    RKISP_WRITE(ISP3X_MI_BAY3D_IIR_WR_SIZE, cfg->iir_size);
    RKISP_WRITE(ISP3X_MI_BAY3D_DS_WR_SIZE, cfg->ds_size);

    // TODO ADD BUFFER ADDRESS
    RKISP_WRITE(ISP3X_MI_BAY3D_IIR_WR_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off);
    RKISP_WRITE(ISP3X_MI_BAY3D_IIR_RD_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off);

    RKISP_WRITE(ISP3X_MI_BAY3D_DS_WR_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off + cfg->iir_size);
    RKISP_WRITE(ISP3X_MI_BAY3D_DS_RD_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off + cfg->iir_size);

    RKISP_WRITE(ISP3X_MI_BAY3D_CUR_WR_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off + cfg->iir_size + cfg->ds_size);
    RKISP_WRITE(ISP3X_MI_BAY3D_CUR_RD_BASE, RT_USING_ISP_DDR_ADRESS + cfg->buf_off + cfg->iir_size + cfg->ds_size);

    value = cfg->wrap_line << 16 | 28;
    RKISP_WRITE(ISP3X_BAY3D_MI_ST, value);

    RKISP_WRITE(ISP3X_BAY3D_IN_IRQ_LINECNT, 0x5fe004e);

    value = ISP3X_BAY3D_IIR_WR_AUTO_UPD | ISP3X_BAY3D_CUR_WR_AUTO_UPD |
            ISP3X_BAY3D_DS_WR_AUTO_UPD | ISP3X_BAY3D_IIRSELF_UPD |
            ISP3X_BAY3D_CURSELF_UPD | ISP3X_BAY3D_DSSELF_UPD |
            ISP3X_BAY3D_RDSELF_UPD;
    RKISP_WRITE(MI_WR_CTRL2, value);

    value |= !!cfg->loswitch_protect << 12 |
             !!cfg->bwsaving_en << 13 |
             !!cfg->glbpk_en << 11 |
             !!cfg->logaus3_bypass_en << 10 |
             !!cfg->logaus5_bypass_en << 9 |
             !!cfg->lomed_bypass_en << 8 |
             !!cfg->hichnsplit_en << 7 |
             !!cfg->hiabs_possel << 6 |
             !!cfg->higaus_bypass_en << 5 |
             !!cfg->himed_bypass_en << 4 |
             !!cfg->lobypass_en << 3 |
             !!cfg->hibypass_en << 2 |
             !!cfg->bypass_en << 1 | 1;
    RKISP_WRITE(ISP3X_BAY3D_CTRL, value);

    value = !!cfg->wgtmix_opt_en << 12 |
            !!cfg->curds_high_en << 8 |
            !!cfg->iirwr_rnd_en << 7 |
            !!cfg->lo4x4_en << 4 |
            !!cfg->lo4x8_en << 3 |
            !!cfg->bwopt_gain_dis << 2 |
            !!cfg->hiwgt_opt_en;

    value |= !!cfg->higaus5x5_en << 11 |
             (cfg->higaus3_mode & 0x3) << 9 |
             !!cfg->pksig_ind_sel << 6 |
             !!cfg->hisig_ind_sel << 5 |
             !!cfg->hichncor_en << 1; //isp32
    RKISP_WRITE(ISP32_BAY3D_CTRL1, value);

    value = ISP_PACK_2SHORT(cfg->softwgt, cfg->hidif_th);
    RKISP_WRITE(ISP3X_BAY3D_KALRATIO, value);

    RKISP_WRITE(ISP3X_BAY3D_GLBPK2, cfg->glbpk2);

    value = ISP_PACK_2SHORT(cfg->wgtlmt, cfg->wgtratio);
    RKISP_WRITE(ISP3X_BAY3D_WGTLMT, value);

    for (i = 0; i < ISP_BAY3D_XY_NUM / 2; i++)
    {
        value = ISP_PACK_2SHORT(cfg->sig0_x[2 * i],
                                cfg->sig0_x[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAY3D_SIG0_X0 + 4 * i, value);

        value = ISP_PACK_2SHORT(cfg->sig1_x[2 * i],
                                cfg->sig1_x[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAY3D_SIG1_X0 + 4 * i, value);
    }

    for (i = 0; i < ISP_BAY3D_XY_NUM / 2; i++)
    {
        value = ISP_PACK_2SHORT(cfg->sig0_y[2 * i],
                                cfg->sig0_y[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAY3D_SIG0_Y0 + 4 * i, value);

        value = ISP_PACK_2SHORT(cfg->sig1_y[2 * i],
                                cfg->sig1_y[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAY3D_SIG1_Y0 + 4 * i, value);

        value = ISP_PACK_2SHORT(cfg->sig2_y[2 * i],
                                cfg->sig2_y[2 * i + 1]);
        RKISP_WRITE(ISP3X_BAY3D_SIG2_Y0 + 4 * i, value);
    }

    value = ISP_PACK_2SHORT(cfg->hisigrat0, cfg->hisigrat1);
    RKISP_WRITE(ISP32_BAY3D_HISIGRAT, value);

    value = ISP_PACK_2SHORT(cfg->hisigoff0, cfg->hisigoff1);
    RKISP_WRITE(ISP32_BAY3D_HISIGOFF, value);

    value = ISP_PACK_2SHORT(cfg->losigoff, cfg->losigrat);
    RKISP_WRITE(ISP32_BAY3D_LOSIG, value);

    value = ISP_PACK_2SHORT(cfg->rgain_off, cfg->bgain_off);
    RKISP_WRITE(ISP32_BAY3D_SIGPK, value);

    value = ISP_PACK_4BYTE(cfg->siggaus0, cfg->siggaus1, cfg->siggaus2, 0);
    value |= (cfg->siggaus3 << 24); //isp32
    RKISP_WRITE(ISP32_BAY3D_SIGGAUS, value);
}

static void rk_isp_module_init_v32(struct rk_isp_dev *dev)
{
    isp_rawaelite_cfg(dev);
    isp_rawae_cfg(dev, ISP3X_RAWAE_BIG2_BASE);
    isp_awb_cfg(dev);
    isp_awbgain_cfg(dev);
    isp_bls_cfg(dev);
#ifdef RT_USING_RK_AOV
    isp_bay3d_cfg(dev);
    isp_baynr_cfg(dev);
#endif
}

static void rk_isp_read_stats_v32(struct rk_isp_dev *dev)
{
    struct rkisp_stats_buffer *buf = &dev->stats;
    uint32_t i, val, ctrl, ris;

    ris = RKISP_READ(ISP3X_ISP_3A_RIS);
    if (ris)
    {
        RKISP_WRITE(ISP3X_ISP_ICR, ris);

        buf->meas_type = 0;
        buf->frame_id = dev->frame_id;
        if (ris & ISP3X_3A_RAWAE_CH0)
        {
            ctrl = RKISP_READ(ISP3X_RAWAE_LITE_CTRL);
            if (ctrl & BIT(31))
            {
                for (i = 0; i < ISP_RAWAELITE_MEAN_NUM; i++)
                {
                    val = RKISP_READ(ISP3X_RAWAE_LITE_RO_MEAN + i * 4);
                    buf->stats.rawae0.data[i].channelg_xy = val & 0xfff;
                    buf->stats.rawae0.data[i].channelb_xy = (val >> 12) & 0x3ff;
                    buf->stats.rawae0.data[i].channelr_xy = (val >> 22) & 0x3ff;
                }
                RKISP_WRITE(ISP3X_RAWAE_LITE_CTRL, ctrl);
                buf->meas_type |= ISP_MODULE_RAWAE0;
            }
        }

        if (ris & ISP3X_3A_RAWAE_CH1)
        {
            ctrl = RKISP_READ(ISP3X_RAWAE_BIG2_BASE + ISP3X_RAWAE_BIG_CTRL);
            if (ctrl & BIT(31))
            {
                for (i = 0; i < ISP_RAWAEBIG_MEAN_NUM; i++)
                {
                    val = RKISP_READ(ISP3X_RAWAE_BIG2_BASE + ISP3X_RAWAE_BIG_RO_MEAN_BASE_ADDR);
                    buf->stats.rawae1.data[i].channelg_xy = val & 0xfff;
                    buf->stats.rawae1.data[i].channelb_xy = (val >> 12) & 0x3ff;
                    buf->stats.rawae1.data[i].channelr_xy = (val >> 22) & 0x3ff;
                }
                RKISP_WRITE(ISP3X_RAWAE_BIG2_BASE + ISP3X_RAWAE_BIG_CTRL, ctrl);
                buf->meas_type |= ISP_MODULE_RAWAE1;
            }
        }

        if (ris & ISP3X_3A_RAWAWB)
        {
            ctrl = RKISP_READ(ISP3X_RAWAWB_CTRL);
            if (ctrl & BIT(31))
            {
                buf->stats.rawawb.rgain_nor = RKISP_READ(ISP3X_RAWAWB_SUM_RGAIN_NOR_0);
                buf->stats.rawawb.bgain_nor = RKISP_READ(ISP3X_RAWAWB_SUM_BGAIN_NOR_0);
                buf->stats.rawawb.wp_num_nor = RKISP_READ(ISP3X_RAWAWB_WP_NUM_NOR_0);
                buf->stats.rawawb.rgain_big = RKISP_READ(ISP3X_RAWAWB_SUM_RGAIN_BIG_0);
                buf->stats.rawawb.bgain_big = RKISP_READ(ISP3X_RAWAWB_SUM_BGAIN_BIG_0);
                buf->stats.rawawb.wp_num_big = RKISP_READ(ISP3X_RAWAWB_WP_NUM_BIG_0);
                buf->stats.rawawb.wp_num2 = RKISP_READ(ISP3X_RAWAWB_WPNUM2_0);
                RKISP_WRITE(ISP3X_RAWAWB_CTRL, ctrl);
                buf->meas_type |= ISP_MODULE_RAWAWB;
            }
        }

#ifdef RT_USING_RK_AOV
        ctrl = RKISP_READ(ISP3X_BAY3D_CTRL);
        if (ctrl & BIT(0)) //check en bit
        {
            buf->stats.baytnr.sum_lodif_0 = RKISP_READ(ISP3X_BAY3D_LODIF_STAT0);
            buf->stats.baytnr.sum_lodif_1 = RKISP_READ(ISP3X_BAY3D_LODIF_STAT1);
            buf->stats.baytnr.sum_hidif_0 = RKISP_READ(ISP3X_BAY3D_HIDIF_STAT0);
            buf->stats.baytnr.sum_hidif_1 = RKISP_READ(ISP3X_BAY3D_HIDIF_STAT1);
        }
#endif
        if (buf->meas_type)
            rt_sem_release(dev->stats_sem);
    }
}

static void rk_isp_module_init_v33(struct rk_isp_dev *dev)
{
    uint32_t val;

    isp_bls_cfg(dev);
    isp_awbgain_cfg(dev);
    isp_awb_cfg(dev);
    isp_rawae_cfg(dev, ISP3X_RAWAE_LITE_BASE);
    isp_rawhist_cfg(dev, ISP3X_RAWHIST_LITE_CTRL);

    val = dev->w3a_mem_addr;
    RKISP_WRITE(ISP33_W3A_AEBIG_ADDR, val);
    val += sizeof(struct isp33_rawae_stat) + sizeof(struct isp33_rawhist_stat);
    RKISP_WRITE(ISP33_W3A_AE0_ADDR, val);
    val += sizeof(struct isp33_rawae_stat) + sizeof(struct isp33_rawhist_stat);
    RKISP_WRITE(ISP33_W3A_AWB_ADDR, val);
    RKISP_WRITE(ISP3X_SWS_CFG, 0x1000008);
    RKISP_WRITE(ISP33_W3A_CTRL0, 0x80000011);
    RKISP_WRITE(ISP33_W3A_WR_SIZE, dev->w3a_mem_size);
}

static void rk_isp_read_stats_v33(struct rk_isp_dev *dev)
{
    struct rkisp_stats_buffer *buf = &dev->stats;
    struct isp33_stat *stat_buf = (struct isp33_stat *)dev->w3a_mem_addr;
    uint32_t i, j, ris;

    ris = RKISP_READ(ISP3X_ISP_3A_RIS);
    if (ris)
    {
        RKISP_WRITE(ISP3X_ISP_3A_ICR, ris);

        buf->meas_type = 0;
        buf->frame_id = dev->frame_id;
        if (ris & ISP3X_3A_RAWAE_CH0)
        {
            for (i = 0; i < ISP33_MEAN_BLK_Y_NUM; i++)
                for (j = 0; j < ISP33_MEAN_BLK_X_NUM; j++)
                {
                    buf->stats.rawae1.data[i * ISP33_MEAN_BLK_X_NUM + j].channelg_xy = stat_buf->rawae0.blk_y[i].blk_x[j].g;
                    buf->stats.rawae1.data[i * ISP33_MEAN_BLK_X_NUM + j].channelb_xy = stat_buf->rawae0.blk_y[i].blk_x[j].b;
                    buf->stats.rawae1.data[i * ISP33_MEAN_BLK_X_NUM + j].channelr_xy = stat_buf->rawae0.blk_y[i].blk_x[j].r;
                }
            buf->meas_type |= ISP_MODULE_RAWAE0;
        }

        if (ris & ISP3X_3A_RAWAWB)
        {
            buf->stats.rawawb.rgain_nor = stat_buf->rawawb.sum[0].rgain_nor;
            buf->stats.rawawb.bgain_nor = stat_buf->rawawb.sum[0].bgain_nor;
            buf->stats.rawawb.wp_num_nor = stat_buf->rawawb.sum[0].wp_num_nor;
            buf->stats.rawawb.rgain_big = stat_buf->rawawb.sum[0].rgain_big;
            buf->stats.rawawb.bgain_big = stat_buf->rawawb.sum[0].bgain_big;
            buf->stats.rawawb.wp_num_big = stat_buf->rawawb.sum[0].wp_num_big;
            buf->stats.rawawb.wp_num2 = stat_buf->rawawb.sum[0].wp_num2;
            buf->meas_type |= ISP_MODULE_RAWAWB;
        }
        if (buf->meas_type)
            rt_sem_release(dev->stats_sem);
    }
}

static void rk_isp_read_stats(struct rk_isp_dev *dev)
{
#if defined(SOC_RV1106)
    rk_isp_read_stats_v32(dev);
#else
    rk_isp_read_stats_v33(dev);
#endif
}

static void rk_isp_sof(struct rk_isp_dev *dev)
{
    struct rk_isp_device *device = &dev->parent;

    dev->frame_id++;
    if (device->parent.rx_indicate != RT_NULL)
        device->parent.rx_indicate(&device->parent, dev->frame_id);
}

rt_err_t rk_isp_isr(struct rk_isp_dev *dev, uint32_t mis)
{
    rt_err_t ret = RT_EOK;

    rk_isp_function_enter();

    RT_ASSERT(dev != RT_NULL);

    /* sof event */
    if (mis & ISP3X_V_START)
        rk_isp_sof(dev);

    /* frame end */
    if (mis & ISP3X_FRAME)
    {
        rk_isp_read_stats(dev);
        isp_awbgain_cfg(dev);
    }
    /* update params */
    rk_isp_function_exit();

    return ret;
}

rt_err_t rk_isp_module_init(struct rk_isp_dev *dev)
{
    rt_err_t ret = RT_EOK;

    rk_isp_function_enter();

    RT_ASSERT(dev != RT_NULL);

    dev->frame_id = 0;
#if defined(SOC_RV1106)
    rk_isp_module_init_v32(dev);
#else
    rk_isp_module_init_v33(dev);
#endif

    rk_isp_function_exit();

    return ret;
}

rt_err_t rk_isp_set_params(struct rk_isp_dev *dev, struct rkisp_params_buffer *buf)
{
    rt_err_t ret = RT_EOK;
    rt_base_t level;

    rk_isp_function_enter();

    RT_ASSERT(dev != RT_NULL);
    RT_ASSERT(buf != RT_NULL);

    level = rt_hw_interrupt_disable();
    rt_memcpy(&dev->params, buf, sizeof(*buf));
    rt_hw_interrupt_enable(level);

    rk_isp_function_exit();

    return ret;
}

rt_err_t rk_isp_get_stat(struct rk_isp_dev *dev, struct rkisp_stats_buffer *buf)
{
    rt_err_t ret;
    rt_base_t level;

    rk_isp_function_enter();

    RT_ASSERT(dev != RT_NULL);
    RT_ASSERT(buf != RT_NULL);

    ret = rt_sem_take(dev->stats_sem, RT_WAITING_FOREVER);
    if (ret != RT_EOK)
    {
        ISP_INFO(dev, "Err: take stat sem failed!\n");
        return -RT_ERROR;
    }

    level = rt_hw_interrupt_disable();
    rt_memcpy(buf, &dev->stats, sizeof(*buf));
    rt_hw_interrupt_enable(level);

    rk_isp_function_exit();

    return ret;
}

#endif
