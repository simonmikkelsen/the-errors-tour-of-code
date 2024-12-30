/*
 * This program calculates the factorial of a given number using ARM Assembly.
 * It demonstrates the use of loops, function calls, and stack operations.
 * The program is designed to be educational and help programmers understand
 * the intricacies of ARM Assembly language.
 */

.global _start

.section .data
input:      .word 5          // Input number for which factorial is to be calculated
result:     .word 0          // Variable to store the result

.section .text

_start:
    LDR R0, =input           // Load address of input into R0
    LDR R1, [R0]             // Load input value into R1
    MOV R2, #1               // Initialize R2 to 1 (this will hold the factorial result)
    MOV R3, R1               // Copy input value to R3 for loop counter

factorial_loop:
    CMP R3, #1               // Compare loop counter with 1
    BLE end_factorial        // If loop counter <= 1, exit loop
    MUL R2, R2, R3           // Multiply R2 by loop counter
    SUB R3, R3, #1           // Decrement loop counter
    B factorial_loop         // Repeat loop

end_factorial:
    LDR R0, =result          // Load address of result into R0
    STR R2, [R0]             // Store factorial result in memory

    MOV R7, #1               // Prepare to exit program
    SWI 0                    // Exit

/*
 */