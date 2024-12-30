; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program will take a hexadecimal input from the user, process it, and output the decimal result.
; The purpose of this program is to provide a detailed example of how such a conversion can be done in x86 Assembly.
; The program will demonstrate various assembly instructions and techniques for handling user input and output.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    result_msg db 'The decimal equivalent is: ', 0
    newline db 0xA, 0

section .bss
    hex_input resb 10
    decimal_output resb 10
    temp resb 10
    temp2 resb 10
    temp3 resb 10
    temp4 resb 10
    temp5 resb 10
    temp6 resb 10
    temp7 resb 10
    temp8 resb 10
    temp9 resb 10
    temp10 resb 10

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    ; Read the hexadecimal input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 10
    int 0x80

    ; Initialize variables for conversion
    mov esi, hex_input
    mov edi, decimal_output
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Convert each hexadecimal digit to decimal
convert_loop:
    lodsb
    cmp al, 0xA
    je end_conversion
    call hex_to_dec
    add ebx, eax
    inc ecx
    jmp convert_loop

end_conversion:
    ; Prepare the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, decimal_output
    mov edx, ecx
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to