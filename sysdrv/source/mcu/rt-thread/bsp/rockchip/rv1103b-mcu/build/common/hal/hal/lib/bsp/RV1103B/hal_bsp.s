	.file	"hal_bsp.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.BSP_Init,"ax",@progbits
	.align	1
	.globl	BSP_Init
	.type	BSP_Init, @function
BSP_Init:
.LFB18:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/bsp/RV1103B/hal_bsp.c"
	.loc 1 203 1
	.cfi_startproc
	.loc 1 204 1
	ret
	.cfi_endproc
.LFE18:
	.size	BSP_Init, .-BSP_Init
	.globl	g_pwm2Dev
	.globl	g_pwm1Dev
	.globl	g_pwm0Dev
	.globl	g_i2c4Dev
	.globl	g_i2c3Dev
	.globl	g_i2c2Dev
	.globl	g_i2c1Dev
	.globl	g_i2c0Dev
	.globl	g_cruDev
	.section	.data.cruBanks,"aw"
	.align	2
	.type	cruBanks, @object
	.size	cruBanks, 160
cruBanks:
	.word	536870912
	.word	768
	.word	2048
	.word	2560
	.word	536936448
	.word	768
	.word	2048
	.word	2560
	.word	537001984
	.word	768
	.word	2048
	.word	2560
	.word	537067520
	.word	768
	.word	2048
	.word	2560
	.word	537133056
	.word	768
	.word	2048
	.word	2560
	.word	537198592
	.word	768
	.word	2048
	.word	2560
	.word	537231360
	.word	768
	.word	2048
	.word	2560
	.word	537264128
	.word	768
	.word	2048
	.word	2560
	.word	537329664
	.word	768
	.word	2048
	.word	2560
	.word	537395200
	.word	768
	.word	2048
	.word	2560
	.section	.rodata.g_i2c0Dev,"a"
	.align	3
	.type	g_i2c0Dev, @object
	.size	g_i2c0Dev, 32
g_i2c0Dev:
	.word	542310400
	.zero	4
	.word	4
	.word	0
	.word	32781
	.word	32780
	.word	63
	.word	48
	.section	.rodata.g_i2c1Dev,"a"
	.align	3
	.type	g_i2c1Dev, @object
	.size	g_i2c1Dev, 32
g_i2c1Dev:
	.word	546373632
	.zero	4
	.word	5
	.word	0
	.word	39
	.word	38
	.word	64
	.word	49
	.section	.rodata.g_i2c2Dev,"a"
	.align	3
	.type	g_i2c2Dev, @object
	.size	g_i2c2Dev, 32
g_i2c2Dev:
	.word	546439168
	.zero	4
	.word	6
	.word	0
	.word	41
	.word	40
	.word	65
	.word	50
	.section	.rodata.g_i2c3Dev,"a"
	.align	3
	.type	g_i2c3Dev, @object
	.size	g_i2c3Dev, 32
g_i2c3Dev:
	.word	546504704
	.zero	4
	.word	7
	.word	0
	.word	43
	.word	42
	.word	66
	.word	51
	.section	.rodata.g_i2c4Dev,"a"
	.align	3
	.type	g_i2c4Dev, @object
	.size	g_i2c4Dev, 32
g_i2c4Dev:
	.word	546570240
	.zero	4
	.word	8
	.word	0
	.word	45
	.word	44
	.word	67
	.word	52
	.section	.rodata.g_pwm0Dev,"a"
	.align	3
	.type	g_pwm0Dev, @object
	.size	g_pwm0Dev, 56
g_pwm0Dev:
	.word	542441472
	.zero	4
	.word	0
	.word	17565474
	.word	28746
	.word	32800
	.word	87
	.word	88
	.word	89
	.word	90
	.zero	16
	.section	.rodata.g_pwm1Dev,"a"
	.align	3
	.type	g_pwm1Dev, @object
	.size	g_pwm1Dev, 56
g_pwm1Dev:
	.word	546766848
	.zero	4
	.word	0
	.word	17631010
	.word	28747
	.word	70
	.word	91
	.word	92
	.word	93
	.word	94
	.zero	16
	.section	.rodata.g_pwm2Dev,"a"
	.align	3
	.type	g_pwm2Dev, @object
	.size	g_pwm2Dev, 56
g_pwm2Dev:
	.word	546832384
	.zero	4
	.word	0
	.word	17696546
	.word	28748
	.word	76
	.word	95
	.word	96
	.word	97
	.word	98
	.zero	16
	.section	.srodata.g_cruDev,"a"
	.align	2
	.type	g_cruDev, @object
	.size	g_cruDev, 8
g_cruDev:
	.word	cruBanks
	.byte	10
	.zero	3
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/bsp/RV1103B/hal_bsp.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc93
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF263
	.byte	0xc
	.4byte	.LASF264
	.4byte	.LASF265
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x38
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
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x60
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x2c
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x54
	.byte	0x5
	.4byte	0x96
	.byte	0x6
	.4byte	0xa2
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x4
	.byte	0x2e
	.byte	0x1
	.4byte	0x235
	.byte	0x8
	.4byte	.LASF14
	.byte	0x11
	.byte	0x8
	.4byte	.LASF15
	.byte	0x20
	.byte	0x8
	.4byte	.LASF16
	.byte	0x21
	.byte	0x8
	.4byte	.LASF17
	.byte	0x22
	.byte	0x8
	.4byte	.LASF18
	.byte	0x23
	.byte	0x8
	.4byte	.LASF19
	.byte	0x24
	.byte	0x8
	.4byte	.LASF20
	.byte	0x25
	.byte	0x8
	.4byte	.LASF21
	.byte	0x29
	.byte	0x8
	.4byte	.LASF22
	.byte	0x34
	.byte	0x8
	.4byte	.LASF23
	.byte	0x39
	.byte	0x8
	.4byte	.LASF24
	.byte	0x3a
	.byte	0x8
	.4byte	.LASF25
	.byte	0x3b
	.byte	0x8
	.4byte	.LASF26
	.byte	0x3c
	.byte	0x8
	.4byte	.LASF27
	.byte	0x3f
	.byte	0x8
	.4byte	.LASF28
	.byte	0x40
	.byte	0x8
	.4byte	.LASF29
	.byte	0x41
	.byte	0x8
	.4byte	.LASF30
	.byte	0x42
	.byte	0x8
	.4byte	.LASF31
	.byte	0x43
	.byte	0x8
	.4byte	.LASF32
	.byte	0x45
	.byte	0x8
	.4byte	.LASF33
	.byte	0x46
	.byte	0x8
	.4byte	.LASF34
	.byte	0x47
	.byte	0x8
	.4byte	.LASF35
	.byte	0x4b
	.byte	0x8
	.4byte	.LASF36
	.byte	0x4c
	.byte	0x8
	.4byte	.LASF37
	.byte	0x4d
	.byte	0x8
	.4byte	.LASF38
	.byte	0x4e
	.byte	0x8
	.4byte	.LASF39
	.byte	0x4f
	.byte	0x8
	.4byte	.LASF40
	.byte	0x50
	.byte	0x8
	.4byte	.LASF41
	.byte	0x51
	.byte	0x8
	.4byte	.LASF42
	.byte	0x52
	.byte	0x8
	.4byte	.LASF43
	.byte	0x53
	.byte	0x8
	.4byte	.LASF44
	.byte	0x54
	.byte	0x8
	.4byte	.LASF45
	.byte	0x55
	.byte	0x8
	.4byte	.LASF46
	.byte	0x56
	.byte	0x8
	.4byte	.LASF47
	.byte	0x57
	.byte	0x8
	.4byte	.LASF48
	.byte	0x58
	.byte	0x8
	.4byte	.LASF49
	.byte	0x59
	.byte	0x8
	.4byte	.LASF50
	.byte	0x5a
	.byte	0x8
	.4byte	.LASF51
	.byte	0x5b
	.byte	0x8
	.4byte	.LASF52
	.byte	0x5c
	.byte	0x8
	.4byte	.LASF53
	.byte	0x5d
	.byte	0x8
	.4byte	.LASF54
	.byte	0x5e
	.byte	0x8
	.4byte	.LASF55
	.byte	0x5f
	.byte	0x8
	.4byte	.LASF56
	.byte	0x60
	.byte	0x8
	.4byte	.LASF57
	.byte	0x61
	.byte	0x8
	.4byte	.LASF58
	.byte	0x62
	.byte	0x8
	.4byte	.LASF59
	.byte	0x6a
	.byte	0x8
	.4byte	.LASF60
	.byte	0x6b
	.byte	0x8
	.4byte	.LASF61
	.byte	0x6c
	.byte	0x8
	.4byte	.LASF62
	.byte	0x6d
	.byte	0x8
	.4byte	.LASF63
	.byte	0x6e
	.byte	0x8
	.4byte	.LASF64
	.byte	0x6f
	.byte	0x8
	.4byte	.LASF65
	.byte	0x70
	.byte	0x8
	.4byte	.LASF66
	.byte	0x71
	.byte	0x8
	.4byte	.LASF67
	.byte	0x72
	.byte	0x8
	.4byte	.LASF68
	.byte	0x73
	.byte	0x8
	.4byte	.LASF69
	.byte	0x74
	.byte	0x8
	.4byte	.LASF70
	.byte	0x75
	.byte	0x8
	.4byte	.LASF71
	.byte	0x76
	.byte	0x8
	.4byte	.LASF72
	.byte	0x77
	.byte	0x8
	.4byte	.LASF73
	.byte	0x78
	.byte	0x8
	.4byte	.LASF74
	.byte	0x79
	.byte	0x8
	.4byte	.LASF75
	.byte	0x7c
	.byte	0x8
	.4byte	.LASF76
	.byte	0x80
	.byte	0
	.byte	0x3
	.4byte	.LASF77
	.byte	0x4
	.byte	0x6f
	.byte	0x3
	.4byte	0xac
	.byte	0x9
	.4byte	0x96
	.4byte	0x251
	.byte	0xa
	.4byte	0x7c
	.byte	0xe
	.byte	0
	.byte	0x9
	.4byte	0x96
	.4byte	0x261
	.byte	0xa
	.4byte	0x7c
	.byte	0x11
	.byte	0
	.byte	0x9
	.4byte	0x96
	.4byte	0x271
	.byte	0xa
	.4byte	0x7c
	.byte	0x37
	.byte	0
	.byte	0x9
	.4byte	0x96
	.4byte	0x281
	.byte	0xa
	.4byte	0x7c
	.byte	0x35
	.byte	0
	.byte	0xb
	.4byte	.LASF91
	.2byte	0x22c
	.byte	0x5
	.2byte	0x215
	.byte	0x8
	.4byte	0x384
	.byte	0xc
	.string	"CON"
	.byte	0x5
	.2byte	0x216
	.byte	0x17
	.4byte	0xa2
	.byte	0
	.byte	0xd
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x217
	.byte	0x17
	.4byte	0xa2
	.byte	0x4
	.byte	0xd
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x218
	.byte	0x17
	.4byte	0xa2
	.byte	0x8
	.byte	0xd
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x219
	.byte	0x17
	.4byte	0xa2
	.byte	0xc
	.byte	0xd
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x21a
	.byte	0x17
	.4byte	0xa2
	.byte	0x10
	.byte	0xd
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x21b
	.byte	0x17
	.4byte	0xa2
	.byte	0x14
	.byte	0xc
	.string	"IEN"
	.byte	0x5
	.2byte	0x21c
	.byte	0x17
	.4byte	0xa2
	.byte	0x18
	.byte	0xc
	.string	"IPD"
	.byte	0x5
	.2byte	0x21d
	.byte	0x17
	.4byte	0xa2
	.byte	0x1c
	.byte	0xd
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x21e
	.byte	0x1d
	.4byte	0xa7
	.byte	0x20
	.byte	0xd
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x21f
	.byte	0x17
	.4byte	0xa2
	.byte	0x24
	.byte	0xd
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x220
	.byte	0x13
	.4byte	0x271
	.byte	0x28
	.byte	0xe
	.4byte	.LASF86
	.byte	0x5
	.2byte	0x221
	.byte	0x17
	.4byte	0x394
	.2byte	0x100
	.byte	0xe
	.4byte	.LASF87
	.byte	0x5
	.2byte	0x222
	.byte	0x13
	.4byte	0x261
	.2byte	0x120
	.byte	0xe
	.4byte	.LASF88
	.byte	0x5
	.2byte	0x223
	.byte	0x1d
	.4byte	0x3ae
	.2byte	0x200
	.byte	0xf
	.string	"ST"
	.byte	0x5
	.2byte	0x224
	.byte	0x1d
	.4byte	0xa7
	.2byte	0x220
	.byte	0xe
	.4byte	.LASF89
	.byte	0x5
	.2byte	0x225
	.byte	0x17
	.4byte	0xa2
	.2byte	0x224
	.byte	0xe
	.4byte	.LASF90
	.byte	0x5
	.2byte	0x226
	.byte	0x17
	.4byte	0xa2
	.2byte	0x228
	.byte	0
	.byte	0x9
	.4byte	0xa2
	.4byte	0x394
	.byte	0xa
	.4byte	0x7c
	.byte	0x7
	.byte	0
	.byte	0x5
	.4byte	0x384
	.byte	0x9
	.4byte	0xa7
	.4byte	0x3a9
	.byte	0xa
	.4byte	0x7c
	.byte	0x7
	.byte	0
	.byte	0x6
	.4byte	0x399
	.byte	0x5
	.4byte	0x3a9
	.byte	0xb
	.4byte	.LASF92
	.2byte	0x210
	.byte	0x5
	.2byte	0x257
	.byte	0x8
	.4byte	0x5f8
	.byte	0xd
	.4byte	.LASF93
	.byte	0x5
	.2byte	0x258
	.byte	0x1d
	.4byte	0xa7
	.byte	0
	.byte	0xd
	.4byte	.LASF94
	.byte	0x5
	.2byte	0x259
	.byte	0x17
	.4byte	0xa2
	.byte	0x4
	.byte	0xd
	.4byte	.LASF95
	.byte	0x5
	.2byte	0x25a
	.byte	0x17
	.4byte	0xa2
	.byte	0x8
	.byte	0xd
	.4byte	.LASF96
	.byte	0x5
	.2byte	0x25b
	.byte	0x17
	.4byte	0xa2
	.byte	0xc
	.byte	0xd
	.4byte	.LASF97
	.byte	0x5
	.2byte	0x25c
	.byte	0x17
	.4byte	0xa2
	.byte	0x10
	.byte	0xd
	.4byte	.LASF98
	.byte	0x5
	.2byte	0x25d
	.byte	0x17
	.4byte	0xa2
	.byte	0x14
	.byte	0xd
	.4byte	.LASF99
	.byte	0x5
	.2byte	0x25e
	.byte	0x17
	.4byte	0xa2
	.byte	0x18
	.byte	0xc
	.string	"RPT"
	.byte	0x5
	.2byte	0x25f
	.byte	0x17
	.4byte	0xa2
	.byte	0x1c
	.byte	0xd
	.4byte	.LASF100
	.byte	0x5
	.2byte	0x260
	.byte	0x17
	.4byte	0xa2
	.byte	0x20
	.byte	0xc
	.string	"CNT"
	.byte	0x5
	.2byte	0x261
	.byte	0x1d
	.4byte	0xa7
	.byte	0x24
	.byte	0xd
	.4byte	.LASF101
	.byte	0x5
	.2byte	0x262
	.byte	0x17
	.4byte	0xa2
	.byte	0x28
	.byte	0xc
	.string	"HPC"
	.byte	0x5
	.2byte	0x263
	.byte	0x17
	.4byte	0xa2
	.byte	0x2c
	.byte	0xc
	.string	"LPC"
	.byte	0x5
	.2byte	0x264
	.byte	0x17
	.4byte	0xa2
	.byte	0x30
	.byte	0xd
	.4byte	.LASF102
	.byte	0x5
	.2byte	0x265
	.byte	0x13
	.4byte	0x241
	.byte	0x34
	.byte	0xd
	.4byte	.LASF103
	.byte	0x5
	.2byte	0x266
	.byte	0x17
	.4byte	0xa2
	.byte	0x70
	.byte	0xd
	.4byte	.LASF104
	.byte	0x5
	.2byte	0x267
	.byte	0x17
	.4byte	0xa2
	.byte	0x74
	.byte	0xd
	.4byte	.LASF105
	.byte	0x5
	.2byte	0x268
	.byte	0x13
	.4byte	0x251
	.byte	0x78
	.byte	0xd
	.4byte	.LASF106
	.byte	0x5
	.2byte	0x269
	.byte	0x17
	.4byte	0xa2
	.byte	0xc0
	.byte	0xd
	.4byte	.LASF107
	.byte	0x5
	.2byte	0x26a
	.byte	0x17
	.4byte	0xa2
	.byte	0xc4
	.byte	0xd
	.4byte	.LASF108
	.byte	0x5
	.2byte	0x26b
	.byte	0x13
	.4byte	0x5f8
	.byte	0xc8
	.byte	0xe
	.4byte	.LASF109
	.byte	0x5
	.2byte	0x26c
	.byte	0x17
	.4byte	0xa2
	.2byte	0x100
	.byte	0xe
	.4byte	.LASF110
	.byte	0x5
	.2byte	0x26d
	.byte	0x17
	.4byte	0xa2
	.2byte	0x104
	.byte	0xe
	.4byte	.LASF111
	.byte	0x5
	.2byte	0x26e
	.byte	0x17
	.4byte	0xa2
	.2byte	0x108
	.byte	0xe
	.4byte	.LASF112
	.byte	0x5
	.2byte	0x26f
	.byte	0x17
	.4byte	0xa2
	.2byte	0x10c
	.byte	0xe
	.4byte	.LASF113
	.byte	0x5
	.2byte	0x270
	.byte	0x17
	.4byte	0xa2
	.2byte	0x110
	.byte	0xe
	.4byte	.LASF114
	.byte	0x5
	.2byte	0x271
	.byte	0x17
	.4byte	0xa2
	.2byte	0x114
	.byte	0xe
	.4byte	.LASF115
	.byte	0x5
	.2byte	0x272
	.byte	0x17
	.4byte	0xa2
	.2byte	0x118
	.byte	0xe
	.4byte	.LASF116
	.byte	0x5
	.2byte	0x273
	.byte	0x17
	.4byte	0x618
	.2byte	0x11c
	.byte	0xe
	.4byte	.LASF117
	.byte	0x5
	.2byte	0x274
	.byte	0x1d
	.4byte	0xa7
	.2byte	0x15c
	.byte	0xe
	.4byte	.LASF118
	.byte	0x5
	.2byte	0x275
	.byte	0x13
	.4byte	0x61d
	.2byte	0x160
	.byte	0xe
	.4byte	.LASF119
	.byte	0x5
	.2byte	0x276
	.byte	0x17
	.4byte	0xa2
	.2byte	0x1c0
	.byte	0xe
	.4byte	.LASF120
	.byte	0x5
	.2byte	0x277
	.byte	0x17
	.4byte	0xa2
	.2byte	0x1c4
	.byte	0xe
	.4byte	.LASF121
	.byte	0x5
	.2byte	0x278
	.byte	0x17
	.4byte	0xa2
	.2byte	0x1c8
	.byte	0xe
	.4byte	.LASF122
	.byte	0x5
	.2byte	0x279
	.byte	0x17
	.4byte	0xa2
	.2byte	0x1cc
	.byte	0xe
	.4byte	.LASF123
	.byte	0x5
	.2byte	0x27a
	.byte	0x13
	.4byte	0x62d
	.2byte	0x1d0
	.byte	0xe
	.4byte	.LASF124
	.byte	0x5
	.2byte	0x27b
	.byte	0x17
	.4byte	0xa2
	.2byte	0x200
	.byte	0xe
	.4byte	.LASF125
	.byte	0x5
	.2byte	0x27c
	.byte	0x17
	.4byte	0xa2
	.2byte	0x204
	.byte	0xe
	.4byte	.LASF126
	.byte	0x5
	.2byte	0x27d
	.byte	0x1d
	.4byte	0xa7
	.2byte	0x208
	.byte	0xe
	.4byte	.LASF127
	.byte	0x5
	.2byte	0x27e
	.byte	0x1d
	.4byte	0xa7
	.2byte	0x20c
	.byte	0
	.byte	0x9
	.4byte	0x96
	.4byte	0x608
	.byte	0xa
	.4byte	0x7c
	.byte	0xd
	.byte	0
	.byte	0x9
	.4byte	0xa2
	.4byte	0x618
	.byte	0xa
	.4byte	0x7c
	.byte	0xf
	.byte	0
	.byte	0x5
	.4byte	0x608
	.byte	0x9
	.4byte	0x96
	.4byte	0x62d
	.byte	0xa
	.4byte	0x7c
	.byte	0x17
	.byte	0
	.byte	0x9
	.4byte	0x96
	.4byte	0x63d
	.byte	0xa
	.4byte	0x7c
	.byte	0xb
	.byte	0
	.byte	0x10
	.4byte	.LASF266
	.byte	0x7
	.byte	0x8
	.4byte	0x6e
	.byte	0x4
	.byte	0x9e
	.byte	0xe
	.4byte	0x893
	.byte	0x8
	.4byte	.LASF128
	.byte	0
	.byte	0x8
	.4byte	.LASF129
	.byte	0x1
	.byte	0x8
	.4byte	.LASF130
	.byte	0x2
	.byte	0x8
	.4byte	.LASF131
	.byte	0x3
	.byte	0x8
	.4byte	.LASF132
	.byte	0x4
	.byte	0x8
	.4byte	.LASF133
	.byte	0x5
	.byte	0x8
	.4byte	.LASF134
	.byte	0x6
	.byte	0x8
	.4byte	.LASF135
	.byte	0x7
	.byte	0x8
	.4byte	.LASF136
	.byte	0x8
	.byte	0x11
	.4byte	.LASF137
	.4byte	0x2000000
	.byte	0x11
	.4byte	.LASF138
	.4byte	0x5040000
	.byte	0x11
	.4byte	.LASF139
	.4byte	0x50a0000
	.byte	0x11
	.4byte	.LASF140
	.4byte	0x3000001
	.byte	0x11
	.4byte	.LASF141
	.4byte	0x5000705
	.byte	0x11
	.4byte	.LASF142
	.4byte	0x2000070a
	.byte	0x12
	.4byte	.LASF143
	.8byte	0x208072000000000
	.byte	0x11
	.4byte	.LASF144
	.4byte	0x5050705
	.byte	0x11
	.4byte	.LASF145
	.4byte	0x2000070b
	.byte	0x12
	.4byte	.LASF146
	.8byte	0x20a072000000000
	.byte	0x11
	.4byte	.LASF147
	.4byte	0x50a0705
	.byte	0x11
	.4byte	.LASF148
	.4byte	0x2000070c
	.byte	0x12
	.4byte	.LASF149
	.8byte	0x20c072000000000
	.byte	0x11
	.4byte	.LASF150
	.4byte	0x5000714
	.byte	0x11
	.4byte	.LASF151
	.4byte	0x20000715
	.byte	0x12
	.4byte	.LASF152
	.8byte	0x20a072300000000
	.byte	0x12
	.4byte	.LASF153
	.8byte	0x10f071f0800071f
	.byte	0x12
	.4byte	.LASF154
	.8byte	0x10f072008000720
	.byte	0x12
	.4byte	.LASF155
	.8byte	0x10f072408000724
	.byte	0x12
	.4byte	.LASF156
	.8byte	0x10f072108000721
	.byte	0x12
	.4byte	.LASF157
	.8byte	0x109071f00000000
	.byte	0x12
	.4byte	.LASF158
	.8byte	0x20a071f00000000
	.byte	0x12
	.4byte	.LASF159
	.8byte	0x10c071f00000000
	.byte	0x12
	.4byte	.LASF160
	.8byte	0x100072200000000
	.byte	0x12
	.4byte	.LASF161
	.8byte	0x101072200000000
	.byte	0x12
	.4byte	.LASF162
	.8byte	0x202072200000000
	.byte	0x12
	.4byte	.LASF163
	.8byte	0x10c072200000000
	.byte	0x12
	.4byte	.LASF164
	.8byte	0x10d072200000000
	.byte	0x12
	.4byte	.LASF165
	.8byte	0x10e072200000000
	.byte	0x12
	.4byte	.LASF166
	.8byte	0x200072300000000
	.byte	0x12
	.4byte	.LASF167
	.8byte	0x202072300000000
	.byte	0x12
	.4byte	.LASF168
	.8byte	0x204072300000000
	.byte	0x12
	.4byte	.LASF169
	.8byte	0x108072300000000
	.byte	0x12
	.4byte	.LASF170
	.8byte	0x20c072300000000
	.byte	0x12
	.4byte	.LASF171
	.8byte	0x20e072300000000
	.byte	0x12
	.4byte	.LASF172
	.8byte	0x1070729030d0729
	.byte	0x11
	.4byte	.LASF173
	.4byte	0x5000728
	.byte	0x11
	.4byte	.LASF174
	.4byte	0x5080728
	.byte	0x12
	.4byte	.LASF175
	.8byte	0x106072800000000
	.byte	0x12
	.4byte	.LASF176
	.8byte	0x10e072800000000
	.byte	0x12
	.4byte	.LASF177
	.8byte	0x10e071e00000000
	.byte	0x11
	.4byte	.LASF178
	.4byte	0x2090725
	.byte	0x12
	.4byte	.LASF179
	.8byte	0x101030000000000
	.byte	0x12
	.4byte	.LASF180
	.8byte	0x103030000000000
	.byte	0x12
	.4byte	.LASF181
	.8byte	0x108090000000000
	.byte	0
	.byte	0x3
	.4byte	.LASF182
	.byte	0x4
	.byte	0xdd
	.byte	0x3
	.4byte	0x63d
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x6
	.byte	0x2e
	.byte	0x6
	.4byte	0x8f0
	.byte	0x8
	.4byte	.LASF183
	.byte	0
	.byte	0x8
	.4byte	.LASF184
	.byte	0x1
	.byte	0x8
	.4byte	.LASF185
	.byte	0x2
	.byte	0x8
	.4byte	.LASF186
	.byte	0x3
	.byte	0x8
	.4byte	.LASF187
	.byte	0x4
	.byte	0x8
	.4byte	.LASF188
	.byte	0x5
	.byte	0x8
	.4byte	.LASF189
	.byte	0x6
	.byte	0x8
	.4byte	.LASF190
	.byte	0x7
	.byte	0x8
	.4byte	.LASF191
	.byte	0x8
	.byte	0x8
	.4byte	.LASF192
	.byte	0x9
	.byte	0x8
	.4byte	.LASF193
	.byte	0xa
	.byte	0
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x6
	.byte	0x44
	.byte	0xe
	.4byte	0x9b3
	.byte	0x8
	.4byte	.LASF194
	.byte	0
	.byte	0x8
	.4byte	.LASF195
	.byte	0x1
	.byte	0x8
	.4byte	.LASF196
	.byte	0x8
	.byte	0x8
	.4byte	.LASF197
	.byte	0x9
	.byte	0x8
	.4byte	.LASF198
	.byte	0x10
	.byte	0x8
	.4byte	.LASF199
	.byte	0x11
	.byte	0x8
	.4byte	.LASF200
	.byte	0x12
	.byte	0x8
	.4byte	.LASF201
	.byte	0x13
	.byte	0x8
	.4byte	.LASF202
	.byte	0x14
	.byte	0x8
	.4byte	.LASF203
	.byte	0x18
	.byte	0x8
	.4byte	.LASF204
	.byte	0x19
	.byte	0x8
	.4byte	.LASF205
	.byte	0x28
	.byte	0x8
	.4byte	.LASF206
	.byte	0x29
	.byte	0x8
	.4byte	.LASF207
	.byte	0x2a
	.byte	0x8
	.4byte	.LASF208
	.byte	0x2b
	.byte	0x8
	.4byte	.LASF209
	.byte	0x2c
	.byte	0x8
	.4byte	.LASF210
	.byte	0x2d
	.byte	0x8
	.4byte	.LASF211
	.byte	0x2e
	.byte	0x8
	.4byte	.LASF212
	.byte	0x2f
	.byte	0x8
	.4byte	.LASF213
	.byte	0x30
	.byte	0x8
	.4byte	.LASF214
	.byte	0x31
	.byte	0x8
	.4byte	.LASF215
	.byte	0x30
	.byte	0x8
	.4byte	.LASF216
	.byte	0x31
	.byte	0x8
	.4byte	.LASF217
	.byte	0x32
	.byte	0x8
	.4byte	.LASF218
	.byte	0x33
	.byte	0x8
	.4byte	.LASF219
	.byte	0x34
	.byte	0x8
	.4byte	.LASF220
	.byte	0x35
	.byte	0x8
	.4byte	.LASF221
	.byte	0x38
	.byte	0x8
	.4byte	.LASF222
	.byte	0x40
	.byte	0x8
	.4byte	.LASF223
	.byte	0x41
	.byte	0
	.byte	0x3
	.4byte	.LASF224
	.byte	0x6
	.byte	0x69
	.byte	0x3
	.4byte	0x8f0
	.byte	0x13
	.4byte	.LASF225
	.byte	0x10
	.byte	0x7
	.byte	0xa8
	.byte	0x8
	.4byte	0xa01
	.byte	0x14
	.4byte	.LASF226
	.byte	0x7
	.byte	0xa9
	.byte	0xe
	.4byte	0x96
	.byte	0
	.byte	0x14
	.4byte	.LASF227
	.byte	0x7
	.byte	0xaa
	.byte	0xe
	.4byte	0x96
	.byte	0x4
	.byte	0x14
	.4byte	.LASF228
	.byte	0x7
	.byte	0xab
	.byte	0xe
	.4byte	0x96
	.byte	0x8
	.byte	0x14
	.4byte	.LASF229
	.byte	0x7
	.byte	0xac
	.byte	0xe
	.4byte	0x96
	.byte	0xc
	.byte	0
	.byte	0x6
	.4byte	0x9bf
	.byte	0x13
	.4byte	.LASF230
	.byte	0x8
	.byte	0x7
	.byte	0xaf
	.byte	0x8
	.4byte	0xa2e
	.byte	0x14
	.4byte	.LASF231
	.byte	0x7
	.byte	0xb0
	.byte	0x21
	.4byte	0xa33
	.byte	0
	.byte	0x14
	.4byte	.LASF232
	.byte	0x7
	.byte	0xb1
	.byte	0xd
	.4byte	0x8a
	.byte	0x4
	.byte	0
	.byte	0x6
	.4byte	0xa06
	.byte	0x15
	.byte	0x4
	.4byte	0xa01
	.byte	0x16
	.4byte	.LASF254
	.byte	0x7
	.byte	0xba
	.byte	0x21
	.4byte	0xa2e
	.byte	0x17
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x8
	.2byte	0x42b
	.byte	0xe
	.4byte	0xa79
	.byte	0x8
	.4byte	.LASF233
	.byte	0
	.byte	0x8
	.4byte	.LASF234
	.byte	0x1
	.byte	0x8
	.4byte	.LASF235
	.byte	0x2
	.byte	0x8
	.4byte	.LASF236
	.byte	0x3
	.byte	0x8
	.4byte	.LASF237
	.byte	0x4
	.byte	0x8
	.4byte	.LASF238
	.byte	0x5
	.byte	0
	.byte	0x13
	.4byte	.LASF239
	.byte	0x20
	.byte	0x9
	.byte	0x55
	.byte	0x8
	.4byte	0xad5
	.byte	0x14
	.4byte	.LASF240
	.byte	0x9
	.byte	0x56
	.byte	0x15
	.4byte	0xada
	.byte	0
	.byte	0x14
	.4byte	.LASF241
	.byte	0x9
	.byte	0x57
	.byte	0x11
	.4byte	0x893
	.byte	0x8
	.byte	0x14
	.4byte	.LASF242
	.byte	0x9
	.byte	0x58
	.byte	0xe
	.4byte	0x96
	.byte	0x10
	.byte	0x14
	.4byte	.LASF243
	.byte	0x9
	.byte	0x59
	.byte	0xe
	.4byte	0x96
	.byte	0x14
	.byte	0x14
	.4byte	.LASF244
	.byte	0x9
	.byte	0x5a
	.byte	0xf
	.4byte	0x235
	.byte	0x18
	.byte	0x14
	.4byte	.LASF245
	.byte	0x9
	.byte	0x5b
	.byte	0x14
	.4byte	0x9b3
	.byte	0x1c
	.byte	0
	.byte	0x6
	.4byte	0xa79
	.byte	0x15
	.byte	0x4
	.4byte	0x281
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF246
	.byte	0x13
	.4byte	.LASF247
	.byte	0x38
	.byte	0xa
	.byte	0x66
	.byte	0x8
	.4byte	0xb36
	.byte	0x14
	.4byte	.LASF240
	.byte	0xa
	.byte	0x67
	.byte	0x15
	.4byte	0xb3b
	.byte	0
	.byte	0x14
	.4byte	.LASF241
	.byte	0xa
	.byte	0x68
	.byte	0x11
	.4byte	0x893
	.byte	0x8
	.byte	0x14
	.4byte	.LASF242
	.byte	0xa
	.byte	0x69
	.byte	0xe
	.4byte	0x96
	.byte	0x10
	.byte	0x14
	.4byte	.LASF243
	.byte	0xa
	.byte	0x6a
	.byte	0xe
	.4byte	0x96
	.byte	0x14
	.byte	0x14
	.4byte	.LASF244
	.byte	0xa
	.byte	0x6b
	.byte	0xf
	.4byte	0xb41
	.byte	0x18
	.byte	0
	.byte	0x6
	.4byte	0xae7
	.byte	0x15
	.byte	0x4
	.4byte	0x3b3
	.byte	0x9
	.4byte	0x235
	.4byte	0xb51
	.byte	0xa
	.4byte	0x7c
	.byte	0x7
	.byte	0
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0xb
	.byte	0x35
	.byte	0xe
	.4byte	0xb84
	.byte	0x8
	.4byte	.LASF248
	.byte	0
	.byte	0x8
	.4byte	.LASF249
	.byte	0x1
	.byte	0x8
	.4byte	.LASF250
	.byte	0x2
	.byte	0x8
	.4byte	.LASF251
	.byte	0x3
	.byte	0x8
	.4byte	.LASF252
	.byte	0x4
	.byte	0x8
	.4byte	.LASF253
	.byte	0x5
	.byte	0
	.byte	0x16
	.4byte	.LASF255
	.byte	0xc
	.byte	0x15
	.byte	0x21
	.4byte	0xad5
	.byte	0x16
	.4byte	.LASF256
	.byte	0xc
	.byte	0x16
	.byte	0x21
	.4byte	0xad5
	.byte	0x16
	.4byte	.LASF257
	.byte	0xc
	.byte	0x17
	.byte	0x21
	.4byte	0xad5
	.byte	0x16
	.4byte	.LASF258
	.byte	0xc
	.byte	0x18
	.byte	0x21
	.4byte	0xad5
	.byte	0x16
	.4byte	.LASF259
	.byte	0xc
	.byte	0x19
	.byte	0x21
	.4byte	0xad5
	.byte	0x16
	.4byte	.LASF260
	.byte	0xc
	.byte	0x1d
	.byte	0x21
	.4byte	0xb36
	.byte	0x16
	.4byte	.LASF261
	.byte	0xc
	.byte	0x1e
	.byte	0x21
	.4byte	0xb36
	.byte	0x16
	.4byte	.LASF262
	.byte	0xc
	.byte	0x1f
	.byte	0x21
	.4byte	0xb36
	.byte	0x9
	.4byte	0x9bf
	.4byte	0xbf4
	.byte	0xa
	.4byte	0x7c
	.byte	0x9
	.byte	0
	.byte	0x18
	.4byte	.LASF267
	.byte	0x1
	.byte	0x9
	.byte	0x1d
	.4byte	0xbe4
	.byte	0x5
	.byte	0x3
	.4byte	cruBanks
	.byte	0x19
	.4byte	0xa39
	.byte	0x1
	.byte	0x16
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_cruDev
	.byte	0x19
	.4byte	0xb84
	.byte	0x1
	.byte	0x41
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_i2c0Dev
	.byte	0x19
	.4byte	0xb90
	.byte	0x1
	.byte	0x4b
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_i2c1Dev
	.byte	0x19
	.4byte	0xb9c
	.byte	0x1
	.byte	0x55
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_i2c2Dev
	.byte	0x19
	.4byte	0xba8
	.byte	0x1
	.byte	0x5f
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_i2c3Dev
	.byte	0x19
	.4byte	0xbb4
	.byte	0x1
	.byte	0x69
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_i2c4Dev
	.byte	0x19
	.4byte	0xbc0
	.byte	0x1
	.byte	0x75
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_pwm0Dev
	.byte	0x19
	.4byte	0xbcc
	.byte	0x1
	.byte	0x81
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_pwm1Dev
	.byte	0x19
	.4byte	0xbd8
	.byte	0x1
	.byte	0x8d
	.byte	0x1a
	.byte	0x5
	.byte	0x3
	.4byte	g_pwm2Dev
	.byte	0x1a
	.4byte	.LASF268
	.byte	0x1
	.byte	0xca
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0x8
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x5
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF214:
	.string	"PM_RUNTIME_ID_UART9"
.LASF266:
	.string	"CLOCK_Name"
.LASF126:
	.string	"COUNTER_LOW"
.LASF247:
	.string	"HAL_PWM_DEV"
.LASF110:
	.string	"PWRMATCH_CTRL"
.LASF238:
	.string	"GRF_INFO_NUM"
.LASF24:
	.string	"MIPI_ISP_IRQn"
.LASF88:
	.string	"RXDATA"
.LASF123:
	.string	"RESERVED01D0"
.LASF188:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF89:
	.string	"DBGCTRL"
.LASF75:
	.string	"FSPI1_IRQn"
.LASF70:
	.string	"LPMCU_MBOX3_AP_IRQn"
.LASF241:
	.string	"clkID"
.LASF181:
	.string	"SCLK_SFC_2X_PMU1"
.LASF195:
	.string	"PM_RUNTIME_ID_SPI_APB"
.LASF38:
	.string	"GPIO9_IRQn"
.LASF91:
	.string	"I2C_REG"
.LASF59:
	.string	"HPMCU_MBOX0_AP_IRQn"
.LASF40:
	.string	"GPIO4_IRQn"
.LASF60:
	.string	"HPMCU_MBOX1_AP_IRQn"
.LASF57:
	.string	"PWM2_CH2_IRQn"
.LASF223:
	.string	"PM_RUNTIME_ID_END"
.LASF233:
	.string	"GRF_MUX_INFO"
.LASF13:
	.string	"uint32_t"
.LASF82:
	.string	"MRXCNT"
.LASF16:
	.string	"TIMER1_IRQn"
.LASF226:
	.string	"cruBase"
.LASF98:
	.string	"DUTY"
.LASF197:
	.string	"PM_RUNTIME_ID_MIPI"
.LASF118:
	.string	"RESERVED0160"
.LASF64:
	.string	"HPMCU_MBOX1_BB_IRQn"
.LASF182:
	.string	"eCLOCK_Name"
.LASF259:
	.string	"g_i2c4Dev"
.LASF138:
	.string	"CLK_TSADC"
.LASF204:
	.string	"PM_RUNTIME_ID_SDIO"
.LASF264:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/bsp/RV1103B/hal_bsp.c"
.LASF243:
	.string	"pclkGateID"
.LASF46:
	.string	"GPIO11_IRQn"
.LASF28:
	.string	"I2C1_IRQn"
.LASF50:
	.string	"PWM0_CH3_IRQn"
.LASF124:
	.string	"COUNTER_ARBITER"
.LASF154:
	.string	"CCLK_SDMMC0"
.LASF155:
	.string	"CCLK_SDMMC1"
.LASF252:
	.string	"PWR_CTRL_VOLT_ST"
.LASF113:
	.string	"PWRMATCH_LD"
.LASF262:
	.string	"g_pwm2Dev"
.LASF143:
	.string	"CLK_UART0"
.LASF146:
	.string	"CLK_UART1"
.LASF149:
	.string	"CLK_UART2"
.LASF31:
	.string	"I2C4_IRQn"
.LASF67:
	.string	"LPMCU_MBOX0_AP_IRQn"
.LASF45:
	.string	"GPIO8_IRQn"
.LASF147:
	.string	"CLK_UART2_SRC"
.LASF236:
	.string	"GRF_SRT_INFO"
.LASF74:
	.string	"LPMCU_MBOX3_BB_IRQn"
.LASF239:
	.string	"HAL_I2C_DEV"
.LASF187:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF159:
	.string	"HCLK_HPMCU_SRC"
.LASF52:
	.string	"PWM1_CH1_IRQn"
.LASF122:
	.string	"FREQ_RESULT_VALUE"
.LASF163:
	.string	"CLK_PWM0"
.LASF164:
	.string	"CLK_PWM1"
.LASF165:
	.string	"CLK_PWM2"
.LASF9:
	.string	"long long unsigned int"
.LASF142:
	.string	"CLK_UART0_FRAC"
.LASF244:
	.string	"irqNum"
.LASF104:
	.string	"INT_EN"
.LASF37:
	.string	"GPIO6_IRQn"
.LASF225:
	.string	"CRU_BANK_INFO"
.LASF25:
	.string	"MI_ISP_IRQn"
.LASF39:
	.string	"GPIO1_IRQn"
.LASF121:
	.string	"FREQ_TIMER_VALUE"
.LASF229:
	.string	"softOffset"
.LASF166:
	.string	"DCLK_DECOM"
.LASF116:
	.string	"PWRMATCH_VALUE"
.LASF185:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF127:
	.string	"COUNTER_HIGH"
.LASF228:
	.string	"gateOffset"
.LASF86:
	.string	"TXDATA"
.LASF77:
	.string	"IRQn_Type"
.LASF112:
	.string	"PWRMATCH_HPRE"
.LASF30:
	.string	"I2C3_IRQn"
.LASF117:
	.string	"PWRCAPTURE_VALUE"
.LASF176:
	.string	"CLK_MIPI1_OUT2IO"
.LASF139:
	.string	"CLK_TSADC_TSEN"
.LASF71:
	.string	"LPMCU_MBOX0_BB_IRQn"
.LASF173:
	.string	"CLK_REF_MIPI0_SRC"
.LASF246:
	.string	"_Bool"
.LASF33:
	.string	"UART1_IRQn"
.LASF208:
	.string	"PM_RUNTIME_ID_UART3"
.LASF137:
	.string	"PCLK_PERI_ROOT"
.LASF157:
	.string	"LSCLK_PERI_SRC"
.LASF168:
	.string	"CLK_PKA_CRYPTO"
.LASF61:
	.string	"HPMCU_MBOX2_AP_IRQn"
.LASF242:
	.string	"clkGateID"
.LASF237:
	.string	"GRF_SMT_INFO"
.LASF18:
	.string	"TIMER3_IRQn"
.LASF54:
	.string	"PWM1_CH3_IRQn"
.LASF167:
	.string	"CLK_CORE_CRYPTO"
.LASF183:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF151:
	.string	"CLK_SAI_FRAC"
.LASF256:
	.string	"g_i2c1Dev"
.LASF190:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF81:
	.string	"MTXCNT"
.LASF148:
	.string	"CLK_UART2_FRAC"
.LASF97:
	.string	"PERIOD"
.LASF65:
	.string	"HPMCU_MBOX2_BB_IRQn"
.LASF11:
	.string	"char"
.LASF227:
	.string	"selOffset"
.LASF194:
	.string	"PM_RUNTIME_ID_INTF_INVLD"
.LASF251:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF240:
	.string	"pReg"
.LASF56:
	.string	"PWM2_CH1_IRQn"
.LASF224:
	.string	"ePM_RUNTIME_ID"
.LASF36:
	.string	"GPIO3_IRQn"
.LASF140:
	.string	"CLK_SARADC"
.LASF12:
	.string	"uint8_t"
.LASF189:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF79:
	.string	"MRXADDR"
.LASF85:
	.string	"RESERVED0028"
.LASF68:
	.string	"LPMCU_MBOX1_AP_IRQn"
.LASF103:
	.string	"INTSTS"
.LASF232:
	.string	"banksNum"
.LASF101:
	.string	"ENABLE_DELAY"
.LASF8:
	.string	"long long int"
.LASF161:
	.string	"CLK_I2C_PERI"
.LASF42:
	.string	"GPIO10_IRQn"
.LASF125:
	.string	"COUNTER_CTRL"
.LASF22:
	.string	"FSPI0_IRQn"
.LASF171:
	.string	"CLK_COUNTER_PWM0"
.LASF27:
	.string	"I2C0_IRQn"
.LASF115:
	.string	"PWRMATCH_HD_ONE"
.LASF178:
	.string	"CLK_ISP_GPLL_SRC"
.LASF49:
	.string	"PWM0_CH2_IRQn"
.LASF129:
	.string	"PLL_GPLL"
.LASF180:
	.string	"LSCLK_VI_ROOT"
.LASF231:
	.string	"banks"
.LASF102:
	.string	"RESERVED0034"
.LASF114:
	.string	"PWRMATCH_HD_ZERO"
.LASF14:
	.string	"SARADC_IRQn"
.LASF144:
	.string	"CLK_UART1_SRC"
.LASF20:
	.string	"TIMER5_IRQn"
.LASF267:
	.string	"cruBanks"
.LASF53:
	.string	"PWM1_CH2_IRQn"
.LASF15:
	.string	"TIMER0_IRQn"
.LASF263:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF51:
	.string	"PWM1_CH0_IRQn"
.LASF184:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
.LASF23:
	.string	"VICAP_IRQn"
.LASF84:
	.string	"SCL_OE_DB"
.LASF191:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF261:
	.string	"g_pwm1Dev"
.LASF21:
	.string	"SPI0_IRQn"
.LASF248:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF169:
	.string	"CLK_CORE_RGA"
.LASF58:
	.string	"PWM2_CH3_IRQn"
.LASF192:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF202:
	.string	"PM_RUNTIME_ID_DMA"
.LASF130:
	.string	"TCLK_WDT_NS"
.LASF111:
	.string	"PWRMATCH_LPRE"
.LASF72:
	.string	"LPMCU_MBOX1_BB_IRQn"
.LASF92:
	.string	"PWM_REG"
.LASF258:
	.string	"g_i2c3Dev"
.LASF205:
	.string	"PM_RUNTIME_ID_UART0"
.LASF206:
	.string	"PM_RUNTIME_ID_UART1"
.LASF76:
	.string	"NUM_INTERRUPTS"
.LASF6:
	.string	"__uint32_t"
.LASF209:
	.string	"PM_RUNTIME_ID_UART4"
.LASF210:
	.string	"PM_RUNTIME_ID_UART5"
.LASF211:
	.string	"PM_RUNTIME_ID_UART6"
.LASF212:
	.string	"PM_RUNTIME_ID_UART7"
.LASF213:
	.string	"PM_RUNTIME_ID_UART8"
.LASF62:
	.string	"HPMCU_MBOX3_AP_IRQn"
.LASF260:
	.string	"g_pwm0Dev"
.LASF177:
	.string	"DCLK_VICAP_SRC"
.LASF2:
	.string	"short int"
.LASF106:
	.string	"GLOBAL_ARBITER"
.LASF119:
	.string	"FREQ_ARBITER"
.LASF4:
	.string	"long int"
.LASF93:
	.string	"VERSION_ID"
.LASF78:
	.string	"CLKDIV"
.LASF66:
	.string	"HPMCU_MBOX3_BB_IRQn"
.LASF109:
	.string	"PWRMATCH_ARBITER"
.LASF186:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF26:
	.string	"ISP_IRQn"
.LASF152:
	.string	"MCLK_SAI"
.LASF32:
	.string	"UART0_IRQn"
.LASF193:
	.string	"PM_RUNTIME_TYPE_END"
.LASF250:
	.string	"PWR_CTRL_PWR_EN"
.LASF150:
	.string	"CLK_SAI_SRC"
.LASF44:
	.string	"GPIO5_IRQn"
.LASF265:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF90:
	.string	"CON1"
.LASF153:
	.string	"CCLK_EMMC"
.LASF83:
	.string	"FCNT"
.LASF17:
	.string	"TIMER2_IRQn"
.LASF120:
	.string	"FREQ_CTRL"
.LASF128:
	.string	"CLK_INVALID"
.LASF5:
	.string	"__uint8_t"
.LASF203:
	.string	"PM_RUNTIME_ID_USB"
.LASF69:
	.string	"LPMCU_MBOX2_AP_IRQn"
.LASF10:
	.string	"unsigned int"
.LASF268:
	.string	"BSP_Init"
.LASF221:
	.string	"PM_RUNTIME_ID_SPI"
.LASF145:
	.string	"CLK_UART1_FRAC"
.LASF100:
	.string	"FILTER_CTRL"
.LASF94:
	.string	"ENABLE"
.LASF29:
	.string	"I2C2_IRQn"
.LASF7:
	.string	"long unsigned int"
.LASF105:
	.string	"RESERVED0078"
.LASF55:
	.string	"PWM2_CH0_IRQn"
.LASF172:
	.string	"MCLK_SAI_OUT2IO"
.LASF170:
	.string	"CLK_FREQ_PWM0"
.LASF215:
	.string	"PM_RUNTIME_ID_I2C0"
.LASF216:
	.string	"PM_RUNTIME_ID_I2C1"
.LASF217:
	.string	"PM_RUNTIME_ID_I2C2"
.LASF218:
	.string	"PM_RUNTIME_ID_I2C3"
.LASF219:
	.string	"PM_RUNTIME_ID_I2C4"
.LASF220:
	.string	"PM_RUNTIME_ID_I2C5"
.LASF249:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF255:
	.string	"g_i2c0Dev"
.LASF99:
	.string	"OFFSET"
.LASF1:
	.string	"unsigned char"
.LASF201:
	.string	"PM_RUNTIME_ID_ADC"
.LASF63:
	.string	"HPMCU_MBOX0_BB_IRQn"
.LASF198:
	.string	"PM_RUNTIME_ID_I2S"
.LASF132:
	.string	"CLK_I2C0"
.LASF133:
	.string	"CLK_I2C1"
.LASF134:
	.string	"CLK_I2C2"
.LASF135:
	.string	"CLK_I2C3"
.LASF136:
	.string	"CLK_I2C4"
.LASF87:
	.string	"RESERVED0120"
.LASF199:
	.string	"PM_RUNTIME_ID_I2S1"
.LASF200:
	.string	"PM_RUNTIME_ID_I2S2"
.LASF234:
	.string	"GRF_PUL_INFO"
.LASF107:
	.string	"GLOBAL_CTRL"
.LASF47:
	.string	"PWM0_CH0_IRQn"
.LASF34:
	.string	"UART2_IRQn"
.LASF141:
	.string	"CLK_UART0_SRC"
.LASF95:
	.string	"CLK_CTRL"
.LASF160:
	.string	"CLK_I2C_PMU"
.LASF41:
	.string	"GPIO7_IRQn"
.LASF196:
	.string	"PM_RUNTIME_ID_VOP"
.LASF254:
	.string	"g_cruDev"
.LASF73:
	.string	"LPMCU_MBOX2_BB_IRQn"
.LASF19:
	.string	"TIMER4_IRQn"
.LASF43:
	.string	"GPIO2_IRQn"
.LASF0:
	.string	"signed char"
.LASF162:
	.string	"CLK_SPI0"
.LASF230:
	.string	"HAL_CRU_DEV"
.LASF80:
	.string	"MRXRADDR"
.LASF3:
	.string	"short unsigned int"
.LASF158:
	.string	"ACLK_PERI_SRC"
.LASF179:
	.string	"CLK_CORE_ISP"
.LASF253:
	.string	"PWR_CTRL_MAX"
.LASF235:
	.string	"GRF_DRV_INFO"
.LASF175:
	.string	"CLK_MIPI0_OUT2IO"
.LASF131:
	.string	"TCLK_WDT_S"
.LASF222:
	.string	"PM_RUNTIME_ID_CIF"
.LASF245:
	.string	"runtimeID"
.LASF108:
	.string	"RESERVED00C8"
.LASF35:
	.string	"GPIO0_IRQn"
.LASF257:
	.string	"g_i2c2Dev"
.LASF156:
	.string	"SCLK_SFC_2X"
.LASF48:
	.string	"PWM0_CH1_IRQn"
.LASF174:
	.string	"CLK_REF_MIPI1_SRC"
.LASF207:
	.string	"PM_RUNTIME_ID_UART2"
.LASF96:
	.string	"CTRL"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
