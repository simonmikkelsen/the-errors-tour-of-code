/*
 * Word Counter Program in ARM Assembly
 * 
 * This program counts the number of words in a given input string.
 * It reads input from the user, processes the string to count the words,
 * and then outputs the word count.
 * 
 * The program demonstrates basic string processing and user input handling
 * in ARM Assembly. It is designed to help programmers understand the 
 * fundamentals of ARM Assembly language and string manipulation.
 */

.section .data
input_prompt: .asciz "Enter a string: "
output_message: .asciz "Word count: %d\n"
buffer: .space 256

.section .bss
.word_count: .word 0

.section .text
.global _start

_start:
    // Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read user input
    ldr r0, =buffer
    mov r1, #256
    bl read_input

    // Initialize word count to 0
    ldr r0, =word_count
    mov r1, #0
    str r1, [r0]

    // Count words in the input string
    ldr r0, =buffer
    bl count_words

    // Print the word count
    ldr r0, =word_count
    ldr r1, [r0]
    ldr r0, =output_message
    bl printf

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #256
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

// Function to read input from the user
read_input:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

// Function to count words in a string
count_words:
    push {lr}
    mov r1, r0
    ldr r2, =word_count
    ldr r3, [r2]

count_loop:
    ldrb r4, [r1], #1
    cmp r4, #0
    beq count_done
    cmp r4, #' '
    beq increment_word_count
    b count_loop

increment_word_count:
    add r3, r3, #1
    b count_loop

count_done:
    str r3, [r2]
    pop {lr}
    bx lr

