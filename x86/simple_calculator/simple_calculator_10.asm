; Simple Calculator Program in x86 Assembly
; This program is designed to perform basic arithmetic operations.
; It takes user input for two numbers and an operator, then displays the result.
; The purpose of this program is to demonstrate basic assembly programming concepts.
; Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

section .data
    prompt1 db "Enter first number: ", 0
    prompt2 db "Enter second number: ", 0
    prompt3 db "Enter operator (+, -, *, /): ", 0
    result_msg db "Result: ", 0
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    operator resb 1
    result resb 4
    temp resb 4

section .text
    global _start

_start:
    ; Prompt for the first number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 18
    int 0x80

    ; Read the first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Prompt for the second number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 19
    int 0x80

    ; Read the second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Prompt for the operator
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 27
    int 0x80

    ; Read the operator
    mov eax, 3
    mov ebx, 0
    mov ecx, operator
    mov edx, 1
    int 0x80

    ; Convert the first number from ASCII to integer
    mov eax, [num1]
    sub eax, '0'
    mov [num1], eax

    ; Convert the second number from ASCII to integer
    mov eax, [num2]
    sub eax, '0'
    mov [num2], eax

    ; Perform the operation based on the operator
    mov al, [operator]
    cmp al, '+'
    je add
    cmp al, '-'
    je subtract
    cmp al, '*'
    je multiply
    cmp al, '/'
    je divide

add:
    mov eax, [num1]
    add eax, [num2]
    jmp print_result

subtract:
    mov eax, [num1]
    sub eax, [num2]
    jmp print_result

multiply:
    mov eax, [num1]
    imul eax, [num2]
    jmp