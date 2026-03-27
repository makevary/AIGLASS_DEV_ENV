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
	.file	"mpp_iommu.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	mpp_dma_alloc
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dma_alloc, %function
mpp_dma_alloc:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L7
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r7, r0
	.pad #20
	sub	sp, sp, #20
	mov	r5, r1
	ldr	r0, [r3, #24]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbz	r0, .L1
	addw	r5, r5, #4095
	movs	r3, #0
	bic	r5, r5, #4080
	str	r3, [sp]
	bic	r5, r5, #15
	mov	r3, #3264
	add	r2, sp, #12
	mov	r0, r7
	mov	r1, r5
	bl	dma_alloc_attrs
	mov	r6, r0
	str	r0, [r4, #36]
	cbnz	r0, .L3
	mov	r0, r4
	mov	r4, r6
	bl	kfree
.L1:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L3:
	ldr	r3, [sp, #12]
	str	r5, [r4, #32]
	str	r7, [r4, #56]
	str	r3, [r4, #28]
	b	.L1
.L8:
	.align	2
.L7:
	.word	kmalloc_caches
	.fnend
	.size	mpp_dma_alloc, .-mpp_dma_alloc
	.align	1
	.global	mpp_dma_free
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dma_free, %function
mpp_dma_free:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	.save {r4, r5, lr}
	.pad #12
	mov	r4, r0
	movs	r5, #0
	str	r5, [sp]
	ldr	r3, [r0, #28]
	ldrd	r1, r2, [r0, #32]
	ldr	r0, [r0, #56]
	bl	dma_free_attrs
	mov	r0, r4
	str	r5, [r4, #36]
	strd	r5, r5, [r4, #28]
	str	r5, [r4, #56]
	bl	kfree
	mov	r0, r5
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, pc}
	.fnend
	.size	mpp_dma_free, .-mpp_dma_free
	.align	1
	.global	mpp_dma_get_iova
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_dma_get_iova, %function
mpp_dma_get_iova:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r0
	bl	dma_buf_attach
	cmn	r0, #4096
	mov	r5, r0
	bls	.L11
	mov	r3, r4
	movs	r2, #77
	ldr	r1, .L15
	ldr	r0, .L15+4
	bl	printk
.L14:
	mov	r6, #-1
.L10:
	mov	r0, r6
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L11:
	movs	r1, #0
	bl	dma_buf_map_attachment
	cmn	r0, #4096
	mov	r1, r0
	bls	.L13
	movs	r3, #0
	movs	r2, #84
	str	r3, [sp]
	mov	r3, r4
	ldr	r1, .L15
	ldr	r0, .L15+8
	bl	printk
	mov	r1, r5
	mov	r0, r4
	bl	dma_buf_detach
	b	.L14
.L13:
	ldr	r3, [r0]
	movs	r2, #0
	mov	r0, r5
	ldr	r6, [r3, #12]
	bl	dma_buf_unmap_attachment
	mov	r1, r5
	mov	r0, r4
	bl	dma_buf_detach
	b	.L10
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC1
	.fnend
	.size	mpp_dma_get_iova, .-mpp_dma_get_iova
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__func__.34380, %object
	.size	__func__.34380, 17
__func__.34380:
	.ascii	"mpp_dma_get_iova\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s:%d: dma_buf_attach dmabuf %p failed\012\000"
.LC1:
	.ascii	"\0013%s:%d: dma_buf_map_attachment dmabuf %p failed"
	.ascii	" ret %d\012\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
