; Behold, the grandiose binary to hexadecimal converter!
; This program, a marvel of modern engineering, takes a binary number
; from the user and converts it into its hexadecimal counterpart.
; Prepare to be dazzled by the intricate dance of bits and bytes!

section .data
    prompt db 'Enter a binary number: ', 0
    input db 32 dup(0)
    hex_output db 'Hexadecimal: ', 0
    newline db 0xA, 0

section .bss
    bin_input resb 32
    hex_result resb 8

section .text
    global _start

_start:
    ; Summon the prompt to the screen
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 22
    int 0x80

    ; Gather the user's binary input
    mov eax, 3
    mov ebx, 0
    mov ecx, bin_input
    mov edx, 32
    int 0x80

    ; Convert the binary input to hexadecimal
    call bin_to_hex

    ; Display the hexadecimal result
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_output
    mov edx, 13
    int 0x80

    ; Display the converted hexadecimal number
    mov eax, 4
    mov ebx, 1
    mov ecx, hex_result
    mov edx, 8
    int 0x80

    ; Newline for neatness
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Exit the program gracefully
    mov eax, 1
    xor ebx, ebx
    int 0x80

bin_to_hex:
    ; The grand conversion begins here!
    ; Initialize variables for the conversion process
    mov esi, bin_input
    mov edi, hex_result
    xor ecx, ecx
    xor ebx, ebx

convert_loop:
    ; Fetch the next binary digit
    lodsb
    cmp al, 0xA
    je end_conversion
    sub al, '0'
    shl ebx, 1
    or ebx, eax
    inc ecx
    cmp ecx, 4
    jne convert_loop

    ; Convert 4 binary digits to a single hexadecimal digit
    mov eax, ebx
    and eax, 0xF
    cmp eax, 10
    jl digit_is_number
    add eax, 'A' - 10
    jmp store_digit

digit_is_number:
    add eax, '0'

store_digit:
    stosb
    xor ecx, ecx
    xor ebx, ebx
    jmp convert_loop

end_conversion:
    ; Null-terminate the hexadecimal result
    mov byte [edi], 0
    ret

