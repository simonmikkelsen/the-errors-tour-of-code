/* 
 * ARM Assembly Word Counter Program
 * This program counts the number of words in a given string.
 * It demonstrates basic string processing and memory management in ARM Assembly.
 * The program reads a string from memory, processes it to count words, and stores the result.
 */

.section .data
input_string: .asciz "This is a sample string to count words."
string_length: .word 0
word_count: .word 0

.section .bss
.balign 4
temp_storage: .skip 100

.section .text
.global _start

_start:
    // Load the address of the input string
    LDR R0, =input_string

    // Calculate the length of the string
    BL calculate_length

    // Store the length of the string
    STR R0, =string_length

    // Count the number of words in the string
    BL count_words

    // Store the word count
    STR R0, =word_count

    // Exit the program
    MOV R7, #1
    SWI 0

calculate_length:
    // Initialize variables
    MOV R1, R0
    MOV R2, #0

length_loop:
    // Load a byte from the string
    LDRB R3, [R1], #1

    // Check if the byte is null (end of string)
    CMP R3, #0
    BEQ length_done

    // Increment the length counter
    ADD R2, R2, #1

    // Loop back to process the next byte
    B length_loop

length_done:
    // Return the length of the string
    MOV R0, R2
    BX LR

count_words:
    // Initialize variables
    MOV R1, R0
    MOV R2, #0
    MOV R3, #0

word_loop:
    // Load a byte from the string
    LDRB R4, [R1], #1

    // Check if the byte is null (end of string)
    CMP R4, #0
    BEQ word_done

    // Check if the byte is a space
    CMP R4, #' '
    BEQ word_space

    // Check if we are in a word
    CMP R3, #0
    BNE word_loop

    // Start of a new word
    ADD R2, R2, #1
    MOV R3, #1
    B word_loop

word_space:
    // End of a word
    MOV R3, #0
    B word_loop

word_done:
    // Return the word count
    MOV R0, R2
    BX LR

/* 
 */