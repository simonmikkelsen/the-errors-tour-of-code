; This program converts a decimal number to its binary representation.
; It is designed to help programmers understand the intricacies of x86 Assembly language.
; The program takes an input from the user, processes it, and outputs the binary equivalent.
; The code is written with extensive comments to guide the reader through each step.

section .data
    prompt db 'Enter a decimal number: ', 0
    len_prompt equ $ - prompt
    output db 'The binary representation is: ', 0
    len_output equ $ - output
    buffer db 32 dup(0)
    newline db 0xA, 0

section .bss
    num resb 4
    bin resb 32

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Read the user input
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 32
    int 0x80

    ; Convert the input string to an integer
    call str_to_int

    ; Convert the integer to binary
    call int_to_bin

    ; Display the output message
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, len_output
    int 0x80

    ; Display the binary result
    mov eax, 4
    mov ebx, 1
    mov ecx, bin
    mov edx, 32
    int 0x80

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

; Function to convert a string to an integer
str_to_int:
    ; Initialize variables
    mov esi, buffer
    xor eax, eax
    xor ebx, ebx

convert_loop:
    ; Load the next character
    mov bl, [esi]
    cmp bl, 0xA
    je end_convert
    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc esi
    jmp convert_loop

end_convert:
    ; Store the result in the num variable
    mov [num], eax
    ret

; Function to convert an integer to binary
int_to_bin:
    ; Initialize variables
    mov ecx, 32
    mov esi, bin
    mov eax, [num]

bin_loop:
    ; Perform the conversion
    shr eax, 1
    jc set_one
    mov byte [esi], '0'
    jmp next_bit

set_one:
    mov byte [esi], '1'

next_bit:
    inc esi
    loop bin_loop
    ret

