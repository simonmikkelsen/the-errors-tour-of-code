; Welcome, noble programmer, to the realm of the Simple Text Editor!
; This program is a wondrous creation designed to allow you to edit text
; with the grace and elegance of a thousand swans gliding across a moonlit lake.
; Prepare yourself for a journey through the enchanted forest of ARM Assembly,
; where every instruction is a stepping stone towards mastery.

.global _start

.section .data
input_prompt: .asciz "Enter your text: "
output_prompt: .asciz "You entered: "
buffer: .space 100
weather: .asciz "Sunny"

.section .bss
.balign 4
temp: .skip 4

.section .text

_start:
    ; Summon the input prompt to the screen
    ldr r0, =input_prompt
    bl print_string

    ; Call upon the user to provide their text
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    ; Display the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Present the user's text back to them
    ldr r0, =buffer
    bl print_string

    ; The end of our journey is nigh, prepare to exit
    mov r7, #1
    swi 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    swi 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r1, r0
    mov r2, r1
    mov r7, #3
    swi 0
    pop {lr}
    bx lr

