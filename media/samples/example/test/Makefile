# Rockchip sample Makefile
LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_ai_aenc_adec_ao_stresstest.c -o sample_ai_aenc_adec_ao_stresstest $(LD_FLAGS)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_isp_stresstest.c -o sample_isp_stresstest $(LD_FLAGS) -lrkaiq
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_venc_stresstest.c -o sample_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_rgn_stresstest.c -o sample_rgn_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_mulit_isp_stresstest.c -o sample_mulit_isp_stresstest $(LD_FLAGS) -lrkaiq
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_aiisp_stresstest.c -o sample_demo_aiisp_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp -lrockiva
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_dual_aiisp_stresstest.c -o sample_demo_dual_aiisp_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp -lrockiva
ifeq ($(HAVE_AVS), y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_avs_stresstest.c -o sample_avs_stresstest $(LD_FLAGS) -lrkaiq
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_avs_venc_stresstest.c -o sample_demo_vi_avs_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
endif
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_vpss_stresstest.c -o sample_vpss_stresstest $(LD_FLAGS) -lrkaiq
ifeq ($(CONFIG_RK_IVA) ,y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc_stresstest.c -o sample_demo_vi_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp -lrockiva
else
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc_stresstest.c -o sample_demo_vi_venc_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp
endif
ifneq ($(findstring $(RK_MEDIA_CHIP), rk3576 rk3588),)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_multi_cam_stresstest.c -o sample_multi_cam_stresstest $(LD_FLAGS) -lrockchip_mpp -lrkaiq -lrtsp -lrockiva -lfreetype
endif


install:
	$(CMD_DBG)mv -f sample_ai_aenc_adec_ao_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_isp_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_venc_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_rgn_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_mulit_isp_stresstest $(SAMPLE_OUT_DIR)/bin
ifeq ($(HAVE_AVS), y)
	$(CMD_DBG)mv -f sample_avs_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_vi_avs_venc_stresstest $(SAMPLE_OUT_DIR)/bin
endif
	$(CMD_DBG)mv -f sample_vpss_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_vi_venc_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_aiisp_stresstest $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_dual_aiisp_stresstest $(SAMPLE_OUT_DIR)/bin
ifneq ($(findstring $(RK_MEDIA_CHIP), rk3576 rk3588),)
	$(CMD_DBG)mv -f sample_multi_cam_stresstest $(SAMPLE_OUT_DIR)/bin
endif
	$(CMD_DBG)mkdir -p $(SAMPLE_OUT_DIR)/install_to_userdata/
	$(CMD_DBG)cp   -f   source/ai_aenc_adec_ao_stresstes.sh     $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/160x96.bmp                       $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/192x96.bmp                       $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/avs_stresstest.sh                $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/vpss_stresstest.sh               $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/isp_stresstest.sh                $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/venc_stresstest.sh               $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/demo_vi_venc_stresstest.sh       $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rgn_stresstest.sh                $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/demo_vi_avs_venc_stresstest.sh   $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/demo_aiisp_stresstest.sh         $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/demo_dual_aiisp_stresstest.sh    $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/multi_isp_stresstest.sh          $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/kill_pid.sh                      $(SAMPLE_OUT_DIR)/install_to_userdata
ifeq ($(RK_MEDIA_CHIP), rv1103b)
	$(CMD_DBG)cp   -f   source/thunderboot-stresstest.sh        $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rv1103_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata/rv1103b_wrap_stresstest.sh
	$(CMD_DBG)cp   -f   source/rv1106_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata/rv1103b_stresstest.sh
	$(CMD_DBG)cp   -f   source/rv1106_multi_cam_stresstest.sh   $(SAMPLE_OUT_DIR)/install_to_userdata/rv1103b_multi_cam_stresstest.sh
endif
ifeq ($(RK_MEDIA_CHIP), rv1106)
	$(CMD_DBG)cp   -f   source/thunderboot-stresstest.sh        $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rv1103_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rv1106_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rv1106_multi_cam_stresstest.sh   $(SAMPLE_OUT_DIR)/install_to_userdata
endif
ifeq ($(RK_MEDIA_CHIP), rv1126)
	$(CMD_DBG)cp   -f   source/rv1126_multi_cam_stresstest.sh   $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rv1126_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata
endif
ifeq ($(RK_MEDIA_CHIP), rk3576)
	$(CMD_DBG)cp   -f   source/rk3576_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata
	$(CMD_DBG)cp   -f   source/rk3576_multi_cam_stresstest.sh             $(SAMPLE_OUT_DIR)/install_to_userdata
endif

clean:
	$(CMD_DBG)echo "clean test"
