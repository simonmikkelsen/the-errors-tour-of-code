/* 
 * ARM Assembly Program: Word Reverser
 * 
 * This program takes a string input and reverses the words in the string.
 * The purpose of this program is to demonstrate basic string manipulation
 * and memory handling in ARM assembly language. The program will read a 
 * string from memory, reverse the words, and store the result back in memory.
 * 
 * The program uses a global variable to store the input string and the 
 * reversed string. It also demonstrates the use of various ARM instructions 
 * and techniques for handling strings.
 */

.global _start

.data
input_string: .asciz "Hello world from ARM assembly"
reversed_string: .space 100
temp_storage: .space 100

.text
_start:
    LDR R0, =input_string       // Load address of input string
    LDR R1, =reversed_string    // Load address of reversed string
    LDR R2, =temp_storage       // Load address of temporary storage

    BL reverse_words            // Call function to reverse words

    // Exit the program
    MOV R7, #1                  // syscall: exit
    SWI 0

reverse_words:
    PUSH {LR}                   // Save return address

    // Initialize pointers
    MOV R3, R0                  // R3 points to input string
    MOV R4, R1                  // R4 points to reversed string
    MOV R5, R2                  // R5 points to temporary storage

    // Reverse the entire string first
    BL reverse_string

    // Now reverse each word in the reversed string
    MOV R3, R1                  // R3 points to reversed string
    MOV R6, R1                  // R6 points to the start of the current word

reverse_loop:
    LDRB R7, [R3], #1           // Load byte from reversed string and increment pointer
    CMP R7, #0                  // Check for null terminator
    BEQ end_reverse_loop        // If null terminator, end loop
    CMP R7, #' '                // Check for space character
    BNE reverse_loop            // If not space, continue loop

    // Reverse the current word
    MOV R8, R3                  // R8 points to the end of the current word
    SUB R8, R8, #1              // Adjust to point to the last character of the word
    BL reverse_word             // Call function to reverse the word

    ADD R6, R3, #1              // Move to the start of the next word
    B reverse_loop              // Continue loop

end_reverse_loop:
    // Reverse the last word
    MOV R8, R3                  // R8 points to the end of the current word
    BL reverse_word             // Call function to reverse the word

    POP {LR}                    // Restore return address
    BX LR                       // Return from function

reverse_string:
    PUSH {LR}                   // Save return address

    // Find the length of the string
    MOV R9, #0                  // Initialize length counter
find_length:
    LDRB R10, [R3, R9]          // Load byte from input string
    CMP R10, #0                 // Check for null terminator
    BEQ length_found            // If null terminator, length found
    ADD R9, R9, #1              // Increment length counter
    B find_length               // Continue loop

length_found:
    SUB R9, R9, #1              // Adjust length to point to last character

    // Reverse the string
reverse_chars:
    LDRB R10, [R3, R9]          // Load byte from input string
    STRB R10, [R4], #1          // Store byte in reversed string and increment pointer
    SUB R9, R9, #1              // Decrement length counter
    CMP R9, #-1                 // Check if all characters are reversed
    BNE reverse_chars           // If not, continue loop

    STRB R10, [R4], #1          // Store null terminator in reversed string

    POP {LR}                    // Restore return address
    BX LR                       // Return from function

reverse_word:
    PUSH {LR}                   // Save return address

    // Reverse characters in the word
reverse_word_chars:
    LDRB R11, [R6], #1          // Load byte from word
    STRB R11, [R8], #-1         // Store byte in reversed word and decrement pointer
    CMP R6, R3                  // Check if all characters are reversed
    BNE reverse_word_chars      // If not, continue loop

    POP {LR}                    // Restore return address
    BX LR                       // Return from function

