; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; The program uses various registers and memory locations to achieve this conversion.
; It is an educational tool to understand the intricacies of assembly language programming.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary equivalent is: ", 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 1

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the decimal number from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input string to an integer
    mov eax, 0
    mov ecx, 0
    mov esi, decimal
convert_to_int:
    movzx edx, byte [esi]
    cmp edx, 10
    je end_convert_to_int
    sub edx, '0'
    imul eax, eax, 10
    add eax, edx
    inc esi
    jmp convert_to_int
end_convert_to_int:

    ; Initialize variables for binary conversion
    mov ecx, 32
    mov edi, binary

convert_to_binary:
    dec ecx
    mov edx, 0
    div ecx
    add dl, '0'
    mov [edi + ecx], dl
    cmp eax, 0
    jne convert_to_binary

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 26
    int 0x80

    ; Print the binary number
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

