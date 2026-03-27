	.file	"adc.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text._adc_read,"ax",@progbits
	.align	1
	.type	_adc_read, @function
_adc_read:
.LFB20:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/misc/adc.c"
	.loc 1 23 1
	.cfi_startproc
.LVL0:
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 26 5
	.loc 1 23 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.loc 1 23 1
	mv	s1,a0
.LVL1:
	.loc 1 27 5 is_stmt 1
	.loc 1 23 1 is_stmt 0
	mv	s4,a1
	mv	s3,a2
.LVL2:
	.loc 1 29 5 is_stmt 1
	.loc 1 23 1 is_stmt 0
	mv	s2,a3
	.loc 1 29 12
	li	s0,0
.LVL3:
.L2:
	add	a2,s3,s0
.LVL4:
	.loc 1 29 17 is_stmt 1 discriminator 1
	.loc 1 29 5 is_stmt 0 discriminator 1
	bltu	s0,s2,.L4
.LVL5:
.L1:
	.loc 1 40 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
.LVL6:
	lw	s2,16(sp)
	.cfi_restore 18
.LVL7:
	lw	s3,12(sp)
	.cfi_restore 19
.LVL8:
	lw	s4,8(sp)
	.cfi_restore 20
.LVL9:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL10:
.L4:
	.cfi_restore_state
	.loc 1 31 9 is_stmt 1
	.loc 1 31 26 is_stmt 0
	lw	a5,68(s1)
	.loc 1 31 18
	add	a1,s4,s0
	mv	a0,s1
	lw	a5,4(a5)
	jalr	a5
.LVL11:
	.loc 1 32 9 is_stmt 1
	.loc 1 32 12 is_stmt 0
	bne	a0,zero,.L5
	.loc 1 36 9 is_stmt 1 discriminator 2
.LVL12:
	.loc 1 29 27 discriminator 2
	.loc 1 29 29 is_stmt 0 discriminator 2
	addi	s0,s0,4
.LVL13:
	j	.L2
.L5:
	.loc 1 34 20
	li	s0,0
.LVL14:
	j	.L1
	.cfi_endproc
.LFE20:
	.size	_adc_read, .-_adc_read
	.section	.text._adc_control,"ax",@progbits
	.align	1
	.type	_adc_control, @function
_adc_control:
.LFB21:
	.loc 1 43 1 is_stmt 1
	.cfi_startproc
.LVL15:
	.loc 1 44 5
	.loc 1 45 5
	.loc 1 47 5
	.loc 1 47 17 is_stmt 0
	lw	a4,68(a0)
	.loc 1 43 1
	mv	a5,a1
	mv	a1,a2
.LVL16:
	.loc 1 47 17
	lw	a4,0(a4)
	.loc 1 47 8
	beq	a4,zero,.L10
	.loc 1 51 5 is_stmt 1
	.loc 1 53 18 is_stmt 0
	li	a2,1
.LVL17:
	.loc 1 51 8
	bne	a5,zero,.L9
.L12:
	.loc 1 57 18
	jr	a4
.LVL18:
.L9:
	.loc 1 55 10 is_stmt 1
	.loc 1 44 14 is_stmt 0
	li	a3,0
	.loc 1 55 13
	bne	a5,a2,.L7
	.loc 1 57 9 is_stmt 1
	.loc 1 57 18 is_stmt 0
	li	a2,0
	j	.L12
.L10:
	.loc 1 49 16
	li	a3,-6
.L7:
	.loc 1 61 1
	mv	a0,a3
.LVL19:
	ret
	.cfi_endproc
.LFE21:
	.size	_adc_control, .-_adc_control
	.section	.text.rt_hw_adc_register,"ax",@progbits
	.align	1
	.globl	rt_hw_adc_register
	.type	rt_hw_adc_register, @function
rt_hw_adc_register:
.LFB22:
	.loc 1 76 1 is_stmt 1
	.cfi_startproc
.LVL20:
	.loc 1 77 5
	.loc 1 78 5
	.loc 1 80 5
	.loc 1 80 25 is_stmt 0
	li	a4,18
	sw	a4,20(a0)
	.loc 1 84 5 is_stmt 1
	.loc 1 87 25 is_stmt 0
	lla	a4,_adc_read
	sw	a4,52(a0)
	.loc 1 89 28
	lla	a4,_adc_control
	.loc 1 92 17
	sw	a2,68(a0)
	.loc 1 84 25
	sw	zero,40(a0)
	.loc 1 85 5 is_stmt 1
	.loc 1 85 25 is_stmt 0
	sw	zero,44(a0)
	.loc 1 86 5 is_stmt 1
	.loc 1 86 26 is_stmt 0
	sw	zero,48(a0)
	.loc 1 87 5 is_stmt 1
	.loc 1 88 5
	.loc 1 88 26 is_stmt 0
	sw	zero,56(a0)
	.loc 1 89 5 is_stmt 1
	.loc 1 89 28 is_stmt 0
	sw	a4,60(a0)
	.loc 1 92 5 is_stmt 1
	.loc 1 93 5
	.loc 1 93 30 is_stmt 0
	sw	a3,64(a0)
	.loc 1 95 5 is_stmt 1
	.loc 1 95 14 is_stmt 0
	li	a2,3
.LVL21:
	tail	rt_device_register
.LVL22:
	.cfi_endproc
.LFE22:
	.size	rt_hw_adc_register, .-rt_hw_adc_register
	.section	.text.rt_adc_read,"ax",@progbits
	.align	1
	.globl	rt_adc_read
	.type	rt_adc_read, @function
rt_adc_read:
.LFB23:
	.loc 1 101 1 is_stmt 1
	.cfi_startproc
.LVL23:
	.loc 1 102 5
	.loc 1 103 5
	.loc 1 105 5
	.loc 1 107 5
	.loc 1 107 19 is_stmt 0
	lw	a5,68(a0)
	.loc 1 101 1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 107 11
	lw	a5,4(a5)
	addi	a2,sp,12
	jalr	a5
.LVL24:
	.loc 1 109 5 is_stmt 1
	.loc 1 109 8 is_stmt 0
	bne	a0,zero,.L16
	.loc 1 112 5 is_stmt 1
	.loc 1 112 12 is_stmt 0
	lw	a0,12(sp)
.LVL25:
.L14:
	.loc 1 113 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL26:
.L16:
	.cfi_restore_state
	.loc 1 110 16
	li	a0,0
.LVL27:
	j	.L14
	.cfi_endproc
.LFE23:
	.size	rt_adc_read, .-rt_adc_read
	.section	.text.rt_adc_enable,"ax",@progbits
	.align	1
	.globl	rt_adc_enable
	.type	rt_adc_enable, @function
rt_adc_enable:
.LFB24:
	.loc 1 116 1 is_stmt 1
	.cfi_startproc
.LVL28:
	.loc 1 117 5
	.loc 1 119 5
	.loc 1 120 5
	.loc 1 120 17 is_stmt 0
	lw	a5,68(a0)
	lw	a5,0(a5)
	.loc 1 120 8
	beq	a5,zero,.L19
	.loc 1 122 9 is_stmt 1
	.loc 1 122 18 is_stmt 0
	li	a2,1
	jr	a5
.LVL29:
.L19:
	.loc 1 129 5 is_stmt 1
	.loc 1 130 1 is_stmt 0
	li	a0,-6
.LVL30:
	ret
	.cfi_endproc
.LFE24:
	.size	rt_adc_enable, .-rt_adc_enable
	.section	.text.rt_adc_disable,"ax",@progbits
	.align	1
	.globl	rt_adc_disable
	.type	rt_adc_disable, @function
rt_adc_disable:
.LFB25:
	.loc 1 133 1 is_stmt 1
	.cfi_startproc
.LVL31:
	.loc 1 134 5
	.loc 1 136 5
	.loc 1 137 5
	.loc 1 137 17 is_stmt 0
	lw	a5,68(a0)
	lw	a5,0(a5)
	.loc 1 137 8
	beq	a5,zero,.L21
	.loc 1 139 9 is_stmt 1
	.loc 1 139 18 is_stmt 0
	li	a2,0
	jr	a5
.LVL32:
.L21:
	.loc 1 146 5 is_stmt 1
	.loc 1 147 1 is_stmt 0
	li	a0,-6
.LVL33:
	ret
	.cfi_endproc
.LFE25:
	.size	rt_adc_disable, .-rt_adc_disable
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/adc.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x78a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF83
	.byte	0xc
	.4byte	.LASF84
	.4byte	.LASF85
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
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3e
	.byte	0x18
	.4byte	0x60
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
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x41
	.byte	0xd
	.4byte	0x8d
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x94
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0xa0
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x4d
	.byte	0x13
	.4byte	0x94
	.byte	0x5
	.4byte	.LASF20
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0xfb
	.byte	0x6
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xfb
	.byte	0
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xfb
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xd0
	.byte	0x8
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xd0
	.byte	0x5
	.4byte	.LASF21
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x155
	.byte	0x6
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x155
	.byte	0
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0x101
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x16c
	.4byte	0x165
	.byte	0xa
	.4byte	0x165
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF26
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF27
	.byte	0xb
	.4byte	0x16c
	.byte	0xc
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x67
	.byte	0xd
	.4byte	.LASF86
	.byte	0x7
	.byte	0x4
	.4byte	0x165
	.byte	0x2
	.2byte	0x319
	.byte	0x6
	.4byte	0x218
	.byte	0xe
	.4byte	.LASF28
	.byte	0
	.byte	0xe
	.4byte	.LASF29
	.byte	0x1
	.byte	0xe
	.4byte	.LASF30
	.byte	0x2
	.byte	0xe
	.4byte	.LASF31
	.byte	0x3
	.byte	0xe
	.4byte	.LASF32
	.byte	0x4
	.byte	0xe
	.4byte	.LASF33
	.byte	0x5
	.byte	0xe
	.4byte	.LASF34
	.byte	0x6
	.byte	0xe
	.4byte	.LASF35
	.byte	0x7
	.byte	0xe
	.4byte	.LASF36
	.byte	0x8
	.byte	0xe
	.4byte	.LASF37
	.byte	0x9
	.byte	0xe
	.4byte	.LASF38
	.byte	0xa
	.byte	0xe
	.4byte	.LASF39
	.byte	0xb
	.byte	0xe
	.4byte	.LASF40
	.byte	0xc
	.byte	0xe
	.4byte	.LASF41
	.byte	0xd
	.byte	0xe
	.4byte	.LASF42
	.byte	0xe
	.byte	0xe
	.4byte	.LASF43
	.byte	0xf
	.byte	0xe
	.4byte	.LASF44
	.byte	0x10
	.byte	0xe
	.4byte	.LASF45
	.byte	0x11
	.byte	0xe
	.4byte	.LASF46
	.byte	0x12
	.byte	0xe
	.4byte	.LASF47
	.byte	0x13
	.byte	0xe
	.4byte	.LASF48
	.byte	0x14
	.byte	0xe
	.4byte	.LASF49
	.byte	0x15
	.byte	0
	.byte	0x8
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x225
	.byte	0x7
	.byte	0x4
	.4byte	0x22b
	.byte	0x5
	.4byte	.LASF51
	.byte	0x44
	.byte	0x2
	.2byte	0x387
	.byte	0x8
	.4byte	0x30c
	.byte	0x6
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x389
	.byte	0x16
	.4byte	0x10e
	.byte	0
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x38b
	.byte	0x1f
	.4byte	0x180
	.byte	0x14
	.byte	0x6
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x38c
	.byte	0x11
	.4byte	0x54
	.byte	0x18
	.byte	0x6
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x38d
	.byte	0x11
	.4byte	0x54
	.byte	0x1a
	.byte	0x6
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x38f
	.byte	0x10
	.4byte	0x41
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x390
	.byte	0x10
	.4byte	0x41
	.byte	0x1d
	.byte	0x6
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x393
	.byte	0x10
	.4byte	0x3bd
	.byte	0x20
	.byte	0x6
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x394
	.byte	0x10
	.4byte	0x3d7
	.byte	0x24
	.byte	0x6
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x39a
	.byte	0x10
	.4byte	0x31b
	.byte	0x28
	.byte	0x6
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x39b
	.byte	0x10
	.4byte	0x335
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x39c
	.byte	0x10
	.4byte	0x31b
	.byte	0x30
	.byte	0x6
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x39d
	.byte	0x11
	.4byte	0x359
	.byte	0x34
	.byte	0x6
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x39e
	.byte	0x11
	.4byte	0x384
	.byte	0x38
	.byte	0x6
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x39f
	.byte	0x10
	.4byte	0x3a3
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x178
	.byte	0x40
	.byte	0
	.byte	0xf
	.4byte	0xac
	.4byte	0x31b
	.byte	0x10
	.4byte	0x218
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x30c
	.byte	0xf
	.4byte	0xac
	.4byte	0x335
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0x54
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x321
	.byte	0xf
	.4byte	0xb8
	.4byte	0x359
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0xc4
	.byte	0x10
	.4byte	0x178
	.byte	0x10
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x33b
	.byte	0xf
	.4byte	0xb8
	.4byte	0x37d
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0xc4
	.byte	0x10
	.4byte	0x37d
	.byte	0x10
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x383
	.byte	0x11
	.byte	0x7
	.byte	0x4
	.4byte	0x35f
	.byte	0xf
	.4byte	0xac
	.4byte	0x3a3
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0x8d
	.byte	0x10
	.4byte	0x178
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x38a
	.byte	0xf
	.4byte	0xac
	.4byte	0x3bd
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x3a9
	.byte	0xf
	.4byte	0xac
	.4byte	0x3d7
	.byte	0x10
	.4byte	0x218
	.byte	0x10
	.4byte	0x178
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x3c3
	.byte	0x7
	.byte	0x4
	.4byte	0x173
	.byte	0x12
	.4byte	.LASF65
	.byte	0x8
	.byte	0x3
	.byte	0x11
	.byte	0x8
	.4byte	0x40b
	.byte	0x13
	.4byte	.LASF66
	.byte	0x3
	.byte	0x13
	.byte	0x10
	.4byte	0x457
	.byte	0
	.byte	0x13
	.4byte	.LASF67
	.byte	0x3
	.byte	0x14
	.byte	0x10
	.4byte	0x476
	.byte	0x4
	.byte	0
	.byte	0xb
	.4byte	0x3e3
	.byte	0xf
	.4byte	0xac
	.4byte	0x429
	.byte	0x10
	.4byte	0x429
	.byte	0x10
	.4byte	0x67
	.byte	0x10
	.4byte	0x81
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x42f
	.byte	0x12
	.4byte	.LASF68
	.byte	0x48
	.byte	0x3
	.byte	0x17
	.byte	0x8
	.4byte	0x457
	.byte	0x13
	.4byte	.LASF52
	.byte	0x3
	.byte	0x19
	.byte	0x16
	.4byte	0x22b
	.byte	0
	.byte	0x14
	.string	"ops"
	.byte	0x3
	.byte	0x1a
	.byte	0x1e
	.4byte	0x47c
	.byte	0x44
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x410
	.byte	0xf
	.4byte	0xac
	.4byte	0x476
	.byte	0x10
	.4byte	0x429
	.byte	0x10
	.4byte	0x67
	.byte	0x10
	.4byte	0x17a
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x45d
	.byte	0x7
	.byte	0x4
	.4byte	0x40b
	.byte	0x3
	.4byte	.LASF69
	.byte	0x3
	.byte	0x1c
	.byte	0x1f
	.4byte	0x429
	.byte	0x15
	.byte	0x7
	.byte	0x4
	.4byte	0x165
	.byte	0x3
	.byte	0x1f
	.byte	0x1
	.4byte	0x4a9
	.byte	0xe
	.4byte	.LASF70
	.byte	0
	.byte	0xe
	.4byte	.LASF71
	.byte	0x1
	.byte	0
	.byte	0x16
	.4byte	.LASF73
	.byte	0x1
	.byte	0x84
	.byte	0xa
	.4byte	0xac
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x50d
	.byte	0x17
	.string	"dev"
	.byte	0x1
	.byte	0x84
	.byte	0x29
	.4byte	0x482
	.4byte	.LLST22
	.byte	0x18
	.4byte	.LASF72
	.byte	0x1
	.byte	0x84
	.byte	0x3a
	.4byte	0x67
	.4byte	.LLST23
	.byte	0x19
	.4byte	.LASF75
	.byte	0x1
	.byte	0x86
	.byte	0xe
	.4byte	0xac
	.4byte	.LLST24
	.byte	0x1a
	.4byte	.LVL32
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF74
	.byte	0x1
	.byte	0x73
	.byte	0xa
	.4byte	0xac
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x571
	.byte	0x17
	.string	"dev"
	.byte	0x1
	.byte	0x73
	.byte	0x28
	.4byte	0x482
	.4byte	.LLST19
	.byte	0x18
	.4byte	.LASF72
	.byte	0x1
	.byte	0x73
	.byte	0x39
	.4byte	0x67
	.4byte	.LLST20
	.byte	0x19
	.4byte	.LASF75
	.byte	0x1
	.byte	0x75
	.byte	0xe
	.4byte	0xac
	.4byte	.LLST21
	.byte	0x1a
	.4byte	.LVL29
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF76
	.byte	0x1
	.byte	0x64
	.byte	0xd
	.4byte	0x67
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e5
	.byte	0x17
	.string	"dev"
	.byte	0x1
	.byte	0x64
	.byte	0x29
	.4byte	0x482
	.4byte	.LLST16
	.byte	0x18
	.4byte	.LASF72
	.byte	0x1
	.byte	0x64
	.byte	0x3a
	.4byte	0x67
	.4byte	.LLST17
	.byte	0x1c
	.4byte	.LASF77
	.byte	0x1
	.byte	0x66
	.byte	0x11
	.4byte	0x67
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x1d
	.string	"ret"
	.byte	0x1
	.byte	0x67
	.byte	0x11
	.4byte	0x67
	.4byte	.LLST18
	.byte	0x1e
	.4byte	.LVL24
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF78
	.byte	0x1
	.byte	0x4b
	.byte	0xa
	.4byte	0xac
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x66a
	.byte	0x18
	.4byte	.LASF79
	.byte	0x1
	.byte	0x4b
	.byte	0x2d
	.4byte	0x482
	.4byte	.LLST12
	.byte	0x18
	.4byte	.LASF22
	.byte	0x1
	.byte	0x4b
	.byte	0x41
	.4byte	0x3dd
	.4byte	.LLST13
	.byte	0x17
	.string	"ops"
	.byte	0x1
	.byte	0x4b
	.byte	0x60
	.4byte	0x47c
	.4byte	.LLST14
	.byte	0x18
	.4byte	.LASF64
	.byte	0x1
	.byte	0x4b
	.byte	0x71
	.4byte	0x37d
	.4byte	.LLST15
	.byte	0x1f
	.4byte	.LASF75
	.byte	0x1
	.byte	0x4d
	.byte	0xe
	.4byte	0xac
	.byte	0
	.byte	0x20
	.4byte	.LVL22
	.4byte	0x780
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1b
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x33
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LASF87
	.byte	0x1
	.byte	0x2a
	.byte	0x11
	.4byte	0xac
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d2
	.byte	0x17
	.string	"dev"
	.byte	0x1
	.byte	0x2a
	.byte	0x2a
	.4byte	0x218
	.4byte	.LLST8
	.byte	0x17
	.string	"cmd"
	.byte	0x1
	.byte	0x2a
	.byte	0x33
	.4byte	0x8d
	.4byte	.LLST9
	.byte	0x18
	.4byte	.LASF80
	.byte	0x1
	.byte	0x2a
	.byte	0x3e
	.4byte	0x178
	.4byte	.LLST10
	.byte	0x1f
	.4byte	.LASF75
	.byte	0x1
	.byte	0x2c
	.byte	0xe
	.4byte	0xac
	.byte	0
	.byte	0x1d
	.string	"adc"
	.byte	0x1
	.byte	0x2d
	.byte	0x15
	.4byte	0x482
	.4byte	.LLST11
	.byte	0
	.byte	0x22
	.4byte	.LASF88
	.byte	0x1
	.byte	0x16
	.byte	0x12
	.4byte	0xb8
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x780
	.byte	0x17
	.string	"dev"
	.byte	0x1
	.byte	0x16
	.byte	0x28
	.4byte	0x218
	.4byte	.LLST0
	.byte	0x17
	.string	"pos"
	.byte	0x1
	.byte	0x16
	.byte	0x36
	.4byte	0xc4
	.4byte	.LLST1
	.byte	0x18
	.4byte	.LASF81
	.byte	0x1
	.byte	0x16
	.byte	0x41
	.4byte	0x178
	.4byte	.LLST2
	.byte	0x18
	.4byte	.LASF82
	.byte	0x1
	.byte	0x16
	.byte	0x53
	.4byte	0xb8
	.4byte	.LLST3
	.byte	0x19
	.4byte	.LASF75
	.byte	0x1
	.byte	0x18
	.byte	0xe
	.4byte	0xac
	.4byte	.LLST4
	.byte	0x1d
	.string	"i"
	.byte	0x1
	.byte	0x19
	.byte	0xf
	.4byte	0xb8
	.4byte	.LLST5
	.byte	0x1d
	.string	"adc"
	.byte	0x1
	.byte	0x1a
	.byte	0x1b
	.4byte	0x429
	.4byte	.LLST6
	.byte	0x19
	.4byte	.LASF77
	.byte	0x1
	.byte	0x1b
	.byte	0x12
	.4byte	0x17a
	.4byte	.LLST7
	.byte	0x1e
	.4byte	.LVL11
	.byte	0x1b
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1b
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x84
	.byte	0
	.byte	0x78
	.byte	0
	.byte	0x22
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF89
	.4byte	.LASF89
	.byte	0x4
	.2byte	0x190
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x17
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
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
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
.LLST22:
	.4byte	.LVL31
	.4byte	.LVL32-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL32-1
	.4byte	.LVL32
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL33
	.4byte	.LFE25
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL31
	.4byte	.LVL32-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL32-1
	.4byte	.LVL32
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LFE25
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LFE25
	.2byte	0x3
	.byte	0x9
	.byte	0xfa
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL28
	.4byte	.LVL29-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL29-1
	.4byte	.LVL29
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL30
	.4byte	.LFE24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL28
	.4byte	.LVL29-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL29-1
	.4byte	.LVL29
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LFE24
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LFE24
	.2byte	0x3
	.byte	0x9
	.byte	0xfa
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL24-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL23
	.4byte	.LVL24-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL24-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL20
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL22-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL20
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL22-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x3
	.byte	0x7a
	.byte	0xc4,0
	.4byte	.LVL22-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL20
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL22-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL15
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18-1
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL19
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL16
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL18-1
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL18-1
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL15
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18-1
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL19
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL6
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL3
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL3
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL3
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL7
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL10
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL6
	.4byte	.LVL10
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL10
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL11-1
	.4byte	.LVL12
	.2byte	0x6
	.byte	0x83
	.byte	0
	.byte	0x78
	.byte	0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x8
	.byte	0x83
	.byte	0
	.byte	0x78
	.byte	0
	.byte	0x22
	.byte	0x23
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x6
	.byte	0x83
	.byte	0
	.byte	0x78
	.byte	0
	.byte	0x22
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
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"rt_uint32_t"
.LASF60:
	.string	"close"
.LASF76:
	.string	"rt_adc_read"
.LASF84:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/misc/adc.c"
.LASF16:
	.string	"rt_off_t"
.LASF6:
	.string	"rt_uint16_t"
.LASF69:
	.string	"rt_adc_device_t"
.LASF62:
	.string	"write"
.LASF86:
	.string	"rt_device_class_type"
.LASF55:
	.string	"device_id"
.LASF70:
	.string	"RT_ADC_CMD_ENABLE"
.LASF73:
	.string	"rt_adc_disable"
.LASF13:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF46:
	.string	"RT_Device_Class_Miscellaneous"
.LASF35:
	.string	"RT_Device_Class_Graphic"
.LASF34:
	.string	"RT_Device_Class_Sound"
.LASF43:
	.string	"RT_Device_Class_Pipe"
.LASF45:
	.string	"RT_Device_Class_Timer"
.LASF77:
	.string	"value"
.LASF64:
	.string	"user_data"
.LASF29:
	.string	"RT_Device_Class_Block"
.LASF14:
	.string	"rt_err_t"
.LASF48:
	.string	"RT_Device_Class_Touch"
.LASF52:
	.string	"parent"
.LASF47:
	.string	"RT_Device_Class_Sensor"
.LASF22:
	.string	"name"
.LASF83:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF42:
	.string	"RT_Device_Class_PM"
.LASF79:
	.string	"device"
.LASF67:
	.string	"convert"
.LASF3:
	.string	"long long int"
.LASF2:
	.string	"long int"
.LASF54:
	.string	"ref_count"
.LASF21:
	.string	"rt_object"
.LASF12:
	.string	"rt_base_t"
.LASF80:
	.string	"args"
.LASF31:
	.string	"RT_Device_Class_MTD"
.LASF68:
	.string	"rt_adc_device"
.LASF85:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF11:
	.string	"rt_bool_t"
.LASF63:
	.string	"control"
.LASF4:
	.string	"unsigned char"
.LASF87:
	.string	"_adc_control"
.LASF40:
	.string	"RT_Device_Class_SPIDevice"
.LASF72:
	.string	"channel"
.LASF0:
	.string	"signed char"
.LASF10:
	.string	"long long unsigned int"
.LASF23:
	.string	"type"
.LASF26:
	.string	"unsigned int"
.LASF32:
	.string	"RT_Device_Class_CAN"
.LASF5:
	.string	"rt_uint8_t"
.LASF71:
	.string	"RT_ADC_CMD_DISABLE"
.LASF50:
	.string	"rt_device_t"
.LASF38:
	.string	"RT_Device_Class_USBHost"
.LASF51:
	.string	"rt_device"
.LASF65:
	.string	"rt_adc_ops"
.LASF27:
	.string	"char"
.LASF56:
	.string	"rx_indicate"
.LASF25:
	.string	"list"
.LASF7:
	.string	"short unsigned int"
.LASF49:
	.string	"RT_Device_Class_Unknown"
.LASF53:
	.string	"open_flag"
.LASF61:
	.string	"read"
.LASF30:
	.string	"RT_Device_Class_NetIf"
.LASF81:
	.string	"buffer"
.LASF41:
	.string	"RT_Device_Class_SDIO"
.LASF9:
	.string	"long unsigned int"
.LASF75:
	.string	"result"
.LASF20:
	.string	"rt_list_node"
.LASF82:
	.string	"size"
.LASF36:
	.string	"RT_Device_Class_I2CBUS"
.LASF37:
	.string	"RT_Device_Class_USBDevice"
.LASF66:
	.string	"enabled"
.LASF33:
	.string	"RT_Device_Class_RTC"
.LASF88:
	.string	"_adc_read"
.LASF74:
	.string	"rt_adc_enable"
.LASF59:
	.string	"open"
.LASF89:
	.string	"rt_device_register"
.LASF19:
	.string	"rt_list_t"
.LASF24:
	.string	"flag"
.LASF39:
	.string	"RT_Device_Class_SPIBUS"
.LASF18:
	.string	"prev"
.LASF15:
	.string	"rt_size_t"
.LASF78:
	.string	"rt_hw_adc_register"
.LASF44:
	.string	"RT_Device_Class_Portal"
.LASF28:
	.string	"RT_Device_Class_Char"
.LASF17:
	.string	"next"
.LASF58:
	.string	"init"
.LASF57:
	.string	"tx_complete"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
