	.file	"drv_pstore.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.write_log_to_ram,"ax",@progbits
	.align	1
	.type	write_log_to_ram, @function
write_log_to_ram:
.LFB38:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pstore.c"
	.loc 1 66 1
	.cfi_startproc
.LVL0:
	.loc 1 67 5
	.loc 1 69 5
	.loc 1 71 5
	.loc 1 71 11 is_stmt 0
	li	a5,507904
	addi	a1,a5,12
.LVL1:
	.loc 1 71 9
	lw	a5,4(a5)
	.loc 1 78 16
	li	a3,16384
	.loc 1 74 12
	li	a6,10
	.loc 1 71 9
	add	a5,a1,a5
.LVL2:
	.loc 1 72 5 is_stmt 1
	.loc 1 76 20 is_stmt 0
	li	a7,13
	.loc 1 78 19
	li	a4,507904
	.loc 1 78 16
	addi	a3,a3,-13
.LVL3:
.L2:
	.loc 1 72 11 is_stmt 1
	.loc 1 72 12 is_stmt 0
	lbu	a2,0(a0)
	.loc 1 72 11
	bne	a2,zero,.L9
	.loc 1 101 1
	ret
.L9:
	.loc 1 74 9 is_stmt 1
	.loc 1 74 12 is_stmt 0
	bne	a2,a6,.L3
	.loc 1 76 13 is_stmt 1
.LVL4:
	.loc 1 76 20 is_stmt 0
	sb	a7,0(a5)
	.loc 1 78 13 is_stmt 1
	.loc 1 78 19 is_stmt 0
	lw	a2,8(a4)
	.loc 1 78 16
	bgtu	a2,a3,.L4
	.loc 1 79 17 is_stmt 1
	.loc 1 79 25 is_stmt 0
	addi	a2,a2,1
	sw	a2,8(a4)
.L4:
	.loc 1 81 13 is_stmt 1
	.loc 1 81 22 is_stmt 0
	lw	a2,4(a4)
	addi	a2,a2,1
	.loc 1 82 13 is_stmt 1
	.loc 1 82 16 is_stmt 0
	bgtu	a2,a3,.L5
	.loc 1 76 17
	addi	a5,a5,1
.LVL5:
	.loc 1 81 22
	sw	a2,4(a4)
.LVL6:
.L3:
	.loc 1 89 9 is_stmt 1
	.loc 1 89 18 is_stmt 0
	lbu	a2,0(a0)
	.loc 1 89 22
	addi	a0,a0,1
.LVL7:
	.loc 1 89 16
	sb	a2,0(a5)
	.loc 1 91 9 is_stmt 1
	.loc 1 91 15 is_stmt 0
	lw	a2,8(a4)
	.loc 1 91 12
	bgtu	a2,a3,.L6
	.loc 1 92 13 is_stmt 1
	.loc 1 92 21 is_stmt 0
	addi	a2,a2,1
	sw	a2,8(a4)
.L6:
	.loc 1 94 9 is_stmt 1
	.loc 1 94 18 is_stmt 0
	lw	a2,4(a4)
	addi	a2,a2,1
	.loc 1 95 9 is_stmt 1
	.loc 1 95 12 is_stmt 0
	bgtu	a2,a3,.L7
	.loc 1 89 13
	addi	a5,a5,1
.LVL8:
	.loc 1 94 18
	sw	a2,4(a4)
	j	.L2
.LVL9:
.L5:
	.loc 1 84 17 is_stmt 1
	.loc 1 84 27 is_stmt 0
	sw	zero,4(a4)
	.loc 1 85 17 is_stmt 1
.LVL10:
	.loc 1 85 21 is_stmt 0
	mv	a5,a1
	j	.L3
.LVL11:
.L7:
	.loc 1 97 13 is_stmt 1
	.loc 1 97 23 is_stmt 0
	sw	zero,4(a4)
	.loc 1 98 13 is_stmt 1
.LVL12:
	.loc 1 98 17 is_stmt 0
	mv	a5,a1
	j	.L2
	.cfi_endproc
.LFE38:
	.size	write_log_to_ram, .-write_log_to_ram
	.section	.text.pstore_dev_init,"ax",@progbits
	.align	1
	.type	pstore_dev_init, @function
pstore_dev_init:
.LFB39:
	.loc 1 104 1 is_stmt 1
	.cfi_startproc
	.loc 1 105 5
.LBB4:
.LBB5:
	.loc 1 46 5
.LVL13:
	.loc 1 48 5
	.loc 1 49 5
	.loc 1 51 5
	.loc 1 51 11 is_stmt 0
	li	a5,507904
	.loc 1 51 8
	lw	a3,0(a5)
.LBE5:
.LBE4:
	.loc 1 104 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB9:
.LBB6:
	.loc 1 51 8
	li	a4,1128742912
.LBE6:
.LBE9:
	.loc 1 104 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
.LBB10:
.LBB7:
	.loc 1 51 8
	addi	a4,a4,580
	beq	a3,a4,.L11
	.loc 1 53 9 is_stmt 1
	.loc 1 53 17 is_stmt 0
	sw	a4,0(a5)
	.loc 1 54 9 is_stmt 1
	.loc 1 54 19 is_stmt 0
	sw	zero,4(a5)
	.loc 1 55 9 is_stmt 1
	.loc 1 55 18 is_stmt 0
	sw	zero,8(a5)
	.loc 1 58 5 is_stmt 1
	.loc 1 61 5
.L12:
.LBE7:
.LBE10:
	.loc 1 106 5
	lla	a0,write_log_to_ram
	call	rt_console_set_output_hook
.LVL14:
	.loc 1 107 5
	.loc 1 108 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L11:
	.cfi_restore_state
.LBB11:
.LBB8:
	.loc 1 58 5 is_stmt 1
	.loc 1 58 8 is_stmt 0
	lw	a3,8(a5)
	li	a4,16384
	addi	a4,a4,-12
	bleu	a3,a4,.L13
	.loc 1 59 9 is_stmt 1
	.loc 1 59 18 is_stmt 0
	sw	a4,8(a5)
.L13:
	.loc 1 61 5 is_stmt 1
	.loc 1 61 11 is_stmt 0
	li	a4,507904
	.loc 1 61 8
	lw	a3,4(a4)
	li	a5,16384
	addi	a5,a5,-13
	bleu	a3,a5,.L12
	.loc 1 62 9 is_stmt 1
	.loc 1 62 19 is_stmt 0
	sw	zero,4(a4)
	j	.L12
.LBE8:
.LBE11:
	.cfi_endproc
.LFE39:
	.size	pstore_dev_init, .-pstore_dev_init
	.globl	__rt_init_pstore_dev_init
	.section	.rti_fn.1,"a"
	.align	2
	.type	__rt_init_pstore_dev_init, @object
	.size	__rt_init_pstore_dev_init, 4
__rt_init_pstore_dev_init:
	.word	pstore_dev_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2d1
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF43
	.byte	0xc
	.4byte	.LASF44
	.4byte	.LASF45
	.4byte	.Ldebug_ranges0+0x28
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
	.byte	0x5
	.4byte	0x83
	.byte	0x6
	.byte	0x4
	.4byte	0x8a
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
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x4
	.byte	0x2e
	.byte	0x6
	.4byte	0xfe
	.byte	0x8
	.4byte	.LASF14
	.byte	0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.byte	0x2
	.byte	0x8
	.4byte	.LASF17
	.byte	0x3
	.byte	0x8
	.4byte	.LASF18
	.byte	0x4
	.byte	0x8
	.4byte	.LASF19
	.byte	0x5
	.byte	0x8
	.4byte	.LASF20
	.byte	0x6
	.byte	0x8
	.4byte	.LASF21
	.byte	0x7
	.byte	0x8
	.4byte	.LASF22
	.byte	0x8
	.byte	0x8
	.4byte	.LASF23
	.byte	0x9
	.byte	0x8
	.4byte	.LASF24
	.byte	0xa
	.byte	0
	.byte	0x9
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x5
	.2byte	0x42b
	.byte	0xe
	.4byte	0x132
	.byte	0x8
	.4byte	.LASF25
	.byte	0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x8
	.4byte	.LASF27
	.byte	0x2
	.byte	0x8
	.4byte	.LASF28
	.byte	0x3
	.byte	0x8
	.4byte	.LASF29
	.byte	0x4
	.byte	0x8
	.4byte	.LASF30
	.byte	0x5
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x95
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF31
	.byte	0x7
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x6
	.byte	0x35
	.byte	0xe
	.4byte	0x172
	.byte	0x8
	.4byte	.LASF32
	.byte	0
	.byte	0x8
	.4byte	.LASF33
	.byte	0x1
	.byte	0x8
	.4byte	.LASF34
	.byte	0x2
	.byte	0x8
	.4byte	.LASF35
	.byte	0x3
	.byte	0x8
	.4byte	.LASF36
	.byte	0x4
	.byte	0x8
	.4byte	.LASF37
	.byte	0x5
	.byte	0
	.byte	0x3
	.4byte	.LASF38
	.byte	0x7
	.byte	0xb3
	.byte	0xf
	.4byte	0x183
	.byte	0x5
	.4byte	0x172
	.byte	0x6
	.byte	0x4
	.4byte	0x189
	.byte	0xa
	.4byte	0x75
	.byte	0xb
	.4byte	.LASF46
	.byte	0xc
	.byte	0x1
	.byte	0x24
	.byte	0x8
	.4byte	0x1d0
	.byte	0xc
	.string	"sig"
	.byte	0x1
	.byte	0x26
	.byte	0xe
	.4byte	0xa1
	.byte	0
	.byte	0xd
	.4byte	.LASF39
	.byte	0x1
	.byte	0x27
	.byte	0xe
	.4byte	0xa1
	.byte	0x4
	.byte	0xd
	.4byte	.LASF40
	.byte	0x1
	.byte	0x28
	.byte	0xe
	.4byte	0xa1
	.byte	0x8
	.byte	0xd
	.4byte	.LASF41
	.byte	0x1
	.byte	0x29
	.byte	0xd
	.4byte	0x1d0
	.byte	0xc
	.byte	0
	.byte	0xe
	.4byte	0x95
	.4byte	0x1e0
	.byte	0xf
	.4byte	0x7c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF47
	.byte	0x1
	.byte	0x6e
	.byte	0x27
	.4byte	0x17e
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_pstore_dev_init
	.byte	0x11
	.4byte	.LASF48
	.byte	0x1
	.byte	0x67
	.byte	0xc
	.4byte	0x75
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x244
	.byte	0x12
	.4byte	0x2ae
	.4byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x69
	.byte	0x5
	.4byte	0x230
	.byte	0x13
	.4byte	.Ldebug_ranges0+0
	.byte	0x14
	.4byte	0x2bb
	.4byte	0x7c000
	.byte	0
	.byte	0
	.byte	0x15
	.4byte	.LVL14
	.4byte	0x2c7
	.byte	0x16
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	write_log_to_ram
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LASF49
	.byte	0x1
	.byte	0x41
	.byte	0xd
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a8
	.byte	0x18
	.string	"str"
	.byte	0x1
	.byte	0x41
	.byte	0x2a
	.4byte	0x8f
	.4byte	.LLST0
	.byte	0x19
	.4byte	.LASF42
	.byte	0x1
	.byte	0x41
	.byte	0x33
	.4byte	0x75
	.4byte	.LLST1
	.byte	0x1a
	.string	"rb"
	.byte	0x1
	.byte	0x43
	.byte	0x23
	.4byte	0x2a8
	.4byte	0x7c000
	.byte	0x1b
	.string	"src"
	.byte	0x1
	.byte	0x45
	.byte	0xe
	.4byte	0x132
	.byte	0x1
	.byte	0x5a
	.byte	0x1c
	.string	"dst"
	.byte	0x1
	.byte	0x45
	.byte	0x25
	.4byte	0x132
	.4byte	.LLST2
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x18e
	.byte	0x1d
	.4byte	.LASF50
	.byte	0x1
	.byte	0x2c
	.byte	0xd
	.byte	0x1
	.4byte	0x2c7
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0x2e
	.byte	0x23
	.4byte	0x2a8
	.byte	0
	.byte	0x1f
	.4byte	.LASF51
	.4byte	.LASF51
	.byte	0x8
	.2byte	0x1e5
	.byte	0x6
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
	.byte	0xa
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x37
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x20
	.byte	0xb
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
	.byte	0
	.byte	0
	.byte	0x1f
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
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL1
	.4byte	.LFE38
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x3
	.byte	0x7f
	.byte	0x1
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LFE38
	.2byte	0x1
	.byte	0x5b
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
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	.LBB10
	.4byte	.LBE10
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	0
	.4byte	0
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF45:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF5:
	.string	"__uint8_t"
.LASF22:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF26:
	.string	"GRF_PUL_INFO"
.LASF33:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF36:
	.string	"PWR_CTRL_VOLT_ST"
.LASF49:
	.string	"write_log_to_ram"
.LASF35:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF41:
	.string	"data"
.LASF37:
	.string	"PWR_CTRL_MAX"
.LASF50:
	.string	"init_pstore"
.LASF21:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF48:
	.string	"pstore_dev_init"
.LASF9:
	.string	"long long unsigned int"
.LASF27:
	.string	"GRF_DRV_INFO"
.LASF39:
	.string	"start"
.LASF24:
	.string	"PM_RUNTIME_TYPE_END"
.LASF3:
	.string	"short unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF29:
	.string	"GRF_SMT_INFO"
.LASF44:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pstore.c"
.LASF7:
	.string	"long unsigned int"
.LASF15:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
.LASF6:
	.string	"__uint32_t"
.LASF51:
	.string	"rt_console_set_output_hook"
.LASF17:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF25:
	.string	"GRF_MUX_INFO"
.LASF23:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF10:
	.string	"unsigned int"
.LASF38:
	.string	"init_fn_t"
.LASF30:
	.string	"GRF_INFO_NUM"
.LASF0:
	.string	"signed char"
.LASF34:
	.string	"PWR_CTRL_PWR_EN"
.LASF12:
	.string	"uint8_t"
.LASF8:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF42:
	.string	"flush"
.LASF32:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF14:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF2:
	.string	"short int"
.LASF47:
	.string	"__rt_init_pstore_dev_init"
.LASF43:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF13:
	.string	"uint32_t"
.LASF4:
	.string	"long int"
.LASF19:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF16:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF28:
	.string	"GRF_SRT_INFO"
.LASF18:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF40:
	.string	"size"
.LASF31:
	.string	"_Bool"
.LASF20:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF46:
	.string	"persistent_ram_buffer"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
