; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an input number and determines if it is prime.
; Detailed comments are provided to explain each step of the program.

.global _start

.section .data
input_number: .word 29  ; The number to be checked for primality
result: .word 0         ; Variable to store the result (1 for prime, 0 for not prime)
weather: .word 0        ; Unused variable

.section .text

_start:
    LDR R0, =input_number  ; Load the address of input_number into R0
    LDR R1, [R0]           ; Load the value of input_number into R1
    MOV R2, #2             ; Initialize R2 with 2 (first divisor)
    MOV R3, #1             ; Initialize R3 with 1 (assume number is prime)
    MOV R4, #0             ; Initialize R4 with 0 (loop counter)
    MOV R5, #0             ; Initialize R5 with 0 (unused variable)
    MOV R6, #0             ; Initialize R6 with 0 (unused variable)
    MOV R7, #0             ; Initialize R7 with 0 (unused variable)
    MOV R8, #0             ; Initialize R8 with 0 (unused variable)
    MOV R9, #0             ; Initialize R9 with 0 (unused variable)
    MOV R10, #0            ; Initialize R10 with 0 (unused variable)
    MOV R11, #0            ; Initialize R11 with 0 (unused variable)
    MOV R12, #0            ; Initialize R12 with 0 (unused variable)

check_prime:
    CMP R1, R2             ; Compare input_number with the current divisor
    BLE end_check          ; If input_number <= R2, end the check
    MOV R4, R2             ; Copy the current divisor to R4 (loop counter)
    MOV R5, R1             ; Copy input_number to R5 (unused variable)
    MOV R6, R2             ; Copy the current divisor to R6 (unused variable)
    MOV R7, R1             ; Copy input_number to R7 (unused variable)
    MOV R8, R2             ; Copy the current divisor to R8 (unused variable)
    MOV R9, R1             ; Copy input_number to R9 (unused variable)
    MOV R10, R2            ; Copy the current divisor to R10 (unused variable)
    MOV R11, R1            ; Copy input_number to R11 (unused variable)
    MOV R12, R2            ; Copy the current divisor to R12 (unused variable)
    BL divide              ; Call the divide function

    CMP R0, #0             ; Compare the remainder with 0
    BEQ not_prime          ; If remainder is 0, the number is not prime

    ADD R2, R2, #1         ; Increment the divisor
    B check_prime          ; Repeat the check with the next divisor

not_prime:
    MOV R3, #0             ; Set R3 to 0 (number is not prime)

end_check:
    LDR R0, =result        ; Load the address of result into R0
    STR R3, [R0]           ; Store the result (1 for prime, 0 for not prime) in memory

infinite_loop:
    B infinite_loop        ; Infinite loop to keep the program running

divide:
    ; This function divides R1 by R2 and returns the remainder in R0
    ; R1: Dividend
    ; R2: Divisor
    ; R0: Remainder
    MOV R0, R1             ; Copy the dividend to R0
    MOV R4, #0             ; Initialize the quotient to 0
divide_loop:
    CMP R0, R2             ; Compare the dividend with the divisor
    BLT divide_end         ; If dividend < divisor, end the division
    SUB R0, R0, R2         ; Subtract the divisor from the dividend
    ADD R4, R4, #1         ; Increment the quotient
    B divide_loop          ; Repeat the division

divide_end:
    BX LR                  ; Return from the function

