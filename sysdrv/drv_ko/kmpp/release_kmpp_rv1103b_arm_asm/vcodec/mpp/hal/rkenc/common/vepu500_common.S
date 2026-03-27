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
	.file	"vepu500_common.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vepu500_set_roi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_set_roi, %function
vepu500_set_roi:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	.pad #28
	sub	sp, sp, #28
	mov	r5, r1
	mov	r7, r2
	movs	r1, #0
	movs	r2, #128
	mov	r8, r3
	bl	memset
	cbz	r6, .L2
	cbnz	r5, .L3
.L2:
	ldr	r1, .L28
	mov	r3, r6
	ldr	r0, .L28+4
	movs	r2, #30
	str	r5, [sp]
.L27:
	bl	printk
	b	.L26
.L3:
	ldr	r3, [r5, #4]
	cmp	r3, #8
	bhi	.L5
	ldr	r9, .L28+28
	add	r2, r5, #24
	movs	r3, #0
.L6:
	ldr	r0, [r5, #4]
	lsl	r10, r3, #4
	sub	r4, r2, #16
	add	r1, r6, r10
	cmp	r0, r3
	bgt	.L14
.L4:
	movs	r0, #0
	b	.L1
.L5:
	movs	r2, #35
	ldr	r1, .L28
	ldr	r0, .L28+8
	bl	printk
.L26:
	mov	r0, #-1
.L1:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L14:
	ldrh	ip, [r2, #-16]
	ldrh	r0, [r2, #-12]
	add	r0, r0, ip
	cmp	r0, r7
	bgt	.L15
	ldrh	r0, [r2, #-14]
	ldrh	lr, [r2, #-10]
	add	r0, r0, lr
	cmp	r0, r8
	mov	r0, #-1
	it	le
	movle	r0, #0
.L7:
	ldrh	lr, [r2, #-8]
	ldrb	fp, [r2, #-1]	@ zero_extendqisi2
	cmp	lr, #1
	bhi	.L18
	ldrh	lr, [r2, #-4]
	cmp	lr, #7
	bhi	.L18
	ldrb	lr, [r2, #-2]	@ zero_extendqisi2
	cmp	lr, #1
	bhi	.L18
	cmp	fp, #2
	it	cs
	movcs	r0, #-1
.L8:
	ldrsh	lr, [r2, #-6]
	cmp	fp, #0
	beq	.L9
	cmp	lr, #51
	ble	.L11
.L10:
	movs	r2, #54
	ldr	r1, .L28
	ldr	r0, .L28+12
	bl	printk
	ldrh	r3, [r4]
	ldr	r1, .L28
	ldr	r0, .L28+16
	strd	r7, r8, [sp, #12]
	ldrh	r2, [r4, #6]
	str	r2, [sp, #8]
	ldrh	r2, [r4, #4]
	str	r2, [sp, #4]
	ldrh	r2, [r4, #2]
	str	r2, [sp]
	movs	r2, #56
	bl	printk
	ldrh	r2, [r4, #12]
	ldrh	r3, [r4, #8]
	ldr	r1, .L28
	ldr	r0, .L28+20
	str	r2, [sp]
	movs	r2, #58
	bl	printk
	ldrsh	r2, [r4, #10]
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	ldr	r1, .L28
	ldr	r0, .L28+24
	str	r2, [sp]
	movs	r2, #60
	b	.L27
.L15:
	mov	r0, #-1
	b	.L7
.L18:
	mov	r0, #-1
	b	.L8
.L9:
	add	lr, lr, #51
	uxth	lr, lr
	cmp	lr, #102
	bhi	.L10
.L11:
	cmp	r0, #0
	bne	.L10
	add	ip, ip, #15
	ldrh	r0, [r6, r10]
	asr	ip, ip, #4
	bfi	r0, ip, #0, #10
	strh	r0, [r6, r10]	@ movhi
	ldrh	r0, [r2, #-14]
	ldrh	r4, [r1, #2]
	adds	r0, r0, #15
	asrs	r0, r0, #4
	bfi	r4, r0, #0, #10
	strh	r4, [r1, #2]	@ movhi
	ldrh	r4, [r2, #-12]
	ldrh	r0, [r2, #-16]
	add	r0, r0, r4
	ldrh	r4, [r1, #4]
	adds	r0, r0, #15
	asrs	r0, r0, #4
	bfi	r4, r0, #0, #10
	strh	r4, [r1, #4]	@ movhi
	ldrh	r4, [r2, #-10]
	ldrh	r0, [r2, #-14]
	add	r0, r0, r4
	ldrh	r4, [r1, #6]
	adds	r0, r0, #15
	asrs	r0, r0, #4
	bfi	r4, r0, #0, #10
	ldrb	r0, [r1, #8]	@ zero_extendqisi2
	strh	r4, [r1, #6]	@ movhi
	ldrh	r4, [r2, #-6]
	bfi	r0, r4, #0, #7
	strb	r0, [r1, #8]
	ldrb	r4, [r2, #-1]	@ zero_extendqisi2
	bfi	r0, r4, #7, #1
	strb	r0, [r1, #8]
	ldrb	r0, [r1, #9]	@ zero_extendqisi2
	bic	r0, r0, #63
	orr	r0, r0, #63
	strb	r0, [r1, #9]
	ldrh	r0, [r2, #-8]
	cbz	r0, .L13
	ldr	r0, [r1, #12]
	bic	r0, r0, #15728640
	bic	r0, r0, #3840
	orr	r0, r0, r9
	str	r0, [r1, #12]
.L13:
	adds	r3, r3, #1
	adds	r2, r2, #16
	b	.L6
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	1048832
	.fnend
	.size	vepu500_set_roi, .-vepu500_set_roi
	.align	1
	.global	vepu500_set_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_set_osd, %function
vepu500_set_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r0
	ldr	r4, [r0, #8]
	.pad #40
	sub	sp, sp, #40
	cmp	r4, #0
	beq	.L42
	ldr	r6, [r4, #4]
	cmp	r6, #0
	beq	.L42
	cmp	r6, #8
	bls	.L32
	mov	r3, r6
	movs	r2, #97
	ldr	r1, .L43
	ldr	r0, .L43+4
	bl	printk
	ldr	r3, [r4, #4]
	cmp	r3, #8
	bls	.L37
	movs	r1, #98
	ldr	r3, .L43+8
	str	r1, [sp]
	ldr	r2, .L43+12
	ldr	r0, .L43+16
	bl	printk
.L37:
	mov	r0, #-1
	b	.L30
.L32:
	ldr	r5, [r0]
	adds	r4, r4, #148
	mov	r10, #0
	mov	r9, #36
	add	r7, r5, #24
.L34:
	ldr	r1, [r4, #-128]
	add	r0, sp, #12
	bl	vepu5xx_set_fmt
	mul	r0, r9, r10
	ldr	r1, [r4, #-140]
	adds	r2, r5, r0
	ldrb	r3, [r5, r0]	@ zero_extendqisi2
	bfi	r3, r1, #0, #1
	strb	r3, [r5, r0]
	ldr	r1, [r4, #-136]
	bfi	r3, r1, #6, #1
	strb	r3, [r5, r0]
	ldr	r1, [r4, #-132]
	bfi	r3, r1, #7, #1
	strb	r3, [r5, r0]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	bfi	r1, r3, #0, #4
	strb	r1, [r2, #1]
	ldr	r3, [r4, #-124]
	bfi	r1, r3, #5, #1
	strb	r1, [r2, #1]
	ldrh	r1, [r2, #4]
	ldr	r3, [r4, #-120]
	bfi	r1, r3, #0, #14
	strh	r1, [r2, #4]	@ movhi
	ldr	r3, [r4, #-116]
	ldr	r1, [r2, #4]
	bfi	r1, r3, #14, #14
	str	r1, [r2, #4]
	ldrh	r1, [r2, #8]
	ldr	r3, [r4, #-112]
	bfi	r1, r3, #0, #14
	strh	r1, [r2, #8]	@ movhi
	ldr	r3, [r4, #-108]
	ldr	r1, [r2, #8]
	bfi	r1, r3, #14, #14
	str	r1, [r2, #8]
	ldrb	r1, [r2, #7]	@ zero_extendqisi2
	ldr	r3, [r4, #-96]
	bfi	r1, r3, #4, #4
	strb	r1, [r2, #7]
	ldr	r1, [r2, #20]
	ldr	r3, [r4, #-104]
	bfi	r1, r3, #0, #17
	str	r1, [r2, #20]
	ldr	r3, [r4, #-100]
	ubfx	r1, r1, #24, #8
	bfi	r1, r3, #1, #1
	strb	r1, [r2, #23]
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	ldr	r3, [r4, #-56]
	bfi	r1, r3, #4, #1
	strb	r1, [r2, #1]
	ldrh	r1, [r2, #2]
	ldr	r3, [r4, #-48]
	bfi	r1, r3, #6, #8
	strh	r1, [r2, #2]	@ movhi
	ldr	r3, [r4, #-44]
	ubfx	r1, r1, #8, #8
	bfi	r1, r3, #6, #2
	strb	r1, [r2, #3]
	ldrb	r1, [r5, r0]	@ zero_extendqisi2
	ldr	r3, [r4, #-40]
	bfi	r1, r3, #5, #1
	strb	r1, [r5, r0]
	ldr	r1, [r4, #-36]
	add	r0, r2, #32
	ldrb	r3, [r2, #32]	@ zero_extendqisi2
	bfi	r3, r1, #0, #1
	strb	r3, [r2, #32]
	ldr	r1, [r4, #-32]
	bfi	r3, r1, #1, #7
	ldrb	r1, [r2, #33]	@ zero_extendqisi2
	strb	r3, [r2, #32]
	ldr	r3, [r4, #-28]
	bfi	r1, r3, #0, #6
	strb	r1, [r2, #33]
	ldr	r3, [r2, #32]
	ldr	r1, [r4, #-24]
	bfi	r3, r1, #14, #6
	str	r3, [r2, #32]
	ldr	r2, [r4, #-20]
	ubfx	r3, r3, #16, #16
	bfi	r3, r2, #4, #5
	strh	r3, [r0, #2]	@ movhi
	ldr	r1, [r4, #-12]
	cbz	r1, .L33
	movs	r2, #0
	ldr	r0, [r8, #4]
	bl	mpp_dev_get_mpi_ioaddress
	str	r0, [r7, #-12]
.L33:
	mov	r2, r4
	add	r10, r10, #1
	ldr	r3, [r2, #-8]!	@ unaligned
	cmp	r6, r10
	add	r4, r4, #140
	add	r7, r7, #36
	str	r3, [r7, #-36]	@ unaligned
	ldr	r3, [r2, #4]	@ unaligned
	str	r3, [r7, #-32]	@ unaligned
	bne	.L34
	ldr	r3, [r5, #288]
	and	r2, r3, #-134217728
	ldr	r3, .L43+20
	orrs	r3, r3, r2
	str	r3, [r5, #288]
	ldr	r3, [r5, #292]
	and	r2, r3, #-134217728
	ldr	r3, .L43+24
	orrs	r3, r3, r2
	str	r3, [r5, #292]
	ldr	r3, [r5, #296]
	and	r2, r3, #-134217728
	ldr	r3, .L43+28
	orrs	r3, r3, r2
	str	r3, [r5, #296]
	ldr	r3, [r5, #300]
	and	r3, r3, #-16777216
	orr	r3, r3, #8388608
	orr	r3, r3, #32768
	str	r3, [r5, #300]
.L42:
	movs	r0, #0
.L30:
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L44:
	.align	2
.L43:
	.word	.LANCHOR0+16
	.word	.LC6
	.word	.LANCHOR0+32
	.word	.LC7
	.word	.LC8
	.word	7679053
	.word	33773525
	.word	128920192
	.fnend
	.size	vepu500_set_osd, .-vepu500_set_osd
	.global	__aeabi_uidivmod
	.align	1
	.global	vepu500_set_jpeg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_set_jpeg_reg, %function
vepu500_set_jpeg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r0, #12]
	mov	r7, r0
	ldr	r4, [r0, #4]
	ldr	r10, [r0, #16]
	ldr	r8, [r5, #16]
	ldr	r9, [r5, #52]
	ldr	r3, [r8]
	mov	r0, r9
	str	r3, [sp, #8]
	ldr	r3, [r8, #4]
	str	r3, [sp]
	bl	mpp_frame_get_height
	ldr	r3, [sp]
	cmp	r0, r3
	bcs	.L76
	ldr	r3, [r8, #136]
	cbz	r3, .L91
	mov	r0, r9
	bl	mpp_frame_get_width
	str	r0, [sp, #8]
	mov	r0, r9
	bl	mpp_frame_get_height
	ldr	r3, [r7, #24]
	str	r0, [sp]
	cbz	r3, .L78
	movs	r1, #0
	ldr	r0, [r5, #28]
	str	r1, [r5, #48]
	bl	mpp_packet_set_length
.L78:
	movs	r3, #1
	b	.L91
.L76:
	movs	r3, #0
.L91:
	ldr	r6, [r7, #20]
	str	r3, [sp, #4]
	cmp	r6, #0
	bne	.L48
	mov	r2, #264
	ldr	r1, [r5, #56]
	ldr	r0, [r7]
	bl	mpp_dev_get_iova_address
	strd	r0, r0, [r4, #32]
	str	r0, [r4, #40]
	ldr	r3, [r10]
	ldr	r0, [r5, #52]
	str	r3, [sp, #12]
	bl	mpp_frame_get_hor_stride
	cmp	r0, #0
	beq	.L49
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_hor_stride
.L92:
	mov	fp, r0
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_ver_stride
	cmp	r0, #0
	beq	.L51
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_ver_stride
.L52:
	mul	fp, r0, fp
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_fmt
	tst	r0, #15728640
	beq	.L53
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_fbc_offset
	movs	r1, #172
	mov	fp, r0
	mov	r2, r0
	ldr	r0, .L95
	bl	printk
	cmp	fp, #0
	bne	.L54
.L48:
	ldr	r0, [r5, #28]
	bl	mpp_packet_get_length
	ldr	r3, [r5, #32]
	ldr	r2, [r3, #28]
	mov	fp, r0
	cmp	r2, #0
	bne	.L62
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L63
	movw	r2, #257
	ldr	r0, [r7]
	bl	mpp_dev_get_iova_address
	ldr	r3, [r5, #32]
	ldr	r3, [r3, #12]
	add	r0, r0, r3
	str	r0, [r4, #4]
.L64:
	ldr	r2, [r5, #32]
	ldr	r3, [r4, #4]
	ldr	r2, [r2, #24]
	subs	r1, r3, #1
	str	r3, [r4, #12]
	add	r3, r3, fp
	add	r2, r2, r1
	str	r3, [r4, #8]
	str	r2, [r4]
.L65:
	ldr	r3, [sp, #8]
	ldrh	r1, [r4, #64]
	add	r2, r3, #15
	ldr	r3, .L95+4
	and	r2, r3, r2, lsr #3
	subs	r2, r2, #1
	bfi	r1, r2, #0, #11
	ldrb	r2, [sp, #8]	@ zero_extendqisi2
	strh	r1, [r4, #64]	@ movhi
	add	r1, r2, #15
	bic	r1, r1, #15
	subs	r2, r1, r2
	ldrb	r1, [r4, #68]	@ zero_extendqisi2
	bfi	r1, r2, #0, #6
	ldr	r2, [sp]
	strb	r1, [r4, #68]
	adds	r2, r2, #15
	and	r3, r3, r2, lsr #3
	ldrh	r2, [r4, #66]
	subs	r3, r3, #1
	bfi	r2, r3, #0, #11
	strh	r2, [r4, #66]	@ movhi
	ldrb	r3, [sp]	@ zero_extendqisi2
	add	r2, r3, #15
	bic	r2, r2, #15
	subs	r3, r2, r3
	ldrb	r2, [r4, #70]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #70]
	ldr	r1, [r10]
	ldrb	r3, [r4, #72]	@ zero_extendqisi2
	and	r1, r1, #15
	bfi	r3, r1, #2, #4
	strb	r3, [r4, #72]
	ldr	r2, [r10, #4]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #72]
	ldr	r2, [r10, #8]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #72]
	ldrb	r3, [r4, #73]	@ zero_extendqisi2
	bic	r3, r3, #7
	strb	r3, [r4, #73]
	ldr	r3, [r8, #36]
	cmp	r3, #0
	ldrb	r3, [r4, #95]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #95]
	ldr	r2, [r8, #32]
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #95]
	ldr	r3, [r8, #8]
	ldrb	r2, [r4, #72]	@ zero_extendqisi2
	cbnz	r3, .L67
	ands	r0, r2, #60
	bne	.L68
	ldr	r3, [r8]
	lsls	r3, r3, #2
.L67:
	and	r2, r2, #52
	cmp	r2, #16
	itet	ne
	addne	r0, r3, r3, lsr #31
	moveq	r0, r3
	asrne	r0, r0, #1
	cmp	r1, #2
	bhi	.L72
	ldr	r2, [r4, #76]
	and	r1, r2, #-134217728
	ldr	r2, .L95+8
	orrs	r2, r2, r1
	str	r2, [r4, #76]
	ldr	r2, [r4, #80]
	and	r1, r2, #-134217728
	ldr	r2, .L95+12
	orrs	r2, r2, r1
	str	r2, [r4, #80]
	ldr	r2, [r4, #84]
	and	r1, r2, #-134217728
	ldr	r2, .L95+16
	orrs	r2, r2, r1
	str	r2, [r4, #84]
	ldr	r2, [r4, #88]
	lsrs	r2, r2, #21
	lsls	r2, r2, #21
	orr	r2, r2, #32768
	orr	r2, r2, #128
	str	r2, [r4, #88]
.L72:
	ldr	r2, [r4, #100]
	strh	r0, [r4, #104]	@ movhi
	bfi	r2, r3, #0, #21
	str	r2, [r4, #100]
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r3, [r4, #98]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #98]	@ movhi
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r3, [r4, #96]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #96]	@ movhi
	ldrh	r3, [r4, #108]
	bic	r3, r3, #816
	bic	r3, r3, #3
	strh	r3, [r4, #108]	@ movhi
	ldrh	r3, [r4, #112]
	bfc	r3, #0, #15
	strh	r3, [r4, #112]	@ movhi
	ldrh	r3, [r4, #116]
	bfc	r3, #0, #15
	strh	r3, [r4, #116]	@ movhi
	ldrh	r3, [r4, #120]
	bfc	r3, #0, #15
	strh	r3, [r4, #120]	@ movhi
	ldr	r3, [r4, #124]
	ldr	r2, [r8, #136]
	bfi	r3, r2, #0, #25
	str	r3, [r4, #124]
	ubfx	r3, r3, #24, #8
	bfc	r3, #1, #1
	strb	r3, [r4, #127]
	ldr	r2, [r7, #24]
	bfi	r3, r2, #2, #3
	strb	r3, [r4, #127]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	beq	.L73
	mov	r0, r9
	bl	mpp_frame_get_eos
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L74
	orr	r3, r3, #32
	strb	r3, [r4, #127]
	movs	r3, #0
.L94:
	str	r3, [r7, #24]
.L75:
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	movs	r0, #0
	orr	r3, r3, #128
	strb	r3, [r4, #127]
	ldr	r3, [r4, #128]
	and	r3, r3, #-1073741824
	str	r3, [r4, #128]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L49:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_width
	b	.L92
.L51:
	ldr	r0, [r5, #52]
	bl	mpp_frame_get_height
	b	.L52
.L53:
	ldr	r3, [sp, #12]
	cmp	r3, #9
	bhi	.L56
	adr	r2, .L57
	ldr	pc, [r2, r3, lsl #2]
	.p2align 2
.L57:
	.word	.L48+1
	.word	.L48+1
	.word	.L48+1
	.word	.L56+1
	.word	.L79+1
	.word	.L60+1
	.word	.L79+1
	.word	.L93+1
	.word	.L48+1
	.word	.L48+1
	.p2align 1
.L60:
	add	r6, fp, fp, lsl #1
	lsrs	r6, r6, #1
.L59:
	cmp	fp, #0
	beq	.L61
.L54:
	ldr	r0, [r4, #36]
	add	r0, r0, fp
	str	r0, [r4, #36]
.L61:
	cmp	r6, #0
	beq	.L48
	ldr	r3, [r4, #40]
	add	r6, r6, r3
	str	r6, [r4, #40]
	b	.L48
.L56:
	ldr	r2, [sp, #12]
	movs	r1, #205
	ldr	r0, .L95+20
	bl	printk
.L93:
	add	r6, fp, fp, lsl #2
	lsrs	r6, r6, #2
	b	.L59
.L79:
	mov	r6, fp
	b	.L59
.L63:
	ldr	r2, [r3, #4]
	ldr	r3, [r3, #12]
	add	r3, r3, r2
	str	r3, [r4, #4]
	b	.L64
.L62:
	ldr	r1, .L95+24
	ldr	r0, [r3]
	bl	mpp_buffer_get_size_with_caller
	ldr	r3, [r5, #32]
	mov	r6, r0
	ldr	r0, [r3, #12]
	mov	r1, r6
	str	r3, [sp, #12]
	add	r0, r0, fp
	bl	__aeabi_uidivmod
	movw	r2, #257
	ldr	r0, [r7]
	ldr	r3, [sp, #12]
	mov	fp, r1
	ldr	r1, [r3]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #4]
	add	r3, r0, fp
	str	r3, [r4, #8]
	ldr	r3, [r5, #32]
	ldr	r3, [r3, #16]
	add	r3, r3, r0
	add	r0, r0, r6
	str	r3, [r4, #12]
	str	r0, [r4]
	b	.L65
.L68:
	cmp	r0, #4
	bne	.L69
	ldr	r3, [r8]
	add	r3, r3, r3, lsl #1
	b	.L67
.L69:
	cmp	r0, #8
	beq	.L70
	and	r0, r2, #56
	cmp	r0, #32
	bne	.L67
.L70:
	ldr	r3, [r8]
	lsls	r3, r3, #1
	b	.L67
.L74:
	bfi	r3, r0, #5, #1
	strb	r3, [r4, #127]
	ldr	r3, [r7, #24]
	adds	r3, r3, #1
	b	.L94
.L96:
	.align	2
.L95:
	.word	.LC9
	.word	536870910
	.word	20261917
	.word	123164288
	.word	33762283
	.word	.LC10
	.word	.LANCHOR0+48
.L73:
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	orr	r3, r3, #32
	strb	r3, [r4, #127]
	b	.L75
	.fnend
	.size	vepu500_set_jpeg_reg, .-vepu500_set_jpeg_reg
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.11178, %object
	.size	__func__.11178, 16
__func__.11178:
	.ascii	"vepu500_set_roi\000"
	.type	__func__.11192, %object
	.size	__func__.11192, 16
__func__.11192:
	.ascii	"vepu500_set_osd\000"
	.type	__FUNCTION__.11193, %object
	.size	__FUNCTION__.11193, 16
__FUNCTION__.11193:
	.ascii	"vepu500_set_osd\000"
	.type	__FUNCTION__.11241, %object
	.size	__FUNCTION__.11241, 21
__FUNCTION__.11241:
	.ascii	"vepu500_set_jpeg_reg\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: invalid buf %p roi %p\012\000"
.LC1:
	.ascii	"\0013%s:%d: invalid region number %d\012\000"
.LC2:
	.ascii	"\0013%s:%d: region %d invalid param:\012\000"
.LC3:
	.ascii	"\0013%s:%d: position [%d:%d:%d:%d] vs [%d:%d]\012\000"
.LC4:
	.ascii	"\0013%s:%d: force intra %d qp area index %d\012\000"
.LC5:
	.ascii	"\0013%s:%d: abs qp mode %d value %d\012\000"
.LC6:
	.ascii	"\0013%s:%d: do NOT support more than 8 regions inva"
	.ascii	"lid num %d\012\000"
.LC7:
	.ascii	"osd->num_region <= 8\000"
.LC8:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC9:
	.ascii	"\0016%d: fbc case u_offset = %d\000"
.LC10:
	.ascii	"\0013%d: unknown color space: %d\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
