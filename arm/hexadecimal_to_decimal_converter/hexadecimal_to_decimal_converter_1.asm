; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program takes a hexadecimal number as input and outputs the corresponding decimal number.
; It demonstrates the process of converting each hexadecimal digit to its decimal value and 
; accumulating the result. The program is written in ARM Assembly language.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal input string
len: .word 4              ; Length of the input string

.section .bss
.comm decimal_output, 4   ; Space for the decimal output

.section .text

_start:
    ; Initialize variables
    LDR R0, =hex_input    ; Load the address of the input string
    LDR R1, =len          ; Load the length of the input string
    LDR R1, [R1]          ; Dereference to get the actual length
    MOV R2, #0            ; Initialize the decimal result to 0
    MOV R3, #0            ; Initialize the loop counter to 0
    MOV R4, #1            ; Initialize the multiplier to 1

loop_start:
    ; Check if we have processed all characters
    CMP R3, R1
    BEQ end_loop

    ; Load the current character
    LDRB R5, [R0, R3]

    ; Convert the character to its decimal value
    SUB R5, R5, #48       ; Convert ASCII to integer
    CMP R5, #9
    BLE is_digit
    SUB R5, R5, #7        ; Adjust for 'A'-'F'

is_digit:
    ; Multiply the current digit by the appropriate power of 16
    MUL R5, R5, R4

    ; Add the result to the accumulated decimal value
    ADD R2, R2, R5

    ; Update the multiplier for the next digit
    MOV R6, #16
    MUL R4, R4, R6

    ; Increment the loop counter
    ADD R3, R3, #1

    ; Loop back to process the next character
    B loop_start

end_loop:
    ; Store the result in the output variable
    LDR R7, =decimal_output
    STR R2, [R7]

    ; Exit the program
    MOV R7, #1            ; syscall: exit
    SVC #0

