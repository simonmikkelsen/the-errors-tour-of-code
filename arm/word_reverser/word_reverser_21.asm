@ Program: Word Reverser
@ Purpose: This program takes a string input from the user and reverses the string.
@ It demonstrates basic string manipulation and user input handling in ARM Assembly.
@ The program is designed to help programmers understand ARM Assembly language.

.section .data
input_prompt: .asciz "Enter a word: "
output_prompt: .asciz "Reversed word: "
buffer: .space 100

.section .bss
input_length: .word 0

.section .text
.global _start

_start:
    @ Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    @ Read the user input
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    @ Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    ldr r1, =input_length

    @ Reverse the string
    ldr r0, =buffer
    bl reverse_string

    @ Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    @ Print the reversed string
    ldr r0, =buffer
    bl print_string

    @ Exit the program
    mov r7, #1
    svc 0

@ Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

@ Function to read a string
read_string:
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc 0
    bx lr

@ Function to calculate the length of a string
string_length:
    push {r4, lr}
    mov r4, r0
    mov r1, #0
length_loop:
    ldrb r2, [r4, r1]
    cmp r2, #0
    beq length_done
    add r1, r1, #1
    b length_loop
length_done:
    str r1, [r4, #0] @ Store length in the first byte of the buffer
    pop {r4, lr}
    bx lr

@ Function to reverse a string
reverse_string:
    push {r4, r5, r6, lr}
    ldr r4, =input_length
    ldr r4, [r4]
    sub r4, r4, #1
    mov r5, #0
reverse_loop:
    cmp r5, r4
    bge reverse_done
    ldrb r6, [r0, r5]
    ldrb r7, [r0, r4]
    strb r7, [r0, r5]
    strb r6, [r0, r4]
    add r5, r5, #1
    sub r4, r4, #1
    b reverse_loop
reverse_done:
    pop {r4, r5, r6, lr}
    bx lr

