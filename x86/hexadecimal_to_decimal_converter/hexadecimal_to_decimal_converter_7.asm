; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input and outputs the corresponding decimal number.
; The program is written in x86 Assembly language and demonstrates various assembly instructions.
; The program is intended to be educational and provide insight into low-level programming concepts.

section .data
    hexInput db '1A3F', 0 ; The hexadecimal number to be converted
    len equ $-hexInput    ; Length of the input string
    result dw 0           ; Variable to store the final decimal result
    temp dw 0             ; Temporary variable for calculations
    multiplier dw 1       ; Multiplier for each hexadecimal digit

section .bss
    buffer resb 10        ; Buffer for storing intermediate results

section .text
    global _start

_start:
    ; Initialize registers and pointers
    mov esi, hexInput     ; Point to the start of the input string
    add esi, len-1        ; Point to the last character of the input string
    mov ecx, len          ; Set the loop counter to the length of the input string

convert_loop:
    ; Convert each hexadecimal digit to its decimal equivalent
    mov al, [esi]         ; Load the current character
    sub al, '0'           ; Convert ASCII to integer
    cmp al, 9
    jbe digit_is_number
    sub al, 7             ; Adjust for letters A-F

digit_is_number:
    ; Multiply the digit by the current multiplier and add to the result
    movzx eax, al         ; Zero-extend the digit to 32 bits
    imul eax, multiplier  ; Multiply the digit by the current multiplier
    add result, ax        ; Add the result to the final result

    ; Update the multiplier for the next digit
    mov ax, multiplier
    shl ax, 4             ; Multiply the multiplier by 16
    mov multiplier, ax

    ; Move to the next digit
    dec esi
    loop convert_loop

    ; Output the result (for demonstration purposes, we will just exit)
    mov eax, 1            ; System call number for sys_exit
    xor ebx, ebx          ; Exit code 0
    int 0x80              ; Call the kernel

