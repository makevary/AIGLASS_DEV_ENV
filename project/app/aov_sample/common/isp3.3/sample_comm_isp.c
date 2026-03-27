// Copyright 2020 Fuzhou Rockchip Electronics Co., Ltd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif /* End of #ifdef __cplusplus */

#include <assert.h>
#include <fcntl.h>
#include <pthread.h>
#include <signal.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h>
#include <unistd.h>
#include <stdatomic.h>
#include <sys/mman.h>
#include "sample_comm.h"
#include "sample_comm_isp.h"
#include "sample_comm_aov.h"
#include "rk_gpio.h"
#include "rk_pwm.h"
#include "rk_smart_ir_api.h"
#if defined(AOV_FASTBOOT_ENABLE)
#include "rk_meta.h"
#include "rk_meta_app_param.h"
#include "sensor_init_info.h"
#include "sensor_iq_info.h"
#endif

#define FULL_COLOR_MODE 0
#define GRAY_COLOR_MODE 1

#define ROCKIT_LIGHT_CTL

struct smart_ir_ctx {
	int ircut_on_gpio;
	int ircut_off_gpio;
	int irled_enable_gpio;
	int irled_pwm_channel;
	int visled_enable_gpio;
	int visled_pwm_channel;
	int night_mode;
	float cur_irled_value;
	bool thread_is_quit;
	pthread_t thread_id;
	rk_smart_ir_ctx_t *ir_ctx;
	rk_aiq_sys_ctx_t *aiq_ctx;
	rk_smart_ir_result_t result;
	RK_SMART_IR_STATUS_t last_status;
};

#define MAX_AIQ_CTX 8
static rk_aiq_sys_ctx_t *g_aiq_ctx[MAX_AIQ_CTX];
static rk_aiq_camgroup_ctx_t *g_aiq_camgroup_ctx[MAX_AIQ_CTX];
RK_S32 g_devBufCnt[MAX_AIQ_CTX] = {0};
rk_aiq_working_mode_t g_WDRMode[MAX_AIQ_CTX];
struct smart_ir_ctx g_smartIr_ctx;
static enum rkmodule_sync_mode g_sensor_sync_mode[MAX_AIQ_CTX] = {0};

typedef enum rk_HDR_MODE_E {
	HDR_MODE_OFF,
	HDR_MODE_HDR2,
	HDR_MODE_HDR3,
} HDR_MODE_E;

static atomic_int g_sof_cnt = 0;
static atomic_bool g_should_quit = false;

static XCamReturn SAMPLE_COMM_ISP_SofCb(rk_aiq_metas_t *meta) {
	g_sof_cnt++;
	if (g_sof_cnt <= 2)
		printf("=== %u ===\n", meta->frame_id);
	return XCAM_RETURN_NO_ERROR;
}

RK_S32 SAMPLE_COMM_ISP_GetSofCnt(void) { return g_sof_cnt; }

static XCamReturn SAMPLE_COMM_ISP_ErrCb(rk_aiq_err_msg_t *msg) {
	if (msg->err_code == XCAM_RETURN_BYPASS)
		g_should_quit = true;
	return XCAM_RETURN_NO_ERROR;
}

RK_BOOL SAMPLE_COMM_ISP_ShouldQuit() { return g_should_quit; }

RK_S32 SAMPLE_COMM_PreInit_devBufCnt(RK_S32 CamId, RK_S32 Bufcnt) {
	if (Bufcnt < 0) {
		printf("Invlaid ISP read Buffer, please check!\n");
		return RK_FAILURE;
	}
	g_devBufCnt[CamId] = Bufcnt;
	return 0;
}

RK_S32 SAMPLE_COMM_ISP_Init(RK_S32 CamId, rk_aiq_working_mode_t WDRMode, RK_BOOL MultiCam,
                            const char *iq_file_dir) {
	int ret = 0;
	if (CamId >= MAX_AIQ_CTX) {
		printf("%s : CamId is over 3\n", __FUNCTION__);
		return -1;
	}
	// char *iq_file_dir = "iqfiles/";
	setlinebuf(stdout);

	// must set HDR_MODE, before init
	g_WDRMode[CamId] = WDRMode;
	char hdr_str[16];
	snprintf(hdr_str, sizeof(hdr_str), "%d", (int)WDRMode);
	setenv("HDR_MODE", hdr_str, 1);

	rk_aiq_sys_ctx_t *aiq_ctx;
	rk_aiq_static_info_t aiq_static_info;
	rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId(CamId, &aiq_static_info);

	SAMPLE_COMM_AOV_PreInitIsp(aiq_static_info.sensor_info.sensor_name, iq_file_dir,
	                           CamId);
	printf("ID: %d, sensor_name is %s, iqfiles is %s\n", CamId,
	       aiq_static_info.sensor_info.sensor_name, iq_file_dir);
	if (WDRMode == RK_AIQ_WORKING_MODE_NORMAL)
		ret = rk_aiq_uapi2_sysctl_preInit_scene(aiq_static_info.sensor_info.sensor_name,
		                                        "normal", "day");
	else
		ret = rk_aiq_uapi2_sysctl_preInit_scene(aiq_static_info.sensor_info.sensor_name,
		                                        "hdr", "day");
	if (ret != 0)
		printf("%s: failed to set scene\n", aiq_static_info.sensor_info.sensor_name);

	if (g_devBufCnt[CamId] > 0) {
		ret = rk_aiq_uapi2_sysctl_preInit_devBufCnt(
		    aiq_static_info.sensor_info.sensor_name, "rkraw_rx", g_devBufCnt[CamId]);
		if (ret != 0)
			printf("%s: failed to set cif buf cnt\n",
			       aiq_static_info.sensor_info.sensor_name);
	}

	aiq_ctx =
	    rk_aiq_uapi2_sysctl_init(aiq_static_info.sensor_info.sensor_name, iq_file_dir,
	                             SAMPLE_COMM_ISP_ErrCb, SAMPLE_COMM_ISP_SofCb);
	if (aiq_ctx == NULL) {
		printf("%s: failed to init aiq\n", aiq_static_info.sensor_info.sensor_name);
		return -1;
	}

	g_aiq_ctx[CamId] = aiq_ctx;
	// fastboot :mirror/flip/fps
	int rk_cam_mirror_flip = -1;
	int rk_cam_fps = -1;
	if (CamId == 0) {
		rk_cam_fps = SAMPLE_COMM_ExtractValueFromCmdline("rk_cam_fps");
		rk_cam_mirror_flip = SAMPLE_COMM_ExtractValueFromCmdline("rk_cam_mirror_flip");
	} else if (CamId == 1) {
		rk_cam_fps = SAMPLE_COMM_ExtractValueFromCmdline("rk_cam2_fps");
		rk_cam_mirror_flip = SAMPLE_COMM_ExtractValueFromCmdline("rk_cam2_mirror_flip");
	}
	if (rk_cam_fps != -1) {
		SAMPLE_COMM_ISP_SetFrameRate(CamId, rk_cam_fps);
	}
	if (rk_cam_mirror_flip != -1) {
		SAMPLE_COMM_ISP_SetMirrorFlip(CamId, rk_cam_mirror_flip);
	}
	g_sensor_sync_mode[CamId] = NO_SYNC_MODE;
	return 0;
}

static int isp_get_ldch_mesh_size(uint16_t *meshdata) {
	int file_size = 0;
	if (!meshdata) {
		printf("meshdata is null \n");
		return -1;
	}
	unsigned short hpic, vpic, hsize, vsize, hstep, vstep = 0;
	hpic = (unsigned short)meshdata[0];
	vpic = (unsigned short)meshdata[1];
	hsize = (unsigned short)meshdata[2];
	vsize = (unsigned short)meshdata[3];
	hstep = (unsigned short)meshdata[4];
	vstep = (unsigned short)meshdata[5];
	printf("----------lut info: [%d-%d-%d-%d-%d-%d]\n", hpic, vpic, hsize, vsize, hstep,
	       vstep);
	file_size = hsize * vsize * sizeof(unsigned short) + 12;

	return file_size;
}

XCamReturn SAMPLE_COMM_ISP_CamGroup_setMeshToLdch(int CamGrpId, uint8_t SetLdchMode,
                                                  uint16_t **LdchMesh) {
	XCamReturn ret = XCAM_RETURN_NO_ERROR;
	rk_aiq_sys_ctx_t *aiq_ctx = NULL;
	rk_aiq_camgroup_camInfos_t camInfos;
	ldc_param_t ldchAttr;
	memset(&camInfos, 0, sizeof(camInfos));
	if (SetLdchMode != RK_GET_LDCH_BY_FILE && SetLdchMode != RK_GET_LDCH_BY_BUFF) {
		printf("this Ldch mode:%d, if want to set ldch, 1: read file set ldch, 2: read "
		       "buff set ldch\n",
		       SetLdchMode);
		return -1;
	}
	if (rk_aiq_uapi2_camgroup_getCamInfos(g_aiq_camgroup_ctx[CamGrpId], &camInfos) ==
	    XCAM_RETURN_NO_ERROR) {
		for (int i = 0; i < camInfos.valid_sns_num; i++) {
			aiq_ctx = rk_aiq_uapi2_camgroup_getAiqCtxBySnsNm(g_aiq_camgroup_ctx[CamGrpId],
			                                                 camInfos.sns_ent_nm[i]);
			if (!aiq_ctx) {
				printf("rk_aiq_uapi2_camgroup_getAiqCtxBySnsNm return aiq_ctx is Null\n");
				return -1;
			}
			printf("aiq_ctx sns name: %s, camPhyId %d\n", camInfos.sns_ent_nm[i],
			       camInfos.sns_camPhyId[i]);
			memset(&ldchAttr, 0, sizeof(ldc_param_t));

			ret = rk_aiq_user_api2_ldc_GetManualAttrib(aiq_ctx, &ldchAttr);
			if (ret == XCAM_RETURN_NO_ERROR) {
				if (SetLdchMode == RK_GET_LDCH_BY_BUFF) {
					ldchAttr.sta.ldchCfg.en = true;
					ldchAttr.sta.ldchCfg.lutMapCfg.sw_ldcT_lutMapBuf_vaddr[0] =
					    LdchMesh[i];
					ldchAttr.sta.ldchCfg.lutMapCfg.sw_ldcT_lutMap_size =
					    isp_get_ldch_mesh_size(LdchMesh[i]);
				} else {
					printf("no support\n");
				}
				ret = rk_aiq_user_api2_ldc_SetManualAttrib(aiq_ctx, &ldchAttr);
				if (ret != XCAM_RETURN_NO_ERROR) {
					printf("Failed to set ldch attrib : %d\n", ret);
					return ret;
				}
			}
		}
	}
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_CamGroup_Init(RK_S32 CamGroupId, rk_aiq_working_mode_t WDRMode,
                                     bool MultiCam, int OpenLdch, void *LdchMesh[],
                                     rk_aiq_camgroup_instance_cfg_t *pCamGroupCfg) {
	int i, ret;
	char sensor_name_array[MAX_AIQ_CTX][128];
	rk_aiq_static_info_t aiq_static_info;

	if (CamGroupId >= MAX_AIQ_CTX) {
		printf("%s : CamId is over %d\n", __FUNCTION__, MAX_AIQ_CTX);
		return -1;
	}

	for (i = 0; i < pCamGroupCfg->sns_num; i++) {
		ret = rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId(i, &aiq_static_info);
		if (ret != 0) {
			printf("rk_aiq_uapi2_sysctl_enumStaticMetasByPhyId failure \n");
			return -1;
		}

		printf("CamGroupId:%d, cam_id: %d, sensor_name is %s, iqfiles is %s\n",
		       CamGroupId, i, aiq_static_info.sensor_info.sensor_name,
		       pCamGroupCfg->config_file_dir);
		memcpy(sensor_name_array[i], aiq_static_info.sensor_info.sensor_name,
		       strlen(aiq_static_info.sensor_info.sensor_name) + 1);
		pCamGroupCfg->sns_ent_nm_array[i] = sensor_name_array[i];
		printf("pCamGroupCfg->sns_ent_nm_array[%d] is %s\n", i,
		       pCamGroupCfg->sns_ent_nm_array[i]);
		if (WDRMode == RK_AIQ_WORKING_MODE_NORMAL)
			ret = rk_aiq_uapi2_sysctl_preInit_scene(
			    aiq_static_info.sensor_info.sensor_name, "normal", "day");
		else
			ret = rk_aiq_uapi2_sysctl_preInit_scene(
			    aiq_static_info.sensor_info.sensor_name, "hdr", "day");
		if (ret != 0)
			printf("%s: failed to set scene\n", aiq_static_info.sensor_info.sensor_name);
		if (g_devBufCnt[i] > 0) {
			ret = rk_aiq_uapi2_sysctl_preInit_devBufCnt(
			    aiq_static_info.sensor_info.sensor_name, "rkraw_rx", g_devBufCnt[i]);
			if (ret != 0) {
				printf("rk_aiq_uapi2_sysctl_preInit_devBufCnt failure\n");
				return -1;
			}
		}
	}

	g_aiq_camgroup_ctx[CamGroupId] = rk_aiq_uapi2_camgroup_create(pCamGroupCfg);
	if (!g_aiq_camgroup_ctx[CamGroupId]) {
		printf("create camgroup ctx error!\n");
		return -1;
	}
	/* set LDCH must before <camgroup prepare>*/
	if (OpenLdch) {
		SAMPLE_COMM_ISP_CamGroup_setMeshToLdch(CamGroupId, OpenLdch,
		                                       (uint16_t **)LdchMesh);
	}

	ret = rk_aiq_uapi2_camgroup_prepare(g_aiq_camgroup_ctx[CamGroupId], WDRMode);

	ret |= rk_aiq_uapi2_camgroup_start(g_aiq_camgroup_ctx[CamGroupId]);
	if (ret != 0) {
		printf("rk_aiq_uapi2_camgroup_prepare / start failure \n");
		return -1;
	}
	printf("rk_aiq_uapi2_camgroup_start over\n");

	return ret;
}

RK_S32 SAMPLE_COMM_ISP_Stop(RK_S32 CamId) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init g_aiq_ctx[%d] = %p\n", __FUNCTION__,
		       CamId, g_aiq_ctx[CamId]);
		return -1;
	}
	printf("rk_aiq_uapi2_sysctl_stop enter\n");
	rk_aiq_uapi2_sysctl_stop(g_aiq_ctx[CamId], false);
	printf("rk_aiq_uapi2_sysctl_deinit enter\n");
	rk_aiq_uapi2_sysctl_deinit(g_aiq_ctx[CamId]);
	printf("rk_aiq_uapi2_sysctl_deinit exit\n");
	g_aiq_ctx[CamId] = NULL;
	return 0;
}

RK_S32 SAMPLE_COMM_ISP_Pause(RK_S32 CamId) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init g_aiq_ctx[%d] = %p\n", __FUNCTION__,
		       CamId, g_aiq_ctx[CamId]);
		return -1;
	}
	printf("rk_aiq_uapi2_sysctl_stop enter\n");
	rk_aiq_uapi2_sysctl_stop(g_aiq_ctx[CamId], false);
	printf("rk_aiq_uapi2_sysctl_stop exit\n");
	return 0;
}

RK_S32 SAMPLE_COMM_ISP_CamGroup_Stop(RK_S32 CamGroupId) {
	if (CamGroupId >= MAX_AIQ_CTX || !g_aiq_camgroup_ctx[CamGroupId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	printf("rk_aiq_uapi2_camgroup_stop enter\n");
	rk_aiq_uapi2_camgroup_stop(g_aiq_camgroup_ctx[CamGroupId]);
	printf("rk_aiq_uapi2_camgroup_destroy enter\n");
	rk_aiq_uapi2_camgroup_destroy(g_aiq_camgroup_ctx[CamGroupId]);
	printf("rk_aiq_uapi2_camgroup_destroy exit\n");
	g_aiq_camgroup_ctx[CamGroupId] = NULL;

	return 0;
}

RK_S32 SAMPLE_COMM_ISP_SetSyncMode(int cam_id, enum rkmodule_sync_mode sync_mode) {
	if (cam_id >= MAX_AIQ_CTX || !g_aiq_ctx[cam_id]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	g_sensor_sync_mode[cam_id] = sync_mode;
	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_ISP_Run(RK_S32 CamId) {
	int ret = 0;
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	if (rk_aiq_uapi2_sysctl_prepare(g_aiq_ctx[CamId], 0, 0, g_WDRMode[CamId])) {
		printf("rkaiq engine prepare failed !\n");
		g_aiq_ctx[CamId] = NULL;
		return -1;
	}
	if (g_sensor_sync_mode[CamId] != NO_SYNC_MODE) {
		ret = rk_aiq_uapi2_sysctl_setSnsSyncMode(g_aiq_ctx[CamId], SOFT_SYNC_MODE);
		if (ret != 0)
			printf("rkaiq set sensor %d sync mode %d failed !\n", CamId,
			       g_sensor_sync_mode[CamId]);
		else
			printf("rkaiq set sensor %d sync mode %d success\n", CamId,
			       g_sensor_sync_mode[CamId]);
	}
	printf("rk_aiq_uapi2_sysctl_init/prepare succeed\n");
	if (rk_aiq_uapi2_sysctl_start(g_aiq_ctx[CamId])) {
		printf("rk_aiq_uapi2_sysctl_start  failed\n");
		return -1;
	}
	printf("rk_aiq_uapi2_sysctl_start succeed\n");
	return 0;
}

RK_S32 SAMPLE_COMM_ISP_SetFrameRate(RK_S32 CamId, RK_U32 uFps) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	int ret;
	ae_api_expSwAttr_t expSwAttr;
	ret = rk_aiq_user_api2_ae_getExpSwAttr(g_aiq_ctx[CamId], &expSwAttr);
	if (ret != 0)
		printf("%s : Cam %d get framerate failed %#X!\n", __func__, CamId, ret);
	expSwAttr.commCtrl.frmRate.sw_aeT_frmRate_mode = ae_frmRate_fix_mode;
	expSwAttr.commCtrl.frmRate.sw_aeT_frmRate_val = uFps;
	ret = rk_aiq_user_api2_ae_setExpSwAttr(g_aiq_ctx[CamId], expSwAttr);
	if (ret != 0)
		printf("%s : Cam %d set framerate %d failed %#X!\n", __func__, CamId, uFps, ret);
	else
		printf("%s : Cam %d set framerate %d success\n", __func__, CamId, uFps);
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_GetFrameRate(RK_S32 CamId) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	int ret;
	ae_api_expSwAttr_t expSwAttr;
	ret = rk_aiq_user_api2_ae_getExpSwAttr(g_aiq_ctx[CamId], &expSwAttr);
	return expSwAttr.commCtrl.frmRate.sw_aeT_frmRate_val;
}

RK_S32 SAMPLE_COMM_ISP_CamGroup_SetFrameRate(RK_S32 CamId, RK_U32 uFps) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_camgroup_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	int ret;
	ae_api_expSwAttr_t expSwAttr;
	ret = rk_aiq_user_api2_ae_getExpSwAttr((rk_aiq_sys_ctx_t *)g_aiq_camgroup_ctx[CamId],
	                                       &expSwAttr);
	expSwAttr.commCtrl.frmRate.sw_aeT_frmRate_mode = ae_frmRate_fix_mode;
	expSwAttr.commCtrl.frmRate.sw_aeT_frmRate_val = uFps;
	ret = rk_aiq_user_api2_ae_setExpSwAttr((rk_aiq_sys_ctx_t *)g_aiq_camgroup_ctx[CamId],
	                                       expSwAttr);
	if (ret != 0)
		printf("%s : Cam Group %d set framerate %d failed %#X!\n", __func__, CamId, uFps,
		       ret);
	else
		printf("%s : Cam Group %d set framerate %d success\n", __func__, CamId, uFps);
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_SetMirrorFlip(int CamId, RK_U32 u32Value) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	int mirror = 0;
	int flip = 0;
	switch (u32Value) {
	case 0:
		mirror = 0;
		flip = 0;
		break;
	case 1:
		mirror = 1;
		flip = 0;
		break;
	case 2:
		mirror = 0;
		flip = 1;
		break;
	case 3:
		mirror = 1;
		flip = 1;
		break;
	default:
		mirror = 0;
		flip = 0;
		break;
	}
	return rk_aiq_uapi2_setMirrorFlip(g_aiq_ctx[CamId], mirror, flip, 4); // skip 4 frame
}

RK_S32 SAMPLE_comm_ISP_SWITCH_SCENE(int CamId, const char *main_scene,
                                    const char *sub_scene) {
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over 3 or not init\n", __FUNCTION__);
		return -1;
	}
	return rk_aiq_uapi2_sysctl_switch_scene(g_aiq_ctx[CamId], main_scene, sub_scene);
}

XCamReturn SAMPLE_COMM_ISP_SetLDCH(RK_U32 CamId, RK_U32 u32Level, RK_BOOL bIfEnable) {
	RK_S32 s32Ret = RK_FAILURE;
	int sw_ldchT_correct_strg;
	if (CamId >= MAX_AIQ_CTX || !g_aiq_ctx[CamId]) {
		printf("%s : CamId is over %d or not init\n", __FUNCTION__, MAX_AIQ_CTX);
		return RK_FAILURE;
	}
	u32Level = u32Level < 0 ? 0 : u32Level;
	sw_ldchT_correct_strg = (int)(u32Level * 2.53 + 2); // [0, 100] -> [2 , 255]
	s32Ret = rk_aiq_uapi2_setLdchCorrectLevel(g_aiq_ctx[CamId], sw_ldchT_correct_strg);
	if (s32Ret != XCAM_RETURN_NO_ERROR && s32Ret != XCAM_RETURN_BYPASS) {
		RK_LOGE("rk_aiq_uapi2_setLdchCorrectLevel FAILURE:%X", s32Ret);
		return s32Ret;
	}

	return XCAM_RETURN_NO_ERROR;
}

RK_S32 SAMPLE_COMM_ISP_CamGroup_SetLDCH(RK_U32 CamId, RK_U32 u32Level,
                                        RK_BOOL bIfEnable) {
	RK_S32 s32Ret = RK_FAILURE;
	int sw_ldchT_correct_strg;
	if (CamId >= MAX_AIQ_CTX || !g_aiq_camgroup_ctx[CamId]) {
		printf("%s : CamId is over %d or not init\n", __FUNCTION__, MAX_AIQ_CTX);
		return RK_FAILURE;
	}
	u32Level = u32Level < 0 ? 0 : u32Level;
	sw_ldchT_correct_strg = (int)(u32Level * 2.53 + 2); // [0, 100] -> [2 , 255]
	s32Ret = rk_aiq_uapi2_setLdchCorrectLevel(
	    (rk_aiq_sys_ctx_t *)g_aiq_camgroup_ctx[CamId], sw_ldchT_correct_strg);
	if (s32Ret != XCAM_RETURN_NO_ERROR && s32Ret != XCAM_RETURN_BYPASS) {
		RK_LOGE("rk_aiq_uapi2_setLdchCorrectLevel FAILURE:%X", s32Ret);
		return s32Ret;
	}

	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_ISP_GetAINrParams(RK_S32 CamId, rk_ainr_param *param) {
	RK_S32 ret = RK_SUCCESS;
	ret = rk_aiq_uapi2_sysctl_getAinrParams(g_aiq_ctx[CamId], param);
	if (ret != RK_SUCCESS) {
		printf("rk_aiq_uapi2_sysctl_getAinrParams failure %#X\n", ret);
		return ret;
	}
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_EnablsAiisp(RK_S32 CamId) {
	RK_S32 ret = RK_SUCCESS;
	ret = rk_aiq_uapi2_sysctl_initAiisp(g_aiq_ctx[CamId], NULL, NULL);
	if (ret != RK_SUCCESS) {
		printf("rk_aiq_uapi2_sysctl_initAiisp failure %#X\n", ret);
		return ret;
	}
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_SingleFrame(int cam_id) {
	int ret;
	rk_aiq_uapi2_sysctl_pause(g_aiq_ctx[cam_id], true);
	printf("cam %d rk_aiq_uapi2_sysctl_pause ret = %d\n", cam_id, ret);
	SAMPLE_COMM_DumpDebugInfoToTmp();
	return ret;
}

RK_S32 SAMPLE_COMM_ISP_MultiFrame(int cam_id) {
	int ret;
	rk_aiq_uapi2_sysctl_resume(g_aiq_ctx[cam_id]);
	printf("cam %d rk_aiq_uapi2_sysctl_resume ret = %d\n", cam_id, ret);
	return ret;
}

RK_BOOL SAMPLE_COMM_ISP_IsExpBigChange(int cam_id) {
	if (cam_id >= MAX_AIQ_CTX || !g_aiq_ctx[cam_id]) {
		printf("%s : CamId is over %d or not init\n", __FUNCTION__, MAX_AIQ_CTX);
		return RK_FALSE;
	}
	ae_api_queryInfo_t expInfo;
	ae_api_linExpAttr_t linExpAttr;
	memset(&expInfo, 0, sizeof(ae_api_queryInfo_t));
	memset(&linExpAttr, 0, sizeof(ae_api_linExpAttr_t));
	rk_aiq_user_api2_ae_queryExpResInfo(g_aiq_ctx[cam_id], &expInfo);
	rk_aiq_user_api2_ae_getLinExpAttr(g_aiq_ctx[cam_id], &linExpAttr);
	if (fabs(expInfo.linExpInfo.devLuma) * 100 > linExpAttr.sw_aeT_tolerance_out * 4) {
		ae_api_queryInfo_t *info;
		info = &expInfo;
		printf("Cur Exp Info :\n");
		printf("ToleranceOut %f devLuma %f\n", linExpAttr.sw_aeT_tolerance_out,
		       fabs(expInfo.linExpInfo.devLuma) * 100);
		printf("IsConverged: %d\n", info->isConverged);
		printf("EnvChange: %d\n", info->envChange);
		printf("IsExpMax: %d\n", info->isExpMax);
		printf("LinePeriodsPerField: %f\n", info->vts);
		printf("PixelPeriodsPerLine: %f\n", info->hts);
		printf("PixelClockFreqMHZ: %f\n", info->pclk);
		printf("GlobalEnvLv: %f\n", info->gblEnvLv);
		printf("OverExpROIPdf: %f\n", info->oeROIPdf);
		printf("HighLightROIPdf: %f\n", info->hiLitROIPdf);
		printf("LowLightROIPdf: %f\n", info->loLitROIPdf);
		printf("Fps: %f\n", info->fps);
		return RK_TRUE;
	}
	return RK_FALSE;
}
RK_BOOL SAMPLE_COMM_ISP_IsExpConverge(int cam_id) {
	if (cam_id >= MAX_AIQ_CTX || !g_aiq_ctx[cam_id]) {
		printf("%s : CamId is over %d or not init\n", __FUNCTION__, MAX_AIQ_CTX);
		return RK_TRUE;
	}
	ae_api_queryInfo_t expInfo;
	memset(&expInfo, 0, sizeof(ae_api_queryInfo_t));
	rk_aiq_user_api2_ae_queryExpResInfo(g_aiq_ctx[cam_id], &expInfo);
	if (expInfo.isConverged) {
		return RK_TRUE;
	}
	return RK_FALSE;
}

RK_S32 SAMPLE_COMM_ISP_SetMaxExpTime(int cam_id, RK_U32 max_exp_time_ms) {
	if (cam_id >= MAX_AIQ_CTX || !g_aiq_ctx[cam_id]) {
		printf("%s : CamId is over %d or not init\n", __FUNCTION__, MAX_AIQ_CTX);
		return RK_FALSE;
	}

	float max_exp_time_s = max_exp_time_ms / 1000.0;
	const rk_aiq_sys_ctx_t *ctx = g_aiq_ctx[cam_id];
	int ret;

	ae_api_expSwAttr_t expSwAttr;

	ret = rk_aiq_user_api2_ae_getExpSwAttr(ctx, &expSwAttr);
	// set time range in struct "advanced"
	expSwAttr.advanced.sw_aeT_advAeRange_en = true; /*must enable*/
	// LinAE
	expSwAttr.advanced.linExpRange.sw_aeT_time_max = max_exp_time_s; /*time_max*/
	expSwAttr.advanced.linExpRange.sw_aeT_time_min = 0.0f;           /*time_min*/
	// HdrAE
	expSwAttr.advanced.hdrExpRange[0].sw_aeT_time_max =
	    max_exp_time_s;                                       /*sframe time_max*/
	expSwAttr.advanced.hdrExpRange[0].sw_aeT_time_min = 0.0f; /*sframe time_min*/
	expSwAttr.advanced.hdrExpRange[1].sw_aeT_time_max =
	    max_exp_time_s;                                       /*mframe time_max*/
	expSwAttr.advanced.hdrExpRange[1].sw_aeT_time_min = 0.0f; /*mframe time_min*/
	expSwAttr.advanced.hdrExpRange[2].sw_aeT_time_max =
	    max_exp_time_s;                                       /*lframe time_max*/
	expSwAttr.advanced.hdrExpRange[2].sw_aeT_time_min = 0.0f; /*lframe time_min*/
	printf("%s max_exp_time = %f s\n", __func__, max_exp_time_s);
	ret = rk_aiq_user_api2_ae_setExpSwAttr(ctx, expSwAttr);

	if (getenv("sample_fix_ae")) {
		ret = rk_aiq_user_api2_ae_getExpSwAttr(ctx, &expSwAttr);
		expSwAttr.commCtrl.sw_aeT_opt_mode = RK_AIQ_OP_MODE_MANUAL;
		// LinearAE
		expSwAttr.commCtrl.meCtrl.linMe.sw_aeT_manGain_en = false;
		expSwAttr.commCtrl.meCtrl.linMe.sw_aeT_manTime_en = true;
		// expSwAttr.commCtrl.meCtrl.linMe.sw_aeT_manGain_en = 1.0f;   /*gain = 1x*/
		expSwAttr.commCtrl.meCtrl.linMe.sw_aeT_manTime_val =
		    max_exp_time_s; /*time = 1/50s*/
		ret = rk_aiq_user_api2_ae_setExpSwAttr(ctx, expSwAttr);
	}
	return ret;
}

static void rk_enable_ircut(bool on) {
	if (!on) {
		rk_gpio_set_value(g_smartIr_ctx.ircut_on_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(g_smartIr_ctx.ircut_on_gpio, 0);
	} else {
		rk_gpio_set_value(g_smartIr_ctx.ircut_off_gpio, 1);
		usleep(100 * 1000);
		rk_gpio_set_value(g_smartIr_ctx.ircut_off_gpio, 0);
	}
}

static int get_board_info(void) {
#ifdef AOV_FASTBOOT_ENABLE
	struct sensor_init_cfg *sensor_init_param = SAMPLE_COMM_AOV_GetSensorInitParam();
	g_smartIr_ctx.ircut_on_gpio = sensor_init_param->ircut_a.gpio_index;
	g_smartIr_ctx.ircut_off_gpio = sensor_init_param->ircut_b.gpio_index;
	g_smartIr_ctx.irled_pwm_channel = sensor_init_param->led_ir.pwm_channel;
	g_smartIr_ctx.irled_enable_gpio = sensor_init_param->led_ir_enable.gpio_index;
	g_smartIr_ctx.visled_pwm_channel = sensor_init_param->led_white.pwm_channel;
	g_smartIr_ctx.visled_enable_gpio = sensor_init_param->led_white_enable.gpio_index;
#else
	g_smartIr_ctx.ircut_on_gpio = get_int32_from_env("ircut_on_gpio", 74);
	g_smartIr_ctx.ircut_off_gpio = get_int32_from_env("ircut_off_gpio", 75);
	g_smartIr_ctx.irled_pwm_channel = get_int32_from_env("irled_pwm_channel", 3);
	g_smartIr_ctx.irled_enable_gpio = get_int32_from_env("irled_enable_gpio", 72);
	g_smartIr_ctx.visled_pwm_channel = get_int32_from_env("visled_pwm_channel", -1);
	g_smartIr_ctx.visled_enable_gpio = get_int32_from_env("visled_enable_gpio", -1);
#endif
	printf("%s: ircut on %d, ircut off %d, irled pwm %d, irled enable %d, wled pwm %d, "
	       "wled enable %d\n",
	       __func__, g_smartIr_ctx.ircut_on_gpio, g_smartIr_ctx.ircut_off_gpio,
	       g_smartIr_ctx.irled_pwm_channel, g_smartIr_ctx.irled_enable_gpio,
	       g_smartIr_ctx.visled_pwm_channel, g_smartIr_ctx.visled_enable_gpio);
	return RK_SUCCESS;
}

static void *smart_ir_thread(void *args) {
	int ret;
	RK_SMART_IR_STATUS_t last_status;
	rk_smart_ir_attr_t init_attr;

	printf("%s: thread start!\n", __func__);
	while (!g_smartIr_ctx.thread_is_quit) {
		ret = rk_smart_ir_run(g_smartIr_ctx.ir_ctx, false, &g_smartIr_ctx.result);
		if (ret != RK_SUCCESS) {
			printf("%s: rk_smart_ir_run failed %#X\n", __func__, ret);
			continue;
		}
	}
	printf("%s: thread exit!\n", __func__);

	return NULL;
}

RK_S32 SAMPLE_COMM_SmartIr_Start(int cam_id) {
	int ret = RK_SUCCESS;
#if defined(AOV_FASTBOOT_ENABLE)
	struct app_param_info *app_param = SAMPLE_COMM_AOV_GetAppParam();
	int rk_night_mode = app_param->night_mode;
	int rk_led_value = app_param->led_value;
	int rk_color_mode = app_param->color_mode;
#else
	int rk_night_mode = (int)get_int32_from_env("rk_night_mode", 2);
	int rk_led_value = (int)get_int32_from_env("rk_led_value", 20);
	int rk_color_mode = (int)get_int32_from_env("rk_color_mode", FULL_COLOR_MODE);
#endif
	int irled_pwm_period = 10000, irled_pwm_duty = 0;
	int visled_pwm_period = 10000, visled_pwm_duty = 0;
	rk_smart_ir_attr_t attr;

	printf("%s: night mode %d, led value %d, color mode %d\n", __func__, rk_night_mode,
	       rk_led_value, rk_color_mode);
	g_smartIr_ctx.night_mode = rk_night_mode;
	g_smartIr_ctx.aiq_ctx = g_aiq_ctx[cam_id];
	g_smartIr_ctx.ir_ctx = rk_smart_ir_init(g_smartIr_ctx.aiq_ctx);
	if (!g_smartIr_ctx.ir_ctx) {
		printf("%s: rk_smart_ir_init failed!\n", __func__);
		return RK_FAILURE;
	}

	get_board_info();
	// memset(&attr, 0, sizeof(attr));
	rk_smart_ir_getAttr(g_smartIr_ctx.ir_ctx, &attr);

	if (rk_night_mode == 2) {
		// load configs: auto switch, manual irled
		attr.init_status = (rk_color_mode != FULL_COLOR_MODE) ? RK_SMART_IR_STATUS_NIGHT
		                                                      : RK_SMART_IR_STATUS_DAY;
		attr.switch_mode = RK_SMART_IR_SWITCH_MODE_AUTO;
		attr.light_mode = RK_SMART_IR_LIGHT_MODE_MANUAL;
		attr.light_type = RK_SMART_IR_LIGHT_TYPE_IR;
		attr.light_value = rk_led_value;
		attr.params.d2n_envL_th = 0.04f;
		attr.params.n2d_envL_th = 0.20f;
		attr.params.rggain_base = 1.00f;
		attr.params.bggain_base = 1.00f;
		attr.params.awbgain_rad = 0.10f;
		attr.params.awbgain_dis = 0.20f;
		attr.params.switch_cnts_th = 50;
		ret = rk_smart_ir_setAttr(g_smartIr_ctx.ir_ctx, &attr);
		if (ret != RK_SUCCESS) {
			printf("%s: rk_smart_ir_setAttr failed\n", __func__);
			return ret;
		}

		ret |=
		    rk_gpio_export_direction(g_smartIr_ctx.ircut_on_gpio, GPIO_DIRECTION_OUTPUT);
		ret |=
		    rk_gpio_export_direction(g_smartIr_ctx.ircut_off_gpio, GPIO_DIRECTION_OUTPUT);
		ret |= rk_gpio_export_direction(g_smartIr_ctx.irled_enable_gpio,
		                                GPIO_DIRECTION_OUTPUT);
		irled_pwm_duty = irled_pwm_period * MIN(rk_led_value, 100) / 100;
		g_smartIr_ctx.cur_irled_value = rk_led_value;
#ifndef ROCKIT_LIGHT_CTL
		ret = rk_pwm_init(g_smartIr_ctx.irled_pwm_channel, irled_pwm_period,
		                  irled_pwm_duty, PWM_POLARITY_NORMAL);
		if (ret) {
			printf("%s: rk_pwm_init error ret [%d]\n", __func__, ret);
		}
#endif
		// In fastboot sdk, init_status set by rtt. For normal sdk, init_status is day by
		// default
		g_smartIr_ctx.last_status = attr.init_status;
		if (g_smartIr_ctx.last_status == RK_SMART_IR_STATUS_NIGHT) {
			rk_gpio_set_value(g_smartIr_ctx.irled_enable_gpio, 1);
			rk_enable_ircut(false);
			printf("%s: smart ir init status is night\n", __func__);
		} else {
			rk_gpio_set_value(g_smartIr_ctx.irled_enable_gpio, 0);
			rk_enable_ircut(true);
			printf("%s: smart ir init status is day\n", __func__);
		}
	} else {
		printf("%s: not support night mode %d!\n", __func__, rk_night_mode);
	}
	// create thread
	g_smartIr_ctx.thread_is_quit = false;
	pthread_create(&g_smartIr_ctx.thread_id, NULL, smart_ir_thread, NULL);
	printf("%s: smart ir init done\n", __func__);
	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_SmartIr_Stop() {
#ifndef ROCKIT_LIGHT_CTL
	rk_pwm_deinit(g_smartIr_ctx.irled_pwm_channel);
#endif
	g_smartIr_ctx.thread_is_quit = true;
	pthread_join(g_smartIr_ctx.thread_id, NULL);

	if (g_smartIr_ctx.ir_ctx) {
		rk_smart_ir_deInit(g_smartIr_ctx.ir_ctx);
		g_smartIr_ctx.ir_ctx = NULL;
	}
	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_SmartIr_SetThreshold(int cnt) {
	int ret = 0;
	rk_smart_ir_attr_t attr;
	ret = rk_smart_ir_getAttr(g_smartIr_ctx.ir_ctx, &attr);
	if (ret != 0) {
		printf("%s: rk_smart_ir_getAttr failed %#X\n", __func__, ret);
		return ret;
	}
	attr.init_status = g_smartIr_ctx.result.status;
	attr.params.switch_cnts_th = cnt;
	ret = rk_smart_ir_setAttr(g_smartIr_ctx.ir_ctx, &attr);
	if (ret != 0) {
		printf("%s: rk_smart_ir_setAttr failed %#X\n", __func__, ret);
		return ret;
	} else {
		printf("%s: set new threshold cnt %d\n", __func__, cnt);
	}
	return RK_SUCCESS;
}

RK_S32 SAMPLE_COMM_SmartIr_SwitchScene(void) {
	int ret;
	int irled_pwm_period = 10000, irled_pwm_duty = 0;
	VI_LIGHT_CTL_PARAM_S light_param;
	irled_pwm_duty = irled_pwm_period * MIN(g_smartIr_ctx.cur_irled_value, 100.0) / 100;

	// Wait for meta partition mount success.
#ifdef AOV_FASTBOOT_ENABLE
	for (int sleep_count = 0; sleep_count < 15; ++sleep_count) {
		if ((access("/dev/block/by-name/meta", F_OK)) == 0) {
			// printf("load meta partition finished\n");
			break;
		}
		printf("load meta partition no finished, retry\n");
		usleep(1000 * 1000);
	}
#endif

	// Switch scene.
	if (g_smartIr_ctx.result.status == RK_SMART_IR_STATUS_DAY &&
	    g_smartIr_ctx.last_status == RK_SMART_IR_STATUS_NIGHT) {
		g_smartIr_ctx.last_status = RK_SMART_IR_STATUS_DAY;
		if (g_smartIr_ctx.night_mode == 2) {
			rk_gpio_set_value(g_smartIr_ctx.irled_enable_gpio, 0);
#ifndef ROCKIT_LIGHT_CTL
			if (rk_pwm_set_enable(g_smartIr_ctx.irled_pwm_channel, false)) {
				printf("%s: pwm%d disable failed %d\n", __func__,
				       g_smartIr_ctx.irled_pwm_channel);
			}
#else
			memset(&light_param, 0, sizeof(light_param));
			light_param.u8LightType = LIGHT_TYPE_PWM;
			light_param.u8LightEnable = 0;
			light_param.u64DutyCycle = irled_pwm_duty;
			light_param.u64Period = irled_pwm_period;
			light_param.u32Polarity = 0;
			ret = RK_MPI_VI_DevEnableLight(0, 0, &light_param);
			if (ret != RK_SUCCESS)
				printf("%s: RK_MPI_VI_DevEnableLight failed %#X\n", __func__, ret);
#endif
			rk_enable_ircut(true);
		}
		ret = rk_aiq_uapi2_sysctl_switch_scene(g_smartIr_ctx.aiq_ctx, "normal", "day");
		if (ret != RK_SUCCESS)
			printf("%s: rk_aiq_uapi2_sysctl_switch_scene failed %#X\n", __func__, ret);
		printf("%s: switch to DAY\n", __func__);
#ifdef AOV_FASTBOOT_ENABLE
		system("make_meta --update --meta_path /dev/block/by-name/meta "
		       "--rk_color_mode 0");
#endif

	} else if (g_smartIr_ctx.result.status == RK_SMART_IR_STATUS_NIGHT) {
		if (g_smartIr_ctx.last_status == RK_SMART_IR_STATUS_DAY) {
			g_smartIr_ctx.last_status = RK_SMART_IR_STATUS_NIGHT;
			ret = rk_aiq_uapi2_sysctl_switch_scene(g_smartIr_ctx.aiq_ctx, "normal",
			                                       "night");
			if (ret != RK_SUCCESS)
				printf("%s: rk_aiq_uapi2_sysctl_switch_scene failed %#X\n", __func__,
				       ret);
			if (g_smartIr_ctx.night_mode == 2) {
				rk_enable_ircut(false);
				rk_gpio_set_value(g_smartIr_ctx.irled_enable_gpio, 1);
#ifndef ROCKIT_LIGHT_CTL
				if (rk_pwm_set_enable(g_smartIr_ctx.irled_pwm_channel, true)) {
					printf("pwm%d enable failed %d\n", g_smartIr_ctx.irled_pwm_channel);
				}
#else
				memset(&light_param, 0, sizeof(light_param));
				light_param.u8LightType = LIGHT_TYPE_PWM;
				light_param.u8LightEnable = 1;
				light_param.u64DutyCycle = irled_pwm_duty;
				light_param.u64Period = irled_pwm_period;
				light_param.u32Polarity = 0;
				ret = RK_MPI_VI_DevEnableLight(0, 0, &light_param);
				if (ret != RK_SUCCESS)
					printf("%s: RK_MPI_VI_DevEnableLight failed %#X\n", __func__, ret);
#endif
			}
			printf("%s: switch to Night\n", __func__);
#ifdef AOV_FASTBOOT_ENABLE
			system("make_meta --update --meta_path /dev/block/by-name/meta "
			       "--rk_color_mode 1");
#endif
		}
	}
}

RK_S32 SAMPLE_COMM_ISP_Get2AInfoStr(char *buf, size_t len, int cam_id) {
	int ret = 0;
	ae_api_queryInfo_t expInfo;
	rk_aiq_wb_querry_info_t wbInfo;
	rk_aiq_sys_ctx_t *aiq_ctx = g_aiq_ctx[cam_id];
	if (!aiq_ctx) {
		printf("%s: bad cam id %d\n", __func__, cam_id);
		return -1;
	}
	memset(&expInfo, 0, sizeof(expInfo));
	memset(&wbInfo, 0, sizeof(wbInfo));
	ret = rk_aiq_user_api2_ae_queryExpResInfo(aiq_ctx, &expInfo);
	if (ret != RK_SUCCESS) {
		printf("%s: failed to get ae stat\n", __func__);
		return ret;
	}
	ret = rk_aiq_user_api2_awb_QueryWBInfo(aiq_ctx, &wbInfo);
	if (ret != RK_SUCCESS) {
		printf("%s: failed to get awb stat\n", __func__);
		return ret;
	}
	ret = snprintf(
	    buf, len,
	    "cam%d exp:%.3f again:%.2f dgain:%.2f igain:%.2f luma:%.2f r:%.2f g:%.2f gb:%.2f "
	    "b:%.2f",
	    cam_id, expInfo.linExpInfo.expParam.integration_time,
	    expInfo.linExpInfo.expParam.analog_gain, expInfo.linExpInfo.expParam.digital_gain,
	    expInfo.linExpInfo.expParam.isp_dgain, expInfo.linExpInfo.meanLuma,
	    wbInfo.gain.rgain, wbInfo.gain.grgain, wbInfo.gain.gbgain, wbInfo.gain.bgain);
	if (ret <= 0)
		printf("%s: format string error\n", __func__);
	return ret;
}

#ifdef __cplusplus
#if __cplusplus
}
#endif
#endif /* End of #ifdef __cplusplus */
