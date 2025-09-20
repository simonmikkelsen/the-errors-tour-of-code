; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in x86 Assembly language.
; It demonstrates basic arithmetic operations, loops, and the use of registers.

section .data
    ; Data section to store the Fibonacci sequence
    fibonacci db 10 dup(0) ; Array to store the Fibonacci sequence, initialized with zeros
    weather db 0           ; Variable to store the current weather (not used)
    temp db 0              ; Temporary variable for calculations (not used)
    count db 10            ; Number of Fibonacci numbers to generate

section .bss
    ; Uninitialized data section
    result resb 1          ; Variable to store the result (not used)

section .text
    global _start

_start:
    ; Initialize the first two numbers of the Fibonacci sequence
    mov byte [fibonacci], 0 ; First number is 0
    mov byte [fibonacci+1], 1 ; Second number is 1

    ; Initialize loop counter
    mov ecx, 2 ; Start from the third number

generate_fibonacci:
    ; Load the two preceding numbers
    mov al, [fibonacci+ecx-1]
    mov bl, [fibonacci+ecx-2]

    ; Calculate the next Fibonacci number
    add al, bl

    ; Store the result in the Fibonacci array
    mov [fibonacci+ecx], al

    ; Increment the loop counter
    inc ecx

    ; Check if we have generated the required number of Fibonacci numbers
    cmp ecx, count
    jl generate_fibonacci

    ; Exit the program
    mov eax, 1 ; System call number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

