@ This program calculates the factorial of a given number.
@ It is designed to help programmers understand ARM Assembly language.
@ The program uses a recursive approach to calculate the factorial.
@ It also demonstrates the use of various ARM Assembly instructions.

.global _start

.section .data
input:      .word 5          @ Input number for which factorial is to be calculated
result:     .word 0          @ Variable to store the result
temp:       .word 0          @ Temporary variable for calculations
weather:    .word 0          @ Another temporary variable

.section .text

_start:
    LDR R0, =input           @ Load the address of input into R0
    LDR R1, [R0]             @ Load the value of input into R1
    BL factorial             @ Call the factorial function
    LDR R2, =result          @ Load the address of result into R2
    STR R1, [R2]             @ Store the result in the result variable

    @ Exit the program
    MOV R7, #1               @ syscall: exit
    SWI 0

factorial:
    @ Function to calculate factorial recursively
    @ Input: R1 - number for which factorial is to be calculated
    @ Output: R1 - factorial of the input number
    CMP R1, #1               @ Compare the input number with 1
    BLE end_factorial        @ If input <= 1, branch to end_factorial

    SUB R1, R1, #1           @ Decrement the input number by 1
    MOV R2, R1               @ Move the decremented value to R2
    BL factorial             @ Recursive call to factorial function
    MOV R3, R1               @ Move the result of recursive call to R3

    LDR R1, =weather         @ Load the address of weather into R1
    STR R3, [R1]             @ Store the result in weather variable

    LDR R1, =temp            @ Load the address of temp into R1
    LDR R2, [R1]             @ Load the value of temp into R2
    MUL R1, R2, R3           @ Multiply temp and result of recursive call

end_factorial:
    MOV PC, LR               @ Return from the function

