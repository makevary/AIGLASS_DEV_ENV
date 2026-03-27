#!/bin/bash

err_handler() {
	ret=$?
	[ "$ret" -eq 0 ] && return

	msg_error "Running ${FUNCNAME[1]} failed!"
	msg_error "exit code $ret from line ${BASH_LINENO[0]}:"
	msg_info "    $BASH_COMMAND"
	exit $ret
}

trap 'err_handler' ERR
# source files
src=$1
# generate image
dst=$2

# external parameter
eraseblock_size_8K_flag="$4"

if [ -z "$3" -o -z "$dst" -o ! -d "$src" ]; then
	echo "command format: $(basename $0) <source> <dest image> <partition size>"
	exit 0
fi

if [ "$eraseblock_size_8K_flag" = "JFFS2_EB_4KB" ]; then
	option_parameter="-e 4096"
fi

# the size of generate image, get info from parameter.txt
# eg. 0x00040000@0x00016000(rootfs)
# calculate size fo rootfs partition: 0x00040000 * 512 = 128*0x100000 (Bytes)
dst_size="$(( $3 ))"

cwd=$(dirname $(readlink -f $0))
export PATH=$cwd:$PATH

rm -f $dst
mkdir -p $(dirname $dst)

echo "mkfs.jffs2 -r $src -o $dst -n --pad=$dst_size -x rtime $option_parameter"
mkfs.jffs2 -r $src -o $dst -n --pad=$dst_size -x rtime $option_parameter
if [ $? != 0 ]; then
	echo "*** make the jffs2 filesystem image error !!!"
	exit 1
fi
