; Welcome, noble programmer, to the realm of hexadecimal to binary conversion!
; This program, crafted with the utmost care and precision, will take a hexadecimal
; digit from the user and transform it into its binary counterpart. Prepare yourself
; for a journey through the enchanted lands of assembly language, where each instruction
; is a spell and each register a magical artifact.

section .data
    prompt db "Enter a hexadecimal digit (0-9, A-F): ", 0
    error_msg db "Invalid input! Please enter a valid hexadecimal digit.", 0
    newline db 10, 0

section .bss
    hex_input resb 1
    binary_output resb 8

section .text
    global _start

_start:
    ; Summon the prompt to the screen
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 36
    int 0x80

    ; Capture the user's input
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 1
    int 0x80

    ; Transform the input into a binary string
    mov al, [hex_input]
    call hex_to_bin

    ; Display the binary output
    mov eax, 4
    mov ebx, 1
    mov ecx, binary_output
    mov edx, 8
    int 0x80

    ; Conclude the program with a newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

; The grand function that converts a single hexadecimal digit to binary
hex_to_bin:
    ; Prepare the stage for our conversion
    cmp al, '0'
    jl invalid_input
    cmp al, '9'
    jle convert_digit
    cmp al, 'A'
    jl invalid_input
    cmp al, 'F'
    jle convert_letter
    jmp invalid_input

convert_digit:
    sub al, '0'
    jmp convert_to_binary

convert_letter:
    sub al, 'A'
    add al, 10

convert_to_binary:
    ; The binary conversion ritual
    mov ecx, 8
    mov ebx, binary_output
    convert_loop:
        shl al, 1
        jc set_one
        mov byte [ebx], '0'
        jmp next_bit
    set_one:
        mov byte [ebx], '1'
    next_bit:
        inc ebx
        loop convert_loop
    ret

invalid_input:
    ; The lament of invalid input
    mov eax, 4
    mov ebx, 1
    mov ecx, error_msg
    mov edx, 42
    int 0x80
    jmp _start

