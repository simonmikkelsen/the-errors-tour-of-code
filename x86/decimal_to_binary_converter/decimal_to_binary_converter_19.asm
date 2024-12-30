; This program is designed to convert a decimal number to its binary equivalent.
; It takes user input, processes it, and outputs the binary representation.
; The program is written in x86 Assembly language, which is a low-level programming language.
; Assembly language is closely related to machine code, making it very powerful and efficient.
; This program is intended to help programmers understand the intricacies of Assembly language.

section .data
    prompt db 'Enter a decimal number: ', 0
    input db 10, 0
    output db 'The binary representation is: ', 0
    bin_output db 32 dup(0)

section .bss
    num resb 4
    bin resb 32

section .text
    global _start

_start:
    ; Print the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    int 0x80

    ; Convert input to integer
    mov ecx, input
    call atoi

    ; Store the integer in num
    mov [num], eax

    ; Convert the integer to binary
    mov eax, [num]
    call dec_to_bin

    ; Print the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 28
    int 0x80

    ; Print the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, bin_output
    mov edx, 32
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
