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
	.file	"osal_vmalloc.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_vmalloc:					
	.asciz 	"rkos_vmalloc"					
__kstrtabns_rkos_vmalloc:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_vfree:					
	.asciz 	"rkos_vfree"					
__kstrtabns_rkos_vfree:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kmalloc:					
	.asciz 	"rkos_kmalloc"					
__kstrtabns_rkos_kmalloc:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_kfree:					
	.asciz 	"rkos_kfree"					
__kstrtabns_rkos_kfree:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_vmalloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_vmalloc, %function
rkos_vmalloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vmalloc
	.fnend
	.size	rkos_vmalloc, .-rkos_vmalloc
	.align	1
	.global	rkos_vfree
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_vfree, %function
rkos_vfree:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vfree
	.fnend
	.size	rkos_vfree, .-rkos_vfree
	.align	1
	.global	rkos_kfree
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kfree, %function
rkos_kfree:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	kfree
	.fnend
	.size	rkos_kfree, .-rkos_kfree
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_order, %function
get_order:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r0, r0, #1
	lsrs	r0, r0, #12
	itt	ne
	clzne	r0, r0
	rsbne	r0, r0, #32
	bx	lr
	.fnend
	.size	get_order, .-get_order
	.align	1
	.global	rkos_kmalloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_kmalloc, %function
rkos_kmalloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbnz	r1, .L8
	mov	r1, #3264
.L10:
	b	__kmalloc
.L8:
	cmp	r1, #1
	bne	.L9
	mov	r1, #2592
	b	.L10
.L9:
	movs	r0, #0
	bx	lr
	.fnend
	.size	rkos_kmalloc, .-rkos_kmalloc
	.section	___ksymtab+rkos_kfree,"a"
	.align	2
	.type	__ksymtab_rkos_kfree, %object
	.size	__ksymtab_rkos_kfree, 12
__ksymtab_rkos_kfree:
	.word	rkos_kfree
	.word	__kstrtab_rkos_kfree
	.word	__kstrtabns_rkos_kfree
	.section	___ksymtab+rkos_kmalloc,"a"
	.align	2
	.type	__ksymtab_rkos_kmalloc, %object
	.size	__ksymtab_rkos_kmalloc, 12
__ksymtab_rkos_kmalloc:
	.word	rkos_kmalloc
	.word	__kstrtab_rkos_kmalloc
	.word	__kstrtabns_rkos_kmalloc
	.section	___ksymtab+rkos_vfree,"a"
	.align	2
	.type	__ksymtab_rkos_vfree, %object
	.size	__ksymtab_rkos_vfree, 12
__ksymtab_rkos_vfree:
	.word	rkos_vfree
	.word	__kstrtab_rkos_vfree
	.word	__kstrtabns_rkos_vfree
	.section	___ksymtab+rkos_vmalloc,"a"
	.align	2
	.type	__ksymtab_rkos_vmalloc, %object
	.size	__ksymtab_rkos_vmalloc, 12
__ksymtab_rkos_vmalloc:
	.word	rkos_vmalloc
	.word	__kstrtab_rkos_vmalloc
	.word	__kstrtabns_rkos_vmalloc
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
