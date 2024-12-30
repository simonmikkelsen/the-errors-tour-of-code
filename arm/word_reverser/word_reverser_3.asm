; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the string.
; The reversed string is then printed to the console.
; This program demonstrates basic string manipulation and I/O operations in ARM Assembly.

.global _start

.section .data
input_prompt: .asciz "Enter a word: "
output_prompt: .asciz "Reversed word: "
buffer: .space 100  ; Buffer to store user input
newline: .asciz "\n"

.section .bss
len: .word 0  ; Variable to store the length of the input string

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read user input
    ldr r0, =buffer
    mov r1, #100
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    ldr r1, =len
    str r0, [r1]

    ; Reverse the string
    ldr r0, =buffer
    ldr r1, =len
    ldr r1, [r1]
    bl reverse_string

    ; Print the output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print the reversed string
    ldr r0, =buffer
    bl print_string

    ; Print a newline
    ldr r0, =newline
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    add r2, r2, #1
    b print_loop
print_done:
    mov r2, r2
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

; Function to read a string
read_string:
    push {lr}
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function to calculate the length of a string
string_length:
    push {lr}
    mov r1, r0
    mov r2, #0
length_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq length_done
    add r2, r2, #1
    b length_loop
length_done:
    mov r0, r2
    pop {lr}
    bx lr

; Function to reverse a string
reverse_string:
    push {lr}
    mov r2, r0
    add r2, r2, r1
    sub r2, r2, #1
reverse_loop:
    cmp r0, r2
    bge reverse_done
    ldrb r3, [r0]
    ldrb r4, [r2]
    strb r4, [r0]
    strb r3, [r2]
    add r0, r0, #1
    sub r2, r2, #1
    b reverse_loop
reverse_done:
    pop {lr}
    bx lr

