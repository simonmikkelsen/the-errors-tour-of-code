/* 
 * ARM Assembly Program: Word Counter
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates basic string manipulation and counting techniques in ARM assembly language.
 * The program reads a string from memory, processes each character, and counts the number of words.
 * A word is defined as a sequence of characters separated by spaces.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4
char_count: .space 4

.section .text

_start:
    LDR R0, =input_string  // Load address of input string into R0
    LDR R1, =word_count    // Load address of word count variable into R1
    LDR R2, =char_count    // Load address of character count variable into R2

    MOV R3, #0             // Initialize word count to 0
    STR R3, [R1]           // Store initial word count
    MOV R4, #0             // Initialize character count to 0
    STR R4, [R2]           // Store initial character count

    MOV R5, #0             // Initialize temporary variable for space detection
    MOV R6, #0             // Initialize temporary variable for word detection

process_string:
    LDRB R7, [R0], #1      // Load byte from string and increment pointer
    CMP R7, #0             // Check if end of string
    BEQ end_process        // If end of string, branch to end_process

    CMP R7, #' '           // Compare character with space
    BEQ found_space        // If space, branch to found_space

    ADD R4, R4, #1         // Increment character count
    STR R4, [R2]           // Store updated character count

    CMP R6, #0             // Check if we are in a word
    BNE process_string     // If in a word, continue processing

    ADD R3, R3, #1         // Increment word count
    STR R3, [R1]           // Store updated word count
    MOV R6, #1             // Set word detection flag

    B process_string       // Continue processing

found_space:
    MOV R6, #0             // Reset word detection flag
    B process_string       // Continue processing

end_process:
    // Program end, word count is stored in word_count variable
    // Character count is stored in char_count variable

    MOV R7, #1             // Exit system call number
    SWI 0                  // Software interrupt to exit

/* 
 */