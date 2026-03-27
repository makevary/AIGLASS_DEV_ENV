HOST_CC = gcc
CFLAGS = -O2 -Wall -I../include

ifeq ($(IS_NAND_FLASH), YES)
	CFLAGS += -DIS_NAND_FLASH
endif

target=make_meta.c
target_bin_host=$(patsubst %.c,%,$(target))_host
target_bin=$(patsubst %.c,%,$(target))
ifneq ($(RK_TOOLCHAIN_CROSS),)
CROSS_COMPILE_CC ?= $(RK_TOOLCHAIN_CROSS)-gcc
else
CROSS_COMPILE_CC ?= arm-rockchip830-linux-uclibcgnueabihf-gcc
endif

all: 
	$(HOST_CC) $(CFLAGS) -o $(target_bin_host) $(target) -I ../zlib/out_host_pc/include/ ../zlib/out_host_pc/lib/libz.a 
ifneq ($(CROSS_COMPILE_CC),)
	$(CROSS_COMPILE_CC) $(CFLAGS) -o $(target_bin) $(target) -I ../zlib/out_board/include/ ../zlib/out_board/lib/libz.a \
		-DRUN_ON_BOARD -I ../mtd_updateEngeen/ -L ../mtd_updateEngeen/out_board/ -lmtd-tools
endif

clean:
	@rm -f *.o $(target_bin) $(target_bin_host)
