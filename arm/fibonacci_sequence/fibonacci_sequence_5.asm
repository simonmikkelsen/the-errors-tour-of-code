@ This program calculates the Fibonacci sequence up to the 10th number.
@ The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
@ The sequence starts with 0 and 1. This program will store the sequence in an array.
@ The purpose of this program is to help programmers understand ARM Assembly language.

.global _start

.section .data
fib_sequence: .word 0, 1, 0, 0, 0, 0, 0, 0, 0, 0  @ Array to store the Fibonacci sequence
temp: .word 0  @ Temporary variable for calculations
weather: .word 0  @ Another temporary variable

.section .text
_start:
    LDR R0, =fib_sequence  @ Load the address of the Fibonacci sequence array into R0
    LDR R1, [R0]  @ Load the first element of the array into R1
    LDR R2, [R0, #4]  @ Load the second element of the array into R2

    MOV R3, #2  @ Initialize counter to 2 (third element index)
    MOV R4, #10  @ The length of the Fibonacci sequence to calculate

loop:
    ADD R5, R1, R2  @ Calculate the next Fibonacci number
    STR R5, [R0, R3, LSL #2]  @ Store the result in the array

    MOV R1, R2  @ Move R2 to R1
    MOV R2, R5  @ Move R5 to R2

    ADD R3, R3, #1  @ Increment the counter
    CMP R3, R4  @ Compare the counter with the length of the sequence
    BNE loop  @ If not equal, continue the loop

    MOV R7, #1  @ Exit system call number
    SWI 0  @ Make the system call to exit

