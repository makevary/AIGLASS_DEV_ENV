
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
PKG_TARBALL := lrzsz-0.12.20.tar.gz
PKG_NAME := lrzsz-0.12.20
PKG_BIN := out

all:
	@test -f $(PKG_BIN)/usr/sbin/sz || (\
	rm -rf $(CURRENT_DIR)/$(PKG_NAME); \
	tar -xf $(PKG_TARBALL); \
	mkdir -p $(CURRENT_DIR)/$(PKG_NAME)/$(PKG_BIN); \
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN)/usr/; \
	pushd $(CURRENT_DIR)/$(PKG_NAME)/; \
		CC=$(SYSDRV_CROSS)-gcc \
		CXX=$(SYSDRV_CROSS)-g++ \
		CFLAGS="$(SYSDRV_CROSS_CFLAGS)" \
		./configure --host=$(SYSDRV_CROSS) --target=$(SYSDRV_CROSS) \
			--prefix=$(CURRENT_DIR)/$(PKG_BIN) \
			--disable-nls \
			--disable-timesync; \
		make -j$(SYSDRV_JOBS) > /dev/null || exit -1; \
		make install > /dev/null; \
		cd $(CURRENT_DIR)/$(PKG_BIN)/bin; \
		rm -f lrb lrx lsx lsb; \
		mv lsz sz; \
		mv lrz rz; \
		cd $(CURRENT_DIR)/$(PKG_BIN)/; \
		rm -rf man usr; \
	popd; )
	$(call MAROC_COPY_PKG_TO_SYSDRV_OUTPUT, $(SYSDRV_DIR_OUT_ROOTFS), $(PKG_BIN))

clean: distclean

distclean:
	-rm -rf $(PKG_NAME) $(PKG_BIN)

