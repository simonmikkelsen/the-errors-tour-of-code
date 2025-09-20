/*
 * This program calculates the Fibonacci sequence up to the 10th number.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is written in ARM Assembly language.
 * The purpose of this program is to help programmers understand the implementation of the Fibonacci sequence in assembly.
 * The program uses a loop to calculate each number in the sequence and stores the result in memory.
 */

.global _start

.section .data
fib_sequence: .space 40  // Allocate space for 10 Fibonacci numbers (4 bytes each)

.section .text
_start:
    MOV R0, #0          // Initialize the first number in the sequence to 0
    MOV R1, #1          // Initialize the second number in the sequence to 1
    LDR R2, =fib_sequence // Load the address of the Fibonacci sequence array
    STR R0, [R2], #4    // Store the first number in the array and increment the pointer
    STR R1, [R2], #4    // Store the second number in the array and increment the pointer

    MOV R3, #8          // Initialize the loop counter to 8 (we already have the first two numbers)

calculate_fibonacci:
    LDR R4, [R2, #-8]   // Load the (n-2)th number from the array
    LDR R5, [R2, #-4]   // Load the (n-1)th number from the array
    ADD R6, R4, R5      // Calculate the nth number by adding the (n-2)th and (n-1)th numbers
    STR R6, [R2], #4    // Store the nth number in the array and increment the pointer

    SUB R3, R3, #1      // Decrement the loop counter
    CMP R3, #0          // Compare the loop counter with 0
    BNE calculate_fibonacci // If the loop counter is not 0, repeat the loop

end_program:
    MOV R7, #1          // Exit system call number
    MOV R0, #0          // Exit status
    SWI 0               // Make the system call to exit

/*
 */