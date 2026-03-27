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
	.file	"mpi_buf.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_create:					
	.asciz 	"mpi_buf_create"					
__kstrtabns_mpi_buf_create:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_import:					
	.asciz 	"mpi_buf_pool_import"					
__kstrtabns_mpi_buf_pool_import:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_import_dmabuf:					
	.asciz 	"mpi_buf_pool_import_dmabuf"					
__kstrtabns_mpi_buf_pool_import_dmabuf:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_request_buf:					
	.asciz 	"mpi_buf_pool_request_buf"					
__kstrtabns_mpi_buf_pool_request_buf:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_add_user:					
	.asciz 	"mpi_buf_pool_add_user"					
__kstrtabns_mpi_buf_pool_add_user:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_del_user:					
	.asciz 	"mpi_buf_pool_del_user"					
__kstrtabns_mpi_buf_pool_del_user:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_destroy:					
	.asciz 	"mpi_buf_pool_destroy"					
__kstrtabns_mpi_buf_pool_destroy:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_create:					
	.asciz 	"mpi_buf_pool_create"					
__kstrtabns_mpi_buf_pool_create:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_dup:					
	.asciz 	"mpi_buf_pool_dup"					
__kstrtabns_mpi_buf_pool_dup:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_allocator_alloc:					
	.asciz 	"mpi_allocator_alloc"					
__kstrtabns_mpi_allocator_alloc:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_allocator_unregister:					
	.asciz 	"mpi_allocator_unregister"					
__kstrtabns_mpi_allocator_unregister:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_allocator_register:					
	.asciz 	"mpi_allocator_register"					
__kstrtabns_mpi_allocator_register:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	mpi_buf_pool_import
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_import, %function
mpi_buf_pool_import:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r0
	.pad #20
	sub	sp, sp, #20
	mov	r6, r1
	cbz	r0, .L2
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L3
.L2:
	mov	r0, #-1
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L3:
	ldr	r5, [r1, #480]
	cbnz	r5, .L7
	ldr	r2, [r1, #648]
	ldr	r3, [r0, #92]
	cmp	r2, r3
	bcc	.L7
	str	r0, [r6, #480]
	ldr	r3, [r0, #92]
	str	r3, [r1, #648]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r0, #120]
	add	r7, r0, #116
	add	r3, r6, #472
	strd	r7, r2, [r6, #472]
	str	r3, [r2]
	str	r3, [r0, #120]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bl	mpi_obj_ref
	ldr	r3, [r6]
	ldr	r2, .L11
	movs	r1, #5
	mov	r0, r5
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movs	r3, #244
	str	r3, [sp]
	ldr	r3, .L11+4
	bl	vlog
	mov	r0, r5
.L5:
	b	.L1
.L7:
	mov	r0, #-1
	b	.L5
.L12:
	.align	2
.L11:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	mpi_buf_pool_import, .-mpi_buf_pool_import
	.align	1
	.global	mpi_buf_pool_request_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_request_buf, %function
mpi_buf_pool_request_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r0
	.pad #28
	sub	sp, sp, #28
	mov	r4, r1
	cbz	r0, .L35
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L15
.L35:
	movs	r4, #0
.L16:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L15:
	ldr	r2, [r0]
	cbz	r1, .L23
	ldr	r3, [r1]
.L17:
	ldr	r1, [r5, #108]
	ldr	r0, [r5, #44]
	strd	r2, r3, [sp, #4]
	movw	r3, #293
	ldr	r2, .L36
	strd	r1, r0, [sp, #12]
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L36+4
	bl	vlog
	cbz	r4, .L18
	ldr	r3, [r4, #480]
	cmp	r3, r5
	bne	.L18
	ldr	r3, [r4, #44]
	ldr	r2, [r5, #104]
	cmp	r2, r3
	bne	.L19
.L34:
	mov	r0, r4
	bl	mpi_obj_ref
	b	.L19
.L23:
	mov	r3, #-1
	b	.L17
.L18:
	mov	r3, r5
	ldr	r4, [r3, #116]!
.L33:
	sub	r4, r4, #472
	add	r2, r4, #472
	cmp	r2, r3
	beq	.L35
	ldr	r2, [r4, #44]
	ldr	r1, [r5, #104]
	cmp	r1, r2
	bne	.L21
	cmp	r4, #0
	bne	.L34
.L19:
	ldr	r3, [r5, #100]
	movs	r1, #5
	ldr	r2, .L36+8
	movs	r0, #0
	adds	r3, r3, #1
	str	r3, [r5, #100]
	ldr	r3, [r4]
	str	r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	movw	r3, #319
	str	r3, [sp]
	ldr	r3, .L36+4
	bl	vlog
	b	.L16
.L21:
	ldr	r4, [r4, #472]
	b	.L33
.L37:
	.align	2
.L36:
	.word	.LC1
	.word	.LANCHOR0+20
	.word	.LC2
	.fnend
	.size	mpi_buf_pool_request_buf, .-mpi_buf_pool_request_buf
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_destroy, %function
mpi_buf_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r5, [r0, #480]
	movs	r0, #0
	ldr	r2, .L43
	str	r3, [sp, #4]
	movs	r3, #57
	str	r3, [sp]
	ldr	r3, .L43+4
	bl	vlog
	ldr	r3, [r4, #40]
	orr	r3, r3, #4
	str	r3, [r4, #40]
	cbz	r5, .L39
	ldrd	r2, r3, [r4, #472]
	mov	r0, r5
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	str	r3, [r4, #476]
	bl	mpi_obj_unref
.L39:
	mov	r0, r4
	bl	valloc_munmap
	ldr	r1, .L43+8
	add	r0, r4, #64
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	call_rcu
.L44:
	.align	2
.L43:
	.word	.LC3
	.word	.LANCHOR0+45
	.word	mpi_buf_destroy_rcu
	.fnend
	.size	mpi_buf_destroy, .-mpi_buf_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_release, %function
mpi_buf_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r4, [r0, #480]
	movs	r0, #0
	ldr	r2, .L48
	str	r3, [sp, #4]
	movs	r3, #77
	str	r3, [sp]
	ldr	r3, .L48+4
	bl	vlog
	cbnz	r4, .L46
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_buf_destroy
.L46:
	ldr	r3, [r4, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L47
	mov	r0, r4
	bl	mpi_obj_ref
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r5
	bl	mpi_buf_destroy
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unref
.L47:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L49:
	.align	2
.L48:
	.word	.LC4
	.word	.LANCHOR0+61
	.fnend
	.size	mpi_buf_release, .-mpi_buf_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_destroy_rcu, %function
mpi_buf_destroy_rcu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #420]
	cbz	r0, .L51
	bl	dma_buf_put
.L51:
	sub	r0, r4, #64
	pop	{r4, lr}
	b	mpi_obj_unregister
	.fnend
	.size	mpi_buf_destroy_rcu, .-mpi_buf_destroy_rcu
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_release, %function
mpi_buf_pool_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r2, .L57
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #395
	str	r3, [sp]
	ldr	r3, .L57+4
	bl	vlog
	ldr	r3, [r4, #116]
	ldr	r3, [r4, #40]
	lsls	r3, r3, #29
	bpl	.L55
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	mpi_obj_unregister
.L55:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L58:
	.align	2
.L57:
	.word	.LC5
	.word	.LANCHOR0+77
	.fnend
	.size	mpi_buf_pool_release, .-mpi_buf_pool_release
	.align	1
	.global	mpi_allocator_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_allocator_register, %function
mpi_allocator_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	mov	r5, r1
	mov	r0, r2
	mov	r1, #3264
	bl	kstrdup
	orr	r2, r5, #64
	movs	r3, #0
	movs	r1, #7
	str	r0, [r4, #80]
	mov	r0, r4
	bl	mpi_obj_register
	ldr	r3, [r4, #80]
	ldr	r2, .L60
	movs	r1, #5
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #679
	str	r3, [sp]
	ldr	r3, .L60+4
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L61:
	.align	2
.L60:
	.word	.LC6
	.word	.LANCHOR0+98
	.fnend
	.size	mpi_allocator_register, .-mpi_allocator_register
	.align	1
	.global	mpi_allocator_alloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_allocator_alloc, %function
mpi_allocator_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	cbz	r0, .L63
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L64
.L63:
	movs	r5, #0
.L62:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L64:
	bl	mpi_obj_ref
	mov	r1, r5
	ldr	r3, [r4, #88]
	mov	r2, r6
	mov	r0, r4
	blx	r3
	mov	r5, r0
	cbnz	r0, .L66
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L70
	str	r3, [sp, #4]
	movw	r3, #626
	str	r3, [sp]
	ldr	r3, .L70+4
	bl	vlog
.L66:
	mov	r0, r4
	bl	mpi_obj_unref
	b	.L62
.L71:
	.align	2
.L70:
	.word	.LC7
	.word	.LANCHOR0+121
	.fnend
	.size	mpi_allocator_alloc, .-mpi_allocator_alloc
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_sub.constprop.3, %function
atomic_sub.constprop.3:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r0]
	sub	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_sub.constprop.3, .-atomic_sub.constprop.3
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_inref_callback, %function
mpi_buf_inref_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #620]
	cbz	r3, .L74
	ldr	r2, [r0, #44]
	ldr	r1, [r0, #632]
	cmp	r1, r2
	bne	.L74
	blx	r3
.L74:
	ldr	r0, [r4, #480]
	cbz	r0, .L73
	ldr	r3, [r4, #44]
	ldr	r2, [r0, #104]
	cmp	r2, r3
	bne	.L73
	adds	r0, r0, #108
	bl	atomic_sub.constprop.3
	ldr	r3, [r4, #480]
	ldr	r2, [r3, #108]
	ldr	r1, [r3, #112]
	cmp	r1, r2
	itt	gt
	ldrgt	r2, [r3, #108]
	strgt	r2, [r3, #112]
.L73:
	pop	{r4, pc}
	.fnend
	.size	mpi_buf_inref_callback, .-mpi_buf_inref_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_add.constprop.4, %function
atomic_add.constprop.4:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r0]
	add	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_add.constprop.4, .-atomic_add.constprop.4
	.align	1
	.global	mpi_buf_pool_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_destroy, %function
mpi_buf_pool_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	.pad #20
	sub	sp, sp, #20
	mov	r7, r1
	cbz	r0, .L83
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L84
.L83:
	mov	r5, #-1
.L82:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L84:
	bl	mpi_obj_ref
	str	r7, [sp, #8]
	movs	r1, #5
	ldr	r3, [r5]
	movs	r0, #0
	ldr	r2, .L92
	str	r3, [sp, #4]
	movw	r3, #443
	str	r3, [sp]
	ldr	r3, .L92+4
	bl	vlog
	ldr	r4, [r5, #60]
	ldr	r3, [r5, #40]
	adds	r6, r4, #4
	bic	r3, r3, #2
	mov	r0, r4
	str	r3, [r5, #40]
	bl	atomic_add.constprop.4
	mov	r0, r6
	bl	atomic_add.constprop.4
	ldr	r3, [r5, #44]
	cbnz	r3, .L86
	add	r0, r4, #8
	bl	complete_all
.L86:
	ldr	r1, .L92+8
	add	r0, r5, #64
	bl	call_rcu
	cbnz	r7, .L87
	add	r0, r4, #8
	bl	wait_for_completion
.L87:
	mov	r0, r6
	bl	atomic_sub.constprop.3
	pld	[r4]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r5, [r4]
	sub	r5, r5, #1
	strex	r3, r5, [r4]
	teq	r3, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r5, .L88
	mov	r0, r4
	bl	kfree
	b	.L82
.L88:
	movs	r5, #0
	b	.L82
.L93:
	.align	2
.L92:
	.word	.LC8
	.word	.LANCHOR0+141
	.word	mpi_buf_pool_destroy_rcu
	.fnend
	.size	mpi_buf_pool_destroy, .-mpi_buf_pool_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_defref_callback, %function
mpi_buf_defref_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r0]
	movs	r1, #5
	ldr	r5, [r0, #480]
	movs	r0, #0
	ldr	r2, .L125
	str	r3, [sp, #4]
	movs	r3, #111
	str	r3, [sp]
	ldr	r3, .L125+4
	bl	vlog
	ldr	r3, [r4, #616]
	cbz	r3, .L95
	ldr	r2, [r4, #44]
	ldr	r1, [r4, #628]
	cmp	r1, r2
	bne	.L95
	mov	r0, r4
	blx	r3
.L95:
	cbz	r5, .L94
	ldr	r3, [r5, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L97
.L101:
.L94:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L97:
	ldr	r3, [r4, #44]
	ldr	r2, [r5, #104]
	cmp	r2, r3
	bne	.L101
	add	r3, r4, #488
	add	r2, r4, #552
	movs	r1, #0
.L100:
	ldr	r0, [r3], #4
	adds	r0, r0, #1
	it	ne
	strne	r1, [r3, #-4]
	cmp	r3, r2
	bne	.L100
	add	r0, r5, #108
	add	r7, r5, #124
	bl	atomic_add.constprop.4
	ldr	r3, [r5, #124]
	cmp	r7, r3
	beq	.L101
	ldr	r3, [r5, #124]
	movs	r6, #0
	subs	r3, r3, #100
.L102:
	add	r2, r3, #100
	cmp	r7, r2
	bne	.L104
	cbz	r6, .L105
	mov	r1, r4
	mov	r0, r6
	bl	mpi_node_buffer_available
.L105:
	ldr	r5, [r5, #124]
.L124:
	subs	r5, r5, #100
	add	r3, r5, #100
	cmp	r7, r3
	beq	.L101
	cmp	r5, r6
	beq	.L107
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L101
	mov	r1, r4
	mov	r0, r5
	bl	mpi_node_buffer_available
.L107:
	ldr	r5, [r5, #100]
	b	.L124
.L104:
	cbz	r6, .L109
	ldr	r1, [r6, #108]
	ldr	r2, [r3, #108]
	cmp	r1, r2
	it	hi
	movhi	r6, r3
.L103:
	ldr	r3, [r3, #100]
	subs	r3, r3, #100
	b	.L102
.L109:
	mov	r6, r3
	b	.L103
.L126:
	.align	2
.L125:
	.word	.LC4
	.word	.LANCHOR0+162
	.fnend
	.size	mpi_buf_defref_callback, .-mpi_buf_defref_callback
	.align	1
	.global	mpi_buf_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_create, %function
mpi_buf_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L137
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	mov	r6, r1
	ldr	r0, [r3, #40]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L127
	ldr	r3, .L137+4
	movs	r2, #0
	movs	r1, #4
	bl	mpi_obj_register
	cmp	r0, #0
	bge	.L129
	mov	r0, r4
	movs	r4, #0
	bl	kfree
.L127:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L129:
	cbz	r5, .L130
	ldr	r0, [r5, #4]
	adds	r0, r0, #28
	bl	atomic_add.constprop.4
	ldr	r3, [r5]
	str	r3, [r4, #648]
.L131:
	ldr	r3, .L137+8
	mov	r0, r4
	str	r6, [r4, #652]
	str	r5, [r4, #484]
	str	r3, [r4, #52]
	ldr	r3, .L137+12
	str	r3, [r4, #56]
	bl	valloc_mmap
	mov	r0, r4
	bl	mpi_obj_ref
	add	r3, r4, #488
	add	r2, r4, #552
	mov	r1, #-1
.L132:
	str	r1, [r3], #4
	cmp	r3, r2
	bne	.L132
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L137+16
	movs	r0, #0
	str	r3, [sp, #4]
	movs	r3, #213
	str	r3, [sp]
	ldr	r3, .L137+20
	bl	vlog
	b	.L127
.L130:
	str	r5, [r4, #648]
	b	.L131
.L138:
	.align	2
.L137:
	.word	kmalloc_caches
	.word	mpi_buf_release
	.word	mpi_buf_defref_callback
	.word	mpi_buf_inref_callback
	.word	.LC9
	.word	.LANCHOR0+186
	.fnend
	.size	mpi_buf_create, .-mpi_buf_create
	.align	1
	.global	mpi_buf_pool_import_dmabuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_import_dmabuf, %function
mpi_buf_pool_import_dmabuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	mov	r0, r1
	mov	r1, r2
	bl	mpi_buf_create
	mov	r4, r0
	cbz	r0, .L141
	adds	r6, r0, #4
	adds	r7, r5, #4
	movs	r2, #32
	movs	r1, #0
	mov	r0, r6
	bl	memset
	mov	r0, r7
	bl	strlen
	mov	r1, r7
	mov	r2, r0
	mov	r0, r6
	bl	memcpy
	mov	r0, r5
	mov	r1, r4
	bl	mpi_buf_pool_import
	mov	r5, r0
	mov	r0, r4
	bl	mpi_obj_unref
.L139:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L141:
	mov	r5, #-1
	b	.L139
	.fnend
	.size	mpi_buf_pool_import_dmabuf, .-mpi_buf_pool_import_dmabuf
	.align	1
	.global	mpi_buf_pool_dup
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_dup, %function
mpi_buf_pool_dup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L165
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r8, [r0, #44]
	.pad #20
	sub	sp, sp, #20
	ldrd	r10, r7, [r0, #92]
	mov	fp, r1
	ldr	r0, [r3, #8]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L142
	ldr	r3, .L165+4
	movs	r2, #64
	movs	r1, #5
	movs	r6, #0
	bl	mpi_obj_register
	cmp	r0, #0
	bge	.L144
	mov	r0, r4
	bl	kfree
.L164:
	movs	r4, #0
	b	.L142
.L144:
	add	r9, r4, #4
	str	r6, [r4, #108]
	add	r3, r4, #116
	movs	r2, #32
	str	r3, [r4, #116]
	mov	r1, r6
	str	r3, [r4, #120]
	mov	r0, r9
	add	r3, r4, #124
	strd	r10, r7, [r4, #92]
	str	r3, [r4, #124]
	str	r3, [r4, #128]
	str	r8, [r4, #112]
	bl	memset
	mov	r0, fp
	bl	strlen
	mov	r1, fp
	cmp	r0, #31
	mov	r2, r0
	mov	r0, r9
	it	cs
	movcs	r2, #31
	bl	memcpy
	cmp	r7, #0
	bge	.L145
	cmp	r10, #0
	beq	.L153
	ldr	r3, [r5, #116]!
	cmp	r3, r5
	beq	.L154
	ldr	r5, [r3, #12]
	cbnz	r5, .L146
.L147:
	movs	r1, #0
	mov	r0, r4
	bl	mpi_buf_pool_destroy
	b	.L164
.L149:
	mov	r2, r7
	mov	r1, r5
	mov	r0, r4
	subs	r6, r6, #1
	bl	mpi_buf_pool_import_dmabuf
	cmp	r0, #0
	blt	.L147
.L148:
	cmp	r6, #0
	bne	.L149
.L152:
	ldr	r3, [r4, #44]
	movs	r1, #5
	ldr	r2, .L165+8
	movs	r0, #0
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #594
	str	r3, [sp]
	ldr	r3, .L165+12
	bl	vlog
.L142:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L153:
	mov	r5, r10
.L146:
	mov	r6, r8
	b	.L148
.L154:
	mov	r5, r6
	b	.L146
.L145:
	ldr	r6, [r5, #116]!
	orr	r7, r7, #-2147483648
	sub	r6, r6, #472
.L150:
	add	r3, r6, #472
	cmp	r3, r5
	beq	.L152
	ldr	r1, [r6, #484]
	cmp	r1, #0
	beq	.L147
	mov	r2, r7
	mov	r0, r4
	bl	mpi_buf_pool_import_dmabuf
	cmp	r0, #0
	blt	.L147
	ldr	r6, [r6, #472]
	sub	r6, r6, #472
	b	.L150
.L166:
	.align	2
.L165:
	.word	kmalloc_caches
	.word	mpi_buf_pool_release
	.word	.LC10
	.word	.LANCHOR0+201
	.fnend
	.size	mpi_buf_pool_dup, .-mpi_buf_pool_dup
	.align	1
	.global	mpi_buf_pool_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_create, %function
mpi_buf_pool_create:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r7, r3
	ldr	r3, .L205
	mov	r10, r0
	mov	r6, r1
	mov	r1, #3520
	mov	r8, r2
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L167
	ldr	r3, .L205+4
	movs	r2, #64
	movs	r1, #5
	movs	r5, #0
	bl	mpi_obj_register
	cmp	r0, #0
	bge	.L169
	mov	r0, r4
	bl	kfree
.L204:
	movs	r4, #0
	b	.L167
.L169:
	add	r9, r4, #4
	str	r5, [r4, #108]
	add	r3, r4, #116
	movs	r2, #32
	str	r3, [r4, #116]
	mov	r1, r5
	str	r3, [r4, #120]
	mov	r0, r9
	add	r3, r4, #124
	strd	r8, r6, [r4, #92]
	str	r3, [r4, #124]
	str	r3, [r4, #128]
	str	r7, [r4, #112]
	bl	memset
	ldr	r0, [sp, #48]
	bl	strlen
	cmp	r0, #31
	mov	r2, r0
	ldr	r1, [sp, #48]
	mov	r0, r9
	it	cs
	movcs	r2, #31
	bl	memcpy
	cmp	r6, #0
	bge	.L170
	cmp	r8, #0
	beq	.L181
	mov	r2, r8
	mov	r1, r6
	mov	r0, r10
	bl	mpi_allocator_alloc
	mov	r5, r0
	cbnz	r0, .L170
.L175:
	movs	r1, #0
	mov	r0, r4
	bl	mpi_buf_pool_destroy
	b	.L204
.L178:
	cmp	r6, #0
	blt	.L172
	cmp	r8, #0
	beq	.L172
	mov	r2, r8
	mov	r1, r6
	mov	r0, r10
	bl	mpi_allocator_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L175
.L172:
	ldr	r3, [r4, #112]
	mov	r1, r5
	mov	r0, r4
	cmp	r3, r7
	ite	ne
	movne	r2, r6
	moveq	r2, r9
	bl	mpi_buf_pool_import_dmabuf
	cmp	r0, #0
	bge	.L174
	cmp	r5, #0
	beq	.L175
	mov	r0, r5
	bl	dma_buf_put
	b	.L175
.L174:
	cmp	r6, #0
	blt	.L176
	cbz	r5, .L176
	mov	r0, r5
	bl	dma_buf_put
.L176:
	subs	r7, r7, #1
	b	.L177
.L181:
	mov	r5, r8
.L170:
	bic	r9, r6, #-2147483648
.L177:
	cmp	r7, #0
	bne	.L178
	cmp	r6, #0
	bge	.L179
	cbz	r5, .L179
	mov	r0, r5
	bl	dma_buf_put
.L179:
	ldr	r3, [r4, #44]
	movs	r1, #5
	ldr	r2, .L205+8
	movs	r0, #0
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #523
	str	r3, [sp]
	ldr	r3, .L205+12
	bl	vlog
.L167:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L206:
	.align	2
.L205:
	.word	kmalloc_caches
	.word	mpi_buf_pool_release
	.word	.LC10
	.word	.LANCHOR0+218
	.fnend
	.size	mpi_buf_pool_create, .-mpi_buf_pool_create
	.align	1
	.global	mpi_buf_pool_del_user
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_del_user, %function
mpi_buf_pool_del_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1]
	ldr	r2, .L208
	str	r3, [sp, #12]
	ldr	r3, [r1, #80]
	movs	r1, #5
	ldr	r3, [r3, #80]
	str	r3, [sp, #8]
	ldr	r3, [r0]
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #379
	str	r3, [sp]
	ldr	r3, .L208+4
	bl	vlog
	movs	r1, #1
	mov	r0, r4
	bl	mpi_node_flush
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldrd	r2, r3, [r4, #100]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	str	r3, [r4, #104]
	movs	r3, #0
	str	r3, [r4, #96]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L209:
	.align	2
.L208:
	.word	.LC11
	.word	.LANCHOR0+238
	.fnend
	.size	mpi_buf_pool_del_user, .-mpi_buf_pool_del_user
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_destroy_rcu, %function
mpi_buf_pool_destroy_rcu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r1, [r7, #60]!
	sub	r6, r0, #64
	mov	r4, r0
	ldr	r5, [r1], #-100
	subs	r5, r5, #100
.L211:
	add	r3, r1, #100
	cmp	r3, r7
	bne	.L212
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r7, r4
	ldr	r0, [r7, #52]!
	sub	r0, r0, #472
	ldr	r5, [r0, #472]
	sub	r5, r5, #472
.L213:
	add	r3, r0, #472
	cmp	r3, r7
	bne	.L215
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #-24]
	mov	r0, r6
	orr	r3, r3, #4
	str	r3, [r4, #-24]
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_obj_unref
.L212:
	mov	r0, r6
	bl	mpi_buf_pool_del_user
	ldr	r3, [r5, #100]
	mov	r1, r5
	sub	r5, r3, #100
	b	.L211
.L215:
	ldr	r3, [r0, #44]
	cbnz	r3, .L214
	bl	mpi_buf_destroy
.L214:
	ldr	r3, [r5, #472]
	mov	r0, r5
	sub	r5, r3, #472
	b	.L213
	.fnend
	.size	mpi_buf_pool_destroy_rcu, .-mpi_buf_pool_destroy_rcu
	.align	1
	.global	mpi_buf_pool_add_user
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_pool_add_user, %function
mpi_buf_pool_add_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r0
	ldr	r3, [r0, #40]
	mov	r6, r1
	lsls	r3, r3, #30
	bpl	.L216
	ldr	r3, [r1]
	ldr	r2, .L237
	str	r3, [sp, #12]
	ldr	r3, [r1, #80]
	movs	r1, #5
	ldr	r3, [r3, #80]
	str	r3, [sp, #8]
	ldr	r3, [r0]
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #343
	str	r3, [sp]
	ldr	r3, .L237+4
	bl	vlog
	ldr	r0, [r6, #96]
	cbz	r0, .L218
	mov	r1, r6
	bl	mpi_buf_pool_del_user
.L218:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	str	r4, [r6, #96]
	add	r0, r4, #124
	ldr	r2, [r4, #128]
	add	r3, r6, #100
	strd	r0, r2, [r6, #100]
	str	r3, [r2]
	str	r3, [r4, #128]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cbz	r4, .L219
	ldr	r3, [r4, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L220
.L219:
.L220:
	ldr	r5, [r4, #116]!
.L236:
	sub	r5, r5, #472
	add	r3, r5, #472
	cmp	r3, r4
	bne	.L223
.L216:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L223:
	ldr	r3, [r5, #44]
	cbnz	r3, .L222
	mov	r1, r5
	mov	r0, r6
	bl	mpi_node_buffer_available
.L222:
	ldr	r5, [r5, #472]
	b	.L236
.L238:
	.align	2
.L237:
	.word	.LC12
	.word	.LANCHOR0+260
	.fnend
	.size	mpi_buf_pool_add_user, .-mpi_buf_pool_add_user
	.align	1
	.global	mpi_allocator_unregister
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_allocator_unregister, %function
mpi_allocator_unregister:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r0, #80]
	movs	r1, #5
	ldr	r2, .L246
	movs	r0, #0
	str	r3, [sp, #4]
	mov	r3, #644
	str	r3, [sp]
	ldr	r3, .L246+4
	bl	vlog
	cbz	r4, .L240
	mov	r0, r4
	bl	mpi_obj_ref
.L240:
	ldr	r3, [r4, #40]
	bic	r3, r3, #2
	str	r3, [r4, #40]
	bl	synchronize_rcu
	ldr	r5, [r4, #60]
	ldr	r3, [r4, #40]
	adds	r6, r5, #4
	add	r7, r5, #8
	orr	r3, r3, #4
	mov	r0, r5
	str	r3, [r4, #40]
	bl	atomic_add.constprop.4
	mov	r0, r6
	bl	atomic_add.constprop.4
	ldr	r3, [r4, #44]
	cbnz	r3, .L241
	mov	r0, r7
	bl	complete_all
.L241:
	mov	r0, r4
	bl	mpi_obj_unref
	mov	r0, r7
	bl	wait_for_completion
	mov	r0, r6
	bl	atomic_sub.constprop.3
	pld	[r5]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r3, [r5]
	sub	r3, r3, #1
	strex	r2, r3, [r5]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L242
	mov	r0, r5
	bl	kfree
.L242:
	ldr	r0, [r4, #80]
	bl	kfree
	mov	r0, r4
	bl	mpi_obj_unregister
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L247:
	.align	2
.L246:
	.word	.LC13
	.word	.LANCHOR0+282
	.fnend
	.size	mpi_allocator_unregister, .-mpi_allocator_unregister
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.36361, %object
	.size	__func__.36361, 20
__func__.36361:
	.ascii	"mpi_buf_pool_import\000"
	.type	__func__.36388, %object
	.size	__func__.36388, 25
__func__.36388:
	.ascii	"mpi_buf_pool_request_buf\000"
	.type	__func__.36171, %object
	.size	__func__.36171, 16
__func__.36171:
	.ascii	"mpi_buf_destroy\000"
	.type	__func__.36182, %object
	.size	__func__.36182, 16
__func__.36182:
	.ascii	"mpi_buf_release\000"
	.type	__func__.36545, %object
	.size	__func__.36545, 21
__func__.36545:
	.ascii	"mpi_buf_pool_release\000"
	.type	__func__.36777, %object
	.size	__func__.36777, 23
__func__.36777:
	.ascii	"mpi_allocator_register\000"
	.type	__func__.36745, %object
	.size	__func__.36745, 20
__func__.36745:
	.ascii	"mpi_allocator_alloc\000"
	.type	__func__.36631, %object
	.size	__func__.36631, 21
__func__.36631:
	.ascii	"mpi_buf_pool_destroy\000"
	.type	__func__.36206, %object
	.size	__func__.36206, 24
__func__.36206:
	.ascii	"mpi_buf_defref_callback\000"
	.type	__func__.36336, %object
	.size	__func__.36336, 15
__func__.36336:
	.ascii	"mpi_buf_create\000"
	.type	__func__.36725, %object
	.size	__func__.36725, 17
__func__.36725:
	.ascii	"mpi_buf_pool_dup\000"
	.type	__func__.36663, %object
	.size	__func__.36663, 20
__func__.36663:
	.ascii	"mpi_buf_pool_create\000"
	.type	__func__.36523, %object
	.size	__func__.36523, 22
__func__.36523:
	.ascii	"mpi_buf_pool_del_user\000"
	.type	__func__.36462, %object
	.size	__func__.36462, 22
__func__.36462:
	.ascii	"mpi_buf_pool_add_user\000"
	.type	__func__.36757, %object
	.size	__func__.36757, 25
__func__.36757:
	.ascii	"mpi_allocator_unregister\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"buf pool(%d) imported buf(%d)\000"
.LC1:
	.ascii	"buf pool(%d) request buf(%d), status: %d/%d\000"
.LC2:
	.ascii	"buf pool(%d) return buf(%d)\000"
.LC3:
	.ascii	"buf(%d) destroying\000"
.LC4:
	.ascii	"buf(%d) released\000"
.LC5:
	.ascii	"buf pool(%d) released\000"
.LC6:
	.ascii	"allocator(%s) registered\000"
.LC7:
	.ascii	"alloc(%d) unable to alloc\000"
.LC8:
	.ascii	"buf pool(%d) destroying, async: %d\000"
.LC9:
	.ascii	"buf(%d) created\000"
.LC10:
	.ascii	"buf pool(%d) created with %d buffers\000"
.LC11:
	.ascii	"buf pool(%d) del user(%s-%d)\000"
.LC12:
	.ascii	"buf pool(%d) add user(%s-%d)\000"
.LC13:
	.ascii	"allocator(%s) unregistering\000"
	.section	___ksymtab_gpl+mpi_allocator_alloc,"a"
	.align	2
	.type	__ksymtab_mpi_allocator_alloc, %object
	.size	__ksymtab_mpi_allocator_alloc, 12
__ksymtab_mpi_allocator_alloc:
	.word	mpi_allocator_alloc
	.word	__kstrtab_mpi_allocator_alloc
	.word	__kstrtabns_mpi_allocator_alloc
	.section	___ksymtab_gpl+mpi_allocator_register,"a"
	.align	2
	.type	__ksymtab_mpi_allocator_register, %object
	.size	__ksymtab_mpi_allocator_register, 12
__ksymtab_mpi_allocator_register:
	.word	mpi_allocator_register
	.word	__kstrtab_mpi_allocator_register
	.word	__kstrtabns_mpi_allocator_register
	.section	___ksymtab_gpl+mpi_allocator_unregister,"a"
	.align	2
	.type	__ksymtab_mpi_allocator_unregister, %object
	.size	__ksymtab_mpi_allocator_unregister, 12
__ksymtab_mpi_allocator_unregister:
	.word	mpi_allocator_unregister
	.word	__kstrtab_mpi_allocator_unregister
	.word	__kstrtabns_mpi_allocator_unregister
	.section	___ksymtab_gpl+mpi_buf_create,"a"
	.align	2
	.type	__ksymtab_mpi_buf_create, %object
	.size	__ksymtab_mpi_buf_create, 12
__ksymtab_mpi_buf_create:
	.word	mpi_buf_create
	.word	__kstrtab_mpi_buf_create
	.word	__kstrtabns_mpi_buf_create
	.section	___ksymtab_gpl+mpi_buf_pool_add_user,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_add_user, %object
	.size	__ksymtab_mpi_buf_pool_add_user, 12
__ksymtab_mpi_buf_pool_add_user:
	.word	mpi_buf_pool_add_user
	.word	__kstrtab_mpi_buf_pool_add_user
	.word	__kstrtabns_mpi_buf_pool_add_user
	.section	___ksymtab_gpl+mpi_buf_pool_create,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_create, %object
	.size	__ksymtab_mpi_buf_pool_create, 12
__ksymtab_mpi_buf_pool_create:
	.word	mpi_buf_pool_create
	.word	__kstrtab_mpi_buf_pool_create
	.word	__kstrtabns_mpi_buf_pool_create
	.section	___ksymtab_gpl+mpi_buf_pool_del_user,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_del_user, %object
	.size	__ksymtab_mpi_buf_pool_del_user, 12
__ksymtab_mpi_buf_pool_del_user:
	.word	mpi_buf_pool_del_user
	.word	__kstrtab_mpi_buf_pool_del_user
	.word	__kstrtabns_mpi_buf_pool_del_user
	.section	___ksymtab_gpl+mpi_buf_pool_destroy,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_destroy, %object
	.size	__ksymtab_mpi_buf_pool_destroy, 12
__ksymtab_mpi_buf_pool_destroy:
	.word	mpi_buf_pool_destroy
	.word	__kstrtab_mpi_buf_pool_destroy
	.word	__kstrtabns_mpi_buf_pool_destroy
	.section	___ksymtab_gpl+mpi_buf_pool_dup,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_dup, %object
	.size	__ksymtab_mpi_buf_pool_dup, 12
__ksymtab_mpi_buf_pool_dup:
	.word	mpi_buf_pool_dup
	.word	__kstrtab_mpi_buf_pool_dup
	.word	__kstrtabns_mpi_buf_pool_dup
	.section	___ksymtab_gpl+mpi_buf_pool_import,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_import, %object
	.size	__ksymtab_mpi_buf_pool_import, 12
__ksymtab_mpi_buf_pool_import:
	.word	mpi_buf_pool_import
	.word	__kstrtab_mpi_buf_pool_import
	.word	__kstrtabns_mpi_buf_pool_import
	.section	___ksymtab_gpl+mpi_buf_pool_import_dmabuf,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_import_dmabuf, %object
	.size	__ksymtab_mpi_buf_pool_import_dmabuf, 12
__ksymtab_mpi_buf_pool_import_dmabuf:
	.word	mpi_buf_pool_import_dmabuf
	.word	__kstrtab_mpi_buf_pool_import_dmabuf
	.word	__kstrtabns_mpi_buf_pool_import_dmabuf
	.section	___ksymtab_gpl+mpi_buf_pool_request_buf,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_request_buf, %object
	.size	__ksymtab_mpi_buf_pool_request_buf, 12
__ksymtab_mpi_buf_pool_request_buf:
	.word	mpi_buf_pool_request_buf
	.word	__kstrtab_mpi_buf_pool_request_buf
	.word	__kstrtabns_mpi_buf_pool_request_buf
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
