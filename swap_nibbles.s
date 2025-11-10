; -- Lab 5 --
; Swap nibbles of an 8-bit value and output to LEDs (PORTD upper 4 bits and PORTB lower 4 bits)
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

    ldi r16, 0x81

    mov r20, r16 ; Copy original value to r20 for shifting
    andi r20, 0x0F ; Isolate lower nibble
    mov r21, r16 ; Copy original value to r21 for shifting
    andi r21, 0xF0 ; Isolate upper nibble

    out PORTD, r16
    out PORTB, r16
    call start_shift_loop

    rjmp mainloop


start_shift_loop:
    ldi r22, 10 ; Number of bits to shift
    call shift_loop
    ret

shift_loop:
    lsl r20 ; Shift left to move lower nibble to upper nibble
    lsr r21 ; Shift right to move upper nibble to lower nibble
    call delay_start
    ; Combine the two nibbles
    or r25, r20
    or r25, r21
    out PORTD, r25
    out PORTB, r25
    andi r25, 0x00 ; Clear r25 for next use
    dec r22

    brne shift_loop

    ret

; Delay
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