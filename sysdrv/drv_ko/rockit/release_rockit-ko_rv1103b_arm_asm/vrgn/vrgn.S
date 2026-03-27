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
	.file	"vrgn.c"
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
	.type	list_del, %function
list_del:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r2, #256
	mov	r3, #290
	strd	r2, r3, [r0]
	bx	lr
	.fnend
	.size	list_del, .-list_del
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_compat_ioctl, %function
vrgn_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrgn_compat_ioctl, .-vrgn_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	node_delete_callback, %function
node_delete_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	movs	r4, #0
	ldr	r3, [r0, #120]!
	subs	r3, r3, #4
.L4:
	adds	r2, r3, #4
	cmp	r2, r0
	bne	.L5
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L15
	ldr	r3, [r5, #48]
	cmp	r3, #1
	beq	.L6
.L10:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L5:
	str	r4, [r3]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r3, #12]
	ldr	r2, [r1, #28]
	subs	r2, r2, #1
	str	r2, [r1, #28]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r3, #4]
	subs	r3, r3, #4
	b	.L4
.L6:
	ldr	r4, [r5, #168]!
	ldr	r8, .L15+4
	ldr	r9, .L15+8
	ldr	r6, [r4]
.L7:
	cmp	r4, r5
	beq	.L10
	cbz	r4, .L8
	ldr	r3, [r4, #28]
	cbnz	r3, .L8
	ldr	r3, [r4, #24]
	mov	r2, r9
	movs	r1, #4
	movs	r0, #3
	str	r3, [sp, #4]
	movs	r3, #217
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	mov	r0, r4
	bl	list_del
	bl	kfree
.L8:
	mov	r4, r6
	ldr	r6, [r6]
	b	.L7
.L16:
	.align	2
.L15:
	.word	g_vrgn_dev
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	node_delete_callback, .-node_delete_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	osd_sync_callback, %function
osd_sync_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, [r5, #120]!
.L21:
	subs	r4, r4, #4
	adds	r3, r4, #4
	cmp	r3, r5
	bne	.L20
	pop	{r4, r5, r6, pc}
.L20:
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L19
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r4, #12]
	adds	r0, r0, #12
	bl	complete_all
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L19:
	ldr	r4, [r4, #4]
	b	.L21
	.fnend
	.size	osd_sync_callback, .-osd_sync_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	filter_osd_get_buff_callback, %function
filter_osd_get_buff_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r3, [r0, #44]
	mov	r4, r0
	ldr	r2, [r1, #44]
	mov	r5, r1
	strd	r3, r2, [sp, #12]
	ldr	r3, [r1]
	movs	r1, #5
	ldr	r2, .L31
	str	r3, [sp, #8]
	ldr	r3, [r0]
	movs	r0, #3
	str	r3, [sp, #4]
	movs	r3, #181
	str	r3, [sp]
	ldr	r3, .L31+4
	bl	vlog
	cbz	r4, .L23
	mov	r0, r4
	bl	mpi_obj_ref
.L23:
	cbz	r5, .L24
	mov	r0, r5
	bl	mpi_obj_ref
.L24:
	movs	r2, #1
	mov	r1, r5
	ldr	r0, [r4, #136]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, lr}
	b	mpi_node_buffer_in
.L32:
	.align	2
.L31:
	.word	.LC1
	.word	.LANCHOR0+21
	.fnend
	.size	filter_osd_get_buff_callback, .-filter_osd_get_buff_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rga_filter_done_callback, %function
rga_filter_done_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r5, r1
	ldr	r4, [r0, #136]
	.pad #20
	sub	sp, sp, #20
	cbz	r4, .L33
	ldr	r3, [r4, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L35
.L38:
	mov	r0, r4
	bl	mpi_obj_unref
	mov	r0, r5
	bl	mpi_obj_unref
	ldr	r3, [r4, #44]
	ldr	r2, [r5, #44]
	movs	r1, #5
	movs	r0, #3
	strd	r3, r2, [sp, #8]
	ldr	r3, [r4]
	ldr	r2, .L42
	str	r3, [sp, #4]
	movs	r3, #175
	str	r3, [sp]
	ldr	r3, .L42+4
	bl	vlog
.L33:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L35:
	ldr	r3, [r4, #140]
	movs	r2, #1
	mov	r0, r4
	cbz	r3, .L37
	bl	mpi_node_buffer_in
	b	.L38
.L37:
	bl	mpi_node_buffer_out
	b	.L38
.L43:
	.align	2
.L42:
	.word	.LC2
	.word	.LANCHOR0+50
	.fnend
	.size	rga_filter_done_callback, .-rga_filter_done_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_thread_fn, %function
vrgn_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r0
	.pad #24
	sub	sp, sp, #24
	ldr	r0, [r0, #84]
	bl	rkos_kthread_set_name
	ldr	r9, .L71
	ldr	r10, .L71+4
	add	r8, r6, #144
.L45:
	bl	rkos_kthread_should_stop
	cbz	r0, .L62
.L46:
	movs	r0, #0
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L62:
	ldr	r3, [r6, #152]
	cmp	r3, #0
	bne	.L46
	mov	r0, r8
	bl	rkos_down
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, r6
	ldr	r4, [r3, #176]!
	cmp	r4, r3
	beq	.L47
	cbnz	r4, .L48
.L47:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L45
.L48:
	mov	r0, r4
	bl	list_del
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldrd	r5, r7, [r4, #8]
	mov	r2, r10
	movs	r1, #5
	movs	r0, #3
	ldr	r3, [r7]
	str	r3, [sp, #16]
	ldr	r3, [r5]
	strd	r4, r3, [sp, #8]
	ldr	r3, [r6, #84]
	str	r3, [sp, #4]
	movs	r3, #126
	str	r3, [sp]
	mov	r3, r9
	bl	vlog
	ldr	r3, [r5, #144]
	cbnz	r3, .L50
	ldr	r0, [r4, #8]
	cbnz	r0, .L69
.L61:
	ldr	r0, [r4, #8]
	bl	mpi_obj_unref
	ldr	r0, [r4, #12]
	b	.L70
.L50:
	cbz	r5, .L57
	ldr	r3, [r5, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L54
.L57:
	mov	r0, r5
	bl	mpi_obj_unref
	mov	r0, r7
.L70:
	bl	mpi_obj_unref
	mov	r0, r4
	bl	kfree
	b	.L45
.L54:
	ldr	r3, [r4, #8]
	movs	r2, #1
	mov	r1, r7
	mov	r0, r5
	ldr	r3, [r3, #140]
	cbz	r3, .L56
	bl	mpi_node_buffer_in
	b	.L57
.L56:
	bl	mpi_node_buffer_out
	b	.L57
.L69:
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	bne	.L61
	ldr	r3, [r0, #140]
	movs	r2, #1
	ldr	r1, [r4, #12]
	cbz	r3, .L60
	bl	mpi_node_buffer_in
	b	.L61
.L60:
	bl	mpi_node_buffer_out
	b	.L61
.L72:
	.align	2
.L71:
	.word	.LANCHOR0+75
	.word	.LC3
	.fnend
	.size	vrgn_thread_fn, .-vrgn_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_release, %function
vrgn_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	ldr	r6, [r1, #128]
	ldr	r4, [r6]
	mov	r0, r4
	ldr	r5, [r4, #136]
	bl	mpi_obj_unref
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #44]
	cmp	r3, #1
	bne	.L78
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L83
	movs	r0, #3
	ldr	r9, .L83+4
	str	r3, [sp, #4]
	movw	r3, #987
	str	r3, [sp]
	ldr	r3, .L83+4
	bl	vlog
	ldr	r4, [r5, #168]!
	ldr	r10, .L83+8
	ldr	r7, [r4]
.L75:
	cmp	r4, r5
	bne	.L77
.L78:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r6, #4
	bl	mpi_fs_buf_deinit
	mov	r0, r6
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L77:
	cbz	r4, .L76
	ldr	r3, [r4, #28]
	cbnz	r3, .L76
	ldr	r3, [r4, #24]
	mov	r2, r10
	movs	r1, #4
	movs	r0, #3
	str	r3, [sp, #4]
	movw	r3, #991
	str	r3, [sp]
	mov	r3, r9
	bl	vlog
	mov	r0, r4
	bl	list_del
	bl	kfree
.L76:
	mov	r4, r7
	ldr	r7, [r7]
	b	.L75
.L84:
	.align	2
.L83:
	.word	.LC4
	.word	.LANCHOR0+90
	.word	.LC0
	.fnend
	.size	vrgn_release, .-vrgn_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_ioctl, %function
vrgn_ioctl:
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
	ldr	r2, .L89
	ldr	r3, [r3]
	movs	r0, #3
	ldr	r8, [r3, #136]
	strd	r4, r3, [sp, #8]
	movw	r3, #926
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L89+4
	bl	vlog
	ldr	r1, [r8, #160]
	cmp	r1, r4
	bhi	.L86
	movw	r3, #929
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L89+4
	movs	r0, #3
	ldr	r2, .L89+8
	bl	vlog
.L87:
.L85:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L86:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r8, #156]
	movs	r3, #20
	mla	r1, r3, r4, r1
	ldr	r3, .L89+12
	str	r3, [r1, #16]
	cbnz	r1, .L88
	movw	r3, #937
	ldr	r2, .L89+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L89+4
	movs	r0, #3
	bl	vlog
	b	.L85
.L88:
	mov	r3, r7
	mov	r2, r6
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L90:
	.align	2
.L89:
	.word	.LC5
	.word	.LANCHOR0+103
	.word	.LC6
	.word	g_vrgn_dev+164
	.word	.LC7
	.fnend
	.size	vrgn_ioctl, .-vrgn_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_read, %function
vrgn_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r4, [r0, #128]
	mov	fp, r1
	str	r2, [sp, #28]
	ldr	r3, [r4], #4
	mov	r0, r4
	ldr	r7, [r3, #136]
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r5, r0
	bne	.L92
	ldr	r3, .L124
	mov	r0, r4
	ldr	r2, .L124+4
	ldr	r1, .L124+8
	str	r3, [sp]
	ldr	r3, .L124+12
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	ldr	r1, .L124+16
	mov	r0, r4
	ldr	r6, .L124+20
	bl	mpi_fs_buf_add
	ldr	r1, .L124+24
	mov	r0, r4
	ldr	r8, .L124+52
	bl	mpi_fs_buf_add
	ldr	r5, [r7, #168]
	add	r9, r6, #156
.L93:
	add	r3, r7, #168
	cmp	r5, r3
	beq	.L102
	ldr	r3, [r5, #24]
	str	r3, [sp, #24]
	ldr	r3, [r5, #32]
	cbz	r3, .L94
	cmp	r3, #1
	beq	.L94
	cmp	r3, #2
	beq	.L94
	cmp	r3, #3
	beq	.L94
	cmp	r3, #4
	bne	.L116
.L94:
	add	r3, r6, r3, lsl #3
	ldr	r3, [r3, #120]
.L95:
	ldrd	r10, ip, [r5, #40]
	movs	r1, #0
	ldr	r0, [r5, #36]
.L98:
	ldr	r2, [r9, r1, lsl #3]
	cmp	r0, r2
	bne	.L96
	add	r1, r6, r1, lsl #3
	ldr	lr, [r1, #160]
.L97:
	ldr	r0, [r5, #1756]
	cmp	r0, #0
	beq	.L117
	ldr	r1, [r0]
	ldr	r0, [r0, #44]
.L99:
	strd	r1, r0, [sp, #12]
	mov	r0, r4
	strd	ip, lr, [sp, #4]
	str	r10, [sp]
	ldr	r2, [sp, #24]
	ldr	r1, .L124+28
	bl	mpi_fs_buf_add
	cbz	r0, .L100
.L102:
	ldr	r7, .L124+32
	mov	r0, r4
	ldr	r1, .L124+36
	bl	mpi_fs_buf_add
	ldr	r1, .L124+40
	mov	r0, r4
	ldr	r9, .L124+56
	bl	mpi_fs_buf_add
	ldr	r5, [r7]
	ldr	r10, .L124+60
	subs	r5, r5, #72
.L101:
	add	r3, r5, #72
	cmp	r3, r7
	beq	.L110
	ldr	r3, [r5, #80]
	mov	r1, r9
	ldr	r2, [r5]
	mov	r0, r4
	ldr	r3, [r3, #80]
	bl	mpi_fs_buf_add
	cbz	r0, .L104
.L110:
	ldr	r1, .L124+44
	mov	r0, r4
	bl	mpi_fs_buf_add
	mov	r1, fp
	mov	r0, r4
	ldr	r2, [sp, #28]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L116:
	mov	r3, r8
	b	.L95
.L96:
	adds	r1, r1, #1
	cmp	r1, #14
	bne	.L98
	mov	lr, r8
	b	.L97
.L117:
	mov	r1, #-1
	mov	r0, r1
	b	.L99
.L100:
	ldr	r2, [r5, #28]
	mov	r0, r4
	ldr	r1, .L124+48
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L102
	ldr	r1, .L124+44
	mov	r0, r4
	bl	mpi_fs_buf_add
	ldr	r5, [r5]
	b	.L93
.L104:
	ldr	r3, [r5, #144]
	cbnz	r3, .L105
.L107:
	ldr	r1, .L124+44
	mov	r0, r4
	bl	mpi_fs_buf_add
	ldr	r5, [r5, #72]
	subs	r5, r5, #72
	b	.L101
.L105:
	mov	r8, r5
	ldr	r6, [r8, #120]!
.L123:
	subs	r6, r6, #4
	adds	r3, r6, #4
	cmp	r3, r8
	beq	.L107
	ldr	r2, [r6, #12]
	mov	r1, r10
	ldr	r3, [r6, #32]
	mov	r0, r4
	str	r3, [sp]
	ldr	r3, [r6, #28]
	ldr	r2, [r2, #24]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L107
	ldr	r6, [r6, #4]
	b	.L123
.L92:
	cbnz	r0, .L91
	mov	r0, r4
	bl	mpi_fs_buf_reset
.L91:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L125:
	.align	2
.L124:
	.word	.LC11
	.word	g_vrgn_dev
	.word	.LC10
	.word	.LC9
	.word	.LC12
	.word	.LANCHOR0
	.word	.LC13
	.word	.LC14
	.word	mpi_node_list
	.word	.LC15
	.word	.LC16
	.word	.LC18
	.word	.LC17
	.word	.LC8
	.word	.LC19
	.word	.LC20
	.fnend
	.size	vrgn_read, .-vrgn_read
	.align	1
	.global	vrgn_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_version, %function
vrgn_version:
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
	beq	.L127
	movw	r3, #565
	ldr	r2, .L131
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L131+4
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L126:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L127:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r1, #1]
	strb	r3, [r1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
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
	b	.L126
.L132:
	.align	2
.L131:
	.word	.LC21
	.word	.LANCHOR0+268
	.fnend
	.size	vrgn_version, .-vrgn_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	push_list.constprop.9, %function
push_list.constprop.9:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r0
	ldr	r3, [r4, #8]!
	ldr	r2, [r3], #-4
	subs	r2, r2, #4
.L134:
	adds	r5, r3, #4
	cmp	r5, r4
	bne	.L137
	ldr	r3, [r0, #12]
	adds	r2, r1, #4
	str	r2, [r0, #12]
	strd	r4, r3, [r1, #4]
	str	r2, [r3]
	b	.L133
.L137:
	ldr	r7, [r3, #44]
	ldr	r6, [r1, #44]
	cmp	r7, r6
	bls	.L135
	ldr	r2, [r3, #8]
	adds	r0, r1, #4
	str	r0, [r3, #8]
	strd	r5, r2, [r1, #4]
	str	r0, [r2]
.L133:
	pop	{r4, r5, r6, r7, pc}
.L135:
	ldr	r5, [r2, #4]
	mov	r3, r2
	subs	r2, r5, #4
	b	.L134
	.fnend
	.size	push_list.constprop.9, .-push_list.constprop.9
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_open, %function
vrgn_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L143
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	ldr	r0, [r3, #20]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L139
	movw	r3, #961
	ldr	r2, .L143+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L143+8
	movs	r0, #3
	bl	vlog
.L142:
	mov	r5, #-1
.L138:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L139:
	mov	r1, #5120
	adds	r0, r0, #4
	bl	mpi_fs_buf_init
	mov	r5, r0
	cbz	r0, .L141
	mov	r0, r4
	bl	kfree
	b	.L142
.L141:
	ldr	r6, .L143+12
	mov	r0, r6
	bl	mpi_obj_ref
	str	r6, [r4]
	str	r4, [r7, #128]
	b	.L138
.L144:
	.align	2
.L143:
	.word	kmalloc_caches
	.word	.LC22
	.word	.LANCHOR0+281
	.word	g_vrgn_dev+4
	.fnend
	.size	vrgn_open, .-vrgn_open
	.align	1
	.global	list_rgn_find_by_handle
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	list_rgn_find_by_handle, %function
list_rgn_find_by_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L149
	ldr	r3, [r2, #168]!
.L146:
	cmp	r3, r2
	bne	.L148
	movs	r3, #0
.L145:
	mov	r0, r3
	bx	lr
.L148:
	ldr	r1, [r3, #24]
	cmp	r1, r0
	beq	.L145
	ldr	r3, [r3]
	b	.L146
.L150:
	.align	2
.L149:
	.word	g_vrgn_dev
	.fnend
	.size	list_rgn_find_by_handle, .-list_rgn_find_by_handle
	.align	1
	.global	vrgn_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_create, %function
vrgn_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r0, [r1]	@ unaligned
	bl	list_rgn_find_by_handle
	ldr	r2, [r5, #1056]	@ unaligned
	movw	r3, #1164
	cmp	r2, r3
	mov	r6, r0
	beq	.L152
	mov	r3, #588
	ldr	r2, .L165
	str	r3, [sp]
	ldr	r3, .L165+4
.L164:
	movs	r1, #2
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L151:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L152:
	cbz	r0, .L154
	movw	r2, #1052
	adds	r1, r5, #4
	adds	r0, r0, #32
	movs	r4, #0
	bl	memcpy
	str	r4, [r6, #1756]
	str	r4, [r6, #28]
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L165+8
	str	r3, [sp, #4]
	movw	r3, #595
	str	r3, [sp]
	ldr	r3, .L165+4
.L163:
	movs	r1, #4
	movs	r0, #3
	bl	vlog
	movs	r0, #0
	b	.L151
.L154:
	ldr	r3, .L165+12
	mov	r1, #3520
	ldr	r0, [r3, #44]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L155
	mov	r3, #600
	ldr	r2, .L165+16
	str	r3, [sp]
	ldr	r3, .L165+4
	b	.L164
.L155:
	ldr	r3, [r5]	@ unaligned
	str	r3, [r0, #24]
	ldr	r3, [r5, #20]	@ unaligned
	cmp	r3, #1
	bne	.L156
	str	r6, [r0, #12]
	adds	r0, r0, #16
	ldr	r2, .L165+20
	ldr	r1, .L165+24
	bl	__init_swait_queue_head
	mov	r3, #1000
	str	r3, [r4, #8]
.L156:
	movw	r2, #1052
	adds	r1, r5, #4
	add	r0, r4, #32
	bl	memcpy
	movs	r3, #0
	str	r3, [r4, #1756]
	str	r3, [r4, #28]
	ldr	r3, [r5, #4]	@ unaligned
	cmp	r3, #1
	bhi	.L158
	ldr	r0, [r5, #1144]	@ unaligned
	bl	get_mpi_buf
	cbz	r0, .L158
	ldr	r3, [r0, #480]
	str	r3, [r4, #1764]
.L158:
	ldr	r3, .L165+28
	adds	r3, r3, #168
	ldr	r2, [r3, #4]
	str	r4, [r3, #4]
	strd	r3, r2, [r4]
	str	r4, [r2]
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L165+32
	str	r3, [sp, #4]
	movw	r3, #623
	str	r3, [sp]
	ldr	r3, .L165+4
	b	.L163
.L166:
	.align	2
.L165:
	.word	.LC23
	.word	.LANCHOR0+291
	.word	.LC24
	.word	kmalloc_caches
	.word	.LC25
	.word	.LANCHOR1
	.word	.LC26
	.word	g_vrgn_dev
	.word	.LC27
	.fnend
	.size	vrgn_create, .-vrgn_create
	.align	1
	.global	vrgn_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_destroy, %function
vrgn_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r6, r1
	ldr	r5, [r1]	@ unaligned
	mov	r0, r5
	bl	list_rgn_find_by_handle
	ldr	r2, [r6, #1056]	@ unaligned
	movw	r3, #1164
	cmp	r2, r3
	mov	r4, r0
	beq	.L168
	movw	r3, #806
	ldr	r2, .L171
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L171+4
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L167:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L168:
	cmp	r0, #0
	beq	.L167
	ldr	r3, [r0, #24]
	movs	r1, #4
	ldr	r2, .L171+8
	movs	r0, #3
	strd	r5, r3, [sp, #4]
	mov	r3, #812
	str	r3, [sp]
	ldr	r3, .L171+4
	bl	vlog
	mov	r0, r4
	bl	list_del
	bl	kfree
	movs	r0, #0
	b	.L167
.L172:
	.align	2
.L171:
	.word	.LC23
	.word	.LANCHOR0+303
	.word	.LC28
	.fnend
	.size	vrgn_destroy, .-vrgn_destroy
	.align	1
	.global	vrgn_upate_canvas_sync
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_upate_canvas_sync, %function
vrgn_upate_canvas_sync:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r4, [r1, #8]	@ unaligned
	mov	r0, r4
	bl	list_rgn_find_by_handle
	ldr	r3, [r5, #12]	@ unaligned
	cmp	r3, #184
	beq	.L174
	movw	r3, #829
	ldr	r2, .L178
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L178+4
	movs	r0, #3
	bl	vlog
.L177:
	mov	r0, #-1
.L173:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L174:
	cbnz	r0, .L176
	movw	r3, #834
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L178+4
	movs	r0, #3
	ldr	r2, .L178+8
	bl	vlog
	b	.L177
.L176:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r4, #0
	str	r4, [r0, #12]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L178+12
	adds	r0, r0, #12
	ldr	r2, [r0, #-4]
	umull	r2, r3, r2, r3
	lsrs	r1, r3, #3
	bl	wait_for_completion_interruptible_timeout
	mov	r0, r4
	b	.L173
.L179:
	.align	2
.L178:
	.word	.LC29
	.word	.LANCHOR0+316
	.word	.LC30
	.word	-858993459
	.fnend
	.size	vrgn_upate_canvas_sync, .-vrgn_upate_canvas_sync
	.align	1
	.global	vrgn_info_sync
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_info_sync, %function
vrgn_info_sync:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r6, [r1]	@ unaligned
	mov	r0, r6
	bl	list_rgn_find_by_handle
	ldr	r2, [r5, #1056]	@ unaligned
	movw	r3, #2408
	cmp	r2, r3
	mov	r4, r0
	beq	.L181
	mov	r3, #852
	ldr	r2, .L188
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L188+4
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L180:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L181:
	cbz	r0, .L183
	add	r1, r0, #32
	movw	r2, #1052
	adds	r0, r5, #4
	bl	memcpy
	ldr	r3, [r4, #28]
	cbz	r3, .L184
	movs	r2, #72
	addw	r1, r4, #1084
	muls	r2, r3, r2
	addw	r0, r5, #1060
	bl	memcpy
	ldr	r3, [r4, #28]
	movs	r2, #12
	addw	r1, r4, #1660
	addw	r0, r5, #2212
	muls	r2, r3, r2
	bl	memcpy
.L184:
	ldr	r3, [r4, #28]
	movs	r0, #0
	str	r3, [r5, #2404]	@ unaligned
	b	.L180
.L183:
	movw	r3, #865
	str	r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L188+4
	movs	r0, #3
	ldr	r2, .L188+8
	bl	vlog
	mov	r0, r4
	b	.L180
.L189:
	.align	2
.L188:
	.word	.LC31
	.word	.LANCHOR0+339
	.word	.LC32
	.fnend
	.size	vrgn_info_sync, .-vrgn_info_sync
	.align	1
	.global	vrgn_request_buffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_request_buffer, %function
vrgn_request_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r0, [r1]	@ unaligned
	bl	list_rgn_find_by_handle
	ldr	r3, [r4, #12]	@ unaligned
	cmp	r3, #96
	mov	r5, r0
	beq	.L191
	mov	r3, #876
	ldr	r2, .L200
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L200+4
	movs	r0, #3
	bl	vlog
.L196:
	mov	r0, #-1
	b	.L190
.L191:
	cmp	r0, #0
	beq	.L196
	ldr	r3, [r0, #1764]
	cmp	r3, #0
	beq	.L196
	ldr	r0, [r0, #1756]
	cbz	r0, .L193
	bl	mpi_obj_unref
.L193:
	movs	r1, #0
	ldr	r0, [r5, #1764]
	bl	mpi_buf_pool_request_buf
	mov	r6, r0
	cbnz	r0, .L194
	ldr	r3, [r5, #1764]
	movs	r1, #2
	ldr	r2, .L200+8
	movs	r0, #3
	ldr	r3, [r3]
	str	r3, [sp, #4]
	movw	r3, #886
	str	r3, [sp]
	ldr	r3, .L200+4
	bl	vlog
	b	.L196
.L194:
	movs	r1, #0
	ldr	r0, [r0, #484]
	bl	dma_buf_fd
	movs	r2, #80
	add	r1, r6, #664
	str	r0, [r4, #4]	@ unaligned
	add	r0, r4, #16
	ldr	r3, [r6, #648]
	str	r3, [r4, #8]	@ unaligned
	bl	memcpy
	movs	r0, #0
.L190:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L201:
	.align	2
.L200:
	.word	.LC33
	.word	.LANCHOR0+354
	.word	.LC34
	.fnend
	.size	vrgn_request_buffer, .-vrgn_request_buffer
	.global	__aeabi_uidiv
	.align	1
	.global	set_osd_invert_buffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_osd_invert_buffer, %function
set_osd_invert_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r7, [r0, #12]
	.pad #28
	sub	sp, sp, #28
	ldrd	r1, r6, [r0, #72]
	ldr	r0, [r7, #40]
	subs	r3, r1, #1
	add	r3, r3, r0
	rsbs	r0, r1, #0
	ands	r0, r0, r3
	bl	__aeabi_uidiv
	subs	r3, r6, #1
	mov	r1, r6
	adds	r0, r0, #7
	asrs	r4, r0, #3
	ldr	r0, [r7, #44]
	add	r3, r3, r0
	rsbs	r0, r6, #0
	ands	r0, r0, r3
	bl	__aeabi_uidiv
	muls	r4, r0, r4
	ldr	r0, .L211
	bl	mpi_allocator_find_by_name
	movs	r1, #1
	mov	r2, r4
	bl	mpi_allocator_alloc
	mov	r6, r0
	cbz	r0, .L203
	movs	r1, #0
	bl	mpi_buf_create
	mov	r4, r0
	cbz	r0, .L203
	movs	r2, #22
	movs	r1, #0
	adds	r0, r0, #14
	bl	memset
	ldr	r3, .L211+4
	mov	r0, r6
	ldr	r1, [r3]	@ unaligned
	str	r1, [r4, #4]	@ unaligned
	ldr	r1, [r3, #4]	@ unaligned
	str	r1, [r4, #8]	@ unaligned
	ldrh	r1, [r3, #8]	@ unaligned
	ldrb	r3, [r3, #10]	@ zero_extendqisi2
	strh	r1, [r4, #12]	@ unaligned
	strb	r3, [r4, #14]
	bl	dma_buf_put
	str	r4, [r5, #16]
	ldr	r3, [r4, #484]
	movs	r1, #4
	movs	r0, #3
	ldr	r2, [r3, #4]
	ldr	r2, [r2, #28]
	strd	r3, r2, [sp, #12]
	ldr	r3, [r4, #648]
	ldr	r2, .L211+8
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #279
	str	r3, [sp]
	ldr	r3, .L211+12
	bl	vlog
.L202:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L203:
	movw	r3, #281
	ldr	r2, .L211+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L211+12
	movs	r0, #3
	bl	vlog
	b	.L202
.L212:
	.align	2
.L211:
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LANCHOR0+374
	.word	.LC38
	.fnend
	.size	set_osd_invert_buffer, .-set_osd_invert_buffer
	.align	1
	.global	get_list_node_rgn_from_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_list_node_rgn_from_node, %function
get_list_node_rgn_from_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, r1
	push	{r4, lr}
	.save {r4, lr}
	ldr	r3, [r2, #120]!
.L219:
	subs	r3, r3, #4
	adds	r4, r3, #4
	cmp	r4, r2
	bne	.L216
	ldr	r3, [r1, #128]!
.L220:
	subs	r3, r3, #4
	adds	r2, r3, #4
	cmp	r2, r1
	bne	.L218
	movs	r3, #0
.L213:
	mov	r0, r3
	pop	{r4, pc}
.L216:
	ldr	r4, [r3, #12]
	ldr	r4, [r4, #24]
	cmp	r4, r0
	beq	.L213
	ldr	r3, [r3, #4]
	b	.L219
.L218:
	ldr	r2, [r3, #12]
	ldr	r2, [r2, #24]
	cmp	r0, r2
	beq	.L213
	ldr	r3, [r3, #4]
	b	.L220
	.fnend
	.size	get_list_node_rgn_from_node, .-get_list_node_rgn_from_node
	.align	1
	.global	rgn_attach_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rgn_attach_node, %function
rgn_attach_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r6, r1
	mov	r5, r0
	mov	r7, r2
	ldr	r0, [r6, #1132]	@ unaligned
	ldr	r2, [r1, #1140]	@ unaligned
	ldr	r1, [r1, #1136]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r4, r0
	cbnz	r0, .L222
	ldr	r3, [r6, #1140]	@ unaligned
	movs	r1, #2
	ldr	r2, .L240
	movs	r0, #3
	str	r3, [sp, #12]
	ldr	r3, [r6, #1136]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r6, #1132]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #357
	str	r3, [sp]
	ldr	r3, .L240+4
	bl	vlog
	mov	r0, #-1
.L221:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L222:
	ldr	r3, [r4, #144]
	adds	r0, r0, #120
	cbnz	r3, .L224
	add	r3, r4, #128
	str	r0, [r4, #120]
	str	r0, [r4, #124]
	str	r3, [r4, #128]
	str	r3, [r4, #132]
.L224:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	.L225
	ldr	r3, [r4, #120]
	ldr	r2, [r3], #-4
.L239:
	add	lr, r3, #4
	sub	ip, r2, #4
	cmp	lr, r0
	bne	.L229
	ldr	r2, [r4, #124]
	adds	r3, r5, #4
	str	r3, [r4, #124]
	strd	r0, r2, [r5, #4]
	str	r3, [r2]
	b	.L228
.L229:
	ldr	r1, [r3, #44]
	ldr	r2, [r5, #44]
	cmp	r1, r2
	bls	.L227
	ldr	r1, [r3, #8]
	adds	r2, r5, #4
	str	r2, [r3, #8]
	strd	lr, r1, [r5, #4]
	str	r2, [r1]
.L228:
	ldr	r3, [r5, #12]
	ldr	r10, [r3, #32]
	cmp	r10, #1
	bne	.L230
	ldr	r9, [r4, #152]
	cmp	r9, #0
	bne	.L231
	ldr	r3, [r6, #1132]	@ unaligned
	mov	r1, r9
	mov	r0, r4
	ldr	r6, .L240+8
	cmp	r3, #4
	bne	.L232
	bl	mpi_node_add_in_filter
	str	r6, [r4, #360]
	str	r10, [r4, #140]
.L231:
	ldr	r3, [r4, #152]
	adds	r3, r3, #1
	str	r3, [r4, #152]
.L230:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L233
	ldr	r2, [r4, #156]
	ldr	r3, [r4, #148]
	cbnz	r2, .L234
	cbnz	r3, .L234
	ldr	r2, .L240+12
	str	r2, [r4, #156]
.L234:
	adds	r3, r3, #1
	str	r3, [r4, #148]
.L233:
	ldr	r3, [r4, #144]
	adds	r3, r3, #1
	str	r3, [r4, #144]
	ldr	r3, .L240+16
	str	r3, [r4, #160]
	cbz	r7, .L235
	str	r7, [r4, #136]
	str	r4, [r7, #136]
.L235:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L221
.L227:
	ldr	r2, [ip, #4]
	mov	r3, ip
	b	.L239
.L225:
	mov	r1, r5
	bl	push_list.constprop.9
	b	.L228
.L232:
	bl	mpi_node_add_out_filter
	str	r6, [r4, #372]
	str	r9, [r4, #140]
	b	.L231
.L241:
	.align	2
.L240:
	.word	.LC39
	.word	.LANCHOR0+396
	.word	filter_osd_get_buff_callback
	.word	osd_sync_callback
	.word	node_delete_callback
	.fnend
	.size	rgn_attach_node, .-rgn_attach_node
	.align	1
	.global	rgn_dettach_from_rga_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rgn_dettach_from_rga_node, %function
rgn_dettach_from_rga_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	mov	r4, r0
	ldr	r2, [r0, #1160]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r1, [r0, #1156]	@ unaligned
	ldr	r0, [r0, #1152]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L243
	ldr	r3, [r4, #1160]	@ unaligned
	ldr	r2, .L248
	str	r3, [sp, #12]
	ldr	r3, [r4, #1156]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4, #1152]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #418
	str	r3, [sp]
	ldr	r3, .L248+4
.L247:
	movs	r1, #2
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L242:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L243:
	ldr	r3, [r0, #144]
	cbnz	r3, .L245
	ldr	r3, [r4, #1140]	@ unaligned
	ldr	r2, .L248+8
	str	r3, [sp, #12]
	ldr	r3, [r4, #1136]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4, #1132]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #430
	str	r3, [sp]
	ldr	r3, .L248+4
	b	.L247
.L245:
	mov	r1, r0
	ldr	r0, [r4]	@ unaligned
	bl	get_list_node_rgn_from_node
	cmp	r0, #0
	beq	.L242
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r0, #4
	bl	list_del
	ldr	r3, [r5, #144]
	subs	r3, r3, #1
	str	r3, [r5, #144]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L242
.L249:
	.align	2
.L248:
	.word	.LC40
	.word	.LANCHOR0+412
	.word	.LC41
	.fnend
	.size	rgn_dettach_from_rga_node, .-rgn_dettach_from_rga_node
	.align	1
	.global	rgn_dettach_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rgn_dettach_node, %function
rgn_dettach_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r2, [r0, #1140]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	ldr	r1, [r0, #1136]	@ unaligned
	ldr	r0, [r0, #1132]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L251
	ldr	r3, [r6, #1140]	@ unaligned
	ldr	r2, .L270
	str	r3, [sp, #12]
	ldr	r3, [r6, #1136]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r6, #1132]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #455
	str	r3, [sp]
	ldr	r3, .L270+4
.L269:
	movs	r1, #2
	movs	r0, #3
	bl	vlog
	mov	r0, #-1
.L250:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L251:
	ldr	r3, [r0, #144]
	cbnz	r3, .L253
	ldr	r3, [r6, #1140]	@ unaligned
	ldr	r2, .L270+8
	str	r3, [sp, #12]
	ldr	r3, [r6, #1136]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r6, #1132]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #468
	str	r3, [sp]
	ldr	r3, .L270+4
	b	.L269
.L253:
	mov	r1, r0
	ldr	r0, [r6]	@ unaligned
	bl	get_list_node_rgn_from_node
	mov	r4, r0
	cmp	r0, #0
	beq	.L250
	mov	r3, #474
	ldr	r2, .L270+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L270+4
	movs	r0, #3
	bl	vlog
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r4, #4
	bl	list_del
	ldr	r3, [r5, #144]
	subs	r3, r3, #1
	str	r3, [r5, #144]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #32]
	cmp	r3, #1
	bne	.L255
	mov	r0, r6
	bl	rgn_dettach_from_rga_node
	ldr	r3, [r5, #152]
	subs	r3, r3, #1
	str	r3, [r5, #152]
	cbnz	r3, .L255
	ldr	r3, [r6, #1132]	@ unaligned
	mov	r0, r5
	cmp	r3, #4
	bne	.L257
	bl	mpi_node_del_in_filter
.L255:
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #48]
	cmp	r3, #1
	bne	.L259
	ldr	r3, [r5, #148]
	subs	r3, r3, #1
	str	r3, [r5, #148]
	cbnz	r3, .L259
	ldr	r2, [r5, #156]
	cbz	r2, .L259
	str	r3, [r5, #156]
.L259:
	ldr	r0, [r4, #16]
	cbz	r0, .L261
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r4, #16]
.L261:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	str	r0, [r4]
	b	.L250
.L257:
	bl	mpi_node_del_out_filter
	b	.L255
.L271:
	.align	2
.L270:
	.word	.LC39
	.word	.LANCHOR0+438
	.word	.LC41
	.word	.LC42
	.fnend
	.size	rgn_dettach_node, .-rgn_dettach_node
	.align	1
	.global	vrgn_dettach_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_dettach_chn, %function
vrgn_dettach_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, [r1]	@ unaligned
	mov	r4, r1
	bl	list_rgn_find_by_handle
	mov	r5, r0
	cbz	r0, .L277
	ldr	r2, [r4, #1056]	@ unaligned
	movw	r3, #1164
	cmp	r2, r3
	beq	.L274
	movw	r3, #758
	ldr	r2, .L281
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L281+4
	movs	r0, #3
	bl	vlog
.L277:
	mov	r6, #-1
	b	.L272
.L274:
	ldr	r3, [r0, #28]
	cbnz	r3, .L275
	ldr	r3, [r0, #48]
	cmp	r3, #1
	bne	.L275
	ldr	r3, [r0, #24]
	movs	r1, #2
	ldr	r2, .L281+8
	movs	r0, #3
	str	r3, [sp, #4]
	movw	r3, #763
	str	r3, [sp]
	ldr	r3, .L281+4
	bl	vlog
	b	.L277
.L275:
	mov	r0, r4
	bl	rgn_dettach_node
	mov	r6, r0
	cbz	r0, .L276
	ldr	r3, [r4, #1140]	@ unaligned
	movs	r1, #2
	ldr	r2, .L281+12
	movs	r0, #3
	str	r3, [sp, #16]
	ldr	r3, [r4, #1136]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #1132]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #770
	str	r3, [sp]
	ldr	r3, .L281+4
	bl	vlog
.L276:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #28]
	subs	r3, r3, #1
	str	r3, [r5, #28]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r5, #28]
	movs	r2, #72
	movs	r1, #0
	mla	r0, r2, r0, r5
	addw	r0, r0, #1084
	bl	memset
	ldr	r2, [r5, #28]
	movs	r3, #12
	movs	r0, #3
	muls	r3, r2, r3
	movs	r2, #0
	addw	r3, r3, #1660
	adds	r1, r5, r3
	str	r2, [r5, r3]	@ unaligned
	str	r2, [r1, #4]	@ unaligned
	str	r2, [r1, #8]	@ unaligned
	movs	r1, #4
	ldr	r3, [r4, #1140]	@ unaligned
	ldr	r2, .L281+16
	str	r3, [sp, #16]
	ldr	r3, [r4, #1136]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #1132]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #778
	str	r3, [sp]
	ldr	r3, .L281+4
	bl	vlog
.L272:
	mov	r0, r6
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L282:
	.align	2
.L281:
	.word	.LC23
	.word	.LANCHOR0+455
	.word	.LC43
	.word	.LC44
	.word	.LC45
	.fnend
	.size	vrgn_dettach_chn, .-vrgn_dettach_chn
	.align	1
	.global	update_canvas_to_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	update_canvas_to_node, %function
update_canvas_to_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r4, r0
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r0, #8]	@ unaligned
	bl	list_rgn_find_by_handle
	mov	r7, r0
	cbnz	r0, .L284
.L299:
	mov	r5, #-1
	b	.L283
.L284:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #0
	beq	.L286
	ldr	r0, [r4, #16]	@ unaligned
	bl	get_mpi_buf
	mov	r6, r0
	cbnz	r0, .L287
	ldr	r3, [r4, #16]	@ unaligned
	movs	r1, #2
	ldr	r2, .L300
	movs	r0, #3
	str	r3, [sp, #4]
	movw	r3, #522
	str	r3, [sp]
	ldr	r3, .L300+4
	bl	vlog
	b	.L299
.L287:
	ldr	r3, [r0, #44]
	cbnz	r3, .L288
	mov	r3, #528
	ldr	r2, .L300+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L300+4
	movs	r0, #3
	bl	vlog
.L288:
	ldr	r3, [r7, #1756]
	cmp	r3, r6
	bne	.L289
	ldr	r3, [r7, #48]
	cmp	r3, #1
	bls	.L289
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L300+12
	movs	r0, #3
	str	r3, [sp, #4]
	mov	r3, #532
	str	r3, [sp]
	ldr	r3, .L300+4
	bl	vlog
.L289:
	movs	r2, #80
	add	r1, r4, #104
	add	r0, r6, #664
	bl	memcpy
	str	r6, [r7, #1756]
	ldr	r3, [r6]
	movs	r1, #5
	ldr	r2, .L300+16
	movs	r0, #3
	str	r3, [sp, #4]
	mov	r3, #536
	str	r3, [sp]
	ldr	r3, .L300+4
	bl	vlog
	ldr	r5, [r7, #1764]
	cmp	r5, #0
	bne	.L292
	ldr	r3, [r6, #480]
	str	r3, [r7, #1764]
.L283:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L286:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #0
	beq	.L299
	ldr	r1, [r4, #24]	@ unaligned
	ldr	r2, [r4, #28]	@ unaligned
	ldr	r0, [r4, #20]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r1, r0
	cbnz	r0, .L291
	ldr	r3, [r4, #28]	@ unaligned
	movs	r1, #2
	ldr	r2, .L300+20
	movs	r0, #3
	str	r3, [sp, #12]
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #544
	str	r3, [sp]
	ldr	r3, .L300+4
	bl	vlog
	b	.L299
.L291:
	ldr	r0, [r4, #8]	@ unaligned
	bl	get_list_node_rgn_from_node
	mov	r6, r0
	cmp	r0, #0
	beq	.L299
	movw	r3, #549
	ldr	r2, .L300+24
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L300+4
	movs	r0, #3
	bl	vlog
	movs	r2, #72
	add	r1, r4, #32
	add	r0, r6, #20
	bl	memcpy
	b	.L283
.L292:
	movs	r5, #0
	b	.L283
.L301:
	.align	2
.L300:
	.word	.LC46
	.word	.LANCHOR0+472
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.word	.LC39
	.word	.LC50
	.fnend
	.size	update_canvas_to_node, .-update_canvas_to_node
	.align	1
	.global	vrgn_update_canvas_to_chns
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_update_canvas_to_chns, %function
vrgn_update_canvas_to_chns:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #184
	beq	.L303
	mov	r3, #788
	ldr	r2, .L308
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L308+4
	movs	r0, #3
	bl	vlog
	mov	r4, #-1
.L302:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L303:
	mov	r0, r1
	bl	update_canvas_to_node
	mov	r4, r0
	cmp	r0, #0
	beq	.L302
	ldr	r3, [r5, #8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L308+8
	movs	r0, #3
	str	r3, [sp, #4]
	movw	r3, #794
	str	r3, [sp]
	ldr	r3, .L308+4
	bl	vlog
	b	.L302
.L309:
	.align	2
.L308:
	.word	.LC29
	.word	.LANCHOR0+494
	.word	.LC51
	.fnend
	.size	vrgn_update_canvas_to_chns, .-vrgn_update_canvas_to_chns
	.align	1
	.global	vrgn_attach_to_rga_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_attach_to_rga_node, %function
vrgn_attach_to_rga_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r10, r0
	ldr	r3, .L321
	mov	r8, r1
	mov	r4, r2
	movs	r0, #0
	mov	r9, r3
.L314:
	ldr	r6, [r3, #184]
	cbnz	r6, .L311
	movs	r2, #92
	mov	r1, r6
	mul	r5, r2, r0
	add	r7, r5, #184
	add	r7, r7, r9
	mov	r0, r7
	bl	memset
	add	r3, r9, r5
	add	r0, r5, #204
	movs	r2, #1
	str	r10, [r3, #196]
	addw	r1, r8, #1060
	str	r2, [r3, #184]
	add	r0, r0, r9
	str	r4, [r10, #1760]
	movs	r2, #72
	bl	memcpy
	ldr	r3, [r4, #144]
	add	r0, r4, #120
	cbz	r3, .L312
.L313:
	cbnz	r0, .L316
	ldr	r3, [r8, #1140]	@ unaligned
	movs	r1, #2
	ldr	r2, .L321+4
	movs	r0, #3
	str	r3, [sp, #12]
	ldr	r3, [r8, #1136]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r8, #1132]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #654
	str	r3, [sp]
	ldr	r3, .L321+8
	bl	vlog
.L320:
	mov	r6, #-1
	b	.L310
.L311:
	adds	r0, r0, #1
	adds	r3, r3, #92
	cmp	r0, #64
	bne	.L314
	movw	r3, #643
	ldr	r2, .L321+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L321+8
	movs	r0, #3
	bl	vlog
	b	.L320
.L312:
	add	r3, r4, #128
	str	r0, [r4, #120]
	str	r0, [r4, #124]
	str	r3, [r4, #128]
	str	r3, [r4, #132]
	b	.L313
.L316:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r1, r7
	bl	push_list.constprop.9
	ldr	r3, [r4, #144]
	adds	r3, r3, #1
	str	r3, [r4, #144]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L310:
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L322:
	.align	2
.L321:
	.word	g_vrgn_dev
	.word	.LC52
	.word	.LANCHOR0+521
	.word	.LC53
	.fnend
	.size	vrgn_attach_to_rga_node, .-vrgn_attach_to_rga_node
	.align	1
	.global	vrgn_attach_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_attach_chn, %function
vrgn_attach_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #28
	sub	sp, sp, #28
	ldr	r0, [r1]	@ unaligned
	mov	r4, r1
	bl	list_rgn_find_by_handle
	mov	r5, r0
	cbz	r0, .L345
	ldr	r3, [r0, #28]
	cbz	r3, .L325
	ldr	r3, [r0, #48]
	cmp	r3, #1
	bne	.L325
	ldr	r3, [r0, #24]
	movs	r1, #2
	ldr	r2, .L347
	movs	r0, #3
	str	r3, [sp, #4]
	movw	r3, #681
	str	r3, [sp]
	ldr	r3, .L347+4
	bl	vlog
.L345:
	mov	r6, #-1
	b	.L323
.L325:
	ldr	r2, [r4, #1056]	@ unaligned
	movw	r3, #1164
	cmp	r2, r3
	beq	.L326
	movw	r3, #686
	ldr	r2, .L347+8
	str	r3, [sp]
	ldr	r3, .L347+4
.L346:
	movs	r1, #2
	movs	r0, #3
	bl	vlog
	b	.L345
.L326:
	ldr	r3, .L347+12
	mov	r8, #0
	mov	r9, r3
.L330:
	ldr	r7, [r3, #184]
	cmp	r7, #0
	bne	.L327
	movs	r2, #92
	mov	r1, r7
	mul	fp, r2, r8
	addw	r10, r4, #1060
	add	r6, fp, #184
	add	r6, r6, r9
	mov	r0, r6
	bl	memset
	add	r3, r9, fp
	add	r0, fp, #204
	movs	r2, #1
	str	r5, [r3, #196]
	mov	r1, r10
	str	r2, [r3, #184]
	add	r0, r0, r9
	movs	r2, #72
	bl	memcpy
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #1
	beq	.L328
.L329:
	movs	r3, #92
	mla	r3, r3, r8, r9
	ldr	r3, [r3, #272]
	cbz	r3, .L333
	mov	r0, r6
	bl	set_osd_invert_buffer
.L333:
	mov	r0, r6
	mov	r2, r7
	mov	r1, r4
	bl	rgn_attach_node
	mov	r6, r0
	cmp	r0, #0
	beq	.L334
	ldr	r3, [r4, #1140]	@ unaligned
	movs	r1, #2
	ldr	r2, .L347+16
	movs	r0, #3
	str	r3, [sp, #16]
	ldr	r3, [r4, #1136]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #1132]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #724
	str	r3, [sp]
	ldr	r3, .L347+4
	bl	vlog
	movs	r3, #92
	mla	r3, r3, r8, r9
	movs	r2, #0
	str	r2, [r3, #184]
	b	.L345
.L327:
	add	r8, r8, #1
	adds	r3, r3, #92
	cmp	r8, #64
	bne	.L330
	movw	r3, #698
	ldr	r2, .L347+20
	str	r3, [sp]
	ldr	r3, .L347+4
	b	.L346
.L328:
	ldr	r2, [r4, #1160]	@ unaligned
	ldr	r1, [r4, #1156]	@ unaligned
	ldr	r0, [r4, #1152]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L332
	ldr	r3, [r4, #1160]	@ unaligned
	movs	r1, #2
	ldr	r2, .L347+24
	movs	r0, #3
	str	r3, [sp, #12]
	ldr	r3, [r4, #1156]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4, #1152]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #709
	str	r3, [sp]
	ldr	r3, .L347+4
	bl	vlog
	b	.L345
.L332:
	ldr	r3, [r0, #372]
	cmp	r3, #0
	bne	.L329
	movs	r1, #3
	bl	mpi_node_add_out_filter
	ldr	r3, .L347+28
	str	r3, [r7, #372]
	b	.L329
.L334:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #1
	bne	.L335
	mov	r2, r7
	mov	r1, r4
	mov	r0, r5
	bl	vrgn_attach_to_rga_node
	subs	r6, r0, #0
	bge	.L335
	movw	r3, #731
	ldr	r2, .L347+32
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L347+4
	movs	r0, #3
	bl	vlog
.L323:
	mov	r0, r6
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L335:
	ldr	r0, [r5, #28]
	movs	r2, #72
	mov	r1, r10
	mla	r0, r2, r0, r5
	addw	r0, r0, #1084
	bl	memcpy
	ldr	r2, [r5, #28]
	movs	r3, #12
	muls	r3, r2, r3
	ldr	r2, [r4, #1132]	@ unaligned
	addw	r3, r3, #1660
	adds	r0, r5, r3
	str	r2, [r5, r3]	@ unaligned
	ldr	r2, [r4, #1136]	@ unaligned
	str	r2, [r0, #4]	@ unaligned
	ldr	r2, [r4, #1140]	@ unaligned
	str	r2, [r0, #8]	@ unaligned
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #28]
	adds	r3, r3, #1
	str	r3, [r5, #28]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #1140]	@ unaligned
	movs	r1, #4
	ldr	r2, .L347+36
	movs	r0, #3
	str	r3, [sp, #16]
	ldr	r3, [r4, #1136]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #1132]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #742
	str	r3, [sp]
	ldr	r3, .L347+4
	bl	vlog
	b	.L323
.L348:
	.align	2
.L347:
	.word	.LC54
	.word	.LANCHOR0+545
	.word	.LC23
	.word	g_vrgn_dev
	.word	.LC56
	.word	.LC53
	.word	.LC55
	.word	rga_filter_done_callback
	.word	.LC57
	.word	.LC58
	.fnend
	.size	vrgn_attach_chn, .-vrgn_attach_chn
	.align	1
	.global	vrgn_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_probe, %function
vrgn_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movw	r2, #6072
	ldr	r4, .L351
	mov	r5, r0
	movs	r1, #0
	ldr	r7, .L351+4
	add	r6, r4, #168
	mov	r0, r4
	bl	memset
	add	r0, r4, #164
	bl	rkos_mutex_init
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	mov	r2, r5
	movs	r1, #8
	movs	r5, #0
	movs	r3, #9
	str	r4, [r4, #140]
	str	r3, [r4, #160]
	str	r7, [r4, #156]
	str	r0, [r4]
	adds	r0, r4, #4
	bl	mpi_dev_register
	mov	r1, r5
	add	r0, r4, #144
	add	r3, r4, #176
	str	r5, [r4, #108]
	str	r3, [r4, #180]
	strd	r5, r5, [r4, #116]
	str	r6, [r4, #168]
	str	r6, [r4, #172]
	str	r3, [r4, #176]
	bl	rkos_sema_init
	mov	r2, r5
	add	r1, r7, #180
	adds	r0, r4, #4
	bl	mpi_sysfs_dev_add
	ldr	r3, .L351+8
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L351+12
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L350
	bl	wake_up_process
.L350:
	str	r5, [r4, #148]
	pop	{r3, r4, r5, r6, r7, pc}
.L352:
	.align	2
.L351:
	.word	g_vrgn_dev
	.word	.LANCHOR0+564
	.word	.LC59
	.word	vrgn_thread_fn
	.fnend
	.size	vrgn_probe, .-vrgn_probe
	.align	1
	.global	vrgn_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_shutdown, %function
vrgn_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L362
	str	r3, [r4, #152]
	ldr	r3, [r4, #148]
	cbz	r3, .L354
	add	r0, r4, #144
	bl	rkos_up
	ldr	r0, [r4, #148]
	bl	kthread_stop
	movs	r3, #0
	str	r3, [r4, #148]
.L354:
	ldr	r4, .L362+4
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-4]
	cbz	r0, .L355
	bl	kfree
	movs	r3, #0
	str	r3, [r4, #-4]
.L355:
	ldr	r0, .L362+8
	bl	rkos_mutex_destory
	ldr	r0, .L362+12
	pop	{r4, lr}
	b	rkos_sema_destory
.L363:
	.align	2
.L362:
	.word	g_vrgn_dev
	.word	g_vrgn_dev+4
	.word	g_vrgn_dev+164
	.word	g_vrgn_dev+144
	.fnend
	.size	vrgn_shutdown, .-vrgn_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vrgn_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_init, %function
vrgn_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L365
	bl	vrgn_probe
	movs	r0, #0
	pop	{r3, pc}
.L366:
	.align	2
.L365:
	.word	.LC59
	.fnend
	.size	vrgn_init, .-vrgn_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vrgn_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrgn_exit, %function
vrgn_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vrgn_shutdown
	.fnend
	.size	vrgn_exit, .-vrgn_exit
	.global	g_vrgn_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36438, %object
	.size	__func__.36438, 21
__func__.36438:
	.ascii	"node_delete_callback\000"
	.type	__func__.36352, %object
	.size	__func__.36352, 29
__func__.36352:
	.ascii	"filter_osd_get_buff_callback\000"
	.type	__func__.36339, %object
	.size	__func__.36339, 25
__func__.36339:
	.ascii	"rga_filter_done_callback\000"
	.type	__func__.36304, %object
	.size	__func__.36304, 15
__func__.36304:
	.ascii	"vrgn_thread_fn\000"
	.type	__func__.36782, %object
	.size	__func__.36782, 13
__func__.36782:
	.ascii	"vrgn_release\000"
	.type	__func__.36738, %object
	.size	__func__.36738, 11
__func__.36738:
	.ascii	"vrgn_ioctl\000"
	.space	2
	.type	tp, %object
	.size	tp, 40
tp:
	.word	0
	.word	.LC69
	.word	1
	.word	.LC70
	.word	2
	.word	.LC71
	.word	3
	.word	.LC72
	.word	4
	.word	.LC73
	.type	fmt, %object
	.size	fmt, 112
fmt:
	.word	65552
	.word	.LC74
	.word	65553
	.word	.LC75
	.word	65554
	.word	.LC74
	.word	65555
	.word	.LC74
	.word	65548
	.word	.LC76
	.word	65549
	.word	.LC77
	.word	65558
	.word	.LC76
	.word	65559
	.word	.LC76
	.word	65546
	.word	.LC78
	.word	65547
	.word	.LC79
	.word	65557
	.word	.LC80
	.word	65556
	.word	.LC80
	.word	131072
	.word	.LC81
	.word	131074
	.word	.LC82
	.type	__func__.36616, %object
	.size	__func__.36616, 13
__func__.36616:
	.ascii	"vrgn_version\000"
	.type	__func__.36760, %object
	.size	__func__.36760, 10
__func__.36760:
	.ascii	"vrgn_open\000"
	.type	__func__.36624, %object
	.size	__func__.36624, 12
__func__.36624:
	.ascii	"vrgn_create\000"
	.type	__func__.36695, %object
	.size	__func__.36695, 13
__func__.36695:
	.ascii	"vrgn_destroy\000"
	.type	__func__.36703, %object
	.size	__func__.36703, 23
__func__.36703:
	.ascii	"vrgn_upate_canvas_sync\000"
	.type	__func__.36716, %object
	.size	__func__.36716, 15
__func__.36716:
	.ascii	"vrgn_info_sync\000"
	.type	__func__.36724, %object
	.size	__func__.36724, 20
__func__.36724:
	.ascii	"vrgn_request_buffer\000"
	.type	__func__.36473, %object
	.size	__func__.36473, 22
__func__.36473:
	.ascii	"set_osd_invert_buffer\000"
	.type	__func__.36562, %object
	.size	__func__.36562, 16
__func__.36562:
	.ascii	"rgn_attach_node\000"
	.type	__func__.36576, %object
	.size	__func__.36576, 26
__func__.36576:
	.ascii	"rgn_dettach_from_rga_node\000"
	.type	__func__.36590, %object
	.size	__func__.36590, 17
__func__.36590:
	.ascii	"rgn_dettach_node\000"
	.type	__func__.36675, %object
	.size	__func__.36675, 17
__func__.36675:
	.ascii	"vrgn_dettach_chn\000"
	.type	__func__.36604, %object
	.size	__func__.36604, 22
__func__.36604:
	.ascii	"update_canvas_to_node\000"
	.type	__func__.36688, %object
	.size	__func__.36688, 27
__func__.36688:
	.ascii	"vrgn_update_canvas_to_chns\000"
	.type	__func__.36639, %object
	.size	__func__.36639, 24
__func__.36639:
	.ascii	"vrgn_attach_to_rga_node\000"
	.type	__func__.36657, %object
	.size	__func__.36657, 16
__func__.36657:
	.ascii	"vrgn_attach_chn\000"
	.space	3
	.type	vrgn_ioctls, %object
	.size	vrgn_ioctls, 180
vrgn_ioctls:
	.word	-1065587200
	.word	0
	.word	vrgn_version
	.word	.LC60
	.word	0
	.word	-997429759
	.word	0
	.word	vrgn_create
	.word	.LC61
	.word	0
	.word	-997429758
	.word	0
	.word	vrgn_destroy
	.word	.LC62
	.word	0
	.word	-997429757
	.word	0
	.word	vrgn_attach_chn
	.word	.LC63
	.word	0
	.word	-997429756
	.word	0
	.word	vrgn_dettach_chn
	.word	.LC64
	.word	0
	.word	-1061655035
	.word	0
	.word	vrgn_update_canvas_to_chns
	.word	.LC65
	.word	0
	.word	-1061655034
	.word	0
	.word	vrgn_upate_canvas_sync
	.word	.LC66
	.word	0
	.word	-915902969
	.word	0
	.word	vrgn_info_sync
	.word	.LC67
	.word	0
	.word	-1067422200
	.word	0
	.word	vrgn_request_buffer
	.word	.LC68
	.word	0
	.type	vrgn_driver_fops, %object
	.size	vrgn_driver_fops, 128
vrgn_driver_fops:
	.word	0
	.space	4
	.word	vrgn_read
	.space	24
	.word	0
	.word	vrgn_ioctl
	.word	vrgn_compat_ioctl
	.word	0
	.space	4
	.word	vrgn_open
	.space	4
	.word	vrgn_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__key.13574, %object
	.size	__key.13574, 0
__key.13574:
	.type	g_vrgn_dev, %object
	.size	g_vrgn_dev, 6072
g_vrgn_dev:
	.space	6072
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;32mrelease list_rgn handle = %d success\033["
	.ascii	"0m\000"
.LC1:
	.ascii	"node(%d) buf(%d)  node_ref(%d) buf_ref(%d)\000"
.LC2:
	.ascii	"put buf back src node , node_id:%d node_refcnt:%d b"
	.ascii	"uf_cnt:%d\000"
.LC3:
	.ascii	"dev_name%s ctx(%p) ready for node(%d) buf(%d)\012\000"
.LC4:
	.ascii	"dev_id(%d)\000"
.LC5:
	.ascii	"vrgn_ioctl: nr = %d, index = %d dev = %p\000"
.LC6:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC7:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC8:
	.ascii	"-1\000"
.LC9:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC10:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC11:
	.ascii	"-2024-10-16-16:52:39\000"
.LC12:
	.ascii	"*****************************************rgn list**"
	.ascii	"*********************************************\012\000"
.LC13:
	.ascii	"handle---type------width---height---format----buf_i"
	.ascii	"d---refcnt---channel_num---------------------\012\000"
.LC14:
	.ascii	"%-#8d %-#9s %-#7d %-#8d %-#9s %-#8d %-#8d \000"
.LC15:
	.ascii	"****************************************node_rgn li"
	.ascii	"st*******************************************\012\000"
.LC16:
	.ascii	"id---name-------h-x---y---h-x---y---h-x---y---h-x--"
	.ascii	"-y---h-x---y---h-x---y---h-x---y---h-x---y---\012\000"
.LC17:
	.ascii	"%-#8d \000"
.LC18:
	.ascii	"\012\000"
.LC19:
	.ascii	"%-#4d %-#10s \000"
.LC20:
	.ascii	"%-#1d %-#3d %-#4d\000"
.LC21:
	.ascii	"\033[1;31mstruct vrgn_version mismatching\033[0m\000"
.LC22:
	.ascii	"\033[1;31mvrgn open fail\033[0m\000"
.LC23:
	.ascii	"\033[1;31mstruct vrgn_info mismatching\033[0m\000"
.LC24:
	.ascii	"\033[1;32mrgn handle = %d reduce osd size success\033"
	.ascii	"[0m\000"
.LC25:
	.ascii	"\033[1;31mcalloc for list_rgn failure\033[0m\000"
.LC26:
	.ascii	"&x->wait\000"
.LC27:
	.ascii	"\033[1;32mrgn handle = %d create success\033[0m\000"
.LC28:
	.ascii	"\033[1;32mdestroy rgn handle = %d, delete list_rgn "
	.ascii	"handle = %d success\033[0m\000"
.LC29:
	.ascii	"\033[1;31mstruct canvas_info mismatching\033[0m\000"
.LC30:
	.ascii	"\033[1;31mrgn handle = %d not find list_rgn\033[0m\000"
.LC31:
	.ascii	"\033[1;31mstruct sync_info mismatching\033[0m\000"
.LC32:
	.ascii	"\033[1;32mthere is not have rgn_handle:%d sync info"
	.ascii	"mation\033[0m\000"
.LC33:
	.ascii	"\033[1;31mstruct buffer_info mismatching\033[0m\000"
.LC34:
	.ascii	"\033[1;31mrequest buffer from buffer pool(%d)\033[0"
	.ascii	"m\000"
.LC35:
	.ascii	"valloc\000"
.LC36:
	.ascii	"vrgn_invert\000"
.LC37:
	.ascii	"\033[1;32minvert buffer(id:%d, size: %d, dma: %p, c"
	.ascii	"nt: %ld) alloc success!\033[0m\000"
.LC38:
	.ascii	"\033[1;31minvert buffer alloc failed!\033[0m\000"
.LC39:
	.ascii	"\033[1;31mget node [%d %d %d] fail\033[0m\000"
.LC40:
	.ascii	"\033[1;31mfailed: vsys_get_node_from_map mod:%d, de"
	.ascii	"v:%d chn:%d\033[0m\000"
.LC41:
	.ascii	"\033[1;31mnode [%d %d %d] is not has osd!\033[0m\000"
.LC42:
	.ascii	"unref list_node_rgn\000"
.LC43:
	.ascii	"\033[1;31mrgn handle = %d has dettach from node!\033"
	.ascii	"[0m\000"
.LC44:
	.ascii	"\033[1;31mrgn handle = %d dettach node [%d %d %d] f"
	.ascii	"ail\033[0m\000"
.LC45:
	.ascii	"\033[1;32mrgn handle = %d dettach from [%d, %d, %d]"
	.ascii	" success\033[0m\000"
.LC46:
	.ascii	"\033[1;31mfd:%d get mpi_buf failure\033[0m\000"
.LC47:
	.ascii	"\033[1;31mmpi_buf refcnt err\033[0m\000"
.LC48:
	.ascii	"\033[1;31mrgn handle = %d update frame error\033[0m"
	.ascii	"\000"
.LC49:
	.ascii	"mpi_buf(%d)\000"
.LC50:
	.ascii	"update list_node_rgn chn attr success\000"
.LC51:
	.ascii	"\033[1;31mrgn handle = %d update canvas to node fai"
	.ascii	"l\033[0m\000"
.LC52:
	.ascii	"\033[1;31mget rgn node info frome node [%d %d %d] f"
	.ascii	"ail\033[0m\000"
.LC53:
	.ascii	"\033[1;31mget list node rgn fail\033[0m\000"
.LC54:
	.ascii	"\033[1;31mwhen canvasNum is 1, rgn handle = %d has "
	.ascii	"attach one node!\033[0m\000"
.LC55:
	.ascii	"\033[1;31mvrgn get node fail mod:%d dev:%d chn:%d\033"
	.ascii	"[0m\000"
.LC56:
	.ascii	"\033[1;31mrgn handle = %d attach node [%d %d %d] fa"
	.ascii	"il\033[0m\000"
.LC57:
	.ascii	"\033[1;31mfailed: vrgn_attach_to_rga_node\033[0m\000"
.LC58:
	.ascii	"\033[1;32mrgn handle = %d attach node [%d %d %d] su"
	.ascii	"ccess\033[0m\000"
.LC59:
	.ascii	"vrgn\000"
.LC60:
	.ascii	"VRGN_IOCTL_VERSION\000"
.LC61:
	.ascii	"VRGN_IOCTL_CREATE\000"
.LC62:
	.ascii	"VRGN_IOCTL_DESTORY\000"
.LC63:
	.ascii	"VRGN_IOCTL_ATTACH_CH\000"
.LC64:
	.ascii	"VRGN_IOCTL_DETTACH_CH\000"
.LC65:
	.ascii	"VRGN_IOCTL_UPDATE_CANVAS\000"
.LC66:
	.ascii	"VRGN_IOCTL_UPDATE_SYNC\000"
.LC67:
	.ascii	"VRGN_IOCTL_INFO_SYNC\000"
.LC68:
	.ascii	"VRGN_IOCTL_REQUEST_BUFFER\000"
.LC69:
	.ascii	"OVERLAY\000"
.LC70:
	.ascii	"OVERLAY_EX\000"
.LC71:
	.ascii	"COVER\000"
.LC72:
	.ascii	"MOSAIC\000"
.LC73:
	.ascii	"LINE\000"
.LC74:
	.ascii	"ARGB8888\000"
.LC75:
	.ascii	"ABGR8888\000"
.LC76:
	.ascii	"ARGB4444\000"
.LC77:
	.ascii	"ABGR4444\000"
.LC78:
	.ascii	"ARGB1555\000"
.LC79:
	.ascii	"ABGR1555\000"
.LC80:
	.ascii	"ARGB5551\000"
.LC81:
	.ascii	"2BPP\000"
.LC82:
	.ascii	"1BPP\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
