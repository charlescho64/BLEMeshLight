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
	.file	"mesh_provisionee.c"
	.text
	.section	.text.sd_ble_cfg_set,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_ble_cfg_set, %function
sd_ble_cfg_set:
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.syntax unified
@ 453 "/Users/charles/Documents/DevSite/DevPrj/Nordic/ble/nRF5_SDK_17.0.0_9d13099/components/softdevice/s132/headers/ble.h" 1
	svc #105
bx r14
@ 0 "" 2
	.thumb
	.syntax unified
	.size	sd_ble_cfg_set, .-sd_ble_cfg_set
	.section	.text.sd_state_evt_handler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	sd_state_evt_handler, %function
sd_state_evt_handler:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L47
	ldrb	r1, [r5]	@ zero_extendqisi2
	sub	sp, sp, #28
	cbz	r1, .L2
	cmp	r0, #1
	beq	.L5
	cmp	r0, #3
	beq	.L6
.L2:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, pc}
.L5:
	movs	r4, #0
	add	r1, sp, #4
	str	r4, [sp, #4]
	bl	nrf_sdh_ble_default_cfg_set
	cbz	r0, .L7
	bl	app_error_handler_bare
.L7:
	movw	r3, #273
	str	r4, [sp, #12]
	ldr	r2, [sp, #4]
	strh	r3, [sp, #12]	@ movhi
	add	r1, sp, #12
	mov	r3, #1179648
	movs	r0, #65
	str	r4, [sp, #16]
	str	r3, [sp, #20]
	bl	sd_ble_cfg_set
	cbz	r0, .L8
	bl	app_error_handler_bare
.L8:
	add	r0, sp, #4
	bl	nrf_sdh_ble_enable
	cbz	r0, .L9
	bl	app_error_handler_bare
.L9:
	ldr	r4, .L47+4
	ldr	r3, [r4]
	cbz	r3, .L10
	blx	r3
.L10:
	movs	r3, #1
	add	r1, sp, #8
	add	r0, sp, #2
	str	r3, [sp, #8]
	bl	dsm_subnet_get_all
	cbz	r0, .L11
	bl	app_error_handler_bare
.L11:
	ldrh	r0, [sp, #2]
	bl	dsm_net_key_index_to_subnet_handle
	add	r1, sp, #1
	bl	dsm_subnet_kr_phase_get
	cbz	r0, .L12
	bl	app_error_handler_bare
.L12:
	bl	proxy_init
	ldrb	r1, [sp, #1]	@ zero_extendqisi2
	movs	r0, #0
	bl	proxy_node_id_enable
	cbz	r0, .L13
	.syntax unified
@ 150 "/Users/charles/Documents/DevSite/DevPrj/Nordic/mesh/nrf5_SDK_for_Mesh_v4.1.0_src/examples/common/src/mesh_provisionee.c" 1
	mov r0, pc
	
@ 0 "" 2
	.thumb
	.syntax unified
	bl	mesh_assertion_handler
.L13:
	bl	nrf_mesh_enable
	cbz	r0, .L14
	bl	app_error_handler_bare
.L14:
	movs	r3, #0
	strb	r3, [r5]
	ldr	r3, [r4, #4]
	cmp	r3, #0
	beq	.L2
	blx	r3
	b	.L2
.L6:
	bl	nrf_sdh_enable_request
	cmp	r0, #0
	beq	.L2
	bl	app_error_handler_bare
	b	.L2
.L48:
	.align	2
.L47:
	.word	.LANCHOR0
	.word	.LANCHOR1
	.size	sd_state_evt_handler, .-sd_state_evt_handler
	.section	.text.mesh_evt_handler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	mesh_evt_handler, %function
mesh_evt_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, lr}
	ldrb	r3, [r0]	@ zero_extendqisi2
	cmp	r3, #28
	bne	.L49
	ldr	r3, .L58
	ldrb	r3, [r3]	@ zero_extendqisi2
	cbz	r3, .L49
	bl	nrf_sdh_disable_request
	cbz	r0, .L51
	bl	app_error_handler_bare
.L51:
	pop	{r3, lr}
	ldr	r0, .L58+4
	b	nrf_mesh_evt_handler_remove
.L49:
	pop	{r3, pc}
.L59:
	.align	2
.L58:
	.word	.LANCHOR0
	.word	.LANCHOR2
	.size	mesh_evt_handler, .-mesh_evt_handler
	.section	.text.provisionee_start,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	provisionee_start, %function
provisionee_start:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L62
	ldr	r0, .L62+4
	bl	nrf_mesh_prov_generate_keys
	mov	r2, r0
	cbnz	r0, .L60
	ldr	r1, .L62+8
	ldr	r0, .L62+12
	ldr	r1, [r1, #20]
	pop	{r4, lr}
	movs	r3, #3
	b	nrf_mesh_prov_listen
.L60:
	pop	{r4, pc}
.L63:
	.align	2
.L62:
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR1
	.word	.LANCHOR5
	.size	provisionee_start, .-provisionee_start
	.section	.text.prov_evt_handler,"ax",%progbits
	.align	1
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	prov_evt_handler, %function
prov_evt_handler:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrb	r3, [r0]	@ zero_extendqisi2
	subs	r3, r3, #2
	cmp	r3, #8
	bhi	.L64
	tbb	[pc, r3]
.L67:
	.byte	(.L71-.L67)/2
	.byte	(.L70-.L67)/2
	.byte	(.L69-.L67)/2
	.byte	(.L64-.L67)/2
	.byte	(.L64-.L67)/2
	.byte	(.L68-.L67)/2
	.byte	(.L64-.L67)/2
	.byte	(.L64-.L67)/2
	.byte	(.L66-.L67)/2
	.p2align 1
.L70:
	ldr	r3, .L101
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L64
	ldrb	r0, [r0, #8]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L64
	ldr	r2, .L101+4
	movs	r1, #1
	pop	{r4, lr}
	strb	r1, [r2]
	bx	r3	@ indirect register sibling call
.L69:
	ldr	r3, .L101
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L64
	ldr	r2, .L101+4
	ldrb	r1, [r2]	@ zero_extendqisi2
	cbz	r1, .L64
	movs	r1, #0
	pop	{r4, lr}
	strb	r1, [r2]
	bx	r3	@ indirect register sibling call
.L71:
	ldr	r3, .L101+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	cbnz	r2, .L74
	ldr	r3, .L101
	ldr	r3, [r3, #16]
	cbz	r3, .L75
	ldr	r1, .L101+4
	strb	r2, [r1]
	blx	r3
.L75:
	pop	{r4, lr}
	b	provisionee_start
.L74:
	ldr	r3, .L101+12
	ldr	r0, .L101+16
	movs	r2, #1
	strb	r2, [r3]
	bl	nrf_mesh_evt_handler_add
	bl	nrf_mesh_disable
.L100:
	cbz	r0, .L64
	pop	{r4, lr}
	b	app_error_handler_bare
.L68:
	ldr	r3, .L101
	ldr	r0, .L101+20
	ldr	r1, [r3, #24]
	movs	r2, #16
	bl	nrf_mesh_prov_auth_data_provide
	b	.L100
.L66:
	ldrd	r1, r0, [r0, #8]
	bl	mesh_stack_provisioning_data_store
	cbz	r0, .L76
	bl	app_error_handler_bare
.L76:
	ldr	r3, .L101+8
	movs	r2, #1
	strb	r2, [r3]
.L64:
	pop	{r4, pc}
.L102:
	.align	2
.L101:
	.word	.LANCHOR1
	.word	.LANCHOR6
	.word	.LANCHOR7
	.word	.LANCHOR0
	.word	.LANCHOR2
	.word	.LANCHOR5
	.size	prov_evt_handler, .-prov_evt_handler
	.section	.text.mesh_provisionee_prov_start,"ax",%progbits
	.align	1
	.global	mesh_provisionee_prov_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	mesh_provisionee_prov_start, %function
mesh_provisionee_prov_start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L106
	ldr	r6, .L106+4
	ldr	r1, [r2, #4]	@ unaligned
	mov	r4, r0
	sub	sp, sp, #24
	ldr	r0, [r2]	@ unaligned
	add	r3, sp, #12
	stmia	r3!, {r0, r1}
	ldrh	r1, [r2, #8]	@ unaligned
	ldrb	r2, [r2, #10]	@ zero_extendqisi2
	strh	r1, [r3]	@ unaligned
	strb	r2, [r3, #2]
	ldmia	r4!, {r0, r1, r2, r3}
	mov	r5, r6
	stmia	r5!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2}
	stm	r5, {r0, r1, r2}
	ldr	r3, [r6, #24]
	cbz	r3, .L105
	ldr	r3, .L106+8
	str	r3, [sp]
	ldr	r2, .L106+12
	ldr	r1, .L106+16
	ldr	r0, .L106+20
	add	r3, sp, #12
	bl	nrf_mesh_prov_init
	cbnz	r0, .L103
	ldr	r0, .L106+24
	bl	nrf_mesh_prov_bearer_adv_interface_get
	mov	r1, r0
	ldr	r0, .L106+20
	bl	nrf_mesh_prov_bearer_add
	cbnz	r0, .L103
	ldr	r0, .L106+28
	bl	nrf_mesh_prov_bearer_gatt_init
	cbnz	r0, .L103
	ldr	r0, .L106+28
	bl	nrf_mesh_prov_bearer_gatt_interface_get
	mov	r1, r0
	ldr	r0, .L106+20
	bl	nrf_mesh_prov_bearer_add
	cbnz	r0, .L103
	bl	provisionee_start
.L103:
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, pc}
.L105:
	movs	r0, #7
	b	.L103
.L107:
	.align	2
.L106:
	.word	.LANCHOR8
	.word	.LANCHOR1
	.word	prov_evt_handler
	.word	.LANCHOR3
	.word	.LANCHOR4
	.word	.LANCHOR5
	.word	.LANCHOR9
	.word	.LANCHOR10
	.size	mesh_provisionee_prov_start, .-mesh_provisionee_prov_start
	.section	.text.mesh_provisionee_prov_listen_stop,"ax",%progbits
	.align	1
	.global	mesh_provisionee_prov_listen_stop
	.syntax unified
	.thumb
	.thumb_func
	.fpu fpv4-sp-d16
	.type	mesh_provisionee_prov_listen_stop, %function
mesh_provisionee_prov_listen_stop:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L109
	b	nrf_mesh_prov_listen_stop
.L110:
	.align	2
.L109:
	.word	.LANCHOR5
	.size	mesh_provisionee_prov_listen_stop, .-mesh_provisionee_prov_listen_stop
	.section .rodata
	.set	.LANCHOR8,. + 0
.LC0:
	.byte	2
	.2byte	1
	.byte	0
	.byte	1
	.byte	0
	.2byte	0
	.byte	0
	.2byte	0
	.section	.bss.m_device_identification_started,"aw",%nobits
	.set	.LANCHOR6,. + 0
	.type	m_device_identification_started, %object
	.size	m_device_identification_started, 1
m_device_identification_started:
	.space	1
	.section	.bss.m_device_provisioned,"aw",%nobits
	.set	.LANCHOR7,. + 0
	.type	m_device_provisioned, %object
	.size	m_device_provisioned, 1
m_device_provisioned:
	.space	1
	.section	.bss.m_doing_gatt_reset,"aw",%nobits
	.set	.LANCHOR0,. + 0
	.type	m_doing_gatt_reset, %object
	.size	m_doing_gatt_reset, 1
m_doing_gatt_reset:
	.space	1
	.section	.bss.m_params,"aw",%nobits
	.align	2
	.set	.LANCHOR1,. + 0
	.type	m_params, %object
	.size	m_params, 28
m_params:
	.space	28
	.section	.bss.m_private_key,"aw",%nobits
	.set	.LANCHOR3,. + 0
	.type	m_private_key, %object
	.size	m_private_key, 32
m_private_key:
	.space	32
	.section	.bss.m_prov_bearer_adv,"aw",%nobits
	.align	2
	.set	.LANCHOR9,. + 0
	.type	m_prov_bearer_adv, %object
	.size	m_prov_bearer_adv, 456
m_prov_bearer_adv:
	.space	456
	.section	.bss.m_prov_bearer_gatt,"aw",%nobits
	.align	2
	.set	.LANCHOR10,. + 0
	.type	m_prov_bearer_gatt, %object
	.size	m_prov_bearer_gatt, 80
m_prov_bearer_gatt:
	.space	80
	.section	.bss.m_prov_ctx,"aw",%nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	m_prov_ctx, %object
	.size	m_prov_ctx, 308
m_prov_ctx:
	.space	308
	.section	.bss.m_public_key,"aw",%nobits
	.set	.LANCHOR4,. + 0
	.type	m_public_key, %object
	.size	m_public_key, 64
m_public_key:
	.space	64
	.section	.data.m_mesh_evt_handler,"aw"
	.align	2
	.set	.LANCHOR2,. + 0
	.type	m_mesh_evt_handler, %object
	.size	m_mesh_evt_handler, 12
m_mesh_evt_handler:
	.word	mesh_evt_handler
	.space	8
	.section	.sdh_state_observers1,"a"
	.align	2
	.type	m_sdh_req_obs, %object
	.size	m_sdh_req_obs, 8
m_sdh_req_obs:
	.word	sd_state_evt_handler
	.word	0
	.ident	"GCC: (GNU) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
