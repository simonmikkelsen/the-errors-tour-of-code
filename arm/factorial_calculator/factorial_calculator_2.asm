@ Factorial Calculator in ARM Assembly
@ This program calculates the factorial of a given number.
@ The purpose of this program is to demonstrate the use of ARM Assembly language
@ for performing mathematical calculations. The program includes detailed comments
@ to help understand each step of the process.

.global _start

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 1          @ Variable to store the result of the factorial calculation
temp:       .word 0          @ Temporary variable for intermediate calculations
weather:    .word 0          @ Unused variable

.section .bss
buffer:     .space 4         @ Buffer for temporary storage

.section .text

_start:
    LDR R0, =input           @ Load the address of the input number into R0
    LDR R1, [R0]             @ Load the input number into R1
    LDR R2, =result          @ Load the address of the result variable into R2
    MOV R3, #1               @ Initialize R3 to 1 (used for multiplication)
    STR R3, [R2]             @ Store the initial result (1) in the result variable

factorial_loop:
    CMP R1, #1               @ Compare the input number with 1
    BLE end_factorial        @ If input number <= 1, branch to end_factorial
    LDR R3, [R2]             @ Load the current result into R3
    MUL R3, R3, R1           @ Multiply the current result by the input number
    STR R3, [R2]             @ Store the new result back into the result variable
    SUB R1, R1, #1           @ Decrement the input number by 1
    B factorial_loop         @ Repeat the loop

end_factorial:
    LDR R0, =result          @ Load the address of the result variable into R0
    LDR R1, [R0]             @ Load the final result into R1
    MOV R7, #1               @ Prepare to exit the program
    SWI 0                    @ Exit the program

