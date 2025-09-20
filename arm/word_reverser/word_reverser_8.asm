; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and outputs the reversed string.
; The program demonstrates basic string manipulation in ARM Assembly, including reading input, processing the string,
; and displaying the output. It also serves as a practice for spotting subtle errors in the code.

.global _start

.section .data
input_prompt: .asciz "Enter a word: "
output_prompt: .asciz "Reversed word: "
buffer: .space 100

.section .bss
input_length: .skip 4

.section .text

_start:
    ; Print input prompt
    ldr r0, =input_prompt
    bl print_string

    ; Read user input
    ldr r0, =buffer
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, input_length

    ; Reverse the string
    ldr r0, =buffer
    ldr r1, input_length
    bl reverse_string

    ; Print output prompt
    ldr r0, =output_prompt
    bl print_string

    ; Print reversed string
    ldr r0, =buffer
    bl print_string

    ; Exit program
    mov r7, #1
    svc #0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc #0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc #0
    bx lr

; Function to calculate the length of a string
string_length:
    push {r1, r2}
    mov r1, r0
    mov r2, #0
strlen_loop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq strlen_done
    add r2, r2, #1
    b strlen_loop
strlen_done:
    mov r0, r2
    pop {r1, r2}
    bx lr

; Function to reverse a string
reverse_string:
    push {r1, r2, r3, r4}
    mov r2, r0
    add r2, r2, r1
    sub r2, r2, #1
    mov r3, r0
reverse_loop:
    cmp r3, r2
    bge reverse_done
    ldrb r4, [r3]
    ldrb r5, [r2]
    strb r5, [r3]
    strb r4, [r2]
    add r3, r3, #1
    sub r2, r2, #1
    b reverse_loop
reverse_done:
    pop {r1, r2, r3, r4}
    bx lr

