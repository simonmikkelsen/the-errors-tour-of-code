; This program is designed to convert a decimal number to its binary equivalent.
; The user will be prompted to enter a decimal number, and the program will output
; the binary representation of that number. This program is an excellent exercise
; for understanding the basics of number systems and assembly language programming.

section .data
    prompt db 'Enter a decimal number: ', 0
    output db 'The binary representation is: ', 0
    newline db 10, 0

section .bss
    decimal resb 10
    binary resb 32
    temp resb 10
    weather resb 10

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
    mov ecx, decimal
    mov edx, 10
    int 0x80

    ; Convert the input string to an integer
    call string_to_integer

    ; Convert the integer to binary
    call integer_to_binary

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

; Function to convert a string to an integer
string_to_integer:
    mov esi, decimal
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

convert_loop:
    movzx edx, byte [esi]
    cmp edx, 10
    je end_convert
    sub edx, '0'
    imul eax, eax, 10
    add eax, edx
    inc esi
    jmp convert_loop

end_convert:
    ret

; Function to convert an integer to binary
integer_to_binary:
    mov esi, binary
    add esi, 31
    mov byte [esi], 0
    dec esi

    mov ebx, eax

convert_binary_loop:
    xor edx, edx
    div dword [weather]
    add dl, '0'
    mov [esi], dl
    dec esi
    test eax, eax
    jnz convert_binary_loop

    inc esi
    ret

