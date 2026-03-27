	.file	"drv_pwm.c"
	.option nopic
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.rockchip_rt_hw_pwm_init,"ax",@progbits
	.align	1
	.globl	rockchip_rt_hw_pwm_init
	.type	rockchip_rt_hw_pwm_init, @function
rockchip_rt_hw_pwm_init:
.LFB42:
	.file 1 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm.c"
	.loc 1 244 1
	.cfi_startproc
	.loc 1 245 5
	.loc 1 246 5
	.loc 1 247 5
	.loc 1 249 5
.LVL0:
	.loc 1 244 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,24(sp)
	sw	s3,12(sp)
	sw	ra,28(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	.cfi_offset 8, -8
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.loc 1 249 14
	lla	s0,.LANCHOR0
	.loc 1 265 9
	lla	s3,.LANCHOR1
.LVL1:
.L2:
	.loc 1 249 36 is_stmt 1 discriminator 1
	lw	s2,0(s0)
	.loc 1 249 5 is_stmt 0 discriminator 1
	bne	s2,zero,.L3
	.loc 1 268 5 is_stmt 1
	.loc 1 269 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_remember_state
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
.LVL2:
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s2,16(sp)
	.cfi_restore 18
	lw	s3,12(sp)
	.cfi_restore 19
	li	a0,0
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
.LVL3:
.L3:
	.cfi_restore_state
	.loc 1 251 9 is_stmt 1 discriminator 3
	.loc 1 251 17 is_stmt 0 discriminator 3
	lw	s1,288(s2)
.LVL4:
	.loc 1 252 9 is_stmt 1 discriminator 3
	.loc 1 252 28 is_stmt 0 discriminator 3
	lw	a0,16(s1)
	call	get_clk_gate_from_id
.LVL5:
	.loc 1 252 26 discriminator 3
	sw	a0,292(s2)
	.loc 1 253 9 is_stmt 1 discriminator 3
	.loc 1 253 29 is_stmt 0 discriminator 3
	lw	a0,20(s1)
	.loc 1 253 10 discriminator 3
	lw	s2,0(s0)
	.loc 1 253 29 discriminator 3
	call	get_clk_gate_from_id
.LVL6:
	.loc 1 258 9 discriminator 3
	lw	a5,0(s0)
	.loc 1 253 27 discriminator 3
	sw	a0,296(s2)
	.loc 1 255 9 is_stmt 1 discriminator 3
	.loc 1 256 9 discriminator 3
	.loc 1 258 9 discriminator 3
	lw	a0,296(a5)
	call	clk_enable
.LVL7:
	.loc 1 260 9 discriminator 3
	.loc 1 260 16 is_stmt 0 discriminator 3
	lw	a1,12(s1)
	lw	a0,8(s1)
	call	clk_get_rate
.LVL8:
	mv	a2,a0
.LVL9:
	.loc 1 261 9 is_stmt 1 discriminator 3
	lw	a0,0(s0)
.LVL10:
	lw	a1,0(s1)
	addi	a0,a0,76
	call	HAL_PWM_Init
.LVL11:
	.loc 1 263 9 discriminator 3
	lw	a5,0(s0)
	lw	a0,296(a5)
	call	clk_disable
.LVL12:
	.loc 1 265 9 discriminator 3
	lw	a3,0(s0)
	mv	a2,s3
	.loc 1 249 52 is_stmt 0 discriminator 3
	addi	s0,s0,4
.LVL13:
	.loc 1 265 9 discriminator 3
	lw	a1,72(a3)
	mv	a0,a3
	call	rt_device_pwm_register
.LVL14:
	.loc 1 249 49 is_stmt 1 discriminator 3
	j	.L2
	.cfi_endproc
.LFE42:
	.size	rockchip_rt_hw_pwm_init, .-rockchip_rt_hw_pwm_init
	.section	.rodata.rockchip_pwm_control.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"0"
	.section	.text.rockchip_pwm_control,"ax",@progbits
	.align	1
	.type	rockchip_pwm_control, @function
rockchip_pwm_control:
.LFB41:
	.loc 1 151 1
	.cfi_startproc
.LVL15:
	.loc 1 152 5
	.loc 1 151 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	s1,52(sp)
	.cfi_offset 9, -12
	.loc 1 153 26
	lw	s1,64(a0)
	.loc 1 151 1
	sw	s0,56(sp)
	sw	s2,48(sp)
	.loc 1 160 8
	lw	a5,300(s1)
	.loc 1 151 1
	sw	s3,44(sp)
	sw	ra,60(sp)
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 1, -4
	.loc 1 151 1
	mv	s3,a1
	mv	s0,a2
.LVL16:
	.loc 1 153 5 is_stmt 1
	.loc 1 154 5
	.loc 1 154 24 is_stmt 0
	addi	s2,s1,76
.LVL17:
	.loc 1 155 5 is_stmt 1
	.loc 1 156 5
	.loc 1 158 5
	.loc 1 158 10
	.loc 1 158 17
	.loc 1 160 5
	.loc 1 160 8 is_stmt 0
	bne	a5,zero,.L6
	.loc 1 161 9 is_stmt 1
	lw	a0,296(s1)
.LVL18:
	call	clk_enable
.LVL19:
.L6:
	.loc 1 163 5
	addi	a1,s3,-128
	li	a5,10
	bgtu	a1,a5,.L20
	lla	a4,.L9
	slli	a1,a1,2
	add	a1,a1,a4
	lw	a5,0(a1)
	add	a5,a5,a4
	jr	a5
	.section	.rodata.rockchip_pwm_control,"a",@progbits
	.align	2
	.align	2
.L9:
	.word	.L18-.L9
	.word	.L17-.L9
	.word	.L16-.L9
	.word	.L20-.L9
	.word	.L15-.L9
	.word	.L14-.L9
	.word	.L13-.L9
	.word	.L12-.L9
	.word	.L11-.L9
	.word	.L10-.L9
	.word	.L8-.L9
	.section	.text.rockchip_pwm_control
.L18:
	.loc 1 166 9
	lw	a0,292(s1)
	call	clk_enable
.LVL20:
	.loc 1 167 9
	.loc 1 167 15 is_stmt 0
	li	a2,1
.L23:
	.loc 1 176 15
	lbu	a1,0(s0)
	mv	a0,s2
	call	HAL_PWM_Enable
.LVL21:
	j	.L22
.L17:
	.loc 1 170 9 is_stmt 1
	lw	a0,292(s1)
	call	clk_disable
.LVL22:
	.loc 1 171 9
	.loc 1 171 15 is_stmt 0
	lbu	a1,0(s0)
	mv	a0,s2
	call	HAL_PWM_Disable
.LVL23:
.L22:
	mv	s0,a0
.LVL24:
	.loc 1 172 9 is_stmt 1
.L7:
	.loc 1 232 5
	.loc 1 232 8 is_stmt 0
	lw	a5,300(s1)
	bne	a5,zero,.L5
	.loc 1 233 9 is_stmt 1
	lw	a0,296(s1)
	call	clk_disable
.LVL25:
	.loc 1 235 5
.L5:
	.loc 1 236 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_remember_state
	.cfi_restore 1
	mv	a0,s0
	lw	s0,56(sp)
	.cfi_restore 8
.LVL26:
	lw	s1,52(sp)
	.cfi_restore 9
.LVL27:
	lw	s2,48(sp)
	.cfi_restore 18
.LVL28:
	lw	s3,44(sp)
	.cfi_restore 19
.LVL29:
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
.LVL30:
.L15:
	.cfi_restore_state
	.loc 1 174 9 is_stmt 1
	lw	a2,12(s0)
	lbu	a1,0(s0)
	mv	a0,s2
	call	HAL_PWM_SetOneshot
.LVL31:
	.loc 1 175 9
	lw	a0,292(s1)
	call	clk_enable
.LVL32:
	.loc 1 176 9
	.loc 1 176 15 is_stmt 0
	li	a2,0
	j	.L23
.L11:
	.loc 1 179 9 is_stmt 1
	.loc 1 179 15 is_stmt 0
	lw	a2,16(s0)
	lbu	a1,0(s0)
	mv	a0,s2
	call	HAL_PWM_SetOutputOffset
.LVL33:
	j	.L22
.L16:
	.loc 1 182 9 is_stmt 1
	.loc 1 183 29 is_stmt 0
	lw	a5,4(s0)
	.loc 1 182 28
	lbu	a1,0(s0)
	.loc 1 187 15
	addi	a2,sp,12
	.loc 1 183 29
	sw	a5,16(sp)
	.loc 1 184 27
	lw	a5,8(s0)
	.loc 1 187 15
	mv	a0,s2
	.loc 1 182 28
	sb	a1,12(sp)
	.loc 1 183 9 is_stmt 1
	.loc 1 184 9
	.loc 1 184 27 is_stmt 0
	sw	a5,20(sp)
	.loc 1 185 9 is_stmt 1
	.loc 1 185 37 is_stmt 0
	lw	a5,24(s0)
	snez	a5,a5
	sb	a5,24(sp)
	.loc 1 186 9 is_stmt 1
	.loc 1 186 32 is_stmt 0
	lw	a5,28(s0)
	sw	a5,28(sp)
	.loc 1 187 9 is_stmt 1
	.loc 1 187 15 is_stmt 0
	call	HAL_PWM_SetConfig
.LVL34:
	j	.L22
.L14:
	.loc 1 190 9 is_stmt 1
	lw	a0,292(s1)
	call	clk_enable
.LVL35:
	.loc 1 191 9
	.loc 1 191 15 is_stmt 0
	li	a2,2
	j	.L23
.L10:
	.loc 1 195 9 is_stmt 1
	lbu	a1,20(s0)
	mv	a0,s2
	call	HAL_PWM_GlobalUnlock
.LVL36:
	.loc 1 196 9
	.loc 1 196 15 is_stmt 0
	lbu	a1,20(s0)
	mv	a0,s2
	call	HAL_PWM_GlobalLock
.LVL37:
	mv	s0,a0
.LVL38:
	.loc 1 197 9 is_stmt 1
	mv	a0,s2
	call	HAL_PWM_GlobalDisable
.LVL39:
	.loc 1 201 9
	j	.L7
.LVL40:
.L8:
	.loc 1 204 9
	.loc 1 204 15 is_stmt 0
	mv	a0,s2
	call	HAL_PWM_GlobalUpdate
.LVL41:
	mv	s0,a0
.LVL42:
	.loc 1 205 9 is_stmt 1
	mv	a0,s2
	call	HAL_PWM_GlobalEnable
.LVL43:
	.loc 1 209 9
	j	.L7
.LVL44:
.L13:
	.loc 1 212 9
	.loc 1 212 60 is_stmt 0
	lw	a3,0(s0)
	.loc 1 212 53
	lw	a5,288(s1)
	.loc 1 212 9
	lw	a1,304(s1)
	.loc 1 212 53
	addi	a4,a3,4
	slli	a4,a4,2
	add	a5,a5,a4
	.loc 1 212 9
	lw	a0,8(a5)
	lla	a4,.LC0
	add	a3,a4,a3
	li	a2,0
	call	rt_hw_interrupt_install
.LVL45:
	.loc 1 213 9 is_stmt 1
	.loc 1 213 51 is_stmt 0
	lw	a5,0(s0)
	lw	a4,288(s1)
	addi	a5,a5,4
	slli	a5,a5,2
	add	a5,a4,a5
	.loc 1 213 9
	lw	a0,8(a5)
	call	rt_hw_interrupt_umask
.LVL46:
	.loc 1 218 9 is_stmt 1
	.loc 1 218 28 is_stmt 0
	li	a5,1
	sw	a5,300(s1)
	.loc 1 219 9 is_stmt 1
.L20:
	.loc 1 156 14 is_stmt 0
	li	s0,0
.LVL47:
	j	.L7
.LVL48:
.L12:
	.loc 1 222 9 is_stmt 1
	.loc 1 222 50 is_stmt 0
	lw	a5,0(s0)
	lw	a4,288(s1)
	addi	a5,a5,4
	slli	a5,a5,2
	add	a5,a4,a5
	.loc 1 222 9
	lw	a0,8(a5)
	call	rt_hw_interrupt_mask
.LVL49:
	.loc 1 226 9 is_stmt 1
	.loc 1 226 28 is_stmt 0
	sw	zero,300(s1)
	.loc 1 227 9 is_stmt 1
	j	.L20
	.cfi_endproc
.LFE41:
	.size	rockchip_pwm_control, .-rockchip_pwm_control
	.section	.text.rockchip_pwm0_irq,"ax",@progbits
	.align	1
	.type	rockchip_pwm0_irq, @function
rockchip_pwm0_irq:
.LFB39:
	.loc 1 85 220
	.cfi_startproc
.LVL50:
	.loc 1 85 222
.LBB4:
.LBB5:
	.loc 1 120 5
	.loc 1 121 5
	.loc 1 123 5
	.loc 1 124 5
	.loc 1 126 5
.LBE5:
.LBE4:
	.loc 1 85 220 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 1, -4
.LBB8:
.LBB6:
	.loc 1 129 12
	li	s0,0
	.loc 1 126 5
	call	rt_interrupt_enter
.LVL51:
	.loc 1 129 5 is_stmt 1
	.loc 1 129 25 is_stmt 0
	lla	s1,.LANCHOR2
	.loc 1 131 9
	lla	s2,.LANCHOR2+76
.LVL52:
.L25:
	.loc 1 129 17 is_stmt 1
	.loc 1 129 5 is_stmt 0
	lw	a5,272(s1)
	bltu	s0,a5,.L26
	.loc 1 146 5 is_stmt 1
.LBE6:
.LBE8:
	.loc 1 85 247 is_stmt 0
	lw	s0,8(sp)
	.cfi_remember_state
	.cfi_restore 8
.LVL53:
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s1,4(sp)
	.cfi_restore 9
	lw	s2,0(sp)
	.cfi_restore 18
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
.LBB9:
.LBB7:
	.loc 1 146 5
	tail	rt_interrupt_leave
.LVL54:
.L26:
	.cfi_restore_state
	.loc 1 131 9 is_stmt 1
	andi	a1,s0,0xff
	mv	a0,s2
	call	HAL_PWM_ChannelIRQHandler
.LVL55:
	.loc 1 132 9
	.loc 1 133 13
	.loc 1 133 18
	.loc 1 133 25
	.loc 1 129 39
	.loc 1 129 40 is_stmt 0
	addi	s0,s0,1
.LVL56:
	j	.L25
.LBE7:
.LBE9:
	.cfi_endproc
.LFE39:
	.size	rockchip_pwm0_irq, .-rockchip_pwm0_irq
	.globl	__rt_init_rockchip_rt_hw_pwm_init
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"pwm0"
	.section	.data.pwm0,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	pwm0, @object
	.size	pwm0, 308
pwm0:
	.zero	72
	.word	.LC1
	.zero	212
	.word	g_pwm0Dev
	.zero	12
	.word	rockchip_pwm0_irq
	.section	.rti_fn.3,"a"
	.align	2
	.type	__rt_init_rockchip_rt_hw_pwm_init, @object
	.size	__rt_init_rockchip_rt_hw_pwm_init, 4
__rt_init_rockchip_rt_hw_pwm_init:
	.word	rockchip_rt_hw_pwm_init
	.section	.sdata.rockchip_pwm_ops,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	rockchip_pwm_ops, @object
	.size	rockchip_pwm_ops, 4
rockchip_pwm_ops:
	.word	rockchip_pwm_control
	.section	.srodata.rockchip_pwm_table,"a"
	.align	2
	.set	.LANCHOR0,. + 0
	.type	rockchip_pwm_table, @object
	.size	rockchip_pwm_table, 8
rockchip_pwm_table:
	.word	pwm0
	.word	0
	.text
.Letext0:
	.file 2 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtdef.h"
	.file 3 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/machine/_default_types.h"
	.file 4 "/opt/aiglass_dev_env/sysdrv/source/mcu/prebuilts/gcc/linux-x86/riscv64/xpack-riscv-none-embed-gcc-10.2.0-1.2/riscv-none-embed/include/sys/_stdint.h"
	.file 5 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rthw.h"
	.file 6 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/components/drivers/include/drivers/rt_drv_pwm.h"
	.file 7 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/soc.h"
	.file 8 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/CMSIS/Device/RV1103B/Include/rv1103b.h"
	.file 9 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pm.h"
	.file 10 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pinctrl.h"
	.file 11 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwm.h"
	.file 12 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/hal/inc/hal_pwr.h"
	.file 13 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_clock.h"
	.file 14 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/hal/lib/bsp/RV1103B/hal_bsp.h"
	.file 15 "/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/include/rtthread.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x1497
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF346
	.byte	0xc
	.4byte	.LASF347
	.4byte	.LASF348
	.4byte	.Ldebug_ranges0+0x20
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
	.byte	0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3d
	.byte	0x17
	.4byte	0x4d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.byte	0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3e
	.byte	0x18
	.4byte	0x60
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF7
	.byte	0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x3f
	.byte	0x17
	.4byte	0x73
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.4byte	.LASF11
	.byte	0x2
	.byte	0x41
	.byte	0xd
	.4byte	0x8d
	.byte	0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF12
	.byte	0x2
	.byte	0x44
	.byte	0xe
	.4byte	0x33
	.byte	0x3
	.4byte	.LASF13
	.byte	0x2
	.byte	0x45
	.byte	0x17
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF14
	.byte	0x2
	.byte	0x47
	.byte	0x13
	.4byte	0x94
	.byte	0x3
	.4byte	.LASF15
	.byte	0x2
	.byte	0x4b
	.byte	0x14
	.4byte	0xa0
	.byte	0x3
	.4byte	.LASF16
	.byte	0x2
	.byte	0x4d
	.byte	0x13
	.4byte	0x94
	.byte	0x3
	.4byte	.LASF17
	.byte	0x2
	.byte	0xb3
	.byte	0xf
	.4byte	0xe1
	.byte	0x5
	.4byte	0xd0
	.byte	0x6
	.byte	0x4
	.4byte	0xe7
	.byte	0x7
	.4byte	0x8d
	.byte	0x8
	.4byte	.LASF21
	.byte	0x8
	.byte	0x2
	.2byte	0x12c
	.byte	0x8
	.4byte	0x117
	.byte	0x9
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x12e
	.byte	0x1a
	.4byte	0x117
	.byte	0
	.byte	0x9
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x12f
	.byte	0x1a
	.4byte	0x117
	.byte	0x4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xec
	.byte	0xa
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x131
	.byte	0x1d
	.4byte	0xec
	.byte	0x8
	.4byte	.LASF22
	.byte	0x4
	.byte	0x2
	.2byte	0x136
	.byte	0x8
	.4byte	0x147
	.byte	0x9
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x138
	.byte	0x1b
	.4byte	0x147
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x12a
	.byte	0xa
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x13a
	.byte	0x1e
	.4byte	0x12a
	.byte	0x8
	.4byte	.LASF24
	.byte	0x14
	.byte	0x2
	.2byte	0x14a
	.byte	0x8
	.4byte	0x1a1
	.byte	0x9
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x14c
	.byte	0xa
	.4byte	0x1a1
	.byte	0
	.byte	0x9
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x14d
	.byte	0x10
	.4byte	0x41
	.byte	0x8
	.byte	0x9
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x14e
	.byte	0x10
	.4byte	0x41
	.byte	0x9
	.byte	0x9
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x153
	.byte	0xf
	.4byte	0x11d
	.byte	0xc
	.byte	0
	.byte	0xb
	.4byte	0x1b8
	.4byte	0x1b1
	.byte	0xc
	.4byte	0x1b1
	.byte	0x7
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF29
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF30
	.byte	0x5
	.4byte	0x1b8
	.byte	0xd
	.byte	0x4
	.byte	0xe
	.4byte	.LASF73
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0x2
	.2byte	0x319
	.byte	0x6
	.4byte	0x25e
	.byte	0xf
	.4byte	.LASF31
	.byte	0
	.byte	0xf
	.4byte	.LASF32
	.byte	0x1
	.byte	0xf
	.4byte	.LASF33
	.byte	0x2
	.byte	0xf
	.4byte	.LASF34
	.byte	0x3
	.byte	0xf
	.4byte	.LASF35
	.byte	0x4
	.byte	0xf
	.4byte	.LASF36
	.byte	0x5
	.byte	0xf
	.4byte	.LASF37
	.byte	0x6
	.byte	0xf
	.4byte	.LASF38
	.byte	0x7
	.byte	0xf
	.4byte	.LASF39
	.byte	0x8
	.byte	0xf
	.4byte	.LASF40
	.byte	0x9
	.byte	0xf
	.4byte	.LASF41
	.byte	0xa
	.byte	0xf
	.4byte	.LASF42
	.byte	0xb
	.byte	0xf
	.4byte	.LASF43
	.byte	0xc
	.byte	0xf
	.4byte	.LASF44
	.byte	0xd
	.byte	0xf
	.4byte	.LASF45
	.byte	0xe
	.byte	0xf
	.4byte	.LASF46
	.byte	0xf
	.byte	0xf
	.4byte	.LASF47
	.byte	0x10
	.byte	0xf
	.4byte	.LASF48
	.byte	0x11
	.byte	0xf
	.4byte	.LASF49
	.byte	0x12
	.byte	0xf
	.4byte	.LASF50
	.byte	0x13
	.byte	0xf
	.4byte	.LASF51
	.byte	0x14
	.byte	0xf
	.4byte	.LASF52
	.byte	0x15
	.byte	0
	.byte	0xa
	.4byte	.LASF53
	.byte	0x2
	.2byte	0x36b
	.byte	0x1b
	.4byte	0x26b
	.byte	0x6
	.byte	0x4
	.4byte	0x271
	.byte	0x8
	.4byte	.LASF54
	.byte	0x44
	.byte	0x2
	.2byte	0x387
	.byte	0x8
	.4byte	0x352
	.byte	0x9
	.4byte	.LASF55
	.byte	0x2
	.2byte	0x389
	.byte	0x16
	.4byte	0x15a
	.byte	0
	.byte	0x9
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x38b
	.byte	0x1f
	.4byte	0x1c6
	.byte	0x14
	.byte	0x9
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x38c
	.byte	0x11
	.4byte	0x54
	.byte	0x18
	.byte	0x9
	.4byte	.LASF56
	.byte	0x2
	.2byte	0x38d
	.byte	0x11
	.4byte	0x54
	.byte	0x1a
	.byte	0x9
	.4byte	.LASF57
	.byte	0x2
	.2byte	0x38f
	.byte	0x10
	.4byte	0x41
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF58
	.byte	0x2
	.2byte	0x390
	.byte	0x10
	.4byte	0x41
	.byte	0x1d
	.byte	0x9
	.4byte	.LASF59
	.byte	0x2
	.2byte	0x393
	.byte	0x10
	.4byte	0x403
	.byte	0x20
	.byte	0x9
	.4byte	.LASF60
	.byte	0x2
	.2byte	0x394
	.byte	0x10
	.4byte	0x41d
	.byte	0x24
	.byte	0x9
	.4byte	.LASF61
	.byte	0x2
	.2byte	0x39a
	.byte	0x10
	.4byte	0x361
	.byte	0x28
	.byte	0x9
	.4byte	.LASF62
	.byte	0x2
	.2byte	0x39b
	.byte	0x10
	.4byte	0x37b
	.byte	0x2c
	.byte	0x9
	.4byte	.LASF63
	.byte	0x2
	.2byte	0x39c
	.byte	0x10
	.4byte	0x361
	.byte	0x30
	.byte	0x9
	.4byte	.LASF64
	.byte	0x2
	.2byte	0x39d
	.byte	0x11
	.4byte	0x39f
	.byte	0x34
	.byte	0x9
	.4byte	.LASF65
	.byte	0x2
	.2byte	0x39e
	.byte	0x11
	.4byte	0x3ca
	.byte	0x38
	.byte	0x9
	.4byte	.LASF66
	.byte	0x2
	.2byte	0x39f
	.byte	0x10
	.4byte	0x3e9
	.byte	0x3c
	.byte	0x9
	.4byte	.LASF67
	.byte	0x2
	.2byte	0x3a7
	.byte	0xb
	.4byte	0x1c4
	.byte	0x40
	.byte	0
	.byte	0x10
	.4byte	0xac
	.4byte	0x361
	.byte	0x11
	.4byte	0x25e
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x352
	.byte	0x10
	.4byte	0xac
	.4byte	0x37b
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0x54
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x367
	.byte	0x10
	.4byte	0xb8
	.4byte	0x39f
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0xc4
	.byte	0x11
	.4byte	0x1c4
	.byte	0x11
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x381
	.byte	0x10
	.4byte	0xb8
	.4byte	0x3c3
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0xc4
	.byte	0x11
	.4byte	0x3c3
	.byte	0x11
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3c9
	.byte	0x12
	.byte	0x6
	.byte	0x4
	.4byte	0x3a5
	.byte	0x10
	.4byte	0xac
	.4byte	0x3e9
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0x8d
	.byte	0x11
	.4byte	0x1c4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3d0
	.byte	0x10
	.4byte	0xac
	.4byte	0x403
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0xb8
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x3ef
	.byte	0x10
	.4byte	0xac
	.4byte	0x41d
	.byte	0x11
	.4byte	0x25e
	.byte	0x11
	.4byte	0x1c4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x409
	.byte	0x6
	.byte	0x4
	.4byte	0x1bf
	.byte	0x3
	.4byte	.LASF68
	.byte	0x3
	.byte	0x2b
	.byte	0x17
	.4byte	0x4d
	.byte	0x3
	.4byte	.LASF69
	.byte	0x3
	.byte	0x4f
	.byte	0x1b
	.4byte	0x73
	.byte	0x3
	.4byte	.LASF70
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.4byte	0x429
	.byte	0x3
	.4byte	.LASF71
	.byte	0x4
	.byte	0x30
	.byte	0x14
	.4byte	0x435
	.byte	0x13
	.4byte	0x44d
	.byte	0x5
	.4byte	0x459
	.byte	0x3
	.4byte	.LASF72
	.byte	0x5
	.byte	0x47
	.byte	0x10
	.4byte	0x46f
	.byte	0x6
	.byte	0x4
	.4byte	0x475
	.byte	0x14
	.4byte	0x485
	.byte	0x11
	.4byte	0x8d
	.byte	0x11
	.4byte	0x1c4
	.byte	0
	.byte	0x15
	.4byte	.LASF74
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0x6
	.byte	0x1f
	.byte	0x6
	.4byte	0x4aa
	.byte	0xf
	.4byte	.LASF75
	.byte	0x1
	.byte	0xf
	.4byte	.LASF76
	.byte	0x2
	.byte	0xf
	.4byte	.LASF77
	.byte	0x3
	.byte	0
	.byte	0x16
	.4byte	.LASF78
	.byte	0x20
	.byte	0x6
	.byte	0x26
	.byte	0x8
	.4byte	0x520
	.byte	0x17
	.4byte	.LASF79
	.byte	0x6
	.byte	0x28
	.byte	0x11
	.4byte	0x67
	.byte	0
	.byte	0x17
	.4byte	.LASF80
	.byte	0x6
	.byte	0x29
	.byte	0x11
	.4byte	0x67
	.byte	0x4
	.byte	0x17
	.4byte	.LASF81
	.byte	0x6
	.byte	0x2a
	.byte	0x11
	.4byte	0x67
	.byte	0x8
	.byte	0x17
	.4byte	.LASF82
	.byte	0x6
	.byte	0x2b
	.byte	0x11
	.4byte	0x67
	.byte	0xc
	.byte	0x17
	.4byte	.LASF83
	.byte	0x6
	.byte	0x2c
	.byte	0x11
	.4byte	0x67
	.byte	0x10
	.byte	0x17
	.4byte	.LASF84
	.byte	0x6
	.byte	0x2d
	.byte	0x11
	.4byte	0x67
	.byte	0x14
	.byte	0x17
	.4byte	.LASF85
	.byte	0x6
	.byte	0x2f
	.byte	0xf
	.4byte	0x81
	.byte	0x18
	.byte	0x17
	.4byte	.LASF86
	.byte	0x6
	.byte	0x31
	.byte	0x1e
	.4byte	0x485
	.byte	0x1c
	.byte	0
	.byte	0x16
	.4byte	.LASF87
	.byte	0x4
	.byte	0x6
	.byte	0x35
	.byte	0x8
	.4byte	0x53b
	.byte	0x17
	.4byte	.LASF66
	.byte	0x6
	.byte	0x37
	.byte	0x10
	.4byte	0x587
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	0x520
	.byte	0x10
	.4byte	0xac
	.4byte	0x559
	.byte	0x11
	.4byte	0x559
	.byte	0x11
	.4byte	0x8d
	.byte	0x11
	.4byte	0x1c4
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x55f
	.byte	0x16
	.4byte	.LASF88
	.byte	0x48
	.byte	0x6
	.byte	0x3a
	.byte	0x8
	.4byte	0x587
	.byte	0x17
	.4byte	.LASF55
	.byte	0x6
	.byte	0x3c
	.byte	0x16
	.4byte	0x271
	.byte	0
	.byte	0x18
	.string	"ops"
	.byte	0x6
	.byte	0x3d
	.byte	0x1e
	.4byte	0x58d
	.byte	0x44
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x540
	.byte	0x6
	.byte	0x4
	.4byte	0x53b
	.byte	0x19
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.4byte	0x71c
	.byte	0xf
	.4byte	.LASF89
	.byte	0x11
	.byte	0xf
	.4byte	.LASF90
	.byte	0x20
	.byte	0xf
	.4byte	.LASF91
	.byte	0x21
	.byte	0xf
	.4byte	.LASF92
	.byte	0x22
	.byte	0xf
	.4byte	.LASF93
	.byte	0x23
	.byte	0xf
	.4byte	.LASF94
	.byte	0x24
	.byte	0xf
	.4byte	.LASF95
	.byte	0x25
	.byte	0xf
	.4byte	.LASF96
	.byte	0x29
	.byte	0xf
	.4byte	.LASF97
	.byte	0x34
	.byte	0xf
	.4byte	.LASF98
	.byte	0x39
	.byte	0xf
	.4byte	.LASF99
	.byte	0x3a
	.byte	0xf
	.4byte	.LASF100
	.byte	0x3b
	.byte	0xf
	.4byte	.LASF101
	.byte	0x3c
	.byte	0xf
	.4byte	.LASF102
	.byte	0x3f
	.byte	0xf
	.4byte	.LASF103
	.byte	0x40
	.byte	0xf
	.4byte	.LASF104
	.byte	0x41
	.byte	0xf
	.4byte	.LASF105
	.byte	0x42
	.byte	0xf
	.4byte	.LASF106
	.byte	0x43
	.byte	0xf
	.4byte	.LASF107
	.byte	0x45
	.byte	0xf
	.4byte	.LASF108
	.byte	0x46
	.byte	0xf
	.4byte	.LASF109
	.byte	0x47
	.byte	0xf
	.4byte	.LASF110
	.byte	0x4b
	.byte	0xf
	.4byte	.LASF111
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF112
	.byte	0x4d
	.byte	0xf
	.4byte	.LASF113
	.byte	0x4e
	.byte	0xf
	.4byte	.LASF114
	.byte	0x4f
	.byte	0xf
	.4byte	.LASF115
	.byte	0x50
	.byte	0xf
	.4byte	.LASF116
	.byte	0x51
	.byte	0xf
	.4byte	.LASF117
	.byte	0x52
	.byte	0xf
	.4byte	.LASF118
	.byte	0x53
	.byte	0xf
	.4byte	.LASF119
	.byte	0x54
	.byte	0xf
	.4byte	.LASF120
	.byte	0x55
	.byte	0xf
	.4byte	.LASF121
	.byte	0x56
	.byte	0xf
	.4byte	.LASF122
	.byte	0x57
	.byte	0xf
	.4byte	.LASF123
	.byte	0x58
	.byte	0xf
	.4byte	.LASF124
	.byte	0x59
	.byte	0xf
	.4byte	.LASF125
	.byte	0x5a
	.byte	0xf
	.4byte	.LASF126
	.byte	0x5b
	.byte	0xf
	.4byte	.LASF127
	.byte	0x5c
	.byte	0xf
	.4byte	.LASF128
	.byte	0x5d
	.byte	0xf
	.4byte	.LASF129
	.byte	0x5e
	.byte	0xf
	.4byte	.LASF130
	.byte	0x5f
	.byte	0xf
	.4byte	.LASF131
	.byte	0x60
	.byte	0xf
	.4byte	.LASF132
	.byte	0x61
	.byte	0xf
	.4byte	.LASF133
	.byte	0x62
	.byte	0xf
	.4byte	.LASF134
	.byte	0x6a
	.byte	0xf
	.4byte	.LASF135
	.byte	0x6b
	.byte	0xf
	.4byte	.LASF136
	.byte	0x6c
	.byte	0xf
	.4byte	.LASF137
	.byte	0x6d
	.byte	0xf
	.4byte	.LASF138
	.byte	0x6e
	.byte	0xf
	.4byte	.LASF139
	.byte	0x6f
	.byte	0xf
	.4byte	.LASF140
	.byte	0x70
	.byte	0xf
	.4byte	.LASF141
	.byte	0x71
	.byte	0xf
	.4byte	.LASF142
	.byte	0x72
	.byte	0xf
	.4byte	.LASF143
	.byte	0x73
	.byte	0xf
	.4byte	.LASF144
	.byte	0x74
	.byte	0xf
	.4byte	.LASF145
	.byte	0x75
	.byte	0xf
	.4byte	.LASF146
	.byte	0x76
	.byte	0xf
	.4byte	.LASF147
	.byte	0x77
	.byte	0xf
	.4byte	.LASF148
	.byte	0x78
	.byte	0xf
	.4byte	.LASF149
	.byte	0x79
	.byte	0xf
	.4byte	.LASF150
	.byte	0x7c
	.byte	0xf
	.4byte	.LASF151
	.byte	0x80
	.byte	0
	.byte	0x3
	.4byte	.LASF152
	.byte	0x7
	.byte	0x6f
	.byte	0x3
	.4byte	0x593
	.byte	0xb
	.4byte	0x44d
	.4byte	0x738
	.byte	0xc
	.4byte	0x1b1
	.byte	0xe
	.byte	0
	.byte	0xb
	.4byte	0x44d
	.4byte	0x748
	.byte	0xc
	.4byte	0x1b1
	.byte	0x11
	.byte	0
	.byte	0x1a
	.4byte	.LASF153
	.2byte	0x210
	.byte	0x8
	.2byte	0x257
	.byte	0x8
	.4byte	0x98d
	.byte	0x9
	.4byte	.LASF154
	.byte	0x8
	.2byte	0x258
	.byte	0x1d
	.4byte	0x45e
	.byte	0
	.byte	0x9
	.4byte	.LASF155
	.byte	0x8
	.2byte	0x259
	.byte	0x17
	.4byte	0x459
	.byte	0x4
	.byte	0x9
	.4byte	.LASF156
	.byte	0x8
	.2byte	0x25a
	.byte	0x17
	.4byte	0x459
	.byte	0x8
	.byte	0x9
	.4byte	.LASF157
	.byte	0x8
	.2byte	0x25b
	.byte	0x17
	.4byte	0x459
	.byte	0xc
	.byte	0x9
	.4byte	.LASF158
	.byte	0x8
	.2byte	0x25c
	.byte	0x17
	.4byte	0x459
	.byte	0x10
	.byte	0x9
	.4byte	.LASF159
	.byte	0x8
	.2byte	0x25d
	.byte	0x17
	.4byte	0x459
	.byte	0x14
	.byte	0x9
	.4byte	.LASF160
	.byte	0x8
	.2byte	0x25e
	.byte	0x17
	.4byte	0x459
	.byte	0x18
	.byte	0x1b
	.string	"RPT"
	.byte	0x8
	.2byte	0x25f
	.byte	0x17
	.4byte	0x459
	.byte	0x1c
	.byte	0x9
	.4byte	.LASF161
	.byte	0x8
	.2byte	0x260
	.byte	0x17
	.4byte	0x459
	.byte	0x20
	.byte	0x1b
	.string	"CNT"
	.byte	0x8
	.2byte	0x261
	.byte	0x1d
	.4byte	0x45e
	.byte	0x24
	.byte	0x9
	.4byte	.LASF162
	.byte	0x8
	.2byte	0x262
	.byte	0x17
	.4byte	0x459
	.byte	0x28
	.byte	0x1b
	.string	"HPC"
	.byte	0x8
	.2byte	0x263
	.byte	0x17
	.4byte	0x459
	.byte	0x2c
	.byte	0x1b
	.string	"LPC"
	.byte	0x8
	.2byte	0x264
	.byte	0x17
	.4byte	0x459
	.byte	0x30
	.byte	0x9
	.4byte	.LASF163
	.byte	0x8
	.2byte	0x265
	.byte	0x13
	.4byte	0x728
	.byte	0x34
	.byte	0x9
	.4byte	.LASF164
	.byte	0x8
	.2byte	0x266
	.byte	0x17
	.4byte	0x459
	.byte	0x70
	.byte	0x9
	.4byte	.LASF165
	.byte	0x8
	.2byte	0x267
	.byte	0x17
	.4byte	0x459
	.byte	0x74
	.byte	0x9
	.4byte	.LASF166
	.byte	0x8
	.2byte	0x268
	.byte	0x13
	.4byte	0x738
	.byte	0x78
	.byte	0x9
	.4byte	.LASF167
	.byte	0x8
	.2byte	0x269
	.byte	0x17
	.4byte	0x459
	.byte	0xc0
	.byte	0x9
	.4byte	.LASF168
	.byte	0x8
	.2byte	0x26a
	.byte	0x17
	.4byte	0x459
	.byte	0xc4
	.byte	0x9
	.4byte	.LASF169
	.byte	0x8
	.2byte	0x26b
	.byte	0x13
	.4byte	0x98d
	.byte	0xc8
	.byte	0x1c
	.4byte	.LASF170
	.byte	0x8
	.2byte	0x26c
	.byte	0x17
	.4byte	0x459
	.2byte	0x100
	.byte	0x1c
	.4byte	.LASF171
	.byte	0x8
	.2byte	0x26d
	.byte	0x17
	.4byte	0x459
	.2byte	0x104
	.byte	0x1c
	.4byte	.LASF172
	.byte	0x8
	.2byte	0x26e
	.byte	0x17
	.4byte	0x459
	.2byte	0x108
	.byte	0x1c
	.4byte	.LASF173
	.byte	0x8
	.2byte	0x26f
	.byte	0x17
	.4byte	0x459
	.2byte	0x10c
	.byte	0x1c
	.4byte	.LASF174
	.byte	0x8
	.2byte	0x270
	.byte	0x17
	.4byte	0x459
	.2byte	0x110
	.byte	0x1c
	.4byte	.LASF175
	.byte	0x8
	.2byte	0x271
	.byte	0x17
	.4byte	0x459
	.2byte	0x114
	.byte	0x1c
	.4byte	.LASF176
	.byte	0x8
	.2byte	0x272
	.byte	0x17
	.4byte	0x459
	.2byte	0x118
	.byte	0x1c
	.4byte	.LASF177
	.byte	0x8
	.2byte	0x273
	.byte	0x17
	.4byte	0x9ad
	.2byte	0x11c
	.byte	0x1c
	.4byte	.LASF178
	.byte	0x8
	.2byte	0x274
	.byte	0x1d
	.4byte	0x45e
	.2byte	0x15c
	.byte	0x1c
	.4byte	.LASF179
	.byte	0x8
	.2byte	0x275
	.byte	0x13
	.4byte	0x9b2
	.2byte	0x160
	.byte	0x1c
	.4byte	.LASF180
	.byte	0x8
	.2byte	0x276
	.byte	0x17
	.4byte	0x459
	.2byte	0x1c0
	.byte	0x1c
	.4byte	.LASF181
	.byte	0x8
	.2byte	0x277
	.byte	0x17
	.4byte	0x459
	.2byte	0x1c4
	.byte	0x1c
	.4byte	.LASF182
	.byte	0x8
	.2byte	0x278
	.byte	0x17
	.4byte	0x459
	.2byte	0x1c8
	.byte	0x1c
	.4byte	.LASF183
	.byte	0x8
	.2byte	0x279
	.byte	0x17
	.4byte	0x459
	.2byte	0x1cc
	.byte	0x1c
	.4byte	.LASF184
	.byte	0x8
	.2byte	0x27a
	.byte	0x13
	.4byte	0x9c2
	.2byte	0x1d0
	.byte	0x1c
	.4byte	.LASF185
	.byte	0x8
	.2byte	0x27b
	.byte	0x17
	.4byte	0x459
	.2byte	0x200
	.byte	0x1c
	.4byte	.LASF186
	.byte	0x8
	.2byte	0x27c
	.byte	0x17
	.4byte	0x459
	.2byte	0x204
	.byte	0x1c
	.4byte	.LASF187
	.byte	0x8
	.2byte	0x27d
	.byte	0x1d
	.4byte	0x45e
	.2byte	0x208
	.byte	0x1c
	.4byte	.LASF188
	.byte	0x8
	.2byte	0x27e
	.byte	0x1d
	.4byte	0x45e
	.2byte	0x20c
	.byte	0
	.byte	0xb
	.4byte	0x44d
	.4byte	0x99d
	.byte	0xc
	.4byte	0x1b1
	.byte	0xd
	.byte	0
	.byte	0xb
	.4byte	0x459
	.4byte	0x9ad
	.byte	0xc
	.4byte	0x1b1
	.byte	0xf
	.byte	0
	.byte	0x13
	.4byte	0x99d
	.byte	0xb
	.4byte	0x44d
	.4byte	0x9c2
	.byte	0xc
	.4byte	0x1b1
	.byte	0x17
	.byte	0
	.byte	0xb
	.4byte	0x44d
	.4byte	0x9d2
	.byte	0xc
	.4byte	0x1b1
	.byte	0xb
	.byte	0
	.byte	0x15
	.4byte	.LASF189
	.byte	0x7
	.byte	0x8
	.4byte	0x7a
	.byte	0x7
	.byte	0x9e
	.byte	0xe
	.4byte	0xc28
	.byte	0xf
	.4byte	.LASF190
	.byte	0
	.byte	0xf
	.4byte	.LASF191
	.byte	0x1
	.byte	0xf
	.4byte	.LASF192
	.byte	0x2
	.byte	0xf
	.4byte	.LASF193
	.byte	0x3
	.byte	0xf
	.4byte	.LASF194
	.byte	0x4
	.byte	0xf
	.4byte	.LASF195
	.byte	0x5
	.byte	0xf
	.4byte	.LASF196
	.byte	0x6
	.byte	0xf
	.4byte	.LASF197
	.byte	0x7
	.byte	0xf
	.4byte	.LASF198
	.byte	0x8
	.byte	0x1d
	.4byte	.LASF199
	.4byte	0x2000000
	.byte	0x1d
	.4byte	.LASF200
	.4byte	0x5040000
	.byte	0x1d
	.4byte	.LASF201
	.4byte	0x50a0000
	.byte	0x1d
	.4byte	.LASF202
	.4byte	0x3000001
	.byte	0x1d
	.4byte	.LASF203
	.4byte	0x5000705
	.byte	0x1d
	.4byte	.LASF204
	.4byte	0x2000070a
	.byte	0x1e
	.4byte	.LASF205
	.8byte	0x208072000000000
	.byte	0x1d
	.4byte	.LASF206
	.4byte	0x5050705
	.byte	0x1d
	.4byte	.LASF207
	.4byte	0x2000070b
	.byte	0x1e
	.4byte	.LASF208
	.8byte	0x20a072000000000
	.byte	0x1d
	.4byte	.LASF209
	.4byte	0x50a0705
	.byte	0x1d
	.4byte	.LASF210
	.4byte	0x2000070c
	.byte	0x1e
	.4byte	.LASF211
	.8byte	0x20c072000000000
	.byte	0x1d
	.4byte	.LASF212
	.4byte	0x5000714
	.byte	0x1d
	.4byte	.LASF213
	.4byte	0x20000715
	.byte	0x1e
	.4byte	.LASF214
	.8byte	0x20a072300000000
	.byte	0x1e
	.4byte	.LASF215
	.8byte	0x10f071f0800071f
	.byte	0x1e
	.4byte	.LASF216
	.8byte	0x10f072008000720
	.byte	0x1e
	.4byte	.LASF217
	.8byte	0x10f072408000724
	.byte	0x1e
	.4byte	.LASF218
	.8byte	0x10f072108000721
	.byte	0x1e
	.4byte	.LASF219
	.8byte	0x109071f00000000
	.byte	0x1e
	.4byte	.LASF220
	.8byte	0x20a071f00000000
	.byte	0x1e
	.4byte	.LASF221
	.8byte	0x10c071f00000000
	.byte	0x1e
	.4byte	.LASF222
	.8byte	0x100072200000000
	.byte	0x1e
	.4byte	.LASF223
	.8byte	0x101072200000000
	.byte	0x1e
	.4byte	.LASF224
	.8byte	0x202072200000000
	.byte	0x1e
	.4byte	.LASF225
	.8byte	0x10c072200000000
	.byte	0x1e
	.4byte	.LASF226
	.8byte	0x10d072200000000
	.byte	0x1e
	.4byte	.LASF227
	.8byte	0x10e072200000000
	.byte	0x1e
	.4byte	.LASF228
	.8byte	0x200072300000000
	.byte	0x1e
	.4byte	.LASF229
	.8byte	0x202072300000000
	.byte	0x1e
	.4byte	.LASF230
	.8byte	0x204072300000000
	.byte	0x1e
	.4byte	.LASF231
	.8byte	0x108072300000000
	.byte	0x1e
	.4byte	.LASF232
	.8byte	0x20c072300000000
	.byte	0x1e
	.4byte	.LASF233
	.8byte	0x20e072300000000
	.byte	0x1e
	.4byte	.LASF234
	.8byte	0x1070729030d0729
	.byte	0x1d
	.4byte	.LASF235
	.4byte	0x5000728
	.byte	0x1d
	.4byte	.LASF236
	.4byte	0x5080728
	.byte	0x1e
	.4byte	.LASF237
	.8byte	0x106072800000000
	.byte	0x1e
	.4byte	.LASF238
	.8byte	0x10e072800000000
	.byte	0x1e
	.4byte	.LASF239
	.8byte	0x10e071e00000000
	.byte	0x1d
	.4byte	.LASF240
	.4byte	0x2090725
	.byte	0x1e
	.4byte	.LASF241
	.8byte	0x101030000000000
	.byte	0x1e
	.4byte	.LASF242
	.8byte	0x103030000000000
	.byte	0x1e
	.4byte	.LASF243
	.8byte	0x108090000000000
	.byte	0
	.byte	0x3
	.4byte	.LASF244
	.byte	0x7
	.byte	0xdd
	.byte	0x3
	.4byte	0x9d2
	.byte	0x19
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0x9
	.byte	0x2e
	.byte	0x6
	.4byte	0xc85
	.byte	0xf
	.4byte	.LASF245
	.byte	0
	.byte	0xf
	.4byte	.LASF246
	.byte	0x1
	.byte	0xf
	.4byte	.LASF247
	.byte	0x2
	.byte	0xf
	.4byte	.LASF248
	.byte	0x3
	.byte	0xf
	.4byte	.LASF249
	.byte	0x4
	.byte	0xf
	.4byte	.LASF250
	.byte	0x5
	.byte	0xf
	.4byte	.LASF251
	.byte	0x6
	.byte	0xf
	.4byte	.LASF252
	.byte	0x7
	.byte	0xf
	.4byte	.LASF253
	.byte	0x8
	.byte	0xf
	.4byte	.LASF254
	.byte	0x9
	.byte	0xf
	.4byte	.LASF255
	.byte	0xa
	.byte	0
	.byte	0x1f
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0xa
	.2byte	0x42b
	.byte	0xe
	.4byte	0xcb9
	.byte	0xf
	.4byte	.LASF256
	.byte	0
	.byte	0xf
	.4byte	.LASF257
	.byte	0x1
	.byte	0xf
	.4byte	.LASF258
	.byte	0x2
	.byte	0xf
	.4byte	.LASF259
	.byte	0x3
	.byte	0xf
	.4byte	.LASF260
	.byte	0x4
	.byte	0xf
	.4byte	.LASF261
	.byte	0x5
	.byte	0
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF262
	.byte	0x19
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0xb
	.byte	0x34
	.byte	0xe
	.4byte	0xce1
	.byte	0xf
	.4byte	.LASF263
	.byte	0
	.byte	0xf
	.4byte	.LASF264
	.byte	0x1
	.byte	0xf
	.4byte	.LASF265
	.byte	0x2
	.byte	0
	.byte	0x3
	.4byte	.LASF266
	.byte	0xb
	.byte	0x38
	.byte	0x3
	.4byte	0xcc0
	.byte	0x19
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0xb
	.byte	0x45
	.byte	0xe
	.4byte	0xd0e
	.byte	0xf
	.4byte	.LASF267
	.byte	0x1
	.byte	0xf
	.4byte	.LASF268
	.byte	0x2
	.byte	0xf
	.4byte	.LASF269
	.byte	0x3
	.byte	0
	.byte	0x3
	.4byte	.LASF270
	.byte	0xb
	.byte	0x49
	.byte	0x3
	.4byte	0xced
	.byte	0x16
	.4byte	.LASF271
	.byte	0x38
	.byte	0xb
	.byte	0x66
	.byte	0x8
	.4byte	0xd69
	.byte	0x17
	.4byte	.LASF272
	.byte	0xb
	.byte	0x67
	.byte	0x15
	.4byte	0xd6e
	.byte	0
	.byte	0x17
	.4byte	.LASF273
	.byte	0xb
	.byte	0x68
	.byte	0x11
	.4byte	0xc28
	.byte	0x8
	.byte	0x17
	.4byte	.LASF274
	.byte	0xb
	.byte	0x69
	.byte	0xe
	.4byte	0x44d
	.byte	0x10
	.byte	0x17
	.4byte	.LASF275
	.byte	0xb
	.byte	0x6a
	.byte	0xe
	.4byte	0x44d
	.byte	0x14
	.byte	0x17
	.4byte	.LASF276
	.byte	0xb
	.byte	0x6b
	.byte	0xf
	.4byte	0xd74
	.byte	0x18
	.byte	0
	.byte	0x5
	.4byte	0xd1a
	.byte	0x6
	.byte	0x4
	.4byte	0x748
	.byte	0xb
	.4byte	0x71c
	.4byte	0xd84
	.byte	0xc
	.4byte	0x1b1
	.byte	0x7
	.byte	0
	.byte	0x16
	.4byte	.LASF277
	.byte	0x14
	.byte	0xb
	.byte	0x71
	.byte	0x8
	.4byte	0xdd3
	.byte	0x17
	.4byte	.LASF79
	.byte	0xb
	.byte	0x72
	.byte	0xd
	.4byte	0x441
	.byte	0
	.byte	0x17
	.4byte	.LASF278
	.byte	0xb
	.byte	0x73
	.byte	0xe
	.4byte	0x44d
	.byte	0x4
	.byte	0x17
	.4byte	.LASF279
	.byte	0xb
	.byte	0x74
	.byte	0xe
	.4byte	0x44d
	.byte	0x8
	.byte	0x17
	.4byte	.LASF85
	.byte	0xb
	.byte	0x75
	.byte	0x9
	.4byte	0xcb9
	.byte	0xc
	.byte	0x17
	.4byte	.LASF280
	.byte	0xb
	.byte	0x76
	.byte	0x16
	.4byte	0xd0e
	.byte	0x10
	.byte	0
	.byte	0x16
	.4byte	.LASF281
	.byte	0x10
	.byte	0xb
	.byte	0x7c
	.byte	0x8
	.4byte	0xe22
	.byte	0x17
	.4byte	.LASF80
	.byte	0xb
	.byte	0x7d
	.byte	0xe
	.4byte	0x44d
	.byte	0
	.byte	0x17
	.4byte	.LASF282
	.byte	0xb
	.byte	0x7e
	.byte	0xe
	.4byte	0x44d
	.byte	0x4
	.byte	0x17
	.4byte	.LASF283
	.byte	0xb
	.byte	0x7f
	.byte	0xe
	.4byte	0x44d
	.byte	0x8
	.byte	0x18
	.string	"pol"
	.byte	0xb
	.byte	0x80
	.byte	0x9
	.4byte	0xcb9
	.byte	0xc
	.byte	0x17
	.4byte	.LASF284
	.byte	0xb
	.byte	0x81
	.byte	0x9
	.4byte	0xcb9
	.byte	0xd
	.byte	0
	.byte	0x16
	.4byte	.LASF285
	.byte	0x18
	.byte	0xb
	.byte	0x9a
	.byte	0x8
	.4byte	0xe57
	.byte	0x17
	.4byte	.LASF272
	.byte	0xb
	.byte	0x9b
	.byte	0x15
	.4byte	0xd6e
	.byte	0
	.byte	0x17
	.4byte	.LASF286
	.byte	0xb
	.byte	0x9c
	.byte	0x18
	.4byte	0xdd3
	.byte	0x4
	.byte	0x17
	.4byte	.LASF287
	.byte	0xb
	.byte	0x9d
	.byte	0xf
	.4byte	0xce1
	.byte	0x14
	.byte	0
	.byte	0x16
	.4byte	.LASF288
	.byte	0xd4
	.byte	0xb
	.byte	0xa3
	.byte	0x8
	.4byte	0xeda
	.byte	0x17
	.4byte	.LASF289
	.byte	0xb
	.byte	0xa4
	.byte	0x1f
	.4byte	0xeda
	.byte	0
	.byte	0x17
	.4byte	.LASF290
	.byte	0xb
	.byte	0xa5
	.byte	0xe
	.4byte	0x44d
	.byte	0xc0
	.byte	0x17
	.4byte	.LASF291
	.byte	0xb
	.byte	0xa6
	.byte	0xe
	.4byte	0x44d
	.byte	0xc4
	.byte	0x17
	.4byte	.LASF292
	.byte	0xb
	.byte	0xa7
	.byte	0xe
	.4byte	0x44d
	.byte	0xc8
	.byte	0x17
	.4byte	.LASF293
	.byte	0xb
	.byte	0xa8
	.byte	0xd
	.4byte	0x441
	.byte	0xcc
	.byte	0x17
	.4byte	.LASF294
	.byte	0xb
	.byte	0xa9
	.byte	0xd
	.4byte	0x441
	.byte	0xcd
	.byte	0x17
	.4byte	.LASF295
	.byte	0xb
	.byte	0xaa
	.byte	0x9
	.4byte	0xcb9
	.byte	0xce
	.byte	0x17
	.4byte	.LASF296
	.byte	0xb
	.byte	0xab
	.byte	0x9
	.4byte	0xcb9
	.byte	0xcf
	.byte	0x17
	.4byte	.LASF297
	.byte	0xb
	.byte	0xac
	.byte	0x9
	.4byte	0xcb9
	.byte	0xd0
	.byte	0
	.byte	0xb
	.4byte	0xe22
	.4byte	0xeea
	.byte	0xc
	.4byte	0x1b1
	.byte	0x7
	.byte	0
	.byte	0x19
	.byte	0x7
	.byte	0x4
	.4byte	0x1b1
	.byte	0xc
	.byte	0x35
	.byte	0xe
	.4byte	0xf1d
	.byte	0xf
	.4byte	.LASF298
	.byte	0
	.byte	0xf
	.4byte	.LASF299
	.byte	0x1
	.byte	0xf
	.4byte	.LASF300
	.byte	0x2
	.byte	0xf
	.4byte	.LASF301
	.byte	0x3
	.byte	0xf
	.4byte	.LASF302
	.byte	0x4
	.byte	0xf
	.4byte	.LASF303
	.byte	0x5
	.byte	0
	.byte	0x20
	.4byte	.LASF317
	.byte	0xe
	.byte	0x1d
	.byte	0x21
	.4byte	0xd69
	.byte	0x16
	.4byte	.LASF304
	.byte	0x10
	.byte	0xd
	.byte	0x20
	.byte	0x8
	.4byte	0xf6b
	.byte	0x17
	.4byte	.LASF305
	.byte	0xd
	.byte	0x22
	.byte	0xe
	.4byte	0x44d
	.byte	0
	.byte	0x17
	.4byte	.LASF306
	.byte	0xd
	.byte	0x23
	.byte	0x9
	.4byte	0x8d
	.byte	0x4
	.byte	0x17
	.4byte	.LASF57
	.byte	0xd
	.byte	0x24
	.byte	0x9
	.4byte	0x8d
	.byte	0x8
	.byte	0x17
	.4byte	.LASF307
	.byte	0xd
	.byte	0x25
	.byte	0x10
	.4byte	0x14d
	.byte	0xc
	.byte	0
	.byte	0x21
	.4byte	.LASF308
	.2byte	0x134
	.byte	0x1
	.byte	0x36
	.byte	0x8
	.4byte	0xfe7
	.byte	0x18
	.string	"dev"
	.byte	0x1
	.byte	0x38
	.byte	0x1a
	.4byte	0x55f
	.byte	0
	.byte	0x17
	.4byte	.LASF25
	.byte	0x1
	.byte	0x39
	.byte	0x11
	.4byte	0x423
	.byte	0x48
	.byte	0x17
	.4byte	.LASF309
	.byte	0x1
	.byte	0x3b
	.byte	0x17
	.4byte	0xe57
	.byte	0x4c
	.byte	0x22
	.4byte	.LASF310
	.byte	0x1
	.byte	0x3c
	.byte	0x1f
	.4byte	0xfe7
	.2byte	0x120
	.byte	0x22
	.4byte	.LASF304
	.byte	0x1
	.byte	0x3d
	.byte	0x16
	.4byte	0xfed
	.2byte	0x124
	.byte	0x22
	.4byte	.LASF311
	.byte	0x1
	.byte	0x3e
	.byte	0x16
	.4byte	0xfed
	.2byte	0x128
	.byte	0x22
	.4byte	.LASF312
	.byte	0x1
	.byte	0x3f
	.byte	0xf
	.4byte	0x81
	.2byte	0x12c
	.byte	0x22
	.4byte	.LASF313
	.byte	0x1
	.byte	0x42
	.byte	0x16
	.4byte	0x463
	.2byte	0x130
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0xd69
	.byte	0x6
	.byte	0x4
	.4byte	0xf29
	.byte	0x23
	.4byte	.LASF314
	.byte	0x1
	.byte	0x55
	.byte	0x51
	.4byte	0xf6b
	.byte	0x5
	.byte	0x3
	.4byte	pwm0
	.byte	0xb
	.4byte	0x1020
	.4byte	0x1015
	.byte	0xc
	.4byte	0x1b1
	.byte	0x1
	.byte	0
	.byte	0x5
	.4byte	0x1005
	.byte	0x6
	.byte	0x4
	.4byte	0xf6b
	.byte	0x5
	.4byte	0x101a
	.byte	0x23
	.4byte	.LASF315
	.byte	0x1
	.byte	0x64
	.byte	0x23
	.4byte	0x1015
	.byte	0x5
	.byte	0x3
	.4byte	rockchip_pwm_table
	.byte	0x23
	.4byte	.LASF316
	.byte	0x1
	.byte	0xee
	.byte	0x1a
	.4byte	0x520
	.byte	0x5
	.byte	0x3
	.4byte	rockchip_pwm_ops
	.byte	0x24
	.4byte	.LASF318
	.byte	0x1
	.2byte	0x10f
	.byte	0x27
	.4byte	0xdc
	.byte	0x5
	.byte	0x3
	.4byte	__rt_init_rockchip_rt_hw_pwm_init
	.byte	0x25
	.4byte	.LASF349
	.byte	0x1
	.byte	0xf3
	.byte	0x5
	.4byte	0x8d
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.byte	0x1
	.byte	0x9c
	.4byte	0x10eb
	.byte	0x26
	.string	"pwm"
	.byte	0x1
	.byte	0xf5
	.byte	0x21
	.4byte	0x10eb
	.4byte	.LLST0
	.byte	0x27
	.4byte	.LASF290
	.byte	0x1
	.byte	0xf6
	.byte	0x11
	.4byte	0x67
	.4byte	.LLST1
	.byte	0x23
	.4byte	.LASF310
	.byte	0x1
	.byte	0xf7
	.byte	0x1f
	.4byte	0xfe7
	.byte	0x1
	.byte	0x59
	.byte	0x28
	.4byte	.LVL5
	.4byte	0x1387
	.byte	0x28
	.4byte	.LVL6
	.4byte	0x1387
	.byte	0x28
	.4byte	.LVL7
	.4byte	0x1393
	.byte	0x28
	.4byte	.LVL8
	.4byte	0x139f
	.byte	0x28
	.4byte	.LVL11
	.4byte	0x13ab
	.byte	0x28
	.4byte	.LVL12
	.4byte	0x13b8
	.byte	0x29
	.4byte	.LVL14
	.4byte	0x13c4
	.byte	0x2a
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x83
	.byte	0
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x1020
	.byte	0x2b
	.4byte	.LASF350
	.byte	0x1
	.byte	0x96
	.byte	0x11
	.4byte	0xac
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.byte	0x1
	.byte	0x9c
	.4byte	0x12b4
	.byte	0x2c
	.4byte	.LASF319
	.byte	0x1
	.byte	0x96
	.byte	0x3c
	.4byte	0x559
	.4byte	.LLST2
	.byte	0x2d
	.string	"cmd"
	.byte	0x1
	.byte	0x96
	.byte	0x48
	.4byte	0x8d
	.4byte	.LLST3
	.byte	0x2d
	.string	"arg"
	.byte	0x1
	.byte	0x96
	.byte	0x53
	.4byte	0x1c4
	.4byte	.LLST4
	.byte	0x27
	.4byte	.LASF320
	.byte	0x1
	.byte	0x98
	.byte	0x22
	.4byte	0x12b4
	.4byte	.LLST5
	.byte	0x26
	.string	"pwm"
	.byte	0x1
	.byte	0x99
	.byte	0x1a
	.4byte	0x101a
	.4byte	.LLST6
	.byte	0x27
	.4byte	.LASF321
	.byte	0x1
	.byte	0x9a
	.byte	0x18
	.4byte	0x12ba
	.4byte	.LLST7
	.byte	0x23
	.4byte	.LASF322
	.byte	0x1
	.byte	0x9b
	.byte	0x1b
	.4byte	0xd84
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x26
	.string	"ret"
	.byte	0x1
	.byte	0x9c
	.byte	0xe
	.4byte	0xac
	.4byte	.LLST8
	.byte	0x28
	.4byte	.LVL19
	.4byte	0x1393
	.byte	0x28
	.4byte	.LVL20
	.4byte	0x1393
	.byte	0x2e
	.4byte	.LVL21
	.4byte	0x13d0
	.4byte	0x11b0
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LVL22
	.4byte	0x13b8
	.byte	0x2e
	.4byte	.LVL23
	.4byte	0x13dd
	.4byte	0x11cd
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LVL25
	.4byte	0x13b8
	.byte	0x2e
	.4byte	.LVL31
	.4byte	0x13ea
	.4byte	0x11ea
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x28
	.4byte	.LVL32
	.4byte	0x1393
	.byte	0x2e
	.4byte	.LVL33
	.4byte	0x13f6
	.4byte	0x1207
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL34
	.4byte	0x1403
	.4byte	0x1221
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x2a
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0
	.byte	0x28
	.4byte	.LVL35
	.4byte	0x1393
	.byte	0x2e
	.4byte	.LVL36
	.4byte	0x140f
	.4byte	0x123e
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL37
	.4byte	0x141c
	.4byte	0x1252
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL39
	.4byte	0x1429
	.4byte	0x1266
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL41
	.4byte	0x1436
	.4byte	0x127a
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL43
	.4byte	0x1443
	.4byte	0x128e
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2e
	.4byte	.LVL45
	.4byte	0x1450
	.4byte	0x12a1
	.byte	0x2a
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x28
	.4byte	.LVL46
	.4byte	0x145c
	.byte	0x28
	.4byte	.LVL49
	.4byte	0x1468
	.byte	0
	.byte	0x6
	.byte	0x4
	.4byte	0x4aa
	.byte	0x6
	.byte	0x4
	.4byte	0xe57
	.byte	0x2f
	.4byte	.LASF351
	.byte	0x1
	.byte	0x76
	.byte	0xd
	.byte	0x1
	.4byte	0x12f0
	.byte	0x30
	.string	"pwm"
	.byte	0x1
	.byte	0x76
	.byte	0x33
	.4byte	0x101a
	.byte	0x31
	.4byte	.LASF321
	.byte	0x1
	.byte	0x78
	.byte	0x18
	.4byte	0x12ba
	.byte	0x32
	.string	"i"
	.byte	0x1
	.byte	0x79
	.byte	0x9
	.4byte	0x8d
	.byte	0
	.byte	0x33
	.4byte	.LASF352
	.byte	0x1
	.byte	0x55
	.byte	0xb4
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.byte	0x1
	.byte	0x9c
	.4byte	0x1387
	.byte	0x2d
	.string	"irq"
	.byte	0x1
	.byte	0x55
	.byte	0xca
	.4byte	0x8d
	.4byte	.LLST9
	.byte	0x2c
	.4byte	.LASF323
	.byte	0x1
	.byte	0x55
	.byte	0xd5
	.4byte	0x1c4
	.4byte	.LLST10
	.byte	0x34
	.4byte	0x12c0
	.4byte	.LBB4
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x55
	.byte	0xde
	.byte	0x35
	.4byte	0x12cd
	.byte	0x6
	.byte	0x3
	.4byte	pwm0
	.byte	0x9f
	.byte	0x36
	.4byte	.Ldebug_ranges0+0
	.byte	0x37
	.4byte	0x12d9
	.byte	0x6
	.byte	0x3
	.4byte	pwm0+76
	.byte	0x9f
	.byte	0x38
	.4byte	0x12e5
	.4byte	.LLST11
	.byte	0x28
	.4byte	.LVL51
	.4byte	0x1474
	.byte	0x39
	.4byte	.LVL54
	.4byte	0x1481
	.byte	0x29
	.4byte	.LVL55
	.4byte	0x148e
	.byte	0x2a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0x2a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x3a
	.4byte	.LASF324
	.4byte	.LASF324
	.byte	0xd
	.byte	0x5c
	.byte	0x12
	.byte	0x3a
	.4byte	.LASF325
	.4byte	.LASF325
	.byte	0xd
	.byte	0x5e
	.byte	0xa
	.byte	0x3a
	.4byte	.LASF326
	.4byte	.LASF326
	.byte	0xd
	.byte	0x61
	.byte	0xa
	.byte	0x3b
	.4byte	.LASF327
	.4byte	.LASF327
	.byte	0xb
	.2byte	0x131
	.byte	0xc
	.byte	0x3a
	.4byte	.LASF328
	.4byte	.LASF328
	.byte	0xd
	.byte	0x5f
	.byte	0xa
	.byte	0x3a
	.4byte	.LASF329
	.4byte	.LASF329
	.byte	0x6
	.byte	0x40
	.byte	0xa
	.byte	0x3b
	.4byte	.LASF330
	.4byte	.LASF330
	.byte	0xb
	.2byte	0x12f
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF331
	.4byte	.LASF331
	.byte	0xb
	.2byte	0x130
	.byte	0xc
	.byte	0x3a
	.4byte	.LASF332
	.4byte	.LASF332
	.byte	0xb
	.byte	0xfd
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF333
	.4byte	.LASF333
	.byte	0xb
	.2byte	0x103
	.byte	0xc
	.byte	0x3a
	.4byte	.LASF334
	.4byte	.LASF334
	.byte	0xb
	.byte	0xfb
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF335
	.4byte	.LASF335
	.byte	0xb
	.2byte	0x10c
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF336
	.4byte	.LASF336
	.byte	0xb
	.2byte	0x10b
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF337
	.4byte	.LASF337
	.byte	0xb
	.2byte	0x138
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF338
	.4byte	.LASF338
	.byte	0xb
	.2byte	0x136
	.byte	0xc
	.byte	0x3b
	.4byte	.LASF339
	.4byte	.LASF339
	.byte	0xb
	.2byte	0x137
	.byte	0xc
	.byte	0x3a
	.4byte	.LASF340
	.4byte	.LASF340
	.byte	0x5
	.byte	0x5a
	.byte	0x12
	.byte	0x3a
	.4byte	.LASF341
	.4byte	.LASF341
	.byte	0x5
	.byte	0x59
	.byte	0x6
	.byte	0x3a
	.4byte	.LASF342
	.4byte	.LASF342
	.byte	0x5
	.byte	0x58
	.byte	0x6
	.byte	0x3b
	.4byte	.LASF343
	.4byte	.LASF343
	.byte	0xf
	.2byte	0x1b8
	.byte	0x6
	.byte	0x3b
	.4byte	.LASF344
	.4byte	.LASF344
	.byte	0xf
	.2byte	0x1b9
	.byte	0x6
	.byte	0x3a
	.4byte	.LASF345
	.4byte	.LASF345
	.byte	0xb
	.byte	0xfa
	.byte	0xc
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
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x16
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
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0xf
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x26
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x35
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
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
	.byte	0x16
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
	.byte	0x17
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
	.byte	0x18
	.byte	0xd
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
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x1b
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
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
	.byte	0x1c
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
	.byte	0x1d
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0x7
	.byte	0
	.byte	0
	.byte	0x1f
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
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
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
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
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
	.byte	0x22
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
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x23
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
	.byte	0x24
	.byte	0x34
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
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
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
	.byte	0x26
	.byte	0x34
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
	.byte	0x27
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
	.byte	0x28
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x29
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0x2c
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
	.byte	0x2d
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
	.byte	0x2e
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2f
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
	.byte	0x30
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
	.byte	0x31
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
	.byte	0x32
	.byte	0x34
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
	.byte	0x33
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
	.byte	0x34
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
	.byte	0
	.byte	0
	.byte	0x35
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x36
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x37
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x38
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x39
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
	.byte	0x3a
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
	.byte	0x3b
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0
	.4byte	.LVL1
	.2byte	0x6
	.byte	0x3
	.4byte	rockchip_pwm_table
	.byte	0x9f
	.4byte	.LVL1
	.4byte	.LVL2
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL3
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL13
	.4byte	.LVL14
	.2byte	0x3
	.byte	0x78
	.byte	0x7c
	.byte	0x9f
	.4byte	.LVL14
	.4byte	.LFE42
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL10
	.4byte	.LVL11-1
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL15
	.4byte	.LVL18
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL18
	.4byte	.LFE41
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL15
	.4byte	.LVL19-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL19-1
	.4byte	.LVL29
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL15
	.4byte	.LVL19-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL19-1
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL24
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL38
	.4byte	.LVL40
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL16
	.4byte	.LVL19-1
	.2byte	0x1
	.byte	0x5c
	.4byte	.LVL19-1
	.4byte	.LVL24
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL24
	.4byte	.LVL30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL38
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL38
	.4byte	.LVL40
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL44
	.4byte	.LVL47
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL47
	.4byte	.LVL48
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5c
	.byte	0x9f
	.4byte	.LVL48
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL16
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x59
	.4byte	.LVL27
	.4byte	.LVL28
	.2byte	0x4
	.byte	0x82
	.byte	0xb4,0x7f
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x59
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL17
	.4byte	.LVL28
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL30
	.4byte	.LFE41
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL17
	.4byte	.LVL24
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL26
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL26
	.4byte	.LVL30
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL30
	.4byte	.LVL38
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL38
	.4byte	.LVL40
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL40
	.4byte	.LVL42
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL42
	.4byte	.LVL44
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL44
	.4byte	.LFE41
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL50
	.4byte	.LVL51-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL51-1
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL50
	.4byte	.LVL51-1
	.2byte	0x1
	.byte	0x5b
	.4byte	.LVL51-1
	.4byte	.LFE39
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL51
	.4byte	.LVL52
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL52
	.4byte	.LVL53
	.2byte	0x1
	.byte	0x58
	.4byte	.LVL54
	.4byte	.LFE39
	.2byte	0x1
	.byte	0x58
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
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.4byte	.LFB41
	.4byte	.LFE41-.LFB41
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB4
	.4byte	.LBE4
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB9
	.4byte	.LBE9
	.4byte	0
	.4byte	0
	.4byte	.LFB42
	.4byte	.LFE42
	.4byte	.LFB41
	.4byte	.LFE41
	.4byte	.LFB39
	.4byte	.LFE39
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF5:
	.string	"rt_uint8_t"
.LASF2:
	.string	"long int"
.LASF305:
	.string	"gate_id"
.LASF189:
	.string	"CLOCK_Name"
.LASF19:
	.string	"prev"
.LASF187:
	.string	"COUNTER_LOW"
.LASF271:
	.string	"HAL_PWM_DEV"
.LASF16:
	.string	"rt_off_t"
.LASF171:
	.string	"PWRMATCH_CTRL"
.LASF25:
	.string	"name"
.LASF297:
	.string	"waveSupport"
.LASF261:
	.string	"GRF_INFO_NUM"
.LASF99:
	.string	"MIPI_ISP_IRQn"
.LASF346:
	.string	"GNU C99 10.2.0 -march=rv32imc -mabi=ilp32 -mcmodel=medany -msmall-data-limit= 8 -march=rv32imc -g -Os -std=gnu99 -ffunction-sections -fdata-sections"
.LASF101:
	.string	"ISP_IRQn"
.LASF184:
	.string	"RESERVED01D0"
.LASF250:
	.string	"PM_RUNTIME_TYPE_UART"
.LASF150:
	.string	"FSPI1_IRQn"
.LASF145:
	.string	"LPMCU_MBOX3_AP_IRQn"
.LASF306:
	.string	"enable_count"
.LASF49:
	.string	"RT_Device_Class_Miscellaneous"
.LASF38:
	.string	"RT_Device_Class_Graphic"
.LASF57:
	.string	"ref_count"
.LASF273:
	.string	"clkID"
.LASF243:
	.string	"SCLK_SFC_2X_PMU1"
.LASF76:
	.string	"PWM_CENTER_ALIGNED"
.LASF48:
	.string	"RT_Device_Class_Timer"
.LASF47:
	.string	"RT_Device_Class_Portal"
.LASF102:
	.string	"I2C0_IRQn"
.LASF115:
	.string	"GPIO4_IRQn"
.LASF66:
	.string	"control"
.LASF135:
	.string	"HPMCU_MBOX1_AP_IRQn"
.LASF132:
	.string	"PWM2_CH2_IRQn"
.LASF199:
	.string	"PCLK_PERI_ROOT"
.LASF18:
	.string	"next"
.LASF141:
	.string	"HPMCU_MBOX3_BB_IRQn"
.LASF256:
	.string	"GRF_MUX_INFO"
.LASF339:
	.string	"HAL_PWM_GlobalEnable"
.LASF334:
	.string	"HAL_PWM_SetConfig"
.LASF73:
	.string	"rt_device_class_type"
.LASF322:
	.string	"hal_config"
.LASF50:
	.string	"RT_Device_Class_Sensor"
.LASF174:
	.string	"PWRMATCH_LD"
.LASF12:
	.string	"rt_base_t"
.LASF35:
	.string	"RT_Device_Class_CAN"
.LASF159:
	.string	"DUTY"
.LASF331:
	.string	"HAL_PWM_Disable"
.LASF288:
	.string	"PWM_HANDLE"
.LASF179:
	.string	"RESERVED0160"
.LASF139:
	.string	"HPMCU_MBOX1_BB_IRQn"
.LASF1:
	.string	"short int"
.LASF244:
	.string	"eCLOCK_Name"
.LASF269:
	.string	"HAL_PWM_UNALIGNED"
.LASF86:
	.string	"aligned"
.LASF200:
	.string	"CLK_TSADC"
.LASF265:
	.string	"HAL_PWM_CAPTURE"
.LASF41:
	.string	"RT_Device_Class_USBHost"
.LASF287:
	.string	"mode"
.LASF275:
	.string	"pclkGateID"
.LASF121:
	.string	"GPIO11_IRQn"
.LASF103:
	.string	"I2C1_IRQn"
.LASF125:
	.string	"PWM0_CH3_IRQn"
.LASF292:
	.string	"scaler"
.LASF216:
	.string	"CCLK_SDMMC0"
.LASF217:
	.string	"CCLK_SDMMC1"
.LASF302:
	.string	"PWR_CTRL_VOLT_ST"
.LASF203:
	.string	"CLK_UART0_SRC"
.LASF266:
	.string	"ePWM_Mode"
.LASF44:
	.string	"RT_Device_Class_SDIO"
.LASF205:
	.string	"CLK_UART0"
.LASF208:
	.string	"CLK_UART1"
.LASF9:
	.string	"long unsigned int"
.LASF53:
	.string	"rt_device_t"
.LASF142:
	.string	"LPMCU_MBOX0_AP_IRQn"
.LASF28:
	.string	"list"
.LASF58:
	.string	"device_id"
.LASF209:
	.string	"CLK_UART2_SRC"
.LASF259:
	.string	"GRF_SRT_INFO"
.LASF319:
	.string	"device"
.LASF149:
	.string	"LPMCU_MBOX3_BB_IRQn"
.LASF71:
	.string	"uint32_t"
.LASF249:
	.string	"PM_RUNTIME_TYPE_STORAGE"
.LASF221:
	.string	"HCLK_HPMCU_SRC"
.LASF255:
	.string	"PM_RUNTIME_TYPE_END"
.LASF285:
	.string	"PWM_CHANNEL_HANDLE"
.LASF127:
	.string	"PWM1_CH1_IRQn"
.LASF270:
	.string	"ePWM_alignedMode"
.LASF183:
	.string	"FREQ_RESULT_VALUE"
.LASF225:
	.string	"CLK_PWM0"
.LASF226:
	.string	"CLK_PWM1"
.LASF227:
	.string	"CLK_PWM2"
.LASF82:
	.string	"count"
.LASF10:
	.string	"long long unsigned int"
.LASF204:
	.string	"CLK_UART0_FRAC"
.LASF276:
	.string	"irqNum"
.LASF286:
	.string	"result"
.LASF165:
	.string	"INT_EN"
.LASF294:
	.string	"globalMask"
.LASF40:
	.string	"RT_Device_Class_USBDevice"
.LASF113:
	.string	"GPIO9_IRQn"
.LASF100:
	.string	"MI_ISP_IRQn"
.LASF114:
	.string	"GPIO1_IRQn"
.LASF60:
	.string	"tx_complete"
.LASF344:
	.string	"rt_interrupt_leave"
.LASF329:
	.string	"rt_device_pwm_register"
.LASF182:
	.string	"FREQ_TIMER_VALUE"
.LASF228:
	.string	"DCLK_DECOM"
.LASF264:
	.string	"HAL_PWM_CONTINUOUS"
.LASF177:
	.string	"PWRMATCH_VALUE"
.LASF309:
	.string	"instance"
.LASF247:
	.string	"PM_RUNTIME_TYPE_AUDIO"
.LASF36:
	.string	"RT_Device_Class_RTC"
.LASF235:
	.string	"CLK_REF_MIPI0_SRC"
.LASF188:
	.string	"COUNTER_HIGH"
.LASF152:
	.string	"IRQn_Type"
.LASF279:
	.string	"dutyNS"
.LASF173:
	.string	"PWRMATCH_HPRE"
.LASF350:
	.string	"rockchip_pwm_control"
.LASF34:
	.string	"RT_Device_Class_MTD"
.LASF105:
	.string	"I2C3_IRQn"
.LASF178:
	.string	"PWRCAPTURE_VALUE"
.LASF238:
	.string	"CLK_MIPI1_OUT2IO"
.LASF83:
	.string	"offset"
.LASF201:
	.string	"CLK_TSADC_TSEN"
.LASF146:
	.string	"LPMCU_MBOX0_BB_IRQn"
.LASF20:
	.string	"rt_list_t"
.LASF262:
	.string	"_Bool"
.LASF108:
	.string	"UART1_IRQn"
.LASF98:
	.string	"VICAP_IRQn"
.LASF45:
	.string	"RT_Device_Class_PM"
.LASF219:
	.string	"LSCLK_PERI_SRC"
.LASF268:
	.string	"HAL_PWM_CENTER_ALIGNED"
.LASF230:
	.string	"CLK_PKA_CRYPTO"
.LASF136:
	.string	"HPMCU_MBOX2_AP_IRQn"
.LASF274:
	.string	"clkGateID"
.LASF290:
	.string	"freq"
.LASF325:
	.string	"clk_enable"
.LASF93:
	.string	"TIMER3_IRQn"
.LASF327:
	.string	"HAL_PWM_Init"
.LASF129:
	.string	"PWM1_CH3_IRQn"
.LASF310:
	.string	"hal_dev"
.LASF229:
	.string	"CLK_CORE_CRYPTO"
.LASF166:
	.string	"RESERVED0078"
.LASF245:
	.string	"PM_RUNTIME_TYPE_INTF"
.LASF352:
	.string	"rockchip_pwm0_irq"
.LASF213:
	.string	"CLK_SAI_FRAC"
.LASF252:
	.string	"PM_RUNTIME_TYPE_SPI"
.LASF210:
	.string	"CLK_UART2_FRAC"
.LASF158:
	.string	"PERIOD"
.LASF140:
	.string	"HPMCU_MBOX2_BB_IRQn"
.LASF30:
	.string	"char"
.LASF307:
	.string	"node"
.LASF345:
	.string	"HAL_PWM_ChannelIRQHandler"
.LASF315:
	.string	"rockchip_pwm_table"
.LASF301:
	.string	"PWR_CTRL_PWR_SSPD"
.LASF63:
	.string	"close"
.LASF272:
	.string	"pReg"
.LASF131:
	.string	"PWM2_CH1_IRQn"
.LASF111:
	.string	"GPIO3_IRQn"
.LASF14:
	.string	"rt_err_t"
.LASF202:
	.string	"CLK_SARADC"
.LASF333:
	.string	"HAL_PWM_SetOutputOffset"
.LASF54:
	.string	"rt_device"
.LASF78:
	.string	"rt_pwm_configuration"
.LASF70:
	.string	"uint8_t"
.LASF251:
	.string	"PM_RUNTIME_TYPE_I2C"
.LASF260:
	.string	"GRF_SMT_INFO"
.LASF347:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/common/drivers/drv_pwm.c"
.LASF56:
	.string	"open_flag"
.LASF143:
	.string	"LPMCU_MBOX1_AP_IRQn"
.LASF324:
	.string	"get_clk_gate_from_id"
.LASF164:
	.string	"INTSTS"
.LASF59:
	.string	"rx_indicate"
.LASF67:
	.string	"user_data"
.LASF162:
	.string	"ENABLE_DELAY"
.LASF312:
	.string	"is_int_enable"
.LASF3:
	.string	"long long int"
.LASF65:
	.string	"write"
.LASF8:
	.string	"rt_uint32_t"
.LASF342:
	.string	"rt_hw_interrupt_mask"
.LASF223:
	.string	"CLK_I2C_PERI"
.LASF117:
	.string	"GPIO10_IRQn"
.LASF186:
	.string	"COUNTER_CTRL"
.LASF97:
	.string	"FSPI0_IRQn"
.LASF233:
	.string	"CLK_COUNTER_PWM0"
.LASF43:
	.string	"RT_Device_Class_SPIDevice"
.LASF176:
	.string	"PWRMATCH_HD_ONE"
.LASF291:
	.string	"channelNum"
.LASF240:
	.string	"CLK_ISP_GPLL_SRC"
.LASF124:
	.string	"PWM0_CH2_IRQn"
.LASF191:
	.string	"PLL_GPLL"
.LASF242:
	.string	"LSCLK_VI_ROOT"
.LASF163:
	.string	"RESERVED0034"
.LASF175:
	.string	"PWRMATCH_HD_ZERO"
.LASF89:
	.string	"SARADC_IRQn"
.LASF206:
	.string	"CLK_UART1_SRC"
.LASF17:
	.string	"init_fn_t"
.LASF277:
	.string	"HAL_PWM_CONFIG"
.LASF144:
	.string	"LPMCU_MBOX2_AP_IRQn"
.LASF95:
	.string	"TIMER5_IRQn"
.LASF13:
	.string	"rt_ubase_t"
.LASF128:
	.string	"PWM1_CH2_IRQn"
.LASF51:
	.string	"RT_Device_Class_Touch"
.LASF6:
	.string	"rt_uint16_t"
.LASF90:
	.string	"TIMER0_IRQn"
.LASF323:
	.string	"param"
.LASF23:
	.string	"rt_slist_t"
.LASF126:
	.string	"PWM1_CH0_IRQn"
.LASF246:
	.string	"PM_RUNTIME_TYPE_DISPLAY"
.LASF84:
	.string	"mask"
.LASF311:
	.string	"pclk_gate"
.LASF169:
	.string	"RESERVED00C8"
.LASF88:
	.string	"rt_device_pwm"
.LASF314:
	.string	"pwm0"
.LASF253:
	.string	"PM_RUNTIME_TYPE_CIF"
.LASF96:
	.string	"SPI0_IRQn"
.LASF296:
	.string	"counterSupport"
.LASF298:
	.string	"PWR_CTRL_VOLT_RUN"
.LASF231:
	.string	"CLK_CORE_RGA"
.LASF133:
	.string	"PWM2_CH3_IRQn"
.LASF254:
	.string	"PM_RUNTIME_TYPE_DEVICE"
.LASF343:
	.string	"rt_interrupt_enter"
.LASF192:
	.string	"TCLK_WDT_NS"
.LASF172:
	.string	"PWRMATCH_LPRE"
.LASF284:
	.string	"active"
.LASF147:
	.string	"LPMCU_MBOX1_BB_IRQn"
.LASF153:
	.string	"PWM_REG"
.LASF37:
	.string	"RT_Device_Class_Sound"
.LASF293:
	.string	"globalGrantMask"
.LASF351:
	.string	"rockchip_pwm_irq"
.LASF74:
	.string	"rt_pwm_aligned_mode"
.LASF22:
	.string	"rt_slist_node"
.LASF151:
	.string	"NUM_INTERRUPTS"
.LASF69:
	.string	"__uint32_t"
.LASF79:
	.string	"channel"
.LASF137:
	.string	"HPMCU_MBOX3_AP_IRQn"
.LASF317:
	.string	"g_pwm0Dev"
.LASF326:
	.string	"clk_get_rate"
.LASF320:
	.string	"config"
.LASF289:
	.string	"pChHandle"
.LASF282:
	.string	"posCycles"
.LASF55:
	.string	"parent"
.LASF239:
	.string	"DCLK_VICAP_SRC"
.LASF170:
	.string	"PWRMATCH_ARBITER"
.LASF75:
	.string	"PWM_LEFT_ALIGNED"
.LASF167:
	.string	"GLOBAL_ARBITER"
.LASF180:
	.string	"FREQ_ARBITER"
.LASF15:
	.string	"rt_size_t"
.LASF335:
	.string	"HAL_PWM_GlobalUnlock"
.LASF154:
	.string	"VERSION_ID"
.LASF77:
	.string	"PWM_UNALIGNED"
.LASF11:
	.string	"rt_bool_t"
.LASF46:
	.string	"RT_Device_Class_Pipe"
.LASF321:
	.string	"pPWM"
.LASF248:
	.string	"PM_RUNTIME_TYPE_HS_INTF"
.LASF85:
	.string	"polarity"
.LASF214:
	.string	"MCLK_SAI"
.LASF107:
	.string	"UART0_IRQn"
.LASF161:
	.string	"FILTER_CTRL"
.LASF300:
	.string	"PWR_CTRL_PWR_EN"
.LASF24:
	.string	"rt_object"
.LASF212:
	.string	"CLK_SAI_SRC"
.LASF27:
	.string	"flag"
.LASF313:
	.string	"irq_handler"
.LASF119:
	.string	"GPIO5_IRQn"
.LASF348:
	.string	"/opt/aiglass_dev_env/sysdrv/source/mcu/rt-thread/bsp/rockchip/rv1103b-mcu"
.LASF215:
	.string	"CCLK_EMMC"
.LASF32:
	.string	"RT_Device_Class_Block"
.LASF341:
	.string	"rt_hw_interrupt_umask"
.LASF92:
	.string	"TIMER2_IRQn"
.LASF181:
	.string	"FREQ_CTRL"
.LASF190:
	.string	"CLK_INVALID"
.LASF211:
	.string	"CLK_UART2"
.LASF224:
	.string	"CLK_SPI0"
.LASF68:
	.string	"__uint8_t"
.LASF138:
	.string	"HPMCU_MBOX0_BB_IRQn"
.LASF278:
	.string	"periodNS"
.LASF64:
	.string	"read"
.LASF308:
	.string	"rockchip_pwm"
.LASF263:
	.string	"HAL_PWM_ONE_SHOT"
.LASF332:
	.string	"HAL_PWM_SetOneshot"
.LASF29:
	.string	"unsigned int"
.LASF328:
	.string	"clk_disable"
.LASF185:
	.string	"COUNTER_ARBITER"
.LASF62:
	.string	"open"
.LASF207:
	.string	"CLK_UART1_FRAC"
.LASF21:
	.string	"rt_list_node"
.LASF340:
	.string	"rt_hw_interrupt_install"
.LASF61:
	.string	"init"
.LASF155:
	.string	"ENABLE"
.LASF295:
	.string	"freqMeterSupport"
.LASF283:
	.string	"negCycles"
.LASF104:
	.string	"I2C2_IRQn"
.LASF134:
	.string	"HPMCU_MBOX0_AP_IRQn"
.LASF267:
	.string	"HAL_PWM_LEFT_ALIGNED"
.LASF349:
	.string	"rockchip_rt_hw_pwm_init"
.LASF130:
	.string	"PWM2_CH0_IRQn"
.LASF234:
	.string	"MCLK_SAI_OUT2IO"
.LASF232:
	.string	"CLK_FREQ_PWM0"
.LASF330:
	.string	"HAL_PWM_Enable"
.LASF33:
	.string	"RT_Device_Class_NetIf"
.LASF299:
	.string	"PWR_CTRL_VOLT_SSPD"
.LASF160:
	.string	"OFFSET"
.LASF26:
	.string	"type"
.LASF31:
	.string	"RT_Device_Class_Char"
.LASF4:
	.string	"unsigned char"
.LASF112:
	.string	"GPIO6_IRQn"
.LASF39:
	.string	"RT_Device_Class_I2CBUS"
.LASF336:
	.string	"HAL_PWM_GlobalLock"
.LASF120:
	.string	"GPIO8_IRQn"
.LASF194:
	.string	"CLK_I2C0"
.LASF195:
	.string	"CLK_I2C1"
.LASF196:
	.string	"CLK_I2C2"
.LASF197:
	.string	"CLK_I2C3"
.LASF198:
	.string	"CLK_I2C4"
.LASF257:
	.string	"GRF_PUL_INFO"
.LASF87:
	.string	"rt_pwm_ops"
.LASF304:
	.string	"clk_gate"
.LASF168:
	.string	"GLOBAL_CTRL"
.LASF337:
	.string	"HAL_PWM_GlobalDisable"
.LASF109:
	.string	"UART2_IRQn"
.LASF280:
	.string	"alignedMode"
.LASF316:
	.string	"rockchip_pwm_ops"
.LASF156:
	.string	"CLK_CTRL"
.LASF222:
	.string	"CLK_I2C_PMU"
.LASF72:
	.string	"rt_isr_handler_t"
.LASF116:
	.string	"GPIO7_IRQn"
.LASF81:
	.string	"pulse"
.LASF318:
	.string	"__rt_init_rockchip_rt_hw_pwm_init"
.LASF42:
	.string	"RT_Device_Class_SPIBUS"
.LASF148:
	.string	"LPMCU_MBOX2_BB_IRQn"
.LASF94:
	.string	"TIMER4_IRQn"
.LASF118:
	.string	"GPIO2_IRQn"
.LASF0:
	.string	"signed char"
.LASF80:
	.string	"period"
.LASF7:
	.string	"short unsigned int"
.LASF220:
	.string	"ACLK_PERI_SRC"
.LASF338:
	.string	"HAL_PWM_GlobalUpdate"
.LASF241:
	.string	"CLK_CORE_ISP"
.LASF122:
	.string	"PWM0_CH0_IRQn"
.LASF91:
	.string	"TIMER1_IRQn"
.LASF303:
	.string	"PWR_CTRL_MAX"
.LASF258:
	.string	"GRF_DRV_INFO"
.LASF237:
	.string	"CLK_MIPI0_OUT2IO"
.LASF193:
	.string	"TCLK_WDT_S"
.LASF106:
	.string	"I2C4_IRQn"
.LASF110:
	.string	"GPIO0_IRQn"
.LASF218:
	.string	"SCLK_SFC_2X"
.LASF281:
	.string	"PWM_CAPTURE"
.LASF123:
	.string	"PWM0_CH1_IRQn"
.LASF52:
	.string	"RT_Device_Class_Unknown"
.LASF236:
	.string	"CLK_REF_MIPI1_SRC"
.LASF157:
	.string	"CTRL"
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 10.2.0"
