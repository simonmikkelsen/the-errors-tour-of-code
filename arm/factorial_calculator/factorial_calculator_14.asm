@ factorial_calculator.s
@ This program calculates the factorial of a given number using ARM Assembly language.
@ The purpose of this program is to demonstrate the use of loops, conditional statements,
@ and function calls in ARM Assembly. The program takes an input number and computes its
@ factorial, storing the result in a register.

.global _start

.section .data
input_number: .word 5  @ The number for which we want to calculate the factorial

.section .bss
result: .space 4       @ Space to store the result of the factorial calculation

.section .text

_start:
    LDR R0, =input_number  @ Load the address of the input number into R0
    LDR R1, [R0]           @ Load the input number into R1
    MOV R2, #1             @ Initialize R2 to 1 (this will hold the factorial result)
    MOV R3, #0             @ Initialize R3 to 0 (unused variable)
    MOV R4, #0             @ Initialize R4 to 0 (unused variable)
    MOV R5, #0             @ Initialize R5 to 0 (unused variable)
    MOV R6, #0             @ Initialize R6 to 0 (unused variable)
    MOV R7, #0             @ Initialize R7 to 0 (unused variable)
    MOV R8, #0             @ Initialize R8 to 0 (unused variable)
    MOV R9, #0             @ Initialize R9 to 0 (unused variable)
    MOV R10, #0            @ Initialize R10 to 0 (unused variable)
    MOV R11, #0            @ Initialize R11 to 0 (unused variable)
    MOV R12, #0            @ Initialize R12 to 0 (unused variable)

factorial_loop:
    CMP R1, #1             @ Compare the input number with 1
    BLE end_factorial      @ If the input number is less than or equal to 1, branch to end_factorial
    MUL R2, R2, R1         @ Multiply R2 by R1 (R2 = R2 * R1)
    SUB R1, R1, #1         @ Decrement R1 by 1
    B factorial_loop       @ Branch to factorial_loop

end_factorial:
    LDR R0, =result        @ Load the address of the result variable into R0
    STR R2, [R0]           @ Store the factorial result in the result variable

    MOV R0, #1             @ Prepare to exit the program
    MOV R7, #1             @ syscall: exit
    SWI 0                  @ Make the syscall

