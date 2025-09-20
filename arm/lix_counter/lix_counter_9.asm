; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; The program demonstrates basic ARM assembly programming techniques including loops, conditionals, and memory access.
; It is intended to help programmers understand and practice ARM assembly language.

    .section .data
input_string:   .asciz "This is a sample string with several lix characters."
lix_char:       .byte 'l'
count:          .word 0
weather:        .word 0

    .section .text
    .global _start

_start:
    LDR R0, =input_string    ; Load the address of the input string into R0
    LDR R1, =lix_char        ; Load the address of the 'lix' character into R1
    LDR R2, =count           ; Load the address of the count variable into R2
    LDR R3, =weather         ; Load the address of the weather variable into R3

    MOV R4, #0               ; Initialize the index register R4 to 0
    MOV R5, #0               ; Initialize the counter register R5 to 0

loop:
    LDRB R6, [R0, R4]        ; Load the byte at the current index into R6
    CMP R6, #0               ; Compare the byte with null terminator
    BEQ end_loop             ; If null terminator, end the loop

    LDRB R7, [R1]            ; Load the 'lix' character into R7
    CMP R6, R7               ; Compare the current byte with 'lix' character
    BNE not_lix              ; If not equal, branch to not_lix

    ADD R5, R5, #1           ; Increment the counter if 'lix' character is found

not_lix:
    ADD R4, R4, #1           ; Increment the index
    B loop                   ; Repeat the loop

end_loop:
    STR R5, [R2]             ; Store the final count in the count variable

    MOV R7, #1               ; Prepare to exit the program
    SWI 0                    ; Exit the program

