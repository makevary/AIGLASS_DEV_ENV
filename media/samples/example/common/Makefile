# Rockchip sample Makefile

.PHONY : clean

all:$(COMM_OBJ)
	$(CMD_DBG)mkdir -p $(COMM_DIR)/lib
	$(CMD_DBG)$(SAMPLE_AR) crs $(COMM_DIR)/lib/libsample_comm.a $(COMM_OBJ)

$(COMM_OBJ): $(COMM_SRC)
	$(CMD_DBG)$(SAMPLE_CC) -c $(patsubst %.o,%.c,$@)  -o $@ $(SAMPLE_CFLAGS) $(LD_FLAGS)

clean:
	$(CMD_DBG)make -C isp2.x clean
	$(CMD_DBG)make -C isp3.x clean
	$(CMD_DBG)rm  -f *.o
	$(CMD_DBG)rm -rf $(COMM_DIR)/lib

