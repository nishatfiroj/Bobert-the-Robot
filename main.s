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
	.file	"main.c"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L5
	push	{r4, r7, fp, lr}
	ldr	r6, .L5+4
	strh	r2, [r3]	@ movhi
	ldr	fp, .L5+8
	ldr	r5, .L5+12
	ldr	r4, .L5+16
	ldr	r10, .L5+20
	ldr	r9, .L5+24
	ldr	r8, .L5+28
	ldr	r7, .L5+32
.L2:
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	fp
	mov	r0, #300
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r10
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r9
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r8
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r7
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	ldr	r3, .L5+36
	mov	lr, pc
	bx	r3
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	ldr	r3, .L5+40
	mov	lr, pc
	bx	r3
	mov	r0, #150
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	ldr	r3, .L5+44
	mov	lr, pc
	bx	r3
	mov	r0, #300
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	b	.L2
.L6:
	.align	2
.L5:
	.word	1027
	.word	erase
	.word	frame1
	.word	delay
	.word	waitForVBlank
	.word	frame2
	.word	frame3
	.word	frame4
	.word	frame5
	.word	frame6
	.word	frame7
	.word	frame8
	.size	main, .-main
	.ident	"GCC: (devkitARM release 47) 7.1.0"
