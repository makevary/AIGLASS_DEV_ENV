#!/bin/sh

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
echo "example:"
echo "CAMERA_NUMBER=4 WIDTH=2560 HEIGHT=1440 rk3576_multi_cam_stresstest.sh"
echo "option list:"
echo "    TEST_LOOP: total loop count for each test case, default: 10000"
echo "    TEST_FRAME: test frame count each loop, default: 50"
echo "    WIDTH: camera sensor width, default: 2560"
echo "    HEIGHT: camera sensor height, default: 1440"
echo "    CAMERA_NUMBER: camera sensor numbers, defalut: 4"
echo "    GROUP_MODE: aiq group mode, default: 0"
echo "    PN_MODE: enable pn-mode switch test, default: on"
echo "    AIISP: enable aiisp deinit-init test, default: off"
echo "    HDR: enable HDR switch test, default: on"
echo "    FRAMERATE: enable fps switch from 1 to 25 test, default: on"
echo "    RESOLUTION : enable resolution switch test, default: on"
echo "    ENCODE_TYPE: enable switch encode type between h264 and h265 test, default: on"
echo "    RESTART: enable all pipe restart test, default: on"
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
if [ -z $GROUP_MODE ]; then
    GROUP_MODE=0
fi
if [ -z $PN_MODE ]; then
    PN_MODE=on
fi
if [ -z $HDR ]; then
    HDR=on
fi
if [ -z $FRAMERATE ]; then
    FRAMERATE=on
fi
if [ -z $LDCH ]; then
    LDCH=off
fi
if [ -z $RESOLUTION ]; then
    RESOLUTION=on
fi
if [ -z $AIISP ]; then
    AIISP=off
fi
if [ -z $ENCODE_TYPE ]; then
    ENCODE_TYPE=on
fi
if [ -z $DETACH_ATTACH ]; then
    DETACH_ATTACH=on
fi
if [ -z $RESTART ]; then
    RESTART=on
fi
if [ -z $WIDTH ]; then
    WIDTH=2560
fi
if [ -z $HEIGHT ]; then
    HEIGHT=1440
fi
if [ -z $CAMERA_NUMBER ]; then
    CAMERA_NUMBER=4
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

demo_vi_avs_venc_stresstest()
{
    echo "--------------------enter demo_vi_avs_venc_stresstest-------------------" >> $test_result_path

    echo "--------------------exit demo_vi_avs_venc_stresstest-------------------" >> $test_result_path

}

multi_cam_test()
{
    echo "--------------------enter multi_cam_stresstest-------------------" >> $test_result_path
    if [ $GROUP_MODE = 1 ]; then
        echo "--------------------group mode on-------------------" >> $test_result_path
    else
        echo "--------------------group mode off-------------------" >> $test_result_path
    fi
    #1. pn_mode_switch_test
    if [ "$PN_MODE" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 1 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #2. hdr_mode_switch_test
    if [ "$HDR" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 2 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #3. fps_switch_test
    if [ "$FRAMERATE" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 3 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #4. aiisp_switch_test
    if [ "$AIISP" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num 2 \
            --test_type 4 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #5. venc_resolution_switch_test
    if [ "$RESOLUTION" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num 2 \
            --test_type 5 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #6. encode_type_switch_test
    if [ "$ENCODE_TYPE" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 6 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    #7. rgn_detach_attach_test
    if [ "$DETACH_ATTACH" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 7 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_osd 1 --enable_group $GROUP_MODE
    fi
    #8. media_deinit_init_test
    if [ "$RESTART" = "on" ]; then
        test_cmd sample_multi_cam_stresstest -w $WIDTH -h $HEIGHT -a $IQ_PATH --camera_num $CAMERA_NUMBER \
            --test_type 8 --test_loop $TEST_LOOP --test_frame_cnt $TEST_FRAME --enable_group $GROUP_MODE
    fi
    echo "--------------------exit multi_cam_stresstest-------------------" >> $test_result_path
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

echo "start rk3576 multi cam stresstest" > $test_result_path
echo "start record rk3576 multi cam meminfo" > /tmp/testLog.txt

#1.multi isp stresstest
multi_cam_test

#print test result
cat $test_result_path
cat /tmp/testLog.txt
