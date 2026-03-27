/****************************************************************************
 *
 *    Copyright (c) 2024 by Rockchip Corp.  All rights reserved.
 *
 *    The material in this file is confidential and contains trade secrets
 *    of Rockchip Corporation. This is proprietary information owned by
 *    Rockchip Corporation. No part of this work may be disclosed,
 *    reproduced, copied, transmitted, or used in any way for any purpose,
 *    without the express written permission of Rockchip Corporation.
 *
 *****************************************************************************/
#ifndef _AUTO_MEDIA_H_
#define _AUTO_MEDIA_H_

#include <stdint.h>

#include "common.h"

#include "rk_debug.h"
#include "rk_defines.h"
#include "rk_mpi_adec.h"
#include "rk_mpi_aenc.h"
#include "rk_mpi_ai.h"
#include "rk_mpi_ao.h"
#include "rk_mpi_avs.h"
#include "rk_mpi_cal.h"
#include "rk_mpi_ivs.h"
#include "rk_mpi_mb.h"
#include "rk_mpi_rgn.h"
#include "rk_mpi_sys.h"
#include "rk_mpi_tde.h"
#include "rk_mpi_vdec.h"
#include "rk_mpi_venc.h"
#include "rk_mpi_vi.h"
#include "rk_mpi_vo.h"
#include "rk_mpi_vpss.h"

#ifdef __cplusplus
extern "C" {
#endif

int32_t vi_chn_init(uint32_t dev_id, uint32_t chn_id);
void    vi_chn_deinit(uint32_t dev_id, uint32_t chn_id);

int32_t rgn_create_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn, RECT_S *region);
int32_t rgn_destroy_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn);
int32_t rgn_draw_rect_from_cvr(RGN_HANDLE rgn_handle, RECT_S *region, RockAutoCvrDetResult *result);
int32_t rgn_attach_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn, RECT_S *region);
int32_t rgn_detach_chn(RGN_HANDLE rgn_handle, const MPP_CHN_S *mpp_chn);

#ifdef __cplusplus
}  /* end of extern "C" */
#endif

#endif