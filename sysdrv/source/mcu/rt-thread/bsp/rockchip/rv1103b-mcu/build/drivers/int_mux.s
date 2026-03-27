	.file	"int_mux.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_hw_interrupt_active,"ax",@progbits
	.align	1
	.globl	rt_hw_interrupt_active
	.type	rt_hw_interrupt_active, @function
rt_hw_interrupt_active:
.LFB15:
	.file 1 "drivers/int_mux.c"
	.loc 1 19 1
	.cfi_startproc
.LVL0:
	.loc 1 20 5
	.loc 1 21 5
	.loc 1 23 5
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 23 20 is_stmt 0
	li	a4,32
	div	a5,a0,a4
.LVL1:
	.loc 1 25 41
	li	a3,136871936
	.loc 1 24 18
	rem	a0,a0,a4
.LVL2:
	.loc 1 25 41
	add	a5,a5,a3
.LVL3:
	slli	a5,a5,2
.LVL4:
	.loc 1 26 5 is_stmt 1
	.loc 1 26 52 is_stmt 0
	li	a4,1
	sll	a4,a4,a0
	.loc 1 26 60
	lw	a0,0(a5)
.LVL5:
	or	a0,a0,a4
	.loc 1 26 47
	sw	a0,0(a5)
.LVL6:
	.loc 1 27 1
	ret
	.cfi_endproc
.LFE15:
	.size	rt_hw_interrupt_active, .-rt_hw_interrupt_active
	.section	.text.rt_hw_interrupt_deactive,"ax",@progbits
	.align	1
	.globl	rt_hw_interrupt_deactive
	.type	rt_hw_interrupt_deactive, @function
rt_hw_interrupt_deactive:
.LFB16:
	.loc 1 30 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 31 5
	.loc 1 33 5
	.loc 1 34 5
	.loc 1 35 5
	.loc 1 33 20 is_stmt 0
	li	a4,32
	div	a5,a0,a4
.LVL8:
	.loc 1 35 47
	li	a3,136871936
	.loc 1 34 18
	rem	a0,a0,a4
.LVL9:
	.loc 1 35 47
	add	a5,a5,a3
.LVL10:
	slli	a5,a5,2
.LVL11:
	.loc 1 35 54
	li	a4,1
	sll	a0,a4,a0
.LVL12:
	.loc 1 35 47
	lw	a4,0(a5)
	.loc 1 35 50
	not	a0,a0
	.loc 1 35 47
	and	a0,a4,a0
	sw	a0,0(a5)
	.loc 1 36 1
	ret
	.cfi_endproc
.LFE16:
	.size	rt_hw_interrupt_deactive, .-rt_hw_interrupt_deactive
	.section	.text.rt_hw_interrupt_get_active,"ax",@progbits
	.align	1
	.globl	rt_hw_interrupt_get_active
	.type	rt_hw_interrupt_get_active, @function
rt_hw_interrupt_get_active:
.LFB17:
	.loc 1 39 1 is_stmt 1
	.cfi_startproc
	.loc 1 40 5
.LVL13:
	.loc 1 41 5
	.loc 1 42 5
	.loc 1 44 5
	.loc 1 44 17
	.loc 1 46 9
	.loc 1 46 13 is_stmt 0
	li	a5,547487744
	.loc 1 46 12
	lw	a4,128(a5)
	bne	a4,zero,.L8
	.loc 1 44 24 is_stmt 1
.LVL14:
	.loc 1 44 17
	.loc 1 46 9
	.loc 1 46 12 is_stmt 0
	lw	a4,132(a5)
	bne	a4,zero,.L9
	.loc 1 44 24 is_stmt 1
.LVL15:
	.loc 1 44 17
	.loc 1 46 9
	.loc 1 46 12 is_stmt 0
	lw	a4,136(a5)
	bne	a4,zero,.L10
	.loc 1 44 24 is_stmt 1
.LVL16:
	.loc 1 44 17
	.loc 1 46 9
	.loc 1 46 12 is_stmt 0
	lw	a5,140(a5)
	.loc 1 40 17
	li	a0,-1
	.loc 1 46 12
	beq	a5,zero,.L3
	.loc 1 44 25
	li	a5,3
.LVL17:
.L4:
	.loc 1 52 9 is_stmt 1
	.loc 1 52 55 is_stmt 0
	li	a4,136871936
	addi	a4,a4,32
	add	a4,a5,a4
	.loc 1 52 17
	slli	a4,a4,2
	lw	a2,0(a4)
.LVL18:
	.loc 1 53 9 is_stmt 1
	.loc 1 53 21
	.loc 1 53 16 is_stmt 0
	li	a0,0
	.loc 1 53 9
	li	a3,32
.LVL19:
.L7:
	.loc 1 55 13 is_stmt 1
	.loc 1 55 27 is_stmt 0
	srl	a4,a2,a0
	.loc 1 55 33
	andi	a4,a4,1
	.loc 1 55 16
	bne	a4,zero,.L6
	.loc 1 53 29 is_stmt 1 discriminator 2
	.loc 1 53 30 is_stmt 0 discriminator 2
	addi	a0,a0,1
.LVL20:
	.loc 1 53 21 is_stmt 1 discriminator 2
	.loc 1 53 9 is_stmt 0 discriminator 2
	bne	a0,a3,.L7
.L6:
	.loc 1 59 9 is_stmt 1
	.loc 1 59 19 is_stmt 0
	slli	a5,a5,5
	.loc 1 59 24
	add	a0,a5,a0
.LVL21:
.L3:
	.loc 1 63 1
	ret
.LVL22:
.L8:
	.loc 1 44 12
	li	a5,0
	j	.L4
.LVL23:
.L9:
	.loc 1 44 25
	li	a5,1
	j	.L4
.LVL24:
.L10:
	li	a5,2
	j	.L4
	.cfi_endproc
.LFE17:
	.size	rt_hw_interrupt_get_active, .-rt_hw_interrupt_get_active
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x16c
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
	.byte	0x3
	.4byte	.LASF18
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x5b
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
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
	.byte	0x5
	.4byte	.LASF19
	.byte	0x1
	.byte	0x26
	.byte	0xd
	.4byte	0x4f
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0xd5
	.byte	0x6
	.4byte	.LASF10
	.byte	0x1
	.byte	0x28
	.byte	0x11
	.4byte	0x4f
	.4byte	.LLST7
	.byte	0x7
	.string	"i"
	.byte	0x1
	.byte	0x29
	.byte	0x9
	.4byte	0x69
	.4byte	.LLST8
	.byte	0x7
	.string	"n"
	.byte	0x1
	.byte	0x29
	.byte	0xc
	.4byte	0x69
	.4byte	.LLST9
	.byte	0x6
	.4byte	.LASF11
	.byte	0x1
	.byte	0x2a
	.byte	0x12
	.4byte	0x70
	.4byte	.LLST10
	.byte	0
	.byte	0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x11c
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x1d
	.byte	0x23
	.4byte	0x69
	.4byte	.LLST4
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x1f
	.byte	0x12
	.4byte	0x70
	.4byte	.LLST5
	.byte	0x7
	.string	"set"
	.byte	0x1
	.byte	0x1f
	.byte	0x19
	.4byte	0x70
	.4byte	.LLST6
	.byte	0
	.byte	0xa
	.4byte	.LASF21
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.byte	0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x12
	.byte	0x21
	.4byte	0x69
	.4byte	.LLST0
	.byte	0x6
	.4byte	.LASF12
	.byte	0x1
	.byte	0x14
	.byte	0x12
	.4byte	0x70
	.4byte	.LLST1
	.byte	0x7
	.string	"set"
	.byte	0x1
	.byte	0x14
	.byte	0x19
	.4byte	0x70
	.4byte	.LLST2
	.byte	0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x15
	.byte	0x12
	.4byte	0x70
	.4byte	.LLST3
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
	.byte	0x7
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
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
.LLST7:
	.4byte	.LVL13
	.4byte	.LVL21
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LFE17
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LFE17
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL18
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL9
	.4byte	.LFE16
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x6
	.byte	0x7a
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x1b
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x7
	.byte	0x7f
	.byte	0x80,0x80,0xde,0xbe,0x7f
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LFE16
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.byte	0x20
	.byte	0x1b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0xa
	.byte	0x7a
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12
	.4byte	.LFE16
	.2byte	0xb
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.byte	0x20
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LFE15
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
	.2byte	0x6
	.byte	0x7a
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x1b
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x7
	.byte	0x7f
	.byte	0x80,0x80,0xde,0xbe,0x7f
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LFE15
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.byte	0x20
	.byte	0x1b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0xa
	.byte	0x7a
	.byte	0
	.byte	0x8
	.byte	0x20
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL5
	.4byte	.LFE15
	.2byte	0xb
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.byte	0x20
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x7f
	.byte	0
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
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF16:
	.string	"drivers/int_mux.c"
.LASF18:
	.string	"rt_uint32_t"
.LASF14:
	.string	"temp"
.LASF19:
	.string	"rt_hw_interrupt_get_active"
.LASF10:
	.string	"cause"
.LASF6:
	.string	"long unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF20:
	.string	"rt_hw_interrupt_deactive"
.LASF15:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF4:
	.string	"unsigned char"
.LASF9:
	.string	"char"
.LASF13:
	.string	"vector"
.LASF2:
	.string	"long int"
.LASF12:
	.string	"index"
.LASF3:
	.string	"long long int"
.LASF5:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF21:
	.string	"rt_hw_interrupt_active"
.LASF11:
	.string	"int_reg"
.LASF1:
	.string	"short int"
.LASF8:
	.string	"unsigned int"
.LASF17:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
