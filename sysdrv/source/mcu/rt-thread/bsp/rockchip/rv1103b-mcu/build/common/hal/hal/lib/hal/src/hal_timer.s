	.file	"hal_timer.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_TIMER_Init,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_Init
	.type	HAL_TIMER_Init, @function
HAL_TIMER_Init:
.LFB18:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_timer.c"
	.loc 1 69 1
	.cfi_startproc
.LVL0:
	.loc 1 70 5
	.loc 1 72 5
	.loc 1 72 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L3
	.loc 1 77 5 is_stmt 1
	.loc 1 77 58 is_stmt 0
	slli	a1,a1,1
.LVL1:
	.loc 1 77 50
	sw	a1,16(a0)
	.loc 1 79 5 is_stmt 1
	.loc 1 79 12 is_stmt 0
	li	a0,0
.LVL2:
	ret
.LVL3:
.L3:
	.loc 1 73 16
	li	a0,-16
.LVL4:
	.loc 1 80 1
	ret
	.cfi_endproc
.LFE18:
	.size	HAL_TIMER_Init, .-HAL_TIMER_Init
	.section	.text.HAL_TIMER_SysTimerInit,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_SysTimerInit
	.type	HAL_TIMER_SysTimerInit, @function
HAL_TIMER_SysTimerInit:
.LFB19:
	.loc 1 88 1 is_stmt 1
	.cfi_startproc
.LVL5:
	.loc 1 89 5
	.loc 1 91 5
	.loc 1 91 11 is_stmt 0
	lw	a5,16(a0)
	.loc 1 91 60
	andi	a5,a5,1
	.loc 1 91 8
	bne	a5,zero,.L5
	.loc 1 95 5 is_stmt 1
	.loc 1 95 50 is_stmt 0
	sw	zero,16(a0)
	.loc 1 96 5 is_stmt 1
	.loc 1 96 25 is_stmt 0
	li	a5,-1
	sw	a5,0(a0)
	.loc 1 97 5 is_stmt 1
	.loc 1 97 25 is_stmt 0
	sw	a5,4(a0)
	.loc 1 98 5 is_stmt 1
	.loc 1 98 50 is_stmt 0
	lw	a5,16(a0)
	andi	a5,a5,-5
	sw	a5,16(a0)
	.loc 1 99 5 is_stmt 1
	.loc 1 99 50 is_stmt 0
	lw	a5,16(a0)
	ori	a5,a5,1
	sw	a5,16(a0)
	.loc 1 101 5 is_stmt 1
.L5:
	.loc 1 102 1 is_stmt 0
	li	a0,0
.LVL6:
	ret
	.cfi_endproc
.LFE19:
	.size	HAL_TIMER_SysTimerInit, .-HAL_TIMER_SysTimerInit
	.section	.text.HAL_TIMER_DeInit,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_DeInit
	.type	HAL_TIMER_DeInit, @function
HAL_TIMER_DeInit:
.LFB20:
	.loc 1 110 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 111 5
	.loc 1 113 5
	.loc 1 113 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L8
	.loc 1 118 5 is_stmt 1
	.loc 1 118 50 is_stmt 0
	sw	zero,16(a0)
	.loc 1 120 5 is_stmt 1
	.loc 1 120 12 is_stmt 0
	li	a0,0
.LVL8:
	ret
.LVL9:
.L8:
	.loc 1 114 16
	li	a0,-16
.LVL10:
	.loc 1 121 1
	ret
	.cfi_endproc
.LFE20:
	.size	HAL_TIMER_DeInit, .-HAL_TIMER_DeInit
	.section	.text.HAL_TIMER_Start,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_Start
	.type	HAL_TIMER_Start, @function
HAL_TIMER_Start:
.LFB21:
	.loc 1 135 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 136 5
	.loc 1 138 5
	.loc 1 138 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L11
	.loc 1 143 5 is_stmt 1
	.loc 1 143 50 is_stmt 0
	lw	a5,16(a0)
	andi	a5,a5,-5
	sw	a5,16(a0)
	.loc 1 144 5 is_stmt 1
	.loc 1 144 50 is_stmt 0
	lw	a5,16(a0)
	ori	a5,a5,1
	sw	a5,16(a0)
	.loc 1 146 5 is_stmt 1
	.loc 1 146 12 is_stmt 0
	li	a0,0
.LVL12:
	ret
.LVL13:
.L11:
	.loc 1 139 16
	li	a0,-16
.LVL14:
	.loc 1 147 1
	ret
	.cfi_endproc
.LFE21:
	.size	HAL_TIMER_Start, .-HAL_TIMER_Start
	.section	.text.HAL_TIMER_Stop,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_Stop
	.type	HAL_TIMER_Stop, @function
HAL_TIMER_Stop:
.LFB22:
	.loc 1 156 1 is_stmt 1
	.cfi_startproc
.LVL15:
	.loc 1 157 5
	.loc 1 159 5
	.loc 1 159 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L14
	.loc 1 164 5 is_stmt 1
	.loc 1 164 50 is_stmt 0
	lw	a5,16(a0)
	andi	a5,a5,-2
	sw	a5,16(a0)
	.loc 1 166 5 is_stmt 1
	.loc 1 166 12 is_stmt 0
	li	a0,0
.LVL16:
	ret
.LVL17:
.L14:
	.loc 1 160 16
	li	a0,-16
.LVL18:
	.loc 1 167 1
	ret
	.cfi_endproc
.LFE22:
	.size	HAL_TIMER_Stop, .-HAL_TIMER_Stop
	.section	.text.HAL_TIMER_Start_IT,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_Start_IT
	.type	HAL_TIMER_Start_IT, @function
HAL_TIMER_Start_IT:
.LFB23:
	.loc 1 175 1 is_stmt 1
	.cfi_startproc
.LVL19:
	.loc 1 176 5
	.loc 1 178 5
	.loc 1 178 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L17
	.loc 1 183 5 is_stmt 1
	.loc 1 183 50 is_stmt 0
	lw	a5,16(a0)
	ori	a5,a5,5
	sw	a5,16(a0)
	.loc 1 185 5 is_stmt 1
	.loc 1 185 12 is_stmt 0
	li	a0,0
.LVL20:
	ret
.LVL21:
.L17:
	.loc 1 179 16
	li	a0,-16
.LVL22:
	.loc 1 186 1
	ret
	.cfi_endproc
.LFE23:
	.size	HAL_TIMER_Start_IT, .-HAL_TIMER_Start_IT
	.section	.text.HAL_TIMER_Stop_IT,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_Stop_IT
	.type	HAL_TIMER_Stop_IT, @function
HAL_TIMER_Stop_IT:
.LFB31:
	.cfi_startproc
	tail	HAL_TIMER_Stop
	.cfi_endproc
.LFE31:
	.size	HAL_TIMER_Stop_IT, .-HAL_TIMER_Stop_IT
	.section	.text.HAL_TIMER_SetCount,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_SetCount
	.type	HAL_TIMER_SetCount, @function
HAL_TIMER_SetCount:
.LFB25:
	.loc 1 216 1 is_stmt 1
	.cfi_startproc
.LVL23:
	.loc 1 217 5
	.loc 1 219 5
	.loc 1 221 5
	.loc 1 221 8 is_stmt 0
	li	a5,545476608
	beq	a0,a5,.L21
	.loc 1 226 5 is_stmt 1
.LVL24:
	.loc 1 227 5
	.loc 1 227 25 is_stmt 0
	sw	a1,0(a0)
	.loc 1 228 5 is_stmt 1
	.loc 1 228 25 is_stmt 0
	sw	a2,4(a0)
	.loc 1 230 5 is_stmt 1
	.loc 1 230 12 is_stmt 0
	li	a0,0
.LVL25:
	ret
.LVL26:
.L21:
	.loc 1 222 16
	li	a0,-16
.LVL27:
	.loc 1 231 1
	ret
	.cfi_endproc
.LFE25:
	.size	HAL_TIMER_SetCount, .-HAL_TIMER_SetCount
	.section	.text.HAL_TIMER_GetCount,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_GetCount
	.type	HAL_TIMER_GetCount, @function
HAL_TIMER_GetCount:
.LFB26:
	.loc 1 240 1 is_stmt 1
	.cfi_startproc
.LVL28:
	mv	a5,a0
.LVL29:
.L23:
	.loc 1 241 5 discriminator 1
	.loc 1 243 5 discriminator 1
	.loc 1 245 5 discriminator 1
	.loc 1 246 9 discriminator 1
	.loc 1 246 14 is_stmt 0 discriminator 1
	lw	a1,12(a5)
.LVL30:
	.loc 1 247 9 is_stmt 1 discriminator 1
	.loc 1 247 13 is_stmt 0 discriminator 1
	lw	a0,8(a5)
.LVL31:
	.loc 1 248 9 is_stmt 1 discriminator 1
	.loc 1 248 14 is_stmt 0 discriminator 1
	lw	a4,12(a5)
.LVL32:
	.loc 1 249 13 is_stmt 1 discriminator 1
	.loc 1 249 5 is_stmt 0 discriminator 1
	bne	a1,a4,.L23
	.loc 1 251 5 is_stmt 1
	.loc 1 252 1 is_stmt 0
	ret
	.cfi_endproc
.LFE26:
	.size	HAL_TIMER_GetCount, .-HAL_TIMER_GetCount
	.section	.text.HAL_TIMER_ClrInt,"ax",@progbits
	.align	1
	.globl	HAL_TIMER_ClrInt
	.type	HAL_TIMER_ClrInt, @function
HAL_TIMER_ClrInt:
.LFB27:
	.loc 1 260 1 is_stmt 1
	.cfi_startproc
.LVL33:
	.loc 1 261 5
	.loc 1 263 5
	.loc 1 265 5
	.loc 1 265 21 is_stmt 0
	li	a5,1
	sw	a5,24(a0)
	.loc 1 266 5 is_stmt 1
	.loc 1 261 14 is_stmt 0
	li	a5,1000
.LVL34:
.L26:
	.loc 1 266 11 is_stmt 1
	.loc 1 266 16 is_stmt 0
	lw	a4,24(a0)
	.loc 1 266 11
	beq	a4,zero,.L27
	.loc 1 266 28 discriminator 1
	bne	a5,zero,.L28
	.loc 1 271 16
	li	a0,-110
.LVL35:
	ret
.LVL36:
.L28:
	.loc 1 267 9 is_stmt 1
	.loc 1 267 16 is_stmt 0
	addi	a5,a5,-1
.LVL37:
	j	.L26
.L27:
	.loc 1 270 5 is_stmt 1
	.loc 1 271 16 is_stmt 0
	li	a0,-110
.LVL38:
	.loc 1 270 8
	beq	a5,zero,.L25
	.loc 1 273 16
	li	a0,0
.L25:
	.loc 1 275 1
	ret
	.cfi_endproc
.LFE27:
	.size	HAL_TIMER_ClrInt, .-HAL_TIMER_ClrInt
	.section	.text.HAL_TIMER0_Handler,"ax",@progbits
	.align	1
	.weak	HAL_TIMER0_Handler
	.type	HAL_TIMER0_Handler, @function
HAL_TIMER0_Handler:
.LFB28:
	.loc 1 283 1 is_stmt 1
	.cfi_startproc
	.loc 1 284 5
	.loc 1 283 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 284 5
	li	a0,545456128
	.loc 1 283 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 284 5
	call	HAL_TIMER_ClrInt
.LVL39:
	.loc 1 286 5 is_stmt 1
	.loc 1 287 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE28:
	.size	HAL_TIMER0_Handler, .-HAL_TIMER0_Handler
	.section	.text.HAL_TIMER1_Handler,"ax",@progbits
	.align	1
	.weak	HAL_TIMER1_Handler
	.type	HAL_TIMER1_Handler, @function
HAL_TIMER1_Handler:
.LFB29:
	.loc 1 295 1 is_stmt 1
	.cfi_startproc
	.loc 1 296 5
	.loc 1 295 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 296 5
	li	a0,545460224
	.loc 1 295 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 296 5
	call	HAL_TIMER_ClrInt
.LVL40:
	.loc 1 298 5 is_stmt 1
	.loc 1 299 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE29:
	.size	HAL_TIMER1_Handler, .-HAL_TIMER1_Handler
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_timer.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x417
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF49
	.byte	0xc
	.4byte	.LASF50
	.4byte	.LASF51
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
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x54
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x69
	.byte	0x20
	.4byte	0x6e
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x48
	.byte	0x5
	.4byte	0x8a
	.byte	0x6
	.4byte	0x96
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x62
	.byte	0x7
	.4byte	0x96
	.4byte	0xbc
	.byte	0x8
	.4byte	0x7c
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	0xac
	.byte	0x9
	.4byte	.LASF52
	.byte	0x1c
	.byte	0x4
	.2byte	0x321
	.byte	0x8
	.4byte	0x116
	.byte	0xa
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x322
	.byte	0x17
	.4byte	0xbc
	.byte	0
	.byte	0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x323
	.byte	0x1d
	.4byte	0x12b
	.byte	0x8
	.byte	0xa
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x324
	.byte	0x17
	.4byte	0x96
	.byte	0x10
	.byte	0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x325
	.byte	0x13
	.4byte	0x8a
	.byte	0x14
	.byte	0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x326
	.byte	0x17
	.4byte	0x96
	.byte	0x18
	.byte	0
	.byte	0x7
	.4byte	0x9b
	.4byte	0x126
	.byte	0x8
	.4byte	0x7c
	.byte	0x1
	.byte	0
	.byte	0x6
	.4byte	0x116
	.byte	0x5
	.4byte	0x126
	.byte	0xb
	.byte	0x5
	.byte	0x4
	.4byte	0x75
	.byte	0x5
	.byte	0xae
	.byte	0xe
	.4byte	0x16a
	.byte	0xc
	.4byte	.LASF19
	.byte	0
	.byte	0xd
	.4byte	.LASF20
	.byte	0x7f
	.byte	0xd
	.4byte	.LASF21
	.byte	0x70
	.byte	0xd
	.4byte	.LASF22
	.byte	0x6d
	.byte	0xd
	.4byte	.LASF23
	.byte	0x6a
	.byte	0xd
	.4byte	.LASF24
	.byte	0x5a
	.byte	0xd
	.4byte	.LASF25
	.byte	0x92,0x7f
	.byte	0
	.byte	0x3
	.4byte	.LASF26
	.byte	0x5
	.byte	0xb6
	.byte	0x3
	.4byte	0x130
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF27
	.byte	0xb
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x6
	.byte	0x1d
	.byte	0xe
	.4byte	0x19e
	.byte	0xc
	.4byte	.LASF28
	.byte	0
	.byte	0xc
	.4byte	.LASF29
	.byte	0x1
	.byte	0xc
	.4byte	.LASF30
	.byte	0x2
	.byte	0
	.byte	0x3
	.4byte	.LASF31
	.byte	0x6
	.byte	0x21
	.byte	0x3
	.4byte	0x17d
	.byte	0xe
	.4byte	.LASF32
	.byte	0x1
	.2byte	0x126
	.byte	0x22
	.4byte	0x16a
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x1d9
	.byte	0xf
	.4byte	.LVL40
	.4byte	0x208
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20831000
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x11a
	.byte	0x22
	.4byte	0x16a
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x208
	.byte	0xf
	.4byte	.LVL39
	.4byte	0x208
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20830000
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF34
	.byte	0x1
	.2byte	0x103
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x246
	.byte	0x11
	.4byte	.LASF36
	.byte	0x1
	.2byte	0x103
	.byte	0x2f
	.4byte	0x246
	.4byte	.LLST10
	.byte	0x12
	.4byte	.LASF37
	.byte	0x1
	.2byte	0x105
	.byte	0xe
	.4byte	0x8a
	.4byte	.LLST11
	.byte	0
	.byte	0x13
	.byte	0x4
	.4byte	0xc1
	.byte	0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0xef
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x2a1
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xef
	.byte	0x2f
	.4byte	0x246
	.4byte	.LLST9
	.byte	0x16
	.4byte	.LASF38
	.byte	0x1
	.byte	0xf1
	.byte	0xe
	.4byte	0x8a
	.byte	0x1
	.byte	0x5b
	.byte	0x17
	.string	"low"
	.byte	0x1
	.byte	0xf1
	.byte	0x14
	.4byte	0x8a
	.byte	0x1
	.byte	0x5a
	.byte	0x16
	.4byte	.LASF39
	.byte	0x1
	.byte	0xf1
	.byte	0x19
	.4byte	0x8a
	.byte	0x1
	.byte	0x5e
	.byte	0
	.byte	0x14
	.4byte	.LASF40
	.byte	0x1
	.byte	0xd7
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ef
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xd7
	.byte	0x31
	.4byte	0x246
	.4byte	.LLST7
	.byte	0x18
	.4byte	.LASF41
	.byte	0x1
	.byte	0xd7
	.byte	0x40
	.4byte	0xa0
	.byte	0x6
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.byte	0x5c
	.byte	0x93
	.byte	0x4
	.byte	0x19
	.4byte	.LASF42
	.byte	0x1
	.byte	0xd9
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST8
	.byte	0
	.byte	0x1a
	.4byte	.LASF53
	.byte	0x1
	.byte	0xc2
	.byte	0xc
	.4byte	0x16a
	.4byte	0x30c
	.byte	0x1b
	.4byte	.LASF36
	.byte	0x1
	.byte	0xc2
	.byte	0x30
	.4byte	0x246
	.byte	0
	.byte	0x14
	.4byte	.LASF43
	.byte	0x1
	.byte	0xae
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x337
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0xae
	.byte	0x31
	.4byte	0x246
	.4byte	.LLST6
	.byte	0
	.byte	0x14
	.4byte	.LASF44
	.byte	0x1
	.byte	0x9b
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x362
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x9b
	.byte	0x2d
	.4byte	0x246
	.4byte	.LLST5
	.byte	0
	.byte	0x14
	.4byte	.LASF45
	.byte	0x1
	.byte	0x86
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x38d
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x86
	.byte	0x2e
	.4byte	0x246
	.4byte	.LLST4
	.byte	0
	.byte	0x14
	.4byte	.LASF46
	.byte	0x1
	.byte	0x6d
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b8
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x6d
	.byte	0x2f
	.4byte	0x246
	.4byte	.LLST3
	.byte	0
	.byte	0x14
	.4byte	.LASF47
	.byte	0x1
	.byte	0x57
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x3e3
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x57
	.byte	0x35
	.4byte	0x246
	.4byte	.LLST2
	.byte	0
	.byte	0x1c
	.4byte	.LASF54
	.byte	0x1
	.byte	0x44
	.byte	0xc
	.4byte	0x16a
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.byte	0x15
	.4byte	.LASF36
	.byte	0x1
	.byte	0x44
	.byte	0x2d
	.4byte	0x246
	.4byte	.LLST0
	.byte	0x15
	.4byte	.LASF48
	.byte	0x1
	.byte	0x44
	.byte	0x3f
	.4byte	0x19e
	.4byte	.LLST1
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
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0x5
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x4
	.byte	0x1
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
	.byte	0xc
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
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
	.byte	0xf
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST10:
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL35
	.4byte	.LVL36
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL36
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL38
	.4byte	.LFE27
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x4
	.byte	0xa
	.2byte	0x3e8
	.byte	0x9f
	.4byte	.LVL34
	.4byte	.LFE27
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL29
	.4byte	.LFE26
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL23
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL27
	.4byte	.LFE25
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x6
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.byte	0x5c
	.byte	0x93
	.byte	0x4
	.4byte	.LVL26
	.4byte	.LFE25
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.8byte	0
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL22
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL14
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LFE20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL6
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL4
	.4byte	.LFE18
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
	.4byte	.LVL3
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL3
	.4byte	.LFE18
	.2byte	0x1
	.byte	0x5b
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"long long int"
.LASF50:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_timer.c"
.LASF46:
	.string	"HAL_TIMER_DeInit"
.LASF47:
	.string	"HAL_TIMER_SysTimerInit"
.LASF38:
	.string	"high"
.LASF43:
	.string	"HAL_TIMER_Start_IT"
.LASF53:
	.string	"HAL_TIMER_Stop_IT"
.LASF33:
	.string	"HAL_TIMER0_Handler"
.LASF17:
	.string	"RESERVED0014"
.LASF2:
	.string	"short int"
.LASF19:
	.string	"HAL_OK"
.LASF13:
	.string	"uint64_t"
.LASF23:
	.string	"HAL_INVAL"
.LASF42:
	.string	"loadCount"
.LASF36:
	.string	"pReg"
.LASF54:
	.string	"HAL_TIMER_Init"
.LASF1:
	.string	"unsigned char"
.LASF24:
	.string	"HAL_NOSYS"
.LASF16:
	.string	"CONTROLREG"
.LASF39:
	.string	"temp"
.LASF3:
	.string	"short unsigned int"
.LASF4:
	.string	"long int"
.LASF25:
	.string	"HAL_TIMEOUT"
.LASF5:
	.string	"long unsigned int"
.LASF7:
	.string	"__uint32_t"
.LASF41:
	.string	"timerCount"
.LASF32:
	.string	"HAL_TIMER1_Handler"
.LASF28:
	.string	"TIMER_FREE_RUNNING"
.LASF10:
	.string	"unsigned int"
.LASF44:
	.string	"HAL_TIMER_Stop"
.LASF22:
	.string	"HAL_NODEV"
.LASF48:
	.string	"mode"
.LASF29:
	.string	"TIMER_USER_DEFINED"
.LASF37:
	.string	"timeOut"
.LASF40:
	.string	"HAL_TIMER_SetCount"
.LASF31:
	.string	"eTIMER_MODE"
.LASF26:
	.string	"HAL_Status"
.LASF52:
	.string	"TIMER_REG"
.LASF11:
	.string	"char"
.LASF14:
	.string	"LOAD_COUNT"
.LASF34:
	.string	"HAL_TIMER_ClrInt"
.LASF18:
	.string	"INTSTATUS"
.LASF20:
	.string	"HAL_ERROR"
.LASF8:
	.string	"__uint64_t"
.LASF49:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF12:
	.string	"uint32_t"
.LASF21:
	.string	"HAL_BUSY"
.LASF30:
	.string	"TIMER_MODE_MAX"
.LASF45:
	.string	"HAL_TIMER_Start"
.LASF0:
	.string	"signed char"
.LASF51:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF15:
	.string	"CURRENT_VALUE"
.LASF27:
	.string	"_Bool"
.LASF9:
	.string	"long long unsigned int"
.LASF35:
	.string	"HAL_TIMER_GetCount"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
