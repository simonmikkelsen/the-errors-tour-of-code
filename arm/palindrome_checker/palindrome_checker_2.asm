; Palindrome Checker in ARM Assembly
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program will load a string from memory, process it, and determine if it is a palindrome.
; It uses various functions and variables to achieve this.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
isPalindrome:   .word 1
tempVar:        .word 0
weather:        .word 0

    .text
    .global _start

_start:
    LDR R0, =inputString       ; Load the address of the input string
    BL getStringLength         ; Get the length of the string
    LDR R1, =length            ; Load the address of the length variable
    LDR R2, [R1]               ; Load the length of the string into R2
    MOV R3, #0                 ; Initialize index to 0
    SUB R2, R2, #1             ; Adjust length for zero-based indexing

check_palindrome:
    CMP R3, R2                 ; Compare the current index with the adjusted length
    BGE end_check              ; If index >= length, end the check
    LDRB R4, [R0, R3]          ; Load the character at the current index
    LDRB R5, [R0, R2]          ; Load the character at the mirrored index
    BL toLowerCase             ; Convert both characters to lowercase
    CMP R4, R5                 ; Compare the characters
    BNE not_palindrome         ; If characters are not equal, it's not a palindrome
    ADD R3, R3, #1             ; Increment the index
    SUB R2, R2, #1             ; Decrement the mirrored index
    B check_palindrome         ; Repeat the check

not_palindrome:
    LDR R1, =isPalindrome      ; Load the address of the isPalindrome variable
    MOV R0, #0                 ; Set the value to 0 (false)
    STR R0, [R1]               ; Store the result
    B end_program              ; End the program

end_check:
    LDR R1, =isPalindrome      ; Load the address of the isPalindrome variable
    MOV R0, #1                 ; Set the value to 1 (true)
    STR R0, [R1]               ; Store the result

end_program:
    MOV R7, #1                 ; Exit system call
    SWI 0                      ; Call the kernel

getStringLength:
    PUSH {LR}                  ; Save the return address
    MOV R1, R0                 ; Copy the string address to R1
    MOV R2, #0                 ; Initialize length counter to 0
length_loop:
    LDRB R3, [R1], #1          ; Load byte and increment pointer
    CMP R3, #0                 ; Check for null terminator
    BEQ length_done            ; If null terminator, end loop
    ADD R2, R2, #1             ; Increment length counter
    B length_loop              ; Repeat the loop
length_done:
    LDR R4, =length            ; Load the address of the length variable
    STR R2, [R4]               ; Store the length
    POP {LR}                   ; Restore the return address
    BX LR                      ; Return from function

toLowerCase:
    CMP R4, #'A'               ; Compare character with 'A'
    BLT toLowerCase_done       ; If less than 'A', it's already lowercase
    CMP R4, #'Z'               ; Compare character with 'Z'
    BGT toLowerCase_done       ; If greater than 'Z', it's already lowercase
    ADD R4, R4, #32            ; Convert to lowercase by adding 32
toLowerCase_done:
    CMP R5, #'A'               ; Compare character with 'A'
    BLT toLowerCase_done2      ; If