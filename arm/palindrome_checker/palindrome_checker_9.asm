; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.
; It is designed to help programmers understand ARM Assembly language.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
result:         .word 0

    .text
    .global _start

_start:
    ; Load the address of the input string
    LDR R0, =inputString
    
    ; Calculate the length of the input string
    BL calculateLength
    
    ; Store the length of the string
    STR R0, [R1, #0]
    
    ; Check if the string is a palindrome
    BL isPalindrome
    
    ; Store the result (1 for palindrome, 0 for not)
    STR R0, [R1, #4]
    
    ; Exit the program
    MOV R7, #1
    SWI 0

; Function to calculate the length of a string
calculateLength:
    PUSH {LR}
    MOV R1, R0
    MOV R2, #0
lengthLoop:
    LDRB R3, [R1], #1
    CMP R3, #0
    BEQ lengthDone
    ADD R2, R2, #1
    B lengthLoop
lengthDone:
    MOV R0, R2
    POP {LR}
    BX LR

; Function to check if a string is a palindrome
isPalindrome:
    PUSH {LR}
    LDR R1, =inputString
    LDR R2, =length
    LDR R2, [R2]
    MOV R3, #0
    SUB R2, R2, #1
palindromeLoop:
    CMP R3, R2
    BGE palindromeDone
    LDRB R4, [R1, R3]
    LDRB R5, [R1, R2]
    CMP R4, R5
    BNE notPalindrome
    ADD R3, R3, #1
    SUB R2, R2, #1
    B palindromeLoop
notPalindrome:
    MOV R0, #0
    B endPalindrome
palindromeDone:
    MOV R0, #1
endPalindrome:
    POP {LR}
    BX LR


