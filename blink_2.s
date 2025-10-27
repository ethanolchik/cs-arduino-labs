; -- Lab 4 --
; Blink Example arduino nano
; on for 400ms, off for 200ms
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
    call delay_start_400

    ldi r16, 0x00
    out PORTB, r16

    ; delay 0.5 seconds
    call delay_start_200ms

    rjmp loop

delay_start_400:
    ldi r19, 100
outer_loop_400:
    ldi r18, 128
middle_loop_400:
    ldi r17, 128
inner_loop_400:
    nop
    dec r17
    brne inner_loop_400

    dec r18
    brne middle_loop_400

    dec r19
    brne outer_loop_400

    ret


delay_start_200ms:
    ldi r19, 50
outer_loop_200:
    ldi r18, 128
middle_loop_200:
    ldi r17, 128
inner_loop_200:
    nop
    dec r17
    brne inner_loop_200

    dec r18
    brne middle_loop_200

    dec r19
    brne outer_loop_200

    ret