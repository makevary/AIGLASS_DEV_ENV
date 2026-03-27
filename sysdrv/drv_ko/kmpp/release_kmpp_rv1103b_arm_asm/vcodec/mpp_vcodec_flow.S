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
	.file	"mpp_vcodec_flow.c"
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
	.type	frame_add_osd, %function
frame_add_osd:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	.save {r3, r4, r5, r6, r7, lr}
	mov	r6, r1
	bl	mpp_frame_add_osd
	ldr	r7, .L12
	mov	r4, r6
	movs	r5, #0
.L2:
	ldr	r3, [r6, #4]
	cmp	r3, r5
	bhi	.L5
	movs	r0, #0
	pop	{r3, r4, r5, r6, r7, pc}
.L5:
	ldr	r0, [r4, #136]
	cbz	r0, .L3
	mov	r2, r7
	movs	r1, #0
	bl	mpi_buf_unref_with_tag
.L3:
	ldr	r0, [r4, #88]
	cbz	r0, .L4
	mov	r2, r7
	movs	r1, #0
	bl	mpi_buf_unref_with_tag
.L4:
	adds	r5, r5, #1
	adds	r4, r4, #140
	b	.L2
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.fnend
	.size	frame_add_osd, .-frame_add_osd
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_sub.constprop.0, %function
atomic_sub.constprop.0:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 224 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_sub
1:	ldrex	r3, [r0]
	sub	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_sub.constprop.0, .-atomic_sub.constprop.0
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	atomic_add.constprop.1, %function
atomic_add.constprop.1:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	pld	[r0]
	.syntax unified
@ 223 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/atomic.h" 1
	@ atomic_add
1:	ldrex	r3, [r0]
	add	r3, r3, #1
	strex	r2, r3, [r0]
	teq	r2, #0
	bne	1b
@ 0 "" 2
	.thumb
	.syntax unified
	bx	lr
	.fnend
	.size	atomic_add.constprop.1, .-atomic_add.constprop.1
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	enc_chan_process_single_chan, %function
enc_chan_process_single_chan:
	.fnstart
	@ args = 0, pretend = 0, frame = 160
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	.save {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	movs	r1, #1
	.pad #172
	sub	sp, sp, #172
	mov	r6, r0
	bl	mpp_vcodec_get_chan_entry
	movs	r5, #0
	mov	r4, r0
	strd	r5, r5, [sp, #20]
	str	r5, [sp, #28]
	bl	get_mpibuf_ops
	mov	r8, r0
	cbnz	r4, .L17
	ldr	r1, .L138
	movs	r2, #101
	ldr	r0, .L138+4
.L137:
	bl	printk
	mov	r0, #-1
.L16:
	add	sp, sp, #172
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L17:
	cbnz	r0, .L19
	movs	r2, #105
	ldr	r1, .L138
	ldr	r0, .L138+8
	b	.L137
.L19:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #28]
	cmp	r3, #3
	beq	.L20
	mov	r2, r6
	movs	r1, #111
	ldr	r0, .L138+12
	bl	printk
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L136:
	movs	r0, #0
	b	.L16
.L20:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #36]
	ldr	r9, .L138+36
	cmp	r3, #0
	ble	.L21
	ldr	r0, [r9]
	ands	r0, r0, #32
	beq	.L16
	mov	r3, r6
	movs	r2, #118
	ldr	r1, .L138
	ldr	r0, .L138+16
	bl	printk
	b	.L136
.L21:
	ldr	r3, [r9]
	lsls	r2, r3, #26
	bpl	.L22
	mov	r3, r6
	movs	r2, #122
	ldr	r1, .L138
	ldr	r0, .L138+20
	bl	printk
.L22:
	ldr	r5, [r4, #40]
	cmp	r5, #0
	bne	.L59
	ldr	r0, [r4, #56]
	bl	mpp_enc_check_pkt_pool
	cbnz	r0, .L24
	mov	r2, r6
	movs	r1, #127
	ldr	r0, .L138+24
	bl	printk
	b	.L136
.L24:
	ldr	r3, [r8, #40]
	cmp	r3, #0
	beq	.L136
	ldr	r0, [r4, #60]
	blx	r3
	mov	r7, r0
	cmp	r0, #0
	beq	.L136
	bl	mpp_time
	ldr	r3, [r4, #160]
	subs	r0, r0, r3
	str	r0, [r4, #184]
	bl	mpp_time
	ldr	fp, [r4]
	strd	r0, [r4, #160]
	bl	get_mpibuf_ops
	movs	r2, #104
	mov	r1, r5
	mov	r10, r0
	add	r0, sp, #64
	bl	memset
	cmp	r10, #0
	beq	.L27
	ldr	r3, [r10, #52]
	cbnz	r3, .L28
.L27:
	movs	r1, #56
	ldr	r0, .L138+28
	bl	printk
.L29:
	ldr	r2, .L138+32
	movs	r1, #0
	mov	r0, r7
	bl	mpi_buf_unref_with_tag
	b	.L136
.L139:
	.align	2
.L138:
	.word	.LANCHOR0+14
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LANCHOR0+43
	.word	mpp_vcodec_debug
.L28:
	mov	r2, fp
	add	r1, sp, #64
	mov	r0, r7
	blx	r3
	cmp	r0, #0
	bne	.L29
	add	r0, sp, #20
	bl	mpp_frame_init
	ldr	r1, [sp, #64]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_width
	ldr	r1, [sp, #68]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_height
	ldr	r1, [sp, #72]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_hor_stride
	ldr	r1, [sp, #76]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_ver_stride
	ldrd	r2, [sp, #104]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_pts
	ldrd	r2, [sp, #144]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_dts
	ldr	r1, [sp, #92]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_fmt
	ldr	r1, [sp, #84]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_offset_x
	ldr	r1, [sp, #88]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_offset_y
	ldr	r1, [sp, #128]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_is_gray
	ldr	r1, [sp, #132]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_is_full
	ldr	r1, [sp, #136]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_phy_addr
	ldr	r1, [sp, #156]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_idr_request
	ldrb	r1, [sp, #160]	@ zero_extendqisi2
	ldr	r0, [sp, #20]
	and	r1, r1, #1
	bl	mpp_frame_set_eos
	ldr	r1, [sp, #116]
	cbz	r1, .L30
	ldr	r0, [sp, #20]
	bl	frame_add_osd
.L30:
	ldr	r1, [sp, #152]
	cbz	r1, .L31
	ldr	r0, [sp, #20]
	bl	mpp_frame_add_ppinfo
.L31:
	movs	r2, #32
	movs	r1, #0
	add	r0, sp, r2
	ldr	r5, .L140
	bl	memset
	movs	r3, #0
	mov	r0, r3
	str	r5, [sp]
	add	r2, sp, #28
	add	r1, sp, #32
	str	r7, [sp, #44]
	bl	mpp_buffer_import_with_tag
	ldr	r3, [r9]
	lsls	r3, r3, #25
	bpl	.L32
	ldr	r3, [sp, #112]
	movs	r2, #146
	sub	r1, r5, #29
	ldr	r0, .L140+4
	bl	printk
.L32:
	ldr	r0, [sp, #112]
	cmp	r0, #0
	bgt	.L33
.L135:
	movs	r5, #0
.L34:
	ldr	r1, [sp, #28]
	ldr	r0, [sp, #20]
	bl	mpp_frame_set_buffer
	ldr	r3, [r8, #16]
	cbz	r3, .L23
	mov	r0, r7
	blx	r3
.L23:
	ldr	r3, [sp, #20]
	cbnz	r3, .L39
	ldr	r3, [r4, #40]
	cmp	r3, #0
	beq	.L40
.L39:
	bl	mpp_time
	add	r9, r4, #36
	str	r0, [sp, #12]
	mov	r0, r9
	bl	atomic_add.constprop.1
	ldr	r0, [r4, #56]
	ldr	r1, [sp, #20]
	bl	mpp_enc_cfg_reg
	ldrd	r2, [sp, #144]
	mov	fp, r0
	strd	r2, [r4, #144]
	cbnz	r0, .L42
	cmp	r5, #0
	beq	.L43
	ldr	r3, [r5, #56]
	cmp	r3, #0
	beq	.L43
	add	r8, r5, #36
	add	r7, r4, #24
	mov	r0, r8
	bl	atomic_add.constprop.1
	mov	r0, r7
	bl	atomic_add.constprop.1
	ldr	r0, [r5, #56]
	ldr	r1, [sp, #24]
	bl	mpp_enc_cfg_reg
	mov	r10, r0
	cmp	r0, #0
	bne	.L44
	ldr	r1, [r5, #56]
	ldr	r0, [r4, #56]
	bl	mpp_enc_hw_start
	cmp	r0, #0
	beq	.L45
	movs	r1, #193
	ldr	r0, .L140+8
	bl	printk
	mov	r0, r7
	bl	atomic_sub.constprop.0
	mov	r0, r8
	bl	atomic_sub.constprop.0
	mov	r3, r10
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #76
	bl	__wake_up
.L42:
	bl	get_mpidev_ops
	mov	r7, r0
	bl	mpp_vcodec_get_enc_module_entry
	mov	r8, r0
	mov	r0, r9
	bl	atomic_sub.constprop.0
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r4, #76
	bl	__wake_up
	ldr	r3, [sp, #20]
	cbz	r3, .L51
	cbz	r7, .L52
	ldr	r3, [r7, #28]
	cbz	r3, .L52
	ldr	r0, [r4]
	blx	r3
.L52:
	add	r0, sp, #20
	bl	mpp_frame_deinit
.L51:
	ldr	r3, [sp, #24]
	cbz	r3, .L53
	cbz	r7, .L54
	ldr	r3, [r7, #28]
	cbz	r3, .L54
	cbz	r5, .L54
	ldr	r0, [r5]
	blx	r3
.L54:
	add	r0, sp, #24
	bl	mpp_frame_deinit
.L53:
	ldrb	r3, [r4, #21]	@ zero_extendqisi2
	cbz	r3, .L55
	ldr	r0, [r4, #56]
	bl	mpp_enc_online_task_failed
.L55:
	ldr	r0, [r8, #3872]
	bl	vcodec_thread_trigger
	b	.L46
.L33:
	movs	r1, #1
	bl	mpp_vcodec_get_chan_entry
	ldr	r3, [r0, #28]
	mov	r5, r0
	cmp	r3, #3
	bne	.L135
	cmp	r0, #0
	beq	.L135
	ldr	r3, [r0, #36]
	cmp	r3, #0
	ble	.L36
	ldr	r3, [sp, #112]
	movs	r2, #154
	ldr	r1, .L140+12
	ldr	r0, .L140+16
	str	r3, [sp]
	mov	r3, r6
	bl	printk
	b	.L135
.L59:
	movs	r5, #0
	b	.L23
.L45:
	ldr	r3, [r4]
	str	r3, [r5, #8]
.L46:
	bl	mpp_time
	ldr	r3, [sp, #12]
	subs	r0, r0, r3
	str	r0, [r4, #152]
.L40:
	ldr	r0, [sp, #28]
	cbz	r0, .L56
	ldr	r1, .L140
	bl	mpp_buffer_put_with_caller
.L56:
	mov	r0, r6
	bl	enc_chan_update_tab_after_enc
	b	.L136
.L44:
	bl	get_mpidev_ops
	movs	r1, #203
	mov	r10, r0
	ldr	r0, .L140+20
	bl	printk
	mov	r0, r8
	bl	atomic_sub.constprop.0
	mov	r0, r7
	bl	atomic_sub.constprop.0
	mov	r3, fp
	movs	r2, #1
	movs	r1, #3
	add	r0, r5, #76
	bl	__wake_up
	cmp	r10, #0
	beq	.L47
	ldr	r3, [r10, #28]
	cbz	r3, .L47
	ldr	r0, [r5]
	blx	r3
.L47:
	ldr	r3, [sp, #24]
	cbz	r3, .L43
	add	r0, sp, #24
	bl	mpp_frame_deinit
.L43:
	movs	r1, #0
	ldr	r0, [r4, #56]
	bl	mpp_enc_hw_start
	cmp	r0, #0
	beq	.L46
	b	.L42
.L36:
	ldr	r3, [r0, #56]
	cmp	r3, #0
	beq	.L34
	bl	mpp_time
	ldr	r3, [r4, #168]
	subs	r0, r0, r3
	str	r0, [r4, #188]
	bl	mpp_time
	ldr	r3, [sp, #112]
	strd	r0, [r4, #168]
	add	r0, sp, #24
	str	r3, [r4, #4]
	bl	mpp_frame_init
	ldrd	r1, r0, [sp, #20]
	bl	mpp_frame_copy
	ldr	r1, [sp, #124]
	cbz	r1, .L37
	ldr	r0, [sp, #24]
	bl	frame_add_osd
.L37:
	ldrd	r0, r1, [sp, #24]
	bl	mpp_frame_set_buffer
	b	.L34
.L141:
	.align	2
.L140:
	.word	.LANCHOR0+43
	.word	.LC7
	.word	.LC9
	.word	.LANCHOR0+14
	.word	.LC8
	.word	.LC10
	.fnend
	.size	enc_chan_process_single_chan, .-enc_chan_process_single_chan
	.align	1
	.global	mpp_vcodec_enc_add_packet_list
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_add_packet_list, %function
mpp_vcodec_enc_add_packet_list:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L149
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	.save {r4, r5, r6, r7, lr}
	.pad #12
	mov	r4, r0
	ldr	r3, [r3]
	mov	r5, r1
	str	r1, [sp, #4]
	lsls	r3, r3, #26
	bpl	.L143
	mov	r0, r1
	bl	mpp_packet_get_length
	movs	r2, #255
	ldr	r1, .L149+4
	mov	r3, r0
	ldr	r0, .L149+8
	bl	printk
.L143:
	bl	get_vsm_ops
	mov	r6, r0
	cbnz	r0, .L144
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r7, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r3, [r4, #88]
	add	r2, r5, #12
	add	r1, r4, #84
	str	r2, [r4, #88]
	add	r0, r4, #100
	strd	r1, r3, [r5, #12]
	str	r2, [r3]
	bl	atomic_add.constprop.1
	add	r0, r4, #108
	bl	atomic_add.constprop.1
	ldr	r0, [sp, #4]
	bl	mpp_packet_get_dts
	strd	r0, [r4, #136]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r7	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #1
	mov	r3, r6
	movs	r1, #3
	add	r0, r4, #68
	bl	__wake_up
.L145:
	movs	r3, #0
	str	r3, [r4, #40]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, pc}
.L144:
	add	r0, sp, #4
	bl	mpp_packet_deinit
	b	.L145
.L150:
	.align	2
.L149:
	.word	mpp_vcodec_debug
	.word	.LANCHOR0+72
	.word	.LC11
	.fnend
	.size	mpp_vcodec_enc_add_packet_list, .-mpp_vcodec_enc_add_packet_list
	.align	1
	.global	mpp_vcodec_enc_int_handle
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_int_handle, %function
mpp_vcodec_enc_int_handle:
	.fnstart
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	.pad #8
	mov	r6, r2
	mov	r5, r1
	cbz	r1, .L152
	cmp	r1, #1
	beq	.L153
	mov	r2, r1
	ldr	r0, .L192
	movw	r1, #349
	b	.L191
.L152:
	strd	r1, r1, [sp]
	movs	r1, #1
	bl	mpp_vcodec_get_chan_entry
	movs	r6, #1
	str	r6, [r0, #40]
	mov	r4, r0
	bl	mpp_vcodec_get_enc_module_entry
	mov	r7, r0
	cbnz	r0, .L155
	ldr	r1, .L192+4
	mov	r2, #282
	ldr	r0, .L192+8
.L191:
	bl	printk
	b	.L151
.L155:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L157
	mov	r1, r6
	ldr	r0, [r4, #4]
	bl	mpp_vcodec_get_chan_entry
	mov	r6, r0
	cbz	r0, .L158
	ldr	r3, [r0, #56]
	cbz	r3, .L158
	bl	get_mpidev_ops
	mov	r8, r0
	bl	mpp_time
	strd	r0, [r4, #176]
	add	r3, sp, #4
	ldr	r1, [r6, #56]
	mov	r2, sp
	ldr	r0, [r4, #56]
	bl	mpp_enc_int_process
	ldr	r1, [sp, #4]
	mov	r5, r0
	cbz	r1, .L159
	mov	r0, r6
	bl	mpp_vcodec_enc_add_packet_list
.L158:
	add	r0, r4, #24
	bl	atomic_sub.constprop.0
	add	r0, r6, #36
	bl	atomic_sub.constprop.0
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	add	r0, r6, #76
	bl	__wake_up
	mov	r3, #-1
	str	r3, [r4, #4]
	str	r3, [r6, #8]
.L160:
	ldr	r1, [sp]
	cbz	r1, .L161
	mov	r0, r4
	bl	mpp_vcodec_enc_add_packet_list
.L161:
	cbz	r5, .L162
	movs	r3, #0
	str	r3, [r4, #40]
.L162:
	add	r0, r4, #36
	bl	atomic_sub.constprop.0
	add	r0, r4, #76
	movs	r3, #0
	movs	r2, #1
	movs	r1, #3
	bl	__wake_up
	ldr	r0, [r7, #3872]
	bl	vcodec_thread_trigger
.L151:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, pc}
.L159:
	cmp	r8, #0
	beq	.L158
	ldr	r3, [r8, #28]
	cmp	r3, #0
	beq	.L158
	ldr	r0, [r6]
	blx	r3
	b	.L158
.L157:
	mov	r1, r5
	add	r3, sp, #4
	mov	r2, sp
	ldr	r0, [r4, #56]
	bl	mpp_enc_int_process
	mov	r5, r0
	b	.L160
.L153:
	bl	mpp_vcodec_get_chan_entry
	movs	r3, #0
	str	r3, [sp, #4]
	mov	r4, r0
	ldr	r3, [r0, #24]
	cbz	r3, .L164
	movw	r1, #329
	ldr	r0, .L192+12
	bl	printk
.L164:
	mov	r1, r6
	add	r2, sp, #4
	ldr	r0, [r4, #56]
	bl	mpp_enc_slice_info
	ldr	r1, [sp, #4]
	cmp	r1, #0
	beq	.L151
	mov	r0, r4
	bl	mpp_vcodec_enc_add_packet_list
	b	.L151
.L193:
	.align	2
.L192:
	.word	.LC14
	.word	.LANCHOR0+103
	.word	.LC12
	.word	.LC13
	.fnend
	.size	mpp_vcodec_enc_int_handle, .-mpp_vcodec_enc_int_handle
	.align	1
	.global	mpp_vcodec_enc_run_task
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_run_task, %function
mpp_vcodec_enc_run_task:
	.fnstart
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	.save {r4, r5, r6, r7, r8, lr}
	movs	r1, #1
	mov	r4, r2
	mov	r5, r3
	ldrd	r6, [sp, #24]
	bl	mpp_vcodec_get_chan_entry
	cbz	r0, .L197
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r0, #28]
	cmp	r2, #3
	beq	.L196
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	mov	r0, #-1
.L194:
	pop	{r4, r5, r6, r7, r8, pc}
.L196:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	strd	r6, [sp, #24]
	mov	r2, r4
	mov	r3, r5
	ldr	r0, [r0, #56]
	pop	{r4, r5, r6, r7, r8, lr}
	b	mpp_enc_run_task
.L197:
	mvn	r0, #21
	b	.L194
	.fnend
	.size	mpp_vcodec_enc_run_task, .-mpp_vcodec_enc_run_task
	.align	1
	.global	mpp_vcodec_enc_set_online_mode
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_set_online_mode, %function
mpp_vcodec_enc_set_online_mode:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	mov	r4, r1
	movs	r1, #1
	bl	mpp_vcodec_get_chan_entry
	cbz	r0, .L202
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r2, [r0, #28]
	cmp	r2, #3
	beq	.L200
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
.L203:
	mov	r0, #-1
.L198:
	pop	{r4, pc}
.L200:
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	cmp	r4, #2
	bls	.L201
	mov	r3, r4
	mov	r2, #390
	ldr	r1, .L204
	ldr	r0, .L204+4
	bl	printk
	b	.L203
.L201:
	strb	r4, [r0, #21]
	mov	r1, r4
	ldr	r0, [r0, #56]
	pop	{r4, lr}
	b	mpp_enc_set_online_mode
.L202:
	mvn	r0, #21
	b	.L198
.L205:
	.align	2
.L204:
	.word	.LANCHOR0+126
	.word	.LC15
	.fnend
	.size	mpp_vcodec_enc_set_online_mode, .-mpp_vcodec_enc_set_online_mode
	.align	1
	.global	mpp_vcodec_enc_routine
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_enc_routine, %function
mpp_vcodec_enc_routine:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	bl	mpp_vcodec_get_enc_module_entry
	mov	r6, r0
	cbnz	r0, .L207
	movw	r2, #407
	ldr	r1, .L222
	ldr	r0, .L222+4
	bl	printk
	mvn	r0, #5
.L206:
	pop	{r4, r5, r6, pc}
.L207:
	.syntax unified
@ 29 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		mrs	r3, cpsr	@ arch_local_irq_save
	cpsid	i
@ 0 "" 2
	.thumb
	.syntax unified
	movs	r2, #0
	ldr	r5, [r0, #3732]
	str	r2, [r0, #3736]
	.syntax unified
@ 171 "/home/cww/ipc-sdk/rv1103b-2/sysdrv/source/kernel/arch/arm/include/asm/irqflags.h" 1
		msr	cpsr_c, r3	@ local_irq_restore
@ 0 "" 2
	.thumb
	.syntax unified
	ldr	r4, .L222+8
	ldr	r2, [r4]
	lsls	r3, r2, #26
	bpl	.L210
	mov	r3, r5
	movw	r2, #415
	ldr	r1, .L222
	ldr	r0, .L222+12
	bl	printk
.L210:
	cbz	r5, .L215
	bl	enc_chan_get_high_prior_chan
	ldr	r0, [r6, #3740]
	cmp	r0, #15
	bls	.L211
.L212:
	subs	r5, r5, #1
	b	.L210
.L211:
	bl	enc_chan_process_single_chan
	cmp	r0, #0
	beq	.L212
.L215:
	ldr	r0, [r4]
	ands	r0, r0, #32
	beq	.L206
	movw	r2, #425
	ldr	r1, .L222
	ldr	r0, .L222+16
	bl	printk
	movs	r0, #0
	b	.L206
.L223:
	.align	2
.L222:
	.word	.LANCHOR0+157
	.word	.LC16
	.word	mpp_vcodec_debug
	.word	.LC17
	.word	.LC18
	.fnend
	.size	mpp_vcodec_enc_routine, .-mpp_vcodec_enc_routine
	.align	1
	.global	mpp_vcodec_dec_routine
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	mpp_vcodec_dec_routine, %function
mpp_vcodec_dec_routine:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	bx	lr
	.fnend
	.size	mpp_vcodec_dec_routine, .-mpp_vcodec_dec_routine
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.26180, %object
	.size	__FUNCTION__.26180, 14
__FUNCTION__.26180:
	.ascii	"frame_add_osd\000"
	.type	__func__.26205, %object
	.size	__func__.26205, 29
__func__.26205:
	.ascii	"enc_chan_process_single_chan\000"
	.type	__FUNCTION__.26217, %object
	.size	__FUNCTION__.26217, 29
__FUNCTION__.26217:
	.ascii	"enc_chan_process_single_chan\000"
	.type	__func__.26232, %object
	.size	__func__.26232, 31
__func__.26232:
	.ascii	"mpp_vcodec_enc_add_packet_list\000"
	.type	__func__.26248, %object
	.size	__func__.26248, 23
__func__.26248:
	.ascii	"mpp_vcodec_event_frame\000"
	.type	__func__.26298, %object
	.size	__func__.26298, 31
__func__.26298:
	.ascii	"mpp_vcodec_enc_set_online_mode\000"
	.type	__func__.26306, %object
	.size	__func__.26306, 23
__func__.26306:
	.ascii	"mpp_vcodec_enc_routine\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"\0013mpp_vcodec: %s:%d: chan_entry is NULL\012\000"
.LC1:
	.ascii	"\0013mpp_vcodec: %s:%d: mpibuf_ops get fail\012\000"
.LC2:
	.ascii	"\0013mpp_vcodec: %d: cur chnl %d state is no runing"
	.ascii	"\012\000"
.LC3:
	.ascii	"\0016mpp_vcodec: %s:%d: cur chnl %d state is wating"
	.ascii	" irq\012\000"
.LC4:
	.ascii	"\0016mpp_vcodec: %s:%d: enc_chan_process_single_cha"
	.ascii	"n id %d\012\000"
.LC5:
	.ascii	"\0016mpp_vcodec: %d: cur chnl %d pkt pool non free "
	.ascii	"buf\012\000"
.LC6:
	.ascii	"\0013mpp_vcodec: %d: get buf info fail\000"
.LC7:
	.ascii	"\0016mpp_vcodec: %s:%d: attach jpeg id %d\012\000"
.LC8:
	.ascii	"\0013mpp_vcodec: %s:%d: chan %d combo chan %d state"
	.ascii	" is wating irq\012\000"
.LC9:
	.ascii	"\0013mpp_vcodec: %d: combo start fail \012\000"
.LC10:
	.ascii	"\0013mpp_vcodec: %d: combo cfg fail \012\000"
.LC11:
	.ascii	"\0016mpp_vcodec: %s:%d: packet size %zu\012\000"
.LC12:
	.ascii	"\0013mpp_vcodec: %s:%d: get_enc_module_entry fail\000"
.LC13:
	.ascii	"\0013mpp_vcodec: %d: combo running fail because sli"
	.ascii	"ce fifo.\000"
.LC14:
	.ascii	"\0013mpp_vcodec: %d: mpp vcodec event %d is invalid"
	.ascii	".\012\000"
.LC15:
	.ascii	"\0013mpp_vcodec: %s:%d: online mode invalid %d\012\000"
.LC16:
	.ascii	"\0013mpp_vcodec: %s:%d: get_enc_module_entry fail\012"
	.ascii	"\000"
.LC17:
	.ascii	"\0016mpp_vcodec: %s:%d: mpp_vcodec_enc_routine star"
	.ascii	"ted_chan_num %d\012\000"
.LC18:
	.ascii	"\0016mpp_vcodec: %s:%d: mpp_vcodec_enc_routine end\012"
	.ascii	"\000"
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
