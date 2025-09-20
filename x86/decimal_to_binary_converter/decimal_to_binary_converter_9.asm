; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the conversion process.
; The program reads a decimal number from the user, converts it to binary,
; and then displays the binary number on the screen.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

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
    mov edx, 24
    int 0x80

    ; Read the decimal number from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the decimal number to an integer
    mov eax, [decimal]
    sub eax, '0'
    mov [temp], eax

    ; Initialize variables for the conversion process
    mov ecx, 32
    mov edi, binary

convert_loop:
    ; Perform the conversion
    mov eax, [temp]
    xor edx, edx
    div ecx
    add dl, '0'
    mov [edi], dl
    inc edi
    mov [temp], eax
    loop convert_loop

    ; Display the result to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 30
    int 0x80

    ; Display the binary number
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

