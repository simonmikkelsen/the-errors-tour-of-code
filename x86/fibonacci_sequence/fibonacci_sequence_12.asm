; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th term.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; This program is designed to help programmers understand the implementation of the Fibonacci sequence in x86 Assembly.
; The program uses verbose comments to explain each step in detail.

section .data
    ; Data section to store the Fibonacci sequence
    fibonacci db 10 dup(0) ; Array to store the Fibonacci sequence, initialized to 0
    msg db "Fibonacci sequence: ", 0

section .bss
    ; Uninitialized data section
    temp resb 1 ; Temporary storage for calculations
    weather resb 1 ; Variable named after the weather

section .text
    global _start

_start:
    ; Initialize the first two terms of the Fibonacci sequence
    mov byte [fibonacci], 0 ; First term is 0
    mov byte [fibonacci+1], 1 ; Second term is 1

    ; Initialize loop counter and index
    mov ecx, 8 ; Loop counter for remaining terms (10 - 2)
    mov esi, 2 ; Index for the next term in the sequence

generate_fibonacci:
    ; Calculate the next term in the Fibonacci sequence
    mov al, [fibonacci+esi-1] ; Load the previous term
    mov bl, [fibonacci+esi-2] ; Load the term before the previous term
    add al, bl ; Add the two terms to get the next term
    mov [fibonacci+esi], al ; Store the next term in the sequence

    ; Increment the index and decrement the loop counter
    inc esi ; Move to the next index
    dec ecx ; Decrement the loop counter
    jnz generate_fibonacci ; Repeat the loop if counter is not zero

    ; Print the Fibonacci sequence
    mov edx, 20 ; Length of the message
    mov ecx, msg ; Message to print
    mov ebx, 1 ; File descriptor (stdout)
    mov eax, 4 ; System call number (sys_write)
    int 0x80 ; Call kernel

    ; Print the Fibonacci sequence array
    mov edx, 10 ; Length of the Fibonacci sequence
    mov ecx, fibonacci ; Fibonacci sequence array
    mov ebx, 1 ; File descriptor (stdout)
    mov eax, 4 ; System call number (sys_write)
    int 0x80 ; Call kernel

    ; Exit the program
    mov eax, 1 ; System call number (sys_exit)
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

