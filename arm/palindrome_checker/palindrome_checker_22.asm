; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters 
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string, process it, and determine if it is a palindrome.
; It uses various registers and memory locations to achieve this.

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
    SUB     R2, R2, #1          ; Set R2 to length - 1
    STR     R2, [R1]            ; Store the new length back

    ; Initialize indices
    MOV     R3, #0              ; Initialize i to 0
    LDR     R4, =length         ; Load the address of the length variable
    LDR     R5, [R4]            ; Load the length of the string
    MOV     R6, R5              ; Initialize j to length - 1

    ; Check if the string is a palindrome
PalindromeLoop
    CMP     R3, R6              ; Compare i and j
    BGE     EndPalindromeCheck  ; If i >= j, end the check

    ; Load characters at positions i and j
    LDRB    R7, [R0, R3]        ; Load character at position i
    LDRB    R8, [R0, R6]        ; Load character at position j

    ; Compare characters
    CMP     R7, R8              ; Compare the characters
    BNE     NotPalindrome       ; If they are not equal, it's not a palindrome

    ; Increment i and decrement j
    ADD     R3, R3, #1          ; Increment i
    SUB     R6, R6, #1          ; Decrement j

    B       PalindromeLoop      ; Repeat the loop

NotPalindrome
    ; If the string is not a palindrome
    MOV     R0, #0              ; Set result to 0 (false)
    B       EndProgram          ; End the program

EndPalindromeCheck
    ; If the string is a palindrome
    MOV     R0, #1              ; Set result to 1 (true)

EndProgram
    ; End of the program
    B       EndProgram          ; Infinite loop to end the program

ReadString
    ; Function to read a string from input
    ; (Implementation not shown)
    BX      LR

CalculateLength
    ; Function to calculate the length of a string
    ; (Implementation not shown)
    BX      LR

    END

