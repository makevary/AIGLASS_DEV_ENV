	.file	"stack.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_hw_stack_init,"ax",@progbits
	.align	1
	.globl	rt_hw_stack_init
	.type	rt_hw_stack_init, @function
rt_hw_stack_init:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/libcpu/risc-v/scr1/stack.c"
	.loc 1 80 1
	.cfi_startproc
.LVL0:
	.loc 1 81 5
	.loc 1 82 5
	.loc 1 83 5
	.loc 1 85 5
	.loc 1 86 5
	.loc 1 85 9 is_stmt 0
	addi	a2,a2,4
.LVL1:
	.loc 1 86 45
	andi	a2,a2,-8
.LVL2:
	.loc 1 87 5 is_stmt 1
	.loc 1 80 1 is_stmt 0
	mv	a4,a0
	.loc 1 93 40
	li	a6,-559038464
	.loc 1 87 9
	addi	a0,a2,-128
.LVL3:
	.loc 1 89 5 is_stmt 1
	.loc 1 91 5
	mv	a5,a0
	.loc 1 93 40 is_stmt 0
	addi	a6,a6,-273
.LVL4:
.L2:
	.loc 1 91 17 is_stmt 1 discriminator 1
	.loc 1 91 5 is_stmt 0 discriminator 1
	bne	a2,a5,.L3
	.loc 1 96 5 is_stmt 1
	.loc 1 101 26 is_stmt 0
	li	a5,8192
	.loc 1 96 21
	addi	a2,a2,-128
	.loc 1 101 26
	addi	a5,a5,-1920
	.loc 1 96 21
	sw	a3,4(a2)
	.loc 1 97 5 is_stmt 1
	.loc 1 97 21 is_stmt 0
	sw	a1,40(a2)
	.loc 1 98 5 is_stmt 1
	.loc 1 98 22 is_stmt 0
	sw	a4,0(a2)
	.loc 1 101 5 is_stmt 1
	.loc 1 101 26 is_stmt 0
	sw	a5,8(a2)
	.loc 1 103 5 is_stmt 1
	.loc 1 104 1 is_stmt 0
	ret
.L3:
	.loc 1 93 9 is_stmt 1 discriminator 3
	.loc 1 93 40 is_stmt 0 discriminator 3
	sw	a6,0(a5)
	.loc 1 91 70 is_stmt 1 discriminator 3
	addi	a5,a5,4
	j	.L2
	.cfi_endproc
.LFE15:
	.size	rt_hw_stack_init, .-rt_hw_stack_init
	.globl	rt_thread_switch_interrupt_flag
	.globl	rt_interrupt_to_thread
	.globl	rt_interrupt_from_thread
	.section	.sbss.rt_interrupt_from_thread,"aw",@nobits
	.align	2
	.type	rt_interrupt_from_thread, @object
	.size	rt_interrupt_from_thread, 4
rt_interrupt_from_thread:
	.zero	4
	.section	.sbss.rt_interrupt_to_thread,"aw",@nobits
	.align	2
	.type	rt_interrupt_to_thread, @object
	.size	rt_interrupt_to_thread, 4
rt_interrupt_to_thread:
	.zero	4
	.section	.sbss.rt_thread_switch_interrupt_flag,"aw",@nobits
	.align	2
	.type	rt_thread_switch_interrupt_flag, @object
	.size	rt_thread_switch_interrupt_flag, 4
rt_thread_switch_interrupt_flag:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2ed
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
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x67
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x67
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF12
	.byte	0x5
	.byte	0x4
	.byte	0x6
	.byte	0x4
	.4byte	0x41
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1c
	.byte	0xd
	.4byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	rt_interrupt_from_thread
	.byte	0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1d
	.byte	0xd
	.4byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	rt_interrupt_to_thread
	.byte	0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x1e
	.byte	0xd
	.4byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	rt_thread_switch_interrupt_flag
	.byte	0x8
	.4byte	.LASF22
	.byte	0x80
	.byte	0x1
	.byte	0x20
	.byte	0x8
	.4byte	0x267
	.byte	0x9
	.string	"epc"
	.byte	0x1
	.byte	0x22
	.byte	0x10
	.4byte	0x7c
	.byte	0
	.byte	0x9
	.string	"ra"
	.byte	0x1
	.byte	0x23
	.byte	0x10
	.4byte	0x7c
	.byte	0x4
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x24
	.byte	0x10
	.4byte	0x7c
	.byte	0x8
	.byte	0x9
	.string	"gp"
	.byte	0x1
	.byte	0x25
	.byte	0x10
	.4byte	0x7c
	.byte	0xc
	.byte	0x9
	.string	"tp"
	.byte	0x1
	.byte	0x26
	.byte	0x10
	.4byte	0x7c
	.byte	0x10
	.byte	0x9
	.string	"t0"
	.byte	0x1
	.byte	0x27
	.byte	0x10
	.4byte	0x7c
	.byte	0x14
	.byte	0x9
	.string	"t1"
	.byte	0x1
	.byte	0x28
	.byte	0x10
	.4byte	0x7c
	.byte	0x18
	.byte	0x9
	.string	"t2"
	.byte	0x1
	.byte	0x29
	.byte	0x10
	.4byte	0x7c
	.byte	0x1c
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x2a
	.byte	0x10
	.4byte	0x7c
	.byte	0x20
	.byte	0x9
	.string	"s1"
	.byte	0x1
	.byte	0x2b
	.byte	0x10
	.4byte	0x7c
	.byte	0x24
	.byte	0x9
	.string	"a0"
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.4byte	0x7c
	.byte	0x28
	.byte	0x9
	.string	"a1"
	.byte	0x1
	.byte	0x2d
	.byte	0x10
	.4byte	0x7c
	.byte	0x2c
	.byte	0x9
	.string	"a2"
	.byte	0x1
	.byte	0x2e
	.byte	0x10
	.4byte	0x7c
	.byte	0x30
	.byte	0x9
	.string	"a3"
	.byte	0x1
	.byte	0x2f
	.byte	0x10
	.4byte	0x7c
	.byte	0x34
	.byte	0x9
	.string	"a4"
	.byte	0x1
	.byte	0x30
	.byte	0x10
	.4byte	0x7c
	.byte	0x38
	.byte	0x9
	.string	"a5"
	.byte	0x1
	.byte	0x31
	.byte	0x10
	.4byte	0x7c
	.byte	0x3c
	.byte	0x9
	.string	"a6"
	.byte	0x1
	.byte	0x32
	.byte	0x10
	.4byte	0x7c
	.byte	0x40
	.byte	0x9
	.string	"a7"
	.byte	0x1
	.byte	0x33
	.byte	0x10
	.4byte	0x7c
	.byte	0x44
	.byte	0x9
	.string	"s2"
	.byte	0x1
	.byte	0x34
	.byte	0x10
	.4byte	0x7c
	.byte	0x48
	.byte	0x9
	.string	"s3"
	.byte	0x1
	.byte	0x35
	.byte	0x10
	.4byte	0x7c
	.byte	0x4c
	.byte	0x9
	.string	"s4"
	.byte	0x1
	.byte	0x36
	.byte	0x10
	.4byte	0x7c
	.byte	0x50
	.byte	0x9
	.string	"s5"
	.byte	0x1
	.byte	0x37
	.byte	0x10
	.4byte	0x7c
	.byte	0x54
	.byte	0x9
	.string	"s6"
	.byte	0x1
	.byte	0x38
	.byte	0x10
	.4byte	0x7c
	.byte	0x58
	.byte	0x9
	.string	"s7"
	.byte	0x1
	.byte	0x39
	.byte	0x10
	.4byte	0x7c
	.byte	0x5c
	.byte	0x9
	.string	"s8"
	.byte	0x1
	.byte	0x3a
	.byte	0x10
	.4byte	0x7c
	.byte	0x60
	.byte	0x9
	.string	"s9"
	.byte	0x1
	.byte	0x3b
	.byte	0x10
	.4byte	0x7c
	.byte	0x64
	.byte	0x9
	.string	"s10"
	.byte	0x1
	.byte	0x3c
	.byte	0x10
	.4byte	0x7c
	.byte	0x68
	.byte	0x9
	.string	"s11"
	.byte	0x1
	.byte	0x3d
	.byte	0x10
	.4byte	0x7c
	.byte	0x6c
	.byte	0x9
	.string	"t3"
	.byte	0x1
	.byte	0x3e
	.byte	0x10
	.4byte	0x7c
	.byte	0x70
	.byte	0x9
	.string	"t4"
	.byte	0x1
	.byte	0x3f
	.byte	0x10
	.4byte	0x7c
	.byte	0x74
	.byte	0x9
	.string	"t5"
	.byte	0x1
	.byte	0x40
	.byte	0x10
	.4byte	0x7c
	.byte	0x78
	.byte	0x9
	.string	"t6"
	.byte	0x1
	.byte	0x41
	.byte	0x10
	.4byte	0x7c
	.byte	0x7c
	.byte	0
	.byte	0xb
	.4byte	.LASF26
	.byte	0x1
	.byte	0x4e
	.byte	0xd
	.4byte	0x98
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ea
	.byte	0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x4e
	.byte	0x24
	.4byte	0x96
	.4byte	.LLST0
	.byte	0xd
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4e
	.byte	0x32
	.4byte	0x96
	.byte	0x1
	.byte	0x5b
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4f
	.byte	0x2a
	.4byte	0x98
	.4byte	.LLST1
	.byte	0xd
	.4byte	.LASF21
	.byte	0x1
	.byte	0x4f
	.byte	0x3c
	.4byte	0x96
	.byte	0x1
	.byte	0x5d
	.byte	0xe
	.4byte	.LASF22
	.byte	0x1
	.byte	0x51
	.byte	0x19
	.4byte	0x2ea
	.byte	0x1
	.byte	0x5a
	.byte	0xf
	.string	"stk"
	.byte	0x1
	.byte	0x52
	.byte	0x11
	.4byte	0x98
	.4byte	.LLST2
	.byte	0xf
	.string	"i"
	.byte	0x1
	.byte	0x53
	.byte	0x9
	.4byte	0x75
	.4byte	.LLST3
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xd4
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
	.byte	0xb
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
	.byte	0xe
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
	.byte	0xf
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LFE15
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x3
	.byte	0x7c
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LFE15
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x3
	.byte	0x7c
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL3
	.4byte	.LFE15
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
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
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF18:
	.string	"tentry"
.LASF26:
	.string	"rt_hw_stack_init"
.LASF11:
	.string	"unsigned int"
.LASF7:
	.string	"rt_uint32_t"
.LASF9:
	.string	"long long unsigned int"
.LASF4:
	.string	"unsigned char"
.LASF23:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF5:
	.string	"short unsigned int"
.LASF24:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/libcpu/risc-v/scr1/stack.c"
.LASF21:
	.string	"texit"
.LASF8:
	.string	"long unsigned int"
.LASF15:
	.string	"rt_thread_switch_interrupt_flag"
.LASF14:
	.string	"rt_interrupt_to_thread"
.LASF17:
	.string	"s0_fp"
.LASF20:
	.string	"stack_addr"
.LASF13:
	.string	"rt_interrupt_from_thread"
.LASF3:
	.string	"long long int"
.LASF12:
	.string	"char"
.LASF1:
	.string	"short int"
.LASF22:
	.string	"stack_frame"
.LASF16:
	.string	"mstatus"
.LASF2:
	.string	"long int"
.LASF19:
	.string	"parameter"
.LASF0:
	.string	"signed char"
.LASF25:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF10:
	.string	"rt_ubase_t"
.LASF6:
	.string	"rt_uint8_t"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
