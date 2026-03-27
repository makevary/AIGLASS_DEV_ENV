cd bsp/rockchip/rv1103b-mcu

# clean
scons -c

# config (optional)
scons --menuconfig

# build
scons -j11

# generate firmware image: rtthread.bin

# application path: applications/battery-ipc/
