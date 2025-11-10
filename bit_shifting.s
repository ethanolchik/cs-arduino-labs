; -- Lab 5 --
; Shift an 8-bit value and output to LEDs

.equ SREG, 0x3f
.equ DDRD, 0x0A
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ PORTB, 0x05

.org 0

mainloop:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ; set upper upper 4 bits of PORTD as output
    ldi r16, 0xF0
    out DDRD, r16 ; Set PORTD upper 4 bits as output
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB lower 4 bits as output

    ; Left shift
    ldi r16, 0x55
    lsl r16
    out PORTD, r16
    out PORTB, r16

    call delay_start

    ; Right shift
    lsr r16
    out PORTD, r16
    out PORTB, r16

    call delay_start

    rjmp mainloop ; Repeat

delay_start:
    ldi r19, 40
outer_loop:
    ldi r18, 240
middle_loop:
    ldi r17, 200
inner_loop:
    nop
    dec r17
    brne inner_loop

    dec r18
    brne middle_loop

    dec r19
    brne outer_loop

    ret
