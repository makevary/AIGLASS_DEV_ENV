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
	.file	"vepu5xx_common.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vepu5xx_set_fmt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu5xx_set_fmt, %function
vepu5xx_set_fmt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ubfx	r4, r1, #0, #20
	ands	r1, r1, #983040
	mov	r5, r0
	bne	.L2
	cmp	r4, #18
	bhi	.L3
	ldr	r3, .L12
	movs	r2, #28
	mla	r2, r2, r4, r3
.L4:
	ldr	r3, [r2]
	cmp	r3, #16
	beq	.L5
	mov	r3, r2
	mov	r2, r5
	add	r5, r3, #24
.L6:
	mov	r4, r3
	adds	r2, r2, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, r5
	str	r0, [r2, #-8]	@ unaligned
	mov	r3, r4
	str	r1, [r2, #-4]	@ unaligned
	bne	.L6
	ldr	r0, [r4]
	str	r0, [r2]	@ unaligned
	movs	r0, #0
.L1:
	pop	{r3, r4, r5, pc}
.L2:
	cmp	r1, #65536
	bne	.L3
	ldr	r3, .L12+4
	cmp	r4, r3
	bhi	.L3
	ldr	r3, .L12+8
	sub	r2, r4, #65536
	movs	r1, #28
	mla	r2, r1, r2, r3
	b	.L4
.L3:
	movs	r2, #24
	movs	r1, #0
	adds	r0, r5, #4
	bl	memset
	movs	r3, #16
	str	r3, [r5]
.L5:
	mov	r3, r4
	mov	r2, #366
	ldr	r1, .L12+12
	ldr	r0, .L12+16
	bl	printk
	movs	r3, #16
	mov	r0, #-1
	str	r3, [r5]
	b	.L1
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	65551
	.word	.LANCHOR0+532
	.word	.LANCHOR1
	.word	.LC0
	.fnend
	.size	vepu5xx_set_fmt, .-vepu5xx_set_fmt
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.8885, %object
	.size	__func__.8885, 16
__func__.8885:
	.ascii	"vepu5xx_set_fmt\000"
	.type	zeros, %object
	.size	zeros, 36
zeros:
	.space	36
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vepu5xx_yuv_cfg, %object
	.size	vepu5xx_yuv_cfg, 532
vepu5xx_yuv_cfg:
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	4
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	7
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	6
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	5
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	4
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	8
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	8
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	9
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	9
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	10
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	12
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	13
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	11
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	15
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.type	vepu5xx_rgb_cfg, %object
	.size	vepu5xx_rgb_cfg, 448
vepu5xx_rgb_cfg:
	.word	2
	.word	0
	.word	1
	.word	0
	.word	1
	.word	zeros
	.word	zeros
	.word	2
	.word	0
	.word	0
	.word	0
	.word	1
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	1
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	16
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	0
	.word	1
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	0
	.word	1
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	0
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	14
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.word	3
	.word	0
	.word	1
	.word	0
	.word	0
	.word	zeros
	.word	zeros
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: unsupport frame format %x\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
