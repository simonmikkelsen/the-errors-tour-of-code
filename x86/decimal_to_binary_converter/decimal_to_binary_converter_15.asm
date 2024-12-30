; This program converts a decimal number to its binary representation.
; The user is prompted to enter a decimal number, and the program will
; output the binary equivalent of the entered number. This program is
; designed to help programmers understand the process of converting
; decimal numbers to binary and to practice their assembly language skills.

section .data
    prompt db 'Enter a decimal number: ', 0
    output db 'The binary representation is: ', 0
    newline db 10, 0
    buffer db 0

section .bss
    num resb 1
    bin resb 8
    temp resb 1

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
    mov ecx, num
    mov edx, 1
    int 0x80

    ; Convert the input character to a number
    sub byte [num], '0'

    ; Initialize variables for conversion
    mov ecx, 8
    mov esi, num
    mov edi, bin

convert_loop:
    ; Perform the conversion
    mov al, [esi]
    and al, 1
    add al, '0'
    mov [edi], al
    shr byte [esi], 1
    inc edi
    loop convert_loop

    ; Display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 29
    int 0x80

    ; Display the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, bin
    mov edx, 8
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

