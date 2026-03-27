	.file	"stdio.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.libc_stdio_set_console.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"r+"
	.align	2
.LC1:
	.string	"wb"
	.align	2
.LC2:
	.string	"rb"
	.align	2
.LC3:
	.string	"/dev/%s"
	.section	.text.libc_stdio_set_console,"ax",@progbits
	.align	1
	.globl	libc_stdio_set_console
	.type	libc_stdio_set_console, @function
libc_stdio_set_console:
.LFB41:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/libc/compilers/newlib/stdio.c"
	.loc 1 23 1
	.cfi_startproc
.LVL0:
	.loc 1 24 5
	.loc 1 25 5
	.loc 1 26 5
	.loc 1 28 5
	.loc 1 23 1 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s1,36(sp)
	mv	a3,a0
	.cfi_offset 9, -12
	mv	s1,a1
	.loc 1 28 5
	lla	a2,.LC3
	li	a1,31
.LVL1:
	mv	a0,sp
.LVL2:
	.loc 1 23 1
	sw	ra,44(sp)
	sw	s0,40(sp)
	sw	s2,32(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.loc 1 28 5
	call	snprintf
.LVL3:
	.loc 1 29 5 is_stmt 1
	.loc 1 31 8 is_stmt 0
	li	a5,2
	.loc 1 29 18
	sb	zero,31(sp)
	.loc 1 31 5 is_stmt 1
	.loc 1 31 34 is_stmt 0
	lla	a1,.LC0
	.loc 1 31 8
	beq	s1,a5,.L2
	.loc 1 32 10 is_stmt 1
	.loc 1 32 13 is_stmt 0
	li	a5,1
	.loc 1 32 41
	lla	a1,.LC1
	.loc 1 32 13
	beq	s1,a5,.L2
	.loc 1 33 20
	lla	a1,.LC2
.L2:
.LVL4:
	.loc 1 35 5 is_stmt 1
	.loc 1 35 10 is_stmt 0
	mv	a0,sp
	call	fopen
.LVL5:
	mv	s0,a0
.LVL6:
	.loc 1 36 5 is_stmt 1
	lla	s2,.LANCHOR0
	.loc 1 36 8 is_stmt 0
	beq	a0,zero,.L3
	.loc 1 38 9 is_stmt 1
	li	a3,0
	li	a2,2
	li	a1,0
	call	setvbuf
.LVL7:
	.loc 1 40 9
	.loc 1 40 13 is_stmt 0
	lw	a0,0(s2)
	.loc 1 40 12
	beq	a0,zero,.L4
	.loc 1 42 13 is_stmt 1
	call	fclose
.LVL8:
	.loc 1 43 13
.L4:
	.loc 1 45 9
	.loc 1 45 21 is_stmt 0
	sw	s0,0(s2)
	.loc 1 47 9 is_stmt 1
	.loc 1 47 12 is_stmt 0
	li	a4,2
	.loc 1 49 25
	lw	a5,_global_impure_ptr
	.loc 1 47 12
	bne	s1,a4,.L5
	.loc 1 49 12 is_stmt 1
	.loc 1 49 34 is_stmt 0
	sw	s0,4(a5)
	.loc 1 56 9 is_stmt 1
.L6:
	.loc 1 63 12
	.loc 1 63 35 is_stmt 0
	sw	s0,8(a5)
	.loc 1 64 12 is_stmt 1
	.loc 1 64 35 is_stmt 0
	sw	s0,12(a5)
	j	.L7
.L5:
	.loc 1 53 12 is_stmt 1
	.loc 1 53 34 is_stmt 0
	sw	zero,4(a5)
	.loc 1 56 9 is_stmt 1
	.loc 1 56 12 is_stmt 0
	bne	s1,zero,.L6
	.loc 1 58 12 is_stmt 1
	.loc 1 58 35 is_stmt 0
	sw	zero,8(a5)
	.loc 1 59 12 is_stmt 1
	.loc 1 59 35 is_stmt 0
	sw	zero,12(a5)
.L7:
	.loc 1 67 8 is_stmt 1
	.loc 1 67 34 is_stmt 0
	li	a4,1
	sw	a4,24(a5)
.L3:
	.loc 1 70 5 is_stmt 1
	.loc 1 70 9 is_stmt 0
	lw	a5,0(s2)
	.loc 1 72 12
	li	a0,-1
	.loc 1 70 8
	beq	a5,zero,.L1
	.loc 1 70 22 is_stmt 1 discriminator 1
	.loc 1 70 29 is_stmt 0 discriminator 1
	mv	a0,a5
	call	fileno
.LVL9:
.L1:
	.loc 1 73 1
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
.LVL10:
	lw	s1,36(sp)
	.cfi_restore 9
.LVL11:
	lw	s2,32(sp)
	.cfi_restore 18
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE41:
	.size	libc_stdio_set_console, .-libc_stdio_set_console
	.section	.text.libc_stdio_get_console,"ax",@progbits
	.align	1
	.globl	libc_stdio_get_console
	.type	libc_stdio_get_console, @function
libc_stdio_get_console:
.LFB42:
	.loc 1 75 34 is_stmt 1
	.cfi_startproc
	.loc 1 76 5
	.loc 1 76 9 is_stmt 0
	lw	a0,.LANCHOR0
	.loc 1 76 8
	beq	a0,zero,.L20
	.loc 1 77 9 is_stmt 1
	.loc 1 77 16 is_stmt 0
	tail	fileno
.LVL12:
.L20:
	.loc 1 80 1
	li	a0,-1
	ret
	.cfi_endproc
.LFE42:
	.size	libc_stdio_get_console, .-libc_stdio_get_console
	.section	.sbss.std_console,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	std_console, @object
	.size	std_console, 4
std_console:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/lib/gcc/riscv-none-embed/10.2.0/include/stddef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/reent.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/lock.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/stdio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x9df
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF128
	.byte	0xc
	.4byte	.LASF129
	.4byte	.LASF130
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
	.4byte	.LASF9
	.byte	0x2
	.2byte	0x15e
	.byte	0x16
	.4byte	0x64
	.byte	0x5
	.4byte	.LASF10
	.byte	0x3
	.byte	0x2e
	.byte	0xe
	.4byte	0x41
	.byte	0x5
	.4byte	.LASF11
	.byte	0x3
	.byte	0x74
	.byte	0xe
	.4byte	0x41
	.byte	0x5
	.4byte	.LASF12
	.byte	0x3
	.byte	0x93
	.byte	0x14
	.4byte	0x5d
	.byte	0x6
	.byte	0x4
	.byte	0x3
	.byte	0xa5
	.byte	0x3
	.4byte	0xbe
	.byte	0x7
	.4byte	.LASF13
	.byte	0x3
	.byte	0xa7
	.byte	0xc
	.4byte	0x6b
	.byte	0x7
	.4byte	.LASF14
	.byte	0x3
	.byte	0xa8
	.byte	0x13
	.4byte	0xbe
	.byte	0
	.byte	0x8
	.4byte	0x2c
	.4byte	0xce
	.byte	0x9
	.4byte	0x64
	.byte	0x3
	.byte	0
	.byte	0xa
	.byte	0x8
	.byte	0x3
	.byte	0xa2
	.byte	0x9
	.4byte	0xf2
	.byte	0xb
	.4byte	.LASF15
	.byte	0x3
	.byte	0xa4
	.byte	0x7
	.4byte	0x5d
	.byte	0
	.byte	0xb
	.4byte	.LASF16
	.byte	0x3
	.byte	0xa9
	.byte	0x5
	.4byte	0x9c
	.byte	0x4
	.byte	0
	.byte	0x5
	.4byte	.LASF17
	.byte	0x3
	.byte	0xaa
	.byte	0x3
	.4byte	0xce
	.byte	0xc
	.byte	0x4
	.byte	0x5
	.4byte	.LASF18
	.byte	0x4
	.byte	0x16
	.byte	0x17
	.4byte	0x48
	.byte	0x5
	.4byte	.LASF19
	.byte	0x5
	.byte	0xc
	.byte	0xd
	.4byte	0x5d
	.byte	0x5
	.4byte	.LASF20
	.byte	0x4
	.byte	0x23
	.byte	0x1b
	.4byte	0x10c
	.byte	0xd
	.4byte	.LASF25
	.byte	0x18
	.byte	0x4
	.byte	0x34
	.byte	0x8
	.4byte	0x17e
	.byte	0xb
	.4byte	.LASF21
	.byte	0x4
	.byte	0x36
	.byte	0x13
	.4byte	0x17e
	.byte	0
	.byte	0xe
	.string	"_k"
	.byte	0x4
	.byte	0x37
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF22
	.byte	0x4
	.byte	0x37
	.byte	0xb
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF23
	.byte	0x4
	.byte	0x37
	.byte	0x14
	.4byte	0x5d
	.byte	0xc
	.byte	0xb
	.4byte	.LASF24
	.byte	0x4
	.byte	0x37
	.byte	0x1b
	.4byte	0x5d
	.byte	0x10
	.byte	0xe
	.string	"_x"
	.byte	0x4
	.byte	0x38
	.byte	0xb
	.4byte	0x184
	.byte	0x14
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x124
	.byte	0x8
	.4byte	0x100
	.4byte	0x194
	.byte	0x9
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	.LASF26
	.byte	0x24
	.byte	0x4
	.byte	0x3c
	.byte	0x8
	.4byte	0x217
	.byte	0xb
	.4byte	.LASF27
	.byte	0x4
	.byte	0x3e
	.byte	0x7
	.4byte	0x5d
	.byte	0
	.byte	0xb
	.4byte	.LASF28
	.byte	0x4
	.byte	0x3f
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF29
	.byte	0x4
	.byte	0x40
	.byte	0x7
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF30
	.byte	0x4
	.byte	0x41
	.byte	0x7
	.4byte	0x5d
	.byte	0xc
	.byte	0xb
	.4byte	.LASF31
	.byte	0x4
	.byte	0x42
	.byte	0x7
	.4byte	0x5d
	.byte	0x10
	.byte	0xb
	.4byte	.LASF32
	.byte	0x4
	.byte	0x43
	.byte	0x7
	.4byte	0x5d
	.byte	0x14
	.byte	0xb
	.4byte	.LASF33
	.byte	0x4
	.byte	0x44
	.byte	0x7
	.4byte	0x5d
	.byte	0x18
	.byte	0xb
	.4byte	.LASF34
	.byte	0x4
	.byte	0x45
	.byte	0x7
	.4byte	0x5d
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF35
	.byte	0x4
	.byte	0x46
	.byte	0x7
	.4byte	0x5d
	.byte	0x20
	.byte	0
	.byte	0x10
	.4byte	.LASF36
	.2byte	0x108
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.4byte	0x25c
	.byte	0xb
	.4byte	.LASF37
	.byte	0x4
	.byte	0x50
	.byte	0x9
	.4byte	0x25c
	.byte	0
	.byte	0xb
	.4byte	.LASF38
	.byte	0x4
	.byte	0x51
	.byte	0x9
	.4byte	0x25c
	.byte	0x80
	.byte	0x11
	.4byte	.LASF39
	.byte	0x4
	.byte	0x53
	.byte	0xa
	.4byte	0x100
	.2byte	0x100
	.byte	0x11
	.4byte	.LASF40
	.byte	0x4
	.byte	0x56
	.byte	0xa
	.4byte	0x100
	.2byte	0x104
	.byte	0
	.byte	0x8
	.4byte	0xfe
	.4byte	0x26c
	.byte	0x9
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0xd
	.4byte	.LASF41
	.byte	0x8c
	.byte	0x4
	.byte	0x5a
	.byte	0x8
	.4byte	0x2ae
	.byte	0xb
	.4byte	.LASF21
	.byte	0x4
	.byte	0x5b
	.byte	0x12
	.4byte	0x2ae
	.byte	0
	.byte	0xb
	.4byte	.LASF42
	.byte	0x4
	.byte	0x5c
	.byte	0x6
	.4byte	0x5d
	.byte	0x4
	.byte	0xb
	.4byte	.LASF43
	.byte	0x4
	.byte	0x5d
	.byte	0x9
	.4byte	0x2b4
	.byte	0x8
	.byte	0xb
	.4byte	.LASF44
	.byte	0x4
	.byte	0x5e
	.byte	0x20
	.4byte	0x2cb
	.byte	0x88
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x26c
	.byte	0x8
	.4byte	0x2c4
	.4byte	0x2c4
	.byte	0x9
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x2ca
	.byte	0x12
	.byte	0xf
	.byte	0x4
	.4byte	0x217
	.byte	0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x4
	.byte	0x7a
	.byte	0x8
	.4byte	0x2f9
	.byte	0xb
	.4byte	.LASF46
	.byte	0x4
	.byte	0x7b
	.byte	0x11
	.4byte	0x2f9
	.byte	0
	.byte	0xb
	.4byte	.LASF47
	.byte	0x4
	.byte	0x7c
	.byte	0x6
	.4byte	0x5d
	.byte	0x4
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x2c
	.byte	0x13
	.4byte	.LASF48
	.byte	0xf0
	.byte	0x4
	.2byte	0x179
	.byte	0x8
	.4byte	0x45e
	.byte	0x14
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x17d
	.byte	0x7
	.4byte	0x5d
	.byte	0
	.byte	0x14
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x182
	.byte	0xb
	.4byte	0x6b6
	.byte	0x4
	.byte	0x14
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x182
	.byte	0x14
	.4byte	0x6b6
	.byte	0x8
	.byte	0x14
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x182
	.byte	0x1e
	.4byte	0x6b6
	.byte	0xc
	.byte	0x14
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x184
	.byte	0x7
	.4byte	0x5d
	.byte	0x10
	.byte	0x14
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x186
	.byte	0x9
	.4byte	0x5ca
	.byte	0x14
	.byte	0x14
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x188
	.byte	0x7
	.4byte	0x5d
	.byte	0x18
	.byte	0x14
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x18a
	.byte	0x7
	.4byte	0x5d
	.byte	0x1c
	.byte	0x14
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x18b
	.byte	0x16
	.4byte	0x81e
	.byte	0x20
	.byte	0x15
	.string	"_mp"
	.byte	0x4
	.2byte	0x18d
	.byte	0x12
	.4byte	0x824
	.byte	0x24
	.byte	0x14
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x18f
	.byte	0xa
	.4byte	0x835
	.byte	0x28
	.byte	0x14
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x191
	.byte	0x7
	.4byte	0x5d
	.byte	0x2c
	.byte	0x14
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x194
	.byte	0x7
	.4byte	0x5d
	.byte	0x30
	.byte	0x14
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x195
	.byte	0x9
	.4byte	0x5ca
	.byte	0x34
	.byte	0x14
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x197
	.byte	0x13
	.4byte	0x83b
	.byte	0x38
	.byte	0x14
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x198
	.byte	0x10
	.4byte	0x841
	.byte	0x3c
	.byte	0x14
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x199
	.byte	0x9
	.4byte	0x5ca
	.byte	0x40
	.byte	0x14
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x19c
	.byte	0xc
	.4byte	0x852
	.byte	0x44
	.byte	0x14
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x1a0
	.byte	0x13
	.4byte	0x2ae
	.byte	0x48
	.byte	0x14
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x1a1
	.byte	0x12
	.4byte	0x26c
	.byte	0x4c
	.byte	0x14
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x1a4
	.byte	0x10
	.4byte	0x677
	.byte	0xd8
	.byte	0x14
	.4byte	.LASF68
	.byte	0x4
	.2byte	0x1a5
	.byte	0xb
	.4byte	0x6b6
	.byte	0xe4
	.byte	0x14
	.4byte	.LASF69
	.byte	0x4
	.2byte	0x1a6
	.byte	0x17
	.4byte	0x85e
	.byte	0xe8
	.byte	0x14
	.4byte	.LASF70
	.byte	0x4
	.2byte	0x1a7
	.byte	0x9
	.4byte	0x5ca
	.byte	0xec
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x2ff
	.byte	0x16
	.4byte	0x45e
	.byte	0xd
	.4byte	.LASF71
	.byte	0x68
	.byte	0x4
	.byte	0xba
	.byte	0x8
	.4byte	0x5ac
	.byte	0xe
	.string	"_p"
	.byte	0x4
	.byte	0xbb
	.byte	0x12
	.4byte	0x2f9
	.byte	0
	.byte	0xe
	.string	"_r"
	.byte	0x4
	.byte	0xbc
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.byte	0xe
	.string	"_w"
	.byte	0x4
	.byte	0xbd
	.byte	0x7
	.4byte	0x5d
	.byte	0x8
	.byte	0xb
	.4byte	.LASF72
	.byte	0x4
	.byte	0xbe
	.byte	0x9
	.4byte	0x33
	.byte	0xc
	.byte	0xb
	.4byte	.LASF73
	.byte	0x4
	.byte	0xbf
	.byte	0x9
	.4byte	0x33
	.byte	0xe
	.byte	0xe
	.string	"_bf"
	.byte	0x4
	.byte	0xc0
	.byte	0x11
	.4byte	0x2d1
	.byte	0x10
	.byte	0xb
	.4byte	.LASF74
	.byte	0x4
	.byte	0xc1
	.byte	0x7
	.4byte	0x5d
	.byte	0x18
	.byte	0xb
	.4byte	.LASF75
	.byte	0x4
	.byte	0xc4
	.byte	0x12
	.4byte	0x45e
	.byte	0x1c
	.byte	0xb
	.4byte	.LASF76
	.byte	0x4
	.byte	0xc8
	.byte	0xa
	.4byte	0xfe
	.byte	0x20
	.byte	0xb
	.4byte	.LASF77
	.byte	0x4
	.byte	0xca
	.byte	0xe
	.4byte	0x5dc
	.byte	0x24
	.byte	0xb
	.4byte	.LASF78
	.byte	0x4
	.byte	0xcc
	.byte	0xe
	.4byte	0x606
	.byte	0x28
	.byte	0xb
	.4byte	.LASF79
	.byte	0x4
	.byte	0xcf
	.byte	0xd
	.4byte	0x62a
	.byte	0x2c
	.byte	0xb
	.4byte	.LASF80
	.byte	0x4
	.byte	0xd0
	.byte	0x9
	.4byte	0x644
	.byte	0x30
	.byte	0xe
	.string	"_ub"
	.byte	0x4
	.byte	0xd3
	.byte	0x11
	.4byte	0x2d1
	.byte	0x34
	.byte	0xe
	.string	"_up"
	.byte	0x4
	.byte	0xd4
	.byte	0x12
	.4byte	0x2f9
	.byte	0x3c
	.byte	0xe
	.string	"_ur"
	.byte	0x4
	.byte	0xd5
	.byte	0x7
	.4byte	0x5d
	.byte	0x40
	.byte	0xb
	.4byte	.LASF81
	.byte	0x4
	.byte	0xd8
	.byte	0x11
	.4byte	0x64a
	.byte	0x44
	.byte	0xb
	.4byte	.LASF82
	.byte	0x4
	.byte	0xd9
	.byte	0x11
	.4byte	0x65a
	.byte	0x47
	.byte	0xe
	.string	"_lb"
	.byte	0x4
	.byte	0xdc
	.byte	0x11
	.4byte	0x2d1
	.byte	0x48
	.byte	0xb
	.4byte	.LASF83
	.byte	0x4
	.byte	0xdf
	.byte	0x7
	.4byte	0x5d
	.byte	0x50
	.byte	0xb
	.4byte	.LASF84
	.byte	0x4
	.byte	0xe0
	.byte	0xa
	.4byte	0x78
	.byte	0x54
	.byte	0xb
	.4byte	.LASF85
	.byte	0x4
	.byte	0xe7
	.byte	0xc
	.4byte	0x118
	.byte	0x58
	.byte	0xb
	.4byte	.LASF86
	.byte	0x4
	.byte	0xe9
	.byte	0xe
	.4byte	0xf2
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF87
	.byte	0x4
	.byte	0xea
	.byte	0x7
	.4byte	0x5d
	.byte	0x64
	.byte	0
	.byte	0x17
	.4byte	0x90
	.4byte	0x5ca
	.byte	0x18
	.4byte	0x45e
	.byte	0x18
	.4byte	0xfe
	.byte	0x18
	.4byte	0x5ca
	.byte	0x18
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x5d0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF88
	.byte	0x16
	.4byte	0x5d0
	.byte	0xf
	.byte	0x4
	.4byte	0x5ac
	.byte	0x17
	.4byte	0x90
	.4byte	0x600
	.byte	0x18
	.4byte	0x45e
	.byte	0x18
	.4byte	0xfe
	.byte	0x18
	.4byte	0x600
	.byte	0x18
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x5d7
	.byte	0xf
	.byte	0x4
	.4byte	0x5e2
	.byte	0x17
	.4byte	0x84
	.4byte	0x62a
	.byte	0x18
	.4byte	0x45e
	.byte	0x18
	.4byte	0xfe
	.byte	0x18
	.4byte	0x84
	.byte	0x18
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x60c
	.byte	0x17
	.4byte	0x5d
	.4byte	0x644
	.byte	0x18
	.4byte	0x45e
	.byte	0x18
	.4byte	0xfe
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x630
	.byte	0x8
	.4byte	0x2c
	.4byte	0x65a
	.byte	0x9
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x8
	.4byte	0x2c
	.4byte	0x66a
	.byte	0x9
	.4byte	0x64
	.byte	0
	.byte	0
	.byte	0x4
	.4byte	.LASF89
	.byte	0x4
	.2byte	0x124
	.byte	0x18
	.4byte	0x469
	.byte	0x13
	.4byte	.LASF90
	.byte	0xc
	.byte	0x4
	.2byte	0x128
	.byte	0x8
	.4byte	0x6b0
	.byte	0x14
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6b0
	.byte	0
	.byte	0x14
	.4byte	.LASF91
	.byte	0x4
	.2byte	0x12b
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.byte	0x14
	.4byte	.LASF92
	.byte	0x4
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6b6
	.byte	0x8
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x677
	.byte	0xf
	.byte	0x4
	.4byte	0x66a
	.byte	0x13
	.4byte	.LASF93
	.byte	0x18
	.byte	0x4
	.2byte	0x144
	.byte	0x8
	.4byte	0x703
	.byte	0x14
	.4byte	.LASF94
	.byte	0x4
	.2byte	0x145
	.byte	0x12
	.4byte	0x703
	.byte	0
	.byte	0x14
	.4byte	.LASF95
	.byte	0x4
	.2byte	0x146
	.byte	0x12
	.4byte	0x703
	.byte	0x6
	.byte	0x14
	.4byte	.LASF96
	.byte	0x4
	.2byte	0x147
	.byte	0x12
	.4byte	0x3a
	.byte	0xc
	.byte	0x14
	.4byte	.LASF97
	.byte	0x4
	.2byte	0x14a
	.byte	0x24
	.4byte	0x56
	.byte	0x10
	.byte	0
	.byte	0x8
	.4byte	0x3a
	.4byte	0x713
	.byte	0x9
	.4byte	0x64
	.byte	0x2
	.byte	0
	.byte	0x13
	.4byte	.LASF98
	.byte	0x10
	.byte	0x4
	.2byte	0x15d
	.byte	0x8
	.4byte	0x75a
	.byte	0x14
	.4byte	.LASF99
	.byte	0x4
	.2byte	0x160
	.byte	0x13
	.4byte	0x17e
	.byte	0
	.byte	0x14
	.4byte	.LASF100
	.byte	0x4
	.2byte	0x161
	.byte	0x7
	.4byte	0x5d
	.byte	0x4
	.byte	0x14
	.4byte	.LASF101
	.byte	0x4
	.2byte	0x162
	.byte	0x13
	.4byte	0x17e
	.byte	0x8
	.byte	0x14
	.4byte	.LASF102
	.byte	0x4
	.2byte	0x163
	.byte	0x14
	.4byte	0x75a
	.byte	0xc
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x17e
	.byte	0x13
	.4byte	.LASF103
	.byte	0x50
	.byte	0x4
	.2byte	0x167
	.byte	0x8
	.4byte	0x809
	.byte	0x14
	.4byte	.LASF104
	.byte	0x4
	.2byte	0x16a
	.byte	0x9
	.4byte	0x5ca
	.byte	0
	.byte	0x14
	.4byte	.LASF105
	.byte	0x4
	.2byte	0x16b
	.byte	0xe
	.4byte	0xf2
	.byte	0x4
	.byte	0x14
	.4byte	.LASF106
	.byte	0x4
	.2byte	0x16c
	.byte	0xe
	.4byte	0xf2
	.byte	0xc
	.byte	0x14
	.4byte	.LASF107
	.byte	0x4
	.2byte	0x16d
	.byte	0xe
	.4byte	0xf2
	.byte	0x14
	.byte	0x14
	.4byte	.LASF108
	.byte	0x4
	.2byte	0x16e
	.byte	0x8
	.4byte	0x809
	.byte	0x1c
	.byte	0x14
	.4byte	.LASF109
	.byte	0x4
	.2byte	0x16f
	.byte	0x7
	.4byte	0x5d
	.byte	0x24
	.byte	0x14
	.4byte	.LASF110
	.byte	0x4
	.2byte	0x170
	.byte	0xe
	.4byte	0xf2
	.byte	0x28
	.byte	0x14
	.4byte	.LASF111
	.byte	0x4
	.2byte	0x171
	.byte	0xe
	.4byte	0xf2
	.byte	0x30
	.byte	0x14
	.4byte	.LASF112
	.byte	0x4
	.2byte	0x172
	.byte	0xe
	.4byte	0xf2
	.byte	0x38
	.byte	0x14
	.4byte	.LASF113
	.byte	0x4
	.2byte	0x173
	.byte	0xe
	.4byte	0xf2
	.byte	0x40
	.byte	0x14
	.4byte	.LASF114
	.byte	0x4
	.2byte	0x174
	.byte	0xe
	.4byte	0xf2
	.byte	0x48
	.byte	0
	.byte	0x8
	.4byte	0x5d0
	.4byte	0x819
	.byte	0x9
	.4byte	0x64
	.byte	0x7
	.byte	0
	.byte	0x19
	.4byte	.LASF131
	.byte	0xf
	.byte	0x4
	.4byte	0x819
	.byte	0xf
	.byte	0x4
	.4byte	0x713
	.byte	0x1a
	.4byte	0x835
	.byte	0x18
	.4byte	0x45e
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x82a
	.byte	0xf
	.byte	0x4
	.4byte	0x6bc
	.byte	0xf
	.byte	0x4
	.4byte	0x194
	.byte	0x1a
	.4byte	0x852
	.byte	0x18
	.4byte	0x5d
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x858
	.byte	0xf
	.byte	0x4
	.4byte	0x847
	.byte	0xf
	.byte	0x4
	.4byte	0x760
	.byte	0x1b
	.4byte	.LASF132
	.byte	0x4
	.2byte	0x334
	.byte	0x1d
	.4byte	0x464
	.byte	0x5
	.4byte	.LASF115
	.byte	0x6
	.byte	0x42
	.byte	0x10
	.4byte	0x66a
	.byte	0x1c
	.4byte	.LASF120
	.byte	0x1
	.byte	0x14
	.byte	0xe
	.4byte	0x88f
	.byte	0x5
	.byte	0x3
	.4byte	std_console
	.byte	0xf
	.byte	0x4
	.4byte	0x871
	.byte	0x1d
	.4byte	.LASF116
	.byte	0x1
	.byte	0x4b
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x8b9
	.byte	0x1e
	.4byte	.LVL12
	.4byte	0x9a4
	.byte	0
	.byte	0x1d
	.4byte	.LASF117
	.byte	0x1
	.byte	0x16
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x994
	.byte	0x1f
	.4byte	.LASF118
	.byte	0x1
	.byte	0x16
	.byte	0x28
	.4byte	0x600
	.4byte	.LLST0
	.byte	0x1f
	.4byte	.LASF119
	.byte	0x1
	.byte	0x16
	.byte	0x39
	.4byte	0x5d
	.4byte	.LLST1
	.byte	0x20
	.string	"fp"
	.byte	0x1
	.byte	0x18
	.byte	0xb
	.4byte	0x88f
	.4byte	.LLST2
	.byte	0x1c
	.4byte	.LASF121
	.byte	0x1
	.byte	0x19
	.byte	0xa
	.4byte	0x994
	.byte	0x2
	.byte	0x91
	.byte	0x50
	.byte	0x21
	.4byte	.LASF122
	.byte	0x1
	.byte	0x1a
	.byte	0xb
	.4byte	0x5ca
	.4byte	.LLST3
	.byte	0x22
	.4byte	.LVL3
	.4byte	0x9b1
	.4byte	0x94a
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x4f
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0x23
	.byte	0x1
	.byte	0x5d
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x22
	.4byte	.LVL5
	.4byte	0x9be
	.4byte	0x95e
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x72
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LVL7
	.4byte	0x9ca
	.4byte	0x981
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x32
	.byte	0x23
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x24
	.4byte	.LVL8
	.4byte	0x9d6
	.byte	0x24
	.4byte	.LVL9
	.4byte	0x9a4
	.byte	0
	.byte	0x8
	.4byte	0x5d0
	.4byte	0x9a4
	.byte	0x9
	.4byte	0x64
	.byte	0x1f
	.byte	0
	.byte	0x25
	.4byte	.LASF123
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x155
	.byte	0x5
	.byte	0x25
	.4byte	.LASF124
	.4byte	.LASF124
	.byte	0x6
	.2byte	0x10a
	.byte	0x5
	.byte	0x26
	.4byte	.LASF125
	.4byte	.LASF125
	.byte	0x6
	.byte	0xf3
	.byte	0x8
	.byte	0x26
	.4byte	.LASF126
	.4byte	.LASF126
	.byte	0x6
	.byte	0xc3
	.byte	0x5
	.byte	0x26
	.4byte	.LASF127
	.4byte	.LASF127
	.byte	0x6
	.byte	0xbf
	.byte	0x5
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
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
	.byte	0x6
	.byte	0x17
	.byte	0x1
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
	.byte	0x7
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
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x13
	.byte	0x1
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
	.byte	0xb
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
	.byte	0xc
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
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
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x11
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x26
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
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LVL3-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL3-1
	.4byte	.LFE41
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
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL11
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL6
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4
	.4byte	.LVL5-1
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
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF69:
	.string	"_misc"
.LASF121:
	.string	"name"
.LASF126:
	.string	"setvbuf"
.LASF128:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF36:
	.string	"_on_exit_args"
.LASF78:
	.string	"_write"
.LASF106:
	.string	"_wctomb_state"
.LASF62:
	.string	"_r48"
.LASF70:
	.string	"_signal_buf"
.LASF8:
	.string	"unsigned int"
.LASF74:
	.string	"_lbfsize"
.LASF72:
	.string	"_flags"
.LASF115:
	.string	"FILE"
.LASF49:
	.string	"_errno"
.LASF19:
	.string	"_LOCK_RECURSIVE_T"
.LASF77:
	.string	"_read"
.LASF119:
	.string	"mode"
.LASF110:
	.string	"_mbrlen_state"
.LASF51:
	.string	"_stdout"
.LASF11:
	.string	"_fpos_t"
.LASF43:
	.string	"_fns"
.LASF76:
	.string	"_cookie"
.LASF132:
	.string	"_global_impure_ptr"
.LASF25:
	.string	"_Bigint"
.LASF33:
	.string	"__tm_wday"
.LASF99:
	.string	"_result"
.LASF29:
	.string	"__tm_hour"
.LASF15:
	.string	"__count"
.LASF28:
	.string	"__tm_min"
.LASF68:
	.string	"__sf"
.LASF120:
	.string	"std_console"
.LASF129:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/libc/compilers/newlib/stdio.c"
.LASF93:
	.string	"_rand48"
.LASF100:
	.string	"_result_k"
.LASF7:
	.string	"long long unsigned int"
.LASF64:
	.string	"_asctime_buf"
.LASF71:
	.string	"__sFILE"
.LASF24:
	.string	"_wds"
.LASF89:
	.string	"__FILE"
.LASF84:
	.string	"_offset"
.LASF54:
	.string	"_emergency"
.LASF122:
	.string	"file_mode"
.LASF27:
	.string	"__tm_sec"
.LASF34:
	.string	"__tm_yday"
.LASF53:
	.string	"_inc"
.LASF42:
	.string	"_ind"
.LASF123:
	.string	"fileno"
.LASF21:
	.string	"_next"
.LASF112:
	.string	"_mbsrtowcs_state"
.LASF16:
	.string	"__value"
.LASF101:
	.string	"_p5s"
.LASF114:
	.string	"_wcsrtombs_state"
.LASF105:
	.string	"_mblen_state"
.LASF88:
	.string	"char"
.LASF30:
	.string	"__tm_mday"
.LASF65:
	.string	"_sig_func"
.LASF111:
	.string	"_mbrtowc_state"
.LASF20:
	.string	"_flock_t"
.LASF13:
	.string	"__wch"
.LASF92:
	.string	"_iobs"
.LASF44:
	.string	"_on_exit_args_ptr"
.LASF80:
	.string	"_close"
.LASF55:
	.string	"__sdidinit"
.LASF50:
	.string	"_stdin"
.LASF59:
	.string	"_gamma_signgam"
.LASF6:
	.string	"long long int"
.LASF46:
	.string	"_base"
.LASF102:
	.string	"_freelist"
.LASF95:
	.string	"_mult"
.LASF18:
	.string	"__ULong"
.LASF113:
	.string	"_wcrtomb_state"
.LASF73:
	.string	"_file"
.LASF58:
	.string	"__cleanup"
.LASF17:
	.string	"_mbstate_t"
.LASF98:
	.string	"_mprec"
.LASF37:
	.string	"_fnargs"
.LASF124:
	.string	"snprintf"
.LASF35:
	.string	"__tm_isdst"
.LASF125:
	.string	"fopen"
.LASF31:
	.string	"__tm_mon"
.LASF66:
	.string	"_atexit0"
.LASF41:
	.string	"_atexit"
.LASF86:
	.string	"_mbstate"
.LASF117:
	.string	"libc_stdio_set_console"
.LASF2:
	.string	"short int"
.LASF4:
	.string	"long int"
.LASF23:
	.string	"_sign"
.LASF116:
	.string	"libc_stdio_get_console"
.LASF75:
	.string	"_data"
.LASF14:
	.string	"__wchb"
.LASF130:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF127:
	.string	"fclose"
.LASF32:
	.string	"__tm_year"
.LASF103:
	.string	"_misc_reent"
.LASF63:
	.string	"_localtime_buf"
.LASF60:
	.string	"_cvtlen"
.LASF22:
	.string	"_maxwds"
.LASF108:
	.string	"_l64a_buf"
.LASF83:
	.string	"_blksize"
.LASF26:
	.string	"__tm"
.LASF85:
	.string	"_lock"
.LASF5:
	.string	"long unsigned int"
.LASF91:
	.string	"_niobs"
.LASF9:
	.string	"wint_t"
.LASF38:
	.string	"_dso_handle"
.LASF61:
	.string	"_cvtbuf"
.LASF1:
	.string	"unsigned char"
.LASF109:
	.string	"_getdate_err"
.LASF118:
	.string	"device_name"
.LASF96:
	.string	"_add"
.LASF45:
	.string	"__sbuf"
.LASF90:
	.string	"_glue"
.LASF67:
	.string	"__sglue"
.LASF104:
	.string	"_strtok_last"
.LASF107:
	.string	"_mbtowc_state"
.LASF57:
	.string	"_locale"
.LASF12:
	.string	"_ssize_t"
.LASF0:
	.string	"signed char"
.LASF48:
	.string	"_reent"
.LASF3:
	.string	"short unsigned int"
.LASF39:
	.string	"_fntypes"
.LASF47:
	.string	"_size"
.LASF10:
	.string	"_off_t"
.LASF82:
	.string	"_nbuf"
.LASF56:
	.string	"_unspecified_locale_info"
.LASF87:
	.string	"_flags2"
.LASF40:
	.string	"_is_cxa"
.LASF94:
	.string	"_seed"
.LASF97:
	.string	"_rand_next"
.LASF131:
	.string	"__locale_t"
.LASF79:
	.string	"_seek"
.LASF52:
	.string	"_stderr"
.LASF81:
	.string	"_ubuf"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
