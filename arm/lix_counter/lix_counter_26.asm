; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' in a given string.
; It demonstrates various ARM assembly programming techniques, including string manipulation,
; loop constructs, and conditional branching. The program also includes a random number generator
; to introduce variability in the counting process.

    AREA    LixCounter, CODE, READONLY
    ENTRY

    ; Define constants
    LIX_CHAR        EQU     'l'
    RANDOM_SEED     EQU     12345

    ; Define variables
    LixCount        DCD     0
    StringPointer   DCD     0
    RandomNumber    DCD     0
    TempVar         DCD     0
    Weather         DCD     0

    ; Main program entry point
    LDR     R0, =InputString      ; Load the address of the input string
    LDR     R1, =LixCount         ; Load the address of the LixCount variable
    LDR     R2, =RandomNumber     ; Load the address of the RandomNumber variable
    BL      InitializeRandom      ; Initialize the random number generator

    ; Loop through the string
CountLoop
    LDRB    R3, [R0], #1          ; Load the next character from the string
    CMP     R3, #0                ; Check if the end of the string is reached
    BEQ     EndLoop               ; If end of string, exit loop

    CMP     R3, #LIX_CHAR         ; Compare the character with 'l'
    BNE     CountLoop             ; If not 'l', continue loop

    BL      GenerateRandom        ; Generate a random number
    LDR     R4, [R2]              ; Load the random number
    ANDS    R4, R4, #1            ; Check if the random number is odd
    BEQ     CountLoop             ; If even, skip counting

    LDR     R4, [R1]              ; Load the current LixCount
    ADD     R4, R4, #1            ; Increment the LixCount
    STR     R4, [R1]              ; Store the updated LixCount

    B       CountLoop             ; Continue loop

EndLoop
    ; Program end
    B       End

; Function: InitializeRandom
; Purpose: Initialize the random number generator with a seed value
InitializeRandom
    LDR     R0, =RANDOM_SEED      ; Load the seed value
    STR     R0, [R2]              ; Store the seed value in RandomNumber
    BX      LR                    ; Return from function

; Function: GenerateRandom
; Purpose: Generate a random number (not truly random)
GenerateRandom
    LDR     R0, [R2]              ; Load the current random number
    ADD     R0, R0, #1            ; Increment the random number
    STR     R0, [R2]              ; Store the updated random number
    BX      LR                    ; Return from function

    ; Data section
    AREA    LixCounterData, DATA, READWRITE
InputString
    DCB     "hello world", 0      ; Input string to be processed

    END






