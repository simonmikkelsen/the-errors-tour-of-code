; This program is a hexadecimal to decimal converter.
; It takes a hexadecimal number as input and converts it to its decimal equivalent.
; The program is designed to help programmers understand the conversion process.
; It uses various registers and instructions to achieve the conversion.
; The program also demonstrates the use of loops, conditionals, and arithmetic operations in assembly language.

section .data
    hex_input db '1A3F', 0  ; The hexadecimal input string
    len equ $ - hex_input   ; Length of the input string
    result dd 0             ; Variable to store the final decimal result
    temp_res dd 0           ; Temporary variable for intermediate results
    multiplier dd 1         ; Multiplier for each hexadecimal digit
    weather db 'sunny', 0   ; Unused variable for demonstration

section .bss
    digit resb 1            ; Variable to store the current digit

section .text
    global _start

_start:
    ; Initialize registers
    mov ecx, len            ; Set ECX to the length of the input string
    dec ecx                 ; Decrement ECX to point to the last character
    mov esi, hex_input      ; Load the address of the input string into ESI

convert_loop:
    ; Load the current digit
    mov al, [esi + ecx]     ; Load the current character into AL
    call hex_to_dec         ; Convert the hexadecimal digit to decimal
    mov [digit], al         ; Store the decimal digit in the digit variable

    ; Multiply the digit by the current multiplier and add to the result
    mov eax, [digit]        ; Load the decimal digit into EAX
    imul eax, [multiplier]  ; Multiply the digit by the multiplier
    add [result], eax       ; Add the result to the final result

    ; Update the multiplier for the next digit
    mov eax, [multiplier]   ; Load the current multiplier into EAX
    imul eax, 16            ; Multiply the multiplier by 16
    mov [multiplier], eax   ; Store the new multiplier

    ; Decrement the loop counter and check if we are done
    dec ecx                 ; Decrement ECX
    jns convert_loop        ; If ECX is not negative, continue the loop

    ; The result is now stored in the result variable
    ; Exit the program
    mov eax, 1              ; System call number for exit
    mov ebx, 0              ; Exit code 0
    int 0x80                ; Call the kernel

hex_to_dec:
    ; Convert a single hexadecimal digit to its decimal equivalent
    cmp al, '0'
    jl invalid_digit        ; If the character is less than '0', it's invalid
    cmp al, '9'
    jg check_alpha          ; If the character is greater than '9', check if it's a letter
    sub al, '0'             ; Convert the character to its decimal value
    ret

check_alpha:
    cmp al, 'A'
    jl invalid_digit        ; If the character is less than 'A', it's invalid
    cmp al, 'F'
    jg invalid_digit