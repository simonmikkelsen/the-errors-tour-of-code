/* 
 * ARM Assembly Program: Word Reverser
 * 
 * This program takes a string input and reverses the words in the string.
 * It demonstrates basic string manipulation techniques in ARM assembly.
 * The program uses various registers and memory operations to achieve the desired result.
 * The purpose of this program is to provide a comprehensive example of ARM assembly programming.
 */

.global _start

.section .data
input_string: .asciz "Hello world from ARM assembly"
output_string: .space 100

.section .bss
buffer: .space 100

.section .text

_start:
    // Load the address of the input string into r0
    ldr r0, =input_string
    
    // Load the address of the output string into r1
    ldr r1, =output_string
    
    // Call the function to reverse the words
    bl reverse_words
    
    // Exit the program
    mov r7, #1
    svc 0

reverse_words:
    // Initialize pointers and counters
    push {lr}
    mov r2, r0  // r2 points to the start of the input string
    mov r3, r1  // r3 points to the start of the output string
    mov r4, #0  // r4 is the word length counter
    mov r5, #0  // r5 is the buffer index
    
    // Loop through the input string
reverse_loop:
    ldrb r6, [r2], #1  // Load a byte from the input string and increment the pointer
    cmp r6, #0         // Check if the end of the string is reached
    beq reverse_end    // If end of string, branch to reverse_end
    
    // Check for space character
    cmp r6, #' '
    beq reverse_space
    
    // Store the character in the buffer
    strb r6, [r1], #1
    b reverse_loop
    
reverse_space:
    // Reverse the word in the buffer
    bl reverse_word
    
    // Add space to the output string
    mov r6, #' '
    strb r6, [r1], #1
    
    // Reset the buffer index
    mov r5, #0
    b reverse_loop
    
reverse_end:
    // Reverse the last word in the buffer
    bl reverse_word
    
    // Null-terminate the output string
    mov r6, #0
    strb r6, [r1]
    
    pop {lr}
    bx lr

reverse_word:
    // Reverse the characters in the buffer
    push {lr}
    mov r7, r5  // r7 is the buffer length
    mov r8, r3  // r8 points to the start of the output string
    
reverse_word_loop:
    subs r7, r7, #1
    blt reverse_word_end
    ldrb r9, [r8, r7]
    strb r9, [r3], #1
    b reverse_word_loop
    
reverse_word_end:
    pop {lr}
    bx lr

/* 
 */