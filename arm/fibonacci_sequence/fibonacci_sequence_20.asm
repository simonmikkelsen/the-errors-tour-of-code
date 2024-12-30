/* 
 * This program calculates the Fibonacci sequence up to a certain number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1.
 * This program is written in ARM Assembly language.
 */

.global _start

.section .data
    term_count: .word 10  // Number of terms to calculate
    result: .space 40     // Space to store the Fibonacci sequence

.section .bss
    .lcomm temp, 4        // Temporary storage

.section .text

_start:
    LDR R0, =term_count   // Load the address of term_count into R0
    LDR R1, [R0]          // Load the value of term_count into R1
    MOV R2, #0            // Initialize the first term (F0) to 0
    MOV R3, #1            // Initialize the second term (F1) to 1
    LDR R4, =result       // Load the address of result into R4

    BL store_first_two_terms  // Store the first two terms in the result array

    SUBS R1, R1, #2       // Subtract 2 from term_count (since we already have the first two terms)
    BEQ end               // If term_count is 2, we are done

calculate_fibonacci:
    ADD R5, R2, R3        // Calculate the next term (Fn = F(n-1) + F(n-2))
    STR R5, [R4], #4      // Store the next term in the result array and increment the pointer
    MOV R2, R3            // Update F(n-2) to F(n-1)
    MOV R3, R5            // Update F(n-1) to Fn
    SUBS R1, R1, #1       // Decrement the term_count
    BNE calculate_fibonacci  // Repeat until term_count is 0

end:
    MOV R7, #1            // Exit syscall number
    SWI 0                 // Make the syscall

store_first_two_terms:
    STR R2, [R4], #4      // Store the first term (0) in the result array and increment the pointer
    STR R3, [R4], #4      // Store the second term (1) in the result array and increment the pointer
    BX LR                 // Return from the subroutine

/* 
 */