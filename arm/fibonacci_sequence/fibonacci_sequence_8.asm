/* 
 * This program calculates the Fibonacci sequence up to the 10th number.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is written in ARM Assembly language.
 */

.global _start

.section .data
output: .asciz "Fibonacci sequence: %d\n"

.section .bss
.lcomm result, 4

.section .text

_start:
    MOV R0, #0          // Initialize the first number of the Fibonacci sequence
    MOV R1, #1          // Initialize the second number of the Fibonacci sequence
    MOV R2, #10         // Set the limit for the sequence
    MOV R3, #0          // Initialize counter

loop:
    CMP R3, R2          // Compare counter with limit
    BEQ end             // If counter equals limit, end the loop

    ADD R4, R0, R1      // Calculate the next number in the sequence
    STR R4, [result]    // Store the result in memory

    MOV R0, R1          // Move the second number to the first number
    MOV R1, R4          // Move the result to the second number

    ADD R3, R3, #1      // Increment the counter
    B loop              // Repeat the loop

end:
    MOV R7, #1          // Exit syscall number
    SWI 0               // Make syscall

/* 
 */