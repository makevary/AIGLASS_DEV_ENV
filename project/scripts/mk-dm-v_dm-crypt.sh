#!/bin/bash -e

###################################################
CMD_VERSION="V1.0.0"
__SCRIPTS__=$0
__SCRIPTS_DIR=$(dirname $0)
rk_dm_crypt_key_save_dir=$__SCRIPTS_DIR
rk_dm_image_out_dir=$__SCRIPTS_DIR/dm-image
###################################################

function msg_info()
{
	echo -e "${C_GREEN}[$__SCRIPTS__:info] $1${C_NORMAL}"
}

function msg_warn()
{
	echo -e "${C_YELLOW}[$__SCRIPTS__:warn] $1${C_NORMAL}"
}

function msg_error()
{
	echo -e "${C_RED}[$__SCRIPTS__:error] $1${C_NORMAL}"
}

rk_dm_crypt_setup_misc()
{
	SRC=$1
	DST=$2
	size=$3
	buf=$4
	echo buf=$buf

	if [ ! -f "$SRC" ]; then
		msg_error "Not fournd $SRC"
		exit 1
	fi
	if [ -z "$DST" ]; then
		msg_error "Not fournd DST"
		exit 1
	fi
	if [ "$size" -eq "$size" ] 2>/dev/null; then
		echo "size = $size"
	else
		msg_error "input size  invalid"
		exit 1
	fi

	big_end=$[size / 256]
	lit_end=$[size - (big_end * 256)]
	big_end=$(echo "ibase=10;obase=16;$big_end" | bc)
	lit_end=$(echo "ibase=10;obase=16;$lit_end" | bc)

	dd if="$SRC" of="$DST" bs=1k count=10
	echo -en "\x$lit_end\x$big_end" >> "$DST"
	echo -n "$buf" >> "$DST"
	skip=$[10 * 1024 + size + 2]
	dd if="$SRC" of="$DST" seek=$skip skip=$skip bs=1
}

rk_dm_create_crypt_key()
{
	if [ ! -d $rk_dm_crypt_key_save_dir ]; then
		mkdir -p $rk_dm_crypt_key_save_dir
	fi
	openssl rand -out $rk_dm_crypt_key_save_dir/system_enc_key -hex 32
}

rk_dm_create_init_rc()
{
	local check_method=$1
	local security_file=$2
	local dm_partition=$3
	local output_init_rc_file=$4
	local init_in=$5

	local optee_storage

	case $check_method in
		system-encryption) echo encryption ;;
		system-verity) echo verity ;;
		*) msg_error "Not found $check_method"; exit 1;;
	esac

	case $dm_partition in
		/dev/mmcblk*)  optee_storage=RPMB ;;
		/dev/mtdblock*)  optee_storage="SECURITY" ;;
		*) msg_error "Not found $dm_partition"; exit 1;;
	esac

	case $optee_storage in
		RPMB|SECURITY) ;;
		*) msg_error "Not found $optee_storage"; exit 1;;
	esac

	if [ ! -f "$init_in" ] || [ ! -f "$security_file" ]; then
		msg_error "Not found $init_in or $security_file"
		exit 1
	fi

	if [ ! -f "$output_init_rc_file" ]; then
		cp $init_in $output_init_rc_file -fv
	else
		local test_flag_verify test_flag_encrypt
		set -x
		test_flag_encrypt="`grep -w "ENC_EN=" $output_init_rc_file || echo ""`"
		test_flag_verify="`grep -w "HASH=" $output_init_rc_file || echo ""`"
		if [ -z "$test_flag_encrypt" -a -z "$test_flag_verify" ]; then
			cp $init_in $output_init_rc_file -fv
		fi
		echo "debug test_flag_verify = $test_flag_verify"
		echo "debug test_flag_encrypt = $test_flag_encrypt"
	fi

	local build_id
	build_id=`date "+%Y%m%d.%H%M%S"`

	sed -i "s#\# PRE-CMD#$rk_dm_init_cmd#" "$output_init_rc_file"
	sed -i "s#_BUILD_ID_=.*#_BUILD_ID_=$build_id#" "$output_init_rc_file"
	sed -i "s#STORGE_DEV=.*#STORGE_DEV=$dm_partition#" "$output_init_rc_file"
	if [ "$check_method" == "system-encryption" ]; then
		source "$security_file"
		sed -i "s/ENC_EN=.*/ENC_EN=true/" "$output_init_rc_file"
		sed -i "s/CIPHER=/CIPHER=$cipher/" "$output_init_rc_file"
		sed -i "s/SECURITY_STORAGE=RPMB/SECURITY_STORAGE=$optee_storage/" "$output_init_rc_file"
	else
		source "$security_file"
		sed -i "s/OFFSET=/OFFSET=$hash_offset/" "$output_init_rc_file"
		sed -i "s/HASH=/HASH=$root_hash/" "$output_init_rc_file"
	fi

	chmod 775 $output_init_rc_file
	msg_info "Generate ramdisk init for security"
}

rk_dm_setup_system_verity()
{
	target_image=$(readlink -f $1)
	security_image=$rk_dm_image_out

	sectors=$(ls -l "$target_image" | awk '{printf $5}')
	hash_offset=$[(sectors / 1024 / 1024 + 2) * 1024 * 1024]
	tmp_file=$(mktemp)
	cp "$target_image" "$security_image"
	veritysetup --hash-offset=$hash_offset format "$security_image" "$security_image" | grep "Root hash:" |awk '{print $3}' > $tmp_file


	echo "touch=\"$(ls -l --time-style=long-iso $target_image | cut -d ' ' -f 6,7)\"" > $rk_dm_info_file
	echo "hash_offset=$hash_offset" >> $rk_dm_info_file
	root_hash=$(cat $tmp_file)
	echo "root_hash=$root_hash" >> $rk_dm_info_file
	# cat "$tmp_file" >> $rk_dm_image_out_dir/info
	rm $tmp_file

	rk_dm_create_init_rc system-verity "$rk_dm_info_file" $rk_dm_partition $rk_dm_init_dst $rk_dm_init_src
}

rk_dm_setup_system_encryption()
{
	target_image=$(readlink -f $1)
	security_image=$rk_dm_image_out

	if [ ! -f "$rk_dm_crypt_key_save_dir/system_enc_key" ]; then
		msg_error "Not found $rk_dm_crypt_key_save_dir/system_enc_key"
		exit 1
	fi

	if [ ! -f "$target_image" ]; then
		msg_error "Not found $target_image"
		exit 1
	fi

	key=$(cat $rk_dm_crypt_key_save_dir/system_enc_key)
	cipher=aes-cbc-plain
	cipher_key_len=64
	sectors=$(ls -l "$target_image" | awk '{printf $5}')
	sectors=$[(sectors + (1 * 1024 * 1024) - 1) / 512] # Align 1M / unit: 512 bytes

	loopdevice=$(losetup -f)
	mappername=encfs-$(shuf -i 1-10000000000000000000 -n 1)
	dd if=/dev/null of="$security_image" seek=$sectors bs=512

	sudo -S losetup $loopdevice $security_image < $rk_dm_crypt_key_save_dir/root_passwd
	sudo -S dmsetup create $mappername --table "0 $sectors crypt $cipher $key 0 $loopdevice 0 1 allow_discards" < $rk_dm_crypt_key_save_dir/root_passwd
	sudo -S dd if="$target_image" of=/dev/mapper/$mappername conv=fsync < $rk_dm_crypt_key_save_dir/root_passwd
	if sync; then
		sudo -S dmsetup remove $mappername < $rk_dm_crypt_key_save_dir/root_passwd
	fi
	sudo -S losetup -d $loopdevice < $rk_dm_crypt_key_save_dir/root_passwd

	echo "touch=\"$(ls -l --time-style=long-iso $target_image | cut -d ' ' -f 6,7)\"" > $rk_dm_info_file
	echo "sectors=$sectors" >> $rk_dm_info_file
	echo "cipher=$cipher" >> $rk_dm_info_file
	echo "key=$key" >> $rk_dm_info_file

	rk_dm_create_init_rc system-encryption "$rk_dm_info_file" $rk_dm_partition $rk_dm_init_dst $rk_dm_init_src

	rk_dm_crypt_setup_misc $rk_dm_misc_img $rk_dm_image_out_dir/$(basename $rk_dm_misc_img) $cipher_key_len $key
}

msg_help()
{

	msg_info "use example:"

	echo "mk-dm-v_dm-crypt.sh \\
		--crypt_key_save_dir key_dir                     \\
		--dm_part        dm_partition                    \\
		--init_src       init.in                         \\
		--init_dst       dst_init_rc                     \\
		--input_image    target_image                    \\
		--output_image   out_image                       \\
		--misc_img       misc.img                        \\
		--partition      \"env@/dev/mmcblk0p1,idblock@/dev/mmcblk0p2,uboot@/dev/mmcblk0p3,misc@/dev/mmcblk0p4\" \\
			--crypt"

	echo ""
	echo "mk-dm-v_dm-crypt.sh \\
		--dm_part        dm_partition                     \\
		--init_src       init.in                          \\
		--init_dst       dst_init_rc                      \\
		--input_image    target_image                     \\
		--output_image   out_image                        \\
		--partition      \"env@/dev/mmcblk0p1,idblock@/dev/mmcblk0p2,uboot@/dev/mmcblk0p3,misc@/dev/mmcblk0p4\" \\
			--verity"

	exit 0
}

chk_param()
{
	local cnt
	cnt=0
	while [ $# -ne 0 ]
	do
		case $1 in
			-v|--version)
				echo "V$CMD_VERSION"
				exit 0
				;;
			-h|--help)
				msg_help
				;;
			-i|--input_image)
				rk_dm_target_image=$2
				if [ ! -f "$rk_dm_target_image" ]; then
					msg_error "not found file: $i"
					exit 1
				fi
				cnt=$(( cnt + 1 ))
				;;
			-o|--output_image)
				rk_dm_image_out_dir=$2
				if [ ! -d "$rk_dm_image_out_dir" ]; then
					msg_error "not found directory: $rk_dm_image_out_dir"
					exit 1
				fi
				cnt=$(( cnt + 1 ))
				;;
			--setup_misc)
				# the cipher is aes-cbc-plain, the key is 64 bytes
				rk_dm_crypt_setup_misc $2 $3 64 $4
				;;
			--misc_img)
				rk_dm_misc_img=$2
				cnt=$(( cnt + 1 ))
				;;
			--verity)
				__cmd="rk_dm_setup_system_verity"
				;;
			--crypt)
				__cmd="rk_dm_setup_system_encryption"
				;;
			--create_crypt_key)
				__cmd="rk_dm_create_crypt_key"
				;;
			--dm_part)
				if [ -z "$2" ]; then
					msg_error "Not found device mapper partition"
					exit 1
				fi
				rk_dm_partition=$2
				;;
			--partition)
				if [ -z "$2" ]; then
					msg_error " Not found partition info"
					exit 1
				fi
				rk_dm_partition_table=$2
				;;
			--init_dst)
				rk_dm_init_dst=$2
				if [ ! -d "$(dirname $rk_dm_init_dst)" ]; then
					msg_error "not found directory: $rk_dm_init_dst"
					exit 1
				fi
				;;
			--init_src)
				rk_dm_init_src=$2
				if [ ! -f "$rk_dm_init_src" ]; then
					msg_error "not found file: $rk_dm_init_src"
					exit 1
				fi
				;;
			--crypt_key_save_dir)
				rk_dm_crypt_key_save_dir=$2
				if [ ! -d "$rk_dm_crypt_key_save_dir" ];then
					msg_error "Not found crypt key save dir"
					exit 1
				fi
				;;
			*)
				;;
		esac
		shift
	done

	rk_dm_info_file=$(dirname $0)/dm_security.info

	rk_dm_init_cmd="mkdir -p /dev/block/by-name"
	IFS=,;for i in $rk_dm_partition_table; do
		partname=${i%%@*}
		devnode=${i##*@}
		if [ "$partname" == "$rk_dm_partition" ]; then
			rk_dm_partition=$devnode
		fi
		# echo "link [$devnode /dev/block/by-name/$partname]"
		rk_dm_init_cmd="${rk_dm_init_cmd};ln -sf $devnode /dev/block/by-name/$partname"
	done

	if [ ! "/dev" == "${rk_dm_partition:0:4}" ]; then
		msg_error "Not found device mapper partition: $rk_dm_partition"
		exit 1
	fi
	rk_dm_image_out=$rk_dm_image_out_dir/$(basename $rk_dm_target_image)
}
# -----------------------------------
# For SDK
# -----------------------------------
chk_param $@

eval $__cmd $rk_dm_target_image $rk_dm_image_out_dir
