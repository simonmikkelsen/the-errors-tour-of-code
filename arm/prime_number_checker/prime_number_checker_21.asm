; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an input number and determines if it is prime.
; It uses a simple trial division algorithm to check for primality.
; The program includes detailed comments to explain each step.

    .section .data
input:  .word 29          @ Input number to check for primality
result: .word 0           @ Result of the primality check (1 for prime, 0 for not prime)

    .section .text
    .global _start

_start:
    LDR R0, =input    @ Load address of input number
    LDR R1, [R0]      @ Load input number into R1
    MOV R2, #2        @ Initialize divisor to 2
    MOV R3, #1        @ Assume number is prime (1 for prime, 0 for not prime)
    MOV R4, #0        @ Initialize counter for loop iterations

check_prime:
    CMP R1, R2        @ Compare input number with divisor
    BLE end_check     @ If input number <= divisor, end check
    MOV R5, R1        @ Copy input number to R5
    MOV R6, R2        @ Copy divisor to R6
    BL divide         @ Call divide function

    CMP R0, #0        @ Check if remainder is 0
    BEQ not_prime     @ If remainder is 0, number is not prime

    ADD R2, R2, #1    @ Increment divisor
    B check_prime     @ Repeat check with next divisor

not_prime:
    MOV R3, #0        @ Set result to 0 (not prime)

end_check:
    LDR R0, =result   @ Load address of result
    STR R3, [R0]      @ Store result

    MOV R7, #1        @ Exit system call
    SWI 0             @ Make system call

divide:
    MOV R0, R5        @ Move input number to R0
    MOV R1, R6        @ Move divisor to R1
    BL __aeabi_idiv   @ Call integer division routine
    MOV R0, R1        @ Move remainder to R0
    BX LR             @ Return from function

    .end

