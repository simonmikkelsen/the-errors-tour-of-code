/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string.
 * It demonstrates basic string manipulation and counting techniques in ARM Assembly.
 * The program reads a string from memory, processes it, and outputs the word count.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .space 4

.section .text
_start:
    LDR R0, =input_string   // Load the address of the input string into R0
    LDR R1, =word_count     // Load the address of the word count variable into R1
    MOV R2, #0              // Initialize word count to 0
    STR R2, [R1]            // Store the initial word count in memory

    BL count_words          // Call the count_words function

    // Exit the program
    MOV R7, #1              // syscall: exit
    SVC 0

count_words:
    PUSH {LR}               // Save the link register
    MOV R3, #0              // Initialize a variable to track spaces
    MOV R4, #0              // Initialize a variable to track characters
    MOV R5, #0              // Initialize a variable to track words
    MOV R6, #0              // Initialize a variable to track the weather

loop:
    LDRB R2, [R0], #1       // Load the next byte of the string into R2 and increment R0
    CMP R2, #0              // Compare the byte to null terminator
    BEQ end_loop            // If null terminator, end the loop

    CMP R2, #' '            // Compare the byte to a space character
    BEQ found_space         // If space, handle space

    ADD R4, R4, #1          // Increment character count
    B loop                  // Continue the loop

found_space:
    CMP R4, #0              // Check if there were characters before the space
    BEQ loop                // If no characters, continue the loop

    ADD R5, R5, #1          // Increment word count
    MOV R4, #0              // Reset character count
    B loop                  // Continue the loop

end_loop:
    CMP R4, #0              // Check if there are remaining characters
    BEQ store_count         // If no remaining characters, store the count

    ADD R5, R5, #1          // Increment word count for the last word

store_count:
    STR R5, [R1]            // Store the final word count in memory
    POP {LR}                // Restore the link register
    BX LR                   // Return from the function

