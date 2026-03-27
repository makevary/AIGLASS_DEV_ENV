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
	.file	"mcu.c"
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
	.type	mcu_send_message, %function
mcu_send_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	ldr	r2, [r3, #212]
	str	r1, [r2]
	ldr	r3, [r3, #208]
	str	r0, [r3]
	bx	lr
.L3:
	.align	2
.L2:
	.word	g_vmcu_dev
	.fnend
	.size	mcu_send_message, .-mcu_send_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_compat_ioctl, %function
vmcu_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vmcu_compat_ioctl, .-vmcu_compat_ioctl
	.align	1
	.global	vmcu_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_version, %function
vmcu_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r3, [r3]
	ldr	r6, [r3, #136]
	ldr	r3, [r1, #48]	@ unaligned
	cmp	r3, #124
	beq	.L6
	movs	r1, #2
	movs	r3, #246
	ldr	r2, .L12
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L12+4
	bl	vlog
.L6:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r4, #1]
	strb	r3, [r4]
	strb	r5, [r4, #2]
	strb	r5, [r4, #3]
	strb	r5, [r4, #4]
	strb	r5, [r4, #5]
	strb	r5, [r4, #6]
	strb	r5, [r4, #7]
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6]
	bl	strlen
	cmp	r0, #32
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	strbhi	r5, [r4, #14]
	movhi	r3, #32
	strbhi	r5, [r4, #15]
	strbhi	r3, [r4, #12]
	ldr	r2, [r4, #12]	@ unaligned
	ldr	r1, [r6]
	bl	strncpy
	movs	r0, #0
	strb	r0, [r4, #52]
	strb	r0, [r4, #53]
	strb	r0, [r4, #54]
	strb	r0, [r4, #55]
	strb	r0, [r4, #88]
	strb	r0, [r4, #89]
	strb	r0, [r4, #90]
	strb	r0, [r4, #91]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L13:
	.align	2
.L12:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	vmcu_version, .-vmcu_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_release, %function
vmcu_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, [r1, #128]
	ldr	r0, [r4]
	bl	mpi_obj_unref
	ldr	r3, [r4]
	ldr	r2, .L15
	movs	r1, #4
	movs	r0, #2
	ldr	r3, [r3]
	str	r3, [sp, #4]
	movw	r3, #325
	str	r3, [sp]
	ldr	r3, .L15+4
	bl	vlog
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L16:
	.align	2
.L15:
	.word	.LC1
	.word	.LANCHOR0+13
	.fnend
	.size	vmcu_release, .-vmcu_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_read, %function
vmcu_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	ldr	r4, .L19
	mov	r6, r2
	movs	r1, #2
	ldr	r3, [r4, #196]
	ldr	r0, [r3, #484]
	bl	dma_buf_begin_cpu_access
	mov	r2, r6
	mov	r1, r5
	add	r0, r4, #144
	bl	mpi_fs_buf_read
	cmp	r0, #-1
	it	eq
	moveq	r0, #0
	pop	{r4, r5, r6, pc}
.L20:
	.align	2
.L19:
	.word	g_vmcu_dev
	.fnend
	.size	vmcu_read, .-vmcu_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_ioctl, %function
vmcu_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, .L26
	mov	r6, r0
	mov	r5, r1
	mov	r7, r2
	adds	r3, r3, #4
	movs	r1, #5
	ldr	r8, [r3, #136]
	movs	r0, #2
	strd	r4, r3, [sp, #8]
	mov	r3, #278
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L26+4
	ldr	r3, .L26+8
	bl	vlog
	ldr	r1, [r8, #188]
	cmp	r1, r4
	bhi	.L22
	movw	r3, #281
	ldr	r2, .L26+12
	str	r3, [sp]
	ldr	r3, .L26+8
.L25:
	movs	r1, #2
	mov	r0, r1
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L23:
.L22:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r8, #184]
	movs	r3, #20
	mla	r1, r3, r4, r1
	cbnz	r1, .L24
	mov	r3, #288
	ldr	r2, .L26+16
	str	r3, [sp]
	ldr	r3, .L26+8
	b	.L25
.L24:
	mov	r3, r7
	mov	r2, r5
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L27:
	.align	2
.L26:
	.word	g_vmcu_dev
	.word	.LC2
	.word	.LANCHOR0+26
	.word	.LC3
	.word	.LC4
	.fnend
	.size	vmcu_ioctl, .-vmcu_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_thread_fn, %function
vmcu_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r9, .L42+4
	movs	r5, #0
	ldr	r7, .L42
	ldr	r10, .L42+8
.L29:
	bl	kthread_should_stop
	cbz	r0, .L34
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L34:
	ldr	r6, [r8, #180]
	cbz	r6, .L30
	movs	r0, #1
	mov	r4, r5
	bl	msleep
.L31:
	mov	r5, r4
	b	.L29
.L30:
	movs	r0, #10
	bl	msleep
	ldr	r3, [r9, #216]
	ldr	r4, [r3]
	cmp	r5, r4
	beq	.L31
	cmp	r4, #0
	beq	.L31
	mov	r1, r6
	movs	r0, #8
	bl	mcu_send_message
	cmp	r4, #7
	bne	.L31
	movs	r1, #44
	mov	r0, r7
	bl	ioremap
	cbz	r0, .L32
	ldr	r6, .L42
	subs	r5, r0, #4
	ldr	fp, .L42+12
.L33:
	mov	r1, r6
	ldr	r2, [r5, #4]!
	mov	r0, fp
	adds	r6, r6, #4
	bl	printk
	cmp	r6, r10
	bne	.L33
	mov	r0, r7
	bl	iounmap
.L32:
	movs	r0, #10
	bl	msleep
	movs	r1, #0
	mov	r0, r1
	bl	mcu_send_message
	b	.L31
.L43:
	.align	2
.L42:
	.word	-5943292
	.word	g_vmcu_dev
	.word	-5943248
	.word	.LC5
	.fnend
	.size	vmcu_thread_fn, .-vmcu_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_open, %function
vmcu_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L47
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r6, r1
	ldr	r0, [r3, #12]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L45
	movs	r1, #2
	mov	r3, #312
	ldr	r2, .L47+4
	mov	r0, r1
	str	r3, [sp]
	ldr	r3, .L47+8
	bl	vlog
	mov	r0, #-1
.L44:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L45:
	ldr	r4, .L47+12
	mov	r0, r4
	bl	mpi_obj_ref
	ldr	r3, [r4]
	str	r4, [r5]
	movs	r1, #4
	str	r5, [r6, #128]
	movs	r0, #2
	ldr	r2, .L47+16
	str	r3, [sp, #4]
	movw	r3, #317
	str	r3, [sp]
	ldr	r3, .L47+8
	bl	vlog
	movs	r0, #0
	b	.L44
.L48:
	.align	2
.L47:
	.word	kmalloc_caches
	.word	.LC6
	.word	.LANCHOR0+37
	.word	g_vmcu_dev+4
	.word	.LC1
	.fnend
	.size	vmcu_open, .-vmcu_open
	.global	__aeabi_idiv
	.align	1
	.global	mcu_wrap_config
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_config, %function
mcu_wrap_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	ldr	r4, .L64
	.pad #28
	sub	sp, sp, #28
	mov	fp, r1
	ldr	r3, [r4, #240]
	bics	r3, r3, #2
	beq	.L49
	ldr	r5, .L64+4
	movs	r1, #0
	movs	r0, #6
	bl	mcu_send_message
	ldr	r3, [r5]
	cbnz	r3, .L51
	bl	get_rk_cam_h
	str	r0, [r5]
.L51:
	ldr	r5, [r5]
	cbnz	r5, .L53
	ldr	r3, [r4, #224]
	ldr	r5, [r3]
	ubfx	r5, r5, #0, #14
.L53:
	ldr	r3, [r4, #196]
	mov	r0, #1000
	mov	r1, r5
	mov	r10, #0
	mul	r0, r0, r9
	ldr	r6, [r3, #656]
	bl	__aeabi_idiv
	movs	r3, #115
	ldr	r2, .L64+8
	movs	r1, #4
	subs	r7, r6, #4
	mov	r8, r0
	str	r3, [sp]
	strd	r6, r5, [sp, #4]
	movs	r0, #2
	ldr	r3, .L64+12
	bl	vlog
	lsl	r3, r8, #5
	mov	r8, #32
	str	r3, [sp, #20]
.L56:
	movs	r3, #0
	str	r3, [r7, #4]!
	str	r3, [r7, #256]
	ldr	r3, .L64+16
	str	r8, [r7, #768]
	smull	r0, r1, r10, r3
	asr	r3, r10, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [r7, #512]
	ldr	r2, [r4, #240]
	cmp	r2, #1
	bne	.L54
	strd	r8, r3, [sp, #4]
	movs	r1, #4
	movs	r3, #124
	ldr	r2, .L64+20
	str	r3, [sp]
	movs	r0, #2
	ldr	r3, .L64+12
	bl	vlog
.L54:
	ldr	r3, [r7, #512]
	cmp	r3, r9
	bge	.L55
	add	r8, r8, #32
	ldr	r3, [sp, #20]
	cmp	r8, #2080
	add	r10, r10, r3
	bne	.L56
.L55:
	ldr	r3, [r4, #200]
	movs	r1, #1
	str	r5, [r6, #1024]
	cmp	r3, #0
	it	ne
	movne	fp, r3
	ldr	r3, [r4, #196]
	str	r9, [r6, #1028]
	str	fp, [r6, #1032]
	ldr	r0, [r3, #484]
	str	r9, [r4, #204]
	bl	dma_buf_end_cpu_access
	ldr	r3, [r6, #1032]
	movs	r1, #4
	ldr	r2, .L64+24
	movs	r0, #2
	str	r3, [sp, #8]
	ldr	r3, [r4, #196]
	ldr	r3, [r3, #660]
	str	r3, [sp, #4]
	movs	r3, #136
	str	r3, [sp]
	ldr	r3, .L64+12
	bl	vlog
	ldr	r3, [r4, #196]
	movs	r0, #1
	ldr	r1, [r3, #660]
	bl	mcu_send_message
	movs	r3, #4
	str	r3, [r4, #240]
.L49:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L65:
	.align	2
.L64:
	.word	g_vmcu_dev
	.word	.LANCHOR1
	.word	.LC7
	.word	.LANCHOR0+47
	.word	274877907
	.word	.LC8
	.word	.LC9
	.fnend
	.size	mcu_wrap_config, .-mcu_wrap_config
	.align	1
	.global	mcu_set_wrap_line
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_set_wrap_line, %function
mcu_set_wrap_line:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	str	r0, [r3, #200]
	bx	lr
.L68:
	.align	2
.L67:
	.word	g_vmcu_dev
	.fnend
	.size	mcu_set_wrap_line, .-mcu_set_wrap_line
	.align	1
	.global	mcu_get_wrap_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_get_wrap_status, %function
mcu_get_wrap_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	ldr	r0, [r3, #240]
	bx	lr
.L71:
	.align	2
.L70:
	.word	g_vmcu_dev
	.fnend
	.size	mcu_get_wrap_status, .-mcu_get_wrap_status
	.align	1
	.global	mcu_wrap_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_start, %function
mcu_wrap_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, .L76
	ldr	r1, [r4, #240]
	cmp	r1, #4
	bne	.L72
	ldr	r2, .L76+4
	movs	r3, #154
	movs	r0, #2
	str	r3, [sp]
	ldr	r3, .L76+8
	bl	vlog
	movs	r1, #0
	movs	r0, #5
	bl	mcu_send_message
	ldr	r3, [r4, #224]
	ldr	r2, .L76+12
	movs	r1, #2
	str	r1, [r4, #240]
	ldr	r3, [r3]
	ldr	r2, [r2]
	ubfx	r3, r3, #0, #14
	cmp	r3, r2
	beq	.L72
	strd	r2, r3, [sp, #4]
	mov	r0, r1
	movs	r3, #159
	ldr	r2, .L76+16
	str	r3, [sp]
	ldr	r3, .L76+8
	bl	vlog
.L72:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L77:
	.align	2
.L76:
	.word	g_vmcu_dev
	.word	.LC10
	.word	.LANCHOR0+63
	.word	.LANCHOR1
	.word	.LC11
	.fnend
	.size	mcu_wrap_start, .-mcu_wrap_start
	.align	1
	.global	mcu_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_reset, %function
mcu_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, .L80
	ldr	r3, [r4, #240]
	cbz	r3, .L78
	movs	r1, #0
	movs	r0, #9
	bl	mcu_send_message
	movs	r0, #100
	bl	msleep
	ldr	r3, [r4, #236]
	mov	r2, #15728880
	movs	r0, #100
	str	r2, [r3]
	pop	{r4, lr}
	b	msleep
.L78:
	pop	{r4, pc}
.L81:
	.align	2
.L80:
	.word	g_vmcu_dev
	.fnend
	.size	mcu_reset, .-mcu_reset
	.align	1
	.global	mcu_wrap_end
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_end, %function
mcu_wrap_end:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, .L84
	ldr	r0, [r4, #240]
	cmp	r0, #2
	bne	.L82
	movs	r3, #178
	ldr	r2, .L84+4
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L84+8
	bl	vlog
	movs	r3, #1
	movs	r1, #0
	str	r3, [r4, #240]
	movs	r0, #6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	mcu_send_message
.L82:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L85:
	.align	2
.L84:
	.word	g_vmcu_dev
	.word	.LC12
	.word	.LANCHOR0+78
	.fnend
	.size	mcu_wrap_end, .-mcu_wrap_end
	.align	1
	.global	mcu_wrap_set_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_set_id, %function
mcu_wrap_set_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	ldr	r4, .L93
	mov	r6, r1
	ldr	r0, [r4, #240]
	cmp	r0, #2
	bne	.L86
	ldr	r2, .L93+4
	ldr	r3, [r2, #4]
	cmp	r3, #9
	add	r1, r3, #1
	str	r1, [r2, #4]
	bgt	.L89
	movs	r3, #187
	strd	r5, r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L93+8
	ldr	r2, .L93+12
	bl	vlog
.L89:
	orr	r1, r5, r6, lsl #2
	ldr	r0, [r4, #244]
	bl	mcu_send_message
	ldr	r3, [r4, #244]
	adds	r3, r3, #1
	cmp	r3, #12
	it	gt
	movgt	r3, #10
	str	r3, [r4, #244]
.L86:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L94:
	.align	2
.L93:
	.word	g_vmcu_dev
	.word	.LANCHOR1
	.word	.LANCHOR0+91
	.word	.LC13
	.fnend
	.size	mcu_wrap_set_id, .-mcu_wrap_set_id
	.align	1
	.global	mcu_wrap_avs_config
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mcu_wrap_avs_config, %function
mcu_wrap_avs_config:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L97
	ldr	r1, [r5, #240]
	cmp	r1, #4
	bne	.L95
	str	r0, [sp, #4]
	movs	r3, #199
	ldr	r2, .L97+4
	movs	r0, #2
	str	r3, [sp]
	ldr	r3, .L97+8
	bl	vlog
	str	r4, [r5, #248]
	mov	r1, r4
	movs	r0, #13
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	mcu_send_message
.L95:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L98:
	.align	2
.L97:
	.word	g_vmcu_dev
	.word	.LC14
	.word	.LANCHOR0+107
	.fnend
	.size	mcu_wrap_avs_config, .-mcu_wrap_avs_config
	.align	1
	.global	vmcu_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_probe, %function
vmcu_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r5, .L121
	movs	r3, #0
	movs	r2, #0
	movs	r1, #0
	strd	r2, [sp, #16]
	mov	r6, r0
	movw	r2, #8444
	mov	r0, r5
	bl	memset
	movs	r1, #4
	ldr	r0, .L121+4
	mov	r4, r5
	bl	ioremap
	ldr	r7, .L121+8
	mov	r1, #8192
	str	r0, [r5, #236]
	ldr	r0, [r7]
	bl	ioremap
	movs	r1, #4
	str	r0, [r5, #228]
	ldr	r0, .L121+12
	bl	ioremap
	ldr	r3, [r5, #236]
	str	r0, [r5, #232]
	ldr	r3, [r3]
	and	r2, r3, #240
	cmp	r2, #240
	beq	.L100
	str	r3, [sp, #4]
	movw	r3, #421
	ldr	r2, .L121+16
	movs	r1, #4
	str	r3, [sp]
	ldr	r3, .L121+20
.L120:
	movs	r0, #2
	bl	vlog
.L99:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L100:
	ldr	r0, .L121+24
	bl	mpi_allocator_find_by_name
	str	r0, [r5, #192]
	cbnz	r0, .L102
	movw	r3, #427
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L121+20
	ldr	r2, .L121+28
	b	.L120
.L102:
	ldr	r3, .L121+32
	ldr	r5, [r3, #8]
	cbz	r5, .L103
	mov	r2, #416
	movs	r1, #0
	mov	r0, r5
	bl	filp_open
	mov	r3, #432
	ldr	r2, .L121+36
	movs	r1, #4
	mov	r5, r0
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r0, #2
	ldr	r3, .L121+20
	bl	vlog
.L103:
	ldr	r3, [r4, #236]
	mov	r2, #15728880
	str	r2, [r3]
	mov	r2, #8192
	cmp	r5, #0
	beq	.L104
	cmn	r5, #4096
	bhi	.L104
	movs	r1, #0
	ldr	r0, [r4, #228]
	bl	memset
	mov	r2, #8192
	ldr	r1, .L121+40
	mov	r0, r5
	add	r3, sp, #16
	bl	kernel_read
	mov	r2, #8192
	ldr	r1, .L121+40
	mov	r8, r0
	ldr	r0, [r4, #228]
	bl	memcpy
	movs	r1, #4
	movs	r0, #2
	ldrd	r2, [sp, #16]
	str	r8, [sp, #4]
	strd	r2, [sp, #8]
	movw	r3, #441
	ldr	r2, .L121+44
	str	r3, [sp]
	ldr	r3, .L121+20
	bl	vlog
	ldr	r3, [r4, #232]
	ldr	r2, [r7]
	movs	r1, #0
	mov	r0, r5
	str	r2, [r3]
	bl	filp_close
.L105:
	movs	r1, #4
	ldr	r0, .L121+48
	bl	ioremap
	mov	r3, #-2147483648
	mov	r2, #15728640
	movs	r1, #4
	str	r3, [r0]
	ldr	r3, [r4, #236]
	ldr	r0, .L121+52
	str	r2, [r3]
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #208]
	ldr	r0, .L121+56
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #212]
	ldr	r0, .L121+60
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #216]
	ldr	r0, .L121+64
	bl	ioremap
	movs	r1, #4
	str	r0, [r4, #220]
	ldr	r0, .L121+68
	bl	ioremap
	mov	r2, #10240
	movs	r1, #1
	str	r0, [r4, #224]
	ldr	r0, [r4, #192]
	bl	mpi_allocator_alloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L107
	movs	r1, #0
	bl	mpi_buf_create
	str	r0, [r4, #196]
	cmp	r0, #0
	beq	.L107
	movs	r2, #32
	movs	r1, #0
	adds	r0, r0, #4
	bl	memset
	ldr	r2, .L121+72
	ldr	r3, [r4, #196]
	mov	r0, r5
	ldrh	r1, [r2]	@ unaligned
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	strh	r1, [r3, #4]	@ unaligned
	strb	r2, [r3, #6]
	bl	dma_buf_put
	mov	r0, r5
	ldr	r7, [r4, #196]
	bl	get_dma_buf_phy_addr
	str	r0, [r7, #660]
	mov	r0, r5
	ldr	r7, [r4, #196]
	bl	dma_buf_vmap
	ldr	r3, [r4, #196]
	mov	r2, #10240
	movs	r1, #0
	str	r0, [r7, #656]
	ldr	r0, [r3, #656]
	bl	memset
	ldr	r3, [r4, #196]
	movs	r1, #1
	ldrd	r2, r3, [r3, #656]
	add	r3, r3, #2048
	str	r3, [r2]
	mov	r3, #8192
	str	r3, [r2, #4]
	ldr	r3, [r4, #196]
	ldr	r0, [r3, #484]
	bl	dma_buf_end_cpu_access
	ldr	r3, [r4, #196]
	movs	r0, #3
	ldr	r1, [r3, #660]
	bl	mcu_send_message
.L107:
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	ldr	r5, .L121+76
	ldr	r7, .L121+80
	mov	r2, r6
	movs	r1, #8
	str	r4, [r4, #140]
	movs	r3, #1
	str	r3, [r4, #188]
	str	r7, [r4, #184]
	str	r0, [r4]
	ldr	r0, .L121+84
	bl	mpi_dev_register
	movs	r3, #0
	strd	r5, r5, [r4, #168]
	add	r1, r7, #20
	str	r3, [r4, #108]
	sub	r0, r5, #164
	strd	r3, r3, [r4, #116]
	str	r3, [r4, #164]
	ldr	r2, .L121+88
	bl	mpi_sysfs_dev_add
	sub	r1, r5, #168
	mov	r3, r6
	mov	r2, #-1
	ldr	r0, .L121+92
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L109
	bl	wake_up_process
.L109:
	mov	r1, #8192
	ldr	r0, .L121+96
	str	r5, [r4, #176]
	bl	mpi_fs_buf_init
	ldr	r3, [r4, #196]
	movs	r1, #4
	movs	r0, #2
	ldr	r3, [r3, #656]
	add	r2, r3, #2048
	str	r2, [r4, #160]
	ldr	r2, [r4, #152]
	adds	r3, r3, #64
	str	r2, [r4, #156]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	mov	r3, #486
	ldr	r2, .L121+100
	str	r3, [sp]
	ldr	r3, .L121+20
	bl	vlog
	movs	r2, #1
	movs	r3, #10
	strd	r2, r3, [r4, #240]
	b	.L99
.L104:
	ldr	r1, [r4, #228]
	ldr	r0, .L121+40
	bl	memcpy
	b	.L105
.L122:
	.align	2
.L121:
	.word	g_vmcu_dev
	.word	536873512
	.word	.LANCHOR2
	.word	539295872
	.word	.LC15
	.word	.LANCHOR0+127
	.word	.LC16
	.word	.LC17
	.word	.LANCHOR1
	.word	.LC18
	.word	g_vmcu_dev+252
	.word	.LC19
	.word	539295756
	.word	547422216
	.word	547422220
	.word	547422304
	.word	547422308
	.word	547423252
	.word	.LC20
	.word	g_vmcu_dev+168
	.word	.LANCHOR0+140
	.word	g_vmcu_dev+4
	.word	.LANCHOR2+4
	.word	vmcu_thread_fn
	.word	g_vmcu_dev+144
	.word	.LC21
	.fnend
	.size	vmcu_probe, .-vmcu_probe
	.align	1
	.global	vmcu_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_shutdown, %function
vmcu_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L154
	add	r0, r4, #144
	str	r3, [r4, #180]
	bl	mpi_fs_buf_deinit
	adds	r0, r4, #4
	bl	mpi_sysfs_dev_remove
	ldr	r0, [r4, #236]
	cbz	r0, .L124
	bl	iounmap
.L124:
	ldr	r0, [r4, #228]
	cbz	r0, .L125
	bl	iounmap
.L125:
	ldr	r0, [r4, #232]
	cbz	r0, .L126
	bl	iounmap
.L126:
	ldr	r0, [r4, #208]
	cbz	r0, .L127
	bl	iounmap
.L127:
	ldr	r0, [r4, #212]
	cbz	r0, .L129
	bl	iounmap
	ldr	r3, [r4, #212]
	cbz	r3, .L129
	ldr	r0, [r4, #216]
	bl	iounmap
.L129:
	ldr	r0, [r4, #220]
	cbz	r0, .L131
	bl	iounmap
.L131:
	ldr	r0, [r4, #224]
	cbz	r0, .L132
	bl	iounmap
.L132:
	ldr	r0, .L154+4
	pop	{r4, lr}
	b	mpi_dev_unregister
.L155:
	.align	2
.L154:
	.word	g_vmcu_dev
	.word	g_vmcu_dev+4
	.fnend
	.size	vmcu_shutdown, .-vmcu_shutdown
	.align	1
	.global	vmcu_load
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_load, %function
vmcu_load:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L157
	bl	vmcu_probe
	movs	r0, #0
	pop	{r3, pc}
.L158:
	.align	2
.L157:
	.word	.LC22
	.fnend
	.size	vmcu_load, .-vmcu_load
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vmcu_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmcu_exit, %function
vmcu_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vmcu_shutdown
	.fnend
	.size	vmcu_exit, .-vmcu_exit
	.global	g_vmcu_dev
	.global	isp_max_h
	.global	isp_max_w
	.global	mcu_fw_addr
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37740, %object
	.size	__func__.37740, 13
__func__.37740:
	.ascii	"vmcu_version\000"
	.type	__func__.37782, %object
	.size	__func__.37782, 13
__func__.37782:
	.ascii	"vmcu_release\000"
	.type	__func__.37753, %object
	.size	__func__.37753, 11
__func__.37753:
	.ascii	"vmcu_ioctl\000"
	.type	__func__.37775, %object
	.size	__func__.37775, 10
__func__.37775:
	.ascii	"vmcu_open\000"
	.type	__func__.37687, %object
	.size	__func__.37687, 16
__func__.37687:
	.ascii	"mcu_wrap_config\000"
	.type	__func__.37701, %object
	.size	__func__.37701, 15
__func__.37701:
	.ascii	"mcu_wrap_start\000"
	.type	__func__.37709, %object
	.size	__func__.37709, 13
__func__.37709:
	.ascii	"mcu_wrap_end\000"
	.type	__func__.37715, %object
	.size	__func__.37715, 16
__func__.37715:
	.ascii	"mcu_wrap_set_id\000"
	.type	__func__.37719, %object
	.size	__func__.37719, 20
__func__.37719:
	.ascii	"mcu_wrap_avs_config\000"
	.type	__func__.37803, %object
	.size	__func__.37803, 11
__func__.37803:
	.ascii	"vmcu_probe\000"
	.space	2
	.type	vmcu_ioctls, %object
	.size	vmcu_ioctls, 20
vmcu_ioctls:
	.word	-1065587456
	.word	0
	.word	vmcu_version
	.word	.LC23
	.word	0
	.type	vmcu_driver_fops, %object
	.size	vmcu_driver_fops, 128
vmcu_driver_fops:
	.word	0
	.space	4
	.word	vmcu_read
	.space	24
	.word	0
	.word	vmcu_ioctl
	.word	vmcu_compat_ioctl
	.word	0
	.space	4
	.word	vmcu_open
	.space	4
	.word	vmcu_release
	.space	60
	.type	mcu_pm_ops, %object
	.size	mcu_pm_ops, 92
mcu_pm_ops:
	.space	92
	.type	__param_str_isp_max_h, %object
	.size	__param_str_isp_max_h, 17
__param_str_isp_max_h:
	.ascii	"rockit.isp_max_h\000"
	.type	__param_str_isp_max_w, %object
	.size	__param_str_isp_max_w, 17
__param_str_isp_max_w:
	.ascii	"rockit.isp_max_w\000"
	.type	__param_str_mcu_fw_addr, %object
	.size	__param_str_mcu_fw_addr, 19
__param_str_mcu_fw_addr:
	.ascii	"rockit.mcu_fw_addr\000"
	.type	__param_str_mcu_fw_path, %object
	.size	__param_str_mcu_fw_path, 19
__param_str_mcu_fw_path:
	.ascii	"rockit.mcu_fw_path\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mcu_fw_addr, %object
	.size	mcu_fw_addr, 4
mcu_fw_addr:
	.word	-9445376
	.type	mcu_driver, %object
	.size	mcu_driver, 104
mcu_driver:
	.space	20
	.space	64
	.word	mcu_pm_ops
	.space	8
	.space	8
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	isp_max_h, %object
	.size	isp_max_h, 4
isp_max_h:
	.space	4
	.type	__func____LINE__.37714, %object
	.size	__func____LINE__.37714, 4
__func____LINE__.37714:
	.space	4
	.type	mcu_fw_path, %object
	.size	mcu_fw_path, 4
mcu_fw_path:
	.space	4
	.type	g_vmcu_dev, %object
	.size	g_vmcu_dev, 8444
g_vmcu_dev:
	.space	8444
	.type	isp_max_w, %object
	.size	isp_max_w, 4
isp_max_w:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_isp_max_htype229, %object
	.size	__UNIQUE_ID_isp_max_htype229, 31
__UNIQUE_ID_isp_max_htype229:
	.ascii	"rockit.parmtype=isp_max_h:uint\000"
	.type	__UNIQUE_ID_isp_max_wtype228, %object
	.size	__UNIQUE_ID_isp_max_wtype228, 31
__UNIQUE_ID_isp_max_wtype228:
	.ascii	"rockit.parmtype=isp_max_w:uint\000"
	.type	__UNIQUE_ID_mcu_fw_addrtype227, %object
	.size	__UNIQUE_ID_mcu_fw_addrtype227, 33
__UNIQUE_ID_mcu_fw_addrtype227:
	.ascii	"rockit.parmtype=mcu_fw_addr:uint\000"
	.type	__UNIQUE_ID_mcu_fw_pathtype226, %object
	.size	__UNIQUE_ID_mcu_fw_pathtype226, 34
__UNIQUE_ID_mcu_fw_pathtype226:
	.ascii	"rockit.parmtype=mcu_fw_path:charp\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct vmcu_version mismatching\033[0m\000"
.LC1:
	.ascii	"\033[1;32mvmcu refcnt %d\033[0m\000"
.LC2:
	.ascii	"vmcu_ioctl: nr = %d, index = %d dev = %p\000"
.LC3:
	.ascii	"\033[1;31mindex = %d\033[0m\000"
.LC4:
	.ascii	"\033[1;31mioctl is null\033[0m\000"
.LC5:
	.ascii	"[%x]: %x\000"
.LC6:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC7:
	.ascii	"\033[1;32mconfig_addr=%p, isp_max_h=%d\033[0m\000"
.LC8:
	.ascii	"\033[1;32misp line = %08x, enc_line = %08x\033[0m\000"
.LC9:
	.ascii	"\033[1;32mg_vmcu_dev.plog_buf->paddr = %x, wrap_lin"
	.ascii	"e = %d\033[0m\000"
.LC10:
	.ascii	"\033[1;32msend wrap start\033[0m\000"
.LC11:
	.ascii	"\033[1;31misp input height config err, config h= %d"
	.ascii	", real h = %d\033[0m\000"
.LC12:
	.ascii	"\033[1;32msend wrap end\033[0m\000"
.LC13:
	.ascii	"\033[1;32mwrap set pipie id =%d, frame id = %d\033["
	.ascii	"0m\000"
.LC14:
	.ascii	"\033[1;32msend wrap avs config %d\033[0m\000"
.LC15:
	.ascii	"\033[1;32mmcu status is not reset = %08x, please ch"
	.ascii	"eck\033[0m\000"
.LC16:
	.ascii	"valloc\000"
.LC17:
	.ascii	"\033[1;31mgetting alloc fail %p\033[0m\000"
.LC18:
	.ascii	"\033[1;32mopen fp = %p\033[0m\000"
.LC19:
	.ascii	"\033[1;32msize = %d, pos = %d\033[0m\000"
.LC20:
	.ascii	"mcu\000"
.LC21:
	.ascii	"\033[1;32mlog buf = %08x, len = %d\033[0m\000"
.LC22:
	.ascii	"vmcu\000"
.LC23:
	.ascii	"VMCU_IOCTL_VERSION\000"
	.section	__param,"a"
	.align	2
	.type	__param_isp_max_h, %object
	.size	__param_isp_max_h, 20
__param_isp_max_h:
	.word	__param_str_isp_max_h
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	isp_max_h
	.type	__param_isp_max_w, %object
	.size	__param_isp_max_w, 20
__param_isp_max_w:
	.word	__param_str_isp_max_w
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	isp_max_w
	.type	__param_mcu_fw_addr, %object
	.size	__param_mcu_fw_addr, 20
__param_mcu_fw_addr:
	.word	__param_str_mcu_fw_addr
	.word	0
	.word	param_ops_uint
	.short	256
	.byte	-1
	.byte	0
	.word	mcu_fw_addr
	.type	__param_mcu_fw_path, %object
	.size	__param_mcu_fw_path, 20
__param_mcu_fw_path:
	.word	__param_str_mcu_fw_path
	.word	0
	.word	param_ops_charp
	.short	256
	.byte	-1
	.byte	0
	.word	mcu_fw_path
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
