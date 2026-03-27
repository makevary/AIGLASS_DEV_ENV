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
	.file	"osal_device.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_createdev:					
	.asciz 	"rkos_createdev"					
__kstrtabns_rkos_createdev:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_destroydev:					
	.asciz 	"rkos_destroydev"					
__kstrtabns_rkos_destroydev:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_registerdevice:					
	.asciz 	"rkos_registerdevice"					
__kstrtabns_rkos_registerdevice:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_deregisterdevice:					
	.asciz 	"rkos_deregisterdevice"					
__kstrtabns_rkos_deregisterdevice:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_devnode, %function
mpi_devnode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cbnz	r2, .L2
	ldr	r2, [r0]
.L2:
	ldr	r1, .L3
	mov	r0, #3264
	b	kasprintf
.L4:
	.align	2
.L3:
	.word	.LC0
	.fnend
	.size	mpi_devnode, .-mpi_devnode
	.align	1
	.global	rkos_registerdevice
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_registerdevice, %function
rkos_registerdevice:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	add	r6, r0, #72
	ldr	r5, .L12
	mov	r4, r0
	ldr	r1, [r0, #56]
	mov	r0, r6
	bl	cdev_init
	ldr	r3, [r4, #52]
	ldr	r1, [r5]
	movs	r2, #1
	mov	r0, r6
	orr	r1, r3, r1, lsl #20
	bl	cdev_add
	ldr	r0, [r5]
	ldr	r2, [r4, #52]
	movs	r1, #0
	ldr	r3, .L12+4
	orr	r2, r2, r0, lsl #20
	ldr	r0, .L12+8
	str	r3, [sp, #4]
	mov	r3, r4
	str	r1, [sp]
	str	r4, [sp, #8]
	ldr	r0, [r0]
	bl	device_create_with_groups
	ldr	r1, [r4, #60]
	str	r0, [r4, #48]
	cbz	r1, .L6
	bl	rkos_device_add_driver
.L6:
	ldr	r1, [r4, #48]
	cmn	r1, #4096
	bls	.L7
	mov	r2, r4
	ldr	r0, .L12+12
	bl	rkos_printk
	mov	r0, #-1
.L5:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L7:
	ldr	r0, [r5]
	b	.L5
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.word	.LC1
	.word	.LANCHOR1
	.word	.LC2
	.fnend
	.size	rkos_registerdevice, .-rkos_registerdevice
	.align	1
	.global	rkos_destroydev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_destroydev, %function
rkos_destroydev:
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
	movs	r3, #0
	str	r3, [r0]
	mov	r0, r3
	b	.L14
.L18:
	.align	2
.L17:
	.word	.LANCHOR2
	.word	.LC3
	.fnend
	.size	rkos_destroydev, .-rkos_destroydev
	.align	1
	.global	rkos_createdev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_createdev, %function
rkos_createdev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	cbnz	r0, .L24
	ldr	r1, .L27
	ldr	r0, .L27+4
.L26:
	bl	rkos_printk
	movs	r4, #0
.L19:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L24:
	ldr	r5, .L27+8
	movs	r3, #0
	movs	r2, #136
	adds	r4, r5, #4
.L20:
	mul	r6, r2, r3
	ldr	r1, [r6, r4]
	cbz	r1, .L22
	adds	r3, r3, #1
	cmp	r3, #26
	bne	.L20
	ldr	r1, .L27
	ldr	r0, .L27+12
	b	.L26
.L22:
	movs	r2, #136
	adds	r0, r4, r6
	bl	memset
	adds	r3, r6, #4
	add	r4, r4, r3
	add	r5, r5, r6
	movs	r2, #47
	mov	r1, r7
	mov	r0, r4
	bl	rkos_strncpy
	movs	r3, #1
	str	r3, [r5, #4]
	b	.L19
.L28:
	.align	2
.L27:
	.word	.LANCHOR2+16
	.word	.LC3
	.word	.LANCHOR1
	.word	.LC4
	.fnend
	.size	rkos_createdev, .-rkos_createdev
	.align	1
	.global	rkos_deregisterdevice
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_deregisterdevice, %function
rkos_deregisterdevice:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbnz	r0, .L30
	ldr	r1, .L31
	ldr	r0, .L31+4
	b	rkos_printk
.L30:
	ldr	r0, [r0, #48]
	b	device_unregister
.L32:
	.align	2
.L31:
	.word	.LANCHOR2+31
	.word	.LC3
	.fnend
	.size	rkos_deregisterdevice, .-rkos_deregisterdevice
	.align	1
	.global	rkos_device_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_device_init, %function
rkos_device_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	movs	r1, #0
	ldr	r3, .L38
	movs	r2, #50
	add	r0, sp, #4
	bl	alloc_chrdev_region
	subs	r1, r0, #0
	bge	.L34
	ldr	r0, .L38+4
	bl	rkos_printk
.L33:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
.L34:
	ldr	r3, [sp, #4]
	movs	r0, #0
	ldr	r4, .L38+8
	ldr	r5, .L38+12
	addw	r2, r4, #3540
	ldr	r1, .L38
	lsrs	r3, r3, #20
	str	r3, [r5]
	bl	__class_create
	cmn	r0, #4096
	str	r0, [r4]
	bhi	.L33
	movs	r2, #0
	adds	r1, r5, #4
	bl	class_create_file_ns
	cbz	r0, .L36
	ldr	r0, [r4]
	bl	class_destroy
	movs	r3, #0
	str	r3, [r4]
	b	.L33
.L36:
	ldr	r3, [r4]
	ldr	r2, .L38+16
	str	r2, [r3, #24]
	b	.L33
.L39:
	.align	2
.L38:
	.word	.LC5
	.word	.LC6
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	mpi_devnode
	.fnend
	.size	rkos_device_init, .-rkos_device_init
	.align	1
	.global	rkos_device_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_device_deinit, %function
rkos_device_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	ldr	r4, .L45
	ldr	r0, [r4]
	cbz	r0, .L40
	cmn	r0, #4096
	bhi	.L40
	ldr	r5, .L45+4
	movs	r2, #0
	adds	r1, r5, #4
	bl	class_remove_file_ns
	ldr	r0, [r4]
	bl	class_destroy
	ldr	r0, [r5]
	movs	r3, #0
	movs	r1, #50
	str	r3, [r4]
	lsls	r0, r0, #20
	pop	{r3, r4, r5, lr}
	b	unregister_chrdev_region
.L40:
	pop	{r3, r4, r5, pc}
.L46:
	.align	2
.L45:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.fnend
	.size	rkos_device_deinit, .-rkos_device_deinit
	.align	1
	.global	rkos_dev_open
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_dev_open, %function
rkos_dev_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	add	r8, r0, #9
	ldr	r5, .L55
	mov	r6, r0
	mov	r7, r1
	movs	r4, #0
.L50:
	ldr	r3, [r5, #-4]
	cbz	r3, .L48
	mov	r1, r8
	mov	r0, r5
	bl	strcmp
	cbnz	r0, .L48
	ldr	r3, .L55+4
	movs	r5, #136
	mla	r5, r5, r4, r3
	ldr	r3, [r5, #136]
	cbnz	r3, .L47
	mov	r2, #420
	mov	r1, r7
	mov	r0, r6
	bl	filp_open
	str	r0, [r5, #136]
.L47:
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, pc}
.L48:
	adds	r4, r4, #1
	adds	r5, r5, #136
	cmp	r4, #26
	bne	.L50
	mov	r4, #-1
	b	.L47
.L56:
	.align	2
.L55:
	.word	.LANCHOR1+8
	.word	.LANCHOR1
	.fnend
	.size	rkos_dev_open, .-rkos_dev_open
	.align	1
	.global	rkos_dev_close
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_dev_close, %function
rkos_dev_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #25
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	bhi	.L59
	ldr	r5, .L61
	movs	r3, #136
	mla	r5, r3, r0, r5
	ldr	r4, [r5, #136]
	cbnz	r4, .L60
	mov	r1, r4
	mov	r0, r4
	bl	filp_close
	str	r4, [r5, #136]
.L60:
	movs	r0, #0
	b	.L57
.L59:
	mov	r0, #-1
.L57:
	pop	{r3, r4, r5, pc}
.L62:
	.align	2
.L61:
	.word	.LANCHOR1
	.fnend
	.size	rkos_dev_close, .-rkos_dev_close
	.align	1
	.global	rkos_dev_ioctl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_dev_ioctl, %function
rkos_dev_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #25
	push	{r4, lr}
	.save {r4, lr}
	bhi	.L64
	ldr	r3, .L65
	movs	r4, #136
	mla	r0, r4, r0, r3
	ldr	r0, [r0, #136]
	bl	vfs_ioctl
.L64:
	mov	r0, #-1
	pop	{r4, pc}
.L66:
	.align	2
.L65:
	.word	.LANCHOR1
	.fnend
	.size	rkos_dev_ioctl, .-rkos_dev_ioctl
	.global	f_lock
	.global	st_coat_dev
	.global	mpi_class
	.section	.rodata
	.set	.LANCHOR2,. + 0
	.type	__FUNCTION__.35487, %object
	.size	__FUNCTION__.35487, 16
__FUNCTION__.35487:
	.ascii	"rkos_destroydev\000"
	.type	__FUNCTION__.35474, %object
	.size	__FUNCTION__.35474, 15
__FUNCTION__.35474:
	.ascii	"rkos_createdev\000"
	.type	__FUNCTION__.35505, %object
	.size	__FUNCTION__.35505, 22
__FUNCTION__.35505:
	.ascii	"rkos_deregisterdevice\000"
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	major_id, %object
	.size	major_id, 4
major_id:
	.word	255
	.type	class_attr_version, %object
	.size	class_attr_version, 20
class_attr_version:
	.word	.LC7
	.short	292
	.space	2
	.word	show_class_attr_string
	.word	0
	.word	.LC8
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	mpi_class, %object
	.size	mpi_class, 4
mpi_class:
	.space	4
	.type	st_coat_dev, %object
	.size	st_coat_dev, 3536
st_coat_dev:
	.space	3536
	.type	__key.35446, %object
	.size	__key.35446, 0
__key.35446:
	.type	f_lock, %object
	.size	f_lock, 0
f_lock:
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"mpi/%s\000"
.LC1:
	.ascii	"%s\000"
.LC2:
	.ascii	"failed to register dev device: %ld, %s\000"
.LC3:
	.ascii	"%s - parameter invalid!\012\000"
.LC4:
	.ascii	"%s - not device space\012\000"
.LC5:
	.ascii	"mpi\000"
.LC6:
	.ascii	"mpi get major device id fail = %d\000"
.LC7:
	.ascii	"version\000"
.LC8:
	.ascii	"mpi 1.1.0 20060810\000"
	.section	___ksymtab+rkos_createdev,"a"
	.align	2
	.type	__ksymtab_rkos_createdev, %object
	.size	__ksymtab_rkos_createdev, 12
__ksymtab_rkos_createdev:
	.word	rkos_createdev
	.word	__kstrtab_rkos_createdev
	.word	__kstrtabns_rkos_createdev
	.section	___ksymtab+rkos_deregisterdevice,"a"
	.align	2
	.type	__ksymtab_rkos_deregisterdevice, %object
	.size	__ksymtab_rkos_deregisterdevice, 12
__ksymtab_rkos_deregisterdevice:
	.word	rkos_deregisterdevice
	.word	__kstrtab_rkos_deregisterdevice
	.word	__kstrtabns_rkos_deregisterdevice
	.section	___ksymtab+rkos_destroydev,"a"
	.align	2
	.type	__ksymtab_rkos_destroydev, %object
	.size	__ksymtab_rkos_destroydev, 12
__ksymtab_rkos_destroydev:
	.word	rkos_destroydev
	.word	__kstrtab_rkos_destroydev
	.word	__kstrtabns_rkos_destroydev
	.section	___ksymtab+rkos_registerdevice,"a"
	.align	2
	.type	__ksymtab_rkos_registerdevice, %object
	.size	__ksymtab_rkos_registerdevice, 12
__ksymtab_rkos_registerdevice:
	.word	rkos_registerdevice
	.word	__kstrtab_rkos_registerdevice
	.word	__kstrtabns_rkos_registerdevice
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
