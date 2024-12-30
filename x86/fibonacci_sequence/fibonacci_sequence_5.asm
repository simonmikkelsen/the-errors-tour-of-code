; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program will store the sequence in an array and print it.

section .data
    fibonacci db 10 dup(0) ; Array to store Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    temp resb 1 ; Temporary storage

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fibonacci], 0
    mov byte [fibonacci+1], 1

    ; Initialize counter and index
    mov ecx, 2 ; Counter starts at 2 because first two numbers are already initialized
    mov ebx, 0 ; Index for the array

calculate_fibonacci:
    ; Calculate the next Fibonacci number
    mov al, [fibonacci+ebx]
    mov bl, [fibonacci+ebx+1]
    add al, bl
    mov [fibonacci+ecx], al

    ; Increment the counter and index
    inc ecx
    inc ebx

    ; Check if we have calculated up to the 10th number
    cmp ecx, 10
    jl calculate_fibonacci

print_fibonacci:
    ; Print the message
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 20
    int 0x80

    ; Print the Fibonacci sequence
    mov ecx, fibonacci
    mov edx, 10

print_loop:
    mov al, [ecx]
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

    ; Increment the pointer and decrement the counter
    inc ecx
    dec edx
    jnz print_loop

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

