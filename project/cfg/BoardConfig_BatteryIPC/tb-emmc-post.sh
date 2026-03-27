#!/bin/bash

PARTITION_MOUNT_SCRIPT=_S20linkmount
cd $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/
shopt -s extglob
rm !(fastboot_demo|fastboot_server|fastboot_client|rk_mpi_uvc|usb_config.sh)
shopt -u extglob
cd -
mv $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librkaiq.so $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/lib
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/*.so*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/auto_lane_obj_det.data
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librknnmrt_rockauto.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librockauto.so

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librkAVS_genLutAndStitch.so

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/fastboot_client
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/sample_*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/simple_*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/rk_*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/Rk_*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/mp*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/vpu*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/rkisp*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/rkaiq*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/rga*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/dump*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/j2s4b_dev
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/libsmartIr.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librve.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librkdemuxer.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librockit_tiny.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librockit_full.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/librkAVS_stitchFor1106.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/libivs.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/*.md
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/services
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/protocols
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/lib/libstdc++.so.6.0.25-gdb.py
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/lib/libitm.so*
mv $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/S20linkmount $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/${PARTITION_MOUNT_SCRIPT}
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/S21appinit*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/rkipc
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/tb.sh
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/iqfiles/*.json
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/iqfiles/*.bin
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/hpmcu_wrap.bin

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/badblocks
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/uuidd
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/logsave
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/e2undo
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/e2freefrag
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/dumpe2fs
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/filefrag
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/e4crypt
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/sbin/blkid
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/lsattr
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/chattr
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/uuidgen

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/wpa_cli_rtk
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/wpa_supplicant
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/wpa_supplicant_nl80211_rtk
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/wpa_supplicant_rtk
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/wpa_supplicant.conf
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/libwpa_client.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/lib/libdrm.so*
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/bin/modetest
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/lib/libwpa_client.so
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/lib/libintl.so*

rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/iperf
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/hostapd
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/usr/bin/dnsmasq
# delete nouse ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/gcm.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/ccm.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/sha256_generic.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/libaes.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/libsha256.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/gf128mul.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/cmac.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/rve.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/libarc4.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/aes_generic.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/ctr.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/mac80211.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/atmb_iot_supplicant_demo
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/rk_vendor_storage.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/mtd_vendor_storage.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/mtd_blkdevs.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/mtdblock.ko
rm $RK_PROJECT_PACKAGE_ROOTFS_DIR/oem/usr/ko/spi-nor.ko

cat > $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/rcS <<EOF
#!/bin/sh
export PATH=\$PATH:/oem/usr/ko/
echo 256 > /proc/sys/kernel/threads-max

if [ -z "\$NoAuto" ]; then
	echo "start demo" > /dev/kmsg
	if [ -n "\$persist_camera_engine_log" ]; then
		/oem/usr/bin/fastboot_demo &>/tmp/rkaiq.log &
	else
		/oem/usr/bin/fastboot_demo &
	fi
fi

sh /etc/init.d/${PARTITION_MOUNT_SCRIPT} linkdev &

function run_delay_task(){
	cd /oem/usr/ko
	insmod jbd2.ko
	insmod crc16.ko
	insmod mbcache.ko
	insmod ext4.ko
	insmod dw_mmc.ko
	insmod dw_mmc-pltfm.ko
	insmod dw_mmc-rockchip.ko
	insmod mmc_block.ko
	sh /etc/init.d/${PARTITION_MOUNT_SCRIPT} start &

	test ! -f snd-soc-simple-card-utils.ko || insmod snd-soc-simple-card-utils.ko
	test ! -f snd-soc-simple-card.ko || insmod snd-soc-simple-card.ko
	test ! -f snd-soc-rockchip-i2s-tdm.ko || insmod snd-soc-rockchip-i2s-tdm.ko
	test ! -f snd-soc-rv1106.ko || insmod snd-soc-rv1106.ko

	test ! -f nls_cp936.ko || insmod nls_cp936.ko
	test ! -f fat.ko       || insmod fat.ko
	test ! -f vfat.ko      || insmod vfat.ko

	test ! -f /oem/usr/ko/insmod_wifi.sh  || /oem/usr/ko/insmod_wifi.sh ${RK_ENABLE_FASTBOOT} ${RK_ENABLE_WIFI_CHIP}

	# dump thunderboot_time to /tmp/thunderboot_time.txt
	make_meta --rtt-log > /tmp/rtt-log.txt
	make_meta --rtt-log |grep thunderboot_time | head -n 8 > /tmp/thunderboot_time.txt
	make_meta --rtt-log-clean
	dmesg | grep -E 'thunderboot_time|csi2_dphy_s_stream stream on|as init process|Freeing rtos memory|rockchip_thunder_boot_sfc' >> /tmp/thunderboot_time.txt

	# Just for test
	(sleep 5 && test ! -f /data/do-test.sh || sh /data/do-test.sh) &
}

(sleep 10 && run_delay_task) &

EOF
chmod +x $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/rcS

cat > $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/rcK <<EOF
#!/bin/sh
echo "Start to killall task!!!"

for item in `echo rkipc fastboot_client fastboot_server`
do
	if ps |grep -v grep  |grep \$item ;then
		echo "killall -9 \$item"
		killall -9 \$item
	else
		break
	fi
	sleep .5
done

killall rkwifi_server
umount /data
echo "rcK done"
EOF
chmod +x $RK_PROJECT_PACKAGE_ROOTFS_DIR/etc/init.d/rcK
