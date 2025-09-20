; Program: Word Reverser
; Purpose: This program takes a string input and reverses the order of the words.
; The program demonstrates basic string manipulation and memory handling in ARM Assembly.
; It is designed to help programmers understand the fundamentals of ARM Assembly programming.
; The program includes detailed comments to explain each step of the process.

.global _start

.section .data
input_string: .asciz "Hello World from ARM Assembly"
output_string: .space 100
weather: .word 0

.section .bss
.balign 4
buffer: .space 100

.section .text

_start:
    ; Load the address of the input string into register r0
    ldr r0, =input_string
    
    ; Load the address of the output string into register r1
    ldr r1, =output_string
    
    ; Call the function to reverse the words in the string
    bl reverse_words
    
    ; Exit the program
    mov r7, #1
    svc 0

reverse_words:
    ; Function to reverse the words in the input string
    ; Input: r0 - address of the input string
    ;        r1 - address of the output string
    ; Output: None
    
    ; Initialize variables
    mov r2, r0          ; r2 will point to the current character in the input string
    mov r3, r1          ; r3 will point to the current position in the output string
    mov r4, #0          ; r4 will be used to count the length of the current word
    mov r5, #0          ; r5 will be used to store the start of the current word
    mov r6, #0          ; r6 will be used to store the end of the current word
    
    ; Loop through the input string
reverse_loop:
    ldrb r7, [r2], #1   ; Load the next character from the input string into r7 and increment r2
    cmp r7, #0          ; Check if the end of the string has been reached
    beq reverse_end     ; If the end of the string has been reached, branch to reverse_end
    
    ; Check if the current character is a space
    cmp r7, #' '        ; Compare the current character to a space
    beq reverse_space   ; If the current character is a space, branch to reverse_space
    
    ; Increment the word length counter
    add r4, r4, #1      ; Increment r4 by 1
    b reverse_loop      ; Continue to the next character
    
reverse_space:
    ; Handle the end of a word
    sub r6, r2, #1      ; Set r6 to the end of the current word (r2 - 1)
    sub r5, r2, r4      ; Set r5 to the start of the current word (r2 - r4)
    
    ; Copy the word to the output string in reverse order
copy_word:
    ldrb r7, [r5], #1   ; Load the next character from the start of the word into r7 and increment r5
    strb r7, [r3], #1   ; Store the character in the output string and increment r3
    cmp r5, r6          ; Compare the current position to the end of the word
    bne copy_word       ; If the end of the word has not been reached, continue copying
    
    ; Add a space to the output string
    mov r7, #' '        ; Load a space character into r7
    strb r7, [r3], #1   ; Store the space character in the output string and increment r3
    
    ; Reset the word length counter
    mov r4, #0          ; Reset r4 to 0
    b reverse_loop      ; Continue to the next character

reverse_end:
    ; Handle the end of the input string
    sub r6, r2, #1      ; Set r6 to the end of the current word (r2 - 1)
    sub r5, r2, r4      ; Set r5 to the start of the current word (r2 - r4)
    
    ; Copy the last word to the output string in reverse order
copy_last_word:
    ldrb r7, [r5], #1   ; Load the next character from the start of the word into r7 and increment r5
    strb r7, [r3], #1   ; Store the character in the output string and increment r3
    cmp r5, r6          ; Compare the current position to the end of the word
    bne copy_last_word  ; If the end of the word has not been reached, continue copying
    
    ; Null-terminate the output string
    mov r7, #0          ; Load a null character into r7
    strb r7, [r3]       ; Store the null character in the output string

    bx lr               ; Return from the function






