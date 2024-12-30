; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; This is a great exercise for understanding number systems and practicing assembly language programming.

section .data
    prompt db "Enter a hexadecimal number: ", 0
    result_msg db "The decimal value is: ", 0
    newline db 10, 0

section .bss
    hex_input resb 10
    decimal_output resd 1
    temp_var resd 1

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
    call hex_to_dec

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 21
    int 0x80

    ; Display the decimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, decimal_output
    mov edx, 4
    int 0x80

    ; Print a newline for better readability
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert hexadecimal to decimal
hex_to_dec:
    ; Initialize variables
    mov esi, hex_input
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

convert_loop:
    ; Load the next character
    mov al, [esi]
    cmp al, 0
    je end_convert

    ; Convert the character to its decimal value
    sub al, '0'
    cmp al, 9
    jbe valid_digit
    sub al, 7

valid_digit:
    ; Multiply the current result by 16 (shift left by 4) and add the new digit
    shl ebx, 4
    add ebx, eax

    ; Move to the next character
    inc esi
    jmp convert_loop

end_convert:
    ; Store the result in the output variable
    mov [decimal_output], ebx
    ret

