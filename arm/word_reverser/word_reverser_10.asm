/* 
 * ARM Assembly Program: Word Reverser
 * 
 * This program takes a user input string and reverses the characters in the string.
 * It demonstrates basic string manipulation and user input handling in ARM assembly.
 * The program is designed to be verbose with detailed comments for educational purposes.
 */

.section .data
input_prompt: .asciz "Enter a string: "
output_prompt: .asciz "Reversed string: "
buffer: .space 256

.section .bss
.comm input_buffer, 256

.section .text
.global _start

_start:
    // Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    // Read user input
    ldr r0, =input_buffer
    mov r1, #256
    bl read_input

    // Reverse the string
    ldr r0, =input_buffer
    bl reverse_string

    // Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    // Print the reversed string
    ldr r0, =input_buffer
    bl print_string

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

// Function to read user input
read_input:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

// Function to reverse a string
reverse_string:
    push {lr}
    mov r1, r0
    bl string_length
    sub r1, r1, #1
    mov r2, r0

reverse_loop:
    cmp r1, r2
    ble reverse_done
    ldrb r3, [r0, r2]
    ldrb r4, [r0, r1]
    strb r4, [r0, r2]
    strb r3, [r0, r1]
    add r2, r2, #1
    sub r1, r1, #1
    b reverse_loop

reverse_done:
    pop {lr}
    bx lr

// Function to calculate the length of a string
string_length:
    push {lr}
    mov r1, r0
    mov r0, #0

length_loop:
    ldrb r2, [r1, r0]
    cmp r2, #0
    beq length_done
    add r0, r0, #1
    b length_loop

length_done:
    pop {lr}
    bx lr

