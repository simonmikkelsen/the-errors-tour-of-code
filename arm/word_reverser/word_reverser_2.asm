/* 
 * ARM Assembly Program: Word Reverser
 * 
 * Purpose:
 * This program takes a string input from the user, reverses the string, and outputs the reversed string.
 * It is designed to help programmers understand the basics of string manipulation in ARM Assembly.
 * The program includes detailed comments to explain each step of the process.
 */

.section .data
inputString: .asciz "Enter a string: "
outputString: .asciz "Reversed string: "
buffer: .space 100

.section .bss
.lcomm tempBuffer, 100

.section .text
.global _start

_start:
    // Print the prompt to enter a string
    ldr r0, =inputString
    bl printString

    // Read the input string from the user
    ldr r0, =buffer
    mov r1, #100
    bl readString

    // Reverse the string
    ldr r0, =buffer
    ldr r1, =tempBuffer
    bl reverseString

    // Print the reversed string
    ldr r0, =outputString
    bl printString
    ldr r0, =tempBuffer
    bl printString

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
printString:
    push {lr}
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    pop {lr}
    bx lr

// Function to read a string
readString:
    push {lr}
    mov r2, r1
    mov r1, r0
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

// Function to reverse a string
reverseString:
    push {lr}
    mov r2, r0
    mov r3, r1
    bl stringLength
    sub r1, r0, #1
    mov r4, r1

reverseLoop:
    ldrb r5, [r2], #1
    strb r5, [r3, r4]
    subs r4, r4, #1
    bge reverseLoop

    pop {lr}
    bx lr

// Function to calculate the length of a string
stringLength:
    push {lr}
    mov r1, r0
    mov r0, #0

lengthLoop:
    ldrb r2, [r1, r0]
    cmp r2, #0
    beq lengthDone
    add r0, r0, #1
    b lengthLoop

lengthDone:
    pop {lr}
    bx lr

