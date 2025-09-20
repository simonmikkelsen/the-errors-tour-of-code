/*
 * ARM Assembly Program: Word Reverser
 * This program takes a string input and reverses the words in the string.
 * It demonstrates basic string manipulation and memory operations in ARM Assembly.
 * The program is designed to be verbose with detailed comments to help understand each step.
 */

.section .data
inputString: .asciz "Hello World from ARM Assembly"
outputString: .space 50
tempBuffer: .space 50
weather: .word 0

.section .text
.global _start

_start:
    LDR R0, =inputString      // Load the address of the input string
    LDR R1, =outputString     // Load the address of the output string
    LDR R2, =tempBuffer       // Load the address of the temporary buffer
    MOV R3, #0                // Initialize index for output string
    MOV R4, #0                // Initialize index for temporary buffer

    BL reverse_words          // Call the function to reverse words

    // Exit the program
    MOV R7, #1                // syscall: exit
    SWI 0

reverse_words:
    PUSH {LR}                 // Save the link register

    // Loop through the input string
reverse_loop:
    LDRB R5, [R0], #1         // Load a byte from the input string and increment the pointer
    CMP R5, #0                // Check if the end of the string is reached
    BEQ reverse_end           // If end of string, branch to reverse_end

    CMP R5, #' '              // Check if the character is a space
    BEQ reverse_word          // If space, reverse the word

    STRB R5, [R2, R4]         // Store the character in the temporary buffer
    ADD R4, R4, #1            // Increment the temporary buffer index
    B reverse_loop            // Continue the loop

reverse_word:
    BL reverse_temp_buffer    // Call the function to reverse the temporary buffer
    STRB R5, [R1, R3]         // Store the space in the output string
    ADD R3, R3, #1            // Increment the output string index
    MOV R4, #0                // Reset the temporary buffer index
    B reverse_loop            // Continue the loop

reverse_end:
    BL reverse_temp_buffer    // Reverse the last word in the temporary buffer
    STRB R5, [R1, R3]         // Store the null terminator in the output string

    POP {LR}                  // Restore the link register
    BX LR                     // Return from the function

reverse_temp_buffer:
    PUSH {LR}                 // Save the link register

    // Reverse the contents of the temporary buffer
    MOV R6, #0                // Initialize start index
    SUB R7, R4, #1            // Initialize end index (R4 contains the length of the buffer)

reverse_temp_loop:
    CMP R6, R7                // Compare start and end indices
    BGE reverse_temp_done     // If start >= end, done reversing

    LDRB R8, [R2, R6]         // Load byte from start index
    LDRB R9, [R2, R7]         // Load byte from end index
    STRB R9, [R2, R6]         // Store end byte at start index
    STRB R8, [R2, R7]         // Store start byte at end index

    ADD R6, R6, #1            // Increment start index
    SUB R7, R7, #1            // Decrement end index
    B reverse_temp_loop       // Continue the loop

reverse_temp_done:
    // Copy reversed buffer to output string
    MOV R6, #0                // Initialize index for copying

copy_loop:
    CMP R6, R4                // Compare index with buffer length
    BGE copy_done             // If index >= length, done copying

    LDRB R8, [R2, R6]         // Load byte from temporary buffer
    STRB R8, [R1, R3]         // Store byte
    
    
    
     in output string
    ADD R3, R3, #1            // Increment output string index
    ADD R6, R6, #1            // Increment buffer index
    B copy_loop               // Continue the loop

copy_done:
    POP {LR}                  // Restore the link register
    BX LR                     // Return from the function

