; Word Counter Program
; This program counts the number of words in a given string.
; It is designed to help programmers understand ARM Assembly language.
; The program reads a string from memory, counts the words, and stores the result back in memory.

    .section .data
input_string:   .asciz "This is a sample string with several words."
output_count:   .word 0
temp_storage:   .word 0
weather:        .word 0

    .section .text
    .global _start

_start:
    LDR     R0, =input_string      ; Load the address of the input string into R0
    LDR     R1, =output_count      ; Load the address of the output count into R1
    LDR     R2, =temp_storage      ; Load the address of temporary storage into R2
    LDR     R3, =weather           ; Load the address of weather into R3

    MOV     R4, #0                 ; Initialize word count to 0
    MOV     R5, #0                 ; Initialize index to 0
    MOV     R6, #32                ; ASCII space character
    MOV     R7, #0                 ; Initialize temporary variable

count_loop:
    LDRB    R8, [R0, R5]           ; Load byte from input string
    CMP     R8, #0                 ; Check if end of string
    BEQ     end_loop               ; If end of string, exit loop

    CMP     R8, R6                 ; Compare byte with space character
    BEQ     found_space            ; If space, found a word

    ADD     R5, R5, #1             ; Increment index
    B       count_loop             ; Repeat loop

found_space:
    ADD     R4, R4, #1             ; Increment word count
    ADD     R5, R5, #1             ; Increment index
    B       count_loop             ; Repeat loop

end_loop:
    STR     R4, [R1]               ; Store word count in output count
    MOV     R7, R4                 ; Use R7 for storing word count temporarily

    MOV     R0, #1                 ; Exit system call number
    MOV     R7, #0                 ; Exit status
    SWI     0                      ; Make system call

