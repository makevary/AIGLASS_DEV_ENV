#ifndef __RKAIQ_CALIB_H__
#define __RKAIQ_CALIB_H__

#include "RkAiqCalibDbTypesV2.h"
#include "RkAiqCalibDbV2Helper.h"
#include "fast_ae.h"

// full iq bin
CamCalibDbProj_t *rkaiq_calib_load(void *offset, size_t len);
int rkaiq_calib_write(CamCalibDbProj_t *calibproj, CamCalibDbV2Context_t *def_calib, int app_flip, int app_fps);
int rkaiq_get_calib(CamCalibDbProj_t *calibproj, CamCalibDbV2Context_t *def_calib, int mode, char *sub_scene);

// rtt iq bin
int rkaiq_check_bin(void *iq_offset, rk_aiq_iq_bin_mode_t *iq_bin_mode);
int rkaiq_get_rttbin(void *iq_offset, CamCalibDbV2Context_t *def_calib, int mode, char *sub_scene);

// aov iq bin
int restoreBinStructMap(uint8_t *data, size_t len, uintptr_t restore_ptr);
void bin2calib(void *bin_buff, CamCalibDbV2Context_t *def_calib);

#endif /*__RKAIQ_CALIB_H__*/
