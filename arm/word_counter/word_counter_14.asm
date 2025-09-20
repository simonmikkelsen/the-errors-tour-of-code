/*
 * Program: Word Counter
 * Purpose: This program counts the number of words in a given string.
 *          It demonstrates basic string processing and counting techniques in ARM Assembly.
 *          The program reads a string from memory, processes each character, and counts the words.
 *          A word is defined as a sequence of characters separated by spaces.
 */

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4
char_count: .space 4

.section .text
.global _start

_start:
    LDR R0, =input_string   // Load the address of the input string into R0
    LDR R1, =word_count     // Load the address of the word count variable into R1
    LDR R2, =char_count     // Load the address of the character count variable into R2

    MOV R3, #0              // Initialize word count to 0
    STR R3, [R1]            // Store the initial word count
    MOV R4, #0              // Initialize character count to 0
    STR R4, [R2]            // Store the initial character count

    MOV R5, #0              // Initialize a temporary variable for processing
    MOV R6, #0              // Initialize another temporary variable for processing

process_string:
    LDRB R7, [R0], #1       // Load the next character from the string and increment the pointer
    CMP R7, #0              // Compare the character with null terminator
    BEQ end_process         // If null terminator, end the process

    CMP R7, #' '            // Compare the character with space
    BEQ found_space         // If space, a word boundary is found

    ADD R4, R4, #1          // Increment character count
    STR R4, [R2]            // Store the updated character count
    B process_string        // Continue processing the string

found_space:
    LDR R8, [R1]            // Load the current word count
    ADD R8, R8, #1          // Increment word count
    STR R8, [R1]            // Store the updated word count
    B process_string        // Continue processing the string

end_process:
    LDR R9, [R1]            // Load the final word count
    LDR R10, [R2]           // Load the final character count

    MOV R7, #1              // Prepare to exit
    SWI 0                   // Exit the program

/*
 */