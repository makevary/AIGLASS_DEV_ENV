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
	.file	"mpp_stream_ring_buf.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	ring_buf_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_init, %function
ring_buf_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	mov	r6, r2
	mov	r4, r0
	cbz	r0, .L6
	ldr	r5, [r0, #28]
	cbnz	r5, .L6
	cmp	r2, #0
	strd	r5, r5, [r0]
	ldr	r1, .L10
	mov	r0, r7
	it	eq
	moveq	r6, #4
	bl	mpp_buffer_get_size_with_caller
	ldr	r1, .L10
	str	r5, [r4, #44]
	strd	r0, r5, [r4, #8]
	mov	r0, r7
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L10
	strd	r0, r7, [r4, #16]
	mov	r0, r7
	bl	mpp_buffer_get_mpi_buf_id_with_caller
	movs	r2, #1
	mov	r3, #10240
	strd	r2, r3, [r4, #28]
	ldr	r2, .L10+4
	ldr	r2, [r2]
	lsls	r1, r2, #31
	str	r0, [r4, #24]
	bpl	.L4
	strd	r6, r3, [sp]
	movs	r2, #47
	ldr	r3, [r4, #8]
	ldr	r1, .L10+8
	ldr	r0, .L10+12
	bl	printk
.L4:
	ldr	r0, [r4, #16]
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
.L1:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L6:
	mov	r0, #-1
	b	.L1
.L11:
	.align	2
.L10:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LANCHOR0+14
	.word	.LC0
	.fnend
	.size	ring_buf_init, .-ring_buf_init
	.align	1
	.global	ring_buf_get_use_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_get_use_size, %function
ring_buf_get_use_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L12
	ldrd	r2, r3, [r0]
	cmp	r2, r3
	bls	.L14
	ldr	r0, [r0, #8]
	add	r0, r0, r3
	subs	r0, r0, r2
	bx	lr
.L14:
	subs	r0, r3, r2
.L12:
	bx	lr
	.fnend
	.size	ring_buf_get_use_size, .-ring_buf_get_use_size
	.global	__aeabi_uidivmod
	.align	1
	.global	ring_buf_put_use
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_put_use, %function
ring_buf_put_use:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r1
	.pad #20
	sub	sp, sp, #20
	mov	r4, r0
	cmp	r0, #0
	beq	.L31
	cmp	r1, #0
	beq	.L31
	ldr	r2, [r0, #20]
	ldr	r3, [r1]
	cmp	r2, r3
	bne	.L31
	ldr	fp, [r1, #20]
	cmp	fp, #0
	beq	.L31
	ldr	r9, [r1, #12]
	ldrd	r6, r8, [r0]
	ldr	r1, [r0, #8]
	add	r0, fp, r9
	bl	__aeabi_uidivmod
	cmp	r8, r6
	mov	r5, r1
	sub	r7, r1, r6
	bcc	.L18
	cmp	r8, r9
	bls	.L19
	cmp	r6, r9
	bcc	.L20
.L19:
	cmp	r6, r5
	bls	.L21
.L26:
	ldr	r3, [r4, #8]
	add	r7, r7, r3
.L22:
	ldr	r2, [r4, #44]
	str	r7, [r4, #12]
	cmp	r2, r7
	ldr	r2, .L34
	it	cc
	strcc	r7, [r4, #44]
	str	r5, [r4, #4]
	ldr	r0, [r2]
	str	r5, [r4, #40]
	ands	r0, r0, #1
	beq	.L16
	strd	r5, r7, [sp, #4]
	movs	r2, #106
	ldr	r3, [r4]
	ldr	r1, .L34+4
	ldr	r0, .L34+8
	str	r3, [sp]
	mov	r3, r4
	bl	printk
	movs	r0, #0
.L16:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L21:
	cmp	r8, r5
	bls	.L22
.L20:
	ldr	r3, [r10, #24]
	mov	r2, r6
	movs	r1, #83
	str	r9, [sp]
	strd	fp, r3, [sp, #4]
	mov	r3, r8
.L33:
	ldr	r0, .L34+12
	bl	printk
	cmp	r6, r5
	bls	.L22
	b	.L26
.L18:
	cmp	r6, r9
	bls	.L25
	cmp	r8, r9
	bhi	.L25
	cmp	r8, r1
	bhi	.L25
	cmp	r6, r1
	bhi	.L26
.L25:
	ldr	r3, [r10, #24]
	mov	r2, r6
	str	r9, [sp]
	movs	r1, #90
	strd	fp, r3, [sp, #4]
	mov	r3, r8
	b	.L33
.L31:
	mov	r0, #-1
	b	.L16
.L35:
	.align	2
.L34:
	.word	.LANCHOR1
	.word	.LANCHOR0+28
	.word	.LC2
	.word	.LC1
	.fnend
	.size	ring_buf_put_use, .-ring_buf_put_use
	.align	1
	.global	ring_buf_put_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_put_free, %function
ring_buf_put_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	.pad #20
	sub	sp, sp, #20
	cmp	r0, #0
	beq	.L48
	cmp	r1, #0
	beq	.L48
	ldr	r2, [r0, #20]
	ldr	r3, [r1]
	cmp	r2, r3
	bne	.L48
	ldr	r9, [r1, #20]
	cmp	r9, #0
	beq	.L48
	ldr	r8, [r1, #12]
	ldrd	r7, r4, [r0]
	ldr	r1, [r0, #8]
	add	r0, r9, r8
	bl	__aeabi_uidivmod
	cmp	r4, r7
	mov	r6, r1
	bhi	.L38
	cmp	r7, r1
	bls	.L39
	cmp	r4, r1
	bcc	.L40
.L39:
	cmp	r4, r8
	bhi	.L41
	cmp	r7, r8
	bls	.L41
.L40:
	mov	r3, r4
	mov	r2, r7
	movs	r1, #127
	strd	r8, r9, [sp]
.L50:
	ldr	r0, .L51
	bl	printk
.L41:
	cmp	r4, r6
	str	r6, [r5]
	str	r6, [r5, #36]
	itt	cc
	ldrcc	r3, [r5, #8]
	addcc	r4, r4, r3
	ldr	r3, .L51+4
	subs	r4, r4, r6
	str	r4, [r5, #12]
	ldr	r0, [r3]
	ands	r0, r0, #1
	beq	.L36
	str	r4, [sp, #8]
	movs	r2, #145
	ldr	r3, [r5, #4]
	ldr	r1, .L51+8
	ldr	r0, .L51+12
	strd	r6, r3, [sp]
	mov	r3, r5
	bl	printk
	movs	r0, #0
.L36:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L38:
	cmp	r7, r8
	bhi	.L42
	cmp	r4, r8
	bls	.L42
	cmp	r7, r1
	bhi	.L42
	cmp	r4, r1
	bcs	.L41
.L42:
	strd	r8, r9, [sp]
	mov	r3, r4
	mov	r2, r7
	movs	r1, #133
	b	.L50
.L48:
	mov	r0, #-1
	b	.L36
.L52:
	.align	2
.L51:
	.word	.LC3
	.word	.LANCHOR1
	.word	.LANCHOR0+45
	.word	.LC4
	.fnend
	.size	ring_buf_put_free, .-ring_buf_put_free
	.align	1
	.global	ring_buf_get_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_get_free, %function
ring_buf_get_free:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r1
	.pad #20
	sub	sp, sp, #20
	mov	r9, r2
	mov	r8, r3
	mov	r4, r0
	cbnz	r0, .L54
.L56:
	mov	r0, #-1
.L53:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L54:
	cmp	r1, #0
	beq	.L56
	ldrd	r7, r5, [r0]
	cbnz	r3, .L57
	cmp	r5, r7
	ite	ne
	ldrne	r8, [r0, #32]
	moveq	r8, #10240
.L57:
	ldr	r3, [r4, #24]
	str	r3, [r6, #4]
	movs	r3, #1
	str	r3, [r6, #28]
	ldr	r3, .L72
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L58
	ldr	r3, [r4, #12]
	movs	r2, #167
	ldr	r1, .L72+4
	ldr	r0, .L72+8
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]
	str	r3, [sp, #4]
	ldr	r3, [r4]
	str	r3, [sp]
	mov	r3, r4
	bl	printk
.L58:
	add	r3, r9, #-1
	ands	r3, r3, r5
	it	ne
	subne	r3, r9, r3
	cmp	r5, r7
	rsb	r9, r9, #0
	and	r2, r9, r7
	bcs	.L60
	add	r8, r8, r5
	add	r8, r8, r3
	cmp	r7, r8
	bls	.L56
	adds	r0, r5, r3
	str	r0, [r6, #12]
	ldr	r1, [r4, #16]
	subs	r5, r7, r5
	str	r2, [r6, #16]
	subs	r5, r5, r3
	add	r1, r1, r0
	str	r1, [r6, #8]
	ldr	r2, [r4, #20]
	str	r5, [r6, #24]
	str	r2, [r6]
.L71:
	mov	r3, #10240
	movs	r0, #0
	str	r3, [r4, #32]
	b	.L53
.L60:
	add	r5, r5, r3
	ldr	r3, [r4, #8]
	add	r3, r3, r7
	subs	r3, r3, r5
	cmp	r3, r8
	bls	.L56
	str	r5, [r6, #12]
	ldr	r3, [r4, #16]
	add	r3, r3, r5
	str	r3, [r6, #8]
	ldr	r3, [r4, #8]
	str	r2, [r6, #16]
	add	r7, r7, r3
	subs	r5, r7, r5
	str	r5, [r6, #24]
	ldr	r3, [r4, #20]
	str	r3, [r6]
	b	.L71
.L73:
	.align	2
.L72:
	.word	.LANCHOR1
	.word	.LANCHOR0+63
	.word	.LC5
	.fnend
	.size	ring_buf_get_free, .-ring_buf_get_free
	.align	1
	.global	ring_buf_update_min_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	ring_buf_update_min_size, %function
ring_buf_update_min_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L76
	str	r1, [r0, #32]
	movs	r0, #0
	bx	lr
.L76:
	mov	r0, #-1
	bx	lr
	.fnend
	.size	ring_buf_update_min_size, .-ring_buf_update_min_size
	.global	ring_buf_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.19908, %object
	.size	__FUNCTION__.19908, 14
__FUNCTION__.19908:
	.ascii	"ring_buf_init\000"
	.type	__func__.19909, %object
	.size	__func__.19909, 14
__func__.19909:
	.ascii	"ring_buf_init\000"
	.type	__func__.19921, %object
	.size	__func__.19921, 17
__func__.19921:
	.ascii	"ring_buf_put_use\000"
	.type	__func__.19930, %object
	.size	__func__.19930, 18
__func__.19930:
	.ascii	"ring_buf_put_free\000"
	.type	__func__.19943, %object
	.size	__func__.19943, 18
__func__.19943:
	.ascii	"ring_buf_get_free\000"
	.type	__param_str_ring_buf_debug, %object
	.size	__param_str_ring_buf_debug, 26
__param_str_ring_buf_debug:
	.ascii	"mpp_vcodec.ring_buf_debug\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	ring_buf_debug, %object
	.size	ring_buf_debug, 4
ring_buf_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_ring_buf_debug163, %object
	.size	__UNIQUE_ID_ring_buf_debug163, 63
__UNIQUE_ID_ring_buf_debug163:
	.ascii	"mpp_vcodec.parm=ring_buf_debug:bits ring_buf debug "
	.ascii	"information\000"
	.type	__UNIQUE_ID_ring_buf_debugtype162, %object
	.size	__UNIQUE_ID_ring_buf_debugtype162, 40
__UNIQUE_ID_ring_buf_debugtype162:
	.ascii	"mpp_vcodec.parmtype=ring_buf_debug:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%s:%d: ctx->len = %d, max_strm_cnt = %d, ctx->"
	.ascii	"min_buf_size = %d\000"
.LC1:
	.ascii	"\0013%d: INVALID param: r_pos=%x, w_pos=%x, start=%"
	.ascii	"x, size=%x, \011\011\011    buf_len = %x\012\000"
.LC2:
	.ascii	"\0016%s:%d:  pool %p use update ctx->r_pos %d ctx->"
	.ascii	"w_pos %d ctx->use_len %d\012\000"
.LC3:
	.ascii	"\0013%d: INVALID param: r_pos=%x, w_pos=%x, start=%"
	.ascii	"x, size=%x\012\000"
.LC4:
	.ascii	"\0016%s:%d:  pool %p free update ctx->r_pos %d ctx-"
	.ascii	">w_pos %d ctx->use_len %d \012\000"
.LC5:
	.ascii	"\0016%s:%d: get free pool %p ctx->r_pos %d ctx->w_p"
	.ascii	"os %d ctx->use_len %d\012\000"
	.section	__param,"a"
	.align	2
	.type	__param_ring_buf_debug, %object
	.size	__param_ring_buf_debug, 20
__param_ring_buf_debug:
	.word	__param_str_ring_buf_debug
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	ring_buf_debug
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
