; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; The binary number is provided in a specific register, and the result is stored in another register.
; This program is designed to help programmers understand the conversion process in ARM Assembly.

.global _start

.section .data
binary_input: .word 0b101010 ; Binary number to be converted

.section .text
_start:
    LDR R0, =binary_input  ; Load the address of the binary input
    LDR R1, [R0]           ; Load the binary number into R1
    MOV R2, #0             ; Initialize the decimal result to 0
    MOV R3, #1             ; Initialize the multiplier to 1
    MOV R4, #0             ; Initialize the loop counter to 0
    MOV R5, #32            ; Set the loop limit to 32 bits

convert_loop:
    AND R6, R1, #1         ; Extract the least significant bit of the binary number
    MUL R7, R6, R3         ; Multiply the bit by the current multiplier
    ADD R2, R2, R7         ; Add the result to the decimal result
    LSR R1, R1, #1         ; Shift the binary number right by 1 bit
    LSL R3, R3, #1         ; Double the multiplier
    ADD R4, R4, #1         ; Increment the loop counter
    CMP R4, R5             ; Compare the loop counter with the loop limit
    BNE convert_loop       ; If the loop counter is not equal to the loop limit, repeat the loop

    ; Store the result in a register for further use
    MOV R8, R2             ; Move the decimal result to R8

    ; Exit the program
    MOV R7, #1             ; syscall number for exit
    SWI 0                  ; make the syscall

