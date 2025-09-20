; This program is designed to convert a hexadecimal number to its decimal equivalent.
; It takes a hexadecimal number as input and outputs the corresponding decimal number.
; The program demonstrates the use of loops, conditional statements, and arithmetic operations in x86 Assembly.
; It is a great exercise for understanding low-level programming and debugging skills.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal number to be converted (null-terminated string)
    len equ $ - hex_input   ; Length of the input string
    result dw 0             ; Variable to store the final decimal result
    temp dw 0               ; Temporary variable for calculations
    base dw 16              ; Base of the hexadecimal number system
    index dw 0              ; Index for iterating through the input string
    digit dw 0              ; Variable to store the current digit value
    power dw 1              ; Variable to store the current power of 16

section .bss
    ; Unused variables for demonstration purposes
    unused1 resb 1
    unused2 resb 1

section .text
    global _start

_start:
    ; Initialize the index to the length of the input string minus one
    mov cx, len
    dec cx
    mov index, cx

convert_loop:
    ; Check if the index is negative (end of the string)
    cmp index, -1
    jl end_conversion

    ; Get the current character from the input string
    mov al, [hex_input + index]
    ; Convert the character to its corresponding digit value
    call char_to_digit
    ; Multiply the digit value by the current power of 16 and add to the result
    mov ax, digit
    mul power
    add result, ax

    ; Update the power of 16 for the next iteration
    mov ax, power
    mul base
    mov power, ax

    ; Decrement the index and repeat the loop
    dec index
    jmp convert_loop

end_conversion:
    ; The result now contains the decimal equivalent of the hexadecimal input
    ; Exit the program
    mov eax, 1          ; System call number (sys_exit)
    int 0x80            ; Call kernel

char_to_digit:
    ; Convert a hexadecimal character to its corresponding digit value
    ; Input: AL (character)
    ; Output: AX (digit value)
    cmp al, '0'
    jl invalid_char
    cmp al, '9'
    jg check_alpha
    sub al, '0'
    jmp store_digit

check_alpha:
    cmp al, 'A'
    jl invalid_char
    cmp al, 'F'
    jg invalid_char
    sub al, 'A'
    add al, 10

store_digit:
    mov digit, ax
    ret

invalid_char:
    ; Handle invalid character (not a valid hexadecimal digit)
    ; For simplicity, we treat invalid characters as zero
    mov digit, 0
    ret

