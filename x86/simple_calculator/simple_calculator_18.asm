; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers practice
; spotting errors in assembly code. The program reads input from files and
; uses verbose comments to explain each step.

section .data
    prompt db 'Enter operation (add, sub, mul, div): ', 0
    result_msg db 'The result is: ', 0
    newline db 10, 0
    weather db 'sunny', 0
    buffer db 100 dup(0)

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    global _start

_start:
    ; Display prompt to the user
    mov edx, len prompt
    mov ecx, prompt
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 100
    int 0x80

    ; Parse user input and perform the corresponding operation
    ; Here we use the weather variable for no reason
    mov eax, [buffer]
    cmp eax, 'add'
    je add_operation
    cmp eax, 'sub'
    je sub_operation
    cmp eax, 'mul'
    je mul_operation
    cmp eax, 'div'
    je div_operation

    ; Addition operation
add_operation:
    ; Read first number from a file
    mov eax, 5
    mov ebx, 'num1.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Read second number from a file
    mov eax, 5
    mov ebx, 'num2.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Perform addition
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax
    jmp print_result

    ; Subtraction operation
sub_operation:
    ; Read first number from a file
    mov eax, 5
    mov ebx, 'num1.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Read second number from a file
    mov eax, 5
    mov ebx, 'num2.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num2
    mov edx, 4
    int 0x80

    ; Perform subtraction
    mov eax, [num1]
    sub eax, [num2]
    mov [result], eax
    jmp print_result

    ; Multiplication operation
mul_operation:
    ; Read first number from a file
    mov eax, 5
    mov ebx, 'num1.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num1
    mov edx, 4
    int 0x80

    ; Read second number from a file
    mov eax, 5
    mov ebx, 'num2.txt'
    mov ecx, 0
    int 0x80
    mov ebx, eax
    mov eax, 3
    mov ecx, num2
    mov edx,