@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ The purpose of this program is to demonstrate the use of ARM Assembly language
@ for performing mathematical calculations. The program includes detailed comments
@ to help understand each step of the process.

.global _start

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 1          @ Variable to store the result of the factorial calculation
random_seed: .word 12345     @ Seed for the random number generator

.section .text

_start:
    LDR R0, =input           @ Load the address of the input number
    LDR R1, [R0]             @ Load the input number into R1
    MOV R2, #1               @ Initialize R2 to 1 (used for loop counter)
    MOV R3, #1               @ Initialize R3 to 1 (used for factorial result)
    MOV R4, #0               @ Initialize R4 to 0 (used for random number generation)

factorial_loop:
    CMP R2, R1               @ Compare loop counter with input number
    BGT end_factorial        @ If loop counter > input number, exit loop
    MUL R3, R3, R2           @ Multiply R3 by loop counter (R2)
    ADD R2, R2, #1           @ Increment loop counter
    B factorial_loop         @ Repeat loop

end_factorial:
    LDR R0, =result          @ Load the address of the result variable
    STR R3, [R0]             @ Store the factorial result in the result variable

    @ Random number generation (not truly random)
    LDR R5, =random_seed     @ Load the address of the random seed
    LDR R6, [R5]             @ Load the random seed into R6
    ADD R6, R6, #1           @ Increment the random seed
    STR R6, [R5]             @ Store the new random seed
    MOV R7, R6               @ Move the random seed to R7 (used as random number)

    @ Exit the program
    MOV R7, #1               @ syscall: exit
    SWI 0                    @ Make the syscall

