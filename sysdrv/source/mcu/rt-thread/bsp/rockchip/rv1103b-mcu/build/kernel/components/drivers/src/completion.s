	.file	"completion.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_completion_init,"ax",@progbits
	.align	1
	.globl	rt_completion_init
	.type	rt_completion_init, @function
rt_completion_init:
.LFB19:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/completion.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 5
	.loc 1 21 5
	.loc 1 23 5
	.loc 1 19 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 19 1
	mv	s0,a0
	.loc 1 23 13
	call	rt_hw_interrupt_disable
.LVL1:
	.loc 1 24 5 is_stmt 1
	.loc 1 25 5 is_stmt 0
	addi	a5,s0,4
	.loc 1 24 22
	sw	zero,0(s0)
	.loc 1 25 5 is_stmt 1
.LVL2:
.LBB9:
.LBB10:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 49 5
	.loc 2 49 23 is_stmt 0
	sw	a5,8(s0)
	.loc 2 49 13
	sw	a5,4(s0)
.LVL3:
.LBE10:
.LBE9:
	.loc 1 26 5 is_stmt 1
	.loc 1 27 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL4:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 26 5
	tail	rt_hw_interrupt_enable
.LVL5:
	.cfi_endproc
.LFE19:
	.size	rt_completion_init, .-rt_completion_init
	.section	.text.rt_completion_wait,"ax",@progbits
	.align	1
	.globl	rt_completion_wait
	.type	rt_completion_wait, @function
rt_completion_wait:
.LFB20:
	.loc 1 32 1 is_stmt 1
	.cfi_startproc
.LVL6:
	.loc 1 33 5
	.loc 1 34 5
	.loc 1 35 5
	.loc 1 36 5
	.loc 1 38 5
	.loc 1 39 5
	.loc 1 32 1 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	a1,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s2,a0
	sw	s3,28(sp)
	.cfi_offset 19, -20
	.loc 1 39 14
	call	rt_thread_self
.LVL7:
	mv	s0,a0
.LVL8:
	.loc 1 41 5 is_stmt 1
	.loc 1 41 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL9:
	.loc 1 42 8
	lw	a4,0(s2)
	li	a5,1
	.loc 1 41 13
	mv	s1,a0
.LVL10:
	.loc 1 42 5 is_stmt 1
	.loc 1 42 8 is_stmt 0
	beq	a4,a5,.L7
	.loc 1 45 9 is_stmt 1
	.loc 1 47 9
	.loc 1 47 12 is_stmt 0
	lw	a5,12(sp)
	.loc 1 49 20
	li	s3,-2
	.loc 1 47 12
	beq	a5,zero,.L5
	.loc 1 55 13 is_stmt 1
	.loc 1 55 27 is_stmt 0
	sw	zero,48(s0)
	.loc 1 58 13 is_stmt 1
	mv	a0,s0
	call	rt_thread_suspend
.LVL11:
	.loc 1 60 13
.LBB11:
.LBB12:
	.loc 2 75 6 is_stmt 0
	lw	a4,8(s2)
.LBE12:
.LBE11:
	.loc 1 60 13
	addi	a5,s0,20
.LVL12:
.LBB15:
.LBB13:
	.loc 2 75 5 is_stmt 1
	.loc 2 75 19 is_stmt 0
	sw	a5,0(a4)
	.loc 2 76 5 is_stmt 1
	.loc 2 76 13 is_stmt 0
	sw	a4,24(s0)
	.loc 2 78 5 is_stmt 1
	.loc 2 78 13 is_stmt 0
	sw	a5,8(s2)
	.loc 2 79 5 is_stmt 1
.LBE13:
.LBE15:
	.loc 1 60 13 is_stmt 0
	addi	a5,s2,4
.LVL13:
.LBB16:
.LBB14:
	.loc 2 79 13
	sw	a5,20(s0)
.LVL14:
.LBE14:
.LBE16:
	.loc 1 64 13 is_stmt 1
	.loc 1 67 13
	.loc 1 67 16 is_stmt 0
	lw	a5,12(sp)
	ble	a5,zero,.L6
	.loc 1 70 17 is_stmt 1
	addi	s3,s0,76
	addi	a2,sp,12
	li	a1,0
	mv	a0,s3
	call	rt_timer_control
.LVL15:
	.loc 1 73 17
	mv	a0,s3
	call	rt_timer_start
.LVL16:
.L6:
	.loc 1 76 13
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL17:
	.loc 1 79 13
	call	rt_schedule
.LVL18:
	.loc 1 82 13
	.loc 1 82 20 is_stmt 0
	lw	s3,48(s0)
.LVL19:
	.loc 1 84 13 is_stmt 1
	.loc 1 84 21 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL20:
	mv	s1,a0
.LVL21:
.L4:
	.loc 1 88 5 is_stmt 1
	.loc 1 88 22 is_stmt 0
	sw	zero,0(s2)
.LVL22:
.L5:
	.loc 1 91 5 is_stmt 1
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL23:
	.loc 1 93 5
	.loc 1 94 1 is_stmt 0
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
.LVL24:
	lw	s1,36(sp)
	.cfi_restore 9
.LVL25:
	lw	s2,32(sp)
	.cfi_restore 18
.LVL26:
	mv	a0,s3
	lw	s3,28(sp)
	.cfi_restore 19
.LVL27:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL28:
.L7:
	.cfi_restore_state
	.loc 1 38 12
	li	s3,0
	j	.L4
	.cfi_endproc
.LFE20:
	.size	rt_completion_wait, .-rt_completion_wait
	.section	.text.rt_completion_done,"ax",@progbits
	.align	1
	.globl	rt_completion_done
	.type	rt_completion_done, @function
rt_completion_done:
.LFB21:
	.loc 1 98 1 is_stmt 1
	.cfi_startproc
.LVL29:
	.loc 1 99 5
	.loc 1 100 5
	.loc 1 102 5
	.loc 1 102 8 is_stmt 0
	lw	a5,0(a0)
	.loc 1 98 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.loc 1 102 8
	li	s2,1
	beq	a5,s2,.L10
	mv	s0,a0
	.loc 1 105 5 is_stmt 1
	.loc 1 105 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL30:
.LBB17:
.LBB18:
	.loc 2 100 13
	lw	a5,4(s0)
.LBE18:
.LBE17:
	.loc 1 106 22
	sw	s2,0(s0)
	.loc 1 108 26
	addi	s0,s0,4
.LVL31:
	.loc 1 105 13
	mv	s1,a0
.LVL32:
	.loc 1 106 5 is_stmt 1
	.loc 1 108 5
.LBB20:
.LBB19:
	.loc 2 100 5
.LBE19:
.LBE20:
	.loc 1 108 8 is_stmt 0
	beq	a5,s0,.L12
.LBB21:
	.loc 1 111 9 is_stmt 1
	.loc 1 114 9
.LVL33:
	.loc 1 119 9
	addi	a0,a5,-20
.LVL34:
	call	rt_thread_resume
.LVL35:
	.loc 1 120 9
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL36:
	.loc 1 123 9
.LBE21:
	.loc 1 129 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL37:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
.LVL38:
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
.LBB22:
	.loc 1 123 9
	tail	rt_schedule
.LVL39:
.L12:
	.cfi_restore_state
.LBE22:
	.loc 1 127 9 is_stmt 1
	.loc 1 129 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
.LVL40:
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 127 9
	tail	rt_hw_interrupt_enable
.LVL41:
.L10:
	.cfi_restore_state
	.loc 1 129 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	rt_completion_done, .-rt_completion_done
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/ipc/completion.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x66c
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF69
	.byte	0xc
	.4byte	.LASF70
	.4byte	.LASF71
	.4byte	.Ldebug_ranges0+0x50
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x3f
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x47
	.byte	0x13
	.4byte	0x88
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x49
	.byte	0x15
	.4byte	0x67
	.byte	0x5
	.4byte	.LASF18
	.byte	0x8
	.byte	0x3
	.2byte	0x12c
	.byte	0x8
	.4byte	0xe3
	.byte	0x6
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xe3
	.byte	0
	.byte	0x6
	.4byte	.LASF16
	.byte	0x3
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
	.byte	0x3
	.2byte	0x131
	.byte	0x1d
	.4byte	0xb8
	.byte	0x9
	.4byte	0xe9
	.byte	0x5
	.4byte	.LASF19
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x142
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x142
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x153
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0
	.byte	0xa
	.4byte	0x159
	.4byte	0x152
	.byte	0xb
	.4byte	0x152
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
	.byte	0x3
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1c3
	.byte	0x6
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1b3
	.byte	0x16
	.4byte	0xfb
	.byte	0
	.byte	0xc
	.string	"row"
	.byte	0x3
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1c3
	.byte	0x14
	.byte	0x6
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1e0
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1de
	.byte	0x20
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xac
	.byte	0x24
	.byte	0x6
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xac
	.byte	0x28
	.byte	0
	.byte	0xa
	.4byte	0xe9
	.4byte	0x1d3
	.byte	0xb
	.4byte	0x152
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x1de
	.byte	0xe
	.4byte	0x1de
	.byte	0
	.byte	0xf
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1d3
	.byte	0x5
	.4byte	.LASF32
	.byte	0x80
	.byte	0x3
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x328
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x142
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x200
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x206
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x207
	.byte	0xf
	.4byte	0xe9
	.byte	0x14
	.byte	0xc
	.string	"sp"
	.byte	0x3
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1de
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1de
	.byte	0x20
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1de
	.byte	0x24
	.byte	0x6
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1de
	.byte	0x28
	.byte	0x6
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x20e
	.byte	0x11
	.4byte	0x67
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x211
	.byte	0xe
	.4byte	0xa0
	.byte	0x30
	.byte	0x6
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x213
	.byte	0x10
	.4byte	0x4d
	.byte	0x34
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x216
	.byte	0x10
	.4byte	0x4d
	.byte	0x35
	.byte	0x6
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x217
	.byte	0x10
	.4byte	0x4d
	.byte	0x36
	.byte	0x6
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x21c
	.byte	0x11
	.4byte	0x67
	.byte	0x38
	.byte	0x6
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x220
	.byte	0x11
	.4byte	0x67
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF44
	.byte	0x3
	.2byte	0x221
	.byte	0x10
	.4byte	0x4d
	.byte	0x40
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x22d
	.byte	0x10
	.4byte	0x94
	.byte	0x44
	.byte	0x6
	.4byte	.LASF45
	.byte	0x3
	.2byte	0x22e
	.byte	0x10
	.4byte	0x94
	.byte	0x48
	.byte	0x6
	.4byte	.LASF46
	.byte	0x3
	.2byte	0x236
	.byte	0x15
	.4byte	0x160
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.2byte	0x238
	.byte	0xc
	.4byte	0x339
	.byte	0x78
	.byte	0x6
	.4byte	.LASF48
	.byte	0x3
	.2byte	0x23f
	.byte	0x11
	.4byte	0x67
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	0x333
	.byte	0xe
	.4byte	0x333
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1e6
	.byte	0x7
	.byte	0x4
	.4byte	0x328
	.byte	0x8
	.4byte	.LASF49
	.byte	0x3
	.2byte	0x241
	.byte	0x1b
	.4byte	0x333
	.byte	0x10
	.4byte	.LASF50
	.byte	0xc
	.byte	0x4
	.byte	0x12
	.byte	0x8
	.4byte	0x374
	.byte	0x11
	.4byte	.LASF22
	.byte	0x4
	.byte	0x14
	.byte	0x11
	.4byte	0x67
	.byte	0
	.byte	0x11
	.4byte	.LASF51
	.byte	0x4
	.byte	0x17
	.byte	0xf
	.4byte	0xe9
	.byte	0x4
	.byte	0
	.byte	0x12
	.4byte	.LASF57
	.byte	0x1
	.byte	0x61
	.byte	0x6
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x417
	.byte	0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0x61
	.byte	0x2f
	.4byte	0x417
	.4byte	.LLST9
	.byte	0x14
	.4byte	.LASF52
	.byte	0x1
	.byte	0x63
	.byte	0xf
	.4byte	0x88
	.4byte	.LLST10
	.byte	0x15
	.4byte	.Ldebug_ranges0+0x38
	.4byte	0x3ea
	.byte	0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x6f
	.byte	0x1b
	.4byte	0x333
	.4byte	.LLST11
	.byte	0x16
	.4byte	.LVL35
	.4byte	0x60f
	.byte	0x17
	.4byte	.LVL36
	.4byte	0x61b
	.4byte	0x3e0
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL39
	.4byte	0x627
	.byte	0
	.byte	0x1a
	.4byte	0x5ad
	.4byte	.LBB17
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0x6c
	.byte	0xa
	.4byte	0x404
	.byte	0x1b
	.4byte	0x5be
	.byte	0
	.byte	0x16
	.4byte	.LVL30
	.4byte	0x633
	.byte	0x19
	.4byte	.LVL41
	.4byte	0x61b
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x34c
	.byte	0x1c
	.4byte	.LASF72
	.byte	0x1
	.byte	0x1e
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x546
	.byte	0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0x1e
	.byte	0x33
	.4byte	0x417
	.4byte	.LLST3
	.byte	0x13
	.4byte	.LASF55
	.byte	0x1
	.byte	0x1f
	.byte	0x28
	.4byte	0x33
	.4byte	.LLST4
	.byte	0x14
	.4byte	.LASF56
	.byte	0x1
	.byte	0x21
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST5
	.byte	0x14
	.4byte	.LASF52
	.byte	0x1
	.byte	0x22
	.byte	0xf
	.4byte	0x88
	.4byte	.LLST6
	.byte	0x14
	.4byte	.LASF53
	.byte	0x1
	.byte	0x23
	.byte	0x11
	.4byte	0x33f
	.4byte	.LLST7
	.byte	0x1d
	.4byte	.LASF73
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.4byte	.L5
	.byte	0x1a
	.4byte	0x5cf
	.4byte	.LBB11
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x3c
	.byte	0xd
	.4byte	0x4b6
	.byte	0x1b
	.4byte	0x5e6
	.byte	0x1e
	.4byte	0x5dc
	.4byte	.LLST8
	.byte	0
	.byte	0x16
	.4byte	.LVL7
	.4byte	0x63f
	.byte	0x16
	.4byte	.LVL9
	.4byte	0x633
	.byte	0x17
	.4byte	.LVL11
	.4byte	0x64b
	.4byte	0x4dc
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LVL15
	.4byte	0x657
	.4byte	0x4fb
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x18
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0x17
	.4byte	.LVL16
	.4byte	0x663
	.4byte	0x50f
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LVL17
	.4byte	0x61b
	.4byte	0x523
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL18
	.4byte	0x627
	.byte	0x16
	.4byte	.LVL20
	.4byte	0x633
	.byte	0x1f
	.4byte	.LVL23
	.4byte	0x61b
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF58
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x5ad
	.byte	0x13
	.4byte	.LASF54
	.byte	0x1
	.byte	0x12
	.byte	0x2f
	.4byte	0x417
	.4byte	.LLST0
	.byte	0x14
	.4byte	.LASF52
	.byte	0x1
	.byte	0x14
	.byte	0xf
	.4byte	0x88
	.4byte	.LLST1
	.byte	0x20
	.4byte	0x5f7
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.byte	0x1
	.byte	0x19
	.byte	0x5
	.4byte	0x59a
	.byte	0x1e
	.4byte	0x604
	.4byte	.LLST2
	.byte	0
	.byte	0x16
	.4byte	.LVL1
	.4byte	0x633
	.byte	0x19
	.4byte	.LVL5
	.4byte	0x61b
	.byte	0
	.byte	0x21
	.4byte	.LASF74
	.byte	0x2
	.byte	0x62
	.byte	0x15
	.4byte	0x81
	.byte	0x3
	.4byte	0x5c9
	.byte	0x22
	.string	"l"
	.byte	0x2
	.byte	0x62
	.byte	0x36
	.4byte	0x5c9
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xf6
	.byte	0x23
	.4byte	.LASF59
	.byte	0x2
	.byte	0x49
	.byte	0x16
	.byte	0x3
	.4byte	0x5f1
	.byte	0x22
	.string	"l"
	.byte	0x2
	.byte	0x49
	.byte	0x37
	.4byte	0x5f1
	.byte	0x22
	.string	"n"
	.byte	0x2
	.byte	0x49
	.byte	0x45
	.4byte	0x5f1
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xe9
	.byte	0x23
	.4byte	.LASF60
	.byte	0x2
	.byte	0x2f
	.byte	0x16
	.byte	0x3
	.4byte	0x60f
	.byte	0x22
	.string	"l"
	.byte	0x2
	.byte	0x2f
	.byte	0x2e
	.4byte	0x5f1
	.byte	0
	.byte	0x24
	.4byte	.LASF61
	.4byte	.LASF61
	.byte	0x5
	.byte	0x90
	.byte	0xa
	.byte	0x24
	.4byte	.LASF62
	.4byte	.LASF62
	.byte	0x6
	.byte	0x60
	.byte	0x6
	.byte	0x24
	.4byte	.LASF63
	.4byte	.LASF63
	.byte	0x5
	.byte	0xb0
	.byte	0x6
	.byte	0x24
	.4byte	.LASF64
	.4byte	.LASF64
	.byte	0x6
	.byte	0x5f
	.byte	0xb
	.byte	0x24
	.4byte	.LASF65
	.4byte	.LASF65
	.byte	0x5
	.byte	0x85
	.byte	0xd
	.byte	0x24
	.4byte	.LASF66
	.4byte	.LASF66
	.byte	0x5
	.byte	0x8f
	.byte	0xa
	.byte	0x24
	.4byte	.LASF67
	.4byte	.LASF67
	.byte	0x5
	.byte	0x61
	.byte	0xa
	.byte	0x24
	.4byte	.LASF68
	.4byte	.LASF68
	.byte	0x5
	.byte	0x5f
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1d
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
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
.LLST9:
	.4byte	.LVL29
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL30-1
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL31
	.4byte	.LVL37
	.2byte	0x3
	.byte	0x78
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL37
	.4byte	.LVL41
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL41
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL32
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x3
	.byte	0x7f
	.byte	0x6c
	.byte	0x9f
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL7-1
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL26
	.4byte	.LVL28
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL28
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL6
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL28
	.4byte	.LFE20
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL28
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL8
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL28
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x3
	.byte	0x82
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1-1
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL4
	.4byte	.LVL5-1
	.2byte	0x3
	.byte	0x7f
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL5-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5f
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
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	0
	.4byte	0
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	0
	.4byte	0
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	0
	.4byte	0
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"rt_uint32_t"
.LASF56:
	.string	"result"
.LASF43:
	.string	"event_set"
.LASF68:
	.string	"rt_timer_start"
.LASF12:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF44:
	.string	"event_info"
.LASF51:
	.string	"suspended_list"
.LASF3:
	.string	"long long int"
.LASF74:
	.string	"rt_list_isempty"
.LASF48:
	.string	"user_data"
.LASF34:
	.string	"tlist"
.LASF13:
	.string	"rt_err_t"
.LASF27:
	.string	"parent"
.LASF59:
	.string	"rt_list_insert_before"
.LASF45:
	.string	"remaining_tick"
.LASF69:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF28:
	.string	"timeout_func"
.LASF26:
	.string	"rt_timer"
.LASF10:
	.string	"long long unsigned int"
.LASF66:
	.string	"rt_thread_suspend"
.LASF2:
	.string	"long int"
.LASF54:
	.string	"completion"
.LASF67:
	.string	"rt_timer_control"
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
.LASF49:
	.string	"rt_thread_t"
.LASF50:
	.string	"rt_completion"
.LASF6:
	.string	"unsigned char"
.LASF61:
	.string	"rt_thread_resume"
.LASF47:
	.string	"cleanup"
.LASF71:
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
.LASF53:
	.string	"thread"
.LASF7:
	.string	"short unsigned int"
.LASF62:
	.string	"rt_hw_interrupt_enable"
.LASF25:
	.string	"char"
.LASF70:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/completion.c"
.LASF41:
	.string	"init_priority"
.LASF23:
	.string	"list"
.LASF65:
	.string	"rt_thread_self"
.LASF14:
	.string	"rt_tick_t"
.LASF64:
	.string	"rt_hw_interrupt_disable"
.LASF4:
	.string	"rt_int32_t"
.LASF63:
	.string	"rt_schedule"
.LASF57:
	.string	"rt_completion_done"
.LASF46:
	.string	"thread_timer"
.LASF73:
	.string	"__exit"
.LASF18:
	.string	"rt_list_node"
.LASF52:
	.string	"level"
.LASF37:
	.string	"stack_size"
.LASF58:
	.string	"rt_completion_init"
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
.LASF32:
	.string	"rt_thread"
.LASF55:
	.string	"timeout"
.LASF15:
	.string	"next"
.LASF60:
	.string	"rt_list_init"
.LASF72:
	.string	"rt_completion_wait"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
