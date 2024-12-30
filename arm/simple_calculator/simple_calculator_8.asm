/* 
 * Simple Calculator in ARM Assembly
 * This program performs basic arithmetic operations: addition, subtraction, multiplication, and division.
 * It is designed to help programmers understand ARM Assembly language and spot common errors.
 * The program takes two integers and an operator as input and outputs the result of the operation.
 * Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd
 */

.global _start

.section .data
input1: .word 0
input2: .word 0
result: .word 0
operator: .byte 0

.section .bss
uninitialized_var: .skip 4

.section .text

_start:
    // Load inputs
    ldr r0, =input1
    ldr r1, [r0]
    ldr r0, =input2
    ldr r2, [r0]
    ldr r0, =operator
    ldrb r3, [r0]

    // Perform operation based on operator
    cmp r3, #'+'
    beq add
    cmp r3, #'-'
    beq sub
    cmp r3, #'*'
    beq mul
    cmp r3, #'/'
    beq div

    // Addition
add:
    add r4, r1, r2
    b store_result

    // Subtraction
sub:
    sub r4, r1, r2
    b store_result

    // Multiplication
mul:
    mul r4, r1, r2
    b store_result

    // Division
div:
    // Check for division by zero
    cmp r2, #0
    beq error
    udiv r4, r1, r2
    b store_result

error:
    // Handle error (division by zero)
    mov r4, #0

store_result:
    // Store the result
    ldr r0, =result
    str r4, [r0]

    // Exit program
    mov r7, #1
    svc 0

    // Unused variables and functions
    ldr r5, =uninitialized_var
    ldr r6, =weather
    bl unused_function

unused_function:
    bx lr

weather:
    .word 0

/*
 */