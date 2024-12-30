; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the process of conversion
; from one numeral system to another. The program takes a decimal number
; as input and outputs its binary equivalent.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    number resb 4
    binary resb 32
    temp resb 4

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    mov ecx, number
    sub byte [ecx], '0'
    movzx eax, byte [ecx]

    ; Initialize variables
    mov esi, binary
    mov edi, 32
    mov ebx, eax

convert_loop:
    ; Perform the conversion
    mov edx, 0
    div dword [temp]
    add dl, '0'
    dec edi
    mov [esi + edi], dl
    test eax, eax
    jnz convert_loop

    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Output the binary number
    mov eax, 4
    mov ebx, 1
    lea ecx, [esi + edi]
    mov edx, 32
    sub edx, edi
    int 0x80

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

