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
	.file	"mpi_job.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_job_set_ready:					
	.asciz 	"mpi_job_set_ready"					
__kstrtabns_mpi_job_set_ready:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_job_cancel:					
	.asciz 	"mpi_job_cancel"					
__kstrtabns_mpi_job_cancel:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_job_done:					
	.asciz 	"mpi_job_done"					
__kstrtabns_mpi_job_done:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_job_wait:					
	.asciz 	"mpi_job_wait"					
__kstrtabns_mpi_job_wait:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_job_pool_flush:					
	.asciz 	"mpi_job_pool_flush"					
__kstrtabns_mpi_job_pool_flush:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_set_if, %function
atomic_set_if:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	pld	[r0]
.L2:
	.syntax unified
@ 114 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_cmpxchg
ldrex	r3, [r0]
mov	r4, #0
teq	r3, r2
strexeq r4, r1, [r0]

@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r4, #0
	bne	.L2
	subs	r3, r2, r3
	rsbs	r0, r3, #0
	adcs	r0, r0, r3
	pop	{r4, pc}
	.fnend
	.size	atomic_set_if, .-atomic_set_if
	.align	1
	.global	mpi_job_set_ready
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_set_ready, %function
mpi_job_set_ready:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r4, r0
	movs	r2, #1
	movs	r1, #2
	adds	r0, r0, #104
	bl	atomic_set_if
	cbz	r0, .L4
	ldr	r3, [r4, #80]
	movs	r1, #5
	ldr	r2, .L9
	movs	r0, #0
	ldr	r3, [r3, #80]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movs	r3, #35
	str	r3, [sp]
	ldr	r3, .L9+4
	bl	vlog
.L4:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L10:
	.align	2
.L9:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	mpi_job_set_ready, .-mpi_job_set_ready
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_release, %function
mpi_job_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r0, #104]
	movs	r5, #0
	ldr	r0, [r0, #80]
	bl	mpi_obj_unref
	ldr	r0, [r4, #84]
	str	r5, [r4, #80]
	bl	mpi_obj_unref
	ldr	r0, [r4, #96]
	str	r5, [r4, #84]
	bl	mpi_obj_unref
	ldr	r0, [r4, #100]
	str	r5, [r4, #96]
	bl	mpi_obj_unref
	ldr	r3, [r4, #40]
	str	r5, [r4, #100]
	movs	r1, #5
	bic	r3, r3, #1024
	str	r3, [r4, #40]
	ldr	r3, [r4]
	mov	r0, r5
	str	r5, [r4, #104]
	ldr	r2, .L12
	str	r3, [sp, #4]
	movs	r3, #183
	str	r3, [sp]
	ldr	r3, .L12+4
	bl	vlog
	ldr	r0, [r4, #88]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	mpi_obj_unref
.L13:
	.align	2
.L12:
	.word	.LC1
	.word	.LANCHOR0+18
	.fnend
	.size	mpi_job_release, .-mpi_job_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_try_complete, %function
mpi_job_try_complete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #40]
	ldr	r3, [r0, #104]
	lsls	r2, r2, #21
	bpl	.L14
	subs	r3, r3, #4
	cmp	r3, #2
	bhi	.L14
	adds	r0, r0, #108
	b	complete_all
.L14:
	bx	lr
	.fnend
	.size	mpi_job_try_complete, .-mpi_job_try_complete
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_do_cancel, %function
mpi_job_do_cancel:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	movs	r2, #2
	mov	r4, r0
	movs	r1, #4
	adds	r0, r0, #104
	bl	atomic_set_if
	cbz	r0, .L21
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L22
	movs	r0, #0
	str	r3, [sp, #4]
	movs	r3, #69
	str	r3, [sp]
	ldr	r3, .L22+4
	bl	vlog
	mov	r0, r4
	bl	mpi_job_try_complete
	mov	r0, r4
	bl	mpi_obj_unref
	movs	r0, #0
.L19:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L21:
	mov	r0, #-1
	b	.L19
.L23:
	.align	2
.L22:
	.word	.LC2
	.word	.LANCHOR0+34
	.fnend
	.size	mpi_job_do_cancel, .-mpi_job_do_cancel
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_cancel_rcu, %function
mpi_job_cancel_rcu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r0, r0, #64
	b	mpi_job_do_cancel
	.fnend
	.size	mpi_job_cancel_rcu, .-mpi_job_cancel_rcu
	.align	1
	.global	mpi_job_done
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_done, %function
mpi_job_done:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	subs	r6, r1, #0
	mov	r4, r0
	mov	r2, #3
	ite	eq
	moveq	r5, #6
	movne	r5, #5
	mov	r1, r5
	adds	r0, r0, #104
	bl	atomic_set_if
	cmp	r0, #0
	beq	.L36
	cmp	r5, #5
	mov	r5, #0
	bne	.L28
	ldr	r0, [r4, #100]
	bl	mpi_obj_unref
	str	r5, [r4, #100]
	ldr	r0, [r4, #96]
	bl	mpi_obj_unref
	str	r5, [r4, #96]
.L29:
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L45
	movs	r0, #0
	str	r6, [sp, #8]
	str	r3, [sp, #4]
	movs	r3, #151
	str	r3, [sp]
	ldr	r3, .L45+4
	bl	vlog
	mov	r0, r4
	bl	mpi_job_try_complete
	mov	r0, r4
	bl	mpi_obj_unref
	movs	r0, #0
.L25:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L28:
	ldr	r0, [r4, #96]
	bl	mpi_obj_unref
	str	r5, [r4, #96]
	cbz	r4, .L44
	ldr	r3, [r4, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L31
.L44:
	b	.L29
.L31:
	ldr	r0, [r4, #84]
	cbz	r0, .L43
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L33
.L43:
	b	.L44
.L33:
	mov	r2, r5
	ldr	r1, [r4, #100]
	bl	mpi_node_buffer_out
	b	.L43
.L36:
	mov	r0, #-1
	b	.L25
.L46:
	.align	2
.L45:
	.word	.LC3
	.word	.LANCHOR0+52
	.fnend
	.size	mpi_job_done, .-mpi_job_done
	.align	1
	.global	mpi_job_wait
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_wait, %function
mpi_job_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #44]
	cbz	r0, .L48
	bl	mpi_obj_ref
.L48:
	ldr	r3, [r4, #40]
	mov	r0, r4
	orr	r3, r3, #1024
	str	r3, [r4, #40]
	bl	mpi_job_try_complete
	add	r0, r4, #108
	bl	wait_for_completion
	mov	r0, r4
	bl	mpi_obj_unref
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpi_job_wait, .-mpi_job_wait
	.align	1
	.global	mpi_job_cancel
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_cancel, %function
mpi_job_cancel:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, [r0, #40]
	mov	r6, r1
	lsls	r2, r3, #30
	bpl	.L55
	bic	r3, r3, #2
	str	r3, [r0, #40]
	ldr	r0, [r0, #96]
	movs	r5, #0
	bl	mpi_obj_unref
	str	r5, [r4, #96]
	ldr	r0, [r4, #100]
	bl	mpi_obj_unref
	str	r5, [r4, #100]
	cbz	r6, .L54
	add	r0, r4, #64
	ldr	r1, .L56
	bl	call_rcu
	mov	r0, r5
.L52:
	pop	{r4, r5, r6, pc}
.L54:
	bl	synchronize_rcu
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	b	mpi_job_do_cancel
.L55:
	mov	r0, #-1
	b	.L52
.L57:
	.align	2
.L56:
	.word	mpi_job_cancel_rcu
	.fnend
	.size	mpi_job_cancel, .-mpi_job_cancel
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_release, %function
mpi_job_pool_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r2, .L62
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #301
	str	r3, [sp]
	ldr	r3, .L62+4
	bl	vlog
	ldr	r3, [r4, #40]
	bic	r2, r3, #2048
	lsls	r3, r3, #29
	str	r2, [r4, #40]
	bpl	.L58
	mov	r6, r4
	ldr	r0, [r6, #76]!
	ldr	r5, [r0], #-72
	subs	r5, r5, #72
.L60:
	add	r3, r0, #72
	cmp	r3, r6
	bne	.L61
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unregister
.L61:
	ldr	r3, [r0, #104]
	bl	mpi_obj_unregister
	ldr	r3, [r5, #72]
	mov	r0, r5
	sub	r5, r3, #72
	b	.L60
.L58:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L63:
	.align	2
.L62:
	.word	.LC4
	.word	.LANCHOR0+65
	.fnend
	.size	mpi_job_pool_release, .-mpi_job_pool_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_alloc, %function
mpi_job_pool_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L68
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	.pad #20
	sub	sp, sp, #20
	mov	r7, r1
	ldr	r0, [r3, #8]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L65
	ldr	r3, [r5]
	movs	r1, #5
	ldr	r2, .L68+4
	str	r3, [sp, #4]
	movs	r3, #215
	str	r3, [sp]
	ldr	r3, .L68+8
	bl	vlog
.L64:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L65:
	ldr	r3, .L68+12
	movs	r2, #0
	movs	r1, #2
	movs	r6, #0
	bl	mpi_obj_register
	cmp	r0, #0
	bge	.L67
	mov	r0, r4
	mov	r4, r6
	bl	kfree
	b	.L64
.L67:
	str	r6, [r4, #108]
	add	r0, r4, #112
	ldr	r2, .L68+16
	ldr	r1, .L68+20
	bl	__init_swait_queue_head
	str	r7, [r4, #104]
	str	r5, [r4, #88]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r5, #80]
	add	r0, r5, #76
	add	r3, r4, #72
	strd	r0, r2, [r4, #72]
	str	r3, [r2]
	str	r3, [r5, #80]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L68+24
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	movs	r3, #232
	str	r3, [sp]
	ldr	r3, .L68+8
	bl	vlog
	b	.L64
.L69:
	.align	2
.L68:
	.word	kmalloc_caches
	.word	.LC5
	.word	.LANCHOR0+86
	.word	mpi_job_release
	.word	.LANCHOR1
	.word	.LC6
	.word	.LC7
	.fnend
	.size	mpi_job_pool_alloc, .-mpi_job_pool_alloc
	.align	1
	.global	mpi_job_pool_flush
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_flush, %function
mpi_job_pool_flush:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r5, r0
	ldr	r3, [r0]
	mov	r7, r1
	mov	r4, r2
	movs	r1, #5
	ldr	r2, .L97
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #351
	str	r3, [sp]
	ldr	r3, .L97+4
	bl	vlog
	cbz	r5, .L71
	mov	r0, r5
	bl	mpi_obj_ref
.L71:
	ldr	r3, [r5, #40]
	orr	r3, r3, #2048
	str	r3, [r5, #40]
	bl	synchronize_rcu
	cbz	r4, .L72
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r6, r5
	ldr	r4, [r6, #76]!
.L96:
	subs	r4, r4, #72
	add	r3, r4, #72
	cmp	r3, r6
	bne	.L77
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L72:
	ldr	r3, [r5, #40]
	ldr	r4, [r5, #60]
	lsls	r2, r3, #21
	itt	mi
	orrmi	r3, r3, #4
	strmi	r3, [r5, #40]
	pld	[r4]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r4]
	add	r3, r3, #1
	strex	r2, r3, [r4]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r6, r4, #4
	pld	[r6]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r6]
	add	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #44]
	add	r7, r4, #8
	cbnz	r3, .L79
	mov	r0, r7
	bl	complete_all
.L79:
	mov	r0, r5
	pld	[r6]
	bl	mpi_obj_unref
	mov	r0, r7
	bl	wait_for_completion
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r6]
	sub	r3, r3, #1
	strex	r2, r3, [r6]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	pld	[r4]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r3, [r4]
	sub	r3, r3, #1
	strex	r2, r3, [r4]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L80
	mov	r0, r4
	bl	kfree
.L80:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L77:
	mov	r0, r4
	bl	mpi_obj_ref_if_used
	cbz	r0, .L74
	cbz	r7, .L75
	ldr	r3, [r4, #84]
	cmp	r7, r3
	bne	.L76
.L75:
	movs	r1, #0
	mov	r0, r4
	bl	mpi_job_cancel
.L76:
	mov	r0, r4
	bl	mpi_obj_unref
.L74:
	ldr	r4, [r4, #72]
	b	.L96
.L98:
	.align	2
.L97:
	.word	.LC8
	.word	.LANCHOR0+105
	.fnend
	.size	mpi_job_pool_flush, .-mpi_job_pool_flush
	.align	1
	.global	mpi_job_set_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_set_running, %function
mpi_job_set_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r4, r0
	movs	r2, #2
	ldr	r3, [r0, #104]!
	movs	r1, #3
	bl	atomic_set_if
	cbz	r0, .L101
	ldr	r3, [r4, #80]
	movs	r1, #5
	ldr	r2, .L102
	movs	r0, #0
	ldr	r3, [r3, #80]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movs	r3, #48
	str	r3, [sp]
	ldr	r3, .L102+4
	bl	vlog
	movs	r0, #0
.L99:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L101:
	mov	r0, #-1
	b	.L99
.L103:
	.align	2
.L102:
	.word	.LC9
	.word	.LANCHOR0+124
	.fnend
	.size	mpi_job_set_running, .-mpi_job_set_running
	.align	1
	.global	mpi_job_pool_request_job
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_request_job, %function
mpi_job_pool_request_job:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	cbz	r0, .L105
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L106
.L105:
	movs	r4, #0
.L104:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L106:
	ldr	r3, [r0, #44]
	movs	r1, #5
	ldr	r2, .L125
	str	r3, [sp, #8]
	ldr	r3, [r0]
	movs	r0, #0
	str	r3, [sp, #4]
	movs	r3, #244
	str	r3, [sp]
	ldr	r3, .L125+4
	bl	vlog
	ldr	r3, [r5, #40]
	lsls	r3, r3, #20
	bpl	.L108
.L113:
	movs	r4, #0
.L109:
	b	.L104
.L108:
	mov	r6, r5
	ldr	r4, [r6, #76]!
.L124:
	subs	r4, r4, #72
	add	r3, r4, #72
	cmp	r3, r6
	bne	.L112
	movs	r1, #1
	mov	r0, r5
	bl	mpi_job_pool_alloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L113
.L111:
	mov	r0, r5
	bl	mpi_obj_ref
	movs	r3, #0
	str	r3, [r4, #108]
	ldr	r3, [r4, #40]
	orr	r3, r3, #2
	str	r3, [r4, #40]
	cbz	r4, .L114
	mov	r0, r4
	bl	mpi_obj_ref
.L114:
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L125+8
	movs	r0, #0
	str	r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	movw	r3, #265
	str	r3, [sp]
	ldr	r3, .L125+4
	bl	vlog
	b	.L109
.L112:
	movs	r2, #0
	movs	r1, #1
	add	r0, r4, #104
	bl	atomic_set_if
	cmp	r0, #0
	bne	.L111
	ldr	r4, [r4, #72]
	b	.L124
.L126:
	.align	2
.L125:
	.word	.LC10
	.word	.LANCHOR0+144
	.word	.LC11
	.fnend
	.size	mpi_job_pool_request_job, .-mpi_job_pool_request_job
	.align	1
	.global	mpi_job_pool_choose_job
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_choose_job, %function
mpi_job_pool_choose_job:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r1
	mov	r8, r2
	cbz	r0, .L128
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L129
.L128:
	movs	r5, #0
.L127:
	mov	r0, r5
	pop	{r4, r5, r6, r7, r8, pc}
.L129:
	mov	r6, r0
	movs	r5, #0
	ldr	r4, [r6, #76]!
	subs	r4, r4, #72
.L131:
	add	r3, r4, #72
	cmp	r3, r6
	bne	.L133
	b	.L127
.L133:
	ldr	r3, [r4, #40]
	lsls	r3, r3, #30
	bpl	.L132
	ldr	r3, [r4, #84]
	cmp	r3, r7
	bne	.L132
	ldr	r3, [r4, #104]
	cmp	r3, #2
	bne	.L132
	cbz	r5, .L134
	cmp	r8, #0
	beq	.L132
	mov	r0, r5
	mov	r1, r4
	blx	r8
	bics	r5, r5, r0, asr #32
	it	cs
	movcs	r5, r4
.L132:
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L131
.L134:
	mov	r5, r4
	b	.L132
	.fnend
	.size	mpi_job_pool_choose_job, .-mpi_job_pool_choose_job
	.align	1
	.global	mpi_job_pool_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_destroy, %function
mpi_job_pool_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r2, .L145
	movs	r0, #0
	str	r3, [sp, #4]
	mov	r3, #374
	str	r3, [sp]
	ldr	r3, .L145+4
	bl	vlog
	ldr	r3, [r4, #40]
	movs	r2, #1
	movs	r1, #0
	orr	r3, r3, #1024
	mov	r0, r4
	str	r3, [r4, #40]
	bl	mpi_job_pool_flush
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L146:
	.align	2
.L145:
	.word	.LC12
	.word	.LANCHOR0+169
	.fnend
	.size	mpi_job_pool_destroy, .-mpi_job_pool_destroy
	.align	1
	.global	mpi_job_pool_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_job_pool_create, %function
mpi_job_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L155
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r6, r0
	mov	r5, r1
	ldr	r0, [r3, #4]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L147
	ldr	r3, .L155+4
	movs	r2, #64
	movs	r1, #3
	bl	mpi_obj_register
	cmp	r0, #0
	bge	.L149
	mov	r0, r4
	movs	r4, #0
	bl	kfree
.L147:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L149:
	add	r3, r4, #76
	str	r6, [r4, #72]
	str	r3, [r4, #76]
	str	r3, [r4, #80]
.L150:
	adds	r5, r5, #-1
	bcs	.L151
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L155+8
	movs	r0, #0
	str	r3, [sp, #4]
	mov	r3, #402
	str	r3, [sp]
	ldr	r3, .L155+12
	bl	vlog
	b	.L147
.L151:
	movs	r1, #0
	mov	r0, r4
	bl	mpi_job_pool_alloc
	b	.L150
.L156:
	.align	2
.L155:
	.word	kmalloc_caches
	.word	mpi_job_pool_release
	.word	.LC13
	.word	.LANCHOR0+190
	.fnend
	.size	mpi_job_pool_create, .-mpi_job_pool_create
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.36038, %object
	.size	__func__.36038, 18
__func__.36038:
	.ascii	"mpi_job_set_ready\000"
	.type	__func__.36139, %object
	.size	__func__.36139, 16
__func__.36139:
	.ascii	"mpi_job_release\000"
	.type	__func__.36066, %object
	.size	__func__.36066, 18
__func__.36066:
	.ascii	"mpi_job_do_cancel\000"
	.type	__func__.36113, %object
	.size	__func__.36113, 13
__func__.36113:
	.ascii	"mpi_job_done\000"
	.type	__func__.36287, %object
	.size	__func__.36287, 21
__func__.36287:
	.ascii	"mpi_job_pool_release\000"
	.type	__func__.36161, %object
	.size	__func__.36161, 19
__func__.36161:
	.ascii	"mpi_job_pool_alloc\000"
	.type	__func__.36344, %object
	.size	__func__.36344, 19
__func__.36344:
	.ascii	"mpi_job_pool_flush\000"
	.type	__func__.36054, %object
	.size	__func__.36054, 20
__func__.36054:
	.ascii	"mpi_job_set_running\000"
	.type	__func__.36177, %object
	.size	__func__.36177, 25
__func__.36177:
	.ascii	"mpi_job_pool_request_job\000"
	.type	__func__.36364, %object
	.size	__func__.36364, 21
__func__.36364:
	.ascii	"mpi_job_pool_destroy\000"
	.type	__func__.36374, %object
	.size	__func__.36374, 20
__func__.36374:
	.ascii	"mpi_job_pool_create\000"
	.bss
	.set	.LANCHOR1,. + 0
	.type	__key.13574, %object
	.size	__key.13574, 0
__key.13574:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"job(%d) ready for dev(%s)\000"
.LC1:
	.ascii	"job(%d) release\000"
.LC2:
	.ascii	"job(%d) canceled\000"
.LC3:
	.ascii	"job(%d) done(%d)\000"
.LC4:
	.ascii	"job pool(%d) released\000"
.LC5:
	.ascii	"job pool(%d) failed to alloc job\000"
.LC6:
	.ascii	"&x->wait\000"
.LC7:
	.ascii	"job pool(%d) allocated job(%d)\000"
.LC8:
	.ascii	"job pool(%d) flushing\000"
.LC9:
	.ascii	"job(%d) run for dev(%s)\000"
.LC10:
	.ascii	"job pool(%d) request job, status: %d\000"
.LC11:
	.ascii	"job pool(%d) return job(%d)\000"
.LC12:
	.ascii	"job pool(%d) destroying\000"
.LC13:
	.ascii	"job pool(%d) registered\000"
	.section	___ksymtab_gpl+mpi_job_cancel,"a"
	.align	2
	.type	__ksymtab_mpi_job_cancel, %object
	.size	__ksymtab_mpi_job_cancel, 12
__ksymtab_mpi_job_cancel:
	.word	mpi_job_cancel
	.word	__kstrtab_mpi_job_cancel
	.word	__kstrtabns_mpi_job_cancel
	.section	___ksymtab_gpl+mpi_job_done,"a"
	.align	2
	.type	__ksymtab_mpi_job_done, %object
	.size	__ksymtab_mpi_job_done, 12
__ksymtab_mpi_job_done:
	.word	mpi_job_done
	.word	__kstrtab_mpi_job_done
	.word	__kstrtabns_mpi_job_done
	.section	___ksymtab_gpl+mpi_job_pool_flush,"a"
	.align	2
	.type	__ksymtab_mpi_job_pool_flush, %object
	.size	__ksymtab_mpi_job_pool_flush, 12
__ksymtab_mpi_job_pool_flush:
	.word	mpi_job_pool_flush
	.word	__kstrtab_mpi_job_pool_flush
	.word	__kstrtabns_mpi_job_pool_flush
	.section	___ksymtab_gpl+mpi_job_set_ready,"a"
	.align	2
	.type	__ksymtab_mpi_job_set_ready, %object
	.size	__ksymtab_mpi_job_set_ready, 12
__ksymtab_mpi_job_set_ready:
	.word	mpi_job_set_ready
	.word	__kstrtab_mpi_job_set_ready
	.word	__kstrtabns_mpi_job_set_ready
	.section	___ksymtab_gpl+mpi_job_wait,"a"
	.align	2
	.type	__ksymtab_mpi_job_wait, %object
	.size	__ksymtab_mpi_job_wait, 12
__ksymtab_mpi_job_wait:
	.word	mpi_job_wait
	.word	__kstrtab_mpi_job_wait
	.word	__kstrtabns_mpi_job_wait
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
