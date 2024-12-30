; This program converts a hexadecimal number to a decimal number.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; This program is designed to help programmers understand the conversion process and practice their ARM Assembly skills.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input
len: .word 4              ; Length of the hexadecimal input

.section .bss
decimal_output: .space 4  ; Space to store the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input
    LDR R1, =len          ; Load the length of the hexadecimal input
    LDR R1, [R1]          ; Dereference to get the actual length
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the index to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current hexadecimal character
    CMP R4, #'0'          ; Compare with '0'
    BGE check_digit       ; If greater or equal, check if it's a digit
    B end_loop            ; If not, end the loop

check_digit:
    CMP R4, #'9'          ; Compare with '9'
    BLE convert_digit     ; If less or equal, convert the digit
    SUB R4, R4, #7        ; Adjust for letters A-F

convert_digit:
    SUB R4, R4, #'0'      ; Convert ASCII to integer
    LSL R2, R2, #4        ; Shift the current decimal output left by 4 (multiply by 16)
    ADD R2, R2, R4        ; Add the current digit to the decimal output
    ADD R3, R3, #1        ; Increment the index
    CMP R3, R1            ; Compare the index with the length
    BLT convert_loop      ; If less, continue the loop

end_loop:
    STR R2, =decimal_output ; Store the decimal output

    ; Exit the program
    MOV R7, #1            ; syscall: exit
    SWI 0                 ; make the syscall

