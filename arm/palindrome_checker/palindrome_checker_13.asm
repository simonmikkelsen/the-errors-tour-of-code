/* 
 * Palindrome Checker in ARM Assembly
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program uses a global variable to store the result and demonstrates 
 * the use of ARM Assembly instructions for string manipulation.
 */

.global _start

.section .data
input_string: .asciz "A man a plan a canal Panama"
result: .word 0  // Global variable to store the result (1 if palindrome, 0 if not)

.section .bss
weather: .space 4  // Unused variable

.section .text

_start:
    // Load the address of the input string into r0
    ldr r0, =input_string
    
    // Call the function to check if the string is a palindrome
    bl is_palindrome
    
    // Exit the program
    mov r7, #1
    swi 0

// Function to check if a string is a palindrome
is_palindrome:
    push {lr}
    
    // Initialize pointers
    ldr r1, =input_string  // Start pointer
    ldr r2, =input_string_end  // End pointer
    
    // Loop to compare characters from both ends
compare_loop:
    ldrb r3, [r1], #1  // Load byte from start pointer and increment
    ldrb r4, [r2], #-1  // Load byte from end pointer and decrement
    
    // Convert to lowercase if necessary
    bl to_lowercase
    mov r5, r0
    bl to_lowercase
    mov r6, r0
    
    // Compare characters
    cmp r5, r6
    bne not_palindrome
    
    // Check if pointers have crossed
    cmp r1, r2
    bge palindrome
    
    b compare_loop

not_palindrome:
    // Set result to 0 (not a palindrome)
    ldr r0, =result
    mov r1, #0
    str r1, [r0]
    b end_function

palindrome:
    // Set result to 1 (palindrome)
    ldr r0, =result
    mov r1, #1
    str r1, [r0]

end_function:
    pop {lr}
    bx lr

// Function to convert a character to lowercase
to_lowercase:
    push {lr}
    cmp r0, #'A'
    blt no_change
    cmp r0, #'Z'
    bgt no_change
    add r0, r0, #32

no_change:
    pop {lr}
    bx lr

input_string_end:
    .asciz "\0"  // End of the input string

