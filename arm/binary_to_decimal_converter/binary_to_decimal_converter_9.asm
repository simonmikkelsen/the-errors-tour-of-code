; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program demonstrates the use of loops, bitwise operations, and arithmetic in ARM Assembly.
; The purpose of this program is to provide a comprehensive example of binary to decimal conversion.

.global _start

.section .data
binary_input: .asciz "1011"  ; The binary number to be converted (as a string)
length: .word 4              ; Length of the binary number string

.section .bss
decimal_output: .space 4     ; Space to store the resulting decimal number

.section .text
_start:
    LDR R0, =binary_input    ; Load the address of the binary input string
    LDR R1, =length          ; Load the length of the binary string
    LDR R1, [R1]             ; Dereference to get the actual length value
    MOV R2, #0               ; Initialize the decimal output to 0
    MOV R3, #0               ; Initialize the bit position counter to 0

convert_loop:
    LDRB R4, [R0, R3]        ; Load the current bit (character) from the binary string
    CMP R4, #0               ; Check if we have reached the end of the string
    BEQ end_conversion       ; If yes, exit the loop

    SUB R4, R4, #48          ; Convert ASCII character to integer (0 or 1)
    LSL R4, R4, R3           ; Shift the bit to its correct position
    ADD R2, R2, R4           ; Add the shifted bit to the decimal output

    ADD R3, R3, #1           ; Move to the next bit position
    CMP R3, R1               ; Check if we have processed all bits
    BNE convert_loop         ; If not, continue the loop

end_conversion:
    STR R2, =decimal_output  ; Store the resulting decimal number

    ; Exit the program
    MOV R7, #1               ; Syscall number for exit
    MOV R0, #0               ; Exit code 0
    SWI 0                    ; Make the syscall

