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
	.file	"h265e_api.c"
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
	.type	h265e_proc_enc_skip, %function
h265e_proc_enc_skip:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	h265e_proc_enc_skip, .-h265e_proc_enc_skip
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_split_cfg, %function
h265e_proc_split_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1]
	lsls	r2, r3, #31
	itttt	mi
	ldrmi	r2, [r1, #4]
	strmi	r2, [r0, #4]
	ldrmi	r2, [r1, #8]
	strmi	r2, [r0, #8]
	lsls	r2, r3, #30
	itt	mi
	ldrmi	r2, [r1, #8]
	strmi	r2, [r0, #8]
	lsls	r2, r3, #29
	itt	mi
	ldrmi	r2, [r1, #12]
	strmi	r2, [r0, #12]
	ldr	r2, [r0, #4]
	cbnz	r2, .L6
	strd	r2, r2, [r0, #8]
.L6:
	ldr	r2, [r0]
	orrs	r3, r3, r2
	str	r3, [r0]
	movs	r0, #0
	str	r0, [r1]
	bx	lr
	.fnend
	.size	h265e_proc_split_cfg, .-h265e_proc_split_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_show, %function
h265e_proc_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #32
	sub	sp, sp, #32
	ldr	r4, [r1]
	mov	r5, r0
	ldr	r1, .L17
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L17+4
	ldr	r7, .L17+8
	mov	r0, r5
	ldr	r1, .L17+12
	mov	r2, r7
	str	r3, [sp, #4]
	ldr	r3, .L17+16
	str	r3, [sp]
	ldr	r3, .L17+20
	bl	seq_printf
	ldr	r1, [r4, #712]
	ldr	r0, .L17+24
	ldrd	r8, r9, [r4, #12]
	bl	strof_profle
	mov	r2, r6
	ldr	r1, .L17+28
	mov	r3, r8
	strd	r9, r0, [sp]
	mov	r0, r5
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L17+32
	bl	seq_puts
	ldr	r3, .L17+36
	mov	r2, r7
	ldr	r1, .L17+40
	mov	r0, r5
	str	r3, [sp, #16]
	ldr	r3, .L17+44
	str	r3, [sp, #12]
	ldr	r3, .L17+48
	str	r3, [sp, #8]
	ldr	r3, .L17+52
	str	r3, [sp, #4]
	ldr	r3, .L17+56
	str	r3, [sp]
	ldr	r3, .L17+60
	bl	seq_printf
	ldr	r0, [r4, #3544]
	bl	strof_bool
	ldr	r9, [r4, #3544]
	ldr	r10, [r4, #3548]
	mov	r8, r0
	movs	r0, #0
	bl	strof_bool
	mov	r3, r8
	movs	r2, #0
	ldr	r1, .L17+64
	strd	r10, r0, [sp, #4]
	mov	r0, r5
	strd	r2, r2, [sp, #12]
	mov	r2, r6
	str	r9, [sp]
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L17+68
	bl	seq_puts
	ldr	r3, .L17+72
	mov	r2, r7
	ldr	r1, .L17+76
	mov	r0, r5
	str	r3, [sp, #24]
	ldr	r3, .L17+80
	str	r3, [sp, #20]
	ldr	r3, .L17+84
	str	r3, [sp, #16]
	ldr	r3, .L17+88
	str	r3, [sp, #12]
	ldr	r3, .L17+92
	str	r3, [sp, #8]
	ldr	r3, .L17+96
	str	r3, [sp, #4]
	ldr	r3, .L17+100
	str	r3, [sp]
	ldr	r3, .L17+104
	bl	seq_printf
	ldr	r0, [r4, #908]
	rsb	r0, r0, #1
	bl	strof_bool
	ldr	r3, [r4, #732]
	mov	r2, r6
	ldr	r1, .L17+108
	str	r3, [sp, #24]
	ldr	r3, [r4, #880]
	str	r3, [sp, #20]
	ldr	r3, [r4, #848]
	clz	r3, r3
	lsrs	r3, r3, #5
	str	r3, [sp, #16]
	ldr	r3, [r4, #900]
	clz	r3, r3
	lsrs	r3, r3, #5
	str	r3, [sp, #12]
	ldr	r3, [r4, #896]
	clz	r3, r3
	lsrs	r3, r3, #5
	str	r3, [sp, #8]
	ldr	r3, [r4, #912]
	str	r3, [sp, #4]
	ldr	r3, [r4, #916]
	str	r3, [sp]
	mov	r3, r0
	mov	r0, r5
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L17+112
	bl	seq_puts
	ldr	r3, .L17+116
	mov	r2, r7
	mov	r0, r5
	ldr	r1, .L17+120
	str	r3, [sp]
	ldr	r3, .L17+124
	bl	seq_printf
	ldr	r3, [r4, #888]
	mov	r2, r6
	ldr	r1, .L17+128
	mov	r0, r5
	str	r3, [sp]
	ldr	r3, [r4, #884]
	bl	seq_printf
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L18:
	.align	2
.L17:
	.word	.LC0
	.word	.LC4
	.word	.LC2
	.word	.LC3
	.word	.LC5
	.word	.LC1
	.word	16777220
	.word	.LC6
	.word	.LC7
	.word	.LC10
	.word	.LC9
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC8
	.word	.LC15
	.word	.LC16
	.word	.LC19
	.word	.LC18
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC17
	.word	.LC26
	.word	.LC27
	.word	.LC30
	.word	.LC29
	.word	.LC28
	.word	.LC31
	.fnend
	.size	h265e_proc_show, .-h265e_proc_show
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_add_sei, %function
h265e_add_sei:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r1
	mov	r8, r2
	mov	r9, r3
	mov	r4, r0
	bl	mpp_packet_get_pos
	mov	r7, r0
	mov	r0, r4
	bl	mpp_packet_get_length
	mov	r2, r9
	mov	r1, r8
	mov	r5, r0
	ldr	r3, [sp, #32]
	adds	r0, r7, r0
	bl	h265e_data_to_sei
	str	r0, [r6]
	adds	r1, r5, r0
	mov	r0, r4
	bl	mpp_packet_set_length
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
	.fnend
	.size	h265e_add_sei, .-h265e_add_sei
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_prep_cfg, %function
h265e_proc_prep_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #112
	sub	sp, sp, #112
	ldr	r8, [r1]
	mov	r4, r0
	mov	r5, r1
	movs	r2, #96
	mov	r1, r0
	add	r0, sp, #16
	bl	memcpy
	cmp	r8, #0
	bne	.L21
	mov	r1, #316
	ldr	r3, .L91
	str	r1, [sp]
	ldr	r2, .L91+4
	ldr	r0, .L91+8
	bl	printk
.L22:
	tst	r8, #524288
	itt	ne
	ldrne	r3, [r5, #40]
	strne	r3, [r4, #40]
	tst	r8, #16
	itt	ne
	ldrne	r3, [r5, #48]
	strne	r3, [r4, #48]
	tst	r8, #32
	itt	ne
	ldrne	r3, [r5, #52]
	strne	r3, [r4, #52]
	tst	r8, #256
	itt	ne
	ldrne	r3, [r5, #56]
	strne	r3, [r4, #56]
	tst	r8, #512
	beq	.L30
	add	r7, r5, #60
	add	r6, r4, #60
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r3, [r7]
	str	r3, [r6]
.L30:
	tst	r8, #17
	beq	.L32
	ldr	r1, [r4, #48]
	bic	r3, r1, #2
	cmp	r3, #1
	itete	eq
	ldreq	r3, [r5, #8]
	ldrne	r3, [r5, #4]
	streq	r3, [r4, #4]
	strne	r3, [r4, #4]
	ite	eq
	ldreq	r3, [r5, #4]
	ldrne	r3, [r5, #8]
	str	r3, [r4, #8]
	ldr	r3, [r5, #12]
	ldrd	r6, r0, [r4, #4]
	str	r3, [r4, #12]
	ldr	r3, [r5, #16]
	str	r3, [r4, #16]
	ldr	r2, [r5, #20]
	cmp	r2, #0
	beq	.L35
	ldr	r3, [r5, #24]
	cmp	r3, #0
	beq	.L35
	mul	r7, r3, r2
	mul	ip, r0, r6
	cmp	r7, ip
	bge	.L36
	strd	r6, r0, [sp]
	mov	r1, #360
	ldr	r0, .L91+12
	bl	printk
	ldr	r3, [r4, #4]
	str	r3, [r4, #20]
	ldr	r3, [r4, #8]
	str	r3, [r4, #24]
.L32:
	ldr	r5, [r4, #48]
	ldr	r3, [r4]
	bic	r5, r5, #2
	ldr	r2, [r4, #4]
	cmp	r5, #1
	orr	r3, r3, r8
	ldr	r0, [r4, #16]
	str	r3, [r4]
	ldrd	r3, r1, [r4, #8]
	bne	.L38
	cmp	r3, r1
	bgt	.L39
	cmp	r2, r0
	ble	.L49
.L39:
	strd	r1, r0, [sp]
	movw	r1, #385
.L90:
	ldr	r0, .L91+16
	bl	printk
	mvn	r1, #5
.L40:
	ldr	r3, [r4, #28]
	tst	r3, #15728640
	beq	.L42
	ldrd	r3, r2, [r4, #48]
	orrs	r0, r2, r3
	beq	.L42
	mov	r1, #402
	ldr	r0, .L91+20
	bl	printk
	mvn	r1, #5
.L42:
	ldr	r2, [r4, #44]
	ldrd	r3, r0, [r4, #32]
	cmp	r2, #2
	ldr	r5, [r4, #40]
	bhi	.L43
	cmp	r3, #14
	bhi	.L43
	cmp	r0, #22
	bhi	.L43
	cmp	r5, #18
	bls	.L44
.L43:
	strd	r0, r5, [sp]
	mov	r1, #412
	ldr	r0, .L91+24
	bl	printk
.L45:
	movw	r2, #417
	ldr	r1, .L91+28
	ldr	r0, .L91+32
	bl	printk
	movs	r2, #96
	mov	r0, r4
	add	r1, sp, #16
	bl	memcpy
.L47:
	movs	r0, #0
	add	sp, sp, #112
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L21:
	tst	r8, #4
	itt	ne
	ldrne	r3, [r5, #28]
	strne	r3, [r4, #28]
	tst	r8, #65536
	itt	ne
	ldrne	r3, [r5, #44]
	strne	r3, [r4, #44]
	tst	r8, #131072
	itt	ne
	ldrne	r3, [r5, #32]
	strne	r3, [r4, #32]
	tst	r8, #262144
	itt	ne
	ldrne	r3, [r5, #36]
	strne	r3, [r4, #36]
	b	.L22
.L36:
	str	r2, [r4, #20]
	bic	r1, r1, #2
	ldr	r3, [r5, #24]
	cmp	r1, #1
	str	r3, [r4, #24]
	bne	.L32
	strd	r3, r2, [r4, #20]
	b	.L32
.L35:
	strd	r6, r0, [r4, #20]
	b	.L32
.L38:
	cmp	r1, r2
	blt	.L41
	cmp	r3, r0
	ble	.L49
.L41:
	strd	r1, r0, [sp]
	movw	r1, #393
	b	.L90
.L49:
	movs	r1, #0
	b	.L40
.L44:
	cmp	r1, #0
	bne	.L45
	ldr	r3, [r4, #16]
	mov	r2, #422
	ldr	r1, .L91+28
	ldr	r0, .L91+36
	str	r3, [sp, #8]
	ldr	r3, [r4, #12]
	str	r3, [sp, #4]
	ldr	r3, [r4, #8]
	str	r3, [sp]
	ldr	r3, [r4, #4]
	bl	printk
	b	.L47
.L92:
	.align	2
.L91:
	.word	.LANCHOR0
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LANCHOR0+20
	.word	.LC38
	.word	.LC39
	.fnend
	.size	h265e_proc_prep_cfg, .-h265e_proc_prep_cfg
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_dpb, %function
h265e_proc_dpb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r7, .L103
	ldr	r8, [r1, #4]
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L94
	movs	r2, #236
	ldr	r1, .L103+4
	ldr	r0, .L103+8
	bl	printk
.L94:
	movw	r5, #19056
	mov	r1, r8
	ldr	r0, [r4, r5]
	bl	h265e_dpb_proc_cpb
	ldr	r0, [r4, r5]
	bl	h265e_dpb_get_curr
	ldrd	r2, [r8, #8]
	mov	r0, r4
	bl	h265e_slice_init
	mov	r1, r8
	ldr	r0, [r4, r5]
	bl	h265e_dpb_build_list
	mov	r6, r0
	cbnz	r0, .L96
	ldr	r3, [r4, r5]
	ldr	r3, [r3, #876]
	ldrd	r2, [r3, #24]
	strd	r2, [r8, #152]
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L93
	movs	r2, #245
	ldr	r1, .L103+4
	ldr	r0, .L103+12
	bl	printk
.L93:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L96:
	mov	r6, #-1
	b	.L93
.L104:
	.align	2
.L103:
	.word	.LANCHOR1
	.word	.LANCHOR0+40
	.word	.LC40
	.word	.LC41
	.fnend
	.size	h265e_proc_dpb, .-h265e_proc_dpb
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_h265_cfg, %function
h265e_proc_h265_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r6, [r1]
	mov	r4, r1
	lsls	r7, r6, #31
	itttt	mi
	ldrmi	r3, [r1, #4]
	strmi	r3, [r0, #4]
	ldrmi	r3, [r1, #8]
	strmi	r3, [r0, #8]
	lsls	r0, r6, #20
	bpl	.L107
	add	r3, r1, #112
	add	r2, r5, #112
	adds	r1, r1, #136
.L108:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L108
.L107:
	lsls	r1, r6, #9
	bpl	.L109
	mov	r2, r4
	ldr	r3, [r2, #136]!	@ unaligned
	str	r3, [r5, #136]	@ unaligned
	ldr	r3, [r2, #4]	@ unaligned
	str	r3, [r5, #140]	@ unaligned
.L109:
	lsls	r2, r6, #19
	bpl	.L110
	mov	r1, r4
	ldr	r3, [r1, #200]!	@ unaligned
	str	r3, [r5, #200]	@ unaligned
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [r5, #204]	@ unaligned
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [r5, #208]	@ unaligned
.L110:
	ands	r7, r6, #8192
	beq	.L111
	mov	r1, r4
	ldr	r3, [r1, #188]!	@ unaligned
	str	r3, [r5, #188]	@ unaligned
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [r5, #192]	@ unaligned
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [r5, #196]	@ unaligned
.L111:
	lsls	r3, r6, #17
	bpl	.L112
	ldrd	r2, r3, [r4, #176]
	cmp	r2, r3
	beq	.L113
	mov	r1, #450
	ldr	r0, .L160
	bl	printk
	ldr	r3, [r4, #176]
	str	r3, [r4, #180]
.L113:
	ldr	r3, [r4, #184]
	cmp	r3, #2
	bls	.L114
	movw	r1, #455
	ldr	r0, .L160+4
	bl	printk
	movs	r3, #1
	str	r3, [r4, #184]
.L114:
	add	r3, r4, #164
	add	r2, r5, #164
	add	r1, r4, #188
.L115:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L115
.L112:
	lsls	r0, r6, #16
	bpl	.L116
	add	r3, r4, #144
	add	r2, r5, #144
	add	r1, r4, #160
.L117:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L117
.L116:
	lsls	r1, r6, #15
	itt	mi
	ldrmi	r3, [r4, #160]	@ unaligned
	strmi	r3, [r5, #160]	@ unaligned
	lsls	r2, r6, #14
	bpl	.L119
	mov	r1, r4
	ldr	r3, [r1, #216]!	@ unaligned
	str	r3, [r5, #216]	@ unaligned
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [r5, #220]	@ unaligned
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [r5, #224]	@ unaligned
.L119:
	lsls	r3, r6, #13
	bpl	.L120
	add	r3, r4, #228
	add	r2, r5, #228
	add	r1, r4, #252
.L121:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L121
.L120:
	cbz	r7, .L122
	ldr	r3, [r4, #188]!	@ unaligned
	str	r3, [r5, #188]	@ unaligned
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [r5, #192]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [r5, #196]	@ unaligned
.L122:
	ldr	r3, [r5]
	movs	r0, #0
	orrs	r6, r6, r3
	str	r6, [r5]
	pop	{r3, r4, r5, r6, r7, pc}
.L161:
	.align	2
.L160:
	.word	.LC42
	.word	.LC43
	.fnend
	.size	h265e_proc_h265_cfg, .-h265e_proc_h265_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_cfg, %function
h265e_proc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L190
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r5, r2
	ldr	r2, [r3]
	mov	r7, r0
	mov	r4, r1
	ldr	r6, [r0]
	tst	r2, #1
	mov	r8, r3
	beq	.L163
	str	r1, [sp]
	mov	r3, r0
	movw	r2, #525
	ldr	r1, .L190+4
	ldr	r0, .L190+8
	bl	printk
.L163:
	ldr	r3, .L190+12
	cmp	r4, r3
	beq	.L164
	bhi	.L165
	subs	r3, r3, #6
	cmp	r4, r3
	beq	.L166
	adds	r3, r3, #2
	cmp	r4, r3
	bne	.L168
	mov	r1, r5
	add	r0, r6, #8
	bl	h265e_proc_prep_cfg
.L189:
	mov	r4, r0
	b	.L169
.L165:
	ldr	r3, .L190+16
	cmp	r4, r3
	beq	.L175
	ldr	r3, .L190+20
	cmp	r4, r3
	beq	.L170
	ldr	r3, .L190+24
	cmp	r4, r3
	beq	.L171
.L168:
	mov	r2, r4
	movw	r1, #573
	ldr	r0, .L190+28
	mov	r4, #-1
	bl	printk
	b	.L169
.L166:
	ldr	r4, [r5, #8]
	cbz	r4, .L172
	add	r1, r5, #8
	add	r0, r6, #8
	bl	h265e_proc_prep_cfg
	movs	r3, #0
	str	r3, [r5, #8]
	mov	r4, r0
.L172:
	ldr	r3, [r5, #708]
	cbz	r3, .L173
	add	r1, r5, #708
	add	r0, r6, #708
	bl	h265e_proc_h265_cfg
	movs	r3, #0
	str	r3, [r5, #708]
	orrs	r4, r4, r0
.L173:
	ldr	r3, [r5, #3540]
	cbz	r3, .L169
	addw	r1, r5, #3540
	addw	r0, r6, #3540
	bl	h265e_proc_split_cfg
	orrs	r4, r4, r0
.L169:
	ldr	r3, [r8]
	lsls	r3, r3, #31
	bpl	.L162
	mov	r3, r7
	movw	r2, #578
	ldr	r1, .L190+4
	ldr	r0, .L190+32
	bl	printk
.L162:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L171:
	mov	r0, r7
	bl	h265e_set_extra_info
	mov	r1, r5
	mov	r0, r7
	bl	h265e_get_extra_info
.L175:
	movs	r4, #0
	b	.L169
.L164:
	adds	r1, r5, #4
	add	r0, r6, #708
	bl	h265e_proc_h265_cfg
	b	.L189
.L170:
	mov	r1, r5
	addw	r0, r6, #3540
	bl	h265e_proc_split_cfg
	b	.L189
.L191:
	.align	2
.L190:
	.word	.LANCHOR1
	.word	.LANCHOR0+55
	.word	.LC44
	.word	3276807
	.word	3276815
	.word	3309825
	.word	3276814
	.word	.LC45
	.word	.LC46
	.fnend
	.size	h265e_proc_cfg, .-h265e_proc_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_deinit, %function
h265e_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, .L212
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L193
	mov	r3, r0
	movs	r2, #169
	ldr	r1, .L212+4
	ldr	r0, .L212+8
	bl	printk
.L193:
	cbnz	r4, .L194
	movs	r2, #172
	ldr	r1, .L212+4
	ldr	r0, .L212+12
	bl	printk
	mvn	r0, #2
.L192:
	pop	{r4, r5, r6, pc}
.L194:
	movw	r5, #19064
	ldr	r0, [r4, r5]
	bl	h265e_deinit_extra_info
	ldr	r1, [r4, r5]
	cbz	r1, .L196
	ldr	r0, .L212+16
	bl	mpp_osal_free
.L196:
	movs	r3, #0
	str	r3, [r4, r5]
	movw	r3, #19068
	ldr	r1, [r4, r3]
	mov	r5, r3
	cbz	r1, .L197
	ldr	r0, .L212+16
	bl	mpp_osal_free
.L197:
	add	r0, r4, #19072
	movs	r3, #0
	str	r3, [r4, r5]
	ldr	r3, [r0]
	cbz	r3, .L198
	bl	mpp_packet_deinit
.L198:
	movw	r3, #19056
	ldr	r0, [r4, r3]
	bl	h265e_dpb_deinit
	ldr	r0, [r6]
	ands	r0, r0, #1
	beq	.L192
	mov	r3, r4
	movs	r2, #185
	ldr	r1, .L212+4
	ldr	r0, .L212+20
	bl	printk
	movs	r0, #0
	b	.L192
.L213:
	.align	2
.L212:
	.word	.LANCHOR1
	.word	.LANCHOR0+70
	.word	.LC47
	.word	.LC48
	.word	.LANCHOR0+83
	.word	.LC46
	.fnend
	.size	h265e_deinit, .-h265e_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_init, %function
h265e_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r5, r1
	ldr	r4, [r1, #8]
	mov	r6, r0
	cbnz	r0, .L215
	movs	r2, #38
	ldr	r1, .L225
	ldr	r0, .L225+4
	mvn	r5, #2
	bl	printk
.L214:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L215:
	ldr	r3, .L225+8
	ldr	r3, [r3]
	lsls	r2, r3, #31
	bpl	.L217
	mov	r3, r0
	movs	r2, #42
	ldr	r1, .L225
	ldr	r0, .L225+12
	bl	printk
.L217:
	ldr	r2, [r5]
	ldr	r3, .L225+16
	cmp	r2, r3
	beq	.L218
	movs	r1, #44
	ldr	r3, .L225+20
	str	r1, [sp]
	ldr	r2, .L225+24
	ldr	r0, .L225+28
	bl	printk
.L218:
	ldr	r3, [r5, #8]
	add	r0, r6, #19072
	mov	r2, #296
	movs	r1, #0
	adds	r0, r0, #4
	movs	r7, #1
	str	r3, [r6]
	movw	r8, #19064
	bl	memset
	str	r7, [r5, #16]
	movs	r1, #204
	ldr	r0, .L225+20
	bl	mpp_osal_calloc
	mov	r1, #1536
	str	r0, [r6, r8]
	ldr	r0, .L225+20
	bl	mpp_osal_calloc
	movw	r3, #19068
	mov	r2, #1536
	mov	r1, r0
	str	r0, [r6, r3]
	add	r0, r6, #19072
	bl	mpp_packet_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L214
	ldr	r0, [r6, r8]
	mov	r9, #5
	bl	h265e_init_extra_info
	ldr	r0, [r6]
	movs	r2, #51
	movs	r1, #10
	mov	lr, #26
	movs	r3, #120
	strd	r9, r5, [r0, #904]
	mov	r8, #32
	str	r3, [r0, #716]
	movs	r3, #2
	str	lr, [r0, #764]
	movw	ip, #4852
	str	r3, [r0, #924]
	mov	r10, #3
	strd	r2, r1, [r0, #748]
	movw	fp, #4900
	strd	r2, r1, [r0, #756]
	strd	r7, r5, [r0, #792]
	strd	r5, r5, [r0, #800]
	strd	r5, r5, [r0, #808]
	str	r5, [r0, #816]
	str	r7, [r0, #712]
	strd	r8, r8, [r0, #724]
	str	r5, [r0, #736]
	str	r7, [r0, #744]
	str	r5, [r0, #852]
	str	r5, [r0, #868]
	strd	r7, r7, [r0, #896]
	str	r5, [r0, #848]
	strd	r7, r7, [r0, #928]
	str	r5, [r0, #880]
	str	r7, [r0, #892]
	ldr	r0, [r6]
	str	r7, [r0, ip]
	movw	ip, #4856
	ldr	r0, [r6]
	str	r5, [r0, ip]
	movw	ip, #4860
	ldr	r0, [r6]
	str	r10, [r0, ip]
	movw	ip, #4868
	ldr	r0, [r6]
	movw	r10, #4872
	add	r0, r0, #4864
	str	r3, [r0]
	ldr	r0, [r6]
	str	r3, [r0, ip]
	mov	ip, #4
	ldr	r0, [r6]
	str	ip, [r0, r10]
	movw	r10, #4876
	ldr	r0, [r6]
	str	ip, [r0, r10]
	movw	r10, #4880
	ldr	r0, [r6]
	str	r3, [r0, r10]
	movw	r10, #4884
	ldr	r0, [r6]
	str	r5, [r0, r10]
	movw	r10, #4888
	ldr	r0, [r6]
	str	r9, [r0, r10]
	movw	r10, #4892
	ldr	r0, [r6]
	mov	r9, #15
	str	r9, [r0, r10]
	mov	r10, #6
	ldr	r0, [r6]
	add	r0, r0, #4896
	str	r10, [r0]
	ldr	r0, [r6]
	str	r10, [r0, fp]
	strd	r5, r3, [r4, #36]
	strd	r3, r3, [r4, #44]
	str	r5, [r4, #8]
	strd	r5, r5, [r4, #52]
	strd	r5, r5, [r4, #60]
	str	r3, [r4, #112]
	strd	ip, r3, [r4, #240]
	movs	r3, #28
	strd	r3, r2, [r4, #252]
	ldr	r3, .L225+8
	ldr	r10, .L225+44
	ldr	r0, .L225+32
	ldr	r3, [r3]
	str	r5, [r4, #104]
	strd	r10, r0, [r4, #116]
	lsls	r3, r3, #31
	ldr	r0, .L225+36
	mov	r10, #60
	str	r7, [r4, #148]
	str	r10, [r4, #152]
	strd	r0, r5, [r4, #124]
	mov	r0, #30
	str	r7, [r4, #160]
	strd	r0, r7, [r4, #132]
	strd	r5, r0, [r4, #140]
	strd	r0, r1, [r4, #204]
	mov	r0, #160
	str	r2, [r4, #220]
	strd	r0, lr, [r4, #212]
	strd	r2, r1, [r4, #224]
	str	r9, [r4, #232]
	str	lr, [r4, #248]
	strd	r2, r8, [r4, #260]
	bpl	.L214
	mov	r3, r6
	movs	r2, #161
	ldr	r1, .L225
	ldr	r0, .L225+40
	bl	printk
	b	.L214
.L226:
	.align	2
.L225:
	.word	.LANCHOR0+96
	.word	.LC48
	.word	.LANCHOR1
	.word	.LC47
	.word	16777220
	.word	.LANCHOR0+107
	.word	.LC49
	.word	.LC33
	.word	2500000
	.word	1500000
	.word	.LC46
	.word	2000000
	.fnend
	.size	h265e_init, .-h265e_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_start, %function
h265e_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r1
	ldr	r4, .L237
	ldr	r2, [r4]
	lsls	r2, r2, #31
	bpl	.L228
	movs	r2, #210
	ldr	r1, .L237+4
	ldr	r0, .L237+8
	bl	printk
.L228:
	ldr	r3, [r5]
	cbnz	r3, .L229
	movs	r2, #220
	ldr	r1, .L237+4
	ldr	r0, .L237+12
	bl	printk
.L229:
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L230
	movs	r2, #226
	ldr	r1, .L237+4
	ldr	r0, .L237+16
	bl	printk
.L230:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L238:
	.align	2
.L237:
	.word	.LANCHOR1
	.word	.LANCHOR0+118
	.word	.LC40
	.word	.LC50
	.word	.LC41
	.fnend
	.size	h265e_start, .-h265e_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_proc_hal, %function
h265e_proc_hal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r1
	mov	r4, r0
	cbnz	r0, .L240
	mov	r2, #258
	ldr	r1, .L247
	ldr	r0, .L247+4
	bl	printk
	mvn	r0, #2
.L239:
	pop	{r4, r5, r6, pc}
.L240:
	ldr	r5, .L247+8
	ldr	r2, [r5]
	lsls	r3, r2, #31
	bpl	.L242
	mov	r3, r0
	mov	r2, #262
	ldr	r1, .L247
	ldr	r0, .L247+12
	bl	printk
.L242:
	mov	r0, r4
	bl	h265e_syntax_fill
	movs	r3, #1
	str	r3, [r6]
	add	r3, r4, #19072
	ldr	r0, [r5]
	adds	r3, r3, #4
	str	r3, [r6, #16]
	movs	r6, #0
	ldr	r3, [r4]
	ands	r0, r0, #1
	str	r6, [r3, #708]
	beq	.L239
	mov	r3, r4
	mov	r2, #268
	ldr	r1, .L247
	ldr	r0, .L247+16
	bl	printk
	mov	r0, r6
	b	.L239
.L248:
	.align	2
.L247:
	.word	.LANCHOR0+130
	.word	.LC48
	.word	.LANCHOR1
	.word	.LC51
	.word	.LC52
	.fnend
	.size	h265e_proc_hal, .-h265e_proc_hal
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h265e_gen_hdr, %function
h265e_gen_hdr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L259
	mov	r6, r1
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L250
	mov	r3, r0
	movs	r2, #193
	ldr	r1, .L259+4
	ldr	r0, .L259+8
	bl	printk
.L250:
	mov	r0, r4
	bl	h265e_set_extra_info
	mov	r1, r6
	mov	r0, r4
	bl	h265e_get_extra_info
	movw	r3, #19056
	adds	r0, r4, r3
	ldr	r3, [r4, r3]
	cbnz	r3, .L251
	bl	h265e_dpb_init
.L251:
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L252
	mov	r3, r4
	movs	r2, #201
	ldr	r1, .L259+4
	ldr	r0, .L259+12
	bl	printk
.L252:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L260:
	.align	2
.L259:
	.word	.LANCHOR1
	.word	.LANCHOR0+145
	.word	.LC47
	.word	.LC46
	.fnend
	.size	h265e_gen_hdr, .-h265e_gen_hdr
	.global	api_h265e
	.global	h265e_debug
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.26670, %object
	.size	__FUNCTION__.26670, 20
__FUNCTION__.26670:
	.ascii	"h265e_proc_prep_cfg\000"
	.type	__func__.26674, %object
	.size	__func__.26674, 20
__func__.26674:
	.ascii	"h265e_proc_prep_cfg\000"
	.type	__func__.26641, %object
	.size	__func__.26641, 15
__func__.26641:
	.ascii	"h265e_proc_dpb\000"
	.type	__func__.26694, %object
	.size	__func__.26694, 15
__func__.26694:
	.ascii	"h265e_proc_cfg\000"
	.type	__func__.26620, %object
	.size	__func__.26620, 13
__func__.26620:
	.ascii	"h265e_deinit\000"
	.type	__FUNCTION__.26621, %object
	.size	__FUNCTION__.26621, 13
__FUNCTION__.26621:
	.ascii	"h265e_deinit\000"
	.type	__func__.26612, %object
	.size	__func__.26612, 11
__func__.26612:
	.ascii	"h265e_init\000"
	.type	__FUNCTION__.26613, %object
	.size	__FUNCTION__.26613, 11
__FUNCTION__.26613:
	.ascii	"h265e_init\000"
	.type	__func__.26633, %object
	.size	__func__.26633, 12
__func__.26633:
	.ascii	"h265e_start\000"
	.type	__func__.26648, %object
	.size	__func__.26648, 15
__func__.26648:
	.ascii	"h265e_proc_hal\000"
	.type	__func__.26627, %object
	.size	__func__.26627, 14
__func__.26627:
	.ascii	"h265e_gen_hdr\000"
	.space	1
	.type	api_h265e, %object
	.size	api_h265e, 56
api_h265e:
	.word	.LC53
	.word	16777220
	.word	19404
	.word	0
	.word	h265e_init
	.word	h265e_deinit
	.word	h265e_proc_cfg
	.word	h265e_gen_hdr
	.word	h265e_start
	.word	h265e_proc_dpb
	.word	h265e_proc_hal
	.word	h265e_add_sei
	.word	h265e_proc_enc_skip
	.word	h265e_proc_show
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	h265e_debug, %object
	.size	h265e_debug, 4
h265e_debug:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\012--------h265e chn attr-------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC1:
	.ascii	"Width\000"
.LC2:
	.ascii	"ID\000"
.LC3:
	.ascii	"%7s|%10s|%10s|%10s\012\000"
.LC4:
	.ascii	"profile\000"
.LC5:
	.ascii	"Height\000"
.LC6:
	.ascii	"%7d|%10u|%10u|%10s\012\000"
.LC7:
	.ascii	"\012--------Syntax INFO1---------------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC8:
	.ascii	"SlcspltEn\000"
.LC9:
	.ascii	"%7s|%10s|%10s|%10s|%15s|%15s|%15s\012\000"
.LC10:
	.ascii	"RefreshNum\000"
.LC11:
	.ascii	"RefreshMode\000"
.LC12:
	.ascii	"IntraRefresh\000"
.LC13:
	.ascii	"Slcsize\000"
.LC14:
	.ascii	"SplitMode\000"
.LC15:
	.ascii	"%7d|%10s|%10u|%10u|%15s|%15u|%15u\012\000"
.LC16:
	.ascii	"--------Syntax INFO2-------------------------------"
	.ascii	"-----------------------------------------------\012"
	.ascii	"\000"
.LC17:
	.ascii	"DblkEn\000"
.LC18:
	.ascii	"%7s|%10s|%8s|%8s|%10s|%10s|%15s|%12s|%8s\012\000"
.LC19:
	.ascii	"TmvpEn\000"
.LC20:
	.ascii	"ScalingMode\000"
.LC21:
	.ascii	"IntraSmoothing\000"
.LC22:
	.ascii	"Saochroma\000"
.LC23:
	.ascii	"Saoluma\000"
.LC24:
	.ascii	"Beta\000"
.LC25:
	.ascii	"Tc\000"
.LC26:
	.ascii	"%7d|%10s|%8d|%8d|%10d|%10d|%15d|%12d|%8d\012\000"
.LC27:
	.ascii	"------Trans INFO-----------------------------------"
	.ascii	"------------------------------------------------\012"
	.ascii	"\000"
.LC28:
	.ascii	"CbQpOffset\000"
.LC29:
	.ascii	"%7s|%12s|%12s\012\000"
.LC30:
	.ascii	"CrQpOffset\000"
.LC31:
	.ascii	"%7d|%12d|%12d\012\000"
.LC32:
	.ascii	"change\000"
.LC33:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC34:
	.ascii	"\0013%d: config maybe err should realloc buff max w"
	.ascii	":h [%d:%d] enc w:h[%d:%d]\000"
.LC35:
	.ascii	"\0013%d: invalid size w:h [%d:%d] stride [%d:%d]\012"
	.ascii	"\000"
.LC36:
	.ascii	"\0013%d: invalid cfg fbc data no support mirror %d "
	.ascii	"or rotaion %d\000"
.LC37:
	.ascii	"\0013%d: invalid color range %d colorspace %d prima"
	.ascii	"ries %d transfer characteristic %d\012\000"
.LC38:
	.ascii	"\0013%s:%d: failed to accept new prep config\012\000"
.LC39:
	.ascii	"\0016%s:%d: MPP_ENC_SET_PREP_CFG w:h [%d:%d] stride"
	.ascii	" [%d:%d]\012\000"
.LC40:
	.ascii	"\0016%s:%d: enter\012\000"
.LC41:
	.ascii	"\0016%s:%d: leave\012\000"
.LC42:
	.ascii	"\0016%d: cr_qp_offset %d MUST equal to cb_qp_offset"
	.ascii	" %d. FORCE to same value\012\000"
.LC43:
	.ascii	"\0016%d: diff_cu_qp_delta_depth must be in [0, 2]\012"
	.ascii	"\000"
.LC44:
	.ascii	"\0016%s:%d: enter ctx %p cmd %08x\012\000"
.LC45:
	.ascii	"\0013%d: No correspond %08x found, and can not conf"
	.ascii	"ig!\012\000"
.LC46:
	.ascii	"\0016%s:%d: leave ctx %p\012\000"
.LC47:
	.ascii	"\0016%s:%d: enter ctx %p\012\000"
.LC48:
	.ascii	"\0013%s:%d: invalid NULL ctx\012\000"
.LC49:
	.ascii	"ctrlCfg->coding == MPP_VIDEO_CodingHEVC\000"
.LC50:
	.ascii	"\0016%s:%d: drop one frame\012\000"
.LC51:
	.ascii	"\0016%s:%d: enter ctx %p \012\000"
.LC52:
	.ascii	"\0016%s:%d: leave ctx %p \012\000"
.LC53:
	.ascii	"h265e_control\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
