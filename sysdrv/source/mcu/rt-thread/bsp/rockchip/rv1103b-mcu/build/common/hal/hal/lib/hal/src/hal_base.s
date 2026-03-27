	.file	"hal_base.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_Init,"ax",@progbits
	.align	1
	.globl	HAL_Init
	.type	HAL_Init, @function
HAL_Init:
.LFB20:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base.c"
	.loc 1 163 1
	.cfi_startproc
	.loc 1 175 5
	.loc 1 163 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 175 5
	li	a0,545476608
	.loc 1 163 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 175 5
	call	HAL_TIMER_SysTimerInit
.LVL0:
	.loc 1 179 5 is_stmt 1
	call	HAL_PINCTRL_Init
.LVL1:
	.loc 1 182 5
	.loc 1 183 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE20:
	.size	HAL_Init, .-HAL_Init
	.section	.text.HAL_SystemCoreClockUpdate,"ax",@progbits
	.align	1
	.globl	HAL_SystemCoreClockUpdate
	.type	HAL_SystemCoreClockUpdate, @function
HAL_SystemCoreClockUpdate:
.LFB21:
	.loc 1 192 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 193 5
	.loc 1 194 5
	.loc 1 205 5
	.loc 1 206 9
	.loc 1 206 25 is_stmt 0
	sw	a0,SystemCoreClock,a5
	.loc 1 209 5 is_stmt 1
	.loc 1 210 1 is_stmt 0
	li	a0,0
.LVL3:
	ret
	.cfi_endproc
.LFE21:
	.size	HAL_SystemCoreClockUpdate, .-HAL_SystemCoreClockUpdate
	.section	.text.HAL_DeInit,"ax",@progbits
	.align	1
	.globl	HAL_DeInit
	.type	HAL_DeInit, @function
HAL_DeInit:
.LFB22:
	.loc 1 217 1 is_stmt 1
	.cfi_startproc
	.loc 1 220 5
	.loc 1 221 1 is_stmt 0
	li	a0,0
	ret
	.cfi_endproc
.LFE22:
	.size	HAL_DeInit, .-HAL_DeInit
	.section	.text.HAL_IncTick,"ax",@progbits
	.align	1
	.globl	HAL_IncTick
	.type	HAL_IncTick, @function
HAL_IncTick:
.LFB23:
	.loc 1 234 1 is_stmt 1
	.cfi_startproc
	.loc 1 235 5
	.loc 1 235 12 is_stmt 0
	lla	a4,.LANCHOR0
	lw	a5,0(a4)
	lw	a3,.LANCHOR1
	.loc 1 238 1
	li	a0,0
	.loc 1 235 12
	add	a5,a5,a3
	sw	a5,0(a4)
	.loc 1 237 5 is_stmt 1
	.loc 1 238 1 is_stmt 0
	ret
	.cfi_endproc
.LFE23:
	.size	HAL_IncTick, .-HAL_IncTick
	.section	.text.HAL_GetTick,"ax",@progbits
	.align	1
	.globl	HAL_GetTick
	.type	HAL_GetTick, @function
HAL_GetTick:
.LFB24:
	.loc 1 246 1 is_stmt 1
	.cfi_startproc
	.loc 1 248 5
	.loc 1 246 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 248 21
	li	a0,545476608
	.loc 1 246 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 248 21
	call	HAL_TIMER_GetCount
.LVL4:
	.loc 1 249 5 is_stmt 1
	.loc 1 251 5
	.loc 1 251 14 is_stmt 0
	srli	a5,a1,30
	.loc 1 251 8
	beq	a5,zero,.L7
	.loc 1 252 9 is_stmt 1
	.loc 1 252 14 is_stmt 0
	not	a0,a0
.LVL5:
	not	a1,a1
.LVL6:
.L7:
	.loc 1 255 5 is_stmt 1
.LBB6:
.LBB7:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_base.h"
	.loc 2 89 5
	.loc 2 89 12 is_stmt 0
	li	a2,24576
	li	a3,0
	addi	a2,a2,-576
	call	HAL_DivU64Rem
.LVL7:
.LBE7:
.LBE6:
	.loc 1 260 1
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	HAL_GetTick, .-HAL_GetTick
	.section	.text.HAL_GetSysTimerCount,"ax",@progbits
	.align	1
	.globl	HAL_GetSysTimerCount
	.type	HAL_GetSysTimerCount, @function
HAL_GetSysTimerCount:
.LFB25:
	.loc 1 268 1 is_stmt 1
	.cfi_startproc
	.loc 1 270 5
	.loc 1 268 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 270 22
	li	a0,545476608
	.loc 1 268 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 270 22
	call	HAL_TIMER_GetCount
.LVL8:
	.loc 1 271 5 is_stmt 1
	.loc 1 271 15 is_stmt 0
	srli	a5,a1,30
	.loc 1 271 8
	beq	a5,zero,.L13
	.loc 1 272 9 is_stmt 1
	.loc 1 272 15 is_stmt 0
	not	a0,a0
.LVL9:
	not	a1,a1
.LVL10:
	.loc 1 275 5 is_stmt 1
.L13:
	.loc 1 280 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE25:
	.size	HAL_GetSysTimerCount, .-HAL_GetSysTimerCount
	.section	.text.HAL_SetTickFreq,"ax",@progbits
	.align	1
	.globl	HAL_SetTickFreq
	.type	HAL_SetTickFreq, @function
HAL_SetTickFreq:
.LFB26:
	.loc 1 287 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 288 5
	.loc 1 290 5
	.loc 1 290 16 is_stmt 0
	sw	a0,.LANCHOR1,a5
	.loc 1 292 5 is_stmt 1
	.loc 1 293 1 is_stmt 0
	li	a0,0
.LVL12:
	ret
	.cfi_endproc
.LFE26:
	.size	HAL_SetTickFreq, .-HAL_SetTickFreq
	.section	.text.HAL_GetTickFreq,"ax",@progbits
	.align	1
	.globl	HAL_GetTickFreq
	.type	HAL_GetTickFreq, @function
HAL_GetTickFreq:
.LFB27:
	.loc 1 301 1 is_stmt 1
	.cfi_startproc
	.loc 1 302 5
	.loc 1 303 1 is_stmt 0
	lw	a0,.LANCHOR1
	ret
	.cfi_endproc
.LFE27:
	.size	HAL_GetTickFreq, .-HAL_GetTickFreq
	.section	.text.HAL_DelayUs,"ax",@progbits
	.align	1
	.globl	HAL_DelayUs
	.type	HAL_DelayUs, @function
HAL_DelayUs:
.LFB29:
	.loc 1 330 1 is_stmt 1
	.cfi_startproc
.LVL13:
	.loc 1 333 5
	.loc 1 330 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s2,16(sp)
	.cfi_offset 18, -16
	mv	s2,a0
.LVL14:
.LBB8:
.LBB9:
	.loc 1 135 5 is_stmt 1
	.loc 1 137 5
	.loc 1 137 12 is_stmt 0
	li	a0,545476608
.LVL15:
.LBE9:
.LBE8:
	.loc 1 330 1
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 1, -4
.LBB12:
.LBB10:
	.loc 1 137 12
	call	HAL_TIMER_GetCount
.LVL16:
	mv	s0,a0
	.loc 1 138 42
	li	a0,24
	mul	s2,s2,a0
.LVL17:
	.loc 1 137 12
	mv	s1,a1
.LVL18:
	.loc 1 138 5 is_stmt 1
	.loc 1 138 11 is_stmt 0
	li	s3,0
.LVL19:
.L26:
	.loc 1 140 5 is_stmt 1
	.loc 1 141 9
	.loc 1 141 15 is_stmt 0
	li	a0,545476608
	call	HAL_TIMER_GetCount
.LVL20:
	.loc 1 142 9 is_stmt 1
	.loc 1 142 40 is_stmt 0
	bgtu	a1,s1,.L28
	bne	a1,s1,.L23
	bleu	a0,s0,.L23
.L28:
	sub	a4,a0,s0
	sgtu	a3,a4,a0
	sub	a5,a1,s1
	sub	a5,a5,a3
.LVL21:
.L31:
	.loc 1 143 5
	bne	s3,a5,.L29
	bgtu	s2,a4,.L26
.L29:
	.loc 1 145 5 is_stmt 1
.LVL22:
.LBE10:
.LBE12:
	.loc 1 338 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	li	a0,0
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL23:
.L23:
	.cfi_restore_state
.LBB13:
.LBB11:
	.loc 1 142 40
	sub	a4,s0,a0
	sgtu	a0,a4,s0
.LVL24:
	sub	a5,s1,a1
	sub	a5,a5,a0
.LVL25:
	.loc 1 143 13 is_stmt 1
	j	.L31
.LBE11:
.LBE13:
	.cfi_endproc
.LFE29:
	.size	HAL_DelayUs, .-HAL_DelayUs
	.section	.text.HAL_DelayMs,"ax",@progbits
	.align	1
	.weak	HAL_DelayMs
	.type	HAL_DelayMs, @function
HAL_DelayMs:
.LFB28:
	.loc 1 314 1
	.cfi_startproc
.LVL26:
	.loc 1 315 5
.LBB14:
	.loc 1 315 10
.LBE14:
	.loc 1 314 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 314 1
	mv	s0,a0
.LBB15:
	.loc 1 315 19
	li	s1,0
.LVL27:
.L34:
	.loc 1 315 26 is_stmt 1 discriminator 1
	.loc 1 315 5 is_stmt 0 discriminator 1
	bne	s1,s0,.L35
.LBE15:
	.loc 1 319 5 is_stmt 1
	.loc 1 320 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL28:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL29:
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL30:
.L35:
	.cfi_restore_state
.LBB16:
	.loc 1 316 9 is_stmt 1 discriminator 3
	li	a0,1000
	call	HAL_DelayUs
.LVL31:
	.loc 1 315 34 discriminator 3
	.loc 1 315 35 is_stmt 0 discriminator 3
	addi	s1,s1,1
.LVL32:
	j	.L34
.LBE16:
	.cfi_endproc
.LFE28:
	.size	HAL_DelayMs, .-HAL_DelayMs
	.section	.text.HAL_CPUDelayUs,"ax",@progbits
	.align	1
	.globl	HAL_CPUDelayUs
	.type	HAL_CPUDelayUs, @function
HAL_CPUDelayUs:
.LFB30:
	.loc 1 352 1 is_stmt 1
	.cfi_startproc
.LVL33:
	.loc 1 353 5
	.loc 1 356 5
.LBB21:
.LBB22:
	.loc 2 89 5
.LBE22:
.LBE21:
	.loc 1 352 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
.LBB27:
.LBB23:
	.loc 2 89 12
	li	a2,999424
.LBE23:
.LBE27:
	.loc 1 352 1
	sw	s0,24(sp)
.LBB28:
.LBB24:
	.loc 2 89 12
	li	a3,0
	.cfi_offset 8, -8
.LBE24:
.LBE28:
	.loc 1 352 1
	mv	s0,a0
.LBB29:
.LBB25:
	.loc 2 89 12
	addi	a2,a2,576
	lw	a0,SystemCoreClock
.LVL34:
	li	a1,0
.LBE25:
.LBE29:
	.loc 1 352 1
	sw	ra,28(sp)
	.cfi_offset 1, -4
.LBB30:
.LBB26:
	.loc 2 89 12
	call	HAL_DivU64Rem
.LVL35:
.LBE26:
.LBE30:
	.loc 1 356 71
	mul	s0,s0,a0
.LVL36:
	.loc 1 356 12
	sw	s0,12(sp)
	.loc 1 361 5 is_stmt 1
	lw	a5,12(sp)
.LVL37:
.LBB31:
.LBB32:
	.loc 1 98 5
	.loc 1 100 5
	.loc 1 98 12 is_stmt 0
	srli	a5,a5,2
.LVL38:
	.loc 1 100 5
 #APP
# 100 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base.c" 1
	mv   a0, a5
	addi a0, a0, 2
	li   a1, 2
	bnez a0, 1f
	j    2f
	.align 6
	1:
	addi a0, a0, 1
	sub  a0, a0, a1
	bnez a0, 1b
	nop
	2:
# 0 "" 2
.LVL39:
 #NO_APP
.LBE32:
.LBE31:
	.loc 1 363 5 is_stmt 1
	.loc 1 364 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	li	a0,0
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE30:
	.size	HAL_CPUDelayUs, .-HAL_CPUDelayUs
	.section	.text.HAL_CPU_EnterIdle,"ax",@progbits
	.align	1
	.globl	HAL_CPU_EnterIdle
	.type	HAL_CPU_EnterIdle, @function
HAL_CPU_EnterIdle:
.LFB31:
	.loc 1 403 1 is_stmt 1
	.cfi_startproc
	.loc 1 411 5
 #APP
# 411 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base.c" 1
	wfi
# 0 "" 2
	.loc 1 418 1 is_stmt 0
 #NO_APP
	ret
	.cfi_endproc
.LFE31:
	.size	HAL_CPU_EnterIdle, .-HAL_CPU_EnterIdle
	.section	.sbss.uwTick,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	uwTick, @object
	.size	uwTick, 4
uwTick:
	.zero	4
	.section	.sdata.uwTickFreq,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	uwTickFreq, @object
	.size	uwTickFreq, 4
uwTickFreq:
	.word	1
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_timer.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/system_rv1103b.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6dd
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF89
	.byte	0xc
	.4byte	.LASF90
	.4byte	.LASF91
	.4byte	.Ldebug_ranges0+0x70
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
	.byte	0x3
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
	.byte	0x3
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
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x48
	.byte	0x5
	.4byte	0x8a
	.byte	0x6
	.4byte	0x96
	.byte	0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x3c
	.byte	0x14
	.4byte	0x62
	.byte	0x7
	.4byte	.LASF92
	.byte	0xb
	.byte	0xd
	.byte	0x11
	.4byte	0x8a
	.byte	0x8
	.4byte	0x96
	.4byte	0xc8
	.byte	0x9
	.4byte	0x7c
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	0xb8
	.byte	0xa
	.4byte	.LASF93
	.byte	0x1c
	.byte	0x5
	.2byte	0x321
	.byte	0x8
	.4byte	0x122
	.byte	0xb
	.4byte	.LASF14
	.byte	0x5
	.2byte	0x322
	.byte	0x17
	.4byte	0xc8
	.byte	0
	.byte	0xb
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x323
	.byte	0x1d
	.4byte	0x137
	.byte	0x8
	.byte	0xb
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x324
	.byte	0x17
	.4byte	0x96
	.byte	0x10
	.byte	0xb
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x325
	.byte	0x13
	.4byte	0x8a
	.byte	0x14
	.byte	0xb
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x326
	.byte	0x17
	.4byte	0x96
	.byte	0x18
	.byte	0
	.byte	0x8
	.4byte	0x9b
	.4byte	0x132
	.byte	0x9
	.4byte	0x7c
	.byte	0x1
	.byte	0
	.byte	0x6
	.4byte	0x122
	.byte	0x5
	.4byte	0x132
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x6
	.byte	0x9e
	.byte	0xe
	.4byte	0x157
	.byte	0xd
	.4byte	.LASF19
	.byte	0
	.byte	0xd
	.4byte	.LASF20
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF21
	.byte	0x6
	.byte	0xa1
	.byte	0x3
	.4byte	0x13c
	.byte	0xc
	.byte	0x5
	.byte	0x4
	.4byte	0x75
	.byte	0x6
	.byte	0xae
	.byte	0xe
	.4byte	0x19d
	.byte	0xd
	.4byte	.LASF22
	.byte	0
	.byte	0xe
	.4byte	.LASF23
	.byte	0x7f
	.byte	0xe
	.4byte	.LASF24
	.byte	0x70
	.byte	0xe
	.4byte	.LASF25
	.byte	0x6d
	.byte	0xe
	.4byte	.LASF26
	.byte	0x6a
	.byte	0xe
	.4byte	.LASF27
	.byte	0x5a
	.byte	0xe
	.4byte	.LASF28
	.byte	0x92,0x7f
	.byte	0
	.byte	0x3
	.4byte	.LASF29
	.byte	0x6
	.byte	0xb6
	.byte	0x3
	.4byte	0x163
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x7
	.byte	0x2e
	.byte	0x6
	.4byte	0x1fa
	.byte	0xd
	.4byte	.LASF30
	.byte	0
	.byte	0xd
	.4byte	.LASF31
	.byte	0x1
	.byte	0xd
	.4byte	.LASF32
	.byte	0x2
	.byte	0xd
	.4byte	.LASF33
	.byte	0x3
	.byte	0xd
	.4byte	.LASF34
	.byte	0x4
	.byte	0xd
	.4byte	.LASF35
	.byte	0x5
	.byte	0xd
	.4byte	.LASF36
	.byte	0x6
	.byte	0xd
	.4byte	.LASF37
	.byte	0x7
	.byte	0xd
	.4byte	.LASF38
	.byte	0x8
	.byte	0xd
	.4byte	.LASF39
	.byte	0x9
	.byte	0xd
	.4byte	.LASF40
	.byte	0xa
	.byte	0
	.byte	0xf
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x8
	.2byte	0x42b
	.byte	0xe
	.4byte	0x22e
	.byte	0xd
	.4byte	.LASF41
	.byte	0
	.byte	0xd
	.4byte	.LASF42
	.byte	0x1
	.byte	0xd
	.4byte	.LASF43
	.byte	0x2
	.byte	0xd
	.4byte	.LASF44
	.byte	0x3
	.byte	0xd
	.4byte	.LASF45
	.byte	0x4
	.byte	0xd
	.4byte	.LASF46
	.byte	0x5
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF47
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x9
	.byte	0x35
	.byte	0xe
	.4byte	0x268
	.byte	0xd
	.4byte	.LASF48
	.byte	0
	.byte	0xd
	.4byte	.LASF49
	.byte	0x1
	.byte	0xd
	.4byte	.LASF50
	.byte	0x2
	.byte	0xd
	.4byte	.LASF51
	.byte	0x3
	.byte	0xd
	.4byte	.LASF52
	.byte	0x4
	.byte	0xd
	.4byte	.LASF53
	.byte	0x5
	.byte	0
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x7c
	.byte	0x2
	.byte	0x27
	.byte	0xe
	.4byte	0x28f
	.byte	0xd
	.4byte	.LASF54
	.byte	0x64
	.byte	0xd
	.4byte	.LASF55
	.byte	0xa
	.byte	0xd
	.4byte	.LASF56
	.byte	0x1
	.byte	0xd
	.4byte	.LASF57
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF58
	.byte	0x2
	.byte	0x2c
	.byte	0x3
	.4byte	0x268
	.byte	0x10
	.4byte	.LASF59
	.byte	0x1
	.byte	0x39
	.byte	0x1a
	.4byte	0x96
	.byte	0x5
	.byte	0x3
	.4byte	uwTick
	.byte	0x10
	.4byte	.LASF60
	.byte	0x1
	.byte	0x3a
	.byte	0x16
	.4byte	0x28f
	.byte	0x5
	.byte	0x3
	.4byte	uwTickFreq
	.byte	0x11
	.4byte	.LASF94
	.byte	0x1
	.2byte	0x192
	.byte	0x6
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x15f
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x365
	.byte	0x13
	.string	"us"
	.byte	0x1
	.2byte	0x15f
	.byte	0x24
	.4byte	0x8a
	.4byte	.LLST14
	.byte	0x14
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x161
	.byte	0x17
	.4byte	0x96
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x15
	.4byte	0x685
	.4byte	.LBB21
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x1
	.2byte	0x164
	.byte	0x18
	.4byte	0x349
	.byte	0x16
	.4byte	0x6a2
	.4byte	.LLST15
	.byte	0x17
	.4byte	0x696
	.byte	0x18
	.4byte	.LVL35
	.4byte	0x6af
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x5
	.byte	0xc
	.4byte	0xf4240
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x1a
	.4byte	0x66b
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.byte	0x1
	.2byte	0x169
	.byte	0x5
	.byte	0x16
	.4byte	0x678
	.4byte	.LLST16
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x149
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x403
	.byte	0x13
	.string	"us"
	.byte	0x1
	.2byte	0x149
	.byte	0x21
	.4byte	0x8a
	.4byte	.LLST7
	.byte	0x1b
	.4byte	0x61e
	.4byte	.LBB8
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x14d
	.byte	0xc
	.byte	0x16
	.4byte	0x62f
	.4byte	.LLST8
	.byte	0x1c
	.4byte	.Ldebug_ranges0+0
	.byte	0x1d
	.4byte	0x63a
	.4byte	.LLST9
	.byte	0x1d
	.4byte	0x646
	.4byte	.LLST10
	.byte	0x1d
	.4byte	0x652
	.4byte	.LLST11
	.byte	0x1e
	.4byte	0x65e
	.byte	0x6
	.byte	0x5e
	.byte	0x93
	.byte	0x4
	.byte	0x5f
	.byte	0x93
	.byte	0x4
	.byte	0x1f
	.4byte	.LVL16
	.4byte	0x6bb
	.4byte	0x3ed
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20835000
	.byte	0
	.byte	0x18
	.4byte	.LVL20
	.4byte	0x6bb
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20835000
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x139
	.byte	0x22
	.4byte	0x19d
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x455
	.byte	0x13
	.string	"ms"
	.byte	0x1
	.2byte	0x139
	.byte	0x37
	.4byte	0x8a
	.4byte	.LLST12
	.byte	0x1c
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x20
	.string	"i"
	.byte	0x1
	.2byte	0x13b
	.byte	0x13
	.4byte	0x8a
	.4byte	.LLST13
	.byte	0x18
	.4byte	.LVL31
	.4byte	0x365
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x3e8
	.byte	0
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x12c
	.byte	0xf
	.4byte	0x28f
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.byte	0x12
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x11e
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x499
	.byte	0x22
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x11e
	.byte	0x2a
	.4byte	0x28f
	.4byte	.LLST6
	.byte	0
	.byte	0x12
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x10b
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x4d9
	.byte	0x23
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x10e
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST5
	.byte	0x18
	.4byte	.LVL8
	.4byte	0x6bb
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20835000
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF69
	.byte	0x1
	.byte	0xf5
	.byte	0xa
	.4byte	0x8a
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x562
	.byte	0x25
	.4byte	.LASF70
	.byte	0x1
	.byte	0xf8
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST2
	.byte	0x26
	.4byte	.LASF71
	.byte	0x1
	.byte	0xf9
	.byte	0xe
	.4byte	0x8a
	.2byte	0x5dc0
	.byte	0x27
	.4byte	0x685
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0xff
	.byte	0x16
	.4byte	0x54e
	.byte	0x16
	.4byte	0x6a2
	.4byte	.LLST3
	.byte	0x16
	.4byte	0x696
	.4byte	.LLST4
	.byte	0x18
	.4byte	.LVL7
	.4byte	0x6af
	.byte	0x19
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x5dc0
	.byte	0x19
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL4
	.4byte	0x6bb
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20835000
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LASF73
	.byte	0x1
	.byte	0xe9
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.byte	0x28
	.4byte	.LASF74
	.byte	0x1
	.byte	0xd8
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x24
	.4byte	.LASF75
	.byte	0x1
	.byte	0xbf
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x5e3
	.byte	0x29
	.string	"hz"
	.byte	0x1
	.byte	0xbf
	.byte	0x2f
	.4byte	0x8a
	.4byte	.LLST0
	.byte	0x2a
	.4byte	.LASF76
	.byte	0x1
	.byte	0xbf
	.byte	0x49
	.4byte	0x157
	.byte	0x1
	.byte	0x5b
	.byte	0x25
	.4byte	.LASF77
	.byte	0x1
	.byte	0xc1
	.byte	0xe
	.4byte	0x8a
	.4byte	.LLST0
	.byte	0x2b
	.string	"ret"
	.byte	0x1
	.byte	0xc2
	.byte	0x10
	.4byte	0x19d
	.byte	0
	.byte	0
	.byte	0x24
	.4byte	.LASF78
	.byte	0x1
	.byte	0xa2
	.byte	0xc
	.4byte	0x19d
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x61e
	.byte	0x1f
	.4byte	.LVL0
	.4byte	0x6c7
	.4byte	0x614
	.byte	0x19
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0xc
	.4byte	0x20835000
	.byte	0
	.byte	0x2c
	.4byte	.LVL1
	.4byte	0x6d3
	.byte	0
	.byte	0x2d
	.4byte	.LASF81
	.byte	0x1
	.byte	0x85
	.byte	0x39
	.4byte	0x19d
	.byte	0x3
	.4byte	0x66b
	.byte	0x2e
	.string	"us"
	.byte	0x1
	.byte	0x85
	.byte	0x4f
	.4byte	0x8a
	.byte	0x2f
	.4byte	.LASF68
	.byte	0x1
	.byte	0x87
	.byte	0xe
	.4byte	0xa0
	.byte	0x2f
	.4byte	.LASF79
	.byte	0x1
	.byte	0x87
	.byte	0x15
	.4byte	0xa0
	.byte	0x30
	.string	"now"
	.byte	0x1
	.byte	0x87
	.byte	0x1b
	.4byte	0xa0
	.byte	0x2f
	.4byte	.LASF80
	.byte	0x1
	.byte	0x87
	.byte	0x20
	.4byte	0xa0
	.byte	0
	.byte	0x31
	.4byte	.LASF95
	.byte	0x1
	.byte	0x60
	.byte	0xd
	.byte	0x1
	.4byte	0x685
	.byte	0x32
	.4byte	.LASF61
	.byte	0x1
	.byte	0x60
	.byte	0x23
	.4byte	0x8a
	.byte	0
	.byte	0x2d
	.4byte	.LASF82
	.byte	0x2
	.byte	0x57
	.byte	0x18
	.4byte	0xa0
	.byte	0x3
	.4byte	0x6af
	.byte	0x32
	.4byte	.LASF83
	.byte	0x2
	.byte	0x57
	.byte	0x2c
	.4byte	0xa0
	.byte	0x32
	.4byte	.LASF84
	.byte	0x2
	.byte	0x57
	.byte	0x40
	.4byte	0x8a
	.byte	0
	.byte	0x33
	.4byte	.LASF85
	.4byte	.LASF85
	.byte	0x2
	.byte	0x42
	.byte	0xa
	.byte	0x33
	.4byte	.LASF86
	.4byte	.LASF86
	.byte	0xa
	.byte	0x30
	.byte	0xa
	.byte	0x33
	.4byte	.LASF87
	.4byte	.LASF87
	.byte	0xa
	.byte	0x34
	.byte	0xc
	.byte	0x34
	.4byte	.LASF88
	.4byte	.LASF88
	.byte	0x8
	.2byte	0x4aa
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
	.byte	0x3c
	.byte	0x19
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x2e
	.byte	0
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
	.byte	0x12
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
	.byte	0x13
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x5
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
	.byte	0x34
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x1c
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2e
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
	.byte	0
	.byte	0
	.byte	0x2f
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
	.byte	0
	.byte	0
	.byte	0x30
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
	.byte	0
	.byte	0
	.byte	0x31
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x32
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
	.byte	0x33
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
	.byte	0x34
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
.LLST14:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL34
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL36
	.4byte	.LFE30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL33
	.4byte	.LVL35
	.2byte	0x6
	.byte	0xc
	.4byte	0xf4240
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x5
	.byte	0x7f
	.byte	0
	.byte	0x32
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL13
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL17
	.4byte	.LFE29
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL17
	.4byte	.LVL22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LFE29
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL19
	.4byte	.LVL22
	.2byte	0x6
	.byte	0x62
	.byte	0x93
	.byte	0x4
	.byte	0x63
	.byte	0x93
	.byte	0x4
	.4byte	.LVL23
	.4byte	.LFE29
	.2byte	0x6
	.byte	0x62
	.byte	0x93
	.byte	0x4
	.byte	0x63
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL18
	.4byte	.LVL22
	.2byte	0x6
	.byte	0x58
	.byte	0x93
	.byte	0x4
	.byte	0x59
	.byte	0x93
	.byte	0x4
	.4byte	.LVL23
	.4byte	.LFE29
	.2byte	0x6
	.byte	0x58
	.byte	0x93
	.byte	0x4
	.byte	0x59
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL28
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL27
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL30
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12
	.4byte	.LFE26
	.2byte	0x5
	.byte	0x3
	.4byte	uwTickFreq
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x4
	.byte	0xa
	.2byte	0x5dc0
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL7-1
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL2
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x74
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB12
	.4byte	.LBE12
	.4byte	.LBB13
	.4byte	.LBE13
	.4byte	0
	.4byte	0
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	.LBB16
	.4byte	.LBE16
	.4byte	0
	.4byte	0
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	.LBB30
	.4byte	.LBE30
	.4byte	0
	.4byte	0
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF23:
	.string	"HAL_ERROR"
.LASF60:
	.string	"uwTickFreq"
.LASF28:
	.string	"HAL_TIMEOUT"
.LASF8:
	.string	"__uint64_t"
.LASF39:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF53:
	.string	"PWR_CTRL_MAX"
.LASF13:
	.string	"uint64_t"
.LASF29:
	.string	"HAL_Status"
.LASF2:
	.string	"short int"
.LASF73:
	.string	"HAL_IncTick"
.LASF42:
	.string	"GRF_PUL_INFO"
.LASF26:
	.string	"HAL_INVAL"
.LASF86:
	.string	"HAL_TIMER_GetCount"
.LASF6:
	.string	"long long int"
.LASF7:
	.string	"__uint32_t"
.LASF69:
	.string	"HAL_GetTick"
.LASF78:
	.string	"HAL_Init"
.LASF38:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF22:
	.string	"HAL_OK"
.LASF59:
	.string	"uwTick"
.LASF37:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF62:
	.string	"HAL_CPUDelayUs"
.LASF24:
	.string	"HAL_BUSY"
.LASF58:
	.string	"eHAL_tickFreq"
.LASF21:
	.string	"eHAL_systickClkSource"
.LASF74:
	.string	"HAL_DeInit"
.LASF40:
	.string	"PM_RUNTIME_TYPE_END"
.LASF55:
	.string	"HAL_TICK_FREQ_100HZ"
.LASF87:
	.string	"HAL_TIMER_SysTimerInit"
.LASF51:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF66:
	.string	"freq"
.LASF95:
	.string	"CPUCycleLoop"
.LASF25:
	.string	"HAL_NODEV"
.LASF18:
	.string	"INTSTATUS"
.LASF82:
	.string	"HAL_DivU64"
.LASF4:
	.string	"long int"
.LASF71:
	.string	"base"
.LASF34:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF64:
	.string	"HAL_DelayMs"
.LASF67:
	.string	"HAL_GetSysTimerCount"
.LASF16:
	.string	"CONTROLREG"
.LASF54:
	.string	"HAL_TICK_FREQ_10HZ"
.LASF20:
	.string	"HAL_SYSTICK_CLKSRC_EXT"
.LASF65:
	.string	"HAL_SetTickFreq"
.LASF50:
	.string	"PWR_CTRL_PWR_EN"
.LASF80:
	.string	"pass"
.LASF44:
	.string	"GRF_SRT_INFO"
.LASF1:
	.string	"unsigned char"
.LASF83:
	.string	"numerator"
.LASF30:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF91:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF41:
	.string	"GRF_MUX_INFO"
.LASF0:
	.string	"signed char"
.LASF9:
	.string	"long long unsigned int"
.LASF12:
	.string	"uint32_t"
.LASF63:
	.string	"HAL_DelayUs"
.LASF10:
	.string	"unsigned int"
.LASF46:
	.string	"GRF_INFO_NUM"
.LASF70:
	.string	"tick"
.LASF56:
	.string	"HAL_TICK_FREQ_1KHZ"
.LASF32:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF3:
	.string	"short unsigned int"
.LASF93:
	.string	"TIMER_REG"
.LASF61:
	.string	"cycles"
.LASF17:
	.string	"RESERVED0014"
.LASF11:
	.string	"char"
.LASF35:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF76:
	.string	"clkSource"
.LASF89:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF47:
	.string	"_Bool"
.LASF33:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF88:
	.string	"HAL_PINCTRL_Init"
.LASF92:
	.string	"SystemCoreClock"
.LASF48:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF85:
	.string	"HAL_DivU64Rem"
.LASF5:
	.string	"long unsigned int"
.LASF90:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_base.c"
.LASF49:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF45:
	.string	"GRF_SMT_INFO"
.LASF43:
	.string	"GRF_DRV_INFO"
.LASF68:
	.string	"count"
.LASF19:
	.string	"HAL_SYSTICK_CLKSRC_CORE"
.LASF15:
	.string	"CURRENT_VALUE"
.LASF94:
	.string	"HAL_CPU_EnterIdle"
.LASF77:
	.string	"rate"
.LASF36:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF75:
	.string	"HAL_SystemCoreClockUpdate"
.LASF72:
	.string	"HAL_GetTickFreq"
.LASF31:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
.LASF52:
	.string	"PWR_CTRL_VOLT_ST"
.LASF27:
	.string	"HAL_NOSYS"
.LASF84:
	.string	"denominator"
.LASF57:
	.string	"HAL_TICK_FREQ_DEFAULT"
.LASF14:
	.string	"LOAD_COUNT"
.LASF79:
	.string	"from"
.LASF81:
	.string	"TimerDelayUs"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
