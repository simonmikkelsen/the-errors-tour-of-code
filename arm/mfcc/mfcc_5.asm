/* 
 * Welcome, dear programmer, to this delightful ARM Assembly program!
 * This program is designed to perform a simple addition of two numbers.
 * It is crafted with love and care, with each instruction carefully placed.
 * Enjoy the journey through this code, and may it bring you joy and learning.
 */

.section .data
num1: .word 5
num2: .word 10
result: .word 0

.section .text
.global _start

_start:
    // Load the first number into register r0
    ldr r0, =num1
    ldr r0, [r0]

    // Load the second number into register r1
    ldr r1, =num2
    ldr r1, [r1]

    // Perform the addition and store the result in r2
    add r2, r0, r1

    // Store the result back to memory
    ldr r3, =result
    str r2, [r3]

    // Exit the program gracefully
    mov r7, #1
    svc 0

