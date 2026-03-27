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
	.file	"vsys.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_get_pool:					
	.asciz 	"vsys_get_pool"					
__kstrtabns_vsys_get_pool:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_add_node_to_map:					
	.asciz 	"vsys_add_node_to_map"					
__kstrtabns_vsys_add_node_to_map:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_get_node_from_map:					
	.asciz 	"vsys_get_node_from_map"					
__kstrtabns_vsys_get_node_from_map:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_vsys_remove_node_from_map:					
	.asciz 	"vsys_remove_node_from_map"					
__kstrtabns_vsys_remove_node_from_map:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	list_del, %function
list_del:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrd	r2, r3, [r0]
	str	r3, [r2, #4]
	str	r2, [r3]
	mov	r2, #256
	mov	r3, #290
	strd	r2, r3, [r0]
	bx	lr
	.fnend
	.size	list_del, .-list_del
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_init, %function
vsys_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vsys_init, .-vsys_init
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_compat_ioctl, %function
vsys_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vsys_compat_ioctl, .-vsys_compat_ioctl
	.align	1
	.global	vsys_get_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_get_pool, %function
vsys_get_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L13
	ldr	r3, [r2]
.L12:
	subs	r3, r3, #72
	add	r1, r3, #72
	cmp	r1, r2
	bne	.L8
	movs	r3, #0
.L4:
	mov	r0, r3
	bx	lr
.L8:
	ldr	r1, [r3, #40]
	lsls	r1, r1, #30
	bpl	.L6
	ldr	r1, [r3, #80]
	cmp	r1, r0
	beq	.L4
.L6:
	ldr	r3, [r3, #72]
	b	.L12
.L14:
	.align	2
.L13:
	.word	mpi_buf_pool_list
	.fnend
	.size	vsys_get_pool, .-vsys_get_pool
	.align	1
	.global	vsys_add_node_to_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_add_node_to_map, %function
vsys_add_node_to_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	mov	r6, r0
	.pad #20
	sub	sp, sp, #20
	mov	r4, r1
	mov	r7, r2
	mov	r5, r3
	cbnz	r3, .L16
.L33:
	mov	r7, #-1
.L17:
	mov	r0, r7
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L16:
	strd	r1, r2, [sp, #8]
	movw	r3, #805
	str	r0, [sp, #4]
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L36
	subs	r6, r6, #4
	ldr	r2, .L36+4
	bl	vlog
	cmp	r6, #21
	bhi	.L34
	tbb	[pc, r6]
.L19:
	.byte	(.L32-.L19)/2
	.byte	(.L31-.L19)/2
	.byte	(.L30-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L29-.L19)/2
	.byte	(.L28-.L19)/2
	.byte	(.L27-.L19)/2
	.byte	(.L26-.L19)/2
	.byte	(.L25-.L19)/2
	.byte	(.L24-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L23-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L22-.L19)/2
	.byte	(.L21-.L19)/2
	.byte	(.L20-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L34-.L19)/2
	.byte	(.L18-.L19)/2
	.p2align 1
.L23:
	cmp	r4, #1
	bhi	.L33
	cmp	r7, #3
	bhi	.L33
	add	r4, r7, r4, lsl #2
	addw	r4, r4, #2934
.L35:
	ldr	r3, .L36+8
	str	r5, [r3, r4, lsl #2]
	b	.L34
.L20:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #31
	bhi	.L33
	add	r4, r7, r4, lsl #5
	addw	r4, r4, #1366
	b	.L35
.L22:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #1280
	bcs	.L33
	mov	r3, #1280
	mla	r4, r3, r4, r7
	ldr	r3, .L36+8
	add	r4, r3, r4, lsl #2
	str	r5, [r4, #276]
.L34:
	movs	r7, #0
	b	.L17
.L32:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #15
	bhi	.L33
	add	r4, r7, r4, lsl #4
	ldr	r3, .L36+8
	addw	r4, r4, #1348
	add	r4, r3, r4, lsl #2
	str	r5, [r4, #4]
	b	.L34
.L31:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #0
	bne	.L33
	addw	r4, r4, #1364
	ldr	r3, .L36+8
	add	r4, r3, r4, lsl #2
	str	r5, [r4, #4]
	b	.L17
.L29:
	cmp	r4, #1
	bhi	.L33
	cmp	r7, #13
	bhi	.L33
	movs	r3, #14
	mla	r4, r3, r4, r7
	ldr	r3, .L36+8
	add	r4, r3, r4, lsl #2
	str	r5, [r4, #164]
	b	.L34
.L30:
	cmp	r4, #255
	bhi	.L33
	cmp	r7, #5
	bhi	.L33
	movs	r3, #6
	mla	r4, r3, r4, r7
	addw	r4, r4, #1398
	b	.L35
.L27:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #0
	bne	.L33
	ldr	r3, .L36+8
	addw	r4, r4, #2942
	str	r5, [r3, r4, lsl #2]
	b	.L17
.L26:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #2
	bhi	.L33
	add	r4, r4, r4, lsl #1
	add	r4, r4, r7
	add	r4, r4, #2944
	b	.L35
.L25:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #31
	bhi	.L33
	add	r4, r7, r4, lsl #5
	addw	r4, r4, #2950
	b	.L35
.L24:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #31
	bhi	.L33
	add	r4, r7, r4, lsl #5
	addw	r4, r4, #2982
	b	.L35
.L28:
	cmp	r4, #1
	bhi	.L33
	cmp	r7, #127
	bhi	.L33
	add	r4, r7, r4, lsl #7
	addw	r4, r4, #3014
	b	.L35
.L18:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #255
	bhi	.L33
	add	r4, r7, r4, lsl #8
	addw	r4, r4, #3270
	b	.L35
.L21:
	cmp	r4, #0
	blt	.L33
	cmp	r7, #7
	bhi	.L33
	add	r4, r7, r4, lsl #3
	addw	r4, r4, #3572
	b	.L35
.L37:
	.align	2
.L36:
	.word	.LANCHOR0
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_add_node_to_map, .-vsys_add_node_to_map
	.align	1
	.global	vsys_get_node_from_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_get_node_from_map, %function
vsys_get_node_from_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r6, r0
	strd	r1, r2, [sp, #8]
	mov	r3, #892
	str	r0, [sp, #4]
	mov	r4, r1
	str	r3, [sp]
	mov	r5, r2
	ldr	r3, .L86
	movs	r1, #5
	ldr	r2, .L86+4
	movs	r0, #0
	subs	r6, r6, #4
	bl	vlog
	cmp	r6, #21
	bhi	.L83
	tbb	[pc, r6]
.L41:
	.byte	(.L54-.L41)/2
	.byte	(.L53-.L41)/2
	.byte	(.L52-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L51-.L41)/2
	.byte	(.L50-.L41)/2
	.byte	(.L49-.L41)/2
	.byte	(.L48-.L41)/2
	.byte	(.L47-.L41)/2
	.byte	(.L46-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L45-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L44-.L41)/2
	.byte	(.L43-.L41)/2
	.byte	(.L42-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L83-.L41)/2
	.byte	(.L40-.L41)/2
	.p2align 1
.L45:
	cmp	r4, #1
	bhi	.L83
	cmp	r5, #3
	bhi	.L83
	add	r4, r5, r4, lsl #2
	addw	r4, r4, #2934
.L84:
	ldr	r3, .L86+8
	ldr	r0, [r3, r4, lsl #2]
	b	.L38
.L42:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #31
	bhi	.L83
	add	r4, r5, r4, lsl #5
	addw	r4, r4, #1366
	b	.L84
.L44:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #1280
	bcs	.L83
	mov	r3, #1280
	mla	r4, r3, r4, r5
	ldr	r3, .L86+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #276]
.L38:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L54:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #15
	bhi	.L83
	add	r4, r5, r4, lsl #4
	addw	r4, r4, #1348
.L85:
	ldr	r3, .L86+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #4]
	b	.L38
.L53:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #0
	bne	.L83
	addw	r4, r4, #1364
	b	.L85
.L51:
	cmp	r4, #1
	bhi	.L83
	cmp	r5, #13
	bhi	.L83
	movs	r3, #14
	mla	r4, r3, r4, r5
	ldr	r3, .L86+8
	add	r4, r3, r4, lsl #2
	ldr	r0, [r4, #164]
	b	.L38
.L52:
	cmp	r4, #255
	bhi	.L83
	cmp	r5, #5
	bhi	.L83
	movs	r3, #6
	mla	r4, r3, r4, r5
	addw	r4, r4, #1398
	b	.L84
.L49:
	cmp	r4, #0
	blt	.L83
	cbnz	r5, .L83
	addw	r4, r4, #2942
	b	.L84
.L48:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #2
	bhi	.L83
	add	r4, r4, r4, lsl #1
	add	r4, r4, r5
	add	r4, r4, #2944
	b	.L84
.L47:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #31
	bhi	.L83
	add	r4, r5, r4, lsl #5
	addw	r4, r4, #2950
	b	.L84
.L46:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #31
	bhi	.L83
	add	r4, r5, r4, lsl #5
	addw	r4, r4, #2982
	b	.L84
.L50:
	cmp	r4, #1
	bhi	.L83
	cmp	r5, #127
	bhi	.L83
	add	r4, r5, r4, lsl #7
	addw	r4, r4, #3014
	b	.L84
.L40:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #255
	bhi	.L83
	add	r4, r5, r4, lsl #8
	addw	r4, r4, #3270
	b	.L84
.L43:
	cmp	r4, #0
	blt	.L83
	cmp	r5, #7
	bhi	.L83
	add	r4, r5, r4, lsl #3
	addw	r4, r4, #3572
	b	.L84
.L83:
	movs	r0, #0
	b	.L38
.L87:
	.align	2
.L86:
	.word	.LANCHOR0+21
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_get_node_from_map, .-vsys_get_node_from_map
	.align	1
	.global	vsys_remove_node_from_map
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_remove_node_from_map, %function
vsys_remove_node_from_map:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #16
	mov	r6, r0
	strd	r1, r2, [sp, #8]
	movw	r3, #982
	str	r0, [sp, #4]
	mov	r5, r1
	str	r3, [sp]
	mov	r4, r2
	ldr	r3, .L138
	movs	r1, #5
	ldr	r2, .L138+4
	movs	r0, #0
	subs	r6, r6, #4
	bl	vlog
	cmp	r6, #21
	bhi	.L105
	tbb	[pc, r6]
.L91:
	.byte	(.L104-.L91)/2
	.byte	(.L103-.L91)/2
	.byte	(.L102-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L101-.L91)/2
	.byte	(.L100-.L91)/2
	.byte	(.L99-.L91)/2
	.byte	(.L98-.L91)/2
	.byte	(.L97-.L91)/2
	.byte	(.L96-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L95-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L94-.L91)/2
	.byte	(.L93-.L91)/2
	.byte	(.L92-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L105-.L91)/2
	.byte	(.L90-.L91)/2
	.p2align 1
.L95:
	cmp	r5, #1
	bhi	.L133
	cmp	r4, #3
	bhi	.L133
	add	r4, r4, r5, lsl #2
	addw	r5, r4, #2934
.L136:
	movs	r4, #0
	b	.L137
.L92:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #31
	bhi	.L133
	add	r4, r4, r5, lsl #5
	addw	r5, r4, #1366
	b	.L136
.L94:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #1280
	bcs	.L133
	mov	r3, #1280
	mla	r4, r3, r5, r4
	adds	r4, r4, #68
.L134:
	ldr	r5, .L138+8
	add	r5, r5, r4, lsl #2
	movs	r4, #0
	b	.L135
.L104:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #15
	bhi	.L133
	add	r4, r4, r5, lsl #4
	addw	r4, r4, #1348
	b	.L134
.L103:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #0
	bne	.L133
	addw	r5, r5, #1364
	ldr	r3, .L138+8
	add	r5, r3, r5, lsl #2
.L135:
	str	r4, [r5, #4]
.L89:
	mov	r0, r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L101:
	cmp	r5, #1
	bhi	.L133
	cmp	r4, #13
	bhi	.L133
	movs	r3, #14
	mla	r4, r3, r5, r4
	adds	r4, r4, #40
	b	.L134
.L102:
	cmp	r5, #255
	bhi	.L133
	cmp	r4, #5
	bhi	.L133
	movs	r3, #6
	mla	r4, r3, r5, r4
	addw	r5, r4, #1398
	b	.L136
.L99:
	cmp	r5, #0
	blt	.L133
	cbnz	r4, .L133
	addw	r5, r5, #2942
.L137:
	ldr	r3, .L138+8
	str	r4, [r3, r5, lsl #2]
	b	.L89
.L98:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #2
	bhi	.L133
	add	r5, r5, r5, lsl #1
	add	r4, r4, r5
	add	r5, r4, #2944
	b	.L136
.L97:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #31
	bhi	.L133
	add	r4, r4, r5, lsl #5
	addw	r5, r4, #2950
	b	.L136
.L96:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #31
	bhi	.L133
	add	r4, r4, r5, lsl #5
	addw	r5, r4, #2982
	b	.L136
.L100:
	cmp	r5, #1
	bhi	.L133
	cmp	r4, #128
	bhi	.L133
	add	r4, r4, r5, lsl #7
	addw	r5, r4, #3014
	b	.L136
.L90:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #255
	bhi	.L133
	add	r4, r4, r5, lsl #8
	addw	r5, r4, #3270
	b	.L136
.L93:
	cmp	r5, #0
	blt	.L133
	cmp	r4, #7
	bhi	.L133
	add	r4, r4, r5, lsl #3
	addw	r5, r4, #3572
	b	.L136
.L105:
	movs	r4, #0
	b	.L89
.L133:
	mov	r4, #-1
	b	.L89
.L139:
	.align	2
.L138:
	.word	.LANCHOR0+44
	.word	.LC0
	.word	g_vsys_dev
	.fnend
	.size	vsys_remove_node_from_map, .-vsys_remove_node_from_map
	.align	1
	.global	vsys_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_version, %function
vsys_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r3, [r3]
	ldr	r6, [r3, #136]
	ldr	r3, [r1, #48]	@ unaligned
	cmp	r3, #124
	beq	.L141
	mov	r3, #306
	ldr	r2, .L147
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L147+4
	movs	r0, #0
	bl	vlog
.L141:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r4, #1]
	strb	r3, [r4]
	strb	r5, [r4, #2]
	strb	r5, [r4, #3]
	strb	r5, [r4, #4]
	strb	r5, [r4, #5]
	strb	r5, [r4, #6]
	strb	r5, [r4, #7]
	strb	r5, [r4, #8]
	strb	r5, [r4, #9]
	strb	r5, [r4, #10]
	strb	r5, [r4, #11]
	ldr	r0, [r6]
	bl	strlen
	cmp	r0, #32
	ite	ls
	strls	r0, [r4, #12]	@ unaligned
	strbhi	r5, [r4, #13]
	add	r0, r4, #16
	itttt	hi
	strbhi	r5, [r4, #14]
	movhi	r3, #32
	strbhi	r5, [r4, #15]
	strbhi	r3, [r4, #12]
	ldr	r2, [r4, #12]	@ unaligned
	ldr	r1, [r6]
	bl	strncpy
	movs	r0, #0
	strb	r0, [r4, #52]
	strb	r0, [r4, #53]
	strb	r0, [r4, #54]
	strb	r0, [r4, #55]
	strb	r0, [r4, #88]
	strb	r0, [r4, #89]
	strb	r0, [r4, #90]
	strb	r0, [r4, #91]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L148:
	.align	2
.L147:
	.word	.LC1
	.word	.LANCHOR0+70
	.fnend
	.size	vsys_version, .-vsys_version
	.align	1
	.global	vsys_bind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_bind, %function
vsys_bind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #32
	sub	sp, sp, #32
	cmp	r3, #28
	beq	.L150
	mov	r3, #332
	ldr	r2, .L167
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L167+4
	movs	r0, #0
	bl	vlog
.L150:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L151
	adds	r3, r3, #1
.L164:
	str	r3, [r4, #8]	@ unaligned
.L152:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbnz	r0, .L153
	mov	r3, #344
	ldr	r2, .L167+8
	str	r3, [sp]
	ldr	r3, .L167+4
.L166:
	movs	r1, #2
	bl	vlog
	mov	r0, #-1
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L151:
	cmp	r0, #17
	bne	.L152
	adds	r3, r3, #2
	b	.L164
.L153:
	ldr	r0, [r4, #16]	@ unaligned
	cmp	r0, #6
	bne	.L155
	movs	r2, #5
	ldr	r1, [r4, #20]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbz	r0, .L155
	ldr	r3, [r4, #20]	@ unaligned
	movs	r1, #4
	ldr	r2, .L167+12
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #353
	str	r3, [sp]
	ldr	r3, .L167+4
	bl	vlog
	movs	r3, #5
	str	r3, [sp, #24]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #356
.L165:
.L156:
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L167+4
	movs	r0, #0
	ldr	r2, .L167+16
	bl	vlog
	mov	r1, r5
	mov	r0, r6
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_node_bind
.L155:
	ldr	r2, [r4, #24]	@ unaligned
	ldr	r1, [r4, #20]	@ unaligned
	ldr	r0, [r4, #16]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L157
	mov	r3, #366
	ldr	r2, .L167+20
	str	r3, [sp]
	ldr	r3, .L167+4
	b	.L166
.L157:
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #372
	b	.L165
.L168:
	.align	2
.L167:
	.word	.LC2
	.word	.LANCHOR0+83
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.fnend
	.size	vsys_bind, .-vsys_bind
	.align	1
	.global	vsys_unbind
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_unbind, %function
vsys_unbind:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	.pad #32
	sub	sp, sp, #32
	cmp	r3, #28
	beq	.L170
	mov	r3, #390
	ldr	r2, .L187
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L187+4
	movs	r0, #0
	bl	vlog
.L170:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L171
	adds	r3, r3, #1
.L184:
	str	r3, [r4, #8]	@ unaligned
.L172:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbnz	r0, .L173
	mov	r3, #402
	ldr	r2, .L187+8
	str	r3, [sp]
	ldr	r3, .L187+4
.L186:
	movs	r1, #2
	bl	vlog
	mov	r0, #-1
.L169:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, pc}
.L171:
	cmp	r0, #17
	bne	.L172
	adds	r3, r3, #2
	b	.L184
.L173:
	ldr	r0, [r4, #16]	@ unaligned
	cmp	r0, #6
	bne	.L175
	movs	r2, #5
	ldr	r1, [r4, #20]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbz	r0, .L175
	ldr	r3, [r4, #20]	@ unaligned
	movs	r1, #4
	ldr	r2, .L187+12
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #411
	str	r3, [sp]
	ldr	r3, .L187+4
	bl	vlog
	movs	r3, #5
	str	r3, [sp, #24]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #414
.L185:
.L176:
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L187+4
	movs	r0, #0
	ldr	r2, .L187+16
	bl	vlog
	mov	r0, r6
	mov	r1, r5
	bl	mpi_node_unbind
	movs	r0, #0
	b	.L169
.L175:
	ldr	r2, [r4, #24]	@ unaligned
	ldr	r1, [r4, #20]	@ unaligned
	ldr	r0, [r4, #16]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbnz	r0, .L177
	movw	r3, #423
	ldr	r2, .L187+20
	str	r3, [sp]
	ldr	r3, .L187+4
	b	.L186
.L177:
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #429
	b	.L185
.L188:
	.align	2
.L187:
	.word	.LC2
	.word	.LANCHOR0+93
	.word	.LC3
	.word	.LC7
	.word	.LC8
	.word	.LC6
	.fnend
	.size	vsys_unbind, .-vsys_unbind
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	m_callback, %function
m_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r4, #0
	ldr	r5, .L192
	ldr	r6, .L192+4
.L190:
	mov	r1, r4
	ldr	r2, [r5], #4
	mov	r0, r6
	adds	r4, r4, #1
	bl	rkos_printk
	cmp	r4, #26
	bne	.L190
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L193:
	.align	2
.L192:
	.word	module_name
	.word	.LC9
	.fnend
	.size	m_callback, .-m_callback
	.align	1
	.global	vsys_main
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_main, %function
vsys_main:
	.fnstart
	@ args = 0, pretend = 0, frame = 472
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #492
	sub	sp, sp, #492
	ldr	fp, .L205+140
	movs	r4, #0
	strd	r0, r1, [sp, #20]
	movs	r1, #109
	strb	r1, [sp, #168]
	add	r9, sp, #32
	ldr	r3, [fp]
	add	r8, sp, #36
	ldr	r1, .L205
	add	r7, sp, #40
	str	r4, [sp, #32]
	add	r6, sp, #48
	str	r3, [sp, #484]
	movs	r3, #1
	str	r3, [sp, #48]
	add	r10, sp, #44
	ldr	r3, .L205+4
	add	r2, sp, #56
	strd	r1, r9, [sp, #172]
	add	r5, sp, #52
	ldr	r1, .L205+8
	add	r0, sp, #60
	str	r3, [sp, #52]
	movs	r3, #2
	str	r3, [sp, #100]
	ldr	r3, .L205+12
	str	r4, [sp, #36]
	str	r4, [sp, #40]
	strd	r3, r4, [sp, #108]
	ldr	r3, .L205+16
	str	r4, [sp, #44]
	str	r4, [sp, #56]
	str	r3, [sp, #116]
	ldr	r3, .L205+20
	strb	r4, [sp, #104]
	strb	r4, [sp, #136]
	strd	r3, r4, [sp, #120]
	movs	r3, #1
	strd	r3, r3, [sp, #128]
	ldr	r3, .L205+24
	strd	r4, r4, [sp, #140]
	strd	r4, r4, [sp, #156]
	strd	r3, r4, [sp, #148]
	movs	r3, #4
	str	r3, [sp, #164]
	str	r1, [sp, #180]
	ldr	r1, .L205+28
	strd	r4, r3, [sp, #192]
	str	r3, [sp, #228]
	strd	r1, r4, [sp, #184]
	movs	r1, #100
	strb	r1, [sp, #200]
	ldr	r1, .L205+32
	str	r3, [sp, #260]
	str	r3, [sp, #292]
	strd	r1, r8, [sp, #204]
	ldr	r1, .L205+36
	strd	r4, r4, [sp, #220]
	strd	r4, r4, [sp, #252]
	strd	r1, r4, [sp, #212]
	movs	r1, #99
	strb	r1, [sp, #232]
	ldr	r1, .L205+40
	strd	r4, r4, [sp, #284]
	strd	r1, r7, [sp, #236]
	ldr	r1, .L205+44
	strd	r1, r4, [sp, #244]
	movs	r1, #67
	strb	r1, [sp, #264]
	ldr	r1, .L205+48
	strd	r1, r6, [sp, #268]
	ldr	r1, .L205+52
	strd	r1, r4, [sp, #276]
	movs	r1, #105
	strb	r1, [sp, #296]
	ldr	r1, .L205+56
	strd	r1, r10, [sp, #300]
	ldr	r1, .L205+60
	strd	r1, r4, [sp, #308]
	add	r1, sp, #100
	str	r3, [sp, #324]
	ldr	r3, .L205+64
	strd	r4, r4, [sp, #316]
	strb	r4, [sp, #328]
	strd	r3, r2, [sp, #332]
	ldr	r3, .L205+68
	ldr	r2, .L205+72
	strd	r4, r4, [sp, #348]
	strd	r3, r4, [sp, #340]
	movs	r3, #6
	str	r3, [sp, #356]
	movs	r3, #111
	strb	r3, [sp, #360]
	ldr	r3, .L205+76
	strd	r4, r4, [sp, #380]
	str	r4, [sp, #388]
	strd	r3, r5, [sp, #364]
	ldr	r3, .L205+80
	strb	r4, [sp, #392]
	strd	r4, r4, [sp, #396]
	strd	r3, r4, [sp, #372]
	mov	r3, r4
	strd	r4, r4, [sp, #404]
	strd	r4, r4, [sp, #412]
	bl	rk_argparse_init
	ldr	r2, .L205+84
	ldr	r1, .L205+88
	add	r0, sp, #60
	bl	rk_argparse_describe
	ldrd	r1, r2, [sp, #20]
	add	r0, sp, #60
	bl	rk_argparse_parse
	ldr	r3, [r5]
	ldr	r0, .L205+92
	str	r3, [sp, #8]
	ldr	r3, [r6]
	str	r3, [sp, #4]
	ldr	r3, [r10]
	str	r3, [sp]
	ldr	r3, [r7]
	ldr	r2, [r8]
	ldr	r1, [r9]
	bl	rkos_printk
	ldr	r3, [r6]
	ldr	r9, [r9]
	ldr	r8, [r8]
	ldr	r7, [r7]
	mov	r0, r9
	ldr	r10, [r10]
	mov	r1, r8
	mov	r2, r7
	str	r3, [sp, #20]
	ldr	r3, [r5]
	str	r3, [sp, #24]
	bl	vsys_get_node_from_map
	mov	r6, r0
	str	fp, [sp, #28]
	cbnz	r0, .L195
	movs	r3, #169
	strd	r8, r7, [sp, #8]
	str	r3, [sp]
	movs	r1, #2
	str	r9, [sp, #4]
	ldr	r3, .L205+96
	ldr	r2, .L205+100
	bl	vlog
.L196:
	ldr	r3, [sp, #28]
	movs	r0, #0
	ldr	r2, [sp, #484]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L203
	bl	__stack_chk_fail
.L195:
	mov	r1, r4
	movs	r0, #40
	bl	rkos_kmalloc
	mov	r5, r0
	cbnz	r0, .L197
	movs	r3, #174
	ldr	r2, .L205+104
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L205+96
	bl	vlog
	b	.L196
.L197:
	ldr	r3, .L205+108
	add	fp, sp, #420
	ldr	r1, .L205+112
	mov	r0, fp
	ldr	r2, [r3, r9, lsl #2]
	ldr	r3, .L205+116
	strd	r2, r8, [sp]
	cmp	r10, #0
	it	eq
	moveq	r3, r1
	ldr	r2, .L205+120
	movs	r1, #64
	strd	r7, r3, [sp, #8]
	ldr	r3, [sp, #24]
	bl	snprintf
	mov	r2, r4
	mov	r1, r4
	mov	r0, fp
	bl	rkos_fopen
	str	r0, [r5, #36]
	cbnz	r0, .L199
	movs	r3, #180
	str	fp, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L205+96
	ldr	r2, .L205+124
	bl	vlog
	ldr	r0, [r5, #36]
	cbnz	r0, .L200
.L201:
	mov	r0, r5
	bl	rkos_kfree
	b	.L196
.L199:
	ldr	r3, [sp, #20]
	movw	r1, #14116
	ldr	r0, .L205+128
	strd	r9, r8, [r5, #16]
	str	r3, [r5, #28]
	adds	r3, r5, #4
	str	r7, [r5, #24]
	str	r10, [r5, #32]
	str	r6, [r5, #12]
	ldr	r2, [r0, r1]
	str	r3, [r0, r1]
	ldr	r1, .L205+132
	strd	r1, r2, [r5, #4]
	str	r3, [r2]
	ldr	r3, .L205+136
	cmp	r10, #0
	beq	.L202
	ldr	r2, [r6, #360]
	str	r2, [r5]
	str	r3, [r6, #360]
	movs	r3, #1
	str	r3, [r6, #356]
	b	.L196
.L202:
	ldr	r2, [r6, #372]
	str	r2, [r5]
	str	r3, [r6, #372]
	movs	r3, #1
	str	r3, [r6, #368]
	b	.L196
.L200:
	bl	rkos_fclose
	b	.L201
.L203:
	add	sp, sp, #492
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L206:
	.align	2
.L205:
	.word	.LC16
	.word	.LC12
	.word	.LC17
	.word	.LC13
	.word	.LC14
	.word	rk_argparse_help_cb
	.word	.LC15
	.word	m_callback
	.word	.LC18
	.word	.LC19
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LANCHOR0+108
	.word	.LC28
	.word	.LC29
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.word	.LANCHOR0+116
	.word	.LC33
	.word	.LC34
	.word	module_name
	.word	.LC11
	.word	.LC10
	.word	.LC35
	.word	.LC36
	.word	g_vsys_dev
	.word	g_vsys_dev+14112
	.word	dumpsys_callback
	.word	__stack_chk_guard
	.fnend
	.size	vsys_main, .-vsys_main
	.global	__aeabi_idivmod
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_thread_fn, %function
vsys_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r0
	ldr	r0, [r0, #84]
	add	r6, r5, #14080
	bl	rkos_kthread_set_name
	ldr	r8, .L233
	adds	r6, r6, #32
.L208:
	bl	rkos_kthread_should_stop
	cbz	r0, .L221
.L209:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #14112
	ldr	r3, [r5, r3]
	ldr	r4, [r3], #-4
	subs	r4, r4, #4
.L222:
	add	r8, r3, #4
	cmp	r8, r6
	bne	.L223
	add	r4, r5, #14080
	add	r5, r5, #14208
	adds	r4, r4, #48
.L225:
	ldr	r3, [r4], #4
	cbz	r3, .L224
	ldr	r0, [r4, #76]
	bl	mpi_obj_unref
.L224:
	cmp	r4, r5
	bne	.L225
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L221:
	ldr	r3, [r5, #152]
	cmp	r3, #0
	bne	.L209
	add	r0, r5, #144
	bl	rkos_down
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r4, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r1, #20
	ldr	r0, [r8]
	bl	__aeabi_idivmod
	add	r7, r5, r1, lsl #2
	add	r3, r7, #14208
	ldr	fp, [r3]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r4	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, [r6]
	movw	r9, #14128
	ldr	r2, [r7, r9]
	ldr	r3, [r4], #-4
	subs	r3, r3, #4
.L210:
	add	r10, r4, #4
	cmp	r10, r6
	beq	.L216
	ldr	r1, [r4, #12]
	cmp	r1, r2
	bne	.L211
	ldr	r3, [r4, #28]
	cmp	r3, #0
	ble	.L212
	ldr	r0, [fp, #656]
	cbz	r0, .L212
	ldr	r3, [fp, #688]
	ldr	r1, [fp, #648]
	cbnz	r3, .L213
	ldrd	r3, r2, [fp, #672]
	muls	r3, r2, r3
	add	r3, r3, r3, lsl #1
	lsrs	r3, r3, #1
.L214:
	cmp	r1, r3
	ldr	r2, [r4, #36]
	it	cs
	movcs	r1, r3
	bl	rkos_fwrite
.L212:
	ldr	r3, [r4, #28]
	subs	r3, r3, #1
	str	r3, [r4, #28]
	cbnz	r3, .L216
	ldr	r2, [r4, #32]
	ldr	r1, [r4, #12]
	cbz	r2, .L217
	str	r3, [r1, #356]
	ldr	r2, [r4, #12]
	str	r3, [r2, #360]
.L218:
	ldr	r0, [r4, #36]
	bl	rkos_fclose
	mov	r0, r10
	bl	list_del
.L216:
	movs	r2, #1
	mov	r1, fp
	ldr	r0, [r7, r9]
	bl	mpi_node_buffer_in
	mov	r0, fp
	bl	mpi_obj_unref
	movs	r3, #0
	str	r3, [r7, r9]
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r2, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r8]
	adds	r3, r3, #1
	str	r3, [r8]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r2	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	b	.L208
.L213:
	mov	r3, r1
	b	.L214
.L217:
	str	r2, [r1, #368]
	ldr	r3, [r4, #12]
	str	r2, [r3, #372]
	b	.L218
.L211:
	ldr	r1, [r3, #4]
	mov	r4, r3
	subs	r3, r1, #4
	b	.L210
.L223:
	ldr	r0, [r3, #36]
	bl	rkos_fclose
	mov	r0, r8
	bl	list_del
	ldr	r2, [r4, #4]
	mov	r3, r4
	subs	r4, r2, #4
	b	.L222
.L234:
	.align	2
.L233:
	.word	g_vsys_dev+14124
	.fnend
	.size	vsys_thread_fn, .-vsys_thread_fn
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_pool_delete, %function
vsys_pool_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r1
	ldr	r3, [r1, #16]	@ unaligned
	ldr	r4, [r0, #128]
	cmp	r3, #536
	beq	.L236
	movw	r3, #610
	ldr	r2, .L244
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L244+4
	movs	r0, #0
	bl	vlog
.L236:
	ldr	r3, [r5]	@ unaligned
	movs	r1, #4
	ldr	r2, .L244+8
	movs	r0, #0
	str	r3, [sp, #4]
	mov	r3, #612
	str	r3, [sp]
	ldr	r3, .L244+4
	bl	vlog
	mov	r3, r4
	ldr	r4, [r3, #24]!
	ldr	r2, [r4], #-84
	subs	r2, r2, #84
.L237:
	add	r0, r4, #84
	cmp	r0, r3
	beq	.L239
	ldr	r1, [r5]	@ unaligned
	ldr	r6, [r4, #80]
	cmp	r6, r1
	bne	.L238
	bl	list_del
	movs	r1, #1
	mov	r0, r4
	bl	mpi_buf_pool_destroy
.L239:
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L238:
	ldr	r1, [r2, #84]
	mov	r4, r2
	sub	r2, r1, #84
	b	.L237
.L245:
	.align	2
.L244:
	.word	.LC37
	.word	.LANCHOR0+130
	.word	.LC38
	.fnend
	.size	vsys_pool_delete, .-vsys_pool_delete
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_release, %function
vsys_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #8
	ldr	r5, [r1, #128]
	ldr	r8, .L257+24
	ldr	r9, .L257
	ldr	r4, [r5, #24]
	sub	r10, r8, #4
	ldr	r6, [r4], #-84
	subs	r6, r6, #84
.L247:
	add	r7, r4, #84
	add	r3, r5, #24
	cmp	r7, r3
	bne	.L250
	ldr	r0, [r5]
	bl	mpi_obj_unref
	ldr	r3, [r5]
	ldr	r2, [r3, #44]
	cmp	r2, #1
	bne	.L251
	ldr	r2, [r3]
	ldr	r1, .L257
	ldr	r0, .L257+4
	bl	rkos_printk
	ldr	r2, .L257+8
	movw	r3, #14104
	ldr	r7, .L257+12
	ldr	r4, [r2, r3]
	ldr	r6, [r4], #-84
	subs	r6, r6, #84
.L252:
	add	r0, r4, #84
	cmp	r0, r7
	bne	.L253
	ldr	r6, .L257+16
	movs	r4, #0
	mov	r7, #-1
.L255:
	ldr	r0, [r6, r4, lsl #3]
	cmp	r0, #0
	blt	.L254
	bl	rkos_dev_close
	str	r7, [r6, r4, lsl #3]
.L254:
	adds	r4, r4, #1
	cmp	r4, #26
	bne	.L255
.L251:
	adds	r0, r5, #4
	bl	mpi_fs_buf_deinit
	mov	r0, r5
	bl	kfree
	movs	r0, #0
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L250:
	ldr	r3, [r4]
	movs	r1, #4
	ldr	r2, .L257+20
	movs	r0, #0
	str	r3, [sp, #4]
	movw	r3, #763
	str	r3, [sp]
	mov	r3, r9
	bl	vlog
	mov	r0, r7
	bl	list_del
	ldr	r3, [r4, #132]
	cbnz	r3, .L248
	movs	r1, #1
	mov	r0, r4
	bl	mpi_buf_pool_destroy
.L249:
	ldr	r3, [r6, #84]
	mov	r4, r6
	sub	r6, r3, #84
	b	.L247
.L248:
	ldr	r3, [r8]
	str	r7, [r8]
	strd	r10, r3, [r4, #84]
	str	r7, [r3]
	b	.L249
.L253:
	bl	list_del
	mov	r0, r4
	movs	r1, #1
	mov	r4, r6
	bl	mpi_buf_pool_destroy
	ldr	r3, [r6, #84]
	sub	r6, r3, #84
	b	.L252
.L258:
	.align	2
.L257:
	.word	.LANCHOR0+147
	.word	.LC40
	.word	g_vsys_dev
	.word	g_vsys_dev+14104
	.word	.LANCHOR1
	.word	.LC39
	.word	g_vsys_dev+14108
	.fnend
	.size	vsys_release, .-vsys_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_write, %function
vsys_write:
	.fnstart
	@ args = 0, pretend = 0, frame = 520
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #520
	sub	sp, sp, #520
	ldr	r5, .L261
	cmp	r2, #510
	mov	r4, r2
	mov	r6, r2
	it	cs
	movcs	r4, #510
	ldr	r3, [r5]
	mov	r2, r4
	str	r3, [sp, #516]
	add	r3, sp, #4
	mov	r0, r3
	bl	memcpy
	movs	r2, #0
	ldr	r1, .L261+4
	strb	r2, [r0, r4]
	add	r4, r4, r0
	strb	r2, [r4, #-1]
	bl	rk_argparse_excute_main
	mov	r0, r6
	ldr	r2, [sp, #516]
	ldr	r3, [r5]
	cmp	r2, r3
	beq	.L260
	bl	__stack_chk_fail
.L260:
	add	sp, sp, #520
	@ sp needed
	pop	{r4, r5, r6, pc}
.L262:
	.align	2
.L261:
	.word	__stack_chk_guard
	.word	vsys_main
	.fnend
	.size	vsys_write, .-vsys_write
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_read, %function
vsys_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #100
	sub	sp, sp, #100
	ldr	r5, [r0, #128]
	mov	r8, r2
	str	r1, [sp, #92]
	adds	r5, r5, #4
	mov	r0, r5
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r4, r0
	bne	.L264
	ldr	r3, .L304
	mov	r0, r5
	ldr	r2, .L304+4
	ldr	r1, .L304+8
	str	r3, [sp]
	ldr	r7, .L304+12
	ldr	r3, .L304+16
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	ldr	r1, .L304+20
	mov	r0, r5
	ldr	r10, .L304+68
	bl	mpi_fs_buf_add
	ldr	r1, .L304+24
	mov	r0, r5
	ldr	fp, .L304+60
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	subs	r4, r4, #72
.L265:
	add	r3, r4, #72
	cmp	r3, r7
	beq	.L273
	ldr	r1, [r4, #40]
	mov	r0, r5
	ldr	r2, [r4, #44]
	ldr	r3, [r4, #80]
	str	r1, [sp, #80]
	ldr	r1, [r4, #312]
	str	r1, [sp, #76]
	ldr	r1, [r4, #308]
	str	r1, [sp, #72]
	ldr	r1, [r4, #412]
	str	r1, [sp, #68]
	ldr	r1, [r4, #420]
	str	r1, [sp, #64]
	ldr	r1, [r4, #428]
	str	r1, [sp, #60]
	ldr	r1, [r4, #252]
	str	r1, [sp, #56]
	ldr	r1, [r4, #244]
	str	r1, [sp, #52]
	ldr	r1, [r4, #240]
	str	r1, [sp, #48]
	ldr	r1, [r4, #232]
	str	r1, [sp, #44]
	ldr	r1, [r4, #408]
	str	r1, [sp, #40]
	ldr	r1, [r4, #416]
	str	r1, [sp, #36]
	ldr	r1, [r4, #424]
	str	r1, [sp, #32]
	ldr	r1, [r4, #192]
	str	r1, [sp, #28]
	ldr	r1, [r4, #176]
	str	r1, [sp, #24]
	ldr	r1, [r4, #172]
	str	r1, [sp, #20]
	ldr	r1, [r4, #164]
	strd	r2, r1, [sp, #12]
	ldr	r2, [r4, #112]
	ldr	r1, .L304+28
	str	r2, [sp, #8]
	ldr	r2, [r4, #92]
	strd	r4, r2, [sp]
	ldr	r3, [r3, #80]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L266
.L273:
	ldr	r1, .L304+32
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r1, .L304+36
	mov	r0, r5
	ldr	r9, .L304+72
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	ldr	r10, .L304+76
	subs	r4, r4, #72
.L267:
	add	r3, r4, #72
	cmp	r3, r7
	bne	.L284
.L275:
	ldr	r7, .L304+40
	mov	r0, r5
	ldr	r1, .L304+44
	bl	mpi_fs_buf_add
	ldr	r1, .L304+48
	mov	r0, r5
	ldr	r10, .L304+68
	bl	mpi_fs_buf_add
	ldr	r4, [r7]
	ldr	fp, .L304+60
	subs	r4, r4, #72
.L277:
	add	r3, r4, #72
	cmp	r3, r7
	beq	.L291
	ldr	r3, [r4, #44]
	mov	r0, r5
	ldr	r1, .L304+52
	strd	r4, r3, [sp]
	ldr	r3, [r4, #80]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L285
.L291:
	mov	r2, r8
	ldr	r1, [sp, #92]
	mov	r0, r5
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L266:
	ldr	r6, [r4, #328]
	add	r9, r4, #328
	subs	r6, r6, #4
.L268:
	adds	r2, r6, #4
	cmp	r2, r9
	beq	.L271
	ldr	r2, [r6]
	mov	r1, r10
	mov	r0, r5
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	cbz	r0, .L269
.L271:
	mov	r1, fp
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L265
.L269:
	ldr	r6, [r6, #4]
	subs	r6, r6, #4
	b	.L268
.L284:
	ldr	r3, [r4, #192]
	cbz	r3, .L274
	ldr	r3, [r4, #80]
	mov	r1, r9
	ldr	r2, .L304+56
	mov	r0, r5
	str	r2, [sp]
	ldr	r3, [r3, #80]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L275
	mvn	fp, #199
	add	r6, r4, #200
	sub	fp, fp, r4
.L276:
	ldr	r1, [r4, #192]
	add	r2, fp, r6
	cmp	r1, r2
	ble	.L279
	ldrb	r2, [r6], #1	@ zero_extendqisi2
	mov	r1, r10
	mov	r0, r5
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L276
.L279:
	ldr	r1, .L304+60
	mov	r0, r5
	bl	mpi_fs_buf_add
.L274:
	ldr	r3, [r4, #252]
	cbz	r3, .L280
	ldr	r3, [r4, #80]
	mov	r1, r9
	ldr	r2, .L304+64
	mov	r0, r5
	str	r2, [sp]
	ldr	r3, [r3, #80]
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cmp	r0, #0
	bne	.L275
	ldr	fp, .L304+80
	add	r6, r4, #260
	sub	fp, fp, r4
.L281:
	ldr	r1, [r4, #252]
	add	r2, fp, r6
	cmp	r1, r2
	ble	.L283
	ldrb	r2, [r6], #1	@ zero_extendqisi2
	mov	r1, r10
	mov	r0, r5
	bl	mpi_fs_buf_add
	cmp	r0, #0
	beq	.L281
.L283:
	ldr	r1, .L304+60
	mov	r0, r5
	bl	mpi_fs_buf_add
.L280:
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L267
.L285:
	mov	r9, r4
	ldr	r6, [r9, #124]!
.L303:
	subs	r6, r6, #84
	add	r2, r6, #84
	cmp	r2, r9
	beq	.L289
	ldr	r2, [r6]
	mov	r1, r10
	mov	r0, r5
	bl	mpi_fs_buf_add
	cbz	r0, .L287
.L289:
	mov	r1, fp
	mov	r0, r5
	bl	mpi_fs_buf_add
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L277
.L287:
	ldr	r6, [r6, #84]
	b	.L303
.L264:
	cbnz	r0, .L263
	mov	r0, r5
	bl	mpi_fs_buf_reset
.L263:
	mov	r0, r4
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L305:
	.align	2
.L304:
	.word	.LC43
	.word	g_vsys_dev
	.word	.LC42
	.word	mpi_node_list
	.word	.LC41
	.word	.LC44
	.word	.LC45
	.word	.LC46
	.word	.LC47
	.word	.LC48
	.word	mpi_dev_list
	.word	.LC52
	.word	.LC53
	.word	.LC55
	.word	.LC10
	.word	.LC50
	.word	.LC11
	.word	.LC49
	.word	.LC51
	.word	.LC54
	.word	-260
	.fnend
	.size	vsys_read, .-vsys_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_force_lost_frame, %function
vsys_force_lost_frame:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #20
	beq	.L307
	movw	r3, #659
	ldr	r2, .L318
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L318+4
	movs	r0, #0
	bl	vlog
.L307:
	ldr	r0, [r4]	@ unaligned
	ldr	r3, [r4, #8]	@ unaligned
	cmp	r0, #6
	bne	.L308
	adds	r3, r3, #1
.L316:
	str	r3, [r4, #8]	@ unaligned
.L309:
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_get_node_from_map
	mov	r3, r0
	cbnz	r0, .L310
	movw	r3, #670
	ldr	r2, .L318+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L318+4
	bl	vlog
	mov	r0, #-1
.L306:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, pc}
.L308:
	cmp	r0, #17
	bne	.L309
	adds	r3, r3, #2
	b	.L316
.L310:
	ldr	r2, [r4]	@ unaligned
	ldr	r1, [r4, #16]	@ unaligned
	cmp	r2, #8
	ite	eq
	addeq	r0, r0, #256
	addne	r0, r3, #196
	bl	mpi_node_force_lost_frame
	movs	r0, #0
	b	.L306
.L319:
	.align	2
.L318:
	.word	.LC56
	.word	.LANCHOR0+160
	.word	.LC57
	.fnend
	.size	vsys_force_lost_frame, .-vsys_force_lost_frame
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_free_all_cma, %function
vsys_free_all_cma:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	free_all_cma
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vsys_free_all_cma, .-vsys_free_all_cma
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_wait_rcu, %function
vsys_wait_rcu:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	bl	synchronize_rcu
	bl	flush_delayed_fput
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	vsys_wait_rcu, .-vsys_wait_rcu
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_pool_create, %function
vsys_pool_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r6, .L354
	mov	r4, r1
	ldr	r7, [r0, #128]
	ldr	r3, [r6]
	str	r3, [sp, #52]
	ldr	r3, [r1, #16]	@ unaligned
	cmp	r3, #536
	beq	.L323
	movw	r3, #545
	ldr	r2, .L354+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L354+8
	movs	r0, #0
	bl	vlog
.L323:
	ldr	r5, [r4, #8]	@ unaligned
	cbz	r5, .L324
.L331:
	ldr	r0, .L354+12
	bl	mpi_allocator_find_by_name
	mov	r8, r0
	cbnz	r0, .L350
	movw	r3, #565
	ldr	r2, .L354+16
	str	r3, [sp]
	ldr	r3, .L354+8
	str	r0, [sp, #4]
.L351:
	movs	r1, #2
	bl	vlog
	b	.L352
.L327:
	movw	r3, #557
	ldr	r2, .L354+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L354+8
	b	.L353
.L328:
	adds	r5, r5, #1
.L324:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, r5
	ble	.L331
	adds	r3, r5, #6
	ldr	r0, [r4, r3, lsl #2]	@ unaligned
	bl	get_mpi_buf_from_id
	cmp	r0, #0
	beq	.L327
	ldr	r3, [r0, #44]
	cmp	r3, #1
	beq	.L328
	movw	r3, #553
	ldr	r2, .L354+24
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L354+8
	movs	r0, #0
.L353:
	bl	vlog
.L352:
	mov	r0, #-1
.L322:
	ldr	r2, [sp, #52]
	ldr	r3, [r6]
	cmp	r2, r3
	beq	.L338
	bl	__stack_chk_fail
.L350:
	add	r5, sp, #20
	movs	r1, #32
	mov	r0, r5
	bl	rkos_kthread_get_name
	movs	r3, #0
	ldr	r2, [r4, #12]	@ unaligned
	movs	r1, #1
	mov	r0, r8
	str	r5, [sp]
	bl	mpi_buf_pool_create
	mov	r5, r0
	cbnz	r0, .L332
	movw	r3, #571
	str	r8, [sp, #4]
	str	r3, [sp]
	ldr	r2, .L354+28
	ldr	r3, .L354+8
	b	.L351
.L332:
	ldr	r2, [r7, #28]
	add	r3, r0, #84
	adds	r7, r7, #24
	str	r3, [r7, #4]
	ldr	r10, .L354+8
	strd	r7, r2, [r0, #84]
	movs	r7, #0
	str	r3, [r2]
	ldr	r3, [r4, #20]	@ unaligned
	ldr	fp, .L354+32
	str	r3, [r0, #132]
	ldr	r3, [r4]	@ unaligned
	str	r3, [r0, #80]
.L333:
	ldr	r3, [r4, #4]	@ unaligned
	cmp	r3, r7
	bgt	.L337
	movs	r0, #0
	b	.L322
.L337:
	ldr	r3, [r4, #8]	@ unaligned
	add	r8, r4, r7, lsl #2
	ldr	r0, [r8, #24]	@ unaligned
	cbz	r3, .L334
	bl	dma_buf_get
	mov	r8, r0
	cbz	r0, .L335
	mov	r1, r0
	movs	r2, #1
	mov	r0, r5
	bl	mpi_buf_pool_import_dmabuf
	mov	r0, r8
	bl	dma_buf_put
.L335:
	adds	r7, r7, #1
	b	.L333
.L334:
	bl	get_mpi_buf_from_id
	ldr	r2, [r0, #44]
	mov	r9, r0
	str	r2, [r5, #104]
	cbz	r0, .L336
	bl	mpi_obj_ref
.L336:
	mov	r1, r9
	mov	r0, r5
	bl	mpi_buf_pool_import
	mov	r0, r9
	bl	mpi_obj_unref
	ldr	r3, [r9, #44]
	mov	r2, fp
	movs	r1, #4
	movs	r0, #0
	str	r3, [sp, #8]
	ldr	r3, [r8, #24]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #591
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
	b	.L335
.L338:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L355:
	.align	2
.L354:
	.word	__stack_chk_guard
	.word	.LC37
	.word	.LANCHOR0+182
	.word	.LC58
	.word	.LC61
	.word	.LC60
	.word	.LC59
	.word	.LC62
	.word	.LC63
	.fnend
	.size	vsys_pool_create, .-vsys_pool_create
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	dumpsys_callback, %function
dumpsys_callback:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r0
	ldr	r4, .L365
	mov	r7, r1
	ldr	r3, [r4, #152]
	cbnz	r3, .L356
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r8, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movw	r3, #14120
	movw	r2, #14124
	ldr	r3, [r4, r3]
	ldr	r2, [r4, r2]
	subs	r3, r3, r2
	cmp	r3, #19
	bgt	.L358
	cbz	r1, .L359
	mov	r0, r1
	bl	mpi_obj_ref
.L359:
	movw	r6, #14120
	movs	r1, #20
	ldr	r5, [r4, r6]
	mov	r0, r5
	bl	__aeabi_idivmod
	adds	r0, r5, #1
	cmp	r0, #65536
	addw	r3, r1, #3532
	add	r1, r1, #3552
	str	r9, [r4, r3, lsl #2]
	str	r7, [r4, r1, lsl #2]
	bgt	.L360
	str	r0, [r4, r6]
.L361:
	ldr	r0, .L365+4
	bl	rkos_up
.L358:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r8	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L356:
	pop	{r3, r4, r5, r6, r7, r8, r9, pc}
.L360:
	movs	r1, #20
	movw	r5, #14124
	bl	__aeabi_idivmod
	ldr	r0, [r4, r5]
	str	r1, [r4, r6]
	movs	r1, #20
	bl	__aeabi_idivmod
	str	r1, [r4, r5]
	b	.L361
.L366:
	.align	2
.L365:
	.word	g_vsys_dev
	.word	g_vsys_dev+144
	.fnend
	.size	dumpsys_callback, .-dumpsys_callback
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_ioctl, %function
vsys_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r3, .L371
	mov	r6, r0
	mov	r5, r1
	mov	r7, r2
	adds	r3, r3, #4
	ldr	r2, .L371+4
	ldr	r8, [r3, #136]
	movs	r1, #5
	strd	r4, r3, [sp, #8]
	movs	r0, #0
	movw	r3, #707
	str	r4, [sp, #4]
	str	r3, [sp]
	ldr	r3, .L371+8
	bl	vlog
	ldr	r0, [r8, #160]
	cmp	r0, r4
	bhi	.L368
	movw	r3, #710
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L371+8
	movs	r0, #0
	ldr	r2, .L371+12
	bl	vlog
.L369:
.L367:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L368:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r0
	sbc	r0, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r0
	ldr	r0, [r8, #156]
	movs	r3, #20
	mla	r0, r3, r4, r0
	cbnz	r0, .L370
	movw	r3, #717
	ldr	r2, .L371+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L371+8
	bl	vlog
	b	.L367
.L370:
	mov	r1, r0
	mov	r3, r7
	mov	r2, r5
	mov	r0, r6
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L372:
	.align	2
.L371:
	.word	g_vsys_dev
	.word	.LC64
	.word	.LANCHOR0+199
	.word	.LC65
	.word	.LC66
	.fnend
	.size	vsys_ioctl, .-vsys_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_deinit, %function
vsys_deinit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r0, #128]
	ldr	r3, [r3]
	ldr	r2, [r3, #44]
	cmp	r2, #1
	bgt	.L455
	ldr	r4, [r3, #136]
	movs	r6, #0
	add	r5, r4, #164
	add	r7, r4, #220
.L376:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L375
.L378:
	cmp	r5, r7
	bne	.L376
	add	r6, r4, #276
	movs	r7, #0
.L380:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L379
.L382:
	cmp	r5, r6
	bne	.L380
	add	r5, r4, #5376
	add	r7, r4, #5440
	adds	r5, r5, #20
	adds	r7, r7, #20
	mov	r9, #0
	mov	r8, r5
.L384:
	ldr	r0, [r5], #4
	cbz	r0, .L383
	bl	mpi_node_destroy
	str	r9, [r5, #-4]
.L383:
	cmp	r5, r7
	bne	.L384
	movw	r5, #5460
	ldr	r0, [r4, r5]
	cbz	r0, .L386
	bl	mpi_node_destroy
	movs	r3, #0
	str	r3, [r4, r5]
.L386:
	add	r5, r4, #5568
	add	r10, r4, #11712
	adds	r5, r5, #28
	add	r10, r10, #28
	mov	fp, #0
.L390:
	mov	r9, r5
	movs	r7, #5
.L389:
	ldr	r1, [r9], #4
	cbz	r1, .L388
	ldr	r0, [r5, #-4]
	bl	mpi_node_unbind
	str	fp, [r9, #-4]
.L388:
	subs	r7, r7, #1
	bne	.L389
	str	r7, [r5, #-4]
	adds	r5, r5, #24
	cmp	r5, r10
	bne	.L390
.L393:
	ldr	r0, [r6], #4
	cbz	r0, .L392
	bl	mpi_node_destroy
	str	r7, [r6, #-4]
.L392:
	cmp	r6, r8
	bne	.L393
	add	r5, r4, #5440
	add	r6, r4, #5568
	adds	r5, r5, #24
	adds	r6, r6, #24
	movs	r7, #0
.L395:
	ldr	r0, [r5], #4
	cbz	r0, .L394
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
.L394:
	cmp	r6, r5
	bne	.L395
	add	r5, r4, #11712
	add	r6, r4, #11712
	adds	r5, r5, #24
	adds	r6, r6, #40
	movs	r7, #0
.L397:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L396
.L399:
	cmp	r5, r6
	bne	.L397
	add	r6, r4, #11712
	movs	r7, #0
	adds	r6, r6, #56
.L401:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L400
.L403:
	cmp	r5, r6
	bne	.L401
	add	r6, r4, #12032
	add	r5, r4, #12544
	adds	r6, r6, #24
	adds	r5, r5, #24
	movs	r7, #0
.L405:
	ldr	r0, [r6], #4
	cmp	r0, #0
	bne	.L404
.L407:
	cmp	r5, r6
	bne	.L405
	add	r6, r4, #13056
	movs	r7, #0
	adds	r6, r6, #24
.L409:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L408
.L411:
	cmp	r5, r6
	bne	.L409
	add	r4, r4, #14080
	movs	r6, #0
	adds	r4, r4, #24
.L413:
	ldr	r0, [r5], #4
	cbz	r0, .L412
	bl	mpi_node_destroy
	str	r6, [r5, #-4]
.L412:
	cmp	r4, r5
	bne	.L413
	ldr	r3, .L464
	ldr	r9, .L464+8
	ldr	r10, .L464+12
	ldr	r4, [r3]
	mov	r8, r3
	ldr	r5, [r4], #-72
	subs	r5, r5, #72
.L414:
	add	r3, r4, #72
	cmp	r3, r8
	bne	.L421
	ldr	r5, .L464+4
	ldr	r0, [r5]
	ldr	r4, [r0], #-72
	subs	r4, r4, #72
.L418:
	add	r3, r0, #72
	cmp	r3, r5
	bne	.L419
.L455:
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L375:
	bl	mpi_node_destroy
	str	r6, [r5, #-4]
	b	.L378
.L379:
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
	b	.L382
.L396:
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
	b	.L399
.L400:
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
	b	.L403
.L404:
	bl	mpi_node_destroy
	str	r7, [r6, #-4]
	b	.L407
.L408:
	bl	mpi_node_destroy
	str	r7, [r5, #-4]
	b	.L411
.L416:
	mov	r1, r9
	mov	r0, r7
	bl	strcmp
	cbz	r0, .L415
	mov	r1, r10
	mov	r0, r7
	bl	strcmp
	cbz	r0, .L415
	mov	r0, r4
	bl	mpi_obj_unref
.L415:
	adds	r6, r6, #1
.L417:
	ldr	r3, [r4, #44]
	cmp	r6, r3
	blt	.L416
	ldr	r3, [r5, #72]
	mov	r4, r5
	sub	r5, r3, #72
	b	.L414
.L421:
	movs	r6, #0
	adds	r7, r4, #4
	b	.L417
.L419:
	movs	r1, #1
	bl	mpi_buf_pool_destroy
	ldr	r3, [r4, #72]
	mov	r0, r4
	sub	r4, r3, #72
	b	.L418
.L465:
	.align	2
.L464:
	.word	mpi_buf_list
	.word	mpi_buf_pool_list
	.word	.LC67
	.word	.LC68
	.fnend
	.size	vsys_deinit, .-vsys_deinit
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_open, %function
vsys_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L471
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r7, r1
	ldr	r0, [r3, #20]
	mov	r1, #3520
	bl	kmem_cache_alloc
	mov	r4, r0
	cbnz	r0, .L467
	movw	r3, #741
	ldr	r2, .L471+4
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L471+8
	bl	vlog
.L470:
	mov	r6, #-1
.L466:
	mov	r0, r6
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L467:
	mov	r1, #10240
	adds	r0, r0, #4
	bl	mpi_fs_buf_init
	mov	r6, r0
	cbz	r0, .L469
	mov	r0, r4
	bl	kfree
	b	.L470
.L469:
	ldr	r5, .L471+12
	add	r3, r4, #24
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	r0, r5
	bl	mpi_obj_ref
	ldr	r3, [r5, #44]
	str	r5, [r4]
	subs	r5, r5, #4
	cmp	r3, #2
	str	r4, [r7, #128]
	bne	.L466
	ldr	r1, [r5, #4]
	ldr	r0, .L471+16
	bl	rkos_printk
	b	.L466
.L472:
	.align	2
.L471:
	.word	kmalloc_caches
	.word	.LC69
	.word	.LANCHOR0+210
	.word	g_vsys_dev+4
	.word	.LC70
	.fnend
	.size	vsys_open, .-vsys_open
	.align	1
	.global	vmpi_ioctl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vmpi_ioctl, %function
vmpi_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	mov	r4, r0
	ldr	r5, .L478
	mov	r8, r1
	mov	r9, r2
	add	r6, r5, r0, lsl #3
	mov	r7, r5
	ldr	r0, [r6, #4]
	cbz	r0, .L473
	ldr	r3, [r5, r4, lsl #3]
	adds	r3, r3, #1
	bne	.L475
	movs	r1, #0
	bl	rkos_dev_open
	str	r0, [r5, r4, lsl #3]
	adds	r0, r0, #1
	bne	.L475
	ldr	r3, [r6, #4]
	movs	r1, #2
	ldr	r2, .L478+4
	movs	r0, #0
	str	r3, [sp, #4]
	movs	r3, #134
	str	r3, [sp]
	ldr	r3, .L478+8
	bl	vlog
.L473:
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L475:
	mov	r2, r9
	mov	r1, r8
	ldr	r0, [r7, r4, lsl #3]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	b	rkos_dev_ioctl
.L479:
	.align	2
.L478:
	.word	.LANCHOR1
	.word	.LC36
	.word	.LANCHOR0+220
	.fnend
	.size	vmpi_ioctl, .-vmpi_ioctl
	.align	1
	.global	vsys_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_probe, %function
vsys_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r5, r0
	ldr	r4, .L481
	movw	r2, #14320
	movs	r1, #0
	ldr	r7, .L481+4
	adds	r6, r4, #4
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	mov	r0, r5
	bl	kstrdup
	mov	r2, r5
	movs	r1, #8
	movs	r5, #0
	add	r3, r7, #232
	str	r4, [r4, #140]
	str	r3, [r4, #156]
	movs	r3, #10
	str	r3, [r4, #160]
	str	r0, [r4]
	mov	r0, r6
	bl	mpi_dev_register
	mov	r1, r5
	add	r0, r4, #144
	str	r5, [r4, #108]
	strd	r5, r5, [r4, #116]
	bl	rkos_sema_init
	mov	r2, r5
	add	r1, r7, #432
	mov	r0, r6
	bl	mpi_sysfs_dev_add
	movw	r3, #14120
	str	r5, [r4, r3]
	movw	r3, #14124
	str	r5, [r4, r3]
	mov	r1, r4
	mov	r3, #2048
	ldr	r2, .L481+8
	ldr	r0, .L481+12
	str	r5, [sp]
	bl	rkos_kthread_create
	movw	r2, #14104
	adds	r3, r4, r2
	str	r3, [r4, r2]
	movw	r2, #14108
	str	r3, [r4, r2]
	movw	r2, #14112
	adds	r3, r4, r2
	str	r3, [r4, r2]
	movw	r2, #14116
	str	r3, [r4, r2]
	str	r0, [r4, #148]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L482:
	.align	2
.L481:
	.word	g_vsys_dev
	.word	.LANCHOR0
	.word	.LC71
	.word	vsys_thread_fn
	.fnend
	.size	vsys_probe, .-vsys_probe
	.align	1
	.global	vsys_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_shutdown, %function
vsys_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r5, #1
	ldr	r4, .L488
	add	r0, r4, #144
	str	r5, [r4, #152]
	bl	rkos_up
	ldr	r0, [r4, #148]
	cbz	r0, .L484
	mov	r1, r5
	bl	rkos_kthread_destory
.L484:
	ldr	r4, .L488+4
	mov	r0, r4
	bl	rkos_sema_destory
	sub	r0, r4, #140
	bl	mpi_sysfs_dev_remove
	sub	r0, r4, #140
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-144]
	pop	{r3, r4, r5, lr}
	b	kfree
.L489:
	.align	2
.L488:
	.word	g_vsys_dev
	.word	g_vsys_dev+144
	.fnend
	.size	vsys_shutdown, .-vsys_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vsys_load
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_load, %function
vsys_load:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L491
	bl	vsys_probe
	movs	r0, #0
	pop	{r3, pc}
.L492:
	.align	2
.L491:
	.word	.LC71
	.fnend
	.size	vsys_load, .-vsys_load
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vsys_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_exit, %function
vsys_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	vsys_shutdown
	.fnend
	.size	vsys_exit, .-vsys_exit
	.text
	.align	1
	.global	vsys_close
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vsys_close, %function
vsys_close:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movs	r4, #0
	ldr	r5, .L547
.L496:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L495
.L498:
	adds	r4, r4, #1
	cmp	r4, #14
	bne	.L496
	ldr	r5, .L547+4
	movs	r4, #0
.L500:
	ldr	r0, [r5], #4
	cmp	r0, #0
	bne	.L499
.L502:
	adds	r4, r4, #1
	cmp	r4, #14
	bne	.L500
	ldr	r5, .L547+8
	movs	r4, #0
.L504:
	ldr	r0, [r5], #4
	cbz	r0, .L503
	bl	mpi_node_stream_pause
.L503:
	adds	r4, r4, #1
	cmp	r4, #16
	bne	.L504
	ldr	r2, .L547+12
	movw	r3, #5460
	ldr	r0, [r2, r3]
	cbz	r0, .L507
	bl	mpi_node_stream_pause
.L507:
	ldr	r5, .L547+16
	movs	r4, #0
.L506:
	ldr	r0, [r5], #4
	cbz	r0, .L509
	bl	mpi_node_stream_pause
.L509:
	adds	r4, r4, #1
	cmp	r4, #1280
	bne	.L506
	ldr	r5, .L547+20
	movs	r4, #0
.L511:
	ldr	r0, [r5], #4
	cbz	r0, .L510
	bl	mpi_node_stream_pause
.L510:
	adds	r4, r4, #1
	cmp	r4, #32
	bne	.L511
	ldr	r5, .L547+24
	movs	r4, #0
.L513:
	ldr	r0, [r5], #4
	cbnz	r0, .L512
.L515:
	adds	r4, r4, #1
	cmp	r4, #4
	bne	.L513
	ldr	r5, .L547+28
	movs	r4, #0
.L517:
	ldr	r0, [r5], #4
	cbnz	r0, .L516
.L519:
	adds	r4, r4, #1
	cmp	r4, #4
	bne	.L517
	ldr	r5, .L547+32
	movs	r4, #0
.L521:
	ldr	r0, [r5], #4
	cbz	r0, .L520
	bl	mpi_node_stream_pause
.L520:
	adds	r4, r4, #1
	cmp	r4, #256
	bne	.L521
	movs	r0, #100
	pop	{r3, r4, r5, lr}
	b	rkos_msleep
.L495:
	bl	mpi_node_stream_pause
	b	.L498
.L499:
	bl	mpi_node_stream_pause
	b	.L502
.L512:
	bl	mpi_node_stream_pause
	b	.L515
.L516:
	bl	mpi_node_stream_pause
	b	.L519
.L548:
	.align	2
.L547:
	.word	g_vsys_dev+164
	.word	g_vsys_dev+220
	.word	g_vsys_dev+5396
	.word	g_vsys_dev
	.word	g_vsys_dev+276
	.word	g_vsys_dev+5464
	.word	g_vsys_dev+11736
	.word	g_vsys_dev+11752
	.word	g_vsys_dev+13080
	.fnend
	.size	vsys_close, .-vsys_close
	.global	g_vsys_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36805, %object
	.size	__func__.36805, 21
__func__.36805:
	.ascii	"vsys_add_node_to_map\000"
	.type	__func__.36835, %object
	.size	__func__.36835, 23
__func__.36835:
	.ascii	"vsys_get_node_from_map\000"
	.type	__func__.36864, %object
	.size	__func__.36864, 26
__func__.36864:
	.ascii	"vsys_remove_node_from_map\000"
	.type	__func__.36521, %object
	.size	__func__.36521, 13
__func__.36521:
	.ascii	"vsys_version\000"
	.type	__func__.36529, %object
	.size	__func__.36529, 10
__func__.36529:
	.ascii	"vsys_bind\000"
	.type	__func__.36538, %object
	.size	__func__.36538, 12
__func__.36538:
	.ascii	"vsys_unbind\000"
	.space	3
	.type	usages, %object
	.size	usages, 8
usages:
	.word	.LC72
	.word	0
	.type	__func__.36386, %object
	.size	__func__.36386, 14
__func__.36386:
	.ascii	"set_dump_info\000"
	.type	__func__.36651, %object
	.size	__func__.36651, 17
__func__.36651:
	.ascii	"vsys_pool_delete\000"
	.type	__func__.36748, %object
	.size	__func__.36748, 13
__func__.36748:
	.ascii	"vsys_release\000"
	.type	__func__.36684, %object
	.size	__func__.36684, 22
__func__.36684:
	.ascii	"vsys_force_lost_frame\000"
	.type	__func__.36623, %object
	.size	__func__.36623, 17
__func__.36623:
	.ascii	"vsys_pool_create\000"
	.type	__func__.36697, %object
	.size	__func__.36697, 11
__func__.36697:
	.ascii	"vsys_ioctl\000"
	.type	__func__.36719, %object
	.size	__func__.36719, 10
__func__.36719:
	.ascii	"vsys_open\000"
	.type	__func__.36361, %object
	.size	__func__.36361, 11
__func__.36361:
	.ascii	"vmpi_ioctl\000"
	.space	1
	.type	vsys_ioctls, %object
	.size	vsys_ioctls, 200
vsys_ioctls:
	.word	-1065585920
	.word	0
	.word	vsys_version
	.word	.LC73
	.word	0
	.word	-1071877375
	.word	0
	.word	vsys_bind
	.word	.LC74
	.word	0
	.word	-1071877374
	.word	0
	.word	vsys_unbind
	.word	.LC75
	.word	0
	.word	29443
	.word	0
	.word	vsys_init
	.word	.LC76
	.word	0
	.word	29444
	.word	0
	.word	vsys_deinit
	.word	.LC77
	.word	0
	.word	-1038585083
	.word	0
	.word	vsys_pool_create
	.word	.LC78
	.word	0
	.word	-1038585082
	.word	0
	.word	vsys_pool_delete
	.word	.LC79
	.word	0
	.word	29447
	.word	0
	.word	vsys_wait_rcu
	.word	.LC80
	.word	0
	.word	29448
	.word	0
	.word	vsys_free_all_cma
	.word	.LC81
	.word	0
	.word	-1072401655
	.word	0
	.word	vsys_force_lost_frame
	.word	.LC82
	.word	0
	.type	vsys_driver_fops, %object
	.size	vsys_driver_fops, 128
vsys_driver_fops:
	.word	0
	.space	4
	.word	vsys_read
	.word	vsys_write
	.space	20
	.word	0
	.word	vsys_ioctl
	.word	vsys_compat_ioctl
	.word	0
	.space	4
	.word	vsys_open
	.space	4
	.word	vsys_release
	.space	60
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	stDevInf, %object
	.size	stDevInf, 208
stDevInf:
	.word	-1
	.word	0
	.word	-1
	.word	.LC83
	.word	-1
	.word	.LC84
	.word	-1
	.word	.LC85
	.word	-1
	.word	.LC86
	.word	-1
	.word	.LC87
	.word	-1
	.word	.LC88
	.word	-1
	.word	0
	.word	-1
	.word	.LC89
	.word	-1
	.word	.LC90
	.word	-1
	.word	.LC91
	.word	-1
	.word	.LC92
	.word	-1
	.word	.LC93
	.word	-1
	.word	.LC94
	.word	-1
	.word	0
	.word	-1
	.word	0
	.word	-1
	.word	0
	.word	-1
	.word	.LC95
	.word	-1
	.word	0
	.word	-1
	.word	.LC96
	.word	-1
	.word	.LC97
	.word	-1
	.word	.LC86
	.word	-1
	.word	0
	.word	-1
	.word	0
	.word	-1
	.word	0
	.word	-1
	.word	.LC98
	.bss
	.align	2
	.type	g_vsys_dev, %object
	.size	g_vsys_dev, 14320
g_vsys_dev:
	.space	14320
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"mod = %d dev_id = %d, chn_id = %d\000"
.LC1:
	.ascii	"\033[1;31mstruct vsys_version mismatching\033[0m\000"
.LC2:
	.ascii	"\033[1;31mstruct vsys_bind mismatching\033[0m\000"
.LC3:
	.ascii	"\033[1;31mget node from map [src chn] fail\033[0m\000"
.LC4:
	.ascii	"\033[1;32mVPSS GRP %d bind on AIISP node\033[0m\000"
.LC5:
	.ascii	"\033[1;32mSRC mod,dev,chn(%d-%d-%d) bind DEST mod,d"
	.ascii	"ev,chn(%d-%d-%d) success!\033[0m\000"
.LC6:
	.ascii	"\033[1;31mget node from map [dst chn] fail\033[0m\000"
.LC7:
	.ascii	"\033[1;32mVPSS GRP %d unbind on AIISP node\033[0m\000"
.LC8:
	.ascii	"\033[1;32mSRC mod,dev,chn(%d-%d-%d) unbind DEST mod"
	.ascii	",dev,chn(%d-%d-%d) success!\033[0m\000"
.LC9:
	.ascii	"%d : %s\000"
.LC10:
	.ascii	"in\000"
.LC11:
	.ascii	"out\000"
.LC12:
	.ascii	"/tmp\000"
.LC13:
	.ascii	"help\000"
.LC14:
	.ascii	"show this help message and exit\000"
.LC15:
	.ascii	"basic options:\000"
.LC16:
	.ascii	"module_id\000"
.LC17:
	.ascii	"MODULE id. default(0)\000"
.LC18:
	.ascii	"device_id\000"
.LC19:
	.ascii	"device id. default(0)\000"
.LC20:
	.ascii	"channel_id\000"
.LC21:
	.ascii	"channel id default(0)\000"
.LC22:
	.ascii	"frame_cnt\000"
.LC23:
	.ascii	"save frame counnter(default 1)\000"
.LC24:
	.ascii	"input\000"
.LC25:
	.ascii	"save input frame(default 0)\000"
.LC26:
	.ascii	"one_file\000"
.LC27:
	.ascii	"all frame save a file(default 0)\000"
.LC28:
	.ascii	"output_path\000"
.LC29:
	.ascii	"save frame path, (default /tmp)\000"
.LC30:
	.ascii	"\012use --help for details.\000"
.LC31:
	.ascii	"\012select a test case to run.\000"
.LC32:
	.ascii	"modId = %d, devId = %d, chId = %d, is_in %d, cnt = "
	.ascii	"%d, path = %s\000"
.LC33:
	.ascii	"\033[1;31mnode invalid %d, %d, %d\033[0m\000"
.LC34:
	.ascii	"\033[1;31mmalloc fail\033[0m\000"
.LC35:
	.ascii	"%s/%s_%d_%d_%s.bin\000"
.LC36:
	.ascii	"\033[1;31m%s open fail\033[0m\000"
.LC37:
	.ascii	"\033[1;31mstruct vsys_pool mismatching\033[0m\000"
.LC38:
	.ascii	"\033[1;32mpool->id =  %d\033[0m\000"
.LC39:
	.ascii	"\033[1;32mpool id = %d, user process exit\033[0m\000"
.LC40:
	.ascii	"%s, %d\000"
.LC41:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC42:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC43:
	.ascii	"-2024-10-16-16:52:39\000"
.LC44:
	.ascii	"***********************************************mpi "
	.ascii	"node list******************************************"
	.ascii	"*********\012\000"
.LC45:
	.ascii	"id---name--------handle-----nid-uid-ref-infa_cnt-lc"
	.ascii	"nt-frate-fbase-wcnt-depth-timeout-onfa_cnt-lcnt-fra"
	.ascii	"te-fbase-wcnt-depth-timeout-itime-otime-state-next_"
	.ascii	"node-------------\012\000"
.LC46:
	.ascii	"%-#4d %-#11.11s %-#10x %-#3d %-#3d %-#3d %-#8d %-#4"
	.ascii	"d %-#5d %-#5d %-#4d %-#5d %-#7d %-#8d %-#4d %-#5d %"
	.ascii	"-#5d %-#4d %-#5d %-#7d %-#5ld %-#5ld %-#5x \000"
.LC47:
	.ascii	"*********************************************mpi no"
	.ascii	"de frame control***********************************"
	.ascii	"*********\012\000"
.LC48:
	.ascii	"id---name--------table-----------------------------"
	.ascii	"---------------------------------------------------"
	.ascii	"---------\012\000"
.LC49:
	.ascii	"%-#4d  \000"
.LC50:
	.ascii	"\012\000"
.LC51:
	.ascii	"%-#4d %-#11s %-#5s\000"
.LC52:
	.ascii	"***********************************************mpi "
	.ascii	"dev list*******************************************"
	.ascii	"********\012\000"
.LC53:
	.ascii	"id---name--------handle-----ref-node---------------"
	.ascii	"---------------------------------------------------"
	.ascii	"-----\012\000"
.LC54:
	.ascii	"%d \000"
.LC55:
	.ascii	"%-#4d %-#11.11s %-#10x %-#3d \000"
.LC56:
	.ascii	"\033[1;31mstruct vsys_chn_attr mismatching\033[0m\000"
.LC57:
	.ascii	"\033[1;31mget node from map fail\033[0m\000"
.LC58:
	.ascii	"valloc\000"
.LC59:
	.ascii	"\033[1;31mmpi buf refcnt not eq 1\033[0m\000"
.LC60:
	.ascii	"\033[1;31merr mpi buf\033[0m\000"
.LC61:
	.ascii	"\033[1;31merror getting vdev  %p\033[0m\000"
.LC62:
	.ascii	"\033[1;31mcreate pool fail  %p\033[0m\000"
.LC63:
	.ascii	"\033[1;32mmpi_buf id =  %d, refcnt = %d\033[0m\000"
.LC64:
	.ascii	"vsys_ioctl: nr = %d, index = %d dev = %p\000"
.LC65:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC66:
	.ascii	"\033[1;31m error: ioctl is null\033[0m\000"
.LC67:
	.ascii	"mcu\000"
.LC68:
	.ascii	"venc\000"
.LC69:
	.ascii	"\033[1;31mvalloc open fail\033[0m\000"
.LC70:
	.ascii	"vsys dev open %d\000"
.LC71:
	.ascii	"vsys\000"
.LC72:
	.ascii	"echo cap -m 8 -d 0 -c 0 -C 1 -o /tmp > /dev/mpi/vsy"
	.ascii	"s\000"
.LC73:
	.ascii	"VSYS_IOCTL_VERSION\000"
.LC74:
	.ascii	"VSYS_IOCTL_SYS_BIND\000"
.LC75:
	.ascii	"VSYS_IOCTL_SYS_UNBIND\000"
.LC76:
	.ascii	"VSYS_IOCTL_SYS_INIT\000"
.LC77:
	.ascii	"VSYS_IOCTL_SYS_DEINIT\000"
.LC78:
	.ascii	"VSYS_IOCTL_SYS_POOL_CREATE\000"
.LC79:
	.ascii	"VSYS_IOCTL_SYS_POOL_DELETE\000"
.LC80:
	.ascii	"VSYS_IOCTL_WAIT_MMZ_FREE\000"
.LC81:
	.ascii	"VSYS_IOCTL_RELEASE_PHY_MEMORY\000"
.LC82:
	.ascii	"VSYS_IOCTL_FORCE_LOST_FRAME\000"
.LC83:
	.ascii	"/dev/mpi/valloc\000"
.LC84:
	.ascii	"/dev/mpi/vsys\000"
.LC85:
	.ascii	"/dev/mpi/vrgn\000"
.LC86:
	.ascii	"/dev/mpi/venc\000"
.LC87:
	.ascii	"/dev/mpi/vdec\000"
.LC88:
	.ascii	"/dev/mpi/vpss\000"
.LC89:
	.ascii	"/dev/mpi/vvi\000"
.LC90:
	.ascii	"/dev/mpi/vo\000"
.LC91:
	.ascii	"/dev/mpi/ai\000"
.LC92:
	.ascii	"/dev/mpi/ao\000"
.LC93:
	.ascii	"/dev/mpi/aenc\000"
.LC94:
	.ascii	"/dev/mpi/adec\000"
.LC95:
	.ascii	"/dev/mpi/avs\000"
.LC96:
	.ascii	"/dev/mpi/vrga\000"
.LC97:
	.ascii	"/dev/mpi/af\000"
.LC98:
	.ascii	"/dev/mpi/aiisp\000"
	.section	___ksymtab_gpl+vsys_add_node_to_map,"a"
	.align	2
	.type	__ksymtab_vsys_add_node_to_map, %object
	.size	__ksymtab_vsys_add_node_to_map, 12
__ksymtab_vsys_add_node_to_map:
	.word	vsys_add_node_to_map
	.word	__kstrtab_vsys_add_node_to_map
	.word	__kstrtabns_vsys_add_node_to_map
	.section	___ksymtab_gpl+vsys_get_node_from_map,"a"
	.align	2
	.type	__ksymtab_vsys_get_node_from_map, %object
	.size	__ksymtab_vsys_get_node_from_map, 12
__ksymtab_vsys_get_node_from_map:
	.word	vsys_get_node_from_map
	.word	__kstrtab_vsys_get_node_from_map
	.word	__kstrtabns_vsys_get_node_from_map
	.section	___ksymtab_gpl+vsys_get_pool,"a"
	.align	2
	.type	__ksymtab_vsys_get_pool, %object
	.size	__ksymtab_vsys_get_pool, 12
__ksymtab_vsys_get_pool:
	.word	vsys_get_pool
	.word	__kstrtab_vsys_get_pool
	.word	__kstrtabns_vsys_get_pool
	.section	___ksymtab_gpl+vsys_remove_node_from_map,"a"
	.align	2
	.type	__ksymtab_vsys_remove_node_from_map, %object
	.size	__ksymtab_vsys_remove_node_from_map, 12
__ksymtab_vsys_remove_node_from_map:
	.word	vsys_remove_node_from_map
	.word	__kstrtab_vsys_remove_node_from_map
	.word	__kstrtabns_vsys_remove_node_from_map
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
