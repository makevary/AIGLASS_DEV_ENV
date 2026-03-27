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
	.file	"mpp_rkvenc_500.c"
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
	.type	____atomic_set_bit, %function
____atomic_set_bit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	lsrs	r2, r0, #5
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, [r1, r2, lsl #2]
	and	r3, r0, #31
	movs	r0, #1
	lsls	r0, r0, r3
	orrs	r0, r0, r5
	str	r0, [r1, r2, lsl #2]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, pc}
	.fnend
	.size	____atomic_set_bit, .-____atomic_set_bit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_invalid_class_msg, %function
rkvenc_invalid_class_msg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #164]
	movs	r2, #0
	ldr	r3, [r3, #24]
	add	r3, r0, r3, lsl #4
.L3:
	cmp	r0, r3
	bne	.L5
	movs	r0, #0
	bx	lr
.L5:
	ldr	r1, [r0, #172]
	cbz	r1, .L4
	strd	r2, r2, [r0, #168]
.L4:
	adds	r0, r0, #16
	b	.L3
	.fnend
	.size	rkvenc_invalid_class_msg, .-rkvenc_invalid_class_msg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_get_class_reg, %function
rkvenc_get_class_reg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r3, r1
	ldr	r1, [r0, #164]
	movs	r2, #0
	ldr	r4, [r1, #24]
.L10:
	cmp	r2, r4
	beq	.L15
	ldr	r5, [r1, #28]
	cmp	r5, r3
	bhi	.L11
	ldr	r5, [r1, #32]
	cmp	r5, r3
	bls	.L11
	add	r1, r0, r2, lsl #4
	ldr	r1, [r1, #180]
	cmp	r1, r3
	bhi	.L12
	add	r2, r0, r2, lsl #4
	subs	r3, r3, r1
	ldr	r0, [r2, #172]
	add	r0, r0, r3
.L9:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L12:
	strd	r2, r1, [sp]
	movw	r2, #527
	ldr	r1, .L16
	ldr	r0, .L16+4
	bl	printk
.L15:
	movs	r0, #0
	b	.L9
.L11:
	adds	r2, r2, #1
	adds	r1, r1, #8
	b	.L10
.L17:
	.align	2
.L16:
	.word	.LANCHOR0
	.word	.LC5
	.fnend
	.size	rkvenc_get_class_reg, .-rkvenc_get_class_reg
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_update_req, %function
rkvenc_update_req:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	ldr	r0, [r0, #164]
	add	r1, r0, r1, lsl #3
	ldrd	r5, r6, [r1, #28]
	ldrd	r0, r1, [r2, #8]
	add	r0, r0, r1
	cmp	r1, r5
	sub	r0, r0, #4
	mov	r4, r6
	it	cc
	movcc	r1, r5
	cmp	r6, r0
	str	r1, [r3, #12]
	it	cs
	movcs	r4, r0
	adds	r4, r4, #4
	subs	r4, r4, r1
	str	r4, [r3, #8]
	ldr	r4, [r2, #12]
	subs	r1, r1, r4
	ldr	r4, [r2, #16]
	add	r1, r1, r4
	str	r1, [r3, #16]
	ldr	r3, [r2, #12]
	cmp	r3, r5
	bcc	.L19
	cmp	r6, r0
	bcs	.L20
.L19:
	ldr	r2, [r2, #8]
	ldr	r1, .L21
	ldr	r0, .L21+4
	str	r2, [sp]
	mov	r2, #480
	bl	printk
.L20:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L22:
	.align	2
.L21:
	.word	.LANCHOR0+21
	.word	.LC6
	.fnend
	.size	rkvenc_update_req, .-rkvenc_update_req
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_read, %function
mpp_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, r1
	ldr	r3, [r0, #60]
	add	r3, r3, r1
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r4, [r3]
@ 0 "" 2
@ 618 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.h" 1
	dsb 
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L28
	ldr	r3, [r3]
	lsls	r3, r3, #18
	bpl	.L23
	mov	r3, r4
	lsrs	r1, r1, #2
	ldr	r0, .L28+4
	bl	printk
.L23:
	mov	r0, r4
	pop	{r4, pc}
.L29:
	.align	2
.L28:
	.word	mpp_dev_debug
	.word	.LC7
	.fnend
	.size	mpp_read, .-mpp_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_write, %function
mpp_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #19
	bpl	.L31
	mov	r3, r2
	ldr	r0, .L35+4
	mov	r2, r1
	lsrs	r1, r1, #2
	bl	printk
.L31:
	.syntax unified
@ 597 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.h" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r6, #60]
	add	r1, r1, r4
	.syntax unified
@ 95 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	str r5, [r1]
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L36:
	.align	2
.L35:
	.word	mpp_dev_debug
	.word	.LC8
	.fnend
	.size	mpp_write, .-mpp_write
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_disconnect_dvbm, %function
rkvenc_disconnect_dvbm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	cbnz	r1, .L38
	movs	r1, #96
	bl	mpp_read
	mov	r5, r0
.L38:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r3, #0
	strb	r3, [r4, #332]
	ldr	r3, [r4, #256]
	cbnz	r3, .L39
.L42:
	lsls	r2, r5, #26
	bpl	.L43
	bic	r2, r5, #36
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	b	.L43
.L39:
	mov	r1, #776
	mov	r0, r4
	bl	mpp_read
	lsls	r3, r0, #15
	bpl	.L42
.L43:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	rkvenc_disconnect_dvbm, .-rkvenc_disconnect_dvbm
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clear_dvbm_info, %function
rkvenc_clear_dvbm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r2, #0
	mov	r4, r0
	movs	r1, #96
	bl	mpp_write
	movs	r2, #0
	movs	r1, #24
	mov	r0, r4
	bl	mpp_write
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	movs	r1, #96
	mov	r5, r0
	mov	r0, r4
	bl	mpp_read
	orrs	r3, r5, r0
	mov	r2, r0
	beq	.L51
	mov	r1, r5
	ldr	r0, .L53
	pop	{r3, r4, r5, lr}
	b	printk
.L51:
	pop	{r3, r4, r5, pc}
.L54:
	.align	2
.L53:
	.word	.LC9
	.fnend
	.size	rkvenc_clear_dvbm_info, .-rkvenc_clear_dvbm_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_connect_dvbm, %function
rkvenc_connect_dvbm:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	.pad #28
	sub	sp, sp, #28
	ldr	r6, [r0, #264]
	mov	r4, r1
	cbnz	r1, .L56
	movs	r1, #96
	bl	mpp_read
	mov	r4, r0
.L56:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #96
	mov	r0, r5
	bl	mpp_read
	lsls	r1, r0, #26
	bpl	.L57
	ldr	r3, [r5, #256]
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	strb	r3, [r5, #332]
.L58:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L70
	add	r6, sp, #24
	ldm	r4, {r0, r1, r2, r3}
	stmdb	r6, {r0, r1, r2, r3}
	movw	r1, #20880
	mov	r0, r5
	bl	mpp_read
	movw	r1, #20844
	mov	r6, r0
	mov	r0, r5
	bl	mpp_read
	and	r6, r6, #3
	add	r3, sp, #24
	mov	r7, r0
	add	r6, r3, r6, lsl #2
	mov	r0, r5
	ldr	r1, [r6, #-16]
	ldr	r6, .L70+4
	bl	mpp_read
	ldr	r3, [r6]
	lsls	r2, r3, #28
	bpl	.L64
	ubfx	r3, r0, #0, #14
	ubfx	r2, r0, #16, #8
	add	r1, r4, #16
	ldr	r0, .L70+8
	bl	printk
	ldr	r3, [r6]
	lsls	r3, r3, #28
	bpl	.L64
	movw	r1, #20840
	mov	r0, r5
	bl	mpp_read
	ubfx	r3, r7, #0, #14
	add	r1, r4, #16
	str	r3, [sp, #4]
	uxtb	r2, r0
	ubfx	r3, r7, #16, #8
	ldr	r0, .L70+12
	str	r3, [sp]
	mov	r3, r7
	bl	printk
.L64:
	movs	r0, #0
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L57:
	and	r6, r6, #3
	bic	r4, r4, #36
	cmp	r6, #3
	bne	.L59
	movw	r1, #20844
	mov	r0, r5
	bl	mpp_read
	tst	r0, #167772160
	beq	.L62
.L69:
	orr	r4, r4, #20
.L61:
	mov	r2, r4
	movs	r1, #96
	mov	r0, r5
	bl	mpp_write
	orr	r2, r4, #32
	movs	r1, #96
	mov	r0, r5
	bl	mpp_write
	b	.L58
.L59:
	ldr	r3, [r5, #336]
	cmp	r3, #0
	bgt	.L69
.L62:
	orr	r4, r4, #16
	b	.L61
.L71:
	.align	2
.L70:
	.word	.LANCHOR0+40
	.word	mpp_dev_debug
	.word	.LC10
	.word	.LC11
	.fnend
	.size	rkvenc_connect_dvbm, .-rkvenc_connect_dvbm
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_read_relaxed, %function
mpp_read_relaxed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r2, r1
	ldr	r3, [r0, #60]
	add	r3, r3, r1
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r4, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L77
	ldr	r3, [r3]
	lsls	r3, r3, #18
	bpl	.L72
	mov	r3, r4
	lsrs	r1, r1, #2
	ldr	r0, .L77+4
	bl	printk
.L72:
	mov	r0, r4
	pop	{r4, pc}
.L78:
	.align	2
.L77:
	.word	mpp_dev_debug
	.word	.LC12
	.fnend
	.size	mpp_read_relaxed, .-mpp_read_relaxed
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_write_relaxed, %function
mpp_write_relaxed:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L84
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r3, [r3]
	mov	r4, r1
	mov	r5, r2
	lsls	r3, r3, #19
	bpl	.L80
	mov	r3, r2
	ldr	r0, .L84+4
	mov	r2, r1
	lsrs	r1, r1, #2
	bl	printk
.L80:
	ldr	r1, [r6, #60]
	add	r1, r1, r4
	.syntax unified
@ 95 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	str r5, [r1]
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L85:
	.align	2
.L84:
	.word	mpp_dev_debug
	.word	.LC8
	.fnend
	.size	mpp_write_relaxed, .-mpp_write_relaxed
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_reg_dump, %function
rkvenc_reg_dump:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #12
	mov	r9, r0
	ldrd	r5, r6, [r0, #344]
	orrs	r3, r5, r6
	beq	.L86
	ldr	r7, .L100
	adds	r5, r5, #3
	adds	r6, r6, #3
	ldr	fp, .L100+8
	bic	r5, r5, #3
	bic	r6, r6, #3
	add	r10, r7, #72
.L89:
	ldrd	r4, r3, [r7, #28]
	cmp	r5, r4
	bls	.L88
	cmp	r6, r3
	bls	.L88
.L95:
	adds	r7, r7, #8
	cmp	r10, r7
	bne	.L89
.L86:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L88:
	cmp	r5, r4
	bcs	.L91
	cmp	r6, r3
	bcc	.L86
.L91:
	cmp	r4, r5
	it	cc
	movcc	r4, r5
	cmp	r3, r6
	it	cs
	movcs	r3, r6
	mov	r8, r3
.L92:
	cmp	r4, r8
	bhi	.L95
	mov	r1, r4
	mov	r0, r9
	bl	mpp_read
	cbz	r0, .L93
	str	r0, [sp]
	mov	r3, r4
	movw	r2, #830
	ldr	r1, .L100+4
	mov	r0, fp
	bl	printk
.L93:
	adds	r4, r4, #4
	b	.L92
.L101:
	.align	2
.L100:
	.word	.LANCHOR1
	.word	.LANCHOR0+78
	.word	.LC13
	.fnend
	.size	rkvenc_reg_dump, .-rkvenc_reg_dump
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_dump_session, %function
rkvenc_dump_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	ldr	r4, [r0, #56]
	mov	r6, r0
	.pad #24
	sub	sp, sp, #24
	mov	r0, r4
	bl	down_read
	ldr	r1, .L107
	mov	r0, r5
	bl	seq_puts
	ldr	r1, .L107+4
	mov	r0, r5
	bl	seq_puts
	ldr	r2, .L107+8
	ldr	r1, .L107+12
	mov	r0, r5
	bl	seq_printf
	ldr	r2, .L107+16
	ldr	r1, .L107+12
	mov	r0, r5
	bl	seq_printf
	ldr	r3, .L107+20
	ldr	r2, .L107+24
	mov	r0, r5
	ldr	r1, .L107+28
	str	r3, [sp, #20]
	ldr	r3, .L107+32
	str	r3, [sp, #16]
	ldr	r3, .L107+36
	str	r3, [sp, #12]
	ldr	r3, .L107+40
	str	r3, [sp, #8]
	ldr	r3, .L107+44
	str	r3, [sp, #4]
	ldr	r3, .L107+48
	str	r3, [sp]
	ldr	r3, .L107+52
	bl	seq_printf
	ldr	r1, .L107+56
	mov	r0, r5
	bl	seq_puts
	ldr	r2, [r6, #68]
	ldr	r1, .L107+60
	mov	r0, r5
	bl	seq_printf
	ldr	r3, .L107+64
	ldr	r2, [r6]
	mov	r0, r5
	ldr	r1, .L107+12
	ldr	r2, [r3, r2, lsl #2]
	bl	seq_printf
	ldr	r3, [r4, #64]
	ldr	r1, .L107+68
	mov	r0, r5
	str	r3, [sp, #20]
	ldr	r3, [r4, #60]
	str	r3, [sp, #16]
	ldr	r3, [r4, #56]
	str	r3, [sp, #12]
	ldr	r3, [r4, #36]
	str	r3, [sp, #8]
	ldr	r3, [r4, #32]
	str	r3, [sp, #4]
	ldr	r3, [r4, #28]
	str	r3, [sp]
	ldr	r3, [r6, #76]
	ldr	r2, [r4, #24]
	bl	seq_printf
	ldr	r1, .L107+56
	mov	r0, r5
	bl	seq_puts
	ldr	r3, [r4, #32]
	cbz	r3, .L103
	ldr	r1, .L107+72
	mov	r0, r5
	bl	seq_puts
	ldr	r1, .L107+4
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L107+76
	ldr	r2, .L107+80
	mov	r0, r5
	ldr	r1, .L107+84
	str	r3, [sp, #4]
	ldr	r3, .L107+88
	str	r3, [sp]
	ldr	r3, .L107+92
	bl	seq_printf
	ldr	r3, [r4, #52]
	ldr	r1, .L107+96
	mov	r0, r5
	str	r3, [sp, #4]
	ldr	r3, [r4, #48]
	str	r3, [sp]
	ldrd	r2, r3, [r4, #40]
	bl	seq_printf
.L103:
	mov	r0, r4
	bl	up_read
	movs	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L108:
	.align	2
.L107:
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC22
	.word	.LC20
	.word	.LC21
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC19
	.word	.LC28
	.word	.LC29
	.word	mpp_device_name
	.word	.LC30
	.word	.LC31
	.word	.LC35
	.word	.LC33
	.word	.LC34
	.word	.LC36
	.word	.LC32
	.word	.LC37
	.fnend
	.size	rkvenc_dump_session, .-rkvenc_dump_session
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_free_session, %function
rkvenc_free_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbz	r0, .L111
	ldr	r5, [r0, #60]
	cbz	r5, .L112
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	ldr	r0, [r5, #976]
	cbnz	r0, .L113
.L114:
	mov	r0, r5
	bl	kfree
.L112:
	ldr	r5, [r4, #64]
	cbz	r5, .L115
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	ldr	r0, [r5, #976]
	cbz	r0, .L116
	bl	kfree
.L116:
	mov	r0, r5
	bl	kfree
.L115:
	ldr	r0, [r4, #56]
	cbz	r0, .L111
	bl	kfree
	movs	r3, #0
	str	r3, [r4, #56]
.L111:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L113:
	bl	kfree
	b	.L114
	.fnend
	.size	rkvenc_free_session, .-rkvenc_free_session
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_free_task, %function
rkvenc_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	bl	mpp_task_finalize
	mov	r0, r4
	bl	rkvenc_invalid_class_msg
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	rkvenc_free_task, .-rkvenc_free_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_reset, %function
rkvenc_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	ldr	r6, .L147
	ldr	r5, [r0, #148]
	ldr	r3, [r6]
	lsls	r0, r3, #26
	bpl	.L132
	movw	r2, #1869
	ldr	r1, .L147+4
	ldr	r0, .L147+8
	bl	printk
.L132:
	movw	r2, #1023
	ldr	r1, [r5, #148]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #5
	ldr	r1, [r5, #140]
	mov	r0, r4
	bl	mpp_write
	bl	ktime_get
	ldr	r3, .L147+12
	adds	r8, r0, r3
	mov	r3, #0
	adc	r9, r1, r3
.L138:
	ldr	r3, [r4, #60]
	ldr	r2, [r5, #156]
	add	r3, r3, r2
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r3, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r1, r3, #29
	bpl	.L133
.L136:
	movs	r7, #0
.L134:
	movs	r2, #6
	ldr	r1, [r5, #140]
	mov	r0, r4
	bl	mpp_write
	ldr	r3, .L147+16
	ldr	r0, .L147+20
	ldr	r3, [r3, #4]
	blx	r3
	movs	r2, #4
	ldr	r1, [r5, #140]
	mov	r0, r4
	bl	mpp_write
	mov	r2, #-1
	ldr	r1, [r5, #152]
	mov	r0, r4
	bl	mpp_write
	movs	r2, #0
	ldr	r1, [r5, #156]
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L131
	movw	r2, #1885
	ldr	r1, .L147+4
	ldr	r0, .L147+24
	bl	printk
.L131:
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L133:
	bl	ktime_get
	cmp	r8, r0
	sbcs	r3, r9, r1
	bge	.L135
	ldr	r3, [r4, #60]
	ldr	r2, [r5, #156]
	add	r3, r3, r2
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r3, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r2, r3, #29
	bmi	.L136
	movs	r1, #44
	mov	r0, r4
	bl	mpp_read
	movw	r2, #1877
	ldr	r1, .L147+4
	mvn	r7, #109
	mov	r3, r0
	ldr	r0, .L147+28
	bl	printk
	b	.L134
.L135:
	b	.L138
.L148:
	.align	2
.L147:
	.word	mpp_dev_debug
	.word	.LANCHOR0+94
	.word	.LC38
	.word	1000000
	.word	arm_delay_ops
	.word	1073740
	.word	.LC40
	.word	.LC39
	.fnend
	.size	rkvenc_reset, .-rkvenc_reset
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_set_freq, %function
rkvenc_set_freq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	adds	r0, r0, #152
	ldr	r1, [r1, #312]
	bl	mpp_clk_set_rate
	ldr	r1, [r5, #312]
	add	r0, r4, #208
	bl	mpp_clk_set_rate
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkvenc_set_freq, .-rkvenc_set_freq
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	clk_prepare_enable, %function
clk_prepare_enable:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	bl	clk_prepare
	mov	r4, r0
	cbnz	r0, .L150
	mov	r0, r5
	bl	clk_enable
	mov	r4, r0
	cbz	r0, .L150
	mov	r0, r5
	bl	clk_unprepare
.L150:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
	.fnend
	.size	clk_prepare_enable, .-clk_prepare_enable
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_remove, %function
rkvenc_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r0, #80]
	ldr	r0, [r4, #340]
	cbz	r0, .L156
	bl	iounmap
.L156:
	ldr	r1, .L168
	add	r0, r5, #16
	bl	_dev_info
	mov	r0, r4
	bl	mpp_dev_remove
	ldr	r0, [r4, #240]
	cbz	r0, .L157
	bl	proc_remove
	movs	r3, #0
	str	r3, [r4, #240]
.L157:
	ldr	r0, [r4, #260]
	cbz	r0, .L158
	bl	rk_dvbm_put
	movs	r3, #0
	str	r3, [r4, #260]
.L158:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L169:
	.align	2
.L168:
	.word	.LC41
	.fnend
	.size	rkvenc_remove, .-rkvenc_remove
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_probe, %function
rkvenc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	add	r5, r0, #16
	ldr	r6, .L216
	.pad #64
	sub	sp, sp, #64
	ldr	r1, .L216+4
	mov	r7, r0
	mov	r0, r5
	ldr	r3, [r6]
	mov	r8, r6
	str	r3, [sp, #60]
	bl	_dev_info
	mov	r2, #3520
	mov	r1, #352
	mov	r0, r5
	bl	devm_kmalloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L188
	str	r0, [r7, #80]
	mov	r0, r5
	bl	mpp_dev_of_node
	cbz	r0, .L172
	mov	r1, r5
	ldr	r0, .L216+8
	bl	of_match_device
	cbnz	r0, .L173
	ldr	r1, .L216+12
	mov	r0, r5
	bl	_dev_err
	mvn	r6, #18
.L171:
	mov	r0, r5
	ldr	r1, .L216+16
	bl	_dev_info
	mov	r0, r6
	ldr	r2, [sp, #60]
	ldr	r3, [r8]
	cmp	r2, r3
	beq	.L187
	bl	__stack_chk_fail
.L173:
	ldr	r3, [r0, #192]
	str	r3, [r4, #4]
.L172:
	mov	r1, r7
	mov	r0, r4
	bl	mpp_dev_probe
	mov	r6, r0
	cmp	r0, #0
	bne	.L171
	movs	r1, #4
	ldr	r0, .L216+20
	bl	ioremap
	str	r0, [r4, #340]
	cbz	r0, .L174
	.syntax unified
@ 2212 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_rkvenc_500.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r2, #257
	ldr	r3, [r4, #340]
	.syntax unified
@ 95 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	str r2, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
.L175:
	add	r3, r4, #16
	movs	r2, #20
	movs	r1, #0
	mov	r0, r3
	bl	memset
	ldr	r3, .L216+24
	str	r3, [r4, #24]
	ldr	r3, [r7, #60]
	str	r0, [r4, #16]
	str	r0, [r4, #20]
	cbnz	r3, .L176
	ldr	r3, [r7, #16]
.L176:
	strd	r3, r4, [sp, #4]
	mov	r0, r5
	mov	r3, #8192
	ldr	r2, .L216+28
	str	r3, [sp]
	movs	r3, #0
	ldr	r1, [r4, #48]
	bl	devm_request_threaded_irq
	mov	r6, r0
	cbz	r0, .L177
	mov	r0, r5
	ldr	r1, .L216+32
	bl	_dev_err
	mov	r0, r4
	bl	mpp_dev_remove
	b	.L171
.L174:
	ldr	r1, .L216+36
	ldr	r0, [r4]
	bl	_dev_err
	b	.L175
.L177:
	ldr	r0, [r4]
	cbz	r0, .L178
	ldr	r0, [r0, #356]
.L178:
	movs	r2, #0
	ldr	r1, .L216+40
	bl	of_parse_phandle
	mov	r7, r0
	cmp	r0, #0
	bne	.L179
.L181:
	movw	r2, #2069
	ldr	r1, .L216+44
	ldr	r0, .L216+48
	bl	printk
.L180:
	ldr	r3, [r4, #4]
	ldr	r0, [r4]
	ldr	r3, [r3, #4]
	str	r3, [r4, #148]
	ldr	r2, [r3, #12]
	str	r2, [r4, #344]
	ldr	r3, [r3, #16]
	str	r3, [r4, #344]
	cbz	r0, .L183
	bl	mpp_dev_of_node
	cbz	r0, .L183
	ldr	r3, [r4, #92]
	cbz	r3, .L183
	ldr	r3, [r3, #76]
	cbz	r3, .L183
	ldr	r0, [r4]
	bl	mpp_dev_of_node
	ldr	r3, [r0]
	cbz	r3, .L183
	ldr	r2, [r4, #104]
	movs	r1, #31
	add	r0, sp, #28
	str	r2, [sp]
	ldr	r2, .L216+52
	bl	snprintf
	ldr	r3, [r4, #92]
	ldr	r1, [r3, #76]
	add	r0, sp, #28
	bl	proc_mkdir
	mov	r2, r0
	str	r0, [r4, #240]
	cbz	r0, .L185
	cmn	r0, #4096
	bls	.L186
.L185:
	movw	r2, #1783
	ldr	r1, .L216+56
	ldr	r0, .L216+60
	bl	printk
	movs	r3, #0
	str	r3, [r4, #240]
.L183:
	ldr	r1, [r4, #92]
	mov	r0, r4
	bl	mpp_dev_register_srv
	b	.L171
.L179:
	bl	of_device_is_available
	cmp	r0, #0
	beq	.L181
	mov	r0, r7
	bl	of_find_device_by_node
	movs	r1, #1
	bl	rk_dvbm_get_port
	str	r0, [r4, #260]
	cmp	r0, #0
	beq	.L180
	ldr	r3, .L216+64
	add	r1, sp, #16
	strd	r3, r4, [sp, #16]
	bl	rk_dvbm_set_cb
	movs	r3, #0
	str	r3, [r4, #264]
	b	.L180
.L186:
	add	r3, r4, #152
	mov	r1, #420
	ldr	r0, .L216+68
	bl	mpp_procfs_create_clk_rw
	add	r3, r4, #208
	ldr	r2, [r4, #240]
	mov	r1, #420
	ldr	r0, .L216+72
	bl	mpp_procfs_create_clk_rw
	add	r3, r4, #180
	ldr	r2, [r4, #240]
	mov	r1, #420
	ldr	r0, .L216+76
	bl	mpp_procfs_create_clk_rw
	add	r3, r4, #108
	ldr	r2, [r4, #240]
	mov	r1, #420
	ldr	r0, .L216+80
	bl	mpp_procfs_create_u32
	add	r3, r4, #344
	ldr	r2, [r4, #240]
	mov	r1, #420
	ldr	r0, .L216+84
	bl	mpp_procfs_create_u32
	add	r3, r4, #348
	ldr	r2, [r4, #240]
	mov	r1, #420
	ldr	r0, .L216+88
	bl	mpp_procfs_create_u32
	ldr	r3, .L216+92
	mov	r1, #292
	ldr	r0, .L216+96
	str	r4, [sp]
	ldr	r2, [r4, #240]
	bl	proc_create_single_data
	b	.L183
.L188:
	mvn	r6, #11
	b	.L171
.L187:
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L217:
	.align	2
.L216:
	.word	__stack_chk_guard
	.word	.LC42
	.word	.LANCHOR0+108
	.word	.LC43
	.word	.LC57
	.word	540344328
	.word	mpp_rkvenc_worker
	.word	rkvenc_500_irq
	.word	.LC45
	.word	.LC44
	.word	.LC46
	.word	.LANCHOR0+500
	.word	.LC47
	.word	.LC48
	.word	.LANCHOR0+517
	.word	.LC49
	.word	rkvenc_dvbm_callback
	.word	.LC50
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	rkvenc_show_session_info
	.word	.LC56
	.fnend
	.size	rkvenc_probe, .-rkvenc_probe
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_show_session_info, %function
rkvenc_show_session_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	ldr	r5, [r0, #64]
	ldr	r0, [r5, #92]
	adds	r0, r0, #144
	bl	mutex_lock
	ldr	r3, [r5, #92]
	ldr	r0, [r3, #156]
	ldr	r4, [r0], #-48
	subs	r4, r4, #48
.L219:
	ldr	r2, [r5, #92]
	add	r3, r0, #48
	add	r1, r2, #156
	cmp	r3, r1
	bne	.L221
	add	r0, r2, #144
	bl	mutex_unlock
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L221:
	ldr	r3, [r0]
	cmp	r3, #1
	bne	.L220
	ldr	r3, [r0, #56]
	cbz	r3, .L220
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #60]
	cbz	r3, .L220
	mov	r1, r6
	blx	r3
.L220:
	ldr	r3, [r4, #48]
	mov	r0, r4
	sub	r4, r3, #48
	b	.L219
	.fnend
	.size	rkvenc_show_session_info, .-rkvenc_show_session_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_control, %function
rkvenc_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	movw	r2, #1028
	ldr	r3, [r1]
	mov	r4, r0
	mov	r5, r1
	cmp	r3, r2
	beq	.L229
	movw	r2, #1029
	cmp	r3, r2
	beq	.L230
	movw	r2, #1474
	ldr	r1, .L240
	ldr	r0, .L240+4
	bl	printk
	b	.L228
.L229:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, [r4, #16]!
	mov	r10, #1
	ldr	r9, .L240+8
	ldr	r6, [r5], #-4
	subs	r6, r6, #4
.L232:
	adds	r3, r5, #4
	cmp	r3, r4
	bne	.L234
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L228:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L234:
	ldr	r3, [r5, #20]
	lsls	r3, r3, #30
	bmi	.L233
	ldr	r1, [r5, #100]
	mov	r0, r9
	bl	printk
	str	r10, [r5, #136]
.L233:
	ldr	r3, [r6, #4]
	mov	r5, r6
	subs	r6, r3, #4
	b	.L232
.L230:
	movs	r1, #96
	ldr	r0, [r0, #12]
	bl	mpp_read
	ldr	r3, [r4, #76]
	cmp	r3, #2
	mov	r1, r0
	beq	.L228
	ldr	r3, [r5, #16]
	ldr	r0, [r4, #12]
	ldr	r3, [r3]
	cbz	r3, .L236
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	rkvenc_connect_dvbm
.L236:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	rkvenc_disconnect_dvbm
.L241:
	.align	2
.L240:
	.word	.LANCHOR0+536
	.word	.LC59
	.word	.LC58
	.fnend
	.size	rkvenc_control, .-rkvenc_control
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_finish, %function
rkvenc_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r3, .L261
	mov	r4, r1
	ldr	r2, [r3]
	mov	r9, r3
	tst	r2, #32
	beq	.L243
	movw	r2, #1358
	ldr	r1, .L261+4
	ldr	r0, .L261+8
	bl	printk
.L243:
	ldr	r5, [r4, #976]
	cbnz	r5, .L244
	mov	r10, r4
.L245:
	ldr	r3, [r4, #644]
	cmp	r5, r3
	bcc	.L250
	ldr	r3, [r4, #164]
	mov	r0, r4
	ldr	r1, [r3, #156]
	bl	rkvenc_get_class_reg
	cbz	r0, .L251
	ldr	r3, [r4, #316]
	str	r3, [r0]
.L251:
	movs	r3, #0
	str	r3, [r8, #256]
	ldr	r3, [r9]
	lsls	r3, r3, #26
	bpl	.L246
	movw	r2, #1386
	ldr	r1, .L261+4
	ldr	r0, .L261+12
	bl	printk
	b	.L246
.L244:
	movw	r1, #16496
	mov	r0, r8
	bl	mpp_read
	movs	r2, #0
	mov	r1, #1328
	str	r0, [r5, #112]
	mov	r0, r8
	bl	mpp_write
	movs	r3, #0
	str	r3, [r8, #256]
.L246:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L250:
	ldr	fp, [r10, #664]
	movs	r6, #0
.L247:
	ldr	r3, [r10, #656]
	cmp	r6, r3, lsr #2
	bcc	.L249
	adds	r5, r5, #1
	add	r10, r10, #20
	b	.L245
.L249:
	ldr	r7, [r10, #660]
	mov	r0, r8
	add	r7, r7, r6, lsl #2
	mov	r1, r7
	bl	mpp_read_relaxed
	str	r0, [fp, r6, lsl #2]
	ldr	r3, [r4, #164]
	ldr	r3, [r3, #156]
	cmp	r7, r3
	itt	eq
	ldreq	r3, [r4, #316]
	streq	r3, [fp, r6, lsl #2]
	adds	r6, r6, #1
	b	.L247
.L262:
	.align	2
.L261:
	.word	mpp_dev_debug
	.word	.LANCHOR0+551
	.word	.LC38
	.word	.LC40
	.fnend
	.size	rkvenc_finish, .-rkvenc_finish
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_result, %function
rkvenc_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r7, .L282
	ldr	r2, [r7]
	lsls	r1, r2, #26
	bpl	.L264
	movw	r2, #1399
	ldr	r1, .L282+4
	ldr	r0, .L282+8
	bl	printk
.L264:
	ldr	r3, [r4, #976]
	cbz	r3, .L265
	add	r5, r4, #656
	movs	r6, #0
.L266:
	ldr	r3, [r4, #644]
	adds	r5, r5, #20
	cmp	r6, r3
	bcc	.L269
.L265:
	ldr	r3, [r4, #20]
	lsls	r2, r3, #25
	bpl	.L281
.L271:
	mov	r4, #-1
	b	.L263
.L269:
	ldr	r1, [r4, #976]
	adds	r6, r6, #1
	ldr	r2, [r5, #-20]
	adds	r1, r1, #112
	ldr	r0, [r5, #-12]
	bl	memcpy
	b	.L266
.L281:
	ldr	r4, [r4, #24]
	cmp	r4, #0
	bne	.L271
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L263
	movw	r2, #1417
	ldr	r1, .L282+4
	ldr	r0, .L282+12
	bl	printk
.L263:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L283:
	.align	2
.L282:
	.word	mpp_dev_debug
	.word	.LANCHOR0+565
	.word	.LC38
	.word	.LC40
	.fnend
	.size	rkvenc_result, .-rkvenc_result
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_init, %function
rkvenc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r6, r0
	mov	r4, r0
	ldr	r0, [r6], #152
	bl	mpp_dev_of_node
	ldr	r2, .L300
	mov	r1, r6
	mov	r8, r0
	mov	r0, r4
	bl	mpp_get_clk_info
	cbz	r0, .L285
	movw	r2, #1833
	ldr	r1, .L300+4
	ldr	r0, .L300+8
	bl	printk
.L285:
	ldr	r2, .L300+12
	add	r1, r4, #180
	mov	r0, r4
	bl	mpp_get_clk_info
	cbz	r0, .L286
	movw	r2, #1836
	ldr	r1, .L300+4
	ldr	r0, .L300+16
	bl	printk
.L286:
	add	r7, r4, #208
	ldr	r2, .L300+20
	mov	r0, r4
	mov	r1, r7
	bl	mpp_get_clk_info
	cbz	r0, .L287
	movw	r2, #1839
	ldr	r1, .L300+4
	ldr	r0, .L300+24
	bl	printk
.L287:
	movs	r5, #0
	movs	r3, #1
	add	r2, r4, #236
	ldr	r1, .L300+28
	str	r5, [sp]
	mov	r0, r8
	bl	of_property_read_variable_u32_array
	ldr	r2, .L300+32
	mov	r1, r5
	mov	r0, r6
	bl	mpp_set_clk_info_rate_hz
	ldr	r2, .L300+36
	mov	r1, r5
	mov	r0, r7
	bl	mpp_set_clk_info_rate_hz
	ldr	r2, .L300+40
	mov	r1, r5
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #244]
	cbnz	r0, .L288
	movw	r2, #1851
	ldr	r1, .L300+4
	ldr	r0, .L300+44
	bl	printk
.L288:
	ldr	r2, .L300+48
	movs	r1, #1
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #248]
	cbnz	r0, .L289
	movw	r2, #1854
	ldr	r1, .L300+4
	ldr	r0, .L300+52
	bl	printk
.L289:
	ldr	r2, .L300+56
	movs	r1, #2
	mov	r0, r4
	bl	mpp_reset_control_get
	str	r0, [r4, #252]
	cbnz	r0, .L290
	movw	r2, #1857
	ldr	r1, .L300+4
	ldr	r0, .L300+60
	bl	printk
.L290:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L301:
	.align	2
.L300:
	.word	.LC60
	.word	.LANCHOR0+579
	.word	.LC61
	.word	.LC62
	.word	.LC63
	.word	.LC51
	.word	.LC64
	.word	.LC65
	.word	300000000
	.word	600000000
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC69
	.word	.LC70
	.word	.LC71
	.fnend
	.size	rkvenc_init, .-rkvenc_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_run, %function
rkvenc_run:
	.fnstart
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #92
	sub	sp, sp, #92
	ldr	r3, [r0, #148]
	mov	r4, r0
	ldr	r7, [r1]
	mov	r5, r1
	str	r3, [sp, #16]
	ldr	r3, [r7, #56]
	str	r3, [sp, #12]
	ldr	r3, .L368
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #32
	beq	.L303
	mov	r2, #928
	ldr	r1, .L368+4
	ldr	r0, .L368+8
	bl	printk
.L303:
	ldr	r3, [r7, #76]
	cbz	r3, .L304
	mov	r1, #776
	mov	r0, r5
	ldrd	r9, r6, [r5, #140]
	bl	rkvenc_get_class_reg
	cmp	r6, #255
	mov	r10, r0
	bls	.L305
	mov	r3, r6
	movw	r2, #938
	ldr	r1, .L368+4
	uxtb	r6, r6
	ldr	r0, .L368+12
	bl	printk
.L305:
	cmp	r9, #1
	bls	.L306
	mov	r3, r9
	movw	r2, #943
	ldr	r1, .L368+4
	and	r9, r9, #1
	ldr	r0, .L368+16
	bl	printk
.L306:
	ldr	r3, [r7, #76]
	cmp	r3, #1
	ittt	eq
	ldreq	r3, [r10]
	orreq	r3, r3, #8448
	streq	r3, [r10]
	ldr	r3, [r10]
	orrs	r6, r6, r3
	orr	r6, r6, r9, lsl #12
	str	r6, [r10]
.L304:
	mov	r9, #0
	mov	r10, r5
	mov	fp, r9
.L308:
	ldr	r3, [r5, #320]
	cmp	r3, fp
	bhi	.L318
	ldr	r2, [sp, #12]
	movs	r3, #1
	str	r5, [r4, #80]
	str	r3, [r2, #24]
	str	r9, [r2, #16]
	cmp	r9, #0
	beq	.L319
	ldr	r3, [r5, #140]
	add	r2, sp, #56
	movs	r1, #17
	movs	r0, #0
	ldr	r6, [r7, #76]
	str	r3, [sp, #84]
	bl	rk_dvbm_ctrl
	ldr	r3, [sp, #60]
	cbz	r3, .L320
	ldr	r3, [sp, #72]
	cbnz	r3, .L321
.L320:
	ldr	r1, .L368+20
	ldr	r0, [r4]
	bl	_dev_err
.L321:
	ldr	r2, [sp, #56]
	mov	r1, #624
	mov	r0, r4
	bl	mpp_write_relaxed
	mov	r1, #628
	mov	r0, r4
	ldr	r2, [sp, #68]
	bl	mpp_write_relaxed
	mov	r1, #632
	mov	r0, r4
	ldr	r2, [sp, #60]
	bl	mpp_write_relaxed
	mov	r1, #636
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write_relaxed
	cmp	r6, #2
	bne	.L322
	ldr	r2, [sp, #64]
	mov	r1, #640
	mov	r0, r4
	bl	mpp_write_relaxed
	mov	r1, #644
	mov	r0, r4
	ldr	r2, [sp, #76]
	bl	mpp_write_relaxed
	mov	r1, #648
	mov	r0, r4
	ldr	r2, [sp, #76]
	bl	mpp_write_relaxed
.L322:
	movw	r1, #1148
	mov	r0, r4
	bl	mpp_read_relaxed
	cmp	r0, #0
	bge	.L324
	ldr	r2, [sp, #60]
	mov	r1, #1040
	mov	r0, r4
	bl	mpp_write_relaxed
	movw	r1, #1044
	mov	r0, r4
	ldr	r2, [sp, #72]
	bl	mpp_write_relaxed
	mov	r1, #1048
	mov	r0, r4
	ldr	r2, [sp, #56]
	bl	mpp_write_relaxed
	movw	r1, #1052
	mov	r0, r4
	ldr	r2, [sp, #68]
	bl	mpp_write_relaxed
	cmp	r6, #2
	bne	.L324
	ldr	r2, [sp, #64]
	mov	r1, #1056
	mov	r0, r4
	bl	mpp_write_relaxed
	movw	r1, #1060
	mov	r0, r4
	ldr	r2, [sp, #76]
	bl	mpp_write_relaxed
	mov	r1, #1064
	mov	r0, r4
	ldr	r2, [sp, #76]
	bl	mpp_write_relaxed
.L324:
	ldr	r3, [r8]
	lsls	r6, r3, #24
	bpl	.L326
	ldr	r3, [r5, #144]
	ldr	r0, .L368+24
	str	r3, [sp]
	ldr	r1, [r7, #68]
	ldr	r3, [r5, #140]
	ldr	r2, [r5, #100]
	bl	printk
.L326:
	ldr	r3, [r7, #76]
	cmp	r3, #2
	bne	.L328
	.syntax unified
@ 998 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_rkvenc_500.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #96
	mov	r2, r9
	mov	r0, r4
	bl	mpp_write_relaxed
	movs	r3, #0
	str	r3, [r4, #268]
	movs	r3, #1
	str	r3, [r4, #116]
.L328:
	.syntax unified
@ 1009 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_rkvenc_500.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8]
	lsls	r2, r3, #17
	bpl	.L330
	mov	r0, r4
	bl	rkvenc_reg_dump
.L330:
	mvn	r3, #31
	str	r3, [r5, #28]
	add	r3, r5, #32
	str	r3, [r5, #32]
	str	r3, [r5, #36]
	mov	r2, #2097152
	ldr	r3, .L368+28
	add	r0, r5, #44
	ldr	r1, .L368+32
	str	r3, [r5, #40]
	movs	r3, #0
	str	r3, [sp]
	bl	init_timer_key
	ldr	r1, .L368+36
	movs	r3, #20
	add	r2, r5, #28
	movs	r0, #1
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	add	r1, r5, #20
	movs	r0, #1
	bl	____atomic_set_bit
	cmp	r9, #0
	beq	.L331
	ldr	r3, [r7, #76]
	cmp	r3, #1
	bne	.L332
.L331:
	ldr	r3, [sp, #16]
	mov	r2, #256
	mov	r0, r4
	ldr	r1, [r3, #136]
	bl	mpp_write
.L332:
	movs	r3, #1
	str	r3, [r4, #256]
	cmp	r9, #0
	bne	.L333
.L335:
	ldr	r0, [r8]
	ands	r0, r0, #32
	beq	.L302
	movw	r2, #1025
	ldr	r1, .L368+4
	ldr	r0, .L368+40
	bl	printk
	movs	r0, #0
	b	.L302
.L318:
	ldr	r3, [r5, #164]
	movs	r2, #20
	movs	r1, #0
	add	r0, sp, #36
	ldr	r6, [r10, #336]
	str	r3, [sp, #20]
	bl	memset
	movs	r2, #0
	ldr	r3, [sp, #20]
	ldr	r0, [r3, #24]
.L309:
	cmp	r0, r2
	bne	.L312
	mvn	r0, #21
.L302:
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L312:
	ldr	r1, [r3, #28]
	cmp	r6, r1
	bcc	.L310
	ldr	r1, [r3, #32]
	cmp	r6, r1
	bhi	.L310
	add	r2, r5, r2, lsl #4
	ldr	r3, [r2, #176]
	ldr	r1, [r2, #180]
	str	r3, [sp, #44]
	subs	r6, r6, r1
	ldr	r3, [r2, #172]
	ldr	r2, [r10, #332]
	lsrs	r6, r6, #2
	str	r1, [sp, #48]
	str	r3, [sp, #52]
	add	r2, r6, r2, lsr #2
	str	r2, [sp, #20]
.L311:
	ldr	r2, [sp, #20]
	cmp	r6, r2
	bcc	.L317
	add	fp, fp, #1
	add	r10, r10, #20
	b	.L308
.L310:
	adds	r2, r2, #1
	adds	r3, r3, #8
	b	.L309
.L317:
	ldr	r0, [r5, #136]
	ldr	r1, [sp, #48]
	ldr	r2, [r3, r6, lsl #2]
	add	r1, r1, r6, lsl #2
	cbz	r0, .L314
	movw	r0, #1148
	cmp	r1, r0
	bne	.L314
	bic	r2, r2, #-2147483648
	str	r2, [r3, r6, lsl #2]
.L315:
	ldr	r2, [r3, r6, lsl #2]
	mov	r0, r4
	str	r3, [sp, #24]
	bl	mpp_write_relaxed
	mov	r2, r9
	ldr	r3, [sp, #24]
	b	.L316
.L314:
	cmp	r1, #96
	bne	.L315
	cbz	r2, .L316
	ldr	r1, [r7, #76]
	cmp	r1, #1
	bne	.L316
	mov	r1, r2
	mov	r0, r4
	str	r3, [sp, #28]
	str	r2, [sp, #24]
	bl	rkvenc_connect_dvbm
	ldrd	r2, r3, [sp, #24]
.L316:
	adds	r6, r6, #1
	mov	r9, r2
	b	.L311
.L369:
	.align	2
.L368:
	.word	mpp_dev_debug
	.word	.LANCHOR0+591
	.word	.LC38
	.word	.LC72
	.word	.LC73
	.word	.LC74
	.word	.LC75
	.word	rkvenc_task_timeout
	.word	delayed_work_timer_fn
	.word	system_wq
	.word	.LC40
.L319:
	ldr	r3, [r8]
	lsls	r1, r3, #24
	bpl	.L328
	ldr	r2, [r5, #100]
	ldr	r1, [r7, #68]
	ldr	r0, .L370
	bl	printk
	b	.L328
.L333:
	ldr	r3, [r8]
	lsls	r3, r3, #15
	bpl	.L335
	ldr	r0, .L370+4
	movw	r5, #20840
	bl	printk
	movs	r1, #96
	mov	r0, r4
	ldr	r7, .L370+8
	bl	mpp_read
	movs	r1, #96
	movw	r6, #20928
	mov	r2, r0
	ldr	r0, .L370+8
	bl	printk
	mov	r1, #776
	mov	r0, r4
	bl	mpp_read
	mov	r1, #776
	mov	r2, r0
	ldr	r0, .L370+8
	bl	printk
	movw	r1, #16416
	mov	r0, r4
	bl	mpp_read
	movw	r1, #16416
	mov	r2, r0
	ldr	r0, .L370+8
	bl	printk
.L336:
	mov	r1, r5
	mov	r0, r4
	bl	mpp_read
	mov	r1, r5
	adds	r5, r5, #4
	mov	r2, r0
	mov	r0, r7
	bl	printk
	cmp	r5, r6
	bne	.L336
	b	.L335
.L371:
	.align	2
.L370:
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.fnend
	.size	rkvenc_run, .-rkvenc_run
	.section	.text.unlikely
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_shutdown, %function
rkvenc_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r4, r0, #16
	ldr	r5, [r0, #80]
	ldr	r1, .L383
	mov	r0, r4
	bl	_dev_info
	ldr	r3, [r5, #92]
	add	r2, r3, #84
	pld	[r2]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r1, [r2]
	add	r1, r1, #1
	strex	r0, r1, [r2]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bl	ktime_get
	ldr	r3, .L383+4
	adds	r6, r0, r3
	mov	r3, #0
	adc	r7, r1, r3
.L378:
	ldr	r3, [r5, #72]
	cbz	r3, .L374
	bl	ktime_get
	cmp	r6, r0
	sbcs	r3, r7, r1
	bge	.L375
	ldr	r3, [r5, #72]
	cbnz	r3, .L382
.L374:
	mov	r0, r4
	ldr	r1, .L383+8
	pop	{r3, r4, r5, r6, r7, lr}
	b	_dev_info
.L375:
	mov	r1, #1000
	movs	r0, #251
	bl	usleep_range
	b	.L378
.L382:
	ldr	r1, .L383+12
	mov	r0, r4
	bl	_dev_err
	b	.L374
.L384:
	.align	2
.L383:
	.word	.LC79
	.word	200000000
	.word	.LC81
	.word	.LC80
	.fnend
	.size	rkvenc_shutdown, .-rkvenc_shutdown
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clk_off, %function
rkvenc_clk_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, [r0, #152]
	mov	r0, r5
	bl	clk_disable
	mov	r0, r5
	bl	clk_unprepare
	ldr	r5, [r4, #180]
	mov	r0, r5
	bl	clk_disable
	mov	r0, r5
	bl	clk_unprepare
	ldr	r4, [r4, #208]
	mov	r0, r4
	bl	clk_disable
	mov	r0, r4
	bl	clk_unprepare
	movs	r0, #0
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkvenc_clk_off, .-rkvenc_clk_off
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_clk_on, %function
rkvenc_clk_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0, #152]
	cbz	r0, .L387
	bl	clk_prepare_enable
.L387:
	ldr	r0, [r4, #180]
	cbz	r0, .L388
	bl	clk_prepare_enable
.L388:
	ldr	r0, [r4, #208]
	cbz	r0, .L389
	bl	clk_prepare_enable
.L389:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	rkvenc_clk_on, .-rkvenc_clk_on
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_init_session, %function
rkvenc_init_session:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r0
	cbnz	r0, .L400
	movw	r2, #1561
	ldr	r1, .L431
	ldr	r0, .L431+4
	bl	printk
	mvn	r0, #21
.L399:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L400:
	ldr	r6, .L431+8
	mov	r1, #3520
	ldr	r0, [r6, #4]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L402
	mov	r2, #1568
	ldr	r1, .L431
	ldr	r0, .L431+12
	bl	printk
.L417:
	mvn	r0, #11
	b	.L399
.L402:
	ldr	r2, .L431+16
	add	r8, r4, #60
	ldr	r1, .L431+20
	movs	r7, #0
	bl	__init_rwsem
	ldr	r9, [r4, #12]
	str	r5, [r4, #56]
.L410:
	mov	r1, #3520
	ldr	r0, [r6, #40]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L403
	ldr	r1, .L431+24
	mov	r3, r7
	ldr	r0, .L431+28
	mov	r2, #1512
.L430:
	bl	printk
	ldr	r5, [r4, #60]
	cbz	r5, .L411
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	ldr	r0, [r5, #976]
	cmp	r0, #0
	bne	.L412
.L413:
	mov	r0, r5
	bl	kfree
.L411:
	ldr	r5, [r4, #64]
	cbz	r5, .L414
	mov	r0, r5
	bl	rkvenc_invalid_class_msg
	ldr	r0, [r5, #976]
	cbz	r0, .L415
	bl	kfree
.L415:
	mov	r0, r5
	bl	kfree
.L414:
	ldr	r0, [r4, #56]
	cmp	r0, #0
	beq	.L417
	bl	kfree
	b	.L417
.L416:
	movs	r7, #1
	b	.L410
.L403:
	ldr	r3, [r9, #4]
	mov	ip, #0
	ldr	lr, [r3, #4]
	mov	r3, lr
	str	lr, [r0, #164]
.L405:
	ldr	r2, [lr, #24]
	cmp	ip, r2
	bcc	.L407
	ldrb	r3, [r4, #80]	@ zero_extendqisi2
	cbz	r3, .L408
	mov	r1, #3520
	ldr	r0, [r6, #28]
	bl	kmem_cache_alloc
	cbnz	r0, .L409
	mov	r3, r7
	movw	r2, #1529
	ldr	r1, .L431+24
	ldr	r0, .L431+32
	b	.L430
.L407:
	ldr	r2, [r0, #172]
	cbnz	r2, .L406
	ldr	r2, [r3, #32]
	ldr	r1, [r3, #28]
	adds	r2, r2, #4
	subs	r1, r2, r1
	str	r1, [r0, #176]
.L406:
	add	ip, ip, #1
	adds	r3, r3, #8
	adds	r0, r0, #16
	b	.L405
.L409:
	str	r0, [r5, #976]
.L408:
	str	r5, [r8], #4
	cmp	r7, #0
	beq	.L416
	movs	r0, #0
	b	.L399
.L412:
	bl	kfree
	b	.L413
.L432:
	.align	2
.L431:
	.word	.LANCHOR0+602
	.word	.LC82
	.word	kmalloc_caches
	.word	.LC83
	.word	.LANCHOR2
	.word	.LC84
	.word	.LANCHOR0+622
	.word	.LC85
	.word	.LC86
	.fnend
	.size	rkvenc_init_session, .-rkvenc_init_session
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_init_task, %function
rkvenc_init_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r6, .L505
	.pad #28
	sub	sp, sp, #28
	mov	r8, r1
	ldr	r7, [r0, #12]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L434
	mov	r2, #708
	ldr	r1, .L505+4
	ldr	r0, .L505+8
	bl	printk
.L434:
	ldr	r4, [r5, #60]
	ldr	r3, [r4, #20]
	cbz	r3, .L435
	ldr	r4, [r5, #64]
	ldr	r3, [r4, #20]
	cbnz	r3, .L436
.L435:
	add	r1, r4, #144
	mov	r2, r4
	movs	r3, #0
.L437:
	str	r3, [r2, #168]
	adds	r2, r2, #16
	cmp	r2, r1
	bne	.L437
	strd	r3, r3, [r4, #316]
	str	r3, [r4, #644]
	b	.L438
.L436:
	movw	r2, #651
	ldr	r1, .L505+12
	ldr	r0, .L505+16
	movs	r4, #0
	bl	printk
.L438:
	mov	r1, r4
	mov	r0, r5
	str	r4, [sp, #16]
	bl	mpp_task_init
	ldr	r3, [r7, #4]
	movs	r7, #1
	ldr	r9, [r3, #4]
	movs	r3, #0
	strd	r7, r3, [r4, #132]
	str	r9, [r4, #96]
	str	r9, [r4, #164]
	ldrb	r2, [r5, #80]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L439
	ldr	r7, [r4, #976]
	mov	r5, r8
	ldr	r9, .L505+40
	mov	r6, r3
	ldr	r10, .L505+44
.L440:
	ldr	r3, [r8, #36]
	cmp	r6, r3
	bcc	.L446
	movs	r3, #0
	str	r3, [r4, #132]
.L433:
	ldr	r0, [sp, #16]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L446:
	ldr	r3, [r5, #56]
	cbz	r3, .L441
	ldr	r2, [r5, #48]
	cmp	r2, #512
	beq	.L442
	movw	r3, #513
	cmp	r2, r3
	beq	.L443
.L441:
	adds	r6, r6, #1
	adds	r5, r5, #20
	b	.L440
.L442:
	cmp	r3, #112
	beq	.L444
	movw	r2, #681
	mov	r1, r9
	mov	r0, r10
	bl	printk
.L444:
	ldr	r2, [r5, #56]
	mov	r0, r7
	ldr	r1, [r5, #64]
	bl	memcpy
	b	.L441
.L443:
	ldr	r3, [r4, #644]
	add	r1, r5, #68
	adds	r2, r3, #1
	str	r2, [r4, #644]
	movs	r2, #20
	mla	r3, r2, r3, r4
	add	r2, r5, #48
	add	r3, r3, #648
.L445:
	ldr	r0, [r2], #4	@ unaligned
	cmp	r2, r1
	str	r0, [r3], #4	@ unaligned
	bne	.L445
	b	.L441
.L439:
	ldr	r3, [r6]
	lsls	r0, r3, #26
	bpl	.L448
	movw	r2, #563
	ldr	r1, .L505+20
	ldr	r0, .L505+8
	bl	printk
.L448:
	add	r5, r8, #48
	mov	r10, #20
	movs	r3, #0
	str	r3, [sp, #8]
	add	r3, r4, #168
	str	r3, [sp, #20]
.L449:
	ldr	r3, [r8, #36]
	ldr	r2, [sp, #8]
	cmp	r2, r3
	bcc	.L463
	ldr	r3, [r6]
	lsls	r1, r3, #22
	bpl	.L464
	ldr	r2, [r4, #644]
	ldr	r1, [r4, #320]
	ldr	r0, .L505+24
	bl	printk
.L464:
	ldr	r3, [r6]
	lsls	r2, r3, #26
	bpl	.L465
	movw	r2, #606
	ldr	r1, .L505+20
	ldr	r0, .L505+8
	bl	printk
.L465:
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #164]
	str	r3, [r4, #104]
	ldr	r2, [r0, #120]
	add	r2, r4, r2, lsl #4
	ldrd	r3, r1, [r2, #172]
	cbz	r3, .L466
	cmp	r1, #0
	bne	.L467
.L466:
	str	r1, [sp]
	movw	r2, #623
	ldr	r1, .L505+28
	ldr	r0, .L505+32
.L504:
.L468:
	bl	printk
	mov	r0, r4
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #16]
	b	.L433
.L463:
	ldr	r3, [r5, #8]
	cbz	r3, .L451
	ldr	r3, [r5]
	cmp	r3, #512
	beq	.L472
	movw	r2, #513
	cmp	r3, r2
	beq	.L473
.L451:
	ldr	r3, [sp, #8]
	adds	r5, r5, #20
	adds	r3, r3, #1
	str	r3, [sp, #8]
	b	.L449
.L459:
	ldr	r2, [r4, #164]
	ldr	r3, [r5, #12]
	add	r2, r2, r7, lsl #3
	ldr	r1, [r2, #32]
	cmp	r1, r3
	bcc	.L454
	ldr	r1, [r5, #8]
	ldr	r2, [r2, #28]
	add	r3, r3, r1
	subs	r3, r3, #4
	cmp	r2, r3
	bhi	.L454
	ldr	r3, [r4, #320]
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	mul	fp, r10, r3
	str	r3, [sp, #12]
	add	r3, fp, #324
	add	fp, fp, r4
	add	r3, r3, r4
	bl	rkvenc_update_req
	ldr	r1, [r4, #164]
	ldr	r2, [fp, #336]
	movs	r3, #0
	ldr	ip, [r1, #24]
.L455:
	cmp	ip, r3
	beq	.L457
	ldr	r0, [r1, #28]
	cmp	r2, r0
	bcc	.L456
	ldr	r0, [r1, #32]
	cmp	r2, r0
	bhi	.L456
	ldr	r1, [sp, #12]
	add	r3, r4, r3, lsl #4
	mla	r1, r10, r1, r4
	ldr	r1, [r1, #340]
	str	r2, [r3, #180]
	rsb	r2, r2, #4
	add	r2, r2, r0
	str	r2, [r3, #176]
	str	r1, [r3, #172]
.L457:
	ldr	r2, [sp, #20]
	lsls	r3, r7, #4
	mov	r1, r2
	movs	r2, #1
	str	r2, [r1, r3]
	ldr	r3, [r4, #320]
	add	r3, r3, r2
	str	r3, [r4, #320]
.L454:
	adds	r7, r7, #1
.L452:
	ldr	r3, [r9, #24]
	cmp	r7, r3
	bcc	.L459
	b	.L451
.L456:
	adds	r3, r3, #1
	adds	r1, r1, #8
	b	.L455
.L472:
	movs	r7, #0
	b	.L452
.L462:
	ldr	r2, [r4, #164]
	ldr	r3, [r5, #12]
	add	r2, r2, r7, lsl #3
	ldr	r1, [r2, #32]
	cmp	r1, r3
	bcc	.L461
	ldr	r1, [r5, #8]
	ldr	r2, [r2, #28]
	add	r3, r3, r1
	subs	r3, r3, #4
	cmp	r2, r3
	bhi	.L461
	ldr	r3, [r4, #644]
	mov	r2, r5
	mov	r1, r7
	mov	r0, r4
	mla	r3, r10, r3, r4
	add	r3, r3, #648
	bl	rkvenc_update_req
	lsls	r3, r7, #4
	ldr	r2, [sp, #20]
	str	fp, [r2, r3]
	ldr	r3, [r4, #644]
	adds	r3, r3, #1
	str	r3, [r4, #644]
.L461:
	adds	r7, r7, #1
.L453:
	ldr	r3, [r9, #24]
	cmp	r7, r3
	bcc	.L462
	b	.L451
.L473:
	movs	r7, #0
	mov	fp, #1
	b	.L453
.L467:
	ldr	r1, [r2, #180]
	ldr	r2, [r0, #124]
	cmp	r1, r2
	bls	.L469
	str	r1, [sp]
	mov	r3, r2
	ldr	r1, .L505+28
	mov	r2, #628
	ldr	r0, .L505+36
	b	.L504
.L506:
	.align	2
.L505:
	.word	mpp_dev_debug
	.word	.LANCHOR0+644
	.word	.LC38
	.word	.LANCHOR0+661
	.word	.LC87
	.word	.LANCHOR0+704
	.word	.LC89
	.word	.LANCHOR0+728
	.word	.LC90
	.word	.LC91
	.word	.LANCHOR0+677
	.word	.LC88
.L469:
	subs	r2, r2, r1
	ldr	r1, [r0, #132]
	bic	r2, r2, #3
	ldr	r3, [r3, r2]
	ldr	r2, [r0, #128]
	mov	r0, r4
	lsrs	r3, r3, r2
	movs	r2, #1
	lsls	r2, r2, r1
	mov	r1, #768
	subs	r2, r2, #1
	ands	r3, r3, r2
	str	r3, [r4, #160]
	bl	rkvenc_get_class_reg
	ldr	r3, [r0]
	mov	r0, r4
	cmp	r3, #0
	itt	lt
	movlt	r3, #0
	strlt	r3, [r4, #132]
	ldr	r3, [r4, #160]
	cmp	r3, #2
	ite	ne
	movne	r1, #784
	moveq	r1, #1088
	bl	rkvenc_get_class_reg
	ldr	r3, [r0]
	ubfx	r3, r3, #0, #11
	adds	r3, r3, #1
	lsls	r3, r3, #3
	str	r3, [r4, #148]
	ldrh	r3, [r0, #2]
	ubfx	r3, r3, #0, #11
	adds	r3, r3, #1
	lsls	r3, r3, #3
	str	r3, [r4, #152]
	movs	r3, #3
	str	r3, [r4, #312]
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L433
	movw	r2, #749
	ldr	r1, .L507
	ldr	r0, .L507+4
	bl	printk
	b	.L433
.L508:
	.align	2
.L507:
	.word	.LANCHOR0+644
	.word	.LC40
	.fnend
	.size	rkvenc_init_task, .-rkvenc_init_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_task_timeout, %function
rkvenc_task_timeout:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r3, [r0, #104]
	mov	r5, r0
	str	r3, [sp, #20]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #-8]
	orr	r1, r3, #8
	str	r1, [r0, #-8]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r2, r3, #28
	bpl	.L510
	movw	r2, #1598
	ldr	r1, .L541
	ldr	r0, .L541+4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	printk
.L510:
	ldr	r6, [r0, #-28]
	sub	r8, r0, #28
	cbnz	r6, .L511
	ldr	r1, .L541
	mov	r3, r8
	ldr	r0, .L541+8
	movw	r2, #1603
.L540:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	printk
.L511:
	ldr	r1, [r0, #948]
	ldr	r2, .L541+12
	ldr	r3, .L541+16
	cmp	r1, #0
	it	eq
	moveq	r3, r2
	ldr	r2, [r0, #-8]
	ldr	r1, .L541
	str	r2, [sp, #8]
	ldr	r2, [r0, #72]
	ldr	r0, .L541+20
	strd	r3, r2, [sp]
	movw	r2, #1610
	ldr	r3, [r6, #68]
	bl	printk
	ldr	r4, [r6, #12]
	cbnz	r4, .L513
	mov	r3, r6
	movw	r2, #1613
	ldr	r1, .L541
	ldr	r0, .L541+24
	b	.L540
.L513:
	ldr	r0, [r4, #48]
	bl	disable_irq
	movs	r1, #96
	mov	r0, r4
	bl	mpp_read
	ldr	r2, .L541+28
	mov	r9, r0
	add	r3, sp, #40
	ldm	r2, {r0, r1, r2}
	and	r10, r9, #2
	stmdb	r3, {r0, r1, r2}
	mov	r1, #768
	mov	r0, r4
	bl	mpp_read
	movw	r1, #1148
	mov	r7, r0
	mov	r0, r4
	bl	mpp_read
	ubfx	r2, r9, #1, #1
	and	r1, r9, #1
	and	r7, r7, #3
	mov	fp, r0
	ldr	r0, .L541+32
	bl	printk
	lsr	r2, fp, #31
	ldr	r0, .L541+36
	add	r3, sp, #40
	add	r7, r3, r7, lsl #2
	ldr	r1, [r7, #-12]
	bl	printk
	cmp	r10, #0
	beq	.L514
	movs	r1, #24
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L541+40
	bl	printk
.L514:
	movw	r1, #16416
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L541+44
	bl	printk
	mov	r1, #20480
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L541+48
	bl	printk
	mov	r1, #20992
	mov	r0, r4
	bl	mpp_read
	mov	r1, r0
	ldr	r0, .L541+52
	bl	printk
	ldr	r3, .L541+56
	ldr	r3, [r3]
	lsls	r3, r3, #21
	bpl	.L515
	mov	r0, r4
	bl	rkvenc_reg_dump
.L515:
	subs	r5, r5, #8
	movs	r0, #6
	mov	r1, r5
	bl	____atomic_set_bit
	ldr	r3, [r6, #56]
	movs	r2, #0
	mov	r0, r8
	str	r2, [r3, #24]
	bl	mpp_time_diff
	mov	r1, r5
	movs	r0, #7
	bl	____atomic_set_bit
	mov	r1, r8
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_pop_running
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	cbz	r3, .L516
	mov	r1, r8
	mov	r0, r4
	blx	r3
.L516:
	ldr	r3, [r6, #96]
	cbz	r3, .L517
	ldr	r2, [sp, #20]
	cbz	r2, .L517
	movs	r2, #0
	ldr	r0, [r6, #68]
	mov	r1, r2
	blx	r3
.L517:
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #28]
	cbz	r3, .L518
	mov	r0, r4
	blx	r3
.L518:
	ldr	r3, [r6, #76]
	cmp	r3, #2
	bne	.L519
	mov	r0, r4
	bl	rkvenc_clear_dvbm_info
.L520:
	mov	r0, r4
	bl	mpp_taskqueue_trigger_work
	add	r0, r4, #120
	bl	up_read
	ldr	r0, [r4, #48]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	enable_irq
.L519:
	movs	r1, #0
	mov	r0, r4
	bl	rkvenc_disconnect_dvbm
	b	.L520
.L542:
	.align	2
.L541:
	.word	.LANCHOR0+751
	.word	.LC94
	.word	.LC95
	.word	.LC93
	.word	.LC92
	.word	.LC96
	.word	.LC97
	.word	.LANCHOR0+772
	.word	.LC99
	.word	.LC100
	.word	.LC101
	.word	.LC102
	.word	.LC103
	.word	.LC104
	.word	mpp_dev_debug
	.fnend
	.size	rkvenc_task_timeout, .-rkvenc_task_timeout
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_rkvenc_worker, %function
mpp_rkvenc_worker:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L575
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r0
	ldr	r2, [r3]
	.pad #36
	sub	sp, sp, #36
	sub	r4, r0, #16
	ldr	r8, [r0, #68]
	tst	r2, #32
	mov	r9, r3
	beq	.L544
	movw	r2, #1651
	ldr	r1, .L575+4
	ldr	r0, .L575+8
	bl	printk
.L544:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r7, #48]
	add	fp, r8, #60
	cbz	r3, .L545
	ldr	r3, [r8, #60]
	cmp	r3, fp
	beq	.L545
	ldr	r0, [r7, #32]
	bl	disable_irq
	mov	r0, r4
	bl	mpp_dev_reset
	ldr	r0, [r7, #32]
	bl	enable_irq
.L545:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r4
	bl	mpp_power_on
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #24]
	ldr	r3, [r8, #60]
	cmp	r3, fp
	bne	.L547
	ldr	r3, [r7, #120]
	cmp	r3, #0
	bne	.L547
	mov	r0, r8
	bl	mpp_taskqueue_get_pending_task
	mov	r6, r0
	cmp	r0, #0
	beq	.L547
	add	r0, r7, #104
	bl	down_read
	ldrd	r1, r2, [r6, #12]
	add	r3, r6, #12
	str	r2, [r1, #4]
	str	r1, [r2]
	ldr	r2, [r8, #64]
	str	r3, [r8, #64]
	strd	fp, r2, [r6, #12]
	str	r3, [r2]
	mov	r0, r6
	bl	mpp_time_record
	add	r3, r6, #20
	movs	r0, #2
	mov	r1, r3
	str	r3, [sp, #12]
	bl	____atomic_set_bit
	ldr	r3, [r6]
	ldrb	r2, [r3, #80]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L549
	ldr	r3, [r3, #56]
	ldr	r5, [r6, #976]
	str	r3, [sp, #16]
	ldr	r3, [r9]
	lsls	r1, r3, #26
	bpl	.L550
	mov	r2, #1040
	ldr	r1, .L575+12
	ldr	r0, .L575+8
	bl	printk
.L550:
	ldr	r3, [r7, #132]
	movs	r2, #6
	mov	r0, r4
	ldr	r1, [r3, #140]
	bl	mpp_write
	ldr	r3, .L575+16
	ldr	r0, .L575+20
	ldr	r3, [r3, #4]
	blx	r3
	ldr	r3, [r7, #132]
	movs	r2, #4
	mov	r0, r4
	ldr	r1, [r3, #140]
	bl	mpp_write
	ldr	r3, .L575+24
	movs	r2, #1
	str	r2, [sp, #8]
.L553:
	ldrd	r10, r2, [r3, #36]
	str	r2, [sp, #20]
.L551:
	ldr	r2, [sp, #20]
	cmp	r2, r10
	bcs	.L552
	ldr	r2, [sp, #8]
	adds	r3, r3, #8
	adds	r2, r2, #1
	str	r2, [sp, #8]
	cmp	r2, #7
	bne	.L553
	ldr	r2, [r5]
	movs	r1, #32
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #4]
	movs	r1, #36
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #8]
	mov	r1, #640
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #12]
	mov	r1, #644
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #16]
	mov	r1, #648
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #20]
	mov	r1, #676
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #24]
	mov	r1, #680
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #28]
	mov	r1, #768
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #32]
	mov	r1, #776
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #36]
	mov	r1, #784
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #40]
	mov	r1, #788
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #44]
	mov	r1, #792
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #48]
	mov	r1, #816
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #52]
	mov	r1, #820
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #56]
	mov	r1, #824
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #60]
	mov	r1, #828
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #64]
	mov	r1, #880
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #68]
	mov	r1, #884
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #72]
	mov	r1, #888
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #76]
	mov	r1, #956
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #80]
	movw	r1, #1148
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #84]
	mov	r1, #1312
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #88]
	movw	r1, #1316
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #92]
	mov	r1, #1320
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #96]
	movw	r1, #1324
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #100]
	mov	r1, #1328
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #104]
	movw	r1, #1332
	mov	r0, r4
	bl	mpp_write_relaxed
	ldr	r2, [r5, #108]
	mov	r1, #1336
	mov	r0, r4
	bl	mpp_write_relaxed
	movs	r5, #1
	str	r6, [r7, #64]
	ldr	r3, [sp, #16]
	str	r5, [r3, #24]
	.syntax unified
@ 1088 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_rkvenc_500.c" 1
	dsb st
@ 0 "" 2
	.thumb
	.syntax unified
	mvn	r3, #31
	str	r3, [r6, #28]
	add	r3, r6, #32
	str	r3, [r6, #32]
	str	r3, [r6, #36]
	mov	r2, #2097152
	ldr	r3, .L575+28
	add	r0, r6, #44
	ldr	r1, .L575+32
	str	r3, [r6, #40]
	movs	r3, #0
	str	r3, [sp]
	bl	init_timer_key
	ldr	r1, .L575+36
	movs	r3, #20
	add	r2, r6, #28
	mov	r0, r5
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	mov	r0, r5
	ldr	r1, [sp, #12]
	bl	____atomic_set_bit
	ldr	r3, [r9]
	lsls	r2, r3, #24
	bpl	.L554
	ldr	r3, [r6]
	ldr	r2, [r6, #100]
	ldr	r0, .L575+40
	ldr	r1, [r3, #68]
	bl	printk
.L554:
	mov	r2, #256
	movs	r1, #16
	mov	r0, r4
	bl	mpp_write
	movs	r3, #1
	str	r3, [r7, #240]
	ldr	r3, [r9]
	lsls	r3, r3, #26
	bpl	.L547
	movw	r2, #1099
	ldr	r1, .L575+12
	ldr	r0, .L575+44
	bl	printk
.L547:
	ldr	r3, [sp, #24]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8, #60]
	cmp	r3, fp
	bne	.L555
	mov	r0, r4
	bl	mpp_power_off
.L555:
	mov	r0, r8
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpp_session_clean_detach
.L552:
	mov	r1, r10
	movs	r2, #0
	mov	r0, r4
	str	r3, [sp, #28]
	bl	mpp_write_relaxed
	add	r10, r10, #4
	ldr	r3, [sp, #28]
	b	.L551
.L576:
	.align	2
.L575:
	.word	mpp_dev_debug
	.word	.LANCHOR0+784
	.word	.LC38
	.word	.LANCHOR0+802
	.word	arm_delay_ops
	.word	1073740
	.word	.LANCHOR1
	.word	rkvenc_task_timeout
	.word	delayed_work_timer_fn
	.word	system_wq
	.word	.LC105
	.word	.LC40
.L549:
	mov	r1, r6
	mov	r0, r4
	bl	rkvenc_run
	b	.L547
	.fnend
	.size	mpp_rkvenc_worker, .-mpp_rkvenc_worker
	.align	1
	.global	rkvenc_dvbm_callback
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_dvbm_callback, %function
rkvenc_dvbm_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #3
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, r0
	.pad #40
	sub	sp, sp, #40
	mov	r5, r2
	beq	.L578
	bhi	.L579
	cmp	r1, #1
	beq	.L580
	cmp	r1, #2
	beq	.L581
.L582:
	movs	r0, #0
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L579:
	cmp	r1, #20
	beq	.L583
	cmp	r1, #21
	bne	.L582
	ldr	r3, .L610
	ldr	r3, [r3]
	lsls	r3, r3, #25
	bpl	.L582
	ldr	r1, [r2]
	ldr	r0, .L610+4
	bl	printk
	b	.L582
.L580:
	ldr	r3, [r0, #144]
	cmp	r3, #2
	beq	.L582
	ldr	r3, .L610
	ldr	r5, [r2]
	ldr	r3, [r3]
	lsls	r0, r3, #25
	bpl	.L586
	mov	r1, r5
	ldr	r0, .L610+8
	bl	printk
.L586:
	movs	r2, #21
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #264]
	cbnz	r3, .L587
	str	r3, [r4, #336]
.L587:
	add	r1, r4, #264
	mov	r0, r5
	bl	_set_bit
	b	.L582
.L581:
	ldr	r3, [r0, #144]
	cmp	r3, #2
	beq	.L582
	ldr	r5, [r2]
	add	r1, r0, #264
	mov	r0, r5
	bl	_clear_bit
	ldr	r3, .L610
	ldr	r3, [r3]
	lsls	r1, r3, #25
	bpl	.L589
	ldr	r2, [r4, #264]
	mov	r1, r5
	ldr	r0, .L610+12
	bl	printk
.L589:
	ldr	r5, [r4, #264]
	cmp	r5, #0
	bne	.L582
	mov	r2, r5
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	str	r5, [r4, #116]
	str	r5, [r4, #336]
	b	.L582
.L578:
	ldr	r3, [r0, #144]
	cmp	r3, #2
	beq	.L582
	bl	mpp_power_on
	movs	r3, #1
	str	r3, [r4, #116]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #16]
	ldr	r7, [r5, #28]
	add	r9, r3, r2
	ldr	r2, [r5, #12]
	add	r7, r7, r3
	ldr	r6, [r5]
	add	r10, r3, r2
	ldr	r2, [r5, #32]
	ldr	r1, .L610+16
	add	r8, r3, r2
	ldr	r3, [r5, #40]
	movw	r2, #1956
	ldr	r0, .L610+20
	str	r3, [sp, #32]
	ldr	r3, [r5, #20]
	str	r3, [sp, #28]
	ldr	r3, [r5, #24]
	strd	r8, r7, [sp, #12]
	strd	r10, r9, [sp, #4]
	strd	r8, r3, [sp, #20]
	mov	r3, r6
	str	r9, [sp]
	bl	printk
	ldr	r3, [r4, #264]
	cbnz	r3, .L590
	mov	r2, r9
	movs	r1, #104
	mov	r0, r4
	bl	mpp_write
	mov	r2, r8
	movs	r1, #108
	mov	r0, r4
	bl	mpp_write
	mov	r2, r10
	movs	r1, #112
	mov	r0, r4
	bl	mpp_write
	mov	r2, r7
	movs	r1, #116
	mov	r0, r4
	bl	mpp_write
	mov	r2, r9
	movs	r1, #120
	mov	r0, r4
	bl	mpp_write
	mov	r2, r8
	movs	r1, #124
	mov	r0, r4
	bl	mpp_write
.L590:
	ldr	r3, .L610+24
	movs	r2, #12
	mov	r0, r4
	mla	r6, r2, r6, r3
	ldr	r2, [r5, #20]
	ldr	r1, [r6, #836]
	bl	mpp_write
	ldr	r2, [r5, #24]
	ldr	r1, [r6, #840]
	mov	r0, r4
	bl	mpp_write
	ldr	r2, [r5, #40]
	ldr	r1, [r6, #844]
	mov	r0, r4
	bl	mpp_write
	b	.L582
.L583:
	ldr	r3, .L610
	ldr	r3, [r3]
	lsls	r2, r3, #25
	bpl	.L591
	ldr	r1, [r5]
	ldr	r0, .L610+28
	bl	printk
.L591:
	add	r3, r4, #336
	pld	[r3]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L582
.L611:
	.align	2
.L610:
	.word	mpp_dev_debug
	.word	.LC110
	.word	.LC106
	.word	.LC107
	.word	.LANCHOR0+816
	.word	.LC108
	.word	.LANCHOR0
	.word	.LC109
	.fnend
	.size	rkvenc_dvbm_callback, .-rkvenc_dvbm_callback
	.align	1
	.global	rkvenc_500_hw_dvbm_handle
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_500_hw_dvbm_handle, %function
rkvenc_500_hw_dvbm_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r1
	.pad #24
	sub	sp, sp, #24
	movw	r1, #16416
	mov	r4, r0
	bl	mpp_read
	movs	r1, #96
	mov	r7, r0
	mov	r0, r4
	bl	mpp_read
	ldr	r3, [r4, #52]
	lsls	r1, r3, #24
	mov	r5, r0
	bpl	.L613
	ldr	r3, [r4, #336]
	cmp	r3, #1
	bgt	.L614
	bic	r5, r0, #32
	movs	r1, #96
	mov	r0, r4
	mov	r2, r5
	bl	mpp_write
	movs	r2, #0
	movw	r1, #16416
	mov	r0, r4
	bl	mpp_write
	orr	r2, r5, #4
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	orr	r2, r5, #36
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	mov	r2, #256
	movs	r1, #16
	mov	r0, r4
	bl	mpp_write
	movs	r0, #1
.L612:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L614:
	ldr	r3, [r6]
	movw	r1, #20844
	mov	r0, r4
	ldr	r9, [r6, #100]
	ldrd	r10, r6, [r6, #140]
	ldr	r8, [r3, #68]
	bl	mpp_read
	movw	r2, #1188
	ldr	r1, .L633
	mov	r3, r8
	strd	r5, r0, [sp, #16]
	strd	r6, r7, [sp, #8]
	strd	r9, r10, [sp]
	ldr	r0, .L633+4
	bl	printk
.L613:
	ldr	r3, .L633+8
	ldr	r3, [r3]
	lsls	r2, r3, #28
	bpl	.L616
	mov	r2, r7
	ldr	r1, .L633
	ldr	r0, .L633+12
	bl	printk
.L616:
	ldrb	r2, [r4, #332]	@ zero_extendqisi2
	ldr	r3, [r4, #52]
	cbz	r2, .L617
	lsls	r3, r3, #24
	bpl	.L618
	bic	r5, r5, #32
	movs	r1, #96
	mov	r0, r4
	mov	r2, r5
	bl	mpp_write
	movs	r2, #0
	movw	r1, #16416
	mov	r0, r4
	bl	mpp_write
	orr	r2, r5, #4
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
	orr	r2, r5, #36
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
.L618:
	movs	r3, #0
	strb	r3, [r4, #332]
.L619:
	ldr	r0, [r4, #52]
	ubfx	r0, r0, #0, #15
	clz	r0, r0
	lsrs	r0, r0, #5
	b	.L612
.L617:
	ubfx	r3, r3, #0, #15
	cbz	r3, .L620
	bic	r2, r5, #32
	movs	r1, #96
	mov	r0, r4
	bl	mpp_write
.L620:
	movs	r2, #0
	movw	r1, #16416
	mov	r0, r4
	bl	mpp_write
	b	.L619
.L634:
	.align	2
.L633:
	.word	.LANCHOR0+860
	.word	.LC111
	.word	mpp_dev_debug
	.word	.LC112
	.fnend
	.size	rkvenc_500_hw_dvbm_handle, .-rkvenc_500_hw_dvbm_handle
	.align	1
	.global	rkvenc_500_soft_dvbm_handle
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_500_soft_dvbm_handle, %function
rkvenc_500_soft_dvbm_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	ldr	r3, [r1]
	movs	r1, #24
	mov	r4, r0
	ldr	r5, [r3, #56]
	bl	mpp_read
	ubfx	r6, r0, #0, #14
	mov	r0, r4
	bl	rkvenc_clear_dvbm_info
	movw	r3, #16383
	cmp	r6, r3
	bne	.L636
	movs	r3, #1
	str	r3, [r4, #268]
	ldr	r3, .L641
	ldr	r3, [r3]
	lsls	r3, r3, #13
	bmi	.L637
.L640:
	ldr	r3, [r4, #52]
	orr	r3, r3, #64
	str	r3, [r4, #52]
	movs	r3, #0
	str	r3, [r4, #268]
	ldr	r3, [r5, #28]
	adds	r3, r3, #1
	str	r3, [r5, #28]
.L638:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L637:
	ldr	r1, [r7, #100]
	ldr	r0, .L641+4
	bl	printk
.L639:
	ldr	r3, [r4, #268]
	cmp	r3, #0
	beq	.L638
	b	.L640
.L636:
	movw	r3, #16382
	cmp	r6, r3
	bne	.L639
	ldr	r3, [r4, #52]
	orr	r3, r3, #65536
	str	r3, [r4, #52]
	ldr	r3, [r5, #36]
	adds	r3, r3, #1
	str	r3, [r5, #36]
	b	.L639
.L642:
	.align	2
.L641:
	.word	mpp_dev_debug
	.word	.LC113
	.fnend
	.size	rkvenc_500_soft_dvbm_handle, .-rkvenc_500_soft_dvbm_handle
	.align	1
	.global	rkvenc_500_irq
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_500_irq, %function
rkvenc_500_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r1, #84]
	mov	r4, r1
	ldr	r9, [r1, #148]
	bl	mpp_taskqueue_get_running_task
	ldr	r3, .L719
	ldr	r3, [r3]
	mov	r5, r0
	lsls	r0, r3, #26
	bpl	.L644
	movw	r2, #1265
	ldr	r1, .L719+4
	ldr	r0, .L719+8
	bl	printk
.L644:
	cbnz	r5, .L645
	ldr	r1, .L719+12
	ldr	r0, [r4]
	bl	_dev_err
.L718:
	movs	r0, #1
.L643:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L645:
	ldr	r8, [r5]
	mov	r0, r4
	ldr	r1, [r9, #156]
	ldr	r6, [r8, #56]
	bl	mpp_read
	movw	r1, #16416
	str	r0, [r4, #52]
	mov	r0, r4
	bl	mpp_read
	mov	r10, r0
	ldr	r0, [r4, #52]
	cmp	r0, #0
	beq	.L643
	mov	r2, #256
	ldr	r1, [r9, #148]
	mov	r0, r4
	bl	mpp_write
	ldr	r2, [r4, #52]
	ldr	r1, [r9, #152]
	mov	r0, r4
	bl	mpp_write
	ldr	r1, [r9, #156]
	movs	r2, #0
	mov	r0, r4
	bl	mpp_write
	ldr	r3, [r4, #52]
	lsls	r1, r3, #31
	bmi	.L647
	ldr	fp, [r4, #80]
	ands	r3, r3, #8192
	ldr	r2, [fp]
	ldr	r7, [r2, #56]
	beq	.L648
	movw	r1, #1036
	mov	r0, r4
	bl	mpp_read
	mov	r1, #1032
	str	r0, [sp, #8]
	mov	r0, r4
	bl	mpp_read
	mov	r1, #1024
	str	r0, [sp, #12]
	mov	r0, r4
	bl	mpp_read
	movw	r1, #1028
	str	r0, [sp, #16]
	mov	r0, r4
	bl	mpp_read
	mov	r1, #1032
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #16]
	str	r0, [sp, #20]
	str	r3, [r7, #48]
	ldr	r3, [sp, #8]
	strd	r2, r0, [r7, #40]
	mov	r0, r4
	ldr	r2, [sp, #12]
	str	r3, [r7, #52]
	bl	mpp_write
	movw	r1, #1036
	mov	r0, r4
	ldr	r3, [sp, #8]
	orr	r2, r3, #12
	bl	mpp_write
	ldr	r2, .L719
	ldr	r2, [r2]
	tst	r2, #262144
	ldr	r3, [sp, #20]
	beq	.L649
	ldr	r2, [sp, #8]
	ldr	r0, .L719+16
	str	r2, [sp, #4]
	ldr	r2, [sp, #12]
	str	r2, [sp]
	ldr	r2, [sp, #16]
	ldr	r1, [fp, #100]
	bl	printk
.L649:
	ldr	r3, [r4, #52]
	str	r3, [r4, #56]
	movs	r3, #1
.L648:
	ldr	r2, [r4, #52]
	lsls	r2, r2, #27
	bpl	.L650
	mov	r1, #700
	mov	r0, r4
	bl	mpp_read
	mov	r1, #696
	mov	r6, r0
	mov	r0, r4
	bl	mpp_read
	mov	r1, #688
	mov	r5, r0
	mov	r0, r4
	bl	mpp_read
	mov	r1, #692
	mov	r8, r0
	mov	r0, r4
	bl	mpp_read
	strd	r5, r6, [r7, #48]
	mov	r2, r5
	mov	r1, #696
	strd	r8, r0, [r7, #40]
	mov	r10, r0
	mov	r0, r4
	bl	mpp_write
	orr	r2, r6, #12
	mov	r1, #700
	mov	r0, r4
	bl	mpp_write
	ldr	r3, .L719
	ldr	r3, [r3]
	lsls	r7, r3, #13
	bpl	.L651
	strd	r5, r6, [sp]
	mov	r3, r10
	mov	r2, r8
	ldr	r1, [fp, #100]
	ldr	r0, .L719+20
	bl	printk
.L651:
	ldr	r3, [r4, #52]
	str	r3, [r4, #56]
.L652:
	ldr	r2, [r4, #52]
	mov	r0, r4
	ldr	r1, [r9, #152]
	bl	mpp_write
	b	.L718
.L650:
	cmp	r3, #0
	bne	.L652
.L647:
	ldr	r3, [r6, #16]
	cbz	r3, .L654
	ldr	r3, [r8, #76]
	mov	r1, r5
	mov	r0, r4
	cmp	r3, #2
	bne	.L655
	bl	rkvenc_500_soft_dvbm_handle
.L654:
	add	fp, r5, #20
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #20]
	orr	r1, r3, #8
	str	r1, [r5, #20]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	lsls	r0, r3, #28
	bpl	.L657
	ldr	r3, [r5, #20]
	movw	r2, #1303
	ldr	r1, .L719+4
	ldr	r0, .L719+24
	str	r3, [sp]
	ldr	r3, [r5, #100]
	bl	printk
	b	.L718
.L655:
	bl	rkvenc_500_hw_dvbm_handle
	cmp	r0, #0
	beq	.L654
	b	.L718
.L720:
	.align	2
.L719:
	.word	mpp_dev_debug
	.word	.LANCHOR0+886
	.word	.LC38
	.word	.LC114
	.word	.LC115
	.word	.LC116
	.word	.LC117
.L657:
	add	r0, r5, #28
	bl	cancel_delayed_work
	mov	r1, fp
	movs	r0, #4
	bl	____atomic_set_bit
	ldr	r3, [r4, #56]
	cbz	r3, .L658
	ldr	r3, [r6, #32]
	adds	r3, r3, #1
	str	r3, [r6, #32]
.L658:
	ldr	r7, .L721
	ldrd	r3, r2, [r4, #52]
	orrs	r3, r3, r2
	ldr	r2, [r7]
	str	r3, [r5, #316]
	lsls	r1, r2, #29
	bpl	.L659
	ldr	r0, [r5, #976]
	ldr	r1, .L721+4
	ldr	r2, .L721+8
	strd	r3, r10, [sp]
	cmp	r0, #0
	it	eq
	moveq	r2, r1
	ldr	r3, [r5, #100]
	ldr	r1, [r8, #68]
	ldr	r0, .L721+12
	bl	printk
.L659:
	mov	r0, r5
	bl	mpp_time_diff
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	cbz	r3, .L661
	mov	r1, r5
	mov	r0, r4
	blx	r3
.L661:
	ldr	r3, [r4, #148]
	ldr	r2, [r3, #164]
	ldr	r3, [r4, #52]
	tst	r2, r3
	beq	.L663
	ldr	r3, [r7]
	lsls	r2, r3, #13
	bpl	.L664
	ldr	r0, [r5, #976]
	str	r10, [sp, #4]
	ldr	r3, [r5, #316]
	ldr	r1, .L721+4
	ldr	r2, .L721+8
	str	r3, [sp]
	cmp	r0, #0
	it	eq
	moveq	r2, r1
	ldr	r3, [r5, #100]
	ldr	r1, [r8, #68]
	ldr	r0, .L721+12
	bl	printk
.L664:
	ldr	r3, [r5, #316]
	tst	r10, #512
	strd	r3, r10, [r6, #60]
	ittt	ne
	ldrne	r3, [r6, #28]
	addne	r3, r3, #1
	strne	r3, [r6, #28]
	ldr	r3, [r6, #56]
	adds	r3, r3, #1
	str	r3, [r6, #56]
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #28]
	cbz	r3, .L663
	mov	r0, r4
	blx	r3
.L663:
	mov	r9, #0
	mov	r1, fp
	str	r9, [r6, #24]
	movs	r0, #7
	str	r9, [r4, #56]
	bl	____atomic_set_bit
	mov	r1, r5
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_pop_running
	mov	r3, r9
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #108
	bl	__wake_up
	mov	r0, r4
	bl	mpp_taskqueue_trigger_work
	ldr	r3, [r8, #96]
	cbz	r3, .L668
	ldr	r2, [r5, #132]
	cbz	r2, .L668
	mov	r2, r9
	mov	r1, r9
	ldr	r0, [r8, #68]
	blx	r3
.L668:
	add	r0, r4, #120
	bl	up_read
	ldr	r3, [r7]
	lsls	r3, r3, #26
	bpl	.L718
	mov	r2, #1344
	ldr	r1, .L721+16
	ldr	r0, .L721+20
	bl	printk
	b	.L718
.L722:
	.align	2
.L721:
	.word	mpp_dev_debug
	.word	.LC93
	.word	.LC92
	.word	.LC118
	.word	.LANCHOR0+886
	.word	.LC40
	.fnend
	.size	rkvenc_500_irq, .-rkvenc_500_irq
	.global	rockchip_rkvenc500_driver
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.48640, %object
	.size	__func__.48640, 21
__func__.48640:
	.ascii	"rkvenc_get_class_reg\000"
	.type	__func__.48617, %object
	.size	__func__.48617, 18
__func__.48617:
	.ascii	"rkvenc_update_req\000"
	.space	1
.LC0:
	.word	20848
	.word	20856
	.word	20864
	.word	20872
	.type	__func__.48794, %object
	.size	__func__.48794, 22
__func__.48794:
	.ascii	"rkvenc_dvbm_show_info\000"
	.type	__func__.48776, %object
	.size	__func__.48776, 16
__func__.48776:
	.ascii	"rkvenc_reg_dump\000"
	.type	__func__.49279, %object
	.size	__func__.49279, 13
__func__.49279:
	.ascii	"rkvenc_reset\000"
	.space	1
	.type	mpp_rkvenc_dt_match, %object
	.size	mpp_rkvenc_dt_match, 392
mpp_rkvenc_dt_match:
	.space	64
	.ascii	"rockchip,rkv-encoder-rv1103b\000"
	.space	99
	.word	rkvenc_rv1103b_data
	.space	196
	.type	__func__.49398, %object
	.size	__func__.49398, 17
__func__.49398:
	.ascii	"rkvenc_dvbm_init\000"
	.type	__func__.49254, %object
	.size	__func__.49254, 19
__func__.49254:
	.ascii	"rkvenc_procfs_init\000"
	.type	__func__.49104, %object
	.size	__func__.49104, 15
__func__.49104:
	.ascii	"rkvenc_control\000"
	.type	__func__.49010, %object
	.size	__func__.49010, 14
__func__.49010:
	.ascii	"rkvenc_finish\000"
	.type	__func__.49035, %object
	.size	__func__.49035, 14
__func__.49035:
	.ascii	"rkvenc_result\000"
	.type	__func__.49266, %object
	.size	__func__.49266, 12
__func__.49266:
	.ascii	"rkvenc_init\000"
	.type	__func__.48868, %object
	.size	__func__.48868, 11
__func__.48868:
	.ascii	"rkvenc_run\000"
	.type	__func__.49146, %object
	.size	__func__.49146, 20
__func__.49146:
	.ascii	"rkvenc_init_session\000"
	.type	__func__.49122, %object
	.size	__func__.49122, 22
__func__.49122:
	.ascii	"rkvenc_pre_alloc_task\000"
	.type	__func__.48737, %object
	.size	__func__.48737, 17
__func__.48737:
	.ascii	"rkvenc_init_task\000"
	.type	__func__.48707, %object
	.size	__func__.48707, 16
__func__.48707:
	.ascii	"rkvenc_get_task\000"
	.type	__func__.48720, %object
	.size	__func__.48720, 27
__func__.48720:
	.ascii	"rkvenc_pp_extract_task_msg\000"
	.type	__func__.48666, %object
	.size	__func__.48666, 24
__func__.48666:
	.ascii	"rkvenc_extract_task_msg\000"
	.type	__func__.48698, %object
	.size	__func__.48698, 23
__func__.48698:
	.ascii	"rkvenc_task_get_format\000"
	.type	__func__.49162, %object
	.size	__func__.49162, 20
__func__.49162:
	.ascii	"rkvenc_task_timeout\000"
	.space	1
.LC98:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.type	__func__.49180, %object
	.size	__func__.49180, 18
__func__.49180:
	.ascii	"mpp_rkvenc_worker\000"
	.type	__func__.48911, %object
	.size	__func__.48911, 14
__func__.48911:
	.ascii	"rkvenc_pp_run\000"
	.type	__func__.49346, %object
	.size	__func__.49346, 18
__func__.49346:
	.ascii	"rkvenc_dvbm_setup\000"
	.space	2
	.type	dvbm_stride, %object
	.size	dvbm_stride, 24
dvbm_stride:
	.word	128
	.word	136
	.word	140
	.word	144
	.word	152
	.word	156
	.type	__func__.48954, %object
	.size	__func__.48954, 26
__func__.48954:
	.ascii	"rkvenc_500_hw_dvbm_handle\000"
	.type	__func__.48984, %object
	.size	__func__.48984, 15
__func__.48984:
	.ascii	"rkvenc_500_irq\000"
	.space	3
	.type	rkvenc_pm_ops, %object
	.size	rkvenc_pm_ops, 92
rkvenc_pm_ops:
	.space	92
	.type	rkvenc_rv1103b_data, %object
	.size	rkvenc_rv1103b_data, 16
rkvenc_rv1103b_data:
	.word	1
	.word	rkvenc_500_hw_info
	.word	rkvenc_hw_ops
	.word	rkvenc_dev_ops_v2
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rkvenc_500_hw_info, %object
	.size	rkvenc_500_hw_info, 168
rkvenc_500_hw_info:
	.word	254
	.word	0
	.space	4
	.word	0
	.word	21040
	.word	16
	.word	9
	.word	0
	.word	288
	.word	624
	.word	1336
	.word	4096
	.word	4412
	.word	5888
	.word	6604
	.word	8192
	.word	8556
	.word	8704
	.word	9996
	.word	12288
	.word	12900
	.word	16384
	.word	16972
	.word	20480
	.word	21040
	.word	2
	.word	1
	.word	0
	.word	6
	.word	3
	.word	1
	.word	768
	.word	0
	.word	2
	.word	16
	.word	20
	.word	32
	.word	36
	.word	40
	.word	44
	.word	56
	.word	10192
	.type	rockchip_rkvenc500_driver, %object
	.size	rockchip_rkvenc500_driver, 104
rockchip_rkvenc500_driver:
	.word	rkvenc_probe
	.word	rkvenc_remove
	.word	rkvenc_shutdown
	.space	8
	.word	.LC119
	.space	20
	.word	mpp_rkvenc_dt_match
	.space	36
	.word	rkvenc_pm_ops
	.space	8
	.space	8
	.type	rkvenc_dev_ops_v2, %object
	.size	rkvenc_dev_ops_v2, 68
rkvenc_dev_ops_v2:
	.space	16
	.word	rkvenc_init_task
	.word	0
	.word	rkvenc_run
	.word	0
	.word	0
	.word	rkvenc_finish
	.word	rkvenc_result
	.word	rkvenc_free_task
	.word	rkvenc_control
	.word	rkvenc_init_session
	.word	rkvenc_free_session
	.word	rkvenc_dump_session
	.space	4
	.type	rkvenc_hw_ops, %object
	.size	rkvenc_hw_ops, 36
rkvenc_hw_ops:
	.word	rkvenc_init
	.space	4
	.word	rkvenc_clk_on
	.word	rkvenc_clk_off
	.space	4
	.word	rkvenc_set_freq
	.space	4
	.word	rkvenc_reset
	.space	4
	.bss
	.set	.LANCHOR2,. + 0
	.type	__key.49147, %object
	.size	__key.49147, 0
__key.49147:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC5:
	.ascii	"\0013rkvenc_500: %s:%d: get reg invalid, addr[0x%x]"
	.ascii	" reg[%d].offset[0x%x]\000"
.LC6:
	.ascii	"\0013rkvenc_500: %s:%d: warning over class, req off"
	.ascii	" 0x%08x size %d\012\000"
.LC7:
	.ascii	"\0016rkvenc_500: read reg[%03d]: %04x: 0x%08x\012\000"
.LC8:
	.ascii	"\0016rkvenc_500: write reg[%03d]: %04x: 0x%08x\012\000"
.LC9:
	.ascii	"\0013rkvenc_500: clear dvbm info failed 0x%08x 0x%0"
	.ascii	"8x\012\000"
.LC10:
	.ascii	"\0016rkvenc_500: %s: fcnt %d lcnt %d\012\000"
.LC11:
	.ascii	"\0016rkvenc_500: %s: isp0 fcnt %d isp1 0x%08x fcnt "
	.ascii	"%d lcnt %d\012\000"
.LC12:
	.ascii	"\0016rkvenc_500: read reg[%03d] %04x: 0x%08x\012\000"
.LC13:
	.ascii	"\0013rkvenc_500: %s:%d: reg[%#x] 0x%08x\012\000"
.LC14:
	.ascii	"\012--------hw session infos\000"
.LC15:
	.ascii	"---------------------------------------------------"
	.ascii	"---\012\000"
.LC16:
	.ascii	"ID\000"
.LC17:
	.ascii	"%8s|\000"
.LC18:
	.ascii	"device\000"
.LC19:
	.ascii	"online\000"
.LC20:
	.ascii	"hw_running\000"
.LC21:
	.ascii	"%15s|%10s|%12s|%10s|%15s|%13s|%13s|%13s\000"
.LC22:
	.ascii	"enc_err_st\000"
.LC23:
	.ascii	"enc_err_irq\000"
.LC24:
	.ascii	"enc_err_cnt\000"
.LC25:
	.ascii	"wrap_src_mis\000"
.LC26:
	.ascii	"bs_ovfl\000"
.LC27:
	.ascii	"wrap_ovfl\000"
.LC28:
	.ascii	"\012\000"
.LC29:
	.ascii	"%8d|\000"
.LC30:
	.ascii	"%15d|%10d|%12d|%10d|%15d|%13d|%13x|%13x\000"
.LC31:
	.ascii	"\012--------bitstream buffer addr\000"
.LC32:
	.ascii	"bot\000"
.LC33:
	.ascii	"top\000"
.LC34:
	.ascii	"%10s|%10s|%10s|%10s|\012\000"
.LC35:
	.ascii	"rd\000"
.LC36:
	.ascii	"wr\000"
.LC37:
	.ascii	"%10x|%10x|%10x|%10x|\012\000"
.LC38:
	.ascii	"\0016rkvenc_500: %s:%d: enter\012\000"
.LC39:
	.ascii	"\0013rkvenc_500: %s:%d: soft reset timeout %#08x\012"
	.ascii	"\000"
.LC40:
	.ascii	"\0016rkvenc_500: %s:%d: leave\012\000"
.LC41:
	.ascii	"remove device\012\000"
.LC42:
	.ascii	"probing start\012\000"
.LC43:
	.ascii	"dt match failed!\012\000"
.LC44:
	.ascii	"vepu_qos map failed!\012\000"
.LC45:
	.ascii	"register interrupter runtime failed\012\000"
.LC46:
	.ascii	"dvbm\000"
.LC47:
	.ascii	"\0013rkvenc_500: %s:%d: failed to get device node\012"
	.ascii	"\000"
.LC48:
	.ascii	"%s%d\000"
.LC49:
	.ascii	"\0013rkvenc_500: %s:%d: failed on open procfs\012\000"
.LC50:
	.ascii	"aclk\000"
.LC51:
	.ascii	"clk_core\000"
.LC52:
	.ascii	"hclk\000"
.LC53:
	.ascii	"dump_regs\000"
.LC54:
	.ascii	"dump_reg_s\000"
.LC55:
	.ascii	"dump_reg_e\000"
.LC56:
	.ascii	"sessions-info\000"
.LC57:
	.ascii	"probing finish\012\000"
.LC58:
	.ascii	"\0013rkvenc_500: task %d disable_jpeg\012\000"
.LC59:
	.ascii	"\0013rkvenc_500: %s:%d: unknown mpp ioctl cmd %x\012"
	.ascii	"\000"
.LC60:
	.ascii	"aclk_vcodec\000"
.LC61:
	.ascii	"\0013rkvenc_500: %s:%d: failed on clk_get aclk_vcod"
	.ascii	"ec\012\000"
.LC62:
	.ascii	"hclk_vcodec\000"
.LC63:
	.ascii	"\0013rkvenc_500: %s:%d: failed on clk_get hclk_vcod"
	.ascii	"ec\012\000"
.LC64:
	.ascii	"\0013rkvenc_500: %s:%d: failed on clk_get clk_core\012"
	.ascii	"\000"
.LC65:
	.ascii	"rockchip,default-max-load\000"
.LC66:
	.ascii	"video_a\000"
.LC67:
	.ascii	"\0013rkvenc_500: %s:%d: No aclk reset resource defi"
	.ascii	"ne\012\000"
.LC68:
	.ascii	"video_h\000"
.LC69:
	.ascii	"\0013rkvenc_500: %s:%d: No hclk reset resource defi"
	.ascii	"ne\012\000"
.LC70:
	.ascii	"video_core\000"
.LC71:
	.ascii	"\0013rkvenc_500: %s:%d: No core reset resource defi"
	.ascii	"ne\012\000"
.LC72:
	.ascii	"\0013rkvenc_500: %s:%d: invalid frame id %d\012\000"
.LC73:
	.ascii	"\0013rkvenc_500: %s:%d: invalid pipe id %d\012\000"
.LC74:
	.ascii	"the dvbm address do not ready!\012\000"
.LC75:
	.ascii	"\0016rkvenc_500: chan %d task %d pipe %d frame %d s"
	.ascii	"tart\012\000"
.LC76:
	.ascii	"\0016rkvenc_500: chan %d task %d start\012\000"
.LC77:
	.ascii	"\0013rkvenc_500: --- dump dvbm status -- \012\000"
.LC78:
	.ascii	"\0013rkvenc_500: reg[%#x] 0x%08x\012\000"
.LC79:
	.ascii	"shutdown device\012\000"
.LC80:
	.ascii	"wait total running time out\012\000"
.LC81:
	.ascii	"shutdown success\012\000"
.LC82:
	.ascii	"\0013rkvenc_500: %s:%d: session is null\012\000"
.LC83:
	.ascii	"\0013rkvenc_500: %s:%d: alloc priv failed\012\000"
.LC84:
	.ascii	"&priv->rw_sem\000"
.LC85:
	.ascii	"\0013rkvenc_500: %s:%d: alloc task %d failed\012\000"
.LC86:
	.ascii	"\0013rkvenc_500: %s:%d: alloc pp info %d failed\012"
	.ascii	"\000"
.LC87:
	.ascii	"\0013rkvenc_500: %s:%d: can't found idle task\000"
.LC88:
	.ascii	"\0013rkvenc_500: %s:%d: invalid pp param size %d\012"
	.ascii	"\000"
.LC89:
	.ascii	"\0016rkvenc_500: w_req_cnt=%d, r_req_cnt=%d\012\000"
.LC90:
	.ascii	"\0013rkvenc_500: %s:%d: invalid class reg %px class"
	.ascii	" size %d\012\000"
.LC91:
	.ascii	"\0013rkvenc_500: %s:%d: invalid fmt_reg[0x%x] class"
	.ascii	"_offset[0x%x]\000"
.LC92:
	.ascii	"pp\000"
.LC93:
	.ascii	"enc\000"
.LC94:
	.ascii	"\0013rkvenc_500: %s:%d: task has been handled\012\000"
.LC95:
	.ascii	"\0013rkvenc_500: %s:%d: task %p, task->session is n"
	.ascii	"ull.\012\000"
.LC96:
	.ascii	"\0013rkvenc_500: %s:%d: chan %d %s task %d state %#"
	.ascii	"lx processing time out!\012\000"
.LC97:
	.ascii	"\0013rkvenc_500: %s:%d: session %p, session->mpp is"
	.ascii	" null.\012\000"
.LC99:
	.ascii	"\0013rkvenc_500: dvbm    - en %d sw %d\012\000"
.LC100:
	.ascii	"\0013rkvenc_500: fmt     - v %s jpg %d\012\000"
.LC101:
	.ascii	"\0013rkvenc_500: vsldy   - 0x%08x\012\000"
.LC102:
	.ascii	"\0013rkvenc_500: st_enc  - 0x%08x\012\000"
.LC103:
	.ascii	"\0013rkvenc_500: st_vsp0 - 0x%08x\012\000"
.LC104:
	.ascii	"\0013rkvenc_500: cycle   - 0x%08x\012\000"
.LC105:
	.ascii	"\0016rkvenc_500: chan %d pp_task %d start\012\000"
.LC106:
	.ascii	"\0016rkvenc_500: isp %d connect\012\000"
.LC107:
	.ascii	"\0016rkvenc_500: isp %d disconnect 0x%lx\012\000"
.LC108:
	.ascii	"\0013rkvenc_500: %s:%d: chan %d y [%#08x %#08x %#08"
	.ascii	"x] uv [%#08x %#08x %#08x] stride [%d %d %d]\012\000"
.LC109:
	.ascii	"\0016rkvenc_500: isp frame %d start\012\000"
.LC110:
	.ascii	"\0016rkvenc_500: isp frame %d end\012\000"
.LC111:
	.ascii	"\0013rkvenc_500: %s:%d: chan %d task %d pipe %d fra"
	.ascii	"me id %d err 0x%08x cfg %#x 0x%08x\012\000"
.LC112:
	.ascii	"\0016rkvenc_500: %s: st enc 0x%08x\012\000"
.LC113:
	.ascii	"\0016rkvenc_500: current task %d has overflow\012\000"
.LC114:
	.ascii	"found null task in irq\012\000"
.LC115:
	.ascii	"\0016rkvenc_500: task %d jpeg bs overflow, buf[t:%#"
	.ascii	"x b:%#x w:%#x r:%#x]\012\000"
.LC116:
	.ascii	"\0016rkvenc_500: task %d video bs overflow, buf[t:%"
	.ascii	"#x b:%#x w:%#x r:%#x]\012\000"
.LC117:
	.ascii	"\0013rkvenc_500: %s:%d: task %d has been handled st"
	.ascii	"ate %#lx\012\000"
.LC118:
	.ascii	"\0016rkvenc_500: chan %d %s task %d irq_status 0x%0"
	.ascii	"8x st 0x%08x\012\000"
.LC1:
	.ascii	"h264\000"
.LC2:
	.ascii	"h265\000"
.LC3:
	.ascii	"none\000"
.LC119:
	.ascii	"mpp_rkvenc_500\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
