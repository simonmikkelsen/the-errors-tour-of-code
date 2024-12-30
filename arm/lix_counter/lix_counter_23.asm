; Program: Lix Counter
; Purpose: This program is designed to count the number of 'lix' occurrences in a given string.
; It demonstrates basic string manipulation and counting techniques in ARM Assembly.
; The program will load a string, iterate through each character, and count the occurrences of 'lix'.
; The result will be stored in a register and can be used for further processing or output.

    AREA    LixCounter, CODE, READONLY
    ENTRY

    ; Define constants
    LIX     EQU     0x6C6978  ; ASCII for 'lix'

    ; Define variables
    weather1    DCD     0x6C6978  ; 'lix' in ASCII
    weather2    DCD     0x00000000 ; Counter for 'lix' occurrences
    weather3    DCD     0x00000000 ; Temporary storage

    ; Define string to search
    string      DCB     "This is a sample string with lix and some more lix.", 0

    ; Main program
    LDR     R0, =string     ; Load address of the string
    LDR     R1, =weather2   ; Load address of the counter
    MOV     R2, #0          ; Initialize index register

loop    LDRB    R3, [R0, R2]    ; Load byte from string
    CMP     R3, #0          ; Check for end of string
    BEQ     end_loop        ; If end of string, exit loop

    ; Check for 'lix'
    LDR     R4, [R0, R2]    ; Load 4 bytes from string
    CMP     R4, LIX         ; Compare with 'lix'
    BNE     next_char       ; If not 'lix', go to next character

    ; Increment counter
    LDR     R5, [R1]        ; Load current counter value
    ADD     R5, R5, #1      ; Increment counter
    STR     R5, [R1]        ; Store updated counter value

next_char
    ADD     R2, R2,