; Welcome, noble programmer, to the realm of the Simple Text Editor!
; This majestic program is designed to bestow upon you the wisdom of text manipulation.
; Embark on this journey to uncover the secrets of ARM Assembly and the art of editing text.
; Let the adventure begin!

.section .data
    ; Behold, the sacred text buffer, where words shall dance and prance.
    buffer: .space 1024

    ; The ephemeral message, a greeting to the user.
    message: .asciz "Welcome to the Simple Text Editor!\n"

.section .bss
    ; The ethereal storage for user input, a vessel for their thoughts.
    .lcomm user_input, 256

.section .text
    .global _start

_start:
    ; Proclaim the welcome message to the world!
    ldr r0, =message
    bl print_string

    ; Summon the user's input from the depths of the keyboard.
    ldr r0, =user_input
    mov r1, #256
    bl read_input

    ; Transfer the user's musings to the sacred buffer.
    ldr r1, =buffer
    bl copy_input

    ; The grand finale, where the program gracefully exits the stage.
    mov r7, #1
    svc #0

; The herald of strings, a function to print messages to the console.
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

; The conjurer of input, a function to read user input.
read_input:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

; The mystical copier, a function to transfer input to the buffer.
copy_input:
    push {lr}
    mov r2, r0
    ldr r3, =buffer
    mov r4, #0

copy_loop:
    ldrb r5, [r2, r4]
    strb r5, [r3, r4]
    add r4, r4, #1
    cmp r5, #0
    bne copy_loop

    pop {lr}
    bx lr

