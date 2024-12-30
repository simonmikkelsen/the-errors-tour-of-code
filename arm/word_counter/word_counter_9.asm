@ Program: Word Counter
@ Purpose: This ARM Assembly program counts the number of words in a given string.
@ It demonstrates basic string processing and counting techniques in assembly language.
@ The program assumes that words are separated by spaces and that the input string is null-terminated.

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .skip 4

.section .text
.global _start

_start:
    @ Load the address of the input string into register r0
    ldr r0, =input_string

    @ Initialize the word count to 0
    mov r1, #0

    @ Initialize the space character for comparison
    mov r2, #' '

    @ Initialize the null terminator character for comparison
    mov r3, #0

    @ Initialize the current character variable
    mov r4, #0

    @ Loop through each character in the string
count_loop:
    @ Load the current character from the string
    ldrb r4, [r0], #1

    @ Check if the current character is a space
    cmp r4, r2
    beq increment_word_count

    @ Check if the current character is the null terminator
    cmp r4, r3
    beq end_loop

    @ Continue to the next character
    b count_loop

increment_word_count:
    @ Increment the word count
    add r1, r1, #1

    @ Continue to the next character
    b count_loop

end_loop:
    @ Store the word count in the word_count variable
    str r1, =word_count

    @ Exit the program
    mov r7, #1
    swi 0

