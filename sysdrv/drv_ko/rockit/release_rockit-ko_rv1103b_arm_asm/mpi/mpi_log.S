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
	.file	"mpi_log.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vlog:					
	.asciz 	"vlog"					
__kstrtabns_vlog:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_compat_ioctl, %function
vlog_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vlog_compat_ioctl, .-vlog_compat_ioctl
	.align	1
	.global	vlog
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog, %function
vlog:
	.fnstart
	@ args = 4, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, r3
	ldr	r5, .L5
	.pad #296
	sub	sp, sp, #296
	ldr	r4, .L5+4
	mov	r7, r0
	mov	r8, r1
	mov	r10, r2
	ldr	r3, [r5]
	str	r3, [sp, #292]
	ldr	r3, [r4, r0, lsl #2]
	cmp	r3, r1
	blt	.L3
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	add	r0, sp, #28
	add	r7, r4, r7, lsl #2
	bl	rkos_gettime
	ldr	r0, .L5+8
	add	r4, r4, r8, lsl #2
	ldr	r2, .L5+12
	ldrh	r3, [sp, #328]
	str	r10, [sp, #20]
	strd	r9, r3, [sp, #12]
	ldr	r3, [sp, #32]
	smull	r0, r1, r3, r0
	asrs	r3, r3, #31
	add	r0, sp, #36
	rsb	r3, r3, r1, asr #6
	str	r3, [sp, #8]
	ldr	r3, [sp, #28]
	mov	r1, #256
	str	r3, [sp, #4]
	ldr	r3, [r4, #208]
	str	r3, [sp]
	ldr	r3, [r7, #104]
	bl	snprintf
	ldr	r0, .L5+16
	add	r2, sp, #332
	add	r1, sp, #36
	str	r2, [sp, #24]
	bl	mpi_fs_buf_loop_add
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L3:
	ldr	r2, [sp, #292]
	movs	r0, #0
	ldr	r3, [r5]
	cmp	r2, r3
	beq	.L4
	bl	__stack_chk_fail
.L4:
	add	sp, sp, #296
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L6:
	.align	2
.L5:
	.word	__stack_chk_guard
	.word	.LANCHOR0
	.word	274877907
	.word	.LC0
	.word	.LANCHOR1+144
	.fnend
	.size	vlog, .-vlog
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_thread_fn, %function
vlog_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r0, [r0, #84]
	add	r5, r4, #164
	bl	rkos_kthread_set_name
.L8:
	bl	rkos_kthread_should_stop
	cbz	r0, .L10
.L9:
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L10:
	ldr	r3, [r4, #172]
	cmp	r3, #0
	bne	.L9
	mov	r0, r5
	bl	rkos_down
	b	.L8
	.fnend
	.size	vlog_thread_fn, .-vlog_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_release, %function
vlog_release:
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
	ldr	r2, .L12
	movs	r1, #5
	movs	r0, #0
	ldr	r3, [r3]
	str	r3, [sp, #4]
	movs	r3, #226
	str	r3, [sp]
	ldr	r3, .L12+4
	bl	vlog
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L13:
	.align	2
.L12:
	.word	.LC1
	.word	.LANCHOR2
	.fnend
	.size	vlog_release, .-vlog_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_write, %function
vlog_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	cmp	r2, #7
	ldr	r5, .L20
	.pad #20
	sub	sp, sp, #20
	mov	r4, r2
	ldr	r0, [r5]
	str	r0, [sp, #12]
	bhi	.L18
	add	r0, sp, #4
	bl	rkos_copy_from_user
	cbnz	r0, .L19
	add	r3, sp, #16
	movs	r2, #2
	add	r3, r3, r4
	ldr	r1, .L20+4
	strb	r0, [r3, #-13]
	add	r0, sp, #4
	bl	rkos_strncmp
	cbnz	r0, .L16
	ldr	r0, .L20+8
	bl	mpi_fs_buf_reset_with_memset
.L16:
	mov	r0, r4
.L14:
	ldr	r2, [sp, #12]
	ldr	r3, [r5]
	cmp	r2, r3
	beq	.L17
	bl	__stack_chk_fail
.L18:
	mvn	r0, #21
	b	.L14
.L19:
	mvn	r0, #13
	b	.L14
.L17:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L21:
	.align	2
.L20:
	.word	__stack_chk_guard
	.word	.LC2
	.word	.LANCHOR1+144
	.fnend
	.size	vlog_write, .-vlog_write
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_read, %function
vlog_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L24
	bl	mpi_fs_buf_read
	cmp	r0, #-1
	it	eq
	moveq	r0, #0
	pop	{r3, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR1+144
	.fnend
	.size	vlog_read, .-vlog_read
	.align	1
	.global	vlog_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_version, %function
vlog_version:
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
	beq	.L27
	movs	r3, #118
	ldr	r2, .L31
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L31+4
	movs	r0, #0
	bl	vlog
	mov	r0, #-1
.L26:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L27:
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
	b	.L26
.L32:
	.align	2
.L31:
	.word	.LC3
	.word	.LANCHOR2+13
	.fnend
	.size	vlog_version, .-vlog_version
	.align	1
	.global	vlog_set_level
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_set_level, %function
vlog_set_level:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r4, r1
	ldr	r3, [r1, #8]	@ unaligned
	movs	r0, #0
	ldr	r2, .L41
	str	r3, [sp, #8]
	ldr	r3, [r1]	@ unaligned
	movs	r1, #4
	str	r3, [sp, #4]
	movs	r3, #143
	str	r3, [sp]
	ldr	r3, .L41+4
	bl	vlog
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, #12
	beq	.L34
	movs	r3, #145
	ldr	r2, .L41+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L41+4
	movs	r0, #0
	bl	vlog
.L38:
	mov	r0, #-1
	b	.L33
.L34:
	ldr	r2, [r4]	@ unaligned
	cmp	r2, #26
	bhi	.L38
	ldr	r3, .L41+12
	bne	.L36
	movs	r2, #0
.L37:
	ldr	r1, [r4, #8]	@ unaligned
	adds	r2, r2, #1
	cmp	r2, #26
	str	r1, [r3], #4
	bne	.L37
.L40:
	movs	r0, #0
.L33:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L36:
	ldr	r1, [r4, #8]	@ unaligned
	str	r1, [r3, r2, lsl #2]
	b	.L40
.L42:
	.align	2
.L41:
	.word	.LC4
	.word	.LANCHOR2+26
	.word	.LC5
	.word	.LANCHOR0
	.fnend
	.size	vlog_set_level, .-vlog_set_level
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_ioctl, %function
vlog_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, .L47
	mov	r6, r0
	mov	r5, r1
	mov	r7, r2
	adds	r3, r3, #4
	ldr	r2, .L47+4
	ldr	r8, [r3, #136]
	movs	r1, #5
	strd	r4, r3, [sp, #8]
	movs	r0, #0
	movs	r3, #179
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L47+8
	bl	vlog
	ldr	r0, [r8, #180]
	cmp	r0, r4
	bhi	.L44
	movs	r3, #182
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L47+8
	movs	r0, #0
	ldr	r2, .L47+12
	bl	vlog
.L45:
.L43:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L44:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r0
	sbc	r0, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r0
	ldr	r0, [r8, #176]
	movs	r3, #20
	mla	r0, r3, r4, r0
	cbnz	r0, .L46
	movs	r3, #189
	ldr	r2, .L47+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L47+8
	bl	vlog
	b	.L43
.L46:
	mov	r1, r0
	mov	r3, r7
	mov	r2, r5
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L48:
	.align	2
.L47:
	.word	.LANCHOR1
	.word	.LC6
	.word	.LANCHOR2+41
	.word	.LC7
	.word	.LC8
	.fnend
	.size	vlog_ioctl, .-vlog_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_open, %function
vlog_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	ldr	r0, [r3, #12]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L50
	movs	r3, #213
	ldr	r2, .L52+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L52+8
	bl	vlog
	mov	r0, #-1
.L49:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L50:
	ldr	r4, .L52+12
	adds	r6, r4, #4
	mov	r0, r6
	bl	mpi_obj_ref
	ldr	r3, [r4, #4]
	str	r6, [r5]
	movs	r1, #5
	str	r5, [r7, #128]
	movs	r0, #0
	ldr	r2, .L52+16
	str	r3, [sp, #4]
	movs	r3, #218
	str	r3, [sp]
	ldr	r3, .L52+8
	bl	vlog
	movs	r0, #0
	b	.L49
.L53:
	.align	2
.L52:
	.word	kmalloc_caches
	.word	.LC9
	.word	.LANCHOR2+52
	.word	.LANCHOR1
	.word	.LC1
	.fnend
	.size	vlog_open, .-vlog_open
	.align	1
	.global	vlog_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_probe, %function
vlog_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	movs	r2, #184
	ldr	r4, .L56
	mov	r6, r0
	movs	r1, #0
	ldr	r7, .L56+4
	movs	r5, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	mov	r1, #51200
	movs	r3, #2
	str	r4, [r4, #140]
	str	r3, [r4, #180]
	str	r7, [r4, #176]
	str	r0, [r4]
	add	r0, r4, #144
	bl	mpi_fs_buf_init
	mov	r2, r6
	movs	r1, #8
	adds	r0, r4, #4
	bl	mpi_dev_register
	mov	r1, r5
	add	r0, r4, #164
	str	r5, [r4, #108]
	strd	r5, r5, [r4, #116]
	bl	rkos_sema_init
	mov	r2, r5
	add	r1, r7, #40
	adds	r0, r4, #4
	bl	mpi_sysfs_dev_add
	mov	r3, r6
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L56+8
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L55
	bl	wake_up_process
.L55:
	str	r5, [r4, #168]
	pop	{r3, r4, r5, r6, r7, pc}
.L57:
	.align	2
.L56:
	.word	.LANCHOR1
	.word	.LANCHOR2+64
	.word	vlog_thread_fn
	.fnend
	.size	vlog_probe, .-vlog_probe
	.align	1
	.global	vlog_unload
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vlog_unload, %function
vlog_unload:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r3, #1
	ldr	r4, .L59
	add	r5, r4, #164
	str	r3, [r4, #172]
	mov	r0, r5
	bl	rkos_up
	ldr	r0, [r4, #168]
	bl	kthread_stop
	mov	r0, r5
	adds	r5, r4, #4
	bl	rkos_sema_destory
	mov	r0, r5
	bl	mpi_sysfs_dev_remove
	mov	r0, r5
	bl	mpi_dev_unregister
	add	r0, r4, #144
	bl	mpi_fs_buf_deinit
	ldr	r0, [r4]
	pop	{r3, r4, r5, lr}
	b	kfree
.L60:
	.align	2
.L59:
	.word	.LANCHOR1
	.fnend
	.size	vlog_unload, .-vlog_unload
	.global	g_vlog_dev
	.global	current_log_level
	.global	level_name
	.global	module_name
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	__func__.36260, %object
	.size	__func__.36260, 13
__func__.36260:
	.ascii	"vlog_release\000"
	.type	__func__.36208, %object
	.size	__func__.36208, 13
__func__.36208:
	.ascii	"vlog_version\000"
	.type	__func__.36215, %object
	.size	__func__.36215, 15
__func__.36215:
	.ascii	"vlog_set_level\000"
	.type	__func__.36231, %object
	.size	__func__.36231, 11
__func__.36231:
	.ascii	"vlog_ioctl\000"
	.type	__func__.36253, %object
	.size	__func__.36253, 10
__func__.36253:
	.ascii	"vlog_open\000"
	.space	2
	.type	vlog_ioctls, %object
	.size	vlog_ioctls, 40
vlog_ioctls:
	.word	-1065587712
	.word	0
	.word	vlog_version
	.word	.LC10
	.word	0
	.word	-1072927743
	.word	0
	.word	vlog_set_level
	.word	.LC11
	.word	0
	.type	vlog_driver_fops, %object
	.size	vlog_driver_fops, 128
vlog_driver_fops:
	.word	0
	.space	4
	.word	vlog_read
	.word	vlog_write
	.space	20
	.word	0
	.word	vlog_ioctl
	.word	vlog_compat_ioctl
	.word	0
	.space	4
	.word	vlog_open
	.space	4
	.word	vlog_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	current_log_level, %object
	.size	current_log_level, 104
current_log_level:
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.space	8
	.type	module_name, %object
	.size	module_name, 104
module_name:
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC33
	.word	.LC34
	.word	.LC35
	.word	.LC36
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.space	4
	.type	level_name, %object
	.size	level_name, 24
level_name:
	.word	.LC12
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	g_vlog_dev, %object
	.size	g_vlog_dev, 184
g_vlog_dev:
	.space	184
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"[%-6.6s][%-3.3s][%9ld.%-6ld] {%-18.18s:%04d} %s\015"
	.ascii	"\012\000"
.LC1:
	.ascii	"%d\000"
.LC2:
	.ascii	"0\000"
.LC3:
	.ascii	"\033[1;31mstruct vlog_version mismatching\033[0m\000"
.LC4:
	.ascii	"\033[1;32mmod = %d, level = %d\033[0m\000"
.LC5:
	.ascii	"\033[1;31mstruct vlog_level mismatching\033[0m\000"
.LC6:
	.ascii	"vlog_ioctl: nr = %d, index = %d dev = %p\000"
.LC7:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC8:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC9:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC10:
	.ascii	"VLOG_IOCTL_VERSION\000"
.LC11:
	.ascii	"VLOG_IOCTL_SET_LOG_LEVEL\000"
.LC12:
	.ascii	"off\000"
.LC13:
	.ascii	"err\000"
.LC14:
	.ascii	"wrn\000"
.LC15:
	.ascii	"inf\000"
.LC16:
	.ascii	"dbg\000"
.LC17:
	.ascii	"cmpi\000"
.LC18:
	.ascii	"mb\000"
.LC19:
	.ascii	"sys\000"
.LC20:
	.ascii	"rgn\000"
.LC21:
	.ascii	"venc\000"
.LC22:
	.ascii	"vdec\000"
.LC23:
	.ascii	"vpss\000"
.LC24:
	.ascii	"vgs\000"
.LC25:
	.ascii	"vi\000"
.LC26:
	.ascii	"vo\000"
.LC27:
	.ascii	"ai\000"
.LC28:
	.ascii	"ao\000"
.LC29:
	.ascii	"aenc\000"
.LC30:
	.ascii	"adec\000"
.LC31:
	.ascii	"tde\000"
.LC32:
	.ascii	"isp\000"
.LC33:
	.ascii	"wbc\000"
.LC34:
	.ascii	"avs\000"
.LC35:
	.ascii	"rga\000"
.LC36:
	.ascii	"af\000"
.LC37:
	.ascii	"ivs\000"
.LC38:
	.ascii	"pvs\000"
.LC39:
	.ascii	"dis\000"
.LC40:
	.ascii	"cac\000"
.LC41:
	.ascii	"aiisp\000"
	.section	___ksymtab_gpl+vlog,"a"
	.align	2
	.type	__ksymtab_vlog, %object
	.size	__ksymtab_vlog, 12
__ksymtab_vlog:
	.word	vlog
	.word	__kstrtab_vlog
	.word	__kstrtabns_vlog
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
