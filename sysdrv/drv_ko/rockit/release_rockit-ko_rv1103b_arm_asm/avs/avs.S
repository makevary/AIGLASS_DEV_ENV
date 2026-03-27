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
	.file	"avs.c"
	.text
	.syntax unified
	.syntax unified
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
	.type	avs_compat_ioctl, %function
avs_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	avs_compat_ioctl, .-avs_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_handle_message, %function
avs_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	avs_handle_message, .-avs_handle_message
	.align	1
	.global	avs_get_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_get_version, %function
avs_get_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, [r0, #128]
	movs	r2, #124
	movs	r1, #0
	mov	r0, r4
	ldr	r6, [r5, #136]
	bl	rkos_memset
	ldr	r3, [r6, #156]
	str	r3, [r4, #4]	@ unaligned
	ldr	r3, [r5]
	movs	r5, #0
	strb	r5, [r4, #12]
	strb	r5, [r4, #13]
	str	r3, [r4, #8]	@ unaligned
	strb	r5, [r4, #14]
	strb	r5, [r4, #15]
	ldr	r0, [r6, #152]
	bl	rkos_strlen
	str	r0, [r4, #16]	@ unaligned
	ldr	r0, .L7
	bl	rkos_strlen
	movs	r3, #17
	strb	r3, [r4, #88]
	ldr	r3, [r4, #16]	@ unaligned
	strb	r5, [r4, #89]
	cmp	r3, #31
	strb	r5, [r4, #90]
	strb	r5, [r4, #91]
	str	r0, [r4, #52]	@ unaligned
	ble	.L5
	movs	r3, #31
	strb	r5, [r4, #17]
	strb	r3, [r4, #16]
	strb	r5, [r4, #18]
	strb	r5, [r4, #19]
.L5:
	cmp	r0, #32
	ble	.L6
	movs	r3, #0
	movs	r2, #32
	strb	r3, [r4, #53]
	strb	r2, [r4, #52]
	strb	r3, [r4, #54]
	strb	r3, [r4, #55]
.L6:
	ldr	r2, [r4, #16]	@ unaligned
	add	r0, r4, #20
	ldr	r1, [r6, #152]
	bl	rkos_strncpy
	ldr	r2, [r4, #52]	@ unaligned
	ldr	r1, .L7
	add	r0, r4, #56
	bl	rkos_strncpy
	ldr	r2, [r4, #88]	@ unaligned
	ldr	r1, .L7+4
	add	r0, r4, #92
	bl	rkos_strncpy
	movs	r0, #0
	pop	{r4, r5, r6, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.fnend
	.size	avs_get_version, .-avs_get_version
	.align	1
	.global	avs_node_reset
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_node_reset, %function
avs_node_reset:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r0, #17
	ldr	r3, [r1, #4]	@ unaligned
	movs	r1, #4
	ldr	r2, .L10
	str	r3, [sp, #4]
	movw	r3, #395
	str	r3, [sp]
	ldr	r3, .L10+4
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L11:
	.align	2
.L10:
	.word	.LC2
	.word	.LANCHOR0
	.fnend
	.size	avs_node_reset, .-avs_node_reset
	.align	1
	.global	avs_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_node_create, %function
avs_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r3, [r0, #128]
	movs	r5, #0
	mov	r4, r1
	strd	r5, r5, [sp, #24]
	strd	r5, r5, [sp, #32]
	str	r3, [sp, #20]
	ldr	r3, [r1]	@ unaligned
	cmp	r3, #48
	beq	.L13
	movs	r3, #87
	ldr	r2, .L38
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L38+4
	movs	r0, #17
	bl	vlog
.L37:
	mov	r0, #-1
	b	.L12
.L13:
	add	r3, sp, #24
	ldr	r10, .L38+4
	ldr	fp, .L38+36
	mov	r9, r3
	str	r3, [sp, #16]
.L19:
	ldr	r1, [r4, #4]	@ unaligned
	lsls	r7, r5, #8
	mov	r2, r5
	movs	r0, #17
	orr	r7, r7, r1, lsl #16
	bl	vsys_get_node_from_map
	add	r7, r7, #1024
	mov	r8, r0
	str	r0, [r9], #4
	cmp	r0, #0
	beq	.L15
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	strd	r5, r7, [sp, #8]
	movs	r0, #17
	ldr	r2, .L38+8
	str	r3, [sp, #4]
	movs	r3, #97
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
.L16:
	cbz	r5, .L27
	ldr	r10, .L38+4
	movs	r6, #0
	ldr	r9, .L38+40
.L24:
	ldr	r1, [r4, #4]	@ unaligned
	add	fp, r6, #2
	movs	r0, #17
	mov	r2, fp
	orr	r8, r6, r1, lsl #16
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L20
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	strd	r6, r8, [sp, #8]
	movs	r0, #17
	ldr	r2, .L38+12
	str	r3, [sp, #4]
	movs	r3, #121
	str	r3, [sp]
	mov	r3, r10
	bl	vlog
.L21:
	cmp	r6, #0
	beq	.L28
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	ldr	r2, .L38+16
	movs	r0, #17
	str	r3, [sp, #4]
	movs	r3, #139
	str	r3, [sp]
	ldr	r3, .L38+4
	bl	vlog
	movs	r0, #0
.L12:
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L27:
	movs	r5, #1
	b	.L19
.L15:
	mov	r3, r0
	mov	r2, r0
	mov	r1, r7
	ldr	r0, [sp, #20]
	bl	mpi_dev_create_node_with_params
	str	r0, [r9, #-4]
	mov	r6, r0
	ldr	r3, [r4, #4]	@ unaligned
	strd	r5, r7, [sp, #8]
	str	r3, [sp, #4]
	cbnz	r0, .L17
	movs	r3, #103
	ldr	r2, .L38+20
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L38+4
	movs	r0, #17
	bl	vlog
	ldr	r8, .L38+4
	ldr	r9, .L38+44
	add	r5, sp, #32
.L18:
	ldr	r7, [r5], #4
	cbz	r7, .L26
	adds	r2, r6, #2
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r7
	bl	mpi_node_destroy
	movs	r3, #0
	str	r3, [r5, #-4]
	mov	r2, r9
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #4]
	movs	r3, #160
	str	r6, [sp, #8]
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
.L26:
	cmp	r6, #0
	bne	.L37
	movs	r6, #1
	b	.L18
.L17:
	movs	r3, #106
	ldr	r2, .L38+24
	str	r3, [sp]
	movs	r1, #4
	mov	r3, r10
	movs	r0, #17
	bl	vlog
	movs	r2, #24
	mov	r1, r8
	add	r0, r6, #12
	bl	memset
	ldr	r3, [fp]	@ unaligned
	mov	r0, r6
	movs	r1, #2
	str	r3, [r6, #4]	@ unaligned
	ldr	r3, [fp, #4]	@ unaligned
	str	r3, [r6, #8]	@ unaligned
	bl	mpi_node_add_in_watcher
	mov	r3, r6
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_add_node_to_map
	b	.L16
.L28:
	movs	r6, #1
	b	.L24
.L20:
	mov	r3, r0
	mov	r2, r0
	mov	r1, r8
	ldr	r0, [sp, #20]
	bl	mpi_dev_create_node_with_params
	ldr	r3, [r4, #4]	@ unaligned
	mov	r5, r0
	strd	r6, r8, [sp, #8]
	str	r3, [sp, #4]
	cbnz	r0, .L22
	movs	r3, #127
	ldr	r2, .L38+28
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L38+4
	movs	r0, #17
	bl	vlog
	ldr	r7, .L38+4
	ldr	r8, .L38+48
.L23:
	ldr	r3, [sp, #16]
	ldr	r6, [r3], #4
	str	r3, [sp, #16]
	cbz	r6, .L25
	mov	r0, r6
	bl	mpi_node_del_in_watcher
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	movs	r3, #0
	movs	r1, #4
	movs	r0, #17
	ldr	r2, [sp, #16]
	str	r3, [r2, #-4]
	mov	r2, r8
	ldr	r3, [r4, #4]	@ unaligned
	str	r5, [sp, #8]
	str	r3, [sp, #4]
	movs	r3, #150
	str	r3, [sp]
	mov	r3, r7
	bl	vlog
.L25:
	cbz	r5, .L29
	mvn	r0, #1
	b	.L12
.L22:
	movs	r3, #131
	ldr	r2, .L38+32
	str	r3, [sp]
	movs	r1, #4
	mov	r3, r10
	movs	r0, #17
	bl	vlog
	mov	r1, r7
	movs	r2, #26
	add	r0, r5, #10
	bl	memset
	ldr	r2, [r9]	@ unaligned
	mov	r3, r5
	movs	r0, #17
	str	r2, [r5, #4]	@ unaligned
	ldrh	r2, [r9, #4]	@ unaligned
	strh	r2, [r5, #8]	@ unaligned
	ldrb	r2, [r9, #6]	@ zero_extendqisi2
	strb	r2, [r5, #10]
	mov	r2, fp
	ldr	r1, [r4, #4]	@ unaligned
	bl	vsys_add_node_to_map
	b	.L21
.L29:
	movs	r5, #1
	b	.L23
.L39:
	.align	2
.L38:
	.word	.LC3
	.word	.LANCHOR0+15
	.word	.LC4
	.word	.LC8
	.word	.LC12
	.word	.LC5
	.word	.LC6
	.word	.LC9
	.word	.LC10
	.word	.LC7
	.word	.LC11
	.word	.LC14
	.word	.LC13
	.fnend
	.size	avs_node_create, .-avs_node_create
	.align	1
	.global	avs_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_node_start, %function
avs_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #60
	sub	sp, sp, #60
	ldr	r3, [r1]	@ unaligned
	add	r7, sp, #48
	movs	r4, #0
	mov	r5, r1
	cmp	r3, #48
	strd	r4, r4, [sp, #40]
	str	r4, [sp, #48]
	str	r4, [r7, #4]
	beq	.L41
	movs	r3, #249
	ldr	r2, .L84
	str	r3, [sp]
	ldr	r3, .L84+4
.L83:
	movs	r1, #2
	movs	r0, #17
	bl	vlog
.L82:
	mov	r0, #-1
	b	.L40
.L41:
	ldr	r0, .L84+8
	bl	mpi_allocator_find_by_name
	str	r0, [sp, #32]
	cbnz	r0, .L43
	mov	r3, #256
	ldr	r2, .L84+12
	str	r3, [sp]
	ldr	r3, .L84+4
	b	.L83
.L43:
	add	r8, sp, #40
	ldr	fp, .L84+4
	mov	r10, r8
.L51:
	adds	r2, r4, #2
	ldr	r1, [r5, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r9, r0
	str	r0, [r10], #4
	cbnz	r0, .L44
	str	r4, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	ldr	r2, .L84+16
	str	r3, [sp, #4]
	mov	r3, #264
	str	r3, [sp]
	ldr	r3, .L84+4
.L81:
	movs	r1, #2
	movs	r0, #17
	bl	vlog
	movs	r6, #0
.L59:
	ldr	r5, [r7], #4
	ldr	r4, [r8], #4
	cbz	r5, .L56
	cbz	r4, .L57
	mov	r1, r4
	mov	r0, r5
	bl	mpi_buf_pool_del_user
.L57:
	movs	r1, #1
	mov	r0, r5
	bl	mpi_buf_pool_destroy
.L56:
	cbz	r4, .L58
	mov	r0, r4
	bl	mpi_node_del_out_watcher
.L58:
	cmp	r6, #0
	bne	.L82
	movs	r6, #1
	b	.L59
.L60:
	movs	r4, #1
	b	.L51
.L44:
	add	r6, r5, r4, lsl #2
	ldr	r3, [r6, #32]	@ unaligned
	cmp	r3, #2
	bne	.L46
	ldr	r2, [r6, #24]	@ unaligned
	cbnz	r2, .L47
	movs	r3, #1
	str	r3, [r6, #16]	@ unaligned
.L47:
	ldr	r3, .L84+20
	movs	r1, #1
	ldr	r0, [sp, #32]
	str	r3, [sp]
	ldr	r3, [r6, #16]	@ unaligned
	bl	mpi_buf_pool_create
	str	r0, [r7, r4, lsl #2]
	str	r0, [sp, #36]
	cmp	r0, #0
	beq	.L48
	mov	r1, r9
	bl	mpi_buf_pool_add_user
	ldr	r2, [r6, #24]	@ unaligned
	movs	r1, #4
	movs	r0, #17
	str	r2, [sp, #24]
	ldr	r3, [sp, #36]
	ldr	r2, [r6, #16]	@ unaligned
	str	r2, [sp, #20]
	ldr	r2, [r3]
	str	r4, [sp, #8]
	strd	r3, r2, [sp, #12]
	ldr	r3, [r5, #4]	@ unaligned
	ldr	r2, .L84+24
	str	r3, [sp, #4]
	mov	r3, #282
	str	r3, [sp]
	mov	r3, fp
	bl	vlog
.L49:
	ldr	r1, [r6, #8]	@ unaligned
	mov	r0, r9
	bl	mpi_node_add_out_watcher
	cmp	r4, #0
	beq	.L60
	ldr	r0, [sp, #40]
	cbz	r0, .L52
	bl	mpi_node_streamon
	movs	r3, #0
	ldr	r2, .L84+28
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #307
	str	r3, [sp]
	ldr	r3, .L84+4
	bl	vlog
.L52:
	ldr	r0, [sp, #44]
	cbz	r0, .L53
	bl	mpi_node_streamon
	movs	r3, #1
	ldr	r2, .L84+28
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	str	r3, [sp, #4]
	movw	r3, #307
	str	r3, [sp]
	ldr	r3, .L84+4
	bl	vlog
.L53:
	ldr	r6, .L84+4
	movs	r4, #0
	ldr	r7, .L84+32
.L55:
	mov	r2, r4
	ldr	r1, [r5, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_get_node_from_map
	cbz	r0, .L54
	bl	mpi_node_streamon
	mov	r2, r7
	movs	r1, #4
	movs	r0, #17
	str	r4, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #316
	str	r3, [sp]
	mov	r3, r6
	bl	vlog
.L54:
	cmp	r4, #0
	beq	.L61
	ldr	r3, [r5, #4]	@ unaligned
	movs	r1, #4
	ldr	r2, .L84+36
	movs	r0, #17
	str	r3, [sp, #4]
	movw	r3, #321
	str	r3, [sp]
	ldr	r3, .L84+4
	bl	vlog
	movs	r0, #0
.L40:
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L48:
	str	r4, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	ldr	r2, .L84+40
	str	r3, [sp, #4]
	mov	r3, #284
	str	r3, [sp]
	ldr	r3, .L84+4
	b	.L81
.L46:
	cmp	r3, #3
	bne	.L49
	ldr	r0, [r6, #40]	@ unaligned
	bl	vsys_get_pool
	str	r0, [r7, r4, lsl #2]
	str	r0, [sp, #36]
	cbz	r0, .L50
	mov	r1, r9
	bl	mpi_buf_pool_add_user
	ldr	r2, [r6, #40]	@ unaligned
	movs	r1, #4
	movs	r0, #17
	ldr	r3, [sp, #36]
	str	r2, [sp, #16]
	ldr	r2, .L84+44
	strd	r4, r3, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	str	r3, [sp, #4]
	mov	r3, #294
	str	r3, [sp]
	mov	r3, fp
	bl	vlog
	b	.L49
.L50:
	str	r4, [sp, #8]
	ldr	r3, [r5, #4]	@ unaligned
	ldr	r2, .L84+48
	str	r3, [sp, #4]
	mov	r3, #296
	str	r3, [sp]
	ldr	r3, .L84+4
	b	.L81
.L61:
	movs	r4, #1
	b	.L55
.L85:
	.align	2
.L84:
	.word	.LC3
	.word	.LANCHOR0+31
	.word	.LC15
	.word	.LC16
	.word	.LC17
	.word	.LC18
	.word	.LC19
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC20
	.word	.LC21
	.word	.LC22
	.fnend
	.size	avs_node_start, .-avs_node_start
	.align	1
	.global	avs_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_mb_get, %function
avs_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r8, r1
	ldr	r3, [r1]	@ unaligned
	.pad #36
	sub	sp, sp, #36
	cmp	r3, #116
	beq	.L87
	movw	r3, #413
	ldr	r2, .L122
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L122+4
	movs	r0, #17
	bl	vlog
.L96:
	mov	r5, #-1
	b	.L86
.L87:
	ldr	r5, [r1, #12]	@ unaligned
	ldr	r9, [r1, #4]	@ unaligned
	adds	r4, r5, #1
	ldr	r6, [r1, #8]	@ unaligned
	bne	.L103
	mov	r2, r6
	mov	r1, r9
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L89
	movw	r3, #425
	strd	r9, r6, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L122+4
	movs	r0, #17
	ldr	r2, .L122+8
	bl	vlog
.L86:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L103:
	movs	r7, #0
.L89:
	adds	r0, r6, #1
	bne	.L90
	adds	r2, r5, #2
	mov	r1, r9
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L90
	mov	r3, #434
	strd	r9, r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L122+4
	movs	r0, #17
	ldr	r2, .L122+12
	bl	vlog
	b	.L96
.L90:
	ldr	r1, [r8, #16]	@ unaligned
	cmp	r1, #0
	bne	.L91
	ldr	r3, [r8, #20]	@ unaligned
	mov	r0, r7
	str	r3, [r7, #408]
	bl	mpi_node_get_in_buffer
	mov	r4, r0
	cmp	r0, #0
	beq	.L96
	adds	r1, r6, #1
	ldr	r1, [r0, #44]
	ittee	eq
	ldreq	r3, .L122+16
	moveq	r2, r5
	ldrne	r3, .L122+20
	movne	r2, r6
	str	r1, [sp, #24]
	ldr	r1, [r0]
	strd	r3, r2, [sp, #8]
	movw	r3, #445
	ldr	r2, .L122+24
	str	r3, [sp]
	ldr	r3, .L122+4
	strd	r0, r1, [sp, #16]
	str	r9, [sp, #4]
.L121:
	movs	r1, #5
	movs	r0, #17
	bl	vlog
	ldr	r3, [r4, #484]
	cmp	r3, #0
	beq	.L96
	ldr	r3, [r7, #316]
	cbz	r3, .L99
	ldr	r2, [r8, #16]	@ unaligned
	cmp	r2, #0
	bne	.L100
	ldr	r2, [r7, #112]
	add	r6, r3, r6, lsl #3
	ldr	r3, [r6, #4]
	add	r1, r2, #11
	add	r2, r4, r2, lsl #3
	add	r1, r4, r1, lsl #3
	str	r1, [r6, #4]
	strd	r6, r3, [r2, #88]
	str	r1, [r3]
.L99:
	movs	r2, #80
	add	r1, r4, #664
	add	r0, r8, #36
	movs	r5, #0
	bl	rkos_memcpy
	ldr	r3, [r4, #484]
	ldr	r3, [r3]
	str	r3, [r8, #32]	@ unaligned
	ldr	r3, [r4]
	str	r3, [r8, #24]	@ unaligned
	b	.L86
.L91:
	cmp	r1, #1
	bne	.L95
	ldr	r3, [r8, #20]	@ unaligned
	movs	r1, #0
	mov	r0, r7
	str	r3, [r7, #412]
	bl	mpi_node_get_out_buffer
	mov	r4, r0
	cmp	r0, #0
	beq	.L96
	ldr	r1, [r0, #44]
	adds	r2, r6, #1
	ittee	ne
	ldrne	r3, .L122+20
	movne	r2, r6
	ldreq	r3, .L122+16
	moveq	r2, r5
	str	r1, [sp, #24]
	ldr	r1, [r0]
	strd	r3, r2, [sp, #8]
	mov	r3, #452
	str	r9, [sp, #4]
	str	r3, [sp]
	strd	r0, r1, [sp, #16]
	ldr	r3, .L122+4
	ldr	r2, .L122+28
	b	.L121
.L95:
	cmp	r1, #2
	bne	.L96
	movs	r1, #0
	mov	r0, r7
	bl	mpi_node_request_buf
	mov	r4, r0
	cmp	r0, #0
	beq	.L96
	ldr	r1, [r0, #44]
	adds	r3, r6, #1
	ittee	ne
	ldrne	r3, .L122+20
	movne	r2, r6
	ldreq	r3, .L122+16
	moveq	r2, r5
	str	r1, [sp, #24]
	ldr	r1, [r0]
	strd	r3, r2, [sp, #8]
	mov	r3, #458
	str	r9, [sp, #4]
	str	r3, [sp]
	strd	r0, r1, [sp, #16]
	ldr	r3, .L122+4
	ldr	r2, .L122+32
	b	.L121
.L100:
	cmp	r2, #1
	bne	.L101
	ldr	r2, [r7, #112]
	add	r6, r3, r5, lsl #3
	adds	r5, r5, #4
	ldr	r0, [r6, #36]
	add	r1, r2, #27
	add	r2, r4, r2, lsl #3
	add	r3, r3, r5, lsl #3
	add	r1, r4, r1, lsl #3
	str	r1, [r6, #36]
	strd	r3, r0, [r2, #216]
.L120:
	str	r1, [r0]
	b	.L99
.L101:
	cmp	r2, #2
	bne	.L99
	ldr	r2, [r7, #112]
	add	r6, r3, r5, lsl #3
	adds	r5, r5, #2
	ldr	r0, [r6, #20]
	add	r1, r2, #43
	add	r2, r4, r2, lsl #3
	add	r3, r3, r5, lsl #3
	add	r1, r4, r1, lsl #3
	str	r1, [r6, #20]
	strd	r3, r0, [r2, #344]
	b	.L120
.L123:
	.align	2
.L122:
	.word	.LC28
	.word	.LANCHOR0+46
	.word	.LC29
	.word	.LC17
	.word	.LC27
	.word	.LC26
	.word	.LC30
	.word	.LC31
	.word	.LC32
	.fnend
	.size	avs_mb_get, .-avs_mb_get
	.align	1
	.global	avs_mb_send
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_mb_send, %function
avs_mb_send:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r7, r1
	ldr	r3, [r1]	@ unaligned
	.pad #44
	sub	sp, sp, #44
	cmp	r3, #116
	beq	.L125
	movw	r3, #495
	ldr	r2, .L138
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L138+4
	movs	r0, #17
	bl	vlog
.L136:
	mov	r4, #-1
	b	.L124
.L125:
	ldr	r4, [r1, #12]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	ldr	r5, [r1, #8]	@ unaligned
	adds	r1, r4, #1
	bne	.L134
	mov	r2, r5
	mov	r1, r6
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r9, r0
	cbnz	r0, .L127
	movw	r3, #507
	strd	r6, r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L138+4
	movs	r0, #17
	ldr	r2, .L138+8
	bl	vlog
.L124:
	mov	r0, r4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L134:
	mov	r9, #0
.L127:
	adds	r2, r5, #1
	bne	.L128
	adds	r2, r4, #2
	mov	r1, r6
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r9, r0
	cbnz	r0, .L128
	mov	r3, #516
	strd	r6, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L138+4
	movs	r0, #17
	ldr	r2, .L138+12
	bl	vlog
	b	.L136
.L128:
	ldr	r0, [r7, #28]	@ unaligned
	cmp	r0, #0
	bge	.L129
.L137:
	movs	r4, #0
	b	.L124
.L129:
	bl	get_mpi_buf
	ldr	r2, [r7, #28]	@ unaligned
	mov	r8, r0
	cbnz	r0, .L130
	mov	r3, #524
	str	r2, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L138+4
	movs	r0, #17
	ldr	r2, .L138+16
	bl	vlog
	b	.L136
.L130:
	ldr	r1, .L138+20
	adds	r3, r5, #1
	ldr	r3, .L138+24
	itt	ne
	movne	r4, r5
	movne	r3, r1
	ldr	r1, [r0, #44]
	ldr	r0, [r7, #16]	@ unaligned
	strd	r2, r0, [sp, #32]
	movs	r0, #17
	ldr	r2, [r8, #484]
	strd	r1, r2, [sp, #24]
	movs	r1, #5
	ldr	r2, [r8]
	strd	r3, r4, [sp, #8]
	movw	r3, #531
	str	r6, [sp, #4]
	strd	r8, r2, [sp, #16]
	str	r3, [sp]
	ldr	r2, .L138+28
	ldr	r3, .L138+4
	bl	vlog
	movs	r2, #80
	add	r1, r7, #36
	add	r0, r8, #664
	bl	rkos_memcpy
	ldr	r4, [r7, #16]	@ unaligned
	cbnz	r4, .L132
	mov	r2, r4
	mov	r1, r8
	mov	r0, r9
	bl	mpi_node_buffer_in
	b	.L124
.L132:
	cmp	r4, #1
	bne	.L137
	movs	r2, #0
	mov	r1, r8
	mov	r0, r9
	bl	mpi_node_buffer_out
	b	.L137
.L139:
	.align	2
.L138:
	.word	.LC28
	.word	.LANCHOR0+57
	.word	.LC33
	.word	.LC17
	.word	.LC34
	.word	.LC26
	.word	.LC27
	.word	.LC35
	.fnend
	.size	avs_mb_send, .-avs_mb_send
	.align	1
	.global	avs_mb_release
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_mb_release, %function
avs_mb_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r9, r1
	ldr	r3, [r1]	@ unaligned
	.pad #44
	sub	sp, sp, #44
	cmp	r3, #116
	beq	.L141
	movw	r3, #559
	ldr	r2, .L154
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L154+4
	movs	r0, #17
	bl	vlog
.L152:
	mov	r4, #-1
.L140:
	mov	r0, r4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L141:
	ldr	r4, [r1, #12]	@ unaligned
	ldr	r6, [r1, #4]	@ unaligned
	ldr	r5, [r1, #8]	@ unaligned
	adds	r1, r4, #1
	bne	.L149
	mov	r2, r5
	mov	r1, r6
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L143
	movw	r3, #571
	strd	r6, r5, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L154+4
	movs	r0, #17
	ldr	r2, .L154+8
	bl	vlog
	b	.L140
.L149:
	movs	r7, #0
.L143:
	adds	r2, r5, #1
	bne	.L144
	adds	r2, r4, #2
	mov	r1, r6
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r7, r0
	cbnz	r0, .L144
	mov	r3, #580
	strd	r6, r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L154+4
	movs	r0, #17
	ldr	r2, .L154+12
	bl	vlog
	b	.L152
.L144:
	movs	r1, #4
	ldr	r0, [r9, #24]	@ unaligned
	bl	mpi_obj_from_id
	mov	r8, r0
	cmp	r0, #0
	beq	.L145
	ldr	r2, .L154+16
	adds	r3, r5, #1
	ldr	r1, [r9, #16]	@ unaligned
	ldr	r3, .L154+20
	itt	ne
	movne	r4, r5
	movne	r3, r2
	ldr	r2, [r0, #44]
	strd	r2, r1, [sp, #28]
	movs	r1, #5
	ldr	r2, [r9, #24]	@ unaligned
	str	r2, [sp, #24]
	ldr	r2, [r0, #484]
	strd	r3, r4, [sp, #8]
	movw	r3, #591
	str	r6, [sp, #4]
	strd	r0, r2, [sp, #16]
	movs	r0, #17
	str	r3, [sp]
	ldr	r2, .L154+24
	ldr	r3, .L154+4
	bl	vlog
	ldr	r4, [r9, #16]	@ unaligned
	cbnz	r4, .L147
	mov	r0, r7
	add	r2, r7, #424
	mov	r1, r8
	bl	mpi_node_release_buffer_flag
	ldr	r0, [r7, #112]
	adds	r0, r0, #11
	add	r0, r8, r0, lsl #3
	bl	list_del
	b	.L140
.L147:
	cmp	r4, #1
	bne	.L148
	mov	r0, r7
	add	r2, r7, #428
	mov	r1, r8
	bl	mpi_node_release_buffer_flag
	ldr	r0, [r7, #112]
	adds	r0, r0, #27
.L153:
	add	r0, r8, r0, lsl #3
	bl	list_del
.L151:
	movs	r4, #0
	b	.L140
.L148:
	cmp	r4, #2
	bne	.L151
	mov	r0, r7
	movs	r2, #0
	mov	r1, r8
	bl	mpi_node_release_buffer_flag
	ldr	r0, [r7, #112]
	adds	r0, r0, #43
	b	.L153
.L145:
	movw	r3, #603
	ldr	r2, .L154+28
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L154+4
	movs	r0, #17
	bl	vlog
	b	.L151
.L155:
	.align	2
.L154:
	.word	.LC28
	.word	.LANCHOR0+69
	.word	.LC29
	.word	.LC17
	.word	.LC26
	.word	.LC27
	.word	.LC36
	.word	.LC37
	.fnend
	.size	avs_mb_release, .-avs_mb_release
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_open, %function
avs_dev_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L157
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	adds	r0, r3, #4
	str	r0, [r1, #128]
	movs	r2, #9
	str	r2, [r3, #148]
	bl	mpi_obj_ref
	movw	r3, #671
	ldr	r2, .L157+4
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp]
	ldr	r3, .L157+8
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L158:
	.align	2
.L157:
	.word	.LANCHOR1
	.word	.LC38
	.word	.LANCHOR0+84
	.fnend
	.size	avs_dev_open, .-avs_dev_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_destroy_ctx, %function
avs_dev_destroy_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	cbz	r0, .L160
	bl	kfree
.L160:
	movs	r0, #0
	pop	{r3, pc}
	.fnend
	.size	avs_dev_destroy_ctx, .-avs_dev_destroy_ctx
	.align	1
	.global	avs_node_destroy
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_node_destroy, %function
avs_node_destroy:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r1
	ldr	r3, [r1]	@ unaligned
	.pad #28
	sub	sp, sp, #28
	cmp	r3, #48
	beq	.L183
	movs	r3, #179
	ldr	r2, .L201
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L201+4
	movs	r0, #17
	bl	vlog
	mov	r0, #-1
.L164:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L183:
	ldr	r8, .L201+4
	movs	r5, #0
	mvn	r7, #79
.L165:
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L167
	ldr	r0, [r0, #316]
	cmp	r0, #0
	bne	.L168
.L172:
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	ldr	r3, [r4, #4]	@ unaligned
	ldr	r2, .L201+8
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #4]
	movs	r3, #200
	str	r5, [sp, #8]
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
.L167:
	cbz	r5, .L184
	movs	r6, #2
	mvn	r8, #79
.L182:
	mov	r2, r6
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	subs	r3, r6, #2
	str	r3, [sp, #16]
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbz	r0, .L173
	ldr	r9, [r0, #316]
	cmp	r9, #0
	bne	.L174
.L181:
	mov	r2, r6
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
	ldr	r2, .L201+12
	movs	r1, #4
	movs	r0, #17
	ldr	r3, [sp, #16]
	str	r3, [sp, #8]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #4]
	movs	r3, #228
	str	r3, [sp]
	ldr	r3, .L201+4
	bl	vlog
.L173:
	cmp	r6, #3
	bne	.L185
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	ldr	r2, .L201+16
	movs	r0, #17
	str	r3, [sp, #4]
	movs	r3, #231
	str	r3, [sp]
	ldr	r3, .L201+4
	bl	vlog
	movs	r0, #0
	b	.L164
.L184:
	movs	r5, #1
	b	.L165
.L168:
	ldr	r2, [r6, #112]
	add	r9, r0, r5, lsl #3
	ldr	r1, [r0, r5, lsl #3]
	add	r10, r2, #1
	adds	r2, r2, #11
	sub	r3, r7, r10, lsl #3
	add	r1, r1, r3
	ldr	r2, [r1, r2, lsl #3]
	add	r10, r2, r3
.L169:
	ldr	r0, [r6, #112]
	adds	r0, r0, #11
	add	r0, r1, r0, lsl #3
	cmp	r0, r9
	beq	.L172
	cbz	r1, .L170
	bl	list_del
	mov	r0, r1
	bl	mpi_obj_unref
.L170:
	ldr	r3, [r6, #112]
	mov	r1, r10
	adds	r2, r3, #1
	adds	r3, r3, #11
	ldr	r3, [r10, r3, lsl #3]
	sub	r2, r7, r2, lsl #3
	add	r10, r3, r2
	b	.L169
.L185:
	movs	r6, #3
	b	.L182
.L174:
	lsl	fp, r6, #3
	ldr	r0, [r0, #112]
	add	r10, r9, fp
	add	r7, r0, #17
	adds	r0, r0, #27
	ldr	r1, [r10, #16]
	sub	r3, r8, r7, lsl #3
	add	r1, r1, r3
	ldr	r7, [r1, r0, lsl #3]
	add	r7, r7, r3
	add	r3, fp, #16
	add	r3, r3, r9
.L175:
	ldr	r2, [r5, #112]
	add	r0, r2, #27
	add	r0, r1, r0, lsl #3
	cmp	r0, r3
	bne	.L177
	add	r7, r2, #33
	ldr	r1, [r9, fp]
	add	ip, r2, #43
	sub	r3, r8, r7, lsl #3
	add	r1, r1, r3
	ldr	r7, [r1, ip, lsl #3]
	add	r7, r7, r3
.L178:
	ldr	r0, [r5, #112]
	adds	r0, r0, #43
	add	r0, r1, r0, lsl #3
	cmp	r0, r10
	beq	.L181
	cbz	r1, .L179
	bl	list_del
	mov	r0, r1
	bl	mpi_obj_unref
.L179:
	ldr	r3, [r5, #112]
	mov	r1, r7
	add	r0, r3, #33
	adds	r3, r3, #43
	ldr	r3, [r7, r3, lsl #3]
	sub	r0, r8, r0, lsl #3
	adds	r7, r3, r0
	b	.L178
.L177:
	cbz	r1, .L176
	str	r3, [sp, #20]
	bl	list_del
	mov	r0, r1
	bl	mpi_obj_unref
	ldr	r3, [sp, #20]
.L176:
	ldr	r1, [r5, #112]
	add	r0, r1, #17
	adds	r1, r1, #27
	ldr	r2, [r7, r1, lsl #3]
	sub	r0, r8, r0, lsl #3
	mov	r1, r7
	adds	r7, r2, r0
	b	.L175
.L202:
	.align	2
.L201:
	.word	.LC3
	.word	.LANCHOR0+97
	.word	.LC13
	.word	.LC14
	.word	.LC39
	.fnend
	.size	avs_node_destroy, .-avs_node_destroy
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_release, %function
avs_dev_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #44
	sub	sp, sp, #44
	ldr	r4, [r1, #128]
	mov	r0, r4
	bl	mpi_obj_unref
	ldr	r3, [r4, #44]
	cmp	r3, #1
	bne	.L204
	ldr	r8, .L245+24
	movs	r4, #0
.L205:
	movs	r7, #0
	b	.L216
.L225:
	movs	r7, #1
.L216:
	adds	r3, r7, #2
	mov	r1, r4
	movs	r0, #17
	str	r3, [sp, #32]
	mov	r2, r3
	bl	vsys_get_node_from_map
	mov	r5, r0
	cbz	r0, .L206
	ldr	r6, [r0, #96]
	cbz	r6, .L207
	ldr	r3, [r6]
	movs	r1, #4
	ldr	r2, .L245
	movs	r0, #17
	strd	r4, r7, [sp, #4]
	strd	r6, r3, [sp, #12]
	movw	r3, #703
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	mov	r1, r5
	mov	r0, r6
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r6
	bl	mpi_buf_pool_destroy
.L207:
	ldr	r10, [r5, #316]
	cmp	r10, #0
	bne	.L208
.L215:
	ldr	r2, [sp, #32]
	mov	r1, r4
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_destroy
	mov	r3, #732
	ldr	r2, .L245+4
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp]
	mov	r3, r8
	strd	r4, r7, [sp, #4]
	bl	vlog
.L206:
	cmp	r7, #0
	beq	.L225
	movs	r5, #0
	mvn	r7, #79
.L223:
	mov	r2, r5
	mov	r1, r4
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L217
	ldr	r0, [r0, #316]
	cmp	r0, #0
	bne	.L218
.L222:
	mov	r2, r5
	mov	r1, r4
	movs	r0, #17
	bl	vsys_remove_node_from_map
	mov	r0, r6
	bl	mpi_node_destroy
	movw	r3, #753
	ldr	r2, .L245+8
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp]
	mov	r3, r8
	strd	r4, r5, [sp, #4]
	bl	vlog
.L217:
	cmp	r5, #0
	beq	.L226
	cmp	r4, #0
	bne	.L224
	mov	r4, r5
	b	.L205
.L208:
	lsls	r3, r7, #3
	ldr	r2, [r5, #112]
	add	fp, r10, r3
	str	r3, [sp, #36]
	add	r3, r2, #17
	mvn	r9, #79
	ldr	r6, [fp, #32]
	adds	r2, r2, #27
	sub	r3, r9, r3, lsl #3
	add	r6, r6, r3
	ldr	r2, [r6, r2, lsl #3]
	add	r9, r2, r3
	lsls	r3, r7, #3
	adds	r3, r3, #32
	add	r3, r10, r3
	str	r3, [sp, #28]
.L209:
	ldr	r3, [r5, #112]
	ldr	r2, [sp, #28]
	add	r0, r3, #27
	add	r0, r6, r0, lsl #3
	cmp	r0, r2
	bne	.L211
	add	r2, r3, #33
	ldr	r6, [fp, #16]
	mvn	r9, #79
	adds	r3, r3, #43
	sub	r2, r9, r2, lsl #3
	movw	fp, #723
	add	r6, r6, r2
	ldr	r3, [r6, r3, lsl #3]
	add	r9, r3, r2
	ldr	r3, [sp, #36]
	adds	r3, r3, #16
	add	r10, r10, r3
.L212:
	ldr	r0, [r5, #112]
	adds	r0, r0, #43
	add	r0, r6, r0, lsl #3
	cmp	r0, r10
	beq	.L215
	cbz	r6, .L213
	bl	list_del
	ldr	r3, [r6, #44]
	ldr	r2, .L245+12
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #20]
	ldr	r3, [r6]
	strd	r4, r7, [sp, #4]
	str	fp, [sp]
	strd	r6, r3, [sp, #12]
	mov	r3, r8
	bl	vlog
	mov	r0, r6
	bl	mpi_obj_unref
.L213:
	ldr	r3, [r5, #112]
	mvn	r2, #79
	mov	r6, r9
	add	r1, r3, #33
	adds	r3, r3, #43
	ldr	r3, [r9, r3, lsl #3]
	sub	r2, r2, r1, lsl #3
	add	r9, r3, r2
	b	.L212
.L211:
	cbz	r6, .L210
	bl	list_del
	ldr	r3, [r6, #44]
	ldr	r2, .L245+16
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #20]
	ldr	r3, [r6]
	strd	r4, r7, [sp, #4]
	strd	r6, r3, [sp, #12]
	movw	r3, #714
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
	mov	r0, r6
	bl	mpi_obj_unref
.L210:
	ldr	r3, [r5, #112]
	mvn	r2, #79
	mov	r6, r9
	add	r1, r3, #17
	adds	r3, r3, #27
	ldr	r3, [r9, r3, lsl #3]
	sub	r2, r2, r1, lsl #3
	add	r9, r3, r2
	b	.L209
.L226:
	movs	r5, #1
	b	.L223
.L218:
	ldr	r2, [r6, #112]
	add	r9, r0, r5, lsl #3
	ldr	r1, [r0, r5, lsl #3]
	add	r10, r2, #1
	adds	r2, r2, #11
	sub	r3, r7, r10, lsl #3
	add	r1, r1, r3
	ldr	r2, [r1, r2, lsl #3]
	add	r10, r2, r3
.L219:
	ldr	r0, [r6, #112]
	adds	r0, r0, #11
	add	r0, r1, r0, lsl #3
	cmp	r0, r9
	beq	.L222
	cbz	r1, .L220
	bl	list_del
	mov	r0, r1
	bl	mpi_obj_unref
.L220:
	ldr	r3, [r6, #112]
	mov	r1, r10
	adds	r2, r3, #1
	adds	r3, r3, #11
	ldr	r3, [r10, r3, lsl #3]
	sub	r2, r7, r2, lsl #3
	add	r10, r3, r2
	b	.L219
.L224:
	movw	r3, #759
	ldr	r2, .L245+20
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L245+24
	movs	r0, #17
	bl	vlog
.L204:
	movs	r0, #0
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L246:
	.align	2
.L245:
	.word	.LC40
	.word	.LC14
	.word	.LC13
	.word	.LC42
	.word	.LC41
	.word	.LC43
	.word	.LANCHOR0+114
	.fnend
	.size	avs_dev_release, .-avs_dev_release
	.align	1
	.global	avs_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_node_stop, %function
avs_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	mov	r4, r1
	ldr	r3, [r1]	@ unaligned
	.pad #20
	sub	sp, sp, #20
	cmp	r3, #48
	beq	.L254
	mov	r3, #352
	ldr	r2, .L266
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L266+4
	movs	r0, #17
	bl	vlog
	mov	r0, #-1
.L247:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L254:
	ldr	r6, .L266+4
	movs	r5, #0
	ldr	r7, .L266+8
.L248:
	mov	r2, r5
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_get_node_from_map
	cbz	r0, .L250
	bl	mpi_node_streamoff
	ldr	r3, [r4, #4]	@ unaligned
	mov	r2, r7
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #4]
	movw	r3, #361
	str	r5, [sp, #8]
	str	r3, [sp]
	mov	r3, r6
	bl	vlog
.L250:
	cbz	r5, .L255
	ldr	r8, .L266+4
	movs	r5, #0
	ldr	r9, .L266+16
.L253:
	adds	r2, r5, #2
	ldr	r1, [r4, #4]	@ unaligned
	movs	r0, #17
	bl	vsys_get_node_from_map
	mov	r6, r0
	cbz	r0, .L251
	bl	mpi_node_del_out_watcher
	ldr	r7, [r6, #96]
	cbz	r7, .L252
	mov	r1, r6
	mov	r0, r7
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r7
	bl	mpi_buf_pool_destroy
.L252:
	mov	r0, r6
	bl	mpi_node_streamoff
	ldr	r3, [r4, #4]	@ unaligned
	mov	r2, r9
	movs	r1, #4
	movs	r0, #17
	str	r3, [sp, #4]
	movw	r3, #379
	str	r5, [sp, #8]
	str	r3, [sp]
	mov	r3, r8
	bl	vlog
.L251:
	cbz	r5, .L256
	ldr	r3, [r4, #4]	@ unaligned
	movs	r1, #4
	ldr	r2, .L266+12
	movs	r0, #17
	str	r3, [sp, #4]
	mov	r3, #384
	str	r3, [sp]
	ldr	r3, .L266+4
	bl	vlog
	movs	r0, #0
	b	.L247
.L255:
	movs	r5, #1
	b	.L248
.L256:
	movs	r5, #1
	b	.L253
.L267:
	.align	2
.L266:
	.word	.LC3
	.word	.LANCHOR0+130
	.word	.LC44
	.word	.LC46
	.word	.LC45
	.fnend
	.size	avs_node_stop, .-avs_node_stop
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_ioctl, %function
avs_dev_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #16
	uxtb	r4, r1
	ldr	r8, [r0, #128]
	movw	r3, #634
	mov	r5, r0
	str	r3, [sp]
	mov	r6, r1
	mov	r7, r2
	movs	r1, #5
	strd	r4, r8, [sp, #8]
	str	r4, [sp, #4]
	movs	r0, #17
	ldr	r3, .L272
	ldr	r2, .L272+4
	bl	vlog
	ldr	r1, [r8, #144]
	cmp	r1, r4
	bhi	.L269
	movw	r3, #637
	str	r4, [sp, #4]
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L272
	movs	r0, #17
	ldr	r2, .L272+8
	bl	vlog
.L270:
.L268:
	mvn	r0, #21
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L269:
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r1
	sbc	r1, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ands	r4, r4, r1
	ldr	r1, [r8, #140]
	movs	r3, #20
	mla	r1, r3, r4, r1
	cbnz	r1, .L271
	mov	r3, #644
	ldr	r2, .L272+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L272
	movs	r0, #17
	bl	vlog
	b	.L268
.L271:
	mov	r3, r7
	mov	r2, r6
	mov	r0, r5
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpi_ioctl_kernel
.L273:
	.align	2
.L272:
	.word	.LANCHOR0+144
	.word	.LC47
	.word	.LC48
	.word	.LC49
	.fnend
	.size	avs_dev_ioctl, .-avs_dev_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_create_ctx, %function
avs_dev_create_ctx:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r1, #3520
	ldr	r3, .L279
	ldr	r0, [r3, #24]
	bl	kmem_cache_alloc
	cbz	r0, .L274
	str	r0, [r0]
	add	r3, r0, #8
	str	r0, [r0, #4]
	str	r3, [r0, #8]
	str	r3, [r0, #12]
	add	r3, r0, #32
	str	r3, [r0, #32]
	str	r3, [r0, #36]
	add	r3, r0, #16
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	add	r3, r0, #40
	str	r3, [r0, #40]
	str	r3, [r0, #44]
	add	r3, r0, #24
	str	r3, [r0, #24]
	str	r3, [r0, #28]
.L274:
	pop	{r3, pc}
.L280:
	.align	2
.L279:
	.word	kmalloc_caches
	.fnend
	.size	avs_dev_create_ctx, .-avs_dev_create_ctx
	.align	1
	.global	avs_dev_probe
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_probe, %function
avs_dev_probe:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	movs	r2, #160
	ldr	r4, .L282
	mov	r6, r0
	movs	r1, #0
	ldr	r5, .L282+4
	mov	r0, r4
	bl	rkos_memset
	mov	r1, #3264
	mov	r0, r6
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #156]
	add	r3, r5, #160
	str	r3, [r4, #144]
	movs	r3, #9
	str	r3, [r4, #148]
	mov	r2, r6
	ldr	r3, .L282+8
	movs	r1, #8
	str	r4, [r4, #140]
	adds	r4, r4, #4
	str	r3, [r4, #104]
	ldr	r3, .L282+12
	str	r3, [r4, #112]
	ldr	r3, .L282+16
	str	r3, [r4, #116]
	str	r0, [r4, #148]
	mov	r0, r4
	bl	mpi_dev_register
	add	r1, r5, #340
	mov	r0, r4
	movs	r2, #0
	pop	{r4, r5, r6, lr}
	b	mpi_sysfs_dev_add
.L283:
	.align	2
.L282:
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	avs_dev_create_ctx
	.word	avs_dev_destroy_ctx
	.word	avs_handle_message
	.fnend
	.size	avs_dev_probe, .-avs_dev_probe
	.align	1
	.global	avs_dev_shutdown
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_dev_shutdown, %function
avs_dev_shutdown:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L289
	mov	r0, r4
	str	r3, [r0], #4
	bl	mpi_sysfs_dev_remove
	adds	r0, r4, #4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #152]
	cbz	r0, .L284
	bl	rkos_kfree
	movs	r3, #0
	str	r3, [r4, #152]
.L284:
	pop	{r4, pc}
.L290:
	.align	2
.L289:
	.word	.LANCHOR1
	.fnend
	.size	avs_dev_shutdown, .-avs_dev_shutdown
	.section	.init.text,"ax",%progbits
	.align	1
	.global	avs_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_init, %function
avs_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	ldr	r0, .L292
	bl	avs_dev_probe
	movs	r0, #0
	pop	{r3, pc}
.L293:
	.align	2
.L292:
	.word	.LC18
	.fnend
	.size	avs_init, .-avs_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	avs_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	avs_exit, %function
avs_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	avs_dev_shutdown
	.fnend
	.size	avs_exit, .-avs_exit
	.global	g_avs_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36410, %object
	.size	__func__.36410, 15
__func__.36410:
	.ascii	"avs_node_reset\000"
	.type	__func__.36276, %object
	.size	__func__.36276, 16
__func__.36276:
	.ascii	"avs_node_create\000"
	.type	__func__.36375, %object
	.size	__func__.36375, 15
__func__.36375:
	.ascii	"avs_node_start\000"
	.type	__func__.36422, %object
	.size	__func__.36422, 11
__func__.36422:
	.ascii	"avs_mb_get\000"
	.type	__func__.36445, %object
	.size	__func__.36445, 12
__func__.36445:
	.ascii	"avs_mb_send\000"
	.type	__func__.36460, %object
	.size	__func__.36460, 15
__func__.36460:
	.ascii	"avs_mb_release\000"
	.type	__func__.36509, %object
	.size	__func__.36509, 13
__func__.36509:
	.ascii	"avs_dev_open\000"
	.type	__func__.36302, %object
	.size	__func__.36302, 17
__func__.36302:
	.ascii	"avs_node_destroy\000"
	.type	__func__.36527, %object
	.size	__func__.36527, 16
__func__.36527:
	.ascii	"avs_dev_release\000"
	.type	__func__.36398, %object
	.size	__func__.36398, 14
__func__.36398:
	.ascii	"avs_node_stop\000"
	.type	__func__.36482, %object
	.size	__func__.36482, 14
__func__.36482:
	.ascii	"avs_dev_ioctl\000"
	.space	2
	.type	avs_ioctls, %object
	.size	avs_ioctls, 180
avs_ioctls:
	.word	-1065585920
	.word	0
	.word	avs_get_version
	.word	.LC50
	.word	0
	.word	-1070566655
	.word	0
	.word	avs_node_create
	.word	.LC51
	.word	0
	.word	-1070566654
	.word	0
	.word	avs_node_destroy
	.word	.LC52
	.word	0
	.word	-1070566653
	.word	0
	.word	avs_node_start
	.word	.LC53
	.word	0
	.word	-1070566652
	.word	0
	.word	avs_node_stop
	.word	.LC54
	.word	0
	.word	-1070566651
	.word	0
	.word	avs_node_reset
	.word	.LC55
	.word	0
	.word	-1066110202
	.word	16
	.word	avs_mb_get
	.word	.LC56
	.word	0
	.word	-1066110201
	.word	0
	.word	avs_mb_send
	.word	.LC57
	.word	0
	.word	-1066110200
	.word	0
	.word	avs_mb_release
	.word	.LC58
	.word	0
	.type	avs_driver_fops, %object
	.size	avs_driver_fops, 128
avs_driver_fops:
	.word	0
	.space	4
	.word	0
	.space	24
	.word	0
	.word	avs_dev_ioctl
	.word	avs_compat_ioctl
	.word	0
	.space	4
	.word	avs_dev_open
	.space	4
	.word	avs_dev_release
	.space	60
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	g_avs_dev, %object
	.size	g_avs_dev, 160
g_avs_dev:
	.space	160
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"-2024-10-16-16:52:39\000"
.LC1:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC2:
	.ascii	"\033[1;32mAVS Grp %d reset node done!\033[0m\000"
.LC3:
	.ascii	"\033[1;31merror struct avs_dev_info mismatching\033"
	.ascii	"[0m\000"
.LC4:
	.ascii	"\033[1;32mAVS Grp %d Pipe %d node have exist. nick_"
	.ascii	"id %d\033[0m\000"
.LC5:
	.ascii	"\033[1;31merror AVS Grp %d Pipe %d create avs pipe "
	.ascii	"node failed! nick_id %d\033[0m\000"
.LC6:
	.ascii	"\033[1;32mAVS Grp %d Pipe %d node create success! n"
	.ascii	"ick_id %d\033[0m\000"
.LC7:
	.ascii	"avs-pipe\000"
.LC8:
	.ascii	"\033[1;32mAVS Grp %d Chn %d node have exist. nick_i"
	.ascii	"d %d\033[0m\000"
.LC9:
	.ascii	"\033[1;31merror AVS Grp %d Chn %d create avs chn no"
	.ascii	"de failed! nick_id %d\033[0m\000"
.LC10:
	.ascii	"\033[1;32mAVS Grp %d Chn %d node create success! ni"
	.ascii	"ck_id %d\033[0m\000"
.LC11:
	.ascii	"avs-chn\000"
.LC12:
	.ascii	"\033[1;32mAVS Grp %d create node done!\033[0m\000"
.LC13:
	.ascii	"\033[1;32mAVS Grp %d Pipe %d node destroy success!\033"
	.ascii	"[0m\000"
.LC14:
	.ascii	"\033[1;32mAVS Grp %d Chn %d node destroy success!\033"
	.ascii	"[0m\000"
.LC15:
	.ascii	"valloc\000"
.LC16:
	.ascii	"\033[1;31merror getting allocator failed!\033[0m\000"
.LC17:
	.ascii	"\033[1;31merror AVS Grp %d Chn %d get node failed!\033"
	.ascii	"[0m\000"
.LC18:
	.ascii	"avs\000"
.LC19:
	.ascii	"\033[1;32mAVS Grp %d Chn %d create MB_SOURCE_PRIVAT"
	.ascii	"E success! pool %p pool_id %d bufffer_cnt %d bufffe"
	.ascii	"r_size %d\033[0m\000"
.LC20:
	.ascii	"\033[1;31merror AVS Grp %d Chn %d pool create faile"
	.ascii	"d!\033[0m\000"
.LC21:
	.ascii	"\033[1;32mAVS Grp %d Chn %d attach MB_SOURCE_USER s"
	.ascii	"uccess! pool %p pool_id %d\033[0m\000"
.LC22:
	.ascii	"\033[1;31merror AVS Grp %d Chn %d pool attach faile"
	.ascii	"d!\033[0m\000"
.LC23:
	.ascii	"\033[1;32mAVS Grp %d Chn %d node stream on success!"
	.ascii	"\033[0m\000"
.LC24:
	.ascii	"\033[1;32mAVS Grp %d Pipe %d node stream on success"
	.ascii	"!\033[0m\000"
.LC25:
	.ascii	"\033[1;32mAVS Grp %d start node done!\033[0m\000"
.LC26:
	.ascii	"Pipe\000"
.LC27:
	.ascii	"Chn \000"
.LC28:
	.ascii	"\033[1;31mstruct avs_buff_info mismatching\033[0m\000"
.LC29:
	.ascii	"\033[1;31merror AVS Grp %d Pipe %d get node failed!"
	.ascii	"\033[0m\000"
.LC30:
	.ascii	"AVS Grp %d %s %d outof mpi_node_get_current_in_buff"
	.ascii	"er mpi_buf(%p), buf_id(%d), buf_refcnt(%d).\000"
.LC31:
	.ascii	"AVS Grp %d %s %d outof mpi_node_get_next_out_buffer"
	.ascii	" mpi_buf(%p), buf_id(%d), buf_refcnt(%d).\000"
.LC32:
	.ascii	"AVS Grp %d %s %d outof mpi_node_request_buf mpi_buf"
	.ascii	"(%p), buf_id(%d), buf_refcnt(%d).\000"
.LC33:
	.ascii	"\033[1;31mAVS Grp %d Pipe %d get node failed!\033[0"
	.ascii	"m\000"
.LC34:
	.ascii	"\033[1;31merror cannot find mpi_buf fr fd %d\033[0m"
	.ascii	"\000"
.LC35:
	.ascii	"AVS Grp %d %s %d mpi_buf(%p), buf_id(%d), buf_refcn"
	.ascii	"t(%d), dma_buf(%p), fd(%d), access(%d).\000"
.LC36:
	.ascii	"AVS Grp %d %s %d put mpi_buf(%p), dma_buf(%p), buf_"
	.ascii	"id(%ld), buf_refcnt(%d), access(%d).\000"
.LC37:
	.ascii	"\033[1;31mbuf null\033[0m\000"
.LC38:
	.ascii	"\033[1;32m--------- avs dev open ----------\033[0m\000"
.LC39:
	.ascii	"\033[1;32mAVS Grp %d destroy node done!\033[0m\000"
.LC40:
	.ascii	"\033[1;32mAVS Grp %d Chn %d destroy MB_SOURCE_PRIVA"
	.ascii	"TE success! pool %p pool_id %d.\033[0m\000"
.LC41:
	.ascii	"\033[1;32mAVS Grp %d Chn %d destroy buf %p buf_id %"
	.ascii	"d buf_refcnt %d form BUF_ACCESS_NODE_OUT success!\033"
	.ascii	"[0m\000"
.LC42:
	.ascii	"\033[1;32mAVS Grp %d Chn %d destroy buf %p buf_id %"
	.ascii	"d buf_refcnt %d form BUF_ACCESS_NODE_POOL success!\033"
	.ascii	"[0m\000"
.LC43:
	.ascii	"\033[1;32m--------- avs dev release ----------\033["
	.ascii	"0m\000"
.LC44:
	.ascii	"\033[1;32mAVS Grp %d Pipe %d node stream off succes"
	.ascii	"s!\033[0m\000"
.LC45:
	.ascii	"\033[1;32mAVS Grp %d Chn %d node stream off success"
	.ascii	"!\033[0m\000"
.LC46:
	.ascii	"\033[1;32mAVS Grp %d stop node done!\033[0m\000"
.LC47:
	.ascii	"nr = %d, index = %d dev = %p\000"
.LC48:
	.ascii	"\033[1;31merror: index = %d\033[0m\000"
.LC49:
	.ascii	"\033[1;31merror: ioctl is null\033[0m\000"
.LC50:
	.ascii	"AVS_IOCTL_VERSION\000"
.LC51:
	.ascii	"AVS_IOCTL_CREATE\000"
.LC52:
	.ascii	"AVS_IOCTL_DESTROY\000"
.LC53:
	.ascii	"AVS_IOCTL_START\000"
.LC54:
	.ascii	"AVS_IOCTL_STOP\000"
.LC55:
	.ascii	"AVS_IOCTL_RESET\000"
.LC56:
	.ascii	"AVS_IOCTL_MB_GET\000"
.LC57:
	.ascii	"AVS_IOCTL_MB_SEND\000"
.LC58:
	.ascii	"AVS_IOCTL_MB_RELEASE\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
