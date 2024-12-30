; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input and outputs the corresponding decimal number.
; The program is written in x86 Assembly language and demonstrates various assembly instructions.
; The purpose of this program is to provide a detailed example of how to perform such a conversion.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal input string
    len equ $ - hex_input   ; Length of the input string
    result dd 0             ; Variable to store the final decimal result
    temp_result dd 0        ; Temporary variable for intermediate calculations
    multiplier dd 1         ; Multiplier for each hexadecimal digit
    ascii_offset db 48      ; ASCII offset for numeric characters
    ascii_offset_alpha db 55; ASCII offset for alphabetic characters

section .bss
    i resb 1                ; Loop counter
    j resb 1                ; Another loop counter
    k resb 1                ; Yet another loop counter

section .text
    global _start

_start:
    mov ecx, len            ; Set loop counter to the length of the input string
    dec ecx                 ; Adjust for zero-based index
    mov esi, hex_input      ; Point ESI to the start of the input string

convert_loop:
    movzx eax, byte [esi + ecx] ; Load the current character
    cmp eax, '0'
    jl invalid_input        ; If character is less than '0', it's invalid
    cmp eax, '9'
    jg check_alpha          ; If character is greater than '9', check if it's a letter
    sub eax, ascii_offset   ; Convert numeric character to its integer value
    jmp process_digit

check_alpha:
    cmp eax, 'A'
    jl invalid_input        ; If character is less than 'A', it's invalid
    cmp eax, 'F'
    jg invalid_input        ; If character is greater than 'F', it's invalid
    sub eax, ascii_offset_alpha ; Convert alphabetic character to its integer value

process_digit:
    imul eax, multiplier    ; Multiply the digit by its positional value
    add temp_result, eax    ; Add the result to the temporary result
    imul multiplier, 16     ; Update the multiplier for the next digit
    loop convert_loop       ; Decrement ECX and repeat the loop if ECX is not zero

    mov result, temp_result ; Store the final result in the result variable

print_result:
    ; Code to print the result would go here
    ; For simplicity, this part is omitted

exit:
    mov eax, 1              ; System call number for sys_exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call the kernel

invalid_input:
    ; Handle invalid input case
    ; For simplicity, this part is omitted
    jmp exit

