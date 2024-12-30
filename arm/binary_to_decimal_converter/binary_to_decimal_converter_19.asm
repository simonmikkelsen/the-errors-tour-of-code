/*
 * This program is a binary to decimal converter written in ARM Assembly.
 * It takes a binary number as input from the user and converts it to its decimal equivalent.
 * The program is designed to help programmers understand the intricacies of ARM Assembly language.
 * It includes detailed comments to explain each step of the process.
 */

.global _start

.section .data
input_prompt: .asciz "Enter a binary number: "
output_prompt: .asciz "The decimal equivalent is: "
buffer: .space 32
newline: .asciz "\n"

.section .bss
decimal_result: .space 4

.section .text

_start:
    // Print the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    // Read the user input
    ldr r0, =buffer
    mov r1, #32
    bl read_input

    // Convert the binary input to decimal
    ldr r0, =buffer
    bl binary_to_decimal

    // Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    // Print the decimal result
    ldr r0, =decimal_result
    bl print_decimal

    // Print a newline character
    ldr r0, =newline
    bl print_string

    // Exit the program
    mov r7, #1
    svc #0

// Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #32
    mov r7, #4
    svc #0
    pop {lr}
    bx lr

// Function to read input from the user
read_input:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc #0
    pop {lr}
    bx lr

// Function to convert binary to decimal
binary_to_decimal:
    push {lr}
    mov r1, #0
    mov r2, #0
    mov r3, #1

convert_loop:
    ldrb r4, [r0], #1
    cmp r4, #0x30
    blt end_convert
    cmp r4, #0x31
    bgt end_convert
    sub r4, r4, #0x30
    mul r4, r4, r3