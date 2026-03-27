	.file	"object.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rt_object_attach_sethook,"ax",@progbits
	.align	1
	.globl	rt_object_attach_sethook
	.type	rt_object_attach_sethook, @function
rt_object_attach_sethook:
.LFB15:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/object.c"
	.loc 1 128 1
	.cfi_startproc
.LVL0:
	.loc 1 129 5
	.loc 1 129 27 is_stmt 0
	sw	a0,.LANCHOR0,a5
	.loc 1 130 1
	ret
	.cfi_endproc
.LFE15:
	.size	rt_object_attach_sethook, .-rt_object_attach_sethook
	.section	.text.rt_object_detach_sethook,"ax",@progbits
	.align	1
	.globl	rt_object_detach_sethook
	.type	rt_object_detach_sethook, @function
rt_object_detach_sethook:
.LFB16:
	.loc 1 139 1 is_stmt 1
	.cfi_startproc
.LVL1:
	.loc 1 140 5
	.loc 1 140 27 is_stmt 0
	sw	a0,.LANCHOR1,a5
	.loc 1 141 1
	ret
	.cfi_endproc
.LFE16:
	.size	rt_object_detach_sethook, .-rt_object_detach_sethook
	.section	.text.rt_object_trytake_sethook,"ax",@progbits
	.align	1
	.globl	rt_object_trytake_sethook
	.type	rt_object_trytake_sethook, @function
rt_object_trytake_sethook:
.LFB17:
	.loc 1 157 1 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 158 5
	.loc 1 158 28 is_stmt 0
	sw	a0,.LANCHOR2,a5
	.loc 1 159 1
	ret
	.cfi_endproc
.LFE17:
	.size	rt_object_trytake_sethook, .-rt_object_trytake_sethook
	.section	.text.rt_object_take_sethook,"ax",@progbits
	.align	1
	.globl	rt_object_take_sethook
	.type	rt_object_take_sethook, @function
rt_object_take_sethook:
.LFB18:
	.loc 1 176 1 is_stmt 1
	.cfi_startproc
.LVL3:
	.loc 1 177 5
	.loc 1 177 25 is_stmt 0
	sw	a0,.LANCHOR3,a5
	.loc 1 178 1
	ret
	.cfi_endproc
.LFE18:
	.size	rt_object_take_sethook, .-rt_object_take_sethook
	.section	.text.rt_object_put_sethook,"ax",@progbits
	.align	1
	.globl	rt_object_put_sethook
	.type	rt_object_put_sethook, @function
rt_object_put_sethook:
.LFB19:
	.loc 1 187 1 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 188 5
	.loc 1 188 24 is_stmt 0
	sw	a0,.LANCHOR4,a5
	.loc 1 189 1
	ret
	.cfi_endproc
.LFE19:
	.size	rt_object_put_sethook, .-rt_object_put_sethook
	.section	.text.rt_system_object_init,"ax",@progbits
	.align	1
	.globl	rt_system_object_init
	.type	rt_system_object_init, @function
rt_system_object_init:
.LFB20:
	.loc 1 203 1 is_stmt 1
	.cfi_startproc
	.loc 1 204 1
	ret
	.cfi_endproc
.LFE20:
	.size	rt_system_object_init, .-rt_system_object_init
	.section	.text.rt_object_get_information,"ax",@progbits
	.align	1
	.globl	rt_object_get_information
	.type	rt_object_get_information, @function
rt_object_get_information:
.LFB21:
	.loc 1 220 1
	.cfi_startproc
.LVL5:
	.loc 1 221 5
	.loc 1 223 5
	.loc 1 223 21
	lla	a3,.LANCHOR5
	.loc 1 223 16 is_stmt 0
	li	a5,0
	mv	a4,a3
	.loc 1 223 5
	li	a2,9
.LVL6:
.L10:
	.loc 1 224 9 is_stmt 1
	.loc 1 224 12 is_stmt 0
	lw	a1,0(a3)
	bne	a1,a0,.L8
	.loc 1 224 54 is_stmt 1 discriminator 1
	.loc 1 224 61 is_stmt 0 discriminator 1
	slli	a5,a5,4
.LVL7:
	add	a0,a4,a5
.LVL8:
	ret
.LVL9:
.L8:
	.loc 1 223 53 is_stmt 1 discriminator 2
	.loc 1 223 59 is_stmt 0 discriminator 2
	addi	a5,a5,1
.LVL10:
	.loc 1 223 21 is_stmt 1 discriminator 2
	.loc 1 223 5 is_stmt 0 discriminator 2
	addi	a3,a3,16
	bne	a5,a2,.L10
	.loc 1 226 12
	li	a0,0
.LVL11:
	.loc 1 227 1
	ret
	.cfi_endproc
.LFE21:
	.size	rt_object_get_information, .-rt_object_get_information
	.section	.text.rt_object_init,"ax",@progbits
	.align	1
	.globl	rt_object_init
	.type	rt_object_init, @function
rt_object_init:
.LFB22:
	.loc 1 241 1 is_stmt 1
	.cfi_startproc
.LVL12:
	.loc 1 242 5
	.loc 1 243 5
	.loc 1 249 5
	.loc 1 241 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	.cfi_offset 8, -8
	mv	s0,a0
	.loc 1 249 19
	mv	a0,a1
.LVL13:
	.loc 1 241 1
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 241 1
	sw	a2,12(sp)
	mv	s2,a1
	.loc 1 249 19
	call	rt_object_get_information
.LVL14:
	.loc 1 258 5
	lw	a1,12(sp)
	.loc 1 255 25
	ori	s2,s2,-128
.LVL15:
	.loc 1 249 19
	mv	s1,a0
.LVL16:
	.loc 1 250 5 is_stmt 1
	.loc 1 255 5
	.loc 1 255 18 is_stmt 0
	sb	s2,8(s0)
	.loc 1 258 5 is_stmt 1
	li	a2,8
	mv	a0,s0
	call	rt_strncpy
.LVL17:
	.loc 1 260 5
	.loc 1 260 10
	.loc 1 260 38 is_stmt 0
	lw	a5,.LANCHOR0
	.loc 1 260 13
	beq	a5,zero,.L13
	.loc 1 260 46 is_stmt 1 discriminator 1
	mv	a0,s0
	jalr	a5
.LVL18:
.L13:
	.loc 1 260 86 discriminator 3
	.loc 1 263 5 discriminator 3
	.loc 1 263 12 is_stmt 0 discriminator 3
	call	rt_hw_interrupt_disable
.LVL19:
	.loc 1 275 9 is_stmt 1 discriminator 3
.LBB6:
.LBB7:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtservice.h"
	.loc 2 60 6 is_stmt 0 discriminator 3
	lw	a4,4(s1)
.LBE7:
.LBE6:
	.loc 1 275 9 discriminator 3
	addi	a5,s0,12
.LVL20:
.LBB10:
.LBB8:
	.loc 2 60 5 is_stmt 1 discriminator 3
.LBE8:
.LBE10:
	.loc 1 275 9 is_stmt 0 discriminator 3
	addi	s1,s1,4
.LVL21:
.LBB11:
.LBB9:
	.loc 2 60 19 discriminator 3
	sw	a5,4(a4)
	.loc 2 61 5 is_stmt 1 discriminator 3
	.loc 2 61 13 is_stmt 0 discriminator 3
	sw	a4,12(s0)
	.loc 2 63 5 is_stmt 1 discriminator 3
	.loc 2 63 13 is_stmt 0 discriminator 3
	sw	a5,0(s1)
	.loc 2 64 5 is_stmt 1 discriminator 3
	.loc 2 64 13 is_stmt 0 discriminator 3
	sw	s1,16(s0)
.LVL22:
.LBE9:
.LBE11:
	.loc 1 279 5 is_stmt 1 discriminator 3
	.loc 1 280 1 is_stmt 0 discriminator 3
	lw	s0,24(sp)
	.cfi_restore 8
.LVL23:
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s1,20(sp)
	.cfi_restore 9
.LVL24:
	lw	s2,16(sp)
	.cfi_restore 18
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
.LVL25:
	.loc 1 279 5 discriminator 3
	tail	rt_hw_interrupt_enable
.LVL26:
	.cfi_endproc
.LFE22:
	.size	rt_object_init, .-rt_object_init
	.section	.text.rt_object_detach,"ax",@progbits
	.align	1
	.globl	rt_object_detach
	.type	rt_object_detach, @function
rt_object_detach:
.LFB23:
	.loc 1 289 1 is_stmt 1
	.cfi_startproc
.LVL27:
	.loc 1 290 5
	.loc 1 293 5
	.loc 1 295 5
	.loc 1 295 10
	.loc 1 289 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 295 38
	lw	a5,.LANCHOR1
	.loc 1 289 1
	mv	s0,a0
	.loc 1 295 13
	beq	a5,zero,.L19
	.loc 1 295 46 is_stmt 1 discriminator 1
	jalr	a5
.LVL28:
.L19:
	.loc 1 295 86 discriminator 3
	.loc 1 298 5 discriminator 3
	.loc 1 298 18 is_stmt 0 discriminator 3
	sb	zero,8(s0)
	.loc 1 301 5 is_stmt 1 discriminator 3
	.loc 1 301 12 is_stmt 0 discriminator 3
	call	rt_hw_interrupt_disable
.LVL29:
	.loc 1 304 5 is_stmt 1 discriminator 3
.LBB14:
.LBB15:
	.loc 2 88 6 is_stmt 0 discriminator 3
	lw	a3,12(s0)
	.loc 2 88 22 discriminator 3
	lw	a4,16(s0)
.LBE15:
.LBE14:
	.loc 1 304 5 discriminator 3
	addi	a5,s0,12
.LVL30:
.LBB18:
.LBB16:
	.loc 2 88 5 is_stmt 1 discriminator 3
.LBE16:
.LBE18:
	.loc 1 308 1 is_stmt 0 discriminator 3
	lw	ra,12(sp)
	.cfi_restore 1
.LBB19:
.LBB17:
	.loc 2 88 19 discriminator 3
	sw	a4,4(a3)
	.loc 2 89 5 is_stmt 1 discriminator 3
	.loc 2 89 19 is_stmt 0 discriminator 3
	sw	a3,0(a4)
	.loc 2 91 5 is_stmt 1 discriminator 3
	.loc 2 91 23 is_stmt 0 discriminator 3
	sw	a5,16(s0)
	.loc 2 91 13 discriminator 3
	sw	a5,12(s0)
.LVL31:
.LBE17:
.LBE19:
	.loc 1 307 5 is_stmt 1 discriminator 3
	.loc 1 308 1 is_stmt 0 discriminator 3
	lw	s0,8(sp)
	.cfi_restore 8
.LVL32:
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 307 5 discriminator 3
	tail	rt_hw_interrupt_enable
.LVL33:
	.cfi_endproc
.LFE23:
	.size	rt_object_detach, .-rt_object_detach
	.section	.text.rt_object_allocate,"ax",@progbits
	.align	1
	.globl	rt_object_allocate
	.type	rt_object_allocate, @function
rt_object_allocate:
.LFB24:
	.loc 1 320 1 is_stmt 1
	.cfi_startproc
.LVL34:
	.loc 1 321 5
	.loc 1 322 5
	.loc 1 323 5
	.loc 1 328 5
	.loc 1 331 5
	.loc 1 320 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.loc 1 320 1
	mv	s2,a1
	mv	s3,a0
	.loc 1 331 19
	call	rt_object_get_information
.LVL35:
	mv	s1,a0
.LVL36:
	.loc 1 332 5 is_stmt 1
	.loc 1 334 5
	.loc 1 334 34 is_stmt 0
	lw	a0,12(a0)
	call	rt_malloc
.LVL37:
	mv	s0,a0
.LVL38:
	.loc 1 335 5 is_stmt 1
	.loc 1 335 8 is_stmt 0
	beq	a0,zero,.L24
	.loc 1 342 5 is_stmt 1
	lw	a2,12(s1)
	li	a1,0
	call	rt_memset
.LVL39:
	.loc 1 347 5
	.loc 1 353 5 is_stmt 0
	li	a2,8
	.loc 1 347 18
	sb	s3,8(s0)
	.loc 1 350 5 is_stmt 1
	.loc 1 350 18 is_stmt 0
	sb	zero,9(s0)
	.loc 1 353 5 is_stmt 1
	mv	a1,s2
	mv	a0,s0
	call	rt_strncpy
.LVL40:
	.loc 1 355 5
	.loc 1 355 10
	.loc 1 355 38 is_stmt 0
	lw	a5,.LANCHOR0
	.loc 1 355 13
	beq	a5,zero,.L26
	.loc 1 355 46 is_stmt 1 discriminator 1
	mv	a0,s0
	jalr	a5
.LVL41:
.L26:
	.loc 1 355 86 discriminator 3
	.loc 1 358 5 discriminator 3
	.loc 1 358 12 is_stmt 0 discriminator 3
	call	rt_hw_interrupt_disable
.LVL42:
	.loc 1 370 9 is_stmt 1 discriminator 3
.LBB20:
.LBB21:
	.loc 2 60 6 is_stmt 0 discriminator 3
	lw	a4,4(s1)
.LBE21:
.LBE20:
	.loc 1 370 9 discriminator 3
	addi	a5,s0,12
.LVL43:
.LBB24:
.LBB22:
	.loc 2 60 5 is_stmt 1 discriminator 3
.LBE22:
.LBE24:
	.loc 1 370 9 is_stmt 0 discriminator 3
	addi	s1,s1,4
.LVL44:
.LBB25:
.LBB23:
	.loc 2 60 19 discriminator 3
	sw	a5,4(a4)
	.loc 2 61 5 is_stmt 1 discriminator 3
	.loc 2 61 13 is_stmt 0 discriminator 3
	sw	a4,12(s0)
	.loc 2 63 5 is_stmt 1 discriminator 3
	.loc 2 63 13 is_stmt 0 discriminator 3
	sw	a5,0(s1)
	.loc 2 64 5 is_stmt 1 discriminator 3
	.loc 2 64 13 is_stmt 0 discriminator 3
	sw	s1,16(s0)
.LVL45:
.LBE23:
.LBE25:
	.loc 1 374 5 is_stmt 1 discriminator 3
	call	rt_hw_interrupt_enable
.LVL46:
	.loc 1 377 5 discriminator 3
.L24:
	.loc 1 378 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	mv	a0,s0
	lw	s0,24(sp)
	.cfi_restore 8
.LVL47:
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
.LVL48:
	lw	s3,12(sp)
	.cfi_restore 19
.LVL49:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE24:
	.size	rt_object_allocate, .-rt_object_allocate
	.section	.text.rt_object_delete,"ax",@progbits
	.align	1
	.globl	rt_object_delete
	.type	rt_object_delete, @function
rt_object_delete:
.LFB25:
	.loc 1 386 1 is_stmt 1
	.cfi_startproc
.LVL50:
	.loc 1 387 5
	.loc 1 390 5
	.loc 1 391 5
	.loc 1 393 5
	.loc 1 393 10
	.loc 1 386 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.loc 1 393 38
	lw	a5,.LANCHOR1
	.loc 1 386 1
	mv	s0,a0
	.loc 1 393 13
	beq	a5,zero,.L35
	.loc 1 393 46 is_stmt 1 discriminator 1
	jalr	a5
.LVL51:
.L35:
	.loc 1 393 86 discriminator 3
	.loc 1 396 5 discriminator 3
	.loc 1 396 18 is_stmt 0 discriminator 3
	sb	zero,8(s0)
	.loc 1 399 5 is_stmt 1 discriminator 3
	.loc 1 399 12 is_stmt 0 discriminator 3
	call	rt_hw_interrupt_disable
.LVL52:
	.loc 1 402 5 is_stmt 1 discriminator 3
.LBB28:
.LBB29:
	.loc 2 88 6 is_stmt 0 discriminator 3
	lw	a3,12(s0)
	.loc 2 88 22 discriminator 3
	lw	a4,16(s0)
.LBE29:
.LBE28:
	.loc 1 402 5 discriminator 3
	addi	a5,s0,12
.LVL53:
.LBB31:
.LBB30:
	.loc 2 88 5 is_stmt 1 discriminator 3
	.loc 2 88 19 is_stmt 0 discriminator 3
	sw	a4,4(a3)
	.loc 2 89 5 is_stmt 1 discriminator 3
	.loc 2 89 19 is_stmt 0 discriminator 3
	sw	a3,0(a4)
	.loc 2 91 5 is_stmt 1 discriminator 3
	.loc 2 91 23 is_stmt 0 discriminator 3
	sw	a5,16(s0)
	.loc 2 91 13 discriminator 3
	sw	a5,12(s0)
.LVL54:
.LBE30:
.LBE31:
	.loc 1 405 5 is_stmt 1 discriminator 3
	call	rt_hw_interrupt_enable
.LVL55:
	.loc 1 408 5 discriminator 3
	mv	a0,s0
	.loc 1 409 1 is_stmt 0 discriminator 3
	lw	s0,8(sp)
	.cfi_restore 8
.LVL56:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 408 5 discriminator 3
	tail	rt_free
.LVL57:
	.cfi_endproc
.LFE25:
	.size	rt_object_delete, .-rt_object_delete
	.section	.text.rt_object_is_systemobject,"ax",@progbits
	.align	1
	.globl	rt_object_is_systemobject
	.type	rt_object_is_systemobject, @function
rt_object_is_systemobject:
.LFB26:
	.loc 1 422 1 is_stmt 1
	.cfi_startproc
.LVL58:
	.loc 1 424 5
	.loc 1 426 5
	.loc 1 426 8 is_stmt 0
	lb	a0,8(a0)
.LVL59:
	.loc 1 430 1
	srli	a0,a0,31
	ret
	.cfi_endproc
.LFE26:
	.size	rt_object_is_systemobject, .-rt_object_is_systemobject
	.section	.text.rt_object_get_type,"ax",@progbits
	.align	1
	.globl	rt_object_get_type
	.type	rt_object_get_type, @function
rt_object_get_type:
.LFB27:
	.loc 1 441 1 is_stmt 1
	.cfi_startproc
.LVL60:
	.loc 1 443 5
	.loc 1 445 5
	.loc 1 445 25 is_stmt 0
	lbu	a0,8(a0)
.LVL61:
	.loc 1 446 1
	andi	a0,a0,127
	ret
	.cfi_endproc
.LFE27:
	.size	rt_object_get_type, .-rt_object_get_type
	.section	.text.rt_object_find,"ax",@progbits
	.align	1
	.globl	rt_object_find
	.type	rt_object_find, @function
rt_object_find:
.LFB28:
	.loc 1 461 1 is_stmt 1
	.cfi_startproc
.LVL62:
	.loc 1 462 5
	.loc 1 463 5
	.loc 1 464 5
	.loc 1 467 5
	.loc 1 461 1 is_stmt 0
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	s0,40(sp)
	sw	ra,44(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	.cfi_offset 8, -8
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.loc 1 461 1
	mv	s0,a0
	.loc 1 467 8
	beq	a0,zero,.L43
	.loc 1 467 23 discriminator 1
	li	a5,11
	sw	a1,12(sp)
	bgtu	a1,a5,.L47
	.loc 1 471 5 is_stmt 1
	.loc 1 474 5
	call	rt_enter_critical
.LVL63:
	.loc 1 477 5
	.loc 1 479 9
	.loc 1 479 23 is_stmt 0
	lw	a0,12(sp)
	call	rt_object_get_information
.LVL64:
	.loc 1 480 9 is_stmt 1
	.loc 1 482 5
	.loc 1 482 15 is_stmt 0
	lw	s2,4(a0)
.LVL65:
	.loc 1 483 21
	addi	s1,a0,4
.LVL66:
.L44:
	.loc 1 483 13 is_stmt 1 discriminator 1
	.loc 1 482 5 is_stmt 0 discriminator 1
	bne	s2,s1,.L46
	.loc 1 497 5 is_stmt 1
	call	rt_exit_critical
.LVL67:
	.loc 1 499 5
.L47:
	.loc 1 468 16 is_stmt 0
	li	s0,0
.LVL68:
	j	.L43
.LVL69:
.L46:
	.loc 1 486 9 is_stmt 1
	.loc 1 487 9
	.loc 1 487 30 is_stmt 0
	addi	s3,s2,-12
.LVL70:
	.loc 1 487 13
	li	a2,8
	mv	a1,s0
	mv	a0,s3
	call	rt_strncmp
.LVL71:
	.loc 1 487 12
	bne	a0,zero,.L45
	.loc 1 486 16
	mv	s0,s3
.LVL72:
	.loc 1 490 13 is_stmt 1
	call	rt_exit_critical
.LVL73:
	.loc 1 492 13
.L43:
	.loc 1 500 1 is_stmt 0
	lw	ra,44(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,40(sp)
	.cfi_restore 8
	lw	s1,36(sp)
	.cfi_restore 9
	lw	s2,32(sp)
	.cfi_restore 18
	lw	s3,28(sp)
	.cfi_restore 19
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
.LVL74:
.L45:
	.cfi_restore_state
	.loc 1 484 13 is_stmt 1
	.loc 1 484 18 is_stmt 0
	lw	s2,0(s2)
.LVL75:
	j	.L44
	.cfi_endproc
.LFE28:
	.size	rt_object_find, .-rt_object_find
	.globl	rt_object_put_hook
	.globl	rt_object_take_hook
	.globl	rt_object_trytake_hook
	.section	.data.rt_object_container,"aw"
	.align	2
	.set	.LANCHOR5,. + 0
	.type	rt_object_container, @object
	.size	rt_object_container, 144
rt_object_container:
	.word	0
	.word	rt_object_container+4
	.word	rt_object_container+4
	.word	128
	.word	1
	.word	rt_object_container+20
	.word	rt_object_container+20
	.word	32
	.word	2
	.word	rt_object_container+36
	.word	rt_object_container+36
	.word	36
	.word	3
	.word	rt_object_container+52
	.word	rt_object_container+52
	.word	32
	.word	4
	.word	rt_object_container+68
	.word	rt_object_container+68
	.word	48
	.word	5
	.word	rt_object_container+84
	.word	rt_object_container+84
	.word	52
	.word	7
	.word	rt_object_container+100
	.word	rt_object_container+100
	.word	56
	.word	8
	.word	rt_object_container+116
	.word	rt_object_container+116
	.word	68
	.word	9
	.word	rt_object_container+132
	.word	rt_object_container+132
	.word	44
	.section	.sbss.rt_object_attach_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rt_object_attach_hook, @object
	.size	rt_object_attach_hook, 4
rt_object_attach_hook:
	.zero	4
	.section	.sbss.rt_object_detach_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rt_object_detach_hook, @object
	.size	rt_object_detach_hook, 4
rt_object_detach_hook:
	.zero	4
	.section	.sbss.rt_object_put_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	rt_object_put_hook, @object
	.size	rt_object_put_hook, 4
rt_object_put_hook:
	.zero	4
	.section	.sbss.rt_object_take_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	rt_object_take_hook, @object
	.size	rt_object_take_hook, 4
rt_object_take_hook:
	.zero	4
	.section	.sbss.rt_object_trytake_hook,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rt_object_trytake_hook, @object
	.size	rt_object_trytake_hook, 4
rt_object_trytake_hook:
	.zero	4
	.text
.Letext0:
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x8a2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF89
	.byte	0xc
	.4byte	.LASF90
	.4byte	.LASF91
	.4byte	.Ldebug_ranges0+0x78
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
	.4byte	.LASF8
	.byte	0x3
	.byte	0x3d
	.byte	0x17
	.4byte	0x4d
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
	.4byte	.LASF9
	.byte	0x3
	.byte	0x41
	.byte	0xd
	.4byte	0x75
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x45
	.byte	0x17
	.4byte	0x5b
	.byte	0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x4b
	.byte	0x14
	.4byte	0x88
	.byte	0x5
	.4byte	.LASF16
	.byte	0x8
	.byte	0x3
	.2byte	0x12c
	.byte	0x8
	.4byte	0xcb
	.byte	0x6
	.4byte	.LASF13
	.byte	0x3
	.2byte	0x12e
	.byte	0x1a
	.4byte	0xcb
	.byte	0
	.byte	0x6
	.4byte	.LASF14
	.byte	0x3
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
	.byte	0x3
	.2byte	0x131
	.byte	0x1d
	.4byte	0xa0
	.byte	0x5
	.4byte	.LASF17
	.byte	0x14
	.byte	0x3
	.2byte	0x14a
	.byte	0x8
	.4byte	0x125
	.byte	0x6
	.4byte	.LASF18
	.byte	0x3
	.2byte	0x14c
	.byte	0xa
	.4byte	0x125
	.byte	0
	.byte	0x6
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x6
	.4byte	.LASF20
	.byte	0x3
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x6
	.4byte	.LASF21
	.byte	0x3
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
	.4byte	0x13c
	.byte	0x8
	.4byte	.LASF24
	.byte	0x3
	.2byte	0x155
	.byte	0x1b
	.4byte	0x155
	.byte	0x7
	.byte	0x4
	.4byte	0xde
	.byte	0xc
	.4byte	.LASF41
	.byte	0x7
	.byte	0x4
	.4byte	0x135
	.byte	0x3
	.2byte	0x168
	.byte	0x6
	.4byte	0x1bd
	.byte	0xd
	.4byte	.LASF25
	.byte	0
	.byte	0xd
	.4byte	.LASF26
	.byte	0x1
	.byte	0xd
	.4byte	.LASF27
	.byte	0x2
	.byte	0xd
	.4byte	.LASF28
	.byte	0x3
	.byte	0xd
	.4byte	.LASF29
	.byte	0x4
	.byte	0xd
	.4byte	.LASF30
	.byte	0x5
	.byte	0xd
	.4byte	.LASF31
	.byte	0x6
	.byte	0xd
	.4byte	.LASF32
	.byte	0x7
	.byte	0xd
	.4byte	.LASF33
	.byte	0x8
	.byte	0xd
	.4byte	.LASF34
	.byte	0x9
	.byte	0xd
	.4byte	.LASF35
	.byte	0xa
	.byte	0xd
	.4byte	.LASF36
	.byte	0xb
	.byte	0xd
	.4byte	.LASF37
	.byte	0x80
	.byte	0
	.byte	0x5
	.4byte	.LASF38
	.byte	0x10
	.byte	0x3
	.2byte	0x17c
	.byte	0x8
	.4byte	0x1f6
	.byte	0x6
	.4byte	.LASF19
	.byte	0x3
	.2byte	0x17e
	.byte	0x1f
	.4byte	0x15b
	.byte	0
	.byte	0x6
	.4byte	.LASF39
	.byte	0x3
	.2byte	0x17f
	.byte	0xf
	.4byte	0xd1
	.byte	0x4
	.byte	0x6
	.4byte	.LASF40
	.byte	0x3
	.2byte	0x180
	.byte	0xf
	.4byte	0x94
	.byte	0xc
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x143
	.byte	0xe
	.4byte	.LASF42
	.byte	0x7
	.byte	0x4
	.4byte	0x135
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.4byte	0x24b
	.byte	0xd
	.4byte	.LASF43
	.byte	0
	.byte	0xd
	.4byte	.LASF44
	.byte	0x1
	.byte	0xd
	.4byte	.LASF45
	.byte	0x2
	.byte	0xd
	.4byte	.LASF46
	.byte	0x3
	.byte	0xd
	.4byte	.LASF47
	.byte	0x4
	.byte	0xd
	.4byte	.LASF48
	.byte	0x5
	.byte	0xd
	.4byte	.LASF49
	.byte	0x6
	.byte	0xd
	.4byte	.LASF50
	.byte	0x7
	.byte	0xd
	.4byte	.LASF51
	.byte	0x8
	.byte	0xd
	.4byte	.LASF52
	.byte	0x9
	.byte	0
	.byte	0x9
	.4byte	0x1bd
	.4byte	0x25b
	.byte	0xa
	.4byte	0x135
	.byte	0x8
	.byte	0
	.byte	0xf
	.4byte	.LASF53
	.byte	0x1
	.byte	0x40
	.byte	0x25
	.4byte	0x24b
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_container
	.byte	0x10
	.4byte	0x278
	.byte	0x11
	.4byte	0x155
	.byte	0
	.byte	0xf
	.4byte	.LASF54
	.byte	0x1
	.byte	0x6d
	.byte	0xf
	.4byte	0x28a
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_attach_hook
	.byte	0x7
	.byte	0x4
	.4byte	0x26d
	.byte	0xf
	.4byte	.LASF55
	.byte	0x1
	.byte	0x6e
	.byte	0xf
	.4byte	0x28a
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_detach_hook
	.byte	0x12
	.4byte	.LASF56
	.byte	0x1
	.byte	0x6f
	.byte	0x8
	.4byte	0x28a
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_trytake_hook
	.byte	0x12
	.4byte	.LASF57
	.byte	0x1
	.byte	0x70
	.byte	0x8
	.4byte	0x28a
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_take_hook
	.byte	0x12
	.4byte	.LASF58
	.byte	0x1
	.byte	0x71
	.byte	0x8
	.4byte	0x28a
	.byte	0x5
	.byte	0x3
	.4byte	rt_object_put_hook
	.byte	0x13
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x1cc
	.byte	0xd
	.4byte	0x148
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x398
	.byte	0x14
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x1cc
	.byte	0x28
	.4byte	0x1f6
	.4byte	.LLST23
	.byte	0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x1cc
	.byte	0x39
	.4byte	0x41
	.4byte	.LLST24
	.byte	0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1ce
	.byte	0x17
	.4byte	0x155
	.4byte	.LLST25
	.byte	0x15
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x1cf
	.byte	0x1a
	.4byte	0xcb
	.4byte	.LLST26
	.byte	0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x1d0
	.byte	0x23
	.4byte	0x398
	.4byte	.LLST27
	.byte	0x16
	.4byte	.LVL63
	.4byte	0x836
	.byte	0x17
	.4byte	.LVL64
	.4byte	0x6f0
	.4byte	0x366
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0x91
	.byte	0x5c
	.byte	0x6
	.byte	0
	.byte	0x16
	.4byte	.LVL67
	.4byte	0x842
	.byte	0x17
	.4byte	.LVL71
	.4byte	0x84e
	.4byte	0x38e
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x38
	.byte	0
	.byte	0x16
	.4byte	.LVL73
	.4byte	0x842
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x1bd
	.byte	0x13
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x1b8
	.byte	0xc
	.4byte	0x41
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.byte	0x1
	.byte	0x9c
	.4byte	0x3cb
	.byte	0x14
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1b8
	.byte	0x2b
	.4byte	0x148
	.4byte	.LLST22
	.byte	0
	.byte	0x13
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x1a5
	.byte	0xb
	.4byte	0x69
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x3f8
	.byte	0x14
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x1a5
	.byte	0x31
	.4byte	0x148
	.4byte	.LLST21
	.byte	0
	.byte	0x19
	.4byte	.LASF67
	.byte	0x1
	.2byte	0x181
	.byte	0x6
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x484
	.byte	0x14
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x181
	.byte	0x23
	.4byte	0x148
	.4byte	.LLST18
	.byte	0x15
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x183
	.byte	0x18
	.4byte	0x7c
	.4byte	.LLST19
	.byte	0x1a
	.4byte	0x7f6
	.4byte	.LBB28
	.4byte	.Ldebug_ranges0+0x60
	.byte	0x1
	.2byte	0x192
	.byte	0x5
	.4byte	0x450
	.byte	0x1b
	.4byte	0x803
	.4byte	.LLST20
	.byte	0
	.byte	0x1c
	.4byte	.LVL51
	.4byte	0x460
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL52
	.4byte	0x85b
	.byte	0x16
	.4byte	.LVL55
	.4byte	0x867
	.byte	0x1d
	.4byte	.LVL57
	.4byte	0x873
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0
	.byte	0x13
	.4byte	.LASF66
	.byte	0x1
	.2byte	0x13f
	.byte	0xd
	.4byte	0x148
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x590
	.byte	0x14
	.4byte	.LASF19
	.byte	0x1
	.2byte	0x13f
	.byte	0x3a
	.4byte	0x15b
	.4byte	.LLST12
	.byte	0x14
	.4byte	.LASF18
	.byte	0x1
	.2byte	0x13f
	.byte	0x4c
	.4byte	0x1f6
	.4byte	.LLST13
	.byte	0x15
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x141
	.byte	0x17
	.4byte	0x155
	.4byte	.LLST14
	.byte	0x15
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x142
	.byte	0x18
	.4byte	0x7c
	.4byte	.LLST15
	.byte	0x15
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x143
	.byte	0x23
	.4byte	0x398
	.4byte	.LLST16
	.byte	0x1a
	.4byte	0x814
	.4byte	.LBB20
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x1
	.2byte	0x172
	.byte	0x9
	.4byte	0x518
	.byte	0x1e
	.4byte	0x82b
	.byte	0x1b
	.4byte	0x821
	.4byte	.LLST17
	.byte	0
	.byte	0x17
	.4byte	.LVL35
	.4byte	0x6f0
	.4byte	0x52c
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL37
	.4byte	0x87f
	.byte	0x17
	.4byte	.LVL39
	.4byte	0x88b
	.4byte	0x54e
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x17
	.4byte	.LVL40
	.4byte	0x898
	.4byte	0x56d
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x38
	.byte	0
	.byte	0x1c
	.4byte	.LVL41
	.4byte	0x57d
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL42
	.4byte	0x85b
	.byte	0x16
	.4byte	.LVL46
	.4byte	0x867
	.byte	0
	.byte	0x19
	.4byte	.LASF68
	.byte	0x1
	.2byte	0x120
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x60b
	.byte	0x14
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x120
	.byte	0x23
	.4byte	0x148
	.4byte	.LLST9
	.byte	0x15
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x122
	.byte	0x18
	.4byte	0x7c
	.4byte	.LLST10
	.byte	0x1a
	.4byte	0x7f6
	.4byte	.LBB14
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.2byte	0x130
	.byte	0x5
	.4byte	0x5e8
	.byte	0x1b
	.4byte	0x803
	.4byte	.LLST11
	.byte	0
	.byte	0x1c
	.4byte	.LVL28
	.4byte	0x5f8
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL29
	.4byte	0x85b
	.byte	0x1f
	.4byte	.LVL33
	.4byte	0x867
	.byte	0
	.byte	0x20
	.4byte	.LASF69
	.byte	0x1
	.byte	0xee
	.byte	0x6
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x6f0
	.byte	0x21
	.4byte	.LASF59
	.byte	0x1
	.byte	0xee
	.byte	0x27
	.4byte	0x155
	.4byte	.LLST2
	.byte	0x21
	.4byte	.LASF19
	.byte	0x1
	.byte	0xef
	.byte	0x2f
	.4byte	0x15b
	.4byte	.LLST3
	.byte	0x21
	.4byte	.LASF18
	.byte	0x1
	.byte	0xf0
	.byte	0x21
	.4byte	0x1f6
	.4byte	.LLST4
	.byte	0x22
	.4byte	.LASF65
	.byte	0x1
	.byte	0xf2
	.byte	0x18
	.4byte	0x7c
	.4byte	.LLST5
	.byte	0x22
	.4byte	.LASF61
	.byte	0x1
	.byte	0xf3
	.byte	0x23
	.4byte	0x398
	.4byte	.LLST6
	.byte	0x1a
	.4byte	0x814
	.4byte	.LBB6
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.2byte	0x113
	.byte	0x9
	.4byte	0x699
	.byte	0x1b
	.4byte	0x82b
	.4byte	.LLST7
	.byte	0x1b
	.4byte	0x821
	.4byte	.LLST8
	.byte	0
	.byte	0x17
	.4byte	.LVL14
	.4byte	0x6f0
	.4byte	0x6ad
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x17
	.4byte	.LVL17
	.4byte	0x898
	.4byte	0x6cd
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x18
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0x91
	.byte	0x6c
	.byte	0x6
	.byte	0x18
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x38
	.byte	0
	.byte	0x1c
	.4byte	.LVL18
	.4byte	0x6dd
	.byte	0x18
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0x16
	.4byte	.LVL19
	.4byte	0x85b
	.byte	0x1f
	.4byte	.LVL26
	.4byte	0x867
	.byte	0
	.byte	0x23
	.4byte	.LASF70
	.byte	0x1
	.byte	0xdb
	.byte	0x1
	.4byte	0x398
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x72b
	.byte	0x21
	.4byte	.LASF19
	.byte	0x1
	.byte	0xdb
	.byte	0x35
	.4byte	0x15b
	.4byte	.LLST0
	.byte	0x22
	.4byte	.LASF71
	.byte	0x1
	.byte	0xdd
	.byte	0x9
	.4byte	0x75
	.4byte	.LLST1
	.byte	0
	.byte	0x24
	.4byte	.LASF92
	.byte	0x1
	.byte	0xca
	.byte	0x6
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.byte	0x1
	.byte	0x9c
	.byte	0x20
	.4byte	.LASF72
	.byte	0x1
	.byte	0xba
	.byte	0x6
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x762
	.byte	0x25
	.4byte	.LASF73
	.byte	0x1
	.byte	0xba
	.byte	0x23
	.4byte	0x28a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x20
	.4byte	.LASF74
	.byte	0x1
	.byte	0xaf
	.byte	0x6
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.4byte	0x787
	.byte	0x25
	.4byte	.LASF73
	.byte	0x1
	.byte	0xaf
	.byte	0x24
	.4byte	0x28a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x20
	.4byte	.LASF75
	.byte	0x1
	.byte	0x9c
	.byte	0x6
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.byte	0x1
	.byte	0x9c
	.4byte	0x7ac
	.byte	0x25
	.4byte	.LASF73
	.byte	0x1
	.byte	0x9c
	.byte	0x27
	.4byte	0x28a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x20
	.4byte	.LASF76
	.byte	0x1
	.byte	0x8a
	.byte	0x6
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.byte	0x1
	.byte	0x9c
	.4byte	0x7d1
	.byte	0x25
	.4byte	.LASF73
	.byte	0x1
	.byte	0x8a
	.byte	0x26
	.4byte	0x28a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x20
	.4byte	.LASF77
	.byte	0x1
	.byte	0x7f
	.byte	0x6
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.byte	0x1
	.byte	0x9c
	.4byte	0x7f6
	.byte	0x25
	.4byte	.LASF73
	.byte	0x1
	.byte	0x7f
	.byte	0x26
	.4byte	0x28a
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x26
	.4byte	.LASF78
	.byte	0x2
	.byte	0x56
	.byte	0x16
	.byte	0x3
	.4byte	0x80e
	.byte	0x27
	.string	"n"
	.byte	0x2
	.byte	0x56
	.byte	0x30
	.4byte	0x80e
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xd1
	.byte	0x26
	.4byte	.LASF79
	.byte	0x2
	.byte	0x3a
	.byte	0x16
	.byte	0x3
	.4byte	0x836
	.byte	0x27
	.string	"l"
	.byte	0x2
	.byte	0x3a
	.byte	0x36
	.4byte	0x80e
	.byte	0x27
	.string	"n"
	.byte	0x2
	.byte	0x3a
	.byte	0x44
	.4byte	0x80e
	.byte	0
	.byte	0x28
	.4byte	.LASF80
	.4byte	.LASF80
	.byte	0x4
	.byte	0xb4
	.byte	0x6
	.byte	0x28
	.4byte	.LASF81
	.4byte	.LASF81
	.byte	0x4
	.byte	0xb5
	.byte	0x6
	.byte	0x29
	.4byte	.LASF82
	.4byte	.LASF82
	.byte	0x4
	.2byte	0x1f5
	.byte	0xc
	.byte	0x28
	.4byte	.LASF83
	.4byte	.LASF83
	.byte	0x5
	.byte	0x5f
	.byte	0xb
	.byte	0x28
	.4byte	.LASF84
	.4byte	.LASF84
	.byte	0x5
	.byte	0x60
	.byte	0x6
	.byte	0x28
	.4byte	.LASF85
	.4byte	.LASF85
	.byte	0x4
	.byte	0xf5
	.byte	0x6
	.byte	0x28
	.4byte	.LASF86
	.4byte	.LASF86
	.byte	0x4
	.byte	0xf4
	.byte	0x7
	.byte	0x29
	.4byte	.LASF87
	.4byte	.LASF87
	.byte	0x4
	.2byte	0x1f2
	.byte	0x7
	.byte	0x29
	.4byte	.LASF88
	.4byte	.LASF88
	.byte	0x4
	.2byte	0x201
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0x5
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
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
	.byte	0xb
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
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
	.byte	0x1e
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x20
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
	.byte	0x23
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
	.byte	0x24
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
	.byte	0x25
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
	.byte	0x20
	.byte	0xb
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
	.byte	0
	.byte	0
	.byte	0x28
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
	.byte	0x29
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
.LLST23:
	.4byte	.LVL62
	.4byte	.LVL63-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL63-1
	.4byte	.LVL68
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL68
	.4byte	.LVL69
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL72
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL72
	.4byte	.LVL74
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL74
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL62
	.4byte	.LVL63-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL63-1
	.4byte	.LFE28
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL62
	.4byte	.LVL66
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL70
	.2byte	0x3
	.byte	0x82
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL70
	.4byte	.LVL73
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL74
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL62
	.4byte	.LVL65
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL65
	.4byte	.LVL67
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL69
	.4byte	.LVL73
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL74
	.4byte	.LFE28
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL62
	.4byte	.LVL64
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL64
	.4byte	.LVL66
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL66
	.4byte	.LVL67
	.2byte	0x3
	.byte	0x79
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL69
	.4byte	.LVL73
	.2byte	0x3
	.byte	0x79
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL74
	.4byte	.LFE28
	.2byte	0x3
	.byte	0x79
	.byte	0x7c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL60
	.4byte	.LVL61
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL61
	.4byte	.LFE27
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL58
	.4byte	.LVL59
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL59
	.4byte	.LFE26
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL50
	.4byte	.LVL51-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL51-1
	.4byte	.LVL56
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL56
	.4byte	.LVL57-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL57-1
	.4byte	.LFE25
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL52
	.4byte	.LVL55-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL53
	.4byte	.LVL54
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL35-1
	.4byte	.LVL49
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL49
	.4byte	.LFE24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL35-1
	.4byte	.LVL48
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL48
	.4byte	.LFE24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL38
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL47
	.4byte	.LFE24
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL42
	.4byte	.LVL46-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL36
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL44
	.4byte	.LVL46
	.2byte	0x3
	.byte	0x79
	.byte	0x7c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL43
	.4byte	.LVL44
	.2byte	0x3
	.byte	0x79
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LVL45
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL27
	.4byte	.LVL28-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL28-1
	.4byte	.LVL32
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL32
	.4byte	.LVL33-1
	.2byte	0x3
	.byte	0x7f
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL33-1
	.4byte	.LFE23
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL29
	.4byte	.LVL33-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL13
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL23
	.4byte	.LVL26-1
	.2byte	0x3
	.byte	0x7f
	.byte	0x74
	.byte	0x9f
	.4byte	.LVL26-1
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL12
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL14-1
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL15
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL12
	.4byte	.LVL14-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL14-1
	.4byte	.LVL25
	.2byte	0x2
	.byte	0x91
	.byte	0x6c
	.4byte	.LVL25
	.4byte	.LFE22
	.2byte	0x2
	.byte	0x72
	.byte	0x6c
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL19
	.4byte	.LVL26-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL16
	.4byte	.LVL21
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL21
	.4byte	.LVL24
	.2byte	0x3
	.byte	0x79
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26-1
	.2byte	0x6
	.byte	0x7f
	.byte	0x4
	.byte	0x6
	.byte	0x34
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL20
	.4byte	.LVL21
	.2byte	0x3
	.byte	0x79
	.byte	0x4
	.byte	0x9f
	.4byte	.LVL21
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL5
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
	.4byte	.LVL11
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL11
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5f
	.4byte	.LVL9
	.4byte	.LFE21
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x84
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
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB6
	.4byte	.LBE6
	.4byte	.LBB10
	.4byte	.LBE10
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	0
	.4byte	0
	.4byte	.LBB14
	.4byte	.LBE14
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB19
	.4byte	.LBE19
	.4byte	0
	.4byte	0
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0
	.4byte	0
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	0
	.4byte	0
	.4byte	.LFB15
	.4byte	.LFE15
	.4byte	.LFB16
	.4byte	.LFE16
	.4byte	.LFB17
	.4byte	.LFE17
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
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	.LFB27
	.4byte	.LFE27
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF64:
	.string	"rt_object_is_systemobject"
.LASF63:
	.string	"rt_object_get_type"
.LASF39:
	.string	"object_list"
.LASF75:
	.string	"rt_object_trytake_sethook"
.LASF69:
	.string	"rt_object_init"
.LASF54:
	.string	"rt_object_attach_hook"
.LASF61:
	.string	"information"
.LASF48:
	.string	"RT_Object_Info_MessageQueue"
.LASF11:
	.string	"rt_ubase_t"
.LASF1:
	.string	"short int"
.LASF59:
	.string	"object"
.LASF68:
	.string	"rt_object_detach"
.LASF53:
	.string	"rt_object_container"
.LASF62:
	.string	"rt_object_find"
.LASF79:
	.string	"rt_list_insert_after"
.LASF52:
	.string	"RT_Object_Info_Unknown"
.LASF49:
	.string	"RT_Object_Info_MemPool"
.LASF87:
	.string	"rt_memset"
.LASF37:
	.string	"RT_Object_Class_Static"
.LASF24:
	.string	"rt_object_t"
.LASF81:
	.string	"rt_exit_critical"
.LASF9:
	.string	"rt_bool_t"
.LASF71:
	.string	"index"
.LASF44:
	.string	"RT_Object_Info_Semaphore"
.LASF80:
	.string	"rt_enter_critical"
.LASF67:
	.string	"rt_object_delete"
.LASF41:
	.string	"rt_object_class_type"
.LASF89:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF43:
	.string	"RT_Object_Info_Thread"
.LASF46:
	.string	"RT_Object_Info_Event"
.LASF26:
	.string	"RT_Object_Class_Semaphore"
.LASF65:
	.string	"temp"
.LASF90:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/src/object.c"
.LASF28:
	.string	"RT_Object_Class_Event"
.LASF74:
	.string	"rt_object_take_sethook"
.LASF66:
	.string	"rt_object_allocate"
.LASF2:
	.string	"long int"
.LASF72:
	.string	"rt_object_put_sethook"
.LASF10:
	.string	"rt_base_t"
.LASF4:
	.string	"unsigned char"
.LASF77:
	.string	"rt_object_attach_sethook"
.LASF29:
	.string	"RT_Object_Class_MailBox"
.LASF60:
	.string	"node"
.LASF18:
	.string	"name"
.LASF76:
	.string	"rt_object_detach_sethook"
.LASF85:
	.string	"rt_free"
.LASF91:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF92:
	.string	"rt_system_object_init"
.LASF0:
	.string	"signed char"
.LASF7:
	.string	"long long unsigned int"
.LASF19:
	.string	"type"
.LASF22:
	.string	"unsigned int"
.LASF8:
	.string	"rt_uint8_t"
.LASF58:
	.string	"rt_object_put_hook"
.LASF86:
	.string	"rt_malloc"
.LASF35:
	.string	"RT_Object_Class_Module"
.LASF70:
	.string	"rt_object_get_information"
.LASF84:
	.string	"rt_hw_interrupt_enable"
.LASF3:
	.string	"long long int"
.LASF23:
	.string	"char"
.LASF33:
	.string	"RT_Object_Class_Device"
.LASF40:
	.string	"object_size"
.LASF21:
	.string	"list"
.LASF5:
	.string	"short unsigned int"
.LASF32:
	.string	"RT_Object_Class_MemPool"
.LASF47:
	.string	"RT_Object_Info_MailBox"
.LASF83:
	.string	"rt_hw_interrupt_disable"
.LASF30:
	.string	"RT_Object_Class_MessageQueue"
.LASF45:
	.string	"RT_Object_Info_Mutex"
.LASF55:
	.string	"rt_object_detach_hook"
.LASF6:
	.string	"long unsigned int"
.LASF27:
	.string	"RT_Object_Class_Mutex"
.LASF16:
	.string	"rt_list_node"
.LASF36:
	.string	"RT_Object_Class_Unknown"
.LASF38:
	.string	"rt_object_information"
.LASF88:
	.string	"rt_strncpy"
.LASF56:
	.string	"rt_object_trytake_hook"
.LASF51:
	.string	"RT_Object_Info_Timer"
.LASF34:
	.string	"RT_Object_Class_Timer"
.LASF17:
	.string	"rt_object"
.LASF15:
	.string	"rt_list_t"
.LASF20:
	.string	"flag"
.LASF78:
	.string	"rt_list_remove"
.LASF14:
	.string	"prev"
.LASF31:
	.string	"RT_Object_Class_MemHeap"
.LASF42:
	.string	"rt_object_info_type"
.LASF57:
	.string	"rt_object_take_hook"
.LASF50:
	.string	"RT_Object_Info_Device"
.LASF12:
	.string	"rt_size_t"
.LASF25:
	.string	"RT_Object_Class_Thread"
.LASF13:
	.string	"next"
.LASF73:
	.string	"hook"
.LASF82:
	.string	"rt_strncmp"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
