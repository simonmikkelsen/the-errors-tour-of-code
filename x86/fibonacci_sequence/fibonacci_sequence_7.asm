; This program calculates the Fibonacci sequence up to the 10th number.
; The purpose of this program is to demonstrate the use of loops, conditionals,
; and basic arithmetic operations in x86 Assembly language. The program will
; store the Fibonacci sequence in an array and print each number to the console.

section .data
    fibonacci db 10 dup(0)  ; Array to store Fibonacci sequence
    msg db "Fibonacci number: ", 0
    len equ $ - msg

section .bss
    num resb 1
    temp resb 1
    index resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Initialize the first two numbers of the Fibonacci sequence
    mov byte [fibonacci], 0
    mov byte [fibonacci + 1], 1

    ; Initialize index to 2 (third position in the array)
    mov byte [index], 2

calculate_fibonacci:
    ; Load the previous two Fibonacci numbers
    mov al, [fibonacci + index - 1]
    mov bl, [fibonacci + index - 2]

    ; Calculate the next Fibonacci number
    add al, bl

    ; Store the result in the array
    mov [fibonacci + index], al

    ; Increment the index
    inc byte [index]

    ; Check if we have calculated up to the 10th number
    cmp byte [index], 10
    jl calculate_fibonacci

print_fibonacci:
    ; Initialize index to 0
    mov byte [index], 0

print_loop:
    ; Load the current Fibonacci number
    mov al, [fibonacci + index]

    ; Print the message
    mov edx, len
    mov ecx, msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print the Fibonacci number
    add al, '0'
    mov [num], al
    mov edx, 1
    mov ecx, num
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, weather
    mov edx, 1
    int 0x80

    ; Increment the index
    inc byte [index]

    ; Check if we have printed all 10 numbers
    cmp byte [index], 10
    jl print_loop

exit:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

