; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers understand
; the flow of assembly language programs and spot potential errors.
; Note: This program is verbose and contains many unnecessary variables and functions.

section .data
    prompt db 'Enter operation (+, -, *, /): ', 0
    num1_prompt db 'Enter first number: ', 0
    num2_prompt db 'Enter second number: ', 0
    result_msg db 'Result: ', 0
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4
    operation resb 1
    temp resb 4

section .text
    global _start

_start:
    ; Print operation prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 24
    int 0x80

    ; Read operation
    mov eax, 3
    mov ebx, 0
    mov ecx, operation
    mov edx, 1
    int 0x80

    ; Print first number prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, num1_prompt
    mov edx, 20
    int 0x80

    ; Read first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Print second number prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, num2_prompt
    mov edx, 21
    int 0x80

    ; Read second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Convert num1 from ASCII to integer
    mov ecx, num1
    call atoi
    mov [num1], eax

    ; Convert num2 from ASCII to integer
    mov ecx, num2
    call atoi
    mov [num2], eax

    ; Perform the operation
    mov al, [operation]
    cmp al, '+'
    je add
    cmp al, '-'
    je subtract
    cmp al, '*'
    je multiply
    cmp al, '/'
    je divide

    ; Addition
add:
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax
    jmp print_result

    ; Subtraction
subtract:
    mov eax, [num1]
    sub eax, [num2]
    mov [result], eax
    jmp print_result

    ; Multiplication
multiply:
    mov eax, [num1]
    imul eax, [num2]
    mov [result], eax
    jmp print_result

    ; Division
divide:
    mov eax, [num1]
    cdq
    idiv dword [num2]
    mov [result], eax
    jmp print_result

print_result:
    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 8
    int 0x80

    ; Convert result to ASCII
    mov eax, [result]
    call itoa
    mov ecx, temp

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov edx, 4
    int 0x80

    ; Print newline