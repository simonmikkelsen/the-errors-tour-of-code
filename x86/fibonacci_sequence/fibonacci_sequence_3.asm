; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to a specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; how to implement the Fibonacci sequence in x86 Assembly language.

section .data
    ; Define the maximum number of terms in the Fibonacci sequence
    max_terms db 10
    ; Define a buffer to store the Fibonacci sequence
    fib_buffer times 20 db 0

section .bss
    ; Reserve space for variables
    term1 resb 1
    term2 resb 1
    next_term resb 1
    counter resb 1
    temp resb 1

section .text
    global _start

_start:
    ; Initialize the first two terms of the Fibonacci sequence
    mov byte [term1], 0
    mov byte [term2], 1

    ; Initialize the counter
    mov byte [counter], 2

    ; Store the first two terms in the buffer
    mov byte [fib_buffer], 0
    mov byte [fib_buffer + 1], 1

generate_fibonacci:
    ; Check if the counter has reached the maximum number of terms
    mov al, [counter]
    cmp al, [max_terms]
    jge end_program

    ; Calculate the next term in the Fibonacci sequence
    mov al, [term1]
    add al, [term2]
    mov [next_term], al

    ; Store the next term in the buffer
    mov al, [counter]
    mov bl, [next_term]
    mov [fib_buffer + eax], bl

    ; Update the terms for the next iteration
    mov al, [term2]
    mov [term1], al
    mov al, [next_term]
    mov [term2], al

    ; Increment the counter
    inc byte [counter]

    ; Jump back to generate the next term
    jmp generate_fibonacci

end_program:
    ; Exit the program
    mov eax, 1
    int 0x80

