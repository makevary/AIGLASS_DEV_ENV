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
	.file	"osal_timer.c"
	.text
	.syntax unified
	.syntax unified
	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_timer_init:					
	.asciz 	"rkos_timer_init"					
__kstrtabns_rkos_timer_init:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_set_timer:					
	.asciz 	"rkos_set_timer"					
__kstrtabns_rkos_set_timer:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_del_timer:					
	.asciz 	"rkos_del_timer"					
__kstrtabns_rkos_del_timer:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_timer_destory:					
	.asciz 	"rkos_timer_destory"					
__kstrtabns_rkos_timer_destory:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_msleep:					
	.asciz 	"rkos_msleep"					
__kstrtabns_rkos_msleep:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_udelay:					
	.asciz 	"rkos_udelay"					
__kstrtabns_rkos_udelay:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_mdelay:					
	.asciz 	"rkos_mdelay"					
__kstrtabns_rkos_mdelay:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_get_tickcount:					
	.asciz 	"rkos_get_tickcount"					
__kstrtabns_rkos_get_tickcount:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_sched_clock:					
	.asciz 	"rkos_sched_clock"					
__kstrtabns_rkos_sched_clock:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_gettime:					
	.asciz 	"rkos_gettime"					
__kstrtabns_rkos_gettime:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_time_after:					
	.asciz 	"rkos_time_after"					
__kstrtabns_rkos_time_after:					
	.asciz 	""					
	.previous						

	.section "__ksymtab_strings","aMS",%progbits,1	
__kstrtab_rkos_getjiffies:					
	.asciz 	"rkos_getjiffies"					
__kstrtabns_rkos_getjiffies:					
	.asciz 	""					
	.previous						

	.thumb
	.syntax unified
	.align	1
	.global	rkos_sched_clock
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_sched_clock, %function
rkos_sched_clock:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r0, #0
	movs	r1, #0
	bx	lr
	.fnend
	.size	rkos_sched_clock, .-rkos_sched_clock
	.align	1
	.global	rkos_time_after
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_time_after, %function
rkos_time_after:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	subs	r2, r2, r0
	movs	r1, #0
	asrs	r3, r2, #31
	lsrs	r0, r3, #31
	bx	lr
	.fnend
	.size	rkos_time_after, .-rkos_time_after
	.align	1
	.global	rkos_getjiffies
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_getjiffies, %function
rkos_getjiffies:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L4
	movs	r1, #0
	ldr	r0, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	jiffies
	.fnend
	.size	rkos_getjiffies, .-rkos_getjiffies
	.align	1
	.global	rkos_mdelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_mdelay, %function
rkos_mdelay:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r5, .L9
	ldr	r6, .L9+4
.L7:
	adds	r4, r4, #-1
	bcs	.L8
	pop	{r4, r5, r6, pc}
.L8:
	ldr	r3, [r5, #4]
	mov	r0, r6
	blx	r3
	b	.L7
.L10:
	.align	2
.L9:
	.word	arm_delay_ops
	.word	214748000
	.fnend
	.size	rkos_mdelay, .-rkos_mdelay
	.align	1
	.global	rkos_timer_destory
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_timer_destory, %function
rkos_timer_destory:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, lr}
	.save {r3, r4, r5, lr}
	mov	r4, r0
	ldr	r5, [r0]
	mov	r0, r5
	bl	del_timer
	mov	r0, r5
	bl	kfree
	movs	r0, #0
	str	r0, [r4]
	pop	{r3, r4, r5, pc}
	.fnend
	.size	rkos_timer_destory, .-rkos_timer_destory
	.align	1
	.global	rkos_msleep
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_msleep, %function
rkos_msleep:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	msleep_interruptible
	.fnend
	.size	rkos_msleep, .-rkos_msleep
	.align	1
	.global	rkos_get_tickcount
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_get_tickcount, %function
rkos_get_tickcount:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L14
	ldr	r0, [r3]
	b	jiffies_to_msecs
.L15:
	.align	2
.L14:
	.word	jiffies
	.fnend
	.size	rkos_get_tickcount, .-rkos_get_tickcount
	.align	1
	.global	rkos_timer_init
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_timer_init, %function
rkos_timer_init:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	.save {r4, r5, r6, lr}
	.pad #8
	mov	r5, r0
	cbnz	r0, .L17
	ldr	r1, .L21
	ldr	r0, .L21+4
.L20:
	bl	rkos_printk
	mov	r0, #-1
.L16:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, pc}
.L17:
	ldr	r3, .L21+8
	mov	r1, #3264
	ldr	r0, [r3, #20]
	bl	kmem_cache_alloc
	mov	r6, r0
	cbnz	r0, .L19
	ldr	r1, .L21
	ldr	r0, .L21+12
	b	.L20
.L19:
	movs	r4, #0
	str	r4, [sp]
	mov	r3, r4
	mov	r2, r4
	mov	r1, r4
	bl	init_timer_key
	str	r6, [r5]
	mov	r0, r4
	b	.L16
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.word	.LC0
	.word	kmalloc_caches
	.word	.LC1
	.fnend
	.size	rkos_timer_init, .-rkos_timer_init
	.align	1
	.global	rkos_set_timer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_set_timer, %function
rkos_set_timer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	.save {r4, lr}
	cbz	r0, .L24
	ldr	r4, [r0]
	cbz	r4, .L24
	ldr	r3, [r0, #4]
	cbz	r3, .L24
	cbz	r1, .L24
	ldr	r3, [r0, #8]
	mov	r0, r1
	str	r3, [r4, #8]
	bl	__msecs_to_jiffies
	ldr	r3, .L37
	ldr	r1, [r3]
	add	r1, r1, r0
	mov	r0, r4
	pop	{r4, lr}
	b	mod_timer
.L24:
	ldr	r1, .L37+4
	ldr	r0, .L37+8
	bl	rkos_printk
	mov	r0, #-1
	pop	{r4, pc}
.L38:
	.align	2
.L37:
	.word	jiffies
	.word	.LANCHOR0+16
	.word	.LC0
	.fnend
	.size	rkos_set_timer, .-rkos_set_timer
	.align	1
	.global	rkos_del_timer
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_del_timer, %function
rkos_del_timer:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	.save {r3, lr}
	mov	r3, r0
	cbz	r0, .L40
	ldr	r0, [r0]
	cbz	r0, .L40
	ldr	r3, [r3, #4]
	cbz	r3, .L40
	pop	{r3, lr}
	b	del_timer
.L40:
	ldr	r1, .L50
	ldr	r0, .L50+4
	bl	rkos_printk
	mov	r0, #-1
	pop	{r3, pc}
.L51:
	.align	2
.L50:
	.word	.LANCHOR0+31
	.word	.LC0
	.fnend
	.size	rkos_del_timer, .-rkos_del_timer
	.align	1
	.global	rkos_udelay
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_udelay, %function
rkos_udelay:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53
	ldr	r3, [r3, #8]
	bx	r3	@ indirect register sibling call
.L54:
	.align	2
.L53:
	.word	arm_delay_ops
	.fnend
	.size	rkos_udelay, .-rkos_udelay
	.align	1
	.global	rkos_gettime
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_gettime, %function
rkos_gettime:
	.fnstart
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r3, r4, lr}
	.save {r4, lr}
	.pad #16
	mov	r4, r0
	cbnz	r0, .L56
	ldr	r1, .L58
	ldr	r0, .L58+4
	bl	rkos_printk
.L55:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, pc}
.L56:
	mov	r0, sp
	bl	ktime_get_ts64
	ldr	r0, .L58+8
	ldr	r3, [sp]
	str	r3, [r4]
	ldr	r3, [sp, #8]
	smull	r0, r1, r3, r0
	asrs	r3, r3, #31
	rsb	r3, r3, r1, asr #6
	str	r3, [r4, #4]
	b	.L55
.L59:
	.align	2
.L58:
	.word	.LANCHOR0+46
	.word	.LC0
	.word	274877907
	.fnend
	.size	rkos_gettime, .-rkos_gettime
	.align	1
	.global	rkos_time_sub
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	rkos_time_sub, %function
rkos_time_sub:
	.fnstart
	@ args = 12, pretend = 8, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	.pad #8
	sub	sp, sp, #8
	push	{r0, r1, r4, lr}
	.save {r4, lr}
	.pad #8
	add	ip, sp, #8
	str	r3, [sp, #20]
	stmdb	ip, {r1, r2}
	ldr	r1, [sp, #24]
	ldr	r2, [sp, #4]
	subs	r2, r2, r1
	ldr	r1, [sp]
	subs	r3, r1, r3
	strd	r3, r2, [r0]
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	add	sp, sp, #8
	bx	lr
	.fnend
	.size	rkos_time_sub, .-rkos_time_sub
	.section	.rodata
	.set	.LANCHOR0,. + 0
	.type	__FUNCTION__.29730, %object
	.size	__FUNCTION__.29730, 16
__FUNCTION__.29730:
	.ascii	"rkos_timer_init\000"
	.type	__FUNCTION__.29741, %object
	.size	__FUNCTION__.29741, 15
__FUNCTION__.29741:
	.ascii	"rkos_set_timer\000"
	.type	__FUNCTION__.29752, %object
	.size	__FUNCTION__.29752, 15
__FUNCTION__.29752:
	.ascii	"rkos_del_timer\000"
	.type	__FUNCTION__.29811, %object
	.size	__FUNCTION__.29811, 13
__FUNCTION__.29811:
	.ascii	"rkos_gettime\000"
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"%s - parameter invalid!\012\000"
.LC1:
	.ascii	"%s - kmalloc error!\012\000"
	.section	___ksymtab+rkos_del_timer,"a"
	.align	2
	.type	__ksymtab_rkos_del_timer, %object
	.size	__ksymtab_rkos_del_timer, 12
__ksymtab_rkos_del_timer:
	.word	rkos_del_timer
	.word	__kstrtab_rkos_del_timer
	.word	__kstrtabns_rkos_del_timer
	.section	___ksymtab+rkos_get_tickcount,"a"
	.align	2
	.type	__ksymtab_rkos_get_tickcount, %object
	.size	__ksymtab_rkos_get_tickcount, 12
__ksymtab_rkos_get_tickcount:
	.word	rkos_get_tickcount
	.word	__kstrtab_rkos_get_tickcount
	.word	__kstrtabns_rkos_get_tickcount
	.section	___ksymtab+rkos_getjiffies,"a"
	.align	2
	.type	__ksymtab_rkos_getjiffies, %object
	.size	__ksymtab_rkos_getjiffies, 12
__ksymtab_rkos_getjiffies:
	.word	rkos_getjiffies
	.word	__kstrtab_rkos_getjiffies
	.word	__kstrtabns_rkos_getjiffies
	.section	___ksymtab+rkos_gettime,"a"
	.align	2
	.type	__ksymtab_rkos_gettime, %object
	.size	__ksymtab_rkos_gettime, 12
__ksymtab_rkos_gettime:
	.word	rkos_gettime
	.word	__kstrtab_rkos_gettime
	.word	__kstrtabns_rkos_gettime
	.section	___ksymtab+rkos_mdelay,"a"
	.align	2
	.type	__ksymtab_rkos_mdelay, %object
	.size	__ksymtab_rkos_mdelay, 12
__ksymtab_rkos_mdelay:
	.word	rkos_mdelay
	.word	__kstrtab_rkos_mdelay
	.word	__kstrtabns_rkos_mdelay
	.section	___ksymtab+rkos_msleep,"a"
	.align	2
	.type	__ksymtab_rkos_msleep, %object
	.size	__ksymtab_rkos_msleep, 12
__ksymtab_rkos_msleep:
	.word	rkos_msleep
	.word	__kstrtab_rkos_msleep
	.word	__kstrtabns_rkos_msleep
	.section	___ksymtab+rkos_sched_clock,"a"
	.align	2
	.type	__ksymtab_rkos_sched_clock, %object
	.size	__ksymtab_rkos_sched_clock, 12
__ksymtab_rkos_sched_clock:
	.word	rkos_sched_clock
	.word	__kstrtab_rkos_sched_clock
	.word	__kstrtabns_rkos_sched_clock
	.section	___ksymtab+rkos_set_timer,"a"
	.align	2
	.type	__ksymtab_rkos_set_timer, %object
	.size	__ksymtab_rkos_set_timer, 12
__ksymtab_rkos_set_timer:
	.word	rkos_set_timer
	.word	__kstrtab_rkos_set_timer
	.word	__kstrtabns_rkos_set_timer
	.section	___ksymtab+rkos_time_after,"a"
	.align	2
	.type	__ksymtab_rkos_time_after, %object
	.size	__ksymtab_rkos_time_after, 12
__ksymtab_rkos_time_after:
	.word	rkos_time_after
	.word	__kstrtab_rkos_time_after
	.word	__kstrtabns_rkos_time_after
	.section	___ksymtab+rkos_timer_destory,"a"
	.align	2
	.type	__ksymtab_rkos_timer_destory, %object
	.size	__ksymtab_rkos_timer_destory, 12
__ksymtab_rkos_timer_destory:
	.word	rkos_timer_destory
	.word	__kstrtab_rkos_timer_destory
	.word	__kstrtabns_rkos_timer_destory
	.section	___ksymtab+rkos_timer_init,"a"
	.align	2
	.type	__ksymtab_rkos_timer_init, %object
	.size	__ksymtab_rkos_timer_init, 12
__ksymtab_rkos_timer_init:
	.word	rkos_timer_init
	.word	__kstrtab_rkos_timer_init
	.word	__kstrtabns_rkos_timer_init
	.section	___ksymtab+rkos_udelay,"a"
	.align	2
	.type	__ksymtab_rkos_udelay, %object
	.size	__ksymtab_rkos_udelay, 12
__ksymtab_rkos_udelay:
	.word	rkos_udelay
	.word	__kstrtab_rkos_udelay
	.word	__kstrtabns_rkos_udelay
	.ident	"GCC: (crosstool-NG 1.24.0 - v1.0.50) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
