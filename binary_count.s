; (This program is not part of the lab exercises)
.equ SREG, 0x3f
.equ DDRB, 0x04
.equ PORTB, 0x05

.org 0

main:
    ldi r16, 0xFF
    out SREG, r16 ; Disable interrupts
    ldi r16, 0x0F
    out DDRB, r16 ; Set PORTB as output
    ldi r16, 0x00

count_loop:
    out PORTB, r16 ; Output the current count to PORTB (LEDs)
    inc r16 ; Increment the counter

    andi r16, 0x0F ; r16 & 0x0F to keep it within 4 bits
    call delay_1s
    rjmp count_loop ; Loop back to count

delay_1s:
    ldi r18, 0x1F
outer_delay:
    ldi r19, 0xFF
inner_delay:
    ldi r20, 0xFF
delay_loop:
    dec r20
    brne delay_loop
    dec r19
    brne inner_delay
    dec r18
    brne outer_delay
    ret

mainloop: rjmp mainloop