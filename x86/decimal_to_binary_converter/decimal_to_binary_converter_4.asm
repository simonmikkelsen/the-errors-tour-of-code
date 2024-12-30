; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; This program is an excellent exercise for understanding the basics of number systems and assembly language programming.
; It demonstrates the use of loops, conditional statements, and basic I/O operations in x86 assembly.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    number resb 4
    binary resb 32
    temp resb 4
    counter resb 4
    weather resb 4

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
    sub byte [number], '0'

    ; Initialize variables
    mov ecx, 32
    mov edi, binary

convert_loop:
    ; Perform the conversion
    mov eax, [number]
    xor edx, edx
    div dword [weather]
    add dl, '0'
    mov [edi], dl
    inc edi
    mov [number], eax
    loop convert_loop

    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 29
    int 0x80

    ; Display the binary number
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
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

