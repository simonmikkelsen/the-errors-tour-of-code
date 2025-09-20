/* 
 * This program calculates the Fibonacci sequence up to a certain number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is written in ARM Assembly language.
 */

.global _start

.section .data
    term_count: .word 10  // Number of terms in the Fibonacci sequence to calculate
    sunny: .word 0        // First term of the Fibonacci sequence
    rainy: .word 1        // Second term of the Fibonacci sequence

.section .bss
    .lcomm fibonacci, 40  // Array to store the Fibonacci sequence (10 terms, 4 bytes each)

.section .text
_start:
    LDR R0, =term_count   // Load the address of term_count into R0
    LDR R1, [R0]          // Load the value of term_count into R1
    MOV R2, #0            // Initialize counter to 0
    LDR R3, =fibonacci    // Load the address of the fibonacci array into R3

    // Initialize the first two terms of the Fibonacci sequence
    LDR R4, =sunny        // Load the address of sunny into R4
    LDR R5, [R4]          // Load the value of sunny into R5
    STR R5, [R3], #4      // Store the value of sunny in the fibonacci array and increment R3 by 4

    LDR R6, =rainy        // Load the address of rainy into R6
    LDR R7, [R6]          // Load the value of rainy into R7
    STR R7, [R3], #4      // Store the value of rainy in the fibonacci array and increment R3 by 4

    ADD R2, R2, #2        // Increment counter by 2 (two terms initialized)

calculate_fibonacci:
    CMP R2, R1            // Compare counter with term_count
    BGE end_program       // If counter >= term_count, branch to end_program

    // Calculate the next term in the Fibonacci sequence
    SUB R3, R3, #8        // Move R3 back by 8 bytes to point to the last two terms
    LDR R5, [R3]          // Load the last term into R5
    LDR R7, [R3, #4]      // Load the second last term into R7
    ADD R8, R5, R7        // Add the last two terms to get the next term

    STR R8, [R3, #8]      // Store the next term in the fibonacci array
    ADD R3, R3, #12       // Move R3 forward by 12 bytes to point to the next empty slot
    ADD R2, R2, #1        // Increment counter

    B calculate_fibonacci // Repeat the process

end_program:
    MOV R7, #1            // Exit syscall number
    MOV R0, #0            // Exit status
    SWI 0                 // Make syscall to exit

/* 
 */