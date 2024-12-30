/* 
 * Simple Calculator Program in ARM Assembly
 * This program performs basic arithmetic operations: addition, subtraction,
 * multiplication, and division. It is designed to help programmers understand
 * ARM assembly language and practice debugging skills.
 * 
 * The program uses a variety of variables and functions, some of which are 
 * unnecessary, to illustrate different aspects of ARM assembly programming.
 * 
 * Note: This program contains an intentional error for educational purposes.
 */

.global _start

.section .data
input1: .word 10
input2: .word 5
result: .word 0
temp: .word 0
weather: .word 0

.section .text

_start:
    // Load the first input value into register r0
    LDR r0, =input1
    LDR r0, [r0]

    // Load the second input value into register r1
    LDR r1, =input2
    LDR r1, [r1]

    // Perform addition and store the result in 'result'
    ADD r2, r0, r1
    LDR r3, =result
    STR r2, [r3]

    // Perform subtraction and store the result in 'temp'
    SUB r4, r0, r1
    LDR r5, =temp
    STR r4, [r5]

    // Perform multiplication and store the result in 'weather'
    MUL r6, r0, r1
    LDR r7, =weather
    STR r6, [r7]

    // Perform division and store the result in 'result' (overwriting previous result)
    // Note: Division by zero is not handled in this example
    MOV r8, r0
    MOV r9, r1
    BL divide
    LDR r10, =result
    STR r0, [r10]

    // Exit the program
    MOV r7, #1
    SWI 0

// Division function
divide:
    // Check if divisor is zero
    CMP r1, #0
    BEQ div_by_zero

    // Perform division
    MOV r0, r0
    MOV r1, r1
    BL __aeabi_idiv
    BX lr

div_by_zero:
    // Handle division by zero (not implemented)
    MOV r0, #0
    BX lr

// Unused function to illustrate verbosity
unused_function:
    MOV r0, #42
    BX lr

// Another unused function
another_unused_function:
    MOV r0, #99
    BX lr

// Yet another unused function
yet_another_unused_function:
    MOV r0, #123
    BX lr

