/**
  * Copyright (c) 2024 Rockchip Electronic Co.,Ltd
  *
  * SPDX-License-Identifier: Apache-2.0
  ******************************************************************************
  * @version V0.0.1
  *
  * Change Logs:
  * Date           Author          Notes
  * 2024-05-07     ISP Team      first implementation
  *
  ******************************************************************************
  */

#ifndef _UAPI_RK_ISP39_CONFIG_H
#define _UAPI_RK_ISP39_CONFIG_H

#include "rkisp32-config.h"

#define ISP39_MODULE_DPCC		ISP3X_MODULE_DPCC
#define ISP39_MODULE_BLS		ISP3X_MODULE_BLS
#define ISP39_MODULE_SDG		ISP3X_MODULE_SDG
#define ISP39_MODULE_LSC		ISP3X_MODULE_LSC
#define ISP39_MODULE_AWB_GAIN		ISP3X_MODULE_AWB_GAIN
#define ISP39_MODULE_BDM		ISP3X_MODULE_BDM
#define ISP39_MODULE_CCM		ISP3X_MODULE_CCM
#define ISP39_MODULE_GOC		ISP3X_MODULE_GOC
#define ISP39_MODULE_CPROC		ISP3X_MODULE_CPROC
#define ISP39_MODULE_IE			ISP3X_MODULE_IE
#define ISP39_MODULE_RAWAF		ISP3X_MODULE_RAWAF
#define ISP39_MODULE_RAWAE0		ISP3X_MODULE_RAWAE0
#define ISP39_MODULE_RAWAE1		ISP3X_MODULE_RAWAE1
#define ISP39_MODULE_RAWAE2		ISP3X_MODULE_RAWAE2
#define ISP39_MODULE_RAWAE3		ISP3X_MODULE_RAWAE3
#define ISP39_MODULE_RAWAWB		ISP3X_MODULE_RAWAWB
#define ISP39_MODULE_RAWHIST0		ISP3X_MODULE_RAWHIST0
#define ISP39_MODULE_RAWHIST1		ISP3X_MODULE_RAWHIST1
#define ISP39_MODULE_RAWHIST2		ISP3X_MODULE_RAWHIST2
#define ISP39_MODULE_RAWHIST3		ISP3X_MODULE_RAWHIST3
#define ISP39_MODULE_HDRMGE		ISP3X_MODULE_HDRMGE
#define ISP39_MODULE_RAWNR		ISP3X_MODULE_RAWNR
#define ISP39_MODULE_GIC		ISP3X_MODULE_GIC
#define ISP39_MODULE_DHAZ		ISP3X_MODULE_DHAZ
#define ISP39_MODULE_3DLUT		ISP3X_MODULE_3DLUT
#define ISP39_MODULE_LDCH		ISP3X_MODULE_LDCH
#define ISP39_MODULE_GAIN		ISP3X_MODULE_GAIN
#define ISP39_MODULE_DEBAYER		ISP3X_MODULE_DEBAYER
#define ISP39_MODULE_BAYNR		ISP3X_MODULE_BAYNR
#define ISP39_MODULE_BAY3D		ISP3X_MODULE_BAY3D
#define ISP39_MODULE_YNR		ISP3X_MODULE_YNR
#define ISP39_MODULE_CNR		ISP3X_MODULE_CNR
#define ISP39_MODULE_SHARP		ISP3X_MODULE_SHARP
#define ISP39_MODULE_DRC		ISP3X_MODULE_DRC
#define ISP39_MODULE_CAC		ISP3X_MODULE_CAC
#define ISP39_MODULE_CSM		ISP3X_MODULE_CSM
#define ISP39_MODULE_CGC		ISP3X_MODULE_CGC
#define ISP39_MODULE_LDCV		BIT_ULL(45)
#define ISP39_MODULE_YUVME		BIT_ULL(46)
#define ISP39_MODULE_RGBIR		BIT_ULL(47)

#define ISP39_MODULE_FORCE		ISP3X_MODULE_FORCE

/* Measurement types */
#define ISP39_STAT_RAWAWB		ISP3X_STAT_RAWAWB
#define ISP39_STAT_RAWAF		ISP3X_STAT_RAWAF
#define ISP39_STAT_RAWAE0		ISP3X_STAT_RAWAE0
#define ISP39_STAT_RAWAE1		ISP3X_STAT_RAWAE1
#define ISP39_STAT_RAWAE2		ISP3X_STAT_RAWAE2
#define ISP39_STAT_RAWAE3		ISP3X_STAT_RAWAE3
#define ISP39_STAT_RAWHST0		ISP3X_STAT_RAWHST0
#define ISP39_STAT_RAWHST1		ISP3X_STAT_RAWHST1
#define ISP39_STAT_RAWHST2		ISP3X_STAT_RAWHST2
#define ISP39_STAT_RAWHST3		ISP3X_STAT_RAWHST3
#define ISP39_STAT_BLS			ISP3X_STAT_BLS
#define ISP39_STAT_DHAZ			ISP3X_STAT_DHAZ
#define ISP39_STAT_INFO2DDR		BIT(19)
#define ISP39_STAT_BAY3D		BIT(20)

#define ISP39_MESH_BUF_NUM		ISP3X_MESH_BUF_NUM

#define ISP39_LSC_GRAD_TBL_SIZE		ISP3X_LSC_GRAD_TBL_SIZE
#define ISP39_LSC_SIZE_TBL_SIZE		ISP3X_LSC_SIZE_TBL_SIZE
#define ISP39_LSC_DATA_TBL_SIZE		ISP3X_LSC_DATA_TBL_SIZE

#define ISP39_DEGAMMA_CURVE_SIZE	ISP3X_DEGAMMA_CURVE_SIZE

#define ISP39_GAIN_IDX_NUM		ISP3X_GAIN_IDX_NUM
#define ISP39_GAIN_LUT_NUM		ISP3X_GAIN_LUT_NUM

#define ISP39_RAWAWB_WEIGHT_NUM		ISP3X_RAWAWB_WEIGHT_NUM
#define ISP39_RAWAWB_HSTBIN_NUM		ISP3X_RAWAWB_HSTBIN_NUM
#define ISP39_RAWAWB_SUM_NUM		4
#define ISP39_RAWAWB_EXCL_STAT_NUM	4

#define	ISP39_RAWAEBIG_SUBWIN_NUM	2

#define ISP39_RAWHISTBIG_SUBWIN_NUM	ISP3X_RAWHISTBIG_SUBWIN_NUM
#define ISP39_RAWHISTLITE_SUBWIN_NUM	ISP3X_RAWHISTLITE_SUBWIN_NUM
#define ISP39_HIST_BIN_N_MAX		ISP3X_HIST_BIN_N_MAX

#define ISP39_RAWAF_CURVE_NUM		ISP3X_RAWAF_CURVE_NUM
#define ISP39_RAWAF_HIIR_COE_NUM	ISP3X_RAWAF_HIIR_COE_NUM
#define ISP39_RAWAF_VFIR_COE_NUM	ISP3X_RAWAF_VFIR_COE_NUM
#define ISP39_RAWAF_WIN_NUM		ISP3X_RAWAF_WIN_NUM
#define ISP39_RAWAF_LINE_NUM		ISP3X_RAWAF_LINE_NUM
#define ISP39_RAWAF_GAMMA_NUM		ISP3X_RAWAF_GAMMA_NUM
#define ISP39_RAWAF_SUMDATA_NUM		ISP3X_RAWAF_SUMDATA_NUM
#define ISP39_RAWAF_VIIR_COE_NUM	3
#define ISP39_RAWAF_GAUS_COE_NUM	9

#define ISP39_DPCC_PDAF_POINT_NUM	ISP3X_DPCC_PDAF_POINT_NUM

#define ISP39_HDRMGE_L_CURVE_NUM	ISP3X_HDRMGE_L_CURVE_NUM
#define ISP39_HDRMGE_E_CURVE_NUM	ISP3X_HDRMGE_E_CURVE_NUM

#define ISP39_GIC_SIGMA_Y_NUM		ISP3X_GIC_SIGMA_Y_NUM

#define ISP39_CCM_CURVE_NUM		18
#define ISP39_CCM_HF_FACTOR_NUM		17

#define ISP39_3DLUT_DATA_NUM		ISP3X_3DLUT_DATA_NUM

#define ISP39_LDCH_BIC_NUM		36
#define ISP39_LDCV_BIC_NUM		36

#define ISP39_GAMMA_OUT_MAX_SAMPLES     ISP3X_GAMMA_OUT_MAX_SAMPLES

#define ISP39_DHAZ_SIGMA_IDX_NUM	ISP3X_DHAZ_SIGMA_IDX_NUM
#define ISP39_DHAZ_SIGMA_LUT_NUM	ISP3X_DHAZ_SIGMA_LUT_NUM
#define ISP39_DHAZ_HIST_WR_NUM		ISP3X_DHAZ_HIST_WR_NUM
#define ISP39_DHAZ_ENH_CURVE_NUM	ISP3X_DHAZ_ENH_CURVE_NUM
#define ISP39_DHAZ_ENH_LUMA_NUM		17
#define ISP39_DHAZ_BLEND_WET_NUM	17
#define ISP39_DHAZ_THUMB_ROW_MAX	8
#define ISP39_DHAZ_THUMB_COL_MAX	10
#define ISP39_DHAZ_HIST_IIR_NUM		16
#define ISP39_DHAZ_HIST_IIR_BLK_MAX	(ISP39_DHAZ_THUMB_ROW_MAX * ISP39_DHAZ_THUMB_COL_MAX)

#define ISP39_DRC_Y_NUM			ISP3X_DRC_Y_NUM

#define ISP39_CNR_SIGMA_Y_NUM		ISP3X_CNR_SIGMA_Y_NUM
#define ISP39_CNR_GAUS_COE_NUM		6
#define ISP39_CNR_GAUS_SIGMAR_NUM	8
#define ISP39_CNR_WGT_SIGMA_Y_NUM	13

#define ISP39_YNR_LOW_GAIN_ADJ_NUM	9
#define ISP39_YNR_XY_NUM		ISP3X_YNR_XY_NUM
#define ISP39_YNR_NLM_COE_NUM		6

#define ISP39_BAYNR_XY_NUM		ISP3X_BAYNR_XY_NUM
#define ISP39_BAYNR_GAIN_NUM		16

#define ISP39_BAY3D_XY_NUM		16
#define ISP39_BAY3D_WD_NUM		9
#define ISP39_BAY3D_TNRSIG_NUM		20
#define ISP39_BAY3D_COEFF_NUM		9

#define ISP39_SHARP_X_NUM		ISP3X_SHARP_X_NUM
#define ISP39_SHARP_Y_NUM		ISP3X_SHARP_Y_NUM
#define ISP39_SHARP_GAUS_COEF_NUM	ISP3X_SHARP_GAUS_COEF_NUM
#define ISP39_SHARP_GAIN_ADJ_NUM	14
#define ISP39_SHARP_STRENGTH_NUM	22
#define ISP39_SHARP_TEX_WET_LUT_NUM	17
#define ISP39_SHARP_DETAIL_STRG_NUM 17

#define ISP39_CAC_STRENGTH_NUM		ISP3X_CAC_STRENGTH_NUM

#define ISP39_CSM_COEFF_NUM		ISP3X_CSM_COEFF_NUM

#define ISP39_DEBAYER_LUMA_NUM		7
#define ISP39_DEBAYER_DRCT_OFFSET_NUM	8
#define ISP39_DEBAYER_VSIGMA_NUM	8

#define ISP39_RGBIR_SCALE_NUM		4
#define ISP39_RGBIR_LUMA_POINT_NUM	17
#define ISP39_RGBIR_SCALE_MAP_NUM	17

#define ISP39_YUVME_SIGMA_NUM		16

#define ISP39_MEAN_BLK_X_NUM		15
#define ISP39_MEAN_BLK_Y_NUM		15

#define ISP39_BNR2AEBIG_SEL_EN		0x10
#define ISP39_BNR2AE0_SEL_EN		0x20

struct isp39_dpcc_cfg {
	/* MODE */
	uint8_t stage1_enable;
	uint8_t grayscale_mode;
	/* OUTPUT_MODE */
	uint8_t border_bypass_mode;
	uint8_t sw_rk_out_sel;
	uint8_t sw_dpcc_output_sel;
	uint8_t stage1_rb_3x3;
	uint8_t stage1_g_3x3;
	uint8_t stage1_incl_rb_center;
	uint8_t stage1_incl_green_center;
	/* SET_USE */
	uint8_t stage1_use_fix_set;
	uint8_t stage1_use_set_3;
	uint8_t stage1_use_set_2;
	uint8_t stage1_use_set_1;
	/* METHODS_SET_1 */
	uint8_t sw_rk_red_blue1_en;
	uint8_t rg_red_blue1_enable;
	uint8_t rnd_red_blue1_enable;
	uint8_t ro_red_blue1_enable;
	uint8_t lc_red_blue1_enable;
	uint8_t pg_red_blue1_enable;
	uint8_t sw_rk_green1_en;
	uint8_t rg_green1_enable;
	uint8_t rnd_green1_enable;
	uint8_t ro_green1_enable;
	uint8_t lc_green1_enable;
	uint8_t pg_green1_enable;
	/* METHODS_SET_2 */
	uint8_t sw_rk_red_blue2_en;
	uint8_t rg_red_blue2_enable;
	uint8_t rnd_red_blue2_enable;
	uint8_t ro_red_blue2_enable;
	uint8_t lc_red_blue2_enable;
	uint8_t pg_red_blue2_enable;
	uint8_t sw_rk_green2_en;
	uint8_t rg_green2_enable;
	uint8_t rnd_green2_enable;
	uint8_t ro_green2_enable;
	uint8_t lc_green2_enable;
	uint8_t pg_green2_enable;
	/* METHODS_SET_3 */
	uint8_t sw_rk_red_blue3_en;
	uint8_t rg_red_blue3_enable;
	uint8_t rnd_red_blue3_enable;
	uint8_t ro_red_blue3_enable;
	uint8_t lc_red_blue3_enable;
	uint8_t pg_red_blue3_enable;
	uint8_t sw_rk_green3_en;
	uint8_t rg_green3_enable;
	uint8_t rnd_green3_enable;
	uint8_t ro_green3_enable;
	uint8_t lc_green3_enable;
	uint8_t pg_green3_enable;
	/* LINE_THRESH_1 */
	uint8_t sw_mindis1_rb;
	uint8_t sw_mindis1_g;
	uint8_t line_thr_1_rb;
	uint8_t line_thr_1_g;
	/* LINE_MAD_FAC_1 */
	uint8_t sw_dis_scale_min1;
	uint8_t sw_dis_scale_max1;
	uint8_t line_mad_fac_1_rb;
	uint8_t line_mad_fac_1_g;
	/* PG_FAC_1 */
	uint8_t pg_fac_1_rb;
	uint8_t pg_fac_1_g;
	/* RND_THRESH_1 */
	uint8_t rnd_thr_1_rb;
	uint8_t rnd_thr_1_g;
	/* RG_FAC_1 */
	uint8_t rg_fac_1_rb;
	uint8_t rg_fac_1_g;
	/* LINE_THRESH_2 */
	uint8_t sw_mindis2_rb;
	uint8_t sw_mindis2_g;
	uint8_t line_thr_2_rb;
	uint8_t line_thr_2_g;
	/* LINE_MAD_FAC_2 */
	uint8_t sw_dis_scale_min2;
	uint8_t sw_dis_scale_max2;
	uint8_t line_mad_fac_2_rb;
	uint8_t line_mad_fac_2_g;
	/* PG_FAC_2 */
	uint8_t pg_fac_2_rb;
	uint8_t pg_fac_2_g;
	/* RND_THRESH_2 */
	uint8_t rnd_thr_2_rb;
	uint8_t rnd_thr_2_g;
	/* RG_FAC_2 */
	uint8_t rg_fac_2_rb;
	uint8_t rg_fac_2_g;
	/* LINE_THRESH_3 */
	uint8_t sw_mindis3_rb;
	uint8_t sw_mindis3_g;
	uint8_t line_thr_3_rb;
	uint8_t line_thr_3_g;
	/* LINE_MAD_FAC_3 */
	uint8_t sw_dis_scale_min3;
	uint8_t sw_dis_scale_max3;
	uint8_t line_mad_fac_3_rb;
	uint8_t line_mad_fac_3_g;
	/* PG_FAC_3 */
	uint8_t pg_fac_3_rb;
	uint8_t pg_fac_3_g;
	/* RND_THRESH_3 */
	uint8_t rnd_thr_3_rb;
	uint8_t rnd_thr_3_g;
	/* RG_FAC_3 */
	uint8_t rg_fac_3_rb;
	uint8_t rg_fac_3_g;
	/* RO_LIMITS */
	uint8_t ro_lim_3_rb;
	uint8_t ro_lim_3_g;
	uint8_t ro_lim_2_rb;
	uint8_t ro_lim_2_g;
	uint8_t ro_lim_1_rb;
	uint8_t ro_lim_1_g;
	/* RND_OFFS */
	uint8_t rnd_offs_3_rb;
	uint8_t rnd_offs_3_g;
	uint8_t rnd_offs_2_rb;
	uint8_t rnd_offs_2_g;
	uint8_t rnd_offs_1_rb;
	uint8_t rnd_offs_1_g;
	/* BPT_CTRL */
	uint8_t bpt_rb_3x3;
	uint8_t bpt_g_3x3;
	uint8_t bpt_incl_rb_center;
	uint8_t bpt_incl_green_center;
	uint8_t bpt_use_fix_set;
	uint8_t bpt_use_set_3;
	uint8_t bpt_use_set_2;
	uint8_t bpt_use_set_1;
	uint8_t bpt_cor_en;
	uint8_t bpt_det_en;
	/* BPT_NUMBER */
	uint16_t bp_number;
	/* BPT_ADDR */
	uint16_t bp_table_addr;
	/* BPT_DATA */
	uint16_t bpt_v_addr;
	uint16_t bpt_h_addr;
	/* BP_CNT */
	uint32_t bp_cnt;
	/* PDAF_EN */
	uint8_t sw_pdaf_en;
	/* PDAF_POINT_EN */
	uint8_t pdaf_point_en[ISP39_DPCC_PDAF_POINT_NUM];
	/* PDAF_OFFSET */
	uint16_t pdaf_offsety;
	uint16_t pdaf_offsetx;
	/* PDAF_WRAP */
	uint16_t pdaf_wrapy;
	uint16_t pdaf_wrapx;
	/* PDAF_SCOPE */
	uint16_t pdaf_wrapy_num;
	uint16_t pdaf_wrapx_num;
	/* PDAF_POINT */
	struct isp2x_dpcc_pdaf_point point[ISP39_DPCC_PDAF_POINT_NUM];
	/* PDAF_FORWARD_MED */
	uint8_t pdaf_forward_med;
} __attribute__ ((packed));

struct isp39_yuvme_cfg {
	/* CTRL */
	uint8_t bypass;
	uint8_t tnr_wgt0_en;
	/* YUVME_PARA0 */
	uint8_t global_nr_strg;
	uint8_t wgt_fact3;
	uint8_t search_range_mode;
	uint8_t static_detect_thred;
	/* YUVME_PARA1 */
	uint8_t time_relevance_offset;
	uint8_t space_relevance_offset;
	uint8_t nr_diff_scale;
	uint16_t nr_fusion_limit;
	/* YUVME_PARA2 */
	uint8_t nr_static_scale;
	uint16_t nr_motion_scale;
	uint8_t nr_fusion_mode;
	uint16_t cur_weight_limit;
	/* YUVME_SIGMA */
	uint16_t nr_luma2sigma_val[ISP39_YUVME_SIGMA_NUM];
} __attribute__ ((packed));

struct isp39_rgbir_cfg {
	/* THETA */
	uint16_t coe_theta;
	/* DELTA */
	uint16_t coe_delta;
	/* SCALE */
	uint16_t scale[ISP39_RGBIR_SCALE_NUM];
	/* LUMA_POINT */
	uint16_t luma_point[ISP39_RGBIR_LUMA_POINT_NUM];
	/* SCALE_MAP */
	uint16_t scale_map[ISP39_RGBIR_SCALE_MAP_NUM];
} __attribute__ ((packed));

struct isp39_ldcv_cfg {
	/* CTRL */
	uint8_t thumb_mode;
	uint8_t dth_bypass;
	uint8_t force_map_en;
	uint8_t map13p3_en;

	/* BIC_TABLE */
	uint8_t bicubic[ISP39_LDCV_BIC_NUM];

	/* LAST_OFFSET */
	uint16_t last_offset;

	uint32_t out_vsize;

	uint32_t hsize;
	uint32_t vsize;
	int32_t buf_fd;
} __attribute__ ((packed));

struct isp39_ldch_cfg {
	uint8_t frm_end_dis;
	uint8_t sample_avr_en;
	uint8_t bic_mode_en;
	uint8_t force_map_en;
	uint8_t map13p3_en;

	uint8_t bicubic[ISP39_LDCH_BIC_NUM];

	uint16_t out_hsize;

	uint32_t hsize;
	uint32_t vsize;
	int32_t buf_fd;
} __attribute__ ((packed));

struct isp39_ccm_cfg {
	/* CTRL */
	uint8_t highy_adjust_dis;
	uint8_t enh_adj_en;
	uint8_t asym_adj_en;
	uint8_t sat_decay_en;
	/* COEFF0_R */
	int16_t coeff0_r;
	int16_t coeff1_r;
	/* COEFF1_R */
	int16_t coeff2_r;
	int16_t offset_r;
	/* COEFF0_G */
	int16_t coeff0_g;
	int16_t coeff1_g;
	/* COEFF1_G */
	int16_t coeff2_g;
	int16_t offset_g;
	/* COEFF0_B */
	int16_t coeff0_b;
	int16_t coeff1_b;
	/* COEFF1_B */
	int16_t coeff2_b;
	int16_t offset_b;
	/* COEFF0_Y */
	uint16_t coeff0_y;
	uint16_t coeff1_y;
	/* COEFF1_Y */
	uint16_t coeff2_y;
	/* ALP_Y */
	uint16_t alp_y[ISP39_CCM_CURVE_NUM];
	/* BOUND_BIT */
	uint8_t bound_bit;
	uint8_t right_bit;
	/* ENHANCE0 */
	uint16_t color_coef0_r2y;
	uint16_t color_coef1_g2y;
	/* ENHANCE1 */
	uint16_t color_coef2_b2y;
	uint16_t color_enh_rat_max;
	/* HF_THD */
	uint8_t hf_low;
	uint8_t hf_up;
	uint16_t hf_scale;
	/* HF_FACTOR */
	uint16_t hf_factor[ISP39_CCM_HF_FACTOR_NUM];

} __attribute__ ((packed));

struct isp39_debayer_cfg {
	/* CONTROL */
	uint8_t filter_g_en;
	uint8_t filter_c_en;
	/* LUMA_DX */
	uint8_t luma_dx[ISP39_DEBAYER_LUMA_NUM];
	/* G_INTERP */
	uint8_t clip_en;
	uint8_t dist_scale;
	uint8_t thed0;
	uint8_t thed1;
	uint8_t select_thed;
	uint8_t max_ratio;
	/* G_INTERP_FILTER1 */
	int8_t filter1_coe1;
	int8_t filter1_coe2;
	int8_t filter1_coe3;
	int8_t filter1_coe4;
	/* G_INTERP_FILTER2 */
	int8_t filter2_coe1;
	int8_t filter2_coe2;
	int8_t filter2_coe3;
	int8_t filter2_coe4;
	/* G_INTERP_OFFSET_ALPHA */
	uint16_t gain_offset;
	uint8_t gradloflt_alpha;
	uint8_t wgt_alpha;
	/* G_INTERP_DRCT_OFFSET */
	uint16_t drct_offset[ISP39_DEBAYER_DRCT_OFFSET_NUM];
	/* G_FILTER_MODE_OFFSET */
	uint8_t gfilter_mode;
	uint16_t bf_ratio;
	uint16_t offset;
	/* G_FILTER_FILTER */
	int8_t filter_coe0;
	int8_t filter_coe1;
	int8_t filter_coe2;
	/* G_FILTER_VSIGMA */
	uint16_t vsigma[ISP39_DEBAYER_VSIGMA_NUM];
	/* C_FILTER_GUIDE_GAUS */
	int8_t guid_gaus_coe0;
	int8_t guid_gaus_coe1;
	int8_t guid_gaus_coe2;
	/* C_FILTER_CE_GAUS */
	int8_t ce_gaus_coe0;
	int8_t ce_gaus_coe1;
	int8_t ce_gaus_coe2;
	/* C_FILTER_ALPHA_GAUS */
	int8_t alpha_gaus_coe0;
	int8_t alpha_gaus_coe1;
	int8_t alpha_gaus_coe2;
	/* C_FILTER_LOG_OFFSET */
	uint16_t loghf_offset;
	uint16_t loggd_offset;
	uint8_t log_en;
	/* C_FILTER_ALPHA */
	uint16_t alpha_offset;
	uint32_t alpha_scale;
	/* C_FILTER_EDGE */
	uint16_t edge_offset;
	uint32_t edge_scale;
	/* C_FILTER_IIR_0 */
	uint8_t ce_sgm;
	uint8_t exp_shift;
	uint16_t wgtslope;
	/* C_FILTER_IIR_1 */
	uint8_t wet_clip;
	uint8_t wet_ghost;
	/* C_FILTER_BF */
	uint16_t bf_sgm;
	uint8_t bf_clip;
	uint8_t bf_curwgt;
} __attribute__ ((packed));

struct isp39_bay3d_cfg {
	/* BAY3D_CTRL */
	uint8_t bypass_en;
	uint8_t iirsparse_en;
	/* BAY3D_CTRL1 */
	uint8_t transf_bypass_en;
	uint8_t sigma_curve_double_en;
	uint8_t cur_spnr_bypass_en;
	uint8_t cur_spnr_sigma_idxfilt_bypass_en;
	uint8_t cur_spnr_sigma_curve_double_en;
	uint8_t pre_spnr_bypass_en;
	uint8_t pre_spnr_sigma_idxfilt_bypass_en;
	uint8_t pre_spnr_sigma_curve_double_en;
	uint8_t lpf_hi_bypass_en;
	uint8_t lo_diff_vfilt_bypass_en;
	uint8_t lpf_lo_bypass_en;
	uint8_t lo_wgt_hfilt_en;
	uint8_t lo_diff_hfilt_en;
	uint8_t sig_hfilt_en;
	uint8_t spnr_pre_sigma_use_en;
	uint8_t lo_detection_mode;
	uint8_t md_wgt_out_en;
	uint8_t md_bypass_en;
	uint8_t iirspnr_out_en;
	uint8_t lomdwgt_dbg_en;
	uint8_t curdbg_out_en;
	uint8_t noisebal_mode;
	/* BAY3D_CTRL2 */
	uint8_t transf_mode;
	uint8_t wgt_cal_mode;
	uint8_t mge_wgt_ds_mode;
	uint8_t kalman_wgt_ds_mode;
	uint8_t mge_wgt_hdr_sht_thred;
	uint8_t sigma_calc_mge_wgt_hdr_sht_thred;
	/* BAY3D_TRANS0 */
	uint16_t transf_mode_offset;
	uint8_t transf_mode_scale;
	uint16_t itransf_mode_offset;
	/* BAY3D_TRANS1 */
	uint32_t transf_data_max_limit;
	/* BAY3D_CURDGAIN */
	uint16_t cur_spnr_sigma_hdr_sht_scale;
	uint16_t cur_spnr_sigma_scale;
	/* BAY3D_CURSIG_X */
	uint16_t cur_spnr_luma_sigma_x[ISP39_BAY3D_XY_NUM];
	/* BAY3D_CURSIG_Y */
	uint16_t cur_spnr_luma_sigma_y[ISP39_BAY3D_XY_NUM];
	/* BAY3D_CURGAIN_OFF */
	uint16_t cur_spnr_sigma_rgain_offset;
	uint16_t cur_spnr_sigma_bgain_offset;
	/* BAY3D_CURSIG_OFF */
	uint16_t cur_spnr_sigma_hdr_sht_offset;
	uint16_t cur_spnr_sigma_offset;
	/* BAY3D_CURWTH */
	uint16_t cur_spnr_pix_diff_max_limit;
	uint16_t cur_spnr_wgt_cal_offset;
	/* BAY3D_CURBFALP */
	uint16_t cur_spnr_wgt;
	uint16_t pre_spnr_wgt;
	/* BAY3D_CURWDC */
	uint16_t cur_spnr_space_rb_wgt[ISP39_BAY3D_WD_NUM];
	/* BAY3D_CURWDY */
	uint16_t cur_spnr_space_gg_wgt[ISP39_BAY3D_WD_NUM];
	/* BAY3D_IIRDGAIN */
	uint16_t pre_spnr_sigma_hdr_sht_scale;
	uint16_t pre_spnr_sigma_scale;
	/* BAY3D_IIRSIG_X */
	uint16_t pre_spnr_luma_sigma_x[ISP39_BAY3D_XY_NUM];
	/* BAY3D_IIRSIG_Y */
	uint16_t pre_spnr_luma_sigma_y[ISP39_BAY3D_XY_NUM];
	/* BAY3D_IIRGAIN_OFF */
	uint16_t pre_spnr_sigma_rgain_offset;
	uint16_t pre_spnr_sigma_bgain_offset;
	/* BAY3D_IIRSIG_OFF */
	uint16_t pre_spnr_sigma_hdr_sht_offset;
	uint16_t pre_spnr_sigma_offset;
	/* BAY3D_IIRWTH */
	uint16_t pre_spnr_pix_diff_max_limit;
	uint16_t pre_spnr_wgt_cal_offset;
	/* BAY3D_IIRWDC */
	uint16_t pre_spnr_space_rb_wgt[ISP39_BAY3D_WD_NUM];
	/* BAY3D_IIRWDY */
	uint16_t pre_spnr_space_gg_wgt[ISP39_BAY3D_WD_NUM];
	/* BAY3D_BFCOEF */
	uint16_t cur_spnr_wgt_cal_scale;
	uint16_t pre_spnr_wgt_cal_scale;

	/* BAY3D_TNRSIG_X */
	uint16_t tnr_luma_sigma_x[ISP39_BAY3D_TNRSIG_NUM];
	/* BAY3D_TNRSIG_Y */
	uint16_t tnr_luma_sigma_y[ISP39_BAY3D_TNRSIG_NUM];
	/* BAY3D_TNRHIW */
	uint16_t tnr_lpf_hi_coeff[ISP39_BAY3D_COEFF_NUM];
	/* BAY3D_TNRLOW*/
	uint16_t tnr_lpf_lo_coeff[ISP39_BAY3D_COEFF_NUM];
	/* BAY3D_TNRGF3 */
	uint16_t tnr_wgt_filt_coeff0;
	uint16_t tnr_wgt_filt_coeff1;
	uint16_t tnr_wgt_filt_coeff2;
	/* BAY3D_TNRSIGSCL */
	uint16_t tnr_sigma_scale;
	uint16_t tnr_sigma_hdr_sht_scale;
	/* BAY3D_TNRVIIR */
	uint8_t tnr_sig_vfilt_wgt;
	uint8_t tnr_lo_diff_vfilt_wgt;
	uint8_t tnr_lo_wgt_vfilt_wgt;
	uint8_t tnr_sig_first_line_scale;
	uint8_t tnr_lo_diff_first_line_scale;
	/* BAY3D_TNRLFSCL */
	uint16_t tnr_lo_wgt_cal_offset;
	uint16_t tnr_lo_wgt_cal_scale;
	/* BAY3D_TNRLFSCLTH */
	uint16_t tnr_low_wgt_cal_max_limit;
	uint16_t tnr_mode0_base_ratio;
	/* BAY3D_TNRDSWGTSCL */
	uint16_t tnr_lo_diff_wgt_cal_offset;
	uint16_t tnr_lo_diff_wgt_cal_scale;
	/* BAY3D_TNRWLSTSCL */
	uint16_t tnr_lo_mge_pre_wgt_offset;
	uint16_t tnr_lo_mge_pre_wgt_scale;
	/* BAY3D_TNRWGT0SCL0 */
	uint16_t tnr_mode0_lo_wgt_scale;
	uint16_t tnr_mode0_lo_wgt_hdr_sht_scale;
	/* BAY3D_TNRWGT1SCL1 */
	uint16_t tnr_mode1_lo_wgt_scale;
	uint16_t tnr_mode1_lo_wgt_hdr_sht_scale;
	/* BAY3D_TNRWGT1SCL2 */
	uint16_t tnr_mode1_wgt_scale;
	uint16_t tnr_mode1_wgt_hdr_sht_scale;
	/* BAY3D_TNRWGTOFF */
	uint16_t tnr_mode1_lo_wgt_offset;
	uint16_t tnr_mode1_lo_wgt_hdr_sht_offset;
	/* BAY3D_TNRWGT1OFF */
	uint16_t tnr_auto_sigma_count_wgt_thred;
	uint16_t tnr_mode1_wgt_min_limit;
	uint16_t tnr_mode1_wgt_offset;
	/* BAY3D_TNRSIGORG */
	uint32_t tnr_out_sigma_sq;
	/* BAY3D_TNRWLO_THL */
	uint16_t tnr_lo_wgt_clip_min_limit;
	uint16_t tnr_lo_wgt_clip_hdr_sht_min_limit;
	/* BAY3D_TNRWLO_THH */
	uint16_t tnr_lo_wgt_clip_max_limit;
	uint16_t tnr_lo_wgt_clip_hdr_sht_max_limit;
	/* BAY3D_TNRWHI_THL */
	uint16_t tnr_hi_wgt_clip_min_limit;
	uint16_t tnr_hi_wgt_clip_hdr_sht_min_limit;
	/* BAY3D_TNRWHI_THH */
	uint16_t tnr_hi_wgt_clip_max_limit;
	uint16_t tnr_hi_wgt_clip_hdr_sht_max_limit;
	/* BAY3D_TNRKEEP */
	uint8_t tnr_cur_spnr_hi_wgt_min_limit;
	uint8_t tnr_pre_spnr_hi_wgt_min_limit;
	/* BAY3D_PIXMAX */
	uint16_t tnr_pix_max;
	uint8_t lowgt_ctrl;
	uint16_t lowgt_offint;
	/* BAY3D_SIGNUMTH */
	uint32_t tnr_auto_sigma_count_th;
	/* BAY3D_TNRMO_STR */
	uint16_t tnr_motion_nr_strg;
	uint8_t tnr_gain_max;
} __attribute__ ((packed));

struct isp39_ynr_cfg {
	/* GLOBAL_CTRL */
	uint8_t lospnr_bypass;
	uint8_t hispnr_bypass;
	uint8_t exgain_bypass;
	uint16_t global_set_gain;
	uint8_t gain_merge_alpha;
	uint8_t rnr_en;
	/* RNR_MAX_R */
	uint16_t rnr_max_radius;
	uint16_t local_gain_scale;
	/* RNR_CENTER_COOR */
	uint16_t rnr_center_coorh;
	uint16_t rnr_center_coorv;
	/* LOWNR_CTRL0 */
	uint16_t ds_filt_soft_thred_scale;
	uint8_t ds_img_edge_scale;
	uint16_t ds_filt_wgt_thred_scale;
	/* LOWNR_CTRL1 */
	uint8_t ds_filt_local_gain_alpha;
	uint8_t ds_iir_init_wgt_scale;
	uint16_t ds_filt_center_wgt;
	/* LOWNR_CTRL2 */
	uint16_t ds_filt_inv_strg;
	uint16_t lospnr_wgt;
	/* LOWNR_CTRL3 */
	uint16_t lospnr_center_wgt;
	uint16_t lospnr_strg;
	/* LOWNR_CTRL4 */
	uint16_t lospnr_dist_vstrg_scale;
	uint16_t lospnr_dist_hstrg_scale;
	/* GAUSS_COEFF */
	uint8_t pre_filt_coeff0;
	uint8_t pre_filt_coeff1;
	uint8_t pre_filt_coeff2;
	/* LOW_GAIN_ADJ */
	uint8_t lospnr_gain2strg_val[ISP39_YNR_LOW_GAIN_ADJ_NUM];
	/* SGM_DX */
	uint16_t luma2sima_idx[ISP39_YNR_XY_NUM];
	/* LSGM_Y */
	uint16_t luma2sima_val[ISP39_YNR_XY_NUM];
	/* RNR_STRENGTH */
	uint8_t radius2strg_val[ISP39_YNR_XY_NUM];
	/* NLM_STRONG_EDGE */
	uint8_t hispnr_strong_edge;
	/* NLM_SIGMA_GAIN */
	uint16_t hispnr_sigma_min_limit;
	uint8_t hispnr_local_gain_alpha;
	uint16_t hispnr_strg;
	/* NLM_COE */
	uint8_t hispnr_filt_coeff[ISP39_YNR_NLM_COE_NUM];
	/* NLM_WEIGHT */
	uint16_t hispnr_filt_wgt_offset;
	uint32_t hispnr_filt_center_wgt;
	/* NLM_NR_WEIGHT */
	uint16_t hispnr_filt_wgt;
	uint16_t hispnr_gain_thred;
} __attribute__ ((packed));

struct isp39_cnr_cfg {
	/* CNR_CTRL */
	uint8_t exgain_bypass;
	uint8_t yuv422_mode;
	uint8_t thumb_mode;
	uint8_t hiflt_wgt0_mode;
	uint8_t loflt_coeff;
	/* CNR_EXGAIN */
	uint16_t global_gain;
	uint8_t global_gain_alpha;
	uint8_t local_gain_scale;
	/* CNR_THUMB1 */
	uint16_t lobfflt_vsigma_uv;
	uint16_t lobfflt_vsigma_y;
	/* CNR_THUMB_BF_RATIO */
	uint16_t lobfflt_alpha;
	/* CNR_LBF_WEITD */
	uint8_t thumb_bf_coeff0;
	uint8_t thumb_bf_coeff1;
	uint8_t thumb_bf_coeff2;
	uint8_t thumb_bf_coeff3;
	/* CNR_IIR_PARA1 */
	uint8_t loflt_uv_gain;
	uint8_t loflt_vsigma;
	uint8_t exp_x_shift_bit;
	uint16_t loflt_wgt_slope;
	/* CNR_IIR_PARA2 */
	uint8_t loflt_wgt_min_thred;
	uint8_t loflt_wgt_max_limit;
	/* CNR_GAUS_COE */
	uint8_t gaus_flt_coeff[ISP39_CNR_GAUS_COE_NUM];
	/* CNR_GAUS_RATIO */
	uint16_t gaus_flt_alpha;
	uint8_t hiflt_wgt_min_limit;
	uint16_t hiflt_alpha;
	/* CNR_BF_PARA1 */
	uint8_t hiflt_uv_gain;
	uint16_t hiflt_global_vsigma;
	uint8_t hiflt_cur_wgt;
	/* CNR_BF_PARA2 */
	uint16_t adj_offset;
	uint16_t adj_scale;
	/* CNR_SIGMA */
	uint8_t sgm_ratio[ISP39_CNR_SIGMA_Y_NUM];
	/* CNR_IIR_GLOBAL_GAIN */
	uint8_t loflt_global_sgm_ratio;
	uint8_t loflt_global_sgm_ratio_alpha;
	/* CNR_WGT_SIGMA */
	uint8_t cur_wgt[ISP39_CNR_WGT_SIGMA_Y_NUM];
	/* GAUS_X_SIGMAR */
	uint16_t hiflt_vsigma_idx[ISP39_CNR_GAUS_SIGMAR_NUM];
	/* GAUS_Y_SIGMAR */
	uint16_t hiflt_vsigma[ISP39_CNR_GAUS_SIGMAR_NUM];
} __attribute__ ((packed));

struct isp39_sharp_cfg {
	/* SHARP_EN */
	uint8_t bypass;
	uint8_t center_mode;
	uint8_t local_gain_bypass;
	uint8_t radius_step_mode;
	uint8_t noise_clip_mode;
	uint8_t clipldx_sel;
	uint8_t baselmg_sel;
	uint8_t noise_filt_sel;
	uint8_t tex2wgt_en;

	/* SHARP_ALPHA */
	uint8_t pre_bifilt_alpha;
	uint8_t guide_filt_alpha;
	uint8_t detail_bifilt_alpha;
	uint8_t global_sharp_strg;

	/* SHARP_LUMA_DX */
	uint8_t luma2table_idx[ISP39_SHARP_X_NUM];

	/* SHARP_PBF_SIGMA_INV */
	uint16_t pbf_sigma_inv[ISP39_SHARP_Y_NUM];

	/* SHARP_DETAILBF_SIGMA_INV */
	uint16_t bf_sigma_inv[ISP39_SHARP_Y_NUM];

	/* SHARP_SIGMA_SHIFT */
	uint8_t pbf_sigma_shift;
	uint8_t bf_sigma_shift;

	/* SHARP_LOCAL_STRG */
	uint16_t luma2strg_val[ISP39_SHARP_Y_NUM];

	/* SHARP_POS_CLIP */
	uint16_t luma2posclip_val[ISP39_SHARP_Y_NUM];

	/* SHARP_PBF_COEF */
	uint8_t pbf_coef0;
	uint8_t pbf_coef1;
	uint8_t pbf_coef2;

	/* SHARP_DETAILBF_COEF */
	uint8_t bf_coef0;
	uint8_t bf_coef1;
	uint8_t bf_coef2;

	/* SHARP_IMGLPF_COEF */
	uint8_t img_lpf_coeff[ISP39_SHARP_GAUS_COEF_NUM];

	/* SHARP_GAIN */
	uint16_t global_gain;
	uint8_t gain_merge_alpha;
	uint8_t local_gain_scale;

	/* SHARP_GAIN_ADJUST */
	uint16_t gain2strg_val[ISP39_SHARP_GAIN_ADJ_NUM];

	/* SHARP_CENTER */
	uint16_t center_x;
	uint16_t center_y;

	/* SHARP_GAIN_DIS_STRENGTH */
	uint8_t distance2strg_val[ISP39_SHARP_STRENGTH_NUM];

	/* NEG_CLIP */
	uint16_t luma2neg_clip_val[ISP39_SHARP_Y_NUM];

	/* TEXTURE0 */
	uint16_t noise_max_limit;
	uint8_t tex_reserve_level;
	/* TEXTURE1 */
	uint16_t tex_wet_scale;
	uint8_t noise_norm_bit;
	uint8_t tex_wgt_mode;
	/* TEXTURE_LUT */
	uint16_t tex2wgt_val[ISP39_SHARP_TEX_WET_LUT_NUM];
	/* TEXTURE2 */
	uint32_t noise_strg;
	/* DETAIL_STRG_LUT */
	uint16_t detail2strg_val[ISP39_SHARP_DETAIL_STRG_NUM];
} __attribute__ ((packed));

struct isp39_dhaz_cfg {
	/* DHAZ_CTRL */
	uint8_t dc_en;
	uint8_t hist_en;
	uint8_t map_mode;
	uint8_t mem_mode;
	uint8_t mem_force;
	uint8_t air_lc_en;
	uint8_t enhance_en;
	uint8_t soft_wr_en;
	uint8_t round_en;
	uint8_t color_deviate_en;
	uint8_t enh_luma_en;
	/* DHAZ_ADP0 */
	uint8_t dc_min_th;
	uint8_t dc_max_th;
	uint8_t yhist_th;
	uint8_t yblk_th;
	/* DHAZ_ADP1 */
	uint8_t bright_min;
	uint8_t bright_max;
	uint16_t wt_max;
	/* DHAZ_ADP2 */
	uint8_t air_min;
	uint8_t air_max;
	uint8_t dark_th;
	uint8_t tmax_base;
	/* DHAZ_ADP_TMAX */
	uint16_t tmax_off;
	uint16_t tmax_max;
	/* DHAZ_ENHANCE */
	uint16_t enhance_chroma;
	uint16_t enhance_value;
	/* DHAZ_IIR0 */
	uint8_t stab_fnum;
	uint8_t iir_sigma;
	uint16_t iir_wt_sigma;
	/* DHAZ_IIR1 */
	uint8_t iir_air_sigma;
	uint16_t iir_tmax_sigma;
	uint8_t iir_pre_wet;
	/* DHAZ_SOFT_CFG0 */
	uint8_t cfg_alpha;
	uint8_t cfg_air;
	uint16_t cfg_wt;
	/* DHAZ_SOFT_CFG1 */
	uint16_t cfg_tmax;
	/* DHAZ_BF_SIGMA */
	uint8_t space_sigma_cur;
	uint8_t space_sigma_pre;
	uint16_t range_sima;
	/* DHAZ_BF_WET */
	uint16_t bf_weight;
	uint16_t dc_weitcur;
	/* DHAZ_ENH_CURVE0 ~ 5 */
	uint16_t enh_curve[ISP39_DHAZ_ENH_CURVE_NUM];
	/* DHAZ_GAUS */
	uint8_t gaus_h0;
	uint8_t gaus_h1;
	uint8_t gaus_h2;
	/* DHAZ_ENH_LUMA0 ~ 5 */
	uint16_t enh_luma[ISP39_DHAZ_ENH_LUMA_NUM];
	/* DHAZ_ADP_WR0 */
	uint16_t adp_wt_wr;
	uint8_t adp_air_wr;
	/* DHAZ_ADP_WR1 */
	uint16_t adp_tmax_wr;
	/* DHAZ_GAIN_IDX0 ~ 3 */
	uint8_t sigma_idx[ISP39_DHAZ_SIGMA_IDX_NUM];
	/* DHAZ_GAIN_LUT0 ~ 5 */
	uint16_t sigma_lut[ISP39_DHAZ_SIGMA_LUT_NUM];
	/* GAIN_FUSE */
	uint16_t gain_fuse_alpha;
	/* DHAZ_ADP_HF */
	uint8_t hist_k;
	uint8_t hist_th_off;
	uint8_t hist_min;
	/* DHAZ_BLOCK_SIZE */
	uint16_t blk_het;
	uint16_t blk_wid;
	/* DHAZ_THUMB_SIZE */
	uint8_t thumb_row;
	uint8_t thumb_col;
	/* DHAZ_HIST_CFG */
	uint16_t cfg_k_alpha;
	uint16_t cfg_k;
	/* DHAZ_HIST_GAIN */
	uint16_t k_gain;
	/* DHAZ_BLEND_WET0 ~ 5 */
	uint16_t blend_wet[ISP39_DHAZ_BLEND_WET_NUM];
	/* DHAZ_HIST_IIR */
	uint16_t hist_iir_wr;
	uint16_t hist_iir[ISP39_DHAZ_HIST_IIR_BLK_MAX][ISP39_DHAZ_HIST_IIR_NUM];
} __attribute__ ((packed));

struct isp39_drc_cfg {
	/* DRC_CTRL0 */
	uint8_t bypass_en;
	uint8_t cmps_byp_en;
	uint8_t gainx32_en;
	uint8_t raw_dly_dis;

	/* DRC_CTRL1 */
	uint16_t position;
	uint16_t compres_scl;
	uint8_t offset_pow2;

	/* DRC_LPRATIO */
	uint16_t lpdetail_ratio;
	uint16_t hpdetail_ratio;
	uint8_t delta_scalein;

	/* DRC_BILAT0 */
	uint8_t bilat_wt_off;
	uint16_t thumb_thd_neg;
	uint8_t thumb_thd_enable;
	uint8_t weicur_pix;

	/* DRC_BILAT1 */
	uint8_t cmps_offset_bits_int;
	uint8_t cmps_fixbit_mode;
	uint16_t drc_gas_t;

	/* DRC_BILAT2 */
	uint32_t thumb_clip;
	uint8_t thumb_scale;

	/* DRC_BILAT3 */
	uint32_t range_sgm_inv0;
	uint16_t range_sgm_inv1;

	/* DRC_BILAT4 */
	uint8_t weig_bilat;
	uint8_t weight_8x8thumb;
	uint16_t bilat_soft_thd;
	uint8_t enable_soft_thd;

	/* DRC_GAIN_Y0 ~ Y8 */
	uint16_t gain_y[ISP39_DRC_Y_NUM];
	/* DRC_COMPRES_Y0 ~ Y8 */
	uint16_t compres_y[ISP39_DRC_Y_NUM];
	/* DRC_SCALE_Y0 ~ Y8 */
	uint16_t scale_y[ISP39_DRC_Y_NUM];

	/* IIRWG_GAIN */
	uint16_t min_ogain;
	/* SFTHD_Y0 ~ Y8 */
	uint16_t sfthd_y[ISP39_DRC_Y_NUM];
} __attribute__ ((packed));

struct isp39_rawawb_meas_cfg {
	uint8_t bls2_en;

	uint8_t rawawb_sel;
	uint8_t bnr2awb_sel;
	uint8_t drc2awb_sel;
	/* RAWAWB_CTRL */
	uint8_t uv_en0;
	uint8_t xy_en0;
	uint8_t yuv3d_en0;
	uint8_t yuv3d_ls_idx0;
	uint8_t yuv3d_ls_idx1;
	uint8_t yuv3d_ls_idx2;
	uint8_t yuv3d_ls_idx3;
	uint8_t in_rshift_to_12bit_en;
	uint8_t in_overexposure_check_en;
	uint8_t wind_size;
	uint8_t rawlsc_bypass_en;
	uint8_t light_num;
	uint8_t uv_en1;
	uint8_t xy_en1;
	uint8_t yuv3d_en1;
	uint8_t low12bit_val;
	/* RAWAWB_BLK_CTRL */
	uint8_t blk_measure_enable;
	uint8_t blk_measure_mode;
	uint8_t blk_measure_xytype;
	uint8_t blk_rtdw_measure_en;
	uint8_t blk_measure_illu_idx;
	uint8_t ds16x8_mode_en;
	uint8_t blk_with_luma_wei_en;
	uint16_t in_overexposure_threshold;
	/* RAWAWB_WIN_OFFS */
	uint16_t h_offs;
	uint16_t v_offs;
	/* RAWAWB_WIN_SIZE */
	uint16_t h_size;
	uint16_t v_size;
	/* RAWAWB_LIMIT_RG_MAX*/
	uint16_t r_max;
	uint16_t g_max;
	/* RAWAWB_LIMIT_BY_MAX */
	uint16_t b_max;
	uint16_t y_max;
	/* RAWAWB_LIMIT_RG_MIN */
	uint16_t r_min;
	uint16_t g_min;
	/* RAWAWB_LIMIT_BY_MIN */
	uint16_t b_min;
	uint16_t y_min;
	/* RAWAWB_WEIGHT_CURVE_CTRL */
	uint8_t wp_luma_wei_en0;
	uint8_t wp_luma_wei_en1;
	uint8_t wp_blk_wei_en0;
	uint8_t wp_blk_wei_en1;
	uint8_t wp_hist_xytype;
	/* RAWAWB_YWEIGHT_CURVE_XCOOR03 */
	uint8_t wp_luma_weicurve_y0;
	uint8_t wp_luma_weicurve_y1;
	uint8_t wp_luma_weicurve_y2;
	uint8_t wp_luma_weicurve_y3;
	/* RAWAWB_YWEIGHT_CURVE_XCOOR47 */
	uint8_t wp_luma_weicurve_y4;
	uint8_t wp_luma_weicurve_y5;
	uint8_t wp_luma_weicurve_y6;
	uint8_t wp_luma_weicurve_y7;
	/* RAWAWB_YWEIGHT_CURVE_XCOOR8 */
	uint8_t wp_luma_weicurve_y8;
	/* RAWAWB_YWEIGHT_CURVE_YCOOR03 */
	uint8_t wp_luma_weicurve_w0;
	uint8_t wp_luma_weicurve_w1;
	uint8_t wp_luma_weicurve_w2;
	uint8_t wp_luma_weicurve_w3;
	/* RAWAWB_YWEIGHT_CURVE_YCOOR47 */
	uint8_t wp_luma_weicurve_w4;
	uint8_t wp_luma_weicurve_w5;
	uint8_t wp_luma_weicurve_w6;
	uint8_t wp_luma_weicurve_w7;
	/* RAWAWB_YWEIGHT_CURVE_YCOOR8 */
	uint8_t wp_luma_weicurve_w8;
	uint16_t pre_wbgain_inv_r;
	/* RAWAWB_PRE_WBGAIN_INV */
	uint16_t pre_wbgain_inv_g;
	uint16_t pre_wbgain_inv_b;
	/* RAWAWB_UV_DETC_VERTEX0_0 */
	uint16_t vertex0_u_0;
	uint16_t vertex0_v_0;
	/* RAWAWB_UV_DETC_VERTEX1_0 */
	uint16_t vertex1_u_0;
	uint16_t vertex1_v_0;
	/* RAWAWB_UV_DETC_VERTEX2_0 */
	uint16_t vertex2_u_0;
	uint16_t vertex2_v_0;
	/* RAWAWB_UV_DETC_VERTEX3_0 */
	uint16_t vertex3_u_0;
	uint16_t vertex3_v_0;
	/* RAWAWB_UV_DETC_ISLOPE01_0 */
	uint32_t islope01_0;
	/* RAWAWB_UV_DETC_ISLOPE12_0 */
	uint32_t islope12_0;
	/* RAWAWB_UV_DETC_ISLOPE23_0 */
	uint32_t islope23_0;
	/* RAWAWB_UV_DETC_ISLOPE30_0 */
	uint32_t islope30_0;
	/* RAWAWB_UV_DETC_VERTEX0_1 */
	uint16_t vertex0_u_1;
	uint16_t vertex0_v_1;
	/* RAWAWB_UV_DETC_VERTEX1_1 */
	uint16_t vertex1_u_1;
	uint16_t vertex1_v_1;
	/* RAWAWB_UV_DETC_VERTEX2_1 */
	uint16_t vertex2_u_1;
	uint16_t vertex2_v_1;
	/* RAWAWB_UV_DETC_VERTEX3_1 */
	uint16_t vertex3_u_1;
	uint16_t vertex3_v_1;
	/* RAWAWB_UV_DETC_ISLOPE01_1 */
	uint32_t islope01_1;
	/* RAWAWB_UV_DETC_ISLOPE12_1 */
	uint32_t islope12_1;
	/* RAWAWB_UV_DETC_ISLOPE23_1 */
	uint32_t islope23_1;
	/* RAWAWB_UV_DETC_ISLOPE30_1 */
	uint32_t islope30_1;
	/* RAWAWB_UV_DETC_VERTEX0_2 */
	uint16_t vertex0_u_2;
	uint16_t vertex0_v_2;
	/* RAWAWB_UV_DETC_VERTEX1_2 */
	uint16_t vertex1_u_2;
	uint16_t vertex1_v_2;
	/* RAWAWB_UV_DETC_VERTEX2_2 */
	uint16_t vertex2_u_2;
	uint16_t vertex2_v_2;
	/* RAWAWB_UV_DETC_VERTEX3_2 */
	uint16_t vertex3_u_2;
	uint16_t vertex3_v_2;
	/* RAWAWB_UV_DETC_ISLOPE01_2 */
	uint32_t islope01_2;
	/* RAWAWB_UV_DETC_ISLOPE12_2 */
	uint32_t islope12_2;
	/* RAWAWB_UV_DETC_ISLOPE23_2 */
	uint32_t islope23_2;
	/* RAWAWB_UV_DETC_ISLOPE30_2 */
	uint32_t islope30_2;
	/* RAWAWB_UV_DETC_VERTEX0_3 */
	uint16_t vertex0_u_3;
	uint16_t vertex0_v_3;
	/* RAWAWB_UV_DETC_VERTEX1_3 */
	uint16_t vertex1_u_3;
	uint16_t vertex1_v_3;
	/* RAWAWB_UV_DETC_VERTEX2_3 */
	uint16_t vertex2_u_3;
	uint16_t vertex2_v_3;
	/* RAWAWB_UV_DETC_VERTEX3_3 */
	uint16_t vertex3_u_3;
	uint16_t vertex3_v_3;
	/* RAWAWB_UV_DETC_ISLOPE01_3 */
	uint32_t islope01_3;
	/* RAWAWB_UV_DETC_ISLOPE12_3 */
	uint32_t islope12_3;
	/* RAWAWB_UV_DETC_ISLOPE23_3 */
	uint32_t islope23_3;
	/* RAWAWB_UV_DETC_ISLOPE30_3 */
	uint32_t islope30_3;
	/* RAWAWB_YUV_RGB2ROTY_0 */
	uint16_t rgb2ryuvmat0_y;
	uint16_t rgb2ryuvmat1_y;
	/* RAWAWB_YUV_RGB2ROTY_1 */
	uint16_t rgb2ryuvmat2_y;
	uint16_t rgb2ryuvofs_y;
	/* RAWAWB_YUV_RGB2ROTU_0 */
	uint16_t rgb2ryuvmat0_u;
	uint16_t rgb2ryuvmat1_u;
	/* RAWAWB_YUV_RGB2ROTU_1 */
	uint16_t rgb2ryuvmat2_u;
	uint16_t rgb2ryuvofs_u;
	/* RAWAWB_YUV_RGB2ROTV_0 */
	uint16_t rgb2ryuvmat0_v;
	uint16_t rgb2ryuvmat1_v;
	/* RAWAWB_YUV_RGB2ROTV_1 */
	uint16_t rgb2ryuvmat2_v;
	uint16_t rgb2ryuvofs_v;
	/* RAWAWB_YUV_X_COOR_Y_0 */
	uint16_t coor_x1_ls0_y;
	uint16_t vec_x21_ls0_y;
	/* RAWAWB_YUV_X_COOR_U_0 */
	uint16_t coor_x1_ls0_u;
	uint16_t vec_x21_ls0_u;
	/* RAWAWB_YUV_X_COOR_V_0 */
	uint16_t coor_x1_ls0_v;
	uint16_t vec_x21_ls0_v;
	/* RAWAWB_YUV_X1X2_DIS_0 */
	uint8_t dis_x1x2_ls0;
	uint8_t rotu0_ls0;
	uint8_t rotu1_ls0;
	/* RAWAWB_YUV_INTERP_CURVE_UCOOR_0 */
	uint8_t rotu2_ls0;
	uint8_t rotu3_ls0;
	uint8_t rotu4_ls0;
	uint8_t rotu5_ls0;
	/* RAWAWB_YUV_INTERP_CURVE_TH0_0 */
	uint16_t th0_ls0;
	uint16_t th1_ls0;
	/* RAWAWB_YUV_INTERP_CURVE_TH1_0 */
	uint16_t th2_ls0;
	uint16_t th3_ls0;
	/* RAWAWB_YUV_INTERP_CURVE_TH2_0 */
	uint16_t th4_ls0;
	uint16_t th5_ls0;
	/* RAWAWB_YUV_X_COOR_Y_1 */
	uint16_t coor_x1_ls1_y;
	uint16_t vec_x21_ls1_y;
	/* RAWAWB_YUV_X_COOR_U_1 */
	uint16_t coor_x1_ls1_u;
	uint16_t vec_x21_ls1_u;
	/* RAWAWB_YUV_X_COOR_V_1 */
	uint16_t coor_x1_ls1_v;
	uint16_t vec_x21_ls1_v;
	/* RAWAWB_YUV_X1X2_DIS_1 */
	uint8_t dis_x1x2_ls1;
	uint8_t rotu0_ls1;
	uint8_t rotu1_ls1;
	/* YUV_INTERP_CURVE_UCOOR_1 */
	uint8_t rotu2_ls1;
	uint8_t rotu3_ls1;
	uint8_t rotu4_ls1;
	uint8_t rotu5_ls1;
	/* RAWAWB_YUV_INTERP_CURVE_TH0_1 */
	uint16_t th0_ls1;
	uint16_t th1_ls1;
	/* RAWAWB_YUV_INTERP_CURVE_TH1_1 */
	uint16_t th2_ls1;
	uint16_t th3_ls1;
	/* RAWAWB_YUV_INTERP_CURVE_TH2_1 */
	uint16_t th4_ls1;
	uint16_t th5_ls1;
	/* RAWAWB_YUV_X_COOR_Y_2 */
	uint16_t coor_x1_ls2_y;
	uint16_t vec_x21_ls2_y;
	/* RAWAWB_YUV_X_COOR_U_2 */
	uint16_t coor_x1_ls2_u;
	uint16_t vec_x21_ls2_u;
	/* RAWAWB_YUV_X_COOR_V_2 */
	uint16_t coor_x1_ls2_v;
	uint16_t vec_x21_ls2_v;
	/* RAWAWB_YUV_X1X2_DIS_2 */
	uint8_t dis_x1x2_ls2;
	uint8_t rotu0_ls2;
	uint8_t rotu1_ls2;
	/* YUV_INTERP_CURVE_UCOOR_2 */
	uint8_t rotu2_ls2;
	uint8_t rotu3_ls2;
	uint8_t rotu4_ls2;
	uint8_t rotu5_ls2;
	/* RAWAWB_YUV_INTERP_CURVE_TH0_2 */
	uint16_t th0_ls2;
	uint16_t th1_ls2;
	/* RAWAWB_YUV_INTERP_CURVE_TH1_2 */
	uint16_t th2_ls2;
	uint16_t th3_ls2;
	/* RAWAWB_YUV_INTERP_CURVE_TH2_2 */
	uint16_t th4_ls2;
	uint16_t th5_ls2;
	/* RAWAWB_YUV_X_COOR_Y_3 */
	uint16_t coor_x1_ls3_y;
	uint16_t vec_x21_ls3_y;
	/* RAWAWB_YUV_X_COOR_U_3 */
	uint16_t coor_x1_ls3_u;
	uint16_t vec_x21_ls3_u;
	/* RAWAWB_YUV_X_COOR_V_3 */
	uint16_t coor_x1_ls3_v;
	uint16_t vec_x21_ls3_v;
	/* RAWAWB_YUV_X1X2_DIS_3 */
	uint8_t dis_x1x2_ls3;
	uint8_t rotu0_ls3;
	uint8_t rotu1_ls3;
	/* RAWAWB_YUV_INTERP_CURVE_UCOOR_3 */
	uint8_t rotu2_ls3;
	uint8_t rotu3_ls3;
	uint8_t rotu4_ls3;
	uint8_t rotu5_ls3;
	/* RAWAWB_YUV_INTERP_CURVE_TH0_3 */
	uint16_t th0_ls3;
	uint16_t th1_ls3;
	/* RAWAWB_YUV_INTERP_CURVE_TH1_3 */
	uint16_t th2_ls3;
	uint16_t th3_ls3;
	/* RAWAWB_YUV_INTERP_CURVE_TH2_3 */
	uint16_t th4_ls3;
	uint16_t th5_ls3;
	/* RAWAWB_RGB2XY_WT01 */
	uint16_t wt0;
	uint16_t wt1;
	/* RAWAWB_RGB2XY_WT2 */
	uint16_t wt2;
	/* RAWAWB_RGB2XY0_MAT */
	uint16_t mat0_x;
	uint16_t mat0_y;
	/* RAWAWB_RGB2XY_MAT1_XY */
	uint16_t mat1_x;
	uint16_t mat1_y;
	/* RAWAWB_RGB2XY_MAT2_XY */
	uint16_t mat2_x;
	uint16_t mat2_y;
	/* RAWAWB_XY_DETC_NOR_X_0 */
	uint16_t nor_x0_0;
	uint16_t nor_x1_0;
	/* RAWAWB_XY_DETC_NOR_Y_0 */
	uint16_t nor_y0_0;
	uint16_t nor_y1_0;
	/* RAWAWB_XY_DETC_BIG_X_0 */
	uint16_t big_x0_0;
	uint16_t big_x1_0;
	/* RAWAWB_XY_DETC_BIG_Y_0 */
	uint16_t big_y0_0;
	uint16_t big_y1_0;
	/* RAWAWB_XY_DETC_NOR_X_1 */
	uint16_t nor_x0_1;
	uint16_t nor_x1_1;
	/* RAWAWB_XY_DETC_NOR_Y_1 */
	uint16_t nor_y0_1;
	uint16_t nor_y1_1;
	/* RAWAWB_XY_DETC_BIG_X_1 */
	uint16_t big_x0_1;
	uint16_t big_x1_1;
	/* RAWAWB_XY_DETC_BIG_Y_1 */
	uint16_t big_y0_1;
	uint16_t big_y1_1;
	/* RAWAWB_XY_DETC_NOR_X_2 */
	uint16_t nor_x0_2;
	uint16_t nor_x1_2;
	/* RAWAWB_XY_DETC_NOR_Y_2 */
	uint16_t nor_y0_2;
	uint16_t nor_y1_2;
	/* RAWAWB_XY_DETC_BIG_X_2 */
	uint16_t big_x0_2;
	uint16_t big_x1_2;
	/* RAWAWB_XY_DETC_BIG_Y_2 */
	uint16_t big_y0_2;
	uint16_t big_y1_2;
	/* RAWAWB_XY_DETC_NOR_X_3 */
	uint16_t nor_x0_3;
	uint16_t nor_x1_3;
	/* RAWAWB_XY_DETC_NOR_Y_3 */
	uint16_t nor_y0_3;
	uint16_t nor_y1_3;
	/* RAWAWB_XY_DETC_BIG_X_3 */
	uint16_t big_x0_3;
	uint16_t big_x1_3;
	/* RAWAWB_XY_DETC_BIG_Y_3 */
	uint16_t big_y0_3;
	uint16_t big_y1_3;
	/* RAWAWB_MULTIWINDOW_EXC_CTRL */
	uint8_t exc_wp_region0_excen;
	uint8_t exc_wp_region0_measen;
	uint8_t exc_wp_region0_domain;
	uint8_t exc_wp_region1_excen;
	uint8_t exc_wp_region1_measen;
	uint8_t exc_wp_region1_domain;
	uint8_t exc_wp_region2_excen;
	uint8_t exc_wp_region2_measen;
	uint8_t exc_wp_region2_domain;
	uint8_t exc_wp_region3_excen;
	uint8_t exc_wp_region3_measen;
	uint8_t exc_wp_region3_domain;
	uint8_t exc_wp_region4_excen;
	uint8_t exc_wp_region4_domain;
	uint8_t exc_wp_region5_excen;
	uint8_t exc_wp_region5_domain;
	uint8_t exc_wp_region6_excen;
	uint8_t exc_wp_region6_domain;
	uint8_t multiwindow_en;
	/* RAWAWB_MULTIWINDOW0_OFFS */
	uint16_t multiwindow0_h_offs;
	uint16_t multiwindow0_v_offs;
	/* RAWAWB_MULTIWINDOW0_SIZE */
	uint16_t multiwindow0_h_size;
	uint16_t multiwindow0_v_size;
	/* RAWAWB_MULTIWINDOW1_OFFS */
	uint16_t multiwindow1_h_offs;
	uint16_t multiwindow1_v_offs;
	/* RAWAWB_MULTIWINDOW1_OFFS */
	uint16_t multiwindow1_h_size;
	uint16_t multiwindow1_v_size;
	/* RAWAWB_MULTIWINDOW2_OFFS */
	uint16_t multiwindow2_h_offs;
	uint16_t multiwindow2_v_offs;
	/* RAWAWB_MULTIWINDOW2_SIZE */
	uint16_t multiwindow2_h_size;
	uint16_t multiwindow2_v_size;
	/* RAWAWB_MULTIWINDOW3_OFFS */
	uint16_t multiwindow3_h_offs;
	uint16_t multiwindow3_v_offs;
	/* RAWAWB_MULTIWINDOW3_SIZE */
	uint16_t multiwindow3_h_size;
	uint16_t multiwindow3_v_size;
	/* RAWAWB_EXC_WP_REGION0_XU */
	uint16_t exc_wp_region0_xu0;
	uint16_t exc_wp_region0_xu1;
	/* RAWAWB_EXC_WP_REGION0_YV */
	uint16_t exc_wp_region0_yv0;
	uint16_t exc_wp_region0_yv1;
	/* RAWAWB_EXC_WP_REGION1_XU */
	uint16_t exc_wp_region1_xu0;
	uint16_t exc_wp_region1_xu1;
	/* RAWAWB_EXC_WP_REGION1_YV */
	uint16_t exc_wp_region1_yv0;
	uint16_t exc_wp_region1_yv1;
	/* RAWAWB_EXC_WP_REGION2_XU */
	uint16_t exc_wp_region2_xu0;
	uint16_t exc_wp_region2_xu1;
	/* RAWAWB_EXC_WP_REGION2_YV */
	uint16_t exc_wp_region2_yv0;
	uint16_t exc_wp_region2_yv1;
	/* RAWAWB_EXC_WP_REGION3_XU */
	uint16_t exc_wp_region3_xu0;
	uint16_t exc_wp_region3_xu1;
	/* RAWAWB_EXC_WP_REGION3_YV */
	uint16_t exc_wp_region3_yv0;
	uint16_t exc_wp_region3_yv1;
	/* RAWAWB_EXC_WP_REGION4_XU */
	uint16_t exc_wp_region4_xu0;
	uint16_t exc_wp_region4_xu1;
	/* RAWAWB_EXC_WP_REGION4_YV */
	uint16_t exc_wp_region4_yv0;
	uint16_t exc_wp_region4_yv1;
	/* RAWAWB_EXC_WP_REGION5_XU */
	uint16_t exc_wp_region5_xu0;
	uint16_t exc_wp_region5_xu1;
	/* RAWAWB_EXC_WP_REGION5_YV */
	uint16_t exc_wp_region5_yv0;
	uint16_t exc_wp_region5_yv1;
	/* RAWAWB_EXC_WP_REGION6_XU */
	uint16_t exc_wp_region6_xu0;
	uint16_t exc_wp_region6_xu1;
	/* RAWAWB_EXC_WP_REGION6_YV */
	uint16_t exc_wp_region6_yv0;
	uint16_t exc_wp_region6_yv1;
	/* RAWAWB_EXC_WP_WEIGHT0_3 */
	uint8_t exc_wp_region0_weight;
	uint8_t exc_wp_region1_weight;
	uint8_t exc_wp_region2_weight;
	uint8_t exc_wp_region3_weight;
	/* RAWAWB_EXC_WP_WEIGHT4_6 */
	uint8_t exc_wp_region4_weight;
	uint8_t exc_wp_region5_weight;
	uint8_t exc_wp_region6_weight;
	/* RAWAWB_WRAM_DATA */
	uint8_t wp_blk_wei_w[ISP39_RAWAWB_WEIGHT_NUM];

	struct isp2x_bls_fixed_val bls2_val;
} __attribute__ ((packed));

struct isp39_rawaf_meas_cfg {
	uint8_t rawaf_sel;
	uint8_t num_afm_win;
	uint8_t bnr2af_sel;

	/* CTRL */
	uint8_t gamma_en;
	uint8_t gaus_en;
	uint8_t hiir_en;
	uint8_t viir_en;
	uint8_t ldg_en;
	uint8_t h1_fv_mode;
	uint8_t h2_fv_mode;
	uint8_t v1_fv_mode;
	uint8_t v2_fv_mode;
	uint8_t ae_mode;
	uint8_t y_mode;
	uint8_t vldg_sel;
	uint8_t v_dnscl_mode;
	uint8_t from_ynr;
	uint8_t ae_config_use;
	uint8_t hiir_left_border_mode;
	uint8_t avg_ds_en;
	uint8_t avg_ds_mode;
	uint8_t h1_acc_mode;
	uint8_t h2_acc_mode;
	uint8_t v1_acc_mode;
	uint8_t v2_acc_mode;

	/* WINA_B */
	struct isp2x_window win[ISP39_RAWAF_WIN_NUM];

	/* CTRL1 */
	int16_t bls_offset;
	uint8_t bls_en;
	uint8_t aehgl_en;
	uint8_t hldg_dilate_num;
	uint8_t tnrin_shift;

	/* HVIIR_VAR_SHIFT */
	uint8_t h1iir_shift_wina;
	uint8_t h2iir_shift_wina;
	uint8_t v1iir_shift_wina;
	uint8_t v2iir_shift_wina;
	uint8_t h1iir_shift_winb;
	uint8_t h2iir_shift_winb;
	uint8_t v1iir_shift_winb;
	uint8_t v2iir_shift_winb;

	/* GAUS_COE */
	int8_t gaus_coe[ISP39_RAWAF_GAUS_COE_NUM];

	/* GAMMA_Y */
	uint16_t gamma_y[ISP39_RAWAF_GAMMA_NUM];
	/* HIIR_THRESH */
	uint16_t h_fv_thresh;
	uint16_t v_fv_thresh;
	struct isp3x_rawaf_curve curve_h[ISP39_RAWAF_CURVE_NUM];
	struct isp3x_rawaf_curve curve_v[ISP39_RAWAF_CURVE_NUM];
	int16_t h1iir1_coe[ISP39_RAWAF_HIIR_COE_NUM];
	int16_t h1iir2_coe[ISP39_RAWAF_HIIR_COE_NUM];
	int16_t h2iir1_coe[ISP39_RAWAF_HIIR_COE_NUM];
	int16_t h2iir2_coe[ISP39_RAWAF_HIIR_COE_NUM];
	int16_t v1iir_coe[ISP39_RAWAF_VIIR_COE_NUM];
	int16_t v2iir_coe[ISP39_RAWAF_VIIR_COE_NUM];
	int16_t v1fir_coe[ISP39_RAWAF_VFIR_COE_NUM];
	int16_t v2fir_coe[ISP39_RAWAF_VFIR_COE_NUM];
	/* HIGHLIT_THRESH */
	uint16_t highlit_thresh;

	/* CORING_H */
	uint16_t h_fv_limit;
	uint16_t h_fv_slope;
	/* CORING_V */
	uint16_t v_fv_limit;
	uint16_t v_fv_slope;
} __attribute__ ((packed));

struct isp39_isp_other_cfg {
	struct isp32_bls_cfg bls_cfg;
	struct isp39_dpcc_cfg dpcc_cfg;
	struct isp3x_lsc_cfg lsc_cfg;
	struct isp32_awb_gain_cfg awb_gain_cfg;
	struct isp21_gic_cfg gic_cfg;
	struct isp39_debayer_cfg debayer_cfg;
	struct isp39_ccm_cfg ccm_cfg;
	struct isp3x_gammaout_cfg gammaout_cfg;
	struct isp2x_cproc_cfg cproc_cfg;
	struct isp2x_sdg_cfg sdg_cfg;
	struct isp39_drc_cfg drc_cfg;
	struct isp32_hdrmge_cfg hdrmge_cfg;
	struct isp39_dhaz_cfg dhaz_cfg;
	struct isp2x_3dlut_cfg isp3dlut_cfg;
	struct isp39_ldch_cfg ldch_cfg;
	struct isp39_bay3d_cfg bay3d_cfg;
	struct isp39_ynr_cfg ynr_cfg;
	struct isp39_cnr_cfg cnr_cfg;
	struct isp39_sharp_cfg sharp_cfg;
	struct isp32_cac_cfg cac_cfg;
	struct isp3x_gain_cfg gain_cfg;
	struct isp21_csm_cfg csm_cfg;
	struct isp21_cgc_cfg cgc_cfg;
	struct isp39_yuvme_cfg yuvme_cfg;
	struct isp39_ldcv_cfg ldcv_cfg;
	struct isp39_rgbir_cfg rgbir_cfg;
} __attribute__ ((packed));

struct isp39_isp_meas_cfg {
	struct isp39_rawaf_meas_cfg rawaf;
	struct isp39_rawawb_meas_cfg rawawb;
	struct isp2x_rawaebig_meas_cfg rawae0;
	struct isp2x_rawaebig_meas_cfg rawae3;
	struct isp2x_rawhistbig_cfg rawhist0;
	struct isp2x_rawhistbig_cfg rawhist3;
} __attribute__ ((packed));

struct isp39_isp_params_cfg {
	uint64_t module_en_update;
	uint64_t module_ens;
	uint64_t module_cfg_update;

	uint32_t frame_id;
	struct isp39_isp_meas_cfg meas;
	struct isp39_isp_other_cfg others;
} __attribute__ ((packed));

struct isp39_dhaz_stat {
	uint16_t adp_wt;
	uint16_t adp_air_base;
	uint16_t adp_tmax;

	uint16_t hist_iir[ISP39_DHAZ_HIST_IIR_BLK_MAX][ISP39_DHAZ_HIST_IIR_NUM];
} __attribute__ ((packed));

struct isp39_bay3d_stat {
	uint32_t tnr_auto_sigma_count;
	uint16_t tnr_auto_sigma_calc[ISP39_BAY3D_TNRSIG_NUM];
} __attribute__ ((packed));

struct isp39_rawae_mean_lum {
	uint32_t g:12;
	uint32_t b:10;
	uint32_t r:10;
} __attribute__ ((packed));

struct isp39_rawae_mean_line {
	/* line: 15 word + one unuse */
	struct isp39_rawae_mean_lum blk_x[ISP39_MEAN_BLK_X_NUM];
	uint32_t reserved;
} __attribute__ ((packed));

struct isp39_rawae_stat {
	struct isp39_rawae_mean_line blk_y[ISP39_MEAN_BLK_Y_NUM];
} __attribute__ ((packed));

struct isp39_rawhist_stat {
	uint32_t bin[ISP39_HIST_BIN_N_MAX];
} __attribute__ ((packed));

struct isp39_rawaf_mean_hiir {
	uint32_t h1;
	uint32_t h2;
} __attribute__ ((packed));

struct isp39_rawaf_mean_hiir_line {
	/* line: 15 * 2 word + two unuse */
	struct isp39_rawaf_mean_hiir hiir_blk_x[ISP39_MEAN_BLK_X_NUM];
	uint32_t reserved[2];
} __attribute__ ((packed));

struct isp39_rawaf_mean_viir {
	uint32_t v1;
	uint32_t v2;
} __attribute__ ((packed));

struct isp39_rawaf_mean_viir_line {
	/* line: 15 * 2 word + two unuse */
	struct isp39_rawaf_mean_viir viir_blk_x[ISP39_MEAN_BLK_X_NUM];
	uint32_t reserved[2];
} __attribute__ ((packed));

struct isp39_rawaf_mean_aehgl {
	uint32_t average:12;
	uint32_t highlight:20;
} __attribute__ ((packed));

struct isp39_rawaf_mean_aehgl_line {
	/* line: 15 word + one unuse */
	struct isp39_rawaf_mean_aehgl aehgl_blk_x[ISP39_MEAN_BLK_X_NUM];
	uint32_t reserved;
} __attribute__ ((packed));

struct isp39_rawaf_stat {
	struct isp39_rawaf_mean_hiir_line hiir_blk_y[ISP39_MEAN_BLK_Y_NUM];
	struct isp39_rawaf_mean_viir_line viir_blk_y[ISP39_MEAN_BLK_Y_NUM];
	struct isp39_rawaf_mean_aehgl_line aehgl_blk_y[ISP39_MEAN_BLK_Y_NUM];
	uint32_t h1iir_sumb;
	uint32_t h2iir_sumb;
	uint32_t v1iir_sumb;
	uint32_t v2iir_sumb;
	uint32_t sumy_winb;
	uint32_t highlit_cnt_winb;
	uint32_t reserved[2];
} __attribute__ ((packed));

struct isp39_rawawb_mean_ramdata {
	uint64_t b:18;
	uint64_t g:18;
	uint64_t r:18;
	uint64_t wp:10;
} __attribute__ ((packed));

struct isp39_rawawb_mean_ramdata_line {
	struct isp39_rawawb_mean_ramdata ramdata_blk_x[ISP39_MEAN_BLK_X_NUM];
	uint32_t reserved[2];
} __attribute__ ((packed));

struct isp39_rawawb_mean_sum {
	uint32_t rgain_nor;
	uint32_t bgain_nor;
	uint32_t wp_num_nor;
	uint32_t wp_num2;

	uint32_t rgain_big;
	uint32_t bgain_big;
	uint32_t wp_num_big;
	uint32_t reserved;
} __attribute__ ((packed));

struct isp39_rawawb_mean_sum_exc {
	uint32_t rgain_exc;
	uint32_t bgain_exc;
	uint32_t wp_num_exc;
	uint32_t reserved;
} __attribute__ ((packed));

struct isp39_rawawb_stat {
	struct isp39_rawawb_mean_ramdata_line ramdata_blk_y[ISP39_MEAN_BLK_Y_NUM];
	struct isp39_rawawb_mean_sum sum[ISP39_RAWAWB_SUM_NUM];
	uint16_t yhist[ISP39_RAWAWB_HSTBIN_NUM];
	struct isp39_rawawb_mean_sum_exc sum_exc[ISP39_RAWAWB_EXCL_STAT_NUM];
} __attribute__ ((packed));

struct isp39_stat {
	/* mean to ddr */
	struct isp39_rawae_stat rawae3;
	struct isp39_rawhist_stat rawhist3;
	struct isp39_rawae_stat rawae0;
	struct isp39_rawhist_stat rawhist0;
	struct isp39_rawaf_stat rawaf;
	struct isp39_rawawb_stat rawawb;
	/* ahb read reg */
	struct isp39_dhaz_stat dhaz;
	struct isp39_bay3d_stat bay3d;
	struct isp32_info2ddr_stat info2ddr;
} __attribute__ ((packed));

struct rkisp39_stat_buffer {
	struct isp39_stat stat;
	uint32_t meas_type;
	uint32_t frame_id;
	uint32_t params_id;
} __attribute__ ((packed));
#endif
