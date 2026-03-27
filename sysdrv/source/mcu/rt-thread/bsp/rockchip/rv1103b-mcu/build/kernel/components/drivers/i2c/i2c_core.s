	.file	"i2c_core.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_i2c_core_init,"ax",@progbits
	.align	1
	.globl	rt_i2c_core_init
	.type	rt_i2c_core_init, @function
rt_i2c_core_init:
.LFB24:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/i2c/i2c_core.c"
	.loc 1 117 1
	.cfi_startproc
	.loc 1 118 5
	.loc 1 119 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE24:
	.size	rt_i2c_core_init, .-rt_i2c_core_init
	.section	.rodata.rt_i2c_bus_device_register.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"i2c_bus_lock"
	.section	.text.rt_i2c_bus_device_register,"ax",@progbits
	.align	1
	.globl	rt_i2c_bus_device_register
	.type	rt_i2c_bus_device_register, @function
rt_i2c_bus_device_register:
.LFB19:
	.loc 1 15 1 is_stmt 1
	.cfi_startproc
.LVL0:
	.loc 1 16 5
	.loc 1 18 5
	.loc 1 15 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	mv	s1,a1
	.loc 1 18 5
	li	a2,0
	lla	a1,.LC0
.LVL1:
	addi	a0,a0,76
.LVL2:
	.loc 1 15 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 18 5
	call	rt_mutex_init
.LVL3:
	.loc 1 20 5 is_stmt 1
	.loc 1 20 8 is_stmt 0
	lw	a5,112(s0)
	bne	a5,zero,.L3
	.loc 1 20 28 is_stmt 1 discriminator 1
	.loc 1 20 41 is_stmt 0 discriminator 1
	li	a5,1000
	sw	a5,112(s0)
.L3:
	.loc 1 22 5 is_stmt 1
	.loc 1 22 11 is_stmt 0
	mv	a0,s0
	.loc 1 27 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL4:
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 22 11
	mv	a1,s1
	.loc 1 27 1
	lw	s1,4(sp)
	.cfi_restore 9
.LVL5:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 22 11
	tail	rt_i2c_bus_device_device_init
.LVL6:
	.cfi_endproc
.LFE19:
	.size	rt_i2c_bus_device_register, .-rt_i2c_bus_device_register
	.section	.text.rt_i2c_bus_device_find,"ax",@progbits
	.align	1
	.globl	rt_i2c_bus_device_find
	.type	rt_i2c_bus_device_find, @function
rt_i2c_bus_device_find:
.LFB20:
	.loc 1 30 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 31 5
	.loc 1 32 5
	.loc 1 30 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 32 23
	call	rt_device_find
.LVL8:
	.loc 1 33 5 is_stmt 1
	.loc 1 33 8 is_stmt 0
	beq	a0,zero,.L5
	.loc 1 33 20 discriminator 1
	lw	a4,20(a0)
	li	a5,8
	bne	a4,a5,.L7
	.loc 1 40 5 is_stmt 1
	.loc 1 40 9 is_stmt 0
	lw	a0,64(a0)
.LVL9:
	.loc 1 42 5 is_stmt 1
.L5:
	.loc 1 43 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL10:
.L7:
	.cfi_restore_state
	.loc 1 37 16
	li	a0,0
.LVL11:
	j	.L5
	.cfi_endproc
.LFE20:
	.size	rt_i2c_bus_device_find, .-rt_i2c_bus_device_find
	.section	.text.rt_i2c_transfer,"ax",@progbits
	.align	1
	.globl	rt_i2c_transfer
	.type	rt_i2c_transfer, @function
rt_i2c_transfer:
.LFB21:
	.loc 1 48 1 is_stmt 1
	.cfi_startproc
.LVL12:
	.loc 1 49 5
	.loc 1 51 5
	.loc 1 51 17 is_stmt 0
	lw	a5,68(a0)
	.loc 1 48 1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	.loc 1 51 8
	lw	a5,0(a5)
	.loc 1 48 1
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 48 1
	sw	a2,12(sp)
	.loc 1 72 16
	li	s0,0
	.loc 1 51 8
	beq	a5,zero,.L12
.LBB4:
.LBB5:
	.loc 1 62 9
	addi	s2,a0,76
	mv	s0,a0
	mv	s1,a1
.LVL13:
	.loc 1 62 9 is_stmt 1
	mv	a0,s2
.LVL14:
	li	a1,-1
.LVL15:
	call	rt_mutex_take
.LVL16:
	.loc 1 63 9
	.loc 1 63 23 is_stmt 0
	lw	a5,68(s0)
	.loc 1 63 15
	lw	a2,12(sp)
	mv	a0,s0
	lw	a5,0(a5)
	mv	a1,s1
	jalr	a5
.LVL17:
	mv	s0,a0
.LVL18:
	.loc 1 64 9 is_stmt 1
	mv	a0,s2
	call	rt_mutex_release
.LVL19:
	.loc 1 66 9
.L12:
.LBE5:
.LBE4:
	.loc 1 74 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
.LVL20:
	jr	ra
	.cfi_endproc
.LFE21:
	.size	rt_i2c_transfer, .-rt_i2c_transfer
	.section	.text.rt_i2c_master_send,"ax",@progbits
	.align	1
	.globl	rt_i2c_master_send
	.type	rt_i2c_master_send, @function
rt_i2c_master_send:
.LFB22:
	.loc 1 81 1 is_stmt 1
	.cfi_startproc
.LVL21:
	.loc 1 82 5
	.loc 1 83 5
	.loc 1 85 5
	.loc 1 81 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 86 23
	andi	a2,a2,4
.LVL22:
	.loc 1 85 14
	sh	a1,4(sp)
	.loc 1 86 5 is_stmt 1
	.loc 1 86 15 is_stmt 0
	sh	a2,6(sp)
	.loc 1 87 5 is_stmt 1
	.loc 1 90 11 is_stmt 0
	addi	a1,sp,4
.LVL23:
	li	a2,1
	.loc 1 81 1
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 81 1
	mv	s0,a4
	.loc 1 87 13
	sh	a4,8(sp)
	.loc 1 88 5 is_stmt 1
	.loc 1 88 13 is_stmt 0
	sw	a3,12(sp)
	.loc 1 90 5 is_stmt 1
	.loc 1 90 11 is_stmt 0
	call	rt_i2c_transfer
.LVL24:
	.loc 1 92 5 is_stmt 1
	.loc 1 92 30 is_stmt 0
	bgt	a0,zero,.L17
	mv	s0,a0
.LVL25:
.L17:
	.loc 1 93 1 discriminator 4
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
.LVL26:
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	rt_i2c_master_send, .-rt_i2c_master_send
	.section	.text.rt_i2c_master_recv,"ax",@progbits
	.align	1
	.globl	rt_i2c_master_recv
	.type	rt_i2c_master_recv, @function
rt_i2c_master_recv:
.LFB23:
	.loc 1 100 1 is_stmt 1
	.cfi_startproc
.LVL27:
	.loc 1 101 5
	.loc 1 102 5
	.loc 1 103 5
	.loc 1 105 5
	.loc 1 106 23 is_stmt 0
	andi	a2,a2,4
.LVL28:
	.loc 1 100 1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 107 15
	ori	a2,a2,1
	.loc 1 105 14
	sh	a1,4(sp)
	.loc 1 106 5 is_stmt 1
	.loc 1 107 5
	.loc 1 107 15 is_stmt 0
	sh	a2,6(sp)
	.loc 1 108 5 is_stmt 1
	.loc 1 111 11 is_stmt 0
	addi	a1,sp,4
.LVL29:
	li	a2,1
	.loc 1 100 1
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 100 1
	mv	s0,a4
	.loc 1 108 13
	sh	a4,8(sp)
	.loc 1 109 5 is_stmt 1
	.loc 1 109 13 is_stmt 0
	sw	a3,12(sp)
	.loc 1 111 5 is_stmt 1
	.loc 1 111 11 is_stmt 0
	call	rt_i2c_transfer
.LVL30:
	.loc 1 113 5 is_stmt 1
	.loc 1 113 30 is_stmt 0
	bgt	a0,zero,.L20
	mv	s0,a0
.LVL31:
.L20:
	.loc 1 114 1 discriminator 4
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
.LVL32:
	lw	s0,24(sp)
	.cfi_restore 8
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE23:
	.size	rt_i2c_master_recv, .-rt_i2c_master_recv
	.globl	__rt_init_rt_i2c_core_init
	.section	.rti_fn.4,"a"
	.align	2
	.type	__rt_init_rt_i2c_core_init, @object
	.size	__rt_init_rt_i2c_core_init, 4
__rt_init_rt_i2c_core_init:
	.word	rt_i2c_core_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/i2c.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/i2c_dev.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb27
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF117
	.byte	0xc
	.4byte	.LASF118
	.4byte	.LASF119
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
	.4byte	0x52
	.byte	0x4
	.4byte	0x41
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3e
	.byte	0x18
	.4byte	0x65
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x78
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x78
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x8d
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x49
	.byte	0x15
	.4byte	0x6c
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0x99
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x4d
	.byte	0x13
	.4byte	0x8d
	.byte	0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0xb3
	.byte	0xf
	.4byte	0xe6
	.byte	0x4
	.4byte	0xd5
	.byte	0x6
	.byte	0x4
	.4byte	0xec
	.byte	0x7
	.4byte	0x86
	.byte	0x8
	.4byte	.LASF21
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0x11c
	.byte	0x9
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0x11c
	.byte	0
	.byte	0x9
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0x11c
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xf1
	.byte	0xa
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xf1
	.byte	0x8
	.4byte	.LASF22
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x176
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x176
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x9
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x9
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0x122
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x18d
	.4byte	0x186
	.byte	0xc
	.4byte	0x186
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF27
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF28
	.byte	0x4
	.4byte	0x18d
	.byte	0x8
	.4byte	.LASF29
	.byte	0x2c
	.byte	0x2
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1fc
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x12f
	.byte	0
	.byte	0xd
	.string	"row"
	.byte	0x2
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1fc
	.byte	0x14
	.byte	0x9
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x219
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x217
	.byte	0x20
	.byte	0x9
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xb1
	.byte	0x24
	.byte	0x9
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xb1
	.byte	0x28
	.byte	0
	.byte	0xb
	.4byte	0x122
	.4byte	0x20c
	.byte	0xc
	.4byte	0x186
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	0x217
	.byte	0xf
	.4byte	0x217
	.byte	0
	.byte	0x10
	.byte	0x4
	.byte	0x6
	.byte	0x4
	.4byte	0x20c
	.byte	0x8
	.4byte	.LASF35
	.byte	0x80
	.byte	0x2
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x361
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x176
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x9
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x200
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x9
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x206
	.byte	0xf
	.4byte	0x122
	.byte	0xc
	.byte	0x9
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x207
	.byte	0xf
	.4byte	0x122
	.byte	0x14
	.byte	0xd
	.string	"sp"
	.byte	0x2
	.2byte	0x20a
	.byte	0xb
	.4byte	0x217
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x20b
	.byte	0xb
	.4byte	0x217
	.byte	0x20
	.byte	0x9
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x20c
	.byte	0xb
	.4byte	0x217
	.byte	0x24
	.byte	0x9
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x20d
	.byte	0xb
	.4byte	0x217
	.byte	0x28
	.byte	0x9
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x20e
	.byte	0x11
	.4byte	0x6c
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x211
	.byte	0xe
	.4byte	0xa5
	.byte	0x30
	.byte	0x9
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x213
	.byte	0x10
	.4byte	0x41
	.byte	0x34
	.byte	0x9
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x216
	.byte	0x10
	.4byte	0x41
	.byte	0x35
	.byte	0x9
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x217
	.byte	0x10
	.4byte	0x41
	.byte	0x36
	.byte	0x9
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x21c
	.byte	0x11
	.4byte	0x6c
	.byte	0x38
	.byte	0x9
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x220
	.byte	0x11
	.4byte	0x6c
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x221
	.byte	0x10
	.4byte	0x41
	.byte	0x40
	.byte	0x9
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x22d
	.byte	0x10
	.4byte	0x99
	.byte	0x44
	.byte	0x9
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x22e
	.byte	0x10
	.4byte	0x99
	.byte	0x48
	.byte	0x9
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x236
	.byte	0x15
	.4byte	0x199
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x238
	.byte	0xc
	.4byte	0x372
	.byte	0x78
	.byte	0x9
	.4byte	.LASF51
	.byte	0x2
	.2byte	0x23f
	.byte	0x11
	.4byte	0x6c
	.byte	0x7c
	.byte	0
	.byte	0xe
	.4byte	0x36c
	.byte	0xf
	.4byte	0x36c
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x21f
	.byte	0x6
	.byte	0x4
	.4byte	0x361
	.byte	0x8
	.4byte	.LASF52
	.byte	0x1c
	.byte	0x2
	.2byte	0x25b
	.byte	0x8
	.4byte	0x3a3
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x25d
	.byte	0x16
	.4byte	0x12f
	.byte	0
	.byte	0x9
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x25f
	.byte	0xf
	.4byte	0x122
	.byte	0x14
	.byte	0
	.byte	0x8
	.4byte	.LASF54
	.byte	0x24
	.byte	0x2
	.2byte	0x273
	.byte	0x8
	.4byte	0x3f8
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x275
	.byte	0x1a
	.4byte	0x378
	.byte	0
	.byte	0x9
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x277
	.byte	0x11
	.4byte	0x59
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x279
	.byte	0x10
	.4byte	0x41
	.byte	0x1e
	.byte	0x9
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x27a
	.byte	0x10
	.4byte	0x41
	.byte	0x1f
	.byte	0x9
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x27c
	.byte	0x17
	.4byte	0x36c
	.byte	0x20
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x41
	.byte	0x11
	.4byte	.LASF120
	.byte	0x7
	.byte	0x4
	.4byte	0x186
	.byte	0x2
	.2byte	0x319
	.byte	0x6
	.4byte	0x496
	.byte	0x12
	.4byte	.LASF59
	.byte	0
	.byte	0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x12
	.4byte	.LASF61
	.byte	0x2
	.byte	0x12
	.4byte	.LASF62
	.byte	0x3
	.byte	0x12
	.4byte	.LASF63
	.byte	0x4
	.byte	0x12
	.4byte	.LASF64
	.byte	0x5
	.byte	0x12
	.4byte	.LASF65
	.byte	0x6
	.byte	0x12
	.4byte	.LASF66
	.byte	0x7
	.byte	0x12
	.4byte	.LASF67
	.byte	0x8
	.byte	0x12
	.4byte	.LASF68
	.byte	0x9
	.byte	0x12
	.4byte	.LASF69
	.byte	0xa
	.byte	0x12
	.4byte	.LASF70
	.byte	0xb
	.byte	0x12
	.4byte	.LASF71
	.byte	0xc
	.byte	0x12
	.4byte	.LASF72
	.byte	0xd
	.byte	0x12
	.4byte	.LASF73
	.byte	0xe
	.byte	0x12
	.4byte	.LASF74
	.byte	0xf
	.byte	0x12
	.4byte	.LASF75
	.byte	0x10
	.byte	0x12
	.4byte	.LASF76
	.byte	0x11
	.byte	0x12
	.4byte	.LASF77
	.byte	0x12
	.byte	0x12
	.4byte	.LASF78
	.byte	0x13
	.byte	0x12
	.4byte	.LASF79
	.byte	0x14
	.byte	0x12
	.4byte	.LASF80
	.byte	0x15
	.byte	0
	.byte	0xa
	.4byte	.LASF81
	.byte	0x2
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x4a3
	.byte	0x6
	.byte	0x4
	.4byte	0x4a9
	.byte	0x8
	.4byte	.LASF82
	.byte	0x44
	.byte	0x2
	.2byte	0x387
	.byte	0x8
	.4byte	0x58a
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x389
	.byte	0x16
	.4byte	0x12f
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x38b
	.byte	0x1f
	.4byte	0x3fe
	.byte	0x14
	.byte	0x9
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x38c
	.byte	0x11
	.4byte	0x59
	.byte	0x18
	.byte	0x9
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x38d
	.byte	0x11
	.4byte	0x59
	.byte	0x1a
	.byte	0x9
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x38f
	.byte	0x10
	.4byte	0x41
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x390
	.byte	0x10
	.4byte	0x41
	.byte	0x1d
	.byte	0x9
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x393
	.byte	0x10
	.4byte	0x63b
	.byte	0x20
	.byte	0x9
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x394
	.byte	0x10
	.4byte	0x655
	.byte	0x24
	.byte	0x9
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x39a
	.byte	0x10
	.4byte	0x599
	.byte	0x28
	.byte	0x9
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x39b
	.byte	0x10
	.4byte	0x5b3
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x39c
	.byte	0x10
	.4byte	0x599
	.byte	0x30
	.byte	0x9
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x39d
	.byte	0x11
	.4byte	0x5d7
	.byte	0x34
	.byte	0x9
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x39e
	.byte	0x11
	.4byte	0x602
	.byte	0x38
	.byte	0x9
	.4byte	.LASF93
	.byte	0x2
	.2byte	0x39f
	.byte	0x10
	.4byte	0x621
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF51
	.byte	0x2
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x217
	.byte	0x40
	.byte	0
	.byte	0x13
	.4byte	0xa5
	.4byte	0x599
	.byte	0xf
	.4byte	0x496
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x58a
	.byte	0x13
	.4byte	0xa5
	.4byte	0x5b3
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0x59
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x59f
	.byte	0x13
	.4byte	0xbd
	.4byte	0x5d7
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0xc9
	.byte	0xf
	.4byte	0x217
	.byte	0xf
	.4byte	0xbd
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x5b9
	.byte	0x13
	.4byte	0xbd
	.4byte	0x5fb
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0xc9
	.byte	0xf
	.4byte	0x5fb
	.byte	0xf
	.4byte	0xbd
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x601
	.byte	0x14
	.byte	0x6
	.byte	0x4
	.4byte	0x5dd
	.byte	0x13
	.4byte	0xa5
	.4byte	0x621
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0x86
	.byte	0xf
	.4byte	0x217
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x608
	.byte	0x13
	.4byte	0xa5
	.4byte	0x63b
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0xbd
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x627
	.byte	0x13
	.4byte	0xa5
	.4byte	0x655
	.byte	0xf
	.4byte	0x496
	.byte	0xf
	.4byte	0x217
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x641
	.byte	0x6
	.byte	0x4
	.4byte	0x194
	.byte	0x15
	.4byte	.LASF94
	.byte	0xc
	.byte	0x3
	.byte	0x1b
	.byte	0x8
	.4byte	0x6a3
	.byte	0x16
	.4byte	.LASF95
	.byte	0x3
	.byte	0x1d
	.byte	0x11
	.4byte	0x59
	.byte	0
	.byte	0x16
	.4byte	.LASF36
	.byte	0x3
	.byte	0x1e
	.byte	0x11
	.4byte	0x59
	.byte	0x2
	.byte	0x17
	.string	"len"
	.byte	0x3
	.byte	0x1f
	.byte	0x11
	.4byte	0x59
	.byte	0x4
	.byte	0x17
	.string	"buf"
	.byte	0x3
	.byte	0x20
	.byte	0x11
	.4byte	0x3f8
	.byte	0x8
	.byte	0
	.byte	0x15
	.4byte	.LASF96
	.byte	0xc
	.byte	0x3
	.byte	0x25
	.byte	0x8
	.4byte	0x6d8
	.byte	0x16
	.4byte	.LASF97
	.byte	0x3
	.byte	0x27
	.byte	0x11
	.4byte	0x778
	.byte	0
	.byte	0x16
	.4byte	.LASF98
	.byte	0x3
	.byte	0x2a
	.byte	0x11
	.4byte	0x778
	.byte	0x4
	.byte	0x16
	.4byte	.LASF99
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x797
	.byte	0x8
	.byte	0
	.byte	0x4
	.4byte	0x6a3
	.byte	0x13
	.4byte	0xbd
	.4byte	0x6f6
	.byte	0xf
	.4byte	0x6f6
	.byte	0xf
	.4byte	0x772
	.byte	0xf
	.4byte	0x6c
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x6fc
	.byte	0x15
	.4byte	.LASF100
	.byte	0x7c
	.byte	0x3
	.byte	0x33
	.byte	0x8
	.4byte	0x772
	.byte	0x16
	.4byte	.LASF30
	.byte	0x3
	.byte	0x35
	.byte	0x16
	.4byte	0x4a9
	.byte	0
	.byte	0x17
	.string	"ops"
	.byte	0x3
	.byte	0x36
	.byte	0x29
	.4byte	0x79d
	.byte	0x44
	.byte	0x16
	.4byte	.LASF36
	.byte	0x3
	.byte	0x37
	.byte	0x11
	.4byte	0x59
	.byte	0x48
	.byte	0x16
	.4byte	.LASF95
	.byte	0x3
	.byte	0x38
	.byte	0x11
	.4byte	0x59
	.byte	0x4a
	.byte	0x16
	.4byte	.LASF101
	.byte	0x3
	.byte	0x39
	.byte	0x15
	.4byte	0x3a3
	.byte	0x4c
	.byte	0x16
	.4byte	.LASF102
	.byte	0x3
	.byte	0x3a
	.byte	0x11
	.4byte	0x6c
	.byte	0x70
	.byte	0x16
	.4byte	.LASF103
	.byte	0x3
	.byte	0x3b
	.byte	0x11
	.4byte	0x6c
	.byte	0x74
	.byte	0x16
	.4byte	.LASF104
	.byte	0x3
	.byte	0x3c
	.byte	0xb
	.4byte	0x217
	.byte	0x78
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x661
	.byte	0x6
	.byte	0x4
	.4byte	0x6dd
	.byte	0x13
	.4byte	0xa5
	.4byte	0x797
	.byte	0xf
	.4byte	0x6f6
	.byte	0xf
	.4byte	0x6c
	.byte	0xf
	.4byte	0x6c
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x77e
	.byte	0x6
	.byte	0x4
	.4byte	0x6d8
	.byte	0x18
	.4byte	.LASF121
	.byte	0x1
	.byte	0x78
	.byte	0x27
	.4byte	0xe1
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rt_i2c_core_init
	.byte	0x19
	.4byte	.LASF122
	.byte	0x1
	.byte	0x74
	.byte	0x5
	.4byte	0x86
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.byte	0x1a
	.4byte	.LASF106
	.byte	0x1
	.byte	0x5f
	.byte	0xb
	.4byte	0xbd
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x871
	.byte	0x1b
	.string	"bus"
	.byte	0x1
	.byte	0x5f
	.byte	0x38
	.4byte	0x6f6
	.4byte	.LLST17
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0x60
	.byte	0x2a
	.4byte	0x59
	.4byte	.LLST18
	.byte	0x1c
	.4byte	.LASF36
	.byte	0x1
	.byte	0x61
	.byte	0x2a
	.4byte	0x59
	.4byte	.LLST19
	.byte	0x1b
	.string	"buf"
	.byte	0x1
	.byte	0x62
	.byte	0x2a
	.4byte	0x3f8
	.4byte	.LLST20
	.byte	0x1c
	.4byte	.LASF105
	.byte	0x1
	.byte	0x63
	.byte	0x2a
	.4byte	0x6c
	.4byte	.LLST21
	.byte	0x1d
	.string	"ret"
	.byte	0x1
	.byte	0x65
	.byte	0xe
	.4byte	0xa5
	.4byte	.LLST22
	.byte	0x1e
	.string	"msg"
	.byte	0x1
	.byte	0x66
	.byte	0x17
	.4byte	0x661
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1f
	.4byte	.LVL30
	.4byte	0x91d
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF107
	.byte	0x1
	.byte	0x4c
	.byte	0xb
	.4byte	0xbd
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x917
	.byte	0x1b
	.string	"bus"
	.byte	0x1
	.byte	0x4c
	.byte	0x38
	.4byte	0x6f6
	.4byte	.LLST11
	.byte	0x1c
	.4byte	.LASF95
	.byte	0x1
	.byte	0x4d
	.byte	0x2a
	.4byte	0x59
	.4byte	.LLST12
	.byte	0x1c
	.4byte	.LASF36
	.byte	0x1
	.byte	0x4e
	.byte	0x2a
	.4byte	0x59
	.4byte	.LLST13
	.byte	0x1b
	.string	"buf"
	.byte	0x1
	.byte	0x4f
	.byte	0x30
	.4byte	0x917
	.4byte	.LLST14
	.byte	0x1c
	.4byte	.LASF105
	.byte	0x1
	.byte	0x50
	.byte	0x2a
	.4byte	0x6c
	.4byte	.LLST15
	.byte	0x1d
	.string	"ret"
	.byte	0x1
	.byte	0x52
	.byte	0xe
	.4byte	0xa5
	.4byte	.LLST16
	.byte	0x1e
	.string	"msg"
	.byte	0x1
	.byte	0x53
	.byte	0x17
	.4byte	0x661
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1f
	.4byte	.LVL24
	.4byte	0x91d
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x4d
	.byte	0x21
	.4byte	.LASF123
	.byte	0x1
	.byte	0x2d
	.byte	0xb
	.4byte	0xbd
	.byte	0x1
	.4byte	0x95f
	.byte	0x22
	.string	"bus"
	.byte	0x1
	.byte	0x2d
	.byte	0x35
	.4byte	0x6f6
	.byte	0x23
	.4byte	.LASF108
	.byte	0x1
	.byte	0x2e
	.byte	0x2d
	.4byte	0x772
	.byte	0x22
	.string	"num"
	.byte	0x1
	.byte	0x2f
	.byte	0x27
	.4byte	0x6c
	.byte	0x24
	.string	"ret"
	.byte	0x1
	.byte	0x31
	.byte	0xf
	.4byte	0xbd
	.byte	0
	.byte	0x1a
	.4byte	.LASF109
	.byte	0x1
	.byte	0x1d
	.byte	0x1b
	.4byte	0x6f6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x9b7
	.byte	0x1c
	.4byte	.LASF110
	.byte	0x1
	.byte	0x1d
	.byte	0x3e
	.4byte	0x65b
	.4byte	.LLST2
	.byte	0x24
	.string	"bus"
	.byte	0x1
	.byte	0x1f
	.byte	0x1f
	.4byte	0x6f6
	.byte	0x1d
	.string	"dev"
	.byte	0x1
	.byte	0x20
	.byte	0x11
	.4byte	0x496
	.4byte	.LLST3
	.byte	0x1f
	.4byte	.LVL8
	.4byte	0xaea
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	.LASF111
	.byte	0x1
	.byte	0xd
	.byte	0xa
	.4byte	0xa5
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xa3a
	.byte	0x1b
	.string	"bus"
	.byte	0x1
	.byte	0xd
	.byte	0x3f
	.4byte	0x6f6
	.4byte	.LLST0
	.byte	0x1c
	.4byte	.LASF110
	.byte	0x1
	.byte	0xe
	.byte	0x31
	.4byte	0x65b
	.4byte	.LLST1
	.byte	0x25
	.string	"res"
	.byte	0x1
	.byte	0x10
	.byte	0xe
	.4byte	0xa5
	.byte	0
	.byte	0x26
	.4byte	.LVL3
	.4byte	0xaf7
	.4byte	0xa21
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x78
	.byte	0xcc,0
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x27
	.4byte	.LVL6
	.4byte	0xb04
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	0x91d
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0xaea
	.byte	0x29
	.4byte	0x92e
	.4byte	.LLST4
	.byte	0x29
	.4byte	0x93a
	.4byte	.LLST5
	.byte	0x29
	.4byte	0x946
	.4byte	.LLST6
	.byte	0x2a
	.4byte	0x952
	.byte	0x2b
	.4byte	0x91d
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x2d
	.byte	0xb
	.byte	0x29
	.4byte	0x946
	.4byte	.LLST7
	.byte	0x29
	.4byte	0x93a
	.4byte	.LLST8
	.byte	0x29
	.4byte	0x92e
	.4byte	.LLST9
	.byte	0x2c
	.4byte	0x952
	.4byte	.LLST10
	.byte	0x26
	.4byte	.LVL16
	.4byte	0xb10
	.4byte	0xabb
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x2d
	.4byte	.LVL17
	.4byte	0xad8
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x20
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x20
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0
	.byte	0x1f
	.4byte	.LVL19
	.4byte	0xb1d
	.byte	0x20
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LASF112
	.4byte	.LASF112
	.byte	0x4
	.2byte	0x18e
	.byte	0xd
	.byte	0x2e
	.4byte	.LASF113
	.4byte	.LASF113
	.byte	0x4
	.2byte	0x137
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF114
	.4byte	.LASF114
	.byte	0x5
	.byte	0x1f
	.byte	0xa
	.byte	0x2e
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x4
	.2byte	0x13c
	.byte	0xa
	.byte	0x2e
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x4
	.2byte	0x13d
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x12
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
	.byte	0x2e
	.byte	0x1
	.byte	0x31
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
	.byte	0x29
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2e
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
	.byte	0x2f
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
.LLST17:
	.4byte	.LVL27
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL30-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL27
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL29
	.4byte	.LVL30-1
	.2byte	0x2
	.byte	0x7b
	.byte	0
	.4byte	.LVL30-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL28
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL27
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL30-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL27
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL30-1
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL31
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL30
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL21
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL24-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL21
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x2
	.byte	0x7b
	.byte	0
	.4byte	.LVL24-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL22
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL21
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL24-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL21
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL24-1
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL25
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8-1
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL4
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL6-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL1
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL5
	.4byte	.LVL6-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL6-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL14
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x4
	.byte	0x82
	.byte	0xb4,0x7f
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL15
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL19
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL16-1
	.4byte	.LVL20
	.2byte	0x2
	.byte	0x91
	.byte	0x6c
	.4byte	.LVL20
	.4byte	.LFE21
	.2byte	0x2
	.byte	0x72
	.byte	0x6c
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL13
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL16-1
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x91
	.byte	0x6c
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL15
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL14
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x4
	.byte	0x82
	.byte	0xb4,0x7f
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x58
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
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"rt_uint8_t"
.LASF6:
	.string	"rt_uint16_t"
.LASF16:
	.string	"rt_off_t"
.LASF117:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF37:
	.string	"tlist"
.LASF110:
	.string	"bus_name"
.LASF77:
	.string	"RT_Device_Class_Miscellaneous"
.LASF66:
	.string	"RT_Device_Class_Graphic"
.LASF84:
	.string	"ref_count"
.LASF36:
	.string	"flags"
.LASF94:
	.string	"rt_i2c_msg"
.LASF76:
	.string	"RT_Device_Class_Timer"
.LASF35:
	.string	"rt_thread"
.LASF48:
	.string	"remaining_tick"
.LASF122:
	.string	"rt_i2c_core_init"
.LASF93:
	.string	"control"
.LASF27:
	.string	"unsigned int"
.LASF18:
	.string	"next"
.LASF96:
	.string	"rt_i2c_bus_device_ops"
.LASF120:
	.string	"rt_device_class_type"
.LASF21:
	.string	"rt_list_node"
.LASF11:
	.string	"rt_base_t"
.LASF63:
	.string	"RT_Device_Class_CAN"
.LASF41:
	.string	"error"
.LASF53:
	.string	"suspend_thread"
.LASF106:
	.string	"rt_i2c_master_recv"
.LASF19:
	.string	"prev"
.LASF39:
	.string	"stack_addr"
.LASF116:
	.string	"rt_mutex_release"
.LASF72:
	.string	"RT_Device_Class_SDIO"
.LASF29:
	.string	"rt_timer"
.LASF47:
	.string	"event_info"
.LASF26:
	.string	"list"
.LASF85:
	.string	"device_id"
.LASF13:
	.string	"rt_err_t"
.LASF105:
	.string	"count"
.LASF10:
	.string	"long long unsigned int"
.LASF50:
	.string	"cleanup"
.LASF68:
	.string	"RT_Device_Class_USBDevice"
.LASF87:
	.string	"tx_complete"
.LASF69:
	.string	"RT_Device_Class_USBHost"
.LASF58:
	.string	"owner"
.LASF55:
	.string	"value"
.LASF64:
	.string	"RT_Device_Class_RTC"
.LASF42:
	.string	"stat"
.LASF34:
	.string	"timeout_tick"
.LASF73:
	.string	"RT_Device_Class_PM"
.LASF62:
	.string	"RT_Device_Class_MTD"
.LASF54:
	.string	"rt_mutex"
.LASF14:
	.string	"rt_tick_t"
.LASF20:
	.string	"rt_list_t"
.LASF100:
	.string	"rt_i2c_bus_device"
.LASF43:
	.string	"current_priority"
.LASF104:
	.string	"priv"
.LASF28:
	.string	"char"
.LASF107:
	.string	"rt_i2c_master_send"
.LASF90:
	.string	"close"
.LASF49:
	.string	"thread_timer"
.LASF82:
	.string	"rt_device"
.LASF80:
	.string	"RT_Device_Class_Unknown"
.LASF83:
	.string	"open_flag"
.LASF86:
	.string	"rx_indicate"
.LASF51:
	.string	"user_data"
.LASF113:
	.string	"rt_mutex_init"
.LASF3:
	.string	"long long int"
.LASF92:
	.string	"write"
.LASF101:
	.string	"lock"
.LASF71:
	.string	"RT_Device_Class_SPIDevice"
.LASF118:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/i2c/i2c_core.c"
.LASF56:
	.string	"original_priority"
.LASF46:
	.string	"event_set"
.LASF17:
	.string	"init_fn_t"
.LASF12:
	.string	"rt_ubase_t"
.LASF79:
	.string	"RT_Device_Class_Touch"
.LASF78:
	.string	"RT_Device_Class_Sensor"
.LASF8:
	.string	"rt_uint32_t"
.LASF75:
	.string	"RT_Device_Class_Portal"
.LASF45:
	.string	"number_mask"
.LASF65:
	.string	"RT_Device_Class_Sound"
.LASF109:
	.string	"rt_i2c_bus_device_find"
.LASF44:
	.string	"init_priority"
.LASF30:
	.string	"parent"
.LASF1:
	.string	"short int"
.LASF32:
	.string	"parameter"
.LASF2:
	.string	"long int"
.LASF112:
	.string	"rt_device_find"
.LASF74:
	.string	"RT_Device_Class_Pipe"
.LASF31:
	.string	"timeout_func"
.LASF22:
	.string	"rt_object"
.LASF25:
	.string	"flag"
.LASF119:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF60:
	.string	"RT_Device_Class_Block"
.LASF123:
	.string	"rt_i2c_transfer"
.LASF52:
	.string	"rt_ipc_object"
.LASF23:
	.string	"name"
.LASF89:
	.string	"open"
.LASF97:
	.string	"master_xfer"
.LASF61:
	.string	"RT_Device_Class_NetIf"
.LASF88:
	.string	"init"
.LASF57:
	.string	"hold"
.LASF9:
	.string	"long unsigned int"
.LASF115:
	.string	"rt_mutex_take"
.LASF81:
	.string	"rt_device_t"
.LASF38:
	.string	"entry"
.LASF24:
	.string	"type"
.LASF59:
	.string	"RT_Device_Class_Char"
.LASF4:
	.string	"unsigned char"
.LASF67:
	.string	"RT_Device_Class_I2CBUS"
.LASF111:
	.string	"rt_i2c_bus_device_register"
.LASF102:
	.string	"timeout"
.LASF95:
	.string	"addr"
.LASF114:
	.string	"rt_i2c_bus_device_device_init"
.LASF33:
	.string	"init_tick"
.LASF103:
	.string	"retries"
.LASF70:
	.string	"RT_Device_Class_SPIBUS"
.LASF0:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF99:
	.string	"i2c_bus_control"
.LASF108:
	.string	"msgs"
.LASF121:
	.string	"__rt_init_rt_i2c_core_init"
.LASF40:
	.string	"stack_size"
.LASF98:
	.string	"slave_xfer"
.LASF91:
	.string	"read"
.LASF15:
	.string	"rt_size_t"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
