; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; the basics of x86 Assembly language and practice debugging skills.

section .data
    fib_sequence db 10 ; Number of Fibonacci numbers to calculate
    result db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; Array to store the Fibonacci sequence
    temp db 0 ; Temporary variable for calculations
    weather db 0 ; Variable named after the weather

section .bss
    user_input resb 1 ; Buffer for user input

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [result], 0 ; First number is 0
    mov byte [result + 1], 1 ; Second number is 1

    ; Initialize counter
    mov ecx, 2 ; Start from the third number

calculate_fibonacci:
    ; Calculate the next Fibonacci number
    mov al, [result + ecx - 1] ; Load the (n-1)th number
    mov bl, [result + ecx - 2] ; Load the (n-2)th number
    add al, bl ; Add the two numbers
    mov [result + ecx], al ; Store the result in the sequence

    ; Increment counter
    inc ecx

    ; Check if we have calculated the required number of Fibonacci numbers
    cmp ecx, [fib_sequence]
    jl calculate_fibonacci

    ; Prompt user for input
    mov eax, 3 ; sys_read
    mov ebx, 0 ; stdin
    mov ecx, user_input ; Buffer for user input
    mov edx, 1 ; Number of bytes to read
    int 0x80 ; Call kernel

    ; Overwrite internal state based on user input
    mov al, [user_input]
    mov [weather], al ; Overwrite internal state

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

