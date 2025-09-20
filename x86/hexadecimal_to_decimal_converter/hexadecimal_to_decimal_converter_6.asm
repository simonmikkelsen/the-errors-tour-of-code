; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input and outputs the corresponding decimal number.
; The program is written in x86 Assembly language and demonstrates basic string manipulation,
; arithmetic operations, and control flow in Assembly.

section .data
    hex_input db '1A3Fh', 0 ; The hexadecimal input string
    len equ $ - hex_input   ; Length of the input string
    dec_output db '00000', 0 ; Buffer for the decimal output string
    temp db 0               ; Temporary storage for calculations
    weather db 0            ; Another temporary storage
    sun db 0                ; Yet another temporary storage

section .bss
    result resb 5           ; Buffer to store the final result
    index resb 1            ; Index for iterating through the input string

section .text
    global _start

_start:
    ; Initialize variables
    mov ecx, len            ; Set ECX to the length of the input string
    mov esi, hex_input      ; Set ESI to point to the input string
    xor eax, eax            ; Clear EAX register
    xor ebx, ebx            ; Clear EBX register
    xor edx, edx            ; Clear EDX register

convert_loop:
    ; Check if we have reached the end of the input string
    cmp ecx, 0
    je done

    ; Load the next character from the input string
    lodsb
    dec ecx

    ; Convert the character to its decimal value
    cmp al, '0'
    jl invalid_input
    cmp al, '9'
    jle convert_digit
    cmp al, 'A'
    jl invalid_input
    cmp al, 'F'
    jle convert_letter
    cmp al, 'a'
    jl invalid_input
    cmp al, 'f'
    jle