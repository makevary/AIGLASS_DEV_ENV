	.file	"hal_base_ex.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_DivU64Rem,"ax",@progbits
	.align	1
	.globl	HAL_DivU64Rem
	.type	HAL_DivU64Rem, @function
HAL_DivU64Rem:
.LFB18:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base_ex.c"
	.loc 1 48 1
	.cfi_startproc
.LVL0:
	.loc 1 49 5
	.loc 1 48 1 is_stmt 0
	mv	t1,a0
.LVL1:
	.loc 1 50 5 is_stmt 1
	.loc 1 48 1 is_stmt 0
	mv	a4,a1
	.loc 1 50 14
	li	a5,0
.LVL2:
	.loc 1 51 5 is_stmt 1
	.loc 1 52 5
	.loc 1 53 5
	.loc 1 55 5
	.loc 1 56 5
	.loc 1 56 8 is_stmt 0
	bgtu	a2,a1,.L11
	.loc 1 57 9 is_stmt 1
	.loc 1 57 14 is_stmt 0
	divu	a1,a1,a2
.LVL3:
	.loc 1 58 9 is_stmt 1
	.loc 1 58 16 is_stmt 0
	li	a0,0
.LVL4:
	.loc 1 59 9 is_stmt 1
	.loc 1 59 38 is_stmt 0
	mul	a6,a2,a1
	.loc 1 59 19
	sub	a4,a4,a6
.LVL5:
.L2:
	.loc 1 55 12
	li	a7,1
	li	a6,0
	j	.L3
.LVL6:
.L6:
	.loc 1 63 9 is_stmt 1
	.loc 1 63 11 is_stmt 0
	srli	t3,a2,31
	slli	a5,a5,1
.LVL7:
	or	a5,t3,a5
	.loc 1 64 11
	slli	a6,a6,1
.LVL8:
	srli	t3,a7,31
	.loc 1 63 11
	slli	a2,a2,1
	.loc 1 64 9 is_stmt 1
	.loc 1 64 11 is_stmt 0
	or	a6,t3,a6
	slli	a7,a7,1
.LVL9:
.L3:
	.loc 1 62 11 is_stmt 1
	bgt	a5,zero,.L12
	bne	a5,zero,.L16
	beq	a2,zero,.L16
.L12:
	.loc 1 62 27 is_stmt 0 discriminator 1
	bgtu	a4,a5,.L6
	bne	a4,a5,.L16
	bgtu	t1,a2,.L6
.LVL10:
.L16:
	.loc 1 67 5 is_stmt 1
	.loc 1 68 9
	.loc 1 68 12 is_stmt 0
	bgtu	a5,a4,.L8
	bne	a5,a4,.L13
	bgtu	a2,t1,.L8
.L13:
	.loc 1 69 13 is_stmt 1
	.loc 1 69 23 is_stmt 0
	sub	t3,t1,a2
	sgtu	t4,t3,t1
	sub	a4,a4,a5
.LVL11:
	mv	t1,t3
	.loc 1 70 20
	add	t3,a0,a7
	.loc 1 69 23
	sub	a4,a4,t4
.LVL12:
	.loc 1 70 13 is_stmt 1
	.loc 1 70 20 is_stmt 0
	add	a1,a1,a6
.LVL13:
	sltu	t4,t3,a0
	add	a1,t4,a1
.LVL14:
	mv	a0,t3
.LVL15:
.L8:
	.loc 1 72 9 is_stmt 1
	.loc 1 72 11 is_stmt 0
	slli	t3,a5,31
	srli	a2,a2,1
.LVL16:
	or	a2,t3,a2
	.loc 1 73 11
	srli	a7,a7,1
.LVL17:
	slli	t3,a6,31
	or	a7,t3,a7
	srli	a6,a6,1
	.loc 1 74 5
	or	t3,a7,a6
	.loc 1 72 11
	srli	a5,a5,1
.LVL18:
	.loc 1 73 9 is_stmt 1
	.loc 1 74 13
	.loc 1 74 5 is_stmt 0
	bne	t3,zero,.L16
	.loc 1 76 5 is_stmt 1
	.loc 1 76 8 is_stmt 0
	beq	a3,zero,.L1
	.loc 1 77 9 is_stmt 1
	.loc 1 77 21 is_stmt 0
	sw	t1,0(a3)
	.loc 1 80 5 is_stmt 1
.L1:
	.loc 1 81 1 is_stmt 0
	ret
.LVL19:
.L11:
	.loc 1 55 12
	li	a0,0
.LVL20:
	li	a1,0
.LVL21:
	j	.L2
	.cfi_endproc
.LFE18:
	.size	HAL_DivU64Rem, .-HAL_DivU64Rem
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x159
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF23
	.byte	0xc
	.4byte	.LASF24
	.4byte	.LASF25
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x5b
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x67
	.byte	0x17
	.4byte	0x6e
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.4byte	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x4f
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x38
	.byte	0x13
	.4byte	0x62
	.byte	0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x75
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF16
	.byte	0x5
	.4byte	.LASF26
	.byte	0x1
	.byte	0x2f
	.byte	0xa
	.4byte	0xae
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x156
	.byte	0x6
	.4byte	.LASF17
	.byte	0x1
	.byte	0x2f
	.byte	0x21
	.4byte	0xae
	.4byte	.LLST0
	.byte	0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2f
	.byte	0x35
	.4byte	0x96
	.4byte	.LLST1
	.byte	0x7
	.4byte	.LASF19
	.byte	0x1
	.byte	0x2f
	.byte	0x4c
	.4byte	0x156
	.byte	0x1
	.byte	0x5d
	.byte	0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x31
	.byte	0xe
	.4byte	0xae
	.4byte	.LLST2
	.byte	0x9
	.string	"b"
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.4byte	0xae
	.4byte	.LLST3
	.byte	0x8
	.4byte	.LASF21
	.byte	0x1
	.byte	0x33
	.byte	0xe
	.4byte	0xae
	.4byte	.LLST4
	.byte	0x9
	.string	"d"
	.byte	0x1
	.byte	0x34
	.byte	0xe
	.4byte	0xae
	.4byte	.LLST5
	.byte	0x8
	.4byte	.LASF22
	.byte	0x1
	.byte	0x35
	.byte	0xe
	.4byte	0x96
	.4byte	.LLST6
	.byte	0
	.byte	0xa
	.byte	0x4
	.4byte	0x96
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
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL4
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL4
	.4byte	.LVL19
	.2byte	0x6
	.byte	0xf3
	.byte	0x3
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL20
	.4byte	.LFE18
	.2byte	0x6
	.byte	0xf3
	.byte	0x3
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL6
	.4byte	.LVL19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LFE18
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5e
	.byte	0x93
	.byte	0x4
	.4byte	.LVL6
	.4byte	.LVL11
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5e
	.byte	0x93
	.byte	0x4
	.4byte	.LVL12
	.4byte	.LVL19
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5e
	.byte	0x93
	.byte	0x4
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL21
	.4byte	.LFE18
	.2byte	0x6
	.byte	0x56
	.byte	0x93
	.byte	0x4
	.byte	0x5e
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2
	.4byte	.LVL7
	.2byte	0x6
	.byte	0x5c
	.byte	0x93
	.byte	0x4
	.byte	0x5f
	.byte	0x93
	.byte	0x4
	.4byte	.LVL9
	.4byte	.LVL16
	.2byte	0x6
	.byte	0x5c
	.byte	0x93
	.byte	0x4
	.byte	0x5f
	.byte	0x93
	.byte	0x4
	.4byte	.LVL18
	.4byte	.LFE18
	.2byte	0x6
	.byte	0x5c
	.byte	0x93
	.byte	0x4
	.byte	0x5f
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x5f
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL6
	.4byte	.LVL13
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x6
	.byte	0x6c
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL15
	.4byte	.LVL19
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL19
	.4byte	.LFE18
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL2
	.4byte	.LVL6
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x1
	.4byte	.LVL6
	.4byte	.LVL8
	.2byte	0x6
	.byte	0x61
	.byte	0x93
	.byte	0x4
	.byte	0x60
	.byte	0x93
	.byte	0x4
	.4byte	.LVL9
	.4byte	.LVL17
	.2byte	0x6
	.byte	0x61
	.byte	0x93
	.byte	0x4
	.byte	0x60
	.byte	0x93
	.byte	0x4
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x6
	.byte	0x61
	.byte	0x93
	.byte	0x4
	.byte	0x60
	.byte	0x93
	.byte	0x4
	.4byte	.LVL19
	.4byte	.LFE18
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0x1
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL21
	.4byte	.LFE18
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
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
.LASF24:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base_ex.c"
.LASF18:
	.string	"denominator"
.LASF11:
	.string	"unsigned int"
.LASF13:
	.string	"uint32_t"
.LASF7:
	.string	"__uint32_t"
.LASF22:
	.string	"high"
.LASF14:
	.string	"int64_t"
.LASF6:
	.string	"long unsigned int"
.LASF20:
	.string	"remainder"
.LASF0:
	.string	"long long unsigned int"
.LASF15:
	.string	"uint64_t"
.LASF8:
	.string	"__int64_t"
.LASF23:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF2:
	.string	"unsigned char"
.LASF12:
	.string	"char"
.LASF21:
	.string	"result"
.LASF5:
	.string	"long int"
.LASF19:
	.string	"pRemainder"
.LASF16:
	.string	"_Bool"
.LASF9:
	.string	"long long int"
.LASF4:
	.string	"short unsigned int"
.LASF1:
	.string	"signed char"
.LASF26:
	.string	"HAL_DivU64Rem"
.LASF17:
	.string	"numerator"
.LASF3:
	.string	"short int"
.LASF10:
	.string	"__uint64_t"
.LASF25:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
