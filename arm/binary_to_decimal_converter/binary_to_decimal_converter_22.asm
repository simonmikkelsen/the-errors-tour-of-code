; This program converts a binary number to its decimal equivalent.
; The binary number is provided as input, and the program calculates
; the corresponding decimal value using a series of bitwise operations
; and arithmetic calculations. The result is then stored in a register
; for further use or display. This program is designed to help programmers
; understand the process of binary to decimal conversion in ARM Assembly.

.global _start

.section .data
binary_input: .word 0b10101010  ; Example binary input

.section .bss
decimal_output: .space 4        ; Space for the decimal output

.section .text
_start:
    LDR R0, =binary_input       ; Load the address of the binary input
    LDR R1, [R0]                ; Load the binary input into R1
    MOV R2, #0                  ; Initialize the decimal output to 0
    MOV R3, #1                  ; Initialize the multiplier to 1

    ; Loop through each bit of the binary input
    MOV R4, #32                 ; Set the loop counter to 32 (number of bits)
convert_loop:
    AND R5, R1, #1              ; Extract the least significant bit
    MUL R6, R5, R3              ; Multiply the bit by the current multiplier
    ADD R2, R2, R6              ; Add the result to the decimal output
    LSR R1, R1, #1              ; Shift the binary input right by 1 bit
    LSL R3, R3, #1              ; Double the multiplier
    SUBS R4, R4, #1             ; Decrement the loop counter
    BNE convert_loop            ; Repeat the loop if the counter is not zero

    ; Store the result in the decimal_output variable
    LDR R0, =decimal_output
    STR R2, [R0]

    ; Exit the program
    MOV R7, #1                  ; syscall: exit
    SWI 0

