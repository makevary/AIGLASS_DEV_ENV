export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR ?= $(shell pwd)

all:
ifneq ($(SYSDRV_DIR_OUT_PC),)
	cp -f $(CURRENT_DIR)/mkfs.jffs2   $(SYSDRV_DIR_OUT_PC);
	cp -f $(CURRENT_DIR)/mkfs.ubifs   $(SYSDRV_DIR_OUT_PC);
	cp -f $(CURRENT_DIR)/ubinize   $(SYSDRV_DIR_OUT_PC);
	cp -f $(CURRENT_DIR)/mkfs_ubi.sh $(SYSDRV_DIR_OUT_PC);
	cp -f $(CURRENT_DIR)/mkfs_jffs2.sh $(SYSDRV_DIR_OUT_PC);
endif

PKG_TARBALL_ZLIB:=$(CURRENT_DIR)/../../board/toolkits/zlib/zlib-1.2.11.tar.xz
PKG_NAME_ZLIB:=zlib-1.2.11

PKG_TARBALL_LZO:=lzo-2.10.tar.gz
PKG_NAME_LZO:=lzo-2.10

PKG_TARBALL_MTD_UTILS:=$(CURRENT_DIR)/../../board/mtd-utils/mtd-utils-2.0.1.tar.bz2
PKG_NAME_MTD_UTILS:=mtd-utils-2.0.1

PKG_BIN:=out

build-mtd-utils: build-zlib build-lzo
	$(AT)test -f $(CURRENT_DIR)/$(PKG_BIN)/sbin/mkfs.jffs2 || (\
	rm -rf $(PKG_NAME_MTD_UTILS); \
	tar -xf $(PKG_TARBALL_MTD_UTILS); \
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	pushd $(CURRENT_DIR)/$(PKG_NAME_MTD_UTILS)/; \
		patch -p1 < ../0001-spi-nor-support-4KB-erase-block-size-with-experiment.patch; \
		LDFLAGS="-L$(CURRENT_DIR)/out/lib" CFLAGS="-I$(CURRENT_DIR)/out/include" \
			./configure \
			--prefix=$(CURRENT_DIR)/$(PKG_BIN) ;\
		make -j$(SYSDRV_JOBS) > /dev/null || exit -1; \
		make install > /dev/null; \
	popd; )

build-zlib:
	$(AT)test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/libz.a || (\
	rm -rf $(CURRENT_DIR)/$(PKG_BIN); \
	rm -fr $(CURRENT_DIR)/$(PKG_NAME_ZLIB)/; \
	tar -xf $(PKG_TARBALL_ZLIB); \
	mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
	pushd $(CURRENT_DIR)/$(PKG_NAME_ZLIB)/; \
			./configure \
			--prefix=$(CURRENT_DIR)/$(PKG_BIN) ;\
		make -j$(SYSDRV_JOBS) > /dev/null || exit -1; \
		make install > /dev/null; \
		rm -rf $(CURRENT_DIR)/$(PKG_BIN)/lib/libz.so*; \
	popd; )

build-lzo:
	$(AT)test ! -f $(PKG_TARBALL_LZO) && wget https://www.oberhumer.com/opensource/lzo/download/$(PKG_TARBALL_LZO) || true
	$(AT)test -f $(CURRENT_DIR)/$(PKG_BIN)/lib/liblzo2.a || (\
		tar -xf $(PKG_TARBALL_LZO); \
		mkdir -p $(CURRENT_DIR)/$(PKG_BIN); \
		pushd $(CURRENT_DIR)/$(PKG_NAME_LZO)/; \
				./configure \
				--prefix=$(CURRENT_DIR)/$(PKG_BIN) ;\
			make -j$(SYSDRV_JOBS) > /dev/null || exit -1; \
			make install > /dev/null; \
		popd; )

clean:
	@rm -rf $(CURRENT_DIR)/$(PKG_BIN) $(CURRENT_DIR)/$(PKG_NAME_MTD_UTILS) $(CURRENT_DIR)/$(PKG_NAME_ZLIB) $(CURRENT_DIR)/$(PKG_NAME_LZO)
