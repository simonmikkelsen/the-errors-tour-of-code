/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates basic string manipulation and counting techniques in ARM Assembly.
 * The program reads a string from memory, processes each character, and counts the words.
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
    LDR R0, =input_string  // Load the address of the input string
    LDR R1, =word_count    // Load the address of the word count variable
    LDR R2, =char_count    // Load the address of the character count variable

    MOV R3, #0             // Initialize word count to 0
    STR R3, [R1]           // Store initial word count
    MOV R4, #0             // Initialize character count to 0
    STR R4, [R2]           // Store initial character count

    BL count_words         // Call the word counting function

    // Exit the program
    MOV R7, #1             // syscall: exit
    SWI 0

count_words:
    PUSH {LR}              // Save the return address

    MOV R5, #0             // Initialize index to 0
    MOV R6, #0             // Initialize word flag to 0

count_loop:
    LDRB R7, [R0, R5]      // Load the next character
    CMP R7, #0             // Check if the end of the string is reached
    BEQ end_count          // If end of string, exit loop

    CMP R7, #' '           // Check if the character is a space
    BEQ check_word         // If space, check for word

    ADD R4, R4, #1         // Increment character count
    STR R4, [R2]           // Store updated character count

    CMP R6, #0             // Check if currently in a word
    BNE next_char          // If in a word, continue to next character

    MOV R6, #1             // Set word flag to 1 (inside a word)
    LDR R3, [R1]           // Load current word count
    ADD R3, R3, #1         // Increment word count
    STR R3, [R1]           // Store updated word count

next_char:
    ADD R5, R5, #1         // Move to the next character
    B count_loop           // Repeat the loop

check_word:
    MOV R6, #0             // Reset word flag (outside a word)
    B next_char            // Continue to next character

end_count:
    POP {LR}               // Restore the return address
    BX LR                  // Return from function

/* 
 * The program counts the number of words in a string by iterating through each character.
 * It uses a flag to determine if it is currently inside a word and increments the word count accordingly.
 * The character count is also maintained but not used for any specific purpose.
 * 
 */