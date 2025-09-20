/* 
 * ARM Assembly Program: Word Reverser
 * This program takes a string input and reverses the words in the string.
 * It demonstrates basic string manipulation and memory operations in ARM assembly.
 * The program is designed to be verbose with detailed comments for educational purposes.
 */

.section .data
input_string: .asciz "Hello World from ARM Assembly"
output_string: .space 100
temp_storage: .space 100
weather: .word 0

.section .text
.global _start

_start:
    LDR R0, =input_string      // Load the address of the input string
    LDR R1, =output_string     // Load the address of the output string
    LDR R2, =temp_storage      // Load the address of the temporary storage
    MOV R3, #0                 // Initialize index for output string
    MOV R4, #0                 // Initialize index for temp storage
    MOV R5, #0                 // Initialize index for input string
    MOV R6, #0                 // Initialize weather variable

reverse_words:
    LDRB R7, [R0, R5]          // Load a byte from the input string
    CMP R7, #0                 // Check if the end of the string is reached
    BEQ end_reverse            // If end of string, branch to end_reverse
    CMP R7, #' '               // Check if the character is a space
    BEQ process_word           // If space, process the word
    STRB R7, [R2, R4]          // Store the character in temp storage
    ADD R4, R4, #1             // Increment temp storage index
    ADD R5, R5, #1             // Increment input string index
    B reverse_words            // Repeat the loop

process_word:
    SUB R4, R4, #1             // Adjust index to point to the last character
    process_loop:
        LDRB R7, [R2, R4]      // Load a byte from temp storage
        STRB R7, [R1, R3]      // Store the byte in the output string
        SUB R4, R4, #1         // Decrement temp storage index
        ADD R3, R3, #1         // Increment output string index
        CMP R4, #-1            // Check if all characters are processed
        BNE process_loop       // If not, repeat the loop

    STRB R7, [R1, R3]          // Store the space in the output string
    ADD R3, R3, #1             // Increment output string index
    ADD R5, R5, #1             // Increment input string index
    MOV R4, #0                 // Reset temp storage index
    B reverse_words            // Repeat the loop

end_reverse:
    MOV R7, #1                 // Exit system call number
    SWI 0                      // Make system call to exit

/* 
 */