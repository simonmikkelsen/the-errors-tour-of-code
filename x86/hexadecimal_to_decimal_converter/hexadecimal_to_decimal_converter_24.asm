; Program: Hexadecimal to Decimal Converter
; Purpose: This program converts a hexadecimal number input by the user into its decimal equivalent.
; The program demonstrates the use of various x86 assembly instructions and system calls.
; It is designed to be verbose and includes many comments to help understand the flow of the program.

section .data
    prompt db "Enter a hexadecimal number: ", 0
    hex_input db 10 dup(0)
    result_msg db "The decimal equivalent is: ", 0
    result db 10 dup(0)
    newline db 10, 0

section .bss
    hex_value resb 4
    decimal_value resd 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 is stdout
    mov ecx, prompt     ; pointer to the prompt message
    mov edx, 25         ; length of the prompt message
    int 0x80            ; call kernel

    ; Read the hexadecimal input from the user
    mov eax, 3          ; syscall number for sys_read
    mov ebx, 0          ; file descriptor 0 is stdin
    mov ecx, hex_input  ; pointer to the input buffer
    mov edx, 10         ; maximum number of bytes to read
    int 0x80            ; call kernel

    ; Convert the hexadecimal input to decimal
    mov esi, hex_input  ; pointer to the input buffer
    xor eax, eax        ; clear eax to use it as the decimal value accumulator
    xor ebx, ebx        ; clear ebx to use it as a temporary register
    mov ecx, 8          ; set the loop counter to 8 (maximum length of a 32-bit hex number)

convert_loop:
    lodsb               ; load the next byte from the input buffer into al
    cmp al, 0           ; check if we reached the end of the input
    je done_convert     ; if yes, jump to done_convert
    cmp al, '0'         ; check if the character is a digit
    jl skip_char        ; if less than '0', skip this character
    cmp al, '9'         ; check if the character is a digit
    jle convert_digit   ; if less than or