
ifeq ($(APP_PARAM), )
    APP_PARAM:=../../Makefile.param
    include $(APP_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)

PKG_NAME := ao_record_service
PKG_BIN ?= out
COMM_DIR := $(CURRENT_DIR)/common
COMM_SRC := $(wildcard $(COMM_DIR)/*.c)
COMM_OBJ := $(COMM_SRC:%.c=%.o)

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
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/rk_stream \
				-I $(RK_APP_OUTPUT)/include \
				-I $(RK_APP_OUTPUT)/include/freetype2 \
				-I $(COMM_DIR) \
				-I $(RK_APP_MEDIA_INCLUDE_PATH)/easymedia \

RK_APP_LDFLAGS = -L $(RK_APP_MEDIA_LIBS_PATH) -L$(RK_APP_OUTPUT)/lib -L$(CURRENT_DIR)/lib

RK_APP_OPTS += -Wl,-rpath-link,$(RK_APP_MEDIA_LIBS_PATH):$(RK_APP_PATH_LIB_INCLUDE)/root/usr/lib:$(RK_APP_OUTPUT)/lib

ifneq (, $(filter RK_AO_RECORD_SERVICE, $(RK_APP_TYPE)))
AO_RECORD_SERVICE_SRC := ao_record_service.c
AO_RECORD_PKG_LDFLAGS := -Wl,-Bstatic -Wl,-Bdynamic

AO_RECORD_PKG_LDFLAGS += -Wl,-Bstatic \
			-lrockit_full -lrockchip_mpp -lrksysutils -lstdc++ \
			-Wl,-Bdynamic -lrkmuxer -lrga -ldrm -lrkaiq -lrkrawstream -lfreetype \
			-ldl
endif

ifneq ($(filter RK_AO_RECORD_SERVICE,$(RK_APP_TYPE)),)
PKG_TARGET := ao_record_service-build
endif

ifeq ($(PKG_BIN),)
$(error ### $(CURRENT_DIR): PKG_BIN is NULL, Please Check !!!)
endif

all: $(PKG_TARGET)
	@echo "build $(PKG_NAME) done"

ao_record_service-build: thirdlibs-build
	rm -rf $(PKG_BIN); \
	mkdir -p $(PKG_BIN)/bin;
	@echo "$(PKG_NAME) building $(AO_RECORD_SERVICE_SRC)"
	@$(RK_APP_CROSS)-gcc $(AO_RECORD_SERVICE_SRC) $(COMM_SRC) -o $(PKG_BIN)/bin/ao_record_service \
		-O2 -mthumb -mthumb-interwork \
		-fdata-sections -ffunction-sections -Wl,--gc-sections \
		$(RK_APP_LDFLAGS) $(RK_APP_CFLAGS) \
		-L$(RK_APP_MEDIA_LIBS_PATH)/lib \
		$(AO_RECORD_PKG_LDFLAGS)
	@test -z $(PKG_TARGET_RES_DIR) || (mkdir -p $(PKG_TARGET_RES_DIR); cp $(CURRENT_DIR)/osd_image.data $(PKG_TARGET_RES_DIR);)
	$(call MAROC_COPY_PKG_TO_APP_OUTPUT, $(RK_APP_OUTPUT), $(PKG_BIN))

thirdlibs-build:
	@test ! -d $(RK_APP_COMPONENT)/third_libs || make -C $(RK_APP_COMPONENT)/third_libs

clean:
	@rm -rf $(PKG_BIN)

distclean: clean

info:
ifneq ($(RK_ENABLE_FASTBOOT),)
	@echo -e "$(C_YELLOW)-------------------------------------------------------------------------$(C_NORMAL)"
endif
