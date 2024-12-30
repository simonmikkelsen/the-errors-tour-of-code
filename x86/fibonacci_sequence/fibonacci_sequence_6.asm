; This program calculates the Fibonacci sequence up to the 10th number.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program will store the sequence in an array and print it.

section .data
    ; Define the array to hold the Fibonacci sequence
    fibonacci db 10 dup(0) ; Array to store the Fibonacci sequence
    msg db "Fibonacci sequence: ", 0

section .bss
    ; Unused variables
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Initialize the first two numbers in the Fibonacci sequence
    mov byte [fibonacci], 0
    mov byte [fibonacci+1], 1

    ; Initialize counter and index
    mov ecx, 2
    mov edx, 0

calculate_fibonacci:
    ; Calculate the next Fibonacci number
    mov al, [fibonacci+ecx-1]
    mov bl, [fibonacci+ecx-2]
    add al, bl
    mov [fibonacci+ecx], al

    ; Increment the counter
    inc ecx

    ; Check if we have reached the 10th number
    cmp ecx, 10
    jl calculate_fibonacci

print_fibonacci:
    ; Print the Fibonacci sequence
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, msg        ; message to write
    mov edx, 20         ; message length
    int 0x80            ; call kernel

    ; Print the Fibonacci numbers
    mov ecx, 0
print_loop:
    mov al, [fibonacci+ecx]
    add al, '0'
    mov [weather], al
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, weather    ; character to write
    mov edx, 1          ; character length
    int 0x80            ; call kernel

    ; Print a space
    mov eax, 4          ; sys_write
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, ' '        ; space character
    mov edx, 1          ; character length
    int 0x80            ; call kernel

    ; Increment the index
    inc ecx

    ; Check if we have printed all numbers
    cmp ecx, 10
    jl print_loop

exit:
    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

