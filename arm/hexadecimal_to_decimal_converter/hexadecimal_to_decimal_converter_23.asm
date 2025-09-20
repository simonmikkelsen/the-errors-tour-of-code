; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; The program demonstrates basic ARM assembly instructions and operations, including loops and conditional branches.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; Example hexadecimal input
len: .word 4              ; Length of the input string

.section .bss
decimal_output: .space 4  ; Space to store the decimal output

.section .text
_start:
    LDR R0, =hex_input    ; Load the address of the hexadecimal input string
    LDR R1, =len          ; Load the length of the input string
    LDR R1, [R1]          ; Dereference to get the actual length value
    MOV R2, #0            ; Initialize the decimal output to 0
    MOV R3, #0            ; Initialize the loop counter to 0

convert_loop:
    LDRB R4, [R0, R3]     ; Load the current character from the input string
    CMP R4, #'0'          ; Compare the character with '0'
    BGE check_digit       ; If the character is greater than or equal to '0', check if it's a valid digit
    B end_loop            ; If not, end the loop

check_digit:
    CMP R4, #'9'          ; Compare the character with '9'
    BLE valid_digit       ; If the character is less than or equal to '9', it's a valid digit
    CMP R4, #'A'          ; Compare the character with 'A'
    BGE check_uppercase   ; If the character is greater than or equal to 'A', check if it's a valid uppercase letter
    B end_loop            ; If not, end the loop

check_uppercase:
    CMP R4, #'F'          ; Compare the character with 'F'
    BLE valid_uppercase   ; If the character is less than or equal to 'F', it's a valid uppercase letter
    B end_loop            ; If not, end the loop

valid_digit:
    SUB R4, R4, #'0'      ; Convert the character to its numeric value
    B update_output       ; Update the decimal output

valid_uppercase:
    SUB R4, R4, #'A'      ; Convert the character to its numeric value
    ADD R4, R4, #10       ; Adjust for the hexadecimal value

update_output:
    LSL R2, R2, #4        ; Shift the current decimal output left by 4 bits (multiply by 16)
    ADD R2, R2, R4        ; Add the current digit to the decimal output
    ADD R3, R3, #1        ; Increment the loop counter
    CMP R3, R1            ; Compare the loop counter with the length of the input string
    BLT convert_loop      ; If the loop counter is less than the length, continue the loop

end_loop:
    STR R2, =decimal_output ; Store the final decimal output

    ; Exit the program
    MOV R7, #1            ; syscall: exit
    SVC #0                ; make the syscall

