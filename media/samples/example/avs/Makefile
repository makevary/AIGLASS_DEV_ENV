# Rockchip sample Makefile

LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_multi_vi_avs.c         -o sample_multi_vi_avs          $(LD_FLAGS) -lrkaiq
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_avs.c        -o sample_avs           $(LD_FLAGS)

install:
	$(CMD_DBG)mv -f sample_multi_vi_avs $(SAMPLE_OUT_DIR)/bin
	$(CMD_DBG)mv -f sample_avs    $(SAMPLE_OUT_DIR)/bin

clean:
	$(CMD_DBG)rm -f sample_multi_vi_avs
