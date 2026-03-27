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
	.file	"osal_task.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kthread_create:					
	.asciz 	"rkos_kthread_create"					
__kstrtabns_rkos_kthread_create:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kthread_destory:					
	.asciz 	"rkos_kthread_destory"					
__kstrtabns_rkos_kthread_destory:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kthread_should_stop:					
	.asciz 	"rkos_kthread_should_stop"					
__kstrtabns_rkos_kthread_should_stop:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kthread_get_name:					
	.asciz 	"rkos_kthread_get_name"					
__kstrtabns_rkos_kthread_get_name:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kthread_set_name:					
	.asciz 	"rkos_kthread_set_name"					
__kstrtabns_rkos_kthread_set_name:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_kthread_should_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kthread_should_stop, %function
rkos_kthread_should_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rkos_kthread_should_stop, .-rkos_kthread_should_stop
	.align	1
	.global	rkos_kthread_set_name
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kthread_set_name, %function
rkos_kthread_set_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	rkos_kthread_set_name, .-rkos_kthread_set_name
	.align	1
	.global	rkos_kthread_get_name
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kthread_get_name, %function
rkos_kthread_get_name:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r3, sp
	bic	r2, r3, #8160
	mov	r4, r1
	bic	r2, r2, #31
	ldr	r1, [r2, #12]
	subs	r2, r4, #1
	add	r1, r1, #732
	bl	memcpy
	mov	r3, r0
	add	r3, r3, r4
	movs	r0, #0
	strb	r0, [r3, #-1]
	pop	{r4, pc}
	.fnend
	.size	rkos_kthread_get_name, .-rkos_kthread_get_name
	.align	1
	.global	rkos_kthread_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kthread_create, %function
rkos_kthread_create:
	.fnstart
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r5, r0
	ldr	r3, .L8
	mov	r6, r1
	mov	r1, #3264
	mov	r7, r2
	ldr	r0, [r3, #16]
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L5
	ldr	r1, .L8+4
	ldr	r0, .L8+8
	bl	rkos_printk
.L4:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L5:
	mov	r0, r5
	mov	r3, r7
	mov	r2, #-1
	mov	r1, r6
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L7
	bl	wake_up_process
	str	r5, [r4]
	b	.L4
.L7:
	ldr	r1, .L8+4
	ldr	r0, .L8+12
	bl	rkos_printk
	mov	r0, r4
	bl	kfree
	movs	r4, #0
	b	.L4
.L9:
	.align	2
.L8:
	.word	kmalloc_caches
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.fnend
	.size	rkos_kthread_create, .-rkos_kthread_create
	.align	1
	.global	rkos_kthread_destory
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kthread_destory, %function
rkos_kthread_destory:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	cbnz	r0, .L11
	ldr	r1, .L16
	ldr	r0, .L16+4
	pop	{r4, lr}
	b	rkos_printk
.L11:
	cbz	r1, .L12
	ldr	r0, [r0]
	bl	kthread_stop
.L12:
	movs	r3, #0
	mov	r0, r4
	str	r3, [r4]
	pop	{r4, lr}
	b	kfree
.L17:
	.align	2
.L16:
	.word	.LANCHOR0+20
	.word	.LC2
	.fnend
	.size	rkos_kthread_destory, .-rkos_kthread_destory
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.20510, %object
	.size	__FUNCTION__.20510, 20
__FUNCTION__.20510:
	.ascii	"rkos_kthread_create\000"
	.type	__FUNCTION__.20526, %object
	.size	__FUNCTION__.20526, 21
__FUNCTION__.20526:
	.ascii	"rkos_kthread_destory\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s - kmalloc error!\012\000"
.LC1:
	.ascii	"%s - kthread create error!\012\000"
.LC2:
	.ascii	"%s - parameter invalid!\012\000"
	.section	___ksymtab+rkos_kthread_create,"a"
	.align	2
	.type	__ksymtab_rkos_kthread_create, %object
	.size	__ksymtab_rkos_kthread_create, 12
__ksymtab_rkos_kthread_create:
	.word	rkos_kthread_create
	.word	__kstrtab_rkos_kthread_create
	.word	__kstrtabns_rkos_kthread_create
	.section	___ksymtab+rkos_kthread_destory,"a"
	.align	2
	.type	__ksymtab_rkos_kthread_destory, %object
	.size	__ksymtab_rkos_kthread_destory, 12
__ksymtab_rkos_kthread_destory:
	.word	rkos_kthread_destory
	.word	__kstrtab_rkos_kthread_destory
	.word	__kstrtabns_rkos_kthread_destory
	.section	___ksymtab+rkos_kthread_get_name,"a"
	.align	2
	.type	__ksymtab_rkos_kthread_get_name, %object
	.size	__ksymtab_rkos_kthread_get_name, 12
__ksymtab_rkos_kthread_get_name:
	.word	rkos_kthread_get_name
	.word	__kstrtab_rkos_kthread_get_name
	.word	__kstrtabns_rkos_kthread_get_name
	.section	___ksymtab+rkos_kthread_set_name,"a"
	.align	2
	.type	__ksymtab_rkos_kthread_set_name, %object
	.size	__ksymtab_rkos_kthread_set_name, 12
__ksymtab_rkos_kthread_set_name:
	.word	rkos_kthread_set_name
	.word	__kstrtab_rkos_kthread_set_name
	.word	__kstrtabns_rkos_kthread_set_name
	.section	___ksymtab+rkos_kthread_should_stop,"a"
	.align	2
	.type	__ksymtab_rkos_kthread_should_stop, %object
	.size	__ksymtab_rkos_kthread_should_stop, 12
__ksymtab_rkos_kthread_should_stop:
	.word	rkos_kthread_should_stop
	.word	__kstrtab_rkos_kthread_should_stop
	.word	__kstrtabns_rkos_kthread_should_stop
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
