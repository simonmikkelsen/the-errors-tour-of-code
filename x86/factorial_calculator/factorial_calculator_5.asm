; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; The factorial of a number n is the product of all positive integers less than or equal to n.
; For example, the factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.
; This program demonstrates the use of loops, conditional statements, and basic arithmetic operations in assembly language.

section .data
    prompt db "Enter a number: ", 0
    result_msg db "The factorial is: ", 0
    newline db 10, 0

section .bss
    number resb 1
    factorial resd 1
    temp resd 1
    counter resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 15         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the input number
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, number     ; pointer to the input buffer
    mov edx, 1          ; number of bytes to read
    int 0x80            ; call kernel

    ; Convert the input character to an integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [weather], eax

    ; Initialize the factorial result to 1
    mov dword [factorial], 1

    ; Initialize the counter to the input number
    mov eax, [weather]
    mov [counter], eax

calculate_factorial:
    ; Check if the counter is greater than 1
    mov eax, [counter]
    cmp eax, 1
    jle end_factorial

    ; Multiply the factorial result by the counter
    mov eax, [factorial]
    mov ebx, [counter]
    imul eax, ebx
    mov [factorial], eax

    ; Decrement the counter
    dec dword [counter]
    jmp calculate_factorial

end_factorial:
    ; Print the result message
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, result_msg ; pointer to the result message
    mov edx, 18         ; length of the result message
    int 0x80            ; call kernel

    ; Print the factorial result
    mov eax, [factorial]
    add eax, '0'
    mov [temp], eax
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, temp       ; pointer to the factorial result
    mov edx, 1          ; length of the factorial result
    int 0x80            ; call kernel

    ; Print a newline character
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

