; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; The program demonstrates basic ARM assembly instructions and control structures.
; It is intended to help programmers understand the conversion process and practice debugging.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input
len: .word 4              ; Length of the hexadecimal input

.section .bss
decimal_output: .space 4  ; Space to store the decimal output

.section .text

_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input
    LDR R1, =len          ; Load the length of the input
    LDR R1, [R1]          ; Dereference to get the actual length
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the index to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current character of the hexadecimal input
    CMP R4, #'0'          ; Compare the character with '0'
    BLT invalid_char      ; If less than '0', it's invalid
    CMP R4, #'9'          ; Compare the character with '9'
    BGT check_alpha       ; If greater than '9', check if it's a letter

    SUB R4, R4, #'0'      ; Convert the character to its numerical value
    B update_output

check_alpha:
    CMP R4, #'A'          ; Compare the character with 'A'
    BLT invalid_char      ; If less than 'A', it's invalid
    CMP R4, #'F'          ; Compare the character with 'F'
    BGT invalid_char      ; If greater than 'F', it's invalid

    SUB R4, R4, #'A'      ; Convert the character to its numerical value
    ADD R4, R4, #10       ; Adjust for the hexadecimal letter values

update_output:
    LSL R2, R2, #4        ; Shift the current output left by 4 bits (multiply by 16)
    ADD R2, R2, R4        ; Add the current digit to the output
    ADD R3, R3, #1        ; Move to the next character
    CMP R3, R1            ; Compare the index with the length of the input
    BLT convert_loop      ; If not done, repeat the loop

    STR R2, =decimal_output ; Store the final decimal output

    ; Exit the program
    MOV R7, #1            ; syscall: exit
    SVC 0                 ; make the syscall

invalid_char:
    ; Handle invalid character (not implemented)
    B _start              ; Restart the program (for simplicity)

