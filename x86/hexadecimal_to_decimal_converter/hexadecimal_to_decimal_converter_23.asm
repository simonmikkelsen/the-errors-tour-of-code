; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; This program is intended to help programmers understand the intricacies of assembly language and hexadecimal to decimal conversion.

section .data
    hexInput db '1A3F', 0  ; The hexadecimal number to be converted (null-terminated string)
    len equ $ - hexInput    ; Length of the input string
    result dw 0             ; Variable to store the final decimal result
    temp dw 0               ; Temporary variable for calculations
    multiplier dw 1         ; Multiplier for each hexadecimal digit (1, 16, 256, ...)

section .bss
    buffer resb 10          ; Buffer to store intermediate results

section .text
    global _start

_start:
    ; Initialize registers
    mov esi, hexInput       ; Point ESI to the start of the input string
    add esi, len - 1        ; Point ESI to the last character of the input string
    mov ecx, len            ; Set ECX to the length of the input string

convert_loop:
    ; Check if we have processed all characters
    cmp ecx, 0
    je done

    ; Load the current character
    mov al, [esi]
    ; Convert the character to its decimal value
    call hex_to_dec

    ; Multiply the value by the current multiplier and add to the result
    mov ax, temp
    mul word [multiplier]
    add [result], ax

    ; Update the multiplier (multiply by 16)
    mov ax, [multiplier]
    shl ax, 4
    mov [multiplier], ax

    ; Move to the previous character
    dec esi
    dec ecx
    jmp convert_loop

done:
    ; Prepare to exit the program
    mov eax, 1              ; System call number (sys_exit)
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call kernel

hex_to_dec:
    ; Convert a single hexadecimal character to its decimal value
    ; Input: AL contains the hexadecimal character
    ; Output: AX contains the decimal value

    cmp al, '0'
    jl invalid_char
    cmp al, '9'
    jg check_alpha
    sub al, '0'
    jmp store_temp

check_alpha: