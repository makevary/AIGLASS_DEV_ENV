ifeq ($(COMPILE_FOR_BUILDROOT),)
ifeq ($(MEDIA_PARAM), )
    MEDIA_PARAM:=../Makefile.param
    include $(MEDIA_PARAM)
endif
endif

ifneq ($(V),)
export CMD_DBG=
else
export CMD_DBG=@
endif

ifneq ($(findstring $(RK_ENABLE_SAMPLE),n y),)
CONFIG_RK_SAMPLE=$(RK_ENABLE_SAMPLE)
else
CONFIG_RK_SAMPLE=y
endif

CURRENT_DIR := $(shell pwd)

ifeq ($(rk_static),1)
export BUILD_STATIC_LINK=y
else
export BUILD_STATIC_LINK=n
endif

ifeq ($(RK_MEDIA_SAMPLE_STATIC_LINK),y)
export BUILD_STATIC_LINK=y
else
export BUILD_STATIC_LINK=n
endif

PKG_NAME := sample
PKG_BUILD ?= build

all: $(PKG_TARGET)
ifeq ($(CONFIG_RK_SAMPLE),y)
ifeq ($(COMPILE_FOR_BUILDROOT),y)
	$(CMD_DBG)make -C $(CURRENT_DIR)/simple_test/
	$(CMD_DBG)make -C $(CURRENT_DIR)/example/
else
	$(CMD_DBG)make -C $(CURRENT_DIR)/simple_test/ -j$(RK_MEDIA_JOBS)
	$(CMD_DBG)make -C $(CURRENT_DIR)/example/ -j$(RK_MEDIA_JOBS)
endif
endif
	$(CMD_DBG)echo "build $(PKG_NAME) done";

example-build:

simple_test-build:

clean:
	$(CMD_DBG)make -C $(CURRENT_DIR)/example/ clean
	$(CMD_DBG)make -C $(CURRENT_DIR)/simple_test/ clean

help:
	$(CMD_DBG)echo "help message:"
	$(CMD_DBG)echo "     build with dynamic link:  make "
	$(CMD_DBG)echo "     build with static  link:  make rk_static=1"

distclean: clean
