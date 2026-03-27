	.file	"hal_debug.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_AssertFailed,"ax",@progbits
	.align	1
	.weak	HAL_AssertFailed
	.type	HAL_AssertFailed, @function
HAL_AssertFailed:
.LFB18:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_debug.c"
	.loc 1 71 1
	.cfi_startproc
.LVL0:
.L2:
	.loc 1 72 35 discriminator 1
	.loc 1 73 5 discriminator 1
	.loc 1 74 9 discriminator 1
	.loc 1 73 11 discriminator 1
	j	.L2
	.cfi_endproc
.LFE18:
	.size	HAL_AssertFailed, .-HAL_AssertFailed
	.section	.text.HAL_DBG_HEX,"ax",@progbits
	.align	1
	.globl	HAL_DBG_HEX
	.type	HAL_DBG_HEX, @function
HAL_DBG_HEX:
.LFB19:
	.loc 1 88 1
	.cfi_startproc
.LVL1:
	.loc 1 117 5
	.loc 1 118 1 is_stmt 0
	li	a0,0
.LVL2:
	ret
	.cfi_endproc
.LFE19:
	.size	HAL_DBG_HEX, .-HAL_DBG_HEX
	.section	.text.HAL_DBG_Printf,"ax",@progbits
	.align	1
	.weak	HAL_DBG_Printf
	.type	HAL_DBG_Printf, @function
HAL_DBG_Printf:
.LFB20:
	.loc 1 343 1 is_stmt 1
	.cfi_startproc
.LVL3:
	.loc 1 344 5
	.loc 1 343 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 343 1
	sw	a1,4(sp)
	sw	a2,8(sp)
	sw	a3,12(sp)
	sw	a4,16(sp)
	sw	a5,20(sp)
	sw	a6,24(sp)
	sw	a7,28(sp)
	.loc 1 345 1
	li	a0,0
.LVL4:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	HAL_DBG_Printf, .-HAL_DBG_Printf
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1af
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF29
	.byte	0xc
	.4byte	.LASF30
	.4byte	.LASF31
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
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4d
	.byte	0x12
	.4byte	0x4d
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
	.byte	0x5
	.byte	0x4
	.byte	0x6
	.byte	0x4
	.4byte	0x8b
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x7
	.4byte	0x8b
	.byte	0x6
	.byte	0x4
	.4byte	0x92
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x41
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x54
	.byte	0x8
	.byte	0x5
	.byte	0x4
	.4byte	0x75
	.byte	0x4
	.byte	0xae
	.byte	0xe
	.4byte	0xef
	.byte	0x9
	.4byte	.LASF14
	.byte	0
	.byte	0xa
	.4byte	.LASF15
	.byte	0x7f
	.byte	0xa
	.4byte	.LASF16
	.byte	0x70
	.byte	0xa
	.4byte	.LASF17
	.byte	0x6d
	.byte	0xa
	.4byte	.LASF18
	.byte	0x6a
	.byte	0xa
	.4byte	.LASF19
	.byte	0x5a
	.byte	0xa
	.4byte	.LASF20
	.byte	0x92,0x7f
	.byte	0
	.byte	0x3
	.4byte	.LASF21
	.byte	0x4
	.byte	0xb6
	.byte	0x3
	.4byte	0xb5
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF22
	.byte	0xb
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x156
	.byte	0x1f
	.4byte	0x9d
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x130
	.byte	0xc
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x156
	.byte	0x3a
	.4byte	0x97
	.4byte	.LLST1
	.byte	0xd
	.byte	0
	.byte	0xe
	.4byte	.LASF24
	.byte	0x1
	.byte	0x57
	.byte	0xc
	.4byte	0xef
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x183
	.byte	0xf
	.string	"s"
	.byte	0x1
	.byte	0x57
	.byte	0x1e
	.4byte	0x85
	.4byte	.LLST0
	.byte	0x10
	.string	"buf"
	.byte	0x1
	.byte	0x57
	.byte	0x27
	.4byte	0x83
	.byte	0x1
	.byte	0x5b
	.byte	0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0x57
	.byte	0x35
	.4byte	0xa9
	.byte	0x1
	.byte	0x5c
	.byte	0x10
	.string	"len"
	.byte	0x1
	.byte	0x57
	.byte	0x45
	.4byte	0xa9
	.byte	0x1
	.byte	0x5d
	.byte	0
	.byte	0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0x46
	.byte	0x1c
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.byte	0x11
	.4byte	.LASF27
	.byte	0x1
	.byte	0x46
	.byte	0x39
	.4byte	0x97
	.byte	0x1
	.byte	0x5a
	.byte	0x11
	.4byte	.LASF28
	.byte	0x1
	.byte	0x46
	.byte	0x48
	.4byte	0xa9
	.byte	0x1
	.byte	0x5b
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL4
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LFE19
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
.LASF24:
	.string	"HAL_DBG_HEX"
.LASF5:
	.string	"__int32_t"
.LASF4:
	.string	"long int"
.LASF14:
	.string	"HAL_OK"
.LASF32:
	.string	"HAL_AssertFailed"
.LASF18:
	.string	"HAL_INVAL"
.LASF30:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_debug.c"
.LASF27:
	.string	"file"
.LASF1:
	.string	"unsigned char"
.LASF19:
	.string	"HAL_NOSYS"
.LASF7:
	.string	"long unsigned int"
.LASF3:
	.string	"short unsigned int"
.LASF20:
	.string	"HAL_TIMEOUT"
.LASF6:
	.string	"__uint32_t"
.LASF25:
	.string	"format"
.LASF10:
	.string	"unsigned int"
.LASF17:
	.string	"HAL_NODEV"
.LASF28:
	.string	"line"
.LASF23:
	.string	"HAL_DBG_Printf"
.LASF12:
	.string	"int32_t"
.LASF21:
	.string	"HAL_Status"
.LASF8:
	.string	"long long int"
.LASF11:
	.string	"char"
.LASF26:
	.string	"width"
.LASF2:
	.string	"short int"
.LASF15:
	.string	"HAL_ERROR"
.LASF29:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF13:
	.string	"uint32_t"
.LASF16:
	.string	"HAL_BUSY"
.LASF0:
	.string	"signed char"
.LASF31:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF22:
	.string	"_Bool"
.LASF9:
	.string	"long long unsigned int"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
