	.file	"drv_debug.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_AssertFailed,"ax",@progbits
	.align	1
	.globl	HAL_AssertFailed
	.type	HAL_AssertFailed, @function
HAL_AssertFailed:
.LFB33:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_debug.c"
	.loc 1 45 1
	.cfi_startproc
.LVL0:
.L2:
	.loc 1 46 97 discriminator 1
	.loc 1 50 5 discriminator 1
	.loc 1 51 9 discriminator 1
	.loc 1 50 11 discriminator 1
	j	.L2
	.cfi_endproc
.LFE33:
	.size	HAL_AssertFailed, .-HAL_AssertFailed
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xc8
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF15
	.byte	0xc
	.4byte	.LASF16
	.4byte	.LASF17
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
	.4byte	0x6b
	.byte	0x5
	.byte	0x4
	.4byte	0x72
	.byte	0x6
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x6
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x7d
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF12
	.byte	0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x2c
	.byte	0x23
	.4byte	0x77
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.4byte	.LASF14
	.byte	0x1
	.byte	0x2c
	.byte	0x32
	.4byte	0x89
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"long long int"
.LASF14:
	.string	"line"
.LASF8:
	.string	"unsigned int"
.LASF10:
	.string	"__uint32_t"
.LASF6:
	.string	"long unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF15:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF4:
	.string	"unsigned char"
.LASF9:
	.string	"char"
.LASF11:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF13:
	.string	"file"
.LASF12:
	.string	"_Bool"
.LASF5:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_debug.c"
.LASF18:
	.string	"HAL_AssertFailed"
.LASF1:
	.string	"short int"
.LASF17:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
