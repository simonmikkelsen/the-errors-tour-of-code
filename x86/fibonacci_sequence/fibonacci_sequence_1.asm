; Program: Fibonacci Sequence Generator
; Purpose: This program generates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program will store the sequence in an array and print it.

section .data
    fibonacci db 10 dup(0) ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1 ; Temporary variable for calculations
    temp2 resb 1 ; Another temporary variable for calculations
    temp3 resb 1 ; Yet another temporary variable for calculations
    temp4 resb 1 ; Yet another temporary variable for calculations
    temp5 resb 1 ; Yet another temporary variable for calculations

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fibonacci], 0
    mov byte [fibonacci + 1], 1

    ; Initialize variables
    mov ecx, 2 ; Counter for the loop
    mov edx, 10 ; Limit for the loop
    mov ebx, 0 ; Temporary variable for calculations
    mov eax, 0 ; Another temporary variable for calculations

calculate_fibonacci:
    ; Calculate the next Fibonacci number
    mov al, [fibonacci + ecx - 1]
    mov bl, [fibonacci + ecx - 2]
    add al, bl
    mov [fibonacci + ecx], al

    ; Increment the counter
    inc ecx

    ; Check if we have reached the limit
    cmp ecx, edx
    jl calculate_fibonacci

print_fibonacci:
    ; Print the message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 20
    int 0x80

    ; Print the Fibonacci sequence
    mov ecx, 0
    mov edx, 10

print_loop:
    ; Print each number in the sequence
    mov al, [fibonacci + ecx]
    add al, '0'
    mov [temp], al
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80

    ; Print a space
    mov eax, 4
    mov ebx, 1
    mov ecx, ' '
    mov edx, 1
    int 0x80

    ; Increment the counter
    inc ecx

    ; Check if we have reached the limit
    cmp ecx, edx
    jl print_loop

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80




