#!/bin/bash

if [ ! -f "busybox_patched_done" ]; then
patch -p1 < 0001-build-system-Make-it-possible-to-build-with-64bit-ti.patch
patch -p1 < 0002-halt-Support-rebooting-with-arg.patch
patch -p1 < 0008-busybox-support-chinese-display-in-terminal.patch
touch busybox_patched_done
else
echo "busybox: patched done. skip"
fi
