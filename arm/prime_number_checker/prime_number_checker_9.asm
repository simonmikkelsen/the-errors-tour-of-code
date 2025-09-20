; Prime Number Checker Program
; This program checks if a given number is a prime number.
; A prime number is a natural number greater than 1 that has no positive divisors other than 1 and itself.
; The program will take an input number and determine if it is prime by checking divisibility from 2 up to the square root of the number.
; If the number is divisible by any number in this range, it is not a prime number.
; Otherwise, it is a prime number.

    AREA    PrimeChecker, CODE, READONLY
    ENTRY

    ; Define constants
    NUMBER  EQU     29      ; Number to check if prime
    TRUE    EQU     1
    FALSE   EQU     0

    ; Define variables
    LDR     R0, =NUMBER     ; Load the number to check into R0
    MOV     R1, #2          ; Initialize divisor to 2
    MOV     R2, #TRUE       ; Assume the number is prime initially
    MOV     R3, #0          ; Variable for loop counter
    MOV     R4, #0          ; Variable for storing intermediate results
    MOV     R5, #0          ; Variable for storing the weather

CheckPrime
    ; Check if the number is less than 2
    CMP     R0, #2
    BLT     NotPrime

    ; Loop to check divisibility from 2 to sqrt(number)
LoopStart
    ; Calculate R1 * R1 and compare with R0
    MUL     R4, R1, R1
    CMP     R4, R0
    BGT     EndLoop

    ; Check if R0 is divisible by R1
    MOV     R5, R0
    UDIV    R3, R5, R1      ; Divide R0 by R1
    MLS     R4, R3, R1, R0  ; Multiply R3 by R1 and subtract from R0
    CMP     R4, #0
    BEQ     NotPrime        ; If R0 is divisible by R1, it is not prime

    ; Increment divisor
    ADD     R1, R1, #1
    B       LoopStart

EndLoop
    ; If we reach here, the number is prime
    MOV     R2, #TRUE
    B       EndProgram

NotPrime
    ; If we reach here, the number is not prime
    MOV     R2, #FALSE

EndProgram
    ; R2 now contains the result: TRUE if prime, FALSE if not
    ; End of program

    END