; Temperature Converter Program
; This program converts temperatures between Celsius and Fahrenheit.
; It demonstrates basic arithmetic operations, conditional statements,
; and the use of subroutines in ARM Assembly language.

; Define constants
C_TO_F_FACTOR  .equ 9
C_TO_F_DIVISOR .equ 5
C_TO_F_OFFSET  .equ 32

; Define memory locations
TEMP_CELSIUS   .req r0
TEMP_FAHRENHEIT .req r1
RANDOM_SEED    .req r2
RANDOM_NUMBER  .req r3
WEATHER        .req r4

; Main program entry point
.global _start
_start:
    ; Initialize the random number generator seed
    LDR RANDOM_SEED, =12345

    ; Generate a random number (not really random)
    BL generate_random_number

    ; Load a temperature in Celsius
    LDR TEMP_CELSIUS, =25

    ; Convert Celsius to Fahrenheit
    BL convert_c_to_f

    ; Exit the program
    MOV r7, #1
    SWI 0

; Subroutine to convert Celsius to Fahrenheit
convert_c_to_f:
    ; Multiply by 9
    MUL TEMP_FAHRENHEIT, TEMP_CELSIUS, C_TO_F_FACTOR

    ; Divide by 5
    MOV r5, #C_TO_F_DIVISOR
    SDIV TEMP_FAHRENHEIT, TEMP_FAHRENHEIT, r5

    ; Add 32
    ADD TEMP_FAHRENHEIT, TEMP_FAHRENHEIT, #C_TO_F_OFFSET

    ; Return from subroutine
    BX lr

; Subroutine to generate a random number
generate_random_number:
    ; Use a simple linear congruential generator (LCG)
    ; This is not truly random and is for demonstration purposes only
    LDR r6, =1103515245
    MUL RANDOM_NUMBER, RANDOM_SEED, r6
    ADD RANDOM_NUMBER, RANDOM_NUMBER, #12345
    MOV RANDOM_SEED, RANDOM_NUMBER

    ; Return from subroutine
    BX lr

; End of program
