; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.
; It uses a lot of variables and functions to demonstrate various ARM Assembly instructions.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
cleanedString:  .space 100
reversedString: .space 100

    .text
    .global _start

_start:
    ; Load the input string
    LDR R0, =inputString
    BL getStringLength

    ; Clean the input string (remove spaces and convert to lowercase)
    LDR R0, =inputString
    LDR R1, =cleanedString
    BL cleanString

    ; Reverse the cleaned string
    LDR R0, =cleanedString
    LDR R1, =reversedString
    BL reverseString

    ; Compare the cleaned string with the reversed string
    LDR R0, =cleanedString
    LDR R1, =reversedString
    BL compareStrings

    ; Exit the program
    MOV R7, #1
    SWI 0

; Function to get the length of a string
getStringLength:
    PUSH {LR}
    MOV R1, #0
length_loop:
    LDRB R2, [R0, R1]
    CMP R2, #0
    BEQ length_done
    ADD R1, R1, #1
    B length_loop
length_done:
    STR R1, [R0, #length]
    POP {LR}
    BX LR

; Function to clean the input string
cleanString:
    PUSH {LR}
    MOV R2, #0
clean_loop:
    LDRB R3, [R0], #1
    CMP R3, #0
    BEQ clean_done
    CMP R3, #' '
    BEQ clean_loop
    CMP R3, #'A'
    BLT copy_char
    CMP R3, #'Z'
    BGT copy_char
    ADD R3, R3, #32
copy_char:
    STRB R3, [R1, R2]
    ADD R2, R2, #1
    B clean_loop
clean_done:
    STRB R2, [R1, R2]
    POP {LR}
    BX LR

; Function to reverse a string
reverseString:
    PUSH {LR}
    MOV R2, #0
    LDR R3, [R0, #length]
    SUB R3, R3, #1
reverse_loop:
    LDRB R4, [R0, R3]
    STRB R4, [R1, R2]
    ADD R2, R2, #1
    SUBS R3, R3, #1
    BGE reverse_loop
    STRB R2, [R1, R2]
    POP {LR}
    BX LR

; Function to compare two strings
compareStrings:
    PUSH {LR}
    MOV R2, #0
compare_loop:
    LDRB R3, [R0, R2]
    LDRB R4, [R1, R2]
    CMP R3, #0
    BEQ compare_done
    CMP R3, R4
    BNE not_palindrome
    ADD R2, R2, #1
    B compare_loop
not_palindrome:
    MOV R0, #0
    B end_compare
compare_done:
    MOV R0, #1
end_compare:
    POP {LR}
    BX LR

