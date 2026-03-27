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
	.file	"valloc.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mpi_buf:					
	.asciz 	"get_mpi_buf"					
__kstrtabns_get_mpi_buf:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_create_mpi_buf_with_external_fd:					
	.asciz 	"create_mpi_buf_with_external_fd"					
__kstrtabns_create_mpi_buf_with_external_fd:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_create_mpi_buf_with_external_id:					
	.asciz 	"create_mpi_buf_with_external_id"					
__kstrtabns_create_mpi_buf_with_external_id:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	get_mpi_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf, %function
get_mpi_buf:
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
	ldr	r2, .L2
	ldr	r0, [r2, r0, lsl #2]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
.L3:
	.align	2
.L2:
	.word	dma_buf_fd_idr
	.fnend
	.size	get_mpi_buf, .-get_mpi_buf
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_compat_ioctl, %function
valloc_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	valloc_compat_ioctl, .-valloc_compat_ioctl
	.align	1
	.global	create_mpi_buf_with_external_fd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	create_mpi_buf_with_external_fd, %function
create_mpi_buf_with_external_fd:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movs	r4, #36
	.pad #44
	sub	sp, sp, #44
	mov	r5, r0
	mov	r2, r4
	movs	r1, #0
	add	r0, sp, #4
	bl	memset
	ldr	r1, .L8
	movs	r0, #1
	add	r2, sp, #4
	strd	r5, r4, [sp, #12]
	bl	vmpi_ioctl
	cmp	r0, #0
	blt	.L7
	ldr	r0, [sp, #8]
	bl	get_mpi_buf_from_id
.L5:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, pc}
.L7:
	movs	r0, #0
	b	.L5
.L9:
	.align	2
.L8:
	.word	-1071357694
	.fnend
	.size	create_mpi_buf_with_external_fd, .-create_mpi_buf_with_external_fd
	.align	1
	.global	create_mpi_buf_with_external_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	create_mpi_buf_with_external_id, %function
create_mpi_buf_with_external_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	movs	r4, #36
	.pad #44
	sub	sp, sp, #44
	mov	r5, r0
	mov	r2, r4
	movs	r1, #0
	add	r0, sp, #4
	bl	memset
	ldr	r1, .L13
	movs	r0, #1
	add	r2, sp, #4
	str	r5, [sp, #8]
	str	r4, [sp, #16]
	bl	vmpi_ioctl
	cmp	r0, #0
	blt	.L12
	ldr	r0, [sp, #8]
	bl	get_mpi_buf_from_id
.L10:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, pc}
.L12:
	movs	r0, #0
	b	.L10
.L14:
	.align	2
.L13:
	.word	-1071357694
	.fnend
	.size	create_mpi_buf_with_external_id, .-create_mpi_buf_with_external_id
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_create, %function
valloc_mb_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r2, [r3]
	mov	r7, r1
	ldr	r9, [r0, #128]
	mov	r8, r3
	str	r2, [sp, #52]
	ldr	r2, [r1, #12]	@ unaligned
	cmp	r2, #36
	beq	.L16
	mov	r3, #282
	ldr	r2, .L32+4
	str	r3, [sp]
	ldr	r3, .L32+8
.L31:
	movs	r1, #2
	movs	r0, #1
	bl	vlog
	b	.L30
.L16:
	ldr	r0, [r1, #4]	@ unaligned
	cbz	r0, .L18
	bl	check_mpi_id_valid
	cmp	r0, #0
	bne	.L25
	ldr	r2, [r7, #16]	@ unaligned
	ldr	r1, [r7, #20]	@ unaligned
	ldr	r0, [r7, #4]	@ unaligned
	bl	dma_buf_alloc_by_id
	mov	r4, r0
.L19:
	ldr	r0, [r7, #8]	@ unaligned
	cmp	r0, #0
	ble	.L20
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r4, r0
	bls	.L20
	ldr	r3, [r7, #8]	@ unaligned
	movs	r1, #3
	ldr	r2, .L32+12
	movs	r0, #1
	movs	r4, #0
	str	r3, [sp, #4]
	movw	r3, #303
	str	r3, [sp]
	ldr	r3, .L32+8
	bl	vlog
.L20:
	movs	r1, #0
	mov	r0, r4
	bl	mpi_buf_create
	mov	r6, r0
	cbnz	r0, .L21
	movw	r3, #309
	ldr	r2, .L32+16
	str	r3, [sp]
	ldr	r3, .L32+8
	b	.L31
.L18:
	ldr	r2, [r1, #16]	@ unaligned
	cbz	r2, .L26
	ldr	r1, [r1, #20]	@ unaligned
	ldr	r0, .L32+20
	bl	mpi_allocator_alloc
	mov	r4, r0
	cmp	r0, #0
	bne	.L19
	ldr	r3, [r7, #16]	@ unaligned
	movs	r1, #2
	ldr	r2, .L32+24
	movs	r0, #1
	str	r3, [sp, #4]
	movw	r3, #295
	str	r3, [sp]
	ldr	r3, .L32+8
	bl	vlog
.L30:
	mov	r0, #-1
.L15:
	ldr	r2, [sp, #52]
	ldr	r3, [r8]
	cmp	r2, r3
	beq	.L24
	bl	__stack_chk_fail
.L26:
	mov	r4, r2
	b	.L19
.L21:
	bl	get_mpi_buf_id
	cmp	r0, #0
	str	r0, [r7, #4]	@ unaligned
	bge	.L22
	mov	r0, r6
	bl	mpi_obj_unref
	b	.L30
.L22:
	ldr	r3, .L32+28
	adds	r5, r6, #4
	ldr	r2, .L32+32
	movs	r1, #32
	add	r0, sp, #20
	str	r3, [r6, #616]
	movs	r3, #1
	str	r3, [r6, #628]
	str	r3, [r6, #632]
	ldr	r3, .L32+36
	str	r2, [r6, #620]
	str	r3, [r6, #624]
	bl	rkos_kthread_get_name
	movs	r2, #32
	movs	r1, #0
	mov	r0, r5
	bl	memset
	add	r0, sp, #20
	bl	strlen
	mov	r2, r0
	add	r1, sp, #20
	mov	r0, r5
	bl	memcpy
	cbz	r4, .L23
	mov	r0, r4
	bl	dma_buf_put
.L23:
	ldr	r3, [r7, #4]	@ unaligned
	movs	r1, #5
	ldr	r2, .L32+40
	movs	r0, #1
	str	r3, [sp, #4]
	mov	r3, #324
	str	r3, [sp]
	ldr	r3, .L32+8
	bl	vlog
	ldr	r3, [r9, #4]
	add	r2, r6, #80
	str	r2, [r9, #4]
	movs	r1, #5
	movs	r0, #1
	strd	r9, r3, [r6, #80]
	str	r2, [r3]
	ldr	r3, [r6, #76]
	ldr	r2, .L32+44
	str	r3, [sp, #8]
	ldr	r3, [r6, #72]
	str	r3, [sp, #4]
	mov	r3, #326
	str	r3, [sp]
	ldr	r3, .L32+8
	bl	vlog
.L25:
	movs	r0, #0
	b	.L15
.L24:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L33:
	.align	2
.L32:
	.word	__stack_chk_guard
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC2
	.word	.LC3
	.word	.LANCHOR1+4
	.word	.LC1
	.word	mpi_buf_released_callback
	.word	mpi_buf_used_callback
	.word	mpi_buf_check_callback
	.word	.LC4
	.word	.LC5
	.fnend
	.size	valloc_mb_create, .-valloc_mb_create
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_released_callback, %function
mpi_buf_released_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	buf_released_callback
	.fnend
	.size	mpi_buf_released_callback, .-mpi_buf_released_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_poll, %function
valloc_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r2, r1
	ldr	r4, .L38
	add	r1, r4, #252
	bl	rkos_poll_wait
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r4, #268]
	bl	mpi_queue_pop_obj
	cbz	r0, .L36
	bl	get_mpi_buf_id
	uxth	r0, r0
.L36:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, pc}
.L39:
	.align	2
.L38:
	.word	.LANCHOR1
	.fnend
	.size	valloc_poll, .-valloc_poll
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_read, %function
valloc_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #128]
	strd	r1, r2, [sp, #32]
	adds	r5, r5, #20
	mov	r0, r5
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r4, r0
	bne	.L41
	ldr	r3, .L74
	mov	r0, r5
	ldr	r2, .L74+4
	mov	r8, #0
	ldr	r1, .L74+8
	str	r3, [sp]
	ldr	r7, .L74+12
	ldr	r3, .L74+16
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	ldr	r1, .L74+20
	mov	r0, r5
	ldr	r9, .L74+60
	bl	mpi_fs_buf_add
	ldr	r1, .L74+24
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	subs	r4, r4, #72
.L42:
	add	r3, r4, #72
	cmp	r3, r7
	beq	.L58
	mov	r0, r4
	ldr	r10, [r4]
	bl	get_mpi_buf_id
	ldr	r2, [r4, #480]
	mov	r3, r0
	cmp	r2, #0
	beq	.L67
	ldr	r1, [r2]
.L43:
	ldr	r2, [r4, #484]
	ldr	r0, [r4, #44]
	cmp	r2, #0
	beq	.L68
	ldr	r2, [r2, #4]
	ldr	r6, [r2, #28]
.L44:
	ldr	r2, [r4, #652]
	cmp	r2, #0
	add	r2, r4, #4
	ite	ge
	ldrge	ip, [r4, #648]
	movlt	ip, #-1
	str	r2, [sp, #28]
	ldr	r2, [r4, #660]
	str	r2, [sp, #24]
	ldr	r2, [r4, #656]
	strd	r1, r0, [sp]
	mov	r0, r5
	strd	r6, ip, [sp, #8]
	strd	r4, r2, [sp, #16]
	mov	r2, r10
	ldr	r1, .L74+28
	bl	mpi_fs_buf_add
	mov	r6, r0
	cmp	r0, #0
	beq	.L46
.L58:
	mov	r2, r8
	ldr	r1, .L74+32
	mov	r0, r5
	ldr	r7, .L74+36
	bl	mpi_fs_buf_add
	ldr	r1, .L74+40
	mov	r0, r5
	ldr	r9, .L74+64
	bl	mpi_fs_buf_add
	ldr	r1, .L74+44
	mov	r0, r5
	ldr	r10, .L74+68
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	ldr	fp, .L74+48
	subs	r4, r4, #72
.L47:
	add	r3, r4, #72
	cmp	r3, r7
	beq	.L65
	ldr	r3, [r4, #44]
	adds	r1, r4, #4
	ldr	r2, [r4, #108]
	mov	r0, r5
	str	r1, [sp, #24]
	ldr	r1, [r4, #40]
	str	r1, [sp, #20]
	ldr	r1, [r4, #104]
	str	r1, [sp, #16]
	ldr	r1, [r4, #92]
	str	r1, [sp, #12]
	ldr	r1, [r4, #112]
	str	r3, [sp]
	strd	r2, r1, [sp, #4]
	mov	r1, r9
	ldr	r3, [r4, #80]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L59
.L65:
	ldr	r1, .L74+48
	mov	r0, r5
	bl	mpi_fs_buf_add
	mov	r0, r5
	ldrd	r1, r2, [sp, #32]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L67:
	mov	r1, #-1
	b	.L43
.L68:
	mov	r6, #-1
	b	.L44
.L46:
	ldr	fp, .L74+72
	add	r10, r4, #488
.L55:
	ldr	r3, [r10], #4
	subs	r2, r3, #1
	adds	r2, r2, #3
	bhi	.L49
	ldr	r2, [r9]
.L72:
	subs	r2, r2, #72
	add	r1, r2, #72
	cmp	r1, r9
	bne	.L52
	str	r6, [sp]
	mov	r2, fp
	ldr	r1, .L74+52
	mov	r0, r5
	bl	mpi_fs_buf_add
	cbz	r0, .L49
.L53:
	ldr	r1, .L74+48
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r3, [r4, #652]
	cmp	r3, #0
	ite	ge
	ldrge	r3, [r4, #648]
	movlt	r3, #0
	ldr	r4, [r4, #72]
	add	r8, r8, r3
	subs	r4, r4, #72
	b	.L42
.L52:
	cmp	r3, r2
	bne	.L51
	ldr	r2, [r3, #80]
	mov	r0, r5
	str	r6, [sp]
	ldr	r1, .L74+56
	ldr	r3, [r3]
	ldr	r2, [r2, #80]
	bl	mpi_fs_buf_add
.L49:
	adds	r6, r6, #1
	cmp	r6, #32
	bne	.L55
	b	.L53
.L51:
	ldr	r2, [r2, #72]
	b	.L72
.L59:
	mov	r8, r4
	ldr	r6, [r8, #124]!
.L73:
	subs	r6, r6, #100
	add	r3, r6, #100
	cmp	r3, r8
	beq	.L63
	ldr	r2, [r6, #80]
	mov	r1, r10
	ldr	r3, [r6]
	mov	r0, r5
	ldr	r2, [r2, #80]
	bl	mpi_fs_buf_add
	cbz	r0, .L61
.L63:
	mov	r1, fp
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L47
.L61:
	ldr	r6, [r6, #100]
	b	.L73
.L41:
	cbnz	r0, .L40
	mov	r0, r5
	bl	mpi_fs_buf_reset
.L40:
	mov	r0, r4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L75:
	.align	2
.L74:
	.word	.LC8
	.word	.LANCHOR1
	.word	.LC7
	.word	mpi_buf_list
	.word	.LC6
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	mpi_buf_pool_list
	.word	.LC13
	.word	.LC14
	.word	.LC18
	.word	.LC17
	.word	.LC15
	.word	mpi_node_list
	.word	.LC19
	.word	.LC20
	.word	.LC16
	.fnend
	.size	valloc_read, .-valloc_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_delete, %function
valloc_mb_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #36
	beq	.L77
	movw	r3, #341
	ldr	r2, .L84
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L84+4
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L76:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L77:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r4, r0
	cmp	r0, #0
	beq	.L76
	ldr	r3, [r0, #44]
	movs	r1, #5
	ldr	r2, .L84+8
	strd	r0, r3, [sp, #4]
	mov	r3, #346
	movs	r0, #1
	str	r3, [sp]
	ldr	r3, .L84+4
	bl	vlog
	ldrd	r2, r3, [r4, #80]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	mov	r2, #256
	strd	r2, r3, [r4, #80]
	ldr	r3, [r4, #480]
	cbz	r3, .L79
	movs	r2, #0
	str	r2, [r3, #104]
.L79:
	mov	r0, r4
	bl	mpi_obj_unref
	movs	r0, #0
	b	.L76
.L85:
	.align	2
.L84:
	.word	.LC0
	.word	.LANCHOR0+17
	.word	.LC21
	.fnend
	.size	valloc_mb_delete, .-valloc_mb_delete
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_dec_refcnt, %function
valloc_mb_dec_refcnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r6, [r0, #128]
	cmp	r3, #36
	beq	.L87
	movs	r3, #224
	ldr	r2, .L91
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L91+4
	movs	r0, #1
	bl	vlog
.L90:
	mov	r0, #-1
.L86:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L87:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r4, r0
	cbnz	r0, .L89
	ldr	r3, [r5, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L91+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #229
	str	r3, [sp]
	ldr	r3, .L91+4
	bl	vlog
	b	.L90
.L89:
	mov	r1, r0
	add	r0, r6, #8
	bl	mpi_list_del_obj_rcu
	mov	r0, r4
	bl	mpi_obj_unref
	movs	r0, #0
	b	.L86
.L92:
	.align	2
.L91:
	.word	.LC0
	.word	.LANCHOR0+34
	.word	.LC22
	.fnend
	.size	valloc_mb_dec_refcnt, .-valloc_mb_dec_refcnt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_add_refcnt, %function
valloc_mb_add_refcnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r6, [r0, #128]
	cmp	r3, #36
	beq	.L94
	movs	r3, #205
	ldr	r2, .L98
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L98+4
	movs	r0, #1
	bl	vlog
.L97:
	mov	r0, #-1
.L93:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L94:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r4, r0
	cbnz	r0, .L96
	ldr	r3, [r5, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L98+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #210
	str	r3, [sp]
	ldr	r3, .L98+4
	bl	vlog
	b	.L97
.L96:
	mov	r1, r0
	add	r0, r6, #8
	bl	mpi_list_add_tail_obj_rcu
	mov	r0, r4
	bl	mpi_obj_ref
	movs	r0, #0
	b	.L93
.L99:
	.align	2
.L98:
	.word	.LC0
	.word	.LANCHOR0+55
	.word	.LC22
	.fnend
	.size	valloc_mb_add_refcnt, .-valloc_mb_add_refcnt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_sync_cache, %function
valloc_mb_sync_cache:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #36
	beq	.L101
	movs	r3, #248
	ldr	r2, .L110
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L110+4
	movs	r0, #1
	bl	vlog
.L109:
	mov	r4, #-1
.L100:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L101:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r5, r0
	cbz	r0, .L103
	ldr	r0, [r0, #484]
	cbnz	r0, .L104
.L103:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L110+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #253
	str	r3, [sp]
	ldr	r3, .L110+4
	bl	vlog
	b	.L109
.L104:
	ldr	r4, [r4, #32]	@ unaligned
	cbz	r4, .L105
	movs	r1, #2
	movs	r4, #0
	bl	dma_buf_begin_cpu_access
	b	.L100
.L105:
	movs	r1, #1
	bl	dma_buf_begin_cpu_access
	movs	r1, #1
	ldr	r0, [r5, #484]
	bl	dma_buf_end_cpu_access
	b	.L100
.L111:
	.align	2
.L110:
	.word	.LC0
	.word	.LANCHOR0+76
	.word	.LC22
	.fnend
	.size	valloc_mb_sync_cache, .-valloc_mb_sync_cache
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_refcnt, %function
valloc_mb_get_refcnt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #36
	beq	.L113
	movs	r3, #187
	ldr	r2, .L117
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L117+4
	movs	r0, #1
	bl	vlog
.L116:
	mov	r0, #-1
.L112:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L113:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	cbnz	r0, .L115
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L117+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #192
	str	r3, [sp]
	ldr	r3, .L117+4
	bl	vlog
	b	.L116
.L115:
	bl	get_mpi_buf_refcnt
	str	r0, [r4, #28]	@ unaligned
	movs	r0, #0
	b	.L112
.L118:
	.align	2
.L117:
	.word	.LC0
	.word	.LANCHOR0+97
	.word	.LC22
	.fnend
	.size	valloc_mb_get_refcnt, .-valloc_mb_get_refcnt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_id, %function
valloc_mb_get_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #36
	beq	.L120
	movs	r3, #166
	ldr	r2, .L123
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L123+4
	movs	r0, #1
	bl	vlog
.L122:
	mov	r0, #-1
	b	.L119
.L120:
	ldr	r0, [r1, #8]	@ unaligned
	bl	get_mpi_buf
	cmp	r0, #0
	beq	.L122
	bl	get_mpi_buf_id
	str	r0, [r4, #4]	@ unaligned
	movs	r0, #0
.L119:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L124:
	.align	2
.L123:
	.word	.LC0
	.word	.LANCHOR0+118
	.fnend
	.size	valloc_mb_get_id, .-valloc_mb_get_id
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_phy_addr, %function
valloc_mb_get_phy_addr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #36
	beq	.L126
	movs	r3, #140
	ldr	r2, .L131
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L131+4
	movs	r0, #1
	bl	vlog
.L130:
	mov	r0, #-1
.L125:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L126:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r5, r0
	cbnz	r0, .L128
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L131+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #145
	str	r3, [sp]
	ldr	r3, .L131+4
	bl	vlog
	b	.L130
.L128:
	ldr	r3, [r0, #660]
	cbnz	r3, .L129
	ldr	r0, [r0, #484]
	bl	get_dma_buf_phy_addr
	str	r0, [r5, #660]
.L129:
	ldr	r3, [r5, #660]
	movs	r1, #5
	ldr	r2, [r4, #4]	@ unaligned
	movs	r0, #1
	str	r3, [r4, #24]	@ unaligned
	strd	r3, r2, [sp, #4]
	movs	r3, #151
	ldr	r2, .L131+12
	str	r3, [sp]
	ldr	r3, .L131+4
	bl	vlog
	movs	r0, #0
	b	.L125
.L132:
	.align	2
.L131:
	.word	.LC0
	.word	.LANCHOR0+135
	.word	.LC22
	.word	.LC23
	.fnend
	.size	valloc_mb_get_phy_addr, .-valloc_mb_get_phy_addr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_version, %function
valloc_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #48]	@ unaligned
	cmp	r3, #124
	beq	.L134
	movs	r3, #80
	ldr	r2, .L138
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L138+4
	movs	r0, #1
	bl	vlog
	mov	r0, #-1
.L133:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L134:
	movs	r3, #1
	strb	r3, [r1]
	ldr	r3, .L138+8
	movs	r5, #0
	strb	r5, [r1, #1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	ldr	r6, [r3]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	mov	r0, r6
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
	bl	strlen
	mov	r1, r6
	cmp	r0, #32
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	movhi	r3, #32
	strbhi	r5, [r4, #14]
	strbhi	r3, [r4, #12]
	strbhi	r5, [r4, #15]
	ldr	r2, [r4, #12]	@ unaligned
	bl	strncpy
	movs	r0, #0
	strb	r0, [r4, #52]
	strb	r0, [r4, #53]
	strb	r0, [r4, #54]
	strb	r0, [r4, #55]
	strb	r0, [r4, #88]
	strb	r0, [r4, #89]
	strb	r0, [r4, #90]
	strb	r0, [r4, #91]
	b	.L133
.L139:
	.align	2
.L138:
	.word	.LC24
	.word	.LANCHOR0+158
	.word	.LANCHOR1
	.fnend
	.size	valloc_version, .-valloc_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_ioctl, %function
valloc_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	movw	r3, #381
	uxtb	r4, r1
	str	r3, [sp]
	mov	r6, r0
	ldr	r3, .L144
	mov	r5, r1
	mov	r7, r2
	movs	r1, #5
	str	r4, [sp, #4]
	ldr	r2, .L144+4
	movs	r0, #1
	bl	vlog
	ldr	r3, .L144+8
	ldr	r1, [r3, #240]
	cmp	r1, r4
	bhi	.L141
	mov	r3, #384
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L144
	movs	r0, #1
	ldr	r2, .L144+12
	bl	vlog
.L142:
.L140:
	mvn	r0, #21
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L141:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r3, #236]
	movs	r2, #20
	mla	r1, r2, r4, r1
	cbnz	r1, .L143
	movw	r3, #391
	ldr	r2, .L144+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L144
	movs	r0, #1
	bl	vlog
	b	.L140
.L143:
	add	r3, r3, #272
	mov	r2, r5
	str	r3, [r1, #16]
	mov	r0, r6
	mov	r3, r7
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	b	mpi_ioctl_kernel
.L145:
	.align	2
.L144:
	.word	.LANCHOR0+173
	.word	.LC25
	.word	.LANCHOR1
	.word	.LC26
	.word	.LC27
	.fnend
	.size	valloc_ioctl, .-valloc_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_open, %function
valloc_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L151
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	ldr	r0, [r3, #24]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L147
	movw	r3, #415
	ldr	r2, .L151+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L151+8
	movs	r0, #1
	bl	vlog
.L150:
	mov	r5, #-1
.L146:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L147:
	str	r0, [r4]
	add	r3, r0, #8
	str	r0, [r4, #4]
	mov	r1, #10240
	str	r3, [r0, #8]
	adds	r0, r0, #20
	str	r3, [r0, #-8]
	bl	mpi_fs_buf_init
	mov	r5, r0
	cbz	r0, .L149
	mov	r0, r4
	bl	kfree
	b	.L150
.L149:
	ldr	r6, .L151+12
	add	r7, r6, #96
	mov	r0, r7
	bl	mpi_obj_ref
	ldr	r3, [r6, #96]
	str	r7, [r4, #16]
	movs	r1, #5
	str	r4, [r8, #128]
	movs	r0, #1
	ldr	r2, .L151+16
	str	r3, [sp, #4]
	mov	r3, #428
	str	r3, [sp]
	ldr	r3, .L151+8
	bl	vlog
	ldr	r3, .L151+20
	str	r3, [r6, #236]
	movs	r3, #10
	str	r3, [r6, #240]
	b	.L146
.L152:
	.align	2
.L151:
	.word	kmalloc_caches
	.word	.LC28
	.word	.LANCHOR0+186
	.word	.LANCHOR1
	.word	.LC29
	.word	.LANCHOR2
	.fnend
	.size	valloc_open, .-valloc_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_mb_get_fd, %function
valloc_mb_get_fd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #36
	beq	.L154
	movs	r3, #108
	ldr	r2, .L159
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L159+4
	movs	r0, #1
	bl	vlog
.L158:
	mov	r5, #-1
.L153:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L154:
	ldr	r0, [r1, #4]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r6, r0
	cbnz	r0, .L156
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L159+8
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #113
	str	r3, [sp]
	ldr	r3, .L159+4
	bl	vlog
	b	.L158
.L156:
	movs	r1, #0
	ldr	r0, [r0, #484]
	bl	dma_buf_fd
	adds	r3, r0, #1
	mov	r5, r0
	str	r0, [r4, #8]	@ unaligned
	bne	.L157
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L159+12
	movs	r0, #1
	str	r3, [sp, #4]
	movs	r3, #118
	str	r3, [sp]
	ldr	r3, .L159+4
	bl	vlog
	b	.L153
.L157:
	ldr	r3, [r6, #484]
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
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L159+16
	ldr	r1, [r4, #8]	@ unaligned
	str	r6, [r2, r1, lsl #2]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #5
	ldr	r2, .L159+20
	movs	r0, #1
	movs	r5, #0
	str	r3, [sp, #8]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #4]
	movs	r3, #125
	str	r3, [sp]
	ldr	r3, .L159+4
	bl	vlog
	b	.L153
.L160:
	.align	2
.L159:
	.word	.LC0
	.word	.LANCHOR0+198
	.word	.LC22
	.word	.LC30
	.word	dma_buf_fd_idr
	.word	.LC31
	.fnend
	.size	valloc_mb_get_fd, .-valloc_mb_get_fd
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_release, %function
valloc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r7, #442
	ldr	r6, [r1, #128]
	ldr	r8, .L170+4
	ldr	r9, .L170+8
	ldr	r0, [r6, #16]
	bl	mpi_obj_unref
	ldr	r3, [r6, #16]
	ldr	r2, .L170
	movs	r1, #5
	movs	r0, #1
	ldr	r3, [r3]
	str	r3, [sp, #4]
	mov	r3, #440
	str	r3, [sp]
	ldr	r3, .L170+4
	bl	vlog
	ldr	r4, [r6]
	ldr	r5, [r4], #-80
	subs	r5, r5, #80
.L162:
	add	r3, r4, #80
	cmp	r6, r3
	bne	.L164
	ldr	r5, [r6, #8]
	adds	r4, r4, #88
	subs	r5, r5, #4
.L165:
	adds	r3, r5, #4
	cmp	r3, r4
	bne	.L166
	add	r0, r6, #20
	bl	mpi_fs_buf_deinit
	mov	r0, r6
	bl	kfree
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L164:
	ldr	r3, [r4]
	mov	r2, r9
	movs	r1, #4
	movs	r0, #1
	strd	r7, r3, [sp]
	mov	r3, r8
	bl	vlog
	ldrd	r2, r3, [r4, #80]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r3, #290
	mov	r2, #256
	strd	r2, r3, [r4, #80]
	ldr	r3, [r4, #480]
	cbz	r3, .L163
	movs	r2, #0
	str	r2, [r3, #104]
.L163:
	mov	r0, r4
	mov	r4, r5
	bl	mpi_obj_unref
	ldr	r3, [r5, #80]
	sub	r5, r3, #80
	b	.L162
.L166:
	ldr	r0, [r5]
	bl	mpi_obj_unref
	ldr	r5, [r5, #4]
	subs	r5, r5, #4
	b	.L165
.L171:
	.align	2
.L170:
	.word	.LC29
	.word	.LANCHOR0+215
	.word	.LC32
	.fnend
	.size	valloc_release, .-valloc_release
	.section	.init.text,"ax",%progbits
	.align	1
	.global	valloc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_init, %function
valloc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L173
	bl	rkos_mutex_init
	mov	r2, #4096
	movs	r1, #0
	ldr	r0, .L173+4
	bl	memset
	ldr	r0, .L173+8
	pop	{r3, lr}
	b	valloc_probe
.L174:
	.align	2
.L173:
	.word	.LANCHOR1+272
	.word	dma_buf_fd_idr
	.word	.LC33
	.fnend
	.size	valloc_init, .-valloc_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	valloc_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	valloc_exit, %function
valloc_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L176
	bl	rkos_mutex_destory
	pop	{r3, lr}
	b	valloc_unload
.L177:
	.align	2
.L176:
	.word	.LANCHOR1+272
	.fnend
	.size	valloc_exit, .-valloc_exit
	.global	valloc_driver_fops
	.global	valloc_mutex
	.global	g_valloc_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36378, %object
	.size	__func__.36378, 17
__func__.36378:
	.ascii	"valloc_mb_create\000"
	.type	__func__.36385, %object
	.size	__func__.36385, 17
__func__.36385:
	.ascii	"valloc_mb_delete\000"
	.type	__func__.36358, %object
	.size	__func__.36358, 21
__func__.36358:
	.ascii	"valloc_mb_dec_refcnt\000"
	.type	__func__.36349, %object
	.size	__func__.36349, 21
__func__.36349:
	.ascii	"valloc_mb_add_refcnt\000"
	.type	__func__.36365, %object
	.size	__func__.36365, 21
__func__.36365:
	.ascii	"valloc_mb_sync_cache\000"
	.type	__func__.36341, %object
	.size	__func__.36341, 21
__func__.36341:
	.ascii	"valloc_mb_get_refcnt\000"
	.type	__func__.36334, %object
	.size	__func__.36334, 17
__func__.36334:
	.ascii	"valloc_mb_get_id\000"
	.type	__func__.36327, %object
	.size	__func__.36327, 23
__func__.36327:
	.ascii	"valloc_mb_get_phy_addr\000"
	.type	__func__.36306, %object
	.size	__func__.36306, 15
__func__.36306:
	.ascii	"valloc_version\000"
	.type	__func__.36402, %object
	.size	__func__.36402, 13
__func__.36402:
	.ascii	"valloc_ioctl\000"
	.type	__func__.36424, %object
	.size	__func__.36424, 12
__func__.36424:
	.ascii	"valloc_open\000"
	.type	__func__.36314, %object
	.size	__func__.36314, 17
__func__.36314:
	.ascii	"valloc_mb_get_fd\000"
	.type	__func__.36437, %object
	.size	__func__.36437, 15
__func__.36437:
	.ascii	"valloc_release\000"
	.space	2
	.type	valloc_driver_fops, %object
	.size	valloc_driver_fops, 128
valloc_driver_fops:
	.word	0
	.space	4
	.word	valloc_read
	.space	24
	.word	valloc_poll
	.word	valloc_ioctl
	.word	valloc_compat_ioctl
	.word	0
	.space	4
	.word	valloc_open
	.space	4
	.word	valloc_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	valloc_ioctls, %object
	.size	valloc_ioctls, 200
valloc_ioctls:
	.word	-1065590528
	.word	0
	.word	valloc_version
	.word	.LC34
	.word	0
	.word	-1071357695
	.word	0
	.word	valloc_mb_get_fd
	.word	.LC35
	.word	0
	.word	-1071357694
	.word	0
	.word	valloc_mb_create
	.word	.LC36
	.word	0
	.word	-1071357693
	.word	0
	.word	valloc_mb_delete
	.word	.LC37
	.word	0
	.word	-1071357692
	.word	0
	.word	valloc_mb_get_phy_addr
	.word	.LC38
	.word	0
	.word	-1071357691
	.word	0
	.word	valloc_mb_get_id
	.word	.LC39
	.word	0
	.word	-1071357690
	.word	0
	.word	valloc_mb_get_refcnt
	.word	.LC40
	.word	0
	.word	-1071357689
	.word	16
	.word	valloc_mb_sync_cache
	.word	.LC41
	.word	0
	.word	-1071357688
	.word	0
	.word	valloc_mb_add_refcnt
	.word	.LC42
	.word	0
	.word	-1071357687
	.word	0
	.word	valloc_mb_dec_refcnt
	.word	.LC43
	.word	0
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	g_valloc_dev, %object
	.size	g_valloc_dev, 272
g_valloc_dev:
	.space	272
	.type	valloc_mutex, %object
	.size	valloc_mutex, 4
valloc_mutex:
	.space	4
	.type	dma_buf_fd_idr, %object
	.size	dma_buf_fd_idr, 4096
dma_buf_fd_idr:
	.space	4096
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct valloc_mb mismatching\033[0m\000"
.LC1:
	.ascii	"\033[1;31mdma buf create fail, mb->size = %d\033[0m"
	.ascii	"\000"
.LC2:
	.ascii	"\033[1;33mdma buf get fail, mb->dma_buf_fd = %d\033"
	.ascii	"[0m\000"
.LC3:
	.ascii	"\033[1;31mmpi buf create fail\033[0m\000"
.LC4:
	.ascii	"mpi buf buf_id(%d)\000"
.LC5:
	.ascii	"buf->list->next = %x, %x\000"
.LC6:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC7:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC8:
	.ascii	"-2024-10-16-16:52:39\000"
.LC9:
	.ascii	"*******************************************mpi buf "
	.ascii	"list***************************************\012\000"
.LC10:
	.ascii	"buf_id-----pool_id-refcnt-dmacnt-size------handle--"
	.ascii	"---vaddr------paddr------create-----------user-----"
	.ascii	"--------------------\012\000"
.LC11:
	.ascii	"%-#4d(%-#4d) %-#7d %-#6d %-#6d %-#9d %-#10x %-#10x "
	.ascii	"%-#10x %-#16s \000"
.LC12:
	.ascii	"total:%-#16d\012\000"
.LC13:
	.ascii	"*************************************mpi pool list*"
	.ascii	"**********************************\012\000"
.LC14:
	.ascii	"poid-nkid-total-free-min-size-------------reflevel-"
	.ascii	"status-create-----------user-----------------------"
	.ascii	"----\012\000"
.LC15:
	.ascii	"%s_%d(%d) \000"
.LC16:
	.ascii	"deleted\000"
.LC17:
	.ascii	"%s_%x(%d) \000"
.LC18:
	.ascii	"\012\000"
.LC19:
	.ascii	"%-#4d %-#4d %-#5d %-#4d %-#3d %-#16d %-#9d%-#7x%-#1"
	.ascii	"6s \000"
.LC20:
	.ascii	"%s_%d\000"
.LC21:
	.ascii	"unref %x buffer refcnt = %d\000"
.LC22:
	.ascii	"\033[1;31mmpi buf get fail buf_id(%d)\033[0m\000"
.LC23:
	.ascii	"mpi buf get phys (%08x) buf_id(%d)\000"
.LC24:
	.ascii	"\033[1;31mstruct valloc_version mismatching\033[0m\000"
.LC25:
	.ascii	"valloc_ioctl: index = %d\000"
.LC26:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC27:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC28:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC29:
	.ascii	"%d\000"
.LC30:
	.ascii	"\033[1;31mmpi buf get fd fail buf_id(%d)\033[0m\000"
.LC31:
	.ascii	"mpi buf get fd (%d) buf_id(%d)\000"
.LC32:
	.ascii	"\033[1;32mbuf id = %d, user process exit\033[0m\000"
.LC33:
	.ascii	"valloc\000"
.LC34:
	.ascii	"VALLOC_IOCTL_VERSION\000"
.LC35:
	.ascii	"VALLOC_IOCTL_MB_GET_FD\000"
.LC36:
	.ascii	"VALLOC_IOCTL_MB_CREATE\000"
.LC37:
	.ascii	"VALLOC_IOCTL_MB_DELETE\000"
.LC38:
	.ascii	"VALLOC_IOCTL_MB_GET_PHY_ADDR\000"
.LC39:
	.ascii	"VALLOC_IOCTL_MB_GET_ID\000"
.LC40:
	.ascii	"VALLOC_IOCTL_MB_GET_REFCNT\000"
.LC41:
	.ascii	"VALLOC_IOCTL_MB_SYNC_CACHE\000"
.LC42:
	.ascii	"VALLOC_IOCTL_MB_ADD_REFCNT\000"
.LC43:
	.ascii	"VALLOC_IOCTL_MB_DEC_REFCNT\000"
	.section	___ksymtab_gpl+create_mpi_buf_with_external_fd,"a"
	.align	2
	.type	__ksymtab_create_mpi_buf_with_external_fd, %object
	.size	__ksymtab_create_mpi_buf_with_external_fd, 12
__ksymtab_create_mpi_buf_with_external_fd:
	.word	create_mpi_buf_with_external_fd
	.word	__kstrtab_create_mpi_buf_with_external_fd
	.word	__kstrtabns_create_mpi_buf_with_external_fd
	.section	___ksymtab_gpl+create_mpi_buf_with_external_id,"a"
	.align	2
	.type	__ksymtab_create_mpi_buf_with_external_id, %object
	.size	__ksymtab_create_mpi_buf_with_external_id, 12
__ksymtab_create_mpi_buf_with_external_id:
	.word	create_mpi_buf_with_external_id
	.word	__kstrtab_create_mpi_buf_with_external_id
	.word	__kstrtabns_create_mpi_buf_with_external_id
	.section	___ksymtab_gpl+get_mpi_buf,"a"
	.align	2
	.type	__ksymtab_get_mpi_buf, %object
	.size	__ksymtab_get_mpi_buf, 12
__ksymtab_get_mpi_buf:
	.word	get_mpi_buf
	.word	__kstrtab_get_mpi_buf
	.word	__kstrtabns_get_mpi_buf
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
