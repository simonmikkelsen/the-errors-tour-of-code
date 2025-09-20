; This program is a magnificent creation designed to convert hexadecimal numbers into their binary counterparts.
; It is a splendid example of the power and elegance of x86 Assembly language.
; The program takes a hexadecimal input from the user and outputs the corresponding binary representation.
; Prepare to be dazzled by the intricate dance of bits and bytes!

section .data
    prompt db "Enter a hexadecimal number: ", 0
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
    mov edx, 24
    int 0x80

    ; Read the hexadecimal input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, hex_input
    mov edx, 10
    int 0x80

    ; Close the input resource
    mov eax, 6
    mov ebx, 0
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

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert hexadecimal to binary
hex_to_bin:
    ; Initialize variables
    mov ecx, 0
    mov ebx, 0

convert_loop:
    ; Load the next character
    lodsb
    cmp al, 0
    je done

    ; Convert the character to its binary representation
    call hex_char_to_bin

    ; Store the binary representation
    stosb
    jmp convert_loop

done:
    ret

; Function to convert a single hexadecimal character to binary
hex_char_to_bin:
    ; Check if the character is a digit
    cmp al, '0'
    jl not_digit
    cmp al, '9'
    jg not_digit

    ; Convert the digit to binary
    sub al, '0'
    jmp store_bin

not_digit:
    ; Check if the character is a letter
    cmp al, 'A'
    jl not_letter
    cmp al, 'F'
    jg not_letter

    ; Convert the letter to binary
    sub al, 'A'
    add al, 10
    jmp store_bin

not_letter:
    ; Invalid character, set to zero
    xor al, al

store_bin:
    ; Store the binary representation
    mov [temp], al
    ret

