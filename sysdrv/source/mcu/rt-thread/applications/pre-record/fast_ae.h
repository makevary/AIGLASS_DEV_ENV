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

#ifndef _ISP_FASTAE_H_
#define _ISP_FASTAE_H_

#include "../drivers/isp3/drv_isp3.h"

#include "ae.h"
#include "awb.h"

#include "rkisp32-config.h"
#include "rkisp33-config.h"

#include "rk_meta.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"
#include "sensor_2a_common.h"
#include "rk_meta_app_param.h"

#include "board.h"
#include "board_cam.h"
#include "drivers/rt_drv_pwm.h"
#include "als/drv_als.h"

#define RKISP_RAW_FLAG_FILE_START     0XFF00
#define RKISP_RAW_FLAG_FILE_END       0X00FF
#define RKISP_RAW_FLAG_RAW_DATA       0XFF01
#define RKISP_RAW_FLAG_RAW_FORMAT     0XFF02
#define RKISP_RAW_FLAG_RAW_INF        0XFF03
#define RKISP_RAW_FLAG_ISP_REG        0XFF04
#define RKISP_RAW_FLAG_ISPP_REG       0XFF05
#define RKISP_RAW_FLAG_ISP_PLATFORM   0XFF06

#define RKISP_RAW_BAYER_BGGR  1
#define RKISP_RAW_BAYER_GBRG  2
#define RKISP_RAW_BAYER_GRBG  3
#define RKISP_RAW_BAYER_RGBG  4

#define RKISP_RAW_FRAME_TYPE_S  1
#define RKISP_RAW_FRAME_TYPE_M  2
#define RKISP_RAW_FRAME_TYPE_L  3

#define RKISP_RAW_BUF_TYPE_COMPACT  0
#define RKISP_RAW_BUF_TYPE_SHORT    1

#define EXP_VAL_LOG_NUM 8
#define EXP_INVALID_VAL 0x7FFFFFFF

struct expval_log
{
    uint32_t set_to_sensor;
    uint32_t frame_id;
    FIXED exposure;
    struct rk_camera_exp_val exp;
};

struct iq_config
{
    rt_thread_t stat_tid;
    rt_thread_t exp_tid;
    uint32_t stat_exit;
    uint32_t exp_exit;
    rt_sem_t stat_exitsem;
    rt_sem_t exp_exitsem;
    rt_device_t isp;
    rt_device_t sensor;
    rt_sem_t exp_sem;
    rt_mutex_t exp_mutex;
    struct expval_log expval;

    struct expval_log explog[EXP_VAL_LOG_NUM];
    uint32_t explog_wid;
    uint32_t frame_id;

    uint32_t skip_stat_num;
    uint32_t skip_stat_idx;
    uint32_t exp_dly;
    uint32_t is_match;
    uint32_t is_over_range;
    uint32_t conv_num;
};

#define MAX_PRE_BUF_NUM 4

struct shared_data
{
    uint16_t enable;
    uint16_t complete;
    uint16_t frame_num;
    uint16_t hdr_mode;
    uint16_t rtt_mode;  // 0: normal, 1: multi-frame, 2: single-frame
    uint16_t width;     // arm resolution, used by setting ISP config
    uint16_t height;    // arm resolution, used by setting ISP config
    uint16_t camera_num;
    uint16_t camera_index;
    uint16_t md_flag;  // 0: no move, 1: move

    uint32_t exp_time[3];
    uint32_t exp_gain[3];
    uint32_t exp_time_reg[3];
    uint32_t exp_gain_reg[3];
    uint32_t exp_isp_dgain[3];
    uint32_t dcg_mode[3]; // 0: normal, 1: low-dcg, 2: high-dcg
    uint32_t nr_buf_size;
    uint32_t share_mem_size;

    uint32_t pre_buf_num;
    uint32_t pre_buf_addr[MAX_PRE_BUF_NUM];
#ifdef ISP_HW_V32
    struct isp32_isp_params_cfg cfg;
#elif ISP_HW_V33
    struct isp33_isp_params_cfg cfg;
#endif
} __attribute__((packed));

struct __packed _raw_data
{
    uint16_t flag;
    uint32_t size;
    uint32_t ddr_haddr;
    uint32_t ddr_laddr;
    uint32_t raw_size;
};

struct __packed _raw_format
{
    uint16_t flag;
    uint32_t size;
    uint16_t vesrion;
    char sensor[32];
    char scene[32];
    uint32_t frame_no;
    uint16_t width;
    uint16_t height;
    uint8_t bitw;
    uint8_t bayer;
    uint8_t hdr_frame_cnt;
    uint8_t frame_type;
    uint8_t buf_type;
    uint16_t row_len;
    uint16_t valid_row_len;
    char remark[32];
};

struct __packed _frame_inf
{
    uint16_t flag;
    uint32_t size;
    uint16_t vesrion;
    float normal_exp;
    float normal_gain;
    float hdr_exp_l;
    float hdr_exp_m;
    float hdr_exp_s;
    float hdr_gain_l;
    float hdr_gain_m;
    float hdr_gain_s;
    float awg_rgain;
    float awg_bgain;
    char awg_ill[16];
};

struct __packed _isp_reg
{
    uint16_t flag;
    uint32_t size;
};

struct __packed _ispp_reg
{
    uint16_t flag;
    uint32_t size;
};

struct __packed _isp_platform
{
    uint16_t flag;
    uint32_t size;
    char   chip[32];
    char   isp[32];
    char   aiq[32];
    char   kernel[32];
    char   driver[32];
};

union __packed rkisp_raw_data
{
    uint16_t file_start;
    struct __packed _raw_data raw_data;
    struct __packed _raw_format raw_format;
    struct __packed _frame_inf frame_inf;
    struct __packed _isp_reg isp_reg;
    struct __packed _ispp_reg  ispp_reg;
    struct __packed _isp_platform isp_platform;
    uint16_t file_end;
};

extern int32_t start_ae(rk_device *isp, rk_device *sensor);
extern int32_t stop_ae(struct rk_isp_dev *ispdev);
extern int32_t isae_match();
extern int32_t isae_over_range();
extern int32_t get_expinfo(uint32_t frm_id, struct rk_camera_exp_val *exp);
extern int32_t set_firstae(rk_device *isp, rk_device *sensor, struct shared_data *share, rt_sem_t *sem);
extern uint32_t get_rtt_fps();
int secondary_config(struct rk_camera_dst_config *cam_config);
int fast_ae_get_max_frame(void);
extern int32_t set_params(rk_device *isp, struct rkisp_params_buffer *buf);
extern int32_t get_fastawb_params(struct isp_awbgain_cfg *rtt_awbgain);
extern void get_rtt_stream_params();
#endif
