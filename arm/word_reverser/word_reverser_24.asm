; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the words in the string.
; The program demonstrates basic string manipulation and input/output operations in ARM Assembly.
; It is designed to help programmers understand the flow of data and control in assembly language.

.global _start

.section .data
input_prompt: .asciz "Enter a string: "
output_prompt: .asciz "Reversed string: "
buffer: .space 256
newline: .asciz "\n"

.section .bss
input_length: .word 0

.section .text

_start:
    ; Print the input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read the input string
    ldr r0, =buffer
    ldr r1, =256
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, input_length

    ; Reverse the words in the string
    ldr r0, =buffer
    bl reverse_words

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

; Function: print_string
; Purpose: Prints a null-terminated string to the standard output
print_string:
    push {lr}
    mov r1, r0
    mov r2, #0
print_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq print_done
    mov r0, #1
    add r1, r1, #1
    mov r7, #4
    svc 0
    b print_loop
print_done:
    pop {lr}
    bx lr

; Function: read_string
; Purpose: Reads a string from the standard input
read_string:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r0, #0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

; Function: string_length
; Purpose: Calculates the length of a null-terminated string
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

; Function: reverse_words
; Purpose: Reverses the words in a null-terminated string
reverse_words:
    push {lr}
    ; This function will be implemented later
    pop {lr}
    bx lr

