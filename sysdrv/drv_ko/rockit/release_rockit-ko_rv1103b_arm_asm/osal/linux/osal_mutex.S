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
	.file	"osal_mutex.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_init:					
	.asciz 	"rkos_mutex_init"					
__kstrtabns_rkos_mutex_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_lock:					
	.asciz 	"rkos_mutex_lock"					
__kstrtabns_rkos_mutex_lock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_lock_interruptible:					
	.asciz 	"rkos_mutex_lock_interruptible"					
__kstrtabns_rkos_mutex_lock_interruptible:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_trylock:					
	.asciz 	"rkos_mutex_trylock"					
__kstrtabns_rkos_mutex_trylock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_unlock:					
	.asciz 	"rkos_mutex_unlock"					
__kstrtabns_rkos_mutex_unlock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mutex_destory:					
	.asciz 	"rkos_mutex_destory"					
__kstrtabns_rkos_mutex_destory:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_mutex_unlock
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_unlock, %function
rkos_mutex_unlock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, [r0]
	b	mutex_unlock
	.fnend
	.size	rkos_mutex_unlock, .-rkos_mutex_unlock
	.align	1
	.global	rkos_mutex_destory
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_destory, %function
rkos_mutex_destory:
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
	.size	rkos_mutex_destory, .-rkos_mutex_destory
	.align	1
	.global	rkos_mutex_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_init, %function
rkos_mutex_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
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
	mov	r5, r0
	cbnz	r0, .L10
	ldr	r1, .L12
	ldr	r0, .L12+12
	b	.L11
.L10:
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	bl	__mutex_init
	str	r5, [r4]
	movs	r0, #0
	b	.L7
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LC0
	.word	kmalloc_caches
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.fnend
	.size	rkos_mutex_init, .-rkos_mutex_init
	.align	1
	.global	rkos_mutex_lock
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_lock, %function
rkos_mutex_lock:
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
	bl	mutex_lock
	movs	r0, #0
	b	.L14
.L18:
	.align	2
.L17:
	.word	.LANCHOR0+16
	.word	.LC0
	.fnend
	.size	rkos_mutex_lock, .-rkos_mutex_lock
	.align	1
	.global	rkos_mutex_lock_interruptible
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_lock_interruptible, %function
rkos_mutex_lock_interruptible:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L23
	ldr	r0, [r0]
	pop	{r3, lr}
	b	mutex_lock_interruptible
.L23:
	ldr	r1, .L24
	ldr	r0, .L24+4
	bl	rkos_printk
	mov	r0, #-1
	pop	{r3, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR0+32
	.word	.LC0
	.fnend
	.size	rkos_mutex_lock_interruptible, .-rkos_mutex_lock_interruptible
	.align	1
	.global	rkos_mutex_trylock
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mutex_trylock, %function
rkos_mutex_trylock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L30
	ldr	r0, [r0]
	pop	{r3, lr}
	b	mutex_trylock
.L30:
	ldr	r1, .L31
	ldr	r0, .L31+4
	bl	rkos_printk
	mov	r0, #-1
	pop	{r3, pc}
.L32:
	.align	2
.L31:
	.word	.LANCHOR0+62
	.word	.LC0
	.fnend
	.size	rkos_mutex_trylock, .-rkos_mutex_trylock
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.18320, %object
	.size	__FUNCTION__.18320, 16
__FUNCTION__.18320:
	.ascii	"rkos_mutex_init\000"
	.type	__FUNCTION__.18331, %object
	.size	__FUNCTION__.18331, 16
__FUNCTION__.18331:
	.ascii	"rkos_mutex_lock\000"
	.type	__FUNCTION__.18341, %object
	.size	__FUNCTION__.18341, 30
__FUNCTION__.18341:
	.ascii	"rkos_mutex_lock_interruptible\000"
	.type	__FUNCTION__.18351, %object
	.size	__FUNCTION__.18351, 19
__FUNCTION__.18351:
	.ascii	"rkos_mutex_trylock\000"
	.bss
	.set	.LANCHOR1,. + 0
	.type	__key.18321, %object
	.size	__key.18321, 0
__key.18321:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s - parameter invalid!\012\000"
.LC1:
	.ascii	"%s - kmalloc error!\012\000"
.LC2:
	.ascii	"p\000"
	.section	___ksymtab+rkos_mutex_destory,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_destory, %object
	.size	__ksymtab_rkos_mutex_destory, 12
__ksymtab_rkos_mutex_destory:
	.word	rkos_mutex_destory
	.word	__kstrtab_rkos_mutex_destory
	.word	__kstrtabns_rkos_mutex_destory
	.section	___ksymtab+rkos_mutex_init,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_init, %object
	.size	__ksymtab_rkos_mutex_init, 12
__ksymtab_rkos_mutex_init:
	.word	rkos_mutex_init
	.word	__kstrtab_rkos_mutex_init
	.word	__kstrtabns_rkos_mutex_init
	.section	___ksymtab+rkos_mutex_lock,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_lock, %object
	.size	__ksymtab_rkos_mutex_lock, 12
__ksymtab_rkos_mutex_lock:
	.word	rkos_mutex_lock
	.word	__kstrtab_rkos_mutex_lock
	.word	__kstrtabns_rkos_mutex_lock
	.section	___ksymtab+rkos_mutex_lock_interruptible,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_lock_interruptible, %object
	.size	__ksymtab_rkos_mutex_lock_interruptible, 12
__ksymtab_rkos_mutex_lock_interruptible:
	.word	rkos_mutex_lock_interruptible
	.word	__kstrtab_rkos_mutex_lock_interruptible
	.word	__kstrtabns_rkos_mutex_lock_interruptible
	.section	___ksymtab+rkos_mutex_trylock,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_trylock, %object
	.size	__ksymtab_rkos_mutex_trylock, 12
__ksymtab_rkos_mutex_trylock:
	.word	rkos_mutex_trylock
	.word	__kstrtab_rkos_mutex_trylock
	.word	__kstrtabns_rkos_mutex_trylock
	.section	___ksymtab+rkos_mutex_unlock,"a"
	.align	2
	.type	__ksymtab_rkos_mutex_unlock, %object
	.size	__ksymtab_rkos_mutex_unlock, 12
__ksymtab_rkos_mutex_unlock:
	.word	rkos_mutex_unlock
	.word	__kstrtab_rkos_mutex_unlock
	.word	__kstrtabns_rkos_mutex_unlock
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
