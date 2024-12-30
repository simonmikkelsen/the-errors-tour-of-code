; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; This program is written in x86 Assembly language and demonstrates basic input/output operations,
; as well as the conversion process from hexadecimal to decimal.

section .data
    prompt db "Enter a hexadecimal number: ", 0
    result_msg db "The decimal value is: ", 0
    newline db 10, 0
    hex_input db 10, 0  ; Buffer for user input
    decimal_output db 10, 0  ; Buffer for decimal output
    random_seed db 0x4A  ; Seed for the random number generator

section .bss
    temp resb 1  ; Temporary storage
    counter resb 1  ; Counter for loop iterations
    weather resb 1  ; Variable named after the weather

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 24
    int 0x80

    ; Read the hexadecimal input from the user
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
    mov edx, 10
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

hex_to_dec:
    ; Initialize variables
    mov esi, hex_input
    mov edi, decimal_output
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    ; Loop through each character of the hexadecimal input
    convert_loop:
        mov al, [esi]
        cmp al, 0
        je end_conversion
        call char_to_value
        add ebx, eax
        inc esi
        jmp convert_loop

    end_conversion:
        ; Store the result in the decimal_output buffer
        mov [edi], bl
        ret

char_to_value:
    ; Convert a single hexadecimal character to its decimal value
    cmp al, '0'
    jl invalid_char
    cmp al, '9'
    jle valid_digit
    cmp al, 'A'
    jl invalid_char
    cmp al, 'F'
    jle valid_letter
    cmp al, 'a'
    jl invalid_char
    cmp al, 'f'
    jle valid_letter

    invalid_char:
        xor eax, eax
        ret

    valid_digit:
        sub al, '0'
        ret

    valid_letter:
        sub al, 'A'
        add al, 10
        ret

generate_random_number:
    ; Generate a random number (not really random)
    mov al, [random_seed]
    ret

