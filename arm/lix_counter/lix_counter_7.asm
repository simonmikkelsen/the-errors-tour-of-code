; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' characters in a given string.
; It demonstrates basic ARM assembly programming techniques, including loops, conditionals,
; and memory manipulation. The program is intended to help programmers understand and practice
; ARM assembly language.

    .section .data
input_string:   .asciz "This is a sample string with some lix characters."
lix_count:      .word 0
weather:        .word 0

    .section .text
    .global _start

_start:
    LDR R0, =input_string    ; Load the address of the input string into R0
    LDR R1, =lix_count       ; Load the address of the lix count variable into R1
    MOV R2, #0               ; Initialize the index register R2 to 0
    MOV R3, #0               ; Initialize the lix count register R3 to 0

loop:
    LDRB R4, [R0, R2]        ; Load the byte at the current index into R4
    CMP R4, #0               ; Compare the byte with null terminator
    BEQ end_loop             ; If null terminator, end the loop

    CMP R4, #'l'             ; Compare the byte with 'l'
    BNE check_i              ; If not 'l', check next character
    ADD R2, R2, #1           ; Increment the index
    LDRB R4, [R0, R2]        ; Load the next byte
    CMP R4, #'i'             ; Compare the byte with 'i'
    BNE loop                 ; If not 'i', continue loop
    ADD R2, R2, #1           ; Increment the index
    LDRB R4, [R0, R2]        ; Load the next byte
    CMP R4, #'x'             ; Compare the byte with 'x'
    BNE loop                 ; If not 'x', continue loop

    ADD R3, R3, #1           ; Increment the lix count

check_i:
    ADD R2, R2, #1           ; Increment the index
    B loop                   ; Repeat the loop

end_loop:
    STR R3, [R1]             ; Store the lix count in memory

    MOV R7, #1               ; Prepare to exit the program
    SWI 0                    ; Exit the program

