	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	rsb	r3, r0, r0, lsl #5
	add	r0, r0, r3, lsl #2
	lsl	r0, r0, #3
	sub	sp, sp, #8
	cmp	r0, r2
	str	r2, [sp, #4]
	ble	.L1
.L3:
	ldr	r3, [sp, #4]
	add	r2, r2, #1
	add	r3, r3, #1
	cmp	r2, r0
	str	r3, [sp, #4]
	bne	.L3
.L1:
	add	sp, sp, #8
	@ sp needed
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L8:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L8
	mov	r2, #67108864
.L9:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L9
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	erase
	.syntax unified
	.arm
	.fpu softvfp
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r1, #32768
	ldr	r3, .L18
	ldr	r0, [r3]
	add	ip, r0, #480
.L14:
	mov	r3, r0
	add	r2, r0, #76800
.L15:
	strh	r1, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r2
	bne	.L15
	add	r0, r0, #2
	cmp	r0, ip
	bne	.L14
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	erase, .-erase
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L21
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L31
	rsb	r1, r1, r1, lsl #4
	lsl	r1, r1, #4
	push	{r4, r5, r6, lr}
	ldr	ip, [r3]
	add	lr, r0, r1
	lsl	lr, lr, #1
	add	r2, ip, lr
	mov	r3, r2
	mvn	r5, #32768
	add	r4, ip, #4800
	add	lr, r4, lr
.L24:
	strh	r5, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, lr
	bne	.L24
	mvn	r5, #32768
	add	lr, r1, #2400
	add	r1, r0, lr
	lsl	r6, r1, #1
	add	r1, ip, #20
	add	r3, ip, r6
	add	r1, r1, r6
.L25:
	strh	r5, [r3], #2	@ movhi
	cmp	r3, r1
	bne	.L25
	mvn	r3, #32768
	sub	r1, lr, #2400
	add	r0, r1, r0
	add	r4, r4, #20
	add	r0, r4, r0, lsl #1
.L26:
	strh	r3, [r2]	@ movhi
	add	r2, r2, #480
	add	r2, r2, #2
	cmp	r0, r2
	bne	.L26
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	.LANCHOR0
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	drawSquare
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSquare, %function
drawSquare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	add	r4, r1, r2
	cmp	r1, r4
	add	lr, r0, r2
	movge	r4, r1
	bge	.L34
	mvn	ip, #32768
	ldr	r3, .L42
	rsb	r1, r1, r1, lsl #4
	ldr	r5, [r3]
	rsb	r6, r4, r4, lsl #4
	add	r3, r0, r1, lsl #4
	add	r1, r0, r6, lsl #4
	rsb	r6, r0, r0, lsl #31
	add	r3, r5, r3, lsl #1
	lsl	r7, r6, #1
	add	r5, r5, r1, lsl #1
	lsl	r6, lr, #1
.L35:
	mov	r1, r3
	add	r3, r3, #480
	strh	ip, [r1], r7	@ movhi
	cmp	r3, r5
	strh	ip, [r1, r6]	@ movhi
	bne	.L35
.L34:
	cmp	r0, lr
	bgt	.L33
	mvn	r1, #32768
	sub	r2, r4, r2
	rsb	r2, r2, r2, lsl #4
	ldr	ip, .L42
	lsl	r3, r2, #4
	rsb	r4, r4, r4, lsl #4
	ldr	r2, [ip]
	add	ip, lr, r3
	add	r3, r0, r3
	sub	r3, r3, #-2147483647
	add	r0, r0, r4, lsl #4
	add	r3, r2, r3, lsl #1
	add	ip, r2, ip, lsl #1
	add	r0, r2, r0, lsl #1
.L37:
	strh	r1, [r0], #2	@ movhi
	strh	r1, [r3, #2]!	@ movhi
	cmp	r3, ip
	bne	.L37
.L33:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	.LANCHOR0
	.size	drawSquare, .-drawSquare
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	add	r2, r0, r2
	cmp	r0, r2
	ldrh	lr, [sp, #16]
	bge	.L44
	ldr	ip, .L52
	rsb	r4, r0, r0, lsl #4
	ldr	ip, [ip]
	add	r4, r1, r4, lsl #4
	add	r4, ip, r4, lsl #1
	add	r6, r1, r3
	lsl	r5, r3, #1
.L46:
	cmp	r6, r1
	movgt	r3, r4
	addgt	ip, r4, r5
	ble	.L49
.L47:
	strh	lr, [r3], #2	@ movhi
	cmp	r3, ip
	bne	.L47
.L49:
	add	r0, r0, #1
	cmp	r0, r2
	add	r4, r4, #480
	bne	.L46
.L44:
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawPrism
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPrism, %function
drawPrism:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	r3, r0, r3
	ldr	ip, .L72
	cmp	r3, r0
	lsl	r8, r1, #4
	add	r7, r1, r2
	ldr	r5, [ip]
	ldrh	r4, [sp, #36]
	blt	.L55
	mov	r9, r0
	sub	r6, r8, r1
	rsb	r10, r2, r2, lsl #4
	add	r6, r0, r6, lsl #4
	lsl	r10, r10, #5
	add	r6, r5, r6, lsl #1
	add	r10, r10, #480
	add	fp, r3, #1
.L56:
	cmp	r1, r7
	movle	ip, r6
	addle	lr, r10, r6
	bgt	.L59
.L57:
	strh	r4, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, lr
	bne	.L57
.L59:
	add	r9, r9, #1
	cmp	r9, fp
	add	r6, r6, #2
	bne	.L56
.L55:
	mov	ip, #0
	sub	r4, r8, r1
	rsb	r6, r7, r7, lsl #4
	lsl	r4, r4, #4
	add	r6, r0, r6, lsl #4
	add	r8, r4, r3
	lsl	r6, r6, #1
	add	r4, r4, r0
	ldr	lr, .L72+4
	ldr	r9, .L72+8
	add	r8, r5, r8, lsl #1
	add	r4, r5, r4, lsl #1
	add	r10, r5, r6
.L60:
	strh	lr, [r8, ip]	@ movhi
	strh	lr, [r4, ip]	@ movhi
	strh	lr, [r10, ip]	@ movhi
	sub	ip, ip, #480
	sub	ip, ip, #2
	cmp	ip, r9
	bne	.L60
	sub	r1, r1, #10
	sub	r7, r7, #10
	cmp	r7, r1
	sub	r0, r0, #10
	ble	.L61
	rsb	r1, r1, r1, lsl #4
	sub	ip, r5, #4800
	add	r1, r0, r1, lsl #4
	sub	ip, ip, #20
	ldr	lr, .L72+4
	add	r1, r5, r1, lsl #1
	add	r6, ip, r6
.L62:
	strh	lr, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r6
	bne	.L62
	mov	r1, r7
.L61:
	sub	ip, r3, #10
	cmp	ip, r0
	sub	r1, r1, r2
	ble	.L54
	rsb	r1, r1, r1, lsl #4
	lsl	r1, r1, #4
	add	r0, r1, r0
	sub	r0, r0, #-2147483647
	add	r1, r1, r3
	ldr	r2, .L72+4
	sub	r3, r5, #22
	add	r1, r3, r1, lsl #1
	add	r5, r5, r0, lsl #1
.L64:
	strh	r2, [r5, #2]!	@ movhi
	cmp	r1, r5
	bne	.L64
.L54:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	.LANCHOR0
	.word	26425
	.word	-4820
	.size	drawPrism, .-drawPrism
	.align	2
	.global	frame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame1, %function
frame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #20
	push	{r4, lr}
	ldr	r4, .L76
	sub	sp, sp, #8
	mov	r1, r3
	str	r4, [sp]
	mov	r2, #10
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #30
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #40
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #40
	mov	r0, #130
	bl	drawSquare
	mov	r1, #45
	mov	r0, #120
	bl	drawTriangle
	mov	r3, #70
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #85
	bl	drawPrism
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #30
	mov	r1, #75
	mov	r0, #65
	bl	drawPrism
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #30
	mov	r1, #75
	mov	r0, #160
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	26425
	.size	frame1, .-frame1
	.align	2
	.global	frame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame2, %function
frame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #20
	push	{r4, lr}
	ldr	r4, .L80
	sub	sp, sp, #8
	mov	r1, r3
	str	r4, [sp]
	mov	r2, #10
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #30
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #40
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #40
	mov	r0, #130
	bl	drawSquare
	mov	r1, #45
	mov	r0, #120
	bl	drawTriangle
	mov	r3, #70
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #85
	bl	drawPrism
	mov	r3, #15
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #65
	bl	drawPrism
	mov	r3, #15
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #160
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	26425
	.size	frame2, .-frame2
	.align	2
	.global	frame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame3, %function
frame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #20
	push	{r4, lr}
	ldr	r4, .L84
	sub	sp, sp, #8
	mov	r1, r3
	str	r4, [sp]
	mov	r2, #10
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #30
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #40
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #40
	mov	r0, #130
	bl	drawSquare
	mov	r1, #45
	mov	r0, #120
	bl	drawTriangle
	mov	r3, #70
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #85
	bl	drawPrism
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #1
	mov	r1, #75
	mov	r0, #65
	bl	drawPrism
	str	r4, [sp]
	mov	r3, #15
	mov	r2, #1
	mov	r1, #75
	mov	r0, #160
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	26425
	.size	frame3, .-frame3
	.align	2
	.global	frame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame4, %function
frame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #20
	push	{r4, lr}
	ldr	r4, .L88
	sub	sp, sp, #8
	mov	r1, r3
	str	r4, [sp]
	mov	r2, #10
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #30
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #40
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #40
	mov	r0, #130
	bl	drawSquare
	mov	r1, #45
	mov	r0, #120
	bl	drawTriangle
	mov	r3, #70
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #75
	mov	r0, #85
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	26425
	.size	frame4, .-frame4
	.align	2
	.global	frame5
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame5, %function
frame5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L92
	sub	sp, sp, #8
	mov	r3, #20
	str	r4, [sp]
	mov	r2, #10
	mov	r1, #40
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #50
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #60
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #60
	mov	r0, #130
	bl	drawSquare
	mov	r1, #65
	mov	r0, #120
	bl	drawTriangle
	str	r4, [sp]
	mov	r3, #70
	mov	r2, #50
	mov	r1, #95
	mov	r0, #85
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	26425
	.size	frame5, .-frame5
	.align	2
	.global	frame6
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame6, %function
frame6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L96
	sub	sp, sp, #8
	mov	r3, #20
	str	r4, [sp]
	mov	r2, #10
	mov	r1, #60
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #70
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #80
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #80
	mov	r0, #130
	bl	drawSquare
	mov	r1, #85
	mov	r0, #120
	bl	drawTriangle
	str	r4, [sp]
	mov	r3, #70
	mov	r2, #30
	mov	r1, #115
	mov	r0, #85
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	26425
	.size	frame6, .-frame6
	.align	2
	.global	frame7
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame7, %function
frame7:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L100
	sub	sp, sp, #8
	mov	r3, #20
	str	r4, [sp]
	mov	r2, #10
	mov	r1, #80
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	str	r4, [sp]
	mov	r2, r3
	mov	r1, #90
	mov	r0, #100
	bl	drawPrism
	mov	r2, #5
	mov	r1, #100
	mov	r0, #110
	bl	drawSquare
	mov	r2, #5
	mov	r1, #100
	mov	r0, #130
	bl	drawSquare
	mov	r1, #105
	mov	r0, #120
	bl	drawTriangle
	str	r4, [sp]
	mov	r3, #70
	mov	r2, #10
	mov	r1, #135
	mov	r0, #85
	bl	drawPrism
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L101:
	.align	2
.L100:
	.word	26425
	.size	frame7, .-frame7
	.align	2
	.global	frame8
	.syntax unified
	.arm
	.fpu softvfp
	.type	frame8, %function
frame8:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L104
	sub	sp, sp, #8
	mov	r3, #20
	str	r4, [sp]
	mov	r2, #10
	mov	r1, #90
	mov	r0, #110
	bl	drawPrism
	mov	r3, #40
	mov	r1, #100
	mov	r2, r3
	mov	r0, r1
	str	r4, [sp]
	bl	drawPrism
	mov	r1, #110
	mov	r2, #5
	mov	r0, r1
	bl	drawSquare
	mov	r2, #5
	mov	r1, #110
	mov	r0, #130
	bl	drawSquare
	mov	r1, #115
	mov	r0, #120
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	b	drawTriangle
.L105:
	.align	2
.L104:
	.word	26425
	.size	frame8, .-frame8
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 47) 7.1.0"
