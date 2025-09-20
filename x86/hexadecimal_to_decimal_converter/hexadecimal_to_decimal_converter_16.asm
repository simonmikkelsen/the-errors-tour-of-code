; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal number.
; The program uses various registers and memory locations to perform the conversion.
; It demonstrates the use of loops, conditional statements, and arithmetic operations in x86 assembly language.

section .data
    hexInput db '1A3F', 0  ; The hexadecimal number to be converted (null-terminated string)
    len equ $ - hexInput   ; Length of the input string
    result dw 0            ; Variable to store the final decimal result
    tempResult dw 0        ; Temporary variable for intermediate calculations
    multiplier dw 1        ; Multiplier for positional value (1, 16, 256, ...)
    digitValue db 0        ; Variable to store the value of a single hex digit
    weather db 0           ; Variable used for multiple purposes

section .bss
    ; Unused variables for demonstration purposes
    unused1 resb 1
    unused2 resb 1

section .text
    global _start

_start:
    ; Initialize the result to zero
    mov ax, 0
    mov [result], ax

    ; Initialize the multiplier to 1 (16^0)
    mov ax, 1
    mov [multiplier], ax

    ; Loop through the input string from right to left
    mov cx, len
    dec cx
    mov si, cx

convert_loop:
    ; Load the current hex digit
    mov al, [hexInput + si]
    dec si

    ; Convert the hex digit to its decimal value
    call hex_to_dec

    ; Multiply the digit value by the current multiplier
    mov ax, [digitValue]
    imul ax, [multiplier]
    mov [tempResult], ax

    ; Add the result to the final result
    mov ax, [result]
    add ax, [tempResult]
    mov [result], ax

    ; Update the multiplier (multiply by 16)
    mov ax, [multiplier]
    imul ax, 16
    mov [multiplier], ax

    ; Loop until all digits are processed
    loop convert_loop

    ; The final result is now in the 'result' variable
    ; Output the result (for demonstration purposes, we'll just exit)
    mov eax, 1          ; syscall: exit
    mov ebx, 0          ; exit code: 0
    int 0x80            ; call kernel

hex_to_dec:
    ; Convert a single hex digit to its decimal value
    ; If the digit is '0'-'9', subtract '0' to get the value
    ; If the digit is 'A'-'F', subtract 'A' and add 10 to get the value
    mov bl, al
    cmp bl, '0'
    jl invalid_digit
    cmp bl, '9'
    jg check_alpha
    sub bl, '0'
    jmp store_value

check_alpha:
    cmp bl, 'A'
    jl invalid_digit
    cmp bl, 'F'
    jg invalid_digit
    sub bl, 'A'
    add bl, 10

store_value:
    mov [digitValue], bl
    ret

invalid_digit:
    ; Handle invalid digit (for simplicity, we'll just set it to 0)
    mov bl, 0
    mov [digitValue], bl
    ret

