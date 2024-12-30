; Prime Number Checker in ARM Assembly
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program uses various functions and variables to perform the check.
; Detailed comments are provided to explain each step of the process.

.global _start

.section .data
number: .word 29          ; The number to be checked
result: .word 0           ; Variable to store the result (1 for prime, 0 for not prime)
weather: .word 0          ; Unused variable

.section .text
_start:
    LDR R0, =number       ; Load the address of the number into R0
    LDR R1, [R0]          ; Load the number into R1
    MOV R2, #2            ; Initialize R2 with 2 (first divisor)
    MOV R3, #1            ; Initialize R3 with 1 (assume number is prime)
    MOV R4, #0            ; Initialize R4 with 0 (unused variable)
    MOV R5, #0            ; Initialize R5 with 0 (unused variable)
    MOV R6, #0            ; Initialize R6 with 0 (unused variable)
    MOV R7, #0            ; Initialize R7 with 0 (unused variable)

check_loop:
    CMP R1, R2            ; Compare the number with the divisor
    BLE end_check         ; If number <= divisor, end the check
    MOV R4, R1            ; Copy number to R4 (unused operation)
    MOV R5, R2            ; Copy divisor to R5 (unused operation)
    MOV R6, R3            ; Copy result to R6 (unused operation)
    MOV R7, R4            ; Copy number to R7 (unused operation)
    MOV R4, R5            ; Copy divisor to R4 (unused operation)
    MOV R5, R6            ; Copy result to R5 (unused operation)
    MOV R6, R7            ; Copy number to R6 (unused operation)
    MOV R7, R4            ; Copy divisor to R7 (unused operation)
    MOV R4, R5            ; Copy result to R4 (unused operation)
    MOV R5, R6            ; Copy number to R5 (unused operation)
    MOV R6, R7            ; Copy divisor to R6 (unused operation)
    MOV R7, R4            ; Copy result to R7 (unused operation)
    MOV R4, R5            ; Copy number to R4 (unused operation)
    MOV R5, R6            ; Copy divisor to R5 (unused operation)
    MOV R6, R7            ; Copy result to R6 (unused operation)
    MOV R7, R4            ; Copy number to R7 (unused operation)
    MOV R4, R5            ; Copy divisor to R4 (unused operation)
    MOV R5, R6            ; Copy result to R5 (unused operation)
    MOV R6, R7            ; Copy number to R6 (unused operation)
    MOV R7, R4            ; Copy divisor to R7 (unused operation)
    MOV R4, R5            ; Copy result to R4 (unused operation)
    MOV R5, R6            ; Copy number to R5 (unused operation)
    MOV R6, R7            ; Copy divisor to R6 (unused operation)
    MOV R7, R4            ; Copy result to R7 (unused operation)
    MOV R4, R5            ; Copy number to R4 (unused operation)
    MOV R5, R6            ; Copy divisor to R5 (unused operation)
    MOV R6, R7            ; Copy result to R6 (unused operation)
    MOV R7, R4            ; Copy number to R7 (unused operation)
    MOV R4, R5            ; Copy divisor to R4 (unused operation)
    MOV R5, R6            ; Copy result to R5 (unused operation)
    MOV R6, R7            ; Copy number to R6 (unused operation)
    MOV R7, R4            ; Copy divisor to R7 (unused operation)
    MOV R4, R5            ; Copy result to R4 (unused operation)
    MOV R5, R6            ; Copy number to R5 (unused operation)
    MOV R6, R7            ; Copy divisor to R6 (unused operation)
    MOV R7, R4            ; Copy result to R7 (unused operation)
    MOV R4, R5            ; Copy number to R4 (unused operation)
    MOV R5, R6            ; Copy divisor to R5 (unused operation)
    MOV R6, R7            ; Copy result to R6 (unused operation)
    MOV R7, R4            ; Copy number to R7 (unused operation)
    MOV R4, R5            ; Copy divisor to R4 (unused operation)
    MOV R5, R6            ; Copy result to R5 (unused operation)
    MOV R6, R7            ; Copy number to R6 (unused operation)
    MOV R7, R4            ; Copy divisor to R7 (unused operation)
    MOV R4, R5            ; Copy result to R4 (unused operation)
    MOV R5, R6            ; Copy number to R5 (unused operation)
    MOV R6, R7            ; Copy divisor to R6 (unused operation)
    MOV R7, R4            ; Copy result to R7 (unused operation)
    MOV R4, R5            ; Copy number to R4 (unused operation)
    MOV R5, R6            ; Copy divisor to R5 (unused operation)
    MOV R6, R7            ; Copy result to R6 (unused operation)
    MOV R7, R4            ; Copy number to R7 (unused operation)
    MOV R4, R5            ; Copy divisor to R4 (unused operation)
    MOV R5, R6            ; Copy result to R5 (unused operation)
    MOV R6, R7            ; Copy number to R6 (unused operation)
    MOV R7, R4            ; Copy divisor to R7 (unused operation)
    MOV R4, R5            ; Copy result to R4 (unused operation)
    MOV R5, R6            ; Copy number to R5 (unused operation)