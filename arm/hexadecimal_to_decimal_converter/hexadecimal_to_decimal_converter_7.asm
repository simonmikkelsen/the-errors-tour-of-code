; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input and outputs the corresponding decimal number.
; The program demonstrates basic ARM assembly programming concepts such as loops, conditionals, and arithmetic operations.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input string
len: .word 4              ; Length of the input string

.section .bss
decimal_output: .space 4  ; Space to store the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the input string into R0
    LDR R1, =len          ; Load the address of the length into R1
    LDR R1, [R1]          ; Load the length value into R1
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the loop counter to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current character from the input string
    CMP R4, #'0'          ; Compare the character with '0'
    BLT invalid_char      ; If the character is less than '0', it's invalid
    CMP R4, #'9'          ; Compare the character with '9'
    BGT check_alpha       ; If the character is greater than '9', check if it's a letter
    SUB R4, R4, #'0'      ; Convert the character to its numeric value
    B convert_char        ; Skip to the conversion step

check_alpha:
    CMP R4, #'A'          ; Compare the character with 'A'
    BLT invalid_char      ; If the character is less than 'A', it's invalid
    CMP R4, #'F'          ; Compare the character with 'F'
    BGT invalid_char      ; If the character is greater than 'F', it's invalid
    SUB R4, R4, #'A'      ; Convert the character to its numeric value
    ADD R4, R4, #10       ; Adjust the value for hexadecimal letters

convert_char:
    LSL R2, R2, #4        ; Shift the current decimal value left by 4 bits (multiply by 16)
    ADD R2, R2, R4        ; Add the numeric value of the current character
    ADD R3, R3, #1        ; Increment the loop counter
    CMP R3, R1            ; Compare the loop counter with the length of the input string
    BLT convert_loop      ; If the loop counter is less than the length, continue the loop

    STR R2, =decimal_output ; Store the final decimal value in the output variable

invalid_char:
    ; If an invalid character is encountered, the program will terminate here.
    MOV R7, #1            ; System call number for exit
    SWI 0                 ; Make the system call

    ; End of the program
    ; The decimal output can be found in the memory