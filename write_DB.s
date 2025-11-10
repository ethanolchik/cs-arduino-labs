; -- Lab 5 --
; Write an 8 bit value 0xDB to LEDs (PORTD upper 4 bits and PORTB lower 4 bits)
.equ SREG, 0x3f
.equ DDRD, 0x0A
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ PORTB, 0x05

.org 0

main:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ; set upper upper 4 bits of PORTD as output
    ldi r16, 0xF0
    out DDRD, r16 ; Set PORTD upper 4 bits as output
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB lower 4 bits as output

    ldi r16, 0xDB

    out PORTD, r16 ; Write 0xDB to PORTD (DB in hex)
    out PORTB, r16 ; Write 0x0B to PORTB (0B in hex)

mainloop: rjmp mainloop