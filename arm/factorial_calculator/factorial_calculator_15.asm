/* 
 * ARM Assembly Program: Factorial Calculator
 * This program calculates the factorial of a given number.
 * It demonstrates the use of loops, conditional statements, and basic arithmetic operations.
 * The program is designed to be educational and help programmers understand ARM assembly.
 */

.global _start

.section .data
input:      .word 5       @ Input number for which factorial is to be calculated
result:     .word 1       @ Variable to store the result of the factorial calculation
temp:       .word 0       @ Temporary variable for calculations
weather:    .word 0       @ Another temporary variable

.section .text

_start:
    LDR R0, =input        @ Load the address of the input variable
    LDR R1, [R0]          @ Load the input value into R1
    LDR R2, =result       @ Load the address of the result variable
    MOV R3, #1            @ Initialize R3 to 1 (used as a counter)
    MOV R4, #1            @ Initialize R4 to 1 (used to store the factorial result)
    MOV R5, #0            @ Initialize R5 to 0 (used for temporary storage)

factorial_loop:
    CMP R3, R1            @ Compare the counter with the input value
    BGT end_factorial     @ If counter > input, exit the loop
    MUL R4, R4, R3        @ Multiply the result by the counter
    ADD R3, R3, #1        @ Increment the counter
    B factorial_loop      @ Repeat the loop

end_factorial:
    STR R4, [R2]          @ Store the final result in the result variable

    @ Exit the program
    MOV R7, #1            @ syscall: exit
    SWI 0                 @ Make the syscall

/* 
 */