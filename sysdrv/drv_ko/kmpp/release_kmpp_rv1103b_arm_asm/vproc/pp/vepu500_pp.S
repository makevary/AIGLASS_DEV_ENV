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
	.file	"vepu500_pp.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_register_vmpibuf_func_to_pp:					
	.asciz 	"register_vmpibuf_func_to_pp"					
__kstrtabns_register_vmpibuf_func_to_pp:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_unregister_vmpibuf_func_pp:					
	.asciz 	"unregister_vmpibuf_func_pp"					
__kstrtabns_unregister_vmpibuf_func_pp:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_create_chn:					
	.asciz 	"vepu_pp_create_chn"					
__kstrtabns_vepu_pp_create_chn:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_destroy_chn:					
	.asciz 	"vepu_pp_destroy_chn"					
__kstrtabns_vepu_pp_destroy_chn:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vepu_pp_control:					
	.asciz 	"vepu_pp_control"					
__kstrtabns_vepu_pp_control:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	IS_ERR_OR_NULL, %function
IS_ERR_OR_NULL:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cbz	r0, .L3
	cmn	r0, #4096
	ite	ls
	movls	r0, #0
	movhi	r0, #1
	bx	lr
.L3:
	movs	r0, #1
	bx	lr
	.fnend
	.size	IS_ERR_OR_NULL, .-IS_ERR_OR_NULL
	.align	1
	.global	register_vmpibuf_func_to_pp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	register_vmpibuf_func_to_pp, %function
register_vmpibuf_func_to_pp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	str	r0, [r3]
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.fnend
	.size	register_vmpibuf_func_to_pp, .-register_vmpibuf_func_to_pp
	.align	1
	.global	unregister_vmpibuf_func_pp
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	unregister_vmpibuf_func_pp, %function
unregister_vmpibuf_func_pp:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	movs	r2, #0
	str	r2, [r3]
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.fnend
	.size	unregister_vmpibuf_func_pp, .-unregister_vmpibuf_func_pp
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	get_vmpibuf_func, %function
get_vmpibuf_func:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r3, .L15
	ldr	r3, [r3]
	mov	r0, r3
	bl	IS_ERR_OR_NULL
	cbz	r0, .L10
	ldr	r1, .L15+4
	ldr	r0, .L15+8
	bl	printk
	mvn	r3, #11
.L10:
	mov	r0, r3
	pop	{r3, pc}
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	.LC0
	.fnend
	.size	get_vmpibuf_func, .-get_vmpibuf_func
	.align	1
	.global	vepu_pp_control
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_control, %function
vepu_pp_control:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #7
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, r0
	.pad #44
	sub	sp, sp, #44
	mov	r5, r2
	ble	.L18
	mov	r3, r0
	mov	r2, #364
	ldr	r1, .L76
	ldr	r0, .L76+4
	bl	printk
	mov	r0, #-1
.L17:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L18:
	mov	r8, #168
	ldr	r3, .L76+8
	mul	r8, r8, r0
	cmp	r1, #16
	add	fp, r3, #4
	mov	r7, r3
	add	r4, fp, r8
	beq	.L20
	cmp	r1, #32
	beq	.L21
	cmp	r1, #48
	beq	.L22
	cmp	r1, #17
	bne	.L23
	add	r1, r3, r8
	ldr	r3, [r2]
	str	r3, [r1, #8]
	ldr	r3, [r2, #4]
	str	r3, [r1, #12]
	ldr	r3, [r2, #16]
	str	r3, [r1, #24]
	ldr	r3, [r2, #20]
	str	r3, [r1, #28]
	movs	r3, #0
	strd	r3, r3, [r1, #32]
.L24:
	movs	r0, #0
	b	.L17
.L20:
	add	r1, r3, r8
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	ldr	fp, [r2, #8]
	ldr	ip, [r2]
	orr	r3, r3, #1
	ldr	r2, [r2, #12]
	cmp	fp, #0
	ldr	r0, [r1, #32]
	strb	r3, [r4, #44]
	mov	r3, #0
	str	r3, [r4, #48]
	it	eq
	moveq	fp, #30
	ldrb	r3, [r4, #72]	@ zero_extendqisi2
	cmp	r2, #0
	ldrh	lr, [r4, #80]
	bic	r3, r3, #7
	it	eq
	moveq	r2, #1
	orr	r3, r3, #6
	strb	r3, [r4, #72]
	ldr	r3, [r1, #8]
	cmp	ip, #0
	add	r3, r3, #7
	lsr	r3, r3, #3
	add	r3, r3, #-1
	bfi	lr, r3, #0, #11
	strh	lr, [r4, #80]	@ movhi
	ldr	r3, [r1, #12]
	ldrh	lr, [r4, #82]
	add	r3, r3, #7
	lsr	r3, r3, #3
	add	r3, r3, #-1
	bfi	lr, r3, #0, #11
	strh	lr, [r4, #82]	@ movhi
	ldrb	lr, [r4, #88]	@ zero_extendqisi2
	ldr	r3, [r5, #4]
	bfi	lr, r3, #2, #4
	ldr	r3, [r4, #84]
	strb	lr, [r4, #88]
	it	le
	movle	lr, #0
	bic	r3, r3, #4128831
	str	r3, [r4, #84]
	ldr	r3, [r4, #92]
	it	gt
	movgt	lr, #1
	and	r3, r3, #-1073692672
	str	r3, [r4, #92]
	ldr	r1, [r1, #24]
	cbz	r1, .L27
	cmp	r0, #0
	ite	eq
	moveq	r1, lr
	movne	r1, #0
.L27:
	ldrb	r3, [r4, #146]	@ zero_extendqisi2
	bfi	r3, r1, #0, #1
	bfc	r3, #1, #1
	strb	r3, [r4, #146]
	movs	r3, #168
	mla	r3, r3, r6, r7
	ldr	r1, [r3, #28]
	cbz	r1, .L28
	clz	r1, r0
	lsrs	r1, r1, #5
.L28:
	str	r2, [sp, #12]
	cmp	ip, #0
	ldrb	r3, [r4, #146]	@ zero_extendqisi2
	bfi	r3, r1, #6, #1
	ldr	r1, .L76+12
	bfi	r3, lr, #7, #1
	strb	r3, [r4, #146]
	ldrb	r3, [r4, #147]	@ zero_extendqisi2
	orn	r3, r3, #126
	strb	r3, [r4, #147]
	ldr	r3, .L76+16
	str	r3, [r4, #108]
	ldr	r3, [r4, #112]
	and	r3, r3, #-16777216
	orr	r3, r3, #131072
	orr	r3, r3, #54
	str	r3, [r4, #112]
	ldr	r3, [r4, #116]
	and	r1, r1, r3
	ldr	r3, [r4, #120]
	orr	r1, r1, #64
	str	r1, [r4, #116]
	ite	gt
	movgt	r1, #1
	movle	r1, #2
	bfi	r3, r1, #15, #2
	movs	r1, #168
	mla	r1, r1, r6, r7
	str	r3, [r4, #120]
	ldrb	r3, [r4, #127]	@ zero_extendqisi2
	bfc	r3, #7, #1
	strb	r3, [r4, #127]
	ldr	r3, [r1, #8]
	ldr	r8, [r1, #12]
	str	r3, [sp, #8]
	bl	get_vmpibuf_func
	ldr	r1, [r0, #24]
	ldrd	r3, r2, [sp, #8]
	cbz	r1, .L30
	ldr	r0, [r5, #20]
	strd	r2, r3, [sp, #8]
	blx	r1
	ldrd	r2, r3, [sp, #8]
	mov	r10, r0
.L30:
	ldr	r1, [r5, #4]
	cmp	r1, #6
	beq	.L31
	cmp	r1, #7
	bne	.L32
	mul	r8, r8, r3
	add	r9, r8, r10
	add	r1, r9, r8, lsr #2
	str	r1, [sp]
	lsrs	r1, r3, #1
	str	r1, [sp, #4]
.L32:
	ldr	r1, [sp]
	strd	r10, r9, [r4, #52]
	str	r1, [r4, #60]
	ldr	r1, [r4, #96]
	bfi	r1, r3, #0, #21
	str	r1, [r4, #96]
	ldr	r3, [sp, #4]
	strh	r3, [r4, #100]	@ movhi
	ldr	r3, [r5]
	tst	r3, #1
	mov	r3, #168
	mla	r3, r3, r6, r7
	itete	eq
	ldreq	r1, [r3, #40]
	ldrne	r1, [r3, #44]
	ldreq	r1, [r1, #8]
	ldrne	r1, [r1, #8]
	itete	eq
	streq	r1, [r4, #64]
	strne	r1, [r4, #64]
	ldreq	r3, [r3, #44]
	ldrne	r3, [r3, #40]
	ldr	r3, [r3, #8]
	str	r3, [r4, #68]
	movs	r3, #168
	mla	r0, r3, r6, r7
	mla	r6, r3, r6, r7
	ldr	r1, [r0, #32]
	ldr	r3, [r6, #36]
	adds	r1, r1, #1
	cmp	r1, r2
	it	ne
	strne	r1, [r0, #32]
	add	r3, r3, #1
	itt	eq
	moveq	r2, #0
	streq	r2, [r0, #32]
	cmp	r3, fp
	bne	.L37
	movs	r3, #0
.L37:
	str	r3, [r6, #36]
	b	.L24
.L31:
	mla	r9, r8, r3, r10
	strd	r9, r3, [sp]
	b	.L32
.L21:
	bl	get_vmpibuf_func
	ldr	r2, [r5, #4]
	ldrb	r3, [r4, #146]	@ zero_extendqisi2
	bfi	r3, r2, #2, #2
	and	r3, r3, #207
	strb	r3, [r4, #146]
	ldrh	r3, [r4, #148]
	ldr	r2, [r5, #8]
	bfi	r3, r2, #0, #12
	strh	r3, [r4, #148]	@ movhi
	ldr	r2, [r5, #12]
	ubfx	r3, r3, #8, #8
	bfi	r3, r2, #4, #3
	strb	r3, [r4, #149]
	ldrb	r3, [r4, #150]	@ zero_extendqisi2
	ldr	r2, [r5, #24]
	bfi	r3, r2, #0, #4
	strb	r3, [r4, #150]
	ldr	r2, [r5, #28]
	bfi	r3, r2, #4, #3
	strb	r3, [r4, #150]
	ldr	r3, [r5, #32]
	strb	r3, [r4, #151]
	movs	r3, #4
	strb	r3, [r4, #144]
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L24
	ldr	r0, [r5]
	blx	r3
	str	r0, [r4, #128]
	b	.L24
.L22:
	bl	get_vmpibuf_func
	movs	r3, #4
	strb	r3, [r4, #145]
	ldrh	r3, [r4, #152]
	ldr	r2, [r5, #4]
	bfi	r3, r2, #0, #12
	strh	r3, [r4, #152]	@ movhi
	ldr	r2, [r5, #16]
	ubfx	r3, r3, #8, #8
	bfi	r3, r2, #4, #3
	strb	r3, [r4, #153]
	ldr	r3, [r4, #152]
	ldr	r2, [r5, #20]
	bfi	r3, r2, #15, #14
	str	r3, [r4, #152]
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L24
	ldr	r0, [r5, #12]
	blx	r3
	str	r0, [r4, #132]
	b	.L24
.L77:
	.align	2
.L76:
	.word	.LANCHOR1+17
	.word	.LC1
	.word	.LANCHOR0
	.word	268427264
	.word	83012
.L23:
	cmp	r1, #96
	bne	.L39
	add	r2, r7, r8
	add	r3, r8, #44
	add	r3, r3, fp
	movs	r1, #112
	str	r3, [sp, #16]
	movs	r3, #0
	strd	r1, r3, [sp, #20]
	ldr	r3, [r2, #164]
	ldr	r3, [r3, #16]
	cbz	r3, .L40
	add	r1, sp, #16
	ldr	r0, [r2, #168]
	blx	r3
.L40:
	movs	r2, #4
	movs	r3, #0
	strd	r2, r3, [sp, #32]
	movs	r3, #168
	mla	r3, r3, r6, r7
	add	r1, r8, #156
	add	r1, r1, fp
	str	r1, [sp, #28]
	ldr	r2, [r3, #164]
	ldr	r2, [r2, #20]
	cbz	r2, .L41
	add	r1, sp, #28
	ldr	r0, [r3, #168]
	blx	r2
.L41:
	movs	r3, #168
	mla	r1, r3, r6, r7
	mov	r4, r3
	ldr	r2, [r1, #164]
	ldr	r2, [r2, #24]
	cbz	r2, .L42
	ldr	r0, [r1, #168]
	blx	r2
.L42:
	mla	r6, r4, r6, r7
	ldr	r3, [r6, #164]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L24
	ldr	r0, [r6, #168]
	blx	r3
	b	.L24
.L39:
	cmp	r1, #112
	ittt	eq
	addeq	r1, r3, r8
	ldreq	r3, [r1, #160]
	streq	r3, [r2, #4]
	b	.L24
	.fnend
	.size	vepu_pp_control, .-vepu_pp_control
	.section	.text.unlikely,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	pp_malloc_buffer, %function
pp_malloc_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r7, r1
	mov	r6, r0
	bl	get_vmpibuf_func
	mov	r5, r0
	movs	r0, #12
	bl	vmalloc
	mov	r4, r0
	bl	IS_ERR_OR_NULL
	cbz	r0, .L79
	movs	r2, #49
	ldr	r1, .L94
	ldr	r0, .L94+4
	mvn	r4, #11
	bl	printk
.L78:
	mov	r0, r4
	pop	{r3, r4, r5, r6, r7, pc}
.L79:
	ldr	r3, [r5, #72]
	cmp	r3, #0
	beq	.L78
	ldr	r1, .L94
	mov	r0, r7
	blx	r3
	str	r0, [r4]
	cmp	r0, #0
	beq	.L78
	ldr	r3, [r5, #20]
	cmp	r3, #0
	beq	.L78
	blx	r3
	str	r0, [r4, #4]
	ldr	r3, [r5, #24]
	cbz	r3, .L81
	ldr	r0, [r4]
	blx	r3
	str	r0, [r4, #8]
.L81:
	ldr	r3, [r4, #8]
	adds	r3, r3, #1
	bne	.L78
	ldr	r3, [r6, #160]
	movs	r2, #0
	ldr	r1, [r4, #4]
	ldr	r0, [r6, #164]
	ldr	r3, [r3, #32]
	blx	r3
	str	r0, [r4, #8]
	b	.L78
.L95:
	.align	2
.L94:
	.word	.LANCHOR1+33
	.word	.LC2
	.fnend
	.size	pp_malloc_buffer, .-pp_malloc_buffer
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	pp_free_buffer, %function
pp_free_buffer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r5, r0
	mov	r4, r1
	bl	get_vmpibuf_func
	mov	r6, r0
	cbz	r4, .L96
	ldr	r1, [r4, #4]
	cbz	r1, .L98
	ldr	r3, [r5, #160]
	ldr	r0, [r5, #164]
	ldr	r3, [r3, #36]
	blx	r3
.L98:
	ldr	r0, [r4]
	cbz	r0, .L99
	ldr	r3, [r6, #16]
	blx	r3
.L99:
	mov	r0, r4
	pop	{r4, r5, r6, lr}
	b	vfree
.L96:
	pop	{r4, r5, r6, pc}
	.fnend
	.size	pp_free_buffer, .-pp_free_buffer
	.align	1
	.global	vepu_pp_destroy_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_destroy_chn, %function
vepu_pp_destroy_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r2, r0
	mov	r6, r0
	ldr	r1, .L110
	ldr	r0, .L110+4
	bl	printk
	cmp	r6, #7
	ble	.L107
	mov	r3, r6
	movs	r2, #165
	ldr	r1, .L110+8
	ldr	r0, .L110+12
	bl	printk
	mov	r0, #-1
.L106:
	pop	{r4, r5, r6, pc}
.L107:
	movs	r2, #168
	ldr	r4, .L110+16
	mul	r3, r2, r6
	adds	r5, r4, #4
	add	r5, r5, r3
	add	r4, r4, r3
	mov	r0, r5
	ldr	r1, [r4, #40]
	bl	pp_free_buffer
	mov	r0, r5
	ldr	r1, [r4, #44]
	movs	r5, #0
	bl	pp_free_buffer
	ldr	r3, [r4, #164]
	ldr	r0, [r4, #168]
	ldr	r3, [r3, #12]
	blx	r3
	ldr	r0, [r4, #168]
	cmp	r0, #0
	beq	.L106
	bl	vfree
	str	r5, [r4, #168]
	mov	r0, r5
	b	.L106
.L111:
	.align	2
.L110:
	.word	.LANCHOR1+50
	.word	.LC3
	.word	.LANCHOR1+70
	.word	.LC4
	.word	.LANCHOR0
	.fnend
	.size	vepu_pp_destroy_chn, .-vepu_pp_destroy_chn
	.align	1
	.global	vepu_pp_create_chn
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_pp_create_chn, %function
vepu_pp_create_chn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r2, r0
	mov	r4, r0
	mov	r5, r1
	ldr	r0, .L122
	ldr	r1, .L122+4
	bl	printk
	cmp	r4, #7
	ble	.L113
	mov	r3, r4
	movs	r2, #122
	ldr	r1, .L122+8
	ldr	r0, .L122+12
	bl	printk
.L121:
	mov	r0, #-1
.L112:
	pop	{r4, r5, r6, r7, r8, pc}
.L113:
	movs	r2, #168
	ldr	r8, .L122+32
	mul	r6, r2, r4
	add	r7, r8, #4
	movs	r1, #0
	add	r7, r7, r6
	mov	r0, r7
	bl	memset
	add	r3, r8, r6
	str	r4, [r3, #4]
	ldr	r2, [r5]
	str	r2, [r3, #8]
	ldr	r2, [r5, #4]
	str	r2, [r3, #12]
	ldr	r2, [r5, #16]
	str	r2, [r3, #24]
	ldr	r2, [r5, #20]
	str	r2, [r3, #28]
	ldr	r2, .L122+16
	str	r2, [r3, #164]
	ldr	r0, [r5, #28]
	subs	r1, r0, #1
	cmp	r1, #4096
	bcs	.L115
	ldr	r1, [r5, #32]
	subs	r1, r1, #1
	cmp	r1, #4096
	bcs	.L115
	str	r0, [r3, #16]
	ldr	r1, [r5, #32]
.L120:
	str	r1, [r3, #20]
	movs	r5, #168
	ldr	r0, [r2, #4]
	bl	vmalloc
	mla	r5, r5, r4, r8
	str	r0, [r5, #168]
	cbnz	r0, .L117
	movs	r2, #147
	ldr	r1, .L122+8
	ldr	r0, .L122+20
	bl	printk
	b	.L121
.L115:
	movs	r3, #168
	ldr	r1, [r5]
	mla	r3, r3, r4, r8
	str	r1, [r3, #16]
	ldr	r1, [r5, #4]
	b	.L120
.L117:
	ldr	r3, [r5, #164]
	movs	r1, #0
	ldr	r2, [r3, #4]
	bl	memset
	ldr	r3, [r5, #164]
	movs	r1, #2
	ldr	r0, [r5, #168]
	ldr	r3, [r3, #8]
	blx	r3
	ldr	r6, [r5, #16]
	ldr	r3, [r5, #20]
	mov	r0, r7
	adds	r6, r6, #31
	bic	r2, r6, #31
	add	r6, r3, #31
	bic	r6, r6, #31
	muls	r6, r2, r6
	asrs	r6, r6, #4
	mov	r1, r6
	bl	pp_malloc_buffer
	mov	r1, r6
	str	r0, [r5, #40]
	mov	r0, r7
	bl	pp_malloc_buffer
	mov	r3, r0
	str	r0, [r5, #44]
	ldr	r0, [r5, #40]
	bl	IS_ERR_OR_NULL
	cbnz	r0, .L118
	mov	r0, r3
	bl	IS_ERR_OR_NULL
	cmp	r0, #0
	beq	.L112
.L118:
	movs	r2, #105
	ldr	r1, .L122+24
	ldr	r0, .L122+28
	bl	printk
	movs	r3, #168
	mla	r4, r3, r4, r8
	mov	r0, r7
	ldr	r1, [r4, #40]
	bl	pp_free_buffer
	ldr	r1, [r4, #44]
	mov	r0, r7
	bl	pp_free_buffer
	b	.L121
.L123:
	.align	2
.L122:
	.word	.LC3
	.word	.LANCHOR1+90
	.word	.LANCHOR1+109
	.word	.LC5
	.word	pp_srv_api
	.word	.LC6
	.word	.LANCHOR1+128
	.word	.LC7
	.word	.LANCHOR0
	.fnend
	.size	vepu_pp_create_chn, .-vepu_pp_create_chn
	.text
	.align	1
	.global	vepu_show_pp_info
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vepu_show_pp_info, %function
vepu_show_pp_info:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #36
	sub	sp, sp, #36
	ldr	r1, .L161
	mov	r4, r0
	bl	seq_puts
	ldr	r3, .L161+4
	ldr	r2, .L161+8
	mov	r0, r4
	ldr	r1, .L161+12
	movs	r7, #0
	ldr	r6, .L161+16
	ldr	r8, .L161+120
	mov	r5, r6
	str	r3, [sp, #16]
	ldr	r3, .L161+20
	str	r3, [sp, #12]
	ldr	r3, .L161+24
	str	r3, [sp, #8]
	ldr	r3, .L161+28
	str	r3, [sp, #4]
	ldr	r3, .L161+32
	str	r3, [sp]
	ldr	r3, .L161+36
	bl	seq_printf
.L126:
	ldr	r3, [r5, #36]
	cbz	r3, .L125
	ldr	r3, [r5, #40]
	cbz	r3, .L125
	ldr	r3, [r5, #24]
	mov	r1, r8
	mov	r0, r4
	str	r3, [sp, #16]
	ldr	r3, [r5, #20]
	str	r3, [sp, #12]
	ldr	r3, [r5, #16]
	str	r3, [sp, #8]
	ldr	r3, [r5, #12]
	str	r3, [sp, #4]
	ldr	r3, [r5, #8]
	str	r3, [sp]
	ldrd	r2, r3, [r5]
	bl	seq_printf
.L125:
	adds	r7, r7, #1
	adds	r5, r5, #168
	cmp	r7, #8
	bne	.L126
	ldr	r1, .L161+40
	mov	r0, r4
	bl	seq_puts
	ldr	r3, .L161+44
	ldr	r2, .L161+8
	mov	r0, r4
	ldr	r1, .L161+48
	mov	r5, r6
	ldr	r8, .L161+116
	movs	r7, #0
	ldr	r10, .L161+124
	mov	r9, #168
	str	r3, [sp, #4]
	ldr	r3, .L161+52
	str	r3, [sp]
	ldr	r3, .L161+56
	bl	seq_printf
.L128:
	ldr	r3, [r5, #36]
	cbz	r3, .L127
	ldr	r3, [r5, #40]
	cbz	r3, .L127
	mla	r3, r9, r7, r8
	ldr	r2, [r5, #32]
	mov	r1, r10
	mov	r0, r4
	ldrb	r3, [r3, #92]	@ zero_extendqisi2
	str	r2, [sp, #4]
	ldr	r2, [r5, #28]
	ubfx	r3, r3, #2, #4
	str	r2, [sp]
	ldr	r2, [r5]
	bl	seq_printf
.L127:
	adds	r7, r7, #1
	adds	r5, r5, #168
	cmp	r7, #8
	bne	.L128
	ldr	r1, .L161+60
	mov	r0, r4
	bl	seq_puts
	ldr	r3, .L161+64
	ldr	r7, .L161+68
	mov	r0, r4
	ldr	r2, .L161+8
	mov	r5, r6
	ldr	r1, .L161+72
	mov	r8, #0
	ldr	r9, .L161+116
	mov	r10, #168
	ldr	fp, .L161+128
	str	r3, [sp, #24]
	ldr	r3, .L161+76
	str	r7, [sp]
	str	r3, [sp, #20]
	ldr	r3, .L161+80
	str	r3, [sp, #16]
	ldr	r3, .L161+84
	str	r3, [sp, #12]
	ldr	r3, .L161+88
	str	r3, [sp, #8]
	ldr	r3, .L161+92
	str	r3, [sp, #4]
	ldr	r3, .L161+96
	bl	seq_printf
.L130:
	ldr	r3, [r5, #36]
	cbz	r3, .L129
	ldr	r3, [r5, #40]
	cbz	r3, .L129
	mla	r2, r10, r8, r9
	adds	r2, r2, #148
	ldrb	r1, [r2, #7]	@ zero_extendqisi2
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	str	r1, [sp, #24]
	ldrb	r1, [r2, #6]	@ zero_extendqisi2
	ubfx	r0, r1, #4, #3
	and	r1, r1, #15
	str	r0, [sp, #20]
	mov	r0, r4
	str	r1, [sp, #16]
	ubfx	r1, r3, #5, #1
	str	r1, [sp, #12]
	ubfx	r1, r3, #4, #1
	str	r1, [sp, #8]
	ubfx	r3, r3, #2, #2
	ldrb	r1, [r2, #5]	@ zero_extendqisi2
	ubfx	r1, r1, #4, #3
	str	r1, [sp, #4]
	ldrh	r2, [r2, #4]
	mov	r1, fp
	ubfx	r2, r2, #0, #12
	str	r2, [sp]
	ldr	r2, [r5]
	bl	seq_printf
.L129:
	add	r8, r8, #1
	adds	r5, r5, #168
	cmp	r8, #8
	bne	.L130
	ldr	r1, .L161+100
	mov	r0, r4
	bl	seq_puts
	ldr	r3, .L161+104
	ldr	r2, .L161+8
	mov	r0, r4
	ldr	r1, .L161+108
	movs	r5, #0
	ldr	r9, .L161+132
	mov	r8, #168
	str	r7, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L161+112
	bl	seq_printf
	ldr	r7, .L161+116
.L132:
	ldr	r3, [r6, #36]
	cbz	r3, .L131
	ldr	r3, [r6, #40]
	cbz	r3, .L131
	mla	r2, r8, r5, r7
	mov	r0, r4
	adds	r2, r2, #148
	ldrh	r3, [r2, #8]
	ldr	r1, [r2, #8]
	ubfx	r3, r3, #0, #12
	ubfx	r1, r1, #15, #14
	str	r1, [sp, #4]
	ldrb	r2, [r2, #9]	@ zero_extendqisi2
	mov	r1, r9
	ubfx	r2, r2, #4, #3
	str	r2, [sp]
	ldr	r2, [r6]
	bl	seq_printf
.L131:
	adds	r5, r5, #1
	adds	r6, r6, #168
	cmp	r5, #8
	bne	.L132
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L162:
	.align	2
.L161:
	.word	.LC8
	.word	.LC12
	.word	.LC10
	.word	.LC11
	.word	.LANCHOR0+4
	.word	.LC13
	.word	.LC14
	.word	.LC15
	.word	.LC16
	.word	.LC9
	.word	.LC18
	.word	.LC21
	.word	.LC20
	.word	.LC22
	.word	.LC19
	.word	.LC24
	.word	.LC27
	.word	.LC33
	.word	.LC26
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LC25
	.word	.LC35
	.word	.LC38
	.word	.LC37
	.word	.LC36
	.word	.LANCHOR0
	.word	.LC17
	.word	.LC23
	.word	.LC34
	.word	.LC39
	.fnend
	.size	vepu_show_pp_info, .-vepu_show_pp_info
	.section	.rodata
	.set	.LANCHOR1,. + 0
	.type	__FUNCTION__.26762, %object
	.size	__FUNCTION__.26762, 17
__FUNCTION__.26762:
	.ascii	"get_vmpibuf_func\000"
	.type	__func__.26870, %object
	.size	__func__.26870, 16
__func__.26870:
	.ascii	"vepu_pp_control\000"
	.type	__func__.26769, %object
	.size	__func__.26769, 17
__func__.26769:
	.ascii	"pp_malloc_buffer\000"
	.type	__FUNCTION__.26804, %object
	.size	__FUNCTION__.26804, 20
__FUNCTION__.26804:
	.ascii	"vepu_pp_destroy_chn\000"
	.type	__func__.26805, %object
	.size	__func__.26805, 20
__func__.26805:
	.ascii	"vepu_pp_destroy_chn\000"
	.type	__FUNCTION__.26792, %object
	.size	__FUNCTION__.26792, 19
__FUNCTION__.26792:
	.ascii	"vepu_pp_create_chn\000"
	.type	__func__.26793, %object
	.size	__func__.26793, 19
__func__.26793:
	.ascii	"vepu_pp_create_chn\000"
	.type	__func__.26785, %object
	.size	__func__.26785, 19
__func__.26785:
	.ascii	"pp_allocate_buffer\000"
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	g_mpi_buf_fn, %object
	.size	g_mpi_buf_fn, 4
g_mpi_buf_fn:
	.space	4
	.type	g_pp_ctx, %object
	.size	g_pp_ctx, 1344
g_pp_ctx:
	.space	1344
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013%s failed\012\000"
.LC1:
	.ascii	"\0013%s:%d: vepu pp control channel id %d error\012"
	.ascii	"\000"
.LC2:
	.ascii	"\0013%s:%d: failed\012\000"
.LC3:
	.ascii	"\0016%s %d\012\000"
.LC4:
	.ascii	"\0013%s:%d: vepu pp destroy channel id %d error\012"
	.ascii	"\000"
.LC5:
	.ascii	"\0013%s:%d: vepu pp create channel id %d error\012\000"
.LC6:
	.ascii	"\0013%s:%d: vepu pp vmalloc failed\012\000"
.LC7:
	.ascii	"\0013%s:%d: alloc buffer failed\012\000"
.LC8:
	.ascii	"\012-----------------------------------pp channel a"
	.ascii	"ttr---------------------------------------------\012"
	.ascii	"\000"
.LC9:
	.ascii	"width\000"
.LC10:
	.ascii	"ID\000"
.LC11:
	.ascii	"%8s|%8s|%8s|%12s|%12s|%8s|%8s\012\000"
.LC12:
	.ascii	"od_en\000"
.LC13:
	.ascii	"md_en\000"
.LC14:
	.ascii	"max_height\000"
.LC15:
	.ascii	"max_width\000"
.LC16:
	.ascii	"height\000"
.LC17:
	.ascii	"%8d|%8d|%8d|%12d|%12d|%8d|%8d\012\000"
.LC18:
	.ascii	"\012-----------------------------------pp common cf"
	.ascii	"g-----------------------------------------------\012"
	.ascii	"\000"
.LC19:
	.ascii	"fmt\000"
.LC20:
	.ascii	"%8s|%8s|%15s|%15s\012\000"
.LC21:
	.ascii	"frm_acc_gop\000"
.LC22:
	.ascii	"frm_acc_intval\000"
.LC23:
	.ascii	"%8d|%8d|%15d|%15d\012\000"
.LC24:
	.ascii	"\012-----------------------------------pp md cfg---"
	.ascii	"------------------------------------------------\012"
	.ascii	"\000"
.LC25:
	.ascii	"switch_sad\000"
.LC26:
	.ascii	"%8s|%10s|%10s|%10s|%10s|%10s|%15s|%15s|%15s\012\000"
.LC27:
	.ascii	"thres_dust_chng\000"
.LC28:
	.ascii	"thres_dust_blk\000"
.LC29:
	.ascii	"thres_dust_mv\000"
.LC30:
	.ascii	"filter_sw\000"
.LC31:
	.ascii	"night_mode\000"
.LC32:
	.ascii	"thres_move\000"
.LC33:
	.ascii	"thres_sad\000"
.LC34:
	.ascii	"%8d|%10d|%10d|%10d|%10d|%10d|%15d|%15d|%15d\012\000"
.LC35:
	.ascii	"\012-----------------------------------pp od cfg---"
	.ascii	"------------------------------------------------\012"
	.ascii	"\000"
.LC36:
	.ascii	"thres_complex\000"
.LC37:
	.ascii	"%8s|%15s|%18s|%10s\012\000"
.LC38:
	.ascii	"thres_complex_cnt\000"
.LC39:
	.ascii	"%8d|%15d|%18d|%10d\012\000"
	.section	___ksymtab+register_vmpibuf_func_to_pp,"a"
	.align	2
	.type	__ksymtab_register_vmpibuf_func_to_pp, %object
	.size	__ksymtab_register_vmpibuf_func_to_pp, 12
__ksymtab_register_vmpibuf_func_to_pp:
	.word	register_vmpibuf_func_to_pp
	.word	__kstrtab_register_vmpibuf_func_to_pp
	.word	__kstrtabns_register_vmpibuf_func_to_pp
	.section	___ksymtab+unregister_vmpibuf_func_pp,"a"
	.align	2
	.type	__ksymtab_unregister_vmpibuf_func_pp, %object
	.size	__ksymtab_unregister_vmpibuf_func_pp, 12
__ksymtab_unregister_vmpibuf_func_pp:
	.word	unregister_vmpibuf_func_pp
	.word	__kstrtab_unregister_vmpibuf_func_pp
	.word	__kstrtabns_unregister_vmpibuf_func_pp
	.section	___ksymtab+vepu_pp_control,"a"
	.align	2
	.type	__ksymtab_vepu_pp_control, %object
	.size	__ksymtab_vepu_pp_control, 12
__ksymtab_vepu_pp_control:
	.word	vepu_pp_control
	.word	__kstrtab_vepu_pp_control
	.word	__kstrtabns_vepu_pp_control
	.section	___ksymtab+vepu_pp_create_chn,"a"
	.align	2
	.type	__ksymtab_vepu_pp_create_chn, %object
	.size	__ksymtab_vepu_pp_create_chn, 12
__ksymtab_vepu_pp_create_chn:
	.word	vepu_pp_create_chn
	.word	__kstrtab_vepu_pp_create_chn
	.word	__kstrtabns_vepu_pp_create_chn
	.section	___ksymtab+vepu_pp_destroy_chn,"a"
	.align	2
	.type	__ksymtab_vepu_pp_destroy_chn, %object
	.size	__ksymtab_vepu_pp_destroy_chn, 12
__ksymtab_vepu_pp_destroy_chn:
	.word	vepu_pp_destroy_chn
	.word	__kstrtab_vepu_pp_destroy_chn
	.word	__kstrtabns_vepu_pp_destroy_chn
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
