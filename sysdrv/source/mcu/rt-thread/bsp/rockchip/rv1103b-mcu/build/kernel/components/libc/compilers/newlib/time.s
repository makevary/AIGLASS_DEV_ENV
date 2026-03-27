	.file	"time.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.gettimeofday.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"rtc"
	.section	.text.gettimeofday,"ax",@progbits
	.align	1
	.globl	gettimeofday
	.type	gettimeofday, @function
gettimeofday:
.LFB37:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/libc/compilers/newlib/time.c"
	.loc 1 14 1
	.cfi_startproc
.LVL0:
	.loc 1 15 5
	.loc 1 16 5
	.loc 1 18 5
	.loc 1 14 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 18 14
	lla	a0,.LC0
.LVL1:
	.loc 1 14 1
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 18 14
	call	rt_device_find
.LVL2:
	.loc 1 19 5 is_stmt 1
	.loc 1 19 8 is_stmt 0
	beq	a0,zero,.L4
	.loc 1 21 9 is_stmt 1
	addi	a2,sp,8
	li	a1,16
	call	rt_device_control
.LVL3:
	.loc 1 22 9
	.loc 1 22 12 is_stmt 0
	beq	s0,zero,.L3
	.loc 1 24 13 is_stmt 1
	.loc 1 24 24 is_stmt 0
	lw	a4,8(sp)
	lw	a5,12(sp)
	.loc 1 25 25
	sw	zero,8(s0)
	.loc 1 24 24
	sw	a4,0(s0)
	sw	a5,4(s0)
	.loc 1 25 13 is_stmt 1
.L3:
	.loc 1 28 9
	.loc 1 28 16 is_stmt 0
	lw	a0,8(sp)
.L1:
	.loc 1 32 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL4:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL5:
.L4:
	.cfi_restore_state
	.loc 1 31 12
	li	a0,0
.LVL6:
	j	.L1
	.cfi_endproc
.LFE37:
	.size	gettimeofday, .-gettimeofday
	.section	.text.time,"ax",@progbits
	.align	1
	.globl	time
	.type	time, @function
time:
.LFB38:
	.loc 1 50 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 51 5
	.loc 1 74 5
	.loc 1 74 8 is_stmt 0
	beq	a0,zero,.L10
	.loc 1 76 9 is_stmt 1
	.loc 1 76 12 is_stmt 0
	li	a5,0
	li	a6,0
	sw	a5,0(a0)
	sw	a6,4(a0)
.L10:
	.loc 1 79 5 is_stmt 1
	.loc 1 80 1 is_stmt 0
	li	a0,0
.LVL8:
	li	a1,0
	ret
	.cfi_endproc
.LFE38:
	.size	time, .-time
	.section	.text.clock,"ax",@progbits
	.align	1
	.weak	clock
	.type	clock, @function
clock:
.LFB39:
	.loc 1 83 1 is_stmt 1
	.cfi_startproc
	.loc 1 84 5
	.loc 1 84 12 is_stmt 0
	tail	rt_tick_get
.LVL9:
	.cfi_endproc
.LFE39:
	.size	clock, .-clock
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_timeval.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/types.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/time.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/time.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x52d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF80
	.byte	0xc
	.4byte	.LASF81
	.4byte	.LASF82
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0xc8
	.byte	0x17
	.4byte	0x4f
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x5
	.byte	0x4
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0xd2
	.byte	0xe
	.4byte	0x41
	.byte	0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x25
	.byte	0x17
	.4byte	0x79
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x2a
	.byte	0x19
	.4byte	0x5d
	.byte	0x6
	.4byte	.LASF24
	.byte	0x10
	.byte	0x4
	.byte	0x36
	.byte	0x8
	.4byte	0xc5
	.byte	0x7
	.4byte	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.4byte	0x91
	.byte	0
	.byte	0x7
	.4byte	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0xe
	.4byte	0x85
	.byte	0x8
	.byte	0
	.byte	0x3
	.4byte	.LASF15
	.byte	0x5
	.byte	0x6b
	.byte	0x17
	.4byte	0x48
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x8
	.4byte	0xd1
	.4byte	0xe8
	.byte	0x9
	.4byte	0x70
	.byte	0x7
	.byte	0
	.byte	0x3
	.4byte	.LASF17
	.byte	0x6
	.byte	0x3d
	.byte	0x17
	.4byte	0x2c
	.byte	0x3
	.4byte	.LASF18
	.byte	0x6
	.byte	0x3e
	.byte	0x18
	.4byte	0x3a
	.byte	0x3
	.4byte	.LASF19
	.byte	0x6
	.byte	0x44
	.byte	0xe
	.4byte	0x41
	.byte	0x3
	.4byte	.LASF20
	.byte	0x6
	.byte	0x45
	.byte	0x17
	.4byte	0x48
	.byte	0x3
	.4byte	.LASF21
	.byte	0x6
	.byte	0x47
	.byte	0x13
	.4byte	0x100
	.byte	0x3
	.4byte	.LASF22
	.byte	0x6
	.byte	0x4b
	.byte	0x14
	.4byte	0x10c
	.byte	0x3
	.4byte	.LASF23
	.byte	0x6
	.byte	0x4d
	.byte	0x13
	.4byte	0x100
	.byte	0xa
	.4byte	.LASF25
	.byte	0x8
	.byte	0x6
	.2byte	0x12c
	.byte	0x8
	.4byte	0x167
	.byte	0xb
	.4byte	.LASF26
	.byte	0x6
	.2byte	0x12e
	.byte	0x1a
	.4byte	0x167
	.byte	0
	.byte	0xb
	.4byte	.LASF27
	.byte	0x6
	.2byte	0x12f
	.byte	0x1a
	.4byte	0x167
	.byte	0x4
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x13c
	.byte	0xd
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x131
	.byte	0x1d
	.4byte	0x13c
	.byte	0xa
	.4byte	.LASF29
	.byte	0x14
	.byte	0x6
	.2byte	0x14a
	.byte	0x8
	.4byte	0x1c1
	.byte	0xb
	.4byte	.LASF30
	.byte	0x6
	.2byte	0x14c
	.byte	0xa
	.4byte	0xd8
	.byte	0
	.byte	0xb
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x14d
	.byte	0x10
	.4byte	0xe8
	.byte	0x8
	.byte	0xb
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x14e
	.byte	0x10
	.4byte	0xe8
	.byte	0x9
	.byte	0xb
	.4byte	.LASF33
	.byte	0x6
	.2byte	0x153
	.byte	0xf
	.4byte	0x16d
	.byte	0xc
	.byte	0
	.byte	0xe
	.4byte	.LASF83
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x6
	.2byte	0x319
	.byte	0x6
	.4byte	0x259
	.byte	0xf
	.4byte	.LASF34
	.byte	0
	.byte	0xf
	.4byte	.LASF35
	.byte	0x1
	.byte	0xf
	.4byte	.LASF36
	.byte	0x2
	.byte	0xf
	.4byte	.LASF37
	.byte	0x3
	.byte	0xf
	.4byte	.LASF38
	.byte	0x4
	.byte	0xf
	.4byte	.LASF39
	.byte	0x5
	.byte	0xf
	.4byte	.LASF40
	.byte	0x6
	.byte	0xf
	.4byte	.LASF41
	.byte	0x7
	.byte	0xf
	.4byte	.LASF42
	.byte	0x8
	.byte	0xf
	.4byte	.LASF43
	.byte	0x9
	.byte	0xf
	.4byte	.LASF44
	.byte	0xa
	.byte	0xf
	.4byte	.LASF45
	.byte	0xb
	.byte	0xf
	.4byte	.LASF46
	.byte	0xc
	.byte	0xf
	.4byte	.LASF47
	.byte	0xd
	.byte	0xf
	.4byte	.LASF48
	.byte	0xe
	.byte	0xf
	.4byte	.LASF49
	.byte	0xf
	.byte	0xf
	.4byte	.LASF50
	.byte	0x10
	.byte	0xf
	.4byte	.LASF51
	.byte	0x11
	.byte	0xf
	.4byte	.LASF52
	.byte	0x12
	.byte	0xf
	.4byte	.LASF53
	.byte	0x13
	.byte	0xf
	.4byte	.LASF54
	.byte	0x14
	.byte	0xf
	.4byte	.LASF55
	.byte	0x15
	.byte	0
	.byte	0xd
	.4byte	.LASF56
	.byte	0x6
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x266
	.byte	0xc
	.byte	0x4
	.4byte	0x26c
	.byte	0xa
	.4byte	.LASF57
	.byte	0x44
	.byte	0x6
	.2byte	0x387
	.byte	0x8
	.4byte	0x34d
	.byte	0xb
	.4byte	.LASF58
	.byte	0x6
	.2byte	0x389
	.byte	0x16
	.4byte	0x17a
	.byte	0
	.byte	0xb
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x38b
	.byte	0x1f
	.4byte	0x1c1
	.byte	0x14
	.byte	0xb
	.4byte	.LASF32
	.byte	0x6
	.2byte	0x38c
	.byte	0x11
	.4byte	0xf4
	.byte	0x18
	.byte	0xb
	.4byte	.LASF59
	.byte	0x6
	.2byte	0x38d
	.byte	0x11
	.4byte	0xf4
	.byte	0x1a
	.byte	0xb
	.4byte	.LASF60
	.byte	0x6
	.2byte	0x38f
	.byte	0x10
	.4byte	0xe8
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF61
	.byte	0x6
	.2byte	0x390
	.byte	0x10
	.4byte	0xe8
	.byte	0x1d
	.byte	0xb
	.4byte	.LASF62
	.byte	0x6
	.2byte	0x393
	.byte	0x10
	.4byte	0x3fe
	.byte	0x20
	.byte	0xb
	.4byte	.LASF63
	.byte	0x6
	.2byte	0x394
	.byte	0x10
	.4byte	0x418
	.byte	0x24
	.byte	0xb
	.4byte	.LASF64
	.byte	0x6
	.2byte	0x39a
	.byte	0x10
	.4byte	0x35c
	.byte	0x28
	.byte	0xb
	.4byte	.LASF65
	.byte	0x6
	.2byte	0x39b
	.byte	0x10
	.4byte	0x376
	.byte	0x2c
	.byte	0xb
	.4byte	.LASF66
	.byte	0x6
	.2byte	0x39c
	.byte	0x10
	.4byte	0x35c
	.byte	0x30
	.byte	0xb
	.4byte	.LASF67
	.byte	0x6
	.2byte	0x39d
	.byte	0x11
	.4byte	0x39a
	.byte	0x34
	.byte	0xb
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x39e
	.byte	0x11
	.4byte	0x3c5
	.byte	0x38
	.byte	0xb
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x39f
	.byte	0x10
	.4byte	0x3e4
	.byte	0x3c
	.byte	0xb
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x77
	.byte	0x40
	.byte	0
	.byte	0x10
	.4byte	0x118
	.4byte	0x35c
	.byte	0x11
	.4byte	0x259
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x34d
	.byte	0x10
	.4byte	0x118
	.4byte	0x376
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0xf4
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x362
	.byte	0x10
	.4byte	0x124
	.4byte	0x39a
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0x130
	.byte	0x11
	.4byte	0x77
	.byte	0x11
	.4byte	0x124
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x37c
	.byte	0x10
	.4byte	0x124
	.4byte	0x3be
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0x130
	.byte	0x11
	.4byte	0x3be
	.byte	0x11
	.4byte	0x124
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x3c4
	.byte	0x12
	.byte	0xc
	.byte	0x4
	.4byte	0x3a0
	.byte	0x10
	.4byte	0x118
	.4byte	0x3e4
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0x69
	.byte	0x11
	.4byte	0x77
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x3cb
	.byte	0x10
	.4byte	0x118
	.4byte	0x3fe
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0x124
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x3ea
	.byte	0x10
	.4byte	0x118
	.4byte	0x418
	.byte	0x11
	.4byte	0x259
	.byte	0x11
	.4byte	0x77
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x404
	.byte	0x13
	.4byte	.LASF71
	.byte	0x7
	.byte	0x38
	.byte	0x9
	.4byte	0xc5
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x442
	.byte	0x14
	.4byte	.LVL9
	.4byte	0x50a
	.byte	0
	.byte	0x13
	.4byte	.LASF72
	.byte	0x7
	.byte	0x3b
	.byte	0x8
	.4byte	0x91
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x478
	.byte	0x15
	.string	"t"
	.byte	0x1
	.byte	0x30
	.byte	0x15
	.4byte	0x478
	.4byte	.LLST3
	.byte	0x16
	.4byte	.LASF75
	.byte	0x1
	.byte	0x33
	.byte	0xc
	.4byte	0x91
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x91
	.byte	0x17
	.4byte	.LASF73
	.byte	0x8
	.2byte	0x1b0
	.byte	0x5
	.4byte	0x69
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x504
	.byte	0x15
	.string	"tp"
	.byte	0x1
	.byte	0xd
	.byte	0x22
	.4byte	0x504
	.4byte	.LLST0
	.byte	0x18
	.4byte	.LASF74
	.byte	0x1
	.byte	0xd
	.byte	0x2c
	.4byte	0x77
	.4byte	.LLST1
	.byte	0x19
	.4byte	.LASF72
	.byte	0x1
	.byte	0xf
	.byte	0xc
	.4byte	0x91
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x1a
	.4byte	.LASF76
	.byte	0x1
	.byte	0x10
	.byte	0x11
	.4byte	0x259
	.4byte	.LLST2
	.byte	0x1b
	.4byte	.LVL2
	.4byte	0x516
	.4byte	0x4ee
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0x1d
	.4byte	.LVL3
	.4byte	0x523
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x40
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x4
	.4byte	0x9d
	.byte	0x1e
	.4byte	.LASF77
	.4byte	.LASF77
	.byte	0x9
	.byte	0x4a
	.byte	0xb
	.byte	0x1f
	.4byte	.LASF78
	.4byte	.LASF78
	.byte	0x9
	.2byte	0x18e
	.byte	0xd
	.byte	0x1f
	.4byte	.LASF79
	.4byte	.LASF79
	.byte	0x9
	.2byte	0x1ac
	.byte	0xa
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LFE37
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL2-1
	.4byte	.LFE37
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF66:
	.string	"close"
.LASF15:
	.string	"clock_t"
.LASF23:
	.string	"rt_off_t"
.LASF18:
	.string	"rt_uint16_t"
.LASF68:
	.string	"write"
.LASF83:
	.string	"rt_device_class_type"
.LASF61:
	.string	"device_id"
.LASF13:
	.string	"tv_sec"
.LASF36:
	.string	"RT_Device_Class_NetIf"
.LASF79:
	.string	"rt_device_control"
.LASF2:
	.string	"short int"
.LASF52:
	.string	"RT_Device_Class_Miscellaneous"
.LASF41:
	.string	"RT_Device_Class_Graphic"
.LASF40:
	.string	"RT_Device_Class_Sound"
.LASF49:
	.string	"RT_Device_Class_Pipe"
.LASF51:
	.string	"RT_Device_Class_Timer"
.LASF70:
	.string	"user_data"
.LASF12:
	.string	"time_t"
.LASF21:
	.string	"rt_err_t"
.LASF54:
	.string	"RT_Device_Class_Touch"
.LASF58:
	.string	"parent"
.LASF81:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/libc/compilers/newlib/time.c"
.LASF53:
	.string	"RT_Device_Class_Sensor"
.LASF80:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF9:
	.string	"__int_least64_t"
.LASF48:
	.string	"RT_Device_Class_PM"
.LASF76:
	.string	"device"
.LASF24:
	.string	"timeval"
.LASF6:
	.string	"long long int"
.LASF4:
	.string	"long int"
.LASF60:
	.string	"ref_count"
.LASF29:
	.string	"rt_object"
.LASF19:
	.string	"rt_base_t"
.LASF42:
	.string	"RT_Device_Class_I2CBUS"
.LASF37:
	.string	"RT_Device_Class_MTD"
.LASF62:
	.string	"rx_indicate"
.LASF69:
	.string	"control"
.LASF1:
	.string	"unsigned char"
.LASF46:
	.string	"RT_Device_Class_SPIDevice"
.LASF82:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF73:
	.string	"gettimeofday"
.LASF7:
	.string	"long long unsigned int"
.LASF31:
	.string	"type"
.LASF8:
	.string	"unsigned int"
.LASF38:
	.string	"RT_Device_Class_CAN"
.LASF17:
	.string	"rt_uint8_t"
.LASF72:
	.string	"time"
.LASF56:
	.string	"rt_device_t"
.LASF44:
	.string	"RT_Device_Class_USBHost"
.LASF57:
	.string	"rt_device"
.LASF16:
	.string	"char"
.LASF64:
	.string	"init"
.LASF33:
	.string	"list"
.LASF3:
	.string	"short unsigned int"
.LASF75:
	.string	"time_now"
.LASF55:
	.string	"RT_Device_Class_Unknown"
.LASF59:
	.string	"open_flag"
.LASF67:
	.string	"read"
.LASF74:
	.string	"ignore"
.LASF47:
	.string	"RT_Device_Class_SDIO"
.LASF5:
	.string	"long unsigned int"
.LASF71:
	.string	"clock"
.LASF25:
	.string	"rt_list_node"
.LASF78:
	.string	"rt_device_find"
.LASF43:
	.string	"RT_Device_Class_USBDevice"
.LASF14:
	.string	"tv_usec"
.LASF11:
	.string	"suseconds_t"
.LASF39:
	.string	"RT_Device_Class_RTC"
.LASF35:
	.string	"RT_Device_Class_Block"
.LASF30:
	.string	"name"
.LASF65:
	.string	"open"
.LASF20:
	.string	"rt_ubase_t"
.LASF28:
	.string	"rt_list_t"
.LASF32:
	.string	"flag"
.LASF45:
	.string	"RT_Device_Class_SPIBUS"
.LASF10:
	.string	"__suseconds_t"
.LASF27:
	.string	"prev"
.LASF22:
	.string	"rt_size_t"
.LASF77:
	.string	"rt_tick_get"
.LASF50:
	.string	"RT_Device_Class_Portal"
.LASF34:
	.string	"RT_Device_Class_Char"
.LASF26:
	.string	"next"
.LASF63:
	.string	"tx_complete"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
