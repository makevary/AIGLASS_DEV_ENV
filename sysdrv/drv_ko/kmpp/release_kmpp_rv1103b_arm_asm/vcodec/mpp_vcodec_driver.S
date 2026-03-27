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
	.file	"mpp_vcodec_driver.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vmpi_register_fn2vcocdec:					
	.asciz 	"vmpi_register_fn2vcocdec"					
__kstrtabns_vmpi_register_fn2vcocdec:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vmpi_unregister_fn2vcocdec:					
	.asciz 	"vmpi_unregister_fn2vcocdec"					
__kstrtabns_vmpi_unregister_fn2vcocdec:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsm_buf_register_fn2vcocdec:					
	.asciz 	"vsm_buf_register_fn2vcocdec"					
__kstrtabns_vsm_buf_register_fn2vcocdec:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.global	vsm_buf_register_fn2vcocdec
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsm_buf_register_fn2vcocdec, %function
vsm_buf_register_fn2vcocdec:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	movw	r1, #567
	str	r0, [r3]
	ldr	r0, .L2+4
	b	printk
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.word	.LC0
	.fnend
	.size	vsm_buf_register_fn2vcocdec, .-vsm_buf_register_fn2vcocdec
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_copy_from_user, %function
_copy_from_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r3, sp
	bic	r3, r3, #8160
	mov	r6, r0
	bic	r3, r3, #31
	mov	r4, r2
	ldr	r3, [r3, #8]
	.syntax unified
@ 157 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r5, r1, r2; sbcscc r5, r5, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L7
	bl	arm_copy_from_user
	mov	r5, r0
.L5:
	cbz	r5, .L4
	subs	r0, r4, r5
	mov	r2, r5
	movs	r1, #0
	add	r0, r0, r6
	bl	memset
.L4:
	mov	r0, r5
	pop	{r4, r5, r6, pc}
.L7:
	mov	r5, r2
	b	.L5
	.fnend
	.size	_copy_from_user, .-_copy_from_user
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_copy_to_user, %function
_copy_to_user:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5}
	.save {r4, r5}
	mov	r3, sp
	bic	r3, r3, #8160
	bic	r3, r3, #31
	ldr	r3, [r3, #8]
	.syntax unified
@ 177 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/include/linux/uaccess.h" 1
	.syntax unified
adds r5, r0, r2; sbcscc r5, r5, r3; movcc r3, #0
@ 0 "" 2
	.thumb
	.syntax unified
	cbnz	r3, .L12
	pop	{r4, r5}
	b	arm_copy_to_user
.L12:
	mov	r0, r2
	pop	{r4, r5}
	bx	lr
	.fnend
	.size	_copy_to_user, .-_copy_to_user
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_poll, %function
vcodec_poll:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	ldr	r3, [r0, #128]
	mov	r5, r1
	ldrd	r0, r1, [r3]
	bl	mpp_vcodec_get_chan_entry
	ldr	r3, [r0, #84]
	add	r6, r0, #84
	mov	r4, r0
	cmp	r6, r3
	beq	.L14
.L18:
	movs	r0, #65
.L13:
	pop	{r3, r4, r5, r6, r7, pc}
.L14:
	ldr	r3, [r0, #28]
	cmp	r3, #2
	beq	.L16
	cbz	r5, .L17
	ldr	r3, [r5]
	cbz	r3, .L17
	adds	r1, r0, #68
	beq	.L17
	mov	r2, r5
	mov	r0, r7
	blx	r3
.L17:
	ldr	r3, [r4, #84]
	cmp	r6, r3
	bne	.L18
	ldr	r3, [r4, #28]
	cmp	r3, #2
	bne	.L19
.L16:
	movs	r0, #25
	b	.L13
.L19:
	movs	r0, #0
	b	.L13
	.fnend
	.size	vcodec_poll, .-vcodec_poll
	.align	1
	.global	vmpi_register_fn2vcocdec
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmpi_register_fn2vcocdec, %function
vmpi_register_fn2vcocdec:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34
	strd	r0, r1, [r3, #4]
	cbz	r0, .L32
	b	vcodec_create_mpi_dev
.L32:
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LANCHOR0
	.fnend
	.size	vmpi_register_fn2vcocdec, .-vmpi_register_fn2vcocdec
	.align	1
	.global	vmpi_unregister_fn2vcocdec
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmpi_unregister_fn2vcocdec, %function
vmpi_unregister_fn2vcocdec:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpp_vcodec_unregister_mpidev
	movs	r2, #0
	ldr	r3, .L37
	strd	r2, r2, [r3, #4]
	pop	{r3, pc}
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.fnend
	.size	vmpi_unregister_fn2vcocdec, .-vmpi_unregister_fn2vcocdec
	.section	.exit.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_exit, %function
vcodec_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	mpp_vcodec_deinit
	ldr	r0, .L40
	bl	platform_driver_unregister
	ldr	r0, .L40+4
	bl	platform_driver_unregister
	ldr	r0, .L40+8
	pop	{r3, lr}
	b	printk
.L41:
	.align	2
.L40:
	.word	.LANCHOR1
	.word	mpp_service_driver
	.word	.LC1
	.fnend
	.size	vcodec_exit, .-vcodec_exit
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_remove, %function
vcodec_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r5, r0
	ldr	r4, [r0, #80]
	ldr	r0, [r4, #76]
	cbz	r0, .L43
	bl	proc_remove
	movs	r3, #0
	str	r3, [r4, #76]
.L43:
	ldr	r0, [r4, #80]
	cbz	r0, .L44
	bl	proc_remove
	movs	r3, #0
	str	r3, [r4, #80]
.L44:
	add	r0, r5, #16
	ldr	r1, .L51
	mov	r5, r4
	bl	_dev_info
	ldr	r0, [r5], #12
	ldr	r1, [r4, #8]
	bl	device_destroy
	mov	r0, r5
	bl	cdev_del
	movs	r1, #1
	ldr	r0, [r4, #8]
	bl	unregister_chrdev_region
	ldr	r0, [r4]
	bl	class_destroy
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L52:
	.align	2
.L51:
	.word	.LC2
	.fnend
	.size	vcodec_remove, .-vcodec_remove
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkvenc_show_pp_info, %function
rkvenc_show_pp_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	vepu_show_pp_info
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	rkvenc_show_pp_info, .-rkvenc_show_pp_info
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	venc_proc_debug, %function
venc_proc_debug:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #52
	sub	sp, sp, #52
	mov	r5, r0
	bl	mpp_vcodec_get_enc_module_entry
	ldr	r3, [r0, #3872]
	mov	r4, r0
	cbz	r3, .L55
	ldr	r1, .L66
	mov	r0, r5
	bl	seq_puts
	ldr	r3, .L66+4
	ldr	r2, .L66+8
	mov	r0, r5
	ldr	r1, .L66+12
	str	r3, [sp]
	ldr	r3, .L66+16
	bl	seq_printf
	ldr	r2, [r4, #3872]
	ldr	r3, [r2, #64]
	ldrd	r0, [r2, #48]
	strd	r0, [sp, #8]
	ldrd	r0, [r3, #48]
	strd	r0, [sp]
	mov	r0, r5
	ldrd	r2, [r3, #32]
	ldr	r1, .L66+20
	bl	seq_printf
.L55:
	ldr	r9, .L66+108
	movs	r6, #0
	ldr	r10, .L66+112
.L58:
	movs	r1, #1
	mov	r0, r6
	bl	mpp_vcodec_get_chan_entry
	ldr	r3, [r0, #28]
	mov	r4, r0
	cmp	r3, #3
	bne	.L56
	add	r8, r0, #44
	mov	r0, r8
	bl	mutex_lock
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L57
	mov	r1, r9
	mov	r0, r5
	ldr	fp, [r4, #36]
	ldr	r7, [r4, #24]
	bl	seq_puts
	ldr	r3, .L66+24
	mov	r0, r5
	ldr	r2, .L66+28
	ldr	r1, .L66+32
	strd	r10, r3, [sp, #28]
	ldr	r3, .L66+36
	str	r3, [sp, #24]
	ldr	r3, .L66+40
	str	r3, [sp, #20]
	ldr	r3, .L66+44
	str	r3, [sp, #16]
	ldr	r3, .L66+48
	str	r3, [sp, #12]
	ldr	r3, .L66+52
	str	r3, [sp, #8]
	ldr	r3, .L66+56
	str	r3, [sp, #4]
	ldr	r3, .L66+60
	str	r3, [sp]
	ldr	r3, .L66+64
	bl	seq_printf
	ldr	r3, [r4, #64]
	ldr	r1, [r4, #100]
	cmp	r7, #0
	ldr	r0, [r4, #104]
	ite	le
	movle	r7, #0
	movgt	r7, #1
	cmp	fp, #0
	str	r3, [sp, #40]
	ldrd	r2, [r4, #176]
	strd	r2, [sp, #32]
	ldrd	r2, [r4, #168]
	strd	r2, [sp, #24]
	mov	r2, r6
	ldr	r3, [r4, #188]
	str	r3, [sp, #20]
	ldr	r3, [r4, #184]
	str	r1, [sp, #8]
	ldr	r1, .L66+68
	strd	r0, r3, [sp, #12]
	mov	r0, r5
	ldr	r3, [r4, #152]
	str	r7, [sp]
	str	r3, [sp, #4]
	ite	le
	movle	r3, #0
	movgt	r3, #1
	bl	seq_printf
	ldr	r3, .L66+72
	ldr	r2, .L66+28
	mov	r0, r5
	ldr	r1, .L66+76
	str	r3, [sp, #20]
	ldr	r3, .L66+80
	str	r3, [sp, #16]
	ldr	r3, .L66+84
	str	r3, [sp, #12]
	ldr	r3, .L66+88
	str	r3, [sp, #8]
	ldr	r3, .L66+92
	str	r3, [sp, #4]
	ldr	r3, .L66+96
	str	r3, [sp]
	ldr	r3, .L66+100
	bl	seq_printf
	ldrd	r1, [r4, #144]
	ldr	r3, [r4, #108]
	ldr	r0, [r4, #112]
	ldr	r7, [r4, #116]
	strd	r1, [sp, #32]
	ldrd	r1, [r4, #136]
	strd	r1, [sp, #24]
	ldrd	r1, [r4, #128]
	strd	r1, [sp, #16]
	ldrd	r1, [r4, #120]
	strd	r0, r7, [sp]
	mov	r0, r5
	strd	r1, [sp, #8]
	mov	r2, r6
	ldr	r1, .L66+104
	bl	seq_printf
	mov	r2, r6
	ldr	r1, [r4, #56]
	mov	r0, r5
	bl	mpp_enc_proc_debug
.L57:
	mov	r0, r8
	bl	mutex_unlock
.L56:
	adds	r6, r6, #1
	cmp	r6, #16
	bne	.L58
	mov	r0, r5
	bl	mpp_packet_pool_info_show
	mov	r0, r5
	bl	mpp_buf_pool_info_show
	mov	r0, r5
	bl	mpp_frame_pool_info_show
	movs	r0, #0
	add	sp, sp, #52
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	.align	2
.L66:
	.word	.LC3
	.word	.LC7
	.word	.LC5
	.word	.LC6
	.word	.LC4
	.word	.LC8
	.word	.LC13
	.word	.LC11
	.word	.LC12
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC10
	.word	.LC22
	.word	.LC25
	.word	.LC24
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC23
	.word	.LC31
	.word	.LC9
	.word	.LC14
	.fnend
	.size	venc_proc_debug, .-venc_proc_debug
	.section	.init.text,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_init, %function
vcodec_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r0, .L73
	bl	printk
	movs	r1, #0
	ldr	r0, .L73+4
	bl	__platform_driver_register
	mov	r4, r0
	mov	r1, r0
	cbz	r0, .L69
	ldr	r0, .L73+8
.L72:
	bl	printk
.L68:
	mov	r0, r4
	pop	{r4, pc}
.L69:
	ldr	r0, .L73+12
	bl	__platform_driver_register
	mov	r4, r0
	cbz	r0, .L71
	mov	r1, r0
	ldr	r0, .L73+16
	b	.L72
.L71:
	bl	mpp_vcodec_init
	b	.L68
.L74:
	.align	2
.L73:
	.word	.LC32
	.word	mpp_service_driver
	.word	.LC33
	.word	.LANCHOR1
	.word	.LC34
	.fnend
	.size	vcodec_init, .-vcodec_init
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_ioctl, %function
vcodec_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r4, [r0, #128]
	.pad #36
	sub	sp, sp, #36
	mov	r6, r2
	cbnz	r4, .L76
	ldr	r0, .L137
	mov	r2, r4
	movs	r1, #252
.L135:
	bl	printk
	mvn	r4, #21
	b	.L75
.L76:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L78
	ldr	r2, [r4]
	mov	r1, #256
	ldr	r0, .L137+4
	mvn	r4, #15
	bl	printk
.L75:
	mov	r0, r4
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L78:
	ldr	r3, .L137+8
	cmp	r1, r3
	bne	.L79
	movs	r2, #24
	movs	r1, #0
	add	r0, sp, #8
	bl	memset
	movs	r2, #24
	mov	r1, r6
	add	r0, sp, #8
	bl	_copy_from_user
	mov	r9, r0
	cmp	r0, #0
	bne	.L80
	add	r3, r4, #20
	str	r3, [sp]
	mov	r0, r3
	bl	down
	ldr	r7, [r5, #128]
	ldrd	r4, r10, [r7]
	ldr	r5, [r7, #8]
	ldrd	fp, r3, [sp, #8]
	ldr	r6, [sp, #16]
	ldr	r8, [sp, #24]
	str	r3, [sp, #4]
	cbz	r6, .L81
	ldr	r1, [r7, #12]
	cmp	r6, r1
	bls	.L81
	cbz	r5, .L82
	mov	r0, r5
	bl	kfree
	strd	r9, r9, [r7, #8]
.L82:
	mov	r1, #3520
	mov	r0, r6
	bl	__kmalloc
	mov	r5, r0
	cmp	r0, #0
	beq	.L108
	strd	r0, r6, [r7, #8]
.L81:
	movw	r3, #257
	cmp	fp, r3
	beq	.L84
	cmp	fp, #258
	bcs	.L85
	cmp	fp, #2
	beq	.L109
	bhi	.L86
	cmp	fp, #0
	beq	.L87
	cmp	fp, #1
	beq	.L88
.L89:
	mov	r2, fp
	movs	r1, #236
	ldr	r0, .L137+12
	bl	printk
	b	.L110
.L86:
	cmp	fp, #3
	beq	.L90
	cmp	fp, #256
	bne	.L89
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_start
.L133:
	mov	r4, r0
	b	.L83
.L85:
	cmp	fp, #1024
	beq	.L92
	bhi	.L93
	cmp	fp, #258
	beq	.L94
	movw	r3, #259
	cmp	fp, r3
	bne	.L89
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_resume
	b	.L133
.L93:
	movw	r3, #1537
	cmp	fp, r3
	beq	.L96
	movw	r3, #1538
	cmp	fp, r3
	bne	.L89
	cmp	r8, #0
	beq	.L98
	cmp	r6, #0
	blt	.L98
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	_copy_from_user
	cbnz	r0, .L98
	mov	r2, r5
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_put_stream
	b	.L133
.L87:
	cmp	r6, #0
	blt	.L98
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	_copy_from_user
	cbnz	r0, .L98
	cmp	r6, #60
	beq	.L99
	movs	r1, #128
	ldr	r0, .L137+16
	bl	printk
.L98:
	mvn	r4, #13
	b	.L83
.L99:
	ldr	r3, [r5]
	mov	r0, r5
	str	r3, [r7, #4]
	bl	mpp_vcodec_chan_create
	mov	r2, r6
	mov	r1, r5
	mov	r4, r0
	mov	r0, r8
	bl	_copy_to_user
	cbz	r0, .L100
	movs	r1, #135
.L136:
	ldr	r0, .L137+20
	bl	printk
.L110:
	mvn	r4, #21
	b	.L83
.L100:
	ldr	r3, [r5, #8]
	str	r3, [r7]
	ldr	r3, [r5, #48]
	str	r3, [r7, #32]
	cbnz	r4, .L83
	movs	r3, #1
.L134:
	str	r3, [r7, #36]
.L83:
	ldr	r0, [sp]
	bl	up
	cmp	r4, #0
	beq	.L75
.L80:
	mvn	r4, #13
	b	.L75
.L88:
	ldr	r3, [r7, #36]
	cbnz	r3, .L101
.L109:
	movs	r4, #0
	b	.L83
.L101:
	mov	r0, r4
	mov	r1, r10
	bl	mpp_vcodec_chan_destory
	movs	r3, #0
	mov	r4, r0
	b	.L134
.L84:
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_stop
	b	.L133
.L94:
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_pause
	b	.L133
.L90:
	cmp	r8, #0
	bne	.L102
.L104:
	mov	r0, r4
	mov	r3, r5
	ldr	r2, [sp, #4]
	mov	r1, r10
	bl	mpp_vcodec_chan_control
	mov	r4, r0
	cmp	r0, #0
	bne	.L83
	cmp	r8, #0
	beq	.L109
	cmp	r6, #0
	blt	.L98
	mov	r2, r6
	mov	r1, r5
	mov	r0, r8
	bl	_copy_to_user
	cmp	r0, #0
	beq	.L109
	b	.L98
.L102:
	cmp	r6, #0
	blt	.L98
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	_copy_from_user
	cmp	r0, #0
	beq	.L104
	b	.L98
.L92:
	cmp	r8, #0
	beq	.L98
	cmp	r6, #0
	blt	.L98
	mov	r2, r6
	mov	r1, r8
	mov	r0, r5
	bl	_copy_from_user
	cmp	r0, #0
	bne	.L98
	mov	r1, r5
	mov	r0, r4
	bl	mpp_vcodec_chan_push_frm
	b	.L133
.L96:
	cmp	r8, #0
	beq	.L98
	mov	r2, r5
	mov	r1, r10
	mov	r0, r4
	bl	mpp_vcodec_chan_get_stream
	cmp	r0, #0
	bne	.L110
	cmp	r6, #0
	bge	.L106
.L107:
	movs	r1, #219
	b	.L136
.L106:
	mov	r2, r6
	mov	r1, r5
	mov	r0, r8
	bl	_copy_to_user
	cmp	r0, #0
	beq	.L109
	b	.L107
.L108:
	mvn	r4, #11
	b	.L83
.L79:
	mov	r2, r1
	ldr	r0, .L137+24
	mov	r1, #280
	b	.L135
.L138:
	.align	2
.L137:
	.word	.LC35
	.word	.LC36
	.word	1074025985
	.word	.LC39
	.word	.LC37
	.word	.LC38
	.word	.LC40
	.fnend
	.size	vcodec_ioctl, .-vcodec_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_close, %function
vcodec_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	ldr	r4, [r1, #128]
	cbnz	r4, .L140
	movs	r1, #69
	ldr	r0, .L150
	bl	printk
	mvn	r0, #21
.L139:
	pop	{r4, pc}
.L140:
	add	r3, r4, #16
	pld	[r3]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r2, [r3]
	add	r2, r2, #1
	strex	r1, r2, [r3]
	teq	r1, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #32]
	cbnz	r3, .L142
	ldr	r3, [r4, #36]
	cbz	r3, .L142
	ldrd	r0, r1, [r4]
	bl	mpp_vcodec_chan_destory
.L142:
	ldr	r0, [r4, #8]
	cbz	r0, .L143
	bl	kfree
	movs	r3, #0
	strd	r3, r3, [r4, #8]
.L143:
	mov	r0, r4
	bl	kfree
	movs	r0, #0
	b	.L139
.L151:
	.align	2
.L150:
	.word	.LC41
	.fnend
	.size	vcodec_close, .-vcodec_close
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_open, %function
vcodec_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L155
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	ldr	r0, [r3, #24]
	mov	r1, #3520
	bl	kmem_cache_alloc
	cbz	r0, .L154
	movs	r3, #0
	add	r2, r0, #24
	str	r0, [r4, #128]
	movs	r1, #1
	str	r3, [r0, #16]
	strd	r1, r2, [r0, #20]
	str	r2, [r0, #28]
	mov	r0, r3
.L152:
	pop	{r4, pc}
.L154:
	mvn	r0, #11
	b	.L152
.L156:
	.align	2
.L155:
	.word	kmalloc_caches
	.fnend
	.size	vcodec_open, .-vcodec_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vcodec_probe, %function
vcodec_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	add	r6, r0, #16
	mov	r5, r0
	mov	r2, #3520
	movs	r1, #88
	mov	r0, r6
	bl	devm_kmalloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L168
	str	r0, [r5, #80]
	movs	r0, #0
	ldr	r2, .L182
	ldr	r1, .L182+4
	bl	__class_create
	cmn	r0, #4096
	str	r0, [r4]
	bls	.L159
	cbz	r0, .L159
	mov	r5, r0
.L157:
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L159:
	ldr	r8, .L182+20
	movs	r2, #1
	str	r6, [r4, #4]
	movs	r1, #0
	add	r0, r4, #8
	mov	r3, r8
	bl	alloc_chrdev_region
	mov	r5, r0
	cbz	r0, .L160
	ldr	r1, .L182+8
.L181:
	mov	r0, r6
	bl	_dev_err
	b	.L157
.L160:
	ldr	r9, .L182+52
	add	r7, r4, #12
	mov	r0, r7
	mov	r1, r9
	bl	cdev_init
	strd	r5, r9, [r4, #48]
	movs	r2, #1
	ldr	r1, [r4, #8]
	mov	r0, r7
	bl	cdev_add
	mov	r5, r0
	cbz	r0, .L161
	movs	r1, #1
	ldr	r0, [r4, #8]
	bl	unregister_chrdev_region
	ldr	r1, .L182+12
	b	.L181
.L161:
	ldr	r3, .L182+16
	mov	r1, r6
	str	r8, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [r4, #8]
	ldr	r0, [r4]
	bl	device_create
	mov	r1, r5
	str	r0, [r4, #72]
	mov	r0, r8
	bl	proc_mkdir
	mov	r1, r0
	str	r0, [r4, #76]
	cbz	r0, .L162
	cmn	r0, #4096
	bls	.L163
.L162:
	ldr	r2, .L182+20
	mov	r1, #432
	ldr	r0, .L182+24
	bl	printk
	movs	r3, #0
	str	r3, [r4, #76]
	b	.L157
.L163:
	ldr	r0, .L182+28
	bl	proc_mkdir
	mov	r2, r0
	str	r0, [r4, #80]
	cbz	r0, .L164
	cmn	r0, #4096
	bls	.L165
.L164:
	ldr	r2, .L182+28
	movw	r1, #439
	ldr	r0, .L182+24
	bl	printk
	movs	r3, #0
	str	r3, [r4, #80]
	b	.L157
.L165:
	ldr	r3, .L182+32
	mov	r1, #292
	str	r5, [sp]
	ldr	r0, .L182+36
	bl	proc_create_single_data
	ldr	r1, [r4, #76]
	ldr	r0, .L182+40
	bl	proc_mkdir
	mov	r2, r0
	str	r0, [r4, #84]
	cbz	r0, .L166
	cmn	r0, #4096
	bls	.L167
.L166:
	ldr	r2, .L182+40
	movw	r1, #451
	ldr	r0, .L182+24
	bl	printk
	movs	r3, #0
	str	r3, [r4, #84]
	b	.L157
.L167:
	str	r5, [sp]
	mov	r1, #292
	ldr	r3, .L182+44
	ldr	r0, .L182+48
	bl	proc_create_single_data
	b	.L157
.L168:
	mvn	r5, #11
	b	.L157
.L183:
	.align	2
.L182:
	.word	.LANCHOR0+12
	.word	.LC42
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC43
	.word	.LC47
	.word	.LC48
	.word	venc_proc_debug
	.word	.LC49
	.word	.LC50
	.word	rkvenc_show_pp_info
	.word	.LC51
	.word	.LANCHOR2
	.fnend
	.size	vcodec_probe, .-vcodec_probe
	.align	1
	.global	get_mpidev_ops
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpidev_ops, %function
get_mpidev_ops:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, .L192
	ldr	r3, [r4, #4]
	cbnz	r3, .L185
	movw	r1, #577
	ldr	r0, .L192+4
	bl	printk
.L185:
	ldr	r3, [r4, #4]
	ldr	r3, [r3, #36]
	cbz	r3, .L187
	blx	r3
	cmp	r0, #40
	beq	.L187
	movw	r1, #581
	ldr	r0, .L192+8
	bl	printk
	movw	r1, #582
	ldr	r3, .L192+12
	ldr	r2, .L192+16
	ldr	r0, .L192+20
	str	r1, [sp]
	bl	printk
.L187:
	ldr	r0, [r4, #4]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L193:
	.align	2
.L192:
	.word	.LANCHOR0
	.word	.LC52
	.word	.LC53
	.word	.LANCHOR2+128
	.word	.LC54
	.word	.LC55
	.fnend
	.size	get_mpidev_ops, .-get_mpidev_ops
	.align	1
	.global	get_mpibuf_ops
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_mpibuf_ops, %function
get_mpibuf_ops:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	ldr	r4, .L202
	ldr	r3, [r4, #8]
	cbnz	r3, .L195
	mov	r1, #592
	ldr	r0, .L202+4
	bl	printk
.L195:
	ldr	r3, [r4, #8]
	ldr	r3, [r3, #76]
	cbz	r3, .L197
	blx	r3
	cmp	r0, #80
	beq	.L197
	mov	r1, #596
	ldr	r0, .L202+8
	bl	printk
	movw	r1, #597
	ldr	r3, .L202+12
	ldr	r2, .L202+16
	ldr	r0, .L202+20
	str	r1, [sp]
	bl	printk
.L197:
	ldr	r0, [r4, #8]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L203:
	.align	2
.L202:
	.word	.LANCHOR0
	.word	.LC52
	.word	.LC56
	.word	.LANCHOR2+143
	.word	.LC54
	.word	.LC55
	.fnend
	.size	get_mpibuf_ops, .-get_mpibuf_ops
	.align	1
	.global	get_vsm_ops
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vsm_ops, %function
get_vsm_ops:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L205
	ldr	r0, [r3]
	bx	lr
.L206:
	.align	2
.L205:
	.word	.LANCHOR0
	.fnend
	.size	get_vsm_ops, .-get_vsm_ops
	.global	vcodec_fops
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
	.type	vcodec_fops, %object
	.size	vcodec_fops, 128
vcodec_fops:
	.space	36
	.word	vcodec_poll
	.word	vcodec_ioctl
	.space	12
	.word	vcodec_open
	.space	4
	.word	vcodec_close
	.space	60
	.type	__FUNCTION__.32894, %object
	.size	__FUNCTION__.32894, 15
__FUNCTION__.32894:
	.ascii	"get_mpidev_ops\000"
	.type	__FUNCTION__.32900, %object
	.size	__FUNCTION__.32900, 15
__FUNCTION__.32900:
	.ascii	"get_mpibuf_ops\000"
	.space	2
	.type	vcodec_dt_ids, %object
	.size	vcodec_dt_ids, 392
vcodec_dt_ids:
	.space	64
	.ascii	"rockchip,vcodec\000"
	.space	112
	.space	4
	.space	196
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	vcodec_driver, %object
	.size	vcodec_driver, 104
vcodec_driver:
	.word	vcodec_probe
	.word	vcodec_remove
	.space	12
	.word	.LC43
	.space	20
	.word	vcodec_dt_ids
	.space	48
	.space	8
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vsm_buf_ops, %object
	.size	vsm_buf_ops, 4
vsm_buf_ops:
	.space	4
	.type	mpidev_ops, %object
	.size	mpidev_ops, 4
mpidev_ops:
	.space	4
	.type	mpibuf_ops, %object
	.size	mpibuf_ops, 4
mpibuf_ops:
	.space	4
	.type	__key.32854, %object
	.size	__key.32854, 0
__key.32854:
	.section	.exitcall.exit,"aw"
	.align	2
	.type	__exitcall_vcodec_exit, %object
	.size	__exitcall_vcodec_exit, 4
__exitcall_vcodec_exit:
	.word	vcodec_exit
	.section	.initcall6.init,"aw"
	.align	2
	.type	__initcall__kmod_mpp_vcodec__210_649_vcodec_init6, %object
	.size	__initcall__kmod_mpp_vcodec__210_649_vcodec_init6, 4
__initcall__kmod_mpp_vcodec__210_649_vcodec_init6:
	.word	vcodec_init
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_license209, %object
	.size	__UNIQUE_ID_license209, 23
__UNIQUE_ID_license209:
	.ascii	"mpp_vcodec.license=GPL\000"
	.type	__UNIQUE_ID_file208, %object
	.size	__UNIQUE_ID_file208, 40
__UNIQUE_ID_file208:
	.ascii	"mpp_vcodec.file=drivers/kmpp/mpp_vcodec\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0016mpp_vcodec: %d: vsm_buf_register_function ok\000"
.LC1:
	.ascii	"\0016mpp_vcodec: exit\012\000"
.LC2:
	.ascii	"remove device\012\000"
.LC3:
	.ascii	"\012--------venc thread status---------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC4:
	.ascii	"run_cnt\000"
.LC5:
	.ascii	"last_runing\000"
.LC6:
	.ascii	"%15s|%15s|%15s\012\000"
.LC7:
	.ascii	"que_cnt\000"
.LC8:
	.ascii	"%15lld|%15lld|%15lld\012\000"
.LC9:
	.ascii	"\012--------venc chn runing status-----------------"
	.ascii	"---------------------------------------------------"
	.ascii	"\012\000"
.LC10:
	.ascii	"runing\000"
.LC11:
	.ascii	"ID\000"
.LC12:
	.ascii	"%8s|%8s|%10s|%10s|%10s|%10s|%10s|%14s|%15s|%15s|%11"
	.ascii	"s\012\000"
.LC13:
	.ascii	"queue_size\000"
.LC14:
	.ascii	"last_cb_end\000"
.LC15:
	.ascii	"last_cb_start\000"
.LC16:
	.ascii	"cb_gap_time\000"
.LC17:
	.ascii	"gap_time\000"
.LC18:
	.ascii	"strm_out\000"
.LC19:
	.ascii	"strm_cnt\000"
.LC20:
	.ascii	"cfg_gap\000"
.LC21:
	.ascii	"combo_run\000"
.LC22:
	.ascii	"%8d|%8u|%10u|%10u|%10u|%10u|%10u|%14u|%15llu|%15llu"
	.ascii	"%11u\012\000"
.LC23:
	.ascii	"pkt_total_cnt\000"
.LC24:
	.ascii	"%8s|%15s|%15s|%15s|%15s|%15s|%15s|%15s\012\000"
.LC25:
	.ascii	"seq_encoding\000"
.LC26:
	.ascii	"seq_encoded\000"
.LC27:
	.ascii	"seq_user_put\000"
.LC28:
	.ascii	"seq_user_get\000"
.LC29:
	.ascii	"pkt_user_put\000"
.LC30:
	.ascii	"pkt_user_get\000"
.LC31:
	.ascii	"%8d|%15u|%15u|%15u|%15llu|%15llu|%15llu|%15llu\012\000"
.LC32:
	.ascii	"\0016mpp_vcodec: init new\012\000"
.LC33:
	.ascii	"\0013mpp_service_driver device register failed (%d)"
	.ascii	".\012\000"
.LC34:
	.ascii	"\0013Platform device register failed (%d).\012\000"
.LC35:
	.ascii	"\0013mpp_vcodec: %d: ctx %p\012\000"
.LC36:
	.ascii	"\0013mpp_vcodec: %d: chl_id %d release request\000"
.LC37:
	.ascii	"\0013mpp_vcodec: %d: kernel vcodec_attr define is d"
	.ascii	"iff from user \012\000"
.LC38:
	.ascii	"\0013mpp_vcodec: %d: copy_to_user failed.\012\000"
.LC39:
	.ascii	"\0013mpp_vcodec: %d: unknown vcode req cmd %x\012\000"
.LC40:
	.ascii	"\0013mpp_vcodec: %d: unknown ioctl cmd %x\012\000"
.LC41:
	.ascii	"\0013mpp_vcodec: %d: chan id ctx is null\012\000"
.LC42:
	.ascii	"vcodec_class\000"
.LC43:
	.ascii	"vcodec\000"
.LC44:
	.ascii	"alloc dev_t failed\012\000"
.LC45:
	.ascii	"add device failed\012\000"
.LC46:
	.ascii	"%s\000"
.LC47:
	.ascii	"\0013mpp_vcodec: %d: failed on open procfs %s\012\000"
.LC48:
	.ascii	"enc\000"
.LC49:
	.ascii	"venc_info\000"
.LC50:
	.ascii	"pp\000"
.LC51:
	.ascii	"pp_info\000"
.LC52:
	.ascii	"\0013mpp_vcodec: %d: should call vmpi_register_fn2v"
	.ascii	"cocdec \012\000"
.LC53:
	.ascii	"\0013mpp_vcodec: %d: struct vcodec_mpidev_fn mismat"
	.ascii	"ch!\012\000"
.LC54:
	.ascii	"0\000"
.LC55:
	.ascii	"\0013mpp_vcodec: %d: Assertion %s failed at %s:%d\012"
	.ascii	"\000"
.LC56:
	.ascii	"\0013mpp_vcodec: %d: struct vcodec_mpibuf_fn mismat"
	.ascii	"ch!\012\000"
	.section	___ksymtab+vmpi_register_fn2vcocdec,"a"
	.align	2
	.type	__ksymtab_vmpi_register_fn2vcocdec, %object
	.size	__ksymtab_vmpi_register_fn2vcocdec, 12
__ksymtab_vmpi_register_fn2vcocdec:
	.word	vmpi_register_fn2vcocdec
	.word	__kstrtab_vmpi_register_fn2vcocdec
	.word	__kstrtabns_vmpi_register_fn2vcocdec
	.section	___ksymtab+vmpi_unregister_fn2vcocdec,"a"
	.align	2
	.type	__ksymtab_vmpi_unregister_fn2vcocdec, %object
	.size	__ksymtab_vmpi_unregister_fn2vcocdec, 12
__ksymtab_vmpi_unregister_fn2vcocdec:
	.word	vmpi_unregister_fn2vcocdec
	.word	__kstrtab_vmpi_unregister_fn2vcocdec
	.word	__kstrtabns_vmpi_unregister_fn2vcocdec
	.section	___ksymtab+vsm_buf_register_fn2vcocdec,"a"
	.align	2
	.type	__ksymtab_vsm_buf_register_fn2vcocdec, %object
	.size	__ksymtab_vsm_buf_register_fn2vcocdec, 12
__ksymtab_vsm_buf_register_fn2vcocdec:
	.word	vsm_buf_register_fn2vcocdec
	.word	__kstrtab_vsm_buf_register_fn2vcocdec
	.word	__kstrtabns_vsm_buf_register_fn2vcocdec
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
