; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided in a specific register, and the result will be stored in another register.
; The program will iterate through each bit of the binary number, performing the necessary calculations
; to determine the decimal value. This is a fundamental exercise for understanding binary arithmetic
; and the manipulation of individual bits within a register.

.global _start

.section .data
binary_number: .word 0b10101010  ; Example binary number to convert

.section .text
_start:
    LDR R0, =binary_number  ; Load the address of the binary number
    LDR R1, [R0]            ; Load the binary number into R1
    MOV R2, #0              ; Initialize the decimal result to 0
    MOV R3, #0              ; Initialize the bit position counter to 0
    MOV R4, #1              ; Initialize the multiplier to 1

convert_loop:
    AND R5, R1, #1          ; Isolate the least significant bit of the binary number
    MUL R6, R5, R4          ; Multiply the bit by the current multiplier
    ADD R2, R2, R6          ; Add the result to the decimal result
    LSR R1, R1, #1          ; Shift the binary number right by 1 bit
    ADD R3, R3, #1          ; Increment the bit position counter
    LSL R4, R4, #1          ; Double the multiplier for the next bit
    CMP R3, #32             ; Compare the bit position counter to 32
    BNE convert_loop        ; If not all bits processed, repeat the loop

    ; Store the result in a register for further use or output
    MOV R7, R2

    ; Infinite loop to end the program (subtle error)
end_loop:
    B end_loop

    ; The program ends here. The decimal result is stored in R7.
