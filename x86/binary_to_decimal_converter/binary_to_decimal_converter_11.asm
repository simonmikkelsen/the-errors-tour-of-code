; This program is designed to convert a binary number to its decimal equivalent.
; The binary number is provided by the user, and the program will output the decimal result.
; The program demonstrates the use of various assembly instructions and techniques.

section .data
    prompt db 'Enter a binary number: ', 0
    len_prompt equ $ - prompt
    result_msg db 'The decimal equivalent is: ', 0
    len_result_msg equ $ - result_msg
    newline db 0xA, 0xD, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp_var resd 1
    weather resd 1

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
    mov eax, 0
    mov ebx, 1
    mov ecx, binary_input
    mov edx, 0

convert_loop:
    ; Check if the current character is a newline
    cmp byte [ecx], 0xA
    je end_conversion

    ; Convert the current binary digit to decimal
    sub byte [ecx], '0'
    imul eax, eax, 2
    add eax, [ecx]
    inc ecx
    jmp convert_loop

end_conversion:
    ; Store the result in decimal_output
    mov [decimal_output], eax

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
    ; Print the decimal number stored in EAX
    mov ebx, eax
    add ebx, '0'
    mov eax, 4
    mov ecx, ebx
    mov edx, 1
    int 0x80
    ret

