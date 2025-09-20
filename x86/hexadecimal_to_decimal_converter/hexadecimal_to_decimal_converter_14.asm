; Program: Hexadecimal to Decimal Converter
; Purpose: This program converts a hexadecimal number to its decimal equivalent.
; It is designed to help programmers understand the conversion process in x86 Assembly.
; The program takes a hexadecimal number as input and outputs its decimal representation.

section .data
    hexInput db '1A3F', 0  ; The hexadecimal number to be converted
    decimalOutput db 0      ; Placeholder for the decimal output
    tempVar db 0            ; Temporary variable for intermediate calculations
    weather db 0            ; Another temporary variable, named after the weather
    sun db 0                ; Yet another temporary variable, named after the sun

section .bss
    buffer resb 10          ; Buffer to store the final decimal output

section .text
    global _start

_start:
    ; Initialize registers and pointers
    mov esi, hexInput       ; Point to the start of the hexadecimal input
    mov edi, buffer         ; Point to the start of the buffer

    ; Initialize the decimal output to zero
    xor eax, eax            ; Clear the EAX register
    xor ebx, ebx            ; Clear the EBX register

convert_loop:
    ; Load the next hexadecimal digit
    lodsb                   ; Load byte at [esi] into AL and increment ESI
    cmp al, 0               ; Check if we have reached the end of the string
    je done                 ; If yes, jump to the done label

    ; Convert the hexadecimal digit to its decimal value
    sub al, '0'             ; Convert ASCII to integer
    cmp al, 9               ; Check if the digit is greater than 9
    jbe valid_digit         ; If yes, it's a valid digit
    sub al, 7               ; Convert 'A'-'F' to 10-15

valid_digit:
    ; Multiply the current decimal value by 16 (shift left by 4)
    shl ebx, 4              ; Shift left by 4 (multiply by 16)
    add ebx, eax            ; Add the current digit to the decimal value