#!/bin/sh

# 加载 Wi-Fi 模块
insmod /oem/usr/ko/cfg80211.ko
insmod /oem/usr/ko/rtl8723ds.ko

# 启用 wlan0 接口
ifconfig wlan0 up