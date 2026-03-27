#!/bin/sh

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
echo "example:"
echo "CAMERA_ID=0 WIDTH=3840 HEIGHT=2160 rk3576_stresstest.sh"
echo "option list:"
echo "    TEST_LOOP: total loop count for each test case, default: 10000"
echo "    TEST_FRAME: test frame count each loop, default: 50"
echo "    WIDTH: camera sensor width, default: 2560"
echo "    HEIGHT: camera sensor height, default: 1440"
echo "    CAMERA_ID: camera index, defalut: 0"
echo "    PN_MODE: enable pn-mode switch test, default: on"
echo "    AIISP: enable aiisp deinit-init test, default: on"
echo "    HDR: enable HDR switch test, default: on"
echo "    FRAMERATE: enable fps switch from 1 to 25 test, default: on"
echo "    RESOLUTION : enable resolution switch test, default: on"
echo "    ENCODE_TYPE: enable switch encode type between h264 and h265 test, default: on"
echo "    SMART_P: enable smart p switch test, default: on"
echo "    MOTION: enable md switch test, default: on"
echo "    SVC: enable svc switch test, default: off"
echo "    RESTART: enable all pipe restart test, default: on"
echo "    ROTATION: enable switch rotation degree test, default: on"
echo "    IDR: venc force idr test, default: on"
echo "    DETACH_ATTACH: enable rgn detach attach test, default: on"
exit 0
fi

set -x
#test loop
if [ -z $TEST_LOOP ]; then
TEST_LOOP=10000
fi

#test frame
if [ -z $TEST_FRAME ]; then
TEST_FRAME=50
fi

#test result path
test_result_path=/tmp/$(basename $0).log

#set environment variables
if [ -z $PN_MODE ]; then
    PN_MODE=on
fi
if [ -z $HDR ]; then
    HDR=on
fi
if [ -z $FRAMERATE ]; then
    FRAMERATE=on
fi
if [ -z $RESOLUTION ]; then
    RESOLUTION=on
fi
if [ -z $LDCH ]; then
    LDCH=on
fi
if [ -z $AIISP ]; then
    AIISP=on
fi
if [ -z $ENCODE_TYPE ]; then
    ENCODE_TYPE=on
fi
if [ -z $SMART_P ]; then
    SMART_P=on
fi
if [ -z $SVC ]; then
    SVC=off
fi
if [ -z $MOTION ]; then
    MOTION=on
fi
if [ -z $IDR ]; then
    IDR=on
fi
if [ -z $ROTATION ]; then
    ROTATION=on
fi
if [ -z $DETACH_ATTACH ]; then
    DETACH_ATTACH=on
fi
if [ -z $RESTART ]; then
    RESTART=on
fi
if [ -z $WIDTH ]; then
    WIDTH=3840
fi
if [ -z $HEIGHT ]; then
    HEIGHT=2160
fi
if [ -z $CAMERA_ID ]; then
    CAMERA_ID=0
fi
if [ -z $IQ_PATH ]; then
    IQ_PATH=/etc/iqfiles
fi

__echo_test_cmd_msg()
{
	echo -e "$1" | tee -a $test_result_path
	if [ $? -ne 0 ]; then
		echo -e "$1"
	fi
}

__chk_cma_free()
{
	local f
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
}

test_cmd()
{
	if [ -z "$*" ];then
		echo "not found cmd, return"
		return
	fi
	__echo_test_cmd_msg "TEST    `date "+%D %H:%M:%S"` [$*]"
	eval $*
	if [ $? -eq 0 ]; then
		__echo_test_cmd_msg "SUCCESS `date "+%D %H:%M:%S"` [$*]"
	else
		__echo_test_cmd_msg "FAILURE `date "+%D %H:%M:%S"` [$*]"
		exit 1
	fi
	__chk_cma_free
}

isp_stresstest()
{
    # ./script test_type if_open test_loop test_frame iq_file
    # $1 --------test_result_path
    # $2 --------test_loop
    # $3 --------test_frame
    # $4 --------vi_frame_switch_test_loop
    # $5 --------iq_file

    echo "-----------------enter isp stresstest-----------------" >> $test_result_path

    #1 PN mode switch
    if [ "$PN_MODE" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
            --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 1
    fi

    #2 HDR mode test
    if [ "$HDR" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
            --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 2
    fi

    #3 framerate switch test
    if [ "$FRAMERATE" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
            --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 3
    fi

    #4 LDCH mode test
    if [ "$LDCH" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
             --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 4
    fi

    #6 isp_deinit_init test
    if [ "$RESTART" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
             --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 6
    fi

    #7 aiisp_deinit_init test
    if [ "$AIISP" = "on" ]; then
        test_cmd sample_isp_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -I $CAMERA_ID \
             --chn_id 1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 7
    fi

    sleep 3
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

    echo "-----------------exit isp stresstest-----------------" >> $test_result_path
}

venc_stresstest()
{
    #example: $0 <test_result_path> <test_loop> <test_frame> <ifEnableWrap>"
    #      $1 --------test_result_path
    #      $2 --------test_loop
    #      $3 --------test_frame
    #      $4 --------ifEnableWrap

    echo "-----------------enter venc stresstest-----------------" >> $test_result_path

    #venc resolution switch test
    if [ "$RESOLUTION" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 1 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    # encode type switch tes
    if [ "$ENCODE_TYPE" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 2 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    #smartp mode switch test
    if [ "$SMART_P" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 3 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    #SVC mode switch test
    if [ "$SVC" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 4 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    #motion deblur switch test
    if [ "$MOTION" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 5 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    #force IDR switch test
    if [ "$IDR" = "on" ]; then
        test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 6 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    #venc chn rotation switch test
    if [ "$ROTATION" = "on" ]; then
	    test_cmd sample_venc_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --wrap 0 --mode_test_type 7 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME
    fi

    sleep 1
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

    echo "-----------------exit venc stresstest-----------------" >> $test_result_path
}

rgn_stresstest()
{
    #example: $0 <test_type> <test_result_path> <test_loop> <test_frame> <ifEnableWrap>"
    #      $1 --------test_result_path
    #      $2 --------test_loop
    #      $3 --------test_frame
    #      $4 --------ifEnableWrap

    echo "-----------------enter rgn stresstest-----------------" >> $test_result_path

    #rgn detach attach test
    if [ "$DETACH_ATTACH" = "on" ]; then
        test_cmd sample_rgn_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -l -1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 1
    fi

    #rgn detach attach test for hardware vpss
    if [ "$DETACH_ATTACH" = "on" ]; then
        test_cmd sample_rgn_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH -l -1 --test_frame_count $TEST_FRAME --mode_test_loop $TEST_LOOP --mode_test_type 2
    fi

    sleep 3
    echo 3 > /proc/sys/vm/drop_caches
    cat /proc/meminfo | grep MemAvailable >> $test_result_path

    echo "-----------------exit rgn stresstest-----------------" >> $test_result_path
}

vpss_stresstest()
{
    # echo "example: <>$0 <test_result_path> <test_loop> <test_frame>"
    # test_mod: VPSS_RESTART RESOLUTION
    # echo -e "
    #       \$1 --------test_result_path\n
    #       \$2 --------test_loop\n
    #       \$3 --------test_frame\n"

    echo "-----------------enter vpss stresstest-----------------" >> $test_result_path

    #1. vpss_deinit_ubind_test
    test_cmd sample_vpss_stresstest --vi_size 2560x1440 --vpss_size 2560x1440 -a $IQ_PATH --mode_test_type 1 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME

    #2. vpss_resolution_test
    test_cmd sample_vpss_stresstest --vi_size 2560x1440 --vpss_size 2560x1440 -a $IQ_PATH --mode_test_type 2 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME

    #3. hardware vpss_deinit_ubind_test
    test_cmd sample_vpss_stresstest --vi_size 2560x1440 --vpss_size 2560x1440 -a $IQ_PATH --mode_test_type 3 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME

    #4. hardware vpss_resolution_test
    test_cmd sample_vpss_stresstest --vi_size 2560x1440 --vpss_size 2560x1440 -a $IQ_PATH --mode_test_type 4 --mode_test_loop $TEST_LOOP --test_frame_count $TEST_FRAME

    echo "-----------------exit vpss stresstest-----------------" >> $test_result_path
}

demo_vi_venc_stresstest()
{
    echo "-----------------enter demo_vi_venc stresstest-----------------" >> $test_result_path

    echo "-----------------exit demo_vi_venc stresstest-----------------" >> $test_result_path
}

killall rkipc
while true
do
    ps|grep rkipc |grep -v grep
    if [ $? -ne 0 ]; then
        echo "rkipc exit"
        break
    else
        sleep 1
        echo "rkipc active"
    fi
done

echo "start rk3576 stresstest" > $test_result_path
echo "start record rk3576 meminfo" > /tmp/testLog.txt

#1.isp stresstest
isp_stresstest

#2.venc stresstest
venc_stresstest

#3.rgn stresstest
rgn_stresstest

#4.vpss stresstest
vpss_stresstest

#5.demo vi venc stresstest
demo_vi_venc_stresstest

#print test result
cat $test_result_path
cat /tmp/testLog.txt
