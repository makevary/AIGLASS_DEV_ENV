	.file	"isp3_external.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rk_clk_enable1,"ax",@progbits
	.align	1
	.globl	rk_clk_enable1
	.type	rk_clk_enable1, @function
rk_clk_enable1:
.LFB51:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/isp3_external.c"
	.loc 1 23 1
	.cfi_startproc
.LVL0:
	.loc 1 26 5
	.loc 1 26 12 is_stmt 0
	tail	clk_enable
.LVL1:
	.cfi_endproc
.LFE51:
	.size	rk_clk_enable1, .-rk_clk_enable1
	.section	.text.rk_clk_disable1,"ax",@progbits
	.align	1
	.globl	rk_clk_disable1
	.type	rk_clk_disable1, @function
rk_clk_disable1:
.LFB52:
	.loc 1 40 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 43 5
	.loc 1 43 12 is_stmt 0
	tail	clk_disable
.LVL3:
	.cfi_endproc
.LFE52:
	.size	rk_clk_disable1, .-rk_clk_disable1
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/../camera/adapter/adapter.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1ba
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
	.byte	0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x64
	.byte	0x5
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2
	.2byte	0x136
	.byte	0x8
	.4byte	0x99
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x138
	.byte	0x1b
	.4byte	0x99
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x8
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x13a
	.byte	0x1e
	.4byte	0x7c
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x4
	.4byte	.LASF14
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0xba
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF15
	.byte	0x9
	.4byte	.LASF17
	.byte	0x10
	.byte	0x5
	.byte	0x20
	.byte	0x8
	.4byte	0x11b
	.byte	0xa
	.4byte	.LASF19
	.byte	0x5
	.byte	0x22
	.byte	0xe
	.4byte	0xc6
	.byte	0
	.byte	0xa
	.4byte	.LASF20
	.byte	0x5
	.byte	0x23
	.byte	0x9
	.4byte	0x5d
	.byte	0x4
	.byte	0xa
	.4byte	.LASF21
	.byte	0x5
	.byte	0x24
	.byte	0x9
	.4byte	0x5d
	.byte	0x8
	.byte	0xa
	.4byte	.LASF22
	.byte	0x5
	.byte	0x25
	.byte	0x10
	.4byte	0x9f
	.byte	0xc
	.byte	0
	.byte	0x4
	.4byte	.LASF23
	.byte	0x6
	.byte	0x87
	.byte	0x19
	.4byte	0xd9
	.byte	0x7
	.byte	0x4
	.4byte	0x11b
	.byte	0xb
	.4byte	.LASF24
	.byte	0x1
	.byte	0x27
	.byte	0xa
	.4byte	0x70
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0x169
	.byte	0xc
	.4byte	.LASF26
	.byte	0x1
	.byte	0x27
	.byte	0x27
	.4byte	0x127
	.4byte	.LLST1
	.byte	0xd
	.4byte	.LVL3
	.4byte	0x1a5
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	.LASF25
	.byte	0x1
	.byte	0x16
	.byte	0xa
	.4byte	0x70
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a5
	.byte	0xc
	.4byte	.LASF26
	.byte	0x1
	.byte	0x16
	.byte	0x26
	.4byte	0x127
	.4byte	.LLST0
	.byte	0xd
	.4byte	.LVL1
	.4byte	0x1b1
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0xf
	.4byte	.LASF27
	.4byte	.LASF27
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.byte	0xf
	.4byte	.LASF28
	.4byte	.LASF28
	.byte	0x5
	.byte	0x5e
	.byte	0xa
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
	.byte	0xa
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xf
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
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3-1
	.4byte	.LFE52
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL1-1
	.4byte	.LFE51
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
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
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"ref_count"
.LASF18:
	.string	"next"
.LASF10:
	.string	"rt_slist_t"
.LASF11:
	.string	"unsigned int"
.LASF16:
	.string	"rt_slist_node"
.LASF4:
	.string	"unsigned char"
.LASF29:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF6:
	.string	"long unsigned int"
.LASF5:
	.string	"short unsigned int"
.LASF23:
	.string	"rk_clk_gate"
.LASF13:
	.string	"__uint32_t"
.LASF8:
	.string	"rt_base_t"
.LASF20:
	.string	"enable_count"
.LASF24:
	.string	"rk_clk_disable1"
.LASF12:
	.string	"char"
.LASF30:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/isp3/isp3_external.c"
.LASF9:
	.string	"rt_err_t"
.LASF27:
	.string	"clk_disable"
.LASF3:
	.string	"long long int"
.LASF17:
	.string	"clk_gate"
.LASF19:
	.string	"gate_id"
.LASF1:
	.string	"short int"
.LASF28:
	.string	"clk_enable"
.LASF22:
	.string	"node"
.LASF14:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF31:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF26:
	.string	"gate"
.LASF15:
	.string	"_Bool"
.LASF7:
	.string	"long long unsigned int"
.LASF25:
	.string	"rk_clk_enable1"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
