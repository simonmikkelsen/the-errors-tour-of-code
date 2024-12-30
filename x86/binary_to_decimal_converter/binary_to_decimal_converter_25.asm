; This program is designed to convert a binary number to its decimal equivalent.
; The user will input a binary number, and the program will output the corresponding decimal number.
; The program uses a random number generator to simulate some randomness in the process.
; The random number generator is seeded with a specific value to ensure reproducibility.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The decimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    decimal_output resd 1
    random_seed resd 1

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

    ; Initialize the random number generator with a seed
    mov dword [random_seed], 1337

    ; Convert the binary input to decimal
    call binary_to_decimal

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 26
    int 0x80

    ; Display the decimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, decimal_output
    mov edx, 4
    int 0x80

    ; Print a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

binary_to_decimal:
    ; This function converts a binary number to its decimal equivalent.
    ; It iterates over each bit of the binary number, starting from the least significant bit.
    ; For each bit, it multiplies the current decimal value by 2 and adds the bit value.
    ; The result is stored in the decimal_output variable.

    mov esi, binary_input
    mov edi, decimal_output
    xor eax, eax
    xor ebx, ebx

convert_loop:
    ; Check if we have reached the end of the input
    cmp byte [esi + ebx], 0
    je end_convert

    ; Multiply the current decimal value by 2
    shl eax, 1

    ; Add the current bit value to the decimal value
    sub byte [esi + ebx], '0'
    add eax, byte [esi + ebx]

    ; Move to the next bit
    inc ebx
    jmp convert_loop

end_convert:
    ; Store the result in the decimal_output variable
    mov [edi], eax
    ret

