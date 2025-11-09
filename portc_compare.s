; -- Lab 3 --
; Output a value to PORTB depending on the value read from PORTC

.equ SREG, 0x3f

.equ PORTB, 0x05
.equ DDRB, 0x04

.equ PORTC, 0x08
.equ DDRC, 0x07
.equ PINC, 0x06

.org 0

main:
    ldi r16, 0
    out SREG, r16 ; Clear SREG

    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB lower nibble as output

    ldi r16, 0xF0
    out DDRC, r16 ; Set PORTC lower nibble as input, upper nibble as output

    ldi r16, 0x0F
    out PORTC, r16 ; Enable pull-up resistors on PORTC lower nibble

    in r16, PINC ; Read value from PORTC
    cpi r16, 8
    brlo less_than_eight ; If value < 8, branch to less_than_eight

    ldi r17, 1
    sub r16, r17
    rjmp write_portb

less_than_eight:
    ldi r17, 2
    add r16, r17

write_portb:
    out PORTB, r16 ; write result to PORTB

mainloop: rjmp mainloop