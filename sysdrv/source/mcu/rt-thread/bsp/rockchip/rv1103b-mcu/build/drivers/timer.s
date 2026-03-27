	.file	"timer.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.sysTick_stop,"ax",@progbits
	.align	1
	.globl	sysTick_stop
	.type	sysTick_stop, @function
sysTick_stop:
.LFB31:
	.file 1 "drivers/timer.c"
	.loc 1 115 1
	.cfi_startproc
	.loc 1 116 5
.LBB21:
.LBB22:
	.loc 1 108 5
	.loc 1 109 5
	.loc 1 109 10 is_stmt 0
	li	a4,-14811136
	lw	a5,0(a4)
.LVL0:
	.loc 1 110 5 is_stmt 1
	.loc 1 110 10 is_stmt 0
	andi	a5,a5,-2
.LVL1:
	.loc 1 111 5 is_stmt 1
	.loc 1 111 53 is_stmt 0
	sw	a5,0(a4)
.LVL2:
.LBE22:
.LBE21:
	.loc 1 117 1
	ret
	.cfi_endproc
.LFE31:
	.size	sysTick_stop, .-sysTick_stop
	.section	.text._update_timer,"ax",@progbits
	.align	1
	.globl	_update_timer
	.type	_update_timer, @function
_update_timer:
.LFB32:
	.loc 1 120 1 is_stmt 1
	.cfi_startproc
	.loc 1 121 5
.LBB23:
	.loc 1 121 8
	.loc 1 121 29
	li	a5,128
 #APP
# 121 "drivers/timer.c" 1
	csrrc a5, mie, a5
# 0 "" 2
.LVL3:
	.loc 1 121 102
 #NO_APP
.LBE23:
	.loc 1 122 5
.LBB24:
.LBB25:
	.loc 1 50 5
	.loc 1 50 53 is_stmt 0
	li	a5,-14811136
	li	a4,-1
	sw	a4,16(a5)
.LVL4:
.LBE25:
.LBE24:
	.loc 1 123 5 is_stmt 1
.LBB26:
.LBB27:
	.loc 1 55 5
	.loc 1 55 53 is_stmt 0
	sw	zero,20(a5)
.LVL5:
.LBE27:
.LBE26:
	.loc 1 124 5 is_stmt 1
	.loc 1 124 24 is_stmt 0
	lla	a4,.LANCHOR0
	lw	a3,0(a4)
	lw	a2,8(a4)
	add	a3,a3,a2
	sw	a3,0(a4)
	.loc 1 125 5 is_stmt 1
.LVL6:
.LBB28:
.LBB29:
	.loc 1 50 5
	.loc 1 50 53 is_stmt 0
	sw	a3,16(a5)
.LVL7:
.LBE29:
.LBE28:
	.loc 1 126 5 is_stmt 1
.LBB30:
.LBB31:
	.loc 1 85 5
	.loc 1 85 12 is_stmt 0
	lw	a3,12(a5)
.LBE31:
.LBE30:
	.loc 1 126 35
	lw	a4,4(a4)
	.loc 1 126 8
	bgeu	a4,a3,.L3
	.loc 1 128 9 is_stmt 1
	.loc 1 129 9
.LVL8:
.LBB32:
.LBB33:
	.loc 1 55 5
	.loc 1 55 53 is_stmt 0
	sw	a4,20(a5)
.LVL9:
.L3:
.LBE33:
.LBE32:
	.loc 1 132 5 is_stmt 1
.LBB34:
	.loc 1 132 8
	.loc 1 132 29
	li	a5,128
 #APP
# 132 "drivers/timer.c" 1
	csrrs a5, mie, a5
# 0 "" 2
.LVL10:
	.loc 1 132 102
 #NO_APP
.LBE34:
	.loc 1 133 1 is_stmt 0
	ret
	.cfi_endproc
.LFE32:
	.size	_update_timer, .-_update_timer
	.section	.text.sysTick_config,"ax",@progbits
	.align	1
	.globl	sysTick_config
	.type	sysTick_config, @function
sysTick_config:
.LFB33:
	.loc 1 136 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 137 5
.LBB48:
.LBB49:
	.loc 1 108 5
	.loc 1 109 5
	.loc 1 109 10 is_stmt 0
	li	a5,-14811136
	lw	a4,0(a5)
.LVL12:
	.loc 1 110 5 is_stmt 1
	.loc 1 110 10 is_stmt 0
	andi	a4,a4,-2
.LVL13:
	.loc 1 111 5 is_stmt 1
	.loc 1 111 53 is_stmt 0
	sw	a4,0(a5)
.LVL14:
.LBE49:
.LBE48:
	.loc 1 138 5 is_stmt 1
.LBB50:
.LBB51:
	.loc 1 28 5
.LBE51:
.LBE50:
.LBB53:
.LBB54:
	.loc 1 45 53 is_stmt 0
	li	a4,1000
.LBE54:
.LBE53:
	.loc 1 141 5
	divu	a0,a0,a4
.LVL15:
.LBB56:
.LBB52:
	.loc 1 28 53
	sw	zero,8(a5)
	.loc 1 29 5 is_stmt 1
	.loc 1 29 53 is_stmt 0
	sw	zero,12(a5)
.LBE52:
.LBE56:
	.loc 1 139 5 is_stmt 1
.LBB57:
.LBB58:
	.loc 1 34 5
	.loc 1 34 53 is_stmt 0
	sw	zero,16(a5)
	.loc 1 35 5 is_stmt 1
	.loc 1 35 53 is_stmt 0
	sw	zero,20(a5)
.LBE58:
.LBE57:
	.loc 1 140 5 is_stmt 1
.LVL16:
.LBB59:
.LBB55:
	.loc 1 45 5
	.loc 1 45 53 is_stmt 0
	sw	a4,4(a5)
.LVL17:
.LBE55:
.LBE59:
	.loc 1 141 5 is_stmt 1
.LBB60:
.LBB61:
	.loc 1 50 5
.LBE61:
.LBE60:
	.loc 1 142 24 is_stmt 0
	lla	a4,.LANCHOR0
.LBB63:
.LBB62:
	.loc 1 50 53
	sw	a0,16(a5)
.LVL18:
.LBE62:
.LBE63:
	.loc 1 142 5 is_stmt 1
	.loc 1 142 24 is_stmt 0
	sw	a0,0(a4)
	.loc 1 143 5 is_stmt 1
	.loc 1 143 25 is_stmt 0
	sw	zero,4(a4)
	.loc 1 144 5 is_stmt 1
	.loc 1 144 20 is_stmt 0
	sw	a0,8(a4)
	.loc 1 145 5 is_stmt 1
.LBB64:
	.loc 1 145 8
	.loc 1 145 29
	li	a4,128
 #APP
# 145 "drivers/timer.c" 1
	csrrs a4, mie, a4
# 0 "" 2
.LVL19:
	.loc 1 145 102
 #NO_APP
.LBE64:
	.loc 1 146 5
.LBB65:
.LBB66:
	.loc 1 100 5
	.loc 1 101 5
	.loc 1 101 10 is_stmt 0
	lw	a4,0(a5)
.LVL20:
	.loc 1 102 5 is_stmt 1
	.loc 1 102 10 is_stmt 0
	ori	a4,a4,1
.LVL21:
	.loc 1 103 5 is_stmt 1
	.loc 1 103 53 is_stmt 0
	sw	a4,0(a5)
.LVL22:
.LBE66:
.LBE65:
	.loc 1 147 1
	ret
	.cfi_endproc
.LFE33:
	.size	sysTick_config, .-sysTick_config
	.section	.bss.timer_cmp,"aw",@nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timer_cmp, @object
	.size	timer_cmp, 12
timer_cmp:
	.zero	12
	.text
.Letext0:
	.file 2 "drivers/timer.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x326
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF25
	.byte	0xc
	.4byte	.LASF26
	.4byte	.LASF27
	.4byte	.Ldebug_ranges0+0x48
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF1
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF28
	.byte	0xc
	.byte	0x2
	.byte	0x25
	.byte	0x8
	.4byte	0xa7
	.byte	0x5
	.4byte	.LASF10
	.byte	0x2
	.byte	0x27
	.byte	0x12
	.4byte	0x64
	.byte	0
	.byte	0x5
	.4byte	.LASF11
	.byte	0x2
	.byte	0x28
	.byte	0x12
	.4byte	0x64
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.byte	0x2
	.byte	0x29
	.byte	0x12
	.4byte	0x64
	.byte	0x8
	.byte	0
	.byte	0x6
	.4byte	.LASF29
	.byte	0x1
	.byte	0x13
	.byte	0x1b
	.4byte	0x72
	.byte	0x5
	.byte	0x3
	.4byte	timer_cmp
	.byte	0x7
	.4byte	.LASF13
	.byte	0x1
	.byte	0x87
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0x18e
	.byte	0x8
	.4byte	.LASF30
	.byte	0x1
	.byte	0x87
	.byte	0x22
	.4byte	0x64
	.4byte	.LLST5
	.byte	0x9
	.4byte	.LBB64
	.4byte	.LBE64-.LBB64
	.4byte	0xf9
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x91
	.byte	0x16
	.4byte	0x4f
	.byte	0
	.byte	0xb
	.4byte	0x28e
	.4byte	.LBB48
	.4byte	.LBE48-.LBB48
	.byte	0x1
	.byte	0x89
	.byte	0x5
	.4byte	0x117
	.byte	0xc
	.4byte	0x29b
	.4byte	.LLST6
	.byte	0
	.byte	0xd
	.4byte	0x320
	.4byte	.LBB50
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x8a
	.byte	0x5
	.byte	0xe
	.4byte	0x2ff
	.4byte	.LBB53
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x1
	.byte	0x8c
	.byte	0x5
	.4byte	0x145
	.byte	0xf
	.4byte	0x30c
	.4byte	.LLST7
	.byte	0
	.byte	0x10
	.4byte	0x317
	.4byte	.LBB57
	.4byte	.LBE57-.LBB57
	.byte	0x1
	.byte	0x8b
	.byte	0x5
	.byte	0xe
	.4byte	0x2e7
	.4byte	.LBB60
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x8d
	.byte	0x5
	.4byte	0x173
	.byte	0xf
	.4byte	0x2f4
	.4byte	.LLST8
	.byte	0
	.byte	0x11
	.4byte	0x2a8
	.4byte	.LBB65
	.4byte	.LBE65-.LBB65
	.byte	0x1
	.byte	0x92
	.byte	0x5
	.byte	0xc
	.4byte	0x2b5
	.4byte	.LLST9
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x77
	.byte	0x6
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0x25d
	.byte	0x9
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.4byte	0x1be
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x79
	.byte	0x16
	.4byte	0x4f
	.byte	0
	.byte	0x9
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.4byte	0x1d8
	.byte	0xa
	.4byte	.LASF15
	.byte	0x1
	.byte	0x84
	.byte	0x16
	.4byte	0x4f
	.byte	0
	.byte	0xb
	.4byte	0x2e7
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.byte	0x1
	.byte	0x7a
	.byte	0x5
	.4byte	0x1f6
	.byte	0xf
	.4byte	0x2f4
	.4byte	.LLST1
	.byte	0
	.byte	0xb
	.4byte	0x2cf
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.byte	0x7b
	.byte	0x5
	.4byte	0x214
	.byte	0xf
	.4byte	0x2dc
	.4byte	.LLST2
	.byte	0
	.byte	0xb
	.4byte	0x2e7
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x1
	.byte	0x7d
	.byte	0x5
	.4byte	0x232
	.byte	0xf
	.4byte	0x2f4
	.4byte	.LLST3
	.byte	0
	.byte	0x10
	.4byte	0x2c2
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.byte	0x1
	.byte	0x7e
	.byte	0x9
	.byte	0x11
	.4byte	0x2cf
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.byte	0x1
	.byte	0x81
	.byte	0x9
	.byte	0xf
	.4byte	0x2dc
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF16
	.byte	0x1
	.byte	0x72
	.byte	0x6
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x28e
	.byte	0x11
	.4byte	0x28e
	.4byte	.LBB21
	.4byte	.LBE21-.LBB21
	.byte	0x1
	.byte	0x74
	.byte	0x5
	.byte	0xc
	.4byte	0x29b
	.4byte	.LLST0
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	.LASF18
	.byte	0x1
	.byte	0x6a
	.byte	0xd
	.byte	0x1
	.4byte	0x2a8
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x6c
	.byte	0x12
	.4byte	0x64
	.byte	0
	.byte	0x12
	.4byte	.LASF19
	.byte	0x1
	.byte	0x62
	.byte	0xd
	.byte	0x1
	.4byte	0x2c2
	.byte	0xa
	.4byte	.LASF17
	.byte	0x1
	.byte	0x64
	.byte	0x12
	.4byte	0x64
	.byte	0
	.byte	0x13
	.4byte	.LASF31
	.byte	0x1
	.byte	0x53
	.byte	0x15
	.4byte	0x64
	.byte	0x1
	.byte	0x14
	.4byte	.LASF20
	.byte	0x1
	.byte	0x35
	.byte	0xd
	.byte	0x1
	.4byte	0x2e7
	.byte	0x15
	.string	"t"
	.byte	0x1
	.byte	0x35
	.byte	0x2b
	.4byte	0x64
	.byte	0
	.byte	0x14
	.4byte	.LASF21
	.byte	0x1
	.byte	0x30
	.byte	0xd
	.byte	0x1
	.4byte	0x2ff
	.byte	0x15
	.string	"t"
	.byte	0x1
	.byte	0x30
	.byte	0x2a
	.4byte	0x64
	.byte	0
	.byte	0x14
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2b
	.byte	0xd
	.byte	0x1
	.4byte	0x317
	.byte	0x15
	.string	"t"
	.byte	0x1
	.byte	0x2b
	.byte	0x2b
	.4byte	0x64
	.byte	0
	.byte	0x16
	.4byte	.LASF23
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.byte	0x1
	.byte	0x16
	.4byte	.LASF24
	.byte	0x1
	.byte	0x1a
	.byte	0xd
	.byte	0x1
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x1d
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x1d
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x2e
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x20
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST5:
	.4byte	.LVL11
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LFE33
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL14
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x4
	.byte	0xa
	.2byte	0x3e8
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20
	.4byte	.LVL22
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x3
	.byte	0x9
	.byte	0xff
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5d
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL8
	.4byte	.LVL9
	.2byte	0x1
	.byte	0x5e
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB50
	.4byte	.LBE50
	.4byte	.LBB56
	.4byte	.LBE56
	.4byte	0
	.4byte	0
	.4byte	.LBB53
	.4byte	.LBE53
	.4byte	.LBB59
	.4byte	.LBE59
	.4byte	0
	.4byte	0
	.4byte	.LBB60
	.4byte	.LBE60
	.4byte	.LBB63
	.4byte	.LBE63
	.4byte	0
	.4byte	0
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF30:
	.string	"ticks"
.LASF22:
	.string	"_write_mtime_div"
.LASF31:
	.string	"_read_mtimeh"
.LASF12:
	.string	"step"
.LASF5:
	.string	"short unsigned int"
.LASF21:
	.string	"_write_mtimecmp"
.LASF26:
	.string	"drivers/timer.c"
.LASF29:
	.string	"timer_cmp"
.LASF4:
	.string	"unsigned char"
.LASF11:
	.string	"time_cmph"
.LASF25:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF17:
	.string	"temp"
.LASF28:
	.string	"timer_cmp_t"
.LASF18:
	.string	"_stop_timer"
.LASF14:
	.string	"_update_timer"
.LASF16:
	.string	"sysTick_stop"
.LASF6:
	.string	"long unsigned int"
.LASF19:
	.string	"_run_timer"
.LASF8:
	.string	"unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF23:
	.string	"_reset_mtimecmp"
.LASF24:
	.string	"_reset_mtime"
.LASF3:
	.string	"long long int"
.LASF9:
	.string	"char"
.LASF20:
	.string	"_write_mtimecmph"
.LASF1:
	.string	"short int"
.LASF15:
	.string	"__tmp"
.LASF10:
	.string	"time_cmp"
.LASF2:
	.string	"long int"
.LASF0:
	.string	"signed char"
.LASF27:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF13:
	.string	"sysTick_config"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
