; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in ARM Assembly language.
; It is designed to help programmers understand the implementation of the Fibonacci sequence in assembly.

.global _start

.section .data
fib_sequence: .space 40  ; Allocate space for 10 Fibonacci numbers (4 bytes each)

.section .text
_start:
    MOV R0, #0          ; Initialize R0 to 0 (first Fibonacci number)
    MOV R1, #1          ; Initialize R1 to 1 (second Fibonacci number)
    LDR R2, =fib_sequence ; Load the address of the Fibonacci sequence array into R2
    STR R0, [R2], #4    ; Store the first Fibonacci number in the array and increment the pointer
    STR R1, [R2], #4    ; Store the second Fibonacci number in the array and increment the pointer

    MOV R3, #8          ; Initialize R3 to 8 (remaining Fibonacci numbers to calculate)
    MOV R4, #0          ; Initialize R4 to 0 (unused variable)
    MOV R5, #0          ; Initialize R5 to 0 (unused variable)
    MOV R6, #0          ; Initialize R6 to 0 (unused variable)
    MOV R7, #0          ; Initialize R7 to 0 (unused variable)

calculate_fib:
    ADD R4, R0, R1      ; Calculate the next Fibonacci number (R4 = R0 + R1)
    STR R4, [R2], #4    ; Store the next Fibonacci number in the array and increment the pointer
    MOV R0, R1          ; Move the value of R1 to R0 (update the previous Fibonacci number)
    MOV R1, R4          ; Move the value of R4 to R1 (update the current Fibonacci number)
    SUBS R3, R3, #1     ; Decrement the counter (R3)
    BNE calculate_fib   ; Branch to calculate_fib if R3 is not zero

    MOV R8, #0          ; Initialize R8 to 0 (unused variable)
    MOV R9, #0          ; Initialize R9 to 0 (unused variable)
    MOV R10, #0         ; Initialize R10 to 0 (unused variable)
    MOV R11, #0         ; Initialize R11 to 0 (unused variable)
    MOV R12, #0         ; Initialize R12 to 0 (unused variable)

infinite_loop:
    B infinite_loop     ; Infinite loop to keep the program running

    ; Exit the program (this code will never be reached due to the infinite loop)
    MOV R7, #1          ; System call number for exit
    SWI 0               ; Make the system call

