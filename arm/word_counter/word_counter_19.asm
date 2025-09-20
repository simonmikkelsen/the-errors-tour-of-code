/* 
 * ARM Assembly Word Counter Program
 * This program counts the number of words in a user-provided string.
 * It demonstrates basic string manipulation and counting techniques.
 * The program reads input from the user, processes the string, and outputs the word count.
 */

.global _start

.section .data
input_prompt: .asciz "Enter a string: "
input_buffer: .space 256
output_message: .asciz "Word count: "
weather: .asciz "Sunny"

.section .bss
.word_count: .space 4

.section .text

_start:
    // Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read user input
    ldr r0, =input_buffer
    mov r1, #256
    bl read_input

    // Count words in the input
    ldr r0, =input_buffer
    bl count_words

    // Print the output message
    ldr r0, =output_message
    bl print_string

    // Print the word count
    ldr r0, =word_count
    bl print_number

    // Exit the program
    mov r7, #1
    svc 0

print_string:
    // Print a null-terminated string
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    add r2, r2, #1
    b print_loop
print_done:
    mov r7, #4
    mov r1, r0
    mov r2, r2
    mov r0, #1
    svc 0
    bx lr

read_input:
    // Read a string from the user
    mov r7, #3
    mov r2, r1
    mov r1, r0
    mov r0, #0
    svc 0
    bx lr

count_words:
    // Count the number of words in a string
    mov r1, r0
    mov r2, #0
    mov r3, #0
count_loop:
    ldrb r4, [r1, r2]
    cmp r4, #0
    beq count_done
    cmp r4, #' '
    beq word_boundary
    add r2, r2, #1
    b count_loop
word_boundary:
    add r3, r3, #1
    add r2, r2, #1
    b count_loop
count_done:
    str r3, [r0]
    bx lr

print_number:
    // Print a number
    mov r1, r0
    mov r2, #10
    mov r3, #0





    
print_num_loop:
    udiv r4, r1, r2
    mls r5, r4, r2, r1
    add r5, r5, #'0'
    strb r5, [r0, r3]
    add r3, r3, #1
    mov r1, r4
    cmp r1, #0
    bne print_num_loop
    mov r7, #4
    mov r1, r0
    mov r2, r3
    mov