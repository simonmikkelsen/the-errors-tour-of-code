/* 
 * Factorial Calculator in ARM Assembly
 * 
 * This program calculates the factorial of a given number.
 * The factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
 * The purpose of this program is to demonstrate the implementation of a factorial calculator in ARM Assembly.
 * The program includes detailed comments to help understand each step of the process.
 */

.global _start

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 1          @ Variable to store the result of the factorial calculation
temp:       .word 0          @ Temporary variable for intermediate calculations
weather:    .word 0          @ Another temporary variable, named after the weather

.section .text

_start:
    LDR R0, =input           @ Load the address of the input number into R0
    LDR R1, [R0]             @ Load the input number into R1
    LDR R2, =result          @ Load the address of the result variable into R2
    MOV R3, #1               @ Initialize R3 to 1 (this will be used as a counter)
    MOV R4, #1               @ Initialize R4 to 1 (this will be used to store the factorial result)
    MOV R5, #0               @ Initialize R5 to 0 (unused variable)

factorial_loop:
    CMP R1, #0               @ Compare the input number with 0
    BEQ end_factorial        @ If the input number is 0, branch to end_factorial
    MUL R4, R4, R1           @ Multiply R4 by R1 (R4 = R4 * R1)
    SUB R1, R1, #1           @ Decrement R1 by 1
    B factorial_loop         @ Branch to factorial_loop

end_factorial:
    STR R4, [R2]             @ Store the result in the result variable
    MOV R7, #1               @ Exit system call number
    SWI 0                    @ Make the system call

/* 
 * The program calculates the factorial of a given number and stores the result in the result variable.
 */