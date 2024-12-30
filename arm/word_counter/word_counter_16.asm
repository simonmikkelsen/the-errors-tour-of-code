/* 
 * Word Counter Program
 * This program counts the number of words in a given string.
 * It reads a string from memory, processes each character, and counts the words.
 * A word is defined as a sequence of characters separated by spaces.
 */

.section .data
input_string: .asciz "This is a sample string with several words."

.section .bss
.word_count: .space 4
char_count: .space 4
temp_var: .space 4

.section .text
.global _start

_start:
    // Initialize registers
    ldr r0, =input_string  // Load address of input string
    ldr r1, =word_count    // Load address of word count
    ldr r2, =char_count    // Load address of character count
    ldr r3, =temp_var      // Load address of temporary variable

    // Initialize counters
    mov r4, #0             // Word count
    mov r5, #0             // Character count
    mov r6, #0             // Temporary variable

    // Store initial values in memory
    str r4, [r1]
    str r5, [r2]
    str r6, [r3]

    // Loop through each character in the string
count_loop:
    ldrb r7, [r0], #1      // Load byte from string and increment pointer
    cmp r7, #0             // Check if end of string
    beq end_loop           // If end of string, exit loop

    // Check if character is a space
    cmp r7, #' '           // Compare with space character
    beq word_boundary      // If space, it's a word boundary

    // Increment character count
    ldr r6, [r2]           // Load current character count
    add r6, r6, #1         // Increment character count
    str r6, [r2]           // Store updated character count

    b count_loop           // Continue loop

word_boundary:
    // Increment word count
    ldr r6, [r1]           // Load current word count
    add r6, r6, #1         // Increment word count
    str r6, [r1]           // Store updated word count

    b count_loop           // Continue loop

end_loop:
    // Final word count adjustment
    ldr r6, [r2]           // Load character count
    cmp r6, #0             // Check if there were any characters
    beq skip_increment     // If no characters, skip increment

    ldr r6, [r1]           // Load current word count
    add r6, r6, #1         // Increment word count for the last word
    str r6, [r1]           // Store updated word count

skip_increment:
    // Exit program
    mov r7, #1             // syscall number for exit
    mov r0, #0             // exit code 0
    svc 0                  // make syscall

/*
 */