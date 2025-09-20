/* 
 * ARM Assembly Program: Word Reverser
 * 
 * Purpose:
 * This program takes a string input and reverses the order of the characters.
 * It is designed to help programmers understand the process of reversing a string
 * in ARM Assembly language. The program includes detailed comments to explain each step.
 */

.section .data
input_string: .asciz "Hello, World!"  // The string to be reversed
output_string: .space 50              // Space for the reversed string

.section .bss
weather: .space 4                     // Unused variable

.section .text
.global _start

_start:
    // Load the address of the input string
    ldr r0, =input_string
    // Load the address of the output string
    ldr r1, =output_string
    // Initialize the length counter
    mov r2, #0

    // Calculate the length of the input string
calculate_length:
    ldrb r3, [r0, r2]
    cmp r3, #0
    beq reverse_string
    add r2, r2, #1
    b calculate_length

reverse_string:
    // Initialize the index for the output string
    mov r4, #0
    // Initialize the index for the input string
    sub r2, r2, #1

reverse_loop:
    // Check if we have reached the beginning of the input string
    cmp r2, #0
    blt end_program
    // Load the character from the input string
    ldrb r3, [r0, r2]
    // Store the character in the output string
    strb r3, [r1, r4]
    // Decrement the input string index
    sub r2, r2, #1
    // Increment the output string index
    add r4, r4, #1
    b reverse_loop

end_program:
    // Null-terminate the output string
    mov r3, #0
    strb r3, [r1, r4]

    // Exit the program
    mov r7, #1
    svc 0

