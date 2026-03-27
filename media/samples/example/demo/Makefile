# Rockchip sample Makefile

LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib -lrockchip_mpp -lrkaiq -lrtsp
# LD_FLAGS += -ldrm

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_multi_camera_eptz.c -o sample_demo_multi_camera_eptz $(LD_FLAGS)
ifeq ($(RK_MEDIA_CHIP), rv1106)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_rv1103_dual_memory_opt.c -o sample_rv1103_dual_memory_opt $(LD_FLAGS)
endif
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_aiisp.c -o sample_demo_aiisp $(LD_FLAGS) -lrockiva
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_dual_aiisp.c -o sample_demo_dual_aiisp $(LD_FLAGS) -lrockiva
ifeq ($(HAVE_AVS), y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_avs_venc.c -o sample_demo_vi_avs_venc $(LD_FLAGS)
endif
ifeq ($(CONFIG_RK_IVA),y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_dual_camera.c -o sample_demo_dual_camera $(LD_FLAGS) -lrockiva
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_dual_camera_wrap.c -o sample_demo_dual_camera_wrap $(LD_FLAGS) -lrockiva
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc.c -o sample_demo_vi_venc $(LD_FLAGS) -lrockiva
else
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_vi_venc.c -o sample_demo_vi_venc $(LD_FLAGS)
endif
ifneq ($(findstring $(RK_MEDIA_CHIP), rk3576 rk3588),)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_demo_multi_cam.c -o sample_demo_multi_cam $(LD_FLAGS) -lrockiva -lfreetype
endif

install:
	$(CMD_DBG)mv -f sample_demo_vi_venc $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_aiisp $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_dual_aiisp $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_multi_camera_eptz $(SAMPLE_OUT_DIR)/bin
ifeq ($(RK_MEDIA_CHIP), rv1106)
	$(CMD_DBG)mv -f sample_rv1103_dual_memory_opt $(SAMPLE_OUT_DIR)/bin
endif
ifeq ($(HAVE_AVS),y)
	$(CMD_DBG)mv -f sample_demo_vi_avs_venc $(SAMPLE_OUT_DIR)/bin
endif
ifeq ($(CONFIG_RK_IVA),y)
	$(CMD_DBG)mv -f sample_demo_dual_camera $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_demo_dual_camera_wrap $(SAMPLE_OUT_DIR)/bin
endif
ifneq ($(findstring $(RK_MEDIA_CHIP), rk3576 rk3588),)
	$(CMD_DBG)mv -f sample_demo_multi_cam $(SAMPLE_OUT_DIR)/bin
endif

clean:
	$(CMD_DBG)echo "clean demo"
