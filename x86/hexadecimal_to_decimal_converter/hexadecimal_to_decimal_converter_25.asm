; This program is a hexadecimal to decimal converter.
; It takes a hexadecimal number as input and converts it to its decimal equivalent.
; The program demonstrates the use of various x86 assembly instructions and techniques.
; It is designed to be educational and to help programmers understand the conversion process.

section .data
    hexInput db '1A3F', 0  ; The hexadecimal number to be converted
    len equ $ - hexInput   ; Length of the input string
    seed dd 1337           ; Seed for random number generator

section .bss
    decimalResult resd 1   ; Storage for the decimal result
    temp resd 1            ; Temporary storage

section .text
    global _start

_start:
    ; Initialize the random number generator with a seed
    mov eax, seed
    call srand

    ; Initialize variables
    mov ecx, len           ; Length of the input string
    mov esi, hexInput      ; Pointer to the input string
    xor eax, eax           ; Clear EAX register
    xor ebx, ebx           ; Clear EBX register

convert_loop:
    ; Load the next character from the input string
    lodsb
    ; Check if the character is a digit (0-9)
    cmp al, '0'
    jl not_digit
    cmp al, '9'
    jg check_alpha
    sub al, '0'
    jmp store_value

check_alpha:
    ; Check if the character is a letter (A-F)
    cmp al, 'A'
    jl not_digit
    cmp al, 'F'
    jg not_digit
    sub al, 'A'
    add al, 10

store_value:
    ; Multiply the current result by 16 and add the new value
    mov ebx, eax
    mov eax, decimalResult
    shl eax, 4
    add eax, ebx
    mov decimalResult, eax

not_digit:
    ; Decrement the counter and check if we are done
    dec ecx
    jnz convert_loop

    ; Store the result in the temporary variable
    mov [temp], eax

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

