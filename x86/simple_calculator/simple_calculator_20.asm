; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers understand
; the fundamentals of assembly language programming.
; Note: This program contains verbose comments to aid in understanding.

section .data
    prompt db 'Enter operation (+, -, *, /): ', 0
    num1_prompt db 'Enter first number: ', 0
    num2_prompt db 'Enter second number: ', 0
    result_msg db 'Result: ', 0
    newline db 0xA, 0

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
    call atoi
    mov [num1], eax
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

add:
    ; Addition operation
    mov eax, [num1]
    add eax, [num2]
    jmp print_result

subtract:
    ; Subtraction operation
    mov eax, [num1]
    sub eax, [num2]
    jmp print_result

multiply:
    ; Multiplication operation
    mov eax, [num1]
    imul eax, [num2]
    jmp print_result

divide:
    ; Division operation
    mov eax, [num1]
    cdq
    idiv dword [num2]
    jmp print_result

print_result:
    ; Convert result to ASCII
    call itoa
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
    mov edx, 1
    mov ecx, newline
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

atoi:
    ; Convert ASCII to