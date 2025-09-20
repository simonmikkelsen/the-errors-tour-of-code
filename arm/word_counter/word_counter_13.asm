/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates basic string processing and counting techniques 
 * using ARM Assembly language. The program reads a string from memory, 
 * processes each character, and counts the number of words based on 
 * spaces and punctuation marks.
 */

.global _start

.data
input_string: .asciz "This is a sample string to count words."
word_count: .word 0
space: .asciz " "
punctuation: .asciz ",.!?;:"

.text

_start:
    LDR R0, =input_string   // Load the address of the input string
    LDR R1, =word_count     // Load the address of the word count variable
    MOV R2, #0              // Initialize the word count to 0
    STR R2, [R1]            // Store the initial word count

    BL count_words          // Call the word counting function

    // Exit the program
    MOV R7, #1              // syscall: exit
    SWI 0

count_words:
    PUSH {LR}               // Save the return address
    LDR R3, [R0]            // Load the first character of the string
    MOV R4, #0              // Initialize the index to 0
    MOV R5, #0              // Initialize the word flag to 0

loop:
    LDRB R6, [R0, R4]       // Load the current character
    CMP R6, #0              // Check if the end of the string is reached
    BEQ end_loop            // If end of string, exit loop

    BL is_space             // Check if the character is a space
    CMP R0, #1              // Compare the result
    BEQ next_char           // If space, go to next character

    BL is_punctuation       // Check if the character is punctuation
    CMP R0, #1              // Compare the result
    BEQ next_char           // If punctuation, go to next character

    CMP R5, #0              // Check if we are in a word
    BNE next_char           // If in a word, go to next character

    // Start of a new word
    LDR R1, =word_count     // Load the address of the word count variable
    LDR R2, [R1]            // Load the current word count
    ADD R2, R2, #1          // Increment the word count
    STR R2, [R1]            // Store the updated word count
    MOV R5, #1              // Set the word flag

next_char:
    ADD R4, R4, #1          // Move to the next character
    B loop                  // Repeat the loop

end_loop:
    POP {LR}                // Restore the return address
    BX LR                   // Return from the function

is_space:
    PUSH {LR}               // Save the return address
    LDR R1, =space          // Load the address of the space character
    LDRB R1, [R1]           // Load the space character
    CMP R0, R1              // Compare the character with space
    MOVEQ R0, #1            // If equal, return 1
    MOVNE R0, #0            // If not equal, return 0
    POP {LR}                // Restore the return address
    BX LR                   // Return from the function

is_punctuation:
    PUSH {LR}               // Save the return address
    LDR R1, =punctuation    // Load the address of the punctuation string
    MOV R2, #0              // Initialize the index to 0

check_punctuation:
    LDRB R3, [R1, R2]       // Load the current punctuation character
    CMP R3, #0              // Check if end of punctuation string
    BEQ not_punctuation     // If end, return 0
    CMP R0, R3              // Compare the character with punctuation
    MOVEQ R0, #1            // If equal, return 1
    ADD R2, R2, #1          // Move to the next punctuation character
    B check_punctuation     // Repeat the loop

not_punctuation:
    MOV R0, #0              // Return 0
    POP {LR}                // Restore the return address
    BX LR                   // Return from the function

/* 
 */