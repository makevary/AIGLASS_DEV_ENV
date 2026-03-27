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
	.file	"hal_h265e_vepu500.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	hal_h265e_v500_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_deinit, %function
hal_h265e_v500_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L58
	ldr	r3, [r5]
	lsls	r2, r3, #29
	bpl	.L2
	movw	r3, #479
	ldr	r1, .L58+4
	mov	r2, r3
	ldr	r0, .L58+8
	bl	printk
.L2:
	ldr	r1, [r4, #68]
	cbz	r1, .L3
	ldr	r0, .L58+12
	bl	mpp_osal_free
.L3:
	ldr	r1, [r4, #72]
	movs	r6, #0
	str	r6, [r4, #68]
	cbz	r1, .L4
	ldr	r0, .L58+12
	bl	mpp_osal_free
.L4:
	ldr	r1, [r4, #788]
	str	r6, [r4, #72]
	cbz	r1, .L5
	ldr	r0, .L58+12
	bl	mpp_osal_free
.L5:
	movs	r3, #0
	str	r3, [r4, #788]
	ldr	r3, [r4, #932]
	ldr	r6, [r3, #8]
	cbnz	r6, .L6
	ldr	r0, [r4, #956]
	cbz	r0, .L6
	ldr	r1, .L58+12
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #956]
.L6:
	ldr	r3, [r4, #932]
	ldr	r3, [r3]
	cbnz	r3, .L7
	ldr	r0, [r4, #808]
	cbz	r0, .L7
	bl	hal_bufs_deinit
.L7:
	ldr	r3, [r4, #932]
	ldr	r6, [r3, #4]
	cbnz	r6, .L8
	ldr	r0, [r4, #832]
	cbz	r0, .L8
	ldr	r1, .L58+12
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #832]
.L8:
	ldr	r0, [r4, #772]
	cbz	r0, .L9
	ldr	r1, .L58+12
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #772]
.L9:
	ldr	r0, [r4, #964]
	cbz	r0, .L10
	ldr	r1, .L58+12
	bl	mpp_buffer_put_with_caller
.L10:
	ldr	r0, [r4, #968]
	cbz	r0, .L11
	ldr	r1, .L58+12
	bl	mpp_buffer_put_with_caller
.L11:
	ldr	r1, [r4, #972]
	cbz	r1, .L12
	ldr	r0, .L58+12
	bl	mpp_osal_free
.L12:
	ldr	r1, [r4, #976]
	cbz	r1, .L13
	ldr	r0, .L58+12
	bl	mpp_osal_free
.L13:
	ldr	r0, [r4, #64]
	cbz	r0, .L14
	bl	mpp_dev_deinit
	movs	r3, #0
	str	r3, [r4, #64]
.L14:
	ldr	r3, [r5]
	lsls	r3, r3, #29
	bpl	.L15
	movw	r3, #517
	ldr	r1, .L58+4
	mov	r2, r3
	ldr	r0, .L58+16
	bl	printk
.L15:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L59:
	.align	2
.L58:
	.word	hal_h265e_debug
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+22
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_deinit, .-hal_h265e_v500_deinit
	.align	1
	.global	hal_h265e_v500_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_init, %function
hal_h265e_v500_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r7, .L92
	mov	r5, r1
	ldr	r3, [r7]
	lsls	r0, r3, #29
	bpl	.L61
	mov	r3, #528
	ldr	r1, .L92+4
	mov	r2, r3
	ldr	r0, .L92+8
	bl	printk
.L61:
	mov	r1, #596
	ldr	r0, .L92+12
	bl	mpp_osal_calloc
	movw	r1, #4924
	mov	r8, #2
	str	r0, [r4, #72]
	ldr	r0, .L92+12
	bl	mpp_osal_calloc
	movs	r1, #28
	str	r0, [r4, #68]
	ldr	r0, .L92+12
	bl	mpp_osal_calloc
	movs	r1, #1
	str	r0, [r4, #788]
	add	r0, r5, #32
	ldr	r3, [r5, #4]
	str	r3, [r4, #768]
	ldr	r3, [r5, #8]
	str	r3, [r4, #820]
	ldr	r3, [r5, #12]
	str	r3, [r4, #828]
	ldr	r3, [r5, #36]
	str	r3, [r4, #932]
	ldr	r3, [r5, #16]
	str	r3, [r4, #940]
	ldr	r3, [r5, #20]
	str	r3, [r4, #944]
	ldr	r3, [r5, #24]
	str	r8, [r4, #744]
	str	r3, [r4, #960]
	movs	r3, #0
	str	r3, [r4, #748]
	str	r3, [r4, #740]
	str	r1, [r5, #28]
	bl	mpp_dev_init
	mov	r6, r0
	cbz	r0, .L62
	mov	r3, r0
	mov	r2, #548
	ldr	r1, .L92+4
	mov	r6, #-1
	ldr	r0, .L92+16
	bl	printk
	mov	r0, r4
	bl	hal_h265e_v500_deinit
.L60:
	mov	r0, r6
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L62:
	ldr	r3, [r4, #68]
	movs	r1, #171
	movs	r2, #85
	addw	r3, r3, #3464
	str	r3, [r4, #756]
	ldr	r3, [r5, #32]
	str	r3, [r4, #760]
	ldr	r3, [r5, #4]
	strd	r1, r2, [r3, #316]
	add	r2, r3, #464
	strd	r8, r8, [r3, #308]
	strd	r0, r0, [r3, #324]
	str	r0, [r3, #332]
	ldr	r1, [r4, #944]
	cmp	r1, #0
	beq	.L64
	ldr	lr, .L92+24
	add	r8, lr, #64
.L65:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r8
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L65
	ldr	lr, .L92+28
	add	ip, r3, #528
	add	r8, lr, #64
.L66:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L66
	ldr	lr, .L92+32
	add	ip, r3, #336
	add	r8, lr, #64
.L67:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L67
	ldr	lr, .L92+36
	add	ip, r3, #400
	add	r8, lr, #64
.L68:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L68
	ldr	ip, .L92+40
	add	r3, r3, #664
	add	lr, ip, #40
.L69:
	mov	r2, ip
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r3, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L69
.L70:
	ldr	r3, [r5, #32]
	str	r3, [r4, #64]
	ldr	r3, [r7]
	lsls	r3, r3, #29
	bpl	.L60
	movw	r3, #585
	ldr	r1, .L92+4
	mov	r2, r3
	ldr	r0, .L92+20
	bl	printk
	b	.L60
.L64:
	ldr	lr, .L92+44
	add	r9, lr, #64
	mov	r8, r9
.L71:
	mov	ip, lr
	adds	r2, r2, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, r9
	str	r0, [r2, #-8]	@ unaligned
	mov	lr, ip
	str	r1, [r2, #-4]	@ unaligned
	bne	.L71
	ldr	lr, .L92+44
	add	ip, r3, #528
.L72:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L72
	ldr	lr, .L92+48
	add	ip, r3, #336
	add	r9, lr, #64
	mov	r8, r9
.L73:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r9
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L73
	ldr	lr, .L92+48
	add	ip, r3, #400
.L74:
	mov	r2, lr
	add	ip, ip, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, r8
	str	r0, [ip, #-8]	@ unaligned
	mov	lr, r2
	str	r1, [ip, #-4]	@ unaligned
	bne	.L74
	ldr	ip, .L92+52
	add	r3, r3, #664
	add	lr, ip, #40
.L75:
	mov	r2, ip
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r3, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L75
	b	.L70
.L93:
	.align	2
.L92:
	.word	hal_h265e_debug
	.word	.LANCHOR0+44
	.word	.LC0
	.word	.LANCHOR0+64
	.word	.LC2
	.word	.LC1
	.word	.LANCHOR1
	.word	.LANCHOR1+64
	.word	.LANCHOR1+128
	.word	.LANCHOR1+192
	.word	.LANCHOR1+256
	.word	.LANCHOR1+296
	.word	.LANCHOR1+360
	.word	.LANCHOR1+424
	.fnend
	.size	hal_h265e_v500_init, .-hal_h265e_v500_init
	.global	__aeabi_uidiv
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_h265_set_feedback, %function
vepu500_h265_set_feedback:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r1, #4]
	ldr	r2, [r0, #768]
	ldr	r5, .L118
	str	r3, [sp]
	ldr	r3, [r2, #12]
	ldr	r2, [r2, #16]
	adds	r8, r3, #63
	ldr	r6, [r0, #72]
	it	mi
	addmi	r8, r3, #126
	adds	r3, r2, #63
	it	mi
	addmi	r3, r2, #126
	asr	r8, r8, #6
	ldr	r7, [r6]
	asrs	r3, r3, #6
	mul	r8, r3, r8
	ldr	r3, [r5]
	lsls	r3, r3, #29
	lsl	fp, r8, #8
	bpl	.L97
	movw	r3, #2872
	ldr	r1, .L118+4
	mov	r2, r3
	ldr	r0, .L118+8
	bl	printk
.L97:
	ldr	r2, [r6, #16]
	ldr	r3, [r4, #88]
	add	r3, r3, r2
	str	r3, [r4, #88]
	ldr	r3, [r4, #92]
	ldr	r2, [r6, #4]
	add	r3, r3, r2
	str	r3, [r4, #92]
	ldr	r3, [r6, #12]
	str	r7, [r4, #80]
	lsls	r1, r3, #16
	ldrd	r2, [r4, #104]
	adds	r9, r2, r1
	adc	r10, r3, #0
	ldr	r3, [r5]
	strd	r9, [r4, #104]
	lsls	r0, r3, #28
	bpl	.L98
	mov	r3, r7
	movw	r2, #2882
	ldr	r1, .L118+4
	ldr	r0, .L118+12
	bl	printk
.L98:
	lsls	r1, r7, #27
	ldr	r5, [r5]
	bpl	.L99
	lsls	r2, r5, #22
	bpl	.L106
	movw	r2, #2884
	ldr	r1, .L118+4
	ldr	r0, .L118+16
	bl	printk
.L106:
	mvn	r0, #100
	b	.L94
.L99:
	lsls	r3, r7, #25
	bpl	.L101
	lsls	r4, r5, #22
	bpl	.L109
	ldr	r1, .L118+4
	movw	r2, #2889
	ldr	r0, .L118+20
.L117:
	bl	printk
.L109:
	mov	r0, #-1
	b	.L94
.L101:
	lsls	r0, r7, #24
	bpl	.L102
	lsls	r1, r5, #22
	bpl	.L109
	movw	r2, #2894
	ldr	r1, .L118+4
	ldr	r0, .L118+24
	b	.L117
.L102:
	lsls	r2, r7, #23
	bpl	.L103
	lsls	r3, r5, #22
	bpl	.L109
	movw	r2, #2899
	ldr	r1, .L118+4
	ldr	r0, .L118+28
	b	.L117
.L103:
	ldr	r3, [r6, #164]
	ldr	r0, [r4, #128]
	ubfx	r2, r3, #0, #23
	ldr	r3, [r4, #360]
	add	r3, r3, r2
	str	r3, [r4, #360]
	ldr	r3, [r6, #132]
	ubfx	r2, r3, #0, #17
	ldr	r3, [r4, #112]
	add	r3, r3, r2
	str	r3, [r4, #112]
	ldr	r3, [r6, #136]
	ubfx	r2, r3, #0, #19
	ldr	r3, [r4, #116]
	add	r3, r3, r2
	str	r3, [r4, #116]
	ldr	r7, [r6, #148]
	ubfx	r7, r7, #0, #19
	add	r7, r7, r0
	str	r7, [r4, #128]
	ldr	r3, [r6, #140]
	ldr	r0, [r4, #132]
	ubfx	r2, r3, #0, #21
	ldr	r3, [r4, #120]
	add	r3, r3, r2
	str	r3, [r4, #120]
	ldr	r3, [r6, #152]
	ubfx	r3, r3, #0, #21
	add	r3, r3, r0
	str	r3, [r4, #132]
	ldr	r2, [r6, #144]
	str	r3, [sp, #4]
	ubfx	r1, r2, #0, #23
	ldr	r2, [r4, #124]
	add	r2, r2, r1
	str	r2, [r4, #124]
	ldr	r0, [r6, #156]
	add	r1, r6, #388
	ldr	r2, [r4, #136]
	ubfx	r0, r0, #0, #23
	add	r9, r0, r2
	str	r9, [r4, #136]
	ldr	r2, [r6, #160]
	ldr	r0, [r4, #140]
	ubfx	r2, r2, #0, #23
	add	r10, r2, r0
	movs	r2, #208
	str	r10, [r4, #140]
	add	r0, r4, #144
	bl	memcpy
	ldr	r2, [r6, #328]
	cmp	fp, #0
	ubfx	r2, r2, #15, #17
	str	r2, [r4, #388]
	ldr	r2, [r6, #332]
	ubfx	r2, r2, #15, #17
	str	r2, [r4, #392]
	ldr	r2, [r6, #312]
	str	r2, [r4, #396]
	ldr	r2, [r6, #164]
	ubfx	r2, r2, #0, #23
	str	r2, [r4, #364]
	ble	.L104
	ldr	r3, [sp, #4]
	lsls	r0, r7, #6
	add	r9, r9, r10
	mov	r1, fp
	add	r3, r0, r3, lsl #4
	add	r0, r3, r9, lsl #2
	lsls	r0, r0, #8
	bl	__aeabi_uidiv
	ldr	r3, [sp]
	str	r0, [r3, #200]
.L104:
	cmp	r8, #0
	ble	.L105
	ldr	r0, [r4, #88]
	lsl	r1, r8, #6
	bl	__aeabi_uidiv
	ldr	r3, [sp]
	str	r0, [r3, #188]
.L105:
	ands	r0, r5, #4
	beq	.L94
	mov	r3, #2928
	ldr	r1, .L118+4
	mov	r2, r3
	ldr	r0, .L118+32
	bl	printk
	movs	r0, #0
.L94:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L119:
	.align	2
.L118:
	.word	hal_h265e_debug
	.word	.LANCHOR0+84
	.word	.LC0
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC1
	.fnend
	.size	vepu500_h265_set_feedback, .-vepu500_h265_set_feedback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_ret_comb_task, %function
hal_h265e_v500_ret_comb_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r4, .L139
	mov	r7, r1
	ldr	r10, [r0, #72]
	mov	r6, r2
	ldr	r9, [r2, #4]
	ldr	r3, [r4]
	lsls	r0, r3, #29
	bpl	.L121
	movw	r3, #3233
	ldr	r1, .L139+4
	mov	r2, r3
	ldr	r0, .L139+8
	bl	printk
.L121:
	mov	r1, r7
	mov	r0, r5
	bl	vepu500_h265_set_feedback
	mov	r8, r0
	cmp	r0, #0
	bne	.L120
	ldr	r3, [r5, #92]
	str	r3, [r7, #44]
	ldr	r3, [r7, #48]
	ldr	r2, [r5, #92]
	add	r3, r3, r2
	str	r3, [r7, #48]
	ldr	r3, [r10]
	lsls	r1, r3, #18
	itt	mi
	movmi	r3, #1
	strmi	r3, [r6, #80]
	ldr	r2, [r10, #104]
	ldr	r3, [r6, #48]
	str	r2, [r6, #44]
	add	r3, r3, r2
	str	r3, [r6, #48]
	ldr	r3, [r9, #184]
	add	r3, r3, r2, lsl #3
	str	r3, [r9, #184]
	ldr	r3, [r4]
	lsls	r2, r3, #28
	bpl	.L125
	ldr	r3, [r5, #92]
	movw	r2, #3247
	ldr	r1, .L139+4
	ldr	r0, .L139+12
	bl	printk
.L125:
	ldr	r3, [r4]
	lsls	r3, r3, #29
	bpl	.L120
	mov	r3, #3248
	ldr	r1, .L139+4
	mov	r2, r3
	ldr	r0, .L139+16
	bl	printk
.L120:
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L140:
	.align	2
.L139:
	.word	hal_h265e_debug
	.word	.LANCHOR0+110
	.word	.LC0
	.word	.LC8
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_ret_comb_task, .-hal_h265e_v500_ret_comb_task
	.align	1
	.global	hal_h265e_v500_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_start, %function
hal_h265e_v500_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L167
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r2, [r3]
	.pad #24
	sub	sp, sp, #24
	mov	r4, r1
	ldrd	r6, r7, [r0, #68]
	tst	r2, #4
	mov	r8, r3
	beq	.L142
	movw	r3, #2809
	ldr	r1, .L167+4
	mov	r2, r3
	ldr	r0, .L167+8
	bl	printk
.L142:
	ldr	r3, [r4, #64]
	cbz	r3, .L143
	movw	r2, #2813
	ldr	r1, .L167+4
	ldr	r0, .L167+12
	mov	r4, #-1
	bl	printk
.L141:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L143:
	movs	r2, #100
	mov	r1, r3
	strd	r2, r3, [sp, #16]
	add	r2, sp, #12
	ldr	r0, [r5, #64]
	str	r6, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L145
	ldr	r3, .L167+16
	movw	r2, #2841
	str	r0, [sp]
.L164:
	ldr	r1, .L167+4
	ldr	r0, .L167+20
.L165:
	bl	printk
	b	.L141
.L145:
	add	r3, r6, #100
	mov	r0, #672
	str	r3, [sp, #12]
	mov	r1, r4
	mov	r3, #624
	add	r2, sp, #12
	strd	r0, r3, [sp, #16]
	ldr	r0, [r5, #64]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L146
	str	r0, [sp]
	movw	r2, #2842
	ldr	r3, .L167+24
	b	.L164
.L146:
	add	r3, r6, #772
	mov	r1, #320
	str	r3, [sp, #12]
	add	r2, sp, #12
	mov	r3, #4096
	strd	r1, r3, [sp, #16]
	mov	r1, r0
	ldr	r0, [r5, #64]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L147
	str	r0, [sp]
	movw	r2, #2843
	ldr	r3, .L167+28
	b	.L164
.L147:
	addw	r3, r6, #1092
	mov	r2, #720
	str	r3, [sp, #12]
	mov	r1, r0
	mov	r3, #5888
	ldr	r0, [r5, #64]
	strd	r2, r3, [sp, #16]
	add	r2, sp, #12
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L148
	str	r0, [sp]
	movw	r2, #2844
	ldr	r3, .L167+32
	b	.L164
.L148:
	mov	r1, r0
	add	r2, sp, #12
	ldr	r0, [r5, #64]
	addw	r3, r6, #1812
	mov	lr, #356
	str	r3, [sp, #12]
	mov	r3, #8192
	strd	lr, r3, [sp, #16]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L149
	str	r0, [sp]
	movw	r2, #2845
	ldr	r3, .L167+36
	b	.L164
.L149:
	mov	r1, r0
	add	r2, sp, #12
	ldr	r0, [r5, #64]
	addw	r3, r6, #2168
	mov	ip, #1296
	str	r3, [sp, #12]
	mov	r3, #8704
	strd	ip, r3, [sp, #16]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L150
	str	r0, [sp]
	movw	r2, #2847
	ldr	r3, .L167+40
	b	.L164
.L150:
	mov	r0, #304
	mov	r3, #12288
	mov	r1, r4
	strd	r0, r3, [sp, #16]
	add	r2, sp, #12
	ldr	r0, [r5, #64]
	addw	r6, r6, #3464
	str	r6, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L151
	str	r0, [sp]
	mov	r2, #2848
	ldr	r3, .L167+44
	b	.L164
.L151:
	movs	r1, #4
	movs	r3, #44
	add	r2, sp, #12
	strd	r1, r3, [sp, #16]
	ldr	r0, [r5, #64]
	movs	r1, #1
	str	r7, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L152
	ldr	r3, .L167+48
	movw	r2, #2851
	str	r0, [sp]
.L166:
	ldr	r1, .L167+4
	ldr	r0, .L167+52
	b	.L165
.L152:
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
	cbz	r0, .L153
	str	r0, [sp]
	movw	r2, #2852
	ldr	r3, .L167+56
	b	.L166
.L153:
	movs	r2, #0
	movs	r1, #2
	ldr	r0, [r5, #64]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L154
	mov	r3, r0
	movw	r2, #2856
	ldr	r1, .L167+4
	ldr	r0, .L167+60
	bl	printk
.L154:
	ldr	r3, [r8]
	lsls	r3, r3, #29
	bpl	.L141
	movw	r3, #2857
	ldr	r1, .L167+4
	mov	r2, r3
	ldr	r0, .L167+64
	bl	printk
	b	.L141
.L168:
	.align	2
.L167:
	.word	hal_h265e_debug
	.word	.LANCHOR0+139
	.word	.LC0
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_start, .-hal_h265e_v500_start
	.align	1
	.global	hal_h265e_v500_wait
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_wait, %function
hal_h265e_v500_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L179
	mov	r6, r1
	ldr	r2, [r4]
	lsls	r2, r2, #29
	bpl	.L170
	movw	r3, #3038
	ldr	r1, .L179+4
	mov	r2, r3
	ldr	r0, .L179+8
	bl	printk
.L170:
	ldr	r3, [r6, #64]
	cbz	r3, .L171
	movw	r2, #3042
	ldr	r1, .L179+4
	ldr	r0, .L179+12
	mov	r5, #-1
	bl	printk
.L169:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L171:
	mov	r2, r3
	ldr	r0, [r5, #64]
	movs	r1, #3
	bl	mpp_dev_ioctl
	ldr	r3, [r4]
	lsls	r3, r3, #29
	mov	r5, r0
	bpl	.L169
	movw	r3, #3103
	ldr	r1, .L179+4
	mov	r2, r3
	ldr	r0, .L179+16
	bl	printk
	b	.L169
.L180:
	.align	2
.L179:
	.word	hal_h265e_debug
	.word	.LANCHOR0+160
	.word	.LC0
	.word	.LC9
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_wait, .-hal_h265e_v500_wait
	.align	1
	.global	hal_h265e_v500_get_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_get_task, %function
hal_h265e_v500_get_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r7, .L254
	.pad #52
	sub	sp, sp, #52
	mov	r8, r1
	ldr	r5, [r1, #4]
	ldr	r3, [r7]
	lsls	r6, r3, #29
	bpl	.L182
	movw	r3, #3112
	ldr	r1, .L254+4
	mov	r2, r3
	ldr	r0, .L254+8
	bl	printk
.L182:
	ldr	r3, [r8, #68]
	str	r3, [r4, #820]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_roi
	str	r0, [r4, #752]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_osd
	str	r0, [r4, #764]
	ldrb	r3, [r5, #152]	@ zero_extendqisi2
	lsrs	r3, r3, #3
	and	r3, r3, #2
	str	r3, [r4, #744]
	ldr	r3, [r8, #4]
	ldrb	r3, [r3, #156]	@ zero_extendqisi2
	lsls	r5, r3, #29
	bmi	.L183
	ldr	r9, [r4, #768]
	movw	r3, #4844
	ldr	fp, [r4, #788]
	ldr	r10, [r9, r3]
	ldr	r3, [r4, #780]
	str	r3, [sp, #16]
	ldr	r3, [r9, #12]
	adds	r3, r3, #31
	bic	r3, r3, #31
	str	r3, [sp, #20]
	ldr	r3, [r7]
	lsls	r0, r3, #29
	bpl	.L184
	movw	r3, #331
	ldr	r1, .L254+12
	mov	r2, r3
	ldr	r0, .L254+8
	bl	printk
.L184:
	ldr	r3, [r9, #12]
	mov	r0, fp
	ldr	r5, [r9, #16]
	add	r6, r3, #31
	adds	r3, r3, #15
	add	r2, r5, #31
	adds	r5, r5, #15
	bic	r3, r3, #15
	bic	r5, r5, #15
	asrs	r2, r2, #5
	str	r2, [sp, #24]
	muls	r5, r3, r5
	ldr	r3, [r4, #768]
	asrs	r6, r6, #5
	ldr	r1, [r3, #36]
	bl	vepu5xx_set_fmt
	ldr	r3, [fp]
	cmp	r3, #13
	bhi	.L185
	tbb	[pc, r3]
.L187:
	.byte	(.L191-.L187)/2
	.byte	(.L186-.L187)/2
	.byte	(.L189-.L187)/2
	.byte	(.L185-.L187)/2
	.byte	(.L189-.L187)/2
	.byte	(.L189-.L187)/2
	.byte	(.L190-.L187)/2
	.byte	(.L190-.L187)/2
	.byte	(.L189-.L187)/2
	.byte	(.L189-.L187)/2
	.byte	(.L188-.L187)/2
	.byte	(.L185-.L187)/2
	.byte	(.L186-.L187)/2
	.byte	(.L186-.L187)/2
	.p2align 1
.L190:
	add	r5, r5, r5, lsl #1
	lsrs	r5, r5, #1
.L188:
	cmp	r10, #0
	beq	.L221
	mov	r0, r10
	bl	mpp_enc_ref_cfg_get_cpb_info
	ldr	r3, [r0]
	add	r8, r3, #1
	ldr	r3, [r0, #4]
	cmp	r8, #2
	it	lt
	movlt	r8, #2
	str	r3, [sp, #28]
.L193:
	ldr	r3, [sp, #20]
	cmp	r3, #2880
	ble	.L194
	movs	r3, #27
	mvn	r1, #2144
	muls	r3, r6, r3
	add	r10, r3, r1
	cmp	r10, #0
	it	lt
	subwlt	r10, r3, #2130
	ldr	r3, [r4, #932]
	asr	r10, r10, #4
	ldr	fp, [r3, #8]
	lsl	r10, r10, #8
	cmp	fp, #0
	bne	.L196
	ldr	r0, [r4, #956]
	cbz	r0, .L197
	ldr	r3, [r4, #952]
	cmp	r10, r3
	ble	.L198
	ldr	r1, .L254+16
	bl	mpp_buffer_put_with_caller
	str	fp, [r4, #956]
.L197:
	ldr	r3, .L254+16
	mov	r2, r10
	add	r1, r4, #956
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L254+20
	bl	mpp_buffer_get_with_tag
	b	.L198
.L189:
	lsls	r5, r5, #1
	b	.L188
.L186:
	add	r5, r5, r5, lsl #1
	b	.L188
.L191:
	lsls	r5, r5, #2
	b	.L188
.L185:
	mov	r2, #362
	ldr	r1, .L254+12
	ldr	r0, .L254+24
	bl	printk
	movw	r2, #3122
	ldr	r1, .L254+4
	ldr	r0, .L254+28
	bl	printk
	ldr	r3, [r8, #64]
	mvn	r0, #3
	orr	r3, r3, #16
	str	r3, [r8, #64]
.L181:
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L221:
	mov	r8, #2
	b	.L193
.L255:
	.align	2
.L254:
	.word	hal_h265e_debug
	.word	.LANCHOR0+180
	.word	.LC0
	.word	.LANCHOR0+204
	.word	.LANCHOR0+232
	.word	.LC25
	.word	.LC22
	.word	.LC23
.L196:
	str	fp, [r4, #956]
.L198:
	str	r10, [r4, #952]
.L199:
	ldrd	r3, r1, [r9, #28]
	addw	r2, r3, #511
	add	r0, r1, #31
	addw	r1, r1, #511
	adds	r3, r3, #31
	asr	r9, r2, #9
	bic	r3, r3, #31
	bic	r2, r0, #31
	asrs	r1, r1, #9
	mov	r0, r9
	muls	r2, r0, r2
	it	mi
	addmi	r2, r2, #31
	muls	r3, r1, r3
	it	mi
	addmi	r3, r3, #31
	asrs	r2, r2, #5
	asrs	r3, r3, #5
	lsls	r2, r2, #4
	lsl	r9, r3, #4
	ldr	r3, [r4, #776]
	cmp	r9, r2
	it	lt
	movlt	r9, r2
	cmp	r3, r5
	bne	.L203
	ldr	r3, [sp, #16]
	cmp	r3, r8
	bne	.L203
	ldr	r3, [r4, #824]
	cmp	r9, r3
	beq	.L204
.L203:
	movs	r2, #16
	movs	r1, #0
	add	r0, sp, #32
	bl	memset
	ldr	r3, [r4, #932]
	ldr	r3, [r3]
	cbnz	r3, .L205
	ldr	r0, [r4, #808]
	cbz	r0, .L206
	bl	hal_bufs_deinit
.L206:
	add	r0, r4, #808
	bl	hal_bufs_init
.L205:
	ldr	r3, [sp, #16]
	cmp	r8, r3
	it	lt
	movlt	r8, r3
	ldr	r3, [r7]
	lsls	r2, r3, #28
	bpl	.L207
	ldr	r3, [sp, #16]
	mov	r2, #412
	str	r8, [sp, #8]
	ldr	r1, .L256
	strd	r5, r3, [sp]
	ldr	r0, .L256+4
	ldr	r3, [r4, #776]
	bl	printk
.L207:
	ldr	r2, [sp, #24]
	ldr	r3, [r4, #768]
	mul	r10, r2, r6
	ldr	r2, [r3, #732]
	cbz	r2, .L208
	lsl	r2, r10, #4
	str	r2, [sp, #36]
.L208:
	ldr	r2, [r4, #828]
	cmp	r2, #0
	beq	.L209
	ldr	r2, [r3, #28]
	movs	r0, #48
	ldr	r3, [r3, #32]
	movs	r1, #240
	adds	r2, r2, #63
	ldr	r6, .L256+8
	adds	r3, r3, #63
	bic	r2, r2, #63
	bic	r3, r3, #63
	cmp	r2, r3
	mul	ip, r3, r2
	it	lt
	movlt	r2, r3
	muls	r0, r2, r0
	muls	r1, r2, r1
	add	r3, ip, ip, lsl #1
	cmp	ip, #0
	it	lt
	addlt	ip, ip, #63
	addw	r0, r0, #4095
	add	r0, r0, r3, asr #1
	asrs	r3, r2, #1
	add	r2, r2, r2, lsl #1
	add	ip, r3, ip, asr #6
	addw	r3, r2, #4095
	ldr	r2, [sp, #28]
	addw	r1, r1, #4095
	addw	ip, ip, #4095
	ands	r0, r0, r6
	and	ip, ip, r6
	ands	r1, r1, r6
	ands	r3, r3, r6
	cmp	r2, #0
	add	r1, r1, r0
	add	r3, r3, ip
	str	r0, [r4, #924]
	str	r1, [r4, #928]
	add	r6, r1, r3
	str	ip, [r4, #876]
	str	r3, [r4, #880]
	ble	.L211
	ldr	r2, [r4, #960]
	strd	r0, r1, [r4, #900]
	strd	ip, r3, [r4, #852]
	cbz	r2, .L212
	str	r0, [r4, #904]
	str	ip, [r4, #856]
.L212:
	ldr	r0, [r4, #856]
	ldr	r2, [r4, #904]
	add	r3, r3, r0
	str	r3, [r4, #884]
	add	ip, r2, r0
	add	r2, r2, r3
	add	r6, r6, ip
	add	r1, r1, r2
	mov	ip, #0
	str	r0, [r4, #860]
	strd	ip, r0, [r4, #836]
	str	ip, [r4, #844]
	strd	r3, r0, [r4, #864]
	strd	r2, r3, [r4, #888]
	str	r2, [r4, #908]
	strd	r1, r2, [r4, #912]
.L220:
	ldr	r3, [r4, #932]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L213
	ldr	r0, [r4, #832]
	cbz	r0, .L214
	ldr	r1, .L256+12
	bl	mpp_buffer_put_with_caller
.L214:
	ldr	r3, .L256+12
	mov	r2, r6
	add	r1, r4, #832
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L256+16
	bl	mpp_buffer_get_with_tag
.L215:
	movs	r3, #0
.L253:
	str	r3, [sp, #44]
	lsl	r3, r10, #6
	str	r3, [sp, #32]
	ldr	r3, [r4, #932]
	str	r9, [sp, #40]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L217
	str	r3, [r4, #808]
.L218:
	movs	r3, #1
	str	r9, [r4, #824]
	strd	r5, r8, [r4, #776]
	str	r3, [r4, #936]
.L204:
	ldr	r3, [r7]
	lsls	r3, r3, #29
	bpl	.L219
	movw	r3, #437
	ldr	r1, .L256
	mov	r2, r3
	ldr	r0, .L256+20
	bl	printk
.L219:
	mov	r2, #328
	add	r1, r4, #80
	add	r0, r4, #408
	bl	memcpy
.L183:
	mov	r2, #328
	movs	r1, #0
	add	r0, r4, #80
	bl	memset
	ldr	r0, [r7]
	ands	r0, r0, #4
	beq	.L181
	movw	r3, #3131
	ldr	r1, .L256+24
	mov	r2, r3
	ldr	r0, .L256+20
	bl	printk
	movs	r0, #0
	b	.L181
.L194:
	ldr	r0, [r4, #956]
	cbz	r0, .L200
	ldr	r3, [r4, #932]
	ldr	r10, [r3, #8]
	cmp	r10, #0
	bne	.L200
	ldr	r1, .L256+28
	bl	mpp_buffer_put_with_caller
	str	r10, [r4, #956]
.L200:
	movs	r3, #0
	str	r3, [r4, #952]
	b	.L199
.L213:
	str	r3, [r4, #832]
	b	.L215
.L209:
	add	r6, r6, r10
	lsls	r3, r6, #4
	lsls	r2, r6, #11
	addw	r3, r3, #4095
	add	r6, r2, r6, lsl #10
	bic	r3, r3, #4080
	bic	r3, r3, #15
	str	r3, [r4, #812]
	add	r3, r3, r6, asr #1
	b	.L253
.L217:
	add	r3, sp, #32
	movs	r2, #4
	mov	r1, r8
	ldr	r0, [r4, #808]
	bl	hal_bufs_setup
	b	.L218
.L211:
	movs	r2, #0
	strd	r3, r6, [r4, #908]
	strd	r2, r3, [r4, #860]
	str	r2, [r4, #868]
	str	r3, [r4, #916]
	b	.L220
.L257:
	.align	2
.L256:
	.word	.LANCHOR0+204
	.word	.LC24
	.word	-4096
	.word	.LANCHOR0+260
	.word	.LC25
	.word	.LC1
	.word	.LANCHOR0+180
	.word	.LANCHOR0+232
	.fnend
	.size	hal_h265e_v500_get_task, .-hal_h265e_v500_get_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_comb_start, %function
hal_h265e_v500_comb_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r2
	ldr	r6, .L275
	.pad #36
	sub	sp, sp, #36
	mov	r4, r0
	mov	r9, r1
	ldr	r5, [r0, #68]
	ldr	r3, [r6]
	lsls	r2, r3, #29
	bpl	.L259
	movw	r3, #3202
	ldr	r1, .L275+4
	mov	r2, r3
	ldr	r0, .L275+8
	bl	printk
.L259:
	ldrb	r3, [r5, #48]	@ zero_extendqisi2
	movs	r2, #7
	add	r0, sp, #4
	addw	r8, r5, #3080
	bfi	r3, r2, #0, #4
	strb	r3, [r5, #48]
	ldr	r3, [r4, #64]
	strd	r8, r7, [sp, #12]
	str	r3, [sp, #4]
	add	r3, r5, #500
	str	r3, [sp, #8]
	ldr	r3, [r4, #788]
	str	r3, [sp, #20]
	ldr	r3, [r4, #820]
	str	r3, [sp, #24]
	bl	vepu500_set_jpeg_reg
	ldr	r1, [r7, #76]
	cbz	r1, .L260
	mov	r2, #384
	mov	r0, r8
	bl	memcpy
.L260:
	ldr	r1, [r7, #72]
	cbz	r1, .L261
	mov	r2, #304
	addw	r0, r5, #3464
	bl	memcpy
.L261:
	ldr	r3, [r6]
	lsls	r3, r3, #29
	bpl	.L262
	movw	r3, #3218
	ldr	r1, .L275+4
	mov	r2, r3
	ldr	r0, .L275+12
	bl	printk
.L262:
	mov	r1, r9
	mov	r0, r4
	bl	hal_h265e_v500_start
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L276:
	.align	2
.L275:
	.word	hal_h265e_debug
	.word	.LANCHOR0+273
	.word	.LC0
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_comb_start, .-hal_h265e_v500_comb_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_vepu500_prepare, %function
hal_h265e_vepu500_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L290
	ldr	r6, [r0, #768]
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L278
	mov	r3, r0
	movw	r2, #598
	ldr	r1, .L290+4
	ldr	r0, .L290+8
	bl	printk
.L278:
	ldr	r3, [r6, #8]
	tst	r3, #5
	itt	ne
	movne	r3, #0
	strne	r3, [r6, #8]
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L280
	mov	r3, r5
	mov	r2, #604
	ldr	r1, .L290+4
	ldr	r0, .L290+12
	bl	printk
.L280:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L291:
	.align	2
.L290:
	.word	hal_h265e_debug
	.word	.LANCHOR0+299
	.word	.LC26
	.word	.LC27
	.fnend
	.size	hal_h265e_vepu500_prepare, .-hal_h265e_vepu500_prepare
	.global	__aeabi_idiv
	.align	1
	.global	hal_h265e_v500_ret_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_ret_task, %function
hal_h265e_v500_ret_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L351
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r3, [r3]
	.pad #44
	sub	sp, sp, #44
	mov	r9, r1
	lsls	r2, r3, #29
	bpl	.L293
	movw	r3, #3177
	ldr	r1, .L351+4
	mov	r2, r3
	ldr	r0, .L351+8
	bl	printk
.L293:
	mov	r1, r9
	mov	r0, r4
	bl	vepu500_h265_set_feedback
	str	r0, [sp, #36]
	cmp	r0, #0
	bne	.L292
	ldr	r3, [r4, #92]
	ldr	r10, [r9, #4]
	str	r3, [r9, #44]
	ldr	r3, [r9, #48]
	ldr	r2, [r4, #92]
	add	r3, r3, r2
	str	r3, [r9, #48]
	ldr	r3, [r4, #768]
	ldr	r5, [r4, #72]
	ldr	fp, [r4, #68]
	ldr	r2, [r3, #12]
	ldr	r3, [r3, #16]
	adds	r2, r2, #15
	ldrh	r7, [r5, #228]
	adds	r3, r3, #15
	bic	r1, r2, #15
	bic	r2, r3, #15
	ldrh	r3, [r5, #204]
	muls	r2, r1, r2
	ldrh	r1, [r5, #196]
	it	mi
	addmi	r2, r2, #255
	add	r1, r1, r3
	ldrh	r3, [r5, #212]
	asrs	r2, r2, #8
	add	r1, r1, r3
	ldrh	r3, [r5, #220]
	adds	r3, r1, r3
	ldrh	r1, [r5, #198]
	str	r3, [sp, #28]
	ldrh	r3, [r5, #206]
	add	r1, r1, r3
	ldrh	r3, [r5, #214]
	add	r1, r1, r3
	ldrh	r3, [r5, #222]
	adds	r3, r1, r3
	ldrh	r1, [r5, #200]
	str	r3, [sp, #16]
	ldrh	r3, [r5, #208]
	add	r1, r1, r3
	ldrh	r3, [r5, #216]
	add	r1, r1, r3
	ldrh	r3, [r5, #224]
	adds	r3, r1, r3
	ldrh	r1, [r5, #202]
	str	r3, [sp, #20]
	ldrh	r3, [r5, #210]
	add	r1, r1, r3
	ldrh	r3, [r5, #218]
	add	r1, r1, r3
	ldrh	r3, [r5, #226]
	adds	r3, r1, r3
	str	r3, [sp, #24]
	ldrh	r3, [r5, #236]
	ldrh	r8, [r5, #244]
	add	r7, r7, r3
	ldrh	r1, [r5, #254]
	add	r7, r7, r8
	ldrh	r8, [r5, #252]
	ldrh	r6, [r5, #234]
	add	r3, r7, r8
	ldrh	r7, [r5, #230]
	str	r3, [sp, #32]
	ldrh	r3, [r5, #238]
	ldrh	r8, [r5, #232]
	add	r7, r7, r3
	ldrh	r3, [r5, #246]
	ldr	r0, [sp, #24]
	add	r7, r7, r3
	ldrh	r3, [r5, #240]
	add	r7, r7, r1
	ldrh	r1, [r5, #248]
	add	r8, r8, r3
	ldr	r3, [sp, #20]
	add	r8, r8, r1
	ldrh	r1, [r5, #256]
	add	r8, r8, r1
	ldrh	r1, [r5, #242]
	add	r6, r6, r1
	ldrh	r1, [r5, #250]
	add	r6, r6, r1
	ldrh	r1, [r5, #258]
	add	r6, r6, r1
	add	r1, r3, r3, lsl #2
	movs	r3, #6
	mla	r3, r3, r0, r1
	ldr	r1, [sp, #16]
	add	r3, r3, r1, lsl #2
	movs	r1, #100
	lsrs	r3, r3, #2
	muls	r3, r1, r3
	movs	r1, #30
	muls	r1, r2, r1
	cmp	r3, r1
	bhi	.L320
	movs	r1, #13
	muls	r1, r2, r1
	cmp	r3, r1
	ite	ls
	movls	r1, #0
	movhi	r1, #1
.L296:
	str	r1, [r10, #208]
	ldr	r3, [r4, #944]
	cmp	r3, #0
	beq	.L297
	movs	r3, #11
	mul	r0, r3, r8
	movs	r3, #12
	mla	r3, r3, r6, r0
	add	r3, r3, r7, lsl #3
.L347:
	lsrs	r3, r3, #2
	movs	r0, #100
	rsb	ip, r2, r2, lsl #4
	muls	r3, r0, r3
	cmp	r3, ip
	bhi	.L321
	add	ip, r2, r2, lsl #2
	cmp	r3, ip
	bhi	.L299
	cmp	r3, r2, lsr #2
	ite	hi
	movhi	r0, #1
	movls	r0, #0
.L299:
	ldr	r3, .L351
	str	r0, [r10, #204]
	ldr	r3, [r3]
	lsls	r3, r3, #13
	bpl	.L300
	ldr	r3, [r4, #804]
	movw	r2, #3001
	strd	r1, r0, [sp]
	subs	r3, r3, #1
	ldr	r1, .L351+12
	ldr	r0, .L351+16
	bl	printk
.L300:
	ldrb	ip, [fp, #874]	@ zero_extendqisi2
	ldr	r0, [sp, #24]
	ldrb	r2, [fp, #872]	@ zero_extendqisi2
	ldr	r3, [sp, #28]
	ldrb	r1, [fp, #873]	@ zero_extendqisi2
	mul	r0, r0, ip
	mla	r0, r3, r2, r0
	ldr	r3, [sp, #16]
	add	r2, r2, r1
	muls	r2, r3, r2
	add	r3, ip, r1
	add	r0, r0, r2, lsr #1
	ldr	r2, [sp, #20]
	muls	r3, r2, r3
	ldr	r2, [sp, #16]
	add	r0, r0, r3, lsr #1
	ldr	r3, [sp, #28]
	adds	r1, r3, r2
	ldr	r3, [sp, #20]
	add	r1, r1, r3
	ldr	r3, [sp, #24]
	adds	r1, r1, r3
	bne	.L301
.L348:
	str	r0, [r4, #356]
	ldrh	r2, [fp, #878]
	ldrh	r3, [fp, #876]
	ubfx	r1, r2, #0, #12
	ldrh	r2, [fp, #880]
	ubfx	r3, r3, #0, #12
	adds	r0, r3, r1
	ubfx	r2, r2, #0, #12
	mul	ip, r7, r0
	ldr	r0, [sp, #32]
	mul	lr, r6, r2
	add	r2, r2, r1
	mla	r0, r0, r3, lr
	ldr	r3, [sp, #32]
	mul	r2, r8, r2
	add	r7, r7, r3
	add	r8, r8, r7
	add	r0, r0, ip, lsr #1
	adds	r1, r8, r6
	add	r0, r0, r2, lsr #1
	bne	.L303
.L349:
	str	r0, [r4, #352]
	ldr	r2, [r5, #164]
	ldr	r3, [r4, #360]
	ubfx	r2, r2, #0, #23
	ldr	r5, .L351
	add	r3, r3, r2
	str	r3, [r4, #360]
	ldr	r3, [r9, #4]
	ldr	r2, [r4, #92]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r2, r2, #3
	lsrs	r3, r3, #3
	and	r3, r3, #2
	str	r3, [r4, #84]
	str	r2, [r10, #184]
	ldr	r1, [r4, #356]
	ldr	r3, [r5]
	str	r1, [r10, #192]
	lsls	r6, r3, #13
	ldr	r0, [r4, #352]
	str	r0, [r10, #196]
	bpl	.L305
	strd	r1, r0, [sp, #8]
	ldr	r1, [r10, #188]
	ldr	r3, [r4, #804]
	ldr	r0, .L351+20
	strd	r2, r1, [sp]
	subs	r3, r3, #1
	movw	r2, #3028
	ldr	r1, .L351+12
	bl	printk
.L305:
	ldr	r3, [r9, #4]
	ldr	r0, [r4, #728]	@ unaligned
	ldrh	r1, [r4, #732]	@ unaligned
	ldr	r2, [r3, #160]
	ldr	r3, [r3, #184]
	str	r0, [r4, #400]	@ unaligned
	ldrsb	r6, [r4, #403]
	cmp	r2, r3
	ldrsb	r7, [r4, #402]
	ldrsb	r0, [r4, #401]
	ldrsb	ip, [r4, #400]
	strh	r1, [r4, #404]	@ unaligned
	strb	r7, [r4, #403]
	strb	r6, [r4, #404]
	strb	r0, [r4, #402]
	strb	ip, [r4, #401]
	ble	.L306
	movs	r1, #6
	muls	r1, r3, r1
	it	mi
	addmi	r1, r1, #3
	cmp	r2, r1, asr #2
	bgt	.L323
	adds	r1, r3, r3, lsl #2
	it	mi
	addmi	r1, r1, #3
	cmp	r2, r1, asr #2
	bgt	.L324
	adds	r1, r3, r3, lsl #3
	it	mi
	addmi	r1, r1, #7
	asrs	r1, r1, #3
	cmp	r1, r2
	ite	ge
	movge	r2, #0
	movlt	r2, #1
.L307:
	strb	r2, [r4, #400]
.L311:
	add	r3, r0, ip
	ldrsb	r2, [r4, #400]
	add	r3, r3, r7
	add	r3, r3, r6
	add	r3, r3, r2
	ldr	r2, [r9, #4]
	ldrb	r2, [r2, #152]	@ zero_extendqisi2
	lsls	r1, r2, #27
	itt	mi
	movmi	r2, #0
	strbmi	r2, [r4, #405]
	cmn	r3, #9
	bge	.L317
	movs	r3, #2
.L350:
	strb	r3, [r4, #405]
.L318:
	ldr	r3, [r5]
	lsls	r2, r3, #28
	bpl	.L319
	ldr	r3, [r4, #92]
	movw	r2, #3189
	ldr	r1, .L351+4
	ldr	r0, .L351+24
	bl	printk
	b	.L352
.L353:
	.align	2
.L351:
	.word	hal_h265e_debug
	.word	.LANCHOR0+325
	.word	.LC0
	.word	.LANCHOR0+349
	.word	.LC28
	.word	.LC29
	.word	.LC8
.L352:
.L319:
	ldr	r3, [r5]
	lsls	r3, r3, #29
	bpl	.L292
	movw	r3, #3191
	ldr	r1, .L354
	mov	r2, r3
	ldr	r0, .L354+4
	bl	printk
.L292:
	ldr	r0, [sp, #36]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L320:
	movs	r1, #2
	b	.L296
.L297:
	movs	r3, #22
	mul	r0, r3, r8
	movs	r3, #24
	mla	r3, r3, r6, r0
	add	r0, r7, r7, lsl #4
	add	r3, r3, r0
	b	.L347
.L321:
	movs	r0, #200
	b	.L299
.L301:
	bl	__aeabi_uidiv
	b	.L348
.L303:
	bl	__aeabi_uidiv
	b	.L349
.L323:
	movs	r2, #3
	b	.L307
.L324:
	movs	r2, #2
	b	.L307
.L306:
	cmp	r3, r2, lsl #1
	bgt	.L325
	rsbs	r1, r2, r2, lsl #3
	it	mi
	addmi	r1, r1, #3
	cmp	r3, r1, asr #2
	bgt	.L326
	movs	r1, #6
	muls	r1, r2, r1
	it	mi
	addmi	r1, r1, #3
	cmp	r3, r1, asr #2
	bgt	.L327
	adds	r2, r2, r2, lsl #2
	it	mi
	addmi	r2, r2, #3
	cmp	r3, r2, asr #2
	ite	gt
	mvngt	r3, #1
	movle	r3, #-1
.L312:
	strb	r3, [r4, #400]
	b	.L311
.L325:
	mvn	r3, #4
	b	.L312
.L326:
	mvn	r3, #3
	b	.L312
.L327:
	mvn	r3, #2
	b	.L312
.L317:
	adds	r3, r3, #2
	bge	.L318
	ldrsb	r3, [r4, #405]
	cmp	r3, #1
	bgt	.L318
	movs	r3, #1
	b	.L350
.L355:
	.align	2
.L354:
	.word	.LANCHOR0+325
	.word	.LC1
	.fnend
	.size	hal_h265e_v500_ret_task, .-hal_h265e_v500_ret_task
	.global	__aeabi_uidivmod
	.align	1
	.global	vepu500_h265_set_hw_address
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_h265_set_hw_address, %function
vepu500_h265_set_hw_address:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r8, [r0, #788]
	.pad #92
	sub	sp, sp, #92
	ldr	r0, [r2, #28]
	mov	r6, r2
	ldr	r7, [r2, #16]
	mov	r5, r1
	bl	mpp_packet_get_length
	ldr	r3, .L446
	ldr	r2, [r3]
	tst	r2, #4
	str	r0, [sp, #36]
	str	r3, [sp, #56]
	beq	.L357
	mov	r3, #1408
	ldr	r1, .L446+4
	mov	r2, r3
	ldr	r0, .L446+8
	bl	printk
.L357:
	ldr	r3, [r4, #820]
	cbnz	r3, .L358
	movs	r2, #160
	ldr	r1, [r6, #56]
	ldr	r0, [r4, #64]
	bl	mpp_dev_get_iova_address
	strd	r0, r0, [r5, #16]
	str	r0, [r5, #24]
	ldr	r9, [r8]
	ldrh	r8, [r7, #10]
	ldrh	r10, [r7, #8]
	cmp	r8, #0
	bne	.L360
	ldrh	r8, [r7, #6]
.L360:
	ldr	r0, [r6, #52]
	bl	mpp_frame_get_fmt
	ands	r0, r0, #15728640
	beq	.L361
	ldr	r0, [r6, #52]
	bl	mpp_frame_get_fbc_offset
	mov	r8, r0
	movs	r0, #0
.L362:
	ldr	r3, [r5, #20]
	add	r3, r3, r8
	str	r3, [r5, #20]
	ldr	r3, [r5, #24]
	add	r0, r0, r3
	str	r0, [r5, #24]
.L358:
	ldrb	r1, [r7, #232]	@ zero_extendqisi2
	ldr	r0, [r4, #808]
	bl	hal_bufs_get_buf
	ldrb	r1, [r7, #234]	@ zero_extendqisi2
	mov	r8, r0
	ldr	r0, [r4, #808]
	bl	hal_bufs_get_buf
	ldr	r7, [r4, #828]
	str	r0, [sp, #48]
	cmp	r7, #0
	beq	.L369
	ldr	r3, [r6, #16]
	ldr	r1, [r4, #832]
	ldr	r0, [r4, #64]
	ldr	r2, [r3, #292]
	ldrb	r10, [r3, #233]	@ zero_extendqisi2
	ldrb	r9, [r3, #235]	@ zero_extendqisi2
	str	r2, [sp, #52]
	movs	r2, #163
	str	r3, [sp, #60]
	bl	mpp_dev_get_iova_address
	ldr	r2, [r4, #744]
	cmp	r2, #2
	mov	r7, r0
	ldr	r3, [sp, #60]
	bne	.L370
	ldrb	r2, [r3, #232]	@ zero_extendqisi2
	ldrb	r3, [r3, #234]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L370
	ldr	r3, [sp, #56]
	ldr	r3, [r3]
	lsls	r3, r3, #23
	bpl	.L371
	mov	r3, r10
	mov	r2, #1272
	ldr	r1, .L446+12
	ldr	r0, .L446+16
	bl	printk
.L371:
	ldr	r3, [r4, #860]
	str	r3, [sp, #24]
	ldr	r3, [r4, #864]
	str	r3, [sp, #20]
	ldr	r3, [r4, #908]
	str	r3, [sp, #32]
	ldr	r3, [r4, #912]
	str	r3, [sp, #28]
	cmp	r10, #0
	beq	.L372
	ldr	r3, [r4, #844]
	ldr	r2, [sp, #24]
	ldr	fp, [r4, #892]
	str	r3, [sp, #16]
	ldr	r3, [r4, #836]
	str	fp, [sp, #44]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r4, #840]
	str	r2, [sp, #24]
	ldr	r2, [sp, #20]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r4, #884]
	str	r2, [sp, #20]
	ldr	r2, [sp, #32]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r4, #888]
	str	r2, [sp, #32]
	ldr	r2, [sp, #28]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [sp, #16]
	str	r2, [sp, #28]
.L443:
	str	r3, [sp, #40]
.L373:
	ldr	r3, [sp, #16]
	add	r3, r3, r7
	str	r3, [r5, #28]
	add	r3, r7, fp
	str	r3, [r5, #32]
	ldr	r3, [sp, #40]
	add	r3, r3, r7
	str	r3, [r5, #36]
	ldr	r3, [sp, #44]
	add	r3, r3, r7
	str	r3, [r5, #40]
	ldr	r3, [sp, #20]
	add	r3, r3, r7
	str	r3, [r5, #96]
	ldr	r3, [sp, #24]
	add	r3, r3, r7
	str	r3, [r5, #100]
	ldr	r3, [sp, #28]
	add	r3, r3, r7
	str	r3, [r5, #104]
	ldr	r3, [sp, #32]
	add	r7, r7, r3
	str	r7, [r5, #108]
	ldr	r7, .L446
	ldr	r3, [r7]
	lsls	r1, r3, #23
	bpl	.L404
	ldr	r3, [sp, #52]
	movw	r2, #1379
	ldr	r1, .L446+12
	clz	r3, r3
	ldr	r0, .L446+20
	lsrs	r3, r3, #5
	bl	printk
	ldr	r3, [r7]
	lsls	r2, r3, #23
	bpl	.L404
	ldr	r3, [r4, #872]
	movw	r2, #1381
	ldr	r1, .L446+12
	ldr	r0, .L446+24
	str	r3, [sp, #12]
	ldr	r3, [r4, #868]
	str	r3, [sp, #8]
	ldr	r3, [r4, #860]
	str	r3, [sp, #4]
	ldr	r3, [r4, #864]
	str	r3, [sp]
	ldr	r3, [r4, #876]
	bl	printk
	ldr	r3, [r7]
	lsls	r3, r3, #23
	bpl	.L404
	ldr	r3, [r4, #920]
	movw	r2, #1383
	ldr	r1, .L446+12
	ldr	r0, .L446+28
	str	r3, [sp, #12]
	ldr	r3, [r4, #916]
	str	r3, [sp, #8]
	ldr	r3, [r4, #908]
	str	r3, [sp, #4]
	ldr	r3, [r4, #912]
	str	r3, [sp]
	ldr	r3, [r4, #924]
	bl	printk
.L404:
	ldr	r3, [sp, #52]
	cbnz	r3, .L389
	ldr	r3, [r4, #868]
	ldr	r2, [r4, #876]
	str	r3, [r4, #872]
	add	r3, r3, r2
	ldr	r2, [r4, #864]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r4, #860]
	addcs	r3, r3, r2
	str	r3, [r4, #868]
	ldr	r3, [r4, #916]
	ldr	r2, [r4, #924]
	str	r3, [r4, #920]
	add	r3, r3, r2
	ldr	r2, [r4, #912]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r4, #908]
	addcs	r3, r3, r2
	str	r3, [r4, #916]
.L389:
	ldr	r3, [r8, #4]
	movs	r2, #185
	ldr	r0, [r4, #64]
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	movs	r2, #184
	ldr	r3, [sp, #48]
	str	r0, [r5, #116]
	ldr	r0, [r4, #64]
	ldr	r3, [r3, #4]
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	str	r0, [r5, #112]
	ldr	r3, [r4, #768]
	ldr	r3, [r3, #732]
	cbz	r3, .L392
	ldr	r3, [r8, #4]
	movs	r2, #167
	ldr	r0, [r4, #64]
	ldr	r1, [r3, #4]
	bl	mpp_dev_get_iova_address
	movs	r2, #168
	ldr	r3, [sp, #48]
	str	r0, [r5, #44]
	ldr	r0, [r4, #64]
	ldr	r3, [r3, #4]
	ldr	r1, [r3, #4]
	bl	mpp_dev_get_iova_address
	str	r0, [r5, #48]
.L392:
	ldr	r3, [r8, #4]
	movs	r2, #169
	ldr	r0, [r4, #64]
	ldr	r1, [r3]
	bl	mpp_dev_get_iova_address
	movs	r2, #170
	ldr	r3, [sp, #48]
	str	r0, [r5, #52]
	ldr	r0, [r4, #64]
	ldr	r3, [r3, #4]
	ldr	r1, [r3]
	bl	mpp_dev_get_iova_address
	str	r0, [r5, #56]
	ldr	r3, [r6, #32]
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L393
	ldr	r1, .L446+32
	ldr	r0, [r3]
	bl	mpp_buffer_get_size_with_caller
	ldr	r3, [r6, #32]
	movs	r2, #173
	ldr	r1, [r3]
	mov	r9, r0
	ldr	r0, [r4, #64]
	bl	mpp_dev_get_iova_address
	mov	r1, r9
	str	r0, [r5, #68]
	mov	r7, r0
	ldr	r3, [r6, #32]
	ldr	r0, [r3, #12]
	ldr	r3, [sp, #36]
	add	r0, r0, r3
	bl	__aeabi_uidivmod
	add	r1, r1, r7
	str	r1, [r5, #72]
	ldr	r3, [r6, #32]
	ldr	r3, [r3, #16]
	b	.L447
.L448:
	.align	2
.L446:
	.word	hal_h265e_debug
	.word	.LANCHOR0+380
	.word	.LC0
	.word	.LANCHOR0+432
	.word	.LC31
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LANCHOR0+472
.L447:
	add	r3, r3, r7
	add	r7, r7, r9
	str	r3, [r5, #76]
	str	r7, [r5, #64]
.L394:
	ldr	r0, [r6, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r3, [r5, #194]
	bfi	r3, r0, #0, #14
	strh	r3, [r5, #194]	@ movhi
	ldr	r0, [r6, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r3, [r5, #192]
	bfi	r3, r0, #0, #14
	strh	r3, [r5, #192]	@ movhi
	ldr	r3, [sp, #36]
	cbz	r3, .L397
	ldr	r3, [r6, #32]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L398
	ldr	r2, [sp, #36]
	ldr	r1, .L449
	str	r2, [r3, #20]
	ldr	r0, [r6, #32]
	bl	mpp_buffer_flush_for_device_with_caller
.L397:
	ldr	r3, [r4, #936]
	cmp	r3, #0
	beq	.L356
	ldr	r3, [r4, #828]
	cmp	r3, #0
	beq	.L400
	ldr	r5, [r4, #880]
	ldr	r3, [r4, #856]
	ldr	r6, [r4, #832]
	add	r5, r5, r3
.L401:
	ldr	r1, .L449
	mov	r0, r6
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L449
	mov	r7, r0
	mov	r0, r6
	bl	mpp_buffer_get_dma_with_caller
	mov	r6, r0
	cbnz	r7, .L402
	movw	r1, #1503
	ldr	r3, .L449
	str	r1, [sp]
	ldr	r2, .L449+4
	ldr	r0, .L449+8
	bl	printk
.L402:
	cbnz	r6, .L403
	mov	r1, #1504
	ldr	r3, .L449
	str	r1, [sp]
	ldr	r2, .L449+12
	ldr	r0, .L449+8
	bl	printk
.L403:
	mov	r2, r5
	movs	r1, #0
	mov	r0, r7
	bl	memset
	mov	r3, r5
	movs	r2, #0
	movs	r1, #1
	mov	r0, r6
	bl	dma_buf_end_cpu_access_partial
	movs	r3, #0
	str	r3, [r4, #936]
.L356:
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L361:
	mul	r8, r8, r10
	cmp	r9, #13
	bhi	.L363
	tbb	[pc, r9]
.L365:
	.byte	(.L366-.L365)/2
	.byte	(.L366-.L365)/2
	.byte	(.L366-.L365)/2
	.byte	(.L363-.L365)/2
	.byte	(.L405-.L365)/2
	.byte	(.L368-.L365)/2
	.byte	(.L405-.L365)/2
	.byte	(.L442-.L365)/2
	.byte	(.L366-.L365)/2
	.byte	(.L366-.L365)/2
	.byte	(.L363-.L365)/2
	.byte	(.L363-.L365)/2
	.byte	(.L405-.L365)/2
	.byte	(.L364-.L365)/2
	.p2align 1
.L366:
	mov	r8, #0
	b	.L362
.L368:
	add	r0, r8, r8, lsl #1
	lsrs	r0, r0, #1
	b	.L362
.L364:
	lsl	r0, r8, #1
	b	.L362
.L363:
	mov	r3, r9
	movw	r2, #662
	ldr	r1, .L449+16
	ldr	r0, .L449+20
	bl	printk
.L442:
	add	r0, r8, r8, lsl #2
	lsrs	r0, r0, #2
	b	.L362
.L405:
	mov	r0, r8
	b	.L362
.L372:
	ldr	r3, [r4, #868]
	ldr	fp, [r4, #916]
	str	r3, [sp, #16]
	str	fp, [sp, #44]
	b	.L443
.L370:
	ldr	r3, [sp, #56]
	add	r9, r9, r10, lsl #1
	ldr	r1, .L449+24
	ldr	r3, [r3]
	add	r9, r1, r9, lsl #2
	lsls	r0, r3, #23
	ldr	r9, [r9, #456]
	bpl	.L374
	mov	r3, r9
	movw	r2, #1297
	add	r1, r1, #432
	ldr	r0, .L449+28
	bl	printk
.L374:
	cmp	r9, #3
	bhi	.L373
	tbb	[pc, r9]
.L376:
	.byte	(.L379-.L376)/2
	.byte	(.L378-.L376)/2
	.byte	(.L377-.L376)/2
	.byte	(.L375-.L376)/2
	.p2align 1
.L379:
	ldr	r3, [r4, #872]
	ldr	fp, [r4, #916]
	str	r3, [sp, #40]
	ldr	r3, [r4, #920]
	str	r3, [sp, #44]
	ldr	r3, [r4, #868]
	str	r3, [sp, #16]
	ldr	r3, [r4, #860]
	str	r3, [sp, #24]
	ldr	r3, [r4, #864]
	str	r3, [sp, #20]
	ldr	r3, [r4, #908]
	str	r3, [sp, #32]
	ldr	r3, [r4, #912]
.L444:
	str	r3, [sp, #28]
	b	.L373
.L378:
	ldr	r3, [r4, #844]
	ldr	fp, [r4, #908]
	str	r3, [sp, #40]
	ldr	r3, [r4, #892]
	str	fp, [r4, #916]
	str	r3, [sp, #44]
	ldr	r3, [r4, #860]
	str	r3, [sp, #16]
	ldr	r2, [sp, #16]
	str	r3, [r4, #868]
	ldr	r3, [r4, #836]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	ldr	r2, [r4, #840]
	str	r3, [sp, #24]
	ldr	r3, [r4, #864]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r4, #884]
	str	r2, [sp, #20]
	cmp	r3, fp
	ldr	r2, [r4, #888]
	it	cs
	movcs	r3, fp
	str	r3, [sp, #32]
	ldr	r3, [r4, #912]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	mov	r3, r2
	b	.L444
.L377:
	ldr	r0, .L449+32
	movw	r1, #1329
.L445:
	bl	printk
	b	.L373
.L375:
	ldr	r3, [r4, #960]
	cmp	r3, #0
	beq	.L380
	add	r1, r4, #860
	str	r1, [sp, #56]
	ldr	r1, [r4, #844]
	add	r3, r4, #884
	ldr	fp, [r4, #908]
	add	r2, r4, #836
	ldr	r9, [sp, #56]
	add	ip, r4, #908
	str	r1, [sp, #40]
	add	lr, sp, #64
	ldr	r1, [r4, #892]
	str	fp, [r4, #916]
	str	r1, [sp, #44]
	ldr	r1, [r4, #860]
	str	r1, [sp, #16]
	ldr	r0, [sp, #16]
	str	r1, [r4, #868]
	ldr	r1, [r4, #836]
	cmp	r1, r0
	it	cs
	movcs	r1, r0
	ldr	r0, [r4, #840]
	str	r1, [sp, #24]
	ldr	r1, [r4, #864]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	ldr	r1, [r4, #884]
	str	r0, [sp, #20]
	cmp	r1, fp
	ldr	r0, [r4, #888]
	it	cs
	movcs	r1, fp
	str	r1, [sp, #32]
	ldr	r1, [r4, #912]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	str	r0, [sp, #28]
.L381:
	ldr	r0, [r9]	@ unaligned
	add	r9, r9, #8
	ldr	r1, [r9, #-4]	@ unaligned
	cmp	r9, r3
	mov	r10, lr
	stmia	r10!, {r0, r1}
	mov	lr, r10
	bne	.L381
	ldr	lr, [sp, #56]
	add	r0, r2, #24
	mov	r1, r2
.L382:
	ldr	r9, [r1], #4	@ unaligned
	cmp	r1, r0
	str	r9, [lr], #4	@ unaligned
	bne	.L382
	add	r9, sp, #64
	add	r10, sp, #88
.L383:
	mov	lr, r9
	adds	r2, r2, #8
	ldmia	lr!, {r0, r1}
	cmp	lr, r10
	str	r0, [r2, #-8]	@ unaligned
	mov	r9, lr
	str	r1, [r2, #-4]	@ unaligned
	bne	.L383
	add	r9, sp, #64
	add	r10, ip, #24
	mov	r2, ip
.L384:
	ldr	r0, [r2]	@ unaligned
	adds	r2, r2, #8
	ldr	r1, [r2, #-4]	@ unaligned
	cmp	r2, r10
	mov	lr, r9
	stmia	lr!, {r0, r1}
	mov	r9, lr
	bne	.L384
	add	r1, r3, #24
	mov	r2, r3
.L385:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [ip], #4	@ unaligned
	bne	.L385
	add	ip, sp, #64
	add	lr, sp, #88
.L386:
	mov	r2, ip
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r3, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L386
	b	.L373
.L380:
	movw	r1, #1357
	ldr	r0, .L449+36
	b	.L445
.L369:
	ldr	r3, [r8, #4]
	movs	r2, #163
	ldr	r0, [r4, #64]
	ldr	r1, [r3, #12]
	bl	mpp_dev_get_iova_address
	movs	r2, #165
	str	r0, [r5, #28]
	ldr	r3, [r4, #812]
	add	r3, r3, r0
	str	r3, [r5, #32]
	ldr	r3, [sp, #48]
	ldr	r0, [r4, #64]
	ldr	r3, [r3, #4]
	ldr	r1, [r3, #12]
	bl	mpp_dev_get_iova_address
	str	r0, [r5, #36]
	ldr	r3, [r4, #812]
	add	r3, r3, r0
	str	r3, [r5, #40]
	mov	r3, #-1
	strd	r3, r7, [r5, #96]
	strd	r3, r7, [r5, #104]
	b	.L389
.L450:
	.align	2
.L449:
	.word	.LANCHOR0+472
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LANCHOR0+408
	.word	.LC30
	.word	.LANCHOR0
	.word	.LC32
	.word	.LC33
	.word	.LC34
.L393:
	ldr	r1, [r3]
	cbz	r1, .L395
	movs	r2, #174
	ldr	r0, [r4, #64]
	bl	mpp_dev_get_iova_address
.L396:
	ldr	r3, [r6, #32]
	ldr	r3, [r3, #24]
	subs	r3, r3, #1
	add	r3, r3, r0
	str	r3, [r5, #64]
	ldr	r3, [r6, #32]
	ldr	r3, [r3, #12]
	str	r0, [r5, #76]
	add	r3, r3, r0
	str	r3, [r5, #68]
	ldr	r3, [sp, #36]
	add	r0, r0, r3
	str	r0, [r5, #72]
	b	.L394
.L395:
	ldr	r0, [r3, #4]
	ldr	r3, [r3, #12]
	add	r0, r0, r3
	b	.L396
.L398:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L397
	ldr	r0, [r4, #64]
	bl	mpp_get_dev
	ldr	r1, [r6, #32]
	movs	r3, #1
	ldr	r1, [r1, #4]
	ldr	r2, [sp, #36]
	bl	dma_sync_single_for_device
	b	.L397
.L400:
	ldr	r3, [r8, #4]
	ldr	r5, [r4, #812]
	ldr	r6, [r3, #12]
	b	.L401
	.fnend
	.size	vepu500_h265_set_hw_address, .-vepu500_h265_set_hw_address
	.global	__aeabi_idivmod
	.align	1
	.global	hal_h265e_v500_gen_regs
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h265e_v500_gen_regs, %function
hal_h265e_v500_gen_regs:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r6, .L867
	mov	r5, r0
	ldr	r3, [r1, #4]
	str	r1, [sp, #8]
	ldr	r2, [r6]
	str	r3, [sp, #24]
	lsls	r3, r2, #29
	ldr	fp, [r1, #16]
	ldr	r4, [r0, #68]
	ldr	r7, [r0, #788]
	bpl	.L452
	movw	r3, #2734
	ldr	r1, .L867+4
	mov	r2, r3
	ldr	r0, .L867+8
	bl	printk
.L452:
	ldr	r3, [r6]
	lsls	r0, r3, #30
	bpl	.L453
	ldr	r3, [r5, #744]
	movw	r2, #2737
	ldr	r1, .L867+4
	ldr	r0, .L867+12
	str	r3, [sp]
	ldr	r3, [r5, #748]
	bl	printk
.L453:
	movw	r2, #4924
	movs	r1, #0
	mov	r0, r4
	bl	memset
	ldr	r3, [r5, #820]
	cbz	r3, .L454
	ldr	r2, [r5, #68]
	ldr	r3, [r5, #768]
	ldrh	r1, [r2, #252]
	ldr	r3, [r3, #12]
	and	r1, r1, #52736
	strh	r1, [r2, #252]	@ movhi
	ldr	r1, [r5, #820]
	cmp	r1, #2
	bne	.L455
	ldrb	r1, [r2, #27]	@ zero_extendqisi2
	bic	r1, r1, #7
	orr	r1, r1, #7
	strb	r1, [r2, #27]
	ldrb	r1, [r2, #96]	@ zero_extendqisi2
	orr	r1, r1, #2
	strb	r1, [r2, #96]
.L455:
	lsls	r3, r3, #3
	ldrh	r1, [r2, #96]
	addw	r3, r3, #4095
	and	r1, r1, #50
	lsrs	r3, r3, #12
	strb	r3, [r2, #98]
	movs	r3, #0
	strb	r3, [r2, #99]
	ldrb	r3, [r2, #254]	@ zero_extendqisi2
	orr	r1, r1, #9
	strh	r1, [r2, #96]	@ movhi
	bic	r3, r3, #15
	orr	r3, r3, #13
	strb	r3, [r2, #254]
.L454:
	ldr	r3, [r5, #68]
	ldr	r1, .L867+16
	ldrb	r2, [r3, #20]	@ zero_extendqisi2
	bic	r2, r2, #7
	orr	r2, r2, #4
	strb	r2, [r3, #20]
	movw	r2, #32767
	strh	r2, [r3, #32]	@ movhi
	mov	r2, #28672
	str	r2, [r3, #48]
	ldrh	r2, [r3, #54]
	bfc	r2, #0, #10
	strh	r2, [r3, #54]	@ movhi
	ldr	r2, [r3, #56]
	bfi	r2, r1, #0, #24
	str	r2, [r3, #56]
	ldrb	r2, [r3, #84]	@ zero_extendqisi2
	bic	r2, r2, #15
	orr	r2, r2, #15
	strb	r2, [r3, #84]
	mov	r2, #-1
	str	r2, [r3, #88]
	ldr	r3, [sp, #8]
	ldr	r6, [r5, #68]
	ldr	r8, [r3, #16]
	ldrh	lr, [r6, #260]
	ldrh	r2, [r8, #4]
	ldrh	ip, [r8, #6]
	adds	r1, r2, #7
	adds	r2, r2, #31
	bic	r1, r1, #7
	add	r3, ip, #7
	bic	r3, r3, #7
	add	r0, ip, #31
	lsr	ip, r1, #3
	asrs	r2, r2, #5
	add	ip, ip, #-1
	asrs	r0, r0, #5
	bfi	lr, ip, #0, #11
	lsr	ip, r3, #3
	strh	lr, [r6, #260]	@ movhi
	add	ip, ip, #-1
	ldrh	lr, [r6, #262]
	muls	r0, r2, r0
	bfi	lr, ip, #0, #11
	strh	lr, [r6, #262]	@ movhi
	ldrb	ip, [r8, #4]	@ zero_extendqisi2
	subs	r0, r0, #1
	sub	r1, r1, ip
	ldrb	ip, [r6, #264]	@ zero_extendqisi2
	lsls	r0, r0, #1
	bfi	ip, r1, #0, #6
	strb	ip, [r6, #264]
	ldrb	r1, [r8, #6]	@ zero_extendqisi2
	subs	r3, r3, r1
	ldrb	r1, [r6, #266]	@ zero_extendqisi2
	bfi	r1, r3, #0, #6
	ldrb	r3, [r6, #244]	@ zero_extendqisi2
	strb	r1, [r6, #266]
	movs	r1, #1
	bfi	r3, r1, #0, #2
	strb	r3, [r6, #244]
	ldr	r3, [r8, #292]
	ldrb	r1, [r6, #244]	@ zero_extendqisi2
	clz	r3, r3
	lsrs	r3, r3, #5
	bfi	r1, r3, #2, #1
	strb	r1, [r6, #244]
	ldr	r3, [r5, #744]
	cmp	r3, #2
	ittt	eq
	uxtbeq	r3, r1
	orreq	r3, r3, #4
	strbeq	r3, [r6, #244]
	ldrb	r3, [r6, #244]	@ zero_extendqisi2
	orr	r3, r3, #16
	strb	r3, [r6, #244]
	bl	mpp_log2
	ldrb	r3, [r6, #246]	@ zero_extendqisi2
	bfi	r3, r0, #3, #5
	strb	r3, [r6, #246]
	ldr	r3, [r5, #744]
	cmp	r3, #2
	beq	.L683
	ldr	r2, [r5, #768]
	movw	r3, #4852
	ldr	r3, [r2, r3]
	cmp	r3, #1
	ite	ne
	movne	r2, #6
	moveq	r2, #9
.L457:
	ldrb	r3, [r6, #896]	@ zero_extendqisi2
	bfi	r3, r2, #0, #4
	strb	r3, [r6, #896]
	ldrh	r3, [r6, #404]
	bic	r3, r3, #32640
	bic	r3, r3, #124
	orr	r3, r3, #1752
	strh	r3, [r6, #404]	@ movhi
	ldrb	r2, [r8, #30]	@ zero_extendqisi2
	ldrb	r3, [r6, #404]	@ zero_extendqisi2
	bic	r3, r3, #3
	cbz	r2, .L458
	orr	r3, r3, #2
.L458:
	strb	r3, [r6, #404]
	ldrb	r3, [r6, #406]	@ zero_extendqisi2
	orr	r3, r3, #128
	strb	r3, [r6, #406]
	ldrb	r3, [r6, #407]	@ zero_extendqisi2
	ldrb	r2, [r8, #36]	@ zero_extendqisi2
	bfi	r3, r2, #0, #2
	strb	r3, [r6, #407]
	ldr	r3, [r5, #744]
	cmp	r3, #2
	ldrb	r3, [r6, #420]	@ zero_extendqisi2
	ite	eq
	moveq	r2, #19
	movne	r2, #1
	bfi	r3, r2, #0, #6
	ldr	r2, .L867+20
	strb	r3, [r6, #420]
	ldr	r3, [r5, #68]
	str	r2, [r3, #356]
	ldr	r2, [r3, #360]
	and	r2, r2, #-2013265920
	orr	r2, r2, #15859712
	orr	r2, r2, #54
	str	r2, [r3, #360]
	ldrb	r2, [fp, #38]	@ zero_extendqisi2
	lsls	r1, r2, #28
	bpl	.L461
	ldr	r2, [r5, #744]
	cmp	r2, #2
	beq	.L461
	ldr	r2, [r5, #412]
	subs	r1, r2, #2
	ldrb	r2, [r3, #367]	@ zero_extendqisi2
	it	ne
	movne	r1, #1
	bfi	r2, r1, #7, #1
	orr	r2, r2, #64
	strb	r2, [r3, #367]
.L461:
	ldr	r1, [r3, #364]
	ldr	r2, .L867+24
	ands	r2, r2, r1
	ldr	r1, .L867+28
	orr	r2, r2, #64
	str	r2, [r3, #364]
	ldrh	r2, [r3, #1188]
	bic	r2, r2, #32640
	bic	r2, r2, #119
	orr	r2, r2, #3360
	orr	r2, r2, #7
	strh	r2, [r3, #1188]	@ movhi
	ldr	r2, [r3, #1192]
	ands	r1, r1, r2
	ldr	r2, .L867+32
	orrs	r2, r2, r1
	str	r2, [r3, #1192]
	ldr	r2, [r3, #1196]
	ldr	r1, [r3, #1204]
	lsrs	r2, r2, #20
	lsls	r2, r2, #20
	orr	r2, r2, #557056
	orr	r2, r2, #16
	str	r2, [r3, #1196]
	ldr	r2, .L867+36
	str	r2, [r3, #1200]
	ldr	r2, .L867+40
	ands	r2, r2, r1
	ldr	r1, [r3, #1208]
	orr	r2, r2, #655360
	orr	r2, r2, #33
	str	r2, [r3, #1204]
	ldr	r2, [r3, #1212]
	and	r1, r1, #-268374016
	orr	r1, r1, #1048576
	and	r0, r2, #-1073741824
	ldr	r2, .L867+44
	orr	r1, r1, #8
	str	r1, [r3, #1208]
	orrs	r2, r2, r0
	ldr	r0, [r3, #1216]
	str	r2, [r3, #1212]
	and	r6, r0, #-16777216
	ldr	r0, .L867+48
	orrs	r0, r0, r6
	str	r0, [r3, #1216]
	ldr	r0, [r5, #768]
	movw	r6, #4852
	ldr	r0, [r0, r6]
	cmp	r0, #1
	beq	.L462
	bic	r2, r2, #1069547520
	ldrh	r0, [r3, #1196]
	bic	r2, r2, #4177920
	and	r1, r1, #-268374016
	bic	r2, r2, #15360
	bfc	r0, #0, #12
	orr	r2, r2, #4194304
	strh	r0, [r3, #1196]	@ movhi
	orr	r2, r2, #4096
	mov	r0, #67372036
	str	r1, [r3, #1208]
	str	r0, [r3, #1200]
.L837:
	str	r2, [r3, #1212]
	b	.L868
.L869:
	.align	2
.L867:
	.word	hal_h265e_debug
	.word	.LANCHOR0+500
	.word	.LC0
	.word	.LC41
	.word	2097151
	.word	118015
	.word	-805314560
	.word	-536346112
	.word	33574920
	.word	336595976
	.word	-268370040
	.word	12591108
	.word	8413248
.L868:
.L463:
	ldr	r6, .L870
	ldr	r8, [r5, #768]
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L464
	movw	r2, #1614
	ldr	r1, .L870+4
	ldr	r0, .L870+8
	bl	printk
.L464:
	ldr	r3, [r8, #3544]
	cmp	r3, #1
	beq	.L465
	cbz	r3, .L466
	cmp	r3, #2
	beq	.L467
	movw	r2, #1651
	ldr	r1, .L870+4
	ldr	r0, .L870+12
	bl	printk
	b	.L469
.L683:
	movs	r2, #6
	b	.L457
.L462:
	ldr	r1, [r5, #944]
	cmp	r1, #0
	beq	.L463
	bic	r2, r2, #1069547520
	ldr	r1, .L870+16
	bic	r2, r2, #4177920
	bic	r2, r2, #15360
	orr	r2, r2, #8388608
	str	r1, [r3, #1200]
	orr	r2, r2, #6144
	b	.L837
.L466:
	ldr	r1, [r4, #340]
	ldr	r2, .L870+20
	ands	r2, r2, r1
	str	r2, [r4, #340]
	ldr	r2, [r4, #344]
	bfi	r2, r3, #0, #20
	str	r2, [r4, #344]
	ldr	r2, [r4, #348]
	bfi	r2, r3, #0, #20
	str	r2, [r4, #348]
	ldrb	r2, [r4, #247]	@ zero_extendqisi2
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #247]
.L469:
	movs	r3, #0
	str	r3, [r8, #3540]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L470
	mov	r2, #1656
	ldr	r1, .L870+4
	ldr	r0, .L870+24
	bl	printk
.L470:
	ldr	r2, [sp, #8]
	add	r1, r4, #100
	mov	r0, r5
	bl	vepu500_h265_set_hw_address
	ldr	r1, [r7, #16]
	ldrb	r3, [r4, #48]	@ zero_extendqisi2
	ldr	r2, [r5, #768]
	bfi	r3, r1, #4, #4
	strb	r3, [r4, #48]
	ldr	r1, [r7]
	ldrb	r3, [r4, #268]	@ zero_extendqisi2
	and	r1, r1, #15
	bfi	r3, r1, #2, #4
	strb	r3, [r4, #268]
	ldr	r0, [r7, #4]
	bfi	r3, r0, #0, #1
	strb	r3, [r4, #268]
	ldr	r0, [r7, #8]
	bfi	r3, r0, #1, #1
	strb	r3, [r4, #268]
	ldr	r3, [r2, #36]
	ldrb	r0, [r4, #268]	@ zero_extendqisi2
	subs	r3, r3, #12
	it	ne
	movne	r3, #1
	bfi	r0, r3, #7, #1
	strb	r0, [r4, #268]
	ldr	r3, [r2, #60]
	cmp	r3, #0
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	ite	le
	movle	r0, #0
	movgt	r0, #1
	bfi	r3, r0, #2, #1
	strb	r3, [r4, #291]
	ldr	r0, [r2, #56]
	bfi	r3, r0, #3, #2
	strb	r3, [r4, #291]
	ldr	r3, [r2, #20]
	cbnz	r3, .L471
	ldrb	r0, [r4, #268]	@ zero_extendqisi2
	ands	r6, r0, #60
	bne	.L472
	ldr	r3, [r2, #12]
	lsls	r3, r3, #2
.L471:
	ldr	r2, [r7]
	subs	r2, r2, #4
	cmp	r2, #9
	bhi	.L475
	tbh	[pc, r2, lsl #1]
.L477:
	.2byte	(.L686-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L686-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L475-.L477)/2
	.2byte	(.L478-.L477)/2
	.2byte	(.L686-.L477)/2
	.p2align 1
.L465:
	ldr	r3, [r4, #340]
	ldr	r2, .L870+20
	ands	r2, r2, r3
	ldr	r3, .L870+28
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [r4, #348]
	bfc	r3, #0, #20
	str	r3, [r4, #348]
	ldr	r3, [r4, #344]
	ldr	r2, [r8, #3548]
	bfi	r3, r2, #0, #20
.L838:
	str	r3, [r4, #344]
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	bfc	r3, #6, #1
	strb	r3, [r4, #247]
	b	.L469
.L467:
	ldr	r3, [r4, #340]
	ldr	r2, .L870+20
	ands	r2, r2, r3
	ldr	r3, .L870+32
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [r8, #3548]
	ldr	r2, [r4, #348]
	subs	r3, r3, #1
	bfi	r2, r3, #0, #20
	ldr	r3, [r4, #344]
	str	r2, [r4, #348]
	bfc	r3, #0, #20
	b	.L838
.L472:
	cmp	r6, #4
	bne	.L473
	ldr	r3, [r2, #12]
	add	r3, r3, r3, lsl #1
	b	.L471
.L473:
	cmp	r6, #8
	beq	.L474
	and	r0, r0, #56
	cmp	r0, #32
	bne	.L471
.L474:
	ldr	r3, [r2, #12]
	lsls	r3, r3, #1
	b	.L471
.L871:
	.align	2
.L870:
	.word	hal_h265e_debug
	.word	.LANCHOR0+524
	.word	.LC42
	.word	.LC43
	.word	201852420
	.word	-2147450888
	.word	.LC44
	.word	32800769
	.word	32800771
.L478:
	lsls	r0, r3, #1
.L476:
	cmp	r1, #2
	bhi	.L479
	ldr	r2, [r4, #272]
	and	r1, r2, #-134217728
	ldr	r2, .L872
	orrs	r2, r2, r1
	str	r2, [r4, #272]
	ldr	r2, [r4, #276]
	and	r1, r2, #-134217728
	ldr	r2, .L872+4
	orrs	r2, r2, r1
	str	r2, [r4, #276]
	ldr	r2, [r4, #280]
	and	r1, r2, #-134217728
	ldr	r2, .L872+8
	orrs	r2, r2, r1
	str	r2, [r4, #280]
	ldr	r2, [r4, #284]
	lsrs	r2, r2, #21
	lsls	r2, r2, #21
	orr	r2, r2, #32768
	orr	r2, r2, #128
	str	r2, [r4, #284]
.L479:
	ldr	r2, [r4, #296]
	strh	r0, [r4, #300]	@ movhi
	bfi	r2, r3, #0, #21
	str	r2, [r4, #296]
	ldr	r2, [r5, #940]
	ldr	r1, [r5, #68]
	ldr	r3, [r5, #768]
	cmp	r2, #0
	beq	.L480
	movw	r2, #4860
	ldr	r2, [r3, r2]
	lsls	r6, r2, #31
	bmi	.L480
	ldr	r2, [r3, #328]
	cmp	r2, #0
	bne	.L480
	ldr	r2, [r3, #332]
	cmp	r2, #0
	bne	.L480
	ldrb	r3, [r5, #733]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L481
	ldr	r2, [r5, #744]
	cmp	r2, #2
	it	ne
	movne	r3, #3
.L482:
	ldrb	r2, [r1, #304]	@ zero_extendqisi2
	and	r3, r3, #3
	bfi	r2, r3, #0, #2
	bfi	r2, r3, #4, #2
	strb	r2, [r1, #304]
	ldrb	r2, [r1, #305]	@ zero_extendqisi2
	bfi	r2, r3, #0, #2
	strb	r2, [r1, #305]
	ldr	r3, [sp, #8]
	ldr	r7, [r5, #768]
	ldrb	r8, [r4, #245]	@ zero_extendqisi2
	ldr	r6, [r3, #4]
	ldr	r3, [r7, #108]
	cmp	r3, #2
	bne	.L484
	ldr	r3, [r6, #172]
	bfi	r8, r3, #0, #6
	ldrb	r3, [r4, #438]	@ zero_extendqisi2
	strb	r8, [r4, #245]
	ldr	r2, [r6, #172]
	bfi	r3, r2, #0, #6
	strb	r3, [r4, #438]
	ldrh	r3, [r4, #330]
	ldr	r2, [r6, #172]
	bfi	r3, r2, #4, #6
	strh	r3, [r4, #330]	@ movhi
	ldr	r2, [r6, #172]
	ubfx	r3, r3, #8, #8
	bfi	r3, r2, #2, #6
	strb	r3, [r4, #331]
.L485:
	ldr	r3, [r4, #1076]
	and	r2, r3, #-536870912
	ldr	r3, .L872+12
	orrs	r3, r3, r2
	ldr	r2, .L872+16
	str	r3, [r4, #1076]
	ubfx	r3, r3, #24, #8
	str	r2, [r4, #1044]
	ldr	r2, .L872+20
	str	r2, [r4, #1048]
	ldr	r2, .L872+24
	str	r2, [r4, #1052]
	ldr	r2, .L872+28
	str	r2, [r4, #1056]
	ldr	r2, .L872+32
	str	r2, [r4, #1060]
	ldr	r2, .L872+36
	str	r2, [r4, #1064]
	ldr	r2, .L872+40
	str	r2, [r4, #1068]
	ldr	r2, .L872+44
	str	r2, [r4, #1072]
	movs	r2, #4
	bfi	r3, r2, #5, #3
	strb	r3, [r4, #1079]
	ldr	r3, .L872+48
	str	r3, [r4, #1080]
	ldr	r3, .L872+52
	str	r3, [r4, #1084]
	ldr	r3, .L872+56
	str	r3, [r4, #1088]
	ldr	r3, [r5, #768]
	ldr	r2, [r5, #68]
	ldr	r1, [r5, #744]
	ldr	r0, [r3, #324]
	cmp	r0, #0
	bne	.L525
	ldr	r3, [r5, #944]
	cmp	r3, #0
	beq	.L526
	cmp	r1, #2
	mov	r3, #85
	mov	r6, r3
	str	r3, [sp, #16]
	mov	r7, r3
	mov	r1, #144
	beq	.L688
	mov	ip, #171
.L857:
	movs	r0, #3
	mov	lr, r1
	mov	r8, r1
	mov	r9, #13
	mov	r10, #6
	str	r0, [sp, #12]
	b	.L527
.L475:
	add	r0, r3, r3, lsr #31
	asrs	r0, r0, #1
	b	.L476
.L686:
	mov	r0, r3
	b	.L476
.L481:
	cmp	r3, #0
	it	ne
	movne	r3, #2
	b	.L482
.L480:
	ldr	r2, [r5, #744]
	cmp	r2, #2
	ite	eq
	ldrbeq	r3, [r3, #328]	@ zero_extendqisi2
	ldrbne	r3, [r3, #332]	@ zero_extendqisi2
	b	.L482
.L873:
	.align	2
.L872:
	.word	20261917
	.word	123164288
	.word	33762283
	.word	333412350
	.word	338556841
	.word	-855059158
	.word	115026885
	.word	443419843
	.word	-95302629
	.word	-2060451689
	.word	-659863438
	.word	-482633299
	.word	-951058413
	.word	-1041351369
	.word	1145399152
.L484:
	ldr	r3, [sp, #8]
	ldr	r0, [r6, #160]
	ldr	r3, [r3, #16]
	lsls	r0, r0, #4
	ldrh	r9, [r3, #4]
	ldrh	r1, [r3, #6]
	add	r9, r9, #31
	adds	r1, r1, #31
	asr	r9, r9, #5
	asrs	r1, r1, #5
	mul	r1, r9, r1
	bl	__aeabi_idiv
	ldr	r3, [r6, #172]
	ldrb	r1, [r4, #438]	@ zero_extendqisi2
	bfi	r8, r3, #0, #6
	strb	r8, [r4, #245]
	ldr	r3, [r6, #172]
	bfi	r1, r3, #0, #6
	ldrb	r3, [r4, #324]	@ zero_extendqisi2
	strb	r1, [r4, #438]
	bic	r3, r3, #3
	ldrh	r1, [r4, #330]
	orr	r3, r3, #3
	strb	r3, [r4, #324]
	ldr	r3, [r4, #324]
	bfi	r3, r9, #12, #20
	str	r3, [r4, #324]
	ldr	r3, [r6, #176]
	bfi	r1, r3, #4, #6
	strh	r1, [r4, #330]	@ movhi
	ldr	r3, [r6, #180]
	ubfx	r1, r1, #8, #8
	bfi	r1, r3, #2, #6
	ldr	r3, [r4, #332]
	strb	r1, [r4, #331]
	cmp	r0, #1048576
	ite	cc
	movcc	r2, r0
	movcs	r2, #327680
	bfi	r3, r2, #0, #20
	str	r3, [r4, #332]
	mul	r0, r2, r9
	ldr	r3, [r5, #944]
	ldrb	r2, [r4, #330]	@ zero_extendqisi2
	lsrs	r0, r0, #4
	add	r0, r0, r0, lsl #2
	lsrs	r0, r0, #4
	rsb	ip, r0, #0
	cmp	r3, #0
	beq	.L487
	bfc	r2, #0, #4
.L840:
	strb	r2, [r4, #330]
	ldr	r1, [r5, #744]
	ldr	r2, [r7, #256]
	cmp	r1, #2
	ldr	r1, [r7, #260]
	ldr	r3, [r7, #248]
	it	ne
	movne	r2, r1
	ldr	r1, [r7, #252]
	it	ne
	movne	r3, r1
	cmp	r3, r2
	bne	.L492
	cmp	r3, #0
	blt	.L492
	cmp	r3, #51
	bgt	.L492
	and	lr, r3, #63
	ldrb	r3, [r4, #245]	@ zero_extendqisi2
	bfi	r3, lr, #0, #6
	strb	r3, [r4, #245]
	ldrb	r3, [r4, #438]	@ zero_extendqisi2
	bfi	r3, lr, #0, #6
	strb	r3, [r4, #438]
	ldrb	r3, [r4, #330]	@ zero_extendqisi2
	bfc	r3, #0, #4
	strb	r3, [r4, #330]
.L492:
	mvn	r3, #1
	str	r0, [r4, #788]
	muls	r3, r0, r3
	lsls	r0, r0, #1
	str	r0, [r4, #792]
	strd	r3, ip, [r4, #780]
	mvn	r3, #-2147483648
	strd	r3, r3, [r4, #796]
	strd	r3, r3, [r4, #804]
	str	r3, [r4, #812]
	ldr	r3, [r4, #772]
	and	r2, r3, #-33554432
	ldr	r3, .L874
	orrs	r3, r3, r2
	str	r3, [r4, #772]
	ldr	r3, [r4, #776]
	lsrs	r3, r3, #20
	lsls	r3, r3, #20
	str	r3, [r4, #776]
	ldrb	r3, [r7, #784]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L493
.L841:
	ldrb	r2, [r4, #820]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #820]
	ldrb	r3, [r7, #776]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L495
.L842:
	ldrh	r2, [r4, #820]
	and	r3, r3, #63
	bfi	r2, r3, #6, #6
	strh	r2, [r4, #820]	@ movhi
	ldrb	r3, [r7, #785]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L497
.L843:
	ldr	r2, [r4, #820]
	and	r3, r3, #63
	bfi	r2, r3, #12, #6
	str	r2, [r4, #820]
	ldrb	r3, [r7, #777]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L499
.L844:
	ldrb	r2, [r4, #822]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #2, #6
	strb	r2, [r4, #822]
	ldrb	r3, [r7, #786]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L501
.L845:
	ldrb	r2, [r4, #823]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #823]
	ldrb	r3, [r7, #778]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L503
.L846:
	ldrb	r2, [r4, #824]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #824]
	ldrb	r3, [r7, #787]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L505
.L847:
	ldrh	r2, [r4, #824]
	and	r3, r3, #63
	bfi	r2, r3, #6, #6
	strh	r2, [r4, #824]	@ movhi
	ldrb	r3, [r7, #779]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L507
.L848:
	ldr	r2, [r4, #824]
	and	r3, r3, #63
	bfi	r2, r3, #12, #6
	str	r2, [r4, #824]
	ldrb	r3, [r7, #788]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L509
.L849:
	ldrb	r2, [r4, #826]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #2, #6
	strb	r2, [r4, #826]
	ldrb	r3, [r7, #780]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L511
.L850:
	ldrb	r2, [r4, #827]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #827]
	ldrb	r3, [r7, #789]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L513
.L851:
	ldrb	r2, [r4, #828]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #828]
	ldrb	r3, [r7, #781]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L515
.L852:
	ldrh	r2, [r4, #828]
	and	r3, r3, #63
	bfi	r2, r3, #6, #6
	strh	r2, [r4, #828]	@ movhi
	ldrb	r3, [r7, #790]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L517
.L853:
	ldr	r2, [r4, #828]
	and	r3, r3, #63
	bfi	r2, r3, #12, #6
	str	r2, [r4, #828]
	ldrb	r3, [r7, #782]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L519
.L854:
	ldrb	r2, [r4, #830]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #2, #6
	strb	r2, [r4, #830]
	ldrb	r3, [r7, #791]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L521
.L855:
	ldrb	r2, [r4, #831]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #831]
	ldrb	r3, [r7, #783]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L523
.L856:
	ldrb	r2, [r4, #832]	@ zero_extendqisi2
	and	r3, r3, #63
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #832]
	ldrb	r3, [r4, #835]	@ zero_extendqisi2
	ldr	r2, [r7, #792]
	bfi	r3, r2, #6, #2
	strb	r3, [r4, #835]
	b	.L485
.L487:
	ldr	r3, [r5, #744]
	cmp	r3, #2
	ite	eq
	ldreq	r3, [r7, #312]
	ldrne	r3, [r7, #308]
	and	r3, r3, #15
	bfi	r2, r3, #0, #4
	b	.L840
.L493:
	ldr	r3, [r6, #180]
	b	.L841
.L495:
	ldr	r3, [r6, #176]
	b	.L842
.L497:
	ldr	r3, [r6, #180]
	b	.L843
.L499:
	ldr	r3, [r6, #176]
	b	.L844
.L501:
	ldr	r3, [r6, #180]
	b	.L845
.L503:
	ldr	r3, [r6, #176]
	b	.L846
.L505:
	ldr	r3, [r6, #180]
	b	.L847
.L507:
	ldr	r3, [r6, #176]
	b	.L848
.L509:
	ldr	r3, [r6, #180]
	b	.L849
.L511:
	ldr	r3, [r6, #176]
	b	.L850
.L513:
	ldr	r3, [r6, #180]
	b	.L851
.L515:
	ldr	r3, [r6, #176]
	b	.L852
.L517:
	ldr	r3, [r6, #180]
	b	.L853
.L519:
	ldr	r3, [r6, #176]
	b	.L854
.L521:
	ldr	r3, [r6, #180]
	b	.L855
.L523:
	ldr	r3, [r6, #176]
	b	.L856
.L526:
	cmp	r1, #2
	mov	r3, #85
	mov	r6, r3
	str	r3, [sp, #16]
	mov	r7, r3
	mov	r1, #171
	beq	.L688
	mov	ip, #220
	b	.L857
.L875:
	.align	2
.L874:
	.word	2130942
.L525:
	cmp	r1, #2
	bne	.L528
	ldrb	r1, [r3, #592]	@ zero_extendqisi2
	ldrb	r10, [r3, #596]	@ zero_extendqisi2
	ldrb	r9, [r3, #600]	@ zero_extendqisi2
	str	r1, [sp, #12]
	ldrh	r8, [r3, #604]
	ldrh	lr, [r3, #608]
	ldrh	ip, [r3, #612]
	ldrh	r1, [r3, #616]
	movs	r3, #85
	mov	r6, r3
	mov	r7, r3
	str	r3, [sp, #16]
.L527:
	strb	r9, [r2, #1142]
	ldrh	r9, [r2, #1144]
	ldr	r0, [sp, #12]
	bfi	r9, r8, #0, #10
	strh	r9, [r2, #1144]	@ movhi
	ldr	r8, [r2, #1144]
	strb	r0, [r2, #1140]
	bfi	r8, lr, #10, #10
	str	r8, [r2, #1144]
	ubfx	r8, r8, #16, #16
	strb	r10, [r2, #1141]
	bfi	r8, ip, #4, #10
	ldrh	ip, [r2, #1148]
	strh	r8, [r2, #1146]	@ movhi
	bfi	ip, r1, #0, #10
	ldrh	r1, [r2, #1152]
	strh	ip, [r2, #1148]	@ movhi
	bfi	r1, r7, #0, #10
	strh	r1, [r2, #1152]	@ movhi
	ldr	r1, [r2, #1152]
	bfi	r1, r6, #10, #10
	str	r1, [r2, #1152]
	ldr	r0, [sp, #16]
	ubfx	r1, r1, #16, #16
	bfi	r1, r0, #4, #10
	strh	r1, [r2, #1154]	@ movhi
	ldrh	r1, [r2, #1156]
	bfi	r1, r3, #0, #10
	strh	r1, [r2, #1156]	@ movhi
	ldr	r3, [r5, #68]
	movw	r2, #1028
	strh	r2, [r3, #2090]	@ movhi
	mov	r2, #67372036
	str	r2, [r3, #2092]
	ldrb	r2, [fp, #36]	@ zero_extendqisi2
	ldrb	r3, [r4, #424]	@ zero_extendqisi2
	ubfx	r2, r2, #3, #1
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #424]
	ldrb	r2, [fp, #29]	@ zero_extendqisi2
	bfi	r3, r2, #1, #7
	strb	r3, [r4, #424]
	ldrb	r3, [r4, #425]	@ zero_extendqisi2
	ldrb	r2, [fp, #30]	@ zero_extendqisi2
	bfi	r3, r2, #1, #6
	strb	r3, [r4, #425]
	ldrb	r3, [fp, #38]	@ zero_extendqisi2
	ldrb	r2, [r4, #425]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #425]
	ldrb	r3, [fp, #38]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #7, #1
	strb	r2, [r4, #425]
	ldrb	r3, [fp, #21]	@ zero_extendqisi2
	ldrb	r2, [r4, #426]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #4
	bfi	r2, r3, #0, #4
	strb	r2, [r4, #426]
	ldrb	r3, [fp, #38]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #4, #1
	strb	r2, [r4, #426]
	ldrb	r3, [fp, #38]	@ zero_extendqisi2
	ldrb	r2, [r4, #428]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #428]
	ldrb	r3, [fp, #38]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #6, #1
	bfi	r2, r3, #1, #1
	strb	r2, [r4, #428]
	ldrh	r3, [fp, #38]
	uxtb	r2, r2
	ubfx	r3, r3, #7, #3
	bfi	r2, r3, #2, #3
	strb	r2, [r4, #428]
	ldrb	r3, [fp, #39]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #5, #1
	strb	r2, [r4, #428]
	ldrb	r3, [fp, #39]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #428]
	ldrb	r3, [fp, #33]	@ zero_extendqisi2
	ldrh	r2, [r4, #428]
	adds	r3, r3, #26
	bfi	r2, r3, #7, #6
	strh	r2, [r4, #428]	@ movhi
	ldrb	r3, [fp, #40]	@ zero_extendqisi2
	ldrb	r2, [r4, #429]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #5, #1
	strb	r2, [r4, #429]
	ldrb	r3, [fp, #40]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #429]
	ldrb	r3, [fp, #41]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #7, #1
	strb	r2, [r4, #429]
	ldrb	r3, [fp, #41]	@ zero_extendqisi2
	ldrb	r2, [r4, #430]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #430]
	ldrb	r3, [fp, #41]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #6, #1
	bfi	r2, r3, #1, #1
	strb	r2, [r4, #430]
	ldrb	r2, [fp, #41]	@ zero_extendqisi2
	ldrb	r3, [r4, #430]	@ zero_extendqisi2
	lsrs	r2, r2, #7
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #430]
	ldrb	r2, [fp, #208]	@ zero_extendqisi2
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #430]
	ldrb	r3, [fp, #41]	@ zero_extendqisi2
	ldrb	r2, [r4, #430]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #5, #1
	strb	r2, [r4, #430]
	ldrb	r3, [fp, #228]	@ zero_extendqisi2
	ldrb	r2, [r4, #432]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #432]
	ldrb	r3, [fp, #228]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #5, #1
	bfi	r2, r3, #1, #1
	strb	r2, [r4, #432]
	ldrb	r2, [fp, #229]	@ zero_extendqisi2
	ldrb	r3, [r4, #432]	@ zero_extendqisi2
	bfi	r3, r2, #5, #1
	strb	r3, [r4, #432]
	ldrb	r2, [fp, #242]	@ zero_extendqisi2
	bfi	r3, r2, #6, #2
	strb	r3, [r4, #432]
	ldrb	r3, [r4, #433]	@ zero_extendqisi2
	ldrb	r2, [fp, #243]	@ zero_extendqisi2
	bfi	r3, r2, #0, #2
	strb	r3, [r4, #433]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	ldrb	r2, [r4, #433]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #1
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #433]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #3, #1
	strb	r2, [r4, #433]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #4, #1
	strb	r2, [r4, #433]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #5, #1
	ldr	r3, [r4, #244]
	strb	r2, [r4, #433]
	ldr	r2, [fp, #288]
	bfi	r3, r2, #14, #5
	str	r3, [r4, #244]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	ldrb	r2, [r4, #433]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #433]
	ldrb	r2, [fp, #244]	@ zero_extendqisi2
	ldr	r3, [r4, #432]
	bfi	r3, r2, #15, #2
	str	r3, [r4, #432]
	ldrb	r2, [fp, #245]	@ zero_extendqisi2
	ubfx	r3, r3, #16, #8
	bfi	r3, r2, #1, #7
	strb	r3, [r4, #434]
	ldrb	r2, [fp, #229]	@ zero_extendqisi2
	ldrb	r3, [r4, #435]	@ zero_extendqisi2
	ubfx	r2, r2, #6, #1
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #435]
	ldrb	r2, [fp, #246]	@ zero_extendqisi2
	bfi	r3, r2, #1, #6
	strb	r3, [r4, #435]
	ldrb	r3, [fp, #229]	@ zero_extendqisi2
	ldrb	r2, [r4, #435]	@ zero_extendqisi2
	lsrs	r3, r3, #7
	bfi	r2, r3, #7, #1
	ldrb	r3, [r4, #436]	@ zero_extendqisi2
	strb	r2, [r4, #435]
	ldrb	r2, [fp, #236]	@ zero_extendqisi2
	bfi	r3, r2, #0, #4
	strb	r3, [r4, #436]
	ldrb	r2, [fp, #237]	@ zero_extendqisi2
	bfi	r3, r2, #4, #4
	strb	r3, [r4, #436]
	ldrb	r3, [r4, #437]	@ zero_extendqisi2
	ldrb	r2, [fp, #230]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #437]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	ldrb	r2, [r4, #437]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #1
	bfi	r2, r3, #1, #1
	strb	r2, [r4, #437]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #437]
	ldrb	r3, [fp, #40]	@ zero_extendqisi2
	lsls	r0, r3, #28
	ite	mi
	ldrbmi	r3, [fp, #238]	@ zero_extendqisi2
	ldrbpl	r3, [fp, #44]	@ zero_extendqisi2
	ldrb	r2, [r4, #437]	@ zero_extendqisi2
	and	r3, r3, #31
	bfi	r2, r3, #3, #5
	ldrb	r3, [r4, #438]	@ zero_extendqisi2
	strb	r2, [r4, #437]
	ldrb	r2, [fp, #240]	@ zero_extendqisi2
	bfi	r3, r2, #6, #2
	strb	r3, [r4, #438]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	ldrb	r2, [r4, #439]	@ zero_extendqisi2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #1, #1
	strb	r2, [r4, #439]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #439]
	ldrh	r3, [fp, #254]
	strh	r3, [r4, #440]	@ movhi
	ldrh	r3, [r4, #442]
	ldrh	r2, [fp, #256]
	bfi	r3, r2, #0, #9
	strh	r3, [r4, #442]	@ movhi
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	ldrb	r2, [r4, #444]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #444]
	ldrh	r2, [fp, #258]
	ldr	r3, [r4, #444]
	bfi	r3, r2, #1, #16
	str	r3, [r4, #444]
	ldrb	r2, [fp, #248]	@ zero_extendqisi2
	ubfx	r3, r3, #16, #8
	bfi	r3, r2, #6, #2
	strb	r3, [r4, #446]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	ldrb	r2, [r4, #451]	@ zero_extendqisi2
	lsrs	r3, r3, #7
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #451]
	ldrh	r2, [fp, #264]
	ldr	r3, [r4, #448]
	bfi	r3, r2, #10, #16
	str	r3, [r4, #448]
	ldrb	r3, [fp, #231]	@ zero_extendqisi2
	ldrb	r2, [r4, #451]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	bfi	r2, r3, #5, #1
	strb	r2, [r4, #451]
	ldrb	r3, [fp, #231]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #3, #1
	bfi	r2, r3, #6, #1
	strb	r2, [r4, #451]
	ldrb	r3, [fp, #231]	@ zero_extendqisi2
	uxtb	r2, r2
	ubfx	r3, r3, #4, #1
	bfi	r2, r3, #7, #1
	strb	r2, [r4, #451]
	ldrb	r3, [fp, #230]	@ zero_extendqisi2
	uxtb	r2, r2
	lsrs	r3, r3, #7
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #451]
	ldrh	r2, [fp, #264]
	ldr	r3, [r4, #448]
	bfi	r3, r2, #10, #16
	str	r3, [r4, #448]
	ldrb	r2, [fp, #231]	@ zero_extendqisi2
	ldrb	r3, [r4, #451]	@ zero_extendqisi2
	bfi	r3, r2, #3, #1
	strb	r3, [r4, #451]
	ldrh	r3, [r4, #448]
	ldrb	r2, [fp, #252]	@ zero_extendqisi2
	bfi	r3, r2, #5, #5
	strh	r3, [r4, #448]	@ movhi
	ldrb	r2, [fp, #230]	@ zero_extendqisi2
	ldrb	r3, [r4, #448]	@ zero_extendqisi2
	ubfx	r2, r2, #6, #1
	bfi	r3, r2, #4, #1
	strb	r3, [r4, #448]
	ldrb	r2, [fp, #251]	@ zero_extendqisi2
	bfi	r3, r2, #0, #4
	strb	r3, [r4, #448]
	ldrh	r3, [fp, #266]
	strh	r3, [r4, #452]	@ movhi
	ldrh	r3, [fp, #268]
	strh	r3, [r4, #454]	@ movhi
	ldrh	r3, [fp, #270]
	strh	r3, [r4, #456]	@ movhi
	ldrh	r3, [fp, #272]
	strh	r3, [r4, #458]	@ movhi
	ldrh	r3, [fp, #274]
	strh	r3, [r4, #460]	@ movhi
	ldrh	r3, [fp, #278]
	strh	r3, [r4, #464]	@ movhi
	ldrh	r3, [fp, #276]
	ldrb	r2, [r4, #451]	@ zero_extendqisi2
	strh	r3, [r4, #462]	@ movhi
	ldrb	r3, [fp, #231]	@ zero_extendqisi2
	ubfx	r3, r3, #1, #1
	bfi	r2, r3, #4, #1
	strb	r2, [r4, #451]
	ldrh	r3, [fp, #280]
	strh	r3, [r4, #466]	@ movhi
	ldrb	r3, [r4, #439]	@ zero_extendqisi2
	ldrb	r2, [fp, #241]	@ zero_extendqisi2
	bfi	r3, r2, #3, #4
	strb	r3, [r4, #439]
	ldrb	r3, [r4, #432]	@ zero_extendqisi2
	ldrb	r2, [fp, #229]	@ zero_extendqisi2
	bfi	r3, r2, #5, #1
	strb	r3, [r4, #432]
	ldr	r1, [r5, #956]
	ldr	r6, [r5, #68]
	cmp	r1, #0
	beq	.L531
	movs	r2, #179
	ldr	r0, [r5, #64]
	bl	mpp_dev_get_iova_address
	str	r0, [r6, #192]
	ldr	r3, [r5, #952]
	add	r3, r3, r0
	str	r3, [r6, #188]
.L532:
	ldr	r1, [r5, #768]
	movw	r2, #4880
	ldr	r3, [r5, #68]
	ldr	r7, .L876
	ldr	r2, [r1, r2]
	ldrb	r1, [r3, #407]	@ zero_extendqisi2
	adds	r0, r2, #0
	ldr	ip, .L876+96
	ldr	lr, .L876+100
	mov	r10, r7
	it	ne
	movne	r0, #1
	bfi	r1, r0, #4, #1
	strb	r1, [r3, #407]
	add	r0, r7, r2, lsl #1
	ldr	r1, [r3, #1908]
	ldrh	r6, [r0, #548]
	and	r1, r1, #-268374016
	ldrh	r8, [r0, #572]
	orr	r1, r1, #655360
	orr	r1, r1, #5
	str	r1, [r3, #1908]
	ldrh	r1, [r3, #1912]
	bfi	r1, r6, #0, #12
	ldrh	r6, [r0, #556]
	strh	r1, [r3, #1912]	@ movhi
	ldrh	r1, [r3, #1914]
	bfi	r1, r6, #0, #12
	adds	r6, r7, r2
	strh	r1, [r3, #1914]	@ movhi
	ldrb	r1, [r6, #564]	@ zero_extendqisi2
	strb	r1, [r3, #1916]
	ldr	r1, [r3, #1916]
	and	r1, r1, ip
	orr	r1, r1, lr
	str	r1, [r3, #1916]
	ldrb	r1, [r6, #568]	@ zero_extendqisi2
	strb	r1, [r3, #1919]
	ldrh	r1, [r3, #1964]
	bfi	r1, r8, #0, #12
	ldrh	r8, [r0, #580]
	strh	r1, [r3, #1964]	@ movhi
	ldrh	r1, [r3, #1966]
	bfi	r1, r8, #0, #12
	ldrh	r8, [r0, #588]
	strh	r1, [r3, #1966]	@ movhi
	ldrh	r1, [r3, #1968]
	bfi	r1, r8, #0, #12
	strh	r1, [r3, #1968]	@ movhi
	ldrb	r1, [r6, #596]	@ zero_extendqisi2
	ldr	r8, .L876+104
	strb	r1, [r3, #1972]
	ldrb	r1, [r6, #600]	@ zero_extendqisi2
	strb	r1, [r3, #1973]
	ldrb	r1, [r6, #604]	@ zero_extendqisi2
	ldr	r6, .L876+4
	ldrh	r0, [r0, #608]
	strb	r1, [r3, #1974]
	ldr	r1, [r3, #1924]
	ldrh	r6, [r6, r2, lsl #1]
	and	r1, r1, #-268374016
	orr	r1, r1, #655360
	orr	r1, r1, #1
	str	r1, [r3, #1924]
	ldrh	r1, [r3, #1928]
	bfi	r1, r6, #0, #12
	strh	r1, [r3, #1928]	@ movhi
	ldrh	r1, [r3, #1930]
	ldr	r6, .L876+8
	bfi	r1, r0, #0, #12
	strh	r1, [r3, #1930]	@ movhi
	ldr	r1, .L876+12
	movs	r0, #72
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	strb	r1, [r3, #1932]
	ldr	r1, [r3, #1932]
	and	r1, r1, ip
	ldr	ip, .L876+108
	orr	r1, r1, lr
	str	r1, [r3, #1932]
	ldr	r1, .L876+16
	ldr	lr, .L876+112
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	strb	r1, [r3, #1935]
	ldr	r1, [r3, #1940]
	and	r1, r1, #-268374016
	orrs	r1, r1, r6
	str	r1, [r3, #1940]
	ldrh	r1, [r3, #1944]
	bfi	r1, r0, #0, #12
	strh	r1, [r3, #1944]	@ movhi
	ldr	r1, [r3, #1948]
	and	r1, r1, #-16777216
	orr	r1, r1, #1048592
	orr	r1, r1, #4096
	str	r1, [r3, #1948]
	ldr	r1, [r3, #1952]
	and	r1, r1, #-268374016
	orrs	r6, r6, r1
	ldrh	r1, [r3, #1956]
	str	r6, [r3, #1952]
	bfi	r1, r0, #0, #12
	ldr	r0, .L876+20
	strh	r1, [r3, #1956]	@ movhi
	mov	r1, #269488144
	str	r1, [r3, #1960]
	ldrh	r0, [r0, r2, lsl #1]
	ldrh	r1, [r3, #1976]
	ldr	r6, .L876+24
	bfi	r1, r0, #0, #12
	ldr	r0, .L876+28
	strh	r1, [r3, #1976]	@ movhi
	ldrh	r1, [r3, #1978]
	ldrh	r0, [r0, r2, lsl #1]
	bfi	r1, r0, #0, #12
	ldr	r0, .L876+32
	strh	r1, [r3, #1978]	@ movhi
	ldrh	r1, [r3, #1980]
	ldrh	r0, [r0, r2, lsl #1]
	bfi	r1, r0, #0, #12
	strh	r1, [r3, #1980]	@ movhi
	ldr	r1, .L876+36
	ldr	r0, .L876+40
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	strb	r1, [r3, #1984]
	ldr	r1, .L876+44
	ldrb	r1, [r1, r2]	@ zero_extendqisi2
	strb	r1, [r3, #1985]
	ldr	r1, .L876+48
	ldrb	r2, [r1, r2]	@ zero_extendqisi2
	strb	r2, [r3, #1986]
	movs	r2, #16
	strb	r2, [r3, #1987]
	movw	r2, #4868
	ldr	r1, [r5, #768]
	ldr	r3, [r5, #68]
	ldr	r2, [r1, r2]
	ldrb	r1, [r3, #2131]	@ zero_extendqisi2
	adds	r2, r2, #0
	str	r6, [r3, #2120]
	str	r6, [r3, #2124]
	it	ne
	movne	r2, #1
	bfi	r1, r2, #7, #1
	ldr	r2, [r3, #2100]
	strb	r1, [r3, #2131]
	ldr	r1, .L876+52
	and	r2, r2, #-2139062144
	str	ip, [r3, #2116]
	orrs	r2, r2, r1
	str	r2, [r3, #2100]
	ldr	r2, [r3, #2104]
	and	r2, r2, #-2139062144
	orr	r2, r2, r8
	str	r2, [r3, #2104]
	ldr	r2, [r3, #2108]
	and	r2, r2, #-2139062144
	orr	r2, r2, lr
	str	r2, [r3, #2108]
	ldr	r2, [r3, #2112]
	ands	r0, r0, r2
	ldr	r2, .L876+56
	orrs	r2, r2, r0
	ldr	r0, [r3, #2128]
	str	r2, [r3, #2112]
	ldr	r2, .L876+60
	and	r0, r0, #-2013265920
	orrs	r2, r2, r0
	ldr	r0, [r3, #2132]
	str	r2, [r3, #2128]
	and	r0, r0, #-2139062144
	orrs	r1, r1, r0
	str	r1, [r3, #2132]
	ldr	r1, [r3, #2136]
	and	r1, r1, #-2139062144
	orr	r1, r1, r8
	str	r1, [r3, #2136]
	ldr	r2, [r3, #2140]
	ldr	r1, .L876+64
	and	r2, r2, #-2139062144
	str	r6, [r3, #2152]
	orr	r2, r2, lr
	str	r2, [r3, #2140]
	ldr	r2, [r3, #2144]
	str	r6, [r3, #2156]
	ands	r1, r1, r2
	ldr	r2, .L876+68
	str	ip, [r3, #2148]
	orrs	r2, r2, r1
	str	r2, [r3, #2144]
	ldr	r2, [r3, #2160]
	and	r1, r2, #-134217728
	ldr	r2, .L876+72
	orrs	r2, r2, r1
	str	r2, [r3, #2160]
	ubfx	r2, r2, #24, #8
	movs	r1, #3
	bfi	r2, r1, #4, #3
	strb	r2, [r3, #2163]
	ldr	r3, [r5, #68]
	ldr	r2, [r5, #744]
	ldrb	r1, [r3, #1868]	@ zero_extendqisi2
	cmp	r2, #2
	ldrb	r6, [r3, #1884]	@ zero_extendqisi2
	ldrb	r2, [r3, #1875]	@ zero_extendqisi2
	bfc	r1, #0, #1
	bne	.L533
	ldr	r0, [r5, #768]
	add	r0, r0, #4864
	ldr	lr, [r0]
	cmp	lr, #0
	bne	.L534
.L533:
	mov	lr, #0
	bfc	r2, #7, #1
	bfc	r6, #0, #1
	strb	r1, [r3, #1868]
	strb	r2, [r3, #1875]
	strb	r6, [r3, #1884]
.L535:
	movs	r2, #135
	strb	r2, [r3, #1812]
	ldr	r2, [r3, #1816]
	cmp	lr, #3
	ldr	ip, [r3, #1868]
	and	r2, r2, #-16777216
	ldr	r7, .L876+76
	orr	r2, r2, #1056768
	ldr	r8, .L876+116
	orr	r2, r2, #64
	str	r2, [r3, #1816]
	movw	r2, #41152
	strh	r2, [r3, #1820]	@ movhi
	ldr	r2, [r3, #1872]
	and	r7, ip, r7
	orr	r7, r7, r8
	ldr	r6, [r3, #1876]
	ldr	r1, [r3, #1880]
	and	r2, r2, #-536813568
	ldr	r0, [r3, #1884]
	str	r7, [r3, #1868]
	bne	.L536
	bic	r6, r6, #133693440
	orr	r2, r2, #131072000
	bic	r6, r6, #464896
	orr	r2, r2, #4000
	bic	r6, r6, #2040
	str	r2, [r3, #1872]
	bic	r0, r0, #1069547520
	ldr	r2, .L876+80
	bic	r6, r6, #7
	bic	r0, r0, #4177920
	orrs	r2, r2, r6
	bic	r0, r0, #16320
	str	r2, [r3, #1876]
	and	r1, r1, #-134154240
	ldr	r2, .L876+84
	bic	r0, r0, #62
	orr	r1, r1, #31981568
	str	r1, [r3, #1880]
	orrs	r2, r2, r0
	ldr	r1, .L876+88
	str	r2, [r3, #1884]
	ldr	r2, [r3, #1888]
	ands	r1, r1, r2
	ldr	r2, .L876+92
	orrs	r2, r2, r1
	str	r2, [r3, #1888]
	ldr	r2, [r3, #1892]
	and	r1, r2, #-1073741824
	b	.L877
.L878:
	.align	2
.L876:
	.word	.LANCHOR0
	.word	b16_skip_thd2.37412
	.word	2621460
	.word	b16_skip_wgt0.37414
	.word	b16_skip_wgt3.37415
	.word	b16_intra_thd0.37422
	.word	151848460
	.word	b16_intra_thd1.37423
	.word	b16_intra_thd2.37424
	.word	b16_intra_wgt0.37425
	.word	-66551680
	.word	b16_intra_wgt1.37426
	.word	b16_intra_wgt2.37427
	.word	50663173
	.word	29689095
	.word	1158746386
	.word	-491392
	.word	328967
	.word	68227346
	.word	-255791101
	.word	64028872
	.word	432506760
	.word	-16777088
	.word	3289601
	.word	-16776961
	.word	1052672
	.word	84346371
	.word	303239700
	.word	84346122
	.word	254218144
.L877:
	ldr	r2, .L879
.L859:
	orrs	r2, r2, r1
	str	r2, [r3, #1892]
	ldr	r2, [r5, #768]
	movw	r7, #4860
	ldr	r1, [r5, #692]
	ldr	r6, [r5, #68]
	ldr	r3, [r2, #152]
	ldr	r8, [r2, r7]
	mov	r7, #1000
	ldr	r2, [r5, #716]
	cmp	r3, #1
	ldr	r0, [r5, #804]
	it	lt
	movlt	r3, #1
	muls	r7, r2, r7
	ldr	r2, .L879+4
	mov	r9, r3
	ldr	r3, [r5, #720]
	add	ip, r2, r8
	ldrb	lr, [ip, #616]	@ zero_extendqisi2
	mul	lr, r1, lr
	cmp	r7, lr
	bcc	.L689
	ldrb	ip, [ip, #624]	@ zero_extendqisi2
	mul	ip, r1, ip
	cmp	r7, ip
	ite	cc
	movcc	r7, #1
	movcs	r7, #2
.L539:
	add	r2, r2, r8
	mov	ip, #1000
	mul	r3, ip, r3
	ldrb	ip, [r2, #632]	@ zero_extendqisi2
	mul	ip, r1, ip
	cmp	r3, ip
	bcc	.L691
	ldrb	r2, [r2, #640]	@ zero_extendqisi2
	muls	r1, r2, r1
	cmp	r3, r1
	ite	cc
	movcc	r3, #1
	movcs	r3, #2
.L540:
	ldr	r2, .L879+4
	add	r1, r2, r8
	add	r2, r2, r3
	ldrb	ip, [r1, #648]	@ zero_extendqisi2
	ldrb	lr, [r2, #656]	@ zero_extendqisi2
	add	ip, ip, lr
	ldr	lr, .L879+60
	strb	ip, [r6, #1820]
	ldrb	ip, [r1, #659]	@ zero_extendqisi2
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	add	ip, ip, r3
	strb	ip, [r6, #1821]
	ldrb	ip, [r6, #1828]	@ zero_extendqisi2
	ldr	r3, [r5, #940]
	bfi	ip, r3, #0, #1
	ldrb	r3, [r1, #667]	@ zero_extendqisi2
	strb	ip, [r6, #1828]
	mov	r1, r9
	cmp	r3, #2
	itt	hi
	ldrbhi	r2, [r2, #675]	@ zero_extendqisi2
	addhi	r3, r3, r2
	ldrb	r2, [r6, #1828]	@ zero_extendqisi2
	and	r3, r3, #7
	bfi	r2, r3, #4, #3
	strb	r2, [r6, #1828]
	ldr	r2, .L879+8
	ldr	r3, [r6, #1828]
	ands	r2, r2, r3
	ldr	r3, .L879+12
	orrs	r3, r3, r2
	str	r3, [r6, #1828]
	bl	__aeabi_idivmod
	cmp	r1, #0
	beq	.L693
	ldrb	r3, [r6, #1828]	@ zero_extendqisi2
	ands	r3, r3, #2
	beq	.L543
	adds	r3, r1, #-1
	it	ne
	movne	r3, #1
.L543:
	ldrb	r2, [r6, #1828]	@ zero_extendqisi2
	bfi	r2, r3, #3, #1
	strb	r2, [r6, #1828]
	cbz	r1, .L544
	uxtb	r3, r2
	ands	r3, r3, #2
	beq	.L695
	add	r9, r9, #-1
	subs	r1, r9, r1
	it	ne
	movne	r1, #1
.L544:
	add	r2, r10, r8
	ldrb	r3, [r6, #1828]	@ zero_extendqisi2
	add	r7, r7, r10
	bfi	r3, r1, #2, #1
	ldrb	r1, [r2, #678]	@ zero_extendqisi2
	strb	r3, [r6, #1828]
	ldrb	r3, [r6, #1856]	@ zero_extendqisi2
	bfi	r3, r1, #0, #6
	ldr	r1, .L879+16
	strb	r3, [r6, #1856]
	ldrh	r3, [r6, #1856]
	ldrb	r1, [r1, r8]	@ zero_extendqisi2
	bfi	r3, r1, #6, #6
	ldrb	r1, [r2, #686]	@ zero_extendqisi2
	strh	r3, [r6, #1856]	@ movhi
	ldr	r3, [r6, #1856]
	bfi	r3, r1, #12, #5
	ldr	r1, .L879+20
	str	r3, [r6, #1856]
	ubfx	r3, r3, #16, #8
	ldrb	r1, [r1, r8]	@ zero_extendqisi2
	bfi	r3, r1, #1, #5
	strb	r3, [r6, #1858]
	ldrb	r3, [r2, #694]	@ zero_extendqisi2
	ldrb	r2, [r7, #702]	@ zero_extendqisi2
	add	r3, r3, r2
	ldrh	r2, [r6, #1858]
	bfi	r2, r3, #6, #4
	ldr	r3, [r6, #1832]
	strh	r2, [r6, #1858]	@ movhi
	ubfx	r2, r2, #8, #8
	and	r3, r3, #-2147483648
	orr	r3, r3, #541065216
	orr	r3, r3, #3833856
	str	r3, [r6, #1832]
	ldr	r3, [r6, #1836]
	and	r1, r3, #-1073741824
	ldr	r3, .L879+24
	orrs	r3, r3, r1
	str	r3, [r6, #1836]
	ldr	r3, [r6, #1840]
	ldr	r1, .L879+28
	and	r3, r3, #-268374016
	orr	r3, r3, #235802126
	orr	r3, r3, #14745825
	str	r3, [r6, #1840]
	ldr	r3, [r6, #1844]
	ands	r1, r1, r3
	ldr	r3, .L879+32
	orrs	r3, r3, r1
	str	r3, [r6, #1844]
	ldr	r3, [r6, #1848]
	bic	r3, r3, #4128831
	bic	r3, r3, #16128
	orr	r3, r3, #1769472
	orr	r3, r3, #7456
	str	r3, [r6, #1848]
	ldr	r3, [r6, #1852]
	and	r1, r3, #32768
	ldr	r3, .L879+36
	orrs	r3, r3, r1
	str	r3, [r6, #1852]
	movs	r3, #30
	bfi	r2, r3, #2, #6
	movw	r3, #65535
	strh	r3, [r6, #1820]	@ movhi
	ldr	r3, [r6, #1896]
	strb	r2, [r6, #1859]
	orr	r3, r3, #16711680
	orr	r3, r3, #65280
	str	r3, [r6, #1896]
	ldr	r6, .L879+40
	ldr	r7, [r5, #68]
	ldr	r3, [r6]
	mov	r10, r6
	ldrb	r8, [r7, #407]	@ zero_extendqisi2
	tst	r3, #4
	and	r8, r8, #3
	beq	.L545
	movw	r3, #2601
	ldr	r1, .L879+44
	mov	r2, r3
	ldr	r0, .L879+48
	bl	printk
.L545:
	cmp	r8, #1
	bne	.L546
	ldr	r0, .L879+52
	addw	r3, r7, #2167
	addw	lr, r7, #2231
	add	ip, r0, #64
.L547:
	ldrb	r1, [r0], #-1	@ zero_extendqisi2
	strb	r1, [r3, #1]!
	cmp	lr, r3
	strb	r1, [r3, #64]
	strb	r1, [r3, #128]
	ldrb	r2, [ip], #-1	@ zero_extendqisi2
	strb	r1, [r3, #384]
	strb	r1, [r3, #448]
	strb	r2, [r3, #192]
	strb	r2, [r3, #256]
	strb	r2, [r3, #320]
	strb	r1, [r3, #512]
	strb	r2, [r3, #576]
	strb	r2, [r3, #640]
	strb	r2, [r3, #704]
	strb	r1, [r3, #768]
	strb	r2, [r3, #832]
	bne	.L547
	mov	r3, #269488144
	str	r3, [r7, #3064]
	str	r3, [r7, #3068]
.L548:
	ldr	r3, [r10]
	lsls	r1, r3, #29
	bpl	.L549
	movw	r3, #2643
	ldr	r1, .L879+44
	mov	r2, r3
	ldr	r0, .L879+56
	bl	printk
	b	.L880
.L881:
	.align	2
.L879:
	.word	545930516
	.word	.LANCHOR0
	.word	-16776963
	.word	11577346
	.word	thre_madp_stc_cover1.37459
	.word	thre_madp_mov_cover1.37461
	.word	340330634
	.word	-1061101344
	.word	573575189
	.word	303432396
	.word	hal_h265e_debug
	.word	.LANCHOR0+705
	.word	.LC0
	.word	.LANCHOR0+798
	.word	.LC1
	.word	flag_cover_intra_wgt1.37468
.L880:
.L549:
	ldr	r2, [r5, #744]
	ldr	r3, [r5, #68]
	ldr	r7, [r5, #768]
	cmp	r2, #2
	itett	eq
	addeq	r2, r7, #464
	addne	r2, r7, #528
	ldreq	ip, [r7, #464]
	addeq	r0, r7, #336
	ittet	ne
	ldrne	ip, [r7, #528]
	addne	r0, r7, #400
	addeq	r1, r7, #664
	addne	r1, r7, #684
	ldrb	r7, [r3, #856]	@ zero_extendqisi2
	bfi	r7, ip, #0, #5
	strb	r7, [r3, #856]
	ldr	r7, [r2, #4]
	ldrh	ip, [r3, #856]
	bfi	ip, r7, #5, #5
	strh	ip, [r3, #856]	@ movhi
	ldr	r7, [r2, #8]
	ubfx	ip, ip, #8, #8
	bfi	ip, r7, #2, #5
	strb	ip, [r3, #857]
	ldr	r6, [r2, #12]
	ldr	r7, [r3, #856]
	bfi	r7, r6, #15, #5
	str	r7, [r3, #856]
	ubfx	ip, r7, #16, #16
	ldr	r7, [r2, #16]
	bfi	ip, r7, #4, #5
	strh	ip, [r3, #858]	@ movhi
	ldr	r7, [r2, #20]
	ubfx	ip, ip, #8, #8
	bfi	ip, r7, #1, #5
	strb	ip, [r3, #859]
	ldrb	ip, [r3, #860]	@ zero_extendqisi2
	ldr	r7, [r2, #24]
	bfi	ip, r7, #0, #5
	strb	ip, [r3, #860]
	ldr	r7, [r2, #28]
	ldrh	ip, [r3, #860]
	bfi	ip, r7, #5, #5
	strh	ip, [r3, #860]	@ movhi
	ubfx	ip, ip, #8, #8
	bfc	ip, #2, #5
	strb	ip, [r3, #861]
	ldr	r6, [r2, #32]
	ldr	r7, [r3, #860]
	bfi	r7, r6, #15, #5
	str	r7, [r3, #860]
	ubfx	ip, r7, #16, #16
	ldr	r7, [r2, #36]
	bfi	ip, r7, #4, #5
	strh	ip, [r3, #862]	@ movhi
	ldr	r7, [r2, #40]
	ubfx	ip, ip, #8, #8
	bfi	ip, r7, #1, #5
	strb	ip, [r3, #863]
	ldr	r7, [r2, #44]
	ldrb	ip, [r3, #864]	@ zero_extendqisi2
	bfi	ip, r7, #0, #5
	strb	ip, [r3, #864]
	ldr	r7, [r2, #48]
	ldrh	ip, [r3, #864]
	bfi	ip, r7, #5, #5
	strh	ip, [r3, #864]	@ movhi
	ldr	r7, [r2, #52]
	ubfx	ip, ip, #8, #8
	bfi	ip, r7, #2, #5
	strb	ip, [r3, #865]
	ldr	r6, [r2, #56]
	ldr	r7, [r3, #864]
	bfi	r7, r6, #15, #5
	str	r7, [r3, #864]
	ldr	r2, [r2, #60]
	ubfx	ip, r7, #16, #16
	addw	r7, r3, #839
	bfi	ip, r2, #4, #5
	subs	r2, r0, #4
	adds	r0, r0, #60
	strh	ip, [r3, #866]	@ movhi
.L552:
	ldr	ip, [r2, #4]!
	cmp	r0, r2
	strb	ip, [r7, #1]!
	bne	.L552
	ldr	r0, [r1]
	ldrb	r2, [r3, #868]	@ zero_extendqisi2
	bfi	r2, r0, #0, #4
	strb	r2, [r3, #868]
	ldr	r0, [r1, #4]
	bfi	r2, r0, #4, #4
	strb	r2, [r3, #868]
	ldrb	r2, [r3, #869]	@ zero_extendqisi2
	ldr	r0, [r1, #8]
	bfi	r2, r0, #0, #5
	strb	r2, [r3, #869]
	ldr	r2, [r3, #868]
	ldr	r0, [r1, #12]
	bfi	r2, r0, #13, #5
	str	r2, [r3, #868]
	ldr	r1, [r1, #16]
	ubfx	r2, r2, #16, #8
	bfi	r2, r1, #2, #5
	strb	r2, [r3, #870]
	ldrb	r2, [r3, #871]	@ zero_extendqisi2
	bic	r2, r2, #5
	orr	r2, r2, #5
	strb	r2, [r3, #871]
	ldr	r3, [r5, #940]
	cmp	r3, #0
	beq	.L554
	ldr	r0, [r5, #964]
	cmp	r0, #0
	beq	.L555
	ldr	r3, [r5, #968]
	cmp	r3, #0
	beq	.L555
	ldr	r3, [r5, #976]
	cmp	r3, #0
	beq	.L555
	ldr	r3, [r5, #972]
	cmp	r3, #0
	beq	.L555
.L571:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	movs	r2, #171
	orr	r3, r3, #8
	strb	r3, [r4, #244]
	ldr	r1, [r5, #964]
	ldr	r0, [r5, #64]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #160]
.L556:
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #212]
	str	r3, [sp, #8]
	cmp	r3, #0
	bne	.L554
	ldr	r3, [r5, #768]
	movw	r2, #4860
	ldr	r2, [r3, r2]
	cmp	r2, #3
	bgt	.L554
	movw	r2, #4852
	ldr	r2, [r3, r2]
	cmp	r2, #1
	bne	.L554
	ldr	r2, [r5, #68]
	ldrd	r8, r7, [r3, #12]
	ldr	r3, [r10]
	str	r2, [sp, #12]
	lsls	r2, r3, #29
	bpl	.L573
	movw	r3, #2556
	ldr	r1, .L882
	mov	r2, r3
	ldr	r0, .L882+4
	bl	printk
.L573:
	ldr	r3, [r5, #964]
	cmp	r3, #0
	beq	.L554
	ldr	r3, [r5, #968]
	cmp	r3, #0
	beq	.L554
	ldr	r3, [r5, #976]
	cmp	r3, #0
	beq	.L554
	ldr	r3, [r5, #972]
	cmp	r3, #0
	beq	.L554
	ldr	r2, [sp, #12]
	add	r8, r8, #31
	ldr	r3, [r5, #744]
	adds	r7, r7, #31
	bic	r7, r7, #31
	subs	r3, r3, #2
	ldrb	r2, [r2, #912]	@ zero_extendqisi2
	it	ne
	movne	r3, #1
	bfi	r2, r3, #0, #1
	ldr	r3, [sp, #12]
	strb	r2, [r3, #912]
	ldr	r2, .L882+8
	ldr	r3, [r3, #912]
	ands	r2, r2, r3
	ldr	r3, .L882+12
	orrs	r3, r3, r2
	ldr	r2, [sp, #12]
	str	r3, [r2, #912]
	bic	r2, r8, #31
	ldr	r3, [r5, #744]
	muls	r7, r2, r7
	it	mi
	addmi	r7, r7, #255
	cmp	r3, #2
	asr	r7, r7, #8
	bne	.L575
	mov	r2, r7
	movs	r1, #0
	ldr	r0, [r5, #976]
	bl	memset
.L576:
	movs	r2, #186
	ldr	r1, [r5, #968]
	ldr	r0, [r5, #64]
	bl	mpp_dev_get_iova_address
	ldr	r3, [sp, #12]
	str	r0, [r3, #220]
	ldr	r3, .L882+16
	ldr	r3, [r3]
	lsls	r0, r3, #29
	bpl	.L554
	movw	r3, #2590
	ldr	r1, .L882
	mov	r2, r3
	ldr	r0, .L882+20
	bl	printk
.L554:
	ldr	r3, [r5, #764]
	cbz	r3, .L672
	add	r0, r5, #756
	bl	vepu500_set_osd
.L672:
	ldr	r1, [r5, #752]
	cbz	r1, .L673
	ldr	r2, [r5, #768]
	add	r0, r4, #916
	ldrd	r2, r3, [r2, #12]
	bl	vepu500_set_roi
.L673:
	ldr	r2, [r5, #768]
	movw	r3, #4876
	ldr	r1, .L882+24
	addw	r0, r4, #1348
	ldr	r6, [r2, r3]
	movs	r2, #11
	ldrb	r3, [r4, #1556]	@ zero_extendqisi2
	bfi	r3, r2, #0, #5
	strb	r3, [r4, #1556]
	ldr	r2, [r5, #768]
	ldrb	r3, [r4, #468]	@ zero_extendqisi2
	ldr	r2, [r2, #904]
	bfi	r3, r2, #0, #3
	movs	r2, #208
	strb	r3, [r4, #468]
	bl	memcpy
	ldr	r3, [r5, #744]
	addw	r0, r4, #1604
	cmp	r3, #2
	ittet	ne
	ldrne	r2, [r5, #768]
	movwne	r3, #4872
	ldreq	r1, .L882+28
	ldrne	r1, .L882+32
	ite	ne
	ldrne	r3, [r2, r3]
	addeq	r1, r1, r6, lsl #2
	mov	r2, #208
	it	ne
	addne	r1, r1, r3, lsl #2
	bl	memcpy
	ldr	r3, [r4, #872]
	and	r2, r3, #-16777216
	ldr	r3, .L882+36
	orrs	r3, r3, r2
	str	r3, [r4, #872]
	ldr	r3, [r4, #876]
	movs	r2, #240
	and	r3, r3, #-268374016
	orr	r3, r3, #9437184
	orr	r3, r3, #64
	str	r3, [r4, #876]
	ldrh	r3, [r4, #880]
	bfi	r3, r2, #0, #12
	strh	r3, [r4, #880]	@ movhi
	ldr	r3, [sp, #24]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r1, r3, #29
	bpl	.L676
	ldr	r0, [r5, #772]
	cmp	r0, #0
	bne	.L677
	ldr	r1, [r5, #768]
	ldr	r2, [r1, #12]
	adds	r2, r2, #15
	bic	r3, r2, #15
	ldr	r2, [r1, #16]
	add	r1, r5, #772
	adds	r2, r2, #15
	bic	r2, r2, #15
	muls	r2, r3, r2
	ldr	r3, .L882+40
	str	r3, [sp]
	ldr	r3, .L882+44
	add	r2, r2, r2, lsl #1
	asrs	r2, r2, #1
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #772]
	cmp	r3, #0
	bne	.L677
	movw	r1, #1732
	ldr	r0, .L882+48
	bl	printk
.L676:
	ldr	r3, [sp, #24]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r2, r3, #28
	bpl	.L678
	ldr	r1, [r5, #788]
	ldrh	r3, [fp, #4]
	ldrb	r2, [r4, #48]	@ zero_extendqisi2
	ldr	r1, [r1, #16]
	adds	r3, r3, #15
	bic	r3, r3, #15
	bfi	r2, r1, #4, #4
	strb	r2, [r4, #48]
	movs	r2, #216
	strb	r2, [r4, #268]
	ldr	r2, [r4, #296]
	lsls	r6, r3, #1
	bfi	r2, r3, #0, #21
	add	r3, r3, r6
	strh	r3, [r4, #300]	@ movhi
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	str	r2, [r4, #296]
	movs	r2, #160
	bic	r3, r3, #28
	strb	r3, [r4, #291]
	ldr	r3, [r4, #292]
	and	r3, r3, #-1073692672
	str	r3, [r4, #292]
	ldr	r1, [r5, #772]
	ldr	r0, [r5, #64]
	bl	mpp_dev_get_iova_address
	movs	r3, #0
	str	r3, [r4, #124]
	add	r6, r6, r0
	str	r0, [r4, #116]
	str	r6, [r4, #120]
.L678:
	ldr	r3, [r5, #804]
	adds	r3, r3, #1
	str	r3, [r5, #804]
	ldr	r3, .L882+16
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L793
	movw	r3, #2797
	ldr	r1, .L882+52
	mov	r2, r3
	ldr	r0, .L882+20
	bl	printk
.L793:
	movs	r0, #0
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L528:
	ldrb	r1, [r3, #620]	@ zero_extendqisi2
	ldrh	r0, [r3, #656]
	ldrb	r10, [r3, #624]	@ zero_extendqisi2
	str	r1, [sp, #12]
	ldrb	r9, [r3, #628]	@ zero_extendqisi2
	ldrh	r8, [r3, #632]
	ldrh	lr, [r3, #636]
	ldrh	ip, [r3, #640]
	ldrh	r1, [r3, #644]
	ldrh	r7, [r3, #648]
	ldrh	r6, [r3, #652]
	str	r0, [sp, #16]
	ldrh	r3, [r3, #660]
	b	.L527
.L688:
	mov	ip, r1
	b	.L857
.L531:
	strd	r1, r1, [r6, #188]
	b	.L532
.L534:
	bfc	r2, #7, #1
	orr	r6, r6, #1
	strb	r1, [r3, #1868]
	strb	r2, [r3, #1875]
	strb	r6, [r3, #1884]
	b	.L535
.L536:
	cmp	lr, #2
	ldr	lr, .L882+72
	bne	.L538
	bic	r6, r6, #133693440
	orr	r2, r2, #131072000
	bic	r6, r6, #464896
	orr	r2, r2, #4000
	bic	r6, r6, #2040
	str	r2, [r3, #1872]
	ldr	r2, .L882+56
	bic	r6, r6, #7
	and	r1, r1, #-134154240
	bic	r0, r0, #1069547520
	orrs	r2, r2, r6
	orr	r1, r1, #31981568
	str	r2, [r3, #1876]
	bic	r0, r0, #4177920
	ldr	r2, [r3, #1888]
	bic	r0, r0, #16320
	str	r1, [r3, #1880]
	bic	r0, r0, #62
	ldr	r1, .L882+60
	orr	r0, r0, lr
	str	r0, [r3, #1884]
	ands	r1, r1, r2
	ldr	r2, .L882+64
	orrs	r2, r2, r1
	str	r2, [r3, #1888]
	ldr	r2, [r3, #1892]
	and	r1, r2, #-1073741824
	ldr	r2, .L882+68
	b	.L859
.L883:
	.align	2
.L882:
	.word	.LANCHOR0+896
	.word	.LC0
	.word	-524287
	.word	471714
	.word	hal_h265e_debug
	.word	.LC1
	.word	.LANCHOR0+1124
	.word	.LANCHOR1+464
	.word	.LANCHOR1+704
	.word	1313797
	.word	.LANCHOR0+1332
	.word	.LC25
	.word	.LC50
	.word	.LANCHOR0+500
	.word	64028872
	.word	-16777088
	.word	3947521
	.word	545930521
	.word	566560006
.L538:
	ldr	r7, .L884
	and	r1, r1, #-134154240
	orr	r1, r1, #33554432
	str	r1, [r3, #1880]
	orrs	r7, r7, r2
	ldr	r1, .L884+4
	ldr	r2, [r3, #1888]
	bic	r6, r6, #133693440
	bic	r6, r6, #464896
	bic	r0, r0, #1069547520
	ands	r1, r1, r2
	ldr	r2, .L884+8
	bic	r6, r6, #2040
	bic	r0, r0, #4177920
	orrs	r2, r2, r1
	bic	r6, r6, #7
	bic	r0, r0, #16320
	str	r2, [r3, #1888]
	ldr	r2, [r3, #1892]
	orr	r6, r6, #83886080
	bic	r0, r0, #62
	orr	r6, r6, #300
	orr	r0, r0, lr
	and	r1, r2, #-1073741824
	str	r7, [r3, #1872]
	str	r6, [r3, #1876]
	str	r0, [r3, #1884]
	ldr	r2, .L884+12
	b	.L859
.L689:
	movs	r7, #0
	b	.L539
.L691:
	movs	r3, #0
	b	.L540
.L693:
	mov	r3, r1
	b	.L543
.L695:
	mov	r1, r3
	b	.L544
.L546:
	cmp	r8, #2
	bne	.L548
	mov	r2, #2640
	ldr	r1, .L884+16
	ldr	r0, .L884+20
	bl	printk
	b	.L548
.L555:
	ldr	r3, [r5, #768]
	ldr	r7, [r3, #28]
	ldr	r3, [r3, #32]
	adds	r7, r7, #31
	bics	r7, r7, #31
	add	r8, r3, #31
	it	mi
	addmi	r7, r7, #15
	bics	r8, r8, #31
	it	mi
	addmi	r8, r8, #15
	asrs	r7, r7, #4
	asr	r8, r8, #4
	cbnz	r0, .L560
	mul	r2, r8, r7
	ldr	r9, .L884+40
	ldr	r3, .L884+24
	add	r1, r5, #964
	str	r9, [sp]
	lsls	r2, r2, #2
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #964]
	cbnz	r3, .L560
	movw	r1, #2709
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L884+28
	ldr	r0, .L884+32
	bl	printk
.L560:
	ldr	r0, [r5, #968]
	cbnz	r0, .L563
	mul	r2, r8, r7
	ldr	r9, .L884+40
	ldr	r3, .L884+24
	add	r1, r5, #968
	str	r9, [sp]
	lsls	r2, r2, #4
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #968]
	cbnz	r3, .L563
	movw	r1, #2713
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L884+36
	ldr	r0, .L884+32
	bl	printk
.L563:
	ldr	r3, [r5, #972]
	cbnz	r3, .L566
	mul	r1, r8, r7
	ldr	r0, .L884+40
	lsls	r1, r1, #2
	bl	mpp_osal_calloc
	str	r0, [r5, #972]
	cbnz	r0, .L566
	movw	r1, #2717
	ldr	r3, .L884+40
	str	r1, [sp]
	ldr	r2, .L884+44
	ldr	r0, .L884+32
	bl	printk
.L566:
	ldr	r3, [r5, #976]
	cbnz	r3, .L569
	mul	r1, r8, r7
	ldr	r0, .L884+40
	bl	mpp_osal_calloc
	str	r0, [r5, #976]
	cbnz	r0, .L569
	movw	r1, #2721
	ldr	r3, .L884+40
	str	r1, [sp]
	ldr	r2, .L884+48
	ldr	r0, .L884+32
	bl	printk
.L569:
	ldr	r3, [r5, #964]
	cmp	r3, #0
	beq	.L556
	b	.L571
.L575:
	ldr	r1, .L884+52
	ldr	r0, [r5, #968]
	bl	mpp_buffer_get_ptr_with_caller
	lsls	r2, r7, #2
	movs	r1, #0
	bl	memset
	ldr	r2, [r5, #768]
	ldr	r10, [r5, #944]
	ldr	r6, [r5, #68]
	ldr	r3, [r2, #12]
	add	r1, r3, #31
	cmp	r10, #0
	beq	.L577
	ldr	r7, [r2, #16]
	adds	r3, r3, #127
	ldr	r9, [r5, #964]
	adds	r7, r7, #31
	bic	r2, r7, #31
	bic	r7, r1, #31
	asrs	r1, r1, #5
	mov	r0, r9
	muls	r7, r2, r7
	cmp	r7, #0
	mov	r8, r7
	it	lt
	addlt	r8, r7, #255
	bics	r3, r3, #127
	it	mi
	addmi	r3, r3, #31
	asr	r8, r8, #8
	asrs	r3, r3, #5
	lsls	r3, r3, #2
	str	r3, [sp, #32]
	lsls	r3, r1, #2
	ldr	r1, .L884+56
	str	r3, [sp, #36]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r3, [r5, #976]
	ldr	r2, [r5, #768]
	str	r3, [sp, #16]
	movw	r3, #4860
	ldr	r3, [r2, r3]
	str	r0, [sp, #40]
	str	r3, [sp, #20]
	ldr	r3, .L884+60
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L580
	movw	r3, #2447
	ldr	r1, .L884+64
	mov	r2, r3
	ldr	r0, .L884+68
	bl	printk
.L580:
	ldr	r1, .L884+56
	mov	r0, r9
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	mov	r9, #0
	mov	r10, r9
	ldr	r3, [sp, #16]
	subs	r3, r3, #1
.L581:
	cmp	r8, r10
	bne	.L583
	ldrb	r3, [r6, #245]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #35
	ble	.L584
	cmp	r3, #41
	ble	.L698
	cmp	r3, #46
	ite	lt
	movlt	r1, #2
	movge	r1, #3
.L586:
	movs	r2, #100
	mul	r9, r2, r9
	movs	r2, #10
	mul	r2, r2, r8
	cmp	r9, r2
	bcc	.L588
.L606:
	ldr	r3, .L884+60
	ldr	r3, [r3]
	lsls	r0, r3, #29
	bpl	.L587
	ldr	r1, .L884+64
	mov	r3, #2544
	mov	r2, r3
.L861:
	ldr	r0, .L884+72
	bl	printk
.L587:
	ldr	r3, [r5, #972]
	cmp	r3, #0
	bne	.L645
.L648:
	ldr	r1, .L884+52
	ldr	r0, [r5, #968]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #1
	bl	dma_buf_end_cpu_access
	b	.L576
.L583:
	ldr	r1, [sp, #36]
	mov	r0, r10
	str	r3, [sp, #44]
	bl	__aeabi_uidivmod
	ldr	r3, [sp, #32]
	mla	r3, r3, r0, r1
	str	r3, [sp, #28]
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #40]
	ldrb	r1, [r3, r2]	@ zero_extendqisi2
	ldr	r3, [sp, #44]
	lsls	r1, r1, #2
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	and	r0, r1, #252
	cmp	r0, #90
	lsl	r2, r2, #2
	and	r2, r2, #60
	bhi	.L696
	cmp	r0, #50
	bhi	.L697
	tst	r1, #240
	ite	ne
	movne	r1, #1
	moveq	r1, #0
.L582:
	orrs	r2, r2, r1
	strb	r2, [r3, #1]!
	and	r2, r2, #15
	add	r10, r10, #1
	cmp	r2, #9
	it	eq
	addeq	r9, r9, #1
	b	.L581
.L696:
	movs	r1, #3
	b	.L582
.L697:
	movs	r1, #2
	b	.L582
.L584:
	cmp	r3, #31
	ble	.L587
	movs	r1, #0
	b	.L586
.L885:
	.align	2
.L884:
	.word	131078000
	.word	-16777088
	.word	4605441
	.word	545930526
	.word	.LANCHOR0+705
	.word	.LC45
	.word	.LC25
	.word	.LC46
	.word	.LC39
	.word	.LC47
	.word	.LANCHOR0+863
	.word	.LC48
	.word	.LC49
	.word	.LANCHOR0+920
	.word	.LANCHOR0+944
	.word	hal_h265e_debug
	.word	.LANCHOR0+974
	.word	.LC0
	.word	.LC1
.L588:
	ldrb	r2, [r6, #914]	@ zero_extendqisi2
	cmp	r3, #40
	ubfx	r2, r2, #2, #1
	str	r2, [sp, #32]
	ble	.L591
	ldrh	r3, [r6, #912]
	movs	r2, #27
.L860:
	cmp	r8, r9
	bfi	r3, r2, #6, #6
	strh	r3, [r6, #912]	@ movhi
	bls	.L596
	adds	r6, r1, #5
.L597:
	ldr	r3, .L886
	ldr	r2, [sp, #20]
	ldr	r0, [r5, #968]
	add	r2, r2, r3
	ldr	r1, .L886+4
	ldrb	r3, [r2, #1004]	@ zero_extendqisi2
	subs	r6, r6, r3
	subs	r3, r6, #2
	cmp	r3, #1
	ldr	r3, [sp, #32]
	ite	gt
	addgt	r6, r6, #-1
	movle	r6, #2
	cmp	r3, #0
	bne	.L601
	bl	mpp_buffer_get_ptr_with_caller
	rsb	r6, r6, #128
	uxtb	r6, r6
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #32]
	mov	ip, r1
	ldr	r1, [sp, #28]
	mov	r3, r2
	mov	r7, r2
	add	ip, ip, r1
.L602:
	cmp	r8, r7
	beq	.L606
	ldrb	r1, [ip, r2, lsl #2]	@ zero_extendqisi2
	adds	r7, r7, #1
	lsl	lr, r2, #2
	and	r1, r1, #15
	sub	r9, r1, #9
	rsbs	r1, r9, #0
	adc	r1, r1, r9
	cmp	r3, r1
	it	cc
	movcc	r3, r1
	lsls	r1, r7, #30
	bne	.L602
	cmp	r3, #0
	add	r2, r2, #1
	it	ne
	movne	r3, r6
	strb	r3, [r0, lr]
	movs	r3, #0
	b	.L602
.L591:
	cmp	r3, #35
	ldr	r2, [sp, #20]
	ldrh	r3, [r6, #912]
	ble	.L593
	cmp	r2, #2
	ite	lt
	movlt	r2, #26
	movge	r2, #25
	b	.L860
.L593:
	cmp	r2, #2
	ite	lt
	movlt	r2, #25
	movge	r2, #24
	b	.L860
.L596:
	add	r3, r8, r8, lsl #1
	cmp	r9, r3
	bcs	.L598
	adds	r6, r1, #4
	b	.L597
.L598:
	add	r3, r8, r8, lsl #2
	cmp	r9, r3
	ite	cc
	addcc	r6, r1, #3
	addcs	r6, r1, #2
	b	.L597
.L601:
	bl	mpp_buffer_get_ptr_with_caller
	cmp	r7, #0
	it	lt
	addwlt	r7, r7, #1023
	rsb	r6, r6, #128
	movs	r1, #0
	asrs	r7, r7, #10
	ldr	r3, [sp, #16]
	add	ip, r3, #4
.L608:
	cmp	r7, r1
	bls	.L606
	sub	lr, ip, #4
	movs	r3, #0
.L610:
	ldrb	r2, [lr], #1	@ zero_extendqisi2
	ubfx	r8, r2, #2, #2
	cmp	r8, #2
	bne	.L704
	and	r2, r2, #3
	add	r8, r2, #-1
	rsbs	r2, r8, #0
	adc	r2, r2, r8
.L609:
	cmp	r3, r2
	it	cc
	movcc	r3, r2
	cmp	ip, lr
	bne	.L610
	lsl	lr, r1, #4
	cmp	r3, #0
	add	r2, r0, lr
	add	r1, r1, #1
	it	ne
	movne	r3, r6
	add	ip, ip, #4
	uxtb	r3, r3
	strb	r3, [r0, lr]
	strb	r3, [r2, #7]
	strb	r3, [r2, #4]
	strb	r3, [r2, #8]
	strb	r3, [r2, #12]
	b	.L608
.L704:
	movs	r2, #0
	b	.L609
.L577:
	ldr	r2, [r2, #16]
	bic	r0, r1, #31
	adds	r3, r3, #127
	ldr	r8, [r5, #964]
	adds	r2, r2, #31
	bic	r2, r2, #31
	muls	r2, r0, r2
	mov	r0, r8
	cmp	r2, #0
	mov	r7, r2
	it	lt
	addlt	r7, r2, #255
	bics	r3, r3, #127
	str	r2, [sp, #16]
	it	mi
	addmi	r3, r3, #31
	asrs	r7, r7, #8
	asrs	r3, r3, #5
	str	r3, [sp, #36]
	asrs	r3, r1, #5
	ldr	r1, .L886+8
	str	r3, [sp, #40]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r3, [r5, #976]
	ldr	r2, [r5, #768]
	str	r3, [sp, #20]
	movw	r3, #4860
	ldr	r3, [r2, r3]
	str	r0, [sp, #28]
	str	r3, [sp, #32]
	ldr	r3, .L886+12
	ldr	r3, [r3]
	lsls	r0, r3, #29
	bpl	.L615
	movw	r3, #2318
	ldr	r1, .L886+16
	mov	r2, r3
	ldr	r0, .L886+20
	bl	printk
.L615:
	ldr	r1, .L886+8
	mov	r0, r8
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	mov	r8, #0
	lsrs	r3, r7, #2
	mov	r9, r8
	str	r3, [sp, #44]
	ldr	r3, [sp, #28]
	adds	r3, r3, #4
	str	r3, [sp, #52]
.L616:
	ldr	r3, [sp, #44]
	cmp	r9, r3
	bne	.L620
	ldrb	r0, [r6, #245]	@ zero_extendqisi2
	and	r0, r0, #63
	cmp	r0, #35
	ble	.L621
	cmp	r0, #46
	ite	lt
	movlt	r2, #3
	movge	r2, #2
.L682:
	mov	r1, #400
	rsb	r3, r7, r7, lsl #4
	mul	r1, r1, r8
	cmp	r1, r3
	bcc	.L623
.L639:
	ldr	r3, .L886+12
	ldr	r3, [r3]
	lsls	r3, r3, #29
	bpl	.L587
	movw	r3, #2426
	ldr	r1, .L886+16
	mov	r2, r3
	b	.L861
.L620:
	ldr	r1, [sp, #40]
	mov	r0, r9
	bl	__aeabi_uidivmod
	ldr	r3, [sp, #36]
	mla	r1, r3, r0, r1
	ldr	r3, [sp, #28]
	movs	r0, #0
	lsls	r1, r1, #2
	add	ip, r3, r1
	ldr	r3, [sp, #20]
	add	lr, r3, r1
	ldr	r3, [sp, #52]
	add	r3, r3, r1
	str	r3, [sp, #48]
.L619:
	ldrb	r2, [ip], #1	@ zero_extendqisi2
	ldrb	r3, [lr], #1	@ zero_extendqisi2
	lsls	r2, r2, #2
	and	r1, r2, #252
	lsls	r3, r3, #2
	cmp	r1, #90
	and	r3, r3, #60
	bhi	.L706
	cmp	r1, #50
	bhi	.L707
	tst	r2, #240
	ite	ne
	movne	r2, #1
	moveq	r2, #0
.L617:
	orrs	r3, r3, r2
	strb	r3, [lr, #-1]
	ubfx	r2, r3, #2, #2
	cmp	r2, #2
	bne	.L708
	and	r3, r3, #3
	subs	r1, r3, #1
	rsbs	r3, r1, #0
	adcs	r3, r3, r1
.L618:
	add	r0, r0, r3
	ldr	r3, [sp, #48]
	cmp	r3, ip
	bne	.L619
	cmp	r0, #0
	it	gt
	addgt	r8, r8, #1
	add	r9, r9, #1
	b	.L616
.L706:
	movs	r2, #3
	b	.L617
.L707:
	movs	r2, #2
	b	.L617
.L708:
	movs	r3, #0
	b	.L618
.L621:
	cmp	r0, #31
	ble	.L587
	movs	r2, #0
	b	.L682
.L623:
	ldrb	r3, [r6, #914]	@ zero_extendqisi2
	cmp	r1, r7, lsr #5
	ubfx	r9, r3, #2, #1
	bls	.L625
	cmp	r0, #40
	ldrh	r3, [r6, #912]
	ble	.L626
	movs	r0, #29
.L866:
	bfi	r3, r0, #6, #6
	strh	r3, [r6, #912]	@ movhi
.L627:
	cmp	r7, r1
	bhi	.L680
	add	r3, r7, r7, lsl #1
	cmp	r1, r3
	bcs	.L631
	adds	r2, r2, #6
	b	.L630
.L626:
	cmp	r0, #35
	ble	.L628
	movs	r0, #28
	b	.L866
.L628:
	ldr	r0, [sp, #32]
	cmp	r0, #2
	ite	lt
	movlt	r0, #27
	movge	r0, #26
	b	.L866
.L887:
	.align	2
.L886:
	.word	.LANCHOR0
	.word	.LANCHOR0+944
	.word	.LANCHOR0+1008
	.word	hal_h265e_debug
	.word	.LANCHOR0+1039
	.word	.LC0
.L680:
	adds	r2, r2, #7
.L630:
	ldr	r1, .L888
	ldr	r3, [sp, #32]
	ldr	r0, [r5, #968]
	add	r3, r3, r1
	add	r1, r1, #1008
	ldrb	r6, [r3, #1004]	@ zero_extendqisi2
	subs	r2, r2, r6
	subs	r6, r2, #2
	cmp	r6, #2
	it	lt
	movlt	r6, #2
	cmp	r9, #0
	bne	.L633
	rsb	r6, r6, #128
	bl	mpp_buffer_get_ptr_with_caller
	mov	r3, r9
	mov	r2, r9
	uxtb	r6, r6
	mov	ip, r9
.L634:
	cmp	r7, ip
	beq	.L639
	ldr	r1, [sp, #20]
	ldrb	r1, [r1, ip]	@ zero_extendqisi2
	ubfx	lr, r1, #2, #2
	cmp	lr, #2
	bne	.L711
	and	r1, r1, #3
	add	r8, r1, #-1
	rsbs	r1, r8, #0
	adc	r1, r1, r8
.L635:
	cmp	r2, r1
	add	ip, ip, #1
	it	cc
	movcc	r2, r1
	tst	ip, #3
	bne	.L634
	cmp	r2, #0
	it	ne
	movne	r2, r6
	strb	r2, [r0, r3, lsl #2]
	adds	r3, r3, #1
	movs	r2, #0
	b	.L634
.L631:
	rsb	r3, r7, r7, lsl #3
	cmp	r1, r3
	ite	cc
	addcc	r2, r2, #5
	addcs	r2, r2, #4
	b	.L630
.L711:
	movs	r1, #0
	b	.L635
.L633:
	bl	mpp_buffer_get_ptr_with_caller
	rsb	r6, r6, #128
	ldr	r3, [sp, #16]
	ldr	r1, [sp, #20]
	cmp	r3, #0
	add	r1, r1, #4
	mov	r2, r3
	it	lt
	addwlt	r2, r3, #1023
	asrs	r2, r2, #10
.L641:
	cmp	r2, r10
	bls	.L639
	sub	ip, r1, #4
	movs	r3, #0
.L642:
	ldrb	r7, [ip], #1	@ zero_extendqisi2
	and	r7, r7, #15
	sub	lr, r7, #9
	rsbs	r7, lr, #0
	adc	r7, r7, lr
	cmp	r3, r7
	it	cc
	movcc	r3, r7
	cmp	r1, ip
	bne	.L642
	lsl	ip, r10, #4
	cmp	r3, #0
	add	r7, r0, ip
	add	r10, r10, #1
	it	ne
	movne	r3, r6
	adds	r1, r1, #4
	uxtb	r3, r3
	strb	r3, [r0, ip]
	strb	r3, [r7, #7]
	strb	r3, [r7, #4]
	strb	r3, [r7, #8]
	strb	r3, [r7, #12]
	b	.L641
.L645:
	ldr	r3, [r5, #768]
	ldr	r1, .L888+4
	ldr	r0, [r5, #964]
	ldrd	r8, r6, [r3, #12]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r10, [r5, #768]
	ldr	r1, [r10, #152]
	cmp	r1, #1
	it	lt
	movlt	r1, #1
	mov	r7, r0
	ldr	r0, [r5, #804]
	bl	__aeabi_idivmod
	mov	r0, r1
	cmp	r1, #0
	bne	.L646
.L657:
	ldr	r0, [r5, #968]
	cmp	r0, #0
	beq	.L648
	ldr	r9, [r5, #768]
	movw	r3, #4888
	ldr	r2, [r5, #804]
	ldr	r3, [r9, r3]
	cmp	r2, r3
	bls	.L648
	cmp	r3, #1
	ble	.L648
	ldr	r2, [r9, #12]
	ldr	r6, [r9, #16]
	adds	r2, r2, #31
	adds	r6, r6, #31
	bic	r3, r6, #31
	bic	r6, r2, #31
	muls	r6, r3, r6
	ldr	r3, [r5, #972]
	it	mi
	addwmi	r6, r6, #1023
	str	r3, [sp, #16]
	movw	r3, #4900
	ldr	r3, [r9, r3]
	asrs	r6, r6, #10
	str	r3, [sp, #20]
	ldr	r3, [r5, #68]
	ldrb	r3, [r3, #914]	@ zero_extendqisi2
	lsls	r7, r3, #29
	bmi	.L659
	ldr	r1, .L888+8
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r8, .L888+12
	ldr	ip, .L888+16
	ldr	r3, [sp, #16]
	subs	r2, r3, #1
.L660:
	ldr	r3, [sp, #8]
	cmp	r6, r3
	beq	.L648
	ldr	r3, [sp, #8]
	lsls	r1, r3, #2
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	add	lr, r0, r1
	tst	r3, #127
	ldrb	r3, [lr, #3]	@ zero_extendqisi2
	itet	eq
	ldreq	r7, [sp, #20]
	bfcne	r3, #0, #4
	bfieq	r3, r7, #0, #4
	strb	r3, [lr, #3]
	ldrsb	r3, [r2, #1]!
	cmp	r3, #0
	itttt	ge
	ldrge	r3, [r0, r1]
	andge	r3, r3, r8
	orrge	r3, r3, ip
	strge	r3, [r0, r1]
	ldr	r3, [sp, #8]
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L660
.L646:
	movw	r3, #4892
	subs	r0, r0, #1
	ldr	r9, [r10, r3]
	movw	r3, #4888
	ldr	r1, [r10, r3]
	adds	r6, r6, #31
	bic	r6, r6, #31
	cmp	r1, #7
	it	ge
	movge	r1, #7
	bl	__aeabi_idivmod
	movs	r3, #1
	ldr	ip, [r5, #972]
	mov	r0, r7
	lsl	r1, r3, r1
	add	r3, r8, #31
	bic	r3, r3, #31
	muls	r6, r3, r6
	sxtb	r1, r1
	it	mi
	addwmi	r6, r6, #1023
	mvn	lr, r1
	asrs	r3, r6, #10
	str	r3, [sp, #16]
	mov	r3, ip
.L650:
	ldr	r6, [sp, #16]
	sub	r2, r3, ip
	cmp	r6, r2
	bls	.L657
	ldrb	r10, [r0]	@ zero_extendqisi2
	ldrb	r8, [r0, #1]	@ zero_extendqisi2
	ldrb	r7, [r0, #2]	@ zero_extendqisi2
	lsl	r10, r10, #2
	ldrb	r6, [r0, #3]	@ zero_extendqisi2
	and	r10, r10, #252
	lsl	r8, r8, #2
	cmp	r9, r10
	lsl	r7, r7, #2
	lsl	r6, r6, #2
	and	r8, r8, #252
	and	r7, r7, #252
	and	r6, r6, #252
	ldrsb	r2, [r3]
	blt	.L651
	cmp	r9, r8
	blt	.L651
	cmp	r9, r7
	blt	.L651
	cmp	r9, r6
	bge	.L652
.L651:
	orrs	r2, r2, r1
.L862:
	cmp	r10, #8
	strb	r2, [r3]
	ldrb	r2, [r3]	@ zero_extendqisi2
	bhi	.L654
	cmp	r8, #8
	bhi	.L654
	cmp	r7, #8
	bhi	.L654
	cmp	r6, #8
	bhi	.L654
	and	r2, r2, #127
.L863:
	strb	r2, [r3]
	adds	r0, r0, #4
	adds	r3, r3, #1
	b	.L650
.L652:
	and	r2, lr, r2
	b	.L862
.L654:
	orn	r2, r2, #127
	b	.L863
.L659:
	asrs	r3, r2, #5
	str	r3, [sp, #8]
	add	r3, r9, #4896
	ldr	r1, .L888+8
	mov	r8, #0
	ldr	r3, [r3]
	str	r3, [sp, #28]
	bl	mpp_buffer_get_ptr_with_caller
	movs	r2, #166
	mov	r10, r0
.L665:
	cmp	r6, r8
	beq	.L648
	ldr	r3, [sp, #16]
	ldr	r1, [r9, #12]
	ldrb	r3, [r3, r8]	@ zero_extendqisi2
	lsls	r0, r1, #27
	and	r7, r3, #127
	beq	.L666
	ldr	r1, [sp, #8]
	add	r0, r8, #1
	str	r3, [sp, #32]
	bl	__aeabi_uidivmod
	movs	r2, #166
	ldr	r3, [sp, #32]
	cbz	r1, .L667
.L666:
	ldr	r1, [r9, #16]
	lsls	r1, r1, #27
	beq	.L668
	ldr	r1, [sp, #8]
	subs	r1, r6, r1
	cmp	r1, r8
	bhi	.L668
.L667:
	cmp	r7, #0
	beq	.L713
	movs	r1, #0
.L865:
	mov	r7, r1
.L669:
	add	r3, r10, r8, lsl #4
	and	r1, r1, #15
	add	r8, r8, #1
	ldrb	r0, [r3, #3]	@ zero_extendqisi2
	bfi	r0, r7, #0, #4
	strb	r0, [r3, #3]
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	bfi	r0, r1, #4, #4
	strb	r0, [r3, #1]
	ldrb	r0, [r3, #5]	@ zero_extendqisi2
	bfi	r0, r1, #4, #4
	strb	r0, [r3, #5]
	ldrb	r0, [r3, #9]	@ zero_extendqisi2
	bfi	r0, r1, #4, #4
	strb	r0, [r3, #9]
	ldrb	r0, [r3, #13]	@ zero_extendqisi2
	bfi	r0, r1, #4, #4
	strb	r0, [r3, #13]
	b	.L665
.L889:
	.align	2
.L888:
	.word	.LANCHOR0
	.word	.LANCHOR0+1070
	.word	.LANCHOR0+1096
	.word	-251658496
	.word	67109030
.L668:
	cbnz	r7, .L714
	ldr	r1, [sp, #28]
	ldr	r7, [sp, #20]
.L670:
	lsls	r3, r3, #24
	bmi	.L669
	lsl	r3, r8, #4
	add	r1, r10, r3
	strb	r2, [r10, r3]
	ldr	r3, [r1, #4]
	strb	r2, [r1, #8]
	bic	r3, r3, #-16777216
	strb	r2, [r1, #12]
	bic	r3, r3, #255
	orr	r3, r3, #-1509949440
	orr	r3, r3, #166
	str	r3, [r1, #4]
	movs	r1, #4
	b	.L865
.L714:
	movs	r1, #0
	mov	r7, r1
	b	.L670
.L713:
	ldr	r1, [sp, #28]
	b	.L669
.L677:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	movs	r6, #0
	movs	r2, #164
	str	r6, [r4, #128]
	orr	r3, r3, #4
	strb	r3, [r4, #244]
	ldr	r1, [r5, #772]
	ldr	r0, [r5, #64]
	bl	mpp_dev_get_iova_address
	ldrb	r3, [r4, #340]	@ zero_extendqisi2
	bfi	r3, r6, #0, #1
	strb	r3, [r4, #340]
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	and	r3, r3, #63
	orn	r3, r3, #127
	strb	r3, [r4, #247]
	str	r0, [r4, #132]
	b	.L676
.L625:
	cmp	r1, #0
	beq	.L639
	b	.L627
.L698:
	movs	r1, #1
	b	.L586
	.fnend
	.size	hal_h265e_v500_gen_regs, .-hal_h265e_v500_gen_regs
	.set	thre_madp_mov_cover1.37461,thre_madp_mov_cover0.37460
	.set	thre_madp_stc_cover1.37459,thre_madp_stc_cover0.37458
	.set	flag_cover_intra_wgt1.37468,flag_cover_intra_wgt0.37467
	.set	b16_intra_wgt2.37427,b32_intra_wgt2.37421
	.set	b16_intra_wgt1.37426,b32_intra_wgt1.37420
	.set	b16_intra_wgt0.37425,b32_intra_wgt0.37419
	.set	b16_intra_thd2.37424,b32_intra_thd2.37418
	.set	b16_intra_thd1.37423,b32_intra_thd1.37417
	.set	b16_intra_thd0.37422,b32_intra_thd0.37416
	.set	b16_skip_wgt3.37415,b32_skip_wgt3.37411
	.set	b16_skip_wgt0.37414,b32_skip_wgt0.37410
	.set	b16_skip_thd2.37412,b32_skip_thd2.37408
	.global	hal_h265e_vepu500
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37148, %object
	.size	__func__.37148, 22
__func__.37148:
	.ascii	"hal_h265e_v500_deinit\000"
	.type	__FUNCTION__.37149, %object
	.size	__FUNCTION__.37149, 22
__FUNCTION__.37149:
	.ascii	"hal_h265e_v500_deinit\000"
	.type	__func__.37157, %object
	.size	__func__.37157, 20
__func__.37157:
	.ascii	"hal_h265e_v500_init\000"
	.type	__FUNCTION__.37158, %object
	.size	__FUNCTION__.37158, 20
__FUNCTION__.37158:
	.ascii	"hal_h265e_v500_init\000"
	.type	__func__.37703, %object
	.size	__func__.37703, 26
__func__.37703:
	.ascii	"vepu500_h265_set_feedback\000"
	.type	__func__.37789, %object
	.size	__func__.37789, 29
__func__.37789:
	.ascii	"hal_h265e_v500_ret_comb_task\000"
	.type	__func__.37690, %object
	.size	__func__.37690, 21
__func__.37690:
	.ascii	"hal_h265e_v500_start\000"
	.type	__func__.37736, %object
	.size	__func__.37736, 20
__func__.37736:
	.ascii	"hal_h265e_v500_wait\000"
	.type	__func__.37743, %object
	.size	__func__.37743, 24
__func__.37743:
	.ascii	"hal_h265e_v500_get_task\000"
	.type	__func__.37117, %object
	.size	__func__.37117, 28
__func__.37117:
	.ascii	"vepu500_h265_setup_hal_bufs\000"
	.type	__FUNCTION__.37134, %object
	.size	__FUNCTION__.37134, 28
__FUNCTION__.37134:
	.ascii	"vepu500_h265_setup_hal_bufs\000"
	.type	__FUNCTION__.37098, %object
	.size	__FUNCTION__.37098, 13
__FUNCTION__.37098:
	.ascii	"get_wrap_buf\000"
	.type	__func__.37777, %object
	.size	__func__.37777, 26
__func__.37777:
	.ascii	"hal_h265e_v500_comb_start\000"
	.type	__func__.37166, %object
	.size	__func__.37166, 26
__func__.37166:
	.ascii	"hal_h265e_vepu500_prepare\000"
	.type	__func__.37768, %object
	.size	__func__.37768, 24
__func__.37768:
	.ascii	"hal_h265e_v500_ret_task\000"
	.type	__func__.37728, %object
	.size	__func__.37728, 31
__func__.37728:
	.ascii	"vepu500_h265e_update_tune_stat\000"
	.type	__func__.37330, %object
	.size	__func__.37330, 28
__func__.37330:
	.ascii	"vepu500_h265_set_hw_address\000"
	.type	__func__.37192, %object
	.size	__func__.37192, 24
__func__.37192:
	.ascii	"vepu500_h265_uv_address\000"
	.type	__func__.37308, %object
	.size	__func__.37308, 21
__func__.37308:
	.ascii	"setup_recn_refr_wrap\000"
	.space	3
	.type	ref_type_map, %object
	.size	ref_type_map, 16
ref_type_map:
	.word	0
	.word	1
	.word	2
	.word	3
	.type	__FUNCTION__.37332, %object
	.size	__FUNCTION__.37332, 28
__FUNCTION__.37332:
	.ascii	"vepu500_h265_set_hw_address\000"
	.type	__func__.37680, %object
	.size	__func__.37680, 24
__func__.37680:
	.ascii	"hal_h265e_v500_gen_regs\000"
	.type	__func__.37365, %object
	.size	__func__.37365, 23
__func__.37365:
	.ascii	"vepu500_h265_set_split\000"
	.space	1
	.type	b32_skip_thd2.37408, %object
	.size	b32_skip_thd2.37408, 8
b32_skip_thd2.37408:
	.short	15
	.short	15
	.short	15
	.short	200
	.type	b32_skip_thd3.37409, %object
	.size	b32_skip_thd3.37409, 8
b32_skip_thd3.37409:
	.short	72
	.short	72
	.short	72
	.short	1000
	.type	b32_skip_wgt0.37410, %object
	.size	b32_skip_wgt0.37410, 4
b32_skip_wgt0.37410:
	.byte	16
	.byte	20
	.byte	20
	.byte	16
	.type	b32_skip_wgt3.37411, %object
	.size	b32_skip_wgt3.37411, 4
b32_skip_wgt3.37411:
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.type	b32_intra_thd0.37416, %object
	.size	b32_intra_thd0.37416, 8
b32_intra_thd0.37416:
	.short	20
	.short	20
	.short	20
	.short	24
	.type	b32_intra_thd1.37417, %object
	.size	b32_intra_thd1.37417, 8
b32_intra_thd1.37417:
	.short	40
	.short	40
	.short	40
	.short	48
	.type	b32_intra_thd2.37418, %object
	.size	b32_intra_thd2.37418, 8
b32_intra_thd2.37418:
	.short	60
	.short	72
	.short	72
	.short	96
	.type	b32_intra_wgt0.37419, %object
	.size	b32_intra_wgt0.37419, 4
b32_intra_wgt0.37419:
	.byte	16
	.byte	22
	.byte	27
	.byte	28
	.type	b32_intra_wgt1.37420, %object
	.size	b32_intra_wgt1.37420, 4
b32_intra_wgt1.37420:
	.byte	16
	.byte	20
	.byte	25
	.byte	26
	.type	b32_intra_wgt2.37421, %object
	.size	b32_intra_wgt2.37421, 4
b32_intra_wgt2.37421:
	.byte	16
	.byte	18
	.byte	20
	.byte	24
	.type	b16_skip_thd3.37413, %object
	.size	b16_skip_thd3.37413, 8
b16_skip_thd3.37413:
	.short	25
	.short	25
	.short	25
	.short	1000
	.type	flag_cover_thd0.37462, %object
	.size	flag_cover_thd0.37462, 8
flag_cover_thd0.37462:
	.byte	12
	.byte	13
	.byte	13
	.byte	13
	.byte	12
	.byte	13
	.byte	13
	.byte	17
	.type	flag_cover_thd1.37463, %object
	.size	flag_cover_thd1.37463, 8
flag_cover_thd1.37463:
	.byte	61
	.byte	70
	.byte	70
	.byte	70
	.byte	61
	.byte	70
	.byte	70
	.byte	90
	.type	flag_bndry_thd0.37464, %object
	.size	flag_bndry_thd0.37464, 8
flag_bndry_thd0.37464:
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.byte	12
	.type	flag_bndry_thd1.37465, %object
	.size	flag_bndry_thd1.37465, 8
flag_bndry_thd1.37465:
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.type	common_intra_r_dep0.37454, %object
	.size	common_intra_r_dep0.37454, 8
common_intra_r_dep0.37454:
	.byte	-32
	.byte	-32
	.byte	-56
	.byte	-56
	.byte	-32
	.byte	-32
	.byte	-56
	.byte	-56
	.type	flag_cover_intra_wgt0.37467, %object
	.size	flag_cover_intra_wgt0.37467, 3
flag_cover_intra_wgt0.37467:
	.byte	-12
	.byte	0
	.byte	12
	.type	common_intra_r_dep1.37455, %object
	.size	common_intra_r_dep1.37455, 8
common_intra_r_dep1.37455:
	.byte	-32
	.byte	-32
	.byte	-76
	.byte	-56
	.byte	-32
	.byte	-32
	.byte	-76
	.byte	-56
	.type	smear_strength.37453, %object
	.size	smear_strength.37453, 8
smear_strength.37453:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.type	flag_bndry_wgt.37469, %object
	.size	flag_bndry_wgt.37469, 3
flag_bndry_wgt.37469:
	.space	3
	.type	thre_madp_stc_cover0.37458, %object
	.size	thre_madp_stc_cover0.37458, 8
thre_madp_stc_cover0.37458:
	.byte	20
	.byte	22
	.byte	22
	.byte	22
	.byte	20
	.byte	22
	.byte	22
	.byte	30
	.type	thre_madp_mov_cover0.37460, %object
	.size	thre_madp_mov_cover0.37460, 8
thre_madp_mov_cover0.37460:
	.byte	10
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	9
	.byte	9
	.byte	6
	.type	qp_strength.37452, %object
	.size	qp_strength.37452, 8
qp_strength.37452:
	.byte	4
	.byte	6
	.byte	7
	.byte	7
	.byte	3
	.byte	5
	.byte	7
	.byte	7
	.type	flag_cover_wgt.37466, %object
	.size	flag_cover_wgt.37466, 3
flag_cover_wgt.37466:
	.byte	1
	.byte	0
	.byte	-3
	.type	__func__.37636, %object
	.size	__func__.37636, 30
__func__.37636:
	.ascii	"vepu500_h265_set_scaling_list\000"
	.type	vepu500_h265_cqm_intra8, %object
	.size	vepu500_h265_cqm_intra8, 64
vepu500_h265_cqm_intra8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	21
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	19
	.byte	22
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	22
	.byte	25
	.byte	29
	.byte	16
	.byte	16
	.byte	18
	.byte	21
	.byte	24
	.byte	27
	.byte	31
	.byte	36
	.byte	17
	.byte	17
	.byte	20
	.byte	24
	.byte	30
	.byte	35
	.byte	41
	.byte	47
	.byte	18
	.byte	19
	.byte	22
	.byte	27
	.byte	35
	.byte	44
	.byte	54
	.byte	65
	.byte	21
	.byte	22
	.byte	25
	.byte	31
	.byte	41
	.byte	54
	.byte	70
	.byte	88
	.byte	24
	.byte	25
	.byte	29
	.byte	36
	.byte	47
	.byte	65
	.byte	88
	.byte	115
	.type	vepu500_h265_cqm_inter8, %object
	.size	vepu500_h265_cqm_inter8, 64
vepu500_h265_cqm_inter8:
	.byte	16
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	16
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	17
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	18
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	20
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	24
	.byte	25
	.byte	28
	.byte	33
	.byte	41
	.byte	54
	.byte	71
	.byte	91
	.type	__FUNCTION__.37660, %object
	.size	__FUNCTION__.37660, 33
__FUNCTION__.37660:
	.ascii	"hal_h265e_vepu500_init_qpmap_buf\000"
	.type	__func__.37626, %object
	.size	__func__.37626, 24
__func__.37626:
	.ascii	"vepu500_h265_tune_qpmap\000"
	.type	__FUNCTION__.37627, %object
	.size	__FUNCTION__.37627, 24
__FUNCTION__.37627:
	.ascii	"vepu500_h265_tune_qpmap\000"
	.type	__FUNCTION__.37584, %object
	.size	__FUNCTION__.37584, 30
__FUNCTION__.37584:
	.ascii	"vepu500_h265_tune_qpmap_smart\000"
	.type	__func__.37592, %object
	.size	__func__.37592, 30
__func__.37592:
	.ascii	"vepu500_h265_tune_qpmap_smart\000"
	.type	qpmap_dqp, %object
	.size	qpmap_dqp, 4
qpmap_dqp:
	.byte	3
	.byte	2
	.byte	1
	.byte	0
	.type	__FUNCTION__.37531, %object
	.size	__FUNCTION__.37531, 31
__FUNCTION__.37531:
	.ascii	"vepu500_h265_tune_qpmap_normal\000"
	.type	__func__.37542, %object
	.size	__func__.37542, 31
__func__.37542:
	.ascii	"vepu500_h265_tune_qpmap_normal\000"
	.type	__FUNCTION__.37479, %object
	.size	__FUNCTION__.37479, 26
__FUNCTION__.37479:
	.ascii	"vepu500_h265_tune_md_info\000"
	.type	__FUNCTION__.37507, %object
	.size	__FUNCTION__.37507, 28
__FUNCTION__.37507:
	.ascii	"vepu500_h265_tune_qpmap_mdc\000"
	.type	lambda_tbl_pre_inter, %object
	.size	lambda_tbl_pre_inter, 208
lambda_tbl_pre_inter:
	.word	579
	.word	649
	.word	730
	.word	819
	.word	919
	.word	1032
	.word	1159
	.word	1300
	.word	1461
	.word	1639
	.word	1993
	.word	2237
	.word	2898
	.word	3253
	.word	3652
	.word	4098
	.word	4601
	.word	5165
	.word	5411
	.word	6074
	.word	6818
	.word	6559
	.word	7362
	.word	8265
	.word	9276
	.word	13016
	.word	11688
	.word	13119
	.word	14725
	.word	16530
	.word	18553
	.word	26032
	.word	25324
	.word	34986
	.word	31906
	.word	44080
	.word	40200
	.word	45123
	.word	50649
	.word	61225
	.word	68724
	.word	77140
	.word	74217
	.word	83305
	.word	101300
	.word	113706
	.word	127630
	.word	132240
	.word	148435
	.word	166612
	.word	187017
	.word	209919
	.type	__FUNCTION__.37391, %object
	.size	__FUNCTION__.37391, 31
__FUNCTION__.37391:
	.ascii	"vepu500_h265e_save_pass1_patch\000"
	.space	1
	.type	hal_h265e_vepu500, %object
	.size	hal_h265e_vepu500, 64
hal_h265e_vepu500:
	.word	.LC25
	.word	16777220
	.word	984
	.word	0
	.word	hal_h265e_v500_init
	.word	hal_h265e_v500_deinit
	.word	hal_h265e_vepu500_prepare
	.word	hal_h265e_v500_get_task
	.word	hal_h265e_v500_gen_regs
	.word	hal_h265e_v500_start
	.word	hal_h265e_v500_wait
	.word	0
	.word	0
	.word	hal_h265e_v500_ret_task
	.word	hal_h265e_v500_comb_start
	.word	hal_h265e_v500_ret_comb_task
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	aq_qp_delta_smt_I, %object
	.size	aq_qp_delta_smt_I, 64
aq_qp_delta_smt_I:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	1
	.word	2
	.word	3
	.word	5
	.word	7
	.word	8
	.word	9
	.word	9
	.type	aq_qp_delta_smt_P, %object
	.size	aq_qp_delta_smt_P, 64
aq_qp_delta_smt_P:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	1
	.word	2
	.word	3
	.word	4
	.word	6
	.word	7
	.word	9
	.word	9
	.type	aq_thd_smt_I, %object
	.size	aq_thd_smt_I, 64
aq_thd_smt_I:
	.word	1
	.word	2
	.word	3
	.word	3
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	13
	.word	15
	.word	20
	.word	25
	.word	25
	.word	25
	.type	aq_thd_smt_P, %object
	.size	aq_thd_smt_P, 64
aq_thd_smt_P:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	15
	.word	15
	.word	20
	.word	25
	.word	25
	.word	25
	.type	aq_rnge_smt, %object
	.size	aq_rnge_smt, 40
aq_rnge_smt:
	.word	8
	.word	8
	.word	12
	.word	12
	.word	12
	.word	8
	.word	8
	.word	12
	.word	12
	.word	12
	.type	aq_qp_delta_default, %object
	.size	aq_qp_delta_default, 64
aq_qp_delta_default:
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.type	aq_thd_default, %object
	.size	aq_thd_default, 64
aq_thd_default:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	3
	.word	3
	.word	5
	.word	5
	.word	8
	.word	8
	.word	15
	.word	15
	.word	20
	.word	25
	.word	25
	.word	25
	.type	aq_rnge_default, %object
	.size	aq_rnge_default, 40
aq_rnge_default:
	.word	5
	.word	5
	.word	10
	.word	12
	.word	12
	.word	5
	.word	5
	.word	10
	.word	12
	.word	12
	.type	rdo_lambda_table_I, %object
	.size	rdo_lambda_table_I, 240
rdo_lambda_table_I:
	.word	18
	.word	23
	.word	29
	.word	36
	.word	46
	.word	58
	.word	73
	.word	92
	.word	116
	.word	146
	.word	184
	.word	232
	.word	292
	.word	368
	.word	463
	.word	584
	.word	735
	.word	927
	.word	1167
	.word	1471
	.word	1853
	.word	2335
	.word	2942
	.word	3706
	.word	4669
	.word	5883
	.word	7412
	.word	9339
	.word	11766
	.word	14825
	.word	18678
	.word	23533
	.word	29649
	.word	37356
	.word	47065
	.word	59298
	.word	74711
	.word	94130
	.word	118596
	.word	149422
	.word	188260
	.word	237193
	.word	298844
	.word	376520
	.word	474386
	.word	597688
	.word	753040
	.word	948771
	.word	1195377
	.word	1506080
	.word	1897542
	.word	2390753
	.word	3012160
	.word	3795084
	.word	4781507
	.word	6024321
	.word	7590169
	.word	9563013
	.word	12048642
	.word	15180338
	.type	rdo_lambda_table_P, %object
	.size	rdo_lambda_table_P, 240
rdo_lambda_table_P:
	.word	44
	.word	56
	.word	68
	.word	88
	.word	112
	.word	137
	.word	176
	.word	224
	.word	274
	.word	352
	.word	448
	.word	548
	.word	704
	.word	896
	.word	1096
	.word	1408
	.word	1792
	.word	2192
	.word	2816
	.word	3584
	.word	4384
	.word	5632
	.word	7168
	.word	8768
	.word	11264
	.word	14336
	.word	17536
	.word	22528
	.word	28672
	.word	35072
	.word	45056
	.word	57344
	.word	70144
	.word	90112
	.word	114688
	.word	140288
	.word	180224
	.word	229376
	.word	280576
	.word	360448
	.word	458752
	.word	561152
	.word	720896
	.word	917504
	.word	1122304
	.word	1441792
	.word	1835008
	.word	2244608
	.word	2883584
	.word	3670016
	.word	4489216
	.word	5767168
	.word	7340032
	.word	8978432
	.word	11534336
	.word	14680064
	.word	17956864
	.word	23068672
	.word	29360128
	.word	35913728
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016%s:%d: (%d) enter\012\000"
.LC1:
	.ascii	"\0016%s:%d: (%d) leave\012\000"
.LC2:
	.ascii	"\0013%s:%d: mpp_dev_init failed. ret: %d\012\000"
.LC3:
	.ascii	"\0016%s:%d: hw_status: 0x%08x\000"
.LC4:
	.ascii	"\0016%s:%d: bit stream overflow\000"
.LC5:
	.ascii	"\0016%s:%d: enc err\012\000"
.LC6:
	.ascii	"\0016%s:%d: wrap frame error\012\000"
.LC7:
	.ascii	"\0016%s:%d: wdg timeout\000"
.LC8:
	.ascii	"\0016%s:%d: output stream size %d\012\000"
.LC9:
	.ascii	"\0013%s:%d: enc_task->flags.err %08x, return early\000"
.LC10:
	.ascii	"hw_regs->reg_ctl\000"
.LC11:
	.ascii	"\0013%s:%d: set %s reg write failed %d\012\000"
.LC12:
	.ascii	"hw_regs->reg_frm\000"
.LC13:
	.ascii	"hw_regs->reg_rc_roi\000"
.LC14:
	.ascii	"hw_regs->reg_param\000"
.LC15:
	.ascii	"hw_regs->reg_sqi\000"
.LC16:
	.ascii	"hw_regs->reg_scl_jpgtbl\000"
.LC17:
	.ascii	"hw_regs->reg_osd\000"
.LC18:
	.ascii	"reg_out->hw_status\000"
.LC19:
	.ascii	"\0013%s:%d: set %s reg read failed %d\012\000"
.LC20:
	.ascii	"reg_out->st\000"
.LC21:
	.ascii	"\0013%s:%d: send cmd failed %d\012\000"
.LC22:
	.ascii	"\0013%s:%d: invalid src color space: %d\012\000"
.LC23:
	.ascii	"\0013%s:%d: vepu541_h265_allocate_buffers failed, f"
	.ascii	"ree buffers and return\012\000"
.LC24:
	.ascii	"\0016%s:%d: frame size %d -> %d max count %d -> %d\012"
	.ascii	"\000"
.LC25:
	.ascii	"hal_h265e_v500\000"
.LC26:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC27:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC28:
	.ascii	"\0016%s:%d: frame %d complex_level %d motion_level "
	.ascii	"%d\012\000"
.LC29:
	.ascii	"\0016%s:%d: frame %d bit_real %d quality_real %d ma"
	.ascii	"di %d madp %d\012\000"
.LC30:
	.ascii	"\0013%s:%d: unknown color space: %d\012\000"
.LC31:
	.ascii	"\0016%s:%d: cur is idr  lt %d\012\000"
.LC32:
	.ascii	"\0016%s:%d: ref type %d\012\000"
.LC33:
	.ascii	"\0013%d: WARNING: not support lt ref to st when buf"
	.ascii	" is wrap\000"
.LC34:
	.ascii	"\0013%d: WARNING: not support lt ref to lt when buf"
	.ascii	" is wrap\000"
.LC35:
	.ascii	"\0016%s:%d: cur_is_ref %d\012\000"
.LC36:
	.ascii	"\0016%s:%d: hdr[size %d top %d bot %d cur %d pre %d"
	.ascii	"]\012\000"
.LC37:
	.ascii	"\0016%s:%d: bdy [size %d top %d bot %d cur %d pre %"
	.ascii	"d]\012\000"
.LC38:
	.ascii	"ptr\000"
.LC39:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC40:
	.ascii	"dma\000"
.LC41:
	.ascii	"\0016%s:%d: frame %d | type %d | start gen regs\000"
.LC42:
	.ascii	"\0016%s:%d: enter\012\000"
.LC43:
	.ascii	"\0016%s:%d: invalide slice split mode %d\012\000"
.LC44:
	.ascii	"\0016%s:%d: leave\012\000"
.LC45:
	.ascii	"\0016%s:%d: scaling_list_mode 2 is not supported ye"
	.ascii	"t\012\000"
.LC46:
	.ascii	"ctx->mv_info\000"
.LC47:
	.ascii	"ctx->qpmap\000"
.LC48:
	.ascii	"ctx->mv_flag_info\000"
.LC49:
	.ascii	"ctx->mv_flag\000"
.LC50:
	.ascii	"\0013%d: buf_pass1 malloc fail, debreath invaild\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
