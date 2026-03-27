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
	.file	"osal_platform.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_device_add_driver:					
	.asciz 	"rkos_device_add_driver"					
__kstrtabns_rkos_device_add_driver:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_device_add_driver
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_device_add_driver, %function
rkos_device_add_driver:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	rkos_device_add_driver, .-rkos_device_add_driver
	.section	___ksymtab+rkos_device_add_driver,"a"
	.align	2
	.type	__ksymtab_rkos_device_add_driver, %object
	.size	__ksymtab_rkos_device_add_driver, 12
__ksymtab_rkos_device_add_driver:
	.word	rkos_device_add_driver
	.word	__kstrtab_rkos_device_add_driver
	.word	__kstrtabns_rkos_device_add_driver
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
