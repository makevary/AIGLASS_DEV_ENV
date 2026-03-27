
ifeq ($(MEDIA_PARAM), )
    MEDIA_PARAM:=../Makefile.param
    include $(MEDIA_PARAM)
endif

export LC_ALL=C
SHELL:=/bin/bash

CURRENT_DIR := $(shell pwd)
PKG_LIB_INSTALL_PATH := lib
PKG_BIN ?= out

ifeq ($(RK_MEDIA_CHIP), rv1103b)
PKG_COPY_TARGET := _PKG_THIRD_
endif

ifeq ($(RK_MEDIA_CHIP), rv1106)
PKG_COPY_TARGET := _PKG_FIRST_
endif

ifeq ($(RK_MEDIA_CHIP), rv1126)
PKG_COPY_TARGET := _PKG_SECOND_
endif
PKG_TARGET := rk_post_isp-build

ifeq ($(PKG_BIN),)
$(error ### $(CURRENT_DIR): PKG_BIN is NULL, Please Check !!!)
endif

all: $(PKG_TARGET)
	@echo "build $(PKG_NAME) done";
	$(call MAROC_COPY_PKG_TO_MEDIA_OUTPUT, $(RK_MEDIA_OUTPUT), $(PKG_BIN))

rk_post_isp-build:
	@rm -rf $(PKG_BIN);
	@mkdir -p $(PKG_BIN)/lib;
	cp -rfa $(RK_MEDIA_CHIP)/*.so  $(PKG_BIN)/lib;
	cp -rfa $(RK_MEDIA_CHIP)/*.a  $(PKG_BIN)/lib;
ifeq ($(PKG_COPY_TARGET), _PKG_FIRST_)
	cp -rfa $(RK_MEDIA_CHIP)/*.aiisp  $(PKG_BIN)/lib;
endif
ifeq ($(PKG_COPY_TARGET), _PKG_SECOND_)
	cp -rfa $(RK_MEDIA_CHIP)/model_list_gamma/rkmodel_1520_2688.aiisp  $(PKG_BIN)/lib;
endif
ifeq ($(PKG_COPY_TARGET), _PKG_THIRD_)
	cp -rfa $(RK_MEDIA_CHIP)/*.aiisp  $(PKG_BIN)/lib;
	cp -rfa $(RK_MEDIA_CHIP)/*.meh  $(PKG_BIN)/lib;
endif

clean: distclean

distclean:
	-rm -rf $(PKG_BIN)
