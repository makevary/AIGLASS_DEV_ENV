	.file	"board_cam.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.cam_get_pwm_name,"ax",@progbits
	.align	1
	.globl	cam_get_pwm_name
	.type	cam_get_pwm_name, @function
cam_get_pwm_name:
.LFB51:
	.file 1 "board/common/board_cam.c"
	.loc 1 64 1
	.cfi_startproc
.LVL0:
	.loc 1 65 5
	.loc 1 65 25 is_stmt 0
	li	a5,4
	div	a0,a0,a5
.LVL1:
	li	a5,2
	bgtu	a0,a5,.L3
	lla	a5,.LANCHOR0
	slli	a0,a0,2
	add	a0,a5,a0
	lw	a0,0(a0)
	ret
.L3:
	li	a0,0
	.loc 1 83 1
	ret
	.cfi_endproc
.LFE51:
	.size	cam_get_pwm_name, .-cam_get_pwm_name
	.section	.text.cam_set_gpio_level,"ax",@progbits
	.align	1
	.globl	cam_set_gpio_level
	.type	cam_set_gpio_level, @function
cam_set_gpio_level:
.LFB52:
	.loc 1 89 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 90 5
	.loc 1 91 5
	.loc 1 92 5
	.loc 1 93 5
	.loc 1 93 29 is_stmt 0
	srli	a5,a0,5
.LVL3:
	.loc 1 94 5 is_stmt 1
	.loc 1 96 5
	li	a4,2
	bgtu	a5,a4,.L6
	.loc 1 111 5 is_stmt 0
	lla	a4,.LANCHOR1
	slli	a5,a5,2
.LVL4:
	mv	a2,a1
	andi	a0,a0,31
.LVL5:
	.loc 1 109 9 is_stmt 1
	.loc 1 111 5
	add	a5,a4,a5
	li	a1,1
.LVL6:
	sll	a1,a1,a0
	lw	a0,0(a5)
.LVL7:
	.loc 1 89 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 111 5
	call	HAL_GPIO_SetPinLevel
.LVL8:
	.loc 1 112 5 is_stmt 1
	.loc 1 113 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 112 12
	li	a0,0
	.loc 1 113 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL9:
.L6:
	.loc 1 108 16
	li	a0,-1
.LVL10:
	.loc 1 113 1
	ret
	.cfi_endproc
.LFE52:
	.size	cam_set_gpio_level, .-cam_set_gpio_level
	.section	.text.cam_cfg_gpio_func,"ax",@progbits
	.align	1
	.globl	cam_cfg_gpio_func
	.type	cam_cfg_gpio_func, @function
cam_cfg_gpio_func:
.LFB53:
	.loc 1 119 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 120 5
	.loc 1 121 5
	.loc 1 122 5
	.loc 1 123 5
	.loc 1 124 5
	.loc 1 125 5
	.loc 1 126 5
	.loc 1 128 5
	.loc 1 119 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,16(sp)
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.loc 1 128 29
	srli	s1,a0,5
.LVL12:
	.loc 1 129 5 is_stmt 1
	.loc 1 131 5
	li	a5,2
	bgtu	s1,a5,.L13
	slli	a4,s1,2
	lla	a5,CSWTCH.13
	add	a5,a5,a4
	lw	s2,0(a5)
.LVL13:
	.loc 1 147 9
	.loc 1 150 5
	mv	s0,a1
.LVL14:
	.loc 1 158 5
	.loc 1 166 5
	.loc 1 167 5
	andi	a0,a0,31
.LVL15:
	.loc 1 150 8 is_stmt 0
	srli	a2,s0,25
	.loc 1 167 40
	li	a1,1
.LVL16:
	sll	a1,a1,a0
	.loc 1 167 5
	andi	a2,a2,1
	mv	a0,s2
.LVL17:
	sw	a1,12(sp)
	call	HAL_GPIO_SetPinDirection
.LVL18:
	.loc 1 168 5 is_stmt 1
	lw	a1,12(sp)
	.loc 1 158 8 is_stmt 0
	srli	a2,s0,26
	.loc 1 168 5
	andi	a2,a2,1
	mv	a0,s2
	call	HAL_GPIO_SetPinLevel
.LVL19:
	.loc 1 169 5 is_stmt 1
	.loc 1 166 65 is_stmt 0
	li	a2,2046820352
	addi	a2,a2,-1
	.loc 1 169 5
	lw	a1,12(sp)
	.loc 1 166 65
	and	s0,s0,a2
.LVL20:
	.loc 1 169 5
	li	a2,-2147483648
	or	a2,s0,a2
	mv	a0,s1
	call	HAL_PINCTRL_SetIOMUX
.LVL21:
	.loc 1 170 5 is_stmt 1
	.loc 1 170 12 is_stmt 0
	li	a0,0
.LVL22:
.L11:
	.loc 1 171 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
.LVL23:
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL24:
.L13:
	.cfi_restore_state
	.loc 1 146 16
	li	a0,-1
.LVL25:
	j	.L11
	.cfi_endproc
.LFE53:
	.size	cam_cfg_gpio_func, .-cam_cfg_gpio_func
	.set	CSWTCH.13,CSWTCH.11
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"pwm0"
	.align	2
.LC1:
	.string	"pwm1"
	.align	2
.LC2:
	.string	"pwm2"
	.weak	vicap_board
	.weak	csi2_host1_board
	.weak	csi2_host0_board
	.weak	csi2_dphy_board
	.align	2
.LC3:
	.string	"sensor_main"
	.align	2
.LC4:
	.string	"sensor_assist"
	.section	.data.csi2_dphy_board,"aw"
	.align	2
	.type	csi2_dphy_board, @object
	.size	csi2_dphy_board, 25
csi2_dphy_board:
	.byte	0
	.4byte	551223296
	.byte	0
	.4byte	2
	.byte	0
	.4byte	.LC3
	.byte	1
	.4byte	2
	.byte	0
	.4byte	.LC4
	.section	.data.csi2_host0_board,"aw"
	.align	2
	.type	csi2_host0_board, @object
	.size	csi2_host0_board, 14
csi2_host0_board:
	.byte	0
	.byte	0
	.zero	8
	.4byte	551092224
	.section	.data.csi2_host1_board,"aw"
	.align	2
	.type	csi2_host1_board, @object
	.size	csi2_host1_board, 14
csi2_host1_board:
	.byte	1
	.byte	0
	.zero	8
	.4byte	551157760
	.section	.rodata.CSWTCH.11,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	CSWTCH.11, @object
	.size	CSWTCH.11, 12
CSWTCH.11:
	.word	542244864
	.word	551026688
	.word	545521664
	.section	.rodata.CSWTCH.9,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.9, @object
	.size	CSWTCH.9, 12
CSWTCH.9:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.section	.sdata.vicap_board,"aw"
	.align	2
	.type	vicap_board, @object
	.size	vicap_board, 5
vicap_board:
	.byte	0
	.4byte	550567936
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_gpio.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/drv_isp3.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x80d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF126
	.byte	0xc
	.4byte	.LASF127
	.4byte	.LASF128
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
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4
	.byte	0x7
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
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x4
	.4byte	0x6b
	.byte	0x5
	.byte	0x4
	.4byte	0x72
	.byte	0x5
	.byte	0x4
	.4byte	0x6b
	.byte	0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x6
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x83
	.byte	0x7
	.4byte	0x8f
	.byte	0x4
	.4byte	0x9b
	.byte	0x8
	.4byte	0x8f
	.4byte	0xb5
	.byte	0x9
	.4byte	0x64
	.byte	0x1
	.byte	0
	.byte	0xa
	.4byte	.LASF93
	.2byte	0x128
	.byte	0x4
	.2byte	0x1e6
	.byte	0x8
	.4byte	0x337
	.byte	0xb
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x1e7
	.byte	0x17
	.4byte	0x9b
	.byte	0
	.byte	0xb
	.4byte	.LASF13
	.byte	0x4
	.2byte	0x1e8
	.byte	0x17
	.4byte	0x9b
	.byte	0x4
	.byte	0xb
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x1e9
	.byte	0x17
	.4byte	0x9b
	.byte	0x8
	.byte	0xb
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x1ea
	.byte	0x17
	.4byte	0x9b
	.byte	0xc
	.byte	0xb
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x1eb
	.byte	0x17
	.4byte	0x9b
	.byte	0x10
	.byte	0xb
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1ec
	.byte	0x17
	.4byte	0x9b
	.byte	0x14
	.byte	0xb
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1ed
	.byte	0x17
	.4byte	0x9b
	.byte	0x18
	.byte	0xb
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1ee
	.byte	0x17
	.4byte	0x9b
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1ef
	.byte	0x17
	.4byte	0x9b
	.byte	0x20
	.byte	0xb
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1f0
	.byte	0x17
	.4byte	0x9b
	.byte	0x24
	.byte	0xb
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1f1
	.byte	0x17
	.4byte	0x9b
	.byte	0x28
	.byte	0xb
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1f2
	.byte	0x17
	.4byte	0x9b
	.byte	0x2c
	.byte	0xb
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1f3
	.byte	0x17
	.4byte	0x9b
	.byte	0x30
	.byte	0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1f4
	.byte	0x17
	.4byte	0x9b
	.byte	0x34
	.byte	0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1f5
	.byte	0x17
	.4byte	0x9b
	.byte	0x38
	.byte	0xb
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1f6
	.byte	0x17
	.4byte	0x9b
	.byte	0x3c
	.byte	0xb
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x1f7
	.byte	0x17
	.4byte	0x9b
	.byte	0x40
	.byte	0xb
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x1f8
	.byte	0x17
	.4byte	0x9b
	.byte	0x44
	.byte	0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1f9
	.byte	0x17
	.4byte	0x9b
	.byte	0x48
	.byte	0xb
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x1fa
	.byte	0x13
	.4byte	0x8f
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x1fb
	.byte	0x1d
	.4byte	0xa0
	.byte	0x50
	.byte	0xb
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x1fc
	.byte	0x13
	.4byte	0x8f
	.byte	0x54
	.byte	0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x1fd
	.byte	0x1d
	.4byte	0xa0
	.byte	0x58
	.byte	0xb
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x1fe
	.byte	0x13
	.4byte	0x8f
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x1ff
	.byte	0x17
	.4byte	0x9b
	.byte	0x60
	.byte	0xb
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x200
	.byte	0x17
	.4byte	0x9b
	.byte	0x64
	.byte	0xb
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x201
	.byte	0x13
	.4byte	0xa5
	.byte	0x68
	.byte	0xb
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x202
	.byte	0x1d
	.4byte	0xa0
	.byte	0x70
	.byte	0xb
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x203
	.byte	0x13
	.4byte	0x8f
	.byte	0x74
	.byte	0xb
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x204
	.byte	0x1d
	.4byte	0xa0
	.byte	0x78
	.byte	0xb
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x205
	.byte	0x13
	.4byte	0x8f
	.byte	0x7c
	.byte	0xb
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x206
	.byte	0x17
	.4byte	0x9b
	.byte	0x80
	.byte	0xb
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x207
	.byte	0x17
	.4byte	0x9b
	.byte	0x84
	.byte	0xb
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x208
	.byte	0x13
	.4byte	0x337
	.byte	0x88
	.byte	0xc
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x209
	.byte	0x17
	.4byte	0x9b
	.2byte	0x100
	.byte	0xc
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x20a
	.byte	0x17
	.4byte	0x9b
	.2byte	0x104
	.byte	0xc
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x20b
	.byte	0x17
	.4byte	0x9b
	.2byte	0x108
	.byte	0xc
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x20c
	.byte	0x13
	.4byte	0x8f
	.2byte	0x10c
	.byte	0xc
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x20d
	.byte	0x17
	.4byte	0x9b
	.2byte	0x110
	.byte	0xc
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x20e
	.byte	0x17
	.4byte	0x9b
	.2byte	0x114
	.byte	0xc
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x20f
	.byte	0x17
	.4byte	0x9b
	.2byte	0x118
	.byte	0xc
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x210
	.byte	0x17
	.4byte	0x9b
	.2byte	0x11c
	.byte	0xc
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x211
	.byte	0x17
	.4byte	0x9b
	.2byte	0x120
	.byte	0xc
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x212
	.byte	0x17
	.4byte	0x9b
	.2byte	0x124
	.byte	0
	.byte	0x8
	.4byte	0x8f
	.4byte	0x347
	.byte	0x9
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x5
	.byte	0x2e
	.byte	0x6
	.4byte	0x398
	.byte	0xe
	.4byte	.LASF56
	.byte	0
	.byte	0xe
	.4byte	.LASF57
	.byte	0x1
	.byte	0xe
	.4byte	.LASF58
	.byte	0x2
	.byte	0xe
	.4byte	.LASF59
	.byte	0x3
	.byte	0xe
	.4byte	.LASF60
	.byte	0x4
	.byte	0xe
	.4byte	.LASF61
	.byte	0x5
	.byte	0xe
	.4byte	.LASF62
	.byte	0x6
	.byte	0xe
	.4byte	.LASF63
	.byte	0x7
	.byte	0xe
	.4byte	.LASF64
	.byte	0x8
	.byte	0xe
	.4byte	.LASF65
	.byte	0x9
	.byte	0xe
	.4byte	.LASF66
	.byte	0xa
	.byte	0
	.byte	0xf
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x6
	.2byte	0x42b
	.byte	0xe
	.4byte	0x3cc
	.byte	0xe
	.4byte	.LASF67
	.byte	0
	.byte	0xe
	.4byte	.LASF68
	.byte	0x1
	.byte	0xe
	.4byte	.LASF69
	.byte	0x2
	.byte	0xe
	.4byte	.LASF70
	.byte	0x3
	.byte	0xe
	.4byte	.LASF71
	.byte	0x4
	.byte	0xe
	.4byte	.LASF72
	.byte	0x5
	.byte	0
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x7
	.byte	0x2a
	.byte	0xe
	.4byte	0x3e7
	.byte	0xe
	.4byte	.LASF73
	.byte	0
	.byte	0xe
	.4byte	.LASF74
	.byte	0x1
	.byte	0
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x7
	.byte	0x30
	.byte	0xe
	.4byte	0x402
	.byte	0xe
	.4byte	.LASF75
	.byte	0
	.byte	0xe
	.4byte	.LASF76
	.byte	0x1
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF77
	.byte	0xd
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x8
	.byte	0x35
	.byte	0xe
	.4byte	0x43c
	.byte	0xe
	.4byte	.LASF78
	.byte	0
	.byte	0xe
	.4byte	.LASF79
	.byte	0x1
	.byte	0xe
	.4byte	.LASF80
	.byte	0x2
	.byte	0xe
	.4byte	.LASF81
	.byte	0x3
	.byte	0xe
	.4byte	.LASF82
	.byte	0x4
	.byte	0xe
	.4byte	.LASF83
	.byte	0x5
	.byte	0
	.byte	0x5
	.byte	0x4
	.4byte	0xb5
	.byte	0x10
	.4byte	.LASF87
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x9
	.byte	0xe2
	.byte	0xe
	.4byte	0x467
	.byte	0xe
	.4byte	.LASF84
	.byte	0
	.byte	0xe
	.4byte	.LASF85
	.byte	0x1
	.byte	0xe
	.4byte	.LASF86
	.byte	0x2
	.byte	0
	.byte	0x11
	.4byte	.LASF88
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x9
	.2byte	0x14b
	.byte	0xe
	.4byte	0x493
	.byte	0xe
	.4byte	.LASF89
	.byte	0
	.byte	0xe
	.4byte	.LASF90
	.byte	0x1
	.byte	0xe
	.4byte	.LASF91
	.byte	0x2
	.byte	0xe
	.4byte	.LASF92
	.byte	0x3
	.byte	0
	.byte	0x12
	.4byte	.LASF94
	.byte	0xa
	.byte	0x9
	.2byte	0x154
	.byte	0x8
	.4byte	0x4da
	.byte	0xb
	.4byte	.LASF95
	.byte	0x9
	.2byte	0x156
	.byte	0x9
	.4byte	0x402
	.byte	0
	.byte	0xb
	.4byte	.LASF96
	.byte	0x9
	.2byte	0x157
	.byte	0x9
	.4byte	0x5d
	.byte	0x1
	.byte	0xb
	.4byte	.LASF97
	.byte	0x9
	.2byte	0x158
	.byte	0x9
	.4byte	0x402
	.byte	0x5
	.byte	0xb
	.4byte	.LASF98
	.byte	0x9
	.2byte	0x159
	.byte	0xb
	.4byte	0x7d
	.byte	0x6
	.byte	0
	.byte	0x12
	.4byte	.LASF99
	.byte	0x19
	.byte	0x9
	.2byte	0x15e
	.byte	0x8
	.4byte	0x521
	.byte	0xb
	.4byte	.LASF97
	.byte	0x9
	.2byte	0x160
	.byte	0x9
	.4byte	0x402
	.byte	0
	.byte	0x13
	.string	"reg"
	.byte	0x9
	.2byte	0x161
	.byte	0xe
	.4byte	0x8f
	.byte	0x1
	.byte	0xb
	.4byte	.LASF100
	.byte	0x9
	.2byte	0x162
	.byte	0x16
	.4byte	0x493
	.byte	0x5
	.byte	0xb
	.4byte	.LASF101
	.byte	0x9
	.2byte	0x163
	.byte	0x16
	.4byte	0x493
	.byte	0xf
	.byte	0
	.byte	0x12
	.4byte	.LASF102
	.byte	0xe
	.byte	0x9
	.2byte	0x168
	.byte	0x8
	.4byte	0x576
	.byte	0xb
	.4byte	.LASF95
	.byte	0x9
	.2byte	0x16a
	.byte	0x9
	.4byte	0x402
	.byte	0
	.byte	0xb
	.4byte	.LASF97
	.byte	0x9
	.2byte	0x16b
	.byte	0x9
	.4byte	0x402
	.byte	0x1
	.byte	0xb
	.4byte	.LASF103
	.byte	0x9
	.2byte	0x16c
	.byte	0xb
	.4byte	0x7d
	.byte	0x2
	.byte	0xb
	.4byte	.LASF98
	.byte	0x9
	.2byte	0x16d
	.byte	0xb
	.4byte	0x7d
	.byte	0x6
	.byte	0x13
	.string	"reg"
	.byte	0x9
	.2byte	0x16e
	.byte	0xe
	.4byte	0x8f
	.byte	0xa
	.byte	0
	.byte	0x12
	.4byte	.LASF104
	.byte	0x5
	.byte	0x9
	.2byte	0x173
	.byte	0x8
	.4byte	0x5a1
	.byte	0xb
	.4byte	.LASF97
	.byte	0x9
	.2byte	0x175
	.byte	0x9
	.4byte	0x402
	.byte	0
	.byte	0x13
	.string	"reg"
	.byte	0x9
	.2byte	0x176
	.byte	0xe
	.4byte	0x8f
	.byte	0x1
	.byte	0
	.byte	0x14
	.4byte	.LASF105
	.byte	0x9
	.2byte	0x17a
	.byte	0x1f
	.4byte	0x4da
	.byte	0x14
	.4byte	.LASF106
	.byte	0x9
	.2byte	0x17b
	.byte	0x1f
	.4byte	0x521
	.byte	0x14
	.4byte	.LASF107
	.byte	0x9
	.2byte	0x17c
	.byte	0x1f
	.4byte	0x521
	.byte	0x14
	.4byte	.LASF108
	.byte	0x9
	.2byte	0x17d
	.byte	0x20
	.4byte	0x576
	.byte	0x15
	.4byte	0x5a1
	.byte	0x1
	.byte	0x15
	.byte	0x2e
	.byte	0x5
	.byte	0x3
	.4byte	csi2_dphy_board
	.byte	0x15
	.4byte	0x5ae
	.byte	0x1
	.byte	0x25
	.byte	0x2e
	.byte	0x5
	.byte	0x3
	.4byte	csi2_host0_board
	.byte	0x15
	.4byte	0x5bb
	.byte	0x1
	.byte	0x2c
	.byte	0x2e
	.byte	0x5
	.byte	0x3
	.4byte	csi2_host1_board
	.byte	0x15
	.4byte	0x5c8
	.byte	0x1
	.byte	0x33
	.byte	0x2f
	.byte	0x5
	.byte	0x3
	.4byte	vicap_board
	.byte	0x16
	.4byte	.LASF118
	.byte	0x1
	.byte	0x76
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.4byte	0x724
	.byte	0x17
	.4byte	.LASF109
	.byte	0x1
	.byte	0x76
	.byte	0x20
	.4byte	0x8f
	.4byte	.LLST6
	.byte	0x17
	.4byte	.LASF110
	.byte	0x1
	.byte	0x76
	.byte	0x30
	.4byte	0x5d
	.4byte	.LLST7
	.byte	0x18
	.4byte	.LASF111
	.byte	0x1
	.byte	0x78
	.byte	0x16
	.4byte	0x43c
	.4byte	.LLST8
	.byte	0x18
	.4byte	.LASF112
	.byte	0x1
	.byte	0x79
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST9
	.byte	0x18
	.4byte	.LASF113
	.byte	0x1
	.byte	0x7a
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST10
	.byte	0x18
	.4byte	.LASF114
	.byte	0x1
	.byte	0x7b
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST11
	.byte	0x18
	.4byte	.LASF115
	.byte	0x1
	.byte	0x7c
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST12
	.byte	0x18
	.4byte	.LASF116
	.byte	0x1
	.byte	0x7d
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST13
	.byte	0x18
	.4byte	.LASF117
	.byte	0x1
	.byte	0x7e
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST14
	.byte	0x19
	.4byte	.LVL18
	.4byte	0x7eb
	.4byte	0x6dc
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x6
	.byte	0x78
	.byte	0
	.byte	0x49
	.byte	0x25
	.byte	0x31
	.byte	0x1a
	.byte	0
	.byte	0x19
	.4byte	.LVL19
	.4byte	0x7f7
	.4byte	0x701
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x6
	.byte	0x78
	.byte	0
	.byte	0x4a
	.byte	0x25
	.byte	0x31
	.byte	0x1a
	.byte	0
	.byte	0x1b
	.4byte	.LVL21
	.4byte	0x803
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.byte	0x78
	.byte	0
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF119
	.byte	0x1
	.byte	0x58
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0x7c0
	.byte	0x17
	.4byte	.LASF109
	.byte	0x1
	.byte	0x58
	.byte	0x21
	.4byte	0x8f
	.4byte	.LLST1
	.byte	0x17
	.4byte	.LASF120
	.byte	0x1
	.byte	0x58
	.byte	0x31
	.4byte	0x5d
	.4byte	.LLST2
	.byte	0x18
	.4byte	.LASF111
	.byte	0x1
	.byte	0x5a
	.byte	0x16
	.4byte	0x43c
	.4byte	.LLST3
	.byte	0x18
	.4byte	.LASF112
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST4
	.byte	0x18
	.4byte	.LASF113
	.byte	0x1
	.byte	0x5c
	.byte	0x9
	.4byte	0x5d
	.4byte	.LLST5
	.byte	0x1b
	.4byte	.LVL8
	.4byte	0x7f7
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0xe
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x35
	.byte	0x25
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x22
	.byte	0x6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0xa
	.byte	0x31
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x4f
	.byte	0x1a
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x24
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF121
	.byte	0x1
	.byte	0x3f
	.byte	0xd
	.4byte	0x77
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x7eb
	.byte	0x17
	.4byte	.LASF122
	.byte	0x1
	.byte	0x3f
	.byte	0x22
	.4byte	0x5d
	.4byte	.LLST0
	.byte	0
	.byte	0x1c
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0x7
	.byte	0x92
	.byte	0xc
	.byte	0x1c
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x7
	.byte	0x91
	.byte	0xc
	.byte	0x1d
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0x6
	.2byte	0x4ae
	.byte	0xc
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x5
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
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
	.byte	0x13
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
	.byte	0x14
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
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
	.byte	0x1a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
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
	.byte	0x1d
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
.LLST6:
	.4byte	.LVL11
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LVL24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL25
	.4byte	.LFE53
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL11
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL20
	.4byte	.LVL24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x35
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL15
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL17
	.4byte	.LVL24
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL25
	.4byte	.LFE53
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL11
	.4byte	.LVL13
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0xc
	.byte	0x7b
	.byte	0
	.byte	0x40
	.byte	0x45
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0xc
	.byte	0x78
	.byte	0
	.byte	0x40
	.byte	0x45
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0xd
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x45
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0xc
	.byte	0x7b
	.byte	0
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0xc
	.byte	0x78
	.byte	0
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0xd
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0x1a
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL11
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL16
	.2byte	0xe
	.byte	0x7b
	.byte	0
	.byte	0xc
	.4byte	0x79ffffff
	.byte	0x1a
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL20
	.2byte	0xe
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x79ffffff
	.byte	0x1a
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0xf
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0xc
	.4byte	0x79ffffff
	.byte	0x1a
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE53
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL5
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL6
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL8-1
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE52
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE52
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x35
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL9
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x35
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE52
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x5
	.byte	0x7a
	.byte	0
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LFE52
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x4f
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
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
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF127:
	.string	"board/common/board_cam.c"
.LASF88:
	.string	"rdbk_index"
.LASF80:
	.string	"PWR_CTRL_PWR_EN"
.LASF109:
	.string	"gpio_index"
.LASF52:
	.string	"GPIO_REG_GROUP2_L"
.LASF126:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF56:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF103:
	.string	"subdev_name"
.LASF78:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF92:
	.string	"RK_ISP_BUF_RDBK_MAX"
.LASF43:
	.string	"STORE_ST_L"
.LASF68:
	.string	"GRF_PUL_INFO"
.LASF87:
	.string	"color_component"
.LASF85:
	.string	"ISP_COLOR_CBCR"
.LASF93:
	.string	"GPIO_REG"
.LASF116:
	.string	"gpio_default_level"
.LASF3:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF48:
	.string	"GPIO_VIRTUAL_EN"
.LASF13:
	.string	"SWPORT_DR_H"
.LASF7:
	.string	"long long unsigned int"
.LASF12:
	.string	"SWPORT_DR_L"
.LASF113:
	.string	"gpio_pin"
.LASF41:
	.string	"VER_ID"
.LASF37:
	.string	"PORT_EOI_H"
.LASF38:
	.string	"RESERVED0068"
.LASF2:
	.string	"long int"
.LASF36:
	.string	"PORT_EOI_L"
.LASF124:
	.string	"HAL_GPIO_SetPinLevel"
.LASF51:
	.string	"GPIO_REG_GROUP1_H"
.LASF108:
	.string	"vicap_board"
.LASF122:
	.string	"pwm_channel"
.LASF50:
	.string	"GPIO_REG_GROUP1_L"
.LASF97:
	.string	"enable"
.LASF70:
	.string	"GRF_SRT_INFO"
.LASF60:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF128:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF21:
	.string	"INT_TYPE_H"
.LASF20:
	.string	"INT_TYPE_L"
.LASF111:
	.string	"pGPIO"
.LASF8:
	.string	"unsigned int"
.LASF81:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF106:
	.string	"csi2_host0_board"
.LASF19:
	.string	"INT_MASK_H"
.LASF74:
	.string	"GPIO_HIGH"
.LASF18:
	.string	"INT_MASK_L"
.LASF89:
	.string	"RK_ISP_BUF_RDBK_L"
.LASF90:
	.string	"RK_ISP_BUF_RDBK_M"
.LASF91:
	.string	"RK_ISP_BUF_RDBK_S"
.LASF119:
	.string	"cam_set_gpio_level"
.LASF39:
	.string	"EXT_PORT"
.LASF67:
	.string	"GRF_MUX_INFO"
.LASF65:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF33:
	.string	"RESERVED0054"
.LASF58:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF82:
	.string	"PWR_CTRL_VOLT_ST"
.LASF35:
	.string	"RESERVED005C"
.LASF84:
	.string	"ISP_COLOR_Y"
.LASF102:
	.string	"csi2_board_desc"
.LASF72:
	.string	"GRF_INFO_NUM"
.LASF66:
	.string	"PM_RUNTIME_TYPE_END"
.LASF23:
	.string	"INT_POLARITY_H"
.LASF42:
	.string	"RESERVED007C"
.LASF121:
	.string	"cam_get_pwm_name"
.LASF100:
	.string	"csi2_dphy1"
.LASF101:
	.string	"csi2_dphy2"
.LASF95:
	.string	"csi_host_idx"
.LASF94:
	.string	"dphy_desc"
.LASF27:
	.string	"DEBOUNCE_H"
.LASF47:
	.string	"GPIO_REG_GROUP_H"
.LASF46:
	.string	"GPIO_REG_GROUP_L"
.LASF26:
	.string	"DEBOUNCE_L"
.LASF29:
	.string	"DBCLK_DIV_EN_H"
.LASF30:
	.string	"DBCLK_DIV_CON"
.LASF55:
	.string	"GPIO_REG_GROUP3_H"
.LASF117:
	.string	"pin_config_mux"
.LASF73:
	.string	"GPIO_LOW"
.LASF28:
	.string	"DBCLK_DIV_EN_L"
.LASF110:
	.string	"gpio_func"
.LASF22:
	.string	"INT_POLARITY_L"
.LASF59:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF45:
	.string	"RESERVED0088"
.LASF49:
	.string	"RESERVED010C"
.LASF25:
	.string	"INT_BOTHEDGE_H"
.LASF75:
	.string	"GPIO_IN"
.LASF77:
	.string	"_Bool"
.LASF24:
	.string	"INT_BOTHEDGE_L"
.LASF114:
	.string	"gpio_bank"
.LASF1:
	.string	"short int"
.LASF115:
	.string	"gpio_direction"
.LASF71:
	.string	"GRF_SMT_INFO"
.LASF79:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF112:
	.string	"gpio_group"
.LASF40:
	.string	"RESERVED0074"
.LASF32:
	.string	"INT_STATUS"
.LASF125:
	.string	"HAL_PINCTRL_SetIOMUX"
.LASF31:
	.string	"RESERVED004C"
.LASF83:
	.string	"PWR_CTRL_MAX"
.LASF69:
	.string	"GRF_DRV_INFO"
.LASF11:
	.string	"uint32_t"
.LASF6:
	.string	"long unsigned int"
.LASF9:
	.string	"char"
.LASF62:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF105:
	.string	"csi2_dphy_board"
.LASF10:
	.string	"__uint32_t"
.LASF76:
	.string	"GPIO_OUT"
.LASF17:
	.string	"INT_EN_H"
.LASF16:
	.string	"INT_EN_L"
.LASF5:
	.string	"short unsigned int"
.LASF4:
	.string	"unsigned char"
.LASF104:
	.string	"vicap_board_desc"
.LASF44:
	.string	"STORE_ST_H"
.LASF86:
	.string	"ISP_COLOR_MAX"
.LASF107:
	.string	"csi2_host1_board"
.LASF61:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF54:
	.string	"GPIO_REG_GROUP3_L"
.LASF120:
	.string	"gpio_level"
.LASF53:
	.string	"GPIO_REG_GROUP2_H"
.LASF64:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF99:
	.string	"dphy_board_desc"
.LASF15:
	.string	"SWPORT_DDR_H"
.LASF63:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF14:
	.string	"SWPORT_DDR_L"
.LASF123:
	.string	"HAL_GPIO_SetPinDirection"
.LASF34:
	.string	"INT_RAWSTATUS"
.LASF98:
	.string	"isp_subdev_name"
.LASF118:
	.string	"cam_cfg_gpio_func"
.LASF96:
	.string	"data_lanes"
.LASF57:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
