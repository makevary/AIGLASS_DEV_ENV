	.file	"dataqueue.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_data_queue_init,"ax",@progbits
	.align	1
	.globl	rt_data_queue_init
	.type	rt_data_queue_init, @function
rt_data_queue_init:
.LFB19:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/dataqueue.c"
	.loc 1 27 1
	.cfi_startproc
.LVL0:
	.loc 1 28 5
	.loc 1 30 5
	.loc 1 27 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 38 5
	addi	a5,a0,16
.LBB18:
.LBB19:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 49 23
	sw	a5,20(a0)
	.loc 2 49 13
	sw	a5,16(a0)
.LBE19:
.LBE18:
	.loc 1 39 5
	addi	a5,a0,24
	.loc 1 27 1
	mv	s0,a0
	.loc 1 30 23
	sw	a3,32(a0)
	.loc 1 32 5 is_stmt 1
	.loc 1 32 17 is_stmt 0
	sh	a1,0(a0)
	.loc 1 33 5 is_stmt 1
	.loc 1 33 16 is_stmt 0
	sh	a2,2(a0)
	.loc 1 35 5 is_stmt 1
	.loc 1 36 5
	.loc 1 35 22 is_stmt 0
	sw	zero,8(a0)
	.loc 1 38 5 is_stmt 1
.LBB21:
.LBB20:
	.loc 2 49 5
.LBE20:
.LBE21:
	.loc 1 39 5
.LVL1:
.LBB22:
.LBB23:
	.loc 2 49 5
	.loc 2 49 23 is_stmt 0
	sw	a5,28(a0)
	.loc 2 49 13
	sw	a5,24(a0)
.LVL2:
.LBE23:
.LBE22:
	.loc 1 41 5 is_stmt 1
	.loc 1 41 43 is_stmt 0
	slli	a0,a1,3
.LVL3:
	call	rt_malloc
.LVL4:
	.loc 1 41 18
	sw	a0,12(s0)
	.loc 1 42 5 is_stmt 1
	.loc 1 42 8 is_stmt 0
	bne	a0,zero,.L3
	.loc 1 44 16
	li	a0,-5
.L1:
	.loc 1 48 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL5:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL6:
.L3:
	.cfi_restore_state
	.loc 1 47 12
	li	a0,0
	j	.L1
	.cfi_endproc
.LFE19:
	.size	rt_data_queue_init, .-rt_data_queue_init
	.section	.text.rt_data_queue_push,"ax",@progbits
	.align	1
	.globl	rt_data_queue_push
	.type	rt_data_queue_push, @function
rt_data_queue_push:
.LFB20:
	.loc 1 55 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 56 5
	.loc 1 57 5
	.loc 1 58 5
	.loc 1 60 5
	.loc 1 62 5
	.loc 1 63 5
	.loc 1 55 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	mv	s0,a0
	mv	s5,a1
	mv	s4,a2
	sw	a3,12(sp)
	sw	s3,44(sp)
	.cfi_offset 19, -20
	.loc 1 63 14
	call	rt_thread_self
.LVL8:
	mv	s1,a0
.LVL9:
	.loc 1 65 5 is_stmt 1
	.loc 1 65 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL10:
	mv	s2,a0
.LVL11:
	.loc 1 66 5 is_stmt 1
	.loc 1 84 9 is_stmt 0
	addi	s6,s1,20
	addi	s8,s0,16
	.loc 1 89 13
	addi	s7,s1,76
.LVL12:
.L6:
	.loc 1 66 11 is_stmt 1
	.loc 1 66 17 is_stmt 0
	lhu	a4,10(s0)
	.loc 1 66 36
	lhu	a3,8(s0)
	.loc 1 66 56
	lhu	a5,0(s0)
	.loc 1 66 29
	sub	a3,a4,a3
	.loc 1 66 11
	beq	a3,a5,.L9
	.loc 1 107 5 is_stmt 1
	.loc 1 107 35 is_stmt 0
	remu	a5,a4,a5
	.loc 1 107 17
	lw	a3,12(s0)
.LBB24:
.LBB25:
	.loc 2 100 13
	lw	a0,24(s0)
.LBE25:
.LBE24:
	.loc 1 109 22
	addi	a4,a4,1
	.loc 1 129 1
	li	s3,0
	.loc 1 107 17
	slli	a5,a5,3
	add	a5,a3,a5
	.loc 1 107 59
	sw	s5,0(a5)
	.loc 1 108 5 is_stmt 1
	.loc 1 108 60 is_stmt 0
	sw	s4,4(a5)
	.loc 1 109 5 is_stmt 1
	.loc 1 109 22 is_stmt 0
	sh	a4,10(s0)
	.loc 1 112 5 is_stmt 1
.LVL13:
.LBB27:
.LBB26:
	.loc 2 100 5
.LBE26:
.LBE27:
	.loc 1 112 26 is_stmt 0
	addi	a5,s0,24
	.loc 1 112 8
	beq	a0,a5,.L7
	.loc 1 115 9 is_stmt 1
.LVL14:
	.loc 1 120 9
	addi	a0,a0,-20
.LVL15:
	call	rt_thread_resume
.LVL16:
	.loc 1 121 9
	mv	a0,s2
	call	rt_hw_interrupt_enable
.LVL17:
	.loc 1 124 9
	call	rt_schedule
.LVL18:
	.loc 1 126 9
.L5:
	.loc 1 137 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
.LVL19:
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s4,40(sp)
	.cfi_restore 20
.LVL20:
	lw	s5,36(sp)
	.cfi_restore 21
.LVL21:
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
.LVL22:
	mv	a0,s3
	lw	s3,44(sp)
	.cfi_restore 19
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.LVL23:
.L9:
	.cfi_restore_state
	.loc 1 69 9 is_stmt 1
	.loc 1 69 12 is_stmt 0
	lw	a5,12(sp)
	beq	a5,zero,.L11
	.loc 1 77 9 is_stmt 1
	.loc 1 80 9
	.loc 1 80 23 is_stmt 0
	sw	zero,48(s1)
	.loc 1 83 9 is_stmt 1
	mv	a0,s1
	call	rt_thread_suspend
.LVL24:
	.loc 1 84 9
.LBB28:
.LBB29:
	.loc 2 75 5
	.loc 2 75 6 is_stmt 0
	lw	a5,20(s0)
	.loc 2 75 19
	sw	s6,0(a5)
	.loc 2 76 5 is_stmt 1
	.loc 2 76 13 is_stmt 0
	sw	a5,24(s1)
	.loc 2 78 5 is_stmt 1
.LBE29:
.LBE28:
	.loc 1 86 12 is_stmt 0
	lw	a5,12(sp)
.LBB31:
.LBB30:
	.loc 2 78 13
	sw	s6,20(s0)
	.loc 2 79 5 is_stmt 1
	.loc 2 79 13 is_stmt 0
	sw	s8,20(s1)
.LVL25:
.LBE30:
.LBE31:
	.loc 1 86 9 is_stmt 1
	.loc 1 86 12 is_stmt 0
	ble	a5,zero,.L8
	.loc 1 89 13 is_stmt 1
	addi	a2,sp,12
	li	a1,0
	mv	a0,s7
	call	rt_timer_control
.LVL26:
	.loc 1 92 13
	mv	a0,s7
	call	rt_timer_start
.LVL27:
.L8:
	.loc 1 96 9
	mv	a0,s2
	call	rt_hw_interrupt_enable
.LVL28:
	.loc 1 99 9
	call	rt_schedule
.LVL29:
	.loc 1 102 9
	.loc 1 102 16 is_stmt 0
	lw	s3,48(s1)
.LVL30:
	.loc 1 103 9 is_stmt 1
	.loc 1 103 17 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL31:
	mv	s2,a0
	.loc 1 104 9 is_stmt 1
	.loc 1 104 12 is_stmt 0
	beq	s3,zero,.L6
.LVL32:
.L7:
	.loc 1 130 5 is_stmt 1
	mv	a0,s2
	call	rt_hw_interrupt_enable
.LVL33:
	.loc 1 131 5
	.loc 1 131 8 is_stmt 0
	bne	s3,zero,.L5
.LVL34:
	.loc 1 131 31 discriminator 1
	lw	a5,32(s0)
	.loc 1 131 23 discriminator 1
	beq	a5,zero,.L5
	.loc 1 133 9 is_stmt 1
	li	a1,2
	mv	a0,s0
	jalr	a5
.LVL35:
	j	.L5
.LVL36:
.L11:
	.loc 1 71 20 is_stmt 0
	li	s3,-2
	j	.L7
	.cfi_endproc
.LFE20:
	.size	rt_data_queue_push, .-rt_data_queue_push
	.section	.text.rt_data_queue_pop,"ax",@progbits
	.align	1
	.globl	rt_data_queue_pop
	.type	rt_data_queue_pop, @function
rt_data_queue_pop:
.LFB21:
	.loc 1 144 1 is_stmt 1
	.cfi_startproc
.LVL37:
	.loc 1 145 5
	.loc 1 146 5
	.loc 1 147 5
	.loc 1 149 5
	.loc 1 150 5
	.loc 1 151 5
	.loc 1 153 5
	.loc 1 154 5
	.loc 1 144 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	mv	s0,a0
	mv	s5,a1
	mv	s4,a2
	sw	a3,12(sp)
	sw	s3,44(sp)
	.cfi_offset 19, -20
	.loc 1 154 14
	call	rt_thread_self
.LVL38:
	mv	s2,a0
.LVL39:
	.loc 1 156 5 is_stmt 1
	.loc 1 156 13 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL40:
	mv	s1,a0
.LVL41:
	.loc 1 157 5 is_stmt 1
	.loc 1 174 9 is_stmt 0
	addi	s6,s2,20
	addi	s8,s0,24
	.loc 1 179 13
	addi	s7,s2,76
.LVL42:
.L18:
	.loc 1 157 11 is_stmt 1
	.loc 1 157 17 is_stmt 0
	lhu	a5,8(s0)
	.loc 1 157 37
	lhu	a3,10(s0)
	.loc 1 157 11
	beq	a5,a3,.L21
	.loc 1 198 5 is_stmt 1
	.loc 1 198 47 is_stmt 0
	lhu	a4,0(s0)
	.loc 1 198 61
	lw	a2,12(s0)
	.loc 1 231 1
	li	s3,0
	.loc 1 198 47
	remu	a4,a5,a4
	.loc 1 201 22
	addi	a5,a5,1
	slli	a5,a5,16
	srli	a5,a5,16
	.loc 1 198 29
	slli	a4,a4,3
	.loc 1 198 61
	add	a2,a2,a4
	lw	a2,0(a2)
	.loc 1 198 15
	sw	a2,0(s5)
	.loc 1 199 5 is_stmt 1
	.loc 1 199 57 is_stmt 0
	lw	a2,12(s0)
	add	a4,a2,a4
	lw	a4,4(a4)
	.loc 1 199 11
	sw	a4,0(s4)
	.loc 1 201 5 is_stmt 1
	.loc 1 203 55 is_stmt 0
	lhu	a4,2(s0)
	.loc 1 201 22
	sh	a5,8(s0)
	.loc 1 203 5 is_stmt 1
	.loc 1 203 27 is_stmt 0
	sub	a5,a3,a5
	.loc 1 203 8
	bgt	a5,a4,.L19
	.loc 1 206 9 is_stmt 1
.LVL43:
.LBB32:
.LBB33:
	.loc 2 100 5
	.loc 2 100 13 is_stmt 0
	lw	a0,16(s0)
.LVL44:
.LBE33:
.LBE32:
	.loc 1 206 30
	addi	a5,s0,16
	.loc 1 206 12
	beq	a0,a5,.L22
	.loc 1 209 13 is_stmt 1
.LVL45:
	.loc 1 214 13
	addi	a0,a0,-20
.LVL46:
	call	rt_thread_resume
.LVL47:
	.loc 1 215 13
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL48:
	.loc 1 218 13
	call	rt_schedule
.LVL49:
.L23:
	.loc 1 225 9
	.loc 1 225 18 is_stmt 0
	lw	a5,32(s0)
	.loc 1 225 12
	bne	a5,zero,.L24
.L33:
	.loc 1 226 13
	li	s3,0
.LVL50:
.L17:
	.loc 1 239 1
	lw	ra,60(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
.LVL51:
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s4,40(sp)
	.cfi_restore 20
.LVL52:
	lw	s5,36(sp)
	.cfi_restore 21
.LVL53:
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s7,28(sp)
	.cfi_restore 23
	lw	s8,24(sp)
	.cfi_restore 24
.LVL54:
	mv	a0,s3
	lw	s3,44(sp)
	.cfi_restore 19
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.LVL55:
.L21:
	.cfi_restore_state
	.loc 1 160 9 is_stmt 1
	.loc 1 160 12 is_stmt 0
	lw	a5,12(sp)
	beq	a5,zero,.L27
	.loc 1 167 9 is_stmt 1
	.loc 1 170 9
	.loc 1 170 23 is_stmt 0
	sw	zero,48(s2)
	.loc 1 173 9 is_stmt 1
	mv	a0,s2
	call	rt_thread_suspend
.LVL56:
	.loc 1 174 9
.LBB34:
.LBB35:
	.loc 2 75 5
	.loc 2 75 6 is_stmt 0
	lw	a5,28(s0)
	.loc 2 75 19
	sw	s6,0(a5)
	.loc 2 76 5 is_stmt 1
	.loc 2 76 13 is_stmt 0
	sw	a5,24(s2)
	.loc 2 78 5 is_stmt 1
.LBE35:
.LBE34:
	.loc 1 176 12 is_stmt 0
	lw	a5,12(sp)
.LBB37:
.LBB36:
	.loc 2 78 13
	sw	s6,28(s0)
	.loc 2 79 5 is_stmt 1
	.loc 2 79 13 is_stmt 0
	sw	s8,20(s2)
.LVL57:
.LBE36:
.LBE37:
	.loc 1 176 9 is_stmt 1
	.loc 1 176 12 is_stmt 0
	ble	a5,zero,.L20
	.loc 1 179 13 is_stmt 1
	addi	a2,sp,12
	li	a1,0
	mv	a0,s7
	call	rt_timer_control
.LVL58:
	.loc 1 182 13
	mv	a0,s7
	call	rt_timer_start
.LVL59:
.L20:
	.loc 1 186 9
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL60:
	.loc 1 189 9
	call	rt_schedule
.LVL61:
	.loc 1 192 9
	.loc 1 192 16 is_stmt 0
	lw	s3,48(s2)
.LVL62:
	.loc 1 193 9 is_stmt 1
	.loc 1 193 17 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL63:
	mv	s1,a0
	.loc 1 194 9 is_stmt 1
	.loc 1 194 12 is_stmt 0
	beq	s3,zero,.L18
.LVL64:
.L19:
	.loc 1 232 5 is_stmt 1
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL65:
	.loc 1 233 5
	.loc 1 233 8 is_stmt 0
	bne	s3,zero,.L17
.LVL66:
	.loc 1 233 32 discriminator 1
	lw	a5,32(s0)
	.loc 1 233 23 discriminator 1
	beq	a5,zero,.L33
	.loc 1 235 9 is_stmt 1
	li	a1,1
	mv	a0,s0
	jalr	a5
.LVL67:
	j	.L17
.LVL68:
.L22:
	.loc 1 222 13
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL69:
	j	.L23
.LVL70:
.L24:
	.loc 1 226 13
	li	a1,3
	mv	a0,s0
	jalr	a5
.LVL71:
	j	.L33
.LVL72:
.L27:
	.loc 1 162 20 is_stmt 0
	li	s3,-2
	j	.L19
	.cfi_endproc
.LFE21:
	.size	rt_data_queue_pop, .-rt_data_queue_pop
	.section	.text.rt_data_queue_peak,"ax",@progbits
	.align	1
	.globl	rt_data_queue_peak
	.type	rt_data_queue_peak, @function
rt_data_queue_peak:
.LFB22:
	.loc 1 245 1 is_stmt 1
	.cfi_startproc
.LVL73:
	.loc 1 246 5
	.loc 1 248 5
	.loc 1 250 5
	.loc 1 245 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 18, -16
	.cfi_offset 1, -4
	.loc 1 245 1
	mv	s2,a1
	mv	s1,a2
	.loc 1 250 13
	call	rt_hw_interrupt_disable
.LVL74:
	.loc 1 252 5 is_stmt 1
	.loc 1 252 14 is_stmt 0
	lhu	a5,8(s0)
	.loc 1 252 8
	lhu	a4,10(s0)
	bne	a4,a5,.L35
	.loc 1 254 9 is_stmt 1
	call	rt_hw_interrupt_enable
.LVL75:
	.loc 1 256 9
	.loc 1 256 16 is_stmt 0
	li	a0,-4
.L34:
	.loc 1 265 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL76:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL77:
	lw	s2,0(sp)
	.cfi_restore 18
.LVL78:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL79:
.L35:
	.cfi_restore_state
	.loc 1 259 5 is_stmt 1
	.loc 1 259 47 is_stmt 0
	lhu	a4,0(s0)
	remu	a5,a5,a4
	.loc 1 259 61
	lw	a4,12(s0)
	.loc 1 259 29
	slli	a5,a5,3
	.loc 1 259 61
	add	a4,a4,a5
	lw	a4,0(a4)
	.loc 1 259 15
	sw	a4,0(s2)
	.loc 1 260 5 is_stmt 1
	.loc 1 260 57 is_stmt 0
	lw	a4,12(s0)
	add	a5,a4,a5
	lw	a5,4(a5)
	.loc 1 260 11
	sw	a5,0(s1)
	.loc 1 262 5 is_stmt 1
	call	rt_hw_interrupt_enable
.LVL80:
	.loc 1 264 5
	.loc 1 264 12 is_stmt 0
	li	a0,0
	j	.L34
	.cfi_endproc
.LFE22:
	.size	rt_data_queue_peak, .-rt_data_queue_peak
	.section	.text.rt_data_queue_reset,"ax",@progbits
	.align	1
	.globl	rt_data_queue_reset
	.type	rt_data_queue_reset, @function
rt_data_queue_reset:
.LFB23:
	.loc 1 269 1 is_stmt 1
	.cfi_startproc
.LVL81:
	.loc 1 270 5
	.loc 1 271 5
	.loc 1 273 5
	.loc 1 269 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.loc 1 277 29
	addi	s2,s0,24
	.loc 1 273 5
	call	rt_enter_critical
.LVL82:
	.loc 1 277 5 is_stmt 1
	.loc 1 287 23 is_stmt 0
	li	s3,-1
.L39:
	.loc 1 277 11 is_stmt 1
.LVL83:
.LBB38:
.LBB39:
	.loc 2 100 5
.LBE39:
.LBE38:
	.loc 1 277 11 is_stmt 0
	lw	a5,24(s0)
	bne	a5,s2,.L40
	.loc 1 301 29
	addi	s2,s0,16
	.loc 1 311 23
	li	s3,-1
.L41:
	.loc 1 301 11 is_stmt 1
.LVL84:
.LBB40:
.LBB41:
	.loc 2 100 5
.LBE41:
.LBE40:
	.loc 1 301 11 is_stmt 0
	lw	a5,16(s0)
	bne	a5,s2,.L42
	.loc 1 323 5 is_stmt 1
	call	rt_exit_critical
.LVL85:
	.loc 1 325 5
	.loc 1 326 1 is_stmt 0
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL86:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
.LVL87:
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	.loc 1 325 5
	tail	rt_schedule
.LVL88:
.L40:
	.cfi_restore_state
	.loc 1 280 9 is_stmt 1
	.loc 1 280 16 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL89:
	mv	s1,a0
.LVL90:
	.loc 1 283 9 is_stmt 1
	.loc 1 283 74 is_stmt 0
	lw	a0,24(s0)
.LVL91:
	.loc 1 287 9 is_stmt 1
	.loc 1 287 23 is_stmt 0
	sw	s3,28(a0)
	.loc 1 294 9 is_stmt 1
	addi	a0,a0,-20
.LVL92:
	call	rt_thread_resume
.LVL93:
	.loc 1 297 9
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL94:
	j	.L39
.LVL95:
.L42:
	.loc 1 304 9
	.loc 1 304 16 is_stmt 0
	call	rt_hw_interrupt_disable
.LVL96:
	mv	s1,a0
.LVL97:
	.loc 1 307 9 is_stmt 1
	.loc 1 307 75 is_stmt 0
	lw	a0,16(s0)
.LVL98:
	.loc 1 311 9 is_stmt 1
	.loc 1 311 23 is_stmt 0
	sw	s3,28(a0)
	.loc 1 318 9 is_stmt 1
	addi	a0,a0,-20
.LVL99:
	call	rt_thread_resume
.LVL100:
	.loc 1 321 9
	mv	a0,s1
	call	rt_hw_interrupt_enable
.LVL101:
	j	.L41
	.cfi_endproc
.LFE23:
	.size	rt_data_queue_reset, .-rt_data_queue_reset
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/ipc/dataqueue.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa92
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF88
	.byte	0xc
	.4byte	.LASF89
	.4byte	.LASF90
	.4byte	.Ldebug_ranges0+0x60
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
	.byte	0x3
	.4byte	.LASF4
	.byte	0x3
	.byte	0x3b
	.byte	0x15
	.4byte	0x3f
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x3
	.4byte	.LASF5
	.byte	0x3
	.byte	0x3d
	.byte	0x17
	.4byte	0x59
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF7
	.byte	0x3
	.byte	0x3e
	.byte	0x18
	.4byte	0x6c
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.byte	0x3
	.4byte	.LASF9
	.byte	0x3
	.byte	0x3f
	.byte	0x17
	.4byte	0x7f
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x41
	.byte	0xd
	.4byte	0x99
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x3f
	.byte	0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x7f
	.byte	0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x47
	.byte	0x13
	.4byte	0xa0
	.byte	0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x49
	.byte	0x15
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF17
	.byte	0x3
	.byte	0x4b
	.byte	0x14
	.4byte	0xac
	.byte	0x5
	.4byte	.LASF21
	.byte	0x8
	.byte	0x3
	.2byte	0x12c
	.byte	0x8
	.4byte	0x107
	.byte	0x6
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x12e
	.byte	0x1a
	.4byte	0x107
	.byte	0
	.byte	0x6
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x12f
	.byte	0x1a
	.4byte	0x107
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xdc
	.byte	0x8
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x131
	.byte	0x1d
	.4byte	0xdc
	.byte	0x9
	.4byte	0x10d
	.byte	0x5
	.4byte	.LASF22
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x166
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x166
	.byte	0
	.byte	0x6
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF25
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x153
	.byte	0xf
	.4byte	0x10d
	.byte	0xc
	.byte	0
	.byte	0xa
	.4byte	0x17d
	.4byte	0x176
	.byte	0xb
	.4byte	0x176
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
	.4byte	.LASF29
	.byte	0x2c
	.byte	0x3
	.2byte	0x1b1
	.byte	0x8
	.4byte	0x1e7
	.byte	0x6
	.4byte	.LASF30
	.byte	0x3
	.2byte	0x1b3
	.byte	0x16
	.4byte	0x11f
	.byte	0
	.byte	0xc
	.string	"row"
	.byte	0x3
	.2byte	0x1b5
	.byte	0xf
	.4byte	0x1e7
	.byte	0x14
	.byte	0x6
	.4byte	.LASF31
	.byte	0x3
	.2byte	0x1b7
	.byte	0xc
	.4byte	0x204
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x1b8
	.byte	0xb
	.4byte	0x202
	.byte	0x20
	.byte	0x6
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x1ba
	.byte	0xf
	.4byte	0xc4
	.byte	0x24
	.byte	0x6
	.4byte	.LASF34
	.byte	0x3
	.2byte	0x1bb
	.byte	0xf
	.4byte	0xc4
	.byte	0x28
	.byte	0
	.byte	0xa
	.4byte	0x10d
	.4byte	0x1f7
	.byte	0xb
	.4byte	0x176
	.byte	0
	.byte	0
	.byte	0xd
	.4byte	0x202
	.byte	0xe
	.4byte	0x202
	.byte	0
	.byte	0xf
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x1f7
	.byte	0x5
	.4byte	.LASF35
	.byte	0x80
	.byte	0x3
	.2byte	0x1fb
	.byte	0x8
	.4byte	0x34c
	.byte	0x6
	.4byte	.LASF23
	.byte	0x3
	.2byte	0x1fe
	.byte	0xa
	.4byte	0x166
	.byte	0
	.byte	0x6
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x1ff
	.byte	0x10
	.4byte	0x4d
	.byte	0x8
	.byte	0x6
	.4byte	.LASF36
	.byte	0x3
	.2byte	0x200
	.byte	0x10
	.4byte	0x4d
	.byte	0x9
	.byte	0x6
	.4byte	.LASF26
	.byte	0x3
	.2byte	0x206
	.byte	0xf
	.4byte	0x10d
	.byte	0xc
	.byte	0x6
	.4byte	.LASF37
	.byte	0x3
	.2byte	0x207
	.byte	0xf
	.4byte	0x10d
	.byte	0x14
	.byte	0xc
	.string	"sp"
	.byte	0x3
	.2byte	0x20a
	.byte	0xb
	.4byte	0x202
	.byte	0x1c
	.byte	0x6
	.4byte	.LASF38
	.byte	0x3
	.2byte	0x20b
	.byte	0xb
	.4byte	0x202
	.byte	0x20
	.byte	0x6
	.4byte	.LASF32
	.byte	0x3
	.2byte	0x20c
	.byte	0xb
	.4byte	0x202
	.byte	0x24
	.byte	0x6
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x20d
	.byte	0xb
	.4byte	0x202
	.byte	0x28
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x20e
	.byte	0x11
	.4byte	0x73
	.byte	0x2c
	.byte	0x6
	.4byte	.LASF41
	.byte	0x3
	.2byte	0x211
	.byte	0xe
	.4byte	0xb8
	.byte	0x30
	.byte	0x6
	.4byte	.LASF42
	.byte	0x3
	.2byte	0x213
	.byte	0x10
	.4byte	0x4d
	.byte	0x34
	.byte	0x6
	.4byte	.LASF43
	.byte	0x3
	.2byte	0x216
	.byte	0x10
	.4byte	0x4d
	.byte	0x35
	.byte	0x6
	.4byte	.LASF44
	.byte	0x3
	.2byte	0x217
	.byte	0x10
	.4byte	0x4d
	.byte	0x36
	.byte	0x6
	.4byte	.LASF45
	.byte	0x3
	.2byte	0x21c
	.byte	0x11
	.4byte	0x73
	.byte	0x38
	.byte	0x6
	.4byte	.LASF46
	.byte	0x3
	.2byte	0x220
	.byte	0x11
	.4byte	0x73
	.byte	0x3c
	.byte	0x6
	.4byte	.LASF47
	.byte	0x3
	.2byte	0x221
	.byte	0x10
	.4byte	0x4d
	.byte	0x40
	.byte	0x6
	.4byte	.LASF33
	.byte	0x3
	.2byte	0x22d
	.byte	0x10
	.4byte	0xac
	.byte	0x44
	.byte	0x6
	.4byte	.LASF48
	.byte	0x3
	.2byte	0x22e
	.byte	0x10
	.4byte	0xac
	.byte	0x48
	.byte	0x6
	.4byte	.LASF49
	.byte	0x3
	.2byte	0x236
	.byte	0x15
	.4byte	0x184
	.byte	0x4c
	.byte	0x6
	.4byte	.LASF50
	.byte	0x3
	.2byte	0x238
	.byte	0xc
	.4byte	0x35d
	.byte	0x78
	.byte	0x6
	.4byte	.LASF51
	.byte	0x3
	.2byte	0x23f
	.byte	0x11
	.4byte	0x73
	.byte	0x7c
	.byte	0
	.byte	0xd
	.4byte	0x357
	.byte	0xe
	.4byte	0x357
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x20a
	.byte	0x7
	.byte	0x4
	.4byte	0x34c
	.byte	0x8
	.4byte	.LASF52
	.byte	0x3
	.2byte	0x241
	.byte	0x1b
	.4byte	0x357
	.byte	0x7
	.byte	0x4
	.4byte	0x376
	.byte	0x10
	.byte	0x11
	.4byte	.LASF53
	.byte	0x24
	.byte	0x4
	.byte	0x17
	.byte	0x8
	.4byte	0x3fa
	.byte	0x12
	.4byte	.LASF54
	.byte	0x4
	.byte	0x19
	.byte	0x11
	.4byte	0x60
	.byte	0
	.byte	0x13
	.string	"lwm"
	.byte	0x4
	.byte	0x1a
	.byte	0x11
	.4byte	0x60
	.byte	0x2
	.byte	0x12
	.4byte	.LASF55
	.byte	0x4
	.byte	0x1b
	.byte	0xf
	.4byte	0x8d
	.byte	0x4
	.byte	0x12
	.4byte	.LASF56
	.byte	0x4
	.byte	0x1d
	.byte	0x11
	.4byte	0x60
	.byte	0x8
	.byte	0x12
	.4byte	.LASF57
	.byte	0x4
	.byte	0x1e
	.byte	0x11
	.4byte	0x60
	.byte	0xa
	.byte	0x12
	.4byte	.LASF58
	.byte	0x4
	.byte	0x20
	.byte	0x1a
	.4byte	0x422
	.byte	0xc
	.byte	0x12
	.4byte	.LASF59
	.byte	0x4
	.byte	0x22
	.byte	0xf
	.4byte	0x10d
	.byte	0x10
	.byte	0x12
	.4byte	.LASF60
	.byte	0x4
	.byte	0x23
	.byte	0xf
	.4byte	0x10d
	.byte	0x18
	.byte	0x12
	.4byte	.LASF61
	.byte	0x4
	.byte	0x26
	.byte	0xc
	.4byte	0x43e
	.byte	0x20
	.byte	0
	.byte	0x11
	.4byte	.LASF62
	.byte	0x8
	.byte	0x1
	.byte	0x10
	.byte	0x8
	.4byte	0x422
	.byte	0x12
	.4byte	.LASF63
	.byte	0x1
	.byte	0x12
	.byte	0x11
	.4byte	0x370
	.byte	0
	.byte	0x12
	.4byte	.LASF64
	.byte	0x1
	.byte	0x13
	.byte	0xf
	.4byte	0xd0
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x3fa
	.byte	0xd
	.4byte	0x438
	.byte	0xe
	.4byte	0x438
	.byte	0xe
	.4byte	0x73
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x377
	.byte	0x7
	.byte	0x4
	.4byte	0x428
	.byte	0x14
	.4byte	.LASF91
	.byte	0x1
	.2byte	0x10c
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x528
	.byte	0x15
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x10c
	.byte	0x30
	.4byte	0x438
	.4byte	.LLST26
	.byte	0x16
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x10e
	.byte	0x17
	.4byte	0x357
	.4byte	.LLST27
	.byte	0x16
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x10f
	.byte	0x19
	.4byte	0xac
	.4byte	.LLST28
	.byte	0x17
	.4byte	0x9af
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x1
	.2byte	0x115
	.byte	0xd
	.4byte	0x4a9
	.byte	0x18
	.4byte	0x9c0
	.byte	0
	.byte	0x17
	.4byte	0x9af
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x1
	.2byte	0x12d
	.byte	0xd
	.4byte	0x4c4
	.byte	0x18
	.4byte	0x9c0
	.byte	0
	.byte	0x19
	.4byte	.LVL82
	.4byte	0xa11
	.byte	0x19
	.4byte	.LVL85
	.4byte	0xa1d
	.byte	0x1a
	.4byte	.LVL88
	.4byte	0xa29
	.byte	0x19
	.4byte	.LVL89
	.4byte	0xa35
	.byte	0x19
	.4byte	.LVL93
	.4byte	0xa41
	.byte	0x1b
	.4byte	.LVL94
	.4byte	0xa4d
	.4byte	0x505
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL96
	.4byte	0xa35
	.byte	0x19
	.4byte	.LVL100
	.4byte	0xa41
	.byte	0x1d
	.4byte	.LVL101
	.4byte	0xa4d
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1e
	.4byte	.LASF68
	.byte	0x1
	.byte	0xf2
	.byte	0xa
	.4byte	0xb8
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x59e
	.byte	0x1f
	.4byte	.LASF58
	.byte	0x1
	.byte	0xf2
	.byte	0x33
	.4byte	0x438
	.4byte	.LLST22
	.byte	0x1f
	.4byte	.LASF63
	.byte	0x1
	.byte	0xf3
	.byte	0x2a
	.4byte	0x59e
	.4byte	.LLST23
	.byte	0x1f
	.4byte	.LASF54
	.byte	0x1
	.byte	0xf4
	.byte	0x28
	.4byte	0x5a4
	.4byte	.LLST24
	.byte	0x20
	.4byte	.LASF67
	.byte	0x1
	.byte	0xf6
	.byte	0x10
	.4byte	0xac
	.4byte	.LLST25
	.byte	0x19
	.4byte	.LVL74
	.4byte	0xa35
	.byte	0x19
	.4byte	.LVL75
	.4byte	0xa4d
	.byte	0x19
	.4byte	.LVL80
	.4byte	0xa4d
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x370
	.byte	0x7
	.byte	0x4
	.4byte	0xd0
	.byte	0x1e
	.4byte	.LASF69
	.byte	0x1
	.byte	0x8c
	.byte	0xa
	.4byte	0xb8
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x775
	.byte	0x1f
	.4byte	.LASF58
	.byte	0x1
	.byte	0x8c
	.byte	0x32
	.4byte	0x438
	.4byte	.LLST13
	.byte	0x1f
	.4byte	.LASF63
	.byte	0x1
	.byte	0x8d
	.byte	0x29
	.4byte	0x59e
	.4byte	.LLST14
	.byte	0x1f
	.4byte	.LASF54
	.byte	0x1
	.byte	0x8e
	.byte	0x27
	.4byte	0x5a4
	.4byte	.LLST15
	.byte	0x1f
	.4byte	.LASF70
	.byte	0x1
	.byte	0x8f
	.byte	0x27
	.4byte	0x33
	.4byte	.LLST16
	.byte	0x21
	.4byte	.LASF67
	.byte	0x1
	.byte	0x91
	.byte	0x10
	.4byte	0xac
	.byte	0x20
	.4byte	.LASF65
	.byte	0x1
	.byte	0x92
	.byte	0x11
	.4byte	0x363
	.4byte	.LLST17
	.byte	0x20
	.4byte	.LASF71
	.byte	0x1
	.byte	0x93
	.byte	0xe
	.4byte	0xb8
	.4byte	.LLST18
	.byte	0x22
	.4byte	.LASF73
	.byte	0x1
	.byte	0xe7
	.byte	0x1
	.4byte	.L19
	.byte	0x23
	.4byte	0x9af
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.byte	0x1
	.byte	0xce
	.byte	0xe
	.4byte	0x65a
	.byte	0x24
	.4byte	0x9c0
	.4byte	.LLST19
	.byte	0
	.byte	0x25
	.4byte	0x9d1
	.4byte	.LBB34
	.4byte	.Ldebug_ranges0+0x48
	.byte	0x1
	.byte	0xae
	.byte	0x9
	.4byte	0x681
	.byte	0x24
	.4byte	0x9e8
	.4byte	.LLST20
	.byte	0x24
	.4byte	0x9de
	.4byte	.LLST21
	.byte	0
	.byte	0x19
	.4byte	.LVL38
	.4byte	0xa59
	.byte	0x19
	.4byte	.LVL40
	.4byte	0xa35
	.byte	0x19
	.4byte	.LVL47
	.4byte	0xa41
	.byte	0x1b
	.4byte	.LVL48
	.4byte	0xa4d
	.4byte	0x6b0
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL49
	.4byte	0xa29
	.byte	0x1b
	.4byte	.LVL56
	.4byte	0xa65
	.4byte	0x6cd
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LVL58
	.4byte	0xa71
	.4byte	0x6ec
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0x1b
	.4byte	.LVL59
	.4byte	0xa7d
	.4byte	0x700
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LVL60
	.4byte	0xa4d
	.4byte	0x714
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL61
	.4byte	0xa29
	.byte	0x19
	.4byte	.LVL63
	.4byte	0xa35
	.byte	0x1b
	.4byte	.LVL65
	.4byte	0xa4d
	.4byte	0x73a
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LVL67
	.4byte	0x74f
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x1b
	.4byte	.LVL69
	.4byte	0xa4d
	.4byte	0x763
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x27
	.4byte	.LVL71
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x33
	.byte	0
	.byte	0
	.byte	0x1e
	.4byte	.LASF72
	.byte	0x1
	.byte	0x33
	.byte	0xa
	.4byte	0xb8
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x913
	.byte	0x1f
	.4byte	.LASF58
	.byte	0x1
	.byte	0x33
	.byte	0x33
	.4byte	0x438
	.4byte	.LLST5
	.byte	0x1f
	.4byte	.LASF63
	.byte	0x1
	.byte	0x34
	.byte	0x29
	.4byte	0x370
	.4byte	.LLST6
	.byte	0x1f
	.4byte	.LASF64
	.byte	0x1
	.byte	0x35
	.byte	0x27
	.4byte	0xd0
	.4byte	.LLST7
	.byte	0x1f
	.4byte	.LASF70
	.byte	0x1
	.byte	0x36
	.byte	0x28
	.4byte	0x33
	.4byte	.LLST8
	.byte	0x21
	.4byte	.LASF67
	.byte	0x1
	.byte	0x38
	.byte	0x10
	.4byte	0xac
	.byte	0x20
	.4byte	.LASF65
	.byte	0x1
	.byte	0x39
	.byte	0x11
	.4byte	0x363
	.4byte	.LLST9
	.byte	0x20
	.4byte	.LASF71
	.byte	0x1
	.byte	0x3a
	.byte	0xe
	.4byte	0xb8
	.4byte	.LLST10
	.byte	0x22
	.4byte	.LASF73
	.byte	0x1
	.byte	0x81
	.byte	0x1
	.4byte	.L7
	.byte	0x25
	.4byte	0x9af
	.4byte	.LBB24
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x70
	.byte	0xa
	.4byte	0x821
	.byte	0x18
	.4byte	0x9c0
	.byte	0
	.byte	0x25
	.4byte	0x9d1
	.4byte	.LBB28
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x54
	.byte	0x9
	.4byte	0x848
	.byte	0x24
	.4byte	0x9e8
	.4byte	.LLST11
	.byte	0x24
	.4byte	0x9de
	.4byte	.LLST12
	.byte	0
	.byte	0x19
	.4byte	.LVL8
	.4byte	0xa59
	.byte	0x19
	.4byte	.LVL10
	.4byte	0xa35
	.byte	0x19
	.4byte	.LVL16
	.4byte	0xa41
	.byte	0x1b
	.4byte	.LVL17
	.4byte	0xa4d
	.4byte	0x877
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL18
	.4byte	0xa29
	.byte	0x1b
	.4byte	.LVL24
	.4byte	0xa65
	.4byte	0x894
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LVL26
	.4byte	0xa71
	.4byte	0x8b3
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x1c
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0x1b
	.4byte	.LVL27
	.4byte	0xa7d
	.4byte	0x8c7
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LVL28
	.4byte	0xa4d
	.4byte	0x8db
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL29
	.4byte	0xa29
	.byte	0x19
	.4byte	.LVL31
	.4byte	0xa35
	.byte	0x1b
	.4byte	.LVL33
	.4byte	0xa4d
	.4byte	0x901
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x27
	.4byte	.LVL35
	.byte	0x1c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x32
	.byte	0
	.byte	0
	.byte	0x1e
	.4byte	.LASF74
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.4byte	0xb8
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x9af
	.byte	0x1f
	.4byte	.LASF58
	.byte	0x1
	.byte	0x17
	.byte	0x2a
	.4byte	0x438
	.4byte	.LLST0
	.byte	0x1f
	.4byte	.LASF54
	.byte	0x1
	.byte	0x18
	.byte	0x20
	.4byte	0x60
	.4byte	.LLST1
	.byte	0x28
	.string	"lwm"
	.byte	0x1
	.byte	0x19
	.byte	0x20
	.4byte	0x60
	.4byte	.LLST2
	.byte	0x1f
	.4byte	.LASF61
	.byte	0x1
	.byte	0x1a
	.byte	0x1b
	.4byte	0x43e
	.4byte	.LLST3
	.byte	0x25
	.4byte	0x9f9
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x26
	.byte	0x5
	.4byte	0x987
	.byte	0x18
	.4byte	0xa06
	.byte	0
	.byte	0x23
	.4byte	0x9f9
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.byte	0x1
	.byte	0x27
	.byte	0x5
	.4byte	0x9a5
	.byte	0x24
	.4byte	0xa06
	.4byte	.LLST4
	.byte	0
	.byte	0x19
	.4byte	.LVL4
	.4byte	0xa89
	.byte	0
	.byte	0x29
	.4byte	.LASF92
	.byte	0x2
	.byte	0x62
	.byte	0x15
	.4byte	0x99
	.byte	0x3
	.4byte	0x9cb
	.byte	0x2a
	.string	"l"
	.byte	0x2
	.byte	0x62
	.byte	0x36
	.4byte	0x9cb
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x11a
	.byte	0x2b
	.4byte	.LASF75
	.byte	0x2
	.byte	0x49
	.byte	0x16
	.byte	0x3
	.4byte	0x9f3
	.byte	0x2a
	.string	"l"
	.byte	0x2
	.byte	0x49
	.byte	0x37
	.4byte	0x9f3
	.byte	0x2a
	.string	"n"
	.byte	0x2
	.byte	0x49
	.byte	0x45
	.4byte	0x9f3
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x10d
	.byte	0x2b
	.4byte	.LASF76
	.byte	0x2
	.byte	0x2f
	.byte	0x16
	.byte	0x3
	.4byte	0xa11
	.byte	0x2a
	.string	"l"
	.byte	0x2
	.byte	0x2f
	.byte	0x2e
	.4byte	0x9f3
	.byte	0
	.byte	0x2c
	.4byte	.LASF77
	.4byte	.LASF77
	.byte	0x5
	.byte	0xb4
	.byte	0x6
	.byte	0x2c
	.4byte	.LASF78
	.4byte	.LASF78
	.byte	0x5
	.byte	0xb5
	.byte	0x6
	.byte	0x2c
	.4byte	.LASF79
	.4byte	.LASF79
	.byte	0x5
	.byte	0xb0
	.byte	0x6
	.byte	0x2c
	.4byte	.LASF80
	.4byte	.LASF80
	.byte	0x6
	.byte	0x5f
	.byte	0xb
	.byte	0x2c
	.4byte	.LASF81
	.4byte	.LASF81
	.byte	0x5
	.byte	0x90
	.byte	0xa
	.byte	0x2c
	.4byte	.LASF82
	.4byte	.LASF82
	.byte	0x6
	.byte	0x60
	.byte	0x6
	.byte	0x2c
	.4byte	.LASF83
	.4byte	.LASF83
	.byte	0x5
	.byte	0x85
	.byte	0xd
	.byte	0x2c
	.4byte	.LASF84
	.4byte	.LASF84
	.byte	0x5
	.byte	0x8f
	.byte	0xa
	.byte	0x2c
	.4byte	.LASF85
	.4byte	.LASF85
	.byte	0x5
	.byte	0x61
	.byte	0xa
	.byte	0x2c
	.4byte	.LASF86
	.4byte	.LASF86
	.byte	0x5
	.byte	0x5f
	.byte	0xa
	.byte	0x2c
	.4byte	.LASF87
	.4byte	.LASF87
	.byte	0x5
	.byte	0xf4
	.byte	0x7
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
	.byte	0x6
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
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
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
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x15
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x1b
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
	.byte	0x1c
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
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
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
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
	.byte	0x23
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
	.byte	0x24
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
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
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0x2c
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
.LLST26:
	.4byte	.LVL81
	.4byte	.LVL82-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL82-1
	.4byte	.LVL86
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL86
	.4byte	.LVL87
	.2byte	0x3
	.byte	0x82
	.byte	0x70
	.byte	0x9f
	.4byte	.LVL87
	.4byte	.LVL88
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL88
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL91
	.4byte	.LVL92
	.2byte	0x3
	.byte	0x7a
	.byte	0x6c
	.byte	0x9f
	.4byte	.LVL92
	.4byte	.LVL93-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL98
	.4byte	.LVL99
	.2byte	0x3
	.byte	0x7a
	.byte	0x6c
	.byte	0x9f
	.4byte	.LVL99
	.4byte	.LVL100-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL90
	.4byte	.LVL95
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL97
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL73
	.4byte	.LVL74-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL74-1
	.4byte	.LVL76
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL76
	.4byte	.LVL79
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL73
	.4byte	.LVL74-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL74-1
	.4byte	.LVL78
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL73
	.4byte	.LVL74-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL74-1
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL77
	.4byte	.LVL79
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL74
	.4byte	.LVL75-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL79
	.4byte	.LVL80-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL38-1
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL51
	.4byte	.LVL54
	.2byte	0x3
	.byte	0x88
	.byte	0x68
	.byte	0x9f
	.4byte	.LVL54
	.4byte	.LVL55
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL38-1
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x65
	.4byte	.LVL53
	.4byte	.LVL55
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x65
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL38-1
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL52
	.4byte	.LVL55
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL39
	.4byte	.LVL40-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL40-1
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x3
	.byte	0x7a
	.byte	0x6c
	.byte	0x9f
	.4byte	.LVL46
	.4byte	.LVL47-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL55
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL72
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL37
	.4byte	.LVL50
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL55
	.4byte	.LVL62
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL62
	.4byte	.LVL66
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL68
	.4byte	.LFE21
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x3
	.byte	0x78
	.byte	0x10
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL56
	.4byte	.LVL57
	.2byte	0x1
	.byte	0x66
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL56
	.4byte	.LVL57
	.2byte	0x3
	.byte	0x78
	.byte	0x18
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL8-1
	.4byte	.LVL19
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL19
	.4byte	.LVL22
	.2byte	0x3
	.byte	0x88
	.byte	0x70
	.byte	0x9f
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL8-1
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x65
	.4byte	.LVL21
	.4byte	.LVL23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x65
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL8-1
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL20
	.4byte	.LVL23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL7
	.4byte	.LVL8-1
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL9
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x3
	.byte	0x7a
	.byte	0x6c
	.byte	0x9f
	.4byte	.LVL15
	.4byte	.LVL16-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL23
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL7
	.4byte	.LVL18
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL23
	.4byte	.LVL30
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL36
	.4byte	.LFE20
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x66
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL24
	.4byte	.LVL25
	.2byte	0x3
	.byte	0x78
	.byte	0x10
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LFE19
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL4-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL0
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL4-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL0
	.4byte	.LVL4-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL4-1
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5d
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5f
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
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	0
	.4byte	0
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	0
	.4byte	0
	.4byte	.LBB34
	.4byte	.LBE34
	.4byte	.LBB37
	.4byte	.LBE37
	.4byte	0
	.4byte	0
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
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF9:
	.string	"rt_uint32_t"
.LASF71:
	.string	"result"
.LASF7:
	.string	"rt_uint16_t"
.LASF86:
	.string	"rt_timer_start"
.LASF91:
	.string	"rt_data_queue_reset"
.LASF14:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF47:
	.string	"event_info"
.LASF3:
	.string	"long long int"
.LASF20:
	.string	"rt_list_t"
.LASF92:
	.string	"rt_list_isempty"
.LASF68:
	.string	"rt_data_queue_peak"
.LASF72:
	.string	"rt_data_queue_push"
.LASF49:
	.string	"thread_timer"
.LASF53:
	.string	"rt_data_queue"
.LASF37:
	.string	"tlist"
.LASF15:
	.string	"rt_err_t"
.LASF30:
	.string	"parent"
.LASF75:
	.string	"rt_list_insert_before"
.LASF48:
	.string	"remaining_tick"
.LASF77:
	.string	"rt_enter_critical"
.LASF88:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF51:
	.string	"user_data"
.LASF69:
	.string	"rt_data_queue_pop"
.LASF89:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/dataqueue.c"
.LASF31:
	.string	"timeout_func"
.LASF66:
	.string	"temp"
.LASF29:
	.string	"rt_timer"
.LASF11:
	.string	"long long unsigned int"
.LASF84:
	.string	"rt_thread_suspend"
.LASF2:
	.string	"long int"
.LASF85:
	.string	"rt_timer_control"
.LASF59:
	.string	"suspended_push_list"
.LASF13:
	.string	"rt_base_t"
.LASF78:
	.string	"rt_exit_critical"
.LASF58:
	.string	"queue"
.LASF23:
	.string	"name"
.LASF33:
	.string	"init_tick"
.LASF38:
	.string	"entry"
.LASF52:
	.string	"rt_thread_t"
.LASF12:
	.string	"rt_bool_t"
.LASF6:
	.string	"unsigned char"
.LASF81:
	.string	"rt_thread_resume"
.LASF50:
	.string	"cleanup"
.LASF56:
	.string	"get_index"
.LASF90:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF0:
	.string	"signed char"
.LASF36:
	.string	"flags"
.LASF24:
	.string	"type"
.LASF27:
	.string	"unsigned int"
.LASF5:
	.string	"rt_uint8_t"
.LASF74:
	.string	"rt_data_queue_init"
.LASF10:
	.string	"long unsigned int"
.LASF45:
	.string	"number_mask"
.LASF32:
	.string	"parameter"
.LASF87:
	.string	"rt_malloc"
.LASF65:
	.string	"thread"
.LASF8:
	.string	"short unsigned int"
.LASF82:
	.string	"rt_hw_interrupt_enable"
.LASF28:
	.string	"char"
.LASF44:
	.string	"init_priority"
.LASF26:
	.string	"list"
.LASF83:
	.string	"rt_thread_self"
.LASF16:
	.string	"rt_tick_t"
.LASF80:
	.string	"rt_hw_interrupt_disable"
.LASF4:
	.string	"rt_int32_t"
.LASF79:
	.string	"rt_schedule"
.LASF70:
	.string	"timeout"
.LASF60:
	.string	"suspended_pop_list"
.LASF61:
	.string	"evt_notify"
.LASF64:
	.string	"data_size"
.LASF73:
	.string	"__exit"
.LASF21:
	.string	"rt_list_node"
.LASF46:
	.string	"event_set"
.LASF54:
	.string	"size"
.LASF57:
	.string	"put_index"
.LASF67:
	.string	"level"
.LASF62:
	.string	"rt_data_item"
.LASF40:
	.string	"stack_size"
.LASF43:
	.string	"current_priority"
.LASF41:
	.string	"error"
.LASF22:
	.string	"rt_object"
.LASF34:
	.string	"timeout_tick"
.LASF25:
	.string	"flag"
.LASF42:
	.string	"stat"
.LASF55:
	.string	"waiting_lwm"
.LASF19:
	.string	"prev"
.LASF39:
	.string	"stack_addr"
.LASF35:
	.string	"rt_thread"
.LASF17:
	.string	"rt_size_t"
.LASF63:
	.string	"data_ptr"
.LASF18:
	.string	"next"
.LASF76:
	.string	"rt_list_init"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
