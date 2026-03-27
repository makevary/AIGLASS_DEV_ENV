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
	.file	"vpss.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vpss_map_node_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_get, %function
vpss_map_node_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vpss_map_node_get, .-vpss_map_node_get
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_compat_ioctl, %function
vpss_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vpss_compat_ioctl, .-vpss_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_open, %function
vpss_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L4
	movs	r0, #0
	str	r3, [r1, #128]
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0+4
	.fnend
	.size	vpss_open, .-vpss_open
	.align	1
	.global	vpss_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_version, %function
vpss_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r2, [r1, #48]	@ unaligned
	ldr	r5, [r0, #128]
	cmp	r2, #124
	ldr	r6, [r5, #136]
	beq	.L7
	movs	r3, #54
	ldr	r2, .L11
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L11+4
	movs	r0, #6
	bl	vlog
	mov	r0, #-1
.L6:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L7:
	movs	r1, #0
	mov	r0, r4
	bl	rkos_memset
	ldr	r3, [r6, #164]
	str	r3, [r4]	@ unaligned
	ldr	r3, [r5]
	movs	r5, #0
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	str	r3, [r4, #4]	@ unaligned
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6, #160]
	bl	rkos_strlen
	str	r0, [r4, #12]	@ unaligned
	ldr	r0, .L11+8
	bl	rkos_strlen
	movs	r3, #17
	strb	r3, [r4, #88]
	ldr	r3, [r4, #12]	@ unaligned
	strb	r5, [r4, #89]
	cmp	r3, #31
	strb	r5, [r4, #90]
	strb	r5, [r4, #91]
	str	r0, [r4, #52]	@ unaligned
	ble	.L9
	movs	r3, #31
	strb	r5, [r4, #13]
	strb	r3, [r4, #12]
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
.L9:
	cmp	r0, #32
	ble	.L10
	movs	r3, #0
	movs	r2, #32
	strb	r3, [r4, #53]
	strb	r2, [r4, #52]
	strb	r3, [r4, #54]
	strb	r3, [r4, #55]
.L10:
	ldr	r2, [r4, #12]	@ unaligned
	add	r0, r4, #16
	ldr	r1, [r6, #160]
	bl	rkos_strncpy
	ldr	r2, [r4, #52]	@ unaligned
	ldr	r1, .L11+8
	add	r0, r4, #56
	bl	rkos_strncpy
	ldr	r2, [r4, #88]	@ unaligned
	ldr	r1, .L11+12
	add	r0, r4, #92
	bl	rkos_strncpy
	movs	r0, #0
	b	.L6
.L12:
	.align	2
.L11:
	.word	.LC0
	.word	.LANCHOR1
	.word	.LC1
	.word	.LC2
	.fnend
	.size	vpss_version, .-vpss_version
	.align	1
	.global	vpss_map_node_set
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_set, %function
vpss_map_node_set:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #24
	sub	sp, sp, #24
	ldr	r6, [r1, #8]	@ unaligned
	cmp	r3, #28
	beq	.L14
	movs	r3, #87
	ldr	r2, .L36
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L36+4
	movs	r0, #6
	bl	vlog
.L33:
	mov	r5, #-1
.L13:
	mov	r0, r5
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L14:
	ldr	r0, [r1, #16]	@ unaligned
	cmp	r0, #19
	beq	.L16
	cmp	r0, #25
	beq	.L16
	movs	r3, #92
	ldr	r2, .L36+8
	str	r3, [sp]
	ldr	r3, .L36+4
	str	r0, [sp, #4]
.L35:
	movs	r1, #2
	movs	r0, #6
	bl	vlog
	b	.L33
.L16:
	ldr	r1, [r4, #20]	@ unaligned
	ldr	r2, [r4, #24]	@ unaligned
	bl	vsys_get_node_from_map
	ldr	r1, [r4, #4]	@ unaligned
	mov	r5, r0
	cbnz	r0, .L17
	ldr	r3, [r4, #24]	@ unaligned
	ldr	r2, .L36+12
	str	r3, [sp, #16]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #16]	@ unaligned
	strd	r1, r3, [sp, #4]
	movs	r3, #100
	str	r3, [sp]
	ldr	r3, .L36+4
.L34:
	movs	r1, #2
	movs	r0, #6
	bl	vlog
	b	.L33
.L17:
	ldr	r2, [r4]	@ unaligned
	cbnz	r2, .L18
	movs	r0, #6
	adds	r6, r6, #1
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L19
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, .L36+16
	str	r3, [sp, #4]
	movs	r3, #107
	str	r3, [sp]
	ldr	r3, .L36+4
	b	.L35
.L19:
	ldr	r3, [r4, #16]	@ unaligned
	cmp	r3, #19
	bne	.L20
	mov	r1, r5
.L32:
	bl	mpi_node_bind
	cbz	r0, .L18
	ldr	r3, [r4, #24]	@ unaligned
	ldr	r2, .L36+20
	str	r3, [sp, #16]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #4]
	movs	r3, #118
	str	r3, [sp]
	ldr	r3, .L36+4
	b	.L34
.L20:
	cmp	r3, #25
	bne	.L18
	mov	r0, r5
	b	.L32
.L18:
	mov	r3, r5
	mov	r2, r6
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #6
	bl	vsys_add_node_to_map
	ldr	r5, [r4]	@ unaligned
	ldr	r2, [r4, #24]	@ unaligned
	ldr	r3, [r4, #4]	@ unaligned
	cbz	r5, .L22
	strd	r3, r2, [sp, #4]
	movs	r1, #4
	movs	r3, #126
	ldr	r2, .L36+24
	str	r3, [sp]
	movs	r0, #6
	ldr	r3, .L36+4
	movs	r5, #0
	bl	vlog
	b	.L13
.L22:
	str	r2, [sp, #12]
	movs	r1, #4
	ldr	r2, [r4, #8]	@ unaligned
	movs	r0, #6
	strd	r3, r2, [sp, #4]
	movs	r3, #130
	ldr	r2, .L36+28
	str	r3, [sp]
	ldr	r3, .L36+4
	bl	vlog
	b	.L13
.L37:
	.align	2
.L36:
	.word	.LC3
	.word	.LANCHOR1+13
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.fnend
	.size	vpss_map_node_set, .-vpss_map_node_set
	.align	1
	.global	vpss_map_node_remove
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_map_node_remove, %function
vpss_map_node_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	ldr	r7, [r1, #8]	@ unaligned
	cmp	r3, #28
	beq	.L39
	movs	r3, #153
	ldr	r2, .L63
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L63+4
	movs	r0, #6
	bl	vlog
.L61:
	mov	r5, #-1
.L38:
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L39:
	ldr	r3, [r1, #16]	@ unaligned
	cmp	r3, #19
	beq	.L41
	cmp	r3, #25
	beq	.L41
	str	r3, [sp, #4]
	movs	r3, #158
	ldr	r2, .L63+8
	str	r3, [sp]
	ldr	r3, .L63+4
.L62:
	movs	r1, #2
	movs	r0, #6
	bl	vlog
	b	.L61
.L41:
	ldr	r1, [r4, #4]	@ unaligned
	movs	r2, #0
	movs	r0, #6
	bl	vsys_get_node_from_map
	ldr	r1, [r4, #4]	@ unaligned
	mov	r6, r0
	cbnz	r0, .L42
	movs	r3, #164
	str	r1, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L63+12
	ldr	r3, .L63+4
	b	.L62
.L42:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #0
	bne	.L50
	adds	r7, r7, #1
	movs	r0, #6
	mov	r2, r7
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L44
	movs	r3, #172
	str	r7, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L63+16
	ldr	r3, .L63+4
	b	.L62
.L44:
	ldr	r3, [r4, #16]	@ unaligned
	cmp	r3, #19
	bne	.L45
	mov	r0, r6
	bl	mpi_node_unbind
	ldr	r3, [r4, #8]	@ unaligned
	ldr	r2, .L63+20
	movs	r1, #4
	movs	r0, #6
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]	@ unaligned
	str	r7, [sp, #12]
	str	r3, [sp, #4]
	movs	r3, #178
	str	r3, [sp]
	ldr	r3, .L63+4
	bl	vlog
.L46:
	mov	r2, r7
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #6
	bl	vsys_remove_node_from_map
	b	.L38
.L45:
	cmp	r3, #25
	bne	.L46
	mov	r1, r6
	bl	mpi_node_unbind
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, .L63+24
	movs	r1, #4
	movs	r0, #6
	str	r7, [sp, #8]
	str	r3, [sp, #4]
	movs	r3, #182
	str	r3, [sp]
	ldr	r3, .L63+4
	bl	vlog
	b	.L46
.L50:
	ldr	r8, .L63+4
	movs	r5, #1
	ldr	r9, .L63+32
	ldr	r10, .L63+36
.L43:
	ldr	r1, [r4, #4]	@ unaligned
	mov	r2, r5
	movs	r0, #6
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbz	r0, .L47
	cmp	r5, #5
	ldr	r7, [r0, #92]
	beq	.L48
	mov	r0, r6
	bl	mpi_node_unbind
	ldr	r3, [r4, #4]	@ unaligned
	subs	r2, r5, #1
	movs	r1, #4
	movs	r0, #6
	strd	r3, r2, [sp, #4]
	mov	r2, r10
	str	r3, [sp, #12]
	movs	r3, #195
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
.L49:
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #6
	bl	vsys_remove_node_from_map
.L47:
	adds	r5, r5, #1
	cmp	r5, #6
	bne	.L43
	movs	r2, #0
	ldr	r1, [r4, #4]	@ unaligned
	mov	r0, r5
	bl	vsys_remove_node_from_map
	ldr	r3, [r4, #4]	@ unaligned
	mov	r0, r5
	ldr	r2, .L63+28
	movs	r1, #4
	movs	r5, #0
	str	r3, [sp, #4]
	movs	r3, #206
	str	r7, [sp, #8]
	str	r3, [sp]
	ldr	r3, .L63+4
	bl	vlog
	b	.L38
.L48:
	mov	r1, r6
	bl	mpi_node_unbind
	ldr	r3, [r4, #4]	@ unaligned
	mov	r2, r9
	movs	r1, #4
	movs	r0, #6
	strd	r3, r3, [sp, #4]
	movs	r3, #199
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	b	.L49
.L64:
	.align	2
.L63:
	.word	.LC3
	.word	.LANCHOR1+31
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC17
	.word	.LC16
	.word	.LC15
	.fnend
	.size	vpss_map_node_remove, .-vpss_map_node_remove
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_ioctl, %function
vpss_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, [r0, #128]
	mov	r5, r0
	mov	r6, r1
	mov	r7, r2
	movs	r1, #5
	ldr	r2, .L69
	ldr	r8, [r3, #136]
	movs	r0, #6
	strd	r4, r3, [sp, #8]
	movs	r3, #233
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L69+4
	bl	vlog
	ldr	r1, [r8, #156]
	cmp	r1, r4
	bhi	.L66
	movs	r3, #236
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L69+4
	movs	r0, #6
	ldr	r2, .L69+8
	bl	vlog
.L67:
.L65:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L66:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r8, #152]
	movs	r3, #20
	mla	r1, r3, r4, r1
	cbnz	r1, .L68
	movs	r3, #243
	ldr	r2, .L69+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L69+4
	movs	r0, #6
	bl	vlog
	b	.L65
.L68:
	mov	r3, r7
	mov	r2, r6
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L70:
	.align	2
.L69:
	.word	.LC18
	.word	.LANCHOR1+52
	.word	.LC19
	.word	.LC20
	.fnend
	.size	vpss_ioctl, .-vpss_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_thread_fn, %function
vpss_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	add	r5, r0, #144
	mov	r4, r0
.L72:
	bl	rkos_kthread_should_stop
	cbnz	r0, .L74
	ldr	r3, [r4]
	cbz	r3, .L73
	movs	r0, #1
	bl	rkos_msleep
.L74:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L73:
	mov	r0, r5
	bl	rkos_down
	b	.L72
	.fnend
	.size	vpss_thread_fn, .-vpss_thread_fn
	.align	1
	.global	vpss_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_probe, %function
vpss_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r2, #168
	ldr	r4, .L78
	mov	r5, r0
	movs	r1, #0
	mov	r0, r4
	bl	rkos_memset
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #164]
	movs	r1, #0
	ldr	r3, .L78+4
	str	r1, [r4, #108]
	strd	r1, r1, [r4, #116]
	str	r3, [r4, #152]
	movs	r3, #4
	str	r4, [r4, #140]
	str	r3, [r4, #156]
	str	r0, [r4, #160]
	add	r0, r4, #144
	bl	rkos_sema_init
	ldr	r3, .L78+8
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L78+12
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r6, r0
	bhi	.L77
	bl	wake_up_process
.L77:
	mov	r2, r5
	movs	r1, #8
	ldr	r0, .L78+16
	str	r6, [r4, #148]
	bl	mpi_dev_register
	movs	r2, #0
	ldr	r1, .L78+20
	ldr	r0, .L78+16
	pop	{r4, r5, r6, lr}
	b	mpi_sysfs_dev_add
.L79:
	.align	2
.L78:
	.word	.LANCHOR0
	.word	.LANCHOR1+64
	.word	.LC21
	.word	vpss_thread_fn
	.word	.LANCHOR0+4
	.word	.LANCHOR1+144
	.fnend
	.size	vpss_probe, .-vpss_probe
	.align	1
	.global	vpss_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_shutdown, %function
vpss_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L89
	str	r3, [r4]
	ldr	r3, [r4, #148]
	cbz	r3, .L81
	add	r0, r4, #144
	bl	rkos_up
	ldr	r0, [r4, #148]
	bl	kthread_stop
	movs	r3, #0
	str	r3, [r4, #148]
.L81:
	ldr	r0, .L89+4
	bl	mpi_sysfs_dev_remove
	ldr	r0, .L89+4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #160]
	cbz	r0, .L82
	bl	rkos_vfree
	movs	r3, #0
	str	r3, [r4, #160]
.L82:
	ldr	r0, .L89+8
	pop	{r4, lr}
	b	rkos_sema_destory
.L90:
	.align	2
.L89:
	.word	.LANCHOR0
	.word	.LANCHOR0+4
	.word	.LANCHOR0+144
	.fnend
	.size	vpss_shutdown, .-vpss_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vpss_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_init, %function
vpss_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L92
	bl	vpss_probe
	movs	r0, #0
	pop	{r3, pc}
.L93:
	.align	2
.L92:
	.word	.LC21
	.fnend
	.size	vpss_init, .-vpss_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vpss_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vpss_exit, %function
vpss_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vpss_shutdown
	.fnend
	.size	vpss_exit, .-vpss_exit
	.global	g_vpss_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.36128, %object
	.size	__func__.36128, 13
__func__.36128:
	.ascii	"vpss_version\000"
	.type	__func__.36138, %object
	.size	__func__.36138, 18
__func__.36138:
	.ascii	"vpss_map_node_set\000"
	.type	__func__.36152, %object
	.size	__func__.36152, 21
__func__.36152:
	.ascii	"vpss_map_node_remove\000"
	.type	__func__.36169, %object
	.size	__func__.36169, 11
__func__.36169:
	.ascii	"vpss_ioctl\000"
	.space	1
	.type	vpss_ioctls, %object
	.size	vpss_ioctls, 80
vpss_ioctls:
	.word	-1065586688
	.word	0
	.word	vpss_version
	.word	.LC22
	.word	0
	.word	-1071878143
	.word	0
	.word	vpss_map_node_set
	.word	.LC23
	.word	0
	.word	-1071878142
	.word	0
	.word	vpss_map_node_get
	.word	.LC24
	.word	0
	.word	-1071878141
	.word	0
	.word	vpss_map_node_remove
	.word	.LC25
	.word	0
	.type	vpss_driver_fops, %object
	.size	vpss_driver_fops, 128
vpss_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	vpss_ioctl
	.word	vpss_compat_ioctl
	.word	0
	.space	4
	.word	vpss_open
	.space	4
	.word	0
	.space	60
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_vpss_dev, %object
	.size	g_vpss_dev, 168
g_vpss_dev:
	.space	168
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct vpss_version mismatching\033[0m\000"
.LC1:
	.ascii	"-2024-10-16-16:52:39\000"
.LC2:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC3:
	.ascii	"\033[1;31mstruct vpss_map_info mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;31mVPSS sub mode id fail mod(%d)\033[0m\000"
.LC5:
	.ascii	"\033[1;31mVPSS GRP %d get sub node fail mod,dev,chn"
	.ascii	"(%d-%d-%d)\033[0m\000"
.LC6:
	.ascii	"\033[1;31mVPSS GRP %d get grp node fail\033[0m\000"
.LC7:
	.ascii	"\033[1;31mVPSS GRP %d bind sub node fail mod,dev,ch"
	.ascii	"n(%d-%d-%d)\033[0m\000"
.LC8:
	.ascii	"\033[1;32mVPSS GRP %d node map set to node %d succe"
	.ascii	"ss!\033[0m\000"
.LC9:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node map set to node %"
	.ascii	"d success!\033[0m\000"
.LC10:
	.ascii	"\033[1;31mVPSS sub mode id fail mod_id = %d\033[0m\000"
.LC11:
	.ascii	"\033[1;31mVPSS get grp node fail grp_id = %d\033[0m"
	.ascii	"\000"
.LC12:
	.ascii	"\033[1;31mVPSS get sub node fail channel_id = %d\033"
	.ascii	"[0m\000"
.LC13:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node map remove node %"
	.ascii	"d success!\033[0m\000"
.LC14:
	.ascii	"\033[1;32mVPSS GRP %d AIISP node map remove node %d"
	.ascii	" success!\033[0m\000"
.LC15:
	.ascii	"\033[1;32mVPSS GRP %d CHN %d node unbind to GRP %d "
	.ascii	"node success!\033[0m\000"
.LC16:
	.ascii	"\033[1;32mVPSS GRP %d AIISP node unbind to GRP %d n"
	.ascii	"ode success!\033[0m\000"
.LC17:
	.ascii	"\033[1;32mVPSS GRP %d node map remove node %d succe"
	.ascii	"ss!\033[0m\000"
.LC18:
	.ascii	"nr = %d, index = %d dev = %p\000"
.LC19:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC20:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC21:
	.ascii	"vpss\000"
.LC22:
	.ascii	"VPSS_IOCTL_VERSION\000"
.LC23:
	.ascii	"VPSS_IOCTL_MAP_NODE_SET\000"
.LC24:
	.ascii	"VPSS_IOCTL_MAP_NODE_GET\000"
.LC25:
	.ascii	"VPSS_IOCTL_MAP_NODE_REMOVE\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
