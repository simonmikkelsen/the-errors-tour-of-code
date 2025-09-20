; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters 
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will use various functions and variables to achieve this goal.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
isPalindrome:   .word 1

    .text
    .global _start

_start:
    ; Load the address of the input string
    LDR     R0, =inputString
    
    ; Calculate the length of the input string
    BL      calculateLength
    
    ; Store the length of the string
    STR     R0, [R1, #length]
    
    ; Check if the string is a palindrome
    BL      checkPalindrome
    
    ; Store the result (1 if palindrome, 0 if not)
    STR     R0, [R1, #isPalindrome]
    
    ; Exit the program
    MOV     R7, #1
    SWI     0

; Function to calculate the length of a string
calculateLength:
    PUSH    {R4, LR}
    MOV     R4, R0
    MOV     R1, #0
    
lengthLoop:
    LDRB    R2, [R4], #1
    CMP     R2, #0
    BEQ     lengthDone
    ADD     R1, R1, #1
    B       lengthLoop
    
lengthDone:
    MOV     R0, R1
    POP     {R4, LR}
    BX      LR

; Function to check if a string is a palindrome
checkPalindrome:
    PUSH    {R4-R7, LR}
    LDR     R1, =inputString
    LDR     R2, =inputString
    ADD     R2, R2, R0
    SUB     R2, R2, #1
    
palindromeLoop:
    LDRB    R3, [R1], #1
    LDRB    R4, [R2], #-1
    CMP     R3, R4
    BNE     notPalindrome
    CMP     R1, R2
    BHI     palindromeDone
    B       palindromeLoop
    
notPalindrome:
    MOV     R0, #0
    B       palindromeEnd
    
palindromeDone:
    MOV     R0, #1
    
palindromeEnd:
    POP     {R4-R7, LR}
    BX      LR

