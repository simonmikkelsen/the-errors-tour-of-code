; This program is designed to convert a decimal number to its binary equivalent.
; It takes an integer input from the user, processes it, and outputs the binary representation.
; The program is written in x86 Assembly language and demonstrates basic I/O operations,
; arithmetic operations, and control flow structures.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0

section .bss
    number resb 4
    binary resb 32
    temp resb 4
    counter resb 1

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

    ; Convert the input string to an integer
    mov eax, [number]
    sub eax, '0'
    mov [temp], eax

    ; Initialize the counter
    mov byte [counter], 0

convert_loop:
    ; Check if the number is zero
    cmp dword [temp], 0
    je end_conversion

    ; Perform modulus operation to get the binary digit
    mov eax, [temp]
    mov ebx, 2
    xor edx, edx
    div ebx
    add dl, '0'
    mov [binary + ecx], dl

    ; Divide the number by 2
    mov eax, [temp]
    mov ebx, 2
    xor edx, edx
    div ebx
    mov [temp], eax

    ; Increment the counter
    inc byte [counter]
    jmp convert_loop

end_conversion:
    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 28
    int 0x80

    ; Display the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, [counter]
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

