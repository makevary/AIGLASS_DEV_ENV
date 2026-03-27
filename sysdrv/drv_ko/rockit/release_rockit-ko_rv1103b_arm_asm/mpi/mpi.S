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
	.file	"mpi.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_obj_lock:					
	.asciz 	"mpi_obj_lock"					
__kstrtabns_mpi_obj_lock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_dev_list:					
	.asciz 	"mpi_dev_list"					
__kstrtabns_mpi_dev_list:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_node_list:					
	.asciz 	"mpi_node_list"					
__kstrtabns_mpi_node_list:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_list:					
	.asciz 	"mpi_buf_list"					
__kstrtabns_mpi_buf_list:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_pool_list:					
	.asciz 	"mpi_buf_pool_list"					
__kstrtabns_mpi_buf_pool_list:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_alloc_list:					
	.asciz 	"mpi_alloc_list"					
__kstrtabns_mpi_alloc_list:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_obj_ref:					
	.asciz 	"mpi_obj_ref"					
__kstrtabns_mpi_obj_ref:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_obj_unref:					
	.asciz 	"mpi_obj_unref"					
__kstrtabns_mpi_obj_unref:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_obj_from_id:					
	.asciz 	"mpi_obj_from_id"					
__kstrtabns_mpi_obj_from_id:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_dev_find_by_name:					
	.asciz 	"mpi_dev_find_by_name"					
__kstrtabns_mpi_dev_find_by_name:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_allocator_find_by_name:					
	.asciz 	"mpi_allocator_find_by_name"					
__kstrtabns_mpi_allocator_find_by_name:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	list_del, %function
list_del:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r2, #256
	mov	r3, #290
	strd	r2, r3, [r0]
	bx	lr
	.fnend
	.size	list_del, .-list_del
	.align	1
	.global	mpi_obj_from_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_from_id, %function
mpi_obj_from_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L8
	ldr	r0, [r2, r0, lsl #2]
	cbz	r0, .L3
	ldr	r2, [r0, #36]
	cmp	r2, r1
	it	ne
	movne	r0, #0
.L3:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L9:
	.align	2
.L8:
	.word	mpi_obj_idr
	.fnend
	.size	mpi_obj_from_id, .-mpi_obj_from_id
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_referenced, %function
mpi_obj_referenced:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r0, #44]
	mov	r4, r0
	ldr	r3, .L15
	movs	r1, #5
	subs	r2, r5, #1
	str	r2, [sp, #12]
	ldr	r2, [r0]
	str	r2, [sp, #8]
	ldr	r2, [r0, #36]
	movs	r0, #0
	add	r2, r3, r2, lsl #2
	ldr	r2, [r2, #20]
	str	r2, [sp, #4]
	movs	r2, #187
	str	r2, [sp]
	ldr	r2, .L15+4
	bl	vlog
	cmp	r5, #1
	bne	.L11
	ldr	r3, [r4, #60]
	cbz	r3, .L11
	movs	r2, #0
	str	r2, [r3, #8]
.L11:
	ldr	r3, [r4, #44]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	mpi_obj_referenced, .-mpi_obj_referenced
	.align	1
	.global	mpi_dev_find_by_name
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_dev_find_by_name, %function
mpi_dev_find_by_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L23
	ldr	r4, [r5]
.L22:
	subs	r4, r4, #72
	add	r3, r4, #72
	cmp	r5, r3
	bne	.L21
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r4, #0
	b	.L17
.L21:
	mov	r1, r7
	ldr	r0, [r4, #80]
	bl	strcmp
	cbnz	r0, .L19
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L17:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L19:
	ldr	r4, [r4, #72]
	b	.L22
.L24:
	.align	2
.L23:
	.word	.LANCHOR1
	.fnend
	.size	mpi_dev_find_by_name, .-mpi_dev_find_by_name
	.align	1
	.global	mpi_allocator_find_by_name
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_allocator_find_by_name, %function
mpi_allocator_find_by_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L31
	ldr	r4, [r5, #8]!
.L30:
	subs	r4, r4, #72
	add	r3, r4, #72
	cmp	r3, r5
	bne	.L29
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r4, #0
	b	.L25
.L29:
	mov	r1, r7
	ldr	r0, [r4, #80]
	bl	strcmp
	cbnz	r0, .L27
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L25:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L27:
	ldr	r4, [r4, #72]
	b	.L30
.L32:
	.align	2
.L31:
	.word	.LANCHOR1
	.fnend
	.size	mpi_allocator_find_by_name, .-mpi_allocator_find_by_name
	.align	1
	.global	mpi_obj_ref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_ref, %function
mpi_obj_ref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L34
	ldr	r3, [r0, #56]
	cbz	r3, .L35
	blx	r3
.L35:
	add	r3, r4, #44
	pld	[r3]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r4
	bl	mpi_obj_referenced
.L34:
	mov	r0, r4
	pop	{r4, pc}
	.fnend
	.size	mpi_obj_ref, .-mpi_obj_ref
	.align	1
	.global	mpi_obj_unref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_unref, %function
mpi_obj_unref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r0
	.pad #20
	sub	sp, sp, #20
	cbz	r0, .L42
	ldr	r0, [r0, #44]
	ldr	r2, [r5]
	cbnz	r0, .L45
	movs	r3, #250
	str	r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L66
	ldr	r2, .L66+4
	bl	vlog
.L42:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L45:
	ldr	r1, [r5, #44]
	movs	r0, #0
	ldr	r3, .L66+8
	strd	r2, r1, [sp, #8]
	movs	r1, #5
	ldr	r2, [r5, #36]
	add	r2, r3, r2, lsl #2
	adds	r3, r3, #52
	ldr	r2, [r2, #20]
	str	r2, [sp, #4]
	movs	r2, #255
	str	r2, [sp]
	ldr	r2, .L66+12
	bl	vlog
	add	r3, r5, #44
	pld	[r3]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r4, [r3]
	sub	r4, r4, #1
	strex	r2, r4, [r3]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #52]
	cbz	r3, .L46
	mov	r0, r5
	blx	r3
.L46:
	cmp	r4, #0
	bne	.L42
	ldr	r4, [r5, #60]
	cbz	r4, .L48
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
.L48:
	ldr	r3, [r5, #48]
	cbz	r3, .L49
	mov	r0, r5
	blx	r3
.L49:
	cmp	r4, #0
	beq	.L42
	ldr	r3, [r4, #4]
	cbz	r3, .L50
	add	r0, r4, #8
	bl	complete_all
.L50:
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
	cmp	r3, #0
	bne	.L42
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	kfree
.L67:
	.align	2
.L66:
	.word	.LANCHOR0+52
	.word	.LC1
	.word	.LANCHOR0
	.word	.LC2
	.fnend
	.size	mpi_obj_unref, .-mpi_obj_unref
	.align	1
	.global	mpi_obj_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_register, %function
mpi_obj_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	str	r3, [r4, #48]
	lsls	r3, r2, #25
	mov	r0, #-1
	str	r1, [r4, #36]
	mov	r5, #0
	orr	r1, r2, #3
	.pad #20
	sub	sp, sp, #20
	str	r0, [r4]
	str	r1, [r4, #40]
	str	r5, [r4, #44]
	bpl	.L69
	ldr	r3, .L92
	mov	r1, #3520
	ldr	r0, [r3, #20]
	bl	kmem_cache_alloc
	ldr	r2, .L92+4
	ldr	r1, .L92+8
	str	r0, [r4, #60]
	adds	r0, r0, #12
	str	r5, [r0, #-4]
	bl	__init_swait_queue_head
	ldr	r3, [r4, #60]
	movs	r2, #1
	str	r2, [r3]
.L69:
	ldr	r3, [r4, #40]
	ands	r3, r3, #16
	bne	.L70
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L92+12
	mov	r0, r2
.L73:
	ldr	r5, [r2], #4
	cbnz	r5, .L71
	str	r4, [r0, r3, lsl #2]
.L72:
	str	r3, [r4]
	adds	r3, r3, #1
	bne	.L74
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r4, #60]
	cbz	r0, .L75
	bl	kfree
.L75:
	ldr	r0, [r4]
.L68:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L71:
	adds	r3, r3, #1
	cmp	r3, #1024
	bne	.L73
	mov	r3, #-1
	b	.L72
.L74:
	ldr	r3, [r4, #36]
	cmp	r3, #7
	bhi	.L77
	tbb	[pc, r3]
.L79:
	.byte	(.L83-.L79)/2
	.byte	(.L82-.L79)/2
	.byte	(.L77-.L79)/2
	.byte	(.L77-.L79)/2
	.byte	(.L81-.L79)/2
	.byte	(.L80-.L79)/2
	.byte	(.L77-.L79)/2
	.byte	(.L78-.L79)/2
	.p2align 1
.L83:
	ldr	r2, .L92+16
	add	r3, r4, #72
	ldr	r0, [r2, #4]
	str	r3, [r2, #4]
	strd	r2, r0, [r4, #72]
	str	r3, [r0]
.L77:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L70:
	ldr	r2, [r4]
	movs	r1, #5
	ldr	r3, .L92+20
	movs	r0, #0
	str	r4, [sp, #12]
	str	r2, [sp, #8]
	ldr	r2, [r4, #36]
	add	r2, r3, r2, lsl #2
	adds	r3, r3, #66
	ldr	r2, [r2, #20]
	str	r2, [sp, #4]
	movs	r2, #145
	str	r2, [sp]
	ldr	r2, .L92+24
	bl	vlog
	movs	r0, #0
	b	.L68
.L82:
	ldr	r3, .L92+16
	add	r2, r4, #72
	adds	r3, r3, #16
	ldr	r0, [r3, #4]
	str	r2, [r3, #4]
.L91:
	strd	r3, r0, [r4, #72]
	str	r2, [r0]
	b	.L77
.L81:
	ldr	r3, .L92+16
	add	r2, r4, #72
	adds	r3, r3, #24
	ldr	r0, [r3, #4]
	str	r2, [r3, #4]
	b	.L91
.L80:
	ldr	r3, .L92+16
	add	r2, r4, #72
	adds	r3, r3, #32
	ldr	r0, [r3, #4]
	str	r2, [r3, #4]
	b	.L91
.L78:
	ldr	r3, .L92+16
	add	r2, r4, #72
	adds	r3, r3, #8
	ldr	r0, [r3, #4]
	str	r2, [r3, #4]
	b	.L91
.L93:
	.align	2
.L92:
	.word	kmalloc_caches
	.word	.LANCHOR2
	.word	.LC3
	.word	mpi_obj_idr
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	.LC4
	.fnend
	.size	mpi_obj_register, .-mpi_obj_register
	.align	1
	.global	mpi_obj_unregister
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_unregister, %function
mpi_obj_unregister:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #44]
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r0, #40]
	ldr	r1, [r0, #60]
	bic	r2, r3, #3
	lsls	r3, r3, #27
	str	r2, [r0, #40]
	bmi	.L95
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #36]
	cmp	r3, #7
	bhi	.L96
	tbb	[pc, r3]
.L98:
	.byte	(.L97-.L98)/2
	.byte	(.L97-.L98)/2
	.byte	(.L96-.L98)/2
	.byte	(.L96-.L98)/2
	.byte	(.L97-.L98)/2
	.byte	(.L97-.L98)/2
	.byte	(.L96-.L98)/2
	.byte	(.L97-.L98)/2
	.p2align 1
.L97:
	adds	r0, r0, #72
	bl	list_del
.L96:
	ldr	r2, [r4]
	movs	r0, #0
	ldr	r3, .L108
	str	r0, [r3, r2, lsl #2]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L95:
	cbz	r1, .L100
	pld	[r1]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub_return
1:	ldrex	r3, [r1]
	sub	r3, r3, #1
	strex	r2, r3, [r1]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L100
	mov	r0, r1
	bl	kfree
.L100:
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r5, .L108+4
	movs	r0, #0
	ldr	r2, .L108+8
	str	r3, [sp, #8]
	ldr	r3, [r4, #36]
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #20]
	str	r3, [sp, #4]
	movs	r3, #174
	str	r3, [sp]
	add	r3, r5, #83
	bl	vlog
	ldr	r0, [r4, #40]
	ands	r0, r0, #8
	bne	.L94
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L108+12
	str	r3, [sp, #8]
	ldr	r3, [r4, #36]
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #20]
	str	r3, [sp, #4]
	movs	r3, #177
	str	r3, [sp]
	add	r3, r5, #83
	bl	vlog
	cbz	r4, .L94
	movs	r1, #64
	adds	r0, r4, r1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	call_rcu
.L94:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L109:
	.align	2
.L108:
	.word	mpi_obj_idr
	.word	.LANCHOR0
	.word	.LC5
	.word	.LC6
	.fnend
	.size	mpi_obj_unregister, .-mpi_obj_unregister
	.align	1
	.global	mpi_obj_ref_if_unused
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_ref_if_unused, %function
mpi_obj_ref_if_unused:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	add	r3, r0, #44
	pld	[r3]
	movs	r1, #1
.L111:
	.syntax unified
@ 114 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_cmpxchg
ldrex	r4, [r3]
mov	r2, #0
teq	r4, #0
strexeq r2, r1, [r3]

@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r2, #0
	bne	.L111
	cbnz	r4, .L113
	bl	mpi_obj_referenced
	movs	r0, #1
.L112:
	pop	{r4, pc}
.L113:
	mov	r0, r2
	b	.L112
	.fnend
	.size	mpi_obj_ref_if_unused, .-mpi_obj_ref_if_unused
	.align	1
	.global	mpi_obj_ref_if_used
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_obj_ref_if_used, %function
mpi_obj_ref_if_used:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r1, r0, #44
	movs	r4, #1
	pld	[r1]
	movs	r5, #0
	.syntax unified
@ 136 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add_unless
1:	ldrex	r2, [r1]
	teq	r2, r5
	beq	2f
	add	r6, r2, r4
	strex	r7, r6, [r1]
	teq	r7, #0
	bne	1b
2:
@ 0 "" 2
	.thumb
	.syntax unified
	cbz	r2, .L117
	bl	mpi_obj_referenced
	mov	r0, r4
.L116:
	pop	{r3, r4, r5, r6, r7, pc}
.L117:
	mov	r0, r2
	b	.L116
	.fnend
	.size	mpi_obj_ref_if_used, .-mpi_obj_ref_if_used
	.align	1
	.global	mpi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_init, %function
mpi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r2, #4096
	movs	r1, #0
	ldr	r0, .L120
	bl	memset
	bl	mpi_list_init
	cmp	r0, #0
	blt	.L118
	bl	mpi_fs_init
	ldr	r0, .L120+4
	bl	vlog_probe
	movs	r0, #0
.L118:
	pop	{r3, pc}
.L121:
	.align	2
.L120:
	.word	mpi_obj_idr
	.word	.LC7
	.fnend
	.size	mpi_init, .-mpi_init
	.align	1
	.global	mpi_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_deinit, %function
mpi_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpi_fs_exit
	bl	mpi_list_deinit
	pop	{r3, lr}
	b	vlog_unload
	.fnend
	.size	mpi_deinit, .-mpi_deinit
	.global	mpi_obj_idr
	.global	mpi_alloc_list
	.global	mpi_buf_pool_list
	.global	mpi_buf_list
	.global	mpi_node_list
	.global	mpi_dev_list
	.global	mpi_obj_lock
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36209, %object
	.size	__func__.36209, 19
__func__.36209:
	.ascii	"mpi_obj_referenced\000"
	.space	1
	.type	names.36149, %object
	.size	names.36149, 32
names.36149:
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.type	__func__.36239, %object
	.size	__func__.36239, 14
__func__.36239:
	.ascii	"mpi_obj_unref\000"
	.type	__func__.36176, %object
	.size	__func__.36176, 17
__func__.36176:
	.ascii	"mpi_obj_register\000"
	.type	__func__.36196, %object
	.size	__func__.36196, 19
__func__.36196:
	.ascii	"mpi_obj_unregister\000"
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpi_dev_list, %object
	.size	mpi_dev_list, 8
mpi_dev_list:
	.word	mpi_dev_list
	.word	mpi_dev_list
	.type	mpi_alloc_list, %object
	.size	mpi_alloc_list, 8
mpi_alloc_list:
	.word	mpi_alloc_list
	.word	mpi_alloc_list
	.type	mpi_node_list, %object
	.size	mpi_node_list, 8
mpi_node_list:
	.word	mpi_node_list
	.word	mpi_node_list
	.type	mpi_buf_list, %object
	.size	mpi_buf_list, 8
mpi_buf_list:
	.word	mpi_buf_list
	.word	mpi_buf_list
	.type	mpi_buf_pool_list, %object
	.size	mpi_buf_pool_list, 8
mpi_buf_pool_list:
	.word	mpi_buf_pool_list
	.word	mpi_buf_pool_list
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__key.13574, %object
	.size	__key.13574, 0
__key.13574:
	.type	mpi_obj_idr, %object
	.size	mpi_obj_idr, 4096
mpi_obj_idr:
	.space	4096
	.type	mpi_obj_lock, %object
	.size	mpi_obj_lock, 0
mpi_obj_lock:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s(%d) ref from %d\000"
.LC1:
	.ascii	"\033[1;31mmpi buf multiple unref buf id = %d\033[0m"
	.ascii	"\000"
.LC2:
	.ascii	"%s(%d) unref from %d\000"
.LC3:
	.ascii	"&x->wait\000"
.LC4:
	.ascii	"%s(%d|%p) registered\000"
.LC5:
	.ascii	"%s(%d) unregistered\000"
.LC6:
	.ascii	"%s(%d) freed\000"
.LC7:
	.ascii	"vlog\000"
.LC8:
	.ascii	"dev\000"
.LC9:
	.ascii	"node\000"
.LC10:
	.ascii	"job\000"
.LC11:
	.ascii	"job_pool\000"
.LC12:
	.ascii	"buf\000"
.LC13:
	.ascii	"buf_pool\000"
.LC14:
	.ascii	"queue\000"
.LC15:
	.ascii	"alloc\000"
	.section	___ksymtab_gpl+mpi_alloc_list,"a"
	.align	2
	.type	__ksymtab_mpi_alloc_list, %object
	.size	__ksymtab_mpi_alloc_list, 12
__ksymtab_mpi_alloc_list:
	.word	mpi_alloc_list
	.word	__kstrtab_mpi_alloc_list
	.word	__kstrtabns_mpi_alloc_list
	.section	___ksymtab_gpl+mpi_allocator_find_by_name,"a"
	.align	2
	.type	__ksymtab_mpi_allocator_find_by_name, %object
	.size	__ksymtab_mpi_allocator_find_by_name, 12
__ksymtab_mpi_allocator_find_by_name:
	.word	mpi_allocator_find_by_name
	.word	__kstrtab_mpi_allocator_find_by_name
	.word	__kstrtabns_mpi_allocator_find_by_name
	.section	___ksymtab_gpl+mpi_buf_list,"a"
	.align	2
	.type	__ksymtab_mpi_buf_list, %object
	.size	__ksymtab_mpi_buf_list, 12
__ksymtab_mpi_buf_list:
	.word	mpi_buf_list
	.word	__kstrtab_mpi_buf_list
	.word	__kstrtabns_mpi_buf_list
	.section	___ksymtab_gpl+mpi_buf_pool_list,"a"
	.align	2
	.type	__ksymtab_mpi_buf_pool_list, %object
	.size	__ksymtab_mpi_buf_pool_list, 12
__ksymtab_mpi_buf_pool_list:
	.word	mpi_buf_pool_list
	.word	__kstrtab_mpi_buf_pool_list
	.word	__kstrtabns_mpi_buf_pool_list
	.section	___ksymtab_gpl+mpi_dev_find_by_name,"a"
	.align	2
	.type	__ksymtab_mpi_dev_find_by_name, %object
	.size	__ksymtab_mpi_dev_find_by_name, 12
__ksymtab_mpi_dev_find_by_name:
	.word	mpi_dev_find_by_name
	.word	__kstrtab_mpi_dev_find_by_name
	.word	__kstrtabns_mpi_dev_find_by_name
	.section	___ksymtab_gpl+mpi_dev_list,"a"
	.align	2
	.type	__ksymtab_mpi_dev_list, %object
	.size	__ksymtab_mpi_dev_list, 12
__ksymtab_mpi_dev_list:
	.word	mpi_dev_list
	.word	__kstrtab_mpi_dev_list
	.word	__kstrtabns_mpi_dev_list
	.section	___ksymtab_gpl+mpi_node_list,"a"
	.align	2
	.type	__ksymtab_mpi_node_list, %object
	.size	__ksymtab_mpi_node_list, 12
__ksymtab_mpi_node_list:
	.word	mpi_node_list
	.word	__kstrtab_mpi_node_list
	.word	__kstrtabns_mpi_node_list
	.section	___ksymtab_gpl+mpi_obj_from_id,"a"
	.align	2
	.type	__ksymtab_mpi_obj_from_id, %object
	.size	__ksymtab_mpi_obj_from_id, 12
__ksymtab_mpi_obj_from_id:
	.word	mpi_obj_from_id
	.word	__kstrtab_mpi_obj_from_id
	.word	__kstrtabns_mpi_obj_from_id
	.section	___ksymtab_gpl+mpi_obj_lock,"a"
	.align	2
	.type	__ksymtab_mpi_obj_lock, %object
	.size	__ksymtab_mpi_obj_lock, 12
__ksymtab_mpi_obj_lock:
	.word	mpi_obj_lock
	.word	__kstrtab_mpi_obj_lock
	.word	__kstrtabns_mpi_obj_lock
	.section	___ksymtab_gpl+mpi_obj_ref,"a"
	.align	2
	.type	__ksymtab_mpi_obj_ref, %object
	.size	__ksymtab_mpi_obj_ref, 12
__ksymtab_mpi_obj_ref:
	.word	mpi_obj_ref
	.word	__kstrtab_mpi_obj_ref
	.word	__kstrtabns_mpi_obj_ref
	.section	___ksymtab_gpl+mpi_obj_unref,"a"
	.align	2
	.type	__ksymtab_mpi_obj_unref, %object
	.size	__ksymtab_mpi_obj_unref, 12
__ksymtab_mpi_obj_unref:
	.word	mpi_obj_unref
	.word	__kstrtab_mpi_obj_unref
	.word	__kstrtabns_mpi_obj_unref
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
