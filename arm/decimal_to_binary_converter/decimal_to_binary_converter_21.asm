; Program: Decimal to Binary Converter
; Purpose: This program converts a given decimal number into its binary representation.
; The program is designed to help programmers understand the conversion process and 
; practice their ARM Assembly programming skills. The program takes an input from the 
; user, processes it, and outputs the binary equivalent.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "Binary representation: "
newline: .asciz "\n"

.section .bss
.comm decimal_input, 4
.comm binary_output, 32

.section .text

_start:
    ; Display the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    ; Read the user's input
    bl read_input

    ; Convert the input from ASCII to integer
    bl ascii_to_integer

    ; Perform the conversion from decimal to binary
    bl decimal_to_binary

    ; Display the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the binary representation
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc 0
    bx lr

; Function to read input from the user
read_input:
    mov r0, #0
    ldr r1, =decimal_input
    mov r2, #4
    mov r7, #3
    svc 0
    bx lr

; Function to convert ASCII input to integer
ascii_to_integer:
    ldr r0, =decimal_input
    ldrb r1, [r0]
    sub r1, r1, #48
    str r1, [r0]
    bx lr

; Function to convert decimal to binary
decimal_to_binary:
    ldr r0, =decimal_input
    ldr r1, [r0]
    ldr r2, =binary_output
    mov r3, #31

convert_loop:
    and r4, r1, #1
    strb r4, [r2, r3]
    lsr r1, r1, #1
    subs r3, r3, #1
    bge convert_loop
    bx lr

; Function to print the binary representation
print_binary:
    ldr r0, =binary_output
    mov r1, #32
    mov r7, #4
    svc 0
    bx lr

