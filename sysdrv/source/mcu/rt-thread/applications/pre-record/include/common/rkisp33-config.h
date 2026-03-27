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

#ifndef _UAPI_RK_ISP33_CONFIG_H
#define _UAPI_RK_ISP33_CONFIG_H

#include "rkisp39-config.h"

#define ISP33_MODULE_DPCC		ISP3X_MODULE_DPCC
#define ISP33_MODULE_BLS		ISP3X_MODULE_BLS
#define ISP33_MODULE_LSC		ISP3X_MODULE_LSC
#define ISP33_MODULE_AWB_GAIN		ISP3X_MODULE_AWB_GAIN
#define ISP33_MODULE_CCM		ISP3X_MODULE_CCM
#define ISP33_MODULE_GOC		ISP3X_MODULE_GOC
#define ISP33_MODULE_CPROC		ISP3X_MODULE_CPROC
#define ISP33_MODULE_IE			ISP3X_MODULE_IE
#define ISP33_MODULE_RAWAE0		ISP3X_MODULE_RAWAE0
#define ISP33_MODULE_RAWAE3		ISP3X_MODULE_RAWAE3
#define ISP33_MODULE_RAWAWB		ISP3X_MODULE_RAWAWB
#define ISP33_MODULE_RAWHIST0		ISP3X_MODULE_RAWHIST0
#define ISP33_MODULE_RAWHIST3		ISP3X_MODULE_RAWHIST3
#define ISP33_MODULE_HDRMGE		ISP3X_MODULE_HDRMGE
#define ISP33_MODULE_GIC		ISP3X_MODULE_GIC
#define ISP33_MODULE_LDCH		ISP3X_MODULE_LDCH
#define ISP33_MODULE_GAIN		ISP3X_MODULE_GAIN
#define ISP33_MODULE_DEBAYER		ISP3X_MODULE_DEBAYER
#define ISP33_MODULE_BAY3D		ISP3X_MODULE_BAY3D
#define ISP33_MODULE_YNR		ISP3X_MODULE_YNR
#define ISP33_MODULE_CNR		ISP3X_MODULE_CNR
#define ISP33_MODULE_SHARP		ISP3X_MODULE_SHARP
#define ISP33_MODULE_DRC		ISP3X_MODULE_DRC
#define ISP33_MODULE_CAC		ISP3X_MODULE_CAC
#define ISP33_MODULE_CSM		ISP3X_MODULE_CSM
#define ISP33_MODULE_CGC		ISP3X_MODULE_CGC
#define ISP33_MODULE_HSV		BIT_ULL(48)
#define ISP33_MODULE_ENH		BIT_ULL(49)
#define ISP33_MODULE_HIST		BIT_ULL(50)

#define ISP33_MODULE_FORCE		ISP3X_MODULE_FORCE

/* Measurement types */
#define ISP33_STAT_RAWAWB		ISP3X_STAT_RAWAWB
#define ISP33_STAT_RAWAE0		ISP3X_STAT_RAWAE0
#define ISP33_STAT_RAWAE3		ISP3X_STAT_RAWAE3
#define ISP33_STAT_RAWHST0		ISP3X_STAT_RAWHST0
#define ISP33_STAT_RAWHST3		ISP3X_STAT_RAWHST3
#define ISP33_STAT_INFO2DDR		ISP32_STAT_INFO2DDR
#define ISP33_STAT_BAY3D		BIT(20)
#define ISP33_STAT_ENH			BIT(21)
#define ISP33_STAT_HIST			BIT(22)
#define ISP33_STAT_SHARP		BIT(23)
#define ISP33_STAT_RTT_FST		ISP32_STAT_RTT_FST

#define ISP33_MESH_BUF_NUM		ISP3X_MESH_BUF_NUM

#define ISP33_LSC_GRAD_TBL_SIZE		ISP3X_LSC_GRAD_TBL_SIZE
#define ISP33_LSC_SIZE_TBL_SIZE		ISP3X_LSC_SIZE_TBL_SIZE
#define ISP33_LSC_DATA_TBL_SIZE		ISP3X_LSC_DATA_TBL_SIZE

#define ISP33_DEGAMMA_CURVE_SIZE	ISP3X_DEGAMMA_CURVE_SIZE

#define ISP33_GAIN_IDX_NUM		ISP3X_GAIN_IDX_NUM
#define ISP33_GAIN_LUT_NUM		ISP3X_GAIN_LUT_NUM

#define ISP33_RAWAWB_WEIGHT_NUM		ISP3X_RAWAWB_WEIGHT_NUM
#define ISP33_RAWAWB_HSTBIN_NUM		ISP3X_RAWAWB_HSTBIN_NUM
#define ISP33_RAWAWB_SUM_NUM		4
#define ISP33_RAWAWB_EXCL_STAT_NUM	4

#define	ISP33_RAWAEBIG_SUBWIN_NUM	2

#define ISP33_RAWHISTBIG_SUBWIN_NUM	ISP3X_RAWHISTBIG_SUBWIN_NUM
#define ISP33_RAWHISTLITE_SUBWIN_NUM	ISP3X_RAWHISTLITE_SUBWIN_NUM
#define ISP33_HIST_BIN_N_MAX		ISP3X_HIST_BIN_N_MAX

#define ISP33_DPCC_PDAF_POINT_NUM	ISP3X_DPCC_PDAF_POINT_NUM

#define ISP33_HDRMGE_L_CURVE_NUM	ISP3X_HDRMGE_L_CURVE_NUM
#define ISP33_HDRMGE_E_CURVE_NUM	ISP3X_HDRMGE_E_CURVE_NUM

#define ISP33_GIC_SIGMA_Y_NUM		17
#define ISP33_GIC_LUMA_DX_NUM		7
#define ISP33_GIC_THRED_Y_NUM		8

#define ISP33_CCM_CURVE_NUM		18
#define ISP33_CCM_HF_FACTOR_NUM		17

#define ISP33_HSV_1DLUT_NUM		65
#define ISP33_HSV_2DLUT_ROW		17
#define ISP33_HSV_2DLUT_COL		17

#define ISP33_LDCH_BIC_NUM		ISP32_LDCH_BIC_NUM

#define ISP33_GAMMA_OUT_MAX_SAMPLES     ISP3X_GAMMA_OUT_MAX_SAMPLES

#define ISP33_ENH_LUMA_NUM		17
#define ISP33_ENH_DETAIL_NUM		8
#define ISP33_ENH_IIR_ROW_MAX		18
#define ISP33_ENH_IIR_COL_MAX		24

#define ISP33_HIST_ALPHA_NUM		17
#define ISP33_HIST_THUMB_ROW_MAX	8
#define ISP33_HIST_THUMB_COL_MAX	10
#define ISP33_HIST_IIR_NUM		16
#define ISP33_HIST_IIR_BLK_MAX		(ISP33_HIST_THUMB_ROW_MAX * ISP33_HIST_THUMB_COL_MAX)

#define ISP33_DRC_Y_NUM			ISP3X_DRC_Y_NUM

#define ISP33_CNR_SIGMA_Y_NUM		ISP3X_CNR_SIGMA_Y_NUM
#define ISP33_CNR_GAUS_COE_NUM		6
#define ISP33_CNR_GAUS_SIGMAR_NUM	8
#define ISP33_CNR_WGT_SIGMA_Y_NUM	13

#define ISP33_YNR_XY_NUM		ISP3X_YNR_XY_NUM
#define ISP33_YNR_HI_GAUS_COE_NUM	5
#define ISP33_YNR_HI_GAUS1_COE_NUM	6
#define ISP33_YNR_ADJ_NUM	9

#define ISP33_BAY3D_XY_NUM		16
#define ISP33_BAY3D_TNRSIG_NUM		20
#define ISP33_BAY3D_LPF_COEFF_NUM	9
#define ISP33_BAY3D_FILT_COEFF_NUM	6

#define ISP33_SHARP_X_NUM		7
#define ISP33_SHARP_Y_NUM		8
#define ISP33_SHARP_KERNEL_NUM		6
#define ISP33_SHARP_EDGE_KERNEL_NUM	10
#define ISP33_SHARP_EDGE_WGT_NUM	17
#define ISP33_SHARP_LUMA_STRG_NUM	8
#define ISP33_SHARP_LOCAL_STRG_NUM	4
#define ISP33_SHARP_CONTRAST_STRG_NUM	9
#define ISP33_SHARP_TEX_CLIP_NUM	9
#define ISP33_SHARP_LUM_CLIP_NUM	8
#define ISP33_SHARP_HUE_NUM		9
#define ISP33_SHARP_DISATANCE_NUM	11
#define ISP33_SHARP_HITEX_NUM		9
#define ISP33_SHARP_NOISE_CURVE_NUM	17

#define ISP33_CAC_PSF_NUM		11

#define ISP33_CSM_COEFF_NUM		ISP3X_CSM_COEFF_NUM

#define ISP33_DEBAYER_LUMA_NUM		7
#define ISP33_DEBAYER_DRCT_OFFSET_NUM	8
#define ISP33_DEBAYER_VSIGMA_NUM	8

#define ISP33_MEAN_BLK_X_NUM		15
#define ISP33_MEAN_BLK_Y_NUM		15

#define ISP33_BNR2AEBIG_SEL_EN		0x10
#define ISP33_BNR2AE0_SEL_EN		0x20

struct isp33_hsv_cfg {
	uint8_t hsv_1dlut0_en;
	uint8_t hsv_1dlut1_en;
	uint8_t hsv_2dlut_en;
	uint8_t hsv_1dlut0_idx_mode;
	uint8_t hsv_1dlut1_idx_mode;
	uint8_t hsv_2dlut_idx_mode;
	uint8_t hsv_1dlut0_item_mode;
	uint8_t hsv_1dlut1_item_mode;
	uint8_t hsv_2dlut_item_mode;

	uint16_t lut0_1d[ISP33_HSV_1DLUT_NUM];
	uint16_t lut1_1d[ISP33_HSV_1DLUT_NUM];
	uint16_t lut_2d[ISP33_HSV_2DLUT_ROW][ISP33_HSV_2DLUT_COL];
} __attribute__ ((packed));

struct isp33_gic_cfg {
	/* CTRL */
	uint8_t bypass_en;
	uint8_t pro_mode;
	uint8_t manualnoisecurve_en;
	uint8_t manualnoisethred_en;
	uint8_t gain_bypass_en;
	/* MEDFLT_PARA */
	uint8_t medflt_minthred;
	uint8_t medflt_maxthred;
	uint8_t medflt_ratio;
	/* MEDFLTUV_PARA */
	uint8_t medfltuv_minthred;
	uint8_t medfltuv_maxthred;
	uint8_t medfltuv_ratio;
	/* NOISE_SCALE */
	uint16_t noisecurve_scale;
	/* BILAT_PARA1 */
	uint16_t bffltwgt_offset;
	uint8_t bffltwgt_scale;
	/* BILAT_PARA2 */
	uint8_t bfflt_ratio;
	/* DISWGT_COEFF */
	uint8_t bfflt_coeff0;
	uint8_t bfflt_coeff1;
	uint8_t bfflt_coeff2;
	/* SIGMA_Y */
	uint16_t bfflt_vsigma_y[ISP33_GIC_SIGMA_Y_NUM];
	/* LUMA_DX */
	uint8_t luma_dx[ISP33_GIC_LUMA_DX_NUM];
	/* THRED_Y */
	uint16_t thred_y[ISP33_GIC_THRED_Y_NUM];
	/* MIN_THRED_Y */
	uint16_t minthred_y[ISP33_GIC_THRED_Y_NUM];
	/* THRED_SCALE */
	uint16_t autonoisethred_scale;
	/* LOFLTGR_COEFF */
	uint8_t lofltgr_coeff0;
	uint8_t lofltgr_coeff1;
	uint8_t lofltgr_coeff2;
	uint8_t lofltgr_coeff3;
	/* LOFLTGB_COEFF */
	uint8_t lofltgb_coeff0;
	uint8_t lofltgb_coeff1;
	/* SUM_LOFLT_INV */
	uint16_t sumlofltcoeff_inv;
	/* LOFLTTHRED_COEFF */
	uint8_t lofltthred_coeff0;
	uint8_t lofltthred_coeff1;
	/* GAIN */
	uint8_t globalgain_alpha;
	uint8_t globalgain_scale;
	uint16_t global_gain;
	/* GAIN_SLOPE */
	uint16_t gain_offset;
	uint16_t gain_scale;
	/* GAIN_THRED */
	uint16_t gainadjflt_minthred;
	uint16_t gainadjflt_maxthred;
} __attribute__ ((packed));

struct isp33_cac_cfg {
	/* CTRL */
	uint8_t bypass_en;
	uint8_t edge_detect_en;
	uint8_t neg_clip0_en;
	uint8_t wgt_color_en;
	/* PSF_PARA */
	uint8_t psf_table_fix_bit;
	/* HIGH_DIRECT */
	uint16_t hi_drct_ratio;
	/* OVER_EXPO0 */
	uint32_t over_expo_thred;
	/* OVER_EXP01 */
	uint32_t over_expo_adj;
	/* FLAT */
	uint8_t flat_thred;
	uint16_t flat_offset;
	/* GAUSS_COEFF */
	uint8_t chroma_lo_flt_coeff0;
	uint8_t chroma_lo_flt_coeff1;
	uint8_t color_lo_flt_coeff0;
	uint8_t color_lo_flt_coeff1;
	/* RATIO */
	uint16_t search_range_ratio;
	uint16_t residual_chroma_ratio;
	/* WGT_COLOR_B */
	uint32_t wgt_color_b_min_thred;
	/* WGT_COLOR_R */
	uint32_t wgt_color_r_min_thred;
	/* WGT_COLOR_SLOPE_B */
	uint32_t wgt_color_b_slope;
	/* WGT_COLOR_SLOPE_R */
	uint32_t wgt_color_r_slope;
	/* WGT_COLOR_LUMA0 */
	uint32_t wgt_color_min_luma;
	/* WGT_COLOR_LUMA1 */
	uint32_t wgt_color_luma_slope;
	/* WGT_OVER_EXPO0 */
	uint32_t wgt_over_expo_min_thred;
	/* WGT_OVER_EXPO1 */
	uint32_t wgt_over_expo_slope;
	/* WGT_CONTRAST0 */
	uint32_t wgt_contrast_min_thred;
	/* WGT_CONTRAST1 */
	uint32_t wgt_contrast_slope;
	/* WGT_CONTRAST2 */
	uint32_t wgt_contrast_offset;
	/* WGT_DARK_AREA0 */
	uint32_t wgt_dark_thed;
	/* WGT_DARK_AREA1 */
	uint32_t wgt_dark_slope;
	/* PSF_B */
	uint8_t psf_b_ker[ISP33_CAC_PSF_NUM];
	/* PSF_R */
	uint8_t psf_r_ker[ISP33_CAC_PSF_NUM];
} __attribute__ ((packed));

struct isp33_ccm_cfg {
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
	uint16_t alp_y[ISP33_CCM_CURVE_NUM];
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
	uint16_t hf_factor[ISP33_CCM_HF_FACTOR_NUM];
} __attribute__ ((packed));

struct isp33_debayer_cfg {
	/* CONTROL */
	uint8_t bypass;
	uint8_t g_out_flt_en;
	/* LUMA_DX */
	uint8_t luma_dx[ISP33_DEBAYER_LUMA_NUM];
	/* G_INTERP */
	uint8_t g_interp_clip_en;
	uint8_t hi_texture_thred;
	uint8_t hi_drct_thred;
	uint8_t lo_drct_thred;
	uint8_t drct_method_thred;
	uint8_t g_interp_sharp_strg_max_limit;
	/* G_INTERP_FILTER1 */
	int8_t lo_drct_flt_coeff1;
	int8_t lo_drct_flt_coeff2;
	int8_t lo_drct_flt_coeff3;
	int8_t lo_drct_flt_coeff4;
	/* G_INTERP_FILTER2 */
	int8_t hi_drct_flt_coeff1;
	int8_t hi_drct_flt_coeff2;
	int8_t hi_drct_flt_coeff3;
	int8_t hi_drct_flt_coeff4;
	/* G_INTERP_OFFSET_ALPHA */
	uint16_t g_interp_sharp_strg_offset;
	uint8_t grad_lo_flt_alpha;
	/* G_INTERP_DRCT_OFFSET */
	uint16_t drct_offset[ISP33_DEBAYER_DRCT_OFFSET_NUM];
	/* G_FILTER_MODE_OFFSET */
	uint8_t gflt_mode;
	uint16_t gflt_ratio;
	uint16_t gflt_offset;
	/* G_FILTER_FILTER */
	int8_t gflt_coe0;
	int8_t gflt_coe1;
	int8_t gflt_coe2;
	/* G_FILTER_VSIGMA */
	uint16_t gflt_vsigma[ISP33_DEBAYER_VSIGMA_NUM];
} __attribute__ ((packed));

struct isp33_bay3d_cfg {
	/* BAY3D_CTRL0 */
	uint8_t bypass_en;
	uint8_t iirsparse_en;
	uint8_t out_use_pre_mode;
	uint8_t motion_est_en;
	/* BAY3D_CTRL1 */
	uint8_t transf_bypass_en;
	uint8_t tnrsigma_curve_double_en;
	uint8_t md_large_lo_use_mode;
	uint8_t md_large_lo_min_filter_bypass_en;
	uint8_t md_large_lo_gauss_filter_bypass_en;
	uint8_t md_large_lo_md_wgt_bypass_en;
	uint8_t pre_pix_out_mode;
	uint8_t motion_detect_bypass_en;
	uint8_t lpf_hi_bypass_en;
	uint8_t lo_diff_vfilt_bypass_en;
	uint8_t lpf_lo_bypass_en;
	uint8_t lo_wgt_hfilt_en;
	uint8_t lo_diff_hfilt_en;
	uint8_t sig_hfilt_en;
	uint8_t lo_detection_bypass_en;
	uint8_t lo_mge_wgt_mode;
	uint8_t pre_spnr_out_en;
	uint8_t md_only_lo_en;
	uint8_t cur_spnr_out_en;
	uint8_t md_wgt_out_en;
	/* BAY3D_CTRL2 */
	uint8_t cur_spnr_filter_bypass_en;
	uint8_t pre_spnr_hi_filter_gic_en;
	uint8_t pre_spnr_hi_filter_gic_enhance_en;
	uint8_t spnr_presigma_use_en;
	uint8_t pre_spnr_lo_filter_bypass_en;
	uint8_t pre_spnr_hi_filter_bypass_en;
	uint8_t pre_spnr_sigma_curve_double_en;
	uint8_t pre_spnr_hi_guide_filter_bypass_en;
	uint8_t pre_spnr_sigma_idx_filt_bypass_en;
	uint8_t pre_spnr_sigma_idx_filt_mode;
	uint8_t pre_spnr_hi_noise_ctrl_en;
	uint8_t pre_spnr_hi_filter_wgt_mode;
	uint8_t pre_spnr_lo_filter_wgt_mode;
	uint8_t pre_spnr_hi_filter_rb_wgt_mode;
	uint8_t pre_spnr_lo_filter_rb_wgt_mode;
	uint8_t pre_hi_gic_lp_en;
	uint8_t pre_hi_bf_lp_en;
	uint8_t pre_lo_avg_lp_en;
	/* BAY3D_CTRL3 */
	uint8_t transf_mode;
	uint8_t wgt_cal_mode;
	uint8_t ww_mode;
	uint8_t wgt_last_mode;
	uint8_t mge_wgt_hdr_sht_thred;
	uint8_t sigma_calc_mge_wgt_hdr_sht_thred;
	/* BAY3D_TRANS0 */
	uint8_t transf_mode_scale;
	uint16_t transf_mode_offset;
	uint16_t itransf_mode_offset;
	/* BAY3D_TRANS1 */
	uint32_t transf_data_max_limit;
	/* BAY3D_CURHI_SIGSCL */
	uint16_t pre_sig_ctrl_scl;
	/* BAY3D_CURHI_SIGOF */
	uint8_t pre_hi_guide_out_wgt;
	/* BAY3D_CURHISPW */
	uint8_t cur_spnr_filter_coeff[ISP33_BAY3D_FILT_COEFF_NUM];
	/* BAY3D_IIRSX */
	uint16_t pre_spnr_luma2sigma_x[ISP33_BAY3D_XY_NUM];
	/* BAY3D_IIRSY */
	uint16_t pre_spnr_luma2sigma_y[ISP33_BAY3D_XY_NUM];
	/* BAY3D_PREHI_SIGSCL */
	uint16_t pre_spnr_hi_sigma_scale;
	/* BAY3D_PREHI_WSCL */
	uint8_t pre_spnr_hi_wgt_calc_scale;
	/* BAY3D_PREHIWMM */
	uint8_t pre_spnr_hi_filter_wgt_min_limit;
	/* BAY3D_PREHISIGOF */
	uint8_t pre_spnr_hi_filter_out_wgt;
	uint8_t pre_spnr_sigma_offset;
	uint8_t pre_spnr_sigma_hdr_sht_offset;
	/* BAY3D_PREHISIGSCL */
	uint16_t pre_spnr_sigma_scale;
	uint16_t pre_spnr_sigma_hdr_sht_scale;
	/* BAY3D_PREHISPW */
	uint8_t pre_spnr_hi_filter_coeff[ISP33_BAY3D_FILT_COEFF_NUM];
	/* BAY3D_PRELOSIGCSL */
	uint16_t pre_spnr_lo_sigma_scale;
	/* BAY3D_PRELOSIGOF */
	uint8_t pre_spnr_lo_wgt_calc_scale;
	/* BAY3D_PREHI_NRCT */
	uint16_t pre_spnr_hi_noise_ctrl_scale;
	uint8_t pre_spnr_hi_noise_ctrl_offset;
	/* BAY3D_TNRSX */
	uint16_t tnr_luma2sigma_x[ISP33_BAY3D_TNRSIG_NUM];
	/* BAY3D_TNRSY */
	uint16_t tnr_luma2sigma_y[ISP33_BAY3D_TNRSIG_NUM];
	/* BAY3D_HIWD */
	uint16_t lpf_hi_coeff[ISP33_BAY3D_LPF_COEFF_NUM];
	/* BAY3D_LOWD */
	uint16_t lpf_lo_coeff[ISP33_BAY3D_LPF_COEFF_NUM];
	/* BAY3D_GF */
	uint8_t sigma_idx_filt_coeff[ISP33_BAY3D_FILT_COEFF_NUM];
	uint16_t lo_wgt_cal_first_line_sigma_scale;
	/* BAY3D_VIIR */
	uint8_t lo_diff_vfilt_wgt;
	uint8_t lo_wgt_vfilt_wgt;
	uint8_t sig_first_line_scale;
	uint8_t lo_diff_first_line_scale;
	/* BAY3D_LFSCL */
	uint16_t lo_wgt_cal_offset;
	uint16_t lo_wgt_cal_scale;
	/* BAY3D_LFSCLTH */
	uint16_t lo_wgt_cal_max_limit;
	uint16_t mode0_base_ratio;
	/* BAY3D_DSWGTSCL */
	uint16_t lo_diff_wgt_cal_offset;
	uint16_t lo_diff_wgt_cal_scale;
	/* BAY3D_WGTLASTSCL */
	uint16_t lo_mge_pre_wgt_offset;
	uint16_t lo_mge_pre_wgt_scale;
	/* BAY3D_WGTSCL0 */
	uint16_t mode0_lo_wgt_scale;
	uint16_t mode0_lo_wgt_hdr_sht_scale;
	/* BAY3D_WGTSCL1 */
	uint16_t mode1_lo_wgt_scale;
	uint16_t mode1_lo_wgt_hdr_sht_scale;
	/* BAY3D_WGTSCL2 */
	uint16_t mode1_wgt_scale;
	uint16_t mode1_wgt_hdr_sht_scale;
	/* BAY3D_WGTOFF */
	uint16_t mode1_lo_wgt_offset;
	uint16_t mode1_lo_wgt_hdr_sht_offset;
	/* BAY3D_WGT1OFF */
	uint16_t auto_sigma_count_wgt_thred;
	uint16_t mode1_wgt_min_limit;
	uint16_t mode1_wgt_offset;
	/* BAY3D_SIGORG */
	uint32_t tnr_out_sigma_sq;
	/* BAY3D_WGTLO_L */
	uint16_t lo_wgt_clip_min_limit;
	uint16_t lo_wgt_clip_hdr_sht_min_limit;
	/* BAY3D_WGTLO_H */
	uint16_t lo_wgt_clip_max_limit;
	uint16_t lo_wgt_clip_hdr_sht_max_limit;
	/* BAY3D_STH_SCL */
	uint16_t lo_pre_gg_soft_thresh_scale;
	uint16_t lo_pre_rb_soft_thresh_scale;
	/* BAY3D_STH_LIMIT */
	uint16_t lo_pre_soft_thresh_max_limit;
	uint16_t lo_pre_soft_thresh_min_limit;
	/* BAY3D_HIKEEP */
	uint8_t cur_spnr_hi_wgt_min_limit;
	uint8_t pre_spnr_hi_wgt_min_limit;
	uint16_t motion_est_lo_wgt_thred;
	/* BAY3D_PIXMAX */
	uint16_t pix_max_limit;
	/* BAY3D_SIGNUMTH */
	uint32_t sigma_num_th;
	/* BAY3D_MONR */
	uint32_t out_use_hi_noise_bal_nr_strg;
	uint8_t gain_out_max_limit;
	/* BAY3D_SIGSCL */
	uint16_t sigma_scale;
	uint16_t sigma_hdr_sht_scale;
	/* BAY3D_DSOFF */
	uint16_t lo_wgt_vfilt_offset;
	uint16_t lo_diff_vfilt_offset;
	uint8_t lo_wgt_cal_first_line_vfilt_wgt;
	/* BAY3D_DSSCL */
	uint8_t lo_wgt_vfilt_scale;
	uint8_t lo_diff_vfilt_scale_bit;
	uint8_t lo_diff_vfilt_scale;
	uint8_t lo_diff_first_line_vfilt_wgt;
	/* BAY3D_ME0 */
	uint16_t motion_est_up_mvx_cost_offset;
	uint16_t motion_est_up_mvx_cost_scale;
	uint8_t motion_est_sad_vert_wgt0;
	/* BAY3D_ME1 */
	uint16_t motion_est_up_left_mvx_cost_offset;
	uint16_t motion_est_up_left_mvx_cost_scale;
	uint8_t motion_est_sad_vert_wgt1;
	/* BAY3D_ME2 */
	uint16_t motion_est_up_right_mvx_cost_offset;
	uint16_t motion_est_up_right_mvx_cost_scale;
	uint8_t motion_est_sad_vert_wgt2;
	/* BAY3D_WGTMAX */
	uint16_t lo_wgt_clip_motion_max_limit;
	/* BAY3D_WGT1MAX */
	uint16_t mode1_wgt_max_limit;
	/* BAY3D_WGTM0 */
	uint16_t mode0_wgt_out_max_limit;
	uint16_t mode0_wgt_out_offset;
	/* BAY3D_PRELOWGT */
	uint8_t pre_spnr_lo_val_wgt_out_wgt;
	uint8_t pre_spnr_lo_filter_out_wgt;
	uint8_t pre_spnr_lo_filter_wgt_min;
	/* BAY3D_MIDBIG0 */
	uint8_t md_large_lo_md_wgt_offset;
	uint16_t md_large_lo_md_wgt_scale;
	/* BAY3D_MIDBIG1 */
	uint16_t md_large_lo_wgt_cut_offset;
	uint16_t md_large_lo_wgt_add_offset;
	/* BAY3D_MIDBIG2 */
	uint16_t md_large_lo_wgt_scale;
} __attribute__ ((packed));

struct isp33_ynr_cfg {
	/* GLOBAL_CTRL */
	uint8_t hi_spnr_bypass;
	uint8_t mi_spnr_bypass;
	uint8_t lo_spnr_bypass;
	uint8_t rnr_en;
	uint8_t tex2lo_strg_en;
	uint8_t hi_lp_en;
	/* GAIN_CTRL */
	uint16_t global_set_gain;
	uint8_t gain_merge_alpha;
	uint8_t local_gain_scale;
	/* GAIN_ADJ */
	uint16_t lo_spnr_gain2strg[ISP33_YNR_ADJ_NUM];
	/* RNR_MAX_R */
	uint16_t rnr_max_radius;
	/* RNR_CENTER_COOR */
	uint16_t rnr_center_h;
	uint16_t rnr_center_v;
	/* RNR_STRENGTH */
	uint8_t radius2strg[ISP33_YNR_XY_NUM];
	/* SGM_DX */
	uint16_t luma2sima_x[ISP33_YNR_XY_NUM];
	/* SGM_Y */
	uint16_t luma2sima_y[ISP33_YNR_XY_NUM];
	/* HI_SIGMA_GAIN */
	uint16_t hi_spnr_sigma_min_limit;
	uint16_t hi_spnr_strg;
	uint8_t hi_spnr_local_gain_alpha;
	/* HI_GAUS_COE */
	uint8_t hi_spnr_filt_coeff[ISP33_YNR_HI_GAUS_COE_NUM];
	/* HI_WEIGHT */
	uint16_t hi_spnr_filt_wgt_offset;
	uint16_t hi_spnr_filt_center_wgt;
	/* HI_GAUS1_COE */
	uint16_t hi_spnr_filt1_coeff[ISP33_YNR_HI_GAUS1_COE_NUM];
	/* HI_TEXT */
	uint16_t hi_spnr_filt1_tex_thred;
	uint16_t hi_spnr_filt1_tex_scale;
	uint16_t hi_spnr_filt1_wgt_alpha;
	/* MI_GAUS_COE */
	uint16_t mi_spnr_filt_coeff0;
	uint16_t mi_spnr_filt_coeff1;
	uint16_t mi_spnr_filt_coeff2;
	/* MI_STRG_DETAIL */
	uint16_t mi_spnr_strg;
	uint16_t mi_spnr_soft_thred_scale;
	/* MI_WEIGHT */
	uint8_t mi_spnr_wgt;
	uint8_t mi_ehance_scale_en;
	uint8_t mi_ehance_scale;
	uint16_t mi_spnr_filt_center_wgt;
	/* LO_STRG_DETAIL */
	uint16_t lo_spnr_strg;
	uint16_t lo_spnr_soft_thred_scale;
	/* LO_LIMIT_SCALE */
	uint16_t lo_spnr_thumb_thred_scale;
	uint16_t tex2lo_strg_mantissa;
	uint8_t tex2lo_strg_exponent;
	/* LO_WEIGHT */
	uint8_t lo_spnr_wgt;
	uint16_t lo_spnr_filt_center_wgt;
	/* LO_TEXT_THRED */
	uint16_t tex2lo_strg_upper_thred;
	uint16_t tex2lo_strg_lower_thred;
	/* FUSION_WEIT_ADJ */
	uint8_t lo_gain2wgt[ISP33_YNR_ADJ_NUM];
} __attribute__ ((packed));

struct isp33_cnr_cfg {
	/* CNR_CTRL */
	uint8_t exgain_bypass;
	uint8_t yuv422_mode;
	uint8_t thumb_mode;
	uint8_t hiflt_wgt0_mode;
	uint8_t local_alpha_dis;
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
	uint8_t gaus_flt_coeff[ISP33_CNR_GAUS_COE_NUM];
	/* CNR_GAUS_RATIO */
	uint8_t hiflt_wgt_min_limit;
	uint16_t gaus_flt_alpha;
	uint16_t hiflt_alpha;
	/* CNR_BF_PARA1 */
	uint8_t hiflt_uv_gain;
	uint8_t hiflt_cur_wgt;
	uint16_t hiflt_global_vsigma;
	/* CNR_BF_PARA2 */
	uint16_t adj_offset;
	uint16_t adj_scale;
	/* CNR_SIGMA */
	uint8_t sgm_ratio[ISP33_CNR_SIGMA_Y_NUM];
	uint16_t bf_merge_max_limit;
	/* CNR_IIR_GLOBAL_GAIN */
	uint8_t loflt_global_sgm_ratio;
	uint8_t loflt_global_sgm_ratio_alpha;
	uint16_t bf_alpha_max_limit;
	/* CNR_WGT_SIGMA */
	uint8_t cur_wgt[ISP33_CNR_WGT_SIGMA_Y_NUM];
	/* GAUS_X_SIGMAR */
	uint16_t hiflt_vsigma_idx[ISP33_CNR_GAUS_SIGMAR_NUM];
	/* GAUS_Y_SIGMAR */
	uint16_t hiflt_vsigma[ISP33_CNR_GAUS_SIGMAR_NUM];
} __attribute__ ((packed));

struct isp33_sharp_cfg {
	/* SHARP_EN */
	uint8_t bypass;
	uint8_t local_gain_bypass;
	uint8_t tex_est_mode;
	uint8_t max_min_flt_mode;
	uint8_t detail_fusion_wgt_mode;
	uint8_t noise_calc_mode;
	uint8_t radius_step_mode;
	uint8_t noise_curve_mode;
	uint8_t gain_wgt_mode;
	uint8_t detail_lp_en;
	uint8_t debug_mode;
	/* TEXTURE0 */
	uint16_t fst_noise_scale;
	uint16_t fst_sigma_scale;
	/* TEXTURE1 */
	uint16_t fst_sigma_offset;
	uint16_t fst_wgt_scale;
	/* TEXTURE2 */
	uint8_t tex_wgt_mode;
	uint8_t noise_est_alpha;
	/* TEXTURE3 */
	uint16_t sec_noise_scale;
	uint16_t sec_sigma_scale;
	/* TEXTURE4 */
	uint16_t sec_sigma_offset;
	uint16_t sec_wgt_scale;
	/* HPF_KERNEL */
	uint8_t img_hpf_coeff[ISP33_SHARP_KERNEL_NUM];
	/* TEXFLT_KERNEL */
	uint8_t texWgt_flt_coeff0;
	uint8_t texWgt_flt_coeff1;
	uint8_t texWgt_flt_coeff2;
	/* DETAIL0 */
	uint8_t detail_in_alpha;
	uint8_t pre_bifilt_alpha;
	uint8_t fusion_wgt_min_limit;
	uint8_t fusion_wgt_max_limit;
	uint16_t pre_bifilt_slope_fix;
	/* DETAIL1 */
	uint32_t detail_fusion_slope_fix;
	/* LUMA_DX */
	uint8_t luma_dx[ISP33_SHARP_X_NUM];
	/* PBF_VSIGMA */
	uint16_t pre_bifilt_vsigma_inv[ISP33_SHARP_Y_NUM];
	/* PBF_KERNEL */
	uint8_t pre_bifilt_coeff0;
	uint8_t pre_bifilt_coeff1;
	uint8_t pre_bifilt_coeff2;
	/* DETAIL_KERNEL */
	uint8_t hi_detail_lpf_coeff[ISP33_SHARP_KERNEL_NUM];
	uint8_t mi_detail_lpf_coeff[ISP33_SHARP_KERNEL_NUM];
	/* GAIN */
	uint16_t global_gain;
	uint8_t gain_merge_alpha;
	uint8_t local_gain_scale;
	/* GAIN_ADJ0 */
	uint8_t edge_gain_max_limit;
	uint8_t edge_gain_min_limit;
	uint8_t detail_gain_max_limit;
	uint8_t detail_gain_min_limit;
	/* GAIN_ADJ1 */
	uint8_t hitex_gain_max_limit;
	uint8_t hitex_gain_min_limit;
	/* GAIN_ADJ2 */
	uint8_t edge_gain_slope;
	uint8_t detail_gain_slope;
	uint8_t hitex_gain_slope;
	/* GAIN_ADJ3 */
	uint16_t edge_gain_offset;
	uint16_t detail_gain_offset;
	uint16_t hitex_gain_offset;
	/* GAIN_ADJ4 */
	uint16_t edge_gain_sigma;
	uint16_t detail_gain_sigma;
	/* EDGE0 */
	uint16_t pos_edge_wgt_scale;
	uint16_t neg_edge_wgt_scale;
	/* EDGE1 */
	uint8_t pos_edge_strg;
	uint8_t neg_edge_strg;
	uint8_t overshoot_alpha;
	uint8_t undershoot_alpha;
	/* EDGE_KERNEL */
	uint8_t edge_lpf_coeff[ISP33_SHARP_EDGE_KERNEL_NUM];
	/* EDGE_WGT_VAL */
	uint16_t edge_wgt_val[ISP33_SHARP_EDGE_WGT_NUM];
	/* LUMA_ADJ_STRG */
	uint8_t luma2strg[ISP33_SHARP_LUMA_STRG_NUM];
	/* CENTER */
	uint16_t center_x;
	uint16_t center_y;
	/* OUT_LIMIT */
	uint16_t flat_max_limit;
	uint16_t edge_min_limit;
	/* TEX_X_INV_FIX */
	uint32_t tex_x_inv_fix0;
	uint32_t tex_x_inv_fix1;
	uint32_t tex_x_inv_fix2;
	/* LOCAL_STRG */
	uint16_t tex2detail_strg[ISP33_SHARP_LOCAL_STRG_NUM];
	uint16_t tex2loss_tex_in_hinr_strg[ISP33_SHARP_LOCAL_STRG_NUM];
	/* DETAIL_SCALE_TAB */
	uint8_t contrast2pos_strg[ISP33_SHARP_CONTRAST_STRG_NUM];
	uint8_t contrast2neg_strg[ISP33_SHARP_CONTRAST_STRG_NUM];
	uint8_t pos_detail_strg;
	uint8_t neg_detail_strg;
	/* DETAIL_TEX_CLIP */
	uint16_t tex2detail_pos_clip[ISP33_SHARP_TEX_CLIP_NUM];
	uint16_t tex2detail_neg_clip[ISP33_SHARP_TEX_CLIP_NUM];
	/* GRAIN_TEX_CLIP */
	uint16_t tex2grain_pos_clip[ISP33_SHARP_TEX_CLIP_NUM];
	uint16_t tex2grain_neg_clip[ISP33_SHARP_TEX_CLIP_NUM];
	/* DETAIL_LUMA_CLIP */
	uint16_t luma2detail_pos_clip[ISP33_SHARP_LUM_CLIP_NUM];
	uint16_t luma2detail_neg_clip[ISP33_SHARP_LUM_CLIP_NUM];
	/* GRAIN_STRG */
	uint8_t grain_strg;
	/* HUE_ADJ_TAB */
	uint16_t hue2strg[ISP33_SHARP_HUE_NUM];
	/* DISATANCE_ADJ */
	uint8_t distance2strg[ISP33_SHARP_DISATANCE_NUM];
	/* NOISE_SIGMA */
	uint16_t hi_tex_threshold[ISP33_SHARP_HITEX_NUM];
	/* LOSSTEXINHINR_STRG */
	uint8_t loss_tex_in_hinr_strg;
	/* NOISE_CURVE */
	uint16_t noise_curve_ext[ISP33_SHARP_NOISE_CURVE_NUM];
	uint8_t noise_count_thred_ratio;
	uint8_t noise_clip_scale;
	/* NOISE_CLIP */
	uint16_t noise_clip_min_limit;
	uint16_t noise_clip_max_limit;
} __attribute__ ((packed));

struct isp33_enh_cfg {
	/* CTRL */
	uint8_t bypass;
	uint8_t blf3_bypass;
	/* IIR_FLT */
	uint16_t iir_inv_sigma;
	uint8_t iir_soft_thed;
	uint8_t iir_cur_wgt;
	/* BILAT_FLT3X3 */
	uint16_t blf3_inv_sigma;
	uint16_t blf3_cur_wgt;
	uint8_t blf3_thumb_cur_wgt;
	/* BILAT_FLT5X5 */
	uint8_t blf5_cur_wgt;
	uint16_t blf5_inv_sigma;
	/* GLOBAL_STRG */
	uint16_t global_strg;
	/* LUMA_LUT */
	uint16_t lum2strg[ISP33_ENH_LUMA_NUM];
	/* DETAIL_IDX */
	uint16_t detail2strg_idx[ISP33_ENH_DETAIL_NUM];
	/* DETAIL_POWER */
	uint8_t detail2strg_power0;
	uint8_t detail2strg_power1;
	uint8_t detail2strg_power2;
	uint8_t detail2strg_power3;
	uint8_t detail2strg_power4;
	uint8_t detail2strg_power5;
	uint8_t detail2strg_power6;
	/* DETAIL_VALUE */
	uint16_t detail2strg_val[ISP33_ENH_DETAIL_NUM];
	/* PRE_FRAME */
	uint8_t pre_wet_frame_cnt0;
	uint8_t pre_wet_frame_cnt1;
	/* IIR */
	uint8_t iir_wr;
	uint8_t iir[ISP33_ENH_IIR_ROW_MAX][ISP33_ENH_IIR_COL_MAX];
} __attribute__ ((packed));

struct isp33_hist_cfg {
	/* CTRL */
	uint8_t bypass;
	uint8_t mem_mode;
	/* HF_STAT */
	uint8_t count_scale;
	uint8_t count_offset;
	uint16_t count_min_limit;
	/* BLOCK_SIZE */
	uint16_t blk_het;
	uint16_t blk_wid;
	/* THUMB_SIZE */
	uint8_t thumb_row;
	uint8_t thumb_col;
	/* MAP0 */
	uint16_t merge_alpha;
	uint16_t user_set;
	/* MAP1 */
	uint16_t map_count_scale;
	uint8_t gain_ref_wgt;
	/* IIR */
	uint8_t flt_cur_wgt;
	uint16_t flt_inv_sigma;
	/* POS_ALPHA */
	uint8_t pos_alpha[ISP33_HIST_ALPHA_NUM];
	/* NEG_ALPHA */
	uint8_t neg_alpha[ISP33_HIST_ALPHA_NUM];
	/* STAB */
	uint8_t stab_frame_cnt0;
	uint8_t stab_frame_cnt1;
	/* UV_SCL */
	uint8_t saturate_scale;
	/* HIST_IIR */
	uint16_t iir_wr;
	uint16_t iir[ISP33_HIST_IIR_BLK_MAX][ISP33_HIST_IIR_NUM];
} __attribute__ ((packed));

struct isp33_drc_cfg {
	/* CTRL0 */
	uint8_t bypass_en;
	uint8_t cmps_byp_en;
	uint8_t gainx32_en;
	uint8_t bf_lp_en;
	uint8_t raw_dly_dis;
	/* CTRL1 */
	uint16_t position;
	uint16_t compres_scl;
	uint8_t offset_pow2;
	/* LPRATIO */
	uint16_t lpdetail_ratio;
	uint16_t hpdetail_ratio;
	uint8_t delta_scalein;
	/* BILAT0 */
	uint8_t bilat_wt_off;
	uint16_t thumb_thd_neg;
	uint8_t thumb_thd_enable;
	uint8_t weicur_pix;
	/* BILAT1 */
	uint8_t cmps_offset_bits_int;
	uint8_t cmps_fixbit_mode;
	uint16_t drc_gas_t;
	/* BILAT2 */
	uint16_t thumb_clip;
	uint8_t thumb_scale;
	/* BILAT3 */
	uint16_t range_sgm_inv0;
	uint16_t range_sgm_inv1;
	/* BILAT4 */
	uint8_t weig_bilat;
	uint8_t weight_8x8thumb;
	uint8_t enable_soft_thd;
	uint16_t bilat_soft_thd;
	/* GAIN_Y */
	uint16_t gain_y[ISP33_DRC_Y_NUM];
	/* COMPRES_Y */
	uint16_t compres_y[ISP33_DRC_Y_NUM];
	/* SCALE_Y */
	uint16_t scale_y[ISP33_DRC_Y_NUM];
	/* IIRWG_GAIN */
	uint16_t min_ogain;
	/* SFTHD_Y */
	uint16_t sfthd_y[ISP33_DRC_Y_NUM];
} __attribute__ ((packed));

struct isp33_rawawb_meas_cfg {
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
	uint8_t ovexp_2ddr_dis;
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
	/* CCM_COEFF0_R */
	uint16_t ccm_coeff0_r;
	uint16_t ccm_coeff1_r;
	/* CCM_COEFF1_R */
	uint16_t ccm_coeff2_r;
	/* CCM_COEFF0_G */
	uint16_t ccm_coeff0_g;
	uint16_t ccm_coeff1_g;
	/* CCM_COEFF1_G */
	uint16_t ccm_coeff2_g;
	/* CCM_COEFF0_B */
	uint16_t ccm_coeff0_b;
	uint16_t ccm_coeff1_b;
	/* CCM_COEFF1_B */
	uint16_t ccm_coeff2_b;
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
	uint8_t wp_blk_wei_w[ISP33_RAWAWB_WEIGHT_NUM];

	struct isp2x_bls_fixed_val bls2_val;
} __attribute__ ((packed));

struct isp33_isp_other_cfg {
	struct isp32_bls_cfg bls_cfg;
	struct isp39_dpcc_cfg dpcc_cfg;
	struct isp3x_lsc_cfg lsc_cfg;
	struct isp32_awb_gain_cfg awb_gain_cfg;
	struct isp33_gic_cfg gic_cfg;
	struct isp33_debayer_cfg debayer_cfg;
	struct isp33_ccm_cfg ccm_cfg;
	struct isp3x_gammaout_cfg gammaout_cfg;
	struct isp2x_cproc_cfg cproc_cfg;
	struct isp33_drc_cfg drc_cfg;
	struct isp32_hdrmge_cfg hdrmge_cfg;
	struct isp33_enh_cfg enh_cfg;
	struct isp33_hist_cfg hist_cfg;
	struct isp33_hsv_cfg hsv_cfg;
	struct isp32_ldch_cfg ldch_cfg;
	struct isp33_bay3d_cfg bay3d_cfg;
	struct isp33_ynr_cfg ynr_cfg;
	struct isp33_cnr_cfg cnr_cfg;
	struct isp33_sharp_cfg sharp_cfg;
	struct isp33_cac_cfg cac_cfg;
	struct isp3x_gain_cfg gain_cfg;
	struct isp21_csm_cfg csm_cfg;
	struct isp21_cgc_cfg cgc_cfg;
} __attribute__ ((packed));

struct isp33_isp_meas_cfg {
	struct isp33_rawawb_meas_cfg rawawb;
	struct isp2x_rawaebig_meas_cfg rawae0;
	struct isp2x_rawaebig_meas_cfg rawae3;
	struct isp2x_rawhistbig_cfg rawhist0;
	struct isp2x_rawhistbig_cfg rawhist3;
} __attribute__ ((packed));

struct isp33_isp_params_cfg {
	uint64_t module_en_update;
	uint64_t module_ens;
	uint64_t module_cfg_update;

	uint32_t frame_id;
	struct isp33_isp_meas_cfg meas;
	struct isp33_isp_other_cfg others;
} __attribute__ ((packed));

struct isp33_sharp_stat {
	uint16_t noise_curve[ISP33_SHARP_NOISE_CURVE_NUM];
} __attribute__ ((packed));

struct isp33_bay3d_stat {
	uint32_t sigma_num;
	uint16_t sigma_y[ISP33_BAY3D_TNRSIG_NUM];
} __attribute__ ((packed));

struct isp33_enh_stat {
	uint8_t iir[ISP33_ENH_IIR_ROW_MAX][ISP33_ENH_IIR_COL_MAX];
} __attribute__ ((packed));

struct isp33_hist_stat {
	uint16_t iir[ISP33_HIST_IIR_BLK_MAX][ISP33_HIST_IIR_NUM];
} __attribute__ ((packed));

struct isp33_rawae_mean_lum {
	uint32_t g:12;
	uint32_t b:10;
	uint32_t r:10;
} __attribute__ ((packed));

struct isp33_rawae_mean_line {
	/* line: 15 word + one unuse */
	struct isp33_rawae_mean_lum blk_x[ISP33_MEAN_BLK_X_NUM];
	uint32_t reserved;
} __attribute__ ((packed));

struct isp33_rawae_stat {
	struct isp33_rawae_mean_line blk_y[ISP33_MEAN_BLK_Y_NUM];
	uint32_t wnd1_sumg;
	uint32_t wnd1_sumb;
	uint32_t wnd1_sumr;
	uint32_t reserved0;
	uint32_t wnd2_sumg;
	uint32_t wnd2_sumb;
	uint32_t wnd2_sumr;
	uint32_t reserved1;
} __attribute__ ((packed));

struct isp33_rawhist_stat {
	uint32_t bin[ISP33_HIST_BIN_N_MAX];
} __attribute__ ((packed));

struct isp33_rawawb_mean_ramdata {
	uint64_t b:18;
	uint64_t g:18;
	uint64_t r:18;
	uint64_t wp:10;
} __attribute__ ((packed));

struct isp33_rawawb_mean_ramdata_line {
	struct isp33_rawawb_mean_ramdata ramdata_blk_x[ISP33_MEAN_BLK_X_NUM];
	uint32_t reserved[2];
} __attribute__ ((packed));

struct isp33_rawawb_mean_sum {
	uint32_t rgain_nor;
	uint32_t bgain_nor;
	uint32_t wp_num_nor;
	uint32_t wp_num2;

	uint32_t rgain_big;
	uint32_t bgain_big;
	uint32_t wp_num_big;
	uint32_t reserved;
} __attribute__ ((packed));

struct isp33_rawawb_mean_sum_exc {
	uint32_t rgain_exc;
	uint32_t bgain_exc;
	uint32_t wp_num_exc;
	uint32_t reserved;
} __attribute__ ((packed));

struct isp33_rawawb_stat {
	struct isp33_rawawb_mean_ramdata_line ramdata_blk_y[ISP33_MEAN_BLK_Y_NUM];
	struct isp33_rawawb_mean_sum sum[ISP33_RAWAWB_SUM_NUM];
	uint16_t yhist[ISP33_RAWAWB_HSTBIN_NUM];
	struct isp33_rawawb_mean_sum_exc sum_exc[ISP33_RAWAWB_EXCL_STAT_NUM];
} __attribute__ ((packed));

struct isp33_stat {
	/* mean to ddr */
	struct isp33_rawae_stat rawae3;
	struct isp33_rawhist_stat rawhist3;
	struct isp33_rawae_stat rawae0;
	struct isp33_rawhist_stat rawhist0;
	struct isp33_rawawb_stat rawawb;
	/* ahb read reg */
	struct isp33_bay3d_stat bay3d;
	struct isp33_sharp_stat sharp;
	struct isp33_enh_stat enh;
	struct isp33_hist_stat hist;
	struct isp32_info2ddr_stat info2ddr;
} __attribute__ ((packed));

struct rkisp33_stat_buffer {
	struct isp33_stat stat;
	uint32_t meas_type;
	uint32_t frame_id;
	uint32_t params_id;
} __attribute__ ((packed));
#endif /* _UAPI_RK_ISP33_CONFIG_H */
