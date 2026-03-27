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
	.file	"mpp_service.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_mpp_service_driver:					
	.asciz 	"mpp_service_driver"					
__kstrtabns_mpp_service_driver:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_remove, %function
mpp_service_remove:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	adds	r0, r0, #16
	ldr	r4, [r0, #64]
	movs	r6, #0
	ldr	r1, .L24
	mov	r8, r6
	bl	_dev_info
	add	r7, r4, #116
.L2:
	ldr	r3, [r4, #112]
	cmp	r3, r6
	bhi	.L4
	add	r5, r4, #88
	add	r6, r4, #100
	movs	r7, #0
.L6:
	cbz	r4, .L5
	ldr	r0, [r5]
	cbz	r0, .L5
	bl	platform_driver_unregister
	str	r7, [r5]
.L5:
	adds	r5, r5, #4
	cmp	r5, r6
	bne	.L6
	mov	r5, r4
	ldr	r1, [r4, #8]
	ldr	r0, [r5], #12
	bl	device_destroy
	mov	r0, r5
	bl	cdev_del
	movs	r1, #1
	ldr	r0, [r4, #8]
	bl	unregister_chrdev_region
	ldr	r0, [r4]
	bl	class_destroy
	ldr	r0, [r4, #76]
	cbz	r0, .L7
	bl	proc_remove
	movs	r3, #0
	str	r3, [r4, #76]
.L7:
	ldr	r3, .L24+4
	movs	r0, #0
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, pc}
.L4:
	ldr	r5, [r7], #4
	cbz	r5, .L3
	ldr	r3, [r5, #28]
	cbz	r3, .L3
	mov	r0, r5
	bl	kthread_flush_worker
	ldr	r0, [r5, #28]
	bl	kthread_stop
	str	r8, [r5, #28]
.L3:
	adds	r6, r6, #1
	b	.L2
.L25:
	.align	2
.L24:
	.word	.LC0
	.word	g_srv
	.fnend
	.size	mpp_service_remove, .-mpp_service_remove
	.text
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_show_support_device, %function
mpp_show_support_device:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r1, .L40
	movs	r4, #0
	ldr	r6, [r0, #64]
	bl	seq_puts
	ldr	r7, .L40+4
	ldr	r8, .L40+12
	ldr	r9, .L40+16
.L29:
	ldr	r3, [r6, #80]
	lsrs	r3, r3, r4
	lsls	r3, r3, #31
	bpl	.L27
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, #3
	sbc	r3, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r3, r3, r4
	add	r3, r6, r3, lsl #2
	ldr	r10, [r3, #100]
	cmp	r10, #0
	beq	.L27
	ldr	r3, [r7, r4, lsl #2]
	mov	r2, r4
	mov	r1, r8
	mov	r0, r5
	bl	seq_printf
	ldr	r3, [r10, #4]
	ldr	r3, [r3, #4]
	ldr	r2, [r3, #8]
	cbz	r2, .L28
	ldr	r1, .L40+8
	mov	r0, r5
	bl	seq_printf
.L28:
	mov	r1, r9
	mov	r0, r5
	bl	seq_puts
.L27:
	adds	r4, r4, #1
	cmp	r4, #3
	bne	.L29
	movs	r0, #0
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L41:
	.align	2
.L40:
	.word	.LC1
	.word	mpp_device_name
	.word	.LC3
	.word	.LC2
	.word	.LC4
	.fnend
	.size	mpp_show_support_device, .-mpp_show_support_device
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_show_support_cmd, %function
mpp_show_support_cmd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r1, .L43
	bl	seq_puts
	mov	r0, r4
	movs	r2, #0
	ldr	r1, .L43+4
	bl	seq_printf
	ldr	r5, .L43+8
	mov	r0, r4
	movs	r2, #1
	ldr	r1, .L43+12
	bl	seq_printf
	mov	r0, r4
	movs	r2, #2
	ldr	r1, .L43+16
	bl	seq_printf
	movs	r2, #3
	mov	r0, r4
	ldr	r1, .L43+20
	bl	seq_printf
	mov	r1, r5
	mov	r0, r4
	bl	seq_puts
	mov	r0, r4
	mov	r2, #256
	ldr	r1, .L43+24
	bl	seq_printf
	mov	r0, r4
	mov	r2, #258
	ldr	r1, .L43+28
	bl	seq_printf
	movw	r2, #259
	mov	r0, r4
	ldr	r1, .L43+32
	bl	seq_printf
	mov	r1, r5
	mov	r0, r4
	bl	seq_puts
	mov	r0, r4
	mov	r2, #512
	ldr	r1, .L43+36
	bl	seq_printf
	mov	r0, r4
	movw	r2, #513
	ldr	r1, .L43+40
	bl	seq_printf
	mov	r0, r4
	movw	r2, #514
	ldr	r1, .L43+44
	bl	seq_printf
	movw	r2, #517
	mov	r0, r4
	ldr	r1, .L43+48
	bl	seq_printf
	mov	r1, r5
	mov	r0, r4
	bl	seq_puts
	mov	r0, r4
	mov	r2, #768
	ldr	r1, .L43+52
	bl	seq_printf
	movw	r2, #769
	mov	r0, r4
	ldr	r1, .L43+56
	bl	seq_printf
	mov	r1, r5
	mov	r0, r4
	bl	seq_puts
	mov	r0, r4
	mov	r2, #1024
	ldr	r1, .L43+60
	bl	seq_printf
	mov	r0, r4
	movw	r2, #1025
	ldr	r1, .L43+64
	bl	seq_printf
	mov	r0, r4
	movw	r2, #1026
	ldr	r1, .L43+68
	bl	seq_printf
	mov	r0, r4
	movw	r2, #1027
	ldr	r1, .L43+72
	bl	seq_printf
	mov	r0, r4
	movw	r2, #1031
	ldr	r1, .L43+76
	bl	seq_printf
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L44:
	.align	2
.L43:
	.word	.LC5
	.word	.LC6
	.word	.LC10
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.fnend
	.size	mpp_show_support_cmd, .-mpp_show_support_cmd
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_show_version, %function
mpp_show_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r2, .L46
	ldr	r1, .L46+4
	bl	seq_printf
	movs	r0, #0
	pop	{r3, pc}
.L47:
	.align	2
.L46:
	.word	.LANCHOR0
	.word	.LC25
	.fnend
	.size	mpp_show_version, .-mpp_show_version
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_show_session_summary, %function
mpp_show_session_summary:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r0
	ldr	r4, [r0, #64]
	add	r6, r4, #144
	mov	r0, r6
	bl	mutex_lock
	ldr	r0, [r4, #156]!
	ldr	r5, [r0], #-40
	subs	r5, r5, #40
.L49:
	add	r3, r0, #40
	cmp	r3, r4
	bne	.L51
	mov	r0, r6
	bl	mutex_unlock
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L51:
	ldr	r3, [r0, #56]
	cbz	r3, .L50
	ldr	r3, [r0, #12]
	cbz	r3, .L50
	ldr	r3, [r3, #12]
	ldr	r3, [r3, #60]
	cbz	r3, .L50
	mov	r1, r7
	blx	r3
.L50:
	ldr	r3, [r5, #40]
	mov	r0, r5
	sub	r5, r3, #40
	b	.L49
	.fnend
	.size	mpp_show_session_summary, .-mpp_show_session_summary
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_service_probe, %function
mpp_service_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r6, r0, #16
	.pad #28
	sub	sp, sp, #28
	mov	r5, r0
	mov	r0, r6
	bl	mpp_dev_of_node
	ldr	r2, .L99
	ldr	r1, .L99+4
	movs	r3, #95
	mov	r8, r0
	mov	r0, r6
	str	r3, [sp, #20]
	bl	_dev_info
	ldr	r1, .L99+8
	mov	r0, r6
	bl	_dev_info
	mov	r2, #3520
	movs	r1, #168
	mov	r0, r6
	bl	devm_kmalloc
	mov	r4, r0
	cmp	r0, #0
	beq	.L79
	movs	r7, #0
	str	r6, [r0, #4]
	str	r7, [r0, #84]
	str	r0, [r5, #80]
	mov	r0, r7
	ldr	r2, .L99+12
	ldr	r1, .L99+16
	bl	__class_create
	cmn	r0, #4096
	str	r0, [r4]
	bls	.L63
	cbz	r0, .L63
	mov	r5, r0
.L61:
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L63:
	add	r2, r4, #112
	str	r7, [sp]
	movs	r3, #1
	ldr	r1, .L99+20
	mov	r0, r8
	bl	of_property_read_variable_u32_array
	ldr	r2, [r4, #112]
	cmp	r2, #3
	bls	.L80
	ldr	r1, .L99+24
	movs	r3, #3
.L98:
	mov	r0, r6
	mvn	r5, #21
	bl	_dev_err
	b	.L61
.L67:
	mov	r0, r6
	bl	mpp_taskqueue_init
	mov	r7, r0
	cbz	r0, .L65
	mov	r2, r9
	mov	r1, r10
	bl	__kthread_init_worker
	mov	r3, fp
	mov	r2, #-1
	mov	r1, r7
	ldr	r0, .L99+28
	str	r5, [sp]
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r3, r0
	bhi	.L66
	str	r0, [sp, #12]
	bl	wake_up_process
	ldr	r3, [sp, #12]
.L66:
	str	r3, [r7, #28]
	mov	r0, r3
	add	r2, sp, #20
	movs	r1, #1
	bl	sched_setscheduler
	add	r3, r4, #116
	str	r7, [r3, r5, lsl #2]
.L65:
	adds	r5, r5, #1
.L64:
	ldr	r3, [r4, #112]
	cmp	r3, r5
	bhi	.L67
	add	r2, r4, #128
	movs	r5, #0
	movs	r3, #1
	str	r5, [sp]
	ldr	r1, .L99+32
	mov	r0, r8
	bl	of_property_read_variable_u32_array
	ldr	r2, [r4, #128]
	cmp	r2, #3
	bls	.L68
	movs	r3, #3
	ldr	r1, .L99+36
	b	.L98
.L80:
	movs	r5, #0
	ldr	r9, .L99+12
	ldr	r10, .L99+116
	ldr	fp, .L99+120
	b	.L64
.L68:
	cbz	r2, .L69
	ldr	r8, .L99+12
	ldr	r9, .L99+124
.L71:
	mov	r2, #3520
	movs	r1, #36
	mov	r0, r6
	bl	devm_kmalloc
	mov	r7, r0
	cbz	r0, .L70
	mov	r2, r8
	mov	r1, r9
	adds	r0, r0, #4
	bl	__init_rwsem
	add	r3, r4, #132
	str	r7, [r3, r5, lsl #2]
.L70:
	ldr	r3, [r4, #128]
	adds	r5, r5, #1
	cmp	r3, r5
	bhi	.L71
.L69:
	ldr	r8, .L99+44
	movs	r2, #1
	movs	r1, #0
	add	r0, r4, #8
	ldr	r9, [r4, #4]
	mov	r3, r8
	bl	alloc_chrdev_region
	mov	r5, r0
	cbz	r0, .L72
	ldr	r1, .L99+40
.L97:
	mov	r0, r9
	bl	_dev_err
	mov	r0, r6
	ldr	r2, .L99+44
	ldr	r1, .L99+48
	bl	_dev_err
	ldr	r0, [r4]
	bl	class_destroy
	b	.L61
.L72:
	ldr	r10, .L99+128
	add	r7, r4, #12
	mov	r0, r7
	mov	r1, r10
	bl	cdev_init
	strd	r5, r10, [r4, #48]
	movs	r2, #1
	ldr	r1, [r4, #8]
	mov	r0, r7
	bl	cdev_add
	mov	r5, r0
	cbz	r0, .L74
	movs	r1, #1
	ldr	r0, [r4, #8]
	bl	unregister_chrdev_region
	ldr	r1, .L99+52
	b	.L97
.L74:
	ldr	r3, .L99+56
	mov	r1, r9
	str	r8, [sp, #4]
	str	r3, [sp]
	mov	r3, r0
	ldr	r2, [r4, #8]
	ldr	r0, [r4]
	bl	device_create
	ldr	r2, .L99+12
	ldr	r1, .L99+60
	str	r0, [r4, #72]
	add	r0, r4, #144
	bl	__mutex_init
	add	r3, r4, #156
	mov	r1, r5
	str	r3, [r4, #156]
	str	r3, [r4, #160]
	mov	r0, r8
	bl	proc_mkdir
	mov	r2, r0
	str	r0, [r4, #76]
	cbz	r0, .L75
	cmn	r0, #4096
	bls	.L76
.L75:
	ldr	r3, .L99+44
	movs	r2, #210
	ldr	r1, .L99+64
	ldr	r0, .L99+68
	bl	printk
	movs	r3, #0
	str	r3, [r4, #76]
.L77:
	ldr	r7, .L99+72
	movs	r1, #0
	mov	r0, r7
	bl	__platform_driver_register
	cbnz	r0, .L78
	str	r7, [r4, #92]
.L78:
	ldr	r1, .L99+76
	mov	r0, r6
	bl	_dev_info
	ldr	r3, .L99+80
	str	r4, [r3]
	b	.L61
.L76:
	str	r5, [sp]
	mov	r1, #292
	ldr	r3, .L99+84
	ldr	r0, .L99+88
	bl	proc_create_single_data
	ldr	r3, .L99+92
	mov	r1, #292
	ldr	r0, .L99+96
	str	r4, [sp]
	ldr	r2, [r4, #76]
	bl	proc_create_single_data
	ldr	r3, .L99+100
	mov	r1, #292
	ldr	r0, .L99+104
	str	r5, [sp]
	ldr	r2, [r4, #76]
	bl	proc_create_single_data
	ldr	r3, .L99+108
	mov	r1, #292
	ldr	r0, .L99+112
	str	r4, [sp]
	ldr	r2, [r4, #76]
	bl	proc_create_single_data
	b	.L77
.L79:
	mvn	r5, #11
	b	.L61
.L100:
	.align	2
.L99:
	.word	.LANCHOR0
	.word	.LC25
	.word	.LC26
	.word	.LANCHOR1
	.word	.LC27
	.word	.LC28
	.word	.LC29
	.word	kthread_worker_fn
	.word	.LC32
	.word	.LC33
	.word	.LC36
	.word	.LC35
	.word	.LC46
	.word	.LC37
	.word	.LC38
	.word	.LC39
	.word	.LANCHOR0+41
	.word	.LC40
	.word	rockchip_rkvenc500_driver
	.word	.LC45
	.word	g_srv
	.word	mpp_show_version
	.word	.LC41
	.word	mpp_show_session_summary
	.word	.LC42
	.word	mpp_show_support_cmd
	.word	.LC43
	.word	mpp_show_support_device
	.word	.LC44
	.word	.LC30
	.word	.LC31
	.word	.LC34
	.word	rockchip_mpp_fops
	.fnend
	.size	mpp_service_probe, .-mpp_service_probe
	.global	mpp_service_driver
	.global	mpp_dev_debug
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	mpp_version, %object
	.size	mpp_version, 41
mpp_version:
	.ascii	"unknown mpp version for missing VCS info\000"
	.type	__func__.36868, %object
	.size	__func__.36868, 16
__func__.36868:
	.ascii	"mpp_procfs_init\000"
	.space	3
	.type	mpp_dt_ids, %object
	.size	mpp_dt_ids, 392
mpp_dt_ids:
	.space	64
	.ascii	"rockchip,mpp-service\000"
	.space	107
	.space	4
	.space	196
	.type	__param_str_mpp_dev_debug, %object
	.size	__param_str_mpp_dev_debug, 24
__param_str_mpp_dev_debug:
	.ascii	"rk_vcodec.mpp_dev_debug\000"
	.data
	.align	2
	.type	mpp_service_driver, %object
	.size	mpp_service_driver, 104
mpp_service_driver:
	.word	mpp_service_probe
	.word	mpp_service_remove
	.space	12
	.word	.LC35
	.space	20
	.word	mpp_dt_ids
	.space	48
	.space	8
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	__key.36882, %object
	.size	__key.36882, 0
__key.36882:
	.type	__key.36885, %object
	.size	__key.36885, 0
__key.36885:
	.type	__key.36894, %object
	.size	__key.36894, 0
__key.36894:
	.type	__key.36899, %object
	.size	__key.36899, 0
__key.36899:
	.type	mpp_dev_debug, %object
	.size	mpp_dev_debug, 4
mpp_dev_debug:
	.space	4
	.section	.modinfo,"a"
	.type	__UNIQUE_ID_mpp_dev_debug225, %object
	.size	__UNIQUE_ID_mpp_dev_debug225, 66
__UNIQUE_ID_mpp_dev_debug225:
	.ascii	"rk_vcodec.parm=mpp_dev_debug:bit switch for mpp deb"
	.ascii	"ug information\000"
	.type	__UNIQUE_ID_mpp_dev_debugtype224, %object
	.size	__UNIQUE_ID_mpp_dev_debugtype224, 38
__UNIQUE_ID_mpp_dev_debugtype224:
	.ascii	"rk_vcodec.parmtype=mpp_dev_debug:uint\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"remove device\012\000"
.LC1:
	.ascii	"---- SUPPORT DEVICES ----\012\000"
.LC2:
	.ascii	"DEVICE[%2d]:%-10s\000"
.LC3:
	.ascii	"HW_ID:0x%08x\000"
.LC4:
	.ascii	"\012\000"
.LC5:
	.ascii	"------------- SUPPORT CMD -------------\012\000"
.LC6:
	.ascii	"QUERY_HW_SUPPORT:     0x%08x\012\000"
.LC7:
	.ascii	"QUERY_HW_ID:          0x%08x\012\000"
.LC8:
	.ascii	"QUERY_CMD_SUPPORT:    0x%08x\012\000"
.LC9:
	.ascii	"QUERY_BUTT:           0x%08x\012\000"
.LC10:
	.ascii	"----\012\000"
.LC11:
	.ascii	"INIT_CLIENT_TYPE:     0x%08x\012\000"
.LC12:
	.ascii	"INIT_TRANS_TABLE:     0x%08x\012\000"
.LC13:
	.ascii	"INIT_BUTT:            0x%08x\012\000"
.LC14:
	.ascii	"SET_REG_WRITE:        0x%08x\012\000"
.LC15:
	.ascii	"SET_REG_READ:         0x%08x\012\000"
.LC16:
	.ascii	"SET_REG_ADDR_OFFSET:  0x%08x\012\000"
.LC17:
	.ascii	"SEND_BUTT:            0x%08x\012\000"
.LC18:
	.ascii	"POLL_HW_FINISH:       0x%08x\012\000"
.LC19:
	.ascii	"POLL_BUTT:            0x%08x\012\000"
.LC20:
	.ascii	"RESET_SESSION:        0x%08x\012\000"
.LC21:
	.ascii	"TRANS_FD_TO_IOVA:     0x%08x\012\000"
.LC22:
	.ascii	"RELEASE_FD:           0x%08x\012\000"
.LC23:
	.ascii	"SEND_CODEC_INFO:      0x%08x\012\000"
.LC24:
	.ascii	"CONTROL_BUTT:         0x%08x\012\000"
.LC25:
	.ascii	"%s\012\000"
.LC26:
	.ascii	"probe start\012\000"
.LC27:
	.ascii	"mpp_class\000"
.LC28:
	.ascii	"rockchip,taskqueue-count\000"
.LC29:
	.ascii	"rockchip,taskqueue-count %d must less than %d\012\000"
.LC30:
	.ascii	"(&queue->worker)->lock\000"
.LC31:
	.ascii	"queue_work%d\000"
.LC32:
	.ascii	"rockchip,resetgroup-count\000"
.LC33:
	.ascii	"rockchip,resetgroup-count %d must less than %d\012\000"
.LC34:
	.ascii	"&group->rw_sem\000"
.LC35:
	.ascii	"mpp_service\000"
.LC36:
	.ascii	"alloc dev_t failed\012\000"
.LC37:
	.ascii	"add device failed\012\000"
.LC38:
	.ascii	"%s\000"
.LC39:
	.ascii	"&srv->session_lock\000"
.LC40:
	.ascii	"\0013rk_vcodec: %s:%d: failed on mkdir /proc/%s\012"
	.ascii	"\000"
.LC41:
	.ascii	"version\000"
.LC42:
	.ascii	"sessions-summary\000"
.LC43:
	.ascii	"supports-cmd\000"
.LC44:
	.ascii	"supports-device\000"
.LC45:
	.ascii	"probe success\012\000"
.LC46:
	.ascii	"register %s device\012\000"
	.section	___ksymtab+mpp_service_driver,"a"
	.align	2
	.type	__ksymtab_mpp_service_driver, %object
	.size	__ksymtab_mpp_service_driver, 12
__ksymtab_mpp_service_driver:
	.word	mpp_service_driver
	.word	__kstrtab_mpp_service_driver
	.word	__kstrtabns_mpp_service_driver
	.section	__param,"a"
	.align	2
	.type	__param_mpp_dev_debug, %object
	.size	__param_mpp_dev_debug, 20
__param_mpp_dev_debug:
	.word	__param_str_mpp_dev_debug
	.word	0
	.word	param_ops_uint
	.short	420
	.byte	-1
	.byte	0
	.word	mpp_dev_debug
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
