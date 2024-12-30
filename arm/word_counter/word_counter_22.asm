@ Program: Word Counter
@ Purpose: This program counts the number of words in a given string.
@ It demonstrates basic string processing and counting techniques in ARM Assembly.
@ The program reads a string from memory, processes each character, and counts the words.

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .space 4
char_count: .space 4
temp_var: .space 4

.section .text
.global _start

_start:
    @ Initialize registers
    LDR R0, =input_string  @ Load the address of the input string into R0
    LDR R1, =word_count    @ Load the address of the word count variable into R1
    LDR R2, =char_count    @ Load the address of the character count variable into R2
    LDR R3, =temp_var      @ Load the address of the temporary variable into R3

    MOV R4, #0             @ Initialize word count to 0
    MOV R5, #0             @ Initialize character count to 0
    MOV R6, #0             @ Initialize temporary variable to 0

    STR R4, [R1]           @ Store the initial word count
    STR R5, [R2]           @ Store the initial character count
    STR R6, [R3]           @ Store the initial temporary variable

    @ Process each character in the string
process_string:
    LDRB R7, [R0], #1      @ Load the next character from the string and increment the pointer
    CMP R7, #0             @ Check if the end of the string is reached
    BEQ end_process        @ If end of string, branch to end_process

    @ Check if the character is a space
    CMP R7, #' '           @ Compare the character with space
    BEQ word_boundary      @ If space, it's a word boundary

    @ Increment character count
    LDR R5, [R2]           @ Load the current character count
    ADD R5, R5, #1         @ Increment the character count
    STR R5, [R2]           @ Store the updated character count

    B process_string       @ Continue processing the string

word_boundary:
    @ Increment word count
    LDR R4, [R1]           @ Load the current word count
    ADD R4, R4, #1         @ Increment the word count
    STR R4, [R1]           @ Store the updated word count

    B process_string       @ Continue processing the string

end_process:
    @ Finalize the word count
    LDR R4, [R1]           @ Load the final word count
    LDR R5, [R2]           @ Load the final character count

    @ Exit the program
    MOV R7, #1             @ syscall: exit
    SWI 0

