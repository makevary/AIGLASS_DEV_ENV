#!/bin/bash

# Target arch
export RK_ARCH=arm

# Target CHIP
export RK_CHIP=rv1103b

# Target Toolchain Cross Compile
export RK_TOOLCHAIN_CROSS=arm-rockchip831-linux-uclibcgnueabihf

# Target boot medium: emmc/spi_nor/spi_nand
export RK_BOOT_MEDIUM=spi_nor

# Config spi nor erase block size 4KB
export RK_ROOTFS_JFFS2_ERASEBLOCK_4KB=y

# Uboot defconfig
export RK_UBOOT_DEFCONFIG=rv1103b-spi-nor_defconfig

# Uboot defconfig fragment
export RK_UBOOT_DEFCONFIG_FRAGMENT=rk-sfc.config

# Kernel defconfig
export RK_KERNEL_DEFCONFIG=rv1103b_defconfig

# Kernel defconfig fragment
export RK_KERNEL_DEFCONFIG_FRAGMENT="rv1103b-ipc.config rv1103b-spi-nor.config"

# Kernel dts
export RK_KERNEL_DTS=rv1103b-evb1-v10-spi-nor.dts

#misc image
export RK_MISC=wipe_all-misc.img

# Config sensor IQ files
# RK_CAMERA_SENSOR_IQFILES format:
#     "iqfile1 iqfile2 iqfile3 ..."
# ./build.sh media and copy <SDK root dir>/output/out/media_out/isp_iqfiles/$RK_CAMERA_SENSOR_IQFILES
export RK_CAMERA_SENSOR_IQFILES="common/sc200ai_default_default.bin common/sc450ai_default_default.bin"

# Config sensor lens CAC calibrattion bin files
export RK_CAMERA_SENSOR_CAC_BIN=""

# Config CMA size in environment
export RK_BOOTARGS_CMA_SIZE="24M"

# config partition in environment
# RK_PARTITION_CMD_IN_ENV format:
#     <partdef>[,<partdef>]
#       <partdef> := <size>[@<offset>](part-name)
# Note:
#   If the first partition offset is not 0x0, it must be added. Otherwise, it needn't adding.
export RK_PARTITION_CMD_IN_ENV="64K(env),128K@64K(idblock),192K(uboot),2M(boot),6M(rootfs),640K(userdata)"

# config partition's filesystem type (squashfs is readonly)
# emmc:    squashfs/ext4
# nand:    squashfs/ubifs
# spi nor: squashfs/jffs2
# RK_PARTITION_FS_TYPE_CFG format:
#     AAAA:/BBBB/CCCC@ext4
#         AAAA ----------> partition name
#         /BBBB/CCCC ----> partition mount point
#         ext4 ----------> partition filesystem type
export RK_PARTITION_FS_TYPE_CFG=rootfs@IGNORE@squashfs,userdata@/userdata@jffs2

# config filesystem compress (Just for squashfs or ubifs)
# squashfs: lz4/lzo/lzma/xz/gzip, default xz
# ubifs:    lzo/zlib, default lzo
export RK_SQUASHFS_COMP=xz

# app config
export RK_APP_TYPE=RKIPC_RV1103B_WRAP

# build ipc web backend
export RK_APP_IPCWEB_BACKEND=y

# disable build gdb
export RK_ENABLE_GDB=n

# disable build adb
export RK_ENABLE_ADBD=n

# enable rockchip test
export RK_ENABLE_ROCKCHIP_TEST=n

export RK_PRE_BUILD_OEM_SCRIPT=rk-spi_nor-post.sh

# config AUDIO model
export RK_AUDIO_MODEL="rkaudio_model_sed_bcd.rknn"

# config AI-ISP model
export RK_AIISP_MODEL=NONE

# config NPU model
export RK_NPU_MODEL="iva_object_detection_v3_pvn_lite_640x384.data"

# config
export RK_ENABLE_EUDEV=n

# export RK_ENABLE_WIFI=y
# export RK_ENABLE_WIFI_CHIP=RTL8189FS
