; Program: Lix Counter
; Purpose: This program counts the number of 'lix' in a given string.
; The program demonstrates basic string processing and counting in ARM Assembly.
; It is designed to help programmers understand the flow of control and data manipulation.
; The program uses various variables and functions to achieve its goal.

    .data
inputString:    .asciz "This is a sample string with some lix characters."
lixCount:       .word 0
tempVar:        .word 0
weather:        .word 0
sunny:          .word 0
rainy:          .word 0

    .text
    .global _start

_start:
    LDR     R0, =inputString     ; Load the address of the input string
    LDR     R1, =lixCount        ; Load the address of the lix count variable
    LDR     R2, =tempVar         ; Load the address of a temporary variable
    LDR     R3, =weather         ; Load the address of the weather variable

    BL      countLix             ; Call the countLix function

    MOV     R7, #1               ; Exit system call
    SWI     0                    ; Make the system call

countLix:
    PUSH    {LR}                 ; Save the return address
    MOV     R4, R0               ; Copy the input string address to R4
    MOV     R5, #0               ; Initialize the index to 0

countLoop:
    LDRB    R6, [R4, R5]         ; Load the current character
    CMP     R6, #0               ; Compare with null terminator
    BEQ     endCount             ; If null terminator, end the loop

    CMP     R6, #'l'             ; Compare with 'l'
    BNE     notLix               ; If not 'l', skip to notLix
    LDR     R7, [R1]             ; Load the current lix count
    ADD     R7, R7, #1           ; Increment the lix count
    STR     R7, [R1]             ; Store the updated lix count

notLix:
    ADD     R5, R5, #1           ; Move to the next character
    B       countLoop            ; Repeat the loop

endCount:
    POP     {LR}                 ; Restore the return address
    BX      LR                   ; Return from the function

