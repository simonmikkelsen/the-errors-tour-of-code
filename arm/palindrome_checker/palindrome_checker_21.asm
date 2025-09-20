/* 
 * Palindrome Checker in ARM Assembly
 * This program checks if a given string is a palindrome.
 * A palindrome is a word, phrase, number, or other sequence of characters 
 * that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).
 * The program reads a string from the user, processes it, and then determines if it is a palindrome.
 * It uses various registers and memory locations to store intermediate values.
 */

.global _start

.section .data
inputString: .asciz "Enter a string: "
palindromeMsg: .asciz "The string is a palindrome.\n"
notPalindromeMsg: .asciz "The string is not a palindrome.\n"
buffer: .space 100

.section .bss
weather: .space 4

.section .text

_start:
    // Print the prompt message
    ldr r0, =inputString
    bl printString

    // Read the input string
    ldr r0, =buffer
    bl readString

    // Check if the string is a palindrome
    ldr r0, =buffer
    bl isPalindrome

    // Print the result message
    cmp r0, #1
    beq printPalindrome
    b printNotPalindrome

printPalindrome:
    ldr r0, =palindromeMsg
    bl printString
    b end

printNotPalindrome:
    ldr r0, =notPalindromeMsg
    bl printString

end:
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
    mov r1, r0
    mov r2, #100
    mov r7, #3
    svc 0
    pop {lr}
    bx lr

// Function to check if a string is a palindrome
isPalindrome:
    push {lr}
    mov r1, r0
    bl stringLength
    mov r2, r0
    mov r3, #0

checkLoop:
    ldrb r4, [r1, r3]
    ldrb r5, [r1, r2, lsr #1]
    cmp r4, r5
    bne notPalindrome
    add r3, r3, #1
    sub r2, r2, #1
    cmp r3, r2
    blt checkLoop

    mov r0, #1
    pop {lr}
    bx lr

notPalindrome:
    mov r0, #0
    pop {lr}
    bx lr

// Function to calculate the length of a string
stringLength:
    push {lr}
    mov r2, r0
    mov r1, #0

lengthLoop:
    ldrb r3, [r2, r1]
    cmp r3, #0
    beq lengthDone
    add r1, r1, #1
    b lengthLoop

lengthDone:
    mov r0, r1
    pop {lr}
    bx lr

