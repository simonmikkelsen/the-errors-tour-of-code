; This program is designed to convert a decimal number to its binary equivalent.
; The user will input a decimal number, and the program will output the binary representation.
; This program is an excellent exercise for understanding the basics of number systems and assembly language programming.

section .data
    prompt db 'Enter a decimal number: ', 0
    output db 'The binary representation is: ', 0
    newline db 10, 0

section .bss
    decimal resb 4
    binary resb 32
    temp resb 4
    weather resb 4

section .text
    global _start

_start:
    ; Print the prompt message to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 23
    int 0x80

    ; Read the user input (decimal number)
    mov eax, 3
    mov ebx, 0
    mov ecx, decimal
    mov edx, 4
    int 0x80

    ; Convert the input string to an integer
    call str_to_int

    ; Convert the integer to binary
    call int_to_bin

    ; Print the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, 28
    int 0x80

    ; Print the binary representation
    mov eax, 4
    mov ebx, 1
    mov ecx, binary
    mov edx, 32
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

; Function to convert a string to an integer
str_to_int:
    mov eax, 0
    mov ecx, decimal
    mov edx, 0

convert_loop:
    mov bl, byte [ecx]
    cmp bl, 0
    je end_convert
    sub bl, '0'
    imul edx, edx, 10
    add edx, ebx
    inc ecx
    jmp convert_loop

end_convert:
    mov [temp], edx
    ret

; Function to convert an integer to a binary string
int_to_bin:
    mov eax, [temp]
    mov ecx, binary
    mov edx, 32

bin_loop:
    dec edx
    mov ebx, eax
    and ebx, 1
    add ebx, '0'
    mov [ecx + edx], bl
    shr eax, 1
    test eax, eax
    jnz bin_loop

    ret

