cmd_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o := /opt/aiglass_dev_env/sysdrv/source/kernel/scripts/gcc-wrapper.py arm-rockchip831-linux-uclibcgnueabihf-gcc -Wp,-MMD,/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/.sdio_host.o.d -nostdinc -isystem /opt/aiglass_dev_env/tools/linux/toolchain/arm-rockchip831-linux-uclibcgnueabihf/bin/../lib/gcc/arm-rockchip831-linux-uclibcgnueabihf/8.3.0/include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include -I./arch/arm/include/generated -I/opt/aiglass_dev_env/sysdrv/source/kernel/include -I./include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi -I./include/generated/uapi -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -fmacro-prefix-map=/opt/aiglass_dev_env/sysdrv/source/kernel/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -mthumb -Wa,-mimplicit-it=always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Os --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fstack-protector -Werror -Wimplicit-fallthrough -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -D_PRE_PLATFORM_JZ=1 -D_PRE_PLATFORM_HISILICON=2 -D_PRE_OS_PLATFORM=_PRE_PLATFORM_JZ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//wal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//libsec -DRFKILL_RK -std=gnu99 -Wno-declaration-after-statement -fsigned-char -freg-struct-return -Wtrampolines -Wfloat-equal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ipcm -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/include -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/uart  -DMODULE  -DKBUILD_BASENAME='"sdio_host"' -DKBUILD_MODNAME='"hichannel"' -D__KBUILD_MODNAME=kmod_hichannel -c -o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.c

source_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o := /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.c

deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o := \
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
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc/hcc_host.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_mutex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  arch/arm/include/generated/asm/current.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/current.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/posix_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/posix_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/bug.h \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/linkage.h \
    $(wildcard include/config/arch/use/sym/annotations.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stringify.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/export.h \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/have/arch/prel32/relocations.h) \
    $(wildcard include/config/cfi/clang.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/linkage.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/cpu/endian/be32.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  arch/arm/include/generated/asm/rwonce.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/rwonce.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kasan-checks.h \
    $(wildcard include/config/kasan/generic.h) \
    $(wildcard include/config/kasan/sw/tags.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kcsan-checks.h \
    $(wildcard include/config/kcsan.h) \
    $(wildcard include/config/kcsan/ignore/atomics.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
    $(wildcard include/config/smp.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/instrumentation.h \
    $(wildcard include/config/debug/entry.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/preempt/rt.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/limits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/limits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/limits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bitops.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/bits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/build_bug.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/bitops.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/typecheck.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/ptrace.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/hwcap.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/hwcap.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/irqflags.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/percpu.h \
    $(wildcard include/config/cpu/v6.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/percpu.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/spectre.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/barrier.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/non-atomic.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/builtin-__fls.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/builtin-__ffs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/builtin-fls.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/builtin-ffs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/ffz.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/fls64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/sched.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/hweight.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/arch_hweight.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/const_hweight.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/atomic.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/prefetch.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/binfmt/elf/fdpic.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/hw_breakpoint.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/unified.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vdso/processor.h \
    $(wildcard include/config/arm/errata/754327.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/cmpxchg-local.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/atomic-fallback.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/atomic-long.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/le.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/byteorder.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/byteorder/little_endian.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/byteorder/little_endian.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/byteorder/generic.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kstrtox.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/minmax.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/quiet.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/dynamic/debug/core.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
    $(wildcard include/config/lto/clang.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kern_levels.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ratelimit_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/param.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_types.h \
    $(wildcard include/config/debug/spinlock.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_types_up.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/lockdep_types.h \
    $(wildcard include/config/prove/raw/lock/nesting.h) \
    $(wildcard include/config/preempt/lock.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rwlock_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/div64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/compiler.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/div64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/kernel.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sysinfo.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/restart_block.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/math64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/time.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/time_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/errno.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/errno.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/errno.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/errno-base.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/stackprotector/per/task.h) \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/glue.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable-2level-types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/virtual.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sizes.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pfn.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/getorder.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/lockdep.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
    $(wildcard include/config/preempt/count.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bitmap.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/string.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/string.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/smp_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/osq_lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/debug_locks.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/android_vendor.h \
    $(wildcard include/config/android/vendor/oem/data.h) \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/hi_types_base.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/hi_errno.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_wait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/wait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock.h \
    $(wildcard include/config/preemption.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/preempt.h \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/preempt.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bottom_half.h \
  arch/arm/include/generated/asm/mmiowb.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_up.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_api_up.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/wait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/uclamp/task.h) \
    $(wildcard include/config/uclamp/buckets/count.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tasks/trace/rcu.h) \
    $(wildcard include/config/psi.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/cpu/freq/times.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/cputimers.h) \
    $(wildcard include/config/posix/cpu/timers/task/work.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/io/uring.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/ubsan/trap.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/x86/cpu/resctrl.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/rseq.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/kunit.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/gcc/plugin/stackleak.h) \
    $(wildcard include/config/x86/mce.h) \
    $(wildcard include/config/rt/softint/optimization.h) \
    $(wildcard include/config/arch/task/struct/on/stack.h) \
    $(wildcard include/config/debug/rseq.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sched.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rculist.h \
    $(wildcard include/config/prove/rcu/list.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcupdate.h \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tasks/rcu/generic.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rude/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcutiny.h \
    $(wildcard include/config/srcu.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/refcount.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sem.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sem.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ipc.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/highuid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rhashtable-types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ktime.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
    $(wildcard include/config/posix/timers.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time32.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time32.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/jiffies.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/jiffies.h \
  include/generated/timeconst.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/ktime.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timekeeping.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timekeeping32.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/android_kabi.h \
    $(wildcard include/config/android/kabi/reserve.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/ipc.h \
  arch/arm/include/generated/uapi/asm/ipcbuf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/uapi/asm/sembuf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/sembuf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/shm.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/shm.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm/include/generated/uapi/asm/shmbuf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/shmbuf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/shmparam.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kcov.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/kcov.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/plist.h \
    $(wildcard include/config/debug/plist.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hrtimer_defs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rbtree.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/seqlock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ww_mutex.h \
    $(wildcard include/config/debug/ww/mutex/slowpath.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timerqueue.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/seccomp.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/seccomp.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/seccomp.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/unistd.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/unistd.h \
  arch/arm/include/generated/uapi/asm/unistd-eabi.h \
  arch/arm/include/generated/uapi/asm/unistd-common.h \
  arch/arm/include/generated/asm/unistd-nr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/nodemask.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
    $(wildcard include/config/numa/keep/meminfo.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/resource.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/resource.h \
  arch/arm/include/generated/uapi/asm/resource.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/resource.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/resource.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/latencytop.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/prio.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/signal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/signal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/signal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/signal-defs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/uapi/asm/siginfo.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/siginfo.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/posix-timers.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/alarmtimer.h \
    $(wildcard include/config/rtc/class.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/task_work.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/rseq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kcsan.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_timer.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_workqueue.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/proc_fs.h \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/proc/pid/arch/status.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fs.h \
    $(wildcard include/config/read/only/thp/for/fs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/fs/verity.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/unicode.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/wait_bit.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kdev_t.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/kdev_t.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dcache.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rculist_bl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/list_bl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bit_spinlock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  include/generated/bounds.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/path.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/list_lru.h \
    $(wildcard include/config/memcg/kmem.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/shrinker.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/radix-tree.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/gfp.h \
    $(wildcard include/config/cma.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shadow/call/stack.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page-flags-layout.h \
    $(wildcard include/config/kasan/hw/tags.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/speculative/page/fault.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/iommu/support.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/err.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/completion.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/swait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uprobes.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
    $(wildcard include/config/vdso.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/page/idle/flag.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/notifier.h \
    $(wildcard include/config/tree/srcu.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcu_segcblist.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/srcutiny.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
    $(wildcard include/config/bl/switcher.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/topology.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/local_lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/local_lock_internal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/capability.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/capability.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/semaphore.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fcntl.h \
    $(wildcard include/config/arch/32bit/off/t.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/fcntl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/fcntl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/fcntl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/openat2.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/migrate_mode.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu-rwsem.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcuwait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/stack/growsup.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/signal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/jobctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/task.h \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
    $(wildcard include/config/have/arch/thread/struct/whitelist.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uaccess.h \
    $(wildcard include/config/set/fs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fault-inject-usercopy.h \
    $(wildcard include/config/fault/injection/usercopy.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/instrumented.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/uaccess/with/memcpy.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  arch/arm/include/generated/asm/extable.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/extable.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/key.h \
    $(wildcard include/config/key/notifications.h) \
    $(wildcard include/config/net.h) \
    $(wildcard include/config/sysctl.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sysctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sysctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/watch/queue.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ratelimit.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcu_sync.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/delayed_call.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uuid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/uuid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/errseq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ioprio.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/rt.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/iocontext.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fs_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/fs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/uapi/asm/ioctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/ioctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/ioctl.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu_counter.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/dqblk_xfs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dqblk_v1.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dqblk_v2.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dqblk_qtree.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/projid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/quota.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/nfs_fs_i.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/irq/timings.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqreturn.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqnr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/irqnr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hardirq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/static_key.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/jump_label.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ftrace_irq.h \
    $(wildcard include/config/hwlat/tracer.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/hardirq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irq_cpustat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kref.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/sections.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/sections.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/hi_types.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_util.h \
  include/generated/uapi/linux/version.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_wakelock.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_mutex.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_thread.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kthread.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam/oam_ext_if.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_util.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam/oam_main.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam/oam_ext_if.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam/oam_log.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sched/types.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc/hcc_comm.h \
    $(wildcard include/config/hcc/debug.h) \
    $(wildcard include/config/hcc/tx/multi/buf/check.h) \
    $(wildcard include/config/hcc/header/check/sum.h) \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc/osal_list.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_spinlock.h \
    $(wildcard include/config/spin/lock/magic/debug.h) \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_completion.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc/hcc_comm.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/sdio_func.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/energy/model.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/ops.h) \
    $(wildcard include/config/dma/declare/coherent.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/arch/has/sync/dma/for/device.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu.h) \
    $(wildcard include/config/arch/has/sync/dma/for/cpu/all.h) \
    $(wildcard include/config/dma/ops/bypass.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dev_printk.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/energy_model.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sysfs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/idr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kobject_ns.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/cpufreq.h \
    $(wildcard include/config/cpu/freq.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/topology.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/sched/mc.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/idle.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ioport.h \
    $(wildcard include/config/io/strict/devmem.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/klist.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/overflow.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/device/bus.h \
    $(wildcard include/config/acpi.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/device/class.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/device/driver.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/arch/omap.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pm_wakeup.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mod_devicetable.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/pm.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/card.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/host.h \
    $(wildcard include/config/mmc/crypto.h) \
    $(wildcard include/config/regulator.h) \
    $(wildcard include/config/fail/mmc/request.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fault-inject.h \
    $(wildcard include/config/fault/injection/debug/fs.h) \
    $(wildcard include/config/failslab.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/core.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/dma-direction.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/keyslot-manager.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bio.h \
    $(wildcard include/config/blk/dev/integrity.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/highmem.h \
    $(wildcard include/config/x86/32.h) \
    $(wildcard include/config/debug/highmem.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/arch/has/pkeys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/sparc64.h) \
    $(wildcard include/config/arm64/mte.h) \
    $(wildcard include/config/have/arch/userfaultfd/minor.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/dev/pagemap/ops.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/pci/p2pdma.h) \
    $(wildcard include/config/arch/has/pte/special.h) \
    $(wildcard include/config/arch/has/pte/devmap.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/arch/has/set/direct/map.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
    $(wildcard include/config/mapping/dirty/helpers.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmap_lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/range.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu-refcount.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page_ext.h \
    $(wildcard include/config/page/pinner.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/arch/stackwalk.h) \
    $(wildcard include/config/have/reliable/stacktrace.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stackdepot.h \
    $(wildcard include/config/stackdepot.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/tracepoint-defs.h \
    $(wildcard include/config/tracepoints.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/memremap.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pgtable.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/highpte.h) \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/big/little.h) \
    $(wildcard include/config/harden/branch/predictor.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/pj4b.h) \
    $(wildcard include/config/cpu/v7.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/pgtable-nopud.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/pgtable-nop4d.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable-hwdef.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/arm/errata/720789.h) \
    $(wildcard include/config/arm/errata/798181.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable-2level.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/pgtable_uffd.h \
    $(wildcard include/config/have/arch/userfaultfd/wp.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kasan.h \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/kasan/stack.h) \
    $(wildcard include/config/kasan/vmalloc.h) \
    $(wildcard include/config/kasan/inline.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kasan-enabled.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page_pinner.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/huge_mm.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/cacheflush.h \
    $(wildcard include/config/arm/errata/411920.h) \
    $(wildcard include/config/cpu/cache/vipt.h) \
    $(wildcard include/config/outer/cache.h) \
    $(wildcard include/config/frame/pointer.h) \
    $(wildcard include/config/cpu/icache/mismatch/workaround.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/glue-cache.h \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
    $(wildcard include/config/cache/b15/rac.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/cachetype.h \
    $(wildcard include/config/cpu/cache/vivt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/kmap_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mempool.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/blk_types.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/blk/cgroup/iocost.h) \
    $(wildcard include/config/blk/inline/encryption.h) \
    $(wildcard include/config/dm/default/key.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/blk-crypto.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/blkdev.h \
    $(wildcard include/config/blk/rq/alloc/time.h) \
    $(wildcard include/config/blk/wbt.h) \
    $(wildcard include/config/blk/dev/zoned.h) \
    $(wildcard include/config/blk/dev/bsg.h) \
    $(wildcard include/config/blk/dev/throttling.h) \
    $(wildcard include/config/blk/debug/fs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/clock.h \
    $(wildcard include/config/have/unstable/sched/clock.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/major.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/genhd.h \
    $(wildcard include/config/fail/make/request.h) \
    $(wildcard include/config/cdrom.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/rockchip/mini/kernel.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
  arch/arm/include/generated/asm/local.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/local.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pagemap.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hugetlb_inline.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sched/debug.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/backing-dev-defs.h \
    $(wildcard include/config/debug/fs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/flex_proportions.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bsg.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/bsg.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/scatterlist.h \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/sgl/alloc.h) \
    $(wildcard include/config/arch/no/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/io.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/generic/ioremap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/logic_pio.h \
    $(wildcard include/config/indirect/pio.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/fwnode.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/vmalloc.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vmalloc.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/blkzoned.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/elevator.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/hashtable.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc/hcc_list.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal/oal_mm.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//libsec/securec.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//libsec/securectype.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/module.h \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/have/static/call/inline.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
    $(wildcard include/config/module/sig.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kmod.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/umh.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/elf.h \
    $(wildcard include/config/arch/use/gnu/property.h) \
    $(wildcard include/config/arch/have/elf/prot.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/elf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vdso_datapage.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/datapage.h \
    $(wildcard include/config/arch/has/vdso/data.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/asm-generic/errno-base.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/clocksource.h \
    $(wildcard include/config/generic/gettimeofday.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/processor.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vdso/gettimeofday.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vdso/cp15.h \
    $(wildcard include/config/cpu/cp15.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/user.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/elf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/elf-em.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/moduleparam.h \
    $(wildcard include/config/ppc64.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rbtree_latch.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/error-injection.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/error-injection.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/static_call_types.h \
    $(wildcard include/config/have/static/call.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/cfi.h \
    $(wildcard include/config/cfi/clang/shadow.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/delay.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/delay.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/gpio.h \
    $(wildcard include/config/gpiolib.h) \
    $(wildcard include/config/arch/have/custom/gpio/h.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/gpio.h \
    $(wildcard include/config/arch/nr/gpio.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/gpio.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/gpio/driver.h \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/gpio/generic.h) \
    $(wildcard include/config/gpiolib/irqchip.h) \
    $(wildcard include/config/of/gpio.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irq.h \
    $(wildcard include/config/generic/irq/effective/aff/mask.h) \
    $(wildcard include/config/generic/irq/ipi.h) \
    $(wildcard include/config/generic/irq/migration.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
    $(wildcard include/config/generic/irq/multi/handler.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqhandler.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/io.h \
  arch/arm/include/generated/asm/irq_regs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/irq_regs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqdesc.h \
    $(wildcard include/config/generic/irq/debugfs.h) \
    $(wildcard include/config/handle/domain/irq.h) \
    $(wildcard include/config/irq/domain.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/hw_irq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqchip/chained_irq.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/irqdomain.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/of.h \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/of/overlay.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/property.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/pinctrl.h \
    $(wildcard include/config/generic/pinconf.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/seq_file.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/pinctrl-state.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/devinfo.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/consumer.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/pinconf-generic.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pinctrl/machine.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/gpio/consumer.h \
    $(wildcard include/config/gpio/sysfs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pm_runtime.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmc/sdio.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rfkill-wlan.h \
    $(wildcard include/config/rfkill/rk.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/clk.h \
    $(wildcard include/config/common/clk.h) \
    $(wildcard include/config/have/clk/prepare.h) \
    $(wildcard include/config/have/clk.h) \

/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o: $(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o)

$(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio/sdio_host.o):
