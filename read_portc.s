; -- Lab 3 --
; Read PORTC value and output it to PORTB

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

    out PORTB, r16

mainloop: rjmp mainloop