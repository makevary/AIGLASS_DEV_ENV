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
	.file	"vrga.c"
	.text
	.syntax unified
	.syntax unified
	.thumb
	.syntax unified
	.align	1
	.global	vrga_node_get_status
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_get_status, %function
vrga_node_get_status:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_node_get_status, .-vrga_node_get_status
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_compat_ioctl, %function
vrga_compat_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	vrga_compat_ioctl, .-vrga_compat_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_open, %function
vrga_open:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movs	r3, #25
	ldr	r0, .L4
	str	r0, [r1, #128]
	str	r3, [r0, #148]
	bl	mpi_obj_ref
	mov	r3, #740
	ldr	r2, .L4+4
	movs	r1, #4
	movs	r0, #0
	str	r3, [sp]
	ldr	r3, .L4+8
	bl	vlog
	movs	r0, #0
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L5:
	.align	2
.L4:
	.word	g_vrga_dev+12
	.word	.LC0
	.word	.LANCHOR0
	.fnend
	.size	vrga_open, .-vrga_open
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_ioctl, %function
vrga_ioctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r3, r2
	ldr	r2, [r0, #128]
	uxtb	r4, r1
	ldr	r6, [r2, #136]
	ldr	r5, [r6, #160]
	cmp	r5, r4
	bls	.L7
	.syntax unified
@ 87 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/barrier.h" 1
	cmp	r4, r5
	sbc	r5, r4, r4
.inst.w 0xf3af8014
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r6, #156]
	ands	r4, r4, r5
	movs	r5, #20
	mla	r4, r5, r4, r2
	cbz	r4, .L7
	mov	r2, r1
	mov	r1, r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	mpi_ioctl_kernel
.L7:
	movw	r3, #721
	ldr	r2, .L11
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L11+4
	movs	r0, #0
	bl	vlog
	mvn	r0, #21
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L12:
	.align	2
.L11:
	.word	.LC1
	.word	.LANCHOR0+10
	.fnend
	.size	vrga_ioctl, .-vrga_ioctl
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_read, %function
vrga_read:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #92
	sub	sp, sp, #92
	ldr	r0, .L21
	mov	r8, r1
	mov	r7, r2
	bl	mpi_fs_buf_read
	adds	r3, r0, #1
	mov	r4, r0
	bne	.L14
	ldr	r3, .L21+4
	ldr	r2, .L21+8
	ldr	r1, .L21+12
	str	r3, [sp]
	ldr	r0, .L21
	ldr	r3, .L21+16
	ldr	r2, [r2]
	bl	mpi_fs_buf_add
	ldr	r1, .L21+20
	ldr	r0, .L21
	bl	mpi_fs_buf_add
	ldr	r1, .L21+24
	ldr	r0, .L21
	bl	mpi_fs_buf_add
	ldr	r5, .L21+28
	ldr	r9, .L21+36
	ldr	r10, .L21+40
	ldr	r4, [r5]
	ldr	r6, .L21
	subs	r4, r4, #72
	str	r5, [sp, #84]
.L15:
	ldr	r2, [sp, #84]
	add	r3, r4, #72
	cmp	r3, r2
	beq	.L19
	ldr	r3, [r4, #80]
	mov	r1, r9
	ldr	fp, [r3, #80]
	mov	r0, fp
	bl	strcmp
	cmp	r0, #0
	bne	.L16
	ldr	r2, [r4, #316]
	ldr	r3, [r4, #44]
	ldr	r0, [r2, #12]
	ldr	ip, [r2, #20]
	add	r1, r2, r0, lsl #5
	ldr	r5, [r1, #48]
	str	r5, [sp, #76]
	ldr	r5, [r1, #44]
	str	r5, [sp, #72]
	ldr	r5, [r1, #40]
	str	r5, [sp, #68]
	ldr	r5, [r1, #36]
	str	r5, [sp, #64]
	ldr	r5, [r1, #32]
	str	r5, [sp, #60]
	ldr	r1, [r1, #28]
	str	r1, [sp, #56]
	movs	r1, #28
	mla	r1, r1, ip, r2
	ldr	r5, [r1, #204]
	str	r5, [sp, #52]
	ldr	r5, [r1, #200]
	str	r5, [sp, #48]
	ldr	r5, [r1, #196]
	str	r5, [sp, #44]
	ldr	r5, [r1, #192]
	str	r5, [sp, #40]
	ldr	r1, [r1, #188]
	str	r1, [sp, #36]
	ldr	r1, [r2, #332]
	strd	ip, r1, [sp, #28]
	ldr	r1, [r2, #16]
	strd	r0, r1, [sp, #20]
	mov	r0, r6
	ldr	r1, [r2, #8]
	str	r1, [sp, #16]
	ldr	r1, [r2, #4]
	strd	r3, r1, [sp, #8]
	mov	r1, r10
	ldr	r3, [r4, #92]
	strd	r2, r3, [sp]
	mov	r3, fp
	ldr	r2, [r4]
	bl	mpi_fs_buf_add
	cbz	r0, .L17
.L19:
	mov	r2, r7
	mov	r1, r8
	ldr	r0, .L21
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	mpi_fs_buf_read
.L17:
	ldr	r1, .L21+32
	mov	r0, r6
	bl	mpi_fs_buf_add
.L16:
	ldr	r4, [r4, #72]
	subs	r4, r4, #72
	b	.L15
.L14:
	cbnz	r0, .L13
	ldr	r0, .L21
	bl	mpi_fs_buf_reset
.L13:
	mov	r0, r4
	add	sp, sp, #92
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L22:
	.align	2
.L21:
	.word	g_vrga_dev+5296
	.word	.LC4
	.word	g_vrga_dev
	.word	.LC3
	.word	.LC2
	.word	.LC5
	.word	.LC6
	.word	mpi_node_list
	.word	.LC9
	.word	.LC7
	.word	.LC8
	.fnend
	.size	vrga_read, .-vrga_read
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_thread_fn, %function
vrga_thread_fn:
	.fnstart
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.pad #316
	sub	sp, sp, #316
	ldr	r5, .L50
	movs	r4, #0
	add	r8, sp, #52
	mov	r6, r0
	movs	r2, #252
	mov	r1, r4
	ldr	r3, [r5]
	mov	fp, r5
	str	r4, [r8]
	str	r3, [sp, #308]
	add	r3, r0, #12
	add	r0, sp, #56
	str	r3, [sp, #40]
	bl	memset
	ldr	r3, [r6, #12]
	ldr	r2, .L50+4
	movs	r1, #5
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [r6, #92]
	str	r3, [sp, #4]
	mov	r3, #828
	str	r3, [sp]
	ldr	r3, .L50+8
	bl	vlog
	add	r3, r6, #164
	str	r3, [sp, #44]
.L27:
	bl	rkos_kthread_should_stop
	cbnz	r0, .L26
	ldr	r9, [r6, #8]
	cmp	r9, #0
	beq	.L25
	movs	r0, #1
	bl	rkos_msleep
.L26:
	ldr	r2, [sp, #308]
	movs	r0, #0
	ldr	r3, [fp]
	cmp	r2, r3
	beq	.L39
	bl	__stack_chk_fail
.L25:
	ldr	r0, [sp, #44]
	bl	rkos_down
	mov	r1, r9
	ldr	r0, [sp, #40]
	bl	mpi_dev_run_job
	mov	r5, r0
	cmp	r0, #0
	beq	.L27
	ldr	r7, [r0, #84]
	cmp	r7, #0
	beq	.L28
	ldr	r4, [r7, #316]
	cmp	r4, #0
	beq	.L28
	str	r0, [r4]
	mov	r1, #256
	ldr	r3, [r0, #84]
	mov	r0, r8
	ldr	r2, .L50+12
	ldr	r3, [r3]
	str	r3, [sp]
	ldr	r3, [r6, #92]
	bl	snprintf
	ldr	r1, [r7, #92]
	ldrd	r3, r2, [r5, #96]
	mov	r0, r9
	strd	r4, r1, [sp, #32]
	ldr	r1, [r4, #4]
	str	r1, [sp, #28]
	ldr	r1, [r2, #484]
	str	r1, [sp, #24]
	movs	r1, #5
	ldr	r2, [r2]
	str	r2, [sp, #20]
	ldr	r2, [r3, #484]
	str	r2, [sp, #16]
	ldr	r3, [r3]
	ldr	r2, .L50+16
	strd	r8, r3, [sp, #8]
	ldr	r3, [r5]
	str	r3, [sp, #4]
	movw	r3, #851
	str	r3, [sp]
	ldr	r3, .L50+8
	bl	vlog
	ldr	r9, [r4, #4]
	cmp	r9, #0
	bne	.L29
	ldr	r10, [r7, #316]
	cmp	r10, #0
	beq	.L31
	ldr	r3, [r10, #332]
	movs	r1, #5
	ldr	r2, .L50+20
	mov	r0, r9
	str	r3, [sp, #4]
	movw	r3, #801
	str	r3, [sp]
	ldr	r3, .L50+24
	bl	vlog
	ldr	r3, [r10, #332]
	cbz	r3, .L32
	cmp	r3, #1
	beq	.L33
	str	r3, [sp, #4]
	movs	r1, #2
	movw	r3, #810
	ldr	r2, .L50+28
	str	r3, [sp]
	mov	r0, r9
	ldr	r3, .L50+24
	bl	vlog
.L31:
	movw	r3, #854
	ldr	r2, .L50+32
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L50+8
	movs	r0, #0
	bl	vlog
.L28:
	movs	r3, #0
	mov	r1, #-1
	str	r3, [r4]
	b	.L49
.L32:
	mov	r1, r5
	mov	r0, r7
	bl	rga_do_normal
.L35:
	cmp	r0, #0
	bne	.L31
.L29:
	movs	r1, #0
	str	r1, [r4]
	ldr	r3, [r6, #152]
	adds	r3, r3, #1
	str	r3, [r6, #152]
.L49:
	mov	r0, r5
	bl	mpi_job_done
	b	.L27
.L33:
	mov	r1, r5
	mov	r0, r7
	bl	rga_od_osd
	b	.L35
.L39:
	add	sp, sp, #316
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L51:
	.align	2
.L50:
	.word	__stack_chk_guard
	.word	.LC10
	.word	.LANCHOR0+21
	.word	.LC11
	.word	.LC12
	.word	.LC13
	.word	.LANCHOR0+36
	.word	.LC14
	.word	.LC15
	.fnend
	.size	vrga_thread_fn, .-vrga_thread_fn
	.align	1
	.global	vrga_version
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_version, %function
vrga_version:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r4, r1
	ldr	r3, [r0, #128]
	ldr	r6, [r3, #136]
	ldr	r3, [r1, #48]	@ unaligned
	cmp	r3, #124
	beq	.L53
	movs	r3, #74
	ldr	r2, .L57
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L57+4
	movs	r0, #0
	bl	vlog
	mov	r0, #-1
.L52:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L53:
	movs	r5, #0
	movs	r3, #1
	strb	r5, [r1, #1]
	strb	r3, [r1]
	strb	r5, [r1, #2]
	strb	r5, [r1, #3]
	strb	r5, [r1, #4]
	strb	r5, [r1, #5]
	strb	r5, [r1, #6]
	strb	r5, [r1, #7]
	strb	r5, [r1, #8]
	strb	r5, [r1, #9]
	strb	r5, [r1, #10]
	strb	r5, [r1, #11]
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
	b	.L52
.L58:
	.align	2
.L57:
	.word	.LC16
	.word	.LANCHOR0+51
	.fnend
	.size	vrga_version, .-vrga_version
	.align	1
	.global	vrga_node_tde_process
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_tde_process, %function
vrga_node_tde_process:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, lr}
	.save {lr}
	.pad #12
	movw	r3, #3132
	ldr	r2, [r1]	@ unaligned
	cmp	r2, r3
	bne	.L63
	mov	r0, r1
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	b	rga_do_tde
.L63:
	mov	r3, #668
	ldr	r2, .L64
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L64+4
	movs	r0, #0
	bl	vlog
	mov	r0, #-1
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L65:
	.align	2
.L64:
	.word	.LC17
	.word	.LANCHOR0+64
	.fnend
	.size	vrga_node_tde_process, .-vrga_node_tde_process
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_release, %function
vrga_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
	.save {r4, r5, r6, r7, r8, r9, lr}
	.pad #12
	ldr	r4, [r1, #128]
	mov	r0, r4
	bl	mpi_obj_unref
	ldr	r3, [r4, #44]
	cmp	r3, #1
	bne	.L76
	movs	r6, #0
	mov	r7, #256
.L75:
	mov	r2, r6
	movs	r1, #0
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r4, r0
	cbz	r0, .L68
	ldr	r5, [r0, #96]
	cbz	r5, .L69
	mov	r1, r0
	mov	r0, r5
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r5
	bl	mpi_buf_pool_destroy
.L69:
	ldr	r0, [r4, #316]
	cmp	r0, #0
	beq	.L70
	ldr	r1, [r4, #112]
	mvn	r8, #79
	ldr	r3, [r0, #324]
	add	r5, r0, #324
	add	r2, r1, #33
	adds	r1, r1, #43
	mov	r9, #290
	sub	r2, r8, r2, lsl #3
	add	r3, r3, r2
	ldr	r1, [r3, r1, lsl #3]
	add	r8, r1, r2
.L71:
	ldr	r2, [r4, #112]
	add	r1, r2, #43
	add	r1, r3, r1, lsl #3
	cmp	r1, r5
	bne	.L73
	mov	r2, r6
	movs	r1, #0
	movs	r0, #19
	bl	vsys_remove_node_from_map
	mov	r0, r4
	bl	mpi_node_del_out_watcher
	mov	r0, r4
	bl	mpi_node_destroy
.L68:
	adds	r6, r6, #1
	cmp	r6, #1280
	bne	.L75
	movw	r3, #790
	ldr	r2, .L88
	str	r3, [sp]
	movs	r1, #4
	ldr	r3, .L88+4
	movs	r0, #0
	bl	vlog
.L76:
	movs	r0, #0
	b	.L66
.L73:
	cbz	r3, .L72
	add	r2, r3, r2, lsl #3
	ldrd	r0, r1, [r2, #344]
	str	r1, [r0, #4]
	str	r0, [r1]
	mov	r0, r3
	strd	r7, r9, [r2, #344]
	bl	mpi_obj_unref
.L72:
	ldr	r3, [r4, #112]
	mvn	r2, #79
	add	r1, r3, #33
	adds	r3, r3, #43
	sub	r2, r2, r1, lsl #3
	ldr	r1, [r8, r3, lsl #3]
	mov	r3, r8
	add	r8, r1, r2
	b	.L71
.L70:
	mov	r3, #780
	ldr	r2, .L88+8
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L88+4
	bl	vlog
	mov	r0, #-1
.L66:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, pc}
.L89:
	.align	2
.L88:
	.word	.LC19
	.word	.LANCHOR0+86
	.word	.LC18
	.fnend
	.size	vrga_release, .-vrga_release
	.global	__aeabi_uidivmod
	.align	1
	.global	new_rga_chn_id_by_ctx_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	new_rga_chn_id_by_ctx_id, %function
new_rga_chn_id_by_ctx_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r1, #1280
	bl	__aeabi_uidivmod
	movs	r0, #19
	mov	r4, r1
	mov	r2, r1
	movs	r1, #0
	bl	vsys_get_node_from_map
	cbz	r0, .L90
	movs	r4, #0
.L93:
	mov	r2, r4
	movs	r1, #0
	movs	r0, #19
	bl	vsys_get_node_from_map
	cbz	r0, .L90
	adds	r4, r4, #1
	cmp	r4, #1280
	bne	.L93
.L90:
	mov	r0, r4
	pop	{r4, pc}
	.fnend
	.size	new_rga_chn_id_by_ctx_id, .-new_rga_chn_id_by_ctx_id
	.align	1
	.global	vrga_node_create
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_create, %function
vrga_node_create:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #32
	sub	sp, sp, #32
	ldr	r3, [r0, #128]
	mov	r4, r1
	ldr	r0, [r1]	@ unaligned
	ldr	r7, [r3, #136]
	bl	new_rga_chn_id_by_ctx_id
	ldr	r3, [r4, #12]	@ unaligned
	cmp	r3, #40
	mov	r6, r0
	beq	.L99
	movs	r3, #104
	ldr	r2, .L111
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L111+4
	movs	r0, #0
.L110:
	bl	vlog
.L109:
	mov	r0, #-1
.L98:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L99:
	ldr	r0, .L111+8
	bl	mpi_allocator_find_by_name
	mov	r10, r0
	cbnz	r0, .L101
	movs	r3, #109
	ldr	r2, .L111+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L111+4
	b	.L110
.L101:
	movs	r3, #0
	movs	r2, #1
	ldr	r1, [r4]	@ unaligned
	add	r0, r7, #12
	bl	mpi_dev_create_node_with_params
	mov	r5, r0
	cbnz	r0, .L102
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L111+16
	str	r3, [sp, #4]
	movs	r3, #115
	str	r3, [sp]
	ldr	r3, .L111+4
	bl	vlog
	b	.L109
.L102:
	ldr	r3, [r4, #20]	@ unaligned
	add	r2, r6, #44
	str	r3, [r7, r2, lsl #2]
	ldr	r7, [r0, #316]
	cbz	r7, .L103
	str	r3, [r7, #4]
	ldr	r3, [r4, #36]	@ unaligned
	str	r3, [r7, #332]
.L103:
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	ldr	r9, .L111+32
	movs	r0, #0
	ldr	r2, .L111+20
	strd	r6, r3, [sp, #4]
	movs	r3, #126
	str	r3, [sp]
	ldr	r3, .L111+4
	bl	vlog
	movs	r2, #28
	movs	r1, #0
	add	r0, r5, #8
	bl	memset
	ldr	r3, [r9]	@ unaligned
	mov	r0, r5
	str	r3, [r5, #4]	@ unaligned
	ldr	r1, [r4, #24]	@ unaligned
	bl	mpi_node_add_out_watcher
	mov	r3, r5
	mov	r2, r6
	movs	r1, #0
	movs	r0, #19
	bl	vsys_add_node_to_map
	add	r3, r5, #192
	add	r2, r5, #200
	ldr	r1, [r4, #32]	@ unaligned
	ldr	r0, [r4, #28]	@ unaligned
	bl	mpi_node_set_frame_rate
	ldr	r8, [r7, #4]
	cmp	r8, #0
	bne	.L104
	str	r9, [sp]
	movs	r1, #1
	ldr	r3, [r4, #16]	@ unaligned
	mov	r0, r10
	ldr	r2, [r4, #8]	@ unaligned
	bl	mpi_buf_pool_create
	mov	r7, r0
	cbnz	r0, .L105
	mov	r1, r0
	mov	r2, r6
	movs	r0, #19
	bl	vsys_remove_node_from_map
	mov	r0, r5
	bl	mpi_node_del_out_watcher
	mov	r0, r5
	bl	mpi_node_destroy
	b	.L109
.L105:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L111+24
	str	r3, [sp, #24]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r0]
	strd	r0, r3, [sp, #12]
	mov	r0, r8
	ldr	r3, [r4]	@ unaligned
	strd	r6, r3, [sp, #4]
	movs	r3, #142
	str	r3, [sp]
	ldr	r3, .L111+4
	bl	vlog
	mov	r1, r5
	mov	r0, r7
	bl	mpi_buf_pool_add_user
.L104:
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	str	r6, [r4, #4]	@ unaligned
	movs	r0, #0
	ldr	r2, .L111+28
	strd	r6, r3, [sp, #4]
	movs	r3, #147
	str	r3, [sp]
	ldr	r3, .L111+4
	bl	vlog
	movs	r0, #0
	b	.L98
.L112:
	.align	2
.L111:
	.word	.LC20
	.word	.LANCHOR0+99
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC25
	.word	.LC26
	.word	.LC7
	.fnend
	.size	vrga_node_create, .-vrga_node_create
	.align	1
	.global	vrga_get_node_site_from_map_by_nick_id
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_get_node_site_from_map_by_nick_id, %function
vrga_get_node_site_from_map_by_nick_id:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #20
	sub	sp, sp, #20
	mov	r4, r0
	mov	r5, r1
	strd	r0, r1, [sp, #4]
	mov	r6, r2
	mov	r7, r3
	ldr	r2, .L122
	movs	r3, #48
	movs	r1, #5
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L122+4
	bl	vlog
	cmp	r4, #19
	bne	.L114
	movs	r4, #0
.L117:
	mov	r2, r4
	movs	r1, #0
	movs	r0, #19
	bl	vsys_get_node_from_map
	cbz	r0, .L115
	ldr	r3, [r0, #92]
	cmp	r5, r3
	bne	.L115
	movs	r0, #0
	str	r0, [r6]
	str	r4, [r7]
.L113:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L115:
	adds	r4, r4, #1
	cmp	r4, #1280
	bne	.L117
.L114:
	mov	r0, #-1
	b	.L113
.L123:
	.align	2
.L122:
	.word	.LC27
	.word	.LANCHOR0+116
	.fnend
	.size	vrga_get_node_site_from_map_by_nick_id, .-vrga_get_node_site_from_map_by_nick_id
	.align	1
	.global	vrga_node_delete
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_delete, %function
vrga_node_delete:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r4, #0
	strd	r3, r4, [sp, #16]
	mov	r8, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L125
	movs	r3, #169
	ldr	r2, .L141
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L141+4
	mov	r0, r4
	bl	vlog
.L134:
	mov	r5, #-1
	b	.L124
.L125:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r5, r0
	cbz	r0, .L127
	ldr	r3, [r8]	@ unaligned
	movs	r1, #2
	ldr	r2, .L141+8
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movs	r3, #174
	str	r3, [sp]
	ldr	r3, .L141+4
	bl	vlog
	b	.L134
.L127:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r4, r0
	cmp	r0, #0
	beq	.L134
	ldr	r6, [r0, #96]
	cbz	r6, .L128
	mov	r1, r0
	mov	r0, r6
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r6
	bl	mpi_buf_pool_destroy
.L128:
	ldr	r6, [r4, #316]
	cbnz	r6, .L129
.L133:
	ldr	r2, [sp, #16]
	movs	r1, #0
	movs	r0, #19
	bl	vsys_remove_node_from_map
	mov	r0, r4
	bl	mpi_node_del_out_watcher
	mov	r0, r4
	bl	mpi_node_destroy
	ldr	r3, [r8]	@ unaligned
	ldr	r2, .L141+12
	movs	r1, #4
	movs	r0, #0
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movs	r3, #203
	str	r3, [sp]
	ldr	r3, .L141+4
	bl	vlog
.L124:
	mov	r0, r5
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L129:
	ldr	r2, [r4, #112]
	mvn	r7, #79
	ldr	r0, [r6, #324]
	add	r6, r6, #324
	add	r3, r2, #33
	adds	r2, r2, #43
	mov	r9, #256
	mov	r10, #290
	sub	r3, r7, r3, lsl #3
	add	r0, r0, r3
	ldr	r7, [r0, r2, lsl #3]
	add	r7, r7, r3
.L130:
	ldr	r3, [r4, #112]
	add	r2, r3, #43
	add	r2, r0, r2, lsl #3
	cmp	r2, r6
	beq	.L133
	cbz	r0, .L131
	add	r3, r0, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	strd	r9, r10, [r3, #344]
	bl	mpi_obj_unref
.L131:
	ldr	r3, [r4, #112]
	mvn	r2, #79
	mov	r0, r7
	add	r1, r3, #33
	adds	r3, r3, #43
	ldr	r3, [r7, r3, lsl #3]
	sub	r2, r2, r1, lsl #3
	adds	r7, r3, r2
	b	.L130
.L142:
	.align	2
.L141:
	.word	.LC20
	.word	.LANCHOR0+155
	.word	.LC28
	.word	.LC29
	.fnend
	.size	vrga_node_delete, .-vrga_node_delete
	.align	1
	.global	vrga_node_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_start, %function
vrga_node_start:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L144
	movs	r3, #221
	ldr	r2, .L148
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L148+4
	mov	r0, r6
	bl	vlog
.L147:
	mov	r4, #-1
	b	.L143
.L144:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L146
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L148+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movs	r3, #226
	str	r3, [sp]
	ldr	r3, .L148+4
	bl	vlog
	b	.L147
.L146:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L147
	bl	mpi_node_streamon
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L148+12
	movs	r1, #4
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movs	r3, #233
	str	r3, [sp]
	ldr	r3, .L148+4
	bl	vlog
.L143:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L149:
	.align	2
.L148:
	.word	.LC20
	.word	.LANCHOR0+172
	.word	.LC28
	.word	.LC30
	.fnend
	.size	vrga_node_start, .-vrga_node_start
	.align	1
	.global	vrga_node_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_stop, %function
vrga_node_stop:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L151
	movs	r3, #246
	ldr	r2, .L155
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L155+4
	mov	r0, r6
	bl	vlog
.L154:
	mov	r4, #-1
	b	.L150
.L151:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L153
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L155+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movs	r3, #251
	str	r3, [sp]
	ldr	r3, .L155+4
	bl	vlog
	b	.L154
.L153:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L154
	movs	r1, #1
	bl	mpi_node_flush
	ldr	r3, [r5]	@ unaligned
	ldr	r2, .L155+12
	movs	r1, #4
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	mov	r3, #260
	str	r3, [sp]
	ldr	r3, .L155+4
	bl	vlog
.L150:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L156:
	.align	2
.L155:
	.word	.LC20
	.word	.LANCHOR0+188
	.word	.LC28
	.word	.LC31
	.fnend
	.size	vrga_node_stop, .-vrga_node_stop
	.align	1
	.global	vrga_node_exist
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_exist, %function
vrga_node_exist:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L158
	movw	r3, #273
	ldr	r2, .L162
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L162+4
	mov	r0, r6
	bl	vlog
.L161:
	mov	r4, #-1
	b	.L157
.L158:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L160
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L162+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	mov	r3, #278
	str	r3, [sp]
	ldr	r3, .L162+4
	bl	vlog
	b	.L161
.L160:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L161
	ldr	r3, [r5]	@ unaligned
	movs	r1, #4
	ldr	r2, .L162+12
	mov	r0, r4
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	mov	r3, #286
	str	r3, [sp]
	ldr	r3, .L162+4
	bl	vlog
.L157:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L163:
	.align	2
.L162:
	.word	.LC20
	.word	.LANCHOR0+203
	.word	.LC28
	.word	.LC32
	.fnend
	.size	vrga_node_exist, .-vrga_node_exist
	.align	1
	.global	vrga_mb_get
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_get, %function
vrga_mb_get:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #28
	sub	sp, sp, #28
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #104
	beq	.L165
	movw	r3, #301
	ldr	r2, .L180
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L180+4
	mov	r0, r6
	bl	vlog
.L169:
	mov	r4, #-1
.L164:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L165:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L167
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L180+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	mov	r3, #306
	str	r3, [sp]
	ldr	r3, .L180+4
	bl	vlog
	b	.L169
.L167:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L169
	ldr	r3, [r5, #8]	@ unaligned
	mov	r1, r4
	str	r3, [r0, #412]
	bl	mpi_node_get_out_buffer
	mov	r6, r0
	cmp	r0, #0
	beq	.L169
	ldr	r3, [r0, #484]
	cmp	r3, #0
	beq	.L169
	ldr	r3, [r7, #316]
	cbz	r3, .L170
	ldr	r2, [r7, #112]
	add	r3, r3, #324
	add	r1, r2, #43
	add	r2, r6, r2, lsl #3
	add	r1, r0, r1, lsl #3
	ldr	r0, [r3, #4]
	str	r1, [r3, #4]
	strd	r3, r0, [r2, #344]
	str	r1, [r0]
.L170:
	movs	r2, #80
	add	r1, r6, #664
	add	r0, r5, #24
	bl	memcpy
	ldr	r3, [r6, #484]
	ldr	r3, [r3]
	str	r3, [r5, #4]	@ unaligned
	ldr	r3, [r6]
	str	r3, [r5, #20]	@ unaligned
	b	.L164
.L181:
	.align	2
.L180:
	.word	.LC33
	.word	.LANCHOR0+219
	.word	.LC28
	.fnend
	.size	vrga_mb_get, .-vrga_mb_get
	.align	1
	.global	vrga_mb_release
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_release, %function
vrga_mb_release:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #44
	sub	sp, sp, #44
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #32]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #104
	beq	.L183
	mov	r3, #338
	ldr	r2, .L188
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L188+4
	mov	r0, r6
	bl	vlog
.L187:
	mov	r4, #-1
	b	.L182
.L183:
	add	r3, sp, #32
	add	r2, sp, #36
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L185
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L188+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	movw	r3, #343
	str	r3, [sp]
	ldr	r3, .L188+4
	bl	vlog
	b	.L187
.L185:
	mov	r1, r0
	ldr	r2, [sp, #32]
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L187
	movs	r1, #4
	ldr	r0, [r5, #20]	@ unaligned
	bl	mpi_obj_from_id
	mov	r6, r0
	cbz	r0, .L186
	ldr	r3, [r0, #44]
	movs	r1, #5
	ldr	r2, .L188+12
	str	r3, [sp, #24]
	ldr	r3, [r5, #20]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r0, #484]
	strd	r0, r3, [sp, #12]
	mov	r0, r4
	ldr	r3, [r5]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	mov	r3, #356
	str	r3, [sp]
	ldr	r3, .L188+4
	bl	vlog
	ldr	r3, [r7, #112]
	mov	r0, r7
	add	r3, r6, r3, lsl #3
	ldrd	r1, r2, [r3, #344]
	str	r2, [r1, #4]
	str	r1, [r2]
	mov	r1, #256
	mov	r2, #290
	strd	r1, r2, [r3, #344]
	add	r2, r7, #428
	mov	r1, r6
	bl	mpi_node_release_buffer_flag
.L182:
	mov	r0, r4
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L186:
	mov	r3, #360
	ldr	r2, .L188+16
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L188+4
	bl	vlog
	b	.L182
.L189:
	.align	2
.L188:
	.word	.LC33
	.word	.LANCHOR0+231
	.word	.LC28
	.word	.LC34
	.word	.LC35
	.fnend
	.size	vrga_mb_release, .-vrga_mb_release
	.align	1
	.global	vrga_mb_send
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_mb_send, %function
vrga_mb_send:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #44
	sub	sp, sp, #44
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #32]
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #104
	beq	.L191
	movw	r3, #373
	ldr	r2, .L196
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L196+4
	mov	r0, r6
	bl	vlog
.L195:
	mov	r5, #-1
	b	.L190
.L191:
	add	r3, sp, #32
	add	r2, sp, #36
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r5, r0
	cbz	r0, .L193
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L196+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	mov	r3, #378
	str	r3, [sp]
	ldr	r3, .L196+4
	bl	vlog
	b	.L195
.L193:
	mov	r1, r0
	ldr	r2, [sp, #32]
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r7, r0
	cmp	r0, #0
	beq	.L195
	ldr	r0, [r4, #16]	@ unaligned
	cmp	r0, #0
	blt	.L190
	bl	get_mpi_buf
	ldr	r3, [r4, #16]	@ unaligned
	mov	r6, r0
	cbnz	r0, .L194
	str	r3, [sp, #4]
	movs	r1, #2
	mov	r3, #390
	ldr	r2, .L196+12
	str	r3, [sp]
	ldr	r3, .L196+4
	bl	vlog
	b	.L195
.L194:
	ldr	r2, [r0, #44]
	movs	r1, #5
	str	r3, [sp, #28]
	ldr	r3, [r0, #484]
	strd	r2, r3, [sp, #20]
	ldr	r3, [r0]
	ldr	r2, .L196+16
	strd	r0, r3, [sp, #12]
	mov	r0, r5
	ldr	r3, [r4], #24	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	movw	r3, #397
	str	r3, [sp]
	ldr	r3, .L196+4
	bl	vlog
	movs	r2, #80
	mov	r1, r4
	add	r0, r6, #664
	bl	memcpy
	mov	r2, r5
	mov	r1, r6
	mov	r0, r7
	bl	mpi_node_buffer_in
.L190:
	mov	r0, r5
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L197:
	.align	2
.L196:
	.word	.LC33
	.word	.LANCHOR0+247
	.word	.LC28
	.word	.LC36
	.word	.LC37
	.fnend
	.size	vrga_mb_send, .-vrga_mb_send
	.align	1
	.global	vrga_node_set_bypass
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_bypass, %function
vrga_node_set_bypass:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	.save {r4, r5, lr}
	.pad #20
	sub	sp, sp, #20
	mov	r3, #1280
	movs	r0, #0
	strd	r3, r0, [sp, #8]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L199
	movw	r3, #415
	ldr	r2, .L209
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L209+4
	bl	vlog
.L202:
	mov	r4, #-1
.L198:
	mov	r0, r4
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, pc}
.L199:
	add	r3, sp, #8
	add	r2, sp, #12
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cmp	r0, #0
	bne	.L202
	mov	r1, r0
	ldr	r2, [sp, #8]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L202
	ldr	r3, [sp, #8]
	ldr	r2, [r5, #20]	@ unaligned
	ldr	r1, .L209+8
	adds	r3, r3, #44
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [r0, #316]
	cmp	r3, #0
	beq	.L198
	str	r2, [r3, #4]
	b	.L198
.L210:
	.align	2
.L209:
	.word	.LC20
	.word	.LANCHOR0+260
	.word	g_vrga_dev
	.fnend
	.size	vrga_node_set_bypass, .-vrga_node_set_bypass
	.align	1
	.global	vrga_node_set_crop
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_crop, %function
vrga_node_set_crop:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #60
	sub	sp, sp, #60
	mov	r3, #1280
	movs	r5, #0
	strd	r3, r5, [sp, #48]
	mov	r4, r1
	ldr	r3, [r1, #28]	@ unaligned
	cmp	r3, #32
	beq	.L212
	mov	r3, #444
	ldr	r2, .L225
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L225+4
	mov	r0, r5
.L223:
	bl	vlog
	b	.L224
.L212:
	add	r3, sp, #48
	add	r2, sp, #52
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r6, r0
	cbz	r0, .L214
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L225+8
	mov	r0, r5
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	str	r3, [sp, #4]
	movw	r3, #449
	str	r3, [sp]
	ldr	r3, .L225+4
	bl	vlog
.L224:
	mov	r6, #-1
.L211:
	mov	r0, r6
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L214:
	mov	r1, r0
	ldr	r2, [sp, #48]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cbnz	r0, .L215
	movw	r3, #455
	ldr	r2, .L225+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L225+4
	b	.L223
.L215:
	ldr	r5, [r0, #316]
	cmp	r5, #0
	beq	.L216
	ldrd	r0, r2, [r5, #8]
	add	r7, r4, #32
	subs	r3, r0, r2
	cmp	r3, #0
	it	lt
	rsblt	r3, r3, #0
	cmp	r3, #4
	ble	.L217
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	strd	r0, r2, [sp, #12]
	mov	r0, r6
	ldr	r2, .L225+16
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	str	r3, [sp, #4]
	movw	r3, #463
	str	r3, [sp]
	ldr	r3, .L225+4
	bl	vlog
	ldr	r0, [r5, #8]
	movs	r1, #5
	subs	r0, r0, #1
	bl	__aeabi_uidivmod
	mov	r3, r4
	add	r1, r5, r1, lsl #5
	adds	r1, r1, #24
.L218:
	ldr	r2, [r3], #4	@ unaligned
	cmp	r3, r7
	str	r2, [r1], #4	@ unaligned
	bne	.L218
.L219:
	ldr	r3, [r5, #12]
	movs	r1, #4
	ldr	r2, .L225+20
	movs	r0, #0
	str	r3, [sp, #40]
	ldr	r3, [r5, #8]
	str	r3, [sp, #36]
	ldr	r3, [r4, #24]	@ unaligned
	str	r3, [sp, #32]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [sp, #48]
	str	r3, [sp, #4]
	movw	r3, #481
	str	r3, [sp]
	ldr	r3, .L225+4
	bl	vlog
	b	.L211
.L217:
	movs	r1, #5
	bl	__aeabi_uidivmod
	mov	r3, r4
	add	r1, r5, r1, lsl #5
	adds	r1, r1, #24
.L220:
	ldr	r2, [r3], #4	@ unaligned
	cmp	r3, r7
	str	r2, [r1], #4	@ unaligned
	bne	.L220
	ldr	r3, [r5, #8]
	adds	r3, r3, #1
	str	r3, [r5, #8]
	b	.L219
.L216:
	mov	r3, #472
	ldr	r2, .L225+24
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L225+4
	mov	r0, r6
	b	.L223
.L226:
	.align	2
.L225:
	.word	.LC38
	.word	.LANCHOR0+281
	.word	.LC28
	.word	.LC39
	.word	.LC40
	.word	.LC41
	.word	.LC18
	.fnend
	.size	vrga_node_set_crop, .-vrga_node_set_crop
	.align	1
	.global	vrga_node_set_scale
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_scale, %function
vrga_node_set_scale:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #48
	sub	sp, sp, #48
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #40]
	mov	r4, r1
	ldr	r5, [r1, #24]	@ unaligned
	cmp	r5, #28
	beq	.L228
	movw	r3, #495
	ldr	r2, .L243
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L243+4
	mov	r0, r6
.L242:
	bl	vlog
	b	.L241
.L228:
	add	r3, sp, #40
	add	r2, sp, #44
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r7, r0
	cbz	r0, .L230
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L243+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #40]
	str	r3, [sp, #4]
	mov	r3, #500
	str	r3, [sp]
	ldr	r3, .L243+4
	bl	vlog
.L241:
	mov	r7, #-1
.L227:
	mov	r0, r7
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L230:
	mov	r1, r0
	ldr	r2, [sp, #40]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cbnz	r0, .L231
	mov	r3, #506
	ldr	r2, .L243+12
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L243+4
	b	.L242
.L231:
	ldr	r6, [r0, #316]
	cbz	r6, .L232
	ldrd	r0, r2, [r6, #16]
	add	r8, r4, #28
	subs	r3, r0, r2
	cmp	r3, #0
	it	lt
	rsblt	r3, r3, #0
	cmp	r3, #4
	ble	.L233
	ldr	r3, [r4]	@ unaligned
	movs	r1, #4
	strd	r0, r2, [sp, #12]
	mov	r0, r7
	ldr	r2, .L243+16
	str	r3, [sp, #8]
	ldr	r3, [sp, #40]
	str	r3, [sp, #4]
	movw	r3, #514
	str	r3, [sp]
	ldr	r3, .L243+4
	bl	vlog
	ldr	r0, [r6, #16]
	movs	r1, #5
	subs	r0, r0, #1
	bl	__aeabi_uidivmod
	mov	r3, r4
	mla	r1, r5, r1, r6
	adds	r1, r1, #184
.L234:
	ldr	r2, [r3], #4	@ unaligned
	cmp	r3, r8
	str	r2, [r1], #4	@ unaligned
	bne	.L234
.L232:
	ldr	r3, [r6, #20]
	movs	r1, #4
	ldr	r2, .L243+20
	movs	r0, #0
	str	r3, [sp, #36]
	ldr	r3, [r6, #16]
	str	r3, [sp, #32]
	ldr	r3, [r4, #20]	@ unaligned
	str	r3, [sp, #28]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #24]
	ldr	r3, [r4, #8]	@ unaligned
	str	r3, [sp, #20]
	ldr	r3, [r4, #12]	@ unaligned
	str	r3, [sp, #16]
	ldr	r3, [r4, #4]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [sp, #40]
	str	r3, [sp, #4]
	movw	r3, #529
	str	r3, [sp]
	ldr	r3, .L243+4
	bl	vlog
	b	.L227
.L233:
	movs	r1, #5
	bl	__aeabi_uidivmod
	mov	r3, r4
	mla	r1, r5, r1, r6
	adds	r1, r1, #184
.L235:
	ldr	r2, [r3], #4	@ unaligned
	cmp	r3, r8
	str	r2, [r1], #4	@ unaligned
	bne	.L235
	ldr	r3, [r6, #16]
	adds	r3, r3, #1
	str	r3, [r6, #16]
	b	.L232
.L244:
	.align	2
.L243:
	.word	.LC42
	.word	.LANCHOR0+300
	.word	.LC28
	.word	.LC39
	.word	.LC43
	.word	.LC44
	.fnend
	.size	vrga_node_set_scale, .-vrga_node_set_scale
	.align	1
	.global	vrga_node_frame_rate_ctl
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_frame_rate_ctl, %function
vrga_node_frame_rate_ctl:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L246
	movw	r3, #542
	ldr	r2, .L250
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L250+4
	mov	r0, r6
	bl	vlog
.L249:
	mov	r4, #-1
	b	.L245
.L246:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L248
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L250+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	movw	r3, #547
	str	r3, [sp]
	ldr	r3, .L250+4
	bl	vlog
	b	.L249
.L248:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L249
	add	r3, r0, #192
	add	r2, r0, #200
	ldr	r1, [r5, #32]	@ unaligned
	ldr	r0, [r5, #28]	@ unaligned
	bl	mpi_node_set_frame_rate
.L245:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L251:
	.align	2
.L250:
	.word	.LC20
	.word	.LANCHOR0+320
	.word	.LC28
	.fnend
	.size	vrga_node_frame_rate_ctl, .-vrga_node_frame_rate_ctl
	.align	1
	.global	vrga_node_set_depth
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_set_depth, %function
vrga_node_set_depth:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #24
	sub	sp, sp, #24
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #16]
	mov	r5, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L253
	mov	r3, #568
	ldr	r2, .L259
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L259+4
	mov	r0, r6
	bl	vlog
.L258:
	mov	r4, #-1
	b	.L252
.L253:
	ldr	r3, [r1, #24]	@ unaligned
	cmp	r3, #0
	bgt	.L255
.L257:
	movs	r4, #0
.L252:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L255:
	add	r3, sp, #16
	add	r2, sp, #20
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r4, r0
	cbz	r0, .L256
	ldr	r3, [r5]	@ unaligned
	movs	r1, #2
	ldr	r2, .L259+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #16]
	str	r3, [sp, #4]
	mov	r3, #576
	str	r3, [sp]
	ldr	r3, .L259+4
	bl	vlog
	b	.L258
.L256:
	mov	r1, r0
	ldr	r2, [sp, #16]
	movs	r0, #19
	bl	vsys_get_node_from_map
	cmp	r0, #0
	beq	.L258
	ldr	r3, [r0, #420]
	cmp	r3, #0
	bne	.L257
	ldr	r1, [r5, #24]	@ unaligned
	bl	mpi_node_add_out_watcher
	b	.L252
.L260:
	.align	2
.L259:
	.word	.LC20
	.word	.LANCHOR0+345
	.word	.LC28
	.fnend
	.size	vrga_node_set_depth, .-vrga_node_set_depth
	.align	1
	.global	vrga_node_attach_pool
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_node_attach_pool, %function
vrga_node_attach_pool:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #40
	sub	sp, sp, #40
	mov	r3, #1280
	movs	r6, #0
	strd	r3, r6, [sp, #32]
	mov	r4, r1
	ldr	r3, [r1, #12]	@ unaligned
	cmp	r3, #40
	beq	.L262
	movw	r3, #602
	ldr	r2, .L275
	str	r3, [sp]
	movs	r1, #2
	ldr	r3, .L275+4
	mov	r0, r6
	bl	vlog
.L270:
	mov	r5, #-1
	b	.L261
.L262:
	add	r3, sp, #32
	add	r2, sp, #36
	ldr	r1, [r1]	@ unaligned
	movs	r0, #19
	bl	vrga_get_node_site_from_map_by_nick_id
	mov	r5, r0
	cbz	r0, .L264
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L275+8
	mov	r0, r6
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	movw	r3, #607
	str	r3, [sp]
	ldr	r3, .L275+4
.L274:
	bl	vlog
	b	.L270
.L264:
	mov	r1, r0
	ldr	r2, [sp, #32]
	movs	r0, #19
	bl	vsys_get_node_from_map
	mov	r6, r0
	cmp	r0, #0
	beq	.L270
	ldr	r3, [r0, #96]
	cbz	r3, .L265
	ldr	r2, [r4, #16]	@ unaligned
	ldr	r1, [r3, #112]
	cmp	r1, r2
	bgt	.L266
	ldr	r2, [r4, #8]	@ unaligned
	ldr	r3, [r3, #92]
	cmp	r3, r2
	bcc	.L266
.L261:
	mov	r0, r5
	add	sp, sp, #40
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L265:
	ldr	r3, [r4, #20]	@ unaligned
	cmp	r3, #0
	bne	.L261
.L266:
	ldr	r3, [r4, #8]	@ unaligned
	movs	r1, #4
	ldr	r2, .L275+12
	movs	r0, #0
	str	r3, [sp, #16]
	ldr	r3, [r4, #16]	@ unaligned
	str	r3, [sp, #12]
	ldr	r3, [r4]	@ unaligned
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	mov	r3, #628
	str	r3, [sp]
	ldr	r3, .L275+4
	bl	vlog
	ldr	r0, .L275+16
	bl	mpi_allocator_find_by_name
	mov	r8, r0
	cbnz	r0, .L267
	ldr	r3, [r4]	@ unaligned
	movs	r1, #2
	ldr	r2, .L275+20
	str	r3, [sp, #8]
	ldr	r3, [sp, #32]
	str	r3, [sp, #4]
	mov	r3, #632
	str	r3, [sp]
	ldr	r3, .L275+4
	b	.L274
.L267:
	ldr	r7, [r6, #96]
	cbz	r7, .L268
	mov	r1, r6
	mov	r0, r7
	bl	mpi_buf_pool_del_user
	movs	r1, #1
	mov	r0, r7
	bl	mpi_buf_pool_destroy
.L268:
	ldr	r3, .L275+24
	movs	r1, #1
	mov	r0, r8
	str	r3, [sp]
	ldr	r3, [r4, #16]	@ unaligned
	ldr	r2, [r4, #8]	@ unaligned
	bl	mpi_buf_pool_create
	ldr	r2, [r4]	@ unaligned
	ldr	r1, [r4, #16]	@ unaligned
	ldr	r4, [r4, #8]	@ unaligned
	mov	r7, r0
	ldr	r3, [sp, #32]
	cbnz	r0, .L269
	strd	r4, r1, [sp, #12]
	movs	r1, #2
	strd	r3, r2, [sp, #4]
	movw	r3, #647
	ldr	r2, .L275+28
	str	r3, [sp]
	ldr	r3, .L275+4
	bl	vlog
	b	.L270
.L269:
	strd	r1, r4, [sp, #20]
	ldr	r1, [r0]
	strd	r3, r2, [sp, #4]
	movw	r3, #655
	ldr	r2, .L275+32
	strd	r0, r1, [sp, #12]
	movs	r1, #4
	str	r3, [sp]
	movs	r0, #0
	ldr	r3, .L275+4
	bl	vlog
	mov	r1, r6
	mov	r0, r7
	bl	mpi_buf_pool_add_user
	b	.L261
.L276:
	.align	2
.L275:
	.word	.LC20
	.word	.LANCHOR0+365
	.word	.LC28
	.word	.LC45
	.word	.LC21
	.word	.LC46
	.word	.LC7
	.word	.LC47
	.word	.LC25
	.fnend
	.size	vrga_node_attach_pool, .-vrga_node_attach_pool
	.align	1
	.global	vrga_new_job
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_new_job, %function
vrga_new_job:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, r0
	ldr	r8, [r0, #316]
	.pad #32
	sub	sp, sp, #32
	mov	r6, r1
	ldr	r9, [r0, #80]
	cmp	r8, #0
	beq	.L292
	cmp	r1, #0
	beq	.L292
	mov	r0, r1
	bl	mpi_obj_ref
	ldr	r1, [r8, #4]
	cbz	r1, .L279
.L282:
	movs	r7, #0
.L280:
	mov	r1, r5
	mov	r0, r9
	bl	mpi_dev_request_job_for_node
	mov	r4, r0
	cbz	r0, .L283
	ldr	r3, [r0, #40]
	and	r3, r3, #6
	cmp	r3, #2
	beq	.L284
	bl	mpi_obj_unref
.L283:
	mov	r0, r7
	bl	mpi_obj_unref
	b	.L281
.L279:
	mov	r0, r5
	bl	mpi_node_request_buf
	mov	r7, r0
	cmp	r0, #0
	bne	.L280
	ldr	r3, [r8, #332]
	cmp	r3, #0
	bne	.L282
.L281:
	mov	r0, r6
	b	.L301
.L284:
	str	r6, [r0, #96]
	ldr	r3, [r8, #4]
	cbz	r3, .L285
.L287:
	str	r6, [r4, #100]
	mov	r0, r6
	bl	mpi_obj_ref
	b	.L286
.L285:
	cmp	r7, #0
	beq	.L287
	str	r7, [r0, #100]
.L286:
	ldr	r3, [r4, #100]
	movs	r1, #5
	ldr	r2, .L302
	movs	r0, #0
	ldr	r3, [r3]
	str	r3, [sp, #20]
	ldr	r3, [r4, #96]
	ldr	r3, [r3]
	str	r3, [sp, #16]
	ldr	r3, [r5]
	str	r3, [sp, #12]
	ldr	r3, [r9, #80]
	str	r3, [sp, #8]
	ldr	r3, [r4]
	str	r3, [sp, #4]
	movw	r3, #911
	str	r3, [sp]
	ldr	r3, .L302+4
	bl	vlog
	mov	r0, r4
	bl	mpi_job_set_ready
	mov	r0, r4
	ldr	r9, .L302+4
	bl	mpi_obj_ref
	ldr	r10, .L302+8
	movw	r8, #934
.L288:
	mov	r1, r4
	ldr	r0, [r5, #336]
	bl	mpi_queue_push_obj
	mov	r7, r0
	cbz	r0, .L300
	movs	r0, #0
	b	.L277
.L300:
	ldr	r0, [r5, #336]
	bl	mpi_queue_pop_obj
	mov	r6, r0
	cbnz	r0, .L289
	movs	r1, #1
	mov	r0, r4
	bl	mpi_job_cancel
	mov	r0, r4
.L301:
	bl	mpi_obj_unref
.L292:
	mov	r0, #-1
.L277:
	add	sp, sp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, pc}
.L289:
	ldr	r3, [r0, #96]
	ldr	r2, [r0, #44]
	ldr	r1, [r3, #44]
	str	r1, [sp, #24]
	movs	r1, #2
	ldr	r3, [r3]
	strd	r2, r3, [sp, #16]
	mov	r2, r10
	ldr	r3, [r0]
	mov	r0, r7
	str	r3, [sp, #12]
	ldr	r3, [r5]
	str	r3, [sp, #8]
	ldr	r3, [r5, #80]
	ldr	r3, [r3, #80]
	strd	r8, r3, [sp]
	mov	r3, r9
	bl	vlog
	movs	r1, #1
	mov	r0, r6
	bl	mpi_job_cancel
	mov	r0, r6
	bl	mpi_obj_unref
	b	.L288
.L303:
	.align	2
.L302:
	.word	.LC48
	.word	.LANCHOR0+387
	.word	.LC49
	.fnend
	.size	vrga_new_job, .-vrga_new_job
	.align	1
	.global	vrga_handle_node_message
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_handle_node_message, %function
vrga_handle_node_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	mov	r8, r3
	subs	r3, r1, #2
	.pad #24
	sub	sp, sp, #24
	cmp	r3, #1
	mov	r5, r0
	mov	r7, r2
	ldr	r6, [r0, #316]
	bhi	.L305
	cbz	r6, .L313
	ldr	r4, [r6]
	cbz	r4, .L304
	mov	r0, r4
	bl	mpi_obj_ref
	ldr	r3, [r4, #84]
	cmp	r3, r5
	bne	.L307
	mov	r0, r4
	bl	mpi_job_wait
.L307:
	mov	r0, r4
	bl	mpi_obj_unref
.L313:
	movs	r4, #0
.L304:
	mov	r0, r4
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L305:
	ldr	r4, [r8, #8]
	cmp	r4, #0
	bne	.L313
	cmp	r1, #1
	bne	.L304
	ldr	r3, [r6, #4]
	movs	r1, #5
	str	r3, [sp, #16]
	ldr	r3, [r2]
	ldr	r2, .L314
	str	r3, [sp, #12]
	ldr	r3, [r0]
	str	r3, [sp, #8]
	ldr	r3, [r0, #80]
	mov	r0, r4
	ldr	r3, [r3, #80]
	str	r3, [sp, #4]
	mov	r3, #980
	str	r3, [sp]
	ldr	r3, .L314+4
	bl	vlog
	mov	r1, r7
	mov	r0, r5
	bl	vrga_new_job
	mov	r7, r0
	cbnz	r0, .L312
	ldr	r4, [r6, #4]
	cbz	r4, .L308
	mov	r1, r0
	ldr	r0, [r5, #80]
	bl	mpi_dev_run_job
	mov	r1, r7
	bl	mpi_job_done
	b	.L313
.L308:
	add	r0, r8, #164
	bl	rkos_up
	b	.L304
.L312:
	mov	r4, #-1
	b	.L304
.L315:
	.align	2
.L314:
	.word	.LC50
	.word	.LANCHOR0+400
	.fnend
	.size	vrga_handle_node_message, .-vrga_handle_node_message
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_handle_message, %function
vrga_handle_message:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4}
	.save {r4}
	mov	r4, r0
	cbnz	r0, .L317
	ldr	r3, [r0, #36]
	cmp	r3, #1
	bne	.L318
.L317:
	mov	r0, r4
	ldr	r3, .L319
	pop	{r4}
	b	vrga_handle_node_message
.L318:
	pop	{r4}
	bx	lr
.L320:
	.align	2
.L319:
	.word	g_vrga_dev
	.fnend
	.size	vrga_handle_message, .-vrga_handle_message
	.section	.init.text,"ax",%progbits
	.align	1
	.global	vrga_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_init, %function
vrga_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	movw	r2, #5316
	ldr	r4, .L324
	movs	r1, #0
	mov	r0, r4
	bl	memset
	mov	r1, #3264
	ldr	r0, .L324+4
	bl	kstrdup
	movs	r3, #1
	str	r3, [r4, #4]
	movs	r1, #0
	ldr	r3, .L324+8
	str	r3, [r4, #156]
	movs	r3, #25
	str	r3, [r4, #160]
	str	r0, [r4]
	add	r0, r4, #164
	bl	rkos_sema_init
	ldr	r3, .L324+12
	mov	r2, #-1
	mov	r1, r4
	ldr	r0, .L324+16
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L322
	bl	wake_up_process
.L322:
	ldr	r3, .L324+20
	mov	r2, #-1
	ldr	r1, .L324
	ldr	r0, .L324+16
	str	r5, [r4, #168]
	bl	kthread_create_on_node
	cmn	r0, #4096
	mov	r5, r0
	bhi	.L323
	bl	wake_up_process
.L323:
	ldr	r3, .L324+24
	movs	r1, #8
	ldr	r2, .L324+4
	ldr	r0, .L324+28
	str	r3, [r4, #116]
	ldr	r3, .L324+32
	str	r5, [r4, #172]
	str	r4, [r4, #148]
	str	r3, [r4, #124]
	ldr	r3, .L324+36
	str	r3, [r4, #128]
	bl	mpi_dev_register
	movs	r2, #0
	ldr	r1, .L324+40
	ldr	r0, .L324+28
	bl	mpi_sysfs_dev_add
	bl	vrga_filter_init
	mov	r1, #10240
	ldr	r0, .L324+44
	bl	mpi_fs_buf_init
	movs	r0, #0
	pop	{r3, r4, r5, pc}
.L325:
	.align	2
.L324:
	.word	g_vrga_dev
	.word	.LC7
	.word	.LANCHOR0+428
	.word	.LC51
	.word	vrga_thread_fn
	.word	.LC52
	.word	vrga_create_ctx
	.word	g_vrga_dev+12
	.word	vrga_destroy_ctx
	.word	vrga_handle_message
	.word	.LANCHOR0+928
	.word	g_vrga_dev+5296
	.fnend
	.size	vrga_init, .-vrga_init
	.section	.exit.text,"ax",%progbits
	.align	1
	.global	vrga_exit
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	vrga_exit, %function
vrga_exit:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	movs	r3, #1
	ldr	r4, .L339
	add	r0, r4, #164
	str	r3, [r4, #8]
	bl	rkos_up
	add	r0, r4, #164
	bl	rkos_up
	ldr	r0, [r4, #168]
	cbz	r0, .L327
	bl	kthread_stop
	movs	r3, #0
	str	r3, [r4, #168]
.L327:
	ldr	r0, [r4, #172]
	cbz	r0, .L328
	bl	kthread_stop
	movs	r3, #0
	str	r3, [r4, #172]
.L328:
	ldr	r4, .L339+4
	mov	r0, r4
	bl	mpi_sysfs_dev_remove
	mov	r0, r4
	bl	mpi_dev_unregister
	ldr	r0, [r4, #-12]
	cbz	r0, .L329
	bl	kfree
	movs	r3, #0
	str	r3, [r4, #-12]
.L329:
	ldr	r0, .L339+8
	bl	rkos_sema_destory
	bl	vrga_filter_deinit
	ldr	r0, .L339+12
	pop	{r4, lr}
	b	mpi_fs_buf_deinit
.L340:
	.align	2
.L339:
	.word	g_vrga_dev
	.word	g_vrga_dev+12
	.word	g_vrga_dev+164
	.word	g_vrga_dev+5296
	.fnend
	.size	vrga_exit, .-vrga_exit
	.global	g_vrga_dev
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	__func__.36757, %object
	.size	__func__.36757, 10
__func__.36757:
	.ascii	"vrga_open\000"
	.type	__func__.36741, %object
	.size	__func__.36741, 11
__func__.36741:
	.ascii	"vrga_ioctl\000"
	.type	__func__.36815, %object
	.size	__func__.36815, 15
__func__.36815:
	.ascii	"vrga_thread_fn\000"
	.type	__func__.36801, %object
	.size	__func__.36801, 15
__func__.36801:
	.ascii	"rga_handle_job\000"
	.type	__func__.36511, %object
	.size	__func__.36511, 13
__func__.36511:
	.ascii	"vrga_version\000"
	.type	__func__.36717, %object
	.size	__func__.36717, 22
__func__.36717:
	.ascii	"vrga_node_tde_process\000"
	.type	__func__.36791, %object
	.size	__func__.36791, 13
__func__.36791:
	.ascii	"vrga_release\000"
	.type	__func__.36524, %object
	.size	__func__.36524, 17
__func__.36524:
	.ascii	"vrga_node_create\000"
	.type	__func__.36497, %object
	.size	__func__.36497, 39
__func__.36497:
	.ascii	"vrga_get_node_site_from_map_by_nick_id\000"
	.type	__func__.36538, %object
	.size	__func__.36538, 17
__func__.36538:
	.ascii	"vrga_node_delete\000"
	.type	__func__.36569, %object
	.size	__func__.36569, 16
__func__.36569:
	.ascii	"vrga_node_start\000"
	.type	__func__.36578, %object
	.size	__func__.36578, 15
__func__.36578:
	.ascii	"vrga_node_stop\000"
	.type	__func__.36587, %object
	.size	__func__.36587, 16
__func__.36587:
	.ascii	"vrga_node_exist\000"
	.type	__func__.36598, %object
	.size	__func__.36598, 12
__func__.36598:
	.ascii	"vrga_mb_get\000"
	.type	__func__.36608, %object
	.size	__func__.36608, 16
__func__.36608:
	.ascii	"vrga_mb_release\000"
	.type	__func__.36622, %object
	.size	__func__.36622, 13
__func__.36622:
	.ascii	"vrga_mb_send\000"
	.type	__func__.36636, %object
	.size	__func__.36636, 21
__func__.36636:
	.ascii	"vrga_node_set_bypass\000"
	.type	__func__.36646, %object
	.size	__func__.36646, 19
__func__.36646:
	.ascii	"vrga_node_set_crop\000"
	.type	__func__.36668, %object
	.size	__func__.36668, 20
__func__.36668:
	.ascii	"vrga_node_set_scale\000"
	.type	__func__.36689, %object
	.size	__func__.36689, 25
__func__.36689:
	.ascii	"vrga_node_frame_rate_ctl\000"
	.type	__func__.36698, %object
	.size	__func__.36698, 20
__func__.36698:
	.ascii	"vrga_node_set_depth\000"
	.type	__func__.36710, %object
	.size	__func__.36710, 22
__func__.36710:
	.ascii	"vrga_node_attach_pool\000"
	.type	__func__.36836, %object
	.size	__func__.36836, 13
__func__.36836:
	.ascii	"vrga_new_job\000"
	.type	__func__.36873, %object
	.size	__func__.36873, 25
__func__.36873:
	.ascii	"vrga_handle_node_message\000"
	.space	3
	.type	vrga_ioctls, %object
	.size	vrga_ioctls, 500
vrga_ioctls:
	.word	-1065586176
	.word	0
	.word	vrga_version
	.word	.LC53
	.word	0
	.word	-1071091199
	.word	0
	.word	vrga_node_create
	.word	.LC54
	.word	0
	.word	-1071091198
	.word	0
	.word	vrga_node_delete
	.word	.LC55
	.word	0
	.word	-1071091197
	.word	0
	.word	vrga_node_get_status
	.word	.LC56
	.word	0
	.word	-1071091196
	.word	0
	.word	vrga_node_start
	.word	.LC57
	.word	0
	.word	-1071091195
	.word	0
	.word	vrga_node_stop
	.word	.LC58
	.word	0
	.word	-1066896890
	.word	16
	.word	vrga_mb_get
	.word	.LC59
	.word	0
	.word	-1066896889
	.word	0
	.word	vrga_mb_send
	.word	.LC60
	.word	0
	.word	-1066896888
	.word	0
	.word	vrga_mb_release
	.word	.LC61
	.word	0
	.word	-1071091191
	.word	0
	.word	vrga_node_set_bypass
	.word	.LC62
	.word	0
	.space	120
	.word	-1071615472
	.word	0
	.word	vrga_node_set_crop
	.word	.LC63
	.word	0
	.word	-1071091183
	.word	0
	.word	vrga_node_frame_rate_ctl
	.word	.LC64
	.word	0
	.space	40
	.word	-1071877612
	.word	0
	.word	vrga_node_set_scale
	.word	.LC65
	.word	0
	.word	-1071091179
	.word	0
	.word	vrga_node_exist
	.word	.LC66
	.word	0
	.word	-1071091178
	.word	0
	.word	vrga_node_set_depth
	.word	.LC67
	.word	0
	.word	-1071091177
	.word	0
	.word	vrga_node_attach_pool
	.word	.LC68
	.word	0
	.word	-868453864
	.word	0
	.word	vrga_node_tde_process
	.word	.LC69
	.word	0
	.type	vrga_driver_fops, %object
	.size	vrga_driver_fops, 128
vrga_driver_fops:
	.word	0
	.space	4
	.word	vrga_read
	.space	24
	.word	0
	.word	vrga_ioctl
	.word	vrga_compat_ioctl
	.word	0
	.space	4
	.word	vrga_open
	.space	4
	.word	vrga_release
	.space	60
	.bss
	.align	2
	.type	g_vrga_dev, %object
	.size	g_vrga_dev, 5316
g_vrga_dev:
	.space	5316
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\033[1;32m--------- vrga open ----------\033[0m\000"
.LC1:
	.ascii	"\033[1;31mvrga: error vrga ioctl\033[0m\000"
.LC2:
	.ascii	"vmpi:1c41df617a42efb36cf235869f2aae11b4b63343-v2.13"
	.ascii	".0\000"
.LC3:
	.ascii	"module: %s\012version: %s\012build: %s\012\000"
.LC4:
	.ascii	"-2024-10-16-16:52:39\000"
.LC5:
	.ascii	"***********************************************rga "
	.ascii	"node param*****************************************"
	.ascii	"**********\012\000"
.LC6:
	.ascii	"id---name--------ctx--------nid-ref-bypass-csnt-cgn"
	.ascii	"t-ssnt-sgnt-type-swidth-sheight-svwidth-svheight-sf"
	.ascii	"mt-cenable-coordinate-cxpos-cypos-cwidth-cheight-jo"
	.ascii	"b-------------\012\000"
.LC7:
	.ascii	"vrga\000"
.LC8:
	.ascii	"%-#4d %-#11.11s %-#10x %-#3d %-#3d %-#6d %-#4d %-#4"
	.ascii	"d %-#4d %-#4d %-#4d %-#6d %-#7d %-#7d %-#8d %-#4d %"
	.ascii	"-#7d %-#10d %-#5d %-#5d %-#6d %-#6d \000"
.LC9:
	.ascii	"\012\000"
.LC10:
	.ascii	"dev(%s-%d) register ok!\000"
.LC11:
	.ascii	"%s-%d\000"
.LC12:
	.ascii	"vrga job(%d) run for (%s) buf(%d: %p->%d: %p), vctx"
	.ascii	"(%d: %p), nick_id(%d)\000"
.LC13:
	.ascii	"rga into handle job type:%d \000"
.LC14:
	.ascii	"\033[1;31mrga not support handle type:%d\033[0m\000"
.LC15:
	.ascii	"\033[1;31mrga handle job is failed\033[0m\000"
.LC16:
	.ascii	"\033[1;31mstruct vrga_version mismatching\033[0m\000"
.LC17:
	.ascii	"\033[1;31mstruct vrga_tde_info mismatching\033[0m\000"
.LC18:
	.ascii	"\033[1;31mvrga_node get vrga_driver failure\033[0m\000"
.LC19:
	.ascii	"\033[1;32m--------- vrga release ----------\033[0m\000"
.LC20:
	.ascii	"\033[1;31mstruct vrga_node_info mismatching\033[0m\000"
.LC21:
	.ascii	"valloc\000"
.LC22:
	.ascii	"\033[1;31mmpi_allocator_find_by_name: valloc failur"
	.ascii	"e\033[0m\000"
.LC23:
	.ascii	"\033[1;31mmpi_dev_create_node rga ctx_id:%d failure"
	.ascii	"\033[0m\000"
.LC24:
	.ascii	"\033[1;32mRGA %d(%d) node create success!\033[0m\000"
.LC25:
	.ascii	"\033[1;32mRGA %d(%d) create MB_SOURCE_PRIVATE succe"
	.ascii	"ss! pool %p pool_id %d bufffer_cnt %d bufffer_size "
	.ascii	"%d\033[0m\000"
.LC26:
	.ascii	"\033[1;32mRGA %d(%d) node create done!\033[0m\000"
.LC27:
	.ascii	"mod = %d nick_id = %d\000"
.LC28:
	.ascii	"\033[1;31mRGA (%d)%d node not find!\033[0m\000"
.LC29:
	.ascii	"\033[1;32mRGA %d(%d) node destroy done!\033[0m\000"
.LC30:
	.ascii	"\033[1;32mRGA %d(%d) node start done!\033[0m\000"
.LC31:
	.ascii	"\033[1;32mRGA %d(%d) node stop done!\033[0m\000"
.LC32:
	.ascii	"\033[1;32mRGA %d(%d) node exist!\033[0m\000"
.LC33:
	.ascii	"\033[1;31mstruct vrga_buff_info mismatching\033[0m\000"
.LC34:
	.ascii	"RGA %d(%d) node release mpi_buf(%p), dma_buf(%p), b"
	.ascii	"uf_id(%ld), buf_refcnt(%d).\000"
.LC35:
	.ascii	"\033[1;31mbuf null\033[0m\000"
.LC36:
	.ascii	"\033[1;31merror cannot find mpi_buf fr fd %d\033[0m"
	.ascii	"\000"
.LC37:
	.ascii	"RGA %d(%d) node mpi_buf(%p), buf_id(%d), buf_refcnt"
	.ascii	"(%d), dma_buf(%p), fd(%d).\000"
.LC38:
	.ascii	"\033[1;31mstruct vrga_crop_info mismatching\033[0m\000"
.LC39:
	.ascii	"\033[1;31mnot found vrga_node\033[0m\000"
.LC40:
	.ascii	"\033[1;32mRGA %d(%d) exceed max crop buf cnt(0x%x-0"
	.ascii	"x%x), cover last one\033[0m\000"
.LC41:
	.ascii	"\033[1;32mRGA %d(%d) node enable(%d), ration(0)/abs"
	.ascii	"(1)(%d), x(%d), y(%d), w(%d), h(%d), s/g(0x%x-0x%x)"
	.ascii	"\033[0m\000"
.LC42:
	.ascii	"\033[1;31mstruct vrga_scale_info mismatching\033[0m"
	.ascii	"\000"
.LC43:
	.ascii	"\033[1;32mRGA %d(%d) exceed max scale buf cnt(0x%x-"
	.ascii	"0x%x), cover last one\033[0m\000"
.LC44:
	.ascii	"\033[1;32mRGA %d(%d) node w(%d), h(%d), vw(%d), vh("
	.ascii	"%d), fmt(%d), s/g(0x%x-0x%x)\033[0m\000"
.LC45:
	.ascii	"\033[1;32mRGA %d(%d) need update pool buffer_cnt %d"
	.ascii	" buffer_size %d\033[0m\000"
.LC46:
	.ascii	"\033[1;31mRGA %d(%d) find valloc failure!\033[0m\000"
.LC47:
	.ascii	"\033[1;31mRGA %d(%d) pool create failed, buf_size: "
	.ascii	"%d, buf_cnt: %d\033[0m\000"
.LC48:
	.ascii	"vrga job(%d) ready for (%s-%d) buf(%d->%d)\000"
.LC49:
	.ascii	"\033[1;31mvrga(%s-%d) drop job(%d)->refcnt(%d), \011"
	.ascii	"\011\011\011\011src_buf(%d)->refcnt(%d)\033[0m\000"
.LC50:
	.ascii	"vrga(%s-%d) buf(%d) bypass(%d) ready\000"
.LC51:
	.ascii	"vrga_0\000"
.LC52:
	.ascii	"vrga_1\000"
.LC53:
	.ascii	"VRGA_IOCTL_VERSION\000"
.LC54:
	.ascii	"VRGA_IOCTL_NODE_CREATE\000"
.LC55:
	.ascii	"VRGA_IOCTL_NODE_DELETE\000"
.LC56:
	.ascii	"VRGA_IOCTL_NODE_GET_STATUS\000"
.LC57:
	.ascii	"VRGA_IOCTL_NODE_START\000"
.LC58:
	.ascii	"VRGA_IOCTL_NODE_STOP\000"
.LC59:
	.ascii	"VRGA_IOCTL_MB_GET\000"
.LC60:
	.ascii	"VRGA_IOCTL_MB_SEND\000"
.LC61:
	.ascii	"VRGA_IOCTL_MB_RELEASE\000"
.LC62:
	.ascii	"VRGA_IOCTL_SET_BYPASS\000"
.LC63:
	.ascii	"VRGA_IOCTL_SET_CROP\000"
.LC64:
	.ascii	"VRGA_IOCTL_FRAME_RATE_CTL\000"
.LC65:
	.ascii	"VRGA_IOCTL_SET_SCALE\000"
.LC66:
	.ascii	"VRGA_IOCTL_NODE_EXIST\000"
.LC67:
	.ascii	"VRGA_IOCTL_SET_DEPTH\000"
.LC68:
	.ascii	"VRGA_IOCTL_ATTACH_POOL\000"
.LC69:
	.ascii	"VRGA_IOCTL_TDE_PROCESS\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
