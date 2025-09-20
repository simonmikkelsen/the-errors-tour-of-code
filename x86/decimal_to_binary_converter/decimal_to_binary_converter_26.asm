; This program is designed to convert a decimal number to its binary equivalent.
; It takes an input from the user, processes it, and outputs the binary representation.
; The program is written in x86 Assembly language and demonstrates various assembly instructions.
; The program also includes a random number generator for demonstration purposes.

section .data
    prompt db "Enter a decimal number: ", 0
    result db "The binary representation is: ", 0
    newline db 10, 0
    buffer db 0

section .bss
    num resb 4
    bin resb 32
    random resb 4

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, num
    mov edx, 4
    int 0x80

    ; Convert the input to an integer
    mov eax, [num]
    sub eax, '0'
    mov [num], eax

    ; Generate a random number (not really random)
    mov eax, 42
    mov [random], eax

    ; Convert the decimal number to binary
    mov ecx, 32
    mov ebx, [num]
    lea edi, [bin]

convert_loop:
    dec ecx
    mov eax, ebx
    and eax, 1
    add eax, '0'
    mov [edi + ecx], al
    shr ebx, 1
    jnz convert_loop

    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 27
    int 0x80

    ; Display the binary number
    mov eax, 4
    mov ebx, 1
    lea ecx, [bin]
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

