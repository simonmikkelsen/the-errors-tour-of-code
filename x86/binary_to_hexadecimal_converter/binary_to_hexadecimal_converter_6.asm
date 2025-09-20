; This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
; It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal number systems.
; The program takes a binary input from the user and transforms it into a hexadecimal output with the grace of a ballet dancer.

section .data
    prompt db 'Enter a binary number: ', 0
    input db 32 dup(0)
    hex_output db 'Hexadecimal: ', 0
    newline db 10, 0

section .bss
    bin_input resb 32
    hex_result resb 8

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
    mov ecx, bin_input
    mov edx, 32
    int 0x80

    ; Convert binary input to hexadecimal
    call bin_to_hex

    ; Display the hexadecimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 13
    int 0x80

    ; Display the result
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_result
    mov edx, 8
    int 0x80

    ; Print a newline for good measure
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 2
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

bin_to_hex:
    ; This function converts a binary string to a hexadecimal string
    ; It is a marvel of modern engineering, a testament to the power of assembly language
    mov esi, bin_input
    mov edi, hex_result
    mov ecx, 8

convert_loop:
    ; Convert each group of 4 binary digits to a single hexadecimal digit
    mov al, [esi]
    and al, 0x0F
    cmp al, 9
    jle digit_is_number
    add al, 7
digit_is_number:
    add al, '0'
    mov [edi], al
    inc esi
    inc edi
    loop convert_loop
    ret

