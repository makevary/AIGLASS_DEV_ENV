	.file	"drv_cache.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_hw_cpu_icache_enable,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_icache_enable
	.type	rt_hw_cpu_icache_enable, @function
rt_hw_cpu_icache_enable:
.LFB33:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_cache.c"
	.loc 1 100 1
	.cfi_startproc
	.loc 1 101 5
	tail	HAL_ICACHE_Enable
.LVL0:
	.cfi_endproc
.LFE33:
	.size	rt_hw_cpu_icache_enable, .-rt_hw_cpu_icache_enable
	.section	.text.rt_hw_cpu_icache_disable,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_icache_disable
	.type	rt_hw_cpu_icache_disable, @function
rt_hw_cpu_icache_disable:
.LFB34:
	.loc 1 110 1
	.cfi_startproc
	.loc 1 111 5
	tail	HAL_ICACHE_Disable
.LVL1:
	.cfi_endproc
.LFE34:
	.size	rt_hw_cpu_icache_disable, .-rt_hw_cpu_icache_disable
	.section	.text.rt_hw_cpu_icache_status,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_icache_status
	.type	rt_hw_cpu_icache_status, @function
rt_hw_cpu_icache_status:
.LFB35:
	.loc 1 120 1
	.cfi_startproc
	.loc 1 121 5
	.loc 1 122 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE35:
	.size	rt_hw_cpu_icache_status, .-rt_hw_cpu_icache_status
	.section	.text.rt_hw_cpu_icache_ops,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_icache_ops
	.type	rt_hw_cpu_icache_ops, @function
rt_hw_cpu_icache_ops:
.LFB36:
	.loc 1 131 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 132 5
	.loc 1 131 1 is_stmt 0
	mv	a5,a0
	.loc 1 132 13
	andi	a5,a5,2
	.loc 1 131 1
	mv	a0,a1
.LVL3:
	mv	a1,a2
.LVL4:
	.loc 1 132 8
	beq	a5,zero,.L4
	.loc 1 134 9 is_stmt 1
	tail	HAL_ICACHE_InvalidateByRange
.LVL5:
.L4:
	.loc 1 136 1 is_stmt 0
	ret
	.cfi_endproc
.LFE36:
	.size	rt_hw_cpu_icache_ops, .-rt_hw_cpu_icache_ops
	.section	.text.rt_hw_cpu_dcache_enable,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_dcache_enable
	.type	rt_hw_cpu_dcache_enable, @function
rt_hw_cpu_dcache_enable:
.LFB37:
	.loc 1 144 1 is_stmt 1
	.cfi_startproc
	.loc 1 145 5
	tail	HAL_DCACHE_Enable
.LVL6:
	.cfi_endproc
.LFE37:
	.size	rt_hw_cpu_dcache_enable, .-rt_hw_cpu_dcache_enable
	.section	.text.rt_hw_cpu_dcache_disable,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_dcache_disable
	.type	rt_hw_cpu_dcache_disable, @function
rt_hw_cpu_dcache_disable:
.LFB38:
	.loc 1 154 1
	.cfi_startproc
	.loc 1 155 5
	tail	HAL_DCACHE_Disable
.LVL7:
	.cfi_endproc
.LFE38:
	.size	rt_hw_cpu_dcache_disable, .-rt_hw_cpu_dcache_disable
	.section	.text.rt_hw_cpu_dcache_status,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_dcache_status
	.type	rt_hw_cpu_dcache_status, @function
rt_hw_cpu_dcache_status:
.LFB44:
	.cfi_startproc
	li	a0,0
	ret
	.cfi_endproc
.LFE44:
	.size	rt_hw_cpu_dcache_status, .-rt_hw_cpu_dcache_status
	.section	.text.rt_hw_cpu_dcache_ops,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_dcache_ops
	.type	rt_hw_cpu_dcache_ops, @function
rt_hw_cpu_dcache_ops:
.LFB40:
	.loc 1 176 1
	.cfi_startproc
.LVL8:
	.loc 1 177 5
	.loc 1 176 1 is_stmt 0
	mv	a5,a0
	.loc 1 177 35
	andi	a3,a5,3
	.loc 1 177 8
	li	a4,3
	.loc 1 176 1
	mv	a0,a1
.LVL9:
	mv	a1,a2
.LVL10:
	.loc 1 177 8
	bne	a3,a4,.L10
	.loc 1 179 9 is_stmt 1
	tail	HAL_DCACHE_CleanInvalidateByRange
.LVL11:
.L10:
	.loc 1 181 10
	.loc 1 181 18 is_stmt 0
	andi	a4,a5,1
	.loc 1 181 13
	beq	a4,zero,.L11
	.loc 1 183 9 is_stmt 1
	tail	HAL_DCACHE_CleanByRange
.LVL12:
.L11:
	.loc 1 185 10
	.loc 1 185 18 is_stmt 0
	andi	a5,a5,2
.LVL13:
	.loc 1 185 13
	beq	a5,zero,.L9
	.loc 1 187 9 is_stmt 1
	tail	HAL_DCACHE_InvalidateByRange
.LVL14:
.L9:
	.loc 1 193 1 is_stmt 0
	ret
	.cfi_endproc
.LFE40:
	.size	rt_hw_cpu_dcache_ops, .-rt_hw_cpu_dcache_ops
	.section	.rodata.cache_dump_ahb_error.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"a ahb bus error occur in icache, addr=%p\n"
	.align	2
.LC1:
	.string	"a ahb bus error occur in dcache, addr=%p\n"
	.section	.text.cache_dump_ahb_error,"ax",@progbits
	.align	1
	.globl	cache_dump_ahb_error
	.type	cache_dump_ahb_error, @function
cache_dump_ahb_error:
.LFB41:
	.loc 1 201 1 is_stmt 1
	.cfi_startproc
.LVL15:
	.loc 1 202 5
	.loc 1 204 5
	.loc 1 201 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 204 9
	call	HAL_ICACHE_GetInt
.LVL16:
	.loc 1 204 8
	beq	a0,zero,.L14
	.loc 1 206 9 is_stmt 1
	.loc 1 206 16 is_stmt 0
	call	HAL_ICACHE_GetErrAddr
.LVL17:
	mv	a1,a0
.LVL18:
	.loc 1 207 9 is_stmt 1
	lla	a0,.LC0
.LVL19:
	call	rt_kprintf
.LVL20:
	.loc 1 208 9
	call	HAL_ICACHE_ClearInt
.LVL21:
.L14:
	.loc 1 211 5
	.loc 1 211 9 is_stmt 0
	call	HAL_DCACHE_GetInt
.LVL22:
	.loc 1 211 8
	beq	a0,zero,.L15
	.loc 1 213 9 is_stmt 1
	.loc 1 213 16 is_stmt 0
	call	HAL_DCACHE_GetErrAddr
.LVL23:
	mv	a1,a0
.LVL24:
	.loc 1 214 9 is_stmt 1
	lla	a0,.LC1
.LVL25:
	call	rt_kprintf
.LVL26:
	.loc 1 215 9
	call	HAL_DCACHE_ClearInt
.LVL27:
.L15:
.L21:
	.loc 1 222 5 discriminator 1
	.loc 1 222 14 discriminator 1
	.loc 1 222 11 discriminator 1
	j	.L21
	.cfi_endproc
.LFE41:
	.size	cache_dump_ahb_error, .-cache_dump_ahb_error
	.section	.text.rt_hw_cpu_cache_init,"ax",@progbits
	.align	1
	.globl	rt_hw_cpu_cache_init
	.type	rt_hw_cpu_cache_init, @function
rt_hw_cpu_cache_init:
.LFB42:
	.loc 1 232 1
	.cfi_startproc
	.loc 1 234 5
	.loc 1 232 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 234 5
	call	HAL_ICACHE_EnableInt
.LVL28:
	.loc 1 235 5 is_stmt 1
	call	HAL_DCACHE_EnableInt
.LVL29:
	.loc 1 249 5
	.loc 1 250 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE42:
	.size	rt_hw_cpu_cache_init, .-rt_hw_cpu_cache_init
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cache.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x3dc
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF44
	.byte	0xc
	.4byte	.LASF45
	.4byte	.LASF46
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
	.4byte	.LASF10
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x4f
	.byte	0x4
	.4byte	.LASF12
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x80
	.byte	0x6
	.4byte	.LASF47
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x7
	.byte	0x29
	.byte	0x6
	.4byte	0xb7
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF15
	.byte	0x8
	.4byte	.LASF48
	.byte	0x1
	.byte	0xe7
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0xeb
	.byte	0x9
	.4byte	.LVL28
	.4byte	0x312
	.byte	0x9
	.4byte	.LVL29
	.4byte	0x31e
	.byte	0
	.byte	0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0xc8
	.byte	0x6
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x196
	.byte	0xb
	.4byte	.LASF16
	.byte	0x1
	.byte	0xc8
	.byte	0x24
	.4byte	0x8c
	.4byte	.LLST6
	.byte	0xb
	.4byte	.LASF17
	.byte	0x1
	.byte	0xc8
	.byte	0x3f
	.4byte	0x8c
	.4byte	.LLST7
	.byte	0xc
	.4byte	.LASF20
	.byte	0x1
	.byte	0xca
	.byte	0xe
	.4byte	0x8c
	.4byte	.LLST8
	.byte	0x9
	.4byte	.LVL16
	.4byte	0x32a
	.byte	0x9
	.4byte	.LVL17
	.4byte	0x336
	.byte	0xd
	.4byte	.LVL20
	.4byte	0x342
	.4byte	0x15a
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0x9
	.4byte	.LVL21
	.4byte	0x34f
	.byte	0x9
	.4byte	.LVL22
	.4byte	0x35b
	.byte	0x9
	.4byte	.LVL23
	.4byte	0x367
	.byte	0xd
	.4byte	.LVL26
	.4byte	0x342
	.4byte	0x18c
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0x9
	.4byte	.LVL27
	.4byte	0x373
	.byte	0
	.byte	0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0xaf
	.byte	0x6
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0x20b
	.byte	0xf
	.string	"ops"
	.byte	0x1
	.byte	0xaf
	.byte	0x1f
	.4byte	0x5d
	.4byte	.LLST3
	.byte	0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0xaf
	.byte	0x2a
	.4byte	0x7e
	.4byte	.LLST4
	.byte	0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0xaf
	.byte	0x34
	.4byte	0x5d
	.4byte	.LLST5
	.byte	0x10
	.4byte	.LVL11
	.4byte	0x37f
	.4byte	0x1f8
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x11
	.4byte	.LVL12
	.4byte	0x38b
	.byte	0x11
	.4byte	.LVL14
	.4byte	0x397
	.byte	0
	.byte	0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0xa3
	.byte	0xb
	.4byte	0x64
	.byte	0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x99
	.byte	0x6
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.byte	0x1
	.byte	0x9c
	.4byte	0x237
	.byte	0x11
	.4byte	.LVL7
	.4byte	0x3a3
	.byte	0
	.byte	0xa
	.4byte	.LASF23
	.byte	0x1
	.byte	0x8f
	.byte	0x6
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.byte	0x1
	.byte	0x9c
	.4byte	0x257
	.byte	0x11
	.4byte	.LVL6
	.4byte	0x3af
	.byte	0
	.byte	0xa
	.4byte	.LASF24
	.byte	0x1
	.byte	0x82
	.byte	0x6
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x2b6
	.byte	0xf
	.string	"ops"
	.byte	0x1
	.byte	0x82
	.byte	0x1f
	.4byte	0x5d
	.4byte	.LLST0
	.byte	0xb
	.4byte	.LASF20
	.byte	0x1
	.byte	0x82
	.byte	0x2a
	.4byte	0x7e
	.4byte	.LLST1
	.byte	0xb
	.4byte	.LASF21
	.byte	0x1
	.byte	0x82
	.byte	0x34
	.4byte	0x5d
	.4byte	.LLST2
	.byte	0x13
	.4byte	.LVL5
	.4byte	0x3bb
	.byte	0xe
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0xe
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0
	.byte	0x14
	.4byte	.LASF50
	.byte	0x1
	.byte	0x77
	.byte	0xb
	.4byte	0x64
	.byte	0x1
	.byte	0xa
	.4byte	.LASF25
	.byte	0x1
	.byte	0x6d
	.byte	0x6
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e3
	.byte	0x11
	.4byte	.LVL1
	.4byte	0x3c7
	.byte	0
	.byte	0xa
	.4byte	.LASF26
	.byte	0x1
	.byte	0x63
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0x303
	.byte	0x11
	.4byte	.LVL0
	.4byte	0x3d3
	.byte	0
	.byte	0x15
	.4byte	0x2b6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.byte	0x16
	.4byte	.LASF27
	.4byte	.LASF27
	.byte	0x5
	.byte	0x3c
	.byte	0xc
	.byte	0x16
	.4byte	.LASF28
	.4byte	.LASF28
	.byte	0x5
	.byte	0x4b
	.byte	0xc
	.byte	0x16
	.4byte	.LASF29
	.4byte	.LASF29
	.byte	0x5
	.byte	0x3e
	.byte	0xb
	.byte	0x16
	.4byte	.LASF30
	.4byte	.LASF30
	.byte	0x5
	.byte	0x3f
	.byte	0xb
	.byte	0x17
	.4byte	.LASF31
	.4byte	.LASF31
	.byte	0x6
	.2byte	0x1d7
	.byte	0x6
	.byte	0x16
	.4byte	.LASF32
	.4byte	.LASF32
	.byte	0x5
	.byte	0x40
	.byte	0xc
	.byte	0x16
	.4byte	.LASF33
	.4byte	.LASF33
	.byte	0x5
	.byte	0x4d
	.byte	0xb
	.byte	0x16
	.4byte	.LASF34
	.4byte	.LASF34
	.byte	0x5
	.byte	0x4f
	.byte	0xb
	.byte	0x16
	.4byte	.LASF35
	.4byte	.LASF35
	.byte	0x5
	.byte	0x4e
	.byte	0xc
	.byte	0x16
	.4byte	.LASF36
	.4byte	.LASF36
	.byte	0x5
	.byte	0x46
	.byte	0xc
	.byte	0x16
	.4byte	.LASF37
	.4byte	.LASF37
	.byte	0x5
	.byte	0x45
	.byte	0xc
	.byte	0x16
	.4byte	.LASF38
	.4byte	.LASF38
	.byte	0x5
	.byte	0x44
	.byte	0xc
	.byte	0x16
	.4byte	.LASF39
	.4byte	.LASF39
	.byte	0x5
	.byte	0x42
	.byte	0xc
	.byte	0x16
	.4byte	.LASF40
	.4byte	.LASF40
	.byte	0x5
	.byte	0x41
	.byte	0xc
	.byte	0x16
	.4byte	.LASF41
	.4byte	.LASF41
	.byte	0x5
	.byte	0x38
	.byte	0xc
	.byte	0x16
	.4byte	.LASF42
	.4byte	.LASF42
	.byte	0x5
	.byte	0x36
	.byte	0xc
	.byte	0x16
	.4byte	.LASF43
	.4byte	.LASF43
	.byte	0x5
	.byte	0x35
	.byte	0xc
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
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
	.byte	0x7
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
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
	.byte	0x9
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
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
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
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
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST6:
	.4byte	.LVL15
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL16-1
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL15
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL16-1
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL18
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL19
	.4byte	.LVL20-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL25
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL9
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL11-1
	.4byte	.LVL11
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL12-1
	.4byte	.LVL12
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL13
	.4byte	.LFE40
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL10
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11-1
	.4byte	.LVL11
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12-1
	.4byte	.LVL12
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL14-1
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE40
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL11-1
	.4byte	.LVL11
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL12-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL12-1
	.4byte	.LVL12
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL14-1
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE40
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LFE36
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL4
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL5-1
	.4byte	.LVL5
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LFE36
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL5-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL5-1
	.4byte	.LVL5
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LFE36
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x5c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB37
	.4byte	.LFE37
	.4byte	.LFB38
	.4byte	.LFE38
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF26:
	.string	"rt_hw_cpu_icache_enable"
.LASF40:
	.string	"HAL_DCACHE_Enable"
.LASF27:
	.string	"HAL_ICACHE_EnableInt"
.LASF18:
	.string	"cache_dump_ahb_error"
.LASF33:
	.string	"HAL_DCACHE_GetInt"
.LASF38:
	.string	"HAL_DCACHE_InvalidateByRange"
.LASF28:
	.string	"HAL_DCACHE_EnableInt"
.LASF39:
	.string	"HAL_DCACHE_Disable"
.LASF5:
	.string	"short unsigned int"
.LASF46:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF41:
	.string	"HAL_ICACHE_InvalidateByRange"
.LASF45:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_cache.c"
.LASF7:
	.string	"long long unsigned int"
.LASF30:
	.string	"HAL_ICACHE_GetErrAddr"
.LASF4:
	.string	"unsigned char"
.LASF36:
	.string	"HAL_DCACHE_CleanInvalidateByRange"
.LASF6:
	.string	"long unsigned int"
.LASF20:
	.string	"addr"
.LASF37:
	.string	"HAL_DCACHE_CleanByRange"
.LASF43:
	.string	"HAL_ICACHE_Enable"
.LASF14:
	.string	"RT_HW_CACHE_INVALIDATE"
.LASF16:
	.string	"fault_handler_lr"
.LASF29:
	.string	"HAL_ICACHE_GetInt"
.LASF17:
	.string	"fault_handler_sp"
.LASF11:
	.string	"__uint32_t"
.LASF10:
	.string	"rt_base_t"
.LASF23:
	.string	"rt_hw_cpu_dcache_enable"
.LASF49:
	.string	"rt_hw_cpu_dcache_status"
.LASF8:
	.string	"unsigned int"
.LASF31:
	.string	"rt_kprintf"
.LASF9:
	.string	"char"
.LASF19:
	.string	"rt_hw_cpu_dcache_ops"
.LASF25:
	.string	"rt_hw_cpu_icache_disable"
.LASF3:
	.string	"long long int"
.LASF32:
	.string	"HAL_ICACHE_ClearInt"
.LASF35:
	.string	"HAL_DCACHE_ClearInt"
.LASF48:
	.string	"rt_hw_cpu_cache_init"
.LASF13:
	.string	"RT_HW_CACHE_FLUSH"
.LASF1:
	.string	"short int"
.LASF42:
	.string	"HAL_ICACHE_Disable"
.LASF44:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF12:
	.string	"uint32_t"
.LASF2:
	.string	"long int"
.LASF22:
	.string	"rt_hw_cpu_dcache_disable"
.LASF50:
	.string	"rt_hw_cpu_icache_status"
.LASF0:
	.string	"signed char"
.LASF24:
	.string	"rt_hw_cpu_icache_ops"
.LASF47:
	.string	"RT_HW_CACHE_OPS"
.LASF21:
	.string	"size"
.LASF15:
	.string	"_Bool"
.LASF34:
	.string	"HAL_DCACHE_GetErrAddr"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
