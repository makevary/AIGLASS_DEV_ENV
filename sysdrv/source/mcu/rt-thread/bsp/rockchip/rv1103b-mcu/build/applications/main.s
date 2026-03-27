	.file	"main.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rtthread_startup,"ax",@progbits
	.align	1
	.globl	rtthread_startup
	.type	rtthread_startup, @function
rtthread_startup:
.LFB51:
	.file 1 "applications/main.c"
	.loc 1 19 1
	.cfi_startproc
	.loc 1 21 5
	.loc 1 19 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 21 5
	call	rt_hw_interrupt_disable
.LVL0:
	.loc 1 24 5 is_stmt 1
	call	rt_hw_board_init
.LVL1:
	.loc 1 27 5
	call	rt_system_tick_init
.LVL2:
	.loc 1 30 5
	call	rt_system_object_init
.LVL3:
	.loc 1 33 5
	call	rt_system_timer_init
.LVL4:
	.loc 1 36 5
	call	rt_system_scheduler_init
.LVL5:
	.loc 1 39 5
	call	rt_application_init
.LVL6:
	.loc 1 42 5
	call	rt_system_timer_thread_init
.LVL7:
	.loc 1 45 5
	call	rt_thread_idle_init
.LVL8:
	.loc 1 48 5
	.loc 1 52 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 48 5
	tail	rt_system_scheduler_start
.LVL9:
	.cfi_endproc
.LFE51:
	.size	rtthread_startup, .-rtthread_startup
	.section	.rodata.main.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello RV1103B MCU\n"
	.section	.text.startup.main,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
.LFB52:
	.loc 1 55 1 is_stmt 1
	.cfi_startproc
	.loc 1 57 5
	.loc 1 55 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 57 5
	call	rtthread_startup
.LVL10:
	.loc 1 59 5 is_stmt 1
	lla	a0,.LC0
	call	rt_kprintf
.LVL11:
	.loc 1 61 5
	.loc 1 62 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	li	a0,0
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.file 4 "board/common/board_base.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1a3
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF23
	.4byte	.LASF24
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
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF10
	.byte	0x4
	.4byte	.LASF25
	.byte	0x1
	.byte	0x36
	.byte	0x5
	.4byte	0x5d
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.byte	0x1
	.byte	0x9c
	.4byte	0xb0
	.byte	0x5
	.4byte	.LVL10
	.4byte	0xb0
	.byte	0x6
	.4byte	.LVL11
	.4byte	0x121
	.byte	0x7
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.byte	0x1
	.byte	0x9c
	.4byte	0x121
	.byte	0x5
	.4byte	.LVL0
	.4byte	0x12e
	.byte	0x5
	.4byte	.LVL1
	.4byte	0x13a
	.byte	0x5
	.4byte	.LVL2
	.4byte	0x146
	.byte	0x5
	.4byte	.LVL3
	.4byte	0x152
	.byte	0x5
	.4byte	.LVL4
	.4byte	0x15e
	.byte	0x5
	.4byte	.LVL5
	.4byte	0x16a
	.byte	0x5
	.4byte	.LVL6
	.4byte	0x176
	.byte	0x5
	.4byte	.LVL7
	.4byte	0x182
	.byte	0x5
	.4byte	.LVL8
	.4byte	0x18e
	.byte	0x9
	.4byte	.LVL9
	.4byte	0x19a
	.byte	0
	.byte	0xa
	.4byte	.LASF11
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x1d7
	.byte	0x6
	.byte	0xb
	.4byte	.LASF12
	.4byte	.LASF12
	.byte	0x3
	.byte	0x5f
	.byte	0xb
	.byte	0xb
	.4byte	.LASF13
	.4byte	.LASF13
	.byte	0x4
	.byte	0x21
	.byte	0x6
	.byte	0xb
	.4byte	.LASF14
	.4byte	.LASF14
	.byte	0x2
	.byte	0x49
	.byte	0x6
	.byte	0xb
	.4byte	.LASF15
	.4byte	.LASF15
	.byte	0x2
	.byte	0x28
	.byte	0x6
	.byte	0xb
	.4byte	.LASF16
	.4byte	.LASF16
	.byte	0x2
	.byte	0x4f
	.byte	0x6
	.byte	0xb
	.4byte	.LASF17
	.4byte	.LASF17
	.byte	0x2
	.byte	0xad
	.byte	0x6
	.byte	0xb
	.4byte	.LASF18
	.4byte	.LASF18
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0xb
	.4byte	.LASF19
	.4byte	.LASF19
	.byte	0x2
	.byte	0x50
	.byte	0x6
	.byte	0xb
	.4byte	.LASF20
	.4byte	.LASF20
	.byte	0x2
	.byte	0xa2
	.byte	0x6
	.byte	0xb
	.4byte	.LASF21
	.4byte	.LASF21
	.byte	0x2
	.byte	0xae
	.byte	0x6
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
	.byte	0x5
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB51
	.4byte	.LFE51
	.4byte	.LFB52
	.4byte	.LFE52
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"rt_system_object_init"
.LASF26:
	.string	"rtthread_startup"
.LASF25:
	.string	"main"
.LASF14:
	.string	"rt_system_tick_init"
.LASF18:
	.string	"rt_application_init"
.LASF17:
	.string	"rt_system_scheduler_init"
.LASF7:
	.string	"long long unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF23:
	.string	"applications/main.c"
.LASF9:
	.string	"char"
.LASF20:
	.string	"rt_thread_idle_init"
.LASF4:
	.string	"long int"
.LASF5:
	.string	"long unsigned int"
.LASF10:
	.string	"_Bool"
.LASF6:
	.string	"long long int"
.LASF3:
	.string	"short unsigned int"
.LASF0:
	.string	"signed char"
.LASF8:
	.string	"unsigned int"
.LASF16:
	.string	"rt_system_timer_init"
.LASF21:
	.string	"rt_system_scheduler_start"
.LASF12:
	.string	"rt_hw_interrupt_disable"
.LASF2:
	.string	"short int"
.LASF22:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF13:
	.string	"rt_hw_board_init"
.LASF11:
	.string	"rt_kprintf"
.LASF19:
	.string	"rt_system_timer_thread_init"
.LASF24:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
