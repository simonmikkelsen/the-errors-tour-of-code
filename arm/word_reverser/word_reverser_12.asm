/* 
 * ARM Assembly Program: Word Reverser
 * 
 * This program takes a string input and reverses the words in the string.
 * It demonstrates basic string manipulation, memory handling, and loop constructs.
 * The program is designed to help programmers understand ARM assembly language.
 */

.section .data
inputString: .asciz "Hello World from ARM Assembly"
outputString: .space 100  // Allocate space for the output string

.section .bss
tempBuffer: .space 100  // Temporary buffer for word manipulation

.section .text
.global _start

_start:
    // Load the address of the input string
    LDR R0, =inputString
    // Load the address of the output string
    LDR R1, =outputString
    // Load the address of the temporary buffer
    LDR R2, =tempBuffer

    // Initialize loop variables
    MOV R3, #0  // Index for input string
    MOV R4, #0  // Index for output string
    MOV R5, #0  // Index for temporary buffer

reverse_loop:
    // Load a byte from the input string
    LDRB R6, [R0, R3]
    // Check if the byte is a space or null terminator
    CMP R6, #32
    BEQ word_end
    CMP R6, #0
    BEQ end_of_string

    // Store the byte in the temporary buffer
    STRB R6, [R2, R5]
    ADD R5, R5, #1
    ADD R3, R3, #1
    B reverse_loop

word_end:
    // Reverse the word in the temporary buffer
    SUB R5, R5, #1
reverse_word:
    LDRB R6, [R2, R5]
    STRB R6, [R1, R4]
    ADD R4, R4, #1
    SUB R5, R5, #1
    CMP R5, #-1
    BNE reverse_word

    // Add a space after the word
    MOV R6, #32
    STRB R6, [R1, R4]
    ADD R4, R4, #1

    // Reset the temporary buffer index
    MOV R5, #0
    ADD R3, R3, #1
    B reverse_loop

end_of_string:
    // Null-terminate the output string
    MOV R6, #0
    STRB R6, [R1, R4]

    // Exit the program
    MOV R7, #1  // syscall: exit
    SVC #0

