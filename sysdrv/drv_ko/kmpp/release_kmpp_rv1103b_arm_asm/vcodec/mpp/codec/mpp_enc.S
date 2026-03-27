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
	.file	"mpp_enc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_enc_deinit_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit_frame, %function
mpp_enc_deinit_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L1
	ldr	r3, [r0, #360]
	cbz	r3, .L1
	ldr	r0, [r0, #364]
	cbz	r0, .L1
	movw	r3, #5524
	movs	r2, #0
	str	r2, [r4, r3]
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #364
	bl	mpp_packet_deinit
	add	r0, r4, #360
	pop	{r4, lr}
	b	mpp_frame_deinit
.L1:
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_deinit_frame, .-mpp_enc_deinit_frame
	.align	1
	.global	mpp_enc_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_deinit, %function
mpp_enc_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	add	r6, r4, #5536
	adds	r6, r6, #4
	mov	r7, r0
	mov	r0, r6
	bl	down
	cbnz	r4, .L13
	movs	r2, #175
	ldr	r1, .L67
	ldr	r0, .L67+4
	bl	printk
	mvn	r0, #2
.L12:
	pop	{r4, r5, r6, r7, r8, pc}
.L13:
	movw	r3, #5532
	ldr	r3, [r4, r3]
	cbz	r3, .L15
	mov	r0, r4
	bl	mpp_enc_deinit_frame
.L15:
	mov	r0, r4
	bl	mpp_enc_impl_free_task
	ldr	r0, [r4, #4]
	cbz	r0, .L16
	bl	enc_impl_deinit
	movs	r3, #0
	str	r3, [r4, #4]
.L16:
	ldr	r0, [r4, #8]
	cbz	r0, .L17
	bl	mpp_enc_hal_deinit
	movs	r3, #0
	str	r3, [r4, #8]
.L17:
	ldr	r3, [r4, #396]
	cbz	r3, .L18
	add	r0, r4, #396
	bl	mpp_packet_deinit
.L18:
	ldr	r1, [r4, #400]
	cbz	r1, .L19
	ldr	r0, .L67+8
	bl	mpp_osal_free
.L19:
	movw	r5, #5436
	mov	r8, #0
	str	r8, [r4, #400]
	adds	r0, r4, r5
	ldr	r3, [r4, r5]
	cbz	r3, .L20
	bl	mpp_enc_ref_cfg_deinit
	str	r8, [r4, r5]
.L20:
	ldr	r3, [r4, #452]
	cbz	r3, .L21
	add	r0, r4, #452
	bl	mpp_enc_refs_deinit
	movs	r3, #0
	str	r3, [r4, #452]
.L21:
	ldr	r0, [r4, #48]
	cbz	r0, .L22
	bl	rc_deinit
	movs	r3, #0
	str	r3, [r4, #48]
.L22:
	movw	r3, #10924
	ldr	r3, [r4, r3]
	cbz	r3, .L23
	movw	r2, #10956
	ldr	r2, [r4, r2]
	ldr	r2, [r2, #12]
	cbnz	r2, .L24
	ldr	r0, [r3, #20]
	cbz	r0, .L24
	ldr	r1, .L67+8
	bl	mpp_buffer_put_with_caller
.L24:
	movw	r3, #10924
	ldr	r1, [r4, r3]
	mov	r5, r3
	cbz	r1, .L25
	ldr	r0, .L67+8
	bl	mpp_osal_free
.L25:
	movs	r3, #0
	str	r3, [r4, r5]
.L23:
	add	r0, r4, #5664
	adds	r0, r0, #28
	bl	mpp_enc_unref_osd_buf
	ldr	r1, [r4, #428]
	cbz	r1, .L26
	ldr	r0, .L67+8
	bl	mpp_osal_free
.L26:
	movs	r5, #0
	mov	r0, r6
	str	r5, [r4, #428]
	movw	r6, #5552
	strd	r5, r5, [r4, #436]
	bl	up
	ldr	r3, [r4, r6]
	cbz	r3, .L27
	movs	r1, #223
	ldr	r0, .L67+12
	bl	printk
	ldr	r3, [r7, #60]
	ldr	r0, [r4, r6]
	blx	r3
	movs	r1, #225
	ldr	r0, .L67+16
	bl	printk
	str	r5, [r4, r6]
.L27:
	ldr	r0, .L67+8
	mov	r1, r4
	bl	mpp_osal_free
	movs	r0, #0
	b	.L12
.L68:
	.align	2
.L67:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+15
	.word	.LC1
	.word	.LC2
	.fnend
	.size	mpp_enc_deinit, .-mpp_enc_deinit
	.align	1
	.global	mpp_enc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_init, %function
mpp_enc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L82
	movs	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #72
	sub	sp, sp, #72
	mov	r6, r1
	ldr	r7, [r1]
	strd	r3, r3, [sp]
	mov	r8, r0
	str	r2, [sp, #8]
	cbnz	r0, .L70
	movs	r2, #44
	ldr	r1, .L82+4
	ldr	r0, .L82+8
	mvn	r5, #2
	bl	printk
.L69:
	mov	r0, r5
	add	sp, sp, #72
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L70:
	str	r3, [r0]
	movw	r1, #10976
	ldr	r0, .L82+12
	bl	mpp_osal_calloc
	mov	r4, r0
	cbnz	r0, .L72
	movs	r2, #52
	ldr	r1, .L82+4
	ldr	r0, .L82+8
	mvn	r5, #3
	bl	printk
	b	.L69
.L72:
	add	r0, r0, #452
	bl	mpp_enc_refs_init
	mov	r5, r0
	cbz	r0, .L73
	ldr	r1, .L82+4
	movs	r2, #58
	ldr	r0, .L82+16
.L81:
	bl	printk
.L74:
	mov	r0, r4
	bl	mpp_enc_deinit
	b	.L69
.L73:
	ldr	r1, [r6, #4]
	movs	r3, #2
	strd	r3, r0, [sp, #60]
	add	r2, r4, #592
	ldr	r0, [r6, #8]
	str	r1, [sp, #40]
	ldr	r1, [r6, #16]
	str	r2, [sp, #36]
	str	r2, [sp, #20]
	str	r1, [sp, #44]
	ldr	r1, [r6, #24]
	strd	r7, r3, [sp, #12]
	str	r7, [sp, #32]
	str	r1, [sp, #68]
	ldr	r1, [r6, #28]
	str	r1, [sp, #48]
	ldr	r1, [r6, #20]
	str	r1, [sp, #52]
	ldr	r1, [r6, #36]
	str	r1, [sp, #56]
	movw	r1, #10928
	str	r0, [r4, r1]
	movw	r1, #10932
	ldr	r0, [r6, #12]
	str	r0, [r4, r1]
	movw	r1, #5540
	ldr	r2, [r4, #452]
	movs	r0, #1
	str	r0, [r4, r1]
	add	r0, sp, #4
	strd	r2, r3, [sp, #24]
	adds	r3, r4, r1
	adds	r2, r3, #4
	add	r1, sp, #32
	strd	r2, r2, [r3, #4]
	bl	mpp_enc_hal_init
	mov	r5, r0
	cbz	r0, .L75
	movs	r2, #84
	ldr	r1, .L82+4
	ldr	r0, .L82+20
	b	.L81
.L75:
	ldr	r3, [sp, #60]
	add	r1, sp, #12
	mov	r0, sp
	str	r3, [sp, #16]
	mov	r3, #-1
	str	r3, [sp, #28]
	ldr	r3, .L82+24
	cmp	r7, r3
	itt	eq
	ldreq	r3, [r6, #40]
	streq	r3, [r4, #1324]
	bl	enc_impl_init
	mov	r5, r0
	cbz	r0, .L77
	movs	r2, #94
	ldr	r1, .L82+4
	ldr	r0, .L82+28
	b	.L81
.L77:
	mov	r0, r4
	bl	mpp_enc_impl_alloc_task
	ldr	r2, [r6, #20]
	add	r0, r4, #48
	cbz	r2, .L78
	add	r2, sp, #8
.L78:
	mov	r1, r7
	mov	r5, #1024
	bl	rc_init
	str	r7, [r4]
	mov	r1, r5
	str	r5, [r4, #440]
	ldr	r0, .L82+12
	ldr	r3, [sp]
	str	r3, [r4, #4]
	ldr	r3, [sp, #4]
	str	r3, [r4, #8]
	ldr	r3, [sp, #64]
	str	r3, [r4, #12]
	movs	r3, #0
	str	r3, [r4, #416]
	ldr	r3, .L82+32
	str	r3, [r4, #420]
	movs	r3, #40
	str	r3, [r4, #424]
	bl	mpp_osal_calloc
	mov	r1, r5
	str	r0, [r4, #428]
	ldr	r0, .L82+12
	bl	mpp_osal_calloc
	mov	r2, r5
	mov	r1, r0
	str	r0, [r4, #400]
	add	r0, r4, #396
	bl	mpp_packet_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L74
	mov	r1, r0
	ldr	r0, [r4, #396]
	bl	mpp_packet_set_length
	str	r7, [r4, #1296]
	movw	r7, #5436
	adds	r0, r4, r7
	bl	mpp_enc_ref_cfg_init
	mov	r5, r0
	cmp	r0, #0
	bne	.L74
	ldr	r5, [r4, r7]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_ref_cfg_copy
	mov	r5, r0
	cmp	r0, #0
	bne	.L74
	ldr	r5, [r4, #452]
	bl	mpp_enc_ref_default
	mov	r1, r0
	mov	r0, r5
	bl	mpp_enc_refs_set_cfg
	mov	r5, r0
	cmp	r0, #0
	bne	.L74
	ldr	r1, [r4, #744]
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_set_rc_igop
	mov	r5, r0
	cmp	r0, #0
	bne	.L74
	movw	r3, #5520
	movs	r2, #1
	str	r2, [r4, r3]
	movw	r3, #5524
	str	r0, [r4, r3]
	movw	r3, #6822
	movs	r2, #4
	strb	r2, [r4, r3]
	bl	get_vsm_ops
	cbnz	r0, .L79
	movs	r1, #48
	ldr	r0, .L82+12
	bl	mpp_osal_calloc
	movw	r3, #10924
	str	r0, [r4, r3]
.L79:
	ldr	r2, [r6, #4]
	movw	r3, #5532
	str	r2, [r4, r3]
	movw	r3, #10956
	ldr	r2, [r6, #24]
	str	r2, [r4, r3]
	movw	r3, #10964
	ldr	r2, [r6, #32]
	str	r2, [r4, r3]
	add	r3, r4, #5536
	ldr	r2, [r6, #16]
	str	r2, [r3]
	str	r4, [r8]
	b	.L69
.L83:
	.align	2
.L82:
	.word	.LC3
	.word	.LANCHOR0+30
	.word	.LC4
	.word	.LANCHOR0+43
	.word	.LC5
	.word	.LC6
	.word	16777220
	.word	.LC7
	.word	.LC8
	.fnend
	.size	mpp_enc_init, .-mpp_enc_init
	.align	1
	.global	mpp_enc_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_start, %function
mpp_enc_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L93
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L85
	mov	r3, r0
	movs	r2, #237
	ldr	r1, .L93+4
	ldr	r0, .L93+8
	bl	printk
.L85:
	add	r6, r4, #5536
	adds	r6, r6, #4
	mov	r0, r6
	bl	down
	movw	r3, #5520
	movs	r2, #0
	mov	r0, r6
	str	r2, [r4, r3]
	bl	up
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L86
	mov	r3, r4
	movs	r2, #244
	ldr	r1, .L93+4
	ldr	r0, .L93+12
	bl	printk
.L86:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L94:
	.align	2
.L93:
	.word	.LANCHOR1
	.word	.LANCHOR0+56
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_start, .-mpp_enc_start
	.align	1
	.global	mpp_enc_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_stop, %function
mpp_enc_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r5, r0, #5536
	adds	r5, r5, #4
	ldr	r6, .L104
	mov	r4, r0
	mov	r0, r5
	bl	down
	ldr	r2, [r6]
	lsls	r2, r2, #31
	bpl	.L96
	mov	r3, r4
	movs	r2, #255
	ldr	r1, .L104+4
	ldr	r0, .L104+8
	bl	printk
.L96:
	movw	r3, #5520
	movs	r2, #1
	str	r2, [r4, r3]
	movw	r3, #5524
	ldr	r7, [r4, r3]
	ldr	r3, [r6]
	lsls	r3, r3, #31
	bpl	.L97
	mov	r3, r4
	mov	r2, #258
	ldr	r1, .L104+4
	ldr	r0, .L104+12
	bl	printk
.L97:
	mov	r0, r5
	bl	up
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, pc}
.L105:
	.align	2
.L104:
	.word	.LANCHOR1
	.word	.LANCHOR0+70
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_stop, .-mpp_enc_stop
	.align	1
	.global	mpp_enc_check_pkt_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_pkt_pool, %function
mpp_enc_check_pkt_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	get_mpibuf_ops
	cbz	r0, .L106
	ldr	r3, [r0, #68]
	cbz	r3, .L106
	movw	r2, #5552
	ldr	r0, [r4, r2]
	pop	{r4, lr}
	bx	r3
.L106:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_enc_check_pkt_pool, .-mpp_enc_check_pkt_pool
	.align	1
	.global	mpp_enc_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_reset, %function
mpp_enc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L119
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r3]
	lsls	r3, r3, #31
	bpl	.L113
	mov	r3, r0
	mov	r2, #282
	ldr	r1, .L119+4
	ldr	r0, .L119+8
	bl	printk
.L113:
	cbnz	r4, .L115
	mov	r2, #284
	ldr	r1, .L119+4
	ldr	r0, .L119+12
	bl	printk
	mvn	r0, #2
.L112:
	pop	{r4, pc}
.L115:
	movs	r0, #0
	b	.L112
.L120:
	.align	2
.L119:
	.word	.LANCHOR1
	.word	.LANCHOR0+83
	.word	.LC9
	.word	.LC11
	.fnend
	.size	mpp_enc_reset, .-mpp_enc_reset
	.align	1
	.global	mpp_enc_oneframe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_oneframe, %function
mpp_enc_oneframe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L122
	movw	r2, #297
	ldr	r1, .L130
	ldr	r0, .L130+4
	bl	printk
	mvn	r0, #2
.L121:
	pop	{r3, r4, r5, pc}
.L122:
	ldr	r5, .L130+8
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bmi	.L124
.L129:
	movs	r0, #0
	b	.L121
.L124:
	mov	r3, r0
	movw	r2, #301
	ldr	r1, .L130
	ldr	r0, .L130+12
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L129
	mov	r3, r4
	movw	r2, #303
	ldr	r1, .L130
	ldr	r0, .L130+16
	bl	printk
	b	.L129
.L131:
	.align	2
.L130:
	.word	.LANCHOR0+97
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_oneframe, .-mpp_enc_oneframe
	.align	1
	.global	mpp_enc_online_task_failed
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_online_task_failed, %function
mpp_enc_online_task_failed:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movw	r1, #1029
	add	r2, sp, #4
	ldr	r0, [r0, #12]
	movs	r3, #0
	str	r3, [sp, #4]
	bl	mpp_dev_chnl_control
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
	.fnend
	.size	mpp_enc_online_task_failed, .-mpp_enc_online_task_failed
	.align	1
	.global	mpp_enc_cfg_reg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_cfg_reg, %function
mpp_enc_cfg_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r1
	mov	r4, r0
	cbnz	r0, .L134
	mov	r2, #322
	ldr	r1, .L144
	ldr	r0, .L144+4
	mvn	r6, #2
	bl	printk
.L133:
	mov	r0, r6
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L134:
	ldr	r3, .L144+8
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #1
	beq	.L136
	mov	r3, r0
	mov	r2, #326
	ldr	r1, .L144
	ldr	r0, .L144+12
	bl	printk
.L136:
	add	r5, r4, #5536
	adds	r5, r5, #4
	mov	r0, r5
	bl	down
	movw	r3, #5520
	ldr	r6, [r4, r3]
	cbz	r6, .L137
	mov	r0, r5
	mov	r6, #-1
	bl	up
	b	.L133
.L137:
	movw	r7, #5528
	mov	r0, r4
	bl	mpp_enc_proc_rc_update
	str	r6, [r4, r7]
	mov	r1, r9
	mov	r0, r4
	bl	mpp_enc_impl_reg_cfg
	movs	r3, #1
	str	r3, [r4, r7]
	mov	r6, r0
	mov	r0, r5
	bl	up
	ldr	r3, [r8]
	lsls	r3, r3, #31
	bpl	.L133
	mov	r3, r4
	movw	r2, #337
	ldr	r1, .L144
	ldr	r0, .L144+16
	bl	printk
	b	.L133
.L145:
	.align	2
.L144:
	.word	.LANCHOR0+114
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_cfg_reg, .-mpp_enc_cfg_reg
	.align	1
	.global	mpp_enc_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_hw_start, %function
mpp_enc_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r7, r1
	mov	r4, r0
	cbnz	r0, .L147
	movw	r2, #349
	ldr	r1, .L177
	ldr	r0, .L177+4
	mvn	r5, #2
	bl	printk
.L146:
	mov	r0, r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L147:
	ldr	r3, .L177+8
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #1
	beq	.L149
	mov	r3, r0
	movw	r2, #353
	ldr	r1, .L177
	ldr	r0, .L177+12
	bl	printk
.L149:
	add	r6, r4, #5536
	adds	r6, r6, #4
	mov	r0, r6
	bl	down
	movw	r3, #5520
	ldr	r3, [r4, r3]
	cbz	r3, .L150
	mov	r0, r6
	mov	r5, #-1
	bl	up
	b	.L146
.L150:
	movw	r3, #5528
	movs	r2, #2
	str	r2, [r4, r3]
	cbz	r7, .L151
	str	r2, [r7, r3]
.L151:
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_impl_hw_start
	movw	r3, #5528
	movs	r2, #3
	str	r2, [r4, r3]
	mov	r5, r0
	cbz	r7, .L152
	str	r2, [r7, r3]
.L152:
	cbnz	r5, .L153
	bl	get_mpidev_ops
	mov	r7, r0
	cbz	r0, .L154
	ldr	r3, [r0, #32]
	cbz	r3, .L154
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_dts
	movw	r3, #5532
	ldr	r3, [r4, r3]
	strd	r0, [sp]
	cbz	r3, .L154
	movw	r0, #10964
	ldr	r3, [r7, #32]
	mov	r2, sp
	mov	r1, r5
	ldr	r0, [r4, r0]
	blx	r3
.L154:
	movw	r3, #5524
	movs	r2, #1
	str	r2, [r4, r3]
.L153:
	mov	r0, r6
	bl	up
	ldr	r3, [r8]
	lsls	r3, r3, #31
	bpl	.L146
	mov	r3, r4
	movw	r2, #379
	ldr	r1, .L177
	ldr	r0, .L177+16
	bl	printk
	b	.L146
.L178:
	.align	2
.L177:
	.word	.LANCHOR0+130
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_hw_start, .-mpp_enc_hw_start
	.align	1
	.global	mpp_enc_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_run_task, %function
mpp_enc_run_task:
	.fnstart
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r3
	ldr	r7, [r0]
	.pad #28
	sub	sp, sp, #28
	ldr	r3, .L213
	mov	r4, r0
	mov	r8, r2
	cmp	r7, r3
	ite	eq
	moveq	r7, #8
	movne	r7, #16
	cbnz	r0, .L181
	mov	r2, #392
	ldr	r1, .L213+4
	ldr	r0, .L213+8
	mvn	r7, #2
	bl	printk
.L179:
	mov	r0, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L181:
	ldr	r5, .L213+12
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L183
	mov	r3, r0
	mov	r2, #396
	ldr	r1, .L213+4
	ldr	r0, .L213+16
	bl	printk
.L183:
	movw	r3, #5528
	ldr	r6, [r4, r3]
	cmp	r6, #3
	bne	.L191
	movs	r2, #4
	str	r2, [r4, r3]
	ldr	r0, [r4, #364]
	cbz	r0, .L185
	mov	r2, r8
	mov	r3, r9
	bl	mpp_packet_set_pts
	ldr	r0, [r4, #364]
	ldrd	r2, [sp, #56]
	bl	mpp_packet_set_dts
.L185:
	ldr	r0, [r4, #360]
	cbz	r0, .L186
	mov	r2, r8
	mov	r3, r9
	bl	mpp_frame_set_pts
	ldr	r0, [r4, #360]
	ldrd	r2, [sp, #56]
	bl	mpp_frame_set_dts
.L186:
	bl	get_mpidev_ops
	mov	r8, r0
	cbz	r0, .L187
	ldr	r3, [r0, #32]
	cbz	r3, .L187
	movw	r2, #10964
	movs	r1, #1
	ldr	r9, [r4, r2]
	add	r2, sp, #8
	mov	r0, r9
	blx	r3
	ldr	r3, [r8, #32]
	movs	r1, #2
	mov	r0, r9
	add	r2, sp, #12
	blx	r3
.L187:
	ldr	r2, [r4, #604]
	rsbs	r1, r7, #0
	ldr	r3, [r4, #608]
	subs	r2, r2, #1
	ldr	r0, [r4, #12]
	subs	r3, r3, #1
	add	r2, r2, r7
	add	r3, r3, r7
	ands	r2, r2, r1
	ands	r3, r3, r1
	str	r2, [sp, #16]
	movs	r1, #4
	add	r2, sp, #8
	str	r3, [sp, #20]
	bl	mpp_dev_ioctl
	movw	r3, #5528
	subs	r7, r0, #0
	it	eq
	moveq	r6, #5
	str	r6, [r4, r3]
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L189
	mov	r3, r4
	movw	r2, #435
	ldr	r1, .L213+4
	ldr	r0, .L213+20
	bl	printk
.L189:
	cmp	r7, #0
	beq	.L179
.L184:
	add	r2, sp, #4
	movw	r1, #1029
	ldr	r0, [r4, #12]
	movs	r3, #1
	str	r3, [sp, #4]
	bl	mpp_dev_chnl_control
	b	.L179
.L191:
	mov	r7, #-1
	b	.L184
.L214:
	.align	2
.L213:
	.word	16777220
	.word	.LANCHOR0+147
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_run_task, .-mpp_enc_run_task
	.align	1
	.global	mpp_enc_set_online_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_set_online_mode, %function
mpp_enc_set_online_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	str	r1, [sp, #4]
	cbnz	r0, .L216
	movw	r2, #451
	ldr	r1, .L223
	ldr	r0, .L223+4
	bl	printk
	mvn	r0, #2
.L215:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L216:
	ldr	r5, .L223+8
	ldr	r2, [r5]
	lsls	r3, r2, #31
	bpl	.L218
	mov	r3, r0
	movw	r2, #455
	ldr	r1, .L223
	ldr	r0, .L223+12
	bl	printk
.L218:
	ldr	r2, [sp, #4]
	movw	r3, #5532
	movw	r1, #1030
	str	r2, [r4, r3]
	add	r2, sp, #4
	ldr	r0, [r4, #12]
	bl	mpp_dev_chnl_control
	ldr	r0, [r5]
	ands	r0, r0, #1
	beq	.L215
	mov	r3, r4
	mov	r2, #460
	ldr	r1, .L223
	ldr	r0, .L223+16
	bl	printk
	movs	r0, #0
	b	.L215
.L224:
	.align	2
.L223:
	.word	.LANCHOR0+164
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_set_online_mode, .-mpp_enc_set_online_mode
	.align	1
	.global	mpp_enc_check_hw_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_hw_running, %function
mpp_enc_check_hw_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L229
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_check_running
.L229:
	mov	r2, #470
	ldr	r1, .L230
	ldr	r0, .L230+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L231:
	.align	2
.L230:
	.word	.LANCHOR0+188
	.word	.LC11
	.fnend
	.size	mpp_enc_check_hw_running, .-mpp_enc_check_hw_running
	.align	1
	.global	mpp_enc_unbind_jpeg_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unbind_jpeg_task, %function
mpp_enc_unbind_jpeg_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L236
	ldr	r0, [r0, #12]
	pop	{r3, lr}
	b	mpp_dev_chnl_unbind_jpeg_task
.L236:
	mov	r2, #482
	ldr	r1, .L237
	ldr	r0, .L237+4
	bl	printk
	mvn	r0, #2
	pop	{r3, pc}
.L238:
	.align	2
.L237:
	.word	.LANCHOR0+213
	.word	.LC11
	.fnend
	.size	mpp_enc_unbind_jpeg_task, .-mpp_enc_unbind_jpeg_task
	.align	1
	.global	mpp_enc_check_is_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_is_int_process, %function
mpp_enc_check_is_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L240
	movw	r2, #495
	ldr	r1, .L242
	ldr	r0, .L242+4
	bl	printk
.L241:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L240:
	add	r5, r0, #5536
	adds	r5, r5, #4
	mov	r0, r5
	bl	down
	movw	r3, #5528
	ldr	r4, [r4, r3]
	mov	r0, r5
	subs	r3, r4, #6
	rsbs	r4, r3, #0
	adcs	r4, r4, r3
	bl	up
	b	.L241
.L243:
	.align	2
.L242:
	.word	.LANCHOR0+238
	.word	.LC11
	.fnend
	.size	mpp_enc_check_is_int_process, .-mpp_enc_check_is_int_process
	.align	1
	.global	mpp_enc_int_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_int_process, %function
mpp_enc_int_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r6, r2
	mov	r8, r3
	mov	r4, r0
	cbnz	r0, .L245
	movw	r2, #515
	ldr	r1, .L262
	ldr	r0, .L262+4
	mvn	r6, #2
	bl	printk
.L244:
	mov	r0, r6
	pop	{r4, r5, r6, r7, r8, pc}
.L245:
	ldr	r7, .L262+8
	ldr	r2, [r7]
	lsls	r2, r2, #31
	bpl	.L247
	mov	r3, r0
	movw	r2, #519
	ldr	r1, .L262
	ldr	r0, .L262+12
	bl	printk
.L247:
	movw	r3, #5528
	movs	r2, #6
	str	r2, [r4, r3]
	cbz	r5, .L248
	str	r2, [r5, r3]
.L248:
	mov	r2, r6
	mov	r3, r8
	mov	r1, r5
	mov	r0, r4
	bl	mpp_enc_impl_int
	movw	r3, #5528
	movs	r2, #7
	str	r2, [r4, r3]
	mov	r6, r0
	cbz	r5, .L249
	str	r2, [r5, r3]
.L249:
	movw	r3, #5524
	movs	r2, #0
	str	r2, [r4, r3]
	ldr	r3, [r7]
	lsls	r3, r3, #31
	bpl	.L244
	mov	r3, r4
	mov	r2, #528
	ldr	r1, .L262
	ldr	r0, .L262+16
	bl	printk
	b	.L244
.L263:
	.align	2
.L262:
	.word	.LANCHOR0+267
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_int_process, .-mpp_enc_int_process
	.align	1
	.global	mpp_enc_slice_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_slice_info, %function
mpp_enc_slice_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r4, #5528
	movs	r3, #8
	str	r3, [r0, r4]
	mov	r5, r0
	bl	mpp_enc_impl_slice_info
	movs	r3, #9
	str	r3, [r5, r4]
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpp_enc_slice_info, .-mpp_enc_slice_info
	.align	1
	.global	mpp_enc_proc_debug
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_debug, %function
mpp_enc_proc_debug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	mov	r7, r2
	mov	r4, r1
	cbnz	r1, .L266
	mov	r2, #548
	ldr	r1, .L272
	ldr	r0, .L272+4
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L266:
	ldr	r5, .L272+8
	ldr	r2, [r5]
	lsls	r2, r2, #31
	bpl	.L267
	mov	r3, r1
	mov	r2, #552
	ldr	r1, .L272
	ldr	r0, .L272+12
	bl	printk
.L267:
	mov	r2, r7
	mov	r1, r4
	mov	r0, r6
	bl	mpp_enc_impl_poc_debug_info
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L265
	mov	r3, r4
	mov	r2, #556
	ldr	r1, .L272
	ldr	r0, .L272+16
	pop	{r4, r5, r6, r7, r8, lr}
	b	printk
.L265:
	pop	{r4, r5, r6, r7, r8, pc}
.L273:
	.align	2
.L272:
	.word	.LANCHOR0+287
	.word	.LC11
	.word	.LANCHOR1
	.word	.LC9
	.word	.LC10
	.fnend
	.size	mpp_enc_proc_debug, .-mpp_enc_proc_debug
	.align	1
	.global	mpp_enc_register_chl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_register_chl, %function
mpp_enc_register_chl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L275
	mov	r2, #568
	ldr	r1, .L277
	ldr	r0, .L277+4
	bl	printk
	mvn	r0, #2
.L274:
	pop	{r3, pc}
.L275:
	movw	r3, #5532
	ldr	r3, [r0, r3]
	ldr	r0, [r0, #12]
	orr	r2, r2, r3, lsl #16
	bl	mpp_dev_chnl_register
	movs	r0, #0
	b	.L274
.L278:
	.align	2
.L277:
	.word	.LANCHOR0+306
	.word	.LC11
	.fnend
	.size	mpp_enc_register_chl, .-mpp_enc_register_chl
	.align	1
	.global	mpp_enc_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_notify, %function
mpp_enc_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L286
	ldr	r3, [r5]
	lsls	r2, r3, #31
	bpl	.L281
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #583
	ldr	r1, .L286+4
	ldr	r0, .L286+8
	bl	printk
	ldr	r3, [r5]
	lsls	r3, r3, #31
	bpl	.L281
	mov	r3, r4
	movw	r2, #585
	ldr	r1, .L286+4
	ldr	r0, .L286+12
	bl	printk
.L281:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L287:
	.align	2
.L286:
	.word	.LANCHOR1
	.word	.LANCHOR0+327
	.word	.LC12
	.word	.LC10
	.fnend
	.size	mpp_enc_notify, .-mpp_enc_notify
	.align	1
	.global	mpp_enc_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_control, %function
mpp_enc_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r6, r1
	mov	r4, r2
	mov	r5, r0
	cbnz	r0, .L289
	movw	r2, #601
	ldr	r1, .L353
	ldr	r0, .L353+4
	bl	printk
.L350:
	mvn	r0, #2
.L288:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L289:
	cbnz	r2, .L291
	ldr	r3, .L353+8
	cmp	r1, r3
	beq	.L291
	mov	r3, r0
	str	r1, [sp]
	movw	r2, #606
	ldr	r1, .L353
	ldr	r0, .L353+12
	bl	printk
	b	.L350
.L291:
	ldr	r7, .L353+16
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L292
	str	r4, [sp]
	mov	r3, r6
	movw	r2, #610
	ldr	r1, .L353
	ldr	r0, .L353+20
	bl	printk
.L292:
	ldr	r3, .L353+24
	cmp	r6, r3
	beq	.L293
	bhi	.L294
	subs	r3, r3, #4
	cmp	r6, r3
	beq	.L295
	bhi	.L296
	subs	r3, r3, #1
	cmp	r6, r3
	beq	.L297
.L298:
	add	r8, r5, #5536
	add	r8, r8, #4
	mov	r0, r8
	bl	down
	mov	r2, r4
	mov	r1, r6
	mov	r0, r5
	bl	mpp_enc_proc_cfg
	ldr	r0, [r5, #8]
	bl	mpp_enc_hal_prepare
	mov	r0, r8
	bl	up
	ldr	r0, [r7]
	ands	r0, r0, #2
	beq	.L288
	mov	r3, r6
	mov	r2, #676
	ldr	r1, .L353
	ldr	r0, .L353+28
	bl	printk
	b	.L349
.L296:
	ldr	r3, .L353+32
	cmp	r6, r3
	beq	.L299
	adds	r3, r3, #2
	cmp	r6, r3
	bne	.L298
	ldr	r3, [r7]
	lsls	r6, r3, #30
	bpl	.L311
	mov	r2, #648
	ldr	r1, .L353
	ldr	r0, .L353+36
	bl	printk
.L311:
	movs	r2, #200
	add	r1, r5, #696
	b	.L351
.L294:
	ldr	r3, .L353+40
	cmp	r6, r3
	beq	.L301
	bhi	.L302
	subs	r3, r3, #12
	cmp	r6, r3
	bne	.L298
	ldr	r3, [r7]
	lsls	r0, r3, #30
	bpl	.L312
	movw	r2, #653
	ldr	r1, .L353
	ldr	r0, .L353+44
	bl	printk
.L312:
	movw	r2, #2836
	add	r1, r5, #1296
	b	.L351
.L302:
	ldr	r3, .L353+48
	cmp	r6, r3
	beq	.L304
	add	r3, r3, #512
	cmp	r6, r3
	bne	.L298
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L314
	movw	r2, #663
	ldr	r1, .L353
	ldr	r0, .L353+52
	bl	printk
.L314:
	add	r5, r5, #5408
	adds	r5, r5, #4
	add	r3, r5, #24
.L315:
	ldr	r2, [r5], #4	@ unaligned
	cmp	r5, r3
	str	r2, [r4], #4	@ unaligned
	bne	.L315
	b	.L349
.L297:
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L306
	mov	r2, #616
	ldr	r1, .L353
	ldr	r0, .L353+56
	bl	printk
.L306:
	movw	r2, #4920
	add	r1, r5, #592
	mov	r0, r4
	bl	memcpy
	ldr	r3, [r4, #56]
	movs	r0, #0
	str	r0, [r4, #104]
	bic	r3, r3, #2
	str	r0, [r4, #8]
	cmp	r3, #1
	str	r0, [r4, #304]
	str	r0, [r4, #708]
	it	eq
	ldrdeq	r2, r3, [r4, #12]
	str	r0, [r4, #3540]
	ittt	eq
	strdeq	r3, r2, [r4, #12]
	ldrdeq	r2, r3, [r4, #28]
	strdeq	r3, r2, [r4, #28]
	movw	r3, #4848
	str	r0, [r4, r3]
	b	.L288
.L295:
	ldr	r3, [r7]
	lsls	r2, r3, #30
	bpl	.L308
	movw	r2, #633
	ldr	r1, .L353
	ldr	r0, .L353+60
	bl	printk
.L308:
	add	r0, r5, #600
	movs	r2, #96
	mov	r1, r4
.L352:
	bl	memcpy
	b	.L349
.L293:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L309
	movw	r2, #638
	ldr	r1, .L353
	ldr	r0, .L353+64
	bl	printk
.L309:
	movw	r2, #2836
	mov	r1, r4
	add	r0, r5, #1296
	b	.L352
.L299:
	ldr	r3, [r7]
	lsls	r7, r3, #30
	bpl	.L310
	movw	r2, #643
	ldr	r1, .L353
	ldr	r0, .L353+68
	bl	printk
.L310:
	add	r1, r5, #600
	movs	r2, #96
.L351:
	mov	r0, r4
	b	.L352
.L304:
	ldr	r3, [r7]
	lsls	r1, r3, #30
	bpl	.L313
	movw	r2, #658
	ldr	r1, .L353
	ldr	r0, .L353+72
	bl	printk
.L313:
	ldr	r3, [r5, #412]	@ unaligned
	str	r3, [r4]	@ unaligned
.L349:
	movs	r0, #0
	b	.L288
.L301:
	ldr	r3, [r7]
	lsls	r3, r3, #30
	bpl	.L316
	mov	r2, #668
	ldr	r1, .L353
	ldr	r0, .L353+76
	bl	printk
.L316:
	add	r1, r5, #4128
	movs	r2, #136
	adds	r1, r1, #20
	b	.L351
.L354:
	.align	2
.L353:
	.word	.LANCHOR0+342
	.word	.LC13
	.word	3276809
	.word	.LC14
	.word	.LANCHOR1
	.word	.LC15
	.word	3276807
	.word	.LC25
	.word	3276804
	.word	.LC20
	.word	3276820
	.word	.LC21
	.word	3309570
	.word	.LC23
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC22
	.word	.LC24
	.fnend
	.size	mpp_enc_control, .-mpp_enc_control
	.align	1
	.global	mpp_enc_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_pkt_full_inc, %function
mpp_enc_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	mpp_enc_impl_pkt_full_inc
	.fnend
	.size	mpp_enc_pkt_full_inc, .-mpp_enc_pkt_full_inc
	.global	mpp_enc_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.22423, %object
	.size	__func__.22423, 15
__func__.22423:
	.ascii	"mpp_enc_deinit\000"
	.type	__FUNCTION__.22424, %object
	.size	__FUNCTION__.22424, 15
__FUNCTION__.22424:
	.ascii	"mpp_enc_deinit\000"
	.type	__func__.22403, %object
	.size	__func__.22403, 13
__func__.22403:
	.ascii	"mpp_enc_init\000"
	.type	__FUNCTION__.22404, %object
	.size	__FUNCTION__.22404, 13
__FUNCTION__.22404:
	.ascii	"mpp_enc_init\000"
	.type	__func__.22429, %object
	.size	__func__.22429, 14
__func__.22429:
	.ascii	"mpp_enc_start\000"
	.type	__func__.22435, %object
	.size	__func__.22435, 13
__func__.22435:
	.ascii	"mpp_enc_stop\000"
	.type	__func__.22450, %object
	.size	__func__.22450, 14
__func__.22450:
	.ascii	"mpp_enc_reset\000"
	.type	__func__.22458, %object
	.size	__func__.22458, 17
__func__.22458:
	.ascii	"mpp_enc_oneframe\000"
	.type	__func__.22470, %object
	.size	__func__.22470, 16
__func__.22470:
	.ascii	"mpp_enc_cfg_reg\000"
	.type	__func__.22478, %object
	.size	__func__.22478, 17
__func__.22478:
	.ascii	"mpp_enc_hw_start\000"
	.type	__func__.22493, %object
	.size	__func__.22493, 17
__func__.22493:
	.ascii	"mpp_enc_run_task\000"
	.type	__func__.22504, %object
	.size	__func__.22504, 24
__func__.22504:
	.ascii	"mpp_enc_set_online_mode\000"
	.type	__func__.22509, %object
	.size	__func__.22509, 25
__func__.22509:
	.ascii	"mpp_enc_check_hw_running\000"
	.type	__func__.22514, %object
	.size	__func__.22514, 25
__func__.22514:
	.ascii	"mpp_enc_unbind_jpeg_task\000"
	.type	__func__.22520, %object
	.size	__func__.22520, 29
__func__.22520:
	.ascii	"mpp_enc_check_is_int_process\000"
	.type	__func__.22530, %object
	.size	__func__.22530, 20
__func__.22530:
	.ascii	"mpp_enc_int_process\000"
	.type	__func__.22546, %object
	.size	__func__.22546, 19
__func__.22546:
	.ascii	"mpp_enc_proc_debug\000"
	.type	__func__.22554, %object
	.size	__func__.22554, 21
__func__.22554:
	.ascii	"mpp_enc_register_chl\000"
	.type	__func__.22560, %object
	.size	__func__.22560, 15
__func__.22560:
	.ascii	"mpp_enc_notify\000"
	.type	__func__.22568, %object
	.size	__func__.22568, 16
__func__.22568:
	.ascii	"mpp_enc_control\000"
	.type	__param_str_mpp_enc_debug, %object
	.size	__param_str_mpp_enc_debug, 25
__param_str_mpp_enc_debug:
	.ascii	"mpp_vcodec.mpp_enc_debug\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpp_enc_debug, %object
	.size	mpp_enc_debug, 4
mpp_enc_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_mpp_enc_debug163, %object
	.size	__UNIQUE_ID_mpp_enc_debug163, 61
__UNIQUE_ID_mpp_enc_debug163:
	.ascii	"mpp_vcodec.parm=mpp_enc_debug:bits mpp_enc debug in"
	.ascii	"formation\000"
	.type	__UNIQUE_ID_mpp_enc_debugtype162, %object
	.size	__UNIQUE_ID_mpp_enc_debugtype162, 39
__UNIQUE_ID_mpp_enc_debugtype162:
	.ascii	"mpp_vcodec.parmtype=mpp_enc_debug:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: found NULL input\012\000"
.LC1:
	.ascii	"\0016%d: buf_pool_destroy in\000"
.LC2:
	.ascii	"\0016%d: buf_pool_destroy out\000"
.LC3:
	.ascii	"smart\000"
.LC4:
	.ascii	"\0013%s:%d: failed to malloc context\012\000"
.LC5:
	.ascii	"\0013%s:%d: could not init enc refs\012\000"
.LC6:
	.ascii	"\0013%s:%d: could not init enc hal\012\000"
.LC7:
	.ascii	"\0013%s:%d: could not init impl\012\000"
.LC8:
	.ascii	"unknown mpp version for missing VCS info\000"
.LC9:
	.ascii	"\0016%s:%d: %p in\012\000"
.LC10:
	.ascii	"\0016%s:%d: %p out\012\000"
.LC11:
	.ascii	"\0013%s:%d: found NULL input enc\012\000"
.LC12:
	.ascii	"\0016%s:%d: %p in flag %08x\012\000"
.LC13:
	.ascii	"\0013%s:%d: found NULL enc\012\000"
.LC14:
	.ascii	"\0013%s:%d: found NULL param enc %p cmd %x\012\000"
.LC15:
	.ascii	"\0016%s:%d: sending cmd %d param %p\012\000"
.LC16:
	.ascii	"\0016%s:%d: get all config\012\000"
.LC17:
	.ascii	"\0016%s:%d: set prep config\012\000"
.LC18:
	.ascii	"\0016%s:%d: set codec config\012\000"
.LC19:
	.ascii	"\0016%s:%d: get prep config\012\000"
.LC20:
	.ascii	"\0016%s:%d: get rc config\012\000"
.LC21:
	.ascii	"\0016%s:%d: get codec config\012\000"
.LC22:
	.ascii	"\0016%s:%d: get header mode\012\000"
.LC23:
	.ascii	"\0016%s:%d: get ref config\012\000"
.LC24:
	.ascii	"\0016%s:%d: get roi config\012\000"
.LC25:
	.ascii	"\0016%s:%d: sending cmd %d done\012\000"
	.section	__param,"a"
	.align	2
	.type	__param_mpp_enc_debug, %object
	.size	__param_mpp_enc_debug, 20
__param_mpp_enc_debug:
	.word	__param_str_mpp_enc_debug
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	mpp_enc_debug
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
