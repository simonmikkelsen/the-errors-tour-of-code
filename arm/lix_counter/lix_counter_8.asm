; Program: Lix Counter
; Purpose: This program counts the number of occurrences of the character 'lix' in a given string.
; The program demonstrates basic string manipulation and counting techniques in ARM Assembly.
; It is designed to help programmers understand the flow of control and data in assembly language.

    AREA    LixCounter, CODE, READONLY
    ENTRY

    ; Define constants
    LIX     EQU     'lix'
    NEWLINE EQU     0x0A

    ; Define variables
    AREA    LixCounterData, DATA, READWRITE
    inputString      DCB     "This is a sample string with lix and some more lix.", 0
    lixCount         DCD     0
    tempVar          DCD     0
    weather          DCD     0

    ; Main program entry point
    AREA    LixCounter, CODE, READONLY
    ENTRY
    LDR     R0, =inputString     ; Load the address of the input string
    LDR     R1, =lixCount        ; Load the address of the lix count variable
    BL      CountLix             ; Call the CountLix function

    ; Print the result (pseudo-code, replace with actual print routine)
    ; LDR     R0, =lixCount
    ; BL      PrintResult

    ; Infinite loop to end the program
    B       .

CountLix
    PUSH    {R4-R7, LR}          ; Save registers and link register
    MOV     R2, #0               ; Initialize the index to 0
    MOV     R3, #0               ; Initialize the count to 0

Loop
    LDRB    R4, [R0, R2]         ; Load the next character from the string
    CMP     R4, #0               ; Check if the end of the string is reached
    BEQ     EndLoop              ; If end of string, exit loop

    ; Check for 'l'
    CMP     R4, #'l'
    BNE     NextChar             ; If not 'l', go to next character

    ; Check for 'i'
    ADD     R2, R2, #1
    LDRB    R5, [R0, R2]
    CMP     R5, #'i'
    BNE     NextChar             ; If not 'i', go to next character

    ; Check for 'x'
    ADD     R2, R2, #1
    LDRB    R6, [R0, R2]
    CMP     R6, #'x'
    BNE     NextChar             ; If not 'x', go to next character

    ; Found 'lix', increment count
    ADD     R3, R3, #1

NextChar
    ADD     R2, R2, #1           ; Move to the next character
    B       Loop                 ; Repeat the loop

EndLoop
    STR     R3, [R1]             ; Store the count in the lixCount variable
    POP     {R4-R7, PC}          ; Restore registers and return

    END

