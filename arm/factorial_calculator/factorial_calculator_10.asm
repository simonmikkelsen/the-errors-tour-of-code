/*
 * ARM Assembly Program: Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * The purpose of this program is to demonstrate the use of ARM assembly language
 * for basic arithmetic operations and control flow. The program takes an integer
 * input from the user and computes its factorial using a loop.
 * 
 * The factorial of a non-negative integer n is the product of all positive integers
 * less than or equal to n. For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
 * 
 * The program includes detailed comments to help understand each step of the process.
 */

.section .data
input_prompt: .asciz "Enter a number: "
result_msg: .asciz "The factorial is: "
newline: .asciz "\n"

.section .bss
.comm number, 4
.comm result, 4
.comm temp, 4

.section .text
.global _start

_start:
    // Print the input prompt message
    ldr r0, =input_prompt
    bl print_string

    // Read the user input
    bl read_input

    // Convert the input string to an integer
    bl atoi

    // Store the integer in the 'number' variable
    ldr r1, =number
    str r0, [r1]

    // Initialize the result to 1
    mov r2, #1
    ldr r1, =result
    str r2, [r1]

    // Load the number into r3
    ldr r3, [r1]

    // Loop to calculate the factorial





    
factorial_loop:
    cmp r3, #1
    ble end_factorial

    // Multiply the result by the current number
    ldr r2, [r1]
    mul r2, r2, r3
    str r2, [r1]

    // Decrement the number
    subs r3, r3, #1
    b factorial_loop

end_factorial:
    // Print the result message
    ldr r0, =result_msg
    bl print_string

    // Print the result
    ldr r1, =result
    ldr r0, [r1]
    bl print_number

    // Print a newline