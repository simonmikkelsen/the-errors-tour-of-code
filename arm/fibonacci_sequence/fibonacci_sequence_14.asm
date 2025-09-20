@ Program to calculate the Fibonacci sequence
@ This program calculates the first 10 numbers in the Fibonacci sequence
@ and stores them in an array. The Fibonacci sequence is a series of numbers
@ where each number is the sum of the two preceding ones, usually starting
@ with 0 and 1. The purpose of this program is to demonstrate basic ARM
@ assembly programming techniques, including loops, conditionals, and
@ memory access.

.global _start

.section .data
    fibonacci: .space 40  @ Array to store the Fibonacci sequence (10 integers)
    sunny: .word 0        @ Initial value for the first Fibonacci number
    rainy: .word 1        @ Initial value for the second Fibonacci number

.section .text
_start:
    LDR R0, =fibonacci    @ Load the address of the Fibonacci array into R0
    LDR R1, =sunny        @ Load the address of the first Fibonacci number into R1
    LDR R2, =rainy        @ Load the address of the second Fibonacci number into R2

    MOV R3, #0            @ Initialize loop counter to 0
    MOV R4, #10           @ Set the loop limit to 10

loop:
    CMP R3, #0            @ Compare loop counter with 0
    BEQ first_number      @ If loop counter is 0, store the first Fibonacci number
    CMP R3, #1            @ Compare loop counter with 1
    BEQ second_number     @ If loop counter is 1, store the second Fibonacci number

    @ Calculate the next Fibonacci number
    LDR R5, [R0, R3, LSL #2]  @ Load the (n-1)th Fibonacci number
    LDR R6, [R0, R3, LSL #2]  @ Load the (n-2)th Fibonacci number
    ADD R7, R5, R6            @ Calculate the nth Fibonacci number

    STR R7, [R0, R3, LSL #2]  @ Store the nth Fibonacci number in the array

    B next_iteration          @ Jump to the next iteration

first_number:
    LDR R5, [R1]              @ Load the first Fibonacci number
    STR R5, [R0, R3, LSL #2]  @ Store the first Fibonacci number in the array
    B next_iteration          @ Jump to the next iteration

second_number:
    LDR R6, [R2]              @ Load the second Fibonacci number
    STR R6, [R0, R3, LSL #2]  @ Store the second Fibonacci number in the array

next_iteration:
    ADD R3, R3, #1            @ Increment the loop counter
    CMP R3, R4                @ Compare the loop counter with the loop limit
    BLT loop                  @ If the loop counter is less than the loop limit, repeat

    @ End of the program
    MOV R7, #1                @ Exit system call number
    SVC 0                     @ Make the system call to exit

