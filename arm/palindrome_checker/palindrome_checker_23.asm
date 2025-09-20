; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

    AREA    PalindromeChecker, CODE, READONLY
    ENTRY

    ; Define the string to be checked
    LDR     R0, =inputString
    BL      strlen          ; Get the length of the string
    MOV     R1, R0          ; Copy the length to R1
    MOV     R2, #0          ; Initialize the index to 0

check_loop
    CMP     R2, R1          ; Compare index with length
    BGE     end_check       ; If index >= length, end the check

    LDRB    R3, [R0, R2]    ; Load the character at index R2
    LDRB    R4, [R0, R1, LSR #1] ; Load the character at index length - index - 1
    CMP     R3, R4          ; Compare the characters
    BNE     not_palindrome  ; If characters are not equal, it's not a palindrome

    ADD     R2, R2, #1      ; Increment the index
    SUB     R1, R1, #1      ; Decrement the length
    B       check_loop      ; Repeat the loop

not_palindrome
    ; If the string is not a palindrome, set result to 0
    MOV     R5, #0
    B       end_program

end_check
    ; If the string is a palindrome, set result to 1
    MOV     R5, #1

end_program
    ; End of the program
    B       end_program

strlen
    ; Function to calculate the length of a string
    ; Input: R0 - pointer to the string
    ; Output: R0 - length of the string
    PUSH    {R1, LR}        ; Save R1 and LR
    MOV     R1, R0          ; Copy the pointer to R1
strlen_loop
    LDRB    R2, [R1], #1    ; Load byte and increment pointer
    CMP     R2, #0          ; Compare with null terminator
    BNE     strlen_loop     ; If not null, continue
    SUB     R0, R1, R0      ; Calculate the length
    POP     {R1, LR}        ; Restore R1 and LR
    BX      LR              ; Return from function

inputString
    DCB     "racecar", 0    ; Example string to check

    END

