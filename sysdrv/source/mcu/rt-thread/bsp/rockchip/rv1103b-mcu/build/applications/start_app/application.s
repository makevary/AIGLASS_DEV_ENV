	.file	"application.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_init_thread_entry,"ax",@progbits
	.align	1
	.type	rt_init_thread_entry, @function
rt_init_thread_entry:
.LFB51:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/applications/start_app/application.c"
	.loc 1 41 1
	.cfi_startproc
.LVL0:
	.loc 1 48 5
	tail	rt_components_init
.LVL1:
	.cfi_endproc
.LFE51:
	.size	rt_init_thread_entry, .-rt_init_thread_entry
	.section	.rodata.rt_application_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"2025-08-02 08:23:01.882866 71b560ce(rtt) 8fae34de(hal)"
	.align	2
.LC1:
	.string	"\nversion info: %s\n"
	.align	2
.LC2:
	.string	"init"
	.section	.text.rt_application_init,"ax",@progbits
	.align	1
	.globl	rt_application_init
	.type	rt_application_init, @function
rt_application_init:
.LFB53:
	.loc 1 112 1
	.cfi_startproc
	.loc 1 113 5
	.loc 1 115 5
.LBB4:
.LBB5:
	.loc 1 108 5
.LBE5:
.LBE4:
	.loc 1 112 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
.LBB8:
.LBB6:
	.loc 1 108 5
	lla	a1,.LC0
	lla	a0,.LC1
.LBE6:
.LBE8:
	.loc 1 112 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
.LBB9:
.LBB7:
	.loc 1 108 5
	call	rt_kprintf
.LVL2:
.LBE7:
.LBE9:
	.loc 1 118 5 is_stmt 1
	.loc 1 118 19 is_stmt 0
	li	a3,4096
	li	a5,20
	li	a4,8
	addi	a3,a3,-2048
	li	a2,0
	lla	a1,rt_init_thread_entry
	lla	a0,.LC2
	call	rt_thread_create
.LVL3:
	.loc 1 126 5 is_stmt 1
	.loc 1 126 8 is_stmt 0
	beq	a0,zero,.L3
	.loc 1 127 9 is_stmt 1
	call	rt_thread_startup
.LVL4:
.L3:
	.loc 1 129 5
	.loc 1 130 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE53:
	.size	rt_application_init, .-rt_application_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x445
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF54
	.byte	0xc
	.4byte	.LASF55
	.4byte	.LASF56
	.4byte	.Ldebug_ranges0+0x20
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
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
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
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x5
	.4byte	0x6d
	.4byte	0x84
	.byte	0x6
	.4byte	0x64
	.byte	0x7
	.byte	0
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x2c
	.byte	0x7
	.4byte	.LASF11
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x48
	.byte	0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x41
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x48
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x9c
	.byte	0x7
	.4byte	.LASF15
	.byte	0x2
	.byte	0x49
	.byte	0x15
	.4byte	0x90
	.byte	0x8
	.4byte	.LASF19
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0xf7
	.byte	0x9
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xf7
	.byte	0
	.byte	0x9
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xf7
	.byte	0x4
	.byte	0
	.byte	0xa
	.byte	0x4
	.4byte	0xcc
	.byte	0xb
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xcc
	.byte	0x8
	.4byte	.LASF20
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x151
	.byte	0x9
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x74
	.byte	0
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x84
	.byte	0x8
	.byte	0x9
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x84
	.byte	0x9
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0xfd
	.byte	0xc
	.byte	0
	.byte	0x8
	.4byte	.LASF25
	.byte	0x2c
	.byte	0x2
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1b4
	.byte	0x9
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x10a
	.byte	0
	.byte	0xc
	.string	"row"
	.byte	0x2
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1b4
	.byte	0x14
	.byte	0x9
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x1cf
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x6b
	.byte	0x20
	.byte	0x9
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xc0
	.byte	0x24
	.byte	0x9
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xc0
	.byte	0x28
	.byte	0
	.byte	0x5
	.4byte	0xfd
	.4byte	0x1c4
	.byte	0x6
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x1cf
	.byte	0xe
	.4byte	0x6b
	.byte	0
	.byte	0xa
	.byte	0x4
	.4byte	0x1c4
	.byte	0x8
	.4byte	.LASF31
	.byte	0x80
	.byte	0x2
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x317
	.byte	0x9
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x74
	.byte	0
	.byte	0x9
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x84
	.byte	0x8
	.byte	0x9
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x200
	.byte	0x10
	.4byte	0x84
	.byte	0x9
	.byte	0x9
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x206
	.byte	0xf
	.4byte	0xfd
	.byte	0xc
	.byte	0x9
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x207
	.byte	0xf
	.4byte	0xfd
	.byte	0x14
	.byte	0xc
	.string	"sp"
	.byte	0x2
	.2byte	0x20a
	.byte	0xb
	.4byte	0x6b
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x20b
	.byte	0xb
	.4byte	0x6b
	.byte	0x20
	.byte	0x9
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x20c
	.byte	0xb
	.4byte	0x6b
	.byte	0x24
	.byte	0x9
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x20d
	.byte	0xb
	.4byte	0x6b
	.byte	0x28
	.byte	0x9
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x20e
	.byte	0x11
	.4byte	0x90
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF37
	.byte	0x2
	.2byte	0x211
	.byte	0xe
	.4byte	0xb4
	.byte	0x30
	.byte	0x9
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x213
	.byte	0x10
	.4byte	0x84
	.byte	0x34
	.byte	0x9
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x216
	.byte	0x10
	.4byte	0x84
	.byte	0x35
	.byte	0x9
	.4byte	.LASF40
	.byte	0x2
	.2byte	0x217
	.byte	0x10
	.4byte	0x84
	.byte	0x36
	.byte	0x9
	.4byte	.LASF41
	.byte	0x2
	.2byte	0x21c
	.byte	0x11
	.4byte	0x90
	.byte	0x38
	.byte	0x9
	.4byte	.LASF42
	.byte	0x2
	.2byte	0x220
	.byte	0x11
	.4byte	0x90
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF43
	.byte	0x2
	.2byte	0x221
	.byte	0x10
	.4byte	0x84
	.byte	0x40
	.byte	0x9
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x22d
	.byte	0x10
	.4byte	0xa8
	.byte	0x44
	.byte	0x9
	.4byte	.LASF44
	.byte	0x2
	.2byte	0x22e
	.byte	0x10
	.4byte	0xa8
	.byte	0x48
	.byte	0x9
	.4byte	.LASF45
	.byte	0x2
	.2byte	0x236
	.byte	0x15
	.4byte	0x151
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF46
	.byte	0x2
	.2byte	0x238
	.byte	0xc
	.4byte	0x328
	.byte	0x78
	.byte	0x9
	.4byte	.LASF47
	.byte	0x2
	.2byte	0x23f
	.byte	0x11
	.4byte	0x90
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	0x322
	.byte	0xe
	.4byte	0x322
	.byte	0
	.byte	0xa
	.byte	0x4
	.4byte	0x1d5
	.byte	0xa
	.byte	0x4
	.4byte	0x317
	.byte	0xb
	.4byte	.LASF48
	.byte	0x2
	.2byte	0x241
	.byte	0x1b
	.4byte	0x322
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF49
	.byte	0xf
	.4byte	.LASF57
	.byte	0x1
	.byte	0x6f
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.byte	0x1
	.byte	0x9c
	.4byte	0x3dd
	.byte	0x10
	.4byte	.LASF58
	.byte	0x1
	.byte	0x71
	.byte	0x11
	.4byte	0x32e
	.4byte	.LLST1
	.byte	0x11
	.4byte	0x3dd
	.4byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x73
	.byte	0x5
	.4byte	0x39d
	.byte	0x12
	.4byte	.LVL2
	.4byte	0x416
	.byte	0x13
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0x13
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LVL3
	.4byte	0x423
	.4byte	0x3d3
	.byte	0x13
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0x13
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	rt_init_thread_entry
	.byte	0x13
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0x13
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xa
	.2byte	0x800
	.byte	0x13
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.byte	0x38
	.byte	0x13
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.byte	0x44
	.byte	0
	.byte	0x15
	.4byte	.LVL4
	.4byte	0x42f
	.byte	0
	.byte	0x16
	.4byte	.LASF59
	.byte	0x1
	.byte	0x6a
	.byte	0xd
	.byte	0x1
	.byte	0x17
	.4byte	.LASF60
	.byte	0x1
	.byte	0x28
	.byte	0xd
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x416
	.byte	0x18
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.byte	0x28
	.4byte	0x6b
	.4byte	.LLST0
	.byte	0x19
	.4byte	.LVL1
	.4byte	0x43b
	.byte	0
	.byte	0x1a
	.4byte	.LASF50
	.4byte	.LASF50
	.byte	0x3
	.2byte	0x1d7
	.byte	0x6
	.byte	0x1b
	.4byte	.LASF51
	.4byte	.LASF51
	.byte	0x3
	.byte	0x7f
	.byte	0xd
	.byte	0x1b
	.4byte	.LASF52
	.4byte	.LASF52
	.byte	0x3
	.byte	0x88
	.byte	0xa
	.byte	0x1a
	.4byte	.LASF53
	.4byte	.LASF53
	.byte	0x3
	.2byte	0x1c6
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x7
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x5
	.byte	0
	.byte	0x49
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x20
	.byte	0xb
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.4byte	.LVL3
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x5a
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
	.4byte	.LFB53
	.4byte	.LFE53-.LFB53
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	0
	.4byte	0
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB53
	.4byte	.LFE53
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF11:
	.string	"rt_uint32_t"
.LASF42:
	.string	"event_set"
.LASF53:
	.string	"rt_components_init"
.LASF57:
	.string	"rt_application_init"
.LASF13:
	.string	"rt_ubase_t"
.LASF2:
	.string	"short int"
.LASF43:
	.string	"event_info"
.LASF55:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/applications/start_app/application.c"
.LASF6:
	.string	"long long int"
.LASF59:
	.string	"rt_show_firmware_info"
.LASF47:
	.string	"user_data"
.LASF33:
	.string	"tlist"
.LASF14:
	.string	"rt_err_t"
.LASF26:
	.string	"parent"
.LASF15:
	.string	"rt_tick_t"
.LASF44:
	.string	"remaining_tick"
.LASF54:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF27:
	.string	"timeout_func"
.LASF25:
	.string	"rt_timer"
.LASF7:
	.string	"long long unsigned int"
.LASF4:
	.string	"long int"
.LASF12:
	.string	"rt_base_t"
.LASF30:
	.string	"timeout_tick"
.LASF52:
	.string	"rt_thread_startup"
.LASF21:
	.string	"name"
.LASF29:
	.string	"init_tick"
.LASF50:
	.string	"rt_kprintf"
.LASF34:
	.string	"entry"
.LASF48:
	.string	"rt_thread_t"
.LASF1:
	.string	"unsigned char"
.LASF46:
	.string	"cleanup"
.LASF56:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF32:
	.string	"flags"
.LASF22:
	.string	"type"
.LASF8:
	.string	"unsigned int"
.LASF28:
	.string	"parameter"
.LASF41:
	.string	"number_mask"
.LASF3:
	.string	"short unsigned int"
.LASF9:
	.string	"char"
.LASF49:
	.string	"_Bool"
.LASF10:
	.string	"rt_uint8_t"
.LASF40:
	.string	"init_priority"
.LASF24:
	.string	"list"
.LASF45:
	.string	"thread_timer"
.LASF51:
	.string	"rt_thread_create"
.LASF58:
	.string	"init_thread"
.LASF60:
	.string	"rt_init_thread_entry"
.LASF5:
	.string	"long unsigned int"
.LASF19:
	.string	"rt_list_node"
.LASF36:
	.string	"stack_size"
.LASF39:
	.string	"current_priority"
.LASF37:
	.string	"error"
.LASF20:
	.string	"rt_object"
.LASF18:
	.string	"rt_list_t"
.LASF23:
	.string	"flag"
.LASF38:
	.string	"stat"
.LASF17:
	.string	"prev"
.LASF35:
	.string	"stack_addr"
.LASF31:
	.string	"rt_thread"
.LASF16:
	.string	"next"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
