#!/bin/bash

LOG_FILE=/tmp/auto_test_log.txt
APP_BIN="/oem/usr/bin/cvr_remote_cfg_tool"

trap 'onCtrlC' INT SIGTERM SIGINT SIGQUIT SIGTRAP SIGABRT SIGKILL SIGSTOP SIGHUP SIGSEGV SIGTSTP

function onCtrlC () {
	echo "Ctrl+C is captured"
	echo "exit..."
	log "cvr_auto_test's pid = $$"
	kill -9 $$
	exit
}

function rand(){
	min=$1

	max=$(($2- $min + 1))
	num=$RANDOM
	echo $(($num % $max + $min))
}

function log(){
	content="[AUTO_TEST] $(date '+%Y-%m-%d %H:%M:%S') $@"
	echo $content >> $LOG_FILE && echo -e "\033[41;33m"  ${content}  "\033[0m"
}

resolution=0
record_type=0
codec_type=0
ui_type=0
randomcommand=0

resolution_sum=0
record_sum=0
codec_sum=0
alarm_sum=0;
ui_sum=0
take_photo_sum=0
reset_record_sum=0
aov_sum=0

$APP_BIN -h

function normal() {
	randomcommand=$(rand 0 4);
	if [[ 0 == $randomcommand ]]
	then
		resolution=$(rand 0 6);
		$APP_BIN -r $resolution
		resolution_sum=`expr $resolution_sum + 1`;
		log "cvr_remote_cfg_tool -r $resolution [count: $resolution_sum]"
	elif [[ 1 == $randomcommand ]]
	then
		record_type=$(rand 0 1);
		$APP_BIN -t $ $record_type
		record_sum=`expr $record_sum + 1`;
		log "cvr_remote_cfg_tool -t $record_type [count: $record_sum]"
	elif [[ 2 == $randomcommand ]]
	then
		codec_type=$(rand 0 1);
		$APP_BIN -c $codec_type
		codec_sum=`expr $codec_sum + 1`;
		log "cvr_remote_cfg_tool -c $codec_type [count: $codec_sum]"
	elif [[ 3 == $randomcommand ]]
	then
		$APP_BIN -a
		alarm_sum=`expr $alarm_sum + 1`;
		log "cvr_remote_cfg_tool -a [count: $alarm_sum]"
	elif [[ 4 == $randomcommand ]]
	then
		$APP_BIN -d
		reset_record_sum=`expr $reset_record_sum + 1`;
		log "cvr_remote_cfg_tool -d [count: $reset_record_sum]"
	fi

	sleep 80
}

function ui() {
	ui_type=$((!$ui_type))
	$APP_BIN -u $ui_type
	ui_sum=`expr $ui_sum + 1`;
	log "cvr_remote_cfg_tool -u $ui_type [count: $ui_sum]"

	sleep 20
}

function take_photo() {
	$APP_BIN -p
	take_photo_sum=`expr $take_photo_sum + 1`;
	log "cvr_remote_cfg_tool -p [count: $take_photo_sum]"

	sleep 10
}

function aov()
{
	$APP_BIN -A
	aov_sum=`expr $aov_sum + 1`;
	log "cvr_remote_cfg_tool -A [count: $aov_sum]"

	sleep 300
}

while true;
do
	if [ "$1" == "ui" ]
	then
		ui
	elif [ "$1" == "aov" ]
	then
		aov
	elif [ "$1" == "photo" ]
	then
		take_photo
	else
		normal
	fi

done