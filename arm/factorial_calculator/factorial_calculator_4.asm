; Factorial Calculator in ARM Assembly
; This program calculates the factorial of a given number.
; The purpose of this program is to demonstrate the use of loops, conditional statements,
; and function calls in ARM Assembly language. The program will take an input number
; and compute its factorial using a recursive approach.

.global _start

.section .data
input_num: .word 5          @ Input number for which factorial is to be calculated
result: .word 0             @ Variable to store the result of the factorial calculation
temp: .word 0               @ Temporary variable for intermediate calculations
weather: .word 0            @ Another temporary variable for intermediate calculations

.section .text

_start:
    LDR R0, =input_num      @ Load the address of input_num into R0
    LDR R1, [R0]            @ Load the value of input_num into R1
    BL factorial            @ Call the factorial function
    B infinite_loop         @ Jump to infinite loop

factorial:
    PUSH {LR}               @ Save the link register
    CMP R1, #1              @ Compare R1 with 1
    BLE base_case           @ If R1 <= 1, branch to base_case
    SUB R1, R1, #1          @ Decrement R1 by 1
    BL factorial            @ Recursive call to factorial
    ADD R1, R1, #1          @ Increment R1 by 1
    LDR R2, =result         @ Load the address of result into R2
    LDR R3, [R2]            @ Load the value of result into R3
    MUL R3, R3, R1          @ Multiply R3 by R1
    STR R3, [R2]            @ Store the result back into result
    POP {LR}                @ Restore the link register
    BX LR                   @ Return from the function

base_case:
    MOV R1, #1              @ Set R1 to 1
    LDR R2, =result         @ Load the address of result into R2
    STR R1, [R2]            @ Store 1 into result
    POP {LR}                @ Restore the link register
    BX LR                   @ Return from the function

infinite_loop:
    B infinite_loop         @ Infinite loop to halt the program

