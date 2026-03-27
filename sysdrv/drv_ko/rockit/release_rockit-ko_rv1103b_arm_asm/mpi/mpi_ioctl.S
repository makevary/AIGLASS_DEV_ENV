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
	.file	"mpi_ioctl.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpi_ioctl_kernel:					
	.asciz 	"mpi_ioctl_kernel"					
__kstrtabns_mpi_ioctl_kernel:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	mpi_ioctl_kernel
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpi_ioctl_kernel, %function
mpi_ioctl_kernel:
	.fnstart
	@ args = 0, pretend = 0, frame = 144
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r1
	ldr	r1, .L23
	mov	r10, r3
	.pad #164
	sub	sp, sp, #164
	ubfx	r7, r2, #16, #14
	ldr	r6, [r8, #8]
	mov	fp, r0
	ldr	r3, [r1]
	str	r1, [sp, #20]
	str	r3, [sp, #156]
	ldr	r3, [r8]
	ands	r2, r2, r3
	ubfx	r5, r3, #16, #14
	ands	r9, r2, #1073741824
	it	ne
	movne	r9, r7
	cmp	r2, #0
	it	ge
	movge	r7, #0
	cmp	r5, r9
	it	cc
	movcc	r5, r9
	cmp	r5, r7
	it	cc
	movcc	r5, r7
	cbnz	r6, .L4
	movs	r3, #27
	ldr	r2, .L23+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L23+8
	mov	r0, r6
	bl	vlog
	mov	r4, r6
	mvn	r5, #21
.L5:
	mov	r0, r4
	bl	kfree
	b	.L1
.L4:
	cmp	r5, #128
	bls	.L16
	movs	r1, #0
	mov	r0, r5
	bl	rkos_kmalloc
	mov	r4, r0
	cbnz	r0, .L6
	mvn	r5, #11
	b	.L5
.L16:
	add	r4, sp, #28
.L6:
	mov	r1, r10
	mov	r2, r9
	mov	r0, r4
	bl	rkos_copy_from_user
	mov	r1, r0
	cbz	r0, .L7
	movs	r3, #45
	ldr	r2, .L23+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L23+8
	str	r0, [sp, #4]
	movs	r0, #0
.L22:
	bl	vlog
	mvn	r5, #13
.L8:
	add	r3, sp, #28
	cmp	r4, r3
	bne	.L5
.L1:
	ldr	r3, [sp, #20]
	mov	r0, r5
	ldr	r2, [sp, #156]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L14
	bl	__stack_chk_fail
.L7:
	cmp	r9, r5
	bcs	.L9
	sub	r2, r5, r9
	add	r0, r4, r9
	bl	memset
.L9:
	ldr	r3, [r8, #4]
	lsls	r3, r3, #27
	bpl	.L10
	mov	r1, r4
	mov	r0, fp
	blx	r6
	mov	r5, r0
.L11:
	ldr	r6, .L23+8
	movs	r3, #67
	ldr	r2, .L23+16
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	strd	r6, r5, [sp, #4]
	mov	r3, r6
	bl	vlog
	mov	r2, r7
	mov	r1, r4
	mov	r0, r10
	bl	rkos_copy_to_user
	cmp	r0, #0
	beq	.L8
	movs	r3, #70
	movs	r0, #0
	ldr	r2, .L23+20
	movs	r1, #2
	strd	r3, r0, [sp]
	mov	r3, r6
	b	.L22
.L10:
	ldr	r0, [r8, #16]
	cbz	r0, .L12
	bl	rkos_mutex_lock
	mov	r1, r4
	mov	r0, fp
	blx	r6
	mov	r5, r0
	ldr	r0, [r8, #16]
.L21:
	bl	rkos_mutex_unlock
	b	.L11
.L12:
	ldr	r0, .L23+24
	bl	rkos_mutex_lock
	mov	r1, r4
	mov	r0, fp
	blx	r6
	mov	r5, r0
	ldr	r0, .L23+24
	b	.L21
.L14:
	add	sp, sp, #164
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L24:
	.align	2
.L23:
	.word	__stack_chk_guard
	.word	.LC0
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	mpi_global_mutex
	.fnend
	.size	mpi_ioctl_kernel, .-mpi_ioctl_kernel
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.36102, %object
	.size	__func__.36102, 17
__func__.36102:
	.ascii	"mpi_ioctl_kernel\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;31merror: no function\033[0m\000"
.LC1:
	.ascii	"\033[1;31merror: rkos_copy_from_user fail: ret: %d\033"
	.ascii	"[0m\000"
.LC2:
	.ascii	"%s:retcode = %d\000"
.LC3:
	.ascii	"\033[1;31merror: copy_from_user fail: ret: %d\033[0"
	.ascii	"m\000"
	.section	___ksymtab+mpi_ioctl_kernel,"a"
	.align	2
	.type	__ksymtab_mpi_ioctl_kernel, %object
	.size	__ksymtab_mpi_ioctl_kernel, 12
__ksymtab_mpi_ioctl_kernel:
	.word	mpi_ioctl_kernel
	.word	__kstrtab_mpi_ioctl_kernel
	.word	__kstrtabns_mpi_ioctl_kernel
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
