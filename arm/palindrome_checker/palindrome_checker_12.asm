/* 
 * Palindrome Checker in ARM Assembly
 * 
 * This program checks if a given string is a palindrome. 
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * 
 * The program will load a string from memory, process it to remove non-alphanumeric characters,
 * convert it to lowercase, and then check if it reads the same forwards and backwards.
 * 
 * The program uses various registers and memory locations to store intermediate results.
 * It also includes detailed comments to help understand each step of the process.
 */

.global _start

.section .data
input_string: .asciz "A man, a plan, a canal, Panama"
length: .word 0
processed_string: .space 100

.section .bss
buffer: .space 100

.section .text

_start:
    // Load the address of the input string into r0
    ldr r0, =input_string
    
    // Call the function to calculate the length of the string
    bl calculate_length
    
    // Store the length of the string in memory
    str r0, =length
    
    // Load the address of the input string into r0 again
    ldr r0, =input_string
    
    // Load the address of the buffer into r1
    ldr r1, =buffer
    
    // Call the function to process the string
    bl process_string
    
    // Load the address of the processed string into r0
    ldr r0, =processed_string
    
    // Call the function to check if the string is a palindrome
    bl is_palindrome
    
    // Exit the program
    mov r7, #1
    svc 0

calculate_length:
    // Initialize the length to 0
    mov r1, #0
    
    // Loop through the string until the null terminator is found
calculate_length_loop:
    ldrb r2, [r0, r1]
    cmp r2, #0
    beq calculate_length_end
    add r1, r1, #1
    b calculate_length_loop
    
calculate_length_end:
    // Return the length of the string in r0
    mov r0, r1
    bx lr

process_string:
    // Initialize the index for the input string to 0
    mov r2, #0
    
    // Initialize the index for the processed string to 0
    mov r3, #0
    
    // Loop through the input string
process_string_loop:
    ldrb r4, [r0, r2]
    cmp r4, #0
    beq process_string_end
    
    // Check if the character is alphanumeric
    cmp r4, #'A'
    blt process_string_skip
    cmp r4, #'Z'
    bgt process_string_check_lowercase
    b process_string_store
    
process_string_check_lowercase:
    cmp r4, #'a'
    blt process_string_skip
    cmp r4, #'z'
    bgt process_string_skip
    
process_string_store:
    // Convert uppercase to lowercase
    cmp r4, #'A'
    blt process_string_store_char
    cmp r4, #'Z'
    bgt process_string_store_char
    add r4, r4, #32
    
process_string_store_char:
    // Store the character in the processed string
    strb r4, [r1, r3]
    add r3, r3, #1
    
process_string_skip:
    // Move to the next character in the input string
    add r2, r2, #1
    b process_string_loop
    
process_string_end:
    // Null-terminate the processed string
    mov r4, #0
    strb r4, [r1, r3]
    bx lr

is_palindrome:
    // Initialize the start index to 0
    mov r2, #0
    
    // Load the length of the processed string
    ldr r3, =length
    ldr r3, [r3]
    
    // Initialize the end index to length - 1
    sub r3, r3, #1
    
    // Loop through the string
is_palindrome_loop:
    cmp r2, r3
    bge is_palindrome_true
    
    // Load the characters at the start and end indices
    ldrb r4, [r0, r2]
    ldrb r5, [r0, r3]
    
    // Compare the characters
    cmp r4, r5
    bne is_palindrome_false
    
    // Move to the next characters
    add r2, r2, #1
    sub r3, r3, #1
    b is_palindrome_loop
    
is_palindrome_true:
    // The string is a palindrome
    mov r0, #1
    bx
    
     lr
    
is_palindrome_false:
    // The string is not a palindrome
    mov r0, #0
    bx lr

