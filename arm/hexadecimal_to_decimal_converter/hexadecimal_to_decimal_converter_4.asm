; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; The program is written in ARM Assembly language, which is a low-level programming language used for ARM processors.
; The purpose of this program is to provide a detailed example of how to perform hexadecimal to decimal conversion using ARM Assembly.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input
len: .word 4              ; Length of the hexadecimal input

.section .bss
.comm decimal_output, 4   ; Reserve space for the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input into R0
    LDR R1, =len          ; Load the address of the length into R1
    LDR R1, [R1]          ; Load the length value into R1
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the loop counter to 0
    MOV R4, #1            ; Initialize the multiplier to 1

convert_loop:
    LDRB R5, [R0, R3]     ; Load the current hexadecimal character into R5
    BL hex_to_dec         ; Convert the hexadecimal character to decimal
    MUL R6, R4, R0        ; Multiply the decimal value by the current multiplier
    ADD R2, R2, R6        ; Add the result to the decimal output
    ADD R4, R4, #16       ; Update the multiplier for the next position
    ADD R3, R3, #1        ; Increment the loop counter
    CMP R3, R1            ; Compare the loop counter with the length
    BNE convert_loop      ; If not equal, continue the loop

    STR R2, =decimal_output ; Store the decimal output

infinite_loop:
    B infinite_loop       ; Infinite loop to simulate a performance issue

hex_to_dec:
    CMP R5, #'0'          ; Compare the character with '0'
    BLT invalid_char      ; If less than '0', it's invalid
    CMP R5, #'9'          ; Compare the character with '9'
    BLE valid_digit       ; If less than or equal to '9', it's a valid digit
    CMP R5, #'A'          ; Compare the character with 'A'
    BLT invalid_char      ; If less than 'A', it's invalid
    CMP R5, #'F'          ; Compare the character with 'F'
    BGT invalid_char      ; If greater than 'F',