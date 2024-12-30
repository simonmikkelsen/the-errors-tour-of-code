; Hark! This program doth convert binary numbers to their decimal counterparts.
; Verily, it is designed to aid programmers in their quest for knowledge.
; The program shall read a binary number from memory, and with great precision,
; convert it to a decimal number, storing the result in a register.

.global _start

.section .data
binary_input: .word 0b101010 ; Behold, the binary number to be converted
decimal_output: .word 0      ; Here shall the decimal result be stored

.section .text
_start:
    LDR R0, =binary_input    ; Load the address of the binary input
    LDR R1, [R0]             ; Load the binary number into R1
    MOV R2, #0               ; Initialize the decimal result to zero
    MOV R3, #1               ; Initialize the multiplier to one
    MOV R4, #0               ; Initialize the loop counter to zero

    ; Lo, we shall now enter the loop to convert each bit
convert_loop:
    AND R5, R1, #1           ; Extract the least significant bit
    MUL R6, R5, R3           ; Multiply the bit by the current multiplier
    ADD R2, R2, R6           ; Add the result to the decimal result
    LSR R1, R1, #1           ; Shift the binary number right by one bit
    LSL R3, R3, #1           ; Double the multiplier
    ADD R4, R4, #1           ; Increment the loop counter
    CMP R4, #32              ; Compare the counter to 32 (assuming 32-bit binary)
    BNE convert_loop         ; If not equal, continue the loop

    ; Alas, the conversion is complete, and the result is stored in R2
    LDR R0, =decimal_output  ; Load the address of the decimal output
    STR R2, [R0]             ; Store the decimal result in memory

    ; Here ends the program, with the decimal result now in memory
    MOV R7, #1               ; Prepare to exit the program
    SWI 0                    ; Exit the program

