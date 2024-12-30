@ Program: Word Counter
@ Purpose: This program counts the number of words in a given string.
@ It demonstrates basic string processing and counting techniques in ARM Assembly.
@ The program reads a string from memory, processes each character, and counts the words.
@ A word is defined as a sequence of characters separated by spaces.

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .space 4

.section .text
.global _start

_start:
    LDR R0, =input_string   @ Load the address of the input string into R0
    LDR R1, =word_count     @ Load the address of the word count variable into R1
    MOV R2, #0              @ Initialize the word count to 0
    STR R2, [R1]            @ Store the initial word count in memory

    MOV R3, #0              @ Initialize the index to 0
    MOV R4, #0              @ Initialize the flag to indicate if we are in a word

count_words:
    LDRB R5, [R0, R3]       @ Load the next character from the string
    CMP R5, #0              @ Compare the character to the null terminator
    BEQ done                @ If the character is null, we are done

    CMP R5, #' '            @ Compare the character to a space
    BEQ check_space         @ If the character is a space, check if we are in a word

    CMP R4, #0              @ Check if we are currently in a word
    BNE skip_increment      @ If we are in a word, skip the increment

    LDR R2, [R1]            @ Load the current word count
    ADD R2, R2, #1          @ Increment the word count
    STR R2, [R1]            @ Store the updated word count

    MOV R4, #1              @ Set the flag to indicate we are in a word

skip_increment:
    ADD R3, R3, #1          @ Move to the next character
    B count_words           @ Repeat the loop

check_space:
    MOV R4, #0              @ If the character is a space, reset the flag
    ADD R3, R3, #1          @ Move to the next character
    B count_words           @ Repeat the loop

done:
    @ Exit the program
    MOV R7, #1              @ syscall: exit
    SVC 0                   @ Make the syscall

