	.file	"board_base.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.board_softirq_handler,"ax",@progbits
	.align	1
	.type	board_softirq_handler, @function
board_softirq_handler:
.LFB52:
	.file 1 "board/common/board_base.c"
	.loc 1 95 1
	.cfi_startproc
.LVL0:
	.loc 1 97 5
	.loc 1 97 60 is_stmt 0
	li	a5,538247168
	li	a4,524288
	sw	a4,532(a5)
	.loc 1 98 5 is_stmt 1
	.loc 1 98 10 is_stmt 0
	li	a5,1
	sw	a5,.LANCHOR0,a4
	.loc 1 99 1
	ret
	.cfi_endproc
.LFE52:
	.size	board_softirq_handler, .-board_softirq_handler
	.section	.text.data_section_fixup,"ax",@progbits
	.align	1
	.globl	data_section_fixup
	.type	data_section_fixup, @function
data_section_fixup:
.LFB51:
	.loc 1 38 1 is_stmt 1
	.cfi_startproc
	.loc 1 39 5
.LVL1:
	.loc 1 40 5
	.loc 1 41 5
	.loc 1 43 5
	.loc 1 43 23 is_stmt 0
	lla	a5,__DATA_START__
	lla	a2,_tdata_end
	sub	a2,a2,a5
	.loc 1 45 25
	lla	a5,.LANCHOR1
	.loc 1 45 8
	lw	a4,0(a5)
	.loc 1 43 10
	srai	a2,a2,2
.LVL2:
	.loc 1 45 5 is_stmt 1
	.loc 1 45 8 is_stmt 0
	beq	a4,zero,.L3
	.loc 1 57 21
	bge	a2,zero,.L4
	li	a2,0
.LVL3:
.L4:
	slli	a2,a2,2
	lla	a1,__SAVE_DATA_START__
	lla	a0,__DATA_START__
.LVL4:
.L6:
	.loc 1 50 24
	tail	memcpy
.LVL5:
.L3:
	.loc 1 47 9 is_stmt 1
	.loc 1 47 24 is_stmt 0
	li	a4,1
	sw	a4,0(a5)
	.loc 1 48 9 is_stmt 1
.LVL6:
	.loc 1 50 24 is_stmt 0
	bge	a2,zero,.L5
	li	a2,0
.LVL7:
.L5:
	slli	a2,a2,2
	lla	a1,__DATA_START__
.LVL8:
	lla	a0,__SAVE_DATA_START__
	j	.L6
	.cfi_endproc
.LFE51:
	.size	data_section_fixup, .-data_section_fixup
	.section	.text.sirq_status,"ax",@progbits
	.align	1
	.globl	sirq_status
	.type	sirq_status, @function
sirq_status:
.LFB53:
	.loc 1 106 1 is_stmt 1
	.cfi_startproc
	.loc 1 107 5
	.loc 1 108 1 is_stmt 0
	lw	a0,.LANCHOR0
	ret
	.cfi_endproc
.LFE53:
	.size	sirq_status, .-sirq_status
	.section	.rodata.rt_hw_board_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"soft irq"
	.align	2
.LC1:
	.string	"uart0"
	.section	.text.rt_hw_board_init,"ax",@progbits
	.align	1
	.globl	rt_hw_board_init
	.type	rt_hw_board_init, @function
rt_hw_board_init:
.LFB54:
	.loc 1 111 1 is_stmt 1
	.cfi_startproc
	.loc 1 113 5
	.loc 1 111 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 113 5
	call	HAL_Init
.LVL9:
	.loc 1 116 5 is_stmt 1
	call	BSP_Init
.LVL10:
	.loc 1 118 5
	lla	a1,_heap_end
	lla	a0,_end
	call	rt_system_heap_init
.LVL11:
	.loc 1 119 5
	call	rt_hw_interrupt_init
.LVL12:
	.loc 1 120 5
	lla	a2,.LC0
	li	a1,0
	lla	a0,board_softirq_handler
	call	rt_soft_interrupt_install
.LVL13:
	.loc 1 121 5
	li	a0,397312
	addi	a0,a0,-1312
	call	sysTick_config
.LVL14:
	.loc 1 129 5
	.loc 1 129 53 is_stmt 0
	li	a5,16777216
	li	a4,538247168
	addi	a5,a5,256
	sw	a5,8(a4)
	.loc 1 133 5 is_stmt 1
	call	rt_hw_iomux_config
.LVL15:
	.loc 1 141 5
	call	cif_hw_config
.LVL16:
	.loc 1 145 5
	lla	a0,.LC1
	call	rt_console_set_device
.LVL17:
	.loc 1 149 5
	.loc 1 152 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 149 5
	tail	rt_components_board_init
.LVL18:
	.cfi_endproc
.LFE54:
	.size	rt_hw_board_init, .-rt_hw_board_init
	.weak	rockchip_i2c_config_table
	.section	.data,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	data_fixup_flag, @object
	.size	data_fixup_flag, 4
data_fixup_flag:
	.zero	4
	.section	.rodata.rockchip_i2c_config_table,"a"
	.align	2
	.type	rockchip_i2c_config_table, @object
	.size	rockchip_i2c_config_table, 16
rockchip_i2c_config_table:
	.word	546570240
	.word	1
	.zero	8
	.section	.sbss.sirq,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sirq, @object
	.size	sirq, 4
sirq:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_i2c.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/drv_isp3.h"
	.file 11 "board/common/board_base.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_i2c.h"
	.file 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
	.file 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/bsp/RV1103B/hal_bsp.h"
	.file 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 16 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.file 17 "drivers/timer.h"
	.file 18 "board/common/iomux_base.h"
	.file 19 "board/common/board_cam.h"
	.file 20 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x973
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF150
	.byte	0xc
	.4byte	.LASF151
	.4byte	.LASF152
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
	.4byte	.LASF10
	.byte	0x2
	.byte	0x41
	.byte	0xd
	.4byte	0x6e
	.byte	0x4
	.4byte	0x5d
	.byte	0x5
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
	.byte	0x6
	.byte	0x4
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x3
	.4byte	.LASF12
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x85
	.byte	0x4
	.4byte	0x91
	.byte	0x7
	.4byte	0x9d
	.byte	0x8
	.4byte	0x91
	.4byte	0xb7
	.byte	0x9
	.4byte	0x75
	.byte	0x2
	.byte	0
	.byte	0xa
	.4byte	.LASF73
	.2byte	0x808
	.byte	0x5
	.byte	0xe4
	.byte	0x8
	.4byte	0x406
	.byte	0xb
	.4byte	.LASF13
	.byte	0x5
	.byte	0xe5
	.byte	0x17
	.4byte	0x9d
	.byte	0
	.byte	0xb
	.4byte	.LASF14
	.byte	0x5
	.byte	0xe6
	.byte	0x17
	.4byte	0x9d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF15
	.byte	0x5
	.byte	0xe7
	.byte	0x17
	.4byte	0x9d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF16
	.byte	0x5
	.byte	0xe8
	.byte	0x17
	.4byte	0x9d
	.byte	0xc
	.byte	0xb
	.4byte	.LASF17
	.byte	0x5
	.byte	0xe9
	.byte	0x17
	.4byte	0x9d
	.byte	0x10
	.byte	0xb
	.4byte	.LASF18
	.byte	0x5
	.byte	0xea
	.byte	0x13
	.4byte	0xa7
	.byte	0x14
	.byte	0xb
	.4byte	.LASF19
	.byte	0x5
	.byte	0xeb
	.byte	0x17
	.4byte	0x9d
	.byte	0x20
	.byte	0xb
	.4byte	.LASF20
	.byte	0x5
	.byte	0xec
	.byte	0x17
	.4byte	0x9d
	.byte	0x24
	.byte	0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0xed
	.byte	0x13
	.4byte	0x406
	.byte	0x28
	.byte	0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0xee
	.byte	0x17
	.4byte	0x9d
	.byte	0x30
	.byte	0xb
	.4byte	.LASF23
	.byte	0x5
	.byte	0xef
	.byte	0x17
	.4byte	0x9d
	.byte	0x34
	.byte	0xb
	.4byte	.LASF24
	.byte	0x5
	.byte	0xf0
	.byte	0x13
	.4byte	0x406
	.byte	0x38
	.byte	0xb
	.4byte	.LASF25
	.byte	0x5
	.byte	0xf1
	.byte	0x1d
	.4byte	0xa2
	.byte	0x40
	.byte	0xb
	.4byte	.LASF26
	.byte	0x5
	.byte	0xf2
	.byte	0x1d
	.4byte	0xa2
	.byte	0x44
	.byte	0xb
	.4byte	.LASF27
	.byte	0x5
	.byte	0xf3
	.byte	0x1d
	.4byte	0xa2
	.byte	0x48
	.byte	0xb
	.4byte	.LASF28
	.byte	0x5
	.byte	0xf4
	.byte	0x13
	.4byte	0x91
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF29
	.byte	0x5
	.byte	0xf5
	.byte	0x17
	.4byte	0x9d
	.byte	0x50
	.byte	0xb
	.4byte	.LASF30
	.byte	0x5
	.byte	0xf6
	.byte	0x17
	.4byte	0x9d
	.byte	0x54
	.byte	0xb
	.4byte	.LASF31
	.byte	0x5
	.byte	0xf7
	.byte	0x17
	.4byte	0x9d
	.byte	0x58
	.byte	0xb
	.4byte	.LASF32
	.byte	0x5
	.byte	0xf8
	.byte	0x17
	.4byte	0x9d
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF33
	.byte	0x5
	.byte	0xf9
	.byte	0x1d
	.4byte	0xa2
	.byte	0x60
	.byte	0xb
	.4byte	.LASF34
	.byte	0x5
	.byte	0xfa
	.byte	0x13
	.4byte	0xa7
	.byte	0x64
	.byte	0xb
	.4byte	.LASF35
	.byte	0x5
	.byte	0xfb
	.byte	0x17
	.4byte	0x9d
	.byte	0x70
	.byte	0xb
	.4byte	.LASF36
	.byte	0x5
	.byte	0xfc
	.byte	0x17
	.4byte	0x9d
	.byte	0x74
	.byte	0xb
	.4byte	.LASF37
	.byte	0x5
	.byte	0xfd
	.byte	0x17
	.4byte	0x9d
	.byte	0x78
	.byte	0xb
	.4byte	.LASF38
	.byte	0x5
	.byte	0xfe
	.byte	0x13
	.4byte	0x91
	.byte	0x7c
	.byte	0xb
	.4byte	.LASF39
	.byte	0x5
	.byte	0xff
	.byte	0x17
	.4byte	0x9d
	.byte	0x80
	.byte	0xc
	.4byte	.LASF40
	.byte	0x5
	.2byte	0x100
	.byte	0x17
	.4byte	0x9d
	.byte	0x84
	.byte	0xc
	.4byte	.LASF41
	.byte	0x5
	.2byte	0x101
	.byte	0x17
	.4byte	0x9d
	.byte	0x88
	.byte	0xc
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x102
	.byte	0x17
	.4byte	0x9d
	.byte	0x8c
	.byte	0xc
	.4byte	.LASF43
	.byte	0x5
	.2byte	0x103
	.byte	0x17
	.4byte	0x9d
	.byte	0x90
	.byte	0xc
	.4byte	.LASF44
	.byte	0x5
	.2byte	0x104
	.byte	0x13
	.4byte	0x91
	.byte	0x94
	.byte	0xc
	.4byte	.LASF45
	.byte	0x5
	.2byte	0x105
	.byte	0x1d
	.4byte	0xa2
	.byte	0x98
	.byte	0xc
	.4byte	.LASF46
	.byte	0x5
	.2byte	0x106
	.byte	0x1d
	.4byte	0xa2
	.byte	0x9c
	.byte	0xc
	.4byte	.LASF47
	.byte	0x5
	.2byte	0x107
	.byte	0x17
	.4byte	0x9d
	.byte	0xa0
	.byte	0xc
	.4byte	.LASF48
	.byte	0x5
	.2byte	0x108
	.byte	0x17
	.4byte	0x9d
	.byte	0xa4
	.byte	0xc
	.4byte	.LASF49
	.byte	0x5
	.2byte	0x109
	.byte	0x1d
	.4byte	0xa2
	.byte	0xa8
	.byte	0xc
	.4byte	.LASF50
	.byte	0x5
	.2byte	0x10a
	.byte	0x13
	.4byte	0x91
	.byte	0xac
	.byte	0xc
	.4byte	.LASF51
	.byte	0x5
	.2byte	0x10b
	.byte	0x17
	.4byte	0x9d
	.byte	0xb0
	.byte	0xc
	.4byte	.LASF52
	.byte	0x5
	.2byte	0x10c
	.byte	0x17
	.4byte	0x9d
	.byte	0xb4
	.byte	0xc
	.4byte	.LASF53
	.byte	0x5
	.2byte	0x10d
	.byte	0x13
	.4byte	0x416
	.byte	0xb8
	.byte	0xd
	.4byte	.LASF54
	.byte	0x5
	.2byte	0x10e
	.byte	0x17
	.4byte	0x9d
	.2byte	0x100
	.byte	0xd
	.4byte	.LASF55
	.byte	0x5
	.2byte	0x10f
	.byte	0x1d
	.4byte	0xa2
	.2byte	0x104
	.byte	0xd
	.4byte	.LASF56
	.byte	0x5
	.2byte	0x110
	.byte	0x17
	.4byte	0x9d
	.2byte	0x108
	.byte	0xd
	.4byte	.LASF57
	.byte	0x5
	.2byte	0x111
	.byte	0x13
	.4byte	0x91
	.2byte	0x10c
	.byte	0xd
	.4byte	.LASF58
	.byte	0x5
	.2byte	0x112
	.byte	0x17
	.4byte	0x9d
	.2byte	0x110
	.byte	0xd
	.4byte	.LASF59
	.byte	0x5
	.2byte	0x113
	.byte	0x17
	.4byte	0x9d
	.2byte	0x114
	.byte	0xd
	.4byte	.LASF60
	.byte	0x5
	.2byte	0x114
	.byte	0x17
	.4byte	0x9d
	.2byte	0x118
	.byte	0xd
	.4byte	.LASF61
	.byte	0x5
	.2byte	0x115
	.byte	0x17
	.4byte	0x9d
	.2byte	0x11c
	.byte	0xd
	.4byte	.LASF62
	.byte	0x5
	.2byte	0x116
	.byte	0x13
	.4byte	0x426
	.2byte	0x120
	.byte	0xd
	.4byte	.LASF63
	.byte	0x5
	.2byte	0x117
	.byte	0x17
	.4byte	0x9d
	.2byte	0x200
	.byte	0xd
	.4byte	.LASF64
	.byte	0x5
	.2byte	0x118
	.byte	0x17
	.4byte	0x9d
	.2byte	0x204
	.byte	0xd
	.4byte	.LASF65
	.byte	0x5
	.2byte	0x119
	.byte	0x17
	.4byte	0x9d
	.2byte	0x208
	.byte	0xd
	.4byte	.LASF66
	.byte	0x5
	.2byte	0x11a
	.byte	0x17
	.4byte	0x9d
	.2byte	0x20c
	.byte	0xd
	.4byte	.LASF67
	.byte	0x5
	.2byte	0x11b
	.byte	0x17
	.4byte	0x9d
	.2byte	0x210
	.byte	0xd
	.4byte	.LASF68
	.byte	0x5
	.2byte	0x11c
	.byte	0x17
	.4byte	0x9d
	.2byte	0x214
	.byte	0xd
	.4byte	.LASF69
	.byte	0x5
	.2byte	0x11d
	.byte	0x17
	.4byte	0x9d
	.2byte	0x218
	.byte	0xd
	.4byte	.LASF70
	.byte	0x5
	.2byte	0x11e
	.byte	0x13
	.4byte	0x436
	.2byte	0x21c
	.byte	0xd
	.4byte	.LASF71
	.byte	0x5
	.2byte	0x11f
	.byte	0x17
	.4byte	0x9d
	.2byte	0x800
	.byte	0xd
	.4byte	.LASF72
	.byte	0x5
	.2byte	0x120
	.byte	0x17
	.4byte	0x9d
	.2byte	0x804
	.byte	0
	.byte	0x8
	.4byte	0x91
	.4byte	0x416
	.byte	0x9
	.4byte	0x75
	.byte	0x1
	.byte	0
	.byte	0x8
	.4byte	0x91
	.4byte	0x426
	.byte	0x9
	.4byte	0x75
	.byte	0x11
	.byte	0
	.byte	0x8
	.4byte	0x91
	.4byte	0x436
	.byte	0x9
	.4byte	0x75
	.byte	0x37
	.byte	0
	.byte	0x8
	.4byte	0x91
	.4byte	0x447
	.byte	0xe
	.4byte	0x75
	.2byte	0x178
	.byte	0
	.byte	0x8
	.4byte	0x91
	.4byte	0x457
	.byte	0x9
	.4byte	0x75
	.byte	0x35
	.byte	0
	.byte	0xf
	.4byte	.LASF74
	.2byte	0x22c
	.byte	0x5
	.2byte	0x215
	.byte	0x8
	.4byte	0x55a
	.byte	0x10
	.string	"CON"
	.byte	0x5
	.2byte	0x216
	.byte	0x17
	.4byte	0x9d
	.byte	0
	.byte	0xc
	.4byte	.LASF75
	.byte	0x5
	.2byte	0x217
	.byte	0x17
	.4byte	0x9d
	.byte	0x4
	.byte	0xc
	.4byte	.LASF76
	.byte	0x5
	.2byte	0x218
	.byte	0x17
	.4byte	0x9d
	.byte	0x8
	.byte	0xc
	.4byte	.LASF77
	.byte	0x5
	.2byte	0x219
	.byte	0x17
	.4byte	0x9d
	.byte	0xc
	.byte	0xc
	.4byte	.LASF78
	.byte	0x5
	.2byte	0x21a
	.byte	0x17
	.4byte	0x9d
	.byte	0x10
	.byte	0xc
	.4byte	.LASF79
	.byte	0x5
	.2byte	0x21b
	.byte	0x17
	.4byte	0x9d
	.byte	0x14
	.byte	0x10
	.string	"IEN"
	.byte	0x5
	.2byte	0x21c
	.byte	0x17
	.4byte	0x9d
	.byte	0x18
	.byte	0x10
	.string	"IPD"
	.byte	0x5
	.2byte	0x21d
	.byte	0x17
	.4byte	0x9d
	.byte	0x1c
	.byte	0xc
	.4byte	.LASF80
	.byte	0x5
	.2byte	0x21e
	.byte	0x1d
	.4byte	0xa2
	.byte	0x20
	.byte	0xc
	.4byte	.LASF81
	.byte	0x5
	.2byte	0x21f
	.byte	0x17
	.4byte	0x9d
	.byte	0x24
	.byte	0xc
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x220
	.byte	0x13
	.4byte	0x447
	.byte	0x28
	.byte	0xd
	.4byte	.LASF82
	.byte	0x5
	.2byte	0x221
	.byte	0x17
	.4byte	0x56a
	.2byte	0x100
	.byte	0xd
	.4byte	.LASF62
	.byte	0x5
	.2byte	0x222
	.byte	0x13
	.4byte	0x426
	.2byte	0x120
	.byte	0xd
	.4byte	.LASF83
	.byte	0x5
	.2byte	0x223
	.byte	0x1d
	.4byte	0x584
	.2byte	0x200
	.byte	0x11
	.string	"ST"
	.byte	0x5
	.2byte	0x224
	.byte	0x1d
	.4byte	0xa2
	.2byte	0x220
	.byte	0xd
	.4byte	.LASF84
	.byte	0x5
	.2byte	0x225
	.byte	0x17
	.4byte	0x9d
	.2byte	0x224
	.byte	0xd
	.4byte	.LASF85
	.byte	0x5
	.2byte	0x226
	.byte	0x17
	.4byte	0x9d
	.2byte	0x228
	.byte	0
	.byte	0x8
	.4byte	0x9d
	.4byte	0x56a
	.byte	0x9
	.4byte	0x75
	.byte	0x7
	.byte	0
	.byte	0x4
	.4byte	0x55a
	.byte	0x8
	.4byte	0xa2
	.4byte	0x57f
	.byte	0x9
	.4byte	0x75
	.byte	0x7
	.byte	0
	.byte	0x7
	.4byte	0x56f
	.byte	0x4
	.4byte	0x57f
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0x6
	.byte	0x2e
	.byte	0x6
	.4byte	0x5da
	.byte	0x13
	.4byte	.LASF86
	.byte	0
	.byte	0x13
	.4byte	.LASF87
	.byte	0x1
	.byte	0x13
	.4byte	.LASF88
	.byte	0x2
	.byte	0x13
	.4byte	.LASF89
	.byte	0x3
	.byte	0x13
	.4byte	.LASF90
	.byte	0x4
	.byte	0x13
	.4byte	.LASF91
	.byte	0x5
	.byte	0x13
	.4byte	.LASF92
	.byte	0x6
	.byte	0x13
	.4byte	.LASF93
	.byte	0x7
	.byte	0x13
	.4byte	.LASF94
	.byte	0x8
	.byte	0x13
	.4byte	.LASF95
	.byte	0x9
	.byte	0x13
	.4byte	.LASF96
	.byte	0xa
	.byte	0
	.byte	0x14
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0x7
	.2byte	0x42b
	.byte	0xe
	.4byte	0x60e
	.byte	0x13
	.4byte	.LASF97
	.byte	0
	.byte	0x13
	.4byte	.LASF98
	.byte	0x1
	.byte	0x13
	.4byte	.LASF99
	.byte	0x2
	.byte	0x13
	.4byte	.LASF100
	.byte	0x3
	.byte	0x13
	.4byte	.LASF101
	.byte	0x4
	.byte	0x13
	.4byte	.LASF102
	.byte	0x5
	.byte	0
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0x8
	.byte	0x39
	.byte	0xe
	.4byte	0x62f
	.byte	0x13
	.4byte	.LASF103
	.byte	0
	.byte	0x13
	.4byte	.LASF104
	.byte	0x1
	.byte	0x13
	.4byte	.LASF105
	.byte	0x2
	.byte	0
	.byte	0x3
	.4byte	.LASF106
	.byte	0x8
	.byte	0x3d
	.byte	0x3
	.4byte	0x60e
	.byte	0x15
	.byte	0x4
	.4byte	0x457
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF107
	.byte	0x12
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0x9
	.byte	0x35
	.byte	0xe
	.4byte	0x67b
	.byte	0x13
	.4byte	.LASF108
	.byte	0
	.byte	0x13
	.4byte	.LASF109
	.byte	0x1
	.byte	0x13
	.4byte	.LASF110
	.byte	0x2
	.byte	0x13
	.4byte	.LASF111
	.byte	0x3
	.byte	0x13
	.4byte	.LASF112
	.byte	0x4
	.byte	0x13
	.4byte	.LASF113
	.byte	0x5
	.byte	0
	.byte	0x16
	.4byte	.LASF117
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0xa
	.byte	0xe2
	.byte	0xe
	.4byte	0x6a0
	.byte	0x13
	.4byte	.LASF114
	.byte	0
	.byte	0x13
	.4byte	.LASF115
	.byte	0x1
	.byte	0x13
	.4byte	.LASF116
	.byte	0x2
	.byte	0
	.byte	0x17
	.4byte	.LASF118
	.byte	0x7
	.byte	0x4
	.4byte	0x75
	.byte	0xa
	.2byte	0x14b
	.byte	0xe
	.4byte	0x6cc
	.byte	0x13
	.4byte	.LASF119
	.byte	0
	.byte	0x13
	.4byte	.LASF120
	.byte	0x1
	.byte	0x13
	.4byte	.LASF121
	.byte	0x2
	.byte	0x13
	.4byte	.LASF122
	.byte	0x3
	.byte	0
	.byte	0x18
	.4byte	.LASF123
	.byte	0xb
	.byte	0x1a
	.byte	0xe
	.4byte	0x83
	.byte	0x18
	.4byte	.LASF124
	.byte	0xb
	.byte	0x1b
	.byte	0xe
	.4byte	0x83
	.byte	0x19
	.4byte	.LASF125
	.byte	0x8
	.byte	0xc
	.byte	0x26
	.byte	0x8
	.4byte	0x70b
	.byte	0x1a
	.string	"id"
	.byte	0xc
	.byte	0x28
	.byte	0x15
	.4byte	0x63b
	.byte	0
	.byte	0xb
	.4byte	.LASF126
	.byte	0xc
	.byte	0x29
	.byte	0x13
	.4byte	0x62f
	.byte	0x4
	.byte	0
	.byte	0x7
	.4byte	0x6e4
	.byte	0x8
	.4byte	0x70b
	.4byte	0x71b
	.byte	0x1b
	.byte	0
	.byte	0x7
	.4byte	0x710
	.byte	0x18
	.4byte	.LASF127
	.byte	0xc
	.byte	0x30
	.byte	0x29
	.4byte	0x71b
	.byte	0x8
	.4byte	0x91
	.4byte	0x737
	.byte	0x1b
	.byte	0
	.byte	0x18
	.4byte	.LASF128
	.byte	0x1
	.byte	0x1d
	.byte	0x29
	.4byte	0x72c
	.byte	0x18
	.4byte	.LASF129
	.byte	0x1
	.byte	0x1e
	.byte	0x29
	.4byte	0x72c
	.byte	0x18
	.4byte	.LASF130
	.byte	0x1
	.byte	0x1f
	.byte	0x29
	.4byte	0x72c
	.byte	0x1c
	.4byte	.LASF131
	.byte	0x1
	.byte	0x21
	.byte	0x2e
	.4byte	0x6e
	.byte	0x5
	.byte	0x3
	.4byte	data_fixup_flag
	.byte	0x8
	.4byte	0x70b
	.4byte	0x77d
	.byte	0x9
	.4byte	0x75
	.byte	0x1
	.byte	0
	.byte	0x7
	.4byte	0x76d
	.byte	0x1d
	.4byte	0x720
	.byte	0x1
	.byte	0x53
	.byte	0x38
	.4byte	0x77d
	.byte	0x5
	.byte	0x3
	.4byte	rockchip_i2c_config_table
	.byte	0x1c
	.4byte	.LASF132
	.byte	0x1
	.byte	0x5d
	.byte	0x1b
	.4byte	0x69
	.byte	0x5
	.byte	0x3
	.4byte	sirq
	.byte	0x1e
	.4byte	.LASF135
	.byte	0x1
	.byte	0x6e
	.byte	0x6
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.byte	0x1
	.byte	0x9c
	.4byte	0x84f
	.byte	0x1f
	.4byte	.LVL9
	.4byte	0x8f1
	.byte	0x1f
	.4byte	.LVL10
	.4byte	0x8fd
	.byte	0x1f
	.4byte	.LVL11
	.4byte	0x909
	.byte	0x1f
	.4byte	.LVL12
	.4byte	0x915
	.byte	0x20
	.4byte	.LVL13
	.4byte	0x921
	.4byte	0x805
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	board_softirq_handler
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0x20
	.4byte	.LVL14
	.4byte	0x92d
	.4byte	0x81c
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x60ae0
	.byte	0
	.byte	0x1f
	.4byte	.LVL15
	.4byte	0x939
	.byte	0x1f
	.4byte	.LVL16
	.4byte	0x945
	.byte	0x20
	.4byte	.LVL17
	.4byte	0x951
	.4byte	0x845
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0x22
	.4byte	.LVL18
	.4byte	0x95e
	.byte	0
	.byte	0x23
	.4byte	.LASF153
	.byte	0x1
	.byte	0x69
	.byte	0xb
	.4byte	0x5d
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.byte	0x24
	.4byte	.LASF154
	.byte	0x1
	.byte	0x5e
	.byte	0xd
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0x898
	.byte	0x25
	.4byte	.LASF133
	.byte	0x1
	.byte	0x5e
	.byte	0x27
	.4byte	0x6e
	.byte	0x1
	.byte	0x5a
	.byte	0x25
	.4byte	.LASF134
	.byte	0x1
	.byte	0x5e
	.byte	0x35
	.4byte	0x83
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x1e
	.4byte	.LASF136
	.byte	0x1
	.byte	0x25
	.byte	0x6
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x8eb
	.byte	0x26
	.4byte	.LASF137
	.byte	0x1
	.byte	0x27
	.byte	0xf
	.4byte	0x8eb
	.byte	0x26
	.4byte	.LASF138
	.byte	0x1
	.byte	0x28
	.byte	0xf
	.4byte	0x8eb
	.byte	0x27
	.4byte	.LASF139
	.byte	0x1
	.byte	0x29
	.byte	0x9
	.4byte	0x6e
	.4byte	.LLST0
	.byte	0x28
	.string	"i"
	.byte	0x1
	.byte	0x29
	.byte	0xf
	.4byte	0x6e
	.byte	0
	.byte	0x22
	.4byte	.LVL5
	.4byte	0x96b
	.byte	0
	.byte	0x15
	.byte	0x4
	.4byte	0x91
	.byte	0x29
	.4byte	.LASF140
	.4byte	.LASF140
	.byte	0xd
	.byte	0x35
	.byte	0xc
	.byte	0x29
	.4byte	.LASF141
	.4byte	.LASF141
	.byte	0xe
	.byte	0x2c
	.byte	0x6
	.byte	0x29
	.4byte	.LASF142
	.4byte	.LASF142
	.byte	0xf
	.byte	0xf2
	.byte	0x6
	.byte	0x29
	.4byte	.LASF143
	.4byte	.LASF143
	.byte	0x10
	.byte	0x57
	.byte	0x6
	.byte	0x29
	.4byte	.LASF144
	.4byte	.LASF144
	.byte	0x1
	.byte	0x23
	.byte	0x12
	.byte	0x29
	.4byte	.LASF145
	.4byte	.LASF145
	.byte	0x11
	.byte	0x2e
	.byte	0x6
	.byte	0x29
	.4byte	.LASF146
	.4byte	.LASF146
	.byte	0x12
	.byte	0x1a
	.byte	0x6
	.byte	0x29
	.4byte	.LASF147
	.4byte	.LASF147
	.byte	0x13
	.byte	0x1e
	.byte	0xd
	.byte	0x2a
	.4byte	.LASF148
	.4byte	.LASF148
	.byte	0xf
	.2byte	0x1e0
	.byte	0xd
	.byte	0x2a
	.4byte	.LASF149
	.4byte	.LASF149
	.byte	0xf
	.2byte	0x1c7
	.byte	0x6
	.byte	0x2b
	.4byte	.LASF155
	.4byte	.LASF156
	.byte	0x14
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
	.byte	0x35
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0xb
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
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x17
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
	.byte	0xb
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
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x21
	.byte	0
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
	.byte	0x1e
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
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5c
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
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	.LFB54
	.4byte	.LFE54-.LFB54
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	.LFB54
	.4byte	.LFE54
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"USBOTG_ID_DETECT_CON"
.LASF58:
	.string	"USBOTG_LINESTATE_DETECT_CON"
.LASF50:
	.string	"RESERVED00AC"
.LASF36:
	.string	"TSADC_CON"
.LASF21:
	.string	"RESERVED0028"
.LASF143:
	.string	"rt_hw_interrupt_init"
.LASF144:
	.string	"rt_soft_interrupt_install"
.LASF150:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF86:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF135:
	.string	"rt_hw_board_init"
.LASF80:
	.string	"FCNT"
.LASF29:
	.string	"USBPHY_CON0"
.LASF30:
	.string	"USBPHY_CON1"
.LASF31:
	.string	"USBPHY_CON2"
.LASF32:
	.string	"USBPHY_CON3"
.LASF7:
	.string	"long long unsigned int"
.LASF128:
	.string	"__DATA_START__"
.LASF133:
	.string	"vector"
.LASF105:
	.string	"I2C_1000K"
.LASF122:
	.string	"RK_ISP_BUF_RDBK_MAX"
.LASF98:
	.string	"GRF_PUL_INFO"
.LASF117:
	.string	"color_component"
.LASF115:
	.string	"ISP_COLOR_CBCR"
.LASF19:
	.string	"AUDIO_CON0"
.LASF20:
	.string	"AUDIO_CON1"
.LASF146:
	.string	"rt_hw_iomux_config"
.LASF148:
	.string	"rt_console_set_device"
.LASF147:
	.string	"cif_hw_config"
.LASF0:
	.string	"signed char"
.LASF78:
	.string	"MTXCNT"
.LASF127:
	.string	"rockchip_i2c_config_table"
.LASF24:
	.string	"RESERVED0038"
.LASF85:
	.string	"CON1"
.LASF34:
	.string	"RESERVED0064"
.LASF60:
	.string	"USBOTG_BVALID_DETECT_CON"
.LASF96:
	.string	"PM_RUNTIME_TYPE_END"
.LASF145:
	.string	"sysTick_config"
.LASF2:
	.string	"long int"
.LASF83:
	.string	"RXDATA"
.LASF56:
	.string	"USBOTG_SIG_DETECT_CLR"
.LASF63:
	.string	"CACHE_PERI_ADDR_START"
.LASF155:
	.string	"memcpy"
.LASF3:
	.string	"long long int"
.LASF40:
	.string	"MEM_CON_DPRA"
.LASF43:
	.string	"BIU_CON0"
.LASF138:
	.string	"restore"
.LASF100:
	.string	"GRF_SRT_INFO"
.LASF112:
	.string	"PWR_CTRL_VOLT_ST"
.LASF55:
	.string	"USBOTG_SIG_DETECT_STATUS"
.LASF149:
	.string	"rt_components_board_init"
.LASF90:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF51:
	.string	"MACPHY_CON0"
.LASF52:
	.string	"MACPHY_CON1"
.LASF152:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF142:
	.string	"rt_system_heap_init"
.LASF77:
	.string	"MRXRADDR"
.LASF106:
	.string	"eI2C_BusSpeed"
.LASF137:
	.string	"save"
.LASF104:
	.string	"I2C_400K"
.LASF57:
	.string	"RESERVED010C"
.LASF8:
	.string	"unsigned int"
.LASF37:
	.string	"OTP_CON"
.LASF111:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF136:
	.string	"data_section_fixup"
.LASF66:
	.string	"HPMCU_SRAM_ADDR_START"
.LASF141:
	.string	"BSP_Init"
.LASF132:
	.string	"sirq"
.LASF119:
	.string	"RK_ISP_BUF_RDBK_L"
.LASF120:
	.string	"RK_ISP_BUF_RDBK_M"
.LASF121:
	.string	"RK_ISP_BUF_RDBK_S"
.LASF139:
	.string	"size"
.LASF5:
	.string	"short unsigned int"
.LASF97:
	.string	"GRF_MUX_INFO"
.LASF25:
	.string	"USBOTG_STATUS0"
.LASF26:
	.string	"USBOTG_STATUS1"
.LASF27:
	.string	"USBOTG_STATUS2"
.LASF84:
	.string	"DBGCTRL"
.LASF95:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF59:
	.string	"USBOTG_DISCONNECT_DETECT_CON"
.LASF123:
	.string	"_end"
.LASF88:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF156:
	.string	"__builtin_memcpy"
.LASF82:
	.string	"TXDATA"
.LASF126:
	.string	"speed"
.LASF114:
	.string	"ISP_COLOR_Y"
.LASF65:
	.string	"HPMCU_CODE_ADDR_START"
.LASF131:
	.string	"data_fixup_flag"
.LASF76:
	.string	"MRXADDR"
.LASF64:
	.string	"CACHE_PERI_ADDR_END"
.LASF102:
	.string	"GRF_INFO_NUM"
.LASF17:
	.string	"PERI_STATUS"
.LASF38:
	.string	"RESERVED007C"
.LASF45:
	.string	"BIU_STATUS0"
.LASF46:
	.string	"BIU_STATUS1"
.LASF22:
	.string	"USBOTG_CON0"
.LASF134:
	.string	"param"
.LASF48:
	.string	"GMAC_CLK_CON"
.LASF110:
	.string	"PWR_CTRL_PWR_EN"
.LASF70:
	.string	"RESERVED021C"
.LASF74:
	.string	"I2C_REG"
.LASF53:
	.string	"RESERVED00B8"
.LASF39:
	.string	"MEM_CON_SPRA"
.LASF54:
	.string	"USBOTG_SIG_DETECT_CON"
.LASF49:
	.string	"GMAC_ST"
.LASF75:
	.string	"CLKDIV"
.LASF89:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF33:
	.string	"USBPHY_STATUS"
.LASF73:
	.string	"GRF_SYS_REG"
.LASF153:
	.string	"sirq_status"
.LASF107:
	.string	"_Bool"
.LASF4:
	.string	"unsigned char"
.LASF103:
	.string	"I2C_100K"
.LASF13:
	.string	"PERI_CON0"
.LASF14:
	.string	"PERI_CON1"
.LASF15:
	.string	"PERI_CON2"
.LASF1:
	.string	"short int"
.LASF81:
	.string	"SCL_OE_DB"
.LASF101:
	.string	"GRF_SMT_INFO"
.LASF109:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF67:
	.string	"HPMCU_EXSRAM_ADDR_START"
.LASF154:
	.string	"board_softirq_handler"
.LASF28:
	.string	"RESERVED004C"
.LASF69:
	.string	"HPMCU_CACHE_STATUS"
.LASF113:
	.string	"PWR_CTRL_MAX"
.LASF140:
	.string	"HAL_Init"
.LASF41:
	.string	"MEM_CON_ROM"
.LASF99:
	.string	"GRF_DRV_INFO"
.LASF130:
	.string	"__SAVE_DATA_START__"
.LASF12:
	.string	"uint32_t"
.LASF79:
	.string	"MRXCNT"
.LASF6:
	.string	"long unsigned int"
.LASF9:
	.string	"char"
.LASF92:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF11:
	.string	"__uint32_t"
.LASF129:
	.string	"_tdata_end"
.LASF47:
	.string	"GMAC_CON0"
.LASF16:
	.string	"PERI_HPROT2_CON"
.LASF10:
	.string	"rt_bool_t"
.LASF62:
	.string	"RESERVED0120"
.LASF18:
	.string	"RESERVED0014"
.LASF23:
	.string	"USBOTG_CON1"
.LASF116:
	.string	"ISP_COLOR_MAX"
.LASF91:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF71:
	.string	"CHIP_ID"
.LASF42:
	.string	"MEM_CON_GATE"
.LASF68:
	.string	"HPMCU_CACHE_MISC"
.LASF124:
	.string	"_heap_end"
.LASF94:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF125:
	.string	"rockchip_i2c_config"
.LASF151:
	.string	"board/common/board_base.c"
.LASF93:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF44:
	.string	"RESERVED0094"
.LASF108:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF72:
	.string	"CHIP_VERSION"
.LASF118:
	.string	"rdbk_index"
.LASF35:
	.string	"SARADC_CON"
.LASF87:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
