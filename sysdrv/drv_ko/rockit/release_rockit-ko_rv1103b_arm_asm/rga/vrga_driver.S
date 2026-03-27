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
	.file	"vrga_driver.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_create_ctx:					
	.asciz 	"vrga_create_ctx"					
__kstrtabns_vrga_create_ctx:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_destroy_ctx:					
	.asciz 	"vrga_destroy_ctx"					
__kstrtabns_vrga_destroy_ctx:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rga_do_tde:					
	.asciz 	"rga_do_tde"					
__kstrtabns_rga_do_tde:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rga_do_normal:					
	.asciz 	"rga_do_normal"					
__kstrtabns_rga_do_normal:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rga_od_osd:					
	.asciz 	"rga_od_osd"					
__kstrtabns_rga_od_osd:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_filter_ctx_create:					
	.asciz 	"vrga_filter_ctx_create"					
__kstrtabns_vrga_filter_ctx_create:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_filter_ctx_destroy:					
	.asciz 	"vrga_filter_ctx_destroy"					
__kstrtabns_vrga_filter_ctx_destroy:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_filter_init:					
	.asciz 	"vrga_filter_init"					
__kstrtabns_vrga_filter_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vrga_filter_deinit:					
	.asciz 	"vrga_filter_deinit"					
__kstrtabns_vrga_filter_deinit:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rga_do_tde
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rga_do_tde, %function
rga_do_tde:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #-1
	bx	lr
	.fnend
	.size	rga_do_tde, .-rga_do_tde
	.align	1
	.global	vrga_filter_ctx_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_filter_ctx_create, %function
vrga_filter_ctx_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_filter_ctx_create, .-vrga_filter_ctx_create
	.align	1
	.global	vrga_filter_ctx_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_filter_ctx_destroy, %function
vrga_filter_ctx_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_filter_ctx_destroy, .-vrga_filter_ctx_destroy
	.align	1
	.global	vrga_filter_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_filter_init, %function
vrga_filter_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_filter_init, .-vrga_filter_init
	.align	1
	.global	vrga_destroy_ctx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_destroy_ctx, %function
vrga_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L6
	bl	kfree
.L6:
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vrga_destroy_ctx, .-vrga_destroy_ctx
	.align	1
	.global	vrga_filter_deinit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_filter_deinit, %function
vrga_filter_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_filter_deinit, .-vrga_filter_deinit
	.align	1
	.global	vrga_create_ctx
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_create_ctx, %function
vrga_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, #3520
	ldr	r3, .L16
	ldr	r0, [r3, #36]
	bl	kmem_cache_alloc
	cbz	r0, .L11
	movs	r3, #0
	movs	r2, #1
	str	r3, [r0, #16]
	strd	r3, r2, [r0, #4]
	add	r3, r0, #324
	str	r3, [r0, #324]
	str	r3, [r0, #328]
.L11:
	pop	{r3, pc}
.L17:
	.align	2
.L16:
	.word	kmalloc_caches
	.fnend
	.size	vrga_create_ctx, .-vrga_create_ctx
	.align	1
	.global	rga_od_osd
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rga_od_osd, %function
rga_od_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r0
	.pad #116
	sub	sp, sp, #116
	cmp	r0, #0
	beq	.L37
	cmp	r1, #0
	beq	.L37
	ldr	r4, [r1, #96]
	cmp	r4, #0
	beq	.L37
	ldr	r7, .L66
	movs	r2, #32
	movs	r1, #0
	add	r0, sp, #48
	bl	rkos_memset
	mov	r1, #3520
	ldr	r0, [r7, #20]
	bl	kmem_cache_alloc
	str	r0, [sp, #72]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	fp, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r5, [r8, #128]
	ldr	r10, .L66+16
	subs	r5, r5, #4
.L20:
	adds	r3, r5, #4
	add	r2, r8, #128
	cmp	r3, r2
	bne	.L34
	movs	r6, #0
	b	.L33
.L34:
	ldr	r3, [r5, #12]
	ldr	r3, [r3, #1756]
	cmp	r3, #0
	beq	.L21
	add	ip, sp, #48
	add	r6, sp, #80
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1, r2, r3}
	stm	r6, {r0, r1, r2, r3}
	cmp	r5, #0
	bne	.L22
.L65:
	mov	r6, #-1
.L23:
	ldr	r3, [r5, #12]
	movs	r0, #0
	ldr	r1, [r4, #484]
	ldr	r2, [r3, #1756]
	str	r1, [sp, #20]
	ldr	r1, [r4]
	str	r1, [sp, #16]
	ldr	r1, [r2, #484]
	str	r1, [sp, #12]
	movs	r1, #2
	ldr	r2, [r2]
	str	r2, [sp, #8]
	ldr	r3, [r3, #1760]
	ldr	r2, .L66+4
	ldr	r3, [r3]
	str	r3, [sp, #4]
	movw	r3, #519
	str	r3, [sp]
	ldr	r3, .L66+8
	bl	vlog
.L33:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, fp	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8, #44]
	movs	r1, #5
	ldr	r2, [r4, #44]
	movs	r0, #0
	str	r2, [sp, #20]
	ldr	r2, [r4]
	strd	r3, r2, [sp, #12]
	ldr	r3, [r8]
	ldr	r2, .L66+12
	strd	r6, r3, [sp, #4]
	movw	r3, #526
	str	r3, [sp]
	ldr	r3, .L66+8
	bl	vlog
	ldr	r0, [sp, #72]
	cbz	r0, .L18
	bl	kfree
.L18:
	mov	r0, r6
	add	sp, sp, #116
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L67:
	.align	2
.L66:
	.word	kmalloc_caches
	.word	.LC4
	.word	.LANCHOR0+31
	.word	.LC5
	.word	.LANCHOR0
.L22:
	mov	r1, #3520
	ldr	r0, [r7, #20]
	bl	kmem_cache_alloc
	mov	r1, #3520
	str	r0, [sp, #92]
	ldr	r0, [r7, #20]
	bl	kmem_cache_alloc
	mov	r1, #3520
	str	r0, [sp, #96]
	ldr	r0, [r7, #20]
	bl	kmem_cache_alloc
	ldr	r3, [sp, #92]
	str	r0, [sp, #100]
	cmp	r3, #0
	beq	.L25
	ldr	r2, [sp, #96]
	cmp	r2, #0
	beq	.L25
	cmp	r0, #0
	beq	.L25
	ldr	r2, [r5, #12]
	ldr	r6, [r2, #1756]
	cmp	r6, #0
	beq	.L27
	ldr	r2, [r2, #1760]
	mov	r9, #0
	ldr	r1, [r4, #484]
	ldr	r0, [r6, #484]
	ldr	r2, [r2, #92]
	str	r1, [sp, #80]
	strd	r0, r1, [sp, #84]
	str	r2, [sp, #108]
	ldr	r2, [r5, #28]
	str	r2, [r3]
	ldr	r3, [sp, #92]
	ldr	r2, [r5, #32]
	str	r2, [r3, #4]
	ldr	r3, [sp, #92]
	ldr	r2, [r6, #668]
	str	r2, [r3, #8]
	ldr	r3, [sp, #92]
	ldr	r2, [r6, #672]
	str	r2, [r3, #12]
	ldr	r3, [sp, #92]
	ldr	r2, [r4, #676]
	str	r2, [r3, #20]
	ldr	r2, [r4, #680]
	str	r2, [r3, #24]
	ldr	r0, [r4, #688]
	bl	pixel_format_rk_to_rga
	ldr	r3, [sp, #92]
	str	r0, [r3, #16]
	ldr	r0, [r4, #696]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #92]
	str	r0, [r3, #28]
	str	r0, [sp, #44]
	movs	r0, #0
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L68
	str	r3, [sp, #16]
	ldr	r3, [sp, #108]
	str	r3, [sp, #12]
	ldr	r3, [r4, #484]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #277
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	ldr	r3, [sp, #96]
	str	r9, [r3]
	ldr	r3, [sp, #96]
	str	r9, [r3, #4]
	ldr	r3, [sp, #96]
	ldr	r2, [r6, #668]
	str	r2, [r3, #8]
	ldr	r3, [sp, #96]
	ldr	r2, [r6, #672]
	str	r2, [r3, #12]
	ldr	r3, [sp, #96]
	ldr	r2, [r6, #676]
	str	r2, [r3, #20]
	ldr	r2, [r6, #680]
	str	r2, [r3, #24]
	ldr	r0, [r6, #688]
	bl	pixel_format_rk_to_rga
	movs	r2, #1
	movs	r1, #5
	ldr	r3, [sp, #96]
	str	r0, [r3, #16]
	mov	r0, r9
	ldr	r3, [sp, #96]
	str	r2, [r3, #28]
	str	r2, [sp, #44]
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L68+4
	str	r3, [sp, #16]
	ldr	r3, [sp, #108]
	str	r3, [sp, #12]
	ldr	r3, [r6, #484]
	str	r3, [sp, #8]
	ldr	r3, [r6]
	str	r3, [sp, #4]
	mov	r3, #294
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	ldr	r2, [r5, #28]
	ldr	r3, [sp, #100]
	str	r2, [r3]
	ldr	r3, [sp, #100]
	ldr	r2, [r5, #32]
	str	r2, [r3, #4]
	ldr	r3, [sp, #100]
	ldr	r2, [r6, #668]
	str	r2, [r3, #8]
	ldr	r3, [sp, #100]
	ldr	r2, [r6, #672]
	str	r2, [r3, #12]
	ldr	r3, [sp, #100]
	ldr	r2, [r4, #676]
	str	r2, [r3, #20]
	ldr	r3, [sp, #100]
	ldr	r2, [r4, #680]
	str	r2, [r3, #24]
	ldr	r0, [r4, #688]
	bl	pixel_format_rk_to_rga
	ldr	r3, [sp, #100]
	str	r0, [r3, #16]
	ldr	r0, [r4, #696]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #100]
	str	r0, [r3, #28]
	str	r0, [sp, #44]
	mov	r0, r9
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L68+8
	str	r3, [sp, #16]
	ldr	r3, [sp, #108]
	str	r3, [sp, #12]
	ldr	r3, [r4, #484]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #313
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	add	r0, sp, #80
	bl	rga_mpi_commit
	mov	r6, r0
	ldr	r0, [sp, #92]
	cbnz	r0, .L28
.L29:
	ldr	r0, [sp, #96]
	cbz	r0, .L31
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #96]
.L31:
	ldr	r0, [sp, #100]
	cbz	r0, .L32
	bl	kfree
.L32:
	cmp	r6, #0
	bne	.L23
.L21:
	ldr	r5, [r5, #4]
	subs	r5, r5, #4
	b	.L20
.L27:
	mov	r0, r3
	bl	kfree
	ldr	r0, [sp, #96]
	str	r6, [sp, #92]
	cbz	r0, .L30
	bl	kfree
	str	r6, [sp, #96]
.L30:
	ldr	r0, [sp, #100]
	cbz	r0, .L25
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #100]
.L25:
	mov	r3, #486
	ldr	r2, .L68+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L68+16
	movs	r0, #0
	bl	vlog
	b	.L65
.L28:
	bl	kfree
	str	r9, [sp, #92]
	b	.L29
.L37:
	mov	r6, #-1
	b	.L18
.L69:
	.align	2
.L68:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LANCHOR0+24
	.fnend
	.size	rga_od_osd, .-rga_od_osd
	.global	__aeabi_uidivmod
	.align	1
	.global	rga_do_normal
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rga_do_normal, %function
rga_do_normal:
	.fnstart
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #112
	sub	sp, sp, #112
	ldr	r4, .L178
	mov	r6, r0
	movs	r2, #32
	mov	r5, r1
	add	r0, sp, #80
	movs	r1, #0
	bl	rkos_memset
	mov	r1, #3520
	ldr	r0, [r4, #20]
	bl	kmem_cache_alloc
	ldr	r7, [r6, #316]
	str	r0, [sp, #104]
	cmp	r7, #0
	beq	.L76
	ldrd	r2, r3, [r7, #8]
	cmp	r2, r3
	bne	.L72
.L75:
	ldrd	r2, r3, [r7, #16]
	cmp	r2, r3
	bne	.L73
.L74:
	ldr	r7, [sp, #92]
	cmp	r5, #0
	beq	.L77
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L77
	ldr	r8, [r3, #316]
	cmp	r8, #0
	beq	.L77
	ldr	r4, [r5, #96]
	cmp	r4, #0
	beq	.L77
	ldr	r2, [r5, #100]
	cmp	r2, #0
	beq	.L77
	ldr	r1, [r4, #484]
	ldr	r2, [r2, #484]
	ldr	r3, [r3, #92]
	str	r1, [sp, #80]
	movs	r1, #0
	str	r2, [sp, #88]
	str	r1, [sp, #84]
	str	r3, [sp, #108]
	cmp	r7, #0
	beq	.L78
	movs	r1, #5
	ldr	r0, [r8, #12]
	bl	__aeabi_uidivmod
	add	r1, r8, r1, lsl #5
	ldr	r3, [r1, #28]
	cmp	r3, #0
	beq	.L79
	ldrd	r2, r3, [r1, #32]
	cmp	r2, #0
	bne	.L80
	str	r3, [sp, #64]
	add	r0, sp, #48
	ldr	r3, [r1, #40]
	str	r3, [sp, #68]
	ldr	r3, [r1, #44]
	str	r3, [sp, #72]
	ldr	r3, [r1, #48]
	add	r1, sp, #64
	str	r3, [sp, #76]
	ldrd	r2, r3, [r4, #668]
	bl	crop_rect_ratio_to_abs
	ldr	r3, [sp, #92]
	ldr	r2, [sp, #48]
	str	r2, [r3]
	ldr	r3, [sp, #92]
	ldr	r2, [sp, #52]
	str	r2, [r3, #4]
	ldr	r3, [sp, #92]
	ldr	r2, [sp, #56]
	str	r2, [r3, #8]
	ldr	r2, [sp, #60]
.L173:
	ldr	r3, [sp, #92]
	str	r2, [r3, #12]
	ldr	r3, [sp, #92]
	ldr	r2, [r4, #676]
	str	r2, [r3, #20]
	ldr	r2, [r4, #680]
	str	r2, [r3, #24]
	ldr	r0, [r4, #688]
	bl	pixel_format_rk_to_rga
	ldr	r3, [sp, #92]
	str	r0, [r3, #16]
	ldr	r0, [r4, #696]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #92]
	str	r0, [r3, #28]
	movs	r0, #0
	ldr	r3, [r8, #12]
	adds	r3, r3, #1
	str	r3, [r8, #12]
	ldr	r3, [sp, #92]
	ldr	r2, [r3, #28]
	str	r2, [sp, #44]
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L178+4
	str	r3, [sp, #16]
	ldr	r3, [sp, #108]
	str	r3, [sp, #12]
	ldr	r3, [r4, #484]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movs	r3, #121
	str	r3, [sp]
	ldr	r3, .L178+8
	bl	vlog
.L78:
	ldr	r3, [r5, #84]
	cmp	r3, #0
	bne	.L172
.L83:
	ldr	r0, [sp, #92]
	cmp	r0, #0
	bne	.L177
.L85:
	ldr	r0, [sp, #100]
	cbz	r0, .L76
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #100]
	b	.L76
.L72:
	mov	r1, #3520
	ldr	r0, [r4, #20]
	bl	kmem_cache_alloc
	str	r0, [sp, #92]
	cmp	r0, #0
	bne	.L75
.L76:
	ldr	r3, [r6]
	movs	r1, #2
	ldr	r2, .L178+12
	movs	r0, #0
	mov	r4, #-1
	str	r3, [sp, #4]
	movw	r3, #417
	str	r3, [sp]
	ldr	r3, .L178+16
	bl	vlog
.L70:
	mov	r0, r4
	add	sp, sp, #112
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L73:
	ldr	r0, [r4, #20]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	str	r0, [sp, #100]
	cmp	r0, #0
	bne	.L74
	ldr	r0, [sp, #92]
	cmp	r0, #0
	beq	.L76
	bl	kfree
	str	r4, [sp, #92]
	b	.L76
.L80:
	str	r3, [r7]
	ldr	r3, [sp, #92]
	ldr	r2, [r1, #40]
	str	r2, [r3, #4]
	ldr	r3, [sp, #92]
	ldr	r2, [r1, #44]
	str	r2, [r3, #8]
	ldr	r2, [r1, #48]
	b	.L173
.L79:
	str	r3, [r7]
	ldr	r2, [sp, #92]
	str	r3, [r2, #4]
	ldr	r3, [sp, #92]
	ldr	r2, [r4, #668]
	str	r2, [r3, #8]
	ldr	r2, [r4, #672]
	b	.L173
.L77:
	cmp	r7, #0
	beq	.L85
	mov	r0, r7
.L177:
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #92]
	b	.L85
.L179:
	.align	2
.L178:
	.word	kmalloc_caches
	.word	.LC6
	.word	.LANCHOR0+42
	.word	.LC8
	.word	.LANCHOR0+94
.L172:
	ldr	r4, [r3, #316]
	cmp	r4, #0
	beq	.L83
	ldr	r9, [r5, #96]
	cmp	r9, #0
	beq	.L83
	ldr	r8, [r5, #100]
	cmp	r8, #0
	beq	.L83
	ldr	r2, [r9, #484]
	movs	r7, #0
	ldr	r3, [r3, #92]
	ldr	r10, [sp, #100]
	str	r2, [sp, #80]
	ldr	r2, [r8, #484]
	str	r7, [sp, #84]
	str	r3, [sp, #108]
	str	r2, [sp, #88]
	cmp	r10, #0
	beq	.L84
	ldr	r0, [r4, #20]
	movs	r1, #5
	bl	__aeabi_uidivmod
	str	r7, [r10]
	ldr	r3, [sp, #100]
	str	r7, [r3, #4]
	movs	r3, #28
	mla	r1, r3, r1, r4
	ldr	r3, [sp, #100]
	ldr	r2, [r1, #188]
	str	r2, [r3, #8]
	ldr	r3, [sp, #100]
	ldr	r2, [r1, #192]
	str	r2, [r3, #12]
	ldr	r3, [sp, #100]
	ldr	r2, [r1, #196]
	str	r2, [r3, #20]
	ldr	r3, [sp, #100]
	ldr	r2, [r1, #200]
	str	r2, [r3, #24]
	ldr	r0, [r1, #204]
	bl	pixel_format_rk_to_rga
	ldr	r3, [sp, #100]
	str	r0, [r3, #16]
	ldr	r0, [r9, #696]
	bl	compress_mode_rk_to_rga
	movs	r1, #5
	ldr	r3, [sp, #100]
	str	r0, [r3, #28]
	mov	r0, r7
	ldr	r3, [r4, #20]
	adds	r3, r3, #1
	str	r3, [r4, #20]
	ldr	r3, [sp, #100]
	ldr	r2, [r3, #28]
	str	r2, [sp, #44]
	ldr	r2, [r3, #16]
	str	r2, [sp, #40]
	ldr	r2, [r3, #24]
	str	r2, [sp, #36]
	ldr	r2, [r3, #20]
	str	r2, [sp, #32]
	ldr	r2, [r3, #12]
	str	r2, [sp, #28]
	ldr	r2, [r3, #8]
	str	r2, [sp, #24]
	ldr	r2, [r3, #4]
	str	r2, [sp, #20]
	ldr	r3, [r3]
	ldr	r2, .L180
	str	r3, [sp, #16]
	ldr	r3, [sp, #108]
	str	r3, [sp, #12]
	ldr	r3, [r8, #484]
	str	r3, [sp, #8]
	ldr	r3, [r8]
	str	r3, [sp, #4]
	movs	r3, #179
	str	r3, [sp]
	ldr	r3, .L180+4
	bl	vlog
.L84:
	add	r0, sp, #80
	bl	rga_mpi_commit
	mov	r4, r0
	cbz	r0, .L87
	ldr	r3, [r6]
	movs	r1, #2
	ldr	r2, .L180+8
	movs	r0, #0
	str	r3, [sp, #4]
	mov	r3, #424
	str	r3, [sp]
	ldr	r3, .L180+12
	bl	vlog
.L87:
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L175
	cmp	r4, #0
	bne	.L89
	ldrd	r2, r1, [r5, #96]
	mov	r0, r4
	ldr	r3, [r3, #92]
	str	r3, [sp, #24]
	ldr	r3, [r1, #484]
	str	r3, [sp, #20]
	ldr	r3, [r1]
	movs	r1, #5
	str	r3, [sp, #16]
	ldr	r3, [r2, #484]
	str	r3, [sp, #12]
	ldr	r3, [r2]
	ldr	r2, .L180+16
	str	r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	mov	r3, #382
	str	r3, [sp]
	ldr	r3, .L180+20
	bl	vlog
	ldr	r3, [r5, #84]
	cmp	r3, #0
	beq	.L101
	ldr	r6, [r5, #96]
	cmp	r6, #0
	beq	.L101
	ldr	r5, [r5, #100]
	cmp	r5, #0
	beq	.L101
	ldr	r3, [sp, #104]
	ldr	r2, [r3, #8]
	str	r2, [r5, #668]
	ldr	r2, [r3, #12]
	str	r2, [r5, #672]
	ldr	r2, [r3, #20]
	str	r2, [r5, #676]
	ldr	r2, [r3, #24]
	str	r2, [r5, #680]
	ldr	r0, [r3, #16]
	bl	pixel_format_rga_to_rk
	ldr	r3, [sp, #104]
	str	r0, [r5, #688]
	ldr	r0, [r3, #28]
	bl	compress_mode_rga_to_rk
	str	r0, [r5, #696]
	ldr	r2, [r6, #716]
	ldr	r3, [sp, #104]
	str	r2, [r5, #716]
	ldrd	r0, [r6, #720]
	strd	r0, [r5, #720]
	strd	r0, [sp, #40]
	movs	r1, #5
	str	r2, [sp, #36]
	mov	r0, r4
	ldr	r2, [r3, #28]
	str	r2, [sp, #32]
	ldr	r2, [r3, #16]
	str	r2, [sp, #28]
	ldr	r2, [r3, #24]
	str	r2, [sp, #24]
	ldr	r2, [r3, #20]
	str	r2, [sp, #20]
	ldr	r2, [r3, #12]
	str	r2, [sp, #16]
	ldr	r3, [r3, #8]
	ldr	r2, .L180+24
	str	r3, [sp, #12]
	ldr	r3, [r5, #484]
	str	r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	movs	r3, #219
	str	r3, [sp]
	ldr	r3, .L180+28
	bl	vlog
	ldr	r3, [r6, #44]
	ldr	r2, [r5, #44]
	movs	r1, #5
	mov	r0, r4
	strd	r3, r2, [sp, #4]
	movs	r3, #221
	ldr	r2, .L180+32
	str	r3, [sp]
	ldr	r3, .L180+28
	bl	vlog
.L90:
	ldr	r0, [sp, #92]
	cbz	r0, .L91
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #92]
.L91:
	ldr	r0, [sp, #100]
	cbz	r0, .L92
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #100]
.L92:
	adds	r4, r4, #1
	mov	r4, #-1
	it	ne
	movne	r4, #0
.L93:
	ldr	r0, [sp, #104]
	cmp	r0, #0
	beq	.L70
	bl	kfree
	b	.L70
.L101:
	mov	r4, #-1
	b	.L90
.L89:
	ldr	r0, [sp, #92]
	cbz	r0, .L94
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #92]
.L94:
	ldr	r0, [sp, #100]
	cbnz	r0, .L95
.L175:
	mov	r4, #-1
	b	.L93
.L95:
	bl	kfree
	movs	r3, #0
	str	r3, [sp, #100]
	b	.L175
.L181:
	.align	2
.L180:
	.word	.LC7
	.word	.LANCHOR0+68
	.word	.LC9
	.word	.LANCHOR0+94
	.word	.LC10
	.word	.LANCHOR0+108
	.word	.LC11
	.word	.LANCHOR0+123
	.word	.LC12
	.fnend
	.size	rga_do_normal, .-rga_do_normal
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vrga_driver_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_driver_init, %function
vrga_driver_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	vrga_driver_init, .-vrga_driver_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vrga_driver_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_driver_exit, %function
vrga_driver_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.fnend
	.size	vrga_driver_exit, .-vrga_driver_exit
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.37101, %object
	.size	__func__.37101, 24
__func__.37101:
	.ascii	"vrgn_set_osd_frame_info\000"
	.type	__func__.37145, %object
	.size	__func__.37145, 7
__func__.37145:
	.ascii	"do_osd\000"
	.type	__func__.37171, %object
	.size	__func__.37171, 11
__func__.37171:
	.ascii	"rga_od_osd\000"
	.type	__func__.37058, %object
	.size	__func__.37058, 26
__func__.37058:
	.ascii	"vrga_set_rga_job_src_info\000"
	.type	__func__.37068, %object
	.size	__func__.37068, 26
__func__.37068:
	.ascii	"vrga_set_rga_job_dst_info\000"
	.type	__func__.37123, %object
	.size	__func__.37123, 14
__func__.37123:
	.ascii	"rga_do_normal\000"
	.type	__func__.37116, %object
	.size	__func__.37116, 15
__func__.37116:
	.ascii	"rga_normal_end\000"
	.type	__func__.37076, %object
	.size	__func__.37076, 24
__func__.37076:
	.ascii	"vrga_set_dst_frame_info\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"src buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), \011\011\011\011vw(%d), vh(%d), pf(0x%x)"
	.ascii	", cp(%d)\000"
.LC1:
	.ascii	"pat buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d),\011\011\011\011vw(%d), vh(%d), pf(0x%x),"
	.ascii	" cp(%d)\000"
.LC2:
	.ascii	"dst buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), vw(%d), \011\011\011\011vh(%d), pf(0x%x)"
	.ascii	", cp(%d)\000"
.LC3:
	.ascii	"\033[1;31mrga prepare osd is failed\033[0m\000"
.LC4:
	.ascii	"\033[1;31mrga(%d) (osd_buf %d: %p->src_buf %d: %p) "
	.ascii	"err!\033[0m\000"
.LC5:
	.ascii	"rga handle osd finish ret:%d ! node(%d ref:%d) src_"
	.ascii	"buf(%d ref:%d)\000"
.LC6:
	.ascii	"src buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), vw(%d), vh(%d), pf(0x%x), cp(%d)\000"
.LC7:
	.ascii	"dst buf(%d: %p), rga: ctx_id(%d), x(%d), y(%d), w(%"
	.ascii	"d), h(%d), vw(%d), vh(%d), pf(0x%x), cp(%d)\000"
.LC8:
	.ascii	"\033[1;31mrga_node_id:%d prepare rga job is failed\033"
	.ascii	"[0m\000"
.LC9:
	.ascii	"\033[1;31mrga_node_id:%d commit rga job is failed\033"
	.ascii	"[0m\000"
.LC10:
	.ascii	"vrga job(%d) done, buf(%d: %p->%d: %p), nick_id(%d)"
	.ascii	"\000"
.LC11:
	.ascii	"dst buf(%d: %p), rga: w(%d), h(%d), vw(%d), vh(%d),"
	.ascii	" pf(0x%x), cp(%d), seq(%d), pts(%lld)\000"
.LC12:
	.ascii	"src_ref(%d), dst_ref(%d)\000"
	.section	___ksymtab_gpl+rga_do_normal,"a"
	.align	2
	.type	__ksymtab_rga_do_normal, %object
	.size	__ksymtab_rga_do_normal, 12
__ksymtab_rga_do_normal:
	.word	rga_do_normal
	.word	__kstrtab_rga_do_normal
	.word	__kstrtabns_rga_do_normal
	.section	___ksymtab_gpl+rga_do_tde,"a"
	.align	2
	.type	__ksymtab_rga_do_tde, %object
	.size	__ksymtab_rga_do_tde, 12
__ksymtab_rga_do_tde:
	.word	rga_do_tde
	.word	__kstrtab_rga_do_tde
	.word	__kstrtabns_rga_do_tde
	.section	___ksymtab_gpl+rga_od_osd,"a"
	.align	2
	.type	__ksymtab_rga_od_osd, %object
	.size	__ksymtab_rga_od_osd, 12
__ksymtab_rga_od_osd:
	.word	rga_od_osd
	.word	__kstrtab_rga_od_osd
	.word	__kstrtabns_rga_od_osd
	.section	___ksymtab_gpl+vrga_create_ctx,"a"
	.align	2
	.type	__ksymtab_vrga_create_ctx, %object
	.size	__ksymtab_vrga_create_ctx, 12
__ksymtab_vrga_create_ctx:
	.word	vrga_create_ctx
	.word	__kstrtab_vrga_create_ctx
	.word	__kstrtabns_vrga_create_ctx
	.section	___ksymtab_gpl+vrga_destroy_ctx,"a"
	.align	2
	.type	__ksymtab_vrga_destroy_ctx, %object
	.size	__ksymtab_vrga_destroy_ctx, 12
__ksymtab_vrga_destroy_ctx:
	.word	vrga_destroy_ctx
	.word	__kstrtab_vrga_destroy_ctx
	.word	__kstrtabns_vrga_destroy_ctx
	.section	___ksymtab_gpl+vrga_filter_ctx_create,"a"
	.align	2
	.type	__ksymtab_vrga_filter_ctx_create, %object
	.size	__ksymtab_vrga_filter_ctx_create, 12
__ksymtab_vrga_filter_ctx_create:
	.word	vrga_filter_ctx_create
	.word	__kstrtab_vrga_filter_ctx_create
	.word	__kstrtabns_vrga_filter_ctx_create
	.section	___ksymtab_gpl+vrga_filter_ctx_destroy,"a"
	.align	2
	.type	__ksymtab_vrga_filter_ctx_destroy, %object
	.size	__ksymtab_vrga_filter_ctx_destroy, 12
__ksymtab_vrga_filter_ctx_destroy:
	.word	vrga_filter_ctx_destroy
	.word	__kstrtab_vrga_filter_ctx_destroy
	.word	__kstrtabns_vrga_filter_ctx_destroy
	.section	___ksymtab_gpl+vrga_filter_deinit,"a"
	.align	2
	.type	__ksymtab_vrga_filter_deinit, %object
	.size	__ksymtab_vrga_filter_deinit, 12
__ksymtab_vrga_filter_deinit:
	.word	vrga_filter_deinit
	.word	__kstrtab_vrga_filter_deinit
	.word	__kstrtabns_vrga_filter_deinit
	.section	___ksymtab_gpl+vrga_filter_init,"a"
	.align	2
	.type	__ksymtab_vrga_filter_init, %object
	.size	__ksymtab_vrga_filter_init, 12
__ksymtab_vrga_filter_init:
	.word	vrga_filter_init
	.word	__kstrtab_vrga_filter_init
	.word	__kstrtabns_vrga_filter_init
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
