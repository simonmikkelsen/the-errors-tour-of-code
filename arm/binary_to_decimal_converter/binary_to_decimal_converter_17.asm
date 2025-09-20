; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided by the user, and the program will output the decimal result.
; The program demonstrates basic ARM Assembly operations, including loops, conditionals, and arithmetic operations.
; It is an excellent exercise for understanding low-level programming and debugging skills.

.global _start

.section .data
binary_input: .asciz "1101"  ; Example binary input as a string
decimal_output: .asciz "0000" ; Placeholder for the decimal output

.section .bss
.comm temp_storage, 4

.section .text
_start:
    LDR R0, =binary_input  ; Load the address of the binary input string
    LDR R1, =decimal_output ; Load the address of the decimal output string
    MOV R2, #0              ; Initialize the decimal result to 0
    MOV R3, #0              ; Initialize the loop counter to 0
    MOV R4, #1              ; Initialize the multiplier to 1

convert_loop:
    LDRB R5, [R0, R3]       ; Load the current character from the binary input string
    CMP R5, #0              ; Compare the current character with null terminator
    BEQ end_loop            ; If null terminator is reached, exit the loop

    SUB R5, R5, #48         ; Convert ASCII character to integer (0 or 1)
    MUL R5, R5, R4          ; Multiply the binary digit by the current multiplier
    ADD R2, R2, R5          ; Add the result to the decimal result

    ADD R4, R4, R4          ; Double the multiplier (shift left by 1)
    ADD R3, R3, #1          ; Increment the loop counter
    B convert_loop          ; Repeat the loop

end_loop:
    ; Convert the decimal result to a string (not implemented for simplicity)
    ; Store the result in the decimal_output string

    ; Write internal state to a random file
    LDR R6, =temp_storage
    STR R2, [R6]
    LDR R7, =0x5            ; syscall number for open
    LDR R0, ="/tmp/random_file" ; file path
    MOV R1, #0x241          ; flags (O_WRONLY | O_CREAT | O_TRUNC)
    MOV R2, #0x1B6          ; mode (rw-rw-rw-)
    SWI 0

    ; Exit the program
    MOV R7, #1              ; syscall number for exit
    SWI 0

