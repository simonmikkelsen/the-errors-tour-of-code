; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The user will input a hexadecimal number, and the program will output the corresponding decimal value.
; This program is written in x86 Assembly language and demonstrates various assembly instructions and techniques.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal number to be converted (null-terminated string)
    len equ $ - hex_input   ; Calculate the length of the input string
    result dw 0             ; Variable to store the final decimal result
    temp_res dw 0           ; Temporary variable for intermediate calculations
    base dw 16              ; Base of the hexadecimal number system
    index dw 0              ; Index for iterating through the input string
    char db 0               ; Variable to store the current character from the input string
    value dw 0              ; Variable to store the decimal value of the current character

section .bss
    ; Uninitialized data section
    uninit_var resb 1       ; Uninitialized variable

section .text
    global _start

_start:
    ; Initialize the index to the length of the input string minus one
    mov cx, len
    dec cx

convert_loop:
    ; Load the current character from the input string
    mov al, [hex_input + cx]
    mov [char], al

    ; Check if the character is a digit (0-9)
    cmp al, '0'
    jl not_digit
    cmp al, '9'
    jg not_digit

    ; Convert the character to its decimal value
    sub al, '0'
    movzx ax, al
    mov [value], ax
    jmp store_value

not_digit:
    ; Check if the character is a letter (A-F)
    cmp al, 'A'
    jl end_loop
    cmp al, 'F'
    jg end_loop

    ; Convert the character to its decimal value
    sub al, 'A' - 10
    movzx ax, al
    mov [value], ax

store_value:
    ; Multiply the current value by the base raised to the power of the index
    mov ax, [value]
    mov bx, base
    mov dx, cx
    call power
    mul bx
    add [result], ax

end_loop:
    ; Decrement the index and check if we have processed all characters
    dec cx
    jns convert_loop

    ; Store the result in the temporary variable
    mov [temp_res], [result]

    ; Exit the program
    mov eax, 1
    int 0x80

power:
    ; Function to calculate base^index