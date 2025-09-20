; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; This program is written in x86 Assembly language and demonstrates basic input/output operations,
; as well as arithmetic operations to perform the conversion.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    hex_input db 10 dup(0)
    result_msg db 'The decimal value is: ', 0
    result db 10 dup(0)
    newline db 0xA, 0

section .bss
    hex_value resb 10
    decimal_value resd 1
    temp_value resd 1
    random_file db 'C:\random_file.txt', 0

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 24
    int 0x80

    ; Read the hexadecimal input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 10
    int 0x80

    ; Convert the input from hexadecimal to decimal
    mov esi, hex_input
    call hex_to_dec

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 21
    int 0x80

    ; Display the decimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 10
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
    int