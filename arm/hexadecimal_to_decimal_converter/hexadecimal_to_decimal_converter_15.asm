; This program converts a hexadecimal number to its decimal equivalent.
; It is designed to help programmers understand the process of conversion
; from one numeral system to another. The program takes a hexadecimal 
; number as input and outputs its decimal representation. The conversion
; process involves multiplying each digit of the hexadecimal number by 
; the corresponding power of 16 and summing the results.

.global _start

.section .data
hex_input: .asciz "1A3F"  ; The hexadecimal number to be converted
len: .word 4              ; Length of the hexadecimal number

.section .bss
decimal_output: .space 4  ; Space to store the decimal output

.section .text

_start:
    ; Initialize registers
    MOV R0, #0          ; R0 will hold the final decimal result
    MOV R1, #0          ; R1 will be used as a counter
    LDR R2, =hex_input  ; Load the address of the hexadecimal input
    LDR R3, =len        ; Load the length of the hexadecimal number
    LDR R3, [R3]        ; Dereference to get the actual length

convert_loop:
    ; Check if we have processed all digits
    CMP R1, R3
    BEQ end_conversion

    ; Load the current hexadecimal digit
    LDRB R4, [R2, R1]

    ; Convert the ASCII character to its numerical value
    SUB R4, R4, #'0'
    CMP R4, #9
    BLE is_digit
    SUB R4, R4, #7      ; Adjust for 'A'-'F'

is_digit:
    ; Calculate the power of 16 for the current digit
    MOV R5, #1
    MOV R6, R3
    SUB R6, R6, R1
    SUB R6, R6, #1

power_loop:
    CMP R6, #0
    BEQ power_done
    LSL R5, R5, #4      ; Multiply by 16
    SUB R6, R6, #1
    B power_loop

power_done:
    ; Multiply the digit by the power of 16 and add to the result
    MUL R4, R4, R5
    ADD R0, R0, R4

    ; Move to the next digit
    ADD R1, R1, #1
    B convert_loop

end_conversion:
    ; Store the result in the output variable
    STR R0, =decimal_output

    ; Exit the program
    MOV R7, #1          ; syscall: exit
    SWI 0

