; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input from the user and outputs the corresponding decimal number.
; The program demonstrates basic input/output operations, string manipulation, and arithmetic in x86 assembly.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    hex_input db 20 dup(0)
    decimal_output db 'The decimal equivalent is: ', 0
    result db 20 dup(0)
    newline db 10, 0

section .bss
    temp resb 1
    temp2 resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 20
    int 0x80

    ; Convert the hexadecimal input to decimal
    call hex_to_dec

    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov ecx, decimal_output
    mov edx, 26
    int 0x80

    ; Display the decimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 20
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert hexadecimal to decimal
hex_to_dec:
    ; Initialize variables
    mov esi, hex_input
    mov edi, result
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Loop through each character of the input
convert_loop:
    lodsb
    cmp al, 0
    je end_convert
    cmp al, 10
    jl skip_convert
    sub al, '0'
    cmp al, 9
    jle valid_digit
    sub al, 7
valid_digit:
    imul ebx, ebx, 16
    add ebx, eax
skip_convert:
    jmp convert_loop

end_convert:
    ; Convert the decimal number to a string
    mov eax, ebx
    call int_to_str
    ret

; Function to convert an integer to a string
int_to_str:
    ; Initialize variables
    mov edi, result
    add edi, 19
    mov byte [edi], 0
    dec edi

convert_digit:
    xor edx, edx
    div ecx
    add dl, '0'
    mov [edi], dl
    dec edi
    test eax, eax
    jnz convert_digit
    inc edi
    ret

