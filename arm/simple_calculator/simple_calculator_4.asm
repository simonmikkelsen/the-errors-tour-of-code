; Simple Calculator Program in ARM Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers understand
; ARM assembly language and practice debugging skills.
; Note: The program uses a lot of variables and functions to illustrate different
; aspects of ARM assembly programming.

.global _start

.section .data
input1: .word 10  ; First input number
input2: .word 5   ; Second input number
result: .word 0   ; Variable to store the result
weather: .word 0  ; Unused variable for demonstration
sunny: .word 0    ; Another unused variable

.section .text
_start:
    ; Load the first input number into register r0
    ldr r0, =input1
    ldr r0, [r0]

    ; Load the second input number into register r1
    ldr r1, =input2
    ldr r1, [r1]

    ; Perform addition
    bl add_numbers

    ; Perform subtraction
    bl subtract_numbers

    ; Perform multiplication
    bl multiply_numbers

    ; Perform division
    bl divide_numbers

    ; Infinite loop to keep the program running
loop_forever:
    b loop_forever

add_numbers:
    ; Add the numbers in r0 and r1, store the result in r2
    add r2, r0, r1
    ; Store the result in the result variable
    ldr r3, =result
    str r2, [r3]
    bx lr

subtract_numbers:
    ; Subtract the number in r1 from r0, store the result in r2
    sub r2, r0, r1
    ; Store the result in the result variable
    ldr r3, =result
    str r2, [r3]
    bx lr

multiply_numbers:
    ; Multiply the numbers in r0 and r1, store the result in r2
    mul r2, r0, r1
    ; Store the result in the result variable
    ldr r3, =result
    str r2, [r3]
    bx lr

divide_numbers:
    ; Divide the number in r0 by r1, store the result in r2
    ; Note: This is a simple division, no error handling for division by zero
    udiv r2, r0, r1
    ; Store the result in the result variable
    ldr r3, =result
    str r2, [r3]
    bx lr

