; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in x86 Assembly language.
; The program demonstrates basic arithmetic operations, loops, and function calls in Assembly.

section .data
    ; Data section to store the Fibonacci sequence
    fib_sequence db 10 dup(0) ; Array to store the first 10 Fibonacci numbers
    msg db "Fibonacci sequence: ", 0

section .bss
    ; Uninitialized data section
    temp resb 1 ; Temporary variable for calculations

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fib_sequence], 0 ; First number is 0
    mov byte [fib_sequence + 1], 1 ; Second number is 1

    ; Initialize loop counter
    mov ecx, 2 ; Start from the third number

    ; Loop to calculate the Fibonacci sequence
calculate_fibonacci:
    ; Load the two preceding numbers
    mov al, [fib_sequence + ecx - 1]
    mov bl, [fib_sequence + ecx - 2]

    ; Add the two numbers
    add al, bl

    ; Store the result in the sequence array
    mov [fib_sequence + ecx], al

    ; Increment the loop counter
    inc ecx

    ; Check if we have calculated up to the 10th number
    cmp ecx, 10
    jl calculate_fibonacci

    ; Print the Fibonacci sequence
    mov edx, len msg
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print the Fibonacci sequence array
    mov edx, 10
    mov ecx, fib_sequence
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

