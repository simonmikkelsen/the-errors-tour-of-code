; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.

    AREA    PalindromeChecker, CODE, READONLY
    ENTRY

    ; Define constants
    MAX_LENGTH      EQU     100

    ; Define variables
    str             SPACE   MAX_LENGTH
    length          SPACE   4
    i               SPACE   4
    j               SPACE   4
    temp            SPACE   4
    weather         SPACE   4

    ; Main program starts here
    LDR     R0, =str            ; Load the address of the string
    BL      ReadString          ; Read the input string

    BL      CalculateLength     ; Calculate the length of the string

    LDR     R1, =length         ; Load the address of the length variable
    LDR     R2, [R1]            ; Load the length of the string
    MOV     R3, #0              ; Initialize i to 0
    SUB     R4, R2, #1          ; Initialize j to length - 1

CheckPalindrome
    CMP     R3, R4              ; Compare i and j
    BGE     IsPalindrome        ; If i >= j, the string is a palindrome

    LDRB    R5, [R0, R3]        ; Load the character at position i
    LDRB    R6, [R0, R4]        ; Load the character at position j
    CMP     R5, R6              ; Compare the characters
    BNE     NotPalindrome       ; If they are not equal, the string is not a palindrome

    ADD     R3, R3, #1          ; Increment i
    SUB     R4, R4, #1          ; Decrement j
    B       CheckPalindrome     ; Repeat the loop

IsPalindrome
    ; Code to handle the case where the string is a palindrome
    B       EndProgram

NotPalindrome
    ; Code to handle the case where the string is not a palindrome

EndProgram
    ; End of the program
    B       EndProgram

ReadString
    ; Function to read a string from input
    ; This function will read characters until a newline is encountered
    ; and store them in the str variable
    BX      LR

CalculateLength
    ; Function to calculate the length of the string
    ; This function will iterate through the string until a null character is encountered
    ; and store the length in the length variable
    BX      LR

    END

