; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input from the user and processes it to produce the decimal result.
; The program is written in x86 Assembly language and demonstrates various assembly instructions and techniques.

section .data
    prompt db "Enter a binary number: ", 0
    len_prompt equ $ - prompt
    result_msg db "The decimal equivalent is: ", 0
    len_result_msg equ $ - result_msg
    newline db 0xA, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp_var resd 1

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

    ; Initialize variables
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Convert binary input to decimal
    mov esi, binary_input
    mov edi, decimal_output

convert_loop:
    ; Check if the end of the input is reached
    cmp byte [esi], 0xA
    je end_conversion

    ; Process each binary digit
    shl eax, 1
    mov bl, [esi]
    sub bl, '0'
    add eax, ebx
    inc esi
    jmp convert_loop

end_conversion:
    ; Store the result in decimal_output
    mov [edi], eax

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, len_result_msg
    int 0x80

    ; Display the decimal result
    mov eax, [decimal_output]
    call print_decimal

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_decimal:
    ; Function to print the decimal number
    ; Uses recursion to print each digit
    push eax
    mov ecx, 10
    xor edx, edx
    div ecx
    cmp eax, 0
    je print_digit
    call print_decimal
print_digit:
    add dl, '0'
    mov [temp_var], dl
    mov eax, 4
    mov ebx, 1
    mov ecx, temp_var
    mov edx, 1
    int 0x80
    pop eax
    ret

