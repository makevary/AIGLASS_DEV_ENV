cmd_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o := /opt/aiglass_dev_env/sysdrv/source/kernel/scripts/gcc-wrapper.py arm-rockchip831-linux-uclibcgnueabihf-gcc -Wp,-MMD,/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/.oal_util.o.d -nostdinc -isystem /opt/aiglass_dev_env/tools/linux/toolchain/arm-rockchip831-linux-uclibcgnueabihf/bin/../lib/gcc/arm-rockchip831-linux-uclibcgnueabihf/8.3.0/include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include -I./arch/arm/include/generated -I/opt/aiglass_dev_env/sysdrv/source/kernel/include -I./include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi -I./include/generated/uapi -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -fmacro-prefix-map=/opt/aiglass_dev_env/sysdrv/source/kernel/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -mthumb -Wa,-mimplicit-it=always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Os --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fstack-protector -Werror -Wimplicit-fallthrough -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -D_PRE_PLATFORM_JZ=1 -D_PRE_PLATFORM_HISILICON=2 -D_PRE_OS_PLATFORM=_PRE_PLATFORM_JZ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//wal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//libsec -DRFKILL_RK -std=gnu99 -Wno-declaration-after-statement -fsigned-char -freg-struct-return -Wtrampolines -Wfloat-equal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ipcm -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/include -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/uart  -DMODULE  -DKBUILD_BASENAME='"oal_util"' -DKBUILD_MODNAME='"hichannel"' -D__KBUILD_MODNAME=kmod_hichannel -c -o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.c

source_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o := /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.c

deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o := \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h \
    $(wildcard include/config/cc/version/text.h) \
    $(wildcard include/config/cpu/big/endian.h) \
    $(wildcard include/config/booger.h) \
    $(wildcard include/config/foo.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h \
    $(wildcard include/config/have/arch/compiler/h.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/cc/has/asm/inline.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_attributes.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler-gcc.h \
    $(wildcard include/config/arm64.h) \
    $(wildcard include/config/retpoline.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
    $(wildcard include/config/kcov.h) \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
    $(wildcard include/config/kasan/generic.h) \
    $(wildcard include/config/kasan/sw/tags.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h \
  arch/arm/include/generated/asm/rwonce.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/rwonce.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kasan-checks.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/int-ll64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitsperlong.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/bitsperlong.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/posix_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stddef.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/stddef.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/posix_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/posix_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kcsan-checks.h \
    $(wildcard include/config/kcsan.h) \
    $(wildcard include/config/kcsan/ignore/atomics.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/string.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/string.h \
  include/generated/uapi/linux/version.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/hi_types_base.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/hi_errno.h \

/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o: $(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o)

$(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal/oal_util.o):
