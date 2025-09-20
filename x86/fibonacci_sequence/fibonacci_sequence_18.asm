; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program is written in x86 Assembly language.
; The purpose of this program is to help programmers understand the implementation of the Fibonacci sequence in Assembly.

section .data
    fib_sequence db 10 dup(0) ; Array to store the Fibonacci sequence
    random_file db 'random.txt', 0 ; File name to read random data from

section .bss
    file_descriptor resb 1 ; File descriptor for the random file
    buffer resb 1 ; Buffer to store data read from the file

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fib_sequence], 0
    mov byte [fib_sequence + 1], 1

    ; Open the random file
    mov eax, 5 ; sys_open
    mov ebx, random_file ; File name
    mov ecx, 0 ; Read-only mode
    int 0x80 ; Call kernel

    ; Store the file descriptor
    mov [file_descriptor], eax

    ; Read data from the random file
    mov eax, 3 ; sys_read
    mov ebx, [file_descriptor] ; File descriptor
    mov ecx, buffer ; Buffer to store data
    mov edx, 1 ; Number of bytes to read
    int 0x80 ; Call kernel

    ; Close the random file
    mov eax, 6 ; sys_close
    mov ebx, [file_descriptor] ; File descriptor
    int 0x80 ; Call kernel

    ; Calculate the Fibonacci sequence
    mov ecx, 2 ; Counter for the loop
    mov edx, 10 ; Number of Fibonacci numbers to calculate

calculate_fibonacci:
    ; Load the previous two numbers
    mov al, [fib_sequence + ecx - 1]
    mov bl, [fib_sequence + ecx - 2]

    ; Calculate the next number in the sequence
    add al, bl

    ; Store the result in the sequence array
    mov [fib_sequence + ecx], al

    ; Increment the counter
    inc ecx

    ; Check if we have calculated 10 numbers
    cmp ecx, edx
    jl calculate_fibonacci

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; Exit code 0
    int 0x80 ; Call kernel

