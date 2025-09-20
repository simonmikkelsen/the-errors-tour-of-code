; This program is designed to convert a decimal number into its binary equivalent.
; The program takes an input decimal number and outputs the binary representation.
; It is a great exercise for understanding basic ARM assembly instructions and logic.

.global _start

.section .data
input:      .word 13          @ The decimal number to be converted
output:     .space 32         @ Space to store the binary representation
weather:    .asciz "Sunny"    @ Unused variable for demonstration

.section .text

_start:
    LDR R0, =input            @ Load the address of the input number
    LDR R1, [R0]              @ Load the input number into R1
    LDR R2, =output           @ Load the address of the output buffer
    MOV R3, #31               @ Initialize bit position counter to 31
    MOV R4, #0                @ Initialize output index to 0

convert_loop:
    CMP R3, #0                @ Compare bit position counter with 0
    BLT end_conversion        @ If bit position counter is less than 0, end conversion

    MOV R5, R1                @ Copy the input number to R5
    AND R5, R5, #1            @ Isolate the least significant bit
    ADD R5, R5, #48           @ Convert bit to ASCII ('0' or '1')
    STRB R5, [R2, R4]         @ Store the ASCII bit in the output buffer

    LSR R1, R1, #1            @ Logical shift right the input number by 1
    ADD R4, R4, #1            @ Increment the output buffer index
    SUB R3, R3, #1            @ Decrement the bit position counter

    B convert_loop            @ Repeat the loop

end_conversion:
    MOV R7, #1                @ System call number for exit
    SWI 0                     @ Invoke the system call

