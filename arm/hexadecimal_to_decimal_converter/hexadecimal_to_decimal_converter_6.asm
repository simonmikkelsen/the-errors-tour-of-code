; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal string as input and processes each character to compute the decimal value.
; The program demonstrates the use of loops, conditional statements, and arithmetic operations in ARM Assembly.
; It is a great exercise for understanding low-level programming and debugging skills.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input string
len: .word 4              ; Length of the input string

.section .bss
.comm decimal_output, 4   ; Reserve space for the decimal output

.section .text
_start:
    LDR R0, =hex_input    ; Load the address of the input string
    LDR R1, =len          ; Load the length of the input string
    LDR R1, [R1]          ; Dereference to get the actual length
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the loop counter to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current character from the input string
    CMP R4, #'0'          ; Compare the character with '0'
    BGE check_uppercase   ; If greater or equal, check if it's a digit

check_uppercase:
    CMP R4, #'9'          ; Compare the character with '9'
    BLE convert_digit     ; If less or equal, it's a digit

    CMP R4, #'A'          ; Compare the character with 'A'
    BGE check_lowercase   ; If greater or equal, check if it's an uppercase letter

check_lowercase:
    CMP R4, #'F'          ; Compare the character with 'F'
    BLE convert_uppercase ; If less or equal, it's an uppercase letter

    CMP R4, #'a'          ; Compare the character with 'a'
    BGE convert_lowercase ; If greater or equal, check if it's a lowercase letter

convert_digit:
    SUB R4, R4, #'0'      ; Convert the character to its numeric value
    B process_value       ; Skip to processing the value

convert_uppercase:
    SUB R4, R4, #'A'      ; Convert the character to its numeric value
    ADD R4, R4, #10       ; Adjust for the hexadecimal range
    B process_value       ; Skip to processing the value

convert_lowercase:
    SUB R4, R4, #'a'      ; Convert the character to its numeric value
    ADD R4, R4, #10       ; Adjust for the hexadecimal range

process_value:
    LSL R2, R2, #4        ; Shift the current decimal value left by 4 (multiply by 16)
    ADD R2, R2, R4        ; Add the new digit to the decimal value
    ADD R3, R3, #1        ; Increment the loop counter
    CMP R3, R1            ; Compare the loop counter with the length of the input string
    BLT convert_loop      ; If less, continue the loop

    STR R2, =decimal_output ; Store the final decimal value in the output variable

    MOV R7, #1            ; Prepare to exit the program
    SWI 0                 ; Exit the program

