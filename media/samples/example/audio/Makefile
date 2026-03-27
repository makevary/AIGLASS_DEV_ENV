# Rockchip sample Makefile

LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib

all:
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_ai.c -o sample_ai $(LD_FLAGS)
	$(CMD_DBG)$(SAMPLE_CC) $(SAMPLE_CFLAGS) sample_ai_aenc.c -o sample_ai_aenc $(LD_FLAGS)

install:
	$(CMD_DBG)mv -f sample_ai sample_ai_aenc $(SAMPLE_OUT_DIR)/bin

clean:
	$(CMD_DBG)rm -f sample_ai sample_ai_aenc
