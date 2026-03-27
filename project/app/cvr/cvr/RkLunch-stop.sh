#!/bin/sh

rcK()
{
	for i in $(ls /oem/usr/etc/init.d/S??*) ;do

		# Ignore dangling symlinks (if any).
		[ ! -f "$i" ] && continue

		case "$i" in
			*.sh)
				# Source shell script for speed.
				(
					trap - INT QUIT TSTP
					set stop
					. $i
				)
				;;
			*)
				# No sh extension, so fork subprocess.
				$i stop
				;;
		esac
	done
}

echo "Stop Application ..."
killall cvr_app
killall udhcpc

cnt=0
while [ 1 ];
do
	sleep 1
	cnt=$(( cnt + 1 ))
	if [ $cnt -eq 8 ]; then
		echo "killall -9 cvr_app"
		killall -9 cvr_app
		sleep 0.1
		break
	fi

	ps|grep cvr_app|grep -v grep
	if [ $? -ne 0 ]; then
		echo "cvr_app exit"
		break
	else
		echo "cvr_app active"
	fi
done

rcK
