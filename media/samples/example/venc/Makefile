# Rockchip sample Makefile
LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib -lrockchip_mpp -lrkaiq -lrtsp

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_vi_vpss_osd_venc.c -o sample_vi_vpss_osd_venc $(LD_FLAGS)
ifeq ($(HAVE_AVS), y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_multi_vi_avs_osd_venc.c -o sample_multi_vi_avs_osd_venc $(LD_FLAGS)
endif
install:
	$(CMD_DBG)mv -f sample_vi_vpss_osd_venc $(SAMPLE_OUT_DIR)/bin
ifeq ($(HAVE_AVS), y)
	$(CMD_DBG)mv -f sample_multi_vi_avs_osd_venc $(SAMPLE_OUT_DIR)/bin
endif
clean:
	$(CMD_DBG)echo "clean venc"
