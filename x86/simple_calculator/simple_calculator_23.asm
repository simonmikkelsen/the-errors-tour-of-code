; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers practice
; and improve their debugging skills by spotting subtle errors.
; Remember, "The universe is probably littered with the one-off errors."

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

    ; Convert numbers from ASCII to integer
    call atoi
    mov [num1], eax
    call atoi
    mov [num2], eax

    ; Perform operation
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
    jmp print_result

    ; Subtraction
subtract:
    mov eax, [num1]
    sub eax, [num2]
    jmp print_result

    ; Multiplication
multiply:
    mov eax, [num1]
    imul eax, [num2]
    jmp print_result

    ; Division
divide:
    mov eax, [num1]
    cdq
    idiv dword [num2]

print_result:
    ; Convert result to ASCII
    mov [result], eax
    call itoa

    ; Print result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 8
    int 0x80

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int