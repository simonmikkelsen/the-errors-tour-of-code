; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an integer input and determines if it is prime.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

.global _start

.section .data
input_num: .word 29  ; Example input number to check for prime

.section .bss
res: .space 4        ; Result storage

.section .text
_start:
    LDR R0, =input_num  ; Load address of input number
    LDR R1, [R0]        ; Load input number into R1
    MOV R2, #2          ; Initialize divisor to 2
    MOV R3, #1          ; Initialize result to 1 (assume prime)
    MOV R4, #0          ; Initialize counter for loop

check_prime:
    CMP R1, R2          ; Compare input number with divisor
    BEQ end_check       ; If equal, end check (number is prime)
    MOV R5, R1          ; Copy input number to R5
    MOV R6, R2          ; Copy divisor to R6
    BL divide           ; Call divide function
    CMP R0, #0          ; Check if remainder is zero
    BEQ not_prime       ; If zero, number is not prime
    ADD R2, R2, #1      ; Increment divisor
    B check_prime       ; Repeat check

divide:
    MOV R0, R5          ; Move input number to R0
    MOV R1, R6          ; Move divisor to R1
    BL __aeabi_idivmod  ; Call division function
    MOV R0, R1          ; Move remainder to R0
    BX LR               ; Return from function

not_prime:
    MOV R3, #0          ; Set result to 0 (not prime)

end_check:
    STR R3, [R4]        ; Store result in memory
    MOV R7, #1          ; Exit syscall number
    SWI 0               ; Make syscall to exit

