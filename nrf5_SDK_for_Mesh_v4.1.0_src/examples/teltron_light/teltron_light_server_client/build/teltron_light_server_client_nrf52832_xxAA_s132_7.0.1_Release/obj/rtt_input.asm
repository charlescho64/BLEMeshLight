	.cpu cortex-m4
	.eabi_attribute 27, 1
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"rtt_input.c"
	.text
	.section	.text.timeout_handler,"ax",%progbits
	.align	1
	.global	timeout_handler
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	timeout_handler, %function
timeout_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L7
	ldr	r2, [r4]
	cbz	r2, .L1
.L3:
	bl	SEGGER_RTT_GetKey
	cmp	r0, #0
	blt	.L1
	ldr	r3, [r4]
	blx	r3
	b	.L3
.L1:
	pop	{r4, pc}
.L8:
	.align	2
.L7:
	.word	.LANCHOR0
	.size	timeout_handler, .-timeout_handler
	.section	.rodata.rtt_input_enable.str1.1,"aMS",%progbits,1
.LC0:
	.ascii	"/Users/charles/Documents/DevSite/DevPrj/Nordic/mesh"
	.ascii	"/nrf5_SDK_for_Mesh_v4.1.0_src/examples/common/src/r"
	.ascii	"tt_input.c\000"
	.global	__aeabi_uldivmod
	.global	__aeabi_ldivmod
	.section	.text.rtt_input_enable,"ax",%progbits
	.align	1
	.global	rtt_input_enable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	rtt_input_enable, %function
rtt_input_enable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L17
	ldr	r2, .L17+4
	push	{r4, lr}
	mov	r4, r1
	str	r0, [r3]
	movs	r1, #1
	ldr	r0, .L17+8
	bl	app_timer_create
	cbz	r0, .L10
	ldr	r2, .L17+12
	movs	r1, #74
	bl	app_error_handler
.L10:
	lsrs	r1, r4, #17
	movs	r3, #0
	lsls	r0, r4, #15
	movw	r2, #5999
	cmp	r3, r1
	it	eq
	cmpeq	r2, r0
	bcs	.L13
	mov	r2, #1000
	movs	r3, #0
	bl	__aeabi_uldivmod
	mov	r1, r0
.L11:
	ldr	r0, .L17+16
	movs	r2, #0
	bl	app_timer_start
	cbz	r0, .L9
	pop	{r4, lr}
	ldr	r2, .L17+12
	movs	r1, #75
	b	app_error_handler
.L13:
	movs	r1, #5
	b	.L11
.L9:
	pop	{r4, pc}
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	timeout_handler
	.word	.LANCHOR1
	.word	.LC0
	.word	.LANCHOR2
	.size	rtt_input_enable, .-rtt_input_enable
	.section	.text.rtt_input_disable,"ax",%progbits
	.align	1
	.global	rtt_input_disable
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	rtt_input_disable, %function
rtt_input_disable:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldr	r0, .L24
	bl	app_timer_stop
	cbz	r0, .L20
	ldr	r2, .L24+4
	movs	r1, #80
	bl	app_error_handler
.L20:
	ldr	r3, .L24+8
	movs	r2, #0
	str	r2, [r3]
	pop	{r3, pc}
.L25:
	.align	2
.L24:
	.word	.LANCHOR2
	.word	.LC0
	.word	.LANCHOR0
	.size	rtt_input_disable, .-rtt_input_disable
	.section	.bss.m_rtt_input_handler,"aw",%nobits
	.align	2
	.set	.LANCHOR0,. + 0
	.type	m_rtt_input_handler, %object
	.size	m_rtt_input_handler, 4
m_rtt_input_handler:
	.space	4
	.section	.bss.m_rtt_timer_data,"aw",%nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	m_rtt_timer_data, %object
	.size	m_rtt_timer_data, 32
m_rtt_timer_data:
	.space	32
	.section	.rodata.m_rtt_timer,"a"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	m_rtt_timer, %object
	.size	m_rtt_timer, 4
m_rtt_timer:
	.word	m_rtt_timer_data
	.ident	"GCC: (GNU) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
