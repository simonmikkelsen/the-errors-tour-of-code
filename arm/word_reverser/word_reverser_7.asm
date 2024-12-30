; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and outputs the reversed string.
; The program is designed to help programmers understand ARM Assembly language and string manipulation.
; It includes detailed comments to explain each step of the process.

.section .data
inputString: .asciz "Hello, World!"  ; Original string to be reversed
outputString: .space 50              ; Space for the reversed string
length: .word 0                      ; Variable to store the length of the string

.section .text
.global _start

_start:
    ; Load the address of the input string into r0
    ldr r0, =inputString

    ; Calculate the length of the input string
    bl calculate_length

    ; Store the length of the string in the length variable
    str r0, [r1]

    ; Reverse the string
    bl reverse_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function: calculate_length
; Purpose: Calculate the length of a null-terminated string
calculate_length:
    push {lr}               ; Save the link register
    mov r1, r0              ; Copy the address of the string to r1
    mov r2, #0              ; Initialize the length counter to 0

calculate_length_loop:
    ldrb r3, [r1], #1       ; Load a byte from the string and increment the pointer
    cmp r3, #0              ; Compare the byte to null (end of string)
    beq calculate_length_end ; If null, end the loop
    add r2, r2, #1          ; Increment the length counter
    b calculate_length_loop ; Repeat the loop

calculate_length_end:
    mov r0, r2              ; Move the length counter to r0
    pop {lr}                ; Restore the link register
    bx lr                   ; Return from the function

; Function: reverse_string
; Purpose: Reverse a null-terminated string
reverse_string:
    push {lr}               ; Save the link register
    ldr r1, =inputString    ; Load the address of the input string into r1
    ldr r2, =outputString   ; Load the address of the output string into r2
    ldr r3, [r1]            ; Load the length of the string into r3

reverse_string_loop:
    subs r3, r3, #1         ; Decrement the length counter
    ldrb r4, [r1, r3]       ; Load a byte from the input string
    strb r4, [r2], #1       ; Store the byte in the output string and increment the pointer
    cmp r3, #0              ; Compare the length counter to 0
    bge reverse_string_loop ; If greater or equal to 0, repeat the loop

    mov r0, r2              ; Move the address of the output string to r0
    pop {lr}                ; Restore the link register
    bx lr                   ; Return from the function

