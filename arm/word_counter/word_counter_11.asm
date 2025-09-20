/* 
 * ARM Assembly Program: Word Counter
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates the use of ARM assembly instructions for string processing.
 * The program uses various techniques to identify word boundaries and count words.
 * It is designed to be verbose and includes detailed comments to help understand each step.
 */

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .word 0

.section .text
.global _start

_start:
    LDR R0, =input_string  // Load the address of the input string into R0
    LDR R1, =word_count    // Load the address of the word count variable into R1
    MOV R2, #0             // Initialize R2 to 0 (used for counting words)
    MOV R3, #0             // Initialize R3 to 0 (used for tracking state)
    MOV R4, #0             // Initialize R4 to 0 (used for temporary storage)
    MOV R5, #0             // Initialize R5 to 0 (used for temporary storage)
    MOV R6, #0             // Initialize R6 to 0 (used for temporary storage)
    MOV R7, #0             // Initialize R7 to 0 (used for temporary storage)

count_words:
    LDRB R4, [R0], #1      // Load the next byte of the string into R4 and increment R0
    CMP R4, #0             // Compare the byte with null terminator
    BEQ end_count          // If null terminator, end the loop

    // Check if the current character is a space or punctuation
    CMP R4, #' '           // Compare with space
    BEQ check_word         // If space, check if it ends a word
    CMP R4, #'.'           // Compare with period
    BEQ check_word         // If period, check if it ends a word
    CMP R4, #','           // Compare with comma
    BEQ check_word         // If comma, check if it ends a word
    CMP R4, #'!'           // Compare with exclamation mark
    BEQ check_word         // If exclamation mark, check if it ends a word
    CMP R4, #'?'           // Compare with question mark
    BEQ check_word         // If question mark, check if it ends a word

    // If the character is not a space or punctuation, it is part of a word
    MOV R3, #1             // Set state to indicate we are in a word
    B count_words          // Continue to the next character

check_word:
    CMP R3, #1             // Check if we were in a word
    BNE count_words        // If not, continue to the next character
    ADD R2, R2, #1         // Increment the word count
    MOV R3, #0             // Reset state to indicate we are not in a word
    B count_words          // Continue to the next character

end_count:
    STR R2, [R1]           // Store the word count in the word_count variable

    // Exit the program
    MOV R7, #1             // syscall: exit
    SWI 0                  // invoke syscall

/* 
 
 
 
 
 
 
  error is that regular expressions are not used in this program.
 */