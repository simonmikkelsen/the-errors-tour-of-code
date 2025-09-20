; This program converts a decimal number to its binary representation.
; The user is prompted to enter a decimal number, and the program will
; output the corresponding binary number. This program is designed to
; help programmers understand the process of converting decimal to binary.

section .data
    prompt db "Enter a decimal number: ", 0
    output db "The binary representation is: ", 0
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

    ; Convert the input string to an integer
    mov eax, [number]
    sub eax, '0'

    ; Initialize variables
    mov ecx, 32
    mov edi, binary

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

