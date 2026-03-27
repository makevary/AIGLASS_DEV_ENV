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
	.file	"osal_debug.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_printk:					
	.asciz 	"rkos_printk"					
__kstrtabns_rkos_printk:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_printf:					
	.asciz 	"rkos_printf"					
__kstrtabns_rkos_printf:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_panic:					
	.asciz 	"rkos_panic"					
__kstrtabns_rkos_panic:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_printk
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_printk, %function
rkos_printk:
	.fnstart
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	.save {r0, r1, r2, r3}
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	add	r1, sp, #16
	ldr	r0, [r1], #4
	str	r1, [sp, #4]
	bl	vprintk
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	add	sp, sp, #16
	bx	lr
	.fnend
	.size	rkos_printk, .-rkos_printk
	.align	1
	.global	rkos_printf
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_printf, %function
rkos_printf:
	.fnstart
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	.save {r0, r1, r2, r3}
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	add	r1, sp, #16
	ldr	r0, [r1], #4
	str	r1, [sp, #4]
	bl	vprintk
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	add	sp, sp, #16
	bx	lr
	.fnend
	.size	rkos_printf, .-rkos_printf
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.global	rkos_panic
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_panic, %function
rkos_panic:
	.fnstart
	@ Volatile: function does not return.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	ldr	r4, [sp, #16]
	str	r4, [sp]
	bl	panic
	.fnend
	.size	rkos_panic, .-rkos_panic
	.section	___ksymtab+rkos_panic,"a"
	.align	2
	.type	__ksymtab_rkos_panic, %object
	.size	__ksymtab_rkos_panic, 12
__ksymtab_rkos_panic:
	.word	rkos_panic
	.word	__kstrtab_rkos_panic
	.word	__kstrtabns_rkos_panic
	.section	___ksymtab+rkos_printf,"a"
	.align	2
	.type	__ksymtab_rkos_printf, %object
	.size	__ksymtab_rkos_printf, 12
__ksymtab_rkos_printf:
	.word	rkos_printf
	.word	__kstrtab_rkos_printf
	.word	__kstrtabns_rkos_printf
	.section	___ksymtab+rkos_printk,"a"
	.align	2
	.type	__ksymtab_rkos_printk, %object
	.size	__ksymtab_rkos_printk, 12
__ksymtab_rkos_printk:
	.word	rkos_printk
	.word	__kstrtab_rkos_printk
	.word	__kstrtabns_rkos_printk
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
