
MAKEFILE_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
export LC_ALL=C
SHELL:=/bin/bash
MAKE=make
AT?=@

################################################################################
##   Platform Specified  Configuraton
################################################################################
include $(MAKEFILE_DIR)/Makefile.param

################################################################################
##   Public Configuraton
################################################################################

app_src := $(wildcard ./*/Makefile ./component/fastboot_server/Makefile ./component/ao_record_service/Makefile)
app_src := $(dir $(app_src))

all: $(pkg-build)
	$(foreach target,$(app_src),make -C $(target)||exit -1;)

	@mkdir -p $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d
	@cp $(MAKEFILE_DIR)/S50_gpio_setup $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/S50_gpio_setup
	@chmod a+x $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/S50_gpio_setup

	@cp -fa $(MAKEFILE_DIR)/S53_guard $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d
	@chmod a+x $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/S53_guard

	# Wi-Fi Integration
	# 1. �start_wifi.sh
	@mkdir -p $(RK_APP_OUTPUT)/usr
	@cp -fa $(MAKEFILE_DIR)/wifi/start_wifi_onlyInsmod.sh $(RK_APP_OUTPUT)/usr/start_wifi.sh
	@chmod a+x $(RK_APP_OUTPUT)/usr/start_wifi.sh
	# 2.  S51_wifi
	@mkdir -p $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d
	@cp -fa $(MAKEFILE_DIR)/wifi/S51_wifi $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/
	@chmod a+x $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/S51_wifi

	# Bluetooth Integration
	# Target Directories
	@mkdir -p $(RK_APP_OUTPUT)/userdata/rx96x/fw
	@mkdir -p $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d

# 	# Binaries (Install to usr/bin, build.sh will handle moving it to OEM partition)
# 	@mkdir -p $(RK_APP_OUTPUT)/usr/bin
# 	@cp -fa $(MAKEFILE_DIR)/../dbus-daemon $(RK_APP_OUTPUT)/usr/bin/

		# Firmware: prefer project/oem/firmware (public-friendly), fallback to InternalProjects.
		# Missing firmware is a hard error and must fail the build.
		@BT_FW_OEM_DIR="$(MAKEFILE_DIR)/../oem/firmware"; \
		BT_FW_INTERNAL_DIR="$(MAKEFILE_DIR)/../../InternalProjects/bt_service/bt/rk96x_bt_bin"; \
		BT_FW_SRC_DIR=""; \
		if [ -f "$$BT_FW_OEM_DIR/rk962_bt_v2.bin" ]; then \
			BT_FW_SRC_DIR="$$BT_FW_OEM_DIR"; \
		elif [ -f "$$BT_FW_INTERNAL_DIR/rk962_bt_v2.bin" ]; then \
			BT_FW_SRC_DIR="$$BT_FW_INTERNAL_DIR"; \
		fi; \
		if [ -z "$$BT_FW_SRC_DIR" ]; then \
			echo "ERROR: bluetooth firmware source not found in $$BT_FW_OEM_DIR or $$BT_FW_INTERNAL_DIR"; \
			exit 1; \
		fi; \
		for fw in rk962_bt_v2.bin rk962_bt_rf_v2.bin rk96x_bt_loader.bin; do \
			if [ ! -f "$$BT_FW_SRC_DIR/$$fw" ]; then \
				echo "ERROR: missing bluetooth firmware $$BT_FW_SRC_DIR/$$fw"; \
				exit 1; \
			fi; \
		done; \
		for fw in rk962_bt_v2.bin rk962_bt_rf_v2.bin rk96x_bt_loader.bin; do \
			cp -fa "$$BT_FW_SRC_DIR/$$fw" $(RK_APP_OUTPUT)/userdata/rx96x/fw/; \
		done

	# Startup Script (backup to rkipc etc4oem)
	@cp -fa $(MAKEFILE_DIR)/S52_bluetooth $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/
	@chmod a+x $(RK_APP_OUTPUT)/rootfs_staging/etc/init.d/S52_bluetooth

	$(call MAROC_COPY_PKG_TO_APP_OUTPUT, $(RK_PROJECT_PATH_APP), $(RK_APP_OUTPUT))

distclean: clean

clean:
	$(foreach target,$(app_src),make clean -C $(target)||exit -1;)
	@rm -rf $(RK_APP_OUTPUT)

info:
	@$(foreach target,$(app_src),make -C $(target) info||exit 0;)
