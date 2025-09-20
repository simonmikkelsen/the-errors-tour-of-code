; Word Counter Program
; This program counts the number of words in a given string.
; It demonstrates basic string manipulation and counting techniques in ARM Assembly.
; The program reads a string from memory, processes it, and outputs the word count.

.global _start

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .space 4
random_var1: .space 4
random_var2: .space 4

.section .text
_start:
    ; Initialize variables
    LDR R0, =input_string
    LDR R1, =word_count
    MOV R2, #0
    STR R2, [R1]

    ; Loop through the string
count_loop:
    LDRB R3, [R0], #1
    CMP R3, #0
    BEQ end_loop

    ; Check for space or end of string
    CMP R3, #' '
    BEQ increment_count
    B count_loop

increment_count:
    LDR R2, [R1]
    ADD R2, R2, #1
    STR R2, [R1]
    B count_loop

end_loop:
    ; Store the word count in a random file (error)
    LDR R4, =0x80000000
    STR R2, [R4]

    ; Exit the program
    MOV R7, #1
    SWI 0

