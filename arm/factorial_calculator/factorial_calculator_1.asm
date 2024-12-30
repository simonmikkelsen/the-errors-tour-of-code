@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ The purpose of this program is to demonstrate the use of ARM Assembly language
@ for performing mathematical calculations. The program will take an input number
@ and compute its factorial using a loop-based approach. The result will be stored
@ in a register and can be observed using a debugger or printed to the console.

.global _start

.section .data
input_num: .word 5  @ Input number for which factorial is to be calculated

.section .text

_start:
    LDR R0, =input_num  @ Load address of input number
    LDR R1, [R0]        @ Load input number into R1
    MOV R2, #1          @ Initialize result to 1
    MOV R3, #1          @ Initialize counter to 1
    MOV R4, #0          @ Initialize temporary variable to 0
    MOV R5, #0          @ Initialize another temporary variable to 0
    MOV R6, #0          @ Initialize yet another temporary variable to 0

factorial_loop:
    CMP R3, R1          @ Compare counter with input number
    BGT end_loop        @ If counter > input number, exit loop

    MUL R2, R2, R3      @ Multiply result by counter
    ADD R3, R3, #1      @ Increment counter

    MOV R4, R2          @ Unnecessary move to temporary variable
    MOV R5, R4          @ Another unnecessary move
    MOV R6, R5          @ Yet another unnecessary move

    B factorial_loop    @ Repeat loop

end_loop:
    MOV R7, #1          @ Exit system call number
    SWI 0               @ Make system call to exit

