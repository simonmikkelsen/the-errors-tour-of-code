/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It reads a string from memory, processes each character, 
 * and counts the number of words based on spaces and punctuation.
 * 
 * The program is designed to help programmers understand 
 * ARM Assembly language and practice debugging.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4
char_count: .space 4

.section .text
_start:
    LDR R0, =input_string   // Load the address of the input string
    LDR R1, =word_count     // Load the address of the word count variable
    LDR R2, =char_count     // Load the address of the character count variable
    MOV R3, #0              // Initialize word count to 0
    MOV R4, #0              // Initialize character count to 0
    STR R3, [R1]            // Store initial word count
    STR R4, [R2]            // Store initial character count

loop_start:
    LDRB R5, [R0], #1       // Load byte from string and increment pointer
    CMP R5, #0              // Compare byte with null terminator
    BEQ end_loop            // If null terminator, end loop

    CMP R5, #' '            // Compare byte with space
    BEQ increment_word      // If space, increment word count

    CMP R5, #'.'            // Compare byte with period
    BEQ increment_word      // If period, increment word count

    CMP R5, #','            // Compare byte with comma
    BEQ increment_word      // If comma, increment word count

    ADD R4, R4, #1          // Increment character count
    B loop_start            // Continue loop

increment_word:
    LDR R3, [R1]            // Load current word count
    ADD R3, R3, #1          // Increment word count
    STR R3, [R1]            // Store updated word count
    B loop_start            // Continue loop

end_loop:
    // Infinite loop to simulate program end
    B end_loop

