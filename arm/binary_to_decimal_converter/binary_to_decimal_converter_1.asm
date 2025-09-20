; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; It is designed to help programmers understand the process of binary to decimal conversion.
; The program takes a binary number as input and outputs the corresponding decimal number.
; The conversion process involves multiplying each bit by the power of 2 and summing the results.

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary number to be converted (example: 1101)
len: .int 4                  ; Length of the binary number

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text

_start:
    ; Initialize variables
    mov r0, #0              ; r0 will store the final decimal result
    ldr r1, =binary_input   ; r1 points to the binary input string
    ldr r2, =len            ; r2 points to the length of the binary string
    ldr r2, [r2]            ; Load the length value into r2
    mov r3, #0              ; r3 will be used as an index
    mov r4, #1              ; r4 will store the current power of 2

    ; Loop through each bit of the binary number
convert_loop:
    ldrb r5, [r1, r3]       ; Load the current bit into r5
    cmp r5, #0              ; Compare the bit with 0
    beq skip_addition       ; If the bit is 0, skip the addition

    ; Add the current power of 2 to the result if the bit is 1
    add r0, r0, r4

skip_addition:
    ; Update the power of 2 for the next bit
    lsl r4, r4, #1          ; Multiply the power of 2 by 2

    ; Increment the index and check if we have processed all bits
    add r3, r3, #1
    cmp r3, r2
    blt convert_loop        ; If not all bits are processed, continue the loop

    ; Store the result in the output variable
    ldr r6, =decimal_output
    str r0, [r6]

    ; Exit the program
    mov r7, #1              ; syscall number for exit
    swi 0                   ; make the syscall

