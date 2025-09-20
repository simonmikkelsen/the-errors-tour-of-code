; This program converts a binary number to its decimal equivalent.
; The binary number is input as a string of '0's and '1's.
; The program processes each bit, starting from the least significant bit,
; and calculates the decimal value by summing the powers of 2.
; The result is then stored in a register and can be used for further processing.

.global _start

.section .data
binary_input: .asciz "1101"  ; Binary number to be converted
length: .word 4              ; Length of the binary number

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text

_start:
    ; Initialize registers
    ldr r0, =binary_input    ; Load the address of the binary input
    ldr r1, =length          ; Load the length of the binary input
    ldr r1, [r1]             ; Dereference to get the length value
    mov r2, #0               ; Initialize the decimal output to 0
    mov r3, #1               ; Initialize the multiplier (2^0)

    ; Loop through each bit of the binary number
convert_loop:
    ldrb r4, [r0], #1        ; Load the next bit and increment the pointer
    cmp r4, #'0'             ; Compare the bit with '0'
    beq skip_addition        ; If the bit is '0', skip the addition

    ; Add the current power of 2 to the decimal output
    add r2, r2, r3

skip_addition:
    ; Update the multiplier for the next bit (multiply by 2)
    lsl r3, r3, #1

    ; Decrement the length counter and check if we are done
    subs r1, r1, #1
    bne convert_loop

    ; Store the result in the output variable
    ldr r5, =decimal_output
    str r2, [r5]

    ; Exit the program
    mov r7, #1               ; syscall: exit
    svc 0

