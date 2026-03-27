	.file	"drv_pm.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rkpm_register_dvfs_info,"ax",@progbits
	.align	1
	.globl	rkpm_register_dvfs_info
	.type	rkpm_register_dvfs_info, @function
rkpm_register_dvfs_info:
.LFB33:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pm.c"
	.loc 1 441 1
	.cfi_startproc
.LVL0:
	.loc 1 442 1
	ret
	.cfi_endproc
.LFE33:
	.size	rkpm_register_dvfs_info, .-rkpm_register_dvfs_info
	.section	.text.pm_runtime_request,"ax",@progbits
	.align	1
	.globl	pm_runtime_request
	.type	pm_runtime_request, @function
pm_runtime_request:
.LFB34:
	.loc 1 445 1
	.cfi_startproc
.LVL1:
	.loc 1 446 1
	ret
	.cfi_endproc
.LFE34:
	.size	pm_runtime_request, .-pm_runtime_request
	.section	.text.pm_runtime_release,"ax",@progbits
	.align	1
	.globl	pm_runtime_release
	.type	pm_runtime_release, @function
pm_runtime_release:
.LFB39:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE39:
	.size	pm_runtime_release, .-pm_runtime_release
	.section	.text.rt_pm_runtime_enter,"ax",@progbits
	.align	1
	.globl	rt_pm_runtime_enter
	.type	rt_pm_runtime_enter, @function
rt_pm_runtime_enter:
.LFB36:
	.loc 1 453 1
	.cfi_startproc
	.loc 1 454 1
	ret
	.cfi_endproc
.LFE36:
	.size	rt_pm_runtime_enter, .-rt_pm_runtime_enter
	.section	.text.rk_rt_pm_init,"ax",@progbits
	.align	1
	.globl	rk_rt_pm_init
	.type	rk_rt_pm_init, @function
rk_rt_pm_init:
.LFB37:
	.loc 1 457 1
	.cfi_startproc
	.loc 1 458 5
	.loc 1 459 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE37:
	.size	rk_rt_pm_init, .-rk_rt_pm_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pmic.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm_regulator.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_regulator.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_dvfs.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xcc6
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF212
	.byte	0xc
	.4byte	.LASF213
	.4byte	.LASF214
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
	.byte	0x5
	.4byte	.LASF18
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0xe3
	.byte	0x6
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xe3
	.byte	0
	.byte	0x6
	.4byte	.LASF16
	.byte	0x2
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
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xb8
	.byte	0x5
	.4byte	.LASF19
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x13d
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x154
	.4byte	0x14d
	.byte	0xa
	.4byte	0x14d
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
	.byte	0x2
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1be
	.byte	0x6
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x1b3
	.byte	0x16
	.4byte	0xf6
	.byte	0
	.byte	0xb
	.string	"row"
	.byte	0x2
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1be
	.byte	0x14
	.byte	0x6
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1db
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x1d9
	.byte	0x20
	.byte	0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xac
	.byte	0x24
	.byte	0x6
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xac
	.byte	0x28
	.byte	0
	.byte	0x9
	.4byte	0xe9
	.4byte	0x1ce
	.byte	0xa
	.4byte	0x14d
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x1d9
	.byte	0xd
	.4byte	0x1d9
	.byte	0
	.byte	0xe
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1ce
	.byte	0x5
	.4byte	.LASF32
	.byte	0x80
	.byte	0x2
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x323
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x13d
	.byte	0
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x200
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x206
	.byte	0xf
	.4byte	0xe9
	.byte	0xc
	.byte	0x6
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x207
	.byte	0xf
	.4byte	0xe9
	.byte	0x14
	.byte	0xb
	.string	"sp"
	.byte	0x2
	.2byte	0x20a
	.byte	0xb
	.4byte	0x1d9
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x20b
	.byte	0xb
	.4byte	0x1d9
	.byte	0x20
	.byte	0x6
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x20c
	.byte	0xb
	.4byte	0x1d9
	.byte	0x24
	.byte	0x6
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x20d
	.byte	0xb
	.4byte	0x1d9
	.byte	0x28
	.byte	0x6
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x20e
	.byte	0x11
	.4byte	0x67
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x211
	.byte	0xe
	.4byte	0xa0
	.byte	0x30
	.byte	0x6
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x213
	.byte	0x10
	.4byte	0x41
	.byte	0x34
	.byte	0x6
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x216
	.byte	0x10
	.4byte	0x41
	.byte	0x35
	.byte	0x6
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x217
	.byte	0x10
	.4byte	0x41
	.byte	0x36
	.byte	0x6
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x21c
	.byte	0x11
	.4byte	0x67
	.byte	0x38
	.byte	0x6
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x220
	.byte	0x11
	.4byte	0x67
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x221
	.byte	0x10
	.4byte	0x41
	.byte	0x40
	.byte	0x6
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x22d
	.byte	0x10
	.4byte	0x94
	.byte	0x44
	.byte	0x6
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x22e
	.byte	0x10
	.4byte	0x94
	.byte	0x48
	.byte	0x6
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x236
	.byte	0x15
	.4byte	0x15b
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x238
	.byte	0xc
	.4byte	0x334
	.byte	0x78
	.byte	0x6
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x23f
	.byte	0x11
	.4byte	0x67
	.byte	0x7c
	.byte	0
	.byte	0xc
	.4byte	0x32e
	.byte	0xd
	.4byte	0x32e
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1e1
	.byte	0x7
	.byte	0x4
	.4byte	0x323
	.byte	0x5
	.4byte	.LASF49
	.byte	0x1c
	.byte	0x2
	.2byte	0x25b
	.byte	0x8
	.4byte	0x365
	.byte	0x6
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x25d
	.byte	0x16
	.4byte	0xf6
	.byte	0
	.byte	0x6
	.4byte	.LASF50
	.byte	0x2
	.2byte	0x25f
	.byte	0xf
	.4byte	0xe9
	.byte	0x14
	.byte	0
	.byte	0x5
	.4byte	.LASF51
	.byte	0x24
	.byte	0x2
	.2byte	0x273
	.byte	0x8
	.4byte	0x3ba
	.byte	0x6
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x275
	.byte	0x1a
	.4byte	0x33a
	.byte	0
	.byte	0x6
	.4byte	.LASF52
	.byte	0x2
	.2byte	0x277
	.byte	0x11
	.4byte	0x54
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x279
	.byte	0x10
	.4byte	0x41
	.byte	0x1e
	.byte	0x6
	.4byte	.LASF54
	.byte	0x2
	.2byte	0x27a
	.byte	0x10
	.4byte	0x41
	.byte	0x1f
	.byte	0x6
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x27c
	.byte	0x17
	.4byte	0x32e
	.byte	0x20
	.byte	0
	.byte	0x8
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x27e
	.byte	0x1a
	.4byte	0x3c7
	.byte	0x7
	.byte	0x4
	.4byte	0x365
	.byte	0x7
	.byte	0x4
	.4byte	0x154
	.byte	0x3
	.4byte	.LASF57
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x4d
	.byte	0x3
	.4byte	.LASF58
	.byte	0x3
	.byte	0x39
	.byte	0x1c
	.4byte	0x60
	.byte	0x3
	.4byte	.LASF59
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF60
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x3d3
	.byte	0x3
	.4byte	.LASF61
	.byte	0x4
	.byte	0x24
	.byte	0x14
	.4byte	0x3df
	.byte	0x3
	.4byte	.LASF62
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x3eb
	.byte	0xf
	.4byte	0x40f
	.byte	0x10
	.4byte	0x40f
	.byte	0x11
	.4byte	.LASF215
	.byte	0x7
	.byte	0x8
	.4byte	0x7a
	.byte	0x5
	.byte	0x9e
	.byte	0xe
	.4byte	0x67b
	.byte	0x12
	.4byte	.LASF63
	.byte	0
	.byte	0x12
	.4byte	.LASF64
	.byte	0x1
	.byte	0x12
	.4byte	.LASF65
	.byte	0x2
	.byte	0x12
	.4byte	.LASF66
	.byte	0x3
	.byte	0x12
	.4byte	.LASF67
	.byte	0x4
	.byte	0x12
	.4byte	.LASF68
	.byte	0x5
	.byte	0x12
	.4byte	.LASF69
	.byte	0x6
	.byte	0x12
	.4byte	.LASF70
	.byte	0x7
	.byte	0x12
	.4byte	.LASF71
	.byte	0x8
	.byte	0x13
	.4byte	.LASF72
	.4byte	0x2000000
	.byte	0x13
	.4byte	.LASF73
	.4byte	0x5040000
	.byte	0x13
	.4byte	.LASF74
	.4byte	0x50a0000
	.byte	0x13
	.4byte	.LASF75
	.4byte	0x3000001
	.byte	0x13
	.4byte	.LASF76
	.4byte	0x5000705
	.byte	0x13
	.4byte	.LASF77
	.4byte	0x2000070a
	.byte	0x14
	.4byte	.LASF78
	.8byte	0x208072000000000
	.byte	0x13
	.4byte	.LASF79
	.4byte	0x5050705
	.byte	0x13
	.4byte	.LASF80
	.4byte	0x2000070b
	.byte	0x14
	.4byte	.LASF81
	.8byte	0x20a072000000000
	.byte	0x13
	.4byte	.LASF82
	.4byte	0x50a0705
	.byte	0x13
	.4byte	.LASF83
	.4byte	0x2000070c
	.byte	0x14
	.4byte	.LASF84
	.8byte	0x20c072000000000
	.byte	0x13
	.4byte	.LASF85
	.4byte	0x5000714
	.byte	0x13
	.4byte	.LASF86
	.4byte	0x20000715
	.byte	0x14
	.4byte	.LASF87
	.8byte	0x20a072300000000
	.byte	0x14
	.4byte	.LASF88
	.8byte	0x10f071f0800071f
	.byte	0x14
	.4byte	.LASF89
	.8byte	0x10f072008000720
	.byte	0x14
	.4byte	.LASF90
	.8byte	0x10f072408000724
	.byte	0x14
	.4byte	.LASF91
	.8byte	0x10f072108000721
	.byte	0x14
	.4byte	.LASF92
	.8byte	0x109071f00000000
	.byte	0x14
	.4byte	.LASF93
	.8byte	0x20a071f00000000
	.byte	0x14
	.4byte	.LASF94
	.8byte	0x10c071f00000000
	.byte	0x14
	.4byte	.LASF95
	.8byte	0x100072200000000
	.byte	0x14
	.4byte	.LASF96
	.8byte	0x101072200000000
	.byte	0x14
	.4byte	.LASF97
	.8byte	0x202072200000000
	.byte	0x14
	.4byte	.LASF98
	.8byte	0x10c072200000000
	.byte	0x14
	.4byte	.LASF99
	.8byte	0x10d072200000000
	.byte	0x14
	.4byte	.LASF100
	.8byte	0x10e072200000000
	.byte	0x14
	.4byte	.LASF101
	.8byte	0x200072300000000
	.byte	0x14
	.4byte	.LASF102
	.8byte	0x202072300000000
	.byte	0x14
	.4byte	.LASF103
	.8byte	0x204072300000000
	.byte	0x14
	.4byte	.LASF104
	.8byte	0x108072300000000
	.byte	0x14
	.4byte	.LASF105
	.8byte	0x20c072300000000
	.byte	0x14
	.4byte	.LASF106
	.8byte	0x20e072300000000
	.byte	0x14
	.4byte	.LASF107
	.8byte	0x1070729030d0729
	.byte	0x13
	.4byte	.LASF108
	.4byte	0x5000728
	.byte	0x13
	.4byte	.LASF109
	.4byte	0x5080728
	.byte	0x14
	.4byte	.LASF110
	.8byte	0x106072800000000
	.byte	0x14
	.4byte	.LASF111
	.8byte	0x10e072800000000
	.byte	0x14
	.4byte	.LASF112
	.8byte	0x10e071e00000000
	.byte	0x13
	.4byte	.LASF113
	.4byte	0x2090725
	.byte	0x14
	.4byte	.LASF114
	.8byte	0x101030000000000
	.byte	0x14
	.4byte	.LASF115
	.8byte	0x103030000000000
	.byte	0x14
	.4byte	.LASF116
	.8byte	0x108090000000000
	.byte	0
	.byte	0x3
	.4byte	.LASF117
	.byte	0x5
	.byte	0xdd
	.byte	0x3
	.4byte	0x425
	.byte	0x15
	.byte	0x7
	.byte	0x4
	.4byte	0x14d
	.byte	0x6
	.byte	0x44
	.byte	0xe
	.4byte	0x74a
	.byte	0x12
	.4byte	.LASF118
	.byte	0
	.byte	0x12
	.4byte	.LASF119
	.byte	0x1
	.byte	0x12
	.4byte	.LASF120
	.byte	0x8
	.byte	0x12
	.4byte	.LASF121
	.byte	0x9
	.byte	0x12
	.4byte	.LASF122
	.byte	0x10
	.byte	0x12
	.4byte	.LASF123
	.byte	0x11
	.byte	0x12
	.4byte	.LASF124
	.byte	0x12
	.byte	0x12
	.4byte	.LASF125
	.byte	0x13
	.byte	0x12
	.4byte	.LASF126
	.byte	0x14
	.byte	0x12
	.4byte	.LASF127
	.byte	0x18
	.byte	0x12
	.4byte	.LASF128
	.byte	0x19
	.byte	0x12
	.4byte	.LASF129
	.byte	0x28
	.byte	0x12
	.4byte	.LASF130
	.byte	0x29
	.byte	0x12
	.4byte	.LASF131
	.byte	0x2a
	.byte	0x12
	.4byte	.LASF132
	.byte	0x2b
	.byte	0x12
	.4byte	.LASF133
	.byte	0x2c
	.byte	0x12
	.4byte	.LASF134
	.byte	0x2d
	.byte	0x12
	.4byte	.LASF135
	.byte	0x2e
	.byte	0x12
	.4byte	.LASF136
	.byte	0x2f
	.byte	0x12
	.4byte	.LASF137
	.byte	0x30
	.byte	0x12
	.4byte	.LASF138
	.byte	0x31
	.byte	0x12
	.4byte	.LASF139
	.byte	0x30
	.byte	0x12
	.4byte	.LASF140
	.byte	0x31
	.byte	0x12
	.4byte	.LASF141
	.byte	0x32
	.byte	0x12
	.4byte	.LASF142
	.byte	0x33
	.byte	0x12
	.4byte	.LASF143
	.byte	0x34
	.byte	0x12
	.4byte	.LASF144
	.byte	0x35
	.byte	0x12
	.4byte	.LASF145
	.byte	0x38
	.byte	0x12
	.4byte	.LASF146
	.byte	0x40
	.byte	0x12
	.4byte	.LASF147
	.byte	0x41
	.byte	0
	.byte	0x3
	.4byte	.LASF148
	.byte	0x6
	.byte	0x69
	.byte	0x3
	.4byte	0x687
	.byte	0x7
	.byte	0x4
	.4byte	0x41b
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF149
	.byte	0x16
	.4byte	.LASF150
	.byte	0x10
	.byte	0x7
	.byte	0x6b
	.byte	0x8
	.4byte	0x7a5
	.byte	0x17
	.4byte	.LASF151
	.byte	0x7
	.byte	0x6c
	.byte	0x12
	.4byte	0x14d
	.byte	0
	.byte	0x17
	.4byte	.LASF152
	.byte	0x7
	.byte	0x6d
	.byte	0x12
	.4byte	0x14d
	.byte	0x4
	.byte	0x17
	.4byte	.LASF153
	.byte	0x7
	.byte	0x6e
	.byte	0x12
	.4byte	0x14d
	.byte	0x8
	.byte	0x17
	.4byte	.LASF154
	.byte	0x7
	.byte	0x6f
	.byte	0x12
	.4byte	0x14d
	.byte	0xc
	.byte	0
	.byte	0x16
	.4byte	.LASF155
	.byte	0x8
	.byte	0x7
	.byte	0x72
	.byte	0x8
	.4byte	0x7cd
	.byte	0x17
	.4byte	.LASF156
	.byte	0x7
	.byte	0x73
	.byte	0x9
	.4byte	0x81
	.byte	0
	.byte	0x17
	.4byte	.LASF35
	.byte	0x7
	.byte	0x74
	.byte	0x1e
	.4byte	0x7cd
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x763
	.byte	0x18
	.4byte	.LASF182
	.byte	0x8
	.byte	0x7
	.byte	0x77
	.byte	0x7
	.4byte	0x805
	.byte	0x19
	.4byte	.LASF157
	.byte	0x7
	.byte	0x78
	.byte	0x9
	.4byte	0x81
	.byte	0x19
	.4byte	.LASF158
	.byte	0x7
	.byte	0x79
	.byte	0x15
	.4byte	0x805
	.byte	0x19
	.4byte	.LASF159
	.byte	0x7
	.byte	0x7a
	.byte	0x23
	.4byte	0x7a5
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x420
	.byte	0x16
	.4byte	.LASF160
	.byte	0x2
	.byte	0x7
	.byte	0x7d
	.byte	0x8
	.4byte	0x839
	.byte	0x1a
	.4byte	.LASF161
	.byte	0x7
	.byte	0x7e
	.byte	0xe
	.4byte	0x403
	.byte	0x2
	.byte	0x8
	.byte	0x8
	.byte	0
	.byte	0x1a
	.4byte	.LASF162
	.byte	0x7
	.byte	0x7f
	.byte	0xe
	.4byte	0x403
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF163
	.byte	0x30
	.byte	0x7
	.byte	0x82
	.byte	0x8
	.4byte	0x8af
	.byte	0x17
	.4byte	.LASF164
	.byte	0x7
	.byte	0x83
	.byte	0x1a
	.4byte	0x80b
	.byte	0
	.byte	0x17
	.4byte	.LASF22
	.byte	0x7
	.byte	0x84
	.byte	0xe
	.4byte	0x403
	.byte	0x2
	.byte	0x17
	.4byte	.LASF165
	.byte	0x7
	.byte	0x85
	.byte	0xd
	.4byte	0x3f7
	.byte	0x4
	.byte	0x17
	.4byte	.LASF166
	.byte	0x7
	.byte	0x86
	.byte	0xd
	.4byte	0x3f7
	.byte	0x5
	.byte	0x17
	.4byte	.LASF167
	.byte	0x7
	.byte	0x87
	.byte	0x18
	.4byte	0x8af
	.byte	0x8
	.byte	0x17
	.4byte	.LASF168
	.byte	0x7
	.byte	0x88
	.byte	0xd
	.4byte	0x8bf
	.byte	0x1c
	.byte	0x17
	.4byte	.LASF169
	.byte	0x7
	.byte	0x89
	.byte	0xe
	.4byte	0x40f
	.byte	0x24
	.byte	0x17
	.4byte	.LASF170
	.byte	0x7
	.byte	0x8a
	.byte	0x1b
	.4byte	0x7d3
	.byte	0x28
	.byte	0
	.byte	0x9
	.4byte	0x756
	.4byte	0x8bf
	.byte	0xa
	.4byte	0x14d
	.byte	0x4
	.byte	0
	.byte	0x9
	.4byte	0x3f7
	.4byte	0x8cf
	.byte	0xa
	.4byte	0x14d
	.byte	0x4
	.byte	0
	.byte	0x16
	.4byte	.LASF171
	.byte	0xc
	.byte	0x8
	.byte	0x1d
	.byte	0x8
	.4byte	0x904
	.byte	0x1b
	.string	"bus"
	.byte	0x8
	.byte	0x1f
	.byte	0x1f
	.4byte	0x909
	.byte	0
	.byte	0x17
	.4byte	.LASF20
	.byte	0x8
	.byte	0x20
	.byte	0xb
	.4byte	0x3cd
	.byte	0x4
	.byte	0x17
	.4byte	.LASF172
	.byte	0x8
	.byte	0x21
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0
	.byte	0x1c
	.4byte	.LASF216
	.byte	0x7
	.byte	0x4
	.4byte	0x904
	.byte	0x16
	.4byte	.LASF173
	.byte	0x24
	.byte	0x8
	.byte	0x24
	.byte	0x8
	.4byte	0x992
	.byte	0x17
	.4byte	.LASF164
	.byte	0x8
	.byte	0x26
	.byte	0x1a
	.4byte	0x80b
	.byte	0
	.byte	0x17
	.4byte	.LASF22
	.byte	0x8
	.byte	0x27
	.byte	0xe
	.4byte	0x403
	.byte	0x2
	.byte	0x17
	.4byte	.LASF165
	.byte	0x8
	.byte	0x28
	.byte	0xd
	.4byte	0x3f7
	.byte	0x4
	.byte	0x17
	.4byte	.LASF166
	.byte	0x8
	.byte	0x29
	.byte	0xd
	.4byte	0x3f7
	.byte	0x5
	.byte	0x1b
	.string	"i2c"
	.byte	0x8
	.byte	0x2a
	.byte	0x1a
	.4byte	0x992
	.byte	0x8
	.byte	0x17
	.4byte	.LASF168
	.byte	0x8
	.byte	0x2b
	.byte	0xd
	.4byte	0x8bf
	.byte	0xc
	.byte	0x1b
	.string	"reg"
	.byte	0x8
	.byte	0x2c
	.byte	0xd
	.4byte	0x8bf
	.byte	0x11
	.byte	0x17
	.4byte	.LASF169
	.byte	0x8
	.byte	0x2d
	.byte	0xe
	.4byte	0x40f
	.byte	0x18
	.byte	0x17
	.4byte	.LASF170
	.byte	0x8
	.byte	0x2e
	.byte	0x1b
	.4byte	0x7d3
	.byte	0x1c
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x8cf
	.byte	0x16
	.4byte	.LASF174
	.byte	0xc
	.byte	0x9
	.byte	0x1b
	.byte	0x8
	.4byte	0x9cd
	.byte	0x17
	.4byte	.LASF20
	.byte	0x9
	.byte	0x1d
	.byte	0xb
	.4byte	0x3cd
	.byte	0
	.byte	0x17
	.4byte	.LASF175
	.byte	0x9
	.byte	0x1e
	.byte	0xe
	.4byte	0x40f
	.byte	0x4
	.byte	0x17
	.4byte	.LASF176
	.byte	0x9
	.byte	0x1f
	.byte	0x9
	.4byte	0x75c
	.byte	0x8
	.byte	0
	.byte	0x16
	.4byte	.LASF177
	.byte	0x1c
	.byte	0x9
	.byte	0x22
	.byte	0x8
	.4byte	0xa43
	.byte	0x17
	.4byte	.LASF164
	.byte	0x9
	.byte	0x24
	.byte	0x1a
	.4byte	0x80b
	.byte	0
	.byte	0x17
	.4byte	.LASF22
	.byte	0x9
	.byte	0x25
	.byte	0xe
	.4byte	0x403
	.byte	0x2
	.byte	0x17
	.4byte	.LASF161
	.byte	0x9
	.byte	0x26
	.byte	0xe
	.4byte	0x403
	.byte	0x4
	.byte	0x17
	.4byte	.LASF178
	.byte	0x9
	.byte	0x27
	.byte	0xe
	.4byte	0x40f
	.byte	0x8
	.byte	0x17
	.4byte	.LASF169
	.byte	0x9
	.byte	0x28
	.byte	0xe
	.4byte	0x40f
	.byte	0xc
	.byte	0x17
	.4byte	.LASF179
	.byte	0x9
	.byte	0x29
	.byte	0xe
	.4byte	0x40f
	.byte	0x10
	.byte	0x17
	.4byte	.LASF180
	.byte	0x9
	.byte	0x2a
	.byte	0xe
	.4byte	0x40f
	.byte	0x14
	.byte	0x1b
	.string	"pwm"
	.byte	0x9
	.byte	0x2b
	.byte	0x1f
	.4byte	0xa43
	.byte	0x18
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x998
	.byte	0x3
	.4byte	.LASF181
	.byte	0xa
	.byte	0x19
	.byte	0x14
	.4byte	0x3ba
	.byte	0x18
	.4byte	.LASF183
	.byte	0x30
	.byte	0xa
	.byte	0x24
	.byte	0x7
	.4byte	0xa87
	.byte	0x19
	.4byte	.LASF184
	.byte	0xa
	.byte	0x26
	.byte	0x1c
	.4byte	0x839
	.byte	0x19
	.4byte	.LASF185
	.byte	0xa
	.byte	0x27
	.byte	0x1c
	.4byte	0x90f
	.byte	0x19
	.4byte	.LASF186
	.byte	0xa
	.byte	0x28
	.byte	0x19
	.4byte	0x9cd
	.byte	0
	.byte	0x16
	.4byte	.LASF187
	.byte	0x40
	.byte	0xa
	.byte	0x2b
	.byte	0x8
	.4byte	0xae3
	.byte	0x17
	.4byte	.LASF22
	.byte	0xa
	.byte	0x2d
	.byte	0xd
	.4byte	0x3f7
	.byte	0
	.byte	0x17
	.4byte	.LASF188
	.byte	0xa
	.byte	0x2e
	.byte	0x1a
	.4byte	0xa55
	.byte	0x4
	.byte	0x17
	.4byte	.LASF189
	.byte	0xa
	.byte	0x2f
	.byte	0x17
	.4byte	0xa49
	.byte	0x34
	.byte	0x17
	.4byte	.LASF190
	.byte	0xa
	.byte	0x30
	.byte	0xe
	.4byte	0x403
	.byte	0x38
	.byte	0x17
	.4byte	.LASF191
	.byte	0xa
	.byte	0x31
	.byte	0xe
	.4byte	0x403
	.byte	0x3a
	.byte	0x17
	.4byte	.LASF192
	.byte	0xa
	.byte	0x32
	.byte	0xe
	.4byte	0x40f
	.byte	0x3c
	.byte	0
	.byte	0x16
	.4byte	.LASF193
	.byte	0x8
	.byte	0xb
	.byte	0x49
	.byte	0x8
	.4byte	0xb0b
	.byte	0x17
	.4byte	.LASF194
	.byte	0xb
	.byte	0x4b
	.byte	0xe
	.4byte	0x40f
	.byte	0
	.byte	0x17
	.4byte	.LASF195
	.byte	0xb
	.byte	0x4c
	.byte	0xe
	.4byte	0x40f
	.byte	0x4
	.byte	0
	.byte	0x10
	.4byte	0xae3
	.byte	0x7
	.byte	0x4
	.4byte	0xa87
	.byte	0x16
	.4byte	.LASF196
	.byte	0x18
	.byte	0xb
	.byte	0x6a
	.byte	0x8
	.4byte	0xb72
	.byte	0x17
	.4byte	.LASF197
	.byte	0xb
	.byte	0x6d
	.byte	0x11
	.4byte	0x67b
	.byte	0
	.byte	0x17
	.4byte	.LASF198
	.byte	0xb
	.byte	0x6f
	.byte	0xd
	.4byte	0x3f7
	.byte	0x8
	.byte	0x17
	.4byte	.LASF199
	.byte	0xb
	.byte	0x70
	.byte	0x1c
	.4byte	0xb10
	.byte	0xc
	.byte	0x17
	.4byte	.LASF200
	.byte	0xb
	.byte	0x71
	.byte	0xd
	.4byte	0x3f7
	.byte	0x10
	.byte	0x17
	.4byte	.LASF201
	.byte	0xb
	.byte	0x72
	.byte	0xd
	.4byte	0x3f7
	.byte	0x11
	.byte	0x17
	.4byte	.LASF202
	.byte	0xb
	.byte	0x73
	.byte	0x1e
	.4byte	0xb72
	.byte	0x14
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xb0b
	.byte	0x1d
	.byte	0x4
	.byte	0xc
	.byte	0x36
	.byte	0x5
	.4byte	0xb92
	.byte	0x1a
	.4byte	.LASF203
	.byte	0xc
	.byte	0x38
	.byte	0x12
	.4byte	0x40f
	.byte	0x4
	.byte	0x4
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF204
	.byte	0x18
	.byte	0xc
	.byte	0x2f
	.byte	0x8
	.4byte	0xbee
	.byte	0x17
	.4byte	.LASF197
	.byte	0xc
	.byte	0x32
	.byte	0x11
	.4byte	0x67b
	.byte	0
	.byte	0x17
	.4byte	.LASF205
	.byte	0xc
	.byte	0x34
	.byte	0x1a
	.4byte	0xbee
	.byte	0x8
	.byte	0x17
	.4byte	.LASF206
	.byte	0xc
	.byte	0x35
	.byte	0xd
	.4byte	0x3f7
	.byte	0xc
	.byte	0x17
	.4byte	.LASF207
	.byte	0xc
	.byte	0x39
	.byte	0x7
	.4byte	0xb78
	.byte	0x10
	.byte	0x17
	.4byte	.LASF208
	.byte	0xc
	.byte	0x3a
	.byte	0xd
	.4byte	0xbf4
	.byte	0x14
	.byte	0x17
	.4byte	.LASF209
	.byte	0xc
	.byte	0x3b
	.byte	0xd
	.4byte	0x3f7
	.byte	0x15
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xb16
	.byte	0x9
	.4byte	0x3f7
	.4byte	0xc04
	.byte	0xa
	.4byte	0x14d
	.byte	0
	.byte	0
	.byte	0x1e
	.4byte	.LASF217
	.byte	0x1
	.2byte	0x1c8
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.byte	0x1f
	.4byte	.LASF218
	.byte	0x1
	.2byte	0x1c4
	.byte	0x6
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.byte	0x20
	.4byte	.LASF219
	.byte	0x1
	.2byte	0x1c0
	.byte	0x6
	.4byte	0xc49
	.byte	0x21
	.4byte	.LASF210
	.byte	0x1
	.2byte	0x1c0
	.byte	0x28
	.4byte	0x74a
	.byte	0
	.byte	0x22
	.4byte	.LASF220
	.byte	0x1
	.2byte	0x1bc
	.byte	0x6
	.byte	0x1
	.4byte	0xc65
	.byte	0x21
	.4byte	.LASF210
	.byte	0x1
	.2byte	0x1bc
	.byte	0x28
	.4byte	0x74a
	.byte	0
	.byte	0x23
	.4byte	.LASF221
	.byte	0x1
	.2byte	0x1b8
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0xc9b
	.byte	0x24
	.4byte	.LASF205
	.byte	0x1
	.2byte	0x1b8
	.byte	0x33
	.4byte	0xc9b
	.byte	0x1
	.byte	0x5a
	.byte	0x24
	.4byte	.LASF211
	.byte	0x1
	.2byte	0x1b8
	.byte	0x40
	.4byte	0xcac
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xb92
	.byte	0xc
	.4byte	0xcac
	.byte	0xd
	.4byte	0x40f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xca1
	.byte	0x25
	.4byte	0xc49
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.byte	0x26
	.4byte	0xc57
	.byte	0x1
	.byte	0x5a
	.byte	0
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
	.byte	0xc
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0x49
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
	.byte	0xb
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x7
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
	.byte	0x17
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
	.byte	0x18
	.byte	0x17
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
	.byte	0x19
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
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0xb
	.byte	0xb
	.byte	0xd
	.byte	0xb
	.byte	0xc
	.byte	0xb
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x1c
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x13
	.byte	0x1
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x5
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
	.byte	0x22
	.byte	0x2e
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x2e
	.byte	0x1
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
	.byte	0x24
	.byte	0x5
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF96:
	.string	"CLK_I2C_PERI"
.LASF48:
	.string	"user_data"
.LASF187:
	.string	"regulator_desc"
.LASF128:
	.string	"PM_RUNTIME_ID_SDIO"
.LASF91:
	.string	"SCLK_SFC_2X"
.LASF107:
	.string	"MCLK_SAI_OUT2IO"
.LASF171:
	.string	"pwr_i2c_desc"
.LASF76:
	.string	"CLK_UART0_SRC"
.LASF117:
	.string	"eCLOCK_Name"
.LASF199:
	.string	"pwr_desc"
.LASF13:
	.string	"rt_err_t"
.LASF152:
	.string	"minSel"
.LASF57:
	.string	"__uint8_t"
.LASF16:
	.string	"prev"
.LASF177:
	.string	"pwr_pwm_desc"
.LASF212:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF21:
	.string	"type"
.LASF87:
	.string	"MCLK_SAI"
.LASF178:
	.string	"period"
.LASF26:
	.string	"rt_timer"
.LASF35:
	.string	"entry"
.LASF10:
	.string	"long long unsigned int"
.LASF170:
	.string	"volt_list"
.LASF95:
	.string	"CLK_I2C_PMU"
.LASF125:
	.string	"PM_RUNTIME_ID_ADC"
.LASF180:
	.string	"voltage"
.LASF15:
	.string	"next"
.LASF86:
	.string	"CLK_SAI_FRAC"
.LASF211:
	.string	"pm_func"
.LASF139:
	.string	"PM_RUNTIME_ID_I2C0"
.LASF0:
	.string	"signed char"
.LASF194:
	.string	"freq"
.LASF34:
	.string	"tlist"
.LASF155:
	.string	"PWR_LINEAR_RANGE_TABLE"
.LASF195:
	.string	"volt"
.LASF45:
	.string	"remaining_tick"
.LASF51:
	.string	"rt_mutex"
.LASF216:
	.string	"rt_i2c_bus_device"
.LASF201:
	.string	"tbl_cnt"
.LASF27:
	.string	"parent"
.LASF5:
	.string	"rt_uint8_t"
.LASF179:
	.string	"maxVlot"
.LASF83:
	.string	"CLK_UART2_FRAC"
.LASF206:
	.string	"clk_req_id"
.LASF129:
	.string	"PM_RUNTIME_ID_UART0"
.LASF130:
	.string	"PM_RUNTIME_ID_UART1"
.LASF131:
	.string	"PM_RUNTIME_ID_UART2"
.LASF132:
	.string	"PM_RUNTIME_ID_UART3"
.LASF133:
	.string	"PM_RUNTIME_ID_UART4"
.LASF134:
	.string	"PM_RUNTIME_ID_UART5"
.LASF135:
	.string	"PM_RUNTIME_ID_UART6"
.LASF136:
	.string	"PM_RUNTIME_ID_UART7"
.LASF137:
	.string	"PM_RUNTIME_ID_UART8"
.LASF3:
	.string	"long long int"
.LASF61:
	.string	"uint16_t"
.LASF165:
	.string	"voltMask"
.LASF115:
	.string	"LSCLK_VI_ROOT"
.LASF168:
	.string	"shift"
.LASF190:
	.string	"setup_fixed"
.LASF58:
	.string	"__uint16_t"
.LASF214:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF106:
	.string	"CLK_COUNTER_PWM0"
.LASF82:
	.string	"CLK_UART2_SRC"
.LASF43:
	.string	"event_set"
.LASF207:
	.string	"ctrl"
.LASF156:
	.string	"nEntry"
.LASF17:
	.string	"rt_list_t"
.LASF52:
	.string	"value"
.LASF64:
	.string	"PLL_GPLL"
.LASF122:
	.string	"PM_RUNTIME_ID_I2S"
.LASF157:
	.string	"stepVolt"
.LASF24:
	.string	"unsigned int"
.LASF72:
	.string	"PCLK_PERI_ROOT"
.LASF98:
	.string	"CLK_PWM0"
.LASF99:
	.string	"CLK_PWM1"
.LASF100:
	.string	"CLK_PWM2"
.LASF56:
	.string	"rt_mutex_t"
.LASF213:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pm.c"
.LASF80:
	.string	"CLK_UART1_FRAC"
.LASF220:
	.string	"pm_runtime_request"
.LASF73:
	.string	"CLK_TSADC"
.LASF182:
	.string	"U_PWR_VOLT_LIST"
.LASF20:
	.string	"name"
.LASF75:
	.string	"CLK_SARADC"
.LASF7:
	.string	"short unsigned int"
.LASF89:
	.string	"CCLK_SDMMC0"
.LASF90:
	.string	"CCLK_SDMMC1"
.LASF146:
	.string	"PM_RUNTIME_ID_CIF"
.LASF162:
	.string	"enCnt"
.LASF198:
	.string	"pwr_id"
.LASF6:
	.string	"rt_uint16_t"
.LASF221:
	.string	"rkpm_register_dvfs_info"
.LASF210:
	.string	"runTimeId"
.LASF183:
	.string	"U_PWR_REG_DESC"
.LASF44:
	.string	"event_info"
.LASF145:
	.string	"PM_RUNTIME_ID_SPI"
.LASF53:
	.string	"original_priority"
.LASF1:
	.string	"short int"
.LASF101:
	.string	"DCLK_DECOM"
.LASF127:
	.string	"PM_RUNTIME_ID_USB"
.LASF111:
	.string	"CLK_MIPI1_OUT2IO"
.LASF50:
	.string	"suspend_thread"
.LASF197:
	.string	"clk_id"
.LASF166:
	.string	"voltCnt"
.LASF67:
	.string	"CLK_I2C0"
.LASF68:
	.string	"CLK_I2C1"
.LASF69:
	.string	"CLK_I2C2"
.LASF70:
	.string	"CLK_I2C3"
.LASF71:
	.string	"CLK_I2C4"
.LASF163:
	.string	"PWR_INTREG_DESC"
.LASF192:
	.string	"currentVolt"
.LASF8:
	.string	"rt_uint32_t"
.LASF186:
	.string	"pwm_desc"
.LASF184:
	.string	"intreg_desc"
.LASF217:
	.string	"rk_rt_pm_init"
.LASF188:
	.string	"desc"
.LASF12:
	.string	"rt_ubase_t"
.LASF116:
	.string	"SCLK_SFC_2X_PMU1"
.LASF66:
	.string	"TCLK_WDT_S"
.LASF181:
	.string	"regulator_mutex_t"
.LASF93:
	.string	"ACLK_PERI_SRC"
.LASF47:
	.string	"cleanup"
.LASF113:
	.string	"CLK_ISP_GPLL_SRC"
.LASF88:
	.string	"CCLK_EMMC"
.LASF14:
	.string	"rt_tick_t"
.LASF41:
	.string	"init_priority"
.LASF74:
	.string	"CLK_TSADC_TSEN"
.LASF191:
	.string	"setup_step"
.LASF40:
	.string	"current_priority"
.LASF159:
	.string	"linearTables"
.LASF38:
	.string	"error"
.LASF32:
	.string	"rt_thread"
.LASF215:
	.string	"CLOCK_Name"
.LASF42:
	.string	"number_mask"
.LASF205:
	.string	"dvfs"
.LASF97:
	.string	"CLK_SPI0"
.LASF108:
	.string	"CLK_REF_MIPI0_SRC"
.LASF172:
	.string	"addr"
.LASF149:
	.string	"_Bool"
.LASF140:
	.string	"PM_RUNTIME_ID_I2C1"
.LASF4:
	.string	"unsigned char"
.LASF208:
	.string	"run_tbl_idx"
.LASF143:
	.string	"PM_RUNTIME_ID_I2C4"
.LASF144:
	.string	"PM_RUNTIME_ID_I2C5"
.LASF79:
	.string	"CLK_UART1_SRC"
.LASF141:
	.string	"PM_RUNTIME_ID_I2C2"
.LASF142:
	.string	"PM_RUNTIME_ID_I2C3"
.LASF203:
	.string	"cur_tbl_idx"
.LASF164:
	.string	"info"
.LASF103:
	.string	"CLK_PKA_CRYPTO"
.LASF202:
	.string	"table"
.LASF219:
	.string	"pm_runtime_release"
.LASF209:
	.string	"sleep_tbl_idx"
.LASF46:
	.string	"thread_timer"
.LASF22:
	.string	"flag"
.LASF167:
	.string	"preg"
.LASF147:
	.string	"PM_RUNTIME_ID_END"
.LASF158:
	.string	"voltTable"
.LASF193:
	.string	"dvfs_table"
.LASF174:
	.string	"pwr_pwm_info_desc"
.LASF62:
	.string	"uint32_t"
.LASF126:
	.string	"PM_RUNTIME_ID_DMA"
.LASF55:
	.string	"owner"
.LASF123:
	.string	"PM_RUNTIME_ID_I2S1"
.LASF124:
	.string	"PM_RUNTIME_ID_I2S2"
.LASF9:
	.string	"long unsigned int"
.LASF25:
	.string	"char"
.LASF110:
	.string	"CLK_MIPI0_OUT2IO"
.LASF138:
	.string	"PM_RUNTIME_ID_UART9"
.LASF49:
	.string	"rt_ipc_object"
.LASF120:
	.string	"PM_RUNTIME_ID_VOP"
.LASF185:
	.string	"i2c_desc"
.LASF148:
	.string	"ePM_RUNTIME_ID"
.LASF200:
	.string	"tbl_idx"
.LASF102:
	.string	"CLK_CORE_CRYPTO"
.LASF59:
	.string	"__uint32_t"
.LASF19:
	.string	"rt_object"
.LASF118:
	.string	"PM_RUNTIME_ID_INTF_INVLD"
.LASF121:
	.string	"PM_RUNTIME_ID_MIPI"
.LASF65:
	.string	"TCLK_WDT_NS"
.LASF114:
	.string	"CLK_CORE_ISP"
.LASF160:
	.string	"PWR_CTRL_INFO"
.LASF29:
	.string	"parameter"
.LASF85:
	.string	"CLK_SAI_SRC"
.LASF150:
	.string	"PWR_LINEAR_RANGE"
.LASF175:
	.string	"chanel"
.LASF169:
	.string	"minVolt"
.LASF105:
	.string	"CLK_FREQ_PWM0"
.LASF11:
	.string	"rt_base_t"
.LASF151:
	.string	"minUV"
.LASF54:
	.string	"hold"
.LASF28:
	.string	"timeout_func"
.LASF204:
	.string	"pm_mode_dvfs"
.LASF60:
	.string	"uint8_t"
.LASF173:
	.string	"pwr_i2cbus_desc"
.LASF33:
	.string	"flags"
.LASF30:
	.string	"init_tick"
.LASF153:
	.string	"maxSel"
.LASF37:
	.string	"stack_size"
.LASF92:
	.string	"LSCLK_PERI_SRC"
.LASF39:
	.string	"stat"
.LASF36:
	.string	"stack_addr"
.LASF161:
	.string	"pwrId"
.LASF77:
	.string	"CLK_UART0_FRAC"
.LASF112:
	.string	"DCLK_VICAP_SRC"
.LASF109:
	.string	"CLK_REF_MIPI1_SRC"
.LASF196:
	.string	"rk_dvfs_desc"
.LASF18:
	.string	"rt_list_node"
.LASF2:
	.string	"long int"
.LASF94:
	.string	"HCLK_HPMCU_SRC"
.LASF23:
	.string	"list"
.LASF63:
	.string	"CLK_INVALID"
.LASF189:
	.string	"lock"
.LASF31:
	.string	"timeout_tick"
.LASF218:
	.string	"rt_pm_runtime_enter"
.LASF78:
	.string	"CLK_UART0"
.LASF81:
	.string	"CLK_UART1"
.LASF84:
	.string	"CLK_UART2"
.LASF104:
	.string	"CLK_CORE_RGA"
.LASF176:
	.string	"invert"
.LASF154:
	.string	"uVStep"
.LASF119:
	.string	"PM_RUNTIME_ID_SPI_APB"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
