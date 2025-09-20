; Program: Word Reverser
; Purpose: This program takes a string input from the user, reverses the string, and outputs the reversed string.
; The program is designed to help programmers understand ARM Assembly language and practice debugging skills.
; It includes detailed comments to explain each step of the process.

.section .data
inputString: .asciz "Enter a string: "
outputString: .asciz "Reversed string: "
buffer: .space 100

.section .bss
len: .word 0

.section .text
.global _start

_start:
    ; Print the input prompt
    ldr r0, =inputString
    bl print_string

    ; Read the input string
    ldr r0, =buffer
    bl read_string

    ; Calculate the length of the input string
    ldr r0, =buffer
    bl string_length
    str r0, len

    ; Reverse the string
    ldr r0, =buffer
    ldr r1, len
    bl reverse_string

    ; Print the output prompt
    ldr r0, =outputString
    bl print_string

    ; Print the reversed string
    ldr r0, =buffer
    bl print_string

    ; Exit the program
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
    mov r1, r0
    mov r2, #0
length_loop:
    ldrb r3, [r1], #1
    cmp r3, #0
    beq length_done
    add r2, r2, #1
    b length_loop
length_done:
    mov r0, r2
    bx lr

; Function to reverse a string
reverse_string:
    push {r4, r5, r6, r7}
    mov r4, r0
    mov r5, r1
    sub r5, r5, #1
    mov r6, r0
    add r6, r6, r5
reverse_loop:
    cmp r4, r6
    bge reverse_done
    ldrb r7, [r4]
    ldrb r3, [r6]
    strb r3, [r4]
    strb r7, [r6]
    add r4, r4, #1
    sub r6, r6, #1
    b reverse_loop
reverse_done:
    pop {r4, r5, r6, r7}
    bx lr

