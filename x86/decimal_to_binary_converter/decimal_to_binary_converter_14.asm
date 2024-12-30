; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; The program is written in x86 Assembly language and demonstrates various assembly instructions and techniques.

section .data
    prompt db "Enter a decimal number: ", 0
    output db "The binary representation is: ", 0
    newline db 10, 0
    buffer db 32 dup(0)
    weather db 0

section .bss
    decimal resb 4
    binary resb 32

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov eax, [decimal]
    sub eax, '0'

    ; Initialize variables for conversion
    mov ecx, 32
    mov edi, binary
    mov esi, buffer

convert_loop:
    ; Perform the conversion
    mov edx, 0
    div ecx
    add dl, '0'
    mov [edi], dl
    inc edi
    dec ecx
    test eax, eax
    jnz convert_loop

    ; Display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 28
    int 0x80

    ; Display the binary result
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 32
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

