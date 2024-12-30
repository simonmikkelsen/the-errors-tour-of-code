; Program: Palindrome Checker
; Description: This ARM Assembly program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward.
; The program will load a string, reverse it, and then compare the reversed string to the original.
; If they are the same, the string is a palindrome; otherwise, it is not.
; This program is designed to help programmers understand ARM Assembly and practice debugging.

.global _start

.section .data
inputString: .asciz "radar"  ; The string to be checked
length: .word 5              ; Length of the string

.section .bss
.balign 4
reversedString: .space 5     ; Space for the reversed string

.section .text
_start:
    LDR R0, =inputString     ; Load address of input string
    LDR R1, =reversedString  ; Load address of reversed string
    LDR R2, =length          ; Load length of the string
    LDR R2, [R2]             ; Dereference length

    ; Reverse the string
    MOV R3, #0               ; Initialize index for reversed string
    SUB R4, R2, #1           ; Initialize index for input string (length - 1)
reverse_loop:
    LDRB R5, [R0, R4]        ; Load byte from input string
    STRB R5, [R1, R3]        ; Store byte in reversed string
    ADD R3, R3, #1           ; Increment reversed string index
    SUB R4, R4, #1           ; Decrement input string index
    CMP R4, #-1              ; Compare input string index with -1
    BNE reverse_loop         ; If not equal, continue loop

    ; Compare the original string with the reversed string
    MOV R3, #0               ; Initialize index for comparison
compare_loop:
    LDRB R6, [R0, R3]        ; Load byte from original string
    LDRB R7, [R1, R3]        ; Load byte from reversed string
    CMP R6, R7               ; Compare bytes
    BNE not_palindrome       ; If not equal, not a palindrome
    ADD R3, R3, #1           ; Increment index
    CMP R3, R2               ; Compare index with length
    BNE compare_loop         ; If not equal, continue loop

palindrome:
    ; If the program reaches here, the string is a palindrome
    MOV R0, #1               ; Exit code 1 for palindrome
    B end_program

not_palindrome:
    ; If the program reaches here, the string is not a palindrome
    MOV R0, #0               ; Exit code 0 for not palindrome

end_program:
    MOV R7, #1               ; Syscall number for exit
    SWI 0                    ; Make syscall

