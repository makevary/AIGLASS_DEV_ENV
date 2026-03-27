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
	.file	"mpp_common.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_show_session_info:					
	.asciz 	"mpp_show_session_info"					
__kstrtabns_mpp_show_session_info:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_srv_get_phy:					
	.asciz 	"mpp_srv_get_phy"					
__kstrtabns_mpp_srv_get_phy:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_get_mppdev_svr_ops:					
	.asciz 	"get_mppdev_svr_ops"					
__kstrtabns_get_mppdev_svr_ops:					
	.asciz 	""					
	.previous						

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
	.type	mpp_taskqueue_pending_to_run, %function
mpp_taskqueue_pending_to_run:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldrd	r4, r3, [r1, #12]
	add	r2, r1, #12
	adds	r0, r0, #60
	str	r3, [r4, #4]
	str	r4, [r3]
	ldr	r3, [r0, #4]
	str	r2, [r0, #4]
	strd	r0, r3, [r1, #12]
	str	r2, [r3]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r4, r5, pc}
	.fnend
	.size	mpp_taskqueue_pending_to_run, .-mpp_taskqueue_pending_to_run
	.align	1
	.global	mpp_chnl_is_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_is_running, %function
mpp_chnl_is_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #16]!
	ldr	r2, [r3], #-4
	subs	r2, r2, #4
.L4:
	adds	r5, r3, #4
	cmp	r5, r0
	bne	.L6
	movs	r0, #0
.L5:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r4, r5, pc}
.L6:
	ldr	r3, [r3, #20]
	lsls	r3, r3, #30
	bmi	.L7
	ldr	r5, [r2, #4]
	mov	r3, r2
	subs	r2, r5, #4
	b	.L4
.L7:
	movs	r0, #1
	b	.L5
	.fnend
	.size	mpp_chnl_is_running, .-mpp_chnl_is_running
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_ioctl, %function
mpp_dev_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_dev_ioctl, .-mpp_dev_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_get_dev, %function
mpp_chnl_get_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #12]
	ldr	r0, [r3]
	bx	lr
	.fnend
	.size	mpp_chnl_get_dev, .-mpp_chnl_get_dev
	.align	1
	.global	get_mppdev_svr_ops
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mppdev_svr_ops, %function
get_mppdev_svr_ops:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L11
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.fnend
	.size	get_mppdev_svr_ops, .-get_mppdev_svr_ops
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_get_idle_task, %function
mpp_session_get_idle_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #16
	mov	r6, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, [r0, #16]
	ldr	r8, .L28
	ldr	r9, .L28+4
	ldr	r5, [r4], #-4
	ldr	r10, .L28+8
	subs	r5, r5, #4
.L14:
	adds	r3, r4, #4
	add	r2, r6, #16
	cmp	r3, r2
	bne	.L17
	movs	r3, #0
.L19:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r3, #0
	it	eq
	moveq	r4, #0
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L17:
	cbz	r4, .L15
	ldr	r3, [r8]
	lsls	r2, r3, #22
	bpl	.L16
	ldr	r3, [r4]
	mov	r1, r9
	str	r6, [sp, #12]
	mov	r0, r10
	ldr	r2, [r3, #68]
	strd	r3, r2, [sp, #4]
	movs	r2, #125
	ldr	r3, [r4, #20]
	str	r3, [sp]
	ldr	r3, [r4, #100]
	bl	printk
.L16:
	ldr	r3, [r4, #20]
	lsls	r3, r3, #30
	bmi	.L15
	movs	r3, #1
	b	.L19
.L15:
	ldr	r3, [r5, #4]
	mov	r4, r5
	subs	r5, r3, #4
	b	.L14
.L29:
	.align	2
.L28:
	.word	mpp_dev_debug
	.word	.LANCHOR1
	.word	.LC0
	.fnend
	.size	mpp_session_get_idle_task, .-mpp_session_get_idle_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_attach_workqueue, %function
mpp_session_attach_workqueue:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r3, .L35
	mov	r5, r1
	ldr	r3, [r3]
	lsls	r3, r3, #9
	bpl	.L31
	ldr	r2, [r0, #4]
	mov	r1, r0
	ldr	r0, .L35+4
	bl	printk
.L31:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r5, #36]
	add	r2, r4, #48
	adds	r5, r5, #32
	str	r2, [r5, #4]
	strd	r5, r3, [r4, #48]
	str	r2, [r3]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, pc}
.L36:
	.align	2
.L35:
	.word	mpp_dev_debug
	.word	.LC1
	.fnend
	.size	mpp_session_attach_workqueue, .-mpp_session_attach_workqueue
	.align	1
	.global	mpp_show_session_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_show_session_info, %function
mpp_show_session_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L50
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r4, [r3]
	mov	r8, r1
	add	r6, r4, #144
	mov	r0, r6
	bl	mutex_lock
	ldr	r0, [r4, #156]!
	ldr	r5, [r0], #-40
	subs	r5, r5, #40
.L38:
	add	r3, r0, #40
	cmp	r3, r4
	bne	.L40
	mov	r0, r6
	bl	mutex_unlock
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L40:
	ldr	r3, [r0, #68]
	cmp	r3, r8
	bne	.L39
	ldr	r3, [r0, #56]
	cbz	r3, .L39
	ldr	r3, [r0, #12]
	cbz	r3, .L39
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #60]
	cbz	r3, .L39
	mov	r1, r7
	blx	r3
.L39:
	ldr	r3, [r5, #40]
	mov	r0, r5
	sub	r5, r3, #40
	b	.L38
.L51:
	.align	2
.L50:
	.word	.LANCHOR2
	.fnend
	.size	mpp_show_session_info, .-mpp_show_session_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_write_u32, %function
fops_write_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r2
	ldr	r3, [r0, #128]
	mov	r5, r1
	movs	r2, #0
	mov	r1, r4
	mov	r0, r5
	ldr	r3, [r3, #64]
	bl	kstrtouint_from_user
	cmp	r0, #0
	it	eq
	moveq	r0, r4
	pop	{r3, r4, r5, pc}
	.fnend
	.size	fops_write_u32, .-fops_write_u32
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_open_u32, %function
fops_open_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	bl	PDE_DATA
	ldr	r1, .L55
	mov	r2, r0
	mov	r0, r4
	pop	{r4, lr}
	b	single_open
.L56:
	.align	2
.L55:
	.word	fops_show_u32
	.fnend
	.size	fops_open_u32, .-fops_open_u32
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_open_clk, %function
fops_open_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	bl	PDE_DATA
	ldr	r1, .L58
	mov	r2, r0
	mov	r0, r4
	pop	{r4, lr}
	b	single_open
.L59:
	.align	2
.L58:
	.word	fops_show_clk
	.fnend
	.size	fops_open_clk, .-fops_open_clk
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_show_u32, %function
fops_show_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #64]
	ldr	r1, .L61
	ldr	r2, [r3]
	bl	seq_printf
	movs	r0, #0
	pop	{r3, pc}
.L62:
	.align	2
.L61:
	.word	.LC2
	.fnend
	.size	fops_show_u32, .-fops_show_u32
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_write_clk, %function
fops_write_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #92
	sub	sp, sp, #92
	ldr	r6, .L90
	add	r7, sp, #8
	cmp	r2, #63
	mov	r5, r2
	ldr	r3, [r6]
	str	r3, [sp, #84]
	ldr	r3, [r0, #128]
	ldr	r8, [r3, #64]
	mov	r3, #0
	str	r3, [sp, #8]
	strd	r3, r3, [r7, #4]
	bhi	.L79
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #8]
	.syntax unified
@ 157 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r0, r1, r2; sbcscc r0, r0, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L80
	add	r0, sp, #20
	bl	arm_copy_from_user
.L65:
	cmp	r0, #0
	beq	.L89
	mvn	r0, #13
	b	.L63
.L80:
	mov	r0, r2
	b	.L65
.L70:
	mov	r2, r9
	movs	r1, #10
	bl	kstrtouint
	cbnz	r0, .L67
	ldr	r2, [r9]
	adds	r4, r4, #1
	cmp	r2, r10
	itt	ls
	ldrls	r3, .L90+4
	mulls	r2, r3, r2
	str	r2, [r9], #4
.L67:
	mov	r1, fp
	add	r0, sp, #4
	bl	strsep
	cbz	r0, .L74
	cmp	r4, #3
	bne	.L70
.L74:
	subs	r4, r4, #1
	ldr	r0, [r8]
	cmp	r4, #0
	bgt	.L75
	ldr	r4, [sp, #8]
	bl	clk_get_rate
	cmp	r4, r0
	beq	.L76
	mov	r1, r4
	ldr	r0, [r8]
	bl	clk_set_rate
.L76:
	mov	r0, r5
.L63:
	ldr	r2, [sp, #84]
	ldr	r3, [r6]
	cmp	r2, r3
	beq	.L78
	bl	__stack_chk_fail
.L75:
	mov	r9, r4
.L72:
	adds	r9, r9, #-1
	bcs	.L73
	cmp	r0, #0
	beq	.L74
	ldr	r1, [r7, r4, lsl #2]
	bl	clk_set_rate
	b	.L74
.L73:
	bl	clk_get_parent
	b	.L72
.L79:
	mvn	r0, #21
	b	.L63
.L89:
	add	r3, sp, #88
	mov	r9, r7
	add	r3, r3, r5
	mov	r4, r0
	ldr	fp, .L90+8
	strb	r0, [r3, #-68]
	add	r3, sp, #20
	ldr	r10, .L90+12
	str	r3, [sp, #4]
	b	.L67
.L78:
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L91:
	.align	2
.L90:
	.word	__stack_chk_guard
	.word	1000000
	.word	.LC3
	.word	999999
	.fnend
	.size	fops_write_clk, .-fops_write_clk
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	fops_show_clk, %function
fops_show_clk:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r5, [r0, #64]
	.pad #20
	sub	sp, sp, #20
	ldr	r0, [r5]
	bl	clk_get_rate
	mov	r7, r0
	ldr	r0, [r5]
	bl	__clk_get_hw
	mov	r8, r0
	cmp	r0, #0
	beq	.L93
	bl	clk_hw_get_num_parents
	mov	r9, r0
	ldr	r0, [r5]
	bl	clk_get_parent
	mov	r6, r0
	ldr	r0, [r5]
	bl	__clk_get_name
	mov	r3, r7
	ldr	r1, .L104
	mov	r2, r0
	mov	r0, r4
	bl	seq_printf
	cbz	r6, .L94
	ldr	r1, .L104+4
	mov	r0, r4
	bl	seq_printf
	mov	r0, r6
	bl	__clk_get_name
	mov	r5, r0
	mov	r0, r6
	bl	clk_get_rate
	mov	r2, r5
	ldr	r1, .L104+8
	mov	r3, r0
	mov	r0, r4
	bl	seq_printf
.L94:
	ldr	r10, .L104+16
	movs	r5, #0
	ldr	fp, .L104+20
	ldr	r7, .L104+12
.L95:
	cmp	r5, r9
	bne	.L98
.L103:
	movs	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L98:
	mov	r1, r5
	mov	r0, r8
	bl	clk_hw_get_parent_by_index
	mov	r6, r0
	bl	clk_hw_get_name
	str	r0, [sp, #12]
	mov	r0, r6
	bl	clk_hw_get_rate
	mov	r2, r5
	mov	r1, r10
	str	r0, [sp]
	mov	r0, r4
	ldr	r3, [sp, #12]
	bl	seq_printf
.L97:
	mov	r0, r6
	bl	clk_hw_get_parent
	mov	r6, r0
	cbz	r0, .L96
	bl	clk_hw_get_name
	str	r0, [sp, #12]
	mov	r0, r6
	bl	clk_hw_get_rate
	mov	r1, fp
	mov	r3, r0
	ldr	r2, [sp, #12]
	mov	r0, r4
	bl	seq_printf
	b	.L97
.L93:
	ldr	r0, [r5]
	bl	__clk_get_name
	mov	r3, r7
	ldr	r1, .L104
	mov	r2, r0
	mov	r0, r4
	bl	seq_printf
	b	.L103
.L96:
	mov	r1, r7
	mov	r0, r4
	bl	seq_printf
	adds	r5, r5, #1
	b	.L95
.L105:
	.align	2
.L104:
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC9
	.word	.LC7
	.word	.LC8
	.fnend
	.size	fops_show_clk, .-fops_show_clk
	.align	1
	.global	mpp_srv_get_phy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_srv_get_phy, %function
mpp_srv_get_phy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L107
	ldr	r3, [r3]
	ldr	r1, [r3, #4]
	b	mpp_dma_get_iova
.L108:
	.align	2
.L107:
	.word	.LANCHOR2
	.fnend
	.size	mpp_srv_get_phy, .-mpp_srv_get_phy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_get_iova_addr, %function
mpp_chnl_get_iova_addr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r1
	cbz	r0, .L113
	ldr	r2, [r0, #12]
	mov	r0, r3
	pop	{r3, lr}
	ldr	r1, [r2]
	b	mpp_dma_get_iova
.L113:
	movw	r2, #2110
	ldr	r1, .L114
	ldr	r0, .L114+4
	bl	printk
	mov	r0, #-1
	pop	{r3, pc}
.L115:
	.align	2
.L114:
	.word	.LANCHOR1+26
	.word	.LC10
	.fnend
	.size	mpp_chnl_get_iova_addr, .-mpp_chnl_get_iova_addr
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_init, %function
mpp_session_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L124
	mov	r1, #3520
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, [r3, #28]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L116
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #472]
	str	r3, [r0, #24]
	add	r3, r0, #16
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	add	r3, r0, #40
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	add	r3, r0, #48
	str	r3, [r0, #48]
	str	r3, [r0, #52]
	movs	r3, #0
	str	r3, [r0, #28]
	str	r3, [r0, #32]
	ldr	r3, .L124+4
	ldr	r3, [r3]
	lsls	r3, r3, #9
	bpl	.L116
	mov	r1, r0
	ldr	r0, .L124+8
	bl	printk
.L116:
	mov	r0, r4
	pop	{r4, pc}
.L125:
	.align	2
.L124:
	.word	kmalloc_caches
	.word	mpp_dev_debug
	.word	.LC11
	.fnend
	.size	mpp_session_init, .-mpp_session_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_open, %function
mpp_dev_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r0
	ldr	r6, .L140
	mov	r8, r1
	ldr	r5, [r0, #320]
	ldr	r3, [r6]
	sub	r9, r5, #12
	lsls	r2, r3, #26
	bpl	.L127
	movw	r2, #1305
	ldr	r1, .L140+4
	ldr	r0, .L140+8
	bl	printk
.L127:
	bl	mpp_session_init
	mov	r4, r0
	cbz	r0, .L128
	str	r9, [r0, #8]
	cmp	r9, #0
	beq	.L129
	add	r9, r5, #132
	adds	r5, r5, #144
	mov	r0, r9
	bl	mutex_lock
	ldr	r2, [r5, #4]
	add	r3, r4, #40
	mov	r0, r9
	str	r3, [r5, #4]
	strd	r5, r2, [r4, #40]
	str	r3, [r2]
	bl	mutex_unlock
.L129:
	ldr	r3, .L140+12
	str	r3, [r4, #84]
	ldr	r3, .L140+16
	str	r3, [r4, #88]
	ldr	r3, .L140+20
	str	r3, [r4, #92]
	ldr	r3, [r6]
	str	r4, [r8, #128]
	lsls	r3, r3, #26
	bpl	.L130
	movw	r2, #1323
	ldr	r1, .L140+4
	ldr	r0, .L140+24
	bl	printk
.L130:
	mov	r1, r8
	mov	r0, r7
	pop	{r3, r4, r5, r6, r7, r8, r9, lr}
	b	nonseekable_open
.L128:
	mvn	r0, #11
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L141:
	.align	2
.L140:
	.word	mpp_dev_debug
	.word	.LANCHOR1+49
	.word	.LC12
	.word	mpp_process_task_default
	.word	mpp_wait_result_default
	.word	mpp_session_deinit_default
	.word	.LC13
	.fnend
	.size	mpp_dev_open, .-mpp_dev_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_fetch_add_relaxed.constprop.25, %function
atomic_fetch_add_relaxed.constprop.25:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	pld	[r0]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_fetch_add
1:	ldrex	r0, [r3]
	add	r2, r0, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_fetch_add_relaxed.constprop.25, .-atomic_fetch_add_relaxed.constprop.25
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_open, %function
mpp_chnl_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r6, .L177
	ldr	r3, [r6]
	cbnz	r3, .L144
.L146:
	movs	r4, #0
.L143:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L144:
	bl	mpp_session_init
	mov	r4, r0
	cmp	r0, #0
	beq	.L146
	movs	r3, #1
	str	r3, [r4, #72]
	movs	r3, #0
	strb	r3, [r4, #80]
	ldr	r3, .L177+4
	ldr	r0, [r6]
	str	r3, [r4, #84]
	ldr	r3, .L177+8
	str	r0, [r4, #8]
	str	r3, [r4, #88]
	ldr	r3, .L177+12
	str	r3, [r4, #92]
	cbz	r0, .L147
	adds	r0, r0, #144
	bl	mutex_lock
	ldr	r3, [r6]
	add	r2, r4, #40
	adds	r3, r3, #156
	ldr	r1, [r3, #4]
	str	r2, [r3, #4]
	strd	r3, r1, [r4, #40]
	str	r2, [r1]
	ldr	r0, [r6]
	adds	r0, r0, #144
	bl	mutex_unlock
.L147:
	cmp	r5, #2
	itt	eq
	moveq	r5, #1
	strbeq	r5, [r4, #80]
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r5, #3
	sbc	r3, r5, r5
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r5, r5, r3
	ldr	r3, [r6]
	add	r3, r3, r5, lsl #2
	ldr	r6, [r3, #100]
	cmp	r6, #0
	beq	.L146
	str	r5, [r4]
	str	r6, [r4, #12]
	ldr	r3, [r6, #12]
	cbz	r3, .L150
	ldr	r3, [r3]
	cbz	r3, .L151
	str	r3, [r4, #84]
.L151:
	ldr	r3, [r6, #12]
	ldr	r3, [r3, #4]
	cbz	r3, .L152
	str	r3, [r4, #88]
.L152:
	ldr	r3, [r6, #12]
	ldr	r3, [r3, #8]
	cbz	r3, .L150
	str	r3, [r4, #92]
.L150:
	add	r0, r6, #68
	bl	atomic_fetch_add_relaxed.constprop.25
	str	r0, [r4, #4]
	ldr	r3, [r6, #12]
	cbnz	r3, .L154
.L155:
	ldr	r1, [r6, #84]
	mov	r0, r4
	bl	mpp_session_attach_workqueue
	b	.L143
.L154:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L155
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	beq	.L155
	b	.L146
.L178:
	.align	2
.L177:
	.word	.LANCHOR2
	.word	mpp_process_task_default
	.word	mpp_wait_result_default
	.word	mpp_session_deinit_default
	.fnend
	.size	mpp_chnl_open, .-mpp_chnl_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_add.constprop.26, %function
atomic_add.constprop.26:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r0]
	add	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_add.constprop.26, .-atomic_add.constprop.26
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_process_task_default, %function
mpp_process_task_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r5, r0
	ldr	r3, [r0, #12]
	mov	r7, r1
	cbnz	r3, .L181
	ldr	r3, [r0]
	mov	r2, #532
	ldr	r1, .L201
	str	r3, [sp]
	ldr	r3, [r0, #24]
	ldr	r0, .L201+4
	bl	printk
	mvn	r0, #21
.L180:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L181:
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #16]
	cbnz	r3, .L183
.L184:
	movw	r2, #539
	ldr	r1, .L201
	ldr	r0, .L201+8
	bl	printk
	mvn	r0, #11
	b	.L180
.L183:
	blx	r3
	mov	r4, r0
	cmp	r0, #0
	beq	.L184
	ldr	r6, [r0, #116]
	cbnz	r6, .L185
	ldr	r6, [r5, #12]
.L185:
	movs	r3, #1
	ldr	r2, .L201+12
	str	r3, [r4, #72]
	add	r0, r4, #108
	ldr	r1, .L201+16
	mov	r8, #0
	bl	__init_waitqueue_head
	str	r8, [r4, #24]
	add	r0, r6, #76
	bl	atomic_fetch_add_relaxed.constprop.25
	mvn	r3, #31
	str	r3, [r4, #28]
	add	r3, r4, #32
	str	r3, [r4, #32]
	str	r3, [r4, #36]
	mov	r2, #2097152
	ldr	r3, .L201+20
	str	r0, [r4, #100]
	add	r0, r4, #44
	ldr	r1, .L201+24
	str	r3, [r4, #40]
	mov	r3, r8
	str	r8, [sp]
	bl	init_timer_key
	ldrb	r3, [r6, #36]	@ zero_extendqisi2
	cbz	r3, .L186
	ldr	r3, [r6, #8]
	ldr	r3, [r3, #16]
	cbz	r3, .L186
	mov	r1, r4
	mov	r0, r6
	blx	r3
.L186:
	ldr	r3, [r6, #84]
	add	r0, r5, #28
	str	r6, [r7, #28]
	add	r6, r4, #72
	strd	r3, r4, [r7, #20]
	bl	atomic_add.constprop.26
	mov	r0, r6
	bl	atomic_fetch_add_relaxed.constprop.25
	cmp	r0, #0
	bne	.L187
	movs	r1, #2
.L200:
	mov	r0, r6
	bl	refcount_warn_saturate
.L188:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r5, #20]
	adds	r3, r4, #4
	add	r0, r5, #16
	str	r3, [r5, #20]
	strd	r0, r2, [r4, #4]
	str	r3, [r2]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L201+28
	ldr	r0, [r3]
	ands	r0, r0, #512
	beq	.L180
	ldr	r3, [r4, #20]
	movw	r2, #569
	ldr	r1, .L201
	ldr	r0, .L201+32
	str	r3, [sp, #8]
	ldr	r3, [r4, #100]
	str	r3, [sp, #4]
	ldr	r3, [r5, #4]
	str	r3, [sp]
	ldr	r3, [r5]
	bl	printk
	movs	r0, #0
	b	.L180
.L187:
	blt	.L189
	cmn	r0, #1
	bpl	.L188
.L189:
	movs	r1, #1
	b	.L200
.L202:
	.align	2
.L201:
	.word	.LANCHOR1+62
	.word	.LC14
	.word	.LC15
	.word	.LANCHOR2+4
	.word	.LC16
	.word	mpp_task_timeout_work
	.word	delayed_work_timer_fn
	.word	mpp_dev_debug
	.word	.LC17
	.fnend
	.size	mpp_process_task_default, .-mpp_process_task_default
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	list_del_init, %function
list_del_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	str	r0, [r0]
	str	r0, [r0, #4]
	bx	lr
	.fnend
	.size	list_del_init, .-list_del_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_detach_workqueue, %function
mpp_detach_workqueue:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r1, [r0, #84]
	cbz	r1, .L204
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #104]
	movs	r5, #0
	adds	r3, r3, #22
	str	r5, [r1, r3, lsl #2]
	adds	r1, r1, #92
	ldr	r0, [r1, #4]
	subs	r0, r0, #1
	str	r0, [r1, #4]
	bl	_clear_bit
	add	r0, r4, #96
	bl	list_del_init
	str	r5, [r4, #84]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L204:
	pop	{r4, r5, r6, pc}
	.fnend
	.size	mpp_detach_workqueue, .-mpp_detach_workqueue
	.align	1
	.global	mpp_free_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_free_task, %function
mpp_free_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r5, r0
	ldr	r4, [r0, #-72]
	sub	r6, r0, #72
	cbnz	r4, .L210
	mov	r3, r6
	mov	r2, #456
	ldr	r1, .L220
	ldr	r0, .L220+4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	printk
.L210:
	ldr	r3, .L220+8
	ldr	r3, [r3]
	lsls	r3, r3, #22
	bpl	.L211
	ldr	r3, [r0, #-48]
	mov	r2, #464
	ldr	r1, .L220
	str	r3, [sp, #12]
	ldr	r3, [r0, #-52]
	str	r3, [sp, #8]
	ldr	r3, [r0, #28]
	ldr	r0, .L220+12
	str	r3, [sp, #4]
	ldr	r3, [r4, #4]
	str	r3, [sp]
	ldr	r3, [r4]
	bl	printk
.L211:
	ldr	r5, [r5, #44]
	cbnz	r5, .L212
	ldr	r5, [r4, #12]
.L212:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #44]
	cbz	r3, .L213
	mov	r1, r6
	mov	r0, r4
	blx	r3
.L213:
	add	r3, r4, #28
	pld	[r3]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	add	r3, r5, #72
	pld	[r3]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r2, [r3]
	sub	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L221:
	.align	2
.L220:
	.word	.LANCHOR1+87
	.word	.LC18
	.word	mpp_dev_debug
	.word	.LC19
	.fnend
	.size	mpp_free_task, .-mpp_free_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	kref_put.constprop.14, %function
kref_put.constprop.14:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	pld	[r0]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_fetch_sub
1:	ldrex	r4, [r0]
	sub	r2, r4, #1
	strex	r1, r2, [r0]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r4, #1
	bne	.L223
	bl	mpp_free_task
.L222:
	mov	r0, r4
	pop	{r4, pc}
.L223:
	cmp	r4, #0
	bgt	.L225
	movs	r1, #3
	bl	refcount_warn_saturate
.L225:
	movs	r4, #0
	b	.L222
	.fnend
	.size	kref_put.constprop.14, .-kref_put.constprop.14
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_clear.constprop.10, %function
mpp_session_clear.constprop.10:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r4, r0
	ldr	r1, [r4, #16]!
	ldr	r5, [r1], #-4
	subs	r5, r5, #4
.L227:
	adds	r6, r1, #4
	cmp	r6, r4
	bne	.L228
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L228:
	add	r0, r1, #24
	bl	atomic_add.constprop.26
	mov	r0, r6
	bl	list_del_init
	add	r0, r1, #72
	bl	kref_put.constprop.14
	ldr	r3, [r5, #4]
	mov	r1, r5
	subs	r5, r3, #4
	b	.L227
	.fnend
	.size	mpp_session_clear.constprop.10, .-mpp_session_clear.constprop.10
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_deinit_default, %function
mpp_session_deinit_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #12]
	cbz	r3, .L230
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #56]
	cbz	r3, .L231
	blx	r3
.L231:
	mov	r0, r4
	bl	mpp_session_clear.constprop.10
.L230:
	ldr	r5, [r4, #8]
	cbz	r5, .L232
	adds	r5, r5, #144
	mov	r0, r5
	bl	mutex_lock
	add	r0, r4, #40
	bl	list_del_init
	mov	r0, r5
	bl	mutex_unlock
.L232:
	add	r0, r4, #48
	pop	{r3, r4, r5, lr}
	b	list_del_init
	.fnend
	.size	mpp_session_deinit_default, .-mpp_session_deinit_default
	.align	1
	.global	mpp_taskqueue_get_pending_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_taskqueue_get_pending_task, %function
mpp_taskqueue_get_pending_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #52]!
	cmp	r3, r0
	ite	ne
	subne	r0, r3, #12
	moveq	r0, #0
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	mpp_taskqueue_get_pending_task, .-mpp_taskqueue_get_pending_task
	.align	1
	.global	mpp_taskqueue_get_running_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_taskqueue_get_running_task, %function
mpp_taskqueue_get_running_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #60]!
	cmp	r3, r0
	ite	ne
	subne	r0, r3, #12
	moveq	r0, #0
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	mpp_taskqueue_get_running_task, .-mpp_taskqueue_get_running_task
	.align	1
	.global	mpp_taskqueue_pop_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_taskqueue_pop_running, %function
mpp_taskqueue_pop_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r1]
	push	{r4, lr}
	.save {r4, lr}
	cbz	r3, .L251
	ldr	r3, [r3, #12]
	cbz	r3, .L251
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r1, #12
	bl	list_del_init
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r1, #72
	bl	kref_put.constprop.14
	movs	r0, #0
.L248:
	pop	{r4, pc}
.L251:
	mvn	r0, #21
	b	.L248
	.fnend
	.size	mpp_taskqueue_pop_running, .-mpp_taskqueue_pop_running
	.thumb_set mpp_taskqueue_pop_pending,mpp_taskqueue_pop_running
	.align	1
	.global	mpp_taskqueue_trigger_work
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_taskqueue_trigger_work, %function
mpp_taskqueue_trigger_work:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r0, #16
	ldr	r0, [r0, #84]
	b	kthread_queue_work
	.fnend
	.size	mpp_taskqueue_trigger_work, .-mpp_taskqueue_trigger_work
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_add_req, %function
mpp_chnl_add_req:
	.fnstart
	@ args = 0, pretend = 0, frame = 384
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #396
	sub	sp, sp, #396
	mov	r7, r1
	mov	r4, r0
	mov	r2, #368
	movs	r1, #0
	add	r0, sp, #24
	ldr	r10, .L406+32
	bl	memset
	adds	r7, r7, #24
	mov	r8, r10
.L307:
	ldr	r6, [sp, #60]
	add	r3, sp, #24
	mov	ip, #20
	ldr	r1, [r7, #-24]
	mla	ip, ip, r6, r3
	str	r1, [ip, #48]
	ldr	r2, [r7, #-20]
	str	r2, [ip, #52]
	ldr	r3, [r7, #-16]
	str	r3, [ip, #56]
	ldr	r5, [r7, #-12]
	str	r5, [ip, #60]
	ldr	r0, [r7, #-8]
	str	r0, [ip, #64]
	ldr	r0, [r10]
	lsls	r0, r0, #27
	bpl	.L254
	str	r5, [sp]
	ldr	r0, .L406
	bl	printk
.L254:
	add	r2, sp, #24
	movs	r3, #20
	mla	r3, r3, r6, r2
	ldr	r1, [r3, #48]
	sub	r3, r1, #512
	cmp	r3, #4
	bls	.L310
	cmp	r1, #768
	beq	.L256
	bic	r3, r1, #256
	cmp	r3, #2
	ite	hi
	movhi	r3, #0
	movls	r3, #1
.L255:
	sub	r2, r1, #1024
	cmp	r2, #6
	bls	.L256
	cmp	r3, #0
	bne	.L256
	mov	r3, r1
	ldr	r0, .L406+4
	ldr	r1, .L406+8
	movw	r2, #1086
.L405:
	bl	printk
	b	.L403
.L310:
	movs	r3, #1
	b	.L255
.L394:
	ldr	r3, [r8]
	ldr	r5, [r4, #8]
	lsls	r2, r3, #27
	bpl	.L258
	ldr	r0, .L406+12
	bl	printk
.L258:
	add	r3, sp, #24
	mov	ip, #20
	mla	ip, ip, r6, r3
	ldr	r1, [ip, #48]
	cmp	r1, #258
	beq	.L259
	bhi	.L260
	cmp	r1, #2
	beq	.L261
	bhi	.L262
	cmp	r1, #0
	beq	.L263
	cmp	r1, #1
	beq	.L264
.L265:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L297
	ldr	r3, [r4]
	movw	r2, #1278
	ldr	r1, .L406+16
	ldr	r0, .L406+20
	str	r3, [sp]
	ldr	r3, [r4, #24]
	bl	printk
	b	.L403
.L262:
	cmp	r1, #256
	beq	.L266
	movw	r3, #257
	cmp	r1, r3
	bne	.L265
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L403
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r0, [ip, #64]
	ldr	r1, [r3, #8]
	subs	r1, r1, #1
	.syntax unified
@ 1232 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.c" 1
	.ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r2,r2; .ifnc r2r2,fpr11; .ifnc r2r2,r11fp; .ifnc r2r2,ipr12; .ifnc r2r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	bl	__get_user_4
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L396
.L260:
	cmp	r1, #768
	beq	.L268
	bhi	.L269
	sub	r3, r1, #512
	cmp	r3, #3
	bhi	.L265
	ldr	r3, [sp, #56]
	ldr	r2, [ip, #52]
	orrs	r3, r3, r2
	str	r3, [sp, #56]
	ldr	r3, [sp, #64]
	adds	r3, r3, #1
	str	r3, [sp, #64]
	b	.L259
.L269:
	cmp	r1, #1024
	beq	.L271
	movw	r3, #1030
	cmp	r1, r3
	bne	.L265
	ldr	r3, [ip, #64]
	mov	r2, #1272
	ldr	r1, .L406+16
	ldr	r0, .L406+24
	ldr	r3, [r3]
	str	r3, [r4, #76]
	bl	printk
	b	.L259
.L263:
	ldr	r3, [r8]
	ldr	r5, [r5, #80]
	lsls	r3, r3, #27
	bpl	.L273
	mov	r1, r5
	ldr	r0, .L406+28
	bl	printk
.L273:
	add	r2, sp, #24
	movs	r3, #20
	mla	r3, r3, r6, r2
	mov	r2, sp
	bic	r2, r2, #8160
	bic	r2, r2, #31
	ldr	r1, [r2, #8]
	mov	r2, r5
.L398:
	ldr	r0, [r3, #64]
.L400:
	subs	r1, r1, #1
	.syntax unified
@ 1147 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.c" 1
	.ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r2,r2; .ifnc r2r2,fpr11; .ifnc r2r2,r11fp; .ifnc r2r2,ipr12; .ifnc r2r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	bl	__put_user_4
@ 0 "" 2
	.thumb
	.syntax unified
.L396:
	cmp	r0, #0
	beq	.L259
.L403:
	mvn	r5, #13
.L253:
	mov	r0, r5
	add	sp, sp, #396
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L407:
	.align	2
.L406:
	.word	.LC20
	.word	.LC21
	.word	.LANCHOR1+101
	.word	.LC23
	.word	.LANCHOR1+152
	.word	.LC31
	.word	.LC30
	.word	.LC24
	.word	mpp_dev_debug
.L264:
	cbz	r4, .L275
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L276
.L275:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	add	r2, sp, #24
	ldr	r1, [r3, #8]
	movs	r3, #20
	mla	r3, r3, r6, r2
	subs	r1, r1, #1
	ldr	r0, [r3, #64]
	.syntax unified
@ 1160 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.c" 1
	.ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r2,r2; .ifnc r2r2,fpr11; .ifnc r2r2,r11fp; .ifnc r2r2,ipr12; .ifnc r2r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	bl	__get_user_4
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r9, r2
	cmp	r0, #0
	bne	.L403
	ldr	r3, [r8]
	lsls	r0, r3, #27
	bpl	.L277
	mov	r1, r2
	ldr	r0, .L408
	bl	printk
.L277:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r9, #3
	sbc	r2, r9, r9
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	and	r2, r9, r2
	add	r1, r5, #80
	cmp	r2, #0
	mov	r3, r2
	it	lt
	addlt	r3, r2, #31
	asrs	r3, r3, #5
	ldr	r3, [r1, r3, lsl #2]
	and	r1, r2, #31
	lsrs	r3, r3, r1
	lsls	r1, r3, #31
	bpl	.L403
	add	r2, r5, r2, lsl #2
	ldr	r3, [r2, #100]
	cmp	r3, #0
	beq	.L403
.L276:
	ldr	r3, [r3, #4]
	ldr	r5, [r3, #4]
	ldr	r3, [r8]
	lsls	r2, r3, #27
	bpl	.L279
	ldr	r1, [r5, #8]
	ldr	r0, .L408+4
	bl	printk
.L279:
	add	r2, sp, #24
	movs	r3, #20
	mla	r3, r3, r6, r2
	mov	r2, sp
	bic	r2, r2, #8160
	bic	r2, r2, #31
	ldr	r1, [r2, #8]
	ldr	r2, [r5, #8]
	b	.L398
.L261:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r0, [ip, #64]
	ldr	r1, [r3, #8]
	subs	r1, r1, #1
	.syntax unified
@ 1180 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.c" 1
	.ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r2,r2; .ifnc r2r2,fpr11; .ifnc r2r2,r11fp; .ifnc r2r2,ipr12; .ifnc r2r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	bl	__get_user_4
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, r2
	cmp	r0, #0
	bne	.L403
	cmp	r2, #512
	ldr	r5, [ip, #64]
	beq	.L311
	bhi	.L282
	cbz	r2, .L312
	cmp	r2, #256
	beq	.L313
.L283:
	movw	r2, #1125
	ldr	r1, .L408+8
	ldr	r0, .L408+12
	bl	printk
	movs	r2, #0
.L281:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	mov	r0, r5
	ldr	r1, [r3, #8]
	b	.L400
.L282:
	cmp	r2, #768
	beq	.L314
	cmp	r2, #1024
	bne	.L283
	movw	r2, #1031
	b	.L281
.L311:
	movw	r2, #517
	b	.L281
.L312:
	movs	r2, #3
	b	.L281
.L313:
	movw	r2, #259
	b	.L281
.L314:
	movw	r2, #769
	b	.L281
.L266:
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r0, [ip, #64]
	ldr	r1, [r3, #8]
	subs	r1, r1, #1
	.syntax unified
@ 1189 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.c" 1
	.ifnc r0,r0; .ifnc r0r0,fpr11; .ifnc r0r0,r11fp; .ifnc r0r0,ipr12; .ifnc r0r0,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r2,r2; .ifnc r2r2,fpr11; .ifnc r2r2,r11fp; .ifnc r2r2,ipr12; .ifnc r2r2,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	.ifnc r1,r1; .ifnc r1r1,fpr11; .ifnc r1r1,r11fp; .ifnc r1r1,ipr12; .ifnc r1r1,r12ip; .err; .endif; .endif; .endif; .endif; .endif
	bl	__get_user_4
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r9, r2
	cmp	r0, #0
	bne	.L403
	ldr	r3, [r8]
	lsls	r3, r3, #27
	bpl	.L284
	mov	r1, r2
	ldr	r0, .L408
	bl	printk
.L284:
	cmp	r9, #2
	bls	.L285
	movs	r3, #3
	movw	r2, #1195
	ldr	r1, .L408+16
	ldr	r0, .L408+20
	b	.L405
.L409:
	.align	2
.L408:
	.word	.LC25
	.word	.LC26
	.word	.LANCHOR1+135
	.word	.LC27
	.word	.LANCHOR1+152
	.word	.LC28
.L285:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r9, #3
	sbc	r2, r9, r9
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	and	r2, r9, r2
	add	r5, r5, r2, lsl #2
	ldr	r5, [r5, #100]
	cmp	r5, #0
	beq	.L403
	str	r2, [r4]
	str	r5, [r4, #12]
	ldr	r3, [r5, #12]
	cbz	r3, .L287
	ldr	r3, [r3]
	cbz	r3, .L288
	str	r3, [r4, #84]
.L288:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #4]
	cbz	r3, .L289
	str	r3, [r4, #88]
.L289:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #8]
	cbz	r3, .L287
	str	r3, [r4, #92]
.L287:
	add	r0, r5, #68
	bl	atomic_fetch_add_relaxed.constprop.25
	str	r0, [r4, #4]
	ldr	r3, [r5, #12]
	cmp	r3, #0
	bne	.L291
.L292:
	ldr	r1, [r5, #84]
	mov	r0, r4
	bl	mpp_session_attach_workqueue
.L259:
	add	r2, sp, #24
	movs	r3, #20
	mla	r3, r3, r6, r2
	ldr	r3, [r3, #52]
	lsls	r1, r3, #31
	bpl	.L299
	lsls	r2, r3, #30
	bpl	.L300
.L299:
	ldr	r3, [sp, #56]
	str	r3, [r4, #36]
	ldr	r3, [sp, #64]
	cbz	r3, .L302
	ldr	r3, [r4, #84]
	cmp	r3, #0
	beq	.L303
	add	r1, sp, #24
	mov	r0, r4
	blx	r3
	mov	r5, r0
	cmp	r0, #0
	bne	.L253
	ldrd	fp, r2, [sp, #48]
	ldr	r9, [sp, #44]
	add	r0, r2, #72
	str	r2, [sp, #20]
	bl	atomic_add.constprop.26
	add	r1, fp, #20
	mov	r0, r5
	bl	____atomic_set_bit
	ldr	r1, [r4, #76]
	ldr	r2, [sp, #20]
	cbnz	r1, .L302
	ldr	r0, [r9, #56]
	add	r5, fp, #12
	add	r1, r9, #52
	str	r5, [r9, #56]
	strd	r1, r0, [fp, #12]
	str	r5, [r0]
	mov	r0, r2
	bl	mpp_taskqueue_trigger_work
.L302:
	ldr	r3, [sp, #68]
	cbz	r3, .L300
	ldr	r3, [r4, #88]
	cmp	r3, #0
	beq	.L306
	add	r1, sp, #24
	mov	r0, r4
	blx	r3
	mov	r5, r0
	cmp	r0, #0
	bne	.L253
.L300:
	add	r2, sp, #24
	movs	r3, #20
	mla	r6, r3, r6, r2
	ldr	r3, [r6, #52]
	ands	r5, r3, #1
	beq	.L253
	lsls	r3, r3, #30
	add	r7, r7, #24
	bpl	.L307
	movs	r5, #0
	b	.L253
.L291:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	beq	.L292
	mov	r0, r4
	blx	r3
	cmp	r0, #0
	beq	.L292
	b	.L403
.L268:
	ldr	r3, [sp, #56]
	ldr	r2, [ip, #52]
	orrs	r3, r3, r2
	str	r3, [sp, #56]
	ldr	r3, [sp, #68]
	adds	r3, r3, #1
	str	r3, [sp, #68]
	b	.L259
.L271:
	bl	ktime_get
	ldr	r3, .L410
	adds	r3, r0, r3
	str	r3, [sp, #8]
	adc	r3, r1, #0
	str	r3, [sp, #12]
.L296:
	ldr	r3, [r4, #28]
	cbz	r3, .L293
	bl	ktime_get
	ldrd	r2, [sp, #8]
	cmp	r2, r0
	sbcs	r3, r3, r1
	bge	.L294
	ldr	r3, [r4, #28]
	cbz	r3, .L293
	movw	r2, #1255
	ldr	r1, .L410+4
	ldr	r0, .L410+8
	bl	printk
	b	.L403
.L294:
	mov	r1, #1000
	movs	r0, #251
	bl	usleep_range
	b	.L296
.L293:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L403
	mov	r0, r4
	bl	mpp_session_clear.constprop.10
	b	.L259
.L297:
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #48]
	cbz	r3, .L298
	add	r2, sp, #24
	movs	r1, #20
	mov	r0, r4
	mla	r1, r1, r6, r2
	adds	r1, r1, #48
	blx	r3
	b	.L396
.L298:
	ldr	r3, [r8]
	lsls	r0, r3, #27
	bpl	.L259
	ldr	r0, .L410+12
	bl	printk
	b	.L259
.L303:
	ldr	r0, .L410+16
.L404:
	bl	printk
	b	.L402
.L306:
	ldr	r0, .L410+20
	b	.L404
.L256:
	ldr	r3, [sp, #60]
	adds	r3, r3, #1
	str	r3, [sp, #60]
	cmp	r3, #16
	bls	.L394
	movs	r2, #16
	ldr	r1, .L410+24
	str	r2, [sp]
	movw	r2, #2063
	ldr	r0, .L410+28
	bl	printk
.L402:
	mvn	r5, #21
	b	.L253
.L411:
	.align	2
.L410:
	.word	500000000
	.word	.LANCHOR1+152
	.word	.LC29
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LANCHOR1+118
	.word	.LC22
	.fnend
	.size	mpp_chnl_add_req, .-mpp_chnl_add_req
	.align	1
	.global	mpp_power_on
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_power_on, %function
mpp_power_on:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	add	r3, r0, #112
	movs	r2, #1
	pld	[r3]
	.syntax unified
@ 66 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r1, [r3]
	strex	r0, r2, [r3]
	teq	r0, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r1, .L414
	movs	r1, #4
	ldr	r0, [r4]
	bl	__pm_runtime_resume
	ldr	r0, [r4]
	bl	mpp_pm_stay_awake
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #8]
	cbz	r3, .L414
	mov	r0, r4
	blx	r3
.L414:
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_power_on, .-mpp_power_on
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_register, %function
mpp_chnl_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	uxth	r3, r2
	str	r3, [r0, #68]
	lsrs	r2, r2, #16
	ldr	r3, [r0, #12]
	str	r1, [r0, #96]
	str	r2, [r0, #76]
	str	r2, [r3, #144]
	cbz	r2, .L420
	ldr	r3, [r0, #12]
	movs	r2, #1
	str	r2, [r3, #116]
	ldr	r0, [r0, #12]
	bl	mpp_power_on
.L420:
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpp_chnl_register, .-mpp_chnl_register
	.align	1
	.global	mpp_power_off
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_power_off, %function
mpp_power_off:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r3, [r0, #116]
	cbnz	r3, .L426
	add	r2, r0, #112
	pld	[r2]
	.syntax unified
@ 66 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/cmpxchg.h" 1
	@	__xchg4
1:	ldrex	r1, [r2]
	strex	r5, r3, [r2]
	teq	r5, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	cbz	r1, .L426
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #12]
	cbz	r3, .L428
	blx	r3
.L428:
	ldr	r0, [r4]
	bl	mpp_pm_relax
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_get_pending_task
	cbz	r0, .L429
.L430:
	ldr	r5, [r4]
	bl	ktime_get_mono_fast_ns
	strd	r0, [r5, #248]
	movs	r1, #13
.L437:
	ldr	r0, [r4]
	bl	__pm_runtime_suspend
.L426:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L429:
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_get_running_task
	cmp	r0, #0
	bne	.L430
	movs	r1, #4
	b	.L437
	.fnend
	.size	mpp_power_off, .-mpp_power_off
	.align	1
	.global	mpp_session_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_deinit, %function
mpp_session_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L451
	ldr	r6, [r0, #28]
	ldr	r2, [r5]
	lsls	r2, r2, #9
	bpl	.L439
	ldr	r2, [r0, #4]
	mov	r1, r0
	mov	r3, r6
	ldr	r0, .L451+4
	bl	printk
.L439:
	cbnz	r6, .L444
	ldr	r3, [r4, #92]
	cbz	r3, .L441
	mov	r0, r4
	blx	r3
.L442:
	ldr	r3, [r5]
	lsls	r3, r3, #9
	bpl	.L443
	ldr	r2, [r4, #4]
	mov	r1, r4
	ldr	r0, .L451+8
	bl	printk
.L443:
	mov	r0, r4
	bl	kfree
	movs	r0, #0
.L438:
	pop	{r4, r5, r6, pc}
.L441:
	ldr	r0, .L451+12
	bl	printk
	b	.L442
.L444:
	mov	r0, #-1
	b	.L438
.L452:
	.align	2
.L451:
	.word	mpp_dev_debug
	.word	.LC35
	.word	.LC37
	.word	.LC36
	.fnend
	.size	mpp_session_deinit, .-mpp_session_deinit
	.align	1
	.global	mpp_session_pop_pending
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_pop_pending, %function
mpp_session_pop_pending:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	adds	r0, r1, #4
	bl	list_del_init
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r1, #72
	bl	kref_put.constprop.14
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_session_pop_pending, .-mpp_session_pop_pending
	.align	1
	.global	mpp_session_clean_detach
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_clean_detach, %function
mpp_session_clean_detach:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r10, .L476
	add	r9, r0, #40
	ldr	fp, .L476+4
.L455:
	ldr	r3, [r6, #48]
	cbz	r3, .L457
	ldr	r5, [r6, #40]
	cmp	r5, r9
	bne	.L456
.L457:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L456:
	subs	r8, r5, #48
	beq	.L457
	ldr	r3, [r5, #28]
	cbz	r3, .L458
.L459:
	mov	r0, r8
	bl	mpp_session_get_idle_task
	mov	r7, r0
	cbz	r0, .L458
	adds	r0, r0, #24
	bl	atomic_add.constprop.26
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r7, #12
	bl	list_del_init
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, r7, #72
	bl	kref_put.constprop.14
	mov	r1, r7
	mov	r0, r8
	bl	mpp_session_pop_pending
	b	.L459
.L458:
	ldr	r3, [r5, #-20]
	cmp	r3, #0
	bne	.L457
	mov	r0, r5
	bl	list_del_init
	ldr	r3, [r6, #48]
	subs	r3, r3, #1
	str	r3, [r6, #48]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r10]
	lsls	r3, r3, #9
	bpl	.L460
	ldr	r3, [r5, #-36]
	ldr	r3, [r3]
	ldr	r1, [r3, #44]
	cbnz	r1, .L461
	ldr	r1, [r3]
.L461:
	ldr	r2, [r6, #48]
	mov	r0, fp
	bl	printk
.L460:
	mov	r0, r8
	bl	mpp_session_deinit
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L455
.L477:
	.align	2
.L476:
	.word	mpp_dev_debug
	.word	.LC38
	.fnend
	.size	mpp_session_clean_detach, .-mpp_session_clean_detach
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_detach_workqueue, %function
mpp_session_detach_workqueue:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, [r0, #12]
	cbz	r3, .L478
	ldr	r3, [r3, #84]
	cbz	r3, .L478
	ldr	r3, .L490
	ldr	r3, [r3]
	lsls	r3, r3, #9
	bpl	.L480
	ldr	r2, [r0, #4]
	mov	r1, r0
	ldr	r0, .L490+4
	bl	printk
.L480:
	ldr	r3, [r4, #12]
	ldr	r1, [r3, #84]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r5, r4, #48
	mov	r0, r5
	bl	list_del_init
	ldr	r3, [r1, #44]
	add	r2, r1, #40
	str	r5, [r1, #44]
	strd	r2, r3, [r4, #48]
	str	r5, [r3]
	ldr	r3, [r1, #48]
	adds	r3, r3, #1
	str	r3, [r1, #48]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r1
	pop	{r4, r5, r6, lr}
	b	mpp_session_clean_detach
.L478:
	pop	{r4, r5, r6, pc}
.L491:
	.align	2
.L490:
	.word	mpp_dev_debug
	.word	.LC39
	.fnend
	.size	mpp_session_detach_workqueue, .-mpp_session_detach_workqueue
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_release, %function
mpp_dev_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r1
	ldr	r5, .L502
	ldr	r4, [r1, #128]
	ldr	r2, [r5]
	lsls	r3, r2, #26
	bpl	.L493
	movw	r2, #1332
	ldr	r1, .L502+4
	ldr	r0, .L502+8
	bl	printk
.L493:
	cbnz	r4, .L494
	movw	r2, #1335
	ldr	r1, .L502+4
	ldr	r0, .L502+12
	bl	printk
	mvn	r0, #21
.L492:
	pop	{r4, r5, r6, pc}
.L494:
	add	r0, r4, #32
	bl	atomic_add.constprop.26
	ldr	r3, [r4, #12]
	mov	r0, r4
	cbz	r3, .L496
	bl	mpp_session_detach_workqueue
.L497:
	ldr	r0, [r5]
	movs	r4, #0
	str	r4, [r6, #128]
	ands	r0, r0, #32
	beq	.L492
	movw	r2, #1349
	ldr	r1, .L502+4
	ldr	r0, .L502+16
	bl	printk
	mov	r0, r4
	b	.L492
.L496:
	bl	mpp_session_deinit
	b	.L497
.L503:
	.align	2
.L502:
	.word	mpp_dev_debug
	.word	.LANCHOR1+172
	.word	.LC12
	.word	.LC40
	.word	.LC13
	.fnend
	.size	mpp_dev_release, .-mpp_dev_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_release, %function
mpp_chnl_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r3, .L512
	ldr	r3, [r3]
	lsls	r3, r3, #26
	bpl	.L505
	movw	r2, #2022
	ldr	r1, .L512+4
	ldr	r0, .L512+8
	bl	printk
.L505:
	cbnz	r5, .L506
	mov	r2, #2024
	ldr	r1, .L512+4
	ldr	r0, .L512+12
	bl	printk
	mvn	r0, #21
.L504:
	pop	{r3, r4, r5, pc}
.L506:
	add	r0, r5, #32
	bl	atomic_add.constprop.26
	ldr	r4, [r5, #12]
	mov	r0, r5
	cbz	r4, .L508
	bl	mpp_session_detach_workqueue
	movs	r0, #0
	b	.L504
.L508:
	bl	mpp_session_deinit
	mov	r0, r4
	b	.L504
.L513:
	.align	2
.L512:
	.word	mpp_dev_debug
	.word	.LANCHOR1+188
	.word	.LC12
	.word	.LC40
	.fnend
	.size	mpp_chnl_release, .-mpp_chnl_release
	.align	1
	.global	mpp_session_get_pending_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_session_get_pending_task, %function
mpp_session_get_pending_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r0, #16]!
	cmp	r3, r0
	ite	ne
	subne	r0, r3, #4
	moveq	r0, #0
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	mpp_session_get_pending_task, .-mpp_session_get_pending_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_wait_result_default, %function
mpp_wait_result_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #52
	sub	sp, sp, #52
	mov	r6, r0
	mov	r9, r1
	bl	mpp_session_get_pending_task
	mov	r4, r0
	cbnz	r0, .L518
	mov	r3, r6
	movw	r2, #866
	ldr	r1, .L541
	mvn	r5, #4
	ldr	r0, .L541+4
	bl	printk
.L517:
	mov	r0, r5
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L518:
	ldr	r7, [r0, #116]
	cbnz	r7, .L520
	ldr	r7, [r6, #12]
.L520:
	ldr	r1, [r4, #20]
	ubfx	r1, r1, #7, #1
	cmp	r1, #0
	bne	.L530
	add	r0, sp, #28
	add	r8, r4, #108
	bl	init_wait_entry
	movs	r5, #200
.L525:
	movs	r2, #2
	add	r1, sp, #28
	mov	r0, r8
	bl	prepare_to_wait_event
	ldr	r3, [r4, #20]
	lsls	r2, r3, #24
	bpl	.L522
	cmp	r5, #0
	it	eq
	moveq	r5, #1
.L524:
	add	r1, sp, #28
	mov	r0, r8
	bl	finish_wait
	cmp	r5, #0
	bgt	.L521
	add	r0, r4, #24
	bl	atomic_add.constprop.26
	add	r1, r4, #20
	movs	r0, #9
	bl	____atomic_set_bit
	ldr	r2, [r4, #20]
	ldr	r3, [r6, #28]
	ldr	r1, .L541
	ldr	r0, .L541+8
	str	r2, [sp, #16]
	ldr	r2, [r4, #100]
	strd	r3, r2, [sp, #8]
	movw	r2, #882
	ldr	r3, [r6, #4]
	str	r3, [sp, #4]
	ldr	r3, [r6]
	str	r3, [sp]
	ldr	r3, [r6, #24]
	bl	printk
	b	.L527
.L530:
	movs	r5, #200
.L521:
	ldr	r3, [r7, #12]
	ldr	r3, [r3, #40]
	cbz	r3, .L527
	mov	r2, r9
	mov	r1, r4
	mov	r0, r7
	blx	r3
	mov	r5, r0
.L527:
	ldr	r3, .L541+12
	ldr	r3, [r3]
	lsls	r3, r3, #22
	bpl	.L528
	ldr	r3, [r4, #72]
	movw	r2, #889
	ldr	r1, .L541
	ldr	r0, .L541+16
	strd	r3, r5, [sp, #12]
	ldr	r3, [r4, #20]
	str	r3, [sp, #8]
	ldr	r3, [r4, #100]
	str	r3, [sp, #4]
	ldr	r3, [r6, #4]
	str	r3, [sp]
	ldr	r3, [r6]
	bl	printk
.L528:
	mov	r1, r4
	mov	r0, r6
	bl	mpp_session_pop_pending
	b	.L517
.L522:
	cmp	r5, #0
	beq	.L524
	mov	r0, r5
	bl	schedule_timeout
	mov	r5, r0
	b	.L525
.L542:
	.align	2
.L541:
	.word	.LANCHOR1+205
	.word	.LC41
	.word	.LC42
	.word	mpp_dev_debug
	.word	.LC43
	.fnend
	.size	mpp_wait_result_default, .-mpp_wait_result_default
	.align	1
	.global	mpp_reset_control_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_reset_control_get, %function
mpp_reset_control_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r2
	ldr	r7, .L557
	.pad #52
	sub	sp, sp, #52
	ldr	r2, .L557+4
	mov	r5, r0
	mov	r8, r1
	ldr	r3, [r7]
	ldr	r0, [r2]	@ unaligned
	ldr	r1, [r2, #4]	@ unaligned
	movs	r2, #24
	str	r3, [sp, #44]
	add	r3, sp, #12
	stmia	r3!, {r0, r1}
	movs	r1, #0
	add	r0, sp, #20
	bl	memset
	ldr	r0, [r5]
	bl	mpp_dev_of_node
	mov	r2, r4
	ldr	r1, .L557+8
	mov	r6, r0
	bl	of_property_match_string
	cmp	r0, #0
	blt	.L544
	movs	r3, #0
	movs	r2, #1
	mov	r1, r4
	strd	r3, r2, [sp]
	ldr	r0, [r5]
	mov	r2, r3
	bl	__devm_reset_control_get
	mov	r4, r0
	cbz	r0, .L543
	bl	reset_control_deassert
.L543:
	ldr	r2, [sp, #44]
	mov	r0, r4
	ldr	r3, [r7]
	cmp	r2, r3
	beq	.L550
	bl	__stack_chk_fail
.L544:
	add	r0, sp, #12
	bl	strlen
	mov	r1, r4
	rsb	r2, r0, #31
	add	r0, sp, #12
	bl	strncat
	ldr	r1, .L557+8
	mov	r0, r6
	add	r2, sp, #12
	bl	of_property_match_string
	cmp	r0, #0
	bge	.L546
	add	r2, sp, #12
	ldr	r1, .L557+12
	ldr	r0, [r5]
	movs	r4, #0
	bl	_dev_err
	b	.L543
.L546:
	ldr	r4, [r5, #88]
	cbnz	r4, .L547
	ldr	r1, .L557+16
	ldr	r0, [r5]
	bl	_dev_err
	b	.L543
.L547:
	add	r9, r4, #4
	add	r8, r4, r8, lsl #2
	mov	r0, r9
	bl	down_write
	ldr	r6, [r8, #20]
	cbnz	r6, .L548
	movs	r3, #1
	mov	r2, r6
	strd	r6, r3, [sp]
	add	r1, sp, #12
	mov	r3, r6
	ldr	r0, [r5]
	bl	__devm_reset_control_get
	mov	r6, r0
	cbz	r0, .L549
	bl	reset_control_deassert
.L549:
	str	r6, [r8, #20]
	ldr	r3, [r5, #84]
	str	r3, [r4, #32]
.L548:
	ldr	r1, [r4, #32]
	ldr	r3, [r5, #84]
	ldr	r2, [r4]
	cmp	r1, r3
	it	ne
	orrne	r2, r2, #1
	ldr	r1, .L557+20
	str	r2, [r4]
	mov	r4, r6
	ldr	r0, [r5]
	bl	_dev_info
	mov	r0, r9
	bl	up_write
	b	.L543
.L550:
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L558:
	.align	2
.L557:
	.word	__stack_chk_guard
	.word	.LANCHOR1+229
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.fnend
	.size	mpp_reset_control_get, .-mpp_reset_control_get
	.align	1
	.global	mpp_dev_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_reset, %function
mpp_dev_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, .L593
	ldr	r2, [r5]
	lsls	r2, r2, #13
	bpl	.L560
	ldr	r0, .L593+4
	bl	printk
.L560:
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	cbz	r3, .L561
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #24]
	cbz	r3, .L561
	mov	r0, r4
	blx	r3
.L561:
	ldr	r0, [r4, #88]
	cbz	r0, .L562
	ldr	r3, [r0]
	cbz	r3, .L562
	adds	r0, r0, #4
	bl	down_write
.L562:
	movs	r3, #0
	str	r3, [r4, #64]
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #28]
	cbz	r3, .L563
	mov	r0, r4
	blx	r3
.L563:
	ldr	r0, [r4, #88]
	cbz	r0, .L564
	ldr	r3, [r0]
	cbz	r3, .L564
	adds	r0, r0, #4
	bl	up_write
.L564:
	ldr	r3, [r5]
	lsls	r3, r3, #13
	bpl	.L565
	ldr	r0, .L593+8
	bl	printk
.L565:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L594:
	.align	2
.L593:
	.word	mpp_dev_debug
	.word	.LC49
	.word	.LC50
	.fnend
	.size	mpp_dev_reset, .-mpp_dev_reset
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_task_timeout_work, %function
mpp_task_timeout_work:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r9, [r0, #104]
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
	lsls	r3, r3, #28
	bpl	.L596
	mov	r2, #486
	ldr	r1, .L618
	ldr	r0, .L618+4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	printk
.L596:
	ldr	r3, [r0, #72]
	sub	r7, r0, #28
	mov	r2, #490
	ldr	r1, .L618
	ldr	r0, .L618+8
	bl	printk
	ldr	r6, [r5, #-28]
	cbnz	r6, .L597
	ldr	r1, .L618
	mov	r3, r7
	ldr	r0, .L618+12
	movw	r2, #493
.L617:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	printk
.L597:
	ldr	r3, [r6, #12]
	cbnz	r3, .L598
	mov	r3, r6
	movw	r2, #499
	ldr	r1, .L618
	ldr	r0, .L618+16
	b	.L617
.L598:
	ldr	r4, [r5, #88]
	cmp	r4, #0
	it	eq
	moveq	r4, r3
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #64]
	cbz	r3, .L604
	mov	r0, r4
	blx	r3
.L604:
	ldr	r0, [r4, #88]
	cbz	r0, .L601
	ldr	r3, [r0]
	cbz	r3, .L601
	adds	r0, r0, #4
	bl	up_read
.L601:
	sub	r8, r5, #8
	mov	r0, r4
	bl	mpp_dev_reset
	mov	r0, r4
	bl	mpp_power_off
	mov	r1, r8
	movs	r0, #6
	bl	____atomic_set_bit
	movs	r0, #7
	bl	____atomic_set_bit
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #80
	bl	__wake_up
	mov	r1, r7
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_pop_running
	ldr	r3, [r6, #96]
	cbz	r3, .L595
	cmp	r9, #0
	beq	.L595
	movs	r2, #0
	ldr	r0, [r6, #68]
	mov	r1, r2
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	r3	@ indirect register sibling call
.L595:
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L619:
	.align	2
.L618:
	.word	.LANCHOR1+261
	.word	.LC51
	.word	.LC52
	.word	.LC18
	.word	.LC53
	.fnend
	.size	mpp_task_timeout_work, .-mpp_task_timeout_work
	.align	1
	.global	mpp_taskqueue_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_taskqueue_init, %function
mpp_taskqueue_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r2, #3520
	movs	r1, #100
	bl	devm_kmalloc
	cbz	r0, .L620
	add	r3, r0, #32
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	add	r3, r0, #40
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	add	r3, r0, #52
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	add	r3, r0, #60
	str	r3, [r0, #60]
	str	r3, [r0, #64]
	add	r3, r0, #72
	str	r3, [r0, #72]
	str	r3, [r0, #76]
	movs	r3, #16
	str	r3, [r0, #80]
	movs	r3, #0
	str	r3, [r0, #84]
.L620:
	pop	{r3, pc}
	.fnend
	.size	mpp_taskqueue_init, .-mpp_taskqueue_init
	.align	1
	.global	mpp_check_req
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_check_req, %function
mpp_check_req:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	ldr	r4, [r5, #12]
	mov	r0, r3
	mov	r6, r2
	ldr	r3, [sp, #24]
	cmp	r4, r1
	bcs	.L626
	mov	r3, r1
	ldr	r0, .L634
	ldr	r1, .L634+4
	movw	r2, #1369
	str	r4, [sp]
.L632:
	bl	printk
	b	.L633
.L626:
	ldr	r2, [r5, #8]
	subs	r4, r4, r1
	adds	r1, r4, r2
	cmp	r1, r0
	bcs	.L628
	strd	r2, r0, [sp]
	mov	r3, r4
	movw	r2, #1375
	ldr	r1, .L634+4
	ldr	r0, .L634+8
	bl	printk
.L633:
	mvn	r0, #21
.L625:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L628:
	cmp	r6, r3
	bcs	.L629
	str	r6, [sp]
	movw	r2, #1380
	ldr	r1, .L634+4
	ldr	r0, .L634+12
	b	.L632
.L629:
	cmp	r4, r6
	ble	.L630
	str	r6, [sp]
	mov	r3, r4
	movw	r2, #1385
	ldr	r1, .L634+4
	ldr	r0, .L634+16
	b	.L632
.L630:
	cmp	r1, r6
	bls	.L631
	strd	r2, r6, [sp]
	mov	r3, r4
	ldr	r1, .L634+4
	movw	r2, #1390
	ldr	r0, .L634+20
	bl	printk
	ldr	r1, [r5, #8]
	subs	r1, r1, r6
	add	r4, r4, r1
	str	r4, [r5, #8]
.L631:
	movs	r0, #0
	b	.L625
.L635:
	.align	2
.L634:
	.word	.LC54
	.word	.LANCHOR1+283
	.word	.LC55
	.word	.LC56
	.word	.LC57
	.word	.LC58
	.fnend
	.size	mpp_check_req, .-mpp_check_req
	.align	1
	.global	mpp_task_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_task_init, %function
mpp_task_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r3, r1, #4
	str	r3, [r1, #4]
	str	r3, [r1, #8]
	add	r3, r1, #12
	str	r3, [r1, #12]
	str	r3, [r1, #16]
	movs	r3, #0
	str	r0, [r1]
	mov	r0, r3
	str	r3, [r1, #20]
	bx	lr
	.fnend
	.size	mpp_task_init, .-mpp_task_init
	.align	1
	.global	mpp_task_finish
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_task_finish, %function
mpp_task_finish:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r6, r0
	ldr	r4, [r1, #116]
	mov	r5, r1
	cbnz	r4, .L638
	ldr	r4, [r0, #12]
.L638:
	ldr	r3, [r4, #12]
	ldr	r8, [r5, #132]
	ldr	r3, [r3, #36]
	cbz	r3, .L639
	mov	r1, r5
	mov	r0, r4
	blx	r3
.L639:
	ldr	r0, [r4, #88]
	cbz	r0, .L640
	ldr	r3, [r0]
	cbz	r3, .L640
	adds	r0, r0, #4
	bl	up_read
.L640:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	ble	.L641
	mov	r0, r4
	bl	mpp_dev_reset
.L641:
	add	r7, r5, #20
	mov	r0, r4
	bl	mpp_power_off
	movs	r0, #5
	mov	r1, r7
	bl	____atomic_set_bit
	movs	r0, #7
	bl	____atomic_set_bit
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #108
	bl	__wake_up
	mov	r1, r5
	ldr	r0, [r4, #84]
	bl	mpp_taskqueue_pop_running
	ldr	r3, [r6, #96]
	cbz	r3, .L642
	cmp	r8, #0
	beq	.L642
	movs	r2, #0
	ldr	r0, [r6, #68]
	mov	r1, r2
	blx	r3
.L642:
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
	.fnend
	.size	mpp_task_finish, .-mpp_task_finish
	.align	1
	.global	mpp_task_finalize
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_task_finalize, %function
mpp_task_finalize:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	str	r0, [r1, #20]
	bx	lr
	.fnend
	.size	mpp_task_finalize, .-mpp_task_finalize
	.align	1
	.global	mpp_dev_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_probe, %function
mpp_dev_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r5, r1, #16
	ldr	r3, [r0, #4]
	movs	r7, #1
	movs	r6, #0
	.pad #20
	sub	sp, sp, #20
	mov	r4, r0
	mov	r9, r1
	ldr	r8, [r3, #4]
	adds	r0, r0, #120
	strh	r7, [r0, #-84]	@ movhi
	str	r7, [r0, #-80]
	str	r5, [r0, #-120]
	ldr	r2, [r3, #8]
	ldr	r1, .L715
	str	r2, [r0, #-112]
	ldr	r3, [r3, #12]
	ldr	r2, .L715+4
	str	r6, [r0, #-8]
	str	r3, [r0, #-108]
	str	r6, [r0, #-4]
	str	r6, [r0, #16]
	bl	__init_rwsem
	mov	r0, r5
	strd	r6, r6, [sp, #8]
	bl	mpp_dev_of_node
	mov	r2, r6
	ldr	r1, .L715+8
	bl	of_parse_phandle
	mov	r10, r0
	cbnz	r0, .L660
.L662:
	ldr	r1, .L715+12
.L712:
	mov	r0, r5
	bl	_dev_err
.L661:
	ldr	r1, .L715+16
	mov	r0, r5
	bl	_dev_err
	mvn	r6, #18
.L659:
	mov	r0, r6
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L660:
	bl	of_device_is_available
	cmp	r0, #0
	beq	.L662
	mov	r0, r10
	bl	of_find_device_by_node
	cbnz	r0, .L663
	ldr	r1, .L715+20
	b	.L712
.L663:
	ldr	r3, [r0, #80]
	str	r3, [r4, #92]
	bl	platform_device_put
	ldr	r3, [r4, #92]
	cbnz	r3, .L664
	ldr	r1, .L715+24
	b	.L712
.L664:
	mov	r0, r5
	bl	mpp_dev_of_node
	mov	r3, r7
	ldr	r1, .L715+28
	str	r6, [sp]
	add	r2, sp, #8
	bl	of_property_read_variable_u32_array
	cmp	r0, #0
	bge	.L665
	ldr	r1, .L715+32
	b	.L712
.L665:
	ldr	r1, [r4, #92]
	ldr	r2, [sp, #8]
	ldr	r3, [r1, #112]
	cmp	r3, r2
	bhi	.L666
	ldr	r1, .L715+36
.L713:
	mov	r0, r5
	bl	_dev_err
	b	.L661
.L666:
	add	r1, r1, r2, lsl #2
	ldr	r6, [r1, #116]
	cbnz	r6, .L667
	ldr	r1, .L715+40
	mov	r0, r5
	bl	_dev_err
	b	.L661
.L667:
	add	r10, r4, #96
	str	r10, [r4, #96]
	str	r10, [r4, #100]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r7, [r4, #104]
	cmp	r7, #0
	it	lt
	ldrlt	r7, [r6, #96]
	cbz	r7, .L669
	ldr	r1, .L715+44
	mov	r2, r7
.L711:
	ldr	r0, [r4]
	bl	_dev_err
.L670:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r5
	bl	mpp_dev_of_node
	movs	r3, #0
	ldr	r1, .L715+48
	str	r3, [sp]
	add	r2, sp, #12
	movs	r3, #1
	bl	of_property_read_variable_u32_array
	cmp	r0, #0
	blt	.L675
	ldr	r1, [r4, #92]
	ldr	r2, [sp, #12]
	ldr	r3, [r1, #128]
	cmp	r3, r2
	bhi	.L676
	ldr	r1, .L715+52
	b	.L713
.L669:
	ldr	r3, [r6, #88]
	cbz	r3, .L671
	mov	r2, r7
	ldr	r1, .L715+56
	b	.L711
.L671:
	ldr	r3, [r6, #96]
	add	r1, r6, #92
	str	r4, [r6, #88]
	mov	r0, r7
	adds	r3, r3, #1
	str	r3, [r6, #96]
	bl	____atomic_set_bit
	ldr	r3, [r6, #76]
	add	r2, r6, #72
	str	r10, [r6, #76]
	strd	r2, r3, [r4, #96]
	str	r10, [r3]
	ldr	r3, .L715+60
	str	r7, [r4, #104]
	str	r6, [r4, #84]
	ldr	r3, [r3]
	lsls	r2, r3, #6
	bpl	.L672
	ldr	r3, [r4]
	ldr	r1, [r3, #44]
	cbnz	r1, .L673
	ldr	r1, [r3]
.L673:
	movs	r2, #0
	ldr	r0, .L715+64
	bl	printk
.L672:
	ldr	r3, [r4, #40]
	ldr	r2, [r6, #80]
	cmp	r2, r3
	it	hi
	strhi	r3, [r6, #80]
	b	.L670
.L676:
	add	r1, r1, r2, lsl #2
	ldr	r3, [r1, #132]
	str	r3, [r4, #88]
.L675:
	ldr	r6, [r4, #40]
	cmp	r6, #1
	bne	.L678
	mov	r1, #2000
	mov	r0, r5
	bl	pm_runtime_set_autosuspend_delay
	mov	r1, r6
	mov	r0, r5
	bl	__pm_runtime_use_autosuspend
.L679:
	add	r3, r4, #16
	movs	r2, #20
	movs	r1, #0
	movs	r6, #0
	mov	r0, r3
	bl	memset
	ldr	r3, .L715+68
	movs	r1, #1
	str	r3, [r4, #24]
	str	r0, [r4, #16]
	str	r0, [r4, #20]
	mov	r0, r5
	str	r6, [r4, #64]
	str	r6, [r4, #68]
	str	r6, [r4, #72]
	str	r6, [r4, #76]
	bl	mpp_device_init_wakeup
	mov	r0, r5
	bl	pm_runtime_enable
	mov	r1, r6
	mov	r0, r9
	bl	platform_get_irq
	cmp	r0, r6
	str	r0, [r4, #48]
	bge	.L680
	ldr	r1, .L715+72
.L714:
	mov	r0, r5
	mvn	r6, #18
	bl	_dev_err
.L681:
	mov	r0, r4
	bl	mpp_detach_workqueue
	movs	r1, #0
	mov	r0, r5
	bl	mpp_device_init_wakeup
	movs	r1, #1
	mov	r0, r5
	bl	__pm_runtime_disable
	b	.L659
.L678:
	mov	r2, r6
	ldr	r1, .L715+76
	mov	r0, r5
	bl	_dev_info
	b	.L679
.L680:
	mov	r2, r6
	mov	r1, #512
	mov	r0, r9
	bl	platform_get_resource
	mov	r6, r0
	cbnz	r0, .L682
	ldr	r1, .L715+80
	b	.L714
.L682:
	ldrd	r1, r2, [r0]
	mov	r0, r5
	adds	r2, r2, #1
	subs	r2, r2, r1
	bl	devm_ioremap
	str	r0, [r4, #60]
	cbnz	r0, .L683
	mov	r2, r6
	ldr	r1, .L715+84
	mov	r0, r5
	mvn	r6, #11
	bl	_dev_err
	b	.L681
.L683:
	movs	r1, #4
	mov	r0, r5
	bl	__pm_runtime_resume
	ldr	r3, [r4, #8]
	ldr	r3, [r3]
	cbz	r3, .L684
	mov	r0, r4
	blx	r3
	mov	r6, r0
	cbz	r0, .L684
	movs	r1, #4
	mov	r0, r5
	bl	__pm_runtime_idle
	b	.L681
.L684:
	ldr	r3, [r8, #4]
	cmp	r3, #0
	blt	.L686
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #8]
	cbz	r3, .L687
	mov	r0, r4
	blx	r3
.L687:
	ldr	r2, [r8, #4]
	ldr	r3, [r4, #60]
	add	r3, r3, r2
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r6, [r3]
@ 0 "" 2
@ 618 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/kmpp/mpp/mpp_common.h" 1
	dsb 
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L715+60
	ldr	r3, [r3]
	lsls	r3, r3, #18
	bpl	.L688
	mov	r3, r6
	lsrs	r1, r2, #2
	ldr	r0, .L715+88
	bl	printk
.L688:
	str	r6, [r8, #8]
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #12]
	cbz	r3, .L686
	mov	r0, r4
	blx	r3
.L686:
	movs	r1, #4
	mov	r0, r5
	bl	__pm_runtime_idle
	movs	r6, #0
	b	.L659
.L716:
	.align	2
.L715:
	.word	.LC59
	.word	.LANCHOR2+4
	.word	.LC60
	.word	.LC61
	.word	.LC73
	.word	.LC62
	.word	.LC63
	.word	.LC64
	.word	.LC65
	.word	.LC66
	.word	.LC67
	.word	.LC68
	.word	.LC71
	.word	.LC72
	.word	.LC69
	.word	mpp_dev_debug
	.word	.LC70
	.word	mpp_task_worker_default
	.word	.LC75
	.word	.LC74
	.word	.LC76
	.word	.LC77
	.word	.LC78
	.fnend
	.size	mpp_dev_probe, .-mpp_dev_probe
	.align	1
	.global	mpp_dev_remove
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_remove, %function
mpp_dev_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #4]
	cbz	r3, .L718
	blx	r3
.L718:
	mov	r0, r4
	bl	mpp_detach_workqueue
	movs	r1, #0
	ldr	r0, [r4]
	bl	mpp_device_init_wakeup
	ldr	r0, [r4]
	movs	r1, #1
	bl	__pm_runtime_disable
	movs	r0, #0
	pop	{r4, pc}
	.fnend
	.size	mpp_dev_remove, .-mpp_dev_remove
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.global	mpp_dev_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_shutdown, %function
mpp_dev_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	add	r5, r0, #16
	ldr	r4, [r0, #80]
	ldr	r1, .L734
	mov	r0, r5
	bl	_dev_info
	ldr	r0, [r4, #92]
	adds	r0, r0, #84
	bl	atomic_add.constprop.26
	bl	ktime_get
	ldr	r3, .L734+4
	adds	r6, r0, r3
	mov	r3, #0
	adc	r7, r1, r3
.L726:
	ldr	r3, [r4, #72]
	cbz	r3, .L723
	bl	ktime_get
	cmp	r6, r0
	sbcs	r3, r7, r1
	bge	.L724
	ldr	r3, [r4, #72]
	cbz	r3, .L723
	ldr	r2, [r4, #72]
	mov	r0, r5
	ldr	r1, .L734+8
	pop	{r3, r4, r5, r6, r7, lr}
	b	_dev_err
.L724:
	movw	r1, #20000
	movw	r0, #5001
	bl	usleep_range
	b	.L726
.L723:
	mov	r0, r5
	ldr	r1, .L734+12
	pop	{r3, r4, r5, r6, r7, lr}
	b	_dev_info
.L735:
	.align	2
.L734:
	.word	.LC79
	.word	200000000
	.word	.LC80
	.word	.LC81
	.fnend
	.size	mpp_dev_shutdown, .-mpp_dev_shutdown
	.text
	.align	1
	.global	mpp_dev_register_srv
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_register_srv, %function
mpp_dev_register_srv:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, [r0, #4]
	ldr	r3, [r3]
	add	r2, r1, r3, lsl #2
	adds	r1, r1, #80
	str	r0, [r2, #100]
	mov	r0, r3
	bl	_set_bit
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpp_dev_register_srv, .-mpp_dev_register_srv
	.align	1
	.global	mpp_dev_irq
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_irq, %function
mpp_dev_irq:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r1
	ldr	r3, [r1, #12]
	ldr	r5, [r1, #80]
	ldr	r4, [r3, #28]
	cbz	r4, .L738
	mov	r0, r1
	blx	r4
	mov	r4, r0
	cbz	r5, .L739
	cmp	r0, #2
	bne	.L737
	add	r7, r5, #20
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
	lsls	r2, r3, #28
	bpl	.L741
	ldr	r3, [r6, #52]
	movw	r2, #1602
	ldr	r1, .L749
	movs	r4, #1
	ldr	r0, .L749+4
	bl	printk
.L737:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L741:
	add	r0, r5, #28
	bl	cancel_delayed_work
	mov	r1, r7
	movs	r0, #4
	bl	____atomic_set_bit
	b	.L737
.L740:
.L738:
	cmp	r5, #0
	bne	.L737
	mov	r4, r5
.L739:
	ldr	r3, .L749+8
	ldr	r3, [r3]
	lsls	r3, r3, #16
	bpl	.L737
	ldr	r0, .L749+12
	bl	printk
	b	.L737
.L750:
	.align	2
.L749:
	.word	.LANCHOR1+297
	.word	.LC82
	.word	mpp_dev_debug
	.word	.LC83
	.fnend
	.size	mpp_dev_irq, .-mpp_dev_irq
	.align	1
	.global	mpp_dev_isr_sched
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_isr_sched, %function
mpp_dev_isr_sched:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r1
	ldrb	r3, [r1, #36]	@ zero_extendqisi2
	cbz	r3, .L752
	ldr	r3, [r1, #8]
	ldr	r2, [r3, #24]
	cbz	r2, .L752
	ldr	r3, [r1, #84]
	ldr	r1, [r3, #52]!
	cmp	r1, r3
	bne	.L752
	mov	r0, r4
	blx	r2
.L752:
	ldr	r3, [r4, #12]
	ldr	r5, [r3, #32]
	cbz	r5, .L753
	mov	r0, r4
	blx	r5
	mov	r5, r0
.L753:
	mov	r0, r4
	bl	mpp_taskqueue_trigger_work
	mov	r0, r5
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpp_dev_isr_sched, .-mpp_dev_isr_sched
	.align	1
	.global	mpp_time_record
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_time_record, %function
mpp_time_record:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, .L769
	ldr	r3, [r3]
	lsls	r3, r3, #23
	bpl	.L762
	cbz	r0, .L762
	adds	r0, r0, #80
	bl	ktime_get_real_ts64
.L762:
	movs	r0, #0
	pop	{r3, pc}
.L770:
	.align	2
.L769:
	.word	mpp_dev_debug
	.fnend
	.size	mpp_time_record, .-mpp_time_record
	.align	1
	.global	mpp_chnl_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_chnl_run_task, %function
mpp_chnl_run_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	ldr	r10, [r0, #12]
	.pad #28
	sub	sp, sp, #28
	mov	r5, r1
	ldr	r9, [r10, #84]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, .L817
	ldr	r2, [r3]
	mov	r8, r3
	tst	r2, #512
	beq	.L780
	ldr	r3, [r0, #68]
	movw	r2, #778
	ldr	r1, .L817+4
	ldr	r0, .L817+8
	bl	printk
.L780:
	mov	r0, r6
	bl	mpp_session_get_idle_task
	mov	r4, r0
	cmp	r0, #0
	beq	.L790
	ldr	r7, [r10, #136]
	cmp	r7, #0
	bne	.L791
	cbz	r5, .L775
	ldr	r2, [r5, #8]
	ldr	r1, [r0, #148]
	adds	r3, r2, #7
	bic	r3, r3, #7
	cmp	r3, r1
	bne	.L776
	ldr	r3, [r5, #12]
	ldr	r0, [r0, #152]
	adds	r3, r3, #7
	bic	r3, r3, #7
	cmp	r3, r0
	beq	.L775
.L776:
	ldr	r3, [r8]
	lsls	r0, r3, #13
	bpl	.L778
	ldr	r3, [r4, #152]
	ldr	r0, .L817+12
	strd	r1, r3, [sp, #12]
	ldr	r3, [r5, #12]
	ldr	r1, [r6, #68]
	strd	r2, r3, [sp, #4]
	ldr	r3, [r5, #4]
	str	r3, [sp]
	ldr	r3, [r5]
	ldr	r2, [r4, #100]
	bl	printk
.L778:
	add	r0, r4, #24
	bl	atomic_add.constprop.26
	add	r1, r4, #20
	movs	r0, #7
	bl	____atomic_set_bit
	ldr	r3, [r6, #96]
	cbz	r3, .L775
	movs	r2, #0
	ldr	r0, [r6, #68]
	mov	r1, r2
	blx	r3
.L775:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	ble	.L779
	mov	r1, r4
	mov	r0, r9
	bl	mpp_taskqueue_pop_pending
	b	.L780
.L779:
	ldr	r3, [r10, #12]
	ldr	r3, [r3, #20]
	cbz	r3, .L781
	mov	r1, r4
	mov	r0, r10
	blx	r3
	mov	r4, r0
	cbnz	r0, .L782
.L784:
	ldr	r3, [r8]
	lsls	r2, r3, #22
	bmi	.L783
.L816:
	mvn	r7, #15
.L773:
	mov	r0, r9
	bl	mpp_session_clean_detach
	ldr	r3, [r8]
	lsls	r3, r3, #22
	bpl	.L789
	ldr	r3, [r6, #68]
	mov	r2, #852
	ldr	r1, .L817+4
	ldr	r0, .L817+16
	bl	printk
.L789:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, r7
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L781:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, r9
	ldr	r2, [r3, #60]!
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r2, r3
	bne	.L784
.L782:
	cbz	r5, .L785
	ldr	r3, [r5]
	str	r3, [r4, #140]
	ldr	r3, [r5, #4]
	str	r3, [r4, #144]
.L785:
	ldr	r5, [r4, #116]
	cbnz	r5, .L786
	ldr	r3, [r4]
	ldr	r5, [r3, #12]
.L786:
	mov	r1, r4
	mov	r0, r9
	bl	mpp_taskqueue_pending_to_run
	ldr	r0, [r5, #88]
	cbz	r0, .L787
	ldr	r3, [r0]
	cbz	r3, .L787
	adds	r0, r0, #4
	bl	down_read
.L787:
	add	r0, r5, #120
	bl	down_read
	mov	r0, r4
	bl	mpp_time_record
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #24]
	cbz	r3, .L788
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L788:
	add	r1, r4, #20
	movs	r0, #2
	bl	____atomic_set_bit
	b	.L773
.L783:
	ldr	r3, [r6, #68]
	movw	r2, #830
	ldr	r1, .L817+4
	ldr	r0, .L817+20
	bl	printk
	b	.L816
.L790:
	mvn	r7, #10
	b	.L773
.L791:
	movs	r7, #0
	b	.L773
.L818:
	.align	2
.L817:
	.word	mpp_dev_debug
	.word	.LANCHOR1+309
	.word	.LC84
	.word	.LC85
	.word	.LC87
	.word	.LC86
	.fnend
	.size	mpp_chnl_run_task, .-mpp_chnl_run_task
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_task_worker_default, %function
mpp_task_worker_default:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #20
	sub	sp, sp, #20
	ldr	r6, .L864
	ldr	r7, [r0, #68]
	ldr	r3, [r6]
	lsls	r0, r3, #26
	bpl	.L820
	movw	r2, #695
	ldr	r1, .L864+4
	ldr	r0, .L864+8
	bl	printk
.L820:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r10, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r8, .L864+24
.L821:
	mov	r0, r7
	bl	mpp_taskqueue_get_pending_task
	mov	r4, r0
	cbz	r0, .L822
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ble	.L823
	mov	r1, r0
	mov	r0, r7
	bl	mpp_taskqueue_pop_pending
	b	.L821
.L823:
	ldr	r3, [r0]
	ldr	r0, [r3, #12]
	ldr	r3, [r0, #12]
	ldr	r3, [r3, #20]
	cbz	r3, .L825
	mov	r1, r4
	blx	r3
	mov	r4, r0
	cbnz	r0, .L826
.L822:
	mov	r0, r7
	bl	mpp_session_clean_detach
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r10	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L825:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r1, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r3, r7
	ldr	r2, [r3, #60]!
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r1	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r2, r3
	bne	.L822
.L826:
	ldr	r5, [r4, #116]
	cbnz	r5, .L827
	ldr	r3, [r4]
	ldr	r5, [r3, #12]
.L827:
	add	r9, r4, #20
	mov	r1, r4
	mov	r0, r7
	bl	mpp_taskqueue_pending_to_run
	mov	r1, r9
	movs	r0, #1
	bl	____atomic_set_bit
	ldr	r2, [r6]
	ldr	fp, [r4]
	lsls	r1, r2, #26
	bpl	.L828
	mov	r2, #660
	mov	r1, r8
	ldr	r0, .L864+8
	bl	printk
.L828:
	mov	r0, r5
	bl	mpp_power_on
	mov	r0, r4
	bl	mpp_time_record
	ldr	r2, [r6]
	lsls	r2, r2, #22
	bpl	.L829
	ldr	r1, [r5]
	ldr	r2, [r1, #44]
	cbnz	r2, .L830
	ldr	r2, [r1]
.L830:
	ldr	r1, [r4, #20]
	ldr	r0, .L864+12
	str	r1, [sp, #12]
	ldr	r1, [r4, #100]
	str	r1, [sp, #8]
	ldr	r1, [fp, #4]
	str	r1, [sp, #4]
	mov	r1, r8
	ldr	r3, [fp]
	str	r3, [sp]
	mov	r3, r2
	movw	r2, #667
	bl	printk
.L829:
	ldrb	r3, [r5, #36]	@ zero_extendqisi2
	cbz	r3, .L831
	ldr	r3, [r5, #8]
	ldr	r3, [r3, #20]
	cbz	r3, .L831
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L831:
	ldr	r0, [r5, #88]
	cbz	r0, .L832
	ldr	r3, [r0]
	cbz	r3, .L832
	adds	r0, r0, #4
	bl	down_read
.L832:
	mov	r1, r9
	movs	r0, #2
	bl	____atomic_set_bit
	ldr	r1, .L864+16
	movs	r3, #20
	add	r2, r4, #28
	movs	r0, #1
	ldr	r1, [r1]
	bl	queue_delayed_work_on
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #24]
	cbz	r3, .L833
	mov	r1, r4
	mov	r0, r5
	blx	r3
.L833:
	ldr	r3, [r6]
	lsls	r3, r3, #26
	bpl	.L821
	movw	r2, #683
	mov	r1, r8
	ldr	r0, .L864+20
	bl	printk
	b	.L821
.L865:
	.align	2
.L864:
	.word	mpp_dev_debug
	.word	.LANCHOR1+327
	.word	.LC12
	.word	.LC88
	.word	system_wq
	.word	.LC13
	.word	.LANCHOR1+351
	.fnend
	.size	mpp_task_worker_default, .-mpp_task_worker_default
	.align	1
	.global	mpp_time_diff
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_time_diff, %function
mpp_time_diff:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	.save {r4, r5, r6, r7, fp, lr}
	mov	r4, r0
	ldr	r6, .L877
	.pad #32
	sub	sp, sp, #32
	ldr	r2, [r6]
	lsls	r2, r2, #23
	bpl	.L867
	ldr	r7, [r0, #116]
	ldr	r5, [r0]
	cbnz	r7, .L868
	ldr	r7, [r5, #12]
.L868:
	add	r0, sp, #16
	bl	ktime_get_real_ts64
	ldr	r3, [r6]
	lsls	r3, r3, #23
	bpl	.L867
	ldr	r3, [r7]
	ldr	r1, [r3, #44]
	cbnz	r1, .L870
	ldr	r1, [r3]
.L870:
	ldrd	r6, r0, [r4, #80]
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #20]
	subs	r2, r2, r6
	ldr	r6, .L877+4
	sbc	r0, r3, r0
	umull	fp, ip, r2, r6
	mla	ip, r6, r0, ip
	ldr	r6, [r4, #88]
	ldr	r0, [sp, #24]
	subs	r0, r0, r6
	ldr	r6, .L877+8
	smull	r6, r7, r0, r6
	asrs	r0, r0, #31
	rsb	r0, r0, r7, asr #6
	adds	r2, fp, r0
	adc	r3, ip, r0, asr #31
	strd	r2, [sp, #8]
	ldr	r3, [r4, #100]
	ldr	r0, .L877+12
	str	r3, [sp]
	ldrd	r2, r3, [r5]
	bl	printk
.L867:
	movs	r0, #0
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, fp, pc}
.L878:
	.align	2
.L877:
	.word	mpp_dev_debug
	.word	1000000
	.word	274877907
	.word	.LC89
	.fnend
	.size	mpp_time_diff, .-mpp_time_diff
	.align	1
	.global	mpp_write_req
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_write_req, %function
mpp_write_req:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	ldr	r10, .L887
	mov	r9, r1
	ldr	fp, .L887+4
	mov	r7, r3
	mov	r4, r2
.L880:
	cmp	r7, r4
	bhi	.L883
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L883:
	ldr	r3, [sp, #40]
	cmp	r3, r4
	beq	.L881
	ldr	r3, [r10]
	lsls	r6, r4, #2
	ldr	r5, [r9, r4, lsl #2]
	lsls	r3, r3, #19
	bpl	.L882
	mov	r3, r5
	mov	r2, r6
	bic	r1, r4, #-1073741824
	mov	r0, fp
	bl	printk
.L882:
	ldr	r3, [r8, #60]
	add	r6, r6, r3
	.syntax unified
@ 95 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	str r5, [r6]
@ 0 "" 2
	.thumb
	.syntax unified
.L881:
	adds	r4, r4, #1
	b	.L880
.L888:
	.align	2
.L887:
	.word	mpp_dev_debug
	.word	.LC90
	.fnend
	.size	mpp_write_req, .-mpp_write_req
	.align	1
	.global	mpp_read_req
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_read_req, %function
mpp_read_req:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r0
	ldr	r8, .L896
	mov	r7, r1
	ldr	r9, .L896+4
	mov	r5, r3
	mov	r4, r2
.L890:
	cmp	r5, r4
	bhi	.L892
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L892:
	ldr	r3, [r6, #60]
	lsls	r2, r4, #2
	add	r3, r3, r2
	.syntax unified
@ 113 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/io.h" 1
	ldr r10, [r3]
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8]
	lsls	r3, r3, #18
	bpl	.L891
	mov	r3, r10
	bic	r1, r4, #-1073741824
	mov	r0, r9
	bl	printk
.L891:
	str	r10, [r7, r4, lsl #2]
	adds	r4, r4, #1
	b	.L890
.L897:
	.align	2
.L896:
	.word	mpp_dev_debug
	.word	.LC91
	.fnend
	.size	mpp_read_req, .-mpp_read_req
	.align	1
	.global	mpp_get_clk_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_get_clk_info, %function
mpp_get_clk_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r0, [r0]
	mov	r6, r1
	mov	r8, r2
	bl	mpp_dev_of_node
	mov	r2, r8
	ldr	r1, .L901
	mov	r4, r0
	bl	of_property_match_string
	subs	r5, r0, #0
	blt	.L900
	mov	r1, r8
	ldr	r0, [r7]
	bl	devm_clk_get
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L901+4
	str	r0, [r3], #8
	mov	r0, r4
	bl	of_property_read_u32_index
	add	r3, r6, #12
	mov	r2, r5
	ldr	r1, .L901+8
	mov	r0, r4
	bl	of_property_read_u32_index
	movs	r0, #0
.L898:
	pop	{r4, r5, r6, r7, r8, pc}
.L900:
	mvn	r0, #21
	b	.L898
.L902:
	.align	2
.L901:
	.word	.LC92
	.word	.LC93
	.word	.LC94
	.fnend
	.size	mpp_get_clk_info, .-mpp_get_clk_info
	.align	1
	.global	mpp_set_clk_info_rate_hz
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_set_clk_info_rate_hz, %function
mpp_set_clk_info_rate_hz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r1
	ldr	r1, [r0]
	cbz	r1, .L904
	cbz	r2, .L904
	cmp	r3, #4
	bhi	.L905
	tbb	[pc, r3]
.L907:
	.byte	(.L911-.L907)/2
	.byte	(.L910-.L907)/2
	.byte	(.L909-.L907)/2
	.byte	(.L908-.L907)/2
	.byte	(.L906-.L907)/2
	.p2align 1
.L910:
	str	r2, [r0, #4]
.L904:
	movs	r0, #0
	pop	{r3, pc}
.L909:
	str	r2, [r0, #20]
	b	.L904
.L908:
	str	r2, [r0, #8]
	b	.L904
.L906:
	str	r2, [r0, #12]
	b	.L904
.L911:
	str	r2, [r0, #16]
	b	.L904
.L905:
	movw	r2, #1734
	ldr	r1, .L918
	ldr	r0, .L918+4
	bl	printk
	b	.L904
.L919:
	.align	2
.L918:
	.word	.LANCHOR1+364
	.word	.LC95
	.fnend
	.size	mpp_set_clk_info_rate_hz, .-mpp_set_clk_info_rate_hz
	.align	1
	.global	mpp_get_clk_info_rate_hz
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_get_clk_info_rate_hz, %function
mpp_get_clk_info_rate_hz:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, r0
	ldr	r0, [r0]
	cbz	r0, .L920
	ldr	r0, [r2, #4]
	cbnz	r0, .L920
	cmp	r1, #3
	beq	.L922
	cmp	r1, #4
	beq	.L923
	cmp	r1, #2
	bne	.L924
	ldr	r0, [r2, #20]
	ldr	r3, .L929
	cmp	r0, #0
	it	eq
	moveq	r0, r3
	bx	lr
.L923:
	ldr	r0, [r2, #12]
	cbnz	r0, .L920
.L922:
	ldr	r0, [r2, #8]
	cbnz	r0, .L920
.L924:
	ldr	r0, [r2, #16]
.L920:
	bx	lr
.L930:
	.align	2
.L929:
	.word	50000000
	.fnend
	.size	mpp_get_clk_info_rate_hz, .-mpp_get_clk_info_rate_hz
	.align	1
	.global	mpp_clk_set_rate
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_clk_set_rate, %function
mpp_clk_set_rate:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r0]
	cbz	r4, .L933
	bl	mpp_get_clk_info_rate_hz
	cbz	r0, .L931
	str	r0, [r5, #24]
	mov	r1, r0
	mov	r0, r4
	bl	clk_set_rate
	movs	r0, #0
.L931:
	pop	{r3, r4, r5, pc}
.L933:
	mvn	r0, #21
	b	.L931
	.fnend
	.size	mpp_clk_set_rate, .-mpp_clk_set_rate
	.align	1
	.global	mpp_procfs_create_u32
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_procfs_create_u32, %function
mpp_procfs_create_u32:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	str	r3, [sp]
	ldr	r3, .L936
	bl	proc_create_data
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L937:
	.align	2
.L936:
	.word	.LANCHOR1+392
	.fnend
	.size	mpp_procfs_create_u32, .-mpp_procfs_create_u32
	.align	1
	.global	mpp_procfs_create_clk_rw
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_procfs_create_clk_rw, %function
mpp_procfs_create_clk_rw:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	str	r3, [sp]
	ldr	r3, .L939
	bl	proc_create_data
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L940:
	.align	2
.L939:
	.word	.LANCHOR1+436
	.fnend
	.size	mpp_procfs_create_clk_rw, .-mpp_procfs_create_clk_rw
	.global	g_mpp_svr_fn_ops
	.global	g_srv
	.global	rockchip_mpp_fops
	.global	mpp_device_name
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__func__.40522, %object
	.size	__func__.40522, 26
__func__.40522:
	.ascii	"mpp_session_get_idle_task\000"
	.type	__func__.41581, %object
	.size	__func__.41581, 23
__func__.41581:
	.ascii	"mpp_chnl_get_iova_addr\000"
	.type	__func__.41277, %object
	.size	__func__.41277, 13
__func__.41277:
	.ascii	"mpp_dev_open\000"
	.type	__func__.40804, %object
	.size	__func__.40804, 25
__func__.40804:
	.ascii	"mpp_process_task_default\000"
	.type	__func__.40780, %object
	.size	__func__.40780, 14
__func__.40780:
	.ascii	"mpp_free_task\000"
	.type	__func__.41012, %object
	.size	__func__.41012, 17
__func__.41012:
	.ascii	"mpp_parse_msg_v1\000"
	.type	__func__.41569, %object
	.size	__func__.41569, 17
__func__.41569:
	.ascii	"mpp_chnl_add_req\000"
	.type	__func__.41028, %object
	.size	__func__.41028, 17
__func__.41028:
	.ascii	"mpp_get_cmd_butt\000"
	.type	__func__.41207, %object
	.size	__func__.41207, 20
__func__.41207:
	.ascii	"mpp_process_request\000"
	.type	__func__.41283, %object
	.size	__func__.41283, 16
__func__.41283:
	.ascii	"mpp_dev_release\000"
	.type	__func__.41559, %object
	.size	__func__.41559, 17
__func__.41559:
	.ascii	"mpp_chnl_release\000"
	.type	__func__.40936, %object
	.size	__func__.40936, 24
__func__.40936:
	.ascii	"mpp_wait_result_default\000"
.LC44:
	.ascii	"shared_\000"
	.space	24
	.type	__func__.40797, %object
	.size	__func__.40797, 22
__func__.40797:
	.ascii	"mpp_task_timeout_work\000"
	.type	__func__.41293, %object
	.size	__func__.41293, 14
__func__.41293:
	.ascii	"mpp_check_req\000"
	.type	__func__.41381, %object
	.size	__func__.41381, 12
__func__.41381:
	.ascii	"mpp_dev_irq\000"
	.type	__func__.40918, %object
	.size	__func__.40918, 18
__func__.40918:
	.ascii	"mpp_chnl_run_task\000"
	.type	__func__.40848, %object
	.size	__func__.40848, 24
__func__.40848:
	.ascii	"mpp_task_worker_default\000"
	.type	__func__.40835, %object
	.size	__func__.40835, 13
__func__.40835:
	.ascii	"mpp_task_run\000"
	.type	__func__.41439, %object
	.size	__func__.41439, 25
__func__.41439:
	.ascii	"mpp_set_clk_info_rate_hz\000"
	.space	3
	.type	procfs_fops_u32, %object
	.size	procfs_fops_u32, 44
procfs_fops_u32:
	.space	4
	.word	fops_open_u32
	.word	seq_read
	.space	4
	.word	fops_write_u32
	.space	4
	.word	single_release
	.space	16
	.type	procfs_fops_clk, %object
	.size	procfs_fops_clk, 44
procfs_fops_clk:
	.space	4
	.word	fops_open_clk
	.word	seq_read
	.space	4
	.word	fops_write_clk
	.space	4
	.word	single_release
	.space	16
	.type	rockchip_mpp_fops, %object
	.size	rockchip_mpp_fops, 128
rockchip_mpp_fops:
	.space	40
	.word	mpp_dev_ioctl
	.space	12
	.word	mpp_dev_open
	.space	4
	.word	mpp_dev_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_mpp_svr_fn_ops, %object
	.size	g_mpp_svr_fn_ops, 36
g_mpp_svr_fn_ops:
	.word	mpp_chnl_open
	.word	mpp_chnl_register
	.word	mpp_chnl_release
	.word	mpp_chnl_add_req
	.word	mpp_chnl_get_iova_addr
	.word	0
	.word	mpp_chnl_get_dev
	.word	mpp_chnl_run_task
	.word	mpp_chnl_is_running
	.type	mpp_device_name, %object
	.size	mpp_device_name, 12
mpp_device_name:
	.space	4
	.word	.LC96
	.word	.LC97
	.bss
	.align	2
	.set	.LANCHOR2,. + 0
	.type	g_srv, %object
	.size	g_srv, 4
g_srv:
	.space	4
	.type	__key.40805, %object
	.size	__key.40805, 0
__key.40805:
	.type	__key.41326, %object
	.size	__key.41326, 0
__key.41326:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016rk_vcodec: %s:%d: task %d %#lx session %p chan"
	.ascii	" %d find session %p\012\000"
.LC1:
	.ascii	"\0016rk_vcodec: session %p:%d attach\012\000"
.LC2:
	.ascii	"%d\012\000"
.LC3:
	.ascii	" \000"
.LC4:
	.ascii	"%s %dHz\012\000"
.LC5:
	.ascii	"------ parents info ------\012\000"
.LC6:
	.ascii	"current parent: %s %ldHz\012\000"
.LC7:
	.ascii	"parent[%d]: %s %ldHz \000"
.LC8:
	.ascii	"-> %s %ldHz \000"
.LC9:
	.ascii	"\012\000"
.LC10:
	.ascii	"\0013rk_vcodec: %s:%d: session is null\000"
.LC11:
	.ascii	"\0016rk_vcodec: session %p init\012\000"
.LC12:
	.ascii	"\0016rk_vcodec: %s:%d: enter\012\000"
.LC13:
	.ascii	"\0016rk_vcodec: %s:%d: leave\012\000"
.LC14:
	.ascii	"\0013rk_vcodec: %s:%d: pid %d client %d found inval"
	.ascii	"id process function\012\000"
.LC15:
	.ascii	"\0013rk_vcodec: %s:%d: alloc_task failed.\012\000"
.LC16:
	.ascii	"&task->wait\000"
.LC17:
	.ascii	"\0016rk_vcodec: %s:%d: session %d:%d task %d state "
	.ascii	"0x%lx\012\000"
.LC18:
	.ascii	"\0013rk_vcodec: %s:%d: task %p, task->session is nu"
	.ascii	"ll.\012\000"
.LC19:
	.ascii	"\0016rk_vcodec: %s:%d: session %d:%d task %d state "
	.ascii	"0x%lx abort_request %d\012\000"
.LC20:
	.ascii	"\0016rk_vcodec: cmd %x, flags %08x, size %d, offset"
	.ascii	" %x\012\000"
.LC21:
	.ascii	"\0013rk_vcodec: %s:%d: mpp cmd %x is not supproted."
	.ascii	"\012\000"
.LC22:
	.ascii	"\0013rk_vcodec: %s:%d: fail, message count %d more "
	.ascii	"than %d.\012\000"
.LC23:
	.ascii	"\0016rk_vcodec: cmd %x process\012\000"
.LC24:
	.ascii	"\0016rk_vcodec: hw_support %08x\012\000"
.LC25:
	.ascii	"\0016rk_vcodec: client %d\012\000"
.LC26:
	.ascii	"\0016rk_vcodec: hw_id %08x\012\000"
.LC27:
	.ascii	"\0013rk_vcodec: %s:%d: unknown dev cmd 0x%x\012\000"
.LC28:
	.ascii	"\0013rk_vcodec: %s:%d: client_type must less than %"
	.ascii	"d\012\000"
.LC29:
	.ascii	"\0013rk_vcodec: %s:%d: wait task running time out\012"
	.ascii	"\000"
.LC30:
	.ascii	"\0013rk_vcodec: %s:%d: set online mode %d\012\000"
.LC31:
	.ascii	"\0013rk_vcodec: %s:%d: pid %d not find client %d\012"
	.ascii	"\000"
.LC32:
	.ascii	"\0016rk_vcodec: unknown mpp ioctl cmd %x\012\000"
.LC33:
	.ascii	"\0013rk_vcodec: invalid NULL process task function\012"
	.ascii	"\000"
.LC34:
	.ascii	"\0013rk_vcodec: invalid NULL wait result function\012"
	.ascii	"\000"
.LC35:
	.ascii	"\0016rk_vcodec: session %p:%d task %d release\012\000"
.LC36:
	.ascii	"\0013rk_vcodec: invalid NULL session deinit functio"
	.ascii	"n\012\000"
.LC37:
	.ascii	"\0016rk_vcodec: session %p:%d deinit\012\000"
.LC38:
	.ascii	"\0016rk_vcodec: %s detach count %d\012\000"
.LC39:
	.ascii	"\0016rk_vcodec: session %p:%d detach\012\000"
.LC40:
	.ascii	"\0013rk_vcodec: %s:%d: session is null\012\000"
.LC41:
	.ascii	"\0013rk_vcodec: %s:%d: session %p pending list is e"
	.ascii	"mpty!\012\000"
.LC42:
	.ascii	"\0013rk_vcodec: %s:%d: timeout, pid %d session %d:%"
	.ascii	"d count %d cur_task %d state %lx\012\000"
.LC43:
	.ascii	"\0016rk_vcodec: %s:%d: session %d:%d task %d state "
	.ascii	"0x%lx kref_rd %d ret %d\012\000"
.LC45:
	.ascii	"reset-names\000"
.LC46:
	.ascii	"%s is not found!\012\000"
.LC47:
	.ascii	"reset group is empty!\012\000"
.LC48:
	.ascii	"reset_group->rw_sem_on=%d\012\000"
.LC49:
	.ascii	"\0016rk_vcodec: resetting...\012\000"
.LC50:
	.ascii	"\0016rk_vcodec: reset done\012\000"
.LC51:
	.ascii	"\0013rk_vcodec: %s:%d: task has been handled\012\000"
.LC52:
	.ascii	"\0013rk_vcodec: %s:%d: task %d processing time out!"
	.ascii	"\012\000"
.LC53:
	.ascii	"\0013rk_vcodec: %s:%d: session %p, session->mpp is "
	.ascii	"null.\012\000"
.LC54:
	.ascii	"\0013rk_vcodec: %s:%d: error: base %x, offset %x\012"
	.ascii	"\000"
.LC55:
	.ascii	"\0013rk_vcodec: %s:%d: error: req_off %x, req_size "
	.ascii	"%x, off_s %x\012\000"
.LC56:
	.ascii	"\0013rk_vcodec: %s:%d: error: off_e %x, max_size %x"
	.ascii	"\012\000"
.LC57:
	.ascii	"\0013rk_vcodec: %s:%d: error: req_off %x, max_size "
	.ascii	"%x\012\000"
.LC58:
	.ascii	"\0013rk_vcodec: %s:%d: error: req_off %x, req_size "
	.ascii	"%x, max_size %x\012\000"
.LC59:
	.ascii	"&mpp->work_sem\000"
.LC60:
	.ascii	"rockchip,srv\000"
.LC61:
	.ascii	"failed to get the mpp service node\012\000"
.LC62:
	.ascii	"failed to get mpp service from node\012\000"
.LC63:
	.ascii	"failed attach service\012\000"
.LC64:
	.ascii	"rockchip,taskqueue-node\000"
.LC65:
	.ascii	"failed to get taskqueue-node\012\000"
.LC66:
	.ascii	"taskqueue-node %d must less than %d\012\000"
.LC67:
	.ascii	"taskqueue attach to invalid node %d\012\000"
.LC68:
	.ascii	"invalid core id %d\012\000"
.LC69:
	.ascii	"can not attach device with same id %d\000"
.LC70:
	.ascii	"\0016rk_vcodec: %s attach queue as core %d\012\000"
.LC71:
	.ascii	"rockchip,resetgroup-node\000"
.LC72:
	.ascii	"resetgroup-node %d must less than %d\012\000"
.LC73:
	.ascii	"failed to attach service\012\000"
.LC74:
	.ascii	"link mode task capacity %d\012\000"
.LC75:
	.ascii	"No interrupt resource found\012\000"
.LC76:
	.ascii	"no memory resource defined\012\000"
.LC77:
	.ascii	"ioremap failed for resource %pR\012\000"
.LC78:
	.ascii	"\0016rk_vcodec: read reg[%03d]: %04x: 0x%08x\012\000"
.LC79:
	.ascii	"shutdown device\012\000"
.LC80:
	.ascii	"wait total %d running time out\012\000"
.LC81:
	.ascii	"shutdown success\012\000"
.LC82:
	.ascii	"\0013rk_vcodec: %s:%d: error, task has been handled"
	.ascii	", irq_status %08x\012\000"
.LC83:
	.ascii	"\0016rk_vcodec: error, task is null\012\000"
.LC84:
	.ascii	"\0016rk_vcodec: %s:%d: chan_id %d ++\012\000"
.LC85:
	.ascii	"\0016rk_vcodec: chan %d task %d pipe %d frame %d wx"
	.ascii	"h [%d %d] != [%d %d]\012\000"
.LC86:
	.ascii	"\0016rk_vcodec: %s:%d: chan_id %d device is busy no"
	.ascii	"w\012\000"
.LC87:
	.ascii	"\0016rk_vcodec: %s:%d: chan_id %d --\012\000"
.LC88:
	.ascii	"\0016rk_vcodec: %s:%d: %s session %d:%d task=%d sta"
	.ascii	"te=0x%lx\012\000"
.LC89:
	.ascii	"\0016rk_vcodec: %s: session %d:%d task %d time: %ll"
	.ascii	"d us\012\000"
.LC90:
	.ascii	"\0016rk_vcodec: write reg[%03d]: %04x: 0x%08x\012\000"
.LC91:
	.ascii	"\0016rk_vcodec: read reg[%03d] %04x: 0x%08x\012\000"
.LC92:
	.ascii	"clock-names\000"
.LC93:
	.ascii	"rockchip,normal-rates\000"
.LC94:
	.ascii	"rockchip,advanced-rates\000"
.LC95:
	.ascii	"\0013rk_vcodec: %s:%d: error mode %d\012\000"
.LC96:
	.ascii	"RKVENC\000"
.LC97:
	.ascii	"RKVENC_PP\000"
	.section	___ksymtab+get_mppdev_svr_ops,"a"
	.align	2
	.type	__ksymtab_get_mppdev_svr_ops, %object
	.size	__ksymtab_get_mppdev_svr_ops, 12
__ksymtab_get_mppdev_svr_ops:
	.word	get_mppdev_svr_ops
	.word	__kstrtab_get_mppdev_svr_ops
	.word	__kstrtabns_get_mppdev_svr_ops
	.section	___ksymtab+mpp_show_session_info,"a"
	.align	2
	.type	__ksymtab_mpp_show_session_info, %object
	.size	__ksymtab_mpp_show_session_info, 12
__ksymtab_mpp_show_session_info:
	.word	mpp_show_session_info
	.word	__kstrtab_mpp_show_session_info
	.word	__kstrtabns_mpp_show_session_info
	.section	___ksymtab+mpp_srv_get_phy,"a"
	.align	2
	.type	__ksymtab_mpp_srv_get_phy, %object
	.size	__ksymtab_mpp_srv_get_phy, 12
__ksymtab_mpp_srv_get_phy:
	.word	mpp_srv_get_phy
	.word	__kstrtab_mpp_srv_get_phy
	.word	__kstrtabns_mpp_srv_get_phy
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
