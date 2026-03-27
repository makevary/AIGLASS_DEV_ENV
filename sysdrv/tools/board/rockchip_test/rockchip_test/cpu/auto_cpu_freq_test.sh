#!/bin/sh
### file: stress_test_dvfs.sh
### author: xxx@rock-chips.com
### function: cpu dvfs stress test
### date: 20180409

echo "**********************stress dvfs test****************************"

delay_time=$1
echo "delay_time: $delay_time"

echo userspace >  /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
governor=`cat /sys/devices/system/cpu/cpufreq/policy0/scaling_governor`

echo "*********scaling_governor: $governor!"

freq_list=`cat /sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies`

echo "freq_list: $freq_list"

target_file=/sys/devices/system/cpu/cpufreq/policy0/scaling_available_frequencies

while true
do
	count=`cat $target_file | wc | awk '{print $2}'`
	j=$(( RANDOM % count + 1 ))
	test_val=`cat $target_file | awk -v val=$j '{print $val}'`
	echo "cpu set freq: $test_val"
	echo $test_val >  /sys/devices/system/cpu/cpufreq/policy0/scaling_setspeed
	cur_freq=`cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq`
	echo "cur_freq: $cur_freq"
done


