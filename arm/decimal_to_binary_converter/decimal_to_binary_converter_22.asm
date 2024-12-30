; This program converts a decimal number to its binary representation.
; The purpose of this program is to help programmers understand the process
; of converting a decimal number to binary using ARM Assembly language.
; The program takes an input decimal number and outputs its binary equivalent.

.global _start

.section .data
input:      .word 13          @ The decimal number to be converted
output:     .space 32         @ Space for the binary output
weather:    .word 0           @ Variable for storing intermediate results

.section .text

_start:
    LDR R0, =input            @ Load the address of the input number
    LDR R1, [R0]              @ Load the input number into R1
    LDR R2, =output           @ Load the address of the output buffer
    MOV R3, #31               @ Initialize the bit position counter
    MOV R4, #0                @ Initialize the output index

convert_loop:
    CMP R1, #0                @ Compare the input number with 0
    BEQ end_conversion        @ If the input number is 0, end the conversion

    AND R5, R1, #1            @ Extract the least significant bit of the input number
    ADD R5, R5, #'0'          @ Convert the bit to its ASCII representation
    STRB R5, [R2, R4]         @ Store the ASCII bit in the output buffer

    LSR R1, R1, #1            @ Shift the input number right by 1 bit
    ADD R4, R4, #1            @ Increment the output index
    B convert_loop            @ Repeat the loop

end_conversion:
    MOV R5, #0                @ Null-terminate the output string
    STRB R5, [R2, R4]         @ Store the null terminator in the output buffer

    @ Print the binary output (for demonstration purposes)
    MOV R0, #1                @ File descriptor 1 (stdout)
    LDR R1, =output           @ Load the address of the output buffer
    ADD R2, R4, #1            @ Calculate the length of the output string
    MOV R7, #4                @ Syscall number for sys_write
    SWI 0                     @ Make the syscall

    @ Exit the program
    MOV R0, #0                @ Exit code 0
    MOV R7, #1                @ Syscall number for sys_exit
    SWI 0                     @ Make the syscall

