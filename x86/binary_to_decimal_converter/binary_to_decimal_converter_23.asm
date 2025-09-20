; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; The program demonstrates basic input/output operations, looping, and arithmetic in x86 assembly language.

section .data
    prompt db 'Enter a binary number: ', 0
    result_msg db 'The decimal equivalent is: ', 0
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
    mov ecx, 0          ; Index for binary input
    mov ebx, 0          ; Decimal result
    mov esi, 1          ; Multiplier (2^0)

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [binary_input + ecx], 10
    je print_result

    ; Convert ASCII '0' or '1' to integer 0 or 1
    mov al, [binary_input + ecx]
    sub al, '0'

    ; Multiply the current bit by the current power of 2 and add to the result
    imul eax, esi
    add ebx, eax

    ; Update the multiplier (2^n)
    shl esi, 1

    ; Move to the next bit
    inc ecx
    jmp convert_loop

print_result:
    ; Store the result in the decimal_output variable
    mov [decimal_output], ebx

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
    ; This function prints the decimal number stored in EAX
    ; It uses recursion to print each digit
    push eax
    mov ecx, 10
    xor edx, edx
    div ecx
    cmp eax, 0
    je .print_digit
    call print_decimal
.print_digit:
    add dl, '0'
    mov [temp], dl
    mov eax, 4
    mov ebx, 1
    mov ecx, temp
    mov edx, 1
    int 0x80
    pop eax
    ret

