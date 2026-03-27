	.file	"idle.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_thread_idle_sethook,"ax",@progbits
	.align	1
	.globl	rt_thread_idle_sethook
	.type	rt_thread_idle_sethook, @function
rt_thread_idle_sethook:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/idle.c"
	.loc 1 66 1
	.cfi_startproc
.LVL0:
	.loc 1 67 5
	.loc 1 68 5
	.loc 1 69 5
	.loc 1 72 5
	.loc 1 66 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 66 1
	mv	s0,a0
	.loc 1 72 13
	call	rt_hw_interrupt_disable
.LVL1:
	.loc 1 74 5 is_stmt 1
	.loc 1 74 17
	lla	a4,.LANCHOR0
	.loc 1 74 12 is_stmt 0
	li	a5,0
	mv	a3,a4
	.loc 1 74 5
	li	a2,4
.LVL2:
.L4:
	.loc 1 76 9 is_stmt 1
	.loc 1 76 12 is_stmt 0
	lw	a1,0(a4)
	bne	a1,zero,.L2
	.loc 1 78 13 is_stmt 1
	.loc 1 78 31 is_stmt 0
	slli	a5,a5,2
.LVL3:
	add	a5,a3,a5
	sw	s0,0(a5)
	.loc 1 79 13 is_stmt 1
.LVL4:
	.loc 1 80 13
	.loc 1 79 17 is_stmt 0
	li	s0,0
.LVL5:
.L3:
	.loc 1 84 5 is_stmt 1
	call	rt_hw_interrupt_enable
.LVL6:
	.loc 1 86 5
	.loc 1 87 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL7:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL8:
.L2:
	.cfi_restore_state
	.loc 1 74 24 is_stmt 1 discriminator 2
	.loc 1 74 25 is_stmt 0 discriminator 2
	addi	a5,a5,1
.LVL9:
	.loc 1 74 17 is_stmt 1 discriminator 2
	.loc 1 74 5 is_stmt 0 discriminator 2
	addi	a4,a4,4
	bne	a5,a2,.L4
	.loc 1 69 14
	li	s0,-3
.LVL10:
	j	.L3
	.cfi_endproc
.LFE15:
	.size	rt_thread_idle_sethook, .-rt_thread_idle_sethook
	.section	.text.rt_thread_idle_delhook,"ax",@progbits
	.align	1
	.globl	rt_thread_idle_delhook
	.type	rt_thread_idle_delhook, @function
rt_thread_idle_delhook:
.LFB16:
	.loc 1 98 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 99 5
	.loc 1 100 5
	.loc 1 101 5
	.loc 1 104 5
	.loc 1 98 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 98 1
	mv	s0,a0
	.loc 1 104 13
	call	rt_hw_interrupt_disable
.LVL12:
	.loc 1 106 5 is_stmt 1
	.loc 1 106 17
	lla	a4,.LANCHOR0
	.loc 1 106 12 is_stmt 0
	li	a5,0
	mv	a3,a4
	.loc 1 106 5
	li	a2,4
.LVL13:
.L10:
	.loc 1 108 9 is_stmt 1
	.loc 1 108 12 is_stmt 0
	lw	a1,0(a4)
	bne	a1,s0,.L8
	.loc 1 110 13 is_stmt 1
	.loc 1 110 31 is_stmt 0
	slli	a5,a5,2
.LVL14:
	add	a5,a3,a5
	sw	zero,0(a5)
	.loc 1 111 13 is_stmt 1
.LVL15:
	.loc 1 112 13
	.loc 1 111 17 is_stmt 0
	li	s0,0
.LVL16:
.L9:
	.loc 1 116 5 is_stmt 1
	call	rt_hw_interrupt_enable
.LVL17:
	.loc 1 118 5
	.loc 1 119 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL18:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL19:
.L8:
	.cfi_restore_state
	.loc 1 106 24 is_stmt 1 discriminator 2
	.loc 1 106 25 is_stmt 0 discriminator 2
	addi	a5,a5,1
.LVL20:
	.loc 1 106 17 is_stmt 1 discriminator 2
	.loc 1 106 5 is_stmt 0 discriminator 2
	addi	a4,a4,4
	bne	a5,a2,.L10
	.loc 1 101 14
	li	s0,-6
.LVL21:
	j	.L9
	.cfi_endproc
.LFE16:
	.size	rt_thread_idle_delhook, .-rt_thread_idle_delhook
	.section	.text.rt_thread_idle_excute,"ax",@progbits
	.align	1
	.globl	rt_thread_idle_excute
	.type	rt_thread_idle_excute, @function
rt_thread_idle_excute:
.LFB18:
	.loc 1 143 1 is_stmt 1
	.cfi_startproc
	.loc 1 146 5
	.loc 1 143 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 9, -12
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
.LBB14:
.LBB15:
	.loc 1 134 13
	lla	s1,rt_thread_defunct
.LBE15:
.LBE14:
.LBB17:
	.loc 1 187 16
	li	s4,1
.L14:
.LBE17:
	.loc 1 146 11 is_stmt 1
.LBB26:
.LBB16:
	.loc 1 132 5
.LVL22:
	.loc 1 134 5
	.loc 1 134 13 is_stmt 0
	lw	a5,0(s1)
.LBE16:
.LBE26:
	.loc 1 146 11
	bne	a5,s1,.L18
	.loc 1 222 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.L18:
	.cfi_restore_state
.LBB27:
	.loc 1 148 9 is_stmt 1
	.loc 1 149 9
	.loc 1 153 9
	.loc 1 156 9
	.loc 1 156 16 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL23:
.LBB18:
.LBB19:
	.loc 1 134 13
	lw	a5,0(s1)
.LBE19:
.LBE18:
	.loc 1 156 16
	mv	s3,a0
.LVL24:
	.loc 1 159 9 is_stmt 1
.LBB21:
.LBB20:
	.loc 1 132 5
	.loc 1 134 5
.LBE20:
.LBE21:
	.loc 1 159 12 is_stmt 0
	beq	a5,s1,.L15
	.loc 1 162 13 is_stmt 1
	.loc 1 162 70 is_stmt 0
	lw	s0,0(s1)
.LBB22:
.LBB23:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 88 22
	lw	a5,4(s0)
	.loc 2 88 6
	lw	a4,0(s0)
.LBE23:
.LBE22:
	.loc 1 162 20
	addi	s2,s0,-20
.LVL25:
	.loc 1 173 13 is_stmt 1
.LBB25:
.LBB24:
	.loc 2 88 5
	.loc 2 88 19 is_stmt 0
	sw	a5,4(a4)
	.loc 2 89 5 is_stmt 1
	.loc 2 89 19 is_stmt 0
	sw	a4,0(a5)
	.loc 2 91 5 is_stmt 1
	.loc 2 91 23 is_stmt 0
	sw	s0,4(s0)
	.loc 2 91 13
	sw	s0,0(s0)
.LVL26:
.LBE24:
.LBE25:
	.loc 1 176 13 is_stmt 1
	call	rt_enter_critical
.LVL27:
	.loc 1 179 13
	.loc 1 179 23 is_stmt 0
	lw	a5,100(s0)
	.loc 1 179 16
	beq	a5,zero,.L16
	.loc 1 180 17 is_stmt 1
	mv	a0,s2
	jalr	a5
.LVL28:
.L16:
	.loc 1 187 13
	.loc 1 187 17 is_stmt 0
	mv	a0,s2
	call	rt_object_is_systemobject
.LVL29:
	.loc 1 187 16
	bne	a0,s4,.L17
	.loc 1 190 17 is_stmt 1
	mv	a0,s2
	call	rt_object_detach
.LVL30:
	.loc 1 192 17
	call	rt_exit_critical
.LVL31:
	.loc 1 195 17
	mv	a0,s3
.LVL32:
.L15:
	.loc 1 206 13
.LBE27:
	.loc 1 222 1 is_stmt 0
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
.LBB28:
	.loc 1 206 13
	tail	rt_hw_interrupt_enable
.LVL33:
.L17:
	.cfi_restore_state
	.loc 1 201 13 is_stmt 1
	call	rt_exit_critical
.LVL34:
	.loc 1 213 9
	mv	a0,s3
	call	rt_hw_interrupt_enable
.LVL35:
	.loc 1 217 9
	lw	a0,20(s0)
	call	rt_free
.LVL36:
	.loc 1 219 9
	mv	a0,s2
	call	rt_object_delete
.LVL37:
	j	.L14
.LBE28:
	.cfi_endproc
.LFE18:
	.size	rt_thread_idle_excute, .-rt_thread_idle_excute
	.section	.text.rt_thread_idle_entry,"ax",@progbits
	.align	1
	.type	rt_thread_idle_entry, @function
rt_thread_idle_entry:
.LFB19:
	.loc 1 225 1
	.cfi_startproc
.LVL38:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	lla	s1,.LANCHOR0+16
.LVL39:
.L26:
	.loc 1 226 5
.LBB29:
	.loc 1 230 9
	.loc 1 232 9
	.loc 1 232 21
	lla	s0,.LANCHOR0
.LVL40:
.L25:
	.loc 1 234 13
	.loc 1 234 31 is_stmt 0
	lw	a5,0(s0)
	.loc 1 234 16
	beq	a5,zero,.L24
	.loc 1 236 17 is_stmt 1
	jalr	a5
.LVL41:
.L24:
	.loc 1 232 28 discriminator 2
	.loc 1 232 21 discriminator 2
	.loc 1 232 9 is_stmt 0 discriminator 2
	addi	s0,s0,4
	bne	s0,s1,.L25
	.loc 1 241 9 is_stmt 1
	call	rt_thread_idle_excute
.LVL42:
.LBE29:
	.loc 1 226 11
	.loc 1 227 5 is_stmt 0
	j	.L26
	.cfi_endproc
.LFE19:
	.size	rt_thread_idle_entry, .-rt_thread_idle_entry
	.section	.rodata.rt_thread_idle_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"tidle"
	.section	.text.rt_thread_idle_init,"ax",@progbits
	.align	1
	.globl	rt_thread_idle_init
	.type	rt_thread_idle_init, @function
rt_thread_idle_init:
.LFB20:
	.loc 1 253 1 is_stmt 1
	.cfi_startproc
	.loc 1 255 5
	.loc 1 253 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	.loc 1 255 5
	lla	s0,.LANCHOR2
	mv	a0,s0
	li	a7,32
	li	a6,31
	li	a5,1024
	lla	a4,.LANCHOR1
	li	a3,0
	lla	a2,rt_thread_idle_entry
	lla	a1,.LC0
	.loc 1 253 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 255 5
	call	rt_thread_init
.LVL43:
	.loc 1 265 5 is_stmt 1
	mv	a0,s0
	.loc 1 266 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 265 5
	tail	rt_thread_startup
.LVL44:
	.cfi_endproc
.LFE20:
	.size	rt_thread_idle_init, .-rt_thread_idle_init
	.section	.text.rt_thread_idle_gethandler,"ax",@progbits
	.align	1
	.globl	rt_thread_idle_gethandler
	.type	rt_thread_idle_gethandler, @function
rt_thread_idle_gethandler:
.LFB21:
	.loc 1 275 1 is_stmt 1
	.cfi_startproc
	.loc 1 276 5
	.loc 1 277 1 is_stmt 0
	lla	a0,.LANCHOR2
	ret
	.cfi_endproc
.LFE21:
	.size	rt_thread_idle_gethandler, .-rt_thread_idle_gethandler
	.section	.bss.idle,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	idle, @object
	.size	idle, 128
idle:
	.zero	128
	.section	.bss.idle_hook_list,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	idle_hook_list, @object
	.size	idle_hook_list, 16
idle_hook_list:
	.zero	16
	.section	.bss.rt_thread_stack,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rt_thread_stack, @object
	.size	rt_thread_stack, 1024
rt_thread_stack:
	.zero	1024
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x763
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF73
	.byte	0xc
	.4byte	.LASF74
	.4byte	.LASF75
	.4byte	.Ldebug_ranges0+0x68
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
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.4byte	.LASF6
	.byte	0x3
	.byte	0x3d
	.byte	0x17
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x3f
	.byte	0x17
	.4byte	0x67
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x67
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x47
	.byte	0x13
	.4byte	0x7c
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x49
	.byte	0x15
	.4byte	0x5b
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x4b
	.byte	0x14
	.4byte	0x88
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
	.byte	0xa
	.4byte	0xf6
	.byte	0x5
	.4byte	.LASF19
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x147
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x147
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF22
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x153
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x15e
	.4byte	0x157
	.byte	0xc
	.4byte	0x157
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
	.byte	0x8
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x155
	.byte	0x1b
	.4byte	0x172
	.byte	0x7
	.byte	0x4
	.4byte	0x100
	.byte	0x5
	.4byte	.LASF27
	.byte	0x2c
	.byte	0x3
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1db
	.byte	0x6
	.4byte	.LASF28
	.byte	0x3
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x100
	.byte	0
	.byte	0xd
	.string	"row"
	.byte	0x3
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1db
	.byte	0x14
	.byte	0x6
	.4byte	.LASF29
	.byte	0x3
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1f8
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1f6
	.byte	0x20
	.byte	0x6
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xa0
	.byte	0x24
	.byte	0x6
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xa0
	.byte	0x28
	.byte	0
	.byte	0xb
	.4byte	0xe9
	.4byte	0x1eb
	.byte	0xc
	.4byte	0x157
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	0x1f6
	.byte	0xf
	.4byte	0x1f6
	.byte	0
	.byte	0x10
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1eb
	.byte	0x5
	.4byte	.LASF33
	.byte	0x80
	.byte	0x3
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x340
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x147
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x200
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x206
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0x6
	.4byte	.LASF35
	.byte	0x3
	.2byte	0x207
	.byte	0xf
	.4byte	0xe9
	.byte	0x14
	.byte	0xd
	.string	"sp"
	.byte	0x3
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1f6
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1f6
	.byte	0x20
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1f6
	.byte	0x24
	.byte	0x6
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1f6
	.byte	0x28
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x20e
	.byte	0x11
	.4byte	0x5b
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x211
	.byte	0xe
	.4byte	0x94
	.byte	0x30
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x213
	.byte	0x10
	.4byte	0x41
	.byte	0x34
	.byte	0x6
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x216
	.byte	0x10
	.4byte	0x41
	.byte	0x35
	.byte	0x6
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x217
	.byte	0x10
	.4byte	0x41
	.byte	0x36
	.byte	0x6
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x21c
	.byte	0x11
	.4byte	0x5b
	.byte	0x38
	.byte	0x6
	.4byte	.LASF44
	.byte	0x3
	.2byte	0x220
	.byte	0x11
	.4byte	0x5b
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF45
	.byte	0x3
	.2byte	0x221
	.byte	0x10
	.4byte	0x41
	.byte	0x40
	.byte	0x6
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x22d
	.byte	0x10
	.4byte	0x88
	.byte	0x44
	.byte	0x6
	.4byte	.LASF46
	.byte	0x3
	.2byte	0x22e
	.byte	0x10
	.4byte	0x88
	.byte	0x48
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.2byte	0x236
	.byte	0x15
	.4byte	0x178
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF48
	.byte	0x3
	.2byte	0x238
	.byte	0xc
	.4byte	0x351
	.byte	0x78
	.byte	0x6
	.4byte	.LASF49
	.byte	0x3
	.2byte	0x23f
	.byte	0x11
	.4byte	0x5b
	.byte	0x7c
	.byte	0
	.byte	0xe
	.4byte	0x34b
	.byte	0xf
	.4byte	0x34b
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1fe
	.byte	0x7
	.byte	0x4
	.4byte	0x340
	.byte	0x8
	.4byte	.LASF50
	.byte	0x3
	.2byte	0x241
	.byte	0x1b
	.4byte	0x34b
	.byte	0x7
	.byte	0x4
	.4byte	0x36a
	.byte	0x11
	.byte	0x12
	.4byte	.LASF53
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.4byte	0x1fe
	.byte	0x5
	.byte	0x3
	.4byte	idle
	.byte	0xb
	.4byte	0x41
	.4byte	0x38e
	.byte	0x13
	.4byte	0x157
	.2byte	0x3ff
	.byte	0
	.byte	0x14
	.4byte	.LASF51
	.byte	0x1
	.byte	0x29
	.byte	0x13
	.4byte	0x37d
	.byte	0x4
	.byte	0x5
	.byte	0x3
	.4byte	rt_thread_stack
	.byte	0x15
	.4byte	.LASF52
	.byte	0x1
	.byte	0x2b
	.byte	0x12
	.4byte	0xe9
	.byte	0xb
	.4byte	0x3bd
	.4byte	0x3bd
	.byte	0xc
	.4byte	0x157
	.byte	0x3
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x3c3
	.byte	0x16
	.4byte	0x3ca
	.byte	0x17
	.byte	0
	.byte	0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x33
	.byte	0xf
	.4byte	0x3ad
	.byte	0x5
	.byte	0x3
	.4byte	idle_hook_list
	.byte	0x18
	.4byte	.LASF76
	.byte	0x1
	.2byte	0x112
	.byte	0xd
	.4byte	0x357
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF55
	.byte	0x1
	.byte	0xfc
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x463
	.byte	0x1a
	.4byte	.LVL43
	.4byte	0x6ee
	.4byte	0x44f
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	rt_thread_idle_entry
	.byte	0x1b
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0x1b
	.byte	0x1
	.byte	0x5e
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x1b
	.byte	0x1
	.byte	0x5f
	.byte	0x3
	.byte	0xa
	.2byte	0x400
	.byte	0x1b
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.byte	0x4f
	.byte	0x1b
	.byte	0x1
	.byte	0x61
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0x1c
	.4byte	.LVL44
	.4byte	0x6fa
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR2
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF77
	.byte	0x1
	.byte	0xe0
	.byte	0xd
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x4ab
	.byte	0x1e
	.4byte	.LASF30
	.byte	0x1
	.byte	0xe0
	.byte	0x28
	.4byte	0x1f6
	.4byte	.LLST11
	.byte	0x1f
	.4byte	.LBB29
	.4byte	.LBE29-.LBB29
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0xe6
	.byte	0x13
	.4byte	0xac
	.4byte	.LLST12
	.byte	0x21
	.4byte	.LVL42
	.4byte	0x4ab
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LASF56
	.byte	0x1
	.byte	0x8e
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x5d8
	.byte	0x22
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0x5bb
	.byte	0x23
	.4byte	.LASF57
	.byte	0x1
	.byte	0x94
	.byte	0x13
	.4byte	0x7c
	.4byte	.LLST8
	.byte	0x23
	.4byte	.LASF58
	.byte	0x1
	.byte	0x95
	.byte	0x15
	.4byte	0x357
	.4byte	.LLST9
	.byte	0x24
	.4byte	0x5d8
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0x38
	.byte	0x1
	.byte	0x9f
	.byte	0xd
	.4byte	0x50a
	.byte	0x25
	.4byte	.Ldebug_ranges0+0x38
	.byte	0x26
	.4byte	0x5e9
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	0x6d0
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x50
	.byte	0x1
	.byte	0xad
	.byte	0xd
	.4byte	0x528
	.byte	0x27
	.4byte	0x6dd
	.4byte	.LLST10
	.byte	0
	.byte	0x21
	.4byte	.LVL23
	.4byte	0x706
	.byte	0x21
	.4byte	.LVL27
	.4byte	0x712
	.byte	0x28
	.4byte	.LVL28
	.4byte	0x54a
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LVL29
	.4byte	0x71e
	.4byte	0x55e
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LVL30
	.4byte	0x72a
	.4byte	0x572
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LVL31
	.4byte	0x736
	.byte	0x29
	.4byte	.LVL33
	.4byte	0x742
	.byte	0x21
	.4byte	.LVL34
	.4byte	0x736
	.byte	0x1a
	.4byte	.LVL35
	.4byte	0x742
	.4byte	0x5a1
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LVL36
	.4byte	0x74e
	.byte	0x2a
	.4byte	.LVL37
	.4byte	0x75a
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	0x5d8
	.4byte	.LBB14
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x92
	.byte	0xc
	.byte	0x25
	.4byte	.Ldebug_ranges0+0
	.byte	0x26
	.4byte	0x5e9
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2c
	.4byte	.LASF78
	.byte	0x1
	.byte	0x7c
	.byte	0x15
	.4byte	0x75
	.byte	0x3
	.4byte	0x5f4
	.byte	0x2d
	.string	"l"
	.byte	0x1
	.byte	0x84
	.byte	0x1f
	.4byte	0x5f4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xfb
	.byte	0x2e
	.4byte	.LASF61
	.byte	0x1
	.byte	0x61
	.byte	0xa
	.4byte	0x94
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x665
	.byte	0x1e
	.4byte	.LASF59
	.byte	0x1
	.byte	0x61
	.byte	0x28
	.4byte	0x364
	.4byte	.LLST4
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0x63
	.byte	0xf
	.4byte	0xac
	.4byte	.LLST5
	.byte	0x23
	.4byte	.LASF60
	.byte	0x1
	.byte	0x64
	.byte	0xf
	.4byte	0x7c
	.4byte	.LLST6
	.byte	0x20
	.string	"ret"
	.byte	0x1
	.byte	0x65
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST7
	.byte	0x21
	.4byte	.LVL12
	.4byte	0x706
	.byte	0x21
	.4byte	.LVL17
	.4byte	0x742
	.byte	0
	.byte	0x2e
	.4byte	.LASF62
	.byte	0x1
	.byte	0x41
	.byte	0xa
	.4byte	0x94
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d0
	.byte	0x1e
	.4byte	.LASF59
	.byte	0x1
	.byte	0x41
	.byte	0x28
	.4byte	0x364
	.4byte	.LLST0
	.byte	0x20
	.string	"i"
	.byte	0x1
	.byte	0x43
	.byte	0xf
	.4byte	0xac
	.4byte	.LLST1
	.byte	0x23
	.4byte	.LASF60
	.byte	0x1
	.byte	0x44
	.byte	0xf
	.4byte	0x7c
	.4byte	.LLST2
	.byte	0x20
	.string	"ret"
	.byte	0x1
	.byte	0x45
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST3
	.byte	0x21
	.4byte	.LVL1
	.4byte	0x706
	.byte	0x21
	.4byte	.LVL6
	.4byte	0x742
	.byte	0
	.byte	0x2f
	.4byte	.LASF79
	.byte	0x2
	.byte	0x56
	.byte	0x16
	.byte	0x3
	.4byte	0x6e8
	.byte	0x30
	.string	"n"
	.byte	0x2
	.byte	0x56
	.byte	0x30
	.4byte	0x6e8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xe9
	.byte	0x31
	.4byte	.LASF63
	.4byte	.LASF63
	.byte	0x4
	.byte	0x76
	.byte	0xa
	.byte	0x31
	.4byte	.LASF64
	.4byte	.LASF64
	.byte	0x4
	.byte	0x88
	.byte	0xa
	.byte	0x31
	.4byte	.LASF65
	.4byte	.LASF65
	.byte	0x5
	.byte	0x5f
	.byte	0xb
	.byte	0x31
	.4byte	.LASF66
	.4byte	.LASF66
	.byte	0x4
	.byte	0xb4
	.byte	0x6
	.byte	0x31
	.4byte	.LASF67
	.4byte	.LASF67
	.byte	0x4
	.byte	0x32
	.byte	0xb
	.byte	0x31
	.4byte	.LASF68
	.4byte	.LASF68
	.byte	0x4
	.byte	0x2e
	.byte	0x6
	.byte	0x31
	.4byte	.LASF69
	.4byte	.LASF69
	.byte	0x4
	.byte	0xb5
	.byte	0x6
	.byte	0x31
	.4byte	.LASF70
	.4byte	.LASF70
	.byte	0x5
	.byte	0x60
	.byte	0x6
	.byte	0x31
	.4byte	.LASF71
	.4byte	.LASF71
	.byte	0x4
	.byte	0xf5
	.byte	0x6
	.byte	0x31
	.4byte	.LASF72
	.4byte	.LASF72
	.byte	0x4
	.byte	0x31
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
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
	.byte	0x88,0x1
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x15
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x18
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x1f
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x20
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
	.byte	0x21
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
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
	.byte	0x2a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0x2c
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
	.byte	0x2d
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
	.byte	0
	.byte	0
	.byte	0x2e
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
	.byte	0x2f
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
	.byte	0x30
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
	.byte	0x31
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
.LLST11:
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL39
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL39
	.4byte	.LVL40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL24
	.4byte	.LVL27-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL27-1
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL32
	.4byte	.LVL33-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL33
	.4byte	.LFE18
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL25
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL33
	.4byte	.LFE18
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12-1
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL16
	.4byte	.LVL19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL21
	.4byte	.LFE16
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL19
	.4byte	.LFE16
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL17-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL19
	.4byte	.LFE16
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL11
	.4byte	.LVL15
	.2byte	0x3
	.byte	0x9
	.byte	0xfa
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL19
	.4byte	.LFE16
	.2byte	0x3
	.byte	0x9
	.byte	0xfa
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1-1
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL5
	.4byte	.LVL8
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL10
	.4byte	.LFE15
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL8
	.4byte	.LFE15
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8
	.4byte	.LFE15
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL4
	.2byte	0x3
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8
	.4byte	.LFE15
	.2byte	0x3
	.byte	0x9
	.byte	0xfd
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x44
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
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
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
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	0
	.4byte	0
	.4byte	.LBB17
	.4byte	.LBE17
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	0
	.4byte	0
	.4byte	.LBB18
	.4byte	.LBE18
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
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB18
	.4byte	.LFE18
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
.LASF7:
	.string	"rt_uint32_t"
.LASF62:
	.string	"rt_thread_idle_sethook"
.LASF67:
	.string	"rt_object_is_systemobject"
.LASF44:
	.string	"event_set"
.LASF57:
	.string	"lock"
.LASF11:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF45:
	.string	"event_info"
.LASF56:
	.string	"rt_thread_idle_excute"
.LASF3:
	.string	"long long int"
.LASF17:
	.string	"rt_list_t"
.LASF26:
	.string	"rt_object_t"
.LASF49:
	.string	"user_data"
.LASF35:
	.string	"tlist"
.LASF12:
	.string	"rt_err_t"
.LASF28:
	.string	"parent"
.LASF13:
	.string	"rt_tick_t"
.LASF46:
	.string	"remaining_tick"
.LASF66:
	.string	"rt_enter_critical"
.LASF72:
	.string	"rt_object_delete"
.LASF68:
	.string	"rt_object_detach"
.LASF73:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF63:
	.string	"rt_thread_init"
.LASF76:
	.string	"rt_thread_idle_gethandler"
.LASF29:
	.string	"timeout_func"
.LASF52:
	.string	"rt_thread_defunct"
.LASF27:
	.string	"rt_timer"
.LASF9:
	.string	"long long unsigned int"
.LASF53:
	.string	"idle"
.LASF2:
	.string	"long int"
.LASF10:
	.string	"rt_base_t"
.LASF69:
	.string	"rt_exit_critical"
.LASF64:
	.string	"rt_thread_startup"
.LASF20:
	.string	"name"
.LASF31:
	.string	"init_tick"
.LASF75:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF50:
	.string	"rt_thread_t"
.LASF4:
	.string	"unsigned char"
.LASF78:
	.string	"_has_defunct_thread"
.LASF71:
	.string	"rt_free"
.LASF48:
	.string	"cleanup"
.LASF36:
	.string	"entry"
.LASF74:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/idle.c"
.LASF0:
	.string	"signed char"
.LASF34:
	.string	"flags"
.LASF21:
	.string	"type"
.LASF24:
	.string	"unsigned int"
.LASF6:
	.string	"rt_uint8_t"
.LASF61:
	.string	"rt_thread_idle_delhook"
.LASF8:
	.string	"long unsigned int"
.LASF43:
	.string	"number_mask"
.LASF51:
	.string	"rt_thread_stack"
.LASF30:
	.string	"parameter"
.LASF58:
	.string	"thread"
.LASF5:
	.string	"short unsigned int"
.LASF70:
	.string	"rt_hw_interrupt_enable"
.LASF25:
	.string	"char"
.LASF42:
	.string	"init_priority"
.LASF23:
	.string	"list"
.LASF65:
	.string	"rt_hw_interrupt_disable"
.LASF77:
	.string	"rt_thread_idle_entry"
.LASF47:
	.string	"thread_timer"
.LASF54:
	.string	"idle_hook_list"
.LASF18:
	.string	"rt_list_node"
.LASF55:
	.string	"rt_thread_idle_init"
.LASF60:
	.string	"level"
.LASF59:
	.string	"hook"
.LASF38:
	.string	"stack_size"
.LASF41:
	.string	"current_priority"
.LASF39:
	.string	"error"
.LASF19:
	.string	"rt_object"
.LASF32:
	.string	"timeout_tick"
.LASF22:
	.string	"flag"
.LASF40:
	.string	"stat"
.LASF79:
	.string	"rt_list_remove"
.LASF16:
	.string	"prev"
.LASF37:
	.string	"stack_addr"
.LASF33:
	.string	"rt_thread"
.LASF14:
	.string	"rt_size_t"
.LASF15:
	.string	"next"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
