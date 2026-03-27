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
	.file	"hal_jpege_vepu500.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	hal_jpege_v500_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_start, %function
hal_jpege_v500_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r2, [r3]
	.pad #24
	sub	sp, sp, #24
	mov	r4, r1
	ldrd	r6, r7, [r0, #68]
	tst	r2, #1
	mov	r8, r3
	beq	.L2
	mov	r3, #460
	ldr	r1, .L24+4
	mov	r2, r3
	ldr	r0, .L24+8
	bl	printk
.L2:
	ldr	r3, [r4, #64]
	cbz	r3, .L3
	mov	r2, #464
	ldr	r1, .L24+4
	ldr	r0, .L24+12
	mov	r4, #-1
	bl	printk
.L1:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L3:
	movs	r2, #100
	mov	r1, r3
	strd	r2, r3, [sp, #4]
	mov	r2, sp
	ldr	r0, [r5, #64]
	str	r6, [sp]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L5
	mov	r3, r0
	mov	r2, #474
.L22:
	ldr	r1, .L24+4
	ldr	r0, .L24+16
.L21:
	bl	printk
	b	.L1
.L5:
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #64]
	add	r3, r6, #100
	mov	lr, #528
	str	r3, [sp]
	mov	r3, #768
	strd	lr, r3, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L6
	mov	r3, r0
	mov	r2, #484
	b	.L22
.L6:
	mov	r1, r0
	mov	r2, sp
	ldr	r0, [r5, #64]
	add	r3, r6, #628
	mov	ip, #384
	str	r3, [sp]
	movw	r3, #9616
	strd	ip, r3, [sp, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L7
	mov	r3, r0
	mov	r2, #494
	b	.L22
.L7:
	mov	r0, #304
	movw	r3, #12600
	mov	r1, r4
	strd	r0, r3, [sp, #4]
	mov	r2, sp
	ldr	r0, [r5, #64]
	add	r6, r6, #1012
	str	r6, [sp]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L8
	mov	r3, r0
	mov	r2, #504
	b	.L22
.L8:
	movs	r1, #4
	movs	r3, #44
	add	r2, sp, #12
	strd	r1, r3, [sp, #16]
	ldr	r0, [r5, #64]
	movs	r1, #1
	str	r7, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L9
	mov	r3, r0
	movw	r2, #514
.L23:
	ldr	r1, .L24+4
	ldr	r0, .L24+20
	b	.L21
.L9:
	mov	r2, #592
	mov	r3, #16384
	movs	r1, #1
	strd	r2, r3, [sp, #16]
	ldr	r0, [r5, #64]
	add	r2, sp, #12
	adds	r7, r7, #4
	str	r7, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L10
	mov	r3, r0
	mov	r2, #524
	b	.L23
.L10:
	mov	r2, r0
	movs	r1, #2
	ldr	r0, [r5, #64]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L11
	mov	r3, r0
	movw	r2, #530
	ldr	r1, .L24+4
	ldr	r0, .L24+24
	bl	printk
.L11:
	movs	r3, #1
	str	r3, [r5, #300]
	ldr	r3, [r8]
	lsls	r3, r3, #31
	bpl	.L1
	mov	r3, #532
	ldr	r1, .L24+4
	mov	r2, r3
	ldr	r0, .L24+28
	b	.L21
.L25:
	.align	2
.L24:
	.word	hal_jpege_debug
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_start, .-hal_jpege_v500_start
	.align	1
	.global	hal_jpege_v500_wait
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_wait, %function
hal_jpege_v500_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L36
	mov	r6, r1
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L27
	movw	r3, #587
	ldr	r1, .L36+4
	mov	r2, r3
	ldr	r0, .L36+8
	bl	printk
.L27:
	ldr	r3, [r6, #64]
	cbz	r3, .L28
	movw	r2, #591
	ldr	r1, .L36+4
	ldr	r0, .L36+12
	mov	r5, #-1
	bl	printk
.L26:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L28:
	mov	r2, r3
	ldr	r0, [r5, #64]
	movs	r1, #3
	bl	mpp_dev_ioctl
	ldr	r3, [r4]
	lsls	r3, r3, #31
	mov	r5, r0
	bpl	.L26
	movw	r3, #597
	ldr	r1, .L36+4
	mov	r2, r3
	ldr	r0, .L36+16
	bl	printk
	b	.L26
.L37:
	.align	2
.L36:
	.word	hal_jpege_debug
	.word	.LANCHOR0+21
	.word	.LC0
	.word	.LC6
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_wait, .-hal_jpege_v500_wait
	.align	1
	.global	hal_jpege_v500_get_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_get_task, %function
hal_jpege_v500_get_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r7, .L54
	mov	r4, r1
	ldr	r6, [r1, #16]
	ldr	r3, [r7]
	lsls	r2, r3, #31
	bpl	.L39
	movw	r3, #607
	ldr	r1, .L54+4
	mov	r2, r3
	ldr	r0, .L54+8
	bl	printk
.L39:
	movs	r2, #140
	mov	r1, r6
	add	r0, r5, #156
	bl	memcpy
	ldr	r3, [r5, #80]
	str	r3, [r5, #84]
	ldr	r3, [r4, #68]
	str	r3, [r5, #296]
	ldr	r0, [r4, #52]
	bl	mpp_frame_get_osd
	ldr	r3, [r5, #108]
	str	r0, [r5, #100]
	ldr	r3, [r3, #108]
	cmp	r3, #2
	beq	.L40
	ldr	r3, [r5, #304]
	ldr	r2, [r4, #4]
	cbnz	r3, .L41
	ldr	r3, [r6, #52]
	cbz	r3, .L44
	rsb	r3, r3, #100
.L42:
	str	r3, [r2, #172]
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #60]
	rsb	r3, r3, #100
	str	r3, [r2, #180]
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #56]
	rsb	r3, r3, #100
	str	r3, [r2, #176]
	ldr	r2, [r4, #4]
	ldrb	r3, [r2, #152]	@ zero_extendqisi2
	orr	r3, r3, #16
	strb	r3, [r2, #152]
.L40:
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L43
	movw	r3, #627
	ldr	r1, .L54+4
	mov	r2, r3
	ldr	r0, .L54+12
	bl	printk
.L43:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L44:
	movs	r3, #80
	b	.L42
.L41:
	ldr	r3, [r5, #316]
	str	r3, [r2, #172]
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #60]
	rsb	r3, r3, #100
	str	r3, [r2, #180]
	ldr	r2, [r4, #4]
	ldr	r3, [r6, #56]
	rsb	r3, r3, #100
	str	r3, [r2, #176]
	b	.L40
.L55:
	.align	2
.L54:
	.word	hal_jpege_debug
	.word	.LANCHOR0+41
	.word	.LC0
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_get_task, .-hal_jpege_v500_get_task
	.align	1
	.global	hal_jpege_v500_ret_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_ret_task, %function
hal_jpege_v500_ret_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	ldr	r4, .L128
	mov	r6, r1
	ldr	r8, [r1, #4]
	ldr	r9, [r0, #72]
	ldr	r3, [r4]
	lsls	r5, r3, #31
	bpl	.L57
	movw	r3, #639
	ldr	r1, .L128+4
	mov	r2, r3
	ldr	r0, .L128+8
	bl	printk
.L57:
	ldr	r3, [r7, #72]
	ldr	r5, [r3]
	lsls	r0, r5, #30
	bpl	.L58
	ldr	r3, [r4]
	lsls	r1, r3, #29
	bpl	.L58
	movw	r2, #545
	ldr	r1, .L128+12
	ldr	r0, .L128+16
	bl	printk
.L58:
	lsls	r2, r5, #31
	bpl	.L59
	ldr	r3, [r4]
	lsls	r3, r3, #29
	bpl	.L59
	mov	r2, #548
	ldr	r1, .L128+12
	ldr	r0, .L128+20
	bl	printk
.L59:
	lsls	r0, r5, #28
	bpl	.L60
	ldr	r3, [r4]
	lsls	r1, r3, #29
	bpl	.L60
	movw	r2, #551
	ldr	r1, .L128+12
	ldr	r0, .L128+24
	bl	printk
.L60:
	lsls	r2, r5, #29
	bpl	.L61
	ldr	r3, [r4]
	lsls	r3, r3, #29
	bpl	.L61
	movw	r2, #554
	ldr	r1, .L128+12
	ldr	r0, .L128+28
	bl	printk
.L61:
	lsls	r0, r5, #27
	bpl	.L62
	ldr	r3, [r4]
	lsls	r1, r3, #22
	bmi	.L63
.L126:
	mvn	r0, #100
.L56:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L63:
	ldr	r1, .L128+12
	movw	r2, #557
	ldr	r0, .L128+32
.L127:
	bl	printk
	b	.L126
.L62:
	lsls	r2, r5, #26
	bpl	.L65
	ldr	r3, [r4]
	lsls	r3, r3, #22
	bpl	.L65
	movw	r2, #562
	ldr	r1, .L128+12
	ldr	r0, .L128+36
	bl	printk
.L65:
	lsls	r0, r5, #25
	bpl	.L66
	ldr	r3, [r4]
	lsls	r1, r3, #22
	bpl	.L66
	movw	r2, #565
	ldr	r1, .L128+12
	ldr	r0, .L128+40
	bl	printk
.L66:
	lsls	r2, r5, #24
	bpl	.L67
	ldr	r3, [r4]
	lsls	r3, r3, #22
	bpl	.L67
	mov	r2, #568
	ldr	r1, .L128+12
	ldr	r0, .L128+44
	bl	printk
.L67:
	lsls	r0, r5, #23
	bpl	.L68
	ldr	r3, [r4]
	lsls	r1, r3, #22
	bpl	.L68
	movw	r2, #571
	ldr	r1, .L128+12
	ldr	r0, .L128+48
	bl	printk
.L68:
	lsls	r2, r5, #18
	bpl	.L69
	ldr	r3, [r4]
	lsls	r3, r3, #22
	bpl	.L126
	movw	r2, #574
	ldr	r1, .L128+12
	ldr	r0, .L128+52
	b	.L127
.L69:
	ldr	r2, [r9, #104]
	ldr	r3, [r6, #44]
	add	r3, r3, r2
	str	r3, [r6, #44]
	ldr	r3, [r6, #4]
	ldr	r3, [r3, #172]
	str	r3, [r7, #316]
	ldrd	r3, r2, [r6, #44]
	add	r2, r2, r3
	lsls	r3, r3, #3
	str	r2, [r6, #48]
	str	r3, [r8, #184]
	ldr	r3, [r8, #172]
	str	r3, [r8, #188]
	ldr	r5, [r6, #80]
	cmp	r5, #0
	bne	.L126
	ldr	r0, [r4]
	str	r5, [r7, #300]
	ands	r0, r0, #1
	beq	.L56
	movw	r3, #657
	ldr	r1, .L128+4
	mov	r2, r3
	ldr	r0, .L128+56
	bl	printk
	mov	r0, r5
	b	.L56
.L129:
	.align	2
.L128:
	.word	hal_jpege_debug
	.word	.LANCHOR0+65
	.word	.LC0
	.word	.LANCHOR0+89
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_ret_task, .-hal_jpege_v500_ret_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_prepare, %function
hal_jpege_v500_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L139
	ldr	r6, [r0, #124]
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L131
	mov	r3, r0
	movs	r2, #192
	ldr	r1, .L139+4
	ldr	r0, .L139+8
	bl	printk
.L131:
	ldr	r3, [r4, #108]
	mov	r0, r6
	ldr	r1, [r3, #36]
	bl	vepu5xx_set_fmt
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L132
	mov	r3, r4
	movs	r2, #194
	ldr	r1, .L139+4
	ldr	r0, .L139+12
	bl	printk
.L132:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L140:
	.align	2
.L139:
	.word	hal_jpege_debug
	.word	.LANCHOR0+120
	.word	.LC17
	.word	.LC18
	.fnend
	.size	hal_jpege_v500_prepare, .-hal_jpege_v500_prepare
	.global	__aeabi_idiv
	.align	1
	.global	hal_jpege_vepu_rc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_vepu_rc, %function
hal_jpege_vepu_rc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r2, [r1, #4]
	ldr	r1, [r0, #316]
	ldr	r3, [r2, #172]
	cmp	r3, r1
	beq	.L142
	ldr	r1, .L155
	rsb	r3, r3, #100
	str	r3, [r0, #304]
	ldr	r1, [r1]
	lsls	r1, r1, #27
	bpl	.L143
	ldr	r2, [r2, #172]
	ldr	r1, .L155+4
	ldr	r0, .L155+8
	str	r2, [sp]
	movs	r2, #85
	bl	printk
.L143:
	ldr	r1, [r4, #304]
	cmp	r1, #49
	bgt	.L144
	movw	r0, #5000
	bl	__aeabi_idiv
.L145:
	ldr	r5, .L155+12
	movs	r2, #0
	ldr	r1, .L155+16
	ldr	ip, .L155+20
.L148:
	ldrb	lr, [r5], #1	@ zero_extendqisi2
	ldrb	r3, [r1], #1	@ zero_extendqisi2
	mul	lr, r0, lr
	muls	r3, r0, r3
	add	lr, lr, #50
	smull	r6, r7, lr, ip
	adds	r3, r3, #50
	asr	lr, lr, #31
	rsb	lr, lr, r7, asr #5
	smull	r6, r7, r3, ip
	sxth	lr, lr
	asrs	r3, r3, #31
	cmp	lr, #0
	rsb	r3, r3, r7, asr #5
	sxth	r3, r3
	ble	.L149
	cmp	lr, #255
	it	ge
	movge	lr, #255
	uxtb	lr, lr
.L146:
	ldr	r6, [r4, #308]
	cmp	r3, #0
	strb	lr, [r6, r2]
	ble	.L150
	cmp	r3, #255
	it	ge
	movge	r3, #255
	uxtb	r3, r3
.L147:
	ldr	r6, [r4, #312]
	strb	r3, [r6, r2]
	adds	r2, r2, #1
	cmp	r2, #64
	bne	.L148
.L142:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L144:
	lsls	r0, r1, #1
	rsb	r0, r0, #200
	b	.L145
.L149:
	mov	lr, #1
	b	.L146
.L150:
	movs	r3, #1
	b	.L147
.L156:
	.align	2
.L155:
	.word	hal_jpege_debug
	.word	.LANCHOR0+143
	.word	.LC19
	.word	jpege_luma_quantizer
	.word	jpege_chroma_quantizer
	.word	1374389535
	.fnend
	.size	hal_jpege_vepu_rc, .-hal_jpege_vepu_rc
	.align	1
	.global	hal_jpege_vepu_init_rc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_vepu_init_rc, %function
hal_jpege_vepu_init_rc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r2, #16
	movs	r1, #0
	mov	r4, r0
	bl	memset
	movs	r1, #64
	ldr	r0, .L164
	bl	mpp_osal_malloc
	movs	r1, #64
	str	r0, [r4, #4]
	ldr	r0, .L164
	bl	mpp_osal_malloc
	ldr	r3, [r4, #4]
	str	r0, [r4, #8]
	cbz	r3, .L158
	cbnz	r0, .L160
.L158:
	movs	r2, #113
	ldr	r1, .L164+4
	ldr	r0, .L164+8
	bl	printk
	mvn	r0, #3
.L157:
	pop	{r4, pc}
.L160:
	movs	r0, #0
	b	.L157
.L165:
	.align	2
.L164:
	.word	.LANCHOR0+161
	.word	.LANCHOR0+184
	.word	.LC20
	.fnend
	.size	hal_jpege_vepu_init_rc, .-hal_jpege_vepu_init_rc
	.align	1
	.global	hal_jpege_v500_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_init, %function
hal_jpege_v500_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r7, .L178
	mov	r5, r1
	ldr	r3, [r7]
	lsls	r2, r3, #31
	bpl	.L167
	movs	r3, #134
	ldr	r1, .L178+4
	mov	r2, r3
	ldr	r0, .L178+8
	bl	printk
.L167:
	mov	r1, #592
	ldr	r0, .L178+12
	bl	mpp_osal_calloc
	mov	r1, #1880
	str	r0, [r4, #72]
	ldr	r0, .L178+12
	bl	mpp_osal_calloc
	movs	r1, #28
	str	r0, [r4, #68]
	ldr	r0, .L178+12
	bl	mpp_osal_calloc
	movs	r1, #1
	str	r0, [r4, #124]
	add	r0, r5, #32
	ldr	r3, [r5, #4]
	str	r3, [r4, #108]
	movs	r3, #0
	str	r3, [r4, #88]
	ldr	r3, [r5, #8]
	str	r3, [r4, #296]
	str	r1, [r5, #28]
	bl	mpp_dev_init
	mov	r6, r0
	cbz	r0, .L168
	mov	r3, r0
	ldr	r1, .L178+4
	ldr	r0, .L178+16
	movs	r2, #146
.L177:
	bl	printk
.L166:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L168:
	ldr	r2, [r5, #32]
	ldr	r3, [r4, #68]
	str	r0, [r4, #100]
	add	r0, r4, #152
	add	r3, r3, #1012
	str	r2, [r4, #64]
	strd	r3, r2, [r4, #92]
	bl	jpege_bits_init
	ldr	r3, [r4, #152]
	cbnz	r3, .L170
	movs	r1, #155
	ldr	r3, .L178+12
	str	r1, [sp]
	ldr	r2, .L178+20
	ldr	r0, .L178+24
	bl	printk
.L170:
	add	r0, r4, #304
	bl	hal_jpege_vepu_init_rc
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L166
	movs	r3, #157
	ldr	r1, .L178+4
	mov	r2, r3
	ldr	r0, .L178+28
	b	.L177
.L179:
	.align	2
.L178:
	.word	hal_jpege_debug
	.word	.LANCHOR0+207
	.word	.LC0
	.word	.LANCHOR0+227
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_init, .-hal_jpege_v500_init
	.align	1
	.global	hal_jpege_vepu_deinit_rc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_vepu_deinit_rc, %function
hal_jpege_vepu_deinit_rc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r1, [r0, #4]
	cbz	r1, .L181
	ldr	r0, .L189
	bl	mpp_osal_free
.L181:
	ldr	r1, [r4, #8]
	movs	r5, #0
	str	r5, [r4, #4]
	cbz	r1, .L182
	ldr	r0, .L189
	bl	mpp_osal_free
.L182:
	str	r5, [r4, #8]
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L190:
	.align	2
.L189:
	.word	.LANCHOR0+247
	.fnend
	.size	hal_jpege_vepu_deinit_rc, .-hal_jpege_vepu_deinit_rc
	.align	1
	.global	hal_jpege_v500_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_deinit, %function
hal_jpege_v500_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L216
	ldr	r2, [r6]
	lsls	r2, r2, #31
	bpl	.L192
	movs	r3, #166
	ldr	r1, .L216+4
	mov	r2, r3
	ldr	r0, .L216+8
	bl	printk
.L192:
	ldr	r0, [r4, #64]
	cbz	r0, .L193
	bl	mpp_dev_deinit
	movs	r3, #0
	str	r3, [r4, #64]
.L193:
	ldr	r0, [r4, #152]
	bl	jpege_bits_deinit
	add	r0, r4, #304
	bl	hal_jpege_vepu_deinit_rc
	ldr	r1, [r4, #68]
	cbz	r1, .L194
	ldr	r0, .L216+12
	bl	mpp_osal_free
.L194:
	ldr	r1, [r4, #72]
	movs	r5, #0
	str	r5, [r4, #68]
	cbz	r1, .L195
	ldr	r0, .L216+12
	bl	mpp_osal_free
.L195:
	ldr	r1, [r4, #124]
	str	r5, [r4, #72]
	cbz	r1, .L196
	ldr	r0, .L216+12
	bl	mpp_osal_free
.L196:
	movs	r3, #0
	str	r3, [r4, #124]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L197
	movs	r3, #182
	ldr	r1, .L216+4
	mov	r2, r3
	ldr	r0, .L216+16
	bl	printk
.L197:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L217:
	.align	2
.L216:
	.word	hal_jpege_debug
	.word	.LANCHOR0+272
	.word	.LC0
	.word	.LANCHOR0+294
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_deinit, .-hal_jpege_v500_deinit
	.global	__aeabi_uidiv
	.align	1
	.global	hal_jpege_vepu500_set_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_vepu500_set_osd, %function
hal_jpege_vepu500_set_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	ldr	r3, [r0, #332]
	.pad #68
	sub	sp, sp, #68
	ldr	r5, [r0, #92]
	ldr	r4, [r0, #100]
	ldr	fp, [r3, #16]
	ldr	r0, [r3, #52]
	ldrd	r7, r6, [fp]
	bl	mpp_frame_get_height
	cmp	r0, r6
	bcs	.L230
	ldr	r3, [fp, #136]
	adds	r10, r3, #0
	it	ne
	movne	r10, #1
.L219:
	cmp	r4, #0
	beq	.L246
	ldr	r6, [r4, #4]
	cmp	r6, #0
	beq	.L246
	cmp	r6, #8
	bls	.L221
	mov	r3, r6
	movs	r2, #244
	ldr	r1, .L247
	ldr	r0, .L247+4
	bl	printk
	ldr	r3, [r4, #4]
	cmp	r3, #8
	bls	.L233
	movs	r1, #245
	ldr	r3, .L247+8
	str	r1, [sp]
	ldr	r2, .L247+12
	ldr	r0, .L247+16
	bl	printk
.L233:
	mov	r0, #-1
	b	.L218
.L230:
	mov	r10, #0
	b	.L219
.L221:
	cmp	r10, #0
	beq	.L222
	adds	r7, r7, #15
	ldr	r0, [fp, #136]
	lsrs	r1, r7, #4
	bl	__aeabi_uidiv
	ldr	r3, [r9, #344]
	lsls	r0, r0, #4
	mul	r8, r3, r0
	bic	r3, r7, #15
	str	r3, [sp, #12]
	add	r3, r0, r8
	str	r3, [sp, #16]
.L222:
	adds	r4, r4, #148
	mov	fp, #0
.L228:
	ldrd	r2, r3, [r4, #-116]
	str	r3, [sp, #8]
	ldr	r3, [r4, #-108]
	cmp	r10, #0
	beq	.L223
	cmp	r8, r2
	bhi	.L225
	ldrd	r0, r1, [sp, #8]
	cmp	r1, r0
	bcc	.L225
	ldr	r1, [sp, #16]
	cmp	r1, r3
	bcs	.L244
.L225:
	add	fp, fp, #1
	adds	r4, r4, #140
	cmp	r6, fp
	bne	.L228
	ldr	r3, [r5, #288]
	and	r2, r3, #-134217728
	ldr	r3, .L247+20
	orrs	r3, r3, r2
	str	r3, [r5, #288]
	ldr	r3, [r5, #292]
	and	r2, r3, #-134217728
	ldr	r3, .L247+24
	orrs	r3, r3, r2
	str	r3, [r5, #292]
	ldr	r3, [r5, #296]
	and	r2, r3, #-134217728
	ldr	r3, .L247+28
	orrs	r3, r3, r2
	str	r3, [r5, #296]
	ldr	r3, [r5, #300]
	and	r3, r3, #-16777216
	orr	r3, r3, #8388608
	orr	r3, r3, #32768
	str	r3, [r5, #300]
.L246:
	movs	r0, #0
.L218:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L244:
	sub	r2, r2, r8
	sub	r3, r3, r8
.L223:
	strd	r2, r3, [sp, #24]
	add	r0, sp, #36
	ldr	r3, [r4, #-120]
	ldr	r1, [r4, #-128]
	str	r3, [sp, #20]
	bl	vepu5xx_set_fmt
	movs	r3, #36
	ldr	r0, [r4, #-140]
	mul	r7, r3, fp
	adds	r1, r5, r7
	ldrb	ip, [r5, r7]	@ zero_extendqisi2
	bfi	ip, r0, #0, #1
	strb	ip, [r5, r7]
	ldr	r0, [r4, #-136]
	bfi	ip, r0, #6, #1
	strb	ip, [r5, r7]
	ldr	r0, [r4, #-132]
	bfi	ip, r0, #7, #1
	strb	ip, [r5, r7]
	ldrb	ip, [r1, #1]	@ zero_extendqisi2
	ldr	r0, [sp, #36]
	ldr	r3, [sp, #20]
	bfi	ip, r0, #0, #4
	strb	ip, [r1, #1]
	ldr	r0, [r4, #-124]
	ldr	r2, [sp, #24]
	bfi	ip, r0, #5, #1
	ldrh	r0, [r1, #4]
	strb	ip, [r1, #1]
	bfi	r0, r3, #0, #14
	strh	r0, [r1, #4]	@ movhi
	ldr	r0, [r1, #4]
	bfi	r0, r2, #14, #14
	str	r0, [r1, #4]
	ldr	r3, [sp, #8]
	ubfx	r0, r0, #24, #8
	ldrh	r2, [r1, #8]
	bfi	r2, r3, #0, #14
	ldr	r3, [sp, #28]
	strh	r2, [r1, #8]	@ movhi
	ldr	r2, [r1, #8]
	bfi	r2, r3, #14, #14
	str	r2, [r1, #8]
	ldr	r3, [r4, #-96]
	bfi	r0, r3, #4, #4
	ldr	r3, [r1, #20]
	strb	r0, [r1, #7]
	ldr	r2, [r4, #-104]
	bfi	r3, r2, #0, #17
	str	r3, [r1, #20]
	ldr	r2, [r4, #-100]
	ubfx	r3, r3, #24, #8
	bfi	r3, r2, #1, #1
	strb	r3, [r1, #23]
	ldr	r2, [r4, #-56]
	uxtb	r3, ip
	bfi	r3, r2, #4, #1
	strb	r3, [r1, #1]
	ldr	r2, [r4, #-48]
	ldrh	r3, [r1, #2]
	bfi	r3, r2, #6, #8
	strh	r3, [r1, #2]	@ movhi
	ldr	r2, [r4, #-44]
	ubfx	r3, r3, #8, #8
	bfi	r3, r2, #6, #2
	strb	r3, [r1, #3]
	ldr	r2, [r4, #-40]
	ldrb	r3, [r5, r7]	@ zero_extendqisi2
	bfi	r3, r2, #5, #1
	strb	r3, [r5, r7]
	ldr	r3, [r4, #-36]
	ldrb	r2, [r1, #32]	@ zero_extendqisi2
	bfi	r2, r3, #0, #1
	strb	r2, [r1, #32]
	ldr	r3, [r4, #-32]
	bfi	r2, r3, #1, #7
	strb	r2, [r1, #32]
	ldrb	r2, [r1, #33]	@ zero_extendqisi2
	ldr	r3, [r4, #-28]
	bfi	r2, r3, #0, #6
	strb	r2, [r1, #33]
	ldr	r3, [r1, #32]
	ldr	r2, [r4, #-24]
	bfi	r3, r2, #14, #6
	str	r3, [r1, #32]
	ldr	r2, [r4, #-20]
	ubfx	r3, r3, #16, #16
	bfi	r3, r2, #4, #5
	strh	r3, [r1, #34]	@ movhi
	ldr	r1, [r4, #-12]
	cmp	r1, #0
	beq	.L225
	movs	r2, #0
	ldr	r0, [r9, #320]
	bl	mpp_dev_get_mpi_ioaddress
	add	r3, r5, #12
	str	r0, [r3, r7]
	b	.L225
.L248:
	.align	2
.L247:
	.word	.LANCHOR0+316
	.word	.LC24
	.word	.LANCHOR0+342
	.word	.LC25
	.word	.LC23
	.word	7679053
	.word	33773525
	.word	128920192
	.fnend
	.size	hal_jpege_vepu500_set_osd, .-hal_jpege_vepu500_set_osd
	.align	1
	.global	hal_jpege_v500_gen_regs
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_jpege_v500_gen_regs, %function
hal_jpege_v500_gen_regs:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r5, [r0, #68]
	mov	r4, r0
	ldr	r7, [r0, #152]
	mov	r6, r1
	ldr	r0, [r1, #28]
	add	r3, r5, #356
	str	r3, [sp, #4]
	movs	r3, #0
	strd	r3, r3, [sp, #16]
	bl	mpp_packet_get_length
	ldr	r3, [r6, #32]
	add	fp, r4, #156
	ldr	r1, .L280
	add	r10, r4, #320
	mov	r9, r0
	ldr	r0, [r3]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r3, [r6, #32]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #24]
	str	r3, [sp, #8]
	add	r8, r0, r2
	ldr	r3, .L280+4
	ldr	r2, [r3]
	str	r3, [sp, #12]
	tst	r2, #1
	beq	.L250
	mov	r3, #370
	ldr	r1, .L280+8
	mov	r2, r3
	ldr	r0, .L280+12
	bl	printk
.L250:
	ldr	r3, [sp, #4]
	mov	r2, #1880
	movs	r1, #0
	str	r6, [r4, #332]
	mov	r0, r5
	str	r3, [r4, #324]
	ldr	r3, [r4, #64]
	str	r3, [r4, #320]
	ldr	r3, [r4, #124]
	str	r3, [r4, #336]
	ldr	r3, [r4, #296]
	str	r3, [r4, #340]
	bl	memset
	mov	r1, r8
	mov	r0, r7
	ldr	r2, [sp, #8]
	bl	jpege_bits_setup
	lsl	r1, r9, #3
	mov	r0, r7
	bl	jpege_seek_bits
	ldr	r3, [r4, #108]
	ldr	r3, [r3, #108]
	cmp	r3, #2
	beq	.L251
	mov	r1, r6
	mov	r0, r4
	bl	hal_jpege_vepu_rc
	ldr	r3, [r4, #308]
	str	r3, [sp, #16]
	ldr	r3, [r4, #312]
.L279:
	add	r2, sp, #16
	mov	r1, fp
	mov	r0, r7
	str	r3, [sp, #20]
	bl	write_jpeg_header
	mov	r0, r7
	bl	jpege_bits_get_bitpos
	adds	r1, r0, #7
	ldr	r0, [r6, #28]
	asrs	r1, r1, #3
	str	r1, [r6, #48]
	bl	mpp_packet_set_length
	ldr	r3, [r6, #32]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L253
	ldr	r2, [r6, #48]
	ldr	r1, .L280
	str	r2, [r3, #20]
	ldr	r0, [r6, #32]
	bl	mpp_buffer_flush_for_device_with_caller
.L254:
	ldrb	r3, [r5, #20]	@ zero_extendqisi2
	movs	r2, #2
	bic	r3, r3, #7
	orr	r3, r3, #4
	strb	r3, [r5, #20]
	movw	r3, #32767
	strh	r3, [r5, #32]	@ movhi
	ldrb	r3, [r5, #100]	@ zero_extendqisi2
	bfi	r3, r2, #0, #2
	strb	r3, [r5, #100]
	movs	r3, #7
	str	r3, [r5, #48]
	ldrh	r3, [r5, #54]
	ldr	r2, .L280+16
	bfc	r3, #0, #10
	strh	r3, [r5, #54]	@ movhi
	ldr	r3, [r5, #56]
	bfi	r3, r2, #0, #24
	str	r3, [r5, #56]
	ldr	r1, [r4, #296]
	cbz	r1, .L255
	cmp	r1, #2
	ldr	r2, [r4, #156]
	ldr	r3, [r4, #68]
	bne	.L256
	ldrb	r1, [r3, #27]	@ zero_extendqisi2
	bic	r1, r1, #7
	orr	r1, r1, #7
	strb	r1, [r3, #27]
	ldrb	r1, [r3, #96]	@ zero_extendqisi2
	orr	r1, r1, #2
	strb	r1, [r3, #96]
.L256:
	ldrh	r1, [r3, #96]
	lsls	r2, r2, #3
	addw	r2, r2, #4095
	and	r1, r1, #50
	orr	r1, r1, #9
	lsrs	r2, r2, #12
	strh	r1, [r3, #96]	@ movhi
	strb	r2, [r3, #98]
	movs	r2, #0
	ldr	r1, [r3, #108]
	strb	r2, [r3, #99]
	ldr	r2, .L280+20
	ands	r2, r2, r1
	orr	r2, r2, #851968
	str	r2, [r3, #108]
.L255:
	mov	r0, r4
	movs	r7, #0
	bl	hal_jpege_vepu500_set_osd
	mov	r0, r10
	bl	vepu500_set_jpeg_reg
	addw	r10, r5, #626
	add	r3, r5, #628
	str	r3, [sp, #4]
.L257:
	add	r8, r7, #64
	mov	fp, r10
	mov	r9, r7
.L258:
	ldr	r2, [sp, #16]
	mov	r0, #32768
	ldrb	r1, [r2, r9]	@ zero_extendqisi2
	add	r9, r9, #8
	bl	__aeabi_idiv
	cmp	r8, r9
	strh	r0, [fp, #2]!	@ movhi
	bne	.L258
	adds	r7, r7, #1
	add	r10, r10, #16
	cmp	r7, #8
	bne	.L257
	addw	r10, r5, #754
	movs	r7, #0
.L260:
	add	r8, r7, #64
	mov	fp, r10
	mov	r9, r7
.L261:
	ldr	r2, [sp, #20]
	mov	r0, #32768
	ldrb	r1, [r2, r9]	@ zero_extendqisi2
	add	r9, r9, #8
	bl	__aeabi_idiv
	cmp	r8, r9
	strh	r0, [fp, #2]!	@ movhi
	bne	.L261
	adds	r7, r7, #1
	add	r10, r10, #16
	cmp	r7, #8
	bne	.L260
	addw	r10, r5, #882
	movs	r7, #0
.L263:
	add	r8, r7, #64
	mov	fp, r10
	mov	r9, r7
.L264:
	ldr	r2, [sp, #20]
	mov	r0, #32768
	ldrb	r1, [r2, r9]	@ zero_extendqisi2
	add	r9, r9, #8
	bl	__aeabi_idiv
	cmp	r8, r9
	strh	r0, [fp, #2]!	@ movhi
	bne	.L264
	adds	r7, r7, #1
	add	r10, r10, #16
	cmp	r7, #8
	bne	.L263
	ldr	r3, [sp, #4]
	add	r5, r5, #1012
	str	r5, [r6, #72]
	str	r3, [r6, #76]
	ldr	r3, [r4, #140]
	adds	r3, r3, #1
	str	r3, [r4, #140]
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L266
	movw	r3, #447
	ldr	r1, .L280+8
	mov	r2, r3
	ldr	r0, .L280+24
	bl	printk
.L266:
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L251:
	movs	r3, #0
	str	r3, [sp, #16]
	b	.L279
.L253:
	ldr	r0, [r4, #64]
	bl	mpp_get_dev
	ldr	r1, [r6, #32]
	movs	r3, #1
	ldr	r2, [r6, #48]
	ldr	r1, [r1, #4]
	bl	dma_sync_single_for_device
	b	.L254
.L281:
	.align	2
.L280:
	.word	.LANCHOR0+368
	.word	hal_jpege_debug
	.word	.LANCHOR0+392
	.word	.LC0
	.word	2097151
	.word	-995840
	.word	.LC5
	.fnend
	.size	hal_jpege_v500_gen_regs, .-hal_jpege_v500_gen_regs
	.global	hal_jpege_vepu500
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.35862, %object
	.size	__func__.35862, 21
__func__.35862:
	.ascii	"hal_jpege_v500_start\000"
	.type	__func__.35877, %object
	.size	__func__.35877, 20
__func__.35877:
	.ascii	"hal_jpege_v500_wait\000"
	.type	__func__.35884, %object
	.size	__func__.35884, 24
__func__.35884:
	.ascii	"hal_jpege_v500_get_task\000"
	.type	__func__.35893, %object
	.size	__func__.35893, 24
__func__.35893:
	.ascii	"hal_jpege_v500_ret_task\000"
	.type	__func__.35869, %object
	.size	__func__.35869, 31
__func__.35869:
	.ascii	"hal_jpege_vepu500_status_check\000"
	.type	__func__.35763, %object
	.size	__func__.35763, 23
__func__.35763:
	.ascii	"hal_jpege_v500_prepare\000"
	.type	__func__.35726, %object
	.size	__func__.35726, 18
__func__.35726:
	.ascii	"hal_jpege_vepu_rc\000"
	.type	__FUNCTION__.35735, %object
	.size	__FUNCTION__.35735, 23
__FUNCTION__.35735:
	.ascii	"hal_jpege_vepu_init_rc\000"
	.type	__func__.35736, %object
	.size	__func__.35736, 23
__func__.35736:
	.ascii	"hal_jpege_vepu_init_rc\000"
	.type	__func__.35748, %object
	.size	__func__.35748, 20
__func__.35748:
	.ascii	"hal_jpege_v500_init\000"
	.type	__FUNCTION__.35749, %object
	.size	__FUNCTION__.35749, 20
__FUNCTION__.35749:
	.ascii	"hal_jpege_v500_init\000"
	.type	__FUNCTION__.35740, %object
	.size	__FUNCTION__.35740, 25
__FUNCTION__.35740:
	.ascii	"hal_jpege_vepu_deinit_rc\000"
	.type	__func__.35756, %object
	.size	__func__.35756, 22
__func__.35756:
	.ascii	"hal_jpege_v500_deinit\000"
	.type	__FUNCTION__.35757, %object
	.size	__FUNCTION__.35757, 22
__FUNCTION__.35757:
	.ascii	"hal_jpege_v500_deinit\000"
	.type	__func__.35810, %object
	.size	__func__.35810, 26
__func__.35810:
	.ascii	"hal_jpege_vepu500_set_osd\000"
	.type	__FUNCTION__.35811, %object
	.size	__FUNCTION__.35811, 26
__FUNCTION__.35811:
	.ascii	"hal_jpege_vepu500_set_osd\000"
	.type	__FUNCTION__.35845, %object
	.size	__FUNCTION__.35845, 24
__FUNCTION__.35845:
	.ascii	"hal_jpege_v500_gen_regs\000"
	.type	__func__.35850, %object
	.size	__func__.35850, 24
__func__.35850:
	.ascii	"hal_jpege_v500_gen_regs\000"
	.type	hal_jpege_vepu500, %object
	.size	hal_jpege_vepu500, 64
hal_jpege_vepu500:
	.word	.LC26
	.word	8
	.word	348
	.word	0
	.word	hal_jpege_v500_init
	.word	hal_jpege_v500_deinit
	.word	hal_jpege_v500_prepare
	.word	hal_jpege_v500_get_task
	.word	hal_jpege_v500_gen_regs
	.word	hal_jpege_v500_start
	.word	hal_jpege_v500_wait
	.word	0
	.word	0
	.word	hal_jpege_v500_ret_task
	.space	8
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016hal_jpege_v500:%s:%d: (%d) enter\012\000"
.LC1:
	.ascii	"\0013hal_jpege_v500:%s:%d: enc_task->flags.err %08x"
	.ascii	", return e arly\000"
.LC2:
	.ascii	"\0013hal_jpege_v500:%s:%d: set register write faile"
	.ascii	"d %d\012\000"
.LC3:
	.ascii	"\0013hal_jpege_v500:%s:%d: set register read failed"
	.ascii	" %d\012\000"
.LC4:
	.ascii	"\0013hal_jpege_v500:%s:%d: send cmd failed %d\012\000"
.LC5:
	.ascii	"\0016hal_jpege_v500:%s:%d: (%d) leave\012\000"
.LC6:
	.ascii	"\0013hal_jpege_v500:%s:%d: enc_task->flags.err %08x"
	.ascii	", return early\000"
.LC7:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_LINKTABLE_FI"
	.ascii	"NISH\000"
.LC8:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_ONE_FRAME_FI"
	.ascii	"NISH\000"
.LC9:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_ONE_SLICE_FI"
	.ascii	"NISH\000"
.LC10:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_SAFE_CLEAR_F"
	.ascii	"INISH\000"
.LC11:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_BIT_STREAM_O"
	.ascii	"VERFLOW\000"
.LC12:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_BUS_WRITE_FU"
	.ascii	"LL\000"
.LC13:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_BUS_WRITE_ER"
	.ascii	"ROR\000"
.LC14:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_BUS_READ_ERR"
	.ascii	"OR\000"
.LC15:
	.ascii	"\0016hal_jpege_v500:%s:%d: RKV_ENC_INT_TIMEOUT_ERRO"
	.ascii	"R\000"
.LC16:
	.ascii	"\0016hal_jpege_v500:%s:%d: JPEG BIT_STREAM_OVERFLOW"
	.ascii	"\000"
.LC17:
	.ascii	"\0016hal_jpege_v500:%s:%d: enter %p\012\000"
.LC18:
	.ascii	"\0016hal_jpege_v500:%s:%d: leave %p\012\000"
.LC19:
	.ascii	"\0016hal_jpege_v500:%s:%d: use qfactor=%d, rc_info-"
	.ascii	">quality_target=%d\012\000"
.LC20:
	.ascii	"\0013hal_jpege_v500:%s:%d: qtable is null, malloc e"
	.ascii	"rr\012\000"
.LC21:
	.ascii	"\0013hal_jpege_v500:%s:%d: mpp_dev_init failed. ret"
	.ascii	": %d\012\000"
.LC22:
	.ascii	"ctx->bits\000"
.LC23:
	.ascii	"\0013hal_jpege_v500:%d: Assertion %s failed at %s:%"
	.ascii	"d\012\000"
.LC24:
	.ascii	"\0013hal_jpege_v500:%s:%d: do NOT support more than"
	.ascii	" 8 regions invalid num %d\012\000"
.LC25:
	.ascii	"osd->num_region <= 8\000"
.LC26:
	.ascii	"hal_jpege_v500\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
