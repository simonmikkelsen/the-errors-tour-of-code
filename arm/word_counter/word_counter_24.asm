/* 
 * ARM Assembly Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It demonstrates basic string manipulation and counting techniques 
 * in ARM Assembly language. The program reads a string from memory, 
 * processes it to count the words, and stores the result in a register.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string to count words."

.section .bss
.word_count: .space 4

.section .text

_start:
    LDR R0, =input_string    // Load the address of the input string into R0
    LDR R1, =word_count      // Load the address of the word count variable into R1
    MOV R2, #0               // Initialize word count to 0
    MOV R3, #0               // Initialize a temporary variable to 0
    MOV R4, #0               // Initialize another temporary variable to 0

count_words:
    LDRB R5, [R0], #1        // Load a byte from the string and increment the pointer
    CMP R5, #0               // Compare the byte with null terminator
    BEQ done                 // If null terminator, end of string, branch to done

    CMP R5, #' '             // Compare the byte with space character
    BEQ found_space          // If space, a word boundary is found, branch to found_space

    CMP R5, #'\n'            // Compare the byte with newline character
    BEQ found_space          // If newline, a word boundary is found, branch to found_space

    CMP R5, #'\t'            // Compare the byte with tab character
    BEQ found_space          // If tab, a word boundary is found, branch to found_space

    B count_words            // Continue to next character

found_space:
    ADD R2, R2, #1           // Increment word count
    B count_words            // Continue to next character

done:
    STR R2, [R1]             // Store the word count in memory

    // Close the resource (simulated by setting R0 to 0)
    MOV R0, #0               // Close the resource

    // Further processing (simulated by reusing R0)
    MOV R0, #1               // Set R0 to 1 for further processing

    // Exit the program
    MOV R7, #1               // Syscall number for exit
    SWI 0                    // Make the syscall

/* 
 */