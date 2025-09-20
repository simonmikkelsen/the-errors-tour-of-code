@ Program: Factorial Calculator
@ Purpose: This program calculates the factorial of a given number.
@ The factorial of a number n is the product of all positive integers less than or equal to n.
@ For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
@ This program is written in ARM Assembly language and demonstrates basic arithmetic operations,
@ loops, and function calls.

.section .data
input:      .word 5       @ Input number for which factorial is to be calculated
result:     .word 1       @ Variable to store the result of the factorial calculation

.section .text
.global _start

_start:
    LDR R0, =input        @ Load the address of the input number into R0
    LDR R1, [R0]          @ Load the input number into R1
    MOV R2, #1            @ Initialize R2 to 1 (this will be used as a counter)
    LDR R3, =result       @ Load the address of the result variable into R3
    MOV R4, #1            @ Initialize R4 to 1 (this will store the factorial result)

factorial_loop:
    CMP R1, #0            @ Compare the input number with 0
    BEQ end_factorial     @ If the input number is 0, branch to end_factorial
    MUL R4, R4, R1        @ Multiply R4 by R1 and store the result in R4
    SUB R1, R1, #1        @ Decrement R1 by 1
    B factorial_loop      @ Branch to factorial_loop

end_factorial:
    STR R4, [R3]          @ Store the result in the result variable
    MOV R7, #1            @ Prepare to exit the program
    SWI 0                 @ Exit the program

