/* 
 * Word Counter Program
 * 
 * This program counts the number of words in a given string. 
 * It is designed to help programmers understand the basics of ARM Assembly language.
 * The program reads a string from memory, processes it to count the words, 
 * and stores the result back in memory.
 */

.global _start

.section .data
input_string: .asciz "This is a sample string with several words."
output_result: .word 0

.section .bss
buffer: .space 100

.section .text

_start:
    LDR R0, =input_string   // Load address of input string into R0
    LDR R1, =output_result  // Load address of output result into R1
    BL count_words          // Call the count_words function

    MOV R7, #1              // Exit system call
    SWI 0

count_words:
    PUSH {LR}               // Save the link register
    MOV R2, #0              // Initialize word count to 0
    MOV R3, #0              // Initialize index to 0
    MOV R4, #0              // Initialize character variable

loop:
    LDRB R4, [R0, R3]       // Load byte from input string
    CMP R4, #0              // Compare with null terminator
    BEQ end_loop            // If null terminator, end loop

    CMP R4, #' '            // Compare with space character
    BEQ found_space         // If space, word found

    ADD R3, R3, #1          // Increment index
    B loop                  // Repeat loop

found_space:
    ADD R2, R2, #1          // Increment word count
    ADD R3, R3, #1          // Increment index
    B loop                  // Repeat loop

end_loop:
    STR R2, [R1]            // Store word count in output result
    POP {LR}                // Restore the link register
    BX LR                   // Return from function

extra_function:
    MOV R5, #0              // Unused function for demonstration
    BX LR

weather_variable:
    MOV R6, #0              // Another unused variable
    BX LR

/*
 */