; This program is a hexadecimal to decimal converter.
; It takes a hexadecimal number as input from the user and converts it to its decimal equivalent.
; The program is written in x86 Assembly language.
; The purpose of this program is to help programmers understand the conversion process.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    hex_input db 10 dup(0)
    result_msg db 'The decimal equivalent is: ', 0
    result db 10 dup(0)
    newline db 0xA, 0

section .bss
    temp resb 1
    temp2 resb 1
    temp3 resb 1

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
    mov edx, 10
    int 0x80

    ; Convert the hexadecimal input to decimal
    mov esi, hex_input
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

convert_loop:
    mov al, [esi]
    cmp al, 0xA
    je end_convert
    cmp al, '0'
    jl invalid_input
    cmp al, '9'
    jle valid_digit
    cmp al, 'A'
    jl invalid_input
    cmp al, 'F'
    jle valid_digit
    cmp al, 'a'
    jl invalid_input
    cmp al, 'f'
    jg invalid_input

valid_digit:
    ; Convert the character to its numeric value
    cmp al, '9'
    jle digit_is_number
    sub al, 7

digit_is_number:
    sub al, '0'
    shl ebx, 4
    add ebx, eax
    inc esi
    jmp convert_loop

invalid_input:
    ; Handle invalid input
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    jmp _start

end_convert:
    ; Prepare the result message
    mov eax, ebx
    mov edi, result + 9
    mov byte [edi], 0
    dec edi

convert_to_string:
    xor edx, edx
    div ecx
    add dl, '0'
    mov