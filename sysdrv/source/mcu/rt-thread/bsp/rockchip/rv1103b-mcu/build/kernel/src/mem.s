	.file	"mem.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.plug_holes,"ax",@progbits
	.align	1
	.type	plug_holes, @function
plug_holes:
.LFB17:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/mem.c"
	.loc 1 144 1
	.cfi_startproc
.LVL0:
	.loc 1 145 5
	.loc 1 146 5
	.loc 1 148 5
	.loc 1 149 5
	.loc 1 150 5
	.loc 1 153 5
	.loc 1 153 10 is_stmt 0
	lw	a5,4(a0)
	.loc 1 153 31
	lw	a4,.LANCHOR0
	.loc 1 153 10
	add	a5,a4,a5
.LVL1:
	.loc 1 154 5 is_stmt 1
	.loc 1 154 8 is_stmt 0
	beq	a0,a5,.L2
	.loc 1 154 21 discriminator 1
	lhu	a3,2(a5)
	bne	a3,zero,.L2
	.loc 1 155 25
	lw	a3,.LANCHOR1
	beq	a3,a5,.L2
	.loc 1 161 9 is_stmt 1
	.loc 1 161 19 is_stmt 0
	lla	a3,.LANCHOR2
	.loc 1 161 12
	lw	a2,0(a3)
	bne	a2,a5,.L3
	.loc 1 163 13 is_stmt 1
	.loc 1 163 19 is_stmt 0
	sw	a0,0(a3)
.L3:
	.loc 1 165 9 is_stmt 1
	.loc 1 165 25 is_stmt 0
	lw	a3,4(a5)
	.loc 1 165 19
	sw	a3,4(a0)
	.loc 1 166 9 is_stmt 1
	.loc 1 166 58 is_stmt 0
	lw	a5,4(a5)
.LVL2:
	.loc 1 166 78
	sub	a3,a0,a4
	.loc 1 166 58
	add	a5,a4,a5
	sw	a3,8(a5)
.L2:
	.loc 1 170 5 is_stmt 1
	.loc 1 170 44 is_stmt 0
	lw	a3,8(a0)
	.loc 1 170 10
	add	a5,a4,a3
.LVL3:
	.loc 1 171 5 is_stmt 1
	.loc 1 171 8 is_stmt 0
	beq	a0,a5,.L1
	.loc 1 171 21 discriminator 1
	lhu	a2,2(a5)
	bne	a2,zero,.L1
	.loc 1 174 9 is_stmt 1
	.loc 1 174 19 is_stmt 0
	lla	a2,.LANCHOR2
	.loc 1 174 12
	lw	a1,0(a2)
	bne	a1,a0,.L5
	.loc 1 176 13 is_stmt 1
	.loc 1 176 19 is_stmt 0
	sw	a5,0(a2)
.L5:
	.loc 1 178 9 is_stmt 1
	.loc 1 178 25 is_stmt 0
	lw	a2,4(a0)
	.loc 1 178 20
	sw	a2,4(a5)
	.loc 1 179 9 is_stmt 1
	.loc 1 179 57 is_stmt 0
	lw	a5,4(a0)
.LVL4:
	add	a4,a4,a5
.LVL5:
	sw	a3,8(a4)
.L1:
	.loc 1 181 1
	ret
	.cfi_endproc
.LFE17:
	.size	plug_holes, .-plug_holes
	.section	.text.rt_malloc_sethook,"ax",@progbits
	.align	1
	.globl	rt_malloc_sethook
	.type	rt_malloc_sethook, @function
rt_malloc_sethook:
.LFB15:
	.loc 1 75 1 is_stmt 1
	.cfi_startproc
.LVL6:
	.loc 1 76 5
	.loc 1 76 20 is_stmt 0
	sw	a0,.LANCHOR3,a5
	.loc 1 77 1
	ret
	.cfi_endproc
.LFE15:
	.size	rt_malloc_sethook, .-rt_malloc_sethook
	.section	.text.rt_free_sethook,"ax",@progbits
	.align	1
	.globl	rt_free_sethook
	.type	rt_free_sethook, @function
rt_free_sethook:
.LFB16:
	.loc 1 86 1 is_stmt 1
	.cfi_startproc
.LVL7:
	.loc 1 87 5
	.loc 1 87 18 is_stmt 0
	sw	a0,.LANCHOR4,a5
	.loc 1 88 1
	ret
	.cfi_endproc
.LFE16:
	.size	rt_free_sethook, .-rt_free_sethook
	.section	.rodata.rt_system_heap_init.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"heap"
	.align	2
.LC1:
	.string	"mem init, error begin address 0x%x, and end address 0x%x\n"
	.section	.text.rt_system_heap_init,"ax",@progbits
	.align	1
	.globl	rt_system_heap_init
	.type	rt_system_heap_init, @function
rt_system_heap_init:
.LFB18:
	.loc 1 192 1 is_stmt 1
	.cfi_startproc
.LVL8:
	.loc 1 193 5
	.loc 1 194 5
	.loc 1 195 5
	.loc 1 195 17 is_stmt 0
	andi	a4,a1,-4
.LVL9:
	.loc 1 197 5 is_stmt 1
	.loc 1 200 5
	.loc 1 200 8 is_stmt 0
	li	a3,24
	.loc 1 192 1
	mv	a2,a1
	.loc 1 200 8
	bleu	a4,a3,.L9
	addi	a5,a0,3
.LVL10:
	andi	a5,a5,-4
.LVL11:
	.loc 1 201 21 discriminator 1
	addi	a3,a4,-24
	.loc 1 200 82 discriminator 1
	bltu	a3,a5,.L9
	.loc 1 204 9 is_stmt 1
	.loc 1 204 38 is_stmt 0
	sub	a4,a4,a5
.LVL12:
	.loc 1 204 52
	addi	a3,a4,-24
.LVL13:
	.loc 1 192 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 204 26
	sw	a3,.LANCHOR5,a2
	.loc 1 215 5 is_stmt 1
	.loc 1 222 16 is_stmt 0
	li	a3,8192
	.loc 1 192 1
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 223 34
	addi	a4,a4,-12
	.loc 1 215 14
	lla	s0,.LANCHOR0
	.loc 1 222 16
	addi	a3,a3,-352
	sw	a3,0(a5)
	.loc 1 223 15
	sw	a4,4(a5)
	.loc 1 215 14
	sw	a5,0(s0)
	.loc 1 218 74 is_stmt 1
	.loc 1 221 5
.LVL14:
	.loc 1 222 5
	.loc 1 223 5
	.loc 1 224 5
	.loc 1 224 15 is_stmt 0
	sw	zero,8(a5)
	.loc 1 225 5 is_stmt 1
	.loc 1 231 5
	.loc 1 231 35 is_stmt 0
	add	a5,a5,a4
.LVL15:
	.loc 1 231 14
	sw	a5,.LANCHOR1,a3
	.loc 1 232 5 is_stmt 1
	.loc 1 233 5
	.loc 1 232 21 is_stmt 0
	li	a3,73728
	addi	a3,a3,-352
	sw	a3,0(a5)
	.loc 1 234 5 is_stmt 1
	.loc 1 234 20 is_stmt 0
	sw	a4,4(a5)
	.loc 1 235 5 is_stmt 1
	.loc 1 235 20 is_stmt 0
	sw	a4,8(a5)
	.loc 1 240 5 is_stmt 1
	li	a3,0
	li	a2,1
	lla	a1,.LC0
.LVL16:
	lla	a0,.LANCHOR6
.LVL17:
	call	rt_sem_init
.LVL18:
	.loc 1 243 5
	.loc 1 243 11 is_stmt 0
	lw	a5,0(s0)
	.loc 1 244 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.loc 1 243 11
	sw	a5,.LANCHOR2,a4
	.loc 1 244 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL19:
.L9:
	.loc 1 208 9 is_stmt 1
	mv	a1,a0
.LVL20:
	lla	a0,.LC1
.LVL21:
	tail	rt_kprintf
.LVL22:
	.cfi_endproc
.LFE18:
	.size	rt_system_heap_init, .-rt_system_heap_init
	.section	.text.rt_malloc,"ax",@progbits
	.align	1
	.globl	rt_malloc
	.type	rt_malloc, @function
rt_malloc:
.LFB19:
	.loc 1 260 1
	.cfi_startproc
.LVL23:
	.loc 1 261 5
	.loc 1 262 5
	.loc 1 264 5
	.loc 1 264 8 is_stmt 0
	beq	a0,zero,.L30
	.loc 1 267 5 is_stmt 1
	.loc 1 269 5
	.loc 1 260 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	.cfi_offset 9, -12
	.loc 1 278 14
	lla	s1,.LANCHOR5
	.loc 1 278 8
	lw	a5,0(s1)
	.loc 1 260 1
	sw	s0,24(sp)
	.cfi_offset 8, -8
	.loc 1 269 32
	addi	s0,a0,3
	.loc 1 260 1
	sw	ra,28(sp)
	.cfi_offset 1, -4
	.loc 1 269 37
	andi	s0,s0,-4
	.loc 1 276 5 is_stmt 1
.LVL24:
	.loc 1 278 5
	.loc 1 265 16 is_stmt 0
	li	a0,0
	.loc 1 278 8
	bgtu	s0,a5,.L15
	.loc 1 286 5 is_stmt 1
	li	a5,12
	bgeu	s0,a5,.L17
	li	s0,12
.LVL25:
.L17:
	.loc 1 290 5
	li	a1,-1
	lla	a0,.LANCHOR6
	call	rt_sem_take
.LVL26:
	.loc 1 292 5
	.loc 1 292 16 is_stmt 0
	lla	t1,.LANCHOR2
	lw	a5,0(t1)
	.loc 1 293 33
	lw	a0,0(s1)
	.loc 1 292 36
	lw	a1,.LANCHOR0
	sub	a3,a5,a1
.LVL27:
	.loc 1 293 33
	sub	a4,a0,s0
.LVL28:
.L43:
	.loc 1 293 10 is_stmt 1 discriminator 1
	.loc 1 292 5 is_stmt 0 discriminator 1
	bgtu	a4,a3,.L29
	.loc 1 394 5 is_stmt 1
	lla	a0,.LANCHOR6
	call	rt_sem_release
.LVL29:
	.loc 1 396 5
	.loc 1 396 12 is_stmt 0
	li	a0,0
	j	.L15
.LVL30:
.L29:
	.loc 1 296 9 is_stmt 1
	.loc 1 296 13 is_stmt 0
	add	s1,a1,a3
.LVL31:
	.loc 1 298 9 is_stmt 1
	.loc 1 298 12 is_stmt 0
	lhu	a2,2(s1)
	.loc 1 298 33
	lw	a6,4(s1)
	.loc 1 298 12
	bne	a2,zero,.L33
	.loc 1 298 40 discriminator 1
	sub	a2,a6,a3
	addi	a7,a2,-12
	.loc 1 298 26 discriminator 1
	bltu	a7,s0,.L33
	.loc 1 303 13 is_stmt 1
	.loc 1 337 26 is_stmt 0
	lla	t4,.LANCHOR7
	.loc 1 338 29
	lla	t3,.LANCHOR8
	.loc 1 304 78
	addi	t5,s0,24
	.loc 1 337 26
	lw	a4,0(t4)
	.loc 1 338 29
	lw	t6,0(t3)
	.loc 1 303 16
	bltu	a7,t5,.L19
	.loc 1 316 17 is_stmt 1
	.loc 1 316 22 is_stmt 0
	addi	a2,s0,12
	add	a2,a2,a3
.LVL32:
	.loc 1 319 17 is_stmt 1
	.loc 1 320 29 is_stmt 0
	li	t5,8192
	.loc 1 319 22
	add	a7,a1,a2
.LVL33:
	.loc 1 320 17 is_stmt 1
	.loc 1 321 17
	.loc 1 320 29 is_stmt 0
	addi	t5,t5,-352
	.loc 1 322 28
	sw	a6,4(a7)
	.loc 1 323 28
	sw	a3,8(a7)
	.loc 1 320 29
	sw	t5,0(a7)
	.loc 1 322 17 is_stmt 1
	.loc 1 323 17
	.loc 1 329 17
	.loc 1 330 27 is_stmt 0
	li	a3,1
.LVL34:
	.loc 1 329 27
	sw	a2,4(s1)
	.loc 1 330 17 is_stmt 1
	.loc 1 330 27 is_stmt 0
	sh	a3,2(s1)
	.loc 1 332 17 is_stmt 1
	.loc 1 332 25 is_stmt 0
	lw	a3,4(a7)
	.loc 1 332 52
	addi	a0,a0,12
	.loc 1 332 20
	beq	a3,a0,.L20
	.loc 1 334 21 is_stmt 1
	.loc 1 334 70 is_stmt 0
	add	a3,a1,a3
	sw	a2,8(a3)
.LVL35:
.L20:
	.loc 1 337 17 is_stmt 1
	.loc 1 337 26 is_stmt 0
	addi	a4,a4,12
	add	a4,a4,s0
.LVL36:
.L52:
	.loc 1 353 26
	sw	a4,0(t4)
	.loc 1 354 17 is_stmt 1
	.loc 1 354 20 is_stmt 0
	bleu	a4,t6,.L22
	.loc 1 355 21 is_stmt 1
	.loc 1 355 29 is_stmt 0
	sw	a4,0(t3)
.L22:
	.loc 1 359 13 is_stmt 1
	.loc 1 359 24 is_stmt 0
	li	a4,8192
	addi	a4,a4,-352
	sh	a4,0(s1)
	.loc 1 367 13 is_stmt 1
	.loc 1 367 16 is_stmt 0
	bne	a5,s1,.L24
	.loc 1 370 45
	lw	a3,.LANCHOR1
	li	a4,0
.L25:
	.loc 1 370 23 is_stmt 1
	lhu	a2,2(a5)
	bne	a2,zero,.L26
.L50:
	beq	a4,zero,.L24
	sw	a5,0(t1)
.L24:
	.loc 1 373 17
	.loc 1 376 13
	lla	a0,.LANCHOR6
	call	rt_sem_release
.LVL37:
	.loc 1 377 13
	.loc 1 378 13
	.loc 1 379 13
	.loc 1 384 86
	.loc 1 386 13
	.loc 1 386 18
	.loc 1 386 39 is_stmt 0
	lw	a5,.LANCHOR3
	.loc 1 386 47
	addi	a0,s1,12
	.loc 1 386 21
	beq	a5,zero,.L15
	.loc 1 386 47 is_stmt 1 discriminator 1
	mv	a1,s0
	sw	a0,12(sp)
	jalr	a5
.LVL38:
	.loc 1 386 164 discriminator 1
	.loc 1 390 13 discriminator 1
	.loc 1 390 38 is_stmt 0 discriminator 1
	lw	a0,12(sp)
.LVL39:
.L15:
	.loc 1 397 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL40:
	lw	s1,20(sp)
	.cfi_restore 9
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL41:
.L19:
	.cfi_restore_state
	.loc 1 351 17 is_stmt 1
	.loc 1 351 27 is_stmt 0
	li	a3,1
.LVL42:
	sh	a3,2(s1)
	.loc 1 353 17 is_stmt 1
	.loc 1 353 26 is_stmt 0
	add	a4,a2,a4
	j	.L52
.L26:
	.loc 1 370 36 discriminator 1
	beq	a5,a3,.L50
	.loc 1 371 21 is_stmt 1
	.loc 1 371 48 is_stmt 0
	lw	a5,4(a5)
	li	a4,1
	add	a5,a1,a5
	j	.L25
.LVL43:
.L33:
	mv	a3,a6
.LVL44:
	j	.L43
.LVL45:
.L30:
	.cfi_def_cfa_offset 0
	.cfi_restore 1
	.cfi_restore 8
	.cfi_restore 9
	.loc 1 265 16
	li	a0,0
.LVL46:
	.loc 1 397 1
	ret
	.cfi_endproc
.LFE19:
	.size	rt_malloc, .-rt_malloc
	.section	.text.rt_calloc,"ax",@progbits
	.align	1
	.globl	rt_calloc
	.type	rt_calloc, @function
rt_calloc:
.LFB21:
	.loc 1 513 1 is_stmt 1
	.cfi_startproc
.LVL47:
	.loc 1 514 5
	.loc 1 517 5
	.loc 1 517 9 is_stmt 0
	mul	a2,a0,a1
	.loc 1 513 1
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	ra,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 517 9
	mv	a0,a2
.LVL48:
	sw	a2,12(sp)
	call	rt_malloc
.LVL49:
	mv	s0,a0
.LVL50:
	.loc 1 520 5 is_stmt 1
	.loc 1 520 8 is_stmt 0
	beq	a0,zero,.L53
	.loc 1 521 9 is_stmt 1
	lw	a2,12(sp)
	li	a1,0
	call	rt_memset
.LVL51:
	.loc 1 523 5
.L53:
	.loc 1 524 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_restore 8
.LVL52:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	rt_calloc, .-rt_calloc
	.section	.rodata.rt_free.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"to free a bad data block:\n"
	.align	2
.LC3:
	.string	"mem: 0x%08x, used flag: %d, magic code: 0x%04x\n"
	.section	.text.rt_free,"ax",@progbits
	.align	1
	.globl	rt_free
	.type	rt_free, @function
rt_free:
.LFB22:
	.loc 1 534 1 is_stmt 1
	.cfi_startproc
.LVL53:
	.loc 1 535 5
	.loc 1 537 5
	.loc 1 537 8 is_stmt 0
	beq	a0,zero,.L74
	.loc 1 534 1
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 546 29
	lw	a5,.LANCHOR4
	mv	s0,a0
	.loc 1 540 5 is_stmt 1
	.loc 1 542 5
	.loc 1 544 59
	.loc 1 546 5
	.loc 1 546 10
	.loc 1 546 13 is_stmt 0
	beq	a5,zero,.L62
	.loc 1 546 37 is_stmt 1 discriminator 1
	jalr	a5
.LVL54:
.L62:
	.loc 1 546 66 discriminator 3
	.loc 1 548 5 discriminator 3
	.loc 1 548 28 is_stmt 0 discriminator 3
	lla	s2,.LANCHOR0
	.loc 1 548 8 discriminator 3
	lw	a5,0(s2)
	bgtu	a5,s0,.L59
	.loc 1 548 53 discriminator 1
	lw	a5,.LANCHOR1
	bleu	a5,s0,.L59
.LVL55:
.LBB4:
.LBB5:
	.loc 1 557 5 is_stmt 1
	.loc 1 566 5 is_stmt 0
	li	a1,-1
	lla	a0,.LANCHOR6
	call	rt_sem_take
.LVL56:
	.loc 1 569 8
	lhu	a5,-10(s0)
	.loc 1 557 9
	addi	s1,s0,-12
.LVL57:
	.loc 1 562 78 is_stmt 1
	.loc 1 566 5
	.loc 1 569 5
	.loc 1 569 8 is_stmt 0
	beq	a5,zero,.L64
	.loc 1 569 20
	lhu	a4,-12(s0)
	li	a5,8192
	addi	a5,a5,-352
	beq	a4,a5,.L65
.L64:
	.loc 1 571 9 is_stmt 1
	lla	a0,.LC2
	call	rt_kprintf
.LVL58:
	.loc 1 572 9
	lhu	a3,-12(s0)
	lhu	a2,-10(s0)
	mv	a1,s1
	lla	a0,.LC3
	call	rt_kprintf
.LVL59:
.L65:
	.loc 1 574 5
	.loc 1 575 5
	.loc 1 577 5
	.loc 1 578 16 is_stmt 0
	li	a5,8192
	addi	a5,a5,-352
	sh	a5,-12(s0)
	.loc 1 583 13
	lla	a5,.LANCHOR2
	.loc 1 583 8
	lw	a4,0(a5)
	.loc 1 577 15
	sh	zero,-10(s0)
	.loc 1 578 5 is_stmt 1
	.loc 1 583 5
	.loc 1 583 8 is_stmt 0
	bgeu	s1,a4,.L66
	.loc 1 586 9 is_stmt 1
	.loc 1 586 15 is_stmt 0
	sw	s1,0(a5)
.L66:
	.loc 1 590 5 is_stmt 1
	.loc 1 590 14 is_stmt 0
	lla	a3,.LANCHOR7
	lw	a4,-8(s0)
	lw	a5,0(a3)
	.loc 1 594 5
	mv	a0,s1
	.loc 1 590 14
	sub	a5,a5,a4
	.loc 1 590 49
	lw	a4,0(s2)
	sub	a4,s1,a4
	.loc 1 590 14
	add	a5,a5,a4
	sw	a5,0(a3)
	.loc 1 594 5 is_stmt 1
	call	plug_holes
.LVL60:
	.loc 1 595 5
.LBE5:
.LBE4:
	.loc 1 596 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL61:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
.LVL62:
	lw	s2,0(sp)
	.cfi_restore 18
.LBB8:
.LBB6:
	.loc 1 595 5
	lla	a0,.LANCHOR6
.LBE6:
.LBE8:
	.loc 1 596 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
.LBB9:
.LBB7:
	.loc 1 595 5
	tail	rt_sem_release
.LVL63:
.L59:
	.cfi_restore_state
.LBE7:
.LBE9:
	.loc 1 596 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
.LVL64:
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.LVL65:
.L74:
	ret
	.cfi_endproc
.LFE22:
	.size	rt_free, .-rt_free
	.section	.text.rt_realloc,"ax",@progbits
	.align	1
	.globl	rt_realloc
	.type	rt_realloc, @function
rt_realloc:
.LFB20:
	.loc 1 409 1 is_stmt 1
	.cfi_startproc
.LVL66:
	.loc 1 410 5
	.loc 1 411 5
	.loc 1 412 5
	.loc 1 413 5
	.loc 1 415 5
	.loc 1 418 5
	.loc 1 409 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s2,16(sp)
	.cfi_offset 18, -16
	.loc 1 419 17
	lla	s2,.LANCHOR5
	.loc 1 419 8
	lw	a5,0(s2)
	.loc 1 409 1
	sw	s0,24(sp)
	.cfi_offset 8, -8
	.loc 1 418 33
	addi	s0,a1,3
	.loc 1 409 1
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.loc 1 418 13
	andi	s0,s0,-4
.LVL67:
	.loc 1 419 5 is_stmt 1
	.loc 1 419 8 is_stmt 0
	bltu	a5,s0,.L86
	.loc 1 425 10 is_stmt 1
	.loc 1 425 13 is_stmt 0
	bne	s0,zero,.L79
	.loc 1 427 9 is_stmt 1
	call	rt_free
.LVL68:
	.loc 1 428 9
.L86:
	.loc 1 423 16 is_stmt 0
	li	s2,0
	j	.L77
.LVL69:
.L79:
	mv	s1,a0
	.loc 1 432 5 is_stmt 1
	.loc 1 432 8 is_stmt 0
	bne	a0,zero,.L80
.LVL70:
	.loc 1 433 9 is_stmt 1
	.loc 1 433 16 is_stmt 0
	mv	a0,s0
	.loc 1 497 1
	lw	s0,24(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL71:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
.LVL72:
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	.loc 1 433 16
	tail	rt_malloc
.LVL73:
.L80:
	.cfi_restore_state
	.loc 1 435 5 is_stmt 1
	li	a1,-1
	lla	a0,.LANCHOR6
	call	rt_sem_take
.LVL74:
	.loc 1 437 5
	.loc 1 437 28 is_stmt 0
	lw	a4,.LANCHOR0
	.loc 1 437 8
	bgtu	a4,s1,.L91
	.loc 1 437 53 discriminator 1
	lw	a5,.LANCHOR1
	bgtu	a5,s1,.L82
.LVL75:
.L91:
	.loc 1 482 9 is_stmt 1
	lla	a0,.LANCHOR6
	call	rt_sem_release
.LVL76:
	.loc 1 484 9
	.loc 1 484 16 is_stmt 0
	mv	s2,s1
.LVL77:
.L77:
	.loc 1 497 1
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	mv	a0,s2
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL78:
.L82:
	.cfi_restore_state
	.loc 1 446 5 is_stmt 1
	.loc 1 448 5
	.loc 1 449 15 is_stmt 0
	lw	a1,-8(s1)
	.loc 1 446 9
	addi	a3,s1,-12
.LVL79:
	.loc 1 448 29
	sub	a3,a3,a4
.LVL80:
	.loc 1 449 5 is_stmt 1
	addi	a5,a1,-12
	.loc 1 449 10 is_stmt 0
	sub	s3,a5,a3
.LVL81:
	.loc 1 450 5 is_stmt 1
	.loc 1 450 8 is_stmt 0
	beq	s0,s3,.L91
	.loc 1 458 5 is_stmt 1
	.loc 1 458 72 is_stmt 0
	addi	a2,s0,24
	.loc 1 458 8
	bgeu	a2,s3,.L83
	.loc 1 462 9 is_stmt 1
	.loc 1 462 18 is_stmt 0
	lla	a2,.LANCHOR7
	lw	a0,0(a2)
	sub	a5,a3,a5
	add	a5,a5,a0
	add	a5,a5,s0
	sw	a5,0(a2)
	.loc 1 465 9 is_stmt 1
	.loc 1 465 14 is_stmt 0
	addi	a2,a3,12
	add	s0,a2,s0
.LVL82:
	.loc 1 466 9 is_stmt 1
	.loc 1 467 21 is_stmt 0
	li	a5,8192
	.loc 1 466 14
	add	a0,a4,s0
.LVL83:
	.loc 1 467 9 is_stmt 1
	.loc 1 468 9
	.loc 1 467 21 is_stmt 0
	addi	a5,a5,-352
	sw	a5,0(a0)
	.loc 1 469 9 is_stmt 1
	.loc 1 469 20 is_stmt 0
	sw	a1,4(a0)
	.loc 1 470 9 is_stmt 1
	.loc 1 470 20 is_stmt 0
	sw	a3,8(a0)
	.loc 1 474 9 is_stmt 1
	.loc 1 475 44 is_stmt 0
	lw	a5,0(s2)
	.loc 1 474 19
	sw	s0,-8(s1)
	.loc 1 475 9 is_stmt 1
	.loc 1 475 17 is_stmt 0
	lw	a3,4(a0)
.LVL84:
	.loc 1 475 44
	addi	a5,a5,12
	.loc 1 475 12
	beq	a3,a5,.L84
	.loc 1 477 13 is_stmt 1
	.loc 1 477 62 is_stmt 0
	add	a4,a4,a3
	sw	s0,8(a4)
.LVL85:
.L84:
	.loc 1 480 9 is_stmt 1
	call	plug_holes
.LVL86:
	j	.L91
.LVL87:
.L83:
	.loc 1 486 5
	lla	a0,.LANCHOR6
	call	rt_sem_release
.LVL88:
	.loc 1 489 5
	.loc 1 489 12 is_stmt 0
	mv	a0,s0
	call	rt_malloc
.LVL89:
	mv	s2,a0
.LVL90:
	.loc 1 490 5 is_stmt 1
	.loc 1 490 8 is_stmt 0
	beq	a0,zero,.L77
	.loc 1 492 9 is_stmt 1
	mv	a2,s0
	bleu	s0,s3,.L85
	mv	a2,s3
.L85:
	mv	a1,s1
	mv	a0,s2
.LVL91:
	call	rt_memcpy
.LVL92:
	.loc 1 493 9
	mv	a0,s1
	call	rt_free
.LVL93:
	j	.L77
	.cfi_endproc
.LFE20:
	.size	rt_realloc, .-rt_realloc
	.section	.text.rt_memory_info,"ax",@progbits
	.align	1
	.globl	rt_memory_info
	.type	rt_memory_info, @function
rt_memory_info:
.LFB23:
	.loc 1 603 1
	.cfi_startproc
.LVL94:
	.loc 1 604 5
	.loc 1 604 8 is_stmt 0
	beq	a0,zero,.L93
	.loc 1 605 9 is_stmt 1
	.loc 1 605 16 is_stmt 0
	lw	a5,.LANCHOR5
	sw	a5,0(a0)
.L93:
	.loc 1 606 5 is_stmt 1
	.loc 1 606 8 is_stmt 0
	beq	a1,zero,.L94
	.loc 1 607 9 is_stmt 1
	.loc 1 607 15 is_stmt 0
	lw	a5,.LANCHOR7
	sw	a5,0(a1)
.L94:
	.loc 1 608 5 is_stmt 1
	.loc 1 608 8 is_stmt 0
	beq	a2,zero,.L92
	.loc 1 609 9 is_stmt 1
	.loc 1 609 19 is_stmt 0
	lw	a5,.LANCHOR8
	sw	a5,0(a2)
.L92:
	.loc 1 610 1
	ret
	.cfi_endproc
.LFE23:
	.size	rt_memory_info, .-rt_memory_info
	.section	.bss.heap_sem,"aw",@nobits
	.align	2
	.set	.LANCHOR6,. + 0
	.type	heap_sem, @object
	.size	heap_sem, 32
heap_sem:
	.zero	32
	.section	.sbss.heap_end,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	heap_end, @object
	.size	heap_end, 4
heap_end:
	.zero	4
	.section	.sbss.heap_ptr,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	heap_ptr, @object
	.size	heap_ptr, 4
heap_ptr:
	.zero	4
	.section	.sbss.lfree,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	lfree, @object
	.size	lfree, 4
lfree:
	.zero	4
	.section	.sbss.max_mem,"aw",@nobits
	.align	2
	.set	.LANCHOR8,. + 0
	.type	max_mem, @object
	.size	max_mem, 4
max_mem:
	.zero	4
	.section	.sbss.mem_size_aligned,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	mem_size_aligned, @object
	.size	mem_size_aligned, 4
mem_size_aligned:
	.zero	4
	.section	.sbss.rt_free_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	rt_free_hook, @object
	.size	rt_free_hook, 4
rt_free_hook:
	.zero	4
	.section	.sbss.rt_malloc_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	rt_malloc_hook, @object
	.size	rt_malloc_hook, 4
rt_malloc_hook:
	.zero	4
	.section	.sbss.used_mem,"aw",@nobits
	.align	2
	.set	.LANCHOR7,. + 0
	.type	used_mem, @object
	.size	used_mem, 4
used_mem:
	.zero	4
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x82f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF69
	.byte	0xc
	.4byte	.LASF70
	.4byte	.LASF71
	.4byte	.Ldebug_ranges0+0x20
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
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3e
	.byte	0x18
	.4byte	0x60
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x73
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0x88
	.byte	0x5
	.4byte	.LASF16
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0xcb
	.byte	0x6
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xcb
	.byte	0
	.byte	0x6
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0xcb
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xa0
	.byte	0x8
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xa0
	.byte	0x5
	.4byte	.LASF17
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x125
	.byte	0x6
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x125
	.byte	0
	.byte	0x6
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0xd1
	.byte	0xc
	.byte	0
	.byte	0x9
	.4byte	0x13c
	.4byte	0x135
	.byte	0xa
	.4byte	0x135
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF22
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF23
	.byte	0xb
	.4byte	0x14e
	.byte	0xc
	.4byte	0x14e
	.byte	0
	.byte	0xd
	.byte	0x4
	.byte	0x7
	.byte	0x4
	.4byte	0x143
	.byte	0x5
	.4byte	.LASF24
	.byte	0x1c
	.byte	0x2
	.2byte	0x25b
	.byte	0x8
	.4byte	0x181
	.byte	0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x25d
	.byte	0x16
	.4byte	0xde
	.byte	0
	.byte	0x6
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x25f
	.byte	0xf
	.4byte	0xd1
	.byte	0x14
	.byte	0
	.byte	0x5
	.4byte	.LASF27
	.byte	0x20
	.byte	0x2
	.2byte	0x266
	.byte	0x8
	.4byte	0x1ac
	.byte	0x6
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x268
	.byte	0x1a
	.4byte	0x156
	.byte	0
	.byte	0x6
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x26a
	.byte	0x11
	.4byte	0x54
	.byte	0x1c
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x67
	.byte	0x7
	.byte	0x4
	.4byte	0x41
	.byte	0xb
	.4byte	0x1c8
	.byte	0xc
	.4byte	0x14e
	.byte	0xc
	.4byte	0x94
	.byte	0
	.byte	0xe
	.4byte	.LASF29
	.byte	0x1
	.byte	0x3b
	.byte	0xf
	.4byte	0x1da
	.byte	0x5
	.byte	0x3
	.4byte	rt_malloc_hook
	.byte	0x7
	.byte	0x4
	.4byte	0x1b8
	.byte	0xe
	.4byte	.LASF30
	.byte	0x1
	.byte	0x3c
	.byte	0xf
	.4byte	0x150
	.byte	0x5
	.byte	0x3
	.4byte	rt_free_hook
	.byte	0xf
	.4byte	.LASF31
	.byte	0xc
	.byte	0x1
	.byte	0x5f
	.byte	0x8
	.4byte	0x234
	.byte	0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0x62
	.byte	0x11
	.4byte	0x54
	.byte	0
	.byte	0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0x63
	.byte	0x11
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.4byte	.LASF13
	.byte	0x1
	.byte	0x65
	.byte	0xf
	.4byte	0x94
	.byte	0x4
	.byte	0x10
	.4byte	.LASF14
	.byte	0x1
	.byte	0x65
	.byte	0x15
	.4byte	0x94
	.byte	0x8
	.byte	0
	.byte	0xe
	.4byte	.LASF34
	.byte	0x1
	.byte	0x6d
	.byte	0x14
	.4byte	0x1b2
	.byte	0x5
	.byte	0x3
	.4byte	heap_ptr
	.byte	0xe
	.4byte	.LASF35
	.byte	0x1
	.byte	0x70
	.byte	0x19
	.4byte	0x258
	.byte	0x5
	.byte	0x3
	.4byte	heap_end
	.byte	0x7
	.byte	0x4
	.4byte	0x1f2
	.byte	0xe
	.4byte	.LASF36
	.byte	0x1
	.byte	0x76
	.byte	0x19
	.4byte	0x258
	.byte	0x5
	.byte	0x3
	.4byte	lfree
	.byte	0xe
	.4byte	.LASF37
	.byte	0x1
	.byte	0x78
	.byte	0x1c
	.4byte	0x181
	.byte	0x5
	.byte	0x3
	.4byte	heap_sem
	.byte	0xe
	.4byte	.LASF38
	.byte	0x1
	.byte	0x79
	.byte	0x12
	.4byte	0x94
	.byte	0x5
	.byte	0x3
	.4byte	mem_size_aligned
	.byte	0xe
	.4byte	.LASF39
	.byte	0x1
	.byte	0x7c
	.byte	0x12
	.4byte	0x94
	.byte	0x5
	.byte	0x3
	.4byte	used_mem
	.byte	0xe
	.4byte	.LASF40
	.byte	0x1
	.byte	0x7c
	.byte	0x1c
	.4byte	0x94
	.byte	0x5
	.byte	0x3
	.4byte	max_mem
	.byte	0x11
	.4byte	.LASF53
	.byte	0x1
	.2byte	0x258
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x2fd
	.byte	0x12
	.4byte	.LASF41
	.byte	0x1
	.2byte	0x258
	.byte	0x22
	.4byte	0x1ac
	.byte	0x1
	.byte	0x5a
	.byte	0x12
	.4byte	.LASF33
	.byte	0x1
	.2byte	0x259
	.byte	0x22
	.4byte	0x1ac
	.byte	0x1
	.byte	0x5b
	.byte	0x12
	.4byte	.LASF42
	.byte	0x1
	.2byte	0x25a
	.byte	0x22
	.4byte	0x1ac
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x13
	.4byte	.LASF72
	.byte	0x1
	.2byte	0x215
	.byte	0x6
	.byte	0x1
	.4byte	0x326
	.byte	0x14
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x215
	.byte	0x14
	.4byte	0x14e
	.byte	0x15
	.string	"mem"
	.byte	0x1
	.2byte	0x217
	.byte	0x16
	.4byte	0x258
	.byte	0
	.byte	0x16
	.4byte	.LASF45
	.byte	0x1
	.2byte	0x200
	.byte	0x7
	.4byte	0x14e
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x3a4
	.byte	0x17
	.4byte	.LASF43
	.byte	0x1
	.2byte	0x200
	.byte	0x1b
	.4byte	0x94
	.4byte	.LLST12
	.byte	0x17
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x200
	.byte	0x2c
	.4byte	0x94
	.4byte	.LLST13
	.byte	0x18
	.string	"p"
	.byte	0x1
	.2byte	0x202
	.byte	0xb
	.4byte	0x14e
	.4byte	.LLST14
	.byte	0x19
	.4byte	.LVL49
	.4byte	0x507
	.4byte	0x387
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0
	.byte	0x1b
	.4byte	.LVL51
	.4byte	0x7e4
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF46
	.byte	0x1
	.2byte	0x198
	.byte	0x7
	.4byte	0x14e
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.4byte	0x507
	.byte	0x17
	.4byte	.LASF47
	.byte	0x1
	.2byte	0x198
	.byte	0x18
	.4byte	0x14e
	.4byte	.LLST18
	.byte	0x17
	.4byte	.LASF48
	.byte	0x1
	.2byte	0x198
	.byte	0x28
	.4byte	0x94
	.4byte	.LLST19
	.byte	0x1c
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x19a
	.byte	0xf
	.4byte	0x94
	.byte	0x1
	.byte	0x63
	.byte	0x18
	.string	"ptr"
	.byte	0x1
	.2byte	0x19b
	.byte	0xf
	.4byte	0x94
	.4byte	.LLST20
	.byte	0x1d
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x19b
	.byte	0x14
	.4byte	0x94
	.4byte	.LLST21
	.byte	0x18
	.string	"mem"
	.byte	0x1
	.2byte	0x19c
	.byte	0x16
	.4byte	0x258
	.4byte	.LLST22
	.byte	0x1d
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x19c
	.byte	0x1c
	.4byte	0x258
	.4byte	.LLST23
	.byte	0x1d
	.4byte	.LASF51
	.byte	0x1
	.2byte	0x19d
	.byte	0xb
	.4byte	0x14e
	.4byte	.LLST24
	.byte	0x19
	.4byte	.LVL68
	.4byte	0x2fd
	.4byte	0x45a
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x1e
	.4byte	.LVL73
	.4byte	0x507
	.4byte	0x474
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x8
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0
	.byte	0x19
	.4byte	.LVL74
	.4byte	0x7f1
	.4byte	0x491
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x19
	.4byte	.LVL76
	.4byte	0x7fe
	.4byte	0x4a8
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0
	.byte	0x1f
	.4byte	.LVL86
	.4byte	0x681
	.byte	0x19
	.4byte	.LVL88
	.4byte	0x7fe
	.4byte	0x4c8
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0
	.byte	0x19
	.4byte	.LVL89
	.4byte	0x507
	.4byte	0x4dc
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL92
	.4byte	0x80b
	.4byte	0x4f6
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LVL93
	.4byte	0x2fd
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LASF52
	.byte	0x1
	.2byte	0x103
	.byte	0x7
	.4byte	0x14e
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x5d6
	.byte	0x17
	.4byte	.LASF44
	.byte	0x1
	.2byte	0x103
	.byte	0x1b
	.4byte	0x94
	.4byte	.LLST7
	.byte	0x18
	.string	"ptr"
	.byte	0x1
	.2byte	0x105
	.byte	0xf
	.4byte	0x94
	.4byte	.LLST8
	.byte	0x1d
	.4byte	.LASF49
	.byte	0x1
	.2byte	0x105
	.byte	0x14
	.4byte	0x94
	.4byte	.LLST9
	.byte	0x18
	.string	"mem"
	.byte	0x1
	.2byte	0x106
	.byte	0x16
	.4byte	0x258
	.4byte	.LLST10
	.byte	0x1d
	.4byte	.LASF50
	.byte	0x1
	.2byte	0x106
	.byte	0x1c
	.4byte	0x258
	.4byte	.LLST11
	.byte	0x19
	.4byte	.LVL26
	.4byte	0x7f1
	.4byte	0x594
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x19
	.4byte	.LVL29
	.4byte	0x7fe
	.4byte	0x5ab
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0
	.byte	0x19
	.4byte	.LVL37
	.4byte	0x7fe
	.4byte	0x5c2
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0
	.byte	0x20
	.4byte	.LVL38
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x21
	.4byte	.LASF54
	.byte	0x1
	.byte	0xbf
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x681
	.byte	0x22
	.4byte	.LASF55
	.byte	0x1
	.byte	0xbf
	.byte	0x20
	.4byte	0x14e
	.4byte	.LLST2
	.byte	0x22
	.4byte	.LASF56
	.byte	0x1
	.byte	0xbf
	.byte	0x32
	.4byte	0x14e
	.4byte	.LLST3
	.byte	0x23
	.string	"mem"
	.byte	0x1
	.byte	0xc1
	.byte	0x16
	.4byte	0x258
	.4byte	.LLST4
	.byte	0x24
	.4byte	.LASF57
	.byte	0x1
	.byte	0xc2
	.byte	0x11
	.4byte	0x67
	.4byte	.LLST5
	.byte	0x24
	.4byte	.LASF58
	.byte	0x1
	.byte	0xc3
	.byte	0x11
	.4byte	0x67
	.4byte	.LLST6
	.byte	0x19
	.4byte	.LVL18
	.4byte	0x818
	.4byte	0x666
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0x1a
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x31
	.byte	0x1a
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x25
	.4byte	.LVL22
	.4byte	0x825
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LASF73
	.byte	0x1
	.byte	0x8f
	.byte	0xd
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x6c6
	.byte	0x27
	.string	"mem"
	.byte	0x1
	.byte	0x8f
	.byte	0x29
	.4byte	0x258
	.byte	0x1
	.byte	0x5a
	.byte	0x24
	.4byte	.LASF51
	.byte	0x1
	.byte	0x91
	.byte	0x16
	.4byte	0x258
	.4byte	.LLST0
	.byte	0x24
	.4byte	.LASF59
	.byte	0x1
	.byte	0x92
	.byte	0x16
	.4byte	0x258
	.4byte	.LLST1
	.byte	0
	.byte	0x21
	.4byte	.LASF60
	.byte	0x1
	.byte	0x55
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x6eb
	.byte	0x28
	.4byte	.LASF61
	.byte	0x1
	.byte	0x55
	.byte	0x1d
	.4byte	0x150
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x21
	.4byte	.LASF62
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x710
	.byte	0x28
	.4byte	.LASF61
	.byte	0x1
	.byte	0x4a
	.byte	0x1f
	.4byte	0x1da
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x29
	.4byte	0x2fd
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x7e4
	.byte	0x2a
	.4byte	0x30b
	.4byte	.LLST15
	.byte	0x2b
	.4byte	0x318
	.byte	0x2c
	.4byte	0x2fd
	.4byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x215
	.byte	0x6
	.4byte	0x7d7
	.byte	0x2a
	.4byte	0x30b
	.4byte	.LLST16
	.byte	0x2d
	.4byte	.Ldebug_ranges0+0
	.byte	0x2e
	.4byte	0x318
	.4byte	.LLST17
	.byte	0x19
	.4byte	.LVL56
	.4byte	0x7f1
	.4byte	0x77a
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.byte	0x19
	.4byte	.LVL58
	.4byte	0x825
	.4byte	0x791
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0x19
	.4byte	.LVL59
	.4byte	0x825
	.4byte	0x7ae
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0x1a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x19
	.4byte	.LVL60
	.4byte	0x681
	.4byte	0x7c2
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0x25
	.4byte	.LVL63
	.4byte	0x7fe
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR6
	.byte	0
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LVL54
	.byte	0x1a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2f
	.4byte	.LASF63
	.4byte	.LASF63
	.byte	0x3
	.2byte	0x1f2
	.byte	0x7
	.byte	0x2f
	.4byte	.LASF64
	.4byte	.LASF64
	.byte	0x3
	.2byte	0x12d
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF65
	.4byte	.LASF65
	.byte	0x3
	.2byte	0x12f
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF66
	.4byte	.LASF66
	.byte	0x3
	.2byte	0x1f3
	.byte	0x7
	.byte	0x2f
	.4byte	.LASF67
	.4byte	.LASF67
	.byte	0x3
	.2byte	0x125
	.byte	0xa
	.byte	0x2f
	.4byte	.LASF68
	.4byte	.LASF68
	.byte	0x3
	.2byte	0x1d7
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
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x13
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
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
	.byte	0x19
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
	.byte	0x1a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
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
	.byte	0x1f
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x21
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
	.byte	0x22
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x26
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
	.byte	0x27
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0x29
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
	.byte	0x2a
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2b
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2c
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
	.byte	0x2d
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2f
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
.LLST12:
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL48
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL47
	.4byte	.LVL49-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL49-1
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL50
	.4byte	.LVL52
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL52
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL66
	.4byte	.LVL68-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL68-1
	.4byte	.LVL69
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL70
	.4byte	.LVL72
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL72
	.4byte	.LVL73
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL73
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL77
	.4byte	.LVL78
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL78
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL67
	.4byte	.LVL71
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL71
	.4byte	.LVL73-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL73-1
	.4byte	.LVL73
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL73
	.4byte	.LVL75
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL75
	.4byte	.LVL78
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL78
	.4byte	.LVL82
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL82
	.4byte	.LVL87
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL87
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL80
	.4byte	.LVL84
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL84
	.4byte	.LVL85
	.2byte	0x2
	.byte	0x7a
	.byte	0x8
	.4byte	.LVL85
	.4byte	.LVL86-1
	.2byte	0x3
	.byte	0x7c
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL87
	.4byte	.LVL88-1
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL82
	.4byte	.LVL87
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL78
	.4byte	.LVL79
	.2byte	0x3
	.byte	0x79
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL79
	.4byte	.LVL80
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL80
	.4byte	.LFE20
	.2byte	0x3
	.byte	0x79
	.byte	0x74
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL83
	.4byte	.LVL86-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL90
	.4byte	.LVL91
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL91
	.4byte	.LFE20
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL24
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL41
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL45
	.4byte	.LVL46
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL46
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL27
	.4byte	.LVL29-1
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL30
	.4byte	.LVL34
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x81
	.byte	0x8
	.4byte	.LVL41
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x5d
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL32
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL31
	.4byte	.LVL39
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL41
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL33
	.4byte	.LVL36
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL17
	.4byte	.LVL19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL22-1
	.4byte	.LFE18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL8
	.4byte	.LVL16
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL16
	.4byte	.LVL19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL20
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL22-1
	.4byte	.LFE18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL14
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL15
	.4byte	.LVL18-1
	.2byte	0x5
	.byte	0x3
	.4byte	heap_ptr
	.4byte	.LVL18-1
	.4byte	.LVL19
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL8
	.4byte	.LVL10
	.2byte	0x6
	.byte	0x7a
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL10
	.4byte	.LVL11
	.2byte	0x6
	.byte	0x7f
	.byte	0
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL11
	.4byte	.LVL17
	.2byte	0x6
	.byte	0x7a
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL17
	.4byte	.LVL19
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL21
	.2byte	0x6
	.byte	0x7a
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22-1
	.2byte	0x6
	.byte	0x7b
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL22-1
	.4byte	.LFE18
	.2byte	0x9
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x23
	.byte	0x3
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL9
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x3
	.byte	0x7d
	.byte	0x18
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL16
	.2byte	0x6
	.byte	0x7b
	.byte	0
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL16
	.4byte	.LVL19
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL19
	.4byte	.LVL22-1
	.2byte	0x1
	.byte	0x5e
	.4byte	.LVL22-1
	.4byte	.LFE18
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9
	.byte	0xfc
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x6
	.byte	0x7e
	.byte	0
	.byte	0x7d
	.byte	0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LFE17
	.2byte	0xa
	.byte	0x3
	.4byte	heap_ptr
	.byte	0x6
	.byte	0x7d
	.byte	0
	.byte	0x22
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL53
	.4byte	.LVL54-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL54-1
	.4byte	.LVL61
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL61
	.4byte	.LVL62
	.2byte	0x3
	.byte	0x79
	.byte	0xc
	.byte	0x9f
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL63
	.4byte	.LVL64
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL64
	.4byte	.LVL65
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL65
	.4byte	.LFE22
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL55
	.4byte	.LVL61
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL61
	.4byte	.LVL62
	.2byte	0x3
	.byte	0x79
	.byte	0xc
	.byte	0x9f
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL57
	.4byte	.LVL62
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x6
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x3c
	.byte	0x1c
	.byte	0x9f
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
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
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
	.4byte	.LFB17
	.4byte	.LFE17
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB20
	.4byte	.LFE20
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"rt_uint32_t"
.LASF6:
	.string	"rt_uint16_t"
.LASF63:
	.string	"rt_memset"
.LASF54:
	.string	"rt_system_heap_init"
.LASF11:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF32:
	.string	"magic"
.LASF3:
	.string	"long long int"
.LASF60:
	.string	"rt_free_sethook"
.LASF73:
	.string	"plug_holes"
.LASF28:
	.string	"value"
.LASF31:
	.string	"heap_mem"
.LASF38:
	.string	"mem_size_aligned"
.LASF45:
	.string	"rt_calloc"
.LASF53:
	.string	"rt_memory_info"
.LASF69:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF0:
	.string	"signed char"
.LASF25:
	.string	"parent"
.LASF64:
	.string	"rt_sem_take"
.LASF48:
	.string	"newsize"
.LASF39:
	.string	"used_mem"
.LASF2:
	.string	"long int"
.LASF24:
	.string	"rt_ipc_object"
.LASF56:
	.string	"end_addr"
.LASF58:
	.string	"end_align"
.LASF68:
	.string	"rt_kprintf"
.LASF4:
	.string	"unsigned char"
.LASF59:
	.string	"pmem"
.LASF70:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/mem.c"
.LASF72:
	.string	"rt_free"
.LASF47:
	.string	"rmem"
.LASF67:
	.string	"rt_sem_init"
.LASF71:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF46:
	.string	"rt_realloc"
.LASF36:
	.string	"lfree"
.LASF35:
	.string	"heap_end"
.LASF10:
	.string	"long long unsigned int"
.LASF19:
	.string	"type"
.LASF37:
	.string	"heap_sem"
.LASF22:
	.string	"unsigned int"
.LASF5:
	.string	"rt_uint8_t"
.LASF30:
	.string	"rt_free_hook"
.LASF52:
	.string	"rt_malloc"
.LASF7:
	.string	"short unsigned int"
.LASF42:
	.string	"max_used"
.LASF23:
	.string	"char"
.LASF29:
	.string	"rt_malloc_hook"
.LASF21:
	.string	"list"
.LASF18:
	.string	"name"
.LASF44:
	.string	"size"
.LASF9:
	.string	"long unsigned int"
.LASF49:
	.string	"ptr2"
.LASF16:
	.string	"rt_list_node"
.LASF65:
	.string	"rt_sem_release"
.LASF43:
	.string	"count"
.LASF61:
	.string	"hook"
.LASF27:
	.string	"rt_semaphore"
.LASF57:
	.string	"begin_align"
.LASF33:
	.string	"used"
.LASF55:
	.string	"begin_addr"
.LASF41:
	.string	"total"
.LASF17:
	.string	"rt_object"
.LASF15:
	.string	"rt_list_t"
.LASF20:
	.string	"flag"
.LASF34:
	.string	"heap_ptr"
.LASF62:
	.string	"rt_malloc_sethook"
.LASF26:
	.string	"suspend_thread"
.LASF14:
	.string	"prev"
.LASF12:
	.string	"rt_size_t"
.LASF51:
	.string	"nmem"
.LASF66:
	.string	"rt_memcpy"
.LASF50:
	.string	"mem2"
.LASF40:
	.string	"max_mem"
.LASF13:
	.string	"next"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
