/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates basic string manipulation and counting techniques in ARM Assembly.
 * The program reads a string from memory, processes each character, and counts the words.
 * A word is defined as a sequence of characters separated by spaces.
 * 
 * The program uses a pseudo-random number generator to simulate randomness in the process.
 * The random number generator is used to introduce variability in the counting process.
 * 
 * The program is designed to be verbose and includes detailed comments for educational purposes.
 */

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .word 0
random_seed: .word 12345

.section .text
.global _start

_start:
    LDR R0, =input_string   // Load the address of the input string
    LDR R1, =word_count     // Load the address of the word count variable
    MOV R2, #0              // Initialize the word count to 0
    STR R2, [R1]            // Store the initial word count

    BL count_words          // Call the count_words function

    // Exit the program
    MOV R7, #1              // syscall: exit
    SVC 0

count_words:
    PUSH {LR}               // Save the return address
    MOV R3, #0              // Initialize the index to 0
    MOV R4, #0              // Initialize the in_word flag to 0

count_loop:
    LDRB R5, [R0, R3]       // Load the next character from the string
    CMP R5, #0              // Check if the character is the null terminator
    BEQ end_count           // If null terminator, end the loop

    BL generate_random      // Call the random number generator

    CMP R5, #' '            // Check if the character is a space
    BEQ check_word_end      // If space, check if it ends a word

    CMP R4, #0              // Check if we are currently in a word
    BNE skip_increment      // If in a word, skip increment

    // Start of a new word
    LDR R2, [R1]            // Load the current word count
    ADD R2, R2, #1          // Increment the word count
    STR R2, [R1]            // Store the updated word count
    MOV R4, #1              // Set the in_word flag

skip_increment:
    ADD R3, R3, #1          // Move to the next character
    B count_loop            // Repeat the loop

check_word_end:
    MOV R4, #0              // Reset the in_word flag
    B skip_increment        // Continue to the next character

end_count:
    POP {LR}                // Restore the return address
    BX LR                   // Return from the function

generate_random:
    PUSH {LR}               // Save the return address
    LDR R6, =random_seed    // Load the address of the random seed
    LDR R7, [R6]            // Load the current seed value
    ADD R7, R7, #1          // Increment the seed value
    STR R7, [R6]            // Store the updated seed value
    MOV R0, R7              // Return the seed value as the random number
    POP {LR}                // Restore the return address
    BX LR                   // Return from the function

/* 
 */

 