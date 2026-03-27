#!/bin/bash

# remove unused files
function remove_data()
{
	if [ "$RK_BUILD_APP_TO_OEM_PARTITION" = "y" ];then
		local unused_in_oem=(\
			# unuesd scripts

			# unused lib file
			"usr/lib/librkAVS_genLut.so" \
			"usr/lib/librkAVS_genStitch.so" \
			"usr/lib/librockit_tiny.so" \
			"usr/lib/librockit.so" \
			"usr/lib/librockiva.so" \
			"usr/lib/face_*" \
			"usr/lib/object_detection_*" \

			"usr/lib/auto_lane_obj_det.data" \
			"usr/lib/librockauto.so" \
			"usr/lib/librknnmrt_rockauto.so" \

			"usr/lib/libaec_bf_process.so" \
			"usr/lib/librkaudio_detect.so" \
			"usr/lib/librkaudio_common.so" \

			# unused data files

			# unuesd executable file
			"usr/bin/rk_*" \
			"usr/bin/sample_*" \
			"usr/bin/simple_*" \
			"usr/bin/rgaImDemo" \
			"usr/bin/mpp_info_test" \
			"usr/bin/mpi_enc_test" \
			"usr/bin/vpu_api_test" \
			"usr/bin/rkaiq_3A_server" \
			"usr/bin/rkaiq_tool_server" \
			"usr/bin/rkisp_demo" \
			"usr/bin/j2s4b_dev" \

			# unused ko
			"usr/ko/ccm.ko" \
			"usr/ko/ctr.ko" \
			"usr/ko/libarc4.ko" \
			"usr/ko/libaes.ko" \
			"usr/ko/aes_generic.ko" \
			"usr/ko/mac80211.ko" \
			"usr/ko/ipv6.ko" \
			)

		for i in ${unused_in_oem[@]}
		do
			rm -rf $RK_PROJECT_PACKAGE_OEM_DIR/$i
		done

		# cvr do not start rkwifi_server
		sed -i '/rkwifi_server / s/^\(.*\)$/#\1/g' $RK_PROJECT_PACKAGE_OEM_DIR/usr/ko/insmod_wifi.sh
	fi
}

#=========================
# pre oem
#=========================
remove_data

rm -f $RK_PROJECT_PACKAGE_ROOTFS_DIR/bin/gdb*
