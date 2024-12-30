; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; This program is an excellent exercise for understanding binary to decimal conversion and practicing x86 Assembly language.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    temp resd 1
    weather resd 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
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

convert_loop:
    ; Check if the current character is a newline
    cmp byte [ecx], 10
    je end_conversion

    ; Convert the current binary digit to decimal
    sub byte [ecx], '0'
    imul eax, eax, 2
    add eax, [ecx]

    ; Move to the next character
    inc ecx
    jmp convert_loop

end_conversion:
    ; Store the result in decimal_output
    mov [decimal_output], eax

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal result
    mov eax, [decimal_output]
    call print_decimal

    ; Print a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_decimal:
    ; Function to print a decimal number
    ; Input: eax = number to print
    push eax
    mov ecx, 10
    xor edx, edx

print_loop:
    ; Divide the number by 10
    div ecx
    add dl, '0'
    push dx
    test eax, eax
    jnz print_loop

print_digits:
    ; Print each digit
    pop dx
    cmp dx, 0
    je print_done
    mov eax, 4
    mov ebx, 1
    mov ecx, edx
    mov edx, 1
    int 0x80
    jmp print_digits

print_done:
    ret

