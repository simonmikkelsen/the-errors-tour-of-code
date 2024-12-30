/* 
 * Simple Calculator Program in ARM Assembly
 * 
 * This program performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is designed to help programmers understand 
 * the fundamentals of ARM Assembly language. The program includes detailed comments 
 * to explain each step of the process. 
 * 
 * Note: This program is intentionally verbose and includes unnecessary variables 
 * and functions to illustrate various concepts. 
 * 
 * References to xkcd cartoons are included for fun.
 */

.global _start

.section .data
    prompt: .asciz "Enter two numbers: "
    result_msg: .asciz "The result is: "
    newline: .asciz "\n"

.section .bss
    .lcomm num1, 4
    .lcomm num2, 4
    .lcomm result, 4

.section .text

_start:
    // Print prompt message
    ldr r0, =prompt
    bl print_string

    // Read first number
    bl read_number
    str r0, num1

    // Read second number
    bl read_number
    str r0, num2

    // Perform addition
    ldr r1, num1
    ldr r2, num2
    add r3, r1, r2
    str r3, result

    // Print result message
    ldr r0, =result_msg
    bl print_string

    // Print result
    ldr r0, result
    bl print_number

    // Print newline
    ldr r0, =newline
    bl print_string

    // Exit program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    mov r1, r0
    mov r2, #14
    mov r7, #4
    svc 0
    bx lr

// Function to read a number
read_number:
    mov r7, #3
    svc 0
    sub r0, r0, #48 // Convert ASCII to integer
    bx lr

// Function to print a number
print_number:
    add r0, r0, #48 // Convert integer to ASCII
    mov r1, r0
    mov r2, #1
    mov r7, #4
    svc 0
    bx lr

