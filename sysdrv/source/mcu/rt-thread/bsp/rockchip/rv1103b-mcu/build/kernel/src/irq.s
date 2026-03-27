	.file	"irq.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_interrupt_enter_sethook,"ax",@progbits
	.align	1
	.globl	rt_interrupt_enter_sethook
	.type	rt_interrupt_enter_sethook, @function
rt_interrupt_enter_sethook:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/irq.c"
	.loc 1 28 1
	.cfi_startproc
.LVL0:
	.loc 1 29 5
	.loc 1 29 29 is_stmt 0
	sw	a0,.LANCHOR0,a5
	.loc 1 30 1
	ret
	.cfi_endproc
.LFE15:
	.size	rt_interrupt_enter_sethook, .-rt_interrupt_enter_sethook
	.section	.text.rt_interrupt_leave_sethook,"ax",@progbits
	.align	1
	.globl	rt_interrupt_leave_sethook
	.type	rt_interrupt_leave_sethook, @function
rt_interrupt_leave_sethook:
.LFB16:
	.loc 1 38 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 39 5
	.loc 1 39 29 is_stmt 0
	sw	a0,.LANCHOR1,a5
	.loc 1 40 1
	ret
	.cfi_endproc
.LFE16:
	.size	rt_interrupt_leave_sethook, .-rt_interrupt_leave_sethook
	.section	.text.rt_interrupt_enter,"ax",@progbits
	.align	1
	.globl	rt_interrupt_enter
	.type	rt_interrupt_enter, @function
rt_interrupt_enter:
.LFB17:
	.loc 1 61 1 is_stmt 1
	.cfi_startproc
	.loc 1 62 5
	.loc 1 65 52
	.loc 1 67 5
	.loc 1 61 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 67 13
	call	rt_hw_interrupt_disable
.LVL2:
	.loc 1 68 5 is_stmt 1
	.loc 1 68 23 is_stmt 0
	lbu	a5,.LANCHOR2
	addi	a5,a5,1
	sb	a5,.LANCHOR2,a4
	.loc 1 69 5 is_stmt 1
	.loc 1 69 10
	.loc 1 69 40 is_stmt 0
	lw	a5,.LANCHOR0
	.loc 1 69 13
	beq	a5,zero,.L4
	sw	a0,12(sp)
	.loc 1 69 48 is_stmt 1 discriminator 1
	jalr	a5
.LVL3:
	lw	a0,12(sp)
.LVL4:
.L4:
	.loc 1 69 84 discriminator 3
	.loc 1 70 5 discriminator 3
	.loc 1 71 1 is_stmt 0 discriminator 3
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	.loc 1 70 5 discriminator 3
	tail	rt_hw_interrupt_enable
.LVL5:
	.cfi_endproc
.LFE17:
	.size	rt_interrupt_enter, .-rt_interrupt_enter
	.section	.text.rt_interrupt_leave,"ax",@progbits
	.align	1
	.globl	rt_interrupt_leave
	.type	rt_interrupt_leave, @function
rt_interrupt_leave:
.LFB18:
	.loc 1 82 1 is_stmt 1
	.cfi_startproc
	.loc 1 83 5
	.loc 1 86 52
	.loc 1 88 5
	.loc 1 82 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 88 13
	call	rt_hw_interrupt_disable
.LVL6:
	.loc 1 89 5 is_stmt 1
	.loc 1 89 23 is_stmt 0
	lbu	a5,.LANCHOR2
	addi	a5,a5,-1
	sb	a5,.LANCHOR2,a4
	.loc 1 90 5 is_stmt 1
	.loc 1 90 10
	.loc 1 90 40 is_stmt 0
	lw	a5,.LANCHOR1
	.loc 1 90 13
	beq	a5,zero,.L10
	sw	a0,12(sp)
	.loc 1 90 48 is_stmt 1 discriminator 1
	jalr	a5
.LVL7:
	lw	a0,12(sp)
.LVL8:
.L10:
	.loc 1 90 84 discriminator 3
	.loc 1 91 5 discriminator 3
	.loc 1 92 1 is_stmt 0 discriminator 3
	lw	ra,28(sp)
	.cfi_restore 1
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	.loc 1 91 5 discriminator 3
	tail	rt_hw_interrupt_enable
.LVL9:
	.cfi_endproc
.LFE18:
	.size	rt_interrupt_leave, .-rt_interrupt_leave
	.section	.text.rt_interrupt_get_nest,"ax",@progbits
	.align	1
	.globl	rt_interrupt_get_nest
	.type	rt_interrupt_get_nest, @function
rt_interrupt_get_nest:
.LFB19:
	.loc 1 104 1 is_stmt 1
	.cfi_startproc
	.loc 1 105 5
	.loc 1 106 1 is_stmt 0
	lbu	a0,.LANCHOR2
	ret
	.cfi_endproc
.LFE19:
	.size	rt_interrupt_get_nest, .-rt_interrupt_get_nest
	.globl	rt_interrupt_nest
	.section	.sbss.rt_interrupt_enter_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rt_interrupt_enter_hook, @object
	.size	rt_interrupt_enter_hook, 4
rt_interrupt_enter_hook:
	.zero	4
	.section	.sbss.rt_interrupt_leave_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rt_interrupt_leave_hook, @object
	.size	rt_interrupt_leave_hook, 4
rt_interrupt_leave_hook:
	.zero	4
	.section	.sbss.rt_interrupt_nest,"aw",@nobits
	.set	.LANCHOR2,. + 0
	.type	rt_interrupt_nest, @object
	.size	rt_interrupt_nest, 1
rt_interrupt_nest:
	.zero	1
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1b3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF23
	.4byte	.LASF24
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
	.4byte	.LASF8
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x52
	.byte	0x4
	.4byte	0x41
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
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF9
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x6
	.byte	0x4
	.4byte	0x95
	.byte	0x7
	.byte	0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x12
	.byte	0xf
	.4byte	0x8f
	.byte	0x5
	.byte	0x3
	.4byte	rt_interrupt_enter_hook
	.byte	0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x13
	.byte	0xf
	.4byte	0x8f
	.byte	0x5
	.byte	0x3
	.4byte	rt_interrupt_leave_hook
	.byte	0x9
	.4byte	.LASF25
	.byte	0x1
	.byte	0x33
	.byte	0x15
	.4byte	0x4d
	.byte	0x5
	.byte	0x3
	.4byte	rt_interrupt_nest
	.byte	0xa
	.4byte	.LASF26
	.byte	0x1
	.byte	0x67
	.byte	0xc
	.4byte	0x41
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.byte	0xb
	.4byte	.LASF15
	.byte	0x1
	.byte	0x51
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x11b
	.byte	0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x53
	.byte	0xf
	.4byte	0x75
	.4byte	.LLST1
	.byte	0xd
	.4byte	.LVL6
	.4byte	0x19e
	.byte	0xe
	.4byte	.LVL9
	.4byte	0x1aa
	.byte	0
	.byte	0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0x3c
	.byte	0x6
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x154
	.byte	0xc
	.4byte	.LASF14
	.byte	0x1
	.byte	0x3e
	.byte	0xf
	.4byte	0x75
	.4byte	.LLST0
	.byte	0xd
	.4byte	.LVL2
	.4byte	0x19e
	.byte	0xe
	.4byte	.LVL5
	.4byte	0x1aa
	.byte	0
	.byte	0xf
	.4byte	.LASF17
	.byte	0x1
	.byte	0x25
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x179
	.byte	0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x25
	.byte	0x28
	.4byte	0x8f
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0xf
	.4byte	.LASF18
	.byte	0x1
	.byte	0x1b
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x19e
	.byte	0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0x1b
	.byte	0x28
	.4byte	0x8f
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x11
	.4byte	.LASF20
	.4byte	.LASF20
	.byte	0x3
	.byte	0x5f
	.byte	0xb
	.byte	0x11
	.4byte	.LASF21
	.4byte	.LASF21
	.byte	0x3
	.byte	0x60
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
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x9
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
	.byte	0xa
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
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL7-1
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x91
	.byte	0x6c
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3-1
	.4byte	.LVL4
	.2byte	0x2
	.byte	0x91
	.byte	0x6c
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"long long int"
.LASF12:
	.string	"rt_interrupt_enter_hook"
.LASF8:
	.string	"rt_uint8_t"
.LASF18:
	.string	"rt_interrupt_enter_sethook"
.LASF21:
	.string	"rt_hw_interrupt_enable"
.LASF15:
	.string	"rt_interrupt_leave"
.LASF14:
	.string	"level"
.LASF6:
	.string	"long unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF25:
	.string	"rt_interrupt_nest"
.LASF22:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF4:
	.string	"unsigned char"
.LASF13:
	.string	"rt_interrupt_leave_hook"
.LASF11:
	.string	"char"
.LASF23:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/irq.c"
.LASF2:
	.string	"long int"
.LASF19:
	.string	"hook"
.LASF17:
	.string	"rt_interrupt_leave_sethook"
.LASF26:
	.string	"rt_interrupt_get_nest"
.LASF5:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"rt_interrupt_enter"
.LASF20:
	.string	"rt_hw_interrupt_disable"
.LASF1:
	.string	"short int"
.LASF10:
	.string	"unsigned int"
.LASF9:
	.string	"rt_base_t"
.LASF24:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
