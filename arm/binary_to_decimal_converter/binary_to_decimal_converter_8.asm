; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input and processes each bit to calculate the decimal value.
; The program demonstrates the use of loops, conditional statements, and arithmetic operations in ARM Assembly.
; The binary number is stored in a register, and the result is stored in another register.

.global _start

.section .data
binary_input: .word 0b101010 ; Example binary number

.section .bss
decimal_output: .word 0

.section .text
_start:
    LDR R0, =binary_input  ; Load the address of the binary input
    LDR R1, [R0]           ; Load the binary number into R1
    MOV R2, #0             ; Initialize the decimal output to 0
    MOV R3, #1             ; Initialize the multiplier to 1
    MOV R4, #0             ; Initialize the loop counter to 0
    MOV R5, #32            ; Number of bits in the binary number

convert_loop:
    AND R6, R1, #1         ; Extract the least significant bit
    MUL R6, R6, R3         ; Multiply the bit by the current multiplier
    ADD R2, R2, R6         ; Add the result to the decimal output
    LSR R1, R1, #1         ; Shift the binary number right by 1 bit
    LSL R3, R3, #1         ; Double the multiplier
    ADD R4, R4, #1         ; Increment the loop counter
    CMP R4, R5             ; Compare the loop counter with the number of bits
    BNE convert_loop       ; If not equal, continue the loop

    LDR R0, =decimal_output ; Load the address of the decimal output
    STR R2, [R0]            ; Store the decimal result

    MOV R7, #1              ; Exit system call
    SWI 0                   ; Make the system call

