	.file	"ringbuffer.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_ringbuffer_init,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_init
	.type	rt_ringbuffer_init, @function
rt_ringbuffer_init:
.LFB21:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/ringbuffer.c"
	.loc 1 32 1
	.cfi_startproc
.LVL0:
	.loc 1 33 5
	.loc 1 34 5
	.loc 1 37 5
	.loc 1 38 5
	.loc 1 42 21 is_stmt 0
	andi	a2,a2,-4
.LVL1:
	.loc 1 37 21
	sw	zero,4(a0)
	.loc 1 41 5 is_stmt 1
	.loc 1 41 20 is_stmt 0
	sw	a1,0(a0)
	.loc 1 42 5 is_stmt 1
	.loc 1 42 21 is_stmt 0
	sh	a2,8(a0)
	.loc 1 43 1
	ret
	.cfi_endproc
.LFE21:
	.size	rt_ringbuffer_init, .-rt_ringbuffer_init
	.section	.text.rt_ringbuffer_putchar_force,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_putchar_force
	.type	rt_ringbuffer_putchar_force, @function
rt_ringbuffer_putchar_force:
.LFB26:
	.loc 1 230 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 231 5
	.loc 1 233 5
	.loc 1 235 5
.LBB8:
.LBB9:
	.loc 1 19 5
	.loc 1 19 29 is_stmt 0
	lw	a5,4(a0)
	.loc 1 26 12
	li	a3,2
	.loc 1 19 11
	slli	a4,a5,16
	.loc 1 19 29
	srli	a2,a5,17
	.loc 1 19 8
	srli	a4,a4,17
	bne	a4,a2,.L3
.LVL3:
.LBB10:
.LBB11:
	.loc 1 21 9 is_stmt 1
	.loc 1 21 34 is_stmt 0
	srli	a3,a5,16
	xor	a3,a3,a5
	.loc 1 22 20
	andi	a3,a3,1
.LVL4:
.L3:
.LBE11:
.LBE10:
.LBE9:
.LBE8:
	.loc 1 237 5 is_stmt 1
	.loc 1 237 37 is_stmt 0
	lw	a5,0(a0)
	add	a5,a5,a2
	sb	a1,0(a5)
	.loc 1 240 5 is_stmt 1
	.loc 1 240 11 is_stmt 0
	lw	a5,4(a0)
	.loc 1 240 30
	lh	a2,8(a0)
	.loc 1 240 11
	srli	a4,a5,17
	.loc 1 240 43
	addi	a2,a2,-1
	.loc 1 240 8
	bne	a4,a2,.L4
	.loc 1 242 9 is_stmt 1
	.loc 1 243 9
	.loc 1 242 31 is_stmt 0
	srli	a5,a5,16
	andi	a5,a5,1
	.loc 1 242 26
	xori	a5,a5,1
	sh	a5,6(a0)
	.loc 1 244 9 is_stmt 1
	.loc 1 244 12 is_stmt 0
	li	a5,1
	bne	a3,a5,.L6
	.loc 1 246 13 is_stmt 1
	.loc 1 247 13
	.loc 1 246 34 is_stmt 0
	lw	a5,4(a0)
	andi	a5,a5,1
	.loc 1 246 29
	xori	a5,a5,1
	sh	a5,4(a0)
.LVL5:
.L6:
	.loc 1 257 5 is_stmt 1
	.loc 1 258 1 is_stmt 0
	li	a0,1
.LVL6:
	ret
.LVL7:
.L4:
	.loc 1 252 9 is_stmt 1
	.loc 1 252 24 is_stmt 0
	li	a2,32768
	addi	a2,a2,-1
	addi	a4,a4,1
	and	a4,a4,a2
	slli	a5,a5,15
	slli	a1,a4,17
.LVL8:
	srli	a5,a5,15
	or	a5,a5,a1
	sw	a5,4(a0)
	.loc 1 253 9 is_stmt 1
	.loc 1 253 12 is_stmt 0
	li	a1,1
	bne	a3,a1,.L6
	.loc 1 254 13 is_stmt 1
	.loc 1 254 28 is_stmt 0
	li	a3,-65536
.LVL9:
	and	a4,a4,a2
	addi	a3,a3,1
	slli	a4,a4,1
	and	a5,a5,a3
	or	a5,a5,a4
	sw	a5,4(a0)
	j	.L6
	.cfi_endproc
.LFE26:
	.size	rt_ringbuffer_putchar_force, .-rt_ringbuffer_putchar_force
	.section	.text.rt_ringbuffer_data_len,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_data_len
	.type	rt_ringbuffer_data_len, @function
rt_ringbuffer_data_len:
.LFB28:
	.loc 1 293 1 is_stmt 1
	.cfi_startproc
.LVL10:
	.loc 1 294 5
.LBB18:
.LBB19:
	.loc 1 19 5
	.loc 1 19 11 is_stmt 0
	lw	a4,4(a0)
.LBE19:
.LBE18:
	.loc 1 293 1
	mv	a3,a0
.LBB27:
.LBB24:
	.loc 1 19 11
	slli	a5,a4,16
	srli	a5,a5,17
	.loc 1 19 29
	srli	a2,a4,17
	.loc 1 19 8
	beq	a5,a2,.L10
.LVL11:
.LBE24:
.LBE27:
.LBB28:
.LBB29:
	.loc 1 302 9 is_stmt 1
	.loc 1 303 36 is_stmt 0
	sub	a0,a2,a5
.LVL12:
	.loc 1 302 12
	bltu	a5,a2,.L9
	.loc 1 305 13 is_stmt 1
	.loc 1 305 22 is_stmt 0
	lh	a0,8(a3)
	.loc 1 305 54
	sub	a5,a5,a2
	.loc 1 305 36
	sub	a0,a0,a5
.LVL13:
.L9:
.LBE29:
.LBE28:
	.loc 1 307 1
	ret
.LVL14:
.L10:
.LBB30:
.LBB25:
.LBB20:
.LBB21:
	.loc 1 21 9 is_stmt 1
	.loc 1 21 34 is_stmt 0
	srli	a5,a4,16
	.loc 1 21 12
	andi	a5,a5,1
	andi	a4,a4,1
.LBE21:
.LBE20:
.LBE25:
.LBE30:
	.loc 1 297 16
	li	a0,0
.LVL15:
.LBB31:
.LBB26:
.LBB23:
.LBB22:
	.loc 1 21 12
	beq	a4,a5,.L9
	.loc 1 24 13 is_stmt 1
.LVL16:
.LBE22:
.LBE23:
.LBE26:
.LBE31:
	.loc 1 299 9
	.loc 1 299 18 is_stmt 0
	lh	a0,8(a3)
	ret
	.cfi_endproc
.LFE28:
	.size	rt_ringbuffer_data_len, .-rt_ringbuffer_data_len
	.section	.text.rt_ringbuffer_put,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_put
	.type	rt_ringbuffer_put, @function
rt_ringbuffer_put:
.LFB22:
	.loc 1 52 1 is_stmt 1
	.cfi_startproc
.LVL17:
	.loc 1 53 5
	.loc 1 55 5
	.loc 1 58 5
	.loc 1 52 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s3,12(sp)
	.cfi_offset 19, -20
	.loc 1 58 17
	lh	s3,8(a0)
	.loc 1 52 1
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.loc 1 52 1
	mv	s0,a0
	mv	s2,a1
	mv	s4,a2
	.loc 1 58 33
	call	rt_ringbuffer_data_len
.LVL18:
	.loc 1 58 10
	sub	a0,s3,a0
	slli	a0,a0,16
	srli	a0,a0,16
.LVL19:
	.loc 1 61 5 is_stmt 1
	.loc 1 62 16 is_stmt 0
	li	s1,0
	.loc 1 61 8
	beq	a0,zero,.L16
	.loc 1 65 5 is_stmt 1
	mv	s1,a0
	bleu	a0,s4,.L18
	mv	s1,s4
.L18:
.LVL20:
	.loc 1 68 5
	.loc 1 68 29 is_stmt 0
	lw	a0,4(s0)
.LVL21:
	.loc 1 71 9
	slli	s1,s1,16
.LVL22:
	srli	s1,s1,16
	.loc 1 68 29
	srli	a5,a0,17
	.loc 1 71 16
	lw	a0,0(s0)
	.loc 1 68 25
	sub	a2,s3,a5
	.loc 1 71 16
	add	a0,a0,a5
	.loc 1 68 8
	ble	a2,s1,.L19
	.loc 1 71 9 is_stmt 1
	mv	a2,s1
	mv	a1,s2
	call	memcpy
.LVL23:
	.loc 1 74 9
	.loc 1 74 25 is_stmt 0
	lw	a5,4(s0)
	srli	a4,a5,17
	add	a4,s1,a4
	slli	a5,a5,15
	slli	a4,a4,17
	srli	a5,a5,15
	or	a5,a5,a4
	sw	a5,4(s0)
	.loc 1 75 9 is_stmt 1
.L16:
	.loc 1 90 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL24:
	lw	s2,16(sp)
	.cfi_restore 18
.LVL25:
	lw	s3,12(sp)
	.cfi_restore 19
	lw	s4,8(sp)
	.cfi_restore 20
	mv	a0,s1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL26:
.L19:
	.cfi_restore_state
	.loc 1 78 5 is_stmt 1
	mv	a1,s2
	call	memcpy
.LVL27:
	.loc 1 81 5
	.loc 1 82 37 is_stmt 0
	lw	a5,4(s0)
	.loc 1 82 19
	lh	a1,8(s0)
	.loc 1 81 5
	lw	a0,0(s0)
	.loc 1 82 37
	srli	a5,a5,17
	.loc 1 82 33
	sub	a1,a1,a5
	.loc 1 81 5
	sub	a2,s1,a1
	add	a1,s2,a1
	call	memcpy
.LVL28:
	.loc 1 86 5 is_stmt 1
	.loc 1 87 5
	.loc 1 87 53 is_stmt 0
	lw	a4,4(s0)
	.loc 1 87 30
	lhu	a3,8(s0)
	.loc 1 87 53
	srli	a5,a4,17
	.loc 1 87 30
	sub	a5,a5,a3
	.loc 1 86 27
	srli	a4,a4,16
	.loc 1 87 30
	add	a5,s1,a5
	.loc 1 86 27
	andi	a4,a4,1
	.loc 1 86 22
	slli	a5,a5,1
	xori	a4,a4,1
	or	a5,a5,a4
	sh	a5,6(s0)
	.loc 1 89 5 is_stmt 1
	.loc 1 89 12 is_stmt 0
	j	.L16
	.cfi_endproc
.LFE22:
	.size	rt_ringbuffer_put, .-rt_ringbuffer_put
	.section	.text.rt_ringbuffer_put_force,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_put_force
	.type	rt_ringbuffer_put_force, @function
rt_ringbuffer_put_force:
.LFB23:
	.loc 1 101 1 is_stmt 1
	.cfi_startproc
.LVL29:
	.loc 1 102 5
	.loc 1 104 5
	.loc 1 106 5
	.loc 1 101 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s4,8(sp)
	.cfi_offset 20, -24
	.loc 1 106 25
	lh	s4,8(a0)
	.loc 1 101 1
	sw	s5,4(sp)
	sw	s0,24(sp)
	.cfi_offset 21, -28
	.cfi_offset 8, -8
	.loc 1 106 25
	slli	s5,s4,16
	.loc 1 101 1
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.loc 1 101 1
	mv	s2,a0
	mv	s3,a1
	mv	s1,a2
	.loc 1 106 25
	srli	s5,s5,16
	.loc 1 106 41
	call	rt_ringbuffer_data_len
.LVL30:
	.loc 1 106 18
	sub	s0,s5,a0
	slli	s0,s0,16
	srli	s0,s0,16
.LVL31:
	.loc 1 108 5 is_stmt 1
	.loc 1 108 8 is_stmt 0
	ble	s1,s4,.L23
	.loc 1 110 9 is_stmt 1
	.loc 1 110 27 is_stmt 0
	sub	s1,s1,s4
	.loc 1 110 13
	add	s3,s3,s1
.LVL32:
	.loc 1 111 9 is_stmt 1
	.loc 1 111 16 is_stmt 0
	mv	s1,s5
.LVL33:
.L23:
	.loc 1 114 5 is_stmt 1
	.loc 1 114 29 is_stmt 0
	lw	a0,4(s2)
	srli	a5,a0,17
	.loc 1 117 16
	lw	a0,0(s2)
	.loc 1 114 25
	sub	a2,s4,a5
	.loc 1 117 16
	add	a0,a0,a5
	.loc 1 114 8
	ble	a2,s1,.L24
	.loc 1 117 9 is_stmt 1
	mv	a2,s1
	mv	a1,s3
	call	memcpy
.LVL34:
	.loc 1 120 9
	.loc 1 120 25 is_stmt 0
	lw	a4,4(s2)
	li	a1,32768
	addi	a1,a1,-1
	srli	a5,a4,17
	add	a5,s1,a5
	and	a5,a5,a1
	slli	a2,a5,16
	slli	a3,a5,17
	slli	a5,a4,15
	srli	a5,a5,15
	or	a5,a5,a3
	sw	a5,4(s2)
	.loc 1 122 9 is_stmt 1
	.loc 1 120 25 is_stmt 0
	srli	a2,a2,16
	.loc 1 122 12
	bleu	s1,s0,.L22
	.loc 1 123 13 is_stmt 1
	.loc 1 123 28 is_stmt 0
	li	a3,-65536
	and	a4,a2,a1
	addi	a3,a3,1
	slli	a4,a4,1
	and	a5,a5,a3
.L28:
	.loc 1 142 24
	or	a5,a5,a4
	sw	a5,4(s2)
	.loc 1 145 5 is_stmt 1
.L22:
	.loc 1 146 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL35:
	lw	s2,16(sp)
	.cfi_restore 18
.LVL36:
	lw	s3,12(sp)
	.cfi_restore 19
.LVL37:
	lw	s4,8(sp)
	.cfi_restore 20
	lw	s5,4(sp)
	.cfi_restore 21
	mv	a0,s1
	lw	s1,20(sp)
	.cfi_restore 9
.LVL38:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL39:
.L24:
	.cfi_restore_state
	.loc 1 128 5 is_stmt 1
	mv	a1,s3
	call	memcpy
.LVL40:
	.loc 1 131 5
	.loc 1 132 37 is_stmt 0
	lw	a5,4(s2)
	.loc 1 132 19
	lh	a1,8(s2)
	.loc 1 131 5
	lw	a0,0(s2)
	.loc 1 132 37
	srli	a5,a5,17
	.loc 1 132 33
	sub	a1,a1,a5
	.loc 1 131 5
	sub	a2,s1,a1
	add	a1,s3,a1
	call	memcpy
.LVL41:
	.loc 1 136 5 is_stmt 1
	.loc 1 136 27 is_stmt 0
	lw	a4,4(s2)
	.loc 1 136 22
	li	a2,-65536
	addi	a3,a2,-1
	.loc 1 136 27
	srli	a5,a4,16
	andi	a5,a5,1
	.loc 1 136 22
	and	a4,a4,a3
	xori	a5,a5,1
	.loc 1 137 30
	lhu	a3,8(s2)
	.loc 1 136 22
	slli	a5,a5,16
	or	a5,a4,a5
	.loc 1 137 5 is_stmt 1
	.loc 1 137 53 is_stmt 0
	srli	a4,a4,17
	.loc 1 137 30
	sub	a4,a4,a3
	li	a1,32768
	add	a4,s1,a4
	addi	a1,a1,-1
	and	a4,a4,a1
	.loc 1 137 21
	slli	a5,a5,15
	.loc 1 137 30
	slli	a3,a4,16
	.loc 1 137 21
	srli	a5,a5,15
	slli	a4,a4,17
	or	a5,a5,a4
	sw	a5,4(s2)
	.loc 1 139 5 is_stmt 1
	.loc 1 137 30 is_stmt 0
	srli	a3,a3,16
	.loc 1 139 8
	bleu	s1,s0,.L22
	.loc 1 141 9 is_stmt 1
	.loc 1 141 30 is_stmt 0
	andi	a4,a5,1
	.loc 1 141 25
	xori	a4,a4,1
	andi	a5,a5,-2
	or	a5,a5,a4
	.loc 1 142 9 is_stmt 1
	.loc 1 142 24 is_stmt 0
	addi	a2,a2,1
	and	a4,a3,a1
	slli	a4,a4,1
	and	a5,a5,a2
	j	.L28
	.cfi_endproc
.LFE23:
	.size	rt_ringbuffer_put_force, .-rt_ringbuffer_put_force
	.section	.text.rt_ringbuffer_get,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_get
	.type	rt_ringbuffer_get, @function
rt_ringbuffer_get:
.LFB24:
	.loc 1 155 1 is_stmt 1
	.cfi_startproc
.LVL42:
	.loc 1 156 5
	.loc 1 158 5
	.loc 1 161 5
	.loc 1 155 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	ra,28(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 1, -4
	.cfi_offset 18, -16
	.loc 1 155 1
	mv	s0,a0
	mv	s3,a1
	mv	s4,a2
	.loc 1 161 12
	call	rt_ringbuffer_data_len
.LVL43:
	mv	s1,a0
.LVL44:
	.loc 1 164 5 is_stmt 1
	.loc 1 164 8 is_stmt 0
	beq	a0,zero,.L29
	.loc 1 168 5 is_stmt 1
	.loc 1 168 8 is_stmt 0
	bleu	s4,a0,.L31
	.loc 1 169 9 is_stmt 1
	.loc 1 169 16 is_stmt 0
	slli	s4,a0,16
	srli	s4,s4,16
.LVL45:
.L31:
	.loc 1 171 5 is_stmt 1
	.loc 1 171 29 is_stmt 0
	lw	a4,4(s0)
	li	a5,32768
	addi	s2,a5,-1
	srli	a4,a4,1
	.loc 1 171 11
	lh	a2,8(s0)
	.loc 1 171 29
	and	a4,a4,s2
	.loc 1 174 21
	lw	a1,0(s0)
	.loc 1 171 29
	slli	a4,a4,16
	srli	a4,a4,16
	.loc 1 171 25
	sub	a2,a2,a4
	.loc 1 174 21
	add	a1,a1,a4
	.loc 1 174 9
	mv	s1,s4
.LVL46:
	.loc 1 171 8
	ble	a2,s4,.L32
	.loc 1 174 9 is_stmt 1
	mv	a2,s4
	mv	a0,s3
.LVL47:
	call	memcpy
.LVL48:
	.loc 1 177 9
	.loc 1 177 24 is_stmt 0
	lw	a4,4(s0)
	li	a3,-65536
	addi	a3,a3,1
	srli	a5,a4,1
	and	a5,a5,s2
	add	a5,s4,a5
	slli	a5,a5,16
	srli	a5,a5,16
	and	a5,a5,s2
	slli	a5,a5,1
	and	a4,a4,a3
	or	a5,a4,a5
	sw	a5,4(s0)
	.loc 1 178 9 is_stmt 1
.LVL49:
.L29:
	.loc 1 193 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL50:
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
.LVL51:
	lw	s4,8(sp)
	.cfi_restore 20
	mv	a0,s1
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL52:
.L32:
	.cfi_restore_state
	.loc 1 181 5 is_stmt 1
	mv	a0,s3
.LVL53:
	call	memcpy
.LVL54:
	.loc 1 184 5
	.loc 1 184 37 is_stmt 0
	lw	a5,4(s0)
	.loc 1 184 19
	lh	a0,8(s0)
	.loc 1 184 5
	lw	a1,0(s0)
	.loc 1 184 37
	srli	a5,a5,1
	and	a5,a5,s2
	slli	a5,a5,16
	srli	a5,a5,16
	.loc 1 184 33
	sub	a0,a0,a5
	.loc 1 184 5
	sub	a2,s4,a0
	add	a0,s3,a0
	call	memcpy
.LVL55:
	.loc 1 189 5 is_stmt 1
	.loc 1 190 5
	.loc 1 190 52 is_stmt 0
	lw	a4,4(s0)
	.loc 1 190 29
	lhu	a3,8(s0)
	.loc 1 190 52
	srli	a5,a4,1
	and	a5,a5,s2
	.loc 1 190 29
	sub	a5,a5,a3
	add	a5,s4,a5
	.loc 1 189 26
	andi	a4,a4,1
	.loc 1 189 21
	slli	a5,a5,1
	xori	a4,a4,1
	or	a5,a5,a4
	sh	a5,4(s0)
	.loc 1 192 5 is_stmt 1
	.loc 1 192 12 is_stmt 0
	j	.L29
	.cfi_endproc
.LFE24:
	.size	rt_ringbuffer_get, .-rt_ringbuffer_get
	.section	.text.rt_ringbuffer_putchar,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_putchar
	.type	rt_ringbuffer_putchar, @function
rt_ringbuffer_putchar:
.LFB25:
	.loc 1 200 1 is_stmt 1
	.cfi_startproc
.LVL56:
	.loc 1 201 5
	.loc 1 204 5
	.loc 1 200 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	mv	s0,a0
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 200 1
	mv	s1,a1
	.loc 1 204 31
	call	rt_ringbuffer_data_len
.LVL57:
	.loc 1 204 15
	lh	a5,8(s0)
	.loc 1 204 8
	beq	a5,a0,.L40
	.loc 1 207 5 is_stmt 1
	.loc 1 207 22 is_stmt 0
	lw	a5,4(s0)
	srli	a4,a5,17
	.loc 1 207 37
	lw	a5,0(s0)
	add	a5,a5,a4
	sb	s1,0(a5)
	.loc 1 210 5 is_stmt 1
	.loc 1 210 11 is_stmt 0
	lw	a5,4(s0)
	.loc 1 210 30
	lh	a3,8(s0)
	.loc 1 210 11
	srli	a4,a5,17
	.loc 1 210 43
	addi	a3,a3,-1
	.loc 1 210 8
	bne	a4,a3,.L39
	.loc 1 212 9 is_stmt 1
	.loc 1 213 9
	.loc 1 212 31 is_stmt 0
	srli	a5,a5,16
	andi	a5,a5,1
	.loc 1 212 26
	xori	a5,a5,1
	sh	a5,6(s0)
.L42:
	.loc 1 220 12
	li	a0,1
.L37:
	.loc 1 221 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL58:
	lw	s1,4(sp)
	.cfi_restore 9
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL59:
.L39:
	.cfi_restore_state
	.loc 1 217 9 is_stmt 1
	.loc 1 217 24 is_stmt 0
	addi	a4,a4,1
	slli	a5,a5,15
	slli	a4,a4,17
	srli	a5,a5,15
	or	a5,a5,a4
	sw	a5,4(s0)
	j	.L42
.L40:
	.loc 1 205 16
	li	a0,0
	j	.L37
	.cfi_endproc
.LFE25:
	.size	rt_ringbuffer_putchar, .-rt_ringbuffer_putchar
	.section	.text.rt_ringbuffer_getchar,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_getchar
	.type	rt_ringbuffer_getchar, @function
rt_ringbuffer_getchar:
.LFB27:
	.loc 1 265 1 is_stmt 1
	.cfi_startproc
.LVL60:
	.loc 1 266 5
	.loc 1 269 5
	.loc 1 265 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 265 1
	mv	s0,a0
	mv	s1,a1
	.loc 1 269 10
	call	rt_ringbuffer_data_len
.LVL61:
	.loc 1 269 8
	beq	a0,zero,.L43
	.loc 1 273 5 is_stmt 1
	.loc 1 273 28 is_stmt 0
	lw	a4,4(s0)
	li	a5,32768
	addi	a3,a5,-1
	srli	a4,a4,1
	.loc 1 273 25
	lw	a5,0(s0)
	.loc 1 273 28
	and	a4,a4,a3
	slli	a4,a4,16
	srli	a4,a4,16
	.loc 1 273 25
	add	a4,a5,a4
	lbu	a5,0(a4)
	.loc 1 273 9
	sb	a5,0(s1)
	.loc 1 275 5 is_stmt 1
	.loc 1 275 11 is_stmt 0
	lw	a4,4(s0)
	.loc 1 275 29
	lh	a2,8(s0)
	.loc 1 275 11
	srli	a5,a4,1
	and	a5,a5,a3
	slli	a5,a5,16
	srli	a5,a5,16
	.loc 1 275 42
	addi	a2,a2,-1
	.loc 1 275 8
	bne	a5,a2,.L45
	.loc 1 277 9 is_stmt 1
	.loc 1 278 9
	.loc 1 277 30 is_stmt 0
	andi	a4,a4,1
	.loc 1 277 25
	xori	a4,a4,1
	sh	a4,4(s0)
.L50:
	.loc 1 285 12
	li	a0,1
.L43:
	.loc 1 286 1
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL62:
	lw	s1,4(sp)
	.cfi_restore 9
.LVL63:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL64:
.L45:
	.cfi_restore_state
	.loc 1 282 9 is_stmt 1
	.loc 1 282 23 is_stmt 0
	addi	a5,a5,1
	and	a5,a5,a3
	slli	a5,a5,16
	li	a3,-65536
	srli	a5,a5,16
	addi	a3,a3,1
	slli	a5,a5,1
	and	a4,a4,a3
	or	a5,a4,a5
	sw	a5,4(s0)
	j	.L50
	.cfi_endproc
.LFE27:
	.size	rt_ringbuffer_getchar, .-rt_ringbuffer_getchar
	.section	.text.rt_ringbuffer_reset,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_reset
	.type	rt_ringbuffer_reset, @function
rt_ringbuffer_reset:
.LFB29:
	.loc 1 314 1 is_stmt 1
	.cfi_startproc
.LVL65:
	.loc 1 315 5
	.loc 1 317 5
	.loc 1 318 5
	.loc 1 319 5
	.loc 1 320 5
	.loc 1 317 21 is_stmt 0
	sw	zero,4(a0)
	.loc 1 321 1
	ret
	.cfi_endproc
.LFE29:
	.size	rt_ringbuffer_reset, .-rt_ringbuffer_reset
	.section	.text.rt_ringbuffer_create,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_create
	.type	rt_ringbuffer_create, @function
rt_ringbuffer_create:
.LFB30:
	.loc 1 327 1 is_stmt 1
	.cfi_startproc
.LVL66:
	.loc 1 328 5
	.loc 1 329 5
	.loc 1 331 2
	.loc 1 333 5
	.loc 1 327 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s1,4(sp)
	.cfi_offset 9, -12
	.loc 1 333 10
	andi	s1,a0,-4
.LVL67:
	.loc 1 335 5 is_stmt 1
	.loc 1 335 10 is_stmt 0
	li	a0,12
	.loc 1 327 1
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 335 10
	call	rt_malloc
.LVL68:
	mv	s0,a0
.LVL69:
	.loc 1 336 5 is_stmt 1
	.loc 1 336 8 is_stmt 0
	beq	a0,zero,.L52
	slli	s1,s1,16
.LVL70:
	srli	s1,s1,16
.LVL71:
	.loc 1 339 5 is_stmt 1
	.loc 1 339 12 is_stmt 0
	mv	a0,s1
	call	rt_malloc
.LVL72:
	.loc 1 340 5 is_stmt 1
	.loc 1 340 8 is_stmt 0
	bne	a0,zero,.L54
	.loc 1 342 9 is_stmt 1
	mv	a0,s0
.LVL73:
	call	rt_free
.LVL74:
	.loc 1 343 9
	.loc 1 344 9
	.loc 1 343 12 is_stmt 0
	li	s0,0
.LVL75:
.L52:
	.loc 1 350 1
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
.LVL76:
.L54:
	.cfi_restore_state
.L53:
	.loc 1 346 5 is_stmt 1
.LBB32:
.LBB33:
	.loc 1 33 5
	.loc 1 34 5
	.loc 1 37 5
	.loc 1 38 5
	.loc 1 37 21 is_stmt 0
	sw	zero,4(s0)
	.loc 1 41 5 is_stmt 1
	.loc 1 41 20 is_stmt 0
	sw	a0,0(s0)
	.loc 1 42 5 is_stmt 1
.LVL77:
.LBE33:
.LBE32:
	.loc 1 349 5
.LBB35:
.LBB34:
	.loc 1 42 21 is_stmt 0
	sh	s1,8(s0)
.LBE34:
.LBE35:
	.loc 1 349 12
	j	.L52
	.cfi_endproc
.LFE30:
	.size	rt_ringbuffer_create, .-rt_ringbuffer_create
	.section	.text.rt_ringbuffer_destroy,"ax",@progbits
	.align	1
	.globl	rt_ringbuffer_destroy
	.type	rt_ringbuffer_destroy, @function
rt_ringbuffer_destroy:
.LFB31:
	.loc 1 354 1 is_stmt 1
	.cfi_startproc
.LVL78:
	.loc 1 355 5
	.loc 1 357 5
	.loc 1 354 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 357 5
	lw	a0,0(a0)
.LVL79:
	.loc 1 354 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 357 5
	call	rt_free
.LVL80:
	.loc 1 358 5 is_stmt 1
	mv	a0,s0
	.loc 1 359 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL81:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 358 5
	tail	rt_free
.LVL82:
	.cfi_endproc
.LFE31:
	.size	rt_ringbuffer_destroy, .-rt_ringbuffer_destroy
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/ipc/ringbuffer.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 5 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x6a7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF40
	.byte	0xc
	.4byte	.LASF41
	.4byte	.LASF42
	.4byte	.Ldebug_ranges0+0x58
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x3a
	.byte	0x16
	.4byte	0x38
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
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x5e
	.byte	0x4
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF6
	.byte	0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3e
	.byte	0x18
	.4byte	0x71
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x78
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0x8d
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.byte	0x6
	.byte	0x4
	.4byte	0x4d
	.byte	0x7
	.4byte	.LASF43
	.byte	0xc
	.byte	0x3
	.byte	0x13
	.byte	0x8
	.4byte	0x121
	.byte	0x8
	.4byte	.LASF19
	.byte	0x3
	.byte	0x15
	.byte	0x11
	.4byte	0xb3
	.byte	0
	.byte	0x9
	.4byte	.LASF15
	.byte	0x3
	.byte	0x2c
	.byte	0x11
	.4byte	0x65
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x4
	.byte	0x9
	.4byte	.LASF16
	.byte	0x3
	.byte	0x2d
	.byte	0x11
	.4byte	0x65
	.byte	0x2
	.byte	0xf
	.byte	0
	.byte	0x4
	.byte	0x9
	.4byte	.LASF17
	.byte	0x3
	.byte	0x2e
	.byte	0x11
	.4byte	0x65
	.byte	0x2
	.byte	0x1
	.byte	0xf
	.byte	0x6
	.byte	0x9
	.4byte	.LASF18
	.byte	0x3
	.byte	0x2f
	.byte	0x11
	.4byte	0x65
	.byte	0x2
	.byte	0xf
	.byte	0
	.byte	0x6
	.byte	0x8
	.4byte	.LASF20
	.byte	0x3
	.byte	0x32
	.byte	0x10
	.4byte	0x2c
	.byte	0x8
	.byte	0
	.byte	0xa
	.4byte	.LASF44
	.byte	0x7
	.byte	0x4
	.4byte	0xa5
	.byte	0x3
	.byte	0x35
	.byte	0x6
	.4byte	0x146
	.byte	0xb
	.4byte	.LASF21
	.byte	0
	.byte	0xb
	.4byte	.LASF22
	.byte	0x1
	.byte	0xb
	.4byte	.LASF23
	.byte	0x2
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xb9
	.byte	0xc
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x161
	.byte	0x6
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x18e
	.byte	0xd
	.string	"rb"
	.byte	0x1
	.2byte	0x161
	.byte	0x32
	.4byte	0x146
	.4byte	.LLST32
	.byte	0xe
	.4byte	.LVL80
	.4byte	0x687
	.byte	0xf
	.4byte	.LVL82
	.4byte	0x687
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x11
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x146
	.byte	0x17
	.4byte	0x146
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x251
	.byte	0x12
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x146
	.byte	0x38
	.4byte	0x65
	.4byte	.LLST26
	.byte	0x13
	.string	"rb"
	.byte	0x1
	.2byte	0x148
	.byte	0x1b
	.4byte	0x146
	.4byte	.LLST27
	.byte	0x14
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x149
	.byte	0x11
	.4byte	0xb3
	.4byte	.LLST28
	.byte	0x15
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x15c
	.byte	0x1
	.4byte	.L53
	.byte	0x16
	.4byte	0x59d
	.4byte	.LBB32
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x1
	.2byte	0x15a
	.byte	0x5
	.4byte	0x219
	.byte	0x17
	.4byte	0x5c1
	.4byte	.LLST29
	.byte	0x17
	.4byte	0x5b5
	.4byte	.LLST30
	.byte	0x17
	.4byte	0x5aa
	.4byte	.LLST31
	.byte	0
	.byte	0x18
	.4byte	.LVL68
	.4byte	0x693
	.4byte	0x22c
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3c
	.byte	0
	.byte	0x18
	.4byte	.LVL72
	.4byte	0x693
	.4byte	0x240
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL74
	.4byte	0x687
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x139
	.byte	0x6
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.byte	0x1
	.byte	0x9c
	.4byte	0x277
	.byte	0x1a
	.string	"rb"
	.byte	0x1
	.2byte	0x139
	.byte	0x30
	.4byte	0x146
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x1b
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x124
	.byte	0xb
	.4byte	0x99
	.byte	0x1
	.4byte	0x296
	.byte	0x1c
	.string	"rb"
	.byte	0x1
	.2byte	0x124
	.byte	0x38
	.4byte	0x146
	.byte	0
	.byte	0x11
	.4byte	.LASF29
	.byte	0x1
	.2byte	0x108
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x2e2
	.byte	0xd
	.string	"rb"
	.byte	0x1
	.2byte	0x108
	.byte	0x37
	.4byte	0x146
	.4byte	.LLST24
	.byte	0xd
	.string	"ch"
	.byte	0x1
	.2byte	0x108
	.byte	0x47
	.4byte	0xb3
	.4byte	.LLST25
	.byte	0x19
	.4byte	.LVL61
	.4byte	0x277
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF30
	.byte	0x1
	.byte	0xe5
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x35f
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0xe5
	.byte	0x3d
	.4byte	0x146
	.4byte	.LLST1
	.byte	0x1e
	.string	"ch"
	.byte	0x1
	.byte	0xe5
	.byte	0x52
	.4byte	0x59
	.4byte	.LLST2
	.byte	0x1f
	.4byte	.LASF31
	.byte	0x1
	.byte	0xe7
	.byte	0x1e
	.4byte	0x121
	.4byte	.LLST3
	.byte	0x20
	.4byte	0x5ce
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.byte	0x1
	.byte	0xeb
	.byte	0x11
	.byte	0x17
	.4byte	0x5df
	.4byte	.LLST4
	.byte	0x20
	.4byte	0x5ce
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.byte	0x11
	.byte	0x2a
	.byte	0x17
	.4byte	0x5df
	.4byte	.LLST5
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF32
	.byte	0x1
	.byte	0xc7
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a8
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0xc7
	.byte	0x37
	.4byte	0x146
	.4byte	.LLST22
	.byte	0x1e
	.string	"ch"
	.byte	0x1
	.byte	0xc7
	.byte	0x4c
	.4byte	0x59
	.4byte	.LLST23
	.byte	0x19
	.4byte	.LVL57
	.4byte	0x277
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	.LASF33
	.byte	0x1
	.byte	0x98
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x44d
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0x98
	.byte	0x33
	.4byte	0x146
	.4byte	.LLST18
	.byte	0x1e
	.string	"ptr"
	.byte	0x1
	.byte	0x99
	.byte	0x29
	.4byte	0xb3
	.4byte	.LLST19
	.byte	0x21
	.4byte	.LASF34
	.byte	0x1
	.byte	0x9a
	.byte	0x29
	.4byte	0x65
	.4byte	.LLST20
	.byte	0x1f
	.4byte	.LASF24
	.byte	0x1
	.byte	0x9c
	.byte	0xf
	.4byte	0x99
	.4byte	.LLST21
	.byte	0x18
	.4byte	.LVL43
	.4byte	0x277
	.4byte	0x415
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL48
	.4byte	0x69f
	.4byte	0x42f
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x10
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL54
	.4byte	0x69f
	.4byte	0x443
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LVL55
	.4byte	0x69f
	.byte	0
	.byte	0x1d
	.4byte	.LASF35
	.byte	0x1
	.byte	0x62
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x4f2
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0x62
	.byte	0x39
	.4byte	0x146
	.4byte	.LLST14
	.byte	0x1e
	.string	"ptr"
	.byte	0x1
	.byte	0x63
	.byte	0x2f
	.4byte	0x4f2
	.4byte	.LLST15
	.byte	0x21
	.4byte	.LASF34
	.byte	0x1
	.byte	0x64
	.byte	0x29
	.4byte	0x65
	.4byte	.LLST16
	.byte	0x1f
	.4byte	.LASF36
	.byte	0x1
	.byte	0x66
	.byte	0x11
	.4byte	0x65
	.4byte	.LLST17
	.byte	0x18
	.4byte	.LVL30
	.4byte	0x277
	.4byte	0x4ba
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL34
	.4byte	0x69f
	.4byte	0x4d4
	.byte	0x10
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x10
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL40
	.4byte	0x69f
	.4byte	0x4e8
	.byte	0x10
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LVL41
	.4byte	0x69f
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x59
	.byte	0x1d
	.4byte	.LASF37
	.byte	0x1
	.byte	0x31
	.byte	0xb
	.4byte	0x99
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x59d
	.byte	0x1e
	.string	"rb"
	.byte	0x1
	.byte	0x31
	.byte	0x33
	.4byte	0x146
	.4byte	.LLST10
	.byte	0x1e
	.string	"ptr"
	.byte	0x1
	.byte	0x32
	.byte	0x2f
	.4byte	0x4f2
	.4byte	.LLST11
	.byte	0x21
	.4byte	.LASF34
	.byte	0x1
	.byte	0x33
	.byte	0x29
	.4byte	0x65
	.4byte	.LLST12
	.byte	0x1f
	.4byte	.LASF24
	.byte	0x1
	.byte	0x35
	.byte	0x11
	.4byte	0x65
	.4byte	.LLST13
	.byte	0x18
	.4byte	.LVL18
	.4byte	0x277
	.4byte	0x565
	.byte	0x10
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL23
	.4byte	0x69f
	.4byte	0x57f
	.byte	0x10
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x10
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LVL27
	.4byte	0x69f
	.4byte	0x593
	.byte	0x10
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LVL28
	.4byte	0x69f
	.byte	0
	.byte	0x22
	.4byte	.LASF47
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.byte	0x1
	.4byte	0x5ce
	.byte	0x23
	.string	"rb"
	.byte	0x1
	.byte	0x1d
	.byte	0x2f
	.4byte	0x146
	.byte	0x24
	.4byte	.LASF25
	.byte	0x1
	.byte	0x1e
	.byte	0x25
	.4byte	0xb3
	.byte	0x24
	.4byte	.LASF24
	.byte	0x1
	.byte	0x1f
	.byte	0x24
	.4byte	0x2c
	.byte	0
	.byte	0x25
	.4byte	.LASF48
	.byte	0x1
	.byte	0x11
	.byte	0x2a
	.4byte	0x121
	.byte	0x3
	.4byte	0x5eb
	.byte	0x23
	.string	"rb"
	.byte	0x1
	.byte	0x11
	.byte	0x55
	.4byte	0x146
	.byte	0
	.byte	0x26
	.4byte	0x59d
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x616
	.byte	0x27
	.4byte	0x5aa
	.byte	0x1
	.byte	0x5a
	.byte	0x27
	.4byte	0x5b5
	.byte	0x1
	.byte	0x5b
	.byte	0x17
	.4byte	0x5c1
	.4byte	.LLST0
	.byte	0
	.byte	0x26
	.4byte	0x277
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x687
	.byte	0x17
	.4byte	0x289
	.4byte	.LLST6
	.byte	0x16
	.4byte	0x5ce
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x126
	.byte	0xd
	.4byte	0x66b
	.byte	0x17
	.4byte	0x5df
	.4byte	.LLST7
	.byte	0x28
	.4byte	0x5ce
	.4byte	.LBB20
	.4byte	.Ldebug_ranges0+0x28
	.byte	0x1
	.byte	0x11
	.byte	0x2a
	.byte	0x17
	.4byte	0x5df
	.4byte	.LLST8
	.byte	0
	.byte	0
	.byte	0x29
	.4byte	0x277
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x1
	.2byte	0x124
	.byte	0xb
	.byte	0x17
	.4byte	0x289
	.4byte	.LLST9
	.byte	0
	.byte	0
	.byte	0x2a
	.4byte	.LASF38
	.4byte	.LASF38
	.byte	0x4
	.byte	0xf5
	.byte	0x6
	.byte	0x2a
	.4byte	.LASF39
	.4byte	.LASF39
	.byte	0x4
	.byte	0xf4
	.byte	0x7
	.byte	0x2b
	.4byte	.LASF49
	.4byte	.LASF50
	.byte	0x5
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
	.byte	0x26
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
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xb
	.byte	0xb
	.byte	0xd
	.byte	0xb
	.byte	0xc
	.byte	0xb
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0xa
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x19
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
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
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
	.byte	0x2e
	.byte	0x1
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
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0
	.byte	0
	.byte	0x29
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
	.byte	0x2a
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
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST32:
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL79
	.4byte	.LVL81
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL81
	.4byte	.LVL82-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL82-1
	.4byte	.LFE31
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL67
	.4byte	.LVL70
	.2byte	0x7
	.byte	0x79
	.byte	0
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL70
	.4byte	.LVL71
	.2byte	0x5
	.byte	0x79
	.byte	0
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL69
	.4byte	.LVL74
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL74
	.4byte	.LVL75
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL76
	.4byte	.LFE30
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL72
	.4byte	.LVL73
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL76
	.4byte	.LFE30
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL76
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL60
	.4byte	.LVL61-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL61-1
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL62
	.4byte	.LVL64
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LFE27
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL60
	.4byte	.LVL61-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL61-1
	.4byte	.LVL63
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL63
	.4byte	.LVL64
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LFE27
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LFE26
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL5
	.4byte	.LVL7
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL8
	.4byte	.LFE26
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL7
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL2
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL56
	.4byte	.LVL57-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL57-1
	.4byte	.LVL58
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL58
	.4byte	.LVL59
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL59
	.4byte	.LFE25
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL56
	.4byte	.LVL57-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL57-1
	.4byte	.LFE25
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL42
	.4byte	.LVL43-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL43-1
	.4byte	.LVL50
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL50
	.4byte	.LVL52
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LFE24
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL42
	.4byte	.LVL43-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL43-1
	.4byte	.LVL51
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LFE24
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL42
	.4byte	.LVL43-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL43-1
	.4byte	.LVL45
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL45
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL52
	.4byte	.LFE24
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL46
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL29
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL30-1
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL36
	.4byte	.LVL39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL39
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL29
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL30-1
	.4byte	.LVL37
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL39
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL29
	.4byte	.LVL30-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL30-1
	.4byte	.LVL32
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL32
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x65
	.4byte	.LVL33
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL39
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL31
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL39
	.4byte	.LFE23
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18-1
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL18-1
	.4byte	.LVL25
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL25
	.4byte	.LVL26
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL26
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL17
	.4byte	.LVL18-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL18-1
	.4byte	.LVL20
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL1
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL10
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL11
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5d
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
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	.LBB30
	.4byte	.LBE30
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	0
	.4byte	0
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB23
	.4byte	.LBE23
	.4byte	0
	.4byte	0
	.4byte	.LBB32
	.4byte	.LBE32
	.4byte	.LBB35
	.4byte	.LBE35
	.4byte	0
	.4byte	0
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB29
	.4byte	.LFE29
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF21:
	.string	"RT_RINGBUFFER_EMPTY"
.LASF17:
	.string	"write_mirror"
.LASF42:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF4:
	.string	"rt_int16_t"
.LASF41:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/src/ringbuffer.c"
.LASF30:
	.string	"rt_ringbuffer_putchar_force"
.LASF20:
	.string	"buffer_size"
.LASF25:
	.string	"pool"
.LASF23:
	.string	"RT_RINGBUFFER_HALFFULL"
.LASF16:
	.string	"read_index"
.LASF7:
	.string	"rt_uint16_t"
.LASF29:
	.string	"rt_ringbuffer_getchar"
.LASF47:
	.string	"rt_ringbuffer_init"
.LASF35:
	.string	"rt_ringbuffer_put_force"
.LASF39:
	.string	"rt_malloc"
.LASF0:
	.string	"signed char"
.LASF44:
	.string	"rt_ringbuffer_state"
.LASF18:
	.string	"write_index"
.LASF12:
	.string	"rt_size_t"
.LASF31:
	.string	"old_state"
.LASF38:
	.string	"rt_free"
.LASF40:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF37:
	.string	"rt_ringbuffer_put"
.LASF15:
	.string	"read_mirror"
.LASF6:
	.string	"unsigned char"
.LASF28:
	.string	"rt_ringbuffer_create"
.LASF1:
	.string	"short int"
.LASF27:
	.string	"rt_ringbuffer_reset"
.LASF33:
	.string	"rt_ringbuffer_get"
.LASF13:
	.string	"unsigned int"
.LASF10:
	.string	"long long unsigned int"
.LASF50:
	.string	"__builtin_memcpy"
.LASF9:
	.string	"long unsigned int"
.LASF36:
	.string	"space_length"
.LASF22:
	.string	"RT_RINGBUFFER_FULL"
.LASF8:
	.string	"short unsigned int"
.LASF3:
	.string	"long long int"
.LASF14:
	.string	"char"
.LASF49:
	.string	"memcpy"
.LASF45:
	.string	"exit"
.LASF32:
	.string	"rt_ringbuffer_putchar"
.LASF43:
	.string	"rt_ringbuffer"
.LASF2:
	.string	"long int"
.LASF46:
	.string	"rt_ringbuffer_data_len"
.LASF34:
	.string	"length"
.LASF48:
	.string	"rt_ringbuffer_status"
.LASF26:
	.string	"rt_ringbuffer_destroy"
.LASF19:
	.string	"buffer_ptr"
.LASF24:
	.string	"size"
.LASF11:
	.string	"rt_ubase_t"
.LASF5:
	.string	"rt_uint8_t"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
