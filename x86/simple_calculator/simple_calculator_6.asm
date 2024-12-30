; Simple Calculator Program in x86 Assembly
; This program is designed to perform basic arithmetic operations such as addition, subtraction,
; multiplication, and division. It takes two integer inputs from the user and an operator to 
; perform the desired operation. The result is then displayed to the user.
; Note: This program is for educational purposes and may contain intentional errors for learning.

section .data
    prompt1 db "Enter first number: ", 0
    prompt2 db "Enter second number: ", 0
    prompt3 db "Enter operator (+, -, *, /): ", 0
    result_msg db "The result is: ", 0
    newline db 10, 0

section .bss
    num1 resb 4
    num2 resb 4
    operator resb 1
    result resb 4

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

    ; Print the result
print_result:
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 14
    int 0x80

    ; Convert the result from integer to ASCII
    mov eax, [result]
    add eax, '0'
    mov [result], eax

    ; Print the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result