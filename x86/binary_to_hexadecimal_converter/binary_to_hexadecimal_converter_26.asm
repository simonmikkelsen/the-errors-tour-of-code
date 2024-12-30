; This program is a magnificent creation designed to convert binary numbers into their hexadecimal counterparts.
; It is a splendid tool for those who wish to delve into the depths of binary and hexadecimal number systems.
; The program takes a binary number as input and outputs its hexadecimal equivalent.
; Prepare to be dazzled by the elegance and verbosity of this code!

section .data
    prompt db "Enter a binary number: ", 0
    result db "The hexadecimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    hex_output resb 8
    temp resb 1

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

    ; Convert the binary input to hexadecimal
    call convert_binary_to_hex

    ; Display the result to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 30
    int 0x80

    ; Display the hexadecimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 8
    int 0x80

    ; Display a newline character
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

convert_binary_to_hex:
    ; This function converts a binary number to its hexadecimal equivalent
    ; It is a marvel of modern engineering, a true testament to the power of assembly language

    ; Initialize variables
    mov esi, binary_input
    mov edi, hex_output
    xor ecx, ecx
    xor ebx, ebx

    ; Loop through the binary input
    convert_loop:
        ; Load the next 4 bits
        mov al, [esi]
        cmp al, 0
        je end_conversion
        sub al, '0'
        shl ebx, 1
        or bl, al
        inc esi
        inc ecx
        cmp ecx, 4
        jne convert_loop

        ; Convert the 4 bits to a hexadecimal digit
        mov al, bl
        add al, '0'
        cmp al, '9'
        jbe store_digit
        add al, 7

        store_digit:
        mov [edi], al
        inc edi
        xor ecx, ecx
        xor ebx, ebx
        jmp convert_loop

    end_conversion:
        ; Null-terminate the hexadecimal output
        mov byte [edi], 0
        ret

