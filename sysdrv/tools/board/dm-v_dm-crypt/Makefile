export LC_ALL

ifeq ($(SYSDRV_PARAM), )
    SYSDRV_PARAM:=../../../Makefile.param
    include $(SYSDRV_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

CONFIGURE_DEFAULT_PREFIX := --prefix= --exec-prefix= --bindir=/bin \
							--sbindir=/sbin --libdir=/lib --localstatedir=/var \
							--runstatedir=/run --sysconfdir=/etc --program-prefix=""

CURRENT_DIR := $(shell pwd)
PKG_CRYPTSETUP_TARBALL := cryptsetup-2.7.0.tar.xz
PKG_CRYPTSETUP_NAME := cryptsetup-2.7.0

PKG_LIBAIO_TARBALL := libaio-0.3.113.tar.gz
PKG_LIBAIO_NAME := libaio-0.3.113

PKG_JSONC_TARBALL := json-c-0.17.tar.gz
PKG_JSONC_NAME := json-c-0.17

PKG_LIBARGON2_TARBALL := libargon2-20190702.tar.gz
PKG_LIBARGON2_NAME := phc-winner-argon2-20190702
PKG_LIBARGON2_PRE_CFG := AR=$(SYSDRV_CROSS)-ar AS=$(SYSDRV_CROSS)-as \
						 LD=$(SYSDRV_CROSS)-ld NM=$(SYSDRV_CROSS)-nm \
						 CC=$(SYSDRV_CROSS)-gcc GCC=$(SYSDRV_CROSS)-gcc \
						 CPP=$(SYSDRV_CROSS)-cpp CXX=$(SYSDRV_CROSS)-g++ \
						 FC=$(SYSDRV_CROSS)-gfortran F77=$(SYSDRV_CROSS)-gfortran \
						 RANLIB=$(SYSDRV_CROSS)-ranlib READELF=$(SYSDRV_CROSS)-readelf \
						 STRIP=$(SYSDRV_CROSS)-strip OBJCOPY=$(SYSDRV_CROSS)-objcopy \
						 OBJDUMP=$(SYSDRV_CROSS)-objdump

PKG_LVM2_TARBALL := LVM2.2.03.14.tgz
PKG_LVM2_NAME := LVM2.2.03.14

PKG_POPT_TARBALL := popt-1.19.tar.gz
PKG_POPT_NAME := popt-1.19

PKG_BIN := out

PKG_CONF_OPTS += $(SYSDRV_CROSS_CFLAGS) $(SYSDRV_OPTS) -Os

PKG_UTIL_LINUX_PATH:=$(CURRENT_DIR)/../util-linux/
PKG_CONF_OPTS += -L$(PKG_UTIL_LINUX_PATH)/out/lib -L$(CURRENT_DIR)/$(PKG_BIN)/lib
PKG_CONF_OPTS += -I$(PKG_UTIL_LINUX_PATH)/out/include -I$(CURRENT_DIR)/$(PKG_BIN)/include

all: build-jsonc build-libargon2 build-lvm2 build-popt build-util-linux
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libcryptsetup.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(PKG_CRYPTSETUP_NAME) ; \
	tar xf $(PKG_CRYPTSETUP_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_CRYPTSETUP_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Configuration!!!\e[0m"; \
		scanf_cv_type_modifier=no \
		CFLAGS="$(PKG_CONF_OPTS)" LDFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		LIBS="-Wl,-rpath-link -Wl,$(CURRENT_DIR)/$(PKG_BIN)/lib -Wl,-rpath-link -Wl,$(CURRENT_DIR)/../util-linux/out/lib" \
		PKG_CONFIG_PATH="$(CURRENT_DIR)/$(PKG_BIN)/lib/pkgconfig" \
		./configure \
		--target=$(SYSDRV_CROSS) --host=$(SYSDRV_CROSS) $(CONFIGURE_DEFAULT_PREFIX) \
		--disable-dependency-tracking --disable-nls --disable-static \
		--enable-shared --enable-blkid --disable-asciidoc \
		--with-crypto_backend=kernel --disable-ssh-token --disable-cryptsetup \
		--disable-integritysetup || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_CRYPTSETUP_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
		rm $(CURRENT_DIR)/$(PKG_BIN)/share -rf; \
		rm $(CURRENT_DIR)/$(PKG_BIN)/{include,etc,lib/cmake,lib/cryptsetup,lib/*.a,lib/*.la,lib/pkgconfig,usr} -rf; \
	popd; )
	rm -rf $(CURRENT_DIR)/$(PKG_BIN)/include -rf
ifneq ($(PKG_OUTPUT_DIR),)
	$(call MAROC_COPY_PKG_TO_SYSDRV_OUTPUT, $(PKG_OUTPUT_DIR), $(CURRENT_DIR)/$(PKG_BIN))
endif

build-libaio:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libaio.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(CURRENT_DIR)/$(PKG_LIBAIO_NAME); \
	tar xf $(PKG_LIBAIO_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_LIBAIO_NAME); \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBAIO_NAME)] Package Building!!!\e[0m"; \
		make $(PKG_MAKE_OPTS) CC=$(SYSDRV_CROSS)-gcc -j$(SYSDRV_JOBS) || exit -1; \
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
	tar xf $(PKG_JSONC_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_JSONC_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_JSONC_NAME)] Package Building!!!\e[0m"; \
		cmake $(CURRENT_DIR)/$(PKG_JSONC_NAME)/ \
			-DCMAKE_C_COMPILER=$(SYSDRV_CROSS)-gcc \
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
	tar xf $(PKG_LIBARGON2_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_LIBARGON2_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBARGON2_NAME)] Package Building!!!\e[0m"; \
		$(PKG_LIBARGON2_PRE_CFG) CFLAGS="$(SYSDRV_CROSS_CFLAGS)" \
			make -j$(SYSDRV_JOBS) LIBRARY_REL=lib || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LIBARGON2_NAME)] Package Installing!!!\e[0m"; \
		make install LIBRARY_REL=lib DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) PREFIX="" || exit -1 ; \
	popd ) || exit -1 ;

build-util-linux:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libuuid.so || (\
		make -C $(PKG_UTIL_LINUX_PATH) clean ; \
		make -C $(PKG_UTIL_LINUX_PATH) __DM_V_DM_CRYPT_DIR__=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
	)

build-lvm2: build-libaio
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/liblvm2cmd.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(CURRENT_DIR)/$(PKG_LVM2_NAME) ; \
	tar xf $(PKG_LVM2_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_LVM2_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Configuration!!!\e[0m"; \
		CFLAGS="$(PKG_CONF_OPTS)" CPPFLAGS="$(PKG_CONF_OPTS)" \
		LIBS="$(PKG_CONF_OPTS)" \
		ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes \
		./configure --host=$(SYSDRV_CROSS) --target=$(SYSDRV_CROSS) \
			$(CONFIGURE_DEFAULT_PREFIX) \
			--disable-gtk-doc --disable-gtk-doc-html --disable-doc --disable-docs \
			--disable-documentation --with-xmlto=no --with-fop=no \
			--disable-dependency-tracking --enable-ipv6 --disable-nls \
			--disable-static --enable-shared  --enable-write_install \
			--enable-pkgconfig --enable-cmdlib --enable-dmeventd --disable-nls \
			--with-symvers=no --disable-readline --disable-selinux \
			--without-python --disable-asciidoc || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_LVM2_NAME)] Package Installing Fixed!!!\e[0m"; \
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/share/ \
	popd )

build-popt:
	@test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libpopt.so || (\
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	rm -rf $(PKG_POPT_NAME) ; \
	tar xf $(PKG_POPT_TARBALL) || exit -1 ; \
	pushd $(CURRENT_DIR)/$(PKG_POPT_NAME)/; \
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Configuration!!!\e[0m"; \
		./configure --host=$(SYSDRV_CROSS) --target=$(SYSDRV_CROSS) \
			$(CONFIGURE_DEFAULT_PREFIX) \
			--disable-gtk-doc --disable-gtk-doc-html --disable-doc \
			--disable-docs --disable-documentation --with-xmlto=no \
			--with-fop=no --disable-dependency-tracking --enable-ipv6 \
			--disable-nls --disable-static --enable-shared || exit -1;\
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Building!!!\e[0m"; \
		make -j$(SYSDRV_JOBS) || exit -1; \
		echo ""; echo -e "\e[30;47m[$(PKG_POPT_NAME)] Package Installing!!!\e[0m"; \
		make install DESTDIR=$(CURRENT_DIR)/$(PKG_BIN) || exit -1;\
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/share ; \
	popd )

clean: distclean

distclean:
	-rm -rf $(PKG_CRYPTSETUP_NAME) $(PKG_BIN) $(PKG_LIBAIO_NAME) $(PKG_LIBAIO_NAME) \
		$(PKG_JSONC_NAME) $(PKG_LIBARGON2_NAME) $(PKG_LVM2_NAME) $(PKG_POPT_NAME)
