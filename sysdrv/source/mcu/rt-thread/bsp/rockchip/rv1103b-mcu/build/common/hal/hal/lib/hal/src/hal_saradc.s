	.file	"hal_saradc.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.HAL_SARADC_Start,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_Start
	.type	HAL_SARADC_Start, @function
HAL_SARADC_Start:
.LFB18:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_saradc.c"
	.loc 1 83 1
	.cfi_startproc
.LVL0:
	.loc 1 84 5
	.loc 1 86 5
	.loc 1 89 5
	.loc 1 92 5
	.loc 1 92 20 is_stmt 0
	li	a5,12
	sw	a5,12(a0)
	.loc 1 93 5 is_stmt 1
	.loc 1 93 19 is_stmt 0
	li	a5,32
	sw	a5,4(a0)
	.loc 1 95 5 is_stmt 1
	.loc 1 95 49 is_stmt 0
	li	a5,65536
	addi	a5,a5,1
	sw	a5,260(a0)
	.loc 1 97 5 is_stmt 1
.LVL1:
	.loc 1 98 5
	.loc 1 98 318 is_stmt 0
	li	a5,4128768
	addi	a5,a5,48
	or	a2,a2,a5
.LVL2:
	.loc 1 98 47
	sw	a2,0(a0)
	.loc 1 116 5 is_stmt 1
	.loc 1 117 1 is_stmt 0
	li	a0,0
.LVL3:
	ret
	.cfi_endproc
.LFE18:
	.size	HAL_SARADC_Start, .-HAL_SARADC_Start
	.section	.text.HAL_SARADC_Stop,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_Stop
	.type	HAL_SARADC_Stop, @function
HAL_SARADC_Stop:
.LFB19:
	.loc 1 125 1 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 126 5
	.loc 1 133 5
	.loc 1 134 1 is_stmt 0
	li	a0,0
.LVL5:
	ret
	.cfi_endproc
.LFE19:
	.size	HAL_SARADC_Stop, .-HAL_SARADC_Stop
	.section	.text.HAL_SARADC_ClearIrq,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_ClearIrq
	.type	HAL_SARADC_ClearIrq, @function
HAL_SARADC_ClearIrq:
.LFB28:
	.cfi_startproc
	li	a5,1
	sw	a5,272(a0)
	ret
	.cfi_endproc
.LFE28:
	.size	HAL_SARADC_ClearIrq, .-HAL_SARADC_ClearIrq
	.section	.text.HAL_SARADC_SetHighThreshold,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_SetHighThreshold
	.type	HAL_SARADC_SetHighThreshold, @function
HAL_SARADC_SetHighThreshold:
.LFB21:
	.loc 1 159 1 is_stmt 1
	.cfi_startproc
.LVL6:
	.loc 1 160 5
	.loc 1 163 5
	.loc 1 165 5
	.loc 1 165 25 is_stmt 0
	addi	a1,a1,4
.LVL7:
	slli	a1,a1,2
.LVL8:
	add	a1,a0,a1
	sw	a2,4(a1)
	.loc 1 167 1
	ret
	.cfi_endproc
.LFE21:
	.size	HAL_SARADC_SetHighThreshold, .-HAL_SARADC_SetHighThreshold
	.section	.text.HAL_SARADC_EnableHighThresholdIrq,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_EnableHighThresholdIrq
	.type	HAL_SARADC_EnableHighThresholdIrq, @function
HAL_SARADC_EnableHighThresholdIrq:
.LFB22:
	.loc 1 175 1 is_stmt 1
	.cfi_startproc
.LVL9:
	.loc 1 176 5
	.loc 1 179 5
	.loc 1 181 5
	.loc 1 181 55 is_stmt 0
	li	a5,1
	sll	a1,a5,a1
.LVL10:
	.loc 1 181 154
	slli	a5,a1,16
	.loc 1 181 183
	or	a1,a5,a1
	.loc 1 181 48
	sw	a1,152(a0)
	.loc 1 183 1
	ret
	.cfi_endproc
.LFE22:
	.size	HAL_SARADC_EnableHighThresholdIrq, .-HAL_SARADC_EnableHighThresholdIrq
	.section	.text.HAL_SARADC_ClearHighThresholdIrq,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_ClearHighThresholdIrq
	.type	HAL_SARADC_ClearHighThresholdIrq, @function
HAL_SARADC_ClearHighThresholdIrq:
.LFB23:
	.loc 1 191 1 is_stmt 1
	.cfi_startproc
.LVL11:
	.loc 1 192 5
	.loc 1 195 5
	.loc 1 197 5
	.loc 1 197 27 is_stmt 0
	li	a5,1
	sll	a5,a5,a1
	.loc 1 197 20
	sw	a5,276(a0)
	.loc 1 199 1
	ret
	.cfi_endproc
.LFE23:
	.size	HAL_SARADC_ClearHighThresholdIrq, .-HAL_SARADC_ClearHighThresholdIrq
	.section	.text.HAL_SARADC_GetRaw,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_GetRaw
	.type	HAL_SARADC_GetRaw, @function
HAL_SARADC_GetRaw:
.LFB24:
	.loc 1 208 1 is_stmt 1
	.cfi_startproc
.LVL12:
	.loc 1 209 5
	.loc 1 212 5
	.loc 1 214 5
	.loc 1 216 21 is_stmt 0
	addi	a1,a1,72
.LVL13:
	.loc 1 214 21
	li	a5,1
	.loc 1 216 21
	slli	a1,a1,2
.LVL14:
	.loc 1 214 21
	sw	a5,272(a0)
	.loc 1 216 5 is_stmt 1
	.loc 1 216 21 is_stmt 0
	add	a0,a0,a1
.LVL15:
	lw	a0,0(a0)
	.loc 1 221 1
	ret
	.cfi_endproc
.LFE24:
	.size	HAL_SARADC_GetRaw, .-HAL_SARADC_GetRaw
	.section	.text.HAL_SARADC_PollIsEOC,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_PollIsEOC
	.type	HAL_SARADC_PollIsEOC, @function
HAL_SARADC_PollIsEOC:
.LFB25:
	.loc 1 230 1 is_stmt 1
	.cfi_startproc
.LVL16:
	.loc 1 231 5
	.loc 1 234 5
	.loc 1 236 5
	.loc 1 236 15 is_stmt 0
	lw	a0,276(a0)
.LVL17:
	.loc 1 236 44
	srl	a0,a0,a1
	.loc 1 241 1
	andi	a0,a0,1
	ret
	.cfi_endproc
.LFE25:
	.size	HAL_SARADC_PollIsEOC, .-HAL_SARADC_PollIsEOC
	.section	.text.HAL_SARADC_IrqHandler,"ax",@progbits
	.align	1
	.globl	HAL_SARADC_IrqHandler
	.type	HAL_SARADC_IrqHandler, @function
HAL_SARADC_IrqHandler:
.LFB26:
	.loc 1 248 1 is_stmt 1
	.cfi_startproc
.LVL18:
	.loc 1 249 5
	.loc 1 253 5
	.loc 1 253 21 is_stmt 0
	li	a5,1
	sw	a5,272(a0)
	.loc 1 257 1
	ret
	.cfi_endproc
.LFE26:
	.size	HAL_SARADC_IrqHandler, .-HAL_SARADC_IrqHandler
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_def.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_saradc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x48e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF57
	.byte	0xc
	.4byte	.LASF58
	.4byte	.LASF59
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4f
	.byte	0x1b
	.4byte	0x54
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.byte	0x4
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
	.byte	0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x48
	.byte	0x5
	.4byte	0x7e
	.byte	0x6
	.4byte	0x8a
	.byte	0x7
	.4byte	0x8a
	.4byte	0xa4
	.byte	0x8
	.4byte	0x70
	.byte	0xf
	.byte	0
	.byte	0x5
	.4byte	0x94
	.byte	0x7
	.4byte	0x7e
	.4byte	0xb9
	.byte	0x8
	.4byte	0x70
	.byte	0x17
	.byte	0
	.byte	0x9
	.4byte	.LASF60
	.2byte	0x164
	.byte	0x4
	.2byte	0x344
	.byte	0x8
	.4byte	0x1f9
	.byte	0xa
	.4byte	.LASF12
	.byte	0x4
	.2byte	0x345
	.byte	0x17
	.4byte	0x8a
	.byte	0
	.byte	0xa
	.4byte	.LASF13
	.byte	0x4
	.2byte	0x346
	.byte	0x17
	.4byte	0x8a
	.byte	0x4
	.byte	0xa
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x347
	.byte	0x17
	.4byte	0x8a
	.byte	0x8
	.byte	0xa
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x348
	.byte	0x17
	.4byte	0x8a
	.byte	0xc
	.byte	0xa
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x349
	.byte	0x17
	.4byte	0x8a
	.byte	0x10
	.byte	0xa
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x34a
	.byte	0x17
	.4byte	0xa4
	.byte	0x14
	.byte	0xa
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x34b
	.byte	0x17
	.4byte	0xa4
	.byte	0x54
	.byte	0xa
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x34c
	.byte	0x17
	.4byte	0x8a
	.byte	0x94
	.byte	0xa
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x34d
	.byte	0x17
	.4byte	0x8a
	.byte	0x98
	.byte	0xa
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x34e
	.byte	0x17
	.4byte	0x8a
	.byte	0x9c
	.byte	0xa
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x34f
	.byte	0x13
	.4byte	0xa9
	.byte	0xa0
	.byte	0xb
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x350
	.byte	0x17
	.4byte	0x8a
	.2byte	0x100
	.byte	0xb
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x351
	.byte	0x17
	.4byte	0x8a
	.2byte	0x104
	.byte	0xb
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x352
	.byte	0x17
	.4byte	0x8a
	.2byte	0x108
	.byte	0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x353
	.byte	0x1d
	.4byte	0x8f
	.2byte	0x10c
	.byte	0xb
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x354
	.byte	0x17
	.4byte	0x8a
	.2byte	0x110
	.byte	0xb
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x355
	.byte	0x17
	.4byte	0x8a
	.2byte	0x114
	.byte	0xb
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x356
	.byte	0x17
	.4byte	0x8a
	.2byte	0x118
	.byte	0xb
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x357
	.byte	0x17
	.4byte	0x8a
	.2byte	0x11c
	.byte	0xb
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x358
	.byte	0x1d
	.4byte	0x20e
	.2byte	0x120
	.byte	0xb
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x359
	.byte	0x17
	.4byte	0x8a
	.2byte	0x160
	.byte	0
	.byte	0x7
	.4byte	0x8f
	.4byte	0x209
	.byte	0x8
	.4byte	0x70
	.byte	0xf
	.byte	0
	.byte	0x6
	.4byte	0x1f9
	.byte	0x5
	.4byte	0x209
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x5
	.byte	0xa8
	.byte	0xe
	.4byte	0x22e
	.byte	0xd
	.4byte	.LASF33
	.byte	0
	.byte	0xd
	.4byte	.LASF34
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF35
	.byte	0x5
	.byte	0xab
	.byte	0x3
	.4byte	0x213
	.byte	0xc
	.byte	0x5
	.byte	0x4
	.4byte	0x69
	.byte	0x5
	.byte	0xae
	.byte	0xe
	.4byte	0x274
	.byte	0xd
	.4byte	.LASF36
	.byte	0
	.byte	0xe
	.4byte	.LASF37
	.byte	0x7f
	.byte	0xe
	.4byte	.LASF38
	.byte	0x70
	.byte	0xe
	.4byte	.LASF39
	.byte	0x6d
	.byte	0xe
	.4byte	.LASF40
	.byte	0x6a
	.byte	0xe
	.4byte	.LASF41
	.byte	0x5a
	.byte	0xe
	.4byte	.LASF42
	.byte	0x92,0x7f
	.byte	0
	.byte	0x3
	.4byte	.LASF43
	.byte	0x5
	.byte	0xb6
	.byte	0x3
	.4byte	0x23a
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF44
	.byte	0xc
	.byte	0x7
	.byte	0x4
	.4byte	0x70
	.byte	0x6
	.byte	0x1d
	.byte	0xe
	.4byte	0x2a2
	.byte	0xd
	.4byte	.LASF45
	.byte	0
	.byte	0xd
	.4byte	.LASF46
	.byte	0x1
	.byte	0
	.byte	0x3
	.4byte	.LASF47
	.byte	0x6
	.byte	0x20
	.byte	0x3
	.4byte	0x287
	.byte	0xf
	.4byte	.LASF50
	.byte	0x1
	.byte	0xf7
	.byte	0x6
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.byte	0x1
	.byte	0x9c
	.4byte	0x2d3
	.byte	0x10
	.string	"reg"
	.byte	0x1
	.byte	0xf7
	.byte	0x2f
	.4byte	0x2d3
	.byte	0x1
	.byte	0x5a
	.byte	0
	.byte	0x11
	.byte	0x4
	.4byte	0xb9
	.byte	0x12
	.4byte	.LASF48
	.byte	0x1
	.byte	0xe5
	.byte	0xb
	.4byte	0x22e
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.byte	0x1
	.byte	0x9c
	.4byte	0x312
	.byte	0x13
	.string	"reg"
	.byte	0x1
	.byte	0xe5
	.byte	0x33
	.4byte	0x2d3
	.4byte	.LLST8
	.byte	0x10
	.string	"chn"
	.byte	0x1
	.byte	0xe5
	.byte	0x41
	.4byte	0x7e
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0x12
	.4byte	.LASF49
	.byte	0x1
	.byte	0xcf
	.byte	0xa
	.4byte	0x7e
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.byte	0x1
	.byte	0x9c
	.4byte	0x34d
	.byte	0x13
	.string	"reg"
	.byte	0x1
	.byte	0xcf
	.byte	0x2f
	.4byte	0x2d3
	.4byte	.LLST6
	.byte	0x13
	.string	"chn"
	.byte	0x1
	.byte	0xcf
	.byte	0x3d
	.4byte	0x7e
	.4byte	.LLST7
	.byte	0
	.byte	0xf
	.4byte	.LASF51
	.byte	0x1
	.byte	0xbe
	.byte	0x6
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.byte	0x1
	.byte	0x9c
	.4byte	0x380
	.byte	0x10
	.string	"reg"
	.byte	0x1
	.byte	0xbe
	.byte	0x3a
	.4byte	0x2d3
	.byte	0x1
	.byte	0x5a
	.byte	0x10
	.string	"chn"
	.byte	0x1
	.byte	0xbe
	.byte	0x48
	.4byte	0x7e
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0xf
	.4byte	.LASF52
	.byte	0x1
	.byte	0xae
	.byte	0x6
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.4byte	0x3b5
	.byte	0x10
	.string	"reg"
	.byte	0x1
	.byte	0xae
	.byte	0x3b
	.4byte	0x2d3
	.byte	0x1
	.byte	0x5a
	.byte	0x13
	.string	"chn"
	.byte	0x1
	.byte	0xae
	.byte	0x49
	.4byte	0x7e
	.4byte	.LLST5
	.byte	0
	.byte	0xf
	.4byte	.LASF53
	.byte	0x1
	.byte	0x9e
	.byte	0x6
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.4byte	0x3f8
	.byte	0x10
	.string	"reg"
	.byte	0x1
	.byte	0x9e
	.byte	0x35
	.4byte	0x2d3
	.byte	0x1
	.byte	0x5a
	.byte	0x13
	.string	"chn"
	.byte	0x1
	.byte	0x9e
	.byte	0x43
	.4byte	0x7e
	.4byte	.LLST4
	.byte	0x10
	.string	"val"
	.byte	0x1
	.byte	0x9e
	.byte	0x51
	.4byte	0x7e
	.byte	0x1
	.byte	0x5c
	.byte	0
	.byte	0x14
	.4byte	.LASF61
	.byte	0x1
	.byte	0x8c
	.byte	0x6
	.4byte	0x411
	.byte	0x15
	.string	"reg"
	.byte	0x1
	.byte	0x8c
	.byte	0x2d
	.4byte	0x2d3
	.byte	0
	.byte	0x12
	.4byte	.LASF54
	.byte	0x1
	.byte	0x7c
	.byte	0xc
	.4byte	0x274
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.byte	0x1
	.byte	0x9c
	.4byte	0x43c
	.byte	0x13
	.string	"reg"
	.byte	0x1
	.byte	0x7c
	.byte	0x2f
	.4byte	0x2d3
	.4byte	.LLST3
	.byte	0
	.byte	0x16
	.4byte	.LASF55
	.byte	0x1
	.byte	0x52
	.byte	0xc
	.4byte	0x274
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x1
	.byte	0x9c
	.byte	0x13
	.string	"reg"
	.byte	0x1
	.byte	0x52
	.byte	0x30
	.4byte	0x2d3
	.4byte	.LLST0
	.byte	0x17
	.4byte	.LASF56
	.byte	0x1
	.byte	0x52
	.byte	0x42
	.4byte	0x2a2
	.byte	0x1
	.byte	0x5b
	.byte	0x13
	.string	"chn"
	.byte	0x1
	.byte	0x52
	.byte	0x51
	.4byte	0x7e
	.4byte	.LLST1
	.byte	0x18
	.4byte	.LASF62
	.byte	0x1
	.byte	0x54
	.byte	0xe
	.4byte	0x7e
	.4byte	.LLST2
	.byte	0
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
	.byte	0x16
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
	.byte	0x4
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
	.byte	0x5
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xd
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
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
	.byte	0x49
	.byte	0x13
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
	.byte	0x13
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x18
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
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST8:
	.4byte	.LVL16
	.4byte	.LVL17
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL17
	.4byte	.LFE25
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12
	.4byte	.LVL15
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL15
	.4byte	.LFE24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x4
	.byte	0x7b
	.byte	0xb8,0x7f
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL10
	.4byte	.LFE22
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL7
	.4byte	.LVL8
	.2byte	0x3
	.byte	0x7b
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL8
	.4byte	.LFE21
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL5
	.4byte	.LFE19
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL3
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL3
	.4byte	.LFE18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL2
	.4byte	.LFE18
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x6
	.byte	0x7c
	.byte	0
	.byte	0x8
	.byte	0x30
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL2
	.4byte	.LFE18
	.2byte	0x7
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x8
	.byte	0x30
	.byte	0x21
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x54
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB18
	.4byte	.LFE18
	.4byte	.LFB19
	.4byte	.LFE19
	.4byte	.LFB21
	.4byte	.LFE21
	.4byte	.LFB22
	.4byte	.LFE22
	.4byte	.LFB23
	.4byte	.LFE23
	.4byte	.LFB24
	.4byte	.LFE24
	.4byte	.LFB25
	.4byte	.LFE25
	.4byte	.LFB26
	.4byte	.LFE26
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF37:
	.string	"HAL_ERROR"
.LASF42:
	.string	"HAL_TIMEOUT"
.LASF48:
	.string	"HAL_SARADC_PollIsEOC"
.LASF43:
	.string	"HAL_Status"
.LASF2:
	.string	"short int"
.LASF22:
	.string	"RESERVED00A0"
.LASF40:
	.string	"HAL_INVAL"
.LASF6:
	.string	"long long int"
.LASF10:
	.string	"__uint32_t"
.LASF56:
	.string	"mode"
.LASF62:
	.string	"value"
.LASF36:
	.string	"HAL_OK"
.LASF53:
	.string	"HAL_SARADC_SetHighThreshold"
.LASF17:
	.string	"HIGH_COMP"
.LASF28:
	.string	"HT_INT_ST"
.LASF35:
	.string	"HAL_Check"
.LASF38:
	.string	"HAL_BUSY"
.LASF27:
	.string	"END_INT_ST"
.LASF57:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF0:
	.string	"signed char"
.LASF45:
	.string	"SARADC_INT_MOD"
.LASF20:
	.string	"HT_INT_EN"
.LASF39:
	.string	"HAL_NODEV"
.LASF26:
	.string	"STATUS"
.LASF4:
	.string	"long int"
.LASF16:
	.string	"T_SEL_SOC"
.LASF29:
	.string	"LT_INT_ST"
.LASF61:
	.string	"HAL_SARADC_ClearIrq"
.LASF30:
	.string	"MT_INT_ST"
.LASF58:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/src/hal_saradc.c"
.LASF31:
	.string	"DATA"
.LASF46:
	.string	"SARADC_POL_MOD"
.LASF25:
	.string	"ST_CON"
.LASF18:
	.string	"LOW_COMP"
.LASF1:
	.string	"unsigned char"
.LASF54:
	.string	"HAL_SARADC_Stop"
.LASF50:
	.string	"HAL_SARADC_IrqHandler"
.LASF59:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF24:
	.string	"END_INT_EN"
.LASF7:
	.string	"long long unsigned int"
.LASF11:
	.string	"uint32_t"
.LASF14:
	.string	"T_AS_SOC"
.LASF8:
	.string	"unsigned int"
.LASF15:
	.string	"T_DAS_SOC"
.LASF3:
	.string	"short unsigned int"
.LASF21:
	.string	"LT_INT_EN"
.LASF49:
	.string	"HAL_SARADC_GetRaw"
.LASF9:
	.string	"char"
.LASF23:
	.string	"MT_INT_EN"
.LASF33:
	.string	"HAL_FALSE"
.LASF55:
	.string	"HAL_SARADC_Start"
.LASF44:
	.string	"_Bool"
.LASF60:
	.string	"SARADC_REG"
.LASF34:
	.string	"HAL_TRUE"
.LASF13:
	.string	"T_PD_SOC"
.LASF5:
	.string	"long unsigned int"
.LASF52:
	.string	"HAL_SARADC_EnableHighThresholdIrq"
.LASF47:
	.string	"eSARADC_mode"
.LASF32:
	.string	"AUTO_CH_EN"
.LASF19:
	.string	"DEBOUNCE"
.LASF51:
	.string	"HAL_SARADC_ClearHighThresholdIrq"
.LASF41:
	.string	"HAL_NOSYS"
.LASF12:
	.string	"CONV_CON"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
