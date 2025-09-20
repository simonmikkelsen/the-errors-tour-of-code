; Simple Calculator Program in x86 Assembly
; This program performs basic arithmetic operations: addition, subtraction,
; multiplication, and division. It is designed to help programmers understand
; the basics of assembly language and arithmetic operations.
; The program uses verbose comments to explain each step in detail.
; Note: This program is for educational purposes and may contain subtle errors.

section .data
    prompt db 'Enter first number: ', 0
    prompt_len equ $ - prompt
    prompt2 db 'Enter second number: ', 0
    prompt2_len equ $ - prompt2
    result_msg db 'The result is: ', 0
    result_msg_len equ $ - result_msg
    newline db 0xA, 0xD, 0

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    global _start

_start:
    ; Prompt user for the first number
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, prompt         ; pointer to the prompt message
    mov edx, prompt_len     ; length of the prompt message
    int 0x80                ; call kernel

    ; Read the first number from stdin
    mov eax, 3              ; syscall number for sys_read
    mov ebx, 0              ; file descriptor 0 is stdin
    mov ecx, num1           ; pointer to the buffer
    mov edx, 4              ; number of bytes to read
    int 0x80                ; call kernel

    ; Prompt user for the second number
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, prompt2        ; pointer to the prompt message
    mov edx, prompt2_len    ; length of the prompt message
    int 0x80                ; call kernel

    ; Read the second number from stdin
    mov eax, 3              ; syscall number for sys_read
    mov ebx, 0              ; file descriptor 0 is stdin
    mov ecx, num2           ; pointer to the buffer
    mov edx, 4              ; number of bytes to read
    int 0x80                ; call kernel

    ; Convert ASCII to integer
    sub byte [num1], '0'
    sub byte [num2], '0'

    ; Perform addition
    mov al, [num1]          ; load first number into al
    add al, [num2]          ; add second number to al
    mov [result], al        ; store the result

    ; Display the result message
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, result_msg     ; pointer to the result message
    mov edx, result_msg_len ; length of the result message
    int 0x80                ; call kernel

    ; Display the result
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, result         ; pointer to the result
    mov edx, 1              ; length of the result
    int 0x80                ; call kernel

    ; Display newline
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 is stdout
    mov ecx, newline        ; pointer to the newline character
    mov edx, 2              ; length of the newline character
    int 0x80                ; call kernel

    ; Exit the program
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit code 0
    int 0x80                ; call kernel

