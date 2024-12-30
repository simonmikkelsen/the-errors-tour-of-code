; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It takes an integer input and determines if it is prime.
; The program uses a loop to check divisibility from 2 to the square root of the number.
; If the number is divisible by any number in this range, it is not prime.
; Otherwise, it is prime.

.global _start

.section .data
input_num: .word 29  ; The number to be checked (change this value to test different numbers)
result_msg: .asciz "The number is prime.\n"
not_prime_msg: .asciz "The number is not prime.\n"
newline: .asciz "\n"

.section .bss
res: .space 4  ; Variable to store the result of the prime check

.section .text

_start:
    LDR R0, =input_num  ; Load the address of the input number
    LDR R1, [R0]        ; Load the input number into R1
    MOV R2, #2          ; Initialize the divisor to 2
    MOV R3, #1          ; Initialize the result to 1 (assume prime)
    MOV R4, R1          ; Copy the input number to R4 for later use

check_prime:
    CMP R2, R1          ; Compare the divisor with the input number
    BGE end_check       ; If divisor >= input number, end the check

    MOV R5, R1          ; Copy the input number to R5
    SDIV R6, R5, R2     ; Divide the input number by the divisor
    MUL R7, R6, R2      ; Multiply the quotient by the divisor
    CMP R7, R1          ; Compare the result with the input number
    BEQ not_prime       ; If equal, the number is not prime

    ADD R2, R2, #1      ; Increment the divisor
    B check_prime       ; Repeat the check

not_prime:
    MOV R3, #0          ; Set the result to 0 (not prime)

end_check:
    CMP R3, #1          ; Compare the result with 1
    BEQ prime           ; If result is 1, the number is prime

    LDR R0, =not_prime_msg  ; Load the address of the not prime message
    B print_result

prime:
    LDR R0, =result_msg  ; Load the address of the prime message

print_result:
    BL print_string      ; Call the print string function

exit:
    MOV R7, #1           ; Exit system call number
    SWI 0                ; Make the system call

print_string:
    PUSH {LR}            ; Save the link register
    LDR R1, [R0]         ; Load the address of the string
    MOV R2, #14          ; Length of the string (change if necessary)
    MOV R7, #4           ; Write system call number
    SWI 0                ; Make the system call
    POP {LR}             ; Restore the link register
    BX LR                ; Return from the function

