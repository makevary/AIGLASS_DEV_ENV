#!/bin/sh

check_linker()
{
        [ ! -L "$2" ] && ln -sf $1 $2
}

network_init()
{
	ethaddr1=`ifconfig -a | grep "eth.*HWaddr" | awk '{print $5}'`

	if [ -f /data/ethaddr.txt ]; then
		ethaddr2=`cat /data/ethaddr.txt`
		if [ $ethaddr1 == $ethaddr2 ]; then
			echo "eth HWaddr cfg ok"
		else
			ifconfig eth0 down
			ifconfig eth0 hw ether $ethaddr2
		fi
	else
		echo $ethaddr1 > /data/ethaddr.txt
	fi
	ifconfig eth0 up && udhcpc -i eth0
	ifconfig eth1 up && udhcpc -i  eth1 #evb7 enable eth
}

post_chk()
{
	#TODO: ensure /userdata mount done
	cnt=0
	while [ $cnt -lt 30 ];
	do
		cnt=$(( cnt + 1 ))
		if mount | grep -w userdata; then
			break
		fi
		sleep .1
	done

	network_init &
	check_linker /userdata   /usr/www/userdata
	check_linker /media/usb0 /usr/www/usb0
	check_linker /mnt/sdcard /usr/www/sdcard

	# if /data/rkipc not exist, cp /usr/share
	rkipc_ini=/userdata/rkipc.ini
	default_rkipc_ini=/tmp/rkipc-factory-config.ini

	result=`ls -l /proc/rkisp* | wc -l`
	if [ "$result"x == "3"x ] ;then
		ln -s -f /usr/share/rkipc-3x.ini $default_rkipc_ini
	fi
	if [ "$result"x == "4"x ] ;then # 3576 4x， avs only use 3x
		ln -s -f /usr/share/rkipc-3x.ini $default_rkipc_ini
	fi

	if [ ! -f "$default_rkipc_ini" ];then
		echo "Error: not found rkipc.ini !!!"
		exit -1
	fi

	if [ ! -f "$rkipc_ini" ]; then
		cp $default_rkipc_ini $rkipc_ini -f
	fi

	# avoid MIPI screen not displaying when startup
	export rt_vo_disable_vop=0
	if [ -d "/usr/share/iqfiles" ];then
		rkipc -a /usr/share/iqfiles &
	else
		rkipc &
	fi
}

ulimit -c unlimited
echo "/data/core-%p-%e" > /proc/sys/kernel/core_pattern

# cpu
echo userspace > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo 2208000 > /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
echo userspace > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
echo 2304000 > /sys/devices/system/cpu/cpufreq/policy4/scaling_setspeed
# gpu
echo userspace > /sys/class/devfreq/27800000.gpu/governor
echo 950000000 > /sys/class/devfreq/27800000.gpu/max_freq
echo 950000000 > /sys/class/devfreq/27800000.gpu/min_freq
cat /sys/class/devfreq/27800000.gpu/cur_freq
# npu
echo userspace > /sys/class/devfreq/27700000.npu/governor
echo 1000000000 > /sys/class/devfreq/27700000.npu/max_freq
echo 1000000000 > /sys/class/devfreq/27700000.npu/min_freq
cat /sys/class/devfreq/27700000.npu/cur_freq

post_chk &
