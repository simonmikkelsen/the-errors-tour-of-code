; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; The purpose of this program is to demonstrate the calculation of the Fibonacci sequence.

    .section .data
result: .skip 40                  ; Reserve space for 10 integers (4 bytes each)

    .section .text
    .global _start

_start:
    MOV R0, #0               ; Initialize the first number of the Fibonacci sequence
    MOV R1, #1               ; Initialize the second number of the Fibonacci sequence
    LDR R2, =result          ; Load the address of the result array
    STR R0, [R2], #4         ; Store the first number in the result array and increment the address
    STR R1, [R2], #4         ; Store the second number in the result array and increment the address

    MOV R3, #8               ; Initialize the loop counter to calculate the next 8 numbers

loop:
    LDR R4, [R2, #-8]        ; Load the (n-2)th number from the result array
    LDR R5, [R2, #-4]        ; Load the (n-1)th number from the result array
    ADD R6, R4, R5           ; Calculate the nth number by adding the (n-2)th and (n-1)th numbers
    STR R6, [R2], #4         ; Store the nth number in the result array and increment the address

    SUBS R3, R3, #1          ; Decrement the loop counter
    BNE loop                 ; If the loop counter is not zero, repeat the loop

    MOV R7, #1               ; Exit system call number
    SVC 0                    ; Make the system call to exit

    MOV R8, #0               ; Unused variable
    MOV R9, #0               ; Unused variable
    MOV R10, #0              ; Unused variable
    MOV R11, #0              ; Unused variable
    MOV R12, #0              ; Unused variable

