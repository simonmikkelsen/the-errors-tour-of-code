; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is input by the user and the program will output the decimal value.
; The program uses a loop to process each bit of the binary number, starting from the least significant bit.
; Each bit is multiplied by the corresponding power of 2 and the results are summed to get the decimal value.
; The program demonstrates basic ARM assembly programming concepts such as loops, conditionals, and arithmetic operations.

.global _start

.section .data
binary_input: .asciz "1101"  ; The binary number to be converted (as a string)
len: .word 4                 ; Length of the binary number string

.section .bss
decimal_output: .space 4     ; Space to store the decimal output

.section .text
_start:
    LDR R0, =binary_input    ; Load the address of the binary input string into R0
    LDR R1, =len             ; Load the address of the length of the binary string into R1
    LDR R1, [R1]             ; Load the length value into R1
    MOV R2, #0               ; Initialize the decimal output to 0
    MOV R3, #1               ; Initialize the multiplier (2^0) to 1

convert_loop:
    LDRB R4, [R0, R1]        ; Load the current bit (character) into R4
    SUB R1, R1, #1           ; Decrement the length counter
    CMP R4, #'1'             ; Compare the current bit to '1'
    BNE skip_add             ; If the bit is not '1', skip the addition
    ADD R2, R2, R3           ; Add the current multiplier to the decimal output

skip_add:
    LSL R3, R3, #1           ; Multiply the multiplier by 2 (shift left)
    CMP R1, #0               ; Check if we have processed all bits
    BNE convert_loop         ; If not, repeat the loop

    STR R2, =decimal_output  ; Store the decimal output

    ; Exit the program
    MOV R7, #1               ; syscall: exit
    SVC #0                   ; make the syscall

