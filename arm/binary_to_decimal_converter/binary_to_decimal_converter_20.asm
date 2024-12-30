; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided as input, and the program will output the decimal result.
; The program uses a loop to process each bit of the binary number, starting from the least significant bit.
; The result is accumulated in a register and then printed out.

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary number to be converted (example: 1101)
length: .word 4              ; Length of the binary number

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text

_start:
    ; Initialize registers
    mov r0, #0              ; r0 will hold the final decimal result
    ldr r1, =binary_input   ; r1 points to the binary input string
    ldr r2, =length         ; r2 points to the length of the binary input
    ldr r2, [r2]            ; Load the length value into r2
    mov r3, #1              ; r3 will be used as the multiplier (2^0 initially)

convert_loop:
    ldrb r4, [r1, r2, LSR #1] ; Load the current bit (character) into r4
    cmp r4, #'1'            ; Compare the character to '1'
    bne skip_addition       ; If it's not '1', skip the addition

    add r0, r0, r3          ; Add the current multiplier to the result

skip_addition:
    lsl r3, r3, #1          ; Multiply the multiplier by 2 (shift left)
    subs r2, r2, #1         ; Decrement the length counter
    bne convert_loop        ; If the length counter is not zero, repeat the loop

    ; Store the result in the output variable
    str r0, [decimal_output]

    ; Exit the program
    mov r7, #1              ; syscall: exit
    svc #0

