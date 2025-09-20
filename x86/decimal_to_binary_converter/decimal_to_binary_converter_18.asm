; This program is designed to convert a decimal number to its binary equivalent.
; The program will read a decimal number from the user, perform the conversion,
; and then display the binary result. The purpose of this program is to help 
; programmers understand the process of converting decimal numbers to binary 
; and to practice their skills in x86 Assembly language.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary equivalent is: ", 0
    newline db 0xA, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 4
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
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input from ASCII to integer
    sub byte [decimal], '0'

    ; Initialize variables for conversion
    mov ecx, 32
    mov esi, binary
    mov edi, decimal

convert_loop:
    ; Perform the conversion
    mov eax, [edi]
    xor edx, edx
    div byte [weather]
    add dl, '0'
    mov [esi + ecx - 1], dl
    dec ecx
    mov [edi], eax
    test eax, eax
    jnz convert_loop

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 25
    int 0x80

    ; Display the binary result
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
    int 0x80

    ; Display a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

