/*
 * Word Counter Program in ARM Assembly
 * This program counts the number of words in a given string.
 * It demonstrates basic string processing and counting techniques.
 * The program reads a string from memory, processes each character,
 * and counts the number of words based on spaces and punctuation.
 */

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4
char_count: .space 4

.section .text
.global _start

_start:
    // Initialize registers
    LDR R0, =input_string  // Load the address of the input string
    LDR R1, =word_count    // Load the address of the word count variable
    LDR R2, =char_count    // Load the address of the character count variable
    MOV R3, #0             // Initialize word count to 0
    MOV R4, #0             // Initialize character count to 0
    MOV R5, #0             // Initialize a temporary register to 0

    // Store initial counts
    STR R3, [R1]           // Store initial word count
    STR R4, [R2]           // Store initial character count

process_string:
    LDRB R6, [R0], #1      // Load a byte from the string and increment the pointer
    CMP R6, #0             // Compare the byte with null terminator
    BEQ end_process        // If null terminator, end processing

    // Check if the character is a space or punctuation
    CMP R6, #' '           // Compare with space
    BEQ increment_word_count
    CMP R6, #'.'           // Compare with period
    BEQ increment_word_count
    CMP R6, #','           // Compare with comma
    BEQ increment_word_count

    // Increment character count
    LDR R4, [R2]           // Load current character count
    ADD R4, R4, #1         // Increment character count
    STR R4, [R2]           // Store updated character count
    B process_string       // Continue processing

increment_word_count:
    LDR R3, [R1]           // Load current word count
    ADD R3, R3, #1         // Increment word count
    STR R3, [R1]           // Store updated word count
    B process_string       // Continue processing

end_process:
    // Exit the program
    MOV R7, #1             // syscall: exit
    SWI 0                  // Make the syscall

/*
 */