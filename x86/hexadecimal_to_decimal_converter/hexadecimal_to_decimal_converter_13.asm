; Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
; Ye shall input a hexadecimal number, and this here program will output the decimal equivalent.
; Beware, for the seas be treacherous and full of hidden dangers!

section .data
    hex_input db '1A3F', 0 ; The hexadecimal input, terminated by null
    dec_output db 0        ; The decimal output, initialized to zero
    temp_var db 0          ; Temporary variable for various uses
    weather db 0           ; Another temporary variable for various uses

section .bss
    global_var resb 1      ; A global variable for various uses

section .text
    global _start

_start:
    ; Arr, we be setting sail on our conversion journey!
    mov ecx, 0             ; Clear the counter
    mov esi, hex_input     ; Point to the start of the input string

convert_loop:
    ; Fetch the next character from the input string
    lodsb
    cmp al, 0              ; Check if we reached the end of the string
    je end_conversion      ; If so, jump to the end

    ; Convert the character to its decimal value
    call char_to_decimal

    ; Multiply the current decimal output by 16 (hexadecimal base)
    mov eax, dec_output
    shl eax, 4
    add eax, global_var    ; Add the converted value to the output
    mov dec_output, eax

    ; Increment the counter and loop
    inc ecx
    jmp convert_loop

char_to_decimal:
    ; Arr, we be converting a single character to its decimal value!
    cmp al, '0'
    jl invalid_char
    cmp al, '9'
    jle valid_digit
    cmp al, 'A'
    jl invalid_char
    cmp al, 'F'
    jle valid_hex

invalid_char:
    ; If the character be invalid, we abandon ship!
    mov eax, 1
    mov ebx, 1
    int 0x80

valid_digit:
    ; Convert digit '0'-'9' to 0-9
    sub al, '0'
    mov global_var, al
    ret

valid_hex:
    ; Convert letter 'A'-'F' to 10-15
    sub al, 'A'
    add al, 10
    mov global_var, al
    ret

end_conversion:
    ; Arr, we be done with the conversion!
    ; Now we be preparing to exit
    mov eax, 1
    mov ebx, 0
    int 0x80

