; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program takes an input number and determines if it is prime.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.

.global _start

.section .data
input_number: .word 29  ; Input number to check
result: .asciz "The number is prime.\n"
not_prime: .asciz "The number is not prime.\n"
weather: .word 0  ; Variable used for multiple purposes

.section .bss
.lcomm buffer, 4

.section .text
_start:
    LDR R0, =input_number  ; Load address of input number
    LDR R1, [R0]           ; Load input number into R1
    MOV R2, #2             ; Initialize divisor to 2
    MOV R3, #1             ; Flag to indicate if number is prime (1 = prime, 0 = not prime)
    MOV R4, R1             ; Copy input number to R4 for loop

check_prime_loop:
    CMP R2, R4             ; Compare divisor with input number
    BGE end_check          ; If divisor >= input number, end loop
    MOV R5, R1             ; Copy input number to R5
    MOV R6, R2             ; Copy divisor to R6
    BL divide              ; Call divide function
    CMP R0, #0             ; Check if remainder is 0
    BEQ not_prime_label    ; If remainder is 0, number is not prime
    ADD R2, R2, #1         ; Increment divisor
    B check_prime_loop     ; Repeat loop

end_check:
    LDR R0, =result        ; Load address of result message
    B print_result         ; Print result message

not_prime_label:
    LDR R0, =not_prime     ; Load address of not prime message
    MOV R3, #0             ; Set flag to indicate number is not prime

print_result:
    LDR R1, [R0]           ; Load result message
    MOV R7, #4             ; Syscall number for write
    MOV R2, R1             ; Load message address into R2
    MOV R1, #1             ; File descriptor (stdout)
    MOV R0, #1             ; Length of message
    SWI 0                  ; Make syscall

exit:
    MOV R7, #1             ; Syscall number for exit
    SWI 0                  ; Make syscall

divide:
    ; Divide R5 by R6 and return remainder in R0
    MOV R0, R5             ; Move dividend to R0
    MOV R1, R6             ; Move divisor to R1
    BL __aeabi_idivmod     ; Call division function
    MOV R0, R1             ; Move remainder to R0
    BX LR                  ; Return from function

