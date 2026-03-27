#!/bin/sh

set -x

bSetFastAEMaxFrame=${1:-true}
echo "start to do-test.sh"
# print rtt log
cat /tmp/rtt-log.txt

dmesg &> /tmp/dmesg.log
f=$(ls /dev/mmcblk*p*)
if [ -z "$f" ];then
	f=$(ls /dev/mmcblk*)
fi
if [ -n "$f" ];then
	mount "$f" /mnt/sdcard/
	cnt=$(cat /mnt/sdcard/test_tb_num)
	cnt=$(( cnt + 1 ))
	echo $cnt > /mnt/sdcard/test_tb_num
	make_meta -d /dev/block/by-name/meta
	if [ "$bSetFastAEMaxFrame" = true ]; then
		make_meta --update --meta_path /dev/block/by-name/meta --rk_fastae_max_frame "$(( cnt % 20 + 3 ))"
	fi
	echo
	echo "debug-test cnt [$cnt]"
	if [ "$bSetFastAEMaxFrame" = true ]; then
		log_dir="/mnt/sdcard/SetFastAeMax_$cnt"
	else
		log_dir="/mnt/sdcard/NoSetFastAeMax_$cnt"
	fi
	mkdir -p $log_dir
	cp /tmp/rtt-log.txt $log_dir/rtt-fastae.log
	cp /tmp/venc-test.bin $log_dir/venc-test-$cnt.bin
	cp /tmp/venc0.bin $log_dir/venc0-$cnt.bin
	cp /tmp/venc1.bin $log_dir/venc1-$cnt.bin
	(cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys; echo ==========================================; cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys;) |tee > $log_dir/dev-mpi-$cnt.log
	cat /proc/vcodec/enc/venc_info &> $log_dir/proc-vcodec-enc-venc_info-$cnt-1
	cat /proc/vcodec/enc/venc_info &> $log_dir/proc-vcodec-enc-venc_info-$cnt-2
	cat /proc/rkisp-vir0 &> $log_dir/proc-rkisp-vir0-$cnt-1
	cat /proc/rkisp-vir0 &> $log_dir/proc-rkisp-vir0-$cnt-2
	cat /proc/rkisp-vir1 &> $log_dir/proc-rkisp-vir1-$cnt-1
	cat /proc/rkisp-vir1 &> $log_dir/proc-rkisp-vir1-$cnt-2
	cat /proc/rkcif-mipi-lvds &> $log_dir/proc-rkcif-mipi-lvds-$cnt-1
	cat /proc/rkcif-mipi-lvds &> $log_dir/proc-rkcif-mipi-lvds-$cnt-2
	cat /proc/rkcif-mipi-lvds1 &> $log_dir/proc-rkcif-mipi-lvds1-$cnt-1
	cat /proc/rkcif-mipi-lvds1 &> $log_dir/proc-rkcif-mipi-lvds1-$cnt-2
	cp -fa /tmp/dmesg.log $log_dir/dmesg-$cnt.log
	cp -fa /tmp/pts*.txt $log_dir/
	cp -fa /tmp/rkaiq*.log $log_dir
	sync
	umount /mnt/sdcard
fi

while true
do
	msg="`cat /proc/rkisp-vir0| grep Inter`"
	num=${msg#*Cnt:}
	num=${num%% *}

	if [ -f /proc/rkisp-vir1 ];then
		msg1="`cat /proc/rkisp-vir1| grep Inter`"
		num1=${msg1#*Cnt:}
		num1=${num1%% *}
		if [ "$num1" -lt 50 ];then
			dmesg
			echo "rkisp-vir1 error"
			break
		fi
	fi

	# check venc frames
	pkt_user_get_values=""
	pkt_user_get_values=$(awk -F '|' '/pkt_user_get/ {getline; print $3}' /proc/vcodec/enc/venc_info | tr '\n' ' ')
	for pkt_user_get in $pkt_user_get_values; do
		if [ "$pkt_user_get" -lt 50 ]; then
			cat /proc/vcodec/enc/venc_info
			echo "venc no stream: $pkt_user_get"
			exit 0
		fi
	done

	if [ "$num" -lt 50 ];then
		dmesg
		echo "rkisp-vir0 error"
		break
	else
		reboot
	fi
done
