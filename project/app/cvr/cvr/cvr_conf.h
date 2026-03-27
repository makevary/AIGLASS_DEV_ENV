/*
 *
 * Copyright (c) 2024 Rockchip, Inc. All Rights Reserved.
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

#ifndef __CVR_CONF_H__
#define __CVR_CONF_H__

#include <stdint.h>

#define CVR_SUPPORT_SENSOR_CNT                  2

#define CVR_ISP_CNT                             1
#define CVR_ISP_IQ_PATH                         "/etc/iqfiles"

#define CVR_RKADK_DEFAULT_INICFG_PATH           "/oem/usr/etc"
#define CVR_RKADK_INICFG_PATH                   "/userdata/rkadk/"
#define CVR_RKADK_GLOBAL_INICFG                 "rkadk_setting.ini"
#define CVR_RKADK_SENSOR_INICFG                 "rkadk_setting_sensor_0.ini,rkadk_setting_sensor_1.ini"

#define CVR_STR_MOUNT_PATH                      "/mnt/sdcard"
#define CVR_STR_VIDEO_FRONT_PATH                "/video_front/"
#define CVR_STR_VIDEO_BACK_PATH                 "/video_back/"
#define CVR_STR_PHOTO_PATH                      "/photo/"
#define CVR_STR_URGENT_PATH                     "/video_urgent/"
#define CVR_STR_TIME_LAPSE_PATH                 "/video_time_lapse/"

#define CVR_PARAM_BACKUP_PATH                   "/oem/usr/share/res/conf/cvr_cfg_backup.ini"
#define CVR_PARAM_DEFAULT_PATH                  "/userdata/cvr_cfg.ini"

#ifdef USE_LVGL
    #define CVR_TTF_FILE                            "/oem/usr/share/res/font/PuHuiTi.ttf"
#else
    #define CVR_TTF_FILE                            "/oem/usr/share/res/font/PuHuiTi_Tiny.ttf"
#endif

#define CVR_ICON_FILE_PATH                      "/oem/usr/share/res/ui/"
#define CVR_TEXT_CHINESE_PATH                   "/oem/usr/share/res/string/Chinese.txt"
#define CVR_TEXT_ENGLISH_PATH                   "/oem/usr/share/res/string/English.txt"

#define CVR_ADAS_MODLE_PATH                     "/oem/usr/lib/"
#define CVR_ADAS_LICENSE_PATH                   "/data/key.lic"

#endif