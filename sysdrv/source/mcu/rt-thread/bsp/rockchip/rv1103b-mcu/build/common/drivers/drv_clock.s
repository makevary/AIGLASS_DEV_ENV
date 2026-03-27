	.file	"drv_clock.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.rodata.clock_dev_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"clkLock"
	.align	2
.LC1:
	.string	"gateLock"
	.section	.text.clock_dev_init,"ax",@progbits
	.align	1
	.globl	clock_dev_init
	.type	clock_dev_init, @function
clock_dev_init:
.LFB46:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.c"
	.loc 1 382 1
	.cfi_startproc
	.loc 1 383 5
	.loc 1 382 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 383 9
	li	a2,0
	lla	a1,.LC0
	lla	a0,.LANCHOR0
	.loc 1 382 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 383 9
	call	rt_mutex_init
.LVL0:
	.loc 1 385 9 is_stmt 1
	.loc 1 387 5
	.loc 1 387 9 is_stmt 0
	li	a2,0
	lla	a1,.LC1
	lla	a0,.LANCHOR1
	call	rt_mutex_init
.LVL1:
	.loc 1 389 9 is_stmt 1
	.loc 1 391 5
.LBB6:
.LBB7:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 191 5
.LBE7:
.LBE6:
	.loc 1 401 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
.LBB9:
.LBB8:
	.loc 2 191 13
	sw	zero,.LANCHOR2,a5
.LVL2:
.LBE8:
.LBE9:
	.loc 1 400 5 is_stmt 1
	.loc 1 401 1 is_stmt 0
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE46:
	.size	clock_dev_init, .-clock_dev_init
	.section	.text.clk_enable,"ax",@progbits
	.align	1
	.globl	clk_enable
	.type	clk_enable, @function
clk_enable:
.LFB39:
	.loc 1 77 1 is_stmt 1
	.cfi_startproc
.LVL3:
	.loc 1 78 5
	.loc 1 79 5
	.loc 1 81 5
	.loc 1 77 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.loc 1 83 16
	li	s0,-10
	.loc 1 81 8
	beq	a0,zero,.L3
	mv	s1,a0
	.loc 1 86 5 is_stmt 1
	li	a1,-1
	lla	a0,.LANCHOR1
.LVL4:
	call	rt_mutex_take
.LVL5:
	.loc 1 88 5
	.loc 1 88 8 is_stmt 0
	lw	a5,4(s1)
	.loc 1 78 14
	li	s0,0
	.loc 1 88 8
	bne	a5,zero,.L5
	.loc 1 90 9 is_stmt 1
	.loc 1 90 15 is_stmt 0
	lw	a0,0(s1)
	call	HAL_CRU_ClkEnable
.LVL6:
	.loc 1 91 9 is_stmt 1
	.loc 1 91 12 is_stmt 0
	snez	s0,a0
	neg	s0,s0
.LVL7:
.L5:
	.loc 1 94 5 is_stmt 1
	.loc 1 94 23 is_stmt 0
	lw	a5,4(s1)
	.loc 1 96 5
	lla	a0,.LANCHOR1
	.loc 1 94 23
	addi	a5,a5,1
	sw	a5,4(s1)
	.loc 1 96 5 is_stmt 1
	call	rt_mutex_release
.LVL8:
	.loc 1 98 5
.L3:
	.loc 1 99 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE39:
	.size	clk_enable, .-clk_enable
	.section	.rodata.clk_disable.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"It may be wrong to used, make enable first.(gate_id = %d)\n"
	.section	.text.clk_disable,"ax",@progbits
	.align	1
	.globl	clk_disable
	.type	clk_disable, @function
clk_disable:
.LFB40:
	.loc 1 108 1 is_stmt 1
	.cfi_startproc
.LVL9:
	.loc 1 109 5
	.loc 1 110 5
	.loc 1 112 5
	.loc 1 108 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.loc 1 114 16
	li	s0,-10
	.loc 1 112 8
	beq	a0,zero,.L9
	mv	s1,a0
	.loc 1 117 5 is_stmt 1
	li	a1,-1
	lla	a0,.LANCHOR1
.LVL10:
	call	rt_mutex_take
.LVL11:
	.loc 1 119 5
	.loc 1 119 13 is_stmt 0
	lw	s0,4(s1)
	.loc 1 119 8
	bne	s0,zero,.L11
	.loc 1 121 9 is_stmt 1
	lw	a2,0(s1)
	lla	a1,.LANCHOR3
	lla	a0,.LC2
	call	rt_kprintf
.LVL12:
	.loc 1 122 9
.L12:
	.loc 1 134 5
	lla	a0,.LANCHOR1
	call	rt_mutex_release
.LVL13:
	.loc 1 136 5
.L9:
	.loc 1 137 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL14:
.L11:
	.cfi_restore_state
	.loc 1 125 5 is_stmt 1
	.loc 1 125 9 is_stmt 0
	addi	a5,s0,-1
	.loc 1 125 8
	sw	a5,4(s1)
	.loc 1 109 14
	li	s0,0
	.loc 1 125 8
	bgt	a5,zero,.L12
	.loc 1 129 5 is_stmt 1
	.loc 1 129 11 is_stmt 0
	lw	a0,0(s1)
	call	HAL_CRU_ClkDisable
.LVL15:
	.loc 1 130 5 is_stmt 1
	.loc 1 130 8 is_stmt 0
	snez	s0,a0
	neg	s0,s0
	.loc 1 133 1
	j	.L12
	.cfi_endproc
.LFE40:
	.size	clk_disable, .-clk_disable
	.section	.text.clk_is_enabled,"ax",@progbits
	.align	1
	.globl	clk_is_enabled
	.type	clk_is_enabled, @function
clk_is_enabled:
.LFB41:
	.loc 1 146 1 is_stmt 1
	.cfi_startproc
.LVL16:
	.loc 1 147 5
	.loc 1 147 8 is_stmt 0
	beq	a0,zero,.L17
	.loc 1 152 5 is_stmt 1
	.loc 1 152 12 is_stmt 0
	lw	a0,0(a0)
.LVL17:
	tail	HAL_CRU_ClkIsEnabled
.LVL18:
.L17:
	.loc 1 153 1
	ret
	.cfi_endproc
.LFE41:
	.size	clk_is_enabled, .-clk_is_enabled
	.section	.text.get_clk_gate_from_id,"ax",@progbits
	.align	1
	.globl	get_clk_gate_from_id
	.type	get_clk_gate_from_id, @function
get_clk_gate_from_id:
.LFB42:
	.loc 1 161 1 is_stmt 1
	.cfi_startproc
.LVL19:
	.loc 1 162 5
	.loc 1 163 5
	.loc 1 165 5
	.loc 1 161 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	mv	s1,a0
	.loc 1 165 5
	li	a1,-1
	lla	a0,.LANCHOR1
.LVL20:
	.loc 1 167 14
	lla	s2,.LANCHOR2
	.loc 1 161 1
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 165 5
	call	rt_mutex_take
.LVL21:
	.loc 1 167 5 is_stmt 1
	.loc 1 167 14 is_stmt 0
	lw	s0,0(s2)
.LVL22:
.L19:
	.loc 1 167 40 is_stmt 1 discriminator 1
	.loc 1 167 5 is_stmt 0 discriminator 1
	bne	s0,zero,.L22
	.loc 1 176 5 is_stmt 1
	.loc 1 176 16 is_stmt 0
	li	a1,16
	li	a0,1
	call	rt_calloc
.LVL23:
.LBB10:
.LBB11:
	.loc 2 208 13
	lw	a5,0(s2)
.LBE11:
.LBE10:
	.loc 1 177 23
	sw	s1,0(a0)
	.loc 1 176 16
	mv	s0,a0
.LVL24:
	.loc 1 177 5 is_stmt 1
	.loc 1 178 5
.LBB14:
.LBB12:
	.loc 2 208 13 is_stmt 0
	sw	a5,12(a0)
.LBE12:
.LBE14:
	.loc 1 179 5
	addi	a5,a0,12
	.loc 1 178 28
	sw	zero,4(a0)
	.loc 1 179 5 is_stmt 1
.LVL25:
.LBB15:
.LBB13:
	.loc 2 208 5
	.loc 2 209 5
	.loc 2 209 13 is_stmt 0
	sw	a5,0(s2)
	.loc 2 210 1
	j	.L21
.LVL26:
.L22:
.LBE13:
.LBE15:
	.loc 1 169 9 is_stmt 1
	.loc 1 170 9
	.loc 1 170 12 is_stmt 0
	lw	a5,-12(s0)
	bne	a5,s1,.L20
	.loc 1 169 18
	addi	s0,s0,-12
.LVL27:
.L21:
	.loc 1 182 5 is_stmt 1
	.loc 1 182 24 is_stmt 0
	lw	a5,8(s0)
	.loc 1 183 5
	lla	a0,.LANCHOR1
	.loc 1 182 24
	addi	a5,a5,1
	sw	a5,8(s0)
	.loc 1 183 5 is_stmt 1
	call	rt_mutex_release
.LVL28:
	.loc 1 185 5
	.loc 1 186 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL29:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL30:
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL31:
.L20:
	.cfi_restore_state
	.loc 1 167 52 is_stmt 1 discriminator 2
	.loc 1 167 56 is_stmt 0 discriminator 2
	lw	s0,0(s0)
.LVL32:
	j	.L19
	.cfi_endproc
.LFE42:
	.size	get_clk_gate_from_id, .-get_clk_gate_from_id
	.section	.text.put_clk_gate,"ax",@progbits
	.align	1
	.globl	put_clk_gate
	.type	put_clk_gate, @function
put_clk_gate:
.LFB43:
	.loc 1 193 1 is_stmt 1
	.cfi_startproc
.LVL33:
	.loc 1 194 5
	.loc 1 194 8 is_stmt 0
	beq	a0,zero,.L24
	.loc 1 193 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.loc 1 197 5
	li	a1,-1
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 197 5 is_stmt 1
	lla	a0,.LANCHOR1
.LVL34:
	.loc 1 193 1 is_stmt 0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 197 5
	call	rt_mutex_take
.LVL35:
	.loc 1 199 5 is_stmt 1
	.loc 1 199 9 is_stmt 0
	lw	a5,8(s0)
	addi	a5,a5,-1
	.loc 1 199 8
	sw	a5,8(s0)
	bgt	a5,zero,.L26
	.loc 1 203 5 is_stmt 1
	addi	a3,s0,12
.LVL36:
.LBB18:
.LBB19:
	.loc 2 228 27 is_stmt 0
	lla	a5,.LANCHOR2
.L28:
.LVL37:
	.loc 2 229 11 is_stmt 1
	mv	a4,a5
	.loc 2 229 16 is_stmt 0
	lw	a5,0(a5)
.LVL38:
	.loc 2 229 11
	beq	a5,zero,.L27
	.loc 2 229 23
	bne	a3,a5,.L28
	.loc 2 232 5 is_stmt 1
	.loc 2 232 40
	.loc 2 232 63 is_stmt 0
	lw	a5,12(s0)
	.loc 2 232 51
	sw	a5,0(a4)
.L27:
	.loc 2 234 5 is_stmt 1
.LVL39:
.LBE19:
.LBE18:
	.loc 1 204 5
	mv	a0,s0
	call	rt_free
.LVL40:
.L26:
	.loc 1 207 5
	.loc 1 208 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL41:
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 1 207 5
	lla	a0,.LANCHOR1
	.loc 1 208 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 207 5
	tail	rt_mutex_release
.LVL42:
.L24:
	ret
	.cfi_endproc
.LFE43:
	.size	put_clk_gate, .-put_clk_gate
	.section	.text.clk_get_rate,"ax",@progbits
	.align	1
	.globl	clk_get_rate
	.type	clk_get_rate, @function
clk_get_rate:
.LFB44:
	.loc 1 216 1 is_stmt 1
	.cfi_startproc
.LVL43:
	.loc 1 217 5
	.loc 1 219 5
	.loc 1 216 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s2,0(sp)
	.cfi_offset 18, -16
	.loc 1 219 5
	lla	s2,.LANCHOR0
	.loc 1 216 1
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a1
	mv	s1,a0
	.loc 1 219 5
	li	a1,-1
	mv	a0,s2
.LVL44:
	.loc 1 216 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 219 5
	call	rt_mutex_take
.LVL45:
	.loc 1 221 5 is_stmt 1
	.loc 1 221 12 is_stmt 0
	mv	a1,s0
	mv	a0,s1
	call	HAL_CRU_ClkGetFreq
.LVL46:
	mv	s0,a0
.LVL47:
	.loc 1 223 5 is_stmt 1
	mv	a0,s2
	call	rt_mutex_release
.LVL48:
	.loc 1 225 5
	.loc 1 226 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL49:
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE44:
	.size	clk_get_rate, .-clk_get_rate
	.section	.text.clk_set_rate,"ax",@progbits
	.align	1
	.globl	clk_set_rate
	.type	clk_set_rate, @function
clk_set_rate:
.LFB45:
	.loc 1 238 1 is_stmt 1
	.cfi_startproc
.LVL50:
	.loc 1 239 5
	.loc 1 241 5
	.loc 1 238 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.loc 1 238 1
	mv	s0,a2
	mv	s2,a0
	mv	s1,a1
	.loc 1 241 17
	call	clk_get_rate
.LVL51:
	.loc 1 241 8
	beq	a0,s0,.L42
	.loc 1 244 5 is_stmt 1
	li	a1,-1
	lla	a0,.LANCHOR0
	call	rt_mutex_take
.LVL52:
	.loc 1 246 5
	.loc 1 246 13 is_stmt 0
	mv	a2,s0
	mv	a0,s2
	mv	a1,s1
	call	HAL_CRU_ClkSetFreq
.LVL53:
	mv	s0,a0
.LVL54:
	.loc 1 248 5 is_stmt 1
	lla	a0,.LANCHOR0
	call	rt_mutex_release
.LVL55:
	.loc 1 250 5
.L40:
	.loc 1 251 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,8(sp)
	.cfi_restore 8
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL56:
.L42:
	.cfi_restore_state
	.loc 1 242 16
	li	s0,0
.LVL57:
	j	.L40
	.cfi_endproc
.LFE45:
	.size	clk_set_rate, .-clk_set_rate
	.section	.rodata.clk_init.str1.4,"aMS",@progbits,1
	.align	2
.LC3:
	.string	"%s: %s = %d\n"
	.section	.text.clk_init,"ax",@progbits
	.align	1
	.globl	clk_init
	.type	clk_init, @function
clk_init:
.LFB47:
	.loc 1 410 1 is_stmt 1
	.cfi_startproc
.LVL58:
	.loc 1 411 5
	.loc 1 410 1 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	ra,44(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.loc 1 410 1
	mv	s0,a0
.LVL59:
	.loc 1 413 5 is_stmt 1
	.loc 1 410 1 is_stmt 0
	mv	s1,a1
	.loc 1 420 13
	lla	s2,.LANCHOR4
	lla	s3,.LC3
.LVL60:
.L45:
	.loc 1 413 11 is_stmt 1
	lw	a5,0(s0)
	bne	a5,zero,.L48
	.loc 1 424 1 is_stmt 0
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
.LVL61:
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL62:
.L48:
	.cfi_restore_state
	.loc 1 415 9 is_stmt 1
	.loc 1 415 17 is_stmt 0
	lw	a2,8(s0)
	.loc 1 415 12
	beq	a2,zero,.L46
	.loc 1 417 13 is_stmt 1
	lw	a0,4(s0)
	li	a1,0
	call	HAL_CRU_ClkSetFreq
.LVL63:
.L46:
	.loc 1 419 9
	.loc 1 419 12 is_stmt 0
	beq	s1,zero,.L47
	.loc 1 420 13 is_stmt 1
	lw	a2,0(s0)
	lw	a0,4(s0)
	li	a1,0
	sw	a2,12(sp)
	call	HAL_CRU_ClkGetFreq
.LVL64:
	lw	a2,12(sp)
	mv	a3,a0
	mv	a1,s2
	mv	a0,s3
	call	rt_kprintf
.LVL65:
.L47:
	.loc 1 421 9
	.loc 1 421 13 is_stmt 0
	addi	s0,s0,12
.LVL66:
	j	.L45
	.cfi_endproc
.LFE47:
	.size	clk_init, .-clk_init
	.section	.text.clk_disable_unused,"ax",@progbits
	.align	1
	.globl	clk_disable_unused
	.type	clk_disable_unused, @function
clk_disable_unused:
.LFB48:
	.loc 1 431 1 is_stmt 1
	.cfi_startproc
.LVL67:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	mv	s0,a0
	.loc 1 432 5
.LVL68:
	.loc 1 434 5
.L57:
	.loc 1 434 11
	.loc 1 434 16 is_stmt 0
	lw	a2,8(s0)
	.loc 1 434 11
	bne	a2,zero,.L58
	.loc 1 439 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL69:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL70:
.L58:
	.cfi_restore_state
	.loc 1 436 9 is_stmt 1
	lw	a1,4(s0)
	lw	a0,0(s0)
	.loc 1 437 13 is_stmt 0
	addi	s0,s0,12
.LVL71:
	.loc 1 436 9
	call	HAL_CRU_ClkDisableUnused
.LVL72:
	.loc 1 437 9 is_stmt 1
	j	.L57
	.cfi_endproc
.LFE48:
	.size	clk_disable_unused, .-clk_disable_unused
	.globl	__rt_init_clock_dev_init
	.section	.bss.clk_lock,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	clk_lock, @object
	.size	clk_lock, 36
clk_lock:
	.zero	36
	.section	.bss.gate_lock,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	gate_lock, @object
	.size	gate_lock, 36
gate_lock:
	.zero	36
	.section	.rodata.__func__.0,"a"
	.align	2
	.set	.LANCHOR4,. + 0
	.type	__func__.0, @object
	.size	__func__.0, 9
__func__.0:
	.string	"clk_init"
	.section	.rodata.__func__.1,"a"
	.align	2
	.set	.LANCHOR3,. + 0
	.type	__func__.1, @object
	.size	__func__.1, 12
__func__.1:
	.string	"clk_disable"
	.section	.rti_fn.1,"a"
	.align	2
	.type	__rt_init_clock_dev_init, @object
	.size	__rt_init_clock_dev_init, 4
__rt_init_clock_dev_init:
	.word	clock_dev_init
	.section	.sbss.clk_gate_list,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	clk_gate_list, @object
	.size	clk_gate_list, 4
clk_gate_list:
	.zero	4
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_cru.h"
	.file 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf28
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF194
	.byte	0xc
	.4byte	.LASF195
	.4byte	.LASF196
	.4byte	.Ldebug_ranges0+0x38
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x3
	.byte	0x3d
	.byte	0x17
	.4byte	0x54
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF5
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x3e
	.byte	0x18
	.4byte	0x67
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x3f
	.byte	0x17
	.4byte	0x7a
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x3a
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x7a
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x47
	.byte	0x13
	.4byte	0x88
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x49
	.byte	0x15
	.4byte	0x6e
	.byte	0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0xb3
	.byte	0xf
	.4byte	0xc9
	.byte	0x5
	.4byte	0xb8
	.byte	0x6
	.byte	0x4
	.4byte	0xcf
	.byte	0x7
	.4byte	0x81
	.byte	0x8
	.4byte	.LASF19
	.byte	0x8
	.byte	0x3
	.2byte	0x12c
	.byte	0x8
	.4byte	0xff
	.byte	0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xff
	.byte	0
	.byte	0x9
	.4byte	.LASF17
	.byte	0x3
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xff
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xd4
	.byte	0xa
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x131
	.byte	0x1d
	.4byte	0xd4
	.byte	0x8
	.4byte	.LASF20
	.byte	0x4
	.byte	0x3
	.2byte	0x136
	.byte	0x8
	.4byte	0x12f
	.byte	0x9
	.4byte	.LASF16
	.byte	0x3
	.2byte	0x138
	.byte	0x1b
	.4byte	0x12f
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x112
	.byte	0xa
	.4byte	.LASF21
	.byte	0x3
	.2byte	0x13a
	.byte	0x1e
	.4byte	0x112
	.byte	0x8
	.4byte	.LASF22
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x189
	.byte	0x9
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x189
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x48
	.byte	0x8
	.byte	0x9
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x48
	.byte	0x9
	.byte	0x9
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x153
	.byte	0xf
	.4byte	0x105
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x1a0
	.4byte	0x199
	.byte	0xc
	.4byte	0x199
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF27
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF28
	.byte	0x5
	.4byte	0x1a0
	.byte	0x8
	.4byte	.LASF29
	.byte	0x2c
	.byte	0x3
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x20f
	.byte	0x9
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x142
	.byte	0
	.byte	0xd
	.string	"row"
	.byte	0x3
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x20f
	.byte	0x14
	.byte	0x9
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x22c
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x22a
	.byte	0x20
	.byte	0x9
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xac
	.byte	0x24
	.byte	0x9
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xac
	.byte	0x28
	.byte	0
	.byte	0xb
	.4byte	0x105
	.4byte	0x21f
	.byte	0xc
	.4byte	0x199
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	0x22a
	.byte	0xf
	.4byte	0x22a
	.byte	0
	.byte	0x10
	.byte	0x4
	.byte	0x6
	.byte	0x4
	.4byte	0x21f
	.byte	0x8
	.4byte	.LASF35
	.byte	0x80
	.byte	0x3
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x374
	.byte	0x9
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x189
	.byte	0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x48
	.byte	0x8
	.byte	0x9
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x200
	.byte	0x10
	.4byte	0x48
	.byte	0x9
	.byte	0x9
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x206
	.byte	0xf
	.4byte	0x105
	.byte	0xc
	.byte	0x9
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x207
	.byte	0xf
	.4byte	0x105
	.byte	0x14
	.byte	0xd
	.string	"sp"
	.byte	0x3
	.2byte	0x20a
	.byte	0xb
	.4byte	0x22a
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x20b
	.byte	0xb
	.4byte	0x22a
	.byte	0x20
	.byte	0x9
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x20c
	.byte	0xb
	.4byte	0x22a
	.byte	0x24
	.byte	0x9
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x20d
	.byte	0xb
	.4byte	0x22a
	.byte	0x28
	.byte	0x9
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x20e
	.byte	0x11
	.4byte	0x6e
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x211
	.byte	0xe
	.4byte	0xa0
	.byte	0x30
	.byte	0x9
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x213
	.byte	0x10
	.4byte	0x48
	.byte	0x34
	.byte	0x9
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x216
	.byte	0x10
	.4byte	0x48
	.byte	0x35
	.byte	0x9
	.4byte	.LASF44
	.byte	0x3
	.2byte	0x217
	.byte	0x10
	.4byte	0x48
	.byte	0x36
	.byte	0x9
	.4byte	.LASF45
	.byte	0x3
	.2byte	0x21c
	.byte	0x11
	.4byte	0x6e
	.byte	0x38
	.byte	0x9
	.4byte	.LASF46
	.byte	0x3
	.2byte	0x220
	.byte	0x11
	.4byte	0x6e
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF47
	.byte	0x3
	.2byte	0x221
	.byte	0x10
	.4byte	0x48
	.byte	0x40
	.byte	0x9
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x22d
	.byte	0x10
	.4byte	0x94
	.byte	0x44
	.byte	0x9
	.4byte	.LASF48
	.byte	0x3
	.2byte	0x22e
	.byte	0x10
	.4byte	0x94
	.byte	0x48
	.byte	0x9
	.4byte	.LASF49
	.byte	0x3
	.2byte	0x236
	.byte	0x15
	.4byte	0x1ac
	.byte	0x4c
	.byte	0x9
	.4byte	.LASF50
	.byte	0x3
	.2byte	0x238
	.byte	0xc
	.4byte	0x385
	.byte	0x78
	.byte	0x9
	.4byte	.LASF51
	.byte	0x3
	.2byte	0x23f
	.byte	0x11
	.4byte	0x6e
	.byte	0x7c
	.byte	0
	.byte	0xe
	.4byte	0x37f
	.byte	0xf
	.4byte	0x37f
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x232
	.byte	0x6
	.byte	0x4
	.4byte	0x374
	.byte	0x8
	.4byte	.LASF52
	.byte	0x1c
	.byte	0x3
	.2byte	0x25b
	.byte	0x8
	.4byte	0x3b6
	.byte	0x9
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x25d
	.byte	0x16
	.4byte	0x142
	.byte	0
	.byte	0x9
	.4byte	.LASF53
	.byte	0x3
	.2byte	0x25f
	.byte	0xf
	.4byte	0x105
	.byte	0x14
	.byte	0
	.byte	0x8
	.4byte	.LASF54
	.byte	0x24
	.byte	0x3
	.2byte	0x273
	.byte	0x8
	.4byte	0x40b
	.byte	0x9
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x275
	.byte	0x1a
	.4byte	0x38b
	.byte	0
	.byte	0x9
	.4byte	.LASF55
	.byte	0x3
	.2byte	0x277
	.byte	0x11
	.4byte	0x5b
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF56
	.byte	0x3
	.2byte	0x279
	.byte	0x10
	.4byte	0x48
	.byte	0x1e
	.byte	0x9
	.4byte	.LASF57
	.byte	0x3
	.2byte	0x27a
	.byte	0x10
	.4byte	0x48
	.byte	0x1f
	.byte	0x9
	.4byte	.LASF58
	.byte	0x3
	.2byte	0x27c
	.byte	0x17
	.4byte	0x37f
	.byte	0x20
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x1a7
	.byte	0x3
	.4byte	.LASF59
	.byte	0x4
	.byte	0x4f
	.byte	0x1b
	.4byte	0x7a
	.byte	0x3
	.4byte	.LASF60
	.byte	0x5
	.byte	0x30
	.byte	0x14
	.4byte	0x411
	.byte	0x11
	.4byte	.LASF197
	.byte	0x7
	.byte	0x8
	.4byte	0x25
	.byte	0x6
	.byte	0x9e
	.byte	0xe
	.4byte	0x67f
	.byte	0x12
	.4byte	.LASF61
	.byte	0
	.byte	0x12
	.4byte	.LASF62
	.byte	0x1
	.byte	0x12
	.4byte	.LASF63
	.byte	0x2
	.byte	0x12
	.4byte	.LASF64
	.byte	0x3
	.byte	0x12
	.4byte	.LASF65
	.byte	0x4
	.byte	0x12
	.4byte	.LASF66
	.byte	0x5
	.byte	0x12
	.4byte	.LASF67
	.byte	0x6
	.byte	0x12
	.4byte	.LASF68
	.byte	0x7
	.byte	0x12
	.4byte	.LASF69
	.byte	0x8
	.byte	0x13
	.4byte	.LASF70
	.4byte	0x2000000
	.byte	0x13
	.4byte	.LASF71
	.4byte	0x5040000
	.byte	0x13
	.4byte	.LASF72
	.4byte	0x50a0000
	.byte	0x13
	.4byte	.LASF73
	.4byte	0x3000001
	.byte	0x13
	.4byte	.LASF74
	.4byte	0x5000705
	.byte	0x13
	.4byte	.LASF75
	.4byte	0x2000070a
	.byte	0x14
	.4byte	.LASF76
	.8byte	0x208072000000000
	.byte	0x13
	.4byte	.LASF77
	.4byte	0x5050705
	.byte	0x13
	.4byte	.LASF78
	.4byte	0x2000070b
	.byte	0x14
	.4byte	.LASF79
	.8byte	0x20a072000000000
	.byte	0x13
	.4byte	.LASF80
	.4byte	0x50a0705
	.byte	0x13
	.4byte	.LASF81
	.4byte	0x2000070c
	.byte	0x14
	.4byte	.LASF82
	.8byte	0x20c072000000000
	.byte	0x13
	.4byte	.LASF83
	.4byte	0x5000714
	.byte	0x13
	.4byte	.LASF84
	.4byte	0x20000715
	.byte	0x14
	.4byte	.LASF85
	.8byte	0x20a072300000000
	.byte	0x14
	.4byte	.LASF86
	.8byte	0x10f071f0800071f
	.byte	0x14
	.4byte	.LASF87
	.8byte	0x10f072008000720
	.byte	0x14
	.4byte	.LASF88
	.8byte	0x10f072408000724
	.byte	0x14
	.4byte	.LASF89
	.8byte	0x10f072108000721
	.byte	0x14
	.4byte	.LASF90
	.8byte	0x109071f00000000
	.byte	0x14
	.4byte	.LASF91
	.8byte	0x20a071f00000000
	.byte	0x14
	.4byte	.LASF92
	.8byte	0x10c071f00000000
	.byte	0x14
	.4byte	.LASF93
	.8byte	0x100072200000000
	.byte	0x14
	.4byte	.LASF94
	.8byte	0x101072200000000
	.byte	0x14
	.4byte	.LASF95
	.8byte	0x202072200000000
	.byte	0x14
	.4byte	.LASF96
	.8byte	0x10c072200000000
	.byte	0x14
	.4byte	.LASF97
	.8byte	0x10d072200000000
	.byte	0x14
	.4byte	.LASF98
	.8byte	0x10e072200000000
	.byte	0x14
	.4byte	.LASF99
	.8byte	0x200072300000000
	.byte	0x14
	.4byte	.LASF100
	.8byte	0x202072300000000
	.byte	0x14
	.4byte	.LASF101
	.8byte	0x204072300000000
	.byte	0x14
	.4byte	.LASF102
	.8byte	0x108072300000000
	.byte	0x14
	.4byte	.LASF103
	.8byte	0x20c072300000000
	.byte	0x14
	.4byte	.LASF104
	.8byte	0x20e072300000000
	.byte	0x14
	.4byte	.LASF105
	.8byte	0x1070729030d0729
	.byte	0x13
	.4byte	.LASF106
	.4byte	0x5000728
	.byte	0x13
	.4byte	.LASF107
	.4byte	0x5080728
	.byte	0x14
	.4byte	.LASF108
	.8byte	0x106072800000000
	.byte	0x14
	.4byte	.LASF109
	.8byte	0x10e072800000000
	.byte	0x14
	.4byte	.LASF110
	.8byte	0x10e071e00000000
	.byte	0x13
	.4byte	.LASF111
	.4byte	0x2090725
	.byte	0x14
	.4byte	.LASF112
	.8byte	0x101030000000000
	.byte	0x14
	.4byte	.LASF113
	.8byte	0x103030000000000
	.byte	0x14
	.4byte	.LASF114
	.8byte	0x108090000000000
	.byte	0
	.byte	0x3
	.4byte	.LASF115
	.byte	0x6
	.byte	0xdd
	.byte	0x3
	.4byte	0x429
	.byte	0x15
	.byte	0x5
	.byte	0x4
	.4byte	0x81
	.byte	0x7
	.byte	0xae
	.byte	0xe
	.4byte	0x6c5
	.byte	0x12
	.4byte	.LASF116
	.byte	0
	.byte	0x16
	.4byte	.LASF117
	.byte	0x7f
	.byte	0x16
	.4byte	.LASF118
	.byte	0x70
	.byte	0x16
	.4byte	.LASF119
	.byte	0x6d
	.byte	0x16
	.4byte	.LASF120
	.byte	0x6a
	.byte	0x16
	.4byte	.LASF121
	.byte	0x5a
	.byte	0x16
	.4byte	.LASF122
	.byte	0x92,0x7f
	.byte	0
	.byte	0x3
	.4byte	.LASF123
	.byte	0x7
	.byte	0xb6
	.byte	0x3
	.4byte	0x68b
	.byte	0x15
	.byte	0x7
	.byte	0x4
	.4byte	0x199
	.byte	0x8
	.byte	0x2e
	.byte	0x6
	.4byte	0x722
	.byte	0x12
	.4byte	.LASF124
	.byte	0
	.byte	0x12
	.4byte	.LASF125
	.byte	0x1
	.byte	0x12
	.4byte	.LASF126
	.byte	0x2
	.byte	0x12
	.4byte	.LASF127
	.byte	0x3
	.byte	0x12
	.4byte	.LASF128
	.byte	0x4
	.byte	0x12
	.4byte	.LASF129
	.byte	0x5
	.byte	0x12
	.4byte	.LASF130
	.byte	0x6
	.byte	0x12
	.4byte	.LASF131
	.byte	0x7
	.byte	0x12
	.4byte	.LASF132
	.byte	0x8
	.byte	0x12
	.4byte	.LASF133
	.byte	0x9
	.byte	0x12
	.4byte	.LASF134
	.byte	0xa
	.byte	0
	.byte	0x17
	.byte	0x7
	.byte	0x4
	.4byte	0x199
	.byte	0x9
	.2byte	0x42b
	.byte	0xe
	.4byte	0x756
	.byte	0x12
	.4byte	.LASF135
	.byte	0
	.byte	0x12
	.4byte	.LASF136
	.byte	0x1
	.byte	0x12
	.4byte	.LASF137
	.byte	0x2
	.byte	0x12
	.4byte	.LASF138
	.byte	0x3
	.byte	0x12
	.4byte	.LASF139
	.byte	0x4
	.byte	0x12
	.4byte	.LASF140
	.byte	0x5
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF141
	.byte	0x15
	.byte	0x7
	.byte	0x4
	.4byte	0x199
	.byte	0xa
	.byte	0x35
	.byte	0xe
	.4byte	0x790
	.byte	0x12
	.4byte	.LASF142
	.byte	0
	.byte	0x12
	.4byte	.LASF143
	.byte	0x1
	.byte	0x12
	.4byte	.LASF144
	.byte	0x2
	.byte	0x12
	.4byte	.LASF145
	.byte	0x3
	.byte	0x12
	.4byte	.LASF146
	.byte	0x4
	.byte	0x12
	.4byte	.LASF147
	.byte	0x5
	.byte	0
	.byte	0x18
	.4byte	.LASF148
	.byte	0x10
	.byte	0xb
	.byte	0x20
	.byte	0x8
	.4byte	0x7d2
	.byte	0x19
	.4byte	.LASF149
	.byte	0xb
	.byte	0x22
	.byte	0xe
	.4byte	0x41d
	.byte	0
	.byte	0x19
	.4byte	.LASF150
	.byte	0xb
	.byte	0x23
	.byte	0x9
	.4byte	0x81
	.byte	0x4
	.byte	0x19
	.4byte	.LASF151
	.byte	0xb
	.byte	0x24
	.byte	0x9
	.4byte	0x81
	.byte	0x8
	.byte	0x19
	.4byte	.LASF152
	.byte	0xb
	.byte	0x25
	.byte	0x10
	.4byte	0x135
	.byte	0xc
	.byte	0
	.byte	0x18
	.4byte	.LASF153
	.byte	0xc
	.byte	0xb
	.byte	0x28
	.byte	0x8
	.4byte	0x807
	.byte	0x19
	.4byte	.LASF23
	.byte	0xb
	.byte	0x2a
	.byte	0x11
	.4byte	0x40b
	.byte	0
	.byte	0x19
	.4byte	.LASF154
	.byte	0xb
	.byte	0x2b
	.byte	0xe
	.4byte	0x41d
	.byte	0x4
	.byte	0x19
	.4byte	.LASF155
	.byte	0xb
	.byte	0x2c
	.byte	0xe
	.4byte	0x41d
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	0x7d2
	.byte	0x18
	.4byte	.LASF156
	.byte	0xc
	.byte	0xb
	.byte	0x2f
	.byte	0x8
	.4byte	0x841
	.byte	0x19
	.4byte	.LASF157
	.byte	0xb
	.byte	0x31
	.byte	0xe
	.4byte	0x41d
	.byte	0
	.byte	0x19
	.4byte	.LASF158
	.byte	0xb
	.byte	0x32
	.byte	0xe
	.4byte	0x41d
	.byte	0x4
	.byte	0x19
	.4byte	.LASF159
	.byte	0xb
	.byte	0x33
	.byte	0xe
	.4byte	0x41d
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	0x80c
	.byte	0x1a
	.4byte	.LASF179
	.byte	0x1
	.byte	0x35
	.byte	0x1f
	.4byte	0x852
	.byte	0x6
	.byte	0x4
	.4byte	0x807
	.byte	0x1b
	.4byte	.LASF160
	.byte	0x1
	.byte	0x37
	.byte	0x13
	.4byte	0x135
	.byte	0x5
	.byte	0x3
	.4byte	clk_gate_list
	.byte	0x1b
	.4byte	.LASF161
	.byte	0x1
	.byte	0x39
	.byte	0x18
	.4byte	0x3b6
	.byte	0x5
	.byte	0x3
	.4byte	clk_lock
	.byte	0x1b
	.4byte	.LASF162
	.byte	0x1
	.byte	0x3a
	.byte	0x18
	.4byte	0x3b6
	.byte	0x5
	.byte	0x3
	.4byte	gate_lock
	.byte	0x1c
	.4byte	.LASF198
	.byte	0x1
	.2byte	0x192
	.byte	0x27
	.4byte	0xc4
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_clock_dev_init
	.byte	0x1d
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x1ae
	.byte	0x6
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.byte	0x1
	.byte	0x9c
	.4byte	0x8e4
	.byte	0x1e
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x1ae
	.byte	0x32
	.4byte	0x8e4
	.4byte	.LLST23
	.byte	0x1f
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x1b0
	.byte	0x1e
	.4byte	0x8e4
	.4byte	.LLST24
	.byte	0x20
	.4byte	.LVL72
	.4byte	0xe91
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x841
	.byte	0x1d
	.4byte	.LASF153
	.byte	0x1
	.2byte	0x199
	.byte	0x6
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.byte	0x1
	.byte	0x9c
	.4byte	0x973
	.byte	0x1e
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x199
	.byte	0x26
	.4byte	0x852
	.4byte	.LLST20
	.byte	0x1e
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x199
	.byte	0x35
	.4byte	0x756
	.4byte	.LLST21
	.byte	0x1f
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x19b
	.byte	0x1c
	.4byte	0x852
	.4byte	.LLST22
	.byte	0x21
	.4byte	.LASF177
	.4byte	0x983
	.byte	0x5
	.byte	0x3
	.4byte	__func__.0
	.byte	0x20
	.4byte	.LVL63
	.4byte	0xe9e
	.byte	0x20
	.4byte	.LVL64
	.4byte	0xeab
	.byte	0x22
	.4byte	.LVL65
	.4byte	0xeb8
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0x91
	.byte	0x5c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0xb
	.4byte	0x1a7
	.4byte	0x983
	.byte	0xc
	.4byte	0x199
	.byte	0x8
	.byte	0
	.byte	0x5
	.4byte	0x973
	.byte	0x24
	.4byte	.LASF168
	.byte	0x1
	.2byte	0x17d
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.byte	0x1
	.byte	0x9c
	.4byte	0xa09
	.byte	0x25
	.4byte	0xe79
	.4byte	.LBB6
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x187
	.byte	0x5
	.4byte	0x9c2
	.byte	0x26
	.4byte	0xe86
	.4byte	.LLST0
	.byte	0
	.byte	0x27
	.4byte	.LVL0
	.4byte	0xec5
	.4byte	0x9e7
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x22
	.4byte	.LVL1
	.4byte	0xec5
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LASF169
	.byte	0x1
	.byte	0xed
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.byte	0x1
	.byte	0x9c
	.4byte	0xab4
	.byte	0x29
	.4byte	.LASF154
	.byte	0x1
	.byte	0xed
	.byte	0x23
	.4byte	0x67f
	.4byte	.LLST17
	.byte	0x29
	.4byte	.LASF170
	.byte	0x1
	.byte	0xed
	.byte	0x34
	.4byte	0x41d
	.4byte	.LLST18
	.byte	0x2a
	.4byte	.LASF41
	.byte	0x1
	.byte	0xef
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST19
	.byte	0x27
	.4byte	.LVL51
	.4byte	0xab4
	.4byte	0xa6f
	.byte	0x23
	.byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.byte	0x5
	.byte	0xf3
	.byte	0x3
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0
	.byte	0x27
	.4byte	.LVL52
	.4byte	0xed2
	.4byte	0xa8c
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x27
	.4byte	.LVL53
	.4byte	0xe9e
	.4byte	0xaa0
	.byte	0x23
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x22
	.4byte	.LVL55
	.4byte	0xedf
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR0
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LASF171
	.byte	0x1
	.byte	0xd7
	.byte	0xa
	.4byte	0x41d
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.byte	0x1
	.byte	0x9c
	.4byte	0xb22
	.byte	0x29
	.4byte	.LASF154
	.byte	0x1
	.byte	0xd7
	.byte	0x23
	.4byte	0x67f
	.4byte	.LLST15
	.byte	0x2a
	.4byte	.LASF170
	.byte	0x1
	.byte	0xd9
	.byte	0xe
	.4byte	0x41d
	.4byte	.LLST16
	.byte	0x27
	.4byte	.LVL45
	.4byte	0xed2
	.4byte	0xb08
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x20
	.4byte	.LVL46
	.4byte	0xeab
	.byte	0x22
	.4byte	.LVL48
	.4byte	0xedf
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LASF172
	.byte	0x1
	.byte	0xc0
	.byte	0x6
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.byte	0x1
	.byte	0x9c
	.4byte	0xbc5
	.byte	0x29
	.4byte	.LASF173
	.byte	0x1
	.byte	0xc0
	.byte	0x24
	.4byte	0xbc5
	.4byte	.LLST12
	.byte	0x2c
	.string	"out"
	.byte	0x1
	.byte	0xce
	.byte	0x1
	.4byte	.L26
	.byte	0x2d
	.4byte	0xe25
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.byte	0xcb
	.byte	0x5
	.4byte	0xb80
	.byte	0x2e
	.4byte	0xe36
	.byte	0x26
	.4byte	0xe40
	.4byte	.LLST13
	.byte	0x2f
	.4byte	0xe4a
	.4byte	.LLST14
	.byte	0
	.byte	0x27
	.4byte	.LVL35
	.4byte	0xed2
	.4byte	0xb9d
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x27
	.4byte	.LVL40
	.4byte	0xeec
	.4byte	0xbb1
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x30
	.4byte	.LVL42
	.4byte	0xedf
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x790
	.byte	0x28
	.4byte	.LASF174
	.byte	0x1
	.byte	0xa0
	.byte	0x12
	.4byte	0xbc5
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0xc91
	.byte	0x29
	.4byte	.LASF149
	.byte	0x1
	.byte	0xa0
	.byte	0x2b
	.4byte	0x81
	.4byte	.LLST7
	.byte	0x2a
	.4byte	.LASF148
	.byte	0x1
	.byte	0xa2
	.byte	0x16
	.4byte	0xbc5
	.4byte	.LLST8
	.byte	0x31
	.string	"pos"
	.byte	0x1
	.byte	0xa3
	.byte	0x11
	.4byte	0xc91
	.4byte	.LLST9
	.byte	0x2c
	.string	"out"
	.byte	0x1
	.byte	0xb5
	.byte	0x1
	.4byte	.L21
	.byte	0x32
	.4byte	0xe57
	.4byte	.LBB10
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0xb3
	.byte	0x5
	.4byte	0xc48
	.byte	0x26
	.4byte	0xe6e
	.4byte	.LLST10
	.byte	0x26
	.4byte	0xe64
	.4byte	.LLST11
	.byte	0
	.byte	0x27
	.4byte	.LVL21
	.4byte	0xed2
	.4byte	0xc65
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x27
	.4byte	.LVL23
	.4byte	0xef8
	.4byte	0xc7d
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0x22
	.4byte	.LVL28
	.4byte	0xedf
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x135
	.byte	0x28
	.4byte	.LASF175
	.byte	0x1
	.byte	0x91
	.byte	0x5
	.4byte	0x81
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0xccb
	.byte	0x29
	.4byte	.LASF173
	.byte	0x1
	.byte	0x91
	.byte	0x25
	.4byte	0xbc5
	.4byte	.LLST6
	.byte	0x33
	.4byte	.LVL18
	.4byte	0xf04
	.byte	0
	.byte	0x28
	.4byte	.LASF176
	.byte	0x1
	.byte	0x6b
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.byte	0x1
	.byte	0x9c
	.4byte	0xd8c
	.byte	0x29
	.4byte	.LASF173
	.byte	0x1
	.byte	0x6b
	.byte	0x27
	.4byte	0xbc5
	.4byte	.LLST4
	.byte	0x2a
	.4byte	.LASF41
	.byte	0x1
	.byte	0x6d
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST5
	.byte	0x34
	.string	"ret"
	.byte	0x1
	.byte	0x6e
	.byte	0x10
	.4byte	0x6c5
	.byte	0x1
	.byte	0x5a
	.byte	0x21
	.4byte	.LASF177
	.4byte	0xd9c
	.byte	0x5
	.byte	0x3
	.4byte	__func__.1
	.byte	0x2c
	.string	"out"
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.4byte	.L12
	.byte	0x27
	.4byte	.LVL11
	.4byte	0xed2
	.4byte	0xd4b
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x27
	.4byte	.LVL12
	.4byte	0xeb8
	.4byte	0xd6b
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR3
	.byte	0
	.byte	0x27
	.4byte	.LVL13
	.4byte	0xedf
	.4byte	0xd82
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0x20
	.4byte	.LVL15
	.4byte	0xf11
	.byte	0
	.byte	0xb
	.4byte	0x1a7
	.4byte	0xd9c
	.byte	0xc
	.4byte	0x199
	.byte	0xb
	.byte	0
	.byte	0x5
	.4byte	0xd8c
	.byte	0x28
	.4byte	.LASF178
	.byte	0x1
	.byte	0x4c
	.byte	0xa
	.4byte	0xa0
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0xe25
	.byte	0x29
	.4byte	.LASF173
	.byte	0x1
	.byte	0x4c
	.byte	0x26
	.4byte	0xbc5
	.4byte	.LLST1
	.byte	0x2a
	.4byte	.LASF41
	.byte	0x1
	.byte	0x4e
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST2
	.byte	0x31
	.string	"ret"
	.byte	0x1
	.byte	0x4f
	.byte	0x10
	.4byte	0x6c5
	.4byte	.LLST3
	.byte	0x27
	.4byte	.LVL5
	.4byte	0xed2
	.4byte	0xe08
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0x23
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x20
	.4byte	.LVL6
	.4byte	0xf1e
	.byte	0x22
	.4byte	.LVL8
	.4byte	0xedf
	.byte	0x23
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0
	.byte	0x35
	.4byte	.LASF199
	.byte	0x2
	.byte	0xe1
	.byte	0x1d
	.4byte	0xc91
	.byte	0x3
	.4byte	0xe57
	.byte	0x36
	.string	"l"
	.byte	0x2
	.byte	0xe1
	.byte	0x39
	.4byte	0xc91
	.byte	0x36
	.string	"n"
	.byte	0x2
	.byte	0xe1
	.byte	0x48
	.4byte	0xc91
	.byte	0x1a
	.4byte	.LASF152
	.byte	0x2
	.byte	0xe4
	.byte	0x1b
	.4byte	0x12f
	.byte	0
	.byte	0x37
	.4byte	.LASF180
	.byte	0x2
	.byte	0xce
	.byte	0x16
	.byte	0x3
	.4byte	0xe79
	.byte	0x36
	.string	"l"
	.byte	0x2
	.byte	0xce
	.byte	0x32
	.4byte	0xc91
	.byte	0x36
	.string	"n"
	.byte	0x2
	.byte	0xce
	.byte	0x41
	.4byte	0xc91
	.byte	0
	.byte	0x37
	.4byte	.LASF181
	.byte	0x2
	.byte	0xbd
	.byte	0x16
	.byte	0x3
	.4byte	0xe91
	.byte	0x36
	.string	"l"
	.byte	0x2
	.byte	0xbd
	.byte	0x30
	.4byte	0xc91
	.byte	0
	.byte	0x38
	.4byte	.LASF182
	.4byte	.LASF182
	.byte	0xc
	.2byte	0x116
	.byte	0xc
	.byte	0x38
	.4byte	.LASF183
	.4byte	.LASF183
	.byte	0xc
	.2byte	0x19e
	.byte	0xc
	.byte	0x38
	.4byte	.LASF184
	.4byte	.LASF184
	.byte	0xc
	.2byte	0x195
	.byte	0xa
	.byte	0x38
	.4byte	.LASF185
	.4byte	.LASF185
	.byte	0xd
	.2byte	0x1d7
	.byte	0x6
	.byte	0x38
	.4byte	.LASF186
	.4byte	.LASF186
	.byte	0xd
	.2byte	0x137
	.byte	0xa
	.byte	0x38
	.4byte	.LASF187
	.4byte	.LASF187
	.byte	0xd
	.2byte	0x13c
	.byte	0xa
	.byte	0x38
	.4byte	.LASF188
	.4byte	.LASF188
	.byte	0xd
	.2byte	0x13d
	.byte	0xa
	.byte	0x39
	.4byte	.LASF189
	.4byte	.LASF189
	.byte	0xd
	.byte	0xf5
	.byte	0x6
	.byte	0x39
	.4byte	.LASF190
	.4byte	.LASF190
	.byte	0xd
	.byte	0xf7
	.byte	0x7
	.byte	0x38
	.4byte	.LASF191
	.4byte	.LASF191
	.byte	0xc
	.2byte	0x106
	.byte	0xb
	.byte	0x38
	.4byte	.LASF192
	.4byte	.LASF192
	.byte	0xc
	.2byte	0x11d
	.byte	0xc
	.byte	0x38
	.4byte	.LASF193
	.4byte	.LASF193
	.byte	0xc
	.2byte	0x10d
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
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
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
	.byte	0xe
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0x1f
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
	.byte	0x20
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x49
	.byte	0x13
	.byte	0x34
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
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
	.byte	0x25
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
	.byte	0x26
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x27
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
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2c
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0x2e
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2f
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x30
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
	.byte	0x31
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
	.byte	0x32
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
	.byte	0x33
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
	.byte	0x34
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
	.byte	0x35
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
	.byte	0x36
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
	.byte	0x37
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
	.byte	0x38
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
	.byte	0x39
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
.LLST23:
	.4byte	.LVL67
	.4byte	.LVL68
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL68
	.4byte	.LFE48
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL70
	.4byte	.LVL71
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL71
	.4byte	.LVL72
	.2byte	0x3
	.byte	0x78
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL72
	.4byte	.LFE48
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL58
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL60
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL58
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL60
	.4byte	.LFE47
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL59
	.4byte	.LVL60
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL62
	.4byte	.LFE47
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x6
	.byte	0x3
	.4byte	clk_gate_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL50
	.4byte	.LVL51-1
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL51-1
	.4byte	.LFE45
	.2byte	0x6
	.byte	0xf3
	.byte	0x3
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL50
	.4byte	.LVL51-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL51-1
	.4byte	.LVL54
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL54
	.4byte	.LVL56
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL56
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL57
	.4byte	.LFE45
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL50
	.4byte	.LVL54
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL54
	.4byte	.LVL55
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL56
	.4byte	.LFE45
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x6
	.byte	0x5a
	.byte	0x93
	.byte	0x4
	.byte	0x5b
	.byte	0x93
	.byte	0x4
	.4byte	.LVL44
	.4byte	.LFE44
	.2byte	0x6
	.byte	0xf3
	.byte	0x3
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL47
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL49
	.4byte	.LFE44
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL33
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL34
	.4byte	.LVL41
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LFE43
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL36
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL38
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL20
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LFE42
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x3
	.byte	0x78
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL27
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL29
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL31
	.4byte	.LVL32
	.2byte	0x3
	.byte	0x78
	.byte	0x74
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL22
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL31
	.4byte	.LFE42
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x6
	.byte	0x3
	.4byte	clk_gate_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL18
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE40
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL9
	.4byte	.LVL12
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL14
	.4byte	.LFE40
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL4
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL8
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3
	.4byte	.LVL7
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x64
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.4byte	.LFB48
	.4byte	.LFE48-.LFB48
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB6
	.4byte	.LBE6
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	0
	.4byte	0
	.4byte	.LBB10
	.4byte	.LBE10
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB15
	.4byte	.LBE15
	.4byte	0
	.4byte	0
	.4byte	.LFB46
	.4byte	.LFE46
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	.LFB40
	.4byte	.LFE40
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB43
	.4byte	.LFE43
	.4byte	.LFB44
	.4byte	.LFE44
	.4byte	.LFB45
	.4byte	.LFE45
	.4byte	.LFB47
	.4byte	.LFE47
	.4byte	.LFB48
	.4byte	.LFE48
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF94:
	.string	"CLK_I2C_PERI"
.LASF156:
	.string	"clk_unused"
.LASF51:
	.string	"user_data"
.LASF89:
	.string	"SCLK_SFC_2X"
.LASF34:
	.string	"timeout_tick"
.LASF74:
	.string	"CLK_UART0_SRC"
.LASF115:
	.string	"eCLOCK_Name"
.LASF42:
	.string	"stat"
.LASF15:
	.string	"init_fn_t"
.LASF13:
	.string	"rt_err_t"
.LASF144:
	.string	"PWR_CTRL_PWR_EN"
.LASF188:
	.string	"rt_mutex_release"
.LASF179:
	.string	"g_clk_init"
.LASF17:
	.string	"prev"
.LASF118:
	.string	"HAL_BUSY"
.LASF173:
	.string	"gate"
.LASF194:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF24:
	.string	"type"
.LASF85:
	.string	"MCLK_SAI"
.LASF29:
	.string	"rt_timer"
.LASF38:
	.string	"entry"
.LASF120:
	.string	"HAL_INVAL"
.LASF163:
	.string	"clks"
.LASF93:
	.string	"CLK_I2C_PMU"
.LASF142:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF136:
	.string	"GRF_PUL_INFO"
.LASF16:
	.string	"next"
.LASF84:
	.string	"CLK_SAI_FRAC"
.LASF21:
	.string	"rt_slist_t"
.LASF4:
	.string	"long long int"
.LASF1:
	.string	"signed char"
.LASF37:
	.string	"tlist"
.LASF170:
	.string	"rate"
.LASF0:
	.string	"long long unsigned int"
.LASF48:
	.string	"remaining_tick"
.LASF166:
	.string	"clk_inits"
.LASF54:
	.string	"rt_mutex"
.LASF20:
	.string	"rt_slist_node"
.LASF30:
	.string	"parent"
.LASF134:
	.string	"PM_RUNTIME_TYPE_END"
.LASF6:
	.string	"rt_uint8_t"
.LASF3:
	.string	"long int"
.LASF81:
	.string	"CLK_UART2_FRAC"
.LASF185:
	.string	"rt_kprintf"
.LASF176:
	.string	"clk_disable"
.LASF174:
	.string	"get_clk_gate_from_id"
.LASF113:
	.string	"LSCLK_VI_ROOT"
.LASF184:
	.string	"HAL_CRU_ClkGetFreq"
.LASF198:
	.string	"__rt_init_clock_dev_init"
.LASF128:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF196:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF104:
	.string	"CLK_COUNTER_PWM0"
.LASF80:
	.string	"CLK_UART2_SRC"
.LASF46:
	.string	"event_set"
.LASF61:
	.string	"CLK_INVALID"
.LASF169:
	.string	"clk_set_rate"
.LASF160:
	.string	"clk_gate_list"
.LASF18:
	.string	"rt_list_t"
.LASF55:
	.string	"value"
.LASF62:
	.string	"PLL_GPLL"
.LASF106:
	.string	"CLK_REF_MIPI0_SRC"
.LASF119:
	.string	"HAL_NODEV"
.LASF122:
	.string	"HAL_TIMEOUT"
.LASF140:
	.string	"GRF_INFO_NUM"
.LASF70:
	.string	"PCLK_PERI_ROOT"
.LASF96:
	.string	"CLK_PWM0"
.LASF97:
	.string	"CLK_PWM1"
.LASF98:
	.string	"CLK_PWM2"
.LASF10:
	.string	"long unsigned int"
.LASF191:
	.string	"HAL_CRU_ClkIsEnabled"
.LASF78:
	.string	"CLK_UART1_FRAC"
.LASF116:
	.string	"HAL_OK"
.LASF23:
	.string	"name"
.LASF71:
	.string	"CLK_TSADC"
.LASF151:
	.string	"ref_count"
.LASF73:
	.string	"CLK_SARADC"
.LASF126:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF8:
	.string	"short unsigned int"
.LASF138:
	.string	"GRF_SRT_INFO"
.LASF87:
	.string	"CCLK_SDMMC0"
.LASF135:
	.string	"GRF_MUX_INFO"
.LASF168:
	.string	"clock_dev_init"
.LASF7:
	.string	"rt_uint16_t"
.LASF133:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF152:
	.string	"node"
.LASF182:
	.string	"HAL_CRU_ClkDisableUnused"
.LASF47:
	.string	"event_info"
.LASF83:
	.string	"CLK_SAI_SRC"
.LASF56:
	.string	"original_priority"
.LASF146:
	.string	"PWR_CTRL_VOLT_ST"
.LASF199:
	.string	"rt_slist_remove"
.LASF161:
	.string	"clk_lock"
.LASF109:
	.string	"CLK_MIPI1_OUT2IO"
.LASF149:
	.string	"gate_id"
.LASF53:
	.string	"suspend_thread"
.LASF154:
	.string	"clk_id"
.LASF186:
	.string	"rt_mutex_init"
.LASF65:
	.string	"CLK_I2C0"
.LASF66:
	.string	"CLK_I2C1"
.LASF67:
	.string	"CLK_I2C2"
.LASF68:
	.string	"CLK_I2C3"
.LASF69:
	.string	"CLK_I2C4"
.LASF9:
	.string	"rt_uint32_t"
.LASF49:
	.string	"thread_timer"
.LASF86:
	.string	"CCLK_EMMC"
.LASF12:
	.string	"rt_ubase_t"
.LASF114:
	.string	"SCLK_SFC_2X_PMU1"
.LASF64:
	.string	"TCLK_WDT_S"
.LASF91:
	.string	"ACLK_PERI_SRC"
.LASF50:
	.string	"cleanup"
.LASF111:
	.string	"CLK_ISP_GPLL_SRC"
.LASF14:
	.string	"rt_tick_t"
.LASF44:
	.string	"init_priority"
.LASF72:
	.string	"CLK_TSADC_TSEN"
.LASF167:
	.string	"clk_dump"
.LASF124:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF193:
	.string	"HAL_CRU_ClkEnable"
.LASF43:
	.string	"current_priority"
.LASF175:
	.string	"clk_is_enabled"
.LASF127:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF181:
	.string	"rt_slist_init"
.LASF35:
	.string	"rt_thread"
.LASF197:
	.string	"CLOCK_Name"
.LASF45:
	.string	"number_mask"
.LASF33:
	.string	"init_tick"
.LASF141:
	.string	"_Bool"
.LASF5:
	.string	"unsigned char"
.LASF148:
	.string	"clk_gate"
.LASF77:
	.string	"CLK_UART1_SRC"
.LASF2:
	.string	"short int"
.LASF103:
	.string	"CLK_FREQ_PWM0"
.LASF101:
	.string	"CLK_PKA_CRYPTO"
.LASF139:
	.string	"GRF_SMT_INFO"
.LASF143:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF178:
	.string	"clk_enable"
.LASF88:
	.string	"CCLK_SDMMC1"
.LASF25:
	.string	"flag"
.LASF177:
	.string	"__func__"
.LASF41:
	.string	"error"
.LASF147:
	.string	"PWR_CTRL_MAX"
.LASF105:
	.string	"MCLK_SAI_OUT2IO"
.LASF192:
	.string	"HAL_CRU_ClkDisable"
.LASF137:
	.string	"GRF_DRV_INFO"
.LASF162:
	.string	"gate_lock"
.LASF60:
	.string	"uint32_t"
.LASF183:
	.string	"HAL_CRU_ClkSetFreq"
.LASF117:
	.string	"HAL_ERROR"
.LASF58:
	.string	"owner"
.LASF95:
	.string	"CLK_SPI0"
.LASF190:
	.string	"rt_calloc"
.LASF28:
	.string	"char"
.LASF180:
	.string	"rt_slist_insert"
.LASF108:
	.string	"CLK_MIPI0_OUT2IO"
.LASF27:
	.string	"unsigned int"
.LASF52:
	.string	"rt_ipc_object"
.LASF130:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF153:
	.string	"clk_init"
.LASF100:
	.string	"CLK_CORE_CRYPTO"
.LASF155:
	.string	"init_rate"
.LASF22:
	.string	"rt_object"
.LASF63:
	.string	"TCLK_WDT_NS"
.LASF158:
	.string	"gate_con"
.LASF112:
	.string	"CLK_CORE_ISP"
.LASF39:
	.string	"stack_addr"
.LASF172:
	.string	"put_clk_gate"
.LASF32:
	.string	"parameter"
.LASF157:
	.string	"bank"
.LASF59:
	.string	"__uint32_t"
.LASF187:
	.string	"rt_mutex_take"
.LASF11:
	.string	"rt_base_t"
.LASF129:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF121:
	.string	"HAL_NOSYS"
.LASF57:
	.string	"hold"
.LASF31:
	.string	"timeout_func"
.LASF132:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF150:
	.string	"enable_count"
.LASF36:
	.string	"flags"
.LASF40:
	.string	"stack_size"
.LASF90:
	.string	"LSCLK_PERI_SRC"
.LASF165:
	.string	"clks_unused"
.LASF145:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF131:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF195:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.c"
.LASF75:
	.string	"CLK_UART0_FRAC"
.LASF110:
	.string	"DCLK_VICAP_SRC"
.LASF107:
	.string	"CLK_REF_MIPI1_SRC"
.LASF123:
	.string	"HAL_Status"
.LASF19:
	.string	"rt_list_node"
.LASF92:
	.string	"HCLK_HPMCU_SRC"
.LASF26:
	.string	"list"
.LASF159:
	.string	"gate_val"
.LASF164:
	.string	"clk_disable_unused"
.LASF76:
	.string	"CLK_UART0"
.LASF79:
	.string	"CLK_UART1"
.LASF82:
	.string	"CLK_UART2"
.LASF102:
	.string	"CLK_CORE_RGA"
.LASF171:
	.string	"clk_get_rate"
.LASF189:
	.string	"rt_free"
.LASF99:
	.string	"DCLK_DECOM"
.LASF125:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
