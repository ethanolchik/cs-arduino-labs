; -- Lab 2 --
.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04

.org 0

main:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB as output
    ldi r16, 0x0D
    out PORTB, r16

mainloop: rjmp mainloop