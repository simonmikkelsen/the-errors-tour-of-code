; This program is a delightful journey through the world of binary to decimal conversion.
; It takes a binary number as input and transforms it into its decimal counterpart.
; Along the way, it showcases the beauty of ARM Assembly language and the elegance of bit manipulation.
; Prepare yourself for an adventure filled with whimsical comments and a touch of magic.

.global _start

.section .data
input:      .asciz "1101"    @ The binary number we shall convert, a string of ones and zeros
length:     .word 4          @ Length of the binary string, a crucial piece of information

.section .bss
result:     .space 4         @ Here we shall store our final decimal result, a cozy little space

.section .text

_start:
    LDR R0, =input           @ Load the address of the binary string into R0, our trusty pointer
    LDR R1, =length          @ Load the address of the length into R1, our length keeper
    LDR R1, [R1]             @ Dereference the length, now R1 holds the length value
    MOV R2, #0               @ Initialize our result register to zero, a fresh start
    MOV R3, #1               @ Initialize our multiplier to one, the power of two

convert_loop:
    LDRB R4, [R0], #1        @ Load the next byte of the binary string into R4, advance pointer
    SUBS R1, R1, #1          @ Decrement the length counter, one step closer to the end
    CMP R4, #'1'             @ Compare the byte to the character '1'
    BNE skip_add             @ If it's not '1', skip the addition step

    ADD R2, R2, R3           @ Add the current multiplier to the result, a step towards our goal

skip_add:
    LSL R3, R3, #1           @ Left shift the multiplier, doubling its value
    CMP R1, #0               @ Check if we've processed all characters
    BNE convert_loop         @ If not, continue the loop

    STR R2, [result]         @ Store the final result in the result variable, our journey's end

    MOV R7, #1               @ Prepare to exit the program, a graceful exit
    SWI 0                    @ Make the syscall to exit, farewell!

