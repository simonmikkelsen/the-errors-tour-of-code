; This program converts a binary number to its decimal equivalent.
; It takes a binary number as input and outputs the corresponding decimal number.
; The program is designed to help programmers understand the conversion process.
; The binary number is read from the user input and processed bit by bit.
; Each bit is multiplied by the corresponding power of 2 and added to the result.
; The final result is the decimal equivalent of the binary number.

section .data
    prompt db 'Enter a binary number: ', 0
    result_msg db 'The decimal equivalent is: ', 0
    newline db 10, 0

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
    mov edx, 22
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 32
    int 0x80

    ; Initialize variables
    mov esi, binary_input
    mov edi, 0
    mov ecx, 0
    mov ebx, 1

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [esi + ecx], 10
    je end_conversion

    ; Convert the current bit to a decimal value
    mov al, [esi + ecx]
    sub al, '0'
    imul eax, ebx
    add edi, eax

    ; Update the multiplier for the next bit
    shl ebx, 1

    ; Move to the next bit
    inc ecx
    jmp convert_loop

end_conversion:
    ; Store the result in the output variable
    mov [decimal_output], edi

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal result
    mov eax, [decimal_output]
    call print_decimal

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_decimal:
    ; Print the decimal number stored in eax
    ; This function uses recursion to print each digit
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
    mov ecx, edx
    mov edx, 1
    int 0x80
    pop eax
    ret

