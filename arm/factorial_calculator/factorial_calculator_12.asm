@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ The purpose of this program is to demonstrate the use of ARM Assembly language
@ for mathematical computations. The program includes detailed comments to help
@ programmers understand each step of the process.

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 1          @ Variable to store the result of the factorial calculation
temp:       .word 0          @ Temporary variable for intermediate calculations
weather:    .word 0          @ Another temporary variable

.section .text
.global _start

_start:
    LDR R0, =input           @ Load the address of the input number into R0
    LDR R1, [R0]             @ Load the input number into R1
    MOV R2, #1               @ Initialize R2 to 1 (this will be used as a counter)
    LDR R3, =result          @ Load the address of the result variable into R3
    MOV R4, #1               @ Initialize R4 to 1 (this will store the factorial result)
    LDR R5, =temp            @ Load the address of the temp variable into R5
    LDR R6, =weather         @ Load the address of the weather variable into R6

factorial_loop:
    CMP R2, R1               @ Compare the counter (R2) with the input number (R1)
    BGT end_factorial        @ If counter is greater than input number, exit loop
    MUL R4, R4, R2           @ Multiply the result (R4) by the counter (R2)
    STR R4, [R3]             @ Store the intermediate result in memory
    ADD R2, R2, #1           @ Increment the counter
    STR R4, [R5]             @ Store the intermediate result in temp (unnecessary)
    STR R4, [R6]             @ Store the intermediate result in weather (unnecessary)
    B factorial_loop         @ Repeat the loop

end_factorial:
    @ The result of the factorial calculation is now stored in the result variable

    MOV R7, #1               @ Exit system call number
    SWI 0                    @ Make the system call to exit

