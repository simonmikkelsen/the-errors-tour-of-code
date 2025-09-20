/* 
 * ARM Assembly Program: Fibonacci Sequence
 * 
 * This program calculates the Fibonacci sequence up to a specified number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, 
 * usually starting with 0 and 1. This program is designed to help programmers understand the implementation 
 * of the Fibonacci sequence in ARM Assembly language.
 * 
 * The program uses a loop to calculate each term in the sequence and stores the results in memory.
 * It also demonstrates the use of various ARM Assembly instructions and registers.
 */

.global _start

.section .data
    num_terms: .word 10          @ Number of terms in the Fibonacci sequence
    fibonacci: .space 40         @ Space to store the Fibonacci sequence (10 terms, 4 bytes each)
    temp_storage: .space 4       @ Temporary storage for intermediate calculations

.section .text
_start:
    LDR R0, =num_terms           @ Load the address of num_terms into R0
    LDR R1, [R0]                 @ Load the value of num_terms into R1
    MOV R2, #0                   @ Initialize R2 to 0 (first term of Fibonacci sequence)
    MOV R3, #1                   @ Initialize R3 to 1 (second term of Fibonacci sequence)
    LDR R4, =fibonacci           @ Load the address of the fibonacci array into R4

    STR R2, [R4], #4             @ Store the first term (0) in the fibonacci array
    STR R3, [R4], #4             @ Store the second term (1) in the fibonacci array

    SUBS R1, R1, #2              @ Subtract 2 from num_terms (since first two terms are already stored)
    BEQ end                      @ If num_terms is 2, branch to end

loop:
    ADD R5, R2, R3               @ Calculate the next term (R5 = R2 + R3)
    STR R5, [R4], #4             @ Store the next term in the fibonacci array
    MOV R2, R3                   @ Update R2 to the previous term (R3)
    MOV R3, R5                   @ Update R3 to the new term (R5)
    SUBS R1, R1, #1              @ Decrement num_terms
    BNE loop                     @ If num_terms is not zero, branch to loop

end:
    MOV R7, #1                   @ Exit syscall number
    SWI 0                        @ Make syscall to exit

/* 
 */

 