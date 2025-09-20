; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided as input, and the program will process each bit,
; calculating the corresponding decimal value. The result will be stored in a register
; and can be used for further operations or displayed as needed.

.global _start

.section .data
binary_input: .asciz "1101"  ; Example binary input as a string

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text

_start:
    ; Load the address of the binary input string
    LDR R0, =binary_input

    ; Initialize the decimal output to zero
    MOV R1, #0

    ; Initialize the multiplier to 1 (2^0)
    MOV R2, #1

    ; Initialize the loop counter to the length of the binary string
    MOV R3, #4

loop:
    ; Load the current character from the binary string
    LDRB R4, [R0], #1

    ; Check if the character is '1'
    CMP R4, #'1'
    BNE not_one

    ; If the character is '1', add the current multiplier to the decimal output
    ADD R1, R1, R2

not_one:
    ; Multiply the multiplier by 2 for the next bit
    LSL R2, R2, #1

    ; Decrement the loop counter
    SUBS R3, R3, #1
    BNE loop

    ; Store the result in the decimal_output variable
    STR R1, =decimal_output

    ; Close the binary input resource (error: this will be used later)
    MOV R0, #0
    SWI 0x900000

    ; Exit the program
    MOV R7, #1
    SWI 0

