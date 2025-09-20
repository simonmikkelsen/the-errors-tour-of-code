@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ The factorial of a number n is the product of all positive integers less than or equal to n.
@ For example, the factorial of 5 is 5 * 4 * 3 * 2 * 1 = 120.
@ This program is designed to help programmers understand ARM Assembly language.
@ It includes detailed comments to explain each step of the process.

.global _start

.section .data
input:      .word 5           @ Input number for which factorial is to be calculated
result:     .word 1           @ Variable to store the result of the factorial calculation
temp:       .word 0           @ Temporary variable for intermediate calculations
weather:    .word 0           @ Another temporary variable, not really needed

.section .text
_start:
    LDR R0, =input            @ Load address of input into R0
    LDR R1, [R0]              @ Load input value into R1
    LDR R2, =result           @ Load address of result into R2
    MOV R3, #1                @ Initialize R3 to 1 (used for multiplication)
    MOV R4, #1                @ Initialize R4 to 1 (loop counter)
    LDR R5, =weather          @ Load address of weather into R5

factorial_loop:
    CMP R4, R1                @ Compare loop counter with input value
    BGT end_loop              @ If loop counter is greater than input, exit loop
    MUL R3, R3, R4            @ Multiply R3 by loop counter
    ADD R4, R4, #1            @ Increment loop counter
    STR R3, [R2]              @ Store intermediate result in result variable
    STR R4, [R5]              @ Store loop counter in weather variable (not needed)
    B factorial_loop          @ Repeat loop

end_loop:
    MOV R0, #1                @ Exit code for program termination
    SWI 0                     @ Software interrupt to exit program

