; This program converts a decimal number to its binary representation.
; The user will input a decimal number, and the program will output the binary equivalent.
; This is a simple yet effective way to understand how numbers are represented in binary form.
; The program uses various registers and memory locations to perform the conversion.
; It is designed to be educational and to help programmers understand the intricacies of assembly language.

section .data
    prompt db 'Enter a decimal number: ', 0
    result db 'The binary representation is: ', 0
    newline db 0xA, 0

section .bss
    number resb 4
    binary resb 32
    temp resb 4

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, number
    mov edx, 4
    int 0x80

    ; Convert the input to an integer
    mov eax, [number]
    sub eax, '0'
    mov [temp], eax

    ; Initialize variables for conversion
    mov ecx, 32
    mov edi, binary

convert_loop:
    ; Perform the conversion
    mov eax, [temp]
    shr eax, 1
    jc set_bit
    mov byte [edi], '0'
    jmp next_bit

set_bit:
    mov byte [edi], '1'

next_bit:
    inc edi
    loop convert_loop

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Print the binary representation
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

