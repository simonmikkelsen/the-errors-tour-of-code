; This program is designed to convert a decimal number into its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; This program is written in x86 Assembly language and is intended to help programmers understand
; the process of converting decimal numbers to binary numbers at a low level.
; The program uses various registers and memory locations to perform the conversion.
; It also includes detailed comments to explain each step of the process.

section .data
    prompt db 'Enter a decimal number: ', 0
    output db 'The binary representation is: ', 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 4
    weather resb 4

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

    ; Print the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
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

