; -- Lab 3 --
; Add 2 to PORTC and output to PORTB

.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04

.equ PORTC, 0x08
.equ DDRC, 0x07
.equ PINC, 0x06

.org 0

main:
    ldi r16, 0
    out SREG, r16

    ldi r16, 0x0F
    out DDRB, r16

    ldi r16, 0xF0
    out DDRC, r16

    in r16, PINC

    ldi r17, 0x02
    add r16, r17

    out PORTB, r16

mainloop: rjmp mainloop