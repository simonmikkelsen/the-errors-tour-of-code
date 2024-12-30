; Program: Hexadecimal to Decimal Converter
; Purpose: This program converts a hexadecimal number input by the user into its decimal equivalent.
; The program demonstrates the process of parsing a hexadecimal string and performing the necessary
; arithmetic operations to convert it to a decimal number. It is designed to be educational and 
; informative, providing detailed comments to help the reader understand each step of the process.

section .data
    hexInput db "1A3Fh", 0 ; The hexadecimal input string
    len equ $ - hexInput   ; Length of the input string
    result dd 0            ; Variable to store the final decimal result
    tempResult dd 0        ; Temporary variable for intermediate calculations
    multiplier dd 1        ; Multiplier for positional value (1, 16, 256, ...)
    hexDigits db "0123456789ABCDEF" ; Hexadecimal digits for conversion

section .bss
    index resb 1           ; Index for looping through the input string
    digitValue resb 1      ; Variable to store the value of the current hex digit

section .text
    global _start

_start:
    ; Initialize the index to the last character of the input string (excluding 'h')
    mov byte [index], len - 2

convert_loop:
    ; Check if we have processed all characters
    cmp byte [index], -1
    jl done

    ; Get the current character from the input string
    movzx eax, byte [hexInput + index]
    ; Find the value of the current hex digit
    call get_digit_value
    ; Store the digit value in digitValue
    mov [digitValue], al

    ; Multiply the digit value by the current multiplier and add to the result
    movzx eax, byte [digitValue]
    imul eax, [multiplier]
    add [result], eax

    ; Update the multiplier for the next positional value (multiply by 16)
    imul dword [multiplier], 16

    ; Move to the previous character in the input string
    dec byte [index]
    jmp convert_loop

get_digit_value:
    ; This function finds the decimal value of a hexadecimal digit
    ; Input: AL contains the hexadecimal character
    ; Output: AL contains the decimal value of the hex digit
    mov ecx, 0
    find_digit:
        cmp al, [hexDigits + ecx]
        je found_digit
        inc ecx
        cmp ecx, 16
        je error
        jmp find_digit
    found_digit:
        mov al, cl
        ret
    error:
        mov al, 0xFF ; Return an error value (255) if the character is not a valid hex digit
        ret

done:
    ; The conversion is complete, and the result is stored in the 'result' variable
    ; Exit the program
    mov eax, 1          ; System call number (sys_exit)
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Call kernel

