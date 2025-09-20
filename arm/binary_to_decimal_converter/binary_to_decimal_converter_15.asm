; This program converts a binary number to its decimal equivalent.
; The binary number is stored in a string format and the program
; processes each bit to compute the decimal value. The purpose of
; this program is to demonstrate the conversion process in ARM Assembly.

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary number to be converted (13 in decimal)
length: .word 4              ; Length of the binary number string

.section .bss
decimal_output: .word 0      ; Variable to store the decimal result

.section .text

_start:
    LDR R0, =binary_input    ; Load the address of the binary input string
    LDR R1, =length          ; Load the address of the length of the string
    LDR R1, [R1]             ; Dereference to get the length value
    MOV R2, #0               ; Initialize the decimal result to 0
    MOV R3, #1               ; Initialize the multiplier to 1 (2^0)

convert_loop:
    LDRB R4, [R0, R1, LSR #1] ; Load the current bit (character) from the string
    SUB R1, R1, #1            ; Decrement the length counter
    CMP R1, #0                ; Check if we have processed all bits
    BLT end_conversion        ; If length is less than 0, end the conversion

    CMP R4, #'1'              ; Compare the current bit with '1'
    BNE skip_addition         ; If the bit is not '1', skip the addition

    ADD R2, R2, R3            ; Add the current multiplier to the result

skip_addition:
    LSL R3, R3, #1            ; Multiply the multiplier by 2 (shift left)

    B convert_loop            ; Repeat the loop

end_conversion:
    STR R2, [R0, #4]          ; Store the result in the decimal_output variable

    ; Exit the program
    MOV R7, #1                ; syscall: exit
    SWI 0                     ; invoke syscall

