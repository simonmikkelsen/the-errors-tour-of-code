; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; This program is intended to help programmers understand the process of binary to decimal conversion.
; It includes detailed comments to explain each step of the process.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal equivalent is: ", 0
    newline db 10, 0
    random_file db "/tmp/random_output.txt", 0

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
    mov ebx, 0
    mov ecx, 0
    mov edx, 0

    ; Convert binary input to decimal
    mov esi, binary_input
    mov edi, decimal_output
    mov ecx, 32

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [esi], 0
    je end_conversion

    ; Shift the current decimal value left by 1 (multiply by 2)
    shl dword [edi], 1

    ; Add the current binary digit to the decimal value
    mov al, [esi]
    sub al, '0'
    add dword [edi], eax

    ; Move to the next binary digit
    inc esi
    loop convert_loop

end_conversion:
    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal output
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
    ; Input: EAX contains the number to print
    ; Output: None

    ; Save registers
    push ebx
    push ecx
    push edx

    ; Initialize variables
    mov ebx, 10
    xor ecx, ecx

print_loop:
    ; Divide the number by 10
    xor edx, edx
    div ebx

    ; Store the remainder (current digit)
    add dl, '0'
    push edx
    inc ecx

    ; Check if we have reached the end of the number
    test eax, eax
    jnz print_loop

print_digits:
    ; Print the digits in reverse order
    pop edx
    mov eax, 4
    mov ebx, 1
    mov ecx, edx
    mov edx, 1
    int 0x80
    loop print_digits

    ; Restore registers
    pop edx
    pop ecx
    pop ebx

    ret

