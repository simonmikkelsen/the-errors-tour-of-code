; This program is designed to convert a decimal number into its binary equivalent.
; It takes an integer input from the user, processes it, and outputs the binary representation.
; The program is written in ARM Assembly language, showcasing the intricacies of low-level programming.
; The purpose is to provide a comprehensive understanding of binary conversion and ARM Assembly syntax.

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary representation is: "
newline: .asciz "\n"

.section .bss
.comm decimal_input, 4
.comm binary_output, 32

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the decimal input from the user
    bl read_decimal

    ; Convert the decimal input to binary
    bl decimal_to_binary

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the binary output
    bl print_binary

    ; Exit the program
    mov r7, #1
    svc #0

print_string:
    ; Function to print a string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r2, r2, #1
    svc #0
    b print_loop
print_done:
    bx lr

read_decimal:
    ; Function to read a decimal number from the user
    mov r0, #0
    mov r1, decimal_input
    mov r2, #4
    svc #0
    ldr r0, decimal_input
    bx lr

decimal_to_binary:
    ; Function to convert a decimal number to binary
    mov r1, r0
    mov r2, #0
    mov r3, #1
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0
    mov r8, #0
    mov r9, #0
    mov r10, #0
    mov r11, #0
    mov r12, #0
    mov r13, #0
    mov r14, #0
    mov r15, #0
convert_loop:
    and r3, r1, #1
    strb r3, [r2]
    lsr r1, r1, #1
    add r2, r2, #1
    cmp r1, #0
    bne convert_loop
    bx lr

print_binary:
    ; Function to print the binary output
    mov r1, binary_output
    mov r2, #0
print_binary_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_binary_done
    mov r0, #1
    add r2, r2, #1
    svc #0
    b print_binary_loop
print_binary_done:
    ldr r0, =newline
    bl print_string
    bx lr

