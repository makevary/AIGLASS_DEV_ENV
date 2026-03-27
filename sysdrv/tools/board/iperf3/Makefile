
ifeq ($(SYSDRV_PARAM), )
    SYSDRV_PARAM:=../../../Makefile.param
    include $(SYSDRV_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

ifeq ($(SYSDRV_ARCH_TYPE),arm)
PKG_USE_THUMB2 ?= YES
endif

ifeq ($(PKG_USE_THUMB2),YES)
SYSDRV_CROSS_CFLAGS += -mthumb -Wa,-mimplicit-it=thumb -mthumb-interwork
endif

CURRENT_DIR := $(shell pwd)
PKG_TARBALL := iperf-3.17.1.tar.gz
PKG_NAME := iperf-3.17.1
PKG_BIN := out

all:
	@test -f $(PKG_TARBALL) && echo "$(PKG_TARBALL) found" || \
		(echo "$(PKG_TARBALL) not found, please download it $(shell cat readme_[ce]n.txt)" && exit -1)
	@test -f $(PKG_BIN)/usr/bin/iperf3 || (\
	rm -rf $(CURRENT_DIR)/$(PKG_NAME); \
	tar -xf $(PKG_TARBALL); \
	mkdir -p $(CURRENT_DIR)/$(PKG_NAME)/$(PKG_BIN); \
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN)/usr/; \
	pushd $(CURRENT_DIR)/$(PKG_NAME)/; \
		CC=$(SYSDRV_CROSS)-gcc \
		CXX=$(SYSDRV_CROSS)-g++ \
		CFLAGS="$(SYSDRV_CROSS_CFLAGS)" \
		./configure --host=$(SYSDRV_CROSS) --target=$(SYSDRV_CROSS) \
			--prefix=$(CURRENT_DIR)/$(PKG_BIN); \
		make -j$(SYSDRV_JOBS) > /dev/null || exit -1; \
		make install > /dev/null; \
	popd; )
	$(call MAROC_COPY_PKG_TO_SYSDRV_OUTPUT, $(SYSDRV_DIR_OUT_ROOTFS), $(PKG_BIN))

clean: distclean

distclean:
	-rm -rf $(PKG_NAME) $(PKG_BIN)

