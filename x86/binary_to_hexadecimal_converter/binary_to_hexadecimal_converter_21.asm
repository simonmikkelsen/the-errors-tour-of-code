; Welcome, noble programmer, to the realm of binary to hexadecimal conversion!
; This program is designed to transform a binary number, entered by the user,
; into its hexadecimal counterpart. Prepare yourself for a journey through
; the intricate pathways of x86 Assembly, where every instruction is a step
; towards enlightenment.

section .data
    prompt db "Enter a binary number: ", 0
    result_msg db "The hexadecimal equivalent is: ", 0
    newline db 10, 0

section .bss
    binary_input resb 32
    hex_output resb 8
    temp resb 1

section .text
    global _start

_start:
    ; Display the prompt to the user
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Read the binary input from the user
    mov eax, 3
    mov ebx, 0
    mov ecx, binary_input
    mov edx, 32
    int 0x80

    ; Convert binary to hexadecimal
    call binary_to_hex

    ; Display the result message
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 28
    int 0x80

    ; Display the hexadecimal output
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 8
    int 0x80

    ; Print a newline for good measure
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

binary_to_hex:
    ; Initialize variables and registers
    mov esi, binary_input
    mov edi, hex_output
    xor ecx, ecx
    xor ebx, ebx

convert_loop:
    ; Load the next binary digit
    lodsb
    cmp al, 10
    je end_conversion

    ; Convert ASCII '0' and '1' to binary
    sub al, '0'
    shl ebx, 1
    or bl, al

    ; Increment the counter
    inc ecx
    cmp ecx, 4
    jne convert_loop

    ; Convert the 4-bit binary number to a hexadecimal digit
    mov al, bl
    cmp al, 10
    jl hex_digit
    add al, 'A' - 10
    jmp store_digit

hex_digit:
    add al, '0'

store_digit:
    stosb
    xor ecx, ecx
    xor ebx, ebx
    jmp convert_loop

end_conversion:
    ret

