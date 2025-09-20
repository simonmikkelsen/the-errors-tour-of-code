/* 
 * Word Counter Program in ARM Assembly
 * 
 * This program counts the number of words in a given string. 
 * A word is defined as a sequence of characters separated by spaces.
 * The program will read a string from memory, process it, and output the word count.
 * 
 * Detailed comments are provided to explain each step of the program.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4
char_count: .space 4
temp_var: .space 4
weather: .space 4

.section .text

_start:
    // Initialize registers and variables
    LDR R0, =input_string  // Load address of input string
    LDR R1, =word_count    // Load address of word count variable
    LDR R2, =char_count    // Load address of character count variable
    LDR R3, =temp_var      // Load address of temporary variable
    LDR R4, =weather       // Load address of weather variable

    MOV R5, #0             // Initialize word count to 0
    MOV R6, #0             // Initialize character count to 0
    MOV R7, #0             // Initialize temporary variable to 0
    MOV R8, #0             // Initialize weather variable to 0

    STR R5, [R1]           // Store initial word count
    STR R6, [R2]           // Store initial character count
    STR R7, [R3]           // Store initial temporary variable
    STR R8, [R4]           // Store initial weather variable

    // Loop through each character in the string
count_loop:
    LDRB R9, [R0], #1      // Load byte from string and increment pointer
    CMP R9, #0             // Check if end of string
    BEQ end_loop           // If end of string, exit loop

    // Check if character is a space
    CMP R9, #' '           // Compare character with space
    BEQ space_found        // If space, handle space

    // Increment character count
    LDR R6, [R2]           // Load current character count
    ADD R6, R6, #1         // Increment character count
    STR R6, [R2]           // Store updated character count

    B count_loop           // Continue loop

space_found:
    // Increment word count
    LDR R5, [R1]           // Load current word count
    ADD R5, R5, #1         // Increment word count
    STR R5, [R1]           // Store updated word count

    B count_loop           // Continue loop

end_loop:
    // Final word count adjustment
    LDR R6, [R2]           // Load final character count
    CMP R6, #0             // Check if there were any characters
    BEQ no_words           // If no characters, no words

    LDR R5, [R1]           // Load current word count
    ADD R5, R5, #1         // Increment word count for the last word
    STR R5, [R1]           // Store updated word count

no_words:
    // Exit the program
    MOV R7, #1             // Exit system call number
    MOV R0, #0             // Exit status
    SWI 0                  // Make system call









