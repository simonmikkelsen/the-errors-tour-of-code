@ This program calculates the Fibonacci sequence up to a certain number of terms.
@ The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
@ The sequence starts with 0 and 1, and each subsequent number is the sum of the previous two.
@ This program is written in ARM Assembly language and is intended to help programmers understand
@ how to implement the Fibonacci sequence in assembly language.

.global _start

.section .data
    term_count: .word 10 @ Number of terms in the Fibonacci sequence to calculate
    result: .word 0 @ Variable to store the result
    temp: .word 0 @ Temporary variable for calculations
    sunny: .word 0 @ Another temporary variable for calculations

.section .text

_start:
    LDR R0, =term_count @ Load the address of term_count into R0
    LDR R1, [R0] @ Load the value of term_count into R1
    MOV R2, #0 @ Initialize the first term (F0) to 0
    MOV R3, #1 @ Initialize the second term (F1) to 1
    MOV R4, #2 @ Initialize the loop counter to 2

loop:
    CMP R4, R1 @ Compare the loop counter with the number of terms
    BGE end @ If the loop counter is greater than or equal to the number of terms, exit the loop

    ADD R5, R2, R3 @ Calculate the next term in the sequence
    STR R5, [R0, R4, LSL #2] @ Store the result in the result array

    MOV R2, R3 @ Update the first term to the second term
    MOV R3, R5 @ Update the second term to the new term

    ADD R4, R4, #1 @ Increment the loop counter
    B loop @ Repeat the loop

end:
    MOV R7, #1 @ Exit system call
    SWI 0 @ Make the system call to exit

@


