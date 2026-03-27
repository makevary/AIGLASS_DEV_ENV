	.arch armv7-a
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 2
	.file	"rockit_isp.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_get_tb_stream_info:					
	.asciz 	"rockit_get_tb_stream_info"					
__kstrtabns_rockit_get_tb_stream_info:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rockit_free_tb_stream_buf:					
	.asciz 	"rockit_free_tb_stream_buf"					
__kstrtabns_rockit_free_tb_stream_buf:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_ioctl, %function
rockit_rkisp_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_ioctl, .-rockit_rkisp_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_open, %function
rockit_rkisp_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_open, .-rockit_rkisp_open
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rk_cam_num_setup, %function
rk_cam_num_setup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, r2
	bl	simple_strtoul
	ldr	r3, .L4
	str	r0, [r3]
	movs	r0, #1
	pop	{r3, pc}
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.fnend
	.size	rk_cam_num_setup, .-rk_cam_num_setup
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_destroy_ctx, %function
isp_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	kfree
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	isp_destroy_ctx, .-isp_destroy_ctx
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_buf_que, %function
rockit_rkisp_buf_que:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r1
	.pad #28
	sub	sp, sp, #28
	mov	r7, r0
	cmp	r0, #0
	beq	.L8
	ldr	r4, [r0, #316]
	cmp	r4, #0
	beq	.L20
	ldrb	r0, [r4, #84]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L8
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	fp, .L27+12
	movs	r5, #0
.L9:
	movs	r1, #0
	mov	r0, r7
	bl	mpi_node_request_buf
	mov	r6, r0
	cbz	r0, .L15
	ldr	r3, [r6]
	movs	r1, #5
	ldr	r2, .L27
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r7]
	str	r3, [sp, #8]
	ldr	r3, [r7, #80]
	ldr	r3, [r3, #80]
	str	r3, [sp, #4]
	movw	r3, #299
	str	r3, [sp]
	ldr	r3, .L27+4
	bl	vlog
	add	r1, r4, #96
	movs	r3, #0
.L13:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L10
	ldr	r0, [r2]
	ldr	r2, [r6]
	cmp	r0, r2
	bne	.L26
.L11:
	add	r10, r4, r3, lsl #3
	ldrb	r2, [r10, #100]	@ zero_extendqisi2
	cbz	r2, .L14
	ldr	r1, [r6]
	ldr	r0, .L27+8
	bl	printk
	movs	r3, #3
	mov	r0, r6
	str	r3, [r4, #88]
	bl	mpi_obj_unref
.L15:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r5, #0
	it	ne
	movne	r0, #1
.L8:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L10:
	add	r2, r3, #12
	str	r6, [r4, r2, lsl #3]
	b	.L11
.L26:
	adds	r3, r3, #1
	cmp	r3, #20
	bne	.L13
	b	.L11
.L14:
	movs	r1, #1
	strb	r1, [r10, #100]
	ldr	r0, [r7, #92]
	strd	r7, r6, [r4, #304]
	strb	r1, [r4, #256]
	str	r0, [r4, #280]
	ldr	r1, [r6]
	str	r1, [r4, #272]
	ldr	r1, [r6, #484]
	str	r1, [r4, #324]
	ldr	r1, [r7, #80]
	ldr	r1, [r1, #80]
	str	r1, [r4, #260]
	ldr	r1, [fp]
	cbnz	r1, .L16
.L17:
	adds	r5, r5, #1
	cmp	r5, r8
	bne	.L9
	b	.L15
.L16:
	add	r0, r4, #256
	str	r2, [sp, #20]
	blx	r1
	cmp	r0, #0
	ldr	r2, [sp, #20]
	bge	.L17
	movs	r3, #3
	strb	r2, [r10, #100]
	mov	r0, r6
	str	r3, [r4, #88]
	bl	mpi_obj_unref
	ldr	r3, [r4, #324]
	cmp	r3, #0
	beq	.L17
	b	.L15
.L20:
	mov	r0, r4
	b	.L8
.L28:
	.align	2
.L27:
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	.word	.LANCHOR2
	.fnend
	.size	rockit_rkisp_buf_que, .-rockit_rkisp_buf_que
	.align	1
	.global	visp_tasklet_fn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	visp_tasklet_fn, %function
visp_tasklet_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r5, #124]!
.L32:
	subs	r4, r4, #84
	add	r3, r4, #84
	cmp	r3, r5
	bne	.L31
	pop	{r3, r4, r5, pc}
.L31:
	mov	r0, r4
	movs	r1, #0
	bl	mpi_node_buffer_available
	ldr	r4, [r4, #84]
	b	.L32
	.fnend
	.size	visp_tasklet_fn, .-visp_tasklet_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_compat_ioctl, %function
rockit_rkisp_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rockit_rkisp_compat_ioctl, .-rockit_rkisp_compat_ioctl
	.align	1
	.global	rockit_rkisp_mpibuf_done
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_mpibuf_done, %function
rockit_rkisp_mpibuf_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	.pad #20
	sub	sp, sp, #20
	cbnz	r0, .L35
	movs	r3, #174
	ldr	r2, .L92
	str	r3, [sp]
	ldr	r3, .L92+4
.L90:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L78:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L35:
	ldr	r7, [r0, #48]
	cbnz	r7, .L37
	ldr	r2, .L92+8
	ldr	r3, [r2, #4]
	cmp	r3, #9
	add	r1, r3, #1
	str	r1, [r2, #4]
	bgt	.L78
	movs	r3, #179
	ldr	r2, .L92+12
	str	r3, [sp]
	ldr	r3, .L92+4
	b	.L90
.L37:
	ldr	r3, [r0, #28]
	ldr	r6, [r7, #316]
	cmp	r3, #0
	beq	.L39
	movs	r1, #0
	mov	r0, r7
	bl	mpi_node_request_buf
	mov	r4, r0
.L40:
	cmp	r4, #0
	beq	.L78
	ldr	r3, [r7, #116]
	cmp	r3, #0
	beq	.L42
	ldr	r2, [r3, #40]
	cmp	r2, #0
	beq	.L42
	ldr	r2, [r3, #28]
	str	r2, [r4, #672]
	ldr	r2, [r3, #24]
	str	r2, [r4, #668]
	ldr	r2, [r3, #24]
	str	r2, [r4, #676]
	ldr	r3, [r3, #28]
.L89:
	str	r3, [r4, #680]
	mov	r8, #0
	ldr	r3, .L92+16
	ldr	r2, [r5, #96]
	sub	r9, r3, #48
.L45:
	ldr	r1, [r3, r8, lsl #3]
	cmp	r2, r1
	beq	.L44
	add	r8, r8, #1
	cmp	r8, #24
	bne	.L45
	movs	r3, #210
	ldr	r2, .L92+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L92+4
	movs	r0, #8
	bl	vlog
.L44:
	add	r8, r9, r8, lsl #3
	mov	r2, #1000
	ldr	r3, [r8, #52]
	str	r3, [r4, #688]
	add	r3, sp, #12
	ldrd	r0, [r5, #120]
	bl	div_s64_rem
	strd	r0, [r4, #720]
	ldr	r3, [r5, #116]
	str	r3, [r4, #716]
	ldr	r8, [r5, #28]
	str	r8, [r4, #636]
	ldr	r3, [r7, #80]
	ldr	r9, [r3, #80]
	mov	r0, r9
	bl	strlen
	add	r0, r0, r9
	ldrb	r0, [r0, #-1]	@ zero_extendqisi2
	subs	r0, r0, #48
	str	r0, [r4, #640]
	ldrb	r1, [r5, #140]	@ zero_extendqisi2
	str	r1, [r4, #644]
	ldrb	r3, [r5, #3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L47
	orr	r3, r8, #4
.L48:
	str	r3, [r4, #636]
	movw	r3, #7636
	ldrb	r3, [r6, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L49
	bl	mcu_wrap_set_id
.L50:
	movs	r2, #0
	mov	r1, r4
	mov	r0, r7
	bl	mpi_node_buffer_out
	subs	r0, r0, #1
	cmp	r0, #1
	bls	.L51
	mov	r0, r7
	bl	vvi_node_buf_ready
.L51:
	movw	r3, #7636
	ldrb	r3, [r6, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L52
	movw	r3, #7637
	ldrb	r3, [r6, r3]	@ zero_extendqisi2
	cbz	r3, .L91
	ldr	r3, [r7, #80]
	ldr	r0, [r3, #80]
	bl	rkisp_rockit_get_isp_mode
	cmp	r0, #3
	bne	.L91
	add	r6, r6, #7616
	ldr	r7, .L92+24
	ldr	r8, .L92+36
	adds	r6, r6, #16
	movs	r5, #0
.L55:
	ldr	r3, [r6]
	ldr	r3, [r3]
	ubfx	r3, r3, #0, #11
	cbz	r3, .L57
	ldr	r3, [r7, #4]
	mov	r0, r8
	blx	r3
	ldr	r3, .L92+28
	adds	r5, r5, #1
	ldr	r3, [r3, #4]
	cmp	r3, r5
	bne	.L55
.L57:
	cbz	r5, .L91
	mov	r3, r5
	movs	r2, #245
	ldr	r1, .L92+4
	ldr	r0, .L92+32
	bl	printk
.L91:
	mov	r0, r4
	bl	mpi_obj_unref
	b	.L78
.L39:
	ldr	r4, [r0, #52]
	b	.L40
.L42:
	ldr	r3, [r5, #80]
	str	r3, [r4, #672]
	ldr	r3, [r5, #76]
	str	r3, [r4, #668]
	ldr	r3, [r5, #84]
	str	r3, [r4, #676]
	ldr	r3, [r5, #88]
	b	.L89
.L47:
	orr	r3, r8, #2
	b	.L48
.L49:
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L50
	movs	r3, #2
	str	r3, [r6, #88]
	b	.L50
.L52:
	cmp	r6, #0
	beq	.L91
	add	r1, r6, #96
.L59:
	ldr	r2, [r1, r3, lsl #3]
	cbz	r2, .L60
	ldr	r0, [r4]
	ldr	r2, [r2]
	cmp	r0, r2
	bne	.L60
	adds	r3, r3, #12
	movs	r2, #0
	add	r3, r6, r3, lsl #3
	strb	r2, [r3, #4]
.L61:
	mov	r0, r4
	bl	mpi_obj_unref
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L78
	movs	r3, #1
	str	r3, [r6, #88]
	b	.L78
.L60:
	adds	r3, r3, #1
	cmp	r3, #20
	bne	.L59
	b	.L61
.L93:
	.align	2
.L92:
	.word	.LC2
	.word	.LANCHOR1+21
	.word	.LANCHOR2
	.word	.LC3
	.word	.LANCHOR1+48
	.word	.LC5
	.word	arm_delay_ops
	.word	.LANCHOR0
	.word	.LC4
	.word	214748000
	.fnend
	.size	rockit_rkisp_mpibuf_done, .-rockit_rkisp_mpibuf_done
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_handle_message, %function
rockit_rkisp_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r7, r0
	ldr	r3, [r0, #36]
	mov	r5, r1
	mov	r6, r2
	cmp	r3, #1
	beq	.L95
.L122:
	movs	r5, #0
	b	.L96
.L95:
	cbnz	r0, .L97
	mov	r3, #356
	ldr	r2, .L146
	str	r3, [sp]
	ldr	r3, .L146+4
.L145:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L122
.L97:
	ldr	r4, [r0, #316]
	cbz	r4, .L98
	add	r8, r4, #256
	cmp	r1, #6
	bhi	.L122
	adr	r3, .L100
	ldr	pc, [r3, r1, lsl #2]
	.p2align 2
.L100:
	.word	.L103+1
	.word	.L122+1
	.word	.L122+1
	.word	.L122+1
	.word	.L102+1
	.word	.L101+1
	.word	.L99+1
	.p2align 1
.L98:
	mov	r3, #368
	ldr	r2, .L146+8
	str	r3, [sp]
	ldr	r3, .L146+4
	b	.L145
.L102:
	cbnz	r2, .L104
.L141:
	mov	r5, #-1
.L96:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L104:
	ldr	r3, [r0, #92]
	str	r3, [r4, #280]
	ldr	r3, [r0, #80]
	ldr	r3, [r3, #80]
	str	r3, [r4, #260]
	ldr	r3, [r2, #20]
	cmp	r3, #2
	bne	.L105
	mov	r4, r3
.L109:
	mov	r0, r8
	bl	rkisp_rockit_pause_stream
	cbz	r0, .L106
	ldr	r1, .L146+4
	mov	r2, #382
	ldr	r0, .L146+12
.L143:
	bl	printk
	b	.L141
.L106:
	ldrd	r2, r3, [r6, #52]
	mov	r0, r8
	ldr	r1, [r6, #48]
	bl	rkisp_rockit_config_stream
	cbz	r0, .L107
	mov	r2, #388
	ldr	r1, .L146+4
	ldr	r0, .L146+16
	b	.L143
.L107:
	mov	r0, r8
	bl	rkisp_rockit_resume_stream
	cbz	r0, .L108
	mov	r2, #394
	ldr	r1, .L146+4
	ldr	r0, .L146+20
	b	.L143
.L108:
	cmp	r4, #1
	beq	.L122
	movs	r4, #1
	b	.L109
.L105:
	cmp	r3, #1
	bne	.L111
	ldr	r3, [r2, #56]
	movw	r2, #7636
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	strb	r3, [r4, r2]
	ldr	r3, [r6, #148]
	movw	r2, #7637
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	strb	r3, [r4, r2]
	b	.L122
.L111:
	cmp	r3, #3
	bne	.L122
	ldr	r1, [r2, #32]
	ldr	r3, [r2, #24]
	ldr	r2, [r2, #40]
	add	r2, r2, r1
	cmp	r2, r3
	bgt	.L141
	ldr	r0, [r6, #36]
	ldr	r2, [r6, #44]
	ldr	r5, [r6, #28]
	add	r2, r2, r0
	cmp	r2, r5
	bgt	.L141
	mla	r3, r0, r3, r1
	movs	r5, #0
	str	r3, [r4, #288]
	ldr	r2, [r6, #36]
	ldr	r3, [r6, #28]
	ldr	r1, [r6, #24]
	add	r2, r2, r2, lsr #31
	add	r3, r3, r2, asr #1
	ldr	r2, [r6, #32]
	str	r5, [r4, #296]
	mla	r3, r1, r3, r2
	str	r3, [r4, #292]
	ldr	r3, [r6, #24]
	str	r3, [r4, #300]
	b	.L96
.L103:
	ldrb	r3, [r4, #84]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L122
	ldr	r3, [r4, #88]
	movs	r1, #5
	ldr	r2, .L146+24
	movs	r0, #8
	strd	r4, r3, [sp, #4]
	mov	r3, #418
	str	r3, [sp]
	ldr	r3, .L146+4
	bl	vlog
	ldr	r1, [r4, #88]
	cmp	r1, #3
	bne	.L113
.L142:
	movs	r3, #0
	str	r3, [r4, #88]
	b	.L96
.L113:
	cmp	r1, #1
	bne	.L114
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	cmp	r0, #0
	beq	.L122
	b	.L142
.L114:
	cmp	r1, #2
	bne	.L115
	ldr	r0, [r7, #80]
	movs	r2, #0
	movs	r3, #1
	strd	r2, r3, [r4, #88]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #144]
	orr	r1, r3, #1
	str	r1, [r0, #144]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r1, r3, #31
	bmi	.L122
	adds	r0, r0, #140
	bl	__tasklet_schedule
	b	.L96
.L115:
	ldr	r1, [r4, #92]
	cmp	r1, #1
	bne	.L116
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	cmp	r0, #0
	beq	.L122
	movs	r3, #0
	str	r3, [r4, #92]
	b	.L96
.L116:
	movw	r3, #7636
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L122
	movs	r1, #1
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	b	.L96
.L101:
	movw	r3, #7636
	movs	r1, #1
	strb	r1, [r4, #84]
	ldrb	r3, [r4, r3]	@ zero_extendqisi2
	cbz	r3, .L124
	bl	rockit_rkisp_buf_que
.L118:
	ldr	r0, .L146+28
.L144:
	bl	printk
	b	.L122
.L124:
	ldr	r5, .L146+32
	movs	r4, #10
.L117:
	movs	r1, #20
	mov	r0, r7
	bl	rockit_rkisp_buf_que
	cmp	r0, #0
	bne	.L118
	movs	r0, #100
	bl	msleep
	cbz	r4, .L119
	subs	r4, r4, #1
	ldr	r2, [r7, #92]
	mov	r0, r5
	mov	r1, r4
	bl	printk
	b	.L117
.L119:
	ldr	r1, [r7, #92]
	ldr	r0, .L146+36
	bl	printk
	b	.L118
.L99:
	movs	r5, #0
	mov	r0, r8
	strb	r5, [r4, #84]
	add	r6, r4, #160
	bl	rkisp_rockit_free_stream_buf
.L121:
	ldr	r0, [r4, #96]
	cbz	r0, .L120
	ldrb	r3, [r4, #100]	@ zero_extendqisi2
	cbz	r3, .L120
	bl	mpi_obj_unref
	str	r5, [r4, #96]
	strb	r5, [r4, #100]
.L120:
	adds	r4, r4, #8
	cmp	r4, r6
	bne	.L121
	ldr	r0, .L146+40
	b	.L144
.L147:
	.align	2
.L146:
	.word	.LC6
	.word	.LANCHOR1+240
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC14
	.word	.LC12
	.word	.LC13
	.word	.LC15
	.fnend
	.size	rockit_rkisp_handle_message, .-rockit_rkisp_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	isp_create_ctx, %function
isp_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L153
	mov	r1, #3520
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, [r3, #52]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L148
	movs	r1, #4
	ldr	r0, .L153+4
	bl	ioremap
	movw	r3, #7632
	str	r0, [r4, r3]
.L148:
	mov	r0, r4
	pop	{r4, pc}
.L154:
	.align	2
.L153:
	.word	kmalloc_caches
	.word	552095776
	.fnend
	.size	isp_create_ctx, .-isp_create_ctx
	.align	1
	.global	rockit_free_tb_stream_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_free_tb_stream_buf, %function
rockit_free_tb_stream_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r1, #3520
	ldr	r3, .L158
	ldr	r0, [r3, #52]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L156
	ldr	r0, .L158+4
	bl	printk
	mov	r0, #-1
.L155:
	pop	{r3, r4, r5, pc}
.L156:
	ldr	r3, .L158+8
	movs	r4, #0
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_free_tb_stream_buf
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L155
.L159:
	.align	2
.L158:
	.word	kmalloc_caches
	.word	.LC16
	.word	.LC17
	.fnend
	.size	rockit_free_tb_stream_buf, .-rockit_free_tb_stream_buf
	.align	1
	.global	rockit_get_tb_stream_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_get_tb_stream_info, %function
rockit_get_tb_stream_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L163
	mov	r1, #3520
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r0, [r3, #52]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L161
	ldr	r0, .L163+4
	bl	printk
	mov	r0, #-1
.L160:
	pop	{r4, r5, r6, pc}
.L161:
	ldr	r3, .L163+8
	movs	r4, #0
	mov	r1, r6
	str	r4, [r0, #24]
	str	r3, [r0, #4]
	bl	rkisp_rockit_get_tb_stream_info
	mov	r0, r5
	bl	kfree
	mov	r0, r4
	b	.L160
.L164:
	.align	2
.L163:
	.word	kmalloc_caches
	.word	.LC16
	.word	.LC17
	.fnend
	.size	rockit_get_tb_stream_info, .-rockit_get_tb_stream_info
	.align	1
	.global	rockit_rkisp_dev_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_dev_register, %function
rockit_rkisp_dev_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #3264
	ldr	r6, .L182
	mov	r8, r0
	mov	r9, #0
	mov	r10, #1
	mov	fp, r9
	ldr	r0, [r6, #8]
	bl	kmem_cache_alloc
	movs	r2, #164
	movs	r1, #0
	mov	r4, r0
	bl	memset
	ldr	r3, .L182+4
	add	r7, r4, #96
	str	r7, [r4, #96]
	str	r7, [r4, #100]
	str	r3, [r4, #104]
	ldr	r3, .L182+8
	str	r3, [r4, #112]
	movs	r3, #2
	strd	r3, r3, [r4, #84]
	movs	r3, #3
	str	r3, [r4, #92]
.L166:
	ldr	r2, [r4, #88]
	ldr	r0, [r6, #20]
	cmp	r2, fp
	bgt	.L170
	ldr	r2, [r4, #84]
	add	r9, r9, #1
	cmp	r2, r9
	bgt	.L175
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbz	r0, .L173
	mov	r3, #-1
	movs	r1, #2
	str	r3, [r0, #16]
	strd	r1, r3, [r0, #8]
	mov	r1, #3520
	ldr	r0, [r6, #20]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L173
	movs	r3, #16
	movs	r2, #1
	strd	r3, r3, [r0, #8]
	strd	r2, r3, [r0]
	str	r3, [r0, #16]
	ldr	r3, [r4, #100]
	str	r5, [r4, #100]
	strd	r7, r3, [r5]
	str	r5, [r3]
.L173:
	mov	r2, r8
	movs	r1, #8
	mov	r0, r4
	bl	mpi_dev_register
	ldr	r3, .L182+12
	movs	r2, #0
	ldr	r1, .L182+16
	mov	r0, r4
	str	r3, [r4, #116]
	bl	mpi_sysfs_dev_add
	mov	r2, r4
	add	r0, r4, #140
	ldr	r1, .L182+20
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	tasklet_init
.L170:
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L168
	strd	r10, r9, [r0, #8]
	mov	r1, #3520
	str	fp, [r0, #16]
	ldr	r0, [r6, #4]
	bl	kmem_cache_alloc
	str	r0, [r5, #20]
	cbz	r0, .L168
	mov	r2, #2160
	mov	r3, #3840
	strd	r3, r2, [r0, #8]
	movs	r2, #64
	strd	r2, r10, [r0, #36]
	movs	r2, #4
	str	r2, [r0, #48]
	ldr	r2, [r0, #64]
	str	r10, [r0, #32]
	orr	r2, r2, #3
	str	r2, [r0, #64]
	ldr	r2, [r0, #68]
	str	r10, [r0, #44]
	orr	r2, r2, #3
	str	r2, [r0, #68]
	ldr	r2, [r0, #56]
	orr	r2, r2, #3
	str	r2, [r0, #56]
	ldr	r2, [r0, #60]
	orr	r2, r2, #3
	str	r2, [r0, #60]
	ldr	r2, [r0, #72]
	orr	r2, r2, #3
	str	r2, [r0, #72]
	ldr	r2, [r0, #76]
	orr	r2, r2, #14
	str	r2, [r0, #76]
	ldr	r2, [r4, #100]
	str	r5, [r4, #100]
	strd	r7, r2, [r5]
	str	r5, [r2]
.L168:
	add	fp, fp, #1
	b	.L166
.L175:
	mov	fp, #0
	b	.L166
.L183:
	.align	2
.L182:
	.word	kmalloc_caches
	.word	isp_create_ctx
	.word	isp_destroy_ctx
	.word	rockit_rkisp_handle_message
	.word	.LANCHOR1+268
	.word	visp_tasklet_fn
	.fnend
	.size	rockit_rkisp_dev_register, .-rockit_rkisp_dev_register
	.section	.init.text
	.align	1
	.global	rockit_rkisp_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_init, %function
rockit_rkisp_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movs	r4, #0
	ldr	r5, .L191
	.pad #20
	sub	sp, sp, #20
	mov	r1, r4
	strd	r4, r4, [sp, #4]
	ldr	r0, [r5]
	str	r4, [sp, #12]
	bl	rkisp_rockit_function_register
	movs	r1, #1
	str	r0, [r5]
	ldr	r0, .L191+4
	bl	rkisp_rockit_function_register
	add	r0, sp, #4
	bl	rkisp_rockit_get_ispdev
	add	r5, sp, #4
.L186:
	ldr	r0, [r5], #4
	cbz	r0, .L185
	bl	rockit_rkisp_dev_register
.L185:
	adds	r4, r4, #1
	cmp	r4, #3
	bne	.L186
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L192:
	.align	2
.L191:
	.word	.LANCHOR2
	.word	rockit_rkisp_mpibuf_done
	.fnend
	.size	rockit_rkisp_init, .-rockit_rkisp_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	rockit_rkisp_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rockit_rkisp_exit, %function
rockit_rkisp_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	add	r0, sp, #4
	movs	r3, #0
	strd	r3, r3, [sp, #4]
	str	r3, [sp, #12]
	bl	rkisp_rockit_get_ispdev
	mov	r5, r0
	cbnz	r0, .L193
	add	r4, sp, #4
.L198:
	ldr	r0, [r4], #4
	cbz	r0, .L196
	bl	mpi_dev_find_by_name
	mov	r6, r0
	cbz	r0, .L196
	bl	mpi_sysfs_dev_remove
	mov	r0, r6
	bl	mpi_dev_unregister
.L196:
	adds	r5, r5, #1
	cmp	r5, #3
	bne	.L198
.L193:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
	.fnend
	.size	rockit_rkisp_exit, .-rockit_rkisp_exit
	.global	rockit_buf_que
	.global	rk_cam_num
	.global	rk_virtual_vblank
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.41941, %object
	.size	__func__.41941, 21
__func__.41941:
	.ascii	"rockit_rkisp_buf_que\000"
	.type	__func__.41915, %object
	.size	__func__.41915, 25
__func__.41915:
	.ascii	"rockit_rkisp_mpibuf_done\000"
	.space	2
	.type	v4l2_rockit_fmt, %object
	.size	v4l2_rockit_fmt, 192
v4l2_rockit_fmt:
	.word	842094158
	.word	0
	.word	909203022
	.word	2
	.word	1345466932
	.word	7
	.word	1448695129
	.word	9
	.word	1498831189
	.word	10
	.word	875836505
	.word	14
	.word	1431918169
	.word	17
	.word	1498765654
	.word	18
	.word	1346520914
	.word	65536
	.word	1329743698
	.word	65538
	.word	875836498
	.word	65540
	.word	825770306
	.word	196608
	.word	1196573255
	.word	196609
	.word	1195528775
	.word	196610
	.word	1111967570
	.word	196611
	.word	808535874
	.word	196612
	.word	808534599
	.word	196613
	.word	808534338
	.word	196614
	.word	808535890
	.word	196615
	.word	842090306
	.word	196616
	.word	842089031
	.word	196617
	.word	842088770
	.word	196618
	.word	842090322
	.word	196619
	.word	844257602
	.word	196620
	.type	__func__.41966, %object
	.size	__func__.41966, 26
__func__.41966:
	.ascii	"rockit_rkisp_node_message\000"
	.space	2
	.type	rockit_rkisp_driver_fops, %object
	.size	rockit_rkisp_driver_fops, 128
rockit_rkisp_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	rockit_rkisp_ioctl
	.word	rockit_rkisp_compat_ioctl
	.word	0
	.space	4
	.word	rockit_rkisp_open
	.space	4
	.word	0
	.space	60
	.type	__param_str_rk_cam_num, %object
	.size	__param_str_rk_cam_num, 18
__param_str_rk_cam_num:
	.ascii	"rockit.rk_cam_num\000"
	.type	__param_str_rk_virtual_vblank, %object
	.size	__param_str_rk_virtual_vblank, 25
__param_str_rk_virtual_vblank:
	.ascii	"rockit.rk_virtual_vblank\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rk_cam_num, %object
	.size	rk_cam_num, 4
rk_cam_num:
	.word	1
	.type	rk_virtual_vblank, %object
	.size	rk_virtual_vblank, 4
rk_virtual_vblank:
	.word	10
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	rockit_buf_que, %object
	.size	rockit_buf_que, 4
rockit_buf_que:
	.space	4
	.type	__func____LINE__.41916, %object
	.size	__func____LINE__.41916, 4
__func____LINE__.41916:
	.space	4
	.section	.init.rodata,"a"
	.type	__setup_str_rk_cam_num_setup, %object
	.size	__setup_str_rk_cam_num_setup, 12
__setup_str_rk_cam_num_setup:
	.ascii	"rk_cam_num=\000"
	.section	.init.setup,"aw"
	.align	2
	.type	__setup_rk_cam_num_setup, %object
	.size	__setup_rk_cam_num_setup, 12
__setup_rk_cam_num_setup:
	.word	__setup_str_rk_cam_num_setup
	.word	rk_cam_num_setup
	.word	0
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_rk_cam_numtype231, %object
	.size	__UNIQUE_ID_rk_cam_numtype231, 32
__UNIQUE_ID_rk_cam_numtype231:
	.ascii	"rockit.parmtype=rk_cam_num:uint\000"
	.type	__UNIQUE_ID_rk_virtual_vblanktype230, %object
	.size	__UNIQUE_ID_rk_virtual_vblanktype230, 39
__UNIQUE_ID_rk_virtual_vblanktype230:
	.ascii	"rockit.parmtype=rk_virtual_vblank:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"vvi(%s-%d) processing, bufs: %d\000"
.LC1:
	.ascii	"isp qbuf error: repeated qubuf %d\012\000"
.LC2:
	.ascii	"\033[1;31merr, rockit_cfg null\033[0m\000"
.LC3:
	.ascii	"\033[1;31merr, node null\033[0m\000"
.LC4:
	.ascii	"%s, line %d: rockit hold cpu wait %d ms\000"
.LC5:
	.ascii	"\033[1;31mthe format is not find!\033[0m\000"
.LC6:
	.ascii	"\033[1;31merr:node null\033[0m\000"
.LC7:
	.ascii	"\033[1;31merr: ctx is null\033[0m\000"
.LC8:
	.ascii	"\0013%s[%d]:rkisp_rockit_pause_stream fail\000"
.LC9:
	.ascii	"\0013%s[%d]:rkisp_rockit_config_stream fail\000"
.LC10:
	.ascii	"\0013%s[%d]:rkisp_rockit_resume_stream fail\000"
.LC11:
	.ascii	"ispctx = %08x, ispctx->qbuf_flag = %d\000"
.LC12:
	.ascii	"rkisp queue buf retry cnt = %d, id = %d\000"
.LC13:
	.ascii	"rkisp queue buf fail, id = %d\000"
.LC14:
	.ascii	"rkisp queue buf done\000"
.LC15:
	.ascii	"rockit isp stream off\000"
.LC16:
	.ascii	"\0013no memory for rockit_cfg\000"
.LC17:
	.ascii	"rkisp-vir0\000"
	.section	___ksymtab_gpl+rockit_free_tb_stream_buf,"a"
	.align	2
	.type	__ksymtab_rockit_free_tb_stream_buf, %object
	.size	__ksymtab_rockit_free_tb_stream_buf, 12
__ksymtab_rockit_free_tb_stream_buf:
	.word	rockit_free_tb_stream_buf
	.word	__kstrtab_rockit_free_tb_stream_buf
	.word	__kstrtabns_rockit_free_tb_stream_buf
	.section	___ksymtab_gpl+rockit_get_tb_stream_info,"a"
	.align	2
	.type	__ksymtab_rockit_get_tb_stream_info, %object
	.size	__ksymtab_rockit_get_tb_stream_info, 12
__ksymtab_rockit_get_tb_stream_info:
	.word	rockit_get_tb_stream_info
	.word	__kstrtab_rockit_get_tb_stream_info
	.word	__kstrtabns_rockit_get_tb_stream_info
	.section	__param,"a"
	.align	2
	.type	__param_rk_cam_num, %object
	.size	__param_rk_cam_num, 20
__param_rk_cam_num:
	.word	__param_str_rk_cam_num
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_cam_num
	.type	__param_rk_virtual_vblank, %object
	.size	__param_rk_virtual_vblank, 20
__param_rk_virtual_vblank:
	.word	__param_str_rk_virtual_vblank
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_virtual_vblank
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
