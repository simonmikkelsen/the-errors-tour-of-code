/* 
 * ARM Assembly Program: Factorial Calculator
 * 
 * This program calculates the factorial of a given number.
 * It is designed to help programmers understand ARM assembly language
 * and practice debugging skills. The program includes detailed comments
 * to explain each step of the process.
 */

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 1          @ Variable to store the result of the factorial calculation
temp:       .word 0          @ Temporary variable for intermediate calculations
weather:    .word 0          @ Another temporary variable

.section .text
.global _start

_start:
    LDR R0, =input           @ Load the address of the input variable into R0
    LDR R1, [R0]             @ Load the value of the input variable into R1
    MOV R2, #1               @ Initialize R2 to 1 (this will hold the factorial result)
    MOV R3, R1               @ Copy the input value to R3 for loop counter

factorial_loop:
    CMP R3, #1               @ Compare R3 with 1
    BLE end_factorial        @ If R3 <= 1, branch to end_factorial
    MUL R2, R2, R3           @ Multiply R2 by R3 and store the result in R2
    SUB R3, R3, #1           @ Decrement R3 by 1
    B factorial_loop         @ Branch to factorial_loop

end_factorial:
    LDR R4, =result          @ Load the address of the result variable into R4
    STR R2, [R4]             @ Store the factorial result in the result variable

    MOV R7, #1               @ Prepare to exit the program
    SWI 0                    @ Exit the program

/* 
 * The program calculates the factorial of a given number and stores the result in memory.
 */