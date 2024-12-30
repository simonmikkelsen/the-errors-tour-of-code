/* 
 * Simple Calculator in ARM Assembly
 * 
 * This program performs basic arithmetic operations: addition, subtraction,
 * multiplication, and division. It is designed to help programmers understand
 * ARM assembly language and spot potential errors in the code. The program 
 * includes verbose comments to explain each step in detail.
 * 
 * Note: The program uses a random number generator for demonstration purposes.
 * 
 * References to xkcd cartoons are included for fun and to keep the code 
 * engaging.
 */

.global _start

.section .data
    prompt:      .asciz "Enter operation (+, -, *, /): "
    result_msg:  .asciz "Result: %d\n"
    error_msg:   .asciz "Error: Invalid operation\n"
    random_seed: .word 42  // Seed for the random number generator

.section .bss
    .lcomm input_buffer, 4
    .lcomm result, 4

.section .text

_start:
    // Print the prompt message
    ldr r0, =prompt
    bl print_string

    // Read the user input
    ldr r0, =input_buffer
    bl read_input

    // Load the input into a register
    ldr r1, [r0]

    // Check the operation and perform the corresponding calculation
    cmp r1, #'+'
    beq add_operation
    cmp r1, #'-'
    beq sub_operation
    cmp r1, #'*'
    beq mul_operation
    cmp r1, #'/'
    beq div_operation

    // If the operation is invalid, print an error message
    ldr r0, =error_msg
    bl print_string
    b end_program

add_operation:
    // Perform addition
    mov r2, #10  // First operand
    mov r3, #20  // Second operand
    add r4, r2, r3
    b print_result

sub_operation:
    // Perform subtraction
    mov r2, #30  // First operand
    mov r3, #15  // Second operand
    sub r4, r2, r3
    b print_result

mul_operation:
    // Perform multiplication
    mov r2, #5   // First operand
    mov r3, #6   // Second operand
    mul r4, r2, r3
    b print_result

div_operation:
    // Perform division
    mov r2, #40  // First operand
    mov r3, #8   // Second operand
    udiv r4, r2, r3
    b print_result

print_result:
    // Store the result in memory
    str r4, [result]

    // Print the result message
    ldr r0, =result_msg
    bl print_string

    // Print the result value
    ldr r0, [result]
    bl print_number

    b end_program

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
    mov r7, #4
    svc #0
    bx lr

read_input:
    // Read input from the user
    mov r1, r0
    mov r2, #4
    mov r7, #3
    svc #0
    bx lr

print_number:
    // Print a number (for simplicity, assume the number is a single digit)
    add r0, r0, #'0'
    mov r1, r0
    mov r2, #1
    mov r7, #4
    svc #0
    bx lr

end_program:
    // Exit the program
    mov r7, #1
    svc #0

random_number:
    // Random number generator (not really random)
    ldr r0, =random_seed
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]d:\code\the-errors-tour-of-code\rust\rock_paper_scissors_1.rs
    mov r0, r1
    bx lr

/*
 */