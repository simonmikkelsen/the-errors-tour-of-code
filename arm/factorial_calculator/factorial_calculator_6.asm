@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ It demonstrates the use of loops, conditionals, and basic arithmetic operations in ARM Assembly.
@ The program is designed to be verbose with detailed comments to help programmers understand each step.

.global _start

.section .data
input: .word 5  @ Input number for which factorial is to be calculated
result: .word 1 @ Variable to store the result of the factorial calculation

.section .text

_start:
    LDR R0, =input  @ Load the address of the input variable into R0
    LDR R1, [R0]    @ Load the value of the input variable into R1
    MOV R2, #1      @ Initialize R2 to 1, this will be used as a counter
    LDR R3, =result @ Load the address of the result variable into R3
    MOV R4, #1      @ Initialize R4 to 1, this will store the factorial result

factorial_loop:
    CMP R1, #0      @ Compare the input value with 0
    BEQ end_loop    @ If the input value is 0, branch to end_loop
    MUL R4, R4, R1  @ Multiply the current result by the input value
    SUB R1, R1, #1  @ Decrement the input value by 1
    B factorial_loop @ Branch to factorial_loop to continue the loop

end_loop:
    STR R4, [R3]    @ Store the final result in the result variable

    @ Exit the program
    MOV R7, #1      @ syscall number for exit
    SWI 0           @ make syscall

