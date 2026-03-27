	.file	"drv_saradc.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.rk_saradc_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"saradc"
	.align	2
.LC1:
	.string	"rk_adc0"
	.section	.text.rk_saradc_init,"ax",@progbits
	.align	1
	.type	rk_saradc_init, @function
rk_saradc_init:
.LFB40:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_saradc.c"
	.loc 1 97 1
	.cfi_startproc
	.loc 1 98 5
.LVL0:
	.loc 1 100 5
	.loc 1 97 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 101 19
	li	a5,546963456
	.loc 1 97 1
	sw	s0,8(sp)
	.loc 1 103 5
	li	a0,92
	.cfi_offset 8, -8
	.loc 1 100 20
	lla	s0,.LANCHOR0
	.loc 1 97 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 101 19
	sw	a5,0(s0)
	.loc 1 100 20
	sw	zero,8(s0)
	.loc 1 101 5 is_stmt 1
	.loc 1 103 5
	call	HAL_CRU_ClkEnable
.LVL1:
	.loc 1 104 5
	li	a0,93
	call	HAL_CRU_ClkEnable
.LVL2:
	.loc 1 112 5
	li	a2,0
	lla	a1,.LC0
	lla	a0,.LANCHOR0+12
	call	rt_event_init
.LVL3:
	.loc 1 114 5
	li	a3,0
	li	a2,0
	lla	a1,rk_saradc_irq_handler
	li	a0,17
	call	rt_hw_interrupt_install
.LVL4:
	.loc 1 115 5
	li	a0,17
	call	rt_hw_interrupt_umask
.LVL5:
	.loc 1 117 5
	.loc 1 117 9 is_stmt 0
	mv	a3,s0
	lla	a2,.LANCHOR1
	lla	a1,.LC1
	lla	a0,.LANCHOR0+44
	call	rt_hw_adc_register
.LVL6:
	.loc 1 127 5 is_stmt 1
	.loc 1 128 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.loc 1 117 8
	snez	a0,a0
.LVL7:
	.loc 1 128 1
	neg	a0,a0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE40:
	.size	rk_saradc_init, .-rk_saradc_init
	.section	.text.rk_get_saradc_value,"ax",@progbits
	.align	1
	.type	rk_get_saradc_value, @function
rk_get_saradc_value:
.LFB38:
	.loc 1 55 1 is_stmt 1
	.cfi_startproc
.LVL8:
	.loc 1 56 5
	.loc 1 58 5
	.loc 1 55 1 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s1,36(sp)
	.cfi_offset 9, -12
	.loc 1 58 23
	lw	s1,64(a0)
.LVL9:
	.loc 1 60 5 is_stmt 1
	.loc 1 61 5
	.loc 1 63 5
	.loc 1 55 1 is_stmt 0
	sw	s2,32(sp)
	sw	s3,28(sp)
	.loc 1 63 5
	lw	a0,0(s1)
.LVL10:
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.loc 1 55 1
	mv	s2,a1
	mv	s3,a2
	.loc 1 63 5
	mv	a2,a1
.LVL11:
	lw	a1,8(s1)
.LVL12:
	.loc 1 55 1
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 1 63 5
	call	HAL_SARADC_Start
.LVL13:
	.loc 1 65 5 is_stmt 1
.LBB4:
.LBB5:
	.loc 1 40 5
	.loc 1 42 5
	.loc 1 43 23 is_stmt 0
	li	a0,1
	call	rt_tick_from_millisecond
.LVL14:
	mv	a3,a0
	.loc 1 42 9
	addi	a4,sp,12
	li	a2,6
	li	a1,-1
	addi	a0,s1,12
	call	rt_event_recv
.LVL15:
	.loc 1 42 8
	beq	a0,zero,.L4
.L6:
.LVL16:
.LBE5:
.LBE4:
	.loc 1 67 5 is_stmt 1
	.loc 1 70 16 is_stmt 0
	li	s0,-1
.LVL17:
.L3:
	.loc 1 78 1
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
.LVL18:
	lw	s2,32(sp)
	.cfi_restore 18
.LVL19:
	lw	s3,28(sp)
	.cfi_restore 19
.LVL20:
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL21:
.L4:
	.cfi_restore_state
.LBB7:
.LBB6:
	.loc 1 49 5 is_stmt 1
	.loc 1 49 8 is_stmt 0
	lw	a4,12(sp)
	li	a5,1
	bne	a4,a5,.L6
	mv	s0,a0
.LVL22:
.LBE6:
.LBE7:
	.loc 1 67 5 is_stmt 1
	.loc 1 73 5
	.loc 1 73 27 is_stmt 0
	lw	a0,0(s1)
	mv	a1,s2
	call	HAL_SARADC_GetRaw
.LVL23:
	.loc 1 73 12
	sw	a0,0(s3)
	.loc 1 75 5 is_stmt 1
	lw	a0,0(s1)
	call	HAL_SARADC_Stop
.LVL24:
	.loc 1 77 5
	.loc 1 77 12 is_stmt 0
	j	.L3
	.cfi_endproc
.LFE38:
	.size	rk_get_saradc_value, .-rk_get_saradc_value
	.section	.text.rk_saradc_irq_handler,"ax",@progbits
	.align	1
	.type	rk_saradc_irq_handler, @function
rk_saradc_irq_handler:
.LFB39:
	.loc 1 81 1 is_stmt 1
	.cfi_startproc
.LVL25:
	.loc 1 82 5
	.loc 1 81 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 82 5
	call	rt_interrupt_enter
.LVL26:
	.loc 1 84 5 is_stmt 1
	lw	a0,.LANCHOR0
	call	HAL_SARADC_IrqHandler
.LVL27:
	.loc 1 86 5
	li	a1,1
	lla	a0,.LANCHOR0+12
	call	rt_event_send
.LVL28:
	.loc 1 88 5
	.loc 1 89 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 88 5
	tail	rt_interrupt_leave
.LVL29:
	.cfi_endproc
.LFE39:
	.size	rk_saradc_irq_handler, .-rk_saradc_irq_handler
	.globl	__rt_init_rk_saradc_init
	.section	.bss.rk_saradc,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rk_saradc, @object
	.size	rk_saradc, 116
rk_saradc:
	.zero	116
	.section	.rti_fn.1,"a"
	.align	2
	.type	__rt_init_rk_saradc_init, @object
	.size	__rt_init_rk_saradc_init, 4
__rt_init_rk_saradc_init:
	.word	rk_saradc_init
	.section	.srodata.rk_saradc_ops,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rk_saradc_ops, @object
	.size	rk_saradc_ops, 8
rk_saradc_ops:
	.zero	4
	.word	rk_get_saradc_value
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/adc.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_saradc.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
	.file 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc99
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF213
	.byte	0xc
	.4byte	.LASF214
	.4byte	.LASF215
	.4byte	.Ldebug_ranges0+0x18
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
	.byte	0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0xb3
	.byte	0xf
	.4byte	0xe1
	.byte	0x5
	.4byte	0xd0
	.byte	0x6
	.byte	0x4
	.4byte	0xe7
	.byte	0x7
	.4byte	0x8d
	.byte	0x8
	.4byte	.LASF21
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0x117
	.byte	0x9
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0x117
	.byte	0
	.byte	0x9
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0x117
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xec
	.byte	0xa
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xec
	.byte	0x8
	.4byte	.LASF22
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x171
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x171
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
	.4byte	0x11d
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x188
	.4byte	0x181
	.byte	0xc
	.4byte	0x181
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
	.byte	0xd
	.byte	0x4
	.byte	0x8
	.4byte	.LASF29
	.byte	0x1c
	.byte	0x2
	.2byte	0x25b
	.byte	0x8
	.4byte	0x1bc
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x25d
	.byte	0x16
	.4byte	0x12a
	.byte	0
	.byte	0x9
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x25f
	.byte	0xf
	.4byte	0x11d
	.byte	0x14
	.byte	0
	.byte	0x8
	.4byte	.LASF32
	.byte	0x20
	.byte	0x2
	.2byte	0x28c
	.byte	0x8
	.4byte	0x1e7
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x28e
	.byte	0x1a
	.4byte	0x191
	.byte	0
	.byte	0xe
	.string	"set"
	.byte	0x2
	.2byte	0x290
	.byte	0x11
	.4byte	0x67
	.byte	0x1c
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x67
	.byte	0xf
	.4byte	.LASF216
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0x2
	.2byte	0x319
	.byte	0x6
	.4byte	0x285
	.byte	0x10
	.4byte	.LASF33
	.byte	0
	.byte	0x10
	.4byte	.LASF34
	.byte	0x1
	.byte	0x10
	.4byte	.LASF35
	.byte	0x2
	.byte	0x10
	.4byte	.LASF36
	.byte	0x3
	.byte	0x10
	.4byte	.LASF37
	.byte	0x4
	.byte	0x10
	.4byte	.LASF38
	.byte	0x5
	.byte	0x10
	.4byte	.LASF39
	.byte	0x6
	.byte	0x10
	.4byte	.LASF40
	.byte	0x7
	.byte	0x10
	.4byte	.LASF41
	.byte	0x8
	.byte	0x10
	.4byte	.LASF42
	.byte	0x9
	.byte	0x10
	.4byte	.LASF43
	.byte	0xa
	.byte	0x10
	.4byte	.LASF44
	.byte	0xb
	.byte	0x10
	.4byte	.LASF45
	.byte	0xc
	.byte	0x10
	.4byte	.LASF46
	.byte	0xd
	.byte	0x10
	.4byte	.LASF47
	.byte	0xe
	.byte	0x10
	.4byte	.LASF48
	.byte	0xf
	.byte	0x10
	.4byte	.LASF49
	.byte	0x10
	.byte	0x10
	.4byte	.LASF50
	.byte	0x11
	.byte	0x10
	.4byte	.LASF51
	.byte	0x12
	.byte	0x10
	.4byte	.LASF52
	.byte	0x13
	.byte	0x10
	.4byte	.LASF53
	.byte	0x14
	.byte	0x10
	.4byte	.LASF54
	.byte	0x15
	.byte	0
	.byte	0xa
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x292
	.byte	0x6
	.byte	0x4
	.4byte	0x298
	.byte	0x8
	.4byte	.LASF56
	.byte	0x44
	.byte	0x2
	.2byte	0x387
	.byte	0x8
	.4byte	0x379
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x389
	.byte	0x16
	.4byte	0x12a
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x38b
	.byte	0x1f
	.4byte	0x1ed
	.byte	0x14
	.byte	0x9
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x38c
	.byte	0x11
	.4byte	0x54
	.byte	0x18
	.byte	0x9
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x38d
	.byte	0x11
	.4byte	0x54
	.byte	0x1a
	.byte	0x9
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x38f
	.byte	0x10
	.4byte	0x41
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x390
	.byte	0x10
	.4byte	0x41
	.byte	0x1d
	.byte	0x9
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x393
	.byte	0x10
	.4byte	0x42a
	.byte	0x20
	.byte	0x9
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x394
	.byte	0x10
	.4byte	0x444
	.byte	0x24
	.byte	0x9
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x39a
	.byte	0x10
	.4byte	0x388
	.byte	0x28
	.byte	0x9
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x39b
	.byte	0x10
	.4byte	0x3a2
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x39c
	.byte	0x10
	.4byte	0x388
	.byte	0x30
	.byte	0x9
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x39d
	.byte	0x11
	.4byte	0x3c6
	.byte	0x34
	.byte	0x9
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x39e
	.byte	0x11
	.4byte	0x3f1
	.byte	0x38
	.byte	0x9
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x39f
	.byte	0x10
	.4byte	0x410
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF68
	.byte	0x2
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x18f
	.byte	0x40
	.byte	0
	.byte	0x11
	.4byte	0xac
	.4byte	0x388
	.byte	0x12
	.4byte	0x285
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x379
	.byte	0x11
	.4byte	0xac
	.4byte	0x3a2
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0x54
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x38e
	.byte	0x11
	.4byte	0xb8
	.4byte	0x3c6
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0xc4
	.byte	0x12
	.4byte	0x18f
	.byte	0x12
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3a8
	.byte	0x11
	.4byte	0xb8
	.4byte	0x3ea
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0xc4
	.byte	0x12
	.4byte	0x3ea
	.byte	0x12
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3f0
	.byte	0x13
	.byte	0x6
	.byte	0x4
	.4byte	0x3cc
	.byte	0x11
	.4byte	0xac
	.4byte	0x410
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0x8d
	.byte	0x12
	.4byte	0x18f
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3f7
	.byte	0x11
	.4byte	0xac
	.4byte	0x42a
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x416
	.byte	0x11
	.4byte	0xac
	.4byte	0x444
	.byte	0x12
	.4byte	0x285
	.byte	0x12
	.4byte	0x18f
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x430
	.byte	0x3
	.4byte	.LASF69
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF70
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x44a
	.byte	0x14
	.4byte	0x456
	.byte	0x5
	.4byte	0x462
	.byte	0x15
	.4byte	.LASF71
	.byte	0x8
	.byte	0x5
	.byte	0x11
	.byte	0x8
	.4byte	0x494
	.byte	0x16
	.4byte	.LASF72
	.byte	0x5
	.byte	0x13
	.byte	0x10
	.4byte	0x4e0
	.byte	0
	.byte	0x16
	.4byte	.LASF73
	.byte	0x5
	.byte	0x14
	.byte	0x10
	.4byte	0x4ff
	.byte	0x4
	.byte	0
	.byte	0x5
	.4byte	0x46c
	.byte	0x11
	.4byte	0xac
	.4byte	0x4b2
	.byte	0x12
	.4byte	0x4b2
	.byte	0x12
	.4byte	0x67
	.byte	0x12
	.4byte	0x81
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x4b8
	.byte	0x15
	.4byte	.LASF74
	.byte	0x48
	.byte	0x5
	.byte	0x17
	.byte	0x8
	.4byte	0x4e0
	.byte	0x16
	.4byte	.LASF30
	.byte	0x5
	.byte	0x19
	.byte	0x16
	.4byte	0x298
	.byte	0
	.byte	0x17
	.string	"ops"
	.byte	0x5
	.byte	0x1a
	.byte	0x1e
	.4byte	0x505
	.byte	0x44
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x499
	.byte	0x11
	.4byte	0xac
	.4byte	0x4ff
	.byte	0x12
	.4byte	0x4b2
	.byte	0x12
	.4byte	0x67
	.byte	0x12
	.4byte	0x1e7
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x4e6
	.byte	0x6
	.byte	0x4
	.4byte	0x494
	.byte	0x18
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.4byte	0x694
	.byte	0x10
	.4byte	.LASF75
	.byte	0x11
	.byte	0x10
	.4byte	.LASF76
	.byte	0x20
	.byte	0x10
	.4byte	.LASF77
	.byte	0x21
	.byte	0x10
	.4byte	.LASF78
	.byte	0x22
	.byte	0x10
	.4byte	.LASF79
	.byte	0x23
	.byte	0x10
	.4byte	.LASF80
	.byte	0x24
	.byte	0x10
	.4byte	.LASF81
	.byte	0x25
	.byte	0x10
	.4byte	.LASF82
	.byte	0x29
	.byte	0x10
	.4byte	.LASF83
	.byte	0x34
	.byte	0x10
	.4byte	.LASF84
	.byte	0x39
	.byte	0x10
	.4byte	.LASF85
	.byte	0x3a
	.byte	0x10
	.4byte	.LASF86
	.byte	0x3b
	.byte	0x10
	.4byte	.LASF87
	.byte	0x3c
	.byte	0x10
	.4byte	.LASF88
	.byte	0x3f
	.byte	0x10
	.4byte	.LASF89
	.byte	0x40
	.byte	0x10
	.4byte	.LASF90
	.byte	0x41
	.byte	0x10
	.4byte	.LASF91
	.byte	0x42
	.byte	0x10
	.4byte	.LASF92
	.byte	0x43
	.byte	0x10
	.4byte	.LASF93
	.byte	0x45
	.byte	0x10
	.4byte	.LASF94
	.byte	0x46
	.byte	0x10
	.4byte	.LASF95
	.byte	0x47
	.byte	0x10
	.4byte	.LASF96
	.byte	0x4b
	.byte	0x10
	.4byte	.LASF97
	.byte	0x4c
	.byte	0x10
	.4byte	.LASF98
	.byte	0x4d
	.byte	0x10
	.4byte	.LASF99
	.byte	0x4e
	.byte	0x10
	.4byte	.LASF100
	.byte	0x4f
	.byte	0x10
	.4byte	.LASF101
	.byte	0x50
	.byte	0x10
	.4byte	.LASF102
	.byte	0x51
	.byte	0x10
	.4byte	.LASF103
	.byte	0x52
	.byte	0x10
	.4byte	.LASF104
	.byte	0x53
	.byte	0x10
	.4byte	.LASF105
	.byte	0x54
	.byte	0x10
	.4byte	.LASF106
	.byte	0x55
	.byte	0x10
	.4byte	.LASF107
	.byte	0x56
	.byte	0x10
	.4byte	.LASF108
	.byte	0x57
	.byte	0x10
	.4byte	.LASF109
	.byte	0x58
	.byte	0x10
	.4byte	.LASF110
	.byte	0x59
	.byte	0x10
	.4byte	.LASF111
	.byte	0x5a
	.byte	0x10
	.4byte	.LASF112
	.byte	0x5b
	.byte	0x10
	.4byte	.LASF113
	.byte	0x5c
	.byte	0x10
	.4byte	.LASF114
	.byte	0x5d
	.byte	0x10
	.4byte	.LASF115
	.byte	0x5e
	.byte	0x10
	.4byte	.LASF116
	.byte	0x5f
	.byte	0x10
	.4byte	.LASF117
	.byte	0x60
	.byte	0x10
	.4byte	.LASF118
	.byte	0x61
	.byte	0x10
	.4byte	.LASF119
	.byte	0x62
	.byte	0x10
	.4byte	.LASF120
	.byte	0x6a
	.byte	0x10
	.4byte	.LASF121
	.byte	0x6b
	.byte	0x10
	.4byte	.LASF122
	.byte	0x6c
	.byte	0x10
	.4byte	.LASF123
	.byte	0x6d
	.byte	0x10
	.4byte	.LASF124
	.byte	0x6e
	.byte	0x10
	.4byte	.LASF125
	.byte	0x6f
	.byte	0x10
	.4byte	.LASF126
	.byte	0x70
	.byte	0x10
	.4byte	.LASF127
	.byte	0x71
	.byte	0x10
	.4byte	.LASF128
	.byte	0x72
	.byte	0x10
	.4byte	.LASF129
	.byte	0x73
	.byte	0x10
	.4byte	.LASF130
	.byte	0x74
	.byte	0x10
	.4byte	.LASF131
	.byte	0x75
	.byte	0x10
	.4byte	.LASF132
	.byte	0x76
	.byte	0x10
	.4byte	.LASF133
	.byte	0x77
	.byte	0x10
	.4byte	.LASF134
	.byte	0x78
	.byte	0x10
	.4byte	.LASF135
	.byte	0x79
	.byte	0x10
	.4byte	.LASF136
	.byte	0x7c
	.byte	0x10
	.4byte	.LASF137
	.byte	0x80
	.byte	0
	.byte	0xb
	.4byte	0x462
	.4byte	0x6a4
	.byte	0xc
	.4byte	0x181
	.byte	0xf
	.byte	0
	.byte	0x14
	.4byte	0x694
	.byte	0xb
	.4byte	0x456
	.4byte	0x6b9
	.byte	0xc
	.4byte	0x181
	.byte	0x17
	.byte	0
	.byte	0x19
	.4byte	.LASF138
	.2byte	0x164
	.byte	0x6
	.2byte	0x344
	.byte	0x8
	.4byte	0x7f9
	.byte	0x9
	.4byte	.LASF139
	.byte	0x6
	.2byte	0x345
	.byte	0x17
	.4byte	0x462
	.byte	0
	.byte	0x9
	.4byte	.LASF140
	.byte	0x6
	.2byte	0x346
	.byte	0x17
	.4byte	0x462
	.byte	0x4
	.byte	0x9
	.4byte	.LASF141
	.byte	0x6
	.2byte	0x347
	.byte	0x17
	.4byte	0x462
	.byte	0x8
	.byte	0x9
	.4byte	.LASF142
	.byte	0x6
	.2byte	0x348
	.byte	0x17
	.4byte	0x462
	.byte	0xc
	.byte	0x9
	.4byte	.LASF143
	.byte	0x6
	.2byte	0x349
	.byte	0x17
	.4byte	0x462
	.byte	0x10
	.byte	0x9
	.4byte	.LASF144
	.byte	0x6
	.2byte	0x34a
	.byte	0x17
	.4byte	0x6a4
	.byte	0x14
	.byte	0x9
	.4byte	.LASF145
	.byte	0x6
	.2byte	0x34b
	.byte	0x17
	.4byte	0x6a4
	.byte	0x54
	.byte	0x9
	.4byte	.LASF146
	.byte	0x6
	.2byte	0x34c
	.byte	0x17
	.4byte	0x462
	.byte	0x94
	.byte	0x9
	.4byte	.LASF147
	.byte	0x6
	.2byte	0x34d
	.byte	0x17
	.4byte	0x462
	.byte	0x98
	.byte	0x9
	.4byte	.LASF148
	.byte	0x6
	.2byte	0x34e
	.byte	0x17
	.4byte	0x462
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF149
	.byte	0x6
	.2byte	0x34f
	.byte	0x13
	.4byte	0x6a9
	.byte	0xa0
	.byte	0x1a
	.4byte	.LASF150
	.byte	0x6
	.2byte	0x350
	.byte	0x17
	.4byte	0x462
	.2byte	0x100
	.byte	0x1a
	.4byte	.LASF151
	.byte	0x6
	.2byte	0x351
	.byte	0x17
	.4byte	0x462
	.2byte	0x104
	.byte	0x1a
	.4byte	.LASF152
	.byte	0x6
	.2byte	0x352
	.byte	0x17
	.4byte	0x462
	.2byte	0x108
	.byte	0x1a
	.4byte	.LASF153
	.byte	0x6
	.2byte	0x353
	.byte	0x1d
	.4byte	0x467
	.2byte	0x10c
	.byte	0x1a
	.4byte	.LASF154
	.byte	0x6
	.2byte	0x354
	.byte	0x17
	.4byte	0x462
	.2byte	0x110
	.byte	0x1a
	.4byte	.LASF155
	.byte	0x6
	.2byte	0x355
	.byte	0x17
	.4byte	0x462
	.2byte	0x114
	.byte	0x1a
	.4byte	.LASF156
	.byte	0x6
	.2byte	0x356
	.byte	0x17
	.4byte	0x462
	.2byte	0x118
	.byte	0x1a
	.4byte	.LASF157
	.byte	0x6
	.2byte	0x357
	.byte	0x17
	.4byte	0x462
	.2byte	0x11c
	.byte	0x1a
	.4byte	.LASF158
	.byte	0x6
	.2byte	0x358
	.byte	0x1d
	.4byte	0x80e
	.2byte	0x120
	.byte	0x1a
	.4byte	.LASF159
	.byte	0x6
	.2byte	0x359
	.byte	0x17
	.4byte	0x462
	.2byte	0x160
	.byte	0
	.byte	0xb
	.4byte	0x467
	.4byte	0x809
	.byte	0xc
	.4byte	0x181
	.byte	0xf
	.byte	0
	.byte	0x5
	.4byte	0x7f9
	.byte	0x14
	.4byte	0x809
	.byte	0x18
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0x8
	.byte	0x2e
	.byte	0x6
	.4byte	0x864
	.byte	0x10
	.4byte	.LASF160
	.byte	0
	.byte	0x10
	.4byte	.LASF161
	.byte	0x1
	.byte	0x10
	.4byte	.LASF162
	.byte	0x2
	.byte	0x10
	.4byte	.LASF163
	.byte	0x3
	.byte	0x10
	.4byte	.LASF164
	.byte	0x4
	.byte	0x10
	.4byte	.LASF165
	.byte	0x5
	.byte	0x10
	.4byte	.LASF166
	.byte	0x6
	.byte	0x10
	.4byte	.LASF167
	.byte	0x7
	.byte	0x10
	.4byte	.LASF168
	.byte	0x8
	.byte	0x10
	.4byte	.LASF169
	.byte	0x9
	.byte	0x10
	.4byte	.LASF170
	.byte	0xa
	.byte	0
	.byte	0x1b
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0x9
	.2byte	0x42b
	.byte	0xe
	.4byte	0x898
	.byte	0x10
	.4byte	.LASF171
	.byte	0
	.byte	0x10
	.4byte	.LASF172
	.byte	0x1
	.byte	0x10
	.4byte	.LASF173
	.byte	0x2
	.byte	0x10
	.4byte	.LASF174
	.byte	0x3
	.byte	0x10
	.4byte	.LASF175
	.byte	0x4
	.byte	0x10
	.4byte	.LASF176
	.byte	0x5
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF177
	.byte	0x18
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0xa
	.byte	0x35
	.byte	0xe
	.4byte	0x8d2
	.byte	0x10
	.4byte	.LASF178
	.byte	0
	.byte	0x10
	.4byte	.LASF179
	.byte	0x1
	.byte	0x10
	.4byte	.LASF180
	.byte	0x2
	.byte	0x10
	.4byte	.LASF181
	.byte	0x3
	.byte	0x10
	.4byte	.LASF182
	.byte	0x4
	.byte	0x10
	.4byte	.LASF183
	.byte	0x5
	.byte	0
	.byte	0x18
	.byte	0x7
	.byte	0x4
	.4byte	0x181
	.byte	0xb
	.byte	0x1d
	.byte	0xe
	.4byte	0x8ed
	.byte	0x10
	.4byte	.LASF184
	.byte	0
	.byte	0x10
	.4byte	.LASF185
	.byte	0x1
	.byte	0
	.byte	0x15
	.4byte	.LASF186
	.byte	0x74
	.byte	0x1
	.byte	0x1b
	.byte	0x8
	.4byte	0x93c
	.byte	0x17
	.string	"reg"
	.byte	0x1
	.byte	0x1d
	.byte	0x18
	.4byte	0x93c
	.byte	0
	.byte	0x17
	.string	"chn"
	.byte	0x1
	.byte	0x1e
	.byte	0x11
	.4byte	0x67
	.byte	0x4
	.byte	0x16
	.4byte	.LASF187
	.byte	0x1
	.byte	0x1f
	.byte	0x11
	.4byte	0x67
	.byte	0x8
	.byte	0x16
	.4byte	.LASF188
	.byte	0x1
	.byte	0x20
	.byte	0x15
	.4byte	0x1bc
	.byte	0xc
	.byte	0x16
	.4byte	.LASF189
	.byte	0x1
	.byte	0x21
	.byte	0x1a
	.4byte	0x4b8
	.byte	0x2c
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x6b9
	.byte	0x1c
	.4byte	.LASF186
	.byte	0x1
	.byte	0x24
	.byte	0x19
	.4byte	0x8ed
	.byte	0x5
	.byte	0x3
	.4byte	rk_saradc
	.byte	0x1c
	.4byte	.LASF190
	.byte	0x1
	.byte	0x5b
	.byte	0x20
	.4byte	0x494
	.byte	0x5
	.byte	0x3
	.4byte	rk_saradc_ops
	.byte	0x1d
	.4byte	.LASF217
	.byte	0x1
	.byte	0x82
	.byte	0x27
	.4byte	0xdc
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rk_saradc_init
	.byte	0x1e
	.4byte	.LASF194
	.byte	0x1
	.byte	0x60
	.byte	0xc
	.4byte	0x8d
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0xa54
	.byte	0x1f
	.4byte	.LASF191
	.byte	0x1
	.byte	0x62
	.byte	0x9
	.4byte	0x8d
	.4byte	.LLST0
	.byte	0x20
	.4byte	.LVL1
	.4byte	0xbee
	.4byte	0x9b6
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x5c
	.byte	0
	.byte	0x20
	.4byte	.LVL2
	.4byte	0xbee
	.4byte	0x9ca
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x5d
	.byte	0
	.byte	0x20
	.4byte	.LVL3
	.4byte	0xbfb
	.4byte	0x9ef
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0+12
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x20
	.4byte	.LVL4
	.4byte	0xc08
	.4byte	0xa15
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	rk_saradc_irq_handler
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0x21
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x20
	.4byte	.LVL5
	.4byte	0xc14
	.4byte	0xa28
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x41
	.byte	0
	.byte	0x22
	.4byte	.LVL6
	.4byte	0xc20
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0+44
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x21
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LASF218
	.byte	0x1
	.byte	0x50
	.byte	0xd
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0xac2
	.byte	0x24
	.4byte	.LASF192
	.byte	0x1
	.byte	0x50
	.byte	0x27
	.4byte	0x8d
	.4byte	.LLST7
	.byte	0x24
	.4byte	.LASF193
	.byte	0x1
	.byte	0x50
	.byte	0x35
	.4byte	0x18f
	.4byte	.LLST8
	.byte	0x25
	.4byte	.LVL26
	.4byte	0xc2c
	.byte	0x25
	.4byte	.LVL27
	.4byte	0xc39
	.byte	0x20
	.4byte	.LVL28
	.4byte	0xc45
	.4byte	0xab8
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0+12
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x26
	.4byte	.LVL29
	.4byte	0xc52
	.byte	0
	.byte	0x1e
	.4byte	.LASF195
	.byte	0x1
	.byte	0x36
	.byte	0x11
	.4byte	0xac
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0xbbe
	.byte	0x24
	.4byte	.LASF196
	.byte	0x1
	.byte	0x36
	.byte	0x3b
	.4byte	0x4b2
	.4byte	.LLST1
	.byte	0x24
	.4byte	.LASF197
	.byte	0x1
	.byte	0x36
	.byte	0x4f
	.4byte	0x67
	.4byte	.LLST2
	.byte	0x24
	.4byte	.LASF198
	.byte	0x1
	.byte	0x36
	.byte	0x65
	.4byte	0x1e7
	.4byte	.LLST3
	.byte	0x27
	.string	"ret"
	.byte	0x1
	.byte	0x38
	.byte	0x9
	.4byte	0x8d
	.4byte	.LLST4
	.byte	0x1f
	.4byte	.LASF186
	.byte	0x1
	.byte	0x3a
	.byte	0x17
	.4byte	0xbbe
	.4byte	.LLST5
	.byte	0x28
	.4byte	0xbc4
	.4byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x41
	.byte	0xb
	.4byte	0xb8c
	.byte	0x29
	.4byte	0xbd5
	.4byte	.LLST6
	.byte	0x2a
	.4byte	.Ldebug_ranges0+0
	.byte	0x2b
	.4byte	0xbe1
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x20
	.4byte	.LVL14
	.4byte	0xc5f
	.4byte	0xb69
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x22
	.4byte	.LVL15
	.4byte	0xc6b
	.byte	0x21
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0xc
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x36
	.byte	0x21
	.byte	0x1
	.byte	0x5e
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LVL13
	.4byte	0xc78
	.4byte	0xba0
	.byte	0x21
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LVL23
	.4byte	0xc84
	.4byte	0xbb4
	.byte	0x21
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x25
	.4byte	.LVL24
	.4byte	0xc90
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x8ed
	.byte	0x2c
	.4byte	.LASF219
	.byte	0x1
	.byte	0x26
	.byte	0x11
	.4byte	0xac
	.byte	0x1
	.4byte	0xbee
	.byte	0x2d
	.4byte	.LASF186
	.byte	0x1
	.byte	0x26
	.byte	0x3c
	.4byte	0xbbe
	.byte	0x2e
	.4byte	.LASF220
	.byte	0x1
	.byte	0x28
	.byte	0x11
	.4byte	0x67
	.byte	0
	.byte	0x2f
	.4byte	.LASF199
	.4byte	.LASF199
	.byte	0xc
	.2byte	0x10d
	.byte	0xc
	.byte	0x2f
	.4byte	.LASF200
	.4byte	.LASF200
	.byte	0xd
	.2byte	0x145
	.byte	0xa
	.byte	0x30
	.4byte	.LASF201
	.4byte	.LASF201
	.byte	0xe
	.byte	0x5a
	.byte	0x12
	.byte	0x30
	.4byte	.LASF202
	.4byte	.LASF202
	.byte	0xe
	.byte	0x59
	.byte	0x6
	.byte	0x30
	.4byte	.LASF203
	.4byte	.LASF203
	.byte	0x5
	.byte	0x24
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF204
	.4byte	.LASF204
	.byte	0xd
	.2byte	0x1b8
	.byte	0x6
	.byte	0x30
	.4byte	.LASF205
	.4byte	.LASF205
	.byte	0xb
	.byte	0x2c
	.byte	0x6
	.byte	0x2f
	.4byte	.LASF206
	.4byte	.LASF206
	.byte	0xd
	.2byte	0x14a
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF207
	.4byte	.LASF207
	.byte	0xd
	.2byte	0x1b9
	.byte	0x6
	.byte	0x30
	.4byte	.LASF208
	.4byte	.LASF208
	.byte	0xd
	.byte	0x4d
	.byte	0x5
	.byte	0x2f
	.4byte	.LASF209
	.4byte	.LASF209
	.byte	0xd
	.2byte	0x14b
	.byte	0xa
	.byte	0x30
	.4byte	.LASF210
	.4byte	.LASF210
	.byte	0xb
	.byte	0x28
	.byte	0xc
	.byte	0x30
	.4byte	.LASF211
	.4byte	.LASF211
	.byte	0xb
	.byte	0x2a
	.byte	0xa
	.byte	0x30
	.4byte	.LASF212
	.4byte	.LASF212
	.byte	0xb
	.byte	0x29
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1e
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
	.byte	0x2
	.byte	0x17
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
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x28
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
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
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2c
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0x2e
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x30
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
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x9
	.byte	0x7a
	.byte	0
	.byte	0x30
	.byte	0x2e
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x1f
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL25
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL26-1
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL25
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL26-1
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL12
	.4byte	.LVL13-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL13-1
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL11
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x3
	.byte	0x9
	.byte	0xfe
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE38
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL9
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL21
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL13
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x59
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
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB7
	.4byte	.LBE7
	.4byte	0
	.4byte	0
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF68:
	.string	"user_data"
.LASF95:
	.string	"UART2_IRQn"
.LASF122:
	.string	"HPMCU_MBOX2_AP_IRQn"
.LASF50:
	.string	"RT_Device_Class_Timer"
.LASF78:
	.string	"TIMER2_IRQn"
.LASF108:
	.string	"PWM0_CH0_IRQn"
.LASF17:
	.string	"init_fn_t"
.LASF14:
	.string	"rt_err_t"
.LASF60:
	.string	"rx_indicate"
.LASF104:
	.string	"GPIO2_IRQn"
.LASF66:
	.string	"write"
.LASF64:
	.string	"close"
.LASF19:
	.string	"prev"
.LASF194:
	.string	"rk_saradc_init"
.LASF76:
	.string	"TIMER0_IRQn"
.LASF149:
	.string	"RESERVED00A0"
.LASF51:
	.string	"RT_Device_Class_Miscellaneous"
.LASF24:
	.string	"type"
.LASF42:
	.string	"RT_Device_Class_USBDevice"
.LASF62:
	.string	"init"
.LASF145:
	.string	"LOW_COMP"
.LASF180:
	.string	"PWR_CTRL_PWR_EN"
.LASF47:
	.string	"RT_Device_Class_PM"
.LASF195:
	.string	"rk_get_saradc_value"
.LASF10:
	.string	"long long unsigned int"
.LASF218:
	.string	"rk_saradc_irq_handler"
.LASF144:
	.string	"HIGH_COMP"
.LASF192:
	.string	"vector"
.LASF178:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF172:
	.string	"GRF_PUL_INFO"
.LASF18:
	.string	"next"
.LASF214:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_saradc.c"
.LASF98:
	.string	"GPIO6_IRQn"
.LASF196:
	.string	"device"
.LASF6:
	.string	"rt_uint16_t"
.LASF3:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF55:
	.string	"rt_device_t"
.LASF85:
	.string	"MIPI_ISP_IRQn"
.LASF212:
	.string	"HAL_SARADC_Stop"
.LASF46:
	.string	"RT_Device_Class_SDIO"
.LASF35:
	.string	"RT_Device_Class_NetIf"
.LASF103:
	.string	"GPIO10_IRQn"
.LASF30:
	.string	"parent"
.LASF170:
	.string	"PM_RUNTIME_TYPE_END"
.LASF80:
	.string	"TIMER4_IRQn"
.LASF5:
	.string	"rt_uint8_t"
.LASF2:
	.string	"long int"
.LASF75:
	.string	"SARADC_IRQn"
.LASF184:
	.string	"SARADC_INT_MOD"
.LASF133:
	.string	"LPMCU_MBOX1_BB_IRQn"
.LASF125:
	.string	"HPMCU_MBOX1_BB_IRQn"
.LASF135:
	.string	"LPMCU_MBOX3_BB_IRQn"
.LASF112:
	.string	"PWM1_CH0_IRQn"
.LASF36:
	.string	"RT_Device_Class_MTD"
.LASF116:
	.string	"PWM2_CH0_IRQn"
.LASF148:
	.string	"LT_INT_EN"
.LASF174:
	.string	"GRF_SRT_INFO"
.LASF157:
	.string	"MT_INT_ST"
.LASF91:
	.string	"I2C3_IRQn"
.LASF159:
	.string	"AUTO_CH_EN"
.LASF102:
	.string	"GPIO7_IRQn"
.LASF164:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF216:
	.string	"rt_device_class_type"
.LASF215:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF22:
	.string	"rt_object"
.LASF82:
	.string	"SPI0_IRQn"
.LASF107:
	.string	"GPIO11_IRQn"
.LASF20:
	.string	"rt_list_t"
.LASF210:
	.string	"HAL_SARADC_Start"
.LASF198:
	.string	"value"
.LASF81:
	.string	"TIMER5_IRQn"
.LASF38:
	.string	"RT_Device_Class_RTC"
.LASF134:
	.string	"LPMCU_MBOX2_BB_IRQn"
.LASF27:
	.string	"unsigned int"
.LASF123:
	.string	"HPMCU_MBOX3_AP_IRQn"
.LASF181:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF213:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF113:
	.string	"PWM1_CH1_IRQn"
.LASF117:
	.string	"PWM2_CH1_IRQn"
.LASF56:
	.string	"rt_device"
.LASF23:
	.string	"name"
.LASF126:
	.string	"HPMCU_MBOX2_BB_IRQn"
.LASF92:
	.string	"I2C4_IRQn"
.LASF58:
	.string	"ref_count"
.LASF106:
	.string	"GPIO8_IRQn"
.LASF188:
	.string	"event"
.LASF162:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF7:
	.string	"short unsigned int"
.LASF150:
	.string	"MT_INT_EN"
.LASF171:
	.string	"GRF_MUX_INFO"
.LASF53:
	.string	"RT_Device_Class_Touch"
.LASF158:
	.string	"DATA"
.LASF43:
	.string	"RT_Device_Class_USBHost"
.LASF169:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF189:
	.string	"rk_saradc_dev"
.LASF132:
	.string	"LPMCU_MBOX0_BB_IRQn"
.LASF84:
	.string	"VICAP_IRQn"
.LASF39:
	.string	"RT_Device_Class_Sound"
.LASF185:
	.string	"SARADC_POL_MOD"
.LASF143:
	.string	"T_SEL_SOC"
.LASF182:
	.string	"PWR_CTRL_VOLT_ST"
.LASF136:
	.string	"FSPI1_IRQn"
.LASF93:
	.string	"UART0_IRQn"
.LASF97:
	.string	"GPIO3_IRQn"
.LASF114:
	.string	"PWM1_CH2_IRQn"
.LASF31:
	.string	"suspend_thread"
.LASF118:
	.string	"PWM2_CH2_IRQn"
.LASF128:
	.string	"LPMCU_MBOX0_AP_IRQn"
.LASF176:
	.string	"GRF_INFO_NUM"
.LASF201:
	.string	"rt_hw_interrupt_install"
.LASF155:
	.string	"HT_INT_ST"
.LASF8:
	.string	"rt_uint32_t"
.LASF63:
	.string	"open"
.LASF74:
	.string	"rt_adc_device"
.LASF127:
	.string	"HPMCU_MBOX3_BB_IRQn"
.LASF77:
	.string	"TIMER1_IRQn"
.LASF209:
	.string	"rt_event_recv"
.LASF57:
	.string	"open_flag"
.LASF193:
	.string	"param"
.LASF54:
	.string	"RT_Device_Class_Unknown"
.LASF13:
	.string	"rt_ubase_t"
.LASF37:
	.string	"RT_Device_Class_CAN"
.LASF204:
	.string	"rt_interrupt_enter"
.LASF86:
	.string	"MI_ISP_IRQn"
.LASF88:
	.string	"I2C0_IRQn"
.LASF160:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF199:
	.string	"HAL_CRU_ClkEnable"
.LASF101:
	.string	"GPIO4_IRQn"
.LASF207:
	.string	"rt_interrupt_leave"
.LASF163:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF41:
	.string	"RT_Device_Class_I2CBUS"
.LASF83:
	.string	"FSPI0_IRQn"
.LASF217:
	.string	"__rt_init_rk_saradc_init"
.LASF121:
	.string	"HPMCU_MBOX1_AP_IRQn"
.LASF137:
	.string	"NUM_INTERRUPTS"
.LASF94:
	.string	"UART1_IRQn"
.LASF129:
	.string	"LPMCU_MBOX1_AP_IRQn"
.LASF205:
	.string	"HAL_SARADC_IrqHandler"
.LASF177:
	.string	"_Bool"
.LASF4:
	.string	"unsigned char"
.LASF219:
	.string	"rk_wait_saradc_completed"
.LASF33:
	.string	"RT_Device_Class_Char"
.LASF141:
	.string	"T_AS_SOC"
.LASF87:
	.string	"ISP_IRQn"
.LASF1:
	.string	"short int"
.LASF154:
	.string	"END_INT_ST"
.LASF175:
	.string	"GRF_SMT_INFO"
.LASF179:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF52:
	.string	"RT_Device_Class_Sensor"
.LASF25:
	.string	"flag"
.LASF202:
	.string	"rt_hw_interrupt_umask"
.LASF15:
	.string	"rt_size_t"
.LASF89:
	.string	"I2C1_IRQn"
.LASF40:
	.string	"RT_Device_Class_Graphic"
.LASF183:
	.string	"PWR_CTRL_MAX"
.LASF173:
	.string	"GRF_DRV_INFO"
.LASF142:
	.string	"T_DAS_SOC"
.LASF105:
	.string	"GPIO5_IRQn"
.LASF67:
	.string	"control"
.LASF70:
	.string	"uint32_t"
.LASF211:
	.string	"HAL_SARADC_GetRaw"
.LASF72:
	.string	"enabled"
.LASF186:
	.string	"rk_saradc"
.LASF124:
	.string	"HPMCU_MBOX0_BB_IRQn"
.LASF9:
	.string	"long unsigned int"
.LASF147:
	.string	"HT_INT_EN"
.LASF28:
	.string	"char"
.LASF187:
	.string	"mode"
.LASF131:
	.string	"LPMCU_MBOX3_AP_IRQn"
.LASF110:
	.string	"PWM0_CH2_IRQn"
.LASF71:
	.string	"rt_adc_ops"
.LASF59:
	.string	"device_id"
.LASF29:
	.string	"rt_ipc_object"
.LASF130:
	.string	"LPMCU_MBOX2_AP_IRQn"
.LASF166:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF69:
	.string	"__uint32_t"
.LASF96:
	.string	"GPIO0_IRQn"
.LASF79:
	.string	"TIMER3_IRQn"
.LASF99:
	.string	"GPIO9_IRQn"
.LASF109:
	.string	"PWM0_CH1_IRQn"
.LASF49:
	.string	"RT_Device_Class_Portal"
.LASF16:
	.string	"rt_off_t"
.LASF208:
	.string	"rt_tick_from_millisecond"
.LASF73:
	.string	"convert"
.LASF151:
	.string	"END_INT_EN"
.LASF200:
	.string	"rt_event_init"
.LASF45:
	.string	"RT_Device_Class_SPIDevice"
.LASF90:
	.string	"I2C2_IRQn"
.LASF206:
	.string	"rt_event_send"
.LASF11:
	.string	"rt_bool_t"
.LASF152:
	.string	"ST_CON"
.LASF12:
	.string	"rt_base_t"
.LASF165:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF153:
	.string	"STATUS"
.LASF146:
	.string	"DEBOUNCE"
.LASF120:
	.string	"HPMCU_MBOX0_AP_IRQn"
.LASF190:
	.string	"rk_saradc_ops"
.LASF220:
	.string	"status"
.LASF34:
	.string	"RT_Device_Class_Block"
.LASF111:
	.string	"PWM0_CH3_IRQn"
.LASF115:
	.string	"PWM1_CH3_IRQn"
.LASF168:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF119:
	.string	"PWM2_CH3_IRQn"
.LASF197:
	.string	"channel"
.LASF156:
	.string	"LT_INT_ST"
.LASF32:
	.string	"rt_event"
.LASF100:
	.string	"GPIO1_IRQn"
.LASF44:
	.string	"RT_Device_Class_SPIBUS"
.LASF65:
	.string	"read"
.LASF167:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF139:
	.string	"CONV_CON"
.LASF138:
	.string	"SARADC_REG"
.LASF140:
	.string	"T_PD_SOC"
.LASF21:
	.string	"rt_list_node"
.LASF61:
	.string	"tx_complete"
.LASF26:
	.string	"list"
.LASF191:
	.string	"result"
.LASF48:
	.string	"RT_Device_Class_Pipe"
.LASF203:
	.string	"rt_hw_adc_register"
.LASF161:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
