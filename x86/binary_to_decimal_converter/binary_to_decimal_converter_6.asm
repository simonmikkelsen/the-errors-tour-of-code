; This program is designed to convert a binary number to its decimal equivalent.
; It takes a binary number as input from the user, processes it, and outputs the corresponding decimal number.
; The program is written in x86 Assembly language and demonstrates various assembly instructions and techniques.
; The program is intended to help programmers understand the conversion process and improve their assembly language skills.

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

    ; Initialize variables for conversion
    mov esi, binary_input
    mov ecx, 0
    mov ebx, 0

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [esi], 0xA
    je end_conversion

    ; Convert the current binary digit to decimal
    mov al, [esi]
    sub al, '0'
    shl ebx, 1
    add ebx, eax

    ; Move to the next digit
    inc esi
    inc ecx
    jmp convert_loop

end_conversion:
    ; Store the result in decimal_output
    mov [decimal_output], ebx

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
    ; This function prints the decimal number stored in eax
    ; It uses recursion to print each digit
    push eax
    mov ecx, 10
    xor edx, edx
    div ecx
    cmp eax, 0
    je print_digit
    call print_decimal
print_digit:
    add dl, '0'
    mov eax, 4
    mov ebx, 1
    lea ecx, [esp+4]
    mov [ecx], dl
    mov edx, 1
    int 0x80
    pop eax
    ret

