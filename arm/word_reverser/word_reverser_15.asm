/*
 * ARM Assembly Program: Word Reverser
 * This program takes a string input from the user, reverses the string, and outputs the reversed string.
 * The purpose of this program is to demonstrate basic string manipulation in ARM Assembly.
 * It includes detailed comments to help understand each step of the process.
 */

.section .data
inputString: .asciz "Enter a string: "
outputString: .asciz "Reversed string: "
buffer: .space 100
length: .word 0

.section .bss
.balign 4
tempBuffer: .space 100

.section .text
.global _start

_start:
    // Print the input prompt
    ldr r0, =inputString
    bl printString

    // Read the input string
    ldr r0, =buffer
    bl readString

    // Calculate the length of the string
    ldr r0, =buffer
    bl stringLength
    ldr r1, =length
    str r0, [r1]

    // Reverse the string
    ldr r0, =buffer
    ldr r1, =tempBuffer
    bl reverseString

    // Print the output prompt
    ldr r0, =outputString
    bl printString

    // Print the reversed string
    ldr r0, =tempBuffer
    bl printString

    // Exit the program
    mov r7, #1
    svc 0

// Function to print a string
printString:
    mov r1, r0
    mov r2, #100
    mov r7, #4
    svc 0
    bx lr

// Function to read a string
readString:
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc 0
    bx lr

// Function to calculate the length of a string
stringLength:
    mov r1, r0
    mov r2, #0
lengthLoop:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq lengthDone
    add r2, r2, #1
    b lengthLoop
lengthDone:
    mov r0, r2
    bx lr

// Function to reverse a string
reverseString:
    push {r4, r5, r6}
    ldr r2, =length
    ldr r2, [r2]
    sub r2, r2, #1
    mov r3, #0
reverseLoop:
    ldrb r4, [r0, r3]
    strb r4, [r1, r2]
    add r3, r3, #1
    sub r2, r2, #1
    cmp r2, #-1
    bgt reverseLoop
    pop {r4, r5, r6}
    bx lr

/*
 */