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
	.file	"h264e_api_v2.c"
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
	.type	h264e_proc_h264_cfg, %function
h264e_proc_h264_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1]
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	lsls	r4, r3, #31
	itt	mi
	ldrmi	r2, [r1, #4]
	strmi	r2, [r0, #4]
	lsls	r2, r3, #30
	bpl	.L3
	ldr	r2, [r1, #24]
	ldr	r4, [r0, #24]
	cmp	r4, r2
	bne	.L4
	ldr	r5, [r0, #28]
	ldr	r4, [r1, #28]
	cmp	r5, r4
	beq	.L3
.L4:
	str	r2, [r0, #24]
	ldr	r2, [r1, #28]
	str	r2, [r0, #28]
	ldr	r2, [r0]
	orr	r2, r2, #2
	str	r2, [r0]
.L3:
	lsls	r5, r3, #21
	bpl	.L5
	ldr	r2, [r1, #8]
	ldr	r4, [r0, #8]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #8]
	ldrne	r2, [r0]
	orrne	r2, r2, #1024
	strne	r2, [r0]
.L5:
	lsls	r4, r3, #20
	bpl	.L6
	ldr	r2, [r1, #12]
	ldr	r4, [r0, #12]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #12]
	ldrne	r2, [r0]
	orrne	r2, r2, #2048
	strne	r2, [r0]
.L6:
	lsls	r2, r3, #19
	bpl	.L7
	ldr	r2, [r1, #16]
	ldr	r4, [r0, #16]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #16]
	ldrne	r2, [r0]
	orrne	r2, r2, #4096
	strne	r2, [r0]
.L7:
	lsls	r5, r3, #18
	bpl	.L8
	ldr	r2, [r1, #20]
	ldr	r4, [r0, #20]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #20]
	ldrne	r2, [r0]
	orrne	r2, r2, #8192
	strne	r2, [r0]
.L8:
	lsls	r4, r3, #29
	bpl	.L9
	ldr	r2, [r1, #32]
	ldr	r4, [r0, #32]
	cmp	r4, r2
	bne	.L10
	ldr	r5, [r0, #36]
	ldr	r4, [r1, #36]
	cmp	r5, r4
	beq	.L9
.L10:
	str	r2, [r0, #32]
	ldr	r2, [r1, #36]
	str	r2, [r0, #36]
	ldr	r2, [r0]
	orr	r2, r2, #4
	str	r2, [r0]
.L9:
	lsls	r2, r3, #27
	bpl	.L11
	ldr	r2, [r1, #40]
	ldr	r4, [r0, #40]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #40]
	ldrne	r2, [r0]
	orrne	r2, r2, #16
	strne	r2, [r0]
.L11:
	lsls	r5, r3, #26
	bpl	.L12
	ldr	r2, [r1, #44]
	ldr	r4, [r0, #44]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #44]
	ldrne	r2, [r0]
	orrne	r2, r2, #32
	strne	r2, [r0]
.L12:
	lsls	r4, r3, #25
	bpl	.L13
	ldr	r2, [r1, #52]
	ldr	r4, [r0, #52]
	cmp	r4, r2
	bne	.L14
	ldr	r5, [r0, #56]
	ldr	r4, [r1, #56]
	cmp	r5, r4
	beq	.L13
.L14:
	str	r2, [r0, #52]
	ldr	r2, [r1, #56]
	str	r2, [r0, #56]
	ldr	r2, [r0]
	orr	r2, r2, #64
	str	r2, [r0]
.L13:
	lsls	r2, r3, #24
	bpl	.L15
	ldr	r2, [r1, #60]
	ldr	r4, [r0, #60]
	cmp	r4, r2
	bne	.L16
	ldr	r5, [r0, #64]
	ldr	r4, [r1, #64]
	cmp	r5, r4
	bne	.L16
	ldr	r5, [r0, #68]
	ldr	r4, [r1, #68]
	cmp	r5, r4
	beq	.L15
.L16:
	str	r2, [r0, #60]
	ldr	r2, [r1, #64]
	str	r2, [r0, #64]
	ldr	r2, [r1, #68]
	str	r2, [r0, #68]
	ldr	r2, [r0]
	orr	r2, r2, #128
	str	r2, [r0]
.L15:
	lsls	r5, r3, #23
	itt	mi
	ldrmi	r2, [r1, #72]
	strmi	r2, [r0, #72]
	lsls	r4, r3, #22
	bpl	.L18
	ldr	r2, [r1, #48]
	ldr	r4, [r0, #48]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #48]
	ldrne	r2, [r0]
	orrne	r2, r2, #512
	strne	r2, [r0]
.L18:
	lsls	r2, r3, #11
	bpl	.L19
	ldr	r2, [r1, #92]
	ldr	r4, [r0, #92]
	cmp	r4, r2
	bne	.L20
	ldr	r5, [r0, #96]
	ldr	r4, [r1, #96]
	cmp	r5, r4
	beq	.L19
.L20:
	str	r2, [r0, #92]
	ldr	r2, [r1, #96]
	str	r2, [r0, #96]
	ldr	r2, [r0]
	orr	r2, r2, #1048576
	str	r2, [r0]
.L19:
	lsls	r5, r3, #10
	bpl	.L21
	ldr	r2, [r1, #100]
	ldr	r4, [r0, #100]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #100]
	ldrne	r2, [r0]
	orrne	r2, r2, #2097152
	strne	r2, [r0]
.L21:
	lsls	r4, r3, #9
	bpl	.L22
	ldr	r2, [r1, #104]
	ldr	r4, [r0, #104]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #104]
	ldrne	r2, [r0]
	orrne	r2, r2, #4194304
	strne	r2, [r0]
.L22:
	lsls	r2, r3, #8
	bpl	.L23
	ldr	r2, [r1, #108]
	ldr	r4, [r0, #108]
	cmp	r4, r2
	itttt	ne
	strne	r2, [r0, #108]
	ldrne	r2, [r0]
	orrne	r2, r2, #8388608
	strne	r2, [r0]
.L23:
	lsls	r3, r3, #7
	bpl	.L24
	ldr	r3, [r1, #112]
	ldr	r2, [r0, #112]
	cmp	r2, r3
	itttt	ne
	strne	r3, [r0, #112]
	ldrne	r3, [r0]
	orrne	r3, r3, #16777216
	strne	r3, [r0]
.L24:
	movs	r0, #0
	str	r0, [r1]
	pop	{r4, r5, pc}
	.fnend
	.size	h264e_proc_h264_cfg, .-h264e_proc_h264_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_split_cfg, %function
h264e_proc_split_cfg:
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
	cbnz	r2, .L83
	strd	r2, r2, [r0, #8]
.L83:
	ldr	r2, [r0]
	orrs	r3, r3, r2
	str	r3, [r0]
	movs	r0, #0
	str	r0, [r1]
	bx	lr
	.fnend
	.size	h264e_proc_split_cfg, .-h264e_proc_split_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_sw_enc, %function
h264e_sw_enc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	h264e_sw_enc, .-h264e_sw_enc
	.align	1
	.global	h264e_add_sei
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_add_sei, %function
h264e_add_sei:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, [sp, #16]
	strd	r3, r4, [sp]
	mov	r3, r2
	movs	r2, #5
	bl	h264e_sei_to_packet
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
	.fnend
	.size	h264e_add_sei, .-h264e_add_sei
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_show, %function
h264e_proc_show:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r4, [r1, #4]
	mov	r5, r0
	ldr	r1, .L96
	mov	r6, r2
	bl	seq_puts
	ldr	r7, .L96+4
	ldr	r8, .L96+96
	mov	r0, r5
	ldr	r3, .L96+8
	mov	r2, r7
	ldr	r1, .L96+12
	str	r8, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L96+16
	bl	seq_printf
	ldr	r1, [r4, #732]
	movs	r0, #7
	ldrd	r9, r10, [r4, #12]
	bl	strof_profle
	mov	r2, r6
	ldr	r1, .L96+20
	mov	r3, r9
	strd	r10, r0, [sp]
	mov	r0, r5
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L96+24
	bl	seq_puts
	ldr	r3, .L96+28
	mov	r2, r7
	ldr	r1, .L96+32
	mov	r0, r5
	str	r3, [sp, #16]
	ldr	r3, .L96+36
	str	r3, [sp, #12]
	ldr	r3, .L96+40
	str	r3, [sp, #8]
	ldr	r3, .L96+44
	str	r3, [sp, #4]
	ldr	r3, .L96+48
	str	r3, [sp]
	ldr	r3, .L96+52
	bl	seq_printf
	ldr	r0, [r4, #3544]
	bl	strof_bool
	ldr	r10, [r4, #3544]
	ldr	fp, [r4, #3548]
	mov	r9, r0
	movs	r0, #0
	bl	strof_bool
	mov	r3, r9
	movs	r2, #0
	ldr	r1, .L96+56
	strd	fp, r0, [sp, #4]
	mov	r0, r5
	strd	r2, r2, [sp, #12]
	mov	r2, r6
	str	r10, [sp]
	bl	seq_printf
	mov	r0, r5
	ldr	r1, .L96+60
	bl	seq_puts
	ldr	r3, .L96+64
	mov	r2, r7
	mov	r0, r5
	ldr	r1, .L96+68
	str	r3, [sp, #20]
	ldr	r3, .L96+72
	str	r3, [sp, #16]
	ldr	r3, .L96+76
	str	r3, [sp, #12]
	ldr	r3, .L96+80
	str	r3, [sp, #8]
	ldr	r3, .L96+84
	str	r3, [sp, #4]
	ldr	r3, .L96+88
	str	r3, [sp]
	mov	r3, r8
	bl	seq_printf
	ldr	r1, [r4, #732]
	movs	r0, #7
	bl	strof_profle
	mov	r7, r0
	ldr	r0, [r4, #740]
	bl	strof_bool
	mov	r8, r0
	ldr	r0, [r4, #748]
	bl	strof_bool
	ldr	r3, [r4, #776]
	mov	r2, r6
	ldr	r1, .L96+92
	str	r3, [sp, #20]
	ldr	r3, [r4, #772]
	str	r3, [sp, #16]
	ldr	r3, [r4, #716]
	str	r3, [sp, #12]
	ldr	r3, [r4, #756]
	str	r8, [sp]
	strd	r0, r3, [sp, #4]
	mov	r3, r7
	mov	r0, r5
	bl	seq_printf
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L97:
	.align	2
.L96:
	.word	.LC0
	.word	.LC2
	.word	.LC5
	.word	.LC3
	.word	.LC1
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
	.word	.LC18
	.word	.LC17
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC4
	.fnend
	.size	h264e_proc_show, .-h264e_proc_show
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_prep_cfg, %function
h264e_proc_prep_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	ldr	r5, [r1]
	.pad #104
	sub	sp, sp, #104
	mov	r8, r1
	cmp	r5, #0
	bne	.L99
	movs	r1, #237
	ldr	r3, .L169
	str	r1, [sp]
	ldr	r2, .L169+4
	ldr	r0, .L169+8
	bl	printk
.L100:
	movs	r3, #0
	mov	r0, r5
	str	r3, [r8]
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L114:
	str	r2, [r4, #20]
	bic	r0, r0, #2
	ldr	r3, [r8, #24]
	cmp	r0, #1
	str	r3, [r4, #24]
	bne	.L110
	strd	r3, r2, [r4, #20]
	b	.L110
.L113:
	strd	r1, r3, [r4, #20]
	mov	r2, r1
	ldr	r0, .L169+12
	movw	r1, #295
	bl	printk
	b	.L110
.L116:
	cmp	r1, r2
	blt	.L119
	cmp	r3, r0
	ble	.L129
.L119:
	strd	r1, r0, [sp]
	movw	r1, #311
	b	.L168
.L129:
	movs	r5, #0
	b	.L118
.L122:
	cmp	r5, #0
	bne	.L123
	ldr	r3, [r4, #16]
	movw	r1, #337
	ldr	r0, .L169+16
	str	r3, [sp, #4]
	ldr	r3, [r4, #12]
	str	r3, [sp]
	ldrd	r2, r3, [r4, #4]
	bl	printk
	b	.L100
.L99:
	mov	r1, r0
	movs	r2, #96
	add	r0, sp, #8
	bl	memcpy
	lsls	r3, r5, #29
	bpl	.L127
	ldr	r3, [r8, #28]
	str	r3, [r4, #28]
.L127:
	lsls	r1, r5, #15
	itt	mi
	ldrmi	r3, [r8, #44]
	strmi	r3, [r4, #44]
	lsls	r2, r5, #14
	itt	mi
	ldrmi	r3, [r8, #32]
	strmi	r3, [r4, #32]
	lsls	r3, r5, #13
	itt	mi
	ldrmi	r3, [r8, #36]
	strmi	r3, [r4, #36]
	lsls	r7, r5, #12
	itt	mi
	ldrmi	r3, [r8, #40]
	strmi	r3, [r4, #40]
	lsls	r6, r5, #27
	itt	mi
	ldrmi	r3, [r8, #48]
	strmi	r3, [r4, #48]
	lsls	r0, r5, #26
	itt	mi
	ldrmi	r3, [r8, #52]
	strmi	r3, [r4, #52]
	lsls	r1, r5, #23
	itt	mi
	ldrmi	r3, [r8, #56]
	strmi	r3, [r4, #56]
	lsls	r2, r5, #22
	bpl	.L108
	add	r7, r8, #60
	add	r6, r4, #60
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r3, [r7]
	str	r3, [r6]
.L108:
	tst	r5, #17
	beq	.L110
	ldr	r0, [r4, #48]
	bic	r3, r0, #2
	cmp	r3, #1
	itete	eq
	ldreq	r3, [r8, #8]
	ldrne	r3, [r8, #4]
	streq	r3, [r4, #4]
	strne	r3, [r4, #4]
	ite	eq
	ldreq	r3, [r8, #4]
	ldrne	r3, [r8, #8]
	str	r3, [r4, #8]
	ldr	r3, [r8, #12]
	str	r3, [r4, #12]
	ldr	r3, [r8, #16]
	str	r3, [r4, #16]
	ldr	r2, [r8, #20]
	ldrd	r1, r3, [r4, #4]
	cmp	r2, #0
	beq	.L113
	ldr	r6, [r8, #24]
	cmp	r6, #0
	beq	.L113
	mul	r7, r6, r2
	mul	ip, r3, r1
	cmp	r7, ip
	bge	.L114
	strd	r1, r3, [sp]
	mov	r3, r6
	mov	r1, #282
	ldr	r0, .L169+20
	bl	printk
	ldr	r3, [r4, #4]
	str	r3, [r4, #20]
	ldr	r3, [r4, #8]
	str	r3, [r4, #24]
.L110:
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	orrs	r5, r5, r3
	str	r5, [r4]
	ldr	r5, [r4, #48]
	ldrd	r3, r1, [r4, #8]
	bic	r5, r5, #2
	ldr	r0, [r4, #16]
	cmp	r5, #1
	bne	.L116
	cmp	r3, r1
	bgt	.L117
	cmp	r2, r0
	ble	.L129
.L117:
	strd	r1, r0, [sp]
	movw	r1, #305
.L168:
	ldr	r0, .L169+24
	mvn	r5, #5
	bl	printk
.L118:
	ldr	r3, [r4, #28]
	tst	r3, #15728640
	beq	.L120
	ldrd	r3, r2, [r4, #48]
	orrs	r1, r2, r3
	beq	.L120
	mov	r1, #318
	ldr	r0, .L169+28
	bl	printk
	mvn	r5, #5
.L120:
	ldr	r2, [r4, #44]
	ldrd	r3, r1, [r4, #32]
	cmp	r2, #2
	ldr	r0, [r4, #40]
	bhi	.L121
	cmp	r3, #14
	bhi	.L121
	cmp	r1, #22
	bhi	.L121
	cmp	r0, #18
	bls	.L122
.L121:
	strd	r1, r0, [sp]
	movw	r1, #327
	ldr	r0, .L169+32
	mvn	r5, #5
	bl	printk
.L123:
	mov	r2, #332
	ldr	r1, .L169+36
	ldr	r0, .L169+40
	bl	printk
	movs	r2, #96
	mov	r0, r4
	add	r1, sp, #8
	bl	memcpy
	b	.L100
.L170:
	.align	2
.L169:
	.word	.LANCHOR0
	.word	.LC25
	.word	.LC26
	.word	.LC28
	.word	.LC33
	.word	.LC27
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LANCHOR0+20
	.word	.LC32
	.fnend
	.size	h264e_proc_prep_cfg, .-h264e_proc_prep_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_cfg, %function
h264e_proc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	ldr	r7, .L199
	mov	r5, r2
	mov	r3, r0
	ldr	r6, [r0, #4]
	ldr	r1, [r7]
	lsls	r2, r1, #31
	bpl	.L172
	strd	r4, r5, [sp]
	movw	r2, #505
	ldr	r1, .L199+4
	ldr	r0, .L199+8
	bl	printk
.L172:
	ldr	r3, .L199+12
	cmp	r4, r3
	beq	.L173
	bhi	.L174
	subs	r3, r3, #6
	cmp	r4, r3
	beq	.L175
	adds	r3, r3, #2
	cmp	r4, r3
	beq	.L176
.L177:
	movw	r1, #534
	ldr	r0, .L199+16
	bl	printk
	mov	r4, #-1
	b	.L178
.L174:
	ldr	r3, .L199+20
	cmp	r4, r3
	beq	.L184
	ldr	r3, .L199+24
	cmp	r4, r3
	bne	.L177
	mov	r1, r5
	addw	r0, r6, #3540
	bl	h264e_proc_split_cfg
	b	.L198
.L175:
	ldr	r4, [r5, #8]
	cbz	r4, .L180
	add	r1, r5, #8
	add	r0, r6, #8
	bl	h264e_proc_prep_cfg
	mov	r4, r0
.L180:
	ldr	r3, [r5, #708]
	cbz	r3, .L181
	add	r1, r5, #708
	add	r0, r6, #708
	bl	h264e_proc_h264_cfg
	orrs	r4, r4, r0
.L181:
	ldr	r3, [r5, #3540]
	cbz	r3, .L178
	addw	r1, r5, #3540
	addw	r0, r6, #3540
	bl	h264e_proc_split_cfg
	orrs	r4, r4, r0
.L178:
	ldr	r3, [r6, #168]
	cmp	r3, #2
	bne	.L182
	ldr	r3, [r6, #176]
	cbnz	r3, .L182
	ldr	r3, [r6, #716]
	cmp	r3, #2
	bne	.L182
	movw	r1, #493
	ldr	r0, .L199+28
	bl	printk
	mov	r1, #494
	ldr	r0, .L199+32
	bl	printk
	movs	r3, #1
	str	r3, [r6, #176]
.L182:
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L171
	mov	r3, r4
	movw	r2, #541
	ldr	r1, .L199+4
	ldr	r0, .L199+36
	bl	printk
.L171:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L176:
	mov	r1, r5
	add	r0, r6, #8
	bl	h264e_proc_prep_cfg
.L198:
	mov	r4, r0
	b	.L178
.L173:
	adds	r1, r5, #4
	add	r0, r6, #708
	bl	h264e_proc_h264_cfg
	b	.L198
.L184:
	movs	r4, #0
	b	.L178
.L200:
	.align	2
.L199:
	.word	.LANCHOR1
	.word	.LANCHOR0+40
	.word	.LC34
	.word	3276807
	.word	.LC35
	.word	3276815
	.word	3309825
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.fnend
	.size	h264e_proc_cfg, .-h264e_proc_cfg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_hal, %function
h264e_proc_hal:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r7, .L214
	mov	r8, r1
	ldr	r5, [r0, #4]
	ldr	r3, [r7]
	lsls	r2, r3, #31
	bpl	.L202
	movw	r2, #674
	ldr	r1, .L214+4
	ldr	r0, .L214+8
	bl	printk
.L202:
	ldr	r2, [r4, #4]
	movw	r3, #5224
	movs	r1, #0
	str	r1, [r4, r3]
	movw	r3, #5228
	movs	r1, #1
	str	r2, [r4, r3]
	movw	r3, #5232
	str	r1, [r4, r3]
	movw	r1, #5236
	add	r3, r4, #16
	str	r3, [r4, r1]
	movw	r3, #5240
	movs	r1, #2
	str	r1, [r4, r3]
	movw	r1, #5244
	add	r3, r4, #288
	str	r3, [r4, r1]
	add	r3, r4, #5248
	movs	r1, #4
	add	r6, r4, #4448
	movw	r0, #5260
	str	r1, [r3]
	movw	r3, #5252
	adds	r6, r6, #16
	str	r6, [r4, r3]
	movw	r3, #5256
	movs	r1, #5
	str	r1, [r4, r3]
	add	r3, r4, #5024
	adds	r3, r3, #28
	str	r3, [r4, r0]
	movw	r3, #5220
	str	r1, [r4, r3]
	movw	r3, #4844
	ldr	r0, [r2, r3]
	bl	mpp_enc_ref_cfg_get_cpb_info
	ldr	r2, [r5, #812]
	ldr	r9, [r0, #16]
	cmp	r9, r2
	beq	.L203
	mov	r3, r9
	movw	r1, #691
	ldr	r0, .L214+12
	bl	printk
	str	r9, [r5, #812]
.L203:
	movw	r1, #5220
	ldr	r0, [r5, #816]
	ldr	r2, [r4, r1]
	add	ip, r2, #1
	lsls	r2, r2, #3
	cbnz	r0, .L204
	ldr	r0, [r5, #812]
	cmp	r0, #0
	beq	.L205
.L204:
	ldr	r1, [r6, #96]
	movw	lr, #5176
	add	r3, r4, lr
	ldr	r0, [r8, #4]
	add	r2, r2, r4
	str	r1, [r3, #4]
	ldr	r1, [r6, #32]
	str	r1, [r4, lr]
	ldrb	r6, [r0, #153]	@ zero_extendqisi2
	ldr	r1, [r5, #820]
	add	r1, r1, r6, lsr #4
	movs	r6, #1
	str	r1, [r3, #8]
	movs	r1, #0
	strd	r6, r1, [r3, #12]
	str	r1, [r3, #20]
	ldrb	r0, [r0, #153]	@ zero_extendqisi2
	strd	r1, r6, [r3, #32]
	lsrs	r0, r0, #4
	strd	r0, r1, [r3, #24]
	movw	r1, #5224
	movs	r0, #6
	str	r0, [r2, r1]
	movw	r1, #5228
	str	r3, [r2, r1]
	movw	r3, #5220
	str	ip, [r4, r3]
.L206:
	movs	r3, #1
	str	r3, [r8]
	add	r3, r4, #5216
	adds	r3, r3, #8
	str	r3, [r8, #16]
	movw	r3, #5220
	ldr	r3, [r4, r3]
	str	r3, [r8, #12]
	movs	r3, #0
	str	r3, [r5, #708]
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L207
	movw	r2, #727
	ldr	r1, .L214+4
	ldr	r0, .L214+16
	bl	printk
.L207:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L205:
	adds	r3, r4, r2
	movw	r2, #5224
	movs	r6, #6
	str	r6, [r3, r2]
	movw	r2, #5228
	str	r0, [r3, r2]
	str	ip, [r4, r1]
	b	.L206
.L215:
	.align	2
.L214:
	.word	.LANCHOR1
	.word	.LANCHOR0+55
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.fnend
	.size	h264e_proc_hal, .-h264e_proc_hal
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_proc_dpb, %function
h264e_proc_dpb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r4, r0
	ldr	r6, .L232
	add	r8, r0, #400
	ldr	r7, [r1, #4]
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L217
	mov	r2, #636
	ldr	r1, .L232+4
	ldr	r0, .L232+8
	bl	printk
.L217:
	mov	r1, r7
	mov	r0, r8
	bl	h264e_dpb_proc
	ldrd	r5, r9, [r4, #488]
	add	r0, r4, #4448
	add	r3, r4, #288
	add	r2, r4, #16
	ldr	r1, [r4, #4]
	adds	r0, r0, #16
	str	r5, [sp]
	bl	h264e_slice_update
	ldr	r1, [r5, #4]
	movw	r2, #5052
	adds	r3, r4, r2
	str	r1, [r4, r2]
	ldr	r2, [r5]
	str	r2, [r3, #4]
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	lsrs	r2, r2, #7
	str	r2, [r3, #8]
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	ubfx	r2, r2, #6, #1
	str	r2, [r3, #12]
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	ubfx	r2, r2, #5, #1
	str	r2, [r3, #16]
	cmp	r9, #0
	beq	.L218
	ldr	r2, [r9]
.L219:
	str	r2, [r3, #20]
	cmp	r9, #0
	beq	.L220
	ldrb	r2, [r9, #16]	@ zero_extendqisi2
.L231:
	lsrs	r2, r2, #7
	str	r2, [r3, #24]
	add	r3, r4, #5056
	add	r2, r4, #5120
	adds	r3, r3, #24
	adds	r2, r2, #28
.L222:
	ldr	r1, [r4, #808]
	adds	r4, r4, #48
	str	r1, [r3], #4
	cmp	r3, r2
	bne	.L222
	mov	r1, r7
	mov	r0, r8
	bl	h264e_dpb_check
	ldrd	r2, [r5, #16]
	strd	r2, [r7, #152]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L223
	mov	r2, #664
	ldr	r1, .L232+4
	ldr	r0, .L232+12
	bl	printk
.L223:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L218:
	ldr	r2, [r5]
	b	.L219
.L220:
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	b	.L231
.L233:
	.align	2
.L232:
	.word	.LANCHOR1
	.word	.LANCHOR0+70
	.word	.LC39
	.word	.LC41
	.fnend
	.size	h264e_proc_dpb, .-h264e_proc_dpb
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_gen_hdr, %function
h264e_gen_hdr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r6, .L247
	mov	r9, r1
	ldr	r3, [r6]
	lsls	r2, r3, #31
	bpl	.L235
	movw	r2, #550
	ldr	r1, .L247+4
	ldr	r0, .L247+8
	bl	printk
.L235:
	add	r5, r4, #16
	add	r8, r4, #288
	ldr	r1, [r4, #4]
	movw	r7, #5148
	mov	r0, r5
	bl	h264e_sps_update
	ldr	r1, [r4, #4]
	mov	r0, r8
	bl	h264e_pps_update
	mov	r2, r5
	ldr	r1, [r4, #4]
	add	r0, r4, #400
	bl	h264e_dpb_setup
	ldr	r0, [r4, r7]
	bl	mpp_packet_reset
	add	r2, r4, #5152
	adds	r2, r2, #12
	ldr	r1, [r4, r7]
	mov	r0, r5
	movw	r5, #5160
	bl	h264e_sps_to_packet
	add	r2, r4, #5152
	adds	r2, r2, #16
	ldr	r1, [r4, r7]
	mov	r0, r8
	bl	h264e_pps_to_packet
	ldr	r0, [r4, r7]
	bl	mpp_packet_get_length
	mov	r3, r0
	str	r0, [r4, r5]
	cmp	r9, #0
	beq	.L236
	add	r2, r4, #5152
	movs	r1, #0
	mov	r0, r9
	ldr	r2, [r2]
	bl	mpp_packet_write
	ldr	r1, [r4, r5]
	mov	r0, r9
	bl	mpp_packet_set_length
.L236:
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L237
	movw	r2, #571
	ldr	r1, .L247+4
	ldr	r0, .L247+12
	bl	printk
.L237:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L248:
	.align	2
.L247:
	.word	.LANCHOR1
	.word	.LANCHOR0+85
	.word	.LC39
	.word	.LC41
	.fnend
	.size	h264e_gen_hdr, .-h264e_gen_hdr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_start, %function
h264e_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L256
	ldr	r3, [r4]
	lsls	r2, r3, #31
	bpl	.L251
	movw	r2, #577
	ldr	r1, .L256+4
	ldr	r0, .L256+8
	bl	printk
	ldr	r3, [r4]
	lsls	r3, r3, #31
	bpl	.L251
	mov	r2, #620
	ldr	r1, .L256+4
	ldr	r0, .L256+12
	bl	printk
.L251:
	movs	r0, #0
	pop	{r4, pc}
.L257:
	.align	2
.L256:
	.word	.LANCHOR1
	.word	.LANCHOR0+99
	.word	.LC39
	.word	.LC41
	.fnend
	.size	h264e_start, .-h264e_start
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_deinit, %function
h264e_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, .L275
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L259
	movs	r2, #221
	ldr	r1, .L275+4
	ldr	r0, .L275+8
	bl	printk
.L259:
	movw	r3, #5148
	adds	r0, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L260
	bl	mpp_packet_deinit
.L260:
	add	r4, r4, #5152
	ldr	r1, [r4]
	cbz	r1, .L261
	ldr	r0, .L275+12
	bl	mpp_osal_free
.L261:
	movs	r3, #0
	str	r3, [r4]
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L262
	movs	r2, #228
	ldr	r1, .L275+4
	ldr	r0, .L275+16
	bl	printk
.L262:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L276:
	.align	2
.L275:
	.word	.LANCHOR1
	.word	.LANCHOR0+111
	.word	.LC39
	.word	.LANCHOR0+124
	.word	.LC41
	.fnend
	.size	h264e_deinit, .-h264e_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	h264e_init, %function
h264e_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r5, r0
	ldr	r7, .L292
	mov	r4, r1
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L278
	movs	r2, #188
	ldr	r1, .L292+4
	ldr	r0, .L292+8
	bl	printk
.L278:
	ldr	r3, [r4, #4]
	mov	r1, #1024
	ldr	r0, .L292+12
	add	r8, r5, #5152
	str	r3, [r5]
	movw	r3, #5156
	str	r1, [r5, r3]
	bl	mpp_osal_malloc
	str	r0, [r8]
	cbnz	r0, .L279
	movs	r1, #193
	ldr	r3, .L292+12
	str	r1, [sp]
	ldr	r2, .L292+16
	ldr	r0, .L292+20
	bl	printk
.L279:
	movw	r3, #5156
	ldr	r1, [r8]
	movw	r6, #5148
	ldr	r2, [r5, r3]
	adds	r0, r5, r6
	bl	mpp_packet_init
	mov	r8, r0
	cmp	r0, #0
	bne	.L277
	ldr	r3, [r5, r6]
	cbnz	r3, .L282
	movs	r1, #197
	ldr	r3, .L292+12
	str	r1, [sp]
	ldr	r2, .L292+24
	ldr	r0, .L292+20
	bl	printk
.L282:
	ldr	r3, [r4, #8]
	add	r9, r5, #4864
	movs	r6, #0
	str	r3, [r5, #4]
	ldr	r3, [r4, #12]
	add	r4, r5, #4576
	adds	r4, r4, #20
	str	r6, [r5, #12]
	str	r3, [r5, #8]
	mov	r0, r4
	bl	h264e_reorder_init
	mov	r0, r9
	bl	h264e_marking_init
	mov	r1, r4
	mov	r2, r9
	add	r0, r5, #400
	bl	h264e_dpb_init
	add	r0, r5, #4448
	mov	r1, r4
	mov	r2, r9
	adds	r0, r0, #16
	bl	h264e_slice_init
	ldrd	r5, r4, [r5]
	movs	r2, #116
	mov	r1, r6
	add	r0, r4, #708
	bl	memset
	movs	r3, #31
	mov	ip, #66
	strd	ip, r3, [r4, #732]
	movw	r3, #4852
	movs	r2, #1
	str	r2, [r4, r3]
	movw	r3, #4856
	str	r6, [r4, r3]
	movw	r3, #4860
	movs	r2, #3
	str	r2, [r4, r3]
	add	r2, r4, #4864
	movs	r3, #2
	movw	r1, #4872
	ldr	r0, .L292+28
	str	r3, [r2]
	movw	r2, #4868
	str	r3, [r4, r2]
	movs	r2, #6
	str	r2, [r4, r1]
	movw	r1, #4876
	str	r2, [r4, r1]
	movw	r2, #4880
	ldr	r1, .L292+32
	cmp	r5, #1
	str	r3, [r4, r2]
	mov	r5, #10
	mov	r2, #2
	str	r6, [r4, #716]
	strd	r0, r1, [r4, #116]
	mov	r3, #12
	ldr	r1, .L292+36
	mov	r0, #30
	strd	r3, r3, [r4, #720]
	mov	r3, #0
	it	eq
	strdeq	r6, r6, [r4, #760]
	strd	r1, r3, [r4, #124]
	movs	r1, #1
	str	r3, [r4, #8]
	strd	r0, r1, [r4, #132]
	str	r3, [r4, #36]
	str	r3, [r4, #56]
	strd	r2, r3, [r4, #48]
	strd	r3, r3, [r4, #60]
	str	r3, [r4, #104]
	strd	r2, r2, [r4, #40]
	str	r2, [r4, #112]
	strd	r3, r0, [r4, #140]
	movs	r0, #60
	str	r1, [r4, #148]
	str	r1, [r4, #160]
	movs	r1, #160
	strd	r3, r5, [r4, #224]
	strd	r5, r1, [r4, #208]
	movs	r1, #51
	str	r3, [r4, #232]
	movs	r3, #28
	strd	r3, r1, [r4, #252]
	movs	r3, #32
	str	r3, [r4, #264]
	ldr	r3, [r7]
	str	r0, [r4, #152]
	str	r0, [r4, #204]
	movs	r0, #26
	str	r2, [r4, #240]
	strd	r0, r1, [r4, #216]
	str	r0, [r4, #248]
	str	r1, [r4, #260]
	lsls	r4, r3, #31
	bpl	.L277
	movs	r2, #213
	ldr	r1, .L292+4
	ldr	r0, .L292+40
	bl	printk
.L277:
	mov	r0, r8
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L293:
	.align	2
.L292:
	.word	.LANCHOR1
	.word	.LANCHOR0+137
	.word	.LC39
	.word	.LANCHOR0+148
	.word	.LC42
	.word	.LC26
	.word	.LC43
	.word	2000000
	.word	2500000
	.word	1500000
	.word	.LC41
	.fnend
	.size	h264e_init, .-h264e_init
	.global	api_h264e
	.global	h264e_debug
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.31781, %object
	.size	__FUNCTION__.31781, 20
__FUNCTION__.31781:
	.ascii	"h264e_proc_prep_cfg\000"
	.type	__func__.31786, %object
	.size	__func__.31786, 20
__func__.31786:
	.ascii	"h264e_proc_prep_cfg\000"
	.type	__func__.31812, %object
	.size	__func__.31812, 15
__func__.31812:
	.ascii	"h264e_proc_cfg\000"
	.type	__func__.31856, %object
	.size	__func__.31856, 15
__func__.31856:
	.ascii	"h264e_proc_hal\000"
	.type	__func__.31846, %object
	.size	__func__.31846, 15
__func__.31846:
	.ascii	"h264e_proc_dpb\000"
	.type	__func__.31828, %object
	.size	__func__.31828, 14
__func__.31828:
	.ascii	"h264e_gen_hdr\000"
	.type	__func__.31833, %object
	.size	__func__.31833, 12
__func__.31833:
	.ascii	"h264e_start\000"
	.type	__func__.31773, %object
	.size	__func__.31773, 13
__func__.31773:
	.ascii	"h264e_deinit\000"
	.type	__FUNCTION__.31774, %object
	.size	__FUNCTION__.31774, 13
__FUNCTION__.31774:
	.ascii	"h264e_deinit\000"
	.type	__func__.31763, %object
	.size	__func__.31763, 11
__func__.31763:
	.ascii	"h264e_init\000"
	.type	__FUNCTION__.31764, %object
	.size	__FUNCTION__.31764, 11
__FUNCTION__.31764:
	.ascii	"h264e_init\000"
	.space	1
	.type	api_h264e, %object
	.size	api_h264e, 56
api_h264e:
	.word	.LC44
	.word	7
	.word	5288
	.word	0
	.word	h264e_init
	.word	h264e_deinit
	.word	h264e_proc_cfg
	.word	h264e_gen_hdr
	.word	h264e_start
	.word	h264e_proc_dpb
	.word	h264e_proc_hal
	.word	h264e_add_sei
	.word	h264e_sw_enc
	.word	h264e_proc_show
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	h264e_debug, %object
	.size	h264e_debug, 4
h264e_debug:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\012--------h264e chn attr-------------------------"
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
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
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
	.ascii	"-----Syntax INFO2----------------------------------"
	.ascii	"-----------------------------------------------\012"
	.ascii	"\000"
.LC17:
	.ascii	"%7s|%10s|%10s|%10s|%12s|%6s|%8s|%8s\012\000"
.LC18:
	.ascii	"beta\000"
.LC19:
	.ascii	"alpha\000"
.LC20:
	.ascii	"POC\000"
.LC21:
	.ascii	"ScalingMode\000"
.LC22:
	.ascii	"trans8\000"
.LC23:
	.ascii	"Cabac\000"
.LC24:
	.ascii	"%7d|%10s|%10s|%10s|%12d|%6d|%8d|%8d\012\000"
.LC25:
	.ascii	"change\000"
.LC26:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC27:
	.ascii	"\0013%d: config maybe err should realloc buff max w"
	.ascii	":h [%d:%d] enc w:h[%d:%d]\000"
.LC28:
	.ascii	"\0016%d: dst->max_width %d, dst->max_height %d\000"
.LC29:
	.ascii	"\0013%d: invalid size w:h [%d:%d] stride [%d:%d]\012"
	.ascii	"\000"
.LC30:
	.ascii	"\0013%d: invalid cfg fbc data no support mirror %d "
	.ascii	"or rotaion %d\000"
.LC31:
	.ascii	"\0013%d: invalid color range %d colorspace %d prima"
	.ascii	"ries %d transfer characteristic %d\012\000"
.LC32:
	.ascii	"\0013%s:%d: failed to accept new prep config\012\000"
.LC33:
	.ascii	"\0016%d: MPP_ENC_SET_PREP_CFG w:h [%d:%d] stride [%"
	.ascii	"d:%d]\012\000"
.LC34:
	.ascii	"\0016%s:%d: enter ctx %p cmd %x param %p\012\000"
.LC35:
	.ascii	"\0013%d: No correspond cmd found, and can not confi"
	.ascii	"g!\000"
.LC36:
	.ascii	"\0013%d: poc type 2 is ocnflict with successive non"
	.ascii	"-reference pskip mode\012\000"
.LC37:
	.ascii	"\0013%d: set drop gap to 1\012\000"
.LC38:
	.ascii	"\0016%s:%d: leave ret %d\012\000"
.LC39:
	.ascii	"\0016%s:%d: enter\012\000"
.LC40:
	.ascii	"\0016%d: max tid is update to match cpb %d -> %d\012"
	.ascii	"\000"
.LC41:
	.ascii	"\0016%s:%d: leave\012\000"
.LC42:
	.ascii	"p->hdr_buf\000"
.LC43:
	.ascii	"p->hdr_pkt\000"
.LC44:
	.ascii	"h264e_control\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
