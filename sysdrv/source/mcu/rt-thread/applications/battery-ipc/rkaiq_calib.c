#include "stddef.h"
#include "stdint.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#include "rkaiq_calib.h"

//iq parse need!!
#ifdef ISP_HW_V32
int g_rkaiq_isp_hw_ver = 32;
#elif ISP_HW_V33
int g_rkaiq_isp_hw_ver = 33;
#endif

#define RTT_IQ_BIN_TYPE 0xFFFFFF01

typedef struct __map_index
{
    void *dst_offset;
    void *ptr_offset;
    size_t len;
} map_index_t;

int rkaiq_parse_bin_map(uint8_t *data, size_t len)
{
    size_t map_len = *(size_t *)(data + (len - sizeof(size_t)));
    size_t map_offset = *(size_t *)(data + (len - sizeof(size_t) * 2));
    size_t map_index = 0;
    map_index_t *map_addr = NULL;

    map_addr = (map_index_t *)(data + map_offset);

    for (map_index = 0; map_index < map_len; map_index++)
    {
        map_index_t tmap = (map_addr[map_index]);
        void **dst_obj_addr = (void **)(data + (size_t)tmap.dst_offset);
        *dst_obj_addr = data + (uintptr_t)tmap.ptr_offset;
    }

    return 0;
}

CamCalibDbProj_t *rkaiq_calib_load(void *offset, size_t len)
{
    CamCalibDbProj_t *calibproj = NULL;

    if (!offset || len <= 0)
    {
        return NULL;
    }

    rkaiq_parse_bin_map((uint8_t *)offset, len);

    calibproj = (CamCalibDbProj_t *)offset;

    return calibproj;
}

int rkaiq_calib_write
(
    CamCalibDbProj_t *calibproj,
    CamCalibDbV2Context_t *def_calib,
    int app_flip,
    int app_fps
)
{
    if (!def_calib || !calibproj || !calibproj->main_scene ||
            !calibproj->main_scene[0].sub_scene)
    {
        rt_kprintf("%s input invalid!\n", __func__);
        return -1;
    }

    //sync mirror/flip value in IQ sensor_calib
    calibproj->sensor_calib.CISFlip = app_flip;

    //sync fps value in all IQ calib_scene
    for (int i = 0; i < calibproj->main_scene_len; i++)
    {
        for (int j = 0; j < calibproj->main_scene[i].sub_scene_len; j++)
        {
            def_calib->calib_scene = (char *)(calibdbv2_get_scene_ptr(&calibproj->main_scene[i].sub_scene[j]));

#ifdef ISP_HW_V32
            CalibDb_Aec_ParaV2_t *aec_calib = (CalibDb_Aec_ParaV2_t *)(CALIBDBV2_GET_MODULE_PTR((void *)(def_calib), ae_calib));
            if (!aec_calib)
            {
                rt_kprintf("%s get aec_calib ptr failed!\n", __func__);
                return -1;
            }
            if (aec_calib->CommCtrl.AecFrameRateMode.isFpsFix == false && aec_calib->CommCtrl.AecFrameRateMode.FpsValue > 0)
            {
                rt_kprintf("scene(%s) frmRate: mode=%d, val=%d, keep fps\n", calibproj->main_scene[i].sub_scene[j].name,
                           aec_calib->CommCtrl.AecFrameRateMode.isFpsFix, (int)aec_calib->CommCtrl.AecFrameRateMode.FpsValue);
            }
            else
            {
                rt_kprintf("scene(%s) frmRate: mode=%d, val=%d, update fps=%d\n", calibproj->main_scene[i].sub_scene[j].name,
                           aec_calib->CommCtrl.AecFrameRateMode.isFpsFix, (int)aec_calib->CommCtrl.AecFrameRateMode.FpsValue, app_fps);
                aec_calib->CommCtrl.AecFrameRateMode.FpsValue = app_fps;
            }

#elif ISP_HW_V33
            ae_param_t *aec_calib = (ae_param_t *)(CALIBDBV2_GET_MODULE_PTR((void *)(def_calib), ae_calib));
            if (!aec_calib)
            {
                rt_kprintf("%s get aec_calib ptr failed!\n", __func__);
                return -1;
            }
            if (aec_calib->commCtrl.frmRate.sw_aeT_frmRate_mode == ae_frmRate_auto_mode && aec_calib->commCtrl.frmRate.sw_aeT_frmRate_val > 0)
            {
                rt_kprintf("scene(%s) frmRate: mode=%d, val=%d, keep fps\n", calibproj->main_scene[i].sub_scene[j].name,
                           aec_calib->commCtrl.frmRate.sw_aeT_frmRate_mode, (int)aec_calib->commCtrl.frmRate.sw_aeT_frmRate_val);
            }
            else
            {
                rt_kprintf("scene(%s) frmRate: mode=%d, val=%d, update fps=%d\n", calibproj->main_scene[i].sub_scene[j].name,
                           aec_calib->commCtrl.frmRate.sw_aeT_frmRate_mode, (int)aec_calib->commCtrl.frmRate.sw_aeT_frmRate_val, app_fps);
                aec_calib->commCtrl.frmRate.sw_aeT_frmRate_val = app_fps;
            }
#endif

        }
    }

    return 0;
}

int rkaiq_get_calib
(
    CamCalibDbProj_t *calibproj,
    CamCalibDbV2Context_t *def_calib,
    int mode,
    char *sub_scene
)
{
    if (!def_calib || !calibproj || !calibproj->main_scene || !calibproj->main_scene[0].sub_scene)
    {
        rt_kprintf("%s input invalid!\n", __func__);
        return -1;
    }

    def_calib->sensor_info = &calibproj->sensor_calib;
    def_calib->module_info = &calibproj->module_calib;
    def_calib->sys_cfg = &calibproj->sys_static_cfg;
    def_calib->calib_scene = (char *)(calibdbv2_get_scene_ptr(&calibproj->main_scene[0].sub_scene[0]));

    char *main_scene_name;
    if (mode == 0/*NO_HDR*/)
        main_scene_name = "normal";
    else
        main_scene_name = "hdr";

    for (int i = 0; i < calibproj->main_scene_len; i++)
    {
        if (!strcmp(calibproj->main_scene[i].name, main_scene_name))
        {
            for (int j = 0; j < calibproj->main_scene[i].sub_scene_len; j++)
            {
                if (!strcmp(calibproj->main_scene[i].sub_scene[j].name, sub_scene))
                {
                    def_calib->calib_scene = (char *)(calibdbv2_get_scene_ptr(&calibproj->main_scene[i].sub_scene[j]));
                    if (!def_calib->calib_scene)
                    {
                        rt_kprintf("load iq bin file failed [%p]\n", def_calib->calib_scene);
                        return -1;
                    }
                    else
                    {
                        rt_kprintf("load iq bin file finished!\n");
                        return 0;
                    }
                }
            }
        }
    }

    rt_kprintf("can not find scene(%s, %s)!\n", main_scene_name, sub_scene);
    return -1;
}

int rkaiq_check_bin(void *iq_offset, rk_aiq_iq_bin_mode_t* iq_bin_mode)
{
    simplified_calibproj_t *iq_bin = (simplified_calibproj_t *)(iq_offset);
    if (iq_bin->bin_type == RTT_IQ_BIN_TYPE)
    {
        *iq_bin_mode = RTT_IQ_BIN_MODE;
        rt_kprintf("load all scene(%s,%s,%s)\n", iq_bin->sub_scene[0].name, iq_bin->sub_scene[1].name, iq_bin->sub_scene[2].name);
    }
    else
    {
        *iq_bin_mode = FULL_IQ_BIN_MODE;
    }
    rt_kprintf("iq_bin_mode=%d\n", *iq_bin_mode);

    return 0;
}

int rkaiq_get_rttbin(void *iq_offset, CamCalibDbV2Context_t *def_calib, int mode, char *sub_scene)
{
    int ret = -1;
    int scene_num = 3;
    def_calib->scene_id = 0;
    def_calib->rtt_iq_calib = (simplified_calibproj_t *)iq_offset;

    char *main_scene;
    if (mode == 0/*NO_HDR*/)
        main_scene = "normal-";
    else
        main_scene = "hdr-";
    char *scene_name = (char *)rt_calloc(1, (strlen(main_scene) + strlen(sub_scene)));
    sprintf(scene_name, "%s%s", main_scene, sub_scene);

    for (int i = 0; i < scene_num; i++)
    {
        if (!strcmp(def_calib->rtt_iq_calib->sub_scene[i].name, scene_name))
        {
            def_calib->scene_id = i;
            ret =  0;
            break;
        }
    }

    if (ret == 0)
        rt_kprintf("load scene(%s) iq bin finished!\n", scene_name);
    else
        rt_kprintf("can not find scene(%s)\n", scene_name);
    rt_free(scene_name);

    return ret;
}

int restoreBinStructMap(uint8_t *data, size_t len, uintptr_t restore_ptr)
{
    size_t map_len = *(size_t *)(data + (len - sizeof(size_t)));
    size_t map_offset = *(size_t *)(data + (len - sizeof(size_t) * 2));
    size_t map_index = 0;
    map_index_t *map_addr = NULL;

    map_addr = (map_index_t *)(data + map_offset);
    for (map_index = 0; map_index < map_len; map_index++)
    {
        map_index_t tmap = (map_addr[map_index]);
        void **dst_obj_addr = (void **)(data + (size_t)tmap.dst_offset);
        *dst_obj_addr = (void *)(restore_ptr + (uintptr_t)tmap.ptr_offset);
    }

    return 0;
}

void bin2calib(void *bin_buff, CamCalibDbV2Context_t *def_calib)
{
// cancel the process for AOV
#if 0
    uint8_t *buf_start = (uint8_t *)bin_buff;
    calib2bin_header_t *header;
    calib2bin_block_t *block_list;

    header = (calib2bin_header_t *)bin_buff;
    block_list = (calib2bin_block_t *)(buf_start + header->block_offset);
    buf_start += header->bin_offset;

    for (int i = 0; i < header->block_len; i++)
    {
#if defined(ISP_HW_V32)
        if (strcmp("CalibDb_Sensor_ParaV2_t", block_list[i].name) == 0)
            memcpy(&def_calib->sensorinfo, (CalibDb_Sensor_ParaV2_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDb_Sensor_ParaV2_t));
        else if (strcmp("CalibDb_Aec_ParaV2_t", block_list[i].name) == 0)
            memcpy(&def_calib->ae_calib, (CalibDb_Aec_ParaV2_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDb_Aec_ParaV2_t));
        else if (strcmp("CalibDbV2_Bayer2dnrV23_t", block_list[i].name) == 0)
            memcpy(&def_calib->baynr_calib, (CalibDbV2_Bayer2dnrV23_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDbV2_Bayer2dnrV23_t));
        else if (strcmp("CalibDbV2_BayerTnrV23_t", block_list[i].name) == 0)
            memcpy(&def_calib->baytnr_calib, (CalibDbV2_BayerTnrV23_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDbV2_BayerTnrV23_t));
        else if (strcmp("CalibDbV2_Wb_Para_V32_t", block_list[i].name) == 0)
            memcpy(&def_calib->awb_calib, (CalibDbV2_Wb_Para_V32_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDbV2_Wb_Para_V32_t));
        else if (strcmp("CalibDbV2_Blc_V32_t", block_list[i].name) == 0)
            memcpy(&def_calib->blc_calib, (CalibDbV2_Blc_V32_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDbV2_Blc_V32_t));
#elif defined(ISP_HW_V33)
        if (strcmp("CalibDb_Sensor_ParaV2_t", block_list[i].name) == 0)
            memcpy(&def_calib->sensorinfo, (CalibDb_Sensor_ParaV2_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(CalibDb_Sensor_ParaV2_t));
        else if (strcmp("ae_param_t", block_list[i].name) == 0)
            memcpy(&def_calib->ae_calib, (ae_param_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(ae_param_t));
        else if (strcmp("awb_api_attrib_t", block_list[i].name) == 0)
            memcpy(&def_calib->awb_calib, (awb_api_attrib_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(awb_api_attrib_t));
        else if (strcmp("blc_api_attrib_t", block_list[i].name) == 0)
            memcpy(&def_calib->blc_calib, (blc_api_attrib_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(blc_api_attrib_t));
        else if (strcmp("btnr_api_attrib_t", block_list[i].name) == 0)
            memcpy(&def_calib->btnr_calib, (btnr_api_attrib_t *)rkaiq_calib_load(buf_start + block_list[i].offset, block_list[i].size), sizeof(btnr_api_attrib_t));
#endif
        //rt_kprintf("header info: start %p offset %d size %d\n", buf_start, block_list[i].offset, block_list[i].size);
    }

    /*rt_kprintf("sensor calib: %d %d %d\n", def_calib->sensorinfo.CISDcgSet.Linear.dcg_mode.Coeff[0],
                                          def_calib->sensorinfo.CISDcgSet.Linear.dcg_mode.Coeff[1],
                                          def_calib->sensorinfo.CISDcgSet.Linear.dcg_mode.Coeff[2]);

    rt_kprintf("ae calib: rout: IspDGainDot: ");
    for (int i = 0; i < def_calib->ae_calib.LinearAeCtrl.Route.IspDGainDot_len; i++) {
        rt_kprintf("%f ", def_calib->ae_calib.LinearAeCtrl.Route.IspDGainDot[i]);
    }
    rt_kprintf("\n");

    rt_kprintf("ae calib: rout: PIrisDot: ");
    for (int i = 0; i < def_calib->ae_calib.LinearAeCtrl.Route.PIrisDot_len; i++) {
        rt_kprintf("%d ", def_calib->ae_calib.LinearAeCtrl.Route.PIrisDot[i]);
    }
    rt_kprintf("\n");

    rt_kprintf("ae calib: rout: TimeDot: ");
    for (int i = 0; i < def_calib->ae_calib.LinearAeCtrl.Route.TimeDot_len; i++) {
        rt_kprintf("%f ", def_calib->ae_calib.LinearAeCtrl.Route.TimeDot[i]);
    }
    rt_kprintf("\n");

    rt_kprintf("ae calib: rout: GainDot: ");
    for (int i = 0; i < def_calib->ae_calib.LinearAeCtrl.Route.GainDot_len; i++) {
        rt_kprintf("%f ", def_calib->ae_calib.LinearAeCtrl.Route.GainDot[i]);
    }
    rt_kprintf("\n");

    rt_kprintf("2dnr: %d %d %s\n", def_calib->baynr_calib.TuningPara.hdrdgain_ctrl_en,
                                  def_calib->baynr_calib.TuningPara.Setting_len,
                                  def_calib->baynr_calib.TuningPara.Setting[0].SNR_Mode);

    rt_kprintf("tnr: %d %d %d %d %s\n", def_calib->baytnr_calib.TuningPara.thumbds_w,
                                  def_calib->baytnr_calib.TuningPara.thumbds_h,
                                  def_calib->baytnr_calib.TuningPara.trans_en,
                                  def_calib->baytnr_calib.TuningPara.Setting_len,
                                  def_calib->baytnr_calib.TuningPara.Setting[0].SNR_Mode);

    rt_kprintf("awb: %d %d %d %f %f %f %f\n", def_calib->awb_calib.control.byPass,
                                          def_calib->awb_calib.control.mode,
                                          def_calib->awb_calib.manualPara.mode,
                                          def_calib->awb_calib.manualPara.cfg.mwbGain[0],
                                          def_calib->awb_calib.manualPara.cfg.mwbGain[1],
                                          def_calib->awb_calib.manualPara.cfg.mwbGain[2],
                                          def_calib->awb_calib.manualPara.cfg.mwbGain[3]);

    rt_kprintf("blc %f %f %f %f\n", def_calib->blc_calib.Blc0TuningPara.BLC_Data.R_Channel[0],
                             def_calib->blc_calib.Blc0TuningPara.BLC_Data.B_Channel[0],
                             def_calib->blc_calib.Blc0TuningPara.BLC_Data.Gb_Channel[0],
                             def_calib->blc_calib.Blc0TuningPara.BLC_Data.Gr_Channel[0]);*/
#endif
}
