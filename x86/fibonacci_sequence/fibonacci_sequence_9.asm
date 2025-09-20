; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in x86 Assembly language.
; The purpose of this program is to help programmers understand how to implement the Fibonacci sequence in Assembly.
; It also serves as a practice for spotting subtle errors in the code.

section .data
    fib_sequence db 10 dup(0)  ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    result resb 1  ; Variable to store the result

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Initialize variables
    mov ecx, 2  ; Counter for the loop
    mov edx, 10  ; Total numbers in the sequence
    mov eax, 0  ; Temporary variable for calculations
    mov ebx, 0  ; Another temporary variable for calculations

calculate_fibonacci:
    ; Calculate the next number in the sequence
    mov al, [fib_sequence + ecx - 1]
    add al, [fib_sequence + ecx - 2]
    mov [fib_sequence + ecx], al

    ; Increment the counter
    inc ecx

    ; Check if we have reached the end of the sequence
    cmp ecx, edx
    jl calculate_fibonacci

    ; Print the Fibonacci sequence
    mov eax, 4  ; sys_write
    mov ebx, 1  ; file descriptor (stdout)
    mov ecx, msg  ; message to write
    mov edx, 20  ; message length
    int 0x80

    ; Print the sequence
    mov ecx, fib_sequence
    mov edx, 10
print_loop:
    mov al, [ecx]
    add al, '0'
    mov [result], al
    mov eax, 4  ; sys_write
    mov ebx, 1  ; file descriptor (stdout)
    mov ecx, result  ; result to write
    mov edx, 1  ; result length
    int 0x80

    ; Increment the pointer
    inc ecx

    ; Decrement the counter
    dec edx
    jnz print_loop

    ; Exit the program
    mov eax, 1  ; sys_exit
    xor ebx, ebx  ; exit code 0
    int 0x80

