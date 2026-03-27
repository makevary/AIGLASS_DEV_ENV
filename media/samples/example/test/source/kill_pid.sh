#!/bin/sh
set -x

check_coredump()
{
	if [ "$__has_coredump" = "1" ];then
		if ls $__dump_path/core* 1> /dev/null 2>&1;then
			echo "[$0] core dump exist"
			exit 3
		fi
	fi
}

__chk_cma_free()
{
	local f

	echo "chek slab"
	cat /proc/meminfo |grep Slab

	if [ ! -f "/proc/rk_dma_heap/alloc_bitmap" ];then
		echo "[$0] not found /proc/rk_dma_heap/alloc_bitmap, ignore"
		return
	fi
	sleep 3
	f=`head  /proc/rk_dma_heap/alloc_bitmap |grep Used|awk '{print $2}'`
	if [ $f -gt 12 ];then
		echo "[$0] free cma error"
		exit 2
	fi

	check_coredump
}

dump_log(){
	local log_dir cnt
	log_dir=$2
	cnt=$1
	if [ -n "$2" ];then
		mkdir -p $log_dir
		(cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys; echo ==========================================; cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys;) |tee > $log_dir/dev-mpi-$cnt.log
		cat /proc/vcodec/enc/venc_info &> $log_dir/proc-vcodec-enc-venc_info-$cnt-1
		sleep 0.5
		cat /proc/vcodec/enc/venc_info &> $log_dir/proc-vcodec-enc-venc_info-$cnt-2
	else
		(cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys; echo ==========================================; cat /dev/mpi/vlog; cat /dev/mpi/valloc; cat /dev/mpi/vmcu; cat /dev/mpi/vrgn; cat /dev/mpi/vsys;)
		cat /proc/vcodec/enc/venc_info
		sleep 0.5
		cat /proc/vcodec/enc/venc_info
	fi
}

if mount|grep "\/mnt\/sdcard";then
	has_sdcard="/mnt/sdcard"
fi

killall nginx || echo "Not found nginx"
sleep 10
counter=15000
if [ -n "$rk_dbg_only" ];then
	counter=$rk_dbg_only
fi
__dump_path=$(cat /proc/sys/kernel/core_pattern)
if [ -d "$(dirname $__dump_path)" ];then
	__has_coredump=1
	# clean coredump, before test
	__dump_path=$(dirname $__dump_path)
	rm -rf $__dump_path/core* || true
else
	# TODO: SDK use /mnt/sdcard default if spi nand or spi nor
	__dump_path="/mnt/sdcard"
	rm -rf $__dump_path/core* || true
fi

while true
do
    counter=$(( counter - 1 ))
	echo ""
	echo ""
	echo "----------------------------------------"
	echo "$0 counter [$counter]"
	if [ -n "$has_sdcard" ];then
		logdir=$has_sdcard/kill_pid/log_$counter
	fi
	echo "----------------------------------------"
	echo ""
    rkipc_pid=$(ps |grep rkipc|grep -v grep |awk '{print $1}')
    kill -9 "$rkipc_pid"
    while true
    do
        ps|grep rkipc |grep -v grep
        if [ $? -ne 0 ]; then
            echo "kill -9 rkipc exit, run once: count = $counter"
			dump_log $counter $logdir
            break
        else
            sleep 1
            echo "rkipc active"
        fi
    done
	__chk_cma_free
	if [ $counter -lt 1 ];then
		echo "test done"
		break
	fi
    rkipc -a /oem/usr/share/iqfiles &
    sleep 5
	echo ""
done
