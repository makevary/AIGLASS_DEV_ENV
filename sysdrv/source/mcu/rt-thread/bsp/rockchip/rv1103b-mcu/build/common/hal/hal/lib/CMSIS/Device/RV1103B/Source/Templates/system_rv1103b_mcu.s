	.file	"system_rv1103b_mcu.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.SystemCoreClockUpdate,"ax",@progbits
	.align	1
	.globl	SystemCoreClockUpdate
	.type	SystemCoreClockUpdate, @function
SystemCoreClockUpdate:
.LFB19:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Source/Templates/system_rv1103b_mcu.c"
	.loc 1 24 1
	.cfi_startproc
	.loc 1 25 1
	ret
	.cfi_endproc
.LFE19:
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.section	.text.SystemInit,"ax",@progbits
	.align	1
	.globl	SystemInit
	.type	SystemInit, @function
SystemInit:
.LFB20:
	.loc 1 31 1
	.cfi_startproc
	.loc 1 34 5
	.loc 1 37 5
	.loc 1 37 65 is_stmt 0
	li	a5,538247168
	li	a4,131072
	sw	a4,512(a5)
	.loc 1 38 5 is_stmt 1
	.loc 1 38 63 is_stmt 0
	li	a4,135168
	sw	a4,516(a5)
	.loc 1 40 5 is_stmt 1
	.loc 1 40 53 is_stmt 0
	li	a5,543817728
	lw	a4,0(a5)
	ori	a4,a4,1921
	sw	a4,0(a5)
	.loc 1 43 5 is_stmt 1
	.loc 1 43 59 is_stmt 0
	li	a4,1
	sw	a4,12(a5)
.L3:
	.loc 1 45 5 is_stmt 1 discriminator 1
	.loc 1 46 9 discriminator 1
	.loc 1 47 48 is_stmt 0 discriminator 1
	lw	a4,48(a5)
.LVL0:
	.loc 1 48 13 is_stmt 1 discriminator 1
	.loc 1 46 16 is_stmt 0 discriminator 1
	andi	a4,a4,1
.LVL1:
	.loc 1 48 5 discriminator 1
	beq	a4,zero,.L3
	.loc 1 50 5 is_stmt 1
	.loc 1 50 53 is_stmt 0
	lw	a4,0(a5)
.LVL2:
	andi	a4,a4,-65
	sw	a4,0(a5)
	.loc 1 52 5 is_stmt 1
.LBB4:
.LBB5:
	.loc 1 17 5
	tail	clear_bss
.LVL3:
.LBE5:
.LBE4:
	.cfi_endproc
.LFE20:
	.size	SystemInit, .-SystemInit
	.globl	SystemCoreClock
	.section	.sdata.SystemCoreClock,"aw"
	.align	2
	.type	SystemCoreClock, @object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	300000000
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/system_rv1103b.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6f8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF121
	.byte	0xc
	.4byte	.LASF122
	.4byte	.LASF123
	.4byte	.Ldebug_ranges0+0
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
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x54
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
	.byte	0x4
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
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x48
	.byte	0x5
	.4byte	0x7e
	.byte	0x6
	.4byte	0x8a
	.byte	0x7
	.4byte	.LASF124
	.byte	0x8
	.byte	0xd
	.byte	0x11
	.4byte	0x7e
	.byte	0x8
	.4byte	0x8a
	.4byte	0xb0
	.byte	0x9
	.4byte	0x70
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	0xa0
	.byte	0x8
	.4byte	0x7e
	.4byte	0xc5
	.byte	0x9
	.4byte	0x70
	.byte	0x2
	.byte	0
	.byte	0xa
	.4byte	.LASF72
	.2byte	0x808
	.byte	0x4
	.byte	0xe4
	.byte	0x8
	.4byte	0x414
	.byte	0xb
	.4byte	.LASF12
	.byte	0x4
	.byte	0xe5
	.byte	0x17
	.4byte	0x8a
	.byte	0
	.byte	0xb
	.4byte	.LASF13
	.byte	0x4
	.byte	0xe6
	.byte	0x17
	.4byte	0x8a
	.byte	0x4
	.byte	0xb
	.4byte	.LASF14
	.byte	0x4
	.byte	0xe7
	.byte	0x17
	.4byte	0x8a
	.byte	0x8
	.byte	0xb
	.4byte	.LASF15
	.byte	0x4
	.byte	0xe8
	.byte	0x17
	.4byte	0x8a
	.byte	0xc
	.byte	0xb
	.4byte	.LASF16
	.byte	0x4
	.byte	0xe9
	.byte	0x17
	.4byte	0x8a
	.byte	0x10
	.byte	0xb
	.4byte	.LASF17
	.byte	0x4
	.byte	0xea
	.byte	0x13
	.4byte	0xb5
	.byte	0x14
	.byte	0xb
	.4byte	.LASF18
	.byte	0x4
	.byte	0xeb
	.byte	0x17
	.4byte	0x8a
	.byte	0x20
	.byte	0xb
	.4byte	.LASF19
	.byte	0x4
	.byte	0xec
	.byte	0x17
	.4byte	0x8a
	.byte	0x24
	.byte	0xb
	.4byte	.LASF20
	.byte	0x4
	.byte	0xed
	.byte	0x13
	.4byte	0x414
	.byte	0x28
	.byte	0xb
	.4byte	.LASF21
	.byte	0x4
	.byte	0xee
	.byte	0x17
	.4byte	0x8a
	.byte	0x30
	.byte	0xb
	.4byte	.LASF22
	.byte	0x4
	.byte	0xef
	.byte	0x17
	.4byte	0x8a
	.byte	0x34
	.byte	0xb
	.4byte	.LASF23
	.byte	0x4
	.byte	0xf0
	.byte	0x13
	.4byte	0x414
	.byte	0x38
	.byte	0xb
	.4byte	.LASF24
	.byte	0x4
	.byte	0xf1
	.byte	0x1d
	.4byte	0x8f
	.byte	0x40
	.byte	0xb
	.4byte	.LASF25
	.byte	0x4
	.byte	0xf2
	.byte	0x1d
	.4byte	0x8f
	.byte	0x44
	.byte	0xb
	.4byte	.LASF26
	.byte	0x4
	.byte	0xf3
	.byte	0x1d
	.4byte	0x8f
	.byte	0x48
	.byte	0xb
	.4byte	.LASF27
	.byte	0x4
	.byte	0xf4
	.byte	0x13
	.4byte	0x7e
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF28
	.byte	0x4
	.byte	0xf5
	.byte	0x17
	.4byte	0x8a
	.byte	0x50
	.byte	0xb
	.4byte	.LASF29
	.byte	0x4
	.byte	0xf6
	.byte	0x17
	.4byte	0x8a
	.byte	0x54
	.byte	0xb
	.4byte	.LASF30
	.byte	0x4
	.byte	0xf7
	.byte	0x17
	.4byte	0x8a
	.byte	0x58
	.byte	0xb
	.4byte	.LASF31
	.byte	0x4
	.byte	0xf8
	.byte	0x17
	.4byte	0x8a
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF32
	.byte	0x4
	.byte	0xf9
	.byte	0x1d
	.4byte	0x8f
	.byte	0x60
	.byte	0xb
	.4byte	.LASF33
	.byte	0x4
	.byte	0xfa
	.byte	0x13
	.4byte	0xb5
	.byte	0x64
	.byte	0xb
	.4byte	.LASF34
	.byte	0x4
	.byte	0xfb
	.byte	0x17
	.4byte	0x8a
	.byte	0x70
	.byte	0xb
	.4byte	.LASF35
	.byte	0x4
	.byte	0xfc
	.byte	0x17
	.4byte	0x8a
	.byte	0x74
	.byte	0xb
	.4byte	.LASF36
	.byte	0x4
	.byte	0xfd
	.byte	0x17
	.4byte	0x8a
	.byte	0x78
	.byte	0xb
	.4byte	.LASF37
	.byte	0x4
	.byte	0xfe
	.byte	0x13
	.4byte	0x7e
	.byte	0x7c
	.byte	0xb
	.4byte	.LASF38
	.byte	0x4
	.byte	0xff
	.byte	0x17
	.4byte	0x8a
	.byte	0x80
	.byte	0xc
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x100
	.byte	0x17
	.4byte	0x8a
	.byte	0x84
	.byte	0xc
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x101
	.byte	0x17
	.4byte	0x8a
	.byte	0x88
	.byte	0xc
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x102
	.byte	0x17
	.4byte	0x8a
	.byte	0x8c
	.byte	0xc
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x103
	.byte	0x17
	.4byte	0x8a
	.byte	0x90
	.byte	0xc
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x104
	.byte	0x13
	.4byte	0x7e
	.byte	0x94
	.byte	0xc
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x105
	.byte	0x1d
	.4byte	0x8f
	.byte	0x98
	.byte	0xc
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x106
	.byte	0x1d
	.4byte	0x8f
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x107
	.byte	0x17
	.4byte	0x8a
	.byte	0xa0
	.byte	0xc
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x108
	.byte	0x17
	.4byte	0x8a
	.byte	0xa4
	.byte	0xc
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x109
	.byte	0x1d
	.4byte	0x8f
	.byte	0xa8
	.byte	0xc
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x10a
	.byte	0x13
	.4byte	0x7e
	.byte	0xac
	.byte	0xc
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x10b
	.byte	0x17
	.4byte	0x8a
	.byte	0xb0
	.byte	0xc
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x10c
	.byte	0x17
	.4byte	0x8a
	.byte	0xb4
	.byte	0xc
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x10d
	.byte	0x13
	.4byte	0x424
	.byte	0xb8
	.byte	0xd
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x10e
	.byte	0x17
	.4byte	0x8a
	.2byte	0x100
	.byte	0xd
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x10f
	.byte	0x1d
	.4byte	0x8f
	.2byte	0x104
	.byte	0xd
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x110
	.byte	0x17
	.4byte	0x8a
	.2byte	0x108
	.byte	0xd
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x111
	.byte	0x13
	.4byte	0x7e
	.2byte	0x10c
	.byte	0xd
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x112
	.byte	0x17
	.4byte	0x8a
	.2byte	0x110
	.byte	0xd
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x113
	.byte	0x17
	.4byte	0x8a
	.2byte	0x114
	.byte	0xd
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x114
	.byte	0x17
	.4byte	0x8a
	.2byte	0x118
	.byte	0xd
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x115
	.byte	0x17
	.4byte	0x8a
	.2byte	0x11c
	.byte	0xd
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x116
	.byte	0x13
	.4byte	0x434
	.2byte	0x120
	.byte	0xd
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x117
	.byte	0x17
	.4byte	0x8a
	.2byte	0x200
	.byte	0xd
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x118
	.byte	0x17
	.4byte	0x8a
	.2byte	0x204
	.byte	0xd
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x119
	.byte	0x17
	.4byte	0x8a
	.2byte	0x208
	.byte	0xd
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x11a
	.byte	0x17
	.4byte	0x8a
	.2byte	0x20c
	.byte	0xd
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x11b
	.byte	0x17
	.4byte	0x8a
	.2byte	0x210
	.byte	0xd
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x11c
	.byte	0x17
	.4byte	0x8a
	.2byte	0x214
	.byte	0xd
	.4byte	.LASF68
	.byte	0x4
	.2byte	0x11d
	.byte	0x17
	.4byte	0x8a
	.2byte	0x218
	.byte	0xd
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x11e
	.byte	0x13
	.4byte	0x444
	.2byte	0x21c
	.byte	0xd
	.4byte	.LASF70
	.byte	0x4
	.2byte	0x11f
	.byte	0x17
	.4byte	0x8a
	.2byte	0x800
	.byte	0xd
	.4byte	.LASF71
	.byte	0x4
	.2byte	0x120
	.byte	0x17
	.4byte	0x8a
	.2byte	0x804
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x424
	.byte	0x9
	.4byte	0x70
	.byte	0x1
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x434
	.byte	0x9
	.4byte	0x70
	.byte	0x11
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x444
	.byte	0x9
	.4byte	0x70
	.byte	0x37
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x455
	.byte	0xe
	.4byte	0x70
	.2byte	0x178
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x465
	.byte	0x9
	.4byte	0x70
	.byte	0x3
	.byte	0
	.byte	0x8
	.4byte	0x7e
	.4byte	0x475
	.byte	0x9
	.4byte	0x70
	.byte	0x20
	.byte	0
	.byte	0xf
	.4byte	.LASF73
	.byte	0xf4
	.byte	0x4
	.2byte	0x303
	.byte	0x8
	.4byte	0x5c6
	.byte	0xc
	.4byte	.LASF74
	.byte	0x4
	.2byte	0x304
	.byte	0x17
	.4byte	0x8a
	.byte	0
	.byte	0xc
	.4byte	.LASF75
	.byte	0x4
	.2byte	0x305
	.byte	0x17
	.4byte	0xb0
	.byte	0x4
	.byte	0xc
	.4byte	.LASF76
	.byte	0x4
	.2byte	0x306
	.byte	0x17
	.4byte	0x8a
	.byte	0xc
	.byte	0xc
	.4byte	.LASF77
	.byte	0x4
	.2byte	0x307
	.byte	0x13
	.4byte	0x455
	.byte	0x10
	.byte	0xc
	.4byte	.LASF78
	.byte	0x4
	.2byte	0x308
	.byte	0x17
	.4byte	0x8a
	.byte	0x20
	.byte	0xc
	.4byte	.LASF79
	.byte	0x4
	.2byte	0x309
	.byte	0x17
	.4byte	0x8a
	.byte	0x24
	.byte	0xc
	.4byte	.LASF80
	.byte	0x4
	.2byte	0x30a
	.byte	0x1d
	.4byte	0x8f
	.byte	0x28
	.byte	0xc
	.4byte	.LASF81
	.byte	0x4
	.2byte	0x30b
	.byte	0x13
	.4byte	0x7e
	.byte	0x2c
	.byte	0xc
	.4byte	.LASF82
	.byte	0x4
	.2byte	0x30c
	.byte	0x1d
	.4byte	0x8f
	.byte	0x30
	.byte	0xc
	.4byte	.LASF83
	.byte	0x4
	.2byte	0x30d
	.byte	0x13
	.4byte	0xb5
	.byte	0x34
	.byte	0xc
	.4byte	.LASF84
	.byte	0x4
	.2byte	0x30e
	.byte	0x1d
	.4byte	0x8f
	.byte	0x40
	.byte	0xc
	.4byte	.LASF85
	.byte	0x4
	.2byte	0x30f
	.byte	0x1d
	.4byte	0x8f
	.byte	0x44
	.byte	0xc
	.4byte	.LASF86
	.byte	0x4
	.2byte	0x310
	.byte	0x1d
	.4byte	0x8f
	.byte	0x48
	.byte	0xc
	.4byte	.LASF87
	.byte	0x4
	.2byte	0x311
	.byte	0x1d
	.4byte	0x8f
	.byte	0x4c
	.byte	0xc
	.4byte	.LASF88
	.byte	0x4
	.2byte	0x312
	.byte	0x1d
	.4byte	0x8f
	.byte	0x50
	.byte	0xc
	.4byte	.LASF89
	.byte	0x4
	.2byte	0x313
	.byte	0x1d
	.4byte	0x8f
	.byte	0x54
	.byte	0xc
	.4byte	.LASF90
	.byte	0x4
	.2byte	0x314
	.byte	0x1d
	.4byte	0x8f
	.byte	0x58
	.byte	0xc
	.4byte	.LASF91
	.byte	0x4
	.2byte	0x315
	.byte	0x1d
	.4byte	0x8f
	.byte	0x5c
	.byte	0xc
	.4byte	.LASF92
	.byte	0x4
	.2byte	0x316
	.byte	0x1d
	.4byte	0x8f
	.byte	0x60
	.byte	0xc
	.4byte	.LASF93
	.byte	0x4
	.2byte	0x317
	.byte	0x1d
	.4byte	0x8f
	.byte	0x64
	.byte	0xc
	.4byte	.LASF94
	.byte	0x4
	.2byte	0x318
	.byte	0x1d
	.4byte	0x8f
	.byte	0x68
	.byte	0xc
	.4byte	.LASF95
	.byte	0x4
	.2byte	0x319
	.byte	0x13
	.4byte	0x465
	.byte	0x6c
	.byte	0xc
	.4byte	.LASF96
	.byte	0x4
	.2byte	0x31a
	.byte	0x1d
	.4byte	0x8f
	.byte	0xf0
	.byte	0
	.byte	0x10
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x5
	.byte	0x2e
	.byte	0x6
	.4byte	0x617
	.byte	0x11
	.4byte	.LASF97
	.byte	0
	.byte	0x11
	.4byte	.LASF98
	.byte	0x1
	.byte	0x11
	.4byte	.LASF99
	.byte	0x2
	.byte	0x11
	.4byte	.LASF100
	.byte	0x3
	.byte	0x11
	.4byte	.LASF101
	.byte	0x4
	.byte	0x11
	.4byte	.LASF102
	.byte	0x5
	.byte	0x11
	.4byte	.LASF103
	.byte	0x6
	.byte	0x11
	.4byte	.LASF104
	.byte	0x7
	.byte	0x11
	.4byte	.LASF105
	.byte	0x8
	.byte	0x11
	.4byte	.LASF106
	.byte	0x9
	.byte	0x11
	.4byte	.LASF107
	.byte	0xa
	.byte	0
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x6
	.2byte	0x42b
	.byte	0xe
	.4byte	0x64b
	.byte	0x11
	.4byte	.LASF108
	.byte	0
	.byte	0x11
	.4byte	.LASF109
	.byte	0x1
	.byte	0x11
	.4byte	.LASF110
	.byte	0x2
	.byte	0x11
	.4byte	.LASF111
	.byte	0x3
	.byte	0x11
	.4byte	.LASF112
	.byte	0x4
	.byte	0x11
	.4byte	.LASF113
	.byte	0x5
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF114
	.byte	0x10
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x7
	.byte	0x35
	.byte	0xe
	.4byte	0x685
	.byte	0x11
	.4byte	.LASF115
	.byte	0
	.byte	0x11
	.4byte	.LASF116
	.byte	0x1
	.byte	0x11
	.4byte	.LASF117
	.byte	0x2
	.byte	0x11
	.4byte	.LASF118
	.byte	0x3
	.byte	0x11
	.4byte	.LASF119
	.byte	0x4
	.byte	0x11
	.4byte	.LASF120
	.byte	0x5
	.byte	0
	.byte	0x13
	.4byte	0x94
	.byte	0x1
	.byte	0xa
	.byte	0xa
	.byte	0x5
	.byte	0x3
	.4byte	SystemCoreClock
	.byte	0x14
	.4byte	.LASF125
	.byte	0x1
	.byte	0x1e
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x6d4
	.byte	0x15
	.4byte	.LASF126
	.byte	0x1
	.byte	0x22
	.byte	0xe
	.4byte	0x7e
	.4byte	.LLST0
	.byte	0x16
	.4byte	0x6e6
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.byte	0x1
	.byte	0x34
	.byte	0x5
	.byte	0x17
	.4byte	.LVL3
	.4byte	0x6ef
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF127
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.byte	0x19
	.4byte	.LASF128
	.byte	0x1
	.byte	0xf
	.byte	0xd
	.byte	0x1
	.byte	0x1a
	.4byte	.LASF129
	.4byte	.LASF129
	.byte	0x1
	.byte	0xc
	.byte	0xd
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
	.byte	0xb
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
	.byte	0xb
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x13
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0
	.byte	0
	.byte	0x1a
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
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x5
	.byte	0x7e
	.byte	0
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF60:
	.string	"USBOTG_ID_DETECT_CON"
.LASF93:
	.string	"PMU_RD_LAT_CNT"
.LASF57:
	.string	"USBOTG_LINESTATE_DETECT_CON"
.LASF49:
	.string	"RESERVED00AC"
.LASF35:
	.string	"TSADC_CON"
.LASF20:
	.string	"RESERVED0028"
.LASF81:
	.string	"RESERVED002C"
.LASF121:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF88:
	.string	"PMU_STB_RD_HIT_CNT"
.LASF28:
	.string	"USBPHY_CON0"
.LASF29:
	.string	"USBPHY_CON1"
.LASF30:
	.string	"USBPHY_CON2"
.LASF31:
	.string	"USBPHY_CON3"
.LASF7:
	.string	"long long unsigned int"
.LASF97:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF115:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF109:
	.string	"GRF_PUL_INFO"
.LASF18:
	.string	"AUDIO_CON0"
.LASF19:
	.string	"AUDIO_CON1"
.LASF91:
	.string	"PMU_RD_MISS_PENALTY_CNT"
.LASF127:
	.string	"SystemCoreClockUpdate"
.LASF52:
	.string	"RESERVED00B8"
.LASF0:
	.string	"signed char"
.LASF83:
	.string	"RESERVED0034"
.LASF23:
	.string	"RESERVED0038"
.LASF59:
	.string	"USBOTG_BVALID_DETECT_CON"
.LASF107:
	.string	"PM_RUNTIME_TYPE_END"
.LASF4:
	.string	"long int"
.LASF55:
	.string	"USBOTG_SIG_DETECT_CLR"
.LASF6:
	.string	"long long int"
.LASF39:
	.string	"MEM_CON_DPRA"
.LASF42:
	.string	"BIU_CON0"
.LASF111:
	.string	"GRF_SRT_INFO"
.LASF80:
	.string	"CACHE_ERR_HADDR"
.LASF54:
	.string	"USBOTG_SIG_DETECT_STATUS"
.LASF101:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF50:
	.string	"MACPHY_CON0"
.LASF51:
	.string	"MACPHY_CON1"
.LASF123:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF87:
	.string	"PMU_HB_RD_HIT_CNT"
.LASF128:
	.string	"BssInit"
.LASF27:
	.string	"RESERVED004C"
.LASF56:
	.string	"RESERVED010C"
.LASF8:
	.string	"unsigned int"
.LASF90:
	.string	"PMU_WR_HIT_CNT"
.LASF124:
	.string	"SystemCoreClock"
.LASF122:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Source/Templates/system_rv1103b_mcu.c"
.LASF118:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF65:
	.string	"HPMCU_SRAM_ADDR_START"
.LASF62:
	.string	"CACHE_PERI_ADDR_START"
.LASF3:
	.string	"short unsigned int"
.LASF108:
	.string	"GRF_MUX_INFO"
.LASF24:
	.string	"USBOTG_STATUS0"
.LASF25:
	.string	"USBOTG_STATUS1"
.LASF26:
	.string	"USBOTG_STATUS2"
.LASF73:
	.string	"DCACHE_REG"
.LASF106:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF58:
	.string	"USBOTG_DISCONNECT_DETECT_CON"
.LASF99:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF96:
	.string	"REVISION"
.LASF119:
	.string	"PWR_CTRL_VOLT_ST"
.LASF64:
	.string	"HPMCU_CODE_ADDR_START"
.LASF63:
	.string	"CACHE_PERI_ADDR_END"
.LASF113:
	.string	"GRF_INFO_NUM"
.LASF16:
	.string	"PERI_STATUS"
.LASF74:
	.string	"CACHE_CTRL"
.LASF37:
	.string	"RESERVED007C"
.LASF75:
	.string	"CACHE_MAINTAIN"
.LASF44:
	.string	"BIU_STATUS0"
.LASF45:
	.string	"BIU_STATUS1"
.LASF89:
	.string	"PMU_RD_HIT_CNT"
.LASF33:
	.string	"RESERVED0064"
.LASF117:
	.string	"PWR_CTRL_PWR_EN"
.LASF69:
	.string	"RESERVED021C"
.LASF38:
	.string	"MEM_CON_SPRA"
.LASF95:
	.string	"RESERVED006C"
.LASF48:
	.string	"GMAC_ST"
.LASF100:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF32:
	.string	"USBPHY_STATUS"
.LASF72:
	.string	"GRF_SYS_REG"
.LASF125:
	.string	"SystemInit"
.LASF114:
	.string	"_Bool"
.LASF79:
	.string	"CACHE_INT_ST"
.LASF1:
	.string	"unsigned char"
.LASF12:
	.string	"PERI_CON0"
.LASF13:
	.string	"PERI_CON1"
.LASF14:
	.string	"PERI_CON2"
.LASF2:
	.string	"short int"
.LASF112:
	.string	"GRF_SMT_INFO"
.LASF116:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF85:
	.string	"PMU_WR_NUM_CNT"
.LASF66:
	.string	"HPMCU_EXSRAM_ADDR_START"
.LASF68:
	.string	"HPMCU_CACHE_STATUS"
.LASF120:
	.string	"PWR_CTRL_MAX"
.LASF40:
	.string	"MEM_CON_ROM"
.LASF110:
	.string	"GRF_DRV_INFO"
.LASF76:
	.string	"STB_TIMEOUT_CTRL"
.LASF11:
	.string	"uint32_t"
.LASF92:
	.string	"PMU_WR_MISS_PENALTY_CNT"
.LASF47:
	.string	"GMAC_CLK_CON"
.LASF36:
	.string	"OTP_CON"
.LASF5:
	.string	"long unsigned int"
.LASF41:
	.string	"MEM_CON_GATE"
.LASF9:
	.string	"char"
.LASF129:
	.string	"clear_bss"
.LASF103:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF78:
	.string	"CACHE_INT_EN"
.LASF10:
	.string	"__uint32_t"
.LASF46:
	.string	"GMAC_CON0"
.LASF94:
	.string	"PMU_WR_LAT_CNT"
.LASF15:
	.string	"PERI_HPROT2_CON"
.LASF61:
	.string	"RESERVED0120"
.LASF21:
	.string	"USBOTG_CON0"
.LASF22:
	.string	"USBOTG_CON1"
.LASF102:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF70:
	.string	"CHIP_ID"
.LASF126:
	.string	"status"
.LASF82:
	.string	"CACHE_STATUS"
.LASF84:
	.string	"PMU_RD_NUM_CNT"
.LASF67:
	.string	"HPMCU_CACHE_MISC"
.LASF77:
	.string	"RESERVED0010"
.LASF105:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF17:
	.string	"RESERVED0014"
.LASF104:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF86:
	.string	"PMU_SRAM_RD_HIT_CNT"
.LASF43:
	.string	"RESERVED0094"
.LASF53:
	.string	"USBOTG_SIG_DETECT_CON"
.LASF71:
	.string	"CHIP_VERSION"
.LASF34:
	.string	"SARADC_CON"
.LASF98:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
