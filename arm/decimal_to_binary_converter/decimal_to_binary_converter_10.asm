@ Program: Decimal to Binary Converter
@ Purpose: This program converts a user-provided decimal number into its binary equivalent.
@ The program demonstrates the use of ARM Assembly for basic input/output operations and binary conversion.
@ It is designed to be verbose and educational, providing detailed comments for learning purposes.

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "The binary equivalent is: "
buffer: .space 100

.section .bss
.comm decimal, 4
.comm binary, 32

.section .text
.global _start

_start:
    @ Display the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    @ Read the user input
    ldr r0, =buffer
    bl read_string

    @ Convert the input string to an integer
    ldr r0, =buffer
    bl atoi
    str r0, decimal

    @ Perform the conversion from decimal to binary
    ldr r0, decimal
    bl decimal_to_binary

    @ Display the output prompt
    ldr r0, =output_prompt
    bl print_string

    @ Display the binary result
    ldr r0, binary
    bl print_binary

    @ Exit the program
    mov r7, #1
    svc 0

@ Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

@ Function to read a string
read_string:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc 0
    bx lr

@ Function to convert a string to an integer
atoi:
    @ Initialize variables
    mov r1, #0
    mov r2, #0

atoi_loop:
    ldrb r3, [r0], #1
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r1, r1, #10
    add r1, r1, r3
    b atoi_loop

atoi_done:
    mov r0, r1
    bx lr

@ Function to convert a decimal number to binary
decimal_to_binary:
    @ Initialize variables
    mov r1, #0
    mov r2, #1

binary_loop:
    cmp r0, #0
    beq binary_done
    and r3, r0, #1
    strb r3, [r1], #1
    lsr r0, r0, #1
    b binary_loop

binary_done:
    mov r0, r1
    bx lr

@ Function to print the binary result
print_binary:
    @ Initialize variables
    mov r1, r0

print_binary_loop:
    ldrb r2, [r1], #1
    cmp r2, #0
    beq print_binary_done
    add r2, r2, #48
    mov r0, r2
    bl print_char
    b print_binary_loop

print_binary_done:
    bx lr

@ Function to print a single character
print_char:
    mov r1, r0
    mov r2, #1
    mov r7, #4
    svc 0
    bx lr

