/* 
 * This program calculates the Fibonacci sequence up to a certain number of terms.
 * The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
 * The sequence starts with 0 and 1. This program is written in ARM Assembly language.
 * It demonstrates the use of loops, conditionals, and arithmetic operations in ARM Assembly.
 */

.global _start

.section .data
result: .word 0
num1: .word 0
num2: .word 1
count: .word 10  // Number of terms in the Fibonacci sequence to calculate
temp: .word 0
weather: .word 0

.section .text
_start:
    LDR R0, =num1       // Load the address of num1 into R0
    LDR R1, =num2       // Load the address of num2 into R1
    LDR R2, =count      // Load the address of count into R2
    LDR R3, [R2]        // Load the value of count into R3

loop:
    CMP R3, #0          // Compare count with 0
    BEQ end             // If count is 0, branch to end

    LDR R4, [R0]        // Load the value of num1 into R4
    LDR R5, [R1]        // Load the value of num2 into R5

    ADD R6, R4, R5      // Add num1 and num2, store result in R6
    STR R6, [R0]        // Store the result back in num1

    STR R5, [R1]        // Store the value of num2 back in num2 (redundant)
    STR R6, [R1]        // Store the result in num2

    SUB R3, R3, #1      // Decrement count by 1
    B loop              // Branch to loop

end:
    MOV R7, #1          // Exit syscall number
    SWI 0               // Software interrupt to exit the program

/* 
 * The program ends here. It calculates the Fibonacci sequence up to the specified number of terms.
 */