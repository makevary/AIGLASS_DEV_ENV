#!/bin/bash
# SPDX-License-Identifier: BSD-3-Clause */
# Copyright (c) 2024 Rockchip Electronics Co., Ltd.

set -e

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

usage() {
	echo "usage: ./mkimage.sh"
}

CUR_DIR=$(pwd)
IMAGE=$(pwd)/Image
RKBIN=$(pwd)/rkbin

test -d $IMAGE || mkdir $IMAGE
cat $RKBIN/hpmcu_start.bin $CUR_DIR/rtthread.bin > $IMAGE/hpmcu.img

echo 'Image: hpmcu.img is ready.'
