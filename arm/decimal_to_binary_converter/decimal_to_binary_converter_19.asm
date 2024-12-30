/*
 * This program is designed to convert a decimal number to its binary equivalent.
 * It takes a user input, processes it, and outputs the binary representation.
 * The program is written in ARM Assembly language to provide a low-level understanding
 * of how such conversions can be implemented at the hardware level.
 * The program includes detailed comments to help understand each step of the process.
 */

.global _start

.section .data
input_prompt: .asciz "Enter a decimal number: "
output_prompt: .asciz "Binary representation: "
buffer: .space 100

.section .bss
.comm decimal, 4

.section .text

_start:
    // Print the input prompt to the user
    ldr r0, =input_prompt
    bl print_string

    // Read user input
    ldr r0, =buffer
    bl read_input

    // Convert input to integer
    ldr r0, =buffer
    bl atoi
    str r0, decimal

    // Convert decimal to binary
    ldr r0, decimal
    bl dec_to_bin

    // Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    // Print the binary result
    ldr r0, =buffer
    bl print_string

    // Exit the program
    mov r7, #1
    svc #0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc #0
    bx lr

// Function to read input from the user
read_input:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc #0
    bx lr

// Function to convert ASCII to integer
atoi:
    mov r1, #0
atoi_loop:
    ldrb r2, [r0], #1
    cmp r2, #0
    beq atoi_done
    sub r2, r2, #48
    mul r1, r1, #10
    add r1, r1, r2
    b atoi_loop
atoi_done:
    mov r0, r1
    bx lr

// Function to convert decimal to binary
dec_to_bin:
    mov r1, r0
    ldr r2, =buffer
    add r2, r2, #99
    mov r3, #0
dec_to_bin_loop:
    cmp r1, #0
    beq dec_to_bin_done
    and r4, r1, #1
    add r4, r4, #48
    strb r4, [r2], #-1
    lsr r1, r1, #1
    b dec_to_bin_loop
dec_to_bin_done:
    mov r0, r2
    bx lr

/*
 */