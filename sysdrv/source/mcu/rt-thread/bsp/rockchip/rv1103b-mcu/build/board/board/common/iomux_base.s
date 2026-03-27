	.file	"iomux_base.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.i2c4_m0_iomux_config,"ax",@progbits
	.align	1
	.weak	i2c4_m0_iomux_config
	.type	i2c4_m0_iomux_config, @function
i2c4_m0_iomux_config:
.LFB18:
	.file 1 "board/common/iomux_base.c"
	.loc 1 179 1
	.cfi_startproc
	.loc 1 181 5
	li	a2,-2147483648
	.loc 1 179 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 181 5
	addi	a2,a2,4
	li	a1,768
	li	a0,2
	.loc 1 179 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 181 5
	call	HAL_PINCTRL_SetIOMUX
.LVL0:
	.loc 1 186 5 is_stmt 1
	.loc 1 190 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 186 5
	li	a2,1208221696
	.loc 1 190 1
	.loc 1 186 5
	li	a1,768
	li	a0,2
	.loc 1 190 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 186 5
	tail	HAL_PINCTRL_SetParam
.LVL1:
	.cfi_endproc
.LFE18:
	.size	i2c4_m0_iomux_config, .-i2c4_m0_iomux_config
	.section	.text.i2c4_m1_iomux_config,"ax",@progbits
	.align	1
	.weak	i2c4_m1_iomux_config
	.type	i2c4_m1_iomux_config, @function
i2c4_m1_iomux_config:
.LFB19:
	.loc 1 196 1 is_stmt 1
	.cfi_startproc
	.loc 1 198 5
	li	a2,-2147483648
	.loc 1 196 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 198 5
	addi	a2,a2,2
	li	a1,98304
	li	a0,1
	.loc 1 196 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 198 5
	call	HAL_PINCTRL_SetIOMUX
.LVL2:
	.loc 1 203 5 is_stmt 1
	.loc 1 207 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 203 5
	li	a2,1208221696
	.loc 1 207 1
	.loc 1 203 5
	li	a1,98304
	li	a0,1
	.loc 1 207 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 203 5
	tail	HAL_PINCTRL_SetParam
.LVL3:
	.cfi_endproc
.LFE19:
	.size	i2c4_m1_iomux_config, .-i2c4_m1_iomux_config
	.section	.text.rt_hw_iomux_config,"ax",@progbits
	.align	1
	.weak	rt_hw_iomux_config
	.type	rt_hw_iomux_config, @function
rt_hw_iomux_config:
.LFB20:
	.loc 1 228 1 is_stmt 1
	.cfi_startproc
	.loc 1 234 1
	ret
	.cfi_endproc
.LFE20:
	.size	rt_hw_iomux_config, .-rt_hw_iomux_config
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3d9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF87
	.byte	0xc
	.4byte	.LASF88
	.4byte	.LASF89
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
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x2
	.byte	0xc5
	.byte	0xe
	.4byte	0x99
	.byte	0x5
	.4byte	.LASF10
	.byte	0
	.byte	0x5
	.4byte	.LASF11
	.byte	0x1
	.byte	0x5
	.4byte	.LASF12
	.byte	0x2
	.byte	0x5
	.4byte	.LASF13
	.byte	0x3
	.byte	0
	.byte	0x6
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x3
	.2byte	0x3c4
	.byte	0xe
	.4byte	0x1ed
	.byte	0x7
	.4byte	.LASF14
	.4byte	0x80000000
	.byte	0x7
	.4byte	.LASF15
	.4byte	0x80000001
	.byte	0x7
	.4byte	.LASF16
	.4byte	0x80000002
	.byte	0x7
	.4byte	.LASF17
	.4byte	0x80000003
	.byte	0x7
	.4byte	.LASF18
	.4byte	0x80000004
	.byte	0x7
	.4byte	.LASF19
	.4byte	0x80000005
	.byte	0x7
	.4byte	.LASF20
	.4byte	0x80000006
	.byte	0x7
	.4byte	.LASF21
	.4byte	0x80000007
	.byte	0x7
	.4byte	.LASF22
	.4byte	0x80000008
	.byte	0x7
	.4byte	.LASF23
	.4byte	0x80000009
	.byte	0x7
	.4byte	.LASF24
	.4byte	0x8000000a
	.byte	0x7
	.4byte	.LASF25
	.4byte	0x8000000b
	.byte	0x7
	.4byte	.LASF26
	.4byte	0x8000000c
	.byte	0x7
	.4byte	.LASF27
	.4byte	0x8000000d
	.byte	0x7
	.4byte	.LASF28
	.4byte	0x8000000e
	.byte	0x7
	.4byte	.LASF29
	.4byte	0x8000000f
	.byte	0x7
	.4byte	.LASF30
	.4byte	0x80000000
	.byte	0x7
	.4byte	.LASF31
	.4byte	0x40000000
	.byte	0x7
	.4byte	.LASF32
	.4byte	0x40000010
	.byte	0x7
	.4byte	.LASF33
	.4byte	0x40000020
	.byte	0x7
	.4byte	.LASF34
	.4byte	0x40000030
	.byte	0x7
	.4byte	.LASF35
	.4byte	0x40000000
	.byte	0x7
	.4byte	.LASF36
	.4byte	0x20000100
	.byte	0x7
	.4byte	.LASF37
	.4byte	0x20000300
	.byte	0x7
	.4byte	.LASF38
	.4byte	0x20000700
	.byte	0x7
	.4byte	.LASF39
	.4byte	0x20000f00
	.byte	0x7
	.4byte	.LASF40
	.4byte	0x20001f00
	.byte	0x7
	.4byte	.LASF41
	.4byte	0x20003f00
	.byte	0x7
	.4byte	.LASF42
	.4byte	0x20000700
	.byte	0x7
	.4byte	.LASF43
	.4byte	0x10000000
	.byte	0x7
	.4byte	.LASF44
	.4byte	0x10030000
	.byte	0x7
	.4byte	.LASF45
	.4byte	0x10030000
	.byte	0x7
	.4byte	.LASF46
	.4byte	0x8000000
	.byte	0x7
	.4byte	.LASF47
	.4byte	0x8040000
	.byte	0x7
	.4byte	.LASF48
	.4byte	0x8000000
	.byte	0x7
	.4byte	.LASF49
	.4byte	0xffffffff
	.byte	0
	.byte	0x6
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x3
	.2byte	0x448
	.byte	0xe
	.4byte	0x2f5
	.byte	0x5
	.4byte	.LASF50
	.byte	0x1
	.byte	0x5
	.4byte	.LASF51
	.byte	0x2
	.byte	0x5
	.4byte	.LASF52
	.byte	0x4
	.byte	0x5
	.4byte	.LASF53
	.byte	0x8
	.byte	0x5
	.4byte	.LASF54
	.byte	0x10
	.byte	0x5
	.4byte	.LASF55
	.byte	0x20
	.byte	0x5
	.4byte	.LASF56
	.byte	0x40
	.byte	0x5
	.4byte	.LASF57
	.byte	0x80
	.byte	0x8
	.4byte	.LASF58
	.2byte	0x100
	.byte	0x8
	.4byte	.LASF59
	.2byte	0x200
	.byte	0x8
	.4byte	.LASF60
	.2byte	0x400
	.byte	0x8
	.4byte	.LASF61
	.2byte	0x800
	.byte	0x8
	.4byte	.LASF62
	.2byte	0x1000
	.byte	0x8
	.4byte	.LASF63
	.2byte	0x2000
	.byte	0x8
	.4byte	.LASF64
	.2byte	0x4000
	.byte	0x8
	.4byte	.LASF65
	.2byte	0x8000
	.byte	0x7
	.4byte	.LASF66
	.4byte	0x10000
	.byte	0x7
	.4byte	.LASF67
	.4byte	0x20000
	.byte	0x7
	.4byte	.LASF68
	.4byte	0x40000
	.byte	0x7
	.4byte	.LASF69
	.4byte	0x80000
	.byte	0x7
	.4byte	.LASF70
	.4byte	0x100000
	.byte	0x7
	.4byte	.LASF71
	.4byte	0x200000
	.byte	0x7
	.4byte	.LASF72
	.4byte	0x400000
	.byte	0x7
	.4byte	.LASF73
	.4byte	0x800000
	.byte	0x7
	.4byte	.LASF74
	.4byte	0x1000000
	.byte	0x7
	.4byte	.LASF75
	.4byte	0x2000000
	.byte	0x7
	.4byte	.LASF76
	.4byte	0x4000000
	.byte	0x7
	.4byte	.LASF77
	.4byte	0x8000000
	.byte	0x7
	.4byte	.LASF78
	.4byte	0x10000000
	.byte	0x7
	.4byte	.LASF79
	.4byte	0x20000000
	.byte	0x7
	.4byte	.LASF80
	.4byte	0x40000000
	.byte	0x7
	.4byte	.LASF81
	.4byte	0x80000000
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF82
	.byte	0x9
	.4byte	.LASF90
	.byte	0x1
	.byte	0xe3
	.byte	0x34
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0xa
	.4byte	.LASF83
	.byte	0x1
	.byte	0xc3
	.byte	0x34
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x368
	.byte	0xb
	.4byte	.LVL2
	.4byte	0x3c2
	.4byte	0x348
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0xc
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x48
	.byte	0x3c
	.byte	0x24
	.byte	0xc
	.byte	0x1
	.byte	0x5c
	.byte	0x6
	.byte	0x11
	.byte	0x82,0x80,0x80,0x80,0x78
	.byte	0
	.byte	0xd
	.4byte	.LVL3
	.4byte	0x3cf
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0xc
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x48
	.byte	0x3c
	.byte	0x24
	.byte	0xc
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xc
	.4byte	0x48040000
	.byte	0
	.byte	0
	.byte	0xa
	.4byte	.LASF84
	.byte	0x1
	.byte	0xb2
	.byte	0x34
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x3c2
	.byte	0xb
	.4byte	.LVL0
	.4byte	0x3c2
	.4byte	0x3a2
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0xc
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x300
	.byte	0xc
	.byte	0x1
	.byte	0x5c
	.byte	0x6
	.byte	0x11
	.byte	0x84,0x80,0x80,0x80,0x78
	.byte	0
	.byte	0xd
	.4byte	.LVL1
	.4byte	0x3cf
	.byte	0xc
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x32
	.byte	0xc
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x300
	.byte	0xc
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xc
	.4byte	0x48040000
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF85
	.4byte	.LASF85
	.byte	0x3
	.2byte	0x4ae
	.byte	0xc
	.byte	0xe
	.4byte	.LASF86
	.4byte	.LASF86
	.byte	0x3
	.2byte	0x4ad
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
	.byte	0x5
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xc
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF44:
	.string	"PIN_CONFIG_SRT_FAST"
.LASF86:
	.string	"HAL_PINCTRL_SetParam"
.LASF43:
	.string	"PIN_CONFIG_SRT_SLOW"
.LASF33:
	.string	"PIN_CONFIG_PUL_DOWN"
.LASF42:
	.string	"PIN_CONFIG_DRV_LEVEL_DEFAULT"
.LASF66:
	.string	"GPIO_PIN_C0"
.LASF1:
	.string	"short int"
.LASF38:
	.string	"PIN_CONFIG_DRV_LEVEL2"
.LASF69:
	.string	"GPIO_PIN_C3"
.LASF70:
	.string	"GPIO_PIN_C4"
.LASF71:
	.string	"GPIO_PIN_C5"
.LASF40:
	.string	"PIN_CONFIG_DRV_LEVEL4"
.LASF73:
	.string	"GPIO_PIN_C7"
.LASF41:
	.string	"PIN_CONFIG_DRV_LEVEL5"
.LASF15:
	.string	"PIN_CONFIG_MUX_FUNC1"
.LASF16:
	.string	"PIN_CONFIG_MUX_FUNC2"
.LASF17:
	.string	"PIN_CONFIG_MUX_FUNC3"
.LASF18:
	.string	"PIN_CONFIG_MUX_FUNC4"
.LASF19:
	.string	"PIN_CONFIG_MUX_FUNC5"
.LASF20:
	.string	"PIN_CONFIG_MUX_FUNC6"
.LASF21:
	.string	"PIN_CONFIG_MUX_FUNC7"
.LASF22:
	.string	"PIN_CONFIG_MUX_FUNC8"
.LASF23:
	.string	"PIN_CONFIG_MUX_FUNC9"
.LASF65:
	.string	"GPIO_PIN_B7"
.LASF13:
	.string	"GPIO_BANK_NUM"
.LASF34:
	.string	"PIN_CONFIG_PUL_KEEP"
.LASF47:
	.string	"PIN_CONFIG_SMT_ENABLE"
.LASF87:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF90:
	.string	"rt_hw_iomux_config"
.LASF88:
	.string	"board/common/iomux_base.c"
.LASF3:
	.string	"long long int"
.LASF74:
	.string	"GPIO_PIN_D0"
.LASF75:
	.string	"GPIO_PIN_D1"
.LASF76:
	.string	"GPIO_PIN_D2"
.LASF77:
	.string	"GPIO_PIN_D3"
.LASF78:
	.string	"GPIO_PIN_D4"
.LASF79:
	.string	"GPIO_PIN_D5"
.LASF80:
	.string	"GPIO_PIN_D6"
.LASF81:
	.string	"GPIO_PIN_D7"
.LASF48:
	.string	"PIN_CONFIG_SMT_DEFAULT"
.LASF31:
	.string	"PIN_CONFIG_PUL_NORMAL"
.LASF4:
	.string	"unsigned char"
.LASF32:
	.string	"PIN_CONFIG_PUL_UP"
.LASF89:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF7:
	.string	"long long unsigned int"
.LASF8:
	.string	"unsigned int"
.LASF50:
	.string	"GPIO_PIN_A0"
.LASF51:
	.string	"GPIO_PIN_A1"
.LASF52:
	.string	"GPIO_PIN_A2"
.LASF45:
	.string	"PIN_CONFIG_SRT_DEFAULT"
.LASF54:
	.string	"GPIO_PIN_A4"
.LASF55:
	.string	"GPIO_PIN_A5"
.LASF56:
	.string	"GPIO_PIN_A6"
.LASF46:
	.string	"PIN_CONFIG_SMT_DISABLE"
.LASF10:
	.string	"GPIO_BANK0"
.LASF11:
	.string	"GPIO_BANK1"
.LASF12:
	.string	"GPIO_BANK2"
.LASF35:
	.string	"PIN_CONFIG_PUL_DEFAULT"
.LASF9:
	.string	"char"
.LASF53:
	.string	"GPIO_PIN_A3"
.LASF2:
	.string	"long int"
.LASF5:
	.string	"short unsigned int"
.LASF57:
	.string	"GPIO_PIN_A7"
.LASF82:
	.string	"_Bool"
.LASF67:
	.string	"GPIO_PIN_C1"
.LASF68:
	.string	"GPIO_PIN_C2"
.LASF72:
	.string	"GPIO_PIN_C6"
.LASF6:
	.string	"long unsigned int"
.LASF49:
	.string	"PIN_CONFIG_MAX"
.LASF83:
	.string	"i2c4_m1_iomux_config"
.LASF58:
	.string	"GPIO_PIN_B0"
.LASF59:
	.string	"GPIO_PIN_B1"
.LASF60:
	.string	"GPIO_PIN_B2"
.LASF61:
	.string	"GPIO_PIN_B3"
.LASF62:
	.string	"GPIO_PIN_B4"
.LASF63:
	.string	"GPIO_PIN_B5"
.LASF64:
	.string	"GPIO_PIN_B6"
.LASF30:
	.string	"PIN_CONFIG_MUX_DEFAULT"
.LASF36:
	.string	"PIN_CONFIG_DRV_LEVEL0"
.LASF37:
	.string	"PIN_CONFIG_DRV_LEVEL1"
.LASF85:
	.string	"HAL_PINCTRL_SetIOMUX"
.LASF39:
	.string	"PIN_CONFIG_DRV_LEVEL3"
.LASF24:
	.string	"PIN_CONFIG_MUX_FUNC10"
.LASF25:
	.string	"PIN_CONFIG_MUX_FUNC11"
.LASF26:
	.string	"PIN_CONFIG_MUX_FUNC12"
.LASF27:
	.string	"PIN_CONFIG_MUX_FUNC13"
.LASF28:
	.string	"PIN_CONFIG_MUX_FUNC14"
.LASF29:
	.string	"PIN_CONFIG_MUX_FUNC15"
.LASF14:
	.string	"PIN_CONFIG_MUX_FUNC0"
.LASF84:
	.string	"i2c4_m0_iomux_config"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
