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
	.file	"valloc_rk_heap.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_free_all_cma:					
	.asciz 	"free_all_cma"					
__kstrtabns_free_all_cma:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_used_callback:					
	.asciz 	"mpi_buf_used_callback"					
__kstrtabns_mpi_buf_used_callback:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_buf_check_callback:					
	.asciz 	"mpi_buf_check_callback"					
__kstrtabns_mpi_buf_check_callback:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_buf_released_callback:					
	.asciz 	"buf_released_callback"					
__kstrtabns_buf_released_callback:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mpi_buf_refcnt:					
	.asciz 	"get_mpi_buf_refcnt"					
__kstrtabns_get_mpi_buf_refcnt:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mpi_buf_id:					
	.asciz 	"get_mpi_buf_id"					
__kstrtabns_get_mpi_buf_id:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mpi_buf_from_id:					
	.asciz 	"get_mpi_buf_from_id"					
__kstrtabns_get_mpi_buf_from_id:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_check_mpi_id_valid:					
	.asciz 	"check_mpi_id_valid"					
__kstrtabns_check_mpi_id_valid:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_dma_buf_phy_addr:					
	.asciz 	"get_dma_buf_phy_addr"					
__kstrtabns_get_dma_buf_phy_addr:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	mpi_buf_used_callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_used_callback, %function
mpi_buf_used_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	mpi_buf_used_callback, .-mpi_buf_used_callback
	.align	1
	.global	mpi_buf_check_callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_check_callback, %function
mpi_buf_check_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpi_buf_check_callback, .-mpi_buf_check_callback
	.align	1
	.global	get_mpi_buf_refcnt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_refcnt, %function
get_mpi_buf_refcnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #44]
	bx	lr
	.fnend
	.size	get_mpi_buf_refcnt, .-get_mpi_buf_refcnt
	.align	1
	.global	get_mpi_buf_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_id, %function
get_mpi_buf_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0]
	bx	lr
	.fnend
	.size	get_mpi_buf_id, .-get_mpi_buf_id
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	early_dma_heap_cma, %function
early_dma_heap_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	str	r0, [sp, #4]
	cbnz	r0, .L6
	ldr	r0, .L9
	bl	printk
	mvn	r0, #21
.L5:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L6:
	add	r1, sp, #4
	ldr	r4, .L9+4
	bl	memparse
	str	r0, [r4]
	ldr	r0, [sp, #4]
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #64
	bne	.L8
	add	r1, sp, #4
	adds	r0, r0, #1
	bl	memparse
	str	r0, [r4, #4]
.L8:
	movs	r0, #0
	b	.L5
.L10:
	.align	2
.L9:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	early_dma_heap_cma, .-early_dma_heap_cma
	.text
	.align	1
	.global	buf_released_callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	buf_released_callback, %function
buf_released_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L12
	ldr	r1, [r0]
	mov	r0, r4
	bl	rkos_wait_event
	mov	r0, r4
	bl	rkos_wakeup
	mov	r1, r5
	ldr	r0, [r4, #16]
	bl	mpi_queue_push_obj
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, pc}
.L13:
	.align	2
.L12:
	.word	g_valloc_dev+252
	.fnend
	.size	buf_released_callback, .-buf_released_callback
	.align	1
	.global	get_mpi_buf_from_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_from_id, %function
get_mpi_buf_from_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #4
	b	mpi_obj_from_id
	.fnend
	.size	get_mpi_buf_from_id, .-get_mpi_buf_from_id
	.align	1
	.global	check_mpi_id_valid
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_mpi_id_valid, %function
check_mpi_id_valid:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #4
	b	mpi_obj_from_id
	.fnend
	.size	check_mpi_id_valid, .-check_mpi_id_valid
	.align	1
	.global	get_dma_buf_phy_addr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_dma_buf_phy_addr, %function
get_dma_buf_phy_addr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r8, r0
	ldr	r3, [r3, #228]
	ldr	r1, [r3, #48]
	bl	dma_buf_attach
	cmn	r0, #4096
	mov	r6, r0
	bls	.L17
	movs	r3, #185
	movs	r0, #1
	ldr	r2, .L22+4
	movs	r1, #2
	strd	r3, r0, [sp]
	ldr	r3, .L22+8
	bl	vlog
	mov	r0, r6
.L16:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L17:
	movs	r1, #0
	bl	dma_buf_map_attachment
	cmn	r0, #4096
	mov	r5, r0
	bls	.L19
	movs	r3, #190
	movs	r0, #1
	ldr	r2, .L22+12
	movs	r1, #2
	strd	r3, r0, [sp]
	ldr	r3, .L22+8
	bl	vlog
	mov	r0, r5
	b	.L16
.L19:
	ldr	r0, [r0]
	movs	r7, #0
	ldr	r9, .L22+16
	ldr	r10, .L22+20
.L20:
	ldr	r3, [r5, #8]
	cmp	r3, r7
	bhi	.L21
	movs	r2, #0
	mov	r1, r5
	mov	r0, r6
	bl	dma_buf_unmap_attachment
	mov	r0, r8
	mov	r1, r6
	bl	dma_buf_detach
	mov	r0, r4
	b	.L16
.L21:
	ldr	r4, [r0]
	adds	r7, r7, #1
	ldr	r3, [r9]
	bic	r4, r4, #3
	ldr	r2, [r0, #4]
	subs	r4, r4, r3
	ldr	r3, [r10]
	add	r4, r3, r4, asr #5
	add	r4, r2, r4, lsl #12
	bl	sg_next
	b	.L20
.L23:
	.align	2
.L22:
	.word	g_valloc_dev
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.word	mem_map
	.word	__pv_phys_pfn_offset
	.fnend
	.size	get_dma_buf_phy_addr, .-get_dma_buf_phy_addr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_thread_fn, %function
valloc_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	adds	r7, r0, #4
	mov	r5, r0
.L27:
	bl	kthread_should_stop
	cbz	r0, .L28
.L26:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L28:
	ldr	r6, [r5, #20]
	cmp	r6, #0
	bne	.L26
	mov	r0, r7
	bl	down
	ldr	r0, [r5, #24]
	bl	mpi_queue_pop_obj
	mov	r4, r0
	cmp	r0, #0
	beq	.L27
	ldr	r1, [r0, #656]
	ldr	r0, [r0, #484]
	bl	dma_buf_vunmap
	str	r6, [r4, #656]
	mov	r0, r4
	bl	mpi_obj_unref
	b	.L27
	.fnend
	.size	valloc_thread_fn, .-valloc_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_alloc, %function
dma_buf_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L40
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r2
	ldr	r5, [r3, #8]
	.pad #20
	sub	sp, sp, #20
	cmp	r5, #0
	beq	.L31
	ldr	r3, .L40+4
	ldr	r4, [r3, #244]
	cbnz	r4, .L36
	str	r2, [sp, #4]
	mov	r3, #270
	ldr	r2, .L40+8
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #1
	ldr	r3, .L40+12
	movs	r6, #4
	bl	vlog
	ldr	r8, .L40+24
	ldr	r9, .L40+28
.L33:
	subs	r6, r6, #1
	bne	.L35
	cmn	r4, #4096
	bls	.L34
	movw	r3, #281
	str	r7, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L40+12
	movs	r0, #1
	ldr	r2, .L40+16
	bl	vlog
.L36:
	movs	r5, #0
	b	.L31
.L35:
	str	r8, [sp]
	movs	r3, #0
	mov	r2, r9
	mov	r1, r7
	mov	r0, r5
	bl	rk_dma_heap_buffer_alloc
	cmn	r0, #4096
	mov	r4, r0
	bls	.L34
	movs	r0, #10
	bl	rkos_msleep
	b	.L33
.L34:
	ldr	r3, [r4, #4]
	movs	r1, #5
	ldr	r2, .L40+20
	movs	r0, #1
	mov	r5, r4
	ldr	r3, [r3, #28]
	str	r3, [sp, #12]
	ldr	r3, [r4]
	strd	r4, r3, [sp, #4]
	mov	r3, #284
	str	r3, [sp]
	ldr	r3, .L40+12
	bl	vlog
.L31:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	g_valloc_dev
	.word	.LC3
	.word	.LANCHOR1+21
	.word	.LC5
	.word	.LC6
	.word	.LC4
	.word	524290
	.fnend
	.size	dma_buf_alloc, .-dma_buf_alloc
	.align	1
	.global	free_all_cma
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	free_all_cma, %function
free_all_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r5, .L47
	ldr	r3, [r5, #4]
	cbz	r3, .L42
	ldr	r3, [r5]
	cmp	r3, #65536
	bls	.L42
	ldr	r0, .L47+4
	bl	printk
	ldr	r0, .L47+8
	bl	printk
	ldr	r4, [r5]
	ldr	r0, [r5, #4]
	sub	r4, r4, #65536
	add	r0, r0, #65536
	lsrs	r4, r4, #12
	lsrs	r0, r0, #12
	mov	r1, r4
	bl	free_contig_range
	ldr	r3, .L47+12
	pld	[r3]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, r4
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L47+16
	movs	r2, #1
	str	r2, [r3, #244]
.L42:
	pop	{r3, r4, r5, pc}
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	.LC7
	.word	.LC8
	.word	_totalram_pages
	.word	g_valloc_dev
	.fnend
	.size	free_all_cma, .-free_all_cma
	.align	1
	.global	valloc_mmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mmap, %function
valloc_mmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #484]
	cbz	r0, .L49
	bl	get_dma_buf_phy_addr
	str	r0, [r4, #660]
	ldr	r0, [r4, #484]
	bl	dma_buf_vmap
	str	r0, [r4, #656]
.L49:
	pop	{r4, pc}
	.fnend
	.size	valloc_mmap, .-valloc_mmap
	.align	1
	.global	valloc_munmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_munmap, %function
valloc_munmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r5, r0
	ldr	r1, [r0, #656]
	cbz	r1, .L54
	ldr	r0, [r0, #484]
	cbz	r0, .L54
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r4, [r3, #4]
	bic	r4, r4, #-16777216
	bic	r4, r4, #255
	cbnz	r4, .L56
	bl	dma_buf_vunmap
	str	r4, [r5, #656]
.L54:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L56:
	movs	r1, #0
	mov	r0, r1
	bl	mpi_buf_create
	mov	r4, r0
	cbnz	r0, .L57
	movs	r3, #101
	str	r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L65
	movs	r0, #1
	ldr	r2, .L65+4
	bl	vlog
	b	.L54
.L57:
	ldr	r3, [r5, #484]
	str	r3, [r0, #484]
	ldr	r3, [r3, #4]
	add	r2, r3, #28
	pld	[r2]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, .L65+8
	mov	r1, r4
	ldr	r3, [r5, #656]
	ldr	r0, [r7, #32]
	str	r3, [r4, #656]
	bl	mpi_queue_push_obj
	mov	r6, r0
	cbnz	r0, .L58
	str	r5, [sp, #4]
	movs	r3, #108
	ldr	r2, .L65+4
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #1
	ldr	r3, .L65
	bl	vlog
	str	r6, [r4, #656]
	str	r6, [r4, #484]
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	mpi_obj_unref
.L58:
	add	r0, r7, #12
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	up
.L66:
	.align	2
.L65:
	.word	.LANCHOR1+35
	.word	.LC9
	.word	.LANCHOR0
	.fnend
	.size	valloc_munmap, .-valloc_munmap
	.align	1
	.global	dma_buf_alloc_by_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_alloc_by_id, %function
dma_buf_alloc_by_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	dma_buf_alloc_by_id, .-dma_buf_alloc_by_id
	.align	1
	.global	valloc_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_probe, %function
valloc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r2, #272
	ldr	r5, .L72
	movs	r1, #0
	.pad #20
	sub	sp, sp, #20
	mov	r7, r0
	ldr	r4, .L72+4
	mov	r0, r5
	bl	memset
	ldr	r0, .L72+8
	bl	rk_dma_heap_find
	str	r0, [r4, #8]
	cbnz	r0, .L69
	movw	r3, #313
	ldr	r2, .L72+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L72+16
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L68:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L69:
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L72+20
	movs	r0, #1
	movs	r6, #0
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]
	str	r3, [sp, #4]
	mov	r3, #316
	str	r3, [sp]
	ldr	r3, .L72+16
	bl	vlog
	ldr	r3, .L72+24
	mov	r1, #3264
	mov	r0, r7
	str	r6, [r5, #244]
	str	r3, [r5, #92]
	bl	kstrdup
	mov	r2, r7
	movs	r1, #8
	mov	r3, r0
	mov	r0, r5
	str	r3, [r0], #4
	bl	mpi_allocator_register
	str	r5, [r5, #232]
	mov	r2, r7
	movs	r1, #8
	add	r0, r5, #96
	bl	mpi_dev_register
	mov	r2, r6
	ldr	r1, .L72+28
	add	r0, r5, #96
	bl	mpi_sysfs_dev_add
	ldr	r3, [r5, #228]
	ldr	r0, [r3, #48]
	bl	rk_dma_heap_set_dev
	ldr	r2, .L72+32
	movs	r1, #4
	movs	r0, #64
	bl	mpi_queue_create
	ldr	r2, .L72+32
	movs	r1, #4
	str	r0, [r4, #32]
	movs	r0, #64
	bl	mpi_queue_create
	add	r3, r4, #16
	mov	r2, #-1
	strd	r3, r3, [r4, #16]
	add	r1, r4, #8
	ldr	r3, .L72+36
	str	r6, [r4, #12]
	str	r0, [r5, #268]
	ldr	r0, .L72+40
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L71
	bl	wake_up_process
.L71:
	ldr	r0, .L72+44
	str	r5, [r4, #24]
	bl	rkos_wait_init
	movs	r0, #0
	b	.L68
.L73:
	.align	2
.L72:
	.word	g_valloc_dev
	.word	.LANCHOR0
	.word	.LC10
	.word	.LC11
	.word	.LANCHOR1+49
	.word	.LC12
	.word	dma_buf_alloc
	.word	valloc_driver_fops
	.word	mpi_obj_unref
	.word	.LC13
	.word	valloc_thread_fn
	.word	g_valloc_dev+252
	.fnend
	.size	valloc_probe, .-valloc_probe
	.align	1
	.global	valloc_unload
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_unload, %function
valloc_unload:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L75
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	add	r0, r4, #156
	bl	rkos_wait_destory
	sub	r0, r4, #92
	bl	mpi_allocator_unregister
	ldr	r0, [r4, #-96]
	bl	kfree
	movs	r0, #0
	pop	{r4, pc}
.L76:
	.align	2
.L75:
	.word	g_valloc_dev+96
	.fnend
	.size	valloc_unload, .-valloc_unload
	.global	g_valloc_dev_rk_heap
	.section	.rodata
	.set	.LANCHOR1,. + 0
	.type	__func__.36438, %object
	.size	__func__.36438, 21
__func__.36438:
	.ascii	"get_dma_buf_phy_addr\000"
	.type	__func__.36460, %object
	.size	__func__.36460, 14
__func__.36460:
	.ascii	"dma_buf_alloc\000"
	.type	__func__.36352, %object
	.size	__func__.36352, 14
__func__.36352:
	.ascii	"valloc_munmap\000"
	.type	__func__.36471, %object
	.size	__func__.36471, 13
__func__.36471:
	.ascii	"valloc_probe\000"
	.type	__param_str_rk_dma_heap_base, %object
	.size	__param_str_rk_dma_heap_base, 24
__param_str_rk_dma_heap_base:
	.ascii	"rockit.rk_dma_heap_base\000"
	.type	__param_str_rk_dma_heap_size, %object
	.size	__param_str_rk_dma_heap_size, 24
__param_str_rk_dma_heap_size:
	.ascii	"rockit.rk_dma_heap_size\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rk_dma_heap_size, %object
	.size	rk_dma_heap_size, 4
rk_dma_heap_size:
	.space	4
	.type	rk_dma_heap_base, %object
	.size	rk_dma_heap_base, 4
rk_dma_heap_base:
	.space	4
	.type	g_valloc_dev_rk_heap, %object
	.size	g_valloc_dev_rk_heap, 28
g_valloc_dev_rk_heap:
	.space	28
	.section	.init.rodata,"a"
	.type	__setup_str_early_dma_heap_cma, %object
	.size	__setup_str_early_dma_heap_cma, 16
__setup_str_early_dma_heap_cma:
	.ascii	"rk_dma_heap_cma\000"
	.section	.init.setup,"aw"
	.align	2
	.type	__setup_early_dma_heap_cma, %object
	.size	__setup_early_dma_heap_cma, 12
__setup_early_dma_heap_cma:
	.word	__setup_str_early_dma_heap_cma
	.word	early_dma_heap_cma
	.word	0
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_rk_dma_heap_basetype227, %object
	.size	__UNIQUE_ID_rk_dma_heap_basetype227, 38
__UNIQUE_ID_rk_dma_heap_basetype227:
	.ascii	"rockit.parmtype=rk_dma_heap_base:uint\000"
	.type	__UNIQUE_ID_rk_dma_heap_sizetype226, %object
	.size	__UNIQUE_ID_rk_dma_heap_sizetype226, 38
__UNIQUE_ID_rk_dma_heap_sizetype226:
	.ascii	"rockit.parmtype=rk_dma_heap_size:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013Config string not provided\012\000"
.LC1:
	.ascii	"\033[1;31mattach fail = %d\033[0m\000"
.LC2:
	.ascii	"\033[1;31mmap fail = %d\033[0m\000"
.LC3:
	.ascii	"alloc(%d)\000"
.LC4:
	.ascii	"vmpi\000"
.LC5:
	.ascii	"\033[1;31malloc(%d) fail\033[0m\000"
.LC6:
	.ascii	"cma buf = %p, size = %d, refcnt = %d\000"
.LC7:
	.ascii	"please make sure all rockit is closed\000"
.LC8:
	.ascii	"please reset system if want use rockit once more\000"
.LC9:
	.ascii	"\033[1;31mbuf = %x, not unmap\033[0m\000"
.LC10:
	.ascii	"rk-dma-heap-cma\000"
.LC11:
	.ascii	"\033[1;31mvalloc get rk_dma_heap fail\033[0m\000"
.LC12:
	.ascii	"\033[1;32mrk dma heap addr = %08x size = %d\033[0m\000"
.LC13:
	.ascii	"valloc\000"
	.section	___ksymtab_gpl+buf_released_callback,"a"
	.align	2
	.type	__ksymtab_buf_released_callback, %object
	.size	__ksymtab_buf_released_callback, 12
__ksymtab_buf_released_callback:
	.word	buf_released_callback
	.word	__kstrtab_buf_released_callback
	.word	__kstrtabns_buf_released_callback
	.section	___ksymtab_gpl+check_mpi_id_valid,"a"
	.align	2
	.type	__ksymtab_check_mpi_id_valid, %object
	.size	__ksymtab_check_mpi_id_valid, 12
__ksymtab_check_mpi_id_valid:
	.word	check_mpi_id_valid
	.word	__kstrtab_check_mpi_id_valid
	.word	__kstrtabns_check_mpi_id_valid
	.section	___ksymtab_gpl+free_all_cma,"a"
	.align	2
	.type	__ksymtab_free_all_cma, %object
	.size	__ksymtab_free_all_cma, 12
__ksymtab_free_all_cma:
	.word	free_all_cma
	.word	__kstrtab_free_all_cma
	.word	__kstrtabns_free_all_cma
	.section	___ksymtab_gpl+get_dma_buf_phy_addr,"a"
	.align	2
	.type	__ksymtab_get_dma_buf_phy_addr, %object
	.size	__ksymtab_get_dma_buf_phy_addr, 12
__ksymtab_get_dma_buf_phy_addr:
	.word	get_dma_buf_phy_addr
	.word	__kstrtab_get_dma_buf_phy_addr
	.word	__kstrtabns_get_dma_buf_phy_addr
	.section	___ksymtab_gpl+get_mpi_buf_from_id,"a"
	.align	2
	.type	__ksymtab_get_mpi_buf_from_id, %object
	.size	__ksymtab_get_mpi_buf_from_id, 12
__ksymtab_get_mpi_buf_from_id:
	.word	get_mpi_buf_from_id
	.word	__kstrtab_get_mpi_buf_from_id
	.word	__kstrtabns_get_mpi_buf_from_id
	.section	___ksymtab_gpl+get_mpi_buf_id,"a"
	.align	2
	.type	__ksymtab_get_mpi_buf_id, %object
	.size	__ksymtab_get_mpi_buf_id, 12
__ksymtab_get_mpi_buf_id:
	.word	get_mpi_buf_id
	.word	__kstrtab_get_mpi_buf_id
	.word	__kstrtabns_get_mpi_buf_id
	.section	___ksymtab_gpl+get_mpi_buf_refcnt,"a"
	.align	2
	.type	__ksymtab_get_mpi_buf_refcnt, %object
	.size	__ksymtab_get_mpi_buf_refcnt, 12
__ksymtab_get_mpi_buf_refcnt:
	.word	get_mpi_buf_refcnt
	.word	__kstrtab_get_mpi_buf_refcnt
	.word	__kstrtabns_get_mpi_buf_refcnt
	.section	___ksymtab_gpl+mpi_buf_check_callback,"a"
	.align	2
	.type	__ksymtab_mpi_buf_check_callback, %object
	.size	__ksymtab_mpi_buf_check_callback, 12
__ksymtab_mpi_buf_check_callback:
	.word	mpi_buf_check_callback
	.word	__kstrtab_mpi_buf_check_callback
	.word	__kstrtabns_mpi_buf_check_callback
	.section	___ksymtab_gpl+mpi_buf_used_callback,"a"
	.align	2
	.type	__ksymtab_mpi_buf_used_callback, %object
	.size	__ksymtab_mpi_buf_used_callback, 12
__ksymtab_mpi_buf_used_callback:
	.word	mpi_buf_used_callback
	.word	__kstrtab_mpi_buf_used_callback
	.word	__kstrtabns_mpi_buf_used_callback
	.section	__param,"a"
	.align	2
	.type	__param_rk_dma_heap_base, %object
	.size	__param_rk_dma_heap_base, 20
__param_rk_dma_heap_base:
	.word	__param_str_rk_dma_heap_base
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_dma_heap_base
	.type	__param_rk_dma_heap_size, %object
	.size	__param_rk_dma_heap_size, 20
__param_rk_dma_heap_size:
	.word	__param_str_rk_dma_heap_size
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	rk_dma_heap_size
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
