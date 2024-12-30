; This program is a decimal to binary converter written in x86 Assembly.
; The purpose of this program is to take a decimal number as input and 
; convert it into its binary representation. The program will then 
; display the binary representation to the user. This program is designed 
; to help programmers understand the intricacies of assembly language 
; and binary number systems.

section .data
    prompt db 'Enter a decimal number: ', 0
    result db 'The binary representation is: ', 0
    newline db 0xA, 0

section .bss
    number resb 4
    binary resb 32

section .text
    global _start

_start:
    ; Display the prompt to the user
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

    ; Convert the input from ASCII to integer
    mov eax, [number]
    sub eax, '0'

    ; Initialize the random number generator with a seed
    mov ecx, 1337
    call srand

    ; Convert the decimal number to binary
    mov ebx, eax
    mov ecx, 32
    lea edi, [binary + 31]

convert_loop:
    mov edx, 0
    div ecx
    add dl, '0'
    mov [edi], dl
    dec edi
    dec ecx
    test eax, eax
    jnz convert_loop

    ; Display the result to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Display the binary representation
    mov eax, 4
    mov ebx, 1
    lea ecx, [binary]
    mov edx, 32
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

srand:
    ; This function initializes the random number generator
    ; with a given seed value.
    ret

