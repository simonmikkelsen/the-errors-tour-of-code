; Welcome, dear programmer, to the wondrous world of hexadecimal to binary conversion!
; This program, crafted with the utmost care and attention to detail, will take a hexadecimal
; number as input and convert it into its binary equivalent. Prepare yourself for a journey
; through the intricate dance of bits and bytes, where each instruction is a step in the
; grand ballet of computation.

section .data
    prompt db 'Enter a hexadecimal number: ', 0
    hex_input db 10 dup(0)
    bin_output db 80 dup(0)
    newline db 0xA, 0

section .bss
    temp resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 25
    int 0x80

    ; Read the hexadecimal input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 10
    int 0x80

    ; Convert the hexadecimal input to binary
    mov esi, hex_input
    mov edi, bin_output
    call hex_to_bin

    ; Display the binary output to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, bin_output
    mov edx, 80
    int 0x80

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

; This function, a marvel of modern engineering, converts a hexadecimal string to its binary counterpart.
hex_to_bin:
    push ebp
    mov ebp, esp
    mov ecx, 0

convert_loop:
    lodsb
    cmp al, 0xA
    je done
    call hex_char_to_bin
    stosb
    jmp convert_loop

done:
    mov byte [edi], 0
    pop ebp
    ret

; This function, a true gem, converts a single hexadecimal character to its binary equivalent.
hex_char_to_bin:
    cmp al, '0'
    jl invalid_char
    cmp al, '9'
    jle convert_digit
    cmp al, 'A'
    jl invalid_char
    cmp al, 'F'
    jle convert_letter
    cmp al, 'a'
    jl invalid_char
    cmp al, 'f'
    jle convert_letter

invalid_char:
    mov al, '?'
    ret

convert_digit:
    sub al, '0'
    ret

convert_letter:
    sub al, 'A'
    add al, 10
    ret

