; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; This program is written in x86 Assembly language and is intended to help programmers understand
; the implementation of loops, arithmetic operations, and memory management in Assembly.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1 ; Temporary storage for calculations

section .text
    global _start

_start:
    ; Initialize the first two numbers of the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Initialize loop counter
    mov ecx, 8 ; We already have the first two numbers

    ; Initialize pointers
    mov esi, fib_sequence
    add esi, 2 ; Point to the third element

generate_fibonacci:
    ; Load the two preceding numbers
    mov al, [esi - 2]
    mov bl, [esi - 1]

    ; Calculate the next Fibonacci number
    add al, bl

    ; Store the result in the sequence
    mov [esi], al

    ; Increment the pointer
    inc esi

    ; Decrement the loop counter
    loop generate_fibonacci

    ; Print the Fibonacci sequence
    mov edx, 20 ; Length of the message
    mov ecx, msg ; Message to write
    mov ebx, 1 ; File descriptor (stdout)
    mov eax, 4 ; System call number (sys_write)
    int 0x80 ; Call kernel

    ; Print the Fibonacci sequence numbers
    mov ecx, fib_sequence
    mov edx, 10 ; Number of bytes to write
    mov ebx, 1 ; File descriptor (stdout)
    mov eax, 4 ; System call number (sys_write)
    int 0x80 ; Call kernel

    ; Exit the program
    mov eax, 1 ; System call number (sys_exit)
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

