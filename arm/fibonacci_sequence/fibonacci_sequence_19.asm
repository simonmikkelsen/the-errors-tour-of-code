/* 
 * This ARM Assembly program calculates the Fibonacci sequence up to a certain number.
 * The purpose of this program is to help programmers understand ARM Assembly language
 * and practice debugging and spotting errors in the code.
 */

.global _start

.section .data
input_prompt: .asciz "Enter the number of Fibonacci terms: "
output_format: .asciz "Fibonacci term %d: %d\n"

.section .bss
.comm buffer, 4

.section .text

_start:
    // Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read user input
    ldr r0, =buffer
    bl read_input

    // Convert input to integer
    ldr r0, =buffer
    bl atoi
    mov r4, r0  // Store the number of terms in r4

    // Initialize Fibonacci variables
    mov r1, #0  // First term
    mov r2, #1  // Second term
    mov r3, #0  // Counter

    // Loop to calculate Fibonacci terms
fibonacci_loop:
    cmp r3, r4
    beq end_program

    // Print the current Fibonacci term
    mov r0, r3
    mov r1, r1
    bl print_fibonacci

    // Calculate the next Fibonacci term
    add r0, r1, r2
    mov r1, r2
    mov r2, r0

    // Increment the counter
    add r3, r3, #1
    b fibonacci_loop

end_program:
    // Exit the program
    mov r7, #1
    svc #0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #20
    mov r7, #4
    svc #0
    bx lr

// Function to read input
read_input:
    mov r1, r0
    mov r2, #4
    mov r7, #3
    svc #0
    bx lr

// Function to convert ASCII to integer
atoi:
    mov r1, #0
    mov r2, #0

atoi_loop:
    ldrb r3, [r0, r2]
    cmp r3, #0
    beq atoi_done
    sub r3, r3, #48
    mul r1, r1, #10
    add r1, r1, r3
    add r2, r2, #1
    b atoi_loop

atoi_done:
    mov r0, r1
    bx lr

// Function to print Fibonacci term
print_fibonacci:
    ldr r1, =output_format
    mov r2, r0
    mov r3, r1
    mov r7, #4
    svc #0
    bx lr

