; -- Lab 4 -- 
; Blink Example arduino nano
; on for 500ms, off for 500ms, infinitely

.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04

.org 0

main:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB as output

loop:
    ldi r16, 0x01
    out PORTB, r16

    ; delay 0.5 seconds
    call delay_start

    ldi r16, 0x00
    out PORTB, r16

    ; delay 0.5 seconds
    call delay_start

    rjmp loop

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