; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; The binary number is provided in a register, and the result is stored in another register.
; This program is designed to help programmers understand the conversion process in ARM Assembly.
; It includes detailed comments to explain each step of the process.

.global _start

.section .data
binary_input: .word 0b1101  ; Example binary number (13 in decimal)

.section .text
_start:
    LDR R0, =binary_input  ; Load the address of the binary input
    LDR R1, [R0]           ; Load the binary number into R1
    MOV R2, #0             ; Initialize the decimal result to 0
    MOV R3, #1             ; Initialize the multiplier to 1 (2^0)
    MOV R4, #0             ; Initialize the loop counter to 0
    MOV R5, #4             ; Number of bits in the binary number

convert_loop:
    AND R6, R1, #1         ; Extract the least significant bit
    MUL R6, R6, R3         ; Multiply the bit by the current power of 2
    ADD R2, R2, R6         ; Add the result to the decimal result
    LSR R1, R1, #1         ; Shift the binary number right by 1 bit
    LSL R3, R3, #1         ; Multiply the multiplier by 2
    ADD R4, R4, #1         ; Increment the loop counter
    CMP R4, R5             ; Compare the loop counter with the number of bits
    BNE convert_loop       ; If not equal, repeat the loop

    ; The decimal result is now in R2
    ; Here you can add code to use the result, e.g., print it or store it

    MOV R7, #1             ; Exit system call
    SWI 0                  ; Make the system call

