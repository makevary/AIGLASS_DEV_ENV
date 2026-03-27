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
	.file	"osal_mpp_service.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_service_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_deinit, %function
mpp_service_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r2, [r0, #4]
	cbz	r2, .L2
	ldr	r3, [r0, #404]
	ldr	r3, [r3, #8]
	cbz	r3, .L2
	mov	r0, r2
	blx	r3
.L2:
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	mpp_service_deinit, .-mpp_service_deinit
	.align	1
	.global	mpp_service_chnl_register
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_chnl_register, %function
mpp_service_chnl_register:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, r0
	ldr	r0, [r0, #4]
	cbz	r0, .L9
	ldr	r3, [r3, #404]
	ldr	r3, [r3, #4]
	cbz	r3, .L9
	bx	r3
.L9:
	bx	lr
	.fnend
	.size	mpp_service_chnl_register, .-mpp_service_chnl_register
	.align	1
	.global	mpp_service_iova_address
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_iova_address, %function
mpp_service_iova_address:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #404]
	ldr	r3, [r3, #16]
	cbz	r3, .L18
	ldr	r0, [r0, #4]
	bx	r3
.L18:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_service_iova_address, .-mpp_service_iova_address
	.align	1
	.global	mpp_service_get_dev
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_get_dev, %function
mpp_service_get_dev:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #404]
	ldr	r3, [r3, #24]
	cbz	r3, .L20
	ldr	r0, [r0, #4]
	bx	r3
.L20:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_service_get_dev, .-mpp_service_get_dev
	.align	1
	.global	mpp_service_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_run_task, %function
mpp_service_run_task:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #404]
	ldr	r3, [r3, #28]
	cbz	r3, .L22
	ldr	r0, [r0, #4]
	bx	r3
.L22:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_service_run_task, .-mpp_service_run_task
	.align	1
	.global	mpp_service_chnl_check_running
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_chnl_check_running, %function
mpp_service_chnl_check_running:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #404]
	ldr	r3, [r3, #32]
	cbz	r3, .L24
	ldr	r0, [r0, #4]
	bx	r3
.L24:
	mov	r0, r3
	bx	lr
	.fnend
	.size	mpp_service_chnl_check_running, .-mpp_service_chnl_check_running
	.align	1
	.global	mpp_service_chnl_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_chnl_control, %function
mpp_service_chnl_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {lr}
	.pad #28
	movs	r3, #2
	str	r3, [sp, #4]
	movs	r3, #0
	str	r3, [sp, #20]
	ldr	r3, [r0, #404]
	str	r2, [sp, #16]
	str	r1, [sp]
	ldr	r3, [r3, #12]
	cbz	r3, .L27
	mov	r1, sp
	ldr	r0, [r0, #4]
	blx	r3
.L25:
	add	sp, sp, #28
	@ sp needed
	ldr	pc, [sp], #4
.L27:
	mov	r0, r3
	b	.L25
	.fnend
	.size	mpp_service_chnl_control, .-mpp_service_chnl_control
	.align	1
	.global	mpp_service_cmd_send
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_cmd_send, %function
mpp_service_cmd_send:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r0
	ldr	r3, [r0, #8]
	subs	r2, r3, #1
	cmp	r2, #15
	bls	.L29
	str	r3, [sp]
	movs	r2, #117
	mov	r3, r0
	ldr	r1, .L36
	ldr	r0, .L36+4
	bl	printk
	mvn	r0, #5
.L28:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L29:
	cmp	r3, #1
	ble	.L31
	mov	r1, r0
	movs	r0, #24
	mla	r3, r0, r3, r4
.L32:
	ldr	r0, [r1, #20]
	adds	r1, r1, #24
	orr	r0, r0, #1
	str	r0, [r1, #-4]
	cmp	r1, r3
	bne	.L32
.L31:
	movs	r3, #24
	mla	r3, r3, r2, r4
	ldr	r2, [r3, #20]
	orr	r2, r2, #2
	str	r2, [r3, #20]
	ldr	r3, [r4, #404]
	ldr	r3, [r3, #12]
	cbz	r3, .L34
	add	r1, r4, #16
	ldr	r0, [r4, #4]
	blx	r3
.L33:
	movs	r3, #0
	strd	r3, r3, [r4, #8]
	b	.L28
.L34:
	mov	r0, r3
	b	.L33
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	mpp_service_cmd_send, .-mpp_service_cmd_send
	.align	1
	.global	mpp_service_reg_wr
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_reg_wr, %function
mpp_service_reg_wr:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, [r0, #8]
	mov	r6, r1
	cbnz	r4, .L39
	mov	r2, #384
	mov	r1, r4
	adds	r0, r0, #16
	bl	memset
.L39:
	movs	r3, #24
	movs	r0, #0
	mla	r3, r3, r4, r5
	mov	r2, #512
	adds	r4, r4, #1
	strd	r2, r0, [r3, #16]
	ldr	r2, [r6, #4]
	str	r2, [r3, #24]
	ldr	r2, [r6, #8]
	str	r2, [r3, #28]
	ldr	r1, [r6]
	strd	r1, r0, [r3, #32]
	str	r4, [r5, #8]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	mpp_service_reg_wr, .-mpp_service_reg_wr
	.align	1
	.global	mpp_service_reg_rd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_reg_rd, %function
mpp_service_reg_rd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	ldr	r4, [r0, #8]
	mov	r6, r1
	cbnz	r4, .L41
	mov	r2, #384
	mov	r1, r4
	adds	r0, r0, #16
	bl	memset
.L41:
	movs	r3, #24
	movs	r0, #0
	mla	r3, r3, r4, r5
	movw	r2, #513
	adds	r4, r4, #1
	strd	r2, r0, [r3, #16]
	ldr	r2, [r6, #4]
	str	r2, [r3, #24]
	ldr	r2, [r6, #8]
	str	r2, [r3, #28]
	ldr	r1, [r6]
	strd	r1, r0, [r3, #32]
	str	r4, [r5, #8]
	pop	{r4, r5, r6, pc}
	.fnend
	.size	mpp_service_reg_rd, .-mpp_service_reg_rd
	.align	1
	.global	mpp_service_cmd_poll
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_cmd_poll, %function
mpp_service_cmd_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r4, r0
	movs	r2, #16
	movs	r1, #0
	add	r0, sp, #8
	bl	memset
	movs	r3, #2
	mov	r2, #768
	strd	r2, r3, [sp]
	ldr	r3, [r4, #404]
	ldr	r3, [r3, #12]
	cbz	r3, .L44
	mov	r1, sp
	ldr	r0, [r4, #4]
	blx	r3
.L42:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, pc}
.L44:
	mov	r0, r3
	b	.L42
	.fnend
	.size	mpp_service_cmd_poll, .-mpp_service_cmd_poll
	.align	1
	.global	mpp_service_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_init, %function
mpp_service_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	mov	r5, r1
	bl	get_mppdev_svr_ops
	str	r0, [r4, #404]
	cbnz	r0, .L46
	ldr	r0, .L54
	movs	r1, #41
.L53:
	bl	printk
	mov	r0, #-1
.L45:
	pop	{r3, r4, r5, pc}
.L46:
	ldr	r3, [r0]
	cbz	r3, .L48
	mov	r0, r5
	blx	r3
	str	r0, [r4, #4]
.L48:
	ldr	r3, [r4, #4]
	cbnz	r3, .L49
	movs	r1, #49
	ldr	r0, .L54+4
	b	.L53
.L49:
	movs	r0, #0
	b	.L45
.L55:
	.align	2
.L54:
	.word	.LC1
	.word	.LC2
	.fnend
	.size	mpp_service_init, .-mpp_service_init
	.global	mpp_service_api
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.7853, %object
	.size	__func__.7853, 21
__func__.7853:
	.ascii	"mpp_service_cmd_send\000"
	.space	3
	.type	mpp_service_api, %object
	.size	mpp_service_api, 56
mpp_service_api:
	.word	.LC3
	.word	408
	.word	mpp_service_init
	.word	mpp_service_deinit
	.word	mpp_service_reg_wr
	.word	mpp_service_reg_rd
	.word	mpp_service_cmd_send
	.word	mpp_service_cmd_poll
	.word	mpp_service_iova_address
	.word	mpp_service_chnl_register
	.word	mpp_service_get_dev
	.word	mpp_service_run_task
	.word	mpp_service_chnl_check_running
	.word	mpp_service_chnl_control
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: ctx %p invalid request count %d\012\000"
.LC1:
	.ascii	"\0013%d: get_mppdev_svr_ops fail\000"
.LC2:
	.ascii	"\0013%d: mpp_chnl_open fail\000"
.LC3:
	.ascii	"mpp_service\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
