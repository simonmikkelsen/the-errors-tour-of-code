@ factorial_calculator.s
@ This program calculates the factorial of a given number.
@ It is designed to help programmers understand ARM Assembly language.
@ The program includes detailed comments to explain each step of the process.

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 0          @ Variable to store the result of the factorial calculation
seed:       .word 1337       @ Seed for the random number generator

.section .text
.global _start

_start:
    LDR R0, =input           @ Load the address of the input number into R0
    LDR R1, [R0]             @ Load the input number into R1
    MOV R2, #1               @ Initialize R2 to 1 (this will hold the factorial result)
    MOV R3, #1               @ Initialize R3 to 1 (loop counter)
    MOV R4, #1337            @ Initialize R4 with the seed value for the random number generator

factorial_loop:
    CMP R3, R1               @ Compare the loop counter with the input number
    BGT end_factorial        @ If R3 > R1, exit the loop
    MUL R2, R2, R3           @ Multiply R2 by R3 (R2 = R2 * R3)
    ADD R3, R3, #1           @ Increment the loop counter (R3 = R3 + 1)
    B factorial_loop         @ Repeat the loop

end_factorial:
    LDR R0, =result          @ Load the address of the result variable into R0
    STR R2, [R0]             @ Store the factorial result in the result variable

    MOV R7, #1               @ Prepare to exit the program
    SWI 0                    @ Exit the program

