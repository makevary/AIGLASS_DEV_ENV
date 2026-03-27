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
	.file	"hal_h264e_vepu500.c"
	.text
	.syntax unified
	.syntax unified
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_ret_task, %function
hal_h264e_vepu500_ret_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [r0, #64]
	mov	r5, r0
	mov	r10, r1
	ldr	r4, [r0, #204]
	ldr	r6, [r1, #4]
	ldr	r2, [r3, #60]
	ldr	r8, [r3, #64]
	ldr	r3, .L100
	str	r2, [sp, #24]
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #2
	beq	.L2
	mov	r3, r0
	movw	r2, #2727
	ldr	r1, .L100+4
	ldr	r0, .L100+8
	bl	printk
.L2:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r7, r3, #30
	bpl	.L3
	ldr	r3, [r9]
	lsls	r0, r3, #28
	bpl	.L3
	movw	r2, #2628
	ldr	r1, .L100+12
	ldr	r0, .L100+16
	bl	printk
.L3:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L4
	ldr	r3, [r9]
	lsls	r2, r3, #28
	bpl	.L4
	movw	r2, #2631
	ldr	r1, .L100+12
	ldr	r0, .L100+20
	bl	printk
.L4:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r3, r3, #28
	bpl	.L5
	ldr	r3, [r9]
	lsls	r7, r3, #28
	bpl	.L5
	movw	r2, #2634
	ldr	r1, .L100+12
	ldr	r0, .L100+24
	bl	printk
.L5:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r0, r3, #29
	bpl	.L6
	ldr	r3, [r9]
	lsls	r1, r3, #28
	bpl	.L6
	movw	r2, #2637
	ldr	r1, .L100+12
	ldr	r0, .L100+28
	bl	printk
.L6:
	ldrb	r7, [r4, #44]	@ zero_extendqisi2
	ands	r7, r7, #16
	beq	.L7
	ldr	r3, [r9]
	lsls	r2, r3, #22
	bpl	.L40
	mov	r2, #2640
	ldr	r1, .L100+12
	ldr	r0, .L100+32
	bl	printk
.L40:
	mvn	r7, #100
.L7:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r3, r3, #26
	bpl	.L8
	ldr	r3, [r9]
	lsls	r0, r3, #28
	bpl	.L8
	movw	r2, #2645
	ldr	r1, .L100+12
	ldr	r0, .L100+36
	bl	printk
.L8:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	lsls	r1, r3, #25
	bpl	.L9
	ldr	r3, [r9]
	lsls	r2, r3, #22
	bpl	.L41
	movw	r2, #2648
	ldr	r1, .L100+12
	ldr	r0, .L100+40
	bl	printk
.L41:
	mov	r7, #-1
.L9:
	ldrb	r3, [r4, #45]	@ zero_extendqisi2
	lsls	r3, r3, #31
	bpl	.L10
	ldr	r3, [r9]
	lsls	r0, r3, #22
	bpl	.L42
	movw	r2, #2653
	ldr	r1, .L100+12
	ldr	r0, .L100+44
	bl	printk
.L42:
	mov	r7, #-1
.L10:
	ldrsb	r3, [r4, #44]
	cmp	r3, #0
	bge	.L11
	ldr	r3, [r9]
	lsls	r1, r3, #22
	bpl	.L43
	movw	r2, #2658
	ldr	r1, .L100+12
	ldr	r0, .L100+48
	bl	printk
.L43:
	mov	r7, #-1
	b	.L1
.L11:
	cmp	r7, #0
	bne	.L1
	ldrh	r3, [r4, #3932]
	ldrh	r1, [r4, #3924]
	ldrh	r2, [r4, #3964]
	add	r1, r1, r3
	ldrh	r3, [r4, #3940]
	ldrh	r9, [r4, #3976]
	add	r1, r1, r3
	ldrh	r3, [r4, #3948]
	adds	r3, r1, r3
	ldrh	r1, [r4, #3926]
	str	r3, [sp, #16]
	ldrh	r3, [r4, #3934]
	add	r1, r1, r3
	ldrh	r3, [r4, #3942]
	add	r1, r1, r3
	ldrh	r3, [r4, #3950]
	adds	r3, r1, r3
	ldrh	r1, [r4, #3928]
	str	r3, [sp, #4]
	ldrh	r3, [r4, #3936]
	add	r1, r1, r3
	ldrh	r3, [r4, #3944]
	add	r1, r1, r3
	ldrh	r3, [r4, #3952]
	adds	r3, r1, r3
	ldrh	r1, [r4, #3930]
	str	r3, [sp, #8]
	ldrh	r3, [r4, #3938]
	add	r1, r1, r3
	ldrh	r3, [r4, #3946]
	add	r1, r1, r3
	ldrh	r3, [r4, #3954]
	adds	r3, r1, r3
	str	r3, [sp, #12]
	ldrh	r3, [r4, #3956]
	ldrh	r1, [r4, #3980]
	add	r3, r3, r2
	ldrh	r2, [r4, #3972]
	add	r3, r3, r2
	ldrh	r2, [r4, #3966]
	add	r3, r3, r1
	str	r3, [sp, #20]
	ldrh	r3, [r4, #3958]
	ldrh	r1, [r4, #3982]
	add	r3, r3, r2
	ldrh	r2, [r4, #3974]
	add	r3, r3, r2
	ldrh	r2, [r4, #3968]
	add	r3, r3, r1
	ldrh	r1, [r4, #3960]
	add	r1, r1, r2
	add	r1, r1, r9
	ldrh	r9, [r4, #3984]
	ldr	r2, [r5, #244]
	add	fp, r1, r9
	ldrh	r1, [r4, #3970]
	ldrh	r9, [r4, #3962]
	add	r9, r9, r1
	ldrh	r1, [r4, #3978]
	add	r9, r9, r1
	ldrh	r1, [r4, #3986]
	add	r9, r9, r1
	cbz	r2, .L13
	movs	r2, #11
	mul	r1, r2, fp
	movs	r2, #12
	mla	r2, r2, r9, r1
	add	r2, r2, r3, lsl #3
.L95:
	ldr	r1, [sp, #24]
	mov	ip, #6
	ldr	r0, [sp, #12]
	lsrs	r2, r2, #2
	mul	r8, r8, r1
	ldr	r1, [sp, #8]
	add	r1, r1, r1, lsl #2
	mla	r1, ip, r0, r1
	ldr	r0, [sp, #4]
	rsb	ip, r8, r8, lsl #4
	add	r1, r1, r0, lsl #2
	movs	r0, #100
	muls	r2, r0, r2
	lsrs	r1, r1, #2
	cmp	r2, ip
	bls	.L15
	movs	r2, #200
.L96:
	str	r2, [r6, #204]
	b	.L16
.L13:
	movs	r2, #22
	mul	r1, r2, fp
	movs	r2, #24
	mla	r2, r2, r9, r1
	add	r1, r3, r3, lsl #4
	add	r2, r2, r1
	b	.L95
.L101:
	.align	2
.L100:
	.word	hal_h264e_debug
	.word	.LANCHOR0
	.word	.LC1
	.word	.LANCHOR0+27
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
.L15:
	add	ip, r8, r8, lsl #2
	cmp	r2, ip
	bls	.L17
	str	r0, [r6, #204]
.L16:
	movs	r2, #100
	muls	r1, r2, r1
	movs	r2, #30
	mul	r2, r2, r8
	cmp	r1, r2
	bls	.L19
	movs	r2, #2
.L97:
	str	r2, [r6, #208]
	mov	r1, r8
	ldr	r2, [r4, #3732]
	str	r3, [sp, #28]
	str	r2, [r10, #44]
	lsls	r3, r2, #3
	str	r3, [r6, #184]
	ldr	r0, [r4, #3744]
	str	r3, [sp, #24]
	bl	__aeabi_uidiv
	str	r0, [r6, #188]
	ldrb	r2, [r4, #872]	@ zero_extendqisi2
	ldrb	ip, [r4, #873]	@ zero_extendqisi2
	ldr	r3, [sp, #4]
	add	r0, r2, ip
	ldrb	r1, [r4, #874]	@ zero_extendqisi2
	muls	r0, r3, r0
	ldr	r3, [sp, #12]
	mul	lr, r3, r1
	ldr	r3, [sp, #16]
	add	r1, r1, ip
	mla	r2, r3, r2, lr
	ldr	r3, [sp, #8]
	muls	r1, r3, r1
	add	r0, r2, r0, lsr #1
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #4]
	add	r0, r0, r1, lsr #1
	adds	r1, r3, r2
	ldr	r3, [sp, #8]
	add	r1, r1, r3
	ldr	r3, [sp, #12]
	adds	r1, r1, r3
	ldr	r3, [sp, #28]
	bne	.L22
	str	r0, [r6, #192]
.L23:
	ldrh	r2, [r4, #876]
	ldrh	ip, [r4, #878]
	ubfx	r2, r2, #0, #12
	ldrh	r1, [r4, #880]
	ubfx	ip, ip, #0, #12
	add	r0, r2, ip
	ubfx	r1, r1, #0, #12
	muls	r0, r3, r0
	mul	lr, r9, r1
	add	r1, r1, ip
	mul	r1, fp, r1
	str	r0, [sp, #4]
	ldr	r0, [sp, #20]
	mla	r2, r0, r2, lr
	ldr	r0, [sp, #4]
	add	r0, r2, r0, lsr #1
	ldr	r2, [sp, #20]
	add	r0, r0, r1, lsr #1
	add	r3, r3, r2
	add	r1, r3, fp
	adds	r1, r1, r9
	bne	.L24
.L98:
	str	r0, [r6, #196]
	mov	r1, r8
	ldr	r0, [r4, #3888]
	ldr	r3, [r4, #3884]
	ubfx	r0, r0, #0, #23
	ubfx	r3, r3, #0, #23
	add	r0, r0, r3
	ldr	r3, [r4, #3880]
	ubfx	r3, r3, #0, #21
	add	r0, r0, r3
	lsls	r0, r0, #8
	bl	__aeabi_uidiv
	ldr	r3, [sp, #24]
	str	r0, [r6, #200]
	str	r3, [r5, #104]
	ldr	r3, [r6, #188]
	str	r3, [r5, #108]
	ldr	r3, [r6, #200]
	str	r3, [r5, #120]
	ldrd	r2, r3, [r10, #44]
	add	r3, r3, r2
	str	r3, [r10, #48]
	add	r3, r5, #80
	str	r3, [r10, #24]
	movs	r3, #1
	str	r3, [r10, #20]
	str	r8, [r5, #536]
	ldrh	r3, [r4, #3912]
	ubfx	r3, r3, #0, #10
	str	r3, [r5, #544]
	ldrh	r0, [r4, #3914]
	ubfx	r0, r0, #0, #10
	str	r0, [r5, #548]
	ldrh	r1, [r4, #3916]
	add	r3, r3, r0
	ubfx	r1, r1, #0, #10
	str	r1, [r5, #552]
	ldrh	r2, [r4, #3918]
	add	r3, r3, r1
	ubfx	r2, r2, #0, #10
	str	r2, [r5, #556]
	add	r3, r3, r2
	str	r3, [r5, #560]
	ldr	r3, [r5, #224]
	ldr	r3, [r3, #44]
	str	r3, [r5, #260]
	ldr	r3, [r10, #4]
	ldr	r2, [r3, #160]
	ldr	r3, [r3, #184]
	ldr	r0, [r5, #884]	@ unaligned
	ldrh	r1, [r5, #888]	@ unaligned
	cmp	r2, r3
	str	r0, [r5, #564]	@ unaligned
	ldrsb	r4, [r5, #567]
	ldrsb	r6, [r5, #566]
	ldrsb	r0, [r5, #565]
	ldrsb	ip, [r5, #564]
	strh	r1, [r5, #568]	@ unaligned
	strb	r6, [r5, #567]
	strb	r4, [r5, #568]
	strb	r0, [r5, #566]
	strb	ip, [r5, #565]
	ble	.L26
	movs	r1, #6
	muls	r1, r3, r1
	it	mi
	addmi	r1, r1, #3
	cmp	r2, r1, asr #2
	bgt	.L44
	adds	r1, r3, r3, lsl #2
	it	mi
	addmi	r1, r1, #3
	cmp	r2, r1, asr #2
	bgt	.L45
	adds	r1, r3, r3, lsl #3
	it	mi
	addmi	r1, r1, #7
	asrs	r1, r1, #3
	cmp	r1, r2
	ite	ge
	movge	r2, #0
	movlt	r2, #1
.L27:
	strb	r2, [r5, #564]
.L31:
	add	r3, r0, ip
	ldrsb	r2, [r5, #564]
	add	r3, r3, r6
	add	r3, r3, r4
	add	r3, r3, r2
	ldr	r2, [r10, #4]
	ldrb	r2, [r2, #152]	@ zero_extendqisi2
	lsls	r2, r2, #27
	itt	mi
	movmi	r2, #0
	strbmi	r2, [r5, #569]
	cmn	r3, #9
	bge	.L37
	movs	r3, #2
.L99:
	strb	r3, [r5, #569]
.L38:
	ldr	r3, .L102
	ldr	r3, [r3]
	lsls	r3, r3, #30
	bpl	.L1
	mov	r3, r5
	movw	r2, #2841
	ldr	r1, .L102+4
	ldr	r0, .L102+8
	bl	printk
.L1:
	mov	r0, r7
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L17:
	cmp	r2, r8, lsr #2
	ite	ls
	movls	r2, #0
	movhi	r2, #1
	b	.L96
.L19:
	movs	r2, #13
	mul	r2, r2, r8
	cmp	r1, r2
	ite	ls
	movls	r2, #0
	movhi	r2, #1
	b	.L97
.L22:
	str	r3, [sp, #4]
	bl	__aeabi_uidiv
	str	r0, [r6, #192]
	ldr	r3, [sp, #4]
	b	.L23
.L24:
	bl	__aeabi_uidiv
	b	.L98
.L44:
	movs	r2, #3
	b	.L27
.L45:
	movs	r2, #2
	b	.L27
.L26:
	cmp	r3, r2, lsl #1
	bgt	.L46
	rsbs	r1, r2, r2, lsl #3
	it	mi
	addmi	r1, r1, #3
	cmp	r3, r1, asr #2
	bgt	.L47
	movs	r1, #6
	muls	r1, r2, r1
	it	mi
	addmi	r1, r1, #3
	cmp	r3, r1, asr #2
	bgt	.L48
	adds	r2, r2, r2, lsl #2
	it	mi
	addmi	r2, r2, #3
	cmp	r3, r2, asr #2
	ite	gt
	mvngt	r3, #1
	movle	r3, #-1
.L32:
	strb	r3, [r5, #564]
	b	.L31
.L46:
	mvn	r3, #4
	b	.L32
.L47:
	mvn	r3, #3
	b	.L32
.L48:
	mvn	r3, #2
	b	.L32
.L37:
	adds	r3, r3, #2
	bge	.L38
	ldrsb	r3, [r5, #569]
	cmp	r3, #1
	bgt	.L38
	movs	r3, #1
	b	.L99
.L103:
	.align	2
.L102:
	.word	hal_h264e_debug
	.word	.LANCHOR0
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_ret_task, .-hal_h264e_vepu500_ret_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_comb_ret_task, %function
hal_h264e_vepu500_comb_ret_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r6, .L119
	mov	r5, r0
	mov	r4, r2
	ldr	r8, [r2, #4]
	ldr	r9, [r0, #204]
	ldr	r3, [r6]
	lsls	r1, r3, #30
	bpl	.L105
	mov	r3, r0
	movw	r2, #2882
	ldr	r1, .L119+4
	ldr	r0, .L119+8
	bl	printk
.L105:
	mov	r1, r7
	mov	r0, r5
	bl	hal_h264e_vepu500_ret_task
	mov	r7, r0
	cbnz	r0, .L104
	ldrb	r3, [r9, #45]	@ zero_extendqisi2
	lsls	r2, r3, #26
	itt	mi
	movmi	r3, #1
	strmi	r3, [r4, #80]
	ldr	r3, [r4, #44]
	ldr	r2, [r9, #3832]
	add	r3, r3, r2
	ldr	r2, [r4, #48]
	str	r3, [r4, #44]
	add	r2, r2, r3
	lsls	r3, r3, #3
	str	r2, [r4, #48]
	str	r3, [r8, #184]
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L104
	mov	r3, r5
	mov	r2, #2896
	ldr	r1, .L119+4
	ldr	r0, .L119+12
	bl	printk
.L104:
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L120:
	.align	2
.L119:
	.word	hal_h264e_debug
	.word	.LANCHOR0+58
	.word	.LC1
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_comb_ret_task, .-hal_h264e_vepu500_comb_ret_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_start, %function
hal_h264e_vepu500_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r7, .L146
	.pad #28
	sub	sp, sp, #28
	ldr	r6, [r0, #204]
	ldr	r2, [r7]
	lsls	r4, r2, #30
	bpl	.L122
	mov	r3, r0
	movw	r2, #2570
	ldr	r1, .L146+4
	ldr	r0, .L146+8
	bl	printk
.L122:
	movs	r1, #0
	add	r2, sp, #12
	ldr	r0, [r5, #4]
	movs	r3, #100
	str	r6, [sp, #12]
	strd	r3, r1, [sp, #16]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L123
	ldr	r3, .L146+12
	movw	r2, #2598
	str	r0, [sp]
.L143:
	ldr	r1, .L146+4
	ldr	r0, .L146+16
.L144:
	bl	printk
.L121:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L123:
	add	r3, r6, #100
	mov	r0, #672
	str	r3, [sp, #12]
	mov	r1, r4
	mov	r3, #624
	add	r2, sp, #12
	strd	r0, r3, [sp, #16]
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L125
	str	r0, [sp]
	movw	r2, #2599
	ldr	r3, .L146+20
	b	.L143
.L125:
	add	r3, r6, #772
	mov	r1, #272
	str	r3, [sp, #12]
	add	r2, sp, #12
	mov	r3, #4096
	strd	r1, r3, [sp, #16]
	mov	r1, r0
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L126
	str	r0, [sp]
	movw	r2, #2600
	ldr	r3, .L146+24
	b	.L143
.L126:
	addw	r3, r6, #1044
	mov	r2, #720
	str	r3, [sp, #12]
	mov	r1, r0
	mov	r3, #5888
	ldr	r0, [r5, #4]
	strd	r2, r3, [sp, #16]
	add	r2, sp, #12
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L127
	str	r0, [sp]
	movw	r2, #2601
	ldr	r3, .L146+28
	b	.L143
.L127:
	mov	r1, r0
	add	r2, sp, #12
	ldr	r0, [r5, #4]
	addw	r3, r6, #1764
	mov	lr, #368
	str	r3, [sp, #12]
	mov	r3, #8192
	strd	lr, r3, [sp, #16]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L128
	str	r0, [sp]
	movw	r2, #2602
	ldr	r3, .L146+32
	b	.L143
.L128:
	mov	r1, r0
	add	r2, sp, #12
	ldr	r0, [r5, #4]
	addw	r3, r6, #2132
	mov	ip, #1296
	str	r3, [sp, #12]
	mov	r3, #8704
	strd	ip, r3, [sp, #16]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L129
	str	r0, [sp]
	movw	r2, #2603
	ldr	r3, .L146+36
	b	.L143
.L129:
	addw	r3, r6, #3428
	mov	r0, #304
	str	r3, [sp, #12]
	mov	r1, r4
	mov	r3, #12288
	add	r2, sp, #12
	strd	r0, r3, [sp, #16]
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L130
	str	r0, [sp]
	movw	r2, #2604
	ldr	r3, .L146+40
	b	.L143
.L130:
	add	r3, r6, #44
	movs	r1, #4
	str	r3, [sp, #12]
	add	r2, sp, #12
	movs	r3, #44
	ldr	r0, [r5, #4]
	strd	r1, r3, [sp, #16]
	movs	r1, #1
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L131
	ldr	r3, .L146+44
	movw	r2, #2607
	str	r0, [sp]
.L145:
	ldr	r1, .L146+4
	ldr	r0, .L146+48
	b	.L144
.L131:
	mov	r2, #592
	mov	r3, #16384
	movs	r1, #1
	strd	r2, r3, [sp, #16]
	ldr	r0, [r5, #4]
	add	r2, sp, #12
	addw	r6, r6, #3732
	str	r6, [sp, #12]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L132
	str	r0, [sp]
	mov	r2, #2608
	ldr	r3, .L146+52
	b	.L145
.L132:
	mov	r2, r0
	movs	r1, #2
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	mov	r4, r0
	cbz	r0, .L133
	mov	r3, r0
	movw	r2, #2613
	ldr	r1, .L146+4
	ldr	r0, .L146+56
	bl	printk
.L133:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L121
	mov	r3, r5
	movw	r2, #2618
	ldr	r1, .L146+4
	ldr	r0, .L146+60
	bl	printk
	b	.L121
.L147:
	.align	2
.L146:
	.word	hal_h264e_debug
	.word	.LANCHOR0+90
	.word	.LC1
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
	.word	.LC22
	.word	.LC23
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_start, .-hal_h264e_vepu500_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_comb_start, %function
hal_h264e_vepu500_comb_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, r2
	ldr	r3, [r0]
	.pad #56
	sub	sp, sp, #56
	ldr	r5, .L165
	mov	r4, r0
	mov	r8, r1
	ldr	r6, [r0, #204]
	ldr	r9, [r3, #36]
	ldr	r3, [r5]
	lsls	r2, r3, #30
	bpl	.L149
	mov	r3, r0
	movw	r2, #2855
	ldr	r1, .L165+4
	ldr	r0, .L165+8
	bl	printk
.L149:
	ldrb	r3, [r6, #48]	@ zero_extendqisi2
	add	r10, sp, #28
	mov	r1, r9
	movs	r2, #7
	mov	r0, r10
	bfi	r3, r2, #0, #4
	strb	r3, [r6, #48]
	addw	r9, r6, #3044
	bl	vepu5xx_set_fmt
	ldr	r3, [r4, #4]
	str	r3, [sp]
	mov	r0, sp
	ldr	r3, [r4, #204]
	strd	r9, r7, [sp, #8]
	add	r3, r3, #500
	str	r3, [sp, #4]
	ldr	r3, [r4, #232]
	str	r10, [sp, #16]
	str	r3, [sp, #20]
	bl	vepu500_set_jpeg_reg
	ldr	r1, [r7, #76]
	cbz	r1, .L150
	mov	r2, #384
	mov	r0, r9
	bl	memcpy
.L150:
	ldr	r1, [r7, #72]
	cbz	r1, .L151
	mov	r2, #304
	addw	r0, r6, #3428
	bl	memcpy
.L151:
	ldr	r3, [r5]
	lsls	r3, r3, #30
	bpl	.L152
	mov	r3, r4
	movw	r2, #2870
	ldr	r1, .L165+4
	ldr	r0, .L165+12
	bl	printk
.L152:
	mov	r1, r8
	mov	r0, r4
	bl	hal_h264e_vepu500_start
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L166:
	.align	2
.L165:
	.word	hal_h264e_debug
	.word	.LANCHOR0+114
	.word	.LC1
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_comb_start, .-hal_h264e_vepu500_comb_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_get_task, %function
hal_h264e_vepu500_get_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	ldr	r5, [r1, #16]
	.pad #52
	sub	sp, sp, #52
	ldr	r3, [r1, #12]
	mov	r4, r0
	ldr	r6, .L262
	adds	r5, r5, #8
	ldr	fp, .L262+40
	mov	r8, r1
	ldr	r7, .L262+4
	mov	r10, r9
	str	r3, [sp, #16]
.L168:
	ldr	r3, [sp, #16]
	cmp	r3, r9
	bgt	.L186
	ldr	r3, .L262+4
	ldr	r5, [r8, #4]
	ldr	r3, [r3]
	lsls	r0, r3, #30
	bpl	.L187
	mov	r3, r4
	movw	r2, #617
	ldr	r1, .L262+8
	ldr	r0, .L262+12
	bl	printk
.L187:
	ldr	r3, [r8, #68]
	str	r3, [r4, #232]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_roi
	str	r0, [r4, #184]
	ldr	r0, [r8, #52]
	bl	mpp_frame_get_osd
	str	r0, [r4, #196]
	ldrb	r3, [r5, #156]	@ zero_extendqisi2
	lsls	r1, r3, #29
	bmi	.L188
	tst	r10, #1
	beq	.L190
	ldr	r2, [r4]
	ldr	r1, .L262+16
	ldr	r5, [r2, #16]
	ldr	r6, [r2, #12]
	adds	r5, r5, #15
	bic	r5, r5, #15
	adds	r6, r6, #63
	bic	r9, r6, #63
	add	r3, r5, #16
	mul	r3, r9, r3
	cmp	r3, #0
	mov	r7, r3
	it	lt
	addlt	r7, r3, #63
	add	r3, r3, r3, lsl #1
	asrs	r7, r7, #6
	asr	fp, r3, #1
	mov	r3, r9
	muls	r3, r5, r3
	it	mi
	addmi	r3, r3, #15
	addw	r7, r7, #4095
	asrs	r3, r3, #4
	ands	r7, r7, r1
	addw	r3, r3, #4095
	add	r10, r7, fp
	ands	r3, r3, r1
	str	r3, [sp, #16]
	ldr	r3, [r4, #40]
	str	r3, [sp, #20]
	movw	r3, #4844
	ldr	r0, [r2, r3]
	cmp	r0, #0
	beq	.L218
	bl	mpp_enc_ref_cfg_get_cpb_info
	ldr	r3, [r0]
	add	r8, r3, #1
	ldr	r3, [r0, #4]
	cmp	r8, #2
	it	lt
	movlt	r8, #2
	str	r3, [sp, #24]
.L193:
	cmp	r9, #2880
	ble	.L195
	asrs	r3, r6, #6
	movs	r6, #53
	muls	r6, r3, r6
	ldr	r3, [r4, #236]
	sub	r6, r6, #1840
	ldr	r3, [r3, #8]
	asrs	r6, r6, #4
	lsls	r6, r6, #8
	cmp	r3, #0
	beq	.L196
	str	r3, [r4, #228]
.L197:
	str	r6, [r4, #56]
.L199:
	addw	r3, r9, #1023
	mov	r2, r9
	asrs	r3, r3, #10
	muls	r3, r5, r3
	addw	r5, r5, #1023
	it	mi
	addmi	r3, r3, #15
	bic	r3, r3, #15
	asrs	r5, r5, #10
	muls	r2, r5, r2
	mov	r5, r2
	it	mi
	addmi	r5, r5, #15
	bic	r5, r5, #15
	cmp	r5, r3
	it	cc
	movcc	r5, r3
	ldr	r3, [r4, #20]
	cmp	r7, r3
	bne	.L203
	ldr	r3, [r4, #24]
	cmp	fp, r3
	bne	.L203
	ldr	r3, [r4, #32]
	cmp	r10, r3
	bne	.L203
	ldr	r3, [r4, #36]
	ldr	r2, [sp, #16]
	cmp	r2, r3
	bne	.L203
	ldr	r3, [r4, #1000]
	cmp	r5, r3
	bne	.L203
	ldr	r3, [sp, #20]
	cmp	r3, r8
	bge	.L190
.L203:
	movs	r2, #16
	movs	r1, #0
	add	r0, sp, #32
	bl	memset
	ldr	r3, .L262+4
	ldr	r3, [r3]
	lsls	r2, r3, #28
	bpl	.L205
	ldr	r3, [sp, #20]
	movw	r2, #513
	str	r8, [sp, #8]
	ldr	r1, .L262+20
	strd	r10, r3, [sp]
	ldr	r0, .L262+24
	ldr	r3, [r4, #32]
	bl	printk
.L205:
	ldr	r3, [sp, #20]
	strd	r7, fp, [r4, #20]
	cmp	r3, r8
	it	lt
	movlt	r3, r8
	mov	r8, r3
	ldr	r3, [r4, #236]
	ldr	r3, [r3]
	cbnz	r3, .L206
	add	r0, r4, #16
	bl	hal_bufs_init
.L206:
	ldr	r3, [r4, #896]
	cmp	r3, #0
	beq	.L207
	movs	r3, #0
	str	r3, [sp, #44]
	ldr	r3, [r4]
	movs	r0, #48
	movs	r1, #240
	ldr	r6, .L262+16
	ldr	r2, [r3, #28]
	ldr	r3, [r3, #32]
	adds	r2, r2, #63
	adds	r3, r3, #63
	bic	r2, r2, #63
	bic	r3, r3, #63
	cmp	r2, r3
	mul	r7, r3, r2
	it	lt
	movlt	r2, r3
	muls	r0, r2, r0
	muls	r1, r2, r1
	add	r3, r7, r7, lsl #1
	cmp	r7, #0
	it	lt
	addlt	r7, r7, #63
	addw	r0, r0, #4095
	add	r0, r0, r3, asr #1
	asrs	r3, r2, #1
	add	r2, r2, r2, lsl #1
	add	r7, r3, r7, asr #6
	addw	r3, r2, #4095
	ldr	r2, [sp, #24]
	addw	r1, r1, #4095
	addw	r7, r7, #4095
	ands	r0, r0, r6
	ands	r7, r7, r6
	ands	r1, r1, r6
	ands	r3, r3, r6
	cmp	r2, #0
	add	r1, r1, r0
	add	r3, r3, r7
	str	r0, [r4, #992]
	str	r1, [r4, #996]
	add	r6, r1, r3
	str	r7, [r4, #944]
	str	r3, [r4, #948]
	ble	.L209
	ldr	r2, [r4, #252]
	strd	r0, r1, [r4, #968]
	strd	r7, r3, [r4, #920]
	cbz	r2, .L210
	str	r0, [r4, #972]
	str	r7, [r4, #924]
.L210:
	ldr	r0, [r4, #924]
	ldr	r2, [r4, #972]
	add	r3, r3, r0
	str	r3, [r4, #952]
	adds	r7, r2, r0
	add	r2, r2, r3
	add	r6, r6, r7
	add	r1, r1, r2
	movs	r7, #0
	str	r0, [r4, #928]
	strd	r7, r0, [r4, #904]
	str	r7, [r4, #912]
	strd	r3, r0, [r4, #932]
	strd	r2, r3, [r4, #956]
	str	r2, [r4, #976]
	strd	r1, r2, [r4, #980]
.L217:
	ldr	r3, [r4, #236]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L211
	ldr	r0, [r4, #900]
	cbz	r0, .L212
	ldr	r1, .L262+28
	bl	mpp_buffer_put_with_caller
.L212:
	ldr	r3, .L262+28
	mov	r2, r6
	add	r1, r4, #900
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L262+32
	bl	mpp_buffer_get_with_tag
.L213:
	ldr	r3, [sp, #16]
	str	r5, [sp, #40]
	str	r3, [sp, #32]
	ldr	r3, [r4, #236]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L214
	str	r3, [r4, #16]
.L215:
	ldr	r3, [sp, #16]
	str	r10, [r4, #32]
	str	r5, [r4, #1000]
	str	r3, [r4, #36]
	movs	r3, #1
	str	r8, [r4, #40]
	str	r3, [r4, #44]
.L190:
	mov	r2, #320
	add	r1, r4, #256
	add	r0, r4, #576
	bl	memcpy
.L188:
	ldr	r3, .L262+4
	ldr	r3, [r3]
	lsls	r3, r3, #30
	bpl	.L247
	mov	r3, r4
	movw	r2, #629
	ldr	r1, .L262+8
	ldr	r0, .L262+36
	bl	printk
.L247:
	movs	r0, #0
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L186:
	ldr	r3, [r5, #-8]
	cmp	r3, #6
	bhi	.L169
	tbb	[pc, r3]
.L171:
	.byte	(.L177-.L171)/2
	.byte	(.L176-.L171)/2
	.byte	(.L175-.L171)/2
	.byte	(.L174-.L171)/2
	.byte	(.L173-.L171)/2
	.byte	(.L172-.L171)/2
	.byte	(.L170-.L171)/2
	.p2align 1
.L263:
	.align	2
.L262:
	.word	.LANCHOR0+143
	.word	hal_h264e_debug
	.word	.LANCHOR0+165
	.word	.LC1
	.word	-4096
	.word	.LANCHOR0+207
	.word	.LC32
	.word	.LANCHOR0+222
	.word	.LC33
	.word	.LC11
	.word	.LC31
.L177:
	ldr	r3, [r7]
	lsls	r1, r3, #28
	bpl	.L178
	movw	r2, #573
	mov	r1, r6
	ldr	r0, .L264
	bl	printk
.L178:
	ldr	r3, [r5, #-4]
	str	r3, [r4]
.L179:
	ldr	r2, [r5, #-8]
	movs	r3, #1
	add	r9, r9, #1
	adds	r5, r5, #8
	lsls	r3, r3, r2
	orr	r10, r10, r3
	b	.L168
.L176:
	ldr	r3, [r7]
	lsls	r2, r3, #28
	bpl	.L180
	movw	r2, #577
	mov	r1, r6
	ldr	r0, .L264+4
	bl	printk
.L180:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #64]
	b	.L179
.L175:
	ldr	r3, [r7]
	lsls	r3, r3, #28
	bpl	.L181
	movw	r2, #581
	mov	r1, r6
	ldr	r0, .L264+8
	bl	printk
.L181:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #68]
	b	.L179
.L174:
	ldr	r3, [r7]
	lsls	r0, r3, #28
	bpl	.L182
	movw	r2, #585
	mov	r1, r6
	ldr	r0, .L264+12
	bl	printk
.L182:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #72]
	b	.L179
.L173:
	ldr	r3, [r7]
	lsls	r1, r3, #28
	bpl	.L183
	movw	r2, #589
	mov	r1, r6
	ldr	r0, .L264+16
	bl	printk
.L183:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #224]
	b	.L179
.L172:
	ldr	r3, [r7]
	lsls	r2, r3, #28
	bpl	.L184
	movw	r2, #593
	mov	r1, r6
	ldr	r0, .L264+20
	bl	printk
.L184:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #76]
	b	.L179
.L170:
	ldr	r3, [r7]
	lsls	r3, r3, #28
	bpl	.L185
	movw	r2, #597
	mov	r1, r6
	ldr	r0, .L264+24
	bl	printk
.L185:
	ldr	r3, [r5, #-4]
	str	r3, [r4, #220]
	b	.L179
.L169:
	movw	r2, #601
	mov	r1, r6
	mov	r0, fp
	bl	printk
	b	.L179
.L218:
	mov	r8, #2
	b	.L193
.L196:
	ldr	r0, [r4, #228]
	cbz	r0, .L198
	ldr	r2, [r4, #56]
	cmp	r6, r2
	ble	.L197
	ldr	r1, .L264+28
	str	r3, [sp, #28]
	bl	mpp_buffer_put_with_caller
	ldr	r3, [sp, #28]
	str	r3, [r4, #228]
.L198:
	ldr	r3, .L264+28
	mov	r2, r6
	add	r1, r4, #228
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L264+32
	bl	mpp_buffer_get_with_tag
	b	.L197
.L195:
	ldr	r0, [r4, #228]
	cbz	r0, .L200
	ldr	r3, [r4, #236]
	ldr	r6, [r3, #8]
	cbnz	r6, .L200
	ldr	r1, .L264+28
	bl	mpp_buffer_put_with_caller
	str	r6, [r4, #228]
.L200:
	movs	r3, #0
	str	r3, [r4, #56]
	b	.L199
.L211:
	str	r3, [r4, #900]
	b	.L213
.L207:
	str	r10, [sp, #44]
	strd	r7, r10, [r4, #28]
	b	.L213
.L214:
	add	r3, sp, #32
	movs	r2, #4
	mov	r1, r8
	ldr	r0, [r4, #16]
	bl	hal_bufs_setup
	b	.L215
.L209:
	movs	r2, #0
	strd	r3, r6, [r4, #976]
	strd	r2, r3, [r4, #928]
	str	r2, [r4, #936]
	str	r3, [r4, #984]
	b	.L217
.L265:
	.align	2
.L264:
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LANCHOR0+192
	.word	.LC33
	.fnend
	.size	hal_h264e_vepu500_get_task, .-hal_h264e_vepu500_get_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_deinit, %function
hal_h264e_vepu500_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r6, .L317
	ldr	r3, [r6]
	lsls	r2, r3, #30
	bpl	.L267
	mov	r3, r0
	movs	r2, #255
	ldr	r1, .L317+4
	ldr	r0, .L317+8
	bl	printk
.L267:
	ldr	r0, [r4, #4]
	cbz	r0, .L268
	bl	mpp_dev_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L268:
	ldr	r3, [r4, #236]
	ldr	r5, [r3, #8]
	cmp	r5, #0
	beq	.L269
.L273:
	ldr	r3, [r4, #236]
	ldr	r5, [r3]
	cbnz	r5, .L271
	ldr	r0, [r4, #16]
	cbz	r0, .L271
	bl	hal_bufs_deinit
	str	r5, [r4, #16]
.L271:
	ldr	r0, [r4, #200]
	cbz	r0, .L276
	ldr	r1, .L317+12
	bl	mpp_buffer_put_with_caller
	movs	r3, #0
	str	r3, [r4, #200]
.L276:
	ldr	r3, [r4, #236]
	ldr	r5, [r3, #4]
	cbnz	r5, .L277
	ldr	r0, [r4, #900]
	cbz	r0, .L277
	ldr	r1, .L317+12
	bl	mpp_buffer_put_with_caller
	str	r5, [r4, #900]
.L277:
	ldr	r0, [r4, #1004]
	cbz	r0, .L278
	ldr	r1, .L317+12
	bl	mpp_buffer_put_with_caller
.L278:
	ldr	r0, [r4, #1008]
	cbz	r0, .L279
	ldr	r1, .L317+12
	bl	mpp_buffer_put_with_caller
.L279:
	ldr	r1, [r4, #1012]
	cbz	r1, .L280
	ldr	r0, .L317+12
	bl	mpp_osal_free
.L280:
	ldr	r1, [r4, #204]
	cbz	r1, .L281
	ldr	r0, .L317+12
	bl	mpp_osal_free
.L281:
	movs	r3, #0
	str	r3, [r4, #204]
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L282
	mov	r3, r4
	movw	r2, #289
	ldr	r1, .L317+4
	ldr	r0, .L317+16
	bl	printk
.L282:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L269:
	ldr	r3, [r4, #228]
	cmp	r3, #0
	beq	.L273
	add	r7, r4, #52
	ldr	r8, .L317+20
	mov	r9, r5
	b	.L272
.L275:
	ldr	r0, [r7, r5, lsl #2]
	cbz	r0, .L274
	mov	r1, r8
	bl	mpp_buffer_put_with_caller
	str	r9, [r7, r5, lsl #2]
.L274:
	adds	r5, r5, #1
.L272:
	ldr	r3, [r4, #12]
	cmp	r5, r3
	bcc	.L275
	b	.L273
.L318:
	.align	2
.L317:
	.word	hal_h264e_debug
	.word	.LANCHOR0+235
	.word	.LC1
	.word	.LANCHOR0+280
	.word	.LC11
	.word	.LANCHOR0+260
	.fnend
	.size	hal_h264e_vepu500_deinit, .-hal_h264e_vepu500_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_init, %function
hal_h264e_vepu500_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r6, .L349
	mov	r5, r1
	ldr	r3, [r6]
	lsls	r7, r3, #30
	bpl	.L320
	mov	r3, r0
	movw	r2, #299
	ldr	r1, .L349+4
	ldr	r0, .L349+8
	bl	printk
.L320:
	ldr	r3, [r5, #4]
	mov	r8, #1
	mov	r1, r8
	add	r0, r5, #32
	str	r3, [r4]
	ldr	r3, [r5, #8]
	str	r3, [r4, #232]
	ldr	r3, [r5, #12]
	str	r3, [r4, #896]
	ldr	r3, [r5, #36]
	str	r3, [r4, #236]
	ldr	r3, [r5, #16]
	str	r3, [r4, #240]
	ldr	r3, [r5, #20]
	str	r3, [r4, #244]
	ldr	r3, [r5, #24]
	str	r3, [r4, #252]
	str	r8, [r5, #28]
	bl	mpp_dev_init
	mov	r7, r0
	cbz	r0, .L321
	mov	r3, r0
	movw	r2, #313
	ldr	r1, .L349+4
	ldr	r0, .L349+12
	bl	printk
.L322:
	mov	r0, r4
	bl	hal_h264e_vepu500_deinit
	b	.L329
.L321:
	ldr	r3, [r5, #32]
	movw	r1, #4888
	str	r8, [r4, #12]
	ldr	r0, .L349+16
	str	r3, [r4, #4]
	bl	mpp_osal_malloc
	str	r0, [r4, #204]
	cbnz	r0, .L323
	movw	r2, #323
	ldr	r1, .L349+4
	ldr	r0, .L349+20
	mvn	r7, #3
	bl	printk
	b	.L322
.L323:
	ldr	r3, [r4, #4]
	addw	r0, r0, #3428
	str	r0, [r4, #188]
	movw	r0, #683
	str	r3, [r4, #192]
	movs	r3, #2
	ldr	r2, [r5, #4]
	add	r5, r2, #336
	str	r3, [r2, #308]
	movw	r3, #341
	str	r8, [r2, #312]
	strd	r0, r3, [r2, #316]
	strd	r7, r7, [r2, #324]
	str	r7, [r2, #332]
	ldr	r7, [r4, #244]
	cmp	r7, #0
	beq	.L324
	ldr	r7, .L349+24
	add	ip, r7, #64
	mov	lr, ip
.L325:
	mov	r3, r7
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, ip
	str	r0, [r5, #-8]	@ unaligned
	mov	r7, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L325
	ldr	r7, .L349+24
	add	r5, r2, #400
.L326:
	mov	r3, r7
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, lr
	str	r0, [r5, #-8]	@ unaligned
	mov	r7, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L326
	ldr	r7, .L349+28
	add	r5, r2, #464
	add	ip, r7, #64
.L327:
	mov	r3, r7
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, ip
	str	r0, [r5, #-8]	@ unaligned
	mov	r7, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L327
	ldr	r5, .L349+32
	add	r2, r2, #528
	add	r7, r5, #64
.L328:
	mov	r3, r5
	adds	r2, r2, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, r7
	str	r0, [r2, #-8]	@ unaligned
	mov	r5, r3
	str	r1, [r2, #-4]	@ unaligned
	bne	.L328
	movs	r7, #0
.L329:
	ldr	r3, [r6]
	lsls	r3, r3, #30
	bpl	.L319
	mov	r3, r4
	mov	r2, #358
	ldr	r1, .L349+4
	ldr	r0, .L349+36
	bl	printk
.L319:
	mov	r0, r7
	pop	{r4, r5, r6, r7, r8, pc}
.L324:
	ldr	ip, .L349+44
	add	lr, ip, #64
	mov	r8, lr
.L330:
	mov	r3, ip
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, lr
	str	r0, [r5, #-8]	@ unaligned
	mov	ip, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L330
	ldr	ip, .L349+44
	add	r5, r2, #400
.L331:
	mov	r3, ip
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, r8
	str	r0, [r5, #-8]	@ unaligned
	mov	ip, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L331
	ldr	ip, .L349+48
	add	r5, r2, #464
	add	lr, ip, #64
.L332:
	mov	r3, ip
	adds	r5, r5, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, lr
	str	r0, [r5, #-8]	@ unaligned
	mov	ip, r3
	str	r1, [r5, #-4]	@ unaligned
	bne	.L332
	ldr	r5, .L349+40
	add	r2, r2, #528
	add	ip, r5, #64
.L333:
	mov	r3, r5
	adds	r2, r2, #8
	ldmia	r3!, {r0, r1}
	cmp	r3, ip
	str	r0, [r2, #-8]	@ unaligned
	mov	r5, r3
	str	r1, [r2, #-4]	@ unaligned
	bne	.L333
	b	.L329
.L350:
	.align	2
.L349:
	.word	hal_h264e_debug
	.word	.LANCHOR0+305
	.word	.LC1
	.word	.LC34
	.word	.LANCHOR0+328
	.word	.LC35
	.word	.LANCHOR1
	.word	.LANCHOR1+64
	.word	.LANCHOR1+128
	.word	.LC11
	.word	.LANCHOR1+320
	.word	.LANCHOR1+192
	.word	.LANCHOR1+256
	.fnend
	.size	hal_h264e_vepu500_init, .-hal_h264e_vepu500_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_prepare, %function
hal_h264e_vepu500_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L364
	ldr	r6, [r0]
	ldr	r2, [r4]
	lsls	r2, r2, #30
	bpl	.L352
	mov	r3, r0
	mov	r2, #552
	ldr	r1, .L364+4
	ldr	r0, .L364+8
	bl	printk
.L352:
	ldr	r3, [r6, #8]
	tst	r3, #5
	itt	ne
	movne	r3, #0
	strne	r3, [r6, #8]
	ldr	r3, [r4]
	lsls	r3, r3, #30
	bpl	.L354
	mov	r3, r5
	movw	r2, #558
	ldr	r1, .L364+4
	ldr	r0, .L364+12
	bl	printk
.L354:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L365:
	.align	2
.L364:
	.word	hal_h264e_debug
	.word	.LANCHOR0+351
	.word	.LC1
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_prepare, .-hal_h264e_vepu500_prepare
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_wait, %function
hal_h264e_vepu500_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, .L375
	ldr	r2, [r4]
	lsls	r2, r2, #30
	bpl	.L367
	mov	r3, r0
	movw	r2, #2670
	ldr	r1, .L375+4
	ldr	r0, .L375+8
	bl	printk
.L367:
	movs	r2, #0
	movs	r1, #3
	ldr	r0, [r5, #4]
	bl	mpp_dev_ioctl
	ldr	r3, [r4]
	lsls	r3, r3, #30
	mov	r6, r0
	bpl	.L366
	mov	r3, r5
	mov	r2, #2672
	ldr	r1, .L375+4
	ldr	r0, .L375+12
	bl	printk
.L366:
	mov	r0, r6
	pop	{r4, r5, r6, pc}
.L376:
	.align	2
.L375:
	.word	hal_h264e_debug
	.word	.LANCHOR0+377
	.word	.LC1
	.word	.LC11
	.fnend
	.size	hal_h264e_vepu500_wait, .-hal_h264e_vepu500_wait
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	hal_h264e_vepu500_gen_regs, %function
hal_h264e_vepu500_gen_regs:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #124
	sub	sp, sp, #124
	ldr	r3, [r0]
	mov	r5, r0
	str	r1, [sp, #28]
	ldr	r4, [r0, #204]
	str	r3, [sp, #32]
	ldr	r3, [r0, #64]
	ldr	r7, [r0, #68]
	ldr	fp, [r0, #224]
	str	r3, [sp, #36]
	ldr	r3, [r1, #4]
	str	r3, [sp, #44]
	ldr	r3, .L948
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #2
	beq	.L378
	mov	r3, r0
	movw	r2, #2491
	ldr	r1, .L948+4
	ldr	r0, .L948+8
	bl	printk
.L378:
	movs	r1, #0
	movw	r2, #4888
	mov	r0, r4
	bl	memset
	ldr	r3, [r9]
	lsls	r1, r3, #30
	bpl	.L379
	mov	r2, #636
	ldr	r1, .L948+12
	ldr	r0, .L948+16
	bl	printk
.L379:
	ldrb	r3, [r4, #20]	@ zero_extendqisi2
	movs	r2, #0
	strh	r2, [r4, #36]	@ movhi
	bic	r3, r3, #7
	orr	r3, r3, #4
	strb	r3, [r4, #20]
	movw	r3, #32767
	strh	r3, [r4, #32]	@ movhi
	ldr	r3, [r4, #48]
	and	r3, r3, #16711680
	orr	r3, r3, #28672
	str	r3, [r4, #48]
	ldrh	r3, [r4, #54]
	bfi	r3, r2, #0, #10
	strh	r3, [r4, #54]	@ movhi
	ldr	r3, [r4, #56]
	mvn	r2, #-16777216
	bfi	r3, r2, #0, #24
	str	r3, [r4, #56]
	ldrb	r3, [r4, #84]	@ zero_extendqisi2
	bic	r3, r3, #15
	orr	r3, r3, #15
	strb	r3, [r4, #84]
	mov	r3, #-1
	str	r3, [r4, #88]
	ldr	r3, [r9]
	lsls	r2, r3, #30
	bpl	.L380
	mov	r2, #716
	ldr	r1, .L948+12
	ldr	r0, .L948+20
	bl	printk
.L380:
	ldr	r6, [r5]
	add	r0, sp, #92
	ldr	r10, [r6, #36]
	mov	r1, r10
	bl	vepu5xx_set_fmt
	ldr	r3, [r9]
	lsls	r3, r3, #30
	str	r0, [sp, #80]
	ldr	r8, [sp, #92]
	bpl	.L381
	movw	r2, #729
	ldr	r1, .L948+24
	ldr	r0, .L948+16
	bl	printk
.L381:
	ldr	r3, [sp, #80]
	cmp	r3, #0
	bne	.L377
	ldr	r3, [r6, #12]
	ldrh	r2, [r4, #260]
	adds	r3, r3, #15
	bics	r3, r3, #15
	it	mi
	addmi	r3, r3, #7
	asrs	r3, r3, #3
	subs	r3, r3, #1
	bfi	r2, r3, #0, #11
	strh	r2, [r4, #260]	@ movhi
	ldrsb	r2, [r6, #12]
	add	r3, r2, #15
	bic	r3, r3, #15
	subs	r3, r3, r2
	ldrb	r2, [r4, #264]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #264]
	ldr	r3, [r6, #16]
	ldrh	r2, [r4, #262]
	adds	r3, r3, #15
	bics	r3, r3, #15
	it	mi
	addmi	r3, r3, #7
	subs	r10, r10, #12
	asr	r3, r3, #3
	it	ne
	movne	r10, #1
	subs	r3, r3, #1
	bfi	r2, r3, #0, #11
	strh	r2, [r4, #262]	@ movhi
	ldrsb	r2, [r6, #16]
	add	r3, r2, #15
	bic	r3, r3, #15
	subs	r3, r3, r2
	ldrb	r2, [r4, #266]	@ zero_extendqisi2
	bfi	r2, r3, #0, #6
	strb	r2, [r4, #266]
	ldr	r2, [sp, #108]
	ldrb	r3, [r4, #48]	@ zero_extendqisi2
	bfi	r3, r2, #4, #4
	strb	r3, [r4, #48]
	ldrb	r3, [r4, #268]	@ zero_extendqisi2
	bfi	r3, r8, #2, #4
	strb	r3, [r4, #268]
	ldr	r2, [sp, #96]
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #268]
	ldr	r2, [sp, #100]
	bfi	r3, r2, #1, #1
	bfi	r3, r10, #7, #1
	strb	r3, [r4, #268]
	ldr	r3, [r6, #20]
	cmp	r3, #0
	bne	.L385
	ldr	r3, [r6, #12]
	cmp	r8, #0
	bne	.L386
	lsls	r3, r3, #2
.L387:
	add	r2, r3, r3, lsr #31
	mov	r0, r3
	asrs	r3, r2, #1
.L394:
	cmp	r8, #2
	bhi	.L678
	ldr	r2, [r4, #272]
	and	r1, r2, #-134217728
	ldr	r2, .L948+28
	orrs	r2, r2, r1
	str	r2, [r4, #272]
	ldr	r2, [r4, #276]
	and	r1, r2, #-134217728
	ldr	r2, .L948+32
	orrs	r2, r2, r1
	str	r2, [r4, #276]
	ldr	r2, [r4, #280]
	and	r1, r2, #-134217728
	ldr	r2, .L948+36
	orrs	r2, r2, r1
	str	r2, [r4, #280]
	ldr	r2, [r4, #284]
	lsrs	r2, r2, #21
	lsls	r2, r2, #21
	orr	r2, r2, #32768
	orr	r2, r2, #128
	str	r2, [r4, #284]
.L396:
	ldr	r2, [r4, #296]
	strh	r3, [r4, #300]	@ movhi
	bfi	r2, r0, #0, #21
	str	r2, [r4, #296]
	ldr	r3, [r6, #60]
	cmp	r3, #0
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #291]
	ldr	r2, [r6, #56]
	bfi	r3, r2, #3, #2
	ldrh	r2, [r4, #484]
	bfc	r3, #5, #1
	strb	r3, [r4, #291]
	ldr	r3, [r4, #292]
	and	r2, r2, #16384
	strh	r2, [r4, #484]	@ movhi
	and	r3, r3, #-1073692672
	str	r3, [r4, #292]
	ldr	r3, .L948
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #2
	beq	.L397
	movw	r2, #825
	ldr	r1, .L948+24
	ldr	r0, .L948+20
	bl	printk
.L397:
	ldr	r3, [r5, #224]
	ldr	r1, [r5, #204]
	ldr	r2, [r5]
	ldr	r6, [r3, #44]
	ldr	r3, [r5, #240]
	cmp	r3, #0
	bne	.L672
.L398:
	cmp	r6, #2
	ite	eq
	ldrbeq	r3, [r2, #328]	@ zero_extendqisi2
	ldrbne	r3, [r2, #332]	@ zero_extendqisi2
	b	.L400
.L386:
	cmp	r8, #1
	bne	.L388
	add	r3, r3, r3, lsl #1
	b	.L387
.L388:
	cmp	r8, #2
	beq	.L389
	sub	r2, r8, #8
	cmp	r2, #1
	bhi	.L390
.L389:
	lsls	r3, r3, #1
.L385:
	sub	r2, r8, #4
	cmp	r2, #9
	bhi	.L387
	adr	r1, .L395
	ldr	pc, [r1, r2, lsl #2]
	.p2align 2
.L395:
	.word	.L677+1
	.word	.L387+1
	.word	.L677+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L393+1
	.word	.L677+1
	.p2align 1
.L390:
	sub	r2, r8, #4
	cmp	r2, #9
	bhi	.L387
	adr	r1, .L392
	ldr	pc, [r1, r2, lsl #2]
	.p2align 2
.L392:
	.word	.L676+1
	.word	.L387+1
	.word	.L676+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L387+1
	.word	.L393+1
	.word	.L676+1
	.p2align 1
.L949:
	.align	2
.L948:
	.word	hal_h264e_debug
	.word	.LANCHOR0+400
	.word	.LC1
	.word	.LANCHOR0+427
	.word	.LC36
	.word	.LC37
	.word	.LANCHOR0+448
	.word	20261917
	.word	123164288
	.word	33762283
.L393:
	lsl	lr, r3, #1
.L391:
	ldr	r2, [sp, #112]
	ldrh	ip, [r4, #272]
	ldr	r0, [r2]
	bfi	ip, r0, #0, #9
	strh	ip, [r4, #272]	@ movhi
	ldr	r1, [r2, #4]
	ldr	r0, [r4, #272]
	bfi	r0, r1, #9, #9
	str	r0, [r4, #272]
	ubfx	ip, r0, #16, #16
	ldr	r0, [r2, #8]
	bfi	ip, r0, #2, #9
	strh	ip, [r4, #274]	@ movhi
	ldrh	ip, [r4, #276]
	ldr	r0, [r2, #12]
	bfi	ip, r0, #0, #9
	strh	ip, [r4, #276]	@ movhi
	ldr	r1, [r2, #16]
	ldr	r0, [r4, #276]
	bfi	r0, r1, #9, #9
	str	r0, [r4, #276]
	ubfx	ip, r0, #16, #16
	ldr	r0, [r2, #20]
	bfi	ip, r0, #2, #9
	strh	ip, [r4, #278]	@ movhi
	ldrh	ip, [r4, #280]
	ldr	r0, [r2, #24]
	bfi	ip, r0, #0, #9
	strh	ip, [r4, #280]	@ movhi
	ldr	r1, [r2, #28]
	ldr	r0, [r4, #280]
	bfi	r0, r1, #9, #9
	str	r0, [r4, #280]
	ldr	r2, [r2, #32]
	ubfx	ip, r0, #16, #16
	bfi	ip, r2, #2, #9
	strh	ip, [r4, #282]	@ movhi
	ldr	r0, [sp, #116]
	ldrb	ip, [r4, #286]	@ zero_extendqisi2
	ldr	r2, [r0]
	bfi	ip, r2, #0, #5
	strb	ip, [r4, #286]
	ldr	r2, [r0, #4]
	strb	r2, [r4, #285]
	ldr	r2, [r0, #8]
	mov	r0, r3
	mov	r3, lr
	strb	r2, [r4, #284]
	b	.L396
.L677:
	mov	r0, r3
	b	.L394
.L676:
	mov	lr, r3
	b	.L391
.L678:
	mov	lr, r3
	mov	r3, r0
	b	.L391
.L672:
	movw	r3, #4860
	ldr	r3, [r2, r3]
	lsls	r0, r3, #31
	bmi	.L398
	ldr	r3, [r2, #328]
	cmp	r3, #0
	bne	.L398
	ldr	r0, [r2, #332]
	ldrsb	r3, [r5, #889]
	cmp	r0, #0
	bne	.L398
	uxtb	r3, r3
	cmp	r3, #2
	bne	.L399
	cmp	r6, #2
	it	ne
	movne	r3, #3
.L400:
	ldrb	r2, [r1, #304]	@ zero_extendqisi2
	and	r3, r3, #3
	bfi	r2, r3, #0, #2
	bfi	r2, r3, #4, #2
	strb	r2, [r1, #304]
	ldrb	r2, [r1, #305]	@ zero_extendqisi2
	bfi	r2, r3, #0, #2
	strb	r2, [r1, #305]
	ldr	r1, [r5, #232]
	cbz	r1, .L402
	ldr	r3, [r5]
	cmp	r1, #2
	ldr	r2, [r5, #204]
	ldr	r3, [r3, #12]
	bne	.L403
	ldrb	r1, [r2, #27]	@ zero_extendqisi2
	bic	r1, r1, #7
	orr	r1, r1, #7
	strb	r1, [r2, #27]
	ldrb	r1, [r2, #96]	@ zero_extendqisi2
	orr	r1, r1, #2
	strb	r1, [r2, #96]
.L403:
	ldrh	r1, [r2, #96]
	lsls	r3, r3, #3
	addw	r3, r3, #4095
	and	r1, r1, #50
	orr	r1, r1, #9
	lsrs	r3, r3, #12
	strh	r1, [r2, #96]	@ movhi
	strb	r3, [r2, #98]
	movs	r3, #0
	ldr	r1, [r2, #252]
	strb	r3, [r2, #99]
	ldr	r3, .L950
	ands	r3, r3, r1
	orr	r3, r3, #851968
	str	r3, [r2, #252]
.L402:
	ldr	r3, [r8]
	lsls	r1, r3, #30
	bpl	.L404
	mov	r2, #932
	ldr	r1, .L950+4
	ldr	r0, .L950+8
	bl	printk
.L404:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	bfc	r3, #0, #2
	strb	r3, [r4, #244]
	ldr	r3, [fp, #32]
	cmp	r3, #0
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	ite	le
	movle	r2, #0
	movgt	r2, #1
	bfi	r3, r2, #2, #1
	orr	r3, r3, #16
	strb	r3, [r4, #244]
	ldrb	r3, [r4, #420]	@ zero_extendqisi2
	ldr	r2, [fp, #32]
	bfi	r3, r2, #0, #2
	strb	r3, [r4, #420]
	ldr	r2, [fp, #36]
	bfi	r3, r2, #2, #5
	ldr	r2, [sp, #36]
	strb	r3, [r4, #420]
	ldrb	r3, [r4, #424]	@ zero_extendqisi2
	ldr	r2, [r2, #40]
	bfi	r3, r2, #0, #4
	ldr	r2, [sp, #36]
	strb	r3, [r4, #424]
	ldr	r2, [r2, #72]
	bfi	r3, r2, #4, #1
	ldr	r2, [sp, #36]
	strb	r3, [r4, #424]
	ldrh	r3, [r4, #424]
	ldr	r2, [r2, #48]
	bfi	r3, r2, #5, #4
	strh	r3, [r4, #424]	@ movhi
	ldr	r2, [r7, #8]
	ldrb	r3, [r4, #428]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #428]
	ldr	r2, [r7, #68]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #428]
	ldr	r2, [r7, #60]
	bfi	r3, r2, #2, #1
	strb	r3, [r4, #428]
	ldr	r3, [r7, #20]
	ldrb	r2, [r4, #428]	@ zero_extendqisi2
	subs	r3, r3, #1
	bfi	r2, r3, #3, #2
	strb	r2, [r4, #428]
	ldr	r3, [r7, #24]
	uxtb	r2, r2
	subs	r3, r3, #1
	bfi	r2, r3, #5, #2
	strb	r2, [r4, #428]
	ldr	r2, [r7, #36]
	ldrh	r3, [r4, #428]
	bfi	r3, r2, #7, #6
	strh	r3, [r4, #428]	@ movhi
	ldr	r2, [r7, #44]
	ldr	r3, [r4, #428]
	bfi	r3, r2, #13, #5
	str	r3, [r4, #428]
	ldr	r2, [r7, #52]
	ubfx	r3, r3, #16, #8
	bfi	r3, r2, #2, #5
	strb	r3, [r4, #430]
	ldr	r2, [r7, #56]
	ldrb	r3, [r4, #431]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #431]
	ldr	r3, [fp, #44]
	cmp	r3, #2
	ldrb	r3, [r4, #432]	@ zero_extendqisi2
	ite	eq
	moveq	r2, #2
	movne	r2, #0
	bfi	r3, r2, #0, #2
	strb	r3, [r4, #432]
	ldr	r2, [fp, #52]
	ldrh	r3, [r4, #432]
	bfi	r3, r2, #2, #8
	strh	r3, [r4, #432]	@ movhi
	ubfx	r3, r3, #8, #8
	bfc	r3, #2, #1
	strb	r3, [r4, #433]
	ldr	r2, [fp, #60]
	bfi	r3, r2, #3, #1
	strb	r3, [r4, #433]
	ldr	r2, [fp, #68]
	bfi	r3, r2, #4, #2
	strb	r3, [r4, #433]
	ldr	r3, [fp, #56]
	strh	r3, [r4, #434]	@ movhi
	ldr	r3, [fp, #44]
	cmp	r3, #2
	ite	eq
	ldrheq	r3, [fp, #100]
	movwne	r3, #65535
	strh	r3, [r4, #436]	@ movhi
	ldr	r3, [fp, #108]
	strh	r3, [r4, #438]	@ movhi
	ldrb	r3, [r4, #441]	@ zero_extendqisi2
	ldr	r2, [fp, #72]
	bfi	r3, r2, #3, #2
	strb	r3, [r4, #441]
	ldrh	r3, [r4, #440]
	ldr	r2, [fp, #76]
	bfi	r3, r2, #7, #4
	strh	r3, [r4, #440]	@ movhi
	ldr	r0, [fp, #88]
	bl	h264e_reorder_rd_rewind
	ldr	r0, [fp, #88]
	add	r1, sp, #92
	bl	h264e_reorder_rd_op
	cmp	r0, #0
	bne	.L407
	ldrb	r3, [r4, #440]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #440]
	ldr	r3, [sp, #92]
	ldrb	r2, [r4, #440]	@ zero_extendqisi2
	cmp	r3, #0
	bfi	r2, r3, #0, #2
	strb	r2, [r4, #440]
	blt	.L408
	cmp	r3, #1
	ble	.L409
	cmp	r3, #2
	beq	.L410
.L408:
	movw	r2, #987
	ldr	r1, .L950+4
	ldr	r0, .L950+12
	bl	printk
	b	.L411
.L399:
	cmp	r3, #0
	it	ne
	movne	r3, #2
	b	.L400
.L951:
	.align	2
.L950:
	.word	-995840
	.word	.LANCHOR0+467
	.word	.LC36
	.word	.LC38
.L409:
	ldr	r3, [sp, #96]
.L931:
	strh	r3, [r4, #442]	@ movhi
.L411:
	ldr	r3, [r4, #444]
	and	r3, r3, #-536870912
	str	r3, [r4, #444]
	movs	r3, #0
	str	r3, [r4, #448]
	ldrh	r3, [r4, #452]
	and	r3, r3, #61440
	strh	r3, [r4, #452]	@ movhi
	ldr	r0, [fp, #92]
	bl	h264e_marking_rd_rewind
	ldr	r3, [fp, #44]
	cmp	r3, #2
	bne	.L412
	ldr	r2, [fp, #116]
	ldrb	r3, [r4, #444]	@ zero_extendqisi2
	bfi	r3, r2, #0, #1
	strb	r3, [r4, #444]
	ldr	r2, [fp, #120]
	bfi	r3, r2, #1, #1
	strb	r3, [r4, #444]
.L413:
	ldr	r3, [r8]
	lsls	r2, r3, #30
	bpl	.L441
	movw	r2, #1137
	ldr	r1, .L952
	ldr	r0, .L952+4
	bl	printk
.L441:
	ldr	r2, [r5]
	movw	r3, #4852
	ldr	r6, [r5, #204]
	ldr	r9, [r2, r3]
	ldr	r3, [r8]
	lsls	r3, r3, #30
	bpl	.L442
	movw	r2, #1146
	ldr	r1, .L952+8
	ldr	r0, .L952+12
	bl	printk
.L442:
	ldr	r3, [fp, #44]
	cmp	r3, #2
	ldrb	r3, [r6, #896]	@ zero_extendqisi2
	bne	.L443
	movs	r2, #6
	bfi	r3, r2, #0, #4
	strb	r3, [r6, #896]
	movw	r3, #4876
	ldr	r2, [r5]
.L932:
	cmp	r9, #1
	ldr	r3, [r2, r3]
	addw	r0, r6, #1556
	mov	r2, #208
	ite	eq
	ldreq	r1, .L952+16
	ldrne	r1, .L952+20
	lsls	r3, r3, #2
	add	r1, r1, r3
	bl	memcpy
	ldr	r3, [sp, #36]
	ldr	r3, [r3]
	cmp	r3, #66
	bne	.L685
	ldr	r3, [sp, #36]
	ldr	r3, [r3, #28]
	cmp	r3, #30
	ite	gt
	movgt	r3, #0
	movle	r3, #1
.L448:
	ldrb	r2, [r6, #404]	@ zero_extendqisi2
	bfi	r2, r3, #0, #1
	ldr	r3, [sp, #36]
	strb	r2, [r6, #404]
	ldrb	r2, [r6, #404]	@ zero_extendqisi2
	ldr	r3, [r3]
	cmp	r3, #76
	itett	le
	ldrle	r3, [r7, #8]
	movgt	r3, #0
	clzle	r3, r3
	lsrle	r3, r3, #5
	bfi	r2, r3, #3, #1
	strb	r2, [r6, #404]
	ldrh	r3, [r6, #404]
	orr	r3, r3, #8192
	orr	r3, r3, #16
	strh	r3, [r6, #404]	@ movhi
	ldr	r2, [r7, #72]
	ldrb	r3, [r6, #406]	@ zero_extendqisi2
	bfi	r3, r2, #4, #2
	strb	r3, [r6, #406]
	ldr	r2, [r5]
	movw	r3, #4880
	ldr	r3, [r2, r3]
	ldrb	r2, [r6, #407]	@ zero_extendqisi2
	cmp	r3, #0
	ite	le
	movle	r3, #0
	movgt	r3, #1
	bfi	r2, r3, #4, #1
	strb	r2, [r6, #407]
	ldr	r3, [r5]
	ldrb	r2, [r6, #405]	@ zero_extendqisi2
	add	r3, r3, #4864
	ldr	r3, [r3]
	cmp	r3, #0
	ite	le
	movle	r3, #0
	movgt	r3, #1
	bfi	r2, r3, #7, #1
	ldrb	r3, [r6, #407]	@ zero_extendqisi2
	strb	r2, [r6, #405]
	orr	r3, r3, #32
	strb	r3, [r6, #407]
	ldrh	r3, [r6, #408]
	bfc	r3, #0, #9
	strh	r3, [r6, #408]	@ movhi
	ldr	r3, [r8]
	lsls	r0, r3, #30
	bpl	.L450
	movw	r2, #1175
	ldr	r1, .L952+8
	ldr	r0, .L952+4
	bl	printk
.L450:
	ldr	r1, [r5, #224]
	ldr	r2, [r5]
	ldr	r3, [r5, #204]
	ldr	r1, [r1, #44]
	addw	r6, r3, #839
	cmp	r1, #2
	ite	eq
	addeq	r1, r2, #336
	addne	r1, r2, #400
	sub	r0, r1, #4
	ite	eq
	addeq	r2, r2, #464
	addne	r2, r2, #528
	adds	r1, r1, #60
.L453:
	ldr	r7, [r0, #4]!
	cmp	r1, r0
	strb	r7, [r6, #1]!
	bne	.L453
	ldr	r0, [r2]
	ldrb	r1, [r3, #856]	@ zero_extendqisi2
	bfi	r1, r0, #0, #5
	strb	r1, [r3, #856]
	ldr	r0, [r2, #4]
	ldrh	r1, [r3, #856]
	bfi	r1, r0, #5, #5
	strh	r1, [r3, #856]	@ movhi
	ldr	r0, [r2, #8]
	ubfx	r1, r1, #8, #8
	bfi	r1, r0, #2, #5
	strb	r1, [r3, #857]
	ldr	r0, [r2, #12]
	ldr	r1, [r3, #856]
	bfi	r1, r0, #15, #5
	str	r1, [r3, #856]
	ldr	r0, [r2, #16]
	ubfx	r1, r1, #16, #16
	bfi	r1, r0, #4, #5
	strh	r1, [r3, #858]	@ movhi
	ldr	r0, [r2, #20]
	ubfx	r1, r1, #8, #8
	bfi	r1, r0, #1, #5
	strb	r1, [r3, #859]
	ldrb	r1, [r3, #860]	@ zero_extendqisi2
	ldr	r0, [r2, #24]
	bfi	r1, r0, #0, #5
	strb	r1, [r3, #860]
	ldr	r0, [r2, #28]
	ldrh	r1, [r3, #860]
	bfi	r1, r0, #5, #5
	strh	r1, [r3, #860]	@ movhi
	ubfx	r1, r1, #8, #8
	bfc	r1, #2, #5
	strb	r1, [r3, #861]
	ldr	r0, [r2, #32]
	ldr	r1, [r3, #860]
	bfi	r1, r0, #15, #5
	str	r1, [r3, #860]
	ldr	r0, [r2, #36]
	ubfx	r1, r1, #16, #16
	bfi	r1, r0, #4, #5
	strh	r1, [r3, #862]	@ movhi
	ldr	r0, [r2, #40]
	ubfx	r1, r1, #8, #8
	bfi	r1, r0, #1, #5
	strb	r1, [r3, #863]
	ldrb	r1, [r3, #864]	@ zero_extendqisi2
	ldr	r0, [r2, #44]
	bfi	r1, r0, #0, #5
	strb	r1, [r3, #864]
	ldrh	r1, [r3, #864]
	ldr	r0, [r2, #48]
	bfi	r1, r0, #5, #5
	strh	r1, [r3, #864]	@ movhi
	ldr	r0, [r2, #52]
	ubfx	r1, r1, #8, #8
	bfi	r1, r0, #2, #5
	strb	r1, [r3, #865]
	ldr	r0, [r2, #56]
	ldr	r1, [r3, #864]
	bfi	r1, r0, #15, #5
	str	r1, [r3, #864]
	ldr	r2, [r2, #60]
	ubfx	r1, r1, #16, #16
	bfi	r1, r2, #4, #5
	ldrb	r2, [r3, #868]	@ zero_extendqisi2
	strh	r1, [r3, #866]	@ movhi
	orr	r2, r2, #15
	strb	r2, [r3, #868]
	ldr	r3, [r5]
	ldr	r2, [r5, #204]
	ldr	r1, [r3, #324]
	cmp	r1, #0
	beq	.L687
	ldr	r1, [r5, #224]
	ldr	r1, [r1, #44]
	cmp	r1, #2
	bne	.L455
	ldrb	r1, [r3, #592]	@ zero_extendqisi2
	ldrb	r10, [r3, #596]	@ zero_extendqisi2
	ldrb	r9, [r3, #600]	@ zero_extendqisi2
	str	r1, [sp, #72]
	movs	r1, #0
	mov	r0, r1
	mov	r6, r1
	ldrh	r8, [r3, #604]
	ldrh	lr, [r3, #608]
	ldrh	ip, [r3, #612]
	ldrh	r7, [r3, #616]
	movw	r3, #341
	str	r3, [sp, #76]
.L454:
	strb	r9, [r2, #1094]
	ldrh	r9, [r2, #1096]
	ldr	r3, [sp, #72]
	bfi	r9, r8, #0, #10
	strh	r9, [r2, #1096]	@ movhi
	ldr	r8, [r2, #1096]
	strb	r3, [r2, #1092]
	bfi	r8, lr, #10, #10
	str	r8, [r2, #1096]
	ubfx	r8, r8, #16, #16
	strb	r10, [r2, #1093]
	bfi	r8, ip, #4, #10
	ldrh	ip, [r2, #1100]
	strh	r8, [r2, #1098]	@ movhi
	bfi	ip, r7, #0, #10
	ldrh	r7, [r2, #1104]
	strh	ip, [r2, #1100]	@ movhi
	bfi	r7, r6, #0, #10
	strh	r7, [r2, #1104]	@ movhi
	ldr	r6, [r2, #1104]
	bfi	r6, r0, #10, #10
	str	r6, [r2, #1104]
	ubfx	r6, r6, #16, #16
	ldr	r0, .L952+24
	bfi	r6, r1, #4, #10
	strh	r6, [r2, #1106]	@ movhi
	ldrh	r1, [r2, #1108]
	ldr	r3, [sp, #76]
	ldr	r6, .L952+28
	bfi	r1, r3, #0, #10
	strh	r1, [r2, #1108]	@ movhi
	ldr	r3, [r5, #204]
	movw	r2, #4868
	ldr	r1, [r5]
	ldr	r7, [r1, r2]
	ldr	r2, [r3, #1044]
	ldr	r1, [r3, #1052]
	and	r2, r2, #-268374016
	orrs	r2, r2, r6
	str	r2, [r3, #1044]
	ldr	r2, [r3, #1048]
	and	r1, r1, #-268374016
	orrs	r1, r1, r6
	str	r1, [r3, #1052]
	and	r2, r2, #-268374016
	ldr	r1, [r3, #1056]
	orrs	r2, r2, r0
	str	r2, [r3, #1048]
	ldr	r2, [r3, #1060]
	and	r1, r1, #-268374016
	orrs	r1, r1, r0
	str	r1, [r3, #1056]
	and	r2, r2, #-268374016
	orrs	r6, r6, r2
	str	r6, [r3, #1060]
	b	.L953
.L954:
	.align	2
.L952:
	.word	.LANCHOR0+467
	.word	.LC37
	.word	.LANCHOR0+487
	.word	.LC36
	.word	.LANCHOR1+384
	.word	.LANCHOR1+624
	.word	524294
	.word	196609
.L953:
	ldr	r2, [r3, #1064]
	and	r2, r2, #-268374016
	orrs	r0, r0, r2
	str	r0, [r3, #1064]
	ldr	r1, [r5]
	movw	r2, #4852
	ldr	r2, [r1, r2]
	cmp	r2, #1
	ldrh	r2, [r3, #1068]
	beq	.L456
	movw	r1, #4095
.L934:
	cmp	r7, #0
	bfi	r2, r1, #0, #12
	strh	r2, [r3, #1068]	@ movhi
	ite	ne
	movne	r2, #22
	moveq	r2, #16
	strb	r2, [r3, #1072]
	it	ne
	movne	r1, #23
	strb	r2, [r3, #1075]
	it	eq
	moveq	r1, #16
	strb	r2, [r3, #1076]
	it	ne
	movne	r0, #26
	strb	r2, [r3, #1079]
	it	eq
	moveq	r0, #16
	ldr	r2, .L955
	strb	r1, [r3, #1073]
	it	ne
	movne	r1, #20
	strb	r0, [r3, #1077]
	it	eq
	moveq	r1, #16
	str	r2, [r3, #1080]
	add	r2, r2, #-50331648
	strb	r1, [r3, #1074]
	subw	r2, r2, #1284
	strb	r1, [r3, #1078]
	str	r2, [r3, #1084]
	movw	r2, #4852
	ldr	r1, [r5]
	ldr	r3, [r5, #204]
	ldr	r6, [r1, r2]
	ldrb	r2, [r3, #2119]	@ zero_extendqisi2
	cmp	r6, #1
	ite	eq
	moveq	r1, #32
	movne	r1, #45
	bfi	r2, r1, #0, #6
	strb	r2, [r3, #2119]
	ldr	r2, [r5, #224]
	ldr	r1, [r3, #2116]
	ldr	r2, [r2, #44]
	and	r1, r1, #-16777216
	cmp	r2, #2
	ldr	r2, [r3, #2120]
	bne	.L464
	ldr	r0, .L955+4
	and	r2, r2, #-16777216
	cmp	r6, #1
	orr	r0, r0, r1
	str	r0, [r3, #2116]
	ldr	r0, .L955+8
	ldr	r1, [r3, #2128]
	orr	r2, r2, r0
	str	r2, [r3, #2120]
	ldr	r2, [r3, #2124]
	and	r2, r2, #-16777216
	bne	.L465
	add	r0, r0, #262144
	and	r1, r1, #-16777216
	addw	r0, r0, #1286
	orrs	r0, r0, r2
	ldr	r2, .L955+12
	str	r0, [r3, #2124]
	orrs	r2, r2, r1
.L935:
	str	r2, [r3, #2128]
.L466:
	ldr	r1, [r5]
	movw	r2, #4880
	ldr	ip, .L955+28
	movs	r6, #72
	ldr	r3, [r5, #204]
	add	lr, sp, #92
	ldr	r2, [r1, r2]
	add	r2, r2, ip
	ldrh	r1, [r3, #1876]
	ldrb	r0, [r2, #510]	@ zero_extendqisi2
	bfi	r1, r0, #0, #12
	ldrb	r0, [r2, #514]	@ zero_extendqisi2
	strh	r1, [r3, #1876]	@ movhi
	ldrh	r1, [r3, #1878]
	bfi	r1, r0, #0, #12
	strh	r1, [r3, #1878]	@ movhi
	ldr	r1, [r3, #1880]
	movs	r0, #16
	strb	r0, [r3, #1888]
	and	r1, r1, #-268374016
	orr	r1, r1, #1638400
	orr	r1, r1, #15
	str	r1, [r3, #1880]
	ldrb	r1, [r2, #518]	@ zero_extendqisi2
	strb	r1, [r3, #1884]
	ldrb	r1, [r2, #522]	@ zero_extendqisi2
	strb	r1, [r3, #1885]
	movw	r1, #4112
	strh	r1, [r3, #1886]	@ movhi
	ldr	r1, [r3, #1904]
	and	r1, r1, #-268374016
	orr	r1, r1, #2621440
	orr	r1, r1, #20
	str	r1, [r3, #1904]
	ldrh	r1, [r3, #1908]
	bfi	r1, r6, #0, #12
	ldrb	r6, [r2, #526]	@ zero_extendqisi2
	strh	r1, [r3, #1908]	@ movhi
	mov	r1, #269488144
	str	r1, [r3, #1912]
	ldrh	r1, [r3, #1928]
	bfi	r1, r6, #0, #12
	ldrb	r6, [r2, #530]	@ zero_extendqisi2
	strh	r1, [r3, #1928]	@ movhi
	ldrh	r1, [r3, #1930]
	bfi	r1, r6, #0, #12
	ldrb	r6, [r2, #534]	@ zero_extendqisi2
	strh	r1, [r3, #1930]	@ movhi
	ldrh	r1, [r3, #1932]
	bfi	r1, r6, #0, #12
	strh	r1, [r3, #1932]	@ movhi
	ldrb	r1, [r2, #538]	@ zero_extendqisi2
	strb	r1, [r3, #1936]
	ldrb	r1, [r2, #542]	@ zero_extendqisi2
	ldrb	r2, [r2, #546]	@ zero_extendqisi2
	strb	r0, [r3, #1939]
	strb	r1, [r3, #1937]
	strb	r2, [r3, #1938]
	ldr	r2, [r3, #1944]
	and	r2, r2, #-252645136
	orr	r2, r2, #67109888
	orr	r2, r2, #65537
	str	r2, [r3, #1944]
	ldr	r2, [r3, #1948]
	and	r1, r2, #-1061109568
	ldr	r2, .L955+16
	orrs	r2, r2, r1
	str	r2, [r3, #1948]
	ldr	r3, [r5, #224]
	ldr	r2, [r5]
	ldr	r7, [r5, #856]
	str	r3, [sp, #72]
	movw	r3, #4860
	ldr	r8, [r2, r3]
	add	r3, ip, #552
	ldr	r6, [r5, #204]
	lsr	r10, r7, #6
	ldm	r3, {r0, r1, r2, r3}
	ldr	r9, [r5, #880]
	stm	lr, {r0, r1, r2, r3}
	ldr	r3, .L955+20
	ldr	r3, [r3]
	lsls	r1, r3, #30
	bpl	.L468
	movw	r2, #2121
	add	r1, ip, #568
	ldr	r0, .L955+24
	bl	printk
.L468:
	ldr	r1, [r5, #876]
	add	r3, r7, r7, lsl #2
	cmp	r1, r3, lsr #10
	bcc	.L469
	ldrd	r2, r3, [r5, #868]
	cmp	r3, r2
	it	cc
	movcc	r3, r2
	ldr	r2, [r5, #864]
	cmp	r3, r2
	it	cc
	movcc	r3, r2
	movw	r2, #1126
	muls	r3, r2, r3
	cmp	r1, r3, lsr #10
	bcc	.L469
	sub	r3, r8, #6
	cmp	r3, #1
	bhi	.L694
	b	.L956
.L957:
	.align	2
.L955:
	.word	370416150
	.word	393729
	.word	1052688
	.word	1053204
	.word	134746128
	.word	hal_h264e_debug
	.word	.LC36
	.word	.LANCHOR0
.L956:
.L469:
	movs	r3, #102
	ldr	r2, [r5, #880]
	muls	r3, r7, r3
	cmp	r2, r3, lsr #10
	bhi	.L695
	movs	r3, #66
	muls	r3, r7, r3
	cmp	r2, r3, lsr #10
	ite	hi
	movhi	r2, #1
	movls	r2, #0
.L470:
	ldr	r1, [r5]
	movw	r3, #4852
	ldr	r3, [r1, r3]
	cmp	r3, #1
	bne	.L471
	ldrb	r3, [r6, #1785]	@ zero_extendqisi2
	orr	r3, r3, #128
	strb	r3, [r6, #1785]
	ldr	r3, [r5, #240]
	cmp	r3, #0
	beq	.L472
	cmp	r8, #3
	ble	.L472
	add	r3, sp, #120
	add	r3, r3, r2, lsl #2
	ldr	r3, [r3, #-28]
	strb	r3, [r6, #1784]
.L473:
	ldr	r0, [r5, #240]
	ldrd	r1, r3, [r5, #872]
	add	r3, r3, r1
	ldr	r1, [r5, #880]
	cmp	r0, #0
	beq	.L475
	cmp	r8, #3
	ble	.L475
	add	r0, r1, r1, lsl #1
	cmp	r3, r0, lsr #2
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, r7, lsr #4
	bcs	.L476
	subs	r3, r3, #8
.L477:
	cmp	r2, #2
	beq	.L697
	cmp	r2, #1
	bne	.L698
	mvn	r3, #1
.L479:
	ldrb	r1, [r6, #1785]	@ zero_extendqisi2
	bfi	r1, r3, #0, #4
	strb	r1, [r6, #1785]
	ldr	r3, [sp, #72]
	ldr	r3, [r3, #44]
	cmp	r3, #2
	beq	.L702
	ldr	r3, [r5, #580]
	cmp	r3, #2
	ite	eq
	moveq	r1, #1
	movne	r1, #2
.L486:
	ldrb	r3, [r6, #1785]	@ zero_extendqisi2
	cmp	r2, #0
	eor	r2, r2, #1
	bfi	r3, r1, #5, #2
	strb	r3, [r6, #1785]
	ldrh	r3, [r6, #1788]
	itet	ne
	movne	r1, #48
	moveq	r1, #24
	movne	r0, #0
	bfc	r3, #0, #12
	strh	r3, [r6, #1788]	@ movhi
	ldrh	r3, [r6, #1790]
	it	eq
	moveq	r0, #96
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1790]	@ movhi
	ldrh	r3, [r6, #1792]
	ite	ne
	movne	r1, #64
	moveq	r1, #48
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1792]	@ movhi
	ldrh	r3, [r6, #1794]
	ite	ne
	movne	r1, #72
	moveq	r1, #64
	bfi	r3, r1, #0, #12
	ldrh	r1, [r6, #1796]
	strh	r3, [r6, #1794]	@ movhi
	movw	r3, #4095
	it	eq
	moveq	r3, #16
	bfi	r1, r3, #0, #12
	ldrh	r3, [r6, #1798]
	strh	r1, [r6, #1796]	@ movhi
	mov	r1, #32
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1798]	@ movhi
	ldrh	r3, [r6, #1800]
	mov	r1, #48
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1800]	@ movhi
	ldrh	r3, [r6, #1802]
	bfi	r3, r0, #0, #12
	strh	r3, [r6, #1802]	@ movhi
	ldr	r3, [r6, #1804]
	ite	ne
	movne	r0, #64
	moveq	r0, #96
	and	r3, r3, #-268374016
	orr	r3, r3, #1572864
	orr	r3, r3, r1
	str	r3, [r6, #1804]
	ldrh	r3, [r6, #1808]
	bfi	r3, r0, #0, #12
	strh	r3, [r6, #1808]	@ movhi
	ldrh	r3, [r6, #1810]
	ldr	r0, .L958
	bfi	r3, r1, #0, #12
	strh	r3, [r6, #1810]	@ movhi
	ldrb	r3, [r6, #1812]	@ zero_extendqisi2
	ite	ne
	movne	r1, #2
	moveq	r1, #1
	bfi	r3, r1, #0, #4
	strb	r3, [r6, #1812]
	ldrb	r3, [r6, #1813]	@ zero_extendqisi2
	ite	ne
	movne	r1, #5
	moveq	r1, #3
	bfi	r3, r1, #0, #4
	strb	r3, [r6, #1813]
	ldrh	r3, [r6, #1814]
	movw	r1, #769
	and	r3, r3, r0
	orr	r3, r3, r1
	strh	r3, [r6, #1814]	@ movhi
	ldr	r3, [r6, #1816]
	and	r3, r3, #-252645136
	orr	r3, r3, #67109888
	orr	r3, r3, #65537
	str	r3, [r6, #1816]
	ldr	r3, [r6, #1820]
	and	r3, r3, #-252645136
	orr	r3, r3, #50332416
	str	r3, [r6, #1820]
	ldrh	r3, [r6, #1824]
	and	r0, r0, r3
	ldr	r3, [r6, #1828]
	orr	r1, r1, r0
	strh	r1, [r6, #1824]	@ movhi
	and	r3, r3, #-1061109568
	orr	r3, r3, #150997248
	orr	r3, r3, #393222
	str	r3, [r6, #1828]
	ldr	r3, [r6, #1832]
	and	r1, r3, #-1061109568
	ldr	r3, .L958+4
	orr	r3, r3, r1
	str	r3, [r6, #1832]
	ldr	r3, [r6, #1836]
	and	r1, r3, #-1061109568
	ldr	r3, .L958+8
	orr	r3, r3, r1
	str	r3, [r6, #1836]
	ldrh	r3, [r6, #1840]
	ite	ne
	movne	r1, #0
	moveq	r1, #5
	bic	r3, r3, #16128
	bic	r3, r3, #63
	orr	r3, r3, #4096
	orr	r3, r3, #7
	strh	r3, [r6, #1840]	@ movhi
	ite	ne
	movne	r3, #0
	moveq	r3, #10
	strb	r3, [r6, #1844]
	ite	ne
	movne	r3, #0
	moveq	r3, #6
	strb	r3, [r6, #1846]
	ldrb	r3, [r6, #1848]	@ zero_extendqisi2
	bfi	r3, r2, #0, #4
	bfi	r3, r1, #4, #4
	strb	r3, [r6, #1848]
	ldrb	r3, [r6, #1849]	@ zero_extendqisi2
	bfi	r3, r2, #0, #4
	ite	ne
	movne	r2, #0
	moveq	r2, #3
	bfi	r3, r2, #4, #4
	strb	r3, [r6, #1849]
	ldr	r3, .L958+12
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #2
	beq	.L499
	movw	r2, #2227
	ldr	r1, .L958+16
	ldr	r0, .L958+20
	bl	printk
.L499:
	ldr	r3, [sp, #36]
	ldr	r10, [r3, #60]
	ldr	r3, [sp, #44]
	ldr	r3, [r3, #172]
	str	r3, [sp, #72]
	ldr	r3, [sp, #44]
	ldr	r0, [r3, #160]
	ldrd	r6, r7, [r3, #176]
	ldr	r3, [sp, #36]
	lsls	r0, r0, #4
	ldr	r1, [r3, #64]
	mul	r1, r1, r10
	bl	__aeabi_idiv
	ldr	r3, [r9]
	lsls	r2, r3, #30
	mov	r8, r0
	bpl	.L500
	movw	r2, #1194
	ldr	r1, .L958+24
	ldr	r0, .L958+28
	bl	printk
.L500:
	ldr	r3, [r9]
	lsls	r3, r3, #23
	bpl	.L501
	ldr	r3, [sp, #72]
	movw	r2, #1196
	str	r6, [sp, #8]
	ldr	r1, .L958+24
	strd	r7, r3, [sp]
	ldr	r3, [sp, #44]
	ldr	r0, .L958+32
	ldr	r3, [r3, #160]
	bl	printk
.L501:
	ldr	r0, [sp, #72]
	cmp	r8, #1048576
	ldrb	r1, [r4, #245]	@ zero_extendqisi2
	and	r6, r6, #63
	it	ge
	movge	r8, #327680
	and	r7, r7, #63
	bfi	r1, r0, #0, #6
	strb	r1, [r4, #245]
	ldrb	r1, [r4, #324]	@ zero_extendqisi2
	mul	r3, r8, r10
	bic	r1, r1, #3
	orr	r1, r1, #3
	strb	r1, [r4, #324]
	ldr	r1, [r4, #324]
	bfi	r1, r10, #12, #20
	str	r1, [r4, #324]
	ldrh	r1, [r4, #330]
	asrs	r3, r3, #4
	bfi	r1, r6, #4, #6
	strh	r1, [r4, #330]	@ movhi
	ubfx	r1, r1, #8, #8
	add	r3, r3, r3, lsl #2
	bfi	r1, r7, #2, #6
	strb	r1, [r4, #331]
	ldr	r1, [r4, #332]
	cmp	r3, #0
	mov	r2, r3
	it	lt
	addlt	r2, r3, #15
	bfi	r1, r8, #0, #20
	cmp	r3, #0
	str	r1, [r4, #332]
	it	lt
	addlt	r3, r3, #15
	ldr	r1, [r5, #244]
	asrs	r2, r2, #4
	rsbs	r2, r2, #0
	asrs	r3, r3, #4
	ldrb	r0, [r4, #330]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L505
	bfc	r0, #0, #4
.L939:
	strb	r0, [r4, #330]
	ldr	r0, [r5]
	ldr	r8, [fp, #44]
	ldrd	r1, lr, [r0, #248]
	cmp	r8, #2
	ldrd	ip, r0, [r0, #256]
	itt	ne
	movne	r1, lr
	movne	ip, r0
	cmp	r1, ip
	bne	.L510
	ldrb	r0, [r4, #245]	@ zero_extendqisi2
	bfi	r0, r1, #0, #6
	ldrb	r1, [r4, #330]	@ zero_extendqisi2
	strb	r0, [r4, #245]
	bfc	r1, #0, #4
	strb	r1, [r4, #330]
.L510:
	ldr	r1, [r4, #772]
	str	r3, [r4, #788]
	lsls	r3, r3, #2
	ldr	r0, .L958+36
	and	r1, r1, #-33554432
	str	r3, [r4, #792]
	mvn	r3, #-2147483648
	strd	r3, r3, [r4, #796]
	orrs	r0, r0, r1
	strd	r3, r3, [r4, #804]
	str	r3, [r4, #812]
	ldrb	r3, [r4, #820]	@ zero_extendqisi2
	ldr	r1, [r4, #776]
	bfi	r3, r7, #0, #6
	strb	r3, [r4, #820]
	ldrh	r3, [r4, #820]
	lsrs	r1, r1, #20
	str	r0, [r4, #772]
	bfi	r3, r6, #6, #6
	strh	r3, [r4, #820]	@ movhi
	ldr	r3, [r4, #820]
	lsls	r1, r1, #20
	str	r1, [r4, #776]
	lsls	r1, r2, #2
	bfi	r3, r7, #12, #6
	strd	r1, r2, [r4, #780]
	str	r3, [r4, #820]
	ubfx	r2, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r2, r6, #2, #6
	bfi	r3, r7, #0, #6
	strb	r3, [r4, #823]
	ldrb	r3, [r4, #824]	@ zero_extendqisi2
	strb	r2, [r4, #822]
	bfi	r3, r6, #0, #6
	strb	r3, [r4, #824]
	ldrh	r3, [r4, #824]
	bfi	r3, r7, #6, #6
	strh	r3, [r4, #824]	@ movhi
	ldr	r3, [r4, #824]
	bfi	r3, r6, #12, #6
	str	r3, [r4, #824]
	ubfx	r2, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r3, r6, #0, #6
	strb	r3, [r4, #827]
	ldrb	r3, [r4, #828]	@ zero_extendqisi2
	bfi	r2, r7, #2, #6
	strb	r2, [r4, #826]
	bfi	r3, r7, #0, #6
	strb	r3, [r4, #828]
	ldrh	r3, [r4, #828]
	bfi	r3, r6, #6, #6
	strh	r3, [r4, #828]	@ movhi
	ldr	r3, [r4, #828]
	bfi	r3, r7, #12, #6
	str	r3, [r4, #828]
	ubfx	r2, r3, #16, #8
	ubfx	r3, r3, #24, #8
	bfi	r3, r7, #0, #6
	strb	r3, [r4, #831]
	ldrb	r3, [r4, #832]	@ zero_extendqisi2
	bfi	r2, r6, #2, #6
	strb	r2, [r4, #830]
	movs	r2, #1
	bfi	r3, r6, #0, #6
	strb	r3, [r4, #832]
	ldrb	r3, [r4, #835]	@ zero_extendqisi2
	bfi	r3, r2, #6, #2
	strb	r3, [r4, #835]
	ldr	r3, .L958+12
	ldr	r3, [r3]
	lsls	r0, r3, #30
	bpl	.L511
	movw	r2, #1278
	ldr	r1, .L958+24
	ldr	r0, .L958+20
	bl	printk
	b	.L959
.L960:
	.align	2
.L958:
	.word	-3856
	.word	134613766
	.word	335942665
	.word	hal_h264e_debug
	.word	.LANCHOR0+568
	.word	.LC37
	.word	.LANCHOR0+593
	.word	.LC36
	.word	.LC40
	.word	2130942
.L959:
.L511:
	ldr	r3, [r5, #4]
	ldr	r7, [r5, #204]
	str	r3, [sp, #36]
	ldr	r3, [sp, #28]
	ldr	r6, [r3, #52]
	ldr	r9, [r3, #28]
	mov	r0, r6
	bl	mpp_frame_get_buffer
	ldr	r3, [sp, #28]
	str	r0, [sp, #72]
	mov	r0, r6
	ldr	r8, [r3, #32]
	bl	mpp_frame_get_fmt
	str	r0, [sp, #84]
	mov	r0, r6
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	mov	r0, r6
	bl	mpp_frame_get_ver_stride
	mov	fp, r0
	mov	r0, r9
	bl	mpp_packet_get_length
	ldr	r3, [sp, #28]
	mov	r9, r0
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_is_full
	ldr	r2, .L961
	ldr	r2, [r2]
	tst	r2, #2
	str	r0, [sp, #76]
	ldr	r3, [sp, #84]
	beq	.L512
	mov	r2, #1296
	ldr	r1, .L961+4
	ldr	r0, .L961+8
	bl	printk
	ldr	r3, [sp, #84]
.L512:
	ands	r6, r3, #983040
	bne	.L716
	ubfx	r2, r3, #0, #20
	cmp	r2, #18
	bhi	.L717
	mov	r1, r3
	add	r0, sp, #92
	bl	vepu5xx_set_fmt
	ldr	r3, [sp, #92]
	subs	r3, r3, #4
	cmp	r3, #9
	bhi	.L718
	tbh	[pc, r3, lsl #1]
.L516:
	.2byte	(.L517-.L516)/2
	.2byte	(.L520-.L516)/2
	.2byte	(.L517-.L516)/2
	.2byte	(.L518-.L516)/2
	.2byte	(.L718-.L516)/2
	.2byte	(.L718-.L516)/2
	.2byte	(.L718-.L516)/2
	.2byte	(.L718-.L516)/2
	.2byte	(.L517-.L516)/2
	.2byte	(.L515-.L516)/2
	.p2align 1
.L410:
	ldr	r3, [sp, #100]
	b	.L931
.L407:
	ldr	r3, [r4, #440]
	bic	r3, r3, #7
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	str	r3, [r4, #440]
	b	.L411
.L412:
	ldr	r0, [fp, #92]
	bl	h264e_marking_is_empty
	mov	r6, r0
	cmp	r0, #0
	bne	.L413
	ldrb	r3, [r4, #444]	@ zero_extendqisi2
	add	r1, sp, #92
	orr	r3, r3, #4
	strb	r3, [r4, #444]
	ldr	r0, [fp, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #92]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L414
	tbb	[pc, r2]
.L416:
	.byte	(.L421-.L416)/2
	.byte	(.L420-.L416)/2
	.byte	(.L419-.L416)/2
	.byte	(.L418-.L416)/2
	.byte	(.L681-.L416)/2
	.byte	(.L415-.L416)/2
	.p2align 1
.L421:
	ldr	r2, [sp, #96]
.L417:
	ldrb	r1, [r4, #444]	@ zero_extendqisi2
	bfi	r1, r3, #4, #3
	strb	r1, [r4, #444]
	ldr	r3, [r4, #444]
	bfi	r3, r2, #7, #16
	str	r3, [r4, #444]
	ldrb	r3, [r4, #452]	@ zero_extendqisi2
	bfi	r3, r6, #0, #4
	strb	r3, [r4, #452]
	ldr	r0, [fp, #92]
	bl	h264e_marking_is_empty
	mov	r6, r0
	cmp	r0, #0
	bne	.L413
	add	r1, sp, #92
	ldr	r0, [fp, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #92]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L424
	tbb	[pc, r2]
.L426:
	.byte	(.L431-.L426)/2
	.byte	(.L430-.L426)/2
	.byte	(.L429-.L426)/2
	.byte	(.L428-.L426)/2
	.byte	(.L682-.L426)/2
	.byte	(.L425-.L426)/2
	.p2align 1
.L420:
	ldr	r2, [sp, #100]
	b	.L417
.L419:
	ldr	r2, [sp, #96]
	ldr	r6, [sp, #104]
	b	.L417
.L418:
	ldr	r2, [sp, #108]
	b	.L417
.L415:
	ldr	r2, [sp, #104]
	b	.L417
.L414:
	movw	r2, #1053
	ldr	r1, .L961+12
	ldr	r0, .L961+16
	bl	printk
	movs	r3, #0
.L681:
	movs	r2, #0
	b	.L417
.L431:
	ldr	r2, [sp, #96]
.L427:
	ldrh	r1, [r4, #446]
	strh	r2, [r4, #448]	@ movhi
	bfi	r1, r3, #7, #3
	ldrb	r3, [r4, #452]	@ zero_extendqisi2
	strh	r1, [r4, #446]	@ movhi
	bfi	r3, r6, #4, #4
	strb	r3, [r4, #452]
	ldr	r0, [fp, #92]
	bl	h264e_marking_is_empty
	mov	r6, r0
	cmp	r0, #0
	bne	.L413
	add	r1, sp, #92
	ldr	r0, [fp, #92]
	bl	h264e_marking_rd_op
	ldr	r3, [sp, #92]
	subs	r2, r3, #1
	cmp	r2, #5
	bhi	.L433
	tbb	[pc, r2]
.L435:
	.byte	(.L440-.L435)/2
	.byte	(.L439-.L435)/2
	.byte	(.L438-.L435)/2
	.byte	(.L437-.L435)/2
	.byte	(.L683-.L435)/2
	.byte	(.L434-.L435)/2
	.p2align 1
.L430:
	ldr	r2, [sp, #100]
	b	.L427
.L429:
	ldr	r2, [sp, #96]
	ldr	r6, [sp, #104]
	b	.L427
.L428:
	ldr	r2, [sp, #108]
	b	.L427
.L425:
	ldr	r2, [sp, #104]
	b	.L427
.L424:
	movw	r2, #1089
	ldr	r1, .L961+12
	ldr	r0, .L961+16
	bl	printk
	movs	r3, #0
.L682:
	movs	r2, #0
	b	.L427
.L440:
	ldr	r2, [sp, #96]
.L436:
	ldrb	r1, [r4, #447]	@ zero_extendqisi2
	strh	r2, [r4, #450]	@ movhi
	bfi	r1, r3, #2, #3
	ldrb	r3, [r4, #453]	@ zero_extendqisi2
	strb	r1, [r4, #447]
	bfi	r3, r6, #0, #4
	strb	r3, [r4, #453]
	b	.L413
.L439:
	ldr	r2, [sp, #100]
	b	.L436
.L438:
	ldr	r2, [sp, #96]
	ldr	r6, [sp, #104]
	b	.L436
.L437:
	ldr	r2, [sp, #108]
	b	.L436
.L434:
	ldr	r2, [sp, #104]
	b	.L436
.L433:
	movw	r2, #1125
	ldr	r1, .L961+12
	ldr	r0, .L961+16
	bl	printk
	movs	r3, #0
.L683:
	movs	r2, #0
	b	.L436
.L443:
	cmp	r9, #1
	ite	eq
	moveq	r2, #9
	movne	r2, #6
	bfi	r3, r2, #0, #4
	strb	r3, [r6, #896]
	movw	r3, #4872
	ldr	r2, [r5]
	b	.L932
.L685:
	movs	r3, #0
	b	.L448
.L455:
	ldrb	r1, [r3, #620]	@ zero_extendqisi2
	ldrb	r10, [r3, #624]	@ zero_extendqisi2
	ldrb	r9, [r3, #628]	@ zero_extendqisi2
	str	r1, [sp, #72]
	ldrh	r8, [r3, #632]
	ldrh	lr, [r3, #636]
	ldrh	ip, [r3, #640]
	ldrh	r7, [r3, #644]
	ldrh	r6, [r3, #648]
	ldrh	r0, [r3, #652]
	ldrh	r1, [r3, #656]
	ldrh	r3, [r3, #660]
	str	r3, [sp, #76]
	b	.L454
.L687:
	movw	r3, #341
	mov	r0, r1
	str	r3, [sp, #76]
	mov	r6, r1
	movw	r7, #683
	mov	ip, r1
	mov	lr, r1
	mov	r8, r1
	mov	r9, r1
	mov	r10, r1
	str	r1, [sp, #72]
	b	.L454
.L456:
	cmp	r7, #0
	ite	ne
	movne	r1, #4
	moveq	r1, #255
	b	.L934
.L465:
	and	r1, r1, #-16777216
	orr	r2, r2, #1179666
	orrs	r1, r1, r0
	orr	r2, r2, #4352
	str	r2, [r3, #2124]
.L936:
	str	r1, [r3, #2128]
	b	.L466
.L464:
	cmp	r6, #1
	bne	.L467
	ldr	r0, .L961+20
	and	r2, r2, #-16777216
	orrs	r0, r0, r1
	ldr	r1, [r3, #2124]
	str	r0, [r3, #2116]
	ldr	r0, .L961+24
	orrs	r2, r2, r0
	str	r2, [r3, #2120]
	and	r2, r1, #-16777216
	ldr	r1, .L961+28
	orrs	r1, r1, r2
	ldr	r2, [r3, #2128]
	str	r1, [r3, #2124]
	and	r2, r2, #-16777216
	orrs	r2, r2, r0
	b	.L935
.L467:
	ldr	r0, .L961+32
	and	r2, r2, #-16777216
	orrs	r0, r0, r1
	ldr	r1, .L961+36
	str	r0, [r3, #2116]
	orrs	r2, r2, r1
	str	r2, [r3, #2120]
	ldr	r2, [r3, #2124]
	and	r2, r2, #-16777216
	orr	r2, r2, #1572888
	orr	r2, r2, #6144
	str	r2, [r3, #2124]
	ldr	r2, [r3, #2128]
	and	r2, r2, #-16777216
	orrs	r1, r1, r2
	b	.L936
.L694:
	movs	r2, #3
	b	.L470
.L695:
	movs	r2, #2
	b	.L470
.L962:
	.align	2
.L961:
	.word	hal_h264e_debug
	.word	.LANCHOR0+615
	.word	.LC36
	.word	.LANCHOR0+467
	.word	.LC39
	.word	590850
	.word	1053721
	.word	1184793
	.word	459265
	.word	1316375
.L472:
	cmp	r9, r10
	ite	cc
	movcc	r9, #9
	movcs	r9, #12
	strb	r9, [r6, #1784]
	b	.L473
.L471:
	ldrh	r3, [r6, #1784]
	and	r3, r3, #32512
	orr	r3, r3, #16
	strh	r3, [r6, #1784]	@ movhi
	b	.L473
.L476:
	add	r7, r7, r7, lsl #1
	cmp	r1, r7, lsr #5
	ite	cc
	subcc	r3, r3, #7
	subcs	r3, r3, #6
	b	.L477
.L475:
	cmp	r3, r1, lsr #1
	ite	hi
	movhi	r3, #1
	movls	r3, #0
	cmp	r1, r7, lsr #8
	bcs	.L480
	cmp	r8, #2
	ite	lt
	movlt	r2, #6
	movge	r2, #8
.L947:
	subs	r3, r3, r2
.L937:
	movs	r2, #0
	b	.L479
.L480:
	cmp	r1, r7, lsr #7
	bcs	.L482
	cmp	r8, #2
	ite	lt
	movlt	r2, #5
	movge	r2, #6
	b	.L947
.L482:
	cmp	r10, r1
	bls	.L484
	cmp	r8, #2
	ite	lt
	movlt	r2, #3
	movge	r2, #4
	b	.L947
.L484:
	subs	r3, r3, #1
	b	.L937
.L697:
	movs	r3, #0
.L698:
	movs	r2, #1
	b	.L479
.L702:
	movs	r1, #1
	b	.L486
.L505:
	ldr	r1, [fp, #44]
	cmp	r1, #2
	ldr	r1, [sp, #32]
	ite	eq
	ldreq	r1, [r1, #312]
	ldrne	r1, [r1, #308]
	and	r1, r1, #15
	bfi	r0, r1, #0, #4
	b	.L939
.L520:
	mul	r6, fp, r10
	add	r10, r6, r6, lsl #1
	add	r10, r10, r10, lsr #31
	asr	r10, r10, #1
.L513:
	ldr	r3, [r5, #232]
	ldr	r2, [sp, #76]
	orrs	r3, r2, r3
	beq	.L522
	movs	r3, #0
	strd	r3, r3, [r7, #116]
	str	r3, [r7, #124]
.L523:
	ldr	r3, [r8, #28]
	ldr	r0, [r8]
	cmp	r3, #0
	beq	.L524
	ldr	r1, .L963
	bl	mpp_buffer_get_size_with_caller
	movs	r2, #173
	ldr	r1, [r8]
	mov	r6, r0
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	mov	r1, r6
	mov	r10, r0
	str	r0, [r7, #168]
	ldr	r0, [r8, #12]
	add	r6, r6, r10
	add	r0, r0, r9
	bl	__aeabi_uidivmod
	add	r1, r1, r10
	str	r1, [r7, #172]
	ldr	r3, [r8, #16]
	str	r6, [r7, #164]
	add	r3, r3, r10
	str	r3, [r7, #176]
.L525:
	cmp	r9, #0
	beq	.L528
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #32]
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L529
	str	r9, [r3, #20]
	ldr	r3, [sp, #28]
	ldr	r1, .L963
	ldr	r0, [r3, #32]
	bl	mpp_buffer_flush_for_device_with_caller
.L528:
	ldr	r3, .L963+4
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #2
	beq	.L530
	mov	r2, #1384
	ldr	r1, .L963+8
	ldr	r0, .L963+12
	bl	printk
.L530:
	ldrd	r6, r10, [r5, #16]
	ldr	fp, [r5, #76]
	ldr	r3, [r5, #896]
	mov	r0, r6
	ldr	r7, [r5, #4]
	ldr	r1, [fp, #4]
	str	r3, [sp, #36]
	bl	hal_bufs_get_buf
	ldr	r1, [fp, #20]
	mov	r8, r0
	mov	r0, r6
	bl	hal_bufs_get_buf
	ldr	r3, [r9]
	lsls	r1, r3, #30
	mov	r6, r0
	bpl	.L531
	movw	r2, #1612
	ldr	r1, .L963+16
	ldr	r0, .L963+20
	bl	printk
.L531:
	cmp	r8, #0
	beq	.L532
	ldr	r3, [r8]
	cmp	r3, #0
	beq	.L532
	ldr	r3, [r8, #4]
	ldr	r9, [r3]
	cmp	r9, #0
	bne	.L533
	movw	r1, #1617
	ldr	r3, .L963+24
	str	r1, [sp]
	ldr	r2, .L963+28
	ldr	r0, .L963+32
	bl	printk
.L533:
	movs	r2, #169
	mov	r1, r9
	mov	r0, r7
	bl	mpp_dev_get_iova_address
	ldr	r3, [sp, #36]
	str	r0, [r4, #152]
	cmp	r3, #0
	bne	.L534
	ldr	r3, [r8, #4]
	ldr	r9, [r3, #12]
	cmp	r9, #0
	bne	.L535
	movw	r1, #1622
	ldr	r3, .L963+24
	str	r1, [sp]
	ldr	r2, .L963+36
	ldr	r0, .L963+32
	bl	printk
.L535:
	movs	r2, #163
	mov	r1, r9
	mov	r0, r7
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #128]
	add	r0, r0, r10
	str	r0, [r4, #132]
	cmp	r6, #0
	beq	.L545
.L539:
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L537
.L538:
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L545
	b	.L546
.L518:
	mul	r6, fp, r10
	adds	r10, r6, r6, lsl #2
	it	mi
	addmi	r10, r10, #3
	asr	r10, r10, #2
	b	.L513
.L517:
	mul	r6, fp, r10
.L717:
	mov	r10, r6
	b	.L513
.L515:
	mul	r6, fp, r10
	lsl	r10, r6, #1
	b	.L513
.L718:
	mov	r10, #0
	b	.L513
.L716:
	mov	r10, #0
	mov	r6, r10
	b	.L513
.L522:
	movs	r2, #160
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
	add	r6, r6, r0
	str	r0, [r7, #116]
	str	r6, [r7, #120]
	add	r0, r0, r10
	str	r0, [r7, #124]
	b	.L523
.L524:
	cbz	r0, .L526
	mov	r1, r0
	movs	r2, #173
	ldr	r0, [sp, #36]
	bl	mpp_dev_get_iova_address
.L527:
	ldr	r3, [r8, #12]
	str	r0, [r7, #176]
	add	r3, r3, r0
	str	r3, [r7, #168]
	add	r3, r9, r0
	str	r3, [r7, #172]
	ldr	r3, [r8, #24]
	subs	r3, r3, #1
	add	r3, r3, r0
	str	r3, [r7, #164]
	b	.L525
.L526:
	ldr	r0, [r8, #4]
	b	.L527
.L529:
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L528
	ldr	r0, [r5, #4]
	bl	mpp_get_dev
	mov	r2, r9
	ldr	r3, [sp, #28]
	ldr	r1, [r3, #32]
	movs	r3, #1
	ldr	r1, [r1, #4]
	bl	dma_sync_single_for_device
	b	.L528
.L532:
	cmp	r6, #0
	bne	.L539
	b	.L538
.L964:
	.align	2
.L963:
	.word	.LANCHOR0+636
	.word	hal_h264e_debug
	.word	.LANCHOR0+615
	.word	.LC37
	.word	.LANCHOR0+657
	.word	.LC36
	.word	.LANCHOR0+681
	.word	.LC41
	.word	.LC42
	.word	.LC43
.L537:
	ldr	r3, [r6, #4]
	ldr	r9, [r3]
	cmp	r9, #0
	bne	.L540
	movw	r1, #1631
	ldr	r3, .L965
	str	r1, [sp]
	ldr	r2, .L965+4
	ldr	r0, .L965+8
	bl	printk
.L540:
	movs	r2, #170
	mov	r1, r9
	mov	r0, r7
	bl	mpp_dev_get_iova_address
	ldr	r3, [sp, #36]
	str	r0, [r4, #156]
	cmp	r3, #0
	beq	.L541
.L546:
	ldr	r9, [r5, #76]
	ldr	r3, [r5, #896]
	ldr	r10, [r9, #8]
	str	r3, [sp, #72]
	ldr	r3, [r9, #12]
	ldr	fp, [r9, #24]
	str	r3, [sp, #76]
	ldr	r3, [sp, #72]
	cbz	r3, .L543
	movs	r2, #163
	ldr	r1, [r5, #900]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	str	r0, [sp, #40]
.L543:
	ldr	r3, .L965+12
	ldr	r2, [r9, #16]
	ldr	r3, [r3]
	and	r3, r3, #128
	cmp	r2, #0
	beq	.L547
	ldr	r1, [r9, #4]
	ldr	r2, [r9, #20]
	cmp	r1, r2
	bne	.L547
	cbz	r3, .L548
	mov	r3, r10
	mov	r2, #1472
	ldr	r1, .L965+16
	ldr	r0, .L965+20
	bl	printk
.L548:
	ldr	r3, [r5, #928]
	str	r3, [sp, #52]
	ldr	r3, [r5, #932]
	str	r3, [sp, #48]
	ldr	r3, [r5, #976]
	str	r3, [sp, #60]
	ldr	r3, [r5, #980]
	str	r3, [sp, #56]
	cmp	r10, #0
	beq	.L549
	ldr	r3, [r5, #912]
	ldr	r2, [sp, #52]
	str	r3, [sp, #20]
	ldr	r3, [r5, #960]
	str	r3, [sp, #24]
	ldr	r3, [r5, #904]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r5, #908]
	str	r2, [sp, #52]
	ldr	r2, [sp, #48]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r5, #952]
	str	r2, [sp, #48]
	ldr	r2, [sp, #60]
	cmp	r2, r3
	it	cs
	movcs	r2, r3
	ldr	r3, [r5, #956]
	str	r2, [sp, #60]
	ldr	r2, [sp, #56]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [sp, #24]
	str	r2, [sp, #56]
.L940:
	str	r3, [sp, #68]
	ldr	r3, [sp, #20]
	str	r3, [sp, #64]
.L550:
	ldr	r2, [sp, #40]
	ldr	r3, [sp, #20]
	add	r3, r3, r2
	str	r3, [r4, #128]
	ldr	r3, [sp, #24]
	add	r3, r3, r2
	str	r3, [r4, #132]
	ldr	r3, [sp, #64]
	add	r3, r3, r2
	str	r3, [r4, #136]
	ldr	r3, [sp, #68]
	add	r3, r3, r2
	str	r3, [r4, #140]
	ldr	r3, [sp, #48]
	add	r3, r3, r2
	str	r3, [r4, #196]
	ldr	r3, [sp, #52]
	add	r3, r3, r2
	str	r3, [r4, #200]
	ldr	r3, [sp, #56]
	add	r3, r3, r2
	str	r3, [r4, #204]
	ldr	r3, [sp, #60]
	add	r3, r3, r2
	str	r3, [r4, #208]
	ldr	r3, [sp, #76]
	ldrb	r2, [r4, #244]	@ zero_extendqisi2
	clz	r3, r3
	lsrs	r3, r3, #5
	bfi	r2, r3, #2, #1
	strb	r2, [r4, #244]
	ldr	r2, [sp, #72]
	cmp	r2, #0
	beq	.L565
	ldr	r9, .L965+12
	ldr	r2, [r9]
	lsls	r2, r2, #24
	bpl	.L675
	movw	r2, #1581
	ldr	r1, .L965+16
	ldr	r0, .L965+24
	bl	printk
	ldr	r3, [r9]
	lsls	r3, r3, #24
	bpl	.L675
	ldr	r3, [r5, #940]
	movw	r2, #1583
	ldr	r1, .L965+16
	ldr	r0, .L965+28
	str	r3, [sp, #12]
	ldr	r3, [r5, #936]
	str	r3, [sp, #8]
	ldr	r3, [r5, #928]
	str	r3, [sp, #4]
	ldr	r3, [r5, #932]
	str	r3, [sp]
	ldr	r3, [r5, #944]
	bl	printk
	ldr	r3, [r9]
	lsls	r0, r3, #24
	bpl	.L675
	ldr	r3, [r5, #988]
	movw	r2, #1585
	ldr	r1, .L965+16
	ldr	r0, .L965+32
	str	r3, [sp, #12]
	ldr	r3, [r5, #984]
	str	r3, [sp, #8]
	ldr	r3, [r5, #976]
	str	r3, [sp, #4]
	ldr	r3, [r5, #980]
	str	r3, [sp]
	ldr	r3, [r5, #992]
	bl	printk
.L675:
	ldr	r3, [sp, #76]
	cbnz	r3, .L565
	ldr	r3, [r5, #936]
	ldr	r2, [r5, #944]
	str	r3, [r5, #940]
	add	r3, r3, r2
	ldr	r2, [r5, #932]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r5, #928]
	addcs	r3, r3, r2
	str	r3, [r5, #936]
	ldr	r3, [r5, #984]
	ldr	r2, [r5, #992]
	str	r3, [r5, #988]
	add	r3, r3, r2
	ldr	r2, [r5, #980]
	cmp	r3, r2
	ittt	cs
	subcs	r3, r3, r2
	ldrcs	r2, [r5, #976]
	addcs	r3, r3, r2
	str	r3, [r5, #984]
.L565:
	ldr	r3, [r5, #44]
	cmp	r3, #0
	beq	.L571
	ldr	r3, [sp, #36]
	cmp	r3, #0
	beq	.L572
	ldr	r2, [r5, #948]
	ldr	r3, [r5, #924]
	ldr	r10, [r5, #900]
	add	r9, r2, r3
.L573:
	ldr	r1, .L965
	mov	r0, r10
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L965
	mov	fp, r0
	mov	r0, r10
	bl	mpp_buffer_get_dma_with_caller
	mov	r10, r0
	cmp	fp, #0
	bne	.L574
	movw	r1, #1673
	ldr	r3, .L965
	str	r1, [sp]
	ldr	r2, .L965+36
	ldr	r0, .L965+8
	bl	printk
.L574:
	cmp	r10, #0
	bne	.L575
	movw	r1, #1674
	ldr	r3, .L965
	str	r1, [sp]
	ldr	r2, .L965+40
	ldr	r0, .L965+8
	bl	printk
.L575:
	mov	r2, r9
	movs	r1, #0
	mov	r0, fp
	bl	memset
	mov	r3, r9
	movs	r2, #0
	movs	r1, #1
	mov	r0, r10
	bl	dma_buf_end_cpu_access_partial
	movs	r3, #0
	str	r3, [r5, #44]
.L571:
	ldr	r3, [r8, #4]
	movs	r2, #185
	mov	r0, r7
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	movs	r2, #184
	str	r0, [r4, #216]
	mov	r0, r7
	ldr	r3, [r6, #4]
	ldr	r1, [r3, #8]
	bl	mpp_dev_get_iova_address
	ldr	r3, .L965+12
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #2
	str	r0, [r4, #212]
	beq	.L576
	movw	r2, #1683
	ldr	r1, .L965+44
	ldr	r0, .L965+48
	bl	printk
.L576:
	ldr	r3, [sp, #28]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_offset_y
	ldrh	r3, [r4, #294]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #294]	@ movhi
	ldr	r3, [sp, #28]
	ldr	r0, [r3, #52]
	bl	mpp_frame_get_offset_x
	ldrh	r3, [r4, #292]
	bfi	r3, r0, #0, #14
	strh	r3, [r4, #292]	@ movhi
	ldr	r3, [r8]
	lsls	r1, r3, #30
	bpl	.L577
	movw	r2, #1690
	ldr	r1, .L965+52
	ldr	r0, .L965+56
	bl	printk
	b	.L966
.L967:
	.align	2
.L965:
	.word	.LANCHOR0+681
	.word	.LC41
	.word	.LC42
	.word	hal_h264e_debug
	.word	.LANCHOR0+705
	.word	.LC44
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LANCHOR0+657
	.word	.LC37
	.word	.LANCHOR0+744
	.word	.LC36
.L966:
.L577:
	ldr	r3, [sp, #32]
	ldr	r3, [r3, #3544]
	cmp	r3, #1
	beq	.L578
	cmp	r3, #0
	beq	.L579
	cmp	r3, #2
	beq	.L580
	movw	r2, #1727
	ldr	r1, .L968
	ldr	r0, .L968+4
	bl	printk
	b	.L582
.L541:
	ldr	r3, [r6, #4]
	ldr	r9, [r3, #12]
	cmp	r9, #0
	bne	.L544
	movw	r1, #1636
	ldr	r3, .L968+8
	str	r1, [sp]
	ldr	r2, .L968+12
	ldr	r0, .L968+16
	bl	printk
.L544:
	movs	r2, #165
	mov	r1, r9
	mov	r0, r7
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #136]
	add	r0, r0, r10
	str	r0, [r4, #140]
.L545:
	mov	r2, #-1
	movs	r3, #0
	strd	r2, r3, [r4, #196]
	strd	r2, r3, [r4, #204]
	b	.L565
.L549:
	ldr	r3, [r5, #936]
	str	r3, [sp, #20]
	ldr	r3, [r5, #984]
	str	r3, [sp, #24]
	b	.L940
.L547:
	ldr	r1, .L968+20
	add	r10, fp, r10, lsl #1
	add	r10, r1, r10, lsl #2
	ldr	r9, [r10, #728]
	cbz	r3, .L551
	mov	r3, r9
	movw	r2, #1497
	addw	r1, r1, #705
	ldr	r0, .L968+24
	bl	printk
.L551:
	cmp	r9, #3
	bhi	.L550
	tbb	[pc, r9]
.L553:
	.byte	(.L556-.L553)/2
	.byte	(.L555-.L553)/2
	.byte	(.L554-.L553)/2
	.byte	(.L552-.L553)/2
	.p2align 1
.L556:
	ldr	r3, [r5, #940]
	str	r3, [sp, #64]
	ldr	r3, [r5, #988]
	str	r3, [sp, #68]
	ldr	r3, [r5, #936]
	str	r3, [sp, #20]
	ldr	r3, [r5, #984]
	str	r3, [sp, #24]
	ldr	r3, [r5, #928]
	str	r3, [sp, #52]
	ldr	r3, [r5, #932]
	str	r3, [sp, #48]
	ldr	r3, [r5, #976]
	str	r3, [sp, #60]
	ldr	r3, [r5, #980]
.L941:
	str	r3, [sp, #56]
	b	.L550
.L555:
	ldr	r3, [r5, #912]
	str	r3, [sp, #64]
	ldr	r3, [r5, #960]
	str	r3, [sp, #68]
	ldr	r3, [r5, #928]
	str	r3, [sp, #20]
	str	r3, [r5, #936]
	ldr	r3, [r5, #976]
	ldr	r2, [sp, #20]
	str	r3, [sp, #24]
	str	r3, [r5, #984]
	ldr	r3, [r5, #904]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	ldr	r2, [r5, #908]
	str	r3, [sp, #52]
	ldr	r3, [r5, #932]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	ldr	r3, [r5, #952]
	str	r2, [sp, #48]
	ldr	r2, [sp, #24]
	cmp	r3, r2
	it	cs
	movcs	r3, r2
	ldr	r2, [r5, #956]
	str	r3, [sp, #60]
	ldr	r3, [r5, #980]
	cmp	r2, r3
	it	cc
	movcc	r2, r3
	mov	r3, r2
	b	.L941
.L554:
	ldr	r0, .L968+28
	movw	r1, #1529
.L942:
	bl	printk
	b	.L550
.L552:
	ldr	r3, [r5, #252]
	cmp	r3, #0
	bne	.L557
	ldr	r1, [r5, #912]
	add	lr, r5, #928
	add	r3, r5, #952
	add	r2, r5, #904
	add	ip, r5, #976
	add	fp, sp, #92
	str	r1, [sp, #64]
	mov	r9, lr
	ldr	r1, [r5, #960]
	str	r1, [sp, #68]
	ldr	r1, [r5, #928]
	str	r1, [sp, #20]
	str	r1, [r5, #936]
	ldr	r1, [r5, #976]
	ldr	r0, [sp, #20]
	str	r1, [sp, #24]
	str	r1, [r5, #984]
	ldr	r1, [r5, #904]
	cmp	r1, r0
	it	cs
	movcs	r1, r0
	ldr	r0, [r5, #908]
	str	r1, [sp, #52]
	ldr	r1, [r5, #932]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	ldr	r1, [r5, #952]
	str	r0, [sp, #48]
	ldr	r0, [sp, #24]
	cmp	r1, r0
	it	cs
	movcs	r1, r0
	ldr	r0, [r5, #956]
	str	r1, [sp, #60]
	ldr	r1, [r5, #980]
	cmp	r0, r1
	it	cc
	movcc	r0, r1
	str	r0, [sp, #56]
.L558:
	ldr	r0, [r9]	@ unaligned
	add	r9, r9, #8
	ldr	r1, [r9, #-4]	@ unaligned
	cmp	r9, r3
	mov	r10, fp
	stmia	r10!, {r0, r1}
	mov	fp, r10
	bne	.L558
	add	r0, r2, #24
	mov	r1, r2
.L559:
	ldr	r9, [r1], #4	@ unaligned
	cmp	r1, r0
	str	r9, [lr], #4	@ unaligned
	bne	.L559
	add	r9, sp, #92
	add	r10, sp, #116
.L560:
	mov	lr, r9
	adds	r2, r2, #8
	ldmia	lr!, {r0, r1}
	cmp	lr, r10
	str	r0, [r2, #-8]	@ unaligned
	mov	r9, lr
	str	r1, [r2, #-4]	@ unaligned
	bne	.L560
	add	r9, sp, #92
	add	r10, ip, #24
	mov	r2, ip
.L561:
	ldr	r0, [r2]	@ unaligned
	adds	r2, r2, #8
	ldr	r1, [r2, #-4]	@ unaligned
	cmp	r2, r10
	mov	lr, r9
	stmia	lr!, {r0, r1}
	mov	r9, lr
	bne	.L561
	add	r1, r3, #24
	mov	r2, r3
.L562:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [ip], #4	@ unaligned
	bne	.L562
	add	ip, sp, #92
	add	lr, sp, #116
.L563:
	mov	r2, ip
	adds	r3, r3, #8
	ldmia	r2!, {r0, r1}
	cmp	r2, lr
	str	r0, [r3, #-8]	@ unaligned
	mov	ip, r2
	str	r1, [r3, #-4]	@ unaligned
	bne	.L563
	b	.L550
.L557:
	movw	r1, #1557
	ldr	r0, .L968+32
	b	.L942
.L572:
	ldr	r3, [r8, #4]
	ldr	r9, [r5, #20]
	ldr	r10, [r3, #12]
	b	.L573
.L969:
	.align	2
.L968:
	.word	.LANCHOR0+744
	.word	.LC53
	.word	.LANCHOR0+681
	.word	.LC43
	.word	.LC42
	.word	.LANCHOR0
	.word	.LC45
	.word	.LC46
	.word	.LC47
.L579:
	ldr	r1, [r4, #340]
	ldr	r2, .L970
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
.L582:
	ldr	r2, [sp, #32]
	movs	r3, #0
	str	r3, [r2, #3540]
	ldr	r3, [r8]
	lsls	r2, r3, #30
	bpl	.L583
	movw	r2, #1732
	ldr	r1, .L970+4
	ldr	r0, .L970+8
	bl	printk
.L583:
	ldr	r2, [r5]
	movw	r3, #4852
	ldr	r6, [r5, #204]
	ldr	r7, [r2, r3]
	ldr	r3, [r8]
	lsls	r3, r3, #30
	bpl	.L584
	movw	r2, #1742
	ldr	r1, .L970+12
	ldr	r0, .L970+16
	bl	printk
.L584:
	movw	r3, #52479
	str	r3, [r6, #356]
	ldr	r3, [r6, #360]
	movs	r2, #64
	cmp	r7, #1
	and	r3, r3, #-2013265920
	orr	r3, r3, #15859712
	orr	r3, r3, #54
	str	r3, [r6, #360]
	ldrh	r3, [r6, #364]
	bfi	r3, r2, #0, #13
	strh	r3, [r6, #364]	@ movhi
	ldrh	r3, [r6, #1140]
	ldr	r2, .L970+20
	bic	r3, r3, #32640
	bic	r3, r3, #119
	orr	r3, r3, #258
	orr	r3, r3, #1
	strh	r3, [r6, #1140]	@ movhi
	ldr	r3, [r6, #1144]
	and	r2, r2, r3
	ldr	r3, .L970+24
	orr	r3, r3, r2
	str	r3, [r6, #1144]
	ldr	r3, [r6, #1148]
	ldr	r2, [r6, #1156]
	lsr	r3, r3, #20
	lsl	r3, r3, #20
	orr	r3, r3, #643072
	orr	r3, r3, #16
	str	r3, [r6, #1148]
	ldr	r3, .L970+28
	str	r3, [r6, #1152]
	ldr	r3, .L970+32
	and	r3, r3, r2
	ldr	r2, [r6, #1160]
	orr	r3, r3, #33
	str	r3, [r6, #1156]
	ldr	r3, [r6, #1164]
	and	r2, r2, #-268374016
	orr	r2, r2, #1048576
	and	r1, r3, #-1073741824
	ldr	r3, .L970+36
	orr	r2, r2, #8
	str	r2, [r6, #1160]
	orr	r3, r3, r1
	str	r3, [r6, #1164]
	beq	.L585
	bic	r3, r3, #1069547520
	ldrh	r1, [r6, #1148]
	bic	r3, r3, #4177920
	and	r2, r2, #-268374016
	bic	r3, r3, #15360
	bfc	r1, #0, #12
	orr	r3, r3, #4194304
	strh	r1, [r6, #1148]	@ movhi
	orr	r3, r3, #4096
	mov	r1, #67372036
	str	r2, [r6, #1160]
	str	r1, [r6, #1152]
	str	r3, [r6, #1164]
.L585:
	ldr	r3, [r6, #1168]
	and	r2, r3, #-16777216
	ldr	r3, .L970+40
	orrs	r3, r3, r2
	str	r3, [r6, #1168]
	ldr	r3, [r6, #872]
	and	r2, r3, #-16777216
	ldr	r3, .L970+44
	orrs	r3, r3, r2
	str	r3, [r6, #872]
	ldr	r3, [r6, #876]
	movs	r2, #240
	and	r3, r3, #-268374016
	orr	r3, r3, #9437184
	orr	r3, r3, #64
	str	r3, [r6, #876]
	ldrh	r3, [r6, #880]
	bfi	r3, r2, #0, #12
	strh	r3, [r6, #880]	@ movhi
	ldr	r3, [r8]
	lsls	r0, r3, #30
	bpl	.L586
	movw	r2, #1811
	ldr	r1, .L970+12
	ldr	r0, .L970+8
	bl	printk
.L586:
	ldr	r1, [r5, #228]
	cmp	r1, #0
	beq	.L587
	movs	r2, #179
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	str	r0, [r4, #192]
	ldr	r3, [r5, #56]
	add	r3, r3, r0
	str	r3, [r4, #188]
.L588:
	ldr	r3, [r8]
	ldr	r6, [r5, #204]
	lsls	r1, r3, #30
	bpl	.L589
	movw	r2, #2437
	ldr	r1, .L970+48
	ldr	r0, .L970+16
	bl	printk
.L589:
	ldr	r3, [r5, #68]
	ldr	r3, [r3, #72]
	cmp	r3, #1
	bne	.L590
	ldr	r2, .L970+52
	addw	r3, r6, #2131
	addw	r6, r6, #2195
	add	r1, r2, #64
.L591:
	ldrb	r0, [r2], #-1	@ zero_extendqisi2
	strb	r0, [r3, #1]!
	cmp	r6, r3
	ldrb	r0, [r1], #-1	@ zero_extendqisi2
	strb	r0, [r3, #64]
	bne	.L591
.L592:
	ldr	r3, [r8]
	lsls	r2, r3, #30
	bpl	.L594
	movw	r2, #2452
	ldr	r1, .L970+48
	ldr	r0, .L970+8
	bl	printk
.L594:
	ldr	r3, [r5, #240]
	cmp	r3, #0
	beq	.L596
	ldr	r0, [r5, #1004]
	cbz	r0, .L597
	ldr	r3, [r5, #1008]
	cbz	r3, .L597
	ldr	r3, [r5, #1012]
	cmp	r3, #0
	bne	.L598
.L597:
	ldr	r3, [r5]
	ldr	r6, [r3, #28]
	ldr	r7, [r3, #32]
	adds	r6, r6, #63
	bics	r6, r6, #63
	add	r7, r7, #63
	it	mi
	addmi	r6, r6, #15
	bics	r7, r7, #63
	it	mi
	addmi	r7, r7, #15
	asrs	r6, r6, #4
	asrs	r7, r7, #4
	cbnz	r0, .L602
	mul	r2, r7, r6
	ldr	r9, .L970+72
	ldr	r3, .L970+56
	add	r1, r5, #1004
	str	r9, [sp]
	lsls	r2, r2, #2
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #1004]
	cbnz	r3, .L602
	movw	r1, #2468
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L970+60
	ldr	r0, .L970+64
	bl	printk
.L602:
	ldr	r0, [r5, #1008]
	cbnz	r0, .L605
	mul	r2, r7, r6
	ldr	r9, .L970+72
	ldr	r3, .L970+56
	add	r1, r5, #1008
	str	r9, [sp]
	lsls	r2, r2, #4
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #1008]
	cbnz	r3, .L605
	movw	r1, #2472
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L970+68
	ldr	r0, .L970+64
	bl	printk
.L605:
	ldr	r3, [r5, #1012]
	cbnz	r3, .L598
	mul	r1, r7, r6
	ldr	r0, .L970+72
	bl	mpp_osal_calloc
	str	r0, [r5, #1012]
	cbnz	r0, .L598
	movw	r1, #2476
	ldr	r3, .L970+72
	str	r1, [sp]
	ldr	r2, .L970+76
	ldr	r0, .L970+64
	bl	printk
.L598:
	ldr	r1, [r5, #1004]
	cbz	r1, .L608
	movs	r2, #171
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r4, #244]
	str	r0, [r4, #160]
	b	.L971
.L972:
	.align	2
.L970:
	.word	-2147450888
	.word	.LANCHOR0+744
	.word	.LC37
	.word	.LANCHOR0+764
	.word	.LC36
	.word	-536346112
	.word	83935248
	.word	336595976
	.word	-268370040
	.word	12591108
	.word	8413248
	.word	1313797
	.word	.LANCHOR0+781
	.word	.LANCHOR0+871
	.word	.LC33
	.word	.LC55
	.word	.LC42
	.word	.LC56
	.word	.LANCHOR0+936
	.word	.LC57
.L971:
.L608:
	ldr	r3, [sp, #28]
	ldr	r3, [r3, #4]
	ldr	r7, [r3, #212]
	cmp	r7, #0
	bne	.L596
	ldr	r2, [sp, #32]
	movw	r3, #4860
	ldr	r3, [r2, r3]
	cmp	r3, #3
	bgt	.L596
	movw	r3, #4852
	ldr	r3, [r2, r3]
	cmp	r3, #1
	bne	.L596
	ldr	r3, [r5]
	ldr	r9, [r5, #204]
	ldrd	r10, r6, [r3, #12]
	ldr	r3, [r8]
	lsls	r3, r3, #30
	bpl	.L610
	movw	r2, #2399
	ldr	r1, .L973
	ldr	r0, .L973+4
	bl	printk
.L610:
	ldr	r3, [r5, #1004]
	cmp	r3, #0
	beq	.L596
	ldr	r3, [r5, #1008]
	cmp	r3, #0
	beq	.L596
	ldr	r3, [r5, #1012]
	cmp	r3, #0
	beq	.L596
	ldr	r3, [r5, #224]
	ldrb	r2, [r9, #912]	@ zero_extendqisi2
	ldr	r3, [r3, #44]
	subs	r3, r3, #2
	it	ne
	movne	r3, #1
	bfi	r2, r3, #0, #1
	strb	r2, [r9, #912]
	ldr	r2, .L973+8
	ldr	r3, [r9, #912]
	ands	r2, r2, r3
	ldr	r3, .L973+12
	orrs	r3, r3, r2
	add	r2, r10, #63
	str	r3, [r9, #912]
	add	r3, r6, #15
	bic	r1, r2, #63
	bic	r2, r3, #15
	ldr	r3, [r5, #224]
	muls	r2, r1, r2
	it	mi
	addmi	r2, r2, #255
	ldr	r3, [r3, #44]
	asrs	r6, r2, #8
	cmp	r3, #2
	bne	.L612
	mov	r2, r6
	movs	r1, #0
	ldr	r0, [r5, #1012]
	bl	memset
.L613:
	movs	r2, #186
	ldr	r1, [r5, #1008]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	ldr	r3, .L973+16
	ldr	r3, [r3]
	lsls	r6, r3, #30
	str	r0, [r9, #220]
	bpl	.L596
	movw	r2, #2428
	ldr	r1, .L973
	ldr	r0, .L973+20
	bl	printk
.L596:
	ldr	r3, [r5, #196]
	cbz	r3, .L663
	add	r0, r5, #188
	bl	vepu500_set_osd
.L663:
	ldr	r1, [r5, #184]
	cbz	r1, .L664
	ldr	r2, [r5]
	add	r0, r4, #916
	ldrd	r2, r3, [r2, #12]
	bl	vepu500_set_roi
.L664:
	ldr	r3, [sp, #44]
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	lsls	r0, r3, #29
	bpl	.L665
	ldr	r0, [r5, #200]
	cmp	r0, #0
	bne	.L666
	mov	r1, r5
	ldr	r6, [r1], #200
	ldr	r2, [r6, #12]
	adds	r2, r2, #15
	bic	r3, r2, #15
	ldr	r2, [r6, #16]
	adds	r2, r2, #15
	bic	r2, r2, #15
	muls	r2, r3, r2
	ldr	r3, .L973+24
	str	r3, [sp]
	ldr	r3, .L973+28
	add	r2, r2, r2, lsl #1
	asrs	r2, r2, #1
	bl	mpp_buffer_get_with_tag
	ldr	r3, [r5, #200]
	cmp	r3, #0
	bne	.L666
	movw	r1, #877
	ldr	r0, .L973+32
	bl	printk
.L665:
	ldr	r3, [sp, #44]
	ldr	r7, .L973+16
	ldrb	r3, [r3, #152]	@ zero_extendqisi2
	tst	r3, #8
	beq	.L668
	ldr	r3, [r7]
	ldr	r6, [r5]
	lsls	r1, r3, #30
	bpl	.L669
	mov	r2, #900
	ldr	r1, .L973+36
	ldr	r0, .L973+4
	bl	printk
.L669:
	ldr	r3, [r6, #12]
	movs	r2, #216
	strb	r2, [r4, #268]
	adds	r3, r3, #15
	ldr	r2, [r4, #296]
	bic	r3, r3, #15
	bfi	r2, r3, #0, #21
	str	r2, [r4, #296]
	lsls	r6, r3, #1
	movs	r2, #160
	add	r3, r3, r6
	strh	r3, [r4, #300]	@ movhi
	ldrb	r3, [r4, #291]	@ zero_extendqisi2
	bic	r3, r3, #28
	strb	r3, [r4, #291]
	ldr	r3, [r4, #292]
	and	r3, r3, #-1073692672
	str	r3, [r4, #292]
	ldr	r1, [r5, #200]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	movs	r3, #0
	str	r3, [r4, #124]
	ldr	r3, [r7]
	lsls	r2, r3, #30
	add	r6, r6, r0
	str	r0, [r4, #116]
	str	r6, [r4, #120]
	bpl	.L668
	mov	r2, #924
	ldr	r1, .L973+36
	ldr	r0, .L973+20
	bl	printk
.L668:
	ldr	r3, [r5, #8]
	adds	r3, r3, #1
	str	r3, [r5, #8]
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L377
	mov	r3, r5
	movw	r2, #2558
	ldr	r1, .L973+40
	ldr	r0, .L973+44
	bl	printk
.L377:
	ldr	r0, [sp, #80]
	add	sp, sp, #124
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L578:
	ldr	r3, [r4, #340]
	ldr	r2, .L973+48
	ands	r2, r2, r3
	ldr	r3, .L973+52
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [r4, #348]
	bfc	r3, #0, #20
	str	r3, [r4, #348]
	ldr	r2, [sp, #32]
	ldr	r3, [r4, #344]
	ldr	r2, [r2, #3548]
	bfi	r3, r2, #0, #20
.L943:
	str	r3, [r4, #344]
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	bfc	r3, #6, #1
	strb	r3, [r4, #247]
	b	.L582
.L580:
	ldr	r3, [r4, #340]
	ldr	r2, .L973+48
	ands	r2, r2, r3
	ldr	r3, .L973+56
	orrs	r3, r3, r2
	str	r3, [r4, #340]
	ldr	r3, [sp, #32]
	ldr	r2, [r4, #348]
	ldr	r3, [r3, #3548]
	subs	r3, r3, #1
	bfi	r2, r3, #0, #20
	ldr	r3, [r4, #344]
	str	r2, [r4, #348]
	bfc	r3, #0, #20
	b	.L943
.L587:
	str	r1, [r4, #192]
	b	.L588
.L590:
	cmp	r3, #2
	bne	.L592
	movw	r2, #2449
	ldr	r1, .L973+60
	ldr	r0, .L973+64
	bl	printk
	b	.L592
.L974:
	.align	2
.L973:
	.word	.LANCHOR0+969
	.word	.LC36
	.word	-524287
	.word	209570
	.word	hal_h264e_debug
	.word	.LC37
	.word	.LANCHOR0+1139
	.word	.LC33
	.word	.LC58
	.word	.LANCHOR0+1170
	.word	.LANCHOR0+400
	.word	.LC11
	.word	-2147450888
	.word	32800769
	.word	32800771
	.word	.LANCHOR0+781
	.word	.LC54
.L612:
	ldr	r1, .L975
	ldr	r0, [r5, #1008]
	bl	mpp_buffer_get_ptr_with_caller
	lsls	r2, r6, #2
	movs	r1, #0
	bl	memset
	ldr	r6, [r5, #244]
	ldr	r0, [r5]
	ldr	r10, [r5, #1004]
	cmp	r6, #0
	beq	.L614
	ldr	r2, [r0, #12]
	ldr	r6, [r0, #16]
	mov	r0, r10
	add	r3, r2, #63
	adds	r2, r2, #255
	adds	r6, r6, #15
	bic	r3, r3, #63
	bic	r6, r6, #15
	muls	r6, r3, r6
	it	mi
	addmi	r6, r6, #255
	bics	r2, r2, #255
	it	mi
	addmi	r2, r2, #15
	cmp	r3, #0
	it	lt
	addlt	r3, r3, #15
	ldr	r1, .L975+4
	asrs	r2, r2, #4
	str	r2, [sp, #20]
	asrs	r3, r3, #4
	str	r3, [sp, #24]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r3, [r8]
	asrs	r6, r6, #8
	ldr	fp, [r5, #1012]
	str	r0, [sp, #28]
	lsls	r0, r3, #30
	bpl	.L618
	movw	r2, #2326
	ldr	r1, .L975+8
	ldr	r0, .L975+12
	bl	printk
.L618:
	ldr	r1, .L975+4
	mov	r0, r10
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	mov	r8, #0
	add	r3, fp, #-1
	mov	r10, r8
.L619:
	cmp	r6, r10
	bne	.L622
	ldr	r10, [r5, #204]
	ldr	r1, .L975+4
	ldr	r0, [r5, #1008]
	bl	mpp_buffer_get_ptr_with_caller
	ldrb	r3, [r10, #245]	@ zero_extendqisi2
	and	r3, r3, #63
	cmp	r3, #35
	ble	.L623
	cmp	r3, #41
	ble	.L722
	cmp	r3, #46
	ite	lt
	movlt	r7, #2
	movge	r7, #3
.L623:
	movs	r2, #100
	mul	r8, r2, r8
	movs	r2, #10
	muls	r2, r6, r2
	cmp	r8, r2
	bcc	.L624
.L637:
	ldr	r3, .L975+16
	ldr	r3, [r3]
	lsls	r3, r3, #30
	bpl	.L638
	ldr	r1, .L975+8
	movw	r2, #2387
.L945:
	ldr	r0, .L975+20
	bl	printk
.L638:
	ldr	r1, .L975
	ldr	r0, [r5, #1008]
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #1
	bl	dma_buf_end_cpu_access
	b	.L613
.L622:
	ldr	r1, [sp, #24]
	mov	r0, r10
	str	r3, [sp, #32]
	bl	__aeabi_uidivmod
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #28]
	mla	r0, r3, r0, r2
	ldr	r3, [sp, #32]
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	ldrb	r1, [r0, r1]	@ zero_extendqisi2
	lsls	r2, r2, #2
	and	r2, r2, #60
	lsls	r1, r1, #2
	and	r1, r1, #252
	cmp	r1, #144
	bhi	.L719
	cmp	r1, #72
	ite	ls
	movls	r1, #0
	movhi	r1, #1
.L620:
	orrs	r2, r2, r1
	strb	r2, [r3, #1]!
	tst	r2, #3
	ite	eq
	moveq	r0, #1
	movne	r0, #0
	lsls	r1, r2, #28
	bmi	.L720
	ands	r1, r2, #48
	beq	.L721
	tst	r2, #12
	ite	ne
	movne	r2, #1
	moveq	r2, #0
.L621:
	ands	r2, r2, r0
	add	r10, r10, #1
	add	r8, r8, r2
	b	.L619
.L719:
	movs	r1, #2
	b	.L620
.L720:
	movs	r2, #1
	b	.L621
.L721:
	mov	r2, r1
	b	.L621
.L722:
	movs	r7, #1
	b	.L623
.L624:
	ldr	r2, [r5]
	cmp	r3, #40
	movw	r1, #4860
	ldr	r2, [r2, r1]
	ldrh	r1, [r10, #912]
	ble	.L627
	movs	r3, #27
.L944:
	cmp	r8, r6, lsl #1
	bfi	r1, r3, #6, #6
	ite	cc
	addcc	r7, r7, #2
	addcs	r7, r7, #1
	cmp	r2, #1
	it	le
	suble	r7, r7, #1
	strh	r1, [r10, #912]	@ movhi
	cmp	r7, #0
	mov	r2, #0
	mov	r1, #3
	it	eq
	moveq	r7, #1
	rsb	r7, r7, #128
.L633:
	cmp	r6, r2
	beq	.L637
	ldrb	r3, [fp, r2]	@ zero_extendqisi2
	tst	r3, #8
	bne	.L634
	tst	r3, #48
	beq	.L635
	tst	r3, #12
	beq	.L635
.L634:
	lsls	r3, r3, #30
	bne	.L635
	add	r3, r0, r2, lsl #2
	strb	r7, [r0, r2, lsl #2]
	ldrb	ip, [r3, #2]	@ zero_extendqisi2
	bfi	ip, r1, #0, #4
	strb	ip, [r3, #2]
.L635:
	adds	r2, r2, #1
	b	.L633
.L627:
	cmp	r3, #35
	ite	gt
	movgt	r3, #26
	movle	r3, #25
	b	.L944
.L614:
	ldr	r1, [r0, #12]
	ldr	r3, [r0, #16]
	mov	r0, r10
	add	r2, r1, #63
	adds	r1, r1, #255
	adds	r3, r3, #15
	bic	r2, r2, #63
	bic	r3, r3, #15
	muls	r3, r2, r3
	it	mi
	addmi	r3, r3, #255
	bics	r1, r1, #255
	it	mi
	addmi	r1, r1, #15
	cmp	r2, #0
	it	lt
	addlt	r2, r2, #15
	asr	fp, r3, #8
	asrs	r3, r1, #4
	ldr	r1, .L975+24
	str	r3, [sp, #20]
	asrs	r3, r2, #4
	str	r3, [sp, #24]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r2, [r8]
	ldr	r7, [r5, #1012]
	lsls	r3, r2, #30
	str	r0, [sp, #28]
	bpl	.L642
	movw	r2, #2244
	ldr	r1, .L975+28
	ldr	r0, .L975+12
	bl	printk
.L642:
	ldr	r1, .L975+24
	mov	r0, r10
	bl	mpp_buffer_get_dma_with_caller
	movs	r1, #2
	bl	dma_buf_begin_cpu_access
	mov	r8, #0
	subs	r2, r7, #1
	mov	r10, r8
.L643:
	cmp	fp, r10
	bne	.L646
	ldr	r10, [r5, #204]
	ldr	r1, .L975+24
	ldr	r0, [r5, #1008]
	bl	mpp_buffer_get_ptr_with_caller
	ldrb	r1, [r10, #245]	@ zero_extendqisi2
	and	r1, r1, #63
	cmp	r1, #35
	ble	.L647
	cmp	r1, #46
	ite	lt
	movlt	r6, #4
	movge	r6, #3
.L647:
	movs	r2, #100
	mul	r8, r2, r8
	rsb	r2, fp, fp, lsl #4
	cmp	r8, r2
	bcc	.L648
.L662:
	ldr	r3, .L975+16
	ldr	r3, [r3]
	lsls	r2, r3, #30
	bpl	.L638
	movw	r2, #2308
	ldr	r1, .L975+28
	b	.L945
.L646:
	ldr	r1, [sp, #24]
	mov	r0, r10
	str	r2, [sp, #32]
	bl	__aeabi_uidivmod
	ldr	r2, [sp, #28]
	ldr	r3, [sp, #20]
	mla	r0, r3, r0, r2
	ldr	r2, [sp, #32]
	ldrb	r0, [r0, r1]	@ zero_extendqisi2
	ldrb	r1, [r2, #1]	@ zero_extendqisi2
	lsls	r0, r0, #2
	and	r0, r0, #252
	lsls	r1, r1, #2
	cmp	r0, #144
	and	r1, r1, #60
	bhi	.L724
	cmp	r0, #72
	ite	ls
	movls	r0, #0
	movhi	r0, #1
.L644:
	orrs	r1, r1, r0
	strb	r1, [r2, #1]!
	tst	r1, #3
	ite	eq
	moveq	ip, #1
	movne	ip, #0
	lsls	r0, r1, #28
	bmi	.L725
	ands	r0, r1, #48
	beq	.L726
	tst	r1, #12
	ite	ne
	movne	r1, #1
	moveq	r1, #0
.L645:
	and	r1, r1, ip
	add	r10, r10, #1
	add	r8, r8, r1
	b	.L643
.L724:
	movs	r0, #2
	b	.L644
.L725:
	movs	r1, #1
	b	.L645
.L726:
	mov	r1, r0
	b	.L645
.L976:
	.align	2
.L975:
	.word	.LANCHOR0+993
	.word	.LANCHOR0+1017
	.word	.LANCHOR0+1047
	.word	.LC36
	.word	hal_h264e_debug
	.word	.LC37
	.word	.LANCHOR0+1077
	.word	.LANCHOR0+1108
.L648:
	ldr	r2, [r5]
	cmp	r8, fp, lsr #5
	movw	ip, #4860
	ldr	r3, [r2, ip]
	bls	.L650
	cmp	r1, #40
	ldrh	r2, [r10, #912]
	ble	.L651
	movs	r1, #28
.L946:
	bfi	r2, r1, #6, #6
	strh	r2, [r10, #912]	@ movhi
.L652:
	cmp	fp, r8
	bhi	.L673
	add	r2, fp, fp, lsl #1
	cmp	r8, r2
	bcs	.L655
	adds	r6, r6, #6
	b	.L654
.L651:
	cmp	r1, #35
	ite	gt
	movgt	r1, #27
	movle	r1, #25
	b	.L946
.L673:
	adds	r6, r6, #7
.L654:
	cmp	r3, #1
	mov	r1, #0
	it	le
	suble	r6, r6, #2
	rsb	r6, r6, #128
	uxtb	r6, r6
.L658:
	cmp	fp, r1
	beq	.L662
	ldrb	r2, [r7, r1]	@ zero_extendqisi2
	lsls	r3, r2, #28
	bmi	.L659
	ands	ip, r2, #48
	beq	.L660
	ands	ip, r2, #12
	beq	.L660
.L659:
	lsls	r3, r2, #30
	ite	eq
	moveq	ip, r6
	movne	ip, #0
.L660:
	strb	ip, [r0, r1, lsl #2]
	adds	r1, r1, #1
	b	.L658
.L655:
	rsb	r2, fp, fp, lsl #3
	cmp	r8, r2
	ite	cc
	addcc	r6, r6, #5
	addcs	r6, r6, #4
	b	.L654
.L666:
	ldrb	r3, [r4, #244]	@ zero_extendqisi2
	movs	r6, #0
	movs	r2, #164
	str	r6, [r4, #128]
	orr	r3, r3, #4
	strb	r3, [r4, #244]
	ldr	r1, [r5, #200]
	ldr	r0, [r5, #4]
	bl	mpp_dev_get_iova_address
	ldrb	r3, [r4, #340]	@ zero_extendqisi2
	bfi	r3, r6, #0, #1
	strb	r3, [r4, #340]
	ldrb	r3, [r4, #247]	@ zero_extendqisi2
	and	r3, r3, #63
	orn	r3, r3, #127
	strb	r3, [r4, #247]
	str	r0, [r4, #132]
	b	.L665
.L650:
	cmp	r8, #0
	beq	.L662
	b	.L652
.L534:
	cmp	r6, #0
	bne	.L539
	b	.L546
	.fnend
	.size	hal_h264e_vepu500_gen_regs, .-hal_h264e_vepu500_gen_regs
	.align	1
	.global	vepu500_264e_set_roi
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu500_264e_set_roi, %function
vepu500_264e_set_roi:
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
	cbz	r6, .L978
	cbnz	r5, .L979
.L978:
	str	r5, [sp]
	mov	r3, r6
	movw	r2, #1397
	ldr	r1, .L1003
	ldr	r0, .L1003+4
	bl	printk
.L1002:
.L980:
	movs	r0, #0
	b	.L977
.L979:
	ldr	r3, [r5, #4]
	cmp	r3, #8
	bhi	.L981
	ldr	r9, .L1003+28
	add	r2, r5, #24
	movs	r3, #0
.L982:
	ldr	r0, [r5, #4]
	lsl	r10, r3, #4
	sub	r4, r2, #16
	add	r1, r6, r10
	cmp	r0, r3
	ble	.L1002
	ldrh	ip, [r2, #-16]
	ldrh	r0, [r2, #-12]
	add	r0, r0, ip
	cmp	r0, r7
	bgt	.L991
	ldrh	r0, [r2, #-14]
	ldrh	lr, [r2, #-10]
	add	r0, r0, lr
	cmp	r0, r8
	mov	r0, #-1
	it	le
	movle	r0, #0
.L983:
	ldrh	lr, [r2, #-8]
	ldrb	fp, [r2, #-1]	@ zero_extendqisi2
	cmp	lr, #1
	bhi	.L994
	ldrh	lr, [r2, #-4]
	cmp	lr, #7
	bhi	.L994
	ldrb	lr, [r2, #-2]	@ zero_extendqisi2
	cmp	lr, #1
	bhi	.L994
	cmp	fp, #2
	it	cs
	movcs	r0, #-1
.L984:
	ldrsh	lr, [r2, #-6]
	cmp	fp, #0
	beq	.L985
	cmp	lr, #51
	ble	.L987
.L986:
	movw	r2, #1422
	ldr	r1, .L1003
	ldr	r0, .L1003+8
	bl	printk
	ldrh	r3, [r4]
	ldr	r1, .L1003
	ldr	r0, .L1003+12
	strd	r7, r8, [sp, #12]
	ldrh	r2, [r4, #6]
	str	r2, [sp, #8]
	ldrh	r2, [r4, #4]
	str	r2, [sp, #4]
	ldrh	r2, [r4, #2]
	str	r2, [sp]
	mov	r2, #1424
	bl	printk
	ldrh	r2, [r4, #12]
	ldrh	r3, [r4, #8]
	ldr	r1, .L1003
	ldr	r0, .L1003+16
	str	r2, [sp]
	movw	r2, #1426
	bl	printk
	ldrsh	r2, [r4, #10]
	ldrb	r3, [r4, #15]	@ zero_extendqisi2
	ldr	r1, .L1003
	ldr	r0, .L1003+20
	str	r2, [sp]
	movw	r2, #1428
	bl	printk
	mov	r0, #-1
.L977:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L981:
	movw	r2, #1402
	ldr	r1, .L1003
	ldr	r0, .L1003+24
	bl	printk
	b	.L1002
.L991:
	mov	r0, #-1
	b	.L983
.L994:
	mov	r0, #-1
	b	.L984
.L985:
	add	lr, lr, #51
	uxth	lr, lr
	cmp	lr, #102
	bhi	.L986
.L987:
	cmp	r0, #0
	bne	.L986
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
	cbz	r0, .L989
	ldr	r0, [r1, #12]
	bic	r0, r0, #15728640
	bic	r0, r0, #3840
	orr	r0, r0, r9
	str	r0, [r1, #12]
.L989:
	adds	r3, r3, #1
	adds	r2, r2, #16
	b	.L982
.L1004:
	.align	2
.L1003:
	.word	.LANCHOR0+1200
	.word	.LC59
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC60
	.word	1048832
	.fnend
	.size	vepu500_264e_set_roi, .-vepu500_264e_set_roi
	.global	hal_h264e_vepu500
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.39920, %object
	.size	__func__.39920, 27
__func__.39920:
	.ascii	"hal_h264e_vepu500_ret_task\000"
	.type	__func__.39878, %object
	.size	__func__.39878, 31
__func__.39878:
	.ascii	"hal_h264e_vepu500_status_check\000"
	.type	__func__.39942, %object
	.size	__func__.39942, 32
__func__.39942:
	.ascii	"hal_h264e_vepu500_comb_ret_task\000"
	.type	__func__.39872, %object
	.size	__func__.39872, 24
__func__.39872:
	.ascii	"hal_h264e_vepu500_start\000"
	.type	__func__.39932, %object
	.size	__func__.39932, 29
__func__.39932:
	.ascii	"hal_h264e_vepu500_comb_start\000"
	.type	__func__.39378, %object
	.size	__func__.39378, 22
__func__.39378:
	.ascii	"update_vepu500_syntax\000"
	.type	__func__.39397, %object
	.size	__func__.39397, 27
__func__.39397:
	.ascii	"hal_h264e_vepu500_get_task\000"
	.type	__FUNCTION__.39360, %object
	.size	__FUNCTION__.39360, 15
__FUNCTION__.39360:
	.ascii	"setup_hal_bufs\000"
	.type	__func__.39362, %object
	.size	__func__.39362, 15
__func__.39362:
	.ascii	"setup_hal_bufs\000"
	.type	__FUNCTION__.39337, %object
	.size	__FUNCTION__.39337, 13
__FUNCTION__.39337:
	.ascii	"get_wrap_buf\000"
	.type	__func__.39307, %object
	.size	__func__.39307, 25
__func__.39307:
	.ascii	"hal_h264e_vepu500_deinit\000"
	.type	__FUNCTION__.39299, %object
	.size	__FUNCTION__.39299, 20
__FUNCTION__.39299:
	.ascii	"clear_ext_line_bufs\000"
	.type	__FUNCTION__.39308, %object
	.size	__FUNCTION__.39308, 25
__FUNCTION__.39308:
	.ascii	"hal_h264e_vepu500_deinit\000"
	.type	__func__.39315, %object
	.size	__func__.39315, 23
__func__.39315:
	.ascii	"hal_h264e_vepu500_init\000"
	.type	__FUNCTION__.39317, %object
	.size	__FUNCTION__.39317, 23
__FUNCTION__.39317:
	.ascii	"hal_h264e_vepu500_init\000"
	.type	__func__.39368, %object
	.size	__func__.39368, 26
__func__.39368:
	.ascii	"hal_h264e_vepu500_prepare\000"
	.type	__func__.39885, %object
	.size	__func__.39885, 23
__func__.39885:
	.ascii	"hal_h264e_vepu500_wait\000"
	.type	__func__.39863, %object
	.size	__func__.39863, 27
__func__.39863:
	.ascii	"hal_h264e_vepu500_gen_regs\000"
	.type	__func__.39401, %object
	.size	__func__.39401, 21
__func__.39401:
	.ascii	"setup_vepu500_normal\000"
	.type	__func__.39414, %object
	.size	__func__.39414, 19
__func__.39414:
	.ascii	"setup_vepu500_prep\000"
	.type	__func__.39455, %object
	.size	__func__.39455, 20
__func__.39455:
	.ascii	"setup_vepu500_codec\000"
	.type	__func__.39501, %object
	.size	__func__.39501, 23
__func__.39501:
	.ascii	"setup_vepu500_rdo_pred\000"
	.type	pskip_atf_th0.39725, %object
	.size	pskip_atf_th0.39725, 4
pskip_atf_th0.39725:
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.type	pskip_atf_th1.39726, %object
	.size	pskip_atf_th1.39726, 4
pskip_atf_th1.39726:
	.byte	7
	.byte	7
	.byte	7
	.byte	10
	.type	pskip_atf_wgt0.39727, %object
	.size	pskip_atf_wgt0.39727, 4
pskip_atf_wgt0.39727:
	.byte	16
	.byte	16
	.byte	16
	.byte	20
	.type	pskip_atf_wgt1.39728, %object
	.size	pskip_atf_wgt1.39728, 4
pskip_atf_wgt1.39728:
	.byte	16
	.byte	16
	.byte	14
	.byte	16
	.type	intra_atf_th0.39729, %object
	.size	intra_atf_th0.39729, 4
intra_atf_th0.39729:
	.byte	8
	.byte	16
	.byte	20
	.byte	20
	.type	intra_atf_th1.39730, %object
	.size	intra_atf_th1.39730, 4
intra_atf_th1.39730:
	.byte	16
	.byte	32
	.byte	40
	.byte	40
	.type	intra_atf_th2.39731, %object
	.size	intra_atf_th2.39731, 4
intra_atf_th2.39731:
	.byte	32
	.byte	56
	.byte	72
	.byte	72
	.type	intra_atf_wgt0.39732, %object
	.size	intra_atf_wgt0.39732, 4
intra_atf_wgt0.39732:
	.byte	16
	.byte	24
	.byte	27
	.byte	27
	.type	intra_atf_wgt1.39733, %object
	.size	intra_atf_wgt1.39733, 4
intra_atf_wgt1.39733:
	.byte	16
	.byte	22
	.byte	25
	.byte	25
	.type	intra_atf_wgt2.39734, %object
	.size	intra_atf_wgt2.39734, 4
intra_atf_wgt2.39734:
	.byte	16
	.byte	19
	.byte	20
	.byte	20
	.space	2
.LC0:
	.word	9
	.word	12
	.word	16
	.word	16
	.type	__func__.39751, %object
	.size	__func__.39751, 25
__func__.39751:
	.ascii	"setup_vepu500_anti_smear\000"
	.type	__func__.39521, %object
	.size	__func__.39521, 22
__func__.39521:
	.ascii	"setup_vepu500_rc_base\000"
	.type	__func__.39541, %object
	.size	__func__.39541, 21
__func__.39541:
	.ascii	"setup_vepu500_io_buf\000"
	.type	__FUNCTION__.39559, %object
	.size	__FUNCTION__.39559, 21
__FUNCTION__.39559:
	.ascii	"setup_vepu500_io_buf\000"
	.type	__func__.39624, %object
	.size	__func__.39624, 24
__func__.39624:
	.ascii	"setup_vepu500_recn_refr\000"
	.type	__FUNCTION__.39626, %object
	.size	__FUNCTION__.39626, 24
__FUNCTION__.39626:
	.ascii	"setup_vepu500_recn_refr\000"
	.type	__func__.39602, %object
	.size	__func__.39602, 21
__func__.39602:
	.ascii	"setup_recn_refr_wrap\000"
	.space	2
	.type	ref_type_map, %object
	.size	ref_type_map, 16
ref_type_map:
	.word	0
	.word	1
	.word	2
	.word	3
	.type	__func__.39651, %object
	.size	__func__.39651, 20
__func__.39651:
	.ascii	"setup_vepu500_split\000"
	.type	__func__.39664, %object
	.size	__func__.39664, 17
__func__.39664:
	.ascii	"setup_vepu500_me\000"
	.type	__func__.39833, %object
	.size	__func__.39833, 27
__func__.39833:
	.ascii	"setup_vepu500_scaling_list\000"
	.type	vepu500_h264_cqm_jvt8i, %object
	.size	vepu500_h264_cqm_jvt8i, 64
vepu500_h264_cqm_jvt8i:
	.byte	6
	.byte	10
	.byte	13
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	10
	.byte	11
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	13
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	16
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	18
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	23
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	25
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	40
	.byte	27
	.byte	29
	.byte	31
	.byte	33
	.byte	36
	.byte	38
	.byte	40
	.byte	42
	.type	vepu500_h264_cqm_jvt8p, %object
	.size	vepu500_h264_cqm_jvt8p, 64
vepu500_h264_cqm_jvt8p:
	.byte	9
	.byte	13
	.byte	15
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	13
	.byte	13
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	15
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	17
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	19
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	21
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	22
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	33
	.byte	24
	.byte	25
	.byte	27
	.byte	28
	.byte	30
	.byte	32
	.byte	33
	.byte	35
	.type	__FUNCTION__.39843, %object
	.size	__FUNCTION__.39843, 33
__FUNCTION__.39843:
	.ascii	"hal_h264e_vepu500_init_qpmap_buf\000"
	.type	__func__.39825, %object
	.size	__func__.39825, 24
__func__.39825:
	.ascii	"vepu500_h264_tune_qpmap\000"
	.type	__FUNCTION__.39826, %object
	.size	__FUNCTION__.39826, 24
__FUNCTION__.39826:
	.ascii	"vepu500_h264_tune_qpmap\000"
	.type	__FUNCTION__.39793, %object
	.size	__FUNCTION__.39793, 30
__FUNCTION__.39793:
	.ascii	"vepu500_h264_tune_qpmap_smart\000"
	.type	__func__.39800, %object
	.size	__func__.39800, 30
__func__.39800:
	.ascii	"vepu500_h264_tune_qpmap_smart\000"
	.type	__FUNCTION__.39761, %object
	.size	__FUNCTION__.39761, 31
__FUNCTION__.39761:
	.ascii	"vepu500_h264_tune_qpmap_normal\000"
	.type	__func__.39768, %object
	.size	__func__.39768, 31
__func__.39768:
	.ascii	"vepu500_h264_tune_qpmap_normal\000"
	.type	__FUNCTION__.39440, %object
	.size	__FUNCTION__.39440, 31
__FUNCTION__.39440:
	.ascii	"vepu500_h264e_save_pass1_patch\000"
	.type	__func__.39448, %object
	.size	__func__.39448, 30
__func__.39448:
	.ascii	"vepu500_h264e_use_pass1_patch\000"
	.type	__func__.39574, %object
	.size	__func__.39574, 21
__func__.39574:
	.ascii	"vepu500_264e_set_roi\000"
	.space	3
	.type	hal_h264e_vepu500, %object
	.size	hal_h264e_vepu500, 64
hal_h264e_vepu500:
	.word	.LC33
	.word	7
	.word	1016
	.word	0
	.word	hal_h264e_vepu500_init
	.word	hal_h264e_vepu500_deinit
	.word	hal_h264e_vepu500_prepare
	.word	hal_h264e_vepu500_get_task
	.word	hal_h264e_vepu500_gen_regs
	.word	hal_h264e_vepu500_start
	.word	hal_h264e_vepu500_wait
	.word	0
	.word	0
	.word	hal_h264e_vepu500_ret_task
	.word	hal_h264e_vepu500_comb_start
	.word	hal_h264e_vepu500_comb_ret_task
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	h264_aq_tthd_smart, %object
	.size	h264_aq_tthd_smart, 64
h264_aq_tthd_smart:
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
	.word	28
	.word	28
	.type	h264_I_aq_step_smart, %object
	.size	h264_I_aq_step_smart, 64
h264_I_aq_step_smart:
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
	.word	8
	.word	8
	.word	10
	.type	h264_P_aq_step_smart, %object
	.size	h264_P_aq_step_smart, 64
h264_P_aq_step_smart:
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
	.word	8
	.word	8
	.word	10
	.type	h264_aq_tthd_default, %object
	.size	h264_aq_tthd_default, 64
h264_aq_tthd_default:
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
	.type	h264_I_aq_step_default, %object
	.size	h264_I_aq_step_default, 64
h264_I_aq_step_default:
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
	.type	h264_P_aq_step_default, %object
	.size	h264_P_aq_step_default, 64
h264_P_aq_step_default:
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
	.type	h264e_lambda_default, %object
	.size	h264e_lambda_default, 240
h264e_lambda_default:
	.word	5
	.word	6
	.word	7
	.word	9
	.word	11
	.word	14
	.word	18
	.word	22
	.word	28
	.word	36
	.word	45
	.word	57
	.word	72
	.word	91
	.word	115
	.word	145
	.word	182
	.word	230
	.word	290
	.word	365
	.word	460
	.word	580
	.word	731
	.word	921
	.word	1161
	.word	1462
	.word	1843
	.word	2322
	.word	2925
	.word	3686
	.word	4644
	.word	5851
	.word	7372
	.word	9289
	.word	11703
	.word	14745
	.word	18578
	.word	23407
	.word	29491
	.word	37156
	.word	46814
	.word	58982
	.word	74313
	.word	93628
	.word	117964
	.word	148626
	.word	187257
	.word	235929
	.word	297252
	.word	374514
	.word	471859
	.word	594505
	.word	749029
	.word	943718
	.word	1189010
	.word	1498059
	.word	1887436
	.word	2378020
	.word	2996118
	.word	3774872
	.type	h264e_lambda_cvr, %object
	.size	h264e_lambda_cvr, 240
h264e_lambda_cvr:
	.word	9
	.word	11
	.word	14
	.word	17
	.word	22
	.word	27
	.word	34
	.word	43
	.word	54
	.word	69
	.word	86
	.word	109
	.word	137
	.word	173
	.word	218
	.word	274
	.word	345
	.word	435
	.word	548
	.word	691
	.word	870
	.word	1097
	.word	1382
	.word	1741
	.word	2193
	.word	2763
	.word	3482
	.word	5057
	.word	6372
	.word	8028
	.word	10115
	.word	12744
	.word	16056
	.word	20230
	.word	25488
	.word	36372
	.word	45826
	.word	57738
	.word	72745
	.word	91653
	.word	115475
	.word	162529
	.word	204774
	.word	257999
	.word	325059
	.word	452485
	.word	570095
	.word	718275
	.word	990842
	.word	1248383
	.word	1572864
	.word	1981684
	.word	2496766
	.word	3145728
	.word	3963368
	.word	4993532
	.word	6291456
	.word	7926736
	.word	9987064
	.word	201326592
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC1:
	.ascii	"\0016%s:%d: enter %p\012\000"
.LC2:
	.ascii	"\0016%s:%d: lkt_done finish\000"
.LC3:
	.ascii	"\0016%s:%d: enc_done finish\000"
.LC4:
	.ascii	"\0016%s:%d: enc_slice finsh\000"
.LC5:
	.ascii	"\0016%s:%d: safe clear finsh\000"
.LC6:
	.ascii	"\0016%s:%d: bit stream overflow\000"
.LC7:
	.ascii	"\0016%s:%d: Bit stream write out set length\000"
.LC8:
	.ascii	"\0016%s:%d: enc error\000"
.LC9:
	.ascii	"\0016%s:%d: wdg timeout\000"
.LC10:
	.ascii	"\0016%s:%d: wrap frame error\000"
.LC11:
	.ascii	"\0016%s:%d: leave %p\012\000"
.LC12:
	.ascii	"regs->reg_ctl\000"
.LC13:
	.ascii	"\0013%s:%d: set %s reg write failed %d\012\000"
.LC14:
	.ascii	"regs->reg_frm\000"
.LC15:
	.ascii	"regs->reg_rc_roi\000"
.LC16:
	.ascii	"regs->reg_param\000"
.LC17:
	.ascii	"regs->reg_sqi\000"
.LC18:
	.ascii	"regs->reg_scl_jpgtbl\000"
.LC19:
	.ascii	"regs->reg_osd\000"
.LC20:
	.ascii	"regs->reg_ctl.int_sta\000"
.LC21:
	.ascii	"\0013%s:%d: set %s reg read failed %d\012\000"
.LC22:
	.ascii	"regs->reg_st\000"
.LC23:
	.ascii	"\0013%s:%d: send cmd failed %d\012\000"
.LC24:
	.ascii	"\0016%s:%d: update cfg\000"
.LC25:
	.ascii	"\0016%s:%d: update sps\000"
.LC26:
	.ascii	"\0016%s:%d: update pps\000"
.LC27:
	.ascii	"\0016%s:%d: update dpb\000"
.LC28:
	.ascii	"\0016%s:%d: update slice\000"
.LC29:
	.ascii	"\0016%s:%d: update frames\000"
.LC30:
	.ascii	"\0016%s:%d: update prefix nal\000"
.LC31:
	.ascii	"\0016%s:%d: invalid syntax type %d\012\000"
.LC32:
	.ascii	"\0016%s:%d: frame size %d -> %d max count %d -> %d\012"
	.ascii	"\000"
.LC33:
	.ascii	"hal_h264e_vepu500\000"
.LC34:
	.ascii	"\0013%s:%d: mpp_dev_init failed. ret: %d\012\000"
.LC35:
	.ascii	"\0013%s:%d: init register buffer failed\012\000"
.LC36:
	.ascii	"\0016%s:%d: enter\012\000"
.LC37:
	.ascii	"\0016%s:%d: leave\012\000"
.LC38:
	.ascii	"\0013%s:%d: invalid modification_of_pic_nums_idc %d"
	.ascii	"\012\000"
.LC39:
	.ascii	"\0013%s:%d: unsupported mmco 0 %d\012\000"
.LC40:
	.ascii	"\0016%s:%d: bittarget %d qp [%d %d %d]\012\000"
.LC41:
	.ascii	"buf_thumb\000"
.LC42:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC43:
	.ascii	"buf_pixel\000"
.LC44:
	.ascii	"\0016%s:%d: cur is idr  lt %d\012\000"
.LC45:
	.ascii	"\0016%s:%d: ref type %d\012\000"
.LC46:
	.ascii	"\0013%d: WARNING: not support lt ref to st when buf"
	.ascii	" is wrap\000"
.LC47:
	.ascii	"\0013%d: WARNING: not support lt ref to lt when buf"
	.ascii	" is wrap\000"
.LC48:
	.ascii	"\0016%s:%d: cur_is_ref %d\012\000"
.LC49:
	.ascii	"\0016%s:%d: hdr[size %d top %d bot %d cur %d pre %d"
	.ascii	"]\012\000"
.LC50:
	.ascii	"\0016%s:%d: bdy [size %d top %d bot %d cur %d pre %"
	.ascii	"d]\012\000"
.LC51:
	.ascii	"ptr\000"
.LC52:
	.ascii	"dma\000"
.LC53:
	.ascii	"\0016%s:%d: invalide slice split mode %d\012\000"
.LC54:
	.ascii	"\0016%s:%d: scaling_list_mode 2 is not supported ye"
	.ascii	"t\012\000"
.LC55:
	.ascii	"ctx->mv_info\000"
.LC56:
	.ascii	"ctx->qpmap\000"
.LC57:
	.ascii	"ctx->mv_flag\000"
.LC58:
	.ascii	"\0013%d: buf_pass1 malloc fail, debreath invaild\000"
.LC59:
	.ascii	"\0013%s:%d: invalid buf %p roi %p\012\000"
.LC60:
	.ascii	"\0013%s:%d: invalid region number %d\012\000"
.LC61:
	.ascii	"\0013%s:%d: region %d invalid param:\012\000"
.LC62:
	.ascii	"\0013%s:%d: position [%d:%d:%d:%d] vs [%d:%d]\012\000"
.LC63:
	.ascii	"\0013%s:%d: force intra %d qp area index %d\012\000"
.LC64:
	.ascii	"\0013%s:%d: abs qp mode %d value %d\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
