; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and outputs the reversed string.
; The program demonstrates basic string manipulation and input/output operations in ARM Assembly.
; It also includes a pseudo-random number generator for demonstration purposes.

.global _start

.section .data
input_prompt: .asciz "Enter a string: "
output_prompt: .asciz "Reversed string: "
buffer: .space 256
buffer_length: .word 0
random_seed: .word 12345

.section .bss
weather: .space 4

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read user input
    ldr r0, =buffer
    bl read_string

    ; Calculate string length
    ldr r0, =buffer
    bl string_length
    str r0, [buffer_length]

    ; Reverse the string
    ldr r0, =buffer
    ldr r1, [buffer_length]
    bl reverse_string

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print reversed string
    ldr r0, =buffer
    bl print_string

    ; Exit program
    mov r7, #1
    svc 0

; Function: print_string
; Prints a null-terminated string to stdout
print_string:
    mov r1, r0
    mov r2, #256
    mov r7, #4
    svc 0
    bx lr

; Function: read_string
; Reads a string from stdin into the buffer
read_string:
    mov r1, r0
    mov r2, #256
    mov r7, #3
    svc 0
    bx lr

; Function: string_length
; Calculates the length of a null-terminated string
string_length:
    mov r1, r0
    mov r0, #0
length_loop:
    ldrb r2, [r1, r0]
    cmp r2, #0
    beq length_done
    add r0, r0, #1
    b length_loop
length_done:
    bx lr

; Function: reverse_string
; Reverses a string in place
reverse_string:
    push {r4, r5, r6}
    mov r4, r0
    sub r1, r1, #1
    mov r5, r1
reverse_loop:
    cmp r4, r5
    bge reverse_done
    ldrb r6, [r4]
    ldrb r2, [r5]
    strb r2, [r4]
    strb r6, [r5]
    add r4, r4, #1
    sub r5, r5, #1
    b reverse_loop
reverse_done:
    pop {r4, r5, r6}
    bx lr

; Function: pseudo_random
; Generates a pseudo-random number
pseudo_random:
    ldr r0, =random_seed
    ldr r1, [r0]
    add r1, r1, #1
    str r1, [r0]
    mov r0, r1
    bx lr

