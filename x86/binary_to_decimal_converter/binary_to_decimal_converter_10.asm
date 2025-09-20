; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; This program is an excellent exercise for understanding binary to decimal conversion and practicing x86 Assembly language.

section .data
    prompt db 'Enter a binary number: ', 0
    len_prompt equ $ - prompt
    result_msg db 'The decimal equivalent is: ', 0
    len_result_msg equ $ - result_msg
    newline db 0xA, 0

section .bss
    binary_input resb 32
    decimal_output resd 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 32
    int 0x80

    ; Convert the binary input to decimal
    call binary_to_decimal

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, len_result_msg
    int 0x80

    ; Display the decimal output
    call print_decimal

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

binary_to_decimal:
    ; Initialize variables
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Loop through each character of the binary input
    mov esi, binary_input
    convert_loop:
        ; Check if the character is a newline
        cmp byte [esi], 0xA
        je end_convert

        ; Convert the character to a binary digit
        sub byte [esi], '0'

        ; Multiply the current decimal value by 2
        shl eax, 1

        ; Add the binary digit to the decimal value
        add eax, [esi]

        ; Move to the next character
        inc esi
        jmp convert_loop

    end_convert:
        ; Store the result in the decimal_output variable
        mov [decimal_output], eax
        ret

print_decimal:
    ; Initialize variables
    mov eax, [decimal_output]
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Convert the decimal number to a string
    mov edi, binary_input
    add edi, 31
    mov byte [edi], 0
    dec edi
    convert_to_string:
        xor edx, edx
        div dword 10
        add dl, '0'
        mov [edi], dl
        dec edi
        test eax, eax
        jnz convert_to_string

    ; Display the decimal number
    inc edi
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, 32
    int 0x80
    ret

