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
	.file	"mpp_device.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_dev_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_init, %function
mpp_dev_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	mov	r8, r1
	mov	r7, r0
	cbnz	r0, .L2
	movs	r2, #38
	ldr	r1, .L14
	ldr	r0, .L14+4
	bl	printk
	mvn	r0, #2
.L1:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L2:
	movs	r3, #0
	movs	r1, #12
	str	r3, [r0]
	ldr	r0, .L14+8
	bl	mpp_osal_calloc
	ldr	r6, .L14+12
	ldr	r1, [r6, #4]
	mov	r4, r0
	ldr	r0, .L14+8
	bl	mpp_osal_calloc
	mov	r5, r0
	cbz	r4, .L4
	cbnz	r0, .L5
.L4:
	str	r5, [sp]
	mov	r3, r4
	movs	r2, #48
	ldr	r1, .L14
	ldr	r0, .L14+16
	bl	printk
	cbz	r4, .L6
	mov	r1, r4
	ldr	r0, .L14+8
	bl	mpp_osal_free
.L6:
	cbz	r5, .L7
	mov	r1, r5
	ldr	r0, .L14+8
	bl	mpp_osal_free
.L7:
	mvn	r0, #3
	b	.L1
.L5:
	ldr	r3, [r6, #8]
	mov	r1, r8
	strd	r0, r6, [r4, #4]
	str	r8, [r4]
	str	r3, [sp, #12]
	str	r4, [r7]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	r3
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LANCHOR0+13
	.word	mpp_service_api
	.word	.LC1
	.fnend
	.size	mpp_dev_init, .-mpp_dev_init
	.align	1
	.global	mpp_dev_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_deinit, %function
mpp_dev_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	cbnz	r0, .L17
	movs	r2, #68
	ldr	r1, .L27
	ldr	r0, .L27+4
	mvn	r4, #2
	bl	printk
.L16:
	mov	r0, r4
	pop	{r3, r4, r5, pc}
.L17:
	ldr	r4, [r0, #8]
	cbz	r4, .L19
	ldr	r4, [r4, #12]
	cbz	r4, .L19
	ldr	r0, [r0, #4]
	cbz	r0, .L23
	blx	r4
.L23:
	mov	r4, r0
.L19:
	ldr	r1, [r5, #4]
	cbz	r1, .L20
	ldr	r0, .L27+8
	bl	mpp_osal_free
.L20:
	movs	r3, #0
	mov	r1, r5
	str	r3, [r5, #4]
	ldr	r0, .L27+8
	bl	mpp_osal_free
	b	.L16
.L28:
	.align	2
.L27:
	.word	.LANCHOR0+26
	.word	.LC0
	.word	.LANCHOR0+41
	.fnend
	.size	mpp_dev_deinit, .-mpp_dev_deinit
	.align	1
	.global	mpp_dev_ioctl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_ioctl, %function
mpp_dev_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, r1
	mov	r1, r2
	push	{r4, lr}
	.save {r4, lr}
	cbz	r0, .L47
	ldr	r4, [r0, #8]
	cbz	r4, .L39
	ldr	r0, [r0, #4]
	cmp	r3, #4
	bhi	.L31
	tbb	[pc, r3]
.L33:
	.byte	(.L37-.L33)/2
	.byte	(.L36-.L33)/2
	.byte	(.L35-.L33)/2
	.byte	(.L34-.L33)/2
	.byte	(.L32-.L33)/2
	.p2align 1
.L37:
	ldr	r2, [r4, #16]
	cbz	r2, .L30
	pop	{r4, lr}
	bx	r2
.L36:
	ldr	r3, [r4, #20]
.L53:
	cbz	r3, .L30
	pop	{r4, lr}
	bx	r3
.L35:
	ldr	r3, [r4, #24]
.L51:
	cbz	r3, .L30
	pop	{r4, lr}
	bx	r3
.L34:
	ldr	r3, [r4, #28]
	b	.L51
.L32:
	ldr	r3, [r4, #44]
	b	.L53
.L31:
	movs	r2, #118
	ldr	r1, .L54
	ldr	r0, .L54+4
	bl	printk
.L47:
	movs	r3, #0
.L30:
	mov	r0, r3
	pop	{r4, pc}
.L39:
	mov	r3, r4
	b	.L30
.L55:
	.align	2
.L54:
	.word	.LANCHOR0+56
	.word	.LC2
	.fnend
	.size	mpp_dev_ioctl, .-mpp_dev_ioctl
	.align	1
	.global	mpp_dev_get_iova_address
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_get_iova_address, %function
mpp_dev_get_iova_address:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r8, r2
	ldrd	r7, r9, [r0, #4]
	mov	r5, r1
	cbnz	r1, .L57
	movs	r2, #134
	ldr	r1, .L67
	ldr	r0, .L67+4
	bl	printk
	mvn	r0, #21
.L56:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L57:
	ldr	r1, .L67+8
	mov	r0, r5
	bl	mpp_buffer_get_phy_caller
	adds	r2, r0, #1
	mov	r4, r0
	bne	.L59
	ldr	r1, .L67+8
	mov	r0, r5
	bl	mpp_buffer_get_dma_with_caller
	mov	r6, r0
	cbnz	r0, .L60
	movs	r1, #141
	ldr	r3, .L67+8
	str	r1, [sp]
	ldr	r2, .L67+12
	ldr	r0, .L67+16
	bl	printk
.L60:
	ldr	r3, [r9, #32]
	cbz	r3, .L59
	mov	r2, r8
	mov	r1, r6
	mov	r0, r7
	blx	r3
	adds	r3, r0, #1
	mov	r4, r0
	beq	.L59
	mov	r1, r0
	ldr	r2, .L67+8
	mov	r0, r5
	bl	mpp_buffer_set_phy_caller
.L59:
	mov	r0, r4
	b	.L56
.L68:
	.align	2
.L67:
	.word	.LANCHOR0+70
	.word	.LC3
	.word	.LANCHOR0+95
	.word	.LC4
	.word	.LC5
	.fnend
	.size	mpp_dev_get_iova_address, .-mpp_dev_get_iova_address
	.align	1
	.global	mpp_dev_get_mpi_ioaddress
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_get_mpi_ioaddress, %function
mpp_dev_get_mpi_ioaddress:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r1
	mov	r6, r2
	ldrd	r5, r7, [r0, #4]
	bl	get_mpibuf_ops
	cbnz	r4, .L70
	movs	r2, #161
	ldr	r1, .L84
	ldr	r0, .L84+4
	bl	printk
	mvn	r0, #21
.L69:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L70:
	cbnz	r0, .L72
.L75:
	mov	r0, r4
	ldr	r1, .L84+8
	bl	mpi_buf_get_dma_with_caller
	mov	r4, r0
	cbnz	r0, .L74
	movs	r1, #169
	ldr	r3, .L84+8
	str	r1, [sp]
	ldr	r2, .L84+12
	ldr	r0, .L84+16
	bl	printk
.L74:
	ldr	r3, [r7, #32]
	cbz	r3, .L77
	mov	r2, r6
	mov	r1, r4
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	r3
.L72:
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L75
	mov	r0, r4
	blx	r3
	adds	r3, r0, #1
	bne	.L69
	b	.L75
.L77:
	mov	r0, #-1
	b	.L69
.L85:
	.align	2
.L84:
	.word	.LANCHOR0+120
	.word	.LC3
	.word	.LANCHOR0+146
	.word	.LC4
	.word	.LC5
	.fnend
	.size	mpp_dev_get_mpi_ioaddress, .-mpp_dev_get_mpi_ioaddress
	.align	1
	.global	mpp_dev_chnl_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_chnl_register, %function
mpp_dev_chnl_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #36]
	cbz	r3, .L86
	ldr	r0, [r0, #4]
	bx	r3	@ indirect register sibling call
.L86:
	bx	lr
	.fnend
	.size	mpp_dev_chnl_register, .-mpp_dev_chnl_register
	.align	1
	.global	mpp_get_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_get_dev, %function
mpp_get_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #40]
	cbz	r3, .L89
	ldr	r0, [r0, #4]
	bx	r3
.L89:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_get_dev, .-mpp_get_dev
	.align	1
	.global	mpp_dev_chnl_check_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_chnl_check_running, %function
mpp_dev_chnl_check_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #48]
	cbz	r3, .L91
	ldr	r0, [r0, #4]
	bx	r3
.L91:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_dev_chnl_check_running, .-mpp_dev_chnl_check_running
	.align	1
	.global	mpp_dev_chnl_unbind_jpeg_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_chnl_unbind_jpeg_task, %function
mpp_dev_chnl_unbind_jpeg_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #52]
	cbz	r3, .L93
	movs	r2, #0
	movw	r1, #1028
	ldr	r0, [r0, #4]
	bx	r3
.L93:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_dev_chnl_unbind_jpeg_task, .-mpp_dev_chnl_unbind_jpeg_task
	.align	1
	.global	mpp_dev_chnl_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dev_chnl_control, %function
mpp_dev_chnl_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #8]
	ldr	r3, [r3, #52]
	cbz	r3, .L95
	ldr	r0, [r0, #4]
	bx	r3
.L95:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_dev_chnl_control, .-mpp_dev_chnl_control
	.global	mpp_device_debug
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.8030, %object
	.size	__func__.8030, 13
__func__.8030:
	.ascii	"mpp_dev_init\000"
	.type	__FUNCTION__.8031, %object
	.size	__FUNCTION__.8031, 13
__FUNCTION__.8031:
	.ascii	"mpp_dev_init\000"
	.type	__func__.8037, %object
	.size	__func__.8037, 15
__func__.8037:
	.ascii	"mpp_dev_deinit\000"
	.type	__FUNCTION__.8038, %object
	.size	__FUNCTION__.8038, 15
__FUNCTION__.8038:
	.ascii	"mpp_dev_deinit\000"
	.type	__func__.8055, %object
	.size	__func__.8055, 14
__func__.8055:
	.ascii	"mpp_dev_ioctl\000"
	.type	__func__.8066, %object
	.size	__func__.8066, 25
__func__.8066:
	.ascii	"mpp_dev_get_iova_address\000"
	.type	__FUNCTION__.8067, %object
	.size	__FUNCTION__.8067, 25
__FUNCTION__.8067:
	.ascii	"mpp_dev_get_iova_address\000"
	.type	__func__.8081, %object
	.size	__func__.8081, 26
__func__.8081:
	.ascii	"mpp_dev_get_mpi_ioaddress\000"
	.type	__FUNCTION__.8082, %object
	.size	__FUNCTION__.8082, 26
__FUNCTION__.8082:
	.ascii	"mpp_dev_get_mpi_ioaddress\000"
	.bss
	.align	2
	.type	mpp_device_debug, %object
	.size	mpp_device_debug, 4
mpp_device_debug:
	.space	4
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: found NULL input ctx\012\000"
.LC1:
	.ascii	"\0013%s:%d: malloc failed impl %p impl_ctx %p\012\000"
.LC2:
	.ascii	"\0013%s:%d: invalid cmd %d\012\000"
.LC3:
	.ascii	"\0013%s:%d: input NULL\000"
.LC4:
	.ascii	"dma_buf\000"
.LC5:
	.ascii	"\0013%d: Assertion %s failed at %s:%d\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
