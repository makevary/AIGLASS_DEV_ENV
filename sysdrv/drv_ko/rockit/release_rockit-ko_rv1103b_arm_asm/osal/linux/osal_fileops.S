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
	.file	"osal_fileops.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_fopen:					
	.asciz 	"rkos_fopen"					
__kstrtabns_rkos_fopen:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_fclose:					
	.asciz 	"rkos_fclose"					
__kstrtabns_rkos_fclose:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_fwrite:					
	.asciz 	"rkos_fwrite"					
__kstrtabns_rkos_fwrite:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_fread:					
	.asciz 	"rkos_fread"					
__kstrtabns_rkos_fread:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	klib_fopen
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	klib_fopen, %function
klib_fopen:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	uxth	r2, r2
	bl	filp_open
	cmn	r0, #4096
	it	hi
	movhi	r0, #0
	pop	{r3, pc}
	.fnend
	.size	klib_fopen, .-klib_fopen
	.align	1
	.global	rkos_fopen
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_fopen, %function
rkos_fopen:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #420
	movw	r1, #577
	b	klib_fopen
	.fnend
	.size	rkos_fopen, .-rkos_fopen
	.align	1
	.global	klib_fclose
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	klib_fclose, %function
klib_fclose:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L4
	movs	r1, #0
	b	filp_close
.L4:
	bx	lr
	.fnend
	.size	klib_fclose, .-klib_fclose
	.align	1
	.global	rkos_fclose
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_fclose, %function
rkos_fclose:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	klib_fclose
	.fnend
	.size	rkos_fclose, .-rkos_fclose
	.align	1
	.global	klib_fwrite
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	klib_fwrite, %function
klib_fwrite:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	.save {r4}
	mov	r4, r0
	mov	r0, r2
	cbz	r2, .L8
	add	r3, r2, #56
	mov	r2, r1
	mov	r1, r4
	pop	{r4}
	b	__kernel_write
.L8:
	mvn	r0, #1
	pop	{r4}
	bx	lr
	.fnend
	.size	klib_fwrite, .-klib_fwrite
	.align	1
	.global	rkos_fwrite
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_fwrite, %function
rkos_fwrite:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	klib_fwrite
	.fnend
	.size	rkos_fwrite, .-rkos_fwrite
	.align	1
	.global	klib_fread
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	klib_fread, %function
klib_fread:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r6, r0
	mov	r0, r2
	cbz	r2, .L12
	ldr	r4, .L13
	mov	r3, sp
	movs	r2, #0
	ands	r3, r3, r4
	ldr	r5, [r3, #8]
	str	r2, [r3, #8]
	.syntax unified
@ 73 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	dsb nsh
@ 0 "" 2
@ 74 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	isb 
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r2, r1
	add	r3, r0, #56
	mov	r1, r6
	bl	kernel_read
	mov	r3, sp
	ands	r4, r4, r3
	str	r5, [r4, #8]
	.syntax unified
@ 73 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	dsb nsh
@ 0 "" 2
@ 74 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/uaccess.h" 1
	isb 
@ 0 "" 2
	.thumb
	.syntax unified
.L10:
	pop	{r4, r5, r6, pc}
.L12:
	mvn	r0, #1
	b	.L10
.L14:
	.align	2
.L13:
	.word	-8192
	.fnend
	.size	klib_fread, .-klib_fread
	.align	1
	.global	rkos_fread
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_fread, %function
rkos_fread:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	klib_fread
	.fnend
	.size	rkos_fread, .-rkos_fread
	.section	___ksymtab+rkos_fclose,"a"
	.align	2
	.type	__ksymtab_rkos_fclose, %object
	.size	__ksymtab_rkos_fclose, 12
__ksymtab_rkos_fclose:
	.word	rkos_fclose
	.word	__kstrtab_rkos_fclose
	.word	__kstrtabns_rkos_fclose
	.section	___ksymtab+rkos_fopen,"a"
	.align	2
	.type	__ksymtab_rkos_fopen, %object
	.size	__ksymtab_rkos_fopen, 12
__ksymtab_rkos_fopen:
	.word	rkos_fopen
	.word	__kstrtab_rkos_fopen
	.word	__kstrtabns_rkos_fopen
	.section	___ksymtab+rkos_fread,"a"
	.align	2
	.type	__ksymtab_rkos_fread, %object
	.size	__ksymtab_rkos_fread, 12
__ksymtab_rkos_fread:
	.word	rkos_fread
	.word	__kstrtab_rkos_fread
	.word	__kstrtabns_rkos_fread
	.section	___ksymtab+rkos_fwrite,"a"
	.align	2
	.type	__ksymtab_rkos_fwrite, %object
	.size	__ksymtab_rkos_fwrite, 12
__ksymtab_rkos_fwrite:
	.word	rkos_fwrite
	.word	__kstrtab_rkos_fwrite
	.word	__kstrtabns_rkos_fwrite
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
