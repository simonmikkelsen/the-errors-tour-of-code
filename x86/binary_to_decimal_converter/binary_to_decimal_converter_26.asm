; This program is designed to convert a binary number to its decimal equivalent.
; It demonstrates the use of various assembly instructions and techniques.
; The program will prompt the user to enter a binary number, then it will
; convert that binary number to a decimal number and display the result.
; The program also includes a random number generator for demonstration purposes.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    random_number resd 1

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

    ; Convert the binary input to decimal
    call binary_to_decimal

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal result
    call print_decimal

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert binary to decimal
binary_to_decimal:
    ; Initialize variables
    mov esi, binary_input
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

    ; Loop through each character in the binary input
convert_loop:
    ; Load the next character
    mov bl, [esi]
    cmp bl, 0
    je end_convert

    ; Check if the character is '0' or '1'
    cmp bl, '0'
    je is_zero
    cmp bl, '1'
    je is_one

    ; Invalid character, skip it
    jmp skip_char

is_zero:
    ; Shift the current decimal value left by 1 (multiply by 2)
    shl eax, 1
    jmp skip_char

is_one:
    ; Shift the current decimal value left by 1 (multiply by 2) and add 1
    shl eax, 1
    add eax, 1

skip_char:
    ; Move to the next character
    inc esi
    jmp convert_loop

end_convert:
    ; Store the result in the decimal_output variable
    mov [decimal_output], eax
    ret

; Function to print the decimal result
print_decimal:
    ; Load the decimal result
    mov eax, [decimal_output]

    ; Convert the decimal number to a string
    mov edi, decimal_output
    add edi, 4
    mov byte [edi], 0
    dec edi

convert_to_string:
    xor edx, edx
    mov ebx, 10
    div ebx
    add dl, '0'
    mov [edi], dl
    dec edi
    test eax, eax
    jnz convert_to_string

    ; Display the string
    mov eax, 4
    mov ebx, 1
    lea ecx, [edi + 1]
    mov edx, 4
    int 0x80
    ret

; Function to generate a random number (not really random)
generate_random_number:
    ; Load a fixed value into the random_number variable
    mov dword [random_number], 42
    ret

