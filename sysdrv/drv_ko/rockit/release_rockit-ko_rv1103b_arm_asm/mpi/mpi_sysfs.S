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
	.file	"mpi_sysfs.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_sysfs_dev_add:					
	.asciz 	"mpi_sysfs_dev_add"					
__kstrtabns_mpi_sysfs_dev_add:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_sysfs_dev_remove:					
	.asciz 	"mpi_sysfs_dev_remove"					
__kstrtabns_mpi_sysfs_dev_remove:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_sysfs_hotplug_event:					
	.asciz 	"mpi_sysfs_hotplug_event"					
__kstrtabns_mpi_sysfs_hotplug_event:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_init:					
	.asciz 	"mpi_fs_buf_init"					
__kstrtabns_mpi_fs_buf_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_deinit:					
	.asciz 	"mpi_fs_buf_deinit"					
__kstrtabns_mpi_fs_buf_deinit:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_reset:					
	.asciz 	"mpi_fs_buf_reset"					
__kstrtabns_mpi_fs_buf_reset:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_reset_with_memset:					
	.asciz 	"mpi_fs_buf_reset_with_memset"					
__kstrtabns_mpi_fs_buf_reset_with_memset:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_read:					
	.asciz 	"mpi_fs_buf_read"					
__kstrtabns_mpi_fs_buf_read:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_fs_buf_loop_add:					
	.asciz 	"mpi_fs_buf_loop_add"					
__kstrtabns_mpi_fs_buf_loop_add:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	mpi_fs_buf_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_reset, %function
mpi_fs_buf_reset:
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
	movs	r3, #0
	str	r3, [r0]
	str	r3, [r0, #12]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	mpi_fs_buf_reset, .-mpi_fs_buf_reset
	.align	1
	.global	mpi_sysfs_hotplug_event
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_sysfs_hotplug_event, %function
mpi_sysfs_hotplug_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r3, #88
	ldr	r2, .L3
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L3+4
	bl	vlog
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	mpi_sysfs_hotplug_event, .-mpi_sysfs_hotplug_event
	.align	1
	.global	mpi_fs_buf_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_init, %function
mpi_fs_buf_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r1
	mov	r4, r0
	cbnz	r0, .L6
.L8:
	mov	r0, #-1
.L5:
	pop	{r3, r4, r5, pc}
.L6:
	cmp	r1, #0
	beq	.L8
	cmp	r1, #10240
	bgt	.L9
	ldr	r3, .L17
	str	r3, [r0, #16]
.L10:
	movs	r0, #0
	str	r5, [r4, #8]
	str	r0, [r4]
	str	r0, [r4, #12]
	b	.L5
.L9:
	movs	r1, #0
	mov	r0, r5
	bl	rkos_kmalloc
	str	r0, [r4, #16]
	cmp	r0, #0
	bne	.L10
	b	.L8
.L18:
	.align	2
.L17:
	.word	cat_buf
	.fnend
	.size	mpi_fs_buf_init, .-mpi_fs_buf_init
	.align	1
	.global	mpi_fs_buf_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_deinit, %function
mpi_fs_buf_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L19
	ldr	r0, [r0, #16]
	ldr	r3, .L24
	cmp	r0, r3
	beq	.L19
	b	kfree
.L19:
	bx	lr
.L25:
	.align	2
.L24:
	.word	cat_buf
	.fnend
	.size	mpi_fs_buf_deinit, .-mpi_fs_buf_deinit
	.align	1
	.global	mpi_fs_buf_reset_with_memset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_reset_with_memset, %function
mpi_fs_buf_reset_with_memset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #0
	ldr	r2, [r0, #8]
	ldr	r0, [r0, #16]
	bl	rkos_memset
	movs	r3, #0
	str	r3, [r4]
	str	r3, [r4, #12]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, pc}
	.fnend
	.size	mpi_fs_buf_reset_with_memset, .-mpi_fs_buf_reset_with_memset
	.align	1
	.global	mpi_fs_buf_read
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_read, %function
mpi_fs_buf_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r0, r1
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, [r5, #12]
	cbnz	r4, .L28
.L32:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r4, #-1
.L27:
	mov	r0, r4
	pop	{r4, r5, r6, pc}
.L28:
	ldr	r1, [r5]
	cmp	r4, r1
	ble	.L30
	subs	r4, r4, r1
	ldr	r3, [r5, #16]
	cmp	r4, r2
	add	r1, r1, r3
	it	ge
	movge	r4, r2
	mov	r2, r4
	bl	rkos_copy_to_user
	cmp	r0, #0
	bne	.L32
	ldr	r3, [r5]
	add	r3, r3, r4
	str	r3, [r5]
.L33:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L27
.L30:
	movs	r4, #0
	str	r4, [r5]
	b	.L33
	.fnend
	.size	mpi_fs_buf_read, .-mpi_fs_buf_read
	.align	1
	.global	mpi_fs_buf_loop_add
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_loop_add, %function
mpi_fs_buf_loop_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r4, r0
	mov	r3, r2
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r6, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, [r0, #8]
	ldr	r2, [r0, #4]
	subs	r5, r5, #1
	cmp	r2, r5
	itt	ge
	movge	r2, #0
	strge	r2, [r0, #4]
	ldr	r0, [r0, #4]
	mov	r2, r1
	ldr	r7, [r4, #16]
	subs	r1, r5, r0
	add	r0, r0, r7
	bl	vsnprintf
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	add	r3, r3, r0
	subs	r0, r2, #1
	cmp	r0, r3
	it	ge
	movge	r0, r3
	ldr	r3, [r4, #12]
	str	r0, [r4, #4]
	cmp	r3, r0
	it	lt
	strlt	r0, [r4, #12]
	ldrd	r3, r2, [r4, #12]
	movs	r0, #0
	strb	r0, [r2, r3]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r6	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	pop	{r3, r4, r5, r6, r7, pc}
	.fnend
	.size	mpi_fs_buf_loop_add, .-mpi_fs_buf_loop_add
	.align	1
	.global	mpi_sysfs_dev_add
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_sysfs_dev_add, %function
mpi_sysfs_dev_add:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r3, [r0, #132]
	mov	r6, r1
	mov	r5, r2
	cbnz	r3, .L39
	ldr	r0, [r0, #80]
	bl	rkos_createdev
	str	r0, [r4, #132]
	str	r6, [r0, #56]
	ldr	r3, [r4, #132]
	ldr	r2, [r4]
	str	r2, [r3, #52]
	ldr	r3, [r4, #132]
	str	r5, [r3, #60]
	ldr	r0, [r4, #132]
	pop	{r4, r5, r6, lr}
	b	rkos_registerdevice
.L39:
	movs	r0, #0
	pop	{r4, r5, r6, pc}
	.fnend
	.size	mpi_sysfs_dev_add, .-mpi_sysfs_dev_add
	.align	1
	.global	mpi_sysfs_dev_remove
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_sysfs_dev_remove, %function
mpi_sysfs_dev_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0, #132]
	cbz	r3, .L40
	ldr	r3, [r0, #80]
	movs	r1, #5
	ldr	r2, .L45
	movs	r0, #0
	str	r3, [sp, #4]
	movs	r3, #57
	str	r3, [sp]
	ldr	r3, .L45+4
	bl	vlog
	ldr	r0, [r4, #132]
	bl	rkos_deregisterdevice
	ldr	r0, [r4, #132]
	bl	rkos_destroydev
	movs	r3, #0
	str	r3, [r4, #132]
.L40:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L46:
	.align	2
.L45:
	.word	.LC1
	.word	.LANCHOR0+24
	.fnend
	.size	mpi_sysfs_dev_remove, .-mpi_sysfs_dev_remove
	.align	1
	.global	mpi_sysfs_lease_event
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_sysfs_lease_event, %function
mpi_sysfs_lease_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r3, #70
	ldr	r2, .L48
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L48+4
	bl	vlog
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L49:
	.align	2
.L48:
	.word	.LC2
	.word	.LANCHOR0+45
	.fnend
	.size	mpi_sysfs_lease_event, .-mpi_sysfs_lease_event
	.align	1
	.global	mpi_fs_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_init, %function
mpi_fs_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L51
	bl	rkos_mutex_init
	bl	rkos_device_init
	movs	r0, #0
	pop	{r3, pc}
.L52:
	.align	2
.L51:
	.word	.LANCHOR1
	.fnend
	.size	mpi_fs_init, .-mpi_fs_init
	.align	1
	.global	mpi_fs_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_exit, %function
mpi_fs_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	rkos_device_deinit
	ldr	r0, .L54
	pop	{r3, lr}
	b	rkos_mutex_destory
.L55:
	.align	2
.L54:
	.word	.LANCHOR1
	.fnend
	.size	mpi_fs_exit, .-mpi_fs_exit
	.align	1
	.global	mpi_fs_buf_add
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_fs_buf_add, %function
mpi_fs_buf_add:
	.fnstart
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	.save {r1, r2, r3}
	push	{r0, r1, r2, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #12
	add	r3, sp, #28
	mov	r4, r0
	ldr	r2, [r3], #4
	str	r3, [sp, #4]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r5, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldrd	r1, r0, [r0, #8]
	subs	r1, r1, #1
	cmp	r0, r1
	blt	.L57
	ldr	r0, .L59
	bl	rkos_printk
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, #-1
.L56:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, lr}
	add	sp, sp, #12
	bx	lr
.L57:
	ldr	r6, [r4, #16]
	subs	r1, r1, r0
	ldr	r3, [sp, #4]
	add	r0, r0, r6
	bl	vsnprintf
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #16]
	add	r3, r3, r0
	movs	r0, #0
	str	r3, [r4, #12]
	strb	r0, [r2, r3]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r5	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L56
.L60:
	.align	2
.L59:
	.word	.LC3
	.fnend
	.size	mpi_fs_buf_add, .-mpi_fs_buf_add
	.global	cat_buf
	.global	mpi_global_mutex
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.36080, %object
	.size	__func__.36080, 24
__func__.36080:
	.ascii	"mpi_sysfs_hotplug_event\000"
	.type	__func__.36067, %object
	.size	__func__.36067, 21
__func__.36067:
	.ascii	"mpi_sysfs_dev_remove\000"
	.type	__func__.36076, %object
	.size	__func__.36076, 22
__func__.36076:
	.ascii	"mpi_sysfs_lease_event\000"
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpi_global_mutex, %object
	.size	mpi_global_mutex, 4
mpi_global_mutex:
	.space	4
	.type	cat_buf, %object
	.size	cat_buf, 10240
cat_buf:
	.space	10240
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"generating hotplug event\000"
.LC1:
	.ascii	"removing \"%s\" from sysfs\000"
.LC2:
	.ascii	"generating lease event\000"
.LC3:
	.ascii	"memory too small\000"
	.section	___ksymtab_gpl+mpi_fs_buf_deinit,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_deinit, %object
	.size	__ksymtab_mpi_fs_buf_deinit, 12
__ksymtab_mpi_fs_buf_deinit:
	.word	mpi_fs_buf_deinit
	.word	__kstrtab_mpi_fs_buf_deinit
	.word	__kstrtabns_mpi_fs_buf_deinit
	.section	___ksymtab_gpl+mpi_fs_buf_init,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_init, %object
	.size	__ksymtab_mpi_fs_buf_init, 12
__ksymtab_mpi_fs_buf_init:
	.word	mpi_fs_buf_init
	.word	__kstrtab_mpi_fs_buf_init
	.word	__kstrtabns_mpi_fs_buf_init
	.section	___ksymtab_gpl+mpi_fs_buf_loop_add,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_loop_add, %object
	.size	__ksymtab_mpi_fs_buf_loop_add, 12
__ksymtab_mpi_fs_buf_loop_add:
	.word	mpi_fs_buf_loop_add
	.word	__kstrtab_mpi_fs_buf_loop_add
	.word	__kstrtabns_mpi_fs_buf_loop_add
	.section	___ksymtab_gpl+mpi_fs_buf_read,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_read, %object
	.size	__ksymtab_mpi_fs_buf_read, 12
__ksymtab_mpi_fs_buf_read:
	.word	mpi_fs_buf_read
	.word	__kstrtab_mpi_fs_buf_read
	.word	__kstrtabns_mpi_fs_buf_read
	.section	___ksymtab_gpl+mpi_fs_buf_reset,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_reset, %object
	.size	__ksymtab_mpi_fs_buf_reset, 12
__ksymtab_mpi_fs_buf_reset:
	.word	mpi_fs_buf_reset
	.word	__kstrtab_mpi_fs_buf_reset
	.word	__kstrtabns_mpi_fs_buf_reset
	.section	___ksymtab_gpl+mpi_fs_buf_reset_with_memset,"a"
	.align	2
	.type	__ksymtab_mpi_fs_buf_reset_with_memset, %object
	.size	__ksymtab_mpi_fs_buf_reset_with_memset, 12
__ksymtab_mpi_fs_buf_reset_with_memset:
	.word	mpi_fs_buf_reset_with_memset
	.word	__kstrtab_mpi_fs_buf_reset_with_memset
	.word	__kstrtabns_mpi_fs_buf_reset_with_memset
	.section	___ksymtab_gpl+mpi_sysfs_dev_add,"a"
	.align	2
	.type	__ksymtab_mpi_sysfs_dev_add, %object
	.size	__ksymtab_mpi_sysfs_dev_add, 12
__ksymtab_mpi_sysfs_dev_add:
	.word	mpi_sysfs_dev_add
	.word	__kstrtab_mpi_sysfs_dev_add
	.word	__kstrtabns_mpi_sysfs_dev_add
	.section	___ksymtab_gpl+mpi_sysfs_dev_remove,"a"
	.align	2
	.type	__ksymtab_mpi_sysfs_dev_remove, %object
	.size	__ksymtab_mpi_sysfs_dev_remove, 12
__ksymtab_mpi_sysfs_dev_remove:
	.word	mpi_sysfs_dev_remove
	.word	__kstrtab_mpi_sysfs_dev_remove
	.word	__kstrtabns_mpi_sysfs_dev_remove
	.section	___ksymtab_gpl+mpi_sysfs_hotplug_event,"a"
	.align	2
	.type	__ksymtab_mpi_sysfs_hotplug_event, %object
	.size	__ksymtab_mpi_sysfs_hotplug_event, 12
__ksymtab_mpi_sysfs_hotplug_event:
	.word	mpi_sysfs_hotplug_event
	.word	__kstrtab_mpi_sysfs_hotplug_event
	.word	__kstrtabns_mpi_sysfs_hotplug_event
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
