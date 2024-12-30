; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers understand
; the structure and flow of assembly language programs. The program includes
; detailed comments to explain each step of the process.

section .data
    prompt db "Enter operation (+, -, *, /): ", 0
    num1_prompt db "Enter first number: ", 0
    num2_prompt db "Enter second number: ", 0
    result_msg db "Result: ", 0
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4
    operation resb 1

section .text
    global _start

_start:
    ; Display operation prompt
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read operation
    mov edx, 1
    mov ecx, operation
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Display first number prompt
    mov edx, len num1_prompt
    mov ecx, num1_prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read first number
    mov edx, 4
    mov ecx, num1
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Display second number prompt
    mov edx, len num2_prompt
    mov ecx, num2_prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read second number
    mov edx, 4
    mov ecx, num2
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Convert numbers from ASCII to integer
    call ascii_to_int
    mov [num1], eax
    call ascii_to_int
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
    jmp print_result

divide:
    mov eax, [num1]
    cdq
    idiv dword [num2]
    jmp print_result

print_result:
    ; Convert result from integer to ASCII
    call int_to_ascii
    mov [result], eax

    ; Display result message
    mov edx, len result_msg
    mov ecx, result_msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display result
    mov edx, 4
    mov ecx, result
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Display newline
    mov edx, len newline
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    int 0x80