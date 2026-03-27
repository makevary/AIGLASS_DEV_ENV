	.file	"board.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.cif_hw_config.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"sensor_0"
	.section	.text.cif_hw_config,"ax",@progbits
	.align	1
	.globl	cif_hw_config
	.type	cif_hw_config, @function
cif_hw_config:
.LFB51:
	.file 1 "board/rv1103b_evb2-SC200AI-ADC/board.c"
	.loc 1 53 1
	.cfi_startproc
	.loc 1 54 5
.LVL0:
	.loc 1 55 5
	.loc 1 56 5
	.loc 1 58 5
	.loc 1 58 23 is_stmt 0
	lla	a5,csi2_dphy_board
	.loc 1 61 38
	li	a4,2
	sb	a4,6(a5)
	.loc 1 62 43
	lla	a4,.LC0
	srli	a2,a4,8
	.loc 1 58 23
	li	a3,1
	.loc 1 62 43
	sb	a4,11(a5)
	sb	a2,12(a5)
	srli	a2,a4,16
	srli	a4,a4,24
	.loc 1 58 23
	sb	a3,0(a5)
	.loc 1 59 5 is_stmt 1
	.loc 1 59 34 is_stmt 0
	sb	a3,10(a5)
	.loc 1 60 5 is_stmt 1
	.loc 1 60 40 is_stmt 0
	sb	zero,5(a5)
	.loc 1 61 5 is_stmt 1
	.loc 1 61 38 is_stmt 0
	sb	zero,7(a5)
	sb	zero,8(a5)
	sb	zero,9(a5)
	.loc 1 62 5 is_stmt 1
	.loc 1 62 43 is_stmt 0
	sb	a2,13(a5)
	sb	a4,14(a5)
	.loc 1 64 5 is_stmt 1
	.loc 1 64 24 is_stmt 0
	sb	a3,csi2_host0_board+1,a5
	.loc 1 66 5 is_stmt 1
	.loc 1 66 19 is_stmt 0
	sb	a3,vicap_board,a5
	.loc 1 67 1
	ret
	.cfi_endproc
.LFE51:
	.size	cif_hw_config, .-cif_hw_config
	.globl	camera_sc200ai
	.section	.rodata.camera_sc200ai,"a"
	.align	2
	.type	camera_sc200ai, @object
	.size	camera_sc200ai, 222
camera_sc200ai:
	.word	8192
	.word	542244864
	.word	64
	.word	545521664
	.zero	8
	.word	0
	.word	17172264
	.word	28772
	.string	"sensor_0"
	.zero	3
	.string	"i2c4"
	.zero	7
	.byte	48
	.byte	2
	.byte	2
	.byte	0
	.zero	44
	.byte	0
	.byte	1
	.zero	1
	.zero	111
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/../camera/camera.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/drv_isp3.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb55
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF232
	.byte	0xc
	.4byte	.LASF233
	.4byte	.LASF234
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
	.byte	0x4
	.4byte	0x6b
	.byte	0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2b
	.byte	0x17
	.4byte	0x41
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x78
	.byte	0x5
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x84
	.byte	0x6
	.4byte	0x9c
	.byte	0x7
	.4byte	0xa8
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF14
	.byte	0x8
	.4byte	0x6b
	.4byte	0xc9
	.byte	0x9
	.4byte	0x64
	.byte	0xb
	.byte	0
	.byte	0x8
	.4byte	0x9c
	.4byte	0xd9
	.byte	0x9
	.4byte	0x64
	.byte	0x1
	.byte	0
	.byte	0xa
	.4byte	.LASF169
	.2byte	0x128
	.byte	0x4
	.2byte	0x1e6
	.byte	0x8
	.4byte	0x35b
	.byte	0xb
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x1e7
	.byte	0x17
	.4byte	0xa8
	.byte	0
	.byte	0xb
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x1e8
	.byte	0x17
	.4byte	0xa8
	.byte	0x4
	.byte	0xb
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1e9
	.byte	0x17
	.4byte	0xa8
	.byte	0x8
	.byte	0xb
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1ea
	.byte	0x17
	.4byte	0xa8
	.byte	0xc
	.byte	0xb
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1eb
	.byte	0x17
	.4byte	0xa8
	.byte	0x10
	.byte	0xb
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1ec
	.byte	0x17
	.4byte	0xa8
	.byte	0x14
	.byte	0xb
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1ed
	.byte	0x17
	.4byte	0xa8
	.byte	0x18
	.byte	0xb
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1ee
	.byte	0x17
	.4byte	0xa8
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x1ef
	.byte	0x17
	.4byte	0xa8
	.byte	0x20
	.byte	0xb
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x1f0
	.byte	0x17
	.4byte	0xa8
	.byte	0x24
	.byte	0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x1f1
	.byte	0x17
	.4byte	0xa8
	.byte	0x28
	.byte	0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x1f2
	.byte	0x17
	.4byte	0xa8
	.byte	0x2c
	.byte	0xb
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x1f3
	.byte	0x17
	.4byte	0xa8
	.byte	0x30
	.byte	0xb
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x1f4
	.byte	0x17
	.4byte	0xa8
	.byte	0x34
	.byte	0xb
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x1f5
	.byte	0x17
	.4byte	0xa8
	.byte	0x38
	.byte	0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x1f6
	.byte	0x17
	.4byte	0xa8
	.byte	0x3c
	.byte	0xb
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x1f7
	.byte	0x17
	.4byte	0xa8
	.byte	0x40
	.byte	0xb
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x1f8
	.byte	0x17
	.4byte	0xa8
	.byte	0x44
	.byte	0xb
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x1f9
	.byte	0x17
	.4byte	0xa8
	.byte	0x48
	.byte	0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x1fa
	.byte	0x13
	.4byte	0x9c
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x1fb
	.byte	0x1d
	.4byte	0xad
	.byte	0x50
	.byte	0xb
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x1fc
	.byte	0x13
	.4byte	0x9c
	.byte	0x54
	.byte	0xb
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x1fd
	.byte	0x1d
	.4byte	0xad
	.byte	0x58
	.byte	0xb
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x1fe
	.byte	0x13
	.4byte	0x9c
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x1ff
	.byte	0x17
	.4byte	0xa8
	.byte	0x60
	.byte	0xb
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x200
	.byte	0x17
	.4byte	0xa8
	.byte	0x64
	.byte	0xb
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x201
	.byte	0x13
	.4byte	0xc9
	.byte	0x68
	.byte	0xb
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x202
	.byte	0x1d
	.4byte	0xad
	.byte	0x70
	.byte	0xb
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x203
	.byte	0x13
	.4byte	0x9c
	.byte	0x74
	.byte	0xb
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x204
	.byte	0x1d
	.4byte	0xad
	.byte	0x78
	.byte	0xb
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x205
	.byte	0x13
	.4byte	0x9c
	.byte	0x7c
	.byte	0xb
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x206
	.byte	0x17
	.4byte	0xa8
	.byte	0x80
	.byte	0xb
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x207
	.byte	0x17
	.4byte	0xa8
	.byte	0x84
	.byte	0xb
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x208
	.byte	0x13
	.4byte	0x35b
	.byte	0x88
	.byte	0xc
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x209
	.byte	0x17
	.4byte	0xa8
	.2byte	0x100
	.byte	0xc
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x20a
	.byte	0x17
	.4byte	0xa8
	.2byte	0x104
	.byte	0xc
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x20b
	.byte	0x17
	.4byte	0xa8
	.2byte	0x108
	.byte	0xc
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x20c
	.byte	0x13
	.4byte	0x9c
	.2byte	0x10c
	.byte	0xc
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x20d
	.byte	0x17
	.4byte	0xa8
	.2byte	0x110
	.byte	0xc
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x20e
	.byte	0x17
	.4byte	0xa8
	.2byte	0x114
	.byte	0xc
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x20f
	.byte	0x17
	.4byte	0xa8
	.2byte	0x118
	.byte	0xc
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x210
	.byte	0x17
	.4byte	0xa8
	.2byte	0x11c
	.byte	0xc
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x211
	.byte	0x17
	.4byte	0xa8
	.2byte	0x120
	.byte	0xc
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x212
	.byte	0x17
	.4byte	0xa8
	.2byte	0x124
	.byte	0
	.byte	0x8
	.4byte	0x9c
	.4byte	0x36b
	.byte	0x9
	.4byte	0x64
	.byte	0x1d
	.byte	0
	.byte	0xd
	.4byte	.LASF199
	.byte	0x7
	.byte	0x8
	.4byte	0x56
	.byte	0x5
	.byte	0x9e
	.byte	0xe
	.4byte	0x5c1
	.byte	0xe
	.4byte	.LASF59
	.byte	0
	.byte	0xe
	.4byte	.LASF60
	.byte	0x1
	.byte	0xe
	.4byte	.LASF61
	.byte	0x2
	.byte	0xe
	.4byte	.LASF62
	.byte	0x3
	.byte	0xe
	.4byte	.LASF63
	.byte	0x4
	.byte	0xe
	.4byte	.LASF64
	.byte	0x5
	.byte	0xe
	.4byte	.LASF65
	.byte	0x6
	.byte	0xe
	.4byte	.LASF66
	.byte	0x7
	.byte	0xe
	.4byte	.LASF67
	.byte	0x8
	.byte	0xf
	.4byte	.LASF68
	.4byte	0x2000000
	.byte	0xf
	.4byte	.LASF69
	.4byte	0x5040000
	.byte	0xf
	.4byte	.LASF70
	.4byte	0x50a0000
	.byte	0xf
	.4byte	.LASF71
	.4byte	0x3000001
	.byte	0xf
	.4byte	.LASF72
	.4byte	0x5000705
	.byte	0xf
	.4byte	.LASF73
	.4byte	0x2000070a
	.byte	0x10
	.4byte	.LASF74
	.8byte	0x208072000000000
	.byte	0xf
	.4byte	.LASF75
	.4byte	0x5050705
	.byte	0xf
	.4byte	.LASF76
	.4byte	0x2000070b
	.byte	0x10
	.4byte	.LASF77
	.8byte	0x20a072000000000
	.byte	0xf
	.4byte	.LASF78
	.4byte	0x50a0705
	.byte	0xf
	.4byte	.LASF79
	.4byte	0x2000070c
	.byte	0x10
	.4byte	.LASF80
	.8byte	0x20c072000000000
	.byte	0xf
	.4byte	.LASF81
	.4byte	0x5000714
	.byte	0xf
	.4byte	.LASF82
	.4byte	0x20000715
	.byte	0x10
	.4byte	.LASF83
	.8byte	0x20a072300000000
	.byte	0x10
	.4byte	.LASF84
	.8byte	0x10f071f0800071f
	.byte	0x10
	.4byte	.LASF85
	.8byte	0x10f072008000720
	.byte	0x10
	.4byte	.LASF86
	.8byte	0x10f072408000724
	.byte	0x10
	.4byte	.LASF87
	.8byte	0x10f072108000721
	.byte	0x10
	.4byte	.LASF88
	.8byte	0x109071f00000000
	.byte	0x10
	.4byte	.LASF89
	.8byte	0x20a071f00000000
	.byte	0x10
	.4byte	.LASF90
	.8byte	0x10c071f00000000
	.byte	0x10
	.4byte	.LASF91
	.8byte	0x100072200000000
	.byte	0x10
	.4byte	.LASF92
	.8byte	0x101072200000000
	.byte	0x10
	.4byte	.LASF93
	.8byte	0x202072200000000
	.byte	0x10
	.4byte	.LASF94
	.8byte	0x10c072200000000
	.byte	0x10
	.4byte	.LASF95
	.8byte	0x10d072200000000
	.byte	0x10
	.4byte	.LASF96
	.8byte	0x10e072200000000
	.byte	0x10
	.4byte	.LASF97
	.8byte	0x200072300000000
	.byte	0x10
	.4byte	.LASF98
	.8byte	0x202072300000000
	.byte	0x10
	.4byte	.LASF99
	.8byte	0x204072300000000
	.byte	0x10
	.4byte	.LASF100
	.8byte	0x108072300000000
	.byte	0x10
	.4byte	.LASF101
	.8byte	0x20c072300000000
	.byte	0x10
	.4byte	.LASF102
	.8byte	0x20e072300000000
	.byte	0x10
	.4byte	.LASF103
	.8byte	0x1070729030d0729
	.byte	0xf
	.4byte	.LASF104
	.4byte	0x5000728
	.byte	0xf
	.4byte	.LASF105
	.4byte	0x5080728
	.byte	0x10
	.4byte	.LASF106
	.8byte	0x106072800000000
	.byte	0x10
	.4byte	.LASF107
	.8byte	0x10e072800000000
	.byte	0x10
	.4byte	.LASF108
	.8byte	0x10e071e00000000
	.byte	0xf
	.4byte	.LASF109
	.4byte	0x2090725
	.byte	0x10
	.4byte	.LASF110
	.8byte	0x101030000000000
	.byte	0x10
	.4byte	.LASF111
	.8byte	0x103030000000000
	.byte	0x10
	.4byte	.LASF112
	.8byte	0x108090000000000
	.byte	0
	.byte	0x5
	.4byte	.LASF113
	.byte	0x5
	.byte	0xdd
	.byte	0x3
	.4byte	0x36b
	.byte	0x11
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x6
	.byte	0x2e
	.byte	0x6
	.4byte	0x61e
	.byte	0xe
	.4byte	.LASF114
	.byte	0
	.byte	0xe
	.4byte	.LASF115
	.byte	0x1
	.byte	0xe
	.4byte	.LASF116
	.byte	0x2
	.byte	0xe
	.4byte	.LASF117
	.byte	0x3
	.byte	0xe
	.4byte	.LASF118
	.byte	0x4
	.byte	0xe
	.4byte	.LASF119
	.byte	0x5
	.byte	0xe
	.4byte	.LASF120
	.byte	0x6
	.byte	0xe
	.4byte	.LASF121
	.byte	0x7
	.byte	0xe
	.4byte	.LASF122
	.byte	0x8
	.byte	0xe
	.4byte	.LASF123
	.byte	0x9
	.byte	0xe
	.4byte	.LASF124
	.byte	0xa
	.byte	0
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x7
	.2byte	0x42b
	.byte	0xe
	.4byte	0x652
	.byte	0xe
	.4byte	.LASF125
	.byte	0
	.byte	0xe
	.4byte	.LASF126
	.byte	0x1
	.byte	0xe
	.4byte	.LASF127
	.byte	0x2
	.byte	0xe
	.4byte	.LASF128
	.byte	0x3
	.byte	0xe
	.4byte	.LASF129
	.byte	0x4
	.byte	0xe
	.4byte	.LASF130
	.byte	0x5
	.byte	0
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x7
	.2byte	0x448
	.byte	0xe
	.4byte	0x75a
	.byte	0xe
	.4byte	.LASF131
	.byte	0x1
	.byte	0xe
	.4byte	.LASF132
	.byte	0x2
	.byte	0xe
	.4byte	.LASF133
	.byte	0x4
	.byte	0xe
	.4byte	.LASF134
	.byte	0x8
	.byte	0xe
	.4byte	.LASF135
	.byte	0x10
	.byte	0xe
	.4byte	.LASF136
	.byte	0x20
	.byte	0xe
	.4byte	.LASF137
	.byte	0x40
	.byte	0xe
	.4byte	.LASF138
	.byte	0x80
	.byte	0x13
	.4byte	.LASF139
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF140
	.2byte	0x200
	.byte	0x13
	.4byte	.LASF141
	.2byte	0x400
	.byte	0x13
	.4byte	.LASF142
	.2byte	0x800
	.byte	0x13
	.4byte	.LASF143
	.2byte	0x1000
	.byte	0x13
	.4byte	.LASF144
	.2byte	0x2000
	.byte	0x13
	.4byte	.LASF145
	.2byte	0x4000
	.byte	0x13
	.4byte	.LASF146
	.2byte	0x8000
	.byte	0xf
	.4byte	.LASF147
	.4byte	0x10000
	.byte	0xf
	.4byte	.LASF148
	.4byte	0x20000
	.byte	0xf
	.4byte	.LASF149
	.4byte	0x40000
	.byte	0xf
	.4byte	.LASF150
	.4byte	0x80000
	.byte	0xf
	.4byte	.LASF151
	.4byte	0x100000
	.byte	0xf
	.4byte	.LASF152
	.4byte	0x200000
	.byte	0xf
	.4byte	.LASF153
	.4byte	0x400000
	.byte	0xf
	.4byte	.LASF154
	.4byte	0x800000
	.byte	0xf
	.4byte	.LASF155
	.4byte	0x1000000
	.byte	0xf
	.4byte	.LASF156
	.4byte	0x2000000
	.byte	0xf
	.4byte	.LASF157
	.4byte	0x4000000
	.byte	0xf
	.4byte	.LASF158
	.4byte	0x8000000
	.byte	0xf
	.4byte	.LASF159
	.4byte	0x10000000
	.byte	0xf
	.4byte	.LASF160
	.4byte	0x20000000
	.byte	0xf
	.4byte	.LASF161
	.4byte	0x40000000
	.byte	0xf
	.4byte	.LASF162
	.4byte	0x80000000
	.byte	0
	.byte	0x11
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x8
	.byte	0x35
	.byte	0xe
	.4byte	0x78d
	.byte	0xe
	.4byte	.LASF163
	.byte	0
	.byte	0xe
	.4byte	.LASF164
	.byte	0x1
	.byte	0xe
	.4byte	.LASF165
	.byte	0x2
	.byte	0xe
	.4byte	.LASF166
	.byte	0x3
	.byte	0xe
	.4byte	.LASF167
	.byte	0x4
	.byte	0xe
	.4byte	.LASF168
	.byte	0x5
	.byte	0
	.byte	0x14
	.4byte	.LASF170
	.byte	0x8
	.byte	0x9
	.byte	0xac
	.byte	0x8
	.4byte	0x7b5
	.byte	0x15
	.4byte	.LASF171
	.byte	0x9
	.byte	0xae
	.byte	0xe
	.4byte	0x9c
	.byte	0
	.byte	0x15
	.4byte	.LASF172
	.byte	0x9
	.byte	0xaf
	.byte	0x16
	.4byte	0x7b5
	.byte	0x4
	.byte	0
	.byte	0x4
	.byte	0x4
	.4byte	0xd9
	.byte	0x14
	.4byte	.LASF173
	.byte	0x6f
	.byte	0x9
	.byte	0xc3
	.byte	0x8
	.4byte	0x90e
	.byte	0x15
	.4byte	.LASF174
	.byte	0x9
	.byte	0xc5
	.byte	0x16
	.4byte	0x78d
	.byte	0
	.byte	0x15
	.4byte	.LASF175
	.byte	0x9
	.byte	0xc6
	.byte	0x16
	.4byte	0x78d
	.byte	0x8
	.byte	0x15
	.4byte	.LASF176
	.byte	0x9
	.byte	0xc7
	.byte	0x16
	.4byte	0x78d
	.byte	0x10
	.byte	0x15
	.4byte	.LASF177
	.byte	0x9
	.byte	0xc8
	.byte	0x11
	.4byte	0x5c1
	.byte	0x18
	.byte	0x15
	.4byte	.LASF178
	.byte	0x9
	.byte	0xc9
	.byte	0xe
	.4byte	0x9c
	.byte	0x20
	.byte	0x15
	.4byte	.LASF179
	.byte	0x9
	.byte	0xca
	.byte	0xa
	.4byte	0xb9
	.byte	0x24
	.byte	0x15
	.4byte	.LASF180
	.byte	0x9
	.byte	0xcb
	.byte	0xa
	.4byte	0xb9
	.byte	0x30
	.byte	0x15
	.4byte	.LASF181
	.byte	0x9
	.byte	0xcc
	.byte	0xd
	.4byte	0x90
	.byte	0x3c
	.byte	0x15
	.4byte	.LASF182
	.byte	0x9
	.byte	0xcd
	.byte	0xd
	.4byte	0x90
	.byte	0x3d
	.byte	0x15
	.4byte	.LASF183
	.byte	0x9
	.byte	0xce
	.byte	0xd
	.4byte	0x90
	.byte	0x3e
	.byte	0x15
	.4byte	.LASF184
	.byte	0x9
	.byte	0xcf
	.byte	0xd
	.4byte	0x90
	.byte	0x3f
	.byte	0x15
	.4byte	.LASF185
	.byte	0x9
	.byte	0xd0
	.byte	0xe
	.4byte	0x9c
	.byte	0x40
	.byte	0x15
	.4byte	.LASF186
	.byte	0x9
	.byte	0xd1
	.byte	0xe
	.4byte	0x9c
	.byte	0x44
	.byte	0x15
	.4byte	.LASF187
	.byte	0x9
	.byte	0xd2
	.byte	0xe
	.4byte	0x9c
	.byte	0x48
	.byte	0x15
	.4byte	.LASF188
	.byte	0x9
	.byte	0xd3
	.byte	0xe
	.4byte	0x9c
	.byte	0x4c
	.byte	0x15
	.4byte	.LASF189
	.byte	0x9
	.byte	0xd4
	.byte	0xe
	.4byte	0x9c
	.byte	0x50
	.byte	0x15
	.4byte	.LASF190
	.byte	0x9
	.byte	0xd5
	.byte	0xe
	.4byte	0x9c
	.byte	0x54
	.byte	0x15
	.4byte	.LASF191
	.byte	0x9
	.byte	0xd6
	.byte	0xe
	.4byte	0x9c
	.byte	0x58
	.byte	0x15
	.4byte	.LASF192
	.byte	0x9
	.byte	0xd7
	.byte	0xe
	.4byte	0x9c
	.byte	0x5c
	.byte	0x15
	.4byte	.LASF193
	.byte	0x9
	.byte	0xd8
	.byte	0xe
	.4byte	0x9c
	.byte	0x60
	.byte	0x15
	.4byte	.LASF194
	.byte	0x9
	.byte	0xd9
	.byte	0xe
	.4byte	0x9c
	.byte	0x64
	.byte	0x15
	.4byte	.LASF195
	.byte	0x9
	.byte	0xda
	.byte	0xe
	.4byte	0x9c
	.byte	0x68
	.byte	0x15
	.4byte	.LASF196
	.byte	0x9
	.byte	0xdb
	.byte	0x9
	.4byte	0xb2
	.byte	0x6c
	.byte	0x15
	.4byte	.LASF197
	.byte	0x9
	.byte	0xdc
	.byte	0x9
	.4byte	0xb2
	.byte	0x6d
	.byte	0x15
	.4byte	.LASF198
	.byte	0x9
	.byte	0xdd
	.byte	0x9
	.4byte	0xb2
	.byte	0x6e
	.byte	0
	.byte	0x7
	.4byte	0x7bb
	.byte	0x16
	.4byte	.LASF200
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0x9
	.2byte	0x114
	.byte	0x6
	.4byte	0x945
	.byte	0xe
	.4byte	.LASF201
	.byte	0
	.byte	0xe
	.4byte	.LASF202
	.byte	0x1
	.byte	0xe
	.4byte	.LASF203
	.byte	0x2
	.byte	0xe
	.4byte	.LASF204
	.byte	0x3
	.byte	0xe
	.4byte	.LASF205
	.byte	0x3
	.byte	0
	.byte	0x8
	.4byte	0x90e
	.4byte	0x950
	.byte	0x17
	.byte	0
	.byte	0x7
	.4byte	0x945
	.byte	0x18
	.4byte	.LASF225
	.byte	0x9
	.2byte	0x11c
	.byte	0x27
	.4byte	0x950
	.byte	0xd
	.4byte	.LASF206
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0xa
	.byte	0xe2
	.byte	0xe
	.4byte	0x987
	.byte	0xe
	.4byte	.LASF207
	.byte	0
	.byte	0xe
	.4byte	.LASF208
	.byte	0x1
	.byte	0xe
	.4byte	.LASF209
	.byte	0x2
	.byte	0
	.byte	0x16
	.4byte	.LASF210
	.byte	0x7
	.byte	0x4
	.4byte	0x64
	.byte	0xa
	.2byte	0x14b
	.byte	0xe
	.4byte	0x9b3
	.byte	0xe
	.4byte	.LASF211
	.byte	0
	.byte	0xe
	.4byte	.LASF212
	.byte	0x1
	.byte	0xe
	.4byte	.LASF213
	.byte	0x2
	.byte	0xe
	.4byte	.LASF214
	.byte	0x3
	.byte	0
	.byte	0x19
	.4byte	.LASF215
	.byte	0xa
	.byte	0xa
	.2byte	0x154
	.byte	0x8
	.4byte	0x9fa
	.byte	0xb
	.4byte	.LASF216
	.byte	0xa
	.2byte	0x156
	.byte	0x9
	.4byte	0xb2
	.byte	0
	.byte	0xb
	.4byte	.LASF217
	.byte	0xa
	.2byte	0x157
	.byte	0x9
	.4byte	0x5d
	.byte	0x1
	.byte	0xb
	.4byte	.LASF218
	.byte	0xa
	.2byte	0x158
	.byte	0x9
	.4byte	0xb2
	.byte	0x5
	.byte	0xb
	.4byte	.LASF179
	.byte	0xa
	.2byte	0x159
	.byte	0xb
	.4byte	0x72
	.byte	0x6
	.byte	0
	.byte	0x19
	.4byte	.LASF219
	.byte	0x19
	.byte	0xa
	.2byte	0x15e
	.byte	0x8
	.4byte	0xa41
	.byte	0xb
	.4byte	.LASF218
	.byte	0xa
	.2byte	0x160
	.byte	0x9
	.4byte	0xb2
	.byte	0
	.byte	0x1a
	.string	"reg"
	.byte	0xa
	.2byte	0x161
	.byte	0xe
	.4byte	0x9c
	.byte	0x1
	.byte	0xb
	.4byte	.LASF220
	.byte	0xa
	.2byte	0x162
	.byte	0x16
	.4byte	0x9b3
	.byte	0x5
	.byte	0xb
	.4byte	.LASF221
	.byte	0xa
	.2byte	0x163
	.byte	0x16
	.4byte	0x9b3
	.byte	0xf
	.byte	0
	.byte	0x19
	.4byte	.LASF222
	.byte	0xe
	.byte	0xa
	.2byte	0x168
	.byte	0x8
	.4byte	0xa96
	.byte	0xb
	.4byte	.LASF216
	.byte	0xa
	.2byte	0x16a
	.byte	0x9
	.4byte	0xb2
	.byte	0
	.byte	0xb
	.4byte	.LASF218
	.byte	0xa
	.2byte	0x16b
	.byte	0x9
	.4byte	0xb2
	.byte	0x1
	.byte	0xb
	.4byte	.LASF223
	.byte	0xa
	.2byte	0x16c
	.byte	0xb
	.4byte	0x72
	.byte	0x2
	.byte	0xb
	.4byte	.LASF179
	.byte	0xa
	.2byte	0x16d
	.byte	0xb
	.4byte	0x72
	.byte	0x6
	.byte	0x1a
	.string	"reg"
	.byte	0xa
	.2byte	0x16e
	.byte	0xe
	.4byte	0x9c
	.byte	0xa
	.byte	0
	.byte	0x19
	.4byte	.LASF224
	.byte	0x5
	.byte	0xa
	.2byte	0x173
	.byte	0x8
	.4byte	0xac1
	.byte	0xb
	.4byte	.LASF218
	.byte	0xa
	.2byte	0x175
	.byte	0x9
	.4byte	0xb2
	.byte	0
	.byte	0x1a
	.string	"reg"
	.byte	0xa
	.2byte	0x176
	.byte	0xe
	.4byte	0x9c
	.byte	0x1
	.byte	0
	.byte	0x18
	.4byte	.LASF226
	.byte	0xa
	.2byte	0x17a
	.byte	0x1f
	.4byte	0x9fa
	.byte	0x18
	.4byte	.LASF227
	.byte	0xa
	.2byte	0x17b
	.byte	0x1f
	.4byte	0xa41
	.byte	0x18
	.4byte	.LASF228
	.byte	0xa
	.2byte	0x17d
	.byte	0x20
	.4byte	0xa96
	.byte	0x4
	.byte	0x4
	.4byte	0x9fa
	.byte	0x4
	.byte	0x4
	.4byte	0xa41
	.byte	0x4
	.byte	0x4
	.4byte	0xa96
	.byte	0x8
	.4byte	0x90e
	.4byte	0xb0a
	.byte	0x9
	.4byte	0x64
	.byte	0x1
	.byte	0
	.byte	0x7
	.4byte	0xafa
	.byte	0x1b
	.4byte	0x955
	.byte	0x1
	.byte	0x17
	.byte	0x20
	.4byte	0xb0a
	.byte	0x5
	.byte	0x3
	.4byte	camera_sc200ai
	.byte	0x1c
	.4byte	.LASF235
	.byte	0x1
	.byte	0x34
	.byte	0x6
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.byte	0x1d
	.4byte	.LASF229
	.byte	0x1
	.byte	0x36
	.byte	0x1d
	.4byte	0xae8
	.byte	0x1d
	.4byte	.LASF230
	.byte	0x1
	.byte	0x37
	.byte	0x1d
	.4byte	0xaee
	.byte	0x1d
	.4byte	.LASF231
	.byte	0x1
	.byte	0x38
	.byte	0x1e
	.4byte	0xaf4
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x26
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x5
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
	.byte	0x17
	.byte	0x21
	.byte	0
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0
	.byte	0
	.byte	0x1d
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
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF92:
	.string	"CLK_I2C_PERI"
.LASF151:
	.string	"GPIO_PIN_C4"
.LASF152:
	.string	"GPIO_PIN_C5"
.LASF153:
	.string	"GPIO_PIN_C6"
.LASF154:
	.string	"GPIO_PIN_C7"
.LASF87:
	.string	"SCLK_SFC_2X"
.LASF202:
	.string	"SC200AI_1920X1080_60FPS"
.LASF72:
	.string	"CLK_UART0_SRC"
.LASF113:
	.string	"eCLOCK_Name"
.LASF192:
	.string	"dst_height"
.LASF165:
	.string	"PWR_CTRL_PWR_EN"
.LASF56:
	.string	"GPIO_REG_GROUP2_H"
.LASF195:
	.string	"dst_hdr_mode"
.LASF55:
	.string	"GPIO_REG_GROUP2_L"
.LASF79:
	.string	"CLK_UART2_FRAC"
.LASF10:
	.string	"__uint8_t"
.LASF232:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF114:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF83:
	.string	"MCLK_SAI"
.LASF223:
	.string	"subdev_name"
.LASF91:
	.string	"CLK_I2C_PMU"
.LASF193:
	.string	"dst_pixelcode"
.LASF203:
	.string	"SC200AI_1920X1080"
.LASF163:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF214:
	.string	"RK_ISP_BUF_RDBK_MAX"
.LASF126:
	.string	"GRF_PUL_INFO"
.LASF155:
	.string	"GPIO_PIN_D0"
.LASF156:
	.string	"GPIO_PIN_D1"
.LASF157:
	.string	"GPIO_PIN_D2"
.LASF158:
	.string	"GPIO_PIN_D3"
.LASF159:
	.string	"GPIO_PIN_D4"
.LASF160:
	.string	"GPIO_PIN_D5"
.LASF161:
	.string	"GPIO_PIN_D6"
.LASF162:
	.string	"GPIO_PIN_D7"
.LASF235:
	.string	"cif_hw_config"
.LASF0:
	.string	"signed char"
.LASF51:
	.string	"GPIO_VIRTUAL_EN"
.LASF16:
	.string	"SWPORT_DR_H"
.LASF7:
	.string	"long long unsigned int"
.LASF15:
	.string	"SWPORT_DR_L"
.LASF171:
	.string	"gpio_pin"
.LASF65:
	.string	"CLK_I2C2"
.LASF44:
	.string	"VER_ID"
.LASF40:
	.string	"PORT_EOI_H"
.LASF41:
	.string	"RESERVED0068"
.LASF2:
	.string	"long int"
.LASF39:
	.string	"PORT_EOI_L"
.LASF54:
	.string	"GPIO_REG_GROUP1_H"
.LASF228:
	.string	"vicap_board"
.LASF3:
	.string	"long long int"
.LASF53:
	.string	"GPIO_REG_GROUP1_L"
.LASF218:
	.string	"enable"
.LASF111:
	.string	"LSCLK_VI_ROOT"
.LASF167:
	.string	"PWR_CTRL_VOLT_ST"
.LASF58:
	.string	"GPIO_REG_GROUP3_H"
.LASF118:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF180:
	.string	"i2c_bus"
.LASF234:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF102:
	.string	"CLK_COUNTER_PWM0"
.LASF78:
	.string	"CLK_UART2_SRC"
.LASF229:
	.string	"csi2_dphy"
.LASF190:
	.string	"hdr_mode"
.LASF174:
	.string	"rst_gpio"
.LASF24:
	.string	"INT_TYPE_H"
.LASF60:
	.string	"PLL_GPLL"
.LASF196:
	.string	"rst_active"
.LASF104:
	.string	"CLK_REF_MIPI0_SRC"
.LASF23:
	.string	"INT_TYPE_L"
.LASF34:
	.string	"RESERVED004C"
.LASF8:
	.string	"unsigned int"
.LASF141:
	.string	"GPIO_PIN_B2"
.LASF130:
	.string	"GRF_INFO_NUM"
.LASF133:
	.string	"GPIO_PIN_A2"
.LASF68:
	.string	"PCLK_PERI_ROOT"
.LASF94:
	.string	"CLK_PWM0"
.LASF95:
	.string	"CLK_PWM1"
.LASF96:
	.string	"CLK_PWM2"
.LASF181:
	.string	"i2c_addr"
.LASF22:
	.string	"INT_MASK_H"
.LASF6:
	.string	"long unsigned int"
.LASF21:
	.string	"INT_MASK_L"
.LASF170:
	.string	"gpio_desc"
.LASF76:
	.string	"CLK_UART1_FRAC"
.LASF191:
	.string	"dst_width"
.LASF69:
	.string	"CLK_TSADC"
.LASF212:
	.string	"RK_ISP_BUF_RDBK_M"
.LASF185:
	.string	"width"
.LASF71:
	.string	"CLK_SARADC"
.LASF5:
	.string	"short unsigned int"
.LASF128:
	.string	"GRF_SRT_INFO"
.LASF42:
	.string	"EXT_PORT"
.LASF85:
	.string	"CCLK_SDMMC0"
.LASF125:
	.string	"GRF_MUX_INFO"
.LASF177:
	.string	"mclk_id"
.LASF123:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF36:
	.string	"RESERVED0054"
.LASF116:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF81:
	.string	"CLK_SAI_SRC"
.LASF231:
	.string	"vicap"
.LASF97:
	.string	"DCLK_DECOM"
.LASF38:
	.string	"RESERVED005C"
.LASF207:
	.string	"ISP_COLOR_Y"
.LASF107:
	.string	"CLK_MIPI1_OUT2IO"
.LASF63:
	.string	"CLK_I2C0"
.LASF64:
	.string	"CLK_I2C1"
.LASF222:
	.string	"csi2_board_desc"
.LASF66:
	.string	"CLK_I2C3"
.LASF67:
	.string	"CLK_I2C4"
.LASF201:
	.string	"SC200AI_960X540"
.LASF26:
	.string	"INT_POLARITY_H"
.LASF45:
	.string	"RESERVED007C"
.LASF25:
	.string	"INT_POLARITY_L"
.LASF227:
	.string	"csi2_host0_board"
.LASF220:
	.string	"csi2_dphy1"
.LASF221:
	.string	"csi2_dphy2"
.LASF166:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF216:
	.string	"csi_host_idx"
.LASF215:
	.string	"dphy_desc"
.LASF84:
	.string	"CCLK_EMMC"
.LASF30:
	.string	"DEBOUNCE_H"
.LASF50:
	.string	"GPIO_REG_GROUP_H"
.LASF183:
	.string	"gain_valid_delay"
.LASF49:
	.string	"GPIO_REG_GROUP_L"
.LASF112:
	.string	"SCLK_SFC_2X_PMU1"
.LASF29:
	.string	"DEBOUNCE_L"
.LASF62:
	.string	"TCLK_WDT_S"
.LASF32:
	.string	"DBCLK_DIV_EN_H"
.LASF33:
	.string	"DBCLK_DIV_CON"
.LASF89:
	.string	"ACLK_PERI_SRC"
.LASF109:
	.string	"CLK_ISP_GPLL_SRC"
.LASF213:
	.string	"RK_ISP_BUF_RDBK_S"
.LASF173:
	.string	"camera_board_desc"
.LASF230:
	.string	"csi_host_0"
.LASF148:
	.string	"GPIO_PIN_C1"
.LASF70:
	.string	"CLK_TSADC_TSEN"
.LASF139:
	.string	"GPIO_PIN_B0"
.LASF233:
	.string	"board/rv1103b_evb2-SC200AI-ADC/board.c"
.LASF117:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF169:
	.string	"GPIO_REG"
.LASF194:
	.string	"dst_maxfps"
.LASF48:
	.string	"RESERVED0088"
.LASF199:
	.string	"CLOCK_Name"
.LASF52:
	.string	"RESERVED010C"
.LASF146:
	.string	"GPIO_PIN_B7"
.LASF208:
	.string	"ISP_COLOR_CBCR"
.LASF28:
	.string	"INT_BOTHEDGE_H"
.LASF14:
	.string	"_Bool"
.LASF27:
	.string	"INT_BOTHEDGE_L"
.LASF75:
	.string	"CLK_UART1_SRC"
.LASF198:
	.string	"pwren_active"
.LASF1:
	.string	"short int"
.LASF101:
	.string	"CLK_FREQ_PWM0"
.LASF99:
	.string	"CLK_PKA_CRYPTO"
.LASF129:
	.string	"GRF_SMT_INFO"
.LASF164:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF86:
	.string	"CCLK_SDMMC1"
.LASF172:
	.string	"gpio_group"
.LASF43:
	.string	"RESERVED0074"
.LASF35:
	.string	"INT_STATUS"
.LASF189:
	.string	"lanes"
.LASF200:
	.string	"sc200ai_support_mode_id"
.LASF211:
	.string	"RK_ISP_BUF_RDBK_L"
.LASF182:
	.string	"time_valid_delay"
.LASF82:
	.string	"CLK_SAI_FRAC"
.LASF184:
	.string	"mode_id"
.LASF103:
	.string	"MCLK_SAI_OUT2IO"
.LASF127:
	.string	"GRF_DRV_INFO"
.LASF150:
	.string	"GPIO_PIN_C3"
.LASF131:
	.string	"GPIO_PIN_A0"
.LASF132:
	.string	"GPIO_PIN_A1"
.LASF13:
	.string	"uint32_t"
.LASF134:
	.string	"GPIO_PIN_A3"
.LASF135:
	.string	"GPIO_PIN_A4"
.LASF136:
	.string	"GPIO_PIN_A5"
.LASF137:
	.string	"GPIO_PIN_A6"
.LASF138:
	.string	"GPIO_PIN_A7"
.LASF93:
	.string	"CLK_SPI0"
.LASF206:
	.string	"color_component"
.LASF9:
	.string	"char"
.LASF106:
	.string	"CLK_MIPI0_OUT2IO"
.LASF120:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF226:
	.string	"csi2_dphy_board"
.LASF124:
	.string	"PM_RUNTIME_TYPE_END"
.LASF98:
	.string	"CLK_CORE_CRYPTO"
.LASF175:
	.string	"pwdn_gpio"
.LASF100:
	.string	"CLK_CORE_RGA"
.LASF11:
	.string	"__uint32_t"
.LASF61:
	.string	"TCLK_WDT_NS"
.LASF110:
	.string	"CLK_CORE_ISP"
.LASF19:
	.string	"INT_EN_L"
.LASF205:
	.string	"SC200AI_MODE_ID_MAX"
.LASF4:
	.string	"unsigned char"
.LASF224:
	.string	"vicap_board_desc"
.LASF20:
	.string	"INT_EN_H"
.LASF176:
	.string	"pwren_gpio"
.LASF47:
	.string	"STORE_ST_H"
.LASF197:
	.string	"pwdn_active"
.LASF209:
	.string	"ISP_COLOR_MAX"
.LASF46:
	.string	"STORE_ST_L"
.LASF119:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF140:
	.string	"GPIO_PIN_B1"
.LASF57:
	.string	"GPIO_REG_GROUP3_L"
.LASF142:
	.string	"GPIO_PIN_B3"
.LASF143:
	.string	"GPIO_PIN_B4"
.LASF144:
	.string	"GPIO_PIN_B5"
.LASF145:
	.string	"GPIO_PIN_B6"
.LASF204:
	.string	"SC200AI_1920X1080_HDR"
.LASF122:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF12:
	.string	"uint8_t"
.LASF219:
	.string	"dphy_board_desc"
.LASF31:
	.string	"DBCLK_DIV_EN_L"
.LASF88:
	.string	"LSCLK_PERI_SRC"
.LASF178:
	.string	"mclk_out_gate_id"
.LASF187:
	.string	"pixelcode"
.LASF18:
	.string	"SWPORT_DDR_H"
.LASF121:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF168:
	.string	"PWR_CTRL_MAX"
.LASF17:
	.string	"SWPORT_DDR_L"
.LASF188:
	.string	"maxfps"
.LASF73:
	.string	"CLK_UART0_FRAC"
.LASF108:
	.string	"DCLK_VICAP_SRC"
.LASF105:
	.string	"CLK_REF_MIPI1_SRC"
.LASF90:
	.string	"HCLK_HPMCU_SRC"
.LASF186:
	.string	"height"
.LASF59:
	.string	"CLK_INVALID"
.LASF37:
	.string	"INT_RAWSTATUS"
.LASF225:
	.string	"camera_sc200ai"
.LASF74:
	.string	"CLK_UART0"
.LASF77:
	.string	"CLK_UART1"
.LASF80:
	.string	"CLK_UART2"
.LASF179:
	.string	"isp_subdev_name"
.LASF210:
	.string	"rdbk_index"
.LASF217:
	.string	"data_lanes"
.LASF147:
	.string	"GPIO_PIN_C0"
.LASF115:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
.LASF149:
	.string	"GPIO_PIN_C2"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
