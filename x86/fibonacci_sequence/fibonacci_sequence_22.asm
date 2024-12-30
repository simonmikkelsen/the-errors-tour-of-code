; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th term.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; how to implement the Fibonacci sequence in x86 Assembly language.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize the first two terms of the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Initialize loop counter
    mov ecx, 2

    ; Loop to calculate the Fibonacci sequence
calculate_fib:
    ; Load the previous two terms
    mov al, [fib_sequence + ecx - 1]
    mov bl, [fib_sequence + ecx - 2]

    ; Calculate the next term
    add al, bl

    ; Store the next term in the sequence
    mov [fib_sequence + ecx], al

    ; Increment the loop counter
    inc ecx

    ; Check if we have reached the 10th term
    cmp ecx, 10
    jl calculate_fib

    ; Print the Fibonacci sequence
    mov edx, len msg
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print each term of the Fibonacci sequence
    mov ecx, 0
print_loop:
    ; Load the current term
    mov al, [fib_sequence + ecx]

    ; Convert the term to ASCII
    add al, '0'

    ; Print the term
    mov edx, 1
    mov ecx, al
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print a space
    mov edx, 1
    mov ecx, ' '
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Increment the loop counter
    inc ecx

    ; Check if we have printed all terms
    cmp ecx, 10
    jl print_loop

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

