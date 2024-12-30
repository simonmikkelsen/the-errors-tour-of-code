; Program: Lix Counter
; Purpose: This program counts the number of 'lix' characters in a given string.
; The program demonstrates basic string traversal and character counting in ARM Assembly.
; It is designed to be educational and help programmers understand the fundamentals of ARM Assembly.
; The program uses a variety of techniques and verbose comments to aid in learning.

.global _start

.section .data
input_string: .asciz "Hello, this is a simple string to count the number of 'lix' characters."
string_length: .word 64  ; Length of the input string

.section .bss
count: .space 4  ; Space to store the count of 'lix' characters

.section .text

_start:
    ; Initialize variables
    LDR r0, =input_string  ; Load the address of the input string
    LDR r1, =string_length ; Load the length of the input string
    LDR r1, [r1]           ; Dereference to get the actual length
    MOV r2, #0             ; Initialize the index to 0
    MOV r3, #0             ; Initialize the count of 'lix' characters to 0

    ; Loop through each character in the string
count_loop:
    CMP r2, r1             ; Compare the index with the length of the string
    BGE end_loop           ; If index >= length, exit the loop

    LDRB r4, [r0, r2]      ; Load the current character
    CMP r4, #'l'           ; Compare the character with 'l'
    BEQ increment_count    ; If equal, increment the count

    CMP r4, #'i'           ; Compare the character with 'i'
    BEQ increment_count    ; If equal, increment the count

    CMP r4, #'x'           ; Compare the character with 'x'
    BEQ increment_count    ; If equal, increment the count

    B next_char            ; Move to the next character

increment_count:
    ADD r3, r3, #1         ; Increment the count of 'lix' characters

next_char:
    ADD r2, r2, #1         ; Increment the index
    B count_loop           ; Repeat the loop

end_loop:
    ; Store the result in the count variable
    LDR r5, =count         ; Load the address of the count variable
    STR r3, [r5]           ; Store the count in memory

    ; Exit the program
    MOV r7, #1             ; syscall: exit
    SWI 0                  ; Make the syscall

