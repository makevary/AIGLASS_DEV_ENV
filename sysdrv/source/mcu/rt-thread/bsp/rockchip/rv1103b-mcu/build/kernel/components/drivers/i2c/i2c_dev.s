	.file	"i2c_dev.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.i2c_bus_device_control,"ax",@progbits
	.align	1
	.type	i2c_bus_device_control, @function
i2c_bus_device_control:
.LFB21:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/i2c/i2c_dev.c"
	.loc 1 57 1
	.cfi_startproc
.LVL0:
	.loc 1 58 5
	.loc 1 59 5
	.loc 1 60 5
	.loc 1 64 5 is_stmt 0
	li	a4,34
	.loc 1 60 31
	lw	a0,64(a0)
.LVL1:
	.loc 1 62 5 is_stmt 1
	.loc 1 64 5
	.loc 1 57 1 is_stmt 0
	mv	a5,a2
	.loc 1 64 5
	beq	a1,a4,.L2
	bgt	a1,a4,.L3
	li	a4,32
	beq	a1,a4,.L4
	li	a4,33
	beq	a1,a4,.L5
.L13:
	.loc 1 75 9 is_stmt 1
	.loc 1 88 12 is_stmt 0
	li	a5,0
	.loc 1 89 1
	mv	a0,a5
.LVL2:
	ret
.LVL3:
.L3:
	.loc 1 64 5
	li	a4,35
	bne	a1,a4,.L13
	.loc 1 77 9 is_stmt 1
.LVL4:
	.loc 1 78 9
	.loc 1 78 15 is_stmt 0
	lw	a1,0(a5)
.LVL5:
	lw	a2,4(a2)
.LVL6:
	.loc 1 57 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 78 15
	call	rt_i2c_transfer
.LVL7:
	.loc 1 79 9 is_stmt 1
	.loc 1 88 12 is_stmt 0
	li	a5,0
	.loc 1 79 12
	bge	a0,zero,.L1
	.loc 1 81 20
	li	a5,-8
.L1:
	.loc 1 89 1
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,a5
.LVL8:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL9:
.L4:
	.loc 1 68 9 is_stmt 1
	.loc 1 68 20 is_stmt 0
	lhu	a5,72(a0)
	ori	a5,a5,4
	sh	a5,72(a0)
	.loc 1 69 9 is_stmt 1
	j	.L13
.L5:
	.loc 1 71 9
	.loc 1 71 21 is_stmt 0
	lhu	a5,0(a2)
	.loc 1 71 19
	sh	a5,74(a0)
	.loc 1 72 9 is_stmt 1
	j	.L13
.L2:
	.loc 1 74 9
	.loc 1 74 24 is_stmt 0
	lw	a5,0(a2)
	.loc 1 74 22
	sw	a5,112(a0)
	j	.L13
	.cfi_endproc
.LFE21:
	.size	i2c_bus_device_control, .-i2c_bus_device_control
	.section	.text.i2c_bus_device_write,"ax",@progbits
	.align	1
	.type	i2c_bus_device_write, @function
i2c_bus_device_write:
.LFB20:
	.loc 1 38 1 is_stmt 1
	.cfi_startproc
.LVL10:
	.loc 1 39 5
	.loc 1 40 5
	.loc 1 41 5
	.loc 1 43 5
	.loc 1 44 5
	.loc 1 46 5
	.loc 1 48 5
	.loc 1 49 5
	.loc 1 51 5
	.loc 1 51 12 is_stmt 0
	lw	a0,64(a0)
.LVL11:
	.loc 1 38 1
	mv	a4,a3
	.loc 1 51 12
	mv	a3,a2
.LVL12:
	srli	a2,a1,16
.LVL13:
	slli	a1,a1,16
.LVL14:
	srli	a1,a1,16
	tail	rt_i2c_master_send
.LVL15:
	.cfi_endproc
.LFE20:
	.size	i2c_bus_device_write, .-i2c_bus_device_write
	.section	.text.i2c_bus_device_read,"ax",@progbits
	.align	1
	.type	i2c_bus_device_read, @function
i2c_bus_device_read:
.LFB19:
	.loc 1 18 1 is_stmt 1
	.cfi_startproc
.LVL16:
	.loc 1 19 5
	.loc 1 20 5
	.loc 1 21 5
	.loc 1 23 5
	.loc 1 24 5
	.loc 1 26 5
	.loc 1 28 5
	.loc 1 29 5
	.loc 1 31 5
	.loc 1 31 12 is_stmt 0
	lw	a0,64(a0)
.LVL17:
	.loc 1 18 1
	mv	a4,a3
	.loc 1 31 12
	mv	a3,a2
.LVL18:
	srli	a2,a1,16
.LVL19:
	slli	a1,a1,16
.LVL20:
	srli	a1,a1,16
	tail	rt_i2c_master_recv
.LVL21:
	.cfi_endproc
.LFE19:
	.size	i2c_bus_device_read, .-i2c_bus_device_read
	.section	.text.rt_i2c_bus_device_device_init,"ax",@progbits
	.align	1
	.globl	rt_i2c_bus_device_device_init
	.type	rt_i2c_bus_device_device_init, @function
rt_i2c_bus_device_device_init:
.LFB22:
	.loc 1 105 1 is_stmt 1
	.cfi_startproc
.LVL22:
	.loc 1 106 5
	.loc 1 107 5
	.loc 1 109 5
	.loc 1 111 5
	.loc 1 105 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 114 18
	li	a4,8
	sw	a4,20(a0)
	.loc 1 122 18
	lla	a4,i2c_bus_device_read
	sw	a4,52(a0)
	.loc 1 123 19
	lla	a4,i2c_bus_device_write
	sw	a4,56(a0)
	.loc 1 124 21
	lla	a4,i2c_bus_device_control
	.loc 1 111 23
	sw	a0,64(a0)
	.loc 1 114 5 is_stmt 1
	.loc 1 119 5
	.loc 1 119 18 is_stmt 0
	sw	zero,40(a0)
	.loc 1 120 5 is_stmt 1
	.loc 1 120 18 is_stmt 0
	sw	zero,44(a0)
	.loc 1 121 5 is_stmt 1
	.loc 1 121 19 is_stmt 0
	sw	zero,48(a0)
	.loc 1 122 5 is_stmt 1
	.loc 1 123 5
	.loc 1 124 5
	.loc 1 124 21 is_stmt 0
	sw	a4,60(a0)
	.loc 1 128 5 is_stmt 1
	li	a2,3
	call	rt_device_register
.LVL23:
	.loc 1 130 5
	.loc 1 131 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	rt_i2c_bus_device_device_init, .-rt_i2c_bus_device_device_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/i2c.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/i2c_dev.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa38
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF119
	.byte	0xc
	.4byte	.LASF120
	.4byte	.LASF121
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
	.byte	0x4
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
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0x94
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x4d
	.byte	0x13
	.4byte	0x88
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
	.byte	0x5
	.4byte	.LASF28
	.byte	0x2c
	.byte	0x2
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1db
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x10e
	.byte	0
	.byte	0xc
	.string	"row"
	.byte	0x2
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1db
	.byte	0x14
	.byte	0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1f8
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1f6
	.byte	0x20
	.byte	0x6
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xac
	.byte	0x24
	.byte	0x6
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xac
	.byte	0x28
	.byte	0
	.byte	0x9
	.4byte	0x101
	.4byte	0x1eb
	.byte	0xa
	.4byte	0x165
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x1f6
	.byte	0xe
	.4byte	0x1f6
	.byte	0
	.byte	0xf
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1eb
	.byte	0x5
	.4byte	.LASF34
	.byte	0x80
	.byte	0x2
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x340
	.byte	0x6
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x155
	.byte	0
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x200
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x206
	.byte	0xf
	.4byte	0x101
	.byte	0xc
	.byte	0x6
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x207
	.byte	0xf
	.4byte	0x101
	.byte	0x14
	.byte	0xc
	.string	"sp"
	.byte	0x2
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1f6
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1f6
	.byte	0x20
	.byte	0x6
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1f6
	.byte	0x24
	.byte	0x6
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1f6
	.byte	0x28
	.byte	0x6
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x20e
	.byte	0x11
	.4byte	0x67
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x211
	.byte	0xe
	.4byte	0xa0
	.byte	0x30
	.byte	0x6
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x213
	.byte	0x10
	.4byte	0x41
	.byte	0x34
	.byte	0x6
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x216
	.byte	0x10
	.4byte	0x41
	.byte	0x35
	.byte	0x6
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x217
	.byte	0x10
	.4byte	0x41
	.byte	0x36
	.byte	0x6
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x21c
	.byte	0x11
	.4byte	0x67
	.byte	0x38
	.byte	0x6
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x220
	.byte	0x11
	.4byte	0x67
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x221
	.byte	0x10
	.4byte	0x41
	.byte	0x40
	.byte	0x6
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x22d
	.byte	0x10
	.4byte	0x94
	.byte	0x44
	.byte	0x6
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x22e
	.byte	0x10
	.4byte	0x94
	.byte	0x48
	.byte	0x6
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x236
	.byte	0x15
	.4byte	0x178
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF49
	.byte	0x2
	.2byte	0x238
	.byte	0xc
	.4byte	0x351
	.byte	0x78
	.byte	0x6
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x23f
	.byte	0x11
	.4byte	0x67
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	0x34b
	.byte	0xe
	.4byte	0x34b
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1fe
	.byte	0x7
	.byte	0x4
	.4byte	0x340
	.byte	0x5
	.4byte	.LASF51
	.byte	0x1c
	.byte	0x2
	.2byte	0x25b
	.byte	0x8
	.4byte	0x382
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x25d
	.byte	0x16
	.4byte	0x10e
	.byte	0
	.byte	0x6
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x25f
	.byte	0xf
	.4byte	0x101
	.byte	0x14
	.byte	0
	.byte	0x5
	.4byte	.LASF53
	.byte	0x24
	.byte	0x2
	.2byte	0x273
	.byte	0x8
	.4byte	0x3d7
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x275
	.byte	0x1a
	.4byte	0x357
	.byte	0
	.byte	0x6
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x277
	.byte	0x11
	.4byte	0x54
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x279
	.byte	0x10
	.4byte	0x41
	.byte	0x1e
	.byte	0x6
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x27a
	.byte	0x10
	.4byte	0x41
	.byte	0x1f
	.byte	0x6
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x27c
	.byte	0x17
	.4byte	0x34b
	.byte	0x20
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x41
	.byte	0x10
	.4byte	.LASF122
	.byte	0x7
	.byte	0x4
	.4byte	0x165
	.byte	0x2
	.2byte	0x319
	.byte	0x6
	.4byte	0x475
	.byte	0x11
	.4byte	.LASF58
	.byte	0
	.byte	0x11
	.4byte	.LASF59
	.byte	0x1
	.byte	0x11
	.4byte	.LASF60
	.byte	0x2
	.byte	0x11
	.4byte	.LASF61
	.byte	0x3
	.byte	0x11
	.4byte	.LASF62
	.byte	0x4
	.byte	0x11
	.4byte	.LASF63
	.byte	0x5
	.byte	0x11
	.4byte	.LASF64
	.byte	0x6
	.byte	0x11
	.4byte	.LASF65
	.byte	0x7
	.byte	0x11
	.4byte	.LASF66
	.byte	0x8
	.byte	0x11
	.4byte	.LASF67
	.byte	0x9
	.byte	0x11
	.4byte	.LASF68
	.byte	0xa
	.byte	0x11
	.4byte	.LASF69
	.byte	0xb
	.byte	0x11
	.4byte	.LASF70
	.byte	0xc
	.byte	0x11
	.4byte	.LASF71
	.byte	0xd
	.byte	0x11
	.4byte	.LASF72
	.byte	0xe
	.byte	0x11
	.4byte	.LASF73
	.byte	0xf
	.byte	0x11
	.4byte	.LASF74
	.byte	0x10
	.byte	0x11
	.4byte	.LASF75
	.byte	0x11
	.byte	0x11
	.4byte	.LASF76
	.byte	0x12
	.byte	0x11
	.4byte	.LASF77
	.byte	0x13
	.byte	0x11
	.4byte	.LASF78
	.byte	0x14
	.byte	0x11
	.4byte	.LASF79
	.byte	0x15
	.byte	0
	.byte	0x8
	.4byte	.LASF80
	.byte	0x2
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x482
	.byte	0x7
	.byte	0x4
	.4byte	0x488
	.byte	0x5
	.4byte	.LASF81
	.byte	0x44
	.byte	0x2
	.2byte	0x387
	.byte	0x8
	.4byte	0x569
	.byte	0x6
	.4byte	.LASF29
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
	.4byte	0x3dd
	.byte	0x14
	.byte	0x6
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x38c
	.byte	0x11
	.4byte	0x54
	.byte	0x18
	.byte	0x6
	.4byte	.LASF82
	.byte	0x2
	.2byte	0x38d
	.byte	0x11
	.4byte	0x54
	.byte	0x1a
	.byte	0x6
	.4byte	.LASF83
	.byte	0x2
	.2byte	0x38f
	.byte	0x10
	.4byte	0x41
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF84
	.byte	0x2
	.2byte	0x390
	.byte	0x10
	.4byte	0x41
	.byte	0x1d
	.byte	0x6
	.4byte	.LASF85
	.byte	0x2
	.2byte	0x393
	.byte	0x10
	.4byte	0x61a
	.byte	0x20
	.byte	0x6
	.4byte	.LASF86
	.byte	0x2
	.2byte	0x394
	.byte	0x10
	.4byte	0x634
	.byte	0x24
	.byte	0x6
	.4byte	.LASF87
	.byte	0x2
	.2byte	0x39a
	.byte	0x10
	.4byte	0x578
	.byte	0x28
	.byte	0x6
	.4byte	.LASF88
	.byte	0x2
	.2byte	0x39b
	.byte	0x10
	.4byte	0x592
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF89
	.byte	0x2
	.2byte	0x39c
	.byte	0x10
	.4byte	0x578
	.byte	0x30
	.byte	0x6
	.4byte	.LASF90
	.byte	0x2
	.2byte	0x39d
	.byte	0x11
	.4byte	0x5b6
	.byte	0x34
	.byte	0x6
	.4byte	.LASF91
	.byte	0x2
	.2byte	0x39e
	.byte	0x11
	.4byte	0x5e1
	.byte	0x38
	.byte	0x6
	.4byte	.LASF92
	.byte	0x2
	.2byte	0x39f
	.byte	0x10
	.4byte	0x600
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x1f6
	.byte	0x40
	.byte	0
	.byte	0x12
	.4byte	0xa0
	.4byte	0x578
	.byte	0xe
	.4byte	0x475
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x569
	.byte	0x12
	.4byte	0xa0
	.4byte	0x592
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0x54
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x57e
	.byte	0x12
	.4byte	0xb8
	.4byte	0x5b6
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0xc4
	.byte	0xe
	.4byte	0x1f6
	.byte	0xe
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x598
	.byte	0x12
	.4byte	0xb8
	.4byte	0x5da
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0xc4
	.byte	0xe
	.4byte	0x5da
	.byte	0xe
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x5e0
	.byte	0x13
	.byte	0x7
	.byte	0x4
	.4byte	0x5bc
	.byte	0x12
	.4byte	0xa0
	.4byte	0x600
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0x81
	.byte	0xe
	.4byte	0x1f6
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x5e7
	.byte	0x12
	.4byte	0xa0
	.4byte	0x61a
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0xb8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x606
	.byte	0x12
	.4byte	0xa0
	.4byte	0x634
	.byte	0xe
	.4byte	0x475
	.byte	0xe
	.4byte	0x1f6
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x620
	.byte	0x7
	.byte	0x4
	.4byte	0x173
	.byte	0x14
	.4byte	.LASF93
	.byte	0xc
	.byte	0x3
	.byte	0x1b
	.byte	0x8
	.4byte	0x682
	.byte	0x15
	.4byte	.LASF94
	.byte	0x3
	.byte	0x1d
	.byte	0x11
	.4byte	0x54
	.byte	0
	.byte	0x15
	.4byte	.LASF35
	.byte	0x3
	.byte	0x1e
	.byte	0x11
	.4byte	0x54
	.byte	0x2
	.byte	0x16
	.string	"len"
	.byte	0x3
	.byte	0x1f
	.byte	0x11
	.4byte	0x54
	.byte	0x4
	.byte	0x16
	.string	"buf"
	.byte	0x3
	.byte	0x20
	.byte	0x11
	.4byte	0x3d7
	.byte	0x8
	.byte	0
	.byte	0x14
	.4byte	.LASF95
	.byte	0xc
	.byte	0x3
	.byte	0x25
	.byte	0x8
	.4byte	0x6b7
	.byte	0x15
	.4byte	.LASF96
	.byte	0x3
	.byte	0x27
	.byte	0x11
	.4byte	0x757
	.byte	0
	.byte	0x15
	.4byte	.LASF97
	.byte	0x3
	.byte	0x2a
	.byte	0x11
	.4byte	0x757
	.byte	0x4
	.byte	0x15
	.4byte	.LASF98
	.byte	0x3
	.byte	0x2d
	.byte	0x10
	.4byte	0x776
	.byte	0x8
	.byte	0
	.byte	0xb
	.4byte	0x682
	.byte	0x12
	.4byte	0xb8
	.4byte	0x6d5
	.byte	0xe
	.4byte	0x6d5
	.byte	0xe
	.4byte	0x751
	.byte	0xe
	.4byte	0x67
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x6db
	.byte	0x14
	.4byte	.LASF99
	.byte	0x7c
	.byte	0x3
	.byte	0x33
	.byte	0x8
	.4byte	0x751
	.byte	0x15
	.4byte	.LASF29
	.byte	0x3
	.byte	0x35
	.byte	0x16
	.4byte	0x488
	.byte	0
	.byte	0x16
	.string	"ops"
	.byte	0x3
	.byte	0x36
	.byte	0x29
	.4byte	0x77c
	.byte	0x44
	.byte	0x15
	.4byte	.LASF35
	.byte	0x3
	.byte	0x37
	.byte	0x11
	.4byte	0x54
	.byte	0x48
	.byte	0x15
	.4byte	.LASF94
	.byte	0x3
	.byte	0x38
	.byte	0x11
	.4byte	0x54
	.byte	0x4a
	.byte	0x15
	.4byte	.LASF100
	.byte	0x3
	.byte	0x39
	.byte	0x15
	.4byte	0x382
	.byte	0x4c
	.byte	0x15
	.4byte	.LASF101
	.byte	0x3
	.byte	0x3a
	.byte	0x11
	.4byte	0x67
	.byte	0x70
	.byte	0x15
	.4byte	.LASF102
	.byte	0x3
	.byte	0x3b
	.byte	0x11
	.4byte	0x67
	.byte	0x74
	.byte	0x15
	.4byte	.LASF103
	.byte	0x3
	.byte	0x3c
	.byte	0xb
	.4byte	0x1f6
	.byte	0x78
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x640
	.byte	0x7
	.byte	0x4
	.4byte	0x6bc
	.byte	0x12
	.4byte	0xa0
	.4byte	0x776
	.byte	0xe
	.4byte	0x6d5
	.byte	0xe
	.4byte	0x67
	.byte	0xe
	.4byte	0x67
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x75d
	.byte	0x7
	.byte	0x4
	.4byte	0x6b7
	.byte	0x14
	.4byte	.LASF104
	.byte	0x8
	.byte	0x4
	.byte	0x19
	.byte	0x8
	.4byte	0x7aa
	.byte	0x15
	.4byte	.LASF105
	.byte	0x4
	.byte	0x1b
	.byte	0x18
	.4byte	0x751
	.byte	0
	.byte	0x15
	.4byte	.LASF106
	.byte	0x4
	.byte	0x1c
	.byte	0xf
	.4byte	0xb8
	.byte	0x4
	.byte	0
	.byte	0x17
	.4byte	.LASF123
	.byte	0x1
	.byte	0x67
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x812
	.byte	0x18
	.string	"bus"
	.byte	0x1
	.byte	0x67
	.byte	0x42
	.4byte	0x6d5
	.4byte	.LLST20
	.byte	0x19
	.4byte	.LASF22
	.byte	0x1
	.byte	0x68
	.byte	0x34
	.4byte	0x63a
	.4byte	.LLST21
	.byte	0x1a
	.4byte	.LASF108
	.byte	0x1
	.byte	0x6a
	.byte	0x17
	.4byte	0x482
	.4byte	.LLST22
	.byte	0x1b
	.4byte	.LVL23
	.4byte	0xa0a
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x33
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF110
	.byte	0x1
	.byte	0x36
	.byte	0x11
	.4byte	0xa0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x896
	.byte	0x18
	.string	"dev"
	.byte	0x1
	.byte	0x36
	.byte	0x34
	.4byte	0x475
	.4byte	.LLST0
	.byte	0x18
	.string	"cmd"
	.byte	0x1
	.byte	0x37
	.byte	0x2c
	.4byte	0x81
	.4byte	.LLST1
	.byte	0x19
	.4byte	.LASF107
	.byte	0x1
	.byte	0x38
	.byte	0x2e
	.4byte	0x1f6
	.4byte	.LLST2
	.byte	0x1e
	.string	"ret"
	.byte	0x1
	.byte	0x3a
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST3
	.byte	0x1a
	.4byte	.LASF109
	.byte	0x1
	.byte	0x3b
	.byte	0x1e
	.4byte	0x896
	.4byte	.LLST4
	.byte	0x1e
	.string	"bus"
	.byte	0x1
	.byte	0x3c
	.byte	0x1f
	.4byte	0x6d5
	.4byte	.LLST5
	.byte	0x1f
	.4byte	.LVL7
	.4byte	0xa17
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x782
	.byte	0x1d
	.4byte	.LASF111
	.byte	0x1
	.byte	0x22
	.byte	0x12
	.4byte	0xb8
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x953
	.byte	0x18
	.string	"dev"
	.byte	0x1
	.byte	0x22
	.byte	0x33
	.4byte	0x475
	.4byte	.LLST6
	.byte	0x18
	.string	"pos"
	.byte	0x1
	.byte	0x23
	.byte	0x30
	.4byte	0xc4
	.4byte	.LLST7
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.byte	0x24
	.byte	0x33
	.4byte	0x5da
	.4byte	.LLST8
	.byte	0x19
	.4byte	.LASF113
	.byte	0x1
	.byte	0x25
	.byte	0x31
	.4byte	0xb8
	.4byte	.LLST9
	.byte	0x1a
	.4byte	.LASF94
	.byte	0x1
	.byte	0x27
	.byte	0x11
	.4byte	0x54
	.4byte	.LLST10
	.byte	0x1a
	.4byte	.LASF35
	.byte	0x1
	.byte	0x28
	.byte	0x11
	.4byte	0x54
	.4byte	.LLST11
	.byte	0x1e
	.string	"bus"
	.byte	0x1
	.byte	0x29
	.byte	0x1f
	.4byte	0x6d5
	.4byte	.LLST12
	.byte	0x20
	.4byte	.LVL15
	.4byte	0xa23
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x25
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x25
	.byte	0x1c
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x1c
	.byte	0x1
	.byte	0x5e
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF114
	.byte	0x1
	.byte	0xe
	.byte	0x12
	.4byte	0xb8
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0xa0a
	.byte	0x18
	.string	"dev"
	.byte	0x1
	.byte	0xe
	.byte	0x32
	.4byte	0x475
	.4byte	.LLST13
	.byte	0x18
	.string	"pos"
	.byte	0x1
	.byte	0xf
	.byte	0x2f
	.4byte	0xc4
	.4byte	.LLST14
	.byte	0x19
	.4byte	.LASF112
	.byte	0x1
	.byte	0x10
	.byte	0x2c
	.4byte	0x1f6
	.4byte	.LLST15
	.byte	0x19
	.4byte	.LASF113
	.byte	0x1
	.byte	0x11
	.byte	0x30
	.4byte	0xb8
	.4byte	.LLST16
	.byte	0x1a
	.4byte	.LASF94
	.byte	0x1
	.byte	0x13
	.byte	0x11
	.4byte	0x54
	.4byte	.LLST17
	.byte	0x1a
	.4byte	.LASF35
	.byte	0x1
	.byte	0x14
	.byte	0x11
	.4byte	0x54
	.4byte	.LLST18
	.byte	0x1e
	.string	"bus"
	.byte	0x1
	.byte	0x15
	.byte	0x1f
	.4byte	0x6d5
	.4byte	.LLST19
	.byte	0x20
	.4byte	.LVL21
	.4byte	0xa2f
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x25
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x25
	.byte	0x1c
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x1c
	.byte	0x1
	.byte	0x5e
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LASF115
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x190
	.byte	0xa
	.byte	0x22
	.4byte	.LASF116
	.4byte	.LASF116
	.byte	0x3
	.byte	0x4f
	.byte	0xb
	.byte	0x22
	.4byte	.LASF117
	.4byte	.LASF117
	.byte	0x3
	.byte	0x52
	.byte	0xb
	.byte	0x22
	.4byte	.LASF118
	.4byte	.LASF118
	.byte	0x3
	.byte	0x57
	.byte	0xb
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
	.byte	0x11
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x13
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x22
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
.LLST20:
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL23-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL23-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL22
	.4byte	.LVL23-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL23-1
	.4byte	.LFE22
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
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL5
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL7-1
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL7-1
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x5
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x40
	.4byte	.LVL3
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL9
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL10
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL14
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL10
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL13
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL15-1
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL10
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL12
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL15-1
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL10
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL14
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL10
	.4byte	.LVL14
	.2byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE20
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x3
	.byte	0x7a
	.byte	0xc0,0
	.4byte	.LVL11
	.4byte	.LVL15-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL17
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL20
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL16
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL19
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL21-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL16
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL18
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL21-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL20
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LFE19
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x3
	.byte	0x7a
	.byte	0xc0,0
	.4byte	.LVL17
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB22
	.4byte	.LFE22
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
.LASF119:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF36:
	.string	"tlist"
.LASF76:
	.string	"RT_Device_Class_Miscellaneous"
.LASF65:
	.string	"RT_Device_Class_Graphic"
.LASF83:
	.string	"ref_count"
.LASF35:
	.string	"flags"
.LASF93:
	.string	"rt_i2c_msg"
.LASF112:
	.string	"buffer"
.LASF75:
	.string	"RT_Device_Class_Timer"
.LASF34:
	.string	"rt_thread"
.LASF47:
	.string	"remaining_tick"
.LASF92:
	.string	"control"
.LASF26:
	.string	"unsigned int"
.LASF17:
	.string	"next"
.LASF95:
	.string	"rt_i2c_bus_device_ops"
.LASF122:
	.string	"rt_device_class_type"
.LASF20:
	.string	"rt_list_node"
.LASF11:
	.string	"rt_base_t"
.LASF62:
	.string	"RT_Device_Class_CAN"
.LASF40:
	.string	"error"
.LASF52:
	.string	"suspend_thread"
.LASF118:
	.string	"rt_i2c_master_recv"
.LASF18:
	.string	"prev"
.LASF38:
	.string	"stack_addr"
.LASF71:
	.string	"RT_Device_Class_SDIO"
.LASF28:
	.string	"rt_timer"
.LASF46:
	.string	"event_info"
.LASF25:
	.string	"list"
.LASF84:
	.string	"device_id"
.LASF13:
	.string	"rt_err_t"
.LASF108:
	.string	"device"
.LASF115:
	.string	"rt_device_register"
.LASF113:
	.string	"count"
.LASF111:
	.string	"i2c_bus_device_write"
.LASF10:
	.string	"long long unsigned int"
.LASF49:
	.string	"cleanup"
.LASF67:
	.string	"RT_Device_Class_USBDevice"
.LASF109:
	.string	"priv_data"
.LASF86:
	.string	"tx_complete"
.LASF68:
	.string	"RT_Device_Class_USBHost"
.LASF57:
	.string	"owner"
.LASF54:
	.string	"value"
.LASF63:
	.string	"RT_Device_Class_RTC"
.LASF41:
	.string	"stat"
.LASF33:
	.string	"timeout_tick"
.LASF72:
	.string	"RT_Device_Class_PM"
.LASF61:
	.string	"RT_Device_Class_MTD"
.LASF53:
	.string	"rt_mutex"
.LASF14:
	.string	"rt_tick_t"
.LASF19:
	.string	"rt_list_t"
.LASF99:
	.string	"rt_i2c_bus_device"
.LASF42:
	.string	"current_priority"
.LASF114:
	.string	"i2c_bus_device_read"
.LASF103:
	.string	"priv"
.LASF27:
	.string	"char"
.LASF117:
	.string	"rt_i2c_master_send"
.LASF89:
	.string	"close"
.LASF48:
	.string	"thread_timer"
.LASF81:
	.string	"rt_device"
.LASF79:
	.string	"RT_Device_Class_Unknown"
.LASF82:
	.string	"open_flag"
.LASF110:
	.string	"i2c_bus_device_control"
.LASF85:
	.string	"rx_indicate"
.LASF50:
	.string	"user_data"
.LASF3:
	.string	"long long int"
.LASF91:
	.string	"write"
.LASF100:
	.string	"lock"
.LASF70:
	.string	"RT_Device_Class_SPIDevice"
.LASF55:
	.string	"original_priority"
.LASF45:
	.string	"event_set"
.LASF12:
	.string	"rt_ubase_t"
.LASF78:
	.string	"RT_Device_Class_Touch"
.LASF77:
	.string	"RT_Device_Class_Sensor"
.LASF8:
	.string	"rt_uint32_t"
.LASF74:
	.string	"RT_Device_Class_Portal"
.LASF44:
	.string	"number_mask"
.LASF107:
	.string	"args"
.LASF64:
	.string	"RT_Device_Class_Sound"
.LASF43:
	.string	"init_priority"
.LASF29:
	.string	"parent"
.LASF1:
	.string	"short int"
.LASF31:
	.string	"parameter"
.LASF2:
	.string	"long int"
.LASF73:
	.string	"RT_Device_Class_Pipe"
.LASF30:
	.string	"timeout_func"
.LASF21:
	.string	"rt_object"
.LASF24:
	.string	"flag"
.LASF121:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF59:
	.string	"RT_Device_Class_Block"
.LASF116:
	.string	"rt_i2c_transfer"
.LASF51:
	.string	"rt_ipc_object"
.LASF106:
	.string	"number"
.LASF22:
	.string	"name"
.LASF88:
	.string	"open"
.LASF96:
	.string	"master_xfer"
.LASF60:
	.string	"RT_Device_Class_NetIf"
.LASF87:
	.string	"init"
.LASF56:
	.string	"hold"
.LASF9:
	.string	"long unsigned int"
.LASF80:
	.string	"rt_device_t"
.LASF37:
	.string	"entry"
.LASF23:
	.string	"type"
.LASF58:
	.string	"RT_Device_Class_Char"
.LASF4:
	.string	"unsigned char"
.LASF66:
	.string	"RT_Device_Class_I2CBUS"
.LASF104:
	.string	"rt_i2c_priv_data"
.LASF101:
	.string	"timeout"
.LASF94:
	.string	"addr"
.LASF123:
	.string	"rt_i2c_bus_device_device_init"
.LASF32:
	.string	"init_tick"
.LASF102:
	.string	"retries"
.LASF69:
	.string	"RT_Device_Class_SPIBUS"
.LASF120:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/i2c/i2c_dev.c"
.LASF0:
	.string	"signed char"
.LASF7:
	.string	"short unsigned int"
.LASF98:
	.string	"i2c_bus_control"
.LASF105:
	.string	"msgs"
.LASF39:
	.string	"stack_size"
.LASF97:
	.string	"slave_xfer"
.LASF90:
	.string	"read"
.LASF15:
	.string	"rt_size_t"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
