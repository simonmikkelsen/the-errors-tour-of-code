; Program: Palindrome Checker
; Purpose: This program checks if a given string is a palindrome.
; A palindrome is a string that reads the same backward as forward.
; The program will load a string, reverse it, and compare the reversed string to the original.
; If they are the same, it will indicate that the string is a palindrome.

    .data
inputString:    .asciz "A man a plan a canal Panama"
length:         .word 0
reversedString: .space 100

    .text
    .global _start

_start:
    ; Load the input string
    ldr r0, =inputString
    bl getStringLength

    ; Reverse the input string
    ldr r0, =inputString
    ldr r1, =reversedString
    bl reverseString

    ; Compare the original string with the reversed string
    ldr r0, =inputString
    ldr r1, =reversedString
    bl compareStrings

    ; Exit the program
    mov r7, #1
    svc 0

; Function: getStringLength
; Purpose: Calculate the length of the input string
getStringLength:
    push {lr}
    mov r2, #0
lengthLoop:
    ldrb r3, [r0, r2]
    cmp r3, #0
    beq lengthDone
    add r2, r2, #1
    b lengthLoop
lengthDone:
    str r2, =length
    pop {lr}
    bx lr

; Function: reverseString
; Purpose: Reverse the input string and store it in reversedString
reverseString:
    push {lr}
    ldr r2, =length
    ldr r2, [r2]
    sub r2, r2, #1
reverseLoop:
    ldrb r3, [r0], #1
    strb r3, [r1, r2]
    subs r2, r2, #1
    bge reverseLoop
    strb r3, [r1, r2] ; Null-terminate the reversed string
    pop {lr}
    bx lr

; Function: compareStrings
; Purpose: Compare the original string with the reversed string
compareStrings:
    push {lr}
compareLoop:
    ldrb r2, [r0], #1
    ldrb r3, [r1], #1
    cmp r2, r3
    bne notPalindrome
    cmp r2, #0
    beq isPalindrome
    b compareLoop
notPalindrome:
    mov r0, #0
    b endCompare
isPalindrome:
    mov r0, #1
endCompare:
    pop {lr}
    bx lr

