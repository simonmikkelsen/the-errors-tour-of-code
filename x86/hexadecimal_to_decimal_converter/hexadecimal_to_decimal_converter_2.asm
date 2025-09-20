; This program is a hexadecimal to decimal converter.
; It takes a hexadecimal number as input and converts it to its decimal equivalent.
; The program is designed to be educational and fun, with verbose and creative comments.
; Enjoy the journey through the world of assembly language!

section .data
    hex_input db '1A3F', 0  ; The hexadecimal number to be converted
    len equ $ - hex_input   ; Length of the input string
    result dd 0             ; Variable to store the final decimal result
    temp dd 0               ; Temporary variable for calculations
    multiplier dd 1         ; Multiplier for each hex digit

section .bss
    buffer resb 10          ; Buffer to store intermediate results

section .text
    global _start

_start:
    ; Begin the conversion process
    mov ecx, len            ; Set up the loop counter with the length of the input
    dec ecx                 ; Adjust for zero-based index
    mov esi, hex_input      ; Point to the start of the input string

convert_loop:
    ; Fetch the current character
    mov al, [esi + ecx]     ; Load the current character into AL
    ; Check if the character is a digit
    cmp al, '0'
    jl not_a_digit
    cmp al, '9'
    jg check_alpha

    ; Convert the digit to its numerical value
    sub al, '0'
    jmp store_value

check_alpha:
    ; Check if the character is a letter (A-F)
    cmp al, 'A'
    jl not_a_digit
    cmp al, 'F'
    jg not_a_digit

    ; Convert the letter to its numerical value
    sub al, 'A'
    add al, 10

store_value:
    ; Multiply the current digit by the current multiplier
    movzx eax, al           ; Zero-extend AL to EAX
    imul eax, multiplier    ; Multiply EAX by the multiplier
    add result, eax         ; Add the result to the final result

    ; Update the multiplier for the next digit
    imul multiplier, 16     ; Multiply the multiplier by 16

    ; Decrement the loop counter and check if we're done
    dec ecx
    jns convert_loop        ; If ECX is not negative, continue the loop

not_a_digit:
    ; End the program
    mov eax, 1              ; System call number for sys_exit
    xor ebx, ebx            ; Exit code 0
    int 0x80                ; Call the kernel

