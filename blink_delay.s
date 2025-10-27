; -- Lab 4 --
; Parameterised Blink Example arduino nano
; 0.5s on, 0.5s off, repeat 10 times

.equ SREG, 0x3f
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ LED_MASK, 0x01

.org 0

main:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB as output

    ldi r16, 0x00 ; initially, set all LEDs off
    out PORTB, r16

    ldi r26, LED_MASK ; LED toggle mask

    ldi r20, 10 ; number of on-off half-cycles

    ; delay 0.5 seconds
    call delay_start

    rjmp end

delay_start:
    eor r16, r26 ; toggle LED

    out PORTB, r16

    dec r20
    brne delay_continue
    ret
delay_continue:
    call delay
    rjmp delay_start

delay:
    ldi r19, 40
.outer:
    ldi r18, 200
.middle:
    ldi r17, 200
.inner:
    nop
    dec r17
    brne .inner

    dec r18
    brne .middle

    dec r19
    brne .outer

    ret

end: rjmp end