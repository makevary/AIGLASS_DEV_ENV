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
	.file	"osal_wait.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_wait_init:					
	.asciz 	"rkos_wait_init"					
__kstrtabns_rkos_wait_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_wakeup:					
	.asciz 	"rkos_wakeup"					
__kstrtabns_rkos_wakeup:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_wakedown:					
	.asciz 	"rkos_wakedown"					
__kstrtabns_rkos_wakedown:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_wait_destory:					
	.asciz 	"rkos_wait_destory"					
__kstrtabns_rkos_wait_destory:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_wait_event:					
	.asciz 	"rkos_wait_event"					
__kstrtabns_rkos_wait_event:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_poll_wait:					
	.asciz 	"rkos_poll_wait"					
__kstrtabns_rkos_poll_wait:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_wait_event
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_wait_event, %function
rkos_wait_event:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r1, [r0, #12]
	bx	lr
	.fnend
	.size	rkos_wait_event, .-rkos_wait_event
	.align	1
	.global	rkos_poll_wait
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_poll_wait, %function
rkos_poll_wait:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r2, .L2
	ldr	r3, [r2]
	cbz	r3, .L2
	ldr	r1, [r1]
	cbz	r1, .L2
	bx	r3	@ indirect register sibling call
.L2:
	bx	lr
	.fnend
	.size	rkos_poll_wait, .-rkos_poll_wait
	.align	1
	.global	rkos_wakeup
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_wakeup, %function
rkos_wakeup:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
	movs	r1, #3
	mov	r2, r3
	ldr	r0, [r0]
	b	__wake_up
	.fnend
	.size	rkos_wakeup, .-rkos_wakeup
	.align	1
	.global	rkos_wakedown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_wakedown, %function
rkos_wakedown:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.pad #24
	sub	sp, sp, #24
	ldr	r4, [r0]
	movs	r1, #0
	add	r0, sp, #4
	bl	init_wait_entry
.L15:
	movs	r2, #2
	add	r1, sp, #4
	mov	r0, r4
	bl	prepare_to_wait_event
	bl	schedule
	b	.L15
	.fnend
	.size	rkos_wakedown, .-rkos_wakedown
	.align	1
	.global	rkos_wait_destory
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_wait_destory, %function
rkos_wait_destory:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0]
	bl	kfree
	movs	r3, #0
	str	r3, [r4]
	pop	{r4, pc}
	.fnend
	.size	rkos_wait_destory, .-rkos_wait_destory
	.align	1
	.global	rkos_wait_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_wait_init, %function
rkos_wait_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	cbnz	r0, .L18
	ldr	r1, .L22
	ldr	r0, .L22+4
.L21:
	bl	rkos_printk
	mov	r0, #-1
.L17:
	pop	{r3, r4, r5, pc}
.L18:
	ldr	r3, .L22+8
	mov	r1, #2592
	ldr	r0, [r3, #12]
	bl	kmem_cache_alloc
	mov	r5, r0
	cbnz	r0, .L20
	ldr	r1, .L22
	ldr	r0, .L22+12
	b	.L21
.L20:
	ldr	r2, .L22+16
	ldr	r1, .L22+20
	bl	__init_waitqueue_head
	str	r5, [r4]
	movs	r0, #0
	b	.L17
.L23:
	.align	2
.L22:
	.word	.LANCHOR0
	.word	.LC0
	.word	kmalloc_caches
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.fnend
	.size	rkos_wait_init, .-rkos_wait_init
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.26477, %object
	.size	__FUNCTION__.26477, 15
__FUNCTION__.26477:
	.ascii	"rkos_wait_init\000"
	.bss
	.set	.LANCHOR1,. + 0
	.type	__key.26478, %object
	.size	__key.26478, 0
__key.26478:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s - parameter invalid!\012\000"
.LC1:
	.ascii	"%s - kmalloc error!\012\000"
.LC2:
	.ascii	"wq\000"
	.section	___ksymtab+rkos_poll_wait,"a"
	.align	2
	.type	__ksymtab_rkos_poll_wait, %object
	.size	__ksymtab_rkos_poll_wait, 12
__ksymtab_rkos_poll_wait:
	.word	rkos_poll_wait
	.word	__kstrtab_rkos_poll_wait
	.word	__kstrtabns_rkos_poll_wait
	.section	___ksymtab+rkos_wait_destory,"a"
	.align	2
	.type	__ksymtab_rkos_wait_destory, %object
	.size	__ksymtab_rkos_wait_destory, 12
__ksymtab_rkos_wait_destory:
	.word	rkos_wait_destory
	.word	__kstrtab_rkos_wait_destory
	.word	__kstrtabns_rkos_wait_destory
	.section	___ksymtab+rkos_wait_event,"a"
	.align	2
	.type	__ksymtab_rkos_wait_event, %object
	.size	__ksymtab_rkos_wait_event, 12
__ksymtab_rkos_wait_event:
	.word	rkos_wait_event
	.word	__kstrtab_rkos_wait_event
	.word	__kstrtabns_rkos_wait_event
	.section	___ksymtab+rkos_wait_init,"a"
	.align	2
	.type	__ksymtab_rkos_wait_init, %object
	.size	__ksymtab_rkos_wait_init, 12
__ksymtab_rkos_wait_init:
	.word	rkos_wait_init
	.word	__kstrtab_rkos_wait_init
	.word	__kstrtabns_rkos_wait_init
	.section	___ksymtab+rkos_wakedown,"a"
	.align	2
	.type	__ksymtab_rkos_wakedown, %object
	.size	__ksymtab_rkos_wakedown, 12
__ksymtab_rkos_wakedown:
	.word	rkos_wakedown
	.word	__kstrtab_rkos_wakedown
	.word	__kstrtabns_rkos_wakedown
	.section	___ksymtab+rkos_wakeup,"a"
	.align	2
	.type	__ksymtab_rkos_wakeup, %object
	.size	__ksymtab_rkos_wakeup, 12
__ksymtab_rkos_wakeup:
	.word	rkos_wakeup
	.word	__kstrtab_rkos_wakeup
	.word	__kstrtabns_rkos_wakeup
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
