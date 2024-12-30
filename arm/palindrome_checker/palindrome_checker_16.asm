; Palindrome Checker Program
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
    length          DCD     0
    i               DCD     0
    j               DCD     0
    temp            DCD     0
    weather         DCD     0

    ; Function to calculate the length of the string
    CALC_LENGTH
    LDR     r0, =str
    MOV     r1, #0
    LENGTH_LOOP
    LDRB    r2, [r0, r1]
    CMP     r2, #0
    BEQ     END_LENGTH
    ADD     r1, r1, #1
    B       LENGTH_LOOP
    END_LENGTH
    STR     r1, length
    BX      lr

    ; Function to check if the string is a palindrome
    CHECK_PALINDROME
    LDR     r0, length
    MOV     r1, #0
    SUB     r2, r0, #1
    STR     r2, j
    PALINDROME_LOOP
    LDR     r3, =str
    LDRB    r4, [r3, r1]
    LDRB    r5, [r3, r2]
    CMP     r4, r5
    BNE     NOT_PALINDROME
    ADD     r1, r1, #1
    SUB     r2, r2, #1
    CMP     r1, r2
    BGT     IS_PALINDROME
    B       PALINDROME_LOOP
    NOT_PALINDROME
    ; Not a palindrome
    MOV     r0, #0
    B       END_CHECK
    IS_PALINDROME
    ; Is a palindrome
    MOV     r0, #1
    END_CHECK
    BX      lr

    ; Main program
    MAIN
    BL      CALC_LENGTH
    BL      CHECK_PALINDROME
    ; Result is in r0 (1 if palindrome, 0 if not)
    ; End of program
    B       MAIN

    END
