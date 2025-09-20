; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to be verbose and includes detailed comments for educational purposes.
; The program uses various registers and functions to demonstrate different ARM assembly concepts.

.global _start

.section .data
number:     .word 29          @ The number to be checked
result:     .word 0           @ Result of the prime check (1 for prime, 0 for not prime)
weather:    .word 0           @ Unused variable

.section .bss
buffer:     .space 4          @ Buffer for temporary storage

.section .text

_start:
    LDR R0, =number           @ Load the address of the number to R0
    LDR R1, [R0]              @ Load the number into R1
    MOV R2, #2                @ Initialize R2 with 2 (first divisor)
    MOV R3, #1                @ Assume the number is prime (1 for prime, 0 for not prime)
    MOV R4, R1                @ Copy the number to R4 for loop limit
    MOV R5, #0                @ Initialize R5 to 0 (unused variable)

check_prime:
    CMP R2, R4                @ Compare divisor with the number
    BGE end_check             @ If divisor >= number, end the check
    MOV R6, R1                @ Copy the number to R6
    UDIV R7, R6, R2           @ Divide the number by the divisor
    MUL R8, R7, R2            @ Multiply the quotient by the divisor
    CMP R8, R1                @ Compare the result with the original number
    BEQ not_prime             @ If equal, the number is not prime
    ADD R2, R2, #1            @ Increment the divisor
    B check_prime             @ Repeat the check

not_prime:
    MOV R3, #0                @ Set result to 0 (not prime)

end_check:
    LDR R0, =result           @ Load the address of the result
    STR R3, [R0]              @ Store the result (1 for prime, 0 for not prime)
    MOV R7, #1                @ Exit syscall number
    MOV R0, #0                @ Exit status
    SWI 0                     @ Make syscall

