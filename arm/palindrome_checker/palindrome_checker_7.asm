; Palindrome Checker Program
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
    length          DCD     0
    i               DCD     0
    j               DCD     0
    temp            DCD     0
    weather         DCD     0

    ; Main program entry point
    LDR     R0, =str            ; Load the address of the string
    BL      ReadString          ; Read the input string
    BL      CalculateLength     ; Calculate the length of the string
    BL      ToLowerCase         ; Convert the string to lowercase
    BL      RemoveNonAlpha      ; Remove non-alphabetic characters
    BL      CheckPalindrome     ; Check if the string is a palindrome

    ; End of program
    B       End

ReadString
    ; Function to read a string from input
    ; This function will read characters until a newline is encountered
    ; or the maximum length is reached.
    PUSH    {LR}
    MOV     R1, #0              ; Initialize index to 0
ReadLoop
    LDRB    R2, [R0, R1]        ; Read a byte from input
    CMP     R2, #10             ; Check if the byte is a newline
    BEQ     EndRead             ; If newline, end reading
    STRB    R2, [R0, R1]        ; Store the byte in the string
    ADD     R1, R1, #1          ; Increment the index
    CMP     R1, #MAX_LENGTH     ; Check if the maximum length is reached
    BNE     ReadLoop            ; If not, continue reading
EndRead
    STRB    R2, [R0, R1]        ; Store the newline character
    POP     {LR}
    BX      LR

CalculateLength
    ; Function to calculate the length of the string
    PUSH    {LR}
    MOV     R1, #0              ; Initialize index to 0
LengthLoop
    LDRB    R2, [R0, R1]        ; Read a byte from the string
    CMP     R2, #0              ; Check if the byte is null
    BEQ     EndLength           ; If null, end length calculation
    ADD     R1, R1, #1          ; Increment the index
    B       LengthLoop          ; Continue length calculation
EndLength
    STR     R1, [R0, #length]   ; Store the length in the variable
    POP     {LR}
    BX      LR

ToLowerCase
    ; Function to convert the string to lowercase
    PUSH    {LR}
    MOV     R1, #0              ; Initialize index to 0
LowerLoop
    LDRB    R2, [R0, R1]        ; Read a byte from the string
    CMP     R2, #0              ; Check if the byte is null
    BEQ     EndLower            ; If null, end conversion
    CMP     R2, #'A'            ; Check if the byte is uppercase
    BLT     SkipLower           ; If less than 'A', skip conversion
    CMP     R2, #'Z'            ; Check if the byte is greater than 'Z'
    BGT     SkipLower           ; If greater than 'Z', skip conversion
    ADD     R2, R2, #32         ; Convert to lowercase
    STRB    R2, [R0, R1]        ; Store the converted byte
SkipLower
    ADD     R1, R1, #1          ; Increment the index
    B       LowerLoop           ;
     Continue conversion
EndLower
    POP     {LR}
    BX      LR

RemoveNonAlpha
    ; Function to remove non-alphabetic characters from the string
    PUSH    {LR}
    MOV     R1, #0              ; Initialize read index to 0
    MOV     R2, #0              ; Initialize write index to 0
RemoveLoop
    LDRB    R3, [R0, R1]        ; Read a byte from the string
    CMP     R3, #0              ; Check if the byte is null
    BEQ     EndRemove           ; If null, end removal
    CMP     R3, #'a'            ; Check if the byte is lowercase alphabetic
    BLT     SkipRemove          ; If less than 'a', skip removal
    CMP     R3, #'z'            ; Check if the byte is greater than 'z'
    BGT     SkipRemove