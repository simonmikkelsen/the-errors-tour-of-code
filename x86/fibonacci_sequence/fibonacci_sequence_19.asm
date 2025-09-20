; This program calculates the Fibonacci sequence up to a user-specified number of terms.
; The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
; The sequence starts with 0 and 1. This program will prompt the user for the number of terms to calculate.
; It will then output the Fibonacci sequence up to that number of terms.

section .data
    prompt db "Enter the number of terms: ", 0
    input db 0
    newline db 10, 0

section .bss
    num resb 4
    fib1 resb 4
    fib2 resb 4
    temp resb 4
    counter resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 24
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert input to integer
    mov eax, [num]
    sub eax, '0'
    mov [num], eax

    ; Initialize Fibonacci variables
    mov dword [fib1], 0
    mov dword [fib2], 1
    mov dword [counter], 2

    ; Print the first Fibonacci number
    call print_fib1

    ; Print the second Fibonacci number
    call print_fib2

    ; Calculate and print the rest of the Fibonacci sequence
    mov ecx, [num]
    sub ecx, 2
    jle end_program

fib_loop:
    ; Calculate next Fibonacci number
    mov eax, [fib1]
    add eax, [fib2]
    mov [temp], eax

    ; Print the next Fibonacci number
    call print_temp

    ; Update Fibonacci variables
    mov eax, [fib2]
    mov [fib1], eax
    mov eax, [temp]
    mov [fib2], eax

    ; Decrement counter and loop if not done
    dec ecx
    jnz fib_loop

end_program:
    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_fib1:
    ; Print the first Fibonacci number (0)
    mov eax, [fib1]
    add eax, '0'
    mov [input], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 1
    int 0x80
    ret

print_fib2:
    ; Print the second Fibonacci number (1)
    mov eax, [fib2]
    add eax, '0'
    mov [input], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 1
    int 0x80
    ret

print_temp:
    ; Print the next Fibonacci number
    mov eax, [temp]
    add eax, '0'
    mov [input], eax
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 1
    int 0x80
    ret







