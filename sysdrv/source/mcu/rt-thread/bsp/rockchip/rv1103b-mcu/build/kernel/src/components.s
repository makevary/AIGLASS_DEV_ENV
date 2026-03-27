	.file	"components.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rti_start,"ax",@progbits
	.align	1
	.type	rti_start, @function
rti_start:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/components.c"
	.loc 1 56 1
	.cfi_startproc
	.loc 1 57 5
	.loc 1 58 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE15:
	.size	rti_start, .-rti_start
	.section	.text.rti_end,"ax",@progbits
	.align	1
	.type	rti_end, @function
rti_end:
.LFB26:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE26:
	.size	rti_end, .-rti_end
	.section	.text.rti_board_start,"ax",@progbits
	.align	1
	.type	rti_board_start, @function
rti_board_start:
.LFB22:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE22:
	.size	rti_board_start, .-rti_board_start
	.section	.text.rti_board_end,"ax",@progbits
	.align	1
	.type	rti_board_end, @function
rti_board_end:
.LFB24:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE24:
	.size	rti_board_end, .-rti_board_end
	.section	.text.rt_components_board_init,"ax",@progbits
	.align	1
	.globl	rt_components_board_init
	.type	rt_components_board_init, @function
rt_components_board_init:
.LFB19:
	.loc 1 83 1 is_stmt 1
	.cfi_startproc
	.loc 1 94 5
	.loc 1 96 5
	.loc 1 83 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 96 17
	lla	s0,.LANCHOR0
	.loc 1 96 5
	lla	s1,.LANCHOR1
.L6:
.LVL0:
	.loc 1 96 47 is_stmt 1 discriminator 1
	.loc 1 96 5 is_stmt 0 discriminator 1
	bltu	s0,s1,.L7
	.loc 1 101 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL1:
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL2:
.L7:
	.cfi_restore_state
	.loc 1 98 9 is_stmt 1 discriminator 3
	.loc 1 98 10 is_stmt 0 discriminator 3
	lw	a5,0(s0)
	.loc 1 96 88 discriminator 3
	addi	s0,s0,4
.LVL3:
	.loc 1 98 10 discriminator 3
	jalr	a5
.LVL4:
	.loc 1 96 82 is_stmt 1 discriminator 3
	j	.L6
	.cfi_endproc
.LFE19:
	.size	rt_components_board_init, .-rt_components_board_init
	.section	.text.rt_components_init,"ax",@progbits
	.align	1
	.globl	rt_components_init
	.type	rt_components_init, @function
rt_components_init:
.LFB20:
	.loc 1 107 1
	.cfi_startproc
	.loc 1 120 5
	.loc 1 122 5
	.loc 1 107 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 122 17
	lla	s0,.LANCHOR1
	.loc 1 122 5
	lla	s1,.LANCHOR2
.L10:
.LVL5:
	.loc 1 122 45 is_stmt 1 discriminator 1
	.loc 1 122 5 is_stmt 0 discriminator 1
	bltu	s0,s1,.L11
	.loc 1 127 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL6:
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL7:
.L11:
	.cfi_restore_state
	.loc 1 124 9 is_stmt 1 discriminator 3
	.loc 1 124 10 is_stmt 0 discriminator 3
	lw	a5,0(s0)
	.loc 1 122 81 discriminator 3
	addi	s0,s0,4
.LVL8:
	.loc 1 124 10 discriminator 3
	jalr	a5
.LVL9:
	.loc 1 122 74 is_stmt 1 discriminator 3
	j	.L10
	.cfi_endproc
.LFE20:
	.size	rt_components_init, .-rt_components_init
	.globl	__rt_init_rti_end
	.globl	__rt_init_rti_board_end
	.globl	__rt_init_rti_board_start
	.globl	__rt_init_rti_start
	.section	.rti_fn.0,"a"
	.align	2
	.type	__rt_init_rti_start, @object
	.size	__rt_init_rti_start, 4
__rt_init_rti_start:
	.word	rti_start
	.section	.rti_fn.0.end,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__rt_init_rti_board_start, @object
	.size	__rt_init_rti_board_start, 4
__rt_init_rti_board_start:
	.word	rti_board_start
	.section	.rti_fn.1.end,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__rt_init_rti_board_end, @object
	.size	__rt_init_rti_board_end, 4
__rt_init_rti_board_end:
	.word	rti_board_end
	.section	.rti_fn.6.end,"a"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__rt_init_rti_end, @object
	.size	__rt_init_rti_end, 4
__rt_init_rti_end:
	.word	rti_end
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x167
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF20
	.byte	0xc
	.4byte	.LASF21
	.4byte	.LASF22
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
	.4byte	.LASF23
	.byte	0x2
	.byte	0xb3
	.byte	0xf
	.4byte	0x75
	.byte	0x5
	.4byte	0x64
	.byte	0x6
	.byte	0x4
	.4byte	0x7b
	.byte	0x7
	.4byte	0x5d
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x3b
	.byte	0x27
	.4byte	0x70
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rti_start
	.byte	0x8
	.4byte	.LASF11
	.byte	0x1
	.byte	0x41
	.byte	0x27
	.4byte	0x70
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rti_board_start
	.byte	0x8
	.4byte	.LASF12
	.byte	0x1
	.byte	0x47
	.byte	0x27
	.4byte	0x70
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rti_board_end
	.byte	0x8
	.4byte	.LASF13
	.byte	0x1
	.byte	0x4d
	.byte	0x27
	.4byte	0x70
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rti_end
	.byte	0x9
	.4byte	.LASF14
	.byte	0x1
	.byte	0x6a
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0xfd
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x78
	.byte	0x16
	.4byte	0xfd
	.4byte	.LLST1
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x70
	.byte	0x9
	.4byte	.LASF15
	.byte	0x1
	.byte	0x52
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x12a
	.byte	0xa
	.4byte	.LASF16
	.byte	0x1
	.byte	0x5e
	.byte	0x16
	.4byte	0xfd
	.4byte	.LLST0
	.byte	0
	.byte	0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0x49
	.byte	0xc
	.4byte	0x5d
	.byte	0xb
	.4byte	.LASF18
	.byte	0x1
	.byte	0x43
	.byte	0xc
	.4byte	0x5d
	.byte	0xb
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3d
	.byte	0xc
	.4byte	0x5d
	.byte	0xc
	.4byte	.LASF24
	.byte	0x1
	.byte	0x37
	.byte	0xc
	.4byte	0x5d
	.byte	0x1
	.byte	0xd
	.4byte	0x14e
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
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
	.byte	0x9
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
	.byte	0xa
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
	.byte	0xb
	.byte	0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x2e
	.byte	0
	.byte	0x31
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x3
	.byte	0x78
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x3
	.byte	0x78
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LFE19
	.2byte	0x1
	.byte	0x58
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
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.string	"long long int"
.LASF8:
	.string	"unsigned int"
.LASF18:
	.string	"rti_board_end"
.LASF19:
	.string	"rti_board_start"
.LASF10:
	.string	"__rt_init_rti_start"
.LASF17:
	.string	"rti_end"
.LASF21:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/components.c"
.LASF7:
	.string	"long long unsigned int"
.LASF13:
	.string	"__rt_init_rti_end"
.LASF15:
	.string	"rt_components_board_init"
.LASF20:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF4:
	.string	"unsigned char"
.LASF14:
	.string	"rt_components_init"
.LASF9:
	.string	"char"
.LASF2:
	.string	"long int"
.LASF6:
	.string	"long unsigned int"
.LASF11:
	.string	"__rt_init_rti_board_start"
.LASF5:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF16:
	.string	"fn_ptr"
.LASF24:
	.string	"rti_start"
.LASF12:
	.string	"__rt_init_rti_board_end"
.LASF1:
	.string	"short int"
.LASF23:
	.string	"init_fn_t"
.LASF22:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
