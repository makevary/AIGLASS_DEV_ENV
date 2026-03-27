	.file	"clock.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_system_tick_init,"ax",@progbits
	.align	1
	.globl	rt_system_tick_init
	.type	rt_system_tick_init, @function
rt_system_tick_init:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/clock.c"
	.loc 1 30 1
	.cfi_startproc
	.loc 1 31 1
	ret
	.cfi_endproc
.LFE15:
	.size	rt_system_tick_init, .-rt_system_tick_init
	.section	.text.rt_tick_get,"ax",@progbits
	.align	1
	.globl	rt_tick_get
	.type	rt_tick_get, @function
rt_tick_get:
.LFB16:
	.loc 1 45 1
	.cfi_startproc
	.loc 1 47 5
	.loc 1 48 1 is_stmt 0
	lw	a0,.LANCHOR0
	ret
	.cfi_endproc
.LFE16:
	.size	rt_tick_get, .-rt_tick_get
	.section	.text.rt_tick_set,"ax",@progbits
	.align	1
	.globl	rt_tick_set
	.type	rt_tick_set, @function
rt_tick_set:
.LFB17:
	.loc 1 55 1 is_stmt 1
	.cfi_startproc
.LVL0:
	.loc 1 56 5
	.loc 1 58 5
	.loc 1 55 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 58 13
	call	rt_hw_interrupt_disable
.LVL1:
	.loc 1 59 5 is_stmt 1
	.loc 1 59 13 is_stmt 0
	sw	s0,.LANCHOR0,a5
	.loc 1 60 5 is_stmt 1
	.loc 1 61 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL2:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 60 5
	tail	rt_hw_interrupt_enable
.LVL3:
	.cfi_endproc
.LFE17:
	.size	rt_tick_set, .-rt_tick_set
	.section	.text.rt_tick_increase,"ax",@progbits
	.align	1
	.globl	rt_tick_increase
	.type	rt_tick_increase, @function
rt_tick_increase:
.LFB18:
	.loc 1 68 1 is_stmt 1
	.cfi_startproc
	.loc 1 69 5
	.loc 1 72 5
	lla	a4,.LANCHOR0
	lw	a5,0(a4)
	.loc 1 68 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 72 5
	addi	a5,a5,1
	sw	a5,0(a4)
	.loc 1 75 5 is_stmt 1
	.loc 1 75 14 is_stmt 0
	call	rt_thread_self
.LVL4:
	.loc 1 77 5 is_stmt 1
	lw	a5,72(a0)
	addi	a5,a5,-1
	sw	a5,72(a0)
	.loc 1 78 5
	.loc 1 78 8 is_stmt 0
	bne	a5,zero,.L6
	.loc 1 81 9 is_stmt 1
	.loc 1 81 32 is_stmt 0
	lw	a5,68(a0)
	sw	a5,72(a0)
	.loc 1 84 9 is_stmt 1
	call	rt_thread_yield
.LVL5:
.L6:
	.loc 1 88 5
	.loc 1 89 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 88 5
	tail	rt_timer_check
.LVL6:
	.cfi_endproc
.LFE18:
	.size	rt_tick_increase, .-rt_tick_increase
	.section	.text.rt_tick_from_millisecond,"ax",@progbits
	.align	1
	.globl	rt_tick_from_millisecond
	.type	rt_tick_from_millisecond, @function
rt_tick_from_millisecond:
.LFB19:
	.loc 1 102 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 103 5
	.loc 1 105 5
	.loc 1 105 8 is_stmt 0
	blt	a0,zero,.L10
	.loc 1 108 9 is_stmt 1
	.loc 1 108 22 is_stmt 0
	li	a5,1000
	mul	a0,a0,a5
.LVL8:
	.loc 1 108 27
	addi	a0,a0,999
	.loc 1 108 14
	div	a0,a0,a5
.LVL9:
	ret
.LVL10:
.L10:
	.loc 1 106 14
	li	a0,-1
.LVL11:
	.loc 1 111 5 is_stmt 1
	.loc 1 112 1 is_stmt 0
	ret
	.cfi_endproc
.LFE19:
	.size	rt_tick_from_millisecond, .-rt_tick_from_millisecond
	.section	.sbss.rt_tick,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rt_tick, @object
	.size	rt_tick, 4
rt_tick:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x472
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF60
	.byte	0xc
	.4byte	.LASF61
	.4byte	.LASF62
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1
	.byte	0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x3b
	.byte	0x15
	.4byte	0x3f
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x59
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x73
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x3f
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x88
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x49
	.byte	0x15
	.4byte	0x67
	.byte	0x5
	.4byte	.LASF18
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0xe3
	.byte	0x6
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xe3
	.byte	0
	.byte	0x6
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xe3
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xb8
	.byte	0x8
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xb8
	.byte	0x5
	.4byte	.LASF19
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x13d
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x154
	.4byte	0x14d
	.byte	0xa
	.4byte	0x14d
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF24
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF25
	.byte	0x5
	.4byte	.LASF26
	.byte	0x2c
	.byte	0x2
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1be
	.byte	0x6
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x1b3
	.byte	0x16
	.4byte	0xf6
	.byte	0
	.byte	0xb
	.string	"row"
	.byte	0x2
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1be
	.byte	0x14
	.byte	0x6
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1db
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1d9
	.byte	0x20
	.byte	0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xac
	.byte	0x24
	.byte	0x6
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xac
	.byte	0x28
	.byte	0
	.byte	0x9
	.4byte	0xe9
	.4byte	0x1ce
	.byte	0xa
	.4byte	0x14d
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x1d9
	.byte	0xd
	.4byte	0x1d9
	.byte	0
	.byte	0xe
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1ce
	.byte	0x5
	.4byte	.LASF32
	.byte	0x80
	.byte	0x2
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x323
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x200
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x206
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0x6
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x207
	.byte	0xf
	.4byte	0xe9
	.byte	0x14
	.byte	0xb
	.string	"sp"
	.byte	0x2
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1d9
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1d9
	.byte	0x20
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1d9
	.byte	0x24
	.byte	0x6
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1d9
	.byte	0x28
	.byte	0x6
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x20e
	.byte	0x11
	.4byte	0x67
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x211
	.byte	0xe
	.4byte	0xa0
	.byte	0x30
	.byte	0x6
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x213
	.byte	0x10
	.4byte	0x4d
	.byte	0x34
	.byte	0x6
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x216
	.byte	0x10
	.4byte	0x4d
	.byte	0x35
	.byte	0x6
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x217
	.byte	0x10
	.4byte	0x4d
	.byte	0x36
	.byte	0x6
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x21c
	.byte	0x11
	.4byte	0x67
	.byte	0x38
	.byte	0x6
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x220
	.byte	0x11
	.4byte	0x67
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x221
	.byte	0x10
	.4byte	0x4d
	.byte	0x40
	.byte	0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x22d
	.byte	0x10
	.4byte	0x94
	.byte	0x44
	.byte	0x6
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x22e
	.byte	0x10
	.4byte	0x94
	.byte	0x48
	.byte	0x6
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x236
	.byte	0x15
	.4byte	0x15b
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x238
	.byte	0xc
	.4byte	0x334
	.byte	0x78
	.byte	0x6
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x23f
	.byte	0x11
	.4byte	0x67
	.byte	0x7c
	.byte	0
	.byte	0xc
	.4byte	0x32e
	.byte	0xd
	.4byte	0x32e
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1e1
	.byte	0x7
	.byte	0x4
	.4byte	0x323
	.byte	0xf
	.4byte	.LASF49
	.byte	0x1
	.byte	0x14
	.byte	0x12
	.4byte	0xac
	.byte	0x5
	.byte	0x3
	.4byte	rt_tick
	.byte	0x10
	.4byte	.LASF63
	.byte	0x1
	.byte	0x65
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x386
	.byte	0x11
	.string	"ms"
	.byte	0x1
	.byte	0x65
	.byte	0x29
	.4byte	0x33
	.4byte	.LLST3
	.byte	0x12
	.4byte	.LASF50
	.byte	0x1
	.byte	0x67
	.byte	0x9
	.4byte	0x81
	.4byte	.LLST4
	.byte	0
	.byte	0x13
	.4byte	.LASF52
	.byte	0x1
	.byte	0x43
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x3c8
	.byte	0x12
	.4byte	.LASF51
	.byte	0x1
	.byte	0x45
	.byte	0x17
	.4byte	0x32e
	.4byte	.LLST2
	.byte	0x14
	.4byte	.LVL4
	.4byte	0x439
	.byte	0x14
	.4byte	.LVL5
	.4byte	0x445
	.byte	0x15
	.4byte	.LVL6
	.4byte	0x451
	.byte	0
	.byte	0x13
	.4byte	.LASF53
	.byte	0x1
	.byte	0x36
	.byte	0x6
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x411
	.byte	0x16
	.4byte	.LASF50
	.byte	0x1
	.byte	0x36
	.byte	0x1c
	.4byte	0xac
	.4byte	.LLST0
	.byte	0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x38
	.byte	0xf
	.4byte	0x88
	.4byte	.LLST1
	.byte	0x14
	.4byte	.LVL1
	.4byte	0x45d
	.byte	0x15
	.4byte	.LVL3
	.4byte	0x469
	.byte	0
	.byte	0x17
	.4byte	.LASF64
	.byte	0x1
	.byte	0x2c
	.byte	0xb
	.4byte	0xac
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.byte	0x18
	.4byte	.LASF65
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF55
	.4byte	.LASF55
	.byte	0x3
	.byte	0x85
	.byte	0xd
	.byte	0x19
	.4byte	.LASF56
	.4byte	.LASF56
	.byte	0x3
	.byte	0x8b
	.byte	0xa
	.byte	0x19
	.4byte	.LASF57
	.4byte	.LASF57
	.byte	0x3
	.byte	0x64
	.byte	0x6
	.byte	0x19
	.4byte	.LASF58
	.4byte	.LASF58
	.byte	0x4
	.byte	0x5f
	.byte	0xb
	.byte	0x19
	.4byte	.LASF59
	.4byte	.LASF59
	.byte	0x4
	.byte	0x60
	.byte	0x6
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
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
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
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
	.byte	0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11
	.4byte	.LFE19
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1-1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x5
	.byte	0x3
	.4byte	rt_tick
	.4byte	.LVL3-1
	.4byte	.LFE17
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"rt_uint32_t"
.LASF43:
	.string	"event_set"
.LASF52:
	.string	"rt_tick_increase"
.LASF12:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF44:
	.string	"event_info"
.LASF3:
	.string	"long long int"
.LASF48:
	.string	"user_data"
.LASF34:
	.string	"tlist"
.LASF13:
	.string	"rt_err_t"
.LASF27:
	.string	"parent"
.LASF14:
	.string	"rt_tick_t"
.LASF45:
	.string	"remaining_tick"
.LASF60:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF65:
	.string	"rt_system_tick_init"
.LASF53:
	.string	"rt_tick_set"
.LASF26:
	.string	"rt_timer"
.LASF10:
	.string	"long long unsigned int"
.LASF2:
	.string	"long int"
.LASF11:
	.string	"rt_base_t"
.LASF31:
	.string	"timeout_tick"
.LASF20:
	.string	"name"
.LASF30:
	.string	"init_tick"
.LASF35:
	.string	"entry"
.LASF61:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/clock.c"
.LASF6:
	.string	"unsigned char"
.LASF47:
	.string	"cleanup"
.LASF62:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF33:
	.string	"flags"
.LASF21:
	.string	"type"
.LASF24:
	.string	"unsigned int"
.LASF5:
	.string	"rt_uint8_t"
.LASF9:
	.string	"long unsigned int"
.LASF42:
	.string	"number_mask"
.LASF29:
	.string	"parameter"
.LASF51:
	.string	"thread"
.LASF7:
	.string	"short unsigned int"
.LASF59:
	.string	"rt_hw_interrupt_enable"
.LASF25:
	.string	"char"
.LASF49:
	.string	"rt_tick"
.LASF41:
	.string	"init_priority"
.LASF23:
	.string	"list"
.LASF55:
	.string	"rt_thread_self"
.LASF58:
	.string	"rt_hw_interrupt_disable"
.LASF4:
	.string	"rt_int32_t"
.LASF28:
	.string	"timeout_func"
.LASF46:
	.string	"thread_timer"
.LASF56:
	.string	"rt_thread_yield"
.LASF18:
	.string	"rt_list_node"
.LASF57:
	.string	"rt_timer_check"
.LASF54:
	.string	"level"
.LASF37:
	.string	"stack_size"
.LASF63:
	.string	"rt_tick_from_millisecond"
.LASF40:
	.string	"current_priority"
.LASF38:
	.string	"error"
.LASF19:
	.string	"rt_object"
.LASF17:
	.string	"rt_list_t"
.LASF22:
	.string	"flag"
.LASF39:
	.string	"stat"
.LASF16:
	.string	"prev"
.LASF36:
	.string	"stack_addr"
.LASF50:
	.string	"tick"
.LASF64:
	.string	"rt_tick_get"
.LASF32:
	.string	"rt_thread"
.LASF15:
	.string	"next"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
