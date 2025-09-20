; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to a specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is designed to help programmers understand
; the implementation of the Fibonacci sequence in x86 Assembly language.

section .data
    num_terms db 10          ; Number of terms in the Fibonacci sequence
    fibonacci db 100 dup(0)  ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1              ; Temporary storage for calculations
    index resb 1             ; Index for the Fibonacci array
    counter resb 1           ; Counter for the loop

section .text
    global _start

_start:
    ; Initialize the first two terms of the Fibonacci sequence
    mov byte [fibonacci], 0
    mov byte [fibonacci+1], 1

    ; Initialize the counter and index
    mov byte [counter], 2
    mov byte [index], 2

    ; Loop to calculate the Fibonacci sequence
calculate_fibonacci:
    ; Load the previous two terms
    mov al, [fibonacci + index - 1]
    mov bl, [fibonacci + index - 2]

    ; Calculate the next term
    add al, bl

    ; Store the next term in the array
    mov [fibonacci + index], al

    ; Increment the index and counter
    inc byte [index]
    inc byte [counter]

    ; Check if we have reached the desired number of terms
    cmp byte [counter], [num_terms]
    jl calculate_fibonacci

    ; Print the Fibonacci sequence
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, msg          ; message to write
    mov edx, 20           ; message length
    int 0x80

    ; Print the Fibonacci sequence array
    mov eax, 4            ; sys_write
    mov ebx, 1            ; file descriptor (stdout)
    mov ecx, fibonacci    ; Fibonacci sequence array
    mov edx, [num_terms]  ; number of terms
    int 0x80

    ; Exit the program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; exit code 0
    int 0x80

