#!/bin/sh

# RK962 WiFi 模块加载脚本
# 固件路径: /oem/usr/rk96x/fw/

# 加载依赖模块
insmod /oem/usr/ko/libarc4.ko
insmod /oem/usr/ko/cfg80211.ko
insmod /oem/usr/ko/mac80211.ko

# 加载主驱动
insmod /oem/usr/ko/rk96x.ko

# 加载加密模块
insmod /oem/usr/ko/ctr.ko
insmod /oem/usr/ko/ccm.ko
insmod /oem/usr/ko/aes_generic.ko

# 启用 wlan0 接口
ifconfig wlan0 up
