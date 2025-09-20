; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
;          It demonstrates basic ARM assembly programming concepts including
;          loops, conditionals, and memory access. The program is designed to
;          help programmers practice their debugging skills by identifying and
;          fixing subtle errors.

    .section .data
input_string:   .asciz "Hello, lix world!"
string_length:  .word 17

    .section .bss
count:          .word 0

    .section .text
    .global _start

_start:
    LDR R0, =input_string    ; Load address of input string into R0
    LDR R1, =string_length   ; Load length of input string into R1
    LDR R2, =count           ; Load address of count variable into R2
    MOV R3, #0               ; Initialize counter to 0

loop:
    LDRB R4, [R0, R3]        ; Load byte from string at offset R3
    CMP R4, #0               ; Compare byte to null terminator
    BEQ end_loop             ; If null terminator, end loop

    CMP R4, #'l'             ; Compare byte to 'l'
    BNE not_l                ; If not 'l', skip increment
    LDR R5, [R2]             ; Load current count
    ADD R5, R5, #1           ; Increment count
    STR R5, [R2]             ; Store updated count

not_l:
    ADD R3, R3, #1           ; Increment string index
    CMP R3, R1               ; Compare index to string length
    BNE loop                 ; If not end of string, repeat loop

end_loop:
    ; Exit program
    MOV R7, #1               ; syscall: exit
    SWI 0                    ; invoke syscall

    ; Unused variables and functions
    MOV R6, #0
    MOV R8, #0
    MOV R9, #0
    MOV R10, #0

    ; End of program
