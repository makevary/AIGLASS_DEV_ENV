/*
 * Copyright (c) 2022 Rockchip, Inc. All Rights Reserved.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#include <cvr_conf.h>

#include "isp_common.h"

#include <rkadk_param.h>
#include <rkadk_common.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>

/**********************
 *  STATIC PROTOTYPES
 **********************/

/**********************
 *  STATIC VARIABLES
 **********************/

/**********************
 *  GLOBAL VARIABLES
 **********************/

/**********************
 *      MACROS
 **********************/

/**********************
 *   STATIC FUNCTIONS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

int32_t isp_common_init(void) {
    bool multi_cam;
    uint32_t cam_id;
    RKADK_PARAM_FPS_S fps;
    SAMPLE_ISP_PARAM isp_param;
    RKADK_PARAM_COMM_CFG_S *common_cfg = NULL;

    multi_cam = (1 < CVR_ISP_CNT) ? true : false;

    common_cfg = RKADK_PARAM_GetCommCfg();
    if (NULL == common_cfg) {
        RKADK_LOGE("RKADK_PARAM_GetCommCfg failed!");
        return -1;
    }

    for (cam_id = 0; (cam_id < common_cfg->sensor_count) && (cam_id < CVR_ISP_CNT); cam_id++) {
        memset(&fps, 0, sizeof(fps));
        memset(&isp_param, 0, sizeof(isp_param));

        fps.enStreamType = RKADK_STREAM_TYPE_SENSOR;
        if (RKADK_PARAM_GetCamParam(cam_id, RKADK_PARAM_TYPE_FPS, &fps)) {
            RKADK_LOGE("cam_id: %d, RKADK_PARAM_GetCamParam fps failed!", cam_id);
            return -1;
        }

        isp_param.iqFileDir = CVR_ISP_IQ_PATH;
        isp_param.WDRMode = RK_AIQ_WORKING_MODE_NORMAL;
        isp_param.bMultiCam = multi_cam;
        isp_param.fps = fps.u32Framerate;
        if (SAMPLE_ISP_Start(cam_id, isp_param))
            RKADK_LOGW("cam_id: %d, ISP_Start start failed!", cam_id);
    }

    return 0;
}

void isp_common_deinit(void) {
    RKADK_PARAM_COMM_CFG_S *common_cfg = NULL;

    common_cfg = RKADK_PARAM_GetCommCfg();
    if (NULL == common_cfg) {
        RKADK_LOGE("RKADK_PARAM_GetCommCfg failed!");
        return;
    }

    for (uint32_t cam_id = 0; cam_id < common_cfg->sensor_count; cam_id++)
        SAMPLE_ISP_Stop(cam_id);
}