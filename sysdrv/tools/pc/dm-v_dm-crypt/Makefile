export LC_ALL

SYSDRV_JOBS:=$(shell grep -c ^processor /proc/cpuinfo)
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)
PKG_UTIL_LINUX_TARBALL := $(CURRENT_DIR)/../../board/util-linux/util-linux-2.37.2.tar.xz
PKG_UTIL_LINUX_NAME := util-linux-2.37.2
PKG_BIN := out
PKG_PATCHES_UTIL_LINUX:=$(CURRENT_DIR)/../../board/util-linux/patches

PKG_UTIL_LINUX_FEATURES := --disable-nls --disable-rpath --disable-makeinstall-chown \
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

PKG_UTIL_LINUX_FEATURES += --enable-libuuid

CONFIGURE_DEFAULT_PREFIX := --prefix= --exec-prefix= --bindir=/bin \
							--sbindir=/sbin --libdir=/lib --localstatedir=/var \
							--runstatedir=/run --sysconfdir=/etc --program-prefix=""

PKG_CRYPTSETUP_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/cryptsetup-2.7.0.tar.xz
PKG_CRYPTSETUP_NAME := cryptsetup-2.7.0

PKG_LIBAIO_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/libaio-0.3.113.tar.gz
PKG_LIBAIO_NAME := libaio-0.3.113

PKG_JSONC_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/json-c-0.17.tar.gz
PKG_JSONC_NAME := json-c-0.17

PKG_LIBARGON2_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/libargon2-20190702.tar.gz
PKG_LIBARGON2_NAME := phc-winner-argon2-20190702

PKG_LVM2_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/LVM2.2.03.14.tgz
PKG_LVM2_NAME := LVM2.2.03.14

PKG_POPT_TARBALL := $(CURRENT_DIR)/../../board/dm-v_dm-crypt/popt-1.19.tar.gz
PKG_POPT_NAME := popt-1.19

PKG_CONF_OPTS += -fPIC -L$(CURRENT_DIR)/out/lib -L$(CURRENT_DIR)/$(PKG_BIN)/lib
PKG_CONF_OPTS += -I$(CURRENT_DIR)/out/include -I$(CURRENT_DIR)/$(PKG_BIN)/include

PKG_TAEGETS := build-cryptsetup

all: $(PKG_TAEGETS)
	@echo "All Done"

build-cryptsetup: build-jsonc build-libargon2 build-lvm2 build-popt
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/veritysetup || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(PKG_CRYPTSETUP_NAME) ; \
	tar xf $(PKG_CRYPTSETUP_TARBALL); \
	pushd $(CURRENT_DIR)/$(PKG_CRYPTSETUP_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Configuration!!!\e[0m"; \
		scanf_cv_type_modifier=no \
		CFLAGS="$(PKG_CONF_OPTS)" LDFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		LIBS="-Wl,-rpath-link -Wl,$(CURRENT_DIR)/$(PKG_BIN)/lib \
			-Wl,-rpath -Wl,./lib \
			-Wl,-rpath-link -Wl,$(CURRENT_DIR)/../util-linux/out/lib" \
		PKG_CONFIG_PATH="$(CURRENT_DIR)/$(PKG_BIN)/lib/pkgconfig" \
		./configure \
		$(CONFIGURE_DEFAULT_PREFIX) \
		--disable-dependency-tracking --disable-nls --disable-static \
		--disable-shared --enable-blkid --disable-asciidoc \
		--with-crypto_backend=kernel --disable-ssh-token --disable-cryptsetup \
		--disable-integritysetup || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
		rm $(CURRENT_DIR)/$(PKG_BIN)/share -rf; \
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/{etc,include,usr,lib/cmake,lib/cryptsetup,lib/*.a,lib/*.la,lib/pkgconfig}; \
		mkdir -p $(CURRENT_DIR)/$(PKG_BIN)/dm-v_dm-crypt; \
		mv $(CURRENT_DIR)/$(PKG_BIN)/sbin/*  $(CURRENT_DIR)/$(PKG_BIN)/; \
	popd; )
	@echo "build done"
ifneq ($(PKG_OUTPUT_DIR),)
	mkdir -p $(PKG_OUTPUT_DIR)
	cp -rfa $(CURRENT_DIR)/$(PKG_BIN)/* $(PKG_OUTPUT_DIR)/
endif

build-libaio:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libaio.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(CURRENT_DIR)/$(PKG_LIBAIO_NAME); \
	tar xf $(PKG_LIBAIO_TARBALL); \
	pushd $(CURRENT_DIR)/$(PKG_LIBAIO_NAME); \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBAIO_NAME)] Package Building!!!\e[0m"; \
		make $(PKG_MAKE_OPTS) -j$(SYSDRV_JOBS) || exit -1; \
		DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) \
		make -C src install prefix=$(CURRENT_DIR)/$(PKG_BIN) \
				    includedir=$(CURRENT_DIR)/$(PKG_BIN)/include \
				    libdir=$(CURRENT_DIR)/$(PKG_BIN)/lib || exit -1; \
	popd; \
	)

build-jsonc:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libjson-c.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(PKG_JSONC_NAME) ; \
	tar xf $(PKG_JSONC_TARBALL); \
	pushd $(CURRENT_DIR)/$(PKG_JSONC_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_JSONC_NAME)] Package Building!!!\e[0m"; \
		cmake $(CURRENT_DIR)/$(PKG_JSONC_NAME)/ \
			-DCMAKE_INSTALL_PREFIX="" \
			-DCMAKE_PREFIX="" \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_COLOR_MAKEFILE=OFF \
			-DBUILD_TESTING=OFF \
			-DBUILD_SHARED_LIBS=ON \
			-DDISABLE_EXTRA_LIBS=ON || exit -1 ;\
		echo ""; echo -e "\e[30;47m[$(PKG_JSONC_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_JSONC_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
	popd; ) || exit -1;

build-libargon2:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libargon2.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(CURRENT_DIR)/$(PKG_LIBARGON2_NAME) ; \
	tar xf $(PKG_LIBARGON2_TARBALL); \
	pushd $(CURRENT_DIR)/$(PKG_LIBARGON2_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBARGON2_NAME)] Package Building!!!\e[0m"; \
			make -j$(SYSDRV_JOBS) LIBRARY_REL=lib || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBARGON2_NAME)] Package Installing!!!\e[0m"; \
		make install LIBRARY_REL=lib DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) PREFIX="" || exit -1 ; \
	popd ) || exit -1 ;

build-util-linux:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libblkid.so || (\
	rm -rf $(PKG_UTIL_LINUX_NAME) ; \
	tar xf $(PKG_UTIL_LINUX_TARBALL) ; \
	pushd $(CURRENT_DIR)/$(PKG_UTIL_LINUX_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_UTIL_LINUX_NAME)] Package Building!!!\e[0m"; \
		cp -rf $(PKG_PATCHES_UTIL_LINUX)/* . && ./util-linux.patch.sh; \
		scanf_cv_type_modifier=no \
		CFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		./configure \
		--prefix= --exec-prefix= --bindir=/bin \
		--sbindir=/sbin --libdir=/lib --localstatedir=/var \
		--runstatedir=/run --sysconfdir=/etc --program-prefix="" \
		$(PKG_UTIL_LINUX_FEATURES) || exit -1 \
		make -j$(SYSDRV_JOBS) || exit -1; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN); \
		rm -rf	$(CURRENT_DIR)/$(PKG_BIN)/bin \
			$(CURRENT_DIR)/$(PKG_BIN)/sbin \
			$(CURRENT_DIR)/$(PKG_BIN)/share \
			$(CURRENT_DIR)/$(PKG_BIN)/usr ; \
	popd; )

build-lvm2: build-libaio build-util-linux
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/liblvm2cmd.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(CURRENT_DIR)/$(PKG_LVM2_NAME) ; \
	tar xf $(PKG_LVM2_TARBALL); \
	pushd $(CURRENT_DIR)/$(PKG_LVM2_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Configuration!!!\e[0m"; \
		CFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		LIBS="$(PKG_CONF_OPTS) -laio" \
		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes \
		./configure \
			$(CONFIGURE_DEFAULT_PREFIX) \
			--disable-dependency-tracking --disable-nls \
			--enable-write_install \
			--enable-pkgconfig --enable-cmdlib --enable-dmeventd --disable-nls \
			--with-symvers=no --disable-readline --disable-selinux  || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) V=2 || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Installing Fixed!!!\e[0m"; \
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/share/; \
	popd )

build-popt:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libpopt.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(PKG_POPT_NAME) ; \
	tar xf $(PKG_POPT_TARBALL) ; \
	pushd $(CURRENT_DIR)/$(PKG_POPT_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Configuration!!!\e[0m"; \
		./configure \
			$(CONFIGURE_DEFAULT_PREFIX) \
			--disable-gtk-doc --disable-gtk-doc-html --disable-doc \
			--disable-docs --disable-documentation --with-xmlto=no \
			--with-fop=no --disable-dependency-tracking --enable-ipv6 \
			--disable-nls --disable-static || exit -1;\
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1;\
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/share ; \
	popd )

clean: distclean

distclean:
	-rm -rf $(PKG_CRYPTSETUP_NAME) $(PKG_BIN) $(PKG_LIBAIO_NAME) $(PKG_LIBAIO_NAME) \
		$(PKG_JSONC_NAME) $(PKG_LIBARGON2_NAME) $(PKG_LVM2_NAME) $(PKG_POPT_NAME) $(PKG_UTIL_LINUX_NAME)
