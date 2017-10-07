.include "m168def.inc"
.EQU	PIN_13 = 5	; in bank B, pin 13 => D13
.EQU	PIN_5 = 5	; in bank D, pin 5 => D5

.ORG $11
.CSEG
	; initialise stack pointer
	LDI	R16, low(RAMEND)
	OUT	SPL, R16
	LDI	R16, high(RAMEND)
	OUT	SPH, R16

	; set as output
	SBI	DDRB, PIN_13
	; set as input
	CBI	DDRD, PIN_5
	SBI	PORTD, PIN_5	; pullup

	nop
	; toggle pin
main:	SBIS	PIND, PIN_5 ; skip next if set
	SBI	PORTB, PIN_13 ; ON
	SBIC	PIND, PIN_5 ; skip next if cleared
	CBI	PORTB, PIN_13 ; OFF
	RJMP	main
