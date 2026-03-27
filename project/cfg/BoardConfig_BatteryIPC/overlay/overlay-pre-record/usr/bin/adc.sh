#!/bin/bash  
{
# 等待 wlan0 出现在 ifconfig 的输出中  
# sleep 6
while ! ifconfig | grep -q wlan0; do  
    sleep 2
    echo "wlan0 is not ready" > /dev/ttyFIQ0
done  

echo "wlan0 is up, executing rkwifi_server reset" > /dev/ttyFIQ0
rkwifi_server reset  
  
# 无限循环检测 recovery key  
while true; do  
    # 判断 recovery key 的值  
    if [ "$(cat /sys/devices/platform/209a0000.adc/iio:device0/in_voltage0_raw)" -lt 100 ]; then  
        echo "Recovery key value is less than 100, executing rkwifi_server deepsleep" > /dev/ttyFIQ0
	# sleep 10
	killall ao_record_demo
	killall ao_record_service
	rkwifi_server setpir 1
	sleep 0.5
        rkwifi_server deepsleep
	sleep 0.5
	# echo on > /sys/devices/platform/20940000.i2c/i2c-4/4-004c/power/control 
        # cat /sys/devices/platform/20940000.i2c/i2c-4/4-004c/power/runtime_status
	/usr/bin/tinyplay /oem/usr/share/enter_preroll_2ch.wav -D 0 -d 0 
	/usr/bin/lppr 
    else  
        echo "Recovery key value is greater than 100, sleeping for 1000ms" > /dev/ttyFIQ0
        sleep 1
    fi 
done
}
