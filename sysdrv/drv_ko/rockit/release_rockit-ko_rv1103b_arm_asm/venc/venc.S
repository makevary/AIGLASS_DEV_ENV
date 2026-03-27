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
	.file	"venc.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vcodec_get_chnl_ctx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_ctx, %function
vcodec_get_chnl_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #316]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_ctx, .-vcodec_get_chnl_ctx
	.align	1
	.global	vcodec_get_chnl_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_id, %function
vcodec_get_chnl_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #92]
	bx	lr
	.fnend
	.size	vcodec_get_chnl_id, .-vcodec_get_chnl_id
	.align	1
	.global	vcodec_get_chnl_type
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_get_chnl_type, %function
vcodec_get_chnl_type:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #1
	bx	lr
	.fnend
	.size	vcodec_get_chnl_type, .-vcodec_get_chnl_type
	.align	1
	.global	vcodec_mpidev_struct_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_mpidev_struct_size, %function
vcodec_mpidev_struct_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #40
	bx	lr
	.fnend
	.size	vcodec_mpidev_struct_size, .-vcodec_mpidev_struct_size
	.align	1
	.global	mpi_buf_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_map, %function
mpi_buf_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0, #656]
	bx	lr
	.fnend
	.size	mpi_buf_map, .-mpi_buf_map
	.align	1
	.global	mpi_buf_unmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unmap, %function
mpi_buf_unmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpi_buf_unmap, .-mpi_buf_unmap
	.align	1
	.global	mpi_buf_get_dmabuf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_dmabuf, %function
mpi_buf_get_dmabuf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L8
	ldr	r0, [r0, #484]
.L8:
	bx	lr
	.fnend
	.size	mpi_buf_get_dmabuf, .-mpi_buf_get_dmabuf
	.align	1
	.global	mpi_buffer_queue_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_size, %function
mpi_buffer_queue_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #380]
	bx	lr
.L14:
	.align	2
.L13:
	.word	g_venc_dev
	.fnend
	.size	mpi_buffer_queue_size, .-mpi_buffer_queue_size
	.align	1
	.global	mpi_buffer_pool_get_free_num
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_get_free_num, %function
mpi_buffer_pool_get_free_num:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L16
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L17
.L16:
	movs	r0, #1
	bx	lr
.L17:
	ldr	r0, [r0, #108]
	bx	lr
	.fnend
	.size	mpi_buffer_pool_get_free_num, .-mpi_buffer_pool_get_free_num
	.align	1
	.global	vcodec_mpibuf_struct_size
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_mpibuf_struct_size, %function
vcodec_mpibuf_struct_size:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #80
	bx	lr
	.fnend
	.size	vcodec_mpibuf_struct_size, .-vcodec_mpibuf_struct_size
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_compat_ioctl, %function
venc_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	venc_compat_ioctl, .-venc_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_poll, %function
venc_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, r1
	ldr	r3, [r0, #128]
	ldr	r1, [r3]
	cmp	r1, #21
	beq	.L25
.L28:
	movs	r0, #0
.L24:
	pop	{r4, r5, r6, pc}
.L25:
	ldr	r4, [r3, #8]
	ldr	r5, .L38
	cbz	r2, .L27
	ldr	r6, [r2]
	cbz	r6, .L27
	mov	r3, #1056
	mla	r3, r3, r4, r5
	addw	r1, r3, #3564
	blx	r6
.L27:
	mov	r3, #1056
	mla	r4, r3, r4, r5
	ldr	r3, [r4, #2584]
	cmp	r3, #0
	beq	.L28
	movs	r0, #65
	b	.L24
.L39:
	.align	2
.L38:
	.word	g_venc_dev
	.fnend
	.size	venc_poll, .-venc_poll
	.align	1
	.global	venc_node_pp_get_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_md_attr, %function
venc_node_pp_get_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #36
	beq	.L41
	movw	r3, #2265
	ldr	r2, .L50
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L50+4
	movs	r0, #4
	bl	vlog
.L49:
	mov	r0, #-1
.L40:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L41:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #7
	ble	.L43
	movs	r3, #8
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2270
	ldr	r2, .L50+8
	str	r3, [sp]
	ldr	r3, .L50+4
	bl	vlog
	b	.L49
.L43:
	ldr	r0, .L50+12
	mov	r4, #1056
	mla	r4, r4, r2, r0
	ldr	r3, [r4, #3416]
	cmp	r3, #0
	ble	.L44
	ldr	r3, [r4, #3412]
	cmp	r3, #0
	ble	.L44
	str	r3, [r1, #8]	@ unaligned
	ldr	r3, [r4, #3416]
	str	r3, [r1, #12]	@ unaligned
.L45:
	mov	r3, #1056
	mla	r3, r3, r2, r0
	movs	r0, #0
	ldr	r2, [r3, #3420]
	str	r2, [r1, #16]	@ unaligned
	ldr	r2, [r3, #3424]
	str	r2, [r1, #20]	@ unaligned
	ldr	r2, [r3, #3428]
	str	r2, [r1, #24]	@ unaligned
	ldr	r2, [r3, #3432]
	str	r2, [r1, #28]	@ unaligned
	ldr	r3, [r3, #3436]
	str	r3, [r1, #32]	@ unaligned
	b	.L40
.L44:
	mov	r3, #1056
	mla	r3, r3, r2, r0
	ldr	r4, [r3, #2700]
	movs	r3, #0
	cmp	r4, #1
	bne	.L46
	movs	r4, #70
	strb	r4, [r1, #8]
	movs	r4, #3
	strb	r3, [r1, #9]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
.L48:
	strb	r4, [r1, #12]
	strb	r3, [r1, #13]
	strb	r3, [r1, #14]
	strb	r3, [r1, #15]
	b	.L45
.L46:
	cmp	r4, #2
	bne	.L47
	movs	r5, #50
	strb	r3, [r1, #9]
	strb	r5, [r1, #8]
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L48
.L47:
	movs	r4, #30
	strb	r3, [r1, #9]
	strb	r4, [r1, #8]
	movs	r4, #1
	strb	r3, [r1, #10]
	strb	r3, [r1, #11]
	b	.L48
.L51:
	.align	2
.L50:
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.word	g_venc_dev
	.fnend
	.size	venc_node_pp_get_md_attr, .-venc_node_pp_get_md_attr
	.align	1
	.global	venc_node_enable_tb
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_enable_tb, %function
venc_node_enable_tb:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r2, [r1]
	cmp	r2, #15
	ble	.L53
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2343
	ldr	r2, .L55
	str	r3, [sp]
	ldr	r3, .L55+4
	bl	vlog
	mov	r0, #-1
.L52:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L53:
	ldr	r3, .L55+8
	movs	r1, #1
	movs	r0, #0
	add	r3, r3, r2
	movw	r2, #10964
	strb	r1, [r3, r2]
	b	.L52
.L56:
	.align	2
.L55:
	.word	.LC1
	.word	.LANCHOR0+25
	.word	g_venc_dev
	.fnend
	.size	venc_node_enable_tb, .-venc_node_enable_tb
	.align	1
	.global	venc_node_tb_bind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_bind, %function
venc_node_tb_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r0, [r1]	@ unaligned
	ldr	r2, [r1, #4]	@ unaligned
	cmp	r0, #15
	bgt	.L58
	cmp	r2, #15
	ble	.L59
.L58:
	movs	r3, #16
	str	r0, [sp, #4]
	strd	r2, r3, [sp, #8]
	movs	r1, #2
	movw	r3, #2358
	ldr	r2, .L61
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L61+4
	bl	vlog
	mov	r0, #-1
.L57:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L59:
	ldr	r3, .L61+8
	movw	r1, #10980
	add	r3, r3, r0
	movs	r0, #0
	strb	r2, [r3, r1]
	b	.L57
.L62:
	.align	2
.L61:
	.word	.LC2
	.word	.LANCHOR0+45
	.word	g_venc_dev
	.fnend
	.size	venc_node_tb_bind, .-venc_node_tb_bind
	.align	1
	.global	venc_node_tb_request
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_tb_request, %function
venc_node_tb_request:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1]
	cmp	r3, #15
	ble	.L64
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #2372
	ldr	r2, .L66
	str	r3, [sp]
	ldr	r3, .L66+4
	bl	vlog
	mov	r0, #-1
.L63:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L64:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L66+8
	addw	r3, r3, #2748
	add	r3, r2, r3, lsl #2
	movs	r2, #1
	str	r2, [r3, #4]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L63
.L67:
	.align	2
.L66:
	.word	.LC1
	.word	.LANCHOR0+63
	.word	g_venc_dev
	.fnend
	.size	venc_node_tb_request, .-venc_node_tb_request
	.align	1
	.global	mpi_buf_ref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref, %function
mpi_buf_ref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	.save {r4, r5, r6}
	cbz	r0, .L68
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, .L74
	movs	r3, #0
	movs	r1, #12
.L72:
	mul	r2, r1, r3
	ldr	r6, [r2, r5]
	cmp	r6, r0
	bne	.L70
	ldr	r3, .L74+4
	movw	r1, #37692
	add	r3, r3, r2
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L71:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6}
	b	mpi_obj_ref
.L70:
	adds	r3, r3, #1
	cmp	r3, #512
	bne	.L72
	b	.L71
.L68:
	pop	{r4, r5, r6}
	bx	lr
.L75:
	.align	2
.L74:
	.word	g_venc_dev+37688
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref, .-mpi_buf_ref
	.align	1
	.global	mpi_buffer_queue_push
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_push, %function
mpi_buffer_queue_push:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpi_queue_push_obj
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_push, .-mpi_buffer_queue_push
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_venc_node, %function
get_venc_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #4
	b	vsys_get_node_from_map
	.fnend
	.size	get_venc_node, .-get_venc_node
	.align	1
	.global	venc_node_set_framerate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_framerate, %function
venc_node_set_framerate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #16
	beq	.L79
	movw	r3, #1963
	ldr	r2, .L85
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L85+4
	movs	r0, #4
	bl	vlog
.L84:
	mov	r0, #-1
.L78:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L79:
	ldr	r5, [r1]	@ unaligned
	cmp	r5, #15
	ble	.L81
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	mov	r3, #1968
	ldr	r2, .L85+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L85+4
	bl	vlog
	b	.L84
.L81:
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #0
	bgt	.L82
.L83:
	movs	r0, #0
	b	.L78
.L82:
	ldr	r2, [r1, #12]	@ unaligned
	cmp	r2, #0
	ble	.L83
	ldr	r6, .L85+12
	add	r2, r6, r5, lsl #2
	str	r3, [r2, #188]
	ldr	r2, [r1, #12]	@ unaligned
	add	r1, r6, r5, lsl #2
	str	r2, [r1, #252]
	movs	r1, #4
	strd	r3, r2, [sp, #8]
	mov	r0, r1
	movw	r3, #1974
	ldr	r2, .L85+16
	str	r3, [sp]
	str	r5, [sp, #4]
	ldr	r3, .L85+4
	bl	vlog
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r3, [r4, #12]	@ unaligned
	cmp	r2, r3
	bge	.L83
	mov	r0, r5
	bl	get_venc_node
	cmp	r0, #0
	bne	.L83
	ldr	r3, [r4, #12]	@ unaligned
	add	r5, r6, r5, lsl #2
	ldr	r2, [r4, #8]	@ unaligned
	adds	r3, r3, #1
	subs	r3, r3, r2
	str	r3, [r5, #380]
	b	.L78
.L86:
	.align	2
.L85:
	.word	.LC3
	.word	.LANCHOR0+84
	.word	.LC1
	.word	g_venc_dev
	.word	.LC4
	.fnend
	.size	venc_node_set_framerate, .-venc_node_set_framerate
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_pp_node, %function
get_pp_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	movs	r1, #0
	movs	r0, #21
	b	vsys_get_node_from_map
	.fnend
	.size	get_pp_node, .-get_pp_node
	.align	1
	.global	vcodec_destory_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_destory_dev, %function
vcodec_destory_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L90
	bl	mpi_dev_unregister
	mov	r0, r4
	bl	kfree
	movs	r0, #0
.L88:
	pop	{r4, pc}
.L90:
	mov	r0, #-1
	b	.L88
	.fnend
	.size	vcodec_destory_dev, .-vcodec_destory_dev
	.align	1
	.global	venc_node_set_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_vcodec_attr, %function
venc_node_set_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r2, [r1, #8]
	cmp	r2, #15
	bls	.L92
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1894
	ldr	r2, .L96
	str	r3, [sp]
	ldr	r3, .L96+4
	bl	vlog
	mov	r0, #-1
.L91:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L92:
	movs	r3, #60
	movw	r0, #36728
	mla	r0, r3, r2, r0
	ldr	r2, .L96+8
	add	r5, r1, #56
	mov	r3, r1
	add	r2, r2, r0
.L94:
	ldr	r0, [r3]	@ unaligned
	adds	r3, r3, #8
	ldr	r1, [r3, #-4]	@ unaligned
	cmp	r3, r5
	mov	r4, r2
	stmia	r4!, {r0, r1}
	mov	r2, r4
	bne	.L94
	ldr	r0, [r3]	@ unaligned
	str	r0, [r4]
	movs	r0, #0
	b	.L91
.L97:
	.align	2
.L96:
	.word	.LC1
	.word	.LANCHOR0+108
	.word	g_venc_dev
	.fnend
	.size	venc_node_set_vcodec_attr, .-venc_node_set_vcodec_attr
	.align	1
	.global	venc_node_get_vcodec_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_vcodec_attr, %function
venc_node_get_vcodec_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #8]
	cmp	r3, #15
	bls	.L99
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	movw	r3, #1906
	ldr	r2, .L103
	str	r3, [sp]
	ldr	r3, .L103+4
	bl	vlog
	mov	r0, #-1
.L98:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L99:
	movw	r2, #36728
	movs	r0, #60
	mla	r3, r0, r3, r2
	ldr	r2, .L103+8
	add	r3, r3, r2
	mov	r2, r1
	add	r5, r3, #56
.L101:
	mov	r4, r3
	adds	r2, r2, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, r5
	str	r0, [r2, #-8]	@ unaligned
	mov	r3, r4
	str	r1, [r2, #-4]	@ unaligned
	bne	.L101
	ldr	r0, [r4]
	str	r0, [r2]	@ unaligned
	movs	r0, #0
	b	.L98
.L104:
	.align	2
.L103:
	.word	.LC1
	.word	.LANCHOR0+134
	.word	g_venc_dev
	.fnend
	.size	venc_node_get_vcodec_attr, .-venc_node_get_vcodec_attr
	.align	1
	.global	mpi_buf_alloc_with_name
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_alloc_with_name, %function
mpi_buf_alloc_with_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #52
	sub	sp, sp, #52
	ldr	r4, .L110
	mov	r5, r0
	ldr	r0, .L110+4
	mov	r6, r1
	ldr	r3, [r4]
	str	r3, [sp, #44]
	bl	mpi_allocator_find_by_name
	mov	r2, r5
	movs	r1, #1
	bl	mpi_allocator_alloc
	mov	r7, r0
	cbz	r0, .L109
	movs	r1, #0
	bl	mpi_buf_create
	mov	r5, r0
	cbz	r0, .L107
	str	r6, [sp]
	adds	r6, r5, #4
	ldr	r3, .L110+8
	movs	r1, #32
	ldr	r2, .L110+12
	add	r0, sp, #12
	bl	snprintf
	movs	r2, #32
	movs	r1, #0
	mov	r0, r6
	bl	memset
	add	r0, sp, #12
	bl	strlen
	mov	r2, r0
	add	r1, sp, #12
	mov	r0, r6
	bl	memcpy
.L107:
	mov	r0, r7
	bl	dma_buf_put
.L105:
	ldr	r2, [sp, #44]
	mov	r0, r5
	ldr	r3, [r4]
	cmp	r2, r3
	beq	.L108
	bl	__stack_chk_fail
.L109:
	mov	r5, r0
	b	.L105
.L108:
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L111:
	.align	2
.L110:
	.word	__stack_chk_guard
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.fnend
	.size	mpi_buf_alloc_with_name, .-mpi_buf_alloc_with_name
	.align	1
	.global	mpi_buf_alloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_alloc, %function
mpi_buf_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L113
	b	mpi_buf_alloc_with_name
.L114:
	.align	2
.L113:
	.word	.LC8
	.fnend
	.size	mpi_buf_alloc, .-mpi_buf_alloc
	.align	1
	.global	mpi_buf_unref
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_unref, %function
mpi_buf_unref:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	cmp	r0, #0
	beq	.L115
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, .L127
	movs	r2, #0
	movs	r3, #12
.L120:
	mul	r1, r3, r2
	ldr	r6, [r1, r0]
	cmp	r6, r4
	bne	.L117
	ldr	r3, .L127+4
	add	r3, r3, r1
	movw	r1, #37692
	ldr	r2, [r3, r1]
	subs	r2, r2, #1
	str	r2, [r3, r1]
	cbnz	r2, .L118
	movw	r1, #37696
	movw	r6, #37688
	ldr	r0, [r3, r1]
	str	r2, [r3, r6]
	mov	r2, #-1
	str	r2, [r3, r1]
.L119:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r0, #0
	blt	.L121
	movs	r2, #0
	mov	r1, r4
	bl	remove_user_from_buf
.L121:
	ldr	r3, [r4, #480]
	cbz	r3, .L122
	ldr	r3, [r4]
	movs	r1, #5
	ldr	r2, .L127+8
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #1263
	str	r3, [sp]
	ldr	r3, .L127+12
	bl	vlog
.L122:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_obj_unref
.L117:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L120
.L118:
	mov	r0, #-1
	b	.L119
.L115:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L128:
	.align	2
.L127:
	.word	g_venc_dev+37688
	.word	g_venc_dev
	.word	.LC9
	.word	.LANCHOR0+160
	.fnend
	.size	mpi_buf_unref, .-mpi_buf_unref
	.align	1
	.global	mpi_buffer_queue_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_create, %function
mpi_buffer_queue_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L130
	movs	r1, #4
	b	mpi_queue_create
.L131:
	.align	2
.L130:
	.word	mpi_obj_unref
	.fnend
	.size	mpi_buffer_queue_create, .-mpi_buffer_queue_create
	.align	1
	.global	mpi_buffer_queue_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_destroy, %function
mpi_buffer_queue_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	movs	r1, #0
	bl	mpi_queue_destroy
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpi_buffer_queue_destroy, .-mpi_buffer_queue_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_destroy_ctx, %function
venc_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0]
	cbz	r0, .L134
	movs	r1, #0
	bl	mpi_queue_destroy
.L134:
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	venc_destroy_ctx, .-venc_destroy_ctx
	.align	1
	.global	mpi_buffer_pool_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_create, %function
mpi_buffer_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r0, .L143
	mov	r6, r1
	bl	mpi_allocator_find_by_name
	mov	r4, r0
	cbz	r0, .L138
	ldr	r3, .L143+4
	mov	r2, r5
	movs	r1, #1
	str	r3, [sp]
	mov	r3, r6
	bl	mpi_buf_pool_create
	mov	r4, r0
.L138:
	mov	r0, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L144:
	.align	2
.L143:
	.word	.LC5
	.word	.LC6
	.fnend
	.size	mpi_buffer_pool_create, .-mpi_buffer_pool_create
	.align	1
	.global	mpi_buffer_pool_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_destroy, %function
mpi_buffer_pool_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_destroy
	.fnend
	.size	mpi_buffer_pool_destroy, .-mpi_buffer_pool_destroy
	.align	1
	.global	mpi_buffer_pool_request_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_pool_request_buf, %function
mpi_buffer_pool_request_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r1, #0
	b	mpi_buf_pool_request_buf
	.fnend
	.size	mpi_buffer_pool_request_buf, .-mpi_buffer_pool_request_buf
	.align	1
	.global	venc_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_create, %function
venc_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r5, r0
	ldr	r0, .L159
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r7, [r5, #128]
	cmp	r2, #16
	mov	r8, r0
	beq	.L148
	movw	r3, #1673
	ldr	r2, .L159+4
	str	r3, [sp]
	ldr	r3, .L159+8
.L158:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L157
.L148:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #15
	ble	.L150
	strd	r3, r2, [sp, #4]
	movs	r1, #2
	movw	r3, #1677
	ldr	r2, .L159+12
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L159+8
	bl	vlog
.L157:
	mov	r0, #-1
.L147:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L150:
	ldr	r6, .L159+16
	add	r3, r3, #10944
	adds	r3, r3, #14
	mov	r2, #-1
	str	r2, [r6, r3, lsl #2]
	ldr	r0, [r4, #4]	@ unaligned
	bl	get_venc_node
	mov	r5, r0
	cbz	r0, .L151
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L159+20
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #1684
	str	r3, [sp]
	ldr	r3, .L159+8
	bl	vlog
	ldr	r2, [r4, #4]	@ unaligned
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L151:
	ldr	r0, .L159+24
	bl	mpi_allocator_find_by_name
	cbnz	r0, .L152
	movw	r3, #1691
	str	r0, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L159+8
	movs	r0, #4
	ldr	r2, .L159+28
	bl	vlog
	b	.L157
.L152:
	movs	r3, #0
	movs	r2, #1
	ldr	r1, [r4, #4]	@ unaligned
	mov	r0, r8
	bl	mpi_dev_create_node_with_params
	mov	r5, r0
	cbnz	r0, .L153
	movw	r3, #1697
	ldr	r2, .L159+32
	str	r3, [sp]
	ldr	r3, .L159+8
	b	.L158
.L153:
	movs	r2, #28
	movs	r1, #0
	adds	r0, r0, #8
	bl	memset
	ldr	r3, .L159+36
	movs	r1, #1
	mov	r0, r5
	ldr	r3, [r3]	@ unaligned
	str	r3, [r5, #4]	@ unaligned
	bl	mpi_node_enable_auto_streamon
	mov	r3, r5
	ldr	r2, [r4, #4]	@ unaligned
	movs	r0, #4
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, [r4, #12]	@ unaligned
	movs	r0, #0
	add	r3, r3, #9152
	adds	r3, r3, #14
	str	r2, [r6, r3, lsl #2]
	movs	r3, #4
	str	r3, [r7]
	ldr	r3, [r4]	@ unaligned
	str	r3, [r7, #4]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [r7, #8]
	b	.L147
.L160:
	.align	2
.L159:
	.word	.LC10
	.word	.LC11
	.word	.LANCHOR0+174
	.word	.LC1
	.word	g_venc_dev
	.word	.LC12
	.word	.LC5
	.word	.LC13
	.word	.LC14
	.word	.LC6
	.fnend
	.size	venc_node_create, .-venc_node_create
	.align	1
	.global	venc_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_delete, %function
venc_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r5, [r1]
	cmp	r5, #15
	ble	.L162
	movs	r3, #16
	ldr	r2, .L192
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1719
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L192+4
	bl	vlog
	mov	r0, #-1
.L161:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L162:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L192+8
	add	r7, r5, #110
	add	r3, r4, r7, lsl #2
	ldr	r3, [r3, #4]
	cbz	r3, .L164
	add	r6, r5, #418
	ldr	r0, [r4, r6, lsl #2]
	cbz	r0, .L164
	bl	mpi_buf_unref
	add	r2, r5, #338
	movs	r3, #0
	str	r3, [r4, r6, lsl #2]
	str	r3, [r4, r2, lsl #2]
.L164:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r5
	bl	get_venc_node
	mov	r6, r0
	cbz	r0, .L165
	mov	r2, r5
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L165:
	add	r9, r4, r5
	movw	fp, #10964
	ldrb	r3, [r9, fp]	@ zero_extendqisi2
	cbz	r3, .L166
	mov	r10, #800
	movw	r3, #10980
	mul	r6, r10, r5
	movs	r2, #255
	strb	r2, [r9, r3]
	addw	r3, r5, #2748
	mov	r8, #0
	mov	r2, r10
	add	r0, r6, #11008
	add	r3, r4, r3, lsl #2
	adds	r0, r0, #56
	mov	r1, r8
	add	r0, r0, r4
	str	r8, [r3, #4]
	bl	memset
	add	r0, r6, #23808
	adds	r0, r0, #56
	mov	r2, r10
	mov	r1, r8
	add	r0, r0, r4
	bl	memset
	strb	r8, [r9, fp]
.L166:
	add	r3, r4, r7, lsl #2
	ldr	r3, [r3, #4]
	cbz	r3, .L167
	add	r6, r5, #286
	add	r6, r4, r6, lsl #2
	ldr	r3, [r6, #4]
	cbz	r3, .L168
	bl	mcu_wrap_end
	movs	r3, #0
	str	r3, [r6, #4]
.L168:
	add	r7, r4, r7, lsl #2
	movs	r3, #0
	str	r3, [r7, #4]
.L167:
	add	r2, r5, #46
	movs	r3, #0
	add	r2, r4, r2, lsl #2
	str	r3, [r2, #4]
	add	r2, r5, #62
	adds	r5, r5, #94
	add	r2, r4, r2, lsl #2
	add	r5, r4, r5, lsl #2
	mov	r4, r3
	str	r3, [r2, #4]
	str	r3, [r5, #4]
.L169:
	mov	r0, r4
	bl	get_venc_node
	mov	r5, r0
	cbnz	r0, .L171
	adds	r4, r4, #1
	cmp	r4, #16
	bne	.L169
	bl	mpp_vcodec_clear_buf_resource
	mov	r0, r5
	b	.L161
.L171:
	movs	r0, #0
	b	.L161
.L193:
	.align	2
.L192:
	.word	.LC1
	.word	.LANCHOR0+191
	.word	g_venc_dev
	.fnend
	.size	venc_node_delete, .-venc_node_delete
	.align	1
	.global	venc_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_start, %function
venc_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r1
	ldr	r3, [r1, #20]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	ldr	r5, [r1]	@ unaligned
	cmp	r3, #40
	beq	.L195
	ldr	r3, .L232
	mov	r2, #1768
	str	r2, [sp]
	strd	r3, r2, [sp, #4]
	ldr	r2, .L232+4
.L231:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	mov	r0, #-1
.L194:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L195:
	cmp	r5, #15
	ble	.L197
	movs	r3, #16
	ldr	r2, .L232+8
	strd	r5, r3, [sp, #4]
	movw	r3, #1773
	str	r3, [sp]
	ldr	r3, .L232
	b	.L231
.L197:
	ldr	r3, [r1, #8]	@ unaligned
	add	r7, r5, #110
	ldr	r6, .L232+12
	movs	r0, #4
	ldr	r2, .L232+16
	str	r3, [sp, #12]
	ldr	r3, [r1, #4]	@ unaligned
	movs	r1, #5
	strd	r5, r3, [sp, #4]
	mov	r3, #1776
	str	r3, [sp]
	ldr	r3, .L232
	bl	vlog
	add	r3, r6, r7, lsl #2
	ldr	r3, [r3, #4]
	cbnz	r3, .L198
	ldr	r3, [r4, #4]	@ unaligned
	cbz	r3, .L199
.L198:
	ldr	r2, [r4, #36]	@ unaligned
	add	r3, r6, r5, lsl #2
	movs	r1, #0
	str	r2, [r3, #1148]
	add	r3, r5, #302
	add	r3, r6, r3, lsl #2
	str	r1, [r3, #4]
	add	r3, r5, #338
	str	r1, [r6, r3, lsl #2]
	cbz	r2, .L199
	movs	r1, #2
	mov	r0, r5
	bl	mpp_vcodec_set_online_mode
.L199:
	ldr	r2, [r4, #4]	@ unaligned
	add	r3, r6, r7, lsl #2
	mov	r0, r5
	str	r2, [r3, #4]
	bl	get_venc_node
	cbz	r0, .L201
	mov	r0, r5
	bl	get_venc_node
	bl	mpi_node_streamon
.L201:
	ldr	r3, [r4, #4]	@ unaligned
	cbnz	r3, .L202
.L230:
	movs	r0, #0
	b	.L194
.L202:
	add	r3, r5, #9152
	adds	r3, r3, #14
	ldr	r3, [r6, r3, lsl #2]
	bic	r3, r3, #4
	cmp	r3, #8
	bne	.L230
	movs	r3, #40
	add	lr, r4, #40
	mla	r3, r3, r5, r6
	mov	r2, r4
	add	r3, r3, #508
.L204:
	ldr	r0, [r2]	@ unaligned
	adds	r2, r2, #8
	ldr	r1, [r2, #-4]	@ unaligned
	cmp	r2, lr
	mov	ip, r3
	stmia	ip!, {r0, r1}
	mov	r3, ip
	bne	.L204
	add	r7, r6, r7, lsl #2
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L230
	ldr	r0, .L232+20
	bl	mpi_dev_find_by_name
	mov	r9, r0
	mov	r0, r5
	bl	get_venc_node
	movs	r1, #0
	mov	r8, r0
	mov	r0, r1
	bl	mpi_buf_create
	mov	r7, r0
	cmp	r0, #0
	beq	.L230
	cmp	r9, #0
	beq	.L230
	cmp	r8, #0
	beq	.L230
	movs	r2, #28
	movs	r1, #0
	adds	r0, r0, #8
	bl	memset
	ldr	r3, .L232+24
	movs	r0, #0
	ldr	r3, [r3]	@ unaligned
	str	r3, [r7, #4]	@ unaligned
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [r7, #668]
	ldr	r2, [r4, #16]	@ unaligned
	str	r2, [r7, #672]
	ldr	ip, [r4, #24]	@ unaligned
	str	ip, [r7, #676]
	ldr	lr, [r4, #28]	@ unaligned
	str	lr, [r7, #680]
	ldr	r1, [r4, #32]	@ unaligned
	str	r1, [r7, #688]
	movs	r1, #0
	strd	r0, [r7, #720]
	movs	r1, #0
	str	r1, [r7, #716]
	movs	r1, #4
	mov	r0, r1
	strd	r3, r2, [sp, #4]
	mov	r3, #776
	strd	ip, lr, [sp, #12]
	str	r3, [sp]
	ldr	r2, .L232+28
	ldr	r3, .L232+32
	bl	vlog
	ldr	r3, [r8, #316]
	ldr	r4, [r3]
	cbnz	r4, .L205
	movw	r3, #779
	ldr	r2, .L232+36
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L232+32
	movs	r0, #4
	bl	vlog
	b	.L230
.L205:
	mov	r0, r4
	bl	mpi_queue_pop_obj
	cbz	r0, .L206
	bl	mpi_buf_unref
.L206:
	add	r5, r6, r5, lsl #2
	mov	r1, r7
	mov	r0, r4
	movs	r3, #1
	str	r3, [r5, #1276]
	bl	mpi_queue_push_obj
	cbnz	r0, .L207
	movw	r3, #787
	ldr	r2, .L232+40
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L232+32
	movs	r0, #4
	bl	vlog
	mov	r0, r7
	bl	mpi_obj_unref
.L207:
	ldr	r3, [r9, #116]
	movs	r2, #0
	movs	r1, #7
	mov	r0, r8
	blx	r3
	b	.L230
.L233:
	.align	2
.L232:
	.word	.LANCHOR0+208
	.word	.LC15
	.word	.LC1
	.word	g_venc_dev
	.word	.LC16
	.word	.LC10
	.word	.LC6
	.word	.LC17
	.word	.LANCHOR0+224
	.word	.LC18
	.word	.LC19
	.fnend
	.size	venc_node_start, .-venc_node_start
	.align	1
	.global	venc_node_pp_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_start, %function
venc_node_pp_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, [r1]
	cmp	r4, #7
	ble	.L235
	movs	r3, #8
	ldr	r2, .L238
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #2149
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L238+4
	bl	vlog
	mov	r0, #-1
.L234:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L235:
	mov	r0, r4
	bl	get_pp_node
	cmp	r0, #0
	beq	.L234
	mov	r0, r4
	bl	get_pp_node
	bl	mpi_node_streamon
	movs	r0, #0
	b	.L234
.L239:
	.align	2
.L238:
	.word	.LC1
	.word	.LANCHOR0+239
	.fnend
	.size	venc_node_pp_start, .-venc_node_pp_start
	.align	1
	.global	venc_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_stop, %function
venc_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r4, [r1]
	cmp	r4, #15
	ble	.L241
	movs	r3, #16
	ldr	r2, .L247
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1805
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L247+4
	bl	vlog
	mov	r0, #-1
.L240:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L241:
	mov	r0, r4
	bl	get_venc_node
	cbz	r0, .L243
	mov	r0, r4
	bl	get_venc_node
	bl	mpi_node_streamoff
.L243:
	adds	r4, r4, #141
	ldr	r3, .L247+8
	movs	r0, #0
	lsls	r4, r4, #4
	str	r0, [r3, r4]
	b	.L240
.L248:
	.align	2
.L247:
	.word	.LC1
	.word	.LANCHOR0+258
	.word	g_venc_dev
	.fnend
	.size	venc_node_stop, .-venc_node_stop
	.align	1
	.global	venc_node_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_send_frame, %function
venc_node_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L263
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L250
	mov	r3, #1824
	ldr	r2, .L263+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L263+8
	movs	r0, #4
	bl	vlog
.L262:
	mov	r0, #-1
.L249:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L250:
	ldr	r6, [r4]	@ unaligned
	cmp	r6, #15
	ble	.L252
	movs	r3, #16
	ldr	r2, .L263+12
	strd	r6, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1829
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	b	.L262
.L252:
	mov	r0, r6
	bl	get_venc_node
	mov	r7, r0
	cbnz	r0, .L253
.L254:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r6, r7, [sp, #4]
	movs	r0, #4
	ldr	r2, .L263+16
	strd	r8, r3, [sp, #12]
	mov	r3, #1848
	str	r3, [sp]
	ldr	r3, .L263+8
	bl	vlog
	b	.L262
.L253:
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L254
	cmp	r0, #0
	blt	.L254
	bl	get_mpi_buf
	mov	r5, r0
	cmp	r0, #0
	beq	.L254
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #664
	bl	memcpy
	movs	r3, #4
	str	r3, [r5, #636]
	movs	r2, #0
	ldr	r3, [r4, #84]	@ unaligned
	mov	r1, r5
	mov	r0, r7
	cmp	r3, #0
	itt	lt
	movlt	r3, #12
	strlt	r3, [r5, #636]
	bl	mpi_node_buffer_in
	cmp	r0, #0
	beq	.L249
	b	.L254
.L264:
	.align	2
.L263:
	.word	.LC10
	.word	.LC20
	.word	.LANCHOR0+273
	.word	.LC1
	.word	.LC21
	.fnend
	.size	venc_node_send_frame, .-venc_node_send_frame
	.align	1
	.global	venc_node_pp_send_frame
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_send_frame, %function
venc_node_pp_send_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r0, .L280
	mov	r4, r1
	bl	mpi_dev_find_by_name
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #92
	mov	r8, r0
	beq	.L266
	movw	r3, #2166
	ldr	r2, .L280+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L280+8
	movs	r0, #4
	bl	vlog
.L279:
	mov	r0, #-1
	b	.L265
.L266:
	ldr	r5, [r4]	@ unaligned
	cmp	r5, #7
	ble	.L268
	movs	r3, #8
	ldr	r2, .L280+12
	strd	r5, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #2171
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L280+8
	bl	vlog
	b	.L279
.L268:
	mov	r0, r5
	bl	get_pp_node
	mov	r6, r0
	cbz	r0, .L269
	ldr	r0, [r4, #4]	@ unaligned
	cmp	r8, #0
	beq	.L269
	cmp	r0, #0
	blt	.L269
	bl	get_mpi_buf
	mov	r7, r0
	cbz	r0, .L269
	movs	r2, #80
	add	r1, r4, #12
	add	r0, r0, #664
	bl	memcpy
	movs	r2, #1
	mov	r1, r7
	mov	r0, r6
	bl	mpi_node_buffer_in
	movs	r0, #0
.L265:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L269:
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	strd	r5, r6, [sp, #4]
	movs	r0, #4
	ldr	r2, .L280+16
	strd	r8, r3, [sp, #12]
	movw	r3, #2187
	str	r3, [sp]
	ldr	r3, .L280+8
	bl	vlog
	b	.L279
.L281:
	.align	2
.L280:
	.word	.LC6
	.word	.LC20
	.word	.LANCHOR0+294
	.word	.LC1
	.word	.LC22
	.fnend
	.size	venc_node_pp_send_frame, .-venc_node_pp_send_frame
	.align	1
	.global	venc_node_pp_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_delete, %function
venc_node_pp_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r4, [r1]
	cmp	r4, #7
	ble	.L283
	movs	r3, #8
	ldr	r2, .L309
	strd	r4, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #2108
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L309+4
	bl	vlog
	mov	r0, #-1
.L282:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L283:
	ldr	r0, .L309+8
	mov	r5, #1056
	bl	mutex_lock
	muls	r5, r4, r5
	ldr	r7, .L309+12
	movs	r6, #5
	mov	r9, #0
	add	r8, r5, #2704
	add	r8, r8, r7
.L286:
	ldr	r0, [r8], #4
	cbz	r0, .L285
	bl	mpi_obj_unref
	str	r9, [r8, #-4]
.L285:
	subs	r6, r6, #1
	bne	.L286
	addw	r8, r5, #2724
	mov	r9, #5
	add	r8, r8, r7
.L288:
	ldr	r0, [r8], #4
	cbz	r0, .L287
	bl	mpi_obj_unref
	str	r6, [r8, #-4]
.L287:
	subs	r9, r9, #1
	bne	.L288
	mov	r6, #1056
	mla	r6, r6, r4, r7
	ldr	r0, [r6, #3268]
	cbz	r0, .L289
	bl	mpi_obj_unref
	str	r9, [r6, #3268]
.L289:
	mov	r6, #1056
	mla	r6, r6, r4, r7
	ldr	r0, [r6, #3276]
	cbz	r0, .L290
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r6, #3276]
.L290:
	mov	r0, r4
	bl	vepu_pp_destroy_chn
	mov	r0, r4
	bl	get_pp_node
	mov	r6, r0
	cbz	r0, .L291
	mov	r2, r4
	movs	r1, #0
	movs	r0, #21
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L291:
	addw	r0, r5, #3404
	movs	r2, #36
	movs	r1, #0
	add	r0, r0, r7
	bl	memset
	ldr	r0, .L309+8
	bl	mutex_unlock
	movs	r0, #0
	b	.L282
.L310:
	.align	2
.L309:
	.word	.LC1
	.word	.LANCHOR0+318
	.word	g_venc_dev+2504
	.word	g_venc_dev
	.fnend
	.size	venc_node_pp_delete, .-venc_node_pp_delete
	.global	__aeabi_uidivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_handle_message, %function
venc_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r0
	ldr	r3, [r0, #36]
	.pad #28
	sub	sp, sp, #28
	mov	r7, r1
	mov	r5, r2
	cmp	r3, #1
	beq	.L321
.L329:
	movs	r0, #0
	b	.L311
.L321:
	movs	r4, #0
.L312:
	mov	r0, r4
	bl	get_pp_node
	cmp	r6, r0
	beq	.L314
	adds	r4, r4, #1
	cmp	r4, #16
	bne	.L312
	mov	r4, #-1
.L315:
	mov	r3, #932
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L330
	movs	r0, #4
	ldr	r2, .L330+4
	bl	vlog
	b	.L329
.L314:
	cmp	r4, #7
	bgt	.L315
	cmp	r7, #1
	bne	.L329
	cmp	r5, #0
	beq	.L329
	ldr	r2, .L330+8
	mov	r3, #1056
	mla	r3, r3, r4, r2
	ldr	r1, [r3, #2684]
	cmp	r1, #1
	ble	.L318
	ldr	r0, [r5, #716]
	bl	__aeabi_uidivmod
	cbz	r1, .L318
	movs	r2, #0
	mov	r1, r5
	ldr	r0, [r6, #112]
	bl	remove_user_from_buf
	b	.L329
.L318:
	ldr	r3, [r6, #316]
	movs	r1, #5
	ldr	r2, .L330+12
	movs	r0, #4
	ldr	r7, [r3]
	ldr	r3, [r7, #44]
	str	r3, [sp, #16]
	ldr	r3, [r5]
	str	r3, [sp, #12]
	ldr	r3, [r6]
	str	r3, [sp, #8]
	ldr	r3, [r6, #80]
	ldr	r3, [r3, #80]
	str	r3, [sp, #4]
	mov	r3, #956
	str	r3, [sp]
	ldr	r3, .L330
	bl	vlog
	mov	r0, r5
	bl	mpi_obj_ref
	mov	r1, r5
	mov	r0, r7
	bl	mpi_queue_push_obj
	cbnz	r0, .L319
	ldr	r2, .L330+16
	ldr	r3, [r2]
	cmp	r3, #19
	add	r1, r3, #1
	str	r1, [r2]
	bgt	.L320
	ldrd	r2, [r5, #720]
	movs	r1, #2
	str	r4, [sp, #4]
	movs	r0, #4
	strd	r2, [sp, #8]
	mov	r3, #960
	ldr	r2, .L330+20
	str	r3, [sp]
	ldr	r3, .L330
	bl	vlog
.L320:
	mov	r0, r5
	bl	mpi_obj_unref
	mov	r0, #-1
.L311:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L319:
	ldr	r0, .L330+24
	bl	up
	b	.L329
.L331:
	.align	2
.L330:
	.word	.LANCHOR0+338
	.word	.LC23
	.word	g_venc_dev
	.word	.LC24
	.word	.LANCHOR1
	.word	.LC25
	.word	g_venc_dev+172
	.fnend
	.size	venc_handle_message, .-venc_handle_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_release, %function
venc_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r7, r1
	ldr	r4, .L391
	ldr	r0, .L391+4
	bl	mpi_obj_unref
	ldr	r3, [r4, #48]
	cmp	r3, #1
	bne	.L333
	ldr	r2, [r4, #4]
	add	r5, r4, #444
	ldr	r1, .L391+8
	movs	r6, #16
	ldr	r0, .L391+12
	mov	r8, #0
	bl	printk
.L337:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5], #4
	cbz	r3, .L334
	ldr	r0, [r5, #1224]
	cbz	r0, .L334
	bl	mpi_buf_unref
	str	r8, [r5, #1224]
	str	r8, [r5, #904]
.L334:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #-4]
	cbz	r3, .L335
	ldr	r3, [r5, #700]
	cbz	r3, .L336
	bl	mcu_wrap_end
	str	r8, [r5, #700]
.L336:
	str	r8, [r5, #-4]
.L335:
	subs	r6, r6, #1
	bne	.L337
	ldr	r3, [r4, #144]
	cmp	r3, #0
	bne	.L338
.L340:
	ldr	r0, .L391+16
	movs	r5, #0
	bl	mutex_lock
	ldr	r4, .L391
	mov	r9, r5
.L339:
	add	r8, r4, #2704
	movs	r6, #5
.L344:
	ldr	r0, [r8], #4
	cbz	r0, .L343
	bl	mpi_obj_unref
	str	r9, [r8, #-4]
.L343:
	subs	r6, r6, #1
	bne	.L344
	addw	r8, r4, #2724
	movs	r6, #5
.L346:
	ldr	r0, [r8], #4
	cbz	r0, .L345
	bl	mpi_obj_unref
	str	r9, [r8, #-4]
.L345:
	subs	r6, r6, #1
	bne	.L346
	ldr	r0, [r4, #3268]
	cbz	r0, .L347
	bl	mpi_obj_unref
	str	r6, [r4, #3268]
.L347:
	ldr	r0, [r4, #3276]
	cbz	r0, .L348
	bl	mpi_obj_unref
	str	r9, [r4, #3276]
.L348:
	mov	r0, r5
	bl	get_pp_node
	mov	r6, r0
	cbz	r0, .L349
	mov	r0, r5
	bl	vepu_pp_destroy_chn
	mov	r2, r5
	movs	r1, #0
	movs	r0, #21
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
.L349:
	adds	r5, r5, #1
	add	r4, r4, #1056
	cmp	r5, #8
	bne	.L339
	ldr	r0, .L391+16
	movs	r4, #0
	bl	mutex_unlock
.L352:
	mov	r0, r4
	bl	get_venc_node
	mov	r5, r0
	cbz	r0, .L351
	mov	r2, r4
	movs	r1, #0
	movs	r0, #4
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
.L351:
	adds	r4, r4, #1
	cmp	r4, #16
	bne	.L352
	mov	r2, #384
	movs	r1, #0
	ldr	r0, .L391+20
	bl	memset
	mov	r2, #256
	movs	r1, #0
	ldr	r0, .L391+24
	bl	memset
	mov	r2, #8448
	movs	r1, #0
	ldr	r0, .L391+28
	bl	memset
	mov	r2, r4
	mov	r1, #-1
	ldr	r0, .L391+32
	bl	memset
	movs	r2, #64
	movs	r1, #0
	ldr	r0, .L391+36
	bl	memset
	mov	r2, #12800
	movs	r1, #0
	ldr	r0, .L391+40
	bl	memset
	mov	r2, #12800
	movs	r1, #0
	ldr	r0, .L391+44
	bl	memset
	mov	r2, r4
	movs	r1, #0
	ldr	r0, .L391+48
	bl	memset
	bl	mpp_vcodec_clear_buf_resource
.L333:
	ldr	r0, [r7, #128]
	cbz	r0, .L353
	bl	kvfree
.L353:
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L338:
	cmn	r3, #4096
	bhi	.L340
	ldr	r0, .L391+52
	movs	r3, #1
	str	r3, [r4, #156]
	bl	up
	ldr	r3, [r4, #144]
	movs	r1, #4
	ldr	r2, .L391+56
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2535
	str	r3, [sp]
	ldr	r3, .L391+8
	bl	vlog
	ldr	r0, [r4, #144]
	bl	kthread_stop
	ldr	r3, [r4, #144]
	movs	r1, #4
	ldr	r2, .L391+60
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2537
	str	r3, [sp]
	ldr	r3, .L391+8
	bl	vlog
	str	r6, [r4, #144]
.L341:
	ldr	r3, [r4, #156]
	cmp	r3, #2
	beq	.L340
	movs	r0, #1
	bl	msleep
	b	.L341
.L392:
	.align	2
.L391:
	.word	g_venc_dev
	.word	g_venc_dev+4
	.word	.LANCHOR0+366
	.word	.LC26
	.word	g_venc_dev+2504
	.word	g_venc_dev+1864
	.word	g_venc_dev+2248
	.word	g_venc_dev+2516
	.word	g_venc_dev+10980
	.word	g_venc_dev+10996
	.word	g_venc_dev+11064
	.word	g_venc_dev+23864
	.word	g_venc_dev+10964
	.word	g_venc_dev+172
	.word	.LC27
	.word	.LC28
	.fnend
	.size	venc_release, .-venc_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_ioctl, %function
venc_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r2
	ldr	r2, .L397
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	uxtb	r4, r1
	ldr	r6, [r2, #140]
	ldr	r5, [r6, #168]
	cmp	r5, r4
	bhi	.L394
	movw	r3, #2427
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L397+4
	movs	r0, #4
	ldr	r2, .L397+8
	bl	vlog
.L395:
	movw	r3, #2443
	ldr	r2, .L397+12
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L397+4
	movs	r0, #4
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L394:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r6, #164]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r4, r5, r4, r2
	cbnz	r4, .L396
	movw	r3, #2434
	ldr	r2, .L397+16
	str	r3, [sp]
	movs	r1, #5
	ldr	r3, .L397+4
	movs	r0, #4
	bl	vlog
	b	.L395
.L396:
	mov	r2, r1
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L398:
	.align	2
.L397:
	.word	g_venc_dev
	.word	.LANCHOR0+379
	.word	.LC29
	.word	.LC31
	.word	.LC30
	.fnend
	.size	venc_ioctl, .-venc_ioctl
	.align	1
	.global	vcodec_notify_drop_frm
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify_drop_frm, %function
vcodec_notify_drop_frm:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #15
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	bls	.L400
	movs	r3, #16
	ldr	r2, .L412
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1087
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L412+4
	bl	vlog
	mov	r0, #-1
.L399:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L400:
	ldr	r3, .L412+8
	add	r2, r3, r0, lsl #2
	ldr	r2, [r2, #444]
	cbz	r2, .L402
	add	r2, r3, r0, lsl #2
	movs	r1, #1
	str	r1, [r2, #1276]
.L402:
	add	r2, r0, #9152
	adds	r2, r2, #14
	ldr	r2, [r3, r2, lsl #2]
	cmp	r2, #9
	beq	.L403
	cmp	r2, #15
	bne	.L404
.L403:
	adds	r0, r0, #141
	lsls	r0, r0, #4
	adds	r2, r3, r0
	ldr	r3, [r3, r0]
	movs	r0, #0
	cmp	r3, #0
	ble	.L399
	str	r0, [r2, #4]
	b	.L399
.L404:
	movs	r0, #0
	b	.L399
.L413:
	.align	2
.L412:
	.word	.LC1
	.word	.LANCHOR0+390
	.word	g_venc_dev
	.fnend
	.size	vcodec_notify_drop_frm, .-vcodec_notify_drop_frm
	.align	1
	.global	venc_node_set_combo
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_combo, %function
venc_node_set_combo:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #12
	beq	.L415
	movw	r3, #1918
	ldr	r2, .L419
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L419+4
	movs	r0, #4
	bl	vlog
.L418:
	mov	r0, #-1
.L414:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L415:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #15
	ble	.L417
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1923
	ldr	r2, .L419+8
	str	r3, [sp]
	ldr	r3, .L419+4
	bl	vlog
	b	.L418
.L417:
	ldr	r3, .L419+12
	movs	r0, #0
	add	r3, r3, r2, lsl #4
	movs	r2, #1
	str	r2, [r3, #2248]
	ldr	r2, [r1, #4]	@ unaligned
	str	r2, [r3, #2252]
	b	.L414
.L420:
	.align	2
.L419:
	.word	.LC32
	.word	.LANCHOR0+413
	.word	.LC1
	.word	g_venc_dev
	.fnend
	.size	venc_node_set_combo, .-venc_node_set_combo
	.align	1
	.global	venc_node_set_snap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_snap, %function
venc_node_set_snap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #12
	beq	.L422
	movw	r3, #1939
	ldr	r2, .L427
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L427+4
	movs	r0, #4
	bl	vlog
.L426:
	mov	r0, #-1
.L421:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L422:
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #15
	ble	.L424
	movs	r2, #16
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	mov	r3, #1944
	ldr	r2, .L427+8
	str	r3, [sp]
	ldr	r3, .L427+4
	bl	vlog
	b	.L426
.L424:
	ldr	r2, .L427+12
	ldr	r4, [r1, #4]	@ unaligned
	add	r0, r2, r3, lsl #4
	str	r4, [r0, #2256]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r1, #4]	@ unaligned
	cmp	r1, #0
	ittt	gt
	addwgt	r3, r3, #2748
	addgt	r3, r2, r3, lsl #2
	strgt	r1, [r3, #4]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	b	.L421
.L428:
	.align	2
.L427:
	.word	.LC33
	.word	.LANCHOR0+433
	.word	.LC1
	.word	g_venc_dev
	.fnend
	.size	venc_node_set_snap, .-venc_node_set_snap
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_wrap_begin, %function
set_wrap_begin:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L431
	ldr	r2, [r3, #4]
	orrs	r2, r0, r2
	bne	.L429
	movs	r2, #1
	ldr	r0, .L431+4
	str	r2, [r3, #4]
	b	printk
.L429:
	bx	lr
.L432:
	.align	2
.L431:
	.word	.LANCHOR1
	.word	.LC34
	.fnend
	.size	set_wrap_begin, .-set_wrap_begin
	.align	1
	.global	vcodec_set_intra_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_set_intra_info, %function
vcodec_set_intra_info:
	.fnstart
	@ args = 12, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	cmp	r0, #15
	.pad #28
	sub	sp, sp, #28
	mov	r4, r0
	strd	r2, [sp, #16]
	bls	.L434
	movs	r3, #16
	ldr	r2, .L470
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1023
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L470+4
	bl	vlog
	mov	r0, #-1
.L433:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L434:
	ldr	r6, .L470+8
	ldr	r3, [r6, #444]
	cbz	r3, .L436
	ldr	r3, .L470+12
	ldr	r2, [r3, #8]
	orrs	r2, r0, r2
	bne	.L436
	ldr	r0, .L470+16
	movs	r2, #1
	str	r2, [r3, #8]
	bl	printk
.L436:
	mov	r0, r4
	bl	get_venc_node
	cbz	r0, .L437
	ldr	r3, [r0, #156]
	cbz	r3, .L437
	blx	r3
.L437:
	add	r3, r6, r4, lsl #4
	ldr	r5, [r3, #2248]
	movw	r3, #43960
	ldr	r3, [r6, r3]
	orrs	r5, r5, r3
	bne	.L438
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r9, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, .L470+20
	ldr	r10, .L470+4
	ldr	fp, .L470+28
	sub	r8, r7, #444
.L442:
	ldr	r3, [r7], #4
	cbz	r3, .L440
	ldr	r3, [r7, #828]
	adds	r3, r3, #1
	bne	.L440
	movw	r3, #1041
	mov	r2, fp
	str	r3, [sp]
	movs	r1, #5
	mov	r3, r10
	str	r5, [sp, #4]
	movs	r0, #4
	bl	vlog
	add	r3, r8, #1544
	add	r1, r8, #1416
	mov	r0, r5
	ldrd	r2, [r3]
	strd	r2, [sp]
	ldrd	r2, [r1]
	bl	mpp_vcodec_run_task
	cbnz	r0, .L440
	bl	set_wrap_begin
	movs	r3, #1
	str	r3, [r7, #828]
.L440:
	adds	r5, r5, #1
	add	r8, r8, #8
	cmp	r5, #16
	bne	.L442
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r9	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L438:
	ldr	r3, [sp, #72]
	cmp	r3, #0
	beq	.L469
	ldr	r5, .L470+8
	add	r3, r4, #9152
	adds	r3, r3, #14
	ldr	r3, [r5, r3, lsl #2]
	cmp	r3, #9
	beq	.L443
	cmp	r3, #15
	bne	.L444
.L443:
	add	r3, r4, #141
	lsls	r3, r3, #4
	adds	r1, r5, r3
	ldr	r2, [r5, r3]
	cmp	r2, #0
	itttt	gt
	addgt	r2, r2, #-1
	strgt	r2, [r5, r3]
	movgt	r3, #0
	strgt	r3, [r1, #4]
.L444:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r2, r5, r4
	movw	r3, #10980
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	movw	r2, #10964
	add	r3, r3, r5
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cbz	r3, .L445
	addw	r7, r4, #2748
	add	r3, r5, r7, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L445
	mov	r3, #800
	movs	r2, #0
	mla	r3, r3, r4, r5
	add	r3, r3, #23808
	adds	r3, r3, #56
.L448:
	ldrd	r0, [r3], #8
	ldrd	r9, [sp, #64]
	cmp	r1, r10
	it	eq
	cmpeq	r0, r9
	beq	.L446
	orrs	r1, r0, r1
	bne	.L447
	movs	r3, #100
	mla	r4, r3, r4, r2
	ldrd	r1, [sp, #16]
	addw	r3, r4, #1383
	addw	r4, r4, #2983
	add	r3, r6, r3, lsl #3
	add	r6, r6, r4, lsl #3
	mov	r4, r10
	strd	r1, [r3]
	mov	r3, r9
	strd	r3, [r6]
.L446:
	add	r5, r5, r7, lsl #2
	ldr	r3, [r5, #4]
	subs	r3, r3, #1
	str	r3, [r5, #4]
.L445:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L469:
	movs	r0, #0
	b	.L433
.L447:
	adds	r2, r2, #1
	cmp	r2, #100
	bne	.L448
	movw	r3, #1074
	str	r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L470+4
	movs	r0, #4
	ldr	r2, .L470+24
	bl	vlog
	b	.L446
.L471:
	.align	2
.L470:
	.word	.LC1
	.word	.LANCHOR0+452
	.word	g_venc_dev
	.word	.LANCHOR1
	.word	.LC35
	.word	g_venc_dev+444
	.word	.LC37
	.word	.LC36
	.fnend
	.size	vcodec_set_intra_info, .-vcodec_set_intra_info
	.align	1
	.global	vcodec_notify
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_notify, %function
vcodec_notify:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #15
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	bhi	.L484
	cmp	r1, #3
	bhi	.L484
	tbb	[pc, r1]
.L475:
	.byte	(.L478-.L475)/2
	.byte	(.L477-.L475)/2
	.byte	(.L476-.L475)/2
	.byte	(.L474-.L475)/2
	.p2align 1
.L478:
	ldr	r5, .L489
	movw	r3, #43960
	ldr	r4, [r5, r3]
	cmp	r4, #0
	bne	.L473
	ldrd	r10, [r2]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r9, .L489+8
	add	r6, r5, #444
	movw	r8, #1115
.L482:
	ldr	r3, [r6], #4
	cbz	r3, .L480
	ldr	r3, [r6, #828]
	adds	r3, r3, #1
	bne	.L480
	mov	r3, r9
	ldr	r2, .L489+4
	movs	r1, #5
	strd	r10, [sp, #8]
	strd	r8, r4, [sp]
	movs	r0, #4
	bl	vlog
	add	r3, r5, #1544
	add	r1, r5, #1416
	mov	r0, r4
	ldrd	r2, [r3]
	strd	r2, [sp]
	ldrd	r2, [r1]
	bl	mpp_vcodec_run_task
	cbnz	r0, .L480
	bl	set_wrap_begin
	movs	r3, #1
	str	r3, [r6, #828]
.L480:
	adds	r4, r4, #1
	adds	r5, r5, #8
	cmp	r4, #16
	bne	.L482
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L487:
	b	.L486
.L477:
	add	r3, r0, #10944
	adds	r3, r3, #14
.L488:
	ldr	r1, .L489
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [r2]
.L486:
	movs	r1, #0
.L473:
	mov	r0, r1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L476:
	add	r3, r0, #10944
	adds	r3, r3, #30
	b	.L488
.L474:
	ldr	r0, .L489
	movw	r3, #43960
	movs	r2, #1
	str	r2, [r0, r3]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #64
	movs	r1, #0
	addw	r0, r0, #1276
	bl	memset
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L487
.L484:
	mov	r1, #-1
	b	.L473
.L490:
	.align	2
.L489:
	.word	g_venc_dev
	.word	.LC38
	.word	.LANCHOR0+474
	.fnend
	.size	vcodec_notify, .-vcodec_notify
	.align	1
	.global	venc_node_check
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_check, %function
venc_node_check:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {lr}
	.pad #20
	ldr	r3, [r1, #8]	@ unaligned
	cmp	r3, #16
	beq	.L492
	movw	r3, #1649
	ldr	r2, .L496
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L496+4
	movs	r0, #4
	bl	vlog
.L495:
	mov	r0, #-1
.L491:
	add	sp, sp, #20
	@ sp needed
	ldr	pc, [sp], #4
.L492:
	ldr	r0, [r1, #4]	@ unaligned
	cmp	r0, #15
	ble	.L494
	strd	r0, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #1653
	ldr	r2, .L496+8
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L496+4
	bl	vlog
	b	.L495
.L494:
	bl	get_venc_node
	clz	r0, r0
	lsrs	r0, r0, #5
	rsbs	r0, r0, #0
	b	.L491
.L497:
	.align	2
.L496:
	.word	.LC11
	.word	.LANCHOR0+488
	.word	.LC1
	.fnend
	.size	venc_node_check, .-venc_node_check
	.align	1
	.global	venc_node_set_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_set_crop, %function
venc_node_set_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r1, #12]	@ unaligned
	cmp	r0, #24
	beq	.L499
	movw	r3, #1858
	ldr	r2, .L505
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L505+4
	movs	r0, #4
	bl	vlog
.L504:
	mov	r0, #-1
.L498:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L499:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #15
	ble	.L501
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1863
	ldr	r2, .L505+8
	str	r3, [sp]
	ldr	r3, .L505+4
	bl	vlog
	b	.L504
.L501:
	mov	r3, r1
	ldr	r1, .L505+12
	add	r5, r3, #24
	mla	r2, r0, r2, r1
.L502:
	ldr	r0, [r3]	@ unaligned
	ldr	r1, [r3, #4]	@ unaligned
	adds	r3, r3, #8
	cmp	r3, r5
	mov	r4, r2
	stmia	r4!, {r0, r1}
	mov	r2, r4
	bne	.L502
	movs	r0, #0
	b	.L498
.L506:
	.align	2
.L505:
	.word	.LC39
	.word	.LANCHOR0+504
	.word	.LC1
	.word	g_venc_dev+1864
	.fnend
	.size	venc_node_set_crop, .-venc_node_set_crop
	.align	1
	.global	venc_node_get_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_get_crop, %function
venc_node_get_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #24
	beq	.L508
	movw	r3, #1876
	ldr	r2, .L514
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L514+4
	movs	r0, #4
	bl	vlog
.L513:
	mov	r0, #-1
.L507:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L508:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #15
	ble	.L510
	movs	r3, #16
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #1881
	ldr	r2, .L514+8
	str	r3, [sp]
	ldr	r3, .L514+4
	bl	vlog
	b	.L513
.L510:
	ldr	r0, .L514+12
	mla	r2, r3, r2, r0
	mov	r3, r1
	add	r5, r2, #24
.L511:
	mov	r4, r2
	adds	r3, r3, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, r5
	str	r0, [r3, #-8]	@ unaligned
	mov	r2, r4
	str	r1, [r3, #-4]	@ unaligned
	bne	.L511
	movs	r0, #0
	b	.L507
.L515:
	.align	2
.L514:
	.word	.LC39
	.word	.LANCHOR0+523
	.word	.LC1
	.word	g_venc_dev+1864
	.fnend
	.size	venc_node_get_crop, .-venc_node_get_crop
	.align	1
	.global	venc_node_pp_set_md_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_set_md_attr, %function
venc_node_pp_set_md_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #36
	beq	.L517
	movw	r3, #2245
	ldr	r2, .L523
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L523+4
	movs	r0, #4
	bl	vlog
.L522:
	mov	r0, #-1
.L516:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L517:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #7
	ble	.L519
	movs	r3, #8
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2250
	ldr	r2, .L523+8
	str	r3, [sp]
	ldr	r3, .L523+4
	bl	vlog
	b	.L522
.L519:
	mov	r3, r1
	ldr	r1, .L523+12
	mov	r0, #1056
	add	r5, r3, #32
	mla	r2, r0, r2, r1
.L520:
	ldr	r0, [r3]	@ unaligned
	ldr	r1, [r3, #4]	@ unaligned
	adds	r3, r3, #8
	cmp	r3, r5
	mov	r4, r2
	stmia	r4!, {r0, r1}
	mov	r2, r4
	bne	.L520
	ldr	r0, [r3]	@ unaligned
	str	r0, [r4]
	movs	r0, #0
	b	.L516
.L524:
	.align	2
.L523:
	.word	.LC0
	.word	.LANCHOR0+542
	.word	.LC1
	.word	g_venc_dev+3404
	.fnend
	.size	venc_node_pp_set_md_attr, .-venc_node_pp_set_md_attr
	.align	1
	.global	venc_node_pp_set_od_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_set_od_attr, %function
venc_node_pp_set_od_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #40
	beq	.L526
	mov	r3, #2304
	ldr	r2, .L532
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L532+4
	movs	r0, #4
	bl	vlog
.L531:
	mov	r0, #-1
.L525:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L526:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #7
	ble	.L528
	movs	r3, #8
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2309
	ldr	r2, .L532+8
	str	r3, [sp]
	ldr	r3, .L532+4
	bl	vlog
	b	.L531
.L528:
	mov	r3, r1
	ldr	r1, .L532+12
	mov	r0, #1056
	add	r5, r3, #40
	mla	r2, r0, r2, r1
.L529:
	ldr	r0, [r3]	@ unaligned
	ldr	r1, [r3, #4]	@ unaligned
	adds	r3, r3, #8
	cmp	r3, r5
	mov	r4, r2
	stmia	r4!, {r0, r1}
	mov	r2, r4
	bne	.L529
	movs	r0, #0
	b	.L525
.L533:
	.align	2
.L532:
	.word	.LC40
	.word	.LANCHOR0+567
	.word	.LC1
	.word	g_venc_dev+3440
	.fnend
	.size	venc_node_pp_set_od_attr, .-venc_node_pp_set_od_attr
	.align	1
	.global	venc_node_pp_get_od_attr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_od_attr, %function
venc_node_pp_get_od_attr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r3, [r1, #4]	@ unaligned
	cmp	r3, #40
	beq	.L535
	movw	r3, #2324
	ldr	r2, .L541
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L541+4
	movs	r0, #4
	bl	vlog
.L540:
	mov	r0, #-1
.L534:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L535:
	ldr	r2, [r1]	@ unaligned
	cmp	r2, #7
	ble	.L537
	movs	r3, #8
	movs	r1, #2
	strd	r2, r3, [sp, #4]
	movs	r0, #4
	movw	r3, #2329
	ldr	r2, .L541+8
	str	r3, [sp]
	ldr	r3, .L541+4
	bl	vlog
	b	.L540
.L537:
	ldr	r3, .L541+12
	mov	r0, #1056
	mla	r2, r0, r2, r3
	mov	r3, r1
	add	r5, r2, #40
.L538:
	mov	r4, r2
	adds	r3, r3, #8
	ldmia	r4!, {r0, r1}
	cmp	r4, r5
	str	r0, [r3, #-8]	@ unaligned
	mov	r2, r4
	str	r1, [r3, #-4]	@ unaligned
	bne	.L538
	movs	r0, #0
	b	.L534
.L542:
	.align	2
.L541:
	.word	.LC40
	.word	.LANCHOR0+592
	.word	.LC1
	.word	g_venc_dev+3440
	.fnend
	.size	venc_node_pp_get_od_attr, .-venc_node_pp_get_od_attr
	.align	1
	.global	mpi_buf_get_paddr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_get_paddr, %function
mpi_buf_get_paddr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbz	r0, .L545
	ldr	r0, [r0, #660]
	cmp	r0, #0
	bgt	.L543
	ldr	r0, [r4, #484]
	bl	get_dma_buf_phy_addr
	str	r0, [r4, #660]
.L543:
	pop	{r4, pc}
.L545:
	mov	r0, #-1
	b	.L543
	.fnend
	.size	mpi_buf_get_paddr, .-mpi_buf_get_paddr
	.align	1
	.global	venc_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_get_version, %function
venc_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L551
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r6, [r3, #140]
	ldr	r3, [r1, #48]	@ unaligned
	cmp	r3, #124
	beq	.L547
	movw	r3, #1628
	ldr	r2, .L551+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L551+8
	movs	r0, #4
	bl	vlog
	mov	r0, #-1
.L546:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L547:
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
	strb	r5, [r1, #52]
	strb	r5, [r1, #53]
	strb	r5, [r1, #54]
	strb	r5, [r1, #55]
	strb	r5, [r1, #88]
	strb	r5, [r1, #89]
	strb	r5, [r1, #90]
	strb	r5, [r1, #91]
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
	b	.L546
.L552:
	.align	2
.L551:
	.word	g_venc_dev
	.word	.LC41
	.word	.LANCHOR0+617
	.fnend
	.size	venc_get_version, .-venc_get_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_open, %function
venc_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r2, #-1
	mov	r4, r1
	movs	r0, #12
	mov	r1, #3520
	bl	kvmalloc_node
	str	r0, [r4, #128]
	cbnz	r0, .L554
	mov	r3, #2496
	ldr	r2, .L556
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L556+4
	movs	r0, #4
	bl	vlog
	mov	r0, #-1
.L553:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L554:
	ldr	r0, .L556+8
	bl	mpi_obj_ref
	movs	r0, #0
	b	.L553
.L557:
	.align	2
.L556:
	.word	.LC42
	.word	.LANCHOR0+634
	.word	g_venc_dev+4
	.fnend
	.size	venc_open, .-venc_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_dma_buf, %function
get_dma_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #4]
	add	r2, r3, #28
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
	bx	lr
	.fnend
	.size	get_dma_buf, .-get_dma_buf
	.align	1
	.global	venc_node_pp_get_result
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_get_result, %function
venc_node_pp_get_result:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r1
	ldr	r3, [r1, #4]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #40
	beq	.L560
	movw	r3, #2201
	ldr	r2, .L579
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L579+4
	movs	r0, #4
	bl	vlog
.L578:
	mov	r0, #-1
.L559:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L560:
	ldr	r6, [r1]	@ unaligned
	cmp	r6, #7
	ble	.L562
	movs	r3, #8
	ldr	r2, .L579+8
	strd	r6, r3, [sp, #4]
	movs	r1, #2
	movw	r3, #2206
	movs	r0, #4
	str	r3, [sp]
	ldr	r3, .L579+4
	bl	vlog
	b	.L578
.L562:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, .L579+12
	mov	r3, #1056
	mla	r3, r3, r6, r2
	ldr	r1, [r3, #2576]
	ldr	r9, [r3, #2580]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r0, [r3, #2532]
	mov	r8, r2
	cbz	r0, .L563
	ldr	r2, [r4, #8]	@ unaligned
	cbz	r2, .L563
	mov	r7, #264
	ldr	r3, [r3, #2588]
	mla	r7, r7, r6, r1
	movs	r1, #0
	str	r3, [r4, #20]	@ unaligned
	addw	r7, r7, #674
	add	r7, r8, r7, lsl #2
	ldr	r3, [r7, #8]
	ldr	r0, [r3, #484]
	bl	dma_buf_fd
	str	r0, [r4, #16]	@ unaligned
	ldr	r3, [r7, #8]
	ldr	r0, [r3, #484]
	bl	get_dma_buf
	ldr	r3, [r7, #8]
	movs	r1, #2
	ldr	r0, [r3, #484]
	bl	dma_buf_begin_cpu_access
.L563:
	mov	r3, #1056
	mla	r3, r3, r6, r8
	ldr	r2, [r3, #2536]
	cbz	r2, .L564
	ldr	r2, [r4, #12]	@ unaligned
	cbz	r2, .L564
	mov	r5, #264
	ldr	r2, [r3, #2596]
	mla	r5, r5, r6, r9
	str	r2, [r4, #24]	@ unaligned
	ldr	r2, [r3, #2600]
	add	r5, r5, #680
	add	r5, r8, r5, lsl #2
	str	r2, [r4, #28]	@ unaligned
	ldr	r2, [r5, #4]
	cbz	r2, .L565
	ldr	r3, [r3, #2592]
	movs	r1, #0
	str	r3, [r4, #36]	@ unaligned
	ldr	r3, [r5, #4]
	ldr	r0, [r3, #484]
	bl	dma_buf_fd
	str	r0, [r4, #32]	@ unaligned
	ldr	r3, [r5, #4]
	ldr	r0, [r3, #484]
	bl	get_dma_buf
	ldr	r3, [r5, #4]
	movs	r1, #2
	ldr	r0, [r3, #484]
	bl	dma_buf_begin_cpu_access
.L564:
	mov	r3, #1056
	movs	r0, #0
	mla	r6, r3, r6, r8
	str	r0, [r6, #2584]
	b	.L559
.L565:
	mov	r3, #-1
	strb	r2, [r4, #36]
	strb	r2, [r4, #37]
	strb	r2, [r4, #38]
	strb	r2, [r4, #39]
	strb	r3, [r4, #32]
	strb	r3, [r4, #33]
	strb	r3, [r4, #34]
	strb	r3, [r4, #35]
	b	.L564
.L580:
	.align	2
.L579:
	.word	.LC43
	.word	.LANCHOR0+644
	.word	.LC1
	.word	g_venc_dev
	.fnend
	.size	venc_node_pp_get_result, .-venc_node_pp_get_result
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	write_to_file, %function
write_to_file:
	.fnstart
	@ args = 4, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r3
	ldr	r3, .L595
	mov	r7, r2
	.pad #292
	sub	sp, sp, #292
	movs	r4, #0
	movs	r5, #0
	mov	r6, r0
	ldr	r2, [r3]
	mov	r9, r3
	strd	r4, [sp, #16]
	mov	r4, r1
	str	r2, [sp, #284]
	mul	r2, r8, r7
	add	r2, r2, r2, lsl #1
	add	r2, r2, r2, lsr #31
	asrs	r5, r2, #1
	cmp	r1, #0
	beq	.L588
	movs	r1, #10
	bl	strchr
	cbz	r0, .L583
	movs	r3, #0
	strb	r3, [r0]
.L583:
	movs	r1, #13
	mov	r0, r6
	bl	strchr
	cbz	r0, .L584
	movs	r3, #0
	strb	r3, [r0]
.L584:
	mov	r3, sp
	bic	r2, r3, #8160
	bic	r2, r2, #31
	mov	fp, #0
	ldr	r10, [r2, #8]
	str	fp, [r2, #8]
	.syntax unified
@ 73 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	dsb nsh
@ 0 "" 2
@ 74 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	isb 
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [sp, #328]
	mov	r1, #256
	str	r7, [r3]
	add	r0, sp, #28
	strd	r8, r2, [r3, #4]
	mov	r3, r6
	ldr	r2, .L595+4
	bl	snprintf
	mov	r2, #416
	movs	r1, #65
	ldr	r6, .L595+8
	add	r0, sp, #28
	bl	filp_open
	str	r0, [r6, #12]
	cbnz	r0, .L585
	ldr	r1, .L595+12
	ldr	r0, .L595+16
	bl	printk
	mov	r0, #-1
.L586:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	str	r10, [r3, #8]
	.syntax unified
@ 73 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	dsb nsh
@ 0 "" 2
@ 74 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	isb 
@ 0 "" 2
	.thumb
	.syntax unified
.L581:
	ldr	r2, [sp, #284]
	ldr	r3, [r9]
	cmp	r2, r3
	beq	.L587
	bl	__stack_chk_fail
.L585:
	add	r3, sp, #16
	mov	r2, r5
	mov	r1, r4
	bl	kernel_write
	mov	r1, fp
	ldr	r0, [r6, #12]
	bl	filp_close
	mov	r0, fp
	b	.L586
.L588:
	mov	r0, r1
	b	.L581
.L587:
	add	sp, sp, #292
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L596:
	.align	2
.L595:
	.word	__stack_chk_guard
	.word	.LC44
	.word	.LANCHOR1
	.word	.LANCHOR0+668
	.word	.LC45
	.fnend
	.size	write_to_file, .-write_to_file
	.align	1
	.global	mpi_buffer_queue_pop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buffer_queue_pop, %function
mpi_buffer_queue_pop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	bl	mpi_queue_pop_obj
	mov	r4, r0
	cbz	r0, .L597
	ldr	r5, [r0, #484]
	cbz	r5, .L597
	ldr	r3, .L608
	ldr	r3, [r3, #16]
	cbz	r3, .L597
	mov	r0, r5
	bl	dma_buf_vmap
	str	r0, [r5, #36]
	ldr	r0, .L608+4
	ldr	r1, [r4, #484]
	ldr	r3, [r4, #716]
	str	r3, [sp]
	ldr	r1, [r1, #36]
	ldrd	r2, r3, [r4, #668]
	ldr	r0, [r0]
	bl	write_to_file
	ldr	r0, [r4, #484]
	ldr	r1, [r0, #36]
	bl	dma_buf_vunmap
.L597:
	mov	r0, r4
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L609:
	.align	2
.L608:
	.word	.LANCHOR1
	.word	.LANCHOR2
	.fnend
	.size	mpi_buffer_queue_pop, .-mpi_buffer_queue_pop
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_thread_fn, %function
venc_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 424
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	.pad #444
	sub	sp, sp, #444
	ldr	r0, [r0, #84]
	bl	rkos_kthread_set_name
	adds	r3, r4, #4
	ldr	r2, .L703
	movs	r1, #5
	movs	r0, #4
	str	r3, [sp, #8]
	ldr	r3, [r4, #84]
	str	r3, [sp, #4]
	movw	r3, #2637
	str	r3, [sp]
	ldr	r3, .L703+4
	bl	vlog
.L611:
	bl	kthread_should_stop
	cbz	r0, .L655
	movs	r1, #4
	movs	r3, #2
	ldr	r2, .L703+8
	mov	r0, r1
	str	r3, [r4, #156]
	movw	r3, #2827
	str	r3, [sp]
	ldr	r3, .L703+4
	bl	vlog
	movs	r0, #0
	add	sp, sp, #444
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L655:
	add	r0, r4, #172
	bl	down
	ldr	r3, [r4, #156]
	cbz	r3, .L612
	movs	r0, #1
	bl	msleep
	b	.L611
.L612:
	addw	r3, r4, #2504
	str	r3, [sp, #20]
	mov	r0, r3
	bl	mutex_lock
	ldr	r7, [r4, #128]
.L702:
	subs	r7, r7, #84
	add	r2, r4, #128
	add	r3, r7, #84
	cmp	r3, r2
	bne	.L656
	ldr	r3, .L703+12
	ldr	r5, [r3]
	cbnz	r5, .L650
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, .L703+16
	add	r6, r4, #1416
	ldr	r10, .L703+20
	movw	r9, #2815
.L654:
	ldr	r3, [r7], #4
	cbz	r3, .L652
	ldr	r3, [r7, #828]
	adds	r3, r3, #1
	bne	.L652
	ldr	r3, .L703+4
	mov	r2, r10
	strd	r9, r5, [sp]
	movs	r1, #5
	movs	r0, #4
	bl	vlog
	ldrd	r2, [r6, #128]
	mov	r0, r5
	strd	r2, [sp]
	ldrd	r2, [r6]
	bl	mpp_vcodec_run_task
	cbnz	r0, .L652
	bl	set_wrap_begin
	movs	r3, #1
	str	r3, [r7, #828]
.L652:
	adds	r5, r5, #1
	adds	r6, r6, #8
	cmp	r5, #16
	bne	.L654
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L650:
	ldr	r0, [sp, #20]
	bl	mutex_unlock
	b	.L611
.L704:
	.align	2
.L703:
	.word	.LC46
	.word	.LANCHOR0+682
	.word	.LC47
	.word	g_venc_dev+43960
	.word	g_venc_dev+444
	.word	.LC36
.L656:
	movs	r5, #0
.L616:
	mov	r0, r5
	bl	get_pp_node
	cmp	r7, r0
	beq	.L615
	adds	r5, r5, #1
	cmp	r5, #16
	bne	.L616
	mov	r5, #-1
.L615:
	ldr	r3, [r7, #316]
	ldr	r0, [r3]
	bl	mpi_queue_pop_obj
	mov	r6, r0
	cmp	r0, #0
	beq	.L617
	mov	r3, #1056
	ldrd	r2, r1, [r0, #668]
	mla	r3, r3, r5, r4
	ldr	r0, [r3, #2544]
	cmp	r2, r0
	bhi	.L618
	ldr	r3, [r3, #2548]
	cmp	r3, r1
	bcc	.L618
	ldr	r8, [r6, #484]
	cmp	r8, #0
	beq	.L619
	ldr	r3, .L705
	ldr	r3, [r3, #20]
	cbz	r3, .L619
	mov	r0, r8
	bl	dma_buf_vmap
	str	r0, [r8, #36]
	ldr	r0, .L705+4
	ldr	r1, [r6, #484]
	ldr	r3, [r6, #716]
	str	r3, [sp]
	ldr	r1, [r1, #36]
	ldrd	r2, r3, [r6, #668]
	ldr	r0, [r0, #4]
	bl	write_to_file
	ldr	r0, [r6, #484]
	ldr	r1, [r0, #36]
	bl	dma_buf_vunmap
.L619:
	mov	r3, #1056
	ldr	r1, [r6, #668]
	mla	r3, r3, r5, r4
	ldr	r2, [r3, #2516]
	cmp	r1, r2
	bne	.L620
	ldr	r2, [r6, #672]
	ldr	r3, [r3, #2520]
	cmp	r2, r3
	beq	.L621
.L620:
	mov	r2, #1056
	movs	r1, #0
	muls	r2, r5, r2
	mov	r0, r5
	adds	r3, r4, r2
	addw	r2, r2, #2516
	add	r2, r2, r4
	str	r1, [r3, #3560]
	ldr	r1, [r6, #668]
	str	r1, [r3, #2516]
	ldr	r1, [r6, #672]
	str	r1, [r3, #2520]
	movs	r1, #17
	bl	vepu_pp_control
.L621:
	mov	r8, #1056
	movs	r3, #6
	mla	r8, r8, r5, r4
	str	r3, [sp, #180]
	movs	r1, #16
	mov	r0, r5
	str	r6, [sp, #196]
	ldr	r3, [r8, #3560]
	adds	r2, r3, #1
	str	r2, [r8, #3560]
	str	r3, [sp, #176]
	add	r2, sp, #176
	ldr	r3, [r8, #2680]
	str	r3, [sp, #184]
	movs	r3, #1
	strd	r3, r3, [sp, #188]
	bl	vepu_pp_control
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r8, #2576]
	add	r10, r2, #1
	ldr	r2, [r8, #2580]
	cmp	r10, #5
	add	r9, r2, #1
	it	ge
	movge	r10, #0
	cmp	r9, #5
	it	ge
	movge	r9, #0
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8, #2532]
	cmp	r3, #0
	beq	.L624
	mov	r3, #264
	mla	r3, r3, r5, r10
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #2704]
	str	r3, [sp, #120]
	ldr	r3, [r8, #3420]
	usat	r3, #2, r3
	str	r3, [sp, #124]
	ldr	r3, [r8, #3416]
	cmp	r3, #0
	ble	.L625
	ldr	r2, [r8, #3412]
	cmp	r2, #0
	ble	.L625
	movw	r1, #4095
	cmp	r2, r1
	ite	le
	strle	r2, [sp, #128]
	strgt	r1, [sp, #128]
	cmp	r3, #4
	it	ge
	movge	r3, #4
.L698:
	str	r3, [sp, #132]
	mov	r3, #1056
	mla	r3, r3, r5, r4
	movs	r1, #32
	mov	r0, r5
	ldr	r2, [r3, #2692]
	str	r2, [sp, #136]
	ldr	r2, [r3, #3424]
	str	r2, [sp, #140]
	ldr	r2, [r3, #3428]
	str	r2, [sp, #144]
	ldr	r2, [r3, #3432]
	ldr	r3, [r3, #3436]
	str	r2, [sp, #148]
	add	r2, sp, #120
	str	r3, [sp, #152]
	bl	vepu_pp_control
.L624:
	mov	r2, #1056
	mla	r2, r2, r5, r4
	ldr	r3, [r2, #2536]
	cmp	r3, #0
	beq	.L629
	ldr	r0, [r2, #2516]
	ldr	r3, [r2, #2520]
	ldr	r1, [r2, #2696]
	ldr	r2, [r2, #2540]
	muls	r3, r0, r3
	cmp	r2, #0
	beq	.L630
	asrs	r3, r3, #8
.L631:
	cmp	r1, #6
	bgt	.L632
	mov	r0, #1056
	movs	r2, #230
	mla	r0, r0, r5, r4
	muls	r2, r3, r2
	ldr	r0, [r0, #3484]
	cmp	r0, r2
	it	gt
	addgt	r1, r1, #1
.L632:
	muls	r3, r1, r3
	movs	r0, #1
	movs	r2, #12
	strd	r0, r2, [sp, #28]
	mov	r2, #1056
	movs	r1, #48
	mla	r2, r2, r5, r4
	mov	r0, r5
	asrs	r3, r3, #3
	str	r3, [sp, #36]
	mov	r3, #264
	mla	r3, r3, r5, r9
	add	r3, r4, r3, lsl #2
	ldr	r3, [r3, #2724]
	str	r3, [sp, #40]
	ldr	r3, [r2, #3448]
	cmp	r3, #4
	it	ge
	movge	r3, #4
	bic	r3, r3, r3, asr #31
	str	r3, [sp, #44]
	ldr	r3, [r2, #3452]
	add	r2, sp, #28
	usat	r3, #14, r3
	str	r3, [sp, #48]
	bl	vepu_pp_control
.L629:
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r2, [r3, #2524]
	cbz	r2, .L633
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r3, #3400]
	movs	r3, #132
	mla	r3, r3, r5, r1
	add	r3, r4, r3, lsl #3
	ldr	r1, [r3, #3268]
	str	r1, [sp, #308]
	movs	r1, #0
	str	r1, [r3, #3272]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #64
	add	r2, sp, #308
	mov	r0, r5
	bl	vepu_pp_control
.L633:
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r3, [r3, #2528]
	cbz	r3, .L634
	add	r2, sp, #240
	movs	r1, #80
	mov	r0, r5
	bl	vepu_pp_control
.L634:
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r2, [r3, #2532]
	cbnz	r2, .L635
	ldr	r2, [r3, #2536]
	cbnz	r2, .L635
	ldr	r2, [r3, #2524]
	cbnz	r2, .L635
	ldr	r3, [r3, #2528]
	cmp	r3, #0
	beq	.L636
.L635:
	mov	r8, #1056
	add	r2, sp, #176
	mul	r8, r8, r5
	movs	r1, #96
	mov	r0, r5
	bl	vepu_pp_control
	add	r3, r4, r8
	ldr	r3, [r3, #2536]
	cbz	r3, .L636
	addw	r2, r8, #3480
	movs	r1, #112
	add	r2, r2, r4
	mov	r0, r5
	bl	vepu_pp_control
	addw	r3, r8, #3556
	add	r3, r3, r4
	movs	r2, #9
.L638:
	ldr	r1, [r3, #-4]
	subs	r2, r2, #1
	str	r1, [r3], #-4
	bne	.L638
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r1, [r3, #3484]
	str	r1, [r3, #3520]
	ldr	r3, [r3, #3480]
	cbz	r3, .L636
	movs	r2, #95
	movs	r3, #105
	muls	r2, r1, r2
	addw	r8, r8, #3524
	muls	r1, r3, r1
	add	r8, r8, r4
	movs	r0, #1
	mov	ip, #100
.L641:
	ldr	r3, [r8], #4
	mul	r3, ip, r3
	cmp	r2, r3
	bgt	.L639
	cmp	r3, r1
	ble	.L640
	b	.L706
.L707:
	.align	2
.L705:
	.word	.LANCHOR1
	.word	.LANCHOR2
.L706:
.L639:
	mov	r3, #1056
	movs	r2, #0
	mla	r3, r3, r5, r4
	str	r2, [r3, #3480]
.L636:
	mov	r8, #1056
	mul	r8, r8, r5
	add	fp, r4, r8
	ldr	r3, [fp, #2528]
	cbz	r3, .L642
	add	r2, sp, #72
	movs	r1, #128
	mov	r0, r5
	bl	vepu_pp_control
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	lr, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [fp, #3264]
	addw	r3, r8, #2744
	movs	r1, #52
	add	fp, sp, #120
	mla	r3, r1, r2, r3
	add	r2, sp, #72
	add	r3, r3, r4
.L643:
	mov	ip, r2
	adds	r3, r3, #8
	ldmia	ip!, {r0, r1}
	cmp	ip, fp
	str	r0, [r3, #-8]	@ unaligned
	mov	r2, ip
	str	r1, [r3, #-4]	@ unaligned
	bne	.L643
	mov	r1, #1056
	movs	r0, #52
	muls	r1, r5, r1
	adds	r2, r4, r1
	ldr	r3, [r2, #3264]
	mla	r3, r0, r3, r1
	ldr	r1, [r6, #716]
	add	r3, r3, r4
	str	r1, [r3, #2792]
	ldr	r3, [r2, #3264]
	adds	r3, r3, #1
	cmp	r3, #9
	it	gt
	movgt	r3, #0
	str	r3, [r2, #3264]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, lr	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L642:
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r2, [r3, #2524]
	cbz	r2, .L646
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r3, #3400]
	mov	ip, #132
	ldr	r1, [r6, #716]
	mla	r2, ip, r5, r2
	add	r2, r4, r2, lsl #3
	str	r1, [r2, #3272]
	ldr	r2, [r3, #3400]
	adds	r2, r2, #1
	cmp	r2, #1
	it	gt
	movgt	r2, #0
	str	r2, [r3, #3400]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L646:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, #1056
	addw	r1, r8, #3480
	mla	r5, r3, r5, r4
	add	r1, r1, r4
	movs	r3, #1
	add	r0, r1, #40
	str	r3, [r5, #2584]
	addw	r3, r8, #2596
	add	r3, r3, r4
	str	r10, [r5, #2576]
	str	r9, [r5, #2580]
.L649:
	ldr	r5, [r1], #4	@ unaligned
	cmp	r1, r0
	str	r5, [r3], #4	@ unaligned
	bne	.L649
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	addw	r0, r8, #3564
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r0, r4
	bl	__wake_up
.L701:
	ldr	r0, [r7, #112]
	movs	r2, #0
	mov	r1, r6
	bl	remove_user_from_buf
	mov	r0, r6
	bl	mpi_buf_unref
.L617:
	ldr	r7, [r7, #84]
	b	.L702
.L625:
	mov	r3, #1056
	mla	r3, r3, r5, r4
	ldr	r3, [r3, #2700]
	cmp	r3, #1
	bne	.L627
	movs	r3, #70
	str	r3, [sp, #128]
	movs	r3, #3
	b	.L698
.L627:
	cmp	r3, #2
	itett	ne
	movne	r3, #30
	moveq	r2, #50
	strne	r3, [sp, #128]
	movne	r3, #1
	it	eq
	streq	r2, [sp, #128]
	b	.L698
.L630:
	asrs	r3, r3, #4
	b	.L631
.L640:
	adds	r0, r0, #1
	cmp	r0, #10
	bne	.L641
	b	.L636
.L618:
	strd	r2, r1, [sp, #4]
	movw	r3, #2803
	ldr	r2, .L708
	movs	r1, #2
	str	r3, [sp]
	movs	r0, #4
	ldr	r3, .L708+4
	bl	vlog
	b	.L701
.L709:
	.align	2
.L708:
	.word	.LC48
	.word	.LANCHOR0+682
	.fnend
	.size	venc_thread_fn, .-venc_thread_fn
	.align	1
	.global	venc_node_pp_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_node_pp_create, %function
venc_node_pp_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r7, .L743
	.pad #84
	sub	sp, sp, #84
	ldr	r10, [r0, #128]
	ldr	r9, [r1, #4]	@ unaligned
	ldr	r3, [r7, #144]
	cbz	r3, .L711
	cmn	r3, #4096
	bls	.L712
.L711:
	movs	r3, #0
	mov	r2, #-1
	str	r3, [r7, #156]
	ldr	r1, .L743
	ldr	r3, .L743+4
	ldr	r0, .L743+8
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L713
	bl	wake_up_process
.L713:
	movs	r1, #4
	str	r5, [r7, #144]
	mov	r3, #2000
	str	r5, [sp, #4]
	str	r3, [sp]
	mov	r0, r1
	ldr	r3, .L743+12
	ldr	r2, .L743+16
	bl	vlog
.L712:
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r3, #68
	beq	.L714
	movw	r3, #2004
	ldr	r2, .L743+20
	str	r3, [sp]
	ldr	r3, .L743+12
.L740:
	movs	r1, #2
	movs	r0, #4
	bl	vlog
	b	.L741
.L714:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #7
	ble	.L716
	movs	r2, #8
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movs	r0, #4
	mov	r3, #2008
	ldr	r2, .L743+24
	str	r3, [sp]
	ldr	r3, .L743+12
	bl	vlog
.L741:
	mov	r6, #-1
.L710:
	mov	r0, r6
	add	sp, sp, #84
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L716:
	mov	r0, r9
	bl	get_pp_node
	mov	r5, r0
	cbz	r0, .L717
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L743+28
	movs	r0, #4
	str	r3, [sp, #4]
	movw	r3, #2012
	str	r3, [sp]
	ldr	r3, .L743+12
	bl	vlog
	b	.L741
.L717:
	mov	r8, #1056
	ldr	r2, .L743+32
	mul	r8, r8, r9
	ldr	r1, .L743+36
	add	r6, r7, r8
	addw	r0, r8, #3564
	add	r0, r0, r7
	add	fp, r8, #2704
	bl	__init_waitqueue_head
	str	r5, [r6, #3560]
	ldr	r3, [r4, #16]	@ unaligned
	add	fp, fp, r7
	sbfx	r3, r3, #1, #29
	adds	r3, r3, #3
	asrs	r3, r3, #2
	lsls	r3, r3, #6
	str	r3, [r6, #2588]
.L720:
	ldr	r1, .L743+40
	ldr	r0, [r6, #2588]
	bl	mpi_buf_alloc_with_name
	str	r0, [fp], #4
	cbnz	r0, .L718
	movw	r3, #2026
.L742:
	str	r3, [sp]
	ldr	r2, .L743+44
	ldr	r3, .L743+12
	b	.L740
.L718:
	ldr	r0, [r0, #656]
	cbnz	r0, .L719
	movw	r3, #2030
	b	.L742
.L719:
	ldr	r2, [r6, #2588]
	movs	r1, #0
	adds	r5, r5, #1
	bl	memset
	cmp	r5, #5
	bne	.L720
	ldr	r3, [r4, #40]	@ unaligned
	cbnz	r3, .L721
.L727:
	ldr	r3, [r4, #28]	@ unaligned
	cmp	r3, #0
	bne	.L722
.L723:
	ldr	r3, [r4, #12]	@ unaligned
	add	r1, sp, #20
	ldr	r0, [r4, #4]	@ unaligned
	movs	r5, #1
	str	r5, [sp, #44]
	str	r3, [sp, #20]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #48]
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #52]
	ldr	r3, [r4, #36]	@ unaligned
	str	r3, [sp, #36]
	ldr	r3, [r4, #40]	@ unaligned
	str	r3, [sp, #40]
	ldr	r3, [r4, #28]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r4, #32]	@ unaligned
	str	r3, [sp, #32]
	bl	vepu_pp_create_chn
	mov	r6, r0
	cmp	r0, #0
	beq	.L730
	movw	r3, #2074
	b	.L742
.L721:
	ldr	r3, [r4, #16]	@ unaligned
	mov	r5, #1056
	mla	r5, r5, r9, r7
	adds	r3, r3, #31
	mov	fp, #0
	asrs	r3, r3, #5
	lsls	r3, r3, #6
	str	r3, [r6, #2592]
	addw	r6, r8, #2724
	add	r6, r6, r7
.L726:
	ldr	r1, .L743+48
	ldr	r0, [r5, #2592]
	bl	mpi_buf_alloc_with_name
	str	r0, [r6], #4
	cbnz	r0, .L724
	mov	r3, #2040
	b	.L742
.L724:
	ldr	r0, [r0, #656]
	cbnz	r0, .L725
	movw	r3, #2044
	b	.L742
.L725:
	ldr	r2, [r5, #2592]
	movs	r1, #0
	add	fp, fp, #1
	bl	memset
	cmp	fp, #5
	bne	.L726
	b	.L727
.L722:
	ldr	r5, [r4, #12]	@ unaligned
	mov	r6, #1056
	ldr	r1, .L743+52
	sbfx	r5, r5, #1, #29
	adds	r5, r5, #3
	mla	r6, r6, r9, r7
	asrs	r5, r5, #2
	adds	r5, r5, #7
	asrs	r3, r5, #3
	ldr	r5, [r4, #16]	@ unaligned
	sbfx	r5, r5, #1, #29
	adds	r5, r5, #15
	asrs	r5, r5, #4
	muls	r5, r3, r5
	lsls	r5, r5, #6
	mov	r0, r5
	bl	mpi_buf_alloc_with_name
	str	r0, [r6, #3268]
	cbnz	r0, .L728
.L729:
	movw	r3, #2057
	b	.L742
.L728:
	ldr	r1, .L743+52
	mov	r0, r5
	bl	mpi_buf_alloc_with_name
	str	r0, [r6, #3276]
	cmp	r0, #0
	bne	.L723
	b	.L729
.L730:
	mov	r3, r0
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	ldr	r0, .L743+56
	bl	mpi_dev_create_node_with_params
	mov	fp, r0
	cbnz	r0, .L731
	mov	r3, #2080
	ldr	r2, .L743+60
	str	r3, [sp]
	ldr	r3, .L743+12
	b	.L740
.L731:
	mov	r1, r5
	bl	mpi_node_enable_auto_streamon
	ldr	r3, .L743+64
	add	ip, r3, r8
	add	r5, sp, #20
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	r5!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	r5, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	addw	r0, r8, #2636
	movs	r2, #68
	mov	r1, r4
	add	r0, r0, r7
	bl	memcpy
	add	r0, r8, #3440
	movs	r2, #40
	mov	r1, r6
	add	r0, r0, r7
	bl	memset
	mov	r3, #1056
	mla	r7, r3, r9, r7
	movs	r0, #21
	movs	r3, #64
	str	r3, [r7, #3452]
	movs	r3, #2
	str	r3, [r7, #3448]
	mov	r3, fp
	ldr	r2, [r4, #4]	@ unaligned
	ldr	r1, [r4]	@ unaligned
	bl	vsys_add_node_to_map
	movs	r3, #21
	str	r3, [r10]
	ldr	r3, [r4]	@ unaligned
	str	r3, [r10, #4]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [r10, #8]
	b	.L710
.L744:
	.align	2
.L743:
	.word	g_venc_dev
	.word	.LC6
	.word	venc_thread_fn
	.word	.LANCHOR0+697
	.word	.LC49
	.word	.LC50
	.word	.LC1
	.word	.LC51
	.word	.LANCHOR1+24
	.word	.LC52
	.word	.LC53
	.word	.LC54
	.word	.LC55
	.word	.LC56
	.word	g_venc_dev+4
	.word	.LC57
	.word	g_venc_dev+2516
	.fnend
	.size	venc_node_pp_create, .-venc_node_pp_create
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	kzalloc.constprop.19, %function
kzalloc.constprop.19:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #3520
	b	__kmalloc
	.fnend
	.size	kzalloc.constprop.19, .-kzalloc.constprop.19
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_create_ctx, %function
venc_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r0, #4
	bl	kzalloc.constprop.19
	mov	r4, r0
	cbz	r0, .L746
	ldr	r2, .L751
	movs	r1, #4
	movs	r0, #1
	bl	mpi_queue_create
	mov	r5, r0
	str	r0, [r4]
	cbnz	r0, .L746
	mov	r0, r4
	mov	r4, r5
	bl	kfree
.L746:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L752:
	.align	2
.L751:
	.word	mpi_obj_unref
	.fnend
	.size	venc_create_ctx, .-venc_create_ctx
	.align	1
	.global	vcodec_create_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_create_dev, %function
vcodec_create_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	movs	r0, #140
	mov	r5, r1
	bl	kzalloc.constprop.19
	mov	r4, r0
	cbz	r0, .L753
	ldr	r3, [r5]
	mov	r2, r6
	movs	r1, #8
	str	r3, [r0, #104]
	ldr	r3, [r5, #8]
	str	r3, [r0, #116]
	ldr	r3, [r5, #4]
	str	r3, [r0, #112]
	bl	mpi_dev_register
.L753:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
	.fnend
	.size	vcodec_create_dev, .-vcodec_create_dev
	.align	1
	.global	to_osd_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_stride, %function
to_osd_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L772
	cmp	r0, r3
	bhi	.L759
	subs	r3, r3, #3
	cmp	r0, r3
	bcs	.L763
	sub	r0, r0, #65536
	subs	r0, r0, #10
	cmp	r0, #3
.L771:
	bhi	.L767
	movs	r0, #0
	movs	r3, #2
.L760:
	muls	r1, r3, r1
	asr	r0, r1, r0
	bx	lr
.L759:
	cmp	r0, #131072
	beq	.L765
	bhi	.L762
	ldr	r3, .L772+4
	cmp	r0, r3
	b	.L771
.L762:
	cmp	r0, #131074
	bne	.L767
	movs	r0, #3
.L769:
	movs	r3, #1
	b	.L760
.L763:
	movs	r0, #0
	movs	r3, #4
	b	.L760
.L765:
	movs	r0, #2
	b	.L769
.L767:
	mov	r0, #-1
	bx	lr
.L773:
	.align	2
.L772:
	.word	65555
	.word	65559
	.fnend
	.size	to_osd_stride, .-to_osd_stride
	.align	1
	.global	set_color_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_color_lut, %function
set_color_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	r4, #20
	ldr	r3, [r1]
	mvn	r7, #106
	ldr	r2, [r1, #4]
	.pad #68
	sub	sp, sp, #68
	ubfx	ip, r3, #16, #8
	ubfx	lr, r3, #8, #8
	uxtb	r3, r3
	ubfx	r8, r2, #16, #8
	ubfx	r9, r2, #8, #8
	uxtb	r2, r2
	mul	r1, r4, r3
	mvn	fp, #42
	muls	r4, r2, r4
	mvn	r6, #84
	add	r1, r1, #32768
	mov	r10, #150
	add	r1, r1, ip, lsl #7
	movs	r5, #77
	add	r4, r4, #32768
	mla	r1, r7, lr, r1
	add	r4, r4, r8, lsl #7
	mla	r7, r7, r9, r4
	lsls	r4, r2, #7
	add	r4, r4, #32768
	asrs	r1, r1, #8
	str	r1, [sp, #40]
	strb	r1, [r0]
	lsls	r1, r3, #7
	add	r1, r1, #32768
	asrs	r7, r7, #8
	mla	r1, fp, ip, r1
	mla	fp, fp, r8, r4
	mla	r1, r6, lr, r1
	mla	fp, r6, r9, fp
	movs	r6, #77
	asrs	r1, r1, #8
	str	r1, [sp, #36]
	strb	r1, [r0, #1]
	mul	r1, r10, lr
	strb	r7, [r0, #3]
	mul	r10, r10, r9
	asr	r4, fp, #8
	mla	r1, r5, ip, r1
	movs	r5, #29
	mla	r10, r6, r8, r10
	strb	r4, [r0, #4]
	mla	r1, r5, r3, r1
	mla	r5, r5, r2, r10
	asrs	r1, r1, #8
	strb	r1, [r0, #2]
	asrs	r5, r5, #8
	strb	r5, [r0, #5]
	strd	r4, r7, [sp, #52]
	str	r5, [sp, #48]
	ldrb	r4, [r0, #7]	@ zero_extendqisi2
	str	r1, [sp, #32]
	str	r4, [sp, #44]
	ldrb	r1, [r0, #6]	@ zero_extendqisi2
	movs	r0, #4
	strd	lr, r3, [sp, #8]
	movw	r3, #526
	strd	r8, r9, [sp, #16]
	strd	r2, r1, [sp, #24]
	movs	r1, #5
	str	ip, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L775
	ldr	r3, .L775+4
	bl	vlog
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L776:
	.align	2
.L775:
	.word	.LC58
	.word	.LANCHOR0+717
	.fnend
	.size	set_color_lut, .-set_color_lut
	.align	1
	.global	set_invert_buffer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_invert_buffer, %function
set_invert_buffer:
	.fnstart
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldrd	r4, r6, [sp, #56]
	strd	r1, r2, [sp]
	str	r3, [sp, #8]
	cmp	r4, #0
	beq	.L778
	cmp	r0, #0
	beq	.L795
	cmp	r6, #0
	beq	.L796
	ldr	r3, [r4, #656]
	cmp	r3, #0
	beq	.L797
	ldr	r2, [r6, #12]
	cbz	r2, .L779
	cmp	r2, #1
	bne	.L780
	mov	ip, #0
	mov	lr, r0
	mov	r8, ip
	str	r2, [sp, #12]
.L781:
	ldr	r2, [sp, #4]
	cmp	r8, r2
	bge	.L780
	mov	r10, lr
	movs	r5, #0
	b	.L794
.L779:
	mov	lr, r0
	mov	r8, r2
.L782:
	ldr	r1, [sp, #4]
	cmp	r8, r1
	bge	.L780
	mov	r10, lr
	mov	ip, #0
	b	.L788
.L786:
	add	r9, r2, ip, lsr #3
	and	r5, ip, #7
	movs	r1, #1
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	lsl	r5, r1, r5
	ldr	r7, [r6, #8]
	ldrsb	r1, [r3, r9]
	add	ip, ip, #1
	sxtb	r5, r5
	cmp	fp, r7
	ite	cc
	orrcc	r1, r1, r5
	biccs	r1, r1, r5
	strb	r1, [r3, r9]
.L788:
	ldr	r1, [sp]
	cmp	ip, r1
	blt	.L786
	add	lr, lr, r1
	ldr	r1, [sp, #8]
	add	r8, r8, #1
	add	r2, r2, r1
	b	.L782
.L792:
	ldr	r2, [sp, #12]
	add	r9, ip, r5, lsr #3
	and	r1, r5, #7
	ldrb	fp, [r10], #1	@ zero_extendqisi2
	ldr	r7, [r6, #8]
	adds	r5, r5, #1
	lsl	r1, r2, r1
	ldrsb	r2, [r3, r9]
	cmp	fp, r7
	sxtb	r1, r1
	ite	hi
	orrhi	r2, r2, r1
	bicls	r2, r2, r1
	strb	r2, [r3, r9]
.L794:
	ldr	r2, [sp]
	cmp	r5, r2
	blt	.L792
	add	lr, lr, r2
	ldr	r2, [sp, #8]
	add	r8, r8, #1
	add	ip, ip, r2
	b	.L781
.L780:
	bl	kfree
	ldr	r1, [r4, #656]
	ldr	r0, [r4, #484]
	bl	dma_buf_vunmap
	movs	r3, #0
	str	r3, [r4, #656]
.L778:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L795:
	mov	r4, r0
	b	.L778
.L796:
	mov	r4, r6
	b	.L778
.L797:
	mov	r4, r3
	b	.L778
	.fnend
	.size	set_invert_buffer, .-set_invert_buffer
	.align	1
	.global	create_lingt_lut
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	create_lingt_lut, %function
create_lingt_lut:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	bl	kzalloc.constprop.19
	cbnz	r0, .L807
.L803:
	pop	{r4, pc}
.L805:
	strb	r3, [r0, r3]
	adds	r3, r3, #1
.L804:
	cmp	r3, r4
	blt	.L805
	b	.L803
.L807:
	movs	r3, #0
	b	.L804
	.fnend
	.size	create_lingt_lut, .-create_lingt_lut
	.global	__aeabi_uidiv
	.align	1
	.global	to_osd_invert_cfg
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_osd_invert_cfg, %function
to_osd_invert_cfg:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	mov	r4, r0
	ldr	r7, [r1, #12]
	mov	r6, r1
	ldr	r5, [r1, #72]
	ldr	r0, [r7, #40]
	subs	r3, r5, #1
	mov	r1, r5
	add	r3, r3, r0
	rsbs	r0, r5, #0
	ands	r0, r0, r3
	bl	__aeabi_uidiv
	ldr	r1, [r6, #76]
	subs	r3, r1, #1
	mov	r8, r0
	ldr	r0, [r7, #44]
	add	r7, r8, #7
	add	r3, r3, r0
	rsbs	r0, r1, #0
	ands	r0, r0, r3
	asrs	r7, r7, #3
	bl	__aeabi_uidiv
	cmp	r5, #32
	mov	r9, r0
	mul	r10, r0, r8
	beq	.L809
	cmp	r5, #64
	beq	.L810
	cmp	r5, #16
	bne	.L811
	movs	r3, #0
.L815:
	str	r3, [r4, #20]
.L812:
	movs	r3, #0
	movs	r2, #1
	str	r3, [r4, #8]
	mov	r0, r10
	strd	r2, r2, [r4]
	strd	r3, r3, [r4, #12]
	str	r7, [r4, #24]
	bl	create_lingt_lut
	cbnz	r0, .L813
	mov	r3, #628
	ldr	r2, .L816
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L816+4
	movs	r0, #4
	bl	vlog
.L808:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L809:
	movs	r3, #1
	b	.L815
.L810:
	movs	r3, #3
	b	.L815
.L811:
	ldr	r0, .L816+8
	bl	printk
	b	.L812
.L813:
	add	r3, r6, #72
	str	r3, [sp, #4]
	ldr	r3, [r6, #16]
	mov	r2, r9
	mov	r1, r8
	str	r3, [sp]
	mov	r3, r7
	bl	set_invert_buffer
	str	r0, [r4, #32]
	b	.L808
.L817:
	.align	2
.L816:
	.word	.LC60
	.word	.LANCHOR0+731
	.word	.LC59
	.fnend
	.size	to_osd_invert_cfg, .-to_osd_invert_cfg
	.align	1
	.global	set_osd_data
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	set_osd_data, %function
set_osd_data:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r3, [r1, #144]
	.pad #20
	sub	sp, sp, #20
	mov	r9, r1
	cbnz	r3, .L819
	str	r3, [r0, #4]
.L818:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L819:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	str	r3, [sp, #12]
	ldr	r4, [r1, #120]
	movs	r6, #0
	ldr	r10, .L890+52
	subs	r4, r4, #4
.L821:
	adds	r3, r4, #4
	add	r2, r9, #120
	cmp	r3, r2
	bne	.L846
	ldr	r3, [sp, #12]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	str	r6, [r5, #4]
	b	.L818
.L846:
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #1756]
	cmp	r3, #0
	beq	.L822
	movs	r3, #140
	ldr	r2, [r4, #20]
	mla	r3, r3, r6, r5
	adds	r2, r2, #0
	it	ne
	movne	r2, #1
	str	r2, [r3, #8]
	ldr	r2, [r4, #28]
	str	r2, [r3, #28]
	ldr	r2, [r4, #32]
	str	r2, [r3, #32]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #28]
	ldr	r2, [r2, #40]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #36]
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #32]
	ldr	r2, [r2, #44]
	add	r2, r2, r1
	subs	r2, r2, #1
	str	r2, [r3, #40]
	ldr	r2, [r4, #12]
	ldr	r0, [r2, #1756]
	str	r0, [r3, #136]
	cbz	r0, .L823
	bl	mpi_obj_ref
.L823:
	ldr	r3, [r4, #12]
	ldrd	r0, r1, [r3, #36]
	bl	to_osd_stride
	movs	r3, #140
	mla	r3, r3, r6, r5
	str	r0, [r3, #44]
	ldr	r3, [r4, #12]
	ldr	r2, [r3, #36]
	ldr	r3, .L890
	cmp	r2, r3
	bhi	.L824
	subs	r3, r3, #3
	cmp	r2, r3
	sub	r3, r3, #6
	bcs	.L825
	cmp	r2, r3
	bcc	.L848
	adds	r3, r3, #1
	cmp	r2, r3
	bls	.L849
	ldr	r1, .L890+4
	adds	r3, r3, #3
	cmp	r2, r1
	it	hi
	movhi	r3, #-1
.L825:
	movs	r7, #140
	movs	r2, #0
	mla	r1, r7, r6, r5
	str	r3, [r1, #20]
	movs	r3, #1
	add	fp, r6, r3
	strd	r2, r3, [r1, #12]
	ldrd	r1, r0, [r4, #36]
	mul	r7, r7, fp
	add	r8, r5, r7
	strb	r2, [r5, r7]
	strb	r0, [r8, #6]
	strb	r2, [r8, #1]
	strb	r2, [r8, #2]
	strb	r2, [r8, #3]
	strb	r2, [r8, #4]
	strb	r2, [r8, #5]
	strb	r1, [r8, #7]
	ldr	r1, [r4, #12]
	ldr	r0, .L890+8
	ldr	r1, [r1, #36]
	cmp	r1, r0
	bhi	.L827
	cmp	r1, r10
	bcs	.L862
	subs	r0, r0, #6
	cmp	r1, r0
	beq	.L828
	bhi	.L829
	subs	r0, r0, #2
	cmp	r1, r0
	beq	.L828
	ldr	r3, .L890+12
	cmp	r1, r3
	beq	.L862
.L830:
	ldr	r0, .L890+16
	bl	printk
	mov	r3, #-1
	b	.L828
.L824:
	ldr	r3, .L890+20
	cmp	r2, r3
	bhi	.L826
	ldr	r0, .L890+24
	subs	r3, r3, #9
	ldr	r1, .L890+28
	cmp	r2, r0
	it	cc
	movcc	r3, r1
	b	.L825
.L826:
	cmp	r2, #131072
	beq	.L852
	cmp	r2, #131074
	ite	eq
	moveq	r3, #18
	movne	r3, #-1
	b	.L825
.L848:
	mov	r3, #-1
	b	.L825
.L849:
	ldr	r3, .L890+28
	b	.L825
.L852:
	movs	r3, #17
	b	.L825
.L829:
	ldr	r0, .L890+4
	cmp	r1, r0
	beq	.L862
	ldr	r2, .L890+32
.L888:
	cmp	r1, r2
	bne	.L830
	b	.L828
.L827:
	ldr	r0, .L890+24
	cmp	r1, r0
	bhi	.L831
	ldr	r3, .L890+36
	cmp	r1, r3
	ite	cs
	movcs	r3, #0
	movcc	r3, #1
.L828:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r3, [r2, #24]
	ldr	r3, [r4, #12]
	ldr	r3, [r3, #36]
	cmp	r3, r10
	bhi	.L832
	ldr	r2, .L890+32
	cmp	r3, r2
	bcs	.L864
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #3
	bhi	.L834
.L864:
	movs	r3, #1
	b	.L833
.L831:
	cmp	r1, #131072
	beq	.L862
	cmp	r1, #131074
	beq	.L862
	ldr	r2, .L890+20
	b	.L888
.L862:
	mov	r3, r2
	b	.L828
.L832:
	cmp	r3, #131072
	beq	.L866
	bhi	.L835
	ldr	r2, .L890+20
	cmp	r3, r2
	bhi	.L834
.L866:
	movs	r3, #0
	b	.L833
.L835:
	cmp	r3, #131074
	beq	.L866
.L834:
	ldr	r0, .L890+40
	bl	printk
	mov	r3, #-1
.L833:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r3, [r2, #92]
	ldr	r3, [r4, #12]
	ldr	r2, .L890
	ldr	r3, [r3, #36]
	cmp	r3, r2
	bhi	.L836
	subs	r2, r2, #3
	cmp	r3, r2
	bcs	.L889
	subs	r2, r2, #6
	cmp	r3, r2
	bcc	.L838
	adds	r2, r2, #1
	cmp	r3, r2
	bls	.L871
	adds	r2, r2, #2
	cmp	r3, r2
	bhi	.L838
.L889:
	movs	r3, #0
	b	.L837
.L836:
	ldr	r2, .L890+20
	cmp	r3, r2
	bhi	.L839
	subs	r2, r2, #1
	cmp	r3, r2
	ite	cs
	movcs	r3, #0
	movcc	r3, #1
.L837:
	movs	r2, #140
	mla	r2, r2, r6, r5
	str	r3, [r2, #104]
	ldr	r3, [r4, #40]
	str	r3, [r2, #96]
	ldr	r3, [r4, #36]
	str	r3, [r2, #100]
	ldr	r3, [r2, #20]
	subs	r3, r3, #17
	cmp	r3, #1
	bhi	.L840
	add	r1, r4, #64
	mov	r0, r8
	bl	set_color_lut
.L840:
	ldr	r3, [r4, #88]
	cbz	r3, .L842
	ldr	r3, [r4, #16]
	cbz	r3, .L842
	sub	r0, r7, #84
	mov	r1, r4
	add	r0, r0, r5
	bl	to_osd_invert_cfg
	movs	r3, #140
	mla	r3, r3, r6, r5
	ldr	r0, [r3, #88]
	cbz	r0, .L842
	bl	mpi_obj_ref
.L842:
	ldr	r3, [r4, #48]
	cbz	r3, .L844
	movs	r3, #140
	movs	r2, #1
	mla	r6, r3, r6, r5
	movs	r1, #51
	movs	r3, #0
	str	r2, [r6, #108]
	strd	r1, r3, [r6, #120]
	ldr	r3, [r4, #60]
	str	r3, [r6, #116]
	ldr	r3, [r4, #52]
	cmp	r3, #0
	it	ne
	movne	r3, r2
	str	r3, [r6, #112]
.L844:
	mov	r6, fp
.L822:
	ldr	r4, [r4, #4]
	subs	r4, r4, #4
	b	.L821
.L839:
	cmp	r3, #131072
	beq	.L871
	cmp	r3, #131074
	beq	.L871
.L838:
	movw	r3, #489
	ldr	r2, .L890+44
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L890+48
	movs	r0, #4
	bl	vlog
	b	.L889
.L871:
	movs	r3, #1
	b	.L837
.L891:
	.align	2
.L890:
	.word	65555
	.word	65549
	.word	65554
	.word	65547
	.word	.LC61
	.word	65559
	.word	65558
	.word	65551
	.word	65552
	.word	65557
	.word	.LC62
	.word	.LC63
	.word	.LANCHOR0+749
	.word	65553
	.fnend
	.size	set_osd_data, .-set_osd_data
	.align	1
	.global	mpi_buf_ref_with_node
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_buf_ref_with_node, %function
mpi_buf_ref_with_node:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7}
	.save {r4, r5, r6, r7}
	cbz	r0, .L892
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r6, .L898
	movs	r2, #0
	movs	r3, #12
.L896:
	mul	r4, r3, r2
	ldr	r7, [r4, r6]
	cbnz	r7, .L894
	ldr	r3, .L898+4
	movw	r2, #37688
	add	r3, r3, r4
	str	r0, [r3, r2]
	movw	r2, #37696
	ldr	r1, [r1, #112]
	str	r1, [r3, r2]
	movw	r1, #37692
	ldr	r2, [r3, r1]
	adds	r2, r2, #1
	str	r2, [r3, r1]
.L895:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, r6, r7}
	b	mpi_obj_ref
.L894:
	adds	r2, r2, #1
	cmp	r2, #512
	bne	.L896
	b	.L895
.L892:
	pop	{r4, r5, r6, r7}
	bx	lr
.L899:
	.align	2
.L898:
	.word	g_venc_dev+37688
	.word	g_venc_dev
	.fnend
	.size	mpi_buf_ref_with_node, .-mpi_buf_ref_with_node
	.align	1
	.global	vcodec_handle_message
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_handle_message, %function
vcodec_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r3, [r0, #36]
	.pad #44
	sub	sp, sp, #44
	mov	r4, r1
	mov	r5, r2
	cmp	r3, #1
	beq	.L937
.L973:
	movs	r4, #0
.L948:
	mov	r0, r4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L937:
	movs	r6, #0
.L901:
	mov	r0, r6
	bl	get_venc_node
	cmp	r8, r0
	beq	.L903
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L901
.L970:
	movw	r3, #802
	mov	r2, #-1
	strd	r3, r2, [sp]
	movs	r1, #5
	ldr	r3, .L975+8
	ldr	r2, .L975+12
.L974:
	movs	r0, #4
	bl	vlog
	b	.L973
.L903:
	cmp	r6, #15
	bhi	.L970
	ldr	r3, [r8, #316]
	ldr	r10, [r3]
	cmp	r10, #0
	bne	.L905
	mov	r3, #808
	str	r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L975+8
	ldr	r2, .L975+16
	b	.L974
.L905:
	cmp	r4, #1
	beq	.L906
	subs	r3, r4, #7
	rsbs	r4, r3, #0
	adcs	r4, r4, r3
	b	.L948
.L906:
	cmp	r5, #0
	beq	.L973
	ldr	r7, .L975+20
	add	fp, r6, #46
	add	r9, r6, #110
	add	r3, r7, fp, lsl #2
	ldr	r0, [r3, #4]
	cbz	r0, .L908
	add	r3, r7, r6, lsl #2
	ldr	r1, [r3, #252]
	cbz	r1, .L908
	add	ip, r7, r9, lsl #2
	add	r2, r8, #200
	add	lr, r8, #192
	ldr	r3, [ip, #4]
	str	r3, [sp, #36]
	cbnz	r3, .L909
	cmp	r0, r1
	bge	.L910
.L909:
	mov	r3, lr
	bl	mpi_node_set_frame_rate
	add	r3, r7, r6, lsl #2
	movs	r2, #1
.L971:
	str	r2, [r3, #316]
	add	r3, r7, fp, lsl #2
	movs	r2, #0
	str	r2, [r3, #4]
	add	r3, r6, #62
	add	r3, r7, r3, lsl #2
	str	r2, [r3, #4]
.L908:
	add	r3, r7, r9, lsl #2
	ldr	r3, [r3, #4]
	cbz	r3, .L912
	add	fp, r6, #338
	ldr	r2, [r5, #716]
	ldr	r3, [r7, fp, lsl #2]
	cmp	r3, r2
	beq	.L913
	add	r1, r7, r6, lsl #2
	ldr	r1, [r1, #316]
	cbnz	r1, .L913
	movs	r1, #4
	strd	r3, r2, [sp, #4]
	mov	r0, r1
	movw	r3, #838
	ldr	r2, .L975+24
	str	r3, [sp]
	ldr	r3, .L975+8
	bl	vlog
.L913:
	ldr	r3, [r5, #716]
	adds	r3, r3, #1
	str	r3, [r7, fp, lsl #2]
.L912:
	add	r3, r6, #302
	add	r3, r7, r3, lsl #2
	ldr	r2, [r3, #4]
	cmp	r2, #0
	ble	.L914
	subs	r2, r2, #1
	str	r2, [r3, #4]
	b	.L973
.L910:
	mov	r3, lr
	mov	r1, r0
	bl	mpi_node_set_frame_rate
	add	r3, r7, r6, lsl #2
	ldr	r2, [sp, #36]
	b	.L971
.L914:
	add	r3, r6, #9152
	adds	r3, r3, #14
	ldr	r3, [r7, r3, lsl #2]
	cmp	r3, #9
	beq	.L915
	cmp	r3, #15
	bne	.L916
.L915:
	add	r3, r6, #141
	lsls	r3, r3, #4
	adds	r2, r7, r3
	ldr	r3, [r7, r3]
	cmp	r3, #0
	beq	.L973
	ble	.L916
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bne	.L973
	movs	r3, #1
	str	r3, [r2, #4]
.L916:
	adds	r2, r7, r6
	movw	r3, #10964
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L917
	ldr	r3, .L975+28
	movs	r2, #0
.L919:
	ldrb	r1, [r3], #1	@ zero_extendqisi2
	cmp	r6, r1
	beq	.L918
	adds	r2, r2, #1
	cmp	r2, #16
	bne	.L919
	b	.L973
.L920:
	add	lr, lr, #1
	cmp	lr, #100
	bne	.L921
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, ip	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L973
.L925:
	str	r5, [r7, r3, lsl #2]
	b	.L927
.L924:
	ldr	r2, .L975+32
	ldr	r3, [r2, #28]
	cmp	r3, #19
	add	r1, r3, #1
	str	r1, [r2, #28]
	bgt	.L929
	ldrd	r2, [r5, #720]
	movs	r1, #2
	str	r6, [sp, #4]
	movs	r0, #4
	strd	r2, [sp, #8]
	movw	r3, #895
	ldr	r2, .L975+36
	str	r3, [sp]
	ldr	r3, .L975+8
	bl	vlog
.L929:
	mov	r0, r5
	mov	r4, #-1
	bl	mpi_buf_unref
	b	.L948
.L931:
	add	r6, r7, r6, lsl #2
	movs	r2, #64
	mov	r1, r8
	ldr	r0, .L975+40
	bl	memset
	mov	r3, #-1
	str	r3, [r6, #4]
	bl	ktime_get
	cmp	r0, #0
	mov	r6, r0
	sbcs	r3, r1, #0
	mov	r7, r1
	bge	.L933
	rsbs	r6, r0, #0
	sbc	r7, r1, r1, lsl #1
.L933:
	adr	r9, .L975
	ldrd	r8, [r9]
	mov	ip, #0
	.syntax unified
@ 94 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/div64.h" 1
	umull	r2, r3, r8, r6
	cmn	r2, r8
	adcs	r3, r3, r9
	adc	r2, ip, #0
@ 0 "" 2
@ 112 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/div64.h" 1
	umlal	r3, r2, r9, r6
	umlal	r3, ip, r8, r7
	mov	r3, #0
	adds	r2, ip, r2
	adc	r3, r3, #0
	umlal	r2, r3, r9, r7
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r0, #0
	lsr	r6, r2, #9
	orr	r6, r6, r3, lsl #23
	lsr	r7, r3, #9
	sbcs	r3, r1, #0
	bge	.L934
	rsbs	r6, r6, #0
	sbc	r7, r7, r7, lsl #1
.L934:
	ldr	r3, .L975+44
	strd	r6, [r3]
	b	.L932
.L976:
	.align	3
.L975:
	.word	-1924145349
	.word	-2095944041
	.word	.LANCHOR0+769
	.word	.LC23
	.word	.LC64
	.word	g_venc_dev
	.word	.LC65
	.word	g_venc_dev+10980
	.word	.LANCHOR1
	.word	.LC68
	.word	g_venc_dev+1276
	.word	g_venc_dev+1344
.L918:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	ip, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, #800
	mov	lr, #0
	mla	r3, r3, r2, r7
	add	r3, r3, #23808
	adds	r3, r3, #56
.L921:
	ldrd	r0, [r3], #8
	orrs	fp, r0, r1
	beq	.L920
	movs	r3, #100
	strd	r0, [r5, #720]
	mla	r3, r3, r2, lr
	movs	r0, #0
	movs	r1, #0
	addw	r2, r3, #1383
	addw	r3, r3, #2983
	add	r2, r7, r2, lsl #3
	add	r3, r7, r3, lsl #3
	strd	r0, [r2]
	strd	r0, [r3]
.L917:
	ldr	r3, [r10, #44]
	movs	r1, #5
	ldr	r2, .L977
	movs	r0, #4
	str	r3, [sp, #16]
	ldr	r3, [r5]
	str	r3, [sp, #12]
	ldr	r3, [r8]
	str	r3, [sp, #8]
	ldr	r3, [r8, #80]
	ldr	r3, [r3, #80]
	str	r3, [sp, #4]
	movw	r3, #863
	str	r3, [sp]
	ldr	r3, .L977+4
	bl	vlog
	add	r3, r6, #10944
	adds	r3, r3, #14
	ldr	r2, [r7, r3, lsl #2]
	adds	r2, r2, #1
	bne	.L936
	ldr	r2, [r5, #640]
	str	r2, [r7, r3, lsl #2]
.L936:
	ldr	r2, [r5, #644]
	add	r3, r6, #10944
	adds	r3, r3, #30
	mov	r1, r8
	mov	r0, r5
	str	r2, [r7, r3, lsl #2]
	mov	r2, r6
	bl	mpi_buf_ref_with_node
	add	r3, r7, r9, lsl #2
	ldr	r3, [r3, #4]
	cbz	r3, .L923
	bl	mcu_get_wrap_status
	cmp	r0, #4
	mov	r8, r0
	bne	.L923
	bl	mcu_wrap_start
	ldr	r3, [r5, #716]
	ldr	r2, .L977+8
	mov	r1, r8
	mov	r0, r8
	str	r3, [sp, #24]
	ldr	r3, [r5, #680]
	str	r3, [sp, #20]
	ldr	r3, [r5, #676]
	str	r3, [sp, #16]
	ldr	r3, [r5, #672]
	str	r3, [sp, #12]
	ldr	r3, [r5, #668]
	strd	r6, r3, [sp, #4]
	mov	r3, #876
	str	r3, [sp]
	ldr	r3, .L977+4
	bl	vlog
.L923:
	mov	r1, r5
	mov	r0, r10
	bl	mpi_queue_push_obj
	cbnz	r0, .L928
	add	r3, r7, r9, lsl #2
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L924
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r6, #418
	ldr	r2, [r7, r3, lsl #2]
	cmp	r2, #0
	beq	.L925
	ldr	r2, .L977+12
	ldr	r3, [r2, #24]
	cmp	r3, #19
	add	r1, r3, #1
	str	r1, [r2, #24]
	bgt	.L926
	ldr	r3, [r5, #716]
	movs	r1, #2
	ldr	r2, .L977+16
	movs	r0, #4
	strd	r6, r3, [sp, #4]
	movw	r3, #885
	str	r3, [sp]
	ldr	r3, .L977+4
	bl	vlog
.L926:
	mov	r0, r5
	mov	r4, #-1
	bl	mpi_buf_unref
.L927:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L928:
	add	r9, r7, r9, lsl #2
	ldr	r3, [r9, #4]
	cmp	r3, #0
	beq	.L948
	ldr	r3, [r5, #716]
	mov	r8, #0
	mov	r0, r6
	strd	r3, r8, [sp]
	ldrd	r2, [r5, #720]
	bl	mpp_vcodec_run_task
	mov	r9, r0
	bl	set_wrap_begin
	add	r1, r6, #177
	ldrd	r2, [r5, #720]
	add	r1, r7, r1, lsl #3
	strd	r2, [r1]
	add	r3, r6, #193
	ldr	r1, [r5, #716]
	add	r2, r7, r3, lsl #3
	str	r1, [r7, r3, lsl #3]
	str	r8, [r2, #4]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r6, r6, #318
	cmp	r9, #0
	bne	.L931
	add	r6, r7, r6, lsl #2
	movs	r3, #1
	str	r3, [r6, #4]
	movw	r3, #43960
	str	r9, [r7, r3]
.L932:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L948
.L978:
	.align	2
.L977:
	.word	.LC69
	.word	.LANCHOR0+769
	.word	.LC66
	.word	.LANCHOR1
	.word	.LC67
	.fnend
	.size	vcodec_handle_message, .-vcodec_handle_message
	.global	__aeabi_idiv
	.align	1
	.global	to_frame_pixel_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_pixel_stride, %function
to_frame_pixel_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r0
	cmp	r3, #65537
	mov	r0, r1
	bhi	.L980
	cmp	r3, #65536
	bcs	.L982
	subs	r3, r3, #8
	cmp	r3, #3
	ite	hi
	movhi	r1, #1
	movls	r1, #2
.L981:
	bl	__aeabi_idiv
	pop	{r3, pc}
.L980:
	ldr	r2, .L987
	cmp	r3, r2
	bcc	.L984
	adds	r2, r2, #1
	cmp	r3, r2
	bls	.L985
	sub	r3, r3, #65536
	subs	r3, r3, #10
	cmp	r3, #3
	ite	hi
	movhi	r1, #1
	movls	r1, #4
	b	.L981
.L982:
	movs	r1, #2
	b	.L981
.L984:
	movs	r1, #1
	b	.L981
.L985:
	movs	r1, #3
	b	.L981
.L988:
	.align	2
.L987:
	.word	65542
	.fnend
	.size	to_frame_pixel_stride, .-to_frame_pixel_stride
	.align	1
	.global	dma_buf_import_mpi_buf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dma_buf_import_mpi_buf, %function
dma_buf_import_mpi_buf:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r1
	movs	r1, #0
	mov	r6, r2
	bl	mpi_buf_create
	mov	r4, r0
	cmp	r0, #0
	beq	.L989
	movs	r2, #28
	movs	r1, #0
	adds	r0, r0, #8
	bl	memset
	ldr	r3, .L1002
	ldr	r3, [r3]	@ unaligned
	str	r3, [r4, #4]	@ unaligned
	ldr	r3, [r5]
	str	r3, [r4, #668]
	ldr	r3, [r5, #4]
	str	r3, [r4, #672]
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #28]
	bl	to_frame_pixel_stride
	ldr	r2, .L1002+4
	add	r7, r2, #796
	str	r0, [r4, #676]
	ldr	r3, [r5, #12]
	str	r3, [r4, #680]
	movs	r3, #0
	ldr	r0, [r5, #28]
.L993:
	lsls	r1, r3, #3
	add	ip, r1, r7
	ldr	ip, [ip, #4]
	cmp	r0, ip
	bne	.L991
	add	r2, r2, r1
	ldr	r3, [r2, #796]
.L992:
	str	r3, [r4, #688]
	ldrd	r2, [r5, #40]
	strd	r2, [r4, #720]
	movs	r3, #4
	str	r3, [r4, #636]
	ldrb	r3, [r5, #96]	@ zero_extendqisi2
	lsls	r3, r3, #31
	itt	mi
	movmi	r3, #12
	strmi	r3, [r4, #636]
	cmp	r6, #0
	blt	.L989
	ldr	r2, [r5, #48]
	cmp	r2, #15
	bhi	.L989
	ldr	r3, .L1002+8
	movs	r1, #1
	add	r2, r3, r2, lsl #4
	str	r1, [r2, #2248]
	ldr	r2, [r5, #48]
	add	r2, r3, r2, lsl #4
	str	r6, [r2, #2252]
	ldr	r2, [r5, #48]
	add	r3, r3, r2, lsl #4
	str	r1, [r3, #2256]
.L989:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L991:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L993
	mov	r3, #-1
	b	.L992
.L1003:
	.align	2
.L1002:
	.word	.LC6
	.word	.LANCHOR0
	.word	g_venc_dev
	.fnend
	.size	dma_buf_import_mpi_buf, .-dma_buf_import_mpi_buf
	.align	1
	.global	to_frame_hor_stride
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	to_frame_hor_stride, %function
to_frame_hor_stride:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #65537
	bhi	.L1005
	cmp	r0, #65536
	bcs	.L1009
	cmp	r0, #9
	bcc	.L1011
	cmp	r0, #10
	bls	.L1009
	subs	r0, r0, #17
	cmp	r0, #1
	ite	hi
	movhi	r0, #1
	movls	r0, #2
.L1006:
	muls	r0, r1, r0
	bx	lr
.L1005:
	ldr	r3, .L1014
	cmp	r0, r3
	bcc	.L1011
	adds	r3, r3, #1
	cmp	r0, r3
	bls	.L1012
	sub	r0, r0, #65536
	subs	r0, r0, #16
	cmp	r0, #3
	ite	hi
	movhi	r0, #1
	movls	r0, #4
	b	.L1006
.L1009:
	movs	r0, #2
	b	.L1006
.L1011:
	movs	r0, #1
	b	.L1006
.L1012:
	movs	r0, #3
	b	.L1006
.L1015:
	.align	2
.L1014:
	.word	65542
	.fnend
	.size	to_frame_hor_stride, .-to_frame_hor_stride
	.align	1
	.global	get_mpi_buf_frm_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpi_buf_frm_info, %function
get_mpi_buf_frm_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L1102
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r7, r0
	mov	r4, r1
	mov	r6, r2
	mov	r8, #0
	mov	r5, r3
.L1019:
	ldr	r2, [r3, #2248]
	cbz	r2, .L1017
	ldr	r2, [r3, #2252]
	cmp	r6, r2
	bne	.L1017
	add	r3, r5, r8, lsl #4
	ldr	r3, [r3, #2256]
	adds	r2, r3, #1
	beq	.L1018
	cmp	r3, #0
	it	le
	movle	r8, #-1
.L1018:
	cbnz	r7, .L1020
.L1101:
	movs	r0, #0
.L1016:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L1017:
	add	r8, r8, #1
	adds	r3, r3, #16
	cmp	r8, #16
	bne	.L1019
	mov	r8, #-1
	b	.L1018
.L1020:
	cmp	r4, #0
	beq	.L1101
	ldr	r3, [r7, #668]
	str	r3, [r4]
	ldr	r3, [r7, #672]
	str	r3, [r4, #4]
	ldr	r1, [r7, #676]
	ldr	r0, [r7, #688]
	bl	to_frame_hor_stride
	ldrb	r2, [r4, #96]	@ zero_extendqisi2
	cmp	r6, #0
	str	r0, [r4, #8]
	ldr	r3, [r7, #680]
	str	r3, [r4, #12]
	ldr	r3, [r7, #636]
	asr	r3, r3, #3
	bfi	r2, r3, #0, #1
	strb	r2, [r4, #96]
	blt	.L1024
	ldrd	r2, [r7, #720]
	strd	r2, [r4, #40]
	ldr	r3, [r7, #716]
	str	r3, [r4, #80]
	movs	r3, #0
	str	r3, [r4, #84]
	add	r3, r5, r6, lsl #2
	ldr	r3, [r3, #444]
	cbz	r3, .L1024
	ldrd	r0, [r7, #720]
	ldr	r3, [r7, #716]
	orrs	r2, r0, r1
	bne	.L1026
	cbz	r3, .L1027
.L1026:
	adds	r3, r3, #1
	movs	r1, #0
	mov	r0, r3
.L1027:
	strd	r0, [r4, #80]
	ldrd	r2, [r7, #720]
	orrs	r3, r2, r3
	bne	.L1028
	ldr	r3, [r7, #716]
	cmp	r3, #0
	bne	.L1028
.L1031:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r10, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r9, r6, #418
	ldr	r3, [r5, r9, lsl #2]
	cmp	r3, #0
	bne	.L1029
.L1030:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r10	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L1024:
	cmp	r6, #15
	mov	r3, #0
	strd	r3, r3, [r4, #20]
	bhi	.L1033
	movs	r3, #24
	mla	r3, r3, r6, r5
	ldr	r2, [r3, #1864]
	cmp	r2, r6
	itttt	eq
	ldreq	r2, [r3, #1868]
	streq	r2, [r4, #20]
	ldreq	r3, [r3, #1872]
	streq	r3, [r4, #24]
.L1033:
	add	r9, r6, #217
	movs	r3, #0
	str	r8, [r4, #48]
	str	r3, [r4, #52]
	str	r3, [r4, #60]
	ldr	r10, [r5, r9, lsl #3]
	cmp	r10, #0
	beq	.L1034
	mov	r0, r6
	bl	get_venc_node
	mov	r1, r0
	cmp	r0, #0
	bne	.L1035
.L1036:
	movs	r3, #0
	str	r3, [r4, #52]
.L1034:
	cmp	r8, #-1
	beq	.L1037
	add	r9, r5, r9, lsl #3
	ldr	r9, [r9, #4]
	cmp	r9, #0
	beq	.L1037
	mov	r0, r8
	bl	get_venc_node
	mov	r1, r0
	cmp	r0, #0
	bne	.L1038
.L1039:
	movs	r3, #0
	str	r3, [r4, #60]
.L1037:
	ldr	r3, [r7]
	ldr	r2, .L1102+4
	str	r3, [r4, #56]
	add	ip, r2, #796
	ldr	r1, [r7, #688]
	movs	r3, #0
.L1042:
	ldr	r0, [ip, r3, lsl #3]
	cmp	r1, r0
	bne	.L1040
	add	r3, r2, r3, lsl #3
	ldr	r3, [r3, #800]
.L1041:
	str	r3, [r4, #28]
	add	r3, r5, r6, lsl #2
	ldr	r3, [r3, #444]
	cmp	r3, #0
	bne	.L1054
	ldr	r3, [r7, #636]
	tst	r3, #4
	ite	eq
	moveq	r3, #1
	movne	r3, #0
.L1043:
	cmp	r6, #7
	str	r3, [r4, #64]
	mov	r3, #0
	str	r3, [r4, #88]
	bhi	.L1101
	mov	r3, #1056
	mla	r3, r3, r6, r5
	ldr	r2, [r3, #2524]
	cbnz	r2, .L1044
	ldr	r3, [r3, #2528]
	cbz	r3, .L1045
.L1044:
	movw	r1, #5500
	movw	r0, #4500
	bl	usleep_range
.L1045:
	mov	r8, #1056
	movs	r2, #112
	mul	r8, r8, r6
	movs	r1, #0
	addw	r9, r8, #3284
	add	r0, r5, r9
	bl	memset
	add	r3, r5, r8
	ldr	r2, [r3, #2524]
	cbz	r2, .L1046
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r0, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r7, #716]
	ldr	r2, [r3, #3272]
	cmp	r1, r2
	beq	.L1055
	ldr	r3, [r3, #3280]
	cmp	r1, r3
	bne	.L1048
	movs	r1, #1
.L1047:
	movs	r3, #132
	movs	r2, #56
	mla	r3, r3, r6, r1
	muls	r2, r1, r2
	add	r3, r5, r3, lsl #3
	ldr	r3, [r3, #3268]
	ldr	lr, [r3, #484]
	mov	r3, #1056
	muls	r3, r6, r3
	add	ip, r2, r3
	add	r3, r3, r5
	add	ip, ip, r5
	add	r2, r2, r9
	add	r2, r2, r5
	str	lr, [ip, #3284]
	str	r2, [r4, #88]
	str	r1, [r3, #3396]
.L1048:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r0	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L1046:
	mov	r3, #1056
	mla	r3, r3, r6, r5
	ldr	r3, [r3, #2528]
	cmp	r3, #0
	beq	.L1101
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r1, [r7, #716]
	add	r8, r8, r5
	movs	r0, #0
.L1051:
	ldr	r3, [r8, #2792]
	cmp	r1, r3
	bne	.L1049
	mov	r1, #1056
	muls	r1, r6, r1
	adds	r3, r5, r1
	ldr	r6, [r3, #3396]
	movs	r3, #56
	muls	r3, r6, r3
	movs	r6, #52
	mla	r6, r6, r0, r1
	adds	r7, r3, r1
	add	r3, r3, r9
	add	r7, r7, r5
	add	r6, r6, r5
	add	r5, r5, r3
	ldr	r1, [r6, #2744]
	str	r1, [r7, #3292]
	str	r5, [r4, #88]
.L1050:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L1101
.L1028:
	add	r3, r5, r6, lsl #2
	ldr	r3, [r3, #1148]
	cmp	r3, #0
	beq	.L1031
	bl	mcu_get_wrap_status
	cmp	r0, #2
	beq	.L1031
	mov	r0, #-1
	b	.L1016
.L1029:
	mov	r0, r6
	bl	get_venc_node
	ldr	r1, [r5, r9, lsl #2]
	ldr	r3, [r0, #316]
	ldr	r0, [r3]
	bl	mpi_queue_push_obj
	cbz	r0, .L1032
	movs	r3, #0
	str	r3, [r5, r9, lsl #2]
	b	.L1030
.L1032:
	ldr	r1, [r5, r9, lsl #2]
	movs	r0, #4
	ldrd	r2, [r1, #720]
	strd	r2, [sp, #16]
	ldr	r3, [r1, #716]
	movs	r1, #2
	ldr	r2, .L1102+8
	strd	r6, r3, [sp, #4]
	movw	r3, #1514
	str	r3, [sp]
	ldr	r3, .L1102+12
	bl	vlog
	b	.L1030
.L1035:
	mov	r0, r10
	bl	set_osd_data
	ldr	r3, [r10, #4]
	cmp	r3, #0
	beq	.L1036
	str	r10, [r4, #52]
	b	.L1034
.L1103:
	.align	2
.L1102:
	.word	g_venc_dev
	.word	.LANCHOR0
	.word	.LC70
	.word	.LANCHOR0+1044
.L1038:
	mov	r0, r9
	bl	set_osd_data
	ldr	r3, [r9, #4]
	cmp	r3, #0
	beq	.L1039
	str	r9, [r4, #60]
	b	.L1037
.L1040:
	adds	r3, r3, #1
	cmp	r3, #31
	bne	.L1042
	mov	r3, #-1
	b	.L1041
.L1054:
	movs	r3, #0
	b	.L1043
.L1055:
	movs	r1, #0
	b	.L1047
.L1049:
	adds	r0, r0, #1
	add	r8, r8, #52
	cmp	r0, #10
	bne	.L1051
	b	.L1050
	.fnend
	.size	get_mpi_buf_frm_info, .-get_mpi_buf_frm_info
	.align	1
	.global	venc_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_probe, %function
venc_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	movw	r2, #43968
	movs	r1, #0
	mov	r7, r0
	ldr	r0, .L1110
	movs	r6, #0
	bl	memset
	movs	r2, #16
	mov	r1, #-1
	ldr	r0, .L1110+4
	bl	memset
	ldr	r5, .L1110
	ldr	r8, .L1110+56
	ldr	r9, .L1110+64
	mov	r4, r5
.L1107:
	mov	r0, #1128
	bl	kzalloc.constprop.19
	str	r0, [r5, #1736]
	cbnz	r0, .L1105
	movw	r3, #2844
	mov	r2, r9
	str	r3, [sp]
	movs	r1, #2
	mov	r3, r8
	movs	r0, #4
	bl	vlog
.L1105:
	mov	r0, #1128
	bl	kzalloc.constprop.19
	str	r0, [r5, #1740]
	cbnz	r0, .L1106
	movw	r3, #2847
	ldr	r2, .L1110+8
	str	r3, [sp]
	movs	r1, #2
	mov	r3, r8
	movs	r0, #4
	bl	vlog
.L1106:
	adds	r6, r6, #1
	adds	r5, r5, #8
	cmp	r6, #16
	bne	.L1107
	ldr	r2, .L1110+12
	ldr	r1, .L1110+16
	ldr	r0, .L1110+20
	bl	__mutex_init
	mov	r1, #3264
	mov	r0, r7
	ldr	r5, .L1110+24
	bl	kstrdup
	mov	r2, r7
	movs	r1, #8
	str	r4, [r4, #140]
	movs	r3, #33
	str	r5, [r4, #164]
	str	r3, [r4, #168]
	str	r0, [r4]
	ldr	r0, .L1110+28
	bl	mpi_dev_register
	ldr	r3, .L1110+32
	add	r1, r5, #660
	movs	r2, #0
	ldr	r0, .L1110+28
	str	r3, [r4, #108]
	ldr	r3, .L1110+36
	str	r3, [r4, #116]
	ldr	r3, .L1110+40
	str	r3, [r4, #120]
	bl	mpi_sysfs_dev_add
	ldr	r1, .L1110+44
	movs	r3, #0
	ldr	r0, .L1110+48
	add	r2, r1, #28
	str	r3, [r4, #172]
	str	r1, [r4, #148]
	str	r1, [r4, #152]
	subs	r1, r1, #148
	strd	r2, r2, [r4, #176]
	mov	r2, #-1
	str	r3, [r4, #156]
	ldr	r3, .L1110+52
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L1108
	bl	wake_up_process
.L1108:
	movs	r1, #4
	str	r5, [r4, #144]
	movw	r3, #2875
	str	r5, [sp, #4]
	str	r3, [sp]
	mov	r0, r1
	ldr	r3, .L1110+56
	ldr	r2, .L1110+60
	bl	vlog
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L1111:
	.align	2
.L1110:
	.word	g_venc_dev
	.word	g_venc_dev+10980
	.word	.LC72
	.word	.LANCHOR1+32
	.word	.LC73
	.word	g_venc_dev+2504
	.word	.LANCHOR0+1076
	.word	g_venc_dev+4
	.word	venc_create_ctx
	.word	venc_destroy_ctx
	.word	venc_handle_message
	.word	g_venc_dev+148
	.word	venc_thread_fn
	.word	.LC6
	.word	.LANCHOR0+1065
	.word	.LC49
	.word	.LC71
	.fnend
	.size	venc_probe, .-venc_probe
	.align	1
	.global	venc_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_shutdown, %function
venc_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	ldr	r4, .L1127
	ldr	r3, [r4, #144]
	cbnz	r3, .L1113
.L1115:
	ldr	r4, .L1127+4
	movs	r5, #0
	mov	r6, r5
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-4]!
	bl	kfree
.L1114:
	ldr	r0, [r4, #1736]
	cbz	r0, .L1118
	bl	kfree
	str	r6, [r4, #1736]
.L1118:
	ldr	r0, [r4, #1740]
	cbz	r0, .L1119
	bl	kfree
	str	r6, [r4, #1740]
.L1119:
	adds	r5, r5, #1
	adds	r4, r4, #8
	cmp	r5, #16
	bne	.L1114
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L1113:
	cmn	r3, #4096
	bhi	.L1115
	add	r0, r4, #172
	movs	r3, #1
	str	r3, [r4, #156]
	bl	up
	ldr	r3, [r4, #144]
	movs	r1, #4
	ldr	r2, .L1127+8
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2887
	str	r3, [sp]
	ldr	r3, .L1127+12
	bl	vlog
	ldr	r0, [r4, #144]
	bl	kthread_stop
	ldr	r3, [r4, #144]
	movs	r1, #4
	ldr	r2, .L1127+16
	mov	r0, r1
	str	r3, [sp, #4]
	movw	r3, #2889
	str	r3, [sp]
	ldr	r3, .L1127+12
	bl	vlog
	movs	r3, #0
	str	r3, [r4, #144]
.L1116:
	ldr	r3, [r4, #156]
	cmp	r3, #2
	beq	.L1115
	movs	r0, #1
	bl	msleep
	b	.L1116
.L1128:
	.align	2
.L1127:
	.word	g_venc_dev
	.word	g_venc_dev+4
	.word	.LC27
	.word	.LANCHOR0+1864
	.word	.LC28
	.fnend
	.size	venc_shutdown, .-venc_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	venc_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_init, %function
venc_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, .L1130
	bl	venc_probe
	ldr	r0, .L1130+4
	add	r4, r0, #8
	adds	r0, r0, #88
	mov	r1, r4
	bl	vmpi_register_fn2vcocdec
	mov	r0, r4
	bl	register_vmpibuf_func_to_pp
	movs	r0, #0
	pop	{r4, pc}
.L1131:
	.align	2
.L1130:
	.word	.LC6
	.word	.LANCHOR2
	.fnend
	.size	venc_init, .-venc_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	venc_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_exit, %function
venc_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	vmpi_unregister_fn2vcocdec
	bl	unregister_vmpibuf_func_pp
	pop	{r3, lr}
	b	venc_shutdown
	.fnend
	.size	venc_exit, .-venc_exit
	.global	gmpi_buf_ops
	.global	gmpidev_ops
	.global	ivs_input_path
	.global	save_ivs_input
	.global	venc_input_path
	.global	save_venc_input
	.global	g_venc_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.37877, %object
	.size	__func__.37877, 25
__func__.37877:
	.ascii	"venc_node_pp_get_md_attr\000"
	.type	__func__.37902, %object
	.size	__func__.37902, 20
__func__.37902:
	.ascii	"venc_node_enable_tb\000"
	.type	__func__.37909, %object
	.size	__func__.37909, 18
__func__.37909:
	.ascii	"venc_node_tb_bind\000"
	.type	__func__.37917, %object
	.size	__func__.37917, 21
__func__.37917:
	.ascii	"venc_node_tb_request\000"
	.type	__func__.37774, %object
	.size	__func__.37774, 24
__func__.37774:
	.ascii	"venc_node_set_framerate\000"
	.type	__func__.37735, %object
	.size	__func__.37735, 26
__func__.37735:
	.ascii	"venc_node_set_vcodec_attr\000"
	.type	__func__.37743, %object
	.size	__func__.37743, 26
__func__.37743:
	.ascii	"venc_node_get_vcodec_attr\000"
	.type	__func__.37483, %object
	.size	__func__.37483, 14
__func__.37483:
	.ascii	"mpi_buf_unref\000"
	.type	__func__.37666, %object
	.size	__func__.37666, 17
__func__.37666:
	.ascii	"venc_node_create\000"
	.type	__func__.37676, %object
	.size	__func__.37676, 17
__func__.37676:
	.ascii	"venc_node_delete\000"
	.type	__func__.37693, %object
	.size	__func__.37693, 16
__func__.37693:
	.ascii	"venc_node_start\000"
	.type	__func__.37238, %object
	.size	__func__.37238, 15
__func__.37238:
	.ascii	"send_first_buf\000"
	.type	__func__.37830, %object
	.size	__func__.37830, 19
__func__.37830:
	.ascii	"venc_node_pp_start\000"
	.type	__func__.37700, %object
	.size	__func__.37700, 15
__func__.37700:
	.ascii	"venc_node_stop\000"
	.type	__func__.37711, %object
	.size	__func__.37711, 21
__func__.37711:
	.ascii	"venc_node_send_frame\000"
	.type	__func__.37841, %object
	.size	__func__.37841, 24
__func__.37841:
	.ascii	"venc_node_pp_send_frame\000"
	.type	__func__.37815, %object
	.size	__func__.37815, 20
__func__.37815:
	.ascii	"venc_node_pp_delete\000"
	.type	__func__.37296, %object
	.size	__func__.37296, 28
__func__.37296:
	.ascii	"venc_handle_node_pp_message\000"
	.type	__func__.37992, %object
	.size	__func__.37992, 13
__func__.37992:
	.ascii	"venc_release\000"
	.type	__func__.37936, %object
	.size	__func__.37936, 11
__func__.37936:
	.ascii	"venc_ioctl\000"
	.type	__func__.37376, %object
	.size	__func__.37376, 23
__func__.37376:
	.ascii	"vcodec_notify_drop_frm\000"
	.type	__func__.37751, %object
	.size	__func__.37751, 20
__func__.37751:
	.ascii	"venc_node_set_combo\000"
	.type	__func__.37760, %object
	.size	__func__.37760, 19
__func__.37760:
	.ascii	"venc_node_set_snap\000"
	.type	__func__.37350, %object
	.size	__func__.37350, 22
__func__.37350:
	.ascii	"vcodec_set_intra_info\000"
	.type	__func__.37394, %object
	.size	__func__.37394, 14
__func__.37394:
	.ascii	"vcodec_notify\000"
	.type	__func__.37654, %object
	.size	__func__.37654, 16
__func__.37654:
	.ascii	"venc_node_check\000"
	.type	__func__.37719, %object
	.size	__func__.37719, 19
__func__.37719:
	.ascii	"venc_node_set_crop\000"
	.type	__func__.37727, %object
	.size	__func__.37727, 19
__func__.37727:
	.ascii	"venc_node_get_crop\000"
	.type	__func__.37868, %object
	.size	__func__.37868, 25
__func__.37868:
	.ascii	"venc_node_pp_set_md_attr\000"
	.type	__func__.37886, %object
	.size	__func__.37886, 25
__func__.37886:
	.ascii	"venc_node_pp_set_od_attr\000"
	.type	__func__.37895, %object
	.size	__func__.37895, 25
__func__.37895:
	.ascii	"venc_node_pp_get_od_attr\000"
	.type	__func__.37647, %object
	.size	__func__.37647, 17
__func__.37647:
	.ascii	"venc_get_version\000"
	.type	__func__.37977, %object
	.size	__func__.37977, 10
__func__.37977:
	.ascii	"venc_open\000"
	.type	__func__.37853, %object
	.size	__func__.37853, 24
__func__.37853:
	.ascii	"venc_node_pp_get_result\000"
	.type	__FUNCTION__.36948, %object
	.size	__FUNCTION__.36948, 14
__FUNCTION__.36948:
	.ascii	"write_to_file\000"
	.type	__func__.38040, %object
	.size	__func__.38040, 15
__func__.38040:
	.ascii	"venc_thread_fn\000"
	.type	__func__.37792, %object
	.size	__func__.37792, 20
__func__.37792:
	.ascii	"venc_node_pp_create\000"
	.type	__func__.37122, %object
	.size	__func__.37122, 14
__func__.37122:
	.ascii	"set_color_lut\000"
	.type	__func__.37173, %object
	.size	__func__.37173, 18
__func__.37173:
	.ascii	"to_osd_invert_cfg\000"
	.type	__func__.37109, %object
	.size	__func__.37109, 20
__func__.37109:
	.ascii	"to_osd_alpha_source\000"
	.type	__func__.37254, %object
	.size	__func__.37254, 25
__func__.37254:
	.ascii	"venc_handle_node_message\000"
	.space	2
	.type	fmt, %object
	.size	fmt, 248
fmt:
	.word	0
	.word	0
	.word	1
	.word	1
	.word	2
	.word	2
	.word	3
	.word	3
	.word	4
	.word	4
	.word	5
	.word	5
	.word	6
	.word	5
	.word	7
	.word	6
	.word	8
	.word	7
	.word	9
	.word	8
	.word	10
	.word	10
	.word	12
	.word	13
	.word	13
	.word	14
	.word	15
	.word	15
	.word	16
	.word	16
	.word	17
	.word	9
	.word	18
	.word	11
	.word	65536
	.word	65536
	.word	65537
	.word	65537
	.word	65538
	.word	65538
	.word	65539
	.word	65539
	.word	65540
	.word	65540
	.word	65541
	.word	65541
	.word	65542
	.word	65542
	.word	65543
	.word	65543
	.word	65544
	.word	65544
	.word	65545
	.word	65545
	.word	65552
	.word	65546
	.word	65553
	.word	65547
	.word	65554
	.word	65548
	.word	65555
	.word	65549
	.type	__func__.37601, %object
	.size	__func__.37601, 21
__func__.37601:
	.ascii	"get_mpi_buf_frm_info\000"
	.type	__func__.38137, %object
	.size	__func__.38137, 11
__func__.38137:
	.ascii	"venc_probe\000"
	.type	venc_ioctls, %object
	.size	venc_ioctls, 660
venc_ioctls:
	.word	-1065589504
	.word	0
	.word	venc_get_version
	.word	.LC74
	.word	0
	.word	-1072667391
	.word	0
	.word	venc_node_create
	.word	.LC75
	.word	0
	.word	1074029826
	.word	0
	.word	venc_node_delete
	.word	.LC76
	.word	0
	.word	1076389123
	.word	0
	.word	venc_node_start
	.word	.LC77
	.word	0
	.word	1079796996
	.word	0
	.word	venc_node_send_frame
	.word	.LC78
	.word	0
	.word	1075340549
	.word	0
	.word	venc_node_set_crop
	.word	.LC79
	.word	0
	.word	1074554118
	.word	0
	.word	venc_node_set_combo
	.word	.LC80
	.word	0
	.word	1074554119
	.word	0
	.word	venc_node_set_snap
	.word	.LC81
	.word	0
	.word	-1069259512
	.word	0
	.word	venc_node_pp_create
	.word	.LC82
	.word	0
	.word	1074029833
	.word	0
	.word	venc_node_pp_delete
	.word	.LC83
	.word	0
	.word	1074029834
	.word	0
	.word	venc_node_pp_start
	.word	.LC84
	.word	0
	.word	1079797003
	.word	0
	.word	venc_node_pp_send_frame
	.word	.LC85
	.word	0
	.word	-1071094516
	.word	0
	.word	venc_node_pp_get_result
	.word	.LC86
	.word	0
	.word	1074029837
	.word	0
	.word	venc_node_enable_tb
	.word	.LC87
	.word	0
	.word	1074291982
	.word	0
	.word	venc_node_tb_bind
	.word	.LC88
	.word	0
	.word	1074029839
	.word	0
	.word	venc_node_tb_request
	.word	.LC89
	.word	0
	.word	-1072143088
	.word	0
	.word	venc_node_get_crop
	.word	.LC90
	.word	0
	.word	1077699857
	.word	0
	.word	venc_node_set_vcodec_attr
	.word	.LC91
	.word	0
	.word	-1069783790
	.word	0
	.word	venc_node_get_vcodec_attr
	.word	.LC92
	.word	0
	.word	-1071356653
	.word	0
	.word	venc_node_pp_set_md_attr
	.word	.LC93
	.word	0
	.word	-1071356652
	.word	0
	.word	venc_node_pp_get_md_attr
	.word	.LC94
	.word	0
	.word	1074816277
	.word	0
	.word	venc_node_check
	.word	.LC95
	.word	0
	.word	1074816278
	.word	0
	.word	venc_node_set_framerate
	.word	.LC96
	.word	0
	.word	1074029847
	.word	0
	.word	venc_node_stop
	.word	.LC97
	.word	0
	.space	20
	.word	-1071094503
	.word	0
	.word	venc_node_pp_set_od_attr
	.word	.LC98
	.word	0
	.space	120
	.word	-1071094496
	.word	0
	.word	venc_node_pp_get_od_attr
	.word	.LC99
	.word	0
	.type	venc_driver_fops, %object
	.size	venc_driver_fops, 128
venc_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	venc_poll
	.word	venc_ioctl
	.word	venc_compat_ioctl
	.word	0
	.space	4
	.word	venc_open
	.space	4
	.word	venc_release
	.space	60
	.type	__func__.38159, %object
	.size	__func__.38159, 14
__func__.38159:
	.ascii	"venc_shutdown\000"
	.type	__param_str_ivs_input_path, %object
	.size	__param_str_ivs_input_path, 22
__param_str_ivs_input_path:
	.ascii	"rockit.ivs_input_path\000"
	.type	__param_str_save_ivs_input, %object
	.size	__param_str_save_ivs_input, 22
__param_str_save_ivs_input:
	.ascii	"rockit.save_ivs_input\000"
	.type	__param_str_venc_input_path, %object
	.size	__param_str_venc_input_path, 23
__param_str_venc_input_path:
	.ascii	"rockit.venc_input_path\000"
	.type	__param_str_save_venc_input, %object
	.size	__param_str_save_venc_input, 23
__param_str_save_venc_input:
	.ascii	"rockit.save_venc_input\000"
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	venc_input_path, %object
	.size	venc_input_path, 4
venc_input_path:
	.word	.LC100
	.type	ivs_input_path, %object
	.size	ivs_input_path, 4
ivs_input_path:
	.word	.LC100
	.type	gmpi_buf_ops, %object
	.size	gmpi_buf_ops, 80
gmpi_buf_ops:
	.word	mpi_buf_alloc
	.word	mpi_buf_map
	.word	mpi_buf_unmap
	.word	mpi_buf_ref
	.word	mpi_buf_unref
	.word	mpi_buf_get_dmabuf
	.word	mpi_buf_get_paddr
	.word	mpi_buffer_queue_create
	.word	mpi_buffer_queue_destroy
	.word	mpi_buffer_queue_push
	.word	mpi_buffer_queue_pop
	.word	mpi_buffer_queue_size
	.word	dma_buf_import_mpi_buf
	.word	get_mpi_buf_frm_info
	.word	mpi_buffer_pool_create
	.word	mpi_buffer_pool_destroy
	.word	mpi_buffer_pool_request_buf
	.word	mpi_buffer_pool_get_free_num
	.word	mpi_buf_alloc_with_name
	.word	vcodec_mpibuf_struct_size
	.type	gmpidev_ops, %object
	.size	gmpidev_ops, 40
gmpidev_ops:
	.word	vcodec_create_dev
	.word	vcodec_destory_dev
	.word	vcodec_handle_message
	.word	vcodec_get_chnl_ctx
	.word	vcodec_get_chnl_id
	.word	vcodec_get_chnl_type
	.word	vcodec_set_intra_info
	.word	vcodec_notify_drop_frm
	.word	vcodec_notify
	.word	vcodec_mpidev_struct_size
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	__func____LINE__.37310, %object
	.size	__func____LINE__.37310, 4
__func____LINE__.37310:
	.space	4
	.type	flag.36987, %object
	.size	flag.36987, 4
flag.36987:
	.space	4
	.type	flag.36991, %object
	.size	flag.36991, 4
flag.36991:
	.space	4
	.type	fp.36941, %object
	.size	fp.36941, 4
fp.36941:
	.space	4
	.type	save_venc_input, %object
	.size	save_venc_input, 4
save_venc_input:
	.space	4
	.type	save_ivs_input, %object
	.size	save_ivs_input, 4
save_ivs_input:
	.space	4
	.type	__key.37793, %object
	.size	__key.37793, 0
__key.37793:
	.type	__func____LINE__.37274, %object
	.size	__func____LINE__.37274, 4
__func____LINE__.37274:
	.space	4
	.type	__func____LINE__.37276, %object
	.size	__func____LINE__.37276, 4
__func____LINE__.37276:
	.space	4
	.type	__key.38141, %object
	.size	__key.38141, 0
__key.38141:
	.type	g_venc_dev, %object
	.size	g_venc_dev, 43968
g_venc_dev:
	.space	43968
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_ivs_input_path233, %object
	.size	__UNIQUE_ID_ivs_input_path233, 48
__UNIQUE_ID_ivs_input_path233:
	.ascii	"rockit.parm=ivs_input_path:ivs input saved path\000"
	.type	__UNIQUE_ID_ivs_input_pathtype232, %object
	.size	__UNIQUE_ID_ivs_input_pathtype232, 37
__UNIQUE_ID_ivs_input_pathtype232:
	.ascii	"rockit.parmtype=ivs_input_path:charp\000"
	.type	__UNIQUE_ID_save_ivs_input231, %object
	.size	__UNIQUE_ID_save_ivs_input231, 54
__UNIQUE_ID_save_ivs_input231:
	.ascii	"rockit.parm=save_ivs_input:save ivs input stream da"
	.ascii	"ta\000"
	.type	__UNIQUE_ID_save_ivs_inputtype230, %object
	.size	__UNIQUE_ID_save_ivs_inputtype230, 35
__UNIQUE_ID_save_ivs_inputtype230:
	.ascii	"rockit.parmtype=save_ivs_input:int\000"
	.type	__UNIQUE_ID_venc_input_path229, %object
	.size	__UNIQUE_ID_venc_input_path229, 50
__UNIQUE_ID_venc_input_path229:
	.ascii	"rockit.parm=venc_input_path:venc input saved path\000"
	.type	__UNIQUE_ID_venc_input_pathtype228, %object
	.size	__UNIQUE_ID_venc_input_pathtype228, 38
__UNIQUE_ID_venc_input_pathtype228:
	.ascii	"rockit.parmtype=venc_input_path:charp\000"
	.type	__UNIQUE_ID_save_venc_input227, %object
	.size	__UNIQUE_ID_save_venc_input227, 56
__UNIQUE_ID_save_venc_input227:
	.ascii	"rockit.parm=save_venc_input:save venc input stream "
	.ascii	"data\000"
	.type	__UNIQUE_ID_save_venc_inputtype226, %object
	.size	__UNIQUE_ID_save_venc_inputtype226, 36
__UNIQUE_ID_save_venc_inputtype226:
	.ascii	"rockit.parmtype=save_venc_input:int\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31mstruct venc_pp_md_attr mismatching\033[0m"
	.ascii	"\000"
.LC1:
	.ascii	"\033[1;31mchnId %d need less than %d\033[0m\000"
.LC2:
	.ascii	"\033[1;31mchnId %d and %d need less than %d\033[0m\000"
.LC3:
	.ascii	"\033[1;31mstruct venc_framerate mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;32mchn %d vdev->fps_in %d, vdev->fps_out %d\012"
	.ascii	"\033[0m\000"
.LC5:
	.ascii	"valloc\000"
.LC6:
	.ascii	"venc\000"
.LC7:
	.ascii	"%s_%s\000"
.LC8:
	.ascii	"vcodec\000"
.LC9:
	.ascii	"buf(%d)\000"
.LC10:
	.ascii	"rkv_enc\000"
.LC11:
	.ascii	"\033[1;31mstruct venc_info mismatching\033[0m\000"
.LC12:
	.ascii	"\033[1;31mclear venc node chn %d\033[0m\000"
.LC13:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC14:
	.ascii	"\033[1;31m====== error create venc node\033[0m\000"
.LC15:
	.ascii	"\033[1;31m%s[%d] struct venc_wrap mismatching\033[0"
	.ascii	"m\000"
.LC16:
	.ascii	"ch = %d, warp enable = %d, wrap line = %d\000"
.LC17:
	.ascii	"\033[1;32msend first buf to venc %d, %d, %d ,%d\033"
	.ascii	"[0m\000"
.LC18:
	.ascii	"\033[1;31msend first buf to venc fail: queue is NUL"
	.ascii	"L!\033[0m\000"
.LC19:
	.ascii	"\033[1;31msend first buf to venc fail: push queue e"
	.ascii	"rror!\033[0m\000"
.LC20:
	.ascii	"\033[1;31mstruct venc_frame mismatching\033[0m\000"
.LC21:
	.ascii	"\033[1;31mchnId %d send frame fail: node %px, enc_d"
	.ascii	"ev %px, frameFd %d\033[0m\000"
.LC22:
	.ascii	"\033[1;31mchnId %d send frame fail: pp_node %px, en"
	.ascii	"c_dev %px, frameFd %d\033[0m\000"
.LC23:
	.ascii	"chn %d error!\000"
.LC24:
	.ascii	"venc_pp(%s-%d) buf(%d) ready, pending: %d\000"
.LC25:
	.ascii	"\033[1;31mivs chn %d lost a buf pts = %llu\033[0m\000"
.LC26:
	.ascii	"%s %d\000"
.LC27:
	.ascii	"\033[1;32mstop thread %p\012\033[0m\000"
.LC28:
	.ascii	"\033[1;32mstop thread %p ok\012\033[0m\000"
.LC29:
	.ascii	"======error: index = %d\000"
.LC30:
	.ascii	"======error: ioctl is null\000"
.LC31:
	.ascii	"======error venc ioctl\000"
.LC32:
	.ascii	"\033[1;31mstruct venc_combo mismatching\033[0m\000"
.LC33:
	.ascii	"\033[1;31mstruct venc_snap mismatching\033[0m\000"
.LC34:
	.ascii	"[thunderboot_time] venc run task begin.\000"
.LC35:
	.ascii	"[thunderboot_time] venc done.\000"
.LC36:
	.ascii	"chn %d wrap trigger again\000"
.LC37:
	.ascii	"\033[1;31mrequest thumbnail more than %d\033[0m\000"
.LC38:
	.ascii	"chn %d wrap trigger again, seq: %llu\000"
.LC39:
	.ascii	"\033[1;31mstruct venc_crop mismatching\033[0m\000"
.LC40:
	.ascii	"\033[1;31mstruct venc_pp_od_attr mismatching\033[0m"
	.ascii	"\000"
.LC41:
	.ascii	"\033[1;31mstruct venc_version mismatching\033[0m\000"
.LC42:
	.ascii	"\033[1;31mdata alloc failed!\012\033[0m\000"
.LC43:
	.ascii	"\033[1;31mstruct venc_pp_result mismatching\033[0m\000"
.LC44:
	.ascii	"%s/%dx%d_%d.yuv\000"
.LC45:
	.ascii	"%s: open file error\012\000"
.LC46:
	.ascii	"%s register ok = %p\000"
.LC47:
	.ascii	"\033[1;32mthread exit\012\033[0m\000"
.LC48:
	.ascii	"\033[1;31mvepu pp drop buf(%dx%d)\033[0m\000"
.LC49:
	.ascii	"\033[1;32mcreate thread %p\012\033[0m\000"
.LC50:
	.ascii	"\033[1;31mstruct venc_pp_info mismatching\033[0m\000"
.LC51:
	.ascii	"\033[1;31mchnId %d is exist!\033[0m\000"
.LC52:
	.ascii	"&pp->wait\000"
.LC53:
	.ascii	"md\000"
.LC54:
	.ascii	"\033[1;31merror\033[0m\000"
.LC55:
	.ascii	"od\000"
.LC56:
	.ascii	"smear\000"
.LC57:
	.ascii	"\033[1;31m====== error create venc pp node\033[0m\000"
.LC58:
	.ascii	"rgb[0]:(%d %d %d) rgb[1]:(%d %d %d) ayuv[0]:(%d %d "
	.ascii	"%d %d) ayuv[1]:(%d %d %d %d)\000"
.LC59:
	.ascii	"Inverted cells do not support size\012\000"
.LC60:
	.ascii	"\033[1;31mcreate light lut failed!\033[0m\000"
.LC61:
	.ascii	"rbuv_swap not support\000"
.LC62:
	.ascii	"alpha_swap not support\000"
.LC63:
	.ascii	"\033[1;31merror format!\033[0m\000"
.LC64:
	.ascii	"\033[1;31mchn %d queue is NULL!\033[0m\000"
.LC65:
	.ascii	"\033[1;32mseq lost = %d, %d\033[0m\000"
.LC66:
	.ascii	"\033[1;32mchn %d start wrap buf: %d, %d, %d ,%d, se"
	.ascii	"q_id = %d\033[0m\000"
.LC67:
	.ascii	"\033[1;31mchn %d wrap mode lost buf, seq = %d\033[0"
	.ascii	"m\000"
.LC68:
	.ascii	"\033[1;31mvenc chn %d lost a buf pts = %llu\033[0m\000"
.LC69:
	.ascii	"venc(%s-%d) buf(%d) ready, pending: %d\000"
.LC70:
	.ascii	"\033[1;31mchn %d re send a buf fail seq = %d, pts ="
	.ascii	" %d\033[0m\000"
.LC71:
	.ascii	"\033[1;31mosd kzalloc failed!\033[0m\000"
.LC72:
	.ascii	"\033[1;31mjpg_osd kzalloc failed!\033[0m\000"
.LC73:
	.ascii	"&vdev->thread_lock\000"
.LC74:
	.ascii	"VENC_IOCTL_VERSION\000"
.LC75:
	.ascii	"VENC_IOCTL_NODE_CREATE\000"
.LC76:
	.ascii	"VENC_IOCTL_NODE_DELETE\000"
.LC77:
	.ascii	"VENC_IOCTL_NODE_START\000"
.LC78:
	.ascii	"VENC_IOCTL_NODE_SEND_FRAME\000"
.LC79:
	.ascii	"VENC_IOCTL_NODE_SET_CROP\000"
.LC80:
	.ascii	"VENC_IOCTL_NODE_SET_COMBO\000"
.LC81:
	.ascii	"VENC_IOCTL_NODE_SET_SNAP\000"
.LC82:
	.ascii	"VENC_IOCTL_NODE_PP_CREATE\000"
.LC83:
	.ascii	"VENC_IOCTL_NODE_PP_DELETE\000"
.LC84:
	.ascii	"VENC_IOCTL_NODE_PP_START\000"
.LC85:
	.ascii	"VENC_IOCTL_NODE_PP_SEND_FRAME\000"
.LC86:
	.ascii	"VENC_IOCTL_NODE_PP_GET_RESULT\000"
.LC87:
	.ascii	"VENC_IOCTL_NODE_ENABLE_TB\000"
.LC88:
	.ascii	"VENC_IOCTL_NODE_TB_BIND\000"
.LC89:
	.ascii	"VENC_IOCTL_NODE_TB_REQUEST\000"
.LC90:
	.ascii	"VENC_IOCTL_NODE_GET_CROP\000"
.LC91:
	.ascii	"VENC_IOCTL_NODE_SET_VCODEC_ATTR\000"
.LC92:
	.ascii	"VENC_IOCTL_NODE_GET_VCODEC_ATTR\000"
.LC93:
	.ascii	"VENC_IOCTL_NODE_PP_SET_MD_ATTR\000"
.LC94:
	.ascii	"VENC_IOCTL_NODE_PP_GET_MD_ATTR\000"
.LC95:
	.ascii	"VENC_IOCTL_NODE_CHECK\000"
.LC96:
	.ascii	"VENC_IOCTL_NODE_SET_FRAMERATE\000"
.LC97:
	.ascii	"VENC_IOCTL_NODE_STOP\000"
.LC98:
	.ascii	"VENC_IOCTL_NODE_PP_SET_OD_ATTR\000"
.LC99:
	.ascii	"VENC_IOCTL_NODE_PP_GET_OD_ATTR\000"
.LC100:
	.ascii	"/userdata/\000"
	.section	__param,"a"
	.align	2
	.type	__param_ivs_input_path, %object
	.size	__param_ivs_input_path, 20
__param_ivs_input_path:
	.word	__param_str_ivs_input_path
	.word	0
	.word	param_ops_charp
	.short	420
	.byte	-1
	.byte	0
	.word	ivs_input_path
	.type	__param_save_ivs_input, %object
	.size	__param_save_ivs_input, 20
__param_save_ivs_input:
	.word	__param_str_save_ivs_input
	.word	0
	.word	param_ops_int
	.short	420
	.byte	-1
	.byte	0
	.word	save_ivs_input
	.type	__param_venc_input_path, %object
	.size	__param_venc_input_path, 20
__param_venc_input_path:
	.word	__param_str_venc_input_path
	.word	0
	.word	param_ops_charp
	.short	420
	.byte	-1
	.byte	0
	.word	venc_input_path
	.type	__param_save_venc_input, %object
	.size	__param_save_venc_input, 20
__param_save_venc_input:
	.word	__param_str_save_venc_input
	.word	0
	.word	param_ops_int
	.short	420
	.byte	-1
	.byte	0
	.word	save_venc_input
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
