# Rockchip sample Makefile
SOURCES_C     = $(wildcard *.c)
OBJECTS       = $(basename $(SOURCES_C))
LD_FLAGS += -L$(COMM_DIR)/lib -lsample_comm
LD_FLAGS += $(RK_MEDIA_OPTS) -L$(RK_MEDIA_OUTPUT)/lib -lrkaiq
all: $(OBJECTS)

sample_vi_vo: sample_vi_vo.c
	$(CMD_DBG)$(SAMPLE_CC) $^ -o $@ $(SAMPLE_CFLAGS) $(LD_FLAGS)
install:
	$(CMD_DBG)mv -f $(OBJECTS) $(SAMPLE_OUT_DIR)/bin
clean:
	$(CMD_DBG)echo "clean sample/vo"
