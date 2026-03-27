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
	.file	"mpp_enc_impl.c"
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
	.type	check_hal_task_pkt_len, %function
check_hal_task_pkt_len:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r4, [r0, #48]
	ldr	r0, [r0, #28]
	bl	mpp_packet_get_length
	cmp	r4, r0
	beq	.L1
	strd	r4, r0, [sp]
	mov	r3, r5
	movs	r2, #170
	ldr	r1, .L3
	ldr	r0, .L3+4
	bl	printk
.L1:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	check_hal_task_pkt_len, .-check_hal_task_pkt_len
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_check_frm_pkt, %function
mpp_enc_check_frm_pkt:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movs	r3, #0
	str	r3, [r0, #384]
	mov	r4, r0
	ldr	r3, [r0, #364]
	cbz	r3, .L6
.L10:
	ldr	r0, [r4, #360]
	cbnz	r0, .L7
.L8:
	mov	r0, #-1
	b	.L5
.L6:
	add	r0, r0, #364
	bl	mpp_packet_new
	cmp	r0, #0
	beq	.L10
.L5:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L7:
	bl	mpp_frame_get_pts
	mov	r6, r0
	ldr	r0, [r4, #360]
	mov	r7, r1
	bl	mpp_frame_get_dts
	mov	r8, r0
	ldr	r0, [r4, #360]
	mov	r9, r1
	bl	mpp_frame_get_buffer
	mov	r5, r0
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_ver_stride
	ldr	r3, [r4, #612]
	cmp	r3, r10
	bne	.L11
	ldr	r3, [r4, #616]
	cmp	r3, r0
	beq	.L12
.L11:
	mov	r1, #1272
	ldr	r0, .L18
	bl	printk
.L12:
	mov	r2, r6
	mov	r3, r7
	ldr	r0, [r4, #364]
	strd	r6, [r4, #376]
	str	r5, [r4, #384]
	bl	mpp_packet_set_pts
	ldr	r0, [r4, #364]
	mov	r2, r8
	mov	r3, r9
	bl	mpp_packet_set_dts
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_eos
	cbz	r0, .L13
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_eos
.L14:
	ldr	r3, [r4, #360]
	cmp	r3, #0
	beq	.L8
	ldr	r0, [r4, #384]
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L5
.L13:
	ldr	r0, [r4, #364]
	bl	mpp_packet_clr_eos
	b	.L14
.L19:
	.align	2
.L18:
	.word	.LC1
	.fnend
	.size	mpp_enc_check_frm_pkt, .-mpp_enc_check_frm_pkt
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_two_pass, %function
mpp_enc_proc_two_pass:
	.fnstart
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #140
	sub	sp, sp, #140
	ldr	r0, [r0, #452]
	mov	r7, r1
	bl	mpp_enc_refs_next_frm_is_intra
	mov	r5, r0
	cmp	r0, #0
	beq	.L20
	ldrd	r2, [r4, #208]
	add	r1, r4, #216
	add	r0, sp, #32
	add	r5, r4, #56
	strd	r2, [sp, #24]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r7, #68]
	ldr	r10, [r7, #48]
	ldrd	fp, r8, [r4, #4]
	mov	r0, r10
	str	r3, [sp, #12]
	ldr	r3, [r7, #64]
	str	r3, [sp, #20]
	bl	mpp_packet_get_length
	ldr	r3, .L70
	ldr	r3, [r3]
	lsls	r6, r3, #26
	str	r0, [sp, #16]
	bpl	.L22
	ldrh	r3, [r4, #214]
	movw	r2, #1446
	ldr	r1, .L70+4
	ldr	r0, .L70+8
	bl	printk
.L22:
	movs	r2, #104
	add	r1, r4, #488
	add	r0, r4, #216
	bl	memcpy
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L23
	ldrh	r3, [r4, #214]
	movw	r2, #1449
	ldr	r1, .L70+4
	ldr	r0, .L70+12
	bl	printk
.L23:
	mov	r1, r5
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_get_cpb_pass1
	ldr	r3, [r9]
	lsls	r5, r3, #15
	bpl	.L24
	ldrh	r3, [r4, #70]
	movw	r2, #1452
	ldr	r1, .L70+4
	ldr	r0, .L70+16
	bl	printk
.L24:
	add	r6, r7, #20
	mov	r0, fp
	mov	r1, r6
	bl	enc_impl_proc_dpb
	mov	r5, r0
	cbz	r0, .L25
	str	r0, [sp]
	movw	r3, #1453
	ldr	r0, .L70+20
	mov	r2, r4
	mov	r1, r3
.L69:
	bl	printk
.L21:
.L20:
	mov	r0, r5
	add	sp, sp, #140
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L25:
	ldr	r3, [r9]
	lsls	r0, r3, #26
	bpl	.L27
	ldrh	r3, [r4, #214]
	movw	r2, #1455
	ldr	r1, .L70+4
	ldr	r0, .L70+24
	bl	printk
.L27:
	mov	r1, r6
	mov	r0, fp
	bl	enc_impl_proc_hal
	mov	r5, r0
	cbz	r0, .L28
	mov	r3, #1456
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+28
	b	.L69
.L28:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L29
	ldrh	r3, [r4, #214]
	movw	r2, #1458
	ldr	r1, .L70+4
	ldr	r0, .L70+32
	bl	printk
.L29:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	mov	r5, r0
	cbz	r0, .L30
	movw	r3, #1459
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+36
	b	.L69
.L30:
	ldr	r3, [r9]
	lsls	r1, r3, #26
	bpl	.L31
	ldrh	r3, [r4, #214]
	movw	r2, #1461
	ldr	r1, .L70+4
	ldr	r0, .L70+40
	bl	printk
.L31:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r5, r0
	cbz	r0, .L32
	movw	r3, #1462
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+44
	b	.L69
.L32:
	ldr	r3, [r9]
	lsls	r2, r3, #26
	bpl	.L33
	ldrh	r3, [r4, #214]
	mov	r2, #1464
	ldr	r1, .L70+4
	ldr	r0, .L70+48
	bl	printk
.L33:
	movs	r2, #0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r5, r0
	cbz	r0, .L34
	movw	r3, #1466
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+52
	b	.L69
.L34:
	ldr	r3, .L70
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L35
	ldrh	r3, [r4, #214]
	movw	r2, #1468
	ldr	r1, .L70+4
	ldr	r0, .L70+56
	bl	printk
.L35:
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbz	r0, .L36
	movw	r3, #1469
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+60
	b	.L69
.L36:
	mov	r2, r0
	mov	r1, r6
	mov	r0, r8
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cbz	r0, .L37
	movw	r3, #1473
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L70+64
	b	.L69
.L37:
	ldr	r1, [sp, #16]
	mov	r0, r10
	bl	mpp_packet_set_length
	add	r0, r4, #216
	ldr	r3, [sp, #20]
	add	r1, sp, #32
	str	r3, [r7, #64]
	ldr	r3, [sp, #12]
	str	r3, [r7, #68]
	ldrd	r2, [sp, #24]
	strd	r2, [r4, #208]
	movs	r2, #104
	bl	memcpy
	ldr	r3, [r9]
	lsls	r3, r3, #26
	bpl	.L20
	ldrh	r3, [r4, #214]
	movw	r2, #1483
	ldr	r1, .L70+4
	ldr	r0, .L70+68
	bl	printk
	b	.L20
.L71:
	.align	2
.L70:
	.word	mpp_enc_debug
	.word	.LANCHOR0+23
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
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
	.word	.LC17
	.fnend
	.size	mpp_enc_proc_two_pass, .-mpp_enc_proc_two_pass
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	update_rc_cfg_log.constprop.1, %function
update_rc_cfg_log.constprop.1:
	.fnstart
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	.save {r1, r2, r3}
	push	{r0, r1, r2, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #12
	mov	r5, r0
	ldrd	r4, r6, [r0, #436]
	add	r3, sp, #32
	ldr	r0, [r0, #428]
	subs	r1, r6, r4
	ldr	r2, .L74
	add	r0, r0, r4
	str	r3, [sp, #4]
	bl	vsnprintf
	add	r4, r4, r0
	cmp	r6, r4
	bgt	.L73
	movw	r2, #1029
	ldr	r1, .L74+4
	ldr	r0, .L74+8
	bl	printk
.L73:
	str	r4, [r5, #436]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, lr}
	add	sp, sp, #12
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LC18
	.word	.LANCHOR0+45
	.word	.LC19
	.fnend
	.size	update_rc_cfg_log.constprop.1, .-update_rc_cfg_log.constprop.1
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_terminate_task, %function
mpp_enc_terminate_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	movs	r1, #0
	str	r1, [r0, #360]
	ldr	r0, [r0, #364]
	cbz	r0, .L77
	bl	mpp_packet_set_length
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #364]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #364
	bl	mpp_packet_deinit
.L77:
	ldrb	r2, [r4, #408]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #360]
	strd	r3, r3, [r4, #384]
	and	r2, r2, #1
	str	r2, [r4, #408]
	str	r3, [r5, #8]
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpp_enc_terminate_task, .-mpp_enc_terminate_task
	.global	__aeabi_idiv
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_comb_end_jpeg, %function
mpp_enc_comb_end_jpeg:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r5, [r0, #448]
	mov	r4, r0
	ldr	r6, [r0, #8]
	str	r1, [sp, #28]
	bl	get_mpidev_ops
	ldrd	r2, r3, [r5, #64]
	add	r1, r5, #20
	ldr	r8, .L137+36
	subs	r3, r3, r2
	movs	r2, #0
	str	r3, [r5, #68]
	mov	r9, r0
	mov	r0, r6
	bl	mpp_enc_hal_ret_task
	mov	r6, r0
	cbnz	r0, .L82
	add	r7, r4, #56
	ldr	r0, [r4, #48]
	mov	r1, r7
	bl	rc_hal_end
	mov	r6, r0
	cmp	r0, #0
	beq	.L83
	movw	r3, #1990
	str	r0, [sp]
.L136:
	ldr	r0, .L137
	mov	r2, r4
	mov	r1, r3
.L135:
	bl	printk
.L82:
	cmn	r6, #101
	bne	.L92
	movw	r3, #10924
	ldr	r0, [r4, r3]
	cbz	r0, .L92
	ldr	r3, [r4, #388]
	ldr	r1, [r3, #24]
	bl	ring_buf_update_min_size
.L92:
	ldr	r3, [r4, #44]
	movs	r1, #0
	ldr	r0, [r4, #364]
	adds	r3, r3, #1
	str	r3, [r4, #44]
	bl	mpp_packet_set_length
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #364]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #364
	bl	mpp_packet_deinit
.L93:
	ldr	r3, [r4, #364]
	ldr	r2, [sp, #28]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #364]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L95
	ldrd	r2, [r4, #376]
	ldr	r1, .L137+4
	ldr	r0, .L137+8
	strd	r2, [sp]
	movw	r2, #2041
	ldrh	r3, [r4, #214]
	bl	printk
.L95:
	ldr	r3, [r4, #360]
	cbz	r3, .L96
	add	r0, r4, #360
	bl	mpp_frame_deinit
.L96:
	ldrb	r2, [r4, #408]	@ zero_extendqisi2
	movs	r3, #0
	mov	r0, r6
	strd	r3, r3, [r4, #360]
	strd	r3, r3, [r4, #384]
	and	r2, r2, #1
	str	r2, [r4, #408]
	str	r3, [r5, #8]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L83:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L84
	ldrh	r3, [r4, #214]
	movw	r2, #1991
	ldr	r1, .L137+4
	ldr	r0, .L137+12
	bl	printk
.L84:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_hal_end
	mov	r6, r0
	cbz	r0, .L85
	str	r0, [sp]
	mov	r3, #1992
	b	.L136
.L85:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L86
	ldrh	r3, [r4, #214]
	movw	r2, #1993
	ldr	r1, .L137+4
	ldr	r0, .L137+16
	bl	printk
.L86:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_frm_end
	mov	r6, r0
	cbz	r0, .L87
	movw	r3, #1994
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L137+20
	b	.L135
.L87:
	ldr	r2, [r4, #356]
	movw	r3, #10960
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #40]
	adds	r3, r3, #1
	str	r3, [r4, #40]
	strd	r0, [r4, #24]
	cmp	r9, #0
	beq	.L88
	ldr	r3, [r9, #24]
	cbz	r3, .L88
	ldr	r0, [r5, #72]
	bl	mpp_frame_get_dts
	mov	r6, r0
	ldr	r0, [r5, #72]
	mov	r7, r1
	bl	mpp_frame_get_pts
	movs	r3, #1
	mov	r2, r6
	strd	r0, [sp]
	movw	r0, #10964
	str	r3, [sp, #8]
	mov	r3, r7
	ldr	r1, [r9, #24]
	ldr	r0, [r4, r0]
	blx	r1
.L88:
	ldr	r3, [r4, #12]
	cbz	r3, .L89
	ldrd	r2, [r4, #16]
	strd	r2, [sp, #16]
	orrs	r3, r2, r3
	beq	.L89
	ldrd	r6, [r4, #24]
	orrs	r3, r6, r7
	beq	.L89
	ldr	r3, [sp, #16]
	movs	r1, #0
	ldr	r0, .L137+24
	subs	r10, r6, r3
	ldr	r3, [sp, #20]
	sbc	fp, r7, r3
	cmp	r0, r10
	sbcs	r3, r1, fp
	bge	.L89
	ldr	r0, .L137+28
	mov	r2, r10
	ldr	r3, [r4, #40]
	asrs	r2, r2, #31
	smull	r0, r1, r10, r0
	movw	r0, #10000
	muls	r0, r3, r0
	rsb	r1, r2, r1, asr #6
	bl	__aeabi_idiv
	movw	r3, #5516
	str	r0, [r4, r3]
	movs	r3, #0
	strd	r6, [r4, #16]
	str	r3, [r4, #40]
.L89:
	ldrh	r3, [r4, #212]
	ldr	r0, [r4, #364]
	and	r3, r3, #251
	strh	r3, [r4, #212]	@ movhi
	ldr	r1, [r5, #68]
	bl	mpp_packet_set_length
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	lsls	r2, r3, #27
	bpl	.L91
	movs	r1, #16
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_flag
.L91:
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_eos
	cbz	r0, .L94
	movs	r1, #1
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_flag
.L94:
	ldrb	r1, [r4, #209]	@ zero_extendqisi2
	ldr	r0, [r4, #364]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #364]
	bl	mpp_packet_ring_buf_put_used
	mov	r6, r0
	cmp	r0, #0
	beq	.L93
	movw	r2, #2029
	ldr	r1, .L137+4
	ldr	r0, .L137+32
	movs	r6, #0
	bl	printk
	b	.L93
.L138:
	.align	2
.L137:
	.word	.LC20
	.word	.LANCHOR0+63
	.word	.LC24
	.word	.LC14
	.word	.LC21
	.word	.LC22
	.word	999999
	.word	274877907
	.word	.LC23
	.word	mpp_enc_debug
	.fnend
	.size	mpp_enc_comb_end_jpeg, .-mpp_enc_comb_end_jpeg
	.align	1
	.global	mpp_enc_proc_rc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_cfg, %function
mpp_enc_proc_rc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 216
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #236
	sub	sp, sp, #236
	mov	r5, r1
	cmp	r6, #0
	beq	.L182
	mov	r1, r0
	movs	r2, #200
	add	r0, sp, #32
	bl	memcpy
	ldrd	r8, r3, [r4, #112]
	lsls	r7, r6, #31
	ldrd	r9, r10, [r4, #128]
	ldr	fp, [r4, #140]
	str	r3, [sp, #16]
	ldr	r3, [r4, #120]
	str	r3, [sp, #20]
	ldr	r3, [r4, #124]
	str	r3, [sp, #24]
	ldr	r3, [r4, #136]
	str	r3, [sp, #28]
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #4]
	lsls	r0, r6, #30
	itt	mi
	ldrmi	r3, [r5, #8]
	strmi	r3, [r4, #8]
	lsls	r1, r6, #29
	bpl	.L143
	ldr	r3, [r5, #12]
	str	r3, [r4, #12]
	ldr	r3, [r5, #16]
	str	r3, [r4, #16]
	ldr	r3, [r5, #20]
	str	r3, [r4, #20]
.L143:
	lsls	r2, r6, #26
	bpl	.L144
	ldr	r3, [r5, #24]
	str	r3, [r4, #24]
	ldr	r3, [r5, #28]
	str	r3, [r4, #28]
	ldr	r3, [r5, #32]
	str	r3, [r4, #32]
.L144:
	lsls	r3, r6, #25
	bpl	.L145
	ldr	r3, [r5, #36]
	str	r3, [r4, #36]
	ldr	r3, [r5, #40]
	str	r3, [r4, #40]
	ldr	r3, [r5, #44]
	str	r3, [r4, #44]
.L145:
	lsls	r7, r6, #24
	itt	mi
	ldrmi	r3, [r5, #48]
	strmi	r3, [r4, #48]
	lsls	r0, r6, #22
	itt	mi
	ldrmi	r3, [r5, #56]
	strmi	r3, [r4, #56]
	lsls	r1, r6, #21
	bpl	.L148
	ldr	r3, [r5, #64]
	str	r3, [r4, #64]
	ldr	r3, [r5, #68]
	str	r3, [r4, #68]
	ldr	r3, [r5, #72]
	str	r3, [r4, #72]
.L148:
	ands	r7, r6, #16384
	beq	.L149
	ldr	r2, [r5, #88]
	cmp	r2, #1
	bls	.L184
	movs	r3, #2
	movw	r1, #353
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L259
	mvn	r7, #5
	bl	printk
.L150:
	ldr	r3, [r5, #88]
	str	r3, [r4, #88]
.L149:
	lsls	r2, r6, #16
	bpl	.L151
	ldr	r2, [r5, #76]
	cmp	r2, #2
	bls	.L152
	movs	r3, #3
	mov	r1, #364
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L259+4
	mvn	r7, #5
	bl	printk
.L152:
	ldr	r3, [r5, #76]
	str	r3, [r4, #76]
	ldr	r3, [r5, #80]
	str	r3, [r4, #80]
	ldr	r3, [r5, #84]
	str	r3, [r4, #84]
.L151:
	lsls	r3, r6, #7
	bpl	.L153
	ldr	r2, [r5, #92]
	str	r2, [r4, #92]
	ldr	r3, [r5, #96]
	str	r3, [r4, #96]
	cbz	r2, .L153
	cmp	r3, #35
	bls	.L153
	movs	r3, #35
	movs	r2, #0
	movw	r1, #377
	ldr	r0, .L259+8
	bl	printk
	mvn	r7, #5
.L153:
	lsls	r0, r6, #20
	itt	mi
	ldrmi	r3, [r5, #100]
	strmi	r3, [r4, #100]
	lsls	r1, r6, #19
	itt	mi
	ldrmi	r3, [r5, #104]
	strmi	r3, [r4, #104]
	lsls	r2, r6, #18
	itt	mi
	ldrmi	r3, [r5, #108]
	strmi	r3, [r4, #108]
	lsls	r3, r6, #15
	itt	mi
	ldrmi	r3, [r5, #112]
	strmi	r3, [r4, #112]
	lsls	r0, r6, #14
	itttt	mi
	ldrmi	r3, [r5, #124]
	strmi	r3, [r4, #124]
	ldrmi	r3, [r5, #116]
	strmi	r3, [r4, #116]
	lsls	r1, r6, #13
	itttt	mi
	ldrmi	r3, [r5, #128]
	strmi	r3, [r4, #128]
	ldrmi	r3, [r5, #120]
	strmi	r3, [r4, #120]
	lsls	r2, r6, #12
	itt	mi
	ldrmi	r3, [r5, #132]
	strmi	r3, [r4, #132]
	lsls	r3, r6, #11
	itt	mi
	ldrmi	r3, [r5, #136]
	strmi	r3, [r4, #136]
	lsls	r0, r6, #10
	itt	mi
	ldrmi	r3, [r5, #140]
	strmi	r3, [r4, #140]
	lsls	r1, r6, #4
	bpl	.L163
	ldr	r3, [r5, #144]
	str	r3, [r4, #144]
	ldr	r3, [r5, #148]
	str	r3, [r4, #148]
	ldr	r3, [r5, #152]
	str	r3, [r4, #152]
	ldr	r3, [r5, #156]
	str	r3, [r4, #156]
	ldr	r3, [r5, #160]
	str	r3, [r4, #160]
.L163:
	lsls	r2, r6, #6
	bpl	.L164
	ldr	r3, [r5, #164]
	add	r2, r4, #168
	add	r1, r5, #184
	str	r3, [r4, #164]
	add	r3, r5, #168
.L165:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L165
	add	r3, r5, #184
	add	r2, r4, #184
	add	r1, r5, #200
.L166:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L166
.L164:
	lsls	r3, r6, #5
	itt	mi
	ldrmi	r3, [r5, #60]
	strmi	r3, [r4, #60]
	ldr	r3, [r4, #4]
	cmp	r3, #4
	bls	.L168
	ldr	r2, [r5, #4]
	mov	r1, #436
	ldr	r0, .L259+12
	mvn	r7, #5
	bl	printk
.L168:
	ldr	r2, [r4, #8]
	cmp	r2, #6
	bls	.L169
	movw	r1, #441
	ldr	r0, .L259+16
	bl	printk
	mvn	r7, #5
.L169:
	ldr	r3, [r4, #4]
	cmp	r3, #2
	beq	.L170
	ldrd	r2, r0, [r4, #12]
	mvn	lr, #1024
	ldr	r1, .L259+20
	add	r5, r2, lr
	ldr	r3, [r4, #20]
	cmp	r5, r1
	bhi	.L171
	mvn	ip, #1024
	add	r5, r0, ip
	cmp	r5, r1
	bhi	.L171
	mvn	r5, #1024
	adds	r5, r3, r5
	cmp	r5, r1
	bls	.L170
.L171:
	str	r0, [sp]
	movw	r1, #453
	ldr	r0, .L259+24
	mvn	r7, #5
	bl	printk
.L170:
	ldrd	r0, r3, [r4, #124]
	ldr	r2, [r4, #112]
	cmp	r3, #0
	ldrd	r5, r3, [r4, #116]
	it	le
	strle	r0, [r4, #128]
	cmp	r3, #0
	ldr	r3, [r4, #128]
	it	le
	strle	r5, [r4, #120]
	cmp	r0, #0
	ldr	r1, [r4, #120]
	blt	.L174
	cmp	r5, #0
	blt	.L174
	cmp	r5, r0
	blt	.L174
	cmp	r3, #0
	blt	.L174
	cmp	r1, #0
	blt	.L174
	cmp	r1, r3
	blt	.L174
	cmp	r2, #0
	ble	.L175
	cmp	r1, r2
	blt	.L174
	cmp	r3, r2
	ble	.L175
.L174:
	strd	r0, r5, [sp, #4]
	str	r1, [sp]
	movw	r1, #469
	ldr	r0, .L259+28
	bl	printk
	str	r8, [r4, #112]
	str	r9, [r4, #128]
	mov	r2, r8
	movw	r1, #479
	ldr	r0, .L259+32
	ldr	r3, [sp, #20]
	str	r3, [r4, #120]
	ldr	r3, [sp, #24]
	str	r3, [r4, #124]
	ldr	r3, [sp, #16]
	str	r3, [r4, #116]
	str	r3, [sp, #8]
	ldr	r3, [sp, #24]
	str	r3, [sp, #4]
	ldr	r3, [sp, #20]
	str	r3, [sp]
	mov	r3, r9
	bl	printk
.L175:
	ldr	r2, [r4, #136]
	cmp	r2, #0
	bge	.L176
	ldr	r3, [sp, #28]
	movw	r1, #483
	ldr	r0, .L259+36
	bl	printk
	ldr	r3, [sp, #28]
	str	r3, [r4, #136]
.L176:
	ldr	r2, [r4, #140]
	cmp	r2, #0
	bge	.L177
	mov	r3, fp
	mov	r1, #488
	ldr	r0, .L259+40
	bl	printk
	str	fp, [r4, #140]
.L177:
	ldr	r2, [r4, #132]
	cmp	r2, #0
	bge	.L178
	mov	r3, r10
	movw	r1, #493
	ldr	r0, .L259+44
	bl	printk
	str	r10, [r4, #132]
.L178:
	ldr	r2, [r4, #60]
	cmp	r2, #60
	ble	.L179
	mov	r1, #498
	ldr	r0, .L259+48
	bl	printk
.L179:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r7, .L180
	mov	r2, #504
	ldr	r1, .L259+52
	ldr	r0, .L259+56
	bl	printk
	movs	r2, #200
	mov	r0, r4
	add	r1, sp, #32
	bl	memcpy
.L139:
	mov	r0, r7
	add	sp, sp, #236
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L184:
	movs	r7, #0
	b	.L150
.L180:
	ldr	r3, [r4, #48]
	movw	r1, #509
	ldr	r2, [r4, #12]
	ldr	r0, .L259+60
	str	r3, [sp, #12]
	ldr	r3, [r4, #40]
	str	r3, [sp, #8]
	ldr	r3, [r4, #28]
	str	r3, [sp, #4]
	ldr	r3, [r4, #16]
	str	r3, [sp]
	ldr	r3, [r4, #20]
	bl	printk
	b	.L139
.L182:
	mov	r7, r6
	b	.L139
.L260:
	.align	2
.L259:
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	104856574
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LANCHOR0+85
	.word	.LC37
	.word	.LC38
	.fnend
	.size	mpp_enc_proc_rc_cfg, .-mpp_enc_proc_rc_cfg
	.align	1
	.global	mpp_enc_proc_hw_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_hw_cfg, %function
mpp_enc_proc_hw_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 400
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #400
	sub	sp, sp, #400
	mov	r5, r1
	cmp	r6, #0
	beq	.L289
	mov	r1, r0
	mov	r2, #400
	mov	r0, sp
	bl	memcpy
	lsls	r3, r6, #31
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #4]
	lsls	r0, r6, #30
	itt	mi
	ldrmi	r3, [r5, #8]
	strmi	r3, [r4, #8]
	lsls	r1, r6, #25
	itt	mi
	ldrmi	r3, [r5, #12]
	strmi	r3, [r4, #12]
	lsls	r2, r6, #24
	itt	mi
	ldrmi	r3, [r5, #16]
	strmi	r3, [r4, #16]
	lsls	r3, r6, #23
	itt	mi
	ldrmi	r3, [r5, #20]
	strmi	r3, [r4, #20]
	lsls	r0, r6, #22
	itt	mi
	ldrmi	r3, [r5, #24]
	strmi	r3, [r4, #24]
	lsls	r1, r6, #21
	itt	mi
	ldrmi	r3, [r5, #28]
	strmi	r3, [r4, #28]
	lsls	r2, r6, #29
	bpl	.L270
	add	r3, r5, #32
	add	r2, r4, #32
	add	r1, r5, #96
.L271:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L271
.L270:
	lsls	r3, r6, #28
	bpl	.L272
	add	r3, r5, #96
	add	r2, r4, #96
	add	r1, r5, #160
.L273:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L273
.L272:
	lsls	r0, r6, #27
	bpl	.L274
	add	r3, r5, #160
	add	r2, r4, #160
	add	r1, r5, #224
.L275:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L275
.L274:
	lsls	r1, r6, #26
	bpl	.L276
	add	r3, r5, #224
	add	r2, r4, #224
	add	r1, r5, #288
.L277:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L277
.L276:
	lsls	r2, r6, #19
	bpl	.L278
	add	r3, r5, #360
	add	r2, r4, #360
	add	r1, r5, #400
.L279:
	ldr	r0, [r3], #4	@ unaligned
	cmp	r3, r1
	str	r0, [r2], #4	@ unaligned
	bne	.L279
.L278:
	lsls	r3, r6, #20
	bpl	.L280
	movs	r2, #72
	add	r1, r5, #288
	add	r0, r4, #288
	bl	memcpy
.L280:
	ldrd	r3, r2, [r4, #4]
	cmp	r3, #0
	blt	.L281
	cmp	r2, #0
	bge	.L290
.L281:
	movw	r1, #569
	ldr	r0, .L338
	bl	printk
	mvn	r5, #5
.L282:
	ldr	r2, [r4, #20]
	cmp	r2, #0
	bge	.L283
	movw	r1, #574
	ldr	r0, .L338+4
	bl	printk
	mvn	r5, #5
.L283:
	ldrd	r2, r3, [r4, #12]
	cmp	r2, #0
	blt	.L284
	cmp	r3, #0
	bge	.L285
.L284:
	mov	r1, #580
	ldr	r0, .L338+8
	bl	printk
	mvn	r5, #5
.L285:
	ldrd	r2, r3, [r4, #24]
	cmp	r2, #0
	blt	.L286
	cmp	r3, #0
	bge	.L287
.L286:
	movw	r1, #586
	ldr	r0, .L338+12
	bl	printk
	mvn	r5, #5
.L287:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r5, .L261
	movw	r2, #593
	ldr	r1, .L338+16
	ldr	r0, .L338+20
	bl	printk
	mov	r2, #400
	mov	r0, r4
	mov	r1, sp
	bl	memcpy
.L261:
	mov	r0, r5
	add	sp, sp, #400
	@ sp needed
	pop	{r4, r5, r6, pc}
.L290:
	movs	r5, #0
	b	.L282
.L289:
	mov	r5, r6
	b	.L261
.L339:
	.align	2
.L338:
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	.LANCHOR0+105
	.word	.LC43
	.fnend
	.size	mpp_enc_proc_hw_cfg, .-mpp_enc_proc_hw_cfg
	.align	1
	.global	mpp_enc_unref_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_unref_osd_buf, %function
mpp_enc_unref_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	cbz	r0, .L353
	ldr	r3, [r0]
	cbz	r3, .L353
	ldr	r7, .L357
	mov	r5, r0
	ldr	r8, .L357+4
	movs	r6, #0
.L343:
	ldr	r3, [r4, #4]
	cmp	r6, r3
	bcc	.L346
.L353:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L346:
	ldr	r0, [r5, #136]
	cbz	r0, .L344
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L344:
	ldr	r0, [r5, #88]
	cbz	r0, .L345
	mov	r2, r7
	mov	r1, r8
	bl	mpi_buf_unref_with_tag
.L345:
	adds	r6, r6, #1
	adds	r5, r5, #140
	b	.L343
.L358:
	.align	2
.L357:
	.word	.LANCHOR0+125
	.word	.LC44
	.fnend
	.size	mpp_enc_unref_osd_buf, .-mpp_enc_unref_osd_buf
	.align	1
	.global	mpp_enc_proc_export_osd_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_export_osd_buf, %function
mpp_enc_proc_export_osd_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #104
	sub	sp, sp, #104
	mov	r7, r0
	bl	get_mpibuf_ops
	movs	r2, #104
	movs	r1, #0
	mov	r5, r0
	mov	r0, sp
	bl	memset
	cbz	r5, .L360
	ldr	r3, [r5, #48]
	cbz	r3, .L360
	ldr	r9, .L374+8
	mov	r4, r7
	ldr	r10, .L374+12
	movs	r6, #0
.L361:
	ldr	r3, [r7, #4]
	cmp	r3, r6
	bhi	.L367
	movs	r0, #0
	b	.L359
.L360:
	movw	r2, #707
	ldr	r1, .L374
	ldr	r0, .L374+4
	bl	printk
	mov	r0, #-1
.L359:
	add	sp, sp, #104
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L367:
	ldr	r0, [r4, #132]
	cmp	r0, #0
	ble	.L363
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L364
	ldr	r3, [r5, #48]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #136]
	mov	r0, r8
	bl	dma_buf_put
.L363:
	ldr	r0, [r4, #84]
	cmp	r0, #0
	ble	.L365
	bl	dma_buf_get
	cmn	r0, #4096
	mov	r8, r0
	bhi	.L366
	ldr	r3, [r5, #48]
	mov	r2, #-1
	mov	r1, sp
	blx	r3
	str	r0, [r4, #88]
	mov	r0, r8
	bl	dma_buf_put
.L365:
	adds	r6, r6, #1
	adds	r4, r4, #140
	b	.L361
.L364:
	ldr	r2, [r4, #132]
	movw	r1, #722
	mov	r0, r9
	bl	printk
	b	.L363
.L366:
	ldr	r2, [r4, #84]
	movw	r1, #733
	mov	r0, r10
	bl	printk
	b	.L365
.L375:
	.align	2
.L374:
	.word	.LANCHOR0+147
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.fnend
	.size	mpp_enc_proc_export_osd_buf, .-mpp_enc_proc_export_osd_buf
	.align	1
	.global	mpp_enc_proc_tune_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_tune_cfg, %function
mpp_enc_proc_tune_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r6, [r1]
	.pad #84
	sub	sp, sp, #84
	mov	r7, r1
	cmp	r6, #0
	beq	.L405
	movs	r2, #72
	mov	r1, r0
	add	r0, sp, #8
	bl	memcpy
	lsls	r5, r6, #31
	itt	mi
	ldrmi	r3, [r7, #4]
	strmi	r3, [r4, #4]
	ldr	r2, [r4, #4]
	cmp	r2, #2
	bls	.L406
	movs	r3, #2
	movw	r1, #753
	str	r3, [sp]
	movs	r3, #0
	ldr	r0, .L455
	mvn	r5, #5
	bl	printk
.L379:
	lsls	r0, r6, #30
	itt	mi
	ldrmi	r3, [r7, #8]
	strmi	r3, [r4, #8]
	ldr	r3, [r4, #8]
	cmp	r3, #1
	bls	.L381
	movs	r3, #1
	movs	r2, #0
	movw	r1, #761
	ldr	r0, .L455+4
	bl	printk
	mvn	r5, #5
.L381:
	lsls	r1, r6, #29
	itt	mi
	ldrmi	r3, [r7, #12]
	strmi	r3, [r4, #12]
	ldr	r3, [r4, #12]
	cmp	r3, #7
	bls	.L383
	movw	r1, #769
	ldr	r0, .L455+8
	bl	printk
	mvn	r5, #5
.L383:
	lsls	r2, r6, #28
	itt	mi
	ldrmi	r3, [r7, #16]
	strmi	r3, [r4, #16]
	ldr	r3, [r4, #16]
	cmp	r3, #3
	bls	.L385
	movw	r1, #777
	ldr	r0, .L455+12
	bl	printk
	mvn	r5, #5
.L385:
	lsls	r3, r6, #27
	itt	mi
	ldrmi	r3, [r7, #20]
	strmi	r3, [r4, #20]
	ldr	r3, [r4, #20]
	cmp	r3, #3
	bls	.L387
	movw	r1, #785
	ldr	r0, .L455+16
	bl	printk
	mvn	r5, #5
.L387:
	lsls	r0, r6, #26
	itt	mi
	ldrmi	r3, [r7, #24]
	strmi	r3, [r4, #24]
	ldr	r3, [r4, #24]
	cmp	r3, #8
	bls	.L389
	movw	r1, #793
	ldr	r0, .L455+20
	bl	printk
	mvn	r5, #5
.L389:
	lsls	r1, r6, #25
	itt	mi
	ldrmi	r3, [r7, #28]
	strmi	r3, [r4, #28]
	ldr	r3, [r4, #28]
	cmp	r3, #8
	bls	.L391
	movw	r1, #801
	ldr	r0, .L455+24
	bl	printk
	mvn	r5, #5
.L391:
	lsls	r2, r6, #24
	itt	mi
	ldrmi	r3, [r7, #32]
	strmi	r3, [r4, #32]
	ldr	r3, [r4, #32]
	cmp	r3, #3
	bls	.L393
	movw	r1, #809
	ldr	r0, .L455+28
	bl	printk
	mvn	r5, #5
.L393:
	lsls	r3, r6, #23
	itt	mi
	ldrmi	r3, [r7, #36]
	strmi	r3, [r4, #36]
	ldr	r2, [r4, #36]
	cmp	r2, #3
	bls	.L395
	movw	r1, #817
	ldr	r0, .L455+32
	bl	printk
	mvn	r5, #5
.L395:
	lsls	r0, r6, #22
	itt	mi
	ldrmi	r3, [r7, #40]
	strmi	r3, [r4, #40]
	ldr	r2, [r4, #40]
	cmp	r2, #7
	bls	.L397
	movw	r1, #825
	ldr	r0, .L455+36
	bl	printk
	mvn	r5, #5
.L397:
	lsls	r1, r6, #21
	itt	mi
	ldrmi	r3, [r7, #44]
	strmi	r3, [r4, #44]
	ldr	r2, [r4, #44]
	cmp	r2, #63
	bls	.L399
	movw	r1, #833
	ldr	r0, .L455+40
	bl	printk
	mvn	r5, #5
.L399:
	lsls	r2, r6, #20
	itt	mi
	ldrmi	r3, [r7, #48]
	strmi	r3, [r4, #48]
	ldr	r2, [r4, #48]
	cbz	r2, .L401
	subs	r3, r2, #3
	cmp	r3, #5
	bls	.L401
	movw	r1, #841
	ldr	r0, .L455+44
	bl	printk
	mvn	r5, #5
.L401:
	lsls	r3, r6, #19
	itt	mi
	ldrmi	r3, [r7, #52]
	strmi	r3, [r4, #52]
	ldr	r2, [r4, #52]
	cbz	r2, .L403
	subs	r3, r2, #3
	cmp	r3, #5
	bls	.L403
	movw	r1, #849
	ldr	r0, .L455+48
	bl	printk
	mvn	r5, #5
.L403:
	ldr	r3, [r4]
	orrs	r6, r6, r3
	str	r6, [r4]
	cbz	r5, .L376
	mov	r2, #856
	ldr	r1, .L455+52
	ldr	r0, .L455+56
	bl	printk
	movs	r2, #72
	mov	r0, r4
	add	r1, sp, #8
	bl	memcpy
.L376:
	mov	r0, r5
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L406:
	movs	r5, #0
	b	.L379
.L405:
	mov	r5, r6
	b	.L376
.L456:
	.align	2
.L455:
	.word	.LC48
	.word	.LC49
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LANCHOR0+175
	.word	.LC61
	.fnend
	.size	mpp_enc_proc_tune_cfg, .-mpp_enc_proc_tune_cfg
	.align	1
	.global	mpp_enc_proc_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_cfg, %function
mpp_enc_proc_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L583
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	cmp	r1, r3
	mov	r4, r0
	mov	r7, r1
	mov	r5, r2
	beq	.L458
	bhi	.L459
	subs	r3, r3, #6
	cmp	r1, r3
	beq	.L460
	bhi	.L461
	subs	r3, r3, #8
	cmp	r1, r3
	beq	.L462
	adds	r3, r3, #4
	cmp	r1, r3
	beq	.L463
.L464:
	mov	r2, r5
	mov	r1, r7
	b	.L577
.L461:
	ldr	r3, .L583+4
	cmp	r1, r3
	bcc	.L464
	ldrb	r3, [r0, #408]	@ zero_extendqisi2
	lsls	r6, r3, #31
	bmi	.L480
	ldr	r1, [r0, #396]
	ldr	r0, [r0, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #396]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #408]
	str	r0, [r4, #404]
.L480:
	ldr	r3, .L583+8
	cmp	r7, r3
	bne	.L481
	mov	r1, #932
	ldr	r0, .L583+12
	bl	printk
	movw	r1, #933
	ldr	r0, .L583+16
	bl	printk
	ldr	r3, [r4, #396]
	str	r3, [r5]
.L482:
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	orr	r3, r3, #2
	strb	r3, [r4, #408]
	b	.L574
.L459:
	ldr	r3, .L583+20
	cmp	r1, r3
	beq	.L466
	bhi	.L467
	ldr	r3, .L583+24
	cmp	r1, r3
	beq	.L468
	adds	r3, r3, #2
	cmp	r1, r3
	bne	.L464
	add	r0, r0, #4128
	movs	r2, #136
	mov	r1, r5
	adds	r0, r0, #20
	bl	memcpy
	b	.L574
.L467:
	ldr	r3, .L583+28
	cmp	r1, r3
	beq	.L470
	adds	r3, r3, #253
	cmp	r1, r3
	beq	.L471
	subw	r3, r3, #767
	cmp	r1, r3
	bne	.L464
	movs	r3, #0
	str	r3, [sp]
	movw	r3, #5436
	ldr	r3, [r0, r3]
	str	r3, [sp, #4]
	ldr	r3, [r2]
	cbz	r3, .L488
	mov	r0, sp
	bl	mpp_enc_ref_cfg_init
.L488:
	ldr	r3, [sp, #4]
	cbnz	r3, .L489
	add	r0, sp, #4
	bl	mpp_enc_ref_cfg_init
	movw	r3, #5436
	ldr	r2, [sp, #4]
	str	r2, [r4, r3]
.L489:
	ldr	r1, [r5]
	cmp	r1, #5
	bhi	.L490
	tbh	[pc, r1, lsl #1]
.L492:
	.2byte	(.L495-.L492)/2
	.2byte	(.L494-.L492)/2
	.2byte	(.L494-.L492)/2
	.2byte	(.L494-.L492)/2
	.2byte	(.L493-.L492)/2
	.2byte	(.L491-.L492)/2
	.p2align 1
.L462:
	ldr	r6, [r2]
	movw	r1, #875
	ldr	r0, .L583+32
	bl	printk
	cbz	r6, .L473
	lsls	r3, r6, #31
	itt	mi
	ldrmi	r3, [r5, #4]
	strmi	r3, [r4, #596]
	movs	r3, #0
	str	r3, [r5]
.L473:
	ldr	r3, [r5, #104]
	cbz	r3, .L475
	add	r1, r5, #104
	add	r0, r4, #696
	bl	mpp_enc_proc_rc_cfg
	movs	r3, #0
	str	r3, [r5, #104]
.L475:
	ldr	r3, [r5, #304]
	cbz	r3, .L476
	add	r1, r5, #304
	add	r0, r4, #896
	bl	mpp_enc_proc_hw_cfg
	movs	r3, #0
	str	r3, [r5, #304]
.L476:
	movw	r6, #4848
	adds	r1, r5, r6
	ldr	r3, [r5, r6]
	cbz	r3, .L477
	add	r0, r4, #5440
	bl	mpp_enc_proc_tune_cfg
	movs	r3, #0
	str	r3, [r5, r6]
.L477:
	ldr	r1, .L583+36
	mov	r2, r5
.L577:
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_cfg
	b	.L576
.L463:
	cbnz	r2, .L479
.L574:
	movs	r6, #0
	b	.L478
.L479:
	mov	r1, r2
	add	r0, r0, #696
	bl	mpp_enc_proc_rc_cfg
.L576:
	mov	r6, r0
	b	.L478
.L460:
	ldr	r3, [r0, #460]
	adds	r3, r3, #1
	str	r3, [r0, #460]
	b	.L574
.L481:
	ldr	r1, [r4, #396]
	mov	r0, r5
	bl	mpp_packet_copy
	b	.L482
.L468:
	movw	r1, #943
	ldr	r0, .L583+40
	bl	printk
	b	.L574
.L466:
	cbz	r2, .L483
	ldr	r3, [r2]
	cmp	r3, #1
	bhi	.L484
	ldr	r2, .L583+44
	str	r3, [r0, #412]
	ldr	r2, [r2]
	lsls	r0, r2, #30
	bpl	.L574
	ldr	r1, .L583+48
	movw	r2, #951
	ldr	r0, .L583+52
.L580:
	bl	printk
	b	.L574
.L484:
	ldr	r1, .L583+48
	movw	r2, #953
	ldr	r0, .L583+56
.L578:
	bl	printk
.L575:
	mov	r6, #-1
.L478:
	ldr	r3, [r4, #1296]
	sub	r2, r3, #8
	cmp	r2, #1
	bls	.L506
	ldr	r2, .L583+60
	bic	r1, r7, #4
	cmp	r1, r2
	beq	.L522
	adds	r2, r2, #6
	cmp	r7, r2
	beq	.L522
	subs	r2, r2, #4
	cmp	r7, r2
	bne	.L508
	ldr	r3, [r5]
	tst	r3, #225
	beq	.L509
	movs	r3, #2
	b	.L507
.L483:
	movw	r2, #957
.L581:
	ldr	r1, .L583+48
	ldr	r0, .L583+64
.L579:
	bl	printk
	b	.L575
.L458:
	cbz	r2, .L486
	ldr	r3, [r2]
	cmp	r3, #2
	bhi	.L487
	ldr	r2, .L583+44
	str	r3, [r0, #416]
	ldr	r2, [r2]
	lsls	r1, r2, #30
	bpl	.L574
	movw	r2, #967
	ldr	r1, .L583+48
	ldr	r0, .L583+68
	b	.L580
.L487:
	movw	r2, #969
	ldr	r1, .L583+48
	ldr	r0, .L583+72
	b	.L578
.L486:
	movw	r2, #973
	b	.L581
.L495:
	bl	mpp_enc_ref_default
	str	r0, [sp]
.L496:
	ldr	r1, [sp]
	cmp	r1, #0
	beq	.L519
	ldr	r0, [sp, #4]
	bl	mpp_enc_ref_cfg_copy
	mov	r3, r0
	cbz	r0, .L498
	mov	r2, #664
	ldr	r1, .L583+76
	ldr	r0, .L583+80
	bl	printk
.L498:
	ldr	r1, [sp, #4]
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_set_cfg
	mov	r6, r0
	cbz	r0, .L499
	mov	r3, r0
	mov	r2, #668
	ldr	r1, .L583+76
	ldr	r0, .L583+84
	bl	printk
.L499:
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_update_hdr
	cbz	r0, .L500
	movs	r3, #0
	str	r3, [r4, #408]
.L500:
	ldr	r3, [r5]
	cbz	r3, .L497
	ldr	r3, [sp]
	cbz	r3, .L497
	mov	r0, sp
	bl	mpp_enc_ref_cfg_deinit
.L497:
	add	r3, r4, #5408
	add	r1, r5, #24
	adds	r3, r3, #4
	mov	r2, r5
.L501:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [r3], #4	@ unaligned
	bne	.L501
	b	.L478
.L584:
	.align	2
.L583:
	.word	3276815
	.word	3276813
	.word	3276814
	.word	.LC63
	.word	.LC64
	.word	3309569
	.word	3276817
	.word	3310595
	.word	.LC62
	.word	3276801
	.word	.LC65
	.word	mpp_enc_debug
	.word	.LANCHOR0+197
	.word	.LC66
	.word	.LC67
	.word	3276803
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LANCHOR0+214
	.word	.LC72
	.word	.LC73
.L494:
	ldr	r0, [sp]
	bl	mpi_enc_gen_ref_cfg
	b	.L496
.L493:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_smart_gop_ref_cfg
	b	.L496
.L491:
	mov	r1, r5
	ldr	r0, [sp]
	bl	mpi_enc_gen_hir_skip_ref
	b	.L496
.L490:
	movw	r1, #658
	ldr	r0, .L585
	bl	printk
	b	.L496
.L519:
	mov	r6, r1
	b	.L497
.L470:
	add	r6, r0, #4256
	adds	r6, r6, #28
	mov	r0, r6
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r5
	mov	r0, r6
	bl	memcpy
	mov	r0, r6
	bl	mpp_enc_proc_export_osd_buf
	b	.L574
.L471:
	movw	r3, #6822
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	cbnz	r3, .L502
	movw	r1, #607
	ldr	r0, .L585+4
	bl	printk
	b	.L575
.L502:
	ldr	r6, [r2]
	movw	r3, #6821
	ldrb	r8, [r0, r3]	@ zero_extendqisi2
	cmp	r6, #1024
	and	r8, r8, #3
	bls	.L503
	mov	r2, r6
	movw	r1, #614
	ldr	r0, .L585+8
	b	.L579
.L503:
	mov	r3, sp
	bic	r3, r3, #8160
	add	r9, r0, r8, lsl #10
	bic	r3, r3, #31
	add	r9, r9, #6816
	ldr	r1, [r2, #4]
	ldr	r3, [r3, #8]
	add	r9, r9, #11
	.syntax unified
@ 157 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r2, r1, r6; sbcscc r2, r2, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r2, r6
	cbnz	r3, .L504
	mov	r0, r9
	bl	arm_copy_from_user
	mov	r2, r0
.L504:
	cmp	r2, #0
	beq	.L505
	subs	r0, r6, r2
	movs	r1, #0
	add	r0, r0, r9
	mvn	r6, #13
	bl	memset
	b	.L478
.L508:
	ldr	r2, .L585+12
	cmp	r7, r2
	bne	.L510
	ldr	r2, [r4, #600]
	cbnz	r2, .L524
	ldr	r2, [r4, #696]
	tst	r2, #225
	bne	.L525
	cmp	r3, #7
	beq	.L512
	ldr	r2, .L585+16
	cmp	r3, r2
	beq	.L512
.L506:
	ldr	r3, .L585+20
	cmp	r7, r3
	bne	.L514
.L509:
	movs	r3, #1
	bic	r7, r7, #4
	str	r3, [r4, #444]
	add	r3, r3, #3276800
	cmp	r7, r3
	beq	.L515
.L457:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L512:
	ldr	r3, [r4, #1300]
	cbz	r3, .L513
	movs	r3, #5
	b	.L507
.L522:
	movs	r3, #1
.L507:
	ldr	r2, .L585+24
	movw	r1, #257
	ldr	r0, .L585+28
	add	r3, r2, r3, lsl #2
	ldr	r2, [r3, #236]
	bl	printk
	ldr	r3, [r4, #456]
	orr	r3, r3, #1
	str	r3, [r4, #456]
	movs	r3, #0
	str	r3, [r4, #408]
	b	.L506
.L524:
	movs	r3, #3
	b	.L507
.L525:
	movs	r3, #4
	b	.L507
.L514:
	ldr	r3, .L585+32
	cmp	r7, r3
	beq	.L509
.L510:
	ldr	r3, .L585+36
	cmp	r7, r3
	beq	.L509
	sub	r3, r3, #33280
	cmp	r7, r3
	bne	.L457
	ldr	r3, [r4, #600]
	tst	r3, #5
	bne	.L509
.L513:
	ldr	r3, [r4, #696]
	bics	r3, r3, #2
	bne	.L509
	add	r3, r4, #5440
	ldr	r3, [r3]
	lsls	r2, r3, #29
	beq	.L457
	b	.L509
.L515:
	ldr	r3, [r4, #696]
	lsls	r3, r3, #24
	bpl	.L457
	ldr	r1, [r4, #744]
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_set_rc_igop
	b	.L457
.L505:
	ldr	r0, [r5]
	add	r1, r4, r8
	movw	r3, #6823
	add	r8, r8, #1
	strb	r0, [r1, r3]
	movw	r3, #6821
	movw	r1, #6822
	strb	r8, [r4, r3]
	ldrb	r3, [r4, r1]	@ zero_extendqisi2
	subs	r3, r3, #1
	strb	r3, [r4, r1]
	b	.L574
.L586:
	.align	2
.L585:
	.word	.LC71
	.word	.LC74
	.word	.LC75
	.word	3276801
	.word	16777220
	.word	3276805
	.word	.LANCHOR0
	.word	.LC76
	.word	3276803
	.word	3310081
	.fnend
	.size	mpp_enc_proc_cfg, .-mpp_enc_proc_cfg
	.align	1
	.global	mpp_enc_proc_rc_update
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_proc_rc_update, %function
mpp_enc_proc_rc_update:
	.fnstart
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r5, [r0, #444]
	.pad #332
	sub	sp, sp, #332
	cmp	r5, #0
	beq	.L587
	ldr	r6, .L648
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L589
	movw	r2, #1207
	ldr	r1, .L648+4
	ldr	r0, .L648+8
	bl	printk
.L589:
	mov	r2, #284
	movs	r1, #0
	add	r0, sp, #44
	bl	memset
	ldrd	r9, r8, [r4, #724]
	movw	r3, #5436
	ldr	r7, [r4, r3]
	cmp	r8, #0
	beq	.L621
	mov	r1, r8
	mov	r0, r9
	bl	__aeabi_idiv
	mov	r1, r0
	cbz	r0, .L622
.L590:
	ldr	r0, [r4, #744]
	bl	__aeabi_idiv
	lsls	r5, r0, #2
	cmp	r5, #8
	it	ge
	movge	r5, #8
.L591:
	ldr	r3, [r4, #604]
	str	r3, [sp, #44]
	ldr	r3, [r4, #608]
	str	r3, [sp, #48]
	ldr	r3, [r4, #700]
	cmp	r3, #4
	bhi	.L592
	tbh	[pc, r3, lsl #1]
.L594:
	.2byte	(.L597-.L594)/2
	.2byte	(.L596-.L594)/2
	.2byte	(.L595-.L594)/2
	.2byte	(.L592-.L594)/2
	.2byte	(.L593-.L594)/2
	.p2align 1
.L621:
	movs	r1, #1
	b	.L590
.L622:
	movs	r5, #8
	b	.L591
.L649:
	.align	2
.L648:
	.word	mpp_enc_debug
	.word	.LANCHOR0+260
	.word	.LC79
.L596:
	movs	r3, #1
.L645:
	str	r3, [sp, #52]
.L597:
	ldr	r3, [r4, #720]
	add	ip, sp, #276
	ldr	lr, [r4, #736]
	str	r8, [sp, #64]
	strd	r3, r9, [sp, #56]
	add	r9, r4, #896
	ldr	r3, [r4, #732]
	str	lr, [sp, #72]
	str	r3, [sp, #68]
	ldr	r3, [r4, #740]
	str	r3, [sp, #76]
	ldr	r3, [r4, #744]
	str	r3, [sp, #84]
	ldr	r3, [r4, #796]
	str	r3, [sp, #108]
	ldr	r3, [r4, #800]
	str	r3, [sp, #112]
	ldr	r3, [r4, #804]
	str	r3, [sp, #116]
	ldr	r3, [r4, #844]
	str	r3, [sp, #164]
	ldr	r3, [r4, #840]
	str	r3, [sp, #168]
	ldr	r3, [r4, #852]
	str	r3, [sp, #172]
	ldr	r3, [r4, #848]
	str	r3, [sp, #176]
	ldr	r3, [r4, #856]
	str	r3, [sp, #180]
	ldr	r3, [r4, #708]
	str	r3, [sp, #96]
	ldr	r3, [r4, #712]
	str	r3, [sp, #100]
	ldr	r3, [r4, #716]
	str	r3, [sp, #92]
	movw	r3, #5444
	ldr	r3, [r4, r3]
	str	r3, [sp, #296]
	movw	r3, #5448
	ldr	r3, [r4, r3]
	str	r3, [sp, #300]
	movw	r3, #5452
	ldr	r3, [r4, r3]
	str	r3, [sp, #304]
	movw	r3, #5456
	ldr	r3, [r4, r3]
	str	r3, [sp, #308]
	movw	r3, #5460
	ldr	r3, [r4, r3]
	str	r3, [sp, #312]
	movw	r3, #5464
	ldr	r3, [r4, r3]
	str	r3, [sp, #316]
	movw	r3, #5468
	ldr	r3, [r4, r3]
	str	r3, [sp, #320]
	add	r3, r4, #5472
	ldr	r3, [r3]
	str	r3, [sp, #324]
	ldr	r3, [r4, #860]
	str	r3, [sp, #256]
	add	r3, r4, #880
	mov	r8, r3
.L598:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r9
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L598
	add	r3, r4, #864
	add	ip, sp, #260
.L599:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r8
	mov	r2, ip
	stmia	r2!, {r0, r1}
	mov	ip, r2
	bne	.L599
	cmp	lr, #0
	bne	.L600
	movw	r1, #1126
	ldr	r3, .L650
	str	r1, [sp]
	ldr	r2, .L650+4
	ldr	r0, .L650+8
	bl	printk
.L600:
	ldr	r3, [r4, #756]
	cbz	r3, .L646
	cmp	r3, #60
	it	ge
	movge	r3, #60
	mov	r5, r3
.L646:
	cmp	r5, #1
	ldr	r3, [r4, #1296]
	it	lt
	movlt	r5, #1
	cmp	r3, #8
	str	r5, [sp, #104]
	beq	.L602
	bhi	.L603
	cmp	r3, #7
.L647:
	bne	.L605
.L604:
	ldr	r3, [r4, #808]
	ldr	r1, [r4, #812]
	ldr	r2, [r4, #820]
	str	r3, [sp, #136]
	ldr	r3, [r4, #816]
	str	r1, [sp, #140]
	cmp	r3, #0
	it	eq
	moveq	r3, r1
	str	r3, [sp, #148]
	ldr	r3, [r4, #824]
	str	r2, [sp, #144]
	cmp	r3, #0
	it	eq
	moveq	r3, r2
	str	r3, [sp, #152]
	ldr	r3, [r4, #832]
	str	r3, [sp, #156]
	ldr	r3, [r4, #836]
	str	r3, [sp, #160]
.L608:
	movs	r3, #0
	mov	r2, #256
	strd	r3, r3, [sp, #128]
	strd	r2, r3, [sp, #120]
	ldr	r3, [r4, #752]
	str	r3, [sp, #200]
	ldr	r3, [r4, #760]
	str	r3, [sp, #220]
	ldr	r3, [r4, #764]
	str	r3, [sp, #224]
	ldr	r3, [r4, #768]
	str	r3, [sp, #228]
	ldr	r3, [r4, #784]
	str	r3, [sp, #244]
	ldr	r3, [r4, #772]
	str	r3, [sp, #232]
	ldr	r3, [r4, #776]
	str	r3, [sp, #236]
	ldr	r3, [r4, #780]
	str	r3, [sp, #240]
	ldr	r3, [r4, #788]
	str	r3, [sp, #248]
	ldr	r3, [r4, #792]
	str	r3, [sp, #252]
	ldr	r3, [r7, #64]
	cbz	r3, .L610
	ldr	r2, [sp, #84]
	str	r3, [sp, #88]
	cmp	r3, r2
	bge	.L610
	movs	r3, #1
	str	r3, [sp, #80]
	ldr	r3, [sp, #160]
	cbnz	r3, .L610
	movs	r3, #2
	str	r3, [sp, #160]
.L610:
	ldr	r3, [r4, #1296]
	ldr	r7, .L650+12
	cmp	r3, #7
	beq	.L612
	ldr	r2, .L650+16
	cmp	r3, r2
	bne	.L613
.L612:
	ldr	r2, .L650+20
	ldr	r3, .L650+24
	ldr	r0, [sp, #68]
	ldr	r1, [sp, #56]
	cmp	r1, #0
	ite	ne
	movne	r1, r3
	moveq	r1, r2
	cmp	r0, #0
	it	eq
	moveq	r3, r2
	ldr	r0, [sp, #88]
	ldr	r2, [sp, #52]
	str	r0, [sp, #36]
	ldr	r0, [sp, #84]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r0, [sp, #32]
	ldr	r0, [sp, #76]
	str	r0, [sp, #28]
	ldr	r0, [sp, #72]
	strd	r3, r0, [sp, #20]
	ldr	r3, [sp, #64]
	ldr	r0, .L650+28
	str	r3, [sp, #16]
	ldr	r3, [sp, #60]
	strd	r1, r3, [sp, #8]
	mov	r1, #1192
	ldr	r3, [r4, #712]
	str	r3, [sp, #4]
	ldr	r3, [r4, #708]
	str	r3, [sp]
	ldr	r3, [r4, #716]
	bl	printk
.L613:
	movw	r3, #5532
	ldr	r3, [r4, r3]
	cbnz	r3, .L616
	add	r3, r4, #5536
	ldr	r3, [r3]
	cbz	r3, .L617
.L616:
	movs	r3, #1
	str	r3, [sp, #292]
.L617:
	add	r1, sp, #44
	ldr	r0, [r4, #48]
	bl	rc_update_usr_cfg
	movs	r3, #0
	str	r3, [r4, #696]
	str	r3, [r4, #600]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	mov	r5, r0
	bpl	.L618
	movw	r2, #1219
	ldr	r1, .L650+32
	ldr	r0, .L650+36
	bl	printk
.L618:
	movs	r3, #0
	str	r3, [r4, #444]
	ldr	r3, [r4, #432]
	mov	r0, r4
	ldr	r2, [sp, #80]
	ldr	r1, .L650+40
	str	r3, [r4, #436]
	movw	r3, #5512
	str	r2, [r4, r3]
	ldr	r3, [sp, #156]
	ldr	r2, [sp, #52]
	str	r3, [sp, #32]
	ldr	r3, [sp, #148]
	add	r2, r7, r2, lsl #2
	ldr	r2, [r2, #308]
	str	r3, [sp, #28]
	ldr	r3, [sp, #152]
	str	r3, [sp, #24]
	ldr	r3, [sp, #140]
	str	r3, [sp, #20]
	ldr	r3, [sp, #144]
	str	r3, [sp, #16]
	ldr	r3, [sp, #136]
	str	r3, [sp, #12]
	ldr	r3, [sp, #84]
	str	r3, [sp, #8]
	ldr	r3, [sp, #100]
	str	r3, [sp, #4]
	ldr	r3, [sp, #92]
	str	r3, [sp]
	ldr	r3, [sp, #96]
	bl	update_rc_cfg_log.constprop.1
.L587:
	mov	r0, r5
	add	sp, sp, #332
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L592:
	movs	r3, #3
	b	.L645
.L595:
	movs	r3, #2
	b	.L645
.L593:
	movs	r3, #4
	b	.L645
.L603:
	cmp	r3, #9
	beq	.L604
	ldr	r2, .L650+16
	cmp	r3, r2
	b	.L647
.L602:
	ldr	r3, [r4, #1308]
	ldr	r2, [r4, #1312]
	str	r3, [sp, #136]
	ldr	r3, [r4, #1316]
	str	r2, [sp, #140]
	strd	r3, r2, [sp, #144]
	str	r3, [sp, #152]
	b	.L608
.L605:
	movw	r2, #1153
	ldr	r1, .L650+44
	ldr	r0, .L650+48
	bl	printk
	b	.L608
.L651:
	.align	2
.L650:
	.word	.LANCHOR0+283
	.word	.LC80
	.word	.LC81
	.word	.LANCHOR0
	.word	16777220
	.word	.LC78
	.word	.LC77
	.word	.LC83
	.word	.LANCHOR0+260
	.word	.LC84
	.word	.LC18
	.word	.LANCHOR0+294
	.word	.LC82
	.fnend
	.size	mpp_enc_proc_rc_update, .-mpp_enc_proc_rc_update
	.align	1
	.global	mpp_enc_alloc_output_from_bufpool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_bufpool, %function
mpp_enc_alloc_output_from_bufpool:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #56
	sub	sp, sp, #56
	mov	r5, r0
	bl	mpp_enc_check_frm_pkt
	mov	r6, r0
	cmp	r0, #0
	bne	.L652
	mov	r1, r0
	ldr	r0, [r5, #364]
	bl	mpp_packet_set_length
	ldr	r8, [r5, #388]
	ldr	r7, .L686
	cmp	r8, #0
	bne	.L654
	ldr	r4, [r5, #604]
	ldr	r8, [r5, #364]
	adds	r4, r4, #15
	bic	r3, r4, #15
	ldr	r4, [r5, #608]
	adds	r4, r4, #15
	bic	r4, r4, #15
	muls	r4, r3, r4
	ldr	r3, [r5]
	cmp	r3, #8
	mov	r3, #0
	str	r3, [sp, #20]
	itt	eq
	addeq	r4, r4, r4, lsl #1
	lsreq	r4, r4, #1
	bl	get_mpibuf_ops
	mov	r9, r0
	cbnz	r4, .L656
	movw	r1, #1306
	ldr	r3, .L686+4
	str	r1, [sp]
	ldr	r2, .L686+8
	ldr	r0, .L686+12
	bl	printk
.L656:
	cmp	r9, #0
	beq	.L658
	movw	r10, #5552
	ldr	r3, [r5, r10]
	cbnz	r3, .L659
	ldr	r3, [r9, #56]
	cbz	r3, .L659
	movs	r1, #2
	mov	r0, r4
	blx	r3
	str	r0, [r5, r10]
.L659:
	movw	r3, #5552
	ldr	r0, [r5, r3]
	cbz	r0, .L658
	ldr	r3, [r9, #64]
	cbz	r3, .L658
	blx	r3
	movs	r2, #32
	movs	r1, #0
	mov	r10, r0
	add	r0, sp, #24
	bl	memset
	cmp	r10, #0
	beq	.L658
	ldr	r3, .L686+4
	add	r2, sp, #20
	add	r1, sp, #24
	movs	r0, #0
	str	r10, [sp, #36]
	str	r3, [sp]
	ldr	r3, .L686+16
	str	r4, [sp, #28]
	bl	mpp_buffer_import_with_tag
	ldr	r3, [r9, #16]
	cbz	r3, .L658
	mov	r0, r10
	blx	r3
.L658:
	ldr	r0, [sp, #20]
	cbnz	r0, .L665
	ldr	r9, .L686+4
	mov	r2, r4
	ldr	r3, .L686+16
	add	r1, sp, #20
	str	r9, [sp]
	bl	mpp_buffer_get_with_tag
	ldr	r3, [sp, #20]
	cbnz	r3, .L665
	movw	r1, #1330
	mov	r3, r9
	str	r1, [sp]
	ldr	r2, .L686+20
	ldr	r0, .L686+12
	bl	printk
.L665:
	ldr	r0, [sp, #20]
	add	r3, r8, #72
	ldr	r1, .L686+4
	movs	r4, #0
	str	r3, [r5, #388]
	str	r0, [r8, #72]
	bl	mpp_buffer_get_mpi_buf_id_with_caller
	ldr	r1, .L686+4
	str	r4, [r8, #84]
	str	r0, [r8, #76]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r1, .L686+4
	str	r0, [r8, #96]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_ptr_with_caller
	ldr	r1, .L686+4
	strd	r0, r0, [r8, #24]
	ldr	r0, [sp, #20]
	bl	mpp_buffer_get_size_with_caller
	ldr	r2, [r7]
	lsls	r2, r2, #26
	ldr	r3, [sp, #20]
	strd	r0, r4, [r8, #32]
	str	r3, [r8, #68]
	bpl	.L652
	str	r3, [sp]
	mov	r2, #1344
	ldr	r3, [r5, #364]
	ldr	r1, .L686+24
	ldr	r0, .L686+28
	bl	printk
.L652:
	mov	r0, r6
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L654:
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L652
	ldr	r4, [r5, #364]
	mov	r0, r4
	bl	mpp_packet_get_pos
	mov	r7, r0
	ldr	r0, [r5, #364]
	bl	mpp_packet_get_length
	mov	r3, r4
	movw	r2, #1349
	ldr	r1, .L686+24
	strd	r7, r0, [sp, #4]
	str	r8, [sp]
	ldr	r0, .L686+32
	bl	printk
	b	.L652
.L687:
	.align	2
.L686:
	.word	mpp_enc_debug
	.word	.LANCHOR0+328
	.word	.LC85
	.word	.LC81
	.word	.LC44
	.word	.LC86
	.word	.LANCHOR0+362
	.word	.LC87
	.word	.LC88
	.fnend
	.size	mpp_enc_alloc_output_from_bufpool, .-mpp_enc_alloc_output_from_bufpool
	.align	1
	.global	mpp_enc_alloc_output_from_ringbuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_alloc_output_from_ringbuf, %function
mpp_enc_alloc_output_from_ringbuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	movs	r3, #0
	ldr	r5, [r0, #604]
	mov	r4, r0
	str	r3, [sp, #12]
	adds	r5, r5, #15
	bic	r3, r5, #15
	ldr	r5, [r0, #608]
	adds	r5, r5, #15
	bic	r5, r5, #15
	muls	r5, r3, r5
	ldr	r3, [r0]
	ldrd	r6, r0, [r0, #448]
	cmp	r3, #8
	it	ne
	lsrne	r5, r5, #1
	bl	mpp_enc_refs_next_frm_is_intra
	cmp	r0, #0
	bne	.L698
	ldr	r6, [r6, #4]
	cmp	r6, #1
	beq	.L690
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_next_frm_is_kpfrm
	adds	r6, r0, #0
	it	ne
	movne	r6, #1
.L690:
	movw	r3, #10924
	ldr	r3, [r4, r3]
	cmp	r3, #0
	beq	.L691
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L691
	bl	get_vsm_ops
	cmp	r0, #0
	bne	.L691
	movw	r3, #10928
	ldr	r2, [r4, r3]
	cbnz	r2, .L692
	str	r5, [r4, r3]
.L692:
	ldr	r2, [r4, r3]
	cmp	r2, #16384
	it	cc
	movcc	r2, #16384
	addw	r2, r2, #4095
	bic	r2, r2, #4080
	bic	r2, r2, #15
	str	r2, [r4, r3]
	movw	r3, #10956
	ldr	r3, [r4, r3]
	ldr	r0, [r3, #12]
	cbz	r0, .L693
	str	r0, [sp, #12]
.L694:
	movw	r3, #10932
	ldr	r1, [sp, #12]
	ldr	r2, [r4, r3]
	movw	r3, #10924
	ldr	r0, [r4, r3]
	bl	ring_buf_init
	cbz	r0, .L691
	movw	r3, #10928
	movw	r2, #1394
	ldr	r3, [r4, r3]
	ldr	r1, .L711
	ldr	r0, .L711+4
	bl	printk
	b	.L710
.L698:
	movs	r6, #1
	b	.L690
.L693:
	ldr	r3, .L711+8
	add	r1, sp, #12
	str	r3, [sp]
	ldr	r3, .L711+12
	bl	mpp_ring_buffer_get_with_tag
	ldr	r3, [sp, #12]
	cmp	r3, #0
	bne	.L694
	movw	r1, #1388
	ldr	r0, .L711+16
	bl	printk
.L710:
	mov	r0, #-1
.L688:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L691:
	movw	r3, #10964
	movw	r1, #10924
	ldr	r3, [r4, r3]
	movs	r2, #128
	ldr	r1, [r4, r1]
	add	r0, r4, #364
	strd	r6, r3, [sp]
	movs	r3, #0
	bl	mpp_packet_new_ring_buf
	cbz	r0, .L696
	adds	r3, r0, #3
	ite	eq
	movweq	r2, #10936
	movwne	r2, #10940
	ldr	r3, [r4, r2]
	adds	r3, r3, #1
	str	r3, [r4, r2]
	b	.L688
.L696:
	ldr	r3, [r4, #364]
	mov	r0, r4
	adds	r3, r3, #72
	str	r3, [r4, #388]
	bl	mpp_enc_check_frm_pkt
	b	.L688
.L712:
	.align	2
.L711:
	.word	.LANCHOR0+430
	.word	.LC90
	.word	.LANCHOR0+396
	.word	.LC44
	.word	.LC89
	.fnend
	.size	mpp_enc_alloc_output_from_ringbuf, .-mpp_enc_alloc_output_from_ringbuf
	.align	1
	.global	mpp_enc_impl_alloc_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_alloc_task, %function
mpp_enc_impl_alloc_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r1, #108
	mov	r4, r0
	ldr	r0, .L716
	bl	mpp_osal_calloc
	str	r0, [r4, #448]
	cbz	r0, .L715
	bl	mpp_time
	strd	r0, [r4, #32]
	bl	mpp_time
	strd	r0, [r4, #16]
	bl	mpp_time
	strd	r0, [r4, #24]
	movs	r0, #0
.L713:
	pop	{r4, pc}
.L715:
	mov	r0, #-1
	b	.L713
.L717:
	.align	2
.L716:
	.word	.LANCHOR0+464
	.fnend
	.size	mpp_enc_impl_alloc_task, .-mpp_enc_impl_alloc_task
	.align	1
	.global	mpp_enc_impl_free_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_free_task, %function
mpp_enc_impl_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r1, [r0, #448]
	cbz	r1, .L719
	ldr	r0, .L723
	bl	mpp_osal_free
	movs	r3, #0
	str	r3, [r4, #448]
.L719:
	movs	r0, #0
	pop	{r4, pc}
.L724:
	.align	2
.L723:
	.word	.LANCHOR0+488
	.fnend
	.size	mpp_enc_impl_free_task, .-mpp_enc_impl_free_task
	.align	1
	.global	mpp_enc_impl_get_roi_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_get_roi_osd, %function
mpp_enc_impl_get_roi_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movw	r5, #4148
	ldr	r3, [r0, r5]
	mov	r6, r1
	mov	r4, r0
	adds	r1, r0, r5
	cbz	r3, .L726
	add	r0, r0, #5536
	movs	r2, #136
	adds	r0, r0, #20
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, r5]
.L726:
	movw	r7, #4284
	add	r8, r4, r7
	ldr	r3, [r4, r7]
	cbz	r3, .L727
	add	r5, r4, #5664
	adds	r5, r5, #28
	mov	r0, r5
	bl	mpp_enc_unref_osd_buf
	mov	r2, #1128
	mov	r1, r8
	mov	r0, r5
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, r7]
.L727:
	cbz	r6, .L729
	movw	r3, #5556
	adds	r1, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L730
	mov	r0, r6
	bl	mpp_frame_add_roi
.L730:
	movw	r3, #5692
	adds	r1, r4, r3
	ldr	r3, [r4, r3]
	cbz	r3, .L729
	mov	r0, r6
	bl	mpp_frame_add_osd
.L729:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	mpp_enc_impl_get_roi_osd, .-mpp_enc_impl_get_roi_osd
	.align	1
	.global	mpp_enc_impl_reg_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_reg_cfg, %function
mpp_enc_impl_reg_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r6, [r0, #448]
	.pad #60
	sub	sp, sp, #60
	mov	r8, r1
	add	r7, r0, #56
	add	r5, r6, #20
	ldrb	r3, [r6, #11]	@ zero_extendqisi2
	ands	r3, r3, #1
	beq	.L745
	ldr	r6, .L917
	ldr	r8, [r0, #8]
	ldr	r3, [r6]
	lsls	r0, r3, #31
	bpl	.L746
	movw	r2, #1661
	ldr	r1, .L917+4
	ldr	r0, .L917+8
	bl	printk
.L746:
	ldr	r3, [r4, #216]
	movs	r1, #0
	movs	r2, #104
	add	r0, r4, #216
	ldrd	fp, r10, [r4, #220]
	str	r3, [sp, #44]
	ldrd	r9, r3, [r4, #228]
	str	r3, [sp, #36]
	ldr	r3, [r4, #236]
	str	r3, [sp, #40]
	bl	memset
	strd	r10, r9, [r4, #224]
	ldr	r3, [sp, #44]
	strd	r3, fp, [r4, #216]
	ldr	r3, [sp, #36]
	str	r3, [r4, #232]
	ldr	r3, [sp, #40]
	str	r3, [r4, #236]
	ldr	r3, [r6]
	lsls	r1, r3, #26
	bpl	.L747
	ldrh	r3, [r4, #214]
	mov	r2, #1664
	ldr	r1, .L917+4
	ldr	r0, .L917+12
	bl	printk
.L747:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L748
	str	r0, [sp]
	movw	r3, #1665
	ldr	r0, .L917+16
	mov	r2, r4
	mov	r1, r3
.L916:
	bl	printk
	mov	r9, #0
	b	.L744
.L748:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L750
	ldrh	r3, [r4, #214]
	movw	r2, #1667
	ldr	r1, .L917+4
	ldr	r0, .L917+20
	bl	printk
.L750:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_get_task
	cbz	r0, .L751
	movw	r3, #1668
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L917+24
	bl	printk
.L744:
	mov	r0, r9
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L751:
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L752
	ldrh	r3, [r4, #214]
	movw	r2, #1670
	ldr	r1, .L917+4
	ldr	r0, .L917+28
	bl	printk
.L752:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_hal_start
	cbz	r0, .L753
	movw	r3, #1671
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L917+32
	b	.L916
.L753:
	ldr	r3, [r6]
	lsls	r7, r3, #26
	bpl	.L754
	ldrh	r3, [r4, #214]
	movw	r2, #1673
	ldr	r1, .L917+4
	ldr	r0, .L917+36
	bl	printk
.L754:
	mov	r1, r5
	mov	r0, r8
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L755
	movw	r3, #1674
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L917+40
	b	.L916
.L755:
	ldr	r3, [r6]
	lsls	r5, r3, #26
	bpl	.L756
	ldrb	r3, [r4, #213]	@ zero_extendqisi2
	movw	r2, #1677
	ldr	r1, .L917+4
	ldr	r0, .L917+44
	str	r3, [sp, #4]
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #214]
	bl	printk
.L756:
	ldr	r3, [r6]
	lsls	r4, r3, #31
	bpl	.L744
	movw	r2, #1678
	ldr	r1, .L917+4
	ldr	r0, .L917+48
	bl	printk
	b	.L744
.L745:
	strd	r1, r3, [r0, #360]
	cmp	r1, #0
	beq	.L809
	movw	r3, #4136
	ldr	r3, [r0, r3]
	cmp	r3, #0
	bne	.L758
	mov	r0, r1
	bl	mpp_frame_get_hor_stride
	mov	r10, r0
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_ver_stride
	mov	fp, r0
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_width
	mov	r9, r0
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_height
	ldr	r3, [r4, #648]
	ldrd	r1, ip, [r4, #612]
	bic	r3, r3, #2
	cmp	r3, #1
	ittt	eq
	moveq	r3, r9
	moveq	r9, r0
	moveq	r0, r3
	cmp	r10, r1
	ldrd	r3, r2, [r4, #604]
	bne	.L760
	cmp	fp, ip
	bne	.L760
	cmp	r3, r9
	bhi	.L760
	cmp	r2, r0
	bls	.L758
.L760:
	strd	r3, r2, [sp, #12]
	movw	r2, #10964
	strd	r1, ip, [sp, #20]
	mov	r3, r9
	str	r0, [sp]
	movw	r1, #1827
	strd	r10, fp, [sp, #4]
	ldr	r0, .L917+52
	ldr	r2, [r4, r2]
	bl	printk
.L809:
	mov	r9, #-1
.L757:
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_terminate_task
	b	.L744
.L758:
	mov	r0, r8
	bl	mpp_frame_get_idr_request
	cbz	r0, .L761
	ldr	r3, [r4, #456]
	orr	r3, r3, #1
	str	r3, [r4, #456]
	movs	r3, #0
	str	r3, [r4, #408]
.L761:
	movs	r2, #88
	movs	r1, #0
	mov	r0, r5
	add	r10, r4, #456
	bl	memset
	mov	r2, #304
	movs	r1, #0
	mov	r0, r7
	bl	memset
	ldr	r3, [r6, #4]
	adds	r2, r3, #1
	str	r2, [r6, #4]
	strh	r3, [r4, #214]	@ movhi
	strd	r7, r10, [r6, #24]
	ldr	r3, [r4, #360]
	str	r3, [r4, #352]
	ldr	r3, .L917
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #32
	beq	.L762
	ldrh	r3, [r4, #214]
	movw	r2, #1871
	ldr	r1, .L917+56
	ldr	r0, .L917+60
	bl	printk
.L762:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_frm_check_drop
	mov	r9, r0
	cbz	r0, .L763
	str	r0, [sp]
	mov	r3, #1872
	ldr	r0, .L917+64
	mov	r2, r4
	mov	r1, r3
.L914:
	bl	printk
	b	.L757
.L763:
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #16
	strb	r3, [r6, #8]
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L764
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	movw	r2, #1874
	ldr	r1, .L917+56
	and	r3, r3, #1
	ldr	r0, .L917+68
	str	r3, [sp]
	ldrh	r3, [r4, #214]
	bl	printk
.L764:
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	lsls	r1, r3, #31
	bpl	.L765
	movs	r3, #0
	str	r3, [r6, #20]
	str	r3, [r6, #68]
	b	.L809
.L918:
	.align	2
.L917:
	.word	mpp_enc_debug
	.word	.LANCHOR0+511
	.word	.LC91
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC92
	.word	.LC93
	.word	.LC10
	.word	.LC11
	.word	.LC94
	.word	.LC95
	.word	.LC96
	.word	.LANCHOR0+532
	.word	.LC97
	.word	.LC98
	.word	.LC99
.L765:
	ldr	r3, [r4, #456]
	cbz	r3, .L766
	mov	r1, r10
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_set_usr_cfg
.L766:
	movs	r3, #1
	mov	r0, r4
	str	r3, [r6, #20]
	bl	mpp_enc_alloc_output_from_ringbuf
	mov	r9, r0
	cmp	r0, #0
	bne	.L757
	ldr	r3, [r4, #360]
	str	r3, [r6, #72]
	ldr	r3, [r4, #384]
	str	r3, [r6, #76]
	ldr	r3, [r4, #364]
	str	r3, [r6, #48]
	ldr	r3, [r4, #388]
	str	r3, [r6, #52]
	movw	r3, #5532
	ldr	r3, [r4, r3]
	str	r3, [r6, #88]
	ldrb	r3, [r6, #8]	@ zero_extendqisi2
	orr	r3, r3, #32
	strb	r3, [r6, #8]
	ldr	r3, [r4, #388]
	str	r3, [r6, #52]
	movw	r3, #10964
	ldr	r3, [r4, r3]
	str	r3, [r6, #104]
	ldr	r3, [r4, #364]
	cbnz	r3, .L767
	movw	r1, #1902
	ldr	r3, .L919
	str	r1, [sp]
	ldr	r2, .L919+4
	ldr	r0, .L919+8
	bl	printk
.L767:
	ldr	r1, [r4, #360]
	mov	r0, r4
	bl	mpp_enc_impl_get_roi_osd
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bmi	.L768
	ldr	r1, [r4, #396]
	ldr	r0, [r4, #4]
	bl	enc_impl_gen_hdr
	ldr	r0, [r4, #396]
	bl	mpp_packet_get_length
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [r4, #408]
	ldr	r3, [r8]
	lsls	r3, r3, #26
	str	r0, [r4, #404]
	bpl	.L769
	str	r0, [sp]
	movw	r2, #1913
	ldrh	r3, [r4, #214]
	ldr	r1, .L919+12
	ldr	r0, .L919+16
	bl	printk
.L769:
	ldr	r1, [r4, #396]
	ldr	r0, [r4, #364]
	bl	mpp_packet_append
	ldr	r3, [r4, #404]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #404]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	orr	r3, r3, #8
	strb	r3, [r4, #408]
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L771
	mov	r2, #1920
	ldr	r1, .L919+12
	ldr	r0, .L919+20
	bl	printk
.L768:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L771
	movw	r2, #1922
	ldr	r1, .L919+12
	ldr	r0, .L919+24
	bl	printk
.L771:
	ldr	r1, .L919+28
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L773
	ldrh	r3, [r4, #214]
	movw	r2, #1926
	ldr	r1, .L919+12
	ldr	r0, .L919+32
	bl	printk
.L773:
	mov	r1, r5
	ldr	r0, [r4, #4]
	bl	enc_impl_start
	mov	r9, r0
	cbz	r0, .L774
	movw	r3, #1927
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L919+36
	b	.L914
.L774:
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_stash
	ldrd	r10, r3, [r4, #4]
	ldr	fp, [r6, #48]
	str	r3, [sp, #40]
	movw	r3, #5444
	ldr	r2, [r4, r3]
	movw	r3, #10968
	str	r2, [r4, #272]
	ldr	r1, [r4, r3]
	str	r1, [r4, #276]
	str	r2, [r4, r3]
	movw	r3, #5532
	ldr	r3, [r4, r3]
	cbz	r3, .L775
.L778:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L777
	ldrh	r3, [r4, #214]
	mov	r2, #1520
	ldr	r1, .L919+40
	ldr	r0, .L919+44
	bl	printk
.L777:
	mov	r1, r7
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L780
	ldrh	r3, [r4, #70]
	movw	r2, #1524
	ldr	r1, .L919+40
	ldr	r0, .L919+48
	bl	printk
.L780:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_dpb
	mov	r9, r0
	cmp	r0, #0
	beq	.L781
	str	r0, [sp]
	movw	r3, #1525
	ldr	r0, .L919+52
	mov	r2, r4
	mov	r1, r3
.L915:
	bl	printk
	add	r2, r4, #10944
	ldr	r3, [r2]
	adds	r3, r3, #1
	str	r3, [r2]
	b	.L779
.L775:
	ldr	r3, [r4, #788]
	cmp	r3, #0
	beq	.L778
	add	r3, r4, #5536
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L778
	ldr	r3, [r4, #456]
	cmp	r3, #0
	bne	.L778
	mov	r1, r6
	mov	r0, r4
	bl	mpp_enc_proc_two_pass
	mov	r9, r0
	cmp	r0, #0
	beq	.L778
.L779:
	movw	r3, #1930
	str	r9, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L919+56
	b	.L914
.L920:
	.align	2
.L919:
	.word	.LANCHOR0+553
	.word	.LC100
	.word	.LC81
	.word	.LANCHOR0+532
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	.LC105
	.word	.LC106
	.word	.LANCHOR0+574
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC122
.L781:
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L808
	ldrh	r3, [r4, #70]
	movw	r2, #1527
	ldr	r1, .L921
	ldr	r0, .L921+4
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L808
	ldrh	r3, [r4, #70]
	movw	r2, #1529
	ldr	r1, .L921
	ldr	r0, .L921+8
	str	r3, [sp]
	ldrh	r3, [r4, #214]
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	ubfx	r3, r3, #5, #1
	ldr	r1, .L921
	ubfx	r2, r2, #5, #1
	ldr	r0, .L921+12
	str	r2, [sp]
	movw	r2, #1531
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	ubfx	r3, r3, #4, #1
	ldr	r1, .L921
	ubfx	r2, r2, #4, #1
	ldr	r0, .L921+16
	str	r2, [sp]
	movw	r2, #1533
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	ubfx	r3, r3, #6, #1
	ldr	r1, .L921
	ubfx	r2, r2, #6, #1
	ldr	r0, .L921+20
	str	r2, [sp]
	movw	r2, #1535
	bl	printk
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	ldr	r1, .L921
	lsrs	r3, r3, #7
	ldr	r0, .L921+24
	lsrs	r2, r2, #7
	str	r2, [sp]
	movw	r2, #1537
	bl	printk
	ldr	r3, [r8]
	lsls	r0, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	ldrb	r2, [r4, #65]	@ zero_extendqisi2
	and	r3, r3, #15
	ldr	r1, .L921
	and	r2, r2, #15
	ldr	r0, .L921+28
	str	r2, [sp]
	movw	r2, #1539
	bl	printk
	ldr	r3, [r8]
	lsls	r1, r3, #15
	bpl	.L808
	ldrb	r3, [r4, #209]	@ zero_extendqisi2
	ldrb	r2, [r4, #65]	@ zero_extendqisi2
	ldr	r1, .L921
	lsrs	r3, r3, #4
	ldr	r0, .L921+32
	lsrs	r2, r2, #4
	str	r2, [sp]
	movw	r2, #1541
	bl	printk
	ldr	r3, [r8]
	lsls	r2, r3, #15
	bpl	.L808
	ldrh	r3, [r4, #70]
	movw	r2, #1543
	ldr	r1, .L921
	ldr	r0, .L921+36
	bl	printk
.L808:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L791
	ldrh	r3, [r4, #214]
	movw	r2, #1545
	ldr	r1, .L921
	ldr	r0, .L921+40
	bl	printk
.L791:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_frm_start
	mov	r9, r0
	cbz	r0, .L792
	movw	r3, #1546
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L921+44
	b	.L915
.L792:
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L793
	ldrh	r3, [r4, #214]
	movw	r2, #1547
	ldr	r1, .L921
	ldr	r0, .L921+48
	bl	printk
.L793:
	ldr	r3, [r4, #412]
	cmp	r3, #1
	bne	.L794
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	lsls	r1, r3, #27
	bpl	.L794
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	tst	r3, #14
	bne	.L794
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L795
	ldr	r3, [r4, #404]
	movw	r2, #1554
	ldr	r1, .L921
	ldr	r0, .L921+52
	str	r3, [sp]
	ldrh	r3, [r4, #214]
	bl	printk
.L795:
	ldr	r1, [r4, #396]
	mov	r0, fp
	bl	mpp_packet_append
	ldr	r3, [r4, #404]
	str	r3, [r6, #56]
	ldr	r3, [r6, #68]
	ldr	r2, [r4, #404]
	add	r3, r3, r2
	str	r3, [r6, #68]
	ldrb	r3, [r4, #408]	@ zero_extendqisi2
	orr	r3, r3, #4
	strb	r3, [r4, #408]
.L794:
	ldr	r1, .L921+56
	mov	r0, r5
	bl	check_hal_task_pkt_len
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	lsls	r3, r3, #26
	bpl	.L796
	ldr	r3, [r4, #416]
	cbz	r3, .L796
	ldr	r3, [r4, #424]
	add	r2, sp, #52
	mov	r1, fp
	mov	r0, r10
	mov	r9, #0
	str	r9, [sp, #52]
	str	r3, [sp, #4]
	ldr	r3, [r4, #420]
	str	r3, [sp]
	ldr	r3, .L921+60
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	mov	r0, r10
	ldr	r1, [sp, #52]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	mov	r1, fp
	str	r3, [r6, #68]
	add	r2, sp, #52
	ldr	r3, [r4, #436]
	str	r9, [sp, #52]
	str	r3, [sp, #4]
	ldr	r3, [r4, #428]
	str	r3, [sp]
	ldr	r3, .L921+64
	bl	enc_impl_add_prefix
	ldr	r2, [r6, #60]
	ldr	r3, [r6, #68]
	ldr	r1, [sp, #52]
	add	r2, r2, r1
	add	r3, r3, r1
	str	r2, [r6, #60]
	str	r3, [r6, #68]
.L796:
	movw	r3, #6822
	ldrb	r2, [r4, r3]	@ zero_extendqisi2
	cmp	r2, #3
	bhi	.L800
	add	r9, r4, #6816
	adds	r3, r4, r3
	add	r9, r9, #4
	str	r3, [sp, #44]
.L797:
	ldrb	r3, [r9]	@ zero_extendqisi2
	mov	r1, fp
	and	r3, r3, #3
	str	r3, [sp, #36]
	movs	r3, #0
	str	r3, [sp, #52]
	ldr	r3, [sp, #36]
	adds	r2, r4, r3
	movw	r3, #6823
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	add	r2, sp, #52
	str	r3, [sp, #4]
	ldr	r3, [sp, #36]
	add	r3, r4, r3, lsl #10
	add	r3, r3, #6816
	adds	r3, r3, #11
	str	r3, [sp]
	ldr	r3, .L921+68
	ldr	r0, [r4, #4]
	bl	enc_impl_add_prefix
	ldr	r3, [r6, #68]
	ldr	r2, [r6, #60]
	ldr	r1, [sp, #52]
	add	r3, r3, r1
	str	r3, [r6, #68]
	ldr	r3, [sp, #44]
	add	r2, r2, r1
	str	r2, [r6, #60]
	ldr	r2, [sp, #44]
	ldrb	r3, [r3]	@ zero_extendqisi2
	adds	r3, r3, #1
	uxtb	r3, r3
	strb	r3, [r2]
	cmp	r3, #3
	ldr	r2, [sp, #36]
	add	r2, r2, #1
	strb	r2, [r9]
	bls	.L797
.L800:
	mov	r0, r5
	ldr	r1, .L921+72
	bl	check_hal_task_pkt_len
	ldr	r3, [r8]
	lsls	r0, r3, #26
	bpl	.L799
	ldrh	r3, [r4, #214]
	movw	r2, #1588
	ldr	r1, .L921
	ldr	r0, .L921+76
	bl	printk
.L799:
	mov	r1, r5
	mov	r0, r10
	bl	enc_impl_proc_hal
	mov	r9, r0
	cbz	r0, .L801
	movw	r3, #1589
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L921+80
	b	.L915
.L922:
	.align	2
.L921:
	.word	.LANCHOR0+574
	.word	.LC107
	.word	.LC108
	.word	.LC109
	.word	.LC110
	.word	.LC111
	.word	.LC112
	.word	.LC113
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
	.word	.LC118
	.word	.LC119
	.word	.LC120
	.word	.LANCHOR1
	.word	.LANCHOR1+16
	.word	.LANCHOR1+32
	.word	.LC121
	.word	.LC6
	.word	.LC7
.L801:
	ldr	r3, [r8]
	lsls	r1, r3, #26
	bpl	.L802
	ldrh	r3, [r4, #214]
	movw	r2, #1591
	ldr	r1, .L923
	ldr	r0, .L923+4
	bl	printk
.L802:
	mov	r1, r5
	ldr	r0, [sp, #40]
	bl	mpp_enc_hal_get_task
	mov	r9, r0
	cbz	r0, .L803
	mov	r3, #1592
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L923+8
	b	.L915
.L803:
	ldr	r3, [r8]
	lsls	r2, r3, #26
	bpl	.L804
	ldrh	r3, [r4, #214]
	movw	r2, #1594
	ldr	r1, .L923
	ldr	r0, .L923+12
	bl	printk
.L804:
	mov	r1, r7
	ldr	r0, [r4, #48]
	bl	rc_hal_start
	mov	r9, r0
	cbz	r0, .L805
	movw	r3, #1595
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L923+16
	b	.L915
.L805:
	ldr	r3, [r8]
	lsls	r3, r3, #26
	bpl	.L806
	ldrh	r3, [r4, #214]
	movw	r2, #1597
	ldr	r1, .L923
	ldr	r0, .L923+20
	bl	printk
.L806:
	mov	r1, r5
	ldr	r0, [sp, #40]
	bl	mpp_enc_hal_gen_regs
	mov	r9, r0
	cbz	r0, .L807
	movw	r3, #1598
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L923+24
	b	.L915
.L807:
	str	r0, [r4, #456]
	b	.L744
.L924:
	.align	2
.L923:
	.word	.LANCHOR0+574
	.word	.LC8
	.word	.LC9
	.word	.LC92
	.word	.LC93
	.word	.LC10
	.word	.LC11
	.fnend
	.size	mpp_enc_impl_reg_cfg, .-mpp_enc_impl_reg_cfg
	.align	1
	.global	mpp_enc_impl_hw_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_hw_start, %function
mpp_enc_impl_hw_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r4, r0
	ldr	r7, [r0, #448]
	mov	r5, r1
	ldr	r8, [r0, #8]
	add	r9, r7, #20
	cbz	r1, .L930
	ldr	r6, [r1, #448]
	adds	r6, r6, #20
.L926:
	ldr	r3, .L940
	ldr	r3, [r3]
	lsls	r3, r3, #26
	bpl	.L927
	ldrh	r3, [r4, #214]
	movw	r2, #1958
	ldr	r1, .L940+4
	ldr	r0, .L940+8
	bl	printk
.L927:
	mov	r2, r6
	mov	r1, r9
	mov	r0, r8
	bl	mpp_enc_hal_start
	mov	r6, r0
	cbz	r0, .L925
	movw	r3, #1959
	str	r0, [sp]
	mov	r1, r3
	mov	r2, r4
	ldr	r0, .L940+12
	bl	printk
	mov	r1, r7
	mov	r0, r4
	bl	mpp_enc_terminate_task
	cbz	r5, .L929
	ldr	r1, [r5, #448]
	mov	r0, r5
	bl	mpp_enc_terminate_task
.L929:
	add	r4, r4, #10944
	ldr	r3, [r4]
	adds	r3, r3, #1
	str	r3, [r4]
.L925:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L930:
	mov	r6, r1
	b	.L926
.L941:
	.align	2
.L940:
	.word	mpp_enc_debug
	.word	.LANCHOR0+593
	.word	.LC12
	.word	.LC13
	.fnend
	.size	mpp_enc_impl_hw_start, .-mpp_enc_impl_hw_start
	.align	1
	.global	mpp_enc_impl_int
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_int, %function
mpp_enc_impl_int:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #52
	sub	sp, sp, #52
	ldr	fp, [r0, #448]
	mov	r4, r0
	str	r2, [sp, #36]
	str	r3, [sp, #20]
	add	r8, fp, #20
	ldr	r5, [r0, #8]
	str	r1, [sp, #16]
	cmp	r1, #0
	beq	.L996
	ldr	r7, [r1, #448]
.L943:
	ldr	r3, .L1123
	ldr	r2, [r3]
	mov	r10, r3
	tst	r2, #32
	beq	.L944
	ldrh	r3, [r4, #214]
	movw	r2, #2069
	ldr	r1, .L1123+4
	ldr	r0, .L1123+8
	bl	printk
.L944:
	mov	r0, r5
	mov	r1, r8
	bl	mpp_enc_hal_wait
	mov	r5, r0
	cbnz	r0, .L945
	ldr	r9, [r4, #8]
	cbz	r7, .L946
	adds	r7, r7, #20
.L946:
	ldr	r3, [r10]
	lsls	r6, r3, #26
	bpl	.L947
	ldrh	r3, [r4, #214]
	movw	r2, #1618
	ldr	r1, .L1123+12
	ldr	r0, .L1123+16
	bl	printk
.L947:
	add	r6, r4, #56
	ldr	r0, [r4, #48]
	mov	r1, r6
	bl	rc_hal_end
	mov	r5, r0
	cbz	r0, .L948
	str	r0, [sp]
	movw	r3, #1619
	ldr	r0, .L1123+20
	mov	r2, r4
	mov	r1, r3
.L1119:
	bl	printk
.L945:
	cmn	r5, #101
	bne	.L998
	movw	r3, #10924
	ldr	r0, [r4, r3]
	cbz	r0, .L998
	ldr	r3, [r4, #388]
	ldr	r1, [r3, #24]
	bl	ring_buf_update_min_size
.L998:
	movs	r3, #1
	b	.L962
.L996:
	ldr	r7, [sp, #16]
	b	.L943
.L948:
	ldr	r3, [r10]
	lsls	r5, r3, #26
	bpl	.L949
	ldrh	r3, [r4, #214]
	movw	r2, #1621
	ldr	r1, .L1123+12
	ldr	r0, .L1123+24
	bl	printk
.L949:
	mov	r2, r7
	mov	r1, r8
	mov	r0, r9
	bl	mpp_enc_hal_ret_task
	mov	r5, r0
	cmp	r0, #0
	bne	.L945
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L950
	ldrh	r3, [r4, #214]
	movw	r2, #1626
	ldr	r1, .L1123+12
	ldr	r0, .L1123+28
	bl	printk
.L950:
	mov	r1, r6
	ldr	r0, [r4, #48]
	bl	rc_frm_check_reenc
	mov	r5, r0
	cmp	r0, #0
	bne	.L1117
	add	r9, r4, #5504
	add	r9, r9, #28
.L951:
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	lsls	r7, r3, #29
	bpl	.L953
	ldrb	r1, [r4, #213]	@ zero_extendqisi2
	ldr	r2, [r4, #752]
	cmp	r1, r2
	bcs	.L953
	ldr	r2, [r9]
	cbz	r2, .L952
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	lsls	r1, r2, #26
	bpl	.L953
	lsls	r2, r3, #31
	bpl	.L953
.L952:
	add	r7, r4, #5536
	ldr	r3, [r7]
	cbz	r3, .L954
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	lsls	r3, r3, #26
	bpl	.L953
.L954:
	ldrd	r2, r3, [fp, #64]
	subs	r3, r3, r2
	str	r3, [fp, #68]
	movs	r3, #0
	str	r3, [fp, #64]
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	orr	r3, r3, #1
	strb	r3, [fp, #11]
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L955
	ldrb	r3, [r4, #213]	@ zero_extendqisi2
	movw	r2, #2091
	ldr	r1, .L1123+4
	ldr	r0, .L1123+32
	str	r3, [sp, #4]
	ldrb	r3, [r4, #212]	@ zero_extendqisi2
	ubfx	r3, r3, #2, #1
	str	r3, [sp]
	ldrh	r3, [r4, #214]
	bl	printk
.L955:
	ldrb	r2, [r4, #212]	@ zero_extendqisi2
	ands	r3, r2, #1
	beq	.L956
	ldr	r2, [r7]
	cmp	r2, #0
	bne	.L957
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	lsls	r1, r2, #26
	bmi	.L957
	ldr	r3, [r10]
	lsls	r2, r3, #31
	bpl	.L958
	movw	r2, #1693
	ldr	r1, .L1123+36
	ldr	r0, .L1123+40
	bl	printk
.L958:
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_rollback
	ldr	r3, [fp, #68]
	str	r3, [r4, #240]
	ldr	r3, [r4, #228]
	str	r3, [r4, #244]
	ldr	r3, [r10]
	lsls	r3, r3, #26
	bpl	.L959
	ldrh	r3, [r4, #214]
	movw	r2, #1699
	ldr	r1, .L1123+36
	ldr	r0, .L1123+44
	bl	printk
.L959:
	mov	r1, r6
	ldr	r0, [r4, #48]
	bl	rc_frm_end
	cmp	r0, #0
	beq	.L960
	movw	r3, #1700
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1123+48
	bl	printk
.L961:
	ldr	r3, [r10]
	ands	r3, r3, #1
	beq	.L957
	mov	r2, #1704
	ldr	r1, .L1123+36
	ldr	r0, .L1123+52
	bl	printk
	movs	r3, #0
.L957:
	ldrb	r2, [fp, #11]	@ zero_extendqisi2
	mov	r5, #-1
	bfc	r2, #0, #1
	strb	r2, [fp, #11]
.L962:
	ldr	r2, [r4, #44]
	adds	r2, r2, #1
	str	r2, [r4, #44]
	cbz	r3, .L982
	ldr	r3, [r4, #456]
	orr	r3, r3, #1
	str	r3, [r4, #456]
	movs	r3, #0
	str	r3, [r4, #408]
.L982:
	movs	r1, #0
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_length
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #364]
	bl	mpp_packet_ring_buf_put_used
	add	r0, r4, #364
	bl	mpp_packet_deinit
.L983:
	ldr	r3, [r4, #364]
	ldr	r2, [sp, #36]
	str	r3, [r2]
	movs	r3, #0
	str	r3, [r4, #364]
	ldr	r3, [r10]
	lsls	r3, r3, #26
	bpl	.L986
	ldrd	r2, [r4, #376]
	ldr	r1, .L1123+4
	ldr	r0, .L1123+56
	strd	r2, [sp]
	movw	r2, #2165
	ldrh	r3, [r4, #214]
	bl	printk
.L986:
	bl	get_mpidev_ops
	ldr	r3, [r4, #1296]
	cmp	r3, #8
	itet	ne
	ldrbne	r8, [r4, #208]	@ zero_extendqisi2
	moveq	r8, #1
	ubfxne	r8, r8, #4, #1
	mov	r9, r0
	ldr	r0, [fp, #72]
	bl	mpp_frame_get_dts
	strd	r0, [sp, #40]
	ldr	r0, [fp, #72]
	bl	mpp_frame_get_pts
	cmn	r5, #102
	mov	r6, r0
	mov	r7, r1
	bne	.L988
	cmp	r9, #0
	beq	.L990
	ldr	r3, [r9, #32]
	cbz	r3, .L991
	movw	r0, #10964
	add	r2, sp, #40
	movs	r1, #3
	ldr	r0, [r4, r0]
	blx	r3
.L991:
	ldr	r1, [r9, #24]
	cmp	r1, #0
	beq	.L990
	movw	r0, #10964
	str	r8, [sp, #8]
	strd	r6, [sp]
	ldrd	r2, [sp, #40]
	ldr	r0, [r4, r0]
	blx	r1
	b	.L990
.L1117:
	movw	r3, #1627
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1123+60
	b	.L1119
.L960:
	ldr	r2, [r4, #356]
	movw	r3, #10960
	str	r2, [r4, r3]
	b	.L961
.L1124:
	.align	2
.L1123:
	.word	mpp_enc_debug
	.word	.LANCHOR0+615
	.word	.LC14
	.word	.LANCHOR0+632
	.word	.LC123
	.word	.LC20
	.word	.LC124
	.word	.LC125
	.word	.LC94
	.word	.LANCHOR0+644
	.word	.LC91
	.word	.LC127
	.word	.LC22
	.word	.LC95
	.word	.LC24
	.word	.LC126
.L956:
	lsls	r7, r2, #27
	bpl	.L963
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	tst	r3, #160
	bne	.L963
	add	r3, r4, #456
	str	r3, [sp, #32]
	ldr	r3, [r10]
	ldr	r7, [r4, #4]
	lsls	r0, r3, #31
	bpl	.L964
	movw	r2, #1719
	ldr	r1, .L1125
	ldr	r0, .L1125+4
	bl	printk
.L964:
	ldr	r3, [r4, #464]
	ldr	r0, [r4, #452]
	adds	r3, r3, #1
	str	r3, [r4, #464]
	ldr	r3, [r4, #456]
	orr	r3, r3, #2
	str	r3, [r4, #456]
	bl	mpp_enc_refs_rollback
	ldr	r0, [r4, #452]
	ldr	r1, [sp, #32]
	bl	mpp_enc_refs_set_usr_cfg
	ldr	r3, [r10]
	lsls	r1, r3, #26
	bpl	.L965
	ldrh	r3, [r4, #214]
	movw	r2, #1729
	ldr	r1, .L1125
	ldr	r0, .L1125+8
	bl	printk
.L965:
	mov	r1, r6
	ldr	r0, [r4, #452]
	bl	mpp_enc_refs_get_cpb
	ldr	r3, [r10]
	lsls	r2, r3, #15
	bpl	.L966
	ldrh	r3, [r4, #70]
	movw	r2, #1733
	ldr	r1, .L1125
	ldr	r0, .L1125+12
	bl	printk
.L966:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_proc_dpb
	cmp	r0, #0
	beq	.L967
	str	r0, [sp]
	movw	r3, #1734
	ldr	r0, .L1125+16
	mov	r2, r4
	mov	r1, r3
.L1118:
	bl	printk
.L968:
	ldr	r3, [r10]
	lsls	r1, r3, #31
	bpl	.L973
	mov	r2, #1744
	ldr	r1, .L1125
	ldr	r0, .L1125+20
	bl	printk
.L973:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	bfc	r3, #0, #1
	strb	r3, [fp, #11]
.L963:
	ldrb	r3, [fp, #11]	@ zero_extendqisi2
	lsls	r2, r3, #31
	bpl	.L951
	add	r2, r4, #5536
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L1122
	ldrb	r2, [r4, #208]	@ zero_extendqisi2
	ands	r2, r2, #32
	bne	.L1122
	bfi	r3, r2, #0, #1
	strb	r3, [fp, #11]
.L953:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L977
	ldrh	r3, [r4, #214]
	movw	r2, #2119
	ldr	r1, .L1125+24
	ldr	r0, .L1125+28
	bl	printk
.L977:
	mov	r1, r6
	ldr	r0, [r4, #48]
	bl	rc_frm_end
	mov	r5, r0
	cmp	r0, #0
	beq	.L978
	movw	r3, #2120
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1125+32
	b	.L1119
.L967:
	ldr	r3, [r10]
	lsls	r3, r3, #26
	bpl	.L969
	ldrh	r3, [r4, #214]
	mov	r2, #1736
	ldr	r1, .L1125
	ldr	r0, .L1125+36
	bl	printk
.L969:
	mov	r1, r8
	mov	r0, r7
	bl	enc_impl_sw_enc
	cbz	r0, .L970
	movw	r3, #1737
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1125+40
	b	.L1118
.L970:
	ldr	r3, [r10]
	lsls	r0, r3, #26
	bpl	.L971
	ldrh	r3, [r4, #214]
	movw	r2, #1739
	ldr	r1, .L1125
	ldr	r0, .L1125+44
	bl	printk
.L971:
	mov	r1, r6
	ldr	r0, [r4, #48]
	bl	rc_frm_end
	cbz	r0, .L972
	movw	r3, #1740
	str	r0, [sp]
	mov	r2, r4
	mov	r1, r3
	ldr	r0, .L1125+32
	b	.L1118
.L972:
	ldr	r2, [r4, #356]
	movw	r3, #10960
	str	r2, [r4, r3]
	b	.L968
.L978:
	ldr	r2, [r4, #356]
	movw	r3, #10960
	str	r2, [r4, r3]
	bl	mpp_time
	ldr	r3, [r4, #12]
	mov	r6, r0
	ldr	r0, [r4, #40]
	mov	r7, r1
	strd	r6, [r4, #24]
	add	ip, r0, #1
	str	ip, [r4, #40]
	cbz	r3, .L979
	ldrd	r2, [r4, #16]
	orrs	r1, r2, r3
	beq	.L979
	orrs	r1, r6, r7
	beq	.L979
	subs	r1, r6, r2
	str	r1, [sp, #24]
	sbc	r1, r7, r3
	str	r1, [sp, #28]
	ldrd	r0, [sp, #24]
	mov	r9, #0
	ldr	r8, .L1125+56
	cmp	r8, r0
	sbcs	r1, r9, r1
	bge	.L979
	ldr	r0, .L1125+48
	subs	r2, r6, r2
	smull	r0, r1, r2, r0
	asrs	r2, r2, #31
	movw	r0, #10000
	mul	r0, r0, ip
	rsb	r1, r2, r1, asr #6
	bl	__aeabi_idiv
	movw	r3, #5516
	str	r0, [r4, r3]
	strd	r6, [r4, #16]
	str	r5, [r4, #40]
.L979:
	ldrh	r3, [r4, #212]
	ldr	r0, [r4, #364]
	and	r3, r3, #251
	strh	r3, [r4, #212]	@ movhi
	bl	mpp_packet_get_flag
	lsls	r1, r0, #26
	bmi	.L981
	ldr	r1, [fp, #68]
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_length
.L981:
	ldrb	r3, [r4, #208]	@ zero_extendqisi2
	lsls	r2, r3, #27
	bpl	.L984
	movs	r1, #16
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_flag
.L984:
	ldr	r0, [r4, #360]
	bl	mpp_frame_get_eos
	cbz	r0, .L985
	movs	r1, #1
	ldr	r0, [r4, #364]
	bl	mpp_packet_set_flag
.L985:
	ldrb	r1, [r4, #209]	@ zero_extendqisi2
	ldr	r0, [r4, #364]
	lsrs	r1, r1, #4
	bl	mpp_packet_set_temporal_id
	movw	r3, #10964
	ldr	r2, [r4, #12]
	ldr	r1, [r4, r3]
	ldr	r0, [r4, #364]
	bl	mpp_packet_ring_buf_put_used
	mov	r5, r0
	cmp	r0, #0
	beq	.L983
	movw	r2, #2155
	ldr	r1, .L1125+24
	ldr	r0, .L1125+52
	movs	r5, #0
	bl	printk
	b	.L983
.L988:
	cmp	r9, #0
	bne	.L991
.L990:
	ldr	r3, [r4, #360]
	cbz	r3, .L993
	add	r0, r4, #360
	bl	mpp_frame_deinit
.L993:
	movw	r3, #5532
	ldr	r3, [r4, r3]
	cbnz	r3, .L994
	ldr	r3, [r4, #788]
	cbz	r3, .L994
	add	r3, r4, #5536
	ldr	r3, [r3]
	cbnz	r3, .L994
	movs	r2, #104
	add	r1, r4, #216
	add	r0, r4, #488
	bl	memcpy
.L994:
	ldrb	r2, [r4, #408]	@ zero_extendqisi2
	movs	r3, #0
	strd	r3, r3, [r4, #360]
	strd	r3, r3, [r4, #384]
	and	r2, r2, #1
	str	r2, [r4, #408]
	str	r3, [fp, #8]
.L1122:
	ldr	r3, [sp, #16]
	cbz	r3, .L942
	ldr	r1, [sp, #20]
	mov	r0, r3
	bl	mpp_enc_comb_end_jpeg
.L942:
	mov	r0, r5
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L1126:
	.align	2
.L1125:
	.word	.LANCHOR0+663
	.word	.LC91
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC95
	.word	.LANCHOR0+615
	.word	.LC21
	.word	.LC22
	.word	.LC128
	.word	.LC129
	.word	.LC127
	.word	274877907
	.word	.LC23
	.word	999999
	.fnend
	.size	mpp_enc_impl_int, .-mpp_enc_impl_int
	.align	1
	.global	mpp_enc_impl_slice_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_slice_info, %function
mpp_enc_impl_slice_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #28
	sub	sp, sp, #28
	movs	r3, #0
	ldr	r7, [r0, #448]
	str	r3, [sp, #20]
	mov	r8, r2
	ldr	r3, .L1145
	mov	r5, r0
	ldr	r9, [r1]
	ldr	r4, [r7, #48]
	ldr	r3, [r3]
	ubfx	r6, r9, #0, #31
	lsls	r2, r3, #26
	bpl	.L1128
	ldr	r2, .L1145+4
	ldr	r3, .L1145+8
	ldr	r1, .L1145+12
	ands	r3, r3, r9, asr #32
	it	cc
	movcc	r3, r2
	ldr	r2, [r4, #36]
	ldr	r0, .L1145+16
	str	r3, [sp]
	mov	r3, r6
	strd	r4, r2, [sp, #4]
	mov	r2, #2208
	bl	printk
.L1128:
	ldr	r3, [r4, #36]
	cmp	r9, #0
	ldr	r2, [r4, #60]
	add	r6, r6, r3
	str	r6, [r4, #36]
	bge	.L1130
	orr	r2, r2, #96
	str	r2, [r4, #60]
	str	r4, [r5, #364]
.L1127:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L1130:
	orr	r3, r2, #32
	str	r3, [r4, #60]
	ldrb	r3, [r5, #208]	@ zero_extendqisi2
	mov	r0, r4
	lsls	r3, r3, #27
	itt	mi
	orrmi	r2, r2, #48
	strmi	r2, [r4, #60]
	ldrb	r3, [r5, #209]	@ zero_extendqisi2
	lsrs	r3, r3, #4
	str	r3, [r4, #64]
	movw	r3, #10964
	ldr	r2, [r5, #12]
	ldr	r1, [r5, r3]
	bl	mpp_packet_ring_buf_put_used
	cbz	r0, .L1133
	mov	r2, #2224
	ldr	r1, .L1145+12
	ldr	r0, .L1145+20
	bl	printk
.L1133:
	movw	r3, #10964
	str	r4, [r8]
	ldr	r3, [r5, r3]
	movw	r1, #10924
	ldr	r1, [r5, r1]
	add	r0, sp, #20
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp]
	movs	r3, #1
	mov	r2, r3
	bl	mpp_packet_new_ring_buf
	ldr	r3, [sp, #20]
	cbnz	r3, .L1134
	movw	r1, #2227
	ldr	r3, .L1145+24
	str	r1, [sp]
	ldr	r2, .L1145+28
	ldr	r0, .L1145+32
	bl	printk
.L1134:
	ldrd	r2, [r4, #40]
	ldr	r0, [sp, #20]
	bl	mpp_packet_set_pts
	ldrd	r2, [r4, #48]
	ldr	r0, [sp, #20]
	bl	mpp_packet_set_dts
	ldr	r3, [sp, #20]
	str	r3, [r7, #48]
	str	r3, [r5, #364]
	b	.L1127
.L1146:
	.align	2
.L1145:
	.word	mpp_enc_debug
	.word	.LC131
	.word	.LC130
	.word	.LANCHOR0+689
	.word	.LC132
	.word	.LC133
	.word	.LANCHOR0+713
	.word	.LC134
	.word	.LC81
	.fnend
	.size	mpp_enc_impl_slice_info, .-mpp_enc_impl_slice_info
	.align	1
	.global	mpp_enc_impl_pkt_full_inc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_pkt_full_inc, %function
mpp_enc_impl_pkt_full_inc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movw	r2, #10952
	ldr	r3, [r0, r2]
	adds	r3, r3, #1
	str	r3, [r0, r2]
	bx	lr
	.fnend
	.size	mpp_enc_impl_pkt_full_inc, .-mpp_enc_impl_pkt_full_inc
	.align	1
	.global	mpp_enc_impl_poc_debug_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_enc_impl_poc_debug_info, %function
mpp_enc_impl_poc_debug_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r7, [r1, #448]
	.pad #84
	sub	sp, sp, #84
	ldr	r1, .L1163
	mov	r5, r0
	mov	r6, r2
	bl	seq_puts
	ldr	r3, .L1163+4
	mov	r0, r5
	ldr	r2, .L1163+8
	ldr	r1, .L1163+12
	str	r3, [sp, #36]
	ldr	r3, .L1163+16
	str	r3, [sp, #32]
	ldr	r3, .L1163+20
	str	r3, [sp, #28]
	ldr	r3, .L1163+24
	str	r3, [sp, #24]
	ldr	r3, .L1163+28
	str	r3, [sp, #20]
	ldr	r3, .L1163+32
	str	r3, [sp, #16]
	ldr	r3, .L1163+36
	str	r3, [sp, #12]
	ldr	r3, .L1163+40
	str	r3, [sp, #8]
	ldr	r3, .L1163+44
	str	r3, [sp, #4]
	ldr	r3, .L1163+48
	str	r3, [sp]
	ldr	r3, .L1163+52
	bl	seq_printf
	ldr	r0, [r4, #1296]
	ldrd	r9, r10, [r4, #604]
	bl	strof_coding_type
	movw	r3, #5512
	ldr	r8, [r7, #4]
	movs	r7, #0
	mov	fp, r0
	ldr	r0, [r4, r3]
	bl	strof_gop_mode
	add	r3, r4, #5536
	mov	r2, r6
	ldr	r1, .L1163+56
	ldr	r3, [r3]
	str	r3, [sp, #36]
	movw	r3, #5532
	ldr	r3, [r4, r3]
	str	r8, [sp, #12]
	ldr	r8, .L1163+108
	str	r3, [sp, #32]
	ldr	r3, [r4, #624]
	strd	r0, r7, [sp, #16]
	mov	r0, r5
	strd	fp, r8, [sp, #4]
	str	r3, [sp, #28]
	ldr	r3, [r4, #620]
	str	r10, [sp]
	str	r3, [sp, #24]
	mov	r3, r9
	bl	seq_printf
	ldrd	r0, r1, [r4, #724]
	bl	__aeabi_idiv
	mov	r9, r0
	ldrd	r0, r1, [r4, #736]
	bl	__aeabi_idiv
	ldr	r1, .L1163+60
	mov	r10, r0
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1163+64
	ldr	r2, .L1163+8
	mov	r0, r5
	ldr	r1, .L1163+68
	str	r3, [sp, #24]
	ldr	r3, .L1163+72
	str	r3, [sp, #20]
	ldr	r3, .L1163+76
	str	r3, [sp, #16]
	ldr	r3, .L1163+80
	str	r3, [sp, #12]
	ldr	r3, .L1163+84
	str	r3, [sp, #8]
	ldr	r3, .L1163+88
	str	r3, [sp, #4]
	ldr	r3, .L1163+92
	str	r3, [sp]
	ldr	r3, .L1163+96
	bl	seq_printf
	ldr	r3, [r4, #32]
	ldr	r0, [r4, #628]
	str	r3, [sp, #72]
	bl	strof_pixel_fmt
	mov	fp, r0
	bl	mpp_time
	ldr	r3, [r4, #24]
	subs	r0, r0, r3
	ldr	r3, .L1163+100
	cmp	r0, r3
	movw	r3, #5516
	it	gt
	strgt	r7, [r4, r3]
	ldr	r0, [r4, #648]
	ldr	r7, [r4, r3]
	bl	strof_rotation
	str	r0, [sp, #76]
	ldr	r0, [r4, #652]
	bl	strof_bool
	mov	r2, r6
	ldr	r1, .L1163+104
	ldr	r3, [sp, #76]
	str	r0, [sp, #24]
	mov	r0, r5
	str	fp, [sp, #12]
	strd	r7, r3, [sp, #16]
	movw	r7, #10924
	ldr	r3, [sp, #72]
	str	r9, [sp]
	strd	r10, r3, [sp, #4]
	ldr	r3, .L1163+108
	bl	seq_printf
	ldr	r3, [r4, r7]
	cmp	r3, #0
	beq	.L1150
	ldr	r1, .L1163+112
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1163+116
	ldr	r2, .L1163+8
	mov	r0, r5
	ldr	r1, .L1163+120
	str	r3, [sp, #24]
	ldr	r3, .L1163+124
	str	r3, [sp, #20]
	ldr	r3, .L1163+128
	str	r3, [sp, #16]
	ldr	r3, .L1163+132
	str	r3, [sp, #12]
	ldr	r3, .L1163+136
	str	r3, [sp, #8]
	ldr	r3, .L1163+140
	str	r3, [sp, #4]
	ldr	r3, .L1163+144
	str	r3, [sp]
	ldr	r3, .L1163+148
	bl	seq_printf
	ldr	r3, [r4, r7]
	ldr	r1, .L1163+152
	mov	r0, r5
	ldr	r2, [r3, #44]
	str	r2, [sp, #24]
	ldr	r2, [r3, #36]
	str	r2, [sp, #20]
	ldr	r2, [r3, #40]
	str	r2, [sp, #16]
	ldr	r2, [r3, #32]
	str	r2, [sp, #12]
	ldr	r2, [r3, #8]
	str	r2, [sp, #8]
	ldr	r2, [r3, #12]
	str	r2, [sp, #4]
	ldr	r2, [r3]
	str	r2, [sp]
	mov	r2, r6
	ldr	r3, [r3, #4]
	bl	seq_printf
.L1150:
	ldr	r1, .L1163+156
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1163+160
	ldr	r2, .L1163+8
	mov	r0, r5
	ldr	r1, .L1163+164
	str	r3, [sp, #20]
	ldr	r3, .L1163+168
	str	r3, [sp, #16]
	ldr	r3, .L1163+172
	str	r3, [sp, #12]
	ldr	r3, .L1163+176
	str	r3, [sp, #8]
	ldr	r3, .L1163+180
	str	r3, [sp, #4]
	ldr	r3, .L1163+184
	str	r3, [sp]
	ldr	r3, .L1163+188
	bl	seq_printf
	movw	r2, #10952
	ldr	r2, [r4, r2]
	movw	r3, #5524
	ldr	r3, [r4, r3]
	mov	r0, r5
	ldr	r1, .L1163+192
	str	r2, [sp, #20]
	movw	r2, #10948
	ldr	r2, [r4, r2]
	str	r2, [sp, #16]
	add	r2, r4, #10944
	ldr	r2, [r2]
	str	r2, [sp, #12]
	movw	r2, #10940
	ldr	r2, [r4, r2]
	str	r2, [sp, #8]
	movw	r2, #10936
	ldr	r2, [r4, r2]
	str	r2, [sp, #4]
	movw	r2, #5528
	ldr	r2, [r4, r2]
	str	r2, [sp]
	mov	r2, r6
	bl	seq_printf
	ldr	r3, [r4, #1296]
	cmp	r3, #7
	beq	.L1151
	ldr	r2, .L1163+196
	cmp	r3, r2
	bne	.L1152
.L1151:
	ldr	r1, .L1163+200
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1163+204
	ldr	r2, .L1163+8
	mov	r0, r5
	ldr	r1, .L1163+208
	add	r7, r4, #5440
	str	r3, [sp, #20]
	ldr	r3, .L1163+212
	str	r3, [sp, #16]
	ldr	r3, .L1163+216
	str	r3, [sp, #12]
	ldr	r3, .L1163+220
	str	r3, [sp, #8]
	ldr	r3, .L1163+224
	str	r3, [sp, #4]
	ldr	r3, .L1163+228
	str	r3, [sp]
	ldr	r3, .L1163+232
	bl	seq_printf
	ldr	r3, [r4, #924]
	mov	r2, r6
	ldr	r1, .L1163+236
	mov	r0, r5
	str	r3, [sp, #20]
	ldr	r3, [r4, #920]
	str	r3, [sp, #16]
	ldr	r3, [r4, #912]
	str	r3, [sp, #12]
	ldr	r3, [r4, #908]
	str	r3, [sp, #8]
	ldr	r3, [r4, #916]
	str	r3, [sp, #4]
	ldr	r3, [r4, #900]
	str	r3, [sp]
	ldr	r3, [r4, #904]
	bl	seq_printf
	ldr	r3, .L1163+240
	ldr	r2, .L1163+8
	mov	r0, r5
	ldr	r1, .L1163+244
	bl	seq_printf
	ldr	r3, [r4, #988]
	mov	r2, r6
	ldr	r1, .L1163+248
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #984]
	str	r3, [sp, #52]
	ldr	r3, [r4, #980]
	str	r3, [sp, #48]
	ldr	r3, [r4, #976]
	str	r3, [sp, #44]
	ldr	r3, [r4, #972]
	str	r3, [sp, #40]
	ldr	r3, [r4, #968]
	str	r3, [sp, #36]
	b	.L1164
.L1165:
	.align	2
.L1163:
	.word	.LC135
	.word	.LC139
	.word	.LC137
	.word	.LC138
	.word	.LC140
	.word	.LC141
	.word	.LC142
	.word	.LC143
	.word	.LC144
	.word	.LC145
	.word	.LC146
	.word	.LC147
	.word	.LC148
	.word	.LC136
	.word	.LC149
	.word	.LC151
	.word	.LC154
	.word	.LC153
	.word	.LC155
	.word	.LC156
	.word	.LC157
	.word	.LC158
	.word	.LC159
	.word	.LC160
	.word	.LC152
	.word	2000999
	.word	.LC161
	.word	.LC150
	.word	.LC162
	.word	.LC165
	.word	.LC164
	.word	.LC166
	.word	.LC167
	.word	.LC168
	.word	.LC169
	.word	.LC170
	.word	.LC171
	.word	.LC163
	.word	.LC172
	.word	.LC173
	.word	.LC176
	.word	.LC175
	.word	.LC177
	.word	.LC178
	.word	.LC179
	.word	.LC180
	.word	.LC181
	.word	.LC174
	.word	.LC182
	.word	16777220
	.word	.LC183
	.word	.LC186
	.word	.LC185
	.word	.LC187
	.word	.LC188
	.word	.LC189
	.word	.LC190
	.word	.LC191
	.word	.LC184
	.word	.LC192
	.word	.LC193
	.word	.LC194
	.word	.LC195
.L1164:
	ldr	r3, [r4, #964]
	str	r3, [sp, #32]
	ldr	r3, [r4, #960]
	str	r3, [sp, #28]
	ldr	r3, [r4, #956]
	str	r3, [sp, #24]
	ldr	r3, [r4, #952]
	str	r3, [sp, #20]
	ldr	r3, [r4, #948]
	str	r3, [sp, #16]
	ldr	r3, [r4, #944]
	str	r3, [sp, #12]
	ldr	r3, [r4, #940]
	str	r3, [sp, #8]
	ldr	r3, [r4, #936]
	str	r3, [sp, #4]
	ldr	r3, [r4, #932]
	str	r3, [sp]
	ldr	r3, [r4, #928]
	bl	seq_printf
	ldr	r3, .L1166
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+8
	bl	seq_printf
	ldr	r3, [r4, #1052]
	mov	r2, r6
	ldr	r1, .L1166+12
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1048]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1044]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1040]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1036]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1032]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1028]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1024]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1020]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1016]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1012]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1008]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1004]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1000]
	str	r3, [sp, #4]
	ldr	r3, [r4, #996]
	str	r3, [sp]
	ldr	r3, [r4, #992]
	bl	seq_printf
	ldr	r3, .L1166+16
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+8
	bl	seq_printf
	ldr	r3, [r4, #1116]
	mov	r2, r6
	ldr	r1, .L1166+20
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1112]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1108]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1104]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1100]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1096]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1092]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1088]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1084]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1080]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1076]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1072]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1068]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1064]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1060]
	str	r3, [sp]
	ldr	r3, [r4, #1056]
	bl	seq_printf
	ldr	r3, .L1166+24
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+8
	bl	seq_printf
	ldr	r3, [r4, #1180]
	mov	r2, r6
	ldr	r1, .L1166+20
	mov	r0, r5
	str	r3, [sp, #56]
	ldr	r3, [r4, #1176]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1172]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1168]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1164]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1160]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1156]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1152]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1148]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1144]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1140]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1136]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1132]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1128]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1124]
	str	r3, [sp]
	ldr	r3, [r4, #1120]
	bl	seq_printf
	ldr	r3, .L1166+28
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+8
	bl	seq_printf
	ldr	r3, [r4, #1252]
	mov	r2, r6
	ldr	r1, .L1166+32
	mov	r0, r5
	str	r3, [sp, #64]
	ldr	r3, [r4, #1248]
	str	r3, [sp, #60]
	ldr	r3, [r4, #1244]
	str	r3, [sp, #56]
	ldr	r3, [r4, #1240]
	str	r3, [sp, #52]
	ldr	r3, [r4, #1236]
	str	r3, [sp, #48]
	ldr	r3, [r4, #1232]
	str	r3, [sp, #44]
	ldr	r3, [r4, #1228]
	str	r3, [sp, #40]
	ldr	r3, [r4, #1224]
	str	r3, [sp, #36]
	ldr	r3, [r4, #1220]
	str	r3, [sp, #32]
	ldr	r3, [r4, #1216]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1212]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1208]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1204]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1200]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1196]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1192]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1188]
	str	r3, [sp]
	ldr	r3, [r4, #1184]
	bl	seq_printf
	ldr	r3, .L1166+36
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+8
	bl	seq_printf
	ldr	r3, [r4, #1292]
	mov	r2, r6
	ldr	r1, .L1166+40
	mov	r0, r5
	str	r3, [sp, #32]
	ldr	r3, [r4, #1288]
	str	r3, [sp, #28]
	ldr	r3, [r4, #1284]
	str	r3, [sp, #24]
	ldr	r3, [r4, #1280]
	str	r3, [sp, #20]
	ldr	r3, [r4, #1276]
	str	r3, [sp, #16]
	ldr	r3, [r4, #1272]
	str	r3, [sp, #12]
	ldr	r3, [r4, #1268]
	str	r3, [sp, #8]
	ldr	r3, [r4, #1264]
	str	r3, [sp, #4]
	ldr	r3, [r4, #1260]
	str	r3, [sp]
	ldr	r3, [r4, #1256]
	bl	seq_printf
	ldr	r1, .L1166+44
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1166+48
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+52
	str	r3, [sp, #24]
	ldr	r3, .L1166+56
	str	r3, [sp, #20]
	ldr	r3, .L1166+60
	str	r3, [sp, #16]
	ldr	r3, .L1166+64
	str	r3, [sp, #12]
	ldr	r3, .L1166+68
	str	r3, [sp, #8]
	ldr	r3, .L1166+72
	str	r3, [sp, #4]
	ldr	r3, .L1166+76
	str	r3, [sp]
	ldr	r3, .L1166+80
	bl	seq_printf
	ldr	r3, [r7, #32]
	mov	r2, r6
	ldr	r1, .L1166+84
	mov	r0, r5
	str	r3, [sp, #24]
	ldr	r3, [r7, #28]
	str	r3, [sp, #20]
	ldr	r3, [r7, #24]
	str	r3, [sp, #16]
	ldr	r3, [r7, #20]
	str	r3, [sp, #12]
	ldr	r3, [r7, #16]
	str	r3, [sp, #8]
	ldr	r3, [r7, #12]
	str	r3, [sp, #4]
	ldr	r3, [r7, #8]
	str	r3, [sp]
	ldr	r3, [r7, #4]
	bl	seq_printf
	ldr	r3, .L1166+88
	ldr	r2, .L1166+4
	mov	r0, r5
	ldr	r1, .L1166+92
	str	r3, [sp, #12]
	ldr	r3, .L1166+96
	str	r3, [sp, #8]
	ldr	r3, .L1166+100
	str	r3, [sp, #4]
	ldr	r3, .L1166+104
	str	r3, [sp]
	ldr	r3, .L1166+108
	bl	seq_printf
	ldr	r3, [r7, #36]
	mov	r2, r6
	ldr	r1, .L1166+112
	mov	r0, r5
	str	r3, [sp, #12]
	ldr	r3, [r7, #52]
	str	r3, [sp, #8]
	ldr	r3, [r7, #48]
	str	r3, [sp, #4]
	ldr	r3, [r7, #44]
	str	r3, [sp]
	ldr	r3, [r7, #40]
	bl	seq_printf
.L1152:
	movw	r9, #4152
	ldr	r3, [r4, r9]
	cmp	r3, #0
	bne	.L1153
	b	.L1167
.L1168:
	.align	2
.L1166:
	.word	.LC196
	.word	.LC137
	.word	.LC194
	.word	.LC195
	.word	.LC197
	.word	.LC198
	.word	.LC199
	.word	.LC200
	.word	.LC201
	.word	.LC202
	.word	.LC203
	.word	.LC204
	.word	.LC207
	.word	.LC206
	.word	.LC208
	.word	.LC209
	.word	.LC210
	.word	.LC211
	.word	.LC212
	.word	.LC213
	.word	.LC205
	.word	.LC214
	.word	.LC217
	.word	.LC216
	.word	.LC218
	.word	.LC219
	.word	.LC220
	.word	.LC215
	.word	.LC221
.L1167:
.L1156:
	mov	r1, r6
	mov	r0, r5
	bl	mpp_show_session_info
	mov	r2, r6
	ldr	r1, [r4, #4]
	mov	r0, r5
	bl	enc_impl_proc_debug
	mov	r2, r6
	ldr	r1, [r4, #48]
	mov	r0, r5
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	rc_proc_show
.L1153:
	ldr	r1, .L1169
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L1169+4
	ldr	r2, .L1169+8
	mov	r0, r5
	ldr	r1, .L1169+12
	add	r7, r4, #4128
	ldr	r10, .L1169+40
	adds	r7, r7, #28
	add	r9, r9, r4
	str	r3, [sp, #24]
	ldr	r3, .L1169+16
	str	r3, [sp, #20]
	ldr	r3, .L1169+20
	str	r3, [sp, #16]
	ldr	r3, .L1169+24
	str	r3, [sp, #12]
	ldr	r3, .L1169+28
	strd	r8, r3, [sp, #4]
	mov	r8, #0
	ldr	r3, .L1169+32
	str	r3, [sp]
	ldr	r3, .L1169+36
	bl	seq_printf
.L1154:
	ldr	r3, [r9]
	adds	r7, r7, #16
	cmp	r3, r8
	bls	.L1156
	ldrb	r3, [r7, #-1]	@ zero_extendqisi2
	mov	r2, r6
	mov	r1, r10
	mov	r0, r5
	str	r3, [sp, #24]
	ldrh	r3, [r7, #-8]
	str	r3, [sp, #20]
	ldrsh	r3, [r7, #-6]
	str	r3, [sp, #16]
	ldrh	r3, [r7, #-10]
	str	r3, [sp, #12]
	ldrh	r3, [r7, #-12]
	str	r3, [sp, #8]
	ldrh	r3, [r7, #-14]
	str	r3, [sp, #4]
	ldrh	r3, [r7, #-16]
	str	r3, [sp]
	mov	r3, r8
	bl	seq_printf
	add	r8, r8, #1
	b	.L1154
.L1170:
	.align	2
.L1169:
	.word	.LC222
	.word	.LC225
	.word	.LC137
	.word	.LC224
	.word	.LC226
	.word	.LC227
	.word	.LC228
	.word	.LC229
	.word	.LC230
	.word	.LC223
	.word	.LC231
	.fnend
	.size	mpp_enc_impl_poc_debug_info, .-mpp_enc_impl_poc_debug_info
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36626, %object
	.size	__func__.36626, 23
__func__.36626:
	.ascii	"check_hal_task_pkt_len\000"
	.type	__func__.36883, %object
	.size	__func__.36883, 22
__func__.36883:
	.ascii	"mpp_enc_proc_two_pass\000"
	.type	__func__.36766, %object
	.size	__func__.36766, 18
__func__.36766:
	.ascii	"update_rc_cfg_log\000"
	.type	__func__.37039, %object
	.size	__func__.37039, 22
__func__.37039:
	.ascii	"mpp_enc_comb_end_jpeg\000"
	.type	__func__.36665, %object
	.size	__func__.36665, 20
__func__.36665:
	.ascii	"mpp_enc_proc_rc_cfg\000"
	.type	__func__.36673, %object
	.size	__func__.36673, 20
__func__.36673:
	.ascii	"mpp_enc_proc_hw_cfg\000"
	.type	__FUNCTION__.36702, %object
	.size	__FUNCTION__.36702, 22
__FUNCTION__.36702:
	.ascii	"mpp_enc_unref_osd_buf\000"
	.type	__func__.36714, %object
	.size	__func__.36714, 28
__func__.36714:
	.ascii	"mpp_enc_proc_export_osd_buf\000"
	.type	__func__.36726, %object
	.size	__func__.36726, 22
__func__.36726:
	.ascii	"mpp_enc_proc_tune_cfg\000"
	.type	__func__.36747, %object
	.size	__func__.36747, 17
__func__.36747:
	.ascii	"mpp_enc_proc_cfg\000"
	.type	__func__.36696, %object
	.size	__func__.36696, 21
__func__.36696:
	.ascii	"mpp_enc_proc_ref_cfg\000"
	.space	1
	.type	resend_reason.36642, %object
	.size	resend_reason.36642, 24
resend_reason.36642:
	.word	.LC232
	.word	.LC233
	.word	.LC234
	.word	.LC235
	.word	.LC236
	.word	.LC237
	.type	__func__.36814, %object
	.size	__func__.36814, 23
__func__.36814:
	.ascii	"mpp_enc_proc_rc_update\000"
	.type	__FUNCTION__.36795, %object
	.size	__FUNCTION__.36795, 11
__FUNCTION__.36795:
	.ascii	"set_rc_cfg\000"
	.type	__func__.36805, %object
	.size	__func__.36805, 11
__func__.36805:
	.ascii	"set_rc_cfg\000"
	.space	3
	.type	name_of_rc_mode, %object
	.size	name_of_rc_mode, 20
name_of_rc_mode:
	.word	.LC238
	.word	.LC239
	.word	.LC240
	.word	.LC241
	.word	.LC242
	.type	__FUNCTION__.36836, %object
	.size	__FUNCTION__.36836, 34
__FUNCTION__.36836:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__func__.36843, %object
	.size	__func__.36843, 34
__func__.36843:
	.ascii	"mpp_enc_alloc_output_from_bufpool\000"
	.type	__FUNCTION__.36859, %object
	.size	__FUNCTION__.36859, 34
__FUNCTION__.36859:
	.ascii	"mpp_enc_alloc_output_from_ringbuf\000"
	.type	__func__.36860, %object
	.size	__func__.36860, 34
__func__.36860:
	.ascii	"mpp_enc_alloc_output_from_ringbuf\000"
	.type	__FUNCTION__.36970, %object
	.size	__FUNCTION__.36970, 24
__FUNCTION__.36970:
	.ascii	"mpp_enc_impl_alloc_task\000"
	.type	__FUNCTION__.36974, %object
	.size	__FUNCTION__.36974, 23
__FUNCTION__.36974:
	.ascii	"mpp_enc_impl_free_task\000"
	.type	__func__.36937, %object
	.size	__func__.36937, 21
__func__.36937:
	.ascii	"mpp_enc_reenc_simple\000"
	.type	__func__.37002, %object
	.size	__func__.37002, 21
__func__.37002:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__FUNCTION__.37003, %object
	.size	__FUNCTION__.37003, 21
__FUNCTION__.37003:
	.ascii	"mpp_enc_impl_reg_cfg\000"
	.type	__func__.36902, %object
	.size	__func__.36902, 19
__func__.36902:
	.ascii	"mpp_enc_normal_cfg\000"
	.type	__func__.37022, %object
	.size	__func__.37022, 22
__func__.37022:
	.ascii	"mpp_enc_impl_hw_start\000"
	.type	__func__.37059, %object
	.size	__func__.37059, 17
__func__.37059:
	.ascii	"mpp_enc_impl_int\000"
	.type	__func__.36916, %object
	.size	__func__.36916, 12
__func__.36916:
	.ascii	"mpp_enc_end\000"
	.type	__func__.36948, %object
	.size	__func__.36948, 19
__func__.36948:
	.ascii	"mpp_enc_reenc_drop\000"
	.type	__func__.36961, %object
	.size	__func__.36961, 26
__func__.36961:
	.ascii	"mpp_enc_reenc_force_pskip\000"
	.type	__func__.37083, %object
	.size	__func__.37083, 24
__func__.37083:
	.ascii	"mpp_enc_impl_slice_info\000"
	.type	__FUNCTION__.37084, %object
	.size	__FUNCTION__.37084, 24
__FUNCTION__.37084:
	.ascii	"mpp_enc_impl_slice_info\000"
	.data
	.set	.LANCHOR1,. + 0
	.type	uuid_version, %object
	.size	uuid_version, 16
uuid_version:
	.byte	61
	.byte	7
	.byte	109
	.byte	69
	.byte	115
	.byte	15
	.byte	65
	.byte	-88
	.byte	-79
	.byte	-60
	.byte	37
	.byte	-41
	.byte	-105
	.byte	107
	.byte	-15
	.byte	-84
	.type	uuid_rc_cfg, %object
	.size	uuid_rc_cfg, 16
uuid_rc_cfg:
	.byte	-41
	.byte	-36
	.byte	3
	.byte	-61
	.byte	-59
	.byte	111
	.byte	64
	.byte	-32
	.byte	-114
	.byte	-87
	.byte	23
	.byte	26
	.byte	-46
	.byte	-17
	.byte	94
	.byte	35
	.type	uuid_usr_data, %object
	.size	uuid_usr_data, 16
uuid_usr_data:
	.byte	-2
	.byte	57
	.byte	-84
	.byte	76
	.byte	74
	.byte	-114
	.byte	75
	.byte	75
	.byte	-123
	.byte	-39
	.byte	-78
	.byte	-94
	.byte	79
	.byte	-95
	.byte	25
	.byte	91
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: %s check failed: task length is not mat"
	.ascii	"ch to packet length %d vs %d\012\000"
.LC1:
	.ascii	"\0013%d: frame stride set equal cfg stride\000"
.LC2:
	.ascii	"\0016%s:%d: task %d two pass mode enter\012\000"
.LC3:
	.ascii	"\0016%s:%d: task %d enc proc dpb\012\000"
.LC4:
	.ascii	"\0016%s:%d: frm %d start **************************"
	.ascii	"*********\012\000"
.LC5:
	.ascii	"\0013%d: enc %p enc_impl_proc_dpb:%-4d failed retur"
	.ascii	"n %d\000"
.LC6:
	.ascii	"\0016%s:%d: task %d enc proc hal\012\000"
.LC7:
	.ascii	"\0013%d: enc %p enc_impl_proc_hal:%-4d failed retur"
	.ascii	"n %d\000"
.LC8:
	.ascii	"\0016%s:%d: task %d hal get task\012\000"
.LC9:
	.ascii	"\0013%d: enc %p mpp_enc_hal_get_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC10:
	.ascii	"\0016%s:%d: task %d hal generate reg\012\000"
.LC11:
	.ascii	"\0013%d: enc %p mpp_enc_hal_gen_regs:%-4d failed re"
	.ascii	"turn %d\000"
.LC12:
	.ascii	"\0016%s:%d: task %d hal start\012\000"
.LC13:
	.ascii	"\0013%d: enc %p mpp_enc_hal_start:%-4d failed retur"
	.ascii	"n %d\000"
.LC14:
	.ascii	"\0016%s:%d: task %d hal wait\012\000"
.LC15:
	.ascii	"\0013%d: enc %p mpp_enc_hal_wait:%-4d failed return"
	.ascii	" %d\000"
.LC16:
	.ascii	"\0013%d: enc %p mpp_enc_hal_ret_task:%-4d failed re"
	.ascii	"turn %d\000"
.LC17:
	.ascii	"\0016%s:%d: task %d two pass mode leave\012\000"
.LC18:
	.ascii	"%s-b:%d[%d:%d]-g:%d-q:%d:[%d:%d]:[%d:%d]:%d\012\000"
.LC19:
	.ascii	"\0016%s:%d: rc cfg log is full\012\000"
.LC20:
	.ascii	"\0013%d: enc %p rc_hal_end:%-4d failed return %d\000"
.LC21:
	.ascii	"\0016%s:%d: task %d rc enc->frame end\012\000"
.LC22:
	.ascii	"\0013%d: enc %p rc_frm_end:%-4d failed return %d\000"
.LC23:
	.ascii	"\0013%s:%d: ring_buf_put_used fail \012\000"
.LC24:
	.ascii	"\0016%s:%d: task %d enqueue packet pts %lld\012\000"
.LC25:
	.ascii	"\0013%d: invalid rc_priority %d should be[%d, %d] \012"
	.ascii	"\000"
.LC26:
	.ascii	"\0013%d: invalid super_mode %d should be[%d, %d] \012"
	.ascii	"\000"
.LC27:
	.ascii	"\0013%d: invalid debre_strength should be[%d, %d] \012"
	.ascii	"\000"
.LC28:
	.ascii	"\0013%d: invalid rc mode %d should be RC_MODE_VBR o"
	.ascii	"r RC_MODE_CBR\012\000"
.LC29:
	.ascii	"\0013%d: invalid quality %d should be from QUALITY_"
	.ascii	"WORST to QUALITY_BEST\012\000"
.LC30:
	.ascii	"\0013%d: invalid bit per second %d [%d:%d] out of r"
	.ascii	"ange 1K~100M\012\000"
.LC31:
	.ascii	"\0013%d: invalid qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC32:
	.ascii	"\0013%d: restore qp range: init %d i [%d:%d] p [%d:"
	.ascii	"%d]\012\000"
.LC33:
	.ascii	"\0013%d: invalid qp delta ip %d restore to %d\012\000"
.LC34:
	.ascii	"\0013%d: invalid qp delta vi %d restore to %d\012\000"
.LC35:
	.ascii	"\0013%d: invalid qp max step %d restore to %d\012\000"
.LC36:
	.ascii	"\0013%d: warning: bitrate statistic time %d is larg"
	.ascii	"er than 60s\012\000"
.LC37:
	.ascii	"\0013%s:%d: failed to accept new rc config\012\000"
.LC38:
	.ascii	"\0016%d: MPP_ENC_SET_RC_CFG bps %d [%d : %d] fps [%"
	.ascii	"d:%d] gop %d\012\000"
.LC39:
	.ascii	"\0013%d: invalid hw qp delta row [%d:%d]\012\000"
.LC40:
	.ascii	"\0013%d: invalid hw qbias_en [%d]\012\000"
.LC41:
	.ascii	"\0013%d: invalid hw qp bias [%d:%d]\012\000"
.LC42:
	.ascii	"\0013%d: invalid filter strength [%d:%d]\012\000"
.LC43:
	.ascii	"\0013%s:%d: failed to accept new hw config\012\000"
.LC44:
	.ascii	"mpp_enc\000"
.LC45:
	.ascii	"\0013%s:%d: mpibuf_ops get fail\000"
.LC46:
	.ascii	"\0013%d: osd buf dma_buf_get fd %d failed\012\000"
.LC47:
	.ascii	"\0013%d: osd inv buf dma_buf_get fd %d failed\012\000"
.LC48:
	.ascii	"\0013%d: invalid scene mode %d not in range [%d:%d]"
	.ascii	"\012\000"
.LC49:
	.ascii	"\0013%d: invalid motion static switch enable not in"
	.ascii	" range [%d : %d]\012\000"
.LC50:
	.ascii	"\0013%d: invalid deblur strength not in range [0 : "
	.ascii	"7]\012\000"
.LC51:
	.ascii	"\0013%d: invalid anti ring strength not in range [0"
	.ascii	" : 3]\012\000"
.LC52:
	.ascii	"\0013%d: invalid anti line strength not in range [0"
	.ascii	" : 3]\012\000"
.LC53:
	.ascii	"\0013%d: invalid lambda idx not in range [0 : 8]\012"
	.ascii	"\000"
.LC54:
	.ascii	"\0013%d: invalid I frame lambda idx not in range [0"
	.ascii	" : 8]\012\000"
.LC55:
	.ascii	"\0013%d: invalid anti flick strength not in range ["
	.ascii	"0 : 3]\012\000"
.LC56:
	.ascii	"\0013%d: invalid lgt_chg_lvl %d not in range [0, 3]"
	.ascii	"\012\000"
.LC57:
	.ascii	"\0013%d: invalid static_frm_num %d not in range [0,"
	.ascii	" 7]\012\000"
.LC58:
	.ascii	"\0013%d: invalid madp16_th %d not in range [0, 255]"
	.ascii	"\012\000"
.LC59:
	.ascii	"\0013%d: invalid skip16_wgt %d not in range [3, 8] "
	.ascii	"or 0\012\000"
.LC60:
	.ascii	"\0013%d: invalid skip32_wgt %d not in range [3, 8] "
	.ascii	"or 0\012\000"
.LC61:
	.ascii	"\0013%s:%d: failed to accept new tuning config\012\000"
.LC62:
	.ascii	"\0016%d: MPP_ENC_SET_CFG in \012\000"
.LC63:
	.ascii	"\0013%d: Please use MPP_ENC_GET_HDR_SYNC instead of"
	.ascii	" unsafe MPP_ENC_GET_EXTRA_INFO\012\000"
.LC64:
	.ascii	"\0013%d: NOTE: MPP_ENC_GET_HDR_SYNC needs MppPacket"
	.ascii	" input\012\000"
.LC65:
	.ascii	"\0016%d: deprecated MPP_ENC_PRE_ALLOC_BUFF control\012"
	.ascii	"\000"
.LC66:
	.ascii	"\0016%s:%d: header mode set to %d\012\000"
.LC67:
	.ascii	"\0013%s:%d: invalid header mode %d\012\000"
.LC68:
	.ascii	"\0013%s:%d: invalid NULL ptr on setting header mode"
	.ascii	"\012\000"
.LC69:
	.ascii	"\0016%s:%d: sei mode set to %d\012\000"
.LC70:
	.ascii	"\0013%s:%d: invalid sei mode %d\012\000"
.LC71:
	.ascii	"\0013%d: ref param_error\000"
.LC72:
	.ascii	"\0013%s:%d: failed to copy ref cfg ret %d\012\000"
.LC73:
	.ascii	"\0013%s:%d: failed to set ref cfg ret %d\012\000"
.LC74:
	.ascii	"\0013%d: user data is overflow\000"
.LC75:
	.ascii	"\0013%d: usr data is big then 1k byte len %d\000"
.LC76:
	.ascii	"\0016%d: send header for %s\012\000"
.LC77:
	.ascii	"flex\000"
.LC78:
	.ascii	"fix\000"
.LC79:
	.ascii	"\0016%s:%d: rc update cfg start\012\000"
.LC80:
	.ascii	"rc->fps_out_num\000"
.LC81:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
.LC82:
	.ascii	"\0013%s:%d: unsupport coding type %d\012\000"
.LC83:
	.ascii	"\0016%d: mode %s bps [%d:%d:%d] fps %s [%d/%d] -> %"
	.ascii	"s [%d/%d] gop i [%d] v [%d]\012\000"
.LC84:
	.ascii	"\0016%s:%d: rc update cfg done\012\000"
.LC85:
	.ascii	"size\000"
.LC86:
	.ascii	"buffer\000"
.LC87:
	.ascii	"\0016%s:%d: create output pkt %p buf %p\012\000"
.LC88:
	.ascii	"\0016%s:%d: output to pkt %p buf %p pos %p length %"
	.ascii	"d\012\000"
.LC89:
	.ascii	"\0013%d: ring buf get mpp_buf fail \012\000"
.LC90:
	.ascii	"\0013%s:%d: ring buffer %d init failed\012\000"
.LC91:
	.ascii	"\0016%s:%d: enter\012\000"
.LC92:
	.ascii	"\0016%s:%d: task %d rc hal start\012\000"
.LC93:
	.ascii	"\0013%d: enc %p rc_hal_start:%-4d failed return %d\000"
.LC94:
	.ascii	"\0016%s:%d: task %d reenc %d times %d\012\000"
.LC95:
	.ascii	"\0016%s:%d: leave\012\000"
.LC96:
	.ascii	"\0016%d: chan %d frame info no equal set drop: fram"
	.ascii	"e [%d, %d, %d, %d], prep [%d, %d, %d, %d]\000"
.LC97:
	.ascii	"\0016%s:%d: task seq idx %d start\012\000"
.LC98:
	.ascii	"\0013%d: enc %p rc_frm_check_drop:%-4d failed retur"
	.ascii	"n %d\000"
.LC99:
	.ascii	"\0016%s:%d: task %d drop %d\012\000"
.LC100:
	.ascii	"enc->packet\000"
.LC101:
	.ascii	"\0016%s:%d: task %d update header length %d\012\000"
.LC102:
	.ascii	"\0016%s:%d: added_by_change \012\000"
.LC103:
	.ascii	"\0016%s:%d: check_hal_task_pkt_len \012\000"
.LC104:
	.ascii	"gen_hdr and adding\000"
.LC105:
	.ascii	"\0016%s:%d: task %d enc start\012\000"
.LC106:
	.ascii	"\0013%d: enc %p enc_impl_start:%-4d failed return %"
	.ascii	"d\000"
.LC107:
	.ascii	"\0016%s:%d: frm %d compare\012\000"
.LC108:
	.ascii	"\0016%s:%d: seq_idx      %d vs %d\012\000"
.LC109:
	.ascii	"\0016%s:%d: is_idr       %d vs %d\012\000"
.LC110:
	.ascii	"\0016%s:%d: is_intra     %d vs %d\012\000"
.LC111:
	.ascii	"\0016%s:%d: is_non_ref   %d vs %d\012\000"
.LC112:
	.ascii	"\0016%s:%d: is_lt_ref    %d vs %d\012\000"
.LC113:
	.ascii	"\0016%s:%d: lt_idx       %d vs %d\012\000"
.LC114:
	.ascii	"\0016%s:%d: temporal_id  %d vs %d\012\000"
.LC115:
	.ascii	"\0016%s:%d: frm %d done  **************************"
	.ascii	"*********\012\000"
.LC116:
	.ascii	"\0016%s:%d: task %d rc frame start\012\000"
.LC117:
	.ascii	"\0013%d: enc %p rc_frm_start:%-4d failed return %d\000"
.LC118:
	.ascii	"\0016%s:%d: task %d rc frame start ok \012\000"
.LC119:
	.ascii	"\0016%s:%d: task %d IDR header length %d\012\000"
.LC120:
	.ascii	"header adding\000"
.LC121:
	.ascii	"user data adding\000"
.LC122:
	.ascii	"\0013%d: enc %p mpp_enc_normal_cfg:%-4d failed retu"
	.ascii	"rn %d\000"
.LC123:
	.ascii	"\0016%s:%d: task %d rc hal end\012\000"
.LC124:
	.ascii	"\0016%s:%d: task %d hal ret task\012\000"
.LC125:
	.ascii	"\0016%s:%d: task %d rc frame check reenc\012\000"
.LC126:
	.ascii	"\0013%d: enc %p rc_frm_check_reenc:%-4d failed retu"
	.ascii	"rn %d\000"
.LC127:
	.ascii	"\0016%s:%d: task %d rc frame end\012\000"
.LC128:
	.ascii	"\0016%s:%d: task %d enc sw enc start\012\000"
.LC129:
	.ascii	"\0013%d: enc %p enc_impl_sw_enc:%-4d failed return "
	.ascii	"%d\000"
.LC130:
	.ascii	"last\000"
.LC131:
	.ascii	"continue\000"
.LC132:
	.ascii	"\0016%s:%d: slice_info len %d %s, packet %p len %d\012"
	.ascii	"\000"
.LC133:
	.ascii	"\0013%s:%d: ring_buf_put_used fail.\012\000"
.LC134:
	.ascii	"new_packet\000"
.LC135:
	.ascii	"\012--------venc chn attr 1------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC136:
	.ascii	"Width\000"
.LC137:
	.ascii	"ID\000"
.LC138:
	.ascii	"%8s|%8s|%8s|%6s|%9s|%10s|%10s|%6s|%10s|%11s|%8s|%10"
	.ascii	"s\012\000"
.LC139:
	.ascii	"RefShare\000"
.LC140:
	.ascii	"Online\000"
.LC141:
	.ascii	"MaxHeight\000"
.LC142:
	.ascii	"MaxWidth\000"
.LC143:
	.ascii	"Prio\000"
.LC144:
	.ascii	"GopMode\000"
.LC145:
	.ascii	"Sequence\000"
.LC146:
	.ascii	"ByFrame\000"
.LC147:
	.ascii	"Type\000"
.LC148:
	.ascii	"Height\000"
.LC149:
	.ascii	"%8d|%8u|%8u|%6s|%9s|%10u|%10s|%6d|%10d|%11d|%8d|%10"
	.ascii	"d\012\000"
.LC150:
	.ascii	"y\000"
.LC151:
	.ascii	"\012--------venc chn attr 2------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC152:
	.ascii	"VeStr\000"
.LC153:
	.ascii	"%8s|%8s|%8s|%8s|%12s|%12s|%12s|%12s|%10s\012\000"
.LC154:
	.ascii	"mirror\000"
.LC155:
	.ascii	"rotation\000"
.LC156:
	.ascii	"RealFps*10\000"
.LC157:
	.ascii	"PixFmt\000"
.LC158:
	.ascii	"Timeref\000"
.LC159:
	.ascii	"TarFr\000"
.LC160:
	.ascii	"SrcFr\000"
.LC161:
	.ascii	"%8d|%8s|%8d|%8d|%12x|%12s|%12u|%12s|%10s\012\000"
.LC162:
	.ascii	"\012--------ring buf status------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC163:
	.ascii	"w_pos\000"
.LC164:
	.ascii	"%8s|%8s|%8s|%8s|%10s|%10s|%10s|%10s|%12s\012\000"
.LC165:
	.ascii	"max_use_len\000"
.LC166:
	.ascii	"l_r_pos\000"
.LC167:
	.ascii	"l_w_pos\000"
.LC168:
	.ascii	"min_size\000"
.LC169:
	.ascii	"total_len\000"
.LC170:
	.ascii	"usd_len\000"
.LC171:
	.ascii	"r_pos\000"
.LC172:
	.ascii	"%8d|%8d|%8d|%8d|%10d|%10d|%10d|%10d|%12d\012\000"
.LC173:
	.ascii	"\012--------hw status------------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC174:
	.ascii	"hw_run\000"
.LC175:
	.ascii	"%8s|%8s|%12s|%14s|%14s|%14s|%16s|%14s\012\000"
.LC176:
	.ascii	"pkt_full_cnt\000"
.LC177:
	.ascii	"start_fail_cnt\000"
.LC178:
	.ascii	"cfg_fail_cnt\000"
.LC179:
	.ascii	"ring_fail_cnt\000"
.LC180:
	.ascii	"pkt_fail_cnt\000"
.LC181:
	.ascii	"enc_status\000"
.LC182:
	.ascii	"%8d|%8d|%12d|%14u|%14u|%14u|%16u|%14u\012\000"
.LC183:
	.ascii	"\012--------hw param-------------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC184:
	.ascii	"qp_dlt_row_i\000"
.LC185:
	.ascii	"%8s|%14s|%12s|%12s|%12s|%12s|%12s|%12s|\012\000"
.LC186:
	.ascii	"flt_str_p\000"
.LC187:
	.ascii	"flt_str_i\000"
.LC188:
	.ascii	"qbias_p\000"
.LC189:
	.ascii	"qbias_i\000"
.LC190:
	.ascii	"qbias_en\000"
.LC191:
	.ascii	"qp_dlt_row\000"
.LC192:
	.ascii	"%8u|%14d|%12d|%12d|%12d|%12d|%12d|%12d\012\000"
.LC193:
	.ascii	"thrd_i[0] ~ thrd_i[15]\000"
.LC194:
	.ascii	"%8s|%24s\012\000"
.LC195:
	.ascii	"%8u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u|%4u"
	.ascii	"|%4u|%4u|%4u|%4u\012\000"
.LC196:
	.ascii	"thrd_p[0] ~ thrd_p[15]\000"
.LC197:
	.ascii	"step_i[0] ~ step_i[15]\000"
.LC198:
	.ascii	"%8u|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d"
	.ascii	"|%4d|%4d|%4d|%4d\012\000"
.LC199:
	.ascii	"step_p[0] ~ step_p[15]\000"
.LC200:
	.ascii	"qbias_arr[0] ~ qbias_arr[17]\000"
.LC201:
	.ascii	"%8u|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d"
	.ascii	"|%4d|%4d|%4d|%4d|%4d|%4d\012\000"
.LC202:
	.ascii	"aq_rnge_arr[0] ~ aq_rnge_arr[9]\000"
.LC203:
	.ascii	"%8u|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d|%4d\012\000"
.LC204:
	.ascii	"\012--------fine tuning param----------------------"
	.ascii	"--------------------------------------------------\012"
	.ascii	"\000"
.LC205:
	.ascii	"scene_mode\000"
.LC206:
	.ascii	"%8s|%12s|%12s|%12s|%10s|%10s|%12s|%12s|%12s\012\000"
.LC207:
	.ascii	"atf_str\000"
.LC208:
	.ascii	"lambda_i_idx\000"
.LC209:
	.ascii	"lambda_idx\000"
.LC210:
	.ascii	"atl_str\000"
.LC211:
	.ascii	"atr_str\000"
.LC212:
	.ascii	"deblur_str\000"
.LC213:
	.ascii	"md_swth_en\000"
.LC214:
	.ascii	"%8u|%12d|%12d|%12d|%10d|%10d|%12d|%12d|%12d\012\000"
.LC215:
	.ascii	"static_frm_num\000"
.LC216:
	.ascii	"%8s|%14s|%12s|%12s|%12s|%12s\012\000"
.LC217:
	.ascii	"lgt_chg_lvl\000"
.LC218:
	.ascii	"skip32_wgt\000"
.LC219:
	.ascii	"skip16_wgt\000"
.LC220:
	.ascii	"madp16_th\000"
.LC221:
	.ascii	"%8u|%14d|%12d|%12d|%12d|%12d\012\000"
.LC222:
	.ascii	"\012--------venc roi attr -------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC223:
	.ascii	"roi\000"
.LC224:
	.ascii	"%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s|%8s\012\000"
.LC225:
	.ascii	"abs_qp\000"
.LC226:
	.ascii	"intra\000"
.LC227:
	.ascii	"quality\000"
.LC228:
	.ascii	"h\000"
.LC229:
	.ascii	"w\000"
.LC230:
	.ascii	"x\000"
.LC231:
	.ascii	"%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d|%8d\012\000"
.LC232:
	.ascii	"unchanged\000"
.LC233:
	.ascii	"codec/prep cfg change\000"
.LC234:
	.ascii	"rc cfg change rc_mode/fps/gop\000"
.LC235:
	.ascii	"set cfg change input/format \000"
.LC236:
	.ascii	"set cfg change rc_mode/fps/gop\000"
.LC237:
	.ascii	"set cfg change codec\000"
.LC238:
	.ascii	"vbr\000"
.LC239:
	.ascii	"cbr\000"
.LC240:
	.ascii	"fixqp\000"
.LC241:
	.ascii	"avbr\000"
.LC242:
	.ascii	"smtrc\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
