export LC_ALL

ifeq ($(SYSDRV_PARAM), )
    SYSDRV_PARAM:=../../../Makefile.param
    include $(SYSDRV_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)
PKG_TARBALL := util-linux-2.37.2.tar.xz
PKG_NAME := util-linux-2.37.2
CURRENT_DIR := $(shell pwd)
PKG_BIN := out
PKG_PATCHES_UTIL_LINUX:=$(CURRENT_DIR)/patches

PKG_FEATURES := --disable-nls --disable-rpath --disable-makeinstall-chown \
		--without-systemd --with-systemdsystemunitdir=no --without-ncursesw \
		--without-ncurses --disable-widechar --without-selinux \
		--disable-all-programs --disable-agetty --disable-bfs \
		--disable-cal --disable-chfn-chsh --disable-chmem \
		--disable-cramfs --disable-eject --disable-fallocate \
		--disable-fdformat --disable-fsck --disable-hwclock \
		--disable-ipcrm --disable-ipcs --disable-kill \
		--disable-last --disable-write --disable-libfdisk \
		--disable-libmount --disable-libsmartcols --disable-line \
		--disable-logger --disable-login --disable-losetup \
		--disable-lslogins --disable-lsmem --disable-mesg \
		--disable-minix --disable-more --disable-mount \
		--disable-mountpoint --disable-newgrp --disable-nologin \
		--disable-nsenter --disable-partx --disable-pg \
		--disable-pivot_root --disable-raw --disable-rename \
		--disable-rfkill --disable-runuser --disable-schedutils \
		--disable-setpriv --disable-setterm --disable-su \
		--disable-sulogin --disable-switch_root --disable-tunelp \
		--disable-ul --disable-unshare --disable-utmpdump \
		--disable-vipw --disable-wall --disable-wdctl \
		--disable-zramctl --without-python --without-readline \
		--without-audit --disable-static --enable-shared \
		--disable-dependency-tracking --enable-libblkid

ifneq ($(__DM_V_DM_CRYPT_DIR__),)
PKG_FEATURES += --enable-libuuid
PKG_OUTPUT_DIR := $(__DM_V_DM_CRYPT_DIR__)
else
PKG_FEATURES += --disable-libuuid
endif

PKG_CONF_OPTS += $(SYSDRV_CROSS_CFLAGS) $(SYSDRV_OPTS) -Os

all:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libblkid.so.1.1.0 || (\
	rm -rf $(PKG_NAME) ; \
	tar xf $(PKG_TARBALL) ; \
	pushd $(CURRENT_DIR)/$(PKG_NAME)/; \
		cp -rf $(PKG_PATCHES_UTIL_LINUX)/* . && ./util-linux.patch.sh; \
		scanf_cv_type_modifier=no \
		CFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		./configure \
		--target=$(SYSDRV_CROSS) \
		--host=$(SYSDRV_CROSS) \
		--prefix= --exec-prefix= --bindir=/bin \
		--sbindir=/sbin --libdir=/lib --localstatedir=/var \
		--runstatedir=/run --sysconfdir=/etc --program-prefix="" \
		$(PKG_FEATURES) || exit -1 \
		make -j$(SYSDRV_JOBS) || exit -1; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN); \
		rm -rf	$(CURRENT_DIR)/$(PKG_BIN)/bin \
			$(CURRENT_DIR)/$(PKG_BIN)/sbin \
			$(CURRENT_DIR)/$(PKG_BIN)/share \
			$(CURRENT_DIR)/$(PKG_BIN)/usr ; \
	popd; )
	$(call MAROC_COPY_PKG_TO_SYSDRV_OUTPUT, $(SYSDRV_DIR_OUT_ROOTFS), $(CURRENT_DIR)/$(PKG_BIN))
ifneq ($(__DM_V_DM_CRYPT_DIR__),)
	cp -rfa $(CURRENT_DIR)/$(PKG_BIN)/* $(__DM_V_DM_CRYPT_DIR__)
endif

clean: distclean

distclean:
	-rm -rf $(PKG_NAME) $(PKG_BIN)
