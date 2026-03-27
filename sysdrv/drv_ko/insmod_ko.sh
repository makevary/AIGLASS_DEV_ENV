#!/bin/sh
cmd=`realpath $0`
_DIR=`dirname $cmd`
cd $_DIR

udevadm control --stop-exec-queue

__insmod()
{
	if [ -f "$1" ];then
		insmod $@
	fi
}

__rmmod_camera_sensor()
{
	for item in `echo "imx415 os04a10 sc4336 sc3336 sc530ai gc2053 sc200ai sc401ai sc450ai sc4336p sc850sl gc4653 gc4023 techpoint"`
	do
		if lsmod | grep $item | awk '{print $3}' |grep -w 0;then
			rmmod $item
		fi
	done
}

__chk_camera_sensor_height()
{
	# TODO: Do Not Support dual Camera Sensor
	sensor_height=0
	resolution=$(grep -o "Size:[0-9]*x[0-9]*" /proc/rkisp-vir0 | cut -d':' -f2)
	if [ -n "$resolution" ]; then
		sensor_height=$(echo "$resolution" | cut -d'x' -f2)
	fi
}

__insmod rk_dvbm.ko

__insmod videobuf2-memops.ko
__insmod videobuf2-common.ko
__insmod videobuf2-v4l2.ko
__insmod videobuf2-vmalloc.ko
__insmod videobuf2-cma-sg.ko

__insmod imx415.ko
__insmod os04a10.ko
__insmod sc4336.ko
__insmod sc3336.ko
__insmod sc530ai.ko
__insmod gc2053.ko
__insmod sc200ai.ko
__insmod sc401ai.ko
__insmod sc450ai.ko
__insmod sc4336p.ko
__insmod sc850sl.ko
__insmod gc4653.ko
__insmod gc4023.ko
__insmod techpoint.ko
__insmod imx219.ko
__insmod video_rkcif.ko
__insmod video_rkisp.ko
__insmod phy-rockchip-csi2-dphy-hw.ko
__insmod phy-rockchip-csi2-dphy.ko

__rmmod_camera_sensor

echo 1 > /sys/module/video_rkcif/parameters/clr_unready_dev
echo 1 > /sys/module/video_rkisp/parameters/clr_unready_dev

__insmod rga3.ko

__insmod mpp_vcodec.ko

__insmod rknpu.ko
__insmod snd-soc-rv1106.ko

__insmod motor.ko

__chk_camera_sensor_height

__insmod rockit.ko

udevadm control --start-exec-queue

# insmod wifi driver background
$(pwd)/insmod_wifi.sh &
