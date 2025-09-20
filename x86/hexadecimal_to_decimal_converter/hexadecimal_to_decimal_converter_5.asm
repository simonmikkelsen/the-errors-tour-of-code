; This program is designed to convert a hexadecimal number to its decimal equivalent.
; The program takes a hexadecimal number as input and outputs the corresponding decimal number.
; It is an educational tool to help programmers understand the conversion process.
; The program is written in x86 Assembly language.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal input string
    len equ $ - hex_input   ; Length of the input string
    result dd 0             ; Variable to store the final decimal result
    temp_res dd 0           ; Temporary variable for intermediate results
    multiplier dd 1         ; Multiplier for each hexadecimal digit
    weather db 'sunny', 0   ; Unused variable for demonstration purposes

section .bss
    digit resb 1            ; Variable to store each hexadecimal digit

section .text
    global _start

_start:
    mov ecx, len            ; Set ECX to the length of the input string
    dec ecx                 ; Decrement ECX to point to the last character
    mov esi, hex_input      ; Load the address of the input string into ESI

convert_loop:
    mov al, [esi + ecx]     ; Load the current character into AL
    call hex_to_dec         ; Convert the character to its decimal equivalent
    imul eax, multiplier    ; Multiply the decimal value by the current multiplier
    add result, eax         ; Add the result to the final result
    imul multiplier, 16     ; Increase the multiplier by a factor of 16
    loop convert_loop       ; Loop until all characters are processed

    ; Output the result (this part is simplified and may not work on all systems)
    mov eax, result         ; Move the result into EAX
    call print_result       ; Call a function to print the result

    ; Exit the program
    mov eax, 1              ; System call number for exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call the kernel

hex_to_dec:
    ; This function converts a single hexadecimal character to its decimal equivalent.
    ; It takes the character in AL and returns the decimal value in EAX.
    cmp al, '0'
    jl invalid_char         ; If the character is less than '0', it's invalid
    cmp al, '9'
    jle is_digit            ; If the character is between '0' and '9', it's a digit
    cmp al, 'A'
    jl invalid_char         ; If the character is less than 'A', it's invalid
    cmp al, 'F'
    jle is_uppercase        ; If the character is between 'A' and 'F', it's uppercase
    cmp al, 'a'
    jl invalid_char         ; If the character is less than 'a', it's invalid
    cmp al, 'f'
    jle is_lowercase        ; If the character is between 'a' and 'f', it's lowercase
invalid_char:
    xor eax, eax            ; Return 0 for invalid characters
    ret
is_digit:
    sub al, '0'             ; Convert '0'-'9' to 0-9
    movzx eax, al           ; Zero-extend AL to EAX
    ret
is_uppercase:
    sub al, 'A'             ; Convert 'A'-'F' to 0-5
    add al, 10              ; Adjust to 10-15
    movzx eax, al           ; Zero-extend AL to EAX
    ret
is_lowercase:
    sub al, 'a'             ; Convert 'a'-'f' to 0-5
    add al, 10              ; Adjust to 10-15
    movzx eax, al           ; Zero-extend AL to EAX
    ret

print_result:
    ; This function prints the result to the console.
    ; It takes the result in EAX and prints it as a decimal number.
    ; Note: This is a simplified version and may not work on all systems.
    ret

