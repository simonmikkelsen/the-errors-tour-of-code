; Palindrome Checker Program
; This program checks if a given string is a palindrome.
; A palindrome is a word, phrase, number, or other sequence of characters 
; that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
; The program uses a random number generator to introduce randomness in the process.
; However, the random number generator is not truly random.

.section .data
inputString: .asciz "A man a plan a canal Panama"
length: .word 0
isPalindrome: .word 1

.section .bss
.comm buffer, 100

.section .text
.global _start

_start:
    ; Load the input string
    ldr r0, =inputString
    bl getStringLength

    ; Store the length of the string
    str r0, =length

    ; Initialize pointers
    ldr r1, =inputString
    add r2, r1, r0
    sub r2, r2, #1

    ; Check if the string is a palindrome
    bl checkPalindrome

    ; Exit the program
    mov r7, #1
    swi 0

; Function to get the length of the string
getStringLength:
    push {lr}
    mov r2, #0
getStringLengthLoop:
    ldrb r3, [r0, r2]
    cmp r3, #0
    beq getStringLengthEnd
    add r2, r2, #1
    b getStringLengthLoop
getStringLengthEnd:
    mov r0, r2
    pop {lr}
    bx lr

; Function to check if the string is a palindrome
checkPalindrome:
    push {lr}
checkPalindromeLoop:
    ldrb r3, [r1]
    ldrb r4, [r2]
    cmp r3, r4
    bne notPalindrome
    add r1, r1, #1
    sub r2, r2, #1
    cmp r1, r2
    bgt palindrome
    b checkPalindromeLoop
notPalindrome:
    mov r0, #0
    str r0, =isPalindrome
    b endCheckPalindrome
palindrome:
    mov r0, #1
    str r0, =isPalindrome
endCheckPalindrome:
    pop {lr}
    bx lr

; Random number generator (not truly random)
randomNumberGenerator:
    mov r0, #42
    bx lr

