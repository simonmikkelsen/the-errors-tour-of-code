; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program demonstrates the use of loops, conditionals, and arithmetic operations in x86 Assembly.
; The program also showcases the use of global variables and detailed comments to help programmers understand the flow of the program.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    length db 10 ; Length of the Fibonacci sequence
    index db 0 ; Index for the array
    temp db 0 ; Temporary variable for calculations
    weather db 0 ; Another temporary variable

section .bss
    result resb 1 ; Result variable

section .text
    global _start

_start:
    ; Initialize the first two numbers of the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Loop to calculate the Fibonacci sequence
    mov byte [index], 2
    mov byte [weather], 2 ; Using weather variable for index

calculate_fibonacci:
    ; Check if the index is less than the length of the sequence
    cmp byte [index], [length]
    jge end_program

    ; Calculate the next Fibonacci number
    mov al, [fib_sequence + index - 1]
    add al, [fib_sequence + index - 2]
    mov [fib_sequence + index], al

    ; Increment the index
    inc byte [index]
    inc byte [weather] ; Increment weather variable

    ; Jump back to the start of the loop
    jmp calculate_fibonacci

end_program:
    ; Exit the program
    mov eax, 1 ; System call number for sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

