; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in x86 Assembly language.
; It demonstrates basic arithmetic operations, loops, and the use of registers.

section .data
    fib_sequence db 10 dup(0)  ; Array to store the Fibonacci sequence
    weather db 0               ; Variable to store the current weather (not used)
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1                ; Temporary variable for calculations

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Initialize counter and index
    mov ecx, 2                 ; Counter for the loop (starts from 2)
    mov ebx, 0                 ; Index for the array

    ; Loop to calculate the Fibonacci sequence
calculate_fibonacci:
    mov al, [fib_sequence + ecx - 1]  ; Load the (n-1)th number
    mov bl, [fib_sequence + ecx - 2]  ; Load the (n-2)th number
    add al, bl                        ; Calculate the nth number
    mov [fib_sequence + ecx], al      ; Store the nth number in the array

    ; Increment the counter
    inc ecx
    cmp ecx, 10                       ; Check if we have reached the 10th number
    jl calculate_fibonacci            ; If not, repeat the loop

    ; Print the Fibonacci sequence
    mov edx, len msg                  ; Length of the message
    mov ecx, msg                      ; Message to write
    mov ebx, 1                        ; File descriptor (stdout)
    mov eax, 4                        ; System call number (sys_write)
    int 0x80                          ; Call kernel

    ; Exit the program
    mov eax, 1                        ; System call number (sys_exit)
    xor ebx, ebx                      ; Exit code 0
    int 0x80                          ; Call kernel





