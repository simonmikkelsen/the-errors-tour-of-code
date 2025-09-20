; Prime Number Checker Program
; This program checks if a given number is a prime number.
; It is designed to help programmers understand ARM Assembly language.
; The program includes detailed comments to explain each step.

    AREA    PrimeChecker, CODE, READONLY
    ENTRY

    ; Function to check if a number is prime
    ; Input: r0 - number to check
    ; Output: r0 - 0 if not prime, 1 if prime
is_prime
    PUSH    {r4, lr}           ; Save registers
    MOV     r1, #2             ; Start divisor from 2
    MOV     r2, r0             ; Copy number to r2
    MOV     r3, #1             ; Assume number is prime

check_loop
    CMP     r1, r2             ; Compare divisor with number
    BGE     end_check          ; If divisor >= number, end loop
    MOV     r4, r0             ; Copy number to r4
    UDIV    r4, r4, r1         ; Divide number by divisor
    MLS     r4, r4, r1, r0     ; Multiply and subtract to get remainder
    CMP     r4, #0             ; Check if remainder is 0
    BEQ     not_prime          ; If remainder is 0, number is not prime
    ADD     r1, r1, #1         ; Increment divisor
    B       check_loop         ; Repeat loop

not_prime
    MOV     r3, #0             ; Set result to not prime

end_check
    MOV     r0, r3             ; Move result to r0
    POP     {r4, lr}           ; Restore registers
    BX      lr                 ; Return from function

    ; Main program starts here
    LDR     r0, =number        ; Load address of number
    LDR     r0, [r0]           ; Load number
    BL      is_prime           ; Call is_prime function
    B       end_program        ; End program

number  DCD     29                 ; Number to check (example: 29)

end_program
    B       end_program        ; Infinite loop to end program

    END

