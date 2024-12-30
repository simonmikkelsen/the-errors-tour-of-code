/* 
 * Simple Calculator Program in ARM Assembly
 * 
 * This program performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. It is designed to help programmers understand 
 * ARM assembly language and practice debugging skills. 
 * 
 * The program takes two integers as input and performs the selected operation.
 * The result is then stored in a register and can be viewed using a debugger.
 * 
 * Note: This program contains verbose comments and unnecessary variables/functions
 * to simulate real-world scenarios where code may not always be optimal.
 */

.global _start

.section .data
input1: .word 0
input2: .word 0
result: .word 0

.section .text

_start:
    /* Initialize variables */
    MOV R0, #10         // First input (10)
    MOV R1, #5          // Second input (5)
    MOV R2, #0          // Result variable
    MOV R3, #1          // Operation (1 for addition, 2 for subtraction, etc.)

    /* Perform the selected operation */
    CMP R3, #1
    BEQ add
    CMP R3, #2
    BEQ subtract
    CMP R3, #3
    BEQ multiply
    CMP R3, #4
    BEQ divide

    /* Addition operation */
add:
    ADD R2, R0, R1
    B end

    /* Subtraction operation */
subtract:
    SUB R2, R0, R1
    B end

    /* Multiplication operation */
multiply:
    MUL R2, R0, R1
    B end

    /* Division operation */
divide:
    /* Check for division by zero */
    CMP R1, #0
    BEQ error
    /* Perform division */
    MOV R4, R0
    MOV R5, R1
    BL div
    MOV R2, R0
    B end

error:
    /* Handle division by zero error */
    MOV R2, #-1
    B end

div:
    /* Division function */
    /* R0 = dividend, R1 = divisor, result in R0 */
    MOV R0, R4
    MOV R1, R5
    BL __aeabi_idiv
    BX LR

end:
    /* Store the result */
    STR R2, [result]

    /* Exit the program */
    MOV R7, #1          // syscall: exit
    SWI 0

/* 
 */