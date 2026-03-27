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
export RK_UBOOT_DEFCONFIG=rv1106b_defconfig

# Uboot defconfig fragment
export RK_UBOOT_DEFCONFIG_FRAGMENT=rk-sfc.config

# Uboot Loader ini overlay
# build.sh mcu info --> rv1103b_evb2-SC200AI-ADC
export RK_UBOOT_RKBIN_MCU_CFG=rv1103b_evb2-SC200AI-ADC

# Uboot Loader miniall ini file: locate in <SDK>/sysdrv/source/uboot/rkbin/RKBOOT
export RK_UBOOT_RKBIN_MINIALL_INI_FILE=RV1103BMINIALL_SPI_NOR_SPI_NAND_TB.ini

# Kernel defconfig
export RK_KERNEL_DEFCONFIG=rv1103b_defconfig

# Kernel defconfig fragment
export RK_KERNEL_DEFCONFIG_FRAGMENT="rv1106b-tb.config rv1106b-battery-ipc.config rv1106b-pm.config rv1106b-wakeup.config rv1106b-tb-sdiowifi.config"

# Recovery defconfig fragment
export RK_RECOVERY_KERNEL_DEFCONFIG_FRAGMENT="rv1103b-recovery.config rv1106b-tb.config"

# Kernel dts
export RK_KERNEL_DTS=rv1106b-evb2-v10-aov.dts

#misc image
export RK_MISC=wipe_all-misc.img

# Config sensor IQ files
# RK_CAMERA_SENSOR_IQFILES format:
#     "iqfile1 iqfile2 iqfile3 ..."
# ./build.sh media and copy <SDK root dir>/output/out/media_out/isp_iqfiles/$RK_CAMERA_SENSOR_IQFILES
export RK_CAMERA_SENSOR_IQFILES="thunderboot/sc200ai_default_default.bin"

# Config CMA size in environment
export RK_BOOTARGS_CMA_SIZE="20M"

# config partition in environment
# RK_PARTITION_CMD_IN_ENV format:
#     <partdef>[,<partdef>]
#       <partdef> := <size>[@<offset>](part-name)
# Note:
#   If the first partition offset is not 0x0, it must be added. Otherwise, it needn't adding.
export RK_PARTITION_CMD_IN_ENV="64K(env),256K@64K(idblock),256K(uboot),384K(meta),3M(boot),5M(rootfs),1M(userdata)"

# Enable ramdisk partition
export RK_ENABLE_RAMDISK_PARTITION=y

# config partition's filesystem type (squashfs is readonly)
# emmc:    squashfs/ext4
# nand:    squashfs/ubifs
# spi nor: squashfs/jffs2
# RK_PARTITION_FS_TYPE_CFG format:
#     AAAA:/BBBB/CCCC@ext4
#         AAAA ----------> partition name
#         /BBBB/CCCC ----> partition mount point
#         ext4 ----------> partition filesystem type
export RK_PARTITION_FS_TYPE_CFG=rootfs@IGNORE@erofs,userdata@/userdata@jffs2

# config filesystem compress (Just for squashfs or ubifs)
# squashfs: lz4/lzo/lzma/xz/gzip, default xz
# ubifs:    lzo/zlib, default lzo
# export RK_SQUASHFS_COMP=xz
# export RK_UBIFS_COMP=lzo

# app config
export RK_APP_TYPE="RK_SAMPLE_AOV"

export RK_ENABLE_AOV=y

# config AI-ISP model
export RK_AIISP_MODEL=NONE

# config AUDIO model
export RK_AUDIO_MODEL=NONE

# config NPU model
export RK_NPU_MODEL="iva_object_detection_v3_pfp_lite_640x384.data"

# enable rockchip test
export RK_ENABLE_ROCKCHIP_TEST=n

# specify post.sh for delete/overlay files
export RK_POST_BUILD_SCRIPT=tb-spi_nor-aov-post.sh

# enable fastboot
export RK_ENABLE_FASTBOOT=y

# disable adb
export RK_ENABLE_ADBD=n

# disable gdb
export RK_ENABLE_GDB=n

# disable udev
export RK_ENABLE_EUDEV=n

# build ipc web backend
export RK_APP_IPCWEB_BACKEND=n

# enable rndis
export RK_ENABLE_RNDIS=y

# enable wifi
export RK_ENABLE_WIFI=y
export RK_ENABLE_WIFI_CHIP="HI3861L"

# declare overlay directory
export RK_POST_OVERLAY=overlay-battery-ipc

export RK_META_PARAM=" \
 --rk_cam_mirror_flip=0 \
 --rk_cam_fps=15 \
 --rk_cam_hdr=0 \
 --rk_led_value=20 \
 --rk_night_mode=2 \
 --rk_cam1_max_fps=60 \
"
