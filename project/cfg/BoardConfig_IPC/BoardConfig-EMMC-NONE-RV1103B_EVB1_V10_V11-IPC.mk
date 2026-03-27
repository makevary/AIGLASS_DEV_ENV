#!/bin/bash

# Target arch
export RK_ARCH=arm

# Target CHIP
export RK_CHIP=rv1103b

# Target Toolchain Cross Compile
export RK_TOOLCHAIN_CROSS=arm-rockchip831-linux-uclibcgnueabihf

# Target boot medium: emmc/spi_nor/spi_nand
export RK_BOOT_MEDIUM=emmc

# Uboot defconfig
export RK_UBOOT_DEFCONFIG=rv1103b_defconfig

# Uboot defconfig fragment
export RK_UBOOT_DEFCONFIG_FRAGMENT=rk-emmc.config

# Kernel defconfig
export RK_KERNEL_DEFCONFIG=rv1103b_defconfig

# Kernel defconfig fragment
export RK_KERNEL_DEFCONFIG_FRAGMENT=rv1103b-evb.config

# Kernel dts
export RK_KERNEL_DTS=rv1103b-evb1-v10.dts

#misc image
export RK_MISC=wipe_all-misc.img

# Config sensor IQ files
# RK_CAMERA_SENSOR_IQFILES format:
#     "iqfile1 iqfile2 iqfile3 ..."
# ./build.sh media and copy <SDK root dir>/output/out/media_out/isp_iqfiles/$RK_CAMERA_SENSOR_IQFILES
export RK_CAMERA_SENSOR_IQFILES="common/imx219_default_default.json"

# Config sensor lens CAC calibrattion bin files
export RK_CAMERA_SENSOR_CAC_BIN=""

# Config CMA size in environment
export RK_BOOTARGS_CMA_SIZE="28M"

# config partition in environment
# RK_PARTITION_CMD_IN_ENV format:
#     <partdef>[,<partdef>]
#       <partdef> := <size>[@<offset>](part-name)
# Note:
#   If the first partition offset is not 0x0, it must be added. Otherwise, it needn't adding.
export RK_PARTITION_CMD_IN_ENV="32K(env),512K@32K(idblock),512K(uboot),8M(boot),1G(rootfs),1G(oem),5G(userdata)"

# config partition's filesystem type (squashfs is readonly)
# emmc:    squashfs/ext4
# nand:    squashfs/ubifs
# spi nor: squashfs/jffs2
# RK_PARTITION_FS_TYPE_CFG format:
#     AAAA:/BBBB/CCCC@ext4
#         AAAA ----------> partition name
#         /BBBB/CCCC ----> partition mount point
#         ext4 ----------> partition filesystem type
export RK_PARTITION_FS_TYPE_CFG=rootfs@IGNORE@ext4,userdata@/userdata@ext4,oem@/oem@ext4

# config filesystem compress (Just for squashfs or ubifs)
# squashfs: lz4/lzo/lzma/xz/gzip, default xz
# ubifs:    lzo/zlib, default lzo
# export RK_SQUASHFS_COMP=xz
# export RK_UBIFS_COMP=lzo

# app config
export RK_APP_TYPE=RKIPC_RV1103B

# build ipc web backend
export RK_APP_IPCWEB_BACKEND=y

# enable install app to oem partition
export RK_BUILD_APP_TO_OEM_PARTITION=y

# enable rockchip test
export RK_ENABLE_ROCKCHIP_TEST=y

# enable build wifi
# export RK_ENABLE_WIFI=y
# export RK_ENABLE_WIFI_CHIP=RTL8189FS

export RK_ENABLE_SYSSTAT=y
export RK_ENABLE_FIO=y
export RK_ENABLE_I2C_TOOLS=y

# config AUDIO model
# export RK_AUDIO_MODEL=NONE

# config AI-ISP model
export RK_AIISP_MODEL=NONE
export RK_ENABLE_SYSSTAT=y

export RK_ENABLE_GDB=y
