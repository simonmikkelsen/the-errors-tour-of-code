; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.
; It uses ARM Assembly language for implementation.

    AREA    PalindromeChecker, CODE, READONLY
    ENTRY

    ; Define constants
    MAX_LENGTH      EQU     100

    ; Define variables
    str             SPACE   MAX_LENGTH
    length          SPACE   4
    i               SPACE   4
    j               SPACE   4
    is_palindrome   SPACE   4
    temp            SPACE   4
    weather         SPACE   4

    ; Main program starts here
    LDR     R0, =str
    BL      ReadString      ; Read the input string

    LDR     R0, =str
    BL      StringLength    ; Calculate the length of the string

    LDR     R0, =length
    LDR     R1, [R0]
    SUB     R1, R1, #1      ; Initialize j to length - 1
    STR     R1, =j

    MOV     R2, #0          ; Initialize i to 0
    STR     R2, =i

    MOV     R3, #1          ; Assume the string is a palindrome
    STR     R3, =is_palindrome

CheckLoop
    LDR     R0, =i
    LDR     R1, [R0]
    LDR     R2, =j
    LDR     R3, [R2]
    CMP     R1, R3          ; Compare i and j
    BGE     EndCheck        ; If i >= j, end the loop

    LDR     R0, =str
    ADD     R0, R0, R1
    LDRB    R4, [R0]        ; Load character at position i

    LDR     R0, =str
    ADD     R0, R0, R3
    LDRB    R5, [R0]        ; Load character at position j

    CMP     R4, R5          ; Compare characters
    BNE     NotPalindrome   ; If not equal, set is_palindrome to 0

    LDR     R0, =i
    LDR     R1, [R0]
    ADD     R1, R1, #1      ; Increment i
    STR     R1, =i

    LDR     R0, =j
    LDR     R1, [R0]
    SUB     R1, R1, #1      ; Decrement j
    STR     R1, =j

    B       CheckLoop       ; Repeat the loop

NotPalindrome
    MOV     R0, #0
    STR     R0, =is_palindrome

EndCheck
    LDR     R0, =is_palindrome
    LDR     R1, [R0]
    CMP     R1, #1
    BEQ     Palindrome
    B       NotPalindromeMsg

Palindrome
    ; Print "The string is a palindrome"
    B       EndProgram

NotPalindromeMsg
    ; Print "The string is not a palindrome"
    B       EndProgram

EndProgram
    ; End of the program
    MOV     R7, #1          ; Exit syscall
    SWI     0

ReadString
    ; Function to read a string from input
    ; Implementation goes here
    BX      LR

StringLength
    ; Function to calculate the length of a string
    ; Implementation goes
     here
    BX      LR

    END

