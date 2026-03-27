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
	.file	"vi.c"
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
	.type	vi_compat_ioctl, %function
vi_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vi_compat_ioctl, .-vi_compat_ioctl
	.align	1
	.global	vvi_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_get_version, %function
vvi_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r2, #112
	mov	r4, r1
	movs	r1, #0
	add	r0, r4, #12
	movs	r5, #0
	bl	memset
	movs	r3, #1
	strb	r3, [r4]
	movs	r3, #22
	strb	r3, [r4, #4]
	ldr	r3, .L4
	strb	r5, [r4, #1]
	strb	r5, [r4, #2]
	strb	r5, [r4, #3]
	ldr	r6, [r3]
	strb	r5, [r4, #5]
	strb	r5, [r4, #6]
	strb	r5, [r4, #7]
	mov	r0, r6
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	bl	strlen
	movs	r3, #20
	strb	r5, [r4, #53]
	strb	r3, [r4, #52]
	movs	r3, #17
	strb	r5, [r4, #54]
	strb	r5, [r4, #55]
	strb	r3, [r4, #88]
	strb	r5, [r4, #89]
	strb	r5, [r4, #90]
	strb	r5, [r4, #91]
	cmp	r0, #31
	str	r0, [r4, #12]	@ unaligned
	bls	.L3
	movs	r3, #31
	strb	r5, [r4, #13]
	strb	r3, [r4, #12]
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
.L3:
	ldr	r2, [r4, #12]	@ unaligned
	mov	r1, r6
	add	r0, r4, #16
	bl	strncpy
	ldr	r2, [r4, #52]	@ unaligned
	ldr	r1, .L4+4
	add	r0, r4, #56
	bl	strncpy
	ldr	r2, [r4, #88]	@ unaligned
	ldr	r1, .L4+8
	add	r0, r4, #92
	bl	strncpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.fnend
	.size	vvi_get_version, .-vvi_get_version
	.align	1
	.global	vvi_node_get_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_status, %function
vvi_node_get_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #228
	beq	.L7
	movw	r3, #521
	ldr	r2, .L13
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L13+4
	movs	r0, #8
	bl	vlog
.L12:
	mov	r0, #-1
	b	.L6
.L7:
	mov	r3, #524
	ldr	r2, .L13+8
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L13+4
	movs	r0, #8
	bl	vlog
	ldr	r2, [r7, #8]	@ unaligned
	ldr	r1, [r7, #4]	@ unaligned
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L12
	ldr	r4, [r0, #96]
	movs	r1, #5
	ldr	r2, .L13+12
	movs	r0, #8
	ldr	r8, .L13+4
	movs	r6, #0
	ldr	r3, [r4]
	ldr	r9, .L13+20
	str	r3, [sp, #4]
	movw	r3, #530
	str	r3, [sp]
	ldr	r3, .L13+4
	bl	vlog
	ldr	r3, [r4, #116]!
	sub	r3, r3, #472
	ldr	r5, [r3, #472]
	sub	r5, r5, #472
.L9:
	add	r2, r3, #472
	cmp	r2, r4
	bne	.L11
	mov	r3, #540
	ldr	r2, .L13+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L13+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
.L6:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L11:
	ldr	r2, [r3, #44]
	cmp	r6, #7
	it	le
	addle	r1, r6, #6
	mov	r0, #8
	itt	le
	addle	r6, r6, #1
	strle	r2, [r7, r1, lsl #2]	@ unaligned
	movs	r1, #5
	strd	r3, r2, [sp, #4]
	movw	r3, #537
	mov	r2, r9
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	ldr	r2, [r5, #472]
	mov	r3, r5
	sub	r5, r2, #472
	b	.L9
.L14:
	.align	2
.L13:
	.word	.LC2
	.word	.LANCHOR1
	.word	.LC3
	.word	.LC4
	.word	.LC6
	.word	.LC5
	.fnend
	.size	vvi_node_get_status, .-vvi_node_get_status
	.align	1
	.global	vvi_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stop, %function
vvi_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #24]	@ unaligned
	cmp	r3, #264
	beq	.L16
	mov	r3, #488
	ldr	r2, .L27
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L27+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L15:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L16:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1, #4]	@ unaligned
	bl	vsys_get_node_from_map
	ldr	r6, .L27+8
	mov	r5, r0
	cbz	r0, .L18
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L27+12
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #494
	str	r3, [sp]
	ldr	r3, .L27+4
	bl	vlog
	movs	r1, #1
	mov	r0, r5
	bl	mpi_node_flush
	movs	r3, #0
	str	r3, [r6, #4]
	movs	r0, #6
	ldr	r2, [r4, #4]	@ unaligned
	ldr	r1, [r4, #8]	@ unaligned
	mla	r2, r0, r2, r1
	add	r2, r6, r2, lsl #2
	ldr	r2, [r2, #236]
	strb	r3, [r2, #264]
	strb	r3, [r2, #265]
	strb	r3, [r2, #266]
	strb	r3, [r2, #267]
.L18:
	ldr	r3, [r4, #4]	@ unaligned
	adds	r3, r3, #44
	add	r3, r6, r3, lsl #2
	ldr	r2, [r3, #4]
	cbnz	r2, .L19
.L20:
	movs	r0, #0
	b	.L15
.L19:
	ldr	r5, [r4, #8]	@ unaligned
	cmp	r5, #0
	bne	.L20
	str	r5, [r3, #4]
	ldr	r3, [r4, #4]	@ unaligned
	add	r3, r6, r3, lsl #2
	str	r5, [r3, #196]
	ldr	r3, [r4, #4]	@ unaligned
	add	r6, r6, r3, lsl #2
	ldr	r3, [r6, #188]
	cmp	r3, #0
	beq	.L20
	bl	mcu_wrap_end
	movs	r0, #10
	bl	rkos_msleep
	mov	r0, r5
	b	.L15
.L28:
	.align	2
.L27:
	.word	.LC7
	.word	.LANCHOR1+20
	.word	.LANCHOR0
	.word	.LC8
	.fnend
	.size	vvi_node_stop, .-vvi_node_stop
	.align	1
	.global	vvi_node_dev_bind_pipe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_dev_bind_pipe, %function
vvi_node_dev_bind_pipe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r6, r1
	ldr	r3, [r1, #288]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r8, [r1, #324]	@ unaligned
	cmp	r3, #340
	ldr	r9, [r1, #328]	@ unaligned
	beq	.L37
	movw	r3, #1292
	ldr	r2, .L46
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L46+4
	movs	r0, #8
	bl	vlog
.L44:
	mov	r4, #-1
.L29:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L36:
	adds	r2, r5, #6
	mov	r1, r8
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r1, r9
	add	r2, r5, #10
	mov	r7, r0
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbz	r7, .L32
	cbnz	r0, .L33
.L32:
	movw	r3, #1302
	ldr	r2, .L46+8
	str	r3, [sp]
	ldr	r3, .L46+4
	strd	r7, r1, [sp, #4]
.L45:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L44
.L33:
	ldr	r3, [r6, #332]	@ unaligned
	mov	r0, r7
	cbz	r3, .L34
	bl	mpi_node_bind
	orrs	r4, r4, r0
.L35:
	adds	r5, r5, #1
.L30:
	ldr	r3, [r6, #336]	@ unaligned
	cmp	r3, r5
	bgt	.L36
	cmp	r4, #0
	beq	.L29
	movw	r3, #1311
	strd	r8, r9, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L46+12
	ldr	r3, .L46+4
	b	.L45
.L34:
	bl	mpi_node_unbind
	b	.L35
.L37:
	movs	r5, #0
	mov	r4, r5
	b	.L30
.L47:
	.align	2
.L46:
	.word	.LC9
	.word	.LANCHOR1+34
	.word	.LC10
	.word	.LC11
	.fnend
	.size	vvi_node_dev_bind_pipe, .-vvi_node_dev_bind_pipe
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_ioctl, %function
vi_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	uxtb	r4, r1
	mov	r6, r1
	ldr	r1, .L54
	mov	r3, r2
	ldr	r5, [r1, #28]
	cmp	r5, r4
	bls	.L49
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #24]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r1, r5, r4, r1
	cbz	r1, .L49
	mov	r2, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L49:
	str	r4, [sp, #4]
	movw	r3, #1438
	ldr	r2, .L54+4
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L54+8
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	.LC12
	.word	.LANCHOR1+57
	.fnend
	.size	vi_ioctl, .-vi_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_poll, %function
vi_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r0, #128]
	ldrd	r4, r5, [r3, #4]
	movs	r3, #6
	mla	r2, r3, r4, r5
	ldr	r3, .L60
	add	r3, r3, r2, lsl #4
	mov	r2, r1
	add	r1, r3, #620
	bl	rkos_poll_wait
	movw	r3, #1567
	ldr	r2, .L60+4
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	strd	r4, r5, [sp, #4]
	ldr	r3, .L60+8
	bl	vlog
	mov	r2, r5
	mov	r1, r4
	movs	r0, #8
	bl	vsys_get_node_from_map
	cbz	r0, .L56
	ldr	r3, [r0, #380]
	cbz	r3, .L59
	ldr	r4, [r3, #44]
	movs	r1, #4
	movw	r3, #1572
	ldr	r2, .L60+12
	str	r3, [sp]
	movs	r0, #8
	str	r4, [sp, #4]
	ldr	r3, .L60+8
	bl	vlog
	cmp	r4, #0
	ite	le
	movle	r0, #0
	movgt	r0, #1
.L56:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L59:
	movs	r0, #32
	b	.L56
.L61:
	.align	2
.L60:
	.word	.LANCHOR0
	.word	.LC13
	.word	.LANCHOR1+66
	.word	.LC14
	.fnend
	.size	vi_poll, .-vi_poll
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_thread_fn, %function
vvi_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r4, .L68
	add	r5, r4, #812
.L64:
	bl	rkos_kthread_should_stop
	ldr	r3, [r4, #12]
	orrs	r3, r0, r3
	beq	.L65
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L65:
	mov	r0, r5
	bl	rkos_down
	ldr	r0, [r4, #172]
	bl	mpi_queue_pop_obj
	cmp	r0, #0
	beq	.L64
	ldr	r3, [r0, #116]
	ldr	r0, [r3, #64]
	add	r0, r4, r0, lsl #4
	add	r0, r0, #620
	bl	rkos_wakeup
	b	.L64
.L69:
	.align	2
.L68:
	.word	.LANCHOR0
	.fnend
	.size	vvi_thread_fn, .-vvi_thread_fn
	.align	1
	.global	vvi_node_get_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chn_fr, %function
vvi_node_get_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r3, #24
	ldr	r6, [r1, #8]	@ unaligned
	beq	.L71
	movw	r3, #911
	ldr	r2, .L74
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L74+4
	movs	r0, #8
	bl	vlog
.L73:
	mov	r0, #-1
	b	.L70
.L71:
	mov	r2, r6
	mov	r1, r5
	movs	r0, #8
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L73
	movs	r3, #6
	movs	r0, #0
	mla	r5, r3, r5, r6
	ldr	r3, .L74+8
	add	r5, r3, r5, lsl #2
	ldr	r3, [r5, #236]
	ldr	r2, [r3, #124]	@ unaligned
	str	r2, [r4, #16]	@ unaligned
	ldr	r3, [r3, #128]	@ unaligned
	str	r3, [r4, #20]	@ unaligned
.L70:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L75:
	.align	2
.L74:
	.word	.LC15
	.word	.LANCHOR1+74
	.word	.LANCHOR0
	.fnend
	.size	vvi_node_get_chn_fr, .-vvi_node_get_chn_fr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_open, %function
vi_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	movs	r0, #12
	movs	r1, #0
	bl	rkos_kmalloc
	str	r0, [r4, #128]
	cbnz	r0, .L77
	movw	r3, #1454
	ldr	r2, .L79
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L79+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L76:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L77:
	movs	r2, #12
	movs	r1, #0
	bl	rkos_memset
	ldr	r0, .L79+8
	movs	r3, #31
	adds	r0, r0, #32
	str	r3, [r0, #-4]
	bl	mpi_obj_ref
	movw	r3, #1461
	ldr	r2, .L79+12
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L79+4
	bl	vlog
	movs	r0, #0
	b	.L76
.L80:
	.align	2
.L79:
	.word	.LC16
	.word	.LANCHOR1+94
	.word	.LANCHOR0
	.word	.LC17
	.fnend
	.size	vi_open, .-vi_open
	.global	__aeabi_uidiv
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_new_wrap_line.constprop.8, %function
get_new_wrap_line.constprop.8:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r5, r1
	mov	r7, r0
	mov	r1, r0
	.pad #24
	sub	sp, sp, #24
	mov	r8, r2
	mul	r0, r3, r2
	mov	r6, r3
	bl	__aeabi_uidiv
	movw	r3, #329
	ldr	r2, .L88
	movs	r1, #4
	mov	r4, r0
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r0, #8
	strd	r5, r8, [sp, #16]
	strd	r6, r7, [sp, #8]
	ldr	r3, .L88+4
	bl	vlog
	cmp	r4, r5
	bcs	.L84
.L83:
	mov	r1, r4
	mov	r0, r5
	bl	__aeabi_uidivmod
	and	r3, r4, #1
	orrs	r3, r1, r3
	beq	.L81
	subs	r4, r4, #1
	b	.L83
.L84:
	mov	r4, r5
.L81:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L89:
	.align	2
.L88:
	.word	.LC18
	.word	.LANCHOR1+102
	.fnend
	.size	get_new_wrap_line.constprop.8, .-get_new_wrap_line.constprop.8
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_release, %function
vi_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r4, .L150
	str	r1, [sp, #36]
	add	r0, r4, #32
	bl	mpi_obj_unref
	ldr	r3, [r4, #76]
	cmp	r3, #1
	bne	.L91
	ldr	r2, [r4, #32]
	add	r9, r4, #180
	ldr	r1, .L150+4
	ldr	r0, .L150+8
	bl	rkos_printk
	add	r3, r4, #396
	movs	r4, #0
	str	r3, [sp, #20]
	mov	r3, #284
	str	r3, [sp, #24]
.L92:
	ldr	r3, .L150
	movs	r6, #24
	ldr	fp, [sp, #20]
	mov	r8, #0
	str	r3, [sp, #16]
	mla	r6, r6, r4, r3
	mvn	r3, #111
	muls	r3, r4, r3
	str	r3, [sp, #28]
	movs	r3, #112
	muls	r3, r4, r3
	str	r3, [sp, #32]
.L101:
	mov	r2, r8
	mov	r1, r4
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	bne	.L93
.L100:
	ldr	r0, [r6, #236]
	cmp	r0, #0
	bne	.L94
.L95:
	add	r8, r8, #1
	adds	r6, r6, #4
	cmp	r8, #6
	add	fp, fp, #8
	bne	.L101
	movs	r5, #10
	movs	r3, #0
	str	r3, [r9], #4
	str	r3, [r9, #12]
.L103:
	mov	r2, r5
	mov	r1, r4
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L102
	mov	r2, r5
	mov	r1, r4
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L102:
	adds	r5, r5, #1
	cmp	r5, #14
	bne	.L103
	ldr	r0, [r9, #44]
	cbz	r0, .L104
	bl	kfree
	movs	r3, #0
	str	r3, [r9, #44]
.L104:
	ldr	r3, [sp, #20]
	adds	r3, r3, #112
	str	r3, [sp, #20]
	ldr	r3, [sp, #24]
	adds	r3, r3, #32
	str	r3, [sp, #24]
	cmp	r4, #0
	beq	.L116
	ldr	r10, .L150+20
	movs	r6, #0
	sub	fp, r10, #160
.L105:
	mvn	r3, #111
	mov	r9, r10
	muls	r3, r6, r3
	movs	r5, #6
	str	r3, [sp, #20]
	movs	r3, #112
	muls	r3, r6, r3
	str	r3, [sp, #24]
.L107:
	mov	r2, r5
	mov	r1, r6
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	bne	.L106
.L113:
	adds	r5, r5, #1
	add	r9, r9, #8
	cmp	r5, #10
	bne	.L107
	ldr	r3, [sp, #16]
	ldr	r0, [r3, #212]
	cbz	r0, .L114
	bl	kfree
	movs	r3, #0
	ldr	r2, [sp, #16]
	str	r3, [r2, #212]
.L114:
	ldr	r3, [sp, #16]
	add	r10, r10, #112
	add	fp, fp, #56
	adds	r3, r3, #4
	str	r3, [sp, #16]
	cmp	r6, #0
	bne	.L91
	movs	r6, #1
	b	.L105
.L93:
	ldr	r5, [r0, #96]
	mov	r2, r8
	mov	r1, r4
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r7
	bl	mpi_node_destroy
	cbz	r5, .L96
	movs	r1, #1
	mov	r0, r5
	bl	mpi_buf_pool_destroy
.L96:
	ldr	r2, [sp, #24]
	movs	r3, #0
	movs	r1, #4
	movs	r0, #8
	mvn	r10, #79
	str	r3, [r6, r2]
	movw	r3, #1487
	ldr	r2, .L150+12
	str	r3, [sp]
	strd	r4, r8, [sp, #4]
	ldr	r3, .L150+4
	bl	vlog
	ldr	r2, [r7, #112]
	add	r3, r2, #33
	adds	r2, r2, #43
	sub	r3, r10, r3, lsl #3
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #32]
	add	r1, fp, r1
	ldr	r5, [r1, r0]
	add	r5, r5, r3
	ldr	r2, [r5, r2, lsl #3]
.L148:
	add	r10, r3, r2
	ldr	r3, [r7, #112]
	adds	r3, r3, #43
	add	r3, r5, r3, lsl #3
	cmp	r3, fp
	beq	.L100
	cbz	r5, .L98
	ldr	r3, [r5]
	movs	r1, #4
	ldr	r2, .L150+16
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #1490
	str	r3, [sp]
	ldr	r3, .L150+4
	bl	vlog
	ldr	r3, [r7, #112]
	mov	r0, #256
	add	r3, r5, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r2, #290
	strd	r0, r2, [r3, #344]
	mov	r0, r5
	bl	mpi_obj_unref
.L98:
	ldr	r3, [r7, #112]
	mvn	r2, #79
	mov	r5, r10
	add	r1, r3, #33
	adds	r3, r3, #43
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r10, r3, lsl #3]
	b	.L148
.L94:
	bl	kfree
	movs	r3, #0
	str	r3, [r6, #236]
	b	.L95
.L116:
	movs	r4, #1
	b	.L92
.L106:
	mov	r2, r5
	mov	r1, r6
	movs	r0, #8
	bl	vsys_remove_node_from_map
	mov	r0, r7
	bl	mpi_node_destroy
	ldr	r0, [r7, #96]
	cbz	r0, .L109
	movs	r1, #1
	bl	mpi_buf_pool_destroy
.L109:
	movs	r3, #0
	ldr	r2, .L150+12
	str	r3, [fp, r5, lsl #2]
	movs	r1, #4
	movw	r3, #1526
	strd	r6, r5, [sp, #4]
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L150+4
	mvn	r8, #79
	bl	vlog
	ldr	r2, [r7, #112]
	add	r3, r2, #33
	adds	r2, r2, #43
	sub	r3, r8, r3, lsl #3
	ldr	r1, [sp, #20]
	ldr	r0, [sp, #24]
	add	r1, r9, r1
	ldr	r4, [r1, r0]
	add	r4, r4, r3
	ldr	r2, [r4, r2, lsl #3]
.L149:
	add	r8, r3, r2
	ldr	r3, [r7, #112]
	adds	r3, r3, #43
	add	r3, r4, r3, lsl #3
	cmp	r3, r9
	beq	.L113
	cbz	r4, .L111
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L150+16
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #1529
	str	r3, [sp]
	ldr	r3, .L150+4
	bl	vlog
	ldr	r3, [r7, #112]
	mov	r0, r4
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #344]
	bl	mpi_obj_unref
.L111:
	ldr	r3, [r7, #112]
	mvn	r2, #79
	mov	r4, r8
	add	r1, r3, #33
	adds	r3, r3, #43
	sub	r2, r2, r1, lsl #3
	ldr	r3, [r8, r3, lsl #3]
	b	.L149
.L91:
	ldr	r3, [sp, #36]
	ldr	r0, [r3, #128]
	cbz	r0, .L115
	bl	rkos_kfree
.L115:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L151:
	.align	2
.L150:
	.word	.LANCHOR0
	.word	.LANCHOR1+120
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LANCHOR0+444
	.fnend
	.size	vi_release, .-vi_release
	.align	1
	.global	vvi_change_resolution
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_change_resolution, %function
vvi_change_resolution:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #20]	@ unaligned
	cmp	r3, #40
	beq	.L153
	movw	r3, #642
	ldr	r2, .L174
	str	r3, [sp]
	ldr	r3, .L174+4
.L173:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L160:
	mov	r0, #-1
	b	.L152
.L153:
	ldr	r2, [r1, #8]	@ unaligned
	movs	r0, #8
	ldr	r1, [r1, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r8, r0
	cmp	r0, #0
	beq	.L160
	ldr	r6, [r0, #116]
	cbnz	r6, .L155
	ldr	r3, .L174+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r6, r0
	cbnz	r0, .L156
	movw	r3, #653
	ldr	r2, .L174+12
	str	r3, [sp]
	ldr	r3, .L174+4
	b	.L173
.L156:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #6
	ldr	r2, [r4, #8]	@ unaligned
	mla	r3, r1, r3, r2
	str	r3, [r0, #64]
.L155:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r0, #8
	ldr	r5, .L174+16
	add	r3, r5, r3, lsl #2
	ldr	r7, [r3, #196]
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [r6, #48]
	ldr	r2, [r4, #28]	@ unaligned
	str	r2, [r6, #52]
	ldr	r1, [r8, #92]
	str	r3, [sp, #4]
	movw	r3, #663
	str	r3, [sp]
	strd	r2, r1, [sp, #8]
	movs	r1, #5
	ldr	r3, .L174+4
	ldr	r2, .L174+20
	bl	vlog
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	movs	r0, #8
	add	r2, r5, r3, lsl #2
	str	r7, [sp, #12]
	ldr	r2, [r2, #180]
	strd	r3, r2, [sp, #4]
	mov	r3, #664
	ldr	r2, .L174+24
	str	r3, [sp]
	ldr	r3, .L174+4
	bl	vlog
	ldr	r3, [r4, #4]	@ unaligned
	add	r2, r5, r3, lsl #2
	ldr	r2, [r2, #180]
	cbz	r2, .L157
	ldr	r2, [r4, #8]	@ unaligned
	cbnz	r2, .L157
	add	r3, r5, r3, lsl #2
	ldr	r2, [r4, #12]	@ unaligned
	ldrd	r0, r1, [r6, #48]
	ldr	r3, [r3, #204]
	bl	get_new_wrap_line.constprop.8
	ldr	r3, [r4, #4]	@ unaligned
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #188]
	mov	r7, r0
	cbz	r3, .L157
	bl	mcu_wrap_end
	movs	r0, #10
	bl	rkos_msleep
.L157:
	movs	r3, #2
	str	r7, [r6, #56]
	str	r3, [r6, #20]
	mov	r1, r6
	mov	r0, r8
	bl	mpi_node_set_params
	ldr	r3, [r4, #4]	@ unaligned
	add	r2, r5, r3, lsl #2
	ldr	r2, [r2, #180]
	cbz	r2, .L158
	ldr	r2, [r4, #8]	@ unaligned
	cbnz	r2, .L158
	add	r3, r5, r3, lsl #2
	ldr	r3, [r3, #188]
	cbz	r3, .L159
	mov	r0, r7
	bl	mcu_set_wrap_line
	mov	r1, r7
	ldr	r0, [r6, #52]
	bl	mcu_wrap_config
.L159:
	ldr	r3, [r4, #4]	@ unaligned
	add	r5, r5, r3, lsl #2
	str	r7, [r5, #196]
.L158:
	mov	r3, #684
	ldr	r2, .L174+28
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L174+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
.L152:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L175:
	.align	2
.L174:
	.word	.LC22
	.word	.LANCHOR1+131
	.word	kmalloc_caches
	.word	.LC23
	.word	.LANCHOR0
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.fnend
	.size	vvi_change_resolution, .-vvi_change_resolution
	.align	1
	.global	vvi_node_get_pipe_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_pipe_status, %function
vvi_node_get_pipe_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r1
	ldr	r3, [r1, #268]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r3, #284
	beq	.L177
	movw	r3, #858
	ldr	r2, .L182
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L182+4
	movs	r0, #8
	bl	vlog
.L181:
	mov	r0, #-1
.L176:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L177:
	cmp	r5, #1
	bls	.L179
	movs	r1, #2
	movw	r3, #863
	strd	r5, r1, [sp, #4]
	movs	r0, #8
	str	r3, [sp]
	ldr	r2, .L182+8
	ldr	r3, .L182+4
	bl	vlog
	b	.L181
.L179:
	ldr	r3, .L182+12
	adds	r5, r5, #56
	add	r7, r3, r5, lsl #2
	mov	r4, r3
	ldr	r2, [r7, #4]
	cbnz	r2, .L180
	ldr	r3, .L182+16
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r7, #4]
.L180:
	add	r3, r4, r5, lsl #2
	movs	r0, #0
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #272]	@ unaligned
	str	r3, [r6, #272]	@ unaligned
	b	.L176
.L183:
	.align	2
.L182:
	.word	.LC27
	.word	.LANCHOR1+153
	.word	.LC28
	.word	.LANCHOR0
	.word	kmalloc_caches
	.fnend
	.size	vvi_node_get_pipe_status, .-vvi_node_get_pipe_status
	.align	1
	.global	vvi_node_set_pipe_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_pipe_status, %function
vvi_node_set_pipe_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r1
	ldr	r3, [r1, #268]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r3, #284
	beq	.L185
	movw	r3, #838
	ldr	r2, .L190
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L190+4
	movs	r0, #8
	bl	vlog
.L189:
	mov	r0, #-1
.L184:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L185:
	cmp	r5, #1
	bls	.L187
	movs	r1, #2
	movw	r3, #843
	strd	r5, r1, [sp, #4]
	movs	r0, #8
	str	r3, [sp]
	ldr	r2, .L190+8
	ldr	r3, .L190+4
	bl	vlog
	b	.L189
.L187:
	ldr	r3, .L190+12
	adds	r5, r5, #56
	add	r7, r3, r5, lsl #2
	mov	r4, r3
	ldr	r2, [r7, #4]
	cbnz	r2, .L188
	ldr	r3, .L190+16
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r7, #4]
.L188:
	add	r3, r4, r5, lsl #2
	ldr	r2, [r6, #272]	@ unaligned
	movs	r0, #0
	ldr	r3, [r3, #4]
	str	r2, [r3, #272]	@ unaligned
	b	.L184
.L191:
	.align	2
.L190:
	.word	.LC27
	.word	.LANCHOR1+178
	.word	.LC28
	.word	.LANCHOR0
	.word	kmalloc_caches
	.fnend
	.size	vvi_node_set_pipe_status, .-vvi_node_set_pipe_status
	.align	1
	.global	vvi_node_set_chn_fr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chn_fr, %function
vvi_node_set_chn_fr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	cmp	r3, #24
	ldr	r8, [r1, #8]	@ unaligned
	beq	.L193
	movw	r3, #882
	ldr	r2, .L198
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L198+4
	movs	r0, #8
	bl	vlog
.L192:
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L193:
	mov	r2, r8
	mov	r1, r6
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L192
	movs	r4, #6
	ldr	r3, .L198+8
	mla	r4, r4, r6, r8
	mov	r9, r3
	adds	r4, r4, #58
	add	r4, r3, r4, lsl #2
	ldr	r2, [r4, #4]
	cbnz	r2, .L195
	ldr	r3, .L198+12
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r4, #4]
.L195:
	movs	r3, #6
	ldr	r2, [r5, #16]	@ unaligned
	mla	r6, r3, r6, r8
	add	r3, r9, r6, lsl #2
	ldr	r3, [r3, #236]
	str	r2, [r3, #124]	@ unaligned
	add	r2, r7, #260
	ldr	r1, [r5, #20]	@ unaligned
	str	r1, [r3, #128]	@ unaligned
	add	r3, r7, #252
	ldr	r0, [r5, #16]	@ unaligned
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	mpi_node_set_frame_rate
.L199:
	.align	2
.L198:
	.word	.LC15
	.word	.LANCHOR1+203
	.word	.LANCHOR0
	.word	kmalloc_caches
	.fnend
	.size	vvi_node_set_chn_fr, .-vvi_node_set_chn_fr
	.align	1
	.global	vvi_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_start, %function
vvi_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r1
	ldr	r3, [r1, #24]	@ unaligned
	.pad #76
	sub	sp, sp, #76
	cmp	r3, #264
	beq	.L201
	movw	r3, #373
	ldr	r2, .L242
	str	r3, [sp]
	ldr	r3, .L242+4
.L240:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L241
.L201:
	ldr	r0, .L242+8
	bl	mpi_allocator_find_by_name
	mov	r9, r0
	cbnz	r0, .L203
	movw	r3, #379
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L242+4
	movs	r0, #8
	ldr	r2, .L242+12
	bl	vlog
.L241:
	mov	r9, #-1
.L200:
	mov	r0, r9
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L203:
	ldr	r4, [r5, #4]	@ unaligned
	movs	r3, #6
	ldr	r6, [r5, #8]	@ unaligned
	movs	r0, #8
	ldr	r8, .L242+16
	mov	r1, r4
	mla	r3, r3, r4, r6
	add	r3, r8, r3, lsl #2
	ldr	r3, [r3, #236]
	ldr	r2, [r3, #132]	@ unaligned
	str	r2, [sp, #64]
	ldr	r2, [r3, #196]	@ unaligned
	str	r2, [sp, #44]
	ldr	r2, [r3, #200]	@ unaligned
	str	r2, [sp, #48]
	ldr	r2, [r3, #204]	@ unaligned
	str	r2, [sp, #52]
	ldr	r2, [r3, #208]	@ unaligned
	str	r2, [sp, #56]
	ldr	r2, [r3, #188]	@ unaligned
	ldr	r3, [r3, #192]	@ unaligned
	str	r2, [sp, #68]
	mov	r2, r6
	str	r3, [sp, #60]
	bl	vsys_get_node_from_map
	ldr	r10, [r5, #52]	@ unaligned
	ubfx	r3, r10, #2, #1
	mov	r7, r0
	cmp	r3, #0
	beq	.L221
	ldr	r3, [r5, #48]	@ unaligned
	add	r8, r8, r4, lsl #2
	str	r3, [r8, #204]
	ldr	fp, [r5, #28]	@ unaligned
	ldr	r8, [r5, #48]	@ unaligned
	mov	r0, fp
	mov	r1, r8
	bl	__aeabi_uidivmod
	cbz	r1, .L205
	mov	r3, r8
	ldr	r2, [r5, #12]	@ unaligned
	mov	r1, fp
	ldr	r0, [r5, #20]	@ unaligned
	bl	get_new_wrap_line.constprop.8
	mov	r8, r0
.L205:
	ldr	r3, .L242+16
	ubfx	fp, r10, #5, #1
	add	r3, r3, r4, lsl #2
	ldr	r3, [r3, #180]
	cmp	r3, #1
	beq	.L222
	ldr	r10, [r7, #116]
	cmp	r10, #0
	bne	.L207
	ldr	r3, .L242+20
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r10, r0
	cbnz	r0, .L208
	movw	r3, #401
.L239:
	str	r3, [sp]
	ldr	r2, .L242+24
	ldr	r3, .L242+4
	b	.L240
.L208:
	movs	r3, #6
	mla	r3, r3, r4, r6
	str	r3, [r0, #64]
.L207:
	movs	r1, #14
	movs	r3, #1
	mla	r2, r1, r4, r6
	str	r3, [r10, #20]
	ldr	r3, .L242+16
	str	r8, [r10, #56]
	str	fp, [r10, #148]
	add	r2, r3, r2, lsl #2
	ldr	r2, [r2, #284]
	cbnz	r2, .L210
	ldr	r2, [sp, #64]
	cmp	r2, #2
	bne	.L211
	movs	r2, #6
	mla	r2, r2, r4, r6
	add	r2, r3, r2, lsl #2
	ldr	r0, [r2, #236]
	ldr	r2, [r0, #216]	@ unaligned
	ldr	r0, [r0, #220]	@ unaligned
	mla	r2, r1, r2, r0
	ldr	r1, .L242+28
	add	r3, r3, r2, lsl #2
	ldr	r0, [r3, #284]
	bl	mpi_buf_pool_dup
.L212:
	movs	r3, #14
	mla	r2, r3, r4, r6
	ldr	r3, .L242+16
	add	r3, r3, r2, lsl #2
	str	r0, [r3, #284]
	cbz	r0, .L210
	mov	r1, r7
	bl	mpi_buf_pool_add_user
.L210:
	mov	r1, r10
	mov	r0, r7
	bl	mpi_node_set_params
	mov	r9, r0
.L206:
	cmp	fp, #0
	beq	.L214
	bl	mcu_wrap_end
	mov	r0, r8
	bl	mcu_set_wrap_line
	movs	r1, #0
	ldr	r0, [r5, #28]	@ unaligned
	bl	mcu_wrap_config
	ldr	r3, [sp, #64]
	cmp	r3, #2
	bne	.L215
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bne	.L215
	ldr	r3, [sp, #48]
	ldr	r2, [sp, #56]
	cmp	r3, r2
	bne	.L215
	movs	r0, #1
.L238:
	bl	mcu_wrap_avs_config
	ldr	r3, .L242+16
	movs	r2, #1
	add	r3, r3, r4, lsl #2
	str	r2, [r3, #188]
.L214:
	ldr	r1, [r5, #28]	@ unaligned
	ldr	r0, .L242+32
	bl	rkos_printk
	ldr	r3, .L242+16
	movs	r1, #1
	add	r2, r3, r4, lsl #2
	mov	r3, r2
	str	r1, [r2, #180]
	ldr	r2, [r5, #48]	@ unaligned
	str	r2, [r3, #196]
.L204:
	ldr	r3, [sp, #60]
	movs	r1, #4
	str	r4, [sp, #4]
	movs	r0, #8
	ldr	r2, .L242+36
	str	r3, [sp, #32]
	ldr	r3, [sp, #68]
	str	r3, [sp, #28]
	ldr	r3, [sp, #56]
	str	r3, [sp, #24]
	ldr	r3, [sp, #52]
	str	r3, [sp, #20]
	ldr	r3, [sp, #48]
	str	r3, [sp, #16]
	ldr	r3, [sp, #44]
	strd	r6, r3, [sp, #8]
	mov	r3, #450
	str	r3, [sp]
	ldr	r3, .L242+4
	bl	vlog
	ldr	r3, [sp, #52]
	cmp	r3, #0
	beq	.L217
	ldr	r1, [r7, #116]
	cbnz	r1, .L218
	ldr	r3, .L242+20
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r1, r0
	cbnz	r0, .L219
	movw	r3, #455
	b	.L239
.L211:
	ldr	r3, [r5, #12]	@ unaligned
	mov	r0, r9
	ldr	r2, [r5, #48]	@ unaligned
	ldr	r1, .L242+40
	muls	r2, r3, r2
	ldr	r3, .L242+44
	str	r3, [sp]
	movs	r3, #4
	add	r2, r2, r2, lsl #1
	lsrs	r2, r2, #1
	bl	mpi_buf_pool_create
	b	.L212
.L222:
	mov	r9, #0
	b	.L206
.L215:
	movs	r0, #0
	b	.L238
.L221:
	mov	r9, r3
	b	.L204
.L219:
	movs	r3, #6
	mla	r3, r3, r4, r6
	str	r3, [r0, #64]
.L218:
	movs	r3, #3
	str	r3, [r1, #20]
	ldr	r3, [sp, #44]
	mov	r0, r7
	str	r3, [r1, #32]
	ldr	r3, [sp, #48]
	str	r3, [r1, #36]
	ldr	r3, [sp, #52]
	str	r3, [r1, #40]
	ldr	r3, [sp, #56]
	str	r3, [r1, #44]
	ldr	r3, [sp, #68]
	str	r3, [r1, #24]
	ldr	r3, [sp, #60]
	str	r3, [r1, #28]
	bl	mpi_node_set_params
	mov	r9, r0
.L217:
	ldr	r3, .L242+16
	movs	r2, #1
	str	r2, [r3, #4]
	cbz	r7, .L220
	mov	r3, #472
	ldr	r2, .L242+48
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L242+4
	movs	r0, #8
	bl	vlog
	mov	r0, r7
	bl	mpi_node_streamon
	mov	r9, r0
.L220:
	mov	r3, #476
	strd	r4, r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L242+4
	movs	r0, #8
	ldr	r2, .L242+52
	bl	vlog
	b	.L200
.L243:
	.align	2
.L242:
	.word	.LC7
	.word	.LANCHOR1+223
	.word	.LC29
	.word	.LC30
	.word	.LANCHOR0
	.word	kmalloc_caches
	.word	.LC23
	.word	.LC31
	.word	.LC33
	.word	.LC34
	.word	-2147483647
	.word	.LC32
	.word	.LC35
	.word	.LC36
	.fnend
	.size	vvi_node_start, .-vvi_node_start
	.align	1
	.global	vvi_node_get_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_chns_attr, %function
vvi_node_get_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r7, r1
	ldr	r3, [r1, #268]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	cmp	r3, #284
	ldr	r8, [r1, #8]	@ unaligned
	beq	.L245
	mov	r3, #724
	ldr	r2, .L252
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L252+4
	movs	r0, #8
	bl	vlog
.L251:
	mov	r0, #-1
.L244:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L245:
	cmp	r6, #1
	bls	.L247
	mov	r3, #728
	ldr	r2, .L252+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L252+4
	strd	r6, r1, [sp, #4]
.L250:
	movs	r0, #8
	bl	vlog
	b	.L251
.L247:
	cmp	r8, #5
	mov	r4, #6
	bls	.L248
	mov	r3, #732
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L252+4
	ldr	r2, .L252+12
	b	.L250
.L248:
	mla	r4, r4, r6, r8
	ldr	r5, .L252+16
	adds	r4, r4, #58
	add	r4, r5, r4, lsl #2
	ldr	r2, [r4, #4]
	cbnz	r2, .L249
	ldr	r3, .L252+20
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r4, #4]
.L249:
	movs	r3, #6
	mov	r2, #284
	mla	r3, r3, r6, r8
	mov	r0, r7
	add	r3, r5, r3, lsl #2
	ldr	r1, [r3, #236]
	bl	memcpy
	movs	r0, #0
	b	.L244
.L253:
	.align	2
.L252:
	.word	.LC27
	.word	.LANCHOR1+238
	.word	.LC28
	.word	.LC37
	.word	.LANCHOR0
	.word	kmalloc_caches
	.fnend
	.size	vvi_node_get_chns_attr, .-vvi_node_get_chns_attr
	.align	1
	.global	vvi_node_set_chns_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_chns_attr, %function
vvi_node_set_chns_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r6, r1
	ldr	r3, [r1, #268]	@ unaligned
	ldr	r5, [r1, #4]	@ unaligned
	cmp	r3, #284
	ldr	r8, [r1, #8]	@ unaligned
	beq	.L255
	mov	r3, #696
	ldr	r2, .L262
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L262+4
	movs	r0, #8
	bl	vlog
.L261:
	mov	r0, #-1
.L254:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L255:
	cmp	r5, #1
	bls	.L257
	mov	r3, #700
	ldr	r2, .L262+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L262+4
	strd	r5, r1, [sp, #4]
.L260:
	movs	r0, #8
	bl	vlog
	b	.L261
.L257:
	cmp	r8, #5
	mov	r4, #6
	bls	.L258
	mov	r3, #704
	strd	r8, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L262+4
	ldr	r2, .L262+12
	b	.L260
.L258:
	mla	r4, r4, r5, r8
	ldr	r7, .L262+16
	adds	r4, r4, #58
	add	r4, r7, r4, lsl #2
	ldr	r2, [r4, #4]
	cbnz	r2, .L259
	ldr	r3, .L262+20
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r4, #4]
.L259:
	movs	r3, #6
	mov	r2, #284
	mla	r5, r3, r5, r8
	mov	r1, r6
	adds	r5, r5, #58
	add	r5, r7, r5, lsl #2
	ldr	r0, [r5, #4]
	ldr	r4, [r0, #272]	@ unaligned
	bl	memcpy
	ldr	r3, [r5, #4]
	movs	r0, #0
	str	r4, [r3, #272]	@ unaligned
	b	.L254
.L263:
	.align	2
.L262:
	.word	.LC27
	.word	.LANCHOR1+261
	.word	.LC28
	.word	.LC37
	.word	.LANCHOR0
	.word	kmalloc_caches
	.fnend
	.size	vvi_node_set_chns_attr, .-vvi_node_set_chns_attr
	.align	1
	.global	vvi_node_get_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_dev_status, %function
vvi_node_get_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r3, [r1, #268]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #284
	ldr	r9, [r1, #4]	@ unaligned
	ldr	r8, [r1, #8]	@ unaligned
	beq	.L265
	movw	r3, #787
	ldr	r2, .L286
	str	r3, [sp]
	ldr	r3, .L286+4
.L285:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L283:
	mov	r4, #-1
	b	.L264
.L265:
	ldr	r5, .L286+8
	ldr	r3, [r5, #816]
	cbnz	r3, .L278
.L268:
	adds	r3, r4, #1
	bne	.L272
	cmp	r9, #1
	bls	.L273
	mov	r3, #808
	ldr	r2, .L286+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L286+4
	strd	r9, r1, [sp, #4]
.L284:
	movs	r0, #8
	bl	vlog
.L264:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L270:
	bl	mcu_get_wrap_status
	cbnz	r0, .L269
	movs	r0, #10
	bl	rkos_msleep
.L267:
	adds	r6, r6, #-1
	bcs	.L270
.L271:
	movw	r3, #801
	ldr	r2, .L286+16
	str	r3, [sp]
	ldr	r3, .L286+4
	b	.L285
.L278:
	movs	r6, #50
	b	.L267
.L269:
	cmp	r6, #0
	bne	.L268
	b	.L271
.L273:
	cmp	r8, #5
	mov	r6, #6
	bls	.L274
	movw	r3, #813
	strd	r9, r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L286+4
	ldr	r2, .L286+12
	b	.L284
.L274:
	mla	r6, r6, r9, r8
	adds	r6, r6, #58
	add	r6, r5, r6, lsl #2
	ldr	r3, [r6, #4]
	cbnz	r3, .L275
	ldr	r3, .L286+20
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r6, #4]
.L275:
	movs	r4, #6
	mla	r4, r4, r9, r8
	adds	r4, r4, #58
	add	r4, r5, r4, lsl #2
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #272]	@ unaligned
	str	r3, [r7, #272]	@ unaligned
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #264]	@ unaligned
	str	r3, [r7, #264]	@ unaligned
.L282:
	movs	r4, #0
	b	.L264
.L272:
	cmp	r4, #1
	bls	.L276
	movs	r1, #2
	movw	r3, #822
	strd	r4, r1, [sp, #4]
	movs	r0, #8
	str	r3, [sp]
	ldr	r2, .L286+24
	ldr	r3, .L286+4
	bl	vlog
	b	.L283
.L276:
	adds	r4, r4, #52
	add	r6, r5, r4, lsl #2
	ldr	r3, [r6, #4]
	cbnz	r3, .L277
	ldr	r3, .L286+20
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r6, #4]
.L277:
	add	r4, r5, r4, lsl #2
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #272]	@ unaligned
	str	r3, [r7, #272]	@ unaligned
	b	.L282
.L287:
	.align	2
.L286:
	.word	.LC27
	.word	.LANCHOR1+284
	.word	.LANCHOR0
	.word	.LC28
	.word	.LC38
	.word	kmalloc_caches
	.word	.LC39
	.fnend
	.size	vvi_node_get_dev_status, .-vvi_node_get_dev_status
	.align	1
	.global	vvi_node_set_dev_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_dev_status, %function
vvi_node_set_dev_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r5, r1
	ldr	r3, [r1, #268]	@ unaligned
	ldr	r4, [r1]	@ unaligned
	cmp	r3, #284
	beq	.L289
	movw	r3, #749
	ldr	r2, .L300
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L300+4
	movs	r0, #8
	bl	vlog
.L298:
	mov	r4, #-1
	b	.L288
.L289:
	adds	r3, r4, #1
	bne	.L291
	ldr	r7, [r1, #4]	@ unaligned
	cmp	r7, #1
	bls	.L292
	movw	r3, #755
	ldr	r2, .L300+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L300+4
	strd	r7, r1, [sp, #4]
.L299:
	movs	r0, #8
	bl	vlog
.L288:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L292:
	ldr	r8, [r1, #8]	@ unaligned
	movs	r2, #6
	cmp	r8, #5
	bls	.L293
	mov	r3, #760
	strd	r7, r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L300+4
	ldr	r2, .L300+8
	b	.L299
.L293:
	mla	r4, r2, r7, r8
	ldr	r6, .L300+12
	adds	r4, r4, #58
	add	r4, r6, r4, lsl #2
	ldr	r2, [r4, #4]
	cbnz	r2, .L294
	ldr	r3, .L300+16
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r4, #4]
.L294:
	movs	r3, #6
	ldr	r1, [r5, #272]	@ unaligned
	mla	r3, r3, r7, r8
	adds	r3, r3, #58
	add	r3, r6, r3, lsl #2
	ldr	r2, [r3, #4]
	str	r1, [r2, #272]	@ unaligned
	ldr	r3, [r3, #4]
	ldr	r2, [r5, #264]	@ unaligned
	str	r2, [r3, #264]	@ unaligned
.L297:
	movs	r4, #0
	b	.L288
.L291:
	cmp	r4, #1
	bls	.L295
	movs	r1, #2
	movw	r3, #769
	strd	r4, r1, [sp, #4]
	movs	r0, #8
	str	r3, [sp]
	ldr	r2, .L300+20
	ldr	r3, .L300+4
	bl	vlog
	b	.L298
.L295:
	ldr	r6, .L300+12
	adds	r4, r4, #52
	add	r7, r6, r4, lsl #2
	ldr	r2, [r7, #4]
	cbnz	r2, .L296
	ldr	r3, .L300+16
	mov	r1, #3520
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	str	r0, [r7, #4]
.L296:
	add	r3, r6, r4, lsl #2
	ldr	r2, [r5, #272]	@ unaligned
	ldr	r3, [r3, #4]
	str	r2, [r3, #272]	@ unaligned
	b	.L297
.L301:
	.align	2
.L300:
	.word	.LC27
	.word	.LANCHOR1+308
	.word	.LC28
	.word	.LANCHOR0
	.word	kmalloc_caches
	.word	.LC39
	.fnend
	.size	vvi_node_set_dev_status, .-vvi_node_set_dev_status
	.align	1
	.global	vi_dev_pipe_chn_change
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vi_dev_pipe_chn_change, %function
vi_dev_pipe_chn_change:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	adds	r0, r3, #1
	bne	.L303
	ldr	r3, [r2]
	adds	r3, r3, #10
.L305:
	str	r3, [r2]
.L302:
	bx	lr
.L303:
	ldr	r0, [r1]
	adds	r0, r0, #1
	bne	.L302
	str	r3, [r1]
	ldr	r3, [r2]
	adds	r3, r3, #6
	b	.L305
	.fnend
	.size	vi_dev_pipe_chn_change, .-vi_dev_pipe_chn_change
	.align	1
	.global	vvi_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_create, %function
vvi_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r3, [r1, #24]	@ unaligned
	.pad #44
	sub	sp, sp, #44
	ldr	r5, [r0, #128]
	cmp	r3, #264
	beq	.L307
	movs	r3, #151
	ldr	r2, .L351
	str	r3, [sp]
	ldr	r3, .L351+4
.L350:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
	b	.L348
.L307:
	ldr	r0, .L351+8
	bl	mpi_allocator_find_by_name
	mov	r8, r0
	cbnz	r0, .L309
	movs	r3, #156
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L351+4
	movs	r0, #8
	ldr	r2, .L351+12
	bl	vlog
.L348:
	mov	r0, #-1
	b	.L306
.L309:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r3, [r4]	@ unaligned
	ldr	r7, [r4, #4]	@ unaligned
	adds	r0, r2, #1
	ldr	r9, [r4, #132]	@ unaligned
	mov	r0, #8
	it	ne
	movne	r1, #6
	str	r3, [sp, #28]
	str	r7, [sp, #32]
	it	eq
	addeq	r7, r3, #12
	str	r2, [sp, #36]
	str	r3, [r5]
	it	ne
	mlane	r7, r1, r7, r2
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #36]
	movs	r1, #4
	str	r3, [r5, #4]
	str	r2, [r5, #8]
	strd	r3, r2, [sp, #4]
	movs	r3, #174
	ldr	r2, .L351+16
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	add	r2, sp, #36
	add	r1, sp, #32
	add	r0, sp, #28
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #32]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L312
	ldr	r3, [sp, #36]
	movs	r1, #4
	ldr	r2, .L351+20
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [sp, #32]
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	r3, [sp, #4]
	movs	r3, #179
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	mvn	r0, #1
.L306:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L312:
	add	r10, r4, #56
	mov	r0, r10
	bl	mpi_dev_find_by_name
	mov	r3, r10
	mov	r2, r0
	ldr	r1, [sp, #32]
	mov	fp, r0
	ldr	r0, .L351+24
	bl	rkos_printk
	ldr	r3, .L351+28
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L313
	movs	r3, #187
	ldr	r2, .L351+32
	str	r3, [sp]
	ldr	r3, .L351+4
	b	.L350
.L313:
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [r0, #48]
	ldr	r2, [r4, #28]	@ unaligned
	str	r2, [r0, #52]
	ldr	r1, [r4, #12]	@ unaligned
	str	r1, [r0, #24]
	ldr	r0, [r4, #16]	@ unaligned
	str	r7, [r5, #64]
	str	r0, [r5, #28]
	strd	r2, r1, [sp, #8]
	movs	r1, #4
	strd	r0, r9, [sp, #16]
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #196
	ldr	r2, .L351+36
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	ldr	r3, [r4, #96]	@ unaligned
	str	r3, [r5, #60]
	cmp	fp, #0
	bne	.L314
.L315:
	ldr	r3, [sp, #36]
	movs	r1, #2
	str	r10, [sp, #16]
	movs	r0, #8
	ldr	r2, .L351+40
	str	r3, [sp, #12]
	ldr	r3, [sp, #32]
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	r3, [sp, #4]
	movs	r3, #201
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	b	.L348
.L314:
	mov	r3, r5
	mov	r2, r6
	ldr	r1, [sp, #36]
	mov	r0, fp
	bl	mpi_dev_create_node_with_params
	mov	r5, r0
	cmp	r0, #0
	beq	.L315
	ldr	r3, [sp, #36]
	movs	r1, #4
	ldr	r2, .L351+44
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [sp, #32]
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	str	r3, [sp, #4]
	movs	r3, #204
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	movs	r2, #30
	mov	r1, r6
	adds	r0, r5, #6
	bl	memset
	ldr	r0, .L351+48
	ldrh	r3, [r0]	@ unaligned
	strh	r3, [r5, #4]	@ unaligned
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	strb	r3, [r5, #6]
	ldr	r2, [r4, #36]	@ unaligned
	cmp	r2, #0
	beq	.L316
	ldr	r1, [r4, #40]	@ unaligned
	cmp	r1, #1
	bne	.L317
	cmp	r9, #2
	ldr	r7, .L351+52
	bne	.L318
	ldr	r2, [r4, #220]	@ unaligned
	ldr	r3, [r4, #216]	@ unaligned
	adds	r1, r2, #1
	bne	.L319
	add	r3, r7, r3, lsl #2
	ldr	r3, [r3, #212]
	ldr	r0, [r3, #44]	@ unaligned
	bl	vsys_get_pool
	ldr	r1, .L351+56
.L346:
	bl	mpi_buf_pool_dup
	mov	r6, r0
.L320:
	ldr	r3, [r4, #32]	@ unaligned
	movs	r1, #4
	ldr	r2, .L351+60
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #4]
	movs	r3, #226
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
.L349:
	cmp	r6, #0
	bne	.L347
.L325:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L351+64
	movs	r0, #8
	str	r3, [sp, #4]
	movs	r3, #239
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	mov	r0, r5
	bl	mpi_node_destroy
	b	.L348
.L319:
	movs	r1, #14
	mla	r3, r1, r3, r2
	ldr	r1, .L351+56
	add	r3, r7, r3, lsl #2
	ldr	r0, [r3, #284]
	b	.L346
.L318:
	ldr	r3, [r4, #32]	@ unaligned
	cmp	r3, #1
	itttt	eq
	strbeq	r6, [r4, #33]
	strbeq	r6, [r4, #34]
	moveq	r3, #4
	strbeq	r6, [r4, #35]
	ittte	eq
	strbeq	r3, [r4, #32]
	streq	r0, [sp]
	ldreq	r1, .L351+68
	strne	r0, [sp]
	mov	r0, r8
	bl	mpi_buf_pool_create
	movs	r1, #14
	ldr	r3, [sp, #32]
	mov	r6, r0
	ldr	r2, [sp, #36]
	mla	r3, r1, r3, r2
	add	r3, r7, r3, lsl #2
	str	r0, [r3, #284]
	b	.L320
.L317:
	cmp	r1, #0
	bne	.L325
	ldr	r0, [r4, #44]	@ unaligned
	bl	vsys_get_pool
	ldr	r3, [r4, #44]	@ unaligned
	ldr	r2, .L351+72
	movs	r1, #4
	mov	r6, r0
	str	r3, [sp, #4]
	movs	r0, #8
	movs	r3, #233
	str	r3, [sp]
	ldr	r3, .L351+4
	bl	vlog
	b	.L349
.L352:
	.align	2
.L351:
	.word	.LC7
	.word	.LANCHOR1+332
	.word	.LC29
	.word	.LC30
	.word	.LC40
	.word	.LC41
	.word	.LC42
	.word	kmalloc_caches
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC32
	.word	.LANCHOR0
	.word	.LC31
	.word	.LC47
	.word	.LC48
	.word	-2147483647
	.word	.LC49
.L347:
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_add_user
.L316:
	add	r3, r5, #252
	add	r2, r5, #260
	ldr	r1, [r4, #128]	@ unaligned
	ldr	r0, [r4, #124]	@ unaligned
	bl	mpi_node_set_frame_rate
	ldr	r3, [r4, #224]	@ unaligned
	ldr	r2, .L353
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp, #8]
	ldr	r3, [sp, #36]
	str	r3, [sp, #4]
	movs	r3, #250
	str	r3, [sp]
	ldr	r3, .L353+4
	bl	vlog
	ldr	r1, [r4, #224]	@ unaligned
	mov	r0, r5
	bl	mpi_node_add_out_watcher
	mov	r3, r5
	movs	r0, #8
	ldrd	r1, r2, [sp, #32]
	bl	vsys_add_node_to_map
	ldr	r3, [r4]	@ unaligned
	adds	r3, r3, #1
	beq	.L326
	ldr	r3, [r4, #4]	@ unaligned
	adds	r3, r3, #1
	beq	.L326
	ldr	r0, [sp, #32]
	movs	r2, #6
	ldr	r3, [sp, #36]
	mla	r3, r2, r0, r3
	ldr	r0, .L353+8
	add	r0, r0, r3, lsl #4
	add	r0, r0, #620
	bl	rkos_wait_init
.L326:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L353+12
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #259
	str	r3, [sp]
	ldr	r3, .L353+4
	bl	vlog
	movs	r0, #0
	b	.L306
.L354:
	.align	2
.L353:
	.word	.LC50
	.word	.LANCHOR1+332
	.word	.LANCHOR0
	.word	.LC51
	.fnend
	.size	vvi_node_create, .-vvi_node_create
	.align	1
	.global	vvi_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_delete, %function
vvi_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r3, [r1]	@ unaligned
	mov	r6, r1
	str	r3, [sp, #20]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r1, #24]	@ unaligned
	cmp	r3, #264
	beq	.L356
	movw	r3, #279
	ldr	r2, .L382
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L382+4
	movs	r0, #8
	bl	vlog
	mov	r0, #-1
.L355:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L356:
	add	r2, sp, #28
	add	r1, sp, #24
	add	r0, sp, #20
	ldr	r4, .L382+8
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #24]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L359
	ldrd	r0, r1, [sp, #24]
	movs	r3, #14
	add	r7, r1, #49
	muls	r3, r0, r3
	adds	r2, r3, r1
	add	r3, r3, r7
	adds	r2, r2, #49
	add	r3, r4, r3, lsl #3
	add	r2, r4, r2, lsl #3
	adds	r3, r3, #4
	ldr	r2, [r2, #4]
	cmp	r2, r3
	bne	.L360
	strd	r0, r1, [sp, #4]
	movw	r3, #287
	ldr	r2, .L382+12
	movs	r1, #4
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L382+4
	bl	vlog
.L360:
	ldrd	r2, r7, [sp, #24]
	movs	r3, #14
	ldr	r0, [r5, #112]
	mvn	r9, #79
	ldr	r10, .L382+4
	mov	r8, r3
	mla	r2, r3, r2, r7
	add	r1, r0, #33
	adds	r0, r0, #43
	ldr	fp, .L382+24
	sub	r1, r9, r1, lsl #3
	add	r2, r4, r2, lsl #3
	ldr	r7, [r2, #396]
	add	r7, r7, r1
	ldr	r2, [r7, r0, lsl #3]
	add	r9, r2, r1
.L361:
	ldr	r3, [sp, #28]
	ldr	r2, [r5, #112]
	add	r1, r3, #49
	ldr	r3, [sp, #24]
	adds	r2, r2, #43
	mla	r3, r8, r3, r1
	add	r2, r7, r2, lsl #3
	add	r3, r4, r3, lsl #3
	adds	r3, r3, #4
	cmp	r2, r3
	bne	.L363
	mov	r0, r5
	ldr	r7, [r5, #96]
	bl	mpi_node_del_out_watcher
	movs	r0, #8
	ldrd	r1, r2, [sp, #24]
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
	cbz	r7, .L364
	movs	r1, #1
	mov	r0, r7
	bl	mpi_buf_pool_destroy
	ldrd	r3, r2, [sp, #24]
	mla	r3, r8, r3, r2
	movs	r2, #0
	adds	r3, r3, #70
	add	r3, r4, r3, lsl #2
	str	r2, [r3, #4]
.L364:
	ldr	r3, [sp, #28]
	movs	r1, #4
	ldr	r2, .L382+16
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [sp, #24]
	str	r3, [sp, #8]
	ldr	r3, [sp, #20]
	str	r3, [sp, #4]
	movw	r3, #305
	str	r3, [sp]
	ldr	r3, .L382+4
	bl	vlog
	ldr	r3, [r6]	@ unaligned
	adds	r3, r3, #1
	beq	.L359
	ldr	r3, [r6, #4]	@ unaligned
	adds	r3, r3, #1
	beq	.L359
	ldr	r0, [sp, #24]
	movs	r2, #6
	ldr	r3, [sp, #28]
	mla	r0, r2, r0, r3
	add	r0, r4, r0, lsl #4
	add	r0, r0, #620
	bl	rkos_wait_destory
.L359:
	ldrd	r3, r2, [sp, #24]
	movs	r5, #6
	mla	r3, r5, r3, r2
	add	r3, r4, r3, lsl #2
	ldr	r0, [r3, #236]
	cbz	r0, .L366
	mov	r2, #284
	movs	r1, #0
	ldr	r6, [r0, #272]	@ unaligned
	bl	memset
	ldrd	r3, r2, [sp, #24]
	mla	r3, r5, r3, r2
	add	r4, r4, r3, lsl #2
	ldr	r3, [r4, #236]
	str	r6, [r3, #272]	@ unaligned
.L366:
	movw	r3, #317
	ldr	r2, .L382+20
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L382+4
	movs	r0, #8
	bl	vlog
	movs	r0, #0
	b	.L355
.L363:
	cbz	r7, .L362
	ldr	r3, [r7]
	mov	r2, fp
	movs	r1, #4
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #291
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	ldr	r3, [r5, #112]
	mov	r0, r7
	add	r3, r7, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #344]
	bl	mpi_obj_unref
.L362:
	ldr	r3, [r5, #112]
	mvn	r2, #79
	mov	r7, r9
	add	r1, r3, #33
	adds	r3, r3, #43
	ldr	r3, [r9, r3, lsl #3]
	sub	r2, r2, r1, lsl #3
	add	r9, r3, r2
	b	.L361
.L383:
	.align	2
.L382:
	.word	.LC7
	.word	.LANCHOR1+348
	.word	.LANCHOR0
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC21
	.fnend
	.size	vvi_node_delete, .-vvi_node_delete
	.align	1
	.global	vvi_mb_put
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_put, %function
vvi_mb_put:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #32
	sub	sp, sp, #32
	cmp	r3, #228
	beq	.L385
	movw	r3, #555
	ldr	r2, .L389
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L389+4
	movs	r0, #8
	bl	vlog
.L387:
	mov	r0, #-1
	b	.L384
.L385:
	ldr	r3, [r1]	@ unaligned
	add	r2, sp, #28
	add	r0, sp, #20
	str	r3, [sp, #20]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r1, #8]	@ unaligned
	add	r1, sp, #24
	str	r3, [sp, #28]
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #24]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L387
	ldr	r0, [r5, #12]	@ unaligned
	bl	get_mpi_buf_from_id
	mov	r4, r0
	cbz	r0, .L384
	ldr	r3, [r0, #484]
	movs	r1, #5
	ldr	r2, .L389+8
	strd	r0, r3, [sp, #8]
	movs	r0, #8
	ldr	r3, [r5, #12]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #569
	str	r3, [sp]
	ldr	r3, .L389+4
	bl	vlog
	ldr	r3, [r6, #112]
	movs	r0, #8
	add	r3, r4, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #344]
	movw	r3, #571
	ldr	r2, .L389+12
	movs	r1, #5
	str	r3, [sp]
	ldr	r3, .L389+4
	bl	vlog
	mov	r0, r6
	add	r2, r6, #428
	mov	r1, r4
	bl	mpi_node_release_buffer_flag
	movs	r0, #0
.L384:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L390:
	.align	2
.L389:
	.word	.LC2
	.word	.LANCHOR1+364
	.word	.LC55
	.word	.LC56
	.fnend
	.size	vvi_mb_put, .-vvi_mb_put
	.align	1
	.global	vvi_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_mb_get, %function
vvi_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #52
	sub	sp, sp, #52
	cmp	r3, #228
	beq	.L392
	movw	r3, #586
	ldr	r2, .L406
	str	r3, [sp]
	ldr	r3, .L406+4
.L405:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L404:
	mov	r0, #-1
.L391:
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L392:
	ldr	r3, [r1]	@ unaligned
	add	r2, sp, #44
	add	r0, sp, #36
	ldr	r6, .L406+8
	str	r3, [sp, #36]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r1, #8]	@ unaligned
	add	r1, sp, #40
	str	r3, [sp, #44]
	bl	vi_dev_pipe_chn_change
	ldr	r1, [sp, #40]
	add	r3, r6, r1, lsl #2
	ldr	r3, [r3, #180]
	cbz	r3, .L394
	ldr	r3, [sp, #44]
	cbnz	r3, .L394
	movw	r3, #595
	ldr	r2, .L406+12
	str	r3, [sp]
	ldr	r3, .L406+4
	b	.L405
.L394:
	ldr	r2, [sp, #44]
	movs	r0, #8
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L395
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L406+16
	movs	r0, #8
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #601
	str	r3, [sp]
	ldr	r3, .L406+4
	bl	vlog
	b	.L404
.L395:
	ldr	r3, [r4, #16]	@ unaligned
	mov	r0, r7
	adds	r1, r3, #1
	mov	r1, #0
	it	eq
	moveq	r3, #1000
	str	r3, [r7, #412]
	bl	mpi_node_get_out_buffer
	mov	r5, r0
	cbnz	r0, .L397
	ldr	r3, [r4, #16]	@ unaligned
	adds	r2, r3, #1
	beq	.L395
	str	r3, [sp, #4]
	movs	r1, #2
	movw	r3, #614
	ldr	r2, .L406+20
	str	r3, [sp]
	movs	r0, #8
	ldr	r3, .L406+4
	bl	vlog
	b	.L404
.L397:
	ldr	r1, [r7, #112]
	movs	r3, #14
	ldrd	r2, r7, [sp, #40]
	add	r0, r1, #43
	muls	r3, r2, r3
	add	r0, r5, r0, lsl #3
	adds	r2, r3, r7
	adds	r7, r7, #49
	adds	r2, r2, #49
	add	r3, r3, r7
	add	r2, r6, r2, lsl #3
	add	r6, r6, r3, lsl #3
	adds	r6, r6, #4
	ldr	ip, [r2, #8]
	str	r0, [r2, #8]
	add	r2, r5, r1, lsl #3
	add	r1, r5, #664
	strd	r6, ip, [r2, #344]
	movs	r2, #80
	str	r0, [ip]
	add	r0, r4, #148
	ldr	r3, [r5, #484]
	ldr	r3, [r3]
	str	r3, [r4, #56]	@ unaligned
	bl	memcpy
	mov	r0, r5
	bl	get_mpi_buf_id
	ldr	r2, [r4, #204]	@ unaligned
	ldr	r3, [r4, #208]	@ unaligned
	movs	r1, #5
	strd	r2, r3, [sp, #16]
	ldr	r3, [r4, #200]	@ unaligned
	str	r0, [r4, #12]	@ unaligned
	ldr	r2, .L406+24
	strd	r0, r3, [sp, #8]
	movw	r3, #625
	str	r5, [sp, #4]
	movs	r0, #8
	str	r3, [sp]
	ldr	r3, .L406+4
	bl	vlog
	ldrd	r2, [r5, #720]
	movs	r1, #5
	movs	r0, #8
	strd	r2, [sp, #24]
	ldr	r3, [r5, #672]
	ldr	r2, .L406+28
	str	r3, [sp, #16]
	ldr	r3, [r5, #668]
	str	r3, [sp, #12]
	ldr	r3, [r5, #484]
	ldr	r3, [r3]
	str	r3, [sp, #8]
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #629
	str	r3, [sp]
	ldr	r3, .L406+4
	bl	vlog
	movs	r0, #0
	b	.L391
.L407:
	.align	2
.L406:
	.word	.LC2
	.word	.LANCHOR1+375
	.word	.LANCHOR0
	.word	.LC57
	.word	.LC58
	.word	.LC59
	.word	.LC60
	.word	.LC61
	.fnend
	.size	vvi_mb_get, .-vvi_mb_get
	.align	1
	.global	vvi_node_stream_open
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_open, %function
vvi_node_stream_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r3, [r1]	@ unaligned
	mov	r4, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L409
	movw	r3, #935
	ldr	r2, .L417
	str	r3, [sp]
	ldr	r3, .L417+4
.L416:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L412:
	mov	r0, #-1
.L408:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L409:
	add	r2, sp, #16
	add	r1, sp, #20
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r2, r1, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L412
	ldr	r3, .L417+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L411
	movw	r3, #946
	ldr	r2, .L417+12
	str	r3, [sp]
	ldr	r3, .L417+4
	b	.L416
.L411:
	movs	r3, #4
	str	r3, [r0, #20]
	movs	r3, #8
	str	r3, [r0, #4]
	ldr	r3, [r4]	@ unaligned
	str	r3, [r0, #8]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [r0, #12]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [r0, #16]
	ldr	r3, [r4, #260]	@ unaligned
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	strb	r3, [r0, #1]
	ldr	r3, [r4, #248]	@ unaligned
	adds	r3, r3, #0
	it	ne
	movne	r3, #1
	strb	r3, [r0]
	ldr	r3, [r4, #252]	@ unaligned
	str	r3, [r0, #80]
	ldr	r3, [r4, #236]	@ unaligned
	str	r3, [r0, #68]
	ldr	r3, [r4, #232]	@ unaligned
	str	r3, [r0, #76]
	ldr	r3, [r4, #244]	@ unaligned
	str	r3, [r0, #84]
	ldr	r3, [r4, #240]	@ unaligned
	str	r3, [r0, #60]
	ldr	r3, [r4, #32]	@ unaligned
	str	r3, [r0, #72]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [r0, #48]
	ldr	r3, [r4, #28]	@ unaligned
	add	r4, r4, #292
	str	r3, [r0, #52]
	mov	r0, r4
	bl	rkos_strlen
	mov	r1, r4
	mov	r2, r0
	add	r0, r5, #88
	bl	rkos_memcpy
	mov	r1, r5
	mov	r0, r6
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L408
	mov	r0, r5
	bl	kfree
	b	.L412
.L418:
	.align	2
.L417:
	.word	.LC9
	.word	.LANCHOR1+386
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_open, .-vvi_node_stream_open
	.align	1
	.global	vvi_node_stream_close
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_close, %function
vvi_node_stream_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L420
	movw	r3, #983
	ldr	r2, .L428
	str	r3, [sp]
	ldr	r3, .L428+4
.L427:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L423:
	mov	r0, #-1
.L419:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L420:
	add	r2, sp, #16
	add	r1, sp, #20
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r2, r1, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L423
	ldr	r3, .L428+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L422
	movw	r3, #994
	ldr	r2, .L428+12
	str	r3, [sp]
	ldr	r3, .L428+4
	b	.L427
.L422:
	movs	r3, #5
	mov	r1, r0
	str	r3, [r0, #20]
	mov	r0, r5
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L419
	mov	r0, r4
	bl	kfree
	b	.L423
.L429:
	.align	2
.L428:
	.word	.LC9
	.word	.LANCHOR1+407
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_close, .-vvi_node_stream_close
	.align	1
	.global	vvi_node_stream_on
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_on, %function
vvi_node_stream_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {lr}
	.pad #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L431
	movw	r3, #1014
	ldr	r2, .L434
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L434+4
	movs	r0, #8
	bl	vlog
.L433:
	mov	r0, #-1
	b	.L430
.L431:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L433
	bl	mpi_node_streamon
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	rsbs	r0, r0, #0
.L430:
	add	sp, sp, #28
	@ sp needed
	ldr	pc, [sp], #4
.L435:
	.align	2
.L434:
	.word	.LC9
	.word	.LANCHOR1+429
	.fnend
	.size	vvi_node_stream_on, .-vvi_node_stream_on
	.align	1
	.global	vvi_node_stream_off
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_off, %function
vvi_node_stream_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {lr}
	.pad #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L437
	movw	r3, #1037
	ldr	r2, .L440
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L440+4
	movs	r0, #8
	bl	vlog
.L439:
	mov	r0, #-1
	b	.L436
.L437:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L439
	bl	mpi_node_streamoff
	adds	r0, r0, #0
	it	ne
	movne	r0, #1
	rsbs	r0, r0, #0
.L436:
	add	sp, sp, #28
	@ sp needed
	ldr	pc, [sp], #4
.L441:
	.align	2
.L440:
	.word	.LC9
	.word	.LANCHOR1+448
	.fnend
	.size	vvi_node_stream_off, .-vvi_node_stream_off
	.align	1
	.global	vvi_node_stream_prepare
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_prepare, %function
vvi_node_stream_prepare:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r3, [r1]	@ unaligned
	mov	r5, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L443
	movw	r3, #1061
	ldr	r2, .L451
	str	r3, [sp]
	ldr	r3, .L451+4
.L450:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L446:
	mov	r0, #-1
.L442:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L443:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L446
	ldr	r3, .L451+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L445
	mov	r3, #1072
	ldr	r2, .L451+12
	str	r3, [sp]
	ldr	r3, .L451+4
	b	.L450
.L445:
	movs	r3, #6
	add	r1, r5, #264
	str	r3, [r0, #20]
	movs	r2, #24
	adds	r0, r0, #124
	bl	rkos_memcpy
	mov	r1, r4
	mov	r0, r6
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L442
	mov	r0, r4
	bl	kfree
	b	.L446
.L452:
	.align	2
.L451:
	.word	.LC9
	.word	.LANCHOR1+468
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_prepare, .-vvi_node_stream_prepare
	.align	1
	.global	vvi_node_stream_reqbuff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_reqbuff, %function
vvi_node_stream_reqbuff:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r3, [r1]	@ unaligned
	mov	r4, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L454
	movw	r3, #1094
	ldr	r2, .L460
	str	r3, [sp]
	ldr	r3, .L460+4
.L459:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L458:
	mov	r0, #-1
	b	.L453
.L454:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L458
	ldr	r3, .L460+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L456
	movw	r3, #1105
	ldr	r2, .L460+12
	str	r3, [sp]
	ldr	r3, .L460+4
	b	.L459
.L456:
	movs	r3, #7
	mov	r1, r0
	str	r3, [r0, #20]
	mov	r0, r6
	bl	mpi_node_set_params
	cbz	r0, .L457
	mov	r0, r5
	bl	kfree
	b	.L458
.L457:
	ldr	r3, [r5, #120]
	str	r3, [r4, #36]	@ unaligned
.L453:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L461:
	.align	2
.L460:
	.word	.LC9
	.word	.LANCHOR1+492
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_reqbuff, .-vvi_node_stream_reqbuff
	.align	1
	.global	vvi_node_stream_retbuff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_retbuff, %function
vvi_node_stream_retbuff:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L463
	movw	r3, #1127
	ldr	r2, .L471
	str	r3, [sp]
	ldr	r3, .L471+4
.L470:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L466:
	mov	r0, #-1
.L462:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L463:
	add	r2, sp, #16
	add	r1, sp, #20
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r2, r1, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L466
	ldr	r3, .L471+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L465
	movw	r3, #1138
	ldr	r2, .L471+12
	str	r3, [sp]
	ldr	r3, .L471+4
	b	.L470
.L465:
	movs	r3, #8
	mov	r1, r0
	str	r3, [r0, #20]
	mov	r0, r5
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L462
	mov	r0, r4
	bl	kfree
	b	.L466
.L472:
	.align	2
.L471:
	.word	.LC9
	.word	.LANCHOR1+516
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_retbuff, .-vvi_node_stream_retbuff
	.align	1
	.global	vvi_node_stream_qbuff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_stream_qbuff, %function
vvi_node_stream_qbuff:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L474
	movw	r3, #1159
	ldr	r2, .L482
	str	r3, [sp]
	ldr	r3, .L482+4
.L481:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L477:
	mov	r0, #-1
.L473:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L474:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L477
	ldr	r3, .L482+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L476
	movw	r3, #1170
	ldr	r2, .L482+12
	str	r3, [sp]
	ldr	r3, .L482+4
	b	.L481
.L476:
	movs	r3, #9
	mov	r1, r0
	str	r3, [r0, #20]
	mov	r0, r5
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L473
	mov	r0, r4
	bl	kfree
	b	.L477
.L483:
	.align	2
.L482:
	.word	.LC9
	.word	.LANCHOR1+540
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_stream_qbuff, .-vvi_node_stream_qbuff
	.align	1
	.global	vvi_node_set_eptz
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_set_eptz, %function
vvi_node_set_eptz:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r3, [r1]	@ unaligned
	mov	r5, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L485
	movw	r3, #1191
	ldr	r2, .L493
	str	r3, [sp]
	ldr	r3, .L493+4
.L492:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L488:
	mov	r0, #-1
.L484:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L485:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L488
	ldr	r3, .L493+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L487
	movw	r3, #1202
	ldr	r2, .L493+12
	str	r3, [sp]
	ldr	r3, .L493+4
	b	.L492
.L487:
	movs	r3, #10
	add	r1, r5, #264
	str	r3, [r0, #20]
	movs	r2, #24
	adds	r0, r0, #124
	bl	rkos_memcpy
	mov	r1, r4
	mov	r0, r6
	bl	mpi_node_set_params
	cmp	r0, #0
	beq	.L484
	mov	r0, r4
	bl	kfree
	b	.L488
.L494:
	.align	2
.L493:
	.word	.LC9
	.word	.LANCHOR1+562
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_set_eptz, .-vvi_node_set_eptz
	.align	1
	.global	vvi_node_get_eptz
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_get_eptz, %function
vvi_node_get_eptz:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1]	@ unaligned
	mov	r4, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L496
	movw	r3, #1225
	ldr	r2, .L502
	str	r3, [sp]
	ldr	r3, .L502+4
.L501:
	movs	r1, #2
	movs	r0, #8
	bl	vlog
.L500:
	mov	r5, #-1
	b	.L495
.L496:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L500
	ldr	r3, .L502+8
	mov	r1, #3520
	ldr	r0, [r3, #8]
	bl	kmem_cache_alloc
	mov	r6, r0
	cbnz	r0, .L498
	movw	r3, #1236
	ldr	r2, .L502+12
	str	r3, [sp]
	ldr	r3, .L502+4
	b	.L501
.L498:
	add	r7, r0, #124
	add	r4, r4, #264
	movs	r3, #11
	movs	r2, #24
	str	r3, [r0, #20]
	mov	r1, r4
	mov	r0, r7
	bl	rkos_memcpy
	mov	r0, r5
	mov	r1, r6
	bl	mpi_node_set_params
	mov	r5, r0
	cbz	r0, .L499
	mov	r0, r6
	bl	kfree
	b	.L500
.L499:
	movs	r2, #24
	mov	r1, r7
	mov	r0, r4
	bl	rkos_memcpy
.L495:
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L503:
	.align	2
.L502:
	.word	.LC9
	.word	.LANCHOR1+580
	.word	kmalloc_caches
	.word	.LC62
	.fnend
	.size	vvi_node_get_eptz, .-vvi_node_get_eptz
	.align	1
	.global	vvi_node_send_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_send_buf, %function
vvi_node_send_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r3, [r1]	@ unaligned
	mov	r4, r1
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #20]	@ unaligned
	cmp	r3, #228
	beq	.L505
	movw	r3, #1260
	ldr	r2, .L509
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L509+4
	movs	r0, #8
	bl	vlog
.L508:
	mov	r0, #-1
	b	.L504
.L505:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L508
	ldr	r0, [r4, #60]	@ unaligned
	bl	get_mpi_buf
	mov	r5, r0
	cbnz	r0, .L507
	ldr	r3, [r4, #60]	@ unaligned
	movs	r1, #2
	ldr	r2, .L509+8
	movs	r0, #8
	str	r3, [sp, #4]
	mov	r3, #1272
	str	r3, [sp]
	ldr	r3, .L509+4
	bl	vlog
	b	.L508
.L507:
	movs	r2, #80
	add	r1, r4, #148
	add	r0, r0, #664
	bl	memcpy
	movs	r2, #0
	mov	r1, r5
	mov	r0, r6
	bl	mpi_node_buffer_in
	movs	r0, #0
.L504:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L510:
	.align	2
.L509:
	.word	.LC2
	.word	.LANCHOR1+598
	.word	.LC63
	.fnend
	.size	vvi_node_send_buf, .-vvi_node_send_buf
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_dev_detach_buf_pool, %function
vvi_node_dev_detach_buf_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r1]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L512
	movw	r3, #1362
	ldr	r2, .L516
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L516+4
	movs	r0, #8
	bl	vlog
.L514:
	mov	r0, #-1
	b	.L511
.L512:
	add	r2, sp, #20
	add	r1, sp, #16
	add	r0, sp, #12
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cmp	r0, #0
	beq	.L514
	ldr	r4, [r0, #96]
	cbz	r4, .L515
	bl	mpi_node_del_out_watcher
	mov	r1, r5
	mov	r0, r4
	bl	mpi_buf_pool_del_user
	movs	r1, #14
	movs	r0, #0
	ldr	r2, [sp, #20]
	ldr	r3, [sp, #16]
	mla	r3, r1, r3, r2
	ldr	r2, .L516+8
	adds	r3, r3, #70
	add	r3, r2, r3, lsl #2
	str	r0, [r3, #4]
.L511:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L515:
	mov	r0, r4
	b	.L511
.L517:
	.align	2
.L516:
	.word	.LC9
	.word	.LANCHOR1+616
	.word	.LANCHOR0
	.fnend
	.size	vvi_node_dev_detach_buf_pool, .-vvi_node_dev_detach_buf_pool
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_dev_attch_buf_pool, %function
vvi_node_dev_attch_buf_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #32
	sub	sp, sp, #32
	ldr	r3, [r1]	@ unaligned
	mov	r4, r1
	str	r3, [sp, #20]
	ldr	r3, [r1, #4]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r1, #8]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r1, #288]	@ unaligned
	cmp	r3, #340
	beq	.L519
	mov	r3, #1328
	ldr	r2, .L523
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L523+4
	movs	r0, #8
	bl	vlog
.L522:
	mov	r0, #-1
	b	.L518
.L519:
	add	r2, sp, #28
	add	r1, sp, #24
	add	r0, sp, #20
	bl	vi_dev_pipe_chn_change
	movs	r0, #8
	ldrd	r1, r2, [sp, #24]
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L522
	ldr	r0, [r4, #44]	@ unaligned
	bl	vsys_get_pool
	ldr	r3, [r4, #44]	@ unaligned
	ldr	r2, .L523+8
	movs	r1, #4
	mov	r5, r0
	str	r0, [sp, #8]
	str	r3, [sp, #4]
	movs	r0, #8
	movw	r3, #1339
	str	r3, [sp]
	ldr	r3, .L523+4
	bl	vlog
	cbz	r5, .L521
	mov	r1, r6
	mov	r0, r5
	bl	mpi_buf_pool_add_user
	movs	r1, #14
	mov	r0, r6
	ldr	r3, [sp, #24]
	ldr	r2, [sp, #28]
	mla	r2, r1, r3, r2
	ldr	r3, .L523+12
	add	r3, r3, r2, lsl #2
	str	r5, [r3, #284]
	ldr	r1, [r4, #224]	@ unaligned
	bl	mpi_node_add_out_watcher
	movs	r0, #0
.L518:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L521:
	ldr	r3, [r4, #44]	@ unaligned
	movs	r1, #2
	ldr	r2, .L523+16
	movs	r0, #8
	str	r3, [sp, #4]
	movw	r3, #1345
	str	r3, [sp]
	ldr	r3, .L523+4
	bl	vlog
	b	.L522
.L524:
	.align	2
.L523:
	.word	.LC9
	.word	.LANCHOR1+645
	.word	.LC64
	.word	.LANCHOR0
	.word	.LC65
	.fnend
	.size	vvi_node_dev_attch_buf_pool, .-vvi_node_dev_attch_buf_pool
	.align	1
	.global	vvi_node_buf_ready
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_node_buf_ready, %function
vvi_node_buf_ready:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r1, r0
	cbz	r0, .L528
	ldr	r0, [r0, #420]
	cbz	r0, .L525
	ldr	r4, .L530
	ldr	r0, [r4, #172]
	bl	mpi_queue_push_obj
	cbnz	r0, .L527
	movs	r3, #104
	ldr	r2, .L530+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L530+8
	movs	r0, #8
	bl	vlog
.L528:
	mov	r0, #-1
	b	.L525
.L527:
	add	r0, r4, #812
	bl	rkos_up
	movs	r0, #0
.L525:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L531:
	.align	2
.L530:
	.word	.LANCHOR0
	.word	.LC66
	.word	.LANCHOR1+673
	.fnend
	.size	vvi_node_buf_ready, .-vvi_node_buf_ready
	.align	1
	.global	vvi_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_probe, %function
vvi_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r2, #816
	ldr	r4, .L538
	mov	r5, r0
	movs	r1, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #176]
	mov	r2, r5
	ldr	r3, .L538+4
	movs	r1, #8
	str	r4, [r4, #168]
	str	r3, [r4, #24]
	movs	r3, #31
	str	r3, [r4, #28]
	str	r0, [r4]
	add	r0, r4, #32
	bl	mpi_dev_register
	add	r2, r4, #396
	movs	r3, #0
	str	r3, [r4, #136]
	strd	r3, r3, [r4, #144]
.L533:
	adds	r3, r3, #1
	str	r2, [r2]
	cmp	r3, #14
	str	r2, [r2, #4]
	add	r2, r2, #8
	bne	.L533
	ldr	r3, .L538+8
	movs	r2, #0
.L534:
	adds	r2, r2, #1
	str	r3, [r3]
	cmp	r2, #14
	str	r3, [r3, #4]
	add	r3, r3, #8
	bne	.L534
	movs	r1, #0
	ldr	r0, .L538+12
	bl	rkos_sema_init
	ldr	r2, .L538+16
	movs	r1, #1
	movs	r0, #12
	bl	mpi_queue_create
	ldr	r3, .L538+20
	mov	r2, #-1
	ldr	r1, .L538
	str	r0, [r4, #172]
	ldr	r0, .L538+24
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L535
	bl	wake_up_process
.L535:
	str	r5, [r4, #8]
	movs	r2, #0
	ldr	r1, .L538+28
	ldr	r0, .L538+32
	pop	{r3, r4, r5, lr}
	b	mpi_sysfs_dev_add
.L539:
	.align	2
.L538:
	.word	.LANCHOR0
	.word	.LANCHOR1+692
	.word	.LANCHOR0+508
	.word	.LANCHOR0+812
	.word	mpi_obj_unref
	.word	.LC67
	.word	vvi_thread_fn
	.word	.LANCHOR1+1312
	.word	.LANCHOR0+32
	.fnend
	.size	vvi_probe, .-vvi_probe
	.align	1
	.global	vvi_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_shutdown, %function
vvi_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L545
	add	r0, r4, #812
	str	r3, [r4, #12]
	bl	rkos_up
	ldr	r0, [r4, #8]
	cbz	r0, .L541
	bl	kthread_stop
.L541:
	movs	r1, #0
	ldr	r0, [r4, #172]
	bl	mpi_queue_destroy
	ldr	r0, .L545+4
	bl	rkos_sema_destory
	ldr	r0, .L545+8
	bl	mpi_sysfs_dev_remove
	ldr	r0, .L545+8
	bl	mpi_dev_unregister
	ldr	r0, [r4]
	pop	{r4, lr}
	b	kfree
.L546:
	.align	2
.L545:
	.word	.LANCHOR0
	.word	.LANCHOR0+812
	.word	.LANCHOR0+32
	.fnend
	.size	vvi_shutdown, .-vvi_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vvi_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_init, %function
vvi_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L548
	bl	vvi_probe
	movs	r0, #0
	pop	{r3, pc}
.L549:
	.align	2
.L548:
	.word	.LC32
	.fnend
	.size	vvi_init, .-vvi_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vvi_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vvi_exit, %function
vvi_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vvi_shutdown
	.fnend
	.size	vvi_exit, .-vvi_exit
	.global	wait_mcu_flag
	.global	g_vvi_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.36544, %object
	.size	__func__.36544, 20
__func__.36544:
	.ascii	"vvi_node_get_status\000"
	.type	__func__.36533, %object
	.size	__func__.36533, 14
__func__.36533:
	.ascii	"vvi_node_stop\000"
	.type	__func__.36815, %object
	.size	__func__.36815, 23
__func__.36815:
	.ascii	"vvi_node_dev_bind_pipe\000"
	.type	__func__.36865, %object
	.size	__func__.36865, 9
__func__.36865:
	.ascii	"vi_ioctl\000"
	.type	__func__.36967, %object
	.size	__func__.36967, 8
__func__.36967:
	.ascii	"vi_poll\000"
	.type	__func__.36684, %object
	.size	__func__.36684, 20
__func__.36684:
	.ascii	"vvi_node_get_chn_fr\000"
	.type	__func__.36877, %object
	.size	__func__.36877, 8
__func__.36877:
	.ascii	"vi_open\000"
	.type	__func__.36501, %object
	.size	__func__.36501, 18
__func__.36501:
	.ascii	"get_new_wrap_line\000"
	.type	__func__.36900, %object
	.size	__func__.36900, 11
__func__.36900:
	.ascii	"vi_release\000"
	.type	__func__.36601, %object
	.size	__func__.36601, 22
__func__.36601:
	.ascii	"vvi_change_resolution\000"
	.type	__func__.36660, %object
	.size	__func__.36660, 25
__func__.36660:
	.ascii	"vvi_node_get_pipe_status\000"
	.type	__func__.36652, %object
	.size	__func__.36652, 25
__func__.36652:
	.ascii	"vvi_node_set_pipe_status\000"
	.type	__func__.36673, %object
	.size	__func__.36673, 20
__func__.36673:
	.ascii	"vvi_node_set_chn_fr\000"
	.type	__func__.36525, %object
	.size	__func__.36525, 15
__func__.36525:
	.ascii	"vvi_node_start\000"
	.type	__func__.36620, %object
	.size	__func__.36620, 23
__func__.36620:
	.ascii	"vvi_node_get_chns_attr\000"
	.type	__func__.36611, %object
	.size	__func__.36611, 23
__func__.36611:
	.ascii	"vvi_node_set_chns_attr\000"
	.type	__func__.36640, %object
	.size	__func__.36640, 24
__func__.36640:
	.ascii	"vvi_node_get_dev_status\000"
	.type	__func__.36630, %object
	.size	__func__.36630, 24
__func__.36630:
	.ascii	"vvi_node_set_dev_status\000"
	.type	__func__.36457, %object
	.size	__func__.36457, 16
__func__.36457:
	.ascii	"vvi_node_create\000"
	.type	__func__.36472, %object
	.size	__func__.36472, 16
__func__.36472:
	.ascii	"vvi_node_delete\000"
	.type	__func__.36578, %object
	.size	__func__.36578, 11
__func__.36578:
	.ascii	"vvi_mb_put\000"
	.type	__func__.36590, %object
	.size	__func__.36590, 11
__func__.36590:
	.ascii	"vvi_mb_get\000"
	.type	__func__.36695, %object
	.size	__func__.36695, 21
__func__.36695:
	.ascii	"vvi_node_stream_open\000"
	.type	__func__.36706, %object
	.size	__func__.36706, 22
__func__.36706:
	.ascii	"vvi_node_stream_close\000"
	.type	__func__.36716, %object
	.size	__func__.36716, 19
__func__.36716:
	.ascii	"vvi_node_stream_on\000"
	.type	__func__.36726, %object
	.size	__func__.36726, 20
__func__.36726:
	.ascii	"vvi_node_stream_off\000"
	.type	__func__.36737, %object
	.size	__func__.36737, 24
__func__.36737:
	.ascii	"vvi_node_stream_prepare\000"
	.type	__func__.36748, %object
	.size	__func__.36748, 24
__func__.36748:
	.ascii	"vvi_node_stream_reqbuff\000"
	.type	__func__.36759, %object
	.size	__func__.36759, 24
__func__.36759:
	.ascii	"vvi_node_stream_retbuff\000"
	.type	__func__.36770, %object
	.size	__func__.36770, 22
__func__.36770:
	.ascii	"vvi_node_stream_qbuff\000"
	.type	__func__.36781, %object
	.size	__func__.36781, 18
__func__.36781:
	.ascii	"vvi_node_set_eptz\000"
	.type	__func__.36792, %object
	.size	__func__.36792, 18
__func__.36792:
	.ascii	"vvi_node_get_eptz\000"
	.type	__func__.36803, %object
	.size	__func__.36803, 18
__func__.36803:
	.ascii	"vvi_node_send_buf\000"
	.type	__func__.36842, %object
	.size	__func__.36842, 29
__func__.36842:
	.ascii	"vvi_node_dev_detach_buf_pool\000"
	.type	__func__.36830, %object
	.size	__func__.36830, 28
__func__.36830:
	.ascii	"vvi_node_dev_attch_buf_pool\000"
	.type	__func__.36419, %object
	.size	__func__.36419, 19
__func__.36419:
	.ascii	"vvi_node_buf_ready\000"
	.type	vvi_ioctls, %object
	.size	vvi_ioctls, 620
vvi_ioctls:
	.word	-1065585152
	.word	0
	.word	vvi_get_version
	.word	.LC68
	.word	0
	.word	-1056410111
	.word	0
	.word	vvi_node_create
	.word	.LC69
	.word	0
	.word	-1056410110
	.word	0
	.word	vvi_node_delete
	.word	.LC70
	.word	0
	.word	-1058769405
	.word	0
	.word	vvi_node_get_status
	.word	.LC71
	.word	0
	.word	-1056410108
	.word	0
	.word	vvi_node_start
	.word	.LC72
	.word	0
	.word	-1056410107
	.word	0
	.word	vvi_node_stop
	.word	.LC73
	.word	0
	.word	-1058769402
	.word	0
	.word	vvi_mb_put
	.word	.LC74
	.word	0
	.word	-1058769401
	.word	16
	.word	vvi_mb_get
	.word	.LC75
	.word	0
	.word	-1071090168
	.word	0
	.word	vvi_change_resolution
	.word	.LC76
	.word	0
	.word	-1055099383
	.word	0
	.word	vvi_node_set_chns_attr
	.word	.LC77
	.word	0
	.word	-1055099382
	.word	0
	.word	vvi_node_get_chns_attr
	.word	.LC78
	.word	0
	.word	-1055099381
	.word	0
	.word	vvi_node_set_dev_status
	.word	.LC79
	.word	0
	.word	-1055099380
	.word	0
	.word	vvi_node_get_dev_status
	.word	.LC80
	.word	0
	.word	-1072138739
	.word	0
	.word	vvi_node_set_chn_fr
	.word	.LC81
	.word	0
	.word	-1072138738
	.word	0
	.word	vvi_node_get_chn_fr
	.word	.LC82
	.word	0
	.word	-1055099377
	.word	0
	.word	vvi_node_set_pipe_status
	.word	.LC83
	.word	0
	.word	-1055099376
	.word	0
	.word	vvi_node_get_pipe_status
	.word	.LC84
	.word	0
	.word	-1051429359
	.word	0
	.word	vvi_node_stream_open
	.word	.LC85
	.word	0
	.word	-1051429358
	.word	0
	.word	vvi_node_stream_close
	.word	.LC86
	.word	0
	.word	-1051429357
	.word	0
	.word	vvi_node_stream_on
	.word	.LC87
	.word	0
	.word	-1051429356
	.word	0
	.word	vvi_node_stream_off
	.word	.LC88
	.word	0
	.word	-1051429355
	.word	0
	.word	vvi_node_stream_prepare
	.word	.LC89
	.word	0
	.word	-1051429354
	.word	0
	.word	vvi_node_stream_reqbuff
	.word	.LC90
	.word	0
	.word	-1051429353
	.word	0
	.word	vvi_node_stream_retbuff
	.word	.LC91
	.word	0
	.word	-1051429352
	.word	0
	.word	vvi_node_stream_qbuff
	.word	.LC92
	.word	0
	.word	-1051429351
	.word	0
	.word	vvi_node_set_eptz
	.word	.LC93
	.word	0
	.word	-1051429350
	.word	0
	.word	vvi_node_get_eptz
	.word	.LC94
	.word	0
	.word	-1058769381
	.word	0
	.word	vvi_node_send_buf
	.word	.LC95
	.word	0
	.word	-1051429348
	.word	0
	.word	vvi_node_dev_bind_pipe
	.word	.LC96
	.word	0
	.word	-1051429347
	.word	0
	.word	vvi_node_dev_attch_buf_pool
	.word	.LC97
	.word	0
	.word	-1051429346
	.word	0
	.word	vvi_node_dev_detach_buf_pool
	.word	.LC98
	.word	0
	.type	vvi_driver_fops, %object
	.size	vvi_driver_fops, 128
vvi_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	vi_poll
	.word	vi_ioctl
	.word	vi_compat_ioctl
	.word	0
	.space	4
	.word	vi_open
	.space	4
	.word	vi_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_vvi_dev, %object
	.size	g_vvi_dev, 816
g_vvi_dev:
	.space	816
	.type	wait_mcu_flag, %object
	.size	wait_mcu_flag, 4
wait_mcu_flag:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"-2024-10-16-16:52:39\000"
.LC1:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC2:
	.ascii	"\033[1;31mstruct vvi_buff_info mismatching\033[0m\000"
.LC3:
	.ascii	"enter...\000"
.LC4:
	.ascii	"buf pool(%d) find\000"
.LC5:
	.ascii	"buf = %px ref cnt = %d\000"
.LC6:
	.ascii	"exit...\000"
.LC7:
	.ascii	"\033[1;31mstruct vvi_node_info mismatching\033[0m\000"
.LC8:
	.ascii	"\033[1;32mdo vi vvi_node_stop pipe:%d chn:%d\033[0m"
	.ascii	"\000"
.LC9:
	.ascii	"\033[1;31mstruct vi_opt_dev mismatching\033[0m\000"
.LC10:
	.ascii	"\033[1;31mdev_node:%p or pipe:%p is null\033[0m\000"
.LC11:
	.ascii	"\033[1;31mdev_node:%d or pipe:%d is null\033[0m\000"
.LC12:
	.ascii	"\033[1;31mvi_ioctl: error vvi ioctl, invalid ioctrl"
	.ascii	" index %d\033[0m\000"
.LC13:
	.ascii	"\033[1;32mvi_poll pipeId: %d, chnId: %d\033[0m\000"
.LC14:
	.ascii	"\033[1;32mvvi_node out_buf_queue: refcnt:%d\033[0m\000"
.LC15:
	.ascii	"\033[1;31mstruct vi_chn_frame_rate mismatching\033["
	.ascii	"0m\000"
.LC16:
	.ascii	"\033[1;31mdata alloc failed!\012\033[0m\000"
.LC17:
	.ascii	"\033[1;32m--------- vi open ----------\033[0m\000"
.LC18:
	.ascii	"\033[1;32mtmp = %d, vi_res->wrap_line = %d, cur_w ="
	.ascii	" %d, cur_h = %d, max_res_width = %d\033[0m\000"
.LC19:
	.ascii	"%s %d\000"
.LC20:
	.ascii	"\033[1;32mdelete vvi node: dev:%d, chn:%d\033[0m\000"
.LC21:
	.ascii	"\033[1;32mbuf id = %d, user process exit\033[0m\000"
.LC22:
	.ascii	"\033[1;31mstruct vvi_resolution mismatching\033[0m\000"
.LC23:
	.ascii	"\033[1;31mno memory for vi param malloc\033[0m\000"
.LC24:
	.ascii	"change resolution w:%d, h:%d node: %d\000"
.LC25:
	.ascii	"\033[1;32mvi_res->wrap_mode[%d] = %d, wrap_line = %"
	.ascii	"d\033[0m\000"
.LC26:
	.ascii	"vvi_change_resolution done\000"
.LC27:
	.ascii	"\033[1;31mstruct vi_attr_kn_ctx mismatching\033[0m\000"
.LC28:
	.ascii	"\033[1;31mpipeId %d need less than %d\033[0m\000"
.LC29:
	.ascii	"valloc\000"
.LC30:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC31:
	.ascii	"vvi_dup\000"
.LC32:
	.ascii	"vvi\000"
.LC33:
	.ascii	"viNodeInf->height = %d\000"
.LC34:
	.ascii	"\033[1;32mpipe:%d chn:%d stWindow = %d, %d, %d, %d,"
	.ascii	" stMaxsize = %d, %d\033[0m\000"
.LC35:
	.ascii	"mpi_node_streamon start\000"
.LC36:
	.ascii	"\033[1;32mvvi_node_start pipe:%d chn:%d done\033[0m"
	.ascii	"\000"
.LC37:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC38:
	.ascii	"\033[1;31mwait mcu start fail\033[0m\000"
.LC39:
	.ascii	"\033[1;31mdevId %d need less than %d\033[0m\000"
.LC40:
	.ascii	"\033[1;32mvi_pri_data pipeId: %d chnId:%d--->>>\033"
	.ascii	"[0m\000"
.LC41:
	.ascii	"\033[1;32mvvi dev:%d pipe:%d chn:%d node have exist"
	.ascii	"!\033[0m\000"
.LC42:
	.ascii	">>>>>> videv %d: %p, driver: %s\000"
.LC43:
	.ascii	"\033[1;31merror allocating memory for vi param\033["
	.ascii	"0m\000"
.LC44:
	.ascii	"\033[1;32mwidth = %d, height = %d, max_res_width = "
	.ascii	"%d, max_res_height = %d, enAllocBufType = %d\033[0m"
	.ascii	"\000"
.LC45:
	.ascii	"\033[1;31merror create dev:%d, pipe:%d chn:%d %s vv"
	.ascii	"i node\033[0m\000"
.LC46:
	.ascii	"\033[1;32m vvi dev:%d, pipe:%d chn:%d node create s"
	.ascii	"uccess\033[0m\000"
.LC47:
	.ascii	"\033[1;32mvvi_node_create chn:%d pool create bufcnt"
	.ascii	":%d\033[0m\000"
.LC48:
	.ascii	"\033[1;31mchn:%d pool create fail\033[0m\000"
.LC49:
	.ascii	"\033[1;32mvvi_node_create vi_node_info->mbPool:%d\033"
	.ascii	"[0m\000"
.LC50:
	.ascii	"\033[1;32mchn:%d depth: %d\033[0m\000"
.LC51:
	.ascii	"\033[1;32mvi create (dev:%d pipe:%d chn:%d) node do"
	.ascii	"ne\033[0m\000"
.LC52:
	.ascii	"\033[1;32mdev = %d, chn = %d is empty\033[0m\000"
.LC53:
	.ascii	"\033[1;32mdelete vvi node: dev:%d, pipe:%d chn:%d\033"
	.ascii	"[0m\000"
.LC54:
	.ascii	"do vi vvi_node_delete\000"
.LC55:
	.ascii	"put buff: id:%d, buf:%p, dma_buf:%p\000"
.LC56:
	.ascii	"unref buffer\000"
.LC57:
	.ascii	"\033[1;31mwrap mode not support get buffer from chn"
	.ascii	" 0\033[0m\000"
.LC58:
	.ascii	"\033[1;31mget node fail devid = %d, pipeId:%d chnid"
	.ascii	" = %d\033[0m\000"
.LC59:
	.ascii	"\033[1;31mget buf fail timeout = %d\033[0m\000"
.LC60:
	.ascii	"get buff: %px, dma_buf id = %d, frame seq=%d, pts:%"
	.ascii	"lld\000"
.LC61:
	.ascii	"buf id:%d size:%d w:%d h:%d pts:%llu\000"
.LC62:
	.ascii	"\033[1;31mno memory for vi_param\033[0m\000"
.LC63:
	.ascii	"\033[1;31merror cannot find mpi_buf by fd:%d\033[0m"
	.ascii	"\000"
.LC64:
	.ascii	"\033[1;32mdev attach buff poolId:%d pool addr:%p\033"
	.ascii	"[0m\000"
.LC65:
	.ascii	"\033[1;31mvi node can't find pool by pool:%d\033[0m"
	.ascii	"\000"
.LC66:
	.ascii	"\033[1;31mpush in node queue fail\033[0m\000"
.LC67:
	.ascii	"vvi_thread\000"
.LC68:
	.ascii	"VVI_IOCTL_VERSION\000"
.LC69:
	.ascii	"VVI_IOCTL_NODE_CREATE\000"
.LC70:
	.ascii	"VVI_IOCTL_NODE_DELETE\000"
.LC71:
	.ascii	"VVI_IOCTL_NODE_GET_STATUS\000"
.LC72:
	.ascii	"VVI_IOCTL_NODE_START\000"
.LC73:
	.ascii	"VVI_IOCTL_NODE_STOP\000"
.LC74:
	.ascii	"VVI_IOCTL_MB_PUT\000"
.LC75:
	.ascii	"VVI_IOCTL_MB_GET\000"
.LC76:
	.ascii	"VVI_IOCTL_RES_CHANGE\000"
.LC77:
	.ascii	"VVI_IOCTL_SET_ATTR\000"
.LC78:
	.ascii	"VVI_IOCTL_GET_ATTR\000"
.LC79:
	.ascii	"VVI_IOCTL_SET_DEV_STA\000"
.LC80:
	.ascii	"VVI_IOCTL_GET_DEV_STA\000"
.LC81:
	.ascii	"VVI_IOCTL_SET_FR\000"
.LC82:
	.ascii	"VVI_IOCTL_GET_FR\000"
.LC83:
	.ascii	"VVI_IOCTL_SET_PIPE_STA\000"
.LC84:
	.ascii	"VVI_IOCTL_GET_PIPE_STA\000"
.LC85:
	.ascii	"VVI_IOCTL_STREAM_OPEN\000"
.LC86:
	.ascii	"VVI_IOCTL_STREAM_CLOSE\000"
.LC87:
	.ascii	"VVI_IOCTL_STREAM_ON\000"
.LC88:
	.ascii	"VVI_IOCTL_STREAM_OFF\000"
.LC89:
	.ascii	"VVI_IOCTL_STREAM_PREPARE\000"
.LC90:
	.ascii	"VVI_IOCTL_STREAM_REQBUF\000"
.LC91:
	.ascii	"VVI_IOCTL_STREAM_RETBUF\000"
.LC92:
	.ascii	"VVI_IOCTL_STREAM_QBUF\000"
.LC93:
	.ascii	"VVI_IOCTL_SET_EPTZ\000"
.LC94:
	.ascii	"VVI_IOCTL_GET_EPTZ\000"
.LC95:
	.ascii	"VVI_IOCTL_MB_SEND\000"
.LC96:
	.ascii	"VVI_IOCTL_DEV_BIND_PIPE\000"
.LC97:
	.ascii	"VVI_IOCTL_DEV_ATTACH_BUF_POOL\000"
.LC98:
	.ascii	"VVI_IOCTL_DEV_DETACH_BUF_POOL\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
