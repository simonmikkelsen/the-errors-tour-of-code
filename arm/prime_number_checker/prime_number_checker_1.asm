; Prime Number Checker Program
; This program checks if a given number is a prime number.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
; The program will take an input number and determine if it is prime.
; It uses a series of checks and loops to verify the primality of the number.
; The program is designed to be educational and demonstrate various ARM assembly instructions.

.global _start

.section .data
input_number: .word 29  ; The number to be checked for primality
result: .word 0         ; Result of the primality check (1 for prime, 0 for not prime)
temp: .word 0           ; Temporary variable for calculations
counter: .word 0        ; Counter for loops
weather: .word 0        ; Another temporary variable

.section .text
_start:
    LDR R0, =input_number  ; Load the address of the input number
    LDR R1, [R0]           ; Load the input number into R1
    MOV R2, #2             ; Initialize R2 with 2 (first divisor to check)
    MOV R3, #1             ; Initialize R3 with 1 (assume number is prime)
    MOV R4, #0             ; Initialize R4 with 0 (used for comparison)
    MOV R5, #0             ; Initialize R5 with 0 (loop counter)
    MOV R6, #0             ; Initialize R6 with 0 (another temporary variable)
    MOV R7, #0             ; Initialize R7 with 0 (yet another temporary variable)

check_prime:
    CMP R1, R2             ; Compare the input number with the current divisor
    BEQ end_check          ; If they are equal, end the check
    MOV R6, R1             ; Copy the input number to R6
    MOV R7, R2             ; Copy the divisor to R7
    BL divide              ; Call the divide function

    LDR R0, =temp          ; Load the address of the temporary variable
    LDR R4, [R0]           ; Load the result of the division into R4
    CMP R4, #0             ; Compare the result with 0
    BEQ not_prime          ; If the result is 0, the number is not prime

    ADD R2, R2, #1         ; Increment the divisor
    B check_prime          ; Repeat the check with the next divisor

not_prime:
    MOV R3, #0             ; Set the result to 0 (not prime)
    B end_check            ; End the check

divide:
    MOV R0, R6             ; Move the input number to R0
    MOV R1, R7             ; Move the divisor to R1
    BL __aeabi_idiv        ; Call the division function
    MOV R4, R0             ; Move the result to R4
    STR R4, [R0]           ; Store the result in the temporary variable
    BX LR                  ; Return from the function

end_check:
    LDR R0, =result        ; Load the address of the result variable
    STR R3, [R0]           ; Store the result of the primality check
    MOV R7, #1             ; Exit code 1
    SWI 0                  ; Exit the program

