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
	.file	"mpp_vcodec_base.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_vcodec_clear_buf_resource:					
	.asciz 	"mpp_vcodec_clear_buf_resource"					
__kstrtabns_mpp_vcodec_clear_buf_resource:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_vcodec_run_task:					
	.asciz 	"mpp_vcodec_run_task"					
__kstrtabns_mpp_vcodec_run_task:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_vcodec_set_online_mode:					
	.asciz 	"mpp_vcodec_set_online_mode"					
__kstrtabns_mpp_vcodec_set_online_mode:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_unbind, %function
mpp_vcodec_unbind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_vcodec_unbind, .-mpp_vcodec_unbind
	.align	1
	.global	mpp_vcodec_clear_buf_resource
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_clear_buf_resource, %function
mpp_vcodec_clear_buf_resource:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_vcodec_clear_buf_resource, .-mpp_vcodec_clear_buf_resource
	.align	1
	.global	mpp_vcodec_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_run_task, %function
mpp_vcodec_run_task:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_vcodec_enc_run_task
	.fnend
	.size	mpp_vcodec_run_task, .-mpp_vcodec_run_task
	.align	1
	.global	mpp_vcodec_set_online_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_set_online_mode, %function
mpp_vcodec_set_online_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_vcodec_enc_set_online_mode
	.fnend
	.size	mpp_vcodec_set_online_mode, .-mpp_vcodec_set_online_mode
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_msg_handle, %function
mpp_vcodec_msg_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r7, r1
	mov	r8, r2
	bl	get_mpidev_ops
	mov	r6, r0
	cbnz	r0, .L6
	movs	r1, #101
.L23:
	ldr	r0, .L25
	bl	printk
.L24:
	mov	r0, #-1
.L5:
	pop	{r4, r5, r6, r7, r8, pc}
.L6:
	bl	get_mpidev_ops
	cbnz	r0, .L8
	movs	r1, #79
	b	.L23
.L8:
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L24
	mov	r0, r5
	blx	r3
	cmp	r0, #0
	beq	.L24
	cmp	r0, #60
	beq	.L24
	ldr	r2, [r0, #-44]
	cmp	r2, #1
	bne	.L11
	ldr	r3, .L25+4
	ldr	r4, [r3, #3872]
.L12:
	ldr	r3, [r6, #8]
	cbnz	r3, .L13
	b	.L24
.L11:
	movs	r1, #115
	ldr	r0, .L25+8
	bl	printk
	b	.L12
.L13:
	mov	r2, r8
	mov	r1, r7
	mov	r0, r5
	blx	r3
	cmp	r0, #1
	bne	.L5
	cmp	r4, #0
	beq	.L5
	mov	r0, r4
	bl	vcodec_thread_trigger
	movs	r0, #0
	b	.L5
.L26:
	.align	2
.L25:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_msg_handle, .-mpp_vcodec_msg_handle
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__refcount_sub_and_test.constprop.7, %function
__refcount_sub_and_test.constprop.7:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r0, r1
	pld	[r1]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_fetch_sub
1:	ldrex	r3, [r0]
	sub	r2, r3, #1
	strex	r1, r2, [r0]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r3, #1
	bne	.L28
	mov	r0, r3
.L29:
	pop	{r3, pc}
.L28:
	cmp	r3, #0
	bgt	.L30
	movs	r1, #3
	bl	refcount_warn_saturate
.L30:
	movs	r0, #0
	b	.L29
	.fnend
	.size	__refcount_sub_and_test.constprop.7, .-__refcount_sub_and_test.constprop.7
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	__cmpxchg.constprop.10, %function
__cmpxchg.constprop.10:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	pld	[r0]
	mov	r3, r0
	movs	r2, #0
	push	{r4, lr}
	.save {r4, lr}
.L32:
	.syntax unified
@ 192 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/cmpxchg.h" 1
	@ __cmpxchg4
	ldrex	r0, [r3]
	mov	r4, #0
	teq	r0, r1
	strexeq r4, r2, [r3]

@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r4, #0
	bne	.L32
	pop	{r4, pc}
	.fnend
	.size	__cmpxchg.constprop.10, .-__cmpxchg.constprop.10
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chan_clear_buf_resource, %function
mpp_chan_clear_buf_resource:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r1, [r0, #204]
	adds	r0, r0, #204
	bl	__cmpxchg.constprop.10
	cbz	r0, .L35
	bl	hal_bufs_deinit
.L35:
	ldr	r1, [r4, #208]
	add	r0, r4, #208
	bl	__cmpxchg.constprop.10
	cbz	r0, .L36
	ldr	r1, .L51
	bl	mpp_buffer_put_with_caller
.L36:
	ldr	r1, [r4, #216]
	add	r0, r4, #216
	bl	__cmpxchg.constprop.10
	cbz	r0, .L37
	ldr	r1, .L51
	bl	mpp_buffer_put_with_caller
.L37:
	ldr	r1, [r4, #212]
	add	r0, r4, #212
	bl	__cmpxchg.constprop.10
	cbz	r0, .L38
	ldr	r1, .L51
	bl	mpp_buffer_put_with_caller
.L38:
	movs	r3, #0
	strd	r3, r3, [r4, #192]
	str	r3, [r4, #224]
	str	r3, [r4, #200]
	str	r3, [r4, #220]
	pop	{r4, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR1
	.fnend
	.size	mpp_chan_clear_buf_resource, .-mpp_chan_clear_buf_resource
	.align	1
	.global	vcodec_create_mpi_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_create_mpi_dev, %function
vcodec_create_mpi_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	bl	get_mpidev_ops
	ldr	r4, .L61
	ldr	r3, [r0]
	cbz	r3, .L54
	ldr	r2, [r4, #8]
	cbnz	r2, .L56
	ldr	r1, .L61+4
	ldr	r0, [r4, #4]
	blx	r3
	str	r0, [r4, #8]
.L54:
	ldr	r3, [r4, #8]
	cbnz	r3, .L56
	movs	r1, #147
	ldr	r0, .L61+8
	bl	printk
.L56:
	movs	r0, #0
	pop	{r4, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LC2
	.fnend
	.size	vcodec_create_mpi_dev, .-vcodec_create_mpi_dev
	.align	1
	.global	mpp_vcodec_get_free_chan
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_free_chan, %function
mpp_vcodec_get_free_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	mov	r2, r0
	push	{r4, lr}
	.save {r4, lr}
	bne	.L64
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L72
	movs	r4, #0
.L66:
	ldr	r1, [r3, #72]
	cbz	r1, .L65
	adds	r4, r4, #1
	adds	r3, r3, #232
	cmp	r4, #16
	bne	.L66
	mov	r4, #-1
.L65:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L63:
	mov	r0, r4
	pop	{r4, pc}
.L64:
	movs	r1, #207
	ldr	r0, .L72+4
	bl	printk
	b	.L63
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_free_chan, .-mpp_vcodec_get_free_chan
	.align	1
	.global	mpp_vcodec_get_chan_entry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_chan_entry, %function
mpp_vcodec_get_chan_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #1
	mov	r2, r1
	push	{r3, lr}
	.save {r3, lr}
	bne	.L75
	cmp	r0, #16
	bls	.L76
	mov	r2, r0
	movs	r3, #16
	movs	r1, #224
	ldr	r0, .L79
	bl	printk
.L78:
	movs	r0, #0
	b	.L74
.L76:
	ldr	r2, .L79+4
	movs	r3, #232
	mla	r0, r3, r0, r2
	adds	r0, r0, #16
.L74:
	pop	{r3, pc}
.L75:
	movs	r1, #230
	ldr	r0, .L79+8
	bl	printk
	b	.L78
.L80:
	.align	2
.L79:
	.word	.LC3
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_chan_entry, .-mpp_vcodec_get_chan_entry
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_bind, %function
mpp_vcodec_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	bl	get_mpidev_ops
	mov	r4, r0
	cbnz	r0, .L82
	movs	r1, #49
	ldr	r0, .L89
	bl	printk
.L81:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L82:
	ldr	r3, [r0, #16]
	cbz	r3, .L87
	mov	r0, r5
	blx	r3
	mov	r6, r0
.L84:
	ldr	r3, [r4, #20]
	cbz	r3, .L88
	mov	r0, r5
	blx	r3
	mov	r5, r0
.L85:
	mov	r1, r5
	mov	r0, r6
	bl	mpp_vcodec_get_chan_entry
	ldr	r4, [r0, #56]
	cbnz	r4, .L86
	mov	r3, r6
	mov	r2, r5
	movs	r1, #60
	ldr	r0, .L89+4
	bl	printk
	b	.L81
.L87:
	mov	r6, #-1
	b	.L84
.L88:
	movs	r5, #1
	b	.L85
.L86:
	add	r4, r0, #60
	b	.L81
.L90:
	.align	2
.L89:
	.word	.LC0
	.word	.LC4
	.fnend
	.size	mpp_vcodec_bind, .-mpp_vcodec_bind
	.align	1
	.global	mpp_vcodec_get_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_chan_num, %function
mpp_vcodec_get_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #1
	mov	r2, r0
	push	{r3, lr}
	.save {r3, lr}
	bne	.L92
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L94
	ldr	r0, [r2, #3728]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L91:
	pop	{r3, pc}
.L92:
	movs	r1, #250
	ldr	r0, .L94+4
	bl	printk
	movs	r0, #0
	b	.L91
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_get_chan_num, .-mpp_vcodec_get_chan_num
	.align	1
	.global	mpp_vcodec_inc_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_inc_chan_num, %function
mpp_vcodec_inc_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	mov	r2, r0
	bne	.L97
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L100
	ldr	r3, [r2, #3728]
	adds	r3, r3, #1
	str	r3, [r2, #3728]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L97:
	mov	r1, #268
	ldr	r0, .L100+4
	b	printk
.L101:
	.align	2
.L100:
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_inc_chan_num, .-mpp_vcodec_inc_chan_num
	.align	1
	.global	mpp_vcodec_dec_chan_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_dec_chan_num, %function
mpp_vcodec_dec_chan_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #1
	mov	r2, r0
	bne	.L103
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L106
	ldr	r3, [r2, #3728]
	subs	r3, r3, #1
	str	r3, [r2, #3728]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L103:
	mov	r1, #288
	ldr	r0, .L106+4
	b	printk
.L107:
	.align	2
.L106:
	.word	.LANCHOR0
	.word	.LC1
	.fnend
	.size	mpp_vcodec_dec_chan_num, .-mpp_vcodec_dec_chan_num
	.align	1
	.global	mpp_vcodec_chan_setup_hal_bufs
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_setup_hal_bufs, %function
mpp_vcodec_chan_setup_hal_bufs:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldrd	r2, r3, [r1, #32]
	mov	r6, r1
	ldrd	r5, r1, [r4, #192]
	.pad #36
	sub	sp, sp, #36
	mul	r0, r3, r2
	muls	r1, r5, r1
	cmp	r0, r1
	bhi	.L109
	ldr	r0, [r6, #40]
	ldr	r1, [r4, #224]
	cmp	r0, r1
	bls	.L110
.L109:
	ldr	r1, [r6, #4]
	cmp	r1, #8
	beq	.L110
	ldr	r1, [r6, #40]
	add	r8, r2, #63
	add	r7, r3, #63
	ldr	r0, .L163
	asr	r5, r8, #6
	str	r1, [sp, #8]
	movw	r1, #383
	asr	r9, r7, #6
	bl	printk
	ldr	fp, [r6, #52]
	mul	r9, r5, r9
	cmp	fp, #0
	beq	.L111
	lsl	r2, r9, #2
	adds	r2, r2, #255
	bic	r2, r2, #255
	lsl	fp, r2, #4
.L111:
	ldr	r0, [r4, #204]
	cbz	r0, .L112
	bl	hal_bufs_deinit
	movs	r3, #0
	str	r3, [r4, #204]
.L112:
	bic	r7, r7, #63
	bic	r3, r8, #63
	addw	r1, r7, #1023
	addw	r0, r3, #1023
	ldr	r2, [sp, #8]
	asrs	r1, r1, #10
	muls	r1, r3, r1
	it	mi
	addmi	r1, r1, #15
	asrs	r0, r0, #10
	bic	r8, r1, #15
	addw	r1, r3, #511
	str	r3, [sp, #12]
	add	r10, r2, #2
	asrs	r1, r1, #9
	muls	r1, r7, r1
	it	mi
	addmi	r1, r1, #31
	asrs	r1, r1, #5
	lsls	r1, r1, #4
	cmp	r8, r1
	it	cc
	movcc	r8, r1
	muls	r0, r7, r0
	it	mi
	addmi	r0, r0, #15
	addw	r1, r7, #511
	bic	r0, r0, #15
	cmp	r8, r0
	asr	r1, r1, #9
	it	cc
	movcc	r8, r0
	muls	r1, r3, r1
	it	mi
	addmi	r1, r1, #31
	add	r0, r4, #204
	asrs	r1, r1, #5
	lsls	r1, r1, #4
	cmp	r8, r1
	it	cc
	movcc	r8, r1
	bl	hal_bufs_init
	muls	r5, r7, r5
	it	mi
	addmi	r5, r5, #63
	ldr	r1, [r6, #24]
	asrs	r0, r5, #6
	lsls	r0, r0, #8
	add	r0, r0, #8160
	adds	r0, r0, #31
	bic	r0, r0, #8160
	bic	r0, r0, #31
	ldr	r3, [sp, #12]
	strd	r0, fp, [sp, #16]
	str	r8, [sp, #24]
	cmp	r1, #0
	beq	.L118
	movs	r3, #0
	movs	r2, #4
	str	r3, [sp, #28]
	mov	r1, r10
	add	r3, sp, #16
	ldr	r0, [r4, #204]
	bl	hal_bufs_setup
	ldr	r3, [r6, #32]
	ldr	r2, [r6, #36]
	adds	r3, r3, #63
	adds	r2, r2, #63
	bic	r1, r3, #63
	bic	r3, r2, #63
	cmp	r3, r1
	mul	r0, r3, r1
	it	lt
	movlt	r3, r1
	movs	r1, #48
	asrs	r5, r3, #1
	muls	r1, r3, r1
	add	r2, r0, r0, lsl #1
	cmp	r0, #0
	it	lt
	addlt	r0, r0, #63
	addw	r1, r1, #4095
	add	r1, r1, r2, asr #1
	ldr	r2, .L163+4
	add	r0, r5, r0, asr #6
	movs	r5, #240
	muls	r5, r3, r5
	add	r3, r3, r3, lsl #1
	addw	r3, r3, #4095
	ands	r1, r1, r2
	ands	r3, r3, r2
	addw	r0, r0, #4095
	addw	r5, r5, #4095
	ands	r0, r0, r2
	ands	r5, r5, r2
	add	r5, r5, r3
	add	r5, r5, r1
	add	r5, r5, r0
	ldr	r3, [sp, #8]
	cmp	r3, #0
	ble	.L120
	ldr	r3, [r6, #56]
	cmp	r3, #0
	beq	.L121
	add	r1, r1, r0
	add	r5, r5, r1
.L120:
	ldr	r0, [r4, #208]
	cbz	r0, .L122
	ldr	r1, .L163+8
	bl	mpp_buffer_put_with_caller
.L122:
	ldr	r3, .L163+8
	mov	r2, r5
	add	r1, r4, #208
	str	r3, [sp]
	movs	r3, #0
	mov	r0, r3
	bl	mpp_buffer_get_with_tag
	cmp	r0, #0
	bne	.L124
.L127:
	movs	r5, #0
.L125:
	cmp	r10, r5
	bhi	.L129
	ldrd	r2, r3, [r6, #32]
	cmp	r2, r3
	it	cc
	strdcc	r3, r2, [r6, #32]
	ldr	r5, [r6, #32]
	ldr	r3, [r4, #192]
	cmp	r5, r3
	bhi	.L131
.L132:
	ldr	r3, [r6, #32]
	str	r3, [r4, #192]
	ldr	r3, [r6, #36]
	str	r3, [r4, #196]
	ldr	r3, [r6, #40]
	str	r3, [r4, #224]
.L110:
	bl	get_vsm_ops
	mov	r5, r0
	cmp	r0, #0
	bne	.L137
	ldr	r6, [r6, #16]
	ldr	r3, [r4, #200]
	cmp	r6, r3
	bls	.L108
	ldr	r0, [r4, #216]
	cmp	r6, #16384
	it	cc
	movcc	r6, #16384
	cbz	r0, .L136
	ldr	r1, .L163+12
	bl	mpp_buffer_put_with_caller
	str	r5, [r4, #216]
.L136:
	ldr	r3, .L163+12
	addw	r2, r6, #4095
	bic	r2, r2, #4080
	add	r1, r4, #216
	bic	r2, r2, #15
	str	r3, [sp]
	movs	r3, #0
	mov	r0, r3
	bl	mpp_ring_buffer_get_with_tag
	cmp	r0, #0
	bne	.L124
	str	r6, [r4, #200]
.L108:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L121:
	lsls	r5, r5, #1
	b	.L120
.L118:
	mul	r0, r7, r3
	add	r7, r7, r7, lsl #1
	adds	r7, r7, #96
	ldr	r5, .L163+16
	movw	r1, #8191
	add	r9, r1, r9, lsl #6
	muls	r7, r3, r7
	adds	r2, r0, r3, lsl #5
	it	mi
	addmi	r2, r2, #63
	add	r0, r0, r0, lsl #1
	add	r3, sp, #16
	add	r2, r1, r2, asr #6
	mov	r1, r10
	ands	r2, r2, r5
	and	r5, r9, r5
	add	r7, r2, r7, asr #1
	add	r0, r5, r0, asr #1
	movs	r2, #4
	cmp	r0, r7
	ite	ge
	strge	r0, [sp, #28]
	strlt	r7, [sp, #28]
	ldr	r0, [r4, #204]
	bl	hal_bufs_setup
	b	.L127
.L129:
	mov	r1, r5
	ldr	r0, [r4, #204]
	bl	hal_bufs_get_buf
	cbz	r0, .L124
	adds	r5, r5, #1
	b	.L125
.L131:
	cmp	r5, #3072
	bls	.L132
	ldr	r0, [r4, #212]
	cbz	r0, .L133
	ldr	r1, .L163+12
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #212]
.L133:
	adds	r5, r5, #63
	ldr	r3, .L163+12
	bics	r1, r5, #63
	it	mi
	addmi	r1, r1, #31
	asrs	r5, r5, #6
	str	r3, [sp]
	movs	r3, #0
	asrs	r2, r1, #5
	mov	r1, #416
	mov	r0, r3
	muls	r1, r2, r1
	mov	r2, #896
	muls	r5, r2, r5
	sub	r1, r1, #37632
	subs	r1, r1, #224
	sub	r2, r5, #32256
	cmp	r2, r1
	it	lt
	movlt	r2, r1
	add	r1, r4, #212
	bl	mpp_buffer_get_with_tag
	cmp	r0, #0
	beq	.L132
.L124:
	mov	r0, r4
	bl	mpp_chan_clear_buf_resource
	mov	r0, #-1
	b	.L108
.L137:
	movs	r0, #0
	b	.L108
.L164:
	.align	2
.L163:
	.word	.LC5
	.word	-4096
	.word	.LANCHOR1+28
	.word	.LANCHOR1+41
	.word	-8192
	.fnend
	.size	mpp_vcodec_chan_setup_hal_bufs, .-mpp_vcodec_chan_setup_hal_bufs
	.align	1
	.global	mpp_vcodec_chan_entry_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_entry_init, %function
mpp_vcodec_chan_entry_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	mov	r7, r1
	mov	r8, r2
	mov	r9, r3
	bl	get_mpibuf_ops
	mov	r5, r0
	cbnz	r0, .L166
	movw	r2, #483
	ldr	r1, .L178
	ldr	r0, .L178+4
	bl	printk
	mov	r0, #-1
.L165:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L166:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, #-1
	ldr	r2, .L178+8
	strd	r3, r3, [r4, #4]
	add	r0, r4, #68
	movs	r3, #0
	ldr	r1, .L178+12
	str	r3, [r4, #100]
	str	r9, [r4, #56]
	str	r3, [r4, #104]
	strd	r8, r7, [r4, #12]
	str	r3, [r4, #108]
	str	r3, [r4, #112]
	str	r3, [r4, #116]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	add	r3, r4, #84
	str	r3, [r4, #84]
	str	r3, [r4, #88]
	add	r3, r4, #92
	str	r3, [r4, #92]
	str	r3, [r4, #96]
	bl	__init_waitqueue_head
	ldr	r2, .L178+8
	ldr	r1, .L178+16
	add	r0, r4, #76
	bl	__init_waitqueue_head
	ldr	r3, [r5, #28]
	cbz	r3, .L168
	ldr	r3, [r4, #60]
	cbnz	r3, .L168
	ldr	r3, [r5, #44]
	cbnz	r3, .L169
.L171:
	movs	r0, #1
.L170:
	str	r0, [r4, #64]
	ldr	r3, [r5, #28]
	blx	r3
	str	r0, [r4, #60]
.L168:
	movs	r3, #1
	str	r3, [r4, #28]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L165
.L169:
	ldr	r0, [r4]
	blx	r3
	cmp	r0, #0
	beq	.L171
	b	.L170
.L179:
	.align	2
.L178:
	.word	.LANCHOR1+72
	.word	.LC6
	.word	.LANCHOR0+3880
	.word	.LC7
	.word	.LC8
	.fnend
	.size	mpp_vcodec_chan_entry_init, .-mpp_vcodec_chan_entry_init
	.align	1
	.global	mpp_vcodec_chan_entry_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_chan_entry_deinit, %function
mpp_vcodec_chan_entry_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	mov	r5, r0
	cbnz	r0, .L181
	movw	r2, #531
	ldr	r1, .L190
	ldr	r0, .L190+4
	bl	printk
	mov	r0, #-1
.L180:
	pop	{r3, r4, r5, pc}
.L181:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #0
	str	r3, [r4, #56]
	str	r3, [r4, #28]
	str	r3, [r4, #40]
	mov	r3, #-1
	strd	r3, r3, [r4, #4]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r4, #60]
	add	r0, r4, #60
	bl	__cmpxchg.constprop.10
	cbz	r0, .L183
	ldr	r3, [r5, #32]
	cbz	r3, .L183
	blx	r3
.L183:
	movs	r5, #0
	mov	r0, r4
	str	r5, [r4, #36]
	bl	mpp_chan_clear_buf_resource
	mov	r0, r5
	b	.L180
.L191:
	.align	2
.L190:
	.word	.LANCHOR1+99
	.word	.LC6
	.fnend
	.size	mpp_vcodec_chan_entry_deinit, .-mpp_vcodec_chan_entry_deinit
	.align	1
	.global	stream_packet_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	stream_packet_free, %function
stream_packet_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	subs	r0, r0, #20
	str	r0, [sp, #4]
	cbnz	r0, .L193
	mov	r2, #560
	ldr	r1, .L195
	ldr	r0, .L195+4
	bl	printk
.L192:
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L193:
	add	r0, sp, #4
	bl	mpp_packet_deinit
	b	.L192
.L196:
	.align	2
.L195:
	.word	.LANCHOR1+128
	.word	.LC9
	.fnend
	.size	stream_packet_free, .-stream_packet_free
	.align	1
	.global	mpp_vcodec_stream_clear
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_stream_clear, %function
mpp_vcodec_stream_clear:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r8, r0
	ldr	r4, [r8, #84]!
	ldr	r6, [r4], #-12
	subs	r6, r6, #12
.L198:
	add	r3, r4, #12
	cmp	r3, r8
	bne	.L200
	mov	r8, r5
	ldr	r4, [r8, #92]!
	ldr	r6, [r4], #-12
	subs	r6, r6, #12
.L201:
	add	r3, r4, #12
	cmp	r3, r8
	bne	.L203
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, r8, pc}
.L200:
	ldrd	r1, r2, [r4, #12]
	adds	r4, r4, #20
	movs	r0, #1
	str	r2, [r1, #4]
	str	r1, [r2]
	movs	r2, #0
	str	r3, [r4, #-8]
	str	r3, [r4, #-4]
	mov	r1, r4
	bl	__refcount_sub_and_test.constprop.7
	cbz	r0, .L199
	mov	r0, r4
	bl	stream_packet_free
.L199:
	add	r3, r5, #100
	pld	[r3]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r6, #12]
	mov	r4, r6
	sub	r6, r3, #12
	b	.L198
.L203:
	ldrd	r1, r2, [r4, #12]
	adds	r4, r4, #20
	movs	r0, #1
	str	r2, [r1, #4]
	str	r1, [r2]
	movs	r2, #0
	str	r3, [r4, #-8]
	str	r3, [r4, #-4]
	mov	r1, r4
	bl	__refcount_sub_and_test.constprop.7
	cbz	r0, .L202
	mov	r0, r4
	bl	stream_packet_free
.L202:
	add	r3, r5, #104
	pld	[r3]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r6, #12]
	mov	r4, r6
	sub	r6, r3, #12
	b	.L201
	.fnend
	.size	mpp_vcodec_stream_clear, .-mpp_vcodec_stream_clear
	.align	1
	.global	mpp_vcodec_get_enc_module_entry
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_get_enc_module_entry, %function
mpp_vcodec_get_enc_module_entry:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L211
	bx	lr
.L212:
	.align	2
.L211:
	.word	.LANCHOR0
	.fnend
	.size	mpp_vcodec_get_enc_module_entry, .-mpp_vcodec_get_enc_module_entry
	.align	1
	.global	enc_chan_update_chan_prior_tab
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_update_chan_prior_tab, %function
enc_chan_update_chan_prior_tab:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L232
	movs	r1, #0
	mov	r0, r1
	mov	r4, r1
	mov	r5, r3
	mov	r2, r3
	str	r1, [r3, #3736]
	str	r1, [r3, #3732]
.L215:
	ldr	r7, [r5, #44]
	cmp	r7, #3
	bne	.L214
	ldrb	r1, [r5, #36]	@ zero_extendqisi2
	add	r7, r2, r0, lsl #3
	adds	r1, r1, #1
	str	r1, [r7, #3748]
	add	r1, r0, #468
	adds	r0, r0, #1
	str	r4, [r2, r1, lsl #3]
	movs	r1, #1
.L214:
	adds	r4, r4, #1
	adds	r5, r5, #232
	cmp	r4, #16
	bne	.L215
	cbz	r1, .L216
	str	r0, [r2, #3732]
.L216:
	ldr	r1, [r2, #3732]
	movs	r0, #0
	add	r2, r2, r1, lsl #3
.L217:
	cmp	r1, #15
	add	r2, r2, #8
	ble	.L218
	movs	r1, #0
.L222:
	adds	r1, r1, #1
	mov	r2, r3
	movs	r4, #0
	mov	r0, r1
.L220:
	ldr	r5, [r3, #3748]
	ldr	r7, [r2, #3756]
	cmp	r5, r7
	bge	.L219
	ldr	r7, [r2, #3752]
	ldr	r4, [r3, #3744]
	str	r7, [r3, #3744]
	ldr	r7, [r2, #3756]
	str	r7, [r3, #3748]
	str	r4, [r2, #3752]
	mov	r4, #-1
	str	r5, [r2, #3756]
.L219:
	adds	r0, r0, #1
	adds	r2, r2, #8
	cmp	r0, #16
	bne	.L220
	cbz	r4, .L221
	cmp	r1, #15
	add	r3, r3, #8
	bne	.L222
.L221:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7, pc}
.L218:
	str	r0, [r2, #3740]
	adds	r1, r1, #1
	str	r0, [r2, #3736]
	b	.L217
.L233:
	.align	2
.L232:
	.word	.LANCHOR0
	.fnend
	.size	enc_chan_update_chan_prior_tab, .-enc_chan_update_chan_prior_tab
	.align	1
	.global	enc_chan_update_tab_after_enc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_update_tab_after_enc, %function
enc_chan_update_tab_after_enc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L243
	movs	r3, #0
	ldr	r1, [r2, #3732]
	str	r3, [r2, #3736]
.L235:
	cmp	r1, r3
	bne	.L238
	cbz	r1, .L240
	movs	r3, #0
	b	.L239
.L238:
	add	r4, r2, r3, lsl #3
	ldr	r4, [r4, #3744]
	cmp	r4, r0
	bne	.L236
.L239:
	add	r4, r2, r3, lsl #3
	subs	r6, r1, #1
.L237:
	cmp	r6, r3
	add	r4, r4, #8
	bhi	.L241
	addw	r1, r1, #467
	str	r0, [r2, r1, lsl #3]
.L240:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, r7, pc}
.L236:
	adds	r3, r3, #1
	b	.L235
.L241:
	ldr	r7, [r4, #3744]
	adds	r3, r3, #1
	str	r7, [r4, #3736]
	b	.L237
.L244:
	.align	2
.L243:
	.word	.LANCHOR0
	.fnend
	.size	enc_chan_update_tab_after_enc, .-enc_chan_update_tab_after_enc
	.align	1
	.global	enc_chan_get_high_prior_chan
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_get_high_prior_chan, %function
enc_chan_get_high_prior_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L246
	ldr	r2, [r3, #3736]
	add	r0, r2, #468
	adds	r2, r2, #1
	str	r2, [r3, #3736]
	ldr	r0, [r3, r0, lsl #3]
	str	r0, [r3, #3740]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L247:
	.align	2
.L246:
	.word	.LANCHOR0
	.fnend
	.size	enc_chan_get_high_prior_chan, .-enc_chan_get_high_prior_chan
	.align	1
	.global	mpp_vcodec_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_init, %function
mpp_vcodec_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	movw	r2, #3880
	ldr	r4, .L251
	movs	r1, #0
	ldr	r7, .L251+4
	movs	r5, #0
	addw	r8, r4, #3880
	mov	r9, #232
	mov	r0, r4
	str	r4, [sp, #4]
	bl	memset
	mov	r1, #3264
	ldr	r0, .L251+8
	bl	kstrdup
	str	r0, [r4, #4]
.L249:
	mul	r3, r9, r5
	ldr	r0, [sp, #4]
	mov	r1, #-1
	movs	r6, #0
	adds	r2, r0, r3
	adds	r3, r3, #60
	add	r0, r0, r3
	str	r5, [r2, #16]
	adds	r5, r5, #1
	str	r1, [r2, #28]
	mov	r1, r7
	str	r6, [r2, #72]
	mov	r2, r8
	bl	__mutex_init
	cmp	r5, #16
	bne	.L249
	ldr	r0, [sp, #4]
	str	r6, [r0, #3728]
	bl	vcodec_thread_create
	movs	r1, #1
	mov	r5, r0
	bl	vcodec_thread_set_count
	ldr	r1, .L251+12
	mov	r0, r5
	ldr	r2, [sp, #4]
	bl	vcodec_thread_set_callback
	ldr	r0, [r4, #3880]
	bl	mpp_packet_pool_init
	ldr	r0, [r4, #3880]
	bl	mpp_frame_pool_init
	ldr	r0, [r4, #3880]
	bl	mpp_buffer_pool_init
	mov	r0, r5
	bl	vcodec_thread_start
	mov	r0, r6
	ldr	r3, [sp, #4]
	add	r2, sp, #4
	str	r2, [r3]
	ldr	r3, [sp, #4]
	str	r5, [r3, #3872]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L252:
	.align	2
.L251:
	.word	.LANCHOR0
	.word	.LC11
	.word	.LC10
	.word	mpp_vcodec_enc_routine
	.fnend
	.size	mpp_vcodec_init, .-mpp_vcodec_init
	.align	1
	.global	mpp_vcodec_unregister_mpidev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_unregister_mpidev, %function
mpp_vcodec_unregister_mpidev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	bl	get_mpidev_ops
	cbz	r0, .L255
	ldr	r3, [r0, #4]
	cbz	r3, .L256
	ldr	r5, .L258
	movs	r4, #0
	ldr	r0, [r5, #8]
	cbz	r0, .L253
	blx	r3
	mov	r0, r4
	str	r4, [r5, #8]
.L253:
	pop	{r3, r4, r5, pc}
.L255:
	mov	r0, #-1
	b	.L253
.L256:
	mov	r0, r3
	b	.L253
.L259:
	.align	2
.L258:
	.word	.LANCHOR0
	.fnend
	.size	mpp_vcodec_unregister_mpidev, .-mpp_vcodec_unregister_mpidev
	.align	1
	.global	mpp_vcodec_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_deinit, %function
mpp_vcodec_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r5, #0
	ldr	r4, .L267
	add	r6, r4, #16
.L261:
	adds	r0, r6, r5
	adds	r5, r5, #232
	bl	mpp_chan_clear_buf_resource
	cmp	r5, #3712
	bne	.L261
	ldr	r0, [r4, #3872]
	cbz	r0, .L262
	bl	vcodec_thread_stop
	ldr	r0, [r4, #3872]
	bl	vcodec_thread_destroy
	movs	r3, #0
	str	r3, [r4, #3872]
.L262:
	bl	mpp_packet_pool_deinit
	bl	mpp_frame_pool_deinit
	bl	mpp_buffer_pool_deinit
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L268:
	.align	2
.L267:
	.word	.LANCHOR0
	.fnend
	.size	mpp_vcodec_deinit, .-mpp_vcodec_deinit
	.global	gdev_fn
	.global	max_stream_cnt
	.global	mpp_vcodec_debug
	.section	.rodata
	.set	.LANCHOR1,. + 0
	.type	__FUNCTION__.25470, %object
	.size	__FUNCTION__.25470, 28
__FUNCTION__.25470:
	.ascii	"mpp_chan_clear_buf_resource\000"
	.type	__FUNCTION__.25460, %object
	.size	__FUNCTION__.25460, 13
__FUNCTION__.25460:
	.ascii	"get_wrap_buf\000"
	.type	__FUNCTION__.25508, %object
	.size	__FUNCTION__.25508, 31
__FUNCTION__.25508:
	.ascii	"mpp_vcodec_chan_setup_hal_bufs\000"
	.type	__func__.25519, %object
	.size	__func__.25519, 27
__func__.25519:
	.ascii	"mpp_vcodec_chan_entry_init\000"
	.type	__func__.25557, %object
	.size	__func__.25557, 29
__func__.25557:
	.ascii	"mpp_vcodec_chan_entry_deinit\000"
	.type	__func__.25578, %object
	.size	__func__.25578, 19
__func__.25578:
	.ascii	"stream_packet_free\000"
	.type	__param_str_max_stream_cnt, %object
	.size	__param_str_max_stream_cnt, 26
__param_str_max_stream_cnt:
	.ascii	"mpp_vcodec.max_stream_cnt\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	gdev_fn, %object
	.size	gdev_fn, 12
gdev_fn:
	.word	mpp_vcodec_bind
	.word	mpp_vcodec_unbind
	.word	mpp_vcodec_msg_handle
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	g_vcodec_entry, %object
	.size	g_vcodec_entry, 3880
g_vcodec_entry:
	.space	3880
	.type	__key.25548, %object
	.size	__key.25548, 0
__key.25548:
	.type	__key.25549, %object
	.size	__key.25549, 0
__key.25549:
	.type	__key.25372, %object
	.size	__key.25372, 0
__key.25372:
	.type	max_stream_cnt, %object
	.size	max_stream_cnt, 4
max_stream_cnt:
	.space	4
	.type	mpp_vcodec_debug, %object
	.size	mpp_vcodec_debug, 4
mpp_vcodec_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_max_stream_cnttype162, %object
	.size	__UNIQUE_ID_max_stream_cnttype162, 39
__UNIQUE_ID_max_stream_cnttype162:
	.ascii	"mpp_vcodec.parmtype=max_stream_cnt:int\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013mpp_vcodec: %d: get_mpidev_ops fail\000"
.LC1:
	.ascii	"\0013mpp_vcodec: %d: MppCtxType error %d\000"
.LC2:
	.ascii	"\0013mpp_vcodec: %d: creat mpi dev & register fail "
	.ascii	"\012\000"
.LC3:
	.ascii	"\0013mpp_vcodec: %d: chan id %d is over, full max i"
	.ascii	"s %d \012\000"
.LC4:
	.ascii	"\0013mpp_vcodec: %d: type %d chnl %d is no create\000"
.LC5:
	.ascii	"\0016mpp_vcodec: %d: attr->max_width = %d, attr->ma"
	.ascii	"x_height = %d\000"
.LC6:
	.ascii	"\0013mpp_vcodec: %s:%d: mpibuf_ops get fail\000"
.LC7:
	.ascii	"&entry->wait\000"
.LC8:
	.ascii	"&entry->stop_wait\000"
.LC9:
	.ascii	"\0016mpp_vcodec: %s:%d: packet is null\012\000"
.LC10:
	.ascii	"rkv_enc\000"
.LC11:
	.ascii	"&curr_entry->chan_debug_lock\000"
	.section	___ksymtab+mpp_vcodec_clear_buf_resource,"a"
	.align	2
	.type	__ksymtab_mpp_vcodec_clear_buf_resource, %object
	.size	__ksymtab_mpp_vcodec_clear_buf_resource, 12
__ksymtab_mpp_vcodec_clear_buf_resource:
	.word	mpp_vcodec_clear_buf_resource
	.word	__kstrtab_mpp_vcodec_clear_buf_resource
	.word	__kstrtabns_mpp_vcodec_clear_buf_resource
	.section	___ksymtab+mpp_vcodec_run_task,"a"
	.align	2
	.type	__ksymtab_mpp_vcodec_run_task, %object
	.size	__ksymtab_mpp_vcodec_run_task, 12
__ksymtab_mpp_vcodec_run_task:
	.word	mpp_vcodec_run_task
	.word	__kstrtab_mpp_vcodec_run_task
	.word	__kstrtabns_mpp_vcodec_run_task
	.section	___ksymtab+mpp_vcodec_set_online_mode,"a"
	.align	2
	.type	__ksymtab_mpp_vcodec_set_online_mode, %object
	.size	__ksymtab_mpp_vcodec_set_online_mode, 12
__ksymtab_mpp_vcodec_set_online_mode:
	.word	mpp_vcodec_set_online_mode
	.word	__kstrtab_mpp_vcodec_set_online_mode
	.word	__kstrtabns_mpp_vcodec_set_online_mode
	.section	__param,"a"
	.align	2
	.type	__param_max_stream_cnt, %object
	.size	__param_max_stream_cnt, 20
__param_max_stream_cnt:
	.word	__param_str_max_stream_cnt
	.word	0
	.word	param_ops_int
	.short	420
	.byte	-1
	.byte	0
	.word	max_stream_cnt
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
