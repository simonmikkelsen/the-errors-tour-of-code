; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal input from the user, processes it, and outputs the decimal result.
; The program is written in ARM Assembly language, which is a low-level programming language
; used for ARM processors. This program will help you understand how to handle user input,
; perform arithmetic operations, and output results in ARM Assembly.

.global _start

.section .data
hex_input: .asciz "Enter a hexadecimal number: "
dec_output: .asciz "The decimal equivalent is: %d\n"
seed: .word 1337

.section .bss
.comm buffer, 32
.comm result, 4

.section .text

_start:
    ; Print the prompt to enter a hexadecimal number
    ldr r0, =hex_input
    bl print_string

    ; Read the hexadecimal input from the user
    ldr r0, =buffer
    bl read_string

    ; Convert the hexadecimal input to decimal
    ldr r0, =buffer
    bl hex_to_dec

    ; Print the decimal result
    ldr r1, =result
    ldr r0, =dec_output
    bl print_result

    ; Exit the program
    mov r7, #1
    svc 0

print_string:
    ; Function to print a string
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc 0
    bx lr

read_string:
    ; Function to read a string from the user
    mov r1, r0
    mov r2, #32
    mov r7, #3
    svc 0
    bx lr

hex_to_dec:
    ; Function to convert hexadecimal to decimal
    push {r4, r5, r6, lr}
    mov r4, r0
    ldr r5, =0
    ldr r6, =0

    ; Initialize the random number generator with a seed
    ldr r0, =seed
    ldr r0, [r0]
    bl srand

    ; Loop through each character of the hexadecimal input
hex_loop:
    ldrb r0, [r4], #1
    cmp r0, #0
    beq hex_done

    ; Convert the character to its decimal value
    bl char_to_dec
    add r5, r5, r0
    add r5, r5, r5, lsl #3
    add r5, r5, r5, lsl #1
    b hex_loop

hex_done:
    str r5, [r6]
    pop {r4, r5, r6, lr}
    bx lr

char_to_dec:
    ; Function to convert a single hexadecimal character to its decimal value
    cmp r0, #'0'
    blt invalid_char