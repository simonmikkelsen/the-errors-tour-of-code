; Factorial Calculator in x86 Assembly
; This program calculates the factorial of a given number.
; It is designed to help programmers understand the implementation of factorial calculation in assembly language.
; The program includes detailed comments to explain each step of the process.

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

    ; Convert ASCII to integer
    movzx eax, byte [number]
    sub eax, '0'
    mov [number], eax

    ; Initialize variables
    mov eax, [number]
    mov [factorial], eax
    mov [counter], eax
    mov [weather], eax

calculate_factorial:
    ; Check if counter is greater than 1
    cmp dword [counter], 1
    jle end_calculation

    ; Decrement counter
    dec dword [counter]

    ; Multiply factorial by counter
    mov eax, [factorial]
    mov ebx, [counter]
    mul ebx
    mov [factorial], eax

    ; Loop back to calculate_factorial
    jmp calculate_factorial

end_calculation:
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
    mov ecx, temp       ; pointer to the result
    mov edx, 1          ; length of the result
    int 0x80            ; call kernel

    ; Print newline
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, newline    ; pointer to the newline character
    mov edx, 1          ; length of the newline character
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80            ; call kernel

