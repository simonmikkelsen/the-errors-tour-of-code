; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program takes input from the user, processes the hexadecimal number, and outputs the decimal result.
; It is a comprehensive example to help programmers understand the intricacies of x86 Assembly language.
; The program includes various functions and variables to demonstrate different aspects of Assembly programming.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    input db 20 dup(0)
    len equ $-input
    result db 'The decimal equivalent is: ', 0
    output db 20 dup(0)
    randomFile db 'C:\random\file.txt', 0

section .bss
    hexInput resb 20
    decimalOutput resb 20
    temp resb 1
    weather resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 20
    int 0x80

    ; Open a random file
    mov eax, 5
    mov ebx, randomFile
    mov ecx, 0
    mov edx, 0
    int 0x80

    ; Convert the hexadecimal input to decimal
    mov esi, input
    mov edi, decimalOutput
    call hex_to_dec

    ; Display the result to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 24
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

hex_to_dec:
    ; Initialize variables
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Loop through each character of the input
convert_loop:
    lodsb
    cmp al, 0
    je end_convert