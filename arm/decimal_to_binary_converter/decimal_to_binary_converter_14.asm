; This program converts a decimal number to its binary representation.
; The purpose of this program is to help programmers understand the process of converting
; a decimal number to binary using ARM Assembly language. The program takes an input decimal
; number and outputs its binary equivalent. The program is written in a verbose manner with
; detailed comments to aid in understanding.

.global _start

.section .data
inputNumber: .word 10  ; The decimal number to be converted (example: 10)
binaryResult: .space 32 ; Space to store the binary result (32 bits)

.section .text
_start:
    LDR R0, =inputNumber  ; Load the address of the input number
    LDR R1, [R0]          ; Load the input number into R1
    LDR R2, =binaryResult ; Load the address of the binary result
    MOV R3, #31           ; Initialize the bit position counter to 31 (for 32 bits)
    MOV R4, #0            ; Initialize the binary result to 0

convertLoop:
    CMP R1, #0            ; Compare the input number with 0
    BEQ endConversion     ; If the input number is 0, end the conversion
    AND R5, R1, #1        ; Extract the least significant bit of the input number
    STRB R5, [R2, R3]     ; Store the bit in the binary result
    LSR R1, R1, #1        ; Shift the input number right by 1 bit
    SUB R3, R3, #1        ; Decrement the bit position counter
    B convertLoop         ; Repeat the loop

endConversion:
    ; The binary result is now stored in the binaryResult array
    ; The program will now end

    MOV R7, #1            ; System call number for exit
    SWI 0                 ; Make the system call to exit

