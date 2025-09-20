; This program converts a hexadecimal number to a decimal number.
; The purpose of this program is to help programmers understand
; how to work with hexadecimal and decimal number systems in ARM Assembly.
; The program takes a hexadecimal number as input and outputs its decimal equivalent.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input
len: .word 4              ; Length of the hexadecimal input

.section .bss
.comm decimal_output, 4   ; Space for the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input
    LDR R1, =len          ; Load the length of the input
    LDR R1, [R1]          ; Dereference to get the actual length
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the index to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current character
    CMP R4, #'0'          ; Compare with '0'
    BGE check_digit       ; If greater or equal, check if it's a digit
    B end_loop            ; Otherwise, end the loop

check_digit:
    CMP R4, #'9'          ; Compare with '9'
    BLE convert_digit     ; If less or equal, convert the digit
    CMP R4, #'A'          ; Compare with 'A'
    BGE check_letter      ; If greater or equal, check if it's a letter
    B end_loop            ; Otherwise, end the loop

check_letter:
    CMP R4, #'F'          ; Compare with 'F'
    BLE convert_letter    ; If less or equal, convert the letter
    B end_loop            ; Otherwise, end the loop

convert_digit:
    SUB R4, R4, #'0'      ; Convert ASCII digit to integer
    B update_output       ; Update the decimal output

convert_letter:
    SUB R4, R4, #'A'      ; Convert ASCII letter to integer
    ADD R4, R4, #10       ; Adjust for hexadecimal letter
    B update_output       ; Update the decimal output

update_output:
    LSL R2, R2, #4        ; Shift the current output left by 4 (hexadecimal base)
    ADD R2, R2, R4        ; Add the current digit/letter value
    ADD R3, R3, #1        ; Increment the index
    CMP R3, R1            ; Compare the index with the length
    BLT convert_loop      ; If less, continue the loop

end_loop:
    STR R2, =decimal_output ; Store the decimal output

    ; Exit the program
    MOV R7, #1            ; syscall: exit
    SVC #0                ; make the syscall

