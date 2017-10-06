; Copyright (C) 2017 Djeck
;
; Blinking LED on pin 13 on an ATMEGA168PA

.include "m168def.inc"
.EQU	PIN_13 = 5	; in bank B, pin 13
.CSEG
	; initialise stack pointer
	LDI	R16, low(RAMEND)
	OUT	SPL, R16
	LDI	R16, high(RAMEND)
	OUT	SPH, R16

	; set as output
	SBI	DDRB, PIN_13

	; toggle pin
main:	CBI	PORTB, PIN_13
	RCALL	delay
	SBI	PORTB, PIN_13
	RCALL	delay
	RJMP	main

	; set a delay with 3 loops
delay:	LDI	R17, 0xFF
loop1:	LDI	R18, 0xFF
loop2:	LDI	R19, 0x11
loop3:	DEC	R19
	BRNE	loop3
	DEC	R18
	BRNE	loop2
	DEC	R17
	BRNE	loop1
	RET
