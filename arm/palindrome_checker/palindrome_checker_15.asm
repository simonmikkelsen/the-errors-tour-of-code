; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.
; This program is designed to be verbose and includes many comments for educational purposes.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
isPalindrome:   .word 1
tempVar:        .word 0
weather:        .word 0

    .text
    .global _start

_start:
    ; Load the address of the input string
    LDR R0, =inputString

    ; Calculate the length of the input string
    BL calculateLength

    ; Load the length of the string
    LDR R1, =length
    LDR R1, [R1]

    ; Initialize pointers for the start and end of the string
    MOV R2, #0          ; Start pointer
    SUB R3, R1, #1      ; End pointer

    ; Check if the string is a palindrome
    BL checkPalindrome

    ; Load the result
    LDR R4, =isPalindrome
    LDR R4, [R4]

    ; Exit the program
    MOV R7, #1          ; syscall: exit
    SWI 0

; Function to calculate the length of the string
calculateLength:
    PUSH {LR}
    MOV R1, R0
    MOV R2, #0

calculateLoop:
    LDRB R3, [R1], #1
    CMP R3, #0
    BEQ calculateDone
    ADD R2, R2, #1
    B calculateLoop

calculateDone:
    LDR R4, =length
    STR R2, [R4]
    POP {LR}
    BX LR

; Function to check if the string is a palindrome
checkPalindrome:
    PUSH {LR}
    LDR R4, =isPalindrome
    MOV R5, #1
    STR R5, [R4]

checkLoop:
    CMP R2, R3
    BGE checkDone

    ; Load characters at the start and end pointers
    LDRB R5, [R0, R2]
    LDRB R6, [R0, R3]

    ; Convert to lowercase if necessary
    BL toLowerCase
    MOV R5, R0
    BL toLowerCase
    MOV R6, R0

    ; Compare characters
    CMP R5, R6
    BNE notPalindrome

    ; Move pointers
    ADD R2, R2, #1
    SUB R3, R3, #1
    B checkLoop

notPalindrome:
    MOV R5, #0
    STR R5, [R4]

checkDone:
    POP {LR}
    BX LR

; Function to convert a character to lowercase
toLowerCase:
    PUSH {LR}
    CMP R0, #'A'
    BLT toLowerDone
    CMP R0, #'Z'
    BGT toLowerDone
    ADD R0, R0, #32

toLowerDone:
    POP {LR}
    BX LR



