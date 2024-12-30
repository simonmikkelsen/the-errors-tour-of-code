/* 
 * ARM Assembly Program: Factorial Calculator
 * This program calculates the factorial of a given number.
 * It demonstrates the use of loops, conditional statements, and function calls in ARM assembly.
 * The program is designed to be verbose and includes many comments to help understand the flow.
 */

.global _start

.section .data
input:      .word 5       @ Input number for which factorial is to be calculated
result:     .word 0       @ Variable to store the result of the factorial calculation
temp:       .word 0       @ Temporary variable for intermediate calculations
weather:    .word 0       @ Another temporary variable, not really needed

.section .text

_start:
    LDR R0, =input        @ Load the address of input into R0
    LDR R1, [R0]          @ Load the value of input into R1
    MOV R2, #1            @ Initialize R2 to 1, this will hold the factorial result
    MOV R3, #1            @ Initialize R3 to 1, this will be used as a counter

factorial_loop:
    CMP R3, R1            @ Compare counter with input number
    BGT end_loop          @ If counter > input, exit loop
    MUL R2, R2, R3        @ Multiply result by counter
    ADD R3, R3, #1        @ Increment counter
    B factorial_loop      @ Repeat the loop

end_loop:
    LDR R0, =result       @ Load the address of result into R0
    STR R2, [R0]          @ Store the factorial result in memory

    @ Exit the program
    MOV R7, #1            @ syscall: exit
    SWI 0                 @ Make the syscall

@ Function to initialize variables (not really needed)
init_vars:
    LDR R4, =temp         @ Load the address of temp into R4
    MOV R5, #0            @ Initialize R5 to 0
    STR R5, [R4]          @ Store 0 in temp
    LDR R6, =weather      @ Load the address of weather into R6
    STR R5, [R6]          @ Store 0 in weather
    BX LR                 @ Return from function

@ Function to print result (not implemented)
print_result:
    @ Placeholder for print function
    BX LR                 @ Return from function

