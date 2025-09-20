; This program converts a decimal number to its binary representation.
; The purpose of this program is to provide a detailed example of ARM Assembly programming.
; It demonstrates the use of loops, conditional statements, and bitwise operations.
; The program reads a decimal number from the user, converts it to binary, and prints the result.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "Binary representation: "
newline: .asciz "\n"

.section .bss
.comm decimal_number, 4
.comm binary_number, 32
.comm temp_var, 4

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the decimal number from the user
    bl read_decimal

    ; Convert the decimal number to binary
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the binary number
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc #0

print_string:
    ; r0 = address of the string to print
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc #0
    bx lr

read_decimal:
    ; Read a decimal number from the user and store it in decimal_number
    mov r1, #0
    mov r2, #4
    mov r7, #3
    svc #0
    ldr r0, =decimal_number
    str r0, [r1]
    bx lr

decimal_to_binary:
    ; Convert the decimal number in decimal_number to binary and store it in binary_number
    ldr r0, =decimal_number
    ldr r1, [r0]
    ldr r2, =binary_number
    mov r3, #31

convert_loop:
    ; Loop to convert each bit
    and r4, r1, #1
    strb r4, [r2, r3]
    lsr r1, r1, #1
    subs r3, r3, #1
    bge convert_loop
    bx lr

print_binary:
    ; Print the binary number stored in binary_number
    ldr r0, =binary_number
    mov r1, #32

print_loop:
    ; Loop to print each bit
    ldrb r2, [r0], #1
    add r2, r2, #'0'
    mov r7, #4
    svc #0
    subs r1, r1, #1
    bne print_loop

    ; Print a newline character
    ldr r0, =newline
    bl print_string
    bx lr

