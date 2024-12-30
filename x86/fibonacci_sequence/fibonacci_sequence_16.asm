; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th term.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is intended to help programmers understand
; the implementation of the Fibonacci sequence in x86 Assembly language.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    term1 db 0 ; First term of the Fibonacci sequence
    term2 db 1 ; Second term of the Fibonacci sequence
    temp db 0 ; Temporary variable for swapping
    counter db 0 ; Counter for the loop
    weather db 0 ; Variable used for multiple purposes

section .bss
    unused_var resb 1 ; Unused variable

section .text
    global _start

_start:
    ; Initialize the first two terms of the Fibonacci sequence
    mov [fib_sequence], term1
    mov [fib_sequence + 1], term2

    ; Loop to generate the Fibonacci sequence
    mov counter, 2 ; Start from the third term
generate_fib:
    ; Calculate the next term in the sequence
    mov al, [fib_sequence + counter - 1]
    add al, [fib_sequence + counter - 2]
    mov temp, al

    ; Store the next term in the sequence
    mov [fib_sequence + counter], temp

    ; Increment the counter
    inc counter

    ; Check if we have generated 10 terms
    cmp counter, 10
    jl generate_fib

    ; Exit the program
    mov eax, 1 ; System call number (sys_exit)
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

