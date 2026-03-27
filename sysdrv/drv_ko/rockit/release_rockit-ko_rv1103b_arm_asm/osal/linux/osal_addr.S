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
	.file	"osal_addr.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_ioremap:					
	.asciz 	"rkos_ioremap"					
__kstrtabns_rkos_ioremap:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_ioremap_nocache:					
	.asciz 	"rkos_ioremap_nocache"					
__kstrtabns_rkos_ioremap_nocache:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_ioremap_cached:					
	.asciz 	"rkos_ioremap_cached"					
__kstrtabns_rkos_ioremap_cached:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_iounmap:					
	.asciz 	"rkos_iounmap"					
__kstrtabns_rkos_iounmap:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_ioaddress:					
	.asciz 	"rkos_ioaddress"					
__kstrtabns_rkos_ioaddress:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_copy_from_user:					
	.asciz 	"rkos_copy_from_user"					
__kstrtabns_rkos_copy_from_user:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_copy_to_user:					
	.asciz 	"rkos_copy_to_user"					
__kstrtabns_rkos_copy_to_user:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_access_ok:					
	.asciz 	"rkos_access_ok"					
__kstrtabns_rkos_access_ok:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_access_ok
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_access_ok, %function
rkos_access_ok:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r0, [r3, #8]
	.syntax unified
@ 80 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/drivers/rockit-ko/osal/linux/osal_addr.c" 1
	.syntax unified
adds r3, r1, r2; sbcscc r3, r3, r0; movcc r0, #0
@ 0 "" 2
	.thumb
	.syntax unified
	clz	r0, r0
	lsrs	r0, r0, #5
	bx	lr
	.fnend
	.size	rkos_access_ok, .-rkos_access_ok
	.align	1
	.global	rkos_ioremap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_ioremap, %function
rkos_ioremap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	ioremap
	.fnend
	.size	rkos_ioremap, .-rkos_ioremap
	.align	1
	.global	rkos_ioremap_nocache
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_ioremap_nocache, %function
rkos_ioremap_nocache:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	ioremap_wc
	.fnend
	.size	rkos_ioremap_nocache, .-rkos_ioremap_nocache
	.align	1
	.global	rkos_ioremap_cached
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_ioremap_cached, %function
rkos_ioremap_cached:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	ioremap_cache
	.fnend
	.size	rkos_ioremap_cached, .-rkos_ioremap_cached
	.align	1
	.global	rkos_iounmap
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_iounmap, %function
rkos_iounmap:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	iounmap
	.fnend
	.size	rkos_iounmap, .-rkos_iounmap
	.align	1
	.global	rkos_ioaddress
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_ioaddress, %function
rkos_ioaddress:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, lr
	ldr	r0, .L7
	bl	sprint_symbol
	ldr	r0, .L7+4
	bl	panic
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	rkos_ioaddress, .-rkos_ioaddress
	.align	1
	.global	rkos_copy_from_user
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_copy_from_user, %function
rkos_copy_from_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	subs	r4, r2, #0
	mov	r6, r0
	blt	.L12
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #8]
	.syntax unified
@ 157 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r7, r1, r4; sbcscc r7, r7, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L13
	bl	arm_copy_from_user
	mov	r5, r0
.L11:
	cbz	r5, .L9
	subs	r0, r4, r5
	mov	r2, r5
	movs	r1, #0
	add	r0, r0, r6
	bl	memset
.L9:
	mov	r0, r5
	pop	{r3, r4, r5, r6, r7, pc}
.L13:
	mov	r5, r4
	b	.L11
.L12:
	mov	r5, r4
	b	.L9
	.fnend
	.size	rkos_copy_from_user, .-rkos_copy_from_user
	.align	1
	.global	rkos_copy_to_user
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_copy_to_user, %function
rkos_copy_to_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6}
	.save {r4, r5, r6}
	subs	r4, r2, #0
	blt	.L18
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #8]
	.syntax unified
@ 177 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r6, r0, r4; sbcscc r6, r6, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L18
	pop	{r4, r5, r6}
	b	arm_copy_to_user
.L18:
	mov	r0, r4
	pop	{r4, r5, r6}
	bx	lr
	.fnend
	.size	rkos_copy_to_user, .-rkos_copy_to_user
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"+++++++++++++++++++ caller: %s\012\000"
.LC1:
	.ascii	"\012ASSERT: linux kernel not support IO_ADDRESS now"
	.ascii	".\012\000"
	.section	___ksymtab+rkos_access_ok,"a"
	.align	2
	.type	__ksymtab_rkos_access_ok, %object
	.size	__ksymtab_rkos_access_ok, 12
__ksymtab_rkos_access_ok:
	.word	rkos_access_ok
	.word	__kstrtab_rkos_access_ok
	.word	__kstrtabns_rkos_access_ok
	.section	___ksymtab+rkos_copy_from_user,"a"
	.align	2
	.type	__ksymtab_rkos_copy_from_user, %object
	.size	__ksymtab_rkos_copy_from_user, 12
__ksymtab_rkos_copy_from_user:
	.word	rkos_copy_from_user
	.word	__kstrtab_rkos_copy_from_user
	.word	__kstrtabns_rkos_copy_from_user
	.section	___ksymtab+rkos_copy_to_user,"a"
	.align	2
	.type	__ksymtab_rkos_copy_to_user, %object
	.size	__ksymtab_rkos_copy_to_user, 12
__ksymtab_rkos_copy_to_user:
	.word	rkos_copy_to_user
	.word	__kstrtab_rkos_copy_to_user
	.word	__kstrtabns_rkos_copy_to_user
	.section	___ksymtab+rkos_ioaddress,"a"
	.align	2
	.type	__ksymtab_rkos_ioaddress, %object
	.size	__ksymtab_rkos_ioaddress, 12
__ksymtab_rkos_ioaddress:
	.word	rkos_ioaddress
	.word	__kstrtab_rkos_ioaddress
	.word	__kstrtabns_rkos_ioaddress
	.section	___ksymtab+rkos_ioremap,"a"
	.align	2
	.type	__ksymtab_rkos_ioremap, %object
	.size	__ksymtab_rkos_ioremap, 12
__ksymtab_rkos_ioremap:
	.word	rkos_ioremap
	.word	__kstrtab_rkos_ioremap
	.word	__kstrtabns_rkos_ioremap
	.section	___ksymtab+rkos_ioremap_cached,"a"
	.align	2
	.type	__ksymtab_rkos_ioremap_cached, %object
	.size	__ksymtab_rkos_ioremap_cached, 12
__ksymtab_rkos_ioremap_cached:
	.word	rkos_ioremap_cached
	.word	__kstrtab_rkos_ioremap_cached
	.word	__kstrtabns_rkos_ioremap_cached
	.section	___ksymtab+rkos_ioremap_nocache,"a"
	.align	2
	.type	__ksymtab_rkos_ioremap_nocache, %object
	.size	__ksymtab_rkos_ioremap_nocache, 12
__ksymtab_rkos_ioremap_nocache:
	.word	rkos_ioremap_nocache
	.word	__kstrtab_rkos_ioremap_nocache
	.word	__kstrtabns_rkos_ioremap_nocache
	.section	___ksymtab+rkos_iounmap,"a"
	.align	2
	.type	__ksymtab_rkos_iounmap, %object
	.size	__ksymtab_rkos_iounmap, 12
__ksymtab_rkos_iounmap:
	.word	rkos_iounmap
	.word	__kstrtab_rkos_iounmap
	.word	__kstrtabns_rkos_iounmap
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
