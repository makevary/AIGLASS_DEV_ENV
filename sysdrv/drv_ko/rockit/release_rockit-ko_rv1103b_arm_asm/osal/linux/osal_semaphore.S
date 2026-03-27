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
	.file	"osal_semaphore.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_sema_init:					
	.asciz 	"rkos_sema_init"					
__kstrtabns_rkos_sema_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_down:					
	.asciz 	"rkos_down"					
__kstrtabns_rkos_down:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_down_interruptible:					
	.asciz 	"rkos_down_interruptible"					
__kstrtabns_rkos_down_interruptible:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_down_trylock:					
	.asciz 	"rkos_down_trylock"					
__kstrtabns_rkos_down_trylock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_up:					
	.asciz 	"rkos_up"					
__kstrtabns_rkos_up:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_sema_destory:					
	.asciz 	"rkos_sema_destory"					
__kstrtabns_rkos_sema_destory:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_up
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_up, %function
rkos_up:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0]
	b	up
	.fnend
	.size	rkos_up, .-rkos_up
	.align	1
	.global	rkos_sema_destory
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_sema_destory, %function
rkos_sema_destory:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r0
	ldr	r0, [r0]
	cbz	r0, .L2
	bl	kfree
	movs	r3, #0
	str	r3, [r4]
.L2:
	pop	{r4, pc}
	.fnend
	.size	rkos_sema_destory, .-rkos_sema_destory
	.align	1
	.global	rkos_sema_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_sema_init, %function
rkos_sema_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r1
	mov	r4, r0
	cbnz	r0, .L8
	ldr	r1, .L12
	ldr	r0, .L12+4
.L11:
	bl	rkos_printk
	mov	r0, #-1
.L7:
	pop	{r3, r4, r5, pc}
.L8:
	ldr	r3, .L12+8
	mov	r1, #3264
	ldr	r0, [r3, #16]
	bl	kmem_cache_alloc
	cbnz	r0, .L10
	ldr	r1, .L12
	ldr	r0, .L12+12
	b	.L11
.L10:
	mov	r3, r0
	str	r0, [r4]
	str	r5, [r3], #4
	strd	r3, r3, [r0, #4]
	movs	r0, #0
	b	.L7
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LC0
	.word	kmalloc_caches
	.word	.LC1
	.fnend
	.size	rkos_sema_init, .-rkos_sema_init
	.align	1
	.global	rkos_down
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_down, %function
rkos_down:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbnz	r0, .L15
	ldr	r1, .L17
	ldr	r0, .L17+4
	bl	rkos_printk
	mov	r0, #-1
.L14:
	pop	{r3, pc}
.L15:
	ldr	r0, [r0]
	bl	down
	movs	r0, #0
	b	.L14
.L18:
	.align	2
.L17:
	.word	.LANCHOR0+15
	.word	.LC0
	.fnend
	.size	rkos_down, .-rkos_down
	.align	1
	.global	rkos_down_interruptible
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_down_interruptible, %function
rkos_down_interruptible:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L23
	ldr	r0, [r0]
	pop	{r3, lr}
	b	down_interruptible
.L23:
	ldr	r1, .L24
	ldr	r0, .L24+4
	bl	rkos_printk
	mov	r0, #-1
	pop	{r3, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR0+25
	.word	.LC0
	.fnend
	.size	rkos_down_interruptible, .-rkos_down_interruptible
	.align	1
	.global	rkos_down_trylock
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_down_trylock, %function
rkos_down_trylock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L30
	ldr	r0, [r0]
	pop	{r3, lr}
	b	down_trylock
.L30:
	ldr	r1, .L31
	ldr	r0, .L31+4
	bl	rkos_printk
	mov	r0, #-1
	pop	{r3, pc}
.L32:
	.align	2
.L31:
	.word	.LANCHOR0+49
	.word	.LC0
	.fnend
	.size	rkos_down_trylock, .-rkos_down_trylock
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.18345, %object
	.size	__FUNCTION__.18345, 15
__FUNCTION__.18345:
	.ascii	"rkos_sema_init\000"
	.type	__FUNCTION__.18356, %object
	.size	__FUNCTION__.18356, 10
__FUNCTION__.18356:
	.ascii	"rkos_down\000"
	.type	__FUNCTION__.18366, %object
	.size	__FUNCTION__.18366, 24
__FUNCTION__.18366:
	.ascii	"rkos_down_interruptible\000"
	.type	__FUNCTION__.18376, %object
	.size	__FUNCTION__.18376, 18
__FUNCTION__.18376:
	.ascii	"rkos_down_trylock\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s - parameter invalid!\012\000"
.LC1:
	.ascii	"%s - kmalloc error!\012\000"
	.section	___ksymtab+rkos_down,"a"
	.align	2
	.type	__ksymtab_rkos_down, %object
	.size	__ksymtab_rkos_down, 12
__ksymtab_rkos_down:
	.word	rkos_down
	.word	__kstrtab_rkos_down
	.word	__kstrtabns_rkos_down
	.section	___ksymtab+rkos_down_interruptible,"a"
	.align	2
	.type	__ksymtab_rkos_down_interruptible, %object
	.size	__ksymtab_rkos_down_interruptible, 12
__ksymtab_rkos_down_interruptible:
	.word	rkos_down_interruptible
	.word	__kstrtab_rkos_down_interruptible
	.word	__kstrtabns_rkos_down_interruptible
	.section	___ksymtab+rkos_down_trylock,"a"
	.align	2
	.type	__ksymtab_rkos_down_trylock, %object
	.size	__ksymtab_rkos_down_trylock, 12
__ksymtab_rkos_down_trylock:
	.word	rkos_down_trylock
	.word	__kstrtab_rkos_down_trylock
	.word	__kstrtabns_rkos_down_trylock
	.section	___ksymtab+rkos_sema_destory,"a"
	.align	2
	.type	__ksymtab_rkos_sema_destory, %object
	.size	__ksymtab_rkos_sema_destory, 12
__ksymtab_rkos_sema_destory:
	.word	rkos_sema_destory
	.word	__kstrtab_rkos_sema_destory
	.word	__kstrtabns_rkos_sema_destory
	.section	___ksymtab+rkos_sema_init,"a"
	.align	2
	.type	__ksymtab_rkos_sema_init, %object
	.size	__ksymtab_rkos_sema_init, 12
__ksymtab_rkos_sema_init:
	.word	rkos_sema_init
	.word	__kstrtab_rkos_sema_init
	.word	__kstrtabns_rkos_sema_init
	.section	___ksymtab+rkos_up,"a"
	.align	2
	.type	__ksymtab_rkos_up, %object
	.size	__ksymtab_rkos_up, 12
__ksymtab_rkos_up:
	.word	rkos_up
	.word	__kstrtab_rkos_up
	.word	__kstrtabns_rkos_up
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
