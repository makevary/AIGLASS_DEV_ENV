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
	.file	"rc_model_v2_smt.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_clip, %function
mpp_clip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r1, r2
	bgt	.L2
	cmp	r1, r0
	bgt	.L3
	cmp	r2, r0
	it	ge
	movge	r2, r0
.L2:
	mov	r0, r2
	bx	lr
.L3:
	mov	r2, r1
	b	.L2
	.fnend
	.size	mpp_clip, .-mpp_clip
	.align	1
	.global	rc_model_v2_smt_hal_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_start, %function
rc_model_v2_smt_hal_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	movs	r3, #0
	str	r3, [r0, #620]
	ldr	r0, [r1, #172]
	mov	r4, r1
	ldr	r3, [r5, #632]
	ldrd	r2, r1, [r1, #176]
	add	r0, r0, r3
	ldr	r6, .L13
	bl	mpp_clip
	ldr	r2, [r6]
	lsls	r2, r2, #25
	str	r0, [r4, #172]
	str	r0, [r5, #584]
	bpl	.L5
	ldr	r3, [r5, #632]
	mov	r2, #1152
	ldr	r1, .L13+4
	str	r3, [sp, #8]
	ldr	r3, [r4, #176]
	strd	r0, r3, [sp]
	ldr	r3, [r4, #180]
	ldr	r0, .L13+8
	bl	printk
.L5:
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L6
	str	r4, [sp]
	mov	r3, r5
	movw	r2, #1153
	ldr	r1, .L13+4
	ldr	r0, .L13+12
	bl	printk
.L6:
	movs	r0, #0
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L14:
	.align	2
.L13:
	.word	rc_debug
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC2
	.fnend
	.size	rc_model_v2_smt_hal_start, .-rc_model_v2_smt_hal_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_coef, %function
set_coef:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	mov	r5, r1
	ldr	r0, [r0, #352]
	movs	r1, #0
	mov	r4, r2
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r6, r0
	ldr	r0, [r7, #352]
	bl	mpp_data_get_pre_val_v2
	mov	r8, r0
	ldr	r0, [r7, #352]
	bl	mpp_data_sum_v2
	cbnz	r0, .L16
.L39:
	str	r4, [r5]
	pop	{r4, r5, r6, r7, r8, pc}
.L16:
	cmp	r0, #1
	bne	.L18
	cbnz	r6, .L19
	adds	r4, r4, #10
	b	.L39
.L19:
	adds	r4, r4, #25
	b	.L39
.L18:
	cmp	r0, #2
	bne	.L20
	cmp	r6, #0
	beq	.L19
.L22:
	adds	r4, r4, #35
	b	.L39
.L20:
	cmp	r0, #3
	bne	.L21
	cmp	r6, #0
	beq	.L22
.L25:
	adds	r4, r4, #51
	b	.L39
.L21:
	subs	r3, r0, #4
	cmp	r3, #2
	bhi	.L23
	cbnz	r6, .L24
	cmp	r8, #0
	beq	.L22
	b	.L25
.L24:
	adds	r4, r4, #64
	b	.L39
.L23:
	subs	r0, r0, #7
	cmp	r0, #2
	bhi	.L26
	orrs	r3, r6, r8
	beq	.L24
	adds	r4, r4, #72
	b	.L39
.L26:
	adds	r4, r4, #80
	b	.L39
	.fnend
	.size	set_coef, .-set_coef
	.global	__aeabi_idiv
	.global	__aeabi_uidiv
	.align	1
	.global	rc_model_v2_smt_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_start, %function
rc_model_v2_smt_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #84
	sub	sp, sp, #84
	ldr	r3, [r0, #48]
	mov	r4, r0
	ldr	r6, [r0, #588]
	mov	r7, r1
	ldr	fp, [r0, #128]
	str	r3, [sp, #32]
	ldr	r3, [r0, #56]
	str	r3, [sp, #36]
	ldr	r3, [r0, #28]
	str	r3, [sp, #28]
	ldr	r3, [r0, #32]
	str	r3, [sp, #40]
	ldr	r3, [r0, #124]
	str	r3, [sp, #16]
	ldr	r3, [r0, #120]
	str	r3, [sp, #12]
	ldr	r3, [r0, #132]
	ldr	r0, [r0, #348]
	str	r3, [sp, #20]
	bl	mpp_data_sum_v2
	movs	r1, #0
	str	r0, [sp, #44]
	ldr	r0, [r4, #348]
	bl	mpp_data_get_pre_val_v2
	str	r0, [sp, #48]
	ldr	r0, [r4, #352]
	bl	mpp_data_sum_v2
	ldrb	r3, [r7, #156]	@ zero_extendqisi2
	lsls	r1, r3, #29
	str	r0, [sp, #64]
	bmi	.L209
	ldr	r0, [r7, #296]
	bl	mpp_frame_get_ppinfo
	mov	r8, r0
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	ldr	r3, [r4, #48]
	ldr	r10, [r4, #56]
	mov	r5, r0
	str	r3, [sp, #24]
	cmp	r8, #0
	beq	.L43
	ldr	r3, [r8, #8]
	lsls	r2, r3, #31
	bpl	.L43
	ubfx	r2, r3, #4, #9
	asrs	r3, r3, #16
	tst	r3, #254
	uxtb	r1, r3
	bne	.L44
	cmp	r1, #0
	bne	.L157
	movs	r3, #30
	cmp	r2, #0
	bne	.L223
	str	r3, [sp, #12]
	b	.L43
.L44:
	movs	r3, #33
	str	r3, [sp, #12]
	orrs	r3, r2, r1
	beq	.L43
.L45:
	cmp	fp, #37
	it	ge
	movge	fp, #37
.L43:
	ldr	r0, [r4, #348]
	bl	mpp_data_sum_v2
	cbnz	r0, .L47
	ldr	r3, [r4, #256]
	cbz	r3, .L47
	ldr	r3, [r4, #136]
	strd	r3, r3, [sp, #12]
.L47:
	ldr	r3, [r7, #216]
	cmp	r3, #2
	bne	.L48
	ldr	r0, [r4, #352]
	bl	mpp_data_sum_v2
	cmp	r0, #15
	ldr	r3, [sp, #20]
	bgt	.L49
	cmp	r3, #34
	it	ge
	movge	r3, #34
	cmp	fp, #37
	str	r3, [sp, #20]
	it	ge
	movge	fp, #37
.L48:
	ldrb	r3, [r7, #152]	@ zero_extendqisi2
	tst	r3, #16
	ite	ne
	movne	r3, #2
	moveq	r3, #0
	str	r3, [r4, #284]
	ldrb	r2, [r7, #154]	@ zero_extendqisi2
	and	r2, r2, #63
	cmp	r2, #3
	it	eq
	moveq	r3, r2
	str	r3, [r4, #284]
	ldr	r3, [r4, #628]
	cbnz	r3, .L52
	ldr	r2, [r7, #216]
	cmp	r2, #1
	bne	.L53
	ldr	r2, [r7, #220]
	cmp	r2, #2
	bne	.L53
.L52:
	ldr	r2, [r4, #284]
	cmp	r2, #2
	ittte	ne
	addne	r3, r3, #1
	strne	r3, [r4, #628]
	movne	fp, #28
	moveq	r3, #0
	itte	ne
	strne	fp, [sp, #20]
	strdne	fp, fp, [sp, #12]
	streq	r3, [r4, #628]
.L53:
	ldr	r3, [r4, #312]
	cbz	r3, .L55
	cmp	r3, #1
	beq	.L56
	ldr	r3, [r4, #284]
	cmp	r3, #2
	bne	.L60
	add	r8, r4, #360
	mov	r0, r8
	bl	mpp_pid_calc
	ldr	r3, [r4, #364]
	mov	r9, r0
	subs	r3, r3, r0
	mov	r0, r8
	str	r3, [r4, #340]
	bl	mpp_pid_reset
	ldrd	r2, [r4, #320]
	ldr	r8, [r4, #404]
	orrs	r3, r2, r3
	beq	.L61
	ldr	r3, [r4, #412]
	add	r0, r8, r9
	str	r0, [r4, #396]
	add	r3, r3, r9
	b	.L224
.L157:
	movs	r3, #32
.L223:
	str	r3, [sp, #12]
	b	.L45
.L49:
	cmp	r3, #35
	it	ge
	movge	r3, #35
	cmp	fp, #38
	str	r3, [sp, #20]
	it	ge
	movge	fp, #38
	b	.L48
.L55:
	ldr	r3, [r4, #284]
	cmp	r3, #2
	bne	.L58
	ldr	r3, [r4, #404]
	str	r3, [r4, #396]
	ldr	r3, [r4, #412]
.L224:
	str	r3, [r4, #400]
.L59:
	ldr	r3, [r4, #344]
	cbnz	r3, .L66
	cmp	r5, #14
	bgt	.L67
	lsls	r1, r5, #2
.L68:
	ldr	r5, [r4, #428]
	add	r0, r4, #344
	cmp	r1, r5
	it	lt
	movlt	r1, r5
	cmp	r1, #50
	it	ge
	movge	r1, #50
	cmp	r1, #20
	it	lt
	movlt	r1, #20
	bl	mpp_data_init
.L66:
	ldrd	r3, r2, [r4, #396]
	ldr	r1, [sp, #40]
	add	r3, r3, r2
	ldr	r0, [sp, #28]
	cmp	r3, #199
	ite	gt
	asrgt	r3, r3, #1
	movle	r3, #100
	str	r3, [r7, #164]
	bl	__aeabi_idiv
	movs	r3, #1
	mov	r2, r3
	mov	r1, #-1
	ldr	r8, [r7, #164]
	str	r0, [sp, #28]
	ldr	r0, [r4, #344]
	bl	mpp_data_avg
	ldrd	r9, [r4, #296]
	orrs	r3, r9, r10
	str	r0, [sp, #52]
	bne	.L72
	ldr	r0, [r4, #92]
	cmp	r0, #0
	bge	.L73
	ldr	r2, .L239
	ldr	r3, [sp, #28]
	ldr	r1, [sp, #28]
	ldr	r0, [r4]
	smull	r2, r3, r3, r2
	asrs	r1, r1, #31
	adds	r0, r0, #15
	ldr	r5, .L239+4
	rsb	r1, r1, r3, asr #2
	ldr	r3, [r4, #400]
	adds	r1, r1, #1
	cmp	r1, #3
	it	ge
	movge	r1, #3
	cmp	r1, #1
	it	lt
	movlt	r1, #1
	muls	r1, r3, r1
	asrs	r3, r0, #4
	ldr	r0, [r4, #4]
	adds	r0, r0, #15
	asrs	r0, r0, #4
	muls	r0, r3, r0
	movs	r3, #0
.L74:
	adds	r3, r3, #1
	cmp	r3, #8
	beq	.L75
	ldr	r2, [r5, r3, lsl #2]
	cmp	r0, r2
	bcs	.L74
.L75:
	ldr	r5, .L239+8
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #160]
	muls	r0, r3, r0
	sub	r0, r0, #350
	bl	__aeabi_uidiv
	ldr	r2, [r4, #308]
	cmp	r0, #95
	ldr	r3, [sp, #16]
	it	ge
	movge	r0, #95
	cmp	r0, #4
	ite	ge
	addge	r5, r5, r0
	addlt	r5, r5, #4
	cmp	r3, #31
	ldrb	r0, [r5, #64]	@ zero_extendqisi2
	ite	gt
	movgt	r1, r3
	movle	r1, #31
	bl	mpp_clip
.L73:
	str	r0, [r4, #584]
.L72:
	ldrd	r3, r2, [sp, #32]
	add	r3, r3, r2
	add	r0, r3, r3, lsr #31
	asrs	r3, r0, #1
	str	r3, [sp, #24]
	ldr	r3, [r4, #284]
	cmp	r3, #2
	bne	.L78
	cmp	r9, #1
	sbcs	r3, r10, #0
	blt	.L80
	ldrd	r1, r2, [r4, #304]
	ldr	r0, [sp, #52]
	bl	mpp_clip
	ldrd	r3, r5, [r4, #592]
	cmp	r3, r8
	str	r0, [sp, #32]
	blt	.L81
	add	r2, r8, r8, lsl #2
	cmp	r3, r2
	ble	.L82
	add	r8, r5, #3
.L83:
	ldr	r3, [r4, #612]
	cmp	r3, #0
	bne	.L88
	ldr	r3, [r4, #204]
	cmp	r3, #0
	beq	.L88
	ldrd	r10, r3, [r4, #600]
	str	r3, [sp, #36]
	ldr	r3, [r4, #608]
	asr	r9, r3, #5
	ldr	r3, .L239+12
	cmp	r9, #7
	ldr	r3, [r3]
	it	ge
	movge	r9, #7
	lsls	r3, r3, #31
	bpl	.L90
	mov	r3, r4
	mov	r2, #464
	ldr	r1, .L239+16
	ldr	r0, .L239+20
	bl	printk
.L90:
	mov	r0, r10
	ldr	r1, [sp, #36]
	bl	__aeabi_idiv
	ldr	r3, .L239+12
	ldr	r3, [r3]
	cmp	r0, #35
	it	ge
	movge	r0, #35
	mov	r10, r0
	lsls	r0, r3, #24
	bpl	.L91
	ldr	r3, [r4, #608]
	movw	r2, #469
	ldr	r1, .L239+16
	ldr	r0, .L239+24
	strd	r10, r3, [sp]
	ldr	r3, [r4, #584]
	bl	printk
.L91:
	ldr	r2, .L239+8
	ldr	r3, [r4, #208]
	uxtab	r9, r2, r9
	add	r3, r3, r2
	ldrsb	r2, [r9, #253]
	ldrsb	r3, [r3, #217]
	subs	r1, r3, r2
	cmp	r10, r1
	itt	gt
	subgt	r10, r10, r3
	addgt	r10, r10, r2
	ldrd	r2, r1, [r4, #104]
	mov	r0, r10
	bl	mpp_clip
	movs	r3, #0
	strd	r3, r3, [r4, #600]
	ldr	r3, .L239+12
	ldr	r3, [r3]
	lsls	r1, r3, #31
	str	r0, [r4, #584]
	bpl	.L88
	mov	r3, r4
	mov	r2, #480
	ldr	r1, .L239+16
	ldr	r0, .L239+28
	bl	printk
.L88:
	ldr	r3, .L239+8
	mov	r0, r8
	ldr	r2, [sp, #32]
	add	r2, r2, r3
	mov	r1, r2
	ldrb	r2, [r2, #261]	@ zero_extendqisi2
	ldrb	r1, [r1, #313]	@ zero_extendqisi2
	bl	mpp_clip
	add	r6, r6, r3
	ldrb	r2, [r6, #261]	@ zero_extendqisi2
	ldrb	r1, [r6, #313]	@ zero_extendqisi2
	bl	mpp_clip
	add	r5, r5, r3
	cmp	r0, #27
	mov	r1, r0
	ldrb	r2, [r5, #365]	@ zero_extendqisi2
	ble	.L93
	ldrb	r1, [r5, #417]	@ zero_extendqisi2
.L228:
	bl	mpp_clip
	ldr	r6, [r4, #340]
	cmp	r6, #0
	str	r0, [r4, #584]
	bge	.L80
	ldr	r1, [sp, #28]
	ldr	r0, [r4, #428]
	bl	__aeabi_idiv
	ldr	r5, [r4, #584]
	ldr	r3, [sp, #24]
	muls	r3, r0, r3
	mov	r0, r3
	mvn	r3, #4
	muls	r3, r6, r3
	cmp	r3, r0
	ble	.L97
	cmp	r5, #51
	it	ge
	movge	r5, #51
	cmp	r5, #20
	it	lt
	movlt	r5, #20
.L233:
	str	r5, [r4, #584]
.L80:
	ldr	r3, [sp, #44]
	cmp	r3, #700
	bge	.L174
	ldr	r3, [sp, #48]
	cmp	r3, #200
	beq	.L174
	ldr	r3, [sp, #44]
	cmp	r3, #400
	bge	.L175
	ldr	r3, [sp, #48]
	movs	r1, #4
	cmp	r3, #100
	bne	.L176
.L235:
	movs	r3, #5
	b	.L142
.L58:
	ldr	r0, [r4, #576]
	ldr	r8, [r4, #408]
	bl	mpp_data_mean_v2
	sub	r0, r8, r0
	str	r0, [r4, #396]
	ldr	r0, [r4, #580]
	ldr	r8, [r4, #416]
	bl	mpp_data_mean_v2
.L237:
	sub	r0, r8, r0
.L225:
	str	r0, [r4, #400]
	b	.L59
.L56:
	ldr	r8, [r4, #404]
.L61:
	add	r0, r4, #432
	bl	mpp_pid_calc
	sub	r0, r8, r0
	str	r0, [r4, #396]
	add	r0, r4, #468
	ldr	r8, [r4, #412]
	bl	mpp_pid_calc
	b	.L237
.L60:
	ldr	r3, [r4, #288]
	cmp	r3, #2
	bne	.L62
	ldr	r3, [r4, #428]
	ldr	r0, [sp, #24]
	ldr	r2, [r4, #592]
	add	r9, r3, #-1
	ldr	r1, [r4, #340]
	muls	r0, r3, r0
	sub	r8, r1, r2
	mov	r1, r5
	str	r3, [sp, #24]
	bl	__aeabi_idiv
	mov	r1, r9
	add	r0, r0, r8
	bl	__aeabi_idiv
	mov	r1, r5
	ldr	r3, [sp, #24]
	str	r0, [r4, #408]
	str	r0, [r4, #396]
	mul	r0, r3, r10
	bl	__aeabi_idiv
	mov	r1, r9
	add	r0, r0, r8
	bl	__aeabi_idiv
	str	r0, [r4, #416]
	b	.L225
.L62:
	ldr	r0, [r4, #576]
	bl	mpp_data_mean_v2
	str	r0, [sp, #52]
	ldr	r0, [r4, #580]
	bl	mpp_data_mean_v2
	ldrd	r2, r1, [r4, #28]
	mov	r8, r0
	ldr	r0, [sp, #24]
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r9, r0
	mov	r0, r10
	bl	axb_div_c
	ldr	r3, [r4, #408]
	lsl	r9, r9, #1
	ldr	r2, [sp, #52]
	lsls	r0, r0, #1
	subs	r3, r3, r2
	cmp	r3, r9
	ite	le
	strle	r3, [r4, #396]
	strgt	r9, [r4, #396]
	ldr	r3, [r4, #416]
	sub	r3, r3, r8
	cmp	r3, r0
	ite	le
	strle	r3, [r4, #400]
	strgt	r0, [r4, #400]
	b	.L59
.L67:
	cmp	r5, #24
	lsl	r1, r5, #1
	it	le
	addle	r1, r1, r5
	b	.L68
.L82:
	lsl	r2, r8, #1
	cmp	r3, r2
	ble	.L84
	add	r8, r5, #2
	b	.L83
.L84:
	add	r8, r8, r2
	cmp	r8, r3, lsl #1
	bge	.L161
	add	r8, r5, #1
	b	.L83
.L81:
	lsls	r2, r3, #1
	add	r3, r3, r2
	cmp	r3, r8
	bge	.L85
	sub	r8, r5, #3
	b	.L83
.L240:
	.align	2
.L239:
	.word	1717986919
	.word	.LANCHOR0+28
	.word	.LANCHOR0
	.word	rc_debug
	.word	.LANCHOR0+196
	.word	.LC3
	.word	.LC4
	.word	.LC5
.L85:
	cmp	r2, r8
	bge	.L86
	sub	r8, r5, #2
	b	.L83
.L86:
	cmp	r3, r8, lsl #1
	bge	.L161
	add	r8, r5, #-1
	b	.L83
.L161:
	mov	r8, r5
	b	.L83
.L93:
	cmp	r0, #22
	ite	gt
	ldrbgt	r1, [r5, #469]	@ zero_extendqisi2
	ldrble	r1, [r5, #521]	@ zero_extendqisi2
	b	.L228
.L97:
	mvn	r3, #19
	muls	r3, r6, r3
	cmp	r0, r3
	bge	.L80
	cmp	r5, #51
	it	ge
	movge	r5, #51
	cmp	r5, #15
	it	lt
	movlt	r5, #15
	b	.L233
.L78:
	ldr	r3, [r4, #288]
	cmp	r3, #2
	bne	.L98
	cmp	r6, #32
	ble	.L162
	cmp	r6, #35
	ite	lt
	movlt	r3, #2
	movge	r3, #1
.L99:
	add	r6, r6, r3
	str	r6, [r4, #584]
	b	.L80
.L162:
	movs	r3, #3
	b	.L99
.L98:
	ldr	r0, [r4, #348]
	mov	r3, #1024
	str	r3, [sp, #76]
	bl	mpp_data_sum_v2
	movs	r1, #0
	mov	r5, r0
	ldr	r0, [r4, #348]
	bl	mpp_data_get_pre_val_v2
	movs	r1, #1
	mov	r8, r0
	ldr	r0, [r4, #348]
	bl	mpp_data_get_pre_val_v2
	cmp	r5, #99
	bgt	.L100
	movs	r2, #0
.L229:
	mov	r0, r4
	add	r1, sp, #76
	bl	set_coef
	ldr	r3, [sp, #76]
	cmp	r3, #1024
	itt	gt
	movgt	r3, #1024
	strgt	r3, [sp, #76]
	ldr	r0, [sp, #76]
	cmp	r0, #900
	bge	.L164
	cmp	r0, #306
	ble	.L120
	mvn	r2, #306
	add	r0, r0, r2
	ldr	r3, .L241
	lsls	r0, r0, #9
	umull	r0, r1, r0, r3
	lsrs	r3, r1, #7
	add	r0, r3, #512
.L121:
	cmp	r0, #1024
	it	ge
	movge	r0, #1024
	mov	r9, r0
.L119:
	ldrd	r5, r2, [r4, #396]
	ldr	r0, [r4, #544]
	subs	r3, r2, r5
	ldrd	r1, r2, [r4, #420]
	str	r3, [sp, #56]
	subs	r3, r2, r1
	ldr	r2, [r4, #508]
	str	r3, [sp, #60]
	lsls	r1, r1, #10
	add	r2, r2, r0
	str	r1, [sp, #36]
	ldr	r1, [sp, #60]
	asrs	r3, r2, #1
	lsls	r2, r5, #10
	str	r2, [sp, #32]
	ldr	r0, [sp, #32]
	ldr	r2, [sp, #56]
	str	r3, [sp, #68]
	ldr	r3, [r4, #584]
	mla	r2, r9, r2, r0
	ldr	r0, [sp, #36]
	mla	r5, r9, r1, r0
	movs	r0, #100
	asrs	r2, r2, #10
	cmp	r2, #100
	it	lt
	movlt	r2, #100
	asrs	r5, r5, #10
	lsl	ip, r2, #1
	add	r8, ip, r2
	eor	r1, r5, r5, asr #31
	sub	r1, r1, r5, asr #31
	mul	r10, r0, r1
	cmp	r10, r8
	bgt	.L122
.L129:
	subs	r0, r6, #1
	b	.L123
.L100:
	cmp	r5, #199
	bgt	.L102
	cmp	r8, #99
	bgt	.L103
	movs	r2, #102
	b	.L229
.L103:
	movs	r2, #154
	b	.L229
.L102:
	cmp	r5, #300
	bge	.L104
	cmp	r8, #99
	ble	.L103
	cmp	r8, #100
	bne	.L105
	cmp	r0, #99
	bgt	.L106
	movs	r2, #205
	b	.L229
.L106:
	cmp	r0, #100
	bne	.L105
	mov	r2, #256
	b	.L229
.L105:
	movw	r2, #307
	b	.L229
.L104:
	cmp	r5, #600
	bge	.L107
	cmp	r8, #99
	bgt	.L108
	cmp	r0, #99
	ble	.L105
	cmp	r0, #100
	bne	.L109
.L111:
	mov	r2, #358
	b	.L229
.L109:
	mov	r2, #410
	b	.L229
.L108:
	cmp	r8, #100
	bne	.L110
	cmp	r0, #99
	ble	.L111
	cmp	r0, #100
	beq	.L109
.L110:
	movw	r2, #461
	b	.L229
.L107:
	cmp	r5, #900
	bge	.L112
	cmp	r8, #99
	bgt	.L113
	cmp	r0, #99
	ble	.L109
	cmp	r0, #100
	beq	.L110
.L115:
	mov	r2, #512
	b	.L229
.L113:
	cmp	r8, #100
	bne	.L114
	cmp	r0, #99
	ble	.L115
	cmp	r0, #100
	bne	.L114
	movw	r2, #563
	b	.L229
.L114:
	movw	r2, #614
	b	.L229
.L112:
	movw	r3, #1499
	cmp	r5, r3
	bgt	.L116
	movw	r2, #666
	b	.L229
.L116:
	movw	r3, #1899
	cmp	r5, r3
	ite	le
	movle	r2, #768
	movgt	r2, #900
	b	.L229
.L120:
	movw	r1, #307
	lsls	r0, r0, #9
	bl	__aeabi_idiv
	b	.L121
.L164:
	mov	r9, #1024
	b	.L119
.L122:
	muls	r0, r5, r0
	cmp	r8, r0
	bge	.L124
	cmp	r5, r2
	blt	.L125
	cmp	r3, #29
	ble	.L231
	subs	r0, r6, #4
.L123:
	ldrd	r10, r3, [r4, #304]
	mov	r2, r3
	mov	r1, r10
	str	r3, [sp, #40]
	bl	mpp_clip
	cmp	r0, #34
	mov	r8, r0
	ble	.L132
	ldrd	r0, r1, [sp, #24]
	bl	__aeabi_idiv
	ldr	r2, .L241+4
	rsbs	r0, r0, #0
	smull	r2, r3, r0, r2
	asrs	r0, r0, #31
	rsb	r0, r0, r3, asr #1
	cmp	r5, r0, lsl #1
	ble	.L166
	cmp	r5, r0
	ite	le
	movle	r5, #102
	movgt	r5, #51
.L133:
	add	r3, r5, r9
	cmp	r3, #1024
	bge	.L168
	cmp	r8, #35
	it	ne
	movne	r3, #1024
.L134:
	ldr	r2, [sp, #60]
	ldr	r1, [sp, #36]
	mla	r9, r2, r3, r1
	ldr	r2, [sp, #56]
	ldr	r1, [sp, #32]
	mla	r3, r2, r3, r1
	asr	r9, r9, #10
	movs	r2, #100
	eor	r8, r9, r9, asr #31
	sub	r8, r8, r9, asr #31
	asrs	r3, r3, #10
	cmp	r3, #100
	mul	r5, r2, r8
	it	lt
	movlt	r3, #100
	lsls	r1, r3, #1
	adds	r0, r1, r3
	cmp	r5, r0
	ble	.L170
	mul	r2, r2, r9
	cmp	r0, r2
	bge	.L135
	cmp	r9, r3
	blt	.L136
	sub	r8, r6, #3
.L132:
	ldr	r2, [sp, #40]
	mov	r1, r10
	mov	r0, r8
	bl	mpp_clip
	cmp	r0, #36
	bgt	.L138
	cmp	r0, #33
	bgt	.L171
	cmp	r0, #30
	mov	r1, #1
	ite	gt
	movgt	r2, #3
	movle	r2, #4
.L139:
	add	r2, r2, r6
	subs	r1, r6, r1
	bl	mpp_clip
	ldr	r3, [sp, #68]
	str	r0, [r4, #584]
	cmp	r3, #0
	ble	.L80
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #24]
	add	r3, r3, r3, lsl #2
	cmp	r3, r2
	ble	.L141
	cmp	r0, #51
	it	ge
	movge	r0, #51
	cmp	r0, #25
	it	lt
	movlt	r0, #25
.L234:
	str	r0, [r4, #584]
	b	.L80
.L125:
	cmp	r2, r5, lsl #2
	bgt	.L127
	cmp	r3, #29
	ble	.L232
.L231:
	subs	r0, r6, #3
	b	.L123
.L127:
	movs	r1, #10
	muls	r1, r5, r1
	cmp	r1, r2
	ble	.L129
.L232:
	subs	r0, r6, #2
	b	.L123
.L124:
	cmp	r6, #35
	ite	gt
	movgt	r0, #0
	movle	r0, #1
	cmp	ip, r1
	bgt	.L130
	adds	r2, r6, #2
.L230:
	add	r0, r0, r2
	b	.L123
.L130:
	add	lr, r1, r1, lsl #1
	cmp	ip, lr
	bgt	.L131
	adds	r2, r6, #1
	b	.L230
.L131:
	add	r1, r1, r1, lsl #2
	cmp	r1, r2
	ite	gt
	addgt	r0, r6, #1
	movle	r0, r6
	b	.L123
.L166:
	movs	r5, #205
	b	.L133
.L168:
	mov	r3, #1024
	b	.L134
.L136:
	cmp	r3, r9, lsl #2
	bgt	.L137
	sub	r8, r6, #2
	b	.L132
.L137:
	movs	r2, #10
	mul	r9, r2, r9
	cmp	r9, r3
	ble	.L170
	add	r8, r6, #-1
	b	.L132
.L135:
	add	r8, r8, r8, lsl #1
	cmp	r8, r1
	ite	lt
	movlt	r8, r6
	addge	r8, r6, #1
	b	.L132
.L170:
	mov	r8, r6
	b	.L132
.L171:
	movs	r2, #2
	mov	r1, r2
	b	.L139
.L141:
	ldr	r2, [sp, #24]
	movs	r3, #20
	muls	r3, r2, r3
	cmp	r3, r2
	ble	.L80
	cmp	r0, #51
	it	ge
	movge	r0, #51
	cmp	r0, #21
	it	lt
	movlt	r0, #21
	b	.L234
.L242:
	.align	2
.L241:
	.word	1340867839
	.word	1717986919
.L174:
	movs	r1, #5
	movs	r3, #6
.L142:
	ldr	r2, [sp, #64]
	ldr	r5, [r4, #284]
	cmp	r2, #11
	ldr	r2, [r4, #628]
	itt	gt
	addgt	r3, r3, #1
	addgt	r1, r1, #1
	cmp	r2, #0
	ldr	r0, [r4, #584]
	it	ne
	movne	r3, #0
	cmp	r5, #2
	bne	.L145
	ldrd	r2, r1, [sp, #16]
	cmp	r2, r1
	beq	.L177
	mov	r2, r1
	ldr	r1, [sp, #16]
	adds	r1, r3, r1
.L238:
	bl	mpp_clip
	b	.L155
.L175:
	movs	r1, #4
	b	.L235
.L176:
	mov	r3, r1
	b	.L142
.L177:
	ldr	r0, [sp, #16]
.L155:
	ldrd	r1, r2, [r4, #304]
	str	r0, [r4, #584]
	ldr	r0, [r4, #584]
	bl	mpp_clip
	movs	r3, #0
	str	r0, [r4, #584]
	str	r0, [r7, #172]
	str	r3, [r7, #212]
	ldr	r3, [r4, #284]
	cbnz	r3, .L150
	ldr	r2, [sp, #52]
	add	r3, fp, #-1
	cmp	r3, r2
	bgt	.L150
	ldr	r3, [r4, #584]
	cmp	r3, fp
	bne	.L150
	ldr	r3, [r4, #588]
	cmp	r3, fp
	bne	.L150
	movs	r3, #1
	str	r3, [r7, #212]
	ldr	r3, [r4, #284]
	cmp	r3, #2
	bne	.L151
	ldrd	r3, r2, [sp, #16]
	subs	r3, r3, r2
.L236:
	it	ne
	movne	r3, #1
	str	r3, [r7, #212]
.L150:
	ldr	r3, [r4, #96]
	str	r3, [r7, #176]
	ldr	r3, [r4, #100]
	str	r3, [r7, #180]
	ldr	r3, [r4, #400]
	str	r3, [r7, #160]
	ldrd	r3, r2, [r4, #296]
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #296]
	movs	r3, #0
	str	r3, [r4, #612]
	ldr	r3, [r4, #188]
	cbz	r3, .L152
	ldrd	r3, r2, [r4, #192]
	ldr	r1, [r4, #284]
	cmp	r1, #2
	it	ne
	movne	r3, r2
	ldr	r2, [r4, #200]
	cmp	r2, #1
	bne	.L152
	ldr	r2, [r7, #160]
	cmp	r2, r3
	it	hi
	strhi	r3, [r7, #160]
.L152:
	ldr	r3, .L243
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L209
	mov	r3, r4
	movw	r2, #942
	ldr	r1, .L243+4
	ldr	r0, .L243+8
	bl	printk
.L209:
	movs	r0, #0
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L145:
	ldr	r2, [sp, #12]
	cmp	r2, fp
	beq	.L148
	ldr	r6, [sp, #12]
	mov	r2, fp
	add	r1, r1, r6
	bl	mpp_clip
	cmp	r5, #3
	bne	.L155
	ldr	r2, [sp, #12]
	subs	r0, r0, #1
	subs	r1, r2, #1
	mov	r2, fp
	add	r1, r1, r3
	b	.L238
.L151:
	ldr	r3, [sp, #12]
	subs	r3, r3, fp
	b	.L236
.L138:
	cmp	r0, #41
	mov	r2, #1
	ite	lt
	movlt	r1, #3
	movge	r1, #4
	b	.L139
.L148:
	ldr	r0, [sp, #12]
	b	.L155
.L244:
	.align	2
.L243:
	.word	rc_debug
	.word	.LANCHOR0+573
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_start, .-rc_model_v2_smt_start
	.align	1
	.global	rc_model_v2_smt_proc_show
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_proc_show, %function
rc_model_v2_smt_proc_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	.pad #44
	sub	sp, sp, #44
	ldr	r1, .L260
	mov	r5, r0
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L260+4
	ldr	r2, .L260+8
	mov	r0, r5
	ldr	r1, .L260+12
	ldr	r7, .L260+16
	ldr	r8, .L260+288
	str	r3, [sp, #28]
	ldr	r3, .L260+20
	str	r3, [sp, #24]
	ldr	r3, .L260+24
	str	r3, [sp, #20]
	ldr	r3, .L260+28
	str	r3, [sp, #16]
	ldr	r3, .L260+32
	str	r3, [sp, #12]
	ldr	r3, .L260+36
	str	r3, [sp, #8]
	ldr	r3, .L260+40
	str	r3, [sp, #4]
	ldr	r3, .L260+44
	str	r3, [sp]
	ldr	r3, .L260+48
	bl	seq_printf
	ldr	r10, [r4, #8]
	ldr	r9, [r4, #60]
	cmp	r10, #2
	bne	.L246
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	fp, [r4, #40]
	str	r0, [sp, #36]
	ldrd	r0, r1, [r4, #28]
	bl	__aeabi_idiv
	str	r0, [sp, #32]
	mov	r0, r10
	bl	strof_rc_mode
	ldr	r2, [r4, #92]
	ldr	r1, [sp, #32]
	ldr	r3, [sp, #36]
	strd	r2, r2, [sp, #24]
	mov	r2, r6
	str	r1, [sp, #8]
	ldr	r1, .L260+52
	strd	r9, r3, [sp]
	mov	r3, fp
	strd	r7, r7, [sp, #16]
	str	r0, [sp, #12]
.L257:
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L260+56
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+60
	ldr	r2, .L260+8
	mov	r0, r5
	ldr	r1, .L260+64
	str	r3, [sp, #8]
	ldr	r3, .L260+68
	str	r3, [sp, #4]
	ldr	r3, .L260+72
	str	r3, [sp]
	ldr	r3, .L260+76
	bl	seq_printf
	ldr	r0, [r4, #176]
	bl	strof_drop
	ldr	r3, [r4, #184]
	mov	r2, r6
	ldr	r1, .L260+80
	str	r3, [sp, #8]
	ldr	r3, [r4, #616]
	str	r3, [sp, #4]
	ldr	r3, [r4, #180]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L260+84
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+88
	ldr	r2, .L260+8
	mov	r0, r5
	ldr	r1, .L260+92
	str	r3, [sp, #8]
	ldr	r3, .L260+96
	str	r3, [sp, #4]
	ldr	r3, .L260+100
	str	r3, [sp]
	ldr	r3, .L260+104
	bl	seq_printf
	ldr	r0, [r4, #188]
	bl	strof_suprmode
	ldr	r3, [r4, #200]
	mov	r2, r6
	ldr	r1, .L260+108
	str	r3, [sp, #8]
	ldr	r3, [r4, #196]
	str	r3, [sp, #4]
	ldr	r3, [r4, #192]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L260+112
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+116
	mov	r0, r5
	ldr	r2, .L260+8
	ldr	r1, .L260+120
	str	r3, [sp, #8]
	ldr	r3, .L260+124
	str	r3, [sp, #4]
	ldr	r3, .L260+128
	str	r3, [sp]
	ldr	r3, .L260+132
	bl	seq_printf
	ldr	r0, [r4, #36]
	cmp	r0, #1
	bne	.L248
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	ldr	r2, [r4, #44]
	ldr	r1, .L260+136
	strd	r3, r2, [sp]
	mov	r2, r6
	str	r3, [sp, #8]
	mov	r3, r0
.L258:
	mov	r0, r5
	bl	seq_printf
	ldr	r3, [r4, #8]
	cbz	r3, .L250
	cmp	r3, #4
	bne	.L251
.L250:
	ldr	r1, .L260+140
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+144
	ldr	r2, .L260+8
	mov	r0, r5
	ldr	r1, .L260+148
	str	r3, [sp, #28]
	ldr	r3, .L260+152
	str	r3, [sp, #24]
	ldr	r3, .L260+156
	str	r3, [sp, #20]
	ldr	r3, .L260+160
	str	r3, [sp, #16]
	ldr	r3, .L260+164
	str	r3, [sp, #12]
	ldr	r3, .L260+168
	str	r3, [sp, #8]
	ldr	r3, .L260+172
	str	r3, [sp, #4]
	ldr	r3, .L260+176
	str	r3, [sp]
	ldr	r3, .L260+180
	bl	seq_printf
	ldr	r3, [r4, #156]
	mov	r2, r6
	ldr	r1, .L260+184
	mov	r0, r5
	str	r3, [sp, #28]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #132]
	str	r3, [sp, #20]
	ldr	r3, [r4, #120]
	str	r3, [sp, #16]
	ldr	r3, [r4, #128]
	str	r3, [sp, #12]
	ldr	r3, [r4, #108]
	str	r3, [sp, #8]
	ldr	r3, [r4, #104]
	str	r3, [sp, #4]
	ldr	r3, [r4, #100]
	str	r3, [sp]
	ldr	r3, [r4, #96]
	bl	seq_printf
.L251:
	ldr	r1, .L260+188
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+192
	ldr	r2, .L260+8
	mov	r0, r5
	ldr	r1, .L260+196
	str	r3, [sp, #28]
	ldr	r3, .L260+200
	str	r3, [sp, #24]
	ldr	r3, .L260+204
	str	r3, [sp, #20]
	ldr	r3, .L260+208
	str	r3, [sp, #16]
	ldr	r3, .L260+212
	str	r3, [sp, #12]
	ldr	r3, .L260+216
	str	r3, [sp, #8]
	ldr	r3, .L260+220
	str	r3, [sp, #4]
	ldr	r3, .L260+224
	str	r3, [sp]
	ldr	r3, .L260+228
	bl	seq_printf
	ldr	r0, [r4, #212]
	bl	strof_bool
	ldr	r3, [r4, #228]
	mov	r2, r6
	ldr	r1, .L260+232
	str	r3, [sp, #28]
	ldr	r3, [r4, #224]
	str	r3, [sp, #24]
	ldr	r3, [r4, #220]
	str	r3, [sp, #20]
	ldr	r3, [r4, #216]
	str	r3, [sp, #16]
	ldr	r3, [r4, #244]
	str	r3, [sp, #12]
	ldr	r3, [r4, #240]
	str	r3, [sp, #8]
	ldr	r3, [r4, #236]
	str	r3, [sp, #4]
	ldr	r3, [r4, #232]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	ldr	r1, .L260+236
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L260+240
	mov	r0, r5
	ldr	r2, .L260+8
	ldr	r1, .L260+244
	str	r3, [sp, #4]
	ldr	r3, .L260+248
	str	r3, [sp]
	ldr	r3, .L260+228
	bl	seq_printf
	ldr	r9, [r4, #204]
	mov	r0, r9
	cmp	r9, #0
	beq	.L252
	bl	strof_bool
	movs	r3, #0
	ldr	r1, .L260+252
	mov	r2, r6
	str	r3, [sp, #4]
	ldr	r3, [r4, #208]
	str	r3, [sp]
	mov	r3, r0
.L259:
	mov	r0, r5
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L260+256
	bl	seq_puts
	ldr	r3, .L260+260
	mov	r0, r5
	ldr	r2, .L260+8
	ldr	r1, .L260+264
	str	r3, [sp, #16]
	ldr	r3, .L260+268
	str	r3, [sp, #12]
	ldr	r3, .L260+272
	str	r3, [sp, #8]
	ldr	r3, .L260+276
	str	r3, [sp, #4]
	ldr	r3, .L260+280
	str	r3, [sp]
	ldr	r3, .L260+284
	bl	seq_printf
	b	.L261
.L262:
	.align	2
.L260:
	.word	.LC6
	.word	.LC10
	.word	.LC8
	.word	.LC9
	.word	.LC19
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC7
	.word	.LC18
	.word	.LC22
	.word	.LC25
	.word	.LC24
	.word	.LC26
	.word	.LC27
	.word	.LC23
	.word	.LC28
	.word	.LC29
	.word	.LC32
	.word	.LC31
	.word	.LC33
	.word	.LC34
	.word	.LC30
	.word	.LC35
	.word	.LC36
	.word	.LC39
	.word	.LC38
	.word	.LC40
	.word	.LC41
	.word	.LC37
	.word	.LC42
	.word	.LC44
	.word	.LC47
	.word	.LC46
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC45
	.word	.LC55
	.word	.LC56
	.word	.LC59
	.word	.LC58
	.word	.LC60
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC57
	.word	.LC67
	.word	.LC68
	.word	.LC70
	.word	.LC69
	.word	.LC71
	.word	.LC72
	.word	.LC74
	.word	.LC77
	.word	.LC76
	.word	.LC78
	.word	.LC79
	.word	.LC80
	.word	.LC81
	.word	.LC75
	.word	274877907
.L261:
	ldr	r2, [r4, #252]
	ldr	r3, [r4, #336]
	mov	r0, r5
	ldr	r1, .L263
	smull	r8, r9, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r9, asr #6
	str	r2, [sp, #16]
	ldr	r2, [r4, #136]
	str	r2, [sp, #12]
	ldr	r2, [r4, #256]
	str	r2, [sp, #8]
	ldr	r2, [r4, #92]
	str	r2, [sp, #4]
	ldr	r2, [r4, #72]
	str	r2, [sp]
	mov	r2, r6
	bl	seq_printf
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L246:
	ldr	r3, [r4, #56]
	strd	r7, r7, [sp, #24]
	smull	r0, r1, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #20]
	ldr	r3, [r4, #48]
	smull	r0, r1, r3, r8
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #16]
	ldr	r3, .L263+4
	ldrd	r0, r1, [r4, #28]
	str	r3, [sp, #12]
	bl	__aeabi_idiv
	str	r0, [sp, #8]
	ldrd	r0, r1, [r4, #16]
	bl	__aeabi_idiv
	ldr	r3, [r4, #40]
	mov	r2, r6
	ldr	r1, .L263+8
	strd	r9, r0, [sp]
	b	.L257
.L248:
	bl	strof_gop_mode
	ldr	r3, [r4, #112]
	mov	r2, r6
	ldr	r1, .L263+12
	str	r3, [sp]
	mov	r3, r0
	strd	r7, r7, [sp, #4]
	b	.L258
.L252:
	bl	strof_bool
	mov	r2, r6
	ldr	r1, .L263+16
	strd	r7, r9, [sp]
	mov	r3, r0
	b	.L259
.L264:
	.align	2
.L263:
	.word	.LC82
	.word	.LC21
	.word	.LC20
	.word	.LC43
	.word	.LC73
	.fnend
	.size	rc_model_v2_smt_proc_show, .-rc_model_v2_smt_proc_show
	.align	1
	.global	rc_model_v2_smt_hal_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_hal_end, %function
rc_model_v2_smt_hal_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L272
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L267
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #1159
	ldr	r1, .L272+4
	ldr	r0, .L272+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L267
	mov	r3, r4
	mov	r2, #1160
	ldr	r1, .L272+4
	ldr	r0, .L272+12
	bl	printk
.L267:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L273:
	.align	2
.L272:
	.word	rc_debug
	.word	.LANCHOR0+595
	.word	.LC83
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_hal_end, .-rc_model_v2_smt_hal_end
	.align	1
	.global	bits_model_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_deinit, %function
bits_model_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, .L307
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L275
	mov	r3, r0
	movs	r2, #84
	ldr	r1, .L307+4
	ldr	r0, .L307+8
	bl	printk
.L275:
	ldr	r0, [r4, #344]
	cbz	r0, .L276
	bl	mpp_data_deinit
	movs	r3, #0
	str	r3, [r4, #344]
.L276:
	ldr	r0, [r4, #348]
	cbz	r0, .L277
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #348]
.L277:
	ldr	r0, [r4, #352]
	cbz	r0, .L278
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #352]
.L278:
	ldr	r0, [r4, #356]
	cbz	r0, .L279
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #356]
.L279:
	ldr	r0, [r4, #576]
	cbz	r0, .L280
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #576]
.L280:
	ldr	r0, [r4, #580]
	cbz	r0, .L281
	bl	mpp_data_deinit_v2
	movs	r3, #0
	str	r3, [r4, #580]
.L281:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L282
	mov	r3, r4
	movs	r2, #116
	ldr	r1, .L307+4
	ldr	r0, .L307+12
	bl	printk
.L282:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L308:
	.align	2
.L307:
	.word	rc_debug
	.word	.LANCHOR0+619
	.word	.LC3
	.word	.LC5
	.fnend
	.size	bits_model_smt_deinit, .-bits_model_smt_deinit
	.align	1
	.global	rc_model_v2_smt_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_deinit, %function
rc_model_v2_smt_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, .L318
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L310
	mov	r3, r0
	movw	r2, #295
	ldr	r1, .L318+4
	ldr	r0, .L318+8
	bl	printk
.L310:
	mov	r0, r5
	bl	bits_model_smt_deinit
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L311
	mov	r3, r5
	movw	r2, #297
	ldr	r1, .L318+4
	ldr	r0, .L318+12
	bl	printk
.L311:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L319:
	.align	2
.L318:
	.word	rc_debug
	.word	.LANCHOR0+641
	.word	.LC3
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_deinit, .-rc_model_v2_smt_deinit
	.align	1
	.global	bits_model_smt_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_smt_init, %function
bits_model_smt_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r7, .L362
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #40]
	add	r6, sp, #20
	ldrd	r9, r10, [r4, #28]
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	mov	r1, r10
	ldr	r3, [r7]
	mov	r0, r9
	str	r3, [r6]
	bl	__aeabi_idiv
	cmp	r5, #10
	mov	r1, #1
	mov	r6, r0
	mov	r0, r5
	it	lt
	movlt	r0, #10
	cmp	r0, r6
	mov	r2, r6
	it	lt
	movlt	r0, r6
	bl	mpp_clip
	mov	r1, r10
	mov	r7, r0
	ldr	r0, [r4, #60]
	mul	r0, r0, r9
	bl	__aeabi_idiv
	mov	r8, r0
	cbnz	r0, .L321
	mov	r1, r10
	lsl	r0, r9, #3
	bl	__aeabi_idiv
	mov	r8, r0
.L321:
	ldr	r3, .L362+4
	ldr	r2, [r3]
	str	r3, [sp, #12]
	tst	r2, #1
	beq	.L322
	mov	r3, r4
	movs	r2, #133
	ldr	r1, .L362+8
	ldr	r0, .L362+12
	bl	printk
.L322:
	ldr	r0, [r4, #348]
	movs	r3, #0
	movs	r2, #0
	movs	r1, #10
	strd	r2, [r4, #296]
	movs	r3, #1
	str	r5, [r4, #428]
	str	r3, [r4, #292]
	movs	r3, #0
	strd	r3, r3, [r4, #600]
	movs	r3, #51
	strd	r1, r3, [r4, #304]
	cbz	r0, .L323
	bl	mpp_data_deinit_v2
.L323:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #348
	bl	mpp_data_init_v2
	ldr	r0, [r4, #352]
	cbz	r0, .L324
	bl	mpp_data_deinit_v2
.L324:
	movs	r2, #0
	movs	r1, #10
	add	r0, r4, #352
	bl	mpp_data_init_v2
	ldr	r0, [r4, #356]
	cbz	r0, .L325
	bl	mpp_data_deinit_v2
.L325:
	ldr	r2, [r4, #416]
	mov	r1, r8
	add	r0, r4, #356
	bl	mpp_data_init_v2
	ldr	r0, [r4, #576]
	cbz	r0, .L326
	bl	mpp_data_deinit_v2
.L326:
	movs	r2, #0
	mov	r1, r8
	add	r0, r4, #576
	bl	mpp_data_init_v2
	ldr	r0, [r4, #580]
	cbz	r0, .L327
	bl	mpp_data_deinit_v2
.L327:
	mov	r1, r8
	add	r8, r4, #360
	movs	r2, #0
	add	fp, r4, #432
	add	r0, r4, #580
	add	r10, r4, #468
	bl	mpp_data_init_v2
	mov	r0, r8
	bl	mpp_pid_reset
	add	r9, r4, #504
	mov	r0, fp
	bl	mpp_pid_reset
	mov	r0, r10
	bl	mpp_pid_reset
	mov	r0, r9
	bl	mpp_pid_reset
	add	r3, r4, #540
	mov	r0, r3
	str	r3, [sp, #8]
	bl	mpp_pid_reset
	mov	r0, r8
	movs	r3, #90
	movs	r2, #6
	movs	r1, #4
	mov	r8, #100
	str	r3, [sp]
	movs	r3, #0
	str	r7, [sp, #4]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, fp
	str	r8, [sp]
	str	r7, [sp, #4]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	mov	r0, r10
	strd	r8, r7, [sp]
	bl	mpp_pid_set_param
	mov	r0, r9
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	strd	r8, r5, [sp]
	bl	mpp_pid_set_param
	movs	r3, #0
	movs	r2, #6
	movs	r1, #4
	strd	r8, r5, [sp]
	ldr	r0, [sp, #8]
	bl	mpp_pid_set_param
	ldrd	r2, r1, [r4, #28]
	ldr	r0, [r4, #48]
	bl	axb_div_c
	ldrd	r2, r1, [r4, #28]
	mov	r8, r0
	ldr	r0, [r4, #56]
	bl	axb_div_c
	movs	r3, #0
	movs	r2, #0
	strd	r2, [r4, #320]
	strd	r2, [r4, #328]
	movs	r3, #0
	str	r3, [r4, #336]
	mov	r9, r0
	cbnz	r5, .L328
	movs	r3, #10
	str	r5, [r4, #312]
	mul	r0, r3, r8
	str	r8, [r4, #408]
	mul	r3, r3, r9
	str	r9, [r4, #416]
	str	r0, [r4, #404]
	str	r3, [r4, #412]
.L329:
	ldr	r3, [sp, #12]
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L333
	mov	r3, r4
	movs	r2, #214
	ldr	r1, .L362+8
	ldr	r0, .L362+16
	bl	printk
.L333:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L328:
	cmp	r5, #1
	bne	.L330
	ldr	r2, [r4, #204]
	str	r5, [r4, #312]
	strd	r8, r3, [r4, #404]
	strd	r0, r3, [r4, #412]
	cmp	r2, #0
	beq	.L329
	str	r3, [r4, #204]
	b	.L329
.L330:
	cmp	r5, r7
	bge	.L331
	movs	r3, #2
	adds	r5, r5, #1
	asrs	r0, r0, #1
	str	r3, [r4, #312]
	asr	r3, r8, #1
	str	r0, [r4, #416]
	str	r3, [r4, #408]
	muls	r0, r5, r0
	muls	r3, r5, r3
	str	r0, [r4, #412]
	str	r3, [r4, #404]
	b	.L329
.L331:
	cmp	r5, #50
	ble	.L332
	cmp	r5, #100
	ble	.L335
	cmp	r5, #200
	ble	.L336
	cmp	r5, #300
	ite	le
	movle	r3, #3
	movgt	r3, #4
.L332:
	movs	r2, #3
	str	r2, [r4, #312]
	add	r2, sp, #40
	rsb	r6, r6, #1
	add	r3, r2, r3, lsl #2
	mov	r1, r6
	ldr	r5, [r3, #-20]
	mul	r0, r8, r5
	mul	r5, r9, r5
	add	r0, r0, r0, lsr #31
	add	r5, r5, r5, lsr #31
	asrs	r0, r0, #1
	str	r0, [r4, #404]
	asrs	r5, r5, #1
	str	r5, [r4, #412]
	bl	__aeabi_idiv
	mov	r1, r6
	add	r0, r0, r8
	str	r0, [r4, #408]
	mov	r0, r5
	bl	__aeabi_idiv
	add	r0, r0, r9
	str	r0, [r4, #416]
	b	.L329
.L335:
	movs	r3, #1
	b	.L332
.L336:
	movs	r3, #2
	b	.L332
.L363:
	.align	2
.L362:
	.word	.LANCHOR0+664
	.word	rc_debug
	.word	.LANCHOR0+684
	.word	.LC3
	.word	.LC5
	.fnend
	.size	bits_model_smt_init, .-bits_model_smt_init
	.align	1
	.global	rc_model_v2_smt_h265_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h265_init, %function
rc_model_v2_smt_h265_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L373
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L365
	mov	r3, r0
	mov	r2, #270
	ldr	r1, .L373+4
	ldr	r0, .L373+8
	bl	printk
.L365:
	mov	r2, #284
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L366
	mov	r3, r4
	movw	r2, #275
	ldr	r1, .L373+4
	ldr	r0, .L373+12
	bl	printk
.L366:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L374:
	.align	2
.L373:
	.word	rc_debug
	.word	.LANCHOR0+704
	.word	.LC3
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_h265_init, .-rc_model_v2_smt_h265_init
	.align	1
	.global	rc_model_v2_smt_h264_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_h264_init, %function
rc_model_v2_smt_h264_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L384
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L376
	mov	r3, r0
	movw	r2, #283
	ldr	r1, .L384+4
	ldr	r0, .L384+8
	bl	printk
.L376:
	mov	r2, #284
	mov	r1, r6
	mov	r0, r4
	bl	memcpy
	mov	r0, r4
	bl	bits_model_smt_init
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L377
	mov	r3, r4
	mov	r2, #288
	ldr	r1, .L384+4
	ldr	r0, .L384+12
	bl	printk
.L377:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L385:
	.align	2
.L384:
	.word	rc_debug
	.word	.LANCHOR0+730
	.word	.LC3
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_h264_init, .-rc_model_v2_smt_h264_init
	.global	__aeabi_idivmod
	.align	1
	.global	bits_model_update_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	bits_model_update_smt, %function
bits_model_update_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, .L401
	mov	r5, r1
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L387
	mov	r3, r0
	movs	r2, #225
	ldr	r1, .L401+4
	ldr	r0, .L401+8
	bl	printk
.L387:
	mov	r1, r5
	ldr	r0, [r4, #356]
	bl	mpp_data_update_v2
	ldr	r1, [r4, #396]
	subs	r3, r1, r5
	str	r3, [r4, #420]
	ldr	r3, [r4, #400]
	subs	r1, r5, r1
	subs	r3, r3, r5
	str	r3, [r4, #424]
	ldr	r3, [r4, #284]
	cmp	r3, #2
	bne	.L388
	ldrd	r3, r2, [r4, #320]
	add	r0, r4, #432
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #320]
	movs	r2, #1
	bl	mpp_pid_update
	ldr	r1, [r4, #400]
	movs	r2, #1
	add	r0, r4, #468
	subs	r1, r5, r1
	bl	mpp_pid_update
.L389:
	ldr	r1, [r4, #396]
	movs	r2, #1
	add	r0, r4, #504
	subs	r1, r5, r1
	bl	mpp_pid_update
	ldr	r1, [r4, #400]
	movs	r2, #1
	add	r0, r4, #540
	subs	r1, r5, r1
	bl	mpp_pid_update
	ldr	r3, [r4, #336]
	ldr	r0, [r4, #320]
	add	r5, r5, r3
	ldr	r3, [r4, #328]
	str	r5, [r4, #336]
	ldr	r1, [r4, #28]
	add	r0, r0, r3
	bl	__aeabi_idivmod
	mov	r2, r1
	cbnz	r1, .L390
	ldr	r3, [r4, #48]
	add	r0, r4, #360
	ldr	r7, [r4, #56]
	adds	r1, r3, r7
	asrs	r1, r1, #1
	add	ip, r1, r1, lsl #1
	cmp	ip, r5, lsl #1
	ble	.L391
.L400:
	subs	r1, r1, r5
	bl	mpp_pid_update
	movs	r3, #0
	str	r3, [r4, #336]
.L390:
	ldr	r3, [r4, #584]
	str	r3, [r4, #588]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L393
	mov	r3, r4
	movw	r2, #261
	ldr	r1, .L401+4
	ldr	r0, .L401+12
	bl	printk
.L393:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L388:
	ldrd	r3, r2, [r4, #328]
	ldr	r0, [r4, #576]
	adds	r3, r3, #1
	adc	r2, r2, #0
	strd	r3, r2, [r4, #328]
	bl	mpp_data_update_v2
	ldr	r1, [r4, #400]
	ldr	r0, [r4, #580]
	subs	r1, r5, r1
	bl	mpp_data_update_v2
	b	.L389
.L391:
	movs	r1, #6
	ldr	r8, .L401+16
	muls	r1, r7, r1
	lsls	r3, r3, #2
	smull	r10, fp, r3, r8
	asrs	r3, r3, #31
	smull	r8, r9, r1, r8
	asrs	r1, r1, #31
	rsb	r3, r3, fp, asr #2
	rsb	r1, r1, r9, asr #2
	add	r1, r1, r3
	b	.L400
.L402:
	.align	2
.L401:
	.word	rc_debug
	.word	.LANCHOR0+756
	.word	.LC3
	.word	.LC5
	.word	1717986919
	.fnend
	.size	bits_model_update_smt, .-bits_model_update_smt
	.align	1
	.global	rc_model_v2_smt_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_end, %function
rc_model_v2_smt_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r0, #628]
	mov	r5, r1
	ldr	r7, [r1, #184]
	cmp	r3, #0
	beq	.L404
	ldr	r2, .L430
	smull	r2, r3, r7, r2
	sub	r7, r3, r7, asr #31
	itt	gt
	movgt	r3, #0
	strgt	r3, [r0, #628]
.L404:
	ldr	r6, .L430+4
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L405
	add	r3, r5, #160
	movw	r2, #1116
	str	r3, [sp]
	mov	r3, r4
	ldr	r1, .L430+8
	ldr	r0, .L430+12
	bl	printk
.L405:
	ldr	r3, [r6]
	lsls	r1, r3, #25
	bpl	.L406
	ldr	r3, [r5, #208]
	movw	r2, #1117
	ldr	r1, .L430+8
	ldr	r0, .L430+16
	str	r3, [sp]
	ldr	r3, [r5, #204]
	bl	printk
.L406:
	ldr	r1, [r5, #204]
	ldr	r0, [r4, #348]
	bl	mpp_data_update_v2
	ldr	r1, [r5, #208]
	ldr	r0, [r4, #352]
	bl	mpp_data_update_v2
	movs	r3, #0
	str	r3, [r4, #292]
	ldr	r3, [r4, #284]
	cbz	r3, .L407
	ldr	r3, [r4, #312]
	cmp	r3, #1
	bne	.L408
.L407:
	ldr	r1, [r4, #584]
	ldr	r0, [r4, #344]
	bl	mpp_data_update
.L409:
	ldr	r3, [r6]
	lsls	r2, r3, #25
	bpl	.L410
	mov	r3, r7
	movw	r2, #1130
	ldr	r1, .L430+8
	ldr	r0, .L430+20
	bl	printk
.L410:
	mov	r1, r7
	mov	r0, r4
	bl	bits_model_update_smt
	ldr	r1, [r4, #584]
	ldr	r3, [r4, #284]
	ldr	r2, [r4, #604]
	str	r1, [r4, #588]
	str	r3, [r4, #288]
	adds	r2, r2, #1
	ldr	r3, [r5, #200]
	str	r2, [r4, #604]
	str	r3, [r4, #608]
	ldr	r3, [r4, #600]
	add	r3, r3, r1
	str	r3, [r4, #600]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L411
	mov	r3, r4
	movw	r2, #1138
	ldr	r1, .L430+8
	ldr	r0, .L430+24
	bl	printk
.L411:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L408:
	ldr	r3, [r4, #584]
	strd	r7, r3, [r4, #592]
	b	.L409
.L431:
	.align	2
.L430:
	.word	1431655766
	.word	rc_debug
	.word	.LANCHOR0+778
	.word	.LC84
	.word	.LC85
	.word	.LC86
	.word	.LC5
	.fnend
	.size	rc_model_v2_smt_end, .-rc_model_v2_smt_end
	.align	1
	.global	check_super_frame_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_super_frame_smt, %function
check_super_frame_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r5, r0
	ldr	r6, .L451
	mov	r8, r1
	ldr	r9, [r0, #284]
	ldr	r3, [r6]
	lsls	r4, r3, #31
	bpl	.L433
	mov	r3, r0
	movw	r2, #953
	ldr	r1, .L451+4
	ldr	r0, .L451+8
	bl	printk
.L433:
	ldr	r4, [r5, #188]
	cbz	r4, .L434
	cmp	r9, #2
	ldr	r7, [r5, #196]
	ldr	r3, [r8, #24]
	it	eq
	ldreq	r7, [r5, #192]
	cmp	r3, r7
	bcc	.L440
	cmp	r4, #1
	bne	.L436
	ldr	r3, [r6]
	lsls	r0, r3, #25
	bpl	.L437
	movw	r2, #961
	ldr	r1, .L451+4
	ldr	r0, .L451+12
	bl	printk
.L437:
	movs	r3, #1
	str	r3, [r5, #176]
	movs	r3, #0
	str	r3, [r5, #184]
.L436:
	ldr	r3, [r6]
	lsls	r2, r3, #25
	bpl	.L441
	str	r7, [sp]
	movw	r2, #965
	ldr	r3, [r8, #24]
	ldr	r1, .L451+4
	ldr	r0, .L451+16
	bl	printk
.L441:
	mov	r4, #-1
	b	.L434
.L440:
	movs	r4, #0
.L434:
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L432
	mov	r3, r5
	movw	r2, #969
	ldr	r1, .L451+4
	ldr	r0, .L451+20
	bl	printk
.L432:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L452:
	.align	2
.L451:
	.word	rc_debug
	.word	.LANCHOR0+798
	.word	.LC3
	.word	.LC87
	.word	.LC88
	.word	.LC5
	.fnend
	.size	check_super_frame_smt, .-check_super_frame_smt
	.align	1
	.global	check_re_enc_smt
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	check_re_enc_smt, %function
check_re_enc_smt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r0
	ldr	r5, [r0, #60]
	mov	r7, r1
	ldr	r10, [r0, #284]
	ldr	r0, [r0, #356]
	bl	mpp_data_sum_v2
	mov	r1, r5
	bl	__aeabi_idiv
	mov	r1, #-1
	mul	r6, r0, r5
	mov	r8, r0
	ldr	r0, [r4, #356]
	bl	mpp_data_get_pre_val_v2
	ldr	r3, [r7, #24]
	mov	r1, r5
	subs	r0, r3, r0
	add	r0, r0, r6
	bl	__aeabi_idiv
	ldr	r3, .L492
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #1
	mov	r6, r0
	beq	.L454
	mov	r3, r4
	movw	r2, #985
	ldr	r1, .L492+4
	ldr	r0, .L492+8
	bl	printk
.L454:
	ldr	r3, [r9]
	lsls	r0, r3, #25
	bpl	.L455
	strd	r8, r6, [sp]
	movw	r2, #987
	ldr	r3, [r4, #52]
	ldr	r1, .L492+4
	ldr	r0, .L492+12
	bl	printk
.L455:
	ldr	r3, [r4, #156]
	ldr	r2, [r4, #612]
	cmp	r2, r3
	blt	.L456
.L458:
	movs	r5, #0
.L453:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L456:
	ldr	r2, [r4, #616]
	cmp	r2, r3
	bcs	.L458
	mov	r1, r7
	mov	r0, r4
	bl	check_super_frame_smt
	mov	r5, r0
	cmp	r0, #0
	bne	.L466
	ldr	r3, [r4, #204]
	cbz	r3, .L459
	ldr	r3, [r4, #292]
	cmp	r3, #0
	beq	.L458
.L459:
	ldr	r3, [r9]
	lsls	r1, r3, #22
	bpl	.L460
	str	r10, [sp]
	movw	r2, #1001
	ldr	r3, [r4, #176]
	ldr	r1, .L492+4
	ldr	r0, .L492+16
	bl	printk
.L460:
	ldr	r3, [r4, #176]
	ldr	r2, [r9]
	cbz	r3, .L461
	cmp	r10, #0
	bne	.L461
	ldr	r0, [r4, #180]
	lsls	r2, r2, #22
	add	r1, r0, #100
	ldr	r0, [r4, #56]
	mul	r0, r0, r1
	ldr	r1, .L492+20
	umull	r0, r1, r0, r1
	lsr	r5, r1, #5
	bpl	.L462
	ldr	r2, [r4, #52]
	strd	r5, r6, [sp, #4]
	ldr	r1, .L492+4
	str	r2, [sp]
	movw	r2, #1005
	ldr	r0, .L492+24
	bl	printk
.L462:
	cmp	r6, r5
	mov	r5, #-1
	it	le
	movle	r5, #0
	b	.L453
.L461:
	cmp	r10, #0
	beq	.L463
	cmp	r10, #2
	bne	.L467
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	add	r3, r3, r3, lsr #31
	asrs	r3, r3, #1
.L464:
	ldr	r1, [r7, #24]
	cmp	r1, r3
	ble	.L465
	ldr	r3, [r4, #56]
	sub	r1, r3, r3, asr #3
	cmp	r1, r6
	bge	.L465
	ldr	r0, .L492+28
	asrs	r5, r3, #31
	sub	r6, r6, r8
	smull	r0, r1, r3, r0
	rsb	r5, r5, r1, asr #3
	cmp	r5, r6
	mov	r5, #-1
	it	ge
	movge	r5, #0
.L465:
	lsls	r3, r2, #31
	bpl	.L453
	str	r5, [sp]
	mov	r3, r4
	movw	r2, #1026
	ldr	r1, .L492+4
	ldr	r0, .L492+32
	bl	printk
	b	.L453
.L463:
	ldr	r3, [r7, #4]
	add	r3, r3, r3, lsl #1
	b	.L464
.L467:
	movs	r3, #0
	b	.L464
.L466:
	mov	r5, #-1
	b	.L453
.L493:
	.align	2
.L492:
	.word	rc_debug
	.word	.LANCHOR0+820
	.word	.LC3
	.word	.LC89
	.word	.LC90
	.word	1374389535
	.word	.LC91
	.word	1717986919
	.word	.LC92
	.fnend
	.size	check_re_enc_smt, .-check_re_enc_smt
	.align	1
	.global	rc_model_v2_smt_check_reenc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rc_model_v2_smt_check_reenc, %function
rc_model_v2_smt_check_reenc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L536
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r4, r0
	ldr	r2, [r3]
	mov	r5, r1
	add	r6, r1, #160
	mov	r8, r3
	tst	r2, #1
	beq	.L495
	mov	r3, r0
	str	r6, [sp]
	movw	r2, #1037
	ldr	r1, .L536+4
	ldr	r0, .L536+8
	bl	printk
.L495:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bfc	r3, #2, #1
	strb	r3, [r5, #156]
	ldr	r3, [r4, #8]
	cmp	r3, #2
	beq	.L497
	ldr	r3, [r5, #264]
	lsls	r2, r3, #31
	bmi	.L497
	ldr	r3, [r4, #620]
	cmp	r3, #0
	bne	.L497
	ldr	r3, [r4, #624]
	cmp	r3, #0
	bne	.L497
	mov	r1, r6
	mov	r0, r4
	bl	check_re_enc_smt
	cmp	r0, #0
	beq	.L499
	ldr	r3, [r4, #284]
	ldr	r7, [r4, #176]
	cmp	r3, #2
	ldr	r3, [r4, #184]
	ite	eq
	ldreq	r6, [r4, #192]
	ldrne	r6, [r4, #196]
	cbz	r3, .L502
	ldr	r2, [r4, #616]
	cmp	r3, r2
	it	ls
	movls	r7, #0
.L502:
	ldr	r3, [r8]
	lsls	r3, r3, #22
	bpl	.L503
	ldr	r3, [r4, #616]
	movw	r2, #1054
	ldr	r1, .L536+4
	ldr	r0, .L536+12
	str	r3, [sp]
	mov	r3, r7
	bl	printk
.L503:
	ldr	r2, [r8]
	cmp	r7, #1
	and	r2, r2, #512
	beq	.L504
	cmp	r7, #2
	beq	.L505
	ldr	r1, [r5, #184]
	lsls	r3, r6, #1
	cmp	r1, r3
	ble	.L510
	movs	r3, #3
.L534:
	str	r3, [r4, #632]
.L511:
	ldr	r1, [r4, #632]
	ldr	r3, [r5, #172]
	add	r3, r3, r1
	ldr	r1, [r5, #176]
	cmp	r3, r1
	bgt	.L513
	ldr	r3, [r4, #612]
	adds	r3, r3, #1
	str	r3, [r4, #612]
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r5, #156]
.L513:
	movs	r3, #0
	str	r3, [r4, #616]
	cbz	r2, .L497
	movw	r2, #1092
	ldr	r1, .L536+4
	ldr	r0, .L536+16
	b	.L535
.L504:
	ldr	r1, [r5, #184]
	lsls	r3, r6, #1
	cmp	r1, r3
	ble	.L507
	ldr	r3, [r4, #632]
	adds	r3, r3, #3
.L533:
	str	r3, [r4, #632]
.L508:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #5
	orr	r3, r3, #5
	strb	r3, [r5, #156]
	movs	r3, #1
	str	r3, [r4, #620]
	ldr	r3, [r4, #616]
	adds	r3, r3, #1
	str	r3, [r4, #616]
	cbz	r2, .L497
	ldr	r1, .L536+4
	movw	r2, #1069
	ldr	r0, .L536+20
.L535:
	bl	printk
.L497:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L507:
	add	r3, r3, r6
	add	r3, r3, r3, lsr #31
	cmp	r1, r3, asr #1
	ble	.L509
	ldr	r3, [r4, #632]
	adds	r3, r3, #2
	b	.L533
.L509:
	cmp	r1, r6
	ble	.L508
	ldr	r3, [r4, #632]
	adds	r3, r3, #1
	b	.L533
.L505:
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	bic	r3, r3, #20
	orr	r3, r3, #20
	strb	r3, [r5, #156]
	movs	r3, #1
	str	r3, [r4, #624]
	ldr	r3, [r4, #616]
	adds	r3, r3, #1
	str	r3, [r4, #616]
	cmp	r2, #0
	beq	.L497
	movw	r2, #1076
	ldr	r1, .L536+4
	ldr	r0, .L536+24
	b	.L535
.L510:
	add	r3, r3, r6
	add	r3, r3, r3, lsr #31
	cmp	r1, r3, asr #1
	ble	.L512
	movs	r3, #2
	b	.L534
.L512:
	cmp	r6, r1
	bge	.L511
	movs	r3, #1
	b	.L534
.L499:
	str	r0, [r4, #632]
	strd	r0, r0, [r4, #616]
	b	.L497
.L537:
	.align	2
.L536:
	.word	rc_debug
	.word	.LANCHOR0+837
	.word	.LC84
	.word	.LC93
	.word	.LC96
	.word	.LC94
	.word	.LC95
	.fnend
	.size	rc_model_v2_smt_check_reenc, .-rc_model_v2_smt_check_reenc
	.global	smt_h265e
	.global	smt_h264e
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.25793, %object
	.size	__func__.25793, 26
__func__.25793:
	.ascii	"rc_model_v2_smt_hal_start\000"
	.space	2
	.type	mb_num, %object
	.size	mb_num, 36
mb_num:
	.word	0
	.word	200
	.word	700
	.word	1200
	.word	2000
	.word	4000
	.word	8000
	.word	16000
	.word	20000
	.type	qscale2qp, %object
	.size	qscale2qp, 96
qscale2qp:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	16
	.byte	18
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	30
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	38
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	39
	.byte	40
	.byte	40
	.byte	40
	.byte	40
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	43
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	44
	.byte	45
	.byte	45
	.byte	45
	.byte	45
	.type	tab_bit, %object
	.size	tab_bit, 36
tab_bit:
	.word	3780
	.word	3570
	.word	3150
	.word	2940
	.word	2730
	.word	3780
	.word	2100
	.word	1680
	.word	2100
	.type	__func__.25514, %object
	.size	__func__.25514, 21
__func__.25514:
	.ascii	"calc_smt_debreath_qp\000"
	.type	strength_map.25513, %object
	.size	strength_map.25513, 36
strength_map.25513:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	6
	.byte	6
	.byte	6
	.byte	7
	.byte	7
	.byte	7
	.byte	8
	.byte	8
	.byte	8
	.byte	9
	.byte	9
	.byte	9
	.byte	10
	.byte	10
	.byte	10
	.byte	11
	.byte	11
	.byte	11
	.byte	12
	.byte	12
	.byte	12
	.type	intra_qp_map.25511, %object
	.size	intra_qp_map.25511, 8
intra_qp_map.25511:
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.type	inter_pqp1, %object
	.size	inter_pqp1, 52
inter_pqp1:
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	42
	.byte	42
	.byte	43
	.byte	43
	.byte	44
	.type	inter_pqp0, %object
	.size	inter_pqp0, 52
inter_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	21
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	26
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	29
	.byte	29
	.byte	30
	.byte	31
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	33
	.byte	34
	.byte	35
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.type	intra_pqp1, %object
	.size	intra_pqp1, 52
intra_pqp1:
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	51
	.byte	51
	.byte	51
	.type	intra_pqp0, %object
	.size	intra_pqp0, 156
intra_pqp0:
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	27
	.byte	28
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.byte	17
	.byte	17
	.byte	18
	.byte	18
	.byte	19
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.byte	32
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	14
	.byte	15
	.byte	15
	.byte	16
	.byte	16
	.byte	17
	.byte	17
	.byte	18
	.byte	16
	.byte	16
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	23
	.byte	24
	.byte	26
	.byte	28
	.byte	30
	.byte	31
	.byte	32
	.byte	33
	.byte	34
	.byte	34
	.byte	35
	.byte	35
	.byte	36
	.byte	36
	.byte	36
	.byte	36
	.byte	37
	.byte	37
	.byte	37
	.byte	38
	.type	__func__.25736, %object
	.size	__func__.25736, 22
__func__.25736:
	.ascii	"rc_model_v2_smt_start\000"
	.type	__func__.25798, %object
	.size	__func__.25798, 24
__func__.25798:
	.ascii	"rc_model_v2_smt_hal_end\000"
	.type	__func__.25435, %object
	.size	__func__.25435, 22
__func__.25435:
	.ascii	"bits_model_smt_deinit\000"
	.type	__func__.25475, %object
	.size	__func__.25475, 23
__func__.25475:
	.ascii	"rc_model_v2_smt_deinit\000"
.LC0:
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.type	__func__.25448, %object
	.size	__func__.25448, 20
__func__.25448:
	.ascii	"bits_model_smt_init\000"
	.type	__func__.25464, %object
	.size	__func__.25464, 26
__func__.25464:
	.ascii	"rc_model_v2_smt_h265_init\000"
	.type	__func__.25470, %object
	.size	__func__.25470, 26
__func__.25470:
	.ascii	"rc_model_v2_smt_h264_init\000"
	.type	__func__.25458, %object
	.size	__func__.25458, 22
__func__.25458:
	.ascii	"bits_model_update_smt\000"
	.type	__func__.25786, %object
	.size	__func__.25786, 20
__func__.25786:
	.ascii	"rc_model_v2_smt_end\000"
	.type	__func__.25745, %object
	.size	__func__.25745, 22
__func__.25745:
	.ascii	"check_super_frame_smt\000"
	.type	__func__.25758, %object
	.size	__func__.25758, 17
__func__.25758:
	.ascii	"check_re_enc_smt\000"
	.type	__func__.25771, %object
	.size	__func__.25771, 28
__func__.25771:
	.ascii	"rc_model_v2_smt_check_reenc\000"
	.space	3
	.type	smt_h265e, %object
	.size	smt_h265e, 48
smt_h265e:
	.word	.LC21
	.word	16777220
	.word	640
	.word	rc_model_v2_smt_h265_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.type	smt_h264e, %object
	.size	smt_h264e, 48
smt_h264e:
	.word	.LC21
	.word	7
	.word	640
	.word	rc_model_v2_smt_h264_init
	.word	rc_model_v2_smt_deinit
	.word	0
	.word	rc_model_v2_smt_check_reenc
	.word	rc_model_v2_smt_start
	.word	rc_model_v2_smt_end
	.word	rc_model_v2_smt_hal_start
	.word	rc_model_v2_smt_hal_end
	.word	rc_model_v2_smt_proc_show
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC1:
	.ascii	"\0016%s:%d: qp [%d %d %d] add %d\012\000"
.LC2:
	.ascii	"\0016%s:%d: smt_hal_start enter ctx %p task %p\012\000"
.LC3:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC4:
	.ascii	"\0016%s:%d: i qp_out %d, qp_start_sum = %d, intra_l"
	.ascii	"v4_prop %d\000"
.LC5:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC6:
	.ascii	"\012--------RC base param--------------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC7:
	.ascii	"Gop\000"
.LC8:
	.ascii	"ChnId\000"
.LC9:
	.ascii	"%7s|%7s|%8s|%6s|%6s|%8s|%13s|%13s|%5s|%5s \012\000"
.LC10:
	.ascii	"PQp\000"
.LC11:
	.ascii	"IQp\000"
.LC12:
	.ascii	"MaxBr(kbps)\000"
.LC13:
	.ascii	"MinBr(kbps)\000"
.LC14:
	.ascii	"RcMode\000"
.LC15:
	.ascii	"TrgFr\000"
.LC16:
	.ascii	"ViFr\000"
.LC17:
	.ascii	"StatTm\000"
.LC18:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13s|%13s|%5u|%5u \012\000"
.LC19:
	.ascii	"N/A\000"
.LC20:
	.ascii	"%7d|%7u|%8u|%6u|%6u|%8s|%13u|%13u|%5s|%5s \012\000"
.LC21:
	.ascii	"smart\000"
.LC22:
	.ascii	"\012--------RC run comm param 1--------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC23:
	.ascii	"bLost\000"
.LC24:
	.ascii	"%7s|%8s|%12s|%12s|%10s \012\000"
.LC25:
	.ascii	"EncGap\000"
.LC26:
	.ascii	"LostFrmStr\000"
.LC27:
	.ascii	"LostThr\000"
.LC28:
	.ascii	"%7d|%8s|%12u|%12d|%10u \012\000"
.LC29:
	.ascii	"\012--------RC run comm param 2--------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC30:
	.ascii	"SprFrmMod\000"
.LC31:
	.ascii	"%7s|%12s|%12s|%12s|%12s \012\000"
.LC32:
	.ascii	"RCPriority\000"
.LC33:
	.ascii	"SprPFrm\000"
.LC34:
	.ascii	"SprIFrm\000"
.LC35:
	.ascii	"%7d|%12s|%12u|%12u|%12u \012\000"
.LC36:
	.ascii	"\012--------RC gop mode attr-----------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC37:
	.ascii	"GopMode\000"
.LC38:
	.ascii	"%7s|%10s|%10s|%12s|%10s \012\000"
.LC39:
	.ascii	"ViQpDelta\000"
.LC40:
	.ascii	"BgInterval\000"
.LC41:
	.ascii	"IpQpDelta\000"
.LC42:
	.ascii	"%7d|%10s|%10d|%12u|%10d\012\000"
.LC43:
	.ascii	"%7d|%10s|%10d|%12s|%10s\012\000"
.LC44:
	.ascii	"\012--------RC run smart common param--------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC45:
	.ascii	"MaxQp\000"
.LC46:
	.ascii	"%7s|%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s|%15s\012\000"
.LC47:
	.ascii	"MaxReEncTimes\000"
.LC48:
	.ascii	"FrmMinIQp\000"
.LC49:
	.ascii	"FrmMaxIQp\000"
.LC50:
	.ascii	"FrmMinQp\000"
.LC51:
	.ascii	"FrmMaxQp\000"
.LC52:
	.ascii	"MinIQp\000"
.LC53:
	.ascii	"MaxIQp\000"
.LC54:
	.ascii	"MinQp\000"
.LC55:
	.ascii	"%7d|%8u|%8u|%8u|%8u|%10d|%10d|%10d|%10d|%15d\012\000"
.LC56:
	.ascii	"\012--------RC HierarchicalQp INFO-----------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC57:
	.ascii	"bEnable\000"
.LC58:
	.ascii	"%7s|%10s|%12s|%12s|%12s|%12s|%12s|%12s|%12s|%12s\012"
	.ascii	"\000"
.LC59:
	.ascii	"QpDelta[3]\000"
.LC60:
	.ascii	"QpDelta[2]\000"
.LC61:
	.ascii	"QpDelta[1]\000"
.LC62:
	.ascii	"QpDelta[0]\000"
.LC63:
	.ascii	"FrameNum[3]\000"
.LC64:
	.ascii	"FrameNum[2]\000"
.LC65:
	.ascii	"FrameNum[1]\000"
.LC66:
	.ascii	"FrameNum[0]\000"
.LC67:
	.ascii	"%7d|%10s|%12d|%12d|%12d|%12d|%12d|%12d|%12d|%12d\012"
	.ascii	"\000"
.LC68:
	.ascii	"\012--------RC debreath_effect info----------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC69:
	.ascii	"%7s|%10s|%10s|%18s\012\000"
.LC70:
	.ascii	"DeBrthEfctCnt\000"
.LC71:
	.ascii	"Strength0\000"
.LC72:
	.ascii	"%7d|%10s|%10d|%18u\012\000"
.LC73:
	.ascii	"%7d|%10s|%10s|%18u\012\000"
.LC74:
	.ascii	"\012--------RC run smart info1---------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"-----\012\000"
.LC75:
	.ascii	"RealBt(kb)\000"
.LC76:
	.ascii	"%7s|%12s|%10s|%10s|%15s|%15s|%12s\012\000"
.LC77:
	.ascii	"scene_mode\000"
.LC78:
	.ascii	"md_switch_qp\000"
.LC79:
	.ascii	"md_switch_en\000"
.LC80:
	.ascii	"StartQp\000"
.LC81:
	.ascii	"IPRatio\000"
.LC82:
	.ascii	"%7d|%12u|%10d|%10u|%15d|%15d|%12d\012\000"
.LC83:
	.ascii	"\0016%s:%d: smt_hal_end enter ctx %p task %p\012\000"
.LC84:
	.ascii	"\0016%s:%d: enter ctx %p cfg %p\012\000"
.LC85:
	.ascii	"\0016%s:%d: motion_level %u, complex_level %u\012\000"
.LC86:
	.ascii	"\0016%s:%d: bits_mode_update real_bit %d\000"
.LC87:
	.ascii	"\0016%s:%d: super frame drop current frame\000"
.LC88:
	.ascii	"\0016%s:%d: bit real %d >= bit thd %d\012\000"
.LC89:
	.ascii	"\0016%s:%d: reenc check target_bps %d last_ins_bps "
	.ascii	"%d ins_bps %d\000"
.LC90:
	.ascii	"\0016%s:%d: drop mode %d frame_type %d\012\000"
.LC91:
	.ascii	"\0016%s:%d: drop mode %d check max_bps %d bit_thr %"
	.ascii	"d ins_bps %d\000"
.LC92:
	.ascii	"\0016%s:%d: leave %p ret %d\012\000"
.LC93:
	.ascii	"\0016%s:%d: reenc drop_mode %d drop_cnt %d\012\000"
.LC94:
	.ascii	"\0016%s:%d: drop\012\000"
.LC95:
	.ascii	"\0016%s:%d: force_pskip\012\000"
.LC96:
	.ascii	"\0016%s:%d: drop disable\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
