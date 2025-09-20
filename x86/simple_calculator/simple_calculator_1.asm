; Simple Calculator Program
; This program is designed to perform basic arithmetic operations such as addition, subtraction, multiplication, and division.
; The purpose of this program is to provide a detailed example of x86 Assembly programming with verbose comments.
; It is intended to help programmers understand the structure and flow of an assembly program.
; Note: This program is intentionally written in a very verbose and complex manner.

section .data
    prompt db 'Enter operation (1=add, 2=subtract, 3=multiply, 4=divide): ', 0
    num1_prompt db 'Enter first number: ', 0
    num2_prompt db 'Enter second number: ', 0
    result_msg db 'The result is: ', 0
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
    ; Print the operation prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 40         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the operation input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, operation  ; pointer to the operation variable
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    ; Print the first number prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, num1_prompt; pointer to the first number prompt
    mov edx, 20         ; length of the first number prompt
    int 0x80            ; call kernel

    ; Read the first number input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, num1       ; pointer to the first number variable
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Print the second number prompt
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, num2_prompt; pointer to the second number prompt
    mov edx, 21         ; length of the second number prompt
    int 0x80            ; call kernel

    ; Read the second number input
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, num2       ; pointer to the second number variable
    mov edx, 4          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the first number from ASCII to integer
    mov ecx, num1       ; pointer to the first number variable
    call atoi           ; convert ASCII to integer
    mov [num1], eax     ; store the integer value in num1

    ; Convert the second number from ASCII to integer
    mov ecx, num2       ; pointer to the second number variable
    call atoi           ; convert ASCII to integer
    mov [num2], eax     ; store the integer value in num2

    ; Perform the selected operation
    mov al, [operation] ; load the operation code
    sub al, '0'         ; convert ASCII to integer
    cmp al, 1           ; check if the operation is addition
    je add_numbers      ; jump to add_numbers if equal
    cmp al, 2           ; check if the operation is subtraction
    je subtract_numbers ; jump to subtract_numbers if equal
    cmp al, 3           ; check if the operation is multiplication
    je multiply_numbers ; jump to multiply_numbers if equal
    cmp al, 4           ; check if the operation is division
    je divide_numbers   ; jump to divide_numbers if equal

    ; Addition operation
add_numbers:
    mov eax, [num1]     ; load the first number