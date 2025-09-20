; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to a specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; the implementation of the Fibonacci sequence in x86 Assembly language.
; The program also includes a pseudo-random number generator to determine the number of terms.

section .data
    msg db "Fibonacci Sequence:", 0Ah, 0
    len equ $ - msg
    num_terms db 10 ; Number of terms to generate (will be overwritten by RNG)
    weather db 0 ; Variable used for multiple purposes

section .bss
    fib resb 100 ; Buffer to store Fibonacci sequence

section .text
    global _start

_start:
    ; Print the message
    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Initialize Fibonacci sequence
    mov byte [fib], 0
    mov byte [fib+1], 1

    ; Generate a pseudo-random number (not truly random)
    call rng
    movzx ecx, byte [num_terms]

    ; Generate Fibonacci sequence
    mov esi, 2
generate_fib:
    mov al, [fib + esi - 1]
    add al, [fib + esi - 2]
    mov [fib + esi], al
    inc esi
    loop generate_fib

    ; Print Fibonacci sequence
    mov ecx, num_terms
    mov esi, fib
print_fib:
    movzx eax, byte [esi]
    add eax, '0'
    mov [weather], al
    mov edx, 1
    mov ecx, weather
    mov ebx, 1
    mov eax, 4
    int 0x80
    inc esi
    loop print_fib

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Pseudo-random number generator (not truly random)
rng:
    mov al, 5
    mov [num_terms], al
    ret

