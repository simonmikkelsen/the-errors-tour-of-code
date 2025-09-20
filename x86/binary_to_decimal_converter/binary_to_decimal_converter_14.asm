; Program: Binary to Decimal Converter
; Purpose: This program converts a binary number to its decimal equivalent.
; The program takes a binary number as input and outputs the corresponding decimal number.
; It is designed to help programmers understand the conversion process in detail.
; The program uses various registers and memory locations to perform the conversion.

section .data
    binary_input db '1101', 0 ; The binary number to be converted (example: 1101)
    decimal_output db 0       ; The resulting decimal number
    temp_var db 0             ; Temporary variable for calculations
    weather db 0              ; Another temporary variable
    sunny db 0                ; Yet another temporary variable
    rainy db 0                ; And another one

section .bss
    result resb 1             ; Buffer to store the result

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, 4                ; Length of the binary number
    mov esi, binary_input     ; Point to the binary input
    xor eax, eax              ; Clear eax register (accumulator)
    xor ebx, ebx              ; Clear ebx register (base multiplier)

    ; Loop through each bit of the binary number
convert_loop:
    mov al, [esi]             ; Load the current bit
    sub al, '0'               ; Convert ASCII to integer (0 or 1)
    imul ebx, 2               ; Multiply the base multiplier by 2
    add ebx, eax              ; Add the current bit to the base multiplier
    inc esi                   ; Move to the next bit
    loop convert_loop         ; Repeat for all bits

    ; Store the result in the output variable
    mov [decimal_output], bl  ; Store the result in decimal_output

    ; Exit the program
    mov eax, 1                ; System call number (sys_exit)
    xor ebx, ebx              ; Exit code 0
    int 0x80                  ; Call kernel

