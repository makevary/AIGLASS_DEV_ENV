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
	.file	"mpp_buffer.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_buffer_pool_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_pool_init, %function
mpp_buffer_pool_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r3, r0
	ldr	r4, .L3
	ldr	r2, [r4]
	cbnz	r2, .L2
	movs	r2, #52
	ldr	r1, .L3+4
	ldr	r0, .L3+8
	bl	mpp_mem_get_pool_f
	str	r0, [r4]
.L2:
	movs	r0, #0
	pop	{r4, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR1
	.fnend
	.size	mpp_buffer_pool_init, .-mpp_buffer_pool_init
	.align	1
	.global	mpp_buffer_pool_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_pool_deinit, %function
mpp_buffer_pool_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L10
	ldr	r1, [r4]
	cbz	r1, .L6
	ldr	r0, .L10+4
	bl	mpp_mem_put_pool_f
	movs	r3, #0
	str	r3, [r4]
.L6:
	movs	r0, #0
	pop	{r4, pc}
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LANCHOR1+21
	.fnend
	.size	mpp_buffer_pool_deinit, .-mpp_buffer_pool_deinit
	.align	1
	.global	mpp_buf_pool_info_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buf_pool_info_show, %function
mpp_buf_pool_info_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldr	r1, [r3]
	b	mpp_mem_pool_info_show
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.fnend
	.size	mpp_buf_pool_info_show, .-mpp_buf_pool_info_show
	.align	1
	.global	mpp_buffer_import_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_import_with_tag, %function
mpp_buffer_import_with_tag:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r1
	mov	r7, r2
	bl	get_mpibuf_ops
	mov	r8, r0
	cbnz	r0, .L16
	movs	r2, #76
	ldr	r1, .L30
	ldr	r0, .L30+4
	bl	printk
	mov	r0, #-1
.L15:
	pop	{r4, r5, r6, r7, r8, pc}
.L16:
	cbnz	r4, .L18
	ldr	r2, [sp, #24]
	movs	r1, #82
	ldr	r0, .L30+8
.L29:
	bl	printk
	mvn	r0, #2
	b	.L15
.L18:
	cbz	r7, .L22
	ldr	r3, .L30+12
	ldr	r0, .L30+16
	ldr	r1, [r3]
	bl	mpp_mem_pool_get_f
	mov	r5, r0
	cbnz	r0, .L19
	ldr	r2, [sp, #24]
	movs	r1, #90
	ldr	r0, .L30+20
	b	.L29
.L19:
	mov	r6, r0
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	stm	r6, {r0, r1, r2, r3}
	ldr	r0, [r5, #12]
	str	r0, [r5, #32]
	ldr	r3, [r8, #20]
	cbz	r3, .L20
	blx	r3
	str	r0, [r5, #36]
.L20:
	ldr	r3, [r8, #12]
	cbz	r3, .L21
	ldr	r0, [r5, #32]
	blx	r3
.L21:
	ldr	r3, [r5, #48]
	movs	r0, #0
	adds	r3, r3, #1
	str	r3, [r5, #48]
	mov	r3, #-1
	str	r3, [r5, #16]
	str	r5, [r7]
	b	.L15
.L22:
	mov	r0, r7
	b	.L15
.L31:
	.align	2
.L30:
	.word	.LANCHOR1+44
	.word	.LC1
	.word	.LC2
	.word	.LANCHOR0
	.word	.LANCHOR1+71
	.word	.LC3
	.fnend
	.size	mpp_buffer_import_with_tag, .-mpp_buffer_import_with_tag
	.align	1
	.global	mpi_buf_alloc_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_alloc_with_tag, %function
mpi_buf_alloc_with_tag:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r2
	bl	get_mpibuf_ops
	cbnz	r0, .L33
	movs	r2, #116
	ldr	r1, .L37
	ldr	r0, .L37+4
	bl	printk
.L32:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L33:
	ldr	r3, [r0, #72]
	cmp	r3, #0
	beq	.L32
	mov	r1, r5
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	bx	r3
.L38:
	.align	2
.L37:
	.word	.LANCHOR1+98
	.word	.LC1
	.fnend
	.size	mpi_buf_alloc_with_tag, .-mpi_buf_alloc_with_tag
	.align	1
	.global	mpi_buf_ref_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref_with_tag, %function
mpi_buf_ref_with_tag:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbnz	r0, .L40
	movs	r2, #131
	ldr	r1, .L45
	ldr	r0, .L45+4
	bl	printk
	mov	r0, #-1
.L39:
	pop	{r4, pc}
.L40:
	cbz	r4, .L44
	ldr	r3, [r0, #12]
	cbz	r3, .L43
	mov	r0, r4
	blx	r3
.L44:
	movs	r0, #0
	b	.L39
.L43:
	mov	r0, r3
	b	.L39
.L46:
	.align	2
.L45:
	.word	.LANCHOR1+121
	.word	.LC1
	.fnend
	.size	mpi_buf_ref_with_tag, .-mpi_buf_ref_with_tag
	.align	1
	.global	mpi_buf_unref_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unref_with_tag, %function
mpi_buf_unref_with_tag:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbnz	r0, .L48
	movs	r2, #148
	ldr	r1, .L53
	ldr	r0, .L53+4
	bl	printk
	mov	r0, #-1
.L47:
	pop	{r4, pc}
.L48:
	cbz	r4, .L52
	ldr	r3, [r0, #16]
	cbz	r3, .L51
	mov	r0, r4
	blx	r3
.L52:
	movs	r0, #0
	b	.L47
.L51:
	mov	r0, r3
	b	.L47
.L54:
	.align	2
.L53:
	.word	.LANCHOR1+142
	.word	.LC1
	.fnend
	.size	mpi_buf_unref_with_tag, .-mpi_buf_unref_with_tag
	.align	1
	.global	mpi_buf_get_dma_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_dma_with_caller, %function
mpi_buf_get_dma_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbnz	r0, .L56
	movs	r2, #165
	ldr	r1, .L63
	ldr	r0, .L63+4
	bl	printk
.L57:
	movs	r0, #0
	pop	{r4, pc}
.L56:
	cmp	r4, #0
	beq	.L57
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L57
	mov	r0, r4
	pop	{r4, lr}
	bx	r3
.L64:
	.align	2
.L63:
	.word	.LANCHOR1+165
	.word	.LC1
	.fnend
	.size	mpi_buf_get_dma_with_caller, .-mpi_buf_get_dma_with_caller
	.align	1
	.global	mpp_buffer_get_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_with_tag, %function
mpp_buffer_get_with_tag:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	fp, r0
	mov	r8, r1
	mov	r5, r2
	ldr	r6, [sp, #48]
	bl	get_mpibuf_ops
	mov	r9, r0
	cbnz	r0, .L66
	movs	r2, #187
	ldr	r1, .L81
	ldr	r0, .L81+4
	bl	printk
.L80:
	mov	r0, #-1
.L65:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L66:
	cbnz	r5, .L68
	mov	r3, r6
	movs	r2, #191
	ldr	r1, .L81
	ldr	r0, .L81+8
	bl	printk
	b	.L80
.L68:
	ldr	r7, .L81+12
	ldr	r0, .L81+16
	ldr	r1, [r7]
	bl	mpp_mem_pool_get_f
	mov	r4, r0
	cbnz	r0, .L69
	strd	r5, r6, [sp]
	mov	r3, r8
	mov	r2, fp
	movs	r1, #197
	ldr	r0, .L81+20
	bl	printk
.L79:
	mvn	r0, #1
	b	.L65
.L69:
	ldr	r3, [r9, #72]
	cbnz	r3, .L70
.L71:
	mov	r2, fp
	strd	r5, r6, [sp]
	mov	r3, r8
	movs	r1, #206
	ldr	r0, .L81+24
	bl	printk
	mov	r2, r4
	ldr	r1, [r7]
	ldr	r0, .L81+16
	bl	mpp_mem_pool_put_f
	b	.L79
.L70:
	mov	r1, r6
	mov	r0, r5
	blx	r3
	mov	r10, r0
	cmp	r0, #0
	beq	.L71
	ldr	r3, [r9, #20]
	cbz	r3, .L72
	blx	r3
	str	r0, [r4, #36]
.L72:
	mov	r3, #-1
	str	r3, [r4, #16]
	ldr	r3, [r4, #48]
	movs	r0, #0
	str	r10, [r4, #32]
	str	r5, [r4, #4]
	adds	r3, r3, #1
	str	r10, [r4, #12]
	str	r3, [r4, #48]
	str	r4, [r8]
	b	.L65
.L82:
	.align	2
.L81:
	.word	.LANCHOR1+193
	.word	.LC1
	.word	.LC4
	.word	.LANCHOR0
	.word	.LANCHOR1+217
	.word	.LC5
	.word	.LC6
	.fnend
	.size	mpp_buffer_get_with_tag, .-mpp_buffer_get_with_tag
	.align	1
	.global	mpp_ring_buffer_get_with_tag
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_ring_buffer_get_with_tag, %function
mpp_ring_buffer_get_with_tag:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	fp, r0
	mov	r7, r1
	mov	r5, r2
	ldr	r9, [sp, #48]
	bl	get_mpibuf_ops
	mov	r8, r0
	cbnz	r0, .L84
	movs	r2, #231
	ldr	r1, .L100
	ldr	r0, .L100+4
	bl	printk
	mov	r0, #-1
.L83:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L84:
	ldr	r6, .L100+8
	ldr	r0, .L100+12
	ldr	r1, [r6]
	bl	mpp_mem_pool_get_f
	mov	r4, r0
	cbnz	r0, .L86
	strd	r5, r9, [sp]
	mov	r3, r7
	mov	r2, fp
	movs	r1, #237
	ldr	r0, .L100+16
	bl	printk
.L99:
	mvn	r0, #1
	b	.L83
.L86:
	ldr	r3, [r8, #72]
	cbnz	r3, .L87
.L88:
	mov	r2, fp
	strd	r5, r9, [sp]
	mov	r3, r7
	movs	r1, #246
	ldr	r0, .L100+20
	bl	printk
	mov	r2, r4
	ldr	r1, [r6]
	ldr	r0, .L100+12
	bl	mpp_mem_pool_put_f
	b	.L99
.L87:
	mov	r1, r9
	mov	r0, r5
	blx	r3
	mov	r10, r0
	cmp	r0, #0
	beq	.L88
	cmp	r5, #0
	beq	.L88
	ldr	r3, [r8, #20]
	cbz	r3, .L89
	blx	r3
	str	r0, [r4, #36]
.L89:
	mov	r3, #-1
	str	r3, [r4, #16]
	ldr	r3, [r4, #48]
	movs	r0, #0
	str	r10, [r4, #32]
	adds	r3, r3, #1
	str	r5, [r4, #4]
	str	r3, [r4, #48]
	movs	r3, #1
	str	r10, [r4, #12]
	str	r3, [r4, #44]
	str	r4, [r7]
	b	.L83
.L101:
	.align	2
.L100:
	.word	.LANCHOR1+241
	.word	.LC1
	.word	.LANCHOR0
	.word	.LANCHOR1+270
	.word	.LC5
	.word	.LC6
	.fnend
	.size	mpp_ring_buffer_get_with_tag, .-mpp_ring_buffer_get_with_tag
	.align	1
	.global	mpp_buffer_put_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_put_with_caller, %function
mpp_buffer_put_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	bl	get_mpibuf_ops
	mov	r6, r0
	cbnz	r0, .L103
	mov	r2, #270
	ldr	r1, .L116
	ldr	r0, .L116+4
	mov	r4, #-1
	bl	printk
.L102:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L103:
	cbnz	r5, .L105
	mov	r2, r4
	mov	r1, #276
	ldr	r0, .L116+8
	mvn	r4, #1
	bl	printk
	b	.L102
.L105:
	ldr	r4, [r5, #48]
	subs	r4, r4, #1
	str	r4, [r5, #48]
	cbnz	r4, .L109
	ldr	r3, [r5, #44]
	cbz	r3, .L106
	ldr	r0, [r5, #8]
	bl	vunmap
.L107:
	ldr	r3, [r6, #16]
	cbz	r3, .L108
	ldr	r0, [r5, #32]
	blx	r3
.L108:
	ldr	r3, .L116+12
	mov	r2, r5
	ldr	r0, .L116+16
	ldr	r1, [r3]
	bl	mpp_mem_pool_put_f
	b	.L102
.L106:
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L107
	ldr	r0, [r5, #32]
	blx	r3
	b	.L107
.L109:
	movs	r4, #0
	b	.L102
.L117:
	.align	2
.L116:
	.word	.LANCHOR1+299
	.word	.LC1
	.word	.LC7
	.word	.LANCHOR0
	.word	.LANCHOR1+326
	.fnend
	.size	mpp_buffer_put_with_caller, .-mpp_buffer_put_with_caller
	.align	1
	.global	mpp_buffer_inc_ref_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_inc_ref_with_caller, %function
mpp_buffer_inc_ref_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r2, r1
	cbnz	r0, .L119
	movw	r1, #369
	ldr	r0, .L121
	bl	printk
	mvn	r0, #1
.L118:
	pop	{r3, pc}
.L119:
	ldr	r3, [r0, #48]
	adds	r3, r3, #1
	str	r3, [r0, #48]
	movs	r0, #0
	b	.L118
.L122:
	.align	2
.L121:
	.word	.LC8
	.fnend
	.size	mpp_buffer_inc_ref_with_caller, .-mpp_buffer_inc_ref_with_caller
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.global	mpp_buffer_get_fd_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_fd_with_caller, %function
mpp_buffer_get_fd_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r2, [r0, #16]
	mov	r6, r1
	ldr	r0, .L127
	mov	r1, #464
	bl	printk
	ldr	r4, [r5, #16]
	cmp	r4, #0
	bgt	.L123
	cbnz	r5, .L125
	mov	r2, r6
	movw	r1, #469
	ldr	r0, .L127+4
	mov	r4, #-1
	bl	printk
.L123:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L125:
	movs	r1, #0
	ldr	r0, [r5, #36]
	bl	dma_buf_fd
	subs	r4, r0, #0
	bge	.L126
	movw	r1, #473
	ldr	r3, .L127+8
	str	r1, [sp]
	ldr	r2, .L127+12
	ldr	r0, .L127+16
	bl	printk
	mov	r3, r4
	mov	r2, r5
	mov	r1, #476
	ldr	r0, .L127+20
	str	r6, [sp]
	bl	printk
.L126:
	mov	r2, r4
	mov	r1, #478
	ldr	r0, .L127+24
	bl	printk
	str	r4, [r5, #16]
	b	.L123
.L128:
	.align	2
.L127:
	.word	.LC9
	.word	.LC10
	.word	.LANCHOR1+353
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.fnend
	.size	mpp_buffer_get_fd_with_caller, .-mpp_buffer_get_fd_with_caller
	.text
	.align	1
	.global	mpp_buffer_get_dma_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_dma_with_caller, %function
mpp_buffer_get_dma_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r3, r1
	mov	r4, r0
	cbnz	r0, .L130
	mov	r2, r1
	ldr	r0, .L133
	mov	r1, #490
	bl	printk
.L131:
	mov	r0, r4
	pop	{r4, pc}
.L130:
	ldr	r2, [r0, #36]
	cbnz	r2, .L132
	mov	r2, r0
	movw	r1, #495
	ldr	r0, .L133+4
	bl	printk
.L132:
	ldr	r4, [r4, #36]
	b	.L131
.L134:
	.align	2
.L133:
	.word	.LC15
	.word	.LC16
	.fnend
	.size	mpp_buffer_get_dma_with_caller, .-mpp_buffer_get_dma_with_caller
	.align	1
	.global	mpp_buffer_get_size_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_size_with_caller, %function
mpp_buffer_get_size_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r3, r1
	mov	r4, r0
	cbnz	r0, .L136
	mov	r2, r1
	ldr	r0, .L139
	movw	r1, #505
	bl	printk
	mov	r0, r4
.L135:
	pop	{r4, pc}
.L136:
	ldr	r2, [r0, #4]
	cbnz	r2, .L138
	mov	r2, r0
	mov	r1, #510
	ldr	r0, .L139+4
	bl	printk
.L138:
	ldr	r0, [r4, #4]
	b	.L135
.L140:
	.align	2
.L139:
	.word	.LC17
	.word	.LC18
	.fnend
	.size	mpp_buffer_get_size_with_caller, .-mpp_buffer_get_size_with_caller
	.align	1
	.global	mpp_buffer_get_index_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_index_with_caller, %function
mpp_buffer_get_index_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r2, r1
	cbnz	r0, .L142
	movw	r1, #521
	ldr	r0, .L144
	bl	printk
	mov	r0, #-1
.L141:
	pop	{r3, pc}
.L142:
	ldr	r0, [r0, #20]
	b	.L141
.L145:
	.align	2
.L144:
	.word	.LC19
	.fnend
	.size	mpp_buffer_get_index_with_caller, .-mpp_buffer_get_index_with_caller
	.align	1
	.global	mpp_buffer_set_index_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_set_index_with_caller, %function
mpp_buffer_set_index_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L147
	movw	r1, #535
	ldr	r0, .L149
	bl	printk
	mvn	r0, #1
.L146:
	pop	{r3, pc}
.L147:
	str	r1, [r0, #20]
	movs	r0, #0
	b	.L146
.L150:
	.align	2
.L149:
	.word	.LC20
	.fnend
	.size	mpp_buffer_set_index_with_caller, .-mpp_buffer_set_index_with_caller
	.align	1
	.global	mpp_buffer_get_offset_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_offset_with_caller, %function
mpp_buffer_get_offset_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r2, r1
	cbnz	r0, .L152
	movw	r1, #550
	ldr	r0, .L154
	bl	printk
	mov	r0, #-1
.L151:
	pop	{r3, pc}
.L152:
	ldr	r0, [r0, #40]
	b	.L151
.L155:
	.align	2
.L154:
	.word	.LC21
	.fnend
	.size	mpp_buffer_get_offset_with_caller, .-mpp_buffer_get_offset_with_caller
	.align	1
	.global	mpp_buffer_set_offset_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_set_offset_with_caller, %function
mpp_buffer_set_offset_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L157
	mov	r1, #564
	ldr	r0, .L159
	bl	printk
	mvn	r0, #1
.L156:
	pop	{r3, pc}
.L157:
	str	r1, [r0, #40]
	movs	r0, #0
	b	.L156
.L160:
	.align	2
.L159:
	.word	.LC22
	.fnend
	.size	mpp_buffer_set_offset_with_caller, .-mpp_buffer_set_offset_with_caller
	.align	1
	.global	mpp_buffer_info_get_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_info_get_with_caller, %function
mpp_buffer_info_get_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	bl	get_mpibuf_ops
	cbnz	r0, .L162
	mov	r2, #580
	ldr	r1, .L173
	ldr	r0, .L173+4
	bl	printk
	mov	r0, #-1
.L161:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L162:
	cbz	r4, .L164
	cbnz	r5, .L165
.L164:
	str	r6, [sp]
	mov	r3, r5
	mov	r2, r4
	movw	r1, #585
	ldr	r0, .L173+8
	bl	printk
	mvn	r0, #1
	b	.L161
.L165:
	ldr	r3, [r4, #8]
	cbnz	r3, .L166
	ldr	r3, [r0, #4]
	cbz	r3, .L166
	ldr	r0, [r4, #32]
	blx	r3
	str	r0, [r4, #8]
.L166:
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	stm	r5, {r0, r1, r2, r3}
	movs	r0, #0
	b	.L161
.L174:
	.align	2
.L173:
	.word	.LANCHOR1+383
	.word	.LC1
	.word	.LC23
	.fnend
	.size	mpp_buffer_info_get_with_caller, .-mpp_buffer_info_get_with_caller
	.align	1
	.global	mpp_buffer_flush_for_cpu_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_flush_for_cpu_with_caller, %function
mpp_buffer_flush_for_cpu_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r0]
	ldr	r3, [r0, #12]
	bic	r2, r3, #63
	cbnz	r4, .L176
	mov	r2, r1
	ldr	r0, .L180
	mov	r1, #604
	bl	printk
	mvn	r0, #1
.L175:
	pop	{r3, r4, r5, pc}
.L176:
	ldr	r1, [r0, #20]
	ldr	r0, [r4, #36]
	add	r1, r1, r3
	ldr	r3, [r4, #4]
	cmp	r1, r3
	bcc	.L178
	subs	r3, r3, r2
	movs	r1, #2
	bl	dma_buf_begin_cpu_access_partial
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #12]
	movs	r1, #2
	ldr	r0, [r4, #36]
	add	r3, r3, r2
	ldr	r2, [r4, #4]
	adds	r3, r3, #63
	subs	r3, r3, r2
	movs	r2, #0
	bic	r3, r3, #63
.L179:
	bl	dma_buf_begin_cpu_access_partial
	movs	r0, #0
	b	.L175
.L178:
	add	r3, r1, #63
	movs	r1, #2
	subs	r3, r3, r2
	bic	r3, r3, #63
	b	.L179
.L181:
	.align	2
.L180:
	.word	.LC22
	.fnend
	.size	mpp_buffer_flush_for_cpu_with_caller, .-mpp_buffer_flush_for_cpu_with_caller
	.align	1
	.global	mpp_buffer_flush_for_device_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_flush_for_device_with_caller, %function
mpp_buffer_flush_for_device_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r0]
	ldr	r3, [r0, #12]
	bic	r2, r3, #63
	cbnz	r4, .L183
	mov	r2, r1
	ldr	r0, .L187
	movw	r1, #630
	bl	printk
	mvn	r0, #1
.L182:
	pop	{r3, r4, r5, pc}
.L183:
	ldr	r1, [r0, #20]
	ldr	r0, [r4, #36]
	add	r1, r1, r3
	ldr	r3, [r4, #4]
	cmp	r1, r3
	bcc	.L185
	subs	r3, r3, r2
	movs	r1, #1
	bl	dma_buf_end_cpu_access_partial
	ldr	r2, [r5, #20]
	ldr	r3, [r5, #12]
	movs	r1, #1
	ldr	r0, [r4, #36]
	add	r3, r3, r2
	ldr	r2, [r4, #4]
	adds	r3, r3, #63
	subs	r3, r3, r2
	movs	r2, #0
	bic	r3, r3, #63
.L186:
	bl	dma_buf_end_cpu_access_partial
	movs	r0, #0
	b	.L182
.L185:
	add	r3, r1, #63
	movs	r1, #1
	subs	r3, r3, r2
	bic	r3, r3, #63
	b	.L186
.L188:
	.align	2
.L187:
	.word	.LC22
	.fnend
	.size	mpp_buffer_flush_for_device_with_caller, .-mpp_buffer_flush_for_device_with_caller
	.align	1
	.global	mpp_buffer_get_mpi_buf_id_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_mpi_buf_id_with_caller, %function
mpp_buffer_get_mpi_buf_id_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #104
	sub	sp, sp, #104
	mov	r4, r0
	mov	r6, r1
	bl	get_mpibuf_ops
	mov	r5, r0
	cbnz	r0, .L190
	movw	r2, #659
	ldr	r1, .L197
	ldr	r0, .L197+4
	bl	printk
.L195:
	mov	r0, #-1
	b	.L189
.L190:
	cbnz	r4, .L192
	mov	r3, r6
	mov	r2, r4
	movw	r1, #665
	ldr	r0, .L197+8
	bl	printk
	mvn	r0, #1
.L189:
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, pc}
.L192:
	movs	r2, #104
	movs	r1, #0
	mov	r0, sp
	bl	memset
	ldr	r3, [r5, #52]
	cbz	r3, .L193
	mov	r2, #-1
	mov	r1, sp
	ldr	r0, [r4, #32]
	blx	r3
	cmp	r0, #0
	bne	.L195
	ldr	r0, [sp, #56]
	b	.L189
.L193:
	movw	r1, #673
	ldr	r0, .L197+12
	bl	printk
	b	.L195
.L198:
	.align	2
.L197:
	.word	.LANCHOR1+415
	.word	.LC1
	.word	.LC24
	.word	.LC25
	.fnend
	.size	mpp_buffer_get_mpi_buf_id_with_caller, .-mpp_buffer_get_mpi_buf_id_with_caller
	.align	1
	.global	mpp_buffer_set_phy_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_set_phy_caller, %function
mpp_buffer_set_phy_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbnz	r0, .L200
	movw	r1, #686
	ldr	r0, .L201
	b	printk
.L200:
	movs	r3, #1
	strd	r3, r1, [r0, #24]
	bx	lr
.L202:
	.align	2
.L201:
	.word	.LC21
	.fnend
	.size	mpp_buffer_set_phy_caller, .-mpp_buffer_set_phy_caller
	.align	1
	.global	mpp_buffer_get_phy_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_phy_caller, %function
mpp_buffer_get_phy_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	bl	get_mpibuf_ops
	cbnz	r4, .L204
	ldr	r0, .L213
	mov	r2, r5
	movw	r1, #701
.L212:
	bl	printk
.L208:
	mov	r0, #-1
	b	.L203
.L204:
	cbnz	r0, .L206
	movw	r2, #706
	ldr	r1, .L213+4
	ldr	r0, .L213+8
	b	.L212
.L206:
	ldr	r3, [r4, #24]
	cbz	r3, .L207
	ldr	r0, [r4, #28]
.L203:
	pop	{r3, r4, r5, pc}
.L207:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L208
	ldr	r0, [r4, #32]
	blx	r3
	adds	r3, r0, #1
	beq	.L203
	movs	r3, #1
	str	r0, [r4, #28]
	str	r3, [r4, #24]
	b	.L203
.L214:
	.align	2
.L213:
	.word	.LC21
	.word	.LANCHOR1+453
	.word	.LC1
	.fnend
	.size	mpp_buffer_get_phy_caller, .-mpp_buffer_get_phy_caller
	.align	1
	.global	mpp_buffer_map_ring_ptr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_map_ring_ptr, %function
mpp_buffer_map_ring_ptr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r8, r0
	ldr	r1, .L228
	bl	mpp_buffer_get_phy_caller
	adds	r3, r0, #1
	bne	.L216
	ldr	r0, [r8, #36]
	bl	mpp_srv_get_phy
.L216:
	ldr	r5, [r8, #4]
	ubfx	r4, r0, #0, #12
	mov	r7, r0
	subs	r5, r5, #1
	add	r5, r5, r0
	mvn	r5, r5, lsr #12
	mvn	r5, r5, lsl #12
	adds	r5, r5, #1
	cbz	r4, .L217
	mov	r1, #314
	ldr	r0, .L228+4
	bl	printk
	movs	r6, #0
.L215:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L217:
	subs	r0, r5, r0
	mov	r1, #3264
	lsrs	r0, r0, #12
	adds	r0, r0, #1
	lsl	r10, r0, #1
	lsls	r0, r0, #3
	bl	__kmalloc
	mov	r6, r0
	cmp	r0, #0
	beq	.L215
	ldr	fp, .L228+24
	mov	r9, r7
.L219:
	cmp	r9, r5
	bcc	.L221
	ldr	r9, .L228+12
	ldr	fp, .L228+24
.L222:
	cmp	r7, r5
	bcc	.L224
	ldr	r3, .L228+8
	movs	r2, #4
	mov	r1, r4
	mov	r0, r6
	ldr	r3, [r3]
	orr	r3, r3, #512
	bl	vmap
	str	r0, [r8, #8]
	mov	r0, r6
	bl	kfree
	ldr	r6, [r8, #8]
	b	.L215
.L221:
	cmp	r4, r10
	blt	.L220
	movw	r1, #325
	ldr	r3, .L228
	str	r1, [sp]
	mov	r0, fp
	ldr	r2, .L228+12
	bl	printk
.L220:
	ldr	r3, .L228+16
	ldr	r2, [r3]
	ldr	r3, .L228+20
	rsb	r2, r2, r9, lsr #12
	add	r9, r9, #4096
	ldr	r3, [r3]
	add	r3, r3, r2, lsl #5
	str	r3, [r6, r4, lsl #2]
	adds	r4, r4, #1
	b	.L219
.L224:
	cmp	r4, r10
	blt	.L223
	mov	r1, #332
	ldr	r3, .L228
	str	r1, [sp]
	mov	r2, r9
	mov	r0, fp
	bl	printk
.L223:
	ldr	r3, .L228+16
	ldr	r2, [r3]
	ldr	r3, .L228+20
	rsb	r2, r2, r7, lsr #12
	add	r7, r7, #4096
	ldr	r3, [r3]
	add	r3, r3, r2, lsl #5
	str	r3, [r6, r4, lsl #2]
	adds	r4, r4, #1
	b	.L222
.L229:
	.align	2
.L228:
	.word	.LANCHOR1+479
	.word	.LC26
	.word	pgprot_kernel
	.word	.LC27
	.word	__pv_phys_pfn_offset
	.word	mem_map
	.word	.LC12
	.fnend
	.size	mpp_buffer_map_ring_ptr, .-mpp_buffer_map_ring_ptr
	.align	1
	.global	mpp_buffer_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_map, %function
mpp_buffer_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbnz	r0, .L231
	mov	r2, #348
	ldr	r1, .L237
	ldr	r0, .L237+4
	bl	printk
	mov	r0, #-1
.L230:
	pop	{r4, r5, r6, pc}
.L231:
	ldr	r6, [r4, #8]
	cbnz	r6, .L234
	ldr	r3, [r0, #4]
	cbz	r3, .L235
	ldr	r5, [r4, #44]
	cbz	r5, .L233
	mov	r0, r4
	bl	mpp_buffer_map_ring_ptr
.L236:
	str	r0, [r4, #8]
.L234:
	movs	r0, #0
	b	.L230
.L233:
	ldr	r0, [r4, #32]
	blx	r3
	b	.L236
.L235:
	mov	r0, r3
	b	.L230
.L238:
	.align	2
.L237:
	.word	.LANCHOR1+503
	.word	.LC1
	.fnend
	.size	mpp_buffer_map, .-mpp_buffer_map
	.align	1
	.global	mpp_buffer_read_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_read_with_caller, %function
mpp_buffer_read_with_caller:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	mov	r5, r2
	mov	r6, r3
	mov	r7, r0
	cbz	r0, .L240
	cbnz	r2, .L241
.L240:
	ldr	r3, [sp, #32]
	mov	r2, r7
	movw	r1, #385
	ldr	r0, .L249
	mvn	r4, #1
	str	r3, [sp]
	mov	r3, r5
	bl	printk
.L239:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L241:
	cbz	r3, .L244
	bl	mpp_buffer_map
	mov	r4, r0
	cbnz	r0, .L245
	ldr	r1, [r7, #8]
	cbnz	r1, .L243
	mov	r1, #396
	ldr	r3, .L249+4
	str	r1, [sp]
	ldr	r2, .L249+8
	ldr	r0, .L249+12
	bl	printk
	b	.L239
.L244:
	mov	r4, r3
	b	.L239
.L245:
	mov	r4, #-1
	b	.L239
.L243:
	mov	r2, r6
	add	r1, r1, r8
	mov	r0, r5
	bl	memcpy
	b	.L239
.L250:
	.align	2
.L249:
	.word	.LC28
	.word	.LANCHOR1+518
	.word	.LC29
	.word	.LC12
	.fnend
	.size	mpp_buffer_read_with_caller, .-mpp_buffer_read_with_caller
	.align	1
	.global	mpp_buffer_write_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_write_with_caller, %function
mpp_buffer_write_with_caller:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r8, r1
	mov	r6, r2
	mov	r5, r3
	mov	r7, r0
	cbz	r0, .L252
	cbnz	r2, .L253
.L252:
	ldr	r3, [sp, #32]
	mov	r2, r7
	mov	r1, #412
	ldr	r0, .L262
	mvn	r4, #1
	str	r3, [sp]
	mov	r3, r6
	bl	printk
.L251:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L253:
	cbz	r3, .L256
	ldr	r2, [r0, #4]
	add	r3, r3, r1
	cmp	r3, r2
	bhi	.L257
	bl	mpp_buffer_map
	mov	r4, r0
	cbnz	r0, .L258
	ldr	r0, [r7, #8]
	cbnz	r0, .L255
	mov	r1, #426
	ldr	r3, .L262+4
	str	r1, [sp]
	ldr	r2, .L262+8
	ldr	r0, .L262+12
	bl	printk
	b	.L251
.L256:
	mov	r4, r3
	b	.L251
.L257:
	mvn	r4, #5
	b	.L251
.L258:
	mov	r4, #-1
	b	.L251
.L255:
	mov	r2, r5
	mov	r1, r6
	add	r0, r0, r8
	bl	memcpy
	b	.L251
.L263:
	.align	2
.L262:
	.word	.LC30
	.word	.LANCHOR1+546
	.word	.LC31
	.word	.LC12
	.fnend
	.size	mpp_buffer_write_with_caller, .-mpp_buffer_write_with_caller
	.align	1
	.global	mpp_buffer_get_ptr_with_caller
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_buffer_get_ptr_with_caller, %function
mpp_buffer_get_ptr_with_caller:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	mov	r6, r1
	bl	get_mpibuf_ops
	mov	r5, r0
	cbnz	r0, .L265
	movw	r2, #439
	ldr	r1, .L272
	ldr	r0, .L272+4
	bl	printk
.L264:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L265:
	cbnz	r4, .L267
	mov	r2, r6
	mov	r1, #444
	ldr	r0, .L272+8
	bl	printk
.L271:
	movs	r5, #0
	b	.L264
.L267:
	mov	r0, r4
	bl	mpp_buffer_map
	cmp	r0, #0
	bne	.L271
	ldr	r3, [r4, #8]
	cbnz	r3, .L269
	movw	r1, #451
	ldr	r3, .L272+12
	str	r1, [sp]
	ldr	r2, .L272+16
	ldr	r0, .L272+20
	bl	printk
	ldr	r3, [r4, #8]
	cbnz	r3, .L269
	mov	r3, r6
	mov	r2, r4
	mov	r1, #454
	ldr	r0, .L272+24
	bl	printk
.L269:
	ldr	r5, [r4, #8]
	b	.L264
.L273:
	.align	2
.L272:
	.word	.LANCHOR1+575
	.word	.LC1
	.word	.LC32
	.word	.LANCHOR1+606
	.word	.LC33
	.word	.LC12
	.word	.LC34
	.fnend
	.size	mpp_buffer_get_ptr_with_caller, .-mpp_buffer_get_ptr_with_caller
	.section	.rodata
	.set	.LANCHOR1,. + 0
	.type	__FUNCTION__.34487, %object
	.size	__FUNCTION__.34487, 21
__FUNCTION__.34487:
	.ascii	"mpp_buffer_pool_init\000"
	.type	__FUNCTION__.34491, %object
	.size	__FUNCTION__.34491, 23
__FUNCTION__.34491:
	.ascii	"mpp_buffer_pool_deinit\000"
	.type	__func__.34504, %object
	.size	__func__.34504, 27
__func__.34504:
	.ascii	"mpp_buffer_import_with_tag\000"
	.type	__FUNCTION__.34506, %object
	.size	__FUNCTION__.34506, 27
__FUNCTION__.34506:
	.ascii	"mpp_buffer_import_with_tag\000"
	.type	__func__.34514, %object
	.size	__func__.34514, 23
__func__.34514:
	.ascii	"mpi_buf_alloc_with_tag\000"
	.type	__func__.34521, %object
	.size	__func__.34521, 21
__func__.34521:
	.ascii	"mpi_buf_ref_with_tag\000"
	.type	__func__.34528, %object
	.size	__func__.34528, 23
__func__.34528:
	.ascii	"mpi_buf_unref_with_tag\000"
	.type	__func__.34535, %object
	.size	__func__.34535, 28
__func__.34535:
	.ascii	"mpi_buf_get_dma_with_caller\000"
	.type	__func__.34546, %object
	.size	__func__.34546, 24
__func__.34546:
	.ascii	"mpp_buffer_get_with_tag\000"
	.type	__FUNCTION__.34547, %object
	.size	__FUNCTION__.34547, 24
__FUNCTION__.34547:
	.ascii	"mpp_buffer_get_with_tag\000"
	.type	__func__.34558, %object
	.size	__func__.34558, 29
__func__.34558:
	.ascii	"mpp_ring_buffer_get_with_tag\000"
	.type	__FUNCTION__.34559, %object
	.size	__FUNCTION__.34559, 29
__FUNCTION__.34559:
	.ascii	"mpp_ring_buffer_get_with_tag\000"
	.type	__func__.34566, %object
	.size	__func__.34566, 27
__func__.34566:
	.ascii	"mpp_buffer_put_with_caller\000"
	.type	__FUNCTION__.34567, %object
	.size	__FUNCTION__.34567, 27
__FUNCTION__.34567:
	.ascii	"mpp_buffer_put_with_caller\000"
	.type	__FUNCTION__.34638, %object
	.size	__FUNCTION__.34638, 30
__FUNCTION__.34638:
	.ascii	"mpp_buffer_get_fd_with_caller\000"
	.type	__func__.34680, %object
	.size	__func__.34680, 32
__func__.34680:
	.ascii	"mpp_buffer_info_get_with_caller\000"
	.type	__func__.34702, %object
	.size	__func__.34702, 38
__func__.34702:
	.ascii	"mpp_buffer_get_mpi_buf_id_with_caller\000"
	.type	__func__.34716, %object
	.size	__func__.34716, 26
__func__.34716:
	.ascii	"mpp_buffer_get_phy_caller\000"
	.type	__FUNCTION__.34577, %object
	.size	__FUNCTION__.34577, 24
__FUNCTION__.34577:
	.ascii	"mpp_buffer_map_ring_ptr\000"
	.type	__func__.34592, %object
	.size	__func__.34592, 15
__func__.34592:
	.ascii	"mpp_buffer_map\000"
	.type	__FUNCTION__.34607, %object
	.size	__FUNCTION__.34607, 28
__FUNCTION__.34607:
	.ascii	"mpp_buffer_read_with_caller\000"
	.type	__FUNCTION__.34619, %object
	.size	__FUNCTION__.34619, 29
__FUNCTION__.34619:
	.ascii	"mpp_buffer_write_with_caller\000"
	.type	__func__.34628, %object
	.size	__func__.34628, 31
__func__.34628:
	.ascii	"mpp_buffer_get_ptr_with_caller\000"
	.type	__FUNCTION__.34629, %object
	.size	__FUNCTION__.34629, 31
__FUNCTION__.34629:
	.ascii	"mpp_buffer_get_ptr_with_caller\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_mppbuf_pool, %object
	.size	g_mppbuf_pool, 4
g_mppbuf_pool:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"mpp_buffer\000"
.LC1:
	.ascii	"\0013%s:%d: mpibuf_ops get fail\000"
.LC2:
	.ascii	"\0013%d: mpp_buffer_commit invalid input: info NULL"
	.ascii	" from %s\012\000"
.LC3:
	.ascii	"\0013%d: mpp_buffer_import fail %s\012\000"
.LC4:
	.ascii	"\0013%s:%d: size is 0 caller %s\012\000"
.LC5:
	.ascii	"\0013%d: buf impl malloc fail : group %p buffer %p "
	.ascii	"size %u from %s\012\000"
.LC6:
	.ascii	"\0013%d: mpp_buffer_get invalid input: group %p buf"
	.ascii	"fer %p size %u from %s\012\000"
.LC7:
	.ascii	"\0013%d: mpp_buffer_put invalid input: buffer NULL "
	.ascii	"from %s\012\000"
.LC8:
	.ascii	"\0013%d: mpp_buffer_inc_ref invalid input: buffer N"
	.ascii	"ULL from %s\012\000"
.LC9:
	.ascii	"\0016%d: p->info.fd %d\000"
.LC10:
	.ascii	"\0013%d: mpp_buffer_get_fd invalid NULL input from "
	.ascii	"%s\012\000"
.LC11:
	.ascii	"fd >= 0\000"
.LC12:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC13:
	.ascii	"\0013%d: mpp_buffer_get_fd buffer %p fd %d from %s\012"
	.ascii	"\000"
.LC14:
	.ascii	"\0016%d: dma_buf_fd fd %d\000"
.LC15:
	.ascii	"\0013%d: mpp_buffer_get_dma invalid NULL input from"
	.ascii	" %s\012\000"
.LC16:
	.ascii	"\0013%d: mpp_buffer_get_fd buffer %p from %s\012\000"
.LC17:
	.ascii	"\0013%d: mpp_buffer_get_size invalid NULL input fro"
	.ascii	"m %s\012\000"
.LC18:
	.ascii	"\0013%d: mpp_buffer_get_size buffer %p ret zero siz"
	.ascii	"e from %s\012\000"
.LC19:
	.ascii	"\0013%d: mpp_buffer_get_index invalid NULL input fr"
	.ascii	"om %s\012\000"
.LC20:
	.ascii	"\0013%d: mpp_buffer_set_index invalid NULL input fr"
	.ascii	"om %s\012\000"
.LC21:
	.ascii	"\0013%d: mpp_buffer_get_offset invalid NULL input f"
	.ascii	"rom %s\012\000"
.LC22:
	.ascii	"\0013%d: mpp_buffer_set_offset invalid NULL input f"
	.ascii	"rom %s\012\000"
.LC23:
	.ascii	"\0013%d: mpp_buffer_info_get invalid input buffer %"
	.ascii	"p info %p from %s\012\000"
.LC24:
	.ascii	"\0013%d: mpp_buffer_get_mpi_buf_id invalid input bu"
	.ascii	"ffer %p from %s\012\000"
.LC25:
	.ascii	"\0013%d: get buf info fail\000"
.LC26:
	.ascii	"\0013%d: alloc buf start is no 4k align\000"
.LC27:
	.ascii	"i < page_count\000"
.LC28:
	.ascii	"\0013%d: mpp_buffer_read invalid input: buffer %p d"
	.ascii	"ata %p from %s\012\000"
.LC29:
	.ascii	"src != ((void *)0)\000"
.LC30:
	.ascii	"\0013%d: mpp_buffer_write invalid input: buffer %p "
	.ascii	"data %p from %s\012\000"
.LC31:
	.ascii	"dst != ((void *)0)\000"
.LC32:
	.ascii	"\0013%d: mpp_buffer_get_ptr invalid NULL input from"
	.ascii	" %s\012\000"
.LC33:
	.ascii	"p->info.ptr != ((void *)0)\000"
.LC34:
	.ascii	"\0013%d: mpp_buffer_get_ptr buffer %p ret NULL from"
	.ascii	" %s\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
