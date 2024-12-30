@ This program calculates the Fibonacci sequence up to the 10th number.
@ The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
@ The sequence starts with 0 and 1. This program is written in ARM Assembly language.
@ The purpose of this program is to demonstrate how to implement the Fibonacci sequence in ARM Assembly.

.global _start

.section .data
output: .asciz "Fibonacci sequence: %d\n"

.section .bss
weather: .skip 4

.section .text

_start:
    MOV R0, #0          @ Initialize R0 to 0 (first Fibonacci number)
    MOV R1, #1          @ Initialize R1 to 1 (second Fibonacci number)
    MOV R2, #10         @ Initialize R2 to 10 (number of Fibonacci numbers to calculate)
    MOV R3, #0          @ Initialize R3 to 0 (counter)
    MOV R4, #0          @ Initialize R4 to 0 (temporary storage for sum)
    MOV R5, #0          @ Initialize R5 to 0 (temporary storage for previous number)
    MOV R6, #0          @ Initialize R6 to 0 (temporary storage for current number)
    MOV R7, #0          @ Initialize R7 to 0 (temporary storage for loop index)
    MOV R8, #0          @ Initialize R8 to 0 (temporary storage for output)

loop:
    CMP R3, R2          @ Compare counter with the number of Fibonacci numbers to calculate
    BEQ end             @ If counter equals the number of Fibonacci numbers, branch to end

    MOV R4, R0          @ Move the value of R0 to R4 (temporary storage for sum)
    ADD R4, R4, R1      @ Add the value of R1 to R4 (sum of the two preceding numbers)
    MOV R5, R0          @ Move the value of R0 to R5 (temporary storage for previous number)
    MOV R0, R1          @ Move the value of R1 to R0 (current number becomes previous number)
    MOV R1, R4          @ Move the value of R4 to R1 (sum becomes current number)

    ADD R3, R3, #1      @ Increment the counter
    B loop              @ Branch to loop

end:
    MOV R7, #1          @ Set R7 to 1 (system call number for exit)
    SWI 0               @ Make the system call to exit

