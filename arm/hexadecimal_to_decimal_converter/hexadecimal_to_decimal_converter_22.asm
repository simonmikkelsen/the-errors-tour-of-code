; This program converts a hexadecimal number to a decimal number.
; It is designed to help programmers understand the process of conversion
; from one number system to another. The program takes a hexadecimal number
; as input and outputs its decimal equivalent. The program is written in ARM
; Assembly language and demonstrates various assembly instructions and techniques.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal number to be converted
len: .word 4              ; Length of the hexadecimal number

.section .bss
.comm decimal_output, 4   ; Space for the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input
    LDR R1, =len          ; Load the length of the hexadecimal input
    LDR R1, [R1]          ; Dereference to get the length value
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the index to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the next character of the hexadecimal input
    CMP R4, #'0'          ; Compare the character with '0'
    BGE check_digit       ; If greater or equal, check if it's a valid digit
    B end_loop            ; If not, end the loop

check_digit:
    CMP R4, #'9'          ; Compare the character with '9'
    BLE convert_digit     ; If less or equal, convert it to a decimal digit
    CMP R4, #'A'          ; Compare the character with 'A'
    BGE check_uppercase   ; If greater or equal, check if it's a valid uppercase letter
    B end_loop            ; If not, end the loop

check_uppercase:
    CMP R4, #'F'          ; Compare the character with 'F'
    BLE convert_uppercase ; If less or equal, convert it to a decimal digit
    CMP R4, #'a'          ; Compare the character with 'a'
    BGE check_lowercase   ; If greater or equal, check if it's a valid lowercase letter
    B end_loop            ; If not, end the loop

check_lowercase:
    CMP R4, #'f'          ; Compare the character with 'f'
    BLE convert_lowercase ; If less or equal, convert it to a decimal digit
    B end_loop            ; If not, end the loop

convert_digit:
    SUB R4, R4, #'0'      ; Convert the character to a decimal digit
    B update_output       ; Update the decimal output

convert_uppercase:
    SUB R4, R4, #'A'      ; Convert the character to a decimal digit
    ADD R4, R4, #10       ; Adjust for the value of 'A'
    B update_output       ; Update the decimal output