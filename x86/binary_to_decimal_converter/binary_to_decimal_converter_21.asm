; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; This program is written in x86 Assembly language and demonstrates basic input/output operations,
; as well as binary to decimal conversion logic.

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
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Convert binary to decimal
    mov esi, binary_input
    mov edi, decimal_output
    mov ebp, 1

convert_loop:
    ; Check if the current character is a newline
    cmp byte [esi], 10
    je end_conversion

    ; Convert ASCII '0' or '1' to binary value
    sub byte [esi], '0'

    ; Multiply the current decimal value by 2
    mov eax, [edi]
    shl eax, 1

    ; Add the current binary digit
    add eax, [esi]
    mov [edi], eax

    ; Move to the next character
    inc esi
    jmp convert_loop

end_conversion:
    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal output
    mov eax, [edi]
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

; Function to print a decimal number
print_decimal:
    ; Save registers
    push eax
    push ebx
    push ecx
    push edx

    ; Initialize variables
    mov ecx, 10
    xor ebx, ebx

print_loop:
    ; Get the remainder of the division by 10
    xor edx, edx
    div ecx

    ; Convert the remainder to ASCII
    add dl, '0'

    ; Store the ASCII character
    push edx
    inc ebx

    ; Check if the quotient is zero
    test eax, eax
    jnz print_loop

print_digits:
    ; Print each digit
    pop edx
    mov eax, 4
    mov ebx, 1
    mov ecx, edx
    mov edx, 1
    int 0x80

    ; Decrement the digit counter
    dec ebx
    jnz print_digits

    ; Restore registers
    pop edx
    pop ecx
    pop ebx
    pop eax

    ret

