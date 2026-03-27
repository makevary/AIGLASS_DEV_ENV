cmd_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o := /opt/aiglass_dev_env/sysdrv/source/kernel/scripts/gcc-wrapper.py arm-rockchip831-linux-uclibcgnueabihf-gcc -Wp,-MMD,/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/.vsnprintf_s.o.d -nostdinc -isystem /opt/aiglass_dev_env/tools/linux/toolchain/arm-rockchip831-linux-uclibcgnueabihf/bin/../lib/gcc/arm-rockchip831-linux-uclibcgnueabihf/8.3.0/include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include -I./arch/arm/include/generated -I/opt/aiglass_dev_env/sysdrv/source/kernel/include -I./include -I/opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi -I./include/generated/uapi -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h -include /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/compiler_types.h -D__KERNEL__ -mlittle-endian -fmacro-prefix-map=/opt/aiglass_dev_env/sysdrv/source/kernel/= -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration -Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mfpu=vfp -funwind-tables -mthumb -Wa,-mimplicit-it=always -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Os --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fstack-protector -Werror -Wimplicit-fallthrough -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init -Wno-packed-not-aligned -D_PRE_PLATFORM_JZ=1 -D_PRE_PLATFORM_HISILICON=2 -D_PRE_OS_PLATFORM=_PRE_PLATFORM_JZ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//wal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//inc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel//libsec -DRFKILL_RK -std=gnu99 -Wno-declaration-after-statement -fsigned-char -freg-struct-return -Wtrampolines -Wfloat-equal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/hcc -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/ipcm -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/include -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/sdio -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oal -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/oam -I/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/uart  -DMODULE  -DKBUILD_BASENAME='"vsnprintf_s"' -DKBUILD_MODNAME='"hichannel"' -D__KBUILD_MODNAME=kmod_hichannel -c -o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.c

source_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o := /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.c

deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o := \
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
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/secureprintoutput.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/securecutil.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/securec.h \
  /opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/securectype.h \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/limits.h \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bitops.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/const.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/bits.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/build_bug.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
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
    $(wildcard include/config/thumb2/kernel.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
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
    $(wildcard include/config/arm/lpae.h) \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/swab.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/swab.h \
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
    $(wildcard include/config/debug/lock/alloc.h) \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/bpf/events.h) \
    $(wildcard include/config/jump/label.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/kprobes.h) \
    $(wildcard include/config/have/static/call/inline.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/function/error/injection.h) \
    $(wildcard include/config/module/sig.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/stat.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
    $(wildcard include/config/posix/timers.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/math64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time64.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/time.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/time_types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/time32.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/timex.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time32.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/vdso/time.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/highuid.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kmod.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/umh.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/gfp.h \
    $(wildcard include/config/cma.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/contig/alloc.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/instrumentation.h \
    $(wildcard include/config/debug/entry.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/shadow/call/stack.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock.h \
    $(wildcard include/config/preemption.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/trace/preempt/toggle.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/preempt.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/restart_block.h \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/glue.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/pgtable-2level-types.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sizes.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/memory_model.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pfn.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/getorder.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/bottom_half.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/lockdep.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
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
  arch/arm/include/generated/asm/mmiowb.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/mmiowb.h \
    $(wildcard include/config/mmiowb.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_up.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rwlock.h \
    $(wildcard include/config/preempt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/spinlock_api_up.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/current.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/wait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
    $(wildcard include/config/numa/keep/meminfo.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/seqlock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/osq_lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/debug_locks.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/android_vendor.h \
    $(wildcard include/config/android/vendor/oem/data.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ww_mutex.h \
    $(wildcard include/config/debug/ww/mutex/slowpath.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/nodemask.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/page-flags-layout.h \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/kasan/hw/tags.h) \
  include/generated/bounds.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mm_types.h \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/speculative/page/fault.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/iommu/support.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/auxvec.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rbtree.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tasks/rcu/generic.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tasks/trace/rcu.h) \
    $(wildcard include/config/tasks/rude/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcutiny.h \
    $(wildcard include/config/srcu.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/debug/rwsems.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/err.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/completion.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/swait.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/ktime.h \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rcu_segcblist.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/srcutiny.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/arch_topology.h \
    $(wildcard include/config/generic/arch/topology.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
    $(wildcard include/config/bl/switcher.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/topology.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/sysctl.h \
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
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/uapi/asm/unistd.h \
  arch/arm/include/generated/uapi/asm/unistd-eabi.h \
  arch/arm/include/generated/uapi/asm/unistd-common.h \
  arch/arm/include/generated/asm/unistd-nr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/vdso/cp15.h \
    $(wildcard include/config/cpu/cp15.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/user.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/elf.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/uapi/linux/elf-em.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/sysfs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/idr.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/radix-tree.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/xarray.h \
    $(wildcard include/config/xarray/multi.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kconfig.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/local_lock.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/local_lock_internal.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kobject_ns.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/kref.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/refcount.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/jump_label.h \
    $(wildcard include/config/have/arch/jump/label/relative.h) \
  /opt/aiglass_dev_env/sysdrv/source/kernel/arch/arm/include/asm/jump_label.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/rbtree_latch.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/error-injection.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/asm-generic/error-injection.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/tracepoint-defs.h \
  /opt/aiglass_dev_env/sysdrv/source/kernel/include/linux/static_key.h \
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

/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o: $(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o)

$(deps_/opt/aiglass_dev_env/sysdrv/drv_ko/wifi/hichannel/libsec/vsnprintf_s.o):
