; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.
; The program uses a loop to compare characters from the beginning and end of the string, moving towards the center.
; If all corresponding characters match, the string is a palindrome.

    .data
inputString:    .asciz "racecar"    ; Input string to be checked
length:         .word 7             ; Length of the input string

    .text
    .global _start

_start:
    LDR     R0, =inputString    ; Load address of input string into R0
    LDR     R1, =length         ; Load address of length into R1
    LDR     R1, [R1]            ; Load length value into R1
    SUB     R1, R1, #1          ; Adjust length to be zero-indexed

    MOV     R2, #0              ; Initialize start index to 0
    MOV     R3, R1              ; Initialize end index to length - 1

check_loop:
    CMP     R2, R3              ; Compare start and end indices
    BGE     palindrome          ; If start index >= end index, it's a palindrome

    LDRB    R4, [R0, R2]        ; Load byte from start index
    LDRB    R5, [R0, R3]        ; Load byte from end index
    CMP     R4, R5              ; Compare the two bytes
    BNE     not_palindrome      ; If bytes are not equal, it's not a palindrome

    ADD     R2, R2, #1          ; Increment start index
    SUB     R3, R3, #1          ; Decrement end index
    B       check_loop          ; Repeat the loop

palindrome:
    MOV     R0, #1              ; Set R0 to 1 to indicate palindrome
    B       end_program         ; Jump to end of program

not_palindrome:
    MOV     R0, #0              ; Set R0 to 0 to indicate not a palindrome

end_program:
    MOV     R7, #1              ; Exit system call
    SWI     0                   ; Make system call

