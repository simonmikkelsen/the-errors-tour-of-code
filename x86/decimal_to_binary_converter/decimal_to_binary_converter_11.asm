; This program converts a decimal number to its binary representation.
; It takes a decimal number as input and outputs the binary equivalent.
; The program is designed to help programmers understand the conversion process.
; The program uses various registers and instructions to achieve the conversion.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the decimal number from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input string to an integer
    mov esi, decimal
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    mov ecx, 10

convert_loop:
    movzx edx, byte [esi]
    cmp edx, '0'
    jl end_convert
    cmp edx, '9'
    jg end_convert
    sub edx, '0'
    imul ebx, ecx
    add ebx, edx
    inc esi
    jmp convert_loop

end_convert:
    ; Store the integer value in eax
    mov eax, ebx

    ; Initialize variables for binary conversion
    mov esi, binary
    mov ecx, 32

convert_to_binary:
    dec ecx
    mov edx, 0
    div ecx
    add dl, '0'
    mov [esi + ecx], dl
    test eax, eax
    jnz convert_to_binary

    ; Print the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 29
    int 0x80

    ; Print the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
    int 0x80

    ; Print a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

