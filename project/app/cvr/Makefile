
ifeq ($(APP_PARAM), )
    APP_PARAM:=../Makefile.param
    include $(APP_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)
include rkadk.cfg.mk

PKG_NAME := cvr
PKG_BIN ?= out
PKG_BUILD ?= build

# debug: build cmake with more message
PKG_CONF_OPTS += -DCMAKE_VERBOSE_MAKEFILE=ON

RK_RKCVR_CONFIG :=
ifneq (, $(filter RKCVR_RV1106, $(RK_APP_TYPE)))
	RK_RKCVR_CONFIG := -DSOC_RV1106=ON
else ifneq (, $(filter RKCVR_RV1103B, $(RK_APP_TYPE)))
	RK_RKCVR_CONFIG := -DSOC_RV1103B=ON
else ifneq (, $(filter RKCVR_RV1126, $(RK_APP_TYPE)))
	RK_RKCVR_CONFIG := -DSOC_RV1126=ON
endif

ifneq (, $(filter RKCVR_FASTBOOT, $(RK_APP_TYPE)))
	PKG_CONF_OPTS += -DUSE_RKFASTBOOT=ON
endif

ifeq ($(BR2_PACKAGE_RKADK_USE_AIQ), y)
	PKG_CONF_OPTS += -DUSE_RKAIQ=ON
endif

# enable rockauto
#PKG_CONF_OPTS += -DUSE_RKAUTO=ON

# enable rockaudio
#PKG_CONF_OPTS += -DUSE_RKAUDIO=ON

# enable aov
#PKG_CONF_OPTS += -DUSE_RKAOV=ON

# enable filecache
PKG_CONF_OPTS += -DUSE_FILECACHE=ON

RK_APP_CFLAGS = -I $(RK_APP_MEDIA_INCLUDE_PATH) \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/libdrm \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/uAPI \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/uAPI2 \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/algos \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/common \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/xcore \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/iq_parser \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rkaiq/iq_parser_v2 \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rockauto \
				-I $(RK_APP_OUTPUT)/include \
				-I $(RK_APP_OUTPUT)/include/freetype2 \
				-I $(RK_APP_OUTPUT)/include/libjpeg9 \
				-I $(RK_APP_OUTPUT)/include/rkadk

ifeq ($(RK_ENABLE_LVGL), y)
RK_APP_CFLAGS += -I $(RK_APP_OUTPUT)/include/lvgl
PKG_CONF_OPTS += -DUSE_LVGL=ON
endif

RK_APP_LDFLAGS = -L $(RK_APP_MEDIA_LIBS_PATH) -L $(RK_APP_OUTPUT)/lib

RK_APP_OPTS += -Wl,-rpath-link,$(RK_APP_MEDIA_LIBS_PATH):$(RK_APP_PATH_LIB_INCLUDE)/root/usr/lib
PKG_CONF_OPTS += -DCMAKE_C_FLAGS="$(RK_APP_CFLAGS) $(RK_APP_LDFLAGS) $(RK_APP_OPTS)" \
				-DCMAKE_CXX_FLAGS="$(RK_APP_CFLAGS) $(RK_APP_LDFLAGS) $(RK_APP_OPTS)"

PKG_CONF_OPTS += -DRKCVR_CROSS_COMPILE="$(RK_APP_CROSS)"

ifneq ($(RK_RKCVR_CONFIG),)
PKG_TARGET := rkcvr-build
endif

ifeq ($(PKG_BIN),)
$(error ### $(CURRENT_DIR): PKG_BIN is NULL, Please Check !!!)
endif

all: $(PKG_TARGET)
	@echo "build $(PKG_NAME) done"

lvgl-build:
	@test ! -d $(RK_APP_COMPONENT)/lvgl || make -C $(RK_APP_COMPONENT)/lvgl

rkadk-build:
	@test ! -d $(RK_APP_COMPONENT)/rkadk || make -C $(RK_APP_COMPONENT)/rkadk

rkcvr-build: lvgl-build rkadk-build
	@echo "RK_APP_CHIP is $(RK_APP_CHIP)"
	@echo "RK_APP_TYPE is $(RK_APP_TYPE)"
	rm -rf $(PKG_BIN) $(PKG_BUILD); \
	mkdir -p $(PKG_BIN);
	mkdir -p $(PKG_BUILD);
	pushd $(PKG_BUILD)/; \
		rm -rf CMakeCache.txt; \
		cmake $(CURRENT_DIR)/$(PKG_NAME)/ \
			-DCMAKE_C_COMPILER=$(RK_APP_CROSS)-gcc \
			-DCMAKE_CXX_COMPILER=$(RK_APP_CROSS)-g++ \
			-DCMAKE_INSTALL_PREFIX="$(CURRENT_DIR)/$(PKG_BIN)" \
			-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_COLOR_MAKEFILE=OFF \
			-DCMAKE_SYSTEM_NAME=Linux \
			$(RK_RKCVR_CONFIG) \
			$(PKG_CONF_OPTS) ;\
			make -j$(RK_APP_JOBS) || exit -1; \
			make install; \
	popd;
	$(call MAROC_COPY_PKG_TO_APP_OUTPUT, $(RK_APP_OUTPUT), $(PKG_BIN))

clean:
	@rm -rf $(PKG_BIN) $(PKG_BUILD)

distclean: clean

info:
ifneq ($(RK_RKCVR_CONFIG),)
	@echo -e "$(C_YELLOW)-------------------------------------------------------------------------$(C_NORMAL)"
	@echo -e "RK_APP_TYPE=$(RK_APP_TYPE)"
	@echo -e "option support as follow:"
	@echo -e "$(C_YELLOW)-------------------------------------------------------------------------$(C_NORMAL)"
endif
