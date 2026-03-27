	.file	"waitqueue.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.__wqueue_default_wake,"ax",@progbits
	.align	1
	.globl	__wqueue_default_wake
	.type	__wqueue_default_wake, @function
__wqueue_default_wake:
.LFB21:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/waitqueue.c"
	.loc 1 37 1
	.cfi_startproc
.LVL0:
	.loc 1 38 5
	.loc 1 39 1 is_stmt 0
	li	a0,0
.LVL1:
	ret
	.cfi_endproc
.LFE21:
	.size	__wqueue_default_wake, .-__wqueue_default_wake
	.section	.text.rt_wqueue_add,"ax",@progbits
	.align	1
	.globl	rt_wqueue_add
	.type	rt_wqueue_add, @function
rt_wqueue_add:
.LFB19:
	.loc 1 19 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 20 5
	.loc 1 22 5
	.loc 1 19 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 19 1
	mv	s1,a1
	mv	s0,a0
	.loc 1 22 13
	call	rt_hw_interrupt_disable
.LVL3:
	.loc 1 23 5 is_stmt 1
.LBB8:
.LBB9:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 75 6 is_stmt 0
	lw	a4,8(s0)
.LBE9:
.LBE8:
	.loc 1 23 5
	addi	a5,s1,4
.LVL4:
.LBB12:
.LBB10:
	.loc 2 75 5 is_stmt 1
.LBE10:
.LBE12:
	.loc 1 23 5 is_stmt 0
	addi	s0,s0,4
.LVL5:
.LBB13:
.LBB11:
	.loc 2 75 19
	sw	a5,0(a4)
	.loc 2 76 5 is_stmt 1
	.loc 2 76 13 is_stmt 0
	sw	a4,8(s1)
	.loc 2 78 5 is_stmt 1
	.loc 2 78 13 is_stmt 0
	sw	a5,4(s0)
	.loc 2 79 5 is_stmt 1
	.loc 2 79 13 is_stmt 0
	sw	s0,4(s1)
.LVL6:
.LBE11:
.LBE13:
	.loc 1 24 5 is_stmt 1
	.loc 1 25 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL7:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
.LVL8:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 24 5
	tail	rt_hw_interrupt_enable
.LVL9:
	.cfi_endproc
.LFE19:
	.size	rt_wqueue_add, .-rt_wqueue_add
	.section	.text.rt_wqueue_remove,"ax",@progbits
	.align	1
	.globl	rt_wqueue_remove
	.type	rt_wqueue_remove, @function
rt_wqueue_remove:
.LFB20:
	.loc 1 28 1 is_stmt 1
	.cfi_startproc
.LVL10:
	.loc 1 29 5
	.loc 1 31 5
	.loc 1 28 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 28 1
	mv	s0,a0
	.loc 1 31 13
	call	rt_hw_interrupt_disable
.LVL11:
	.loc 1 32 5 is_stmt 1
.LBB16:
.LBB17:
	.loc 2 88 6 is_stmt 0
	lw	a3,4(s0)
	.loc 2 88 22
	lw	a4,8(s0)
.LBE17:
.LBE16:
	.loc 1 32 5
	addi	a5,s0,4
.LVL12:
.LBB20:
.LBB18:
	.loc 2 88 5 is_stmt 1
.LBE18:
.LBE20:
	.loc 1 34 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
.LBB21:
.LBB19:
	.loc 2 88 19
	sw	a4,4(a3)
	.loc 2 89 5 is_stmt 1
	.loc 2 89 19 is_stmt 0
	sw	a3,0(a4)
	.loc 2 91 5 is_stmt 1
	.loc 2 91 23 is_stmt 0
	sw	a5,8(s0)
	.loc 2 91 13
	sw	a5,4(s0)
.LVL13:
.LBE19:
.LBE21:
	.loc 1 33 5 is_stmt 1
	.loc 1 34 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL14:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 33 5
	tail	rt_hw_interrupt_enable
.LVL15:
	.cfi_endproc
.LFE20:
	.size	rt_wqueue_remove, .-rt_wqueue_remove
	.section	.text.rt_wqueue_wakeup,"ax",@progbits
	.align	1
	.globl	rt_wqueue_wakeup
	.type	rt_wqueue_wakeup, @function
rt_wqueue_wakeup:
.LFB22:
	.loc 1 42 1 is_stmt 1
	.cfi_startproc
.LVL16:
	.loc 1 43 5
	.loc 1 44 5
	.loc 1 46 5
	.loc 1 47 5
	.loc 1 48 5
	.loc 1 50 5
	.loc 1 42 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	s4,8(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.cfi_offset 20, -24
	.loc 1 42 1
	mv	s2,a1
	.loc 1 50 16
	addi	s3,a0,4
.LVL17:
	.loc 1 52 5 is_stmt 1
	.loc 1 52 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL18:
	.loc 1 54 17
	li	a5,1
	sw	a5,0(s0)
.LBB22:
.LBB23:
	.loc 2 100 13
	lw	s0,4(s0)
.LVL19:
.LBE23:
.LBE22:
	.loc 1 52 13
	mv	s1,a0
.LVL20:
	.loc 1 54 5 is_stmt 1
	.loc 1 56 5
.LBB25:
.LBB24:
	.loc 2 100 5
.L14:
.LBE24:
.LBE25:
	.loc 1 56 8 is_stmt 0
	beq	s3,s0,.L7
.LVL21:
	.loc 1 60 13 is_stmt 1
	.loc 1 61 17 is_stmt 0
	lw	a5,8(s0)
	.loc 1 60 19
	addi	s4,s0,-4
.LVL22:
	.loc 1 61 13 is_stmt 1
	.loc 1 61 17 is_stmt 0
	mv	a1,s2
	mv	a0,s4
	jalr	a5
.LVL23:
	.loc 1 61 16
	bne	a0,zero,.L8
	.loc 1 63 17 is_stmt 1
	lw	a0,-4(s0)
	.loc 1 64 31 is_stmt 0
	li	s0,1
.LVL24:
	.loc 1 63 17
	call	rt_thread_resume
.LVL25:
	.loc 1 64 17 is_stmt 1
	.loc 1 66 17
	mv	a0,s4
	call	rt_wqueue_remove
.LVL26:
	.loc 1 67 17
.L9:
	.loc 1 71 5
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL27:
	.loc 1 73 5
	.loc 1 73 8 is_stmt 0
	beq	s0,zero,.L6
.LVL28:
	.loc 1 74 9 is_stmt 1
	.loc 1 75 1 is_stmt 0
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
.LVL29:
	lw	s2,16(sp)
	.cfi_restore 18
.LVL30:
	lw	s3,12(sp)
	.cfi_restore 19
.LVL31:
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	.loc 1 74 9
	tail	rt_schedule
.LVL32:
.L8:
	.cfi_restore_state
	.loc 1 58 59 is_stmt 1 discriminator 2
	.loc 1 58 64 is_stmt 0 discriminator 2
	lw	s0,0(s0)
.LVL33:
	.loc 1 58 39 is_stmt 1 discriminator 2
	j	.L14
.LVL34:
.L7:
	.loc 1 44 18 is_stmt 0
	li	s0,0
	j	.L9
.LVL35:
.L6:
	.loc 1 75 1
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL36:
	lw	s1,20(sp)
	.cfi_restore 9
.LVL37:
	lw	s2,16(sp)
	.cfi_restore 18
.LVL38:
	lw	s3,12(sp)
	.cfi_restore 19
.LVL39:
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	rt_wqueue_wakeup, .-rt_wqueue_wakeup
	.section	.text.rt_wqueue_wait,"ax",@progbits
	.align	1
	.globl	rt_wqueue_wait
	.type	rt_wqueue_wait, @function
rt_wqueue_wait:
.LFB23:
	.loc 1 78 1 is_stmt 1
	.cfi_startproc
.LVL40:
	.loc 1 79 5
	.loc 1 80 5
	.loc 1 78 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.loc 1 78 1
	mv	s0,a1
	mv	s3,a2
	mv	s2,a0
	.loc 1 80 23
	call	rt_thread_self
.LVL41:
	mv	s1,a0
.LVL42:
	.loc 1 81 5 is_stmt 1
	.loc 1 82 5
	.loc 1 83 5
	.loc 1 86 5
	.loc 1 88 5
	.loc 1 88 12 is_stmt 0
	mv	a0,s3
	call	rt_tick_from_millisecond
.LVL43:
	.loc 1 88 10
	sw	a0,8(sp)
	.loc 1 90 5 is_stmt 1
	.loc 1 90 8 is_stmt 0
	bne	s0,zero,.L16
	.loc 1 90 21 discriminator 1
	beq	a0,zero,.L16
	.loc 1 93 5 is_stmt 1
	.loc 1 93 29 is_stmt 0
	call	rt_thread_self
.LVL44:
	.loc 1 95 19
	lla	a5,__wqueue_default_wake
	sw	a5,24(sp)
.LBB26:
.LBB27:
	.loc 2 49 23
	addi	a5,sp,16
	sw	a5,20(sp)
	.loc 2 49 13
	sw	a5,16(sp)
.LBE27:
.LBE26:
	.loc 1 93 27
	sw	a0,12(sp)
	.loc 1 94 5 is_stmt 1
	.loc 1 94 16 is_stmt 0
	sw	zero,28(sp)
	.loc 1 95 5 is_stmt 1
	.loc 1 96 5
.LVL45:
.LBB29:
.LBB28:
	.loc 2 49 5
.LBE28:
.LBE29:
	.loc 1 98 5
	.loc 1 98 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL46:
	.loc 1 99 8
	lw	a4,0(s2)
	li	a5,1
	.loc 1 98 13
	mv	s0,a0
.LVL47:
	.loc 1 99 5 is_stmt 1
	.loc 1 99 8 is_stmt 0
	beq	a4,a5,.L17
	.loc 1 105 5 is_stmt 1
	addi	a1,sp,12
	mv	a0,s2
	call	rt_wqueue_add
.LVL48:
	.loc 1 106 5
	mv	a0,s1
	call	rt_thread_suspend
.LVL49:
	.loc 1 109 5
	.loc 1 109 8 is_stmt 0
	lw	a4,8(sp)
	li	a5,-1
	beq	a4,a5,.L18
	.loc 1 81 16
	addi	s1,s1,76
.LVL50:
	.loc 1 111 9 is_stmt 1
	addi	a2,sp,8
	li	a1,0
	mv	a0,s1
	call	rt_timer_control
.LVL51:
	.loc 1 115 9
	mv	a0,s1
	call	rt_timer_start
.LVL52:
.L18:
	.loc 1 117 5
	mv	a0,s0
	call	rt_hw_interrupt_enable
.LVL53:
	.loc 1 119 5
	call	rt_schedule
.LVL54:
	.loc 1 121 5
	.loc 1 121 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL55:
	mv	s0,a0
.LVL56:
.L17:
	.loc 1 124 5 is_stmt 1
	.loc 1 125 5 is_stmt 0
	mv	a0,s0
	.loc 1 124 17
	sw	zero,0(s2)
	.loc 1 125 5 is_stmt 1
	call	rt_hw_interrupt_enable
.LVL57:
	.loc 1 127 5
	addi	a0,sp,12
	call	rt_wqueue_remove
.LVL58:
	.loc 1 129 5
.L16:
	.loc 1 130 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
.LVL59:
	lw	s3,44(sp)
	.cfi_restore 19
.LVL60:
	li	a0,0
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	rt_wqueue_wait, .-rt_wqueue_wait
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/ipc/waitqueue.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x895
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF84
	.byte	0xc
	.4byte	.LASF85
	.4byte	.LASF86
	.4byte	.Ldebug_ranges0+0x70
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
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x4
	.4byte	.LASF9
	.byte	0x3
	.byte	0x3d
	.byte	0x17
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x3f
	.byte	0x17
	.4byte	0x48
	.byte	0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x41
	.byte	0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x48
	.byte	0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x47
	.byte	0x13
	.4byte	0x83
	.byte	0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x49
	.byte	0x15
	.4byte	0x77
	.byte	0x5
	.4byte	.LASF18
	.byte	0x8
	.byte	0x3
	.2byte	0x12c
	.byte	0x8
	.4byte	0xde
	.byte	0x6
	.4byte	.LASF15
	.byte	0x3
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xde
	.byte	0
	.byte	0x6
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xde
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xb3
	.byte	0x8
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x131
	.byte	0x1d
	.4byte	0xb3
	.byte	0x9
	.4byte	0xe4
	.byte	0x5
	.4byte	.LASF19
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x13d
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x6b
	.byte	0x8
	.byte	0x6
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x6b
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x153
	.byte	0xf
	.4byte	0xe4
	.byte	0xc
	.byte	0
	.byte	0xa
	.4byte	0x14d
	.4byte	0x14d
	.byte	0xb
	.4byte	0x64
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF24
	.byte	0x5
	.4byte	.LASF25
	.byte	0x2c
	.byte	0x3
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1b7
	.byte	0x6
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x1b3
	.byte	0x16
	.4byte	0xf6
	.byte	0
	.byte	0xc
	.string	"row"
	.byte	0x3
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1b7
	.byte	0x14
	.byte	0x6
	.4byte	.LASF27
	.byte	0x3
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1d4
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1d2
	.byte	0x20
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xa7
	.byte	0x24
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xa7
	.byte	0x28
	.byte	0
	.byte	0xa
	.4byte	0xe4
	.4byte	0x1c7
	.byte	0xb
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x1d2
	.byte	0xe
	.4byte	0x1d2
	.byte	0
	.byte	0xf
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1c7
	.byte	0x8
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1bd
	.byte	0x1a
	.4byte	0x1e7
	.byte	0x7
	.byte	0x4
	.4byte	0x154
	.byte	0x5
	.4byte	.LASF32
	.byte	0x80
	.byte	0x3
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x32f
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x6b
	.byte	0x8
	.byte	0x6
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x200
	.byte	0x10
	.4byte	0x6b
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x206
	.byte	0xf
	.4byte	0xe4
	.byte	0xc
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x207
	.byte	0xf
	.4byte	0xe4
	.byte	0x14
	.byte	0xc
	.string	"sp"
	.byte	0x3
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1d2
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1d2
	.byte	0x20
	.byte	0x6
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1d2
	.byte	0x24
	.byte	0x6
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1d2
	.byte	0x28
	.byte	0x6
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x20e
	.byte	0x11
	.4byte	0x77
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x211
	.byte	0xe
	.4byte	0x9b
	.byte	0x30
	.byte	0x6
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x213
	.byte	0x10
	.4byte	0x6b
	.byte	0x34
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x216
	.byte	0x10
	.4byte	0x6b
	.byte	0x35
	.byte	0x6
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x217
	.byte	0x10
	.4byte	0x6b
	.byte	0x36
	.byte	0x6
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x21c
	.byte	0x11
	.4byte	0x77
	.byte	0x38
	.byte	0x6
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x220
	.byte	0x11
	.4byte	0x77
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF44
	.byte	0x3
	.2byte	0x221
	.byte	0x10
	.4byte	0x6b
	.byte	0x40
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x22d
	.byte	0x10
	.4byte	0x8f
	.byte	0x44
	.byte	0x6
	.4byte	.LASF45
	.byte	0x3
	.2byte	0x22e
	.byte	0x10
	.4byte	0x8f
	.byte	0x48
	.byte	0x6
	.4byte	.LASF46
	.byte	0x3
	.2byte	0x236
	.byte	0x15
	.4byte	0x154
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.2byte	0x238
	.byte	0xc
	.4byte	0x340
	.byte	0x78
	.byte	0x6
	.4byte	.LASF48
	.byte	0x3
	.2byte	0x23f
	.byte	0x11
	.4byte	0x77
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	0x33a
	.byte	0xe
	.4byte	0x33a
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1ed
	.byte	0x7
	.byte	0x4
	.4byte	0x32f
	.byte	0x8
	.4byte	.LASF49
	.byte	0x3
	.2byte	0x241
	.byte	0x1b
	.4byte	0x33a
	.byte	0x5
	.4byte	.LASF50
	.byte	0xc
	.byte	0x3
	.2byte	0x37d
	.byte	0x8
	.4byte	0x37e
	.byte	0x6
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x37f
	.byte	0x11
	.4byte	0x77
	.byte	0
	.byte	0x6
	.4byte	.LASF51
	.byte	0x3
	.2byte	0x380
	.byte	0xf
	.4byte	0xe4
	.byte	0x4
	.byte	0
	.byte	0x8
	.4byte	.LASF52
	.byte	0x3
	.2byte	0x382
	.byte	0x1a
	.4byte	0x353
	.byte	0x4
	.4byte	.LASF53
	.byte	0x4
	.byte	0x15
	.byte	0xf
	.4byte	0x397
	.byte	0x7
	.byte	0x4
	.4byte	0x39d
	.byte	0x10
	.4byte	0x5d
	.4byte	0x3b1
	.byte	0xe
	.4byte	0x3b1
	.byte	0xe
	.4byte	0x1d2
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x3b7
	.byte	0x11
	.4byte	.LASF54
	.byte	0x14
	.byte	0x4
	.byte	0x17
	.byte	0x8
	.4byte	0x3f9
	.byte	0x12
	.4byte	.LASF55
	.byte	0x4
	.byte	0x19
	.byte	0x11
	.4byte	0x346
	.byte	0
	.byte	0x12
	.4byte	.LASF23
	.byte	0x4
	.byte	0x1a
	.byte	0xf
	.4byte	0xe4
	.byte	0x4
	.byte	0x12
	.4byte	.LASF56
	.byte	0x4
	.byte	0x1c
	.byte	0x16
	.4byte	0x38b
	.byte	0xc
	.byte	0x13
	.string	"key"
	.byte	0x4
	.byte	0x1d
	.byte	0x11
	.4byte	0x77
	.byte	0x10
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x37e
	.byte	0x14
	.4byte	.LASF66
	.byte	0x1
	.byte	0x4d
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x598
	.byte	0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x4d
	.byte	0x21
	.4byte	0x3f9
	.4byte	.LLST16
	.byte	0x15
	.4byte	.LASF58
	.byte	0x1
	.byte	0x4d
	.byte	0x2c
	.4byte	0x5d
	.4byte	.LLST17
	.byte	0x15
	.4byte	.LASF59
	.byte	0x1
	.byte	0x4d
	.byte	0x3b
	.4byte	0x5d
	.4byte	.LLST18
	.byte	0x16
	.4byte	.LASF60
	.byte	0x1
	.byte	0x4f
	.byte	0x9
	.4byte	0x5d
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x17
	.string	"tid"
	.byte	0x1
	.byte	0x50
	.byte	0x11
	.4byte	0x346
	.4byte	.LLST19
	.byte	0x17
	.string	"tmr"
	.byte	0x1
	.byte	0x51
	.byte	0x10
	.4byte	0x1da
	.4byte	.LLST20
	.byte	0x16
	.4byte	.LASF61
	.byte	0x1
	.byte	0x52
	.byte	0x1b
	.4byte	0x3b7
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x53
	.byte	0xf
	.4byte	0x83
	.4byte	.LLST21
	.byte	0x19
	.4byte	.LASF87
	.byte	0x1
	.byte	0x7b
	.byte	0x1
	.4byte	.L17
	.byte	0x1a
	.4byte	0x814
	.4byte	.LBB26
	.4byte	.Ldebug_ranges0+0x58
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.4byte	0x4bd
	.byte	0x1b
	.4byte	0x821
	.byte	0
	.byte	0x1c
	.4byte	.LVL41
	.4byte	0x82c
	.byte	0x1d
	.4byte	.LVL43
	.4byte	0x838
	.4byte	0x4da
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LVL44
	.4byte	0x82c
	.byte	0x1c
	.4byte	.LVL46
	.4byte	0x844
	.byte	0x1d
	.4byte	.LVL48
	.4byte	0x738
	.4byte	0x506
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0x1d
	.4byte	.LVL49
	.4byte	0x850
	.4byte	0x51a
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LVL51
	.4byte	0x85c
	.4byte	0x539
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x1e
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0
	.byte	0x1d
	.4byte	.LVL52
	.4byte	0x868
	.4byte	0x54d
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LVL53
	.4byte	0x874
	.4byte	0x561
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LVL54
	.4byte	0x880
	.byte	0x1c
	.4byte	.LVL55
	.4byte	0x844
	.byte	0x1d
	.4byte	.LVL57
	.4byte	0x874
	.4byte	0x587
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x1f
	.4byte	.LVL58
	.4byte	0x6d1
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LASF69
	.byte	0x1
	.byte	0x29
	.byte	0x6
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x692
	.byte	0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x29
	.byte	0x24
	.4byte	0x3f9
	.4byte	.LLST9
	.byte	0x21
	.string	"key"
	.byte	0x1
	.byte	0x29
	.byte	0x31
	.4byte	0x1d2
	.4byte	.LLST10
	.byte	0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x2b
	.byte	0xf
	.4byte	0x83
	.4byte	.LLST11
	.byte	0x18
	.4byte	.LASF63
	.byte	0x1
	.byte	0x2c
	.byte	0x12
	.4byte	0x5d
	.4byte	.LLST12
	.byte	0x18
	.4byte	.LASF64
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.4byte	0x692
	.4byte	.LLST13
	.byte	0x18
	.4byte	.LASF65
	.byte	0x1
	.byte	0x2f
	.byte	0x1a
	.4byte	0xde
	.4byte	.LLST14
	.byte	0x18
	.4byte	.LASF35
	.byte	0x1
	.byte	0x30
	.byte	0x1c
	.4byte	0x3b1
	.4byte	.LLST15
	.byte	0x1a
	.4byte	0x7b8
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0x38
	.byte	0xb
	.4byte	0x638
	.byte	0x1b
	.4byte	0x7c9
	.byte	0
	.byte	0x1c
	.4byte	.LVL18
	.4byte	0x844
	.byte	0x22
	.4byte	.LVL23
	.4byte	0x657
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0x1e
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x1c
	.4byte	.LVL25
	.4byte	0x88c
	.byte	0x1d
	.4byte	.LVL26
	.4byte	0x6d1
	.4byte	0x674
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LVL27
	.4byte	0x874
	.4byte	0x688
	.byte	0x1e
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LVL32
	.4byte	0x880
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xe4
	.byte	0x14
	.4byte	.LASF67
	.byte	0x1
	.byte	0x24
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d1
	.byte	0x15
	.4byte	.LASF68
	.byte	0x1
	.byte	0x24
	.byte	0x32
	.4byte	0x3b1
	.4byte	.LLST0
	.byte	0x24
	.string	"key"
	.byte	0x1
	.byte	0x24
	.byte	0x3e
	.4byte	0x1d2
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x20
	.4byte	.LASF70
	.byte	0x1
	.byte	0x1b
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x738
	.byte	0x15
	.4byte	.LASF65
	.byte	0x1
	.byte	0x1b
	.byte	0x2e
	.4byte	0x3b1
	.4byte	.LLST6
	.byte	0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x1d
	.byte	0xf
	.4byte	0x83
	.4byte	.LLST7
	.byte	0x1a
	.4byte	0x7da
	.4byte	.LBB16
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0x20
	.byte	0x5
	.4byte	0x725
	.byte	0x25
	.4byte	0x7e7
	.4byte	.LLST8
	.byte	0
	.byte	0x1c
	.4byte	.LVL11
	.4byte	0x844
	.byte	0x23
	.4byte	.LVL15
	.4byte	0x874
	.byte	0
	.byte	0x20
	.4byte	.LASF71
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x7b8
	.byte	0x15
	.4byte	.LASF57
	.byte	0x1
	.byte	0x12
	.byte	0x21
	.4byte	0x3f9
	.4byte	.LLST1
	.byte	0x15
	.4byte	.LASF65
	.byte	0x1
	.byte	0x12
	.byte	0x3f
	.4byte	0x3b1
	.4byte	.LLST2
	.byte	0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x14
	.byte	0xf
	.4byte	0x83
	.4byte	.LLST3
	.byte	0x1a
	.4byte	0x7f2
	.4byte	.LBB8
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x17
	.byte	0x5
	.4byte	0x7a5
	.byte	0x25
	.4byte	0x809
	.4byte	.LLST4
	.byte	0x25
	.4byte	0x7ff
	.4byte	.LLST5
	.byte	0
	.byte	0x1c
	.4byte	.LVL3
	.4byte	0x844
	.byte	0x23
	.4byte	.LVL9
	.4byte	0x874
	.byte	0
	.byte	0x26
	.4byte	.LASF88
	.byte	0x2
	.byte	0x62
	.byte	0x15
	.4byte	0x5d
	.byte	0x3
	.4byte	0x7d4
	.byte	0x27
	.string	"l"
	.byte	0x2
	.byte	0x62
	.byte	0x36
	.4byte	0x7d4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xf1
	.byte	0x28
	.4byte	.LASF72
	.byte	0x2
	.byte	0x56
	.byte	0x16
	.byte	0x3
	.4byte	0x7f2
	.byte	0x27
	.string	"n"
	.byte	0x2
	.byte	0x56
	.byte	0x30
	.4byte	0x692
	.byte	0
	.byte	0x28
	.4byte	.LASF73
	.byte	0x2
	.byte	0x49
	.byte	0x16
	.byte	0x3
	.4byte	0x814
	.byte	0x27
	.string	"l"
	.byte	0x2
	.byte	0x49
	.byte	0x37
	.4byte	0x692
	.byte	0x27
	.string	"n"
	.byte	0x2
	.byte	0x49
	.byte	0x45
	.4byte	0x692
	.byte	0
	.byte	0x28
	.4byte	.LASF74
	.byte	0x2
	.byte	0x2f
	.byte	0x16
	.byte	0x3
	.4byte	0x82c
	.byte	0x27
	.string	"l"
	.byte	0x2
	.byte	0x2f
	.byte	0x2e
	.4byte	0x692
	.byte	0
	.byte	0x29
	.4byte	.LASF75
	.4byte	.LASF75
	.byte	0x5
	.byte	0x85
	.byte	0xd
	.byte	0x29
	.4byte	.LASF76
	.4byte	.LASF76
	.byte	0x5
	.byte	0x4d
	.byte	0x5
	.byte	0x29
	.4byte	.LASF77
	.4byte	.LASF77
	.byte	0x6
	.byte	0x5f
	.byte	0xb
	.byte	0x29
	.4byte	.LASF78
	.4byte	.LASF78
	.byte	0x5
	.byte	0x8f
	.byte	0xa
	.byte	0x29
	.4byte	.LASF79
	.4byte	.LASF79
	.byte	0x5
	.byte	0x61
	.byte	0xa
	.byte	0x29
	.4byte	.LASF80
	.4byte	.LASF80
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.byte	0x29
	.4byte	.LASF81
	.4byte	.LASF81
	.byte	0x6
	.byte	0x60
	.byte	0x6
	.byte	0x29
	.4byte	.LASF82
	.4byte	.LASF82
	.byte	0x5
	.byte	0xb0
	.byte	0x6
	.byte	0x29
	.4byte	.LASF83
	.4byte	.LASF83
	.byte	0x5
	.byte	0x90
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
	.byte	0x4
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
	.byte	0x12
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
	.byte	0x13
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x34
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
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
	.byte	0x21
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
	.byte	0x22
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x29
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
.LLST16:
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL41-1
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL59
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL41-1
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL47
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL41-1
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL60
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL42
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL50
	.4byte	.LVL52
	.2byte	0x4
	.byte	0x79
	.byte	0xb4,0x7f
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL42
	.4byte	.LVL50
	.2byte	0x4
	.byte	0x79
	.byte	0xcc,0
	.byte	0x9f
	.4byte	.LVL50
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL47
	.4byte	.LVL58
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL16
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18-1
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL19
	.4byte	.LVL31
	.2byte	0x3
	.byte	0x83
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL16
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL18-1
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL38
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL20
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL32
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL16
	.4byte	.LVL25
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL28
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL17
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL39
	.4byte	.LFE22
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x4
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL21
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x3
	.byte	0x84
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL22
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL32
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11-1
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL14
	.4byte	.LVL15-1
	.2byte	0x3
	.byte	0x7f
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL15-1
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL11
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3-1
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x3
	.byte	0x78
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL9-1
	.2byte	0x6
	.byte	0x7f
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL9-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL3-1
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL8
	.4byte	.LVL9-1
	.2byte	0x3
	.byte	0x7f
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL9-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL3
	.4byte	.LVL9-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x3
	.byte	0x78
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x58
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
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB12
	.4byte	.LBE12
	.4byte	.LBB13
	.4byte	.LBE13
	.4byte	0
	.4byte	0
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0
	.4byte	0
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	0
	.4byte	0
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"rt_uint32_t"
.LASF43:
	.string	"event_set"
.LASF80:
	.string	"rt_timer_start"
.LASF55:
	.string	"polling_thread"
.LASF31:
	.string	"rt_timer_t"
.LASF61:
	.string	"__wait"
.LASF12:
	.string	"rt_ubase_t"
.LASF2:
	.string	"short int"
.LASF44:
	.string	"event_info"
.LASF64:
	.string	"queue_list"
.LASF58:
	.string	"condition"
.LASF53:
	.string	"rt_wqueue_func_t"
.LASF6:
	.string	"long long int"
.LASF67:
	.string	"__wqueue_default_wake"
.LASF88:
	.string	"rt_list_isempty"
.LASF51:
	.string	"waiting_list"
.LASF66:
	.string	"rt_wqueue_wait"
.LASF50:
	.string	"rt_wqueue"
.LASF48:
	.string	"user_data"
.LASF34:
	.string	"tlist"
.LASF13:
	.string	"rt_err_t"
.LASF26:
	.string	"parent"
.LASF73:
	.string	"rt_list_insert_before"
.LASF45:
	.string	"remaining_tick"
.LASF68:
	.string	"wait"
.LASF84:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF27:
	.string	"timeout_func"
.LASF25:
	.string	"rt_timer"
.LASF7:
	.string	"long long unsigned int"
.LASF78:
	.string	"rt_thread_suspend"
.LASF4:
	.string	"long int"
.LASF79:
	.string	"rt_timer_control"
.LASF11:
	.string	"rt_base_t"
.LASF52:
	.string	"rt_wqueue_t"
.LASF30:
	.string	"timeout_tick"
.LASF57:
	.string	"queue"
.LASF20:
	.string	"name"
.LASF29:
	.string	"init_tick"
.LASF35:
	.string	"entry"
.LASF49:
	.string	"rt_thread_t"
.LASF1:
	.string	"unsigned char"
.LASF83:
	.string	"rt_thread_resume"
.LASF47:
	.string	"cleanup"
.LASF86:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF33:
	.string	"flags"
.LASF21:
	.string	"type"
.LASF8:
	.string	"unsigned int"
.LASF9:
	.string	"rt_uint8_t"
.LASF5:
	.string	"long unsigned int"
.LASF42:
	.string	"number_mask"
.LASF28:
	.string	"parameter"
.LASF3:
	.string	"short unsigned int"
.LASF85:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/waitqueue.c"
.LASF81:
	.string	"rt_hw_interrupt_enable"
.LASF24:
	.string	"char"
.LASF41:
	.string	"init_priority"
.LASF23:
	.string	"list"
.LASF75:
	.string	"rt_thread_self"
.LASF14:
	.string	"rt_tick_t"
.LASF77:
	.string	"rt_hw_interrupt_disable"
.LASF82:
	.string	"rt_schedule"
.LASF56:
	.string	"wakeup"
.LASF46:
	.string	"thread_timer"
.LASF18:
	.string	"rt_list_node"
.LASF69:
	.string	"rt_wqueue_wakeup"
.LASF87:
	.string	"__exit_wakeup"
.LASF71:
	.string	"rt_wqueue_add"
.LASF65:
	.string	"node"
.LASF63:
	.string	"need_schedule"
.LASF62:
	.string	"level"
.LASF37:
	.string	"stack_size"
.LASF54:
	.string	"rt_wqueue_node"
.LASF76:
	.string	"rt_tick_from_millisecond"
.LASF70:
	.string	"rt_wqueue_remove"
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
.LASF72:
	.string	"rt_list_remove"
.LASF16:
	.string	"prev"
.LASF36:
	.string	"stack_addr"
.LASF60:
	.string	"tick"
.LASF32:
	.string	"rt_thread"
.LASF59:
	.string	"msec"
.LASF15:
	.string	"next"
.LASF74:
	.string	"rt_list_init"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
