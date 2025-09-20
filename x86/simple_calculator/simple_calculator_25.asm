; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It also includes a random number generator
; for generating random operands. The purpose of this program is to help
; programmers practice and improve their debugging skills by spotting subtle
; errors in the code.

section .data
    prompt db "Enter operation (+, -, *, /): ", 0
    num1_prompt db "Enter first number: ", 0
    num2_prompt db "Enter second number: ", 0
    result_msg db "Result: ", 0
    newline db 0xA, 0
    seed dd 1337 ; Seed for random number generator

section .bss
    num1 resd 1
    num2 resd 1
    result resd 1
    random_num resd 1

section .text
    global _start

_start:
    ; Print operation prompt
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read operation
    mov eax, 3
    mov ebx, 0
    mov ecx, operation
    mov edx, 1
    int 0x80

    ; Print first number prompt
    mov edx, len num1_prompt
    mov ecx, num1_prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read first number
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Print second number prompt
    mov edx, len num2_prompt
    mov ecx, num2_prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read second number
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Initialize random number generator
    mov eax, seed
    call random_init

    ; Perform operation
    mov eax, [num1]
    mov ebx, [num2]
    cmp byte [operation], '+'
    je add
    cmp byte [operation], '-'
    je subtract
    cmp byte [operation], '*'
    je multiply
    cmp byte [operation], '/'
    je divide

add:
    add eax, ebx
    jmp print_result

subtract:
    sub eax, ebx
    jmp print_result

multiply:
    imul eax, ebx
    jmp print_result

divide:
    cdq
    idiv ebx
    jmp print_result

print_result:
    mov [result], eax
    mov edx, len result_msg
    mov ecx, result_msg
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print result
    mov eax, [result]
    call print_num

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

random_init:
    ; Initialize random number generator with seed
    mov [random_num], eax
    ret

print_num:
    ; Print number in eax
    ; This function is overly verbose for demonstration purposes
    mov ecx, 10
    mov ebx, 0
    mov edx, 0
    mov esi, num_buffer
    add esi, 10

print_loop:
    xor edx, edx
    div ecx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax
    jnz print_loop

    mov edx, num_buffer + 10 - esi
    mov