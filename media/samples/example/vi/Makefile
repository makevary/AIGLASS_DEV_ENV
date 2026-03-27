# Rockchip sample Makefile

LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib -lrkaiq
EIS_CFLAGS += -lrockchip_mpp -lrtsp -leasyiio -liio

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_vi.c         -o sample_vi          $(LD_FLAGS)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_multi_vi.c    -o sample_multi_vi    $(LD_FLAGS)
ifeq ($(CONFIG_RK_LIBEASYIIO),y)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_vi_eis.c  -o sample_vi_eis  $(LD_FLAGS) $(EIS_CFLAGS)
endif

install:
	$(CMD_DBG)mv -f sample_vi sample_multi_vi $(SAMPLE_OUT_DIR)/bin
ifeq ($(CONFIG_RK_LIBEASYIIO),y)
	$(CMD_DBG)mv -f sample_vi_eis  $(SAMPLE_OUT_DIR)/bin
endif
clean:
	$(CMD_DBG)rm -f sample_vi
	$(CMD_DBG)rm -f sample_multi_vi
ifeq ($(CONFIG_RK_LIBEASYIIO),y)
	$(CMD_DBG)rm -f sample_vi_eis
endif
