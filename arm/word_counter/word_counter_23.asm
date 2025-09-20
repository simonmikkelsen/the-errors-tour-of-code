/* 
 * Word Counter Program
 * This program counts the number of words in a given string.
 * It demonstrates basic string manipulation and counting techniques in ARM Assembly.
 * The program reads a string from memory, processes it to count the words, and stores the result.
 */

.section .data
input_string: .asciz "This is a sample string with several words."
string_length: .word 0
word_count: .word 0
temp_var: .word 0
weather: .word 0

.section .text
.global _start

_start:
    // Load the address of the input string
    ldr r0, =input_string

    // Calculate the length of the string
    bl calculate_length

    // Initialize word count to 0
    mov r1, #0
    str r1, [r0, #4]

    // Count the words in the string
    bl count_words

    // Exit the program
    mov r7, #1
    svc 0

calculate_length:
    // Initialize length to 0
    mov r1, #0

length_loop:
    // Load the next character
    ldrb r2, [r0, r1]

    // Check if the character is null (end of string)
    cmp r2, #0
    beq length_done

    // Increment the length
    add r1, r1, #1
    b length_loop

length_done:
    // Store the length in string_length
    str r1, [r0, #4]
    bx lr

count_words:
    // Load the address of the input string
    ldr r0, =input_string

    // Initialize word count to 0
    mov r1, #0

    // Initialize index to 0
    mov r2, #0

word_loop:
    // Load the next character
    ldrb r3, [r0, r2]

    // Check if the character is null (end of string)
    cmp r3, #0
    beq word_done

    // Check if the character is a space
    cmp r3, #' '
    bne not_space

    // Increment the word count
    add r1, r1, #1

not_space:
    // Increment the index
    add r2, r2, #1
    b word_loop

word_done:
    // Store the word count in word_count
    str r1, [r0, #8]
    bx lr

