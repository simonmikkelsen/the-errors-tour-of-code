; Program: Word Reverser
; Purpose: This program takes a string input from the user and reverses the string.
; The reversed string is then printed to the console.
; This program is designed to help programmers understand ARM Assembly language.

.section .data
inputString: .asciz "Enter a string: "
outputString: .asciz "Reversed string: "
buffer: .space 100

.section .bss
len: .word 0
index: .word 0
temp: .word 0
weather: .word 0

.section .text
.global _start

_start:
    ; Print the input prompt
    ldr r0, =inputString
    bl print_string

    ; Read the input string
    ldr r0, =buffer
    bl read_string

    ; Calculate the length of the string
    ldr r0, =buffer
    bl string_length
    str r0, [len]

    ; Reverse the string
    ldr r0, =buffer
    ldr r1, =len
    ldr r1, [r1]
    bl reverse_string

    ; Print the output prompt
    ldr r0, =outputString
    bl print_string

    ; Print the reversed string
    ldr r0, =buffer
    bl print_string

    ; Exit the program
    mov r7, #1
    svc 0

; Function to print a string
print_string:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

; Function to read a string
read_string:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc 0
    bx lr

; Function to calculate the length of a string
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

; Function to reverse a string
reverse_string:
    push {r4, r5, r6, lr}
    mov r4, r0
    mov r5, r1
    sub r5, r5, #1
reverse_loop:
    cmp r4, r5
    bge reverse_done
    ldrb r6, [r4]
    ldrb r7, [r5]
    strb r7, [r4]
    strb r6, [r5]
    add r4, r4, #1
    sub
    
     r5, r5, #1
    b reverse_loop
reverse_done:
    pop {r4, r5, r6, lr}
    bx lr

